import { NextRequest } from 'next/server'
import { apiSuccess, apiError } from '@/lib/api-response'
import { getCurrentUser } from '@/lib/middleware/auth-middleware'
import { authService } from '@/lib/services/auth-service'
import { emailService } from '@/lib/services/email-service'

export async function POST(request: NextRequest) {
  try {
    const user = await getCurrentUser(request)

    // Check rate limit
    const codeKey = `${user.email}:DELETE_ACCOUNT`
    const remaining = authService.verificationCode.cooldownRemaining(codeKey)
    if (remaining > 0) {
      return apiError(429, `请等待 ${remaining} 秒后再试`)
    }

    // Generate code
    const code = authService.verificationCode.generate(codeKey)
    if (!code) {
      return apiError(429, '请稍后再试')
    }

    // Send email
    await emailService.sendDeleteAccountCode(user.email, code)

    return apiSuccess(null, '验证码已发送')
  } catch (error) {
    if (error instanceof Response) {
      return error
    }
    return apiError(500, `发送验证码失败: ${String(error)}`)
  }
}
