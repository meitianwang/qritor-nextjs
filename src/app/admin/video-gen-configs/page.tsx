'use client'

import { useState, useEffect } from 'react'
import { adminFetch } from '@/lib/admin-utils'
import { useToast } from '@/hooks/useToast'
import ToastNotification from '@/components/ToastNotification'
import VideoGenConfigModal from '@/components/admin/VideoGenConfigModal'
import TestResultModal from '@/components/admin/TestResultModal'
import ConfirmModal from '@/components/admin/ConfirmModal'
import { PlusIcon } from '@/components/admin/icons'

interface VideoGenConfig {
    id: number
    provider: string
    modelName: string
    displayName?: string
    apiBase: string
    apiKey: string
    isDefault: boolean
    defaultWidth: number
    defaultHeight: number
    maxWidth: number
    maxHeight: number
    defaultDuration: number
    maxDuration: number
    supportsAudio: boolean
    creditRate: number
    enabled: boolean
}

interface TestResult {
    success: boolean
    message: string
    details: string | null
    responseTime: number | null
}

// 视频生成图标
const VideoGenIcon = ({ className }: { className?: string }) => (
    <svg className={className} fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M15 10l4.553-2.276A1 1 0 0121 8.618v6.764a1 1 0 01-1.447.894L15 14M5 18h8a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v8a2 2 0 002 2z" />
    </svg>
)

/**
 * 运营后台 - 生视频模型配置管理页面
 */
export default function VideoGenConfigPage() {
    const { notification, showToast } = useToast()
    const [configs, setConfigs] = useState<VideoGenConfig[]>([])
    const [loading, setLoading] = useState(true)
    const [testingId, setTestingId] = useState<number | null>(null)
    const [modalOpen, setModalOpen] = useState(false)
    const [editingConfig, setEditingConfig] = useState<VideoGenConfig | null>(null)
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
            const response = await adminFetch('/api/admin/video-gen-configs')
            const data = await response.json()
            if (data.code === 200) {
                setConfigs(data.data || [])
            }
        } catch (error) {
            console.error('获取生视频模型配置失败:', error)
        } finally {
            setLoading(false)
        }
    }


    const handleAdd = () => {
        setEditingConfig(null)
        setModalOpen(true)
    }

    const handleEdit = (config: VideoGenConfig) => {
        setEditingConfig(config)
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
            const response = await adminFetch(`/api/admin/video-gen-configs/${deletingId}`, { method: 'DELETE' })
            const data = await response.json()
            if (data.code === 200) {
                fetchConfigs()
            } else {
                showToast('error', '删除失败: ' + data.message)
            }
        } catch (error) {
            console.error('删除生视频模型配置失败:', error)
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
            const response = await adminFetch(`/api/admin/video-gen-configs/${id}/test`, { method: 'POST' })
            const data = await response.json()
            const responseTime = Date.now() - startTime
            setTestResult({
                success: data.code === 200,
                message: data.message || (data.code === 200 ? '连接测试成功' : '连接测试失败'),
                details: data.details || null,
                responseTime: responseTime
            })
        } catch (error) {
            console.error('测试生视频模型配置失败:', error)
            const err = error as Error
            setTestResult({ success: false, message: '网络错误或服务器无响应', details: err.message, responseTime: null })
        } finally {
            setTestingId(null)
        }
    }

    return (
        <div className="admin-page">
            <div className="admin-page-header">
                <div>
                    <h1 className="admin-page-title">生视频模型配置</h1>
                    <p className="admin-page-subtitle">管理系统使用的视频生成模型配置，支持 Runway、Pika、可灵、Sora 等</p>
                </div>
                <button className="admin-btn admin-btn-primary" onClick={handleAdd}>
                    <PlusIcon className="w-5 h-5" />
                    添加配置
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
                        <VideoGenIcon className="w-12 h-12" />
                        <p>暂无生视频模型配置</p>
                        <button className="admin-btn admin-btn-primary" onClick={handleAdd}>添加配置</button>
                    </div>
                ) : (
                    <div className="admin-cards">
                        {configs.map(config => (
                            <div key={config.id} className="admin-card">
                                <div className="admin-card-header">
                                    <div className="admin-card-icon">
                                        <VideoGenIcon className="w-6 h-6" />
                                    </div>
                                    <div className="admin-card-title-group">
                                        <h3 className="admin-card-title">{config.displayName || config.provider}</h3>
                                        <span className="admin-card-badge">{config.modelName}</span>
                                    </div>
                                </div>
                                <div className="admin-card-body">
                                    <div className="admin-card-row">
                                        <span className="admin-card-label">API Base</span>
                                        <span className="admin-card-value">{config.apiBase || '默认'}</span>
                                    </div>
                                    <div className="admin-card-row">
                                        <span className="admin-card-label">API Key</span>
                                        <span className="admin-card-value admin-card-secret">{config.apiKey}</span>
                                    </div>
                                    <div className="admin-card-row">
                                        <span className="admin-card-label">默认尺寸</span>
                                        <span className="admin-card-value">{config.defaultWidth} x {config.defaultHeight}</span>
                                    </div>
                                    <div className="admin-card-row">
                                        <span className="admin-card-label">时长范围</span>
                                        <span className="admin-card-value">{config.defaultDuration}s - {config.maxDuration}s</span>
                                    </div>
                                    <div className="admin-card-row">
                                        <span className="admin-card-label">积分倍率</span>
                                        <span className="admin-card-value">{config.creditRate ?? 1.0}x</span>
                                    </div>
                                    <div className="admin-card-row">
                                        <span className="admin-card-label">状态</span>
                                        <span className="admin-card-value">
                                            <span className={`inline-flex items-center px-2 py-0.5 rounded-full text-xs font-medium ${config.enabled ? 'bg-green-100 text-green-800' : 'bg-gray-100 text-gray-800'}`}>
                                                {config.enabled ? '启用' : '禁用'}
                                            </span>
                                        </span>
                                    </div>
                                </div>
                                <div className="admin-card-footer">
                                    <button className="admin-btn admin-btn-success admin-btn-sm" onClick={() => handleTest(config.id)} disabled={testingId === config.id}>
                                        {testingId === config.id ? '测试中...' : '测试'}
                                    </button>
                                    <button className="admin-btn admin-btn-secondary admin-btn-sm" onClick={() => handleEdit(config)}>编辑</button>
                                    <button className="admin-btn admin-btn-danger admin-btn-sm" onClick={() => handleDeleteClick(config.id)}>删除</button>
                                </div>
                            </div>
                        ))}
                    </div>
                )}
            </div>

            <VideoGenConfigModal isOpen={modalOpen} onClose={() => setModalOpen(false)} config={editingConfig} onSave={handleSave} showToast={showToast} />
            <TestResultModal isOpen={testResultOpen} onClose={() => setTestResultOpen(false)} result={testResult} loading={testingId !== null} />
            <ConfirmModal isOpen={deleteConfirmOpen} onClose={handleDeleteClose} onConfirm={handleDeleteConfirm} title="删除配置" message="确定要删除这个生视频模型配置吗？此操作不可恢复。" confirmText="删除" cancelText="取消" isDanger={true} />
            <ToastNotification notification={notification} />
        </div>
    )
}
