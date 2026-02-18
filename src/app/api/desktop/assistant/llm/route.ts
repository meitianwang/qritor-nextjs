import { NextRequest, NextResponse } from 'next/server'
import { streamText, jsonSchema } from 'ai'
import { getCurrentUser } from '@/lib/middleware/auth-middleware'
import { gateway, getConfigById } from '@/lib/services/ai-service'
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

    const modelPolicy = resolveModelRequestPolicy(config.model_name)
    const toolsForModel = modelPolicy.allowTools ? tools : undefined

    console.log(
      `[LLM] Request: model=${config.model_name}, resolved=${modelPolicy.resolvedModelName}, messages=${messages.length}, toolsIn=${tools ? Object.keys(tools).length : 0}, toolsForwarded=${toolsForModel ? Object.keys(toolsForModel).length : 0}`,
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
    const result = streamText({
      model: gateway(modelPolicy.resolvedModelName),
      ...(systemPrompt ? { system: systemPrompt } : {}),
      messages,
      ...(toolsForModel ? { tools: toolsForModel } : {}),
      ...(modelPolicy.providerOptions
        ? { providerOptions: modelPolicy.providerOptions }
        : {}),
      ...(modelPolicy.allowTemperature ? { temperature } : {}),
      onFinish: async ({ totalUsage }) => {
        const inputTokens = totalUsage.inputTokens ?? 0
        const outputTokens = totalUsage.outputTokens ?? 0
        const reasoningTokens =
          totalUsage.outputTokenDetails?.reasoningTokens ??
          totalUsage.reasoningTokens ??
          0
        console.log(
          `[LLM] Finish: in=${inputTokens}, out=${outputTokens}, reasoning=${reasoningTokens}`,
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
    return jsonError(500, `桌面端助手请求失败: ${String(error)}`)
  }
}
