import { NextRequest } from 'next/server'
import { prisma } from '@/lib/prisma'
import { getCurrentUserOptional } from '@/lib/middleware/auth-middleware'
import { apiSuccess, apiError } from '@/lib/api-response'
import { users_role } from '@/generated/prisma'

const IMAGE_GEN_PROVIDERS: Record<string, string> = {
  antigravity: 'Antigravity (Gemini代理)',
  nanobanana: 'NanoBanana',
  jimeng: '即梦 (Jimeng)',
  sora: 'OpenAI Sora',
  midjourney: 'Midjourney',
  dalle: 'DALL·E',
  stability: 'Stability AI',
  flux: 'Flux',
  gemini: 'Google Gemini',
}

export async function GET(request: NextRequest) {
  try {
    const user = await getCurrentUserOptional(request)
    const isAdmin = user && user.role === users_role.ADMIN

    const configs = await prisma.image_gen_config.findMany({
      where: { enabled: 1 },
    })

    return apiSuccess(
      configs.map((c) => {
        const providerKey = c.provider?.toLowerCase() || ''
        const config: Record<string, any> = {
          id: Number(c.id),
          provider: c.provider,
          displayName: IMAGE_GEN_PROVIDERS[providerKey] || c.provider,
          modelName: c.model_name,
          apiBase: c.api_base,
          apiKey: c.api_key,
          isDefault: c.is_default === 1,
          enabled: c.enabled === 1,
          creditRate: c.credit_rate ?? 1.0,
          defaultWidth: c.default_width || 1024,
          defaultHeight: c.default_height || 1024,
          maxWidth: c.max_width || 2048,
          maxHeight: c.max_height || 2048,
          supportsStyles: c.supports_styles,
        }

        if (!isAdmin) {
          delete config.apiKey
        }

        return config
      })
    )
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, '获取生图模型配置列表失败')
  }
}
