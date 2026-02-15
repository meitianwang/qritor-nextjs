import { NextRequest } from 'next/server'
import { apiSuccess } from '@/lib/api-response'
import { SFX_CATEGORIES, SFX_LIST } from '@/lib/data/audio-library'

export async function GET(request: NextRequest) {
  const url = new URL(request.url)
  const category = url.searchParams.get('category')

  const items = category
    ? SFX_LIST.filter((sfx) => sfx.category === category)
    : SFX_LIST

  return apiSuccess({
    categories: SFX_CATEGORIES,
    items,
  })
}
