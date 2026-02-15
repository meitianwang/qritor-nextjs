'use client'

import { useTranslation } from '@/hooks/useTranslation'

interface DeleteAccountModalProps {
    email: string
    deleteCode: string
    setDeleteCode: (code: string) => void
    deleteError: string
    deleteSending: boolean
    deleteDeleting: boolean
    onConfirm: () => void
    onClose: () => void
}

/**
 * Delete account confirmation modal component
 */
function DeleteAccountModal({
    email,
    deleteCode,
    setDeleteCode,
    deleteError,
    deleteSending,
    deleteDeleting,
    onConfirm,
    onClose
}: DeleteAccountModalProps) {
    const { t } = useTranslation('portal')

    return (
        <div className="delete-account-modal-overlay" onClick={onClose}>
            <div className="delete-account-modal" onClick={e => e.stopPropagation()}>
                <div className="delete-account-modal-header">
                    <svg className="warning-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                        <circle cx="12" cy="12" r="10" />
                        <line x1="12" y1="8" x2="12" y2="12" />
                        <line x1="12" y1="16" x2="12.01" y2="16" />
                    </svg>
                    <h3>{t('profile.deleteAccountModal.title')}</h3>
                </div>
                <div className="delete-account-modal-body">
                    <p>{t('profile.deleteAccountModal.warning')}</p>
                    <p className="code-label">
                        {t('profile.deleteAccountModal.codeLabel')} <span className="email-highlight">{email}</span>
                    </p>
                    <input
                        type="text"
                        className="code-input"
                        placeholder={t('profile.deleteAccountModal.codePlaceholder')}
                        value={deleteCode}
                        onChange={e => setDeleteCode(e.target.value.replace(/\D/g, '').slice(0, 6))}
                        maxLength={6}
                    />
                    {deleteError && <div className="error-text">{deleteError}</div>}
                </div>
                <div className="delete-account-modal-footer">
                    <button className="btn-cancel" onClick={onClose}>
                        {t('common.cancel')}
                    </button>
                    <button
                        className="btn-confirm-delete"
                        onClick={onConfirm}
                        disabled={deleteDeleting || deleteSending}
                    >
                        {deleteDeleting ? t('common.deleting') : t('common.delete')}
                    </button>
                </div>
            </div>
        </div>
    )
}

export default DeleteAccountModal
