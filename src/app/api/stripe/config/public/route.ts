import { apiSuccess, apiError } from '@/lib/api-response'
import { systemConfigService, ConfigKeys } from '@/lib/services/system-config-service'

export async function GET() {
  try {
    const publishableKey = await systemConfigService.getConfig(
      ConfigKeys.STRIPE_PUBLISHABLE_KEY,
    )

    return apiSuccess({
      publishableKey: publishableKey ?? null,
    })
  } catch (e) {
    console.error('获取 Stripe 公共配置失败:', e)
    return apiError(500, '获取 Stripe 配置失败')
  }
}
