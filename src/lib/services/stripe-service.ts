import Stripe from 'stripe'
import { prisma } from '@/lib/prisma'

// ---------------------------------------------------------------------------
// Stripe Payment Service — keys from environment variables
// ---------------------------------------------------------------------------

interface CheckoutSessionResult {
  checkoutUrl: string | null
  sessionId: string
}

interface WebhookEventResult {
  status: string
  orderNo?: string
  eventType?: string
}

interface ChargeResult {
  paymentIntentId: string
  status: string
  clientSecret?: string | null
}

export interface PaymentMethodInfo {
  id: string
  brand: string
  last4: string
  expMonth: number
  expYear: number
  isDefault: boolean
}

class StripeService {
  private _getStripeClient(): Stripe {
    const secretKey = process.env.STRIPE_SECRET_KEY
    if (!secretKey) {
      throw new Error('STRIPE_SECRET_KEY 环境变量未配置')
    }
    return new Stripe(secretKey)
  }

  // -------------------------------------------------------------------------
  // Customer management
  // -------------------------------------------------------------------------

  async getOrCreateCustomer(userId: bigint, email: string): Promise<string> {
    const user = await prisma.users.findUnique({ where: { id: userId } })
    if (user?.stripe_customer_id) {
      return user.stripe_customer_id
    }

    const stripe = this._getStripeClient()
    const customer = await stripe.customers.create({
      email,
      metadata: { user_id: String(userId) },
    })

    await prisma.users.update({
      where: { id: userId },
      data: { stripe_customer_id: customer.id },
    })

    return customer.id
  }

  // -------------------------------------------------------------------------
  // Checkout sessions
  // -------------------------------------------------------------------------

  async createCheckoutSession(
    orderNo: string,
    planName: string,
    amount: number,
    successUrl: string,
    cancelUrl: string,
    customerId: string,
  ): Promise<CheckoutSessionResult> {
    const stripe = this._getStripeClient()

    const amountCents = Math.round(amount * 100)

    const session = await stripe.checkout.sessions.create({
      customer: customerId,
      payment_method_types: ['card', 'wechat_pay'],
      payment_method_options: {
        card: { setup_future_usage: 'off_session' },
        wechat_pay: { client: 'web' },
      },
      line_items: [
        {
          price_data: {
            currency: 'usd',
            product_data: {
              name: `Qritor ${planName} Plan`,
              description: `Order: ${orderNo}`,
            },
            unit_amount: amountCents,
          },
          quantity: 1,
        },
      ],
      mode: 'payment',
      success_url: successUrl,
      cancel_url: cancelUrl,
      metadata: { order_no: orderNo, plan_name: planName },
    })

    console.log(
      `Stripe Checkout Session created: ${session.id}, order_no: ${orderNo}`,
    )

    return {
      checkoutUrl: session.url,
      sessionId: session.id,
    }
  }

  // -------------------------------------------------------------------------
  // Payment methods
  // -------------------------------------------------------------------------

  async listPaymentMethods(customerId: string): Promise<PaymentMethodInfo[]> {
    const stripe = this._getStripeClient()
    const methods = await stripe.paymentMethods.list({
      customer: customerId,
      type: 'card',
    })

    const defaultPmId = await this.getCustomerDefaultPM(customerId)

    return methods.data.map((pm) => ({
      id: pm.id,
      brand: pm.card?.brand ?? 'unknown',
      last4: pm.card?.last4 ?? '****',
      expMonth: pm.card?.exp_month ?? 0,
      expYear: pm.card?.exp_year ?? 0,
      isDefault: pm.id === defaultPmId,
    }))
  }

  async createSetupIntent(
    customerId: string,
  ): Promise<{ clientSecret: string }> {
    const stripe = this._getStripeClient()
    const intent = await stripe.setupIntents.create({
      customer: customerId,
      payment_method_types: ['card'],
    })

    return { clientSecret: intent.client_secret! }
  }

  async detachPaymentMethod(paymentMethodId: string): Promise<void> {
    const stripe = this._getStripeClient()
    await stripe.paymentMethods.detach(paymentMethodId)
  }

  async setDefaultPaymentMethod(
    customerId: string,
    paymentMethodId: string,
  ): Promise<void> {
    const stripe = this._getStripeClient()
    await stripe.customers.update(customerId, {
      invoice_settings: { default_payment_method: paymentMethodId },
    })
  }

  async getCustomerDefaultPM(customerId: string): Promise<string | null> {
    const stripe = this._getStripeClient()
    const customer = await stripe.customers.retrieve(customerId)
    if (customer.deleted) return null
    const defaultPm = customer.invoice_settings?.default_payment_method
    if (!defaultPm) return null
    return typeof defaultPm === 'string' ? defaultPm : defaultPm.id
  }

  async getPaymentMethodCustomerId(
    paymentMethodId: string,
  ): Promise<string | null> {
    const stripe = this._getStripeClient()
    const pm = await stripe.paymentMethods.retrieve(paymentMethodId)
    if (!pm.customer) return null
    return typeof pm.customer === 'string' ? pm.customer : pm.customer.id
  }

  // -------------------------------------------------------------------------
  // Billing address
  // -------------------------------------------------------------------------

  async getCustomerAddress(
    customerId: string,
  ): Promise<{ country: string; state: string; city: string; line1: string } | null> {
    const stripe = this._getStripeClient()
    const customer = await stripe.customers.retrieve(customerId)
    if (customer.deleted) return null
    const addr = customer.address
    if (!addr) return null
    return {
      country: addr.country || '',
      state: addr.state || '',
      city: addr.city || '',
      line1: addr.line1 || '',
    }
  }

  async updateCustomerAddress(
    customerId: string,
    address: { country: string; state: string; city: string; line1: string },
  ): Promise<void> {
    const stripe = this._getStripeClient()
    await stripe.customers.update(customerId, {
      address: {
        country: address.country,
        state: address.state,
        city: address.city,
        line1: address.line1,
      },
    })
  }

  // -------------------------------------------------------------------------
  // Direct charge with saved method
  // -------------------------------------------------------------------------

  async chargeWithSavedMethod(
    customerId: string,
    paymentMethodId: string,
    amount: number,
    orderNo: string,
  ): Promise<ChargeResult> {
    const stripe = this._getStripeClient()
    const amountCents = Math.round(amount * 100)

    const paymentIntent = await stripe.paymentIntents.create({
      amount: amountCents,
      currency: 'usd',
      customer: customerId,
      payment_method: paymentMethodId,
      off_session: true,
      confirm: true,
      metadata: { order_no: orderNo },
    })

    return {
      paymentIntentId: paymentIntent.id,
      status: paymentIntent.status,
      clientSecret: paymentIntent.client_secret,
    }
  }

  // -------------------------------------------------------------------------
  // Webhook
  // -------------------------------------------------------------------------

  async verifyWebhookSignature(
    payload: string | Buffer,
    sigHeader: string,
  ): Promise<Stripe.Event> {
    const stripe = this._getStripeClient()

    const webhookSecret = process.env.STRIPE_WEBHOOK_SECRET
    if (!webhookSecret) {
      throw new Error('STRIPE_WEBHOOK_SECRET 环境变量未配置')
    }

    const event = stripe.webhooks.constructEvent(
      payload,
      sigHeader,
      webhookSecret,
    )
    return event
  }

  async handleWebhookEvent(
    event: Stripe.Event,
  ): Promise<WebhookEventResult> {
    const eventType = event.type
    console.log(`Stripe Webhook: ${eventType}`)

    if (eventType === 'checkout.session.completed') {
      const session = event.data.object as Stripe.Checkout.Session
      const orderNo = session.metadata?.order_no

      if (orderNo) {
        const { completePaymentViaWebhook } = await import('./order-service')

        await completePaymentViaWebhook(
          orderNo,
          'STRIPE',
          session.payment_intent as string | undefined,
        )
        console.log(`Order ${orderNo} paid, subscription activated`)
        return { status: 'success', orderNo }
      }
    }

    if (eventType === 'payment_intent.succeeded') {
      const paymentIntent = event.data.object as Stripe.PaymentIntent
      const orderNo = paymentIntent.metadata?.order_no

      if (orderNo) {
        const { completePaymentViaWebhook } = await import('./order-service')

        try {
          await completePaymentViaWebhook(orderNo, 'STRIPE', paymentIntent.id)
          console.log(
            `Order ${orderNo} paid via saved method, subscription activated`,
          )
          return { status: 'success', orderNo }
        } catch {
          // Order may already be marked PAID by the pay-with-saved endpoint
          return { status: 'already_processed', orderNo }
        }
      }
    }

    if (eventType === 'checkout.session.expired') {
      const session = event.data.object as Stripe.Checkout.Session
      const orderNo = session.metadata?.order_no
      console.log(`Checkout Session expired: ${orderNo}`)
      return { status: 'expired', orderNo: orderNo ?? undefined }
    }

    return { status: 'ignored', eventType }
  }
}

export const stripeService = new StripeService()
