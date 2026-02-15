import { NextRequest } from 'next/server'
import { getCurrentUser } from '@/lib/middleware/auth-middleware'
import { apiError } from '@/lib/api-response'
import { proxyAIService } from '@/lib/services/ai-service'
import {
  calculateCredits,
  estimateInputTokens,
  getConfigParams,
} from '@/lib/services/token-calculator'
import {
  consumeCreditsWithTransaction,
  hasEnoughCredits,
} from '@/lib/services/credit-service'

export const dynamic = 'force-dynamic'

export async function POST(request: NextRequest) {
  try {
    const user = await getCurrentUser(request)
    const body = await request.json()
    const {
      prompt,
      system_prompt,
      llm_config_id,
      messages,
    } = body as {
      prompt?: string
      system_prompt?: string
      llm_config_id?: number
      messages?: Array<{ role: string; content: string }>
    }

    // Build the user prompt from messages or the direct prompt field
    let userPrompt = prompt || ''
    let systemPrompt = system_prompt || ''

    if (messages && messages.length > 0) {
      const systemMessages = messages.filter((m) => m.role === 'system')
      const userMessages = messages.filter((m) => m.role !== 'system')
      if (systemMessages.length > 0) {
        systemPrompt = systemMessages.map((m) => m.content).join('\n')
      }
      if (userMessages.length > 0) {
        userPrompt = userMessages.map((m) => `${m.role}: ${m.content}`).join('\n')
      }
    }

    if (!userPrompt) {
      return apiError(400, '缺少 prompt 或 messages')
    }

    // Pre-check credits
    const inputText = (systemPrompt || '') + '\n' + userPrompt
    const estInputTokens = estimateInputTokens(inputText)
    const { normalizationFactor, creditRate } = await getConfigParams(llm_config_id)
    const estimatedCredits = calculateCredits(estInputTokens, 800, normalizationFactor, creditRate)

    if (!(await hasEnoughCredits(user.id, estimatedCredits))) {
      return apiError(403, '积分不足，请充值后再试')
    }

    const encoder = new TextEncoder()
    let totalInputTokens = 0
    let totalOutputTokens = 0

    const stream = new ReadableStream({
      async start(controller) {
        try {
          for await (const event of proxyAIService.streamTextFromProxy(
            userPrompt,
            systemPrompt || undefined,
            llm_config_id,
          )) {
            if (event.type === 'chunk') {
              controller.enqueue(
                encoder.encode(`data: ${JSON.stringify({ event: 'chunk', data: { content: event.content } })}\n\n`),
              )
            } else if (event.type === 'reasoning') {
              controller.enqueue(
                encoder.encode(`data: ${JSON.stringify({ event: 'reasoning', data: { content: event.content } })}\n\n`),
              )
            } else if (event.type === 'usage') {
              totalInputTokens = event.inputTokens
              totalOutputTokens = event.outputTokens
            }
          }

          // Deduct credits after streaming
          const { normalizationFactor: nf, creditRate: cr, configId } =
            await getConfigParams(llm_config_id)
          const creditsConsumed = calculateCredits(totalInputTokens, totalOutputTokens, nf, cr)

          await consumeCreditsWithTransaction(
            user.id,
            creditsConsumed,
            'DESKTOP_ASSISTANT_LLM',
            configId ? BigInt(configId) : undefined,
            totalInputTokens,
            totalOutputTokens,
            cr,
            nf,
            '桌面端助手对话',
          )

          controller.enqueue(
            encoder.encode(
              `data: ${JSON.stringify({
                event: 'complete',
                data: {
                  status: 'done',
                  usage: {
                    inputTokens: totalInputTokens,
                    outputTokens: totalOutputTokens,
                    creditsConsumed,
                  },
                },
              })}\n\n`,
            ),
          )
        } catch (error) {
          controller.enqueue(
            encoder.encode(
              `data: ${JSON.stringify({
                event: 'error',
                data: { error: String(error), code: 'STREAM_ERROR' },
              })}\n\n`,
            ),
          )
        } finally {
          controller.close()
        }
      },
    })

    return new Response(stream, {
      headers: {
        'Content-Type': 'text/event-stream',
        'Cache-Control': 'no-cache',
        Connection: 'keep-alive',
      },
    })
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `桌面端助手请求失败: ${String(error)}`)
  }
}
