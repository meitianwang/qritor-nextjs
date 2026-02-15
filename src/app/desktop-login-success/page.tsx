'use client'

import { Suspense, useEffect, useState } from 'react'
import Link from 'next/link'
import { useSearchParams } from 'next/navigation'
import { useTranslation } from '@/hooks/useTranslation'

interface UserData {
    nickname?: string
    email?: string
    avatar?: string
}

function DesktopLoginSuccessContent() {
    const searchParams = useSearchParams()
    const { t } = useTranslation('portal')
    const [user, setUser] = useState<UserData | null>(null)

    useEffect(() => {
        // Get user info from URL params
        const userJson = searchParams.get('user')
        if (userJson) {
            try {
                const userData = JSON.parse(decodeURIComponent(userJson))
                setUser(userData)
            } catch (e) {
                console.error('Failed to parse user data:', e)
            }
        }

        // Auto-trigger opening desktop app
        const callback = sessionStorage.getItem('desktopCallbackUrl')
        if (callback) {
            sessionStorage.removeItem('desktopCallbackUrl')

            if (callback.startsWith('http://') || callback.startsWith('https://')) {
                const iframe = document.createElement('iframe')
                iframe.style.display = 'none'
                iframe.src = callback
                document.body.appendChild(iframe)

                setTimeout(() => {
                    if (iframe.parentNode) {
                        document.body.removeChild(iframe)
                    }
                }, 5000)
            } else {
                window.location.href = callback
            }
        }
    }, [searchParams])

    return (
        <>
            {/* Glow background */}
            <div className="auth-bg">
                <div className="hero-glow">
                    <div className="hero-glow-orb hero-glow-orb-1"></div>
                    <div className="hero-glow-orb hero-glow-orb-2"></div>
                    <div className="hero-glow-orb hero-glow-orb-3"></div>
                </div>
            </div>

            <div className="desktop-success-container">
                {/* Logo */}
                <Link href="/" className="desktop-success-logo">
                    <img src="/images/logo.png" alt="Qritor Logo" className="logo-img" />
                </Link>

                {/* Success icon */}
                <div className="success-icon">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                        <polyline points="20 6 9 17 4 12"></polyline>
                    </svg>
                </div>

                {/* Title */}
                <h1 className="success-title">{t('desktop.loginSuccess')}</h1>

                {/* User info card */}
                {user && (
                    <div className="user-card">
                        <span className="user-card-label">{t('desktop.account')}</span>
                        <div className="user-info">
                            {user.avatar ? (
                                <img src={user.avatar} alt={user.nickname} className="user-avatar" />
                            ) : (
                                <div className="user-avatar-placeholder">
                                    {user.nickname?.charAt(0) || user.email?.charAt(0) || '?'}
                                </div>
                            )}
                            <span className="user-name">{user.nickname || user.email}</span>
                        </div>
                    </div>
                )}

                {/* Success message */}
                <div className="success-message">
                    <p className="success-message-title">{t('desktop.allReady')}</p>
                    <p className="success-message-desc">
                        {t('desktop.returnToQritor')}
                    </p>
                </div>

                {/* Close hint */}
                <p className="close-hint">{t('desktop.canCloseWindow')}</p>
            </div>
        </>
    )
}

/**
 * Desktop login success page
 * Shows login success info and auto-triggers opening the desktop app
 */
export default function DesktopLoginSuccessPage() {
    return (
        <Suspense fallback={<div className="desktop-success-container" />}>
            <DesktopLoginSuccessContent />
        </Suspense>
    )
}
