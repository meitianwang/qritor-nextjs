'use client'

import { createPortal } from 'react-dom'

interface ConfirmDialogProps {
    isOpen: boolean
    onConfirm: () => void
    onCancel: () => void
    title?: string
    message: string
    confirmText?: string
    cancelText?: string
    confirmVariant?: 'danger' | 'primary'
}

export default function ConfirmDialog({
    isOpen,
    onConfirm,
    onCancel,
    title = '确认',
    message,
    confirmText = '确认',
    cancelText = '取消',
    confirmVariant = 'danger',
}: ConfirmDialogProps) {
    if (!isOpen) return null

    return createPortal(
        <div className="admin-modal-overlay" onClick={onCancel}>
            <div className="admin-modal" onClick={e => e.stopPropagation()} style={{ maxWidth: '450px' }}>
                <div className="admin-modal-header">
                    <h3 className="admin-modal-title" style={{ display: 'flex', alignItems: 'center', gap: '12px' }}>
                        {confirmVariant === 'danger' ? (
                            <svg style={{ width: '24px', height: '24px', color: '#ef4444' }} fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
                            </svg>
                        ) : (
                            <svg style={{ width: '24px', height: '24px', color: '#14b8a6' }} fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M8.228 9c.549-1.165 2.03-2 3.772-2 2.21 0 4 1.343 4 3 0 1.4-1.278 2.575-3.006 2.907-.542.104-.994.54-.994 1.093m0 3h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                            </svg>
                        )}
                        {title}
                    </h3>
                    <button className="admin-modal-close" onClick={onCancel}>&times;</button>
                </div>

                <p style={{ color: 'rgba(255,255,255,0.7)', fontSize: '0.95rem', lineHeight: '1.6', whiteSpace: 'pre-wrap', marginBottom: '24px' }}>
                    {message}
                </p>

                <div style={{ display: 'flex', gap: '12px', justifyContent: 'flex-end' }}>
                    <button
                        className="admin-btn admin-btn-secondary"
                        onClick={onCancel}
                    >
                        {cancelText}
                    </button>
                    <button
                        className={`admin-btn ${confirmVariant === 'danger' ? 'admin-btn-danger' : 'admin-btn-primary'}`}
                        onClick={onConfirm}
                    >
                        {confirmText}
                    </button>
                </div>
            </div>
        </div>,
        document.body
    )
}
