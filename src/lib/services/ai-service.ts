import { streamText, createGateway } from 'ai'
import { prisma } from '@/lib/prisma'
import {
  calculateCredits,
  estimateInputTokens,
  getConfigParams,
} from './token-calculator'
import {
  resolveModelRequestPolicy,
} from './reasoning-options'

// ---------------------------------------------------------------------------
// Types
// ---------------------------------------------------------------------------

interface StreamChunkEvent {
  type: 'chunk'
  content: string
}

interface StreamReasoningEvent {
  type: 'reasoning'
  content: string
}

interface StreamUsageEvent {
  type: 'usage'
  inputTokens: number
  outputTokens: number
}

type StreamEvent = StreamChunkEvent | StreamReasoningEvent | StreamUsageEvent

interface GenerateChunkEvent {
  event: 'chunk'
  data: { content: string }
}

interface GenerateReasoningEvent {
  event: 'reasoning'
  data: { content: string }
}

interface GenerateJsonEvent {
  event: 'json'
  data: { content: string }
}

interface GenerateCompleteEvent {
  event: 'complete'
  data: {
    status: string
    usage: {
      inputTokens: number
      outputTokens: number
      creditsConsumed: number
    }
  }
}

interface GenerateErrorEvent {
  event: 'error'
  data: { error: string; code: string }
}

type GenerateEvent =
  | GenerateChunkEvent
  | GenerateReasoningEvent
  | GenerateJsonEvent
  | GenerateCompleteEvent
  | GenerateErrorEvent

interface LlmConfigRow {
  id: bigint
  model_name: string
  model_tier: string | null
  is_default: number | null
  enabled: number | null
  input_price_per_m: number | null
  output_price_per_m: number | null
}

// ---------------------------------------------------------------------------
// Utility: extract JSON from LLM output
// ---------------------------------------------------------------------------

export function extractJson(content: string): string | null {
  // Try ```json ... ``` blocks first
  const jsonBlockPattern = /```json\s*([\s\S]*?)```/i
  const blockMatch = jsonBlockPattern.exec(content)
  if (blockMatch) {
    return blockMatch[1].trim()
  }

  // Fall back to the outermost { ... }
  const jsonPattern = /(\{[\s\S]*\})/
  const objMatch = jsonPattern.exec(content)
  if (objMatch) {
    const jsonStr = objMatch[1].trim()
    try {
      JSON.parse(jsonStr)
      return jsonStr
    } catch {
      // not valid JSON
    }
  }

  return null
}

// ---------------------------------------------------------------------------
// Utility: resolve LLM config
// ---------------------------------------------------------------------------

export async function getConfigById(
  configId?: number,
): Promise<LlmConfigRow | null> {
  // 1. By explicit id
  if (configId) {
    const config = await prisma.llm_config.findUnique({
      where: { id: BigInt(configId) },
    })
    if (config) return config as unknown as LlmConfigRow
  }

  // 2. Default + enabled
  const defaultConfig = await prisma.llm_config.findFirst({
    where: { is_default: 1, enabled: 1 },
  })
  if (defaultConfig) return defaultConfig as unknown as LlmConfigRow

  // 3. Any enabled
  const enabledConfig = await prisma.llm_config.findFirst({
    where: { enabled: 1 },
  })
  if (enabledConfig) return enabledConfig as unknown as LlmConfigRow

  // 4. Any at all
  const anyConfig = await prisma.llm_config.findFirst()
  return anyConfig as unknown as LlmConfigRow | null
}

// ---------------------------------------------------------------------------
// Vercel AI Gateway instance
// ---------------------------------------------------------------------------

export const gateway = createGateway({
  apiKey: process.env.AI_GATEWAY_API_KEY ?? '',
})

// ---------------------------------------------------------------------------
// GatewayAIService -- streams text via Vercel AI Gateway
// ---------------------------------------------------------------------------

class GatewayAIService {
  async *streamTextFromProxy(
    prompt: string,
    systemPrompt?: string,
    configId?: number,
  ): AsyncGenerator<StreamEvent> {
    const config = await getConfigById(configId)
    if (!config) {
      yield { type: 'chunk', content: '[错误] 没有可用的 LLM 配置' }
      return
    }

    // model_name should be in "provider/model" format, e.g. "deepseek/deepseek-chat"
    const modelPolicy = resolveModelRequestPolicy(config.model_name)

    const messages: Array<{ role: 'system' | 'user'; content: string }> = []
    if (systemPrompt) {
      messages.push({ role: 'system', content: systemPrompt })
    }
    messages.push({ role: 'user', content: prompt })

    let outputText = ''
    let usageInputTokens: number | undefined
    let usageOutputTokens: number | undefined

    try {
      const result = streamText({
        model: gateway(modelPolicy.resolvedModelName),
        messages,
        ...(modelPolicy.providerOptions
          ? { providerOptions: modelPolicy.providerOptions }
          : {}),
      })

      for await (const part of result.fullStream) {
        if (part.type === 'text-delta') {
          outputText += part.text
          yield { type: 'chunk', content: part.text }
        } else if (part.type === 'reasoning-delta') {
          yield { type: 'reasoning', content: part.text }
        } else if (part.type === 'finish') {
          usageInputTokens = part.totalUsage.inputTokens
          usageOutputTokens = part.totalUsage.outputTokens
        } else if (part.type === 'error') {
          yield {
            type: 'chunk',
            content: '[错误] 生成过程中出现异常，请稍后重试',
          }
          return
        }
      }
    } catch (error) {
      console.error('AI service error:', error)
      yield {
        type: 'chunk',
        content: '[错误] 内容生成失败，请稍后重试',
      }
      return
    }

    const inputText = (systemPrompt || '') + '\n' + prompt
    yield {
      type: 'usage',
      inputTokens: usageInputTokens ?? estimateInputTokens(inputText),
      outputTokens: usageOutputTokens ?? estimateInputTokens(outputText),
    }
  }
}

// ---------------------------------------------------------------------------
// AIGenerateService -- desktop prompt generation with credit management
// ---------------------------------------------------------------------------

class AIGenerateService {
  private ai = new GatewayAIService()

  async *generateDesktopPrompt(
    prompt: string,
    moduleTitle: string,
    llmConfigId?: number,
    modelTier?: string,
    userId?: number,
  ): AsyncGenerator<GenerateEvent> {
    console.log(
      `桌面端提示词直传生成: 模块=${moduleTitle}, model_tier=${modelTier}`,
    )

    // Resolve config id from model_tier when no explicit id is given
    let actualConfigId = llmConfigId
    if (!llmConfigId && modelTier) {
      const tierConfig = await prisma.llm_config.findFirst({
        where: { model_tier: modelTier, enabled: 1 },
        orderBy: { id: 'asc' },
        select: { id: true },
      })
      if (tierConfig) {
        actualConfigId = Number(tierConfig.id)
        console.log(
          `根据 model_tier=${modelTier} 选择模型配置 ID=${actualConfigId}`,
        )
      }
    }

    // Pre-check credits
    if (userId) {
      try {
        const estInputTokens = estimateInputTokens(prompt)
        const { inputPricePerM, outputPricePerM } =
          await getConfigParams(actualConfigId)
        const estimatedCredits = calculateCredits(
          estInputTokens,
          800,
          inputPricePerM,
          outputPricePerM,
        )

        const { hasEnoughCredits } = await import('./credit-service')
        if (!(await hasEnoughCredits(BigInt(userId), estimatedCredits))) {
          yield {
            event: 'error',
            data: {
              error: '积分不足，请充值后再试',
              code: 'INSUFFICIENT_CREDITS',
            },
          }
          return
        }
      } catch (error) {
        console.error(`积分预检异常: ${error}`)
      }
    }

    // Stream generation
    let fullContent = ''
    let inputTokens = 0
    let outputTokens = 0

    for await (const item of this.ai.streamTextFromProxy(
      prompt,
      undefined,
      actualConfigId,
    )) {
      if (item.type === 'chunk') {
        fullContent += item.content
        yield { event: 'chunk', data: { content: item.content } }
      } else if (item.type === 'reasoning') {
        yield { event: 'reasoning', data: { content: item.content } }
      } else if (item.type === 'usage') {
        inputTokens = item.inputTokens
        outputTokens = item.outputTokens
      }
    }

    // Extract JSON from generated content
    const extractedJson = extractJson(fullContent)
    if (extractedJson) {
      yield { event: 'json', data: { content: extractedJson } }
    }

    // Deduct credits
    let creditsConsumed = 0
    if (userId) {
      try {
        const { inputPricePerM, outputPricePerM, configId: finalConfigId } =
          await getConfigParams(actualConfigId)
        creditsConsumed = calculateCredits(
          inputTokens,
          outputTokens,
          inputPricePerM,
          outputPricePerM,
        )

        const { consumeCreditsWithTransaction } = await import(
          './credit-service'
        )
        const deducted = await consumeCreditsWithTransaction(
          BigInt(userId),
          creditsConsumed,
          'AI_GENERATE_DESKTOP_PROMPT',
          finalConfigId ? BigInt(finalConfigId) : undefined,
          inputTokens,
          outputTokens,
          inputPricePerM,
          outputPricePerM,
          `桌面端AI生成: ${moduleTitle}`,
        )
        if (!deducted) {
          yield {
            event: 'error',
            data: {
              error: '积分扣减失败，请稍后重试',
              code: 'CREDIT_DEDUCTION_FAILED',
            },
          }
          return
        }
      } catch (error) {
        console.error(`积分扣减失败: ${error}`)
        yield {
          event: 'error',
          data: {
            error: '积分扣减失败，请稍后重试',
            code: 'CREDIT_DEDUCTION_FAILED',
          },
        }
        return
      }
    }

    yield {
      event: 'complete',
      data: {
        status: 'done',
        usage: {
          inputTokens,
          outputTokens,
          creditsConsumed,
        },
      },
    }
  }
}

// ---------------------------------------------------------------------------
// Singleton exports
// ---------------------------------------------------------------------------

export const proxyAIService = new GatewayAIService()
export const aiGenerateService = new AIGenerateService()
