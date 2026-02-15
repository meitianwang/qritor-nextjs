import { apiSuccess } from '@/lib/api-response'
import { SFX_CATEGORIES } from '@/lib/data/audio-library'

export async function GET() {
  return apiSuccess({ categories: SFX_CATEGORIES })
}
