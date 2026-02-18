import { Prisma } from '@/generated/prisma/client'
import { prisma } from '@/lib/prisma'

const TX_TYPE_CONSUME = 'CONSUME'
const TX_TYPE_DEBT = 'DEBT'
const TX_TYPE_DEBT_SETTLED = 'DEBT_SETTLED'

// ---------------------------------------------------------------------------
// Types
// ---------------------------------------------------------------------------

interface CreditItem {
  description: string
  total: number
  remaining: number
  expireAt: string | null
  createdAt: string | null
}

interface CreditCategory {
  balance: number
  used: number
  total: number
  expireAt: string | null
  itemCount: number
  items: CreditItem[]
}

interface CreditsDTO {
  subscription: CreditCategory
  referral: CreditCategory
  boostPack: CreditCategory
}

interface CreditSource {
  sourceType: 'SUBSCRIPTION' | 'REFERRAL' | 'BOOST_PACK'
  sourceId: bigint
  expireAt: Date
  remaining: number
}

interface TransactionRecord {
  id: number
  type: string
  sourceType: string
  inputTokens: number | null
  outputTokens: number | null
  totalTokens: number | null
  creditsConsumed: number
  inputPricePerM: number | null
  outputPricePerM: number | null
  description: string | null
  createdAt: string | null
}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

function toISOStringOrNull(date: Date | null | undefined): string | null {
  return date ? date.toISOString() : null
}

function normalizeCreditAmount(amount: number): number {
  if (!Number.isFinite(amount) || amount <= 0) {
    throw new Error('积分数量必须大于0')
  }
  return Math.max(1, Math.ceil(amount))
}

// ---------------------------------------------------------------------------
// Service
// ---------------------------------------------------------------------------

async function getSubscriptionCredits(
  userId: bigint,
  now: Date,
): Promise<CreditCategory> {
  const subs = await prisma.user_subscriptions.findMany({
    where: { user_id: userId, status: 'ACTIVE', expire_at: { gt: now } },
  })

  const total = subs.reduce((sum, s) => sum + Number(s.credits ?? 0), 0)
  const used = subs.reduce((sum, s) => sum + Number(s.credits_used ?? 0), 0)

  const items: CreditItem[] = subs.map((s) => ({
    description: '订阅积分',
    total: Number(s.credits ?? 0),
    remaining: Number(s.credits ?? 0) - Number(s.credits_used ?? 0),
    expireAt: toISOStringOrNull(s.expire_at),
    createdAt: toISOStringOrNull(s.created_at),
  }))

  const activeSubs = subs.filter(
    (s) => Number(s.credits ?? 0) > Number(s.credits_used ?? 0),
  )
  const expireAt =
    activeSubs.length > 0
      ? toISOStringOrNull(
          activeSubs.reduce(
            (earliest, s) => (s.expire_at < earliest ? s.expire_at : earliest),
            activeSubs[0].expire_at,
          ),
        )
      : null

  return { balance: total - used, used, total, expireAt, itemCount: items.length, items }
}

async function getReferralCredits(
  userId: bigint,
  now: Date,
): Promise<CreditCategory> {
  const rewards = await prisma.referral_rewards.findMany({
    where: { user_id: userId, expire_at: { gt: now } },
  })

  const total = rewards.reduce((sum, r) => sum + Number(r.credits), 0)
  const used = rewards.reduce((sum, r) => sum + Number(r.credits_used ?? 0), 0)

  const items: CreditItem[] = rewards.map((r) => ({
    description: r.reward_type === 'INVITER' ? '邀请好友奖励' : '受邀注册奖励',
    total: Number(r.credits),
    remaining: Number(r.credits) - Number(r.credits_used ?? 0),
    expireAt: toISOStringOrNull(r.expire_at),
    createdAt: toISOStringOrNull(r.created_at),
  }))

  const activeRewards = rewards.filter(
    (r) => Number(r.credits) > Number(r.credits_used ?? 0),
  )
  const expireAt =
    activeRewards.length > 0
      ? toISOStringOrNull(
          activeRewards.reduce(
            (earliest, r) => (r.expire_at < earliest ? r.expire_at : earliest),
            activeRewards[0].expire_at,
          ),
        )
      : null

  return { balance: total - used, used, total, expireAt, itemCount: items.length, items }
}

async function getBoostPackCredits(
  userId: bigint,
  now: Date,
): Promise<CreditCategory> {
  const purchases = await prisma.boost_pack_purchases.findMany({
    where: { user_id: userId, expire_at: { gt: now } },
  })

  const total = purchases.reduce((sum, p) => sum + Number(p.credits), 0)
  const used = purchases.reduce((sum, p) => sum + Number(p.credits_used ?? 0), 0)

  const items: CreditItem[] = purchases.map((p) => ({
    description: p.boost_pack_name || '加油包',
    total: Number(p.credits),
    remaining: Number(p.credits) - Number(p.credits_used ?? 0),
    expireAt: toISOStringOrNull(p.expire_at),
    createdAt: toISOStringOrNull(p.purchased_at),
  }))

  const activePurchases = purchases.filter(
    (p) => Number(p.credits) > Number(p.credits_used ?? 0),
  )
  const expireAt =
    activePurchases.length > 0
      ? toISOStringOrNull(
          activePurchases.reduce(
            (earliest, p) =>
              p.expire_at && p.expire_at < earliest ? p.expire_at : earliest,
            activePurchases[0].expire_at!,
          ),
        )
      : null

  return { balance: total - used, used, total, expireAt, itemCount: items.length, items }
}

async function ensureDefaultSubscriptionForCredits(userId: bigint): Promise<void> {
  const { ensureActiveDefaultSubscription } = await import('./subscription-service')
  await ensureActiveDefaultSubscription(userId)
}

async function getOutstandingDebtInTx(
  tx: Prisma.TransactionClient,
  userId: bigint,
): Promise<number> {
  const [debtAgg, settledAgg] = await Promise.all([
    tx.credit_transactions.aggregate({
      where: { user_id: userId, transaction_type: TX_TYPE_DEBT },
      _sum: { credits_consumed: true },
    }),
    tx.credit_transactions.aggregate({
      where: { user_id: userId, transaction_type: TX_TYPE_DEBT_SETTLED },
      _sum: { credits_consumed: true },
    }),
  ])

  const totalDebt = Number(debtAgg._sum.credits_consumed ?? 0)
  const totalSettled = Number(settledAgg._sum.credits_consumed ?? 0)
  return Math.max(0, totalDebt - totalSettled)
}

export async function getOutstandingDebt(userId: bigint): Promise<number> {
  return prisma.$transaction(
    async (tx) => getOutstandingDebtInTx(tx, userId),
    { isolationLevel: Prisma.TransactionIsolationLevel.Serializable },
  )
}

async function consumeCreditsInTx(
  tx: Prisma.TransactionClient,
  userId: bigint,
  normalizedAmount: number,
): Promise<boolean> {
  const now = new Date()
  const sources: CreditSource[] = []

  // Collect all credit sources inside one transaction to avoid race conditions.
  const subs = await tx.user_subscriptions.findMany({
    where: {
      user_id: userId,
      status: 'ACTIVE',
      expire_at: { gt: now },
    },
  })
  for (const sub of subs) {
    const remaining = Number(sub.credits ?? 0) - Number(sub.credits_used ?? 0)
    if (remaining > 0) {
      sources.push({
        sourceType: 'SUBSCRIPTION',
        sourceId: sub.id,
        expireAt: sub.expire_at,
        remaining,
      })
    }
  }

  const rewards = await tx.referral_rewards.findMany({
    where: { user_id: userId, expire_at: { gt: now } },
  })
  for (const reward of rewards) {
    const remaining = Number(reward.credits) - Number(reward.credits_used ?? 0)
    if (remaining > 0) {
      sources.push({
        sourceType: 'REFERRAL',
        sourceId: reward.id,
        expireAt: reward.expire_at,
        remaining,
      })
    }
  }

  const purchases = await tx.boost_pack_purchases.findMany({
    where: { user_id: userId, expire_at: { gt: now } },
  })
  for (const purchase of purchases) {
    const remaining = Number(purchase.credits) - Number(purchase.credits_used ?? 0)
    if (remaining > 0 && purchase.expire_at) {
      sources.push({
        sourceType: 'BOOST_PACK',
        sourceId: purchase.id,
        expireAt: purchase.expire_at,
        remaining,
      })
    }
  }

  sources.sort((a, b) => a.expireAt.getTime() - b.expireAt.getTime())

  const availableCredits = sources.reduce((sum, s) => sum + s.remaining, 0)
  if (availableCredits < normalizedAmount) {
    return false
  }

  let remainingToDeduct = normalizedAmount

  for (const source of sources) {
    if (remainingToDeduct <= 0) break

    const deduct = Math.min(remainingToDeduct, source.remaining)

    if (source.sourceType === 'SUBSCRIPTION') {
      const sub = await tx.user_subscriptions.findUnique({
        where: { id: source.sourceId },
      })
      if (sub) {
        await tx.user_subscriptions.update({
          where: { id: source.sourceId },
          data: {
            credits_used: BigInt(Number(sub.credits_used ?? 0) + deduct),
          },
        })
      }
    } else if (source.sourceType === 'REFERRAL') {
      const reward = await tx.referral_rewards.findUnique({
        where: { id: source.sourceId },
      })
      if (reward) {
        await tx.referral_rewards.update({
          where: { id: source.sourceId },
          data: {
            credits_used: BigInt(Number(reward.credits_used ?? 0) + deduct),
          },
        })
      }
    } else if (source.sourceType === 'BOOST_PACK') {
      const purchase = await tx.boost_pack_purchases.findUnique({
        where: { id: source.sourceId },
      })
      if (purchase) {
        await tx.boost_pack_purchases.update({
          where: { id: source.sourceId },
          data: {
            credits_used: BigInt(Number(purchase.credits_used ?? 0) + deduct),
          },
        })
      }
    }

    remainingToDeduct -= deduct
  }

  return remainingToDeduct <= 0
}

// ---------------------------------------------------------------------------
// Public API
// ---------------------------------------------------------------------------

export async function getCredits(userId: bigint): Promise<CreditsDTO> {
  await ensureDefaultSubscriptionForCredits(userId)
  const now = new Date()
  const [subscription, referral, boostPack] = await Promise.all([
    getSubscriptionCredits(userId, now),
    getReferralCredits(userId, now),
    getBoostPackCredits(userId, now),
  ])
  return { subscription, referral, boostPack }
}

export async function getTotalBalance(userId: bigint): Promise<number> {
  const credits = await getCredits(userId)
  return credits.subscription.balance + credits.referral.balance + credits.boostPack.balance
}

export async function hasEnoughCredits(
  userId: bigint,
  amount: number,
): Promise<boolean> {
  const normalizedAmount = normalizeCreditAmount(amount)
  const [balance, outstandingDebt] = await Promise.all([
    getTotalBalance(userId),
    getOutstandingDebt(userId),
  ])
  return balance >= normalizedAmount + outstandingDebt
}

export async function consumeCredits(
  userId: bigint,
  amount: number,
): Promise<boolean> {
  const normalizedAmount = normalizeCreditAmount(amount)
  await ensureDefaultSubscriptionForCredits(userId)

  return prisma.$transaction(
    async (tx) => consumeCreditsInTx(tx, userId, normalizedAmount),
    { isolationLevel: Prisma.TransactionIsolationLevel.Serializable },
  )
}

export async function consumeCreditsWithTransaction(
  userId: bigint,
  amount: number,
  sourceType: string,
  llmConfigId?: bigint,
  inputTokens?: number,
  outputTokens?: number,
  inputPricePerM?: number,
  outputPricePerM?: number,
  description?: string,
): Promise<boolean> {
  const normalizedAmount = normalizeCreditAmount(amount)
  await ensureDefaultSubscriptionForCredits(userId)

  return prisma.$transaction(
    async (tx) => {
      const outstandingDebt = await getOutstandingDebtInTx(tx, userId)
      const totalToConsume = normalizedAmount + outstandingDebt
      const success = await consumeCreditsInTx(tx, userId, totalToConsume)
      if (!success) return false

      if (outstandingDebt > 0) {
        await tx.credit_transactions.create({
          data: {
            user_id: userId,
            transaction_type: TX_TYPE_DEBT_SETTLED,
            source_type: 'SYSTEM',
            llm_config_id: null,
            input_tokens: 0,
            output_tokens: 0,
            total_tokens: 0,
            input_price_per_m: null,
            output_price_per_m: null,
            credits_consumed: outstandingDebt,
            description: '自动补扣历史欠费积分',
            created_at: new Date(),
          },
        })
      }

      await tx.credit_transactions.create({
        data: {
          user_id: userId,
          transaction_type: TX_TYPE_CONSUME,
          source_type: sourceType,
          llm_config_id: llmConfigId ?? null,
          input_tokens: inputTokens ?? 0,
          output_tokens: outputTokens ?? 0,
          total_tokens: (inputTokens ?? 0) + (outputTokens ?? 0),
          input_price_per_m: inputPricePerM ?? null,
          output_price_per_m: outputPricePerM ?? null,
          credits_consumed: normalizedAmount,
          description: description ?? '',
          created_at: new Date(),
        },
      })

      return true
    },
    { isolationLevel: Prisma.TransactionIsolationLevel.Serializable },
  )
}

export async function recordCreditDebt(
  userId: bigint,
  amount: number,
  sourceType: string,
  description?: string,
): Promise<void> {
  const normalizedAmount = normalizeCreditAmount(amount)
  await prisma.credit_transactions.create({
    data: {
      user_id: userId,
      transaction_type: TX_TYPE_DEBT,
      source_type: sourceType,
      llm_config_id: null,
      input_tokens: 0,
      output_tokens: 0,
      total_tokens: 0,
      input_price_per_m: null,
      output_price_per_m: null,
      credits_consumed: normalizedAmount,
      description: description ?? '积分补扣失败，记入欠费',
      created_at: new Date(),
    },
  })
}

export async function getTransactions(
  userId: bigint,
  page: number = 0,
  size: number = 20,
): Promise<TransactionRecord[]> {
  const transactions = await prisma.credit_transactions.findMany({
    where: { user_id: userId },
    orderBy: { created_at: 'desc' },
    skip: page * size,
    take: size,
  })

  return transactions.map((t) => ({
    id: Number(t.id),
    type: t.transaction_type,
    sourceType: t.source_type,
    inputTokens: t.input_tokens,
    outputTokens: t.output_tokens,
    totalTokens: t.total_tokens,
    creditsConsumed: t.credits_consumed,
    inputPricePerM: t.input_price_per_m,
    outputPricePerM: t.output_price_per_m,
    description: t.description,
    createdAt: toISOStringOrNull(t.created_at),
  }))
}
