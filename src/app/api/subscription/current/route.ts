import { NextRequest } from 'next/server'
import { getCurrentUser } from '@/lib/middleware/auth-middleware'
import { apiSuccess, apiError } from '@/lib/api-response'
import { getUserSubscription } from '@/lib/services/subscription-service'

export async function GET(request: NextRequest) {
  try {
    const user = await getCurrentUser(request)
    const subscription = await getUserSubscription(user.id)

    if (!subscription) {
      return apiSuccess({
        planName: 'FREE',
        displayName: 'Free',
        price: 0,
        monthlyCredits: 0,
        maxProjects: 1,
        status: null,
        features: [],
      })
    }

    return apiSuccess(subscription)
  } catch (e) {
    if (e instanceof Response || (e && typeof e === 'object' && 'status' in e)) {
      return e as Response
    }
    return apiError(500, '获取订阅信息失败')
  }
}
