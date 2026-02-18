import { NextRequest, NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { Prisma } from '@/generated/prisma/client'
import { apiError } from '@/lib/api-response'
import { getCurrentUser } from '@/lib/middleware/auth-middleware'
import { deleteUserWithRelationsInTx } from '@/lib/services/user-deletion-service'

type TransactionClient = Prisma.TransactionClient

export async function POST(request: NextRequest) {
  try {
    const user = await getCurrentUser(request)

    const body = await request.json()
    const { code } = body as { code?: string }

    if (!code) {
      return apiError(400, '请提供验证码')
    }

    const codeKey = `${user.email}:DELETE_ACCOUNT`

    const userId = user.id

    try {
      await prisma.$transaction(async (tx: TransactionClient) => {
        const storedCode = await tx.verification_codes.findUnique({
          where: { code_key: codeKey },
        })
        if (
          !storedCode ||
          storedCode.code !== code ||
          new Date() > storedCode.expires_at
        ) {
          throw new Error('INVALID_OR_EXPIRED_CODE')
        }

        const consumeResult = await tx.verification_codes.deleteMany({
          where: {
            code_key: codeKey,
            code,
          },
        })
        if (consumeResult.count <= 0) {
          throw new Error('INVALID_OR_EXPIRED_CODE')
        }

        await deleteUserWithRelationsInTx(tx, userId, { userEmail: user.email })
      })
    } catch (error) {
      if (error instanceof Error && error.message === 'INVALID_OR_EXPIRED_CODE') {
        return apiError(400, '验证码无效或已过期')
      }
      throw error
    }

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
      path: '/',
    })

    return response
  } catch (error) {
    if (error instanceof Response) {
      return error
    }
    console.error('删除账号接口处理失败:', error)
    return apiError(500, '删除账号失败，请稍后重试')
  }
}
