import { NextRequest } from 'next/server'
import { prisma } from '@/lib/prisma'
import { apiSuccess, apiError } from '@/lib/api-response'
import { hashPassword } from '@/lib/services/auth-service'
import { isPasswordStrong } from '@/lib/password-policy'

export async function POST(request: NextRequest) {
  try {
    const body = await request.json()
    const { email, code, new_password } = body as {
      email?: string
      code?: string
      new_password?: string
    }

    if (!email || !code || !new_password) {
      return apiError(400, '请提供邮箱、验证码和新密码')
    }

    const normalizedEmail = email.toLowerCase()

    // Validate password
    if (!isPasswordStrong(new_password)) {
      return apiError(400, '密码强度不足，请至少包含大写字母、小写字母、数字和特殊字符')
    }

    const codeKey = `${normalizedEmail}:RESET_PASSWORD`
    const hashedPassword = await hashPassword(new_password)

    try {
      await prisma.$transaction(async (tx) => {
        const user = await tx.users.findUnique({
          where: { email: normalizedEmail },
        })
        if (!user) {
          throw new Error('EMAIL_NOT_FOUND')
        }

        const storedCode = await tx.verification_codes.findUnique({
          where: { code_key: codeKey },
        })
        if (
          !storedCode ||
          storedCode.code !== code ||
          new Date() > storedCode.expires_at
        ) {
          throw new Error('INVALID_OR_EXPIRED_CODE')
        }

        await tx.users.update({
          where: { id: user.id },
          data: {
            password: hashedPassword,
            updated_at: new Date(),
          },
        })

        const consumeResult = await tx.verification_codes.deleteMany({
          where: {
            code_key: codeKey,
            code,
          },
        })
        if (consumeResult.count <= 0) {
          throw new Error('INVALID_OR_EXPIRED_CODE')
        }
      })
    } catch (error) {
      if (error instanceof Error && error.message === 'EMAIL_NOT_FOUND') {
        return apiError(400, '该邮箱未注册')
      }
      if (error instanceof Error && error.message === 'INVALID_OR_EXPIRED_CODE') {
        return apiError(400, '验证码无效或已过期')
      }
      throw error
    }

    return apiSuccess(null, '密码重置成功')
  } catch (error) {
    console.error('重置密码接口处理失败:', error)
    return apiError(500, '密码重置失败，请稍后重试')
  }
}
