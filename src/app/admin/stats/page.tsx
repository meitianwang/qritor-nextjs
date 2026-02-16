'use client'

import { useState, useEffect } from 'react'
import { adminFetch } from '@/lib/admin-utils'

/**
 * 后台统计报表页面
 */

interface Activity {
    action: string
    adminName?: string
    targetType?: string
    createdAt: string
}

interface DashboardStats {
    totalUsers: number
    todayNewUsers: number
    totalOrders: number
    totalRevenue: number
    publishedBlogs: number
    totalCategories: number
    publishedDocs: number
    recentActivities: Activity[]
}

export default function StatsPage() {
    const [stats, setStats] = useState<DashboardStats | null>(null)
    const [loading, setLoading] = useState<boolean>(true)

    useEffect(() => {
        fetchStats()
    }, [])

    const fetchStats = async () => {
        try {
            const response = await adminFetch('/api/admin/stats/dashboard')
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

    if (loading) {
        return <div className="admin-loading"><div className="admin-loading-spinner"></div></div>
    }

    return (
        <div>
            <h1 className="admin-page-title">统计报表</h1>

            {/* 核心指标 */}
            <h2 style={{ color: '#fff', fontSize: '1.25rem', margin: '24px 0 16px' }}>核心指标</h2>
            <div className="admin-stats-grid">
                <div className="admin-stat-card">
                    <div className="admin-stat-label">总用户数</div>
                    <div className="admin-stat-value">{stats?.totalUsers || 0}</div>
                    <div className="admin-stat-change positive">+{stats?.todayNewUsers || 0} 今日新增</div>
                </div>
                <div className="admin-stat-card">
                    <div className="admin-stat-label">总订单数</div>
                    <div className="admin-stat-value">{stats?.totalOrders || 0}</div>
                </div>
                <div className="admin-stat-card">
                    <div className="admin-stat-label">总营收</div>
                    <div className="admin-stat-value">¥{stats?.totalRevenue?.toFixed(2) || '0.00'}</div>
                </div>
            </div>

            {/* 内容统计 */}
            <h2 style={{ color: '#fff', fontSize: '1.25rem', margin: '32px 0 16px' }}>内容统计</h2>
            <div className="admin-stats-grid">
                <div className="admin-stat-card">
                    <div className="admin-stat-label">已发布博客</div>
                    <div className="admin-stat-value">{stats?.publishedBlogs || 0}</div>
                </div>
                <div className="admin-stat-card">
                    <div className="admin-stat-label">文档分类</div>
                    <div className="admin-stat-value">{stats?.totalCategories || 0}</div>
                </div>
                <div className="admin-stat-card">
                    <div className="admin-stat-label">已发布文档</div>
                    <div className="admin-stat-value">{stats?.publishedDocs || 0}</div>
                </div>
            </div>

            {/* 最近操作 */}
            <h2 style={{ color: '#fff', fontSize: '1.25rem', margin: '32px 0 16px' }}>最近操作</h2>
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
                            stats.recentActivities.map((activity: Activity, index: number) => (
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
