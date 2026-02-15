import { NextRequest, NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { PrismaClient } from '@/generated/prisma'
import { apiError } from '@/lib/api-response'
import { getCurrentUser } from '@/lib/middleware/auth-middleware'
import { authService } from '@/lib/services/auth-service'

type TransactionClient = Omit<PrismaClient, '$connect' | '$disconnect' | '$on' | '$transaction' | '$use' | '$extends'>

export async function POST(request: NextRequest) {
  try {
    const user = await getCurrentUser(request)

    const body = await request.json()
    const { code } = body as { code?: string }

    if (!code) {
      return apiError(400, '请提供验证码')
    }

    // Verify code
    const codeKey = `${user.email}:DELETE_ACCOUNT`
    const codeValid = authService.verificationCode.validate(codeKey, code)
    if (!codeValid) {
      return apiError(400, '验证码无效或已过期')
    }

    const userId = user.id

    // Cascade delete all user data
    await prisma.$transaction(async (tx: TransactionClient) => {
      // Delete refresh tokens
      await tx.refresh_tokens.deleteMany({ where: { user_id: userId } })

      // Delete user subscriptions
      await tx.user_subscriptions.deleteMany({ where: { user_id: userId } })

      // Delete referral rewards
      await tx.referral_rewards.deleteMany({ where: { user_id: userId } })

      // Delete boost pack purchases
      await tx.boost_pack_purchases.deleteMany({ where: { user_id: userId } })

      // Delete orders
      await tx.orders.deleteMany({ where: { user_id: userId } })

      // Delete referrals (both as inviter and invitee)
      await tx.referrals.deleteMany({
        where: {
          OR: [{ inviter_id: userId }, { invitee_id: userId }],
        },
      })

      // Delete novel creation methods
      await tx.novel_creation_method.deleteMany({ where: { user_id: userId } })

      // Delete credit transactions
      await tx.credit_transactions.deleteMany({ where: { user_id: userId } })

      // Delete user settings
      await tx.user_settings.deleteMany({ where: { user_id: userId } })

      // Delete user
      await tx.users.delete({ where: { id: userId } })
    })

    // Clear cookie
    const response = NextResponse.json({
      code: 200,
      data: null,
      message: '账号已删除',
    })

    response.cookies.set('refresh_token', '', {
      httpOnly: true,
      secure: process.env.COOKIE_SECURE !== 'false',
      sameSite: (process.env.COOKIE_SAMESITE as 'lax' | 'strict' | 'none') || 'lax',
      domain: process.env.COOKIE_DOMAIN || undefined,
      maxAge: 0,
      path: '/api/auth',
    })

    return response
  } catch (error) {
    if (error instanceof Response) {
      return error
    }
    return apiError(500, `删除账号失败: ${String(error)}`)
  }
}
