import { NextRequest } from 'next/server'
import { apiSuccess, apiError } from '@/lib/api-response'
import { getCurrentAdminUser } from '@/lib/middleware/auth-middleware'
import { prisma } from '@/lib/prisma'
import { serializeUser } from '@/lib/serialize'
import { Prisma } from '@/generated/prisma/client'

export async function GET(request: NextRequest) {
  try {
    await getCurrentAdminUser(request)

    const url = new URL(request.url)
    const page = parseInt(url.searchParams.get('page') || '0')
    const size = Math.min(100, Math.max(1, parseInt(url.searchParams.get('size') || '20')))
    const keyword = url.searchParams.get('keyword') || url.searchParams.get('search') || ''

    const where: Prisma.usersWhereInput = keyword
      ? {
          OR: [
            { email: { contains: keyword } },
            { nickname: { contains: keyword } },
          ],
        }
      : {}

    const [users, total] = await Promise.all([
      prisma.users.findMany({
        where,
        select: {
          id: true,
          nickname: true,
          email: true,
          avatar: true,
          role: true,
          created_at: true,
          last_login_at: true,
        },
        orderBy: { created_at: 'desc' },
        skip: page * size,
        take: size,
      }),
      prisma.users.count({ where }),
    ])

    return apiSuccess({
      content: users.map(serializeUser),
      totalPages: Math.ceil(total / size),
    })
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `获取用户列表失败: ${String(error)}`)
  }
}
