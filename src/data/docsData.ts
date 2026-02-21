/**
 * 文档知识库数据
 * 支持中英文两种语言
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

// ============== Data ==============

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

// 页面内容数据
export const docsContent: Record<string, Record<string, DocsContentEntry>> = {
    zh: {
        overview: {
            breadcrumb: '快速入门',
            title: '产品概述',
            description: 'Qritor 是一款面向专业创作者的桌面端 AI 辅助创作平台。它结合了极简主义的美学设计与深度上下方工程，为长篇小说创作提供从灵感到完稿的全流程支持。',
            body: `
Qritor 不仅仅是一个写作工具，它是你的 24 小时 AI 创作搭档。它深入理解你的作品世界观、通过可视化的关系图谱辅助情节构建，并以模块化的方式管理复杂的创作任务。

无论是构建庞大的奇幻世界，还是推敲细腻的人物关系，Qritor 都能提供深度的智能辅助。

## 核心特性

### 沉浸式小说创作
专为桌面端打造的专业写作环境。
- **现代化编辑器**：支持多 Tab 切换，像 IDE 一样高效管理多个章节和设定。
- **极简美学**：精心打磨的 UI 设计，提供无干扰的沉浸式写作体验。
- **本地存储**：所有创作数据存储在本地数据库，安全可靠。

### 模块化故事引擎
打破线性写作的限制，用工程化的思维构建故事。
- **模块树管理**：灵活管理章节、角色、场景、组织、道具和设定等各类内容。
- **创作方法**：按小说题材（穿越、末世、灵异等）提供专业的创作方法，每种方法预定义了对应的模块类型和结构。

### 智能上下文 AI
比通用对话更懂你的创作助手。
- **RAG 增强**：AI 助手能够实时读取你当前的项目上下文、人物小传和剧情大纲，提供连贯且符合逻辑的建议。
- **智能续写与润色**：在编辑器中随时唤起 AI，进行情节续写、文笔润色或灵感扩充。

### 可视化关系图谱
让复杂的故事脉络一目了然。
- **实体关系网**：自动提取或手动构建人物、势力、地点之间的复杂关系。
- **动态演化**：随着剧情发展，直观地管理和检视故事结构的变化。

## 未来规划

我们正在持续扩展 Qritor 的创作边界，未来将支持更多元的创作形式：

### 推文制作 (即将推出)
- **一键转推**：将精彩段落或金句智能转化为适合社交媒体传播的卡片。
- **多平台适配**：内置主流社交平台的排版规范，轻松分享你的创作瞬间。

### 漫剧创作 (规划中)
- **脚本可视化**：辅助将小说文本转化为分镜脚本。
- **角色立绘生成**：联动 AI 绘画能力，为你的角色生成一致性的视觉形象。

### 短视频创作 (规划中)
- **文本转视频**：基于小说精彩片段，智能生成短视频内容。
- **有声剧制作**：AI 语音合成，为你的故事赋予声音。

## 快速上手

1. **下载安装** - 获取适用于 macOS 或 Windows 的桌面客户端
2. **创建项目** - 开始一个新的创作项目或导入现有作品
3. **探索方法** - 选择适合你的创作方法论
4. **开始创作** - 享受 AI 赋能的流畅写作体验
            `,
            quickLinks: [
                { title: '快速开始', description: '5分钟入门指南', path: '/docs/zh/quick-start', icon: 'arrow' },
                { title: '下载客户端', description: '获取 Windows/macOS 版本', path: '/download', icon: 'arrow' }
            ]
        },
        'quick-start': {
            title: '快速开始',
            description: '本文将带你从零开始创建一部小说，以个人用户的身份体验 Qritor 的核心功能。完成后，你将熟悉模块化创作、AI 双模式助手和世界观管理——这些是进行 AI 辅助小说创作的关键工具。',
            layout: 'stepper',
            body: `
## 下载并安装 Qritor

1. 从 [下载页面](/download) 获取适用于你操作系统的安装包。
2. 双击安装包完成安装。
3. 启动 Qritor 桌面客户端。

详细的系统要求和安装说明请参考 [下载安装指南](/docs/zh/support/download-guide)。

## 登录

1. 启动 Qritor 桌面客户端后，首页右侧会显示登录卡片。
2. 点击 **「登录」** 按钮，通过 OAuth 授权完成登录或注册（首次使用可点击底部的 **「立即注册」** 注册新账号）。
3. 登录成功后，应用会自动跳转到小说工作区。所有创作数据存储在本地。

![登录页面](/images/docs/desktop-login-zh.png)

## 浏览小说创作方法

在侧边栏点击 **「小说创作方法」** 进入创作方法页面。

1. 小说创作方法按题材分类（穿越、末世、灵异等），每种方法为特定题材预定义了模块类型和结构。
2. 搜索或浏览所有可用方法，了解每种方法适合什么类型的故事。
3. 点击 **「同步」** 按钮可从云端获取最新的小说创作方法。

## 创建小说

1. 在侧边栏点击 **「小说」** 回到作品列表，点击右上角 **「新建小说」**。
2. 填写 **作品名称**，从下拉列表选择一种 **小说创作方法**（决定作品拥有哪些模块类型，如角色卡、场景、道具等），可选填写简介。
3. 点击创建，系统会根据所选方法自动生成初始模块结构。

## 熟悉编辑器界面

点击小说卡片进入编辑器，你将看到三栏布局：

- **左侧：模块树** — 按分类管理所有模块，包括章节、角色、场景、组织、道具和设定。
- **中间：工作区** — 包含三个 Tab 页签：编辑器（文本编辑或模块表单）、关系图谱（实体关系网络）、剧情管理（故事线和事件）。
- **右侧：AI 助手** — 默认开启，支持 Agent 模式（可执行创建/修改/删除等操作）和问答模式（仅对话）。

## 初始化小说

创建小说后，在右侧 AI 助手中输入 **/novel-initialization** 启动设定初始化流程。

AI 会自动读取你选择的创作方法和小说信息，依次遍历所有设定模块（如世界观、力量体系、故事钩子等），为每个模块加载对应的专属生成技能，自动填充结构化内容。整个过程无需手动干预，每个模块生成完成后会通过确认弹窗供你审阅。

初始化完成后，你将获得一套完整的世界观设定基础，可以在此基础上进一步调整和细化。

## 人机协同创作

1. 在模块树中选择一个章节节点，中间工作区会打开文本编辑器。
2. 直接写作，或在右侧 AI 助手中输入指令（如"根据大纲续写本章"），AI 会生成内容供你确认。
3. 使用编辑器工具栏的 **续写**、**润色** 等工具辅助创作。
4. 写完章节后，使用工具栏的 **提取实体**、**提取关系**、**剧情整理** 等工具，让 AI 自动维护世界观和剧情线。
5. 随时在 AI 助手中提问，如"目前有哪些未回收的伏笔？"，AI 会基于全文内容回答。
            `,
            quickLinks: []
        },
        creation: {
            title: '创作功能',
            body: `
Qritor 的创作核心围绕 **"工程化写作"** 理念设计。

## 小说管理
在侧边栏的「小说」页面，您可以管理所有的作品。创建作品时，最重要的一步是选择 **创作方法**。
- 创作方法按小说题材分类（穿越、末世、灵异等），每种方法预定义了适合该题材的模块类型和结构。
- 选择创作方法后，系统会根据方法中定义的单例模块自动生成初始模块。

## 模块化编辑
不同于传统写作软件的线性文档，Qritor 将一个作品拆分为多个 **模块 (Module)**。
- **模块树**：在左侧，您可以创建章节、分卷、角色卡、地理设定等任何类型的节点。
- **Tab页签**：中间的工作区支持多开 Tab，您可以同时打开大纲和正文，对照写作。
- **模块库**：如果不习惯树状结构，可以在 "Library" 视图中以卡片形式查看所有模块。
            `
        },
        'novel-create': {
            title: '创建小说',
            body: `
## 新建小说
在「小说」页面点击右上角的 **「新建小说」** 按钮，填写基础信息：
- **作品名称**：输入作品标题。
- **创作方法**：从下拉列表中选择。创作方法决定了作品拥有哪些模块类型（如角色卡、场景、道具等），系统会根据方法中的单例模块自动生成初始结构。
- **简介**（可选）：输入作品简介，帮助 AI 理解您的创作意图。

## 管理作品
- **进入编辑**：点击作品卡片进入编辑器。
- **删除作品**：在作品卡片上右键或点击菜单按钮，选择删除。
- **搜索作品**：使用顶部搜索栏快速定位作品。
            `
        },
        'chapter-edit': {
            title: '章节编辑',
            body: `
## 基本操作
选中一个章节模块后，切换到 **"Editor"** 视图即可开始写作。

## 编辑器功能
- **沉浸模式**：编辑器自动隐藏不必要的 UI，让您专注于写作。
- **多 Tab 编辑**：同时打开多个模块，在不同章节间快速切换。
- **自动保存**：内容实时保存到本地数据库。
- **字数统计**：编辑器底部实时显示当前章节字数。
- **字号调节**：通过工具栏调整编辑器字号，适配个人阅读习惯。

## 章节大纲

每个章节都可以编写**大纲/摘要**，点击工具栏的"大纲"按钮打开编辑弹窗。大纲帮助您在动笔前理清思路，也是 AI 理解章节意图的重要上下文。

## 参与实体

通过工具栏的"参与实体"按钮，管理当前章节中出场的角色、场景、道具等。勾选后，这些实体的信息会作为上下文传递给 AI，让 AI 在续写时更贴合设定。

## AI 写作模式

当 AI 为您生成整章内容时，进入**写作模式**：
1. AI 通过流式传输实时生成内容，您可以看到文字逐步出现。
2. 生成完成后，内容以预览形式展示。
3. 您可以选择 **确认** 接受内容，或 **拒绝** 放弃本次生成。

## AI 修改模式

当 AI 对已有内容进行局部修改时，进入**修改模式**：
1. AI 定位到需要修改的段落，进行替换、插入等操作。
2. 编辑器会显示**差异对比**，标记新增和删除的内容。
3. 底部展示修改统计（新增/删除字数）。
4. 您可以选择 **确认** 应用修改，或 **拒绝** 恢复原文。

## AI 辅助
- **选中润色**：选中文本后，AI 可帮您优化措辞。
- **更多工具**：详见 [编辑器工具栏](/docs/zh/user-guide/ai-assistant/editor-toolbar)。
            `
        },
        'module-tree': {
            title: '模块树操作',
            body: `
## 模块树介绍
模块树是 Qritor 的核心组织结构，用于管理您作品的所有内容节点。

## 基本操作
- **创建模块**：点击模块树顶部的 "+" 按钮，或在父模块上右键选择"添加子模块"。
- **选择类型**：根据创作方法，可选择章节、角色卡、设定等不同类型。
- **重命名**：双击模块名称，或右键选择"重命名"。
- **删除模块**：右键选择"删除"，会递归删除所有子模块。

## 高级功能
- **拖拽排序**：按住模块拖动可调整顺序或层级关系。
- **展开/折叠**：点击箭头图标可展开或折叠子树。
- **右键菜单**：提供创建、重命名、删除等快捷操作。
            `
        },
        'ai-assistant': {
            title: 'AI 助手',
            body: `
Qritor 的 AI 助手拥有 **上下文感知 (Context Awareness)** 能力。

## 核心功能
- **智能问答 (RAG)**：AI 会实时读取当前作品的所有模块内容。您可以问它："主角的佩剑叫什么名字？"，它会从设定集中查找答案。
- **一键续写**：在卡文时，点击助手栏的 "续写" 按钮，AI 会根据前文逻辑生成后续发展。
- **文笔润色**：选中一段文字，让 AI 优化修辞或转换风格。

## 唤起方式
- AI 助手面板默认开启，位于编辑器右侧。
            `
        },
        'ai-mention': {
            title: '@引用模块',
            body: `
## 功能说明
在与 AI 对话时，您可以使用 **@** 符号引用特定模块，让 AI 专注于该内容。

## 使用方法
1. 在输入框中输入 \`@\`。
2. 会弹出模块选择器，显示当前作品的所有模块。
3. 点击选择想要引用的模块。
4. 引用的模块内容会作为上下文传递给 AI。

## 使用场景
- **角色对话**：@角色A 和 @角色B，让 AI 根据两人性格生成对话。
- **剧情推进**：@大纲 并询问下一幕应该发生什么。
- **设定核查**：@世界观设定 并询问某个细节是否合理。
            `
        },
        'chat-history': {
            title: '对话历史',
            body: `
## 功能说明
AI 助手会保存您的对话历史，方便随时回顾和继续。

## 操作方式
- **查看历史**：点击 AI 助手顶部的时钟图标。
- **加载对话**：点击历史记录中的某个会话，继续之前的对话。
- **新建对话**：点击 "+" 按钮开始新的对话。
- **删除对话**：在历史列表中滑动或右键删除不需要的记录。

## 注意事项
- 每个作品的对话历史独立保存。
- 对话历史存储在本地数据库中。
            `
        },
        'smart-write': {
            title: '智能写作工具',
            body: `
## 功能概述
智能写作工具是 AI 助手的核心能力，帮助您突破创作瓶颈。

## 续写 (Continue)
- **触发方式**：将光标放在段落末尾，点击工具栏的"续写"按钮。
- **效果**：AI 会根据前文语境、章节大纲、参与实体的设定信息，自动生成后续内容。
- 生成的内容以流式传输实时呈现，完成后您可以确认或拒绝。

## 润色 (Polish)
- **触发方式**：选中需要润色的文本，点击"润色"按钮。
- **效果**：AI 会优化措辞、增强文采，同时保持原意。
- 修改会以差异对比形式展示，您可以确认或拒绝。

## AI 写作模式

当您让 AI **从零生成整章内容**时（例如通过 Agent 模式对话），编辑器进入写作模式：
1. AI 以流式传输生成内容，您可以实时看到文字出现。
2. 生成完成后，内容以预览形式展示。
3. 点击 **确认** 接受内容写入章节，或 **拒绝** 放弃。

## AI 修改模式

当 AI **修改已有章节内容**时，编辑器进入修改模式：
1. AI 精确定位需要修改的段落，进行替换或插入操作。
2. 编辑器显示**差异对比视图**：
   - 绿色标记：新增内容
   - 红色标记：删除内容
3. 底部展示修改统计（新增/删除字数）。
4. 点击 **确认** 应用修改，或 **拒绝** 恢复原文。

## 更多工具

编辑器工具栏还提供了提取实体、提取关系、文风检测、质量评估等更多 AI 工具。详见 [编辑器工具栏](/docs/zh/user-guide/ai-assistant/editor-toolbar)。
            `
        },
        'knowledge-base': {
            title: '世界观管理',
            body: `
Qritor 提供了一整套**世界观管理**工具，帮助您系统化地构建和维护小说的世界观。

## 核心理念

长篇小说的世界观往往庞大而复杂。Qritor 将世界观拆解为三个维度来管理：

### 实体 — "有什么"
您作品中的所有角色、场景、组织、道具、设定等，都以**模块**的形式存在。每个模块有结构化的字段，让信息井然有序。

### 关系 — "怎么连"
实体之间的关系通过**关系图谱**可视化展示。角色之间的敌对、同盟、师徒关系，组织之间的隶属关系，一目了然。

### 变化 — "如何演"
实体的状态随剧情发展而变化。**动态信息**系统追踪每个实体在不同章节中的状态变迁，确保前后一致。

## AI 自动维护

最强大的特性是：您**不需要手动维护**这一切。

1. 编写章节正文时，使用编辑器工具栏的"提取"系列工具。
2. AI 自动从文本中识别新实体、新关系、状态变化。
3. 确认后一键写入数据库。

您的世界观会随着创作自然生长，始终与最新内容保持同步。
            `
        },
        'entity-types': {
            title: '实体类型',
            body: `
## 概述

Qritor 将小说世界观中的一切事物组织为**实体**，每种实体类型有特定的属性字段。实体在模块树中按分类分组显示。

## 内置实体类型

### 角色 (Character)
- **定义**：小说中的具有能动性的人物或生物。
- **典型字段**：姓名、年龄、性别、性格特征、外貌描写、背景故事。
- **在模块树中**：归入"角色库"分组。

### 场景 (Scene)
- **定义**：故事发生的地理位置、空间或环境。
- **典型字段**：名称、地理位置、环境描述、氛围、历史背景。
- **在模块树中**：归入"场景库"分组。
- **层级关系**：场景可以有包含关系（如 王国 → 城市 → 酒馆）。

### 组织 (Organization)
- **定义**：由多个角色组成的团体，如门派、国家、帮派、商会等。
- **典型字段**：名称、宗旨、规模、主要成员、势力范围。
- **在模块树中**：归入"组织库"分组。
- **复杂关系**：组织之间往往存在外交、战争或贸易关系。

### 道具 (Prop)
- **定义**：具有特殊意义或功能的物体，如武器、法宝、信物等。
- **典型字段**：名称、类型、功能描述、持有人、来历。
- **在模块树中**：归入"道具库"分组。

### 设定 (Setting)
- **定义**：世界观层面的规则和背景，如魔法体系、修炼等级、历史纪元等。
- **典型字段**：根据创作方法自定义。
- **在模块树中**：归入"设定"分组。

### 章节 (Chapter)
- **定义**：小说的章节内容。
- **特殊性**：章节模块使用专用的文本编辑器，而非表单界面。
- **在模块树中**：归入"章节"分组。

## 自定义类型

在**创作方法**中，您可以完全自定义实体类型：
1. **定义新类型**：例如"功法"、"魔兽"、"时间线事件"、"阵法"等。
2. **定制字段**：为每种类型设计专属的表单字段（文本、数字、下拉选择等）。
3. **AI 生成**：为自定义类型配置 AI 提示，让 AI 辅助生成内容。

不同的创作方法预设了不同的实体类型组合，适配不同的小说题材（玄幻、悬疑、修仙、言情等）。
            `
        },
        'module-edit': {
            title: '模块编辑',
            body: `
## 概述

在 Qritor 中，**非章节模块**（角色、场景、组织、道具、设定等）通过**表单界面**进行编辑。每种模块类型都有由创作方法预定义的字段结构，系统会根据 JSON Schema 自动生成对应的编辑表单。

## 打开模块编辑

在模块树中点击任意非章节模块，中间工作区会自动切换到该模块的编辑界面。

## 三个 Tab 页签

模块编辑界面分为三个 Tab：

### 信息 (Info)
主要的内容编辑区域。
- 系统根据模块类型的 JSON Schema 自动生成表单字段。
- 常见字段类型：文本输入、多行文本、数字、下拉选择、布尔开关等。
- 例如"角色"模块可能包含：姓名、年龄、性别、性格描述、外貌特征、背景故事等字段。
- 修改后自动保存。

### 动态信息 (Dynamic Info)
追踪该实体随剧情发展的状态变化。
- 记录"在第 X 章，该角色发生了什么变化"。
- 例如：角色在第 3 章受伤，第 5 章恢复；势力在第 8 章灭亡。
- 可手动添加，也可由 AI 从正文中自动提取。
- 详见 [动态信息](/docs/zh/user-guide/worldbuilding/dynamic-info) 页面。

### 关系 (Relations)
查看该实体与其他实体之间的关系。
- 显示以当前实体为中心的关系子图。
- 可直接查看关联的角色、组织、场景等。
- 详见 [关系图谱](/docs/zh/user-guide/worldbuilding/relation-graph) 页面。

## AI 辅助填写

如果模块类型启用了 AI 生成，您可以：
1. 在 AI 助手中使用 **Agent 模式**。
2. 让 AI 根据上下文自动填充模块字段。
3. 也可以使用编辑器工具栏的"提取实体"功能，从已写好的章节中自动提取信息到模块中。
            `
        },
        'ai-modes': {
            title: 'AI 模式',
            body: `
## 两种工作模式

Qritor 的 AI 助手提供两种工作模式，适用于不同场景：

### Agent 模式

**默认模式**。AI 不仅可以回答问题，还能**直接执行操作**。

AI 在 Agent 模式下可以：
- **章节操作**：创建章节、修改章节内容、更新章节标题、删除章节
- **实体管理**：创建/更新/删除角色、场景、组织、道具等模块
- **内容搜索**：全文搜索、跨章节搜索、章节内搜索
- **关系管理**：创建/更新/删除实体之间的关系
- **剧情管理**：创建剧情事件、管理故事线、处理伏笔
- **动态信息**：更新实体的状态变化记录
- **智能写作**：直接在编辑器中进行续写和修改

适合需要 AI 帮你"动手"的场景，例如："帮我创建一个反派角色"、"把第三章的结尾改得更紧张"。

### 问答模式 (Ask)

AI **只回答问题，不执行任何操作**。

适用于：
- **头脑风暴**：讨论剧情走向、人物设计。
- **分析咨询**：让 AI 分析情节逻辑、指出矛盾。
- **灵感探索**：自由对话，不担心 AI 误操作。

适合只想聊天讨论、不想让 AI 改动任何内容的场景。

## 如何切换

在 AI 助手输入框左侧，点击模式切换按钮即可在两种模式间切换。
- **Agent**：显示为 Agent 标签
- **Ask**：显示为 Ask 标签
            `
        },
        'editor-toolbar': {
            title: '编辑器工具栏',
            body: `
## 概述

当您选中一个**章节模块**并进入编辑器视图时，顶部会显示一排工具栏按钮。这些工具覆盖了章节编辑的方方面面。

## 写作工具

### 续写
AI 根据前文内容自动生成后续段落。将光标放在文本末尾，点击"续写"按钮即可。

### 润色
选中一段文本后，点击"润色"按钮，AI 会优化措辞和文采，同时保持原意。

## 章节管理工具

### 大纲
打开章节大纲编辑弹窗，为当前章节编写摘要或提纲。大纲内容会作为 AI 理解章节意图的重要上下文。

### 参与实体
管理当前章节中出场的角色、场景、道具等。
- 打开弹窗后可以勾选哪些实体在本章登场。
- 选中的实体信息会自动传递给 AI，提供更精准的创作辅助。

## AI 提取工具

这一组工具让 AI **从已写好的章节正文中自动识别和提取结构化信息**，发送到 AI 助手进行处理。

### 提取实体
AI 分析正文，识别出新出现的角色、场景、组织、道具等，提取为结构化数据。您可以一键将提取结果应用到模块中。

### 提取动态信息
AI 识别正文中实体状态的变化（如角色受伤、获得新能力、关系转变等），提取为时间线记录。

### 提取关系
AI 识别正文中人物之间的关系（如敌对、同盟、师徒等），提取为关系数据，可直接写入知识图谱。

## 分析工具

### 剧情整理
打开剧情事件编辑器，查看和管理当前章节关联的剧情事件。详见 [故事线与事件](/docs/zh/user-guide/plot-management/storylines)。

### 文风检测
AI 分析当前章节的写作风格，检查与全书整体风格是否一致，并给出调整建议。

### 质量评估
AI 对当前章节进行综合质量评估，从情节逻辑、人物塑造、节奏把控、文笔水平等维度给出评分和改进建议。
            `
        },
        worldbuilding: {
            title: '世界观管理',
            body: `
Qritor 提供了一整套**世界观管理**工具，帮助您系统化地构建和维护小说的世界观。

## 核心理念

长篇小说的世界观往往庞大而复杂。Qritor 将世界观拆解为三个维度来管理：

### 实体 — "有什么"
您作品中的所有角色、场景、组织、道具、设定等，都以**模块**的形式存在。每个模块有结构化的字段，让信息井然有序。

### 关系 — "怎么连"
实体之间的关系通过**关系图谱**可视化展示。角色之间的敌对、同盟、师徒关系，组织之间的隶属关系，一目了然。

### 变化 — "如何演"
实体的状态随剧情发展而变化。**动态信息**系统追踪每个实体在不同章节中的状态变迁，确保前后一致。

## AI 自动维护

最强大的特性是：您**不需要手动维护**这一切。

1. 编写章节正文时，使用编辑器工具栏的"提取"系列工具。
2. AI 自动从文本中识别新实体、新关系、状态变化。
3. 确认后一键写入数据库。

您的世界观会随着创作自然生长，始终与最新内容保持同步。
            `
        },
        'relation-graph': {
            title: '关系图谱',
            body: `
## 概述

关系图谱以可视化的网络图展示作品中所有实体之间的关系。切换到编辑器底部的 **"关系图谱"** Tab 即可查看。

## 交互操作

- **缩放**：使用鼠标滚轮放大或缩小视图。
- **平移**：按住鼠标左键拖拽画布。
- **移动节点**：拖拽单个节点调整布局。
- **查看详情**：点击节点查看实体信息，点击连线查看关系描述。
- **适应视图**：使用底部控制栏的"适应视图"按钮，让图谱自动缩放以显示全部内容。

## 关系类型

图谱使用颜色编码区分不同的关系类型：

| 关系 | 颜色 | 说明 |
|------|------|------|
| **亲属** | <span style="color:#ec4899">■</span> 粉色 | 血缘、家族关系 |
| **同盟** | <span style="color:#22c55e">■</span> 绿色 | 联盟、合作关系 |
| **敌对** | <span style="color:#ef4444">■</span> 红色 | 冲突、对立关系 |
| **师徒** | <span style="color:#a855f7">■</span> 紫色 | 传承、指导关系 |
| **位于** | <span style="color:#3b82f6">■</span> 蓝色 | 地理位置关系 |
| **隶属** | <span style="color:#eab308">■</span> 黄色 | 从属、雇用关系 |
| **恋人** | <span style="color:#f43f5e">■</span> 玫红 | 恋爱、婚姻关系 |
| **朋友** | <span style="color:#14b8a6">■</span> 青色 | 友好关系 |
| **其他** | <span style="color:#6b7280">■</span> 灰色 | 未分类的关系 |

## 关系的创建方式

### AI 自动提取
在章节编辑器中使用工具栏的"提取关系"按钮，AI 会从正文中自动识别人物关系并生成结构化数据。确认后即可写入图谱。

### AI Agent 操作
在 Agent 模式下，您可以直接告诉 AI："把张三和李四设为师徒关系"，AI 会自动执行。

### 手动创建
在模块编辑界面的"关系"Tab 中，也可以手动添加关系。
            `
        },
        'dynamic-info': {
            title: '动态信息',
            body: `
## 什么是动态信息

在长篇小说中，角色和事物的状态会随着剧情不断变化。比如：
- 角色在第 3 章受了重伤
- 某个组织在第 8 章被瓦解
- 一件神器在第 12 章被损毁

**动态信息**系统专门追踪这些变化，让 AI 和您自己都能清楚知道"在故事的某个时间点，这个实体是什么状态"。

## 查看方式

### 模块编辑 — 动态信息 Tab
在模块编辑界面切换到"动态信息"Tab，可以看到该实体所有的状态变化记录，按时间线排列。

### 状态历史面板
在编辑器底部的"状态历史"Tab 中，可以查看全局的状态变化总览。

## 记录内容

每条动态信息包含：
- **变化描述**：发生了什么（如"左臂受伤"）
- **关联章节**：在哪一章发生的
- **影响字段**：哪个属性发生了变化

## 创建方式

### AI 自动提取
在章节编辑器中使用"提取动态信息"工具，AI 会分析正文，自动识别实体状态的变化并生成记录。

### AI Agent 操作
在 Agent 模式下告诉 AI："记录一下张三在这一章失去了内力"，AI 会自动创建动态信息。

### 手动添加
在模块的"动态信息"Tab 中手动添加记录。

## 对 AI 创作的意义

动态信息是 AI 上下文感知的重要组成部分。当 AI 续写后续章节时，它会读取相关角色的最新状态，避免出现"已经受伤的角色突然生龙活虎"这类逻辑矛盾。
            `
        },
        'plot-management': {
            title: '剧情管理',
            body: `
Qritor 提供了专业的**剧情管理**工具，帮助您从宏观层面把控故事的节奏和结构。

## 核心功能

### 故事线管理
将复杂的剧情拆分为多条故事线（主线、感情线、副线等），分别管理和追踪进展。

### 剧情事件追踪
为每一章标记关键的剧情事件，区分事件类型（转折、高潮、伏笔等），建立事件与章节的双向关联。

### 伏笔系统
创建和追踪伏笔，确保每个埋下的伏笔都能在后续章节中被妥善回收。

## 打开方式

- 在编辑器底部的 Tab 栏中，点击 **"剧情历史"** 即可打开剧情管理面板。
- 在章节编辑器工具栏中，点击 **"剧情整理"** 可查看当前章节关联的事件。
            `
        },
        storylines: {
            title: '故事线与事件',
            body: `
## 故事线管理

### 什么是故事线
故事线是对小说剧情的宏观划分。一部长篇小说通常包含多条并行或交织的故事线，例如：
- **主线**：核心冲突的推进
- **感情线**：角色间的情感发展
- **副线**：支线剧情、配角故事

### 操作方式
- **创建故事线**：在剧情管理面板中点击"新建故事线"。
- **编辑故事线**：修改名称或描述。
- **删除故事线**：移除不再需要的故事线（其下的事件不会被删除）。

## 剧情事件

### 什么是剧情事件
剧情事件是故事中的关键节点。每个事件关联到一个特定的章节，并归属于某条故事线。

### 事件类型

| 类型 | 说明 | 适用场景 |
|------|------|---------|
| **普通** | 常规剧情推进 | 日常情节、过渡段落 |
| **转折点** | 剧情方向发生重大变化 | 背叛、意外发现、身份揭露 |
| **高潮** | 故事的紧张顶点 | 决战、最终对峙、情感爆发 |
| **结局** | 某条线索的收束 | 谜题解开、冲突化解 |
| **伏笔** | 为后续发展埋下线索 | 暗示、预兆、看似无关的细节 |

### 创建事件
1. 在剧情管理面板中点击"新建事件"。
2. 选择事件类型和所属故事线。
3. 关联到对应的章节。
4. 填写事件描述。

也可以在章节编辑器的"剧情整理"工具中直接创建。

## 筛选与查看

- **按故事线筛选**：只显示某条故事线的事件。
- **按章节筛选**：只显示某章的事件。
- **只看伏笔**：筛选出所有伏笔类型的事件，快速检查回收情况。
            `
        },
        foreshadowing: {
            title: '伏笔系统',
            body: `
## 什么是伏笔系统

伏笔是长篇小说的灵魂。Qritor 提供了专门的伏笔管理工具，帮您追踪每一个埋下的种子，确保不会遗忘。

## 伏笔状态

每个伏笔有两种状态：
- **待回收**：已埋下但尚未揭示的伏笔。
- **已回收**：已在后续章节中回收/揭示的伏笔。

## 创建伏笔

### 方式一：创建剧情事件时标记
在创建剧情事件时，选择事件类型为"伏笔"。系统会自动将其加入伏笔追踪列表。

### 方式二：AI 辅助识别
在 Agent 模式下，AI 可以帮您识别文中潜在的伏笔，或主动创建伏笔记录。

## 回收伏笔

当后续章节揭示了某个伏笔时：
1. 在剧情管理面板中找到该伏笔。
2. 点击"回收"按钮。
3. 选择在哪一章进行了回收。
4. 伏笔状态变为"已回收"。

## 伏笔检查

在剧情管理面板中，使用"只看伏笔"筛选，可以一览所有伏笔的状态：
- 哪些伏笔还未回收？
- 是否有遗忘的伏笔？
- 伏笔分布是否合理？

这对于长篇连载尤为重要，可以避免"挖坑不填"的问题。
            `
        },
        configuration: {
            title: '系统配置',
            body: `
## LLM 配置
在设置中可以配置 AI 模型参数：
- **API Base URL**：自定义 API 端点（兼容 OpenAI 格式）。
- **模型选择**：选择要使用的语言模型。
- **最大轮次**：AI 工具调用的最大轮数，控制与工具交互的深度。

## 自动更新
- **启用/禁用**：控制应用是否自动检查更新。
- **检查频率**：设置自动检查更新的时间间隔（默认为 6 小时）。

## 语言设置
切换界面语言，支持简体中文、繁体中文、英语、日语、韩语等 10+ 种语言。
            `
        },
        credits: {
            title: '积分',
            description: '积分（Credits）是 Qritor 中所有 AI 功能的统一消费单位。每次调用 AI 模型都会消耗积分，不同模型的消耗量不同。',
            body: `
## 扣费规则

- 系统会 **优先消耗最先到期的积分**。
- 积分仅在 AI 调用 **成功** 时扣除，调用失败不扣费。
- 积分用尽后，AI 功能将暂停，其他编辑功能不受影响。

## 消耗参考

以下为各功能在典型场景下的积分消耗参考：

### 续写场景（典型小说续写）

| 模型 | 积分/次 | 免费版可用次数 | Plus 可用次数 |
|------|--------|-------------|-------------|
| Grok 4.1 Fast | 2 | ~50 次 | ~1,000 次 |
| GLM-4.7 Flash | 2 | ~50 次 | ~1,000 次 |
| DeepSeek V3.2 | 2 | ~50 次 | ~1,000 次 |
| MiniMax M2.5 | 2 | ~50 次 | ~1,000 次 |
| Kimi K2.5 | 4 | ~25 次 | ~500 次 |
| Gemini 3 Flash | 4 | ~25 次 | ~500 次 |
| GLM-5 | 6 | ~16 次 | ~333 次 |
| Claude Sonnet 4.5 | 21 | ~4 次 | ~95 次 |
| Claude Opus 4.6 | 35 | ~2 次 | ~57 次 |

### 短对话场景

短对话场景下，大多数模型每次仅消耗 **1 积分**，旗舰模型消耗 5-8 积分。

### 图片生成

- **标准模型**：1024x1024 约 9 积分
- **高级模型**：1024x1024 约 16 积分
- **顶级模型**：1024x1024 约 27 积分

### 视频生成

- **标准模型**：5 秒约 100 积分
- **高级模型**：5 秒约 200 积分
- **顶级模型**：5 秒约 400 积分

## 查看用量

登录 Qritor 官网，进入 **个人中心 > 账单管理**，可查看积分余额和消费明细，包括每笔消耗的模型、token 用量和扣除积分。

## 积分类型

- **订阅积分**：订阅方案按月发放，周期结束后重置。
- **邀请积分**：通过邀请好友获得，有效期 30 天。
- **积分包**：单独购买的积分补充包，有效期 30 天（即将推出）。

## 积分用完了？

- **升级方案**：切换到更高级的订阅方案获取更多月度积分。
- **邀请好友**：邀请人获得 50 积分，受邀人获得 30 积分。
- **积分包**：后续将推出单独购买的积分包（敬请期待）。
            `,
            quickLinks: [
                { title: '定价方案', description: '选择适合你的方案', path: '/docs/zh/pricing/plans', icon: 'arrow' },
                { title: '计费说明', description: '了解支付和账单管理', path: '/docs/zh/pricing/billing', icon: 'arrow' }
            ]
        },
        'pricing-plans': {
            title: '定价',
            description: '选择适合你创作需求的订阅方案。所有方案均包含完整的模块化编辑器和 AI 辅助创作功能。',
            body: `
## 方案对比

| 方案 | 价格 | 每月积分 | 项目数量 | 模型权限 |
|------|------|---------|---------|---------|
| **Free** | $0/月 | 100 | 1 个 | 经济型模型 |
| **Plus** | $20/月 | 2,000 | 5 个 | 经济型 + 标准型 |
| **Pro** | $60/月 | 6,000 | 20 个 | 全部模型 |
| **Max** | $200/月 | 20,000 | 不限 | 全部模型 |

## 方案选择指南

- **Free**：适合初次体验 AI 辅助创作，可使用 Grok Fast、GLM Flash 等经济型模型。
- **Plus**：适合日常创作，解锁 Kimi K2.5、Gemini Flash 等标准型模型，积分足够每天续写数十次。
- **Pro**：适合专业创作者，解锁 Claude Sonnet、Claude Opus 等旗舰模型，积分充裕。
- **Max**：适合重度创作者和工作室，不限项目数量，优先客服支持。

## 所有方案通用功能

- 模块化小说编辑器（章节、角色卡、场景等）
- AI 对话助手（Agent 模式 + 问答模式）
- 世界观管理（实体、关系图谱、动态信息）
- 剧情管理（故事线、伏笔追踪）
- 编辑器工具栏（续写、润色、提取实体等）

## 模型等级说明

Qritor 将 AI 模型分为四个等级，不同方案可访问的等级不同：

- **经济型（Economy）**：高性价比模型，适合日常创作。如 Grok Fast、GLM Flash、DeepSeek V3。
- **标准型（Standard）**：均衡性能，适合多数场景。如 Kimi K2.5、Gemini Flash。
- **高级型（Advanced）**：高质量输出。如 GLM-5。
- **旗舰型（Flagship）**：最强模型。如 Claude Sonnet 4.5、Claude Opus 4.6。

## 订阅管理

- **升级**：升级后立即生效，旧方案剩余积分自动结转到新方案。
- **到期续订**：付费方案到期后需手动续订，未续订将降级为 Free。
- **积分有效期**：订阅积分在当前周期（30 天）内有效，不累计到下一周期。
            `,
            quickLinks: [
                { title: '立即订阅', description: '选择你的方案', path: '/pricing', icon: 'arrow' },
                { title: '积分说明', description: '了解积分消耗明细', path: '/docs/zh/pricing/credits', icon: 'arrow' }
            ]
        },
        billing: {
            title: '计费',
            description: '了解 Qritor 的计费周期、支付方式、订单管理和退款政策。',
            body: `
## 管理方案

登录 Qritor 官网，进入 **个人中心 > 账单管理**，可以查看当前订阅状态、积分余额，以及管理支付方式。

## 计费周期

- 所有付费方案按 **30 天** 为一个计费周期。
- 付费方案到期后不会自动续费，需手动续订。
- 未续订将降级为 Free 方案，剩余积分过期作废。
- 积分包为一次性购买，有效期 30 天。

## 支付方式

当前支持以下支付方式：
- **Visa / Mastercard** 信用卡或借记卡
- **微信支付**（通过 Stripe 处理）

你可以在账单管理页面保存常用卡片，下次支付时一键扣款。

## 订单与账单

在账单管理页面可查看所有历史订单：

### 订单类型
- **新购**：首次订阅付费方案
- **续费**：续订当前方案

### 订单状态
- **待支付**：订单已创建，等待支付（30 分钟内有效）
- **已支付**：支付完成，订阅已激活
- **已取消**：用户主动取消
- **已过期**：超过 30 分钟未支付

## 邀请奖励

通过专属邀请码邀请好友注册 Qritor，双方均可获得积分奖励：
- **邀请人**：获得 50 积分（有效期 30 天）
- **受邀人**：获得 30 积分（有效期 30 天）

邀请码可在个人中心的邀请页面获取。

## 常见问题

### 付款失败怎么办？
请检查卡片余额和有效期，或更换支付方式重试。如持续失败，请联系客服。

### 可以退款吗？
订阅需在支付后 24 小时内申请退款，且未使用积分。请通过联系我们页面提交退款申请。

### 升级后旧积分怎么处理？
升级时，旧方案的剩余积分会自动结转到新方案中，不会浪费。
            `,
            quickLinks: [
                { title: '定价方案', description: '查看所有方案', path: '/docs/zh/pricing/plans', icon: 'arrow' },
                { title: '联系我们', description: '获取支付帮助', path: '/docs/zh/support/contact', icon: 'arrow' }
            ]
        },
        'download-guide': {
            breadcrumb: '支持',
            title: '下载安装指南',
            description: '本指南将帮助您下载和安装 Qritor 桌面客户端，包含详细的系统要求和安装步骤。',
            body: `
## 系统要求

### macOS
- macOS 10.15 (Catalina) 或更高版本
- Apple Silicon (M1/M2/M3) 或 Intel 处理器
- 至少 4GB 内存
- 500MB 可用磁盘空间

### Windows
- Windows 10 (64位) 或更高版本
- 至少 4GB 内存
- 500MB 可用磁盘空间

## 下载地址

访问 [下载页面](/download) 获取最新版本的 Qritor 桌面客户端。

页面会自动检测您的操作系统，推荐最适合的版本。您也可以手动选择其他版本。

---

## macOS 安装指南

### 第一步：选择正确的版本

- **Apple Silicon (M1/M2/M3 芯片)** → 下载 **arm64** 版本
- **Intel 芯片** → 下载 **x64** 版本

不确定自己的芯片类型？点击左上角  → 「关于本机」查看。

### 第二步：安装应用

1. 双击下载的 \`.dmg\` 文件，打开安装镜像
2. 在弹出的窗口中，将 **Qritor 图标** 拖动到 **Applications 文件夹**
3. 等待复制完成

### 第三步：首次启动

1. 打开「访达」→「应用程序」文件夹
2. 双击 **Qritor** 启动应用
3. 应用已通过 Apple 公证，可直接运行

### macOS 常见问题

**Q: 提示"Qritor 已损坏，无法打开"怎么办？**

这通常是因为下载不完整。请重新下载安装包，确保下载完成后再安装。

**Q: 如何卸载？**

将「应用程序」文件夹中的 Qritor 拖入废纸篓即可。

---

## Windows 安装指南

### 重要提示：安全警告说明

由于 Qritor 是新发布的软件，Windows 和浏览器会显示安全警告。**这是正常现象**，不代表软件有问题。

原因：Windows SmartScreen 基于软件的下载量来判断信任度，新软件需要积累一定用户量后警告才会消失。

### 第一步：下载安装包

点击下载提示右侧的 **「...」** 按钮
2. 在弹出菜单中选择 **「保留」**

![选择保留文件](/images/docs/win-download-warning-2.png)

### 第二步：处理 SmartScreen 警告

双击安装包时，可能会看到 Microsoft Defender SmartScreen 警告：

![SmartScreen 警告](/images/docs/win-download-warning-1.png)

**解决方法：**

1. 点击弹窗右下角的 **「...」** 按钮
2. 选择 **「仍然保留」**
3. 再次双击安装包即可正常安装

### 第三步：完成安装

1. 在安装向导中，可以选择安装位置（建议保持默认）
2. 可以选择是否创建桌面快捷方式
3. 点击「安装」等待完成
4. 安装完成后，勾选「运行 Qritor」并点击「完成」

### 第四步：首次启动

安装完成后，可以通过以下方式启动 Qritor：
- 桌面快捷方式
- 开始菜单搜索「Qritor」
- 开始菜单 → 所有程序 → Qritor

### Windows 常见问题

**Q: 安装后打开是黑屏/白屏怎么办？**

尝试以下方法：
1. 完全关闭 Qritor（检查任务栏托盘图标）
2. 右键点击 Qritor 快捷方式 → 「以管理员身份运行」

**Q: 如何卸载？**

1. 打开「设置」→「应用」→「已安装的应用」
2. 找到 Qritor，点击「卸载」

---

## 自动更新

Qritor 支持自动更新功能：

1. 当有新版本发布时，应用会在启动时自动检测
2. 弹出更新提示后，点击「立即更新」
3. 下载完成后会自动安装并重启应用

您也可以在应用内手动检查更新：设置 → 关于 → 检查更新

---

## 数据安全

- **本地存储**：所有创作数据存储在您的本地设备
- **隐私保护**：我们不会收集您的创作内容

## 获取帮助

遇到问题？您可以：
- 查看 [常见问题](/docs/zh/support/faq)
- 通过 [联系我们](/docs/zh/support/contact) 获取支持
            `,
            quickLinks: []
        }
    },
    en: {
        overview: {
            breadcrumb: 'Quick Start',
            title: 'Product Overview',
            description: 'Qritor is a professional desktop AI-assisted creative writing platform. Combining minimalist aesthetics with deep context engineering, it supports the entire writing process from inspiration to completion.',
            body: `
Qritor is more than just a writing tool; it is your 24/7 AI creative partner. It deeply understands your world-building, visualizes plot structures through relationship graphs, and manages complex creative tasks with modular systems.

## Core Features

### Immersive Novel Creation
A professional writing environment built for desktop.
- **Modern Editor**: Multi-tab support to manage chapters and settings efficiently.
- **Minimalist Aesthetic**: Distraction-free immersive writing experience.
- **Local Storage**: All creative data stored in a local database, safe and reliable.

### Modular Story Engine
Build stories with engineering thinking.
- **Module Tree**: Flexibly manage chapters, characters, scenes, organizations, props, and settings.
- **Creation Methods**: Professional creation methods organized by novel genre (time travel, post-apocalyptic, supernatural, etc.), each with predefined module types and structure.

### Intelligent Context AI
- **RAG Enhanced**: Real-time understanding of project context and character bios.
- **Smart Completion**: Continuation, polishing, and inspiration at your fingertips.

### Visual Relationship Graph
- **Entity Networks**: Visualize complex relationships between characters and factions.
- **Dynamic Evolution**: Track story structure changes as the plot progresses.

## Future Roadmap

### Social Media Tweets (Coming Soon)
- One-click transformation of highlights into social media cards.

### Webtoon/Comics (Planned)
- Script visualization and character design generation.

### Short Videos (Planned)
- Text-to-video generation for story highlights.

## Getting Started

1. **Download & Install** - Get the desktop client for macOS or Windows
2. **Create Project** - Start a new creative project
3. **Explore Methods** - Choose your creative methodology
4. **Start Writing** - Enjoy the AI-empowered writing experience
            `,
            quickLinks: [
                { title: 'Quick Start', description: 'Get started in 5 minutes', path: '/docs/en/quick-start', icon: 'arrow' },
                { title: 'Download', description: 'Get Windows/macOS client', path: '/download', icon: 'arrow' }
            ]
        },
        'quick-start': {
            title: 'Getting Started',
            description: 'This guide walks you through creating a novel from scratch as an individual user. By the end, you will be familiar with modular writing, the dual-mode AI assistant, and worldbuilding management — the key tools for AI-assisted novel creation.',
            layout: 'stepper',
            body: `
## Download and Install Qritor

1. Visit the [download page](/download) to get the installer for your operating system.
2. Double-click the installer to complete installation.
3. Launch the Qritor desktop client.

For detailed system requirements and installation instructions, see the [Download & Install Guide](/docs/en/support/download-guide).

## Sign In

1. After launching the Qritor desktop client, a login card will appear on the right side of the home screen.
2. Click the **"Sign In"** button to log in or register via OAuth (first-time users can click **"Register now"** at the bottom to create an account).
3. Once signed in, the app will automatically redirect to the novels workspace. All creative data is stored locally.

![Login page](/images/docs/desktop-login-en.png)

## Browse Novel Creation Methods

Click **"Novel Creation Methods"** in the sidebar to enter the creation methods page.

1. Novel creation methods are organized by genre (time travel, post-apocalyptic, supernatural, etc.), each with predefined module types and structure for that genre.
2. Search or browse all available methods to learn which one fits your story.
3. Click the **"Sync"** button to fetch the latest novel creation methods from the cloud.

## Create a Novel

1. Click **"Novels"** in the sidebar to return to the works list, then click **"New Novel"** at the top right.
2. Enter a **Novel Name**, select a **Novel Creation Method** from the dropdown (this determines which module types your work will have, e.g., character sheets, scenes, props), and optionally add a description.
3. Click create. The system will automatically generate an initial module structure based on the selected method.

## Explore the Editor Interface

Click a novel card to enter the editor. You will see a three-column layout:

- **Left: Module Tree** — Manage all modules by category, including chapters, characters, scenes, organizations, props, and settings.
- **Center: Workspace** — Contains three tabs: Editor (text editing or module forms), Relation Graph (entity relationship network), and Plot Management (storylines and events).
- **Right: AI Assistant** — Enabled by default. Supports Agent mode (can create/modify/delete modules and more) and Ask mode (conversation only).

## Build Your Worldbuilding

Before you start writing, establish the worldbuilding foundation for your novel.

1. Select character, scene, organization, or other modules in the Module Tree and fill in structured information in the editor.
2. Switch to the **Relation Graph** tab to view the relationship network between all entities. You can also add relationships manually.
3. You can skip this step and start writing directly — the AI can later extract entity information and relationships from your text automatically.

## Human-AI Collaborative Writing

1. Select a chapter node in the Module Tree. The center workspace will open the text editor.
2. Write directly, or type a command in the AI Assistant (e.g., "Continue this chapter based on the outline"). The AI will generate content for your review.
3. Use the editor toolbar tools like **Continue** and **Polish** to assist your writing.
4. After finishing a chapter, use the toolbar tools **Extract Entities**, **Extract Relations**, and **Plot Organizer** to let the AI automatically maintain your worldbuilding and plot lines.
5. Ask the AI Assistant anytime, e.g., "What unresolved foreshadowing is there?" and it will answer based on the full text.
            `,
            quickLinks: []
        },
        creation: {
            title: 'Creation Features',
            body: `
Qritor's core design philosophy is built around **"Engineering-based Writing"**.

## Novel Management
On the "Novels" page in the sidebar, you can manage all your works. When creating a novel, the most crucial step is selecting a **Creation Method**.
- Creation methods are organized by novel genre (time travel, post-apocalyptic, supernatural, etc.), each with predefined module types and structure for that genre.
- After selecting a method, the system will automatically generate initial modules based on the method's singleton module definitions.

## Modular Editing
Unlike linear document editors, Qritor breaks a work down into multiple **Modules**.
- **Module Tree**: On the left, you can create nodes of any type: chapters, volumes, character sheets, geographical settings, etc.
- **Tabs**: The center workspace supports multiple tabs, allowing you to open outlines and chapters side-by-side for reference.
- **Library**: If you prefer a non-tree view, the "Library" view shows all modules as cards.
            `
        },
        'novel-create': {
            title: 'Create Novel',
            body: `
## New Project
On the "Novels" page, click the **"New Novel"** button at the top right and fill in basic info:
- **Novel Name**: Enter the title of your work.
- **Creation Method**: Select from the dropdown. The creation method determines which module types your work will have (e.g., character sheets, scenes, props, etc.). The system will auto-generate initial modules based on the method's singleton definitions.
- **Description** (optional): Enter a brief description to help AI understand your creative intent.

## Managing Works
- **Open Editor**: Click a work card to enter the editor.
- **Delete Work**: Right-click or use the menu button on a work card to delete.
- **Search**: Use the search bar at the top to quickly locate a work.
            `
        },
        'chapter-edit': {
            title: 'Chapter Editing',
            body: `
## Basic Operations
Select a chapter module, then switch to the **"Editor"** view to start writing.

## Editor Features
- **Immersive Mode**: The editor automatically hides unnecessary UI for focused writing.
- **Multi-Tab Editing**: Open multiple modules and switch between chapters quickly.
- **Auto-Save**: Content is saved to the local database in real-time.
- **Word Count**: Real-time word count displayed at the bottom of the editor.
- **Font Size**: Adjust editor font size via the toolbar to match your reading preference.

## Chapter Outline

Each chapter can have an **outline/summary**. Click the "Outline" button in the toolbar to open the editing modal. Outlines help you organize your thoughts before writing and serve as important context for AI to understand the chapter's intent.

## Participants

Use the "Participants" button in the toolbar to manage which characters, scenes, and props appear in the current chapter. Once selected, their information is passed as context to AI for more setting-accurate writing assistance.

## AI Writing Mode

When AI generates an entire chapter for you, the editor enters **Writing Mode**:
1. AI streams content in real-time — you can see text appearing progressively.
2. After generation completes, content is displayed as a preview.
3. You can **Confirm** to accept the content, or **Reject** to discard.

## AI Modify Mode

When AI makes targeted edits to existing content, the editor enters **Modify Mode**:
1. AI locates the passages to modify, performing replacements or insertions.
2. The editor displays a **diff view** highlighting additions and deletions.
3. Modification statistics (words added/removed) are shown at the bottom.
4. You can **Confirm** to apply changes, or **Reject** to restore the original.

## AI Assistance
- **Select & Polish**: Select text to have AI optimize your wording.
- **More Tools**: See [Editor Toolbar](/docs/en/user-guide/ai-assistant/editor-toolbar) for details.
            `
        },
        'module-tree': {
            title: 'Module Tree Operations',
            body: `
## Introduction
The Module Tree is Qritor's core organizational structure for managing all content nodes in your work.

## Basic Operations
- **Create Module**: Click the "+" button at the top of the tree, or right-click a parent module to select "Add Child".
- **Select Type**: Based on your creation method, you can choose chapters, character sheets, settings, etc.
- **Rename**: Double-click the module name, or right-click and select "Rename".
- **Delete**: Right-click and select "Delete". This will recursively delete all child modules.

## Advanced Features
- **Drag & Drop Sorting**: Hold and drag modules to reorder or change hierarchy.
- **Expand/Collapse**: Click the arrow icon to expand or collapse the subtree.
- **Context Menu**: Provides quick access to create, rename, and delete actions.
            `
        },
        'ai-assistant': {
            title: 'AI Assistant',
            body: `
Qritor's AI Assistant features **Context Awareness**.

## Core Features
- **RAG (Retrieval-Augmented Generation)**: The AI reads all module content in real-time. You can ask: "What is the protagonist's sword name?", and it will find the answer from your settings.
- **Smart Completion**: When stuck, click the "Continue" button in the assistant panel, and AI will generate the next part based on previous context.
- **Polishing**: Select text to have AI optimize rhetoric or change style.

## How to Invoke
- The AI Assistant panel is open by default on the right side of the editor.
            `
        },
        'ai-mention': {
            title: '@Mention Modules',
            body: `
## Overview
When chatting with the AI, you can use the **@** symbol to reference specific modules, allowing AI to focus on that content.

## How to Use
1. Type \`@\` in the input field.
2. A module selector will appear, showing all modules in your current work.
3. Click to select the module you want to reference.
4. The referenced module's content will be passed as context to the AI.

## Use Cases
- **Character Dialogue**: @CharacterA and @CharacterB, have AI generate dialogue based on their personalities.
- **Plot Advancement**: @Outline and ask what should happen in the next scene.
- **Setting Verification**: @WorldBuilding and ask if a certain detail is consistent.
            `
        },
        'chat-history': {
            title: 'Chat History',
            body: `
## Overview
The AI Assistant saves your conversation history for easy review and continuation.

## Operations
- **View History**: Click the clock icon at the top of the AI Assistant.
- **Load Conversation**: Click a session in the history to continue the previous chat.
- **New Conversation**: Click the "+" button to start a new chat.
- **Delete Conversation**: Swipe or right-click in the history list to delete unwanted records.

## Notes
- Conversation history is saved separately for each work.
- History is stored in the local database.
            `
        },
        'smart-write': {
            title: 'Smart Writing Tools',
            body: `
## Overview
Smart Writing Tools are the core capability of the AI Assistant, helping you overcome creative blocks.

## Continue
- **Trigger**: Place the cursor at the end of a paragraph, then click the "Continue" button in the toolbar.
- **Effect**: AI generates the next part based on previous context, chapter outline, and participant entity settings.
- Generated content streams in real-time; you can confirm or reject after completion.

## Polish
- **Trigger**: Select text that needs polishing, then click the "Polish" button.
- **Effect**: AI optimizes wording and enhances style while preserving the original meaning.
- Changes are displayed in a diff view; you can confirm or reject.

## AI Writing Mode

When you ask AI to **generate an entire chapter from scratch** (e.g., via Agent mode conversation), the editor enters Writing Mode:
1. AI streams content in real-time — you can watch text appear as it's generated.
2. After generation completes, content is displayed as a preview.
3. Click **Confirm** to accept and write to the chapter, or **Reject** to discard.

## AI Modify Mode

When AI **modifies existing chapter content**, the editor enters Modify Mode:
1. AI precisely locates passages to modify, performing replacements or insertions.
2. The editor displays a **diff view**:
   - Green highlights: Added content
   - Red highlights: Removed content
3. Modification statistics (words added/removed) are shown at the bottom.
4. Click **Confirm** to apply changes, or **Reject** to restore original text.

## More Tools

The editor toolbar also provides entity extraction, relation extraction, style checking, quality assessment, and more AI tools. See [Editor Toolbar](/docs/en/user-guide/ai-assistant/editor-toolbar) for details.
            `
        },
        'knowledge-base': {
            title: 'Worldbuilding',
            body: `
Qritor provides a complete set of **worldbuilding** tools to help you systematically build and maintain your novel's world.

## Core Philosophy

A long-form novel's worldbuilding is often vast and complex. Qritor manages worldbuilding across three dimensions:

### Entities — "What Exists"
All characters, scenes, organizations, props, and settings in your work exist as **modules**. Each module has structured fields to keep information organized.

### Relations — "How They Connect"
Relationships between entities are visualized through the **Relation Graph**. Hostile, alliance, and master-student relationships between characters, subordination between organizations — all at a glance.

### Changes — "How They Evolve"
Entity states change as the plot develops. The **Dynamic Info** system tracks each entity's state transitions across chapters, ensuring consistency.

## AI Auto-Maintenance

The most powerful feature: you **don't need to maintain** any of this manually.

1. While writing chapter text, use the "Extract" tools in the editor toolbar.
2. AI automatically identifies new entities, relationships, and state changes from the text.
3. Confirm and write to the database with one click.

Your worldbuilding grows naturally with your writing, always in sync with the latest content.
            `
        },
        'entity-types': {
            title: 'Entity Types',
            body: `
## Overview

Qritor organizes everything in your novel's world as **entities**. Each entity type has specific attribute fields. Entities are displayed grouped by category in the module tree.

## Built-in Entity Types

### Character
- **Definition**: People or beings with agency in your novel.
- **Typical Fields**: Name, Age, Gender, Personality, Appearance, Backstory.
- **In Module Tree**: Grouped under "Characters."

### Scene
- **Definition**: Geographical locations, spaces, or environments where the story takes place.
- **Typical Fields**: Name, Location, Environment Description, Atmosphere, Historical Background.
- **In Module Tree**: Grouped under "Scenes."
- **Hierarchy**: Scenes can have containment relationships (e.g., Kingdom → City → Tavern).

### Organization
- **Definition**: Groups composed of multiple characters, such as sects, nations, gangs, guilds, etc.
- **Typical Fields**: Name, Purpose, Scale, Key Members, Territory.
- **In Module Tree**: Grouped under "Organizations."
- **Complex Relations**: Organizations often have diplomatic, military, or trade relationships.

### Prop
- **Definition**: Objects with special significance or function, such as weapons, artifacts, tokens, etc.
- **Typical Fields**: Name, Type, Function Description, Owner, Origin.
- **In Module Tree**: Grouped under "Props."

### Setting
- **Definition**: World-level rules and background, such as magic systems, cultivation ranks, historical eras, etc.
- **Typical Fields**: Customized per creation method.
- **In Module Tree**: Grouped under "Settings."

### Chapter
- **Definition**: Story chapter content.
- **Special**: Chapter modules use a dedicated text editor rather than a form interface.
- **In Module Tree**: Grouped under "Chapters."

## Custom Types

In your **Creation Method**, you can fully customize entity types:
1. **Define New Types**: e.g., "Martial Arts Technique", "Magical Beast", "Timeline Event", "Formation", etc.
2. **Custom Fields**: Design dedicated form fields for each type (text, number, dropdown, etc.).
3. **AI Generation**: Configure AI prompts for custom types to enable AI-assisted content generation.

Different creation methods come with different entity type combinations, tailored for different novel genres (fantasy, mystery, cultivation, romance, etc.).
            `
        },
        'module-edit': {
            title: 'Module Editing',
            body: `
## Overview

In Qritor, **non-chapter modules** (characters, scenes, organizations, props, settings, etc.) are edited through a **form interface**. Each module type has a field structure predefined by the creation method, and the system automatically generates the corresponding edit form based on JSON Schema.

## Opening Module Editor

Click any non-chapter module in the module tree, and the center workspace will automatically switch to that module's editing interface.

## Three Tabs

The module editing interface is divided into three tabs:

### Info
The primary content editing area.
- The system generates form fields automatically based on the module type's JSON Schema.
- Common field types: text input, multi-line text, numbers, dropdowns, boolean toggles, etc.
- For example, a "Character" module might include: Name, Age, Gender, Personality, Appearance, Backstory, etc.
- Changes are auto-saved.

### Dynamic Info
Tracks how the entity's state changes as the plot progresses.
- Records "In Chapter X, what changed about this entity."
- Example: A character gets injured in Chapter 3, recovers in Chapter 5; an organization is dissolved in Chapter 8.
- Can be added manually or auto-extracted by AI from the text.
- See [Dynamic Info](/docs/en/user-guide/worldbuilding/dynamic-info) for details.

### Relations
View the relationships between this entity and others.
- Displays a relationship subgraph centered on the current entity.
- Directly see connected characters, organizations, scenes, etc.
- See [Relation Graph](/docs/en/user-guide/worldbuilding/relation-graph) for details.

## AI-Assisted Editing

If AI generation is enabled for the module type:
1. Use **Agent mode** in the AI Assistant.
2. Let AI automatically fill module fields based on context.
3. You can also use the "Extract Entities" tool in the editor toolbar to auto-extract information from written chapters into modules.
            `
        },
        'ai-modes': {
            title: 'AI Modes',
            body: `
## Two Working Modes

Qritor's AI Assistant offers two working modes for different scenarios:

### Agent Mode

**Default mode.** The AI can not only answer questions but also **directly execute operations**.

In Agent mode, AI can:
- **Chapter Operations**: Create chapters, modify content, update titles, delete chapters
- **Entity Management**: Create/update/delete characters, scenes, organizations, props, etc.
- **Content Search**: Full-text search, cross-chapter search, in-chapter search
- **Relation Management**: Create/update/delete relationships between entities
- **Plot Management**: Create plot events, manage storylines, handle foreshadowing
- **Dynamic Info**: Update entity state change records
- **Smart Writing**: Directly continue or modify content in the editor

Best for scenarios where you need AI to "take action," such as: "Create a villain character for me," or "Make the ending of Chapter 3 more tense."

### Ask Mode

The AI **only answers questions and does not execute any operations**.

Best for:
- **Brainstorming**: Discuss plot directions and character design.
- **Analysis**: Have AI analyze plot logic and identify inconsistencies.
- **Inspiration**: Free conversation without worrying about unintended changes.

Best for when you just want to chat and discuss without AI modifying any content.

## How to Switch

Click the mode toggle button on the left side of the AI Assistant input area to switch between modes.
- **Agent**: Displayed as an "Agent" label
- **Ask**: Displayed as an "Ask" label
            `
        },
        'editor-toolbar': {
            title: 'Editor Toolbar',
            body: `
## Overview

When you select a **chapter module** and enter the editor view, a toolbar appears at the top. These tools cover all aspects of chapter editing.

## Writing Tools

### Continue
AI generates the next paragraph based on previous content. Place your cursor at the end of the text and click the "Continue" button.

### Polish
Select a passage of text, then click "Polish." AI will optimize wording and enhance style while preserving the original meaning.

## Chapter Management Tools

### Outline
Opens a chapter outline editing modal to write a summary or outline for the current chapter. Outline content serves as important context for AI to understand the chapter's intent.

### Participants
Manage which characters, scenes, and props appear in the current chapter.
- Open the modal to check which entities appear in this chapter.
- Selected entity information is automatically passed to AI for more precise creative assistance.

## AI Extraction Tools

These tools let AI **automatically identify and extract structured information from written chapter text**, sending it to the AI Assistant for processing.

### Extract Entities
AI analyzes the text, identifies newly appeared characters, scenes, organizations, props, etc., and extracts them as structured data. You can apply the results to modules with one click.

### Extract Dynamic Info
AI identifies entity state changes in the text (e.g., character injuries, new abilities gained, relationship shifts), extracting them as timeline records.

### Extract Relations
AI identifies relationships between characters in the text (e.g., hostile, alliance, master-student), extracting them as relationship data that can be written directly to the knowledge graph.

## Analysis Tools

### Plot Organization
Opens the plot event editor to view and manage plot events associated with the current chapter. See [Storylines & Events](/docs/en/user-guide/plot-management/storylines).

### Style Check
AI analyzes the current chapter's writing style, checking consistency with the overall book style and providing adjustment suggestions.

### Quality Assessment
AI performs a comprehensive quality evaluation of the current chapter, scoring and suggesting improvements across dimensions like plot logic, character development, pacing, and writing quality.
            `
        },
        worldbuilding: {
            title: 'Worldbuilding',
            body: `
Qritor provides a complete set of **worldbuilding** tools to help you systematically build and maintain your novel's world.

## Core Philosophy

A long-form novel's worldbuilding is often vast and complex. Qritor manages worldbuilding across three dimensions:

### Entities — "What Exists"
All characters, scenes, organizations, props, and settings in your work exist as **modules**. Each module has structured fields to keep information organized.

### Relations — "How They Connect"
Relationships between entities are visualized through the **Relation Graph**. Hostile, alliance, and master-student relationships between characters, subordination between organizations — all at a glance.

### Changes — "How They Evolve"
Entity states change as the plot develops. The **Dynamic Info** system tracks each entity's state transitions across chapters, ensuring consistency.

## AI Auto-Maintenance

The most powerful feature: you **don't need to maintain** any of this manually.

1. While writing chapter text, use the "Extract" tools in the editor toolbar.
2. AI automatically identifies new entities, relationships, and state changes from the text.
3. Confirm and write to the database with one click.

Your worldbuilding grows naturally with your writing, always in sync with the latest content.
            `
        },
        'relation-graph': {
            title: 'Relation Graph',
            body: `
## Overview

The Relation Graph displays all entity relationships in your work as a visual network. Switch to the **"Relation Graph"** tab at the bottom of the editor to view it.

## Interactions

- **Zoom**: Use the mouse scroll wheel to zoom in or out.
- **Pan**: Hold left mouse button and drag the canvas.
- **Move Nodes**: Drag individual nodes to adjust layout.
- **View Details**: Click a node to view entity info, click an edge to see relationship description.
- **Fit View**: Use the "Fit View" button in the bottom controls to auto-zoom and show all content.

## Relationship Types

The graph uses color coding to distinguish different relationship types:

| Relation | Color | Description |
|----------|-------|-------------|
| **Kinship** | <span style="color:#ec4899">■</span> Pink | Blood relations, family ties |
| **Alliance** | <span style="color:#22c55e">■</span> Green | Alliance, cooperation |
| **Hostile** | <span style="color:#ef4444">■</span> Red | Conflict, opposition |
| **Master-Student** | <span style="color:#a855f7">■</span> Purple | Mentorship, guidance |
| **Located At** | <span style="color:#3b82f6">■</span> Blue | Geographical location |
| **Subordinate** | <span style="color:#eab308">■</span> Yellow | Subordination, employment |
| **Lovers** | <span style="color:#f43f5e">■</span> Rose | Romance, marriage |
| **Friends** | <span style="color:#14b8a6">■</span> Teal | Friendship |
| **Other** | <span style="color:#6b7280">■</span> Gray | Unclassified relationships |

## Creating Relationships

### AI Auto-Extraction
Use the "Extract Relations" button in the chapter editor toolbar. AI will identify character relationships from the text and generate structured data. Confirm to write them into the graph.

### AI Agent Operations
In Agent mode, you can tell AI directly: "Set Zhang San and Li Si as master and student," and AI will execute it automatically.

### Manual Creation
In the module editing interface's "Relations" tab, you can also add relationships manually.
            `
        },
        'dynamic-info': {
            title: 'Dynamic Info',
            body: `
## What Is Dynamic Info

In long-form novels, the states of characters and things change as the plot progresses. For example:
- A character gets seriously injured in Chapter 3
- An organization is dissolved in Chapter 8
- A magical artifact is destroyed in Chapter 12

The **Dynamic Info** system specifically tracks these changes, so both AI and you can clearly know "at a certain point in the story, what state is this entity in."

## How to View

### Module Editor — Dynamic Info Tab
Switch to the "Dynamic Info" tab in the module editing interface to see all state change records for that entity, arranged in a timeline.

### State History Panel
In the "State History" tab at the bottom of the editor, you can view a global overview of all state changes.

## Record Contents

Each dynamic info entry includes:
- **Change Description**: What happened (e.g., "Left arm injured")
- **Associated Chapter**: Which chapter it happened in
- **Affected Field**: Which attribute changed

## Creation Methods

### AI Auto-Extraction
Use the "Extract Dynamic Info" tool in the chapter editor. AI will analyze the text, automatically identify entity state changes, and generate records.

### AI Agent Operations
In Agent mode, tell AI: "Record that Zhang San lost his inner power in this chapter," and AI will automatically create the dynamic info.

### Manual Addition
Manually add records in the module's "Dynamic Info" tab.

## Significance for AI Writing

Dynamic Info is a crucial part of AI context awareness. When AI writes subsequent chapters, it reads the latest state of relevant characters, avoiding logical contradictions like "a character who was injured suddenly appears perfectly fine."
            `
        },
        'plot-management': {
            title: 'Plot Management',
            body: `
Qritor provides professional **plot management** tools to help you control the rhythm and structure of your story from a macro perspective.

## Core Features

### Storyline Management
Break complex plots into multiple storylines (main plot, romance arc, subplots, etc.) and manage each one separately.

### Plot Event Tracking
Mark key plot events for each chapter, distinguish event types (turning points, climaxes, foreshadowing, etc.), and establish two-way links between events and chapters.

### Foreshadowing System
Create and track foreshadowing to ensure every seed you plant is properly resolved in later chapters.

## How to Access

- In the tab bar at the bottom of the editor, click **"Plot History"** to open the plot management panel.
- In the chapter editor toolbar, click **"Plot Organization"** to view events associated with the current chapter.
            `
        },
        storylines: {
            title: 'Storylines & Events',
            body: `
## Storyline Management

### What Are Storylines
Storylines are macro-level divisions of your novel's plot. A long novel typically contains multiple parallel or intertwined storylines, such as:
- **Main Plot**: Core conflict progression
- **Romance Arc**: Emotional development between characters
- **Subplots**: Side stories, supporting character arcs

### Operations
- **Create Storyline**: Click "New Storyline" in the plot management panel.
- **Edit Storyline**: Modify name or description.
- **Delete Storyline**: Remove storylines no longer needed (events under them are not deleted).

## Plot Events

### What Are Plot Events
Plot events are key nodes in the story. Each event is linked to a specific chapter and belongs to a storyline.

### Event Types

| Type | Description | Use Cases |
|------|-------------|-----------|
| **Normal** | Regular plot progression | Daily scenes, transitional passages |
| **Turning Point** | Major change in plot direction | Betrayal, unexpected discovery, identity reveal |
| **Climax** | Peak tension of the story | Final battle, ultimate confrontation, emotional explosion |
| **Resolution** | Closure of a storyline thread | Mystery solved, conflict resolved |
| **Foreshadowing** | Seeds planted for future developments | Hints, omens, seemingly unrelated details |

### Creating Events
1. Click "New Event" in the plot management panel.
2. Select the event type and storyline.
3. Link it to the corresponding chapter.
4. Fill in the event description.

You can also create events directly from the "Plot Organization" tool in the chapter editor.

## Filtering & Viewing

- **Filter by Storyline**: Show only events for a specific storyline.
- **Filter by Chapter**: Show only events for a specific chapter.
- **Foreshadowing Only**: Filter to show only foreshadowing events for quick status checks.
            `
        },
        foreshadowing: {
            title: 'Foreshadowing',
            body: `
## What Is the Foreshadowing System

Foreshadowing is the soul of a long novel. Qritor provides dedicated foreshadowing management tools to help you track every seed you plant, ensuring nothing is forgotten.

## Foreshadowing Status

Each piece of foreshadowing has two states:
- **Pending**: Planted but not yet revealed.
- **Resolved**: Resolved/revealed in a later chapter.

## Creating Foreshadowing

### Method 1: Mark When Creating Plot Events
When creating a plot event, select "Foreshadowing" as the event type. The system will automatically add it to the foreshadowing tracking list.

### Method 2: AI-Assisted Identification
In Agent mode, AI can help identify potential foreshadowing in your text or proactively create foreshadowing records.

## Resolving Foreshadowing

When a later chapter reveals a piece of foreshadowing:
1. Find the foreshadowing in the plot management panel.
2. Click the "Resolve" button.
3. Select which chapter resolved it.
4. The status changes to "Resolved."

## Foreshadowing Review

In the plot management panel, use the "Foreshadowing Only" filter to get an overview of all foreshadowing status:
- Which foreshadowing hasn't been resolved yet?
- Are there any forgotten seeds?
- Is the foreshadowing distribution reasonable?

This is especially important for serialized long novels, helping avoid the "digging holes without filling them" problem.
            `
        },
        configuration: {
            title: 'System Configuration',
            body: `
## LLM Settings
In Settings, you can configure AI model parameters:
- **API Base URL**: Custom API endpoint (OpenAI-compatible format)
- **Model Selection**: Choose the language model to use
- **Max Rounds**: Maximum number of AI tool call rounds

## Auto-Update
- **Enable/Disable**: Control whether the app auto-checks for updates
- **Check Frequency**: Set the interval for auto-checking updates

## Language Settings
Switch the interface language. Supports Simplified Chinese, Traditional Chinese, English, and more.
            `
        },
        credits: {
            title: 'Credits',
            description: 'Credits are the unified billing unit for all AI features in Qritor. Each AI model call consumes credits, with different models consuming different amounts.',
            body: `
## Deduction Rules

- The system **prioritizes consuming credits that expire soonest**.
- Credits are only deducted on **successful** AI calls. Failed requests are not charged.
- When credits run out, AI features are paused, but other editing features remain available.

## Consumption Reference

Below is a reference for credit consumption across features in typical scenarios:

### Writing Continuation (Typical Novel Writing)

| Model | Credits/Use | Free Plan Uses | Plus Plan Uses |
|-------|------------|----------------|----------------|
| Grok 4.1 Fast | 2 | ~50 | ~1,000 |
| GLM-4.7 Flash | 2 | ~50 | ~1,000 |
| DeepSeek V3.2 | 2 | ~50 | ~1,000 |
| MiniMax M2.5 | 2 | ~50 | ~1,000 |
| Kimi K2.5 | 4 | ~25 | ~500 |
| Gemini 3 Flash | 4 | ~25 | ~500 |
| GLM-5 | 6 | ~16 | ~333 |
| Claude Sonnet 4.5 | 21 | ~4 | ~95 |
| Claude Opus 4.6 | 35 | ~2 | ~57 |

### Short Conversations

In short conversation scenarios, most models consume only **1 credit** per use, while flagship models consume 5-8 credits.

### Image Generation

- **Standard models**: ~9 credits for 1024x1024
- **Advanced models**: ~16 credits for 1024x1024
- **Premium models**: ~27 credits for 1024x1024

### Video Generation

- **Standard models**: ~100 credits for 5 seconds
- **Advanced models**: ~200 credits for 5 seconds
- **Premium models**: ~400 credits for 5 seconds

## Usage Tracking

Sign in to the Qritor website, go to **Profile > Billing**, to view your credit balance and transaction history, including the model, token usage, and credits deducted for each call.

## Credit Types

- **Subscription Credits**: Issued monthly with your plan, reset at the end of each cycle.
- **Referral Credits**: Earned by inviting friends, valid for 30 days.
- **Credit Packs**: Standalone credit top-ups, valid for 30 days (coming soon).

## Running Out of Credits?

- **Upgrade your plan**: Switch to a higher subscription tier for more monthly credits.
- **Invite friends**: Referrer gets 50 credits, invitee gets 30 credits.
- **Credit packs**: Standalone credit packs will be available soon.
            `,
            quickLinks: [
                { title: 'Plans', description: 'Choose the plan that fits you', path: '/docs/en/pricing/plans', icon: 'arrow' },
                { title: 'Billing', description: 'Learn about payments and invoices', path: '/docs/en/pricing/billing', icon: 'arrow' }
            ]
        },
        'pricing-plans': {
            title: 'Plans',
            description: 'Choose the subscription plan that fits your creative needs. All plans include the full modular editor and AI-assisted writing features.',
            body: `
## Plan Comparison

| Plan | Price | Monthly Credits | Projects | Model Access |
|------|-------|----------------|----------|-------------|
| **Free** | $0/mo | 100 | 1 | Economy models |
| **Plus** | $20/mo | 2,000 | 5 | Economy + Standard |
| **Pro** | $60/mo | 6,000 | 20 | All models |
| **Max** | $200/mo | 20,000 | Unlimited | All models |

## Choosing a Plan

- **Free**: Try AI-assisted writing with economy models like Grok Fast and GLM Flash.
- **Plus**: For daily writing, unlocks standard models like Kimi K2.5 and Gemini Flash, with enough credits for dozens of continuations per day.
- **Pro**: For professional writers, unlocks flagship models like Claude Sonnet and Claude Opus, with generous credits.
- **Max**: For power creators and studios, unlimited projects and priority support.

## Features Included in All Plans

- Modular novel editor (chapters, character sheets, scenes, etc.)
- AI chat assistant (Agent mode + Ask mode)
- Worldbuilding management (entities, relation graph, dynamic info)
- Plot management (storylines, foreshadowing tracking)
- Editor toolbar (continue, polish, extract entities, etc.)

## Model Tiers

Qritor organizes AI models into four tiers, with different plans granting access to different tiers:

- **Economy**: Cost-effective models for daily writing. e.g., Grok Fast, GLM Flash, DeepSeek V3.
- **Standard**: Balanced performance for most scenarios. e.g., Kimi K2.5, Gemini Flash.
- **Advanced**: High-quality output. e.g., GLM-5.
- **Flagship**: Most powerful models. e.g., Claude Sonnet 4.5, Claude Opus 4.6.

## Subscription Management

- **Upgrade**: Takes effect immediately. Remaining credits from the old plan carry over.
- **Expiration**: Paid plans require manual renewal. Without renewal, you will be downgraded to Free.
- **Credit validity**: Subscription credits are valid for the current cycle (30 days) and do not roll over.
            `,
            quickLinks: [
                { title: 'Subscribe Now', description: 'Choose your plan', path: '/pricing', icon: 'arrow' },
                { title: 'Credits', description: 'Learn about credit consumption', path: '/docs/en/pricing/credits', icon: 'arrow' }
            ]
        },
        billing: {
            title: 'Billing',
            description: 'Learn about billing cycles, payment methods, order management, and refund policies in Qritor.',
            body: `
## Manage Your Plan

Sign in to the Qritor website, go to **Profile > Billing**, to view your current subscription, credit balance, and manage payment methods.

## Billing Cycle

- All paid plans use a **30-day** billing cycle.
- Paid plans do not auto-renew; manual renewal is required.
- Without renewal, you will be downgraded to the Free plan and remaining credits will expire.
- Credit packs are one-time purchases, valid for 30 days.

## Payment Methods

Currently supported payment methods:
- **Visa / Mastercard** credit or debit cards
- **WeChat Pay** (processed via Stripe)

You can save cards on the billing page for one-click payments in the future.

## Orders & Invoices

View all order history on the billing page:

### Order Types
- **Purchase**: First-time subscription to a paid plan
- **Renewal**: Renewing your current plan

### Order Status
- **Pending**: Order created, awaiting payment (valid for 30 minutes)
- **Paid**: Payment completed, subscription activated
- **Cancelled**: Cancelled by user
- **Expired**: Not paid within 30 minutes

## Referral Rewards

Invite friends to sign up for Qritor using your referral code, and both of you earn credit rewards:
- **Referrer**: 50 credits (valid for 30 days)
- **Invitee**: 30 credits (valid for 30 days)

Get your referral code from the referral page in your profile.

## FAQ

### What if my payment fails?
Check your card balance and expiration date, or try a different payment method. If the issue persists, contact support.

### Can I get a refund?
Refund requests must be submitted within 24 hours of payment, with no credits used. Please submit your request via the Contact Us page.

### What happens to my old credits when I upgrade?
When you upgrade, remaining credits from your old plan are automatically carried over to your new plan.
            `,
            quickLinks: [
                { title: 'Plans', description: 'View all plans', path: '/docs/en/pricing/plans', icon: 'arrow' },
                { title: 'Contact Us', description: 'Get payment help', path: '/docs/en/support/contact', icon: 'arrow' }
            ]
        },
        'download-guide': {
            breadcrumb: 'Support',
            title: 'Download & Install Guide',
            description: 'This guide will help you download and install the Qritor desktop client, including detailed system requirements and installation steps.',
            body: `
## System Requirements

### macOS
- macOS 10.15 (Catalina) or later
- Apple Silicon (M1/M2/M3) or Intel processor
- At least 4GB RAM
- 500MB available disk space

### Windows
- Windows 10 (64-bit) or later
- At least 4GB RAM
- 500MB available disk space

## Download

Visit the [Download Page](/download) to get the latest version of Qritor desktop client.

The page will automatically detect your operating system and recommend the best version.

---

## macOS Installation Guide

### Step 1: Choose the Right Version

- **Apple Silicon (M1/M2/M3 chip)** → Download **arm64** version
- **Intel chip** → Download **x64** version

Not sure about your chip type? Click Apple menu → "About This Mac" to check.

### Step 2: Install the App

1. Double-click the downloaded \`.dmg\` file to open the disk image
2. Drag the **Qritor icon** to the **Applications folder**
3. Wait for the copy to complete

### Step 3: First Launch

1. Open "Finder" → "Applications" folder
2. Double-click **Qritor** to launch
3. The app is Apple notarized and will run directly

---

## Windows Installation Guide

### Important: About Security Warnings

Since Qritor is newly released software, Windows and browsers will display security warnings. **This is normal** and doesn't mean there's anything wrong with the software.

### Step 1: Download the Installer

After clicking download, your browser may show a warning:

![Browser download warning](/images/docs/win-download-warning-3.png)

**Solution:** Click the **"..."** button, then select **"Keep"**

![Select Keep file](/images/docs/win-download-warning-2.png)

### Step 2: Handle SmartScreen Warning

When opening the installer, you may see a SmartScreen warning:

![SmartScreen warning](/images/docs/win-download-warning-1.png)

**Solution:** Click **"..."** → **"Keep anyway"**

### Step 3: Complete Installation

1. Choose installation location (keep default recommended)
2. Choose whether to create desktop shortcut
3. Click "Install" and wait
4. Check "Run Qritor" and click "Finish"

---

## Auto Update

Qritor supports automatic updates. When a new version is released, the app will prompt you to update.

## Data Security

- **Local Storage**: All creative data is stored on your local device
- **Privacy**: We don't collect your creative content

## Get Help

- Check the [FAQ](/docs/en/support/faq)
- [Contact Us](/docs/en/support/contact) for support
            `,
            quickLinks: []
        }
    },
}

// UI 文本翻译
export const docsUI: Record<string, DocsUITexts> = {
    zh: {
        search: '搜索...',
        searchShortcut: '⌘K',
        guide: '指南',
        plugins: '插件',
        cli: 'CLI',
        website: '网站',
        forum: '论坛',
        blog: '博客',
        askQuestion: '提出问题...'
    },
    en: {
        search: 'Search...',
        searchShortcut: '⌘K',
        guide: 'Guide',
        plugins: 'Plugins',
        cli: 'CLI',
        website: 'Website',
        forum: 'Forum',
        blog: 'Blog',
        askQuestion: 'Ask a question...'
    },
}

