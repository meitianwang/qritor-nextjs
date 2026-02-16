import { prisma } from '@/lib/prisma'
import { apiSuccess, apiError } from '@/lib/api-response'
import { parseLlmTags } from '@/lib/llm-tags'

export async function GET() {
  try {
    const configs = await prisma.llm_config.findMany({
      where: { enabled: 1 },
      orderBy: { credit_rate: 'asc' },
    })

    return apiSuccess(
      configs.map((c) => ({
        id: Number(c.id),
        modelName: c.model_name,
        displayName: c.display_name || c.model_name,
        platform: c.owned_by,
        isDefault: c.is_default === 1,
        creditRate: c.credit_rate ?? 1.0,
        modelTier: c.model_tier || 'base',
        tags: parseLlmTags(c.tags),
      }))
    )
  } catch {
    return apiError(500, '获取LLM配置列表失败')
  }
}
