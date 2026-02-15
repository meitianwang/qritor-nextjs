import { NextRequest } from 'next/server'
import { apiSuccess, apiError } from '@/lib/api-response'
import { getCurrentAdminUser } from '@/lib/middleware/auth-middleware'
import { systemConfigService } from '@/lib/services/system-config-service'

export async function GET(request: NextRequest) {
  try {
    await getCurrentAdminUser(request)

    const settings = await systemConfigService.getPaymentSettings()

    return apiSuccess(settings)
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `获取支付设置失败: ${String(error)}`)
  }
}

export async function PUT(request: NextRequest) {
  try {
    await getCurrentAdminUser(request)
    const body = await request.json()
    const { stripeSecretKey, stripePublishableKey, stripeWebhookSecret } =
      body as {
        stripeSecretKey?: string
        stripePublishableKey?: string
        stripeWebhookSecret?: string
      }

    await systemConfigService.updatePaymentSettings(
      stripeSecretKey,
      stripePublishableKey,
      stripeWebhookSecret,
    )

    const updatedSettings = await systemConfigService.getPaymentSettings()

    return apiSuccess(updatedSettings, '支付设置已更新')
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `更新支付设置失败: ${String(error)}`)
  }
}
