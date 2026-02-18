'use client'

import { Suspense, useState, useEffect, useCallback } from 'react'
import Link from 'next/link'
import { useRouter, useSearchParams } from 'next/navigation'
import { useAuth } from '@/hooks/useAuth'
import { useTranslation } from '@/hooks/useTranslation'
import { apiFetch, isPasswordStrong } from '@/lib/auth-utils'
import { AuthBackground, AuthHeader } from '@/components/auth/AuthSharedComponents'
import RegisterStep1 from '@/components/auth/RegisterStep1'
import RegisterStep2 from '@/components/auth/RegisterStep2'
import RegisterStep3 from '@/components/auth/RegisterStep3'

/**
 * Register page - 3-step registration flow
 * Step 1: Basic info (nickname, email, terms) + OAuth
 * Step 2: Set password
 * Step 3: Email verification code
 */
function RegisterPageContent() {
    const router = useRouter()
    const searchParams = useSearchParams()
    const { login } = useAuth()
    const { t } = useTranslation('portal')

    // Get referral code from URL
    const referralCodeFromUrl = searchParams.get('ref') || ''

    // Step state
    const [step, setStep] = useState(1)

    // Form data
    const [formData, setFormData] = useState(() => {
        if (typeof window === 'undefined') {
            return {
                nickname: '',
                email: '',
                password: '',
                code: ['', '', '', '', '', '']
            }
        }
        const saved = sessionStorage.getItem('registerFormData')
        if (saved) {
            try {
                const parsed = JSON.parse(saved)
                return {
                    nickname: parsed.nickname || '',
                    email: parsed.email || '',
                    password: parsed.password || '',
                    code: ['', '', '', '', '', '']
                }
            } catch (e) {
                // ignore
            }
        }
        return {
            nickname: '',
            email: '',
            password: '',
            code: ['', '', '', '', '', '']
        }
    })

    // UI state
    const [error, setError] = useState('')
    const [loading, setLoading] = useState(false)
    const [agreedToTerms, setAgreedToTerms] = useState(false)
    const [googleLoading, setGoogleLoading] = useState(false)

    // Verification code related
    const [countdown, setCountdown] = useState(0)

    // Save form data to sessionStorage
    useEffect(() => {
        if (formData.email || formData.password || formData.nickname) {
            sessionStorage.setItem('registerFormData', JSON.stringify({
                nickname: formData.nickname,
                email: formData.email,
                password: formData.password
            }))
        }
    }, [formData.email, formData.password, formData.nickname])

    // Countdown effect
    useEffect(() => {
        if (countdown > 0) {
            const timer = setTimeout(() => setCountdown(countdown - 1), 1000)
            return () => clearTimeout(timer)
        }
    }, [countdown])

    // Handle Google OAuth callback
    useEffect(() => {
        const code = searchParams.get('code')
        if (code) {
            handleGoogleCallback(code)
        }
    // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [searchParams])

    // Handle Google login callback
    const handleGoogleCallback = async (code: string) => {
        setGoogleLoading(true)
        setError('')

        try {
            const redirectUri = `${window.location.origin}/register`
            const referralCode = sessionStorage.getItem('referralCode') || referralCodeFromUrl

            const response = await apiFetch('/api/auth/google/callback', {
                method: 'POST',
                body: { code, redirect_uri: redirectUri, referral_code: referralCode }
            })

            const data = await response.json()

            if (data.code === 200) {
                login(data.data)
                sessionStorage.removeItem('referralCode')
                sessionStorage.removeItem('registerFormData')
                window.history.replaceState({}, '', '/register')
                router.push('/profile')
            } else {
                setError(data.message || t('register.errors.googleFailed'))
                window.history.replaceState({}, '', '/register')
            }
        } catch (err) {
            setError(t('register.errors.googleFailed'))
            window.history.replaceState({}, '', '/register')
        } finally {
            setGoogleLoading(false)
        }
    }

    // Google login
    const handleGoogleLogin = async () => {
        setGoogleLoading(true)
        setError('')

        try {
            const redirectUri = `${window.location.origin}/register`
            const response = await apiFetch(`/api/auth/google/url?redirect_uri=${encodeURIComponent(redirectUri)}`)
            const data = await response.json()

            if (data.code === 200 && data.data?.url) {
                if (referralCodeFromUrl) {
                    sessionStorage.setItem('referralCode', referralCodeFromUrl)
                }
                window.location.href = data.data.url
            } else {
                setError(data.message || t('register.errors.googleUnavailable'))
                setGoogleLoading(false)
            }
        } catch (err) {
            setError(t('register.errors.googleConnectFailed'))
            setGoogleLoading(false)
        }
    }

    // Form field update
    const handleFormChange = useCallback((name: string, value: string) => {
        setFormData(prev => ({ ...prev, [name]: value }))
        setError('')
    }, [])

    // Validate email format
    const isValidEmail = (email: string) => {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
        return emailRegex.test(email)
    }

    // Step 1 -> Step 2
    const handleStep1Continue = () => {
        setError('')

        if (!formData.email) {
            setError(t('register.errors.emailRequired'))
            return
        }
        if (!isValidEmail(formData.email)) {
            setError(t('register.errors.emailInvalid'))
            return
        }
        if (formData.nickname && (formData.nickname.length < 2 || formData.nickname.length > 20)) {
            setError(t('register.errors.nicknameLength'))
            return
        }
        if (!agreedToTerms) {
            setError(t('register.errors.agreeTerms'))
            return
        }

        setStep(2)
    }

    // Step 2 -> Step 3
    const handleStep2Continue = async () => {
        setError('')

        if (!formData.password) {
            setError(t('register.errors.passwordRequired'))
            return
        }
        if (!isPasswordStrong(formData.password)) {
            setError(t('auth.passwordPolicy'))
            return
        }

        setLoading(true)

        try {
            const response = await apiFetch('/api/auth/send-code', {
                method: 'POST',
                body: { email: formData.email, type: 'REGISTER' }
            })

            const data = await response.json()

            if (data.code === 200) {
                setCountdown(60)
                setStep(3)
            } else {
                setError(data.message || t('register.errors.sendCodeFailed'))
            }
        } catch (err) {
            setError(t('common.networkError'))
        } finally {
            setLoading(false)
        }
    }

    // Resend verification code
    const handleResendCode = async () => {
        if (countdown > 0) return

        setError('')

        try {
            const response = await apiFetch('/api/auth/send-code', {
                method: 'POST',
                body: { email: formData.email, type: 'REGISTER' }
            })

            const data = await response.json()

            if (data.code === 200) {
                setCountdown(60)
            } else {
                setError(data.message || t('register.errors.sendCodeFailed'))
            }
        } catch (err) {
            setError(t('common.networkError'))
        }
    }

    // Submit registration
    const submitRegistration = useCallback(async (codeString: string) => {
        setLoading(true)
        setError('')

        try {
            const response = await apiFetch('/api/auth/register', {
                method: 'POST',
                body: {
                    nickname: formData.nickname || null,
                    email: formData.email,
                    password: formData.password,
                    code: codeString,
                    referral_code: referralCodeFromUrl || null
                }
            })

            const data = await response.json()

            if (data.code === 200) {
                sessionStorage.removeItem('registerFormData')
                login(data.data)
                router.push('/profile')
            } else {
                setError(data.message || t('register.errors.registerFailed'))
                setFormData(prev => ({ ...prev, code: ['', '', '', '', '', ''] }))
            }
        } catch (err) {
            setError(t('common.networkError'))
        } finally {
            setLoading(false)
        }
    }, [formData.email, formData.password, formData.nickname, referralCodeFromUrl, login, router, t])

    // Code change & auto-submit
    const handleCodeChange = useCallback((newCode: string[]) => {
        setFormData(prev => ({ ...prev, code: newCode }))
        setError('')

        const fullCode = newCode.join('')
        if (fullCode.length === 6 && !newCode.includes('')) {
            submitRegistration(fullCode)
        }
    }, [submitRegistration])

    // Go back
    const handleBack = useCallback(() => {
        setError('')
        setStep(step - 1)
    }, [step])

    // If processing Google callback, show loading state
    if (googleLoading && searchParams.get('code')) {
        return (
            <div className="auth-page">
                <AuthBackground />
                <div className="auth-container">
                    <AuthHeader title={t('register.processingGoogle')} />
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
                <AuthHeader title={t('common.register')} />

                <div className="auth-card animate-fade-in">
                    {step === 1 && (
                        <RegisterStep1
                            formData={formData}
                            onFormChange={handleFormChange}
                            agreedToTerms={agreedToTerms}
                            onAgreeTermsChange={setAgreedToTerms}
                            error={error}
                            onContinue={handleStep1Continue}
                            googleLoading={googleLoading}
                            onGoogleLogin={handleGoogleLogin}
                        />
                    )}

                    {step === 2 && (
                        <RegisterStep2
                            email={formData.email}
                            password={formData.password}
                            onPasswordChange={(value) => handleFormChange('password', value)}
                            error={error}
                            loading={loading}
                            onContinue={handleStep2Continue}
                            onBack={handleBack}
                        />
                    )}

                    {step === 3 && (
                        <RegisterStep3
                            email={formData.email}
                            code={formData.code}
                            onCodeChange={handleCodeChange}
                            countdown={countdown}
                            error={error}
                            loading={loading}
                            onResendCode={handleResendCode}
                            onBack={handleBack}
                        />
                    )}
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

export default function RegisterPage() {
    return (
        <Suspense fallback={<div />}>
            <RegisterPageContent />
        </Suspense>
    )
}
