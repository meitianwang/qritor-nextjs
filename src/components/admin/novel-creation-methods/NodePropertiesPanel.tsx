'use client'

import React from 'react'
import { useTranslation } from '@/hooks/useTranslation'

interface ParameterOption {
    value: string
    label: string
}

interface NodeParameter {
    name: string
    label: string
    type: string
    required?: boolean
    defaultValue?: unknown
    options?: ParameterOption[]
}

interface NodeAction {
    action: string
    title?: string
    parameters?: NodeParameter[]
}

interface NodeData {
    type: string
    label: string
    config: Record<string, unknown>
}

interface SelectedNode {
    id: string
    data: NodeData
}

interface Workflow {
    name?: string
    description?: string
}

interface Method {
    id: number
    name: string
    status?: string
    canEdit?: boolean
    [key: string]: unknown
}

interface NodePropertiesPanelProps {
    selectedNode: any
    setSelectedNode: React.Dispatch<React.SetStateAction<any>>
    nodeConfig: Record<string, unknown>
    updateNodeConfig: (name: string, value: unknown) => void
    setNodes: any
    nodeActions: any[]
    handleDeleteNode: () => void
    method: Method | null
    activeWorkflow: Workflow | null
    handlePublish: () => void
    publishing: boolean
    isCollapsed: boolean
    onToggleCollapse: () => void
}

const NodePropertiesPanel: React.FC<NodePropertiesPanelProps> = ({
    selectedNode,
    setSelectedNode,
    nodeConfig,
    updateNodeConfig,
    setNodes,
    nodeActions,
    handleDeleteNode,
    // 新增 props
    method,
    activeWorkflow,
    handlePublish,
    publishing,
    isCollapsed,
    onToggleCollapse
}) => {
    const { t } = useTranslation('studio')

    // 折叠状态时不渲染任何内容（展开按钮由父组件处理）
    if (isCollapsed) {
        return null
    }

    return (
        <div className="w-80 border-l border-white/[0.04] bg-[#0a0a0a] overflow-y-auto flex flex-col">
            {/* 工作流详情区域 */}
            <div className="relative p-4 border-b border-white/[0.06]">
                {/* 折叠按钮 - 右上角 */}
                <button
                    onClick={onToggleCollapse}
                    className="absolute top-3 right-3 p-2 text-white/30 hover:text-white/60 hover:bg-white/[0.04] rounded-lg transition-all"
                    title={t('methodDetail.collapseSidebar', '收起侧边栏')}
                >
                    <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        {/* 面板图标 */}
                        <rect x="3" y="3" width="18" height="18" rx="2" strokeWidth="1.5" />
                        <path strokeLinecap="round" strokeWidth="1.5" d="M15 3v18" />
                    </svg>
                </button>

                {/* 工作流名称 */}
                <h3 className="text-base font-medium text-white/90 truncate pr-10 mb-1">
                    {activeWorkflow?.name || t('methodDetail.noWorkflow', '无工作流')}
                </h3>
                <p className="text-xs text-white/40 line-clamp-2 leading-relaxed mb-4">
                    {activeWorkflow?.description || t('methodDetail.noDescription', '暂无描述')}
                </p>

                {/* 发布按钮 - 只在未发布且可编辑时显示 */}
                {method && method.status !== 'published' && method.canEdit && (
                    <button
                        onClick={handlePublish}
                        disabled={publishing}
                        className="w-full px-4 py-2.5 rounded-lg font-medium text-white text-sm transition-all disabled:opacity-50 disabled:cursor-not-allowed flex items-center justify-center gap-2"
                        style={{
                            background: 'linear-gradient(135deg, #0D9488 0%, #14B8A6 50%, #06B6D4 100%)'
                        }}
                    >
                        {publishing ? (
                            <>
                                <svg className="animate-spin w-4 h-4" viewBox="0 0 24 24">
                                    <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" fill="none" />
                                    <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z" />
                                </svg>
                                发布中...
                            </>
                        ) : (
                            <>
                                发布小说创作方法
                            </>
                        )}
                    </button>
                )}
            </div>

            {/* 节点属性区域 - 只在选中节点时显示 */}
            {selectedNode && (
                <>
                    {/* 节点属性头部 */}
                    <div className="px-4 py-3 border-b border-white/[0.06]">
                        <div className="flex items-center gap-2">
                            <div
                                className="w-8 h-8 rounded-lg flex items-center justify-center"
                                style={{
                                    background: 'rgba(13, 148, 136, 0.15)',
                                    border: '1px solid rgba(20, 184, 166, 0.2)'
                                }}
                            >
                                <svg className="w-4 h-4 text-teal-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M12 6V4m0 2a2 2 0 100 4m0-4a2 2 0 110 4m-6 8a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4m6 6v10m6-2a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4" />
                                </svg>
                            </div>
                            <div>
                                <h4 className="text-sm font-medium text-white">{t('methodDetail.nodeProperties', '节点属性')}</h4>
                                <p className="text-xs text-white/40">{t('methodDetail.configureNode', '配置节点参数')}</p>
                            </div>
                        </div>
                    </div>

                    {/* 节点表单内容 */}
                    <div className="flex-1 p-4 overflow-y-auto">
                        <div className="space-y-4">
                            {/* 节点类型 */}
                            <div className="space-y-1.5">
                                <label className="flex items-center gap-1.5 text-xs font-medium text-white/60">
                                    <svg className="w-3 h-3 text-teal-400/60" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M7 7h.01M7 3h5c.512 0 1.024.195 1.414.586l7 7a2 2 0 010 2.828l-7 7a2 2 0 01-2.828 0l-7-7A1.994 1.994 0 013 12V7a4 4 0 014-4z" />
                                    </svg>
                                    {t('methodDetail.nodeType', '节点类型')}
                                </label>
                                <div
                                    className="px-3 py-2 rounded-lg text-xs font-mono text-teal-300/80"
                                    style={{
                                        background: 'rgba(13, 148, 136, 0.08)',
                                        border: '1px solid rgba(20, 184, 166, 0.15)'
                                    }}
                                >
                                    {selectedNode.data?.type || '-'}
                                </div>
                            </div>

                            {/* 节点名称 */}
                            <div className="space-y-1.5">
                                <label className="flex items-center gap-1.5 text-xs font-medium text-white/60">
                                    <svg className="w-3 h-3 text-teal-400/60" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                                    </svg>
                                    {t('methodDetail.nodeName', '节点名称')}
                                </label>
                                <input
                                    type="text"
                                    value={selectedNode.data?.label || ''}
                                    onChange={(e: React.ChangeEvent<HTMLInputElement>) => {
                                        const newLabel = e.target.value
                                        setSelectedNode((prev: any) => prev ? ({
                                            ...prev,
                                            data: { ...prev.data, label: newLabel }
                                        }) : null)
                                        setNodes((nds: any[]) => nds.map((node: any) => {
                                            if (node.id === selectedNode.id) {
                                                return { ...node, data: { ...(node.data as Record<string, unknown>), label: newLabel } }
                                            }
                                            return node
                                        }))
                                    }}
                                    className="w-full px-3 py-2 text-sm bg-white/[0.03] border border-white/[0.08] rounded-lg text-white placeholder-white/30 focus:outline-none focus:border-teal-500/50 focus:ring-1 focus:ring-teal-500/20 transition-all"
                                    placeholder={t('methodDetail.inputNodeName', '输入节点名称')}
                                />
                            </div>

                            {/* 配置参数区域 */}
                            <div className="pt-3 border-t border-white/[0.06]">
                                <div className="flex items-center gap-2 mb-3">
                                    <svg className="w-3.5 h-3.5 text-teal-400/70" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z" />
                                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                    </svg>
                                    <h4 className="text-xs font-medium text-white/80">{t('methodDetail.configParams', '配置参数')}</h4>
                                </div>

                                <div className="space-y-3">
                                    {(() => {
                                        const nodeAction = nodeActions.find((a) => a.action === selectedNode.data?.type)
                                        const parameters = nodeAction?.parameters || []

                                        if (parameters.length === 0) {
                                            return (
                                                <div className="flex flex-col items-center justify-center py-6 text-center">
                                                    <div className="w-10 h-10 rounded-lg bg-white/[0.03] border border-white/[0.06] flex items-center justify-center mb-2">
                                                        <svg className="w-5 h-5 text-white/30" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M20 13V6a2 2 0 00-2-2H6a2 2 0 00-2 2v7m16 0v5a2 2 0 01-2 2H6a2 2 0 01-2-2v-5m16 0h-2.586a1 1 0 00-.707.293l-2.414 2.414a1 1 0 01-.707.293h-3.172a1 1 0 01-.707-.293l-2.414-2.414A1 1 0 006.586 13H4" />
                                                        </svg>
                                                    </div>
                                                    <p className="text-xs text-white/40">{t('methodDetail.noConfigParams', '无配置参数')}</p>
                                                </div>
                                            )
                                        }

                                        return parameters.map((param: any) => {
                                            let defaultValue = param.defaultValue
                                            if (param.name === 'parent' && !defaultValue) {
                                                defaultValue = '$projectRoot'
                                            }
                                            const value = nodeConfig[param.name] ?? defaultValue ?? (param.type === 'select' ? '' : '')

                                            return (
                                                <div key={param.name} className="space-y-1.5">
                                                    <label className="flex items-center gap-1 text-xs font-medium text-white/60">
                                                        {param.label}
                                                        {param.required && <span className="text-red-400">*</span>}
                                                    </label>

                                                    {param.type === 'select' && param.options ? (
                                                        <div className="relative">
                                                            <select
                                                                value={(value as string) || ''}
                                                                onChange={(e: React.ChangeEvent<HTMLSelectElement>) => {
                                                                    const newValue = e.target.value
                                                                    updateNodeConfig(param.name, newValue)
                                                                    if (param.name === 'moduleType' && newValue) {
                                                                        const selectedOption = param.options?.find((opt: any) => opt.value === newValue)
                                                                        if (selectedOption) {
                                                                            updateNodeConfig('title', selectedOption.label)
                                                                        }
                                                                    }
                                                                }}
                                                                className="w-full px-3 py-2 text-sm bg-white/[0.03] border border-white/[0.08] rounded-lg text-white focus:outline-none focus:border-teal-500/50 focus:ring-1 focus:ring-teal-500/20 transition-all appearance-none cursor-pointer"
                                                            >
                                                                <option value="" className="bg-[#1a1a1a]">{t('methodDetail.pleaseSelect', '请选择')}</option>
                                                                {param.options.map((opt: any) => (
                                                                    <option key={opt.value} value={opt.value} className="bg-[#1a1a1a]">
                                                                        {opt.label}
                                                                    </option>
                                                                ))}
                                                            </select>
                                                            <div className="absolute right-3 top-1/2 -translate-y-1/2 pointer-events-none text-white/40">
                                                                <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M19 9l-7 7-7-7" />
                                                                </svg>
                                                            </div>
                                                        </div>
                                                    ) : param.type === 'boolean' ? (
                                                        <label className="flex items-center gap-2 cursor-pointer group">
                                                            <div className="relative">
                                                                <input
                                                                    type="checkbox"
                                                                    checked={value === true || value === 'true'}
                                                                    onChange={(e: React.ChangeEvent<HTMLInputElement>) => updateNodeConfig(param.name, e.target.checked)}
                                                                    className="sr-only"
                                                                />
                                                                <div className={`w-9 h-5 rounded-full transition-all ${value === true || value === 'true' ? 'bg-teal-500' : 'bg-white/10'}`}>
                                                                    <div className={`w-4 h-4 rounded-full bg-white shadow-lg transform transition-transform mt-0.5 ${value === true || value === 'true' ? 'translate-x-4' : 'translate-x-0.5'}`} />
                                                                </div>
                                                            </div>
                                                            <span className="text-xs text-white/50">
                                                                {value === true || value === 'true' ? t('common.enabled', '已启用') : t('common.disabled', '已禁用')}
                                                            </span>
                                                        </label>
                                                    ) : param.type === 'object' || param.type === 'array' ? (
                                                        <textarea
                                                            value={typeof value === 'string' ? value : JSON.stringify(value, null, 2)}
                                                            onChange={(e: React.ChangeEvent<HTMLTextAreaElement>) => {
                                                                try {
                                                                    const parsed = JSON.parse(e.target.value)
                                                                    updateNodeConfig(param.name, parsed)
                                                                } catch {
                                                                    updateNodeConfig(param.name, e.target.value)
                                                                }
                                                            }}
                                                            rows={3}
                                                            className="w-full px-3 py-2 text-xs bg-white/[0.03] border border-white/[0.08] rounded-lg text-white placeholder-white/30 focus:outline-none focus:border-teal-500/50 focus:ring-1 focus:ring-teal-500/20 transition-all font-mono resize-none"
                                                        />
                                                    ) : (
                                                        <input
                                                            type="text"
                                                            value={value as string}
                                                            onChange={(e: React.ChangeEvent<HTMLInputElement>) => updateNodeConfig(param.name, e.target.value)}
                                                            className="w-full px-3 py-2 text-sm bg-white/[0.03] border border-white/[0.08] rounded-lg text-white placeholder-white/30 focus:outline-none focus:border-teal-500/50 focus:ring-1 focus:ring-teal-500/20 transition-all"
                                                        />
                                                    )}
                                                </div>
                                            )
                                        })
                                    })()}
                                </div>
                            </div>
                        </div>
                    </div>

                    {/* 删除节点按钮 */}
                    <div className="p-4 border-t border-white/[0.06]">
                        <button
                            onClick={handleDeleteNode}
                            className="w-full px-4 py-2 bg-red-500/10 hover:bg-red-500/20 text-red-400 rounded-lg transition-all text-sm font-medium flex items-center justify-center gap-2 border border-red-500/20 hover:border-red-500/40"
                        >
                            <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                            </svg>
                            {t('methodDetail.deleteNode', '删除节点')}
                        </button>
                    </div>
                </>
            )}

            {/* 未选中节点时的提示 */}
            {!selectedNode && (
                <div className="flex-1 flex items-center justify-center p-4">
                    <div className="text-center">
                        <div className="w-12 h-12 mx-auto mb-3 rounded-xl bg-white/[0.03] border border-white/[0.06] flex items-center justify-center">
                            <svg className="w-6 h-6 text-white/20" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="1.5" d="M15 15l-2 5L9 9l11 4-5 2zm0 0l5 5M7.188 2.239l.777 2.897M5.136 7.965l-2.898-.777M13.95 4.05l-2.122 2.122m-5.657 5.656l-2.12 2.122" />
                            </svg>
                        </div>
                        <p className="text-xs text-white/40">{t('methodDetail.selectNodeTip', '选择节点查看属性')}</p>
                    </div>
                </div>
            )}
        </div>
    )
}

export default NodePropertiesPanel
