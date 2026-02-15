'use client'

import { usePathname } from 'next/navigation'
import PortalHeader from '@/components/PortalHeader'
import PortalFooter from '@/components/PortalFooter'
import ScrollToTop from '@/components/ScrollToTop'

// Pages where header/footer should be hidden (auth pages, docs, etc.)
const noLayoutPaths = ['/login', '/register', '/forgot-password', '/desktop-login-success']
const docsPrefix = '/docs'

interface LayoutShellProps {
    children: React.ReactNode
}

/**
 * Client-side layout shell
 * Wraps children with PortalHeader, PortalFooter, and ScrollToTop
 * Conditionally hides header/footer for certain routes
 */
export default function LayoutShell({ children }: LayoutShellProps) {
    const pathname = usePathname()

    const isAuthPage = noLayoutPaths.some(path => pathname.startsWith(path))
    const isDocsPage = pathname.startsWith(docsPrefix)
    const hideLayout = isAuthPage || isDocsPage

    return (
        <>
            <ScrollToTop />
            {!hideLayout && <PortalHeader />}
            {children}
            {!hideLayout && <PortalFooter />}
        </>
    )
}
