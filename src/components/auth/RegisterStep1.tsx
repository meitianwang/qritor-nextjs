'use client'

import Link from 'next/link'
import { useTranslation } from '@/hooks/useTranslation'
import { GoogleLoginButton } from './AuthSharedComponents'

interface RegisterStep1Props {
    formData: {
        nickname: string
        email: string
        password: string
        code: string[]
    }
    onFormChange: (name: string, value: string) => void
    agreedToTerms: boolean
    onAgreeTermsChange: (checked: boolean) => void
    error: string
    onContinue: () => void
    googleLoading: boolean
    onGoogleLogin: () => void
}

/**
 * Register Step 1: Basic info (nickname, email, terms) + OAuth
 */
export default function RegisterStep1({
    formData,
    onFormChange,
    agreedToTerms,
    onAgreeTermsChange,
    error,
    onContinue,
    googleLoading,
    onGoogleLogin
}: RegisterStep1Props) {
    const { t } = useTranslation('portal')

    const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        onFormChange(e.target.name, e.target.value)
    }

    return (
        <>
            {/* Google login button */}
            <div className="social-login">
                <GoogleLoginButton
                    onClick={onGoogleLogin}
                    loading={googleLoading}
                    label={googleLoading ? t('common.loading') : t('auth.googleRegister')}
                />
            </div>

            {/* Divider */}
            <div className="auth-divider">
                <span>{t('register.or')}</span>
            </div>

            {/* Form */}
            <div className="auth-form">
                {/* Nickname (optional) */}
                <div className="form-group">
                    <label className="form-label" htmlFor="nickname">
                        {t('auth.nickname')} <span className="optional">{t('register.optional')}</span>
                    </label>
                    <input
                        type="text"
                        id="nickname"
                        name="nickname"
                        className="form-input"
                        placeholder={t('register.nicknamePlaceholder')}
                        value={formData.nickname}
                        onChange={handleChange}
                    />
                </div>

                {/* Email */}
                <div className="form-group">
                    <label className="form-label" htmlFor="email">
                        {t('auth.email')} <span className="required">*</span>
                    </label>
                    <input
                        type="email"
                        id="email"
                        name="email"
                        className="form-input"
                        placeholder={t('auth.emailPlaceholder')}
                        required
                        autoComplete="email"
                        value={formData.email}
                        onChange={handleChange}
                    />
                </div>

                {/* Terms checkbox */}
                <div className="form-checkbox">
                    <input
                        type="checkbox"
                        id="terms"
                        checked={agreedToTerms}
                        onChange={(e) => onAgreeTermsChange(e.target.checked)}
                    />
                    <label htmlFor="terms">
                        {t('auth.agreeTerms')} <Link href="/terms" className="form-link" target="_blank" rel="noopener noreferrer">{t('auth.termsLink')}</Link> {t('auth.andText')} <Link href="/privacy" className="form-link" target="_blank" rel="noopener noreferrer">{t('auth.privacyLink')}</Link>
                    </label>
                </div>

                {/* Error message */}
                {error && <div className="form-error">{error}</div>}

                <button
                    type="button"
                    className="btn btn-primary btn-large btn-block"
                    onClick={onContinue}
                >
                    {t('register.continue')}
                </button>
            </div>

            {/* Login link */}
            <div className="auth-footer">
                <span>{t('auth.hasAccount')}</span>
                <Link href="/login" className="form-link">{t('common.login')}</Link>
            </div>
        </>
    )
}
