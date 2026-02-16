import { NextRequest } from 'next/server'
import { apiSuccess, apiError, apiNotFound } from '@/lib/api-response'
import { getCurrentAdminUser } from '@/lib/middleware/auth-middleware'
import { prisma } from '@/lib/prisma'
import { serializeCamel } from '@/lib/serialize'

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ user_id: string }> },
) {
  try {
    await getCurrentAdminUser(request)
    const { user_id } = await params

    const user = await prisma.users.findUnique({
      where: { id: BigInt(user_id) },
      select: {
        id: true,
        nickname: true,
        email: true,
        avatar: true,
        role: true,
        created_at: true,
        updated_at: true,
        last_login_at: true,
      },
    })

    if (!user) {
      return apiNotFound('用户不存在')
    }

    return apiSuccess(serializeCamel(user))
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `获取用户详情失败: ${String(error)}`)
  }
}

export async function PUT(
  request: NextRequest,
  { params }: { params: Promise<{ user_id: string }> },
) {
  try {
    await getCurrentAdminUser(request)
    const { user_id } = await params
    const body = await request.json()
    const { role, nickname } = body as { role?: string; nickname?: string }

    const existing = await prisma.users.findUnique({
      where: { id: BigInt(user_id) },
    })
    if (!existing) {
      return apiNotFound('用户不存在')
    }

    const updateData: Record<string, unknown> = { updated_at: new Date() }
    if (role !== undefined) updateData.role = role
    if (nickname !== undefined) updateData.nickname = nickname

    const updated = await prisma.users.update({
      where: { id: BigInt(user_id) },
      data: updateData,
      select: {
        id: true,
        nickname: true,
        email: true,
        avatar: true,
        role: true,
        created_at: true,
        updated_at: true,
        last_login_at: true,
      },
    })

    return apiSuccess(serializeCamel(updated))
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `更新用户失败: ${String(error)}`)
  }
}

export async function DELETE(
  request: NextRequest,
  { params }: { params: Promise<{ user_id: string }> },
) {
  try {
    await getCurrentAdminUser(request)
    const { user_id } = await params

    const existing = await prisma.users.findUnique({
      where: { id: BigInt(user_id) },
    })
    if (!existing) {
      return apiNotFound('用户不存在')
    }

    // Cascade delete: remove related records first
    const userId = BigInt(user_id)
    await prisma.$transaction([
      prisma.credit_transactions.deleteMany({ where: { user_id: userId } }),
      prisma.user_subscriptions.deleteMany({ where: { user_id: userId } }),
      prisma.referral_rewards.deleteMany({ where: { user_id: userId } }),
      prisma.boost_pack_purchases.deleteMany({ where: { user_id: userId } }),
      prisma.orders.deleteMany({ where: { user_id: userId } }),
      prisma.user_settings.deleteMany({ where: { user_id: userId } }),
      prisma.refresh_tokens.deleteMany({ where: { user_id: userId } }),
      prisma.users.delete({ where: { id: userId } }),
    ])

    return apiSuccess(null, '用户已删除')
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `删除用户失败: ${String(error)}`)
  }
}
