import { apiSuccess } from '@/lib/api-response'

export async function GET() {
  const languages = [
    { value: 'zh', name: '简体中文' },
    { value: 'zh-TW', name: '繁體中文' },
    { value: 'en', name: 'English' },
    { value: 'ja', name: '日本語' },
    { value: 'ko', name: '한국어' },
    { value: 'ru', name: 'Русский' },
    { value: 'de', name: 'Deutsch' },
    { value: 'ar', name: 'العربية' },
    { value: 'pt', name: 'Português' },
    { value: 'fr', name: 'Français' },
    { value: 'es', name: 'Español' },
    { value: 'hi', name: 'हिन्दी' },
  ]
  return apiSuccess(languages)
}
