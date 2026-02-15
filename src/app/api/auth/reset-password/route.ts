import { NextRequest } from 'next/server'
import { prisma } from '@/lib/prisma'
import { apiSuccess, apiError } from '@/lib/api-response'
import { authService, hashPassword } from '@/lib/services/auth-service'

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

    // Verify code
    const codeKey = `${normalizedEmail}:RESET_PASSWORD`
    const codeValid = authService.verificationCode.validate(codeKey, code)
    if (!codeValid) {
      return apiError(400, '验证码无效或已过期')
    }

    // Validate password
    if (new_password.length < 8) {
      return apiError(400, '密码长度不能少于8个字符')
    }

    // Find user
    const user = await prisma.users.findUnique({
      where: { email: normalizedEmail },
    })
    if (!user) {
      return apiError(400, '该邮箱未注册')
    }

    // Hash and update password
    const hashedPassword = await hashPassword(new_password)
    await prisma.users.update({
      where: { id: user.id },
      data: {
        password: hashedPassword,
        updated_at: new Date(),
      },
    })

    return apiSuccess(null, '密码重置成功')
  } catch (error) {
    return apiError(500, `密码重置失败: ${String(error)}`)
  }
}
