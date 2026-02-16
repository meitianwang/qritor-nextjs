'use client'

import { useState, useEffect, ChangeEvent } from 'react'
import { adminFetch } from '@/lib/admin-utils'

interface VideoGenProvider {
    code: string
    displayName: string
    defaultApiBase: string
    models: string[]
}

// 生视频模型提供商列表
const VIDEO_GEN_PROVIDERS: VideoGenProvider[] = [
    { code: 'runway', displayName: 'Runway Gen-3', defaultApiBase: 'https://api.runwayml.com/v1', models: ['gen-3-alpha', 'gen-2'] },
    { code: 'pika', displayName: 'Pika Labs', defaultApiBase: 'https://api.pika.art/v1', models: ['pika-1.0', 'pika-1.5'] },
    { code: 'kling', displayName: '可灵 (Kling)', defaultApiBase: 'https://api.klingai.com/v1', models: ['kling-v1', 'kling-v1.5'] },
    { code: 'sora', displayName: 'OpenAI Sora', defaultApiBase: 'https://api.openai.com/v1', models: ['sora-1.0'] },
    { code: 'minimax', displayName: 'MiniMax', defaultApiBase: 'https://api.minimax.chat/v1', models: ['video-01'] },
    { code: 'luma', displayName: 'Luma Dream Machine', defaultApiBase: 'https://api.lumalabs.ai/v1', models: ['dream-machine-1.5'] },
    { code: 'stable_video', displayName: 'Stability Video', defaultApiBase: 'https://api.stability.ai/v1', models: ['stable-video-diffusion'] },
    { code: 'vidu', displayName: 'Vidu', defaultApiBase: 'https://api.vidu.io/v1', models: ['vidu-1.0', 'vidu-1.5'] },
]

interface VideoGenConfig {
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
    defaultDuration: number
    maxDuration: number
    supportsAudio: boolean
    displayName?: string
}

interface VideoGenFormData {
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
    defaultDuration: number
    maxDuration: number
    supportsAudio: boolean
}

interface VideoGenConfigModalProps {
    isOpen: boolean
    onClose: () => void
    config: VideoGenConfig | null
    onSave: () => void
    showToast?: (type: string, message: string) => void
}

function VideoGenConfigModal({ isOpen, onClose, config, onSave, showToast }: VideoGenConfigModalProps) {
    const [loading, setLoading] = useState(false)
    const [availableModels, setAvailableModels] = useState<string[]>([])
    const [formData, setFormData] = useState<VideoGenFormData>({
        provider: '', modelName: '', apiBase: '', apiKey: '',
        isDefault: false, enabled: true, creditRate: 1.0,
        defaultWidth: 1280, defaultHeight: 720, maxWidth: 1920, maxHeight: 1080,
        defaultDuration: 5, maxDuration: 60, supportsAudio: false
    })

    useEffect(() => {
        if (isOpen) {
            if (config) {
                setFormData({
                    provider: config.provider || '', modelName: config.modelName || '',
                    apiBase: config.apiBase || '', apiKey: config.apiKey || '',
                    isDefault: config.isDefault || false, enabled: config.enabled !== false,
                    creditRate: config.creditRate ?? 1.0,
                    defaultWidth: config.defaultWidth || 1280, defaultHeight: config.defaultHeight || 720,
                    maxWidth: config.maxWidth || 1920, maxHeight: config.maxHeight || 1080,
                    defaultDuration: config.defaultDuration || 5, maxDuration: config.maxDuration || 60,
                    supportsAudio: config.supportsAudio || false
                })
                const selectedProvider = VIDEO_GEN_PROVIDERS.find(p => p.code === config.provider)
                setAvailableModels(selectedProvider ? selectedProvider.models : [])
            } else {
                setFormData({
                    provider: '', modelName: '', apiBase: '', apiKey: '',
                    isDefault: false, enabled: true, creditRate: 1.0,
                    defaultWidth: 1280, defaultHeight: 720, maxWidth: 1920, maxHeight: 1080,
                    defaultDuration: 5, maxDuration: 60, supportsAudio: false
                })
                setAvailableModels([])
            }
        }
    }, [isOpen, config])


    const handleInputChange = (e: ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
        const target = e.target as HTMLInputElement
        const { name, value, type } = target
        const checked = 'checked' in target ? target.checked : false
        setFormData(prev => ({ ...prev, [name]: type === 'checkbox' ? checked : value }))
    }

    const handleProviderChange = (e: ChangeEvent<HTMLSelectElement>) => {
        const selectedCode = e.target.value
        const selectedProvider = VIDEO_GEN_PROVIDERS.find(p => p.code === selectedCode)
        setAvailableModels(selectedProvider ? selectedProvider.models : [])
        setFormData(prev => ({
            ...prev, provider: selectedCode,
            apiBase: selectedProvider ? selectedProvider.defaultApiBase : '',
            modelName: ''
        }))
    }

    const handleSave = async () => {
        try {
            setLoading(true)
            const url = config ? `/api/admin/video-gen-configs/${config.id}` : `/api/admin/video-gen-configs`
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
            console.error('保存生视频模型配置失败:', error)
            if (showToast) showToast('error', '保存失败，请重试')
        } finally {
            setLoading(false)
        }
    }

    if (!isOpen) return null

    return (
        <div className="admin-modal-overlay">
            <div className="admin-modal" style={{ maxWidth: '640px' }}>
                <div className="admin-modal-header">
                    <h2 className="admin-modal-title" style={{ display: 'flex', alignItems: 'center', gap: '12px' }}>
                        <svg style={{ width: '24px', height: '24px', color: '#f59e0b' }} fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M15 10l4.553-2.276A1 1 0 0121 8.618v6.764a1 1 0 01-1.447.894L15 14M5 18h8a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v8a2 2 0 002 2z" />
                        </svg>
                        {config ? '编辑生视频模型配置' : '添加生视频模型配置'}
                    </h2>
                    <button className="admin-modal-close" onClick={onClose}>&times;</button>
                </div>

                <p style={{ color: 'rgba(255,255,255,0.5)', fontSize: '0.9rem', marginBottom: '24px' }}>
                    {config ? '修改现有的视频生成模型配置' : '添加新的视频生成模型配置'}
                </p>

                <div className="admin-form-group">
                    <label className="admin-form-label">提供商 <span style={{ color: '#f59e0b' }}>*</span></label>
                    <select name="provider" value={formData.provider} onChange={handleProviderChange} className="admin-form-select">
                        <option value="">请选择提供商</option>
                        {VIDEO_GEN_PROVIDERS.map(provider => (
                            <option key={provider.code} value={provider.code}>{provider.displayName}</option>
                        ))}
                    </select>
                </div>

                <div className="admin-form-group">
                    <label className="admin-form-label">模型名称 <span style={{ color: '#f59e0b' }}>*</span></label>
                    <select name="modelName" value={formData.modelName} onChange={handleInputChange} className="admin-form-select" disabled={!formData.provider || availableModels.length === 0}>
                        <option value="">请选择模型</option>
                        {availableModels.map(model => (<option key={model} value={model}>{model}</option>))}
                    </select>
                </div>

                <div className="admin-form-group">
                    <label className="admin-form-label">API Base</label>
                    <input type="text" name="apiBase" value={formData.apiBase} onChange={handleInputChange} className="admin-form-input" placeholder="API 基础地址 (可选)" />
                </div>

                <div className="admin-form-group">
                    <label className="admin-form-label">API Key <span style={{ color: '#f59e0b' }}>*</span></label>
                    <input type="password" name="apiKey" value={formData.apiKey} onChange={handleInputChange} className="admin-form-input" placeholder="API 密钥" />
                </div>

                {/* 视频尺寸配置 */}
                <div style={{ paddingTop: '20px', borderTop: '1px solid rgba(245, 158, 11, 0.2)', marginTop: '20px' }}>
                    <h3 style={{ color: '#fff', fontSize: '0.9rem', fontWeight: '500', marginBottom: '16px', display: 'flex', alignItems: 'center', gap: '8px' }}>
                        <svg style={{ width: '16px', height: '16px', color: '#f59e0b' }} fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M4 8V4m0 0h4M4 4l5 5m11-1V4m0 0h-4m4 0l-5 5M4 16v4m0 0h4m-4 0l5-5m11 5l-5-5m5 5v-4m0 4h-4" />
                        </svg>
                        视频尺寸
                    </h3>
                    <div style={{ display: 'grid', gridTemplateColumns: 'repeat(2, 1fr)', gap: '16px' }}>
                        <div className="admin-form-group" style={{ marginBottom: 0 }}>
                            <label className="admin-form-label">默认宽度</label>
                            <input type="number" name="defaultWidth" value={formData.defaultWidth} onChange={handleInputChange} className="admin-form-input" placeholder="1280" />
                        </div>
                        <div className="admin-form-group" style={{ marginBottom: 0 }}>
                            <label className="admin-form-label">默认高度</label>
                            <input type="number" name="defaultHeight" value={formData.defaultHeight} onChange={handleInputChange} className="admin-form-input" placeholder="720" />
                        </div>
                        <div className="admin-form-group" style={{ marginBottom: 0 }}>
                            <label className="admin-form-label">最大宽度</label>
                            <input type="number" name="maxWidth" value={formData.maxWidth} onChange={handleInputChange} className="admin-form-input" placeholder="1920" />
                        </div>
                        <div className="admin-form-group" style={{ marginBottom: 0 }}>
                            <label className="admin-form-label">最大高度</label>
                            <input type="number" name="maxHeight" value={formData.maxHeight} onChange={handleInputChange} className="admin-form-input" placeholder="1080" />
                        </div>
                    </div>
                </div>

                {/* 时长配置 */}
                <div style={{ paddingTop: '20px', borderTop: '1px solid rgba(245, 158, 11, 0.2)', marginTop: '20px' }}>
                    <h3 style={{ color: '#fff', fontSize: '0.9rem', fontWeight: '500', marginBottom: '16px', display: 'flex', alignItems: 'center', gap: '8px' }}>
                        <svg style={{ width: '16px', height: '16px', color: '#f59e0b' }} fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                        </svg>
                        时长设置
                    </h3>
                    <div style={{ display: 'grid', gridTemplateColumns: 'repeat(2, 1fr)', gap: '16px' }}>
                        <div className="admin-form-group" style={{ marginBottom: 0 }}>
                            <label className="admin-form-label">默认时长（秒）</label>
                            <input type="number" name="defaultDuration" value={formData.defaultDuration} onChange={handleInputChange} className="admin-form-input" placeholder="5" />
                        </div>
                        <div className="admin-form-group" style={{ marginBottom: 0 }}>
                            <label className="admin-form-label">最大时长（秒）</label>
                            <input type="number" name="maxDuration" value={formData.maxDuration} onChange={handleInputChange} className="admin-form-input" placeholder="60" />
                        </div>
                    </div>
                </div>

                {/* 积分与状态 */}
                <div style={{ paddingTop: '20px', borderTop: '1px solid rgba(245, 158, 11, 0.2)', marginTop: '20px' }}>
                    <h3 style={{ color: '#fff', fontSize: '0.9rem', fontWeight: '500', marginBottom: '16px', display: 'flex', alignItems: 'center', gap: '8px' }}>
                        <svg style={{ width: '16px', height: '16px', color: '#f59e0b' }} fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                        </svg>
                        积分与状态
                    </h3>
                    <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: '16px' }}>
                        <div className="admin-form-group" style={{ marginBottom: 0 }}>
                            <label className="admin-form-label">积分倍率</label>
                            <input type="number" name="creditRate" value={formData.creditRate} onChange={handleInputChange} step="0.1" min="0.1" className="admin-form-input" placeholder="1.0" />
                        </div>
                        <div className="admin-form-group" style={{ marginBottom: 0 }}>
                            <label className="admin-form-label">启用</label>
                            <div style={{ display: 'flex', alignItems: 'center', height: '42px' }}>
                                <input type="checkbox" name="enabled" checked={formData.enabled} onChange={handleInputChange} style={{ width: '20px', height: '20px' }} />
                                <span style={{ marginLeft: '8px', color: 'rgba(255,255,255,0.7)' }}>{formData.enabled ? '是' : '否'}</span>
                            </div>
                        </div>
                        <div className="admin-form-group" style={{ marginBottom: 0 }}>
                            <label className="admin-form-label">设为默认</label>
                            <div style={{ display: 'flex', alignItems: 'center', height: '42px' }}>
                                <input type="checkbox" name="isDefault" checked={formData.isDefault} onChange={handleInputChange} style={{ width: '20px', height: '20px' }} />
                                <span style={{ marginLeft: '8px', color: 'rgba(255,255,255,0.7)' }}>{formData.isDefault ? '是' : '否'}</span>
                            </div>
                        </div>
                        <div className="admin-form-group" style={{ marginBottom: 0 }}>
                            <label className="admin-form-label">支持音频</label>
                            <div style={{ display: 'flex', alignItems: 'center', height: '42px' }}>
                                <input type="checkbox" name="supportsAudio" checked={formData.supportsAudio} onChange={handleInputChange} style={{ width: '20px', height: '20px' }} />
                                <span style={{ marginLeft: '8px', color: 'rgba(255,255,255,0.7)' }}>{formData.supportsAudio ? '是' : '否'}</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div style={{ display: 'flex', gap: '12px', justifyContent: 'flex-end', marginTop: '32px' }}>
                    <button className="admin-btn admin-btn-secondary" onClick={onClose}>取消</button>
                    <button className="admin-btn admin-btn-primary" onClick={handleSave} disabled={loading || !formData.provider || !formData.modelName || !formData.apiKey}>
                        {loading ? '保存中...' : '保存'}
                    </button>
                </div>
            </div>
        </div>
    )
}

export default VideoGenConfigModal
