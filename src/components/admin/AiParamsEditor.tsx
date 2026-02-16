'use client'

import React, { useState, forwardRef, useImperativeHandle } from 'react'
import { authFetch } from '@/lib/auth-utils'
import { useTranslation } from '@/hooks/useTranslation'

interface ModuleTypeData {
  id: number
  name?: string
  promptId?: number | null
  temperature?: number
  [key: string]: unknown
}

interface Prompt {
  id: number
  name: string
}

interface LlmConfig {
  id: number
  displayName?: string
  provider?: string
  modelName?: string
}

interface FormData {
  promptId: string
  temperature: number | string
  maxTokens: string
  timeout: string
  llmConfigId: string
}

interface AiParamsEditorProps {
  onSave?: () => void
  onClose?: () => void
  showToast?: (type: string, message: string) => void
}

export interface AiParamsEditorRef {
  open: (data: ModuleTypeData) => void
  close: () => void
}

const AiParamsEditor = forwardRef<AiParamsEditorRef, AiParamsEditorProps>(({ onSave, onClose, showToast }, ref) => {
  const { t } = useTranslation('studio')
  const [isOpen, setIsOpen] = useState(false)
  const [moduleType, setModuleType] = useState<ModuleTypeData | null>(null)
  const [loading, setLoading] = useState(false)
  const [llmConfigs, setLlmConfigs] = useState<LlmConfig[]>([])
  const [prompts, setPrompts] = useState<Prompt[]>([])
  const [formData, setFormData] = useState<FormData>({
    promptId: '',
    temperature: 0.7,
    maxTokens: '',
    timeout: '',
    llmConfigId: ''
  })

  useImperativeHandle(ref, () => ({
    open: (data: ModuleTypeData) => {
      setModuleType(data)
      if (data) {
        setFormData({
          promptId: data.promptId ? String(data.promptId) : '',
          temperature: data.temperature !== undefined ? data.temperature : 0.7,
          maxTokens: '',
          timeout: '',
          llmConfigId: ''
        })
      } else {
        setFormData({
          promptId: '',
          temperature: 0.7,
          maxTokens: '',
          timeout: '',
          llmConfigId: ''
        })
      }
      setIsOpen(true)
      fetchLlmConfigs()
      fetchPrompts()
    },
    close: () => {
      setIsOpen(false)
      setModuleType(null)
    }
  }))

  const fetchLlmConfigs = async () => {
    try {
      const response = await authFetch('/api/llm-configs')
      const data = await response.json()
      if (data.code === 200) {
        setLlmConfigs(data.data || [])
      }
    } catch (error) {
      console.error('\u83b7\u53d6LLM\u914d\u7f6e\u5931\u8d25:', error)
    }
  }

  const fetchPrompts = async () => {
    try {
      const response = await authFetch('/api/prompts')
      const data = await response.json()
      if (data.code === 200) {
        setPrompts(data.data || [])
      }
    } catch (error) {
      console.error('\u83b7\u53d6\u63d0\u793a\u8bcd\u5217\u8868\u5931\u8d25:', error)
    }
  }

  const handleSave = async () => {
    if (!moduleType) return
    setLoading(true)

    try {
      const response = await authFetch(`/api/module-types/${moduleType.id}`, {
        method: 'PUT',
        body: {
          ...moduleType,
          temperature: parseFloat(String(formData.temperature)),
          promptId: formData.promptId ? parseInt(formData.promptId) : null
        }
      })

      const result = await response.json()

      if (result.code === 200) {
        if (showToast) showToast('success', t('aiParamsEditor.saveSuccess'))
        setIsOpen(false)
        if (onSave) {
          onSave()
        }
      } else {
        if (showToast) showToast('error', result.message || t('aiParamsEditor.saveFailed'))
      }
    } catch (error) {
      console.error('\u4fdd\u5b58 AI \u53c2\u6570\u5931\u8d25:', error)
      if (showToast) showToast('error', t('aiParamsEditor.saveFailedRetry'))
    } finally {
      setLoading(false)
    }
  }

  const handleClose = () => {
    if (!loading) {
      setIsOpen(false)
      if (onClose) {
        onClose()
      }
    }
  }

  if (!isOpen) return null

  return (
    <div className="admin-modal-overlay" onClick={handleClose}>
      <div className="admin-modal" onClick={e => e.stopPropagation()} style={{ maxWidth: '700px' }}>
        <div className="admin-modal-header">
          <h3 className="admin-modal-title" style={{ display: 'flex', alignItems: 'center', gap: '12px' }}>
            <svg style={{ width: '24px', height: '24px', color: '#14b8a6' }} fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z" />
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
            </svg>
            {t('aiParamsEditor.editTitle')} - {moduleType?.name}
          </h3>
          <button className="admin-modal-close" onClick={handleClose} disabled={loading}>&times;</button>
        </div>

        <p style={{ color: 'rgba(255,255,255,0.5)', fontSize: '0.9rem', marginBottom: '24px' }}>
          {t('aiParamsEditor.description')}
        </p>

        <div className="admin-form-group">
          <label className="admin-form-label">{t('aiParamsEditor.promptTemplate')}</label>
          <select
            value={formData.promptId}
            onChange={(e) => setFormData({ ...formData, promptId: e.target.value })}
            className="admin-form-input"
            style={{ cursor: 'pointer' }}
          >
            <option value="">{t('aiParamsEditor.selectPromptTemplate')}</option>
            {prompts.map((prompt) => (
              <option key={prompt.id} value={prompt.id}>
                {prompt.name}
              </option>
            ))}
          </select>
          <p style={{ marginTop: '8px', fontSize: '12px', color: '#888' }}>
            {t('aiParamsEditor.promptTemplateDesc')}
          </p>
        </div>

        <div className="admin-form-group">
          <label className="admin-form-label">{t('aiParamsEditor.temperature')}</label>
          <div style={{ display: 'flex', alignItems: 'center', gap: '16px' }}>
            <input
              type="range"
              min="0"
              max="2"
              step="0.1"
              value={formData.temperature}
              onChange={(e) => setFormData({ ...formData, temperature: e.target.value })}
              style={{ flex: 1 }}
            />
            <input
              type="number"
              min="0"
              max="2"
              step="0.1"
              value={formData.temperature}
              onChange={(e) => setFormData({ ...formData, temperature: e.target.value })}
              className="admin-form-input"
              style={{ width: '80px' }}
            />
          </div>
          <p style={{ marginTop: '8px', fontSize: '12px', color: '#888' }}>
            {t('aiParamsEditor.temperatureDesc')}
          </p>
        </div>

        <div className="admin-form-group">
          <label className="admin-form-label">{t('aiParamsEditor.llmConfig')}</label>
          <select
            value={formData.llmConfigId}
            onChange={(e) => setFormData({ ...formData, llmConfigId: e.target.value })}
            className="admin-form-input"
            style={{ cursor: 'pointer' }}
          >
            <option value="">{t('aiParamsEditor.useDefaultConfig')}</option>
            {llmConfigs.map((config) => (
              <option key={config.id} value={config.id}>
                {config.displayName || config.provider} - {config.modelName}
              </option>
            ))}
          </select>
          <p style={{ marginTop: '8px', fontSize: '12px', color: '#888' }}>
            {t('aiParamsEditor.llmConfigDesc')}
          </p>
        </div>

        <div className="admin-form-group">
          <label className="admin-form-label">{t('aiParamsEditor.maxTokens')}</label>
          <input
            type="number"
            min="1"
            value={formData.maxTokens}
            onChange={(e) => setFormData({ ...formData, maxTokens: e.target.value })}
            placeholder="\u4f8b\u5982: 2000"
            className="admin-form-input"
          />
          <p style={{ marginTop: '8px', fontSize: '12px', color: '#888' }}>
            {t('aiParamsEditor.maxTokensDesc')}
          </p>
        </div>

        <div className="admin-form-group">
          <label className="admin-form-label">{t('aiParamsEditor.timeout')}</label>
          <input
            type="number"
            min="1000"
            step="1000"
            value={formData.timeout}
            onChange={(e) => setFormData({ ...formData, timeout: e.target.value })}
            placeholder="\u4f8b\u5982: 30000 (30\u79d2)"
            className="admin-form-input"
          />
          <p style={{ marginTop: '8px', fontSize: '12px', color: '#888' }}>
            {t('aiParamsEditor.timeoutDesc')}
          </p>
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
            {loading ? '\u4fdd\u5b58\u4e2d...' : t('common.save')}
          </button>
        </div>
      </div>
    </div>
  )
})

AiParamsEditor.displayName = 'AiParamsEditor'

export default AiParamsEditor
