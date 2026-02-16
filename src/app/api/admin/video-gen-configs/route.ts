import { NextRequest } from 'next/server'
import { apiSuccess, apiError } from '@/lib/api-response'
import { getCurrentAdminUser } from '@/lib/middleware/auth-middleware'
import { prisma } from '@/lib/prisma'
import { serializeCamel } from '@/lib/serialize'

function maskApiKey(key: string | null): string | null {
  if (!key) return null
  if (key.length <= 8) return '****'
  return key.slice(0, 8) + '****'
}

export async function GET(request: NextRequest) {
  try {
    await getCurrentAdminUser(request)

    const configs = await prisma.video_gen_config.findMany({
      orderBy: { created_at: 'desc' },
    })

    const result = configs.map((c) => ({
      ...serializeCamel(c),
      apiKey: maskApiKey(c.api_key),
    }))

    return apiSuccess(result)
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `获取视频生成配置列表失败: ${String(error)}`)
  }
}

export async function POST(request: NextRequest) {
  try {
    await getCurrentAdminUser(request)
    const body = await request.json()
    const {
      provider,
      modelName, model_name,
      apiBase, api_base,
      apiKey, api_key,
      isDefault, is_default,
      enabled,
      creditRate, credit_rate,
      defaultWidth, default_width,
      defaultHeight, default_height,
      maxWidth, max_width,
      maxHeight, max_height,
      defaultDuration, default_duration,
      maxDuration, max_duration,
      supportsAudio, supports_audio,
    } = body as Record<string, unknown>

    const mName = (modelName || model_name) as string
    if (!provider || !mName) {
      return apiError(400, '缺少必要字段: provider, modelName')
    }

    const config = await prisma.video_gen_config.create({
      data: {
        provider: provider as string,
        model_name: mName,
        api_base: (apiBase || api_base || null) as string | null,
        api_key: (apiKey || api_key || '') as string,
        is_default: ((isDefault ?? is_default ?? 0) ? 1 : 0) as number,
        enabled: ((enabled ?? 1) ? 1 : 0) as number,
        credit_rate: (creditRate || credit_rate || 1.0) as number,
        default_width: (defaultWidth || default_width || 1280) as number,
        default_height: (defaultHeight || default_height || 720) as number,
        max_width: (maxWidth || max_width || 1920) as number,
        max_height: (maxHeight || max_height || 1080) as number,
        default_duration: (defaultDuration || default_duration || 5) as number,
        max_duration: (maxDuration || max_duration || 30) as number,
        supports_audio: ((supportsAudio ?? supports_audio ?? 0) ? 1 : 0) as number,
        created_at: new Date(),
        updated_at: new Date(),
      },
    })

    return apiSuccess({
      ...serializeCamel(config),
      apiKey: maskApiKey(config.api_key),
    })
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `创建视频生成配置失败: ${String(error)}`)
  }
}
