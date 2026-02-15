import { NextRequest } from 'next/server'
import { apiSuccess, apiError, apiNotFound } from '@/lib/api-response'
import { getCurrentAdminUser } from '@/lib/middleware/auth-middleware'
import { prisma } from '@/lib/prisma'
import { serialize } from '@/lib/serialize'

function maskApiKey(key: string | null): string | null {
  if (!key) return null
  if (key.length <= 8) return '****'
  return key.slice(0, 8) + '****'
}

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> },
) {
  try {
    await getCurrentAdminUser(request)
    const { id } = await params

    const config = await prisma.image_gen_config.findUnique({
      where: { id: BigInt(id) },
    })

    if (!config) {
      return apiNotFound('图片生成配置不存在')
    }

    return apiSuccess({
      ...serialize(config),
      api_key: maskApiKey(config.api_key),
    })
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `获取图片生成配置详情失败: ${String(error)}`)
  }
}

export async function PUT(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> },
) {
  try {
    await getCurrentAdminUser(request)
    const { id } = await params
    const body = await request.json()

    const existing = await prisma.image_gen_config.findUnique({
      where: { id: BigInt(id) },
    })
    if (!existing) {
      return apiNotFound('图片生成配置不存在')
    }

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
      provider?: string
      model_name?: string
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

    const updateData: Record<string, unknown> = { updated_at: new Date() }
    if (provider !== undefined) updateData.provider = provider
    if (model_name !== undefined) updateData.model_name = model_name
    if (api_base !== undefined) updateData.api_base = api_base
    if (api_key !== undefined) updateData.api_key = api_key
    if (is_default !== undefined) updateData.is_default = is_default
    if (enabled !== undefined) updateData.enabled = enabled
    if (credit_rate !== undefined) updateData.credit_rate = credit_rate
    if (default_width !== undefined) updateData.default_width = default_width
    if (default_height !== undefined) updateData.default_height = default_height
    if (max_width !== undefined) updateData.max_width = max_width
    if (max_height !== undefined) updateData.max_height = max_height
    if (supports_styles !== undefined) updateData.supports_styles = supports_styles

    const updated = await prisma.image_gen_config.update({
      where: { id: BigInt(id) },
      data: updateData,
    })

    return apiSuccess({
      ...serialize(updated),
      api_key: maskApiKey(updated.api_key),
    })
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `更新图片生成配置失败: ${String(error)}`)
  }
}

export async function DELETE(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> },
) {
  try {
    await getCurrentAdminUser(request)
    const { id } = await params

    const existing = await prisma.image_gen_config.findUnique({
      where: { id: BigInt(id) },
    })
    if (!existing) {
      return apiNotFound('图片生成配置不存在')
    }

    await prisma.image_gen_config.delete({
      where: { id: BigInt(id) },
    })

    return apiSuccess(null, '图片生成配置已删除')
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `删除图片生成配置失败: ${String(error)}`)
  }
}
