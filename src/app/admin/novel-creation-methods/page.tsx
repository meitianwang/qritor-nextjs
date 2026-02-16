'use client'

import { useState, useEffect, useCallback } from 'react'
import { useRouter } from 'next/navigation'
import { authFetch } from '@/lib/auth-utils'
import { useToast } from '@/hooks/useToast'
import ToastNotification from '@/components/ToastNotification'
import NovelCreationMethodEditModal from '@/components/admin/NovelCreationMethodEditModal'
import ConfirmDialog from '@/components/admin/ConfirmDialog'

interface NovelCreationMethod {
    id: string
    name: string
    description?: string
    isPreset: boolean
    canEdit: boolean
    status?: string
    creatorName?: string
    novelType?: string
    language?: string
}

function SearchIcon({ className, strokeWidth }: { className?: string; strokeWidth?: number }) {
    return (
        <svg className={className} fill="none" stroke="currentColor" viewBox="0 0 24 24" strokeWidth={strokeWidth || 2}>
            <path strokeLinecap="round" strokeLinejoin="round" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
        </svg>
    )
}

function PlusIcon({ className }: { className?: string }) {
    return (
        <svg className={className} fill="none" stroke="currentColor" viewBox="0 0 24 24" strokeWidth={2}>
            <path strokeLinecap="round" strokeLinejoin="round" d="M12 4v16m8-8H4" />
        </svg>
    )
}

function BeakerIcon({ className, strokeWidth }: { className?: string; strokeWidth?: number }) {
    return (
        <svg className={className} fill="none" stroke="currentColor" viewBox="0 0 24 24" strokeWidth={strokeWidth || 2}>
            <path strokeLinecap="round" strokeLinejoin="round" d="M19.428 15.428a2 2 0 00-1.022-.547l-2.387-.477a6 6 0 00-3.86.517l-.318.158a6 6 0 01-3.86.517L6.05 15.21a2 2 0 00-1.806.547M8 4h8l-1 1v5.172a2 2 0 00.586 1.414l5 5c1.26 1.26.367 3.414-1.415 3.414H4.828c-1.782 0-2.674-2.154-1.414-3.414l5-5A2 2 0 009 10.172V5L8 4z" />
        </svg>
    )
}

function LightningBoltIcon({ className }: { className?: string }) {
    return (
        <svg className={className} fill="none" stroke="currentColor" viewBox="0 0 24 24" strokeWidth={2}>
            <path strokeLinecap="round" strokeLinejoin="round" d="M13 10V3L4 14h7v7l9-11h-7z" />
        </svg>
    )
}

function PencilIcon({ className }: { className?: string }) {
    return (
        <svg className={className} fill="none" stroke="currentColor" viewBox="0 0 24 24" strokeWidth={2}>
            <path strokeLinecap="round" strokeLinejoin="round" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
        </svg>
    )
}

function TrashIcon({ className }: { className?: string }) {
    return (
        <svg className={className} fill="none" stroke="currentColor" viewBox="0 0 24 24" strokeWidth={2}>
            <path strokeLinecap="round" strokeLinejoin="round" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
        </svg>
    )
}

function BadgeCheckIcon({ className }: { className?: string }) {
    return (
        <svg className={className} fill="none" stroke="currentColor" viewBox="0 0 24 24" strokeWidth={2}>
            <path strokeLinecap="round" strokeLinejoin="round" d="M9 12l2 2 4-4M7.835 4.697a3.42 3.42 0 001.946-.806 3.42 3.42 0 014.438 0 3.42 3.42 0 001.946.806 3.42 3.42 0 013.138 3.138 3.42 3.42 0 00.806 1.946 3.42 3.42 0 010 4.438 3.42 3.42 0 00-.806 1.946 3.42 3.42 0 01-3.138 3.138 3.42 3.42 0 00-1.946.806 3.42 3.42 0 01-4.438 0 3.42 3.42 0 00-1.946-.806 3.42 3.42 0 01-3.138-3.138 3.42 3.42 0 00-.806-1.946 3.42 3.42 0 010-4.438 3.42 3.42 0 00.806-1.946 3.42 3.42 0 013.138-3.138z" />
        </svg>
    )
}

export default function NovelCreationMethodListPage() {
    const router = useRouter()
    const { notification, showToast } = useToast()
    const [methods, setMethods] = useState<NovelCreationMethod[]>([])
    const [loading, setLoading] = useState(true)
    const [isEditModalOpen, setIsEditModalOpen] = useState(false)
    const [editingMethod, setEditingMethod] = useState<NovelCreationMethod | null>(null)
    const [searchQuery, setSearchQuery] = useState('')
    const [activeTab, setActiveTab] = useState('all')

    const [deleteConfirm, setDeleteConfirm] = useState({
        isOpen: false,
        methodId: null as string | null,
        methodName: ''
    })

    const fetchMethods = useCallback(async () => {
        try {
            const response = await authFetch('/api/novel-creation-methods')
            if (response.ok) {
                const result = await response.json()
                setMethods(result.data || [])
            }
        } catch (error) {
            console.error('Failed to fetch creation methods', error)
        } finally {
            setLoading(false)
        }
    }, [])

    useEffect(() => {
        fetchMethods()
    }, [fetchMethods])

    const openDeleteConfirm = (methodId: string, methodName: string) => {
        setDeleteConfirm({ isOpen: true, methodId, methodName })
    }

    const closeDeleteConfirm = () => {
        setDeleteConfirm({ isOpen: false, methodId: null, methodName: '' })
    }

    const handleDeleteConfirm = async () => {
        if (!deleteConfirm.methodId) return

        try {
            const response = await authFetch(`/api/novel-creation-methods/${deleteConfirm.methodId}`, {
                method: 'DELETE'
            })
            if (response.ok) {
                fetchMethods()
            } else {
                const result = await response.json()
                showToast('error', result.message || '删除失败')
            }
        } catch {
            showToast('error', '删除失败')
        } finally {
            closeDeleteConfirm()
        }
    }

    const stats = {
        totalMethods: methods.length,
        presetMethods: methods.filter(m => m.isPreset && !m.canEdit).length,
        customMethods: methods.filter(m => m.canEdit).length
    }

    const filteredMethods = methods.filter(method => {
        const matchSearch = !searchQuery ||
            method.name?.toLowerCase().includes(searchQuery.toLowerCase()) ||
            method.description?.toLowerCase().includes(searchQuery.toLowerCase())

        const matchTab = activeTab === 'all' ||
            (activeTab === 'preset' && method.isPreset && !method.canEdit) ||
            (activeTab === 'custom' && method.canEdit)

        return matchSearch && matchTab
    })

    const tabs = [
        { id: 'all', label: '全部' },
        { id: 'preset', label: '官方预设' },
        { id: 'custom', label: '我的方法' }
    ]

    const getMethodColor = (_method: NovelCreationMethod, index: number) => {
        const colors = [
            { bg: 'from-teal-500/20 to-teal-600/10', border: 'border-teal-500/30', icon: 'text-teal-400', iconBg: 'bg-teal-500/20' },
            { bg: 'from-cyan-500/20 to-cyan-600/10', border: 'border-cyan-500/30', icon: 'text-cyan-400', iconBg: 'bg-cyan-500/20' },
            { bg: 'from-teal-600/20 to-cyan-500/10', border: 'border-teal-600/30', icon: 'text-teal-300', iconBg: 'bg-teal-600/20' }
        ]
        return colors[index % colors.length]
    }

    return (
        <div className="text-white">
            <div className="max-w-6xl mx-auto px-8 py-8">

                <div className="mb-8">
                    <h1 className="text-4xl font-bold mb-3">
                        <span className="bg-clip-text text-transparent bg-gradient-to-r from-teal-400 via-cyan-500 to-teal-500">
                            探索小说创作方法
                        </span>
                    </h1>
                    <p className="text-gray-400 text-lg flex items-center gap-2">
                        <BadgeCheckIcon className="w-5 h-5 text-emerald-400" />
                        管理和开发小说创作方法，自定义创作流程
                    </p>
                </div>

                <div className="flex items-center gap-6 mb-8">
                    <div className="text-center">
                        <p className="text-5xl font-bold bg-clip-text text-transparent bg-gradient-to-r from-teal-400 to-cyan-500">
                            {stats.totalMethods}
                        </p>
                        <p className="text-sm text-gray-400 mt-1">项方法</p>
                    </div>
                    <div className="w-px h-12 bg-white/10" />
                    <div className="flex items-center gap-8">
                        <div className="flex items-center gap-2">
                            <div className="w-3 h-3 rounded-full bg-emerald-500" />
                            <span className="text-gray-400 text-sm">{stats.presetMethods} 预设</span>
                        </div>
                        <div className="flex items-center gap-2">
                            <div className="w-3 h-3 rounded-full bg-cyan-500" />
                            <span className="text-gray-400 text-sm">{stats.customMethods} 自定义</span>
                        </div>
                    </div>
                </div>

                <div className="flex flex-col sm:flex-row gap-4 mb-6">
                    <div className="flex-1 relative">
                        <SearchIcon className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-gray-500" />
                        <input
                            type="text"
                            value={searchQuery}
                            onChange={(e) => setSearchQuery(e.target.value)}
                            placeholder="搜索小说创作方法..."
                            className="w-full pl-12 pr-4 py-3 bg-white/[0.03] border border-white/[0.08] rounded-xl text-white placeholder-gray-500 focus:outline-none focus:border-teal-500/50 focus:bg-white/[0.05] transition-all"
                        />
                    </div>

                    <button
                        onClick={() => {
                            setEditingMethod(null)
                            setIsEditModalOpen(true)
                        }}
                        className="flex items-center justify-center gap-2 px-6 py-3 bg-gradient-to-r from-emerald-500 to-cyan-600 hover:from-emerald-600 hover:to-cyan-700 text-white rounded-xl font-medium transition-all shadow-lg shadow-emerald-500/25 hover:shadow-emerald-500/40"
                    >
                        <PlusIcon className="w-5 h-5" />
                        新建方法
                    </button>
                </div>

                <div className="flex items-center gap-2 mb-6 border-b border-white/[0.06] pb-4">
                    {tabs.map(tab => (
                        <button
                            key={tab.id}
                            onClick={() => setActiveTab(tab.id)}
                            className={`px-4 py-2 rounded-lg text-sm font-medium transition-all ${activeTab === tab.id
                                ? 'bg-emerald-500/15 text-emerald-400'
                                : 'text-gray-400 hover:text-white hover:bg-white/[0.04]'
                                }`}
                        >
                            {tab.label}
                        </button>
                    ))}
                </div>

                {loading && (
                    <div className="flex justify-center py-12">
                        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-emerald-500"></div>
                    </div>
                )}

                {!loading && methods.length === 0 && (
                    <div className="text-center py-20">
                        <div className="inline-flex items-center justify-center w-24 h-24 bg-gradient-to-br from-emerald-500/20 to-cyan-500/20 rounded-3xl mb-6">
                            <BeakerIcon className="w-12 h-12 text-emerald-400" strokeWidth={1.5} />
                        </div>
                        <h3 className="text-xl font-medium text-white mb-2">
                            暂无小说创作方法
                        </h3>
                        <p className="text-gray-400 mb-6">
                            创建一个新的小说创作方法开始吧
                        </p>
                        <button
                            onClick={() => {
                                setEditingMethod(null)
                                setIsEditModalOpen(true)
                            }}
                            className="inline-flex items-center gap-2 px-6 py-3 bg-gradient-to-r from-emerald-500 to-cyan-600 text-white rounded-xl font-medium transition-all"
                        >
                            <PlusIcon className="w-5 h-5" />
                            新建方法
                        </button>
                    </div>
                )}

                {!loading && filteredMethods.length > 0 && (
                    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-5">
                        {filteredMethods.map((method, index) => {
                            const color = getMethodColor(method, index)
                            return (
                                <div
                                    key={method.id}
                                    className={`group relative bg-gradient-to-br ${color.bg} border ${color.border} hover:border-opacity-60 rounded-2xl p-5 transition-all duration-300 cursor-pointer hover:-translate-y-1 hover:shadow-lg`}
                                    onClick={() => router.push(`/admin/novel-creation-methods/${method.id}`)}
                                >
                                    <div className="flex items-start gap-4 mb-4">
                                        <div className={`w-12 h-12 ${color.iconBg} rounded-xl flex items-center justify-center flex-shrink-0`}>
                                            <BeakerIcon className={`w-6 h-6 ${color.icon}`} strokeWidth={1.8} />
                                        </div>
                                        <div className="flex-1 min-w-0">
                                            <div className="flex items-center gap-2 mb-1 flex-wrap">
                                                <h3 className="text-lg font-semibold text-white truncate group-hover:text-white transition-colors">
                                                    {method.name}
                                                </h3>
                                                {method.isPreset ? (
                                                    <span className="inline-flex items-center px-2 py-0.5 rounded-full text-[10px] font-medium bg-emerald-500/20 text-emerald-400 border border-emerald-500/30">
                                                        预设
                                                    </span>
                                                ) : (
                                                    <span className={`inline-flex items-center px-2 py-0.5 rounded-full text-[10px] font-medium ${method.status === 'published'
                                                        ? 'bg-emerald-500/20 text-emerald-400 border border-emerald-500/30'
                                                        : 'bg-amber-500/20 text-amber-400 border border-amber-500/30'
                                                        }`}>
                                                        {method.status === 'published' ? '已发布' : '开发中'}
                                                    </span>
                                                )}
                                            </div>
                                            <p className="text-sm text-gray-500 line-clamp-2">
                                                {method.description || '暂无描述'}
                                            </p>
                                        </div>
                                    </div>

                                    <div className="flex items-center justify-between pt-3 border-t border-white/[0.06]">
                                        <div className="flex items-center gap-3 text-xs text-gray-500">
                                            <span className="flex items-center gap-1">
                                                <LightningBoltIcon className="w-4 h-4" />
                                                点击开发
                                            </span>
                                            {method.creatorName && (
                                                <span className="text-gray-600">
                                                    创建者: {method.creatorName}
                                                </span>
                                            )}
                                        </div>

                                        {method.canEdit && (
                                            <div className="flex items-center gap-1 opacity-0 group-hover:opacity-100 transition-opacity">
                                                <button
                                                    onClick={(e) => {
                                                        e.stopPropagation()
                                                        setEditingMethod(method)
                                                        setIsEditModalOpen(true)
                                                    }}
                                                    className="p-1.5 text-gray-500 hover:text-white hover:bg-white/10 rounded-lg transition-colors"
                                                    title="编辑基本信息"
                                                >
                                                    <PencilIcon className="w-4 h-4" />
                                                </button>
                                                <button
                                                    onClick={(e) => {
                                                        e.stopPropagation()
                                                        openDeleteConfirm(method.id, method.name)
                                                    }}
                                                    className="p-1.5 text-gray-500 hover:text-red-400 hover:bg-red-500/10 rounded-lg transition-colors"
                                                    title="删除"
                                                >
                                                    <TrashIcon className="w-4 h-4" />
                                                </button>
                                            </div>
                                        )}
                                    </div>
                                </div>
                            )
                        })}
                    </div>
                )}

                {!loading && methods.length > 0 && filteredMethods.length === 0 && (
                    <div className="text-center py-16">
                        <SearchIcon className="w-16 h-16 text-gray-500 mx-auto mb-4" strokeWidth={1.5} />
                        <h3 className="text-lg font-medium text-white mb-2">未找到匹配的方法</h3>
                        <p className="text-gray-400">请尝试其他关键词</p>
                    </div>
                )}
            </div>

            <NovelCreationMethodEditModal
                isOpen={isEditModalOpen}
                onClose={() => setIsEditModalOpen(false)}
                method={editingMethod}
                onSave={fetchMethods}
                showToast={showToast}
            />

            <ConfirmDialog
                isOpen={deleteConfirm.isOpen}
                onConfirm={handleDeleteConfirm}
                onCancel={closeDeleteConfirm}
                title="确认删除"
                message="确定要删除这个小说创作方法吗？此操作无法撤销。"
                confirmText="删除"
                confirmVariant="danger"
            />

            <ToastNotification notification={notification} />
        </div>
    )
}
