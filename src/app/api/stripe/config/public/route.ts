import { apiSuccess, apiError } from '@/lib/api-response'

export async function GET() {
  const publishableKey = process.env.STRIPE_PUBLISHABLE_KEY
  if (!publishableKey) {
    return apiError(500, 'Stripe publishable key 未配置')
  }

  return apiSuccess({ publishableKey })
}
