'use client'

import { useState, useEffect } from 'react'
import Link from 'next/link'
import { useAuth } from '@/hooks/useAuth'
import { useTranslation } from '@/hooks/useTranslation'
import { useDocumentMeta } from '@/hooks/useDocumentMeta'
import { authFetch, tryRestoreToken } from '@/lib/auth-utils'

interface Plan {
    id?: string
    name: string
    displayName?: string
    price?: number
    originalPrice?: number
    monthlyCredits?: number
    maxProjects?: number
    description?: string
    features?: string[]
}

/**
 * Pricing page - dynamically fetches plan info from backend
 */
export default function PricingPage() {
    // FAQ expand state
    const [openFaqIndex, setOpenFaqIndex] = useState(-1)

    // Plans list (from backend)
    const [plans, setPlans] = useState<Plan[]>([])
    const [plansLoading, setPlansLoading] = useState(true)

    // User subscription state
    const { getAccessToken, getUser } = useAuth()
    const [currentPlan, setCurrentPlan] = useState<string | null>(null)
    const [loading, setLoading] = useState(true)
    const user = getUser()
    const { t, language } = useTranslation('portal')

    // SEO
    useDocumentMeta({
        title: t('seo.pricing.title'),
        description: t('seo.pricing.description')
    })

    // Fetch all plans
    useEffect(() => {
        const fetchPlans = async () => {
            try {
                const response = await authFetch(`/api/subscription/plans?lang=${language}`)
                const data = await response.json()
                console.log('[PricingPage] plans response:', data)
                if (data.code === 200 && data.data) {
                    setPlans(data.data)
                }
            } catch (err) {
                console.error('Failed to fetch plans:', err)
            } finally {
                setPlansLoading(false)
            }
        }
        fetchPlans()
    }, [language])

    // Fetch user subscription - try restoring token first
    useEffect(() => {
        const fetchSubscription = async () => {
            await tryRestoreToken()

            const token = getAccessToken()
            console.log('[PricingPage] token:', token ? 'exists' : 'none')
            if (!token) {
                setLoading(false)
                return
            }

            try {
                const response = await authFetch('/api/subscription/current')
                const data = await response.json()
                console.log('[PricingPage] subscription response:', data)
                if (data.code === 200 && data.data) {
                    const planName = data.data.planName || data.data.plan_name
                    console.log('[PricingPage] planName:', planName)
                    setCurrentPlan(planName?.toUpperCase())
                }
            } catch (err) {
                console.error('Failed to fetch subscription:', err)
            } finally {
                setLoading(false)
            }
        }

        fetchSubscription()
    }, [])

    // Dynamically generate plan level mapping based on backend return order
    const planLevels = plans.reduce<Record<string, number>>((acc, plan, index) => {
        if (plan.name) {
            acc[plan.name.toUpperCase()] = index
        }
        return acc
    }, {})

    // Get button display state
    const getButtonState = (plan: Plan, planIndex: number) => {
        const planName = plan.name?.toUpperCase() || ''

        if (!user) {
            const isFirstPaidPlan = planName !== 'FREE' && planIndex === 1
            return { text: planName === 'FREE' ? t('pricing.download') : t('pricing.subscribe'), disabled: false, isCurrentPlan: false, isHighlighted: isFirstPaidPlan, hidden: false }
        }

        if (loading) {
            return { text: t('common.loading'), disabled: true, isCurrentPlan: false, isHighlighted: false, hidden: false }
        }

        const currentLevel = planLevels[currentPlan || ''] ?? 0
        const targetLevel = planLevels[planName] ?? 0

        if (currentPlan === planName) {
            return { text: t('pricing.currentPlan'), disabled: true, isCurrentPlan: true, isHighlighted: false, hidden: false }
        } else if (targetLevel < currentLevel) {
            return { text: '', disabled: true, isCurrentPlan: false, isHighlighted: false, hidden: true }
        } else {
            const isNextPlan = targetLevel === currentLevel + 1
            return { text: t('pricing.subscribe'), disabled: false, isCurrentPlan: false, isHighlighted: isNextPlan, hidden: false }
        }
    }

    // Check icon component
    const CheckIcon = () => (
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
            <polyline points="20 6 9 17 4 12" />
        </svg>
    )

    // Chevron icon component
    const ChevronIcon = ({ isOpen }: { isOpen: boolean }) => (
        <svg
            width="20"
            height="20"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            strokeWidth="2"
            className={`faq-chevron ${isOpen ? 'faq-chevron-open' : ''}`}
        >
            <polyline points="6 9 12 15 18 9" />
        </svg>
    )

    // FAQ data
    const faqItems = [
        {
            question: t('faq.q1'),
            answer: t('faq.a1')
        },
        {
            question: t('faq.q2'),
            answer: t('faq.a2')
        },
        {
            question: t('faq.q3'),
            answer: t('faq.a3')
        },
        {
            question: t('faq.q4'),
            answer: t('faq.a4')
        }
    ]

    // Toggle FAQ
    const toggleFaq = (index: number) => {
        setOpenFaqIndex(openFaqIndex === index ? -1 : index)
    }

    // Render plan button
    const renderPlanButton = (plan: Plan, linkTo: string, planIndex: number) => {
        const state = getButtonState(plan, planIndex)

        if (state.hidden) {
            return <div style={{ height: '48px' }}></div>
        }

        if (state.disabled) {
            return (
                <button
                    className={`btn ${state.isCurrentPlan ? 'btn-current' : 'btn-secondary'} btn-large`}
                    disabled
                    style={{
                        opacity: state.isCurrentPlan ? 1 : 0.6,
                        cursor: 'not-allowed',
                        background: state.isCurrentPlan ? 'linear-gradient(135deg, #10b981, #059669)' : undefined
                    }}
                >
                    {state.isCurrentPlan && (
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" style={{ marginRight: '0.5rem' }}>
                            <polyline points="20 6 9 17 4 12" />
                        </svg>
                    )}
                    {state.text}
                </button>
            )
        }

        const isHighlighted = state.isHighlighted
        return (
            <Link
                href={linkTo}
                className={`btn ${isHighlighted ? 'btn-highlighted' : 'btn-secondary'} btn-large`}
            >
                {state.text}
            </Link>
        )
    }

    return (
        <>
            {/* Page header - Qoder style */}
            <section className="page-header pricing-header">
                <div className="container">
                    <h1 className="page-title animate-fade-in">{t('pricing.title')}</h1>
                    <div className="subtitle-row animate-fade-in delay-100">
                        <p className="page-subtitle">{t('pricing.subtitle')}</p>
                        <a href="/docs" className="learn-more-link">
                            {t('common.learnMore')} <span className="arrow">↗</span>
                        </a>
                    </div>
                    <div className="pricing-notes animate-fade-in delay-200">
                        <p>{t('pricing.creditsNote')}</p>
                        <p>{t('pricing.taxNote')}</p>
                    </div>
                </div>
            </section>


            {/* Subscription title */}
            <section className="pricing-category-title animate-fade-in delay-300">
                <div className="container">
                    <h2>订阅</h2>
                </div>
            </section>

            {/* Pricing cards - connected design */}
            <section className="pricing-section animate-fade-in delay-300">
                <div className="container">
                    <div className="pricing-super-container">
                        <div
                            className="pricing-grid"
                            style={{
                                gridTemplateColumns: plans.length ? `repeat(${plans.length}, 1fr)` : undefined
                            }}
                        >
                            {plansLoading ? (
                                <div style={{
                                    gridColumn: '1 / -1',
                                    textAlign: 'center',
                                    padding: 'var(--spacing-4xl) 0',
                                    color: 'var(--color-text-tertiary)'
                                }}>
                                    {t('common.loading') || '加载中...'}
                                </div>
                            ) : (
                                plans.map((plan, index) => {
                                    const planName = plan.name?.toUpperCase() || ''
                                    const isFeatured = planName === 'PRO'

                                    return (
                                        <div
                                            key={plan.id || index}
                                            className={`pricing-card ${isFeatured ? 'pricing-card-featured' : ''}`}
                                        >
                                            {planName !== 'FREE' && plan.originalPrice && (
                                                <span className="price-discount-tag">立省 50%</span>
                                            )}
                                            <div className="pricing-card-header">
                                                <h3 className="pricing-name">{plan.displayName || plan.name}</h3>
                                                <div className="pricing-price">
                                                    <span className="price-amount">${plan.price ?? 0}</span>
                                                    {plan.originalPrice && (
                                                        <span className="price-original">${plan.originalPrice}</span>
                                                    )}
                                                    <span className="price-period">{t('pricing.perMonth')}</span>
                                                </div>
                                            </div>
                                            {renderPlanButton(
                                                plan,
                                                planName === 'FREE' ? '/download' : `/checkout?plan=${planName.toLowerCase()}`,
                                                index
                                            )}
                                            {plan.description && (
                                                <p className="pricing-desc">{plan.description}</p>
                                            )}
                                            <ul className="pricing-features">
                                                {plan.features?.map((feature, idx) => (
                                                    <li key={idx} className="pricing-feature">
                                                        <CheckIcon />
                                                        {feature}
                                                    </li>
                                                ))}
                                            </ul>
                                        </div>
                                    )
                                })
                            )}
                        </div>
                    </div>
                </div>
            </section>

            {/* Boost pack title */}
            <section className="pricing-category-title animate-fade-in delay-400">
                <div className="container">
                    <h2>{t('pricing.boostPack')}</h2>
                </div>
            </section>

            {/* Boost pack - Coming soon */}
            <section className="pricing-section animate-fade-in delay-400">
                <div className="container">
                    <div className="boost-pack-coming-soon">
                        <p>{t('pricing.comingSoon')}</p>
                    </div>
                </div>
            </section>

            {/* FAQ */}
            <section className="faq-section">
                <div className="container">
                    <h2 className="section-title">{t('faq.title')}</h2>
                    <div className="faq-accordion">
                        {faqItems.map((item, index) => (
                            <div
                                key={index}
                                className={`faq-accordion-item ${openFaqIndex === index ? 'faq-accordion-item-open' : ''}`}
                            >
                                <button
                                    className="faq-accordion-header"
                                    onClick={() => toggleFaq(index)}
                                >
                                    <span className="faq-accordion-question">{item.question}</span>
                                    <ChevronIcon isOpen={openFaqIndex === index} />
                                </button>
                                <div className="faq-accordion-content">
                                    <p className="faq-accordion-answer">{item.answer}</p>
                                </div>
                            </div>
                        ))}
                    </div>
                </div>
            </section>

        </>
    )
}
