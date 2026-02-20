import { NextRequest } from 'next/server'
import { prisma } from '@/lib/prisma'
import { apiSuccess, apiError } from '@/lib/api-response'
import { parseLlmTags } from '@/lib/llm-tags'
import { getCurrentUserOptional } from '@/lib/middleware/auth-middleware'
import { getUserAllowedModelTiers } from '@/lib/services/subscription-service'

const CONTEXT_WINDOW_COLUMN_CANDIDATES = ['context_window', 'max_tokens'] as const
let cachedContextWindowColumn: string | null | undefined

function toPositiveInt(value: unknown): number | undefined {
  if (value === null || value === undefined || value === '') return undefined
  const num = typeof value === 'bigint' ? Number(value) : Number(value)
  if (!Number.isFinite(num) || num <= 0) return undefined
  return Math.floor(num)
}

async function resolveContextWindowColumn(): Promise<string | null> {
  if (cachedContextWindowColumn !== undefined) return cachedContextWindowColumn

  try {
    const rows = await prisma.$queryRawUnsafe<Array<{ COLUMN_NAME: string }>>(
      `SELECT COLUMN_NAME
       FROM INFORMATION_SCHEMA.COLUMNS
       WHERE TABLE_SCHEMA = DATABASE()
         AND TABLE_NAME = 'llm_config'
         AND COLUMN_NAME IN ('context_window', 'max_tokens')`,
    )

    cachedContextWindowColumn =
      CONTEXT_WINDOW_COLUMN_CANDIDATES.find((name) =>
        rows.some((row) => row.COLUMN_NAME === name),
      ) ?? null
  } catch {
    cachedContextWindowColumn = null
  }

  return cachedContextWindowColumn
}

async function loadContextWindowByConfigId(
  configIds: number[],
): Promise<Map<number, number>> {
  if (configIds.length === 0) return new Map()

  const column = await resolveContextWindowColumn()
  if (!column) return new Map()

  try {
    const idList = configIds.join(',')
    const rows = await prisma.$queryRawUnsafe<
      Array<{ id: bigint | number | string; context_window: unknown }>
    >(
      `SELECT id, ${column} AS context_window
       FROM llm_config
       WHERE enabled = 1
         AND id IN (${idList})`,
    )

    const byId = new Map<number, number>()
    for (const row of rows) {
      const id = Number(row.id)
      if (!Number.isFinite(id)) continue
      const contextWindow = toPositiveInt(row.context_window)
      if (contextWindow !== undefined) {
        byId.set(id, contextWindow)
      }
    }
    return byId
  } catch {
    return new Map()
  }
}

export async function GET(request: NextRequest) {
  try {
    const configs = await prisma.llm_config.findMany({
      where: { enabled: 1 },
      orderBy: { input_price_per_m: 'asc' },
    })

    const configIds = configs.map((c) => Number(c.id))
    const contextWindowById = await loadContextWindowByConfigId(configIds)

    // If authenticated, resolve allowed tiers to mark accessibility
    const user = await getCurrentUserOptional(request)
    let allowedTiers: string[] | null = null
    if (user) {
      allowedTiers = await getUserAllowedModelTiers(user.id)
    }

    return apiSuccess(
      configs.map((c) => {
        const configId = Number(c.id)
        const contextWindow = contextWindowById.get(configId)
        const modelTier = c.model_tier || 'economy'

        return {
          id: configId,
          modelName: c.model_name,
          displayName: c.display_name || c.model_name,
          provider: c.provider,
          platform: c.platform,
          isDefault: c.is_default === 1,
          inputPricePerM: c.input_price_per_m ?? 0.20,
          outputPricePerM: c.output_price_per_m ?? 0.40,
          pricingMultiplier: c.pricing_multiplier ?? 1.0,
          modelTier,
          tags: parseLlmTags(c.tags),
          contextWindow,
          maxTokens: contextWindow,
          ...(allowedTiers !== null
            ? { accessible: allowedTiers.includes(modelTier) }
            : {}),
        }
      }),
    )
  } catch {
    return apiError(500, '获取LLM配置列表失败')
  }
}
