'use client'

import React, { useMemo, useRef, useState } from 'react'
import PromptEditModal from '@/components/admin/PromptEditModal'
import ModuleTypeEditModal from '@/components/admin/ModuleTypeEditModal'
import KnowledgeEditModal from '@/components/admin/KnowledgeEditModal'
import JsonSchemaEditor from '@/components/admin/JsonSchemaEditor'
import AiContextEditor from '@/components/admin/AiContextEditor'
import MarkdownPreviewModal from '@/components/admin/MarkdownPreviewModal'
import { authFetch } from '@/lib/auth-utils'
import { useTranslation } from '@/hooks/useTranslation'

interface Category {
    id: string
    name: string
}

interface DeletingItem {
    type: string
    id: number
}

interface Workflow {
    id: number
    name: string
    [key: string]: any
}

interface ModuleType {
    id: number
    name: string
    singleton: boolean
    enableAi: boolean
    saveWorkflowId: number | null
    createWorkflowId: number | null
    [key: string]: any
}

interface Knowledge {
    id: number
    name: string
    content: string
    [key: string]: any
}

interface Prompt {
    id: number
    name: string
    [key: string]: any
}

interface NodeAction {
    action: string
    title: string
    [key: string]: any
}

interface PreviewModalState {
    isOpen: boolean
    title: string
    content: string
    loading: boolean
}

interface SectionHeaderProps {
    isOpen: boolean
    onToggle: () => void
    title: string
    icon: React.ReactNode
    onAdd?: () => void
    addTitle?: string
}

interface ListItemProps {
    children: React.ReactNode
    isActive?: boolean
    onClick?: () => void
    actions?: React.ReactNode
}

interface ActionButtonProps {
    onClick: () => void
    color?: 'gray' | 'blue' | 'orange' | 'red'
    title: string
    children: React.ReactNode
}

interface SidebarProps {
    method: Record<string, any> | null
    nodeActions: NodeAction[]
    moduleTypes: ModuleType[]
    knowledges: Knowledge[]
    prompts: Prompt[]
    fetchResources: () => Promise<void>
    deletingItem: DeletingItem | null
    handleDelete: (type: string, id: number) => void
    onOpenModal?: () => void
    workflows: Workflow[]
    activeWorkflow: Workflow | null
    setActiveWorkflow: (wf: any) => void
    onCreateWorkflow: () => void
    onDeleteWorkflow: () => void
    onPublish: () => void
    publishing: boolean
    showToast: (type: string, message: string) => void
    isCollapsed: boolean
    onToggleCollapse: () => void
    onUpdateVisibleCategories?: (categories: string[]) => void
}

const Sidebar: React.FC<SidebarProps> = ({
    method,
    nodeActions,
    moduleTypes,
    knowledges,
    prompts,
    fetchResources,
    deletingItem,
    handleDelete,

    onOpenModal,
    workflows,
    activeWorkflow,
    setActiveWorkflow,
    onCreateWorkflow,
    onDeleteWorkflow,
    onPublish,
    publishing,
    showToast,
    isCollapsed,
    onToggleCollapse,
    onUpdateVisibleCategories
}) => {
    const { t } = useTranslation('studio')
    const [isWorkflowsOpen, setIsWorkflowsOpen] = useState(false)
    const [isModuleTypesOpen, setIsModuleTypesOpen] = useState(false)
    const [isKnowledgeOpen, setIsKnowledgeOpen] = useState(false)
    const [isPromptsOpen, setIsPromptsOpen] = useState(false)
    const [isCategoriesOpen, setIsCategoriesOpen] = useState(false)

    const plotConfig = useMemo(() => {
        if (!method?.plotConfig) return null
        if (typeof method.plotConfig === 'string') {
            try {
                return JSON.parse(method.plotConfig)
            } catch {
                return null
            }
        }
        return method.plotConfig
    }, [method])

    // 所有可能的分组
    const ALL_CATEGORIES: Category[] = [
        { id: 'setting', name: '设定' },
        { id: 'character', name: '角色库' },
        { id: 'scene', name: '场景库' },
        { id: 'organization', name: '组织库' },
        { id: 'prop', name: '道具库' },
        { id: 'chapter', name: '章节' }
    ]


    // Modals refs
    const promptModalRef = useRef<any>(null)
    const moduleTypeModalRef = useRef<any>(null)
    const knowledgeModalRef = useRef<any>(null)
    const jsonSchemaEditorRef = useRef<any>(null)
    const aiContextEditorRef = useRef<any>(null)


    // Preview Modal State
    const [previewModal, setPreviewModal] = useState<PreviewModalState>({
        isOpen: false,
        title: '',
        content: '',
        loading: false
    })



    const handleViewKnowledge = (knowledge: Knowledge) => {
        onOpenModal?.()
        setPreviewModal({
            isOpen: true,
            title: knowledge.name,
            content: knowledge.content,
            loading: false
        })
    }

    const handleViewPrompt = async (prompt: Prompt) => {
        onOpenModal?.()
        setPreviewModal({
            isOpen: true,
            title: prompt.name,
            content: '',
            loading: true
        })

        try {
            const response = await authFetch(`/api/prompts/${prompt.id}/markdown`)
            const result = await response.json()
            if (result.code === 200) {
                setPreviewModal(prev => ({
                    ...prev,
                    content: result.data,
                    loading: false
                }))
            } else {
                setPreviewModal(prev => ({
                    ...prev,
                    content: t('methodDetail.loadFailed') + ': ' + result.message,
                    loading: false
                }))
            }
        } catch (error) {
            setPreviewModal(prev => ({
                ...prev,
                content: t('methodDetail.loadFailed') + ': ' + (error as Error).message,
                loading: false
            }))
        }
    }



    const handleDragStart = (event: React.DragEvent, nodeAction: NodeAction) => {
        event.dataTransfer.setData('application/reactflow', JSON.stringify(nodeAction))
        event.dataTransfer.effectAllowed = 'move'
    }

    // Section Toggle Component
    const SectionHeader: React.FC<SectionHeaderProps> = ({ isOpen, onToggle, title, icon, onAdd, addTitle }) => (
        <div
            className="flex items-center justify-between mb-3 cursor-pointer group"
            onClick={onToggle}
        >
            <div className="flex items-center gap-2">
                <svg
                    className={`w-4 h-4 text-white/40 transition-transform duration-200 ${isOpen ? 'rotate-90' : ''}`}
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                >
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M9 5l7 7-7 7" />
                </svg>
                <span className="text-white/60">{icon}</span>
                <h3 className="text-sm font-semibold text-white/90 group-hover:text-white transition-colors">{title}</h3>
            </div>
            {onAdd && (
                <button
                    onClick={(e) => { e.stopPropagation(); onAdd() }}
                    className="p-1.5 text-teal-400/60 hover:text-teal-400 hover:bg-teal-500/10 rounded-lg transition-all"
                    title={addTitle}
                >
                    <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M12 4v16m8-8H4" />
                    </svg>
                </button>
            )}
        </div>
    )

    // List Item Component
    const ListItem: React.FC<ListItemProps> = ({ children, isActive, onClick, actions }) => (
        <div
            className={`
                group relative p-3 rounded-xl text-sm cursor-pointer transition-all duration-200
                ${isActive
                    ? 'bg-gradient-to-r from-teal-500/15 to-cyan-500/10 border border-teal-500/30'
                    : 'bg-white/[0.02] border border-white/[0.04] hover:bg-white/[0.04] hover:border-white/[0.08]'
                }
            `}
            onClick={onClick}
        >
            <div className="flex items-center justify-between">
                <div className="flex-1 min-w-0">{children}</div>
                {actions && (
                    <div className="flex items-center gap-1 opacity-0 group-hover:opacity-100 transition-opacity">
                        {actions}
                    </div>
                )}
            </div>
        </div>
    )

    // Action Button Component
    const ActionButton: React.FC<ActionButtonProps> = ({ onClick, color = 'gray', title, children }) => {
        const colorClasses: Record<string, string> = {
            gray: 'text-white/40 hover:text-white/60 hover:bg-white/10',
            blue: 'text-teal-400/60 hover:text-teal-400 hover:bg-teal-500/10',
            orange: 'text-amber-400/60 hover:text-amber-400 hover:bg-amber-500/10',
            red: 'text-red-400/60 hover:text-red-400 hover:bg-red-500/10'
        }
        return (
            <button
                onClick={(e) => { e.stopPropagation(); onClick() }}
                className={`p-1.5 rounded-lg transition-all ${colorClasses[color]}`}
                title={title}
            >
                {children}
            </button>
        )
    }

    // 折叠状态时不渲染任何内容（展开按钮由父组件处理）
    if (isCollapsed) {
        return null
    }

    return (
        <div className="w-80 flex flex-col border-r border-white/[0.04] bg-[#0a0a0a]">
            {/* Method Header */}
            <div className="relative p-4">
                {/* 折叠按钮 - 右上角 */}
                <button
                    onClick={onToggleCollapse}
                    className="absolute top-3 right-3 p-2 text-white/30 hover:text-white/60 hover:bg-white/[0.04] rounded-lg transition-all"
                    title={t('methodDetail.collapseSidebar', '收起侧边栏')}
                >
                    <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        {/* 面板图标 */}
                        <rect x="3" y="3" width="18" height="18" rx="2" strokeWidth="1.5" />
                        <path strokeLinecap="round" strokeWidth="1.5" d="M9 3v18" />
                    </svg>
                </button>

                {/* 标题 */}
                <h1 className="text-base font-medium text-white/90 truncate pr-10 mb-2" title={method?.name}>
                    {method ? method.name : t('methodDetail.loading')}
                </h1>

                {/* 描述 */}
                <p className="text-xs text-white/40 line-clamp-2 leading-relaxed">
                    {method?.description || t('methodDetail.noDescription')}
                </p>

                {plotConfig && (
                    <div className="mt-3 text-xs text-white/50 space-y-1">
                        <div>剧情管理：{plotConfig.enabled ? '启用' : '关闭'}</div>
                        <div>自动实体关联：{plotConfig.entityLink?.enabled ? '启用' : '关闭'}</div>
                        <div>
                            剧情建议：{plotConfig.plot?.autoSuggest ? '启用' : '关闭'}
                            {plotConfig.plot?.autoSuggest && (
                                <span>，保存触发：{plotConfig.plot?.suggestOnSave ? '是' : '否'}</span>
                            )}
                        </div>
                    </div>
                )}

                {/* 状态和发布按钮 */}
                {method && !method.isPreset && (
                    <div className="flex items-center justify-between mt-4">
                        <span
                            className={`
                                inline-flex items-center px-2.5 py-1 rounded-full text-xs font-medium
                                ${method.status === 'published'
                                    ? 'bg-emerald-500/10 text-emerald-400'
                                    : 'bg-amber-500/10 text-amber-400'
                                }
                            `}
                        >
                            <span className={`w-1.5 h-1.5 rounded-full mr-2 ${method.status === 'published' ? 'bg-emerald-400' : 'bg-amber-400'}`} />
                            {method.status === 'published'
                                ? '已发布'
                                : '开发中'
                            }
                        </span>

                        {method.status !== 'published' && method.canEdit && (
                            <button
                                onClick={onPublish}
                                disabled={publishing}
                                className="px-3 py-1.5 text-xs font-medium text-white rounded-lg transition-all disabled:opacity-50 disabled:cursor-not-allowed flex items-center gap-1.5 bg-teal-600 hover:bg-teal-500"
                            >
                                {publishing ? (
                                    <>
                                        <svg className="animate-spin h-3 w-3" viewBox="0 0 24 24">
                                            <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" fill="none" />
                                            <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z" />
                                        </svg>
                                        发布中...
                                    </>
                                ) : (
                                    <>
                                        <svg className="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M5 13l4 4L19 7" />
                                        </svg>
                                        发布
                                    </>
                                )}
                            </button>
                        )}
                    </div>
                )}
            </div>

            {/* Resources List */}
            <div className="flex-1 overflow-y-auto p-4 space-y-6">

                {/* Node Types Section */}
                <div>
                    <div className="flex items-center gap-2 mb-3">
                        <svg className="w-4 h-4 text-white/60" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10" />
                        </svg>
                        <h3 className="text-sm font-semibold text-white/90">{t('methodDetail.nodeTypes')}</h3>
                    </div>
                    <div className="space-y-2">
                        {nodeActions.map((action) => (
                            <div
                                key={action.action}
                                draggable
                                onDragStart={(e) => handleDragStart(e, action)}
                                className="group p-3 bg-white/[0.02] border border-white/[0.04] rounded-xl text-sm cursor-grab active:cursor-grabbing hover:bg-white/[0.04] hover:border-teal-500/20 transition-all select-none"
                            >
                                <div className="flex items-center gap-3">
                                    <div
                                        className="w-9 h-9 rounded-lg flex items-center justify-center flex-shrink-0"
                                        style={{
                                            background: 'rgba(13, 148, 136, 0.1)',
                                            border: '1px solid rgba(20, 184, 166, 0.15)'
                                        }}
                                    >
                                        <svg className="w-4 h-4 text-teal-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M7 11.5V14m0-2.5v-6a1.5 1.5 0 113 0m-3 6a1.5 1.5 0 00-3 0v2a7.5 7.5 0 0015 0v-5a1.5 1.5 0 00-3 0m-6-3V11m0-5.5v-1a1.5 1.5 0 013 0v1m0 0V11m0-5.5a1.5 1.5 0 013 0v3m0 0V11" />
                                        </svg>
                                    </div>
                                    <div className="flex-1 min-w-0">
                                        <div className="font-medium text-white/80 truncate group-hover:text-white transition-colors">{action.title}</div>
                                    </div>
                                    <svg className="w-4 h-4 text-white/20 group-hover:text-white/40 transition-colors" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M4 8V4m0 0h4M4 4l5 5m11-1V4m0 0h-4m4 0l-5 5M4 16v4m0 0h4m-4 0l5-5m11 5l-5-5m5 5v-4m0 4h-4" />
                                    </svg>
                                </div>
                            </div>
                        ))}
                        {nodeActions.length === 0 && (
                            <div className="text-xs text-white/30 text-center py-4">{t('methodDetail.noNodeTypes')}</div>
                        )}
                    </div>
                </div>

                {/* Workflows Section */}
                <div>
                    <SectionHeader
                        isOpen={isWorkflowsOpen}
                        onToggle={() => setIsWorkflowsOpen(!isWorkflowsOpen)}
                        title={t('methodDetail.workflow')}
                        icon={
                            <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M13 10V3L4 14h7v7l9-11h-7z" />
                            </svg>
                        }
                        onAdd={onCreateWorkflow}
                        addTitle={t('methodDetail.newWorkflow')}
                    />
                    {isWorkflowsOpen && (
                        <div className="space-y-2">
                            {workflows?.map(wf => (
                                <ListItem
                                    key={wf.id}
                                    isActive={activeWorkflow?.id === wf.id}
                                    onClick={() => setActiveWorkflow(wf)}
                                    actions={
                                        activeWorkflow && method && wf.id !== method.workflowId && (
                                            <ActionButton
                                                onClick={onDeleteWorkflow}
                                                color="red"
                                                title={t('methodDetail.delete')}
                                            >
                                                <svg className="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                                                </svg>
                                            </ActionButton>
                                        )
                                    }
                                >
                                    <span className={`font-medium truncate ${activeWorkflow?.id === wf.id ? 'text-teal-300' : 'text-white/80'}`}>
                                        {wf.name}
                                    </span>
                                </ListItem>
                            ))}
                            {workflows?.length === 0 && (
                                <div className="text-xs text-white/30 text-center py-4">{t('methodDetail.noWorkflows')}</div>
                            )}
                        </div>
                    )}
                </div>

                {/* Module Types Section */}
                <div>
                    <SectionHeader
                        isOpen={isModuleTypesOpen}
                        onToggle={() => setIsModuleTypesOpen(!isModuleTypesOpen)}
                        title={t('methodDetail.moduleTypes')}
                        icon={
                            <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10" />
                            </svg>
                        }
                        onAdd={() => { onOpenModal?.(); moduleTypeModalRef.current?.open({ novelCreationMethodId: method?.id }); }}
                        addTitle={t('methodDetail.newModuleType')}
                    />
                    {isModuleTypesOpen && (
                        <div className="space-y-1">
                            {moduleTypes.map(mt => (
                                <div key={mt.id}>
                                    <div className="group p-2.5 bg-white/[0.02] border border-white/[0.04] rounded-lg text-sm hover:bg-white/[0.04] hover:border-white/[0.08] transition-all mb-1">
                                        <div className="flex items-center justify-between">
                                            <div className="flex items-center gap-2 min-w-0">
                                                <span className="font-medium text-white/80 truncate">{mt.name}</span>
                                                {mt.singleton && (
                                                    <span className="text-[10px] px-1.5 py-0.5 bg-cyan-500/15 text-cyan-400 rounded border border-cyan-500/20">{t('methodDetail.singleton')}</span>
                                                )}
                                            </div>
                                            <div className="flex items-center gap-0.5 opacity-0 group-hover:opacity-100 transition-opacity flex-shrink-0">
                                                <ActionButton onClick={() => { onOpenModal?.(); jsonSchemaEditorRef.current?.open(mt) }} color="blue" title={t('methodDetail.editJsonDef')}>
                                                    <span className="text-[10px] font-mono font-bold">&lt;/&gt;</span>
                                                </ActionButton>
                                                {mt.enableAi && (
                                                    <ActionButton onClick={() => { onOpenModal?.(); aiContextEditorRef.current?.open(mt) }} color="orange" title={t('methodDetail.aiConfig')}>
                                                        <svg className="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M13 10V3L4 14h7v7l9-11h-7z" />
                                                        </svg>
                                                    </ActionButton>
                                                )}
                                                <ActionButton onClick={() => { onOpenModal?.(); moduleTypeModalRef.current?.open(mt) }} color="gray" title={t('methodDetail.editBasicInfo')}>
                                                    <svg className="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                                                    </svg>
                                                </ActionButton>
                                                {deletingItem?.type === 'moduleType' && deletingItem?.id === mt.id ? (
                                                    <span className="text-xs text-white/40 px-1 animate-pulse">{t('methodDetail.deleting')}</span>
                                                ) : (
                                                    <ActionButton onClick={() => handleDelete('moduleType', mt.id)} color="red" title={t('methodDetail.delete')}>
                                                        <svg className="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                                                        </svg>
                                                    </ActionButton>
                                                )}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            ))}
                            {moduleTypes.length === 0 && <div className="text-xs text-white/30 text-center py-4">{t('methodDetail.noModuleTypes')}</div>}
                        </div>
                    )}
                </div>

                {/* Knowledge Base Section */}
                <div>
                    <SectionHeader
                        isOpen={isKnowledgeOpen}
                        onToggle={() => setIsKnowledgeOpen(!isKnowledgeOpen)}
                        title={t('methodDetail.knowledgeBase')}
                        icon={
                            <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253" />
                            </svg>
                        }
                        onAdd={() => { onOpenModal?.(); knowledgeModalRef.current?.open({ novelCreationMethodId: method?.id }); }}
                        addTitle={t('methodDetail.newKnowledge')}
                    />
                    {isKnowledgeOpen && (
                        <div className="space-y-2">
                            {knowledges.map(k => (
                                <ListItem key={k.id} onClick={() => { }}>
                                    <div className="flex items-center justify-between">
                                        <span className="font-medium text-white/80 truncate">{k.name}</span>
                                        <div className="flex items-center gap-0.5 opacity-0 group-hover:opacity-100 transition-opacity">
                                            <ActionButton onClick={() => handleViewKnowledge(k)} color="gray" title={t('methodDetail.viewContent')}>
                                                <svg className="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                                                </svg>
                                            </ActionButton>
                                            <ActionButton onClick={() => { onOpenModal?.(); knowledgeModalRef.current?.open(k) }} color="blue" title={t('common.edit')}>
                                                <svg className="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                                                </svg>
                                            </ActionButton>
                                            {deletingItem?.type === 'knowledge' && deletingItem?.id === k.id ? (
                                                <span className="text-xs text-white/40 px-1 animate-pulse">{t('methodDetail.deleting')}</span>
                                            ) : (
                                                <ActionButton onClick={() => handleDelete('knowledge', k.id)} color="red" title={t('common.delete')}>
                                                    <svg className="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                                                    </svg>
                                                </ActionButton>
                                            )}
                                        </div>
                                    </div>
                                </ListItem>
                            ))}
                            {knowledges.length === 0 && <div className="text-xs text-white/30 text-center py-4">{t('methodDetail.noKnowledges')}</div>}
                        </div>
                    )}
                </div>

                {/* Prompts Section */}
                <div>
                    <SectionHeader
                        isOpen={isPromptsOpen}
                        onToggle={() => setIsPromptsOpen(!isPromptsOpen)}
                        title={t('methodDetail.prompts')}
                        icon={
                            <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z" />
                            </svg>
                        }
                        onAdd={() => { onOpenModal?.(); promptModalRef.current?.open({ novelCreationMethodId: method?.id }); }}
                        addTitle={t('methodDetail.newPrompt')}
                    />
                    {isPromptsOpen && (
                        <div className="space-y-2">
                            {prompts.map(p => (
                                <ListItem key={p.id} onClick={() => { }}>
                                    <div className="flex items-center justify-between">
                                        <span className="font-medium text-white/80 truncate">{p.name}</span>
                                        <div className="flex items-center gap-0.5 opacity-0 group-hover:opacity-100 transition-opacity">
                                            <ActionButton onClick={() => handleViewPrompt(p)} color="gray" title={t('methodDetail.viewContent')}>
                                                <svg className="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                                                </svg>
                                            </ActionButton>
                                            <ActionButton onClick={() => { onOpenModal?.(); promptModalRef.current?.open(p) }} color="blue" title={t('common.edit')}>
                                                <svg className="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                                                </svg>
                                            </ActionButton>
                                            {deletingItem?.type === 'prompt' && deletingItem?.id === p.id ? (
                                                <span className="text-xs text-white/40 px-1 animate-pulse">{t('methodDetail.deleting')}</span>
                                            ) : (
                                                <ActionButton onClick={() => handleDelete('prompt', p.id)} color="red" title={t('common.delete')}>
                                                    <svg className="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                                                    </svg>
                                                </ActionButton>
                                            )}
                                        </div>
                                    </div>
                                </ListItem>
                            ))}
                            {prompts.length === 0 && <div className="text-xs text-white/30 text-center py-4">{t('methodDetail.noPrompts')}</div>}
                        </div>
                    )}
                </div>

                {/* Categories Config Section */}
                <div>
                    <SectionHeader
                        isOpen={isCategoriesOpen}
                        onToggle={() => setIsCategoriesOpen(!isCategoriesOpen)}
                        title="分组配置"
                        icon={
                            <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M4 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2V6zM14 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V6zM4 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2v-2zM14 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z" />
                            </svg>
                        }
                    />
                    {isCategoriesOpen && (
                        <div className="space-y-2">
                            <p className="text-xs text-white/40 mb-3">
                                配置在桌面端小说创作页面和模块类型分类中显示的分组
                            </p>
                            {!method ? (
                                <div className="text-xs text-white/30 text-center py-4">加载中...</div>
                            ) : (
                                <div className="space-y-1.5">
                                    {ALL_CATEGORIES.map(cat => {
                                        const isChecked = !method?.visibleCategories || method.visibleCategories.includes(cat.id)
                                        return (
                                            <label
                                                key={cat.id}
                                                className={`
                                                    flex items-center gap-3 p-2.5 rounded-lg cursor-pointer transition-all
                                                    ${isChecked
                                                        ? 'bg-teal-500/10 border border-teal-500/30'
                                                        : 'bg-white/[0.02] border border-white/[0.06] hover:border-white/[0.12]'
                                                    }
                                                `}
                                            >
                                                <input
                                                    type="checkbox"
                                                    checked={isChecked}
                                                    onChange={(e) => {
                                                        const currentCategories = method?.visibleCategories || ALL_CATEGORIES.map(c => c.id)
                                                        let newCategories: string[]
                                                        if (e.target.checked) {
                                                            newCategories = [...currentCategories, cat.id]
                                                        } else {
                                                            newCategories = currentCategories.filter((id: string) => id !== cat.id)
                                                        }
                                                        onUpdateVisibleCategories?.(newCategories)
                                                    }}
                                                    className="w-4 h-4 rounded border-white/20 bg-white/5 text-teal-500 focus:ring-teal-500/30"
                                                />
                                                <span className={`text-sm ${isChecked ? 'text-white' : 'text-white/60'}`}>
                                                    {cat.name}
                                                </span>
                                            </label>
                                        )
                                    })}
                                </div>
                            )}
                        </div>
                    )}
                </div>
            </div>

            <MarkdownPreviewModal
                isOpen={previewModal.isOpen}
                onClose={() => setPreviewModal(prev => ({ ...prev, isOpen: false }))}
                title={previewModal.title}
                content={previewModal.content}
                loading={previewModal.loading}
            />

            {/* Modals */}
            <PromptEditModal ref={promptModalRef} onSuccess={fetchResources} showToast={showToast} />
            <ModuleTypeEditModal ref={moduleTypeModalRef} onSuccess={fetchResources} showToast={showToast} />
            <KnowledgeEditModal ref={knowledgeModalRef} onSuccess={fetchResources} showToast={showToast} />
            <JsonSchemaEditor ref={jsonSchemaEditorRef} onSave={fetchResources} showToast={showToast} />
            <AiContextEditor ref={aiContextEditorRef} onSave={fetchResources} showToast={showToast} />

        </div>
    )
}

export default Sidebar
