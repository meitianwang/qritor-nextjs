/**
 * 透明 Anthropic API 代理
 *
 * 职责：鉴权 + 计费。请求体原封不动转发给 Anthropic，响应流原封不动回传。
 * 从流中旁路提取 usage（message_start / message_delta）做计费。
 */

import { NextRequest, NextResponse } from 'next/server'
import { getCurrentUser } from '@/lib/middleware/auth-middleware'
import {
  calculateCredits,
  getConfigParamsByModelName,
} from '@/lib/services/token-calculator'
import { hasEnoughCredits } from '@/lib/services/credit-service'
import { deductLlmCredits } from '@/lib/services/llm-credit-settle'

export const dynamic = 'force-dynamic'

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

const ANTHROPIC_BASE =
  (process.env.ANTHROPIC_BASE_URL ?? 'https://api.anthropic.com').replace(
    /\/+$/,
    '',
  )

/** Headers to forward from Anthropic error responses to the client. */
const FORWARD_RESPONSE_HEADERS = [
  'content-type',
  'request-id',
  'retry-after',
  'x-ratelimit-limit-requests',
  'x-ratelimit-limit-tokens',
  'x-ratelimit-remaining-requests',
  'x-ratelimit-remaining-tokens',
  'x-ratelimit-reset-requests',
  'x-ratelimit-reset-tokens',
]

/**
 * Collect all `anthropic-*` headers from the incoming request to forward.
 */
function forwardAnthropicHeaders(
  headers: Headers,
): Record<string, string> {
  const result: Record<string, string> = {}
  for (const [key, value] of headers.entries()) {
    if (key.startsWith('anthropic-')) {
      result[key] = value
    }
  }
  return result
}

/**
 * Pick specific headers from a Response for forwarding.
 */
function pickResponseHeaders(
  source: Headers,
  names: string[],
): Headers {
  const result = new Headers()
  for (const name of names) {
    const val = source.get(name)
    if (val) result.set(name, val)
  }
  return result
}

/**
 * Wrap the upstream response body so every chunk is forwarded to the client
 * immediately while a side-channel parser extracts token usage from SSE
 * `message_start` and `message_delta` events.
 *
 * Billing is fire-and-forget in flush() — the stream completes regardless
 * of whether billing succeeds. This is acceptable because:
 * 1. deductLlmCredits has its own debt-recording fallback
 * 2. Blocking the stream on billing would add latency to the last chunk
 */
function createBillingTeeStream(
  upstream: ReadableStream<Uint8Array>,
  onComplete: (usage: { inputTokens: number; outputTokens: number }) => void,
): ReadableStream<Uint8Array> {
  let sseBuffer = ''
  let inputTokens = 0
  let outputTokens = 0
  const decoder = new TextDecoder()

  return upstream.pipeThrough(
    new TransformStream<Uint8Array, Uint8Array>({
      transform(chunk, controller) {
        // Forward immediately — zero added latency
        controller.enqueue(chunk)

        // Side-channel: accumulate SSE text and parse events
        sseBuffer += decoder.decode(chunk, { stream: true })
        const parts = sseBuffer.split('\n\n')
        // Keep the last incomplete fragment
        sseBuffer = parts.pop() || ''

        for (const part of parts) {
          let eventType = ''
          let dataStr = ''
          for (const line of part.split('\n')) {
            if (line.startsWith('event: ')) eventType = line.slice(7).trim()
            if (line.startsWith('data: ')) dataStr = line.slice(6).trim()
          }
          if (!dataStr || dataStr === '[DONE]') continue
          try {
            const data = JSON.parse(dataStr)
            if (eventType === 'message_start' && data.message?.usage) {
              inputTokens = data.message.usage.input_tokens ?? 0
            }
            if (eventType === 'message_delta' && data.usage) {
              outputTokens = data.usage.output_tokens ?? 0
            }
          } catch {
            // Malformed JSON in SSE event — skip (non-fatal)
          }
        }
      },
      flush() {
        // Fire-and-forget: billing runs asynchronously after stream closes.
        // deductLlmCredits has its own debt-recording fallback on failure.
        onComplete({ inputTokens, outputTokens })
      },
    }),
  )
}

// ---------------------------------------------------------------------------
// Route handler
// ---------------------------------------------------------------------------

export async function POST(request: NextRequest): Promise<Response> {
  // 1. Auth
  let user
  try {
    user = await getCurrentUser(request)
  } catch (err) {
    if (err instanceof Response) return err
    return NextResponse.json(
      { error: { type: 'authentication_error', message: '登录已过期，请重新登录' } },
      { status: 401 },
    )
  }

  // 2. Read raw body (preserve bytes for forwarding)
  const rawBody = await request.arrayBuffer()

  // 3. Extract model name from request body for billing lookup
  let modelName: string
  let parsedMaxTokens: number | undefined
  try {
    const parsed = JSON.parse(new TextDecoder().decode(rawBody))
    modelName = parsed.model
    parsedMaxTokens = typeof parsed.max_tokens === 'number' ? parsed.max_tokens : undefined
    if (!modelName) {
      return NextResponse.json(
        { error: { type: 'invalid_request_error', message: 'Missing model field' } },
        { status: 400 },
      )
    }
  } catch {
    return NextResponse.json(
      { error: { type: 'invalid_request_error', message: 'Invalid JSON body' } },
      { status: 400 },
    )
  }

  // 4. Billing config + tier lookup (single DB query)
  const billingConfig = await getConfigParamsByModelName(modelName)

  // 5. Subscription tier check
  if (billingConfig.modelTier && billingConfig.modelTier !== 'economy') {
    try {
      const { canUserAccessModelTier } = await import(
        '@/lib/services/subscription-service'
      )
      if (!(await canUserAccessModelTier(user.id, billingConfig.modelTier))) {
        return NextResponse.json(
          { error: { type: 'permission_error', message: '当前订阅计划不支持使用该模型，请升级订阅' } },
          { status: 403 },
        )
      }
    } catch (err) {
      console.error('[Anthropic Proxy] Tier check failed:', err)
      // Non-fatal for economy tier models; block unknown tiers on failure
      return NextResponse.json(
        { error: { type: 'api_error', message: '订阅验证暂时不可用，请稍后重试' } },
        { status: 503 },
      )
    }
  }

  // 6. Pre-flight credit check (rough estimate)
  const estimatedInputTokens = Math.ceil(rawBody.byteLength / 4)
  const estimatedOutputTokens = Math.min(parsedMaxTokens ?? 800, 8000)
  const estimatedCredits = calculateCredits(
    estimatedInputTokens,
    estimatedOutputTokens,
    billingConfig.inputPricePerM,
    billingConfig.outputPricePerM,
  )
  if (!(await hasEnoughCredits(user.id, estimatedCredits))) {
    return NextResponse.json(
      { error: { type: 'permission_error', message: '积分不足，请充值后再试' } },
      { status: 403 },
    )
  }

  // 7. Forward to Anthropic API
  const anthropicHeaders: Record<string, string> = {
    'content-type': 'application/json',
    'x-api-key': process.env.ANTHROPIC_API_KEY ?? '',
    // Forward all anthropic-* headers (version, beta, etc.) from client
    ...forwardAnthropicHeaders(request.headers),
  }
  // Ensure anthropic-version is always present
  if (!anthropicHeaders['anthropic-version']) {
    anthropicHeaders['anthropic-version'] = '2023-06-01'
  }

  let anthropicResponse: Response
  try {
    anthropicResponse = await fetch(`${ANTHROPIC_BASE}/v1/messages`, {
      method: 'POST',
      headers: anthropicHeaders,
      body: rawBody,
    })
  } catch (err) {
    console.error('[Anthropic Proxy] Fetch error:', err)
    return NextResponse.json(
      { error: { type: 'api_error', message: 'Failed to reach Anthropic API' } },
      { status: 502 },
    )
  }

  // 8. Non-200: forward error response with important headers
  if (!anthropicResponse.ok) {
    return new Response(anthropicResponse.body, {
      status: anthropicResponse.status,
      headers: pickResponseHeaders(
        anthropicResponse.headers,
        FORWARD_RESPONSE_HEADERS,
      ),
    })
  }

  // 9. 200 streaming: tee for billing, forward to client
  const upstreamBody = anthropicResponse.body
  if (!upstreamBody) {
    return NextResponse.json(
      { error: { type: 'api_error', message: 'Empty response from Anthropic' } },
      { status: 502 },
    )
  }

  const userId = user.id
  const configId = billingConfig.configId ?? undefined

  const billingStream = createBillingTeeStream(
    upstreamBody,
    ({ inputTokens, outputTokens }) => {
      if (inputTokens > 0 || outputTokens > 0) {
        deductLlmCredits({
          userId,
          configId,
          inputTokens,
          outputTokens,
          logTag: 'AnthropicProxy',
        }).catch((err) => {
          console.error('[Anthropic Proxy] Billing error:', err)
        })
      }
    },
  )

  return new Response(billingStream, {
    status: 200,
    headers: pickResponseHeaders(
      anthropicResponse.headers,
      FORWARD_RESPONSE_HEADERS,
    ),
  })
}
