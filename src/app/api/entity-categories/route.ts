import { apiSuccess } from '@/lib/api-response'

export async function GET() {
  const categories = [
    'character',
    'scene',
    'organization',
    'prop',
    'chapter',
    'setting',
    'other',
  ]
  return apiSuccess(categories)
}
