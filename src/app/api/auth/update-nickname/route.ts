import { NextRequest } from 'next/server'
import { prisma } from '@/lib/prisma'
import { apiSuccess, apiError } from '@/lib/api-response'
import { getCurrentUser } from '@/lib/middleware/auth-middleware'

export async function POST(request: NextRequest) {
  try {
    const user = await getCurrentUser(request)

    const body = await request.json()
    const { nickname } = body as { nickname?: string }

    if (!nickname) {
      return apiError(400, '请提供昵称')
    }

    if (nickname.length < 2 || nickname.length > 20) {
      return apiError(400, '昵称长度需要在2-20个字符之间')
    }

    const updatedUser = await prisma.users.update({
      where: { id: user.id },
      data: {
        nickname,
        updated_at: new Date(),
      },
    })

    return apiSuccess({
      id: Number(updatedUser.id),
      nickname: updatedUser.nickname,
      email: updatedUser.email,
      avatar: updatedUser.avatar,
      role: updatedUser.role,
    })
  } catch (error) {
    if (error instanceof Response) {
      return error
    }
    return apiError(500, `更新昵称失败: ${String(error)}`)
  }
}
