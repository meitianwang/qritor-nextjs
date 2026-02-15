'use client'

/**
 * Authentication utility functions
 * Dual Token auth: Access Token in memory, Refresh Token in HttpOnly Cookie
 */

// ============== App URLs ==============
const APP_URLS: Record<string, string | undefined> = {
    portal: process.env.NEXT_PUBLIC_PORTAL_URL,
    admin: process.env.NEXT_PUBLIC_ADMIN_URL,
    community: process.env.NEXT_PUBLIC_COMMUNITY_URL,
    docs: process.env.NEXT_PUBLIC_DOCS_URL,
    studio: process.env.NEXT_PUBLIC_STUDIO_URL,
}

// API base URL (for Next.js, typically same origin so empty string)
const API_BASE_URL = process.env.NEXT_PUBLIC_API_BASE_URL || ''

/**
 * Get app URL by name
 */
export function getAppUrl(appName: string): string {
    return APP_URLS[appName] || APP_URLS.portal || ''
}

/**
 * API fetch wrapper (no auth required)
 */
// eslint-disable-next-line @typescript-eslint/no-explicit-any
export async function apiFetch(url: string, options: Omit<RequestInit, 'body'> & { body?: any } = {}): Promise<Response> {
    const headers: Record<string, string> = { ...(options.headers as Record<string, string>) }
    const { body: rawBody, ...restOptions } = options
    let body: BodyInit | null | undefined = rawBody

    if (rawBody && typeof rawBody === 'object' && !(rawBody instanceof FormData)) {
        headers['Content-Type'] = 'application/json'
        body = JSON.stringify(rawBody)
    }

    const fullUrl = url.startsWith('/') ? `${API_BASE_URL}${url}` : url

    return fetch(fullUrl, {
        ...restOptions,
        headers,
        body,
        credentials: 'include'
    })
}

// ============== In-memory storage ==============
let accessToken: string | null = null
let tokenExpiresAt: Date | null = null

let isRefreshing = false
let refreshSubscribers: Array<(token: string | null, error?: Error) => void> = []

function onRefreshSuccess(newAccessToken: string): void {
    refreshSubscribers.forEach(callback => callback(newAccessToken))
    refreshSubscribers = []
}

function onRefreshFailure(error: Error): void {
    refreshSubscribers.forEach(callback => callback(null, error))
    refreshSubscribers = []
}

function addRefreshSubscriber(callback: (token: string | null, error?: Error) => void): void {
    refreshSubscribers.push(callback)
}

export function getAccessToken(): string | null {
    return accessToken
}

export function setAccessToken(token: string | null, expiresAt: string | null = null): void {
    accessToken = token
    tokenExpiresAt = expiresAt ? new Date(expiresAt) : null

    if (expiresAt) {
        localStorage.setItem('token_expires_at', expiresAt)
    } else {
        localStorage.removeItem('token_expires_at')
    }
}

export function clearAccessToken(): void {
    accessToken = null
    tokenExpiresAt = null
    localStorage.removeItem('token_expires_at')
}

export function getUserInfo(): Record<string, unknown> | null {
    try {
        const userStr = localStorage.getItem('user')
        if (!userStr) return null
        return JSON.parse(userStr)
    } catch {
        return null
    }
}

export function saveUserInfo(userInfo: Record<string, unknown>): void {
    const { accessToken: _, refreshToken: __, _refreshToken: ___, expiresAt: ____, ...safeUserInfo } = userInfo
    localStorage.setItem('user', JSON.stringify(safeUserInfo))
}

export function clearUserInfo(): void {
    localStorage.removeItem('user')
}

function clearAuthAndRedirect(): void {
    clearAccessToken()
    clearUserInfo()

    const portalUrl = getAppUrl('portal')
    const currentUrl = window.location.href
    window.location.href = `${portalUrl}/login?redirect=${encodeURIComponent(currentUrl)}`
}

async function refreshToken(): Promise<string | null> {
    try {
        const response = await fetch(`${API_BASE_URL}/api/auth/refresh`, {
            method: 'POST',
            credentials: 'include',
            headers: {
                'Content-Type': 'application/json'
            }
        })

        const data = await response.json()

        if (data.code === 200 && data.data?.accessToken) {
            setAccessToken(data.data.accessToken, data.data.expiresAt)

            if (data.data.user || data.data.id) {
                const userInfo = data.data.user || data.data
                saveUserInfo(userInfo)
            }

            return data.data.accessToken
        } else {
            clearUserInfo()
            clearAccessToken()
            return null
        }
    } catch (error) {
        console.error('Token refresh failed:', error)
        clearUserInfo()
        clearAccessToken()
        return null
    }
}

export async function tryRestoreToken(): Promise<boolean> {
    if (accessToken) {
        return true
    }

    const newToken = await refreshToken()
    return !!newToken
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any
export async function authFetch(url: string, options: Omit<RequestInit, 'body'> & { body?: any } = {}): Promise<Response> {
    const token = getAccessToken()
    const headers: Record<string, string> = {
        ...(options.headers as Record<string, string>),
    }

    if (token) {
        headers['Authorization'] = `Bearer ${token}`
    }

    const { body: rawBody, ...restOptions } = options
    let body: BodyInit | null | undefined = rawBody
    if (rawBody && typeof rawBody === 'object' && !(rawBody instanceof FormData)) {
        headers['Content-Type'] = 'application/json'
        body = JSON.stringify(rawBody)
    }

    const fullUrl = url.startsWith('/') ? `${API_BASE_URL}${url}` : url

    const response = await fetch(fullUrl, {
        ...restOptions,
        headers,
        body,
        credentials: 'include'
    })

    if (response.status !== 401) {
        return response
    }

    if (isRefreshing) {
        return new Promise((resolve, reject) => {
            addRefreshSubscriber((newToken, error) => {
                if (error) {
                    reject(error)
                    return
                }
                if (!newToken) {
                    clearAuthAndRedirect()
                    reject(new Error('Token refresh failed'))
                    return
                }
                headers['Authorization'] = `Bearer ${newToken}`
                resolve(fetch(fullUrl, {
                    ...restOptions,
                    headers,
                    body,
                    credentials: 'include'
                }))
            })
        })
    }

    isRefreshing = true

    try {
        const newToken = await refreshToken()
        isRefreshing = false

        if (newToken) {
            onRefreshSuccess(newToken)
            headers['Authorization'] = `Bearer ${newToken}`
            return fetch(fullUrl, {
                ...restOptions,
                headers,
                body,
                credentials: 'include'
            })
        } else {
            onRefreshFailure(new Error('Token refresh failed'))
            clearAuthAndRedirect()
            throw new Error('Token refresh failed, please login again')
        }
    } catch (error) {
        isRefreshing = false
        onRefreshFailure(error as Error)
        clearAuthAndRedirect()
        throw error
    }
}

// ============== Token auto-refresh ==============
const PRE_REFRESH_BUFFER_MS = 5 * 60 * 1000
const AUTO_REFRESH_CHECK_INTERVAL_MS = 5 * 60 * 1000

let autoRefreshTimer: ReturnType<typeof setInterval> | null = null

function shouldRefreshToken(): boolean {
    if (tokenExpiresAt) {
        const now = new Date()
        const refreshThreshold = new Date(now.getTime() + PRE_REFRESH_BUFFER_MS)
        return tokenExpiresAt < refreshThreshold
    }

    const storedExpiresAt = localStorage.getItem('token_expires_at')
    if (storedExpiresAt) {
        const expiresDate = new Date(storedExpiresAt)
        const now = new Date()
        const refreshThreshold = new Date(now.getTime() + PRE_REFRESH_BUFFER_MS)
        return expiresDate < refreshThreshold
    }

    return false
}

async function checkAndPreRefresh(): Promise<void> {
    if (!getUserInfo()) {
        return
    }

    if (shouldRefreshToken()) {
        try {
            await refreshToken()
        } catch (e) {
            console.error('[Auth] Token pre-refresh error:', e)
        }
    }
}

function handleVisibilityChange(): void {
    if (document.visibilityState === 'visible') {
        checkAndPreRefresh()
    }
}

export function startTokenAutoRefresh(): void {
    if (autoRefreshTimer) {
        return
    }

    autoRefreshTimer = setInterval(checkAndPreRefresh, AUTO_REFRESH_CHECK_INTERVAL_MS)
    document.addEventListener('visibilitychange', handleVisibilityChange)
}

// ============== Password Policy ==============
const MIN_LENGTH = 8
const COMMON_PASSWORDS = new Set([
    'password', '123456', '12345678', '123456789', 'qwerty',
    'abc123', 'letmein', 'iloveyou', 'admin', 'login',
    '111111', '000000', '123123', 'passw0rd', 'dragon'
])

export function isPasswordStrong(password: string): boolean {
    if (!password || password.length < MIN_LENGTH) return false
    if (!/[A-Z]/.test(password)) return false
    if (!/[a-z]/.test(password)) return false
    if (!/[0-9]/.test(password)) return false
    if (!/[^A-Za-z0-9]/.test(password)) return false
    if (COMMON_PASSWORDS.has(password.toLowerCase())) return false
    return true
}

// ============== Callback URL Builder ==============

/**
 * Build callback URL (supports custom protocols like qritor://)
 */
export function buildCallbackUrl(baseUrl: string, params: Record<string, string>): string {
    const queryString = Object.entries(params)
        .map(([key, value]) => `${encodeURIComponent(key)}=${encodeURIComponent(value)}`)
        .join('&')
    const separator = baseUrl.includes('?') ? '&' : '?'
    return `${baseUrl}${separator}${queryString}`
}
