import type { DocsNavigation } from './types'

// 文档导航结构
export const docsNavigation: Record<string, DocsNavigation> = {
    zh: {
        quickStart: {
            title: '快速入门',
            items: [
                { id: 'overview', title: '产品概述', path: '/docs/zh/' },
                { id: 'quick-start', title: '快速开始', path: '/docs/zh/quick-start' }
            ]
        },
        userGuide: {
            title: '小说创作',
            items: [
                {
                    id: 'creation',
                    title: '创作功能',
                    path: '/docs/zh/user-guide/creation',
                    children: [
                        { id: 'novel-create', title: '创建小说', path: '/docs/zh/user-guide/creation/novel-create' },
                        { id: 'module-tree', title: '模块树操作', path: '/docs/zh/user-guide/creation/module-tree' },
                        { id: 'module-edit', title: '模块编辑', path: '/docs/zh/user-guide/creation/module-edit' },
                        { id: 'chapter-edit', title: '章节编辑', path: '/docs/zh/user-guide/creation/chapter-edit' }
                    ]
                },
                {
                    id: 'ai-assistant',
                    title: 'AI 助手',
                    path: '/docs/zh/user-guide/ai-assistant',
                    children: [
                        { id: 'ai-modes', title: 'AI 模式', path: '/docs/zh/user-guide/ai-assistant/ai-modes' },
                        { id: 'ai-mention', title: '@引用模块', path: '/docs/zh/user-guide/ai-assistant/ai-mention' },
                        { id: 'smart-write', title: '智能写作工具', path: '/docs/zh/user-guide/ai-assistant/smart-write' },
                        { id: 'editor-toolbar', title: '编辑器工具栏', path: '/docs/zh/user-guide/ai-assistant/editor-toolbar' },
                        { id: 'chat-history', title: '对话历史', path: '/docs/zh/user-guide/ai-assistant/chat-history' }
                    ]
                },
                {
                    id: 'worldbuilding',
                    title: '世界观管理',
                    path: '/docs/zh/user-guide/worldbuilding',
                    children: [
                        { id: 'entity-types', title: '实体类型', path: '/docs/zh/user-guide/worldbuilding/entity-types' },
                        { id: 'relation-graph', title: '关系图谱', path: '/docs/zh/user-guide/worldbuilding/relation-graph' },
                        { id: 'dynamic-info', title: '动态信息', path: '/docs/zh/user-guide/worldbuilding/dynamic-info' }
                    ]
                },
                {
                    id: 'plot-management',
                    title: '剧情管理',
                    path: '/docs/zh/user-guide/plot-management',
                    children: [
                        { id: 'storylines', title: '故事线与事件', path: '/docs/zh/user-guide/plot-management/storylines' },
                        { id: 'foreshadowing', title: '伏笔系统', path: '/docs/zh/user-guide/plot-management/foreshadowing' }
                    ]
                },
                {
                    id: 'skills',
                    title: '技能',
                    path: '/docs/zh/user-guide/skills'
                },
                {
                    id: 'configuration',
                    title: '系统配置',
                    path: '/docs/zh/user-guide/configuration'
                }
            ]
        },
        pricing: {
            title: '价格',
            items: [
                { id: 'credits', title: '积分', path: '/docs/zh/pricing/credits' },
                { id: 'pricing-plans', title: '定价', path: '/docs/zh/pricing/plans' },
                { id: 'billing', title: '计费', path: '/docs/zh/pricing/billing' }
            ]
        },
        configuration: {
            title: '配置',
            items: [
                { id: 'llm-config', title: 'LLM 配置', path: '/docs/zh/config/llm' },
                { id: 'module-config', title: '模块配置', path: '/docs/zh/config/module' }
            ]
        },
        support: {
            title: '支持',
            items: [
                { id: 'download-guide', title: '下载安装指南', path: '/docs/zh/support/download-guide' },
                { id: 'faq', title: '常见问题', path: '/docs/zh/support/faq' },
                { id: 'contact', title: '联系我们', path: '/docs/zh/support/contact' }
            ]
        }
    },
    en: {
        quickStart: {
            title: 'Quick Start',
            items: [
                { id: 'overview', title: 'Product Overview', path: '/docs/en/' },
                { id: 'quick-start', title: 'Getting Started', path: '/docs/en/quick-start' }
            ]
        },
        userGuide: {
            title: 'Novel Writing',
            items: [
                {
                    id: 'creation',
                    title: 'Creation Features',
                    path: '/docs/en/user-guide/creation',
                    children: [
                        { id: 'novel-create', title: 'Create Novel', path: '/docs/en/user-guide/creation/novel-create' },
                        { id: 'module-tree', title: 'Module Tree Operations', path: '/docs/en/user-guide/creation/module-tree' },
                        { id: 'module-edit', title: 'Module Editing', path: '/docs/en/user-guide/creation/module-edit' },
                        { id: 'chapter-edit', title: 'Chapter Editing', path: '/docs/en/user-guide/creation/chapter-edit' }
                    ]
                },
                {
                    id: 'ai-assistant',
                    title: 'AI Assistant',
                    path: '/docs/en/user-guide/ai-assistant',
                    children: [
                        { id: 'ai-modes', title: 'AI Modes', path: '/docs/en/user-guide/ai-assistant/ai-modes' },
                        { id: 'ai-mention', title: '@Mention Modules', path: '/docs/en/user-guide/ai-assistant/ai-mention' },
                        { id: 'smart-write', title: 'Smart Writing Tools', path: '/docs/en/user-guide/ai-assistant/smart-write' },
                        { id: 'editor-toolbar', title: 'Editor Toolbar', path: '/docs/en/user-guide/ai-assistant/editor-toolbar' },
                        { id: 'chat-history', title: 'Chat History', path: '/docs/en/user-guide/ai-assistant/chat-history' }
                    ]
                },
                {
                    id: 'worldbuilding',
                    title: 'Worldbuilding',
                    path: '/docs/en/user-guide/worldbuilding',
                    children: [
                        { id: 'entity-types', title: 'Entity Types', path: '/docs/en/user-guide/worldbuilding/entity-types' },
                        { id: 'relation-graph', title: 'Relation Graph', path: '/docs/en/user-guide/worldbuilding/relation-graph' },
                        { id: 'dynamic-info', title: 'Dynamic Info', path: '/docs/en/user-guide/worldbuilding/dynamic-info' }
                    ]
                },
                {
                    id: 'plot-management',
                    title: 'Plot Management',
                    path: '/docs/en/user-guide/plot-management',
                    children: [
                        { id: 'storylines', title: 'Storylines & Events', path: '/docs/en/user-guide/plot-management/storylines' },
                        { id: 'foreshadowing', title: 'Foreshadowing', path: '/docs/en/user-guide/plot-management/foreshadowing' }
                    ]
                },
                {
                    id: 'skills',
                    title: 'Skills',
                    path: '/docs/en/user-guide/skills'
                },
                {
                    id: 'configuration',
                    title: 'System Configuration',
                    path: '/docs/en/user-guide/configuration'
                }
            ]
        },
        pricing: {
            title: 'Pricing',
            items: [
                { id: 'credits', title: 'Credits', path: '/docs/en/pricing/credits' },
                { id: 'pricing-plans', title: 'Plans', path: '/docs/en/pricing/plans' },
                { id: 'billing', title: 'Billing', path: '/docs/en/pricing/billing' }
            ]
        },
        configuration: {
            title: 'Configuration',
            items: [
                { id: 'llm-config', title: 'LLM Configuration', path: '/docs/en/config/llm' },
                { id: 'module-config', title: 'Module Configuration', path: '/docs/en/config/module' }
            ]
        },
        support: {
            title: 'Support',
            items: [
                { id: 'download-guide', title: 'Download & Install Guide', path: '/docs/en/support/download-guide' },
                { id: 'faq', title: 'FAQ', path: '/docs/en/support/faq' },
                { id: 'contact', title: 'Contact Us', path: '/docs/en/support/contact' }
            ]
        }
    },
}
