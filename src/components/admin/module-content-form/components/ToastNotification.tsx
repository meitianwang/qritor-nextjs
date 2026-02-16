'use client'

/**
 * Toast 通知组件
 */

import React from 'react'

interface ToastNotificationProps {
    show: boolean
    type: string
    message: string
}

function ToastNotification({ show, type, message }: ToastNotificationProps) {
    if (!show) return null

    return (
        <div className="fixed top-4 left-1/2 transform -translate-x-1/2 z-50 animate-slide-down">
            <div className={`px-6 py-4 rounded-xl shadow-2xl flex items-center gap-3 ${type === 'success'
                ? 'bg-green-600 text-white'
                : 'bg-red-600 text-white'
                }`}>
                {type === 'success' ? (
                    <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M5 13l4 4L19 7" />
                    </svg>
                ) : (
                    <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M6 18L18 6M6 6l12 12" />
                    </svg>
                )}
                <span className="font-medium">{message}</span>
            </div>
        </div>
    )
}

export default ToastNotification
