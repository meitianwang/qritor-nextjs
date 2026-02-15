'use client'

/**
 * Toast Notification Hook
 * Manages Toast notification state
 */

import { useState, useCallback } from 'react'

interface Notification {
    show: boolean
    type: string
    message: string
}

interface ToastHook {
    notification: Notification
    showToast: (type: string, message: string) => void
}

/**
 * Toast notification management Hook
 * @returns notification state and showToast method
 */
export function useToast(): ToastHook {
    const [notification, setNotification] = useState<Notification>({ show: false, type: '', message: '' })

    const showToast = useCallback((type: string, message: string) => {
        setNotification({ show: true, type, message })
        setTimeout(() => {
            setNotification({ show: false, type: '', message: '' })
        }, 3000)
    }, [])

    return { notification, showToast }
}
