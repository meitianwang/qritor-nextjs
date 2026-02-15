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

    const config = await prisma.video_gen_config.findUnique({
      where: { id: BigInt(id) },
    })

    if (!config) {
      return apiNotFound('视频生成配置不存在')
    }

    if (!config.api_base || !config.api_key) {
      return apiError(400, '配置缺少 api_base 或 api_key')
    }

    const startTime = Date.now()

    try {
      const testUrl = `${config.api_base.replace(/\/+$/, '')}/v1/models`
      const response = await fetch(testUrl, {
        method: 'GET',
        headers: {
          Authorization: `Bearer ${config.api_key}`,
        },
        signal: AbortSignal.timeout(15000),
      })

      const latencyMs = Date.now() - startTime

      if (!response.ok) {
        return apiSuccess({
          success: false,
          provider: config.provider,
          modelName: config.model_name,
          latencyMs,
          error: `HTTP ${response.status}`,
        })
      }

      return apiSuccess({
        success: true,
        provider: config.provider,
        modelName: config.model_name,
        latencyMs,
      })
    } catch (fetchError) {
      const latencyMs = Date.now() - startTime
      return apiSuccess({
        success: false,
        provider: config.provider,
        modelName: config.model_name,
        latencyMs,
        error: String(fetchError),
      })
    }
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `测试视频生成配置失败: ${String(error)}`)
  }
}
