import { NextRequest } from 'next/server'
import { getCurrentUser } from '@/lib/middleware/auth-middleware'
import { apiSuccess, apiError } from '@/lib/api-response'
import { payOrder } from '@/lib/services/order-service'

export async function POST(
  request: NextRequest,
  { params }: { params: Promise<{ order_no: string }> },
) {
  try {
    const user = await getCurrentUser(request)
    const { order_no } = await params

    const order = await payOrder(order_no, 'STRIPE', user.id)
    return apiSuccess(order)
  } catch (e) {
    if (e instanceof Response || (e && typeof e === 'object' && 'status' in e)) {
      return e as Response
    }
    const message = e instanceof Error ? e.message : '获取支付链接失败'
    if (message.includes('无权操作')) {
      return apiError(403, message)
    }
    return apiError(500, message)
  }
}

export async function GET() {
  return apiError(405, '该接口仅支持 POST 请求')
}
