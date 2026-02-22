import type { DocsContentEntry } from '../types'
import { zhQuickStartContent, enQuickStartContent } from './quick-start'
import { zhUserGuideContent, enUserGuideContent } from './user-guide'
import { zhPricingContent, enPricingContent } from './pricing'
import { zhSupportContent, enSupportContent } from './support'
import { zhConfigContent, enConfigContent } from './config'

// 合并所有内容模块
export const docsContent: Record<string, Record<string, DocsContentEntry>> = {
    zh: {
        ...zhQuickStartContent,
        ...zhUserGuideContent,
        ...zhPricingContent,
        ...zhSupportContent,
        ...zhConfigContent,
    },
    en: {
        ...enQuickStartContent,
        ...enUserGuideContent,
        ...enPricingContent,
        ...enSupportContent,
        ...enConfigContent,
    },
}
