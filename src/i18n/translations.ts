'use client'

/**
 * Translation loader
 * Dynamic loading of translation files
 */

// Translation cache
const translationCache: Record<string, Record<string, unknown>> = {}

/**
 * Clear translation cache (called after language switch)
 */
export function clearTranslationCache(): void {
    Object.keys(translationCache).forEach(key => {
        delete translationCache[key]
    })
}

// Re-export core functions
export { getLanguage, setLanguage, getCurrentLanguageInfo, SUPPORTED_LANGUAGES, DEFAULT_LANGUAGE } from './index'
