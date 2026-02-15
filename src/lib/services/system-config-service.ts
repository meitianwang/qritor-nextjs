import { prisma } from '@/lib/prisma'

// ---------------------------------------------------------------------------
// Config key constants
// ---------------------------------------------------------------------------

export const ConfigKeys = {
  // Stripe / Payment
  STRIPE_SECRET_KEY: 'payment.stripe_secret_key',
  STRIPE_PUBLISHABLE_KEY: 'payment.stripe_publishable_key',
  STRIPE_WEBHOOK_SECRET: 'payment.stripe_webhook_secret',

  // Referral programme
  INVITER_REWARD: 'referral.inviter_reward',
  INVITEE_REWARD: 'referral.invitee_reward',
  REFERRAL_REWARD_EXPIRE_DAYS: 'referral.reward_expire_days',
  REFERRAL_MAX_REWARDS: 'referral.max_rewards',
} as const

export type ConfigKey = (typeof ConfigKeys)[keyof typeof ConfigKeys]

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
// Stripe helpers
// ---------------------------------------------------------------------------

interface StripeConfig {
  secretKey: string | null
  publishableKey: string | null
  webhookSecret: string | null
}

async function getStripeConfig(): Promise<StripeConfig> {
  const [secretKey, publishableKey, webhookSecret] = await Promise.all([
    getConfig(ConfigKeys.STRIPE_SECRET_KEY),
    getConfig(ConfigKeys.STRIPE_PUBLISHABLE_KEY),
    getConfig(ConfigKeys.STRIPE_WEBHOOK_SECRET),
  ])

  return { secretKey, publishableKey, webhookSecret }
}

// ---------------------------------------------------------------------------
// Payment settings (admin-facing, masked)
// ---------------------------------------------------------------------------

interface PaymentSettings {
  stripeSecretKey: string | null
  stripePublishableKey: string | null
  stripeWebhookSecret: string | null
}

async function getPaymentSettings(): Promise<PaymentSettings> {
  const raw = await getStripeConfig()

  return {
    stripeSecretKey: raw.secretKey ? _maskKey(raw.secretKey) : null,
    stripePublishableKey: raw.publishableKey
      ? _maskKey(raw.publishableKey)
      : null,
    stripeWebhookSecret: raw.webhookSecret
      ? _maskKey(raw.webhookSecret)
      : null,
  }
}

async function updatePaymentSettings(
  secretKey?: string,
  publishableKey?: string,
  webhookSecret?: string,
): Promise<void> {
  const ops: Promise<void>[] = []

  if (secretKey !== undefined) {
    ops.push(
      setConfig(ConfigKeys.STRIPE_SECRET_KEY, secretKey, 'Stripe secret key'),
    )
  }
  if (publishableKey !== undefined) {
    ops.push(
      setConfig(
        ConfigKeys.STRIPE_PUBLISHABLE_KEY,
        publishableKey,
        'Stripe publishable key',
      ),
    )
  }
  if (webhookSecret !== undefined) {
    ops.push(
      setConfig(
        ConfigKeys.STRIPE_WEBHOOK_SECRET,
        webhookSecret,
        'Stripe webhook secret',
      ),
    )
  }

  await Promise.all(ops)
}

// ---------------------------------------------------------------------------
// Referral settings
// ---------------------------------------------------------------------------

interface ReferralSettings {
  inviterReward: number | null
  inviteeReward: number | null
  rewardExpireDays: number | null
  maxRewards: number | null
}

async function getReferralSettings(): Promise<ReferralSettings> {
  const [inviterReward, inviteeReward, rewardExpireDays, maxRewards] =
    await Promise.all([
      getConfig(ConfigKeys.INVITER_REWARD),
      getConfig(ConfigKeys.INVITEE_REWARD),
      getConfig(ConfigKeys.REFERRAL_REWARD_EXPIRE_DAYS),
      getConfig(ConfigKeys.REFERRAL_MAX_REWARDS),
    ])

  return {
    inviterReward: inviterReward !== null ? Number(inviterReward) : null,
    inviteeReward: inviteeReward !== null ? Number(inviteeReward) : null,
    rewardExpireDays:
      rewardExpireDays !== null ? Number(rewardExpireDays) : null,
    maxRewards: maxRewards !== null ? Number(maxRewards) : null,
  }
}

async function updateReferralSettings(
  inviterReward?: number,
  inviteeReward?: number,
  rewardExpireDays?: number,
  maxRewards?: number,
): Promise<void> {
  const ops: Promise<void>[] = []

  if (inviterReward !== undefined) {
    ops.push(
      setConfig(
        ConfigKeys.INVITER_REWARD,
        String(inviterReward),
        'Credits rewarded to the inviter',
      ),
    )
  }
  if (inviteeReward !== undefined) {
    ops.push(
      setConfig(
        ConfigKeys.INVITEE_REWARD,
        String(inviteeReward),
        'Credits rewarded to the invitee',
      ),
    )
  }
  if (rewardExpireDays !== undefined) {
    ops.push(
      setConfig(
        ConfigKeys.REFERRAL_REWARD_EXPIRE_DAYS,
        String(rewardExpireDays),
        'Days until referral reward expires',
      ),
    )
  }
  if (maxRewards !== undefined) {
    ops.push(
      setConfig(
        ConfigKeys.REFERRAL_MAX_REWARDS,
        String(maxRewards),
        'Maximum referral rewards per user',
      ),
    )
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
// Internal helpers
// ---------------------------------------------------------------------------

/**
 * Mask a sensitive key, showing only the first 4 and last 4 characters.
 * Keys shorter than 12 characters are fully masked.
 */
function _maskKey(key: string): string {
  if (key.length <= 8) {
    return '*'.repeat(key.length)
  }
  const start = key.slice(0, 4)
  const end = key.slice(-4)
  const masked = '*'.repeat(key.length - 8)
  return `${start}${masked}${end}`
}

// ---------------------------------------------------------------------------
// Singleton export
// ---------------------------------------------------------------------------

export const systemConfigService = {
  getConfig,
  setConfig,
  getStripeConfig,
  getPaymentSettings,
  updatePaymentSettings,
  getReferralSettings,
  updateReferralSettings,
  getInviterReward,
  getInviteeReward,
}
