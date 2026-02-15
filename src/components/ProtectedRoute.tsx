'use client'

import { useAuth } from '@/hooks/useAuth'
import { useTranslation } from '@/hooks/useTranslation'
import { useState, useEffect, type ReactNode } from 'react'
import { usePathname, useSearchParams, useRouter } from 'next/navigation'
import { getAccessToken, tryRestoreToken } from '@/lib/auth-utils'

/**
 * Protected route component
 * Redirects unauthenticated users to login page
 *
 * In Next.js, primary protection is handled by middleware.
 * This component provides client-side auth check as a secondary layer,
 * showing loading state while verifying auth and redirecting if needed.
 */
interface ProtectedRouteProps {
    children: ReactNode
}

function ProtectedRoute({ children }: ProtectedRouteProps) {
    const { isLoggedIn } = useAuth()
    const { t } = useTranslation('portal')
    const pathname = usePathname()
    const searchParams = useSearchParams()
    const router = useRouter()
    const [isRestoring, setIsRestoring] = useState(true)
    const [isAuthenticated, setIsAuthenticated] = useState(false)

    useEffect(() => {
        const checkAuth = async () => {
            // If token already in memory, pass through
            if (getAccessToken()) {
                setIsAuthenticated(true)
                setIsRestoring(false)
                return
            }

            // Try to restore with Refresh Token
            const success = await tryRestoreToken()
            setIsAuthenticated(success)
            setIsRestoring(false)
        }

        checkAuth()
    }, [])

    // Restoring token, show loading state
    if (isRestoring) {
        return (
            <div className="flex items-center justify-center h-screen">
                <div className="text-center">
                    <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-primary mx-auto mb-4"></div>
                    <p className="text-text-secondary">{t('common.verifying')}</p>
                </div>
            </div>
        )
    }

    // Restore failed or not logged in
    if (!isAuthenticated && !isLoggedIn()) {
        // Redirect to login with current path
        const currentPath = pathname + (searchParams?.toString() ? `?${searchParams.toString()}` : '')
        router.replace(`/login?redirect=${encodeURIComponent(currentPath)}`)
        return null
    }

    return <>{children}</>
}

export default ProtectedRoute
