'use client'

import { useEffect } from 'react'

interface DocumentMetaOptions {
    title?: string
    description?: string
    image?: string
    url?: string
    type?: string
    structuredData?: Record<string, unknown>
    noindex?: boolean
}

/**
 * Hook for dynamically updating page Meta information
 * Used for SEO optimization, supports dynamic title, description, Open Graph, Twitter Card, etc.
 */
export function useDocumentMeta({
    title,
    description,
    image = 'https://qritor.com/images/og-default.png',
    url,
    type = 'website',
    structuredData,
    noindex = false
}: DocumentMetaOptions): void {
    useEffect(() => {
        // Update <title>
        const fullTitle = title ? `${title} | Qritor` : 'Qritor - AI Creation Platform'
        document.title = fullTitle

        // Update/create meta tags
        updateMeta('description', description)
        updateMeta('robots', noindex ? 'noindex, nofollow' : 'index, follow')

        // Open Graph tags
        updateMeta('og:title', fullTitle, 'property')
        updateMeta('og:description', description, 'property')
        updateMeta('og:image', image, 'property')
        updateMeta('og:url', url || window.location.href, 'property')
        updateMeta('og:type', type, 'property')

        // Twitter Card tags
        updateMeta('twitter:title', fullTitle, 'name')
        updateMeta('twitter:description', description, 'name')
        updateMeta('twitter:image', image, 'name')

        // Canonical link
        updateCanonical(url || window.location.href)

        // Structured data
        if (structuredData) {
            updateStructuredData(structuredData)
        }

        return () => {
            // Clean up structured data (remove old one when page changes)
            const script = document.querySelector('script[data-seo="structured-data"]')
            if (script) script.remove()
        }
    }, [title, description, image, url, type, structuredData, noindex])
}

/**
 * Update or create meta tag
 */
function updateMeta(name: string, content: string | undefined, attributeType: string = 'name'): void {
    if (!content) return

    let element = document.querySelector(`meta[${attributeType}="${name}"]`)
    if (!element) {
        element = document.createElement('meta')
        element.setAttribute(attributeType, name)
        document.head.appendChild(element)
    }
    element.setAttribute('content', content)
}

/**
 * Update canonical link
 */
function updateCanonical(url: string): void {
    let link = document.querySelector('link[rel="canonical"]') as HTMLLinkElement | null
    if (!link) {
        link = document.createElement('link')
        link.setAttribute('rel', 'canonical')
        document.head.appendChild(link)
    }
    link.setAttribute('href', url)
}

/**
 * Update structured data (JSON-LD)
 */
function updateStructuredData(data: Record<string, unknown>): void {
    let script = document.querySelector('script[data-seo="structured-data"]')
    if (!script) {
        script = document.createElement('script')
        script.setAttribute('type', 'application/ld+json')
        script.setAttribute('data-seo', 'structured-data')
        document.head.appendChild(script)
    }
    script.textContent = JSON.stringify(data)
}

export default useDocumentMeta
