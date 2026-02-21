'use client'

import { useState, useEffect, ChangeEvent } from 'react'
import { adminFetch } from '@/lib/admin-utils'

// 平台枚举（决定使用哪个 SDK）
const PLATFORMS = [
  { key: 'vercel', label: 'Vercel AI Gateway' },
  { key: 'anthropic', label: 'Anthropic' },
  { key: 'google', label: 'Google' },
  { key: 'openai', label: 'OpenAI' },
] as const

type PlatformKey = typeof PLATFORMS[number]['key']

// Provider 枚举（AI 提供商，用于匹配 reasoning 策略）
const PROVIDERS = [
  { key: 'anthropic', label: 'Anthropic' },
  { key: 'google', label: 'Google' },
  { key: 'openai', label: 'OpenAI' },
  { key: 'deepseek', label: 'DeepSeek' },
  { key: 'xai', label: 'xAI' },
  { key: 'moonshotai', label: 'Moonshot AI' },
  { key: 'minimax', label: 'MiniMax' },
  { key: 'zai', label: 'ZAI (智谱)' },
] as const

interface PresetTag {
    key: string
    label: string
}

// 预设标签列表 (key -> 中文显示名)
// 分类：价格、模型能力、写作特点
const PRESET_TAGS: PresetTag[] = [
  // 价格
  { key: 'budget', label: '极致省钱' },
  { key: 'cheap', label: '价格美丽' },
  { key: 'affordable', label: '价格适中' },
  { key: 'premium', label: '价格较高' },
  { key: 'expensive', label: '旗舰价位' },
  // 模型能力
  { key: 'long_context', label: '长上下文' },
  { key: 'fast', label: '速度快' },
  { key: 'limited', label: '资源有限' },
  // 写作特点
  { key: 'creative', label: '创意写作' },
  { key: 'style_stable', label: '文风稳定' },
  { key: 'narrative', label: '长篇叙事' },
  { key: 'character', label: '角色塑造' },
  { key: 'chinese', label: '中文优化' },
]

const MODEL_TIER_OPTIONS = [
  { value: 'economy', label: '经济型' },
  { value: 'standard', label: '标准型' },
  { value: 'advanced', label: '高级型' },
  { value: 'flagship', label: '旗舰型' },
] as const

interface LlmConfig {
    id: number
    modelName: string
    displayName: string
    provider?: string
    platform?: string
    modelTier?: string
    tags: string[]
    isDefault: boolean
    enabled: boolean
    inputPricePerM: number
    outputPricePerM: number
    pricingMultiplier: number
    contextWindow?: number
}

interface LlmFormData {
    modelName: string
    provider: string
    platform: PlatformKey | ''
    displayName: string
    modelTier: string
    tags: string[]
    isDefault: boolean
    enabled: boolean
    inputPricePerM: number
    outputPricePerM: number
    pricingMultiplier: number
    contextWindow: number | ''
}

interface LlmConfigModalProps {
    isOpen: boolean
    onClose: () => void
    config: LlmConfig | null
    onSave: () => void
    apiBasePath?: string
    showToast?: (type: string, message: string) => void
    mode?: 'create' | 'edit'
}

/**
 * LLM 配置弹窗 - 支持创建和编辑模式
 */
function LlmConfigModal({ isOpen, onClose, config, onSave, apiBasePath = '/api', showToast, mode = 'edit' }: LlmConfigModalProps) {
  const isCreate = mode === 'create'
  const [loading, setLoading] = useState(false)
  const [formData, setFormData] = useState<LlmFormData>({
    modelName: '',
    provider: '',
    platform: '',
    displayName: '',
    modelTier: 'economy',
    tags: [],
    isDefault: false,
    enabled: true,
    inputPricePerM: 0.20,
    outputPricePerM: 0.40,
    pricingMultiplier: 1.0,
    contextWindow: ''
  })

  useEffect(() => {
    if (isOpen) {
      if (isCreate) {
        setFormData({
          modelName: '',
          provider: '',
          platform: PLATFORMS[0].key,
          displayName: '',
          modelTier: 'economy',
          tags: [],
          isDefault: false,
          enabled: true,
          inputPricePerM: 0.20,
          outputPricePerM: 0.40,
          pricingMultiplier: 1.0,
          contextWindow: ''
        })
      } else if (config) {
        setFormData({
          modelName: config.modelName,
          provider: config.provider || '',
          platform: (config.platform || '') as PlatformKey | '',
          displayName: config.displayName || '',
          modelTier: config.modelTier || 'economy',
          tags: config.tags || [],
          isDefault: config.isDefault || false,
          enabled: config.enabled !== false,
          inputPricePerM: config.inputPricePerM ?? 0.20,
          outputPricePerM: config.outputPricePerM ?? 0.40,
          pricingMultiplier: config.pricingMultiplier ?? 1.0,
          contextWindow: config.contextWindow || ''
        })
      }
    }
  }, [isOpen, config, isCreate])

  const handleInputChange = (e: ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
    const { name, value } = e.target
    const isCheckbox = e.target instanceof HTMLInputElement && e.target.type === 'checkbox'
    const isNumberInput = e.target instanceof HTMLInputElement && e.target.type === 'number'

    const normalizedValue = (() => {
      if (isCheckbox) return (e.target as HTMLInputElement).checked
      if (isNumberInput) {
        const num = Number(value)
        return Number.isFinite(num) ? num : value
      }
      return value
    })()

    setFormData(prev => ({
      ...prev,
      [name]: normalizedValue
    }))
  }

  const handleSave = async () => {
    if (isCreate) {
      if (!formData.modelName.trim()) {
        showToast?.('error', '请输入模型名称')
        return
      }

      try {
        setLoading(true)
        const response = await adminFetch(`${apiBasePath}/llm-configs`, {
          method: 'POST',
          body: {
            model_name: formData.modelName.trim(),
            provider: formData.provider || undefined,
            platform: formData.platform || undefined,
            display_name: formData.displayName.trim() || undefined,
            model_tier: formData.modelTier || undefined,
            tags: formData.tags,
            is_default: formData.isDefault ? 1 : 0,
            enabled: formData.enabled ? 1 : 0,
            input_price_per_m: formData.inputPricePerM,
            output_price_per_m: formData.outputPricePerM,
            pricing_multiplier: formData.pricingMultiplier,
            context_window: formData.contextWindow || undefined,
          }
        })

        const data = await response.json()
        if (data.code === 200) {
          showToast?.('success', '模型配置添加成功')
          onSave()
          onClose()
        } else {
          showToast?.('error', '添加失败: ' + data.message)
        }
      } catch (error) {
        console.error('创建LLM配置失败:', error)
        showToast?.('error', '添加失败，请重试')
      } finally {
        setLoading(false)
      }
    } else {
      if (!config) return

      try {
        setLoading(true)
        const response = await adminFetch(`${apiBasePath}/llm-configs/${config.id}`, {
          method: 'PUT',
          body: {
            model_name: formData.modelName.trim() || undefined,
            provider: formData.provider || undefined,
            platform: formData.platform || undefined,
            display_name: formData.displayName.trim() || undefined,
            model_tier: formData.modelTier || undefined,
            tags: formData.tags || [],
            is_default: formData.isDefault ? 1 : 0,
            enabled: formData.enabled ? 1 : 0,
            input_price_per_m: Number(formData.inputPricePerM),
            output_price_per_m: Number(formData.outputPricePerM),
            pricing_multiplier: Number(formData.pricingMultiplier),
            context_window: formData.contextWindow || undefined,
          }
        })

        const data = await response.json()
        if (data.code === 200) {
          onSave()
          onClose()
        } else {
          showToast?.('error', '保存失败: ' + data.message)
        }
      } catch (error) {
        console.error('保存LLM配置失败:', error)
        showToast?.('error', '保存失败，请重试')
      } finally {
        setLoading(false)
      }
    }
  }

  if (!isOpen) return null
  if (!isCreate && !config) return null

  return (
    <div className="admin-modal-overlay">
      <div className="admin-modal" style={{ maxWidth: '560px' }}>
        {/* 弹窗头部 */}
        <div className="admin-modal-header">
          <h2 className="admin-modal-title" style={{ display: 'flex', alignItems: 'center', gap: '12px' }}>
            <svg style={{ width: '24px', height: '24px', color: '#a855f7' }} fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M9 3v2m6-2v2M9 19v2m6-2v2M5 9H3m2 6H3m18-6h-2m2 6h-2M7 19h10a2 2 0 002-2V7a2 2 0 00-2-2H7a2 2 0 00-2 2v10a2 2 0 002 2zM9 9h6v6H9V9z" />
            </svg>
            {isCreate ? '添加模型配置' : '编辑模型配置'}
          </h2>
          <button className="admin-modal-close" onClick={onClose}>&times;</button>
        </div>

        {/* 模型名称 / Provider / Platform */}
        <div style={{ display: 'grid', gridTemplateColumns: '2fr 1fr 1fr', gap: '16px', marginBottom: '24px' }}>
          <div className="admin-form-group" style={{ marginBottom: 0 }}>
            <label className="admin-form-label">模型名称 {isCreate && <span style={{ color: '#ef4444' }}>*</span>}</label>
            <input
              type="text"
              name="modelName"
              value={formData.modelName}
              onChange={handleInputChange}
              className="admin-form-input"
              placeholder="例如: claude-sonnet-4.5"
            />
          </div>
          <div className="admin-form-group" style={{ marginBottom: 0 }}>
            <label className="admin-form-label">Provider</label>
            <select
              name="provider"
              value={formData.provider}
              onChange={handleInputChange}
              className="admin-form-input"
            >
              <option value="">--</option>
              {PROVIDERS.map(p => (
                <option key={p.key} value={p.key}>{p.label}</option>
              ))}
            </select>
          </div>
          <div className="admin-form-group" style={{ marginBottom: 0 }}>
            <label className="admin-form-label">Platform {isCreate && <span style={{ color: '#ef4444' }}>*</span>}</label>
            <select
              name="platform"
              value={formData.platform}
              onChange={handleInputChange}
              className="admin-form-input"
            >
              {PLATFORMS.map(p => (
                <option key={p.key} value={p.key}>{p.label}</option>
              ))}
            </select>
          </div>
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
            placeholder={isCreate ? '自定义显示名称 (留空使用模型名称)' : `自定义显示名称 (留空使用 ${config!.modelName})`}
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

        {/* 模型配置区域 */}
        <div style={{ paddingTop: '20px', borderTop: '1px solid rgba(139, 92, 246, 0.2)', marginBottom: '20px' }}>
          <h3 style={{ color: '#fff', fontSize: '0.9rem', fontWeight: '500', marginBottom: '16px', display: 'flex', alignItems: 'center', gap: '8px' }}>
            <svg style={{ width: '16px', height: '16px', color: '#a855f7' }} fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M9 3v2m6-2v2M9 19v2m6-2v2M5 9H3m2 6H3m18-6h-2m2 6h-2M7 19h10a2 2 0 002-2V7a2 2 0 00-2-2H7a2 2 0 00-2 2v10a2 2 0 002 2zM9 9h6v6H9V9z" />
            </svg>
            模型配置
          </h3>
          <div className="admin-form-group">
            <label className="admin-form-label">模型等级</label>
            <div style={{ display: 'flex', gap: '6px', flexWrap: 'wrap' }}>
              {MODEL_TIER_OPTIONS.map(tier => {
                const selected = formData.modelTier === tier.value
                return (
                  <button
                    key={tier.value}
                    type="button"
                    onClick={() => setFormData(prev => ({ ...prev, modelTier: tier.value }))}
                    style={{
                      padding: '6px 14px',
                      borderRadius: '6px',
                      fontSize: '0.85rem',
                      cursor: 'pointer',
                      border: selected ? '1px solid rgba(139, 92, 246, 0.5)' : '1px solid rgba(255,255,255,0.1)',
                      background: selected ? 'rgba(139, 92, 246, 0.3)' : 'rgba(255,255,255,0.05)',
                      color: selected ? '#c4b5fd' : 'rgba(255,255,255,0.6)',
                      transition: 'all 0.2s'
                    }}
                  >
                    {tier.label}
                  </button>
                )
              })}
            </div>
            <p style={{ fontSize: '0.75rem', color: 'rgba(255,255,255,0.4)', marginTop: '8px' }}>
              决定哪些订阅计划的用户可以使用此模型
            </p>
          </div>
          <div className="admin-form-group" style={{ marginBottom: 0 }}>
            <label className="admin-form-label">上下文窗口 (tokens)</label>
            <input
              type="number"
              name="contextWindow"
              value={formData.contextWindow}
              onChange={handleInputChange}
              step="1024"
              min="0"
              className="admin-form-input"
              placeholder="例如: 128000, 200000"
            />
            <p style={{ fontSize: '0.75rem', color: 'rgba(255,255,255,0.4)', marginTop: '8px' }}>
              模型支持的最大上下文长度，留空表示不限制
            </p>
          </div>
        </div>

        {/* 积分配置区域 */}
        <div style={{ paddingTop: '20px', borderTop: '1px solid rgba(139, 92, 246, 0.2)' }}>
          <h3 style={{ color: '#fff', fontSize: '0.9rem', fontWeight: '500', marginBottom: '16px', display: 'flex', alignItems: 'center', gap: '8px' }}>
            <svg style={{ width: '16px', height: '16px', color: '#a855f7' }} fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
            积分配置
          </h3>
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: '16px' }}>
            <div className="admin-form-group" style={{ marginBottom: 0 }}>
              <label className="admin-form-label">输入价格 ($/1M)</label>
              <input
                type="number"
                name="inputPricePerM"
                value={formData.inputPricePerM}
                onChange={handleInputChange}
                step="0.01"
                min="0"
                className="admin-form-input"
                placeholder="0.20"
              />
            </div>
            <div className="admin-form-group" style={{ marginBottom: 0 }}>
              <label className="admin-form-label">输出价格 ($/1M)</label>
              <input
                type="number"
                name="outputPricePerM"
                value={formData.outputPricePerM}
                onChange={handleInputChange}
                step="0.01"
                min="0"
                className="admin-form-input"
                placeholder="0.40"
              />
            </div>
            <div className="admin-form-group" style={{ marginBottom: 0 }}>
              <label className="admin-form-label">展示倍率</label>
              <input
                type="number"
                name="pricingMultiplier"
                value={formData.pricingMultiplier}
                onChange={handleInputChange}
                step="0.1"
                min="0"
                className="admin-form-input"
                placeholder="1.0"
              />
            </div>
          </div>
          <p style={{ fontSize: '0.75rem', color: 'rgba(255,255,255,0.4)', marginTop: '12px' }}>
            积分 = ceil(inputTokens × 输入价格 + outputTokens × 输出价格) / 1M × 200。展示倍率用于模型选择器显示（如 0.3x、1.0x）。
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
            {loading ? (isCreate ? '添加中...' : '保存中...') : (isCreate ? '添加' : '保存')}
          </button>
        </div>
      </div>
    </div>
  )
}

export default LlmConfigModal
