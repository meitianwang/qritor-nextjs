'use client'

import React, { useState, forwardRef, useImperativeHandle } from 'react'
import { authFetch } from '@/lib/auth-utils'
import { useTranslation } from '@/hooks/useTranslation'

interface KnowledgeData {
  id?: number
  name?: string
  content?: string
  builtIn?: boolean
  novelCreationMethodId?: number | null
}

interface FormData {
  name: string
  content: string
  builtIn: boolean
  novelCreationMethodId: number | null
}

interface KnowledgeEditModalProps {
  onSuccess?: () => void
  showToast?: (type: string, message: string) => void
}

export interface KnowledgeEditModalRef {
  open: (knowledge?: KnowledgeData | null) => void
  close: () => void
}

const KnowledgeEditModal = forwardRef<KnowledgeEditModalRef, KnowledgeEditModalProps>(({ onSuccess, showToast }, ref) => {
  const { t } = useTranslation('studio')
  const [isOpen, setIsOpen] = useState(false)
  const [editingKnowledge, setEditingKnowledge] = useState<KnowledgeData | null>(null)
  const [formData, setFormData] = useState<FormData>({
    name: '',
    content: '',
    builtIn: false,
    novelCreationMethodId: null
  })
  const [loading, setLoading] = useState(false)

  useImperativeHandle(ref, () => ({
    open: (knowledge: KnowledgeData | null = null) => {
      const isEditing = knowledge && knowledge.id
      setEditingKnowledge(isEditing ? knowledge : null)

      if (isEditing && knowledge) {
        setFormData({
          name: knowledge.name || '',
          content: knowledge.content || '',
          builtIn: knowledge.builtIn || false,
          novelCreationMethodId: knowledge.novelCreationMethodId || null
        })
      } else {
        const initialData = knowledge || {}
        setFormData({
          name: '',
          content: '',
          builtIn: false,
          novelCreationMethodId: initialData.novelCreationMethodId || null
        })
      }
      setIsOpen(true)
    },
    close: () => {
      setIsOpen(false)
    }
  }))

  const handleSave = async () => {
    try {
      if (!formData.name || !formData.content) {
        if (showToast) showToast('warning', t('knowledgeModal.fillComplete'))
        return
      }

      setLoading(true)
      const url = editingKnowledge
        ? `/api/knowledges/${editingKnowledge.id}`
        : '/api/knowledges'

      const response = await authFetch(url, {
        method: editingKnowledge ? 'PUT' : 'POST',
        body: formData
      })

      const result = await response.json()
      if (result.code === 200) {
        setIsOpen(false)
        onSuccess?.()
      } else {
        if (showToast) showToast('error', result.message || t('knowledgeModal.operationFailed'))
      }
    } catch (error) {
      console.error('\u4fdd\u5b58\u77e5\u8bc6\u5e93\u5931\u8d25:', error)
      if (showToast) showToast('error', t('knowledgeModal.saveFailed'))
    } finally {
      setLoading(false)
    }
  }

  const handleClose = () => {
    if (!loading) {
      setIsOpen(false)
    }
  }

  if (!isOpen) return null

  return (
    <div className="admin-modal-overlay" onClick={handleClose}>
      <div className="admin-modal" onClick={e => e.stopPropagation()} style={{ maxWidth: '700px' }}>
        <div className="admin-modal-header">
          <h3 className="admin-modal-title" style={{ display: 'flex', alignItems: 'center', gap: '12px' }}>
            <svg style={{ width: '24px', height: '24px', color: '#14b8a6' }} fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253" />
            </svg>
            {editingKnowledge ? t('knowledgeModal.editTitle') : t('knowledgeModal.addTitle')}
          </h3>
          <button className="admin-modal-close" onClick={handleClose} disabled={loading}>&times;</button>
        </div>

        <div className="admin-form-group">
          <label className="admin-form-label">
            {t('knowledgeModal.name')} <span style={{ color: '#ef4444' }}>*</span>
          </label>
          <input
            type="text"
            value={formData.name}
            onChange={(e) => setFormData({ ...formData, name: e.target.value })}
            className="admin-form-input"
            placeholder={t('knowledgeModal.namePlaceholder')}
            disabled={loading}
          />
        </div>

        <div className="admin-form-group">
          <label className="admin-form-label">
            {t('knowledgeModal.content')} <span style={{ color: '#ef4444' }}>*</span>
          </label>
          <textarea
            value={formData.content}
            onChange={(e) => setFormData({ ...formData, content: e.target.value })}
            className="admin-form-input"
            placeholder={t('knowledgeModal.contentPlaceholder')}
            rows={10}
            disabled={loading}
            style={{ resize: 'vertical', minHeight: '200px' }}
          />
        </div>

        <div style={{ display: 'flex', gap: '12px', justifyContent: 'flex-end', marginTop: '24px' }}>
          <button
            className="admin-btn admin-btn-secondary"
            onClick={handleClose}
            disabled={loading}
          >
            {t('common.cancel')}
          </button>
          <button
            className="admin-btn admin-btn-primary"
            onClick={handleSave}
            disabled={loading}
          >
            {loading ? t('knowledgeModal.saving') : t('common.save')}
          </button>
        </div>
      </div>
    </div>
  )
})

KnowledgeEditModal.displayName = 'KnowledgeEditModal'

export default KnowledgeEditModal
