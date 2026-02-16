import { NextRequest, NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { apiSuccess, apiError } from '@/lib/api-response'
import { createAccessToken, getAccessTokenExpireMinutes, getRefreshTokenExpireDays } from '@/lib/auth'
import { authService, hashPassword } from '@/lib/services/auth-service'
import { initUserDefaultSubscription } from '@/lib/services/subscription-service'
import { processReferral } from '@/lib/services/referral-service'

export async function POST(request: NextRequest) {
  try {
    const body = await request.json()
    const { email, password, code, nickname, referral_code } = body as {
      email?: string
      password?: string
      code?: string
      nickname?: string
      referral_code?: string
    }

    if (!email || !password || !code) {
      return apiError(400, '请提供邮箱、密码和验证码')
    }

    const normalizedEmail = email.toLowerCase()

    // Check email not taken
    const existing = await prisma.users.findUnique({
      where: { email: normalizedEmail },
    })
    if (existing) {
      return apiError(400, '该邮箱已注册')
    }

    // Verify code
    const codeKey = `${normalizedEmail}:REGISTER`
    const codeValid = authService.verificationCode.validate(codeKey, code)
    if (!codeValid) {
      return apiError(400, '验证码无效或已过期')
    }

    // Validate password
    if (password.length < 8) {
      return apiError(400, '密码长度不能少于8个字符')
    }

    // Hash password
    const hashedPassword = await hashPassword(password)

    // Create user
    const now = new Date()
    const user = await prisma.users.create({
      data: {
        email: normalizedEmail,
        password: hashedPassword,
        nickname: nickname || normalizedEmail.split('@')[0],
        role: 'USER',
        created_at: now,
        updated_at: now,
      },
    })

    // Initialize default subscription
    await initUserDefaultSubscription(user.id)

    // Process referral if provided
    if (referral_code) {
      try {
        await processReferral(user.id, referral_code)
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
    return apiError(500, `注册失败: ${String(error)}`)
  }
}
