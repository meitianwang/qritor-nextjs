import { apiSuccess } from '@/lib/api-response'
import {
  BGM_CATEGORIES,
  BGM_LIST,
  SFX_CATEGORIES,
  SFX_LIST,
} from '@/lib/data/audio-library'

export async function GET() {
  return apiSuccess({
    bgm: {
      categories: BGM_CATEGORIES,
      items: BGM_LIST,
    },
    sfx: {
      categories: SFX_CATEGORIES,
      items: SFX_LIST,
    },
  })
}
