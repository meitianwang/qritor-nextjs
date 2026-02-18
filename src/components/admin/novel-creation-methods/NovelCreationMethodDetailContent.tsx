'use client'

import { useState, useEffect, useCallback } from 'react'
import { useParams } from 'next/navigation'
import Link from 'next/link'
import {
    useNodesState,
    useEdgesState,
    ReactFlowProvider,
    Node,
    Edge
} from 'reactflow'
import 'reactflow/dist/style.css'
import Sidebar from './Sidebar'
import WorkflowCanvas from './WorkflowCanvas'
import NodePropertiesPanel from './NodePropertiesPanel'
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
    workflowId: number | null
    plotConfig: string | Record<string, any> | null
    [key: string]: any
}

interface Workflow {
    id: number
    name: string
    novelCreationMethodId: number
    nodesJson: string
    edgesJson: string
    [key: string]: any
}

interface Prompt {
    id: number
    name: string
    novelCreationMethodId: number
    [key: string]: any
}

interface ModuleType {
    id: number
    name: string
    novelCreationMethodId: number
    singleton: boolean
    enableAi: boolean
    saveWorkflowId: number | null
    createWorkflowId: number | null
    [key: string]: any
}

interface NodeAction {
    action: string
    title: string
    parameters?: Array<{
        name: string
        defaultValue?: any
        [key: string]: any
    }>
    [key: string]: any
}

interface DeletingItem {
    type: string
    id: number
}

function NovelCreationMethodDetailPageContent() {
    const params = useParams()
    const id = params.id as string
    const { notification, showToast } = useToast()
    const [method, setMethod] = useState<Method | null>(null)
    const [activeWorkflow, setActiveWorkflow] = useState<Workflow | null>(null)
    const [workflows, setWorkflows] = useState<Workflow[]>([])
    const [showNewWorkflowModal, setShowNewWorkflowModal] = useState(false)
    const [newWorkflowTargetModuleTypeId, setNewWorkflowTargetModuleTypeId] = useState('')
    const [newWorkflowType, setNewWorkflowType] = useState('save') // 'save' or 'create'

    // Data states
    const [prompts, setPrompts] = useState<Prompt[]>([])
    const [moduleTypes, setModuleTypes] = useState<ModuleType[]>([])
    const [nodeActions, setNodeActions] = useState<NodeAction[]>([])

    // ReactFlow states
    const [nodes, setNodes, onNodesChange] = useNodesState([])
    const [edges, setEdges, onEdgesChange] = useEdgesState([])
    const [selectedNode, setSelectedNode] = useState<Node | null>(null)
    const [nodeConfig, setNodeConfig] = useState<Record<string, any>>({})

    // Deleting state
    const [deletingItem, setDeletingItem] = useState<DeletingItem | null>(null)

    // Publishing state
    const [publishing, setPublishing] = useState(false)

    // Sidebar collapsed state - 默认展开
    const [sidebarCollapsed, setSidebarCollapsed] = useState(false)
    // Right sidebar collapsed state - 默认展开
    const [rightSidebarCollapsed, setRightSidebarCollapsed] = useState(false)

    useEffect(() => {
        fetchMethodDetails()
        fetchResources()
        fetchNodeActions()
    }, [id])

    useEffect(() => {
        if (activeWorkflow) {
            loadWorkflowData(activeWorkflow)
        } else {
            setNodes([])
            setEdges([])
        }
    }, [activeWorkflow])


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
            const [promptsRes, moduleTypesRes, workflowsRes] = await Promise.all([
                authFetch(`/api/prompts/novel-creation-method/${id}`),
                authFetch(`/api/module-types/novel-creation-method/${id}`),
                authFetch(`/api/workflows/novel-creation-method/${id}/all`)
            ])

            if (promptsRes.ok) setPrompts((await promptsRes.json()).data || [])
            if (moduleTypesRes.ok) setModuleTypes((await moduleTypesRes.json()).data || [])

            if (workflowsRes.ok) {
                const result = await workflowsRes.json()
                if (result.data) {
                    setWorkflows(result.data)
                    // Default to the init workflow (linked in creation method) or the first one
                    // We need to wait for method to be set, but method is fetched in parallel.
                    // Let's rely on method.workflowId if available, otherwise first one.
                    // Since method might not be set yet, we can't fully rely on it here.
                    // But we can try to find one with type 'INIT' if we had that field, but we don't.
                    // We know init workflow has novelCreationMethodId set and is usually created first.
                    // Let's just set the first one for now, and maybe refine later.
                    if (result.data.length > 0) {
                        setActiveWorkflow(result.data[0])
                    } else {
                        createDefaultWorkflow()
                    }
                } else {
                    createDefaultWorkflow()
                }
            }

        } catch (error) {
            console.error('Failed to fetch resources', error)
        }
    }

    const createDefaultWorkflow = async () => {
        try {
            const response = await authFetch('/api/workflows', {
                method: 'POST',
                body: {
                    name: '默认工作流',
                    novelCreationMethodId: parseInt(id),
                    nodesJson: '[]',
                    edgesJson: '[]'
                }
            })
            const result = await response.json()
            if (result.code === 200 && result.data) {
                setActiveWorkflow(result.data)
                setWorkflows([result.data])
            }
        } catch (error) {
            console.error('Failed to create default workflow', error)
        }
    }

    const fetchNodeActions = async () => {
        try {
            const response = await authFetch(`/api/workflow/node-actions?novelCreationMethodId=${id}`)
            const data = await response.json()
            if (data.code === 200) {
                setNodeActions(data.data || [])
            }
        } catch (error) {
            console.error('Failed to fetch node actions', error)
        }
    }

    const loadWorkflowData = (workflowData: Workflow) => {
        try {
            if (workflowData.nodesJson) {
                const parsedNodes = JSON.parse(workflowData.nodesJson)
                const flowNodes = (Array.isArray(parsedNodes) ? parsedNodes : []).map((node: any) => {
                    const actionInfo = nodeActions.find(a => a.action === node.action)
                    return {
                        id: node.id,
                        type: 'custom',
                        position: {
                            x: node.position?.x || 0,
                            y: node.position?.y || 0
                        },
                        data: {
                            // Prefer saved label from node root, then params._label, fallback to action title, then action name
                            label: node.label || node.params?._label || actionInfo?.title || node.action,
                            type: node.action,
                            config: node.params || {}
                        }
                    }
                })
                setNodes(flowNodes)
            } else {
                setNodes([])
            }

            if (workflowData.edgesJson) {
                const parsedEdges = JSON.parse(workflowData.edgesJson)
                const flowEdges = (Array.isArray(parsedEdges) ? parsedEdges : []).map((edge: any) => ({
                    id: edge.id || `${edge.source}-${edge.target}`,
                    source: edge.source,
                    target: edge.target,
                    sourceHandle: edge.sourceHandle,
                    targetHandle: edge.targetHandle,
                    type: 'default',
                    animated: true,
                    style: {
                        strokeWidth: 2,
                        stroke: '#0ea5e9'
                    }
                }))
                setEdges(flowEdges)
            } else {
                setEdges([])
            }
        } catch (error) {
            console.error('Failed to parse workflow data', error)
            setNodes([])
            setEdges([])
        }
    }

    const handleSaveWorkflow = async () => {
        if (!activeWorkflow) return

        try {
            const savedNodes = nodes
                .filter(node => node.id !== 'temp-target-node')
                .map((node) => {
                    const actionInfo = nodeActions.find(a => a.action === node.data.type)
                    const params = { ...node.data.config }

                    // Fill in default values for missing parameters
                    if (actionInfo && actionInfo.parameters) {
                        actionInfo.parameters.forEach(param => {
                            if (params[param.name] === undefined && param.defaultValue !== undefined) {
                                params[param.name] = param.defaultValue
                            }
                            // Special handling for 'parent' if defaultValue is missing in definition but needed
                            if (param.name === 'parent' && params[param.name] === undefined) {
                                params[param.name] = '$projectRoot'
                            }
                        })
                    }

                    return {
                        id: node.id,
                        action: node.data.type,
                        label: node.data.label, // Save the label
                        params: {
                            ...params,
                            _label: node.data.label // Keep for backward compatibility
                        },
                        position: {
                            x: Math.round(node.position.x),
                            y: Math.round(node.position.y)
                        }
                    }
                })

            const savedEdges = edges
                .filter(edge => edge.id !== 'temp-edge')
                .map((edge) => ({
                    id: edge.id,
                    source: edge.source,
                    target: edge.target,
                    sourceHandle: edge.sourceHandle || null,
                    targetHandle: edge.targetHandle || null
                }))

            const updatedWorkflow = {
                ...activeWorkflow,
                nodesJson: JSON.stringify(savedNodes),
                edgesJson: JSON.stringify(savedEdges)
            }

            const response = await authFetch(`/api/workflows/${activeWorkflow.id}`, {
                method: 'PUT',
                body: updatedWorkflow
            })

            const result = await response.json()
            if (result.code === 200) {
                showToast('success', '保存成功')
                // Don't refresh everything, just update active workflow data if needed
            } else {
                showToast('error', result.message || '保存失败')
            }
        } catch (error) {
            console.error('Failed to save workflow', error)
            showToast('error', '保存失败')
        }
    }

    const handleDeleteNode = useCallback(() => {
        if (!selectedNode) return
        setNodes((nds) => nds.filter((n) => n.id !== selectedNode.id))
        setEdges((eds) => eds.filter((e) => e.source !== selectedNode.id && e.target !== selectedNode.id))
        setSelectedNode(null)
        setNodeConfig({})
    }, [selectedNode, setNodes, setEdges])

    const updateNodeConfig = (key: string, value: any) => {
        setNodeConfig((prev) => ({ ...prev, [key]: value }))
        if (selectedNode) {
            setNodes((nds) => nds.map((node) => {
                if (node.id === selectedNode.id) {
                    return { ...node, data: { ...node.data, config: { ...node.data.config, [key]: value } } }
                }
                return node
            }))
        }
    }

    const handleDelete = async (type: string, itemId: number) => {
        if (!window.confirm('确定要删除吗？')) return

        setDeletingItem({ type, id: itemId })

        let url = ''
        switch (type) {
            case 'prompt': url = `/api/prompts/${itemId}`; break
            case 'moduleType': url = `/api/module-types/${itemId}`; break
        }
        try {
            const response = await authFetch(url, { method: 'DELETE' })

            // 尝试解析响应体
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
                // 构建错误信息
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

    const handleCreateWorkflow = async () => {
        if (!newWorkflowTargetModuleTypeId) {
            showToast('warning', '请选择模块类型')
            return
        }

        const targetModuleType = moduleTypes.find(mt => mt.id === parseInt(newWorkflowTargetModuleTypeId))
        if (!targetModuleType) return

        try {
            // 1. Create Workflow
            const wfResponse = await authFetch('/api/workflows', {
                method: 'POST',
                body: {
                    name: `${targetModuleType.name} - ${newWorkflowType === 'save' ? '保存流程' : '创建流程'}`,
                    novelCreationMethodId: parseInt(id),
                    nodesJson: '[]',
                    edgesJson: '[]'
                }
            })
            const wfResult = await wfResponse.json()
            if (wfResult.code !== 200) {
                throw new Error(wfResult.message || '创建失败')
            }
            const newWorkflow = wfResult.data

            // 2. Update ModuleType
            const updateBody: Record<string, any> = { ...targetModuleType }
            if (newWorkflowType === 'save') {
                updateBody.saveWorkflowId = newWorkflow.id
            } else {
                updateBody.createWorkflowId = newWorkflow.id
            }

            const mtResponse = await authFetch(`/api/module-types/${targetModuleType.id}`, {
                method: 'PUT',
                body: updateBody
            })
            if (!mtResponse.ok) {
                throw new Error('更新失败')
            }

            await fetchResources()
            setActiveWorkflow(newWorkflow)
            setShowNewWorkflowModal(false)
            setNewWorkflowTargetModuleTypeId('')
            showToast('success', '创建成功')

        } catch (error) {
            console.error('Failed to create workflow', error)
            showToast('error', (error as Error).message)
        }
    }

    const handleDeleteWorkflow = async () => {
        if (!activeWorkflow) return
        if (!window.confirm(`确定要删除工作流「${activeWorkflow.name}」吗？`)) return

        try {
            // 1. Delete Workflow (Backend handles cascade delete if needed, but here we just delete workflow)
            // Wait, if we delete workflow, we should also clear saveWorkflowId in ModuleType?
            // Backend cascade delete is: Delete ModuleType -> Delete Workflow.
            // Here we are deleting Workflow -> Should clear ModuleType reference.

            // Find module type referencing this workflow
            const linkedModuleType = moduleTypes.find(mt => mt.saveWorkflowId === activeWorkflow.id || mt.createWorkflowId === activeWorkflow.id)
            if (linkedModuleType) {
                const updateBody: Record<string, any> = { ...linkedModuleType }
                if (updateBody.saveWorkflowId === activeWorkflow.id) {
                    updateBody.saveWorkflowId = null
                }
                if (updateBody.createWorkflowId === activeWorkflow.id) {
                    updateBody.createWorkflowId = null
                }

                await authFetch(`/api/module-types/${linkedModuleType.id}`, {
                    method: 'PUT',
                    body: updateBody
                })
            }

            const response = await authFetch(`/api/workflows/${activeWorkflow.id}`, {
                method: 'DELETE'
            })

            if (response.ok) {
                await fetchResources()
                showToast('success', '删除成功')
                // Switch to init workflow
                // We rely on fetchResources to update workflows, but we need to set activeWorkflow manually if it was deleted
                // fetchResources sets workflows, but we need to pick a new active one.
                // Let's just reload page or let fetchResources handle it?
                // fetchResources logic: if result.data, setWorkflows.
                // It doesn't auto-switch activeWorkflow if it's already set (unless we force it).
                // But activeWorkflow is deleted.
                // Let's force switch to the first one after refresh.
                // Actually fetchResources logic I added earlier:
                // if (result.data.length > 0) setActiveWorkflow(result.data[0])
                // This runs every time fetchResources is called?
                // No, only on mount or when id changes.
                // Wait, fetchResources is called in useEffect[id].
                // I should probably reset activeWorkflow to null before calling fetchResources?
                // Or just manually set it to the first one after fetch.

                // For simplicity, I'll just reload the page or let the user switch.
                // Better: set activeWorkflow to the first available one (Init workflow)
                // We can find it from current `workflows` (before update) or just wait for update.
                // Let's just set it to null, and let the effect handle it?
                // The effect `useEffect(() => { if (activeWorkflow) load... else setNodes([]) }, [activeWorkflow])`
                // It doesn't auto-select.

                // I'll just set it to the first one in the list (which is usually Init)
                // But I need the updated list.
                // Let's just set it to null for now.
                setActiveWorkflow(null)
            } else {
                showToast('error', '删除失败')
            }
        } catch (error) {
            console.error('Delete failed', error)
            showToast('error', '删除失败')
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
                fetchMethodDetails()  // 刷新方法详情
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
                        nodeActions={nodeActions}
                        moduleTypes={moduleTypes}
                        prompts={prompts}
                        fetchResources={fetchResources}
                        deletingItem={deletingItem}
                        handleDelete={handleDelete}
                        onOpenModal={() => setSelectedNode(null)}
                        workflows={workflows}
                        activeWorkflow={activeWorkflow}
                        setActiveWorkflow={setActiveWorkflow}
                        onCreateWorkflow={() => setShowNewWorkflowModal(true)}
                        onDeleteWorkflow={handleDeleteWorkflow}
                        onPublish={handlePublish}
                        publishing={publishing}
                        showToast={showToast}
                        isCollapsed={sidebarCollapsed}
                        onToggleCollapse={() => setSidebarCollapsed(!sidebarCollapsed)}
                        onUpdateVisibleCategories={handleUpdateVisibleCategories}
                    />

                    {/* Main Canvas Area */}
                    <div className="flex-1 flex flex-col overflow-hidden relative">
                        {/* 折叠状态下的展开按钮 - 悬浮在左上角 */}
                        {sidebarCollapsed && (
                            <button
                                onClick={() => setSidebarCollapsed(false)}
                                className="absolute top-3 left-3 z-20 p-2 text-white/40 hover:text-white hover:bg-white/[0.08] rounded-lg transition-all border border-white/[0.08]"
                                title={'展开侧边栏'}
                            >
                                <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    {/* 面板图标：左侧有竖线的方框 */}
                                    <rect x="3" y="3" width="18" height="18" rx="2" strokeWidth="1.5" />
                                    <path strokeLinecap="round" strokeWidth="1.5" d="M9 3v18" />
                                </svg>
                            </button>
                        )}
                        <WorkflowCanvas
                            activeWorkflow={activeWorkflow}
                            nodes={nodes}
                            edges={edges}
                            setNodes={setNodes}
                            setEdges={setEdges}
                            onNodesChange={onNodesChange}
                            onEdgesChange={onEdgesChange}
                            setSelectedNode={setSelectedNode}
                            setNodeConfig={setNodeConfig}
                            handleSaveWorkflow={handleSaveWorkflow}
                            nodeActions={nodeActions}
                            handleDeleteNode={handleDeleteNode}
                            method={method}
                            handlePublish={handlePublish}
                            publishing={publishing}
                        />
                    </div>

                    {/* 右侧折叠状态下的展开按钮 */}
                    {rightSidebarCollapsed && (
                        <button
                            onClick={() => setRightSidebarCollapsed(false)}
                            className="absolute top-3 right-3 z-20 p-2 text-white/40 hover:text-white hover:bg-white/[0.08] rounded-lg transition-all border border-white/[0.08]"
                            title={'展开侧边栏'}
                        >
                            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                {/* 面板图标：右侧有竖线的方框 */}
                                <rect x="3" y="3" width="18" height="18" rx="2" strokeWidth="1.5" />
                                <path strokeLinecap="round" strokeWidth="1.5" d="M15 3v18" />
                            </svg>
                        </button>
                    )}

                    <NodePropertiesPanel
                        selectedNode={selectedNode}
                        setSelectedNode={setSelectedNode}
                        nodeConfig={nodeConfig}
                        updateNodeConfig={updateNodeConfig}
                        setNodes={setNodes}
                        nodeActions={nodeActions}
                        handleDeleteNode={handleDeleteNode}
                        method={method}
                        activeWorkflow={activeWorkflow}
                        handlePublish={handlePublish}
                        publishing={publishing}
                        isCollapsed={rightSidebarCollapsed}
                        onToggleCollapse={() => setRightSidebarCollapsed(!rightSidebarCollapsed)}
                    />
                </div>

                {/* New Workflow Modal */}
                {showNewWorkflowModal && (
                    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/60 backdrop-blur-sm">
                        <div
                            className="relative w-full max-w-md mx-4 overflow-hidden"
                            style={{
                                background: 'linear-gradient(135deg, rgba(17, 17, 17, 0.98) 0%, rgba(10, 10, 10, 0.98) 100%)',
                                border: '1px solid rgba(255, 255, 255, 0.08)',
                                borderRadius: '20px',
                                boxShadow: '0 25px 80px rgba(0, 0, 0, 0.6), 0 0 1px rgba(255, 255, 255, 0.1)'
                            }}
                        >
                            {/* 顶部渐变装饰条 */}
                            <div
                                className="absolute top-0 left-0 right-0 h-[2px]"
                                style={{
                                    background: 'linear-gradient(90deg, #0D9488 0%, #14B8A6 50%, #06B6D4 100%)'
                                }}
                            />

                            <div className="p-6">
                                {/* 标题 */}
                                <div className="flex items-center gap-3 mb-6">
                                    <div
                                        className="w-10 h-10 rounded-xl flex items-center justify-center"
                                        style={{
                                            background: 'linear-gradient(135deg, rgba(13, 148, 136, 0.2) 0%, rgba(20, 184, 166, 0.1) 100%)',
                                            border: '1px solid rgba(20, 184, 166, 0.3)'
                                        }}
                                    >
                                        <svg className="w-5 h-5 text-teal-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M13 10V3L4 14h7v7l9-11h-7z" />
                                        </svg>
                                    </div>
                                    <h3 className="text-lg font-semibold text-white">{'新建工作流'}</h3>
                                </div>

                                {/* 工作流类型 */}
                                <div className="mb-5">
                                    <label className="block text-sm font-medium text-white/70 mb-3">
                                        {'工作流类型'}
                                    </label>
                                    <div className="flex gap-3">
                                        <label
                                            className={`flex-1 flex items-center gap-3 p-3 rounded-xl cursor-pointer transition-all ${newWorkflowType === 'save'
                                                ? 'bg-teal-500/10 border border-teal-500/30'
                                                : 'bg-white/[0.02] border border-white/[0.06] hover:border-white/[0.12]'
                                                }`}
                                        >
                                            <input
                                                type="radio"
                                                name="workflowType"
                                                value="save"
                                                checked={newWorkflowType === 'save'}
                                                onChange={(e) => setNewWorkflowType(e.target.value)}
                                                className="sr-only"
                                            />
                                            <div className={`w-4 h-4 rounded-full border-2 flex items-center justify-center ${newWorkflowType === 'save' ? 'border-teal-400' : 'border-white/30'
                                                }`}>
                                                {newWorkflowType === 'save' && <div className="w-2 h-2 rounded-full bg-teal-400" />}
                                            </div>
                                            <span className={`text-sm ${newWorkflowType === 'save' ? 'text-white' : 'text-white/60'}`}>
                                                {'保存流程'}
                                            </span>
                                        </label>
                                        <label
                                            className={`flex-1 flex items-center gap-3 p-3 rounded-xl cursor-pointer transition-all ${newWorkflowType === 'create'
                                                ? 'bg-teal-500/10 border border-teal-500/30'
                                                : 'bg-white/[0.02] border border-white/[0.06] hover:border-white/[0.12]'
                                                }`}
                                        >
                                            <input
                                                type="radio"
                                                name="workflowType"
                                                value="create"
                                                checked={newWorkflowType === 'create'}
                                                onChange={(e) => setNewWorkflowType(e.target.value)}
                                                className="sr-only"
                                            />
                                            <div className={`w-4 h-4 rounded-full border-2 flex items-center justify-center ${newWorkflowType === 'create' ? 'border-teal-400' : 'border-white/30'
                                                }`}>
                                                {newWorkflowType === 'create' && <div className="w-2 h-2 rounded-full bg-teal-400" />}
                                            </div>
                                            <span className={`text-sm ${newWorkflowType === 'create' ? 'text-white' : 'text-white/60'}`}>
                                                {'创建流程'}
                                            </span>
                                        </label>
                                    </div>
                                </div>

                                {/* 绑定模块类型 */}
                                <div className="mb-6">
                                    <label className="block text-sm font-medium text-white/70 mb-2">
                                        {'绑定模块类型'}
                                    </label>
                                    <div className="relative">
                                        <select
                                            className="w-full px-4 py-3 bg-white/[0.03] border border-white/[0.08] rounded-xl text-white focus:outline-none focus:border-teal-500/50 focus:ring-2 focus:ring-teal-500/10 transition-all appearance-none cursor-pointer"
                                            value={newWorkflowTargetModuleTypeId}
                                            onChange={(e) => setNewWorkflowTargetModuleTypeId(e.target.value)}
                                        >
                                            <option value="" className="bg-[#1a1a1a]">{'请选择'}</option>
                                            {moduleTypes
                                                .filter(mt => {
                                                    if (newWorkflowType === 'save') {
                                                        return !mt.saveWorkflowId || !workflows.some(w => w.id === mt.saveWorkflowId && w.id !== method?.workflowId)
                                                    } else {
                                                        return !mt.createWorkflowId || !workflows.some(w => w.id === mt.createWorkflowId && w.id !== method?.workflowId)
                                                    }
                                                })
                                                .map(mt => (
                                                    <option key={mt.id} value={mt.id} className="bg-[#1a1a1a]">
                                                        {mt.name}
                                                    </option>
                                                ))}
                                        </select>
                                        <div className="absolute right-4 top-1/2 -translate-y-1/2 pointer-events-none text-white/40">
                                            <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M19 9l-7 7-7-7" />
                                            </svg>
                                        </div>
                                    </div>
                                    <p className="mt-2 text-xs text-white/40">
                                        {newWorkflowType === 'save'
                                            ? '保存流程：模块保存时触发的处理逻辑'
                                            : '创建流程：模块创建时触发的处理逻辑'}
                                    </p>
                                </div>

                                {/* 按钮 */}
                                <div className="flex justify-end gap-3">
                                    <button
                                        onClick={() => setShowNewWorkflowModal(false)}
                                        className="px-5 py-2.5 text-sm font-medium text-white/60 hover:text-white hover:bg-white/[0.05] rounded-xl transition-all"
                                    >
                                        {'取消'}
                                    </button>
                                    <button
                                        onClick={handleCreateWorkflow}
                                        className="px-5 py-2.5 text-sm font-medium text-white rounded-xl transition-all"
                                        style={{
                                            background: 'linear-gradient(135deg, #0D9488 0%, #14B8A6 100%)',
                                            boxShadow: '0 4px 15px rgba(13, 148, 136, 0.3)'
                                        }}
                                    >
                                        {'创建'}
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                )}


                {/* Toast 通知 */}
                <ToastNotification notification={notification} />
            </div>
        </div>
    )
}

function NovelCreationMethodDetailContent() {
    return (
        <ReactFlowProvider>
            <NovelCreationMethodDetailPageContent />
        </ReactFlowProvider>
    )
}

export default NovelCreationMethodDetailContent
