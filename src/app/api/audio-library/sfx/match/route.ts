import { NextRequest } from 'next/server'
import { apiSuccess, apiError } from '@/lib/api-response'
import { SFX_CATEGORIES, SFX_LIST } from '@/lib/data/audio-library'

export async function POST(request: NextRequest) {
  try {
    const body = await request.json()
    const { category, keywords, action_type, max_duration } = body as {
      category?: string
      keywords?: string[]
      action_type?: string
      max_duration?: number
    }

    const matched: Array<{ item: (typeof SFX_LIST)[number]; score: number }> = []

    for (const sfx of SFX_LIST) {
      let score = 0

      // Category match
      if (category) {
        if (sfx.category === category) {
          score += 10
        } else if (sfx.category.includes(category)) {
          score += 5
        }
      }

      // Keyword match
      if (keywords && keywords.length > 0) {
        for (const keyword of keywords) {
          if (sfx.tags.includes(keyword)) {
            score += 3
          }
          if (sfx.name.includes(keyword)) {
            score += 2
          }
        }
      }

      // Action type match
      if (action_type) {
        if (action_type === 'ambiance' && sfx.category.startsWith('ambiance')) {
          score += 8
        } else if (
          action_type === 'sfx' &&
          (sfx.category.startsWith('action') || sfx.category.startsWith('fx'))
        ) {
          score += 8
        } else if (action_type === 'music') {
          // SFX library does not contain music, skip
          continue
        }
      }

      // Duration filter
      if (max_duration && sfx.duration > max_duration) {
        continue
      }

      if (score > 0) {
        matched.push({
          item: {
            ...sfx,
            category_name: SFX_CATEGORIES[sfx.category] || sfx.category,
          },
          score,
        })
      }
    }

    // Sort by score descending
    matched.sort((a, b) => b.score - a.score)

    return apiSuccess({
      matches: matched.slice(0, 10).map((m) => m.item),
      total: matched.length,
    })
  } catch (error) {
    return apiError(500, `匹配音效失败: ${String(error)}`)
  }
}
