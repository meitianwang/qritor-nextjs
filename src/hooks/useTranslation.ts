'use client'

/**
 * useTranslation Hook
 * For using translations in React components
 */

import { useState, useEffect, useCallback } from 'react'
import { getLanguage, DEFAULT_LANGUAGE } from '@/i18n/index'

// Translation cache
const translationCache: Record<string, Record<string, unknown>> = {}

/**
 * Get nested object value
 * @param obj - object
 * @param path - path, e.g. 'header.login'
 */
function getNestedValue(obj: Record<string, unknown>, path: string): unknown {
    const keys = path.split('.')
    let value: unknown = obj
    for (const key of keys) {
        if (value && typeof value === 'object' && key in (value as Record<string, unknown>)) {
            value = (value as Record<string, unknown>)[key]
        } else {
            return undefined
        }
    }
    return value
}

interface TranslationHook {
    t: (key: string, paramsOrFallback?: string | Record<string, string | number>) => string
    language: string
    isLoading: boolean
}

/**
 * useTranslation Hook
 * @param namespace - namespace (portal, studio)
 * @returns { t, language, isLoading }
 */
export function useTranslation(namespace: string = 'portal'): TranslationHook {
    const [translations, setTranslations] = useState<Record<string, unknown>>(() => {
        // Initialize from cache to avoid showing keys on first render
        const lang = getLanguage()
        const cacheKey = `${namespace}_${lang}`
        return translationCache[cacheKey] || {}
    })
    const [language, setLanguage] = useState(getLanguage())
    const [isLoading, setIsLoading] = useState(true)

    // Load translations
    useEffect(() => {
        const loadTranslations = async () => {
            const cacheKey = `${namespace}_${language}`

            // Return from cache (set immediately, no waiting needed)
            if (translationCache[cacheKey]) {
                setTranslations(translationCache[cacheKey])
                setIsLoading(false)
                return
            }

            // Key: when loading new language, don't clear current translations, keep using old ones

            try {
                // Dynamic import of translation files
                const module = await import(`@/i18n/translations/${namespace}/${language}.json`)
                const data = module.default || module
                translationCache[cacheKey] = data
                setTranslations(data)
            } catch (error) {
                console.warn(`Translation load failed: ${namespace}/${language}`, error)

                // Try loading default language
                if (language !== DEFAULT_LANGUAGE) {
                    try {
                        const fallbackKey = `${namespace}_${DEFAULT_LANGUAGE}`
                        // Check default language cache first
                        if (translationCache[fallbackKey]) {
                            setTranslations(translationCache[fallbackKey])
                        } else {
                            const fallback = await import(`@/i18n/translations/${namespace}/${DEFAULT_LANGUAGE}.json`)
                            const data = fallback.default || fallback
                            translationCache[fallbackKey] = data
                            setTranslations(data)
                        }
                    } catch {
                        // Final fallback: keep current translations unchanged
                    }
                }
                // If default language loading fails, keep current translations unchanged
            } finally {
                setIsLoading(false)
            }
        }

        loadTranslations()
    }, [namespace, language])

    // Listen for language changes
    useEffect(() => {
        // Handle cross-tab language changes (via localStorage storage event)
        const handleStorageChange = (e: StorageEvent) => {
            if (e.key === 'preferredLanguage') {
                setLanguage(e.newValue || DEFAULT_LANGUAGE)
            }
        }

        // Handle same-window language changes (via custom event)
        const handleLanguageChanged = (e: Event) => {
            const customEvent = e as CustomEvent<{ language: string }>
            const newLang = customEvent.detail?.language
            if (newLang && newLang !== language) {
                setLanguage(newLang)
            }
        }

        window.addEventListener('storage', handleStorageChange)
        window.addEventListener('languageChanged', handleLanguageChanged)

        return () => {
            window.removeEventListener('storage', handleStorageChange)
            window.removeEventListener('languageChanged', handleLanguageChanged)
        }
    }, [language])

    /**
     * Translation function
     * @param key - translation key, e.g. 'header.login'
     * @param params - replacement parameters
     * @returns translated text
     */
    const t = useCallback((key: string, paramsOrFallback: string | Record<string, string | number> = {}): string => {
        const fallback = typeof paramsOrFallback === 'string' ? paramsOrFallback : undefined
        const params = typeof paramsOrFallback === 'object' ? paramsOrFallback : {}

        const value = getNestedValue(translations, key)

        if (value === undefined) {
            // Translation not found, return fallback or key itself
            return fallback || key
        }

        if (typeof value !== 'string') {
            return fallback || key
        }

        // Replace parameters {{param}}
        return value.replace(/\{\{(\w+)\}\}/g, (_, paramName: string) => {
            return params[paramName] !== undefined ? String(params[paramName]) : `{{${paramName}}}`
        })
    }, [translations])

    return { t, language, isLoading }
}
