/**
 * AppLink - Smart application link component
 *
 * Automatically determines whether to use internal or cross-app navigation:
 * - Internal navigation: Uses Next.js Link
 * - Cross-app navigation: Uses plain <a> tag
 *
 * Usage:
 * <AppLink to="/pricing">Pricing</AppLink>           // internal
 * <AppLink app="admin" to="/users">User Management</AppLink>  // cross-app
 * <AppLink app="studio">Studio</AppLink>     // cross-app home
 */

import Link from 'next/link'
import { getAppUrl } from '@/lib/auth-utils'
import { type ReactNode, type CSSProperties, type MouseEventHandler } from 'react'

// Current app name
let currentApp = 'portal'

/**
 * Set current app name
 * Should be called at app entry point
 */
export function setCurrentApp(appName: string): void {
    currentApp = appName
}

interface AppLinkProps {
    app?: string
    to?: string
    children?: ReactNode
    className?: string
    style?: CSSProperties
    onClick?: MouseEventHandler
    [key: string]: unknown
}

/**
 * AppLink component
 */
export function AppLink({
    app,
    to = '/',
    children,
    className,
    style,
    onClick,
    ...rest
}: AppLinkProps) {
    // If no target app specified, or target is current app, use Next.js Link
    if (!app || app === currentApp) {
        return (
            <Link
                href={to}
                className={className}
                style={style}
                onClick={onClick}
                {...rest}
            >
                {children}
            </Link>
        )
    }

    // Cross-app navigation: use plain <a> tag
    const targetUrl = getAppUrl(app)
    const fullUrl = to.startsWith('/') ? `${targetUrl}${to}` : `${targetUrl}/${to}`

    return (
        <a
            href={fullUrl}
            className={className}
            style={style}
            onClick={onClick}
            {...rest}
        >
            {children}
        </a>
    )
}

export default AppLink
