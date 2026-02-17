'use client'

import { useState, useEffect } from 'react'
import { adminFetch } from '@/lib/admin-utils'
import { useToast } from '@/hooks/useToast'
import ToastNotification from '@/components/ToastNotification'
import LlmConfigModal from '@/components/admin/LlmConfigModal'
import TestResultModal from '@/components/admin/TestResultModal'
import ConfirmModal from '@/components/admin/ConfirmModal'

interface LlmConfig {
    id: number
    modelName: string
    displayName: string
    platform?: string
    pricingMultiplier: number
    enabled: boolean
    isDefault: boolean
    tags: string[]
    normalizationFactor: number
    contextWindow?: number
}

interface TestResult {
    success: boolean
    message: string
    details: string | null
    responseTime: number | null
}

// CpuChip 图标 (内联)
const CpuChipIcon = ({ className }: { className?: string }) => (
    <svg className={className} fill="none" stroke="currentColor" strokeWidth="2" viewBox="0 0 24 24">
        <path strokeLinecap="round" strokeLinejoin="round" d="M9 3v2m6-2v2M9 19v2m6-2v2M5 9H3m2 6H3m18-6h-2m2 6h-2M7 19h10a2 2 0 002-2V7a2 2 0 00-2-2H7a2 2 0 00-2 2v10a2 2 0 002 2zM9 9h6v6H9V9z" />
    </svg>
)

/**
 * 运营后台 - 模型配置管理页面
 * 手动添加和管理模型配置，包括展示名称和计费参数
 */
export default function LlmConfigPage() {
    const { notification, showToast } = useToast()
    const [configs, setConfigs] = useState<LlmConfig[]>([])
    const [loading, setLoading] = useState(true)
    const [testingId, setTestingId] = useState<number | null>(null)
    const [modalOpen, setModalOpen] = useState(false)
    const [modalMode, setModalMode] = useState<'create' | 'edit'>('edit')
    const [editingConfig, setEditingConfig] = useState<LlmConfig | null>(null)
    const [testResultOpen, setTestResultOpen] = useState(false)
    const [testResult, setTestResult] = useState<TestResult | null>(null)
    const [deleteConfirmOpen, setDeleteConfirmOpen] = useState(false)
    const [deletingId, setDeletingId] = useState<number | null>(null)

    useEffect(() => {
        fetchConfigs()
    }, [])

    const fetchConfigs = async () => {
        try {
            setLoading(true)
            const response = await adminFetch('/api/admin/llm-configs')
            const data = await response.json()
            if (data.code === 200) {
                // API 返回 ownedBy (from owned_by)，映射为 platform
                const items = (data.data || []).map((item: Record<string, unknown>) => ({
                    ...item,
                    platform: item.ownedBy || item.platform,
                }))
                setConfigs(items)
            }
        } catch (error) {
            console.error('获取 LLM 配置失败:', error)
        } finally {
            setLoading(false)
        }
    }

    const handleAdd = () => {
        setEditingConfig(null)
        setModalMode('create')
        setModalOpen(true)
    }

    const handleEdit = (config: LlmConfig) => {
        setEditingConfig(config)
        setModalMode('edit')
        setModalOpen(true)
    }

    const handleSave = () => {
        fetchConfigs()
        setModalOpen(false)
        setEditingConfig(null)
    }

    const handleDeleteClick = (id: number) => {
        setDeletingId(id)
        setDeleteConfirmOpen(true)
    }

    const handleDeleteConfirm = async () => {
        if (!deletingId) return

        try {
            const response = await adminFetch(`/api/admin/llm-configs/${deletingId}`, {
                method: 'DELETE'
            })
            const data = await response.json()
            if (data.code === 200) {
                fetchConfigs()
            } else {
                showToast('error', '删除失败: ' + data.message)
            }
        } catch (error) {
            console.error('删除 LLM 配置失败:', error)
            showToast('error', '删除失败，请重试')
        }
    }

    const handleDeleteClose = () => {
        setDeleteConfirmOpen(false)
        setDeletingId(null)
    }

    const handleTest = async (id: number) => {
        try {
            setTestingId(id)
            setTestResult(null)
            setTestResultOpen(true)

            const startTime = Date.now()
            const response = await adminFetch(`/api/admin/llm-configs/${id}/test`, {
                method: 'POST'
            })
            const data = await response.json()
            const responseTime = Date.now() - startTime

            setTestResult({
                success: data.code === 200,
                message: data.message || (data.code === 200 ? '连接测试成功' : '连接测试失败'),
                details: data.details || null,
                responseTime: responseTime
            })
        } catch (error) {
            console.error('测试 LLM 配置失败:', error)
            const err = error as Error
            setTestResult({
                success: false,
                message: '网络错误或服务器无响应',
                details: err.message,
                responseTime: null
            })
        } finally {
            setTestingId(null)
        }
    }

    return (
        <div className="admin-page">
            <div className="admin-page-header">
                <div>
                    <h1 className="admin-page-title">模型配置</h1>
                    <p className="admin-page-subtitle">
                        管理 LLM 模型的展示名称和计费参数
                    </p>
                </div>
                <button
                    className="admin-btn admin-btn-primary"
                    onClick={handleAdd}
                >
                    <svg className="w-5 h-5" fill="none" stroke="currentColor" strokeWidth="2" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" d="M12 4.5v15m7.5-7.5h-15" />
                    </svg>
                    添加模型
                </button>
            </div>

            <div className="admin-content">
                {loading ? (
                    <div className="admin-loading-container">
                        <div className="admin-loading-spinner"></div>
                        <p>加载中...</p>
                    </div>
                ) : configs.length === 0 ? (
                    <div className="admin-empty">
                        <CpuChipIcon className="w-12 h-12" />
                        <p>暂无模型配置</p>
                        <p style={{ fontSize: '0.85rem', color: 'rgba(255,255,255,0.5)', marginTop: '8px' }}>
                            点击「添加模型」创建第一个模型配置
                        </p>
                        <div style={{ marginTop: '16px' }}>
                            <button
                                className="admin-btn admin-btn-primary"
                                onClick={handleAdd}
                            >
                                <svg className="w-5 h-5" fill="none" stroke="currentColor" strokeWidth="2" viewBox="0 0 24 24">
                                    <path strokeLinecap="round" strokeLinejoin="round" d="M12 4.5v15m7.5-7.5h-15" />
                                </svg>
                                添加模型
                            </button>
                        </div>
                    </div>
                ) : (
                    <div className="admin-cards">
                        {configs.map(config => (
                            <div key={config.id} className={`admin-card ${!config.enabled ? 'opacity-50' : ''}`}>
                                <div className="admin-card-header">
                                    <div className="admin-card-icon">
                                        <CpuChipIcon className="w-6 h-6" />
                                    </div>
                                    <div className="admin-card-title-group">
                                        <h3 className="admin-card-title">{config.displayName || config.modelName}</h3>
                                        <span className="admin-card-badge">{config.modelName}</span>
                                    </div>
                                </div>
                                <div className="admin-card-body">
                                    {config.platform && (
                                        <div className="admin-card-row">
                                            <span className="admin-card-label">平台</span>
                                            <span className="admin-card-value">{config.platform}</span>
                                        </div>
                                    )}
                                    <div className="admin-card-row">
                                        <span className="admin-card-label">积分倍率</span>
                                        <span className="admin-card-value">{config.pricingMultiplier}x</span>
                                    </div>
                                    {config.contextWindow && (
                                        <div className="admin-card-row">
                                            <span className="admin-card-label">上下文窗口</span>
                                            <span className="admin-card-value">{config.contextWindow.toLocaleString()} tokens</span>
                                        </div>
                                    )}
                                    <div className="admin-card-row">
                                        <span className="admin-card-label">状态</span>
                                        <span className="admin-card-value">
                                            <span className={`inline-flex items-center px-2 py-0.5 rounded-full text-xs font-medium ${config.enabled ? 'bg-green-100 text-green-800' : 'bg-gray-100 text-gray-600'}`}>
                                                {config.enabled ? '启用' : '禁用'}
                                            </span>
                                            {!!config.isDefault && (
                                                <span className="inline-flex items-center px-2 py-0.5 rounded-full text-xs font-medium bg-blue-100 text-blue-800 ml-2">
                                                    默认
                                                </span>
                                            )}
                                        </span>
                                    </div>
                                </div>
                                <div className="admin-card-footer">
                                    <button
                                        className="admin-btn admin-btn-success admin-btn-sm"
                                        onClick={() => handleTest(config.id)}
                                        disabled={testingId === config.id}
                                    >
                                        {testingId === config.id ? '测试中...' : '测试'}
                                    </button>
                                    <button
                                        className="admin-btn admin-btn-secondary admin-btn-sm"
                                        onClick={() => handleEdit(config)}
                                    >
                                        编辑
                                    </button>
                                    <button
                                        className="admin-btn admin-btn-danger admin-btn-sm"
                                        onClick={() => handleDeleteClick(config.id)}
                                    >
                                        删除
                                    </button>
                                </div>
                            </div>
                        ))}
                    </div>
                )}
            </div>

            {/* LLM 配置弹窗 */}
            <LlmConfigModal
                isOpen={modalOpen}
                onClose={() => setModalOpen(false)}
                config={editingConfig}
                onSave={handleSave}
                apiBasePath="/api/admin"
                showToast={showToast}
                mode={modalMode}
            />

            {/* 测试结果弹窗 */}
            <TestResultModal
                isOpen={testResultOpen}
                onClose={() => setTestResultOpen(false)}
                result={testResult}
                loading={testingId !== null}
            />

            {/* 删除确认弹窗 */}
            <ConfirmModal
                isOpen={deleteConfirmOpen}
                onClose={handleDeleteClose}
                onConfirm={handleDeleteConfirm}
                title="删除配置"
                message="确定要删除这个模型配置吗？此操作不可恢复。"
                confirmText="删除"
                cancelText="取消"
                isDanger={true}
            />

            {/* Toast 通知 */}
            <ToastNotification notification={notification} />
        </div>
    )
}
