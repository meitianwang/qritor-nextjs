'use client'

import Link from 'next/link'
import { useParams } from 'next/navigation'
import { docsContent, docsUI } from '@/data/docsData'
import { useTranslation } from '@/hooks/useTranslation'
import { useDocumentMeta } from '@/hooks/useDocumentMeta'

/**
 * Simple Markdown to HTML formatter
 */
function formatContent(markdown: string): string {
    if (!markdown) return ''

    let html = markdown
        // Headings
        .replace(/^### (.+)$/gm, '<h3>$1</h3>')
        .replace(/^## (.+)$/gm, '<h2>$1</h2>')
        // Lists
        .replace(/^(\d+)\. (.+)$/gm, '<li>$2</li>')
        .replace(/^- (.+)$/gm, '<li>$1</li>')
        // Bold
        .replace(/\*\*(.+?)\*\*/g, '<strong>$1</strong>')
        // Links
        .replace(/\[(.+?)\]\((.+?)\)/g, '<a href="$2">$1</a>')
        // Code
        .replace(/`(.+?)`/g, '<code>$1</code>')
        // Paragraphs
        .replace(/\n\n/g, '</p><p>')

    // Wrap lists
    html = html.replace(/(<li>.*?<\/li>\n?)+/g, '<ul>$&</ul>')

    return `<p>${html}</p>`
}

/**
 * Docs home page - Product overview
 */
export default function DocsHomePage() {
    const params = useParams()
    const lang = (params.lang as string) || 'zh'
    const content = docsContent[lang]?.overview || docsContent.zh.overview
    const ui = docsUI[lang] || docsUI.zh
    const { t } = useTranslation('portal')

    // SEO
    useDocumentMeta({
        title: t('seo.docs.title'),
        description: t('seo.docs.description')
    })

    return (
        <div className="docs-home">
            {/* Page header */}
            <div className="docs-content-header">
                <div className="docs-breadcrumb">
                    <span>{content.breadcrumb}</span>
                </div>
                <h1 className="docs-content-title">{content.title}</h1>
                <p className="docs-content-description">{content.description}</p>
            </div>

            {/* Product preview image */}
            <div className="docs-preview">
                <img src="/images/logo.png" alt="Qritor" className="docs-preview-logo" />
            </div>

            {/* Body content */}
            <div className="docs-content-body" dangerouslySetInnerHTML={{ __html: formatContent(content.body) }} />

            {/* Quick links */}
            {content.quickLinks && content.quickLinks.length > 0 && (
                <div className="docs-quick-links">
                    {content.quickLinks.map((link: { path: string; title: string; description: string }, index: number) => (
                        <Link key={index} href={link.path} className="docs-quick-link">
                            <div className="docs-quick-link-content">
                                <span className="docs-quick-link-title">{link.title}</span>
                                <span className="docs-quick-link-desc">{link.description}</span>
                            </div>
                            <svg className="docs-quick-link-icon" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                                <line x1="7" y1="17" x2="17" y2="7"></line>
                                <polyline points="7 7 17 7 17 17"></polyline>
                            </svg>
                        </Link>
                    ))}
                </div>
            )}
        </div>
    )
}
