'use client'

import { useState, useEffect } from 'react'
import { useTranslation } from '@/hooks/useTranslation'
import { authFetch } from '@/lib/auth-utils'
import AddPaymentMethodForm from './AddPaymentMethodForm'

interface PaymentMethod {
    id: string
    brand: string
    last4: string
    expMonth: number
    expYear: number
    isDefault: boolean
}

const BRAND_ICONS: Record<string, string> = {
    visa: '💳 Visa',
    mastercard: '💳 Mastercard',
    amex: '💳 Amex',
    discover: '💳 Discover',
    unionpay: '💳 UnionPay',
    jcb: '💳 JCB',
}

function formatBrand(brand: string): string {
    return BRAND_ICONS[brand] || `💳 ${brand.charAt(0).toUpperCase() + brand.slice(1)}`
}

function PaymentMethodsList() {
    const { t } = useTranslation('portal')
    const [methods, setMethods] = useState<PaymentMethod[]>([])
    const [loading, setLoading] = useState(true)
    const [showAddForm, setShowAddForm] = useState(false)
    const [actionLoading, setActionLoading] = useState<string | null>(null)

    const fetchMethods = async () => {
        try {
            const res = await authFetch('/api/payment-methods')
            const data = await res.json()
            if (data.code === 200) {
                setMethods(data.data || [])
            }
        } catch {
            // Silently fail
        } finally {
            setLoading(false)
        }
    }

    useEffect(() => {
        fetchMethods()
    }, [])

    const handleSetDefault = async (pmId: string) => {
        setActionLoading(pmId)
        try {
            await authFetch(`/api/payment-methods/${pmId}/default`, { method: 'POST' })
            await fetchMethods()
        } catch {
            // Silently fail
        } finally {
            setActionLoading(null)
        }
    }

    const handleRemove = async (pmId: string) => {
        if (!confirm(t('profile.billing.removeConfirm'))) return
        setActionLoading(pmId)
        try {
            await authFetch(`/api/payment-methods/${pmId}`, { method: 'DELETE' })
            await fetchMethods()
        } catch {
            // Silently fail
        } finally {
            setActionLoading(null)
        }
    }

    const handleCardAdded = () => {
        setShowAddForm(false)
        fetchMethods()
    }

    if (loading) {
        return (
            <div className="profile-card">
                <h3 className="profile-card-title">{t('profile.billing.paymentMethods')}</h3>
                <p className="profile-card-desc" style={{ opacity: 0.5 }}>Loading...</p>
            </div>
        )
    }

    return (
        <div className="profile-card">
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '1rem' }}>
                <div>
                    <h3 className="profile-card-title">{t('profile.billing.paymentMethods')}</h3>
                    <p className="profile-card-desc">{t('profile.billing.addCardDesc')}</p>
                </div>
                {!showAddForm && (
                    <button
                        className="btn btn-secondary btn-sm"
                        onClick={() => setShowAddForm(true)}
                    >
                        {t('profile.billing.addCard')}
                    </button>
                )}
            </div>

            {showAddForm && (
                <div style={{ marginBottom: '1.5rem' }}>
                    <AddPaymentMethodForm
                        onSuccess={handleCardAdded}
                        onCancel={() => setShowAddForm(false)}
                    />
                </div>
            )}

            {methods.length === 0 ? (
                <p style={{ color: 'var(--color-text-tertiary)', fontSize: '0.875rem', textAlign: 'center', padding: '1.5rem 0' }}>
                    {t('profile.billing.noPaymentMethods')}
                </p>
            ) : (
                <div style={{ display: 'flex', flexDirection: 'column', gap: '0.75rem' }}>
                    {methods.map((pm) => (
                        <div
                            key={pm.id}
                            style={{
                                display: 'flex',
                                justifyContent: 'space-between',
                                alignItems: 'center',
                                padding: '0.75rem 1rem',
                                background: 'var(--color-bg-tertiary)',
                                borderRadius: 'var(--radius-md)',
                                border: pm.isDefault ? '1px solid var(--color-primary)' : '1px solid var(--color-border)',
                            }}
                        >
                            <div style={{ display: 'flex', alignItems: 'center', gap: '0.75rem' }}>
                                <span style={{ fontSize: '0.9rem' }}>{formatBrand(pm.brand)}</span>
                                <span style={{ color: 'var(--color-text-primary)', fontSize: '0.875rem' }}>
                                    •••• {pm.last4}
                                </span>
                                <span style={{ color: 'var(--color-text-tertiary)', fontSize: '0.8rem' }}>
                                    {String(pm.expMonth).padStart(2, '0')}/{pm.expYear}
                                </span>
                                {pm.isDefault && (
                                    <span style={{
                                        fontSize: '0.7rem',
                                        color: 'var(--color-primary)',
                                        background: 'rgba(var(--color-primary-rgb, 99, 102, 241), 0.15)',
                                        padding: '0.15rem 0.4rem',
                                        borderRadius: 'var(--radius-sm)',
                                        fontWeight: '500',
                                    }}>
                                        {t('profile.billing.defaultBadge')}
                                    </span>
                                )}
                            </div>
                            <div style={{ display: 'flex', gap: '0.5rem' }}>
                                {!pm.isDefault && (
                                    <button
                                        className="btn btn-secondary btn-sm"
                                        style={{ fontSize: '0.75rem', padding: '0.25rem 0.5rem' }}
                                        onClick={() => handleSetDefault(pm.id)}
                                        disabled={actionLoading === pm.id}
                                    >
                                        {t('profile.billing.setDefault')}
                                    </button>
                                )}
                                <button
                                    className="btn btn-secondary btn-sm"
                                    style={{ fontSize: '0.75rem', padding: '0.25rem 0.5rem', color: 'var(--color-error, #ef4444)' }}
                                    onClick={() => handleRemove(pm.id)}
                                    disabled={actionLoading === pm.id}
                                >
                                    {t('profile.billing.removeCard')}
                                </button>
                            </div>
                        </div>
                    ))}
                </div>
            )}
        </div>
    )
}

export default PaymentMethodsList
