'use client'

import React, { useState, useRef, useCallback, useEffect } from 'react'
import ReactFlow, {
    MiniMap,
    Controls,
    Background,
    addEdge,
    MarkerType,
    useReactFlow,
    Node,
    Edge,
    Connection,
    NodeChange,
    EdgeChange
} from 'reactflow'
import 'reactflow/dist/style.css'
import CustomNode from './CustomNode'

const nodeTypes = {
    custom: CustomNode
}

interface NodeActionItem {
    action: string
    title: string
    config?: Record<string, unknown>
}

interface Workflow {
    name?: string
    description?: string
    [key: string]: unknown
}

interface MenuPosition {
    x: number
    y: number
    canvasX: number
    canvasY: number
    sourceNodeId: string
}

interface TempEdge {
    nodeId: string
    edgeId: string
}

interface ConnectStartInfo {
    nodeId: string
    handleType: string
}

interface WorkflowCanvasProps {
    activeWorkflow: Workflow | null
    nodes: any[]
    edges: any[]
    setNodes: any
    setEdges: any
    onNodesChange: (changes: NodeChange[]) => void
    onEdgesChange: (changes: EdgeChange[]) => void
    setSelectedNode: React.Dispatch<React.SetStateAction<any>>
    setNodeConfig: React.Dispatch<React.SetStateAction<Record<string, unknown>>>
    handleSaveWorkflow: () => void
    nodeActions: NodeActionItem[]
    handleDeleteNode: () => void
    method: Record<string, unknown> | null
    handlePublish: () => void
    publishing: boolean
}

const WorkflowCanvas: React.FC<WorkflowCanvasProps> = ({
    activeWorkflow,
    nodes,
    edges,
    setNodes,
    setEdges,
    onNodesChange,
    onEdgesChange,
    setSelectedNode,
    setNodeConfig,
    handleSaveWorkflow,
    nodeActions,
    handleDeleteNode,
    method,
    handlePublish,
    publishing
}) => {
    const reactFlowWrapper = useRef<HTMLDivElement>(null)
    const [connectStart, setConnectStart] = useState<ConnectStartInfo | null>(null)
    const [menuPosition, setMenuPosition] = useState<MenuPosition | null>(null)
    const [tempEdge, setTempEdge] = useState<TempEdge | null>(null)
    const connectionSuccessful = useRef<boolean>(false)
    const { screenToFlowPosition, getNodes } = useReactFlow()
    const [copiedNode, setCopiedNode] = useState<Node | null>(null)
    const mousePositionRef = useRef<{ x: number; y: number }>({ x: 0, y: 0 })

    const onMouseMove = useCallback((event: React.MouseEvent) => {
        mousePositionRef.current = { x: event.clientX, y: event.clientY }
    }, [])

    useEffect(() => {
        const handleKeyDown = (event: KeyboardEvent) => {
            if (event.target instanceof HTMLElement && (event.target.tagName === 'INPUT' || event.target.tagName === 'TEXTAREA' || event.target.isContentEditable)) {
                return
            }

            // Copy: Ctrl+C or Cmd+C
            if ((event.metaKey || event.ctrlKey) && event.key === 'c') {
                const nodes = getNodes()
                const selectedNode = nodes.find((n) => n.selected)
                if (selectedNode) {
                    setCopiedNode(selectedNode)
                }
            }

            // Paste: Ctrl+V or Cmd+V
            if ((event.metaKey || event.ctrlKey) && event.key === 'v') {
                if (copiedNode) {
                    const position = screenToFlowPosition(mousePositionRef.current)

                    const newNode: Node = {
                        ...copiedNode,
                        id: `node_${Date.now()}`,
                        position: position,
                        selected: true,
                        data: JSON.parse(JSON.stringify(copiedNode.data))
                    }

                    setNodes((nds: any[]) => nds.map((n) => ({ ...n, selected: false })).concat(newNode))
                    setSelectedNode(newNode)
                    setNodeConfig(newNode.data.config || {})
                }
            }
        }

        window.addEventListener('keydown', handleKeyDown)
        return () => {
            window.removeEventListener('keydown', handleKeyDown)
        }
    }, [copiedNode, getNodes, screenToFlowPosition, setNodes, setSelectedNode, setNodeConfig])

    const onConnect = useCallback((params: Connection) => {
        connectionSuccessful.current = true
        setEdges((eds: any[]) => addEdge({ ...params, type: 'default', animated: true, markerEnd: { type: MarkerType.ArrowClosed, width: 20, height: 20 }, style: { strokeWidth: 2, stroke: '#0ea5e9' } }, eds))
        setConnectStart(null)
        setMenuPosition(null)
    }, [setEdges])

    const onConnectStart = useCallback((_event: React.MouseEvent | React.TouchEvent, { nodeId, handleType }: { nodeId: string | null; handleType: string | null }) => {
        connectionSuccessful.current = false
        setConnectStart({ nodeId: nodeId || '', handleType: handleType || '' })
    }, [])

    const onConnectEnd = useCallback((event: MouseEvent | TouchEvent) => {
        if (connectionSuccessful.current) {
            connectionSuccessful.current = false
            setConnectStart(null)
            return
        }
        if (!connectStart) return

        const target = event.target as HTMLElement
        const targetIsPane = target.classList.contains('react-flow__pane') || target.classList.contains('react-flow__renderer') || target.closest('.react-flow__pane')
        if (targetIsPane) {
            const clientX = 'clientX' in event ? event.clientX : (event as TouchEvent).touches[0].clientX
            const clientY = 'clientY' in event ? event.clientY : (event as TouchEvent).touches[0].clientY
            const position = screenToFlowPosition({ x: clientX, y: clientY })
            const tempNodeId = 'temp-target-node'
            const tempNode: Node = { id: tempNodeId, type: 'custom', position: { x: position.x, y: position.y }, data: { label: '', type: 'temp' }, style: { opacity: 0, pointerEvents: 'none' } }
            const tempEdgeObj: Edge = { id: 'temp-edge', source: connectStart.nodeId, target: tempNodeId, type: 'default', animated: true, style: { strokeWidth: 2, stroke: '#0ea5e9', strokeDasharray: '5,5' } }
            setNodes((nds: any[]) => [...nds, tempNode])
            setEdges((eds: any[]) => [...eds, tempEdgeObj])
            setTempEdge({ nodeId: tempNodeId, edgeId: 'temp-edge' })
            setMenuPosition({ x: clientX, y: clientY, canvasX: position.x, canvasY: position.y, sourceNodeId: connectStart.nodeId })
        }
        setConnectStart(null)
    }, [connectStart, screenToFlowPosition, setNodes, setEdges])

    const handleCreateNodeFromMenu = useCallback((nodeAction: NodeActionItem) => {
        if (!menuPosition) return
        const newNode: Node = { id: `node_${Date.now()}`, type: 'custom', position: { x: menuPosition.canvasX, y: menuPosition.canvasY }, data: { label: nodeAction.title, type: nodeAction.action, config: {} } }
        setNodes((nds: any[]) => {
            const filtered = tempEdge ? nds.filter((n) => n.id !== tempEdge.nodeId) : nds
            return [...filtered, newNode]
        })
        const newEdge: Edge = { id: `edge_${Date.now()}`, source: menuPosition.sourceNodeId, target: newNode.id, type: 'default', animated: true, markerEnd: { type: MarkerType.ArrowClosed, width: 20, height: 20 }, style: { strokeWidth: 2, stroke: '#0ea5e9' } }
        setEdges((eds: any[]) => {
            const filtered = tempEdge ? eds.filter((e) => e.id !== tempEdge.edgeId) : eds
            return [...filtered, newEdge]
        })
        setMenuPosition(null)
        setTempEdge(null)
    }, [menuPosition, setNodes, setEdges, tempEdge])

    const onNodeClick = useCallback((_event: React.MouseEvent, node: Node) => {
        setSelectedNode(node)
        setNodeConfig(node.data.config || {})
    }, [setSelectedNode, setNodeConfig])

    const onPaneClick = useCallback(() => {
        setSelectedNode(null)
    }, [setSelectedNode])

    const onDragOver = useCallback((event: React.DragEvent) => {
        event.preventDefault()
        event.dataTransfer.dropEffect = 'move'
    }, [])

    const onDrop = useCallback((event: React.DragEvent) => {
        event.preventDefault()
        const nodeActionData = event.dataTransfer.getData('application/reactflow')
        if (!nodeActionData) return
        const nodeAction: NodeActionItem = JSON.parse(nodeActionData)
        const position = screenToFlowPosition({ x: event.clientX, y: event.clientY })

        // Use the config from drag data if available (for module types)
        const config = nodeAction.config || {}

        const newNode: Node = {
            id: `node_${Date.now()}`,
            type: 'custom',
            position,
            data: {
                label: nodeAction.title,
                type: nodeAction.action,
                config: config
            }
        }
        setNodes((nds: any[]) => nds.concat(newNode))
    }, [setNodes, screenToFlowPosition])

    if (!activeWorkflow) {
        return (
            <div className="flex-1 flex items-center justify-center bg-gradient-to-br from-[#0a0a0a] to-[#111111]">
                <div className="text-center">
                    <div className="relative w-16 h-16 mx-auto mb-6">
                        <div className="absolute inset-0 rounded-full border-2 border-teal-500/20 animate-ping" />
                        <div className="absolute inset-2 rounded-full border-2 border-teal-500/40 animate-pulse" />
                        <div
                            className="absolute inset-4 rounded-full animate-spin"
                            style={{
                                background: 'conic-gradient(from 0deg, transparent, #0D9488)'
                            }}
                        />
                    </div>
                    <p className="text-white/60 text-sm">{'加载中...'}</p>
                </div>
            </div>
        )
    }

    return (
        <div className="flex-1 flex flex-row relative h-full">
            {/* 保存工作流按钮 - 屏幕中央底部 */}
            <div className="absolute bottom-6 left-1/2 -translate-x-1/2 z-10">
                <button
                    onClick={handleSaveWorkflow}
                    className="px-5 py-2.5 bg-white/[0.06] hover:bg-white/[0.1] border border-white/[0.12] hover:border-teal-500/40 rounded-lg font-medium text-white/80 hover:text-white text-sm transition-all flex items-center gap-2 backdrop-blur-sm"
                >
                    <svg className="w-4 h-4 text-teal-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M8 7H5a2 2 0 00-2 2v9a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-3m-1 4l-3 3m0 0l-3-3m3 3V4" />
                    </svg>
                    {'保存工作流'}
                </button>
            </div>

            {/* ReactFlow Canvas */}
            <div className="flex-1 h-full" ref={reactFlowWrapper} onMouseMove={onMouseMove}>
                <ReactFlow
                    nodes={nodes}
                    edges={edges}
                    onNodesChange={onNodesChange}
                    onEdgesChange={onEdgesChange}
                    onConnect={onConnect}
                    onConnectStart={onConnectStart}
                    onConnectEnd={onConnectEnd}
                    onNodeClick={onNodeClick}
                    onPaneClick={onPaneClick}
                    onDrop={onDrop}
                    onDragOver={onDragOver}
                    nodeTypes={nodeTypes}
                    onKeyDown={(e: React.KeyboardEvent) => {
                        if (e.key === 'Backspace' || e.key === 'Delete') {
                            handleDeleteNode()
                        }
                    }}
                    fitView
                    attributionPosition="bottom-left"
                    className="workflow-canvas"
                >
                    <Background
                        gap={24}
                        size={1}
                        color="rgba(255, 255, 255, 0.03)"
                        style={{ backgroundColor: '#0a0a0a' }}
                    />
                    <Controls
                        className="workflow-controls"
                        style={{
                            background: 'rgba(17, 17, 17, 0.9)',
                            backdropFilter: 'blur(10px)',
                            border: '1px solid rgba(255, 255, 255, 0.08)',
                            borderRadius: '12px',
                            boxShadow: '0 4px 20px rgba(0, 0, 0, 0.4)'
                        }}
                    />
                    <MiniMap
                        className="workflow-minimap"
                        nodeColor={(node: Node) => {
                            return node.selected ? '#14B8A6' : 'rgba(13, 148, 136, 0.6)'
                        }}
                        maskColor="rgba(0, 0, 0, 0.6)"
                        style={{
                            background: 'rgba(17, 17, 17, 0.9)',
                            backdropFilter: 'blur(10px)',
                            border: '1px solid rgba(255, 255, 255, 0.08)',
                            borderRadius: '12px',
                            boxShadow: '0 4px 20px rgba(0, 0, 0, 0.4)'
                        }}
                    />
                </ReactFlow>
            </div>

            {/* Node Selection Menu - Glass Effect */}
            {menuPosition && (
                <>
                    <div
                        className="fixed inset-0 z-[89]"
                        onClick={() => {
                            if (tempEdge) {
                                setNodes((nds: any[]) => nds.filter((n) => n.id !== tempEdge.nodeId))
                                setEdges((eds: any[]) => eds.filter((e) => e.id !== tempEdge.edgeId))
                                setTempEdge(null)
                            }
                            setMenuPosition(null)
                        }}
                    />
                    <div
                        className="fixed z-[90] max-h-80 overflow-y-auto"
                        style={{
                            left: `${menuPosition.x}px`,
                            top: `${menuPosition.y}px`,
                            minWidth: '240px',
                            background: 'rgba(17, 17, 17, 0.95)',
                            backdropFilter: 'blur(20px)',
                            border: '1px solid rgba(255, 255, 255, 0.1)',
                            borderRadius: '16px',
                            boxShadow: '0 20px 60px rgba(0, 0, 0, 0.5), 0 0 1px rgba(255, 255, 255, 0.1)'
                        }}
                        onClick={(e: React.MouseEvent) => e.stopPropagation()}
                    >
                        {/* 顶部渐变装饰 */}
                        <div
                            className="absolute top-0 left-4 right-4 h-[2px] rounded-full"
                            style={{
                                background: 'linear-gradient(90deg, #0D9488 0%, #14B8A6 50%, #06B6D4 100%)'
                            }}
                        />

                        <div className="px-4 py-3 border-b border-white/[0.06]">
                            <p className="text-xs font-semibold text-white flex items-center gap-2">
                                <svg className="w-4 h-4 text-teal-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6" />
                                </svg>
                                {'选择节点'}
                            </p>
                        </div>

                        <div className="py-2">
                            {nodeActions.map((action) => (
                                <button
                                    key={action.action}
                                    onClick={() => handleCreateNodeFromMenu(action)}
                                    className="w-full px-4 py-2.5 text-left hover:bg-white/[0.05] transition-colors flex items-center gap-3 group"
                                >
                                    <div
                                        className="w-8 h-8 rounded-lg flex items-center justify-center flex-shrink-0 transition-all group-hover:scale-110"
                                        style={{
                                            background: 'rgba(13, 148, 136, 0.1)',
                                            border: '1px solid rgba(20, 184, 166, 0.2)'
                                        }}
                                    >
                                        <svg className="w-4 h-4 text-teal-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                                        </svg>
                                    </div>
                                    <div className="flex-1 min-w-0">
                                        <div className="text-sm font-medium text-white truncate group-hover:text-teal-300 transition-colors">
                                            {action.title}
                                        </div>
                                    </div>
                                </button>
                            ))}

                            {nodeActions.length === 0 && (
                                <div className="px-4 py-6 text-xs text-white/40 text-center">
                                    {'暂无节点类型'}
                                </div>
                            )}
                        </div>
                    </div>
                </>
            )}
        </div>
    )
}

export default WorkflowCanvas
