import crypto from 'crypto'
import { Prisma } from '@/generated/prisma/client'
import { prisma } from '@/lib/prisma'

// ---------------------------------------------------------------------------
// Constants
// ---------------------------------------------------------------------------

const CODE_CHARS = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789'
const CODE_LENGTH = 8
const REFERRAL_INVITER_REWARD_KEYS = [
  'referral.inviter_reward',
  'referral_inviter_reward',
]
const REFERRAL_INVITEE_REWARD_KEYS = [
  'referral.invitee_reward',
  'referral_invitee_reward',
]
const REFERRAL_REWARD_EXPIRE_DAYS_KEYS = [
  'referral.reward_expire_days',
  'referral_reward_expire_days',
]
const REFERRAL_MILESTONE_COUNT_KEYS = ['referral.milestone_count']
const REFERRAL_MILESTONE_REWARD_KEYS = ['referral.milestone_reward']
const REFERRAL_MONTHLY_LIMIT_KEYS = ['referral.monthly_limit']

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

async function getNumericConfig(
  keys: string[],
  fallback: number,
): Promise<number> {
  for (const key of keys) {
    const config = await prisma.system_config.findFirst({
      where: { config_key: key },
    })
    if (!config?.config_value) continue
    const parsed = parseInt(config.config_value, 10)
    if (!Number.isNaN(parsed)) {
      return parsed
    }
  }
  return fallback
}

// ---------------------------------------------------------------------------
// Public API
// ---------------------------------------------------------------------------

export async function getReferralInfo(
  userId: bigint,
): Promise<ReferralInfoDTO> {
  const [inviterReward, inviteeReward] = await Promise.all([
    getNumericConfig(REFERRAL_INVITER_REWARD_KEYS, 50),
    getNumericConfig(REFERRAL_INVITEE_REWARD_KEYS, 30),
  ])

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

  const [
    inviterRewardCredits,
    inviteeRewardCredits,
    rewardExpireDays,
    monthlyLimit,
    milestoneCount,
    milestoneReward,
  ] = await Promise.all([
    getNumericConfig(REFERRAL_INVITER_REWARD_KEYS, 50),
    getNumericConfig(REFERRAL_INVITEE_REWARD_KEYS, 30),
    getNumericConfig(REFERRAL_REWARD_EXPIRE_DAYS_KEYS, 30),
    getNumericConfig(REFERRAL_MONTHLY_LIMIT_KEYS, 0),
    getNumericConfig(REFERRAL_MILESTONE_COUNT_KEYS, 0),
    getNumericConfig(REFERRAL_MILESTONE_REWARD_KEYS, 0),
  ])

  await prisma.$transaction(
    async (tx) => {
      const referral = await tx.referrals.findFirst({
        where: { referral_code: code },
      })
      if (!referral) return

      // Cannot use own code
      if (referral.inviter_id === inviteeId) return

      // Serialize reward calculation per inviter to avoid duplicate/missed milestones.
      await tx.$executeRaw`
        SELECT id FROM referrals WHERE id = ${referral.id} FOR UPDATE
      `

      // Check if already processed
      const existingCompleted = await tx.referrals.findFirst({
        where: {
          inviter_id: referral.inviter_id,
          invitee_id: inviteeId,
          status: 'COMPLETED',
        },
      })
      if (existingCompleted) return

      // Create completed referral record
      const now = new Date()
      const completed = await tx.referrals.create({
        data: {
          inviter_id: referral.inviter_id,
          invitee_id: inviteeId,
          referral_code: `${code}_${inviteeId}`,
          status: 'COMPLETED',
          created_at: now,
          completed_at: now,
        },
      })

      // 月度限制：统计本自然月邀请人已获得的 INVITER 奖励次数
      const monthStart = new Date(now.getFullYear(), now.getMonth(), 1)
      const monthlyInviterCount =
        monthlyLimit > 0
          ? await tx.referral_rewards.count({
              where: {
                user_id: referral.inviter_id,
                reward_type: 'INVITER',
                created_at: { gte: monthStart },
              },
            })
          : 0

      const shouldGrantInviterReward =
        monthlyLimit <= 0 || monthlyInviterCount < monthlyLimit

      const expireAt = new Date(
        now.getTime() + rewardExpireDays * 24 * 60 * 60 * 1000,
      )

      const rewardRows = [
        {
          user_id: inviteeId,
          referral_id: completed.id,
          reward_type: 'INVITEE',
          credits: BigInt(inviteeRewardCredits),
          credits_used: BigInt(0),
          expire_at: expireAt,
          created_at: now,
        },
      ]

      if (shouldGrantInviterReward) {
        rewardRows.push({
          user_id: referral.inviter_id,
          referral_id: completed.id,
          reward_type: 'INVITER',
          credits: BigInt(inviterRewardCredits),
          credits_used: BigInt(0),
          expire_at: expireAt,
          created_at: now,
        })
      }

      await tx.referral_rewards.createMany({
        data: rewardRows,
      })

      // 里程碑奖励与月度邀请奖励独立：达成人数档位即发放额外奖励。
      if (milestoneCount > 0 && milestoneReward > 0) {
        const totalCompleted = await tx.referrals.count({
          where: { inviter_id: referral.inviter_id, status: 'COMPLETED' },
        })
        if (totalCompleted % milestoneCount === 0) {
          await tx.referral_rewards.create({
            data: {
              user_id: referral.inviter_id,
              referral_id: completed.id,
              reward_type: 'MILESTONE',
              credits: BigInt(milestoneReward),
              credits_used: BigInt(0),
              expire_at: expireAt,
              created_at: now,
            },
          })
        }
      }
    },
    { isolationLevel: Prisma.TransactionIsolationLevel.Serializable },
  )
}
