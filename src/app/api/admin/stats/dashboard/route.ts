import { NextRequest } from 'next/server'
import { apiSuccess, apiError } from '@/lib/api-response'
import { getCurrentAdminUser } from '@/lib/middleware/auth-middleware'
import { prisma } from '@/lib/prisma'

export async function GET(request: NextRequest) {
  try {
    await getCurrentAdminUser(request)

    const now = new Date()
    const todayStart = new Date(now.getFullYear(), now.getMonth(), now.getDate())

    const [
      totalUsers,
      todayUsers,
      totalOrders,
      activeSubscriptions,
    ] = await Promise.all([
      prisma.users.count(),
      prisma.users.count({
        where: { created_at: { gte: todayStart } },
      }),
      prisma.orders.count(),
      prisma.user_subscriptions.count({
        where: { expire_at: { gt: now } },
      }),
    ])

    return apiSuccess({
      totalUsers,
      todayNewUsers: todayUsers,
      totalOrders,
      activeSubscriptions,
    })
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `获取仪表盘数据失败: ${String(error)}`)
  }
}
