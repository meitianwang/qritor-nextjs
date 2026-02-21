import { NextRequest, NextResponse } from 'next/server'
import {
  streamText,
  jsonSchema,
  createUIMessageStream,
  createUIMessageStreamResponse,
} from 'ai'
import { generateId } from '@ai-sdk/provider-utils'
import { getCurrentUser } from '@/lib/middleware/auth-middleware'
import { resolveModel, getConfigById } from '@/lib/services/ai-service'
import {
  resolveModelRequestPolicy,
} from '@/lib/services/reasoning-options'
import {
  calculateCredits,
  estimateInputTokens,
  getConfigParams,
} from '@/lib/services/token-calculator'
import {
  consumeCreditsWithTransaction,
  hasEnoughCredits,
  recordCreditDebt,
} from '@/lib/services/credit-service'
import { classifyAIError } from '@/lib/services/ai-error-classifier'

export const dynamic = 'force-dynamic'

function jsonError(status: number, message: string) {
  return NextResponse.json(
    { code: status, data: null, message },
    { status },
  )
}

/**
 * 桌面端 LLM 代理 — 纯透传 + 积分扣减
 *
 * 桌面端发送 AI SDK CoreMessage 格式的 messages，
 * 服务端直传给 streamText，用 toUIMessageStreamResponse() 返回。
 * 积分扣减在流结束后异步执行。
 */
export async function POST(request: NextRequest) {
  try {
    const user = await getCurrentUser(request)
    const body = await request.json()

    const configId: number | undefined =
      body.llm_config_id ?? body.llmConfigId
    const temperature: number = body.temperature ?? 0.7

    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    const messages = body.messages as any[]
    if (!messages?.length) return jsonError(400, '缺少 messages')

    // tools: 桌面端发来 { name: { description, inputSchema } }
    // 仅需 jsonSchema() 恢复为 AI SDK schema（跨 HTTP 无法直接传递 symbol）
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    let tools: any = undefined
    if (body.tools && typeof body.tools === 'object') {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      tools = {} as Record<string, any>
      for (const [name, def] of Object.entries(
        body.tools as Record<
          string,
          {
            description?: string
            inputSchema?: Record<string, unknown>
          }
        >,
      )) {
        if (!def.inputSchema) {
          return jsonError(400, `工具 ${name} 缺少 inputSchema`)
        }

        tools[name] = {
          ...(def.description ? { description: def.description } : {}),
          inputSchema: jsonSchema(def.inputSchema),
        }
      }
    }

    const config = await getConfigById(configId)
    if (!config) return jsonError(400, '没有可用的 LLM 配置')

    // Check model tier access
    const configTier = config.model_tier || 'economy'
    const { canUserAccessModelTier } = await import(
      '@/lib/services/subscription-service'
    )
    if (!(await canUserAccessModelTier(user.id, configTier))) {
      return jsonError(
        403,
        '当前订阅计划不支持使用该模型，请升级订阅',
      )
    }

    const modelPolicy = resolveModelRequestPolicy(config.model_name, config.provider)
    const toolsForModel = modelPolicy.allowTools ? tools : undefined

    // Anthropic prompt caching: 在最后一个 tool 上标记 cacheControl 断点，
    // 使 Anthropic API 缓存所有 tool 定义（~55k tokens），后续请求只计 cache read 费用（10%）
    const isAnthropic = config.provider?.toLowerCase() === 'anthropic'
    if (isAnthropic && toolsForModel) {
      const toolNames = Object.keys(toolsForModel)
      if (toolNames.length > 0) {
        const lastToolName = toolNames[toolNames.length - 1]
        toolsForModel[lastToolName] = {
          ...toolsForModel[lastToolName],
          providerOptions: {
            anthropic: { cacheControl: { type: 'ephemeral' } },
          },
        }
      }
    }

    // Anthropic 消息预处理
    if (isAnthropic) {
      for (let i = 0; i < messages.length; i++) {
        const m = messages[i]

        // 1) 过滤空内容（Anthropic 会拒绝空 content）
        if (typeof m.content === 'string' && m.content === '') {
          m.content = ' '
        } else if (Array.isArray(m.content)) {
          m.content = m.content.filter(
            // eslint-disable-next-line @typescript-eslint/no-explicit-any
            (p: any) => {
              if (p.type === 'text' || p.type === 'reasoning') return p.text !== ''
              return true
            },
          )
          if (m.content.length === 0) m.content = ' '
        }

        // 2) 清洗 tool call ID（Anthropic 只接受 [a-zA-Z0-9_-]）
        if (Array.isArray(m.content)) {
          for (const part of m.content) {
            if ((part.type === 'tool-call' || part.type === 'tool-result') && part.toolCallId) {
              part.toolCallId = part.toolCallId.replace(/[^a-zA-Z0-9_-]/g, '_')
            }
          }
        }
      }

      // 3) 在最后 2 条非 system 消息上标记 cacheControl
      const nonSystemMsgs = messages.filter(
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        (m: any) => m.role !== 'system',
      )
      const lastTwo = nonSystemMsgs.slice(-2)
      for (const msg of lastTwo) {
        msg.providerOptions = {
          ...(msg.providerOptions || {}),
          anthropic: {
            ...(msg.providerOptions?.anthropic || {}),
            cacheControl: { type: 'ephemeral' },
          },
        }
      }
    }

    console.log(
      `[LLM] Request: model=${config.model_name}, messages=${messages.length}, toolsIn=${tools ? Object.keys(tools).length : 0}, toolsForwarded=${toolsForModel ? Object.keys(toolsForModel).length : 0}`,
    )

    // 积分预检
    const allText = messages
      .map((m) => (typeof m.content === 'string' ? m.content : ''))
      .join('\n')
    const est = estimateInputTokens(allText)
    const { inputPricePerM, outputPricePerM } =
      await getConfigParams(configId)
    if (
      !(await hasEnoughCredits(
        user.id,
        calculateCredits(est, 800, inputPricePerM, outputPricePerM),
      ))
    ) {
      return jsonError(403, '积分不足，请充值后再试')
    }

    // 透传给 AI Gateway，积分在 onFinish 回调中扣减
    const systemPrompt: string | undefined = body.systemPrompt || body.system

    // -----------------------------------------------------------------------
    // Google platform: 走 @google/genai SDK
    // -----------------------------------------------------------------------
    if (config.platform === 'google') {
      return handleGoogleStream({
        modelName: config.model_name,
        messages,
        systemPrompt,
        rawTools: body.tools,
        temperature,
        maxTokens: modelPolicy.maxTokens,
        userId: user.id,
        configId,
      })
    }

    // -----------------------------------------------------------------------
    // Anthropic platform: 走 @anthropic-ai/sdk
    // -----------------------------------------------------------------------
    if (config.platform === 'anthropic') {
      return handleAnthropicStream({
        modelName: config.model_name,
        messages,
        systemPrompt,
        rawTools: body.tools,
        temperature,
        maxTokens: modelPolicy.maxTokens ?? 16000,
        userId: user.id,
        configId,
      })
    }

    // -----------------------------------------------------------------------
    // OpenAI platform: 走 openai 官方 SDK (Responses API)
    // -----------------------------------------------------------------------
    if (config.platform === 'openai') {
      return handleOpenAIStream({
        modelName: config.model_name,
        messages,
        systemPrompt,
        rawTools: body.tools,
        temperature,
        maxTokens: modelPolicy.maxTokens,
        userId: user.id,
        configId,
      })
    }

    // -----------------------------------------------------------------------
    // 其他 platform: 继续走 Vercel AI SDK streamText
    // -----------------------------------------------------------------------

    // Anthropic: 将 system prompt 标记为可缓存
    const systemOption = systemPrompt
      ? isAnthropic
        ? {
            system: {
              role: 'system' as const,
              content: systemPrompt,
              providerOptions: {
                anthropic: { cacheControl: { type: 'ephemeral' } },
              },
            },
          }
        : { system: systemPrompt }
      : {}

    const result = streamText({
      model: resolveModel(config.model_name, config.platform),
      ...systemOption,
      messages,
      ...(toolsForModel ? { tools: toolsForModel } : {}),
      ...(modelPolicy.providerOptions
        ? { providerOptions: modelPolicy.providerOptions }
        : {}),
      ...(modelPolicy.maxTokens ? { maxTokens: modelPolicy.maxTokens } : {}),
      ...(modelPolicy.allowTemperature ? { temperature } : {}),
      onFinish: async ({ totalUsage, steps }) => {
        const inputTokens = totalUsage.inputTokens ?? 0
        const outputTokens = totalUsage.outputTokens ?? 0
        const reasoningTokens =
          totalUsage.outputTokenDetails?.reasoningTokens ??
          totalUsage.reasoningTokens ??
          0
        // 记录工具调用名（用于排查 mcp_ 前缀问题）
        const toolCallNames = steps
          ?.flatMap((s) => s.toolCalls?.map((tc) => tc.toolName) ?? [])
          .filter(Boolean)
        console.log(
          `[LLM] Finish: in=${inputTokens}, out=${outputTokens}, reasoning=${reasoningTokens}${
            toolCallNames?.length ? `, tools=[${toolCallNames.join(',')}]` : ''
          }`,
        )
        const {
          inputPricePerM: ip,
          outputPricePerM: op,
          configId: cid,
        } = await getConfigParams(configId)
        const credits = calculateCredits(inputTokens, outputTokens, ip, op)
        try {
          const deducted = await consumeCreditsWithTransaction(
            user.id,
            credits,
            'DESKTOP_ASSISTANT_LLM',
            cid ? BigInt(cid) : undefined,
            inputTokens,
            outputTokens,
            ip,
            op,
            '桌面端助手对话',
          )
          if (!deducted) {
            console.error(
              `[LLM] Credit deduction failed: user=${user.id}, credits=${credits}`,
            )
            await recordCreditDebt(
              user.id,
              credits,
              'DESKTOP_ASSISTANT_LLM',
              '桌面端助手扣费失败，已记入欠费',
            )
          }
        } catch (e) {
          console.error('积分扣减失败:', e)
          await recordCreditDebt(
            user.id,
            credits,
            'DESKTOP_ASSISTANT_LLM',
            '桌面端助手扣费异常，已记入欠费',
          )
        }
      },
    })

    return result.toUIMessageStreamResponse({
      sendReasoning: true,
      sendSources: true,
      messageMetadata: ({ part }) => {
        if (part.type === 'finish') {
          const reasoningTokens =
            part.totalUsage.outputTokenDetails?.reasoningTokens ??
            part.totalUsage.reasoningTokens ??
            0

          return {
            usage: {
              inputTokens: part.totalUsage.inputTokens ?? 0,
              outputTokens: part.totalUsage.outputTokens ?? 0,
              ...(reasoningTokens > 0 ? { reasoningTokens } : {}),
            },
          }
        }
        return undefined
      },
    })
  } catch (error) {
    if (error instanceof Response) return error
    const classified = classifyAIError(error)
    const httpStatus = classified.code === 'PROVIDER_AUTH_FAILED' ? 502 : 500
    return NextResponse.json(
      {
        code: httpStatus,
        data: null,
        message: classified.message,
        errorCode: classified.code,
        retryable: classified.retryable,
      },
      { status: httpStatus },
    )
  }
}

// ---------------------------------------------------------------------------
// Anthropic platform: @anthropic-ai/sdk 直连 + createUIMessageStream SSE 输出
// ---------------------------------------------------------------------------

interface HandleAnthropicStreamParams {
  modelName: string
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  messages: any[]
  systemPrompt?: string
  rawTools?: Record<string, { description?: string; inputSchema?: Record<string, unknown> }>
  temperature: number
  maxTokens: number
  userId: bigint
  configId?: number
}

async function handleAnthropicStream(params: HandleAnthropicStreamParams): Promise<Response> {
  const {
    streamAnthropicContent,
    convertMessagesToAnthropicFormat,
    convertToolsToAnthropicFormat,
    classifyAnthropicError,
  } = await import('@/lib/services/anthropic-sdk')

  const { messages: anthropicMessages, systemBlocks } = convertMessagesToAnthropicFormat(params.messages)

  // 合并外部 system prompt 和消息中提取的 system blocks
  if (params.systemPrompt) {
    systemBlocks.unshift({ type: 'text', text: params.systemPrompt })
  }

  const anthropicTools = params.rawTools
    ? convertToolsToAnthropicFormat(params.rawTools)
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
        for await (const event of streamAnthropicContent({
          modelName: params.modelName,
          messages: anthropicMessages,
          systemBlocks,
          tools: anthropicTools,
          temperature: params.temperature,
          maxTokens: params.maxTokens,
          thinking: { type: 'enabled', budget_tokens: Math.max(1024, params.maxTokens - 1) },
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
              // signature 到达时通过 providerMetadata 传递
              if (event.signature) {
                writer.write({
                  type: 'reasoning-end',
                  id: reasoningPartId,
                  providerMetadata: { anthropic: { signature: event.signature } },
                })
                reasoningPartId = ''
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
                toolName: event.toolName,
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
              const classified = classifyAnthropicError(event.error)
              writer.write({ type: 'error', errorText: classified.message })
              break
            }
          }
        }
      } catch (error) {
        hasError = true
        const classified = classifyAnthropicError(error)
        writer.write({ type: 'error', errorText: classified.message })
      }

      // 积分扣减
      if (!hasError && totalInputTokens + totalOutputTokens > 0) {
        console.log(
          `[LLM/Anthropic] Finish: in=${totalInputTokens}, out=${totalOutputTokens}, reasoning=${totalReasoningTokens}`,
        )
        const {
          inputPricePerM: ip,
          outputPricePerM: op,
          configId: cid,
        } = await getConfigParams(params.configId)
        const credits = calculateCredits(totalInputTokens, totalOutputTokens, ip, op)
        try {
          const deducted = await consumeCreditsWithTransaction(
            params.userId,
            credits,
            'DESKTOP_ASSISTANT_LLM',
            cid ? BigInt(cid) : undefined,
            totalInputTokens,
            totalOutputTokens,
            ip,
            op,
            '桌面端助手对话',
          )
          if (!deducted) {
            console.error(
              `[LLM/Anthropic] Credit deduction failed: user=${params.userId}, credits=${credits}`,
            )
            await recordCreditDebt(
              params.userId,
              credits,
              'DESKTOP_ASSISTANT_LLM',
              '桌面端助手扣费失败，已记入欠费',
            )
          }
        } catch (e) {
          console.error('积分扣减失败:', e)
          await recordCreditDebt(
            params.userId,
            credits,
            'DESKTOP_ASSISTANT_LLM',
            '桌面端助手扣费异常，已记入欠费',
          )
        }
      }
    },
  })

  return createUIMessageStreamResponse({ stream })
}

// ---------------------------------------------------------------------------
// OpenAI platform: openai 官方 SDK (Responses API) + createUIMessageStream SSE 输出
// ---------------------------------------------------------------------------

interface HandleOpenAIStreamParams {
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

async function handleOpenAIStream(params: HandleOpenAIStreamParams): Promise<Response> {
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
                toolName: event.toolName,
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
        const {
          inputPricePerM: ip,
          outputPricePerM: op,
          configId: cid,
        } = await getConfigParams(params.configId)
        const credits = calculateCredits(totalInputTokens, totalOutputTokens, ip, op)
        try {
          const deducted = await consumeCreditsWithTransaction(
            params.userId,
            credits,
            'DESKTOP_ASSISTANT_LLM',
            cid ? BigInt(cid) : undefined,
            totalInputTokens,
            totalOutputTokens,
            ip,
            op,
            '桌面端助手对话',
          )
          if (!deducted) {
            console.error(
              `[LLM/OpenAI] Credit deduction failed: user=${params.userId}, credits=${credits}`,
            )
            await recordCreditDebt(
              params.userId,
              credits,
              'DESKTOP_ASSISTANT_LLM',
              '桌面端助手扣费失败，已记入欠费',
            )
          }
        } catch (e) {
          console.error('积分扣减失败:', e)
          await recordCreditDebt(
            params.userId,
            credits,
            'DESKTOP_ASSISTANT_LLM',
            '桌面端助手扣费异常，已记入欠费',
          )
        }
      }
    },
  })

  return createUIMessageStreamResponse({ stream })
}

// ---------------------------------------------------------------------------
// Google platform: @google/genai 直连 + createUIMessageStream SSE 输出
// ---------------------------------------------------------------------------

interface HandleGoogleStreamParams {
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

async function handleGoogleStream(params: HandleGoogleStreamParams): Promise<Response> {
  const {
    streamGoogleContent,
    convertMessagesToGoogleContents,
    convertToolsToGoogleFormat,
    classifyGoogleError,
  } = await import('@/lib/services/google-genai')

  const { contents, systemInstruction } = convertMessagesToGoogleContents(params.messages)
  const mergedSystem = params.systemPrompt
    ? systemInstruction
      ? `${params.systemPrompt}\n\n${systemInstruction}`
      : params.systemPrompt
    : systemInstruction

  const googleTools = params.rawTools
    ? convertToolsToGoogleFormat(params.rawTools)
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
        for await (const event of streamGoogleContent({
          modelName: params.modelName,
          contents,
          systemInstruction: mergedSystem,
          tools: googleTools,
          temperature: params.temperature,
          maxTokens: params.maxTokens,
          thinkingConfig: { includeThoughts: true, thinkingLevel: 'HIGH' },
        })) {
          switch (event.type) {
            case 'reasoning-delta': {
              if (!reasoningPartId) {
                reasoningPartId = generateId()
                writer.write({
                  type: 'reasoning-start',
                  id: reasoningPartId,
                  providerMetadata: event.thoughtSignature
                    ? { google: { thoughtSignature: event.thoughtSignature } }
                    : undefined,
                })
              }
              writer.write({
                type: 'reasoning-delta',
                id: reasoningPartId,
                delta: event.text,
                providerMetadata: event.thoughtSignature
                  ? { google: { thoughtSignature: event.thoughtSignature } }
                  : undefined,
              })
              break
            }

            case 'text-delta': {
              // 从 reasoning 过渡到 text 时，关闭 reasoning part
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
              // 关闭未关闭的 part
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
                toolName: event.toolName,
                input: event.args,
                providerMetadata: event.thoughtSignature
                  ? { google: { thoughtSignature: event.thoughtSignature } }
                  : undefined,
              })
              break
            }

            case 'finish': {
              // 关闭未关闭的 part
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
              const classified = classifyGoogleError(event.error)
              writer.write({ type: 'error', errorText: classified.message })
              break
            }
          }
        }
      } catch (error) {
        hasError = true
        const classified = classifyGoogleError(error)
        writer.write({ type: 'error', errorText: classified.message })
      }

      // 积分扣减
      if (!hasError && totalInputTokens + totalOutputTokens > 0) {
        console.log(
          `[LLM/Google] Finish: in=${totalInputTokens}, out=${totalOutputTokens}, reasoning=${totalReasoningTokens}`,
        )
        const {
          inputPricePerM: ip,
          outputPricePerM: op,
          configId: cid,
        } = await getConfigParams(params.configId)
        const credits = calculateCredits(totalInputTokens, totalOutputTokens, ip, op)
        try {
          const deducted = await consumeCreditsWithTransaction(
            params.userId,
            credits,
            'DESKTOP_ASSISTANT_LLM',
            cid ? BigInt(cid) : undefined,
            totalInputTokens,
            totalOutputTokens,
            ip,
            op,
            '桌面端助手对话',
          )
          if (!deducted) {
            console.error(
              `[LLM/Google] Credit deduction failed: user=${params.userId}, credits=${credits}`,
            )
            await recordCreditDebt(
              params.userId,
              credits,
              'DESKTOP_ASSISTANT_LLM',
              '桌面端助手扣费失败，已记入欠费',
            )
          }
        } catch (e) {
          console.error('积分扣减失败:', e)
          await recordCreditDebt(
            params.userId,
            credits,
            'DESKTOP_ASSISTANT_LLM',
            '桌面端助手扣费异常，已记入欠费',
          )
        }
      }
    },
  })

  return createUIMessageStreamResponse({ stream })
}
