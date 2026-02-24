/**
 * OpenAI 平台流式处理 handler
 *
 * openai 官方 SDK (Responses API) + createUIMessageStream SSE 输出。
 */

import { createUIMessageStream, createUIMessageStreamResponse } from 'ai'
import { generateId } from '@ai-sdk/provider-utils'
import { normalizeToolName } from './llm-message-preprocessor'
import { deductLlmCredits } from './llm-credit-settle'

// ---------------------------------------------------------------------------
// OpenAI stream handler
// ---------------------------------------------------------------------------

export interface HandleOpenAIStreamParams {
  modelName: string
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  messages: any[]
  systemPrompt?: string
  rawTools?: Record<string, { description?: string; inputSchema?: Record<string, unknown> }>
  temperature: number
  maxTokens?: number
  userId: bigint
  configId?: number
}

export async function handleOpenAIStream(params: HandleOpenAIStreamParams): Promise<Response> {
  const {
    streamOpenAIContent,
    convertMessagesToOpenAIInput,
    convertToolsToOpenAIFormat,
    classifyOpenAIError,
  } = await import('@/lib/services/openai-sdk')

  const { input, systemInstruction } = convertMessagesToOpenAIInput(params.messages)

  // 合并外部 system prompt 和消息中提取的 system instruction
  const mergedInstructions = params.systemPrompt
    ? systemInstruction
      ? `${params.systemPrompt}\n\n${systemInstruction}`
      : params.systemPrompt
    : systemInstruction

  const openaiTools = params.rawTools
    ? convertToolsToOpenAIFormat(params.rawTools)
    : undefined

  const stream = createUIMessageStream({
    execute: async ({ writer }) => {
      let totalInputTokens = 0
      let totalOutputTokens = 0
      let totalReasoningTokens = 0

      let reasoningPartId = ''
      let textPartId = ''
      let hasError = false

      writer.write({ type: 'start' })
      writer.write({ type: 'start-step' })

      try {
        for await (const event of streamOpenAIContent({
          modelName: params.modelName,
          input,
          instructions: mergedInstructions,
          tools: openaiTools,
          temperature: params.temperature,
          maxTokens: params.maxTokens,
          reasoning: { effort: 'high', summary: 'detailed' },
        })) {
          switch (event.type) {
            case 'reasoning-delta': {
              if (!reasoningPartId) {
                reasoningPartId = generateId()
                writer.write({ type: 'reasoning-start', id: reasoningPartId })
              }
              if (event.text) {
                writer.write({
                  type: 'reasoning-delta',
                  id: reasoningPartId,
                  delta: event.text,
                })
              }
              break
            }

            case 'text-delta': {
              if (reasoningPartId) {
                writer.write({ type: 'reasoning-end', id: reasoningPartId })
                reasoningPartId = ''
              }
              if (!textPartId) {
                textPartId = generateId()
                writer.write({ type: 'text-start', id: textPartId })
              }
              writer.write({ type: 'text-delta', id: textPartId, delta: event.text })
              break
            }

            case 'tool-call': {
              if (textPartId) {
                writer.write({ type: 'text-end', id: textPartId })
                textPartId = ''
              }
              if (reasoningPartId) {
                writer.write({ type: 'reasoning-end', id: reasoningPartId })
                reasoningPartId = ''
              }
              writer.write({
                type: 'tool-input-available',
                toolCallId: event.toolCallId,
                toolName: normalizeToolName(event.toolName),
                input: event.args,
              })
              break
            }

            case 'finish': {
              if (textPartId) {
                writer.write({ type: 'text-end', id: textPartId })
                textPartId = ''
              }
              if (reasoningPartId) {
                writer.write({ type: 'reasoning-end', id: reasoningPartId })
                reasoningPartId = ''
              }

              totalInputTokens = event.usage.inputTokens
              totalOutputTokens = event.usage.outputTokens
              totalReasoningTokens = event.usage.reasoningTokens

              writer.write({ type: 'finish-step' })
              writer.write({
                type: 'finish',
                finishReason: event.finishReason as 'stop' | 'length' | 'tool-calls',
                messageMetadata: {
                  usage: {
                    inputTokens: totalInputTokens,
                    outputTokens: totalOutputTokens,
                    ...(totalReasoningTokens > 0 ? { reasoningTokens: totalReasoningTokens } : {}),
                  },
                },
              })
              break
            }

            case 'error': {
              hasError = true
              const classified = classifyOpenAIError(event.error)
              writer.write({ type: 'error', errorText: classified.message })
              break
            }
          }
        }
      } catch (error) {
        hasError = true
        const classified = classifyOpenAIError(error)
        writer.write({ type: 'error', errorText: classified.message })
      }

      // 积分扣减
      if (!hasError && totalInputTokens + totalOutputTokens > 0) {
        console.log(
          `[LLM/OpenAI] Finish: in=${totalInputTokens}, out=${totalOutputTokens}, reasoning=${totalReasoningTokens}`,
        )
        await deductLlmCredits({
          userId: params.userId,
          configId: params.configId,
          inputTokens: totalInputTokens,
          outputTokens: totalOutputTokens,
          logTag: 'OpenAI',
        })
      }
    },
  })

  return createUIMessageStreamResponse({ stream })
}
