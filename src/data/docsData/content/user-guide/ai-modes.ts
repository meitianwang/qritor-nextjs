import type { DocsContentEntry } from "../../types";

export const zhAiModes: DocsContentEntry = {
    title: "AI 模式",
    description:
      "Qritor 的 AI 助手提供 Agent（智能体）和 Ask（问答）两种工作模式，分别适用于需要 AI 动手执行和纯粹讨论咨询的场景。",
    body: `
## 概述

Qritor 的 AI 助手提供两种工作模式，核心区别在于 **AI 是否有权限修改您的作品内容**：

| | Agent 模式（智能体） | Ask 模式（问答） |
|---|---|---|
| **定位** | AI 创作助手 | AI 咨询顾问 |
| **能否修改作品** | 可以读写所有内容 | 只能查看，不能修改 |
| **适用场景** | 需要 AI 帮您动手操作 | 只想讨论、不想让 AI 改东西 |
| **默认** | 默认开启 | 需手动切换 |

## Agent 模式（智能体）

Agent 模式是 **默认模式**，也是 Qritor 最核心的能力。在这个模式下，AI 不仅可以回答问题，还能**直接操作您的作品**——创建角色、修改章节、管理剧情，就像一个随叫随到的创作搭档。

### AI 能做什么

| 能力 | 说明 | 示例指令 |
|------|------|---------|
| **写作** | 续写章节、改写段落、从零生成整章 | "帮我续写第三章"、"把这段对话改得更紧张" |
| **章节管理** | 创建、重命名、删除章节 | "创建第四章，标题叫'暗流涌动'" |
| **角色/场景/道具** | 创建、编辑、删除各类模块 | "创建一个亦正亦邪的剑修角色" |
| **关系管理** | 建立、修改实体间的关系 | "把张三和李四设为师徒关系" |
| **剧情管理** | 创建剧情事件、管理故事线和伏笔 | "在第五章标记一个转折点事件" |
| **动态信息** | 记录实体的状态变化 | "记录一下主角在这章觉醒了血脉" |
| **设定填充** | 批量生成和填写设定模块 | "帮我填充修炼体系的设定" |
| **搜索查询** | 全文搜索、查看任意内容 | "找一下前面哪章提到过这把剑" |

### 技能系统

Agent 模式支持完整的 **技能系统**。输入 \`/\` 可以触发专属技能，AI 会按照技能定义的流程自动执行复杂任务。

例如：
- \`/novel-initialization\` — 自动遍历所有设定模块并批量填充
- \`/character-operations 创建一个反派\` — 按角色模块的字段结构生成完整角色

详见 [技能](/docs/zh/user-guide/skills) 文档。

### 什么时候用 Agent 模式

- 需要 AI 帮你 **创建内容**（角色、场景、章节等）
- 需要 AI **修改已有内容**（改写段落、调整设定）
- 需要 AI **执行复杂任务**（批量初始化、提取实体）
- 需要使用 **技能** 或 **工具栏功能**（续写、润色、提取关系等）

## Ask 模式（问答）

Ask 模式下，AI **只能查看作品内容，不能做任何修改**。它可以读取您的章节、角色、场景等所有信息来回答问题，但绝不会改动任何内容。

### AI 能做什么

| 能力 | 说明 | 示例指令 |
|------|------|---------|
| **回答问题** | 基于作品内容回答任何问题 | "主角的师父是谁？" |
| **内容分析** | 分析剧情逻辑、人物关系、节奏把控 | "分析一下前五章的剧情节奏" |
| **一致性检查** | 找出设定矛盾和逻辑漏洞 | "检查一下主角的年龄是否前后一致" |
| **创意建议** | 讨论剧情走向、头脑风暴 | "第六章该怎么发展比较好？" |
| **信息检索** | 搜索和查看作品中的内容 | "帮我找一下前面提到传国玉玺的地方" |

### AI 不能做什么

- 不能创建或删除任何模块、章节
- 不能修改任何内容（章节正文、模块字段）
- 不能建立或修改实体关系
- 不能执行写入类的技能

### 什么时候用 Ask 模式

- **头脑风暴**：想和 AI 讨论剧情走向、角色设计，但不想 AI 直接动手改
- **分析咨询**：让 AI 审视作品、指出逻辑漏洞或提出改进建议
- **灵感探索**：自由对话聊创意，不用担心 AI 误操作改了您的内容
- **安全浏览**：只是想让 AI 帮您查找作品中的信息

## 如何切换

在 AI 助手输入框上方，点击模式切换按钮即可在两种模式间切换：
- **智能体**：Agent 模式，带电路图标
- **问答**：Ask 模式，带对话气泡图标

切换模式不会清除当前对话历史，您可以在对话过程中随时切换。

## 使用建议

大多数时候，保持 **Agent 模式** 即可——它涵盖了 Ask 模式的所有查询能力，同时还能帮您动手操作。

切换到 **Ask 模式** 的典型场景是：您正处于构思阶段，想和 AI 自由讨论各种可能性，但还没决定最终方案，不希望 AI 在讨论过程中就开始修改作品。等讨论出满意的方案后，切回 Agent 模式让 AI 执行即可。
        `,
  };

export const enAiModes: DocsContentEntry = {
    title: "AI Modes",
    description:
      "Qritor's AI assistant offers Agent and Ask modes — one for hands-on AI collaboration, the other for safe discussion and consultation.",
    body: `
## Overview

Qritor's AI assistant offers two working modes. The key difference is **whether the AI has permission to modify your work**:

| | Agent Mode | Ask Mode |
|---|---|---|
| **Role** | AI creative partner | AI consultant |
| **Can modify your work?** | Full read-write access | Read-only, no modifications |
| **Best for** | When you need AI to take action | When you just want to discuss |
| **Default** | Enabled by default | Manual switch required |

## Agent Mode

Agent mode is the **default mode** and the core of Qritor's AI capability. In this mode, the AI can not only answer questions but also **directly operate on your work** — creating characters, modifying chapters, managing plots — like an on-demand creative partner.

### What AI Can Do

| Capability | Description | Example Command |
|------------|-------------|-----------------|
| **Writing** | Continue chapters, rewrite paragraphs, generate full chapters from scratch | "Continue writing Chapter 3", "Make this dialogue more intense" |
| **Chapter Management** | Create, rename, delete chapters | "Create Chapter 4 titled 'Undercurrents'" |
| **Characters/Scenes/Props** | Create, edit, delete various modules | "Create an morally ambiguous sword cultivator character" |
| **Relation Management** | Establish and modify entity relationships | "Set up a master-disciple relationship between Zhang San and Li Si" |
| **Plot Management** | Create plot events, manage storylines and foreshadowing | "Mark a turning point event in Chapter 5" |
| **Dynamic Info** | Record entity state changes | "Record that the protagonist awakened their bloodline in this chapter" |
| **Setting Generation** | Batch-generate and fill setting modules | "Fill in the cultivation system settings" |
| **Search & Query** | Full-text search, view any content | "Find where this sword was mentioned earlier" |

### Skills System

Agent mode supports the full **Skills system**. Type \`/\` to trigger specialized skills — the AI will follow the skill's defined workflow to execute complex tasks automatically.

For example:
- \`/novel-initialization\` — Automatically iterate through all setting modules and batch-fill them
- \`/character-operations Create a villain\` — Generate a complete character following the module's field structure

See [Skills](/docs/en/user-guide/skills) for details.

### When to Use Agent Mode

- You need AI to **create content** (characters, scenes, chapters, etc.)
- You need AI to **modify existing content** (rewrite paragraphs, adjust settings)
- You need AI to **execute complex tasks** (batch initialization, entity extraction)
- You want to use **skills** or **toolbar features** (continue writing, polish, extract relations, etc.)

## Ask Mode

In Ask mode, the AI **can only view your work's content — it cannot make any changes**. It can read your chapters, characters, scenes, and all other information to answer questions, but it will never modify anything.

### What AI Can Do

| Capability | Description | Example Command |
|------------|-------------|-----------------|
| **Answer Questions** | Answer any question based on your work's content | "Who is the protagonist's master?" |
| **Content Analysis** | Analyze plot logic, character relationships, pacing | "Analyze the pacing of the first five chapters" |
| **Consistency Checks** | Find setting contradictions and logic holes | "Check if the protagonist's age is consistent throughout" |
| **Creative Suggestions** | Discuss plot directions, brainstorm ideas | "How should Chapter 6 develop?" |
| **Information Retrieval** | Search and browse content within your work | "Find where the Imperial Seal was mentioned" |

### What AI Cannot Do

- Cannot create or delete any modules or chapters
- Cannot modify any content (chapter text, module fields)
- Cannot establish or modify entity relationships
- Cannot execute write-type skills

### When to Use Ask Mode

- **Brainstorming**: Discussing plot directions and character design without AI jumping in to make changes
- **Analysis & Consultation**: Having AI review your work, identify logic holes, or suggest improvements
- **Inspiration Exploration**: Free-form creative conversation without worrying about accidental modifications
- **Safe Browsing**: Just want AI to help you find information within your work

## How to Switch

Above the AI assistant input box, click the mode toggle to switch between modes:
- **Agent**: Shows a circuit icon, labeled "Agent"
- **Ask**: Shows a chat bubble icon, labeled "Ask"

Switching modes does not clear your conversation history — you can switch freely at any point during a conversation.

## Tips

In most cases, just keep **Agent mode** on — it includes all the querying capabilities of Ask mode, plus the ability to take action.

The typical scenario for switching to **Ask mode** is when you're in the brainstorming phase: you want to freely discuss possibilities with AI but haven't decided on a final direction yet, and you don't want AI to start making changes during the discussion. Once you've settled on a plan, switch back to Agent mode and let AI execute.
        `,
  };
