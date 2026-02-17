'use client'

import { useState, useEffect } from 'react'
import { useTranslation } from '@/hooks/useTranslation'
import { authFetch } from '@/lib/auth-utils'

interface BillingAddress {
    country: string
    state: string
    city: string
    line1: string
}

const COUNTRIES = [
    { code: 'CN', name: 'China' },
    { code: 'US', name: 'United States' },
    { code: 'SG', name: 'Singapore' },
    { code: 'JP', name: 'Japan' },
    { code: 'KR', name: 'South Korea' },
    { code: 'GB', name: 'United Kingdom' },
    { code: 'DE', name: 'Germany' },
    { code: 'FR', name: 'France' },
    { code: 'AU', name: 'Australia' },
    { code: 'CA', name: 'Canada' },
    { code: 'HK', name: 'Hong Kong' },
    { code: 'TW', name: 'Taiwan' },
    { code: 'MY', name: 'Malaysia' },
    { code: 'TH', name: 'Thailand' },
    { code: 'IN', name: 'India' },
    { code: 'BR', name: 'Brazil' },
    { code: 'ES', name: 'Spain' },
    { code: 'IT', name: 'Italy' },
    { code: 'RU', name: 'Russia' },
    { code: 'MX', name: 'Mexico' },
]

function getCountryName(code: string): string {
    return COUNTRIES.find(c => c.code === code)?.name || code
}

function BillingAddressSection() {
    const { t } = useTranslation('portal')
    const [address, setAddress] = useState<BillingAddress | null>(null)
    const [loading, setLoading] = useState(true)
    const [editing, setEditing] = useState(false)
    const [saving, setSaving] = useState(false)
    const [form, setForm] = useState<BillingAddress>({ country: '', state: '', city: '', line1: '' })

    useEffect(() => {
        fetchAddress()
    }, [])

    const fetchAddress = async () => {
        try {
            const res = await authFetch('/api/billing-address')
            const data = await res.json()
            if (data.code === 200 && data.data) {
                setAddress(data.data)
                setForm(data.data)
            }
        } catch {
            // No address saved
        } finally {
            setLoading(false)
        }
    }

    const handleSave = async () => {
        setSaving(true)
        try {
            const res = await authFetch('/api/billing-address', {
                method: 'PUT',
                body: form,
            })
            const data = await res.json()
            if (data.code === 200) {
                setAddress({ ...form })
                setEditing(false)
            }
        } catch {
            // Save failed
        } finally {
            setSaving(false)
        }
    }

    const handleEdit = () => {
        setForm(address || { country: '', state: '', city: '', line1: '' })
        setEditing(true)
    }

    if (loading) {
        return (
            <div className="profile-card">
                <p style={{ color: 'var(--color-text-tertiary)', fontSize: '0.875rem', textAlign: 'center', padding: '1.5rem 0' }}>
                    Loading...
                </p>
            </div>
        )
    }

    // Edit mode
    if (editing) {
        return (
            <div className="profile-card">
                <div className="billing-address-form">
                    <div className="billing-address-field">
                        <label className="billing-address-label">
                            {t('billingManage.address.country')}
                        </label>
                        <select
                            className="billing-address-input"
                            value={form.country}
                            onChange={e => setForm({ ...form, country: e.target.value })}
                        >
                            <option value="">{t('billingManage.address.selectCountry')}</option>
                            {COUNTRIES.map(c => (
                                <option key={c.code} value={c.code}>{c.name}</option>
                            ))}
                        </select>
                    </div>
                    <div className="billing-address-field">
                        <label className="billing-address-label">
                            {t('billingManage.address.state')}
                        </label>
                        <input
                            className="billing-address-input"
                            type="text"
                            value={form.state}
                            onChange={e => setForm({ ...form, state: e.target.value })}
                            placeholder={t('billingManage.address.statePlaceholder')}
                        />
                    </div>
                    <div className="billing-address-field">
                        <label className="billing-address-label">
                            {t('billingManage.address.city')}
                        </label>
                        <input
                            className="billing-address-input"
                            type="text"
                            value={form.city}
                            onChange={e => setForm({ ...form, city: e.target.value })}
                            placeholder={t('billingManage.address.cityPlaceholder')}
                        />
                    </div>
                    <div className="billing-address-field">
                        <label className="billing-address-label">
                            {t('billingManage.address.line1')}
                        </label>
                        <input
                            className="billing-address-input"
                            type="text"
                            value={form.line1}
                            onChange={e => setForm({ ...form, line1: e.target.value })}
                            placeholder={t('billingManage.address.line1Placeholder')}
                        />
                    </div>
                    <div className="billing-address-actions">
                        <button
                            className="btn btn-primary btn-sm"
                            onClick={handleSave}
                            disabled={saving || !form.country || !form.line1}
                        >
                            {saving ? '...' : t('billingManage.address.save')}
                        </button>
                        <button
                            className="btn btn-secondary btn-sm"
                            onClick={() => setEditing(false)}
                            disabled={saving}
                        >
                            {t('common.cancel')}
                        </button>
                    </div>
                </div>
            </div>
        )
    }

    // Display mode
    if (!address || (!address.country && !address.line1)) {
        return (
            <div className="profile-card">
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                    <p style={{ color: 'var(--color-text-tertiary)', fontSize: '0.875rem' }}>
                        {t('billingManage.address.noAddress')}
                    </p>
                    <button className="btn btn-secondary btn-sm" onClick={handleEdit}>
                        {t('billingManage.address.add')}
                    </button>
                </div>
            </div>
        )
    }

    return (
        <div className="profile-card">
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: '1rem' }}>
                <div style={{ flex: 1 }} />
                <button
                    className="billing-edit-link"
                    onClick={handleEdit}
                >
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                        <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7" />
                        <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z" />
                    </svg>
                    {t('common.edit')}
                </button>
            </div>
            <div className="billing-address-display">
                <div className="billing-address-row">
                    <span className="billing-address-label">{t('billingManage.address.country')}</span>
                    <span className="billing-address-value">{getCountryName(address.country)}</span>
                </div>
                <div className="billing-address-row">
                    <span className="billing-address-label">{t('billingManage.address.state')}</span>
                    <span className="billing-address-value">{address.state || '-'}</span>
                </div>
                <div className="billing-address-row">
                    <span className="billing-address-label">{t('billingManage.address.city')}</span>
                    <span className="billing-address-value">{address.city || '-'}</span>
                </div>
                <div className="billing-address-row">
                    <span className="billing-address-label">{t('billingManage.address.line1')}</span>
                    <span className="billing-address-value">{address.line1 || '-'}</span>
                </div>
            </div>
        </div>
    )
}

export default BillingAddressSection
