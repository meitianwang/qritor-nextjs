import type { DocsContentEntry } from '../types'

// ============== 快速入门 ==============

export const zhQuickStartContent: Record<string, DocsContentEntry> = {
    overview: {
        breadcrumb: '快速入门',
        title: '产品概述',
        description: 'Qritor（/kriːtər/）是一款面向真实小说创作的 Agentic 写作平台。通过增强上下文工程与智能体无缝结合，全面理解你的作品世界观，并以系统化方式推进创作任务。',
        body: `
它提供模块化世界构建、AI 协同写作、关系图谱可视化、剧情管理等能力，构思更深入、创作更高效、叙事更精彩，为创作者带来专业、流畅的写作体验。

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

右侧 AI 助手是你的全程创作搭档，支持 **Agent 模式**（可直接操作模块和内容）和 **问答模式**（仅对话），覆盖从世界观构建到正文写作的全流程。

### 世界观构建

通过自然语言指令，AI 可以帮你创建和完善角色、场景、组织、道具等模块。例如输入"创建一个亦正亦邪的剑修角色"，AI 会根据模块 Schema 生成结构化内容，经你确认后写入。你也可以随时要求 AI 修改已有模块的属性。

### 章节创作

选择章节节点后进入文本编辑器。你可以直接写作，也可以让 AI 协助：
- **AI 续写**：AI 根据大纲、参与实体和上下文生成整段或整章内容，实时流式输出，确认后写入。
- **AI 润色**：选中文本后，AI 优化措辞和表达。
- **AI 修改**：AI 定位到指定段落进行替换或插入，编辑器会显示差异对比供你审阅。

### 信息提取与维护

写完章节后，使用编辑器工具栏的自动化工具，让 AI 持续维护作品的结构化数据：
- **提取实体**：自动识别章节中出场的角色、场景、道具，更新参与实体列表。
- **提取关系**：分析文中的人物互动，自动创建或更新关系图谱中的关系节点。
- **提取动态信息**：捕捉角色在章节中的状态变化（情绪、伤势、能力提升等），更新动态档案。
- **剧情整理**：梳理章节中的剧情事件，更新故事线和剧情进度。

### 质量评估

- **质量评估**：AI 从多个维度评估章节写作质量，给出改进建议。
- **文风检测**：检测文风一致性，发现与整体风格不符的段落。
- **剧情分析**：分析剧情结构的合理性，发现潜在的逻辑漏洞。

### 伏笔管理

AI 可以帮你埋设和追踪伏笔。你可以随时提问"目前有哪些未回收的伏笔？"，AI 会基于全文内容回答，确保叙事线索不遗漏。
        `,
        quickLinks: []
    },
}

export const enQuickStartContent: Record<string, DocsContentEntry> = {
    overview: {
        breadcrumb: 'Quick Start',
        title: 'Product Overview',
        description: 'Qritor (/kriːtər/) is an Agentic writing platform built for real novel creation. By seamlessly combining enhanced context engineering with intelligent agents, it fully understands your story world and drives creative tasks in a systematic way.',
        body: `
It provides modular worldbuilding, AI collaborative writing, relationship graph visualization, plot management, and more — enabling deeper thinking, more efficient creation, and richer storytelling for a professional, fluid writing experience.

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

## Initialize Your Novel

After creating a novel, type **/novel-initialization** in the AI Assistant to start the setting initialization process.

The AI will automatically read your chosen creation method and novel information, iterate through all setting modules (worldview, power system, story hooks, etc.), load specialized generation skills for each module, and fill in structured content. The entire process requires no manual input — each module is presented via a confirmation dialog for your review.

Once complete, you will have a full worldbuilding foundation to further refine and customize.

## Human-AI Collaborative Writing

The AI Assistant on the right is your full-cycle creative partner. It supports **Agent mode** (can directly manipulate modules and content) and **Ask mode** (conversation only), covering everything from worldbuilding to prose writing.

### Worldbuilding

Using natural language commands, the AI can create and refine characters, scenes, organizations, props, and other modules. For example, type "Create a morally ambiguous sword cultivator character" and the AI will generate structured content based on the module Schema for your confirmation. You can also ask the AI to modify existing module attributes at any time.

### Chapter Writing

Select a chapter node to enter the text editor. Write directly or let the AI assist:
- **AI Continue**: The AI generates paragraphs or entire chapters based on outlines, participating entities, and context, streaming in real-time for your confirmation.
- **AI Polish**: Select text and let the AI refine the wording and expression.
- **AI Modify**: The AI locates specific passages for replacement or insertion, with a diff preview in the editor for your review.

### Information Extraction & Maintenance

After writing a chapter, use the editor toolbar's automated tools to let the AI continuously maintain your novel's structured data:
- **Extract Entities**: Automatically identify characters, scenes, and props that appear in the chapter, updating the participating entities list.
- **Extract Relations**: Analyze character interactions in the text, automatically creating or updating relationship nodes in the relation graph.
- **Extract Dynamic Info**: Capture character state changes within the chapter (emotions, injuries, power-ups, etc.), updating dynamic profiles.
- **Plot Organization**: Organize plot events from the chapter, updating storylines and plot progression.

### Quality Assessment

- **Quality Check**: The AI evaluates chapter writing quality across multiple dimensions and provides improvement suggestions.
- **Style Check**: Detects writing style consistency and flags passages that deviate from the overall tone.
- **Plot Analysis**: Analyzes plot structure for logical soundness and identifies potential plot holes.

### Foreshadowing Management

The AI can help you plant and track foreshadowing. Ask anytime — "What unresolved foreshadowing is there?" — and the AI will answer based on the full text, ensuring no narrative threads are lost.
        `,
        quickLinks: []
    },
}
