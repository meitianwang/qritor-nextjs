import { NextRequest } from 'next/server'
import { apiSuccess, apiError } from '@/lib/api-response'
import { getCurrentAdminUser } from '@/lib/middleware/auth-middleware'

export async function GET(request: NextRequest) {
  try {
    await getCurrentAdminUser(request)

    const proxyUrl = process.env.PROXY_URL || ''
    const proxyApiKey = process.env.PROXY_API_KEY || ''

    if (!proxyUrl) {
      return apiSuccess({
        configured: false,
        proxyUrl: null,
        hasApiKey: false,
        status: 'not_configured',
      })
    }

    // Test proxy connectivity
    let status = 'unknown'
    try {
      const testUrl = `${proxyUrl.replace(/\/+$/, '')}/v1/models`
      const headers: Record<string, string> = {}
      if (proxyApiKey) {
        headers['Authorization'] = `Bearer ${proxyApiKey}`
      }

      const response = await fetch(testUrl, {
        method: 'GET',
        headers,
        signal: AbortSignal.timeout(10000),
      })

      status = response.ok ? 'connected' : `error_${response.status}`
    } catch {
      status = 'unreachable'
    }

    return apiSuccess({
      configured: true,
      proxyUrl: proxyUrl.slice(0, 30) + '...',
      hasApiKey: !!proxyApiKey,
      status,
    })
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `获取代理状态失败: ${String(error)}`)
  }
}
