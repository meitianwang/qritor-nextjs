import { apiSuccess, apiError } from '@/lib/api-response'
import { systemConfigService } from '@/lib/services/system-config-service'

export async function GET() {
  try {
    const settings = await systemConfigService.getReferralSettings()
    return apiSuccess({
      ...settings,
      // Backward-compatible aliases for existing frontend fields.
      maxReward: settings.maxRewards,
      monthlyLimit: settings.maxRewards,
    })
  } catch (e) {
    console.error('获取邀请配置失败:', e)
    return apiError(500, '获取邀请配置失败')
  }
}
