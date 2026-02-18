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
    const remaining = await authService.verificationCode.cooldownRemaining(codeKey)
    if (remaining > 0) {
      return apiError(429, `请等待 ${remaining} 秒后再试`)
    }

    // Generate code
    const code = await authService.verificationCode.generate(codeKey)
    if (!code) {
      return apiError(429, '请稍后再试')
    }

    try {
      await emailService.sendResetPasswordCode(normalizedEmail, code)
    } catch (error) {
      try {
        await prisma.verification_codes.deleteMany({
          where: { code_key: codeKey, code },
        })
      } catch (cleanupError) {
        console.error('找回密码验证码发送失败后清理记录失败:', cleanupError)
      }
      console.error('发送找回密码验证码失败:', error)
      return apiError(500, '发送验证码失败，请稍后重试')
    }

    return apiSuccess(null, '验证码已发送')
  } catch (error) {
    console.error('找回密码发送验证码接口处理失败:', error)
    return apiError(500, '发送验证码失败，请稍后重试')
  }
}
