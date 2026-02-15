import { streamText } from 'ai'
import { createOpenAI } from '@ai-sdk/openai'
import { prisma } from '@/lib/prisma'
import {
  calculateCredits,
  estimateInputTokens,
  getConfigParams,
} from './token-calculator'

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
  normalization_factor: number | null
  credit_rate: number | null
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

async function getConfigById(
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

function resolveProxy(config: LlmConfigRow): {
  baseUrl: string
  modelName: string
} {
  const baseUrl = (process.env.PROXY_URL || '').replace(/\/+$/, '')
  return { baseUrl, modelName: config.model_name || '' }
}

// ---------------------------------------------------------------------------
// ProxyAIService -- streams text via an OpenAI-compatible proxy
// ---------------------------------------------------------------------------

class ProxyAIService {
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

    const { baseUrl, modelName } = resolveProxy(config)

    const provider = createOpenAI({
      baseURL: baseUrl,
      apiKey: 'not-needed', // proxy handles auth
    })

    const messages: Array<{ role: 'system' | 'user'; content: string }> = []
    if (systemPrompt) {
      messages.push({ role: 'system', content: systemPrompt })
    }
    messages.push({ role: 'user', content: prompt })

    let outputText = ''
    const reasoningText = ''

    try {
      const result = streamText({
        model: provider(modelName),
        messages,
      })

      for await (const part of (await result).textStream) {
        outputText += part
        yield { type: 'chunk', content: part }
      }
    } catch (error) {
      yield {
        type: 'chunk',
        content: `[错误] Proxy 调用异常: ${String(error)}`,
      }
      return
    }

    // Estimate token usage
    const inputText = (systemPrompt || '') + '\n' + prompt
    yield {
      type: 'usage',
      inputTokens: estimateInputTokens(inputText),
      outputTokens: estimateInputTokens(outputText + reasoningText),
    }
  }
}

// ---------------------------------------------------------------------------
// AIGenerateService -- desktop prompt generation with credit management
// ---------------------------------------------------------------------------

class AIGenerateService {
  private proxyAI = new ProxyAIService()

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
        const { normalizationFactor, creditRate } =
          await getConfigParams(actualConfigId)
        const estimatedCredits = calculateCredits(
          estInputTokens,
          800,
          normalizationFactor,
          creditRate,
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

    for await (const item of this.proxyAI.streamTextFromProxy(
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
        const { normalizationFactor, creditRate, configId: finalConfigId } =
          await getConfigParams(actualConfigId)
        creditsConsumed = calculateCredits(
          inputTokens,
          outputTokens,
          normalizationFactor,
          creditRate,
        )

        const { consumeCreditsWithTransaction } = await import(
          './credit-service'
        )
        await consumeCreditsWithTransaction(
          BigInt(userId),
          creditsConsumed,
          'AI_GENERATE_DESKTOP_PROMPT',
          finalConfigId ? BigInt(finalConfigId) : undefined,
          inputTokens,
          outputTokens,
          creditRate,
          normalizationFactor,
          `桌面端AI生成: ${moduleTitle}`,
        )
      } catch (error) {
        console.error(`积分扣减失败: ${error}`)
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

export const proxyAIService = new ProxyAIService()
export const aiGenerateService = new AIGenerateService()
