/**
 * 文档知识库 — 类型定义与常量
 */

// ============== Type Definitions ==============

export interface LanguageInfo {
    code: string
    name: string
    flag: string
}

export interface DocsNavItem {
    id: string
    title: string
    path: string
    children?: DocsNavItem[]
}

export interface DocsNavSection {
    title: string
    items: DocsNavItem[]
}

export interface DocsNavigation {
    quickStart: DocsNavSection
    userGuide: DocsNavSection
    pricing: DocsNavSection
    configuration: DocsNavSection
    support: DocsNavSection
}

export interface DocsQuickLink {
    title: string
    description: string
    path: string
    icon: string
}

export interface DocsContentEntry {
    breadcrumb?: string
    title: string
    description?: string
    body: string
    layout?: 'stepper'
    quickLinks?: DocsQuickLink[]
}

export interface DocsUITexts {
    search: string
    searchShortcut: string
    guide: string
    plugins: string
    cli: string
    website: string
    forum: string
    blog: string
    askQuestion: string
}

// ============== Constants ==============

// 支持的语言
export const SUPPORTED_LANGUAGES: Record<string, LanguageInfo> = {
    zh: {
        code: 'zh',
        name: '简体中文',
        flag: '🇨🇳'
    },
    en: {
        code: 'en',
        name: 'English',
        flag: '🇺🇸'
    }
}

// 默认语言
export const DEFAULT_LANGUAGE: string = 'zh'
