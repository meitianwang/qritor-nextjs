import {
  GoogleGenAI,
  ApiError as GoogleApiError,
  type Content,
  type Part,
  type FunctionDeclaration,
  type GenerateContentResponseUsageMetadata,
} from '@google/genai'
import { AI_ERROR_CODE, type ClassifiedAIError } from './ai-error-codes'

// ---------------------------------------------------------------------------
// Client singleton
// ---------------------------------------------------------------------------

const googleGenAI = new GoogleGenAI({
  apiKey: process.env.GOOGLE_GENERATIVE_AI_API_KEY ?? '',
  httpOptions: {
    baseUrl: process.env.GOOGLE_GENAI_BASE_URL ?? '',
  },
})

// ---------------------------------------------------------------------------
// Internal stream event types
// ---------------------------------------------------------------------------

export interface GoogleTextDelta {
  type: 'text-delta'
  text: string
}

export interface GoogleReasoningDelta {
  type: 'reasoning-delta'
  text: string
  thoughtSignature?: string
}

export interface GoogleToolCall {
  type: 'tool-call'
  toolCallId: string
  toolName: string
  args: Record<string, unknown>
  thoughtSignature?: string
}

export interface GoogleFinish {
  type: 'finish'
  finishReason: string
  usage: {
    inputTokens: number
    outputTokens: number
    reasoningTokens: number
  }
}

export interface GoogleStreamError {
  type: 'error'
  error: unknown
}

export type GoogleStreamEvent =
  | GoogleTextDelta
  | GoogleReasoningDelta
  | GoogleToolCall
  | GoogleFinish
  | GoogleStreamError

// ---------------------------------------------------------------------------
// Message format converter: AI SDK CoreMessage[] → Google Content[]
// ---------------------------------------------------------------------------

interface ConvertResult {
  contents: Content[]
  systemInstruction?: string
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any
export function convertMessagesToGoogleContents(messages: any[]): ConvertResult {
  let systemInstruction: string | undefined
  const contents: Content[] = []

  for (const msg of messages) {
    if (msg.role === 'system') {
      systemInstruction = typeof msg.content === 'string'
        ? msg.content
        : msg.content?.map((p: { text?: string }) => p.text ?? '').join('\n')
      continue
    }

    if (msg.role === 'tool') {
      // AI SDK tool role → Google user role with functionResponse parts
      const parts = convertToolResultParts(msg.content)
      // Merge into last user message or create new one
      const last = contents[contents.length - 1]
      if (last?.role === 'user') {
        last.parts = [...(last.parts || []), ...parts]
      } else {
        contents.push({ role: 'user', parts })
      }
      continue
    }

    const googleRole = msg.role === 'assistant' ? 'model' : 'user'
    const parts = convertContentParts(msg.content, msg.providerOptions)
    contents.push({ role: googleRole, parts })
  }

  return { contents, systemInstruction }
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any
function convertContentParts(content: any, msgProviderOptions?: any): Part[] {
  if (typeof content === 'string') {
    return content ? [{ text: content }] : [{ text: ' ' }]
  }
  if (!Array.isArray(content)) return [{ text: ' ' }]

  const parts: Part[] = []
  for (const part of content) {
    switch (part.type) {
      case 'text':
        if (part.text) parts.push({ text: part.text })
        break

      case 'reasoning': {
        const sig = part.providerMetadata?.google?.thoughtSignature
          ?? msgProviderOptions?.google?.thoughtSignature
          ?? undefined
        if (part.text) {
          parts.push({
            thought: true,
            text: part.text,
            ...(sig ? { thoughtSignature: sig } : {}),
          })
        }
        break
      }

      case 'tool-call': {
        const sig = part.providerOptions?.google?.thoughtSignature
          ?? msgProviderOptions?.google?.thoughtSignature
          ?? undefined
        parts.push({
          functionCall: {
            name: part.toolName,
            args: part.input ?? part.args ?? {},
          },
          ...(sig ? { thoughtSignature: sig } : {}),
        })
        break
      }

      case 'tool-result': {
        const responseData = typeof part.result === 'string'
          ? { result: part.result }
          : (part.result ?? { result: '' })
        parts.push({
          functionResponse: {
            name: part.toolName,
            id: part.toolCallId,
            response: responseData,
          },
        })
        break
      }

      default:
        // image, file, etc. — pass text if available
        if (part.text) parts.push({ text: part.text })
        break
    }
  }

  return parts.length > 0 ? parts : [{ text: ' ' }]
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any
function convertToolResultParts(content: any): Part[] {
  if (!Array.isArray(content)) {
    return [{ functionResponse: { name: 'unknown', response: { result: String(content) } } }]
  }

  return content
    .filter((p: { type: string }) => p.type === 'tool-result')
    .map((p: { toolName: string; toolCallId?: string; result?: unknown }) => ({
      functionResponse: {
        name: p.toolName,
        id: p.toolCallId,
        response: (typeof p.result === 'string'
          ? { result: p.result }
          : (p.result ?? { result: '' })) as Record<string, unknown>,
      },
    }))
}

// ---------------------------------------------------------------------------
// Tool definition converter: AI SDK tools → Google FunctionDeclaration[]
// ---------------------------------------------------------------------------

export function convertToolsToGoogleFormat(
  tools: Record<string, { description?: string; inputSchema?: Record<string, unknown> }>,
): FunctionDeclaration[] {
  return Object.entries(tools).map(([name, def]) => ({
    name,
    ...(def.description ? { description: def.description } : {}),
    ...(def.inputSchema ? { parametersJsonSchema: def.inputSchema } : {}),
  }))
}

// ---------------------------------------------------------------------------
// Streaming helper
// ---------------------------------------------------------------------------

export interface GoogleThinkingConfig {
  includeThoughts?: boolean
  thinkingBudget?: number
  thinkingLevel?: string
}

export interface StreamGoogleOptions {
  modelName: string
  contents: Content[]
  systemInstruction?: string
  tools?: FunctionDeclaration[]
  temperature?: number
  maxTokens?: number
  thinkingConfig?: GoogleThinkingConfig
}

export async function* streamGoogleContent(
  opts: StreamGoogleOptions,
): AsyncGenerator<GoogleStreamEvent> {
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const config: Record<string, any> = {
    ...(opts.systemInstruction ? { systemInstruction: opts.systemInstruction } : {}),
    ...(opts.temperature != null ? { temperature: opts.temperature } : {}),
    ...(opts.maxTokens ? { maxOutputTokens: opts.maxTokens } : {}),
    ...(opts.thinkingConfig ? { thinkingConfig: opts.thinkingConfig } : {}),
  }

  if (opts.tools?.length) {
    config.tools = [{ functionDeclarations: opts.tools }]
  }

  let lastUsage: GenerateContentResponseUsageMetadata | undefined
  let hasToolCalls = false
  let finishReason = 'STOP'

  console.log(
    `[Google GenAI] Stream: model=${opts.modelName}, contents=${opts.contents.length} msgs, tools=${opts.tools?.length ?? 0}`,
  )

  try {
    const result = await googleGenAI.models.generateContentStream({
      model: opts.modelName,
      contents: opts.contents,
      config,
    })

    for await (const chunk of result) {
      const candidate = chunk?.candidates?.[0]
      const parts = candidate?.content?.parts || []

      for (const part of parts) {
        if (part.thought && part.text) {
          yield {
            type: 'reasoning-delta',
            text: part.text,
            thoughtSignature: part.thoughtSignature,
          }
        } else if (part.text) {
          yield { type: 'text-delta', text: part.text }
        }

        if (part.functionCall?.name) {
          hasToolCalls = true
          yield {
            type: 'tool-call',
            toolCallId: part.functionCall.id ?? crypto.randomUUID(),
            toolName: part.functionCall.name,
            args: part.functionCall.args ?? {},
            thoughtSignature: part.thoughtSignature,
          }
        }
      }

      if (candidate?.finishReason) {
        finishReason = candidate.finishReason
      }
      if (chunk.usageMetadata) {
        lastUsage = chunk.usageMetadata
      }
    }

    yield {
      type: 'finish',
      finishReason: mapFinishReason(finishReason, hasToolCalls),
      usage: {
        inputTokens: lastUsage?.promptTokenCount ?? 0,
        outputTokens: lastUsage?.candidatesTokenCount ?? 0,
        reasoningTokens: lastUsage?.thoughtsTokenCount ?? 0,
      },
    }
  } catch (error) {
    console.error(`[Google GenAI] Stream error for model=${opts.modelName}:`, error)
    yield { type: 'error', error }
  }
}

// ---------------------------------------------------------------------------
// Non-streaming helper
// ---------------------------------------------------------------------------

export interface GenerateGoogleOptions {
  modelName: string
  contents: Content[]
  systemInstruction?: string
  maxTokens?: number
  thinkingConfig?: GoogleThinkingConfig
}

export async function generateGoogleContent(
  opts: GenerateGoogleOptions,
): Promise<{ text: string; usage: { inputTokens: number; outputTokens: number } }> {
  const config = {
    ...(opts.systemInstruction ? { systemInstruction: opts.systemInstruction } : {}),
    ...(opts.maxTokens ? { maxOutputTokens: opts.maxTokens } : {}),
    ...(opts.thinkingConfig ? { thinkingConfig: opts.thinkingConfig } : {}),
  }

  const response = await googleGenAI.models.generateContent({
    model: opts.modelName,
    contents: opts.contents,
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    config: config as any,
  })

  return {
    text: response.text ?? '',
    usage: {
      inputTokens: response.usageMetadata?.promptTokenCount ?? 0,
      outputTokens: response.usageMetadata?.candidatesTokenCount ?? 0,
    },
  }
}

// ---------------------------------------------------------------------------
// Error classification
// ---------------------------------------------------------------------------

export function classifyGoogleError(error: unknown): ClassifiedAIError {
  if (error instanceof GoogleApiError) {
    // SDK 把代理/API 返回的 JSON body 塞进 message，尝试提取人类可读信息
    const friendlyMessage = extractErrorMessage(error.message)

    if (error.status === 401) {
      return {
        code: AI_ERROR_CODE.PROVIDER_AUTH_FAILED,
        message: friendlyMessage ?? `Google AI authentication failed (${error.status})`,
        retryable: false,
      }
    }
    if (error.status === 403) {
      const msg = error.message.toLowerCase()
      if (msg.includes('safety') || msg.includes('filter') || msg.includes('blocked')) {
        return {
          code: AI_ERROR_CODE.CONTENT_FILTERED,
          message: friendlyMessage ?? 'Content was filtered by safety policy',
          retryable: false,
        }
      }
      return {
        code: AI_ERROR_CODE.PROVIDER_AUTH_FAILED,
        message: friendlyMessage ?? `Google AI access denied (${error.status})`,
        retryable: false,
      }
    }
    if (error.status === 429) {
      return {
        code: AI_ERROR_CODE.RATE_LIMITED,
        message: friendlyMessage ?? 'Rate limited by Google AI',
        retryable: true,
      }
    }
    if (error.status === 400) {
      const msg = error.message.toLowerCase()
      if (msg.includes('token') && (msg.includes('too long') || msg.includes('exceed') || msg.includes('limit'))) {
        return {
          code: AI_ERROR_CODE.CONTEXT_LENGTH_EXCEEDED,
          message: friendlyMessage ?? 'Context length exceeded',
          retryable: false,
        }
      }
    }
    if (error.status >= 500) {
      return {
        code: AI_ERROR_CODE.PROVIDER_SERVER_ERROR,
        message: friendlyMessage ?? `Google AI server error (${error.status})`,
        retryable: true,
      }
    }
  }

  // Fallback: generic Error
  if (error instanceof Error) {
    const msg = error.message.toLowerCase()
    if (msg.includes('timeout') || msg.includes('timed out')) {
      return {
        code: AI_ERROR_CODE.REQUEST_TIMEOUT,
        message: 'Request timed out',
        retryable: true,
      }
    }
    if (msg.includes('fetch failed') || msg.includes('econnrefused') || msg.includes('econnreset')) {
      return {
        code: AI_ERROR_CODE.NETWORK_ERROR,
        message: 'Network connection failed',
        retryable: true,
      }
    }
  }

  return {
    code: AI_ERROR_CODE.UNKNOWN_ERROR,
    message: String(error),
    retryable: false,
  }
}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

/**
 * 从 SDK ApiError.message（JSON 字符串）中提取人类可读的错误信息。
 * 代理返回格式: {"error":"...","message":"中文提示..."}
 * Google API 格式: {"error":{"message":"...","code":503,"status":"UNAVAILABLE"}}
 */
function extractErrorMessage(raw: string): string | null {
  try {
    const parsed = JSON.parse(raw)
    // 代理自定义格式: { message: "中文提示" }
    if (typeof parsed.message === 'string' && parsed.message) {
      return parsed.message
    }
    // Google 标准格式: { error: { message: "..." } }
    if (parsed.error?.message && typeof parsed.error.message === 'string') {
      return parsed.error.message
    }
  } catch {
    // message 不是 JSON，忽略
  }
  return null
}

function mapFinishReason(googleReason: string, hasToolCalls: boolean): string {
  if (hasToolCalls) return 'tool-calls'
  switch (googleReason) {
    case 'STOP': return 'stop'
    case 'MAX_TOKENS': return 'length'
    case 'SAFETY': return 'content-filter'
    case 'RECITATION': return 'content-filter'
    default: return 'stop'
  }
}
