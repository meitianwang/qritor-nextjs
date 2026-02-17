'use client'

import { useCallback, useMemo, useState } from 'react'
import {
    getAccessToken,
    setAccessToken,
    clearAccessToken,
    getUserInfo,
    saveUserInfo,
    clearUserInfo,
    tryRestoreToken,
    authFetch,
    getAppUrl
} from '@/lib/auth-utils'

interface UserData {
    accessToken?: string
    expiresAt?: string
    [key: string]: unknown
}

interface AuthHook {
    getUser: () => UserData | null
    getAccessToken: () => string | null
    isLoggedIn: () => boolean
    login: (userData: UserData) => void
    updateUser: (userData: UserData) => void
    logout: () => Promise<void>
    getRedirectUrl: () => string
    setRedirectUrl: (url: string) => void
    clearRedirectUrl: () => void
    restoreToken: () => Promise<boolean>
}

/**
 * Authentication Hook
 * Unified login state and Token management
 *
 * Storage strategy:
 * - Access Token: in-memory storage (via authUtils)
 * - Refresh Token: HttpOnly Cookie (managed by browser, cross-domain shared)
 * - User info: localStorage (excluding tokens)
 */
export function useAuth(): AuthHook {
    // State to trigger re-renders
    const [, setForceUpdate] = useState(0)

    /**
     * Get current user info
     */
    const getUser = useCallback((): UserData | null => {
        return getUserInfo()
    }, [])

    /**
     * Get Access Token
     */
    const getToken = useCallback((): string | null => {
        return getAccessToken()
    }, [])

    /**
     * Check if logged in
     * Checks if user info exists (token may need refresh)
     */
    const isLoggedIn = useCallback((): boolean => {
        const user = getUserInfo()
        if (!user) {
            return false
        }

        const expiresAt = localStorage.getItem('token_expires_at')
        if (!expiresAt) {
            return true
        }

        const expiresAtMs = new Date(expiresAt).getTime()
        if (Number.isNaN(expiresAtMs)) {
            return true
        }

        return expiresAtMs > Date.now()
    }, [])

    /**
     * Save user info (called after successful login)
     */
    const login = useCallback((userData: UserData): void => {
        // Set Access Token in memory
        setAccessToken(userData.accessToken || null, userData.expiresAt || null)

        // Save user info to localStorage (excluding tokens)
        saveUserInfo(userData)

        // Trigger re-render
        setForceUpdate(n => n + 1)
    }, [])

    /**
     * Update user info
     */
    const updateUser = useCallback((userData: UserData): void => {
        const currentUser = getUserInfo()
        const updatedUser = { ...currentUser, ...userData }

        // If includes new accessToken, update memory
        if (userData.accessToken) {
            setAccessToken(userData.accessToken, userData.expiresAt || null)
        }

        saveUserInfo(updatedUser)
        setForceUpdate(n => n + 1)
    }, [])

    /**
     * Logout
     * Calls backend endpoint to clear Cookie and invalidate Token family
     */
    const logout = useCallback(async (): Promise<void> => {
        try {
            // Call backend logout endpoint, will clear Cookie
            await authFetch('/api/auth/logout', {
                method: 'POST'
            })
        } catch (e) {
            console.error('Logout request failed:', e)
        }

        // Clear local data
        clearAccessToken()
        clearUserInfo()

        // Redirect to portal home
        const portalUrl = getAppUrl('portal')
        window.location.href = portalUrl
    }, [])

    /**
     * Get redirect URL after login
     */
    const getRedirectUrl = useCallback((): string => {
        return sessionStorage.getItem('redirectAfterLogin') || '/studio'
    }, [])

    /**
     * Set redirect URL after login
     */
    const setRedirectUrl = useCallback((url: string): void => {
        sessionStorage.setItem('redirectAfterLogin', url)
    }, [])

    /**
     * Clear redirect URL
     */
    const clearRedirectUrl = useCallback((): void => {
        sessionStorage.removeItem('redirectAfterLogin')
    }, [])

    /**
     * Try to restore Token (used after page refresh)
     * If no token in memory, try to get new one using Refresh Token in Cookie
     */
    const restoreToken = useCallback(async (): Promise<boolean> => {
        const success = await tryRestoreToken()
        setForceUpdate(n => n + 1)
        return success
    }, [])

    return useMemo(() => ({
        getUser,
        getAccessToken: getToken,
        isLoggedIn,
        login,
        updateUser,
        logout,
        getRedirectUrl,
        setRedirectUrl,
        clearRedirectUrl,
        restoreToken
    }), [
        getUser,
        getToken,
        isLoggedIn,
        login,
        updateUser,
        logout,
        getRedirectUrl,
        setRedirectUrl,
        clearRedirectUrl,
        restoreToken
    ])
}
