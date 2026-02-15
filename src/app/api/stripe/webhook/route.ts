import { NextRequest } from 'next/server'
import { apiSuccess, apiError } from '@/lib/api-response'
import { stripeService } from '@/lib/services/stripe-service'

export const dynamic = 'force-dynamic'

export async function POST(request: NextRequest) {
  try {
    const rawBody = await request.text()
    const sigHeader = request.headers.get('stripe-signature')

    if (!sigHeader) {
      return apiError(400, '缺少 Stripe-Signature 头')
    }

    const event = await stripeService.verifyWebhookSignature(rawBody, sigHeader)
    const result = await stripeService.handleWebhookEvent(event)

    return apiSuccess(result)
  } catch (e) {
    console.error('Stripe webhook 处理失败:', e)
    const message = e instanceof Error ? e.message : 'Webhook 处理失败'
    return apiError(400, message)
  }
}
