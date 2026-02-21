import { NextRequest } from 'next/server'
import { apiSuccess, apiError } from '@/lib/api-response'
import { getCurrentAdminUser } from '@/lib/middleware/auth-middleware'
import { prisma } from '@/lib/prisma'

interface ModelEntry {
  model_name: string
  display_name?: string
  model_tier?: string
  provider?: string
  platform?: string
}

/**
 * Sync / batch-create LLM configs.
 *
 * With AI Gateway there is no remote `/v1/models` list to pull from.
 * Instead the admin POSTs a `models` array to upsert configs manually.
 *
 * Body: { models: ModelEntry[] }
 */
export async function POST(request: NextRequest) {
  try {
    await getCurrentAdminUser(request)

    const body = (await request.json()) as { models?: ModelEntry[] }
    const models = body.models

    if (!models || !Array.isArray(models) || models.length === 0) {
      return apiError(
        400,
        '请提供 models 数组，格式: [{ model_name: "...", provider?: "...", platform?: "...", display_name?: "...", model_tier?: "..." }]',
      )
    }

    let created = 0
    let updated = 0
    let skipped = 0

    for (const model of models) {
      const modelName = model.model_name
      if (!modelName) {
        skipped++
        continue
      }

      const existing = await prisma.llm_config.findUnique({
        where: { model_name: modelName },
      })

      if (existing) {
        const updates: Record<string, unknown> = {}
        if (model.display_name && model.display_name !== existing.display_name) {
          updates.display_name = model.display_name
        }
        if (model.model_tier && model.model_tier !== existing.model_tier) {
          updates.model_tier = model.model_tier
        }
        if (model.provider && model.provider !== existing.provider) {
          updates.provider = model.provider
        }
        if (model.platform && model.platform !== existing.platform) {
          updates.platform = model.platform
        }

        if (Object.keys(updates).length > 0) {
          updates.updated_at = new Date()
          await prisma.llm_config.update({
            where: { id: existing.id },
            data: updates,
          })
          updated++
        } else {
          skipped++
        }
      } else {
        await prisma.llm_config.create({
          data: {
            model_name: modelName,
            display_name: model.display_name || modelName,
            model_tier: model.model_tier || null,
            provider: model.provider ?? '',
            platform: model.platform ?? '',
            enabled: 0,
            is_default: 0,
            input_price_per_m: 0.20,
            output_price_per_m: 0.40,
            created_at: new Date(),
            updated_at: new Date(),
          },
        })
        created++
      }
    }

    return apiSuccess({
      total: models.length,
      created,
      updated,
      skipped,
    })
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `同步 LLM 模型失败: ${String(error)}`)
  }
}
