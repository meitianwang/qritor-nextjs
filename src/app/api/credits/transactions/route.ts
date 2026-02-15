import { NextRequest } from 'next/server'
import { getCurrentUser } from '@/lib/middleware/auth-middleware'
import { apiSuccess, apiError } from '@/lib/api-response'
import { getTransactions } from '@/lib/services/credit-service'

export async function GET(request: NextRequest) {
  try {
    const user = await getCurrentUser(request)
    const { searchParams } = new URL(request.url)

    const page = parseInt(searchParams.get('page') ?? '0', 10)
    const size = parseInt(searchParams.get('size') ?? '20', 10)

    const transactions = await getTransactions(user.id, page, size)
    return apiSuccess(transactions)
  } catch (e) {
    if (e instanceof Response || (e && typeof e === 'object' && 'status' in e)) {
      return e as Response
    }
    return apiError(500, '获取积分交易记录失败')
  }
}
