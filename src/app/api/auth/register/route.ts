import { NextRequest, NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { Prisma, type users } from '@/generated/prisma/client'
import { apiError } from '@/lib/api-response'
import { createAccessToken, getAccessTokenExpireMinutes, getRefreshTokenExpireDays } from '@/lib/auth'
import { authService, hashPassword } from '@/lib/services/auth-service'
import { initUserDefaultSubscription } from '@/lib/services/subscription-service'
import { processReferral } from '@/lib/services/referral-service'
import { isPasswordStrong } from '@/lib/password-policy'
import { rateLimiter } from '@/lib/services/rate-limit'

const REGISTER_CODE_ATTEMPT_LIMIT = 5
const REGISTER_CODE_ATTEMPT_WINDOW_MS = 5 * 60 * 1000

function getClientIp(request: NextRequest): string {
  const forwardedFor = request.headers.get('x-forwarded-for')
  if (forwardedFor) {
    const firstIp = forwardedFor.split(',')[0]?.trim()
    if (firstIp) return firstIp
  }
  const realIp = request.headers.get('x-real-ip')?.trim()
  if (realIp) return realIp
  return 'unknown'
}

function getWaitSeconds(resetAt: number): number {
  return Math.max(1, Math.ceil((resetAt - Date.now()) / 1000))
}

export async function POST(request: NextRequest) {
  try {
    const body = await request.json()
    const { email, password, code, nickname, referral_code, referralCode } = body as {
      email?: string
      password?: string
      code?: string
      nickname?: string
      referral_code?: string
      referralCode?: string
    }
    const normalizedReferralCode = referral_code || referralCode

    if (!email || !password || !code) {
      return apiError(400, '请提供邮箱、密码和验证码')
    }

    const normalizedEmail = email.toLowerCase()
    const codeKey = `${normalizedEmail}:REGISTER`
    const registerCodeRateKey = `register_code:${normalizedEmail}:${getClientIp(request)}`

    // Fast path for better UX
    const existing = await prisma.users.findUnique({
      where: { email: normalizedEmail },
    })
    if (existing) {
      return apiError(400, '该邮箱已注册')
    }

    // Validate password
    if (!isPasswordStrong(password)) {
      return apiError(400, '密码强度不足，请至少包含大写字母、小写字母、数字和特殊字符')
    }

    // Block if this email+IP has already hit invalid-code limit.
    const verifyGuard = rateLimiter.peek(
      registerCodeRateKey,
      REGISTER_CODE_ATTEMPT_LIMIT,
      REGISTER_CODE_ATTEMPT_WINDOW_MS,
    )
    if (!verifyGuard.allowed) {
      return apiError(
        429,
        `验证码错误次数过多，请在 ${getWaitSeconds(verifyGuard.resetAt)} 秒后再试`,
      )
    }

    let user: users
    try {
      user = await prisma.$transaction(async (tx) => {
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

        const existingInTx = await tx.users.findUnique({
          where: { email: normalizedEmail },
        })
        if (existingInTx) {
          throw new Error('EMAIL_ALREADY_EXISTS')
        }

        const hashedPassword = await hashPassword(password)
        const now = new Date()
        const createdUser = await tx.users.create({
          data: {
            email: normalizedEmail,
            password: hashedPassword,
            nickname: nickname || normalizedEmail.split('@')[0],
            role: 'USER',
            created_at: now,
            updated_at: now,
          },
        })

        await initUserDefaultSubscription(createdUser.id, tx)

        const consumeResult = await tx.verification_codes.deleteMany({
          where: {
            code_key: codeKey,
            code,
          },
        })
        if (consumeResult.count <= 0) {
          throw new Error('INVALID_OR_EXPIRED_CODE')
        }

        return createdUser
      })
    } catch (error) {
      if (error instanceof Error && error.message === 'INVALID_OR_EXPIRED_CODE') {
        const verifyFail = rateLimiter.consume(
          registerCodeRateKey,
          REGISTER_CODE_ATTEMPT_LIMIT,
          REGISTER_CODE_ATTEMPT_WINDOW_MS,
        )
        if (!verifyFail.allowed) {
          return apiError(
            429,
            `验证码错误次数过多，请在 ${getWaitSeconds(verifyFail.resetAt)} 秒后再试`,
          )
        }
        return apiError(400, '验证码无效或已过期')
      }
      if (error instanceof Error && error.message === 'EMAIL_ALREADY_EXISTS') {
        return apiError(400, '该邮箱已注册')
      }
      if (
        error instanceof Prisma.PrismaClientKnownRequestError &&
        error.code === 'P2002'
      ) {
        return apiError(400, '该邮箱已注册')
      }
      console.error('注册事务执行失败:', error)
      return apiError(500, '注册失败，请稍后重试')
    }

    // Registration succeeded; clear failed-code attempts for this key.
    rateLimiter.reset(registerCodeRateKey)

    // Process referral if provided
    if (normalizedReferralCode) {
      try {
        await processReferral(user.id, normalizedReferralCode)
      } catch (e) {
        console.error(`处理邀请码失败: ${String(e)}`)
      }
    }

    // Create tokens
    const accessToken = await createAccessToken(String(user.id))
    const refreshTokenResult = await authService.refreshToken.createToken(user.id)

    const ACCESS_TOKEN_EXPIRE_MINUTES = getAccessTokenExpireMinutes()
    const REFRESH_TOKEN_EXPIRE_DAYS = getRefreshTokenExpireDays()
    const expiresAt = new Date(Date.now() + ACCESS_TOKEN_EXPIRE_MINUTES * 60 * 1000).toISOString()

    const userData = {
      id: Number(user.id),
      nickname: user.nickname,
      email: user.email,
      avatar: user.avatar,
      role: user.role,
      accessToken,
      expiresAt,
    }

    // Set refresh token as httponly cookie
    const response = NextResponse.json({
      code: 200,
      data: userData,
      message: 'success',
    })

    response.cookies.set('refresh_token', refreshTokenResult.rawToken, {
      httpOnly: true,
      secure: process.env.COOKIE_SECURE !== 'false',
      sameSite: (process.env.COOKIE_SAMESITE as 'lax' | 'strict' | 'none') || 'lax',
      domain: process.env.COOKIE_DOMAIN || undefined,
      maxAge: REFRESH_TOKEN_EXPIRE_DAYS * 86400,
      path: '/',
    })

    return response
  } catch (error) {
    console.error('注册接口处理失败:', error)
    return apiError(500, '注册失败，请稍后重试')
  }
}
