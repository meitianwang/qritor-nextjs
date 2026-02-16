'use client'

import { useState, useEffect } from 'react'
import { authFetch } from '@/lib/auth-utils'

interface NovelCreationMethod {
    id: string
    name: string
    description?: string
    novelType?: string
    language?: string
    isPreset?: boolean
}

interface NovelCreationMethodEditModalProps {
    isOpen: boolean
    onClose: () => void
    method: NovelCreationMethod | null
    onSave: () => void
    showToast: (type: string, message: string) => void
}

interface EnumOption {
    value: string
    name: string
}

export default function NovelCreationMethodEditModal({
    isOpen,
    onClose,
    method,
    onSave,
    showToast
}: NovelCreationMethodEditModalProps) {
    const [formData, setFormData] = useState({
        name: '',
        description: '',
        novelType: '',
        language: '',
        templateMethodId: '',
        isPreset: false
    })
    const [loading, setLoading] = useState(false)
    const [presetMethods, setPresetMethods] = useState<NovelCreationMethod[]>([])
    const [novelTypes, setNovelTypes] = useState<EnumOption[]>([])
    const [languages, setLanguages] = useState<EnumOption[]>([])

    useEffect(() => {
        if (isOpen) {
            fetchNovelTypes()
            fetchLanguages()
            if (!method) {
                fetchPresetMethods()
            }
        }
    }, [isOpen, method])

    const fetchNovelTypes = async () => {
        try {
            const response = await authFetch('/api/novel-creation-methods/types')
            const data = await response.json()
            if (data.code === 200) {
                setNovelTypes(data.data || [])
            }
        } catch (error) {
            console.error('获取小说类型失败:', error)
        }
    }

    const fetchLanguages = async () => {
        try {
            const response = await authFetch('/api/novel-creation-methods/languages')
            const data = await response.json()
            if (data.code === 200) {
                setLanguages(data.data || [])
            }
        } catch (error) {
            console.error('获取语言列表失败:', error)
        }
    }

    const fetchPresetMethods = async () => {
        try {
            const response = await authFetch('/api/novel-creation-methods')
            const result = await response.json()
            if (result.code === 200 && result.data) {
                const presets = result.data.filter((m: NovelCreationMethod) => m.isPreset === true)
                setPresetMethods(presets)
            }
        } catch (error) {
            console.error('获取预置创作方法失败:', error)
        }
    }

    useEffect(() => {
        if (isOpen) {
            if (method) {
                setFormData({
                    name: method.name || '',
                    description: method.description || '',
                    novelType: method.novelType || '',
                    language: method.language || '',
                    isPreset: method.isPreset || false,
                    templateMethodId: ''
                })
            } else {
                setFormData({
                    name: '',
                    description: '',
                    novelType: '',
                    language: '',
                    isPreset: false,
                    templateMethodId: ''
                })
            }
        }
    }, [method, isOpen])

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault()

        try {
            setLoading(true)

            const methodData = {
                name: formData.name,
                description: formData.description,
                novelType: formData.novelType || null,
                language: formData.language || null
            }

            let response
            if (method) {
                response = await authFetch(`/api/novel-creation-methods/${method.id}`, {
                    method: 'PUT',
                    body: JSON.stringify(methodData),
                    headers: { 'Content-Type': 'application/json' }
                })
            } else {
                let url = '/api/novel-creation-methods'
                const params = new URLSearchParams()

                if (formData.templateMethodId) {
                    params.append('templateMethodId', formData.templateMethodId)
                }

                if (params.toString()) {
                    url += `?${params.toString()}`
                }

                response = await authFetch(url, {
                    method: 'POST',
                    body: JSON.stringify(methodData),
                    headers: { 'Content-Type': 'application/json' }
                })
            }

            if (response.ok) {
                onSave()
                onClose()
            } else {
                const result = await response.json()
                showToast('error', result.message || '保存失败')
            }
        } catch (error) {
            console.error('Error saving creation method:', error)
            showToast('error', '保存失败')
        } finally {
            setLoading(false)
        }
    }

    if (!isOpen) return null

    return (
        <div className="admin-modal-overlay" onClick={!loading ? onClose : undefined}>
            <div className="admin-modal" onClick={e => e.stopPropagation()} style={{ maxWidth: '600px' }}>
                <div className="admin-modal-header">
                    <h3 className="admin-modal-title">
                        {method ? '编辑小说创作方法' : '新建小说创作方法'}
                    </h3>
                    <button
                        className="admin-modal-close"
                        onClick={onClose}
                        disabled={loading}
                    >
                        &times;
                    </button>
                </div>

                <form onSubmit={handleSubmit}>
                    <div className="admin-form-group">
                        <label className="admin-form-label">
                            名称 <span style={{ color: '#ef4444' }}>*</span>
                        </label>
                        <input
                            type="text"
                            required
                            value={formData.name}
                            onChange={(e) => setFormData({ ...formData, name: e.target.value })}
                            className="admin-form-input"
                            placeholder="例如: 民间灵异故事创作"
                            disabled={loading}
                            autoFocus
                        />
                    </div>

                    <div className="admin-form-group">
                        <label className="admin-form-label">描述</label>
                        <textarea
                            value={formData.description}
                            onChange={(e) => setFormData({ ...formData, description: e.target.value })}
                            className="admin-form-input"
                            placeholder="例如: 为民间灵异故事专门设计的创作方法"
                            disabled={loading}
                            rows={3}
                            style={{ resize: 'vertical', minHeight: '80px' }}
                        />
                    </div>

                    <div className="admin-form-group">
                        <label className="admin-form-label">小说类型</label>
                        <select
                            value={formData.novelType}
                            onChange={(e) => setFormData({ ...formData, novelType: e.target.value })}
                            className="admin-form-input"
                            disabled={loading}
                            style={{ cursor: 'pointer' }}
                        >
                            <option value="">请选择小说类型</option>
                            {novelTypes.map(type => (
                                <option key={type.value} value={type.value}>
                                    {type.name}
                                </option>
                            ))}
                        </select>
                    </div>

                    <div className="admin-form-group">
                        <label className="admin-form-label">语言</label>
                        <select
                            value={formData.language}
                            onChange={(e) => setFormData({ ...formData, language: e.target.value })}
                            className="admin-form-input"
                            disabled={loading}
                            style={{ cursor: 'pointer' }}
                        >
                            <option value="">请选择语言</option>
                            {languages.map(lang => (
                                <option key={lang.value} value={lang.value}>
                                    {lang.name}
                                </option>
                            ))}
                        </select>
                    </div>

                    {!method && (
                        <div className="admin-form-group">
                            <label className="admin-form-label">从预置方法导入</label>
                            <select
                                value={formData.templateMethodId}
                                onChange={(e) => setFormData({ ...formData, templateMethodId: e.target.value })}
                                className="admin-form-input"
                                disabled={loading}
                                style={{ cursor: 'pointer' }}
                            >
                                <option value="">不导入（创建空白方法）</option>
                                {presetMethods.map(preset => (
                                    <option key={preset.id} value={preset.id}>
                                        {preset.name}
                                    </option>
                                ))}
                            </select>
                            <p style={{ marginTop: '8px', fontSize: '12px', color: '#888' }}>
                                选择一个预置创作方法作为模板，将复制其工作流、提示词、知识库和模块类型
                            </p>
                        </div>
                    )}

                    <div style={{ display: 'flex', gap: '12px', justifyContent: 'flex-end', marginTop: '24px' }}>
                        <button
                            type="button"
                            className="admin-btn admin-btn-secondary"
                            onClick={onClose}
                            disabled={loading}
                        >
                            取消
                        </button>
                        <button
                            type="submit"
                            className="admin-btn admin-btn-primary"
                            disabled={loading}
                        >
                            {loading && (
                                <svg className="animate-spin" style={{ width: '16px', height: '16px', marginRight: '4px' }} xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                                    <circle style={{ opacity: 0.25 }} cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4"></circle>
                                    <path style={{ opacity: 0.75 }} fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                                </svg>
                            )}
                            {loading ? '保存中...' : '保存'}
                        </button>
                    </div>
                </form>
            </div>
        </div>
    )
}
