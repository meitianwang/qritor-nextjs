'use client'

import { useEffect } from 'react'
import { useRouter } from 'next/navigation'
import { getLanguage } from '@/i18n/index'

/**
 * /docs → /docs/[lang] redirect
 */
export default function DocsRedirect() {
    const router = useRouter()

    useEffect(() => {
        const lang = getLanguage()
        router.replace(`/docs/${lang}`)
    }, [router])

    return null
}
