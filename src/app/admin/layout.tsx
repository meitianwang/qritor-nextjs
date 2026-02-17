'use client'

import { useState, useEffect, useRef } from 'react'
import Link from 'next/link'
import { usePathname, useRouter } from 'next/navigation'
import { useAuth } from '@/hooks/useAuth'
import { getAccessToken, tryRestoreToken, authFetch } from '@/lib/auth-utils'
import UserAvatar from '@/components/UserAvatar'
// admin.css is imported in root layout for reliable loading

interface UserInfo {
    nickname?: string
    email?: string
    avatar?: string
    role?: string
}

export default function AdminLayout({ children }: { children: React.ReactNode }) {
    const pathname = usePathname()
    const router = useRouter()
    const { logout } = useAuth()
    const [user, setUser] = useState<UserInfo | null>(null)
    const [isRestoring, setIsRestoring] = useState(true)
    const [showDropdown, setShowDropdown] = useState(false)
    const dropdownRef = useRef<HTMLDivElement>(null)

    const isLoginPage = pathname === '/admin/login'
    // Detail page uses full-screen layout (no sidebar), same as original admin-web
    const isFullScreenPage = /^\/admin\/novel-creation-methods\/\d+/.test(pathname)

    useEffect(() => {
        // Skip auth check on login page to avoid redirect loop
        if (isLoginPage) {
            setIsRestoring(false)
            return
        }

        // Reset restoring state when navigating away from login
        setIsRestoring(true)

        const initAuth = async () => {
            if (!getAccessToken()) {
                const success = await tryRestoreToken()
                if (!success) {
                    router.replace(`/admin/login?redirect=${encodeURIComponent(pathname)}`)
                    setIsRestoring(false)
                    return
                }
            }

            try {
                const response = await authFetch('/api/auth/me')
                const data = await response.json()

                if (data.code === 200 && data.data?.role === 'ADMIN') {
                    localStorage.setItem('user', JSON.stringify(data.data))
                    setUser(data.data)
                } else {
                    localStorage.removeItem('user')
                    router.replace(`/admin/login?redirect=${encodeURIComponent(pathname)}`)
                }
            } catch (e) {
                console.error('获取管理员信息失败:', e)
                localStorage.removeItem('user')
                router.replace(`/admin/login?redirect=${encodeURIComponent(pathname)}`)
            }
            setIsRestoring(false)
        }

        initAuth()
    // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [isLoginPage])

    useEffect(() => {
        const handleClickOutside = (e: MouseEvent) => {
            if (dropdownRef.current && !dropdownRef.current.contains(e.target as Node)) {
                setShowDropdown(false)
            }
        }
        document.addEventListener('click', handleClickOutside)
        return () => document.removeEventListener('click', handleClickOutside)
    }, [])

    const isActive = (path: string) => pathname === path || pathname.startsWith(path + '/')

    // Login page and full-screen pages: render children directly without sidebar
    if (isLoginPage || isFullScreenPage) {
        return <>{children}</>
    }

    if (isRestoring || !user) {
        return (
            <div className="admin-loading">
                <div className="admin-loading-spinner"></div>
            </div>
        )
    }

    return (
        <div className="admin-layout" style={{ minHeight: '100vh', background: '#0a0a0f' }}>
            <aside className="admin-sidebar" style={{ position: 'fixed', left: 0, top: 0, width: '250px', height: '100vh', overflowY: 'auto', background: 'linear-gradient(180deg, #111118 0%, #0d0d12 100%)', borderRight: '1px solid rgba(13, 148, 136, 0.1)', padding: '24px 0', zIndex: 50 }}>
                <div className="admin-sidebar-header">
                    <Link href="/" className="admin-sidebar-logo">
                        <span>运营后台</span>
                    </Link>
                </div>

                <nav className="admin-nav">
                    <div className="admin-nav-section">
                        <div className="admin-nav-title">概览</div>
                        <Link href="/admin" className={`admin-nav-item ${pathname === '/admin' ? 'active' : ''}`}>
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                                <path d="M3 9l9-7 9 7v11a2 2 0 01-2 2H5a2 2 0 01-2-2z" />
                                <polyline points="9 22 9 12 15 12 15 22" />
                            </svg>
                            仪表盘
                        </Link>
                    </div>

                    <div className="admin-nav-section">
                        <div className="admin-nav-title">用户管理</div>
                        <Link href="/admin/users" className={`admin-nav-item ${isActive('/admin/users') ? 'active' : ''}`}>
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                                <path d="M17 21v-2a4 4 0 00-4-4H5a4 4 0 00-4 4v2" />
                                <circle cx="9" cy="7" r="4" />
                                <path d="M23 21v-2a4 4 0 00-3-3.87" />
                                <path d="M16 3.13a4 4 0 010 7.75" />
                            </svg>
                            用户列表
                        </Link>
                        <Link href="/admin/notifications" className={`admin-nav-item ${isActive('/admin/notifications') ? 'active' : ''}`}>
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                                <path d="M22 17H2a3 3 0 0 0 3-3V9a7 7 0 0 1 14 0v5a3 3 0 0 0 3 3zm-8.27 4a2 2 0 0 1-3.46 0" />
                            </svg>
                            发送通知
                        </Link>
                    </div>

                    <div className="admin-nav-section">
                        <div className="admin-nav-title">内容管理</div>
                        <Link href="/admin/novel-creation-methods" className={`admin-nav-item ${isActive('/admin/novel-creation-methods') ? 'active' : ''}`}>
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                                <path d="M9 3v2m6-2v2M9 19v2m6-2v2M5 9H3m2 6H3m18-6h-2m2 6h-2M7 19h10a2 2 0 002-2V7a2 2 0 00-2-2H7a2 2 0 00-2 2v10a2 2 0 002 2z" />
                                <path d="M9 9h6v6H9V9z" />
                            </svg>
                            小说创作方法
                        </Link>
                        <Link href="/admin/prompt-templates" className={`admin-nav-item ${isActive('/admin/prompt-templates') ? 'active' : ''}`}>
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                                <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z" />
                                <polyline points="14 2 14 8 20 8" />
                                <line x1="16" y1="13" x2="8" y2="13" />
                                <line x1="16" y1="17" x2="8" y2="17" />
                                <polyline points="10 9 9 9 8 9" />
                            </svg>
                            提示词模板
                        </Link>
                    </div>

                    <div className="admin-nav-section">
                        <div className="admin-nav-title">系统设置</div>
                        <Link href="/admin/pricing" className={`admin-nav-item ${isActive('/admin/pricing') ? 'active' : ''}`}>
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                                <line x1="12" y1="1" x2="12" y2="23" />
                                <path d="M17 5H9.5a3.5 3.5 0 000 7h5a3.5 3.5 0 010 7H6" />
                            </svg>
                            价格管理
                        </Link>
                        <Link href="/admin/llm-configs" className={`admin-nav-item ${isActive('/admin/llm-configs') ? 'active' : ''}`}>
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                                <path d="M9 3v2m6-2v2M9 19v2m6-2v2M5 9H3m2 6H3m18-6h-2m2 6h-2M7 19h10a2 2 0 002-2V7a2 2 0 00-2-2H7a2 2 0 00-2 2v10a2 2 0 002 2zM9 9h6v6H9V9z" />
                            </svg>
                            模型配置
                        </Link>
                        <Link href="/admin/image-gen-configs" className={`admin-nav-item ${isActive('/admin/image-gen-configs') ? 'active' : ''}`}>
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                                <path d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
                            </svg>
                            生图模型
                        </Link>
                        <Link href="/admin/video-gen-configs" className={`admin-nav-item ${isActive('/admin/video-gen-configs') ? 'active' : ''}`}>
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                                <path d="M15 10l4.553-2.276A1 1 0 0121 8.618v6.764a1 1 0 01-1.447.894L15 14M5 18h8a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v8a2 2 0 002 2z" />
                            </svg>
                            生视频模型
                        </Link>
                        <Link href="/admin/payment-settings" className={`admin-nav-item ${isActive('/admin/payment-settings') ? 'active' : ''}`}>
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                                <rect x="1" y="4" width="22" height="16" rx="2" ry="2" />
                                <line x1="1" y1="10" x2="23" y2="10" />
                            </svg>
                            支付设置
                        </Link>
                        <Link href="/admin/referral-settings" className={`admin-nav-item ${isActive('/admin/referral-settings') ? 'active' : ''}`}>
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                                <path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2" />
                                <circle cx="8.5" cy="7" r="4" />
                                <path d="M20 8v6M23 11h-6" />
                            </svg>
                            邀请设置
                        </Link>
                        <Link href="/admin/stats" className={`admin-nav-item ${isActive('/admin/stats') ? 'active' : ''}`}>
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                                <line x1="18" y1="20" x2="18" y2="10" />
                                <line x1="12" y1="20" x2="12" y2="4" />
                                <line x1="6" y1="20" x2="6" y2="14" />
                            </svg>
                            统计报表
                        </Link>
                    </div>
                </nav>
            </aside>

            <main className="admin-main" style={{ marginLeft: '250px', minHeight: '100vh', padding: '24px' }}>
                <div className="admin-header">
                    <div></div>
                    <div className="admin-user-info">
                        <div className="user-menu" ref={dropdownRef}>
                            <button
                                className="user-avatar-trigger"
                                onClick={(e) => {
                                    e.stopPropagation()
                                    setShowDropdown(!showDropdown)
                                }}
                            >
                                <UserAvatar nickname={user.nickname || ''} avatarUrl={user.avatar} size={32} />
                            </button>
                            <div className={`user-dropdown ${showDropdown ? 'show' : ''}`}>
                                <Link href="/profile" className="user-dropdown-header" onClick={() => setShowDropdown(false)}>
                                    <span className="user-name">{user.nickname || '用户'}</span>
                                    <span className="user-email">{user.email}</span>
                                </Link>
                                <div className="user-dropdown-divider"></div>
                                <Link href="/profile" className="user-dropdown-item" onClick={() => setShowDropdown(false)}>
                                    个人设置
                                </Link>
                                <Link href="/" className="user-dropdown-item" onClick={() => setShowDropdown(false)}>
                                    返回首页
                                </Link>
                                <button className="user-dropdown-item user-dropdown-logout" onClick={logout}>
                                    <span>退出</span>
                                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                                        <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
                                        <polyline points="16 17 21 12 16 7"></polyline>
                                        <line x1="21" y1="12" x2="9" y2="12"></line>
                                    </svg>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                {children}
            </main>
        </div>
    )
}
