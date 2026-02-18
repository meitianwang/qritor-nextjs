'use client'

import { Suspense, useState, useEffect, useCallback } from 'react'
import { useSearchParams, useRouter } from 'next/navigation'
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
    createdAt?: string
    expiredAt?: string
}

/**
 * Payment page
 * Shows order info, click pay to redirect to Stripe Checkout
 */
function PaymentPageContent() {
    const searchParams = useSearchParams()
    const router = useRouter()
    const { getAccessToken } = useAuth()
    const orderNo = searchParams.get('orderNo')

    const [order, setOrder] = useState<Order | null>(null)
    const [loading, setLoading] = useState(true)
    const [error, setError] = useState<string | null>(null)
    const [paying, setPaying] = useState(false)
    const [paymentSuccess, setPaymentSuccess] = useState(false)

    const fetchOrderDetails = useCallback(async () => {
        const token = getAccessToken()
        if (!token) {
            router.push('/login?redirect=' + encodeURIComponent('/payment?orderNo=' + orderNo))
            return
        }

        try {
            setLoading(true)
            const response = await authFetch(`/api/orders/${orderNo}`)
            const data = await response.json()

            if (data.code === 200 && data.data) {
                setOrder(data.data)
                if (data.data.status === 'PAID') {
                    setPaymentSuccess(true)
                } else if (data.data.status !== 'PENDING' && data.data.status !== 'AWAITING_PAYMENT') {
                    setError(`订单状态异常: ${data.data.status}`)
                }
            } else {
                setError(data.message || '获取订单信息失败')
            }
        } catch {
            setError('网络错误，请稍后重试')
        } finally {
            setLoading(false)
        }
    }, [getAccessToken, orderNo, router])

    // Fetch order details
    useEffect(() => {
        if (orderNo) {
            fetchOrderDetails()
        } else {
            setError('订单号不存在')
            setLoading(false)
        }
    }, [orderNo, fetchOrderDetails])

    // Initiate Stripe payment
    const handlePay = async () => {
        const token = getAccessToken()
        if (!token) {
            router.push('/login')
            return
        }

        try {
            setPaying(true)
            const response = await authFetch(`/api/orders/${orderNo}/pay`, {
                method: 'POST',
                body: {
                    paymentMethod: 'STRIPE'
                }
            })
            const data = await response.json()

            if (data.code === 200 && data.data) {
                if (data.data.requiresAction && data.data.checkoutUrl) {
                    window.location.href = data.data.checkoutUrl
                } else if (data.data.status === 'PAID') {
                    setPaymentSuccess(true)
                    setOrder(data.data)
                } else {
                    setError('支付初始化失败，请重试')
                }
            } else {
                setError(data.message || '支付失败')
            }
        } catch {
            setError('网络错误，请稍后重试')
        } finally {
            setPaying(false)
        }
    }

    // Format date
    const formatDate = (dateStr?: string) => {
        if (!dateStr) return '-'
        const date = new Date(dateStr)
        return date.toLocaleString('zh-CN')
    }

    // Loading
    if (loading) {
        return (
            <div className="payment-page">
                <div className="payment-container">
                    <div className="payment-loading">
                        <div className="loading-spinner"></div>
                        <span className="loading-text">加载订单信息...</span>
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

    // Payment success
    if (paymentSuccess) {
        return (
            <div className="payment-page">
                <div className="payment-container">
                    <div className="payment-success">
                        <div className="success-icon">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                                <polyline points="20 6 9 17 4 12" />
                            </svg>
                        </div>
                        <h2 className="success-title">支付成功！</h2>
                        <p className="success-message">
                            您已成功订阅 {order?.planDisplayName || order?.planName} 计划，
                            积分已添加到您的账户。
                        </p>
                        <div className="success-actions">
                            <Link href="/profile?tab=usage" className="btn btn-primary">查看我的订阅</Link>
                            <Link href="/download" className="btn btn-secondary">下载客户端</Link>
                        </div>
                    </div>
                </div>
            </div>
        )
    }

    return (
        <div className="payment-page">
                <div className="payment-container">
                    {/* Page title */}
                    <div className="payment-header">
                        <h1 className="payment-title">完成支付</h1>
                        <p className="payment-subtitle">确认订单信息后点击支付</p>
                    </div>

                    {/* Order info card */}
                    <div className="payment-content">
                        <div className="order-summary-card">
                            <div className="order-summary-header">
                                <div className="order-summary-icon">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                                        <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4" />
                                        <polyline points="7 10 12 15 17 10" />
                                        <line x1="12" y1="15" x2="12" y2="3" />
                                    </svg>
                                </div>
                                <div>
                                    <h3 className="order-summary-title">订单详情</h3>
                                    <p className="order-summary-subtitle">订单号: {order?.orderNo}</p>
                                </div>
                            </div>

                            <div className="order-detail-row">
                                <span className="order-detail-label">订阅计划</span>
                                <span className="order-detail-value">{order?.planDisplayName || order?.planName}</span>
                            </div>
                            <div className="order-detail-row">
                                <span className="order-detail-label">每月积分</span>
                                <span className="order-detail-value">{order?.monthlyCredits} 积分</span>
                            </div>
                            <div className="order-detail-row">
                                <span className="order-detail-label">创建时间</span>
                                <span className="order-detail-value">{formatDate(order?.createdAt)}</span>
                            </div>
                            <div className="order-detail-row">
                                <span className="order-detail-label">过期时间</span>
                                <span className="order-detail-value">{formatDate(order?.expiredAt)}</span>
                            </div>

                            <div className="summary-divider"></div>

                            <div className="summary-total">
                                <span className="summary-total-label">应付金额</span>
                                <span className="summary-total-value">${order?.amount}</span>
                            </div>

                            {/* Payment methods info */}
                            <div className="payment-methods-info">
                                <h4>支持的支付方式</h4>
                                <div className="payment-method-icons">
                                    <span className="payment-icon" title="信用卡/借记卡">💳</span>
                                    <span className="payment-icon" title="微信支付">🟢</span>
                                </div>
                                <p className="payment-method-note">点击支付后将跳转到安全支付页面</p>
                            </div>

                            <button
                                className="checkout-btn"
                                onClick={handlePay}
                                disabled={paying}
                            >
                                {paying ? '处理中...' : `立即支付 $${order?.amount}`}
                            </button>

                            <div className="security-notice">
                                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                                    <rect x="3" y="11" width="18" height="11" rx="2" ry="2" />
                                    <path d="M7 11V7a5 5 0 0 1 10 0v4" />
                                </svg>
                                <span>安全支付，由 Stripe 提供支付服务保障</span>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    )
}

export default function PaymentPage() {
    return (
        <Suspense fallback={<div />}>
            <PaymentPageContent />
        </Suspense>
    )
}
