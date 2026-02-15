'use client'

import Link from 'next/link'
import { useState, useEffect } from 'react'
import { useAuth } from '@/hooks/useAuth'
import { useTranslation } from '@/hooks/useTranslation'
import { useDocumentMeta } from '@/hooks/useDocumentMeta'


/**
 * Landing page - supports internationalization
 */
export default function LandingPage() {
    const { isLoggedIn } = useAuth()
    const { t } = useTranslation('portal')
    const [downloadUrl, setDownloadUrl] = useState('')
    const [userOS, setUserOS] = useState('') // 'mac' or 'windows'

    // SEO
    useDocumentMeta({
        title: t('seo.landing.title'),
        description: t('seo.landing.description'),
        structuredData: {
            "@context": "https://schema.org",
            "@type": "WebApplication",
            "name": "Qritor",
            "applicationCategory": "Writing",
            "description": t('seo.landing.description'),
            "url": "https://qritor.com",
            "offers": {
                "@type": "Offer",
                "price": "0",
                "priceCurrency": "USD"
            }
        }
    })

    // Detect user system and set download URL
    useEffect(() => {
        const detectSystemAndSetDownloadUrl = async () => {
            const userAgent = navigator.userAgent.toLowerCase()

            // Detect Windows
            if (userAgent.includes('windows') || userAgent.includes('win32') || userAgent.includes('win64')) {
                setUserOS('windows')
                setDownloadUrl('https://asset.qritor.com/download/win')
                return
            }

            // Detect macOS
            if (userAgent.includes('mac') || userAgent.includes('macintosh')) {
                setUserOS('mac')
                try {
                    const nav = navigator as Navigator & { userAgentData?: { getHighEntropyValues: (hints: string[]) => Promise<{ architecture: string }> } }
                    if (nav.userAgentData) {
                        const hints = await nav.userAgentData.getHighEntropyValues(['architecture'])
                        const isAppleSilicon = hints.architecture === 'arm'
                        setDownloadUrl(
                            isAppleSilicon
                                ? 'https://asset.qritor.com/download/mac/arm64'
                                : 'https://asset.qritor.com/download/mac/x64'
                        )
                    } else {
                        setDownloadUrl('https://asset.qritor.com/download/mac/arm64')
                    }
                } catch {
                    setDownloadUrl('https://asset.qritor.com/download/mac/arm64')
                }
                return
            }

            // Default
            setUserOS('mac')
            setDownloadUrl('/download')
        }

        detectSystemAndSetDownloadUrl()
    }, [])

    return (
        <>
            {/* Hero Section */}
            <section className="hero">
                {/* Glow background */}
                <div className="hero-glow">
                    <div className="hero-glow-orb hero-glow-orb-1"></div>
                    <div className="hero-glow-orb hero-glow-orb-2"></div>
                    <div className="hero-glow-orb hero-glow-orb-3"></div>
                </div>

                <div className="hero-content">
                    <div className="hero-badge animate-fade-in">
                        <span className="hero-badge-dot"></span>
                        <span>{t('landing.heroBadge')}</span>
                    </div>

                    <h1 className="hero-title animate-fade-in delay-100">
                        {t('landing.heroTitle')}
                    </h1>

                    <p className="hero-subtitle animate-fade-in delay-200">
                        {t('landing.heroSubtitle')}
                    </p>

                    <div className="hero-actions animate-fade-in delay-300">
                        <a
                            href={downloadUrl}
                            className="btn btn-primary btn-large btn-press hover-glow"
                            download
                        >
                            {userOS === 'mac' ? (
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor">
                                    <path d="M18.71 19.5c-.83 1.24-1.71 2.45-3.05 2.47-1.34.03-1.77-.79-3.29-.79-1.53 0-2 .77-3.27.82-1.31.05-2.3-1.32-3.14-2.53C4.25 17 2.94 12.45 4.7 9.39c.87-1.52 2.43-2.48 4.12-2.51 1.28-.02 2.5.87 3.29.87.78 0 2.26-1.07 3.81-.91.65.03 2.47.26 3.64 1.98-.09.06-2.17 1.28-2.15 3.81.03 3.02 2.65 4.03 2.68 4.04-.03.07-.42 1.44-1.38 2.83M13 3.5c.73-.83 1.94-1.46 2.94-1.5.13 1.17-.34 2.35-1.04 3.19-.69.85-1.83 1.51-2.95 1.42-.15-1.15.41-2.35 1.05-3.11z" />
                                </svg>
                            ) : (
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor">
                                    <path d="M3 12V6.75l6-1.32v6.48L3 12zm17-9v8.75l-10 .15V5.21L20 3zM3 13l6 .09v6.81l-6-1.15V13zm17 .25V22l-10-1.91V13l10 .25z" />
                                </svg>
                            )}
                            {t('common.downloadNow')}
                        </a>
                        <Link href="/download" className="btn btn-secondary btn-large btn-press">
                            {t('common.allDownloads')}
                        </Link>
                    </div>
                </div>
            </section>

            {/* Features Section */}
            <section className="features">
                <div className="container">
                    {/* AI Writing Assistant */}
                    <div className="feature-section">
                        <div className="feature-grid">
                            <div className="feature-content">
                                <span className="feature-tag">{t('landing.features.aiWriting.tag')}</span>
                                <h2 className="feature-title">{t('landing.features.aiWriting.title')}</h2>
                                <p className="feature-description">
                                    {t('landing.features.aiWriting.description')}
                                </p>
                            </div>
                            <div className="feature-visual hover-lift">
                                <div className="feature-visual-inner">
                                    <span className="feature-visual-placeholder">✨</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    {/* Modular Creation */}
                    <div className="feature-section">
                        <div className="feature-grid">
                            <div className="feature-content">
                                <span className="feature-tag">{t('landing.features.modular.tag')}</span>
                                <h2 className="feature-title">{t('landing.features.modular.title')}</h2>
                                <p className="feature-description">
                                    {t('landing.features.modular.description')}
                                </p>
                            </div>
                            <div className="feature-visual hover-lift">
                                <div className="feature-visual-inner">
                                    <span className="feature-visual-placeholder">📚</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    {/* Workflow Engine */}
                    <div className="feature-section">
                        <div className="feature-grid">
                            <div className="feature-content">
                                <span className="feature-tag">{t('landing.features.workflow.tag')}</span>
                                <h2 className="feature-title">{t('landing.features.workflow.title')}</h2>
                                <p className="feature-description">
                                    {t('landing.features.workflow.description')}
                                </p>
                            </div>
                            <div className="feature-visual hover-lift">
                                <div className="feature-visual-inner">
                                    <span className="feature-visual-placeholder">⚙️</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    {/* Comic Generation */}
                    <div className="feature-section">
                        <div className="feature-grid">
                            <div className="feature-content">
                                <span className="feature-tag">{t('landing.features.comic.tag')}</span>
                                <h2 className="feature-title">{t('landing.features.comic.title')}</h2>
                                <p className="feature-description">
                                    {t('landing.features.comic.description')}
                                </p>
                            </div>
                            <div className="feature-visual hover-lift">
                                <div className="feature-visual-inner">
                                    <span className="feature-visual-placeholder">🎨</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    {/* Animation Production */}
                    <div className="feature-section">
                        <div className="feature-grid">
                            <div className="feature-content">
                                <span className="feature-tag">{t('landing.features.animation.tag')}</span>
                                <h2 className="feature-title">{t('landing.features.animation.title')}</h2>
                                <p className="feature-description">
                                    {t('landing.features.animation.description')}
                                </p>
                            </div>
                            <div className="feature-visual hover-lift">
                                <div className="feature-visual-inner">
                                    <span className="feature-visual-placeholder">🎬</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            {/* CTA Section - Deep starfield effect */}
            <section className="cta-starfield">
                {/* Flowing stars */}
                <div className="stars-container">
                    {[...Array(50)].map((_, i) => (
                        <div
                            key={i}
                            className="star"
                            style={{
                                left: `${Math.random() * 100}%`,
                                top: `${Math.random() * 100}%`,
                                animationDelay: `${Math.random() * 3}s`,
                                animationDuration: `${2 + Math.random() * 3}s`
                            }}
                        />
                    ))}
                </div>
                <div className="container">
                    <div className="cta-content">
                        <h2 className="cta-title">{t('landing.ctaTitle')}</h2>
                        <p className="cta-description">
                            {t('landing.ctaDescription')}
                        </p>
                        <a
                            href={downloadUrl}
                            className="btn btn-white btn-large"
                            download
                        >
                            {userOS === 'mac' ? (
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor">
                                    <path d="M18.71 19.5c-.83 1.24-1.71 2.45-3.05 2.47-1.34.03-1.77-.79-3.29-.79-1.53 0-2 .77-3.27.82-1.31.05-2.3-1.32-3.14-2.53C4.25 17 2.94 12.45 4.7 9.39c.87-1.52 2.43-2.48 4.12-2.51 1.28-.02 2.5.87 3.29.87.78 0 2.26-1.07 3.81-.91.65.03 2.47.26 3.64 1.98-.09.06-2.17 1.28-2.15 3.81.03 3.02 2.65 4.03 2.68 4.04-.03.07-.42 1.44-1.38 2.83M13 3.5c.73-.83 1.94-1.46 2.94-1.5.13 1.17-.34 2.35-1.04 3.19-.69.85-1.83 1.51-2.95 1.42-.15-1.15.41-2.35 1.05-3.11z" />
                                </svg>
                            ) : (
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor">
                                    <path d="M3 12V6.75l6-1.32v6.48L3 12zm17-9v8.75l-10 .15V5.21L20 3zM3 13l6 .09v6.81l-6-1.15V13zm17 .25V22l-10-1.91V13l10 .25z" />
                                </svg>
                            )}
                            {t('common.downloadNow')}
                        </a>
                    </div>
                </div>
            </section>

        </>
    )
}
