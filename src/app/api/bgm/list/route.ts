import { NextRequest } from 'next/server'
import { apiSuccess } from '@/lib/api-response'
import { BGM_CATEGORIES, BGM_LIST } from '@/lib/data/audio-library'

export async function GET(request: NextRequest) {
  const url = new URL(request.url)
  const category = url.searchParams.get('category')

  const items = category
    ? BGM_LIST.filter((bgm) => bgm.category === category)
    : BGM_LIST

  return apiSuccess({
    categories: BGM_CATEGORIES,
    items,
  })
}
