'use client'

import { useState, useEffect } from 'react'
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

                        {/* 空状态提示 */}
                        <div className="flex-1 flex items-center justify-center">
                            <div className="text-center">
                                <div className="text-white/20 text-lg mb-2">
                                    {method?.name || '加载中...'}
                                </div>
                                <div className="text-white/40 text-sm">
                                    使用左侧面板管理模块类型和分组配置
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                {/* Toast 通知 */}
                <ToastNotification notification={notification} />
            </div>
        </div>
    )
}

export default NovelCreationMethodDetailContent
