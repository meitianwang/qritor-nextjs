'use client'

import { useState, useEffect } from 'react'
import Link from 'next/link'
import { useAuth } from '@/hooks/useAuth'
import { useTranslation } from '@/hooks/useTranslation'
import { authFetch, apiFetch } from '@/lib/auth-utils'

interface ReferralInfo {
    referralLink?: string
    referralCode?: string
    invitedCount?: number
    earnedCredits?: number
}

interface ReferralConfig {
    inviterReward?: number
    inviteeReward?: number
    maxReward?: number
    milestoneCount?: number
    milestoneReward?: number
    monthlyLimit?: number
}

/**
 * Referral page
 * Users can get referral links/codes and invite friends to earn credits
 */
export default function ReferralPage() {
    const { isLoggedIn, restoreToken } = useAuth()
    const [referralInfo, setReferralInfo] = useState<ReferralInfo | null>(null)
    const [referralConfig, setReferralConfig] = useState<ReferralConfig | null>(null)
    const [loading, setLoading] = useState(true)
    const [authReady, setAuthReady] = useState(false)
    const [copySuccess, setCopySuccess] = useState(false)
    const [copyCodeSuccess, setCopyCodeSuccess] = useState(false)
    const { t } = useTranslation('portal')
    const loggedIn = authReady && isLoggedIn()

    // Fetch referral config (public endpoint, no login required)
    useEffect(() => {
        const fetchReferralConfig = async () => {
            try {
                const response = await apiFetch('/api/referral/config')
                const result = await response.json()
                if (result.code === 200) {
                    setReferralConfig(result.data)
                }
            } catch (error) {
                console.error('Failed to fetch referral config:', error)
            }
        }
        fetchReferralConfig()
    }, [])

    // Restore auth state first to avoid stale local user state.
    useEffect(() => {
        let cancelled = false
        const restore = async () => {
            await restoreToken()
            if (!cancelled) {
                setAuthReady(true)
            }
        }
        restore()
        return () => {
            cancelled = true
        }
    }, [restoreToken])

    // Fetch referral info (requires login)
    useEffect(() => {
        if (!authReady) {
            return
        }

        if (!loggedIn) {
            setLoading(false)
            return
        }

        const fetchReferralInfo = async () => {
            try {
                const response = await authFetch('/api/referral/info')
                const result = await response.json()
                if (result.code === 200) {
                    setReferralInfo(result.data)
                }
            } catch (error) {
                console.error('Failed to fetch referral info:', error)
            } finally {
                setLoading(false)
            }
        }

        fetchReferralInfo()
    }, [authReady, loggedIn])

    // Copy referral link
    const copyReferralLink = async () => {
        const link = referralInfo?.referralLink
        if (!link) {
            console.warn('No referral link available to copy')
            return
        }

        try {
            if (navigator.clipboard && window.isSecureContext) {
                await navigator.clipboard.writeText(link)
            } else {
                const textArea = document.createElement('textarea')
                textArea.value = link
                textArea.style.position = 'fixed'
                textArea.style.left = '-999999px'
                textArea.style.top = '-999999px'
                document.body.appendChild(textArea)
                textArea.focus()
                textArea.select()
                document.execCommand('copy')
                document.body.removeChild(textArea)
            }
            setCopySuccess(true)
            setTimeout(() => setCopySuccess(false), 2000)
        } catch (error) {
            console.error('Failed to copy referral link:', error)
        }
    }

    // Copy referral code
    const copyReferralCode = async () => {
        const code = referralInfo?.referralCode
        if (!code) {
            console.warn('No referral code available to copy')
            return
        }

        try {
            if (navigator.clipboard && window.isSecureContext) {
                await navigator.clipboard.writeText(code)
            } else {
                const textArea = document.createElement('textarea')
                textArea.value = code
                textArea.style.position = 'fixed'
                textArea.style.left = '-999999px'
                textArea.style.top = '-999999px'
                document.body.appendChild(textArea)
                textArea.focus()
                textArea.select()
                document.execCommand('copy')
                document.body.removeChild(textArea)
            }
            setCopyCodeSuccess(true)
            setTimeout(() => setCopyCodeSuccess(false), 2000)
        } catch (error) {
            console.error('Failed to copy referral code:', error)
        }
    }

    return (
        <main className="referral-page">
                {/* Background decoration */}
                <div className="hero-glow">
                    <div className="hero-glow-orb hero-glow-orb-1"></div>
                    <div className="hero-glow-orb hero-glow-orb-2"></div>
                </div>

                <div className="container">
                    {/* Hero card area: Qoder style */}
                    <div className="referral-hero-card">
                        {/* Top illustration */}
                        <div className="referral-hero-image">
                            <img src="/images/referral-header.png" alt="Credits Rewards" />
                        </div>

                        {/* Card content */}
                        <div className="referral-hero-content">
                            <div className="referral-hero-subtitle">{t('referral.title')}</div>
                            <h1 className="referral-hero-title-new">
                                最高可获得 <span className="highlight-text">{referralConfig?.maxReward?.toLocaleString() || '--'}</span> 积分奖励
                            </h1>

                            {/* Referral link bar */}
                            <div className="referral-link-bar">
                                {loggedIn ? (
                                    <>
                                        <div className="referral-link-label">{t('referral.yourLink')}</div>
                                        <div className="referral-link-wrapper">
                                            <input
                                                type="text"
                                                readOnly
                                                value={referralInfo?.referralLink || t('common.loading')}
                                                className="referral-link-input-new"
                                            />
                                            <button
                                                className={`btn-copy-new ${copySuccess ? 'copied' : ''}`}
                                                onClick={copyReferralLink}
                                            >
                                                {copySuccess ? (
                                                    <>
                                                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>
                                                        {t('referral.copied')}
                                                    </>
                                                ) : (
                                                    <>
                                                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71"></path><path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71"></path></svg>
                                                        {t('referral.copy')}
                                                    </>
                                                )}
                                            </button>
                                        </div>
                                    </>
                                ) : (
                                    <Link href="/login" className="btn-login-for-link">
                                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                                            <path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4"></path>
                                            <polyline points="10 17 15 12 10 7"></polyline>
                                            <line x1="15" y1="12" x2="3" y2="12"></line>
                                        </svg>
                                        {t('common.login')}
                                    </Link>
                                )}
                            </div>
                        </div>
                    </div>

                    {/* Stats data */}
                    {loggedIn && (
                        <div className="referral-stats-grid">
                            <div className="referral-stat-card">
                                <div className="referral-stat-icon invited">
                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                                        <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                                        <circle cx="9" cy="7" r="4"></circle>
                                        <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                                        <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                                    </svg>
                                </div>
                                <div className="referral-stat-content">
                                    <span className="referral-stat-value">{referralInfo?.invitedCount || 0}</span>
                                    <span className="referral-stat-label">已邀请好友</span>
                                </div>
                            </div>
                            <div className="referral-stat-card">
                                <div className="referral-stat-icon credits">
                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                                        <circle cx="12" cy="12" r="10"></circle>
                                        <path d="M12 6v12"></path>
                                        <path d="M8 10h8"></path>
                                    </svg>
                                </div>
                                <div className="referral-stat-content">
                                    <span className="referral-stat-value">{referralInfo?.earnedCredits || 0}</span>
                                    <span className="referral-stat-label">获得积分</span>
                                </div>
                            </div>
                        </div>
                    )}

                    {/* Rules display */}
                    <div className="referral-rules-grid">
                        {/* Rule 1 */}
                        <div className="rule-card">
                            <div className="rule-icon-wrapper">
                                <svg className="rule-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5">
                                    <path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                                    <circle cx="8.5" cy="7" r="4"></circle>
                                    <path d="M20 8v6M23 11h-6"></path>
                                </svg>
                                <div className="rule-values">
                                    <span className="val-left">😁 {referralConfig?.inviterReward || '--'}</span>
                                    <span className="arrow">→</span>
                                    <span className="val-right">🎁 {referralConfig?.inviteeReward || '--'}</span>
                                </div>
                            </div>
                            <p className="rule-desc">
                                邀请的好友将获得 {referralConfig?.inviteeReward || '--'} 积分奖励。一旦他们使用至少 1 积分，你即可获得 {referralConfig?.inviterReward || '--'} 积分。
                            </p>
                        </div>

                        {/* Rule 2 */}
                        <div className="rule-card">
                            <div className="rule-icon-wrapper">
                                <svg className="rule-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5">
                                    <circle cx="12" cy="12" r="10"></circle>
                                    <polygon points="12 6 14 10 18 10 15 13 16 17 12 15 8 17 9 13 6 10 10 10"></polygon>
                                </svg>
                                <div className="rule-single-value">{referralConfig?.milestoneReward?.toLocaleString() || '--'}</div>
                            </div>
                            <p className="rule-desc">
                                每成功邀请 {referralConfig?.milestoneCount || '--'} 人试用，你将额外获得 {referralConfig?.milestoneReward?.toLocaleString() || '--'} 积分。
                            </p>
                        </div>

                        {/* Rule 3 */}
                        <div className="rule-card">
                            <div className="rule-icon-wrapper">
                                <svg className="rule-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5">
                                    <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                    <line x1="16" y1="2" x2="16" y2="6"></line>
                                    <line x1="8" y1="2" x2="8" y2="6"></line>
                                    <line x1="3" y1="10" x2="21" y2="10"></line>
                                </svg>
                                <div className="rule-single-value">{referralConfig?.monthlyLimit || '--'} : 👤</div>
                            </div>
                            <p className="rule-desc">
                                每个自然月，你邀请的好友中最多有 {referralConfig?.monthlyLimit || '--'} 人可为你带来奖励，超出部分将不再享受奖励。
                            </p>
                        </div>
                    </div>
                </div>
            </main>
    )
}
