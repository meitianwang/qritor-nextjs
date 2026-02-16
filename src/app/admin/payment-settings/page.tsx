'use client'

import { useState, useEffect } from 'react'
import { adminFetch } from '@/lib/admin-utils'

/**
 * 支付设置页面
 * 管理 Stripe 支付配置
 */

interface PaymentSettings {
    stripeSecretKey: string
    stripePublishableKey: string
    stripeWebhookSecret: string
}

export default function PaymentSettingsPage() {
    const [loading, setLoading] = useState<boolean>(true)
    const [saving, setSaving] = useState<boolean>(false)
    const [testing, setTesting] = useState<boolean>(false)
    const [settings, setSettings] = useState<PaymentSettings>({
        stripeSecretKey: '',
        stripePublishableKey: '',
        stripeWebhookSecret: ''
    })
    const [error, setError] = useState<string | null>(null)
    const [success, setSuccess] = useState<string | null>(null)

    useEffect(() => {
        fetchSettings()
    }, [])

    const fetchSettings = async () => {
        try {
            setLoading(true)
            const response = await adminFetch('/api/admin/settings/payment')
            const data = await response.json()
            if (data.code === 200) {
                setSettings(data.data || {
                    stripeSecretKey: '',
                    stripePublishableKey: '',
                    stripeWebhookSecret: ''
                })
            } else {
                setError(data.message || '获取设置失败')
            }
        } catch (err) {
            console.error('获取支付设置失败:', err)
            setError('网络错误，请稍后重试')
        } finally {
            setLoading(false)
        }
    }

    const handleSave = async () => {
        try {
            setSaving(true)
            setError(null)
            setSuccess(null)

            const response = await adminFetch('/api/admin/settings/payment', {
                method: 'PUT',
                body: settings
            })
            const data = await response.json()

            if (data.code === 200) {
                setSuccess('设置已保存')
                // 重新获取最新设置
                await fetchSettings()
            } else {
                setError(data.message || '保存失败')
            }
        } catch (err) {
            console.error('保存支付设置失败:', err)
            setError('网络错误，请稍后重试')
        } finally {
            setSaving(false)
        }
    }

    const handleTestConnection = async () => {
        try {
            setTesting(true)
            setError(null)
            setSuccess(null)

            const response = await adminFetch('/api/admin/settings/payment/test-stripe', {
                method: 'POST'
            })
            const data = await response.json()

            if (data.code === 200) {
                setSuccess(`Stripe 连接成功！账户ID: ${data.data?.account_id}`)
            } else {
                setError(data.message || 'Stripe 连接测试失败')
            }
        } catch (err) {
            console.error('Stripe连接测试失败:', err)
            setError('网络错误，请稍后重试')
        } finally {
            setTesting(false)
        }
    }

    if (loading) {
        return (
            <div className="admin-page">
                <div className="admin-page-header">
                    <h1>支付设置</h1>
                </div>
                <div className="loading">加载中...</div>
            </div>
        )
    }

    return (
        <div className="admin-page payment-settings-page">
            <div className="admin-page-header">
                <h1>支付设置</h1>
                <p className="page-description">管理 Stripe 支付配置</p>
            </div>

            {error && (
                <div className="alert alert-error">
                    <span className="alert-icon">&#9888;&#65039;</span>
                    {error}
                </div>
            )}

            {success && (
                <div className="alert alert-success">
                    <span className="alert-icon">&#10003;</span>
                    {success}
                </div>
            )}

            <div className="settings-card">
                <h2 className="settings-section-title">Stripe 配置</h2>

                <div className="settings-form">
                    <div className="form-group">
                        <label className="form-label">Secret Key (密钥)</label>
                        <input
                            type="password"
                            className="form-input"
                            placeholder="sk_live_xxx 或 sk_test_xxx"
                            value={settings.stripeSecretKey}
                            onChange={(e) => setSettings({
                                ...settings,
                                stripeSecretKey: e.target.value
                            })}
                        />
                        <p className="form-hint">用于后端 API 调用，请妥善保管</p>
                    </div>

                    <div className="form-group">
                        <label className="form-label">Publishable Key (公开密钥)</label>
                        <input
                            type="text"
                            className="form-input"
                            placeholder="pk_live_xxx 或 pk_test_xxx"
                            value={settings.stripePublishableKey}
                            onChange={(e) => setSettings({
                                ...settings,
                                stripePublishableKey: e.target.value
                            })}
                        />
                        <p className="form-hint">用于前端 Stripe.js 初始化</p>
                    </div>

                    <div className="form-group">
                        <label className="form-label">Webhook Secret (Webhook 密钥)</label>
                        <input
                            type="password"
                            className="form-input"
                            placeholder="whsec_xxx"
                            value={settings.stripeWebhookSecret}
                            onChange={(e) => setSettings({
                                ...settings,
                                stripeWebhookSecret: e.target.value
                            })}
                        />
                        <p className="form-hint">用于验证 Stripe Webhook 回调签名</p>
                    </div>
                </div>

                <div className="settings-actions">
                    <button
                        className="btn btn-secondary"
                        onClick={handleTestConnection}
                        disabled={testing || !settings.stripeSecretKey}
                    >
                        {testing ? '测试中...' : '测试 Stripe 连接'}
                    </button>
                </div>
            </div>

            <div className="settings-card settings-info">
                <h3>&#128161; 配置说明</h3>
                <ul>
                    <li>在 <a href="https://dashboard.stripe.com/apikeys" target="_blank" rel="noopener noreferrer">Stripe Dashboard</a> 获取 API 密钥</li>
                    <li>测试环境使用 <code>sk_test_</code> 和 <code>pk_test_</code> 开头的密钥</li>
                    <li>生产环境使用 <code>sk_live_</code> 和 <code>pk_live_</code> 开头的密钥</li>
                    <li>Webhook URL: <code>{typeof window !== 'undefined' ? window.location.origin : ''}/api/stripe/webhook</code></li>
                </ul>
            </div>

            <div className="page-footer">
                <button
                    className="btn btn-primary"
                    onClick={handleSave}
                    disabled={saving}
                >
                    {saving ? '保存中...' : '保存设置'}
                </button>
            </div>
        </div>
    )
}
