import { NextRequest } from 'next/server'
import { apiSuccess, apiError } from '@/lib/api-response'
import { getCurrentAdminUser } from '@/lib/middleware/auth-middleware'
import { prisma } from '@/lib/prisma'
import { serializeCamel } from '@/lib/serialize'
import { parseLlmTags, serializeLlmTags } from '@/lib/llm-tags'

export async function GET(request: NextRequest) {
  try {
    await getCurrentAdminUser(request)

    const configs = await prisma.llm_config.findMany({
      orderBy: { created_at: 'desc' },
    })

    const serialized = serializeCamel(configs) as Record<string, unknown>[]
    const normalized = serialized.map((item, index) => ({
      ...item,
      tags: parseLlmTags(configs[index]?.tags ?? null),
    }))

    return apiSuccess(normalized)
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `获取 LLM 配置列表失败: ${String(error)}`)
  }
}

export async function POST(request: NextRequest) {
  try {
    await getCurrentAdminUser(request)
    const body = await request.json()
    const {
      model_name,
      owned_by,
      display_name,
      tags,
      is_default,
      enabled,
      credit_rate,
      model_tier,
      normalization_factor,
      context_window,
    } = body as {
      model_name: string
      owned_by?: string
      display_name?: string
      tags?: unknown
      is_default?: unknown
      enabled?: unknown
      credit_rate?: unknown
      model_tier?: string
      normalization_factor?: unknown
      context_window?: unknown
    }

    const toTinyInt = (value: unknown, fallback: number): number => {
      if (value === undefined || value === null) return fallback
      if (typeof value === 'boolean') return value ? 1 : 0
      if (typeof value === 'number' && Number.isFinite(value)) {
        return value !== 0 ? 1 : 0
      }
      if (typeof value === 'string') {
        const normalized = value.trim().toLowerCase()
        if (normalized === '1' || normalized === 'true') return 1
        if (normalized === '0' || normalized === 'false') return 0
      }
      return fallback
    }

    const toNumber = (value: unknown, fallback: number): number => {
      if (value === undefined || value === null || value === '') return fallback
      const num = typeof value === 'number' ? value : Number(value)
      return Number.isFinite(num) ? num : fallback
    }

    const toPositiveInt = (value: unknown): number | undefined => {
      if (value === undefined || value === null || value === '') return undefined
      const num = typeof value === 'number' ? value : Number(value)
      if (!Number.isFinite(num) || num <= 0) return undefined
      return Math.floor(num)
    }

    const normalizedModelName = String(model_name ?? '').trim()
    if (!normalizedModelName) {
      return apiError(400, '缺少必要字段: model_name')
    }

    const normalizedDisplayName = String(display_name ?? normalizedModelName).trim()
    const normalizedOwnedBy = String(owned_by ?? '').trim()
    const normalizedIsDefault = toTinyInt(is_default, 0)
    const normalizedEnabled = toTinyInt(enabled, 1)
    const normalizedCreditRate = toNumber(credit_rate, 1.0)
    const normalizedNormalizationFactor = toNumber(normalization_factor, 1.0)
    const normalizedModelTier =
      typeof model_tier === 'string' && model_tier.trim() ? model_tier.trim() : null
    const normalizedContextWindow = toPositiveInt(context_window)

    const config = await prisma.llm_config.create({
      data: {
        model_name: normalizedModelName,
        owned_by: normalizedOwnedBy,
        display_name: normalizedDisplayName || normalizedModelName,
        tags: serializeLlmTags(tags),
        is_default: normalizedIsDefault,
        enabled: normalizedEnabled,
        credit_rate: normalizedCreditRate,
        model_tier: normalizedModelTier,
        normalization_factor: normalizedNormalizationFactor,
        context_window: normalizedContextWindow,
        created_at: new Date(),
        updated_at: new Date(),
      },
    })

    const serialized = serializeCamel(config) as Record<string, unknown>
    return apiSuccess({
      ...serialized,
      tags: parseLlmTags(config.tags),
    })
  } catch (error) {
    if (error instanceof Response) return error
    if (
      typeof error === 'object' &&
      error !== null &&
      'code' in error &&
      (error as { code?: unknown }).code === 'P2002'
    ) {
      return apiError(409, '模型名称已存在，请使用其他 model_name')
    }
    return apiError(500, `创建 LLM 配置失败: ${String(error)}`)
  }
}
