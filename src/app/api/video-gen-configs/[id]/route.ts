import { NextRequest } from 'next/server'
import { prisma } from '@/lib/prisma'
import { getCurrentUserOptional } from '@/lib/middleware/auth-middleware'
import { apiSuccess, apiError, apiNotFound } from '@/lib/api-response'
import { users_role } from '@/generated/prisma'

const VIDEO_GEN_PROVIDERS: Record<string, string> = {
  runway: 'Runway Gen-3',
  pika: 'Pika Labs',
  kling: '可灵 (Kling)',
  sora: 'OpenAI Sora',
  minimax: 'MiniMax',
  luma: 'Luma Dream Machine',
  stable_video: 'Stability Video',
  vidu: 'Vidu',
}

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    const { id } = await params
    const user = await getCurrentUserOptional(request)
    const isAdmin = user && user.role === users_role.ADMIN

    const c = await prisma.video_gen_config.findUnique({
      where: { id: BigInt(id) },
    })

    if (!c) {
      return apiNotFound('生视频模型配置不存在')
    }

    const providerKey = c.provider?.toLowerCase() || ''
    const config: Record<string, any> = {
      id: Number(c.id),
      provider: c.provider,
      displayName: VIDEO_GEN_PROVIDERS[providerKey] || c.provider,
      modelName: c.model_name,
      apiBase: c.api_base,
      apiKey: c.api_key,
      isDefault: c.is_default === 1,
      enabled: c.enabled === 1,
      creditRate: c.credit_rate ?? 1.0,
      defaultWidth: c.default_width || 1280,
      defaultHeight: c.default_height || 720,
      maxWidth: c.max_width || 1920,
      maxHeight: c.max_height || 1080,
      defaultDuration: c.default_duration || 5,
      maxDuration: c.max_duration || 60,
      supportsAudio: (c.supports_audio ?? 0) === 1,
    }

    if (!isAdmin) {
      delete config.apiKey
    }

    return apiSuccess(config)
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, '获取生视频模型配置失败')
  }
}
