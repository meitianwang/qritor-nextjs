'use client'

import { useTranslation } from '@/hooks/useTranslation'
import { useDocumentMeta } from '@/hooks/useDocumentMeta'

/**
 * Changelog data
 * In production, this could come from an API or parsed Markdown files
 */
const changelogData = [
    {
        date: '2026-02-27',
        version: 'v1.0.0',
        title: 'changelog.entries.v1_0_0.title',
        tags: ['new', 'improved'],
        sections: [
            {
                type: 'new',
                titleKey: 'changelog.sections.newFeatures',
                items: [
                    'changelog.entries.v1_0_0.new.item1',
                    'changelog.entries.v1_0_0.new.item2',
                    'changelog.entries.v1_0_0.new.item3',
                    'changelog.entries.v1_0_0.new.item4',
                    'changelog.entries.v1_0_0.new.item5'
                ]
            },
            {
                type: 'improved',
                titleKey: 'changelog.sections.improvements',
                items: [
                    'changelog.entries.v1_0_0.improved.item1',
                    'changelog.entries.v1_0_0.improved.item2'
                ]
            }
        ]
    },
    {
        date: '2026-01-13',
        version: 'v0.3.0',
        title: 'changelog.entries.v0_3_0.title',
        tags: ['new', 'fixed'],
        sections: [
            {
                type: 'new',
                titleKey: 'changelog.sections.newFeatures',
                items: [
                    'changelog.entries.v0_3_0.new.item1',
                    'changelog.entries.v0_3_0.new.item2',
                    'changelog.entries.v0_3_0.new.item3',
                    'changelog.entries.v0_3_0.new.item4',
                ]
            },
            {
                type: 'fixed',
                titleKey: 'changelog.sections.bugFixes',
                items: [
                    'changelog.entries.v0_3_0.fixed.item1',
                    'changelog.entries.v0_3_0.fixed.item2',
                ]
            }
        ]
    },
    {
        date: '2026-01-10',
        version: 'v0.2.1',
        title: 'changelog.entries.v0_2_1.title',
        tags: ['improved'],
        sections: [
            {
                type: 'improved',
                titleKey: 'changelog.sections.improvements',
                items: [
                    'changelog.entries.v0_2_1.improved.item1',
                    'changelog.entries.v0_2_1.improved.item2',
                    'changelog.entries.v0_2_1.improved.item3',
                ]
            }
        ]
    },
    {
        date: '2026-01-08',
        version: 'v0.2.0',
        title: 'changelog.entries.v0_2_0.title',
        tags: ['new', 'fixed'],
        sections: [
            {
                type: 'new',
                titleKey: 'changelog.sections.newFeatures',
                items: [
                    'changelog.entries.v0_2_0.new.item1',
                    'changelog.entries.v0_2_0.new.item2',
                ]
            },
            {
                type: 'fixed',
                titleKey: 'changelog.sections.bugFixes',
                items: [
                    'changelog.entries.v0_2_0.fixed.item1',
                    'changelog.entries.v0_2_0.fixed.item2',
                    'changelog.entries.v0_2_0.fixed.item3',
                ]
            }
        ]
    }
]

/**
 * Get tag icon
 */
const getTagIcon = (type: string) => {
    switch (type) {
        case 'new':
            return (
                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                    <path d="M12 5v14M5 12h14" />
                </svg>
            )
        case 'improved':
            return (
                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                    <path d="M12 19V5M5 12l7-7 7 7" />
                </svg>
            )
        case 'fixed':
            return (
                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                    <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14" />
                    <polyline points="22 4 12 14.01 9 11.01" />
                </svg>
            )
        case 'breaking':
            return (
                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                    <path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z" />
                    <line x1="12" y1="9" x2="12" y2="13" />
                    <line x1="12" y1="17" x2="12.01" y2="17" />
                </svg>
            )
        default:
            return null
    }
}

/**
 * Get section icon
 */
const getSectionIcon = (type: string) => {
    switch (type) {
        case 'new':
            return (
                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" style={{ color: 'var(--color-accent-teal-light)' }}>
                    <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2" />
                </svg>
            )
        case 'improved':
            return (
                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" style={{ color: '#60a5fa' }}>
                    <circle cx="12" cy="12" r="10" />
                    <path d="M12 16v-4M12 8h.01" />
                </svg>
            )
        case 'fixed':
            return (
                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" style={{ color: 'var(--color-accent-yellow)' }}>
                    <path d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z" />
                </svg>
            )
        default:
            return null
    }
}

/**
 * Changelog page component
 */
export default function ChangelogPage() {
    const { t } = useTranslation('portal')

    // SEO
    useDocumentMeta({
        title: t('seo.changelog.title'),
        description: t('seo.changelog.description'),
    })

    return (
        <main className="changelog-page">
            {/* Hero area */}
            <section className="changelog-hero">
                <div className="container">
                    <div className="changelog-hero-content">
                        <h1 className="changelog-hero-title">
                            {t('changelog.heroTitle')}
                        </h1>
                        <p className="changelog-hero-subtitle">
                            {t('changelog.heroSubtitle')}
                        </p>
                    </div>
                </div>
            </section>

            {/* Timeline area */}
            <section className="changelog-timeline">
                <div className="container">
                    <div className="changelog-timeline-container">
                        {changelogData.map((entry, index) => (
                            <article key={index} className="changelog-entry">
                                {/* Header info: date, version, tags */}
                                <div className="changelog-entry-header">
                                    <time className="changelog-date">{entry.date}</time>
                                    <span className="changelog-version">{entry.version}</span>
                                    <div className="changelog-tags">
                                        {entry.tags.map((tag, tagIndex) => (
                                            <span
                                                key={tagIndex}
                                                className={`changelog-tag changelog-tag-${tag}`}
                                            >
                                                {getTagIcon(tag)}
                                                {t(`changelog.tags.${tag}`)}
                                            </span>
                                        ))}
                                    </div>
                                </div>

                                {/* Update title */}
                                <h2 className="changelog-entry-title">
                                    {t(entry.title)}
                                </h2>

                                {/* Update content */}
                                <div className="changelog-entry-content">
                                    {entry.sections.map((section, sectionIndex) => (
                                        <div key={sectionIndex} className="changelog-section">
                                            <h3 className="changelog-section-title">
                                                <span className="changelog-section-icon">
                                                    {getSectionIcon(section.type)}
                                                </span>
                                                {t(section.titleKey)}
                                            </h3>
                                            <ul className="changelog-list">
                                                {section.items.map((item, itemIndex) => (
                                                    <li key={itemIndex} className="changelog-list-item">
                                                        {t(item)}
                                                    </li>
                                                ))}
                                            </ul>
                                            {sectionIndex < entry.sections.length - 1 && (
                                                <div className="changelog-divider" />
                                            )}
                                        </div>
                                    ))}
                                </div>
                            </article>
                        ))}
                    </div>
                </div>
            </section>
        </main>
    )
}
