import { NextRequest } from 'next/server'
import { apiSuccess, apiError, apiNotFound } from '@/lib/api-response'
import { getCurrentAdminUser } from '@/lib/middleware/auth-middleware'
import { prisma } from '@/lib/prisma'
import { serializeCamel } from '@/lib/serialize'

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

    const config = await prisma.video_gen_config.findUnique({
      where: { id: BigInt(id) },
    })

    if (!config) {
      return apiNotFound('视频生成配置不存在')
    }

    return apiSuccess({
      ...serializeCamel(config),
      apiKey: maskApiKey(config.api_key),
    })
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `获取视频生成配置详情失败: ${String(error)}`)
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

    const existing = await prisma.video_gen_config.findUnique({
      where: { id: BigInt(id) },
    })
    if (!existing) {
      return apiNotFound('视频生成配置不存在')
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
      default_duration,
      max_duration,
      supports_audio,
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
      default_duration?: number
      max_duration?: number
      supports_audio?: number
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
    if (default_duration !== undefined) updateData.default_duration = default_duration
    if (max_duration !== undefined) updateData.max_duration = max_duration
    if (supports_audio !== undefined) updateData.supports_audio = supports_audio

    const updated = await prisma.video_gen_config.update({
      where: { id: BigInt(id) },
      data: updateData,
    })

    return apiSuccess({
      ...serializeCamel(updated),
      apiKey: maskApiKey(updated.api_key),
    })
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `更新视频生成配置失败: ${String(error)}`)
  }
}

export async function DELETE(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> },
) {
  try {
    await getCurrentAdminUser(request)
    const { id } = await params

    const existing = await prisma.video_gen_config.findUnique({
      where: { id: BigInt(id) },
    })
    if (!existing) {
      return apiNotFound('视频生成配置不存在')
    }

    await prisma.video_gen_config.delete({
      where: { id: BigInt(id) },
    })

    return apiSuccess(null, '视频生成配置已删除')
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `删除视频生成配置失败: ${String(error)}`)
  }
}
