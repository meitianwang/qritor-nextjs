'use client'

import { useState, useEffect, useRef } from 'react'
import { getLanguage, setLanguage, SUPPORTED_LANGUAGES, getCurrentLanguageInfo } from '@/i18n/index'
import { clearTranslationCache } from '@/i18n/translations'

interface LanguageSwitcherProps {
    variant?: 'dropdown' | 'inline'
    onLanguageChange?: (langCode: string) => void
    className?: string
}

/**
 * Language switcher component
 */
function LanguageSwitcher({ variant = 'dropdown', onLanguageChange, className = '' }: LanguageSwitcherProps) {
    const [isOpen, setIsOpen] = useState(false)
    const [currentLang, setCurrentLang] = useState(getLanguage())
    const dropdownRef = useRef<HTMLDivElement>(null)

    const currentLanguage = getCurrentLanguageInfo()

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

    const handleLanguageChange = async (langCode: string) => {
        setIsOpen(false)

        if (langCode === currentLang) return

        // Set language
        await setLanguage(langCode)
        setCurrentLang(langCode)

        // Clear translation cache
        clearTranslationCache()

        // Trigger callback
        if (onLanguageChange) {
            onLanguageChange(langCode)
        } else {
            // Default behavior: reload page to apply new language
            window.location.reload()
        }
    }

    // Dropdown style
    if (variant === 'dropdown') {
        return (
            <div
                className={`language-switcher ${isOpen ? 'open' : ''} ${className}`}
                ref={dropdownRef}
                style={{
                    position: 'relative',
                    display: 'inline-block'
                }}
            >
                <button
                    className="language-switcher-trigger"
                    onClick={(e) => {
                        e.stopPropagation()
                        setIsOpen(!isOpen)
                    }}
                    style={{
                        display: 'flex',
                        alignItems: 'center',
                        gap: '0.5rem',
                        padding: '0.5rem 0.75rem',
                        background: 'transparent',
                        border: '1px solid var(--color-border, rgba(255,255,255,0.1))',
                        borderRadius: '0.5rem',
                        color: 'var(--color-text-secondary, #888)',
                        cursor: 'pointer',
                        fontSize: '0.875rem',
                        transition: 'all 0.2s'
                    }}
                >
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                        <circle cx="12" cy="12" r="10" />
                        <line x1="2" y1="12" x2="22" y2="12" />
                        <path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z" />
                    </svg>
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

                {isOpen && (
                    <div
                        className="language-switcher-dropdown"
                        style={{
                            position: 'absolute',
                            bottom: '100%',
                            right: 0,
                            marginBottom: '0.5rem',
                            background: 'var(--color-bg-secondary, #1a1a1a)',
                            border: '1px solid var(--color-border, rgba(255,255,255,0.1))',
                            borderRadius: '0.5rem',
                            overflow: 'visible',
                            minWidth: '140px',
                            boxShadow: '0 4px 12px rgba(0,0,0,0.3)',
                            zIndex: 9999,
                            opacity: 1,
                            visibility: 'visible' as const,
                            transform: 'translateY(0)',
                            top: 'auto'
                        }}
                    >
                        {Object.values(SUPPORTED_LANGUAGES).map((lang) => (
                            <button
                                key={lang.code}
                                className={`language-option ${lang.code === currentLang ? 'active' : ''}`}
                                onClick={() => handleLanguageChange(lang.code)}
                                style={{
                                    display: 'flex',
                                    alignItems: 'center',
                                    gap: '0.5rem',
                                    width: '100%',
                                    padding: '0.625rem 0.875rem',
                                    background: lang.code === currentLang ? 'var(--color-primary, #6366f1)' : 'transparent',
                                    border: 'none',
                                    color: lang.code === currentLang ? '#fff' : 'var(--color-text-primary, #fff)',
                                    cursor: 'pointer',
                                    fontSize: '0.875rem',
                                    textAlign: 'left' as const,
                                    transition: 'background 0.2s'
                                }}
                            >
                                <span className="flag-icon">{lang.flag}</span>
                                <span>{lang.name}</span>
                            </button>
                        ))}
                    </div>
                )}
            </div>
        )
    }

    // Inline button style (for Docs Header)
    return (
        <div className={`language-switcher language-switcher-inline ${className}`} ref={dropdownRef}>
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
            {isOpen && (
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
            )}
        </div>
    )
}

export default LanguageSwitcher
