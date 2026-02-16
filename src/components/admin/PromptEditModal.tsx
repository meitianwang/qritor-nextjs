'use client'

import React, { useState, forwardRef, useImperativeHandle } from 'react'
import { authFetch } from '@/lib/auth-utils'
import { useTranslation } from '@/hooks/useTranslation'

interface PromptData {
  id?: number
  name?: string
  role?: string
  context?: string
  workflow?: string
  constraints?: string
  format?: string
  goal?: string
  positiveExample?: string
  negativeExample?: string
  builtIn?: boolean
  novelCreationMethodId?: number | null
}

interface FormData {
  name: string
  role: string
  context: string
  workflow: string
  constraints: string
  format: string
  goal: string
  positiveExample: string
  negativeExample: string
  builtIn: boolean
  novelCreationMethodId: number | null
  [key: string]: string | boolean | number | null
}

interface PromptEditModalProps {
  onSuccess?: () => void
  showToast?: (type: string, message: string) => void
}

export interface PromptEditModalRef {
  open: (prompt?: PromptData | null) => void
  close: () => void
}

const PromptEditModal = forwardRef<PromptEditModalRef, PromptEditModalProps>(({ onSuccess, showToast }, ref) => {
  const { t } = useTranslation('studio')
  const [isOpen, setIsOpen] = useState(false)
  const [editingPrompt, setEditingPrompt] = useState<PromptData | null>(null)
  const [formData, setFormData] = useState<FormData>({
    name: '',
    role: '',
    context: '',
    workflow: '',
    constraints: '',
    format: '',
    goal: '',
    positiveExample: '',
    negativeExample: '',
    builtIn: false,
    novelCreationMethodId: null
  })
  const [loading, setLoading] = useState(false)
  const [showParseSection, setShowParseSection] = useState(false)
  const [parseText, setParseText] = useState('')

  useImperativeHandle(ref, () => ({
    open: (prompt: PromptData | null = null) => {
      const isEditing = prompt && prompt.id
      setEditingPrompt(isEditing ? prompt : null)

      if (isEditing && prompt) {
        setFormData({
          name: prompt.name || '',
          role: prompt.role || '',
          context: prompt.context || '',
          workflow: prompt.workflow || '',
          constraints: prompt.constraints || '',
          format: prompt.format || '',
          goal: prompt.goal || '',
          positiveExample: prompt.positiveExample || '',
          negativeExample: prompt.negativeExample || '',
          builtIn: prompt.builtIn || false,
          novelCreationMethodId: prompt.novelCreationMethodId || null
        })
      } else {
        const initialData = prompt || {}
        setFormData({
          name: '',
          role: '',
          context: '',
          workflow: '',
          constraints: '',
          format: '',
          goal: '',
          positiveExample: '',
          negativeExample: '',
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

  const handleParse = () => {
    try {
      if (!parseText.trim()) {
        if (showToast) showToast('warning', t('promptModal.enterContent'))
        return
      }

      const text = parseText.trim()
      let parsed: Record<string, string> = {}

      // 先尝试 JSON 解析
      if (text.startsWith('{')) {
        try {
          parsed = JSON.parse(text)
        } catch {
          // JSON 解析失败，尝试宽松 JSON 解析（处理嵌套 JSON 字符串和中文引号）
          parsed = parseLooseJson(text)
        }
      } else {
        // 不是 JSON 格式，尝试 Markdown 解析
        parsed = parseMarkdown(text)
      }

      // 字段映射：支持中英文多种表述
      const fieldMapping: Record<string, string> = {
        // 中文
        '\u89d2\u8272\u5b9a\u4e49': 'role',
        '\u89d2\u8272': 'role',
        '\u76ee\u6807\u63cf\u8ff0': 'goal',
        '\u76ee\u6807': 'goal',
        '\u4e0a\u4e0b\u6587\u4fe1\u606f': 'context',
        '\u4e0a\u4e0b\u6587': 'context',
        '\u80cc\u666f': 'context',
        '\u5de5\u4f5c\u6d41\u7a0b\uff08\u601d\u8003\u8fc7\u7a0b\uff09': 'workflow',
        '\u5de5\u4f5c\u6d41\u7a0b': 'workflow',
        '\u601d\u8003\u8fc7\u7a0b': 'workflow',
        '\u7ea6\u675f\u6761\u4ef6': 'constraints',
        '\u7ea6\u675f': 'constraints',
        '\u9650\u5236': 'constraints',
        '\u6b63\u4f8b\u63cf\u8ff0': 'positiveExample',
        '\u6b63\u4f8b\u793a\u8303': 'positiveExample',
        '\u6b63\u4f8b': 'positiveExample',
        '\u6b63\u9762\u793a\u4f8b': 'positiveExample',
        '\u53cd\u4f8b\u63cf\u8ff0': 'negativeExample',
        '\u53cd\u4f8b\u793a\u8303': 'negativeExample',
        '\u53cd\u4f8b': 'negativeExample',
        '\u53cd\u9762\u793a\u4f8b': 'negativeExample',
        '\u8f93\u51fa\u683c\u5f0f': 'format',
        '\u683c\u5f0f': 'format',
        // 英文
        'role': 'role',
        'Role': 'role',
        'goal': 'goal',
        'Goal': 'goal',
        'context': 'context',
        'Context': 'context',
        'workflow': 'workflow',
        'Workflow': 'workflow',
        'constraints': 'constraints',
        'Constraints': 'constraints',
        'positiveExample': 'positiveExample',
        'positive_example': 'positiveExample',
        'negativeExample': 'negativeExample',
        'negative_example': 'negativeExample',
        'format': 'format',
        'Format': 'format'
      }

      const newFormData = { ...formData }
      let hasUpdate = false

      Object.keys(parsed).forEach(key => {
        let fieldName = fieldMapping[key]

        if (!fieldName) {
          // 尝试清理 key 后再匹配
          const cleanKey = key.replace(/[:：\s]/g, '')
          fieldName = fieldMapping[cleanKey]
        }

        if (fieldName && parsed[key]) {
          newFormData[fieldName] = parsed[key]
          hasUpdate = true
        }
      })

      if (!hasUpdate && Object.keys(parsed).length > 0) {
        // 如果解析了内容但没匹配上，尝试作为整体内容填入 context
        const allContent = Object.entries(parsed)
          .map(([k, v]) => `${k}:\n${v}`)
          .join('\n\n')
        if (allContent.trim()) {
          newFormData.context = allContent
          hasUpdate = true
        }
      }

      if (!hasUpdate) {
        if (showToast) showToast('warning', '\u65e0\u6cd5\u89e3\u6790\u5185\u5bb9\uff0c\u8bf7\u68c0\u67e5\u683c\u5f0f')
        return
      }

      setFormData(newFormData)
      setParseText('')
      setShowParseSection(false)
      if (showToast) showToast('success', t('promptModal.parseSuccess'))
    } catch (error) {
      console.error('\u89e3\u6790\u5931\u8d25:', error)
      if (showToast) showToast('error', t('promptModal.parseFailed'))
    }
  }

  const parseMarkdown = (text: string): Record<string, string> => {
    const result: Record<string, string> = {}
    const lines = text.split('\n')
    let currentSection: string | null = null
    let currentContent: string[] = []

    lines.forEach(line => {
      const trimmedLine = line.trim()
      const headerMatch = trimmedLine.match(/^#{1,6}\s+(.+)/)

      if (headerMatch) {
        if (currentSection) {
          result[currentSection] = currentContent.join('\n').trim()
        }
        currentSection = headerMatch[1].trim()
        currentContent = []
      } else if (currentSection) {
        currentContent.push(line)
      }
    })

    if (currentSection) {
      result[currentSection] = currentContent.join('\n').trim()
    }

    return result
  }

  // 宽松的 JSON 解析：使用正则表达式提取键值对
  const parseLooseJson = (text: string): Record<string, string> => {
    const result: Record<string, string> = {}

    // 匹配模式：  "键名": "值" 或 "键名": "多行值..."
    // 支持中英文引号
    const keyPattern = /["""]([^"""]+)["""""]\s*:\s*/g
    let match: RegExpExecArray | null
    const matches: Array<{ key: string; startIndex: number; valueStartIndex: number }> = []

    // 找到所有键的位置
    while ((match = keyPattern.exec(text)) !== null) {
      matches.push({
        key: match[1],
        startIndex: match.index,
        valueStartIndex: match.index + match[0].length
      })
    }

    // 提取每个键对应的值
    for (let i = 0; i < matches.length; i++) {
      const current = matches[i]
      const nextStart = i + 1 < matches.length ? matches[i + 1].startIndex : text.length

      // 值的范围
      let valueText = text.substring(current.valueStartIndex, nextStart).trim()

      // 去除尾部的逗号
      if (valueText.endsWith(',')) {
        valueText = valueText.slice(0, -1).trim()
      }

      // 如果值被引号包裹，去除引号
      if ((valueText.startsWith('"') || valueText.startsWith('\u201c')) &&
        (valueText.endsWith('"') || valueText.endsWith('\u201d'))) {
        valueText = valueText.slice(1, -1)
      }

      // 处理转义字符
      valueText = valueText.replace(/\\n/g, '\n').replace(/\\"/g, '"')

      result[current.key] = valueText.trim()
    }

    return result
  }

  const handleSave = async () => {
    try {
      if (!formData.name) {
        if (showToast) showToast('warning', t('promptModal.nameRequired'))
        return
      }

      const hasContent = formData.role || formData.context || formData.workflow ||
        formData.constraints || formData.format || formData.goal ||
        formData.positiveExample || formData.negativeExample
      if (!hasContent) {
        if (showToast) showToast('warning', t('promptModal.atLeastOneField'))
        return
      }

      setLoading(true)
      const url = editingPrompt
        ? `/api/prompts/${editingPrompt.id}`
        : '/api/prompts'

      const response = await authFetch(url, {
        method: editingPrompt ? 'PUT' : 'POST',
        body: formData
      })

      const result = await response.json()
      if (result.code === 200) {
        setIsOpen(false)
        onSuccess?.()
      } else {
        if (showToast) showToast('error', result.message || t('promptModal.operationFailed'))
      }
    } catch (error) {
      console.error('\u4fdd\u5b58\u63d0\u793a\u8bcd\u5931\u8d25:', error)
      if (showToast) showToast('error', t('promptModal.saveFailed'))
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
      <div className="admin-modal" onClick={e => e.stopPropagation()} style={{ maxWidth: '800px', maxHeight: '90vh', overflow: 'auto' }}>
        <div className="admin-modal-header">
          <h3 className="admin-modal-title" style={{ display: 'flex', alignItems: 'center', gap: '12px' }}>
            <svg style={{ width: '24px', height: '24px', color: '#14b8a6' }} fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z" />
            </svg>
            {editingPrompt ? t('promptModal.editTitle') : t('promptModal.addTitle')}
          </h3>
          <button className="admin-modal-close" onClick={handleClose} disabled={loading}>&times;</button>
        </div>

        <div className="admin-form-group">
          <label className="admin-form-label">
            {t('promptModal.name')} <span style={{ color: '#ef4444' }}>*</span>
          </label>
          <input
            type="text"
            value={formData.name}
            onChange={(e) => setFormData({ ...formData, name: e.target.value })}
            className="admin-form-input"
            placeholder={t('promptModal.namePlaceholder')}
            disabled={loading}
          />
        </div>

        {/* 一键解析区域 */}
        <div style={{ padding: '16px', background: 'rgba(255,255,255,0.03)', borderRadius: '8px', border: '1px solid rgba(13, 148, 136, 0.2)', marginBottom: '20px' }}>
          <button
            type="button"
            onClick={() => setShowParseSection(!showParseSection)}
            style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', width: '100%', background: 'none', border: 'none', color: '#fff', fontSize: '14px', fontWeight: '500', cursor: 'pointer' }}
          >
            <span style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
              <svg style={{ width: '20px', height: '20px', color: '#14b8a6' }} fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 10V3L4 14h7v7l9-11h-7z" />
              </svg>
              {t('promptModal.oneClickParse')}
            </span>
            <svg
              style={{ width: '20px', height: '20px', transition: 'transform 0.2s', transform: showParseSection ? 'rotate(180deg)' : 'rotate(0deg)' }}
              fill="none"
              stroke="currentColor"
              viewBox="0 0 24 24"
            >
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
            </svg>
          </button>

          {showParseSection && (
            <div style={{ marginTop: '16px' }}>
              <textarea
                value={parseText}
                onChange={(e) => setParseText(e.target.value)}
                className="admin-form-input"
                placeholder={t('promptModal.parsePlaceholder')}
                rows={6}
                disabled={loading}
                style={{ fontFamily: 'monospace', fontSize: '13px', marginBottom: '12px' }}
              />
              <button
                type="button"
                onClick={handleParse}
                disabled={loading || !parseText.trim()}
                className="admin-btn admin-btn-primary"
                style={{ width: '100%' }}
              >
                {t('promptModal.parseAndFill')}
              </button>
            </div>
          )}
        </div>

        {/* 表单字段 */}
        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(2, 1fr)', gap: '16px' }}>
          <div className="admin-form-group" style={{ marginBottom: 0 }}>
            <label className="admin-form-label">{t('promptModal.role')}</label>
            <textarea
              value={formData.role}
              onChange={(e) => setFormData({ ...formData, role: e.target.value })}
              className="admin-form-input"
              placeholder={t('promptModal.rolePlaceholder')}
              rows={3}
              disabled={loading}
              style={{ resize: 'vertical' }}
            />
          </div>

          <div className="admin-form-group" style={{ marginBottom: 0 }}>
            <label className="admin-form-label">{t('promptModal.goal')}</label>
            <textarea
              value={formData.goal}
              onChange={(e) => setFormData({ ...formData, goal: e.target.value })}
              className="admin-form-input"
              placeholder={t('promptModal.goalPlaceholder')}
              rows={3}
              disabled={loading}
              style={{ resize: 'vertical' }}
            />
          </div>

          <div className="admin-form-group" style={{ marginBottom: 0 }}>
            <label className="admin-form-label">{t('promptModal.context')}</label>
            <textarea
              value={formData.context}
              onChange={(e) => setFormData({ ...formData, context: e.target.value })}
              className="admin-form-input"
              placeholder={t('promptModal.contextPlaceholder')}
              rows={3}
              disabled={loading}
              style={{ resize: 'vertical' }}
            />
          </div>

          <div className="admin-form-group" style={{ marginBottom: 0 }}>
            <label className="admin-form-label">{t('promptModal.workflow')}</label>
            <textarea
              value={formData.workflow}
              onChange={(e) => setFormData({ ...formData, workflow: e.target.value })}
              className="admin-form-input"
              placeholder={t('promptModal.workflowPlaceholder')}
              rows={3}
              disabled={loading}
              style={{ resize: 'vertical' }}
            />
          </div>

          <div className="admin-form-group" style={{ marginBottom: 0 }}>
            <label className="admin-form-label">{t('promptModal.constraints')}</label>
            <textarea
              value={formData.constraints}
              onChange={(e) => setFormData({ ...formData, constraints: e.target.value })}
              className="admin-form-input"
              placeholder={t('promptModal.constraintsPlaceholder')}
              rows={3}
              disabled={loading}
              style={{ resize: 'vertical' }}
            />
          </div>

          <div className="admin-form-group" style={{ marginBottom: 0 }}>
            <label className="admin-form-label">{t('promptModal.positiveExample')}</label>
            <textarea
              value={formData.positiveExample}
              onChange={(e) => setFormData({ ...formData, positiveExample: e.target.value })}
              className="admin-form-input"
              placeholder={t('promptModal.positiveExamplePlaceholder')}
              rows={3}
              disabled={loading}
              style={{ resize: 'vertical' }}
            />
          </div>

          <div className="admin-form-group" style={{ marginBottom: 0 }}>
            <label className="admin-form-label">{t('promptModal.negativeExample')}</label>
            <textarea
              value={formData.negativeExample}
              onChange={(e) => setFormData({ ...formData, negativeExample: e.target.value })}
              className="admin-form-input"
              placeholder={t('promptModal.negativeExamplePlaceholder')}
              rows={3}
              disabled={loading}
              style={{ resize: 'vertical' }}
            />
          </div>

          <div className="admin-form-group" style={{ marginBottom: 0 }}>
            <label className="admin-form-label">{t('promptModal.format')}</label>
            <textarea
              value={formData.format}
              onChange={(e) => setFormData({ ...formData, format: e.target.value })}
              className="admin-form-input"
              placeholder={t('promptModal.formatPlaceholder')}
              rows={3}
              disabled={loading}
              style={{ resize: 'vertical' }}
            />
          </div>
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
            {loading ? t('promptModal.saving') : t('common.save')}
          </button>
        </div>
      </div>
    </div>
  )
})

PromptEditModal.displayName = 'PromptEditModal'

export default PromptEditModal
