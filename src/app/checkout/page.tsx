'use client'

import { Suspense, useState, useEffect } from 'react'
import { useSearchParams, useRouter } from 'next/navigation'
import Link from 'next/link'
import { useAuth } from '@/hooks/useAuth'
import { useTranslation } from '@/hooks/useTranslation'
import { authFetch } from '@/lib/auth-utils'

interface Plan {
    name: string
    displayName?: string
    price?: number
    monthlyCredits?: number
    maxProjects?: number
    features?: string[]
}

/**
 * Checkout page
 * Shows subscription plan details and order summary, then redirects to Stripe payment
 */
function CheckoutPageContent() {
    const { t } = useTranslation('portal')
    const searchParams = useSearchParams()
    const router = useRouter()
    const { getAccessToken } = useAuth()
    const planName = searchParams.get('plan') || 'pro'

    const [plan, setPlan] = useState<Plan | null>(null)
    const [loading, setLoading] = useState(true)
    const [error, setError] = useState<string | null>(null)
    const [processing, setProcessing] = useState(false)

    // Fetch plan details
    useEffect(() => {
        fetchPlanDetails()
    }, [planName])

    const fetchPlanDetails = async () => {
        try {
            setLoading(true)
            const response = await authFetch('/api/subscription/plans')
            const data = await response.json()

            if (data.code === 200 && data.data) {
                const targetPlan = data.data.find(
                    (p: Plan) => p.name.toLowerCase() === planName.toLowerCase()
                )
                if (targetPlan) {
                    setPlan(targetPlan)
                } else {
                    setError(t('checkout.errors.planNotFound'))
                }
            } else {
                setError(t('checkout.errors.fetchFailed'))
            }
        } catch (err) {
            setError(t('checkout.errors.networkError'))
        } finally {
            setLoading(false)
        }
    }

    // Create order and redirect to Stripe payment
    const handleCheckout = async () => {
        const token = getAccessToken()
        if (!token) {
            router.push('/login?redirect=' + encodeURIComponent('/checkout?plan=' + planName))
            return
        }

        try {
            setProcessing(true)
            setError(null)

            // 1. Create order
            const createResponse = await authFetch(`/api/order/create?planName=${planName}`, {
                method: 'POST'
            })
            const createData = await createResponse.json()

            if (createData.code !== 200 || !createData.data) {
                setError(createData.message || t('checkout.errors.createOrderFailed'))
                return
            }

            const orderNo = createData.data.orderNo || createData.data.order_no

            // 2. Initiate payment, get Stripe Checkout URL
            const payResponse = await authFetch(`/api/order/${orderNo}/pay`, {
                method: 'POST',
                body: { paymentMethod: 'STRIPE' }
            })
            const payData = await payResponse.json()

            if (payData.code === 200 && payData.data) {
                const checkoutUrl = payData.data.checkout_url || payData.data.checkoutUrl
                if (checkoutUrl) {
                    window.location.href = checkoutUrl
                } else {
                    setError(t('checkout.errors.getPaymentLinkFailed'))
                }
            } else {
                setError(payData.message || t('checkout.errors.initiatePaymentFailed'))
            }
        } catch (err) {
            setError(t('checkout.errors.networkError'))
        } finally {
            setProcessing(false)
        }
    }

    // Check icon
    const CheckIcon = () => (
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
            <polyline points="20 6 9 17 4 12" />
        </svg>
    )

    if (loading) {
        return (
            <div className="checkout-page">
                <div className="checkout-container">
                    <div className="checkout-loading">
                        <div className="loading-spinner"></div>
                        <span className="loading-text">{t('common.loading')}</span>
                    </div>
                </div>
            </div>
        )
    }

    if (!plan) {
        return (
            <div className="checkout-page">
                <div className="checkout-container">
                    <div className="checkout-error">
                        <div className="error-icon">😞</div>
                        <p className="error-message">{error || t('checkout.errors.planNotFound')}</p>
                        <Link href="/pricing" className="error-action">{t('checkout.backToPricing')}</Link>
                    </div>
                </div>
            </div>
        )
    }

    return (
        <div className="checkout-page">
                <div className="checkout-container">
                    {/* Page title */}
                    <div className="checkout-header">
                        <h1 className="checkout-title">{t('checkout.title')}</h1>
                        <p className="checkout-subtitle">{t('checkout.subtitle', { plan: plan.displayName || plan.name })}</p>
                    </div>

                    {/* Error alert */}
                    {error && (
                        <div className="checkout-alert checkout-alert-error">
                            <span>⚠️ {error}</span>
                        </div>
                    )}

                    {/* Two-column layout */}
                    <div className="checkout-content">
                        {/* Left: plan details */}
                        <div className="checkout-plan-card">
                            <div className="plan-card-header">
                                <h2 className="plan-card-name">{plan.displayName}</h2>
                                {plan.name === 'PRO' && (
                                    <span className="plan-card-badge">{t('checkout.recommended')}</span>
                                )}
                            </div>

                            <div className="plan-card-price">
                                <span className="plan-price-amount">${plan.price}</span>
                                <span className="plan-price-period">{t('pricing.perMonth')}</span>
                            </div>

                            <h3 className="plan-features-title">{t('checkout.featuresIncluded')}</h3>
                            <ul className="plan-features-list">
                                <li className="plan-feature-item">
                                    <CheckIcon />
                                    {t('checkout.monthlyCredits', { count: plan.monthlyCredits ?? 0 })}
                                </li>
                                <li className="plan-feature-item">
                                    <CheckIcon />
                                    {plan.maxProjects === -1
                                        ? t('checkout.unlimitedProjects')
                                        : t('checkout.monthlyProjects', { count: plan.maxProjects ?? 0 })}
                                </li>
                                {plan.features && plan.features.map((feature, index) => (
                                    <li key={index} className="plan-feature-item">
                                        <CheckIcon />
                                        {feature}
                                    </li>
                                ))}
                            </ul>
                        </div>

                        {/* Right: order summary */}
                        <div className="checkout-summary">
                            <h3 className="summary-title">{t('checkout.orderSummary')}</h3>

                            <div className="summary-row">
                                <span className="summary-label">{t('checkout.plan')}</span>
                                <span className="summary-value">{plan.displayName}</span>
                            </div>
                            <div className="summary-row">
                                <span className="summary-label">{t('checkout.billingCycle')}</span>
                                <span className="summary-value">{t('checkout.monthlyBilling')}</span>
                            </div>
                            <div className="summary-row">
                                <span className="summary-label">{t('pricing.credits')}</span>
                                <span className="summary-value">{plan.monthlyCredits} {t('pricing.creditsPerMonth')}</span>
                            </div>

                            <div className="summary-divider"></div>

                            <div className="summary-total">
                                <span className="summary-total-label">{t('checkout.total')}</span>
                                <span className="summary-total-value">${plan.price}</span>
                            </div>

                            {/* Supported payment methods */}
                            <div className="payment-methods-preview">
                                <span className="payment-methods-label">{t('checkout.supportedPaymentMethods')}</span>
                                <div className="payment-method-icons">
                                    <span title={t('checkout.creditCard')}>💳</span>
                                    <span title={t('checkout.alipay')}>🔵</span>
                                    <span title={t('checkout.wechat')}>🟢</span>
                                </div>
                            </div>

                            <button
                                className="checkout-btn"
                                onClick={handleCheckout}
                                disabled={processing}
                            >
                                {processing ? t('checkout.redirecting') : t('checkout.payNow')}
                            </button>

                            <div className="security-notice">
                                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                                    <rect x="3" y="11" width="18" height="11" rx="2" ry="2" />
                                    <path d="M7 11V7a5 5 0 0 1 10 0v4" />
                                </svg>
                                <span>{t('checkout.securePaymentDesc')}</span>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    )
}

export default function CheckoutPage() {
    return (
        <Suspense fallback={<div />}>
            <CheckoutPageContent />
        </Suspense>
    )
}
