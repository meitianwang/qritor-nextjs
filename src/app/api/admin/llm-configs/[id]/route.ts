import { NextRequest } from 'next/server'
import { apiSuccess, apiError, apiNotFound } from '@/lib/api-response'
import { getCurrentAdminUser } from '@/lib/middleware/auth-middleware'
import { prisma } from '@/lib/prisma'
import { serializeCamel } from '@/lib/serialize'
import { parseLlmTags, serializeLlmTags } from '@/lib/llm-tags'

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

    const serialized = serializeCamel(config) as Record<string, unknown>
    return apiSuccess({
      ...serialized,
      tags: parseLlmTags(config.tags),
    })
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
    const body = (await request.json()) as Record<string, unknown>

    const existing = await prisma.llm_config.findUnique({
      where: { id: BigInt(id) },
    })
    if (!existing) {
      return apiNotFound('LLM 配置不存在')
    }

    const toTinyInt = (value: unknown): number | undefined => {
      if (value === undefined) return undefined
      if (typeof value === 'boolean') return value ? 1 : 0
      if (typeof value === 'number' && Number.isFinite(value)) {
        return value !== 0 ? 1 : 0
      }
      if (typeof value === 'string') {
        const normalized = value.trim().toLowerCase()
        if (normalized === '1' || normalized === 'true') return 1
        if (normalized === '0' || normalized === 'false') return 0
      }
      return undefined
    }

    const toNumber = (value: unknown): number | undefined => {
      if (value === undefined || value === null || value === '') return undefined
      const num = typeof value === 'number' ? value : Number(value)
      return Number.isFinite(num) ? num : undefined
    }

    const toPositiveInt = (value: unknown): number | undefined => {
      if (value === undefined || value === null || value === '') return undefined
      const num = typeof value === 'number' ? value : Number(value)
      if (!Number.isFinite(num) || num <= 0) return undefined
      return Math.floor(num)
    }

    const pickString = (...values: unknown[]): string | undefined => {
      for (const value of values) {
        if (typeof value === 'string') return value
      }
      return undefined
    }

    const modelName = pickString(body.model_name, body.modelName)
    const displayName = pickString(body.display_name, body.displayName)
    const ownedBy = pickString(body.owned_by, body.ownedBy)
    const modelTier = pickString(body.model_tier, body.modelTier)
    const isDefault = toTinyInt(body.is_default ?? body.isDefault)
    const enabled = toTinyInt(body.enabled)
    const inputPricePerM = toNumber(body.input_price_per_m ?? body.inputPricePerM)
    const outputPricePerM = toNumber(body.output_price_per_m ?? body.outputPricePerM)
    const pricingMultiplier = toNumber(body.pricing_multiplier ?? body.pricingMultiplier)
    const contextWindow = toPositiveInt(body.context_window ?? body.contextWindow)

    const updateData: Record<string, unknown> = { updated_at: new Date() }
    if (modelName !== undefined) updateData.model_name = modelName
    if (displayName !== undefined) updateData.display_name = displayName
    if (ownedBy !== undefined) updateData.owned_by = ownedBy

    if (body.tags !== undefined) updateData.tags = serializeLlmTags(body.tags)

    if (isDefault !== undefined) updateData.is_default = isDefault
    if (enabled !== undefined) updateData.enabled = enabled
    if (inputPricePerM !== undefined) updateData.input_price_per_m = inputPricePerM
    if (outputPricePerM !== undefined) updateData.output_price_per_m = outputPricePerM
    if (pricingMultiplier !== undefined) updateData.pricing_multiplier = pricingMultiplier
    if (modelTier !== undefined) updateData.model_tier = modelTier
    if (contextWindow !== undefined) updateData.context_window = contextWindow

    const updated = await prisma.llm_config.update({
      where: { id: BigInt(id) },
      data: updateData,
    })

    const serialized = serializeCamel(updated) as Record<string, unknown>
    return apiSuccess({
      ...serialized,
      tags: parseLlmTags(updated.tags),
    })
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
