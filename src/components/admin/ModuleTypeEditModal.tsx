'use client'

import React, { useState, forwardRef, useImperativeHandle } from 'react'
import { authFetch } from '@/lib/auth-utils'
import { useTranslation } from '@/hooks/useTranslation'

interface ModuleTypeData {
  id?: number
  name?: string
  description?: string
  temperature?: number
  enableAi?: boolean
  singleton?: boolean
  builtIn?: boolean
  novelCreationMethodId?: number | null
  entityCategory?: string | null
}

interface FormData {
  name: string
  description: string
  temperature: number
  enableAi: boolean
  singleton: boolean
  builtIn: boolean
  novelCreationMethodId: number | null
  entityCategory: string | null
}

interface ModuleTypeEditModalProps {
  onSuccess?: () => void
  showToast?: (type: string, message: string) => void
}

export interface ModuleTypeEditModalRef {
  open: (data?: ModuleTypeData | null) => void
  close: () => void
}

const ModuleTypeEditModal = forwardRef<ModuleTypeEditModalRef, ModuleTypeEditModalProps>(({ onSuccess, showToast }, ref) => {
  const { t } = useTranslation('studio')
  const [isOpen, setIsOpen] = useState(false)
  const [moduleType, setModuleType] = useState<ModuleTypeData | null>(null)
  const [loading, setLoading] = useState(false)
  const [entityCategories, setEntityCategories] = useState<string[]>([])
  const [formData, setFormData] = useState<FormData>({
    name: '',
    description: '',
    temperature: 0.7,
    enableAi: true,
    singleton: false,
    builtIn: false,
    novelCreationMethodId: null,
    entityCategory: null
  })

  const fallbackEntityCategories = ['setting', 'character', 'scene', 'organization', 'prop', 'chapter']

  const getEntityCategoryLabel = (value: string): string => {
    switch (value) {
      case 'character':
        return '\u89d2\u8272'
      case 'scene':
        return '\u573a\u666f'
      case 'organization':
        return '\u7ec4\u7ec7'
      case 'prop':
        return '\u9053\u5177'
      case 'chapter':
        return '\u7ae0\u8282'
      case 'setting':
        return '\u8bbe\u5b9a'
      default:
        return value
    }
  }

  const fetchEntityCategories = async (methodId: number | null) => {
    try {
      // 如果有 methodId，先尝试获取创作方法的 visibleCategories
      if (methodId) {
        try {
          const methodResponse = await authFetch(`/api/novel-creation-methods/${methodId}`)
          const methodData = await methodResponse.json()
          if (methodData.code === 200 && methodData.data?.visibleCategories?.length > 0) {
            setEntityCategories(methodData.data.visibleCategories)
            return
          }
        } catch (e) {
          console.warn('\u83b7\u53d6\u521b\u4f5c\u65b9\u6cd5 visibleCategories \u5931\u8d25:', e)
        }
      }

      // 降级：尝试从 API 获取
      const response = await authFetch('/api/entity-categories')
      const data = await response.json()
      if (data.code === 200 && Array.isArray(data.data) && data.data.length > 0) {
        setEntityCategories(data.data)
      } else {
        setEntityCategories(fallbackEntityCategories)
      }
    } catch (error) {
      console.error('\u83b7\u53d6\u5b9e\u4f53\u5206\u7c7b\u5931\u8d25:', error)
      setEntityCategories(fallbackEntityCategories)
    }
  }

  useImperativeHandle(ref, () => ({
    open: (data: ModuleTypeData | null = null) => {
      // 判断是编辑模式还是新建模式：有 id 表示编辑已有模块类型
      const isEdit = data && data.id
      setModuleType(isEdit ? data : null)

      // 获取 novelCreationMethodId：编辑模式从现有数据获取，新建模式从传入参数获取
      let methodId: number | null = null
      if (data) {
        methodId = data.novelCreationMethodId || null
      }

      fetchEntityCategories(methodId)

      if (isEdit && data) {
        // 编辑模式：从现有数据填充表单
        setFormData({
          name: data.name || '',
          description: data.description || '',
          temperature: data.temperature !== undefined ? data.temperature : 0.7,
          enableAi: data.enableAi !== undefined ? data.enableAi : true,
          singleton: data.singleton || false,
          builtIn: data.builtIn || false,
          novelCreationMethodId: methodId,
          entityCategory: data.entityCategory || null
        })
      } else {
        // 新建模式：使用默认值，但保留传入的 novelCreationMethodId
        setFormData({
          name: '',
          description: '',
          temperature: 0.7,
          enableAi: true,
          singleton: false,
          builtIn: false,
          novelCreationMethodId: methodId,  // 保留传入的 novelCreationMethodId
          entityCategory: null
        })
      }
      setIsOpen(true)
    },
    close: () => {
      setIsOpen(false)
      setModuleType(null)
    }
  }))

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setLoading(true)

    try {
      const url = moduleType
        ? `/api/module-types/${moduleType.id}`
        : '/api/module-types'

      const response = await authFetch(url, {
        method: moduleType ? 'PUT' : 'POST',
        body: formData
      })

      const result = await response.json()

      if (result.code === 200) {
        if (showToast) {
          showToast('success', moduleType ? t('moduleTypeModal.updateSuccess') : t('moduleTypeModal.createSuccess'))
        }
        setIsOpen(false)
        setModuleType(null)
        if (onSuccess) {
          onSuccess()
        }
      } else {
        if (showToast) {
          showToast('error', result.message || t('moduleTypeModal.operationFailed'))
        }
      }
    } catch (error) {
      console.error('\u4fdd\u5b58\u6a21\u5757\u7c7b\u578b\u5931\u8d25:', error)
      if (showToast) {
        showToast('error', t('moduleTypeModal.saveFailed'))
      }
    } finally {
      setLoading(false)
    }
  }

  const handleClose = () => {
    if (!loading) {
      setIsOpen(false)
      setModuleType(null)
    }
  }

  if (!isOpen) return null

  return (
    <div className="admin-modal-overlay" onClick={handleClose}>
      <div className="admin-modal" onClick={e => e.stopPropagation()} style={{ maxWidth: '700px', maxHeight: '90vh', overflow: 'auto' }}>
        <div className="admin-modal-header">
          <h3 className="admin-modal-title" style={{ display: 'flex', alignItems: 'center', gap: '12px' }}>
            <svg style={{ width: '24px', height: '24px', color: '#14b8a6' }} fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M7 21a4 4 0 01-4-4V5a2 2 0 012-2h4a2 2 0 012 2v12a4 4 0 01-4 4zm0 0h12a2 2 0 002-2v-4a2 2 0 00-2-2h-2.343M11 7.343l1.657-1.657a2 2 0 012.828 0l2.829 2.829a2 2 0 010 2.828l-8.486 8.485M7 17h.01" />
            </svg>
            {moduleType ? t('moduleTypeModal.editTitle') : t('moduleTypeModal.createTitle')}
          </h3>
          <button className="admin-modal-close" onClick={handleClose} disabled={loading}>&times;</button>
        </div>

        <form onSubmit={handleSubmit}>
          <div className="admin-form-group">
            <label className="admin-form-label">
              {t('moduleTypeModal.typeName')} <span style={{ color: '#ef4444' }}>*</span>
            </label>
            <input
              type="text"
              value={formData.name}
              onChange={(e) => setFormData({ ...formData, name: e.target.value })}
              className="admin-form-input"
              placeholder={t('moduleTypeModal.typeNamePlaceholder')}
              required
              disabled={loading}
            />
          </div>

          <div className="admin-form-group">
            <label className="admin-form-label">{t('moduleTypeModal.description')}</label>
            <textarea
              value={formData.description}
              onChange={(e) => setFormData({ ...formData, description: e.target.value })}
              className="admin-form-input"
              placeholder={t('moduleTypeModal.descriptionPlaceholder')}
              rows={3}
              disabled={loading}
              style={{ resize: 'vertical' }}
            />
          </div>

          <div className="admin-form-group">
            <label className="admin-form-label">{t('moduleTypeModal.entityCategory', { defaultValue: '\u5b9e\u4f53\u5206\u7c7b' })}</label>
            <select
              value={formData.entityCategory || 'other'}
              onChange={(e) => setFormData({ ...formData, entityCategory: e.target.value })}
              className="admin-form-input"
              disabled={loading}
              style={{ cursor: 'pointer' }}
            >
              {(entityCategories.length > 0 ? entityCategories : fallbackEntityCategories).map((value) => (
                <option key={value} value={value}>
                  {getEntityCategoryLabel(value)}
                </option>
              ))}
            </select>
            <p style={{ marginTop: '8px', fontSize: '12px', color: '#888' }}>
              {t('moduleTypeModal.entityCategoryHelp', { defaultValue: '\u8bbe\u7f6e\u5b9e\u4f53\u5206\u7c7b\u540e\uff0c\u53ef\u7528\u4e8e\u77e5\u8bc6\u56fe\u8c31\u63d0\u53d6\u548c\u5de5\u5177\u9762\u677f\u529f\u80fd' })}
            </p>
          </div>

          <div className="admin-form-group">
            <label className="admin-form-label" style={{ marginBottom: '12px' }}>\u9009\u9879</label>
            <div style={{ display: 'flex', gap: '24px', flexWrap: 'wrap' }}>
              <label style={{ display: 'flex', alignItems: 'center', gap: '8px', color: 'rgba(255,255,255,0.8)', fontSize: '14px', cursor: 'pointer' }}>
                <input
                  type="checkbox"
                  checked={formData.enableAi}
                  onChange={(e) => setFormData({ ...formData, enableAi: e.target.checked })}
                  disabled={loading}
                  style={{ width: '16px', height: '16px' }}
                />
                {t('moduleTypeModal.enableAi')}
              </label>
              <label style={{ display: 'flex', alignItems: 'center', gap: '8px', color: 'rgba(255,255,255,0.8)', fontSize: '14px', cursor: 'pointer' }}>
                <input
                  type="checkbox"
                  checked={formData.singleton}
                  onChange={(e) => setFormData({ ...formData, singleton: e.target.checked })}
                  disabled={loading}
                  style={{ width: '16px', height: '16px' }}
                />
                {t('moduleTypeModal.singleton')}
              </label>
              <label style={{ display: 'flex', alignItems: 'center', gap: '8px', color: 'rgba(255,255,255,0.8)', fontSize: '14px', cursor: 'pointer' }}>
                <input
                  type="checkbox"
                  checked={formData.builtIn}
                  onChange={(e) => setFormData({ ...formData, builtIn: e.target.checked })}
                  disabled={loading}
                  style={{ width: '16px', height: '16px' }}
                />
                {t('moduleTypeModal.builtIn')}
              </label>
            </div>
          </div>

          <div style={{ display: 'flex', gap: '12px', justifyContent: 'flex-end', marginTop: '24px' }}>
            <button
              type="button"
              className="admin-btn admin-btn-secondary"
              onClick={handleClose}
              disabled={loading}
            >
              {t('common.cancel')}
            </button>
            <button
              type="submit"
              className="admin-btn admin-btn-primary"
              disabled={loading}
            >
              {loading ? '\u4fdd\u5b58\u4e2d...' : (moduleType ? t('moduleTypeModal.saveChanges') : t('moduleTypeModal.createNow'))}
            </button>
          </div>
        </form>
      </div>
    </div>
  )
})

ModuleTypeEditModal.displayName = 'ModuleTypeEditModal'

export default ModuleTypeEditModal
