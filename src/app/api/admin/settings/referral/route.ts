import { NextRequest } from 'next/server'
import { apiSuccess, apiError } from '@/lib/api-response'
import { getCurrentAdminUser } from '@/lib/middleware/auth-middleware'
import { systemConfigService } from '@/lib/services/system-config-service'

export async function GET(request: NextRequest) {
  try {
    await getCurrentAdminUser(request)

    const settings = await systemConfigService.getReferralSettings()

    return apiSuccess(settings)
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `获取推荐设置失败: ${String(error)}`)
  }
}

export async function PUT(request: NextRequest) {
  try {
    await getCurrentAdminUser(request)
    const body = await request.json()
    const { inviterReward, inviteeReward, rewardExpireDays, maxRewards } =
      body as {
        inviterReward?: number
        inviteeReward?: number
        rewardExpireDays?: number
        maxRewards?: number
      }

    await systemConfigService.updateReferralSettings(
      inviterReward,
      inviteeReward,
      rewardExpireDays,
      maxRewards,
    )

    const updatedSettings = await systemConfigService.getReferralSettings()

    return apiSuccess(updatedSettings, '推荐设置已更新')
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `更新推荐设置失败: ${String(error)}`)
  }
}
