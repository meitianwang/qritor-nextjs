'use client'

import { useState, useEffect, FormEvent } from 'react'
import { adminFetch } from '@/lib/admin-utils'
import { useToast } from '@/hooks/useToast'
import ToastNotification from '@/components/ToastNotification'
import ConfirmModal from '@/components/admin/ConfirmModal'

interface SupportedLanguage {
    code: string
    name: string
    flag: string
}

// 支持的语言列表
const SUPPORTED_LANGUAGES: SupportedLanguage[] = [
    { code: 'zh', name: '简体中文', flag: '\u{1F1E8}\u{1F1F3}' },
    { code: 'zh-TW', name: '繁體中文', flag: '\u{1F1F9}\u{1F1FC}' },
    { code: 'en', name: 'English', flag: '\u{1F1FA}\u{1F1F8}' },
    { code: 'de', name: 'Deutsch', flag: '\u{1F1E9}\u{1F1EA}' },
    { code: 'fr', name: 'Fran\u00e7ais', flag: '\u{1F1EB}\u{1F1F7}' },
    { code: 'ja', name: '日本語', flag: '\u{1F1EF}\u{1F1F5}' },
    { code: 'ko', name: '한국어', flag: '\u{1F1F0}\u{1F1F7}' },
    { code: 'es', name: 'Espa\u00f1ol', flag: '\u{1F1EA}\u{1F1F8}' },
    { code: 'pt', name: 'Portugu\u00eas', flag: '\u{1F1E7}\u{1F1F7}' },
    { code: 'ar', name: '\u0627\u0644\u0639\u0631\u0628\u064A\u0629', flag: '\u{1F1F8}\u{1F1E6}' },
    { code: 'ru', name: '\u0420\u0443\u0441\u0441\u043A\u0438\u0439', flag: '\u{1F1F7}\u{1F1FA}' },
    { code: 'hi', name: '\u0939\u093F\u0928\u094D\u0926\u0940', flag: '\u{1F1EE}\u{1F1F3}' }
]

interface Plan {
    id: number
    name: string
    displayName: string
    price: number
    monthlyCredits: number
    maxProjects: number
    description?: string
    descriptionEn?: string
    features?: string
    featuresEn?: string
    descriptions: Record<string, string>
    featuresI18n: Record<string, string>
    isActive: boolean
}

interface BoostPack {
    id: number
    name: string
    displayName: string
    price: number
    credits: number
    validDays: number
    isActive: boolean
}

interface PlanFormData {
    id?: number
    name: string
    displayName: string
    price: number
    monthlyCredits: number
    maxProjects: number
    descriptions: Record<string, string>
    featuresI18n: Record<string, string>
    isActive: boolean
    credits?: number
    validDays?: number
}

/**
 * 后台价格管理页面
 */
export default function PricingPage() {
    const { notification, showToast } = useToast()
    const [plans, setPlans] = useState<Plan[]>([])
    const [boostPacks, setBoostPacks] = useState<BoostPack[]>([])
    const [loading, setLoading] = useState(true)
    const [showModal, setShowModal] = useState(false)
    const [modalType, setModalType] = useState<'plan' | 'boost'>('plan')
    const [modalMode, setModalMode] = useState<'add' | 'edit'>('edit')
    const [formData, setFormData] = useState<PlanFormData>({} as PlanFormData)
    const [deleteConfirmOpen, setDeleteConfirmOpen] = useState(false)
    const [deletingId, setDeletingId] = useState<number | null>(null)
    const [activeTab, setActiveTab] = useState('zh') // 当前激活的语言 Tab

    useEffect(() => {
        fetchData()
    }, [])

    const fetchData = async () => {
        try {
            setLoading(true)

            const [plansRes, packsRes] = await Promise.all([
                adminFetch('/api/admin/pricing/plans'),
                adminFetch('/api/admin/pricing/boost-packs')
            ])

            const plansData = await plansRes.json()
            const packsData = await packsRes.json()

            if (plansData.code === 200) setPlans(plansData.data || [])
            if (packsData.code === 200) setBoostPacks(packsData.data || [])
        } catch (error) {
            console.error('获取价格数据失败:', error)
        } finally {
            setLoading(false)
        }
    }

    const handleAddPlan = () => {
        setModalType('plan')
        setModalMode('add')
        setFormData({
            name: '',
            displayName: '',
            price: 0,
            monthlyCredits: 0,
            maxProjects: 1,
            descriptions: {},
            featuresI18n: {},
            isActive: true
        })
        setActiveTab('zh')
        setShowModal(true)
    }

    const handleEditPlan = (plan: Plan) => {
        setModalType('plan')
        setModalMode('edit')
        // 兼容旧数据：如果没有新字段，从旧字段转换
        const descriptions = plan.descriptions && Object.keys(plan.descriptions).length > 0
            ? plan.descriptions
            : { zh: plan.description || '', en: plan.descriptionEn || '' }
        const featuresI18n = plan.featuresI18n && Object.keys(plan.featuresI18n).length > 0
            ? plan.featuresI18n
            : { zh: plan.features || '[]', en: plan.featuresEn || '[]' }

        setFormData({
            ...plan,
            descriptions,
            featuresI18n
        })
        setActiveTab('zh')
        setShowModal(true)
    }

    const handleEditBoost = (pack: BoostPack) => {
        setModalType('boost')
        setModalMode('edit')
        setFormData({ ...pack } as unknown as PlanFormData)
        setShowModal(true)
    }

    const handleDeleteClick = (id: number) => {
        setDeletingId(id)
        setDeleteConfirmOpen(true)
    }

    const handleDeleteConfirm = async () => {
        if (!deletingId) return

        try {
            const response = await adminFetch(`/api/admin/pricing/plans/${deletingId}`, {
                method: 'DELETE'
            })
            const data = await response.json()
            if (data.code === 200) {
                fetchData()
            } else {
                showToast('error', '删除失败: ' + data.message)
            }
        } catch (error) {
            console.error('删除订阅计划失败:', error)
            showToast('error', '删除失败，请重试')
        }
    }

    const handleDeleteClose = () => {
        setDeleteConfirmOpen(false)
        setDeletingId(null)
    }

    const handleSubmit = async (e: FormEvent) => {
        e.preventDefault()
        try {
            let url: string
            let method: string

            if (modalType === 'plan') {
                if (modalMode === 'add') {
                    url = '/api/admin/pricing/plans'
                    method = 'POST'
                } else {
                    url = `/api/admin/pricing/plans/${formData.id}`
                    method = 'PUT'
                }
            } else {
                url = `/api/admin/pricing/boost-packs/${formData.id}`
                method = 'PUT'
            }

            const response = await adminFetch(url, {
                method,
                body: formData
            })
            const data = await response.json()
            if (data.code === 200) {
                setShowModal(false)
                fetchData()
                showToast('success', '保存成功')
            } else {
                showToast('error', data.message || '操作失败')
            }
        } catch (error) {
            console.error('保存失败:', error)
            showToast('error', '保存失败')
        }
    }

    // 更新多语言描述
    const updateDescription = (langCode: string, value: string) => {
        setFormData(prev => ({
            ...prev,
            descriptions: {
                ...prev.descriptions,
                [langCode]: value
            }
        }))
    }

    // 更新多语言功能列表
    const updateFeatures = (langCode: string, value: string) => {
        setFormData(prev => ({
            ...prev,
            featuresI18n: {
                ...prev.featuresI18n,
                [langCode]: value
            }
        }))
    }

    if (loading) {
        return <div className="admin-loading"><div className="admin-loading-spinner"></div></div>
    }

    return (
        <div>
            <h1 className="admin-page-title">价格管理</h1>

            {/* 订阅计划 */}
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', margin: '32px 0 16px' }}>
                <h2 style={{ color: '#fff', fontSize: '1.25rem', margin: 0 }}>订阅计划</h2>
                <button className="admin-btn admin-btn-primary" onClick={handleAddPlan}>
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" style={{ width: '16px', height: '16px' }}>
                        <path strokeLinecap="round" strokeLinejoin="round" d="M12 4v16m8-8H4" />
                    </svg>
                    添加订阅计划
                </button>
            </div>
            <div className="admin-table-container">
                <table className="admin-table">
                    <thead>
                        <tr>
                            <th>名称</th>
                            <th>显示名称</th>
                            <th>价格</th>
                            <th>月积分</th>
                            <th>最大项目数</th>
                            <th>多语言</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        {plans.map(plan => (
                            <tr key={plan.id}>
                                <td>{plan.name}</td>
                                <td>{plan.displayName}</td>
                                <td>${plan.price}</td>
                                <td>{plan.monthlyCredits}</td>
                                <td>{plan.maxProjects === -1 ? '无限' : plan.maxProjects}</td>
                                <td>
                                    {/* 显示已配置的语言数量 */}
                                    <span className="admin-badge admin-badge-info" style={{ fontSize: '11px' }}>
                                        {Object.keys(plan.descriptions || {}).filter(k => plan.descriptions[k]).length} 语言
                                    </span>
                                </td>
                                <td>
                                    <span className={`admin-badge ${plan.isActive ? 'admin-badge-success' : 'admin-badge-danger'}`}>
                                        {plan.isActive ? '启用' : '禁用'}
                                    </span>
                                </td>
                                <td>
                                    <div style={{ display: 'flex', gap: '8px' }}>
                                        <button
                                            className="admin-btn admin-btn-secondary admin-btn-sm"
                                            onClick={() => handleEditPlan(plan)}
                                        >
                                            编辑
                                        </button>
                                        <button
                                            className="admin-btn admin-btn-danger admin-btn-sm"
                                            onClick={() => handleDeleteClick(plan.id)}
                                        >
                                            删除
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>

            {/* 加油包 */}
            <h2 style={{ color: '#fff', fontSize: '1.25rem', margin: '32px 0 16px' }}>加油包</h2>
            <div className="admin-table-container">
                <table className="admin-table">
                    <thead>
                        <tr>
                            <th>名称</th>
                            <th>显示名称</th>
                            <th>价格</th>
                            <th>积分</th>
                            <th>有效期(天)</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        {boostPacks.map(pack => (
                            <tr key={pack.id}>
                                <td>{pack.name}</td>
                                <td>{pack.displayName}</td>
                                <td>${pack.price}</td>
                                <td>{pack.credits}</td>
                                <td>{pack.validDays}</td>
                                <td>
                                    <span className={`admin-badge ${pack.isActive ? 'admin-badge-success' : 'admin-badge-danger'}`}>
                                        {pack.isActive ? '启用' : '禁用'}
                                    </span>
                                </td>
                                <td>
                                    <button
                                        className="admin-btn admin-btn-secondary admin-btn-sm"
                                        onClick={() => handleEditBoost(pack)}
                                    >
                                        编辑
                                    </button>
                                </td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>

            {/* 编辑/新建模态框 */}
            {showModal && (
                <div className="admin-modal-overlay" onClick={() => setShowModal(false)}>
                    <div className="admin-modal" onClick={e => e.stopPropagation()} style={{ maxWidth: '700px' }}>
                        <div className="admin-modal-header">
                            <h3 className="admin-modal-title">
                                {modalMode === 'add'
                                    ? '添加订阅计划'
                                    : (modalType === 'plan' ? '编辑订阅计划' : '编辑加油包')
                                }
                            </h3>
                            <button className="admin-modal-close" onClick={() => setShowModal(false)}>&times;</button>
                        </div>
                        <form onSubmit={handleSubmit}>
                            {modalType === 'plan' && modalMode === 'add' && (
                                <div className="admin-form-group">
                                    <label className="admin-form-label">计划名称（唯一标识）</label>
                                    <input
                                        type="text"
                                        className="admin-form-input"
                                        value={formData.name || ''}
                                        onChange={e => setFormData({ ...formData, name: e.target.value })}
                                        placeholder="例如: STARTER"
                                        required
                                    />
                                </div>
                            )}
                            <div className="admin-form-group">
                                <label className="admin-form-label">显示名称</label>
                                <input
                                    type="text"
                                    className="admin-form-input"
                                    value={formData.displayName || ''}
                                    onChange={e => setFormData({ ...formData, displayName: e.target.value })}
                                    required
                                />
                            </div>
                            <div className="admin-form-group">
                                <label className="admin-form-label">价格 (美元 $)</label>
                                <input
                                    type="number"
                                    step="0.01"
                                    min="0"
                                    className="admin-form-input"
                                    value={formData.price ?? ''}
                                    onChange={e => setFormData({ ...formData, price: parseFloat(e.target.value) || 0 })}
                                    required
                                />
                            </div>
                            {modalType === 'plan' ? (
                                <>
                                    <div className="admin-form-group">
                                        <label className="admin-form-label">月积分</label>
                                        <input
                                            type="number"
                                            min="0"
                                            className="admin-form-input"
                                            value={formData.monthlyCredits ?? ''}
                                            onChange={e => setFormData({ ...formData, monthlyCredits: parseInt(e.target.value) || 0 })}
                                            required
                                        />
                                    </div>
                                    <div className="admin-form-group">
                                        <label className="admin-form-label">最大项目数 (-1 表示无限)</label>
                                        <input
                                            type="number"
                                            className="admin-form-input"
                                            value={formData.maxProjects ?? ''}
                                            onChange={e => setFormData({ ...formData, maxProjects: parseInt(e.target.value) })}
                                            required
                                        />
                                    </div>

                                    {/* 多语言配置区域 */}
                                    <div className="admin-form-group" style={{ marginTop: '24px' }}>
                                        <label className="admin-form-label" style={{ marginBottom: '12px', display: 'block' }}>
                                            多语言配置
                                        </label>

                                        {/* 语言 Tab 切换 */}
                                        <div style={{
                                            display: 'flex',
                                            gap: '4px',
                                            flexWrap: 'wrap',
                                            marginBottom: '16px',
                                            padding: '8px',
                                            background: 'rgba(255,255,255,0.05)',
                                            borderRadius: '8px'
                                        }}>
                                            {SUPPORTED_LANGUAGES.map(lang => {
                                                const hasContent = formData.descriptions?.[lang.code] || formData.featuresI18n?.[lang.code]
                                                return (
                                                    <button
                                                        key={lang.code}
                                                        type="button"
                                                        onClick={() => setActiveTab(lang.code)}
                                                        style={{
                                                            padding: '6px 12px',
                                                            fontSize: '13px',
                                                            border: 'none',
                                                            borderRadius: '6px',
                                                            cursor: 'pointer',
                                                            background: activeTab === lang.code
                                                                ? 'linear-gradient(135deg, #14b8a6, #0d9488)'
                                                                : 'transparent',
                                                            color: activeTab === lang.code ? '#fff' : '#888',
                                                            fontWeight: activeTab === lang.code ? '600' : '400',
                                                            transition: 'all 0.2s',
                                                            position: 'relative'
                                                        }}
                                                    >
                                                        {lang.flag} {lang.name}
                                                        {hasContent && activeTab !== lang.code && (
                                                            <span style={{
                                                                position: 'absolute',
                                                                top: '2px',
                                                                right: '2px',
                                                                width: '6px',
                                                                height: '6px',
                                                                background: '#14b8a6',
                                                                borderRadius: '50%'
                                                            }} />
                                                        )}
                                                    </button>
                                                )
                                            })}
                                        </div>

                                        {/* 当前语言的输入区域 */}
                                        <div style={{
                                            padding: '16px',
                                            background: 'rgba(255,255,255,0.03)',
                                            borderRadius: '8px',
                                            border: '1px solid rgba(255,255,255,0.1)'
                                        }}>
                                            <div style={{ marginBottom: '12px' }}>
                                                <label className="admin-form-label" style={{ fontSize: '13px' }}>
                                                    介绍描述 ({SUPPORTED_LANGUAGES.find(l => l.code === activeTab)?.name})
                                                </label>
                                                <input
                                                    type="text"
                                                    className="admin-form-input"
                                                    value={formData.descriptions?.[activeTab] || ''}
                                                    onChange={e => updateDescription(activeTab, e.target.value)}
                                                    placeholder={`${activeTab === 'zh' ? '例如: 专业创作者的不二之选' : 'e.g. The perfect choice for creators'}`}
                                                />
                                            </div>
                                            <div>
                                                <label className="admin-form-label" style={{ fontSize: '13px' }}>
                                                    功能列表 ({SUPPORTED_LANGUAGES.find(l => l.code === activeTab)?.name}, JSON数组格式)
                                                </label>
                                                <textarea
                                                    className="admin-form-input"
                                                    value={formData.featuresI18n?.[activeTab] || ''}
                                                    onChange={e => updateFeatures(activeTab, e.target.value)}
                                                    placeholder={activeTab === 'zh'
                                                        ? '["每月 2000 积分", "5 个创作项目", "高级 AI 模型"]'
                                                        : '["2000 credits per month", "5 projects", "Advanced AI"]'}
                                                    rows={4}
                                                    style={{ resize: 'vertical' }}
                                                />
                                            </div>
                                        </div>

                                        {/* 已配置语言提示 */}
                                        <div style={{ marginTop: '12px', fontSize: '12px', color: '#888' }}>
                                            已配置: {SUPPORTED_LANGUAGES.filter(lang =>
                                                formData.descriptions?.[lang.code] || formData.featuresI18n?.[lang.code]
                                            ).map(lang => lang.flag).join(' ') || '暂无'}
                                        </div>
                                    </div>
                                </>
                            ) : (
                                <>
                                    <div className="admin-form-group">
                                        <label className="admin-form-label">积分</label>
                                        <input
                                            type="number"
                                            min="0"
                                            className="admin-form-input"
                                            value={formData.credits ?? ''}
                                            onChange={e => setFormData({ ...formData, credits: parseInt(e.target.value) || 0 })}
                                        />
                                    </div>
                                    <div className="admin-form-group">
                                        <label className="admin-form-label">有效期 (天)</label>
                                        <input
                                            type="number"
                                            className="admin-form-input"
                                            value={formData.validDays || ''}
                                            onChange={e => setFormData({ ...formData, validDays: parseInt(e.target.value) })}
                                        />
                                    </div>
                                </>
                            )}
                            <div className="admin-form-group">
                                <label className="admin-form-label">
                                    <input
                                        type="checkbox"
                                        checked={formData.isActive || false}
                                        onChange={e => setFormData({ ...formData, isActive: e.target.checked })}
                                        style={{ marginRight: '8px' }}
                                    />
                                    启用
                                </label>
                            </div>
                            <div style={{ display: 'flex', gap: '12px', justifyContent: 'flex-end' }}>
                                <button type="button" className="admin-btn admin-btn-secondary" onClick={() => setShowModal(false)}>
                                    取消
                                </button>
                                <button type="submit" className="admin-btn admin-btn-primary">
                                    保存
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            )}

            {/* 删除确认弹窗 */}
            <ConfirmModal
                isOpen={deleteConfirmOpen}
                onClose={handleDeleteClose}
                onConfirm={handleDeleteConfirm}
                title="删除订阅计划"
                message="确定要删除这个订阅计划吗？此操作不可恢复。"
                confirmText="删除"
                cancelText="取消"
                isDanger={true}
            />

            {/* Toast 通知 */}
            <ToastNotification notification={notification} />
        </div>
    )
}
