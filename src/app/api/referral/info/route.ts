import { NextRequest } from 'next/server'
import { getCurrentUser } from '@/lib/middleware/auth-middleware'
import { apiSuccess, apiError } from '@/lib/api-response'
import { getReferralInfo } from '@/lib/services/referral-service'

export async function GET(request: NextRequest) {
  try {
    const user = await getCurrentUser(request)
    const info = await getReferralInfo(user.id)
    return apiSuccess(info)
  } catch (e) {
    if (e instanceof Response || (e && typeof e === 'object' && 'status' in e)) {
      return e as Response
    }
    return apiError(500, '获取邀请信息失败')
  }
}
