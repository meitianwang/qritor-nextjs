/**
 * 文档知识库数据
 * 支持中英文两种语言
 */

// 类型定义与常量
export type {
    LanguageInfo,
    DocsNavItem,
    DocsNavSection,
    DocsNavigation,
    DocsQuickLink,
    DocsContentEntry,
    DocsUITexts,
} from './types'
export { SUPPORTED_LANGUAGES, DEFAULT_LANGUAGE } from './types'

// 导航结构
export { docsNavigation } from './navigation'

// 页面内容
export { docsContent } from './content'

// UI 文本
export { docsUI } from './ui'
