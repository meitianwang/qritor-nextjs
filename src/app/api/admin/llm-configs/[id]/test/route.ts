import { NextRequest } from 'next/server'
import { apiSuccess, apiError, apiNotFound } from '@/lib/api-response'
import { getCurrentAdminUser } from '@/lib/middleware/auth-middleware'
import { prisma } from '@/lib/prisma'

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

    const proxyUrl = process.env.PROXY_URL || ''
    const proxyApiKey = process.env.PROXY_API_KEY || ''

    if (!proxyUrl) {
      return apiError(400, '代理未配置')
    }

    const chatUrl = `${proxyUrl.replace(/\/+$/, '')}/v1/chat/completions`
    const headers: Record<string, string> = {
      'Content-Type': 'application/json',
    }
    if (proxyApiKey) {
      headers['Authorization'] = `Bearer ${proxyApiKey}`
    }

    const startTime = Date.now()

    const response = await fetch(chatUrl, {
      method: 'POST',
      headers,
      body: JSON.stringify({
        model: config.model_name,
        messages: [{ role: 'user', content: 'Say "hello" in one word.' }],
        max_tokens: 10,
      }),
      signal: AbortSignal.timeout(30000),
    })

    const latencyMs = Date.now() - startTime

    if (!response.ok) {
      const errorText = await response.text().catch(() => '')
      return apiSuccess({
        success: false,
        modelName: config.model_name,
        latencyMs,
        error: `HTTP ${response.status}: ${errorText.slice(0, 200)}`,
      })
    }

    const result = (await response.json()) as {
      choices?: Array<{ message?: { content?: string } }>
    }
    const reply = result.choices?.[0]?.message?.content || ''

    return apiSuccess({
      success: true,
      modelName: config.model_name,
      latencyMs,
      reply: reply.slice(0, 100),
    })
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `测试 LLM 模型失败: ${String(error)}`)
  }
}
