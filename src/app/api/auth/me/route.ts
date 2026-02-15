import { NextRequest } from 'next/server'
import { apiSuccess, apiError } from '@/lib/api-response'
import { getCurrentUser } from '@/lib/middleware/auth-middleware'

export async function GET(request: NextRequest) {
  try {
    const user = await getCurrentUser(request)

    return apiSuccess({
      id: Number(user.id),
      nickname: user.nickname,
      email: user.email,
      avatar: user.avatar,
      role: user.role,
    })
  } catch (error) {
    // getCurrentUser throws apiUnauthorized() which is a NextResponse
    if (error instanceof Response) {
      return error
    }
    return apiError(500, `获取用户信息失败: ${String(error)}`)
  }
}
