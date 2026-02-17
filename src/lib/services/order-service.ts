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
const PAYMENT_STRIPE = 'STRIPE'

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
  paymentMethod: string | null
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
    paymentMethod: order.payment_method,
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

async function activateSubscriptionInTx(
  tx: Prisma.TransactionClient,
  userId: bigint,
  planName: string,
  now: Date,
): Promise<subscription_plans> {
  const plan = await tx.subscription_plans.findFirst({
    where: { name: planName },
  })
  if (!plan) {
    throw new Error(`Plan not found: ${planName}`)
  }

  await tx.user_subscriptions.updateMany({
    where: { user_id: userId, status: 'ACTIVE' },
    data: { status: 'CANCELLED', updated_at: now },
  })

  const expireAt = new Date(now.getTime() + 30 * 24 * 60 * 60 * 1000)
  await tx.user_subscriptions.create({
    data: {
      user_id: userId,
      plan_id: plan.id,
      status: 'ACTIVE',
      start_at: now,
      expire_at: expireAt,
      credits: plan.monthly_credits,
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
  paymentMethod: string,
  externalPaymentId?: string,
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

          if (
            current.status !== STATUS_PENDING &&
            current.status !== STATUS_AWAITING_PAYMENT &&
            current.status !== STATUS_CANCELLED &&
            current.status !== STATUS_EXPIRED
          ) {
            throw new Error(`订单状态不正确: ${current.status}`)
          }

          const now = new Date()
          const resolvedExternalPaymentId =
            externalPaymentId ?? current.stripe_payment_intent_id ?? null

          const updateResult = await tx.orders.updateMany({
            where: {
              id: current.id,
              status: {
                in: [
                  STATUS_PENDING,
                  STATUS_AWAITING_PAYMENT,
                  STATUS_CANCELLED,
                  STATUS_EXPIRED,
                ],
              },
            },
            data: {
              status: STATUS_PAID,
              payment_method: paymentMethod,
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
            current.plan_name,
            now,
          )

          return toOrderInfo(
            {
              ...current,
              status: STATUS_PAID,
              payment_method: paymentMethod,
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
    where: { name: planName.toUpperCase() },
  })

  if (!plan) {
    throw new Error(`订阅计划不存在: ${planName}`)
  }

  if (planName.toUpperCase() === 'FREE') {
    throw new Error('免费计划无需购买')
  }

  const now = new Date()

  // Cancel existing payable orders before creating a new one.
  const openOrders = await prisma.orders.findMany({
    where: {
      user_id: userId,
      status: { in: [STATUS_PENDING, STATUS_AWAITING_PAYMENT] },
    },
  })
  for (const openOrder of openOrders) {
    if (openOrder.status === STATUS_AWAITING_PAYMENT) {
      await cancelExternalPaymentIfNeeded(openOrder)
    }
  }
  if (openOrders.length > 0) {
    await prisma.orders.updateMany({
      where: {
        user_id: userId,
        status: { in: [STATUS_PENDING, STATUS_AWAITING_PAYMENT] },
      },
      data: { status: STATUS_CANCELLED, updated_at: now },
    })
  }

  const orderNo = generateOrderNo()
  const expiredAt = new Date(now.getTime() + 30 * 60 * 1000) // 30 minutes

  const order = await prisma.orders.create({
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

  return toOrderInfo(order, plan)
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

  // Check if payable order has expired
  if (
    (order.status === STATUS_PENDING ||
      order.status === STATUS_AWAITING_PAYMENT) &&
    order.expired_at < new Date()
  ) {
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
  _paymentMethod: string,
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

  if (order.status !== STATUS_PENDING && order.status !== STATUS_AWAITING_PAYMENT) {
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
        return markOrderPaidAndActivateSubscription(order, PAYMENT_STRIPE)
      }

      if (session.status === 'open' && session.checkoutUrl) {
        const orderInfo = toOrderInfo(
          { ...order, payment_method: PAYMENT_STRIPE },
          plan,
        )
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
          PAYMENT_STRIPE,
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
      payment_method: PAYMENT_STRIPE,
      stripe_payment_intent_id: stripeResult.sessionId,
      updated_at: new Date(),
    },
  })

  const orderInfo = toOrderInfo(
    { ...order, status: STATUS_AWAITING_PAYMENT, payment_method: PAYMENT_STRIPE },
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

  if (order.status !== STATUS_PENDING && order.status !== STATUS_AWAITING_PAYMENT) {
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
          PAYMENT_STRIPE,
          existingIntent.paymentIntentId,
        )
      }

      if (existingIntent.status === 'requires_action') {
        const orderInfo = toOrderInfo(
          { ...order, payment_method: PAYMENT_STRIPE },
          plan,
        )
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
        return markOrderPaidAndActivateSubscription(order, PAYMENT_STRIPE)
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
      PAYMENT_STRIPE,
      chargeResult.paymentIntentId,
    )
  }

  if (chargeResult.status === 'requires_action') {
    await prisma.orders.update({
      where: { id: order.id },
      data: {
        status: STATUS_AWAITING_PAYMENT,
        payment_method: PAYMENT_STRIPE,
        stripe_payment_intent_id: chargeResult.paymentIntentId,
        updated_at: new Date(),
      },
    })

    const orderInfo = toOrderInfo(
      { ...order, status: STATUS_AWAITING_PAYMENT, payment_method: PAYMENT_STRIPE },
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
  paymentMethod: string = PAYMENT_STRIPE,
  externalPaymentId?: string,
): Promise<OrderInfo> {
  const order = await prisma.orders.findUnique({
    where: { order_no: orderNo },
  })

  if (!order) {
    throw new Error(`订单不存在: ${orderNo}`)
  }

  if (order.status === STATUS_PAID) {
    return toOrderInfo(order, null)
  }

  if (
    order.status !== STATUS_PENDING &&
    order.status !== STATUS_AWAITING_PAYMENT &&
    order.status !== STATUS_CANCELLED &&
    order.status !== STATUS_EXPIRED
  ) {
    throw new Error(`订单状态不正确: ${order.status}`)
  }

  return markOrderPaidAndActivateSubscription(
    order,
    paymentMethod,
    externalPaymentId,
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
