import { NextRequest } from 'next/server'
import { apiSuccess, apiError } from '@/lib/api-response'
import { getCurrentAdminUser } from '@/lib/middleware/auth-middleware'
import { getUsersWithNotificationsEnabled } from '@/lib/services/notification-service'
import { prisma } from '@/lib/prisma'

export async function GET(request: NextRequest) {
  try {
    await getCurrentAdminUser(request)

    const [notifiableUsers, totalUsers] = await Promise.all([
      getUsersWithNotificationsEnabled(),
      prisma.users.count(),
    ])

    return apiSuccess({
      totalUsers,
      notifiableUsers: notifiableUsers.length,
      disabledUsers: totalUsers - notifiableUsers.length,
    })
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `获取通知统计失败: ${String(error)}`)
  }
}
