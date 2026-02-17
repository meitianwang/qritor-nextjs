import { NextRequest } from 'next/server'
import { getCurrentUser } from '@/lib/middleware/auth-middleware'
import { apiSuccess, apiError } from '@/lib/api-response'
import { removePaymentMethod } from '@/lib/services/payment-method-service'

export async function DELETE(
  request: NextRequest,
  { params }: { params: Promise<{ pm_id: string }> },
) {
  try {
    const user = await getCurrentUser(request)
    const { pm_id } = await params
    await removePaymentMethod(user.id, pm_id)
    return apiSuccess(null, '支付方式已删除')
  } catch (e) {
    if (e instanceof Response) return e
    const msg = e instanceof Error ? e.message : '删除支付方式失败'
    return apiError(400, msg)
  }
}
