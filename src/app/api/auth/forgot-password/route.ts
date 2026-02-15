import { NextRequest } from 'next/server'
import { prisma } from '@/lib/prisma'
import { apiSuccess, apiError } from '@/lib/api-response'
import { authService } from '@/lib/services/auth-service'
import { emailService } from '@/lib/services/email-service'

export async function POST(request: NextRequest) {
  try {
    const body = await request.json()
    const { email } = body as { email?: string }

    if (!email) {
      return apiError(400, '请提供邮箱地址')
    }

    const normalizedEmail = email.toLowerCase()

    // Check email exists
    const user = await prisma.users.findUnique({
      where: { email: normalizedEmail },
    })
    if (!user) {
      return apiError(400, '该邮箱未注册')
    }

    // Check rate limit
    const codeKey = `${normalizedEmail}:RESET_PASSWORD`
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
    await emailService.sendResetPasswordCode(normalizedEmail, code)

    return apiSuccess(null, '验证码已发送')
  } catch (error) {
    return apiError(500, `发送验证码失败: ${String(error)}`)
  }
}
