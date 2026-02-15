import { NextRequest } from 'next/server'
import { apiSuccess, apiError } from '@/lib/api-response'
import { validateCode } from '@/lib/services/referral-service'

export async function GET(
  _request: NextRequest,
  { params }: { params: Promise<{ code: string }> },
) {
  try {
    const { code } = await params

    if (!code) {
      return apiError(400, '缺少邀请码')
    }

    const valid = await validateCode(code)
    return apiSuccess({ valid })
  } catch (e) {
    console.error('验证邀请码失败:', e)
    return apiError(500, '验证邀请码失败')
  }
}
