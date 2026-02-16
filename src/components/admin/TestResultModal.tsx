'use client'

interface TestResult {
    success: boolean
    message: string
    details?: string | null
    responseTime?: number | null
}

interface TestResultModalProps {
    isOpen: boolean
    onClose: () => void
    result: TestResult | null
    loading: boolean
}

const TestResultModal = ({ isOpen, onClose, result, loading }: TestResultModalProps) => {
    if (!isOpen) return null

    return (
        <div className="admin-modal-overlay" onClick={onClose}>
            <div className="admin-modal" onClick={e => e.stopPropagation()} style={{ maxWidth: '500px' }}>
                <div className="admin-modal-header">
                    <h3 className="admin-modal-title" style={{ display: 'flex', alignItems: 'center', gap: '12px' }}>
                        {loading ? (
                            <div className="admin-loading-spinner" style={{ width: '24px', height: '24px' }}></div>
                        ) : result?.success ? (
                            <svg style={{ width: '24px', height: '24px', color: '#10b981' }} fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                            </svg>
                        ) : (
                            <svg style={{ width: '24px', height: '24px', color: '#ef4444' }} fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-2.5L13.732 4c-.77-.833-1.964-.833-2.732 0L3.732 16.5c-.77.833.192 2.5 1.732 2.5z" />
                            </svg>
                        )}
                        {loading ? '测试中...' : '测试结果'}
                    </h3>
                    <button className="admin-modal-close" onClick={onClose}>&times;</button>
                </div>

                <div style={{ marginBottom: '24px' }}>
                    {loading ? (
                        <div style={{ textAlign: 'center', padding: '32px 0' }}>
                            <div style={{ color: 'rgba(255,255,255,0.6)' }}>
                                正在测试连接，请稍候...
                            </div>
                        </div>
                    ) : result ? (
                        <div>
                            <div style={{
                                padding: '16px',
                                borderRadius: '12px',
                                background: result.success ? 'rgba(16, 185, 129, 0.1)' : 'rgba(239, 68, 68, 0.1)',
                                border: result.success ? '1px solid rgba(16, 185, 129, 0.3)' : '1px solid rgba(239, 68, 68, 0.3)',
                                marginBottom: '16px'
                            }}>
                                <div style={{
                                    fontWeight: '500',
                                    color: result.success ? '#10b981' : '#ef4444'
                                }}>
                                    {result.success ? '连接成功' : '连接失败'}
                                </div>
                                <div style={{
                                    fontSize: '14px',
                                    marginTop: '8px',
                                    color: result.success ? '#10b981' : '#ef4444'
                                }}>
                                    {result.message || (result.success ? 'LLM配置连接正常，可以正常使用。' : '请检查配置信息是否正确。')}
                                </div>
                            </div>

                            {result.details && (
                                <div style={{
                                    background: 'rgba(255,255,255,0.03)',
                                    borderRadius: '12px',
                                    padding: '16px',
                                    marginBottom: '16px'
                                }}>
                                    <div style={{ fontSize: '14px', fontWeight: '500', color: '#fff', marginBottom: '8px' }}>
                                        详细信息：
                                    </div>
                                    <div style={{ fontSize: '14px', color: 'rgba(255,255,255,0.6)', whiteSpace: 'pre-wrap' }}>
                                        {result.details}
                                    </div>
                                </div>
                            )}

                            {result.responseTime && (
                                <div style={{ fontSize: '12px', color: 'rgba(255,255,255,0.5)' }}>
                                    响应时间: {result.responseTime}ms
                                </div>
                            )}
                        </div>
                    ) : (
                        <div style={{ textAlign: 'center', padding: '32px 0' }}>
                            <div style={{ color: 'rgba(255,255,255,0.6)' }}>
                                暂无测试结果
                            </div>
                        </div>
                    )}
                </div>

                <div style={{ display: 'flex', justifyContent: 'flex-end' }}>
                    <button
                        onClick={onClose}
                        className="admin-btn admin-btn-primary"
                    >
                        确定
                    </button>
                </div>
            </div>
        </div>
    )
}

export default TestResultModal
