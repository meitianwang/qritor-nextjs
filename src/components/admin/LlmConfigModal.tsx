'use client'

import { useState, useEffect, ChangeEvent } from 'react'
import { adminFetch } from '@/lib/admin-utils'

interface PresetTag {
    key: string
    label: string
}

// 预设标签列表 (key -> 中文显示名)
// 分类：模型能力、价格、资源、写作特点
const PRESET_TAGS: PresetTag[] = [
  // 模型能力
  { key: 'long_context', label: '长上下文' },
  { key: 'fast', label: '速度快' },
  { key: 'multimodal', label: '多模态' },
  { key: 'reasoning', label: '推理能力' },
  { key: 'tool_use', label: '工具调用' },
  // 价格
  { key: 'expensive', label: '较贵' },
  { key: 'affordable', label: '价格适中' },
  { key: 'cheap', label: '价格美丽' },
  // 资源
  { key: 'limited', label: '资源有限' },
  { key: 'internal', label: '内部部署' },
  // 写作特点
  { key: 'creative', label: '创意写作' },
  { key: 'style_stable', label: '文风稳定' },
  { key: 'narrative', label: '长篇叙事' },
  { key: 'character', label: '角色塑造' },
  { key: 'dialogue', label: '对话生成' },
  { key: 'chinese', label: '中文优化' },
]

interface LlmConfig {
    id: number
    modelName: string
    displayName: string
    ownedBy?: string
    tags: string[]
    isDefault: boolean
    enabled: boolean
    creditRate: number
    normalizationFactor: number
}

interface LlmFormData {
    displayName: string
    tags: string[]
    isDefault: boolean
    enabled: boolean
    creditRate: number
    normalizationFactor: number
}

interface LlmConfigModalProps {
    isOpen: boolean
    onClose: () => void
    config: LlmConfig | null
    onSave: () => void
    apiBasePath?: string
    showToast?: (type: string, message: string) => void
}

/**
 * LLM 配置编辑弹窗 - Proxy 模式
 * 只编辑展示名称、标签、计费等级等，模型列表从 proxy 同步
 */
function LlmConfigModal({ isOpen, onClose, config, onSave, apiBasePath = '/api', showToast }: LlmConfigModalProps) {
  const [loading, setLoading] = useState(false)
  const [formData, setFormData] = useState<LlmFormData>({
    displayName: '',
    tags: [],
    isDefault: false,
    enabled: true,
    creditRate: 1.0,
    normalizationFactor: 1.0
  })

  useEffect(() => {
    if (isOpen && config) {
      setFormData({
        displayName: config.displayName || '',
        tags: config.tags || [],
        isDefault: config.isDefault || false,
        enabled: config.enabled !== false,
        creditRate: config.creditRate ?? 1.0,
        normalizationFactor: config.normalizationFactor ?? 1.0
      })
    }
  }, [isOpen, config])

  const handleInputChange = (e: ChangeEvent<HTMLInputElement>) => {
    const { name, value, type, checked } = e.target
    setFormData(prev => ({
      ...prev,
      [name]: type === 'checkbox' ? checked : value
    }))
  }

  const handleSave = async () => {
    if (!config) return

    try {
      setLoading(true)
      const response = await adminFetch(`${apiBasePath}/llm-configs/${config.id}`, {
        method: 'PUT',
        body: formData
      })

      const data = await response.json()
      if (data.code === 200) {
        if (onSave) {
          onSave()
        }
        onClose()
      } else {
        if (showToast) {
          showToast('error', '保存失败: ' + data.message)
        }
      }
    } catch (error) {
      console.error('保存LLM配置失败:', error)
      if (showToast) {
        showToast('error', '保存失败，请重试')
      }
    } finally {
      setLoading(false)
    }
  }

  if (!isOpen || !config) return null

  return (
    <div className="admin-modal-overlay">
      <div className="admin-modal" style={{ maxWidth: '560px' }}>
        {/* 弹窗头部 */}
        <div className="admin-modal-header">
          <h2 className="admin-modal-title" style={{ display: 'flex', alignItems: 'center', gap: '12px' }}>
            <svg style={{ width: '24px', height: '24px', color: '#a855f7' }} fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M9 3v2m6-2v2M9 19v2m6-2v2M5 9H3m2 6H3m18-6h-2m2 6h-2M7 19h10a2 2 0 002-2V7a2 2 0 00-2-2H7a2 2 0 00-2 2v10a2 2 0 002 2zM9 9h6v6H9V9z" />
            </svg>
            编辑模型配置
          </h2>
          <button className="admin-modal-close" onClick={onClose}>&times;</button>
        </div>

        {/* 模型信息（只读） */}
        <div style={{ background: 'rgba(139, 92, 246, 0.1)', borderRadius: '8px', padding: '16px', marginBottom: '24px' }}>
          <div style={{ display: 'flex', alignItems: 'center', gap: '12px', marginBottom: '8px' }}>
            <span style={{ color: '#a855f7', fontWeight: '600', fontSize: '1.1rem' }}>{config.modelName}</span>
            {config.ownedBy && (
              <span style={{ fontSize: '0.75rem', color: 'rgba(255,255,255,0.5)', background: 'rgba(255,255,255,0.1)', padding: '2px 8px', borderRadius: '4px' }}>
                {config.ownedBy}
              </span>
            )}
          </div>
          <p style={{ fontSize: '0.8rem', color: 'rgba(255,255,255,0.4)', margin: 0 }}>
            模型 ID 由 Proxy 同步，不可修改。可编辑展示名称和计费参数。
          </p>
        </div>

        {/* 表单内容 */}
        <div className="admin-form-group">
          <label className="admin-form-label">显示名称</label>
          <input
            type="text"
            name="displayName"
            value={formData.displayName}
            onChange={handleInputChange}
            className="admin-form-input"
            placeholder={`自定义显示名称 (留空使用 ${config.modelName})`}
          />
        </div>

        <div className="admin-form-group">
          <label className="admin-form-label">标签</label>
          <div style={{ display: 'flex', flexWrap: 'wrap', gap: '8px' }}>
            {PRESET_TAGS.map((tag) => {
              const isSelected = formData.tags.includes(tag.key)
              return (
                <button
                  key={tag.key}
                  type="button"
                  onClick={() => {
                    setFormData(prev => ({
                      ...prev,
                      tags: isSelected
                        ? prev.tags.filter(t => t !== tag.key)
                        : [...prev.tags, tag.key]
                    }))
                  }}
                  style={{
                    display: 'inline-flex',
                    alignItems: 'center',
                    gap: '4px',
                    padding: '6px 12px',
                    background: isSelected ? 'rgba(139, 92, 246, 0.3)' : 'rgba(255,255,255,0.05)',
                    border: isSelected ? '1px solid rgba(139, 92, 246, 0.5)' : '1px solid rgba(255,255,255,0.1)',
                    borderRadius: '6px',
                    fontSize: '0.85rem',
                    color: isSelected ? '#c4b5fd' : 'rgba(255,255,255,0.6)',
                    cursor: 'pointer',
                    transition: 'all 0.2s'
                  }}
                >
                  {isSelected && (
                    <svg style={{ width: '12px', height: '12px' }} fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M5 13l4 4L19 7" />
                    </svg>
                  )}
                  {tag.label}
                </button>
              )
            })}
          </div>
        </div>

        {/* 开关选项 */}
        <div style={{ display: 'flex', gap: '24px', marginBottom: '20px' }}>
          <label style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer' }}>
            <input
              type="checkbox"
              name="enabled"
              checked={formData.enabled}
              onChange={handleInputChange}
              style={{ width: '18px', height: '18px' }}
            />
            <span style={{ color: 'rgba(255,255,255,0.8)' }}>启用</span>
          </label>
          <label style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer' }}>
            <input
              type="checkbox"
              name="isDefault"
              checked={formData.isDefault}
              onChange={handleInputChange}
              style={{ width: '18px', height: '18px' }}
            />
            <span style={{ color: 'rgba(255,255,255,0.8)' }}>设为默认</span>
          </label>
        </div>

        {/* 积分配置区域 */}
        <div style={{ paddingTop: '20px', borderTop: '1px solid rgba(139, 92, 246, 0.2)' }}>
          <h3 style={{ color: '#fff', fontSize: '0.9rem', fontWeight: '500', marginBottom: '16px', display: 'flex', alignItems: 'center', gap: '8px' }}>
            <svg style={{ width: '16px', height: '16px', color: '#a855f7' }} fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
            积分配置
          </h3>
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(2, 1fr)', gap: '16px' }}>
            <div className="admin-form-group" style={{ marginBottom: 0 }}>
              <label className="admin-form-label">积分倍率</label>
              <input
                type="number"
                name="creditRate"
                value={formData.creditRate}
                onChange={handleInputChange}
                step="0.1"
                min="0.1"
                className="admin-form-input"
                placeholder="1.0"
              />
            </div>
            <div className="admin-form-group" style={{ marginBottom: 0 }}>
              <label className="admin-form-label">归一化系数</label>
              <input
                type="number"
                name="normalizationFactor"
                value={formData.normalizationFactor}
                onChange={handleInputChange}
                step="0.1"
                min="0.1"
                className="admin-form-input"
                placeholder="1.0"
              />
            </div>
          </div>
          <p style={{ fontSize: '0.75rem', color: 'rgba(255,255,255,0.4)', marginTop: '12px' }}>
            积分消耗公式：(输入Token + 输出Token) x 归一化系数 x 倍率
          </p>
        </div>

        {/* 弹窗底部按钮 */}
        <div style={{ display: 'flex', gap: '12px', justifyContent: 'flex-end', marginTop: '32px' }}>
          <button className="admin-btn admin-btn-secondary" onClick={onClose}>
            取消
          </button>
          <button
            className="admin-btn admin-btn-primary"
            onClick={handleSave}
            disabled={loading}
          >
            {loading ? '保存中...' : '保存'}
          </button>
        </div>
      </div>
    </div>
  )
}

export default LlmConfigModal
