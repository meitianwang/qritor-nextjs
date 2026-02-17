'use client'

import Link from 'next/link'
import { useTranslation } from '@/hooks/useTranslation'

interface SubscriptionData {
    planName?: string
    displayName?: string
    price?: number
    status?: string | null
    expireAt?: string | null
    autoRenew?: boolean
}

interface BillingSectionProps {
    subscriptionData?: SubscriptionData
}

/**
 * Subscription and billing section component
 */
function BillingSection({ subscriptionData }: BillingSectionProps) {
    const { t } = useTranslation('portal')

    const planName = subscriptionData?.planName || 'FREE'
    const displayName = subscriptionData?.displayName || t('profile.billing.free')
    const price = subscriptionData?.price ?? 0
    const isFree = planName.toUpperCase() === 'FREE'

    return (
        <div className="profile-content">
            <h2 className="profile-section-title">{t('profile.billing.title')}</h2>

            {/* Current plan */}
            <div className="profile-card">
                <div className="billing-plan">
                    <div className="billing-plan-info">
                        <h3 className="billing-plan-name">{displayName}</h3>
                        <p className="billing-plan-price">${price.toFixed(2)}/{t('common.month')}</p>
                    </div>
                </div>
                {isFree ? (
                    <div className="billing-upgrade">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                            <circle cx="12" cy="12" r="10"></circle>
                            <path d="M12 16v-4"></path>
                            <path d="M12 8h.01"></path>
                        </svg>
                        <span>{t('profile.billing.upgradeNote')}</span>
                        <Link href="/pricing" className="btn btn-primary btn-sm">{t('pricing.upgrade')}</Link>
                    </div>
                ) : (
                    <div className="billing-upgrade">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                            <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path>
                            <polyline points="22 4 12 14.01 9 11.01"></polyline>
                        </svg>
                        <span>{t('profile.billing.currentPlanNote')}</span>
                        <Link href="/pricing" className="btn btn-secondary btn-sm">{t('profile.billing.viewPlans')}</Link>
                    </div>
                )}
            </div>

            {/* Billing management */}
            <div className="profile-card">
                <div className="billing-manage">
                    <div className="billing-manage-info">
                        <h3 className="profile-card-title">{t('profile.billing.manageBilling')}</h3>
                        <p className="profile-card-desc">{t('profile.billing.manageBillingDesc')}</p>
                    </div>
                    <Link href="/profile/billing" className="btn btn-secondary btn-sm">
                        {t('profile.billing.manage')}
                    </Link>
                </div>
            </div>

            {/* Invoice records */}
            <div className="profile-card">
                <h3 className="profile-card-title">{t('profile.billing.invoices')}</h3>
                <table className="billing-table">
                    <thead>
                        <tr>
                            <th>{t('profile.billing.date')}</th>
                            <th>{t('profile.billing.amount')}</th>
                            <th>{t('profile.billing.status')}</th>
                            <th>{t('profile.billing.description')}</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colSpan={4} className="billing-empty">{t('profile.billing.noInvoices')}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    )
}

export default BillingSection
