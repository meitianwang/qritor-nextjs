import crypto from 'crypto'
import { prisma } from '@/lib/prisma'
import { Prisma, type orders, type subscription_plans } from '@/generated/prisma/client'
import { stripeService } from './stripe-service'

// ---------------------------------------------------------------------------
// Constants
// ---------------------------------------------------------------------------

const STATUS_PENDING = 'PENDING'
const STATUS_PAID = 'PAID'
const STATUS_CANCELLED = 'CANCELLED'
const STATUS_EXPIRED = 'EXPIRED'
const STATUS_AWAITING_PAYMENT = 'AWAITING_PAYMENT'
const PAYABLE_STATUSES = [STATUS_PENDING, STATUS_AWAITING_PAYMENT] as const
const TERMINAL_STATUSES = [STATUS_CANCELLED, STATUS_EXPIRED] as const

// ---------------------------------------------------------------------------
// Types
// ---------------------------------------------------------------------------

interface OrderInfo {
  id: number
  orderNo: string
  userId: number
  planId: number
  planName: string
  amount: number
  status: string
  createdAt: string | null
  paidAt: string | null
  expiredAt: string | null
  planDisplayName?: string
  monthlyCredits?: number
  features?: string[]
  checkoutUrl?: string
  stripeSessionId?: string
  requiresAction?: boolean
}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

function generateOrderNo(): string {
  const now = new Date()
  const timestamp = [
    now.getFullYear(),
    String(now.getMonth() + 1).padStart(2, '0'),
    String(now.getDate()).padStart(2, '0'),
    String(now.getHours()).padStart(2, '0'),
    String(now.getMinutes()).padStart(2, '0'),
    String(now.getSeconds()).padStart(2, '0'),
  ].join('')
  const randomStr = crypto.randomBytes(3).toString('hex').toUpperCase()
  return `${timestamp}${randomStr}`
}

function toOrderInfo(
  order: orders,
  plan?: subscription_plans | null,
): OrderInfo {
  const info: OrderInfo = {
    id: Number(order.id),
    orderNo: order.order_no,
    userId: Number(order.user_id),
    planId: Number(order.plan_id),
    planName: order.plan_name,
    amount: Number(order.amount),
    status: order.status,
    createdAt: order.created_at?.toISOString() ?? null,
    paidAt: order.paid_at?.toISOString() ?? null,
    expiredAt: order.expired_at?.toISOString() ?? null,
  }

  if (plan) {
    info.planDisplayName = plan.display_name
    info.monthlyCredits = Number(plan.monthly_credits)
  }

  return info
}

function isCheckoutSessionId(value: string | null): value is string {
  return Boolean(value && value.startsWith('cs_'))
}

function isPaymentIntentId(value: string | null): value is string {
  return Boolean(value && value.startsWith('pi_'))
}

function isSerializationConflict(error: unknown): boolean {
  return (
    error instanceof Prisma.PrismaClientKnownRequestError &&
    error.code === 'P2034'
  )
}

function isPayableStatus(status: string): boolean {
  return PAYABLE_STATUSES.includes(
    status as (typeof PAYABLE_STATUSES)[number],
  )
}

async function cancelExternalPaymentIfNeeded(order: orders): Promise<void> {
  const paymentId = order.stripe_payment_intent_id
  if (!paymentId) return

  try {
    if (isCheckoutSessionId(paymentId)) {
      await stripeService.expireCheckoutSession(paymentId)
      return
    }

    if (isPaymentIntentId(paymentId)) {
      await stripeService.cancelPaymentIntent(paymentId)
    }
  } catch (error) {
    console.warn(
      `取消 Stripe 支付对象失败(order=${order.order_no}, paymentId=${paymentId}):`,
      error,
    )
  }
}

async function reconcileOrderPaymentIfNeeded(
  order: orders,
): Promise<OrderInfo | null> {
  const recoverFromTerminalStatus = TERMINAL_STATUSES.includes(
    order.status as (typeof TERMINAL_STATUSES)[number],
  )
  if (!isPayableStatus(order.status) && !recoverFromTerminalStatus) return null
  const paymentId = order.stripe_payment_intent_id
  if (!paymentId) return null

  try {
    if (isCheckoutSessionId(paymentId)) {
      const session = await stripeService.getCheckoutSession(paymentId)
      if (session.paymentStatus === 'paid') {
        return markOrderPaidAndActivateSubscription(
          order,
          session.paymentIntentId ?? session.sessionId,
          recoverFromTerminalStatus,
        )
      }
      return null
    }

    if (isPaymentIntentId(paymentId)) {
      const intent = await stripeService.getPaymentIntent(paymentId)
      if (intent.status === 'succeeded') {
        return markOrderPaidAndActivateSubscription(
          order,
          intent.paymentIntentId,
          recoverFromTerminalStatus,
        )
      }
    }
  } catch (error) {
    console.warn(
      `订单支付状态对账失败(order=${order.order_no}, paymentId=${paymentId}):`,
      error,
    )
  }

  return null
}

async function activateSubscriptionInTx(
  tx: Prisma.TransactionClient,
  userId: bigint,
  planId: bigint,
  now: Date,
): Promise<subscription_plans> {
  const plan = await tx.subscription_plans.findFirst({
    where: { id: planId },
  })
  if (!plan) {
    throw new Error(`Plan not found: ${String(planId)}`)
  }

  const activeSubscriptions = await tx.user_subscriptions.findMany({
    where: { user_id: userId, status: 'ACTIVE', expire_at: { gt: now } },
    orderBy: { expire_at: 'desc' },
  })

  let carryoverCredits = BigInt(0)
  for (const sub of activeSubscriptions) {
    const remaining = (sub.credits ?? BigInt(0)) - (sub.credits_used ?? BigInt(0))
    if (remaining > 0) {
      carryoverCredits += remaining
    }
  }

  await tx.user_subscriptions.updateMany({
    where: { user_id: userId, status: 'ACTIVE' },
    data: { status: 'CANCELLED', updated_at: now },
  })

  const cycleStart =
    activeSubscriptions[0]?.expire_at && activeSubscriptions[0].expire_at > now
      ? activeSubscriptions[0].expire_at
      : now
  const expireAt = new Date(cycleStart.getTime() + 30 * 24 * 60 * 60 * 1000)
  await tx.user_subscriptions.create({
    data: {
      user_id: userId,
      plan_id: plan.id,
      status: 'ACTIVE',
      start_at: now,
      expire_at: expireAt,
      credits: plan.monthly_credits + carryoverCredits,
      credits_used: BigInt(0),
      auto_renew: false,
      created_at: now,
      updated_at: now,
    },
  })

  return plan
}

async function markOrderPaidAndActivateSubscription(
  order: orders,
  externalPaymentId?: string,
  allowRecoverFromTerminalStatus: boolean = false,
): Promise<OrderInfo> {
  const maxRetries = 2

  for (let attempt = 0; attempt <= maxRetries; attempt++) {
    try {
      return await prisma.$transaction(
        async (tx) => {
          const current = await tx.orders.findUnique({
            where: { id: order.id },
          })
          if (!current) {
            throw new Error(`订单不存在: ${order.order_no}`)
          }

          if (current.status === STATUS_PAID) {
            const paidPlan = await tx.subscription_plans.findFirst({
              where: { id: current.plan_id },
            })
            return toOrderInfo(current, paidPlan)
          }

          const canRecoverFromTerminalStatus =
            allowRecoverFromTerminalStatus &&
            TERMINAL_STATUSES.includes(
              current.status as (typeof TERMINAL_STATUSES)[number],
            )

          if (!isPayableStatus(current.status) && !canRecoverFromTerminalStatus) {
            throw new Error(`订单状态不正确: ${current.status}`)
          }

          const now = new Date()
          const resolvedExternalPaymentId =
            externalPaymentId ?? current.stripe_payment_intent_id ?? null
          const allowedStatuses = [
            ...PAYABLE_STATUSES,
            ...(allowRecoverFromTerminalStatus ? [...TERMINAL_STATUSES] : []),
          ]

          const updateResult = await tx.orders.updateMany({
            where: {
              id: current.id,
              status: {
                in: allowedStatuses,
              },
            },
            data: {
              status: STATUS_PAID,
              stripe_payment_intent_id: resolvedExternalPaymentId,
              paid_at: now,
              updated_at: now,
            },
          })

          if (updateResult.count === 0) {
            const latest = await tx.orders.findUnique({
              where: { id: current.id },
            })

            if (!latest) {
              throw new Error(`订单不存在: ${order.order_no}`)
            }

            if (latest.status === STATUS_PAID) {
              const latestPlan = await tx.subscription_plans.findFirst({
                where: { id: latest.plan_id },
              })
              return toOrderInfo(latest, latestPlan)
            }

            throw new Error(`订单状态不正确: ${latest.status}`)
          }

          const plan = await activateSubscriptionInTx(
            tx,
            current.user_id,
            current.plan_id,
            now,
          )

          return toOrderInfo(
            {
              ...current,
              status: STATUS_PAID,
              stripe_payment_intent_id: resolvedExternalPaymentId,
              paid_at: now,
              updated_at: now,
            },
            plan,
          )
        },
        { isolationLevel: Prisma.TransactionIsolationLevel.Serializable },
      )
    } catch (error) {
      if (isSerializationConflict(error) && attempt < maxRetries) {
        continue
      }
      throw error
    }
  }

  throw new Error('支付确认失败，请重试')
}

// ---------------------------------------------------------------------------
// Public API
// ---------------------------------------------------------------------------

export async function createOrder(
  userId: bigint,
  planName: string,
): Promise<OrderInfo> {
  const plan = await prisma.subscription_plans.findFirst({
    where: { name: planName.toUpperCase(), is_active: true },
  })

  if (!plan) {
    throw new Error(`订阅计划不存在: ${planName}`)
  }

  if (planName.toUpperCase() === 'FREE') {
    throw new Error('免费计划无需购买')
  }

  const maxRetries = 2

  for (let attempt = 0; attempt <= maxRetries; attempt++) {
    try {
      const { order, openOrders } = await prisma.$transaction(
        async (tx) => {
          const lockedUsers = await tx.$queryRaw<Array<{ id: bigint }>>`
            SELECT id FROM users WHERE id = ${userId} FOR UPDATE
          `
          if (lockedUsers.length === 0) {
            throw new Error('用户不存在')
          }

          const now = new Date()

          const existingOpenOrders = await tx.orders.findMany({
            where: {
              user_id: userId,
              status: { in: [...PAYABLE_STATUSES] },
            },
          })

          if (existingOpenOrders.length > 0) {
            await tx.orders.updateMany({
              where: {
                user_id: userId,
                status: { in: [...PAYABLE_STATUSES] },
              },
              data: { status: STATUS_CANCELLED, updated_at: now },
            })
          }

          const orderNo = generateOrderNo()
          const expiredAt = new Date(now.getTime() + 30 * 60 * 1000) // 30 minutes

          const createdOrder = await tx.orders.create({
            data: {
              order_no: orderNo,
              user_id: userId,
              plan_id: plan.id,
              plan_name: plan.name,
              amount: plan.price,
              status: STATUS_PENDING,
              created_at: now,
              updated_at: now,
              expired_at: expiredAt,
            },
          })

          return {
            order: createdOrder,
            openOrders: existingOpenOrders,
          }
        },
        { isolationLevel: Prisma.TransactionIsolationLevel.Serializable },
      )

      for (const openOrder of openOrders) {
        if (openOrder.status === STATUS_AWAITING_PAYMENT) {
          await cancelExternalPaymentIfNeeded(openOrder)
        }
      }

      return toOrderInfo(order, plan)
    } catch (error) {
      if (isSerializationConflict(error) && attempt < maxRetries) {
        continue
      }
      throw error
    }
  }

  throw new Error('创建订单失败，请重试')
}

export async function getOrderByOrderNo(
  orderNo: string,
  userId?: bigint,
): Promise<OrderInfo> {
  const order = await prisma.orders.findUnique({
    where: { order_no: orderNo },
  })

  if (!order) {
    throw new Error(`订单不存在: ${orderNo}`)
  }

  if (userId !== undefined && order.user_id !== userId) {
    throw new Error('无权操作此订单')
  }

  // Reconcile with Stripe in case webhook delivery is delayed.
  const reconciled = await reconcileOrderPaymentIfNeeded(order)
  if (reconciled) {
    return reconciled
  }

  // Check if payable order has expired
  if (isPayableStatus(order.status) && order.expired_at < new Date()) {
    if (order.status === STATUS_AWAITING_PAYMENT) {
      await cancelExternalPaymentIfNeeded(order)
    }
    await prisma.orders.update({
      where: { id: order.id },
      data: { status: STATUS_EXPIRED, updated_at: new Date() },
    })
    order.status = STATUS_EXPIRED
  }

  const plan = await prisma.subscription_plans.findFirst({
    where: { id: order.plan_id },
  })

  return toOrderInfo(order, plan)
}

export async function getOrdersByUserId(
  userId: bigint,
): Promise<OrderInfo[]> {
  const orderList = await prisma.orders.findMany({
    where: { user_id: userId },
    orderBy: { created_at: 'desc' },
  })

  const planIds = [...new Set(orderList.map((o) => o.plan_id))]
  const plans = await prisma.subscription_plans.findMany({
    where: { id: { in: planIds } },
  })
  const planMap = new Map(plans.map((p) => [Number(p.id), p]))

  return orderList.map((order) =>
    toOrderInfo(order, planMap.get(Number(order.plan_id)) ?? null),
  )
}

export async function payOrder(
  orderNo: string,
  userId?: bigint,
): Promise<OrderInfo> {
  const order = await prisma.orders.findUnique({
    where: { order_no: orderNo },
  })

  if (!order) {
    throw new Error(`订单不存在: ${orderNo}`)
  }

  if (userId !== undefined && order.user_id !== userId) {
    throw new Error('无权操作此订单')
  }

  if (order.status === STATUS_PAID) {
    const paidPlan = await prisma.subscription_plans.findFirst({
      where: { id: order.plan_id },
    })
    return toOrderInfo(order, paidPlan)
  }

  if (!isPayableStatus(order.status)) {
    throw new Error('订单状态不正确，无法支付')
  }

  if (order.expired_at < new Date()) {
    if (order.status === STATUS_AWAITING_PAYMENT) {
      await cancelExternalPaymentIfNeeded(order)
    }
    await prisma.orders.update({
      where: { id: order.id },
      data: { status: STATUS_EXPIRED, updated_at: new Date() },
    })
    throw new Error('订单已过期')
  }

  // Initiate Stripe payment
  const plan = await prisma.subscription_plans.findFirst({
    where: { id: order.plan_id },
  })

  if (
    order.status === STATUS_AWAITING_PAYMENT &&
    order.stripe_payment_intent_id
  ) {
    // Reuse existing checkout session for the same order.
    if (isCheckoutSessionId(order.stripe_payment_intent_id)) {
      const session = await stripeService.getCheckoutSession(
        order.stripe_payment_intent_id,
      )

      if (session.paymentStatus === 'paid') {
        return markOrderPaidAndActivateSubscription(
          order,
          session.paymentIntentId ?? session.sessionId,
        )
      }

      if (session.status === 'open' && session.checkoutUrl) {
        const orderInfo = toOrderInfo(order, plan)
        orderInfo.requiresAction = true
        orderInfo.checkoutUrl = session.checkoutUrl
        orderInfo.stripeSessionId = session.sessionId
        return orderInfo
      }

      await prisma.orders.update({
        where: { id: order.id },
        data: { status: STATUS_EXPIRED, updated_at: new Date() },
      })
      throw new Error('支付会话已失效，请重新创建订单')
    }

    // Prevent creating a second payment flow when an existing PI is in progress.
    if (isPaymentIntentId(order.stripe_payment_intent_id)) {
      const intent = await stripeService.getPaymentIntent(
        order.stripe_payment_intent_id,
      )

      if (intent.status === 'succeeded') {
        return markOrderPaidAndActivateSubscription(
          order,
          intent.paymentIntentId,
        )
      }

      throw new Error('订单已有进行中的已绑卡支付，请完成原支付流程或重新创建订单')
    }

    throw new Error('订单支付信息异常，请重新创建订单')
  }

  const baseUrl = process.env.FRONTEND_URL || 'http://localhost:3000'
  const successUrl = `${baseUrl}/payment/success?orderNo=${order.order_no}`
  const cancelUrl = `${baseUrl}/checkout?plan=${order.plan_name.toLowerCase()}`

  // Get or create Stripe customer (so payment method is saved automatically)
  const user = await prisma.users.findFirst({
    where: { id: order.user_id },
  })

  const customerId = await stripeService.getOrCreateCustomer(
    order.user_id,
    user?.email ?? '',
  )

  const stripeResult = await stripeService.createCheckoutSession(
    order.order_no,
    order.plan_name,
    Number(order.amount),
    successUrl,
    cancelUrl,
    customerId,
  )

  await prisma.orders.update({
    where: { id: order.id },
    data: {
      status: STATUS_AWAITING_PAYMENT,
      stripe_payment_intent_id: stripeResult.sessionId,
      updated_at: new Date(),
    },
  })

  const orderInfo = toOrderInfo(
    { ...order, status: STATUS_AWAITING_PAYMENT },
    plan,
  )
  orderInfo.requiresAction = true
  orderInfo.checkoutUrl = stripeResult.checkoutUrl ?? undefined
  orderInfo.stripeSessionId = stripeResult.sessionId

  return orderInfo
}

export async function payOrderWithSavedMethod(
  orderNo: string,
  paymentMethodId: string,
  userId: bigint,
): Promise<OrderInfo & { clientSecret?: string | null }> {
  const order = await prisma.orders.findUnique({
    where: { order_no: orderNo },
  })

  if (!order) {
    throw new Error(`订单不存在: ${orderNo}`)
  }

  if (order.user_id !== userId) {
    throw new Error('无权操作此订单')
  }

  if (order.status === STATUS_PAID) {
    const paidPlan = await prisma.subscription_plans.findFirst({
      where: { id: order.plan_id },
    })
    return toOrderInfo(order, paidPlan)
  }

  if (!isPayableStatus(order.status)) {
    throw new Error('订单状态不正确，无法支付')
  }

  if (order.expired_at < new Date()) {
    if (order.status === STATUS_AWAITING_PAYMENT) {
      await cancelExternalPaymentIfNeeded(order)
    }
    await prisma.orders.update({
      where: { id: order.id },
      data: { status: STATUS_EXPIRED, updated_at: new Date() },
    })
    throw new Error('订单已过期')
  }

  const user = await prisma.users.findFirst({ where: { id: userId } })
  if (!user?.stripe_customer_id) {
    throw new Error('未找到支付账户')
  }

  const paymentMethodCustomerId =
    await stripeService.getPaymentMethodCustomerId(paymentMethodId)
  if (paymentMethodCustomerId !== user.stripe_customer_id) {
    throw new Error('无权操作此支付方式')
  }

  const plan = await prisma.subscription_plans.findFirst({
    where: { id: order.plan_id },
  })

  if (
    order.status === STATUS_AWAITING_PAYMENT &&
    order.stripe_payment_intent_id
  ) {
    // Reuse existing PI when this order is already waiting for authentication.
    if (isPaymentIntentId(order.stripe_payment_intent_id)) {
      const existingIntent = await stripeService.getPaymentIntent(
        order.stripe_payment_intent_id,
      )

      if (existingIntent.status === 'succeeded') {
        return markOrderPaidAndActivateSubscription(
          order,
          existingIntent.paymentIntentId,
        )
      }

      if (existingIntent.status === 'requires_action') {
        const orderInfo = toOrderInfo(order, plan)
        return {
          ...orderInfo,
          requiresAction: true,
          clientSecret: existingIntent.clientSecret,
        }
      }
    }

    // Prevent creating PI when checkout session is already in progress.
    if (isCheckoutSessionId(order.stripe_payment_intent_id)) {
      const session = await stripeService.getCheckoutSession(
        order.stripe_payment_intent_id,
      )

      if (session.paymentStatus === 'paid') {
        return markOrderPaidAndActivateSubscription(
          order,
          session.paymentIntentId ?? session.sessionId,
        )
      }

      if (session.status === 'open') {
        throw new Error('订单已有进行中的收银台支付，请在原支付页完成支付或重新创建订单')
      }

      await prisma.orders.update({
        where: { id: order.id },
        data: { status: STATUS_EXPIRED, updated_at: new Date() },
      })
      throw new Error('支付会话已失效，请重新创建订单')
    }

    throw new Error('订单支付信息异常，请重新创建订单')
  }

  const chargeResult = await stripeService.chargeWithSavedMethod(
    user.stripe_customer_id,
    paymentMethodId,
    Number(order.amount),
    order.order_no,
  )

  if (chargeResult.status === 'succeeded') {
    return markOrderPaidAndActivateSubscription(
      order,
      chargeResult.paymentIntentId,
    )
  }

  if (chargeResult.status === 'requires_action') {
    await prisma.orders.update({
      where: { id: order.id },
      data: {
        status: STATUS_AWAITING_PAYMENT,
        stripe_payment_intent_id: chargeResult.paymentIntentId,
        updated_at: new Date(),
      },
    })

    const orderInfo = toOrderInfo(
      { ...order, status: STATUS_AWAITING_PAYMENT },
      plan,
    )
    return {
      ...orderInfo,
      requiresAction: true,
      clientSecret: chargeResult.clientSecret,
    }
  }

  throw new Error(`支付失败，状态: ${chargeResult.status}`)
}

export async function completePaymentViaWebhook(
  orderNo: string,
  externalPaymentId?: string,
): Promise<OrderInfo | null> {
  const order = await prisma.orders.findUnique({
    where: { order_no: orderNo },
  })

  if (!order) {
    throw new Error(`订单不存在: ${orderNo}`)
  }

  if (order.status === STATUS_PAID) {
    return toOrderInfo(order, null)
  }

  const recoverFromTerminalStatus =
    order.status === STATUS_CANCELLED || order.status === STATUS_EXPIRED

  if (recoverFromTerminalStatus) {
    console.warn(
      `收到已失效订单的支付成功回调，执行权益补偿(order=${orderNo}, status=${order.status}, paymentId=${externalPaymentId ?? '-'})`,
    )
  }

  if (!isPayableStatus(order.status) && !recoverFromTerminalStatus) {
    throw new Error(`订单状态不正确: ${order.status}`)
  }

  return markOrderPaidAndActivateSubscription(
    order,
    externalPaymentId,
    recoverFromTerminalStatus,
  )
}

export async function cancelOrder(
  orderNo: string,
  userId: bigint,
): Promise<void> {
  const order = await prisma.orders.findUnique({
    where: { order_no: orderNo },
  })

  if (!order) {
    throw new Error(`订单不存在: ${orderNo}`)
  }

  if (order.user_id !== userId) {
    throw new Error('无权操作此订单')
  }

  if (
    order.status !== STATUS_PENDING &&
    order.status !== STATUS_AWAITING_PAYMENT
  ) {
    throw new Error('只能取消待支付中的订单')
  }

  if (order.status === STATUS_AWAITING_PAYMENT) {
    await cancelExternalPaymentIfNeeded(order)
  }

  await prisma.orders.update({
    where: { id: order.id },
    data: { status: STATUS_CANCELLED, updated_at: new Date() },
  })
}
