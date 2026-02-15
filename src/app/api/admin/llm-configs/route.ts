import { NextRequest } from 'next/server'
import { apiSuccess, apiError } from '@/lib/api-response'
import { getCurrentAdminUser } from '@/lib/middleware/auth-middleware'
import { prisma } from '@/lib/prisma'
import { serialize } from '@/lib/serialize'

export async function GET(request: NextRequest) {
  try {
    await getCurrentAdminUser(request)

    const configs = await prisma.llm_config.findMany({
      orderBy: { created_at: 'desc' },
    })

    return apiSuccess(serialize(configs))
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
    } = body as {
      model_name: string
      owned_by?: string
      display_name?: string
      tags?: string
      is_default?: number
      enabled?: number
      credit_rate?: number
      model_tier?: string
      normalization_factor?: number
    }

    if (!model_name) {
      return apiError(400, '缺少必要字段: model_name')
    }

    const config = await prisma.llm_config.create({
      data: {
        model_name,
        owned_by: owned_by ?? '',
        display_name: display_name ?? model_name,
        tags: tags ?? null,
        is_default: is_default ?? 0,
        enabled: enabled ?? 1,
        credit_rate: credit_rate ?? 1.0,
        model_tier: model_tier ?? null,
        normalization_factor: normalization_factor ?? 1.0,
        created_at: new Date(),
        updated_at: new Date(),
      },
    })

    return apiSuccess(serialize(config))
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `创建 LLM 配置失败: ${String(error)}`)
  }
}
