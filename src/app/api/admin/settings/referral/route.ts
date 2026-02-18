import { NextRequest } from 'next/server'
import { apiSuccess, apiError } from '@/lib/api-response'
import { getCurrentAdminUser } from '@/lib/middleware/auth-middleware'
import { systemConfigService } from '@/lib/services/system-config-service'

export async function GET(request: NextRequest) {
  try {
    await getCurrentAdminUser(request)

    const settings = await systemConfigService.getReferralSettings()

    return apiSuccess({
      ...settings,
      maxReward: settings.maxRewards,
    })
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `获取推荐设置失败: ${String(error)}`)
  }
}

export async function PUT(request: NextRequest) {
  try {
    await getCurrentAdminUser(request)
    const body = await request.json()
    const {
      inviterReward,
      inviteeReward,
      rewardExpireDays,
      maxRewards,
      maxReward,
      milestoneCount,
      milestoneReward,
      monthlyLimit,
    } = body as {
      inviterReward?: number
      inviteeReward?: number
      rewardExpireDays?: number
      maxRewards?: number
      maxReward?: number
      milestoneCount?: number
      milestoneReward?: number
      monthlyLimit?: number
    }

    const resolvedMaxRewards = maxRewards ?? maxReward

    await systemConfigService.updateReferralSettings(
      inviterReward,
      inviteeReward,
      rewardExpireDays,
      resolvedMaxRewards,
      milestoneCount,
      milestoneReward,
      monthlyLimit,
    )

    const updatedSettings = await systemConfigService.getReferralSettings()

    return apiSuccess(
      {
        ...updatedSettings,
        maxReward: updatedSettings.maxRewards,
      },
      '推荐设置已更新',
    )
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `更新推荐设置失败: ${String(error)}`)
  }
}
