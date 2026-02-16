import { NextRequest } from 'next/server'
import { apiSuccess, apiError } from '@/lib/api-response'
import { getCurrentAdminUser } from '@/lib/middleware/auth-middleware'

export async function GET(request: NextRequest) {
  try {
    await getCurrentAdminUser(request)

    const gatewayApiKey = process.env.AI_GATEWAY_API_KEY || ''

    if (!gatewayApiKey) {
      return apiSuccess({
        configured: false,
        provider: 'vercel-ai-gateway',
        hasApiKey: false,
        status: 'not_configured',
      })
    }

    return apiSuccess({
      configured: true,
      provider: 'vercel-ai-gateway',
      hasApiKey: true,
      status: 'configured',
    })
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `获取 AI Gateway 状态失败: ${String(error)}`)
  }
}
