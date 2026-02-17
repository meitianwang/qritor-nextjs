import { NextRequest } from 'next/server'
import { getCurrentUser } from '@/lib/middleware/auth-middleware'
import { apiSuccess, apiError } from '@/lib/api-response'
import { createSetupIntentForUser } from '@/lib/services/payment-method-service'

export async function POST(request: NextRequest) {
  try {
    const user = await getCurrentUser(request)
    const result = await createSetupIntentForUser(user.id, user.email)
    return apiSuccess(result)
  } catch (e) {
    if (e instanceof Response) return e
    return apiError(500, '创建 SetupIntent 失败')
  }
}
