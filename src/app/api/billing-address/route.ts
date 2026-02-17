import { NextRequest } from 'next/server'
import { getCurrentUser } from '@/lib/middleware/auth-middleware'
import { apiSuccess, apiError } from '@/lib/api-response'
import { getBillingAddress, updateBillingAddress } from '@/lib/services/payment-method-service'

export async function GET(request: NextRequest) {
  try {
    const user = await getCurrentUser(request)
    const address = await getBillingAddress(user.id)
    return apiSuccess(address)
  } catch (e) {
    if (e instanceof Response) return e
    return apiError(500, '获取账单地址失败')
  }
}

export async function PUT(request: NextRequest) {
  try {
    const user = await getCurrentUser(request)
    const body = await request.json()
    const { country, state, city, line1 } = body

    if (!country || !line1) {
      return apiError(400, '国家和详细地址为必填项')
    }

    await updateBillingAddress(user.id, user.email, {
      country,
      state: state || '',
      city: city || '',
      line1,
    })

    return apiSuccess(null, '账单地址已更新')
  } catch (e) {
    if (e instanceof Response) return e
    return apiError(500, '更新账单地址失败')
  }
}
