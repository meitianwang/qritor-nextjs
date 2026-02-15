import { NextRequest } from 'next/server'
import { getCurrentUser } from '@/lib/middleware/auth-middleware'
import { apiSuccess, apiError } from '@/lib/api-response'
import { createOrder } from '@/lib/services/order-service'

export async function POST(request: NextRequest) {
  try {
    const user = await getCurrentUser(request)
    const { searchParams } = new URL(request.url)
    const planName = searchParams.get('planName')

    if (!planName) {
      return apiError(400, '缺少 planName 参数')
    }

    const order = await createOrder(user.id, planName)
    return apiSuccess(order)
  } catch (e) {
    if (e instanceof Response || (e && typeof e === 'object' && 'status' in e)) {
      return e as Response
    }
    const message = e instanceof Error ? e.message : '创建订单失败'
    return apiError(500, message)
  }
}
