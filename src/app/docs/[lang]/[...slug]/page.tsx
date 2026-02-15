'use client'

import { useParams } from 'next/navigation'
import Link from 'next/link'
import { docsContent } from '@/data/docsData'

/**
 * Simple Markdown to HTML formatter
 */
function formatContent(markdown: string): string {
    if (!markdown) return ''

    let html = markdown
        // Headings (process from small to large to avoid mismatching)
        .replace(/^#### (.+)$/gm, '<h4>$1</h4>')
        .replace(/^### (.+)$/gm, '<h3>$1</h3>')
        .replace(/^## (.+)$/gm, '<h2>$1</h2>')
        // Images
        .replace(/!\[(.+?)\]\((.+?)\)/g, '<img src="$2" alt="$1" class="docs-image" />')
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
 * Docs content page
 */
export default function DocsContentPage() {
    const params = useParams()
    const lang = (params.lang as string) || 'zh'
    const slug = params.slug as string[]

    // Get page ID from slug path
    const pageId = slug?.[slug.length - 1] || 'overview'
    const content = docsContent[lang]?.[pageId] || docsContent.zh?.[pageId]

    if (!content) {
        const notFoundText: Record<string, { title: string; desc: string; back: string }> = {
            zh: { title: '页面未找到', desc: '抱歉、您访问的文档页面不存在。', back: '返回文档首页' },
            en: { title: 'Page Not Found', desc: 'Sorry, the documentation page you requested does not exist.', back: 'Back to Docs Home' },
            de: { title: 'Seite nicht gefunden', desc: 'Entschuldigung, die angeforderte Dokumentationsseite existiert nicht.', back: 'Zurück zur Docs-Startseite' }
        }
        const text = notFoundText[lang] || notFoundText.zh
        return (
            <div className="docs-content-body">
                <h1 className="docs-content-title">{text.title}</h1>
                <p>{text.desc}</p>
                <Link href={`/docs/${lang}/`} className="btn btn-primary">
                    {text.back}
                </Link>
            </div>
        )
    }

    return (
        <div className="docs-page-content">
            {/* Page header */}
            <div className="docs-content-header">
                <div className="docs-breadcrumb">
                    <span>{content.breadcrumb}</span>
                </div>
                <h1 className="docs-content-title">{content.title}</h1>
                {content.description && (
                    <p className="docs-content-description">{content.description}</p>
                )}
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
