'use client'

import { useState, useEffect, ChangeEvent } from 'react'
import { adminFetch } from '@/lib/admin-utils'

interface ImageGenProvider {
    code: string
    displayName: string
    defaultApiBase: string
    models: string[]
}

// 生图模型提供商列表
const IMAGE_GEN_PROVIDERS: ImageGenProvider[] = [
    { code: 'antigravity', displayName: 'Antigravity (Gemini代理)', defaultApiBase: 'http://127.0.0.1:8045', models: ['gemini-3-pro-image'] },
    { code: 'nanobanana', displayName: 'NanoBanana', defaultApiBase: 'https://api.nanobanana.com/v1', models: ['nanobanana-v1', 'nanobanana-v2'] },
    { code: 'jimeng', displayName: '即梦 (Jimeng)', defaultApiBase: 'https://api.jimeng.ai/v1', models: ['jimeng-xl', 'jimeng-2.0'] },
    { code: 'sora', displayName: 'OpenAI Sora', defaultApiBase: 'https://api.openai.com/v1', models: ['sora-1.0'] },
    { code: 'dalle', displayName: 'DALL·E', defaultApiBase: 'https://api.openai.com/v1', models: ['dall-e-3', 'dall-e-2'] },
    { code: 'midjourney', displayName: 'Midjourney', defaultApiBase: '', models: ['midjourney-v6', 'midjourney-v5'] },
    { code: 'stability', displayName: 'Stability AI', defaultApiBase: 'https://api.stability.ai/v1', models: ['stable-diffusion-xl', 'stable-diffusion-3'] },
    { code: 'flux', displayName: 'Flux', defaultApiBase: '', models: ['flux-pro', 'flux-dev', 'flux-schnell'] },
    { code: 'gemini', displayName: 'Google Gemini', defaultApiBase: 'https://generativelanguage.googleapis.com', models: ['gemini-2.0-flash-exp', 'gemini-pro-vision', 'imagen-3.0-generate-001'] },
]

interface ImageGenConfig {
    id: number
    provider: string
    modelName: string
    apiBase: string
    apiKey: string
    isDefault: boolean
    enabled: boolean
    creditRate: number
    defaultWidth: number
    defaultHeight: number
    maxWidth: number
    maxHeight: number
    supportsStyles: string
    displayName?: string
}

interface ImageGenFormData {
    provider: string
    modelName: string
    apiBase: string
    apiKey: string
    isDefault: boolean
    enabled: boolean
    creditRate: number
    defaultWidth: number
    defaultHeight: number
    maxWidth: number
    maxHeight: number
    supportsStyles: string
}

interface ImageGenConfigModalProps {
    isOpen: boolean
    onClose: () => void
    config: ImageGenConfig | null
    onSave: () => void
    showToast?: (type: string, message: string) => void
}

function ImageGenConfigModal({ isOpen, onClose, config, onSave, showToast }: ImageGenConfigModalProps) {
    const [loading, setLoading] = useState(false)
    const [availableModels, setAvailableModels] = useState<string[]>([])
    const [formData, setFormData] = useState<ImageGenFormData>({
        provider: '',
        modelName: '',
        apiBase: '',
        apiKey: '',
        isDefault: false,
        enabled: true,
        creditRate: 1.0,
        defaultWidth: 1024,
        defaultHeight: 1024,
        maxWidth: 2048,
        maxHeight: 2048,
        supportsStyles: ''
    })

    useEffect(() => {
        if (isOpen) {
            if (config) {
                // 编辑模式
                setFormData({
                    provider: config.provider || '',
                    modelName: config.modelName || '',
                    apiBase: config.apiBase || '',
                    apiKey: config.apiKey || '',
                    isDefault: config.isDefault || false,
                    enabled: config.enabled !== false,
                    creditRate: config.creditRate ?? 1.0,
                    defaultWidth: config.defaultWidth || 1024,
                    defaultHeight: config.defaultHeight || 1024,
                    maxWidth: config.maxWidth || 2048,
                    maxHeight: config.maxHeight || 2048,
                    supportsStyles: config.supportsStyles || ''
                })
                const selectedProvider = IMAGE_GEN_PROVIDERS.find(p => p.code === config.provider)
                setAvailableModels(selectedProvider ? selectedProvider.models : [])
            } else {
                // 添加模式
                setFormData({
                    provider: '',
                    modelName: '',
                    apiBase: '',
                    apiKey: '',
                    isDefault: false,
                    enabled: true,
                    creditRate: 1.0,
                    defaultWidth: 1024,
                    defaultHeight: 1024,
                    maxWidth: 2048,
                    maxHeight: 2048,
                    supportsStyles: ''
                })
                setAvailableModels([])
            }
        }
    }, [isOpen, config])


    const handleInputChange = (e: ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
        const target = e.target as HTMLInputElement
        const { name, value, type } = target
        const checked = 'checked' in target ? target.checked : false
        setFormData(prev => ({
            ...prev,
            [name]: type === 'checkbox' ? checked : value
        }))
    }

    const handleProviderChange = (e: ChangeEvent<HTMLSelectElement>) => {
        const selectedCode = e.target.value
        const selectedProvider = IMAGE_GEN_PROVIDERS.find(p => p.code === selectedCode)

        setAvailableModels(selectedProvider ? selectedProvider.models : [])

        setFormData(prev => ({
            ...prev,
            provider: selectedCode,
            apiBase: selectedProvider ? selectedProvider.defaultApiBase : '',
            modelName: ''
        }))
    }

    const handleSave = async () => {
        try {
            setLoading(true)
            const url = config
                ? `/api/admin/image-gen-configs/${config.id}`
                : `/api/admin/image-gen-configs`

            const response = await adminFetch(url, {
                method: config ? 'PUT' : 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(formData)
            })

            const data = await response.json()
            if (data.code === 200) {
                if (onSave) onSave()
                onClose()
            } else {
                if (showToast) showToast('error', '保存失败: ' + data.message)
            }
        } catch (error) {
            console.error('保存生图模型配置失败:', error)
            if (showToast) showToast('error', '保存失败，请重试')
        } finally {
            setLoading(false)
        }
    }

    if (!isOpen) return null

    return (
        <div className="admin-modal-overlay">
            <div className="admin-modal" style={{ maxWidth: '640px' }}>
                {/* 弹窗头部 */}
                <div className="admin-modal-header">
                    <h2 className="admin-modal-title" style={{ display: 'flex', alignItems: 'center', gap: '12px' }}>
                        <svg style={{ width: '24px', height: '24px', color: '#10b981' }} fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
                        </svg>
                        {config ? '编辑生图模型配置' : '添加生图模型配置'}
                    </h2>
                    <button className="admin-modal-close" onClick={onClose}>&times;</button>
                </div>

                <p style={{ color: 'rgba(255,255,255,0.5)', fontSize: '0.9rem', marginBottom: '24px' }}>
                    {config ? '修改现有的图像生成模型配置' : '添加新的图像生成模型配置'}
                </p>

                {/* 基本配置 */}
                <div className="admin-form-group">
                    <label className="admin-form-label">
                        提供商 <span style={{ color: '#f59e0b' }}>*</span>
                    </label>
                    <select
                        name="provider"
                        value={formData.provider}
                        onChange={handleProviderChange}
                        className="admin-form-select"
                    >
                        <option value="">请选择提供商</option>
                        {IMAGE_GEN_PROVIDERS.map(provider => (
                            <option key={provider.code} value={provider.code}>
                                {provider.displayName}
                            </option>
                        ))}
                    </select>
                </div>

                <div className="admin-form-group">
                    <label className="admin-form-label">
                        模型名称 <span style={{ color: '#f59e0b' }}>*</span>
                    </label>
                    <select
                        name="modelName"
                        value={formData.modelName}
                        onChange={handleInputChange}
                        className="admin-form-select"
                        disabled={!formData.provider || availableModels.length === 0}
                    >
                        <option value="">请选择模型</option>
                        {availableModels.map(model => (
                            <option key={model} value={model}>{model}</option>
                        ))}
                    </select>
                </div>

                <div className="admin-form-group">
                    <label className="admin-form-label">API Base</label>
                    <input
                        type="text"
                        name="apiBase"
                        value={formData.apiBase}
                        onChange={handleInputChange}
                        className="admin-form-input"
                        placeholder="API 基础地址 (可选)"
                    />
                </div>

                <div className="admin-form-group">
                    <label className="admin-form-label">
                        API Key <span style={{ color: '#f59e0b' }}>*</span>
                    </label>
                    <input
                        type="password"
                        name="apiKey"
                        value={formData.apiKey}
                        onChange={handleInputChange}
                        className="admin-form-input"
                        placeholder="API 密钥"
                    />
                </div>

                {/* 图像尺寸配置 */}
                <div style={{ paddingTop: '20px', borderTop: '1px solid rgba(16, 185, 129, 0.2)', marginTop: '20px' }}>
                    <h3 style={{ color: '#fff', fontSize: '0.9rem', fontWeight: '500', marginBottom: '16px', display: 'flex', alignItems: 'center', gap: '8px' }}>
                        <svg style={{ width: '16px', height: '16px', color: '#10b981' }} fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M4 8V4m0 0h4M4 4l5 5m11-1V4m0 0h-4m4 0l-5 5M4 16v4m0 0h4m-4 0l5-5m11 5l-5-5m5 5v-4m0 4h-4" />
                        </svg>
                        图像尺寸
                    </h3>
                    <div style={{ display: 'grid', gridTemplateColumns: 'repeat(2, 1fr)', gap: '16px' }}>
                        <div className="admin-form-group" style={{ marginBottom: 0 }}>
                            <label className="admin-form-label">默认宽度</label>
                            <input
                                type="number"
                                name="defaultWidth"
                                value={formData.defaultWidth}
                                onChange={handleInputChange}
                                className="admin-form-input"
                                placeholder="1024"
                            />
                        </div>
                        <div className="admin-form-group" style={{ marginBottom: 0 }}>
                            <label className="admin-form-label">默认高度</label>
                            <input
                                type="number"
                                name="defaultHeight"
                                value={formData.defaultHeight}
                                onChange={handleInputChange}
                                className="admin-form-input"
                                placeholder="1024"
                            />
                        </div>
                        <div className="admin-form-group" style={{ marginBottom: 0 }}>
                            <label className="admin-form-label">最大宽度</label>
                            <input
                                type="number"
                                name="maxWidth"
                                value={formData.maxWidth}
                                onChange={handleInputChange}
                                className="admin-form-input"
                                placeholder="2048"
                            />
                        </div>
                        <div className="admin-form-group" style={{ marginBottom: 0 }}>
                            <label className="admin-form-label">最大高度</label>
                            <input
                                type="number"
                                name="maxHeight"
                                value={formData.maxHeight}
                                onChange={handleInputChange}
                                className="admin-form-input"
                                placeholder="2048"
                            />
                        </div>
                    </div>
                </div>

                {/* 积分配置 */}
                <div style={{ paddingTop: '20px', borderTop: '1px solid rgba(16, 185, 129, 0.2)', marginTop: '20px' }}>
                    <h3 style={{ color: '#fff', fontSize: '0.9rem', fontWeight: '500', marginBottom: '16px', display: 'flex', alignItems: 'center', gap: '8px' }}>
                        <svg style={{ width: '16px', height: '16px', color: '#10b981' }} fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                        </svg>
                        积分与状态
                    </h3>
                    <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: '16px' }}>
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
                            <label className="admin-form-label">启用</label>
                            <div style={{ display: 'flex', alignItems: 'center', height: '42px' }}>
                                <input
                                    type="checkbox"
                                    name="enabled"
                                    checked={formData.enabled}
                                    onChange={handleInputChange}
                                    style={{ width: '20px', height: '20px' }}
                                />
                                <span style={{ marginLeft: '8px', color: 'rgba(255,255,255,0.7)' }}>
                                    {formData.enabled ? '已启用' : '已禁用'}
                                </span>
                            </div>
                        </div>
                        <div className="admin-form-group" style={{ marginBottom: 0 }}>
                            <label className="admin-form-label">设为默认</label>
                            <div style={{ display: 'flex', alignItems: 'center', height: '42px' }}>
                                <input
                                    type="checkbox"
                                    name="isDefault"
                                    checked={formData.isDefault}
                                    onChange={handleInputChange}
                                    style={{ width: '20px', height: '20px' }}
                                />
                                <span style={{ marginLeft: '8px', color: 'rgba(255,255,255,0.7)' }}>
                                    {formData.isDefault ? '是' : '否'}
                                </span>
                            </div>
                        </div>
                    </div>
                </div>

                {/* 弹窗底部按钮 */}
                <div style={{ display: 'flex', gap: '12px', justifyContent: 'flex-end', marginTop: '32px' }}>
                    <button className="admin-btn admin-btn-secondary" onClick={onClose}>
                        取消
                    </button>
                    <button
                        className="admin-btn admin-btn-primary"
                        onClick={handleSave}
                        disabled={loading || !formData.provider || !formData.modelName || !formData.apiKey}
                    >
                        {loading ? '保存中...' : '保存'}
                    </button>
                </div>
            </div>
        </div>
    )
}

export default ImageGenConfigModal
