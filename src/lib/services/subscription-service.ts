import { prisma } from '@/lib/prisma'
import type { subscription_plans } from '@/generated/prisma/client'

// ---------------------------------------------------------------------------
// Constants
// ---------------------------------------------------------------------------

const DEFAULT_PLAN = 'FREE'
const STATUS_ACTIVE = 'ACTIVE'
const STATUS_EXPIRED = 'EXPIRED'
const STATUS_CANCELLED = 'CANCELLED'

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
}

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
  }
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
  const sub = await prisma.user_subscriptions.findFirst({
    where: { user_id: userId, status: STATUS_ACTIVE },
  })

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
    }
  }

  // Check expiry
  if (sub.expire_at && sub.expire_at < new Date()) {
    await prisma.user_subscriptions.update({
      where: { id: sub.id },
      data: { status: STATUS_EXPIRED },
    })
    sub.status = STATUS_EXPIRED
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
  }
}

export async function initUserDefaultSubscription(
  userId: bigint,
): Promise<void> {
  const existing = await prisma.user_subscriptions.findFirst({
    where: { user_id: userId },
  })
  if (existing) return

  const freePlan = await prisma.subscription_plans.findFirst({
    where: { name: DEFAULT_PLAN },
  })
  if (!freePlan) return

  const now = new Date()
  const farFuture = new Date(now)
  farFuture.setFullYear(farFuture.getFullYear() + 100)

  await prisma.user_subscriptions.create({
    data: {
      user_id: userId,
      plan_id: freePlan.id,
      status: STATUS_ACTIVE,
      start_at: now,
      expire_at: farFuture,
      credits: freePlan.monthly_credits,
      credits_used: BigInt(0),
      auto_renew: false,
      created_at: now,
      updated_at: now,
    },
  })
}

export async function subscribe(
  userId: bigint,
  planName: string,
): Promise<SubscriptionDTO | null> {
  const plan = await prisma.subscription_plans.findFirst({
    where: { name: planName },
  })
  if (!plan) {
    throw new Error(`Plan not found: ${planName}`)
  }

  // Cancel existing active subscription
  const existing = await prisma.user_subscriptions.findFirst({
    where: { user_id: userId, status: STATUS_ACTIVE },
  })
  if (existing) {
    await prisma.user_subscriptions.update({
      where: { id: existing.id },
      data: { status: STATUS_CANCELLED },
    })
  }

  const now = new Date()
  const expireAt = new Date(now.getTime() + 30 * 24 * 60 * 60 * 1000) // 30 days

  await prisma.user_subscriptions.create({
    data: {
      user_id: userId,
      plan_id: plan.id,
      status: STATUS_ACTIVE,
      start_at: now,
      expire_at: expireAt,
      credits: plan.monthly_credits,
      credits_used: BigInt(0),
      auto_renew: false,
      created_at: now,
      updated_at: now,
    },
  })

  return getUserSubscription(userId)
}
