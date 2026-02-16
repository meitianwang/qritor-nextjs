'use client'

import React, { useState, forwardRef, useImperativeHandle } from 'react'
import { authFetch } from '@/lib/auth-utils'
import { useTranslation } from '@/hooks/useTranslation'

interface ModuleTypeData {
  id: number
  name?: string
  aiContextTemplate?: string
  novelCreationMethodId?: number | null
  [key: string]: unknown
}

interface AllModuleType {
  id: number
  name: string
  jsonSchema?: string
}

interface ContextTemplateItem {
  moduleTypeId: number
  module: string
  field: string
}

interface SchemaField {
  path: string
  type: string
  description: string
}

interface AiContextEditorProps {
  onSave?: () => void
  onClose?: () => void
  showToast?: (type: string, message: string) => void
}

export interface AiContextEditorRef {
  open: (data: ModuleTypeData) => Promise<void>
  close: () => void
}

const AiContextEditor = forwardRef<AiContextEditorRef, AiContextEditorProps>(({ onSave, onClose, showToast }, ref) => {
  const { t } = useTranslation('studio')
  const [isOpen, setIsOpen] = useState(false)
  const [moduleType, setModuleType] = useState<ModuleTypeData | null>(null)
  const [loading, setLoading] = useState(false)
  const [allModuleTypes, setAllModuleTypes] = useState<AllModuleType[]>([])
  const [contextTemplateItems, setContextTemplateItems] = useState<ContextTemplateItem[]>([])
  const [selectedModuleType, setSelectedModuleType] = useState('')
  const [selectedFields, setSelectedFields] = useState<string[]>([])
  const [availableFields, setAvailableFields] = useState<SchemaField[]>([])

  useImperativeHandle(ref, () => ({
    open: async (data: ModuleTypeData) => {
      setModuleType(data)

      let templateItems: ContextTemplateItem[] = []
      if (data?.aiContextTemplate) {
        try {
          const parsed = JSON.parse(data.aiContextTemplate)
          if (!Array.isArray(parsed)) {
            templateItems = []
          } else {
            templateItems = parsed.map((item: Record<string, unknown>) => ({
              moduleTypeId: item.moduleTypeId as number,
              module: (item.module as string) || '',
              field: item.field as string
            }))
          }
        } catch (e) {
          console.error('\u89e3\u6790 AI \u4e0a\u4e0b\u6587\u6a21\u677f\u5931\u8d25:', e)
          templateItems = []
        }
      }

      setContextTemplateItems(templateItems)
      setIsOpen(true)
      const methodId = data?.novelCreationMethodId || null
      await fetchAllModuleTypes(methodId)
    },
    close: () => {
      setIsOpen(false)
      setModuleType(null)
      setContextTemplateItems([])
      setSelectedModuleType('')
      setSelectedFields([])
      setAvailableFields([])
    }
  }))

  const fetchAllModuleTypes = async (novelCreationMethodId: number | null) => {
    try {
      let url = '/api/module-types'
      if (novelCreationMethodId) {
        url = `/api/module-types/novel-creation-method/${novelCreationMethodId}`
      }
      const response = await authFetch(url)
      const data = await response.json()
      if (data.code === 200) {
        setAllModuleTypes(data.data || [])
      }
    } catch (error) {
      console.error('\u83b7\u53d6\u6a21\u5757\u7c7b\u578b\u5217\u8868\u5931\u8d25:', error)
    }
  }

  const getModuleTypeNameById = (moduleTypeId: number): string => {
    const found = allModuleTypes.find(t => t.id === moduleTypeId)
    return found ? found.name : `${t('aiContextEditor.unknownModule')}(ID: ${moduleTypeId})`
  }

  const extractFieldsFromSchema = (jsonSchema: string | undefined): SchemaField[] => {
    if (!jsonSchema) return []

    try {
      const schema = JSON.parse(jsonSchema)
      const fields: SchemaField[] = []

      const extractFields = (properties: Record<string, Record<string, unknown>>, prefix = '') => {
        if (!properties) return

        Object.entries(properties).forEach(([key, value]) => {
          const fieldPath = prefix ? `${prefix}.${key}` : key
          fields.push({
            path: fieldPath,
            type: (value.type as string) || '',
            description: (value.description as string) || ''
          })

          if (value.type === 'object' && value.properties) {
            extractFields(value.properties as Record<string, Record<string, unknown>>, fieldPath)
          }
          else if (value.type === 'array' && value.items) {
            const items = value.items as Record<string, unknown>
            if (items.type === 'object' && items.properties) {
              extractFields(items.properties as Record<string, Record<string, unknown>>, fieldPath)
            }
          }
        })
      }

      if (schema.properties) {
        extractFields(schema.properties)
      }

      return fields
    } catch (e) {
      console.error('\u89e3\u6790 JSON Schema \u5931\u8d25:', e)
      return []
    }
  }

  const handleModuleTypeSelect = (moduleTypeId: string) => {
    setSelectedModuleType(moduleTypeId)
    const selectedType = allModuleTypes.find(t => t.id.toString() === moduleTypeId)
    if (selectedType) {
      const fields = extractFieldsFromSchema(selectedType.jsonSchema)
      setAvailableFields(fields)
      setSelectedFields([])
    }
  }

  const handleSelectAllFields = () => {
    if (!selectedModuleType || availableFields.length === 0) return

    const allFieldPaths = availableFields.map(field => field.path)
    const allSelected = allFieldPaths.every(path => selectedFields.includes(path))

    if (allSelected) {
      setSelectedFields([])
    } else {
      setSelectedFields(allFieldPaths)
    }
  }

  const handleAddFieldReference = () => {
    if (!selectedModuleType || selectedFields.length === 0) {
      if (showToast) showToast('warning', t('aiContextEditor.selectTypeAndField'))
      return
    }

    const selectedType = allModuleTypes.find(t => t.id.toString() === selectedModuleType)
    const newItems: ContextTemplateItem[] = selectedFields.map(field => ({
      moduleTypeId: parseInt(selectedModuleType),
      module: selectedType ? selectedType.name : '',
      field: field
    }))

    setContextTemplateItems([...contextTemplateItems, ...newItems])
    setSelectedFields([])
  }

  const handleSave = async () => {
    if (!moduleType) return
    setLoading(true)

    try {
      const aiContextTemplate = contextTemplateItems.length > 0
        ? JSON.stringify(contextTemplateItems)
        : null

      const response = await authFetch(`/api/module-types/${moduleType.id}`, {
        method: 'PUT',
        body: {
          ...moduleType,
          aiContextTemplate: aiContextTemplate
        }
      })

      const result = await response.json()

      if (result.code === 200) {
        if (showToast) showToast('success', t('aiContextEditor.saveSuccess'))
        setIsOpen(false)
        if (onSave) {
          onSave()
        }
      } else {
        if (showToast) showToast('error', result.message || t('aiContextEditor.saveFailed'))
      }
    } catch (error) {
      console.error('\u4fdd\u5b58 AI \u4e0a\u4e0b\u6587\u6a21\u677f\u5931\u8d25:', error)
      if (showToast) showToast('error', t('aiContextEditor.saveFailedRetry'))
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
      <div className="admin-modal" onClick={e => e.stopPropagation()} style={{ maxWidth: '1000px', maxHeight: '90vh', display: 'flex', flexDirection: 'column' }}>
        <div className="admin-modal-header">
          <h3 className="admin-modal-title" style={{ display: 'flex', alignItems: 'center', gap: '12px' }}>
            <svg style={{ width: '24px', height: '24px', color: '#14b8a6' }} fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
            </svg>
            {t('aiContextEditor.editTitle', { name: moduleType?.name || '' })}
          </h3>
          <button className="admin-modal-close" onClick={handleClose} disabled={loading}>&times;</button>
        </div>

        {/* 说明 */}
        <div style={{ marginBottom: '16px', padding: '12px', background: 'rgba(245, 158, 11, 0.1)', border: '1px solid rgba(245, 158, 11, 0.3)', borderRadius: '8px' }}>
          <p style={{ fontSize: '13px', color: 'rgba(255,255,255,0.7)', margin: 0 }} dangerouslySetInnerHTML={{ __html: t('aiContextEditor.description') }} />
        </div>
        <div style={{ marginBottom: '24px', padding: '12px', background: 'rgba(245, 158, 11, 0.1)', border: '1px solid rgba(245, 158, 11, 0.3)', borderRadius: '8px' }}>
          <p style={{ fontSize: '12px', color: 'rgba(255,255,255,0.6)', margin: 0 }} dangerouslySetInnerHTML={{ __html: t('aiContextEditor.referenceFormat') }} />
        </div>

        {/* 两栏布局 */}
        <div style={{ display: 'flex', gap: '24px', flex: 1, overflow: 'hidden' }}>
          {/* 左侧：字段选择器 */}
          <div style={{ width: '50%', display: 'flex', flexDirection: 'column', overflow: 'hidden', border: '1px solid rgba(13, 148, 136, 0.2)', borderRadius: '8px', padding: '16px' }}>
            <h4 style={{ fontSize: '16px', fontWeight: '600', color: '#fff', marginBottom: '16px' }}>
              {t('aiContextEditor.selectReferenceField')}
            </h4>

            <div className="admin-form-group" style={{ marginBottom: '16px' }}>
              <label className="admin-form-label">{t('aiContextEditor.moduleType')}</label>
              <select
                value={selectedModuleType}
                onChange={(e) => handleModuleTypeSelect(e.target.value)}
                className="admin-form-input"
                style={{ cursor: 'pointer' }}
              >
                <option value="">{t('aiContextEditor.selectModuleType')}</option>
                {allModuleTypes
                  .filter(type => type.id !== moduleType?.id)
                  .map((type) => (
                    <option key={type.id} value={type.id}>
                      {type.name}
                    </option>
                  ))}
              </select>
            </div>

            {selectedModuleType && (
              <div style={{ flex: 1, overflow: 'hidden', display: 'flex', flexDirection: 'column' }}>
                <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: '8px' }}>
                  <span style={{ fontSize: '14px', fontWeight: '500', color: 'rgba(255,255,255,0.8)' }}>
                    {t('aiContextEditor.availableFields')}
                  </span>
                  <button
                    onClick={handleSelectAllFields}
                    style={{ padding: '4px 12px', fontSize: '12px', color: '#14b8a6', background: 'transparent', border: '1px solid #14b8a6', borderRadius: '6px', cursor: 'pointer' }}
                  >
                    {availableFields.length > 0 && availableFields.every(field => selectedFields.includes(field.path))
                      ? t('aiContextEditor.deselectAll') : t('aiContextEditor.selectAll')}
                  </button>
                </div>
                <div style={{ flex: 1, overflow: 'auto', border: '1px solid rgba(13, 148, 136, 0.2)', borderRadius: '8px', padding: '8px', background: 'rgba(0,0,0,0.2)' }}>
                  {availableFields.length === 0 ? (
                    <p style={{ fontSize: '14px', color: 'rgba(255,255,255,0.5)', textAlign: 'center', padding: '16px 0' }}>
                      {t('aiContextEditor.noAvailableFields')}
                    </p>
                  ) : (
                    <div style={{ display: 'flex', flexDirection: 'column', gap: '4px' }}>
                      {availableFields.map((field, index) => (
                        <label
                          key={index}
                          style={{ display: 'flex', alignItems: 'flex-start', padding: '8px', borderRadius: '6px', cursor: 'pointer', background: selectedFields.includes(field.path) ? 'rgba(13, 148, 136, 0.15)' : 'transparent' }}
                        >
                          <input
                            type="checkbox"
                            checked={selectedFields.includes(field.path)}
                            onChange={(e) => {
                              if (e.target.checked) {
                                setSelectedFields([...selectedFields, field.path])
                              } else {
                                setSelectedFields(selectedFields.filter(f => f !== field.path))
                              }
                            }}
                            style={{ marginTop: '2px', marginRight: '8px', width: '16px', height: '16px' }}
                          />
                          <div style={{ flex: 1 }}>
                            <div style={{ fontSize: '14px', fontWeight: '500', color: '#fff' }}>{field.path}</div>
                            {field.description && (
                              <div style={{ fontSize: '12px', color: 'rgba(255,255,255,0.5)', marginTop: '2px' }}>{field.description}</div>
                            )}
                            <div style={{ fontSize: '11px', color: 'rgba(255,255,255,0.4)', marginTop: '2px' }}>
                              {t('aiContextEditor.fieldType')}: {field.type}
                            </div>
                          </div>
                        </label>
                      ))}
                    </div>
                  )}
                </div>

                <button
                  onClick={handleAddFieldReference}
                  disabled={selectedFields.length === 0}
                  className="admin-btn admin-btn-primary"
                  style={{ marginTop: '12px', width: '100%' }}
                >
                  <svg style={{ width: '16px', height: '16px', marginRight: '8px' }} fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 4v16m8-8H4" />
                  </svg>
                  {t('aiContextEditor.addToTemplate')}
                </button>
              </div>
            )}
          </div>

          {/* 右侧：上下文字段列表 */}
          <div style={{ width: '50%', display: 'flex', flexDirection: 'column', overflow: 'hidden' }}>
            <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: '16px' }}>
              <h4 style={{ fontSize: '16px', fontWeight: '600', color: '#fff', margin: 0 }}>
                {t('aiContextEditor.contextFieldList')}
              </h4>
              <button
                onClick={() => setContextTemplateItems([])}
                style={{ padding: '4px 12px', fontSize: '12px', color: '#ef4444', background: 'transparent', border: '1px solid #ef4444', borderRadius: '6px', cursor: 'pointer' }}
              >
                {t('aiContextEditor.clear')}
              </button>
            </div>

            <div style={{ flex: 1, overflow: 'auto', border: '1px solid rgba(13, 148, 136, 0.2)', borderRadius: '8px', padding: '12px', background: 'rgba(0,0,0,0.2)' }}>
              {contextTemplateItems.length === 0 ? (
                <div style={{ textAlign: 'center', padding: '32px 0', color: 'rgba(255,255,255,0.5)' }}>
                  <svg style={{ width: '48px', height: '48px', margin: '0 auto 16px', opacity: 0.5 }} fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1} d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                  </svg>
                  <p style={{ fontSize: '14px', margin: 0 }}>{t('aiContextEditor.noContextFields')}</p>
                  <p style={{ fontSize: '12px', marginTop: '4px' }}>{t('aiContextEditor.useLeftToolHint')}</p>
                </div>
              ) : (
                <div style={{ display: 'flex', flexDirection: 'column', gap: '8px' }}>
                  {contextTemplateItems.map((item, index) => (
                    <div
                      key={index}
                      style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', padding: '12px', background: 'rgba(255,255,255,0.03)', border: '1px solid rgba(13, 148, 136, 0.2)', borderRadius: '8px' }}
                    >
                      <div style={{ flex: 1 }}>
                        <div style={{ display: 'flex', alignItems: 'center', gap: '8px', marginBottom: '4px' }}>
                          <span style={{ padding: '2px 8px', fontSize: '12px', fontWeight: '500', background: 'rgba(13, 148, 136, 0.2)', color: '#14b8a6', borderRadius: '4px' }}>
                            {getModuleTypeNameById(item.moduleTypeId)}
                          </span>
                          <svg style={{ width: '14px', height: '14px', color: 'rgba(255,255,255,0.4)' }} fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
                          </svg>
                          <span style={{ fontSize: '14px', fontFamily: 'monospace', color: '#fff' }}>
                            {item.field}
                          </span>
                        </div>
                        <div style={{ fontSize: '12px', color: 'rgba(255,255,255,0.4)', fontFamily: 'monospace' }}>
                          @{getModuleTypeNameById(item.moduleTypeId)}.{item.field}
                        </div>
                      </div>
                      <button
                        onClick={() => {
                          const newItems = contextTemplateItems.filter((_, i) => i !== index)
                          setContextTemplateItems(newItems)
                        }}
                        style={{ marginLeft: '12px', padding: '4px', background: 'transparent', border: 'none', color: 'rgba(255,255,255,0.4)', cursor: 'pointer' }}
                        title="\u5220\u9664\u6b64\u5b57\u6bb5"
                      >
                        <svg style={{ width: '16px', height: '16px' }} fill="none" stroke="currentColor" viewBox="0 0 24 24">
                          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                        </svg>
                      </button>
                    </div>
                  ))}
                </div>
              )}
            </div>
          </div>
        </div>

        <div style={{ display: 'flex', gap: '12px', justifyContent: 'flex-end', marginTop: '24px', paddingTop: '16px', borderTop: '1px solid rgba(13, 148, 136, 0.2)' }}>
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

AiContextEditor.displayName = 'AiContextEditor'

export default AiContextEditor
