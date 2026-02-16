import { apiSuccess } from '@/lib/api-response'

export async function GET() {
  const languages = [
    { value: 'zh', name: '简体中文' },
    { value: 'en', name: 'English' },
  ]
  return apiSuccess(languages)
}
