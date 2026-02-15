'use client'

import { useState, useMemo } from 'react'
import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { docsNavigation } from '@/data/docsData'

interface NavChild {
    id: string
    title: string
    path: string
}

interface NavItem {
    id: string
    title: string
    path: string
    children?: NavChild[]
}

interface NavSection {
    title: string
    items: NavItem[]
}

export interface DocsSidebarProps {
    currentLang: string
    isOpen: boolean
    onClose?: () => void
    navigation?: Record<string, NavSection>
}

/**
 * Docs sidebar navigation component
 */
function DocsSidebar({ currentLang, isOpen, onClose, navigation: navProp }: DocsSidebarProps) {
    const navigation = useMemo(() => {
        if (navProp) return navProp
        const langNav = docsNavigation[currentLang] || docsNavigation['zh']
        return langNav as unknown as Record<string, NavSection>
    }, [navProp, currentLang])
    const pathname = usePathname()
    const [expandedItems, setExpandedItems] = useState<Record<string, boolean>>({})

    const toggleExpand = (id: string) => {
        setExpandedItems(prev => ({
            ...prev,
            [id]: !prev[id]
        }))
    }

    const isActive = (path: string): boolean => {
        return pathname === path ||
            (path.endsWith('/') && pathname === path.slice(0, -1))
    }

    const handleLinkClick = () => {
        // Close sidebar on mobile after clicking a link
        if (onClose) {
            onClose()
        }
    }

    const renderNavItem = (item: NavItem) => {
        const hasChildren = item.children && item.children.length > 0
        const isExpanded = expandedItems[item.id]
        const active = isActive(item.path)

        return (
            <div key={item.id}>
                {hasChildren ? (
                    <>
                        <button
                            className={`docs-sidebar-item ${isExpanded ? 'expanded' : ''} ${active ? 'active' : ''}`}
                            onClick={() => toggleExpand(item.id)}
                        >
                            <span>{item.title}</span>
                            <svg
                                className="docs-sidebar-item-icon"
                                width="16"
                                height="16"
                                viewBox="0 0 24 24"
                                fill="none"
                                stroke="currentColor"
                                strokeWidth="2"
                            >
                                <polyline points="9 18 15 12 9 6"></polyline>
                            </svg>
                        </button>
                        <div className={`docs-sidebar-subnav ${isExpanded ? 'expanded' : ''}`}>
                            {item.children!.map(child => (
                                <Link
                                    key={child.id}
                                    href={child.path}
                                    className={`docs-sidebar-subitem ${isActive(child.path) ? 'active' : ''}`}
                                    onClick={handleLinkClick}
                                >
                                    {child.title}
                                </Link>
                            ))}
                        </div>
                    </>
                ) : (
                    <Link
                        href={item.path}
                        className={`docs-sidebar-item ${active ? 'active' : ''}`}
                        onClick={handleLinkClick}
                    >
                        <span>{item.title}</span>
                    </Link>
                )}
            </div>
        )
    }

    return (
        <aside className={`docs-sidebar ${isOpen ? 'open' : ''}`}>
            {Object.entries(navigation).map(([key, section]) => (
                <div key={key} className="docs-sidebar-section">
                    <div className="docs-sidebar-title">{section.title}</div>
                    <nav className="docs-sidebar-nav">
                        {section.items.map(item => renderNavItem(item))}
                    </nav>
                </div>
            ))}
        </aside>
    )
}

export default DocsSidebar
