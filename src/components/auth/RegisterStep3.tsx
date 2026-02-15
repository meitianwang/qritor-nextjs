'use client'

import { useRef, useEffect } from 'react'
import { useTranslation } from '@/hooks/useTranslation'
import { BackButton } from './AuthSharedComponents'

interface RegisterStep3Props {
    email: string
    code: string[]
    onCodeChange: (newCode: string[]) => void
    countdown: number
    error: string
    loading: boolean
    onResendCode: () => void
    onBack: () => void
}

/**
 * Register Step 3: Email verification code
 */
export default function RegisterStep3({
    email,
    code,
    onCodeChange,
    countdown,
    error,
    loading,
    onResendCode,
    onBack
}: RegisterStep3Props) {
    const { t } = useTranslation('portal')
    const codeInputRefs = useRef<(HTMLInputElement | null)[]>([])

    // Auto-focus first input
    useEffect(() => {
        codeInputRefs.current[0]?.focus()
    }, [])

    // Code input handler
    const handleCodeInput = (index: number, value: string) => {
        const digit = value.replace(/\D/g, '').slice(-1)
        const newCode = [...code]
        newCode[index] = digit

        onCodeChange(newCode)

        // Auto-advance to next input
        if (digit && index < 5) {
            codeInputRefs.current[index + 1]?.focus()
        }
    }

    // Code keyboard event
    const handleCodeKeyDown = (index: number, e: React.KeyboardEvent<HTMLInputElement>) => {
        if (e.key === 'Backspace' && !code[index] && index > 0) {
            codeInputRefs.current[index - 1]?.focus()
        }
    }

    // Code paste handler
    const handleCodePaste = (e: React.ClipboardEvent<HTMLInputElement>) => {
        e.preventDefault()
        const pastedData = e.clipboardData.getData('text').replace(/\D/g, '').slice(0, 6)
        if (pastedData.length > 0) {
            const newCode = [...code]
            for (let i = 0; i < pastedData.length; i++) {
                newCode[i] = pastedData[i]
            }
            onCodeChange(newCode)

            const nextIndex = Math.min(pastedData.length, 5)
            codeInputRefs.current[nextIndex]?.focus()
        }
    }

    return (
        <>
            <div className="auth-form">
                <div className="form-group">
                    <label className="form-label">{t('register.verifyEmail')}</label>
                    <p className="form-hint" style={{ textAlign: 'left', marginBottom: 'var(--spacing-lg)' }}>
                        {t('register.codeSentTo')} <strong style={{ color: 'var(--color-accent-blue-light)' }}>{email}</strong>
                    </p>

                    {/* 6-digit verification code inputs */}
                    <div className="verification-code-inputs">
                        {code.map((digit, index) => (
                            <input
                                key={index}
                                ref={el => { codeInputRefs.current[index] = el }}
                                type="text"
                                inputMode="numeric"
                                maxLength={1}
                                className="verification-code-input"
                                value={digit}
                                onChange={(e) => handleCodeInput(index, e.target.value)}
                                onKeyDown={(e) => handleCodeKeyDown(index, e)}
                                onPaste={handleCodePaste}
                            />
                        ))}
                    </div>
                </div>

                {/* Resend */}
                <div className="form-hint" style={{ marginTop: 'var(--spacing-md)' }}>
                    {t('register.noCodeReceived')}
                    <button
                        type="button"
                        className="form-link"
                        style={{ marginLeft: '4px', background: 'none', border: 'none', cursor: countdown > 0 ? 'not-allowed' : 'pointer' }}
                        onClick={onResendCode}
                        disabled={countdown > 0}
                    >
                        {countdown > 0 ? t('register.resendIn', { seconds: countdown }) : t('auth.resendCode')}
                    </button>
                </div>

                {/* Error message */}
                {error && <div className="form-error">{error}</div>}

                {/* Loading state */}
                {loading && (
                    <div className="form-hint" style={{ color: 'var(--color-accent-blue-light)' }}>
                        {t('register.verifying')}
                    </div>
                )}
            </div>

            {/* Back button */}
            <BackButton onClick={onBack} label={t('register.back')} />
        </>
    )
}
