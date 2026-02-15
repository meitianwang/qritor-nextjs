'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { useAuth } from '@/hooks/useAuth'
import { useTranslation } from '@/hooks/useTranslation'
import { useState, useEffect, useRef } from 'react'
import UserAvatar from '@/components/UserAvatar'
import { SocialIcon } from '@/components/SocialIcons'
import { ChevronDownIcon, ExternalLinkIcon, GiftIcon, LogoutIcon } from '@/components/Icons'
import { getEnabledSocialLinks } from '@/lib/config/socialLinks'

/**
 * Portal website navigation bar - supports i18n
 */
function PortalHeader() {
    const pathname = usePathname()
    const { isLoggedIn, getUser, logout, restoreToken } = useAuth()
    const { t } = useTranslation('portal')
    const [showDropdown, setShowDropdown] = useState(false)
    const [showCommunityDropdown, setShowCommunityDropdown] = useState(false)
    const [showMobileMenu, setShowMobileMenu] = useState(false)
    const [isRestoring, setIsRestoring] = useState(true)
    const dropdownRef = useRef<HTMLDivElement>(null)
    const communityDropdownRef = useRef<HTMLDivElement>(null)

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
            if (communityDropdownRef.current && !communityDropdownRef.current.contains(e.target as Node)) {
                setShowCommunityDropdown(false)
            }
        }
        document.addEventListener('click', handleClickOutside)
        return () => document.removeEventListener('click', handleClickOutside)
    }, [])

    return (
        <>
            {/* Top mask layer - covers content scrolling above navbar */}
            <div className="navbar-top-mask"></div>
            <nav className="navbar">
                <div className="container">
                    {/* Logo + Brand name */}
                    <Link href="/" className="navbar-logo">
                        <img src="/images/logo.png" alt="Qritor Logo" className="logo-img" />
                        <span className="logo-text">Qritor</span>
                    </Link>

                    {/* Navigation links */}
                    <div className={`navbar-menu ${showMobileMenu ? 'show' : ''}`}>
                        <Link href="/pricing" className="navbar-link" onClick={() => setShowMobileMenu(false)}>{t('header.pricing')}</Link>
                        <a href="/docs/" className="navbar-link" target="_blank" rel="noopener noreferrer" onClick={() => setShowMobileMenu(false)}>{t('header.docs')}</a>
                        <Link href="/changelog" className="navbar-link" onClick={() => setShowMobileMenu(false)}>{t('header.changelog')}</Link>

                        {/* Community dropdown */}
                        <div className="community-dropdown-wrapper" ref={communityDropdownRef}>
                            <button
                                className={`navbar-link community-dropdown-trigger ${showCommunityDropdown ? 'active' : ''}`}
                                onClick={(e) => {
                                    e.stopPropagation()
                                    setShowCommunityDropdown(!showCommunityDropdown)
                                }}
                            >
                                {t('header.community')}
                                <ChevronDownIcon
                                    size={12}
                                    className={`community-dropdown-arrow ${showCommunityDropdown ? 'rotated' : ''}`}
                                />
                            </button>
                            <div className={`community-dropdown ${showCommunityDropdown ? 'show' : ''}`}>
                                {getEnabledSocialLinks().map(({ key, icon, url }) => (
                                    <a
                                        key={key}
                                        href={url}
                                        target="_blank"
                                        rel="noopener noreferrer"
                                        className="community-dropdown-item"
                                        onClick={() => {
                                            setShowCommunityDropdown(false)
                                            setShowMobileMenu(false)
                                        }}
                                    >
                                        <div className="community-dropdown-icon">
                                            <SocialIcon name={icon} />
                                        </div>
                                        <span>{t(`header.social.${key}`)}</span>
                                        <ExternalLinkIcon className="external-link-icon" size={12} />
                                    </a>
                                ))}
                            </div>
                        </div>

                        {/* Mobile-only action buttons - bottom */}
                        <div className="navbar-menu-actions">
                            <Link href="/login" className="btn btn-ghost btn-block" onClick={() => setShowMobileMenu(false)}>
                                {t('common.login')}
                            </Link>
                            <Link href="/download" className="btn btn-primary btn-block" onClick={() => setShowMobileMenu(false)}>
                                {t('header.start')}
                            </Link>
                        </div>
                    </div>

                    {/* Right action area */}
                    <div className="navbar-actions">
                        {/* Get more credits button - always visible */}
                        <Link href="/referral" className="btn-earn-credits" title={t('common.getMoreCredits')}>
                            <GiftIcon size={16} />
                        </Link>
                        {isLoggedIn() && user ? (
                            <>
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
                            </>
                        ) : (
                            <Link href="/login" className="btn btn-ghost">{t('common.login')}</Link>
                        )}
                        {/* Download button always visible */}
                        <Link href="/download" className="btn btn-white btn-press">{t('header.start')}</Link>
                        <button
                            className={`navbar-mobile-toggle ${showMobileMenu ? 'open' : ''}`}
                            aria-label="Menu"
                            onClick={() => setShowMobileMenu(!showMobileMenu)}
                        >
                            <span></span>
                            <span></span>
                            <span></span>
                        </button>
                    </div>
                </div>
            </nav>
        </>
    )
}

export default PortalHeader
