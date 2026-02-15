'use client'

import { useState } from 'react'
import Link from 'next/link'
import { useTranslation } from '@/hooks/useTranslation'
import {
    formatExpireTime,
    formatTime,
    formatItemExpire,
    calcPercent,
    formatSource
} from '@/lib/utils/formatters'

interface CreditItem {
    description?: string
    total: number
    remaining: number
    expireAt?: string
    createdAt?: string
    source?: string
}

interface CreditData {
    balance: number
    used: number
    total: number
    expireAt?: string | null
    items?: CreditItem[]
    itemCount?: number
}

interface CreditCardProps {
    title: string
    desc: string
    data: CreditData
    expandKey?: string | null
    planName?: string | null
    expandedCredits: Record<string, boolean>
    onToggleExpand: (key: string) => void
}

/**
 * Credit card component
 */
function CreditCard({
    title,
    desc,
    data,
    expandKey = null,
    planName = null,
    expandedCredits,
    onToggleExpand
}: CreditCardProps) {
    const percent = calcPercent(data.used, data.total)
    const isExpanded = expandKey && expandedCredits[expandKey]
    const hasItems = expandKey && data.items && data.items.length > 0

    return (
        <div className="profile-card">
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start' }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: '0.75rem' }}>
                    <div>
                        <h3 className="profile-card-title">{title}</h3>
                        <p className="profile-card-desc">{desc}</p>
                    </div>
                    {planName && (
                        <span style={{
                            fontSize: '0.75rem',
                            color: 'var(--color-primary)',
                            background: 'rgba(var(--color-primary-rgb, 99, 102, 241), 0.15)',
                            padding: '0.25rem 0.5rem',
                            borderRadius: 'var(--radius-sm)',
                            fontWeight: '500'
                        }}>
                            {planName}
                        </span>
                    )}
                </div>
                {data.expireAt && (
                    <span style={{
                        fontSize: '0.75rem',
                        color: 'var(--color-text-tertiary)',
                        background: 'var(--color-bg-tertiary)',
                        padding: '0.25rem 0.5rem',
                        borderRadius: 'var(--radius-sm)'
                    }}>
                        {formatExpireTime(data.expireAt)}
                    </span>
                )}
            </div>

            <div className="usage-bar-container">
                <div className="usage-bar">
                    <div className="usage-bar-fill" style={{ width: `${percent}%` }}></div>
                </div>
                <div className="usage-stats">
                    <span className="usage-current">{data.used} / {data.total}</span>
                    <span className="usage-percent">{percent}%</span>
                </div>
            </div>

            {/* Expandable details list */}
            {hasItems && (
                <div style={{ marginTop: '1rem' }}>
                    <button
                        onClick={() => onToggleExpand(expandKey!)}
                        style={{
                            background: 'none',
                            border: 'none',
                            color: 'var(--color-text-secondary)',
                            cursor: 'pointer',
                            fontSize: '0.875rem',
                            display: 'flex',
                            alignItems: 'center',
                            gap: '0.25rem',
                            padding: 0
                        }}
                    >
                        {data.itemCount} 个积分包
                        <svg
                            width="12"
                            height="12"
                            viewBox="0 0 24 24"
                            fill="none"
                            stroke="currentColor"
                            strokeWidth="2"
                            style={{
                                transform: isExpanded ? 'rotate(180deg)' : 'rotate(0deg)',
                                transition: 'transform 0.2s'
                            }}
                        >
                            <polyline points="6 9 12 15 18 9"></polyline>
                        </svg>
                    </button>

                    {isExpanded && (
                        <div style={{ marginTop: '0.75rem' }}>
                            {data.items!.map((item, idx) => (
                                <div
                                    key={idx}
                                    style={{
                                        display: 'flex',
                                        justifyContent: 'space-between',
                                        alignItems: 'center',
                                        padding: '0.5rem 0',
                                        borderBottom: idx < data.items!.length - 1 ? '1px solid var(--color-border)' : 'none'
                                    }}
                                >
                                    <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem' }}>
                                        <span style={{
                                            width: '6px',
                                            height: '6px',
                                            background: 'var(--color-primary)',
                                            borderRadius: '50%'
                                        }}></span>
                                        <span style={{ color: 'var(--color-text-primary)', fontSize: '0.875rem' }}>
                                            {item.description || '积分包'} (总: {item.total})
                                        </span>
                                    </div>
                                    <span style={{
                                        fontSize: '0.875rem',
                                        color: 'var(--color-text-secondary)'
                                    }}>
                                        剩余 <span style={{ color: 'var(--color-primary)' }}>{item.remaining}</span> 积分。{formatItemExpire(item.expireAt)}
                                    </span>
                                </div>
                            ))}
                        </div>
                    )}
                </div>
            )}
        </div>
    )
}

interface SubscriptionData {
    planName?: string
}

interface CreditsDataType {
    subscription?: CreditData
    referral?: CreditData
    boostPack?: CreditData
}

interface UsageSectionProps {
    creditsData?: CreditsDataType
    subscriptionData?: SubscriptionData
}

/**
 * Usage details section component
 */
function UsageSection({ creditsData, subscriptionData }: UsageSectionProps) {
    const { t } = useTranslation('portal')

    // Credit details expand state
    const [expandedCredits, setExpandedCredits] = useState<Record<string, boolean>>({})

    // Toggle expand state
    const toggleExpand = (key: string) => {
        setExpandedCredits(prev => ({ ...prev, [key]: !prev[key] }))
    }

    // Get three types of credit data
    const subscription = creditsData?.subscription || { balance: 0, used: 0, total: 0, expireAt: null }
    const referral = creditsData?.referral || { balance: 0, used: 0, total: 0, expireAt: null }
    const boostPack = creditsData?.boostPack || { balance: 0, used: 0, total: 0, expireAt: null }

    // Merge all credit items for history records
    const allItems = [
        ...(subscription.items || []).map(i => ({ ...i, source: 'SUBSCRIPTION' })),
        ...(referral.items || []).map(i => ({ ...i, source: 'REFERRAL' })),
        ...(boostPack.items || []).map(i => ({ ...i, source: 'BOOST_PACK' }))
    ]

    return (
        <div className="profile-content">
            <h2 className="profile-section-title">{t('profile.usage.title')}</h2>

            {/* Subscription credits */}
            <CreditCard
                title={t('profile.usage.subscriptionCredits')}
                desc={t('profile.usage.subscriptionCreditsDesc')}
                data={subscription}
                planName={subscriptionData?.planName || t('pricing.free')}
                expandedCredits={expandedCredits}
                onToggleExpand={toggleExpand}
            />

            {/* Referral credits */}
            <CreditCard
                title={t('profile.usage.referralCredits')}
                desc={t('profile.usage.referralCreditsDesc')}
                data={referral}
                expandKey="referral"
                expandedCredits={expandedCredits}
                onToggleExpand={toggleExpand}
            />

            {/* Boost pack credits */}
            <CreditCard
                title={t('profile.usage.boostPackCredits')}
                desc={t('profile.usage.boostPackCreditsDesc')}
                data={boostPack}
                expandKey="boostPack"
                expandedCredits={expandedCredits}
                onToggleExpand={toggleExpand}
            />

            {/* Get more credits */}
            <div className="profile-card">
                <h3 className="profile-card-title">{t('profile.usage.getMoreCredits')}</h3>
                <p className="profile-card-desc">{t('profile.usage.getMoreCreditsDesc')}</p>
                <div className="profile-card-actions">
                    <Link href="/pricing" className="btn btn-secondary btn-sm">{t('pricing.upgrade')}</Link>
                    <Link href="/referral" className="profile-link-accent">{t('profile.usage.inviteFriends')} →</Link>
                </div>
            </div>

            {/* Credits history */}
            <h2 className="profile-section-title" style={{ marginTop: '2rem' }}>{t('profile.usage.creditsHistory')}</h2>

            <div className="profile-card">
                <h3 className="profile-card-title">{t('profile.usage.earned')}</h3>
                <p className="profile-card-desc" style={{ marginBottom: '1rem' }}>{t('profile.usage.earnedDesc')}</p>

                <table className="credits-table">
                    <thead>
                        <tr>
                            <th>{t('profile.usage.time')}</th>
                            <th>{t('profile.usage.source')}</th>
                            <th>{t('profile.usage.earnedCredits')}</th>
                            <th>{t('profile.usage.remaining')}</th>
                            <th>{t('profile.usage.expireTime')}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {allItems.length === 0 ? (
                            <tr>
                                <td colSpan={5} className="credits-empty">{t('profile.usage.noRecords')}</td>
                            </tr>
                        ) : (
                            allItems.map((item, idx) => (
                                <tr key={idx}>
                                    <td>{formatTime(item.createdAt)}</td>
                                    <td>{formatSource(item.source)}</td>
                                    <td style={{ color: 'var(--color-success)' }}>+{item.total}</td>
                                    <td>{item.remaining}</td>
                                    <td>{formatExpireTime(item.expireAt)}</td>
                                </tr>
                            ))
                        )}
                    </tbody>
                </table>
            </div>
        </div>
    )
}

export default UsageSection
