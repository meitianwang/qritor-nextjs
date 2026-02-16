import { NextRequest, NextResponse } from 'next/server'
import { apiError } from '@/lib/api-response'
import { authService } from '@/lib/services/auth-service'

export async function POST(request: NextRequest) {
  try {
    const refreshToken = request.cookies.get('refresh_token')?.value

    // Revoke refresh token if present
    if (refreshToken) {
      await authService.refreshToken.validateAndRotate(refreshToken)
    }

    // Delete cookie
    const response = NextResponse.json({
      code: 200,
      data: null,
      message: '已退出登录',
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
    return apiError(500, `退出登录失败: ${String(error)}`)
  }
}
