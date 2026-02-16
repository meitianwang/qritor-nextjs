'use client'

import { useState, useEffect } from 'react'
import { adminFetch } from '@/lib/admin-utils'
import { useToast } from '@/hooks/useToast'
import ToastNotification from '@/components/ToastNotification'

/**
 * 后台用户管理页面
 */

interface User {
    id: number
    nickname: string
    email: string
    avatar?: string
    role: string
    createdAt: string
    lastLoginAt?: string
}

export default function UserListPage() {
    const { notification, showToast } = useToast()
    const [users, setUsers] = useState<User[]>([])
    const [loading, setLoading] = useState<boolean>(true)
    const [page, setPage] = useState<number>(0)
    const [totalPages, setTotalPages] = useState<number>(0)
    const [keyword, setKeyword] = useState<string>('')

    // 删除确认弹窗状态
    const [showDeleteModal, setShowDeleteModal] = useState<boolean>(false)
    const [userToDelete, setUserToDelete] = useState<User | null>(null)
    const [deleting, setDeleting] = useState<boolean>(false)

    useEffect(() => {
        fetchUsers()
    // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [page])

    const fetchUsers = async () => {
        try {
            setLoading(true)
            let url = `/api/admin/users?page=${page}&size=20`
            if (keyword) {
                url += `&keyword=${encodeURIComponent(keyword)}`
            }

            const response = await adminFetch(url)
            const data = await response.json()
            if (data.code === 200) {
                setUsers(data.data?.content || data.data || [])
                setTotalPages(data.data?.totalPages || 0)
            }
        } catch (error) {
            console.error('获取用户列表失败:', error)
        } finally {
            setLoading(false)
        }
    }

    const handleSearch = (e: React.FormEvent<HTMLFormElement>) => {
        e.preventDefault()
        setPage(0)
        fetchUsers()
    }

    const handleSetRole = async (userId: number, role: string) => {
        if (!confirm(`确定要将该用户设置为 ${role === 'ADMIN' ? '管理员' : '普通用户'} 吗？`)) {
            return
        }

        try {
            const response = await adminFetch(`/api/admin/users/${userId}`, {
                method: 'PUT',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ role })
            })
            const data = await response.json()
            if (data.code === 200) {
                fetchUsers()
            } else {
                showToast('error', data.message || '操作失败')
            }
        } catch (error) {
            console.error('设置角色失败:', error)
            showToast('error', '设置角色失败')
        }
    }

    // 打开删除确认弹窗
    const handleOpenDeleteModal = (user: User) => {
        setUserToDelete(user)
        setShowDeleteModal(true)
    }

    // 关闭删除确认弹窗
    const handleCloseDeleteModal = () => {
        setShowDeleteModal(false)
        setUserToDelete(null)
    }

    // 确认删除用户
    const handleConfirmDelete = async () => {
        if (!userToDelete) return

        setDeleting(true)
        try {
            const response = await adminFetch(`/api/admin/users/${userToDelete.id}`, {
                method: 'DELETE'
            })
            const data = await response.json()
            if (data.code === 200) {
                handleCloseDeleteModal()
                fetchUsers()
            } else {
                showToast('error', data.message || '删除失败')
            }
        } catch (error) {
            console.error('删除用户失败:', error)
            showToast('error', '删除用户失败')
        } finally {
            setDeleting(false)
        }
    }

    const formatDate = (dateStr: string | null | undefined): string => {
        if (!dateStr) return '-'
        return new Date(dateStr).toLocaleString('zh-CN')
    }

    return (
        <div>
            <h1 className="admin-page-title">用户管理</h1>

            {/* 搜索栏 */}
            <form onSubmit={handleSearch} className="admin-search-bar">
                <input
                    type="text"
                    className="admin-form-input admin-search-input"
                    placeholder="搜索邮箱或昵称..."
                    value={keyword}
                    onChange={(e) => setKeyword(e.target.value)}
                />
                <button type="submit" className="admin-btn admin-btn-primary">
                    搜索
                </button>
            </form>

            {/* 用户列表 */}
            {loading ? (
                <div className="admin-loading">
                    <div className="admin-loading-spinner"></div>
                </div>
            ) : (
                <div className="admin-table-container">
                    <table className="admin-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>昵称</th>
                                <th>邮箱</th>
                                <th>角色</th>
                                <th>注册时间</th>
                                <th>最后登录</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            {users.length > 0 ? (
                                users.map((user: User) => (
                                    <tr key={user.id}>
                                        <td>{user.id}</td>
                                        <td>
                                            <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                                                {user.avatar && (
                                                    // eslint-disable-next-line @next/next/no-img-element
                                                    <img
                                                        src={user.avatar}
                                                        alt=""
                                                        style={{ width: 32, height: 32, borderRadius: '50%' }}
                                                    />
                                                )}
                                                {user.nickname}
                                            </div>
                                        </td>
                                        <td>{user.email}</td>
                                        <td>
                                            <span className={`admin-badge ${user.role === 'ADMIN' ? 'admin-badge-info' : 'admin-badge-success'}`}>
                                                {user.role === 'ADMIN' ? '管理员' : '用户'}
                                            </span>
                                        </td>
                                        <td>{formatDate(user.createdAt)}</td>
                                        <td>{formatDate(user.lastLoginAt)}</td>
                                        <td>
                                            <div style={{ display: 'flex', gap: '8px' }}>
                                                {user.role === 'ADMIN' ? (
                                                    <button
                                                        className="admin-btn admin-btn-secondary admin-btn-sm"
                                                        onClick={() => handleSetRole(user.id, 'USER')}
                                                    >
                                                        取消管理员
                                                    </button>
                                                ) : (
                                                    <button
                                                        className="admin-btn admin-btn-primary admin-btn-sm"
                                                        onClick={() => handleSetRole(user.id, 'ADMIN')}
                                                    >
                                                        设为管理员
                                                    </button>
                                                )}
                                                <button
                                                    className="admin-btn admin-btn-danger admin-btn-sm"
                                                    onClick={() => handleOpenDeleteModal(user)}
                                                >
                                                    删除
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                ))
                            ) : (
                                <tr>
                                    <td colSpan={7} style={{ textAlign: 'center', color: 'rgba(255,255,255,0.5)' }}>
                                        暂无用户
                                    </td>
                                </tr>
                            )}
                        </tbody>
                    </table>
                </div>
            )}

            {/* 分页 */}
            {totalPages > 1 && (
                <div className="admin-pagination">
                    <button
                        className="admin-pagination-btn"
                        disabled={page === 0}
                        onClick={() => setPage(page - 1)}
                    >
                        上一页
                    </button>
                    <span style={{ color: 'rgba(255,255,255,0.6)', padding: '8px 16px' }}>
                        {page + 1} / {totalPages}
                    </span>
                    <button
                        className="admin-pagination-btn"
                        disabled={page >= totalPages - 1}
                        onClick={() => setPage(page + 1)}
                    >
                        下一页
                    </button>
                </div>
            )}

            {/* 删除确认弹窗 */}
            {showDeleteModal && userToDelete && (
                <div
                    className="admin-modal-overlay"
                    onClick={handleCloseDeleteModal}
                    style={{
                        position: 'fixed',
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        background: 'rgba(0, 0, 0, 0.7)',
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'center',
                        zIndex: 1000
                    }}
                >
                    <div
                        className="admin-modal"
                        onClick={(e: React.MouseEvent) => e.stopPropagation()}
                        style={{
                            background: 'var(--admin-bg-secondary, #1a1a2e)',
                            borderRadius: '12px',
                            padding: '24px',
                            maxWidth: '400px',
                            width: '90%',
                            border: '1px solid rgba(255, 255, 255, 0.1)'
                        }}
                    >
                        <div style={{ marginBottom: '16px' }}>
                            <h3 style={{
                                margin: 0,
                                color: '#ef4444',
                                fontSize: '18px',
                                display: 'flex',
                                alignItems: 'center',
                                gap: '8px'
                            }}>
                                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                                    <circle cx="12" cy="12" r="10"></circle>
                                    <line x1="12" y1="8" x2="12" y2="12"></line>
                                    <line x1="12" y1="16" x2="12.01" y2="16"></line>
                                </svg>
                                确认删除用户
                            </h3>
                        </div>
                        <div style={{ marginBottom: '24px', color: 'rgba(255, 255, 255, 0.7)' }}>
                            <p style={{ margin: '0 0 12px 0' }}>
                                您确定要删除用户 <strong style={{ color: '#fff' }}>{userToDelete.nickname}</strong> 吗？
                            </p>
                            <p style={{ margin: '0 0 8px 0', fontSize: '14px' }}>
                                邮箱：{userToDelete.email}
                            </p>
                            <p style={{
                                margin: '12px 0 0 0',
                                padding: '12px',
                                background: 'rgba(239, 68, 68, 0.1)',
                                borderRadius: '8px',
                                fontSize: '13px',
                                color: '#ef4444'
                            }}>
                                &#9888;&#65039; 此操作将删除该用户的所有数据（包括小说、订阅、积分记录等），且无法恢复！
                            </p>
                        </div>
                        <div style={{ display: 'flex', gap: '12px', justifyContent: 'flex-end' }}>
                            <button
                                className="admin-btn admin-btn-secondary"
                                onClick={handleCloseDeleteModal}
                                disabled={deleting}
                                style={{ padding: '8px 20px' }}
                            >
                                取消
                            </button>
                            <button
                                className="admin-btn admin-btn-danger"
                                onClick={handleConfirmDelete}
                                disabled={deleting}
                                style={{ padding: '8px 20px' }}
                            >
                                {deleting ? '删除中...' : '确认删除'}
                            </button>
                        </div>
                    </div>
                </div>
            )}

            {/* Toast 通知 */}
            <ToastNotification notification={notification} />
        </div>
    )
}
