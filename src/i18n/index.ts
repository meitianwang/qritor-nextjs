'use client'

/**
 * Internationalization (i18n) utility module
 * Supports multi-language switching, language preference stored in localStorage and database
 */

import { authFetch, getUserInfo } from '@/lib/auth-utils'

// ============== Supported languages ==============
interface LanguageInfo {
    code: string
    name: string
    flag: string
}

export const SUPPORTED_LANGUAGES: Record<string, LanguageInfo> = {
    zh: { code: 'zh', name: '简体中文', flag: '🇨🇳' },
    en: { code: 'en', name: 'English', flag: '🇺🇸' }
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
 * Sync language setting from server after login
 * Fetches user's language preference and applies it to localStorage
 */
export async function syncLanguageFromServer(): Promise<void> {
    try {
        const response = await authFetch('/api/user/settings')
        const data = await response.json()
        if (data.code === 200 && data.data?.language && SUPPORTED_LANGUAGES[data.data.language]) {
            localStorage.setItem(LANGUAGE_STORAGE_KEY, data.data.language)
        }
    } catch {
        // Ignore errors - language will fall back to localStorage/browser/default
    }
}
