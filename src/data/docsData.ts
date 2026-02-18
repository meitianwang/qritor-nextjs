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
            title: '用户指南',
            items: [
                {
                    id: 'creation',
                    title: '创作功能',
                    path: '/docs/zh/user-guide/creation',
                    children: [
                        { id: 'novel-create', title: '创建小说', path: '/docs/zh/user-guide/creation/novel-create' },
                        { id: 'chapter-edit', title: '章节编辑', path: '/docs/zh/user-guide/creation/chapter-edit' },
                        { id: 'module-tree', title: '模块树操作', path: '/docs/zh/user-guide/creation/module-tree' }
                    ]
                },
                {
                    id: 'ai-assistant',
                    title: 'AI 助手',
                    path: '/docs/zh/user-guide/ai-assistant',
                    children: [
                        { id: 'ai-mention', title: '@引用模块', path: '/docs/zh/user-guide/ai-assistant/ai-mention' },
                        { id: 'chat-history', title: '对话历史', path: '/docs/zh/user-guide/ai-assistant/chat-history' },
                        { id: 'smart-write', title: '智能写作工具', path: '/docs/zh/user-guide/ai-assistant/smart-write' }
                    ]
                },
                {
                    id: 'workflow',
                    title: '工作流引擎',
                    path: '/docs/zh/user-guide/workflow',
                    children: [
                        { id: 'workflow-actions', title: '内置动作详解', path: '/docs/zh/user-guide/workflow/workflow-actions' }
                    ]
                },
                {
                    id: 'knowledge-base',
                    title: '知识库',
                    path: '/docs/zh/user-guide/knowledge-base',
                    children: [
                        { id: 'entity-types', title: '实体类型', path: '/docs/zh/user-guide/knowledge-base/entity-types' }
                    ]
                },
                {
                    id: 'configuration',
                    title: '系统配置',
                    path: '/docs/zh/user-guide/configuration'
                }
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
                { id: 'credits-pricing', title: '积分与定价', path: '/docs/zh/support/credits-pricing' },
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
            title: 'User Guide',
            items: [
                {
                    id: 'creation',
                    title: 'Creation Features',
                    path: '/docs/en/user-guide/creation',
                    children: [
                        { id: 'novel-create', title: 'Create Novel', path: '/docs/en/user-guide/creation/novel-create' },
                        { id: 'chapter-edit', title: 'Chapter Editing', path: '/docs/en/user-guide/creation/chapter-edit' },
                        { id: 'module-tree', title: 'Module Tree Operations', path: '/docs/en/user-guide/creation/module-tree' }
                    ]
                },
                {
                    id: 'ai-assistant',
                    title: 'AI Assistant',
                    path: '/docs/en/user-guide/ai-assistant',
                    children: [
                        { id: 'ai-mention', title: '@Mention Modules', path: '/docs/en/user-guide/ai-assistant/ai-mention' },
                        { id: 'chat-history', title: 'Chat History', path: '/docs/en/user-guide/ai-assistant/chat-history' },
                        { id: 'smart-write', title: 'Smart Writing Tools', path: '/docs/en/user-guide/ai-assistant/smart-write' }
                    ]
                },
                {
                    id: 'workflow',
                    title: 'Workflow Engine',
                    path: '/docs/en/user-guide/workflow',
                    children: [
                        { id: 'workflow-actions', title: 'Built-in Actions Guide', path: '/docs/en/user-guide/workflow/workflow-actions' }
                    ]
                },
                {
                    id: 'knowledge-base',
                    title: 'Knowledge Base',
                    path: '/docs/en/user-guide/knowledge-base',
                    children: [
                        { id: 'entity-types', title: 'Entity Types', path: '/docs/en/user-guide/knowledge-base/entity-types' }
                    ]
                },
                {
                    id: 'configuration',
                    title: 'System Configuration',
                    path: '/docs/en/user-guide/configuration'
                }
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
                { id: 'credits-pricing', title: 'Credits & Pricing', path: '/docs/en/support/credits-pricing' },
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
- **实时同步**：所有创作内容本地优先存储，安全可靠。

### 模块化故事引擎
打破线性写作的限制，用工程化的思维构建故事。
- **模块树管理**：通过 \`ModuleTree\` 灵活管理大纲、章节、设定集等各类内容。
- **自定义创作方法**：使用 \`MethodsPage\` 探索和应用不同的创作流派（如"英雄之旅"、"三幕式结构"），或创建属于你自己的创作方法论。

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
            breadcrumb: '快速入门',
            title: '快速开始',
            description: '本指南将引导您在几分钟内掌握 Qritor 的专业创作流程。',
            body: `
## 第一步：初始化工作区

Qritor 是一款**本地优先 (Local-First)** 的桌面应用。
- 启动应用后，您的所有数据默认存储在本地，确保绝对的安全与隐私。
- 您可以选择登录账号以启用云端同步功能，但这并不是必须的。

## 第二步：创建作品与方法论

在「小说」工作区，点击 **「新建作品」** 按钮打开创建弹窗：
1. **作品名称**：输入作品标题。
2. **创作方法** (关键步骤)：
   - 选择 **「官方预设」** (如"英雄之旅") 来快速生成结构骨架。
   - 或选择 **「自定义」** 从零开始构建。
3. **简介**：输入一句话梗概，帮助 AI 理解核心创意。

## 第三步：熟悉编辑器界⾯

进入作品后，您将看到专业的三栏布局：
- **左侧：模块树 (Module Tree)**
  管理大纲、章节、角色卡和设定集。
- **中间：核心工作区 (Tabs)**
  - **模块库 (Library)**：网格化预览所有模块。
  - **编辑器 (Editor)**：沉浸式⽂本编辑。
  - **关系图谱 (Graph)**：可视化的实体关系网。
- **右侧：AI 助手**
  默认开启，或按 \`Ctrl+K\` (Mac: \`Cmd+K\`) 唤起，进行智能对话。

## 第四步：开始创作

1. 在 **模块树** 或 **模块库** 中选择一个模块。
2. 确保中间工作区切换至 **编辑器** Tab。
3. 开始写作，或呼叫 AI 助手进行续写与润色。
            `,
            quickLinks: []
        },
        creation: {
            title: '创作功能',
            body: `
Qritor 的创作核心围绕 **"工程化写作"** 理念设计。

## 小说管理
在首页，您可以管理所有的作品。创建作品时，最重要的一步是选择 **创作方法 (Method)**。
- **预设方法**：Qritor 内置了经典的剧作结构（如英雄之旅），选择后会自动为您生成一套标准的大纲和设定集模板。
- **自定义**：针对进阶用户，您可以完全自定义模块结构。

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
## 新建作品
点击主页右上角的 "+" 号，填写基础信息。
- **名称**：作品名。
- **创作方法**：决定了作品的初始结构。选择预设方法会自动生成模块树骨架。
- **简介**：这段文字会被 RAG 引擎索引，作为 AI 理解您作品的第一步。

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

## AI 辅助
- **选中润色**：选中文本后，AI 可帮您优化措辞。
- **快捷唤起**：按 \`Ctrl+K\` (Windows) / \`Cmd+K\` (Mac) 呼出 AI 助手。
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
- 快捷键：\`Ctrl+K\` (Windows) / \`Cmd+K\` (Mac)
- 侧边栏：点击右侧的机器人图标。
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
- **触发方式**：在编辑器中选中文本或将光标放在段落末尾，点击 AI 助手的"续写"按钮。
- **效果**：AI 会根据前文语境，自动生成后续内容。

## 润色 (Polish)
- **触发方式**：选中需要润色的文本，点击"润色"按钮。
- **效果**：AI 会优化措辞、增强文采，同时保持原意。

## 扩写 (Expand)
- **触发方式**：选中简短的描述，点击"扩写"按钮。
- **效果**：AI 会将简短描述扩展为详细段落。
            `
        },
        workflow: {
            title: '工作流引擎',
            body: `
工作流引擎是 Qritor 实现 "工程化" 的幕后功臣，通过 **节点化设计** 实现创作流程的自动化。

## 核心价值
- **自动化繁琐操作**：如自动重命名章节、自动提取信息。
- **标准化创作流程**：确保每个角色卡都包含必要的属性字段。
- **保持数据一致性**：自动维护知识库，确保图谱与正文一致。

## 自动化场景
- **后置触发**：当您创建一个新模块（例如"角色卡"）时，可以自动触发一个工作流，让 AI 根据名字自动填充性格描述。
- **信息提取**：使用 \`EXTRACT_CHILD_MODULE\` 节点，可以从大段的设定文档中，自动提取出多个子条目。
- **图谱更新**：通过 \`KG_UPDATE\` 节点，AI 在分析正文后，会自动将新的人物关系写入知识库。
            `
        },
        'workflow-actions': {
            title: '内置动作详解',
            body: `
## 动作类型

### CREATE_MODULE
创建一个新模块。
- **参数**：\`moduleTypeId\`（模块类型）、\`title\`（标题）、\`content\`（内容）、\`parentId\`（父模块）
- **用途**：自动生成章节、角色卡等。

### UPDATE_MODULE
更新现有模块的内容。
- **参数**：\`moduleId\`、\`title\`、\`content\`
- **用途**：AI 分析后自动填充模块内容。

### EXTRACT_CHILD_MODULE
从源模块的某个字段提取数据，创建子模块。
- **参数**：\`sourceField\`（源字段路径）、\`targetModuleTypeName\`（目标类型名）
- **用途**：从世界观设定中自动提取人物列表。

### KG_UPDATE
更新知识图谱。
- **参数**：\`triples\`（三元组数组：主语、谓语、宾语）
- **用途**：AI 分析正文后自动构建人物关系网。

### BUILD_MODULE_TITLE
根据模板构建模块标题。
- **参数**：\`titleTemplate\`（标题模板，如 "第{chapter_number}章"）
- **用途**：自动为章节编号。
            `
        },
        'knowledge-base': {
            title: '知识库与图谱',
            body: `
知识库将您作品中的离散信息连接成网，通过**知识图谱 (Knowledge Graph)** 技术进行可视化展示。

## 关系图谱功能
切换到 **"Graph"** Tab，您可以看到可视化的实体关系网。该功能基于 \`React Flow\` 引擎构建，支持高性能渲染。

### 交互操作
- **缩放与平移**：使用鼠标滚轮缩放，按住左键拖拽画布。
- **节点拖拽**：您可以自由拖拽节点以调整布局。
- **选中高亮**：点击节点或连线，可以查看详细信息。

### 视觉系统
图谱采用了直观的颜色编码系统来区分不同类型的关系：
- <span style="color:#ef4444">■</span> **敌对关系**：红色连线，表示冲突、仇恨或对立。
- <span style="color:#22c55e">■</span> **朋友关系**：绿色连线，表示友好、同盟或支持。
- <span style="color:#3b82f6">■</span> **亲属关系**：蓝色连线，表示血缘或家族联系。
- <span style="color:#eab308">■</span> **隶属关系**：黄色连线，表示从属、雇用或统治。
- <span style="color:#6b7280">■</span> **其他关系**：灰色连线，用于未分类的连接。

## 自动维护机制
最强大的特性在于您**不需要手动绘制**这些关系。
1. **AI 提取**：当您更新设定集或正文时，AI 助手会分析文本。
2. **三元组生成**：AI 识别出 \`(主体, 谓语, 客体)\` 格式的三元组。
3. **图谱同步**：通过 \`KG_UPDATE\` 工作流动作，自动将新关系写入图谱数据库。

这种"无感维护"确保了您的知识库永远与最新的创作内容保持同步。
            `
        },
        'entity-types': {
            title: '实体类型',
            body: `
## 支持的实体类型详情
Qritor 的知识库支持多种实体类型，每种类型都有特定的属性字段。

### 角色 (Character)
- **定义**：小说中的具有能动性的人物或生物。
- **核心字段**：姓名、年龄、性别、性格特征、外貌描写、背景故事。
- **图谱表现**：圆形节点，通常是关系的中心。

### 地点 (Location)
- **定义**：故事发生的地理位置或空间。
- **核心字段**：名称、地理位置、环境描述、历史背景。
- **层级关系**：地点通常具有包含关系（如 国家 -> 城市 -> 街道）。

### 物品 (Item)
- **定义**：具有特殊意义或功能的物体。
- **核心字段**：名称、类型、功能描述、持有人。
- **关联**：物品通常通过"持有"或"位于"关系与其他实体连接。

### 势力 (Faction)
- **定义**：由多个角色组成的组织、国家、帮派等群体。
- **核心字段**：名称、宗旨、规模、主要成员。
- **复杂关系**：势力之间往往存在外交、战争或贸易关系。

## 自定义类型扩展
虽然系统预设了上述类型，但在**创作方法 (Creation Method)** 配置中，进阶用户可以：
1. **定义新类型**：例如"功法"、"魔兽"、"时间线事件"。
2. **定制字段**：为每种类型添加特有的 JSON Schema 字段定义。
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
        'credits-pricing': {
            title: '积分与定价',
            description: '了解 Qritor 的积分计费体系、订阅套餐以及各模型的积分消耗。',
            body: `
## 什么是积分？

Qritor 使用 **积分（Credits）** 作为统一的消费单位。每次调用 AI 功能（智能续写、对话、图片生成等）都会消耗一定数量的积分。不同的 AI 模型消耗的积分不同——越强大的模型，消耗越多。

## 订阅套餐

| 套餐 | 价格 | 每月积分 | 适用人群 |
|------|------|---------|---------|
| **免费版** | $0/月 | 100 | 初次体验 AI 创作 |
| **Plus** | $20/月 | 2,000 | 个人创作者的日常之选 |
| **Pro** | $60/月 | 6,000 | 专业创作者的不二之选 |
| **Max** | $200/月 | 20,000 | 为重度创作者与工作室打造 |

## AI 模型与积分消耗

Qritor 接入了多种 AI 模型，从高性价比到旗舰级任您选择。以下是典型场景下的积分消耗参考：

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

### 短对话场景（灵感助手）

短对话场景下，大多数模型每次仅消耗 **1 积分**，旗舰模型消耗 5-8 积分。

## 模型选择器中的倍率

在模型选择器中，每个模型右侧会显示一个 **倍率标签**（如 0.3x、1.0x、3.5x）。这表示该模型相对于基准模型的积分消耗比例，帮助您直观地了解不同模型的消费水平。

## 图片与视频生成

图片和视频生成使用固定积分定价：

### 图片生成

- **标准模型**：1024×1024 约 9 积分
- **高级模型**：1024×1024 约 16 积分
- **顶级模型**：1024×1024 约 27 积分

分辨率越高，消耗越多。

### 视频生成

- **标准模型**：5 秒约 100 积分
- **高级模型**：5 秒约 200 积分
- **顶级模型**：5 秒约 400 积分

时长越长，消耗越多。

## 积分用完了？

- **升级套餐**：切换到更高级的订阅计划获取更多月度积分
- **积分包**：后续将推出单独购买的积分包（敬请期待）

## 邀请奖励

邀请好友注册 Qritor，双方都能获得积分奖励：
- **邀请人**：获得 50 积分
- **受邀人**：获得 30 积分
            `,
            quickLinks: [
                { title: '查看套餐', description: '选择适合你的方案', path: '/pricing', icon: 'arrow' },
                { title: '常见问题', description: '更多疑问解答', path: '/docs/zh/support/faq', icon: 'arrow' }
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

- **本地优先**：所有创作数据默认存储在您的本地设备
- **隐私保护**：我们不会收集您的创作内容
- **云端同步**（可选）：登录账号后可开启云端备份

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
Qritor is more than just a writing tool; it is your 24/7 AI creative partner. It deeply understands your world-building, visualizes plot structures through relationship graphs, and manages complex creative tasks with modular workflows.

## Core Features

### Immersive Novel Creation
A professional writing environment built for desktop.
- **Modern Editor**: Multi-tab support to manage chapters and settings efficiently.
- **Minimalist Aesthetic**: Distraction-free immersive writing experience.
- **Real-time Sync**: Local-first storage for security and reliability.

### Modular Story Engine
Build stories with engineering thinking.
- **Module Tree**: Flexibly manage outlines, chapters, and settings.
- **Custom Methods**: Explore standard or custom creative methodologies.

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
            breadcrumb: 'Quick Start',
            title: 'Getting Started',
            description: 'This guide will walk you through Qritor’s professional creative workflow in minutes.',
            body: `
## Step 1: Initialize Workspace

Qritor is a **Local-First** desktop application.
- All data is stored locally by default for security and privacy.
- You can optionally sign in to enable cloud sync, but it is not required.

## Step 2: Create Project & Method

Click **"New Novel"** in the "Works" workspace to open the creation modal:
1. **Title**: Enter the name of your work.
2. **Creation Method** (Crucial):
   - Choose a **Preset** (e.g., "Hero's Journey") to generate a structural skeleton.
   - Or choose **Custom** to start from scratch.
3. **Logline**: A one-sentence summary to help AI understand your core idea.

## Step 3: The Editor Interface

Once inside, you will see a professional three-column layout:
- **Left: Module Tree**
  Manage chapters, outlines, and character sheets.
- **Center: Workspace Tabs**
  - **Library**: Grid view of all modules.
  - **Editor**: Immersive writing area.
  - **Graph**: Visual entity relationship network.
- **Right: AI Assistant**
  Enabled by default. Press \`Ctrl+K\` (Mac: \`Cmd+K\`) to toggle.

## Step 4: Start Writing

1. Select a module from the **Module Tree** or **Library**.
2. Switch the center tab to **Editor**.
3. Start writing, or use the AI Assistant to continue or polish your text.
            `,
            quickLinks: []
        },
        creation: {
            title: 'Creation Features',
            body: `
Qritor's core design philosophy is built around **"Engineering-based Writing"**.

## Novel Management
On the homepage, you can manage all your works. When creating a novel, the most crucial step is selecting a **Creation Method**.
- **Presets**: Qritor includes classic dramatic structures (e.g., Hero's Journey). Selecting one will automatically generate a standard outline and settings template for you.
- **Custom**: Advanced users can fully customize their module structure.

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
Click the "+" icon at the top right of the homepage and fill in basic info.
- **Name**: Title of your work.
- **Creation Method**: Determines the initial structure. Choosing a preset auto-generates the module tree skeleton.
- **Logline**: This text is indexed by the RAG engine as the first step for AI to understand your work.

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

## AI Assistance
- **Select & Polish**: Select text to have AI optimize your wording.
- **Shortcut**: Press \`Ctrl+K\` (Windows) / \`Cmd+K\` (Mac) to invoke the AI Assistant.
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
- Shortcut: \`Ctrl+K\` (Windows) / \`Cmd+K\` (Mac)
- Sidebar: Click the robot icon on the right.
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
- **Trigger**: Select text or place the cursor at the end of a paragraph in the editor, then click the "Continue" button.
- **Effect**: AI will automatically generate the next part based on the context.

## Polish
- **Trigger**: Select text that needs polishing, then click the "Polish" button.
- **Effect**: AI will optimize wording and enhance style while preserving the original meaning.

## Expand
- **Trigger**: Select a brief description, then click the "Expand" button.
- **Effect**: AI will expand the short description into a detailed paragraph.
            `
        },
        workflow: {
            title: 'Workflow Engine',
            body: `
The Workflow Engine is the power behind Qritor's "Engineering" approach. It is a node-based automation system.

## Core Value
- **Automate Tedious Tasks**: Auto-rename chapters, bulk extract info.
- **Standardize Process**: Ensure every character sheet has required fields.
- **Data Consistency**: Maintain the Knowledge Graph in sync with your text.

## Automation Scenarios
- **Post-Creation Trigger**: When you create a new module (e.g., "Character Sheet"), a workflow can automatically trigger AI to fill in personality descriptions based on the name.
- **Information Extraction**: Use the \`EXTRACT_CHILD_MODULE\` node to automatically extract multiple sub-entries from a large setting document.
- **Graph Update**: Using the \`KG_UPDATE\` node, AI analyzes text and automatically writes new character relationships into the Knowledge Base.
            `
        },
        'workflow-actions': {
            title: 'Built-in Actions Guide',
            body: `
## Action Types

### CREATE_MODULE
Creates a new module.
- **Parameters**: \`moduleTypeId\` (type), \`title\`, \`content\`, \`parentId\`
- **Use Case**: Auto-generate chapters, character sheets, etc.

### UPDATE_MODULE
Updates an existing module's content.
- **Parameters**: \`moduleId\`, \`title\`, \`content\`
- **Use Case**: AI fills in module content after analysis.

### EXTRACT_CHILD_MODULE
Extracts data from a source module's field to create child modules.
- **Parameters**: \`sourceField\` (path), \`targetModuleTypeName\`
- **Use Case**: Auto-extract character list from world-building settings.

### KG_UPDATE
Updates the Knowledge Graph.
- **Parameters**: \`triples\` (array of Subject, Predicate, Object)
- **Use Case**: AI builds character relationship network after analyzing text.

### BUILD_MODULE_TITLE
Builds module title based on a template.
- **Parameters**: \`titleTemplate\` (e.g., "Chapter {chapter_number}")
- **Use Case**: Auto-number chapters.
            `
        },
        'knowledge-base': {
            title: 'Knowledge Base & Graph',
            body: `
The Knowledge Base connects discrete information in your work into a network, visualized via **Knowledge Graph**.

## Relation Graph
Switch to the center **"Graph"** Tab to see the visual entity relationship network. Built on \`React Flow\` for high-performance rendering.

### Interactions
- **Zoom & Pan**: Mouse wheel to zoom, left-click drag to pan.
- **Drag Nodes**: Freely arrange nodes layout.
- **Inspect**: Click nodes or edges for details.

### Visual System
Color-coded relationships for intuitive understanding:
- <span style="color:#ef4444">■</span> **Hostile**: Red edges (Conflict, Hatred, Opposing).
- <span style="color:#22c55e">■</span> **Friendly**: Green edges (Ally, Support, Friendly).
- <span style="color:#3b82f6">■</span> **Kinship**: Blue edges (Blood relation, Family).
- <span style="color:#eab308">■</span> **Subordinate**: Yellow edges (Employment, Rule, Serve).
- <span style="color:#6b7280">■</span> **Other**: Gray edges (Unclassified connections).

## Auto-Maintenance
The most powerful feature is **Zero Manual Drawing**.
1. **AI Extraction**: AI reads your settings and story text.
2. **Triple Generation**: Identifies \`(Subject, Predicate, Object)\` triples.
3. **Graph Sync**: \`KG_UPDATE\` workflow action automatically writes new relations to the DB.

Your Knowledge Base stays perfectly in sync with your latest writing.
            `
        },
        'entity-types': {
            title: 'Entity Types',
            body: `
## Supported Entity Types
Qritor's Knowledge Base supports various entity types with specific schema fields.

### Character
- **Definition**: People or beings with agency in your novel.
- **Core Fields**: Name, Age, Gender, Personality, Appearance, Backstory.
- **Graph**: Circular nodes, central to the network.

### Location
- **Definition**: Geographical places or spaces.
- **Core Fields**: Name, Coordinates, Environment, History.
- **Hierarchy**: Contains relationships (e.g., Country -> City -> Street).

### Item
- **Definition**: Objects with significance or function.
- **Core Fields**: Name, Type, Description, Owner.
- **Relations**: Linked via "Ownership" or "Location".

### Faction
- **Definition**: Organizations, nations, gangs, groups.
- **Core Fields**: Name, Motto, Scale, Key Members.
- **Complex Relations**: Diplomacy, War, Trade interactons between factions.

## Custom Types
Advanced users can define new types via **Creation Method** configuration:
1. **Define Types**: e.g., "Magic Spell", "Beast", "Timeline Event".
2. **Custom Schema**: Add unique JSON fields for each type.
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
        'credits-pricing': {
            title: 'Credits & Pricing',
            description: 'Learn about Qritor\'s credit-based billing system, subscription plans, and credit consumption for each AI model.',
            body: `
## What Are Credits?

Qritor uses **Credits** as a unified billing unit. Every AI feature (smart writing, chat, image generation, etc.) consumes a certain number of credits. Different AI models consume different amounts — the more powerful the model, the more credits it uses.

## Subscription Plans

| Plan | Price | Monthly Credits | Best For |
|------|-------|----------------|----------|
| **Free** | $0/mo | 100 | First-time AI writing experience |
| **Plus** | $20/mo | 2,000 | Individual creators' daily companion |
| **Pro** | $60/mo | 6,000 | The go-to choice for professional writers |
| **Max** | $200/mo | 20,000 | Built for power creators and studios |

## AI Models & Credit Consumption

Qritor integrates multiple AI models, from cost-effective to flagship. Here's a reference for credit consumption in typical scenarios:

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

### Short Conversations (Inspiration Assistant)

In short conversation scenarios, most models consume only **1 credit** per use, while flagship models consume 5-8 credits.

## Multiplier in Model Selector

In the model selector, each model displays a **multiplier label** (e.g., 0.3x, 1.0x, 3.5x) on the right. This indicates the credit consumption ratio relative to the baseline model, helping you intuitively understand the cost level of different models.

## Image & Video Generation

Image and video generation use fixed credit pricing:

### Image Generation

- **Standard models**: ~9 credits for 1024×1024
- **Advanced models**: ~16 credits for 1024×1024
- **Premium models**: ~27 credits for 1024×1024

Higher resolution means more credits.

### Video Generation

- **Standard models**: ~100 credits for 5 seconds
- **Advanced models**: ~200 credits for 5 seconds
- **Premium models**: ~400 credits for 5 seconds

Longer duration means more credits.

## Running Out of Credits?

- **Upgrade your plan**: Switch to a higher subscription tier for more monthly credits
- **Credit packs**: Standalone credit packs will be available soon (coming soon)

## Referral Rewards

Invite friends to sign up for Qritor, and both of you get credit rewards:
- **Referrer**: 50 credits
- **Invitee**: 30 credits
            `,
            quickLinks: [
                { title: 'View Plans', description: 'Choose the plan that fits you', path: '/pricing', icon: 'arrow' },
                { title: 'FAQ', description: 'More answers to your questions', path: '/docs/en/support/faq', icon: 'arrow' }
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

- **Local-first**: All data stored locally by default
- **Privacy**: We don't collect your creative content
- **Cloud sync** (optional): Available after login

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

