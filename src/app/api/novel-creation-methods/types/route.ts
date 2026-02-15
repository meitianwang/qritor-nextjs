import { apiSuccess } from '@/lib/api-response'

export async function GET() {
  const types = [
    { value: 'supernatural', name: '灵异' },
    { value: 'suspense', name: '悬疑' },
    { value: 'cultivation', name: '修仙' },
    { value: 'emotional_angst', name: '情感虐文' },
  ]
  return apiSuccess(types)
}
