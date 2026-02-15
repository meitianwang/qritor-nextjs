'use client'

import { useState, useEffect, useRef } from 'react'
import { useRouter } from 'next/navigation'
import { SUPPORTED_LANGUAGES } from '@/i18n/index'

interface DocsLanguageSwitcherProps {
    currentLang: string
}

/**
 * Docs-specific language switcher component
 * Handles URL path-based language switching for docs pages
 */
function DocsLanguageSwitcher({ currentLang }: DocsLanguageSwitcherProps) {
    const [isOpen, setIsOpen] = useState(false)
    const router = useRouter()
    const dropdownRef = useRef<HTMLDivElement>(null)

    const currentLanguage = SUPPORTED_LANGUAGES[currentLang] || SUPPORTED_LANGUAGES.zh

    // Close dropdown on outside click
    useEffect(() => {
        const handleClickOutside = (e: MouseEvent) => {
            if (dropdownRef.current && !dropdownRef.current.contains(e.target as Node)) {
                setIsOpen(false)
            }
        }
        document.addEventListener('click', handleClickOutside)
        return () => document.removeEventListener('click', handleClickOutside)
    }, [])

    const handleLanguageChange = (langCode: string) => {
        setIsOpen(false)
        // Get current path and replace language part
        const currentPath = window.location.pathname
        let newPath: string

        // Check if using /docs/ prefix pattern
        if (currentPath.startsWith('/docs/')) {
            newPath = currentPath.replace(/^\/docs\/(zh-TW|zh|en|de|fr|ja|ko|es|pt|ar|ru|hi)/, `/docs/${langCode}`)
        } else {
            // Subdomain pattern: path starts with /zh or /en, or is root
            newPath = currentPath.replace(/^\/(zh-TW|zh|en|de|fr|ja|ko|es|pt|ar|ru|hi)(\/|$)/, `/${langCode}$2`)
            // If path is root /, replace with /langCode
            if (newPath === '/' || newPath === '') {
                newPath = `/${langCode}/`
            }
        }
        router.push(newPath)
    }

    return (
        <div
            className={`language-switcher ${isOpen ? 'open' : ''}`}
            ref={dropdownRef}
        >
            <button
                className="language-switcher-trigger"
                onClick={(e) => {
                    e.stopPropagation()
                    setIsOpen(!isOpen)
                }}
            >
                <span className="flag-icon">{currentLanguage.flag}</span>
                <span>{currentLanguage.name}</span>
                <svg
                    width="12"
                    height="12"
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke="currentColor"
                    strokeWidth="2"
                    style={{ transform: isOpen ? 'rotate(180deg)' : 'none', transition: 'transform 0.2s' }}
                >
                    <polyline points="6 9 12 15 18 9"></polyline>
                </svg>
            </button>
            <div className="language-switcher-dropdown">
                {Object.values(SUPPORTED_LANGUAGES).map((lang) => (
                    <button
                        key={lang.code}
                        className={`language-option ${lang.code === currentLang ? 'active' : ''}`}
                        onClick={() => handleLanguageChange(lang.code)}
                    >
                        <span className="flag-icon">{lang.flag}</span>
                        <span>{lang.name}</span>
                    </button>
                ))}
            </div>
        </div>
    )
}

export default DocsLanguageSwitcher
