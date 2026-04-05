import { NextRequest } from 'next/server'
import { prisma } from '@/lib/prisma'
import { apiSuccess, apiError, apiNotFound } from '@/lib/api-response'
import { parseLlmTags } from '@/lib/llm-tags'
import { creditsPerMToken } from '@/lib/services/token-calculator'

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
      provider: c.provider,
      isDefault: c.is_default === 1,
      enabled: c.enabled === 1,
      inputPricePerM: c.input_price_per_m ?? 0.20,
      outputPricePerM: c.output_price_per_m ?? 0.40,
      inputCreditsPerM: creditsPerMToken(c.input_price_per_m ?? 0.20),
      outputCreditsPerM: creditsPerMToken(c.output_price_per_m ?? 0.40),
      modelTier: c.model_tier || 'base',
      tags: parseLlmTags(c.tags),
    })
  } catch {
    return apiError(500, '获取LLM配置失败')
  }
}
