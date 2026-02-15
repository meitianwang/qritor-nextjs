'use client'

import { useState } from 'react'
import { useParams } from 'next/navigation'
import DocsHeader from '@/components/docs/DocsHeader'
import DocsSidebar from '@/components/docs/DocsSidebar'

/**
 * Docs knowledge base page layout
 * Contains top navigation bar and sidebar
 */
export default function DocsLayout({
    children,
}: {
    children: React.ReactNode
}) {
    const params = useParams()
    const lang = (params.lang as string) || 'zh'
    const [sidebarOpen, setSidebarOpen] = useState(false)

    const toggleSidebar = () => setSidebarOpen(!sidebarOpen)
    const closeSidebar = () => setSidebarOpen(false)

    return (
        <div className="docs-page">
            <DocsHeader currentLang={lang} />
            <div className="docs-container">
                {/* Overlay */}
                <div
                    className={`docs-overlay ${sidebarOpen ? 'show' : ''}`}
                    onClick={closeSidebar}
                />
                <DocsSidebar
                    currentLang={lang}
                    isOpen={sidebarOpen}
                    onClose={closeSidebar}
                />
                <main className="docs-content">
                    {children}
                </main>
            </div>
            {/* Mobile sidebar toggle button */}
            <button
                className="docs-sidebar-toggle"
                onClick={toggleSidebar}
                aria-label="切换菜单"
            >
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                    {sidebarOpen ? (
                        <path d="M18 6L6 18M6 6l12 12" />
                    ) : (
                        <>
                            <line x1="3" y1="12" x2="21" y2="12" />
                            <line x1="3" y1="6" x2="21" y2="6" />
                            <line x1="3" y1="18" x2="21" y2="18" />
                        </>
                    )}
                </svg>
            </button>
        </div>
    )
}
