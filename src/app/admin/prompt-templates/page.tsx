'use client'

import { useState, useEffect, useCallback } from 'react'
import { authFetch } from '@/lib/auth-utils'
import { useToast } from '@/hooks/useToast'
import ToastNotification from '@/components/ToastNotification'
import PromptTemplateModal from '@/components/admin/PromptTemplateModal'

const CATEGORIES = [
    { value: '', label: '全部分类' },
    { value: 'comic', label: '漫画' },
    { value: 'novel', label: '小说' },
    { value: 'tweet', label: '推文' },
]

interface PromptTemplate {
    slug: string
    name: string
    category: string
    version: number
    isActive: boolean
    updatedAt: string | null
}

export default function PromptTemplateListPage() {
    const { notification, showToast } = useToast()
    const [templates, setTemplates] = useState<PromptTemplate[]>([])
    const [loading, setLoading] = useState(true)
    const [category, setCategory] = useState('')
    const [showModal, setShowModal] = useState(false)
    const [editingTemplate, setEditingTemplate] = useState<PromptTemplate | null>(null)

    const fetchTemplates = useCallback(async () => {
        try {
            setLoading(true)
            let url = '/api/prompt-templates?activeOnly=false'
            if (category) {
                url += `&category=${encodeURIComponent(category)}`
            }
            const response = await authFetch(url)
            const data = await response.json()
            if (data.code === 200) {
                setTemplates(data.data || [])
            }
        } catch (error) {
            console.error('获取模板列表失败:', error)
            showToast('error', '获取模板列表失败')
        } finally {
            setLoading(false)
        }
    }, [category, showToast])

    useEffect(() => {
        fetchTemplates()
    }, [fetchTemplates])

    const handleCreate = () => {
        setEditingTemplate(null)
        setShowModal(true)
    }

    const handleEdit = (template: PromptTemplate) => {
        setEditingTemplate(template)
        setShowModal(true)
    }

    const handleToggleActive = async (template: PromptTemplate) => {
        try {
            const response = await authFetch(`/api/prompt-templates/${template.slug}`, {
                method: 'PUT',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ is_active: !template.isActive })
            })
            const data = await response.json()
            if (data.code === 200) {
                showToast('success', template.isActive ? '已停用' : '已启用')
                fetchTemplates()
            } else {
                showToast('error', data.message || '操作失败')
            }
        } catch {
            showToast('error', '操作失败')
        }
    }

    const handleDelete = async (template: PromptTemplate) => {
        if (!confirm(`确定要删除模板 "${template.name}" 吗？`)) return
        try {
            const response = await authFetch(`/api/prompt-templates/${template.slug}`, {
                method: 'DELETE'
            })
            const data = await response.json()
            if (data.code === 200) {
                showToast('success', '删除成功')
                fetchTemplates()
            } else {
                showToast('error', data.message || '删除失败')
            }
        } catch {
            showToast('error', '删除失败')
        }
    }

    const handleModalClose = (saved: boolean) => {
        setShowModal(false)
        setEditingTemplate(null)
        if (saved) fetchTemplates()
    }

    const formatDate = (dateStr: string | null) => {
        if (!dateStr) return '-'
        return new Date(dateStr).toLocaleString('zh-CN')
    }

    const getCategoryLabel = (cat: string) => {
        const found = CATEGORIES.find(c => c.value === cat)
        return found ? found.label : cat
    }

    return (
        <div>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '24px' }}>
                <h1 className="admin-page-title" style={{ margin: 0 }}>提示词模板</h1>
                <button className="admin-btn admin-btn-primary" onClick={handleCreate}>
                    新建模板
                </button>
            </div>

            <div className="admin-search-bar" style={{ marginBottom: '20px' }}>
                <select
                    className="admin-form-input"
                    value={category}
                    onChange={(e) => setCategory(e.target.value)}
                    style={{ width: '160px' }}
                >
                    {CATEGORIES.map(cat => (
                        <option key={cat.value} value={cat.value}>{cat.label}</option>
                    ))}
                </select>
            </div>

            {loading ? (
                <div className="admin-loading">
                    <div className="admin-loading-spinner"></div>
                </div>
            ) : (
                <div className="admin-table-container">
                    <table className="admin-table">
                        <thead>
                            <tr>
                                <th>Slug</th>
                                <th>名称</th>
                                <th>分类</th>
                                <th>版本</th>
                                <th>状态</th>
                                <th>更新时间</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            {templates.length > 0 ? (
                                templates.map(t => (
                                    <tr key={t.slug}>
                                        <td><code style={{ fontSize: '12px' }}>{t.slug}</code></td>
                                        <td>{t.name}</td>
                                        <td>{getCategoryLabel(t.category)}</td>
                                        <td>v{t.version}</td>
                                        <td>
                                            <span className={`admin-badge ${t.isActive ? 'admin-badge-success' : 'admin-badge-secondary'}`}>
                                                {t.isActive ? '启用' : '停用'}
                                            </span>
                                        </td>
                                        <td>{formatDate(t.updatedAt)}</td>
                                        <td>
                                            <div style={{ display: 'flex', gap: '8px' }}>
                                                <button
                                                    className="admin-btn admin-btn-secondary admin-btn-sm"
                                                    onClick={() => handleEdit(t)}
                                                >
                                                    编辑
                                                </button>
                                                <button
                                                    className={`admin-btn admin-btn-sm ${t.isActive ? 'admin-btn-warning' : 'admin-btn-success'}`}
                                                    onClick={() => handleToggleActive(t)}
                                                >
                                                    {t.isActive ? '停用' : '启用'}
                                                </button>
                                                <button
                                                    className="admin-btn admin-btn-danger admin-btn-sm"
                                                    onClick={() => handleDelete(t)}
                                                >
                                                    删除
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                ))
                            ) : (
                                <tr>
                                    <td colSpan={7} style={{ textAlign: 'center', color: 'rgba(255,255,255,0.5)' }}>
                                        暂无模板
                                    </td>
                                </tr>
                            )}
                        </tbody>
                    </table>
                </div>
            )}

            {showModal && (
                <PromptTemplateModal
                    template={editingTemplate}
                    onClose={handleModalClose}
                    showToast={showToast}
                />
            )}

            <ToastNotification notification={notification} />
        </div>
    )
}
