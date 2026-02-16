'use client'

import { useState, useCallback } from 'react'
import { useRouter, useSearchParams } from 'next/navigation'
import { useAuth } from '@/hooks/useAuth'
import { apiFetch } from '@/lib/auth-utils'
import '@/styles/admin-login.css'

interface LoginData {
    role?: string
    accessToken?: string
    expiresAt?: string
    [key: string]: unknown
}

export default function AdminLoginPage() {
    const router = useRouter()
    const searchParams = useSearchParams()
    const { login } = useAuth()
    const [email, setEmail] = useState('')
    const [password, setPassword] = useState('')
    const [showPassword, setShowPassword] = useState(false)
    const [error, setError] = useState('')
    const [loading, setLoading] = useState(false)

    const handleLoginSuccess = useCallback((data: LoginData) => {
        if (data.role !== 'ADMIN') {
            setError('仅管理员可登录后台')
            return
        }
        login(data)
        const redirectUrl = searchParams.get('redirect')
        router.push(redirectUrl ? decodeURIComponent(redirectUrl) : '/admin')
    }, [login, router, searchParams])

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault()
        if (!email) { setError('请输入邮箱'); return }
        if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) { setError('邮箱格式不正确'); return }
        if (!password) { setError('请输入密码'); return }
        setLoading(true)
        setError('')
        try {
            const response = await apiFetch('/api/auth/login', { method: 'POST', body: { email, password } })
            const data = await response.json()
            if (data.code === 200 && data.data) handleLoginSuccess(data.data)
            else setError(data.message || '登录失败')
        } catch {
            setError('网络错误，请稍后重试')
        } finally {
            setLoading(false)
        }
    }

    return (
        <div className="admin-login-page">
            <div className="admin-login-container">
                <div className="admin-login-header">
                    <h1>运营后台</h1>
                </div>
                <form className="admin-login-form" onSubmit={handleSubmit}>
                    <div className="form-group">
                        <label htmlFor="email">邮箱</label>
                        <input type="email" id="email" placeholder="请输入管理员邮箱" autoComplete="email" value={email} onChange={(e) => setEmail(e.target.value)} />
                    </div>
                    <div className="form-group">
                        <label htmlFor="password">密码</label>
                        <div className="password-wrapper">
                            <input type={showPassword ? 'text' : 'password'} id="password" placeholder="请输入密码" autoComplete="current-password" value={password} onChange={(e) => setPassword(e.target.value)} />
                            <button type="button" className="password-toggle" onClick={() => setShowPassword(!showPassword)}>
                                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                                    {showPassword ? (
                                        <>
                                            <path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24" />
                                            <line x1="1" y1="1" x2="23" y2="23" />
                                        </>
                                    ) : (
                                        <>
                                            <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z" />
                                            <circle cx="12" cy="12" r="3" />
                                        </>
                                    )}
                                </svg>
                            </button>
                        </div>
                    </div>
                    {error && <div className="form-error">{error}</div>}
                    <button type="submit" className="login-btn" disabled={loading}>{loading ? '登录中...' : '登录'}</button>
                </form>
            </div>
        </div>
    )
}
