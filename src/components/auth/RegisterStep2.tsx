'use client'

import { useState } from 'react'
import { useTranslation } from '@/hooks/useTranslation'
import { BackButton, PasswordInput } from './AuthSharedComponents'

interface RegisterStep2Props {
    email: string
    password: string
    onPasswordChange: (value: string) => void
    error: string
    loading: boolean
    onContinue: () => void
    onBack: () => void
}

/**
 * Register Step 2: Set password
 */
export default function RegisterStep2({
    email,
    password,
    onPasswordChange,
    error,
    loading,
    onContinue,
    onBack
}: RegisterStep2Props) {
    const { t } = useTranslation('portal')
    const [showPassword, setShowPassword] = useState(false)

    return (
        <>
            <div className="auth-form">
                {/* Email (read-only) */}
                <div className="form-group">
                    <label className="form-label">{t('auth.email')}</label>
                    <div className="form-static">{email}</div>
                </div>

                {/* Password */}
                <div className="form-group">
                    <label className="form-label" htmlFor="password">
                        {t('auth.password')} <span className="required">*</span>
                    </label>
                    <PasswordInput
                        id="password"
                        name="password"
                        value={password}
                        onChange={(e) => onPasswordChange(e.target.value)}
                        placeholder={t('register.passwordPlaceholder')}
                        showPassword={showPassword}
                        onTogglePassword={() => setShowPassword(!showPassword)}
                    />
                </div>

                {/* Error message */}
                {error && <div className="form-error">{error}</div>}

                <button
                    type="button"
                    className="btn btn-primary btn-large btn-block"
                    onClick={onContinue}
                    disabled={loading}
                >
                    {loading ? t('register.sendingCode') : t('register.continue')}
                </button>
            </div>

            {/* Back button */}
            <BackButton onClick={onBack} label={t('register.back')} />
        </>
    )
}
