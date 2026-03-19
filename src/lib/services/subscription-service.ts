import { prisma } from '@/lib/prisma'
import { Prisma, type subscription_plans } from '@/generated/prisma/client'

// ---------------------------------------------------------------------------
// Constants
// ---------------------------------------------------------------------------

const DEFAULT_PLAN = 'FREE'
const STATUS_ACTIVE = 'ACTIVE'
const STATUS_EXPIRED = 'EXPIRED'
const SUBSCRIPTION_CYCLE_MS = 30 * 24 * 60 * 60 * 1000

// ---------------------------------------------------------------------------
// Types
// ---------------------------------------------------------------------------

interface PlanInfo {
  id: number
  name: string
  displayName: string
  price: number
  monthlyCredits: number
  maxProjects: number
  description: string | null
  features: string[]
  allowedModelTiers: string[]
}

interface SubscriptionDTO {
  planName: string
  displayName: string
  price: number
  monthlyCredits: number
  maxProjects: number
  status: string | null
  startAt?: string | null
  expireAt?: string | null
  autoRenew?: boolean
  features: string[]
  allowedModelTiers: string[]
}

type SubscriptionDbClient = Pick<
  Prisma.TransactionClient,
  'subscription_plans' | 'user_subscriptions'
>

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

function getFeaturesListFromI18n(
  featuresI18n: Record<string, unknown> | null | undefined,
  lang: string = 'zh',
): string[] {
  if (!featuresI18n || typeof featuresI18n !== 'object') return []

  const raw =
    (featuresI18n as Record<string, unknown>)[lang] ??
    (featuresI18n as Record<string, unknown>)['zh'] ??
    (featuresI18n as Record<string, unknown>)['en']

  if (!raw) return []

  if (typeof raw === 'string') {
    try {
      return JSON.parse(raw)
    } catch {
      return []
    }
  }

  if (Array.isArray(raw)) return raw as string[]
  return []
}

const DEFAULT_ALLOWED_TIERS = ['economy']

function parseAllowedModelTiers(raw: unknown): string[] {
  if (Array.isArray(raw)) return raw.filter((v) => typeof v === 'string')
  if (typeof raw === 'string') {
    try {
      const parsed = JSON.parse(raw)
      if (Array.isArray(parsed)) return parsed.filter((v: unknown) => typeof v === 'string')
    } catch { /* ignore */ }
  }
  return DEFAULT_ALLOWED_TIERS
}

function toPlanInfo(plan: subscription_plans, lang: string = 'zh'): PlanInfo {
  let description: string | null = null
  if (plan.descriptions && typeof plan.descriptions === 'object') {
    const descs = plan.descriptions as Record<string, string>
    description = descs[lang] ?? descs['zh'] ?? descs['en'] ?? null
  }

  const features = getFeaturesListFromI18n(
    plan.features_i18n as Record<string, unknown> | null,
    lang,
  )

  return {
    id: Number(plan.id),
    name: plan.name,
    displayName: plan.display_name,
    price: Number(plan.price),
    monthlyCredits: Number(plan.monthly_credits),
    maxProjects: Number(plan.max_projects),
    description,
    features,
    allowedModelTiers: parseAllowedModelTiers(plan.allowed_model_tiers),
  }
}

async function getActiveSubscription(
  userId: bigint,
  db: SubscriptionDbClient = prisma,
) {
  return db.user_subscriptions.findFirst({
    where: {
      user_id: userId,
      status: STATUS_ACTIVE,
      expire_at: { gt: new Date() },
    },
    orderBy: { created_at: 'desc' },
  })
}

export async function ensureActiveDefaultSubscription(
  userId: bigint,
  db: SubscriptionDbClient = prisma,
): Promise<void> {
  const now = new Date()

  await db.user_subscriptions.updateMany({
    where: {
      user_id: userId,
      status: STATUS_ACTIVE,
      expire_at: { lte: now },
    },
    data: { status: STATUS_EXPIRED, updated_at: now },
  })

  const active = await getActiveSubscription(userId, db)
  if (active) return

  const freePlan = await db.subscription_plans.findFirst({
    where: { name: DEFAULT_PLAN, is_active: true },
  })
  if (!freePlan) return

  await db.user_subscriptions.create({
    data: {
      user_id: userId,
      plan_id: freePlan.id,
      status: STATUS_ACTIVE,
      start_at: now,
      expire_at: new Date(now.getTime() + SUBSCRIPTION_CYCLE_MS),
      credits: freePlan.monthly_credits,
      credits_used: BigInt(0),
      auto_renew: true,
      created_at: now,
      updated_at: now,
    },
  })
}

// ---------------------------------------------------------------------------
// Public API
// ---------------------------------------------------------------------------

export async function getAllPlans(lang: string = 'zh'): Promise<PlanInfo[]> {
  const plans = await prisma.subscription_plans.findMany({
    where: { is_active: true },
    orderBy: { price: 'asc' },
  })
  return plans.map((p) => toPlanInfo(p, lang))
}

export async function getUserSubscription(
  userId: bigint,
): Promise<SubscriptionDTO | null> {
  await ensureActiveDefaultSubscription(userId)

  const sub = await getActiveSubscription(userId)
  if (!sub) {
    // Return the free plan info as default
    const freePlan = await prisma.subscription_plans.findFirst({
      where: { name: DEFAULT_PLAN },
    })
    if (!freePlan) return null

    return {
      planName: freePlan.name,
      displayName: freePlan.display_name,
      price: Number(freePlan.price),
      monthlyCredits: Number(freePlan.monthly_credits),
      maxProjects: Number(freePlan.max_projects),
      status: null,
      features: getFeaturesListFromI18n(
        freePlan.features_i18n as Record<string, unknown> | null,
        'zh',
      ),
      allowedModelTiers: parseAllowedModelTiers(freePlan.allowed_model_tiers),
    }
  }

  const plan = await prisma.subscription_plans.findFirst({
    where: { id: sub.plan_id },
  })
  if (!plan) return null

  return {
    planName: plan.name,
    displayName: plan.display_name,
    price: Number(plan.price),
    monthlyCredits: Number(plan.monthly_credits),
    maxProjects: Number(plan.max_projects),
    status: sub.status,
    startAt: sub.start_at?.toISOString() ?? null,
    expireAt: sub.expire_at?.toISOString() ?? null,
    autoRenew: sub.auto_renew,
    features: getFeaturesListFromI18n(
      plan.features_i18n as Record<string, unknown> | null,
      'zh',
    ),
    allowedModelTiers: parseAllowedModelTiers(plan.allowed_model_tiers),
  }
}

export async function initUserDefaultSubscription(
  userId: bigint,
  db: SubscriptionDbClient = prisma,
): Promise<void> {
  await ensureActiveDefaultSubscription(userId, db)
}

export async function getUserAllowedModelTiers(
  userId: bigint,
): Promise<string[]> {
  await ensureActiveDefaultSubscription(userId)

  const sub = await getActiveSubscription(userId)
  if (!sub) return DEFAULT_ALLOWED_TIERS

  const plan = await prisma.subscription_plans.findFirst({
    where: { id: sub.plan_id },
    select: { allowed_model_tiers: true },
  })
  if (!plan) return DEFAULT_ALLOWED_TIERS

  return parseAllowedModelTiers(plan.allowed_model_tiers)
}

export async function canUserAccessModelTier(
  userId: bigint,
  modelTier: string,
): Promise<boolean> {
  const allowed = await getUserAllowedModelTiers(userId)
  return allowed.includes(modelTier)
}

