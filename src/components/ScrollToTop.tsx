'use client'

import { useEffect } from 'react'
import { usePathname } from 'next/navigation'

/**
 * ScrollToTop component
 * Automatically scrolls to top of page on route change
 */
function ScrollToTop() {
    const pathname = usePathname()

    useEffect(() => {
        window.scrollTo(0, 0)
    }, [pathname])

    return null
}

export default ScrollToTop
