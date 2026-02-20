'use client'

import { useState, useEffect, useMemo } from 'react'
import { useParams } from 'next/navigation'
import Link from 'next/link'
import Sidebar from './Sidebar'
import { authFetch } from '@/lib/auth-utils'
import { useToast } from '@/hooks/useToast'
import ToastNotification from '@/components/ToastNotification'

interface Method {
    id: number
    name: string
    description: string
    novelType: string
    language: string
    visibleCategories: string[] | null
    isPreset: boolean
    status: string
    canEdit: boolean
    plotConfig: string | Record<string, any> | null
    [key: string]: any
}

interface ModuleType {
    id: number
    name: string
    novelCreationMethodId: number
    singleton: boolean
    enableAi: boolean
    entityCategory?: string
    [key: string]: any
}

interface DeletingItem {
    type: string
    id: number
}

function NovelCreationMethodDetailContent() {
    const params = useParams()
    const id = params.id as string
    const { notification, showToast } = useToast()
    const [method, setMethod] = useState<Method | null>(null)

    // Data states
    const [moduleTypes, setModuleTypes] = useState<ModuleType[]>([])

    // Deleting state
    const [deletingItem, setDeletingItem] = useState<DeletingItem | null>(null)

    // Publishing state
    const [publishing, setPublishing] = useState(false)

    // Sidebar collapsed state
    const [sidebarCollapsed, setSidebarCollapsed] = useState(false)

    useEffect(() => {
        fetchMethodDetails()
        fetchResources()
    }, [id])

    const fetchMethodDetails = async () => {
        try {
            const response = await authFetch(`/api/novel-creation-methods/${id}`)
            if (response.ok) {
                const result = await response.json()
                if (result.data) {
                    setMethod(result.data)
                }
            }
        } catch (error) {
            console.error('Failed to fetch creation method details', error)
        }
    }

    const handleUpdateVisibleCategories = async (categories: string[]) => {
        if (!method) {
            showToast('error', '创作方法数据未加载完成')
            return
        }
        try {
            const response = await authFetch(`/api/novel-creation-methods/${id}`, {
                method: 'PUT',
                body: {
                    name: method.name,
                    description: method.description,
                    novelType: method.novelType,
                    language: method.language,
                    visibleCategories: categories
                }
            })
            const result = await response.json()
            if (result.code === 200) {
                setMethod(prev => prev ? { ...prev, visibleCategories: categories } : prev)
                showToast('success', '保存成功')
            } else {
                showToast('error', result.message || '保存失败')
            }
        } catch (error) {
            console.error('Failed to update visible categories', error)
            showToast('error', '保存失败')
        }
    }

    const fetchResources = async () => {
        try {
            const moduleTypesRes = await authFetch(`/api/module-types/novel-creation-method/${id}`)
            if (moduleTypesRes.ok) setModuleTypes((await moduleTypesRes.json()).data || [])
        } catch (error) {
            console.error('Failed to fetch resources', error)
        }
    }

    const handleDelete = async (type: string, itemId: number) => {
        if (!window.confirm('确定要删除吗？')) return

        setDeletingItem({ type, id: itemId })

        let url = ''
        switch (type) {
            case 'moduleType': url = `/api/module-types/${itemId}`; break
        }
        try {
            const response = await authFetch(url, { method: 'DELETE' })

            let result: any = null
            try {
                result = await response.json()
            } catch (e) {
                // 如果响应体不是 JSON,忽略
            }

            if (response.ok || (result && result.code === 200)) {
                await fetchResources()
                showToast('success', '删除成功')
            } else {
                let errorMessage = '删除失败'
                if (result && result.message) {
                    errorMessage = result.message
                } else if (!response.ok) {
                    errorMessage = `删除失败 (HTTP ${response.status})`
                }
                showToast('error', errorMessage)
            }
        } catch (error) {
            console.error('Delete failed', error)
            showToast('error', '删除失败' + ': ' + (error as Error).message)
        } finally {
            setDeletingItem(null)
        }
    }

    const handlePublish = async () => {
        if (!method || method.isPreset) return

        setPublishing(true)
        try {
            const response = await authFetch(`/api/novel-creation-methods/${id}/publish`, {
                method: 'POST'
            })
            const result = await response.json()
            if (result.code === 200) {
                showToast('success', '发布成功')
                fetchMethodDetails()
            } else {
                showToast('error', result.message || '发布失败')
            }
        } catch (error) {
            console.error('Publish failed', error)
            showToast('error', '发布失败')
        } finally {
            setPublishing(false)
        }
    }

    return (
        <div className="h-screen flex bg-background text-text-primary overflow-hidden">
            {/* 返回按钮 */}
            <Link
                href="/admin/novel-creation-methods"
                className="fixed top-4 left-4 z-30 flex items-center gap-2 px-3 py-2 bg-white/[0.05] hover:bg-white/[0.1] border border-white/[0.08] rounded-lg transition-all text-sm text-white/70 hover:text-white"
            >
                <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 19l-7-7m0 0l7-7m-7 7h18" />
                </svg>
                {'返回'}
            </Link>

            {/* 主内容区 */}
            <div className="flex-1 flex flex-col overflow-hidden">
                <div className="flex-1 flex overflow-hidden">
                    {/* Left Sidebar: Method Info & Resources */}
                    <Sidebar
                        method={method}
                        moduleTypes={moduleTypes}
                        fetchResources={fetchResources}
                        deletingItem={deletingItem}
                        handleDelete={handleDelete}
                        onPublish={handlePublish}
                        publishing={publishing}
                        showToast={showToast}
                        isCollapsed={sidebarCollapsed}
                        onToggleCollapse={() => setSidebarCollapsed(!sidebarCollapsed)}
                        onUpdateVisibleCategories={handleUpdateVisibleCategories}
                    />

                    {/* Main Content Area */}
                    <div className="flex-1 flex flex-col overflow-hidden relative">
                        {/* 折叠状态下的展开按钮 */}
                        {sidebarCollapsed && (
                            <button
                                onClick={() => setSidebarCollapsed(false)}
                                className="absolute top-3 left-3 z-20 p-2 text-white/40 hover:text-white hover:bg-white/[0.08] rounded-lg transition-all border border-white/[0.08]"
                                title={'展开侧边栏'}
                            >
                                <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <rect x="3" y="3" width="18" height="18" rx="2" strokeWidth="1.5" />
                                    <path strokeLinecap="round" strokeWidth="1.5" d="M9 3v18" />
                                </svg>
                            </button>
                        )}

                        {/* 方法概览 */}
                        <MethodOverview method={method} moduleTypes={moduleTypes} />
                    </div>
                </div>

                {/* Toast 通知 */}
                <ToastNotification notification={notification} />
            </div>
        </div>
    )
}

// --- 方法概览面板 ---

const CATEGORY_STYLES: Record<string, { bg: string; text: string; label: string }> = {
    character: { bg: 'bg-teal-500/15', text: 'text-teal-400', label: '角色' },
    scene: { bg: 'bg-cyan-500/15', text: 'text-cyan-400', label: '场景' },
    organization: { bg: 'bg-amber-500/15', text: 'text-amber-400', label: '组织' },
    prop: { bg: 'bg-emerald-500/15', text: 'text-emerald-400', label: '道具' },
    chapter: { bg: 'bg-blue-500/15', text: 'text-blue-400', label: '章节' },
    setting: { bg: 'bg-rose-500/15', text: 'text-rose-400', label: '设定' },
}

function formatDate(dateStr: string | undefined | null): string {
    if (!dateStr) return '-'
    const d = new Date(dateStr)
    return d.toLocaleDateString('zh-CN', { year: 'numeric', month: '2-digit', day: '2-digit' })
}

function MethodOverview({ method, moduleTypes }: { method: Method | null; moduleTypes: ModuleType[] }) {
    const aiModuleCount = useMemo(() => moduleTypes.filter(m => m.enableAi).length, [moduleTypes])
    const categoryCount = useMemo(() => {
        if (!method?.visibleCategories) return 6
        return method.visibleCategories.length
    }, [method])

    const groupedModules = useMemo(() => {
        const groups: Record<string, ModuleType[]> = {}
        for (const mt of moduleTypes) {
            const cat = mt.entityCategory || 'other'
            if (!groups[cat]) groups[cat] = []
            groups[cat].push(mt)
        }
        return groups
    }, [moduleTypes])

    // 加载中骨架
    if (!method) {
        return (
            <div className="flex-1 overflow-y-auto p-8">
                <div className="max-w-4xl mx-auto space-y-6">
                    <div className="h-8 w-64 bg-white/[0.04] rounded-lg animate-pulse" />
                    <div className="h-4 w-96 bg-white/[0.03] rounded animate-pulse" />
                    <div className="grid grid-cols-3 gap-4 mt-8">
                        {[1, 2, 3].map(i => (
                            <div key={i} className="h-24 bg-white/[0.03] rounded-xl animate-pulse" />
                        ))}
                    </div>
                    <div className="h-48 bg-white/[0.03] rounded-xl animate-pulse mt-6" />
                </div>
            </div>
        )
    }

    return (
        <div className="flex-1 overflow-y-auto p-8">
            <div className="max-w-4xl mx-auto space-y-8">
                {/* Header */}
                <div>
                    <h2 className="text-2xl font-bold bg-clip-text text-transparent bg-gradient-to-r from-teal-400 via-cyan-500 to-teal-500 mb-2">
                        {method.name}
                    </h2>
                    <p className="text-white/50 text-sm leading-relaxed max-w-2xl">
                        {method.description || '暂无描述'}
                    </p>
                </div>

                {/* 统计卡片 */}
                <div className="grid grid-cols-3 gap-4">
                    <StatCard
                        value={moduleTypes.length}
                        label="模块类型"
                        icon={
                            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="1.5" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10" />
                            </svg>
                        }
                    />
                    <StatCard
                        value={categoryCount}
                        label="已启用分组"
                        icon={
                            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="1.5" d="M4 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2V6zM14 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V6zM4 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2v-2zM14 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z" />
                            </svg>
                        }
                    />
                    <StatCard
                        value={aiModuleCount}
                        label="AI 增强模块"
                        icon={
                            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="1.5" d="M13 10V3L4 14h7v7l9-11h-7z" />
                            </svg>
                        }
                    />
                </div>

                {/* 方法信息 */}
                <div className="bg-white/[0.03] border border-white/[0.06] rounded-xl p-5">
                    <h3 className="text-sm font-semibold text-white/70 mb-4">方法信息</h3>
                    <div className="grid grid-cols-2 gap-x-8 gap-y-3">
                        <InfoRow label="类型" value={method.novelType || '-'} />
                        <InfoRow label="语言" value={method.language === 'zh' ? '简体中文' : method.language === 'en' ? 'English' : (method.language || '-')} />
                        <InfoRow label="状态">
                            <span className={`inline-flex items-center gap-1.5 px-2 py-0.5 rounded-full text-xs font-medium ${
                                method.status === 'published'
                                    ? 'bg-emerald-500/15 text-emerald-400'
                                    : 'bg-amber-500/15 text-amber-400'
                            }`}>
                                <span className={`w-1.5 h-1.5 rounded-full ${method.status === 'published' ? 'bg-emerald-400' : 'bg-amber-400'}`} />
                                {method.status === 'published' ? '已发布' : '开发中'}
                            </span>
                        </InfoRow>
                        <InfoRow label="预设方法" value={method.isPreset ? '是' : '否'} />
                        <InfoRow label="创建时间" value={formatDate(method.createdAt)} />
                        <InfoRow label="更新时间" value={formatDate(method.updatedAt)} />
                    </div>
                </div>

                {/* 模块类型概览 */}
                {moduleTypes.length > 0 && (
                    <div className="bg-white/[0.03] border border-white/[0.06] rounded-xl p-5">
                        <h3 className="text-sm font-semibold text-white/70 mb-4">模块类型概览</h3>
                        <div className="space-y-4">
                            {Object.entries(groupedModules).map(([category, modules]) => {
                                const style = CATEGORY_STYLES[category]
                                return (
                                    <div key={category}>
                                        <div className="flex items-center gap-2 mb-2">
                                            {style ? (
                                                <span className={`text-xs px-2 py-0.5 rounded ${style.bg} ${style.text}`}>
                                                    {style.label}
                                                </span>
                                            ) : (
                                                <span className="text-xs px-2 py-0.5 rounded bg-white/[0.06] text-white/40">
                                                    其他
                                                </span>
                                            )}
                                            <span className="text-xs text-white/30">{modules.length} 个</span>
                                        </div>
                                        <div className="grid grid-cols-2 gap-2">
                                            {modules.map(mt => (
                                                <div
                                                    key={mt.id}
                                                    className="flex items-center justify-between p-3 bg-white/[0.02] border border-white/[0.04] rounded-lg hover:bg-white/[0.04] hover:border-white/[0.08] transition-all"
                                                >
                                                    <span className="text-sm text-white/80 truncate">{mt.name}</span>
                                                    <div className="flex items-center gap-1.5 flex-shrink-0 ml-2">
                                                        {mt.singleton && (
                                                            <span className="text-[10px] px-1.5 py-0.5 bg-cyan-500/15 text-cyan-400 rounded">单例</span>
                                                        )}
                                                        {mt.enableAi && (
                                                            <span className="text-[10px] px-1.5 py-0.5 bg-amber-500/15 text-amber-400 rounded">AI</span>
                                                        )}
                                                    </div>
                                                </div>
                                            ))}
                                        </div>
                                    </div>
                                )
                            })}
                        </div>
                    </div>
                )}

                {/* 无模块类型时的空状态 */}
                {moduleTypes.length === 0 && (
                    <div className="bg-white/[0.03] border border-white/[0.06] rounded-xl p-8 text-center">
                        <div className="inline-flex items-center justify-center w-16 h-16 bg-gradient-to-br from-teal-500/20 to-cyan-500/20 rounded-2xl mb-4">
                            <svg className="w-8 h-8 text-teal-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="1.5" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10" />
                            </svg>
                        </div>
                        <p className="text-white/40 text-sm">暂无模块类型，使用左侧面板添加</p>
                    </div>
                )}
            </div>
        </div>
    )
}

function StatCard({ value, label, icon }: { value: number; label: string; icon: React.ReactNode }) {
    return (
        <div className="bg-white/[0.03] border border-white/[0.06] rounded-xl p-4 hover:border-white/[0.12] transition-all">
            <div className="flex items-center justify-between mb-3">
                <span className="text-white/30">{icon}</span>
            </div>
            <div className="text-3xl font-bold bg-clip-text text-transparent bg-gradient-to-r from-teal-400 to-cyan-500 mb-1">
                {value}
            </div>
            <div className="text-xs text-white/40">{label}</div>
        </div>
    )
}

function InfoRow({ label, value, children }: { label: string; value?: string; children?: React.ReactNode }) {
    return (
        <div className="flex items-center justify-between py-1.5">
            <span className="text-xs text-white/40">{label}</span>
            {children || <span className="text-sm text-white/70">{value}</span>}
        </div>
    )
}

export default NovelCreationMethodDetailContent
