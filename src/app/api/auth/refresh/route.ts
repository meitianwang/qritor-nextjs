import { NextRequest, NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { apiSuccess, apiError } from '@/lib/api-response'
import { createAccessToken, getAccessTokenExpireMinutes, getRefreshTokenExpireDays } from '@/lib/auth'
import { authService } from '@/lib/services/auth-service'

export async function POST(request: NextRequest) {
  try {
    let body: { refreshToken?: string; client?: string } = {}
    try {
      body = await request.json()
    } catch {
      // Body may be empty for web clients relying on cookie
    }

    // Body takes priority (for desktop), otherwise read from cookie
    const refreshToken = body.refreshToken || request.cookies.get('refresh_token')?.value
    const client = body.client

    if (!refreshToken) {
      return apiError(401, '缺少 refresh token')
    }

    // Validate and rotate
    const rotateResult = await authService.refreshToken.validateAndRotate(refreshToken)

    // Fire-and-forget: clean up expired/revoked tokens
    authService.refreshToken.cleanupExpiredTokens().catch(() => {})
    if (!rotateResult) {
      return apiError(401, 'refresh token 无效或已过期')
    }

    // Get user
    const user = await prisma.users.findUnique({
      where: { id: rotateResult.userId },
    })
    if (!user) {
      return apiError(401, '用户不存在')
    }

    // Create new access token
    const accessToken = await createAccessToken(String(user.id))
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
        refreshToken: rotateResult.rawToken,
      })
    }

    // For web client, set new cookie
    const response = NextResponse.json({
      code: 200,
      data: userData,
      message: 'success',
    })

    response.cookies.set('refresh_token', rotateResult.rawToken, {
      httpOnly: true,
      secure: process.env.COOKIE_SECURE !== 'false',
      sameSite: (process.env.COOKIE_SAMESITE as 'lax' | 'strict' | 'none') || 'lax',
      domain: process.env.COOKIE_DOMAIN || undefined,
      maxAge: REFRESH_TOKEN_EXPIRE_DAYS * 86400,
      path: '/',
    })

    return response
  } catch (error) {
    return apiError(500, `刷新令牌失败: ${String(error)}`)
  }
}
