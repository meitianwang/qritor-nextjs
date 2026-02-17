'use client'

import { Suspense, useState, useEffect } from 'react'
import { useRouter } from 'next/navigation'
import { useAuth } from '@/hooks/useAuth'
import { useTranslation } from '@/hooks/useTranslation'
import { authFetch } from '@/lib/auth-utils'
import PaymentMethodsList from '@/components/profile/PaymentMethodsList'
import BillingAddressSection from '@/components/profile/BillingAddressSection'

function BillingManagePageContent() {
    const { t } = useTranslation('portal')
    const router = useRouter()
    const { getUser, restoreToken } = useAuth()

    const [mounted, setMounted] = useState(false)
    const [authChecked, setAuthChecked] = useState(false)

    useEffect(() => { setMounted(true) }, [])

    useEffect(() => {
        if (!mounted) return
        let cancelled = false
        const verify = async () => {
            const ok = await restoreToken()
            if (cancelled) return
            setAuthChecked(true)
            if (!ok) {
                router.replace('/login?redirect=' + encodeURIComponent('/profile/billing'))
            }
        }
        verify()
        return () => { cancelled = true }
    }, [mounted, restoreToken, router])

    const user = mounted && authChecked ? getUser() : null

    if (!mounted || !authChecked || !user) return null

    return (
        <div className="portal-page">
            <main className="profile-page">
                <div className="container">
                    <div className="billing-manage-page">
                        {/* Back link */}
                        <button
                            className="billing-back-link"
                            onClick={() => router.push('/profile?tab=billing')}
                        >
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                                <polyline points="15 18 9 12 15 6" />
                            </svg>
                            {t('billingManage.backToProfile')}
                        </button>

                        <h1 className="billing-manage-title">{t('billingManage.title')}</h1>

                        {/* Billing info notes */}
                        <div className="billing-info-card">
                            <div className="billing-info-icon">
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                                    <circle cx="12" cy="12" r="10" />
                                    <path d="M12 16v-4" />
                                    <path d="M12 8h.01" />
                                </svg>
                            </div>
                            <div className="billing-info-content">
                                <p className="billing-info-title">{t('billingManage.noticeTitle')}</p>
                                <ul className="billing-info-list">
                                    <li>{t('billingManage.notice1')}</li>
                                    <li>{t('billingManage.notice2')}</li>
                                    <li>{t('billingManage.notice3')}</li>
                                </ul>
                            </div>
                        </div>

                        {/* Payment methods */}
                        <h2 className="billing-section-title">{t('billingManage.paymentMethods')}</h2>
                        <PaymentMethodsList />

                        {/* Billing address */}
                        <h2 className="billing-section-title">{t('billingManage.billingAddress')}</h2>
                        <BillingAddressSection />
                    </div>
                </div>
            </main>
        </div>
    )
}

export default function BillingManagePage() {
    return (
        <Suspense fallback={<div />}>
            <BillingManagePageContent />
        </Suspense>
    )
}
