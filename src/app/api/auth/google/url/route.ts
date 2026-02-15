import { NextRequest } from 'next/server'
import { apiSuccess, apiError } from '@/lib/api-response'

export async function GET(request: NextRequest) {
  try {
    const redirectUri = request.nextUrl.searchParams.get('redirect_uri')
    if (!redirectUri) {
      return apiError(400, '请提供 redirect_uri')
    }

    const clientId = process.env.GOOGLE_CLIENT_ID
    if (!clientId) {
      return apiError(500, 'Google OAuth 未配置')
    }

    const params = new URLSearchParams({
      client_id: clientId,
      redirect_uri: redirectUri,
      response_type: 'code',
      scope: 'openid email profile',
      access_type: 'offline',
      prompt: 'consent',
    })

    const url = `https://accounts.google.com/o/oauth2/v2/auth?${params.toString()}`

    return apiSuccess({ url })
  } catch (error) {
    return apiError(500, `获取 Google 登录链接失败: ${String(error)}`)
  }
}
