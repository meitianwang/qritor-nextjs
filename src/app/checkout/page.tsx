'use client'

import { Suspense, useState, useEffect, useCallback } from 'react'
import { useSearchParams, useRouter } from 'next/navigation'
import Link from 'next/link'
import { loadStripe, type Stripe } from '@stripe/stripe-js'
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

interface SavedPaymentMethod {
    id: string
    brand: string
    last4: string
    expMonth: number
    expYear: number
    isDefault: boolean
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
    const [savedMethods, setSavedMethods] = useState<SavedPaymentMethod[]>([])
    const [selectedMethodId, setSelectedMethodId] = useState<string | null>(null) // null = use new card
    const [stripePromise, setStripePromise] = useState<Promise<Stripe | null> | null>(null)

    const fetchPlanDetails = useCallback(async () => {
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
        } catch {
            setError(t('checkout.errors.networkError'))
        } finally {
            setLoading(false)
        }
    }, [planName, t])

    const fetchSavedMethods = useCallback(async () => {
        try {
            const res = await authFetch('/api/payment-methods')
            const data = await res.json()
            if (data.code === 200 && data.data) {
                setSavedMethods(data.data)
                // Pre-select default card
                const defaultMethod = data.data.find((m: SavedPaymentMethod) => m.isDefault)
                if (defaultMethod) {
                    setSelectedMethodId(defaultMethod.id)
                } else if (data.data.length > 0) {
                    setSelectedMethodId(data.data[0].id)
                }
            }
        } catch {
            // No saved methods, proceed with new card flow
        }
    }, [])

    const ensureStripe = useCallback(async (): Promise<Stripe | null> => {
        if (stripePromise) {
            return stripePromise
        }

        const cfgRes = await fetch('/api/stripe/config/public')
        const cfgData = await cfgRes.json()
        if (cfgData.code !== 200 || !cfgData.data?.publishableKey) {
            return null
        }

        const promise = loadStripe(cfgData.data.publishableKey)
        setStripePromise(promise)
        return promise
    }, [stripePromise])

    // Fetch plan details and saved payment methods
    useEffect(() => {
        fetchPlanDetails()
        fetchSavedMethods()
    }, [fetchPlanDetails, fetchSavedMethods])

    // Create order and pay
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
            const createResponse = await authFetch('/api/orders', {
                method: 'POST',
                body: { planName }
            })
            const createData = await createResponse.json()

            if (createData.code !== 200 || !createData.data) {
                setError(createData.message || t('checkout.errors.createOrderFailed'))
                return
            }

            const orderNo = createData.data.orderNo || createData.data.order_no

            // 2. Pay with saved method or redirect to Stripe Checkout
            if (selectedMethodId) {
                const payResponse = await authFetch(`/api/orders/${orderNo}/pay-with-saved`, {
                    method: 'POST',
                    body: { paymentMethodId: selectedMethodId }
                })
                const payData = await payResponse.json()

                if (payData.code === 200 && payData.data) {
                    if (payData.data.status === 'PAID') {
                        router.push(`/payment/success?orderNo=${orderNo}`)
                        return
                    }
                    if (payData.data.requiresAction && payData.data.clientSecret) {
                        const stripe = await ensureStripe()
                        if (!stripe) {
                            setError(t('checkout.errors.initiatePaymentFailed'))
                            return
                        }

                        const confirmation = await stripe.confirmCardPayment(payData.data.clientSecret)
                        if (confirmation.error) {
                            setError(confirmation.error.message || t('checkout.errors.authRequired'))
                            return
                        }

                        if (confirmation.paymentIntent?.status === 'succeeded') {
                            const finalizeResponse = await authFetch(`/api/orders/${orderNo}/pay-with-saved`, {
                                method: 'POST',
                                body: { paymentMethodId: selectedMethodId }
                            })
                            const finalizeData = await finalizeResponse.json()
                            if (finalizeData.code === 200 && finalizeData.data?.status === 'PAID') {
                                router.push(`/payment/success?orderNo=${orderNo}`)
                                return
                            }
                            setError(finalizeData.message || t('checkout.errors.initiatePaymentFailed'))
                            return
                        }

                        setError(t('checkout.errors.initiatePaymentFailed'))
                    } else {
                        setError(payData.message || t('checkout.errors.initiatePaymentFailed'))
                    }
                } else {
                    setError(payData.message || t('checkout.errors.initiatePaymentFailed'))
                }
            } else {
                // Use new card — redirect to Stripe Checkout
                const payResponse = await authFetch(`/api/orders/${orderNo}/pay`, {
                    method: 'POST',
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
            }
        } catch {
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

                            {/* Payment method selector */}
                            {savedMethods.length > 0 && (
                                <div style={{ marginBottom: '1rem' }}>
                                    <span className="payment-methods-label">{t('checkout.savedPaymentMethods')}</span>
                                    <div style={{ display: 'flex', flexDirection: 'column', gap: '0.5rem', marginTop: '0.5rem' }}>
                                        {savedMethods.map((pm) => (
                                            <label
                                                key={pm.id}
                                                style={{
                                                    display: 'flex',
                                                    alignItems: 'center',
                                                    gap: '0.75rem',
                                                    padding: '0.6rem 0.75rem',
                                                    background: selectedMethodId === pm.id ? 'rgba(var(--color-primary-rgb, 99, 102, 241), 0.1)' : 'var(--color-bg-tertiary)',
                                                    border: selectedMethodId === pm.id ? '1px solid var(--color-primary)' : '1px solid var(--color-border)',
                                                    borderRadius: 'var(--radius-md)',
                                                    cursor: 'pointer',
                                                    fontSize: '0.875rem',
                                                }}
                                            >
                                                <input
                                                    type="radio"
                                                    name="paymentMethod"
                                                    checked={selectedMethodId === pm.id}
                                                    onChange={() => setSelectedMethodId(pm.id)}
                                                    style={{ accentColor: 'var(--color-primary)' }}
                                                />
                                                <span>💳 {pm.brand.charAt(0).toUpperCase() + pm.brand.slice(1)} •••• {pm.last4}</span>
                                                {pm.isDefault && (
                                                    <span style={{
                                                        fontSize: '0.7rem',
                                                        color: 'var(--color-primary)',
                                                        background: 'rgba(var(--color-primary-rgb, 99, 102, 241), 0.15)',
                                                        padding: '0.1rem 0.3rem',
                                                        borderRadius: 'var(--radius-sm)',
                                                    }}>
                                                        {t('profile.billing.defaultBadge')}
                                                    </span>
                                                )}
                                            </label>
                                        ))}
                                        <label
                                            style={{
                                                display: 'flex',
                                                alignItems: 'center',
                                                gap: '0.75rem',
                                                padding: '0.6rem 0.75rem',
                                                background: selectedMethodId === null ? 'rgba(var(--color-primary-rgb, 99, 102, 241), 0.1)' : 'var(--color-bg-tertiary)',
                                                border: selectedMethodId === null ? '1px solid var(--color-primary)' : '1px solid var(--color-border)',
                                                borderRadius: 'var(--radius-md)',
                                                cursor: 'pointer',
                                                fontSize: '0.875rem',
                                            }}
                                        >
                                            <input
                                                type="radio"
                                                name="paymentMethod"
                                                checked={selectedMethodId === null}
                                                onChange={() => setSelectedMethodId(null)}
                                                style={{ accentColor: 'var(--color-primary)' }}
                                            />
                                            <span>{t('checkout.useNewCard')}</span>
                                        </label>
                                    </div>
                                </div>
                            )}

                            {/* Supported payment methods (show only for new card flow) */}
                            {(savedMethods.length === 0 || selectedMethodId === null) && (
                                <div className="payment-methods-preview">
                                    <span className="payment-methods-label">{t('checkout.supportedPaymentMethods')}</span>
                                    <div className="payment-method-icons">
                                        <span title={t('checkout.creditCard')}>💳</span>
                                        <span title={t('checkout.wechat')}>🟢</span>
                                    </div>
                                </div>
                            )}

                            <button
                                className="checkout-btn"
                                onClick={handleCheckout}
                                disabled={processing}
                            >
                                {processing
                                    ? t('checkout.redirecting')
                                    : selectedMethodId
                                        ? t('checkout.payWithSavedCard')
                                        : t('checkout.payNow')
                                }
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
