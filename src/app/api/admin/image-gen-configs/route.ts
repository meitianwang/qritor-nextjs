import { NextRequest } from 'next/server'
import { apiSuccess, apiError } from '@/lib/api-response'
import { getCurrentAdminUser } from '@/lib/middleware/auth-middleware'
import { prisma } from '@/lib/prisma'
import { serialize } from '@/lib/serialize'

function maskApiKey(key: string | null): string | null {
  if (!key) return null
  if (key.length <= 8) return '****'
  return key.slice(0, 8) + '****'
}

export async function GET(request: NextRequest) {
  try {
    await getCurrentAdminUser(request)

    const configs = await prisma.image_gen_config.findMany({
      orderBy: { created_at: 'desc' },
    })

    const maskedConfigs = configs.map((c) => ({
      ...serialize(c),
      api_key: maskApiKey(c.api_key),
    }))

    return apiSuccess(maskedConfigs)
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `获取图片生成配置列表失败: ${String(error)}`)
  }
}

export async function POST(request: NextRequest) {
  try {
    await getCurrentAdminUser(request)
    const body = await request.json()
    const {
      provider,
      model_name,
      api_base,
      api_key,
      is_default,
      enabled,
      credit_rate,
      default_width,
      default_height,
      max_width,
      max_height,
      supports_styles,
    } = body as {
      provider: string
      model_name: string
      api_base?: string
      api_key?: string
      is_default?: number
      enabled?: number
      credit_rate?: number
      default_width?: number
      default_height?: number
      max_width?: number
      max_height?: number
      supports_styles?: string
    }

    if (!provider || !model_name) {
      return apiError(400, '缺少必要字段: provider, model_name')
    }

    const config = await prisma.image_gen_config.create({
      data: {
        provider,
        model_name,
        api_base: api_base ?? null,
        api_key: api_key ?? '',
        is_default: is_default ?? 0,
        enabled: enabled ?? 1,
        credit_rate: credit_rate ?? 1.0,
        default_width: default_width ?? 1024,
        default_height: default_height ?? 1024,
        max_width: max_width ?? 2048,
        max_height: max_height ?? 2048,
        supports_styles: supports_styles ?? null,
        created_at: new Date(),
        updated_at: new Date(),
      },
    })

    return apiSuccess({
      ...serialize(config),
      api_key: maskApiKey(config.api_key),
    })
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `创建图片生成配置失败: ${String(error)}`)
  }
}
