import { NextRequest } from 'next/server'
import { getCurrentUser } from '@/lib/middleware/auth-middleware'
import { apiSuccess, apiError } from '@/lib/api-response'
import { listUserPaymentMethods } from '@/lib/services/payment-method-service'

export async function GET(request: NextRequest) {
  try {
    const user = await getCurrentUser(request)
    const methods = await listUserPaymentMethods(user.id)
    return apiSuccess(methods)
  } catch (e) {
    if (e instanceof Response) return e
    return apiError(500, '获取支付方式失败')
  }
}
