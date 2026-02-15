'use client'

interface ToastNotificationProps {
    notification: {
        show: boolean
        type: string
        message: string
    }
}

/**
 * Toast notification component
 * Replacement for native alert, provides better UX
 */
export default function ToastNotification({ notification }: ToastNotificationProps) {
    if (!notification.show) return null

    return (
        <div className="fixed top-4 left-1/2 transform -translate-x-1/2 z-[9999] animate-slide-down">
            <div className={`px-5 py-3 rounded-xl shadow-2xl flex items-center gap-3 backdrop-blur-lg ${notification.type === 'success'
                ? 'bg-teal-600/90 text-white'
                : notification.type === 'warning'
                    ? 'bg-amber-500/90 text-white'
                    : 'bg-red-600/90 text-white'
                }`}>
                {notification.type === 'success' ? (
                    <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M5 13l4 4L19 7" />
                    </svg>
                ) : notification.type === 'warning' ? (
                    <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-2.5L13.732 4c-.77-.833-1.964-.833-2.732 0L3.732 16.5c-.77.833.192 2.5 1.732 2.5z" />
                    </svg>
                ) : (
                    <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M6 18L18 6M6 6l12 12" />
                    </svg>
                )}
                <span className="font-medium text-sm">{notification.message}</span>
            </div>
        </div>
    )
}
