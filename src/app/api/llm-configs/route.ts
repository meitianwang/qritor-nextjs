import { prisma } from '@/lib/prisma'
import { apiSuccess, apiError } from '@/lib/api-response'

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
        ownedBy: c.owned_by,
        isDefault: c.is_default === 1,
        creditRate: c.credit_rate ?? 1.0,
        modelTier: c.model_tier || 'base',
        tags: c.tags ? JSON.parse(c.tags) : [],
      }))
    )
  } catch (error) {
    return apiError(500, '获取LLM配置列表失败')
  }
}
