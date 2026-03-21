import type { DocsContentEntry } from "../../types";

export const zhSkills: DocsContentEntry = {
    title: "技能",
    description:
      "技能（Skill）是 Qritor 中可复用的 AI 知识模块，让 AI 助手在特定创作场景下具备专业能力。",
    body: `
## 什么是技能

技能是一段预置的 **AI 指令集**，包含特定创作任务的流程、规则和领域知识。当技能被加载后，AI 助手会按照技能中定义的步骤执行任务，无需你逐步指导。

例如，加载 \`/setting-generation\` 技能后，AI 会自动遍历所有设定模块、加载专属生成技能、逐个填充结构化内容——整个流程由技能编排，你只需审阅确认。

![技能系统](/images/features/skill_system.png)

## 运作方式

技能系统分为三个阶段：

1. **注册**：应用启动时，从本地数据库加载所有可用技能的名称和描述，注入 AI 助手的系统提示词中。
2. **匹配**：当你的请求与某个技能的描述匹配时，AI 会自动调用该技能；你也可以通过 \`/技能名\` 手动触发。
3. **执行**：AI 获取技能的完整指令，按照指令中定义的流程调用工具、生成内容。

## 技能的来源

技能由 Qritor 团队维护，存储在云端。桌面客户端登录后会自动同步最新技能到本地。你可以在侧边栏的 **「小说创作方法」** 页面点击 **「同步」** 按钮手动更新。

技能按作用范围分为以下粒度：

| 粒度 | 说明 | 状态 |
|------|------|------|
| **全局技能** | 适用于所有项目，如章节操作、角色操作、剧情设计等 | 已上线 |
| **方法专属技能** | 绑定到特定创作方法（如「古代架空穿越」），仅在使用该方法的小说中可用 | 已上线 |
| **项目级技能** | 绑定到单个小说项目，针对该项目的特定需求定制 | 即将推出 |

## 使用方式

### 手动触发

在 AI 助手输入框中输入 \`/\` 加技能名称即可触发。输入 \`/\` 后会弹出技能选择器，支持模糊搜索。

**示例**：
- \`/setting-generation\` — 批量初始化所有设定模块
- \`/character-operations 创建一个亦正亦邪的剑修角色\` — 加载角色操作技能并执行指令

### 自动触发

AI 助手的系统提示词中包含所有可用技能的名称和描述。当你的请求与某个技能匹配时，AI 会通过 \`use_skill\` 工具自动加载对应技能，无需手动输入斜杠命令。

### 查看可用技能

输入 \`/\` 后，下拉列表会显示当前项目可用的所有技能。列表包含全局技能和当前创作方法的专属技能。

## 全局操作技能

以下技能全局可用，适用于所有项目：

| 技能 | 说明 |
|------|------|
| \`chapter-operations\` | 章节创建、续写、修改、删除等操作 |
| \`character-operations\` | 角色创建、编辑、批量管理 |
| \`scene-operations\` | 场景创建、编辑、层级管理 |
| \`prop-operations\` | 道具创建、编辑、管理 |
| \`organization-operations\` | 组织创建、编辑、成员管理 |
| \`outline-operations\` | 大纲编写和管理 |
| \`plot-design\` | 剧情结构设计与事件规划 |
| \`relationship-graph\` | 关系图谱维护与分析 |
| \`consistency-audit\` | 全文一致性审查 |

## 技能与 Agent 模式

技能在 **Agent 模式** 下运行。加载技能后，AI 助手可以调用所有可用工具（创建模块、修改内容、搜索章节等）来完成技能指令中定义的任务。

在 **Ask 模式** 下，技能仅作为知识参考，AI 不会执行任何操作。

## 常见问题

### 技能没有触发怎么办？
确保使用 Agent 模式，并检查技能名称拼写是否正确。如果手动触发，需要在消息开头输入 \`/技能名\`。

### 技能列表是空的？
请点击侧边栏「小说创作方法」页面的「同步」按钮，从云端同步最新技能。

### 技能和创作方法是什么关系？
创作方法定义了小说的模块类型和结构，技能则提供该方法下各模块的 AI 生成能力。选择创作方法后，对应的专属技能会自动可用。
        `,
  };

export const enSkills: DocsContentEntry = {
    title: "Skills",
    description:
      "Skills are reusable AI knowledge modules in Qritor that give the AI assistant specialized capabilities for specific creative tasks.",
    body: `
## What Are Skills

A skill is a pre-built set of **AI instructions** containing the workflow, rules, and domain knowledge for a specific creative task. Once loaded, the AI assistant follows the steps defined in the skill to execute the task without requiring step-by-step guidance from you.

For example, loading the \`/setting-generation\` skill causes the AI to automatically iterate through all setting modules, load specialized generation skills for each, and fill in structured content — the entire flow is orchestrated by the skill, and you only need to review and confirm.

![Skills System](/images/features/skill_system.png)

## How It Works

The skill system operates in three phases:

1. **Registration**: On startup, all available skill names and descriptions are loaded from the local database and injected into the AI assistant's system prompt.
2. **Matching**: When your request matches a skill's description, the AI automatically invokes it. You can also trigger skills manually via \`/skill-name\`.
3. **Execution**: The AI retrieves the skill's full instructions and follows the defined workflow, calling tools and generating content.

## Where Skills Come From

Skills are maintained by the Qritor team and stored in the cloud. The desktop client automatically syncs the latest skills on login. You can manually update by clicking the **"Sync"** button on the **"Novel Creation Methods"** page in the sidebar.

Skills are organized by scope:

| Scope | Description | Status |
|-------|-------------|--------|
| **Global Skills** | Available for all projects (e.g., chapter operations, character operations, plot design) | Available |
| **Method-Specific Skills** | Bound to a specific creation method (e.g., "Ancient Crossing"). Only available in novels using that method | Available |
| **Project-Level Skills** | Bound to a single novel project, customized for that project's specific needs | Coming Soon |

## How to Use

### Manual Trigger

Type \`/\` followed by the skill name in the AI assistant input box. A skill selector dropdown appears after typing \`/\`, with fuzzy search support.

**Examples**:
- \`/setting-generation\` — Batch-initialize all setting modules
- \`/character-operations Create a morally ambiguous sword cultivator\` — Load the character operations skill with your instruction

### Automatic Trigger

The AI assistant's system prompt includes all available skill names and descriptions. When your request matches a skill, the AI automatically loads it via the \`use_skill\` tool — no slash command needed.

### View Available Skills

Type \`/\` to see the dropdown list of all skills available for the current project. The list includes both global skills and method-specific skills.

## Global Operation Skills

The following skills are globally available for all projects:

| Skill | Description |
|-------|-------------|
| \`chapter-operations\` | Chapter creation, continuation, modification, deletion |
| \`character-operations\` | Character creation, editing, batch management |
| \`scene-operations\` | Scene creation, editing, hierarchy management |
| \`prop-operations\` | Prop creation, editing, management |
| \`organization-operations\` | Organization creation, editing, member management |
| \`outline-operations\` | Outline writing and management |
| \`plot-design\` | Plot structure design and event planning |
| \`relationship-graph\` | Relationship graph maintenance and analysis |
| \`consistency-audit\` | Full-text consistency review |

## Skills and Agent Mode

Skills run in **Agent mode**. Once a skill is loaded, the AI assistant can call all available tools (create modules, modify content, search chapters, etc.) to complete the tasks defined in the skill instructions.

In **Ask mode**, skills serve only as knowledge references — the AI will not execute any operations.

## FAQ

### What if a skill doesn't trigger?
Make sure you're in Agent mode and check the skill name spelling. For manual triggers, the \`/skill-name\` must be at the beginning of your message.

### The skill list is empty?
Click the "Sync" button on the "Novel Creation Methods" page in the sidebar to sync the latest skills from the cloud.

### What's the relationship between skills and creation methods?
Creation methods define the module types and structure for a novel. Skills provide the AI generation capabilities for each module type within that method. After selecting a creation method, its corresponding skills become automatically available.
        `,
  };
