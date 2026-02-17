'use client'

import Link from 'next/link'
import { useState, useEffect } from 'react'
import { useTranslation } from '@/hooks/useTranslation'
import { authFetch } from '@/lib/auth-utils'

interface SubscriptionData {
    planName?: string
    displayName?: string
    price?: number
    status?: string | null
    expireAt?: string | null
    autoRenew?: boolean
}

interface Order {
    orderNo: string
    amount: number
    status: string
    planName: string
    planDisplayName: string
    monthlyCredits: number
    createdAt: string
}

interface BillingSectionProps {
    subscriptionData?: SubscriptionData
}

/**
 * Subscription and billing section component
 */
function BillingSection({ subscriptionData }: BillingSectionProps) {
    const { t } = useTranslation('portal')
    const [orders, setOrders] = useState<Order[]>([])
    const [ordersLoading, setOrdersLoading] = useState(true)

    // Fetch orders on mount
    useEffect(() => {
        const fetchOrders = async () => {
            try {
                const response = await authFetch('/api/orders')
                const data = await response.json()
                if (data.code === 200 && Array.isArray(data.data)) {
                    setOrders(data.data)
                }
            } catch (err) {
                console.error('Failed to fetch orders:', err)
            } finally {
                setOrdersLoading(false)
            }
        }

        fetchOrders()
    }, [])

    const planName = subscriptionData?.planName || 'FREE'
    const displayName = subscriptionData?.displayName || t('profile.billing.free')
    const price = subscriptionData?.price ?? 0
    const isFree = planName.toUpperCase() === 'FREE'

    // Format date for display
    const formatDate = (dateString: string) => {
        try {
            return new Date(dateString).toLocaleDateString('zh-CN', {
                year: 'numeric',
                month: '2-digit',
                day: '2-digit',
                hour: '2-digit',
                minute: '2-digit'
            })
        } catch {
            return dateString
        }
    }

    // Get status badge color
    const getStatusColor = (status: string) => {
        const upperStatus = status.toUpperCase()
        // Success/Paid statuses
        if (upperStatus === 'PAID') {
            return 'status-paid'
        }
        // Processing/Pending statuses
        if (upperStatus.includes('PENDING') || upperStatus.includes('AWAITING')) {
            return 'status-pending'
        }
        // Failed/Cancelled statuses
        if (upperStatus.includes('FAILED') || upperStatus.includes('CANCELLED')) {
            return 'status-failed'
        }
        return 'status-default'
    }

    // Get status label
    const getStatusLabel = (status: string) => {
        const upperStatus = status.toUpperCase()

        // Success/Paid
        if (upperStatus === 'PAID') {
            return t('profile.billing.statusPaid') || '已支付'
        }
        // Processing/Pending
        if (upperStatus.includes('PENDING') || upperStatus.includes('AWAITING')) {
            return t('profile.billing.statusPending') || '处理中'
        }
        // Failed/Cancelled
        if (upperStatus.includes('FAILED')) {
            return t('profile.billing.statusFailed') || '失败'
        }
        if (upperStatus.includes('CANCELLED')) {
            return t('profile.billing.statusCancelled') || '已取消'
        }
        return status
    }

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

            {/* Order records */}
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
                        {ordersLoading ? (
                            <tr>
                                <td colSpan={4} className="billing-empty">加载中...</td>
                            </tr>
                        ) : orders.length === 0 ? (
                            <tr>
                                <td colSpan={4} className="billing-empty">{t('profile.billing.noInvoices')}</td>
                            </tr>
                        ) : (
                            orders.map(order => (
                                <tr key={order.orderNo}>
                                    <td>{formatDate(order.createdAt)}</td>
                                    <td>${order.amount.toFixed(2)}</td>
                                    <td>
                                        <span className={`billing-status ${getStatusColor(order.status)}`}>
                                            {getStatusLabel(order.status)}
                                        </span>
                                    </td>
                                    <td>{order.planDisplayName || order.planName} - {order.monthlyCredits} 积分/月</td>
                                </tr>
                            ))
                        )}
                    </tbody>
                </table>
            </div>
        </div>
    )
}

export default BillingSection
