'use client'

import { Suspense, useState, useEffect, useCallback } from 'react'
import Link from 'next/link'
import { useRouter, useSearchParams } from 'next/navigation'
import { useAuth } from '@/hooks/useAuth'
import { useTranslation } from '@/hooks/useTranslation'
import { useDocumentMeta } from '@/hooks/useDocumentMeta'
import { apiFetch, buildCallbackUrl } from '@/lib/auth-utils'
import { AuthBackground, AuthHeader } from '@/components/auth/AuthSharedComponents'
import LoginForm from '@/components/auth/LoginForm'

/**
 * Login page
 */
function LoginPageContent() {
    const router = useRouter()
    const searchParams = useSearchParams()
    const { login } = useAuth()
    const { t } = useTranslation('portal')

    // SEO
    useDocumentMeta({
        title: t('seo.login.title'),
        description: t('seo.login.description'),
        noindex: true
    })

    // Form state
    const [email, setEmail] = useState('')
    const [password, setPassword] = useState('')
    const [error, setError] = useState('')
    const [loading, setLoading] = useState(false)
    const [googleLoading, setGoogleLoading] = useState(false)

    // Handle desktop login - save callback info
    useEffect(() => {
        const source = searchParams.get('source')
        const redirect = searchParams.get('redirect')
        if (source === 'desktop' && redirect) {
            sessionStorage.setItem('desktopCallback', decodeURIComponent(redirect))
        }
    }, [searchParams])

    // Handle Google OAuth callback
    useEffect(() => {
        const code = searchParams.get('code')
        if (code) {
            handleGoogleCallback(code)
        }
    // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [searchParams])

    // Handle login success redirect logic
    const handleLoginSuccess = useCallback((data: Record<string, unknown>, isDesktop = false, desktopCallback: string | null = null) => {
        login(data)

        if (isDesktop && desktopCallback) {
            const { accessToken, refreshToken, expiresAt, ...user } = data
            const callbackUrl = buildCallbackUrl(desktopCallback, {
                access_token: accessToken as string,
                refresh_token: (refreshToken as string) || '',
                expires_at: expiresAt as string,
                user: encodeURIComponent(JSON.stringify(user))
            })
            sessionStorage.setItem('desktopCallbackUrl', callbackUrl)
            router.push(`/desktop-login-success?user=${encodeURIComponent(JSON.stringify(user))}`)
        } else {
            const redirectUrl = searchParams.get('redirect')
            if (redirectUrl) {
                window.location.href = decodeURIComponent(redirectUrl)
            } else {
                const storedRedirect = sessionStorage.getItem('redirectAfterLogin') || '/profile'
                sessionStorage.removeItem('redirectAfterLogin')
                router.push(storedRedirect)
            }
        }
    }, [login, router, searchParams])

    // Handle Google login callback
    const handleGoogleCallback = async (code: string) => {
        setGoogleLoading(true)
        setError('')

        try {
            const redirectUri = `${window.location.origin}/login`
            const referralCode = sessionStorage.getItem('referralCode')
            const desktopCallback = sessionStorage.getItem('desktopCallback')
            const isDesktopLogin = !!desktopCallback

            const response = await apiFetch('/api/auth/google/callback', {
                method: 'POST',
                body: {
                    code,
                    redirectUri,
                    referralCode,
                    ...(isDesktopLogin ? { client: 'desktop' } : {})
                }
            })

            const data = await response.json()

            if (data.code === 200) {
                sessionStorage.removeItem('referralCode')
                window.history.replaceState({}, '', '/login')

                if (desktopCallback) {
                    sessionStorage.removeItem('desktopCallback')
                    const { accessToken, refreshToken, expiresAt, expiresIn, ...user } = data.data
                    const callbackUrl = buildCallbackUrl(desktopCallback, {
                        access_token: accessToken,
                        refresh_token: refreshToken || '',
                        expires_at: expiresAt || (expiresIn ? new Date(Date.now() + expiresIn * 1000).toISOString() : ''),
                        user: encodeURIComponent(JSON.stringify(user))
                    })
                    sessionStorage.setItem('desktopCallbackUrl', callbackUrl)
                    login(data.data)
                    router.push(`/desktop-login-success?user=${encodeURIComponent(JSON.stringify(user))}`)
                } else {
                    handleLoginSuccess(data.data)
                }
            } else {
                setError(data.message || t('login.errors.googleFailed'))
                window.history.replaceState({}, '', '/login')
            }
        } catch (err) {
            setError(t('login.errors.googleFailed'))
            window.history.replaceState({}, '', '/login')
        } finally {
            setGoogleLoading(false)
        }
    }

    // Google login
    const handleGoogleLogin = async () => {
        setGoogleLoading(true)
        setError('')

        try {
            const redirectUri = `${window.location.origin}/login`
            const response = await apiFetch(`/api/auth/google/url?redirect_uri=${encodeURIComponent(redirectUri)}`)
            const data = await response.json()

            if (data.code === 200 && data.data?.url) {
                window.location.href = data.data.url
            } else {
                setError(data.message || t('login.errors.googleUnavailable'))
                setGoogleLoading(false)
            }
        } catch (err) {
            setError(t('login.errors.googleConnectFailed'))
            setGoogleLoading(false)
        }
    }

    // Form submit
    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault()

        if (!email) {
            setError(t('login.errors.emailRequired'))
            return
        }

        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
        if (!emailRegex.test(email)) {
            setError(t('login.errors.emailInvalid'))
            return
        }

        if (!password) {
            setError(t('login.errors.passwordRequired'))
            return
        }

        setLoading(true)
        setError('')

        try {
            const source = searchParams.get('source')
            const isDesktopLogin = source === 'desktop'

            const response = await apiFetch('/api/auth/login', {
                method: 'POST',
                body: {
                    email,
                    password,
                    ...(isDesktopLogin ? { client: 'desktop' } : {})
                }
            })

            const data = await response.json()

            if (data.code === 200) {
                const redirectFromUrl = searchParams.get('redirect')
                const desktopCallback = redirectFromUrl ? decodeURIComponent(redirectFromUrl) : null

                handleLoginSuccess(data.data, isDesktopLogin, desktopCallback)
            } else {
                setError(data.message || t('login.errors.loginFailed'))
            }
        } catch (err) {
            setError(t('common.networkError'))
        } finally {
            setLoading(false)
        }
    }

    // If processing Google callback, show loading state
    if (googleLoading && searchParams.get('code')) {
        return (
            <div className="auth-page">
                <AuthBackground />
                <div className="auth-container">
                    <AuthHeader title={t('common.loading')} />
                    <div className="auth-card animate-fade-in">
                        <div className="form-hint" style={{ textAlign: 'center', padding: 'var(--spacing-xl)' }}>
                            {t('common.loading')}
                        </div>
                    </div>
                </div>
            </div>
        )
    }

    return (
        <div className="auth-page">
            <AuthBackground />

            <div className="auth-container">
                <AuthHeader title={t('common.login')} />

                <div className="auth-card animate-fade-in">
                    <LoginForm
                        email={email}
                        onEmailChange={setEmail}
                        password={password}
                        onPasswordChange={setPassword}
                        error={error}
                        loading={loading}
                        googleLoading={googleLoading}
                        onSubmit={handleSubmit}
                        onGoogleLogin={handleGoogleLogin}
                    />
                </div>

                {/* Legal links */}
                <div className="auth-legal">
                    <Link href="/terms" target="_blank" rel="noopener noreferrer">{t('auth.termsLink')}</Link>
                    <span>·</span>
                    <Link href="/privacy" target="_blank" rel="noopener noreferrer">{t('auth.privacyLink')}</Link>
                </div>
            </div>
        </div>
    )
}

export default function LoginPage() {
    return (
        <Suspense fallback={<div />}>
            <LoginPageContent />
        </Suspense>
    )
}
