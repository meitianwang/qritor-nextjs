import { NextRequest } from 'next/server'
import { prisma } from '@/lib/prisma'
import { apiSuccess, apiError } from '@/lib/api-response'

export async function GET(request: NextRequest) {
  try {
    const email = request.nextUrl.searchParams.get('email')
    if (!email) {
      return apiError(400, '请提供邮箱地址')
    }

    const user = await prisma.users.findUnique({
      where: { email: email.toLowerCase() },
    })

    // Return true if email is available (NOT found), false if taken
    return apiSuccess(!user)
  } catch (error) {
    return apiError(500, `检查邮箱失败: ${String(error)}`)
  }
}
