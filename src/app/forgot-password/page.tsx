'use client'

import { useState, useEffect } from 'react'
import Link from 'next/link'
import { useRouter } from 'next/navigation'
import { apiFetch, isPasswordStrong } from '@/lib/auth-utils'
import { useTranslation } from '@/hooks/useTranslation'
import { useToast } from '@/hooks/useToast'
import ToastNotification from '@/components/ToastNotification'
import { AuthBackground, PasswordInput } from '@/components/auth/AuthSharedComponents'

/**
 * Forgot password page
 */
export default function ForgotPasswordPage() {
    const router = useRouter()
    const [step, setStep] = useState(1) // 1: enter email, 2: enter code and new password
    const [email, setEmail] = useState('')
    const [code, setCode] = useState('')
    const [newPassword, setNewPassword] = useState('')
    const [confirmPassword, setConfirmPassword] = useState('')
    const [showPassword, setShowPassword] = useState(false)
    const [error, setError] = useState('')
    const [loading, setLoading] = useState(false)
    const [codeSending, setCodeSending] = useState(false)
    const [countdown, setCountdown] = useState(0)
    const { t } = useTranslation('portal')
    const { notification, showToast } = useToast()

    // Countdown effect
    useEffect(() => {
        if (countdown > 0) {
            const timer = setTimeout(() => setCountdown(countdown - 1), 1000)
            return () => clearTimeout(timer)
        }
    }, [countdown])

    // Send verification code
    const handleSendCode = async () => {
        if (!email) {
            setError(t('forgotPassword.errors.emailRequired'))
            return
        }

        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
        if (!emailRegex.test(email)) {
            setError(t('forgotPassword.errors.emailInvalid'))
            return
        }

        setCodeSending(true)
        setError('')

        try {
            const response = await apiFetch('/api/auth/send-code', {
                method: 'POST',
                body: {
                    email: email,
                    type: 'RESET_PASSWORD'
                }
            })

            const data = await response.json()

            if (data.code === 200) {
                setCountdown(60)
                setStep(2)
            } else {
                setError(data.message || t('forgotPassword.errors.sendFailed'))
            }
        } catch (err) {
            setError(t('common.networkError'))
        } finally {
            setCodeSending(false)
        }
    }

    // Reset password
    const handleResetPassword = async (e: React.FormEvent) => {
        e.preventDefault()

        if (!code || code.length !== 6) {
            setError(t('forgotPassword.errors.codeInvalid'))
            return
        }

        if (!isPasswordStrong(newPassword)) {
            setError(t('auth.passwordPolicy'))
            return
        }

        if (newPassword !== confirmPassword) {
            setError(t('forgotPassword.errors.passwordMismatch'))
            return
        }

        setLoading(true)
        setError('')

        try {
            const response = await apiFetch('/api/auth/reset-password', {
                method: 'POST',
                body: {
                    email: email,
                    code: code,
                    newPassword: newPassword
                }
            })

            const data = await response.json()

            if (data.code === 200) {
                showToast('success', t('forgotPassword.successMessage'))
                // Delay 2 seconds then redirect
                setTimeout(() => {
                    router.push('/login')
                }, 2000)
            } else {
                setError(data.message || t('forgotPassword.errors.resetFailed'))
            }
        } catch (err) {
            setError(t('common.networkError'))
        } finally {
            setLoading(false)
        }
    }

    return (
        <div className="auth-page">
            <AuthBackground />

            {/* Reset password card */}
            <div className="auth-container">
                <div className="auth-card animate-fade-in">
                    {/* Logo */}
                    <div className="auth-header">
                        <Link href="/" className="auth-logo">
                            <img src="/images/logo.png" alt="Qritor Logo" className="logo-img" />
                        </Link>
                        <h1 className="auth-title">{t('auth.resetPassword')}</h1>
                        <p className="auth-subtitle">
                            {step === 1 ? t('forgotPassword.step1Subtitle') : t('forgotPassword.step2Subtitle')}
                        </p>
                    </div>

                    {step === 1 ? (
                        // Step 1: Enter email
                        <div className="auth-form">
                            <div className="form-group">
                                <label className="form-label" htmlFor="email">{t('auth.email')}</label>
                                <input
                                    type="email"
                                    id="email"
                                    className="form-input"
                                    placeholder={t('forgotPassword.emailPlaceholder')}
                                    required
                                    value={email}
                                    onChange={(e) => {
                                        setEmail(e.target.value)
                                        setError('')
                                    }}
                                />
                            </div>

                            {error && <div className="form-error">{error}</div>}

                            <button
                                type="button"
                                className="btn btn-primary btn-large btn-block"
                                onClick={handleSendCode}
                                disabled={codeSending}
                            >
                                {codeSending ? t('common.loading') : t('auth.sendCode')}
                            </button>
                        </div>
                    ) : (
                        // Step 2: Enter code and new password
                        <form onSubmit={handleResetPassword} className="auth-form">
                            <div className="form-group">
                                <label className="form-label">{t('auth.email')}</label>
                                <div className="form-static">{email}</div>
                            </div>

                            <div className="form-group">
                                <label className="form-label" htmlFor="code">{t('auth.verificationCode')}</label>
                                <div className="code-input-wrapper">
                                    <input
                                        type="text"
                                        id="code"
                                        className="form-input"
                                        placeholder={t('forgotPassword.codePlaceholder')}
                                        required
                                        maxLength={6}
                                        value={code}
                                        onChange={(e) => {
                                            setCode(e.target.value.replace(/\D/g, ''))
                                            setError('')
                                        }}
                                    />
                                    <button
                                        type="button"
                                        className="btn btn-ghost code-btn"
                                        onClick={handleSendCode}
                                        disabled={codeSending || countdown > 0}
                                    >
                                        {countdown > 0 ? `${countdown}s` : codeSending ? t('common.sending') : t('auth.resendCode')}
                                    </button>
                                </div>
                            </div>

                            <div className="form-group">
                                <label className="form-label" htmlFor="newPassword">{t('auth.newPassword')}</label>
                                <PasswordInput
                                    id="newPassword"
                                    name="newPassword"
                                    value={newPassword}
                                    onChange={(e) => {
                                        setNewPassword(e.target.value)
                                        setError('')
                                    }}
                                    placeholder={t('forgotPassword.newPasswordPlaceholder')}
                                    showPassword={showPassword}
                                    onTogglePassword={() => setShowPassword(!showPassword)}
                                />
                            </div>

                            <div className="form-group">
                                <label className="form-label" htmlFor="confirmPassword">{t('auth.confirmPassword')}</label>
                                <input
                                    type="password"
                                    id="confirmPassword"
                                    className="form-input"
                                    placeholder={t('forgotPassword.confirmPasswordPlaceholder')}
                                    required
                                    value={confirmPassword}
                                    onChange={(e) => {
                                        setConfirmPassword(e.target.value)
                                        setError('')
                                    }}
                                />
                            </div>

                            {error && <div className="form-error">{error}</div>}

                            <button type="submit" className="btn btn-primary btn-large btn-block" disabled={loading}>
                                {loading ? t('common.resetting') : t('forgotPassword.resetButton')}
                            </button>
                        </form>
                    )}

                    {/* Back to login */}
                    <div className="auth-footer">
                        <Link href="/login" className="form-link">&larr; {t('auth.backToLogin')}</Link>
                    </div>
                </div>
            </div>

            {/* Toast notification */}
            <ToastNotification notification={notification} />
        </div>
    )
}
