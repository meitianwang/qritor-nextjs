'use client'

import { useState } from 'react'
import { createPortal } from 'react-dom'
import { useTranslation } from '@/hooks/useTranslation'

interface MarkdownPreviewModalProps {
  isOpen: boolean
  onClose: () => void
  title: string
  content: string
  loading?: boolean
}

export default function MarkdownPreviewModal({ isOpen, onClose, title, content, loading }: MarkdownPreviewModalProps) {
  const { t } = useTranslation('studio')
  const [copied, setCopied] = useState(false)

  if (!isOpen) return null

  const handleCopy = async () => {
    if (!content) return
    try {
      await navigator.clipboard.writeText(content)
      setCopied(true)
      setTimeout(() => setCopied(false), 2000)
    } catch (err) {
      console.error('Failed to copy:', err)
    }
  }

  return createPortal(
    <div className="admin-modal-overlay" onClick={onClose}>
      <div className="admin-modal" onClick={e => e.stopPropagation()} style={{ maxWidth: '800px', maxHeight: '85vh', display: 'flex', flexDirection: 'column' }}>
        <div className="admin-modal-header">
          <h3 className="admin-modal-title" style={{ overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }}>
            {title}
          </h3>
          <button className="admin-modal-close" onClick={onClose}>&times;</button>
        </div>

        {/* Content */}
        <div style={{ flex: 1, overflow: 'auto', marginBottom: '24px' }}>
          {loading ? (
            <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'center', height: '200px' }}>
              <div className="admin-loading-spinner"></div>
            </div>
          ) : (
            <div style={{ whiteSpace: 'pre-wrap', fontFamily: 'monospace', fontSize: '14px', color: 'rgba(255,255,255,0.9)' }}>
              {content || t('common.noContent')}
            </div>
          )}
        </div>

        {/* Footer */}
        <div style={{ display: 'flex', justifyContent: 'flex-end', gap: '12px' }}>
          <button
            onClick={handleCopy}
            disabled={!content || loading}
            className="admin-btn admin-btn-primary"
          >
            {copied ? (
              <>
                <svg style={{ width: '16px', height: '16px' }} fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M5 13l4 4L19 7" />
                </svg>
                {t('common.copied')}
              </>
            ) : (
              <>
                <svg style={{ width: '16px', height: '16px' }} fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M8 16H6a2 2 0 01-2-2V6a2 2 0 012-2h8a2 2 0 012 2v2m-6 12h8a2 2 0 002-2v-8a2 2 0 00-2-2h-8a2 2 0 00-2 2v8a2 2 0 002 2z" />
                </svg>
                {t('common.copy')}
              </>
            )}
          </button>
          <button
            onClick={onClose}
            className="admin-btn admin-btn-secondary"
          >
            {t('common.close')}
          </button>
        </div>
      </div>
    </div>,
    document.body
  )
}
