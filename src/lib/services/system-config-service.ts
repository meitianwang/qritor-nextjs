import { prisma } from '@/lib/prisma'

// ---------------------------------------------------------------------------
// Config key constants
// ---------------------------------------------------------------------------

const ConfigKeys = {
  // Referral programme
  INVITER_REWARD: 'referral.inviter_reward',
  INVITEE_REWARD: 'referral.invitee_reward',
  REFERRAL_REWARD_EXPIRE_DAYS: 'referral.reward_expire_days',
  REFERRAL_MAX_REWARDS: 'referral.max_rewards',
  REFERRAL_MILESTONE_COUNT: 'referral.milestone_count',
  REFERRAL_MILESTONE_REWARD: 'referral.milestone_reward',
  REFERRAL_MONTHLY_LIMIT: 'referral.monthly_limit',
} as const

type ConfigKey = (typeof ConfigKeys)[keyof typeof ConfigKeys]

// ---------------------------------------------------------------------------
// Core CRUD
// ---------------------------------------------------------------------------

/**
 * Retrieve a single config value by key.
 * Returns `null` when the key does not exist.
 */
async function getConfig(key: string): Promise<string | null> {
  const row = await prisma.system_config.findUnique({
    where: { config_key: key },
  })
  return row?.config_value ?? null
}

/**
 * Create or update a config entry.
 */
async function setConfig(
  key: string,
  value: string,
  description?: string,
): Promise<void> {
  const now = new Date()

  await prisma.system_config.upsert({
    where: { config_key: key },
    update: {
      config_value: value,
      ...(description !== undefined && { description }),
      updated_at: now,
    },
    create: {
      config_key: key,
      config_value: value,
      description: description ?? null,
      created_at: now,
      updated_at: now,
    },
  })
}

// ---------------------------------------------------------------------------
// Referral settings
// ---------------------------------------------------------------------------

interface ReferralSettings {
  inviterReward: number | null
  inviteeReward: number | null
  rewardExpireDays: number | null
  maxRewards: number | null
  milestoneCount: number | null
  milestoneReward: number | null
  monthlyLimit: number | null
}

async function getReferralSettings(): Promise<ReferralSettings> {
  const [inviterReward, inviteeReward, rewardExpireDays, maxRewards, milestoneCount, milestoneReward, monthlyLimit] =
    await Promise.all([
      getConfig(ConfigKeys.INVITER_REWARD),
      getConfig(ConfigKeys.INVITEE_REWARD),
      getConfig(ConfigKeys.REFERRAL_REWARD_EXPIRE_DAYS),
      getConfig(ConfigKeys.REFERRAL_MAX_REWARDS),
      getConfig(ConfigKeys.REFERRAL_MILESTONE_COUNT),
      getConfig(ConfigKeys.REFERRAL_MILESTONE_REWARD),
      getConfig(ConfigKeys.REFERRAL_MONTHLY_LIMIT),
    ])

  return {
    inviterReward: inviterReward !== null ? Number(inviterReward) : null,
    inviteeReward: inviteeReward !== null ? Number(inviteeReward) : null,
    rewardExpireDays: rewardExpireDays !== null ? Number(rewardExpireDays) : null,
    maxRewards: maxRewards !== null ? Number(maxRewards) : null,
    milestoneCount: milestoneCount !== null ? Number(milestoneCount) : null,
    milestoneReward: milestoneReward !== null ? Number(milestoneReward) : null,
    monthlyLimit: monthlyLimit !== null ? Number(monthlyLimit) : null,
  }
}

async function updateReferralSettings(
  inviterReward?: number,
  inviteeReward?: number,
  rewardExpireDays?: number,
  maxRewards?: number,
  milestoneCount?: number,
  milestoneReward?: number,
  monthlyLimit?: number,
): Promise<void> {
  const ops: Promise<void>[] = []

  if (inviterReward !== undefined) {
    ops.push(setConfig(ConfigKeys.INVITER_REWARD, String(inviterReward), 'Credits rewarded to the inviter'))
  }
  if (inviteeReward !== undefined) {
    ops.push(setConfig(ConfigKeys.INVITEE_REWARD, String(inviteeReward), 'Credits rewarded to the invitee'))
  }
  if (rewardExpireDays !== undefined) {
    ops.push(setConfig(ConfigKeys.REFERRAL_REWARD_EXPIRE_DAYS, String(rewardExpireDays), 'Days until referral reward expires'))
  }
  if (maxRewards !== undefined) {
    ops.push(setConfig(ConfigKeys.REFERRAL_MAX_REWARDS, String(maxRewards), 'Maximum referral rewards per user'))
  }
  if (milestoneCount !== undefined) {
    ops.push(setConfig(ConfigKeys.REFERRAL_MILESTONE_COUNT, String(milestoneCount), 'Referral milestone count'))
  }
  if (milestoneReward !== undefined) {
    ops.push(setConfig(ConfigKeys.REFERRAL_MILESTONE_REWARD, String(milestoneReward), 'Credits rewarded at milestone'))
  }
  if (monthlyLimit !== undefined) {
    ops.push(setConfig(ConfigKeys.REFERRAL_MONTHLY_LIMIT, String(monthlyLimit), 'Monthly referral limit per user'))
  }

  await Promise.all(ops)
}

// ---------------------------------------------------------------------------
// Convenience accessors
// ---------------------------------------------------------------------------

async function getInviterReward(): Promise<number | null> {
  const value = await getConfig(ConfigKeys.INVITER_REWARD)
  return value !== null ? Number(value) : null
}

async function getInviteeReward(): Promise<number | null> {
  const value = await getConfig(ConfigKeys.INVITEE_REWARD)
  return value !== null ? Number(value) : null
}

// ---------------------------------------------------------------------------
// Singleton export
// ---------------------------------------------------------------------------

export const systemConfigService = {
  getConfig,
  setConfig,
  getReferralSettings,
  updateReferralSettings,
  getInviterReward,
  getInviteeReward,
}
