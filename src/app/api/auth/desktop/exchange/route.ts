import { NextRequest } from 'next/server'
import { apiError, apiSuccess } from '@/lib/api-response'
import { consumeDesktopAuthTicket } from '@/lib/services/desktop-auth-ticket-service'

export async function POST(request: NextRequest) {
  try {
    const body = await request.json()
    const ticket = String(body?.ticket || '').trim()
    if (!ticket) {
      return apiError(400, '缺少 ticket')
    }

    const payload = consumeDesktopAuthTicket(ticket)
    if (!payload) {
      return apiError(401, 'ticket 无效或已过期')
    }

    return apiSuccess(payload)
  } catch (error) {
    return apiError(500, `桌面端登录票据兑换失败: ${String(error)}`)
  }
}
