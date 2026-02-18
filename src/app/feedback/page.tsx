'use client'

import { useState, useRef, useCallback } from 'react'
import { useTranslation } from '@/hooks/useTranslation'
import { useDocumentMeta } from '@/hooks/useDocumentMeta'
import { useAuth } from '@/hooks/useAuth'
import { useToast } from '@/hooks/useToast'
import { authFetch } from '@/lib/auth-utils'
import ToastNotification from '@/components/ToastNotification'

const CATEGORIES = ['bug', 'suggestion', 'other'] as const
const ALLOWED_EXTENSIONS = ['jpg', 'jpeg', 'png', 'gif', 'webp']
const MAX_FILE_SIZE = 5 * 1024 * 1024

const CATEGORY_ICONS: Record<string, React.ReactNode> = {
    bug: (
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <path d="m8 2 1.88 1.88" /><path d="M14.12 3.88 16 2" /><path d="M9 7.13v-1a3.003 3.003 0 1 1 6 0v1" />
            <path d="M12 20c-3.3 0-6-2.7-6-6v-3a4 4 0 0 1 4-4h4a4 4 0 0 1 4 4v3c0 3.3-2.7 6-6 6" />
            <path d="M12 20v-9" /><path d="M6.53 9C4.6 8.8 3 7.1 3 5" /><path d="M6 13H2" /><path d="M3 21c0-2.1 1.7-3.9 3.8-4" />
            <path d="M20.97 5c0 2.1-1.6 3.8-3.5 4" /><path d="M22 13h-4" /><path d="M17.2 17c2.1.1 3.8 1.9 3.8 4" />
        </svg>
    ),
    suggestion: (
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <path d="M2 12s3-7 10-7 10 7 10 7-3 7-10 7-10-7-10-7Z" />
            <circle cx="12" cy="12" r="3" />
        </svg>
    ),
    other: (
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z" />
        </svg>
    ),
}

export default function FeedbackPage() {
    const { t } = useTranslation('portal')
    const { getUser } = useAuth()
    const { notification, showToast } = useToast()

    useDocumentMeta({
        title: t('seo.feedback.title'),
        description: t('seo.feedback.description'),
    })

    const [category, setCategory] = useState('')
    const [subject, setSubject] = useState('')
    const [message, setMessage] = useState('')
    const [screenshotUrl, setScreenshotUrl] = useState('')
    const [screenshotPreview, setScreenshotPreview] = useState('')
    const [uploading, setUploading] = useState(false)
    const [uploadError, setUploadError] = useState('')
    const [submitting, setSubmitting] = useState(false)
    const [error, setError] = useState('')
    const [dragging, setDragging] = useState(false)

    const fileInputRef = useRef<HTMLInputElement>(null)
    const user = getUser()

    const resetForm = useCallback(() => {
        setCategory('')
        setSubject('')
        setMessage('')
        setScreenshotUrl('')
        setScreenshotPreview('')
        setUploadError('')
        setError('')
    }, [])

    const validateFile = useCallback((file: File): string | null => {
        const ext = file.name.split('.').pop()?.toLowerCase() || ''
        if (!ALLOWED_EXTENSIONS.includes(ext)) {
            return t('feedback.screenshot.formatError')
        }
        if (file.size > MAX_FILE_SIZE) {
            return t('feedback.screenshot.sizeError')
        }
        return null
    }, [t])

    const uploadScreenshot = useCallback(async (file: File) => {
        const validationError = validateFile(file)
        if (validationError) {
            setUploadError(validationError)
            return
        }

        setUploadError('')
        setUploading(true)

        const reader = new FileReader()
        reader.onload = (e) => {
            setScreenshotPreview(e.target?.result as string)
        }
        reader.readAsDataURL(file)

        try {
            const formData = new FormData()
            formData.append('file', file)

            const response = await authFetch('/api/feedback/upload', {
                method: 'POST',
                body: formData,
            })

            const data = await response.json()
            if (data.code === 200 && data.data?.url) {
                setScreenshotUrl(data.data.url)
            } else {
                setUploadError(t('feedback.errors.uploadFailed'))
                setScreenshotPreview('')
            }
        } catch {
            setUploadError(t('feedback.errors.uploadFailed'))
            setScreenshotPreview('')
        } finally {
            setUploading(false)
        }
    }, [validateFile, t])

    const handleFileChange = useCallback((e: React.ChangeEvent<HTMLInputElement>) => {
        const file = e.target.files?.[0]
        if (file) {
            uploadScreenshot(file)
        }
        e.target.value = ''
    }, [uploadScreenshot])

    const handleDrop = useCallback((e: React.DragEvent) => {
        e.preventDefault()
        setDragging(false)
        const file = e.dataTransfer.files?.[0]
        if (file) {
            uploadScreenshot(file)
        }
    }, [uploadScreenshot])

    const handleDragOver = useCallback((e: React.DragEvent) => {
        e.preventDefault()
        setDragging(true)
    }, [])

    const handleDragLeave = useCallback((e: React.DragEvent) => {
        e.preventDefault()
        setDragging(false)
    }, [])

    const removeScreenshot = useCallback(() => {
        setScreenshotUrl('')
        setScreenshotPreview('')
        setUploadError('')
    }, [])

    const handleSubmit = useCallback(async (e: React.FormEvent) => {
        e.preventDefault()
        setError('')

        if (!category) {
            setError(t('feedback.errors.categoryRequired'))
            return
        }
        if (!subject.trim()) {
            setError(t('feedback.errors.subjectRequired'))
            return
        }
        if (subject.length > 100) {
            setError(t('feedback.errors.subjectTooLong'))
            return
        }
        if (!message.trim()) {
            setError(t('feedback.errors.messageRequired'))
            return
        }
        if (message.length > 2000) {
            setError(t('feedback.errors.messageTooLong'))
            return
        }

        setSubmitting(true)

        try {
            const response = await authFetch('/api/feedback', {
                method: 'POST',
                body: {
                    category,
                    subject: subject.trim(),
                    message: message.trim(),
                    screenshotUrl: screenshotUrl || undefined,
                },
            })

            const data = await response.json()
            if (data.code === 200) {
                showToast('success', t('feedback.success'))
                resetForm()
            } else {
                setError(data.message || t('feedback.errors.submitFailed'))
            }
        } catch {
            setError(t('feedback.errors.submitFailed'))
        } finally {
            setSubmitting(false)
        }
    }, [category, subject, message, screenshotUrl, t, showToast, resetForm])

    const charCountClass = message.length > 2000
        ? 'feedback-char-count limit'
        : message.length > 1800
            ? 'feedback-char-count warning'
            : 'feedback-char-count'

    const emailInitial = (user?.email as string)?.[0]?.toUpperCase() || '?'

    return (
        <>
            {/* Hero */}
            <section className="feedback-hero">
                <h1 className="feedback-hero-title animate-fade-in">
                    {t('feedback.title')}
                </h1>
                <p className="feedback-hero-subtitle animate-fade-in delay-100">
                    {t('feedback.subtitle')}
                </p>
            </section>

            {/* Form */}
            <section style={{ paddingBottom: '8rem' }} className="px-4">
                <form className="feedback-card animate-fade-in delay-200" onSubmit={handleSubmit}>
                    {/* User Badge */}
                    <div className="feedback-user-badge">
                        <div className="feedback-user-avatar">{emailInitial}</div>
                        <div className="feedback-user-info">
                            <span className="feedback-user-label">
                                {t('feedback.email.label')}
                            </span>
                            <span className="feedback-user-email">
                                {user?.email as string || ''}
                            </span>
                        </div>
                    </div>

                    {/* Category */}
                    <div className="feedback-section">
                        <label className="feedback-label">
                            {t('feedback.category.label')}
                        </label>
                        <div className="feedback-category-grid">
                            {CATEGORIES.map((cat) => (
                                <button
                                    key={cat}
                                    type="button"
                                    data-category={cat}
                                    className={`feedback-category-btn${category === cat ? ' selected' : ''}`}
                                    onClick={() => {
                                        setCategory(cat)
                                        setError('')
                                    }}
                                >
                                    <div className="feedback-category-icon">
                                        {CATEGORY_ICONS[cat]}
                                    </div>
                                    <span className="feedback-category-name">
                                        {t(`feedback.category.${cat}`)}
                                    </span>
                                </button>
                            ))}
                        </div>
                    </div>

                    <div className="feedback-divider" />

                    {/* Subject */}
                    <div className="feedback-section">
                        <label className="feedback-label">
                            {t('feedback.subject.label')}
                        </label>
                        <input
                            type="text"
                            className="feedback-input"
                            placeholder={t('feedback.subject.placeholder')}
                            value={subject}
                            onChange={(e) => {
                                setSubject(e.target.value)
                                setError('')
                            }}
                            maxLength={100}
                        />
                    </div>

                    {/* Message */}
                    <div className="feedback-section">
                        <label className="feedback-label">
                            {t('feedback.message.label')}
                        </label>
                        <textarea
                            className="feedback-input feedback-textarea"
                            placeholder={t('feedback.message.placeholder')}
                            value={message}
                            onChange={(e) => {
                                setMessage(e.target.value)
                                setError('')
                            }}
                            maxLength={2000}
                        />
                        <div className={charCountClass}>
                            {message.length} / 2000
                        </div>
                    </div>

                    {/* Screenshot */}
                    <div className="feedback-section">
                        <label className="feedback-label">
                            {t('feedback.screenshot.label')}
                        </label>
                        <input
                            ref={fileInputRef}
                            type="file"
                            accept="image/jpeg,image/png,image/gif,image/webp"
                            onChange={handleFileChange}
                            style={{ display: 'none' }}
                        />

                        {uploading ? (
                            <div className="feedback-uploading">
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" className="animate-spin">
                                    <path d="M21 12a9 9 0 1 1-6.219-8.56" />
                                </svg>
                                {t('feedback.screenshot.uploading')}
                            </div>
                        ) : screenshotPreview ? (
                            <div className="feedback-preview">
                                <img src={screenshotPreview} alt="Screenshot preview" />
                                <button
                                    type="button"
                                    className="feedback-preview-remove"
                                    onClick={removeScreenshot}
                                    title={t('feedback.screenshot.remove')}
                                >
                                    &times;
                                </button>
                            </div>
                        ) : (
                            <div
                                className={`feedback-upload${dragging ? ' dragging' : ''}`}
                                onClick={() => fileInputRef.current?.click()}
                                onDrop={handleDrop}
                                onDragOver={handleDragOver}
                                onDragLeave={handleDragLeave}
                            >
                                <div className="feedback-upload-icon">
                                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round">
                                        <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4" />
                                        <polyline points="17 8 12 3 7 8" />
                                        <line x1="12" y1="3" x2="12" y2="15" />
                                    </svg>
                                </div>
                                <p className="feedback-upload-text">
                                    {t('feedback.screenshot.hint')}
                                </p>
                            </div>
                        )}

                        {uploadError && (
                            <p className="feedback-upload-error">{uploadError}</p>
                        )}
                    </div>

                    {/* Error */}
                    {error && (
                        <div className="feedback-error">
                            <svg className="feedback-error-icon" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                                <circle cx="12" cy="12" r="10" />
                                <line x1="12" y1="8" x2="12" y2="12" />
                                <line x1="12" y1="16" x2="12.01" y2="16" />
                            </svg>
                            {error}
                        </div>
                    )}

                    {/* Submit */}
                    <button
                        type="submit"
                        className="feedback-submit"
                        disabled={submitting || uploading}
                    >
                        {submitting ? t('feedback.submitting') : t('feedback.submit')}
                    </button>
                </form>
            </section>

            <ToastNotification notification={notification} />
        </>
    )
}
