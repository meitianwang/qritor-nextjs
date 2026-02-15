import { NextRequest } from 'next/server'
import { apiSuccess, apiError, apiNotFound } from '@/lib/api-response'
import { getCurrentAdminUser } from '@/lib/middleware/auth-middleware'
import { prisma } from '@/lib/prisma'
import { serialize } from '@/lib/serialize'

export async function GET(
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

    return apiSuccess(serialize(config))
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `获取 LLM 配置详情失败: ${String(error)}`)
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

    const existing = await prisma.llm_config.findUnique({
      where: { id: BigInt(id) },
    })
    if (!existing) {
      return apiNotFound('LLM 配置不存在')
    }

    const {
      display_name,
      tags,
      is_default,
      enabled,
      credit_rate,
      model_tier,
      normalization_factor,
    } = body as {
      display_name?: string
      tags?: string
      is_default?: number
      enabled?: number
      credit_rate?: number
      model_tier?: string
      normalization_factor?: number
    }

    const updateData: Record<string, unknown> = { updated_at: new Date() }
    if (display_name !== undefined) updateData.display_name = display_name
    if (tags !== undefined) updateData.tags = tags
    if (is_default !== undefined) updateData.is_default = is_default
    if (enabled !== undefined) updateData.enabled = enabled
    if (credit_rate !== undefined) updateData.credit_rate = credit_rate
    if (model_tier !== undefined) updateData.model_tier = model_tier
    if (normalization_factor !== undefined) updateData.normalization_factor = normalization_factor

    const updated = await prisma.llm_config.update({
      where: { id: BigInt(id) },
      data: updateData,
    })

    return apiSuccess(serialize(updated))
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `更新 LLM 配置失败: ${String(error)}`)
  }
}

export async function DELETE(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> },
) {
  try {
    await getCurrentAdminUser(request)
    const { id } = await params

    const existing = await prisma.llm_config.findUnique({
      where: { id: BigInt(id) },
    })
    if (!existing) {
      return apiNotFound('LLM 配置不存在')
    }

    await prisma.llm_config.delete({
      where: { id: BigInt(id) },
    })

    return apiSuccess(null, 'LLM 配置已删除')
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `删除 LLM 配置失败: ${String(error)}`)
  }
}
