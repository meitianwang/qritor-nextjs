'use client'

import { useState, useEffect } from 'react'
import { adminFetch } from '@/lib/admin-utils'

interface DashboardStats {
    totalUsers?: number
    todayNewUsers?: number
    totalOrders?: number
    totalRevenue?: number
    recentActivities?: Array<{
        action: string
        adminName?: string
        targetType?: string
        createdAt: string
    }>
}

export default function DashboardPage() {
    const [stats, setStats] = useState<DashboardStats | null>(null)
    const [loading, setLoading] = useState(true)

    useEffect(() => {
        const fetchStats = async () => {
            try {
                const response = await adminFetch('/stats/dashboard')
                const data = await response.json()
                if (data.code === 200) {
                    setStats(data.data)
                }
            } catch (error) {
                console.error('获取统计数据失败:', error)
            } finally {
                setLoading(false)
            }
        }
        fetchStats()
    }, [])

    if (loading) {
        return (
            <div className="admin-loading">
                <div className="admin-loading-spinner"></div>
            </div>
        )
    }

    return (
        <div>
            <h1 className="admin-page-title">仪表盘</h1>

            <div className="admin-stats-grid">
                <div className="admin-stat-card">
                    <div className="admin-stat-label">总用户数</div>
                    <div className="admin-stat-value">{stats?.totalUsers || 0}</div>
                    <div className="admin-stat-change positive">
                        +{stats?.todayNewUsers || 0} 今日新增
                    </div>
                </div>

                <div className="admin-stat-card">
                    <div className="admin-stat-label">总订单数</div>
                    <div className="admin-stat-value">{stats?.totalOrders || 0}</div>
                </div>

                <div className="admin-stat-card">
                    <div className="admin-stat-label">总营收</div>
                    <div className="admin-stat-value">¥{stats?.totalRevenue || 0}</div>
                </div>
            </div>

            <h2 style={{ color: '#fff', fontSize: '1.25rem', marginBottom: '16px' }}>最近操作</h2>
            <div className="admin-table-container">
                <table className="admin-table">
                    <thead>
                        <tr>
                            <th>操作类型</th>
                            <th>操作者</th>
                            <th>目标类型</th>
                            <th>时间</th>
                        </tr>
                    </thead>
                    <tbody>
                        {stats?.recentActivities && stats.recentActivities.length > 0 ? (
                            stats.recentActivities.map((activity, index) => (
                                <tr key={index}>
                                    <td>{activity.action}</td>
                                    <td>{activity.adminName || '-'}</td>
                                    <td>{activity.targetType || '-'}</td>
                                    <td>{new Date(activity.createdAt).toLocaleString('zh-CN')}</td>
                                </tr>
                            ))
                        ) : (
                            <tr>
                                <td colSpan={4} style={{ textAlign: 'center', color: 'rgba(255,255,255,0.5)' }}>
                                    暂无操作记录
                                </td>
                            </tr>
                        )}
                    </tbody>
                </table>
            </div>
        </div>
    )
}
