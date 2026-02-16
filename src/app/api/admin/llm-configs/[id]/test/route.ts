import { NextRequest } from 'next/server'
import { apiSuccess, apiError, apiNotFound } from '@/lib/api-response'
import { getCurrentAdminUser } from '@/lib/middleware/auth-middleware'
import { prisma } from '@/lib/prisma'
import { generateText, createGateway } from 'ai'

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

    const gatewayApiKey = process.env.AI_GATEWAY_API_KEY || ''
    if (!gatewayApiKey) {
      return apiError(400, 'AI Gateway 未配置，请设置 AI_GATEWAY_API_KEY')
    }

    const gateway = createGateway({ apiKey: gatewayApiKey })
    const startTime = Date.now()

    const { text } = await generateText({
      model: gateway(config.model_name),
      messages: [{ role: 'user', content: 'Say "hello" in one word.' }],
      maxOutputTokens: 10,
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
