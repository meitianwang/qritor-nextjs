import { NextRequest } from 'next/server'
import { apiSuccess, apiError } from '@/lib/api-response'
import { getCurrentAdminUser } from '@/lib/middleware/auth-middleware'
import { sendNotificationToAll } from '@/lib/services/notification-service'

export async function POST(request: NextRequest) {
  try {
    await getCurrentAdminUser(request)
    const body = await request.json()
    const { subject, content } = body as {
      subject?: string
      content?: string
    }

    if (!subject || !content) {
      return apiError(400, '缺少必要字段: subject, content')
    }

    const result = await sendNotificationToAll(subject, content)

    return apiSuccess(result)
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `发送通知失败: ${String(error)}`)
  }
}
