import { NextRequest } from 'next/server'
import { apiSuccess, apiError } from '@/lib/api-response'
import { getCurrentAdminUser } from '@/lib/middleware/auth-middleware'
import { stripeService } from '@/lib/services/stripe-service'

export async function POST(request: NextRequest) {
  try {
    await getCurrentAdminUser(request)

    const result = await stripeService.testConnection()

    return apiSuccess(result)
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `测试 Stripe 连接失败: ${String(error)}`)
  }
}
