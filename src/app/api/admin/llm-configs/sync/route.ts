import { NextRequest } from 'next/server'
import { apiSuccess, apiError } from '@/lib/api-response'
import { getCurrentAdminUser } from '@/lib/middleware/auth-middleware'
import { prisma } from '@/lib/prisma'

interface ProxyModel {
  id: string
  owned_by?: string
}

export async function POST(request: NextRequest) {
  try {
    await getCurrentAdminUser(request)

    const proxyUrl = process.env.PROXY_URL || ''
    const proxyApiKey = process.env.PROXY_API_KEY || ''

    if (!proxyUrl) {
      return apiError(400, '代理未配置，请先设置 PROXY_URL 环境变量')
    }

    // Fetch models from proxy
    const modelsUrl = `${proxyUrl.replace(/\/+$/, '')}/v1/models`
    const headers: Record<string, string> = {}
    if (proxyApiKey) {
      headers['Authorization'] = `Bearer ${proxyApiKey}`
    }

    const response = await fetch(modelsUrl, {
      method: 'GET',
      headers,
      signal: AbortSignal.timeout(15000),
    })

    if (!response.ok) {
      return apiError(502, `代理返回错误: ${response.status} ${response.statusText}`)
    }

    const result = (await response.json()) as { data?: ProxyModel[] }
    const models = result.data || []

    let created = 0
    let updated = 0
    let skipped = 0

    for (const model of models) {
      const modelName = model.id
      if (!modelName) {
        skipped++
        continue
      }

      const existing = await prisma.llm_config.findUnique({
        where: { model_name: modelName },
      })

      if (existing) {
        // Update owned_by if changed
        if (model.owned_by && model.owned_by !== existing.owned_by) {
          await prisma.llm_config.update({
            where: { id: existing.id },
            data: {
              owned_by: model.owned_by,
              updated_at: new Date(),
            },
          })
          updated++
        } else {
          skipped++
        }
      } else {
        await prisma.llm_config.create({
          data: {
            model_name: modelName,
            owned_by: model.owned_by ?? '',
            display_name: modelName,
            enabled: 0,
            is_default: 0,
            credit_rate: 1.0,
            normalization_factor: 1.0,
            created_at: new Date(),
            updated_at: new Date(),
          },
        })
        created++
      }
    }

    return apiSuccess({
      totalFromProxy: models.length,
      created,
      updated,
      skipped,
    })
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `同步 LLM 模型失败: ${String(error)}`)
  }
}
