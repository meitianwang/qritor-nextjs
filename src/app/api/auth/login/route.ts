import { NextRequest, NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { apiSuccess, apiError } from '@/lib/api-response'
import { createAccessToken, getAccessTokenExpireMinutes, getRefreshTokenExpireDays } from '@/lib/auth'
import { authService, verifyPassword } from '@/lib/services/auth-service'

export async function POST(request: NextRequest) {
  try {
    const body = await request.json()
    const { email, password, client } = body as {
      email?: string
      password?: string
      client?: string
    }

    if (!email || !password) {
      return apiError(400, '请提供邮箱和密码')
    }

    const normalizedEmail = email.toLowerCase()

    const user = await prisma.users.findUnique({
      where: { email: normalizedEmail },
    })
    if (!user) {
      return apiError(401, '邮箱或密码错误')
    }

    const passwordValid = await verifyPassword(password, user.password)
    if (!passwordValid) {
      return apiError(401, '邮箱或密码错误')
    }

    // Update last login time
    await prisma.users.update({
      where: { id: user.id },
      data: { last_login_at: new Date() },
    })

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

    // For desktop client, include refresh token in response body
    if (client === 'desktop') {
      return apiSuccess({
        ...userData,
        refreshToken: refreshTokenResult.rawToken,
        expiresIn: REFRESH_TOKEN_EXPIRE_DAYS * 86400,
        user: {
          id: Number(user.id),
          nickname: user.nickname,
          email: user.email,
          avatar: user.avatar,
          role: user.role,
        },
      })
    }

    // For web client, set refresh token as httponly cookie
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
      path: '/api/auth',
    })

    return response
  } catch (error) {
    return apiError(500, `登录失败: ${String(error)}`)
  }
}
