import { NextRequest } from 'next/server'
import { prisma } from '@/lib/prisma'
import { apiSuccess, apiError, apiNotFound } from '@/lib/api-response'

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    const { id } = await params
    const c = await prisma.llm_config.findUnique({
      where: { id: BigInt(id) },
    })

    if (!c) {
      return apiNotFound('LLM配置不存在')
    }

    return apiSuccess({
      id: Number(c.id),
      modelName: c.model_name,
      displayName: c.display_name || c.model_name,
      ownedBy: c.owned_by,
      isDefault: c.is_default === 1,
      enabled: c.enabled === 1,
      creditRate: c.credit_rate ?? 1.0,
      modelTier: c.model_tier || 'base',
    })
  } catch (error) {
    return apiError(500, '获取LLM配置失败')
  }
}
