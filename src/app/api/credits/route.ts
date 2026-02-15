import { NextRequest } from 'next/server'
import { getCurrentUser } from '@/lib/middleware/auth-middleware'
import { apiSuccess, apiError } from '@/lib/api-response'
import { getCredits } from '@/lib/services/credit-service'

export async function GET(request: NextRequest) {
  try {
    const user = await getCurrentUser(request)
    const credits = await getCredits(user.id)
    return apiSuccess(credits)
  } catch (e) {
    if (e instanceof Response || (e && typeof e === 'object' && 'status' in e)) {
      return e as Response
    }
    return apiError(500, '获取积分信息失败')
  }
}
