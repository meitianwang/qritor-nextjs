import { NextRequest } from 'next/server'
import { prisma } from '@/lib/prisma'
import { apiSuccess, apiError } from '@/lib/api-response'
import { authService } from '@/lib/services/auth-service'
import { emailService } from '@/lib/services/email-service'

const VALID_TYPES = ['REGISTER', 'RESET_PASSWORD', 'DELETE_ACCOUNT'] as const
type CodeType = (typeof VALID_TYPES)[number]

export async function POST(request: NextRequest) {
  try {
    const body = await request.json()
    const { email, type } = body as { email?: string; type?: string }

    if (!email || !type) {
      return apiError(400, '请提供邮箱和验证码类型')
    }

    if (!VALID_TYPES.includes(type as CodeType)) {
      return apiError(400, `无效的验证码类型: ${type}`)
    }

    const normalizedEmail = email.toLowerCase()
    const codeType = type as CodeType

    // Type-specific validation
    if (codeType === 'REGISTER') {
      const existing = await prisma.users.findUnique({
        where: { email: normalizedEmail },
      })
      if (existing) {
        return apiError(400, '该邮箱已注册')
      }
    }

    if (codeType === 'RESET_PASSWORD') {
      const existing = await prisma.users.findUnique({
        where: { email: normalizedEmail },
      })
      if (!existing) {
        return apiError(400, '该邮箱未注册')
      }
    }

    // Check rate limit
    const codeKey = `${normalizedEmail}:${codeType}`
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
    switch (codeType) {
      case 'REGISTER':
        await emailService.sendRegisterCode(normalizedEmail, code)
        break
      case 'RESET_PASSWORD':
        await emailService.sendResetPasswordCode(normalizedEmail, code)
        break
      case 'DELETE_ACCOUNT':
        await emailService.sendDeleteAccountCode(normalizedEmail, code)
        break
    }

    return apiSuccess(null, '验证码已发送')
  } catch (error) {
    return apiError(500, `发送验证码失败: ${String(error)}`)
  }
}
