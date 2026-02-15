'use client'

import { useState } from 'react'
import Link from 'next/link'
import { useTranslation } from '@/hooks/useTranslation'
import { GoogleLoginButton, PasswordInput } from './AuthSharedComponents'

interface LoginFormProps {
    email: string
    onEmailChange: (value: string) => void
    password: string
    onPasswordChange: (value: string) => void
    error: string
    loading: boolean
    googleLoading: boolean
    onSubmit: (e: React.FormEvent) => void
    onGoogleLogin: () => void
}

/**
 * Login form component
 */
export default function LoginForm({
    email,
    onEmailChange,
    password,
    onPasswordChange,
    error,
    loading,
    googleLoading,
    onSubmit,
    onGoogleLogin
}: LoginFormProps) {
    const { t } = useTranslation('portal')
    const [showPassword, setShowPassword] = useState(false)

    return (
        <>
            {/* Google login button */}
            <div className="social-login">
                <GoogleLoginButton
                    onClick={onGoogleLogin}
                    loading={googleLoading}
                    label={googleLoading ? t('common.loading') : t('auth.googleLogin')}
                />
            </div>

            {/* Divider */}
            <div className="auth-divider">
                <span>{t('auth.orLoginWith')}</span>
            </div>

            {/* Login form */}
            <form className="auth-form" onSubmit={onSubmit}>
                <div className="form-group">
                    <label className="form-label" htmlFor="email">{t('auth.email')}</label>
                    <input
                        type="email"
                        id="email"
                        name="email"
                        className="form-input"
                        placeholder={t('auth.emailPlaceholder')}
                        required
                        autoComplete="email"
                        value={email}
                        onChange={(e) => onEmailChange(e.target.value)}
                    />
                </div>

                <div className="form-group">
                    <div className="form-label-row">
                        <label className="form-label" htmlFor="password">{t('auth.password')}</label>
                        <Link href="/forgot-password" className="form-link">{t('auth.forgotPassword')}</Link>
                    </div>
                    <PasswordInput
                        id="password"
                        name="password"
                        value={password}
                        onChange={(e) => onPasswordChange(e.target.value)}
                        placeholder={t('auth.passwordPlaceholder')}
                        showPassword={showPassword}
                        onTogglePassword={() => setShowPassword(!showPassword)}
                        autoComplete="current-password"
                    />
                </div>

                {/* Error message */}
                {error && <div className="form-error">{error}</div>}

                <button type="submit" className="btn btn-primary btn-large btn-block" disabled={loading}>
                    {loading ? t('common.loading') : t('common.login')}
                </button>
            </form>

            {/* Register link */}
            <div className="auth-footer">
                <span>{t('auth.noAccount')}</span>
                <Link href="/register" className="form-link">{t('common.register')}</Link>
            </div>
        </>
    )
}
