'use client'

import { useState, useEffect } from 'react'
import { adminFetch } from '@/lib/admin-utils'
import { useToast } from '@/hooks/useToast'
import ToastNotification from '@/components/ToastNotification'

/**
 * 运营后台 - 发送通知页面
 * 运营人员只需填写标题和内容，系统自动排版并发送给所有开启通知的用户
 */

interface SendResult {
    success: number
    failed: number
    total: number
    errors?: string[]
}

export default function NotificationPage() {
    const { notification, showToast } = useToast()
    const [subject, setSubject] = useState<string>('')
    const [content, setContent] = useState<string>('')
    const [sending, setSending] = useState<boolean>(false)
    const [result, setResult] = useState<SendResult | null>(null)
    const [enabledCount, setEnabledCount] = useState<number>(0)
    const [loadingStats, setLoadingStats] = useState<boolean>(true)

    // 加载通知统计
    useEffect(() => {
        const loadStats = async () => {
            try {
                setLoadingStats(true)
                const response = await adminFetch('/api/admin/notifications/stats')
                const data = await response.json()
                if (data.code === 200) {
                    setEnabledCount(data.data?.enabledCount || 0)
                }
            } catch (error) {
                console.error('获取统计失败:', error)
            } finally {
                setLoadingStats(false)
            }
        }
        loadStats()
    }, [])

    // 发送通知
    const handleSend = async () => {
        if (!subject.trim()) {
            showToast('error', '请输入邮件标题')
            return
        }
        if (!content.trim()) {
            showToast('error', '请输入邮件内容')
            return
        }

        if (!confirm(`确定要向 ${enabledCount} 位用户发送通知邮件吗？`)) {
            return
        }

        setSending(true)
        setResult(null)

        try {
            const response = await adminFetch('/api/admin/notifications/send', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ subject: subject.trim(), content: content.trim() })
            })
            const data = await response.json()

            if (data.code === 200) {
                setResult(data.data)
                showToast('success', data.message || '发送完成')
                // 清空表单
                setSubject('')
                setContent('')
            } else {
                showToast('error', data.message || '发送失败')
            }
        } catch (error) {
            console.error('发送通知失败:', error)
            showToast('error', '发送失败，请重试')
        } finally {
            setSending(false)
        }
    }

    return (
        <div>
            <h1 className="admin-page-title">发送通知</h1>

            {/* 统计卡片 */}
            <div className="admin-card" style={{ marginBottom: '24px' }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: '12px' }}>
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" style={{ color: '#667eea' }}>
                        <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                        <circle cx="9" cy="7" r="4"></circle>
                        <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                        <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                    </svg>
                    <div>
                        <div style={{ fontSize: '14px', color: 'rgba(255,255,255,0.6)' }}>
                            开启通知的用户数量
                        </div>
                        <div style={{ fontSize: '24px', fontWeight: '600', color: '#fff' }}>
                            {loadingStats ? '...' : enabledCount}
                        </div>
                    </div>
                </div>
            </div>

            {/* 发送表单 */}
            <div className="admin-card">
                <h2 style={{ margin: '0 0 20px 0', fontSize: '16px', color: '#fff' }}>
                    编写通知邮件
                </h2>

                <div style={{ marginBottom: '16px' }}>
                    <label className="admin-form-label">邮件标题</label>
                    <input
                        type="text"
                        className="admin-form-input"
                        placeholder="输入邮件标题（系统会自动添加 [Qritor] 前缀）"
                        value={subject}
                        onChange={(e) => setSubject(e.target.value)}
                        disabled={sending}
                        maxLength={100}
                    />
                </div>

                <div style={{ marginBottom: '20px' }}>
                    <label className="admin-form-label">邮件内容</label>
                    <textarea
                        className="admin-form-textarea"
                        placeholder="输入邮件正文内容（纯文本格式，系统会自动使用精美的 HTML 模板排版）"
                        value={content}
                        onChange={(e) => setContent(e.target.value)}
                        disabled={sending}
                        rows={10}
                        style={{
                            resize: 'vertical',
                            minHeight: '200px',
                            fontFamily: 'inherit',
                            lineHeight: '1.6'
                        }}
                    />
                    <div style={{ marginTop: '8px', fontSize: '12px', color: 'rgba(255,255,255,0.5)' }}>
                        提示：直接输入纯文本内容即可，系统会自动将其排版为精美的 HTML 邮件格式。
                    </div>
                </div>

                <div style={{ display: 'flex', alignItems: 'center', gap: '16px' }}>
                    <button
                        className="admin-btn admin-btn-primary"
                        onClick={handleSend}
                        disabled={sending || !subject.trim() || !content.trim()}
                        style={{ padding: '10px 24px' }}
                    >
                        {sending ? (
                            <>
                                <span className="admin-loading-spinner" style={{ width: '14px', height: '14px', marginRight: '8px' }}></span>
                                发送中...
                            </>
                        ) : (
                            <>
                                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" style={{ marginRight: '8px' }}>
                                    <line x1="22" y1="2" x2="11" y2="13"></line>
                                    <polygon points="22 2 15 22 11 13 2 9 22 2"></polygon>
                                </svg>
                                发送通知
                            </>
                        )}
                    </button>

                    {enabledCount > 0 && !sending && (
                        <span style={{ fontSize: '14px', color: 'rgba(255,255,255,0.6)' }}>
                            将向 {enabledCount} 位用户发送邮件
                        </span>
                    )}
                </div>
            </div>

            {/* 发送结果 */}
            {result && (
                <div className="admin-card" style={{ marginTop: '24px' }}>
                    <h2 style={{ margin: '0 0 16px 0', fontSize: '16px', color: '#fff' }}>
                        发送结果
                    </h2>

                    <div style={{ display: 'flex', gap: '24px', marginBottom: '16px' }}>
                        <div style={{ textAlign: 'center' }}>
                            <div style={{ fontSize: '28px', fontWeight: '600', color: '#10b981' }}>
                                {result.success}
                            </div>
                            <div style={{ fontSize: '13px', color: 'rgba(255,255,255,0.6)' }}>
                                发送成功
                            </div>
                        </div>
                        <div style={{ textAlign: 'center' }}>
                            <div style={{ fontSize: '28px', fontWeight: '600', color: result.failed > 0 ? '#ef4444' : 'rgba(255,255,255,0.4)' }}>
                                {result.failed}
                            </div>
                            <div style={{ fontSize: '13px', color: 'rgba(255,255,255,0.6)' }}>
                                发送失败
                            </div>
                        </div>
                        <div style={{ textAlign: 'center' }}>
                            <div style={{ fontSize: '28px', fontWeight: '600', color: 'rgba(255,255,255,0.8)' }}>
                                {result.total}
                            </div>
                            <div style={{ fontSize: '13px', color: 'rgba(255,255,255,0.6)' }}>
                                总计
                            </div>
                        </div>
                    </div>

                    {result.errors && result.errors.length > 0 && (
                        <div style={{
                            padding: '12px',
                            background: 'rgba(239, 68, 68, 0.1)',
                            borderRadius: '8px',
                            fontSize: '13px',
                            color: '#ef4444'
                        }}>
                            <strong>错误详情：</strong>
                            <ul style={{ margin: '8px 0 0 0', paddingLeft: '20px' }}>
                                {result.errors.map((err: string, idx: number) => (
                                    <li key={idx}>{err}</li>
                                ))}
                            </ul>
                        </div>
                    )}
                </div>
            )}

            {/* Toast 通知 */}
            <ToastNotification notification={notification} />
        </div>
    )
}
