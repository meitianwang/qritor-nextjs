import { NextRequest } from 'next/server'
import { apiSuccess, apiError, apiNotFound } from '@/lib/api-response'
import { getCurrentAdminUser } from '@/lib/middleware/auth-middleware'
import { prisma } from '@/lib/prisma'
import { generateText } from 'ai'
import { resolveModel } from '@/lib/services/ai-service'
import { resolveModelRequestPolicy } from '@/lib/services/reasoning-options'

export async function POST(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> },
) {
  try {
    await getCurrentAdminUser(request)
    const { id } = await params

    const config = await prisma.llm_config.findUnique({
      where: { id: BigInt(id) },
    })

    if (!config) {
      return apiNotFound('LLM 配置不存在')
    }

    const modelPolicy = resolveModelRequestPolicy(config.model_name, config.provider)
    const startTime = Date.now()

    const { text } = await generateText({
      model: resolveModel(config.model_name, config.platform),
      messages: [{ role: 'user', content: 'Say "hello" in one word.' }],
      ...(modelPolicy.providerOptions
        ? { providerOptions: modelPolicy.providerOptions }
        : {}),
      ...(modelPolicy.maxTokens ? { maxTokens: modelPolicy.maxTokens } : {}),
    })

    const latencyMs = Date.now() - startTime

    return apiSuccess({
      success: true,
      modelName: config.model_name,
      latencyMs,
      reply: text.slice(0, 100),
    })
  } catch (error) {
    if (error instanceof Response) return error

    const latencyMs = 0
    const errorMsg = String(error)

    // Return structured failure instead of 500 for model-level errors
    if (errorMsg.includes('model') || errorMsg.includes('API')) {
      return apiSuccess({
        success: false,
        modelName: '',
        latencyMs,
        error: errorMsg.slice(0, 200),
      })
    }

    return apiError(500, `测试 LLM 模型失败: ${errorMsg}`)
  }
}
