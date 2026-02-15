import { NextRequest } from 'next/server'
import { getCurrentUser } from '@/lib/middleware/auth-middleware'
import { apiSuccess, apiError } from '@/lib/api-response'
import { prisma } from '@/lib/prisma'
import { serializeUser } from '@/lib/serialize'
import { hashPassword } from '@/lib/services/auth-service'

export async function GET(request: NextRequest) {
  try {
    const user = await getCurrentUser(request)
    return apiSuccess(serializeUser(user))
  } catch (e) {
    if (e instanceof Response || (e && typeof e === 'object' && 'status' in e)) {
      return e as Response
    }
    return apiError(500, '获取用户信息失败')
  }
}

export async function PUT(request: NextRequest) {
  try {
    const user = await getCurrentUser(request)
    const body = await request.json()
    const { password, nickname, avatar } = body

    const updateData: Record<string, unknown> = {
      updated_at: new Date(),
    }

    if (nickname !== undefined) {
      updateData.nickname = nickname
    }

    if (avatar !== undefined) {
      updateData.avatar = avatar
    }

    if (password !== undefined && password !== '') {
      updateData.password = await hashPassword(password)
    }

    const updatedUser = await prisma.users.update({
      where: { id: user.id },
      data: updateData,
    })

    return apiSuccess(serializeUser(updatedUser))
  } catch (e) {
    if (e instanceof Response || (e && typeof e === 'object' && 'status' in e)) {
      return e as Response
    }
    return apiError(500, '更新用户信息失败')
  }
}
