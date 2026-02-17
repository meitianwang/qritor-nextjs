import { prisma } from '@/lib/prisma'
import { stripeService, PaymentMethodInfo } from './stripe-service'

// ---------------------------------------------------------------------------
// Payment Method Service
// ---------------------------------------------------------------------------

export async function listUserPaymentMethods(
  userId: bigint,
): Promise<PaymentMethodInfo[]> {
  const user = await prisma.users.findUnique({ where: { id: userId } })
  if (!user?.stripe_customer_id) return []

  return stripeService.listPaymentMethods(user.stripe_customer_id)
}

export async function createSetupIntentForUser(
  userId: bigint,
  email: string,
): Promise<{ clientSecret: string }> {
  const customerId = await stripeService.getOrCreateCustomer(userId, email)
  return stripeService.createSetupIntent(customerId)
}

export async function removePaymentMethod(
  userId: bigint,
  paymentMethodId: string,
): Promise<void> {
  const user = await prisma.users.findUnique({ where: { id: userId } })
  if (!user?.stripe_customer_id) {
    throw new Error('未找到支付账户')
  }

  // Verify the payment method belongs to this user
  const pmCustomerId =
    await stripeService.getPaymentMethodCustomerId(paymentMethodId)
  if (pmCustomerId !== user.stripe_customer_id) {
    throw new Error('无权操作此支付方式')
  }

  await stripeService.detachPaymentMethod(paymentMethodId)
}

export async function setDefaultPaymentMethod(
  userId: bigint,
  paymentMethodId: string,
): Promise<void> {
  const user = await prisma.users.findUnique({ where: { id: userId } })
  if (!user?.stripe_customer_id) {
    throw new Error('未找到支付账户')
  }

  const pmCustomerId =
    await stripeService.getPaymentMethodCustomerId(paymentMethodId)
  if (pmCustomerId !== user.stripe_customer_id) {
    throw new Error('无权操作此支付方式')
  }

  await stripeService.setDefaultPaymentMethod(
    user.stripe_customer_id,
    paymentMethodId,
  )
}

export interface BillingAddress {
  country: string
  state: string
  city: string
  line1: string
}

export async function getBillingAddress(
  userId: bigint,
): Promise<BillingAddress | null> {
  const user = await prisma.users.findUnique({ where: { id: userId } })
  if (!user?.stripe_customer_id) return null
  return stripeService.getCustomerAddress(user.stripe_customer_id)
}

export async function updateBillingAddress(
  userId: bigint,
  email: string,
  address: BillingAddress,
): Promise<void> {
  const customerId = await stripeService.getOrCreateCustomer(userId, email)
  await stripeService.updateCustomerAddress(customerId, address)
}
