'use client'

import Link from 'next/link'
import { useState, useEffect, useRef } from 'react'
import DocsLanguageSwitcher from '@/components/docs/DocsLanguageSwitcher'
import DocsSearch from '@/components/docs/DocsSearch'
import { useAuth } from '@/hooks/useAuth'
import { useTranslation } from '@/hooks/useTranslation'
import UserAvatar from '@/components/UserAvatar'
import { LogoutIcon } from '@/components/Icons'

// Download button multilingual text
const downloadTexts: Record<string, string> = {
    zh: '下载',
    en: 'Download'
}

// Login button multilingual text
const loginTexts: Record<string, string> = {
    zh: '登录',
    en: 'Login'
}

function getDownloadText(lang: string): string {
    return downloadTexts[lang] || downloadTexts.en
}

function getLoginText(lang: string): string {
    return loginTexts[lang] || loginTexts.en
}

interface DocsHeaderProps {
    currentLang: string
}

/**
 * Docs page top navigation bar
 * Layout: Left(Logo + Language Switch) | Center(Search) | Right(Download + Icons)
 */
function DocsHeader({ currentLang }: DocsHeaderProps) {
    const { isLoggedIn, getUser, logout, restoreToken } = useAuth()
    const { t } = useTranslation('portal')
    const [showDropdown, setShowDropdown] = useState(false)
    const [isRestoring, setIsRestoring] = useState(true)
    const dropdownRef = useRef<HTMLDivElement>(null)

    const user = getUser()

    // Restore token on mount
    useEffect(() => {
        const restore = async () => {
            await restoreToken()
            setIsRestoring(false)
        }
        restore()
    }, [restoreToken])

    // Close dropdown on outside click
    useEffect(() => {
        const handleClickOutside = (e: MouseEvent) => {
            if (dropdownRef.current && !dropdownRef.current.contains(e.target as Node)) {
                setShowDropdown(false)
            }
        }
        document.addEventListener('click', handleClickOutside)
        return () => document.removeEventListener('click', handleClickOutside)
    }, [])

    return (
        <nav className="navbar docs-navbar">
            <div className="container">
                {/* Left: Logo + Language Switch */}
                <div className="navbar-left">
                    <Link href="/" className="navbar-logo">
                        <img src="/images/logo.png" alt="Qritor Logo" className="logo-img" />
                        <span className="logo-text">Qritor</span>
                    </Link>
                    <DocsLanguageSwitcher currentLang={currentLang} />
                </div>

                {/* Center: Search */}
                <div className="navbar-center">
                    <DocsSearch currentLang={currentLang} />
                </div>

                {/* Right: Download + User Avatar/Login */}
                <div className="navbar-actions">
                    <Link href="/download" className="btn btn-primary btn-press">
                        {getDownloadText(currentLang)}
                        <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" style={{ marginLeft: '4px' }}>
                            <polyline points="9 18 15 12 9 6"></polyline>
                        </svg>
                    </Link>
                    {/* User avatar / login button */}
                    {!isRestoring && isLoggedIn() && user ? (
                        <div className="user-menu" ref={dropdownRef}>
                            <button
                                className="user-avatar-trigger"
                                onClick={(e) => {
                                    e.stopPropagation()
                                    setShowDropdown(!showDropdown)
                                }}
                            >
                                <UserAvatar nickname={user.nickname as string} avatarUrl={user.avatar as string} size={32} />
                            </button>
                            <div className={`user-dropdown ${showDropdown ? 'show' : ''}`}>
                                <Link href="/profile" className="user-dropdown-header" onClick={() => setShowDropdown(false)}>
                                    <span className="user-name">{(user.nickname as string) || t('common.user')}</span>
                                    <span className="user-email">{user.email as string}</span>
                                </Link>
                                <div className="user-dropdown-divider"></div>
                                <Link href="/profile" className="user-dropdown-item" onClick={() => setShowDropdown(false)}>
                                    {t('header.profile')}
                                </Link>
                                <button className="user-dropdown-item user-dropdown-logout" onClick={logout}>
                                    <span>{t('common.logout')}</span>
                                    <LogoutIcon size={16} />
                                </button>
                            </div>
                        </div>
                    ) : (
                        <Link href="/login" className="btn btn-ghost">{getLoginText(currentLang)}</Link>
                    )}
                </div>
            </div>
        </nav>
    )
}

export default DocsHeader
