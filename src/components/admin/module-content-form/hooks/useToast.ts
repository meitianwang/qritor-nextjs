'use client'

/**
 * useToast Hook
 *
 * 管理通知提示的显示和隐藏
 */

import { useState, useCallback } from 'react'

interface Notification {
    show: boolean
    type: string
    message: string
}

export function useToast() {
    const [notification, setNotification] = useState<Notification>({ show: false, type: '', message: '' })

    const showToast = useCallback((type: string, message: string) => {
        setNotification({ show: true, type, message })
        // 3秒后自动隐藏通知
        setTimeout(() => {
            setNotification({ show: false, type: '', message: '' })
        }, 3000)
    }, [])

    const hideToast = useCallback(() => {
        setNotification({ show: false, type: '', message: '' })
    }, [])

    return {
        notification,
        showToast,
        hideToast
    }
}

export default useToast
