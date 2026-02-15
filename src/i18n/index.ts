'use client'

/**
 * Internationalization (i18n) utility module
 * Supports multi-language switching, language preference stored in localStorage and database
 */

import { authFetch, getUserInfo } from '@/lib/auth-utils'

// ============== Supported languages ==============
export interface LanguageInfo {
    code: string
    name: string
    flag: string
}

export const SUPPORTED_LANGUAGES: Record<string, LanguageInfo> = {
    zh: { code: 'zh', name: '简体中文', flag: '🇨🇳' },
    'zh-TW': { code: 'zh-TW', name: '繁體中文', flag: '🇹🇼' },
    en: { code: 'en', name: 'English', flag: '🇺🇸' },
    ja: { code: 'ja', name: '日本語', flag: '🇯🇵' },
    ko: { code: 'ko', name: '한국어', flag: '🇰🇷' },
    de: { code: 'de', name: 'Deutsch', flag: '🇩🇪' },
    fr: { code: 'fr', name: 'Français', flag: '🇫🇷' },
    es: { code: 'es', name: 'Español', flag: '🇪🇸' },
    pt: { code: 'pt', name: 'Português', flag: '🇧🇷' },
    ar: { code: 'ar', name: 'العربية', flag: '🇸🇦' },
    ru: { code: 'ru', name: 'Русский', flag: '🇷🇺' },
    hi: { code: 'hi', name: 'हिन्दी', flag: '🇮🇳' }
}

// Default language
export const DEFAULT_LANGUAGE = 'zh'

// localStorage key
const LANGUAGE_STORAGE_KEY = 'preferredLanguage'

// ============== Language getters and setters ==============

/**
 * Get current language setting
 * Priority: localStorage > browser language > default language
 */
export function getLanguage(): string {
    if (typeof window === 'undefined') return DEFAULT_LANGUAGE

    // 1. Try from localStorage
    const stored = localStorage.getItem(LANGUAGE_STORAGE_KEY)
    if (stored && SUPPORTED_LANGUAGES[stored]) {
        return stored
    }

    // 2. Try to infer from browser language
    const browserLang = navigator.language?.split('-')[0]
    if (browserLang && SUPPORTED_LANGUAGES[browserLang]) {
        return browserLang
    }

    // 3. Return default language
    return DEFAULT_LANGUAGE
}

/**
 * Set language
 * Saves to localStorage, syncs to server if logged in,
 * and dispatches languageChanged event to notify other components
 */
export async function setLanguage(lang: string): Promise<boolean> {
    if (!SUPPORTED_LANGUAGES[lang]) {
        console.warn(`Unsupported language: ${lang}`)
        return false
    }

    // Save to localStorage
    localStorage.setItem(LANGUAGE_STORAGE_KEY, lang)

    // Dispatch custom event to notify all listening components
    window.dispatchEvent(new CustomEvent('languageChanged', { detail: { language: lang } }))

    // If logged in, sync to server
    const user = getUserInfo()
    if (user) {
        try {
            // eslint-disable-next-line @typescript-eslint/no-explicit-any
            await authFetch('/api/user/settings', {
                method: 'PUT',
                body: { language: lang } as any
            })
        } catch (error) {
            console.warn('Failed to sync language setting to server:', error)
        }
    }

    return true
}

/**
 * Get current language info object
 */
export function getCurrentLanguageInfo(): LanguageInfo {
    const lang = getLanguage()
    return SUPPORTED_LANGUAGES[lang] || SUPPORTED_LANGUAGES[DEFAULT_LANGUAGE]
}
