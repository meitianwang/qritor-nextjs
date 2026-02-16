'use client'

import { useState, useEffect } from 'react'

interface ConfirmModalProps {
    isOpen: boolean
    onClose: () => void
    onConfirm: () => Promise<void> | void
    title?: string
    message?: string
    confirmText?: string
    cancelText?: string
    isDanger?: boolean
}

/**
 * 确认弹窗组件
 */
function ConfirmModal({
    isOpen,
    onClose,
    onConfirm,
    title = '确认操作',
    message = '确定要执行此操作吗？',
    confirmText = '确认',
    cancelText = '取消',
    isDanger = false
}: ConfirmModalProps) {
    const [loading, setLoading] = useState(false)

    // 重置 loading 状态当弹窗关闭时
    useEffect(() => {
        if (!isOpen) {
            setLoading(false)
        }
    }, [isOpen])

    const handleConfirm = async () => {
        try {
            setLoading(true)
            await onConfirm()
            onClose()
        } catch (error) {
            console.error('操作失败:', error)
        } finally {
            setLoading(false)
        }
    }

    const handleClose = () => {
        if (!loading) {
            onClose()
        }
    }

    if (!isOpen) return null

    return (
        <div className="admin-modal-overlay" onClick={handleClose}>
            <div className="admin-modal" style={{ maxWidth: '400px' }} onClick={e => e.stopPropagation()}>
                {/* 弹窗头部 */}
                <div className="admin-modal-header">
                    <h2 className="admin-modal-title" style={{ display: 'flex', alignItems: 'center', gap: '12px' }}>
                        {isDanger ? (
                            <svg style={{ width: '24px', height: '24px', color: '#ef4444' }} fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
                            </svg>
                        ) : (
                            <svg style={{ width: '24px', height: '24px', color: '#a855f7' }} fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M8.228 9c.549-1.165 2.03-2 3.772-2 2.21 0 4 1.343 4 3 0 1.4-1.278 2.575-3.006 2.907-.542.104-.994.54-.994 1.093m0 3h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                            </svg>
                        )}
                        {title}
                    </h2>
                    <button className="admin-modal-close" onClick={handleClose} disabled={loading}>&times;</button>
                </div>

                {/* 弹窗内容 */}
                <p style={{ color: 'rgba(255,255,255,0.7)', fontSize: '0.95rem', lineHeight: '1.6', marginBottom: '24px' }}>
                    {message}
                </p>

                {/* 弹窗底部按钮 */}
                <div style={{ display: 'flex', gap: '12px', justifyContent: 'flex-end' }}>
                    <button
                        className="admin-btn admin-btn-secondary"
                        onClick={handleClose}
                        disabled={loading}
                    >
                        {cancelText}
                    </button>
                    <button
                        className={`admin-btn ${isDanger ? 'admin-btn-danger' : 'admin-btn-primary'}`}
                        onClick={handleConfirm}
                        disabled={loading}
                    >
                        {loading ? '处理中...' : confirmText}
                    </button>
                </div>
            </div>
        </div>
    )
}

export default ConfirmModal
