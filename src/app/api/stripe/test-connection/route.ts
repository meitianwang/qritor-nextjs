import { NextRequest } from 'next/server'
import { getCurrentAdminUser } from '@/lib/middleware/auth-middleware'
import { apiSuccess, apiError } from '@/lib/api-response'
import { stripeService } from '@/lib/services/stripe-service'

export async function POST(request: NextRequest) {
  try {
    await getCurrentAdminUser(request)

    const result = await stripeService.testConnection()
    return apiSuccess(result)
  } catch (e) {
    if (e instanceof Response || (e && typeof e === 'object' && 'status' in e)) {
      return e as Response
    }
    const message = e instanceof Error ? e.message : '测试连接失败'
    return apiError(500, message)
  }
}
