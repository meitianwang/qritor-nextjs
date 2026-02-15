import { NextRequest } from 'next/server'
import { getCurrentUser } from '@/lib/middleware/auth-middleware'
import { apiSuccess, apiError } from '@/lib/api-response'
import { getOrderByOrderNo, cancelOrder } from '@/lib/services/order-service'

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ order_no: string }> },
) {
  try {
    await getCurrentUser(request)
    const { order_no } = await params

    const order = await getOrderByOrderNo(order_no)
    return apiSuccess(order)
  } catch (e) {
    if (e instanceof Response || (e && typeof e === 'object' && 'status' in e)) {
      return e as Response
    }
    const message = e instanceof Error ? e.message : '获取订单失败'
    return apiError(500, message)
  }
}

export async function DELETE(
  request: NextRequest,
  { params }: { params: Promise<{ order_no: string }> },
) {
  try {
    const user = await getCurrentUser(request)
    const { order_no } = await params

    await cancelOrder(order_no, user.id)
    return apiSuccess(null, '订单已取消')
  } catch (e) {
    if (e instanceof Response || (e && typeof e === 'object' && 'status' in e)) {
      return e as Response
    }
    const message = e instanceof Error ? e.message : '取消订单失败'
    return apiError(500, message)
  }
}
