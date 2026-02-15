import crypto from 'crypto'
import { prisma } from '@/lib/prisma'

// ---------------------------------------------------------------------------
// Constants
// ---------------------------------------------------------------------------

const CODE_CHARS = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789'
const CODE_LENGTH = 8

// ---------------------------------------------------------------------------
// Types
// ---------------------------------------------------------------------------

interface InviteeInfo {
  nickname: string
  status: string
  credits: number
  completedAt: string | null
}

interface ReferralInfoDTO {
  referralCode: string
  referralLink: string
  invitedCount: number
  earnedCredits: number
  inviterReward: number
  inviteeReward: number
  invitees: InviteeInfo[]
}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

function generateCode(): string {
  let code = ''
  for (let i = 0; i < CODE_LENGTH; i++) {
    const idx = crypto.randomInt(CODE_CHARS.length)
    code += CODE_CHARS[idx]
  }
  return code
}

async function getOrCreateCode(userId: bigint): Promise<string> {
  const existing = await prisma.referrals.findFirst({
    where: { inviter_id: userId, invitee_id: null },
  })
  if (existing) {
    return existing.referral_code
  }

  const code = generateCode()
  await prisma.referrals.create({
    data: {
      inviter_id: userId,
      referral_code: code,
      status: 'PENDING',
      created_at: new Date(),
    },
  })
  return code
}

// ---------------------------------------------------------------------------
// Public API
// ---------------------------------------------------------------------------

export async function getReferralInfo(
  userId: bigint,
): Promise<ReferralInfoDTO> {
  // Get referral settings from system_config
  const inviterRewardConfig = await prisma.system_config.findFirst({
    where: { config_key: 'referral_inviter_reward' },
  })
  const inviteeRewardConfig = await prisma.system_config.findFirst({
    where: { config_key: 'referral_invitee_reward' },
  })

  const inviterReward = inviterRewardConfig?.config_value
    ? parseInt(inviterRewardConfig.config_value, 10)
    : 100
  const inviteeReward = inviteeRewardConfig?.config_value
    ? parseInt(inviteeRewardConfig.config_value, 10)
    : 50

  const code = await getOrCreateCode(userId)

  // Count completed referrals
  const invitedCount = await prisma.referrals.count({
    where: { inviter_id: userId, status: 'COMPLETED' },
  })

  // Sum earned credits
  const earnedResult = await prisma.referral_rewards.aggregate({
    where: { user_id: userId },
    _sum: { credits: true },
  })
  const earnedCredits = Number(earnedResult._sum.credits ?? 0)

  // Get invitees
  const completedReferrals = await prisma.referrals.findMany({
    where: { inviter_id: userId, status: 'COMPLETED' },
  })

  const invitees: InviteeInfo[] = []
  for (const ref of completedReferrals) {
    let nickname = '***'
    if (ref.invitee_id) {
      const user = await prisma.users.findFirst({
        where: { id: ref.invitee_id },
      })
      if (user?.nickname) {
        const n = user.nickname
        nickname =
          n.length > 2 ? `${n[0]}***${n[n.length - 1]}` : `${n[0]}***`
      }
    }
    invitees.push({
      nickname,
      status: ref.status,
      credits: inviterReward,
      completedAt: ref.completed_at?.toISOString() ?? null,
    })
  }

  const baseUrl = process.env.FRONTEND_URL || 'http://localhost:3000'

  return {
    referralCode: code,
    referralLink: `${baseUrl}/register?ref=${code}`,
    invitedCount,
    earnedCredits,
    inviterReward,
    inviteeReward,
    invitees,
  }
}

export async function validateCode(code: string): Promise<boolean> {
  if (!code || code.length !== CODE_LENGTH) {
    return false
  }
  const referral = await prisma.referrals.findFirst({
    where: { referral_code: code.toUpperCase() },
  })
  return referral !== null
}

export async function processReferral(
  inviteeId: bigint,
  referralCode: string,
): Promise<void> {
  if (!referralCode) return

  const code = referralCode.toUpperCase()

  const referral = await prisma.referrals.findFirst({
    where: { referral_code: code },
  })
  if (!referral) return

  // Cannot use own code
  if (referral.inviter_id === inviteeId) return

  // Check if already processed
  const existingCompleted = await prisma.referrals.findFirst({
    where: {
      inviter_id: referral.inviter_id,
      invitee_id: inviteeId,
      status: 'COMPLETED',
    },
  })
  if (existingCompleted) return

  // Create completed referral record
  const now = new Date()
  const completed = await prisma.referrals.create({
    data: {
      inviter_id: referral.inviter_id,
      invitee_id: inviteeId,
      referral_code: `${code}_${inviteeId}`,
      status: 'COMPLETED',
      created_at: now,
      completed_at: now,
    },
  })

  // Check if rewards already granted
  const existingReward = await prisma.referral_rewards.findFirst({
    where: {
      referral_id: completed.id,
      reward_type: 'INVITER',
    },
  })
  if (existingReward) return

  // Get reward settings
  const inviterRewardConfig = await prisma.system_config.findFirst({
    where: { config_key: 'referral_inviter_reward' },
  })
  const inviteeRewardConfig = await prisma.system_config.findFirst({
    where: { config_key: 'referral_invitee_reward' },
  })

  const inviterRewardCredits = inviterRewardConfig?.config_value
    ? parseInt(inviterRewardConfig.config_value, 10)
    : null
  const inviteeRewardCredits = inviteeRewardConfig?.config_value
    ? parseInt(inviteeRewardConfig.config_value, 10)
    : null

  if (inviterRewardCredits === null || inviteeRewardCredits === null) {
    console.error('邀请奖励配置缺失，无法发放奖励')
    return
  }

  const expireAt = new Date(now.getTime() + 30 * 24 * 60 * 60 * 1000) // 30 days

  await prisma.referral_rewards.createMany({
    data: [
      {
        user_id: referral.inviter_id,
        referral_id: completed.id,
        reward_type: 'INVITER',
        credits: BigInt(inviterRewardCredits),
        credits_used: BigInt(0),
        expire_at: expireAt,
        created_at: now,
      },
      {
        user_id: inviteeId,
        referral_id: completed.id,
        reward_type: 'INVITEE',
        credits: BigInt(inviteeRewardCredits),
        credits_used: BigInt(0),
        expire_at: expireAt,
        created_at: now,
      },
    ],
  })
}
