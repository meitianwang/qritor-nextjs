'use client'

import Link from 'next/link'
import { useTranslation } from '@/hooks/useTranslation'

/**
 * Subscription and billing section component
 */
function BillingSection() {
    const { t } = useTranslation('portal')

    return (
        <div className="profile-content">
            <h2 className="profile-section-title">{t('profile.billing.title')}</h2>

            {/* Current plan */}
            <div className="profile-card">
                <div className="billing-plan">
                    <div className="billing-plan-info">
                        <h3 className="billing-plan-name">{t('profile.billing.free')}</h3>
                        <p className="billing-plan-price">$0.00/{t('common.month')}</p>
                    </div>
                </div>
                <div className="billing-upgrade">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                        <circle cx="12" cy="12" r="10"></circle>
                        <path d="M12 16v-4"></path>
                        <path d="M12 8h.01"></path>
                    </svg>
                    <span>{t('profile.billing.upgradeNote')}</span>
                    <Link href="/pricing" className="btn btn-primary btn-sm">{t('pricing.upgrade')}</Link>
                </div>
            </div>

            {/* Billing management */}
            <div className="profile-card">
                <div className="billing-manage">
                    <div className="billing-manage-info">
                        <h3 className="profile-card-title">{t('profile.billing.manageBilling')}</h3>
                        <p className="profile-card-desc">{t('profile.billing.manageBillingDesc')}</p>
                    </div>
                    <button className="btn btn-secondary btn-sm">{t('profile.billing.manage')}</button>
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
