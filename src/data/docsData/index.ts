/**
 * 文档知识库数据
 * 支持中英文两种语言
 */

// 类型定义
export type {
    DocsNavItem,
    DocsNavSection,
    DocsNavigation,
    DocsQuickLink,
    DocsContentEntry,
    DocsUITexts,
} from './types'

// 导航结构
export { docsNavigation } from './navigation'

// 页面内容
export { docsContent } from './content'

// UI 文本
export { docsUI } from './ui'
