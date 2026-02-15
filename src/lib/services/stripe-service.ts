import Stripe from 'stripe'
import { systemConfigService, ConfigKeys } from './system-config-service'

// ---------------------------------------------------------------------------
// Stripe Payment Service
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

interface ConnectionTestResult {
  success: boolean
  message: string
  accountId?: string
}

class StripeService {
  // -------------------------------------------------------------------------
  // Internal: Stripe client from system config
  // -------------------------------------------------------------------------

  private async _getStripeClient(): Promise<Stripe> {
    const secretKey = await systemConfigService.getConfig(
      ConfigKeys.STRIPE_SECRET_KEY,
    )
    if (!secretKey) {
      throw new Error('Stripe 密钥未配置')
    }

    return new Stripe(secretKey)
  }

  // -------------------------------------------------------------------------
  // Public API
  // -------------------------------------------------------------------------

  async createCheckoutSession(
    orderNo: string,
    planName: string,
    amount: number,
    successUrl: string,
    cancelUrl: string,
    customerEmail?: string,
  ): Promise<CheckoutSessionResult> {
    const stripe = await this._getStripeClient()

    try {
      const amountCents = Math.round(amount * 100)

      const sessionParams: Stripe.Checkout.SessionCreateParams = {
        payment_method_types: ['card', 'alipay', 'wechat_pay'],
        line_items: [
          {
            price_data: {
              currency: 'cny',
              product_data: {
                name: `Qritor ${planName} 订阅`,
                description: `订单号: ${orderNo}`,
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
        payment_method_options: {
          wechat_pay: { client: 'web' },
        },
      }

      if (customerEmail) {
        sessionParams.customer_email = customerEmail
      }

      const session = await stripe.checkout.sessions.create(sessionParams)

      console.log(
        `Stripe Checkout Session 创建成功: ${session.id}, order_no: ${orderNo}`,
      )

      return {
        checkoutUrl: session.url,
        sessionId: session.id,
      }
    } catch (error) {
      console.error(`创建 Stripe Checkout Session 失败: ${error}`)
      throw new Error(`创建支付会话失败: ${String(error)}`)
    }
  }

  async verifyWebhookSignature(
    payload: string | Buffer,
    sigHeader: string,
  ): Promise<Stripe.Event> {
    const stripe = await this._getStripeClient()

    const webhookSecret = await systemConfigService.getConfig(
      ConfigKeys.STRIPE_WEBHOOK_SECRET,
    )
    if (!webhookSecret) {
      throw new Error('Stripe Webhook 密钥未配置')
    }

    try {
      const event = stripe.webhooks.constructEvent(
        payload,
        sigHeader,
        webhookSecret,
      )
      return event
    } catch (error) {
      console.error(`Webhook 签名验证失败: ${error}`)
      throw new Error('Webhook 签名验证失败')
    }
  }

  async handleWebhookEvent(
    event: Stripe.Event,
  ): Promise<WebhookEventResult> {
    const eventType = event.type
    console.log(`处理 Stripe Webhook: ${eventType}`)

    if (eventType === 'checkout.session.completed') {
      const session = event.data.object as Stripe.Checkout.Session
      const orderNo = session.metadata?.order_no

      if (orderNo) {
        // Lazy-import order service to avoid circular dependencies
        const { completePaymentViaWebhook } = await import('./order-service')

        try {
          await completePaymentViaWebhook(
            orderNo,
            'STRIPE',
            session.payment_intent as string | undefined,
          )
          console.log(`订单 ${orderNo} 支付完成，订阅已激活`)
          return { status: 'success', orderNo }
        } catch (error) {
          console.error(`处理支付完成失败: ${error}`)
          throw error
        }
      }
    }

    if (eventType === 'checkout.session.expired') {
      const session = event.data.object as Stripe.Checkout.Session
      const orderNo = session.metadata?.order_no
      console.log(`Checkout Session 已过期: ${orderNo}`)
      return { status: 'expired', orderNo: orderNo ?? undefined }
    }

    return { status: 'ignored', eventType }
  }

  async testConnection(): Promise<ConnectionTestResult> {
    try {
      const stripe = await this._getStripeClient()
      const account = await stripe.accounts.retrieve()
      return { success: true, message: '连接成功', accountId: account.id }
    } catch (error) {
      return { success: false, message: String(error) }
    }
  }
}

export const stripeService = new StripeService()
