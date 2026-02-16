'use client'

import { useState, useEffect } from 'react'
import { authFetch } from '@/lib/auth-utils'

const CATEGORIES = [
    { value: 'comic', label: '漫画' },
    { value: 'novel', label: '小说' },
    { value: 'tweet', label: '推文' },
]

interface PromptTemplateModalProps {
    template: {
        slug: string
        name: string
        category: string
        isActive: boolean
    } | null
    onClose: (saved: boolean) => void
    showToast: (type: string, message: string) => void
}

interface FormData {
    slug: string
    name: string
    category: string
    content: string
    variables: string[]
    is_active: boolean
}

export default function PromptTemplateModal({ template, onClose, showToast }: PromptTemplateModalProps) {
    const isEdit = !!template
    const [loading, setLoading] = useState(false)
    const [loadingDetail, setLoadingDetail] = useState(false)
    const [form, setForm] = useState<FormData>({
        slug: '',
        name: '',
        category: 'comic',
        content: '',
        variables: [],
        is_active: true
    })
    const [variableInput, setVariableInput] = useState('')

    useEffect(() => {
        if (isEdit) {
            loadTemplateDetail()
        }
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [template])

    const loadTemplateDetail = async () => {
        if (!template) return
        setLoadingDetail(true)
        try {
            const response = await authFetch(`/api/prompt-templates/${template.slug}`)
            const data = await response.json()
            if (data.code === 200) {
                const t = data.data
                let vars = t.variables || []
                if (typeof vars === 'string') {
                    try { vars = JSON.parse(vars) } catch { vars = [] }
                }
                setForm({
                    slug: t.slug,
                    name: t.name,
                    category: t.category,
                    content: t.content || '',
                    variables: vars,
                    is_active: t.isActive
                })
            }
        } catch {
            showToast('error', '加载模板详情失败')
        } finally {
            setLoadingDetail(false)
        }
    }

    const handleChange = (field: keyof FormData, value: string | boolean | string[]) => {
        setForm(prev => ({ ...prev, [field]: value }))
    }

    const handleAddVariable = () => {
        const v = variableInput.trim()
        if (v && !form.variables.includes(v)) {
            setForm(prev => ({ ...prev, variables: [...prev.variables, v] }))
            setVariableInput('')
        }
    }

    const handleRemoveVariable = (v: string) => {
        setForm(prev => ({ ...prev, variables: prev.variables.filter(x => x !== v) }))
    }

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault()
        if (!form.slug || !form.name || !form.content) {
            showToast('error', '请填写必填字段')
            return
        }

        setLoading(true)
        try {
            const url = isEdit ? `/api/prompt-templates/${template!.slug}` : '/api/prompt-templates'
            const method = isEdit ? 'PUT' : 'POST'
            const payload = {
                ...form,
                variables: JSON.stringify(form.variables)
            }
            const response = await authFetch(url, {
                method,
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(payload)
            })
            const data = await response.json()
            if (data.code === 200) {
                showToast('success', isEdit ? '更新成功' : '创建成功')
                onClose(true)
            } else {
                showToast('error', data.message || '操作失败')
            }
        } catch {
            showToast('error', '操作失败')
        } finally {
            setLoading(false)
        }
    }

    const extractVariables = () => {
        const matches = form.content.match(/\{\{(\w+)\}\}/g) || []
        const vars = [...new Set(matches.map(m => m.replace(/\{\{|\}\}/g, '')))]
        setForm(prev => ({ ...prev, variables: vars }))
        showToast('success', `提取到 ${vars.length} 个变量`)
    }

    return (
        <div
            className="admin-modal-overlay"
            onClick={() => onClose(false)}
            style={{
                position: 'fixed',
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                background: 'rgba(0, 0, 0, 0.7)',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                zIndex: 1000
            }}
        >
            <div
                onClick={e => e.stopPropagation()}
                style={{
                    background: 'var(--admin-bg-secondary, #1a1a2e)',
                    borderRadius: '12px',
                    padding: '24px',
                    maxWidth: '800px',
                    width: '90%',
                    maxHeight: '90vh',
                    overflow: 'auto',
                    border: '1px solid rgba(255, 255, 255, 0.1)'
                }}
            >
                <h2 style={{ margin: '0 0 20px 0', color: '#fff' }}>
                    {isEdit ? '编辑模板' : '新建模板'}
                </h2>

                {loadingDetail ? (
                    <div className="admin-loading" style={{ minHeight: '200px' }}>
                        <div className="admin-loading-spinner"></div>
                    </div>
                ) : (
                    <form onSubmit={handleSubmit}>
                        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '16px', marginBottom: '16px' }}>
                            <div>
                                <label className="admin-form-label">Slug *</label>
                                <input
                                    type="text"
                                    className="admin-form-input"
                                    value={form.slug}
                                    onChange={e => handleChange('slug', e.target.value)}
                                    placeholder="comic-script-generation"
                                    disabled={isEdit}
                                    style={{ width: '100%' }}
                                />
                            </div>
                            <div>
                                <label className="admin-form-label">名称 *</label>
                                <input
                                    type="text"
                                    className="admin-form-input"
                                    value={form.name}
                                    onChange={e => handleChange('name', e.target.value)}
                                    placeholder="漫画分镜脚本生成"
                                    style={{ width: '100%' }}
                                />
                            </div>
                        </div>

                        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '16px', marginBottom: '16px' }}>
                            <div>
                                <label className="admin-form-label">分类</label>
                                <select
                                    className="admin-form-input"
                                    value={form.category}
                                    onChange={e => handleChange('category', e.target.value)}
                                    style={{ width: '100%' }}
                                >
                                    {CATEGORIES.map(cat => (
                                        <option key={cat.value} value={cat.value}>{cat.label}</option>
                                    ))}
                                </select>
                            </div>
                            <div>
                                <label className="admin-form-label">状态</label>
                                <select
                                    className="admin-form-input"
                                    value={form.is_active ? 'true' : 'false'}
                                    onChange={e => handleChange('is_active', e.target.value === 'true')}
                                    style={{ width: '100%' }}
                                >
                                    <option value="true">启用</option>
                                    <option value="false">停用</option>
                                </select>
                            </div>
                        </div>

                        <div style={{ marginBottom: '16px' }}>
                            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                                <label className="admin-form-label">模板内容 *</label>
                                <button
                                    type="button"
                                    className="admin-btn admin-btn-secondary admin-btn-sm"
                                    onClick={extractVariables}
                                >
                                    提取变量
                                </button>
                            </div>
                            <textarea
                                className="admin-form-input"
                                value={form.content}
                                onChange={e => handleChange('content', e.target.value)}
                                placeholder="使用 {{variable_name}} 格式定义变量..."
                                rows={12}
                                style={{ width: '100%', fontFamily: 'monospace', fontSize: '13px' }}
                            />
                        </div>

                        <div style={{ marginBottom: '24px' }}>
                            <label className="admin-form-label">变量列表</label>
                            <div style={{ display: 'flex', gap: '8px', marginBottom: '8px' }}>
                                <input
                                    type="text"
                                    className="admin-form-input"
                                    value={variableInput}
                                    onChange={e => setVariableInput(e.target.value)}
                                    placeholder="添加变量名"
                                    onKeyDown={e => {
                                        if (e.key === 'Enter') {
                                            e.preventDefault()
                                            handleAddVariable()
                                        }
                                    }}
                                    style={{ flex: 1 }}
                                />
                                <button
                                    type="button"
                                    className="admin-btn admin-btn-secondary"
                                    onClick={handleAddVariable}
                                >
                                    添加
                                </button>
                            </div>
                            <div style={{ display: 'flex', flexWrap: 'wrap', gap: '8px' }}>
                                {form.variables.map(v => (
                                    <span
                                        key={v}
                                        style={{
                                            background: 'rgba(99, 102, 241, 0.2)',
                                            color: '#818cf8',
                                            padding: '4px 10px',
                                            borderRadius: '4px',
                                            fontSize: '13px',
                                            display: 'flex',
                                            alignItems: 'center',
                                            gap: '6px'
                                        }}
                                    >
                                        {`{{${v}}}`}
                                        <button
                                            type="button"
                                            onClick={() => handleRemoveVariable(v)}
                                            style={{
                                                background: 'none',
                                                border: 'none',
                                                color: '#818cf8',
                                                cursor: 'pointer',
                                                padding: 0,
                                                fontSize: '16px',
                                                lineHeight: 1
                                            }}
                                        >
                                            &times;
                                        </button>
                                    </span>
                                ))}
                                {form.variables.length === 0 && (
                                    <span style={{ color: 'rgba(255,255,255,0.4)', fontSize: '13px' }}>
                                        暂无变量
                                    </span>
                                )}
                            </div>
                        </div>

                        <div style={{ display: 'flex', gap: '12px', justifyContent: 'flex-end' }}>
                            <button
                                type="button"
                                className="admin-btn admin-btn-secondary"
                                onClick={() => onClose(false)}
                                disabled={loading}
                            >
                                取消
                            </button>
                            <button
                                type="submit"
                                className="admin-btn admin-btn-primary"
                                disabled={loading}
                            >
                                {loading ? '保存中...' : '保存'}
                            </button>
                        </div>
                    </form>
                )}
            </div>
        </div>
    )
}
