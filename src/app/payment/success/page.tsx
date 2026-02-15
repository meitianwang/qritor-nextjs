'use client'

import { Suspense, useState, useEffect } from 'react'
import { useSearchParams } from 'next/navigation'
import Link from 'next/link'
import { useAuth } from '@/hooks/useAuth'
import { authFetch } from '@/lib/auth-utils'

interface Order {
    orderNo?: string
    planName?: string
    planDisplayName?: string
    status?: string
    amount?: number
    monthlyCredits?: number
}

/**
 * Payment success page
 * User is redirected here after completing Stripe Checkout payment
 */
function PaymentSuccessPageContent() {
    const searchParams = useSearchParams()
    const { getAccessToken } = useAuth()
    const orderNo = searchParams.get('orderNo')

    const [order, setOrder] = useState<Order | null>(null)
    const [loading, setLoading] = useState(true)
    const [error, setError] = useState<string | null>(null)

    // Fetch order details
    useEffect(() => {
        if (orderNo) {
            fetchOrderDetails()
        } else {
            setError('订单号不存在')
            setLoading(false)
        }
    }, [orderNo])

    const fetchOrderDetails = async () => {
        const token = getAccessToken()
        if (!token) {
            setError('请先登录')
            setLoading(false)
            return
        }

        try {
            setLoading(true)
            const response = await authFetch(`/api/order/${orderNo}`)
            const data = await response.json()

            if (data.code === 200 && data.data) {
                setOrder(data.data)
            } else {
                setError(data.message || '获取订单信息失败')
            }
        } catch (err) {
            setError('网络错误，请稍后重试')
        } finally {
            setLoading(false)
        }
    }

    // Loading
    if (loading) {
        return (
            <div className="payment-page">
                <div className="payment-container">
                    <div className="payment-loading">
                        <div className="loading-spinner"></div>
                        <span className="loading-text">确认支付结果...</span>
                    </div>
                </div>
            </div>
        )
    }

    // Error
    if (error) {
        return (
            <div className="payment-page">
                <div className="payment-container">
                    <div className="payment-error">
                        <div className="error-icon">😞</div>
                        <p className="error-message">{error}</p>
                        <Link href="/pricing" className="error-action">返回价格页面</Link>
                    </div>
                </div>
            </div>
        )
    }

    // Check order status
    const isPaid = order?.status === 'PAID'

    return (
        <div className="payment-page">
                <div className="payment-container">
                    {isPaid ? (
                        <div className="payment-success">
                            <div className="success-icon">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                                    <polyline points="20 6 9 17 4 12" />
                                </svg>
                            </div>
                            <h2 className="success-title">支付成功！🎉</h2>
                            <p className="success-message">
                                您已成功订阅 <strong>{order?.planDisplayName || order?.planName}</strong> 计划，
                                积分已添加到您的账户。
                            </p>
                            <div className="order-confirmation">
                                <div className="confirmation-row">
                                    <span className="label">订单号</span>
                                    <span className="value">{order?.orderNo}</span>
                                </div>
                                <div className="confirmation-row">
                                    <span className="label">支付金额</span>
                                    <span className="value">¥{order?.amount}</span>
                                </div>
                                <div className="confirmation-row">
                                    <span className="label">每月积分</span>
                                    <span className="value">{order?.monthlyCredits} 积分</span>
                                </div>
                            </div>
                            <div className="success-actions">
                                <Link href="/profile?tab=usage" className="btn btn-primary">查看我的订阅</Link>
                                <Link href="/download" className="btn btn-secondary">下载客户端</Link>
                            </div>
                        </div>
                    ) : (
                        <div className="payment-pending">
                            <div className="pending-icon">⏳</div>
                            <h2 className="pending-title">支付确认中</h2>
                            <p className="pending-message">
                                您的支付正在处理中，请稍等片刻...
                            </p>
                            <p className="pending-hint">
                                如果长时间未确认，请<Link href="/profile?tab=usage">查看订阅状态</Link>或联系客服。
                            </p>
                            <div className="pending-actions">
                                <button onClick={fetchOrderDetails} className="btn btn-secondary">
                                    刷新状态
                                </button>
                                <Link href="/pricing" className="btn btn-outline">返回价格页面</Link>
                            </div>
                        </div>
                    )}
                </div>
        </div>
    )
}

export default function PaymentSuccessPage() {
    return (
        <Suspense fallback={<div />}>
            <PaymentSuccessPageContent />
        </Suspense>
    )
}
