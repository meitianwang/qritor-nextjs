'use client'

import { useState, useEffect } from 'react'
import { loadStripe, Stripe } from '@stripe/stripe-js'
import { Elements, CardElement, useStripe, useElements } from '@stripe/react-stripe-js'
import { useTranslation } from '@/hooks/useTranslation'
import { authFetch } from '@/lib/auth-utils'

interface AddPaymentMethodFormProps {
    onSuccess: () => void
    onCancel: () => void
}

// Card element style for dark theme
const CARD_ELEMENT_OPTIONS = {
    style: {
        base: {
            color: '#e5e7eb',
            fontSize: '14px',
            fontFamily: 'system-ui, -apple-system, sans-serif',
            '::placeholder': { color: '#6b7280' },
        },
        invalid: { color: '#ef4444' },
    },
}

function CardForm({ onSuccess, onCancel }: AddPaymentMethodFormProps) {
    const stripe = useStripe()
    const elements = useElements()
    const { t } = useTranslation('portal')
    const [loading, setLoading] = useState(false)
    const [error, setError] = useState<string | null>(null)

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault()
        if (!stripe || !elements) return

        setLoading(true)
        setError(null)

        try {
            // Get SetupIntent client secret from backend
            const res = await authFetch('/api/payment-methods/setup-intent', {
                method: 'POST',
            })
            const data = await res.json()
            if (data.code !== 200 || !data.data?.clientSecret) {
                setError(data.message || 'Failed to create setup intent')
                return
            }

            const cardElement = elements.getElement(CardElement)
            if (!cardElement) return

            const { error: stripeError } = await stripe.confirmCardSetup(
                data.data.clientSecret,
                { payment_method: { card: cardElement } },
            )

            if (stripeError) {
                setError(stripeError.message || 'Card setup failed')
            } else {
                onSuccess()
            }
        } catch {
            setError('Network error')
        } finally {
            setLoading(false)
        }
    }

    return (
        <form onSubmit={handleSubmit}>
            <div style={{
                padding: '0.75rem 1rem',
                background: 'var(--color-bg-tertiary)',
                borderRadius: 'var(--radius-md)',
                border: '1px solid var(--color-border)',
                marginBottom: '0.75rem',
            }}>
                <CardElement options={CARD_ELEMENT_OPTIONS} />
            </div>
            {error && (
                <p style={{ color: 'var(--color-error, #ef4444)', fontSize: '0.8rem', marginBottom: '0.5rem' }}>
                    {error}
                </p>
            )}
            <div style={{ display: 'flex', gap: '0.5rem', justifyContent: 'flex-end' }}>
                <button
                    type="button"
                    className="btn btn-secondary btn-sm"
                    onClick={onCancel}
                    disabled={loading}
                >
                    {t('common.cancel')}
                </button>
                <button
                    type="submit"
                    className="btn btn-primary btn-sm"
                    disabled={!stripe || loading}
                >
                    {loading ? '...' : t('profile.billing.addCard')}
                </button>
            </div>
        </form>
    )
}

function AddPaymentMethodForm(props: AddPaymentMethodFormProps) {
    const [stripePromise, setStripePromise] = useState<Promise<Stripe | null> | null>(null)

    useEffect(() => {
        const fetchKey = async () => {
            try {
                const res = await fetch('/api/stripe/config/public')
                const data = await res.json()
                if (data.code === 200 && data.data?.publishableKey) {
                    setStripePromise(loadStripe(data.data.publishableKey))
                }
            } catch {
                // Silently fail
            }
        }
        fetchKey()
    }, [])

    if (!stripePromise) {
        return <p style={{ color: 'var(--color-text-tertiary)', fontSize: '0.875rem' }}>Loading...</p>
    }

    return (
        <Elements stripe={stripePromise}>
            <CardForm {...props} />
        </Elements>
    )
}

export default AddPaymentMethodForm
