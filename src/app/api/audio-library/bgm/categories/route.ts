import { apiSuccess } from '@/lib/api-response'
import { BGM_CATEGORIES } from '@/lib/data/audio-library'

export async function GET() {
  return apiSuccess({ categories: BGM_CATEGORIES })
}
