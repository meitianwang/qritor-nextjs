import { NextRequest } from 'next/server'
import { getCurrentUser } from '@/lib/middleware/auth-middleware'
import { apiSuccess, apiError } from '@/lib/api-response'
import { payOrderWithSavedMethod } from '@/lib/services/order-service'

export async function POST(
  request: NextRequest,
  { params }: { params: Promise<{ order_no: string }> },
) {
  try {
    const user = await getCurrentUser(request)
    const { order_no } = await params
    const body = await request.json()
    const { paymentMethodId } = body

    if (!paymentMethodId) {
      return apiError(400, '缺少 paymentMethodId 参数')
    }

    const result = await payOrderWithSavedMethod(
      order_no,
      paymentMethodId,
      user.id,
    )
    return apiSuccess(result)
  } catch (e) {
    if (e instanceof Response) return e
    const message = e instanceof Error ? e.message : '支付失败'
    return apiError(500, message)
  }
}
