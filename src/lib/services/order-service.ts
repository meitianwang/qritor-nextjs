import crypto from 'crypto'
import { prisma } from '@/lib/prisma'
import type { orders, subscription_plans } from '@/generated/prisma/client'
import { subscribe } from './subscription-service'
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

  // Cancel pending orders
  const pendingOrders = await prisma.orders.findMany({
    where: { user_id: userId, status: STATUS_PENDING },
  })
  if (pendingOrders.length > 0) {
    await prisma.orders.updateMany({
      where: { user_id: userId, status: STATUS_PENDING },
      data: { status: STATUS_CANCELLED },
    })
  }

  const orderNo = generateOrderNo()
  const now = new Date()
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
): Promise<OrderInfo> {
  const order = await prisma.orders.findUnique({
    where: { order_no: orderNo },
  })

  if (!order) {
    throw new Error(`订单不存在: ${orderNo}`)
  }

  // Check if pending order has expired
  if (order.status === STATUS_PENDING && order.expired_at < new Date()) {
    await prisma.orders.update({
      where: { id: order.id },
      data: { status: STATUS_EXPIRED },
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
): Promise<OrderInfo> {
  const order = await prisma.orders.findUnique({
    where: { order_no: orderNo },
  })

  if (!order) {
    throw new Error(`订单不存在: ${orderNo}`)
  }

  if (order.status !== STATUS_PENDING && order.status !== STATUS_AWAITING_PAYMENT) {
    throw new Error('订单状态不正确，无法支付')
  }

  if (order.expired_at < new Date()) {
    await prisma.orders.update({
      where: { id: order.id },
      data: { status: STATUS_EXPIRED },
    })
    throw new Error('订单已过期')
  }

  // Initiate Stripe payment
  const plan = await prisma.subscription_plans.findFirst({
    where: { id: order.plan_id },
  })

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
    await prisma.orders.update({
      where: { id: order.id },
      data: { status: STATUS_EXPIRED },
    })
    throw new Error('订单已过期')
  }

  const user = await prisma.users.findFirst({ where: { id: userId } })
  if (!user?.stripe_customer_id) {
    throw new Error('未找到支付账户')
  }

  const chargeResult = await stripeService.chargeWithSavedMethod(
    user.stripe_customer_id,
    paymentMethodId,
    Number(order.amount),
    order.order_no,
  )

  const plan = await prisma.subscription_plans.findFirst({
    where: { id: order.plan_id },
  })

  if (chargeResult.status === 'succeeded') {
    const now = new Date()
    await prisma.orders.update({
      where: { id: order.id },
      data: {
        status: STATUS_PAID,
        payment_method: PAYMENT_STRIPE,
        stripe_payment_intent_id: chargeResult.paymentIntentId,
        paid_at: now,
        updated_at: now,
      },
    })

    await subscribe(order.user_id, order.plan_name)

    return toOrderInfo(
      { ...order, status: STATUS_PAID, payment_method: PAYMENT_STRIPE, paid_at: now },
      plan,
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
  _externalPaymentId?: string,
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

  if (order.status !== STATUS_PENDING && order.status !== STATUS_AWAITING_PAYMENT) {
    throw new Error(`订单状态不正确: ${order.status}`)
  }

  const now = new Date()
  await prisma.orders.update({
    where: { id: order.id },
    data: {
      status: STATUS_PAID,
      payment_method: paymentMethod,
      paid_at: now,
      updated_at: now,
    },
  })

  // Activate subscription
  await subscribe(order.user_id, order.plan_name)

  const plan = await prisma.subscription_plans.findFirst({
    where: { id: order.plan_id },
  })

  return toOrderInfo(
    { ...order, status: STATUS_PAID, payment_method: paymentMethod, paid_at: now },
    plan,
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

  if (order.status !== STATUS_PENDING) {
    throw new Error('只能取消待支付的订单')
  }

  await prisma.orders.update({
    where: { id: order.id },
    data: { status: STATUS_CANCELLED, updated_at: new Date() },
  })
}
