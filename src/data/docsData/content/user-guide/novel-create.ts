import type { DocsContentEntry } from "../../types";

export const zhNovelCreate: DocsContentEntry = {
    title: "创建小说",
    description:
      "从零开始创建您的第一部作品——选择创作方法、填写基本信息，即刻进入编辑器开始创作。",
    body: `
## 小说列表

打开 Qritor 桌面客户端后，侧边栏点击 **「小说」** 即可进入小说列表页面。这里以卡片形式展示您的所有作品，每张卡片显示作品名称、简介和当前字数。

- **搜索**：顶部搜索栏支持按名称或简介实时筛选
- **进入编辑**：点击任意作品卡片，直接进入编辑器

## 新建小说

点击页面右上角的 **「新建小说」** 按钮，弹出创建窗口。

### 填写信息

| 字段 | 说明 |
|------|------|
| **作品名称** | 必填。输入您的作品标题 |
| **创作方法** | 必填。从下拉列表中选择一个创作方法。这是最关键的一步——它决定了作品的模块结构、字段设计和可用的 AI 技能。详见 [创作方法](/docs/zh/user-guide/creation/creation-methods) |
| **简介** | 选填。简要描述作品的题材、主角、核心冲突等。AI 助手在创作时会参考简介来理解您的创作意图，填写后能获得更贴合需求的 AI 辅助 |

填写完成后点击 **「确认」**，小说即创建成功，卡片会立即出现在列表中。

### 创建后会发生什么

创建小说后，系统会根据您选择的创作方法自动完成以下初始化：

1. **生成模块分组**：左侧模块树自动按创作方法配置生成分组（如设定、角色库、场景库、道具库、章节等）
2. **创建初始模块**：部分创作方法预设了"单例模块"（如修炼体系、世界观设定），这些模块会自动创建，您可以直接开始填写
3. **加载 AI 技能**：该创作方法专属的 AI 技能自动就绪，在 AI 助手中输入 \`/\` 即可查看和使用

## 管理作品

### 删除作品

将鼠标悬停在作品卡片上，点击右侧出现的 **删除图标**。系统会弹出确认窗口，确认后作品将被永久删除，**此操作不可恢复**。

### 修改名称和简介

进入编辑器后，您可以通过 AI 助手修改作品名称和简介。在 Agent 模式下告诉 AI："把小说名改成《xxx》" 或 "更新一下简介"，AI 会帮您完成修改。

## 开始创作

点击作品卡片进入编辑器后，推荐按以下顺序开始创作：

1. **完善设定**：先填充设定分组下的模块（世界观、力量体系等），为后续创作打好基础。可以使用 \`/novel-initialization\` 技能让 AI 批量填充
2. **构建角色和场景**：在角色库、场景库中创建主要人物和关键场景
3. **规划剧情**：利用剧情管理工具设计故事线和关键事件
4. **开始写作**：在章节分组中创建章节，开始正文创作

当然，这只是建议——您完全可以按自己的习惯来，比如直接从写第一章开始，边写边补设定。
        `,
  };

export const enNovelCreate: DocsContentEntry = {
    title: "Create Novel",
    description:
      "Create your first work from scratch — choose a Creation Method, fill in basic info, and jump straight into the editor.",
    body: `
## Novel List

After opening the Qritor desktop app, click **"Novels"** in the sidebar to open the novel list page. All your works are displayed as cards, each showing the title, description, and current word count.

- **Search**: The top search bar lets you filter by name or description in real time
- **Open Editor**: Click any work card to enter the editor directly

## Create a New Novel

Click the **"New Novel"** button at the top right of the page to open the creation dialog.

### Fill in the Details

| Field | Description |
|-------|-------------|
| **Novel Name** | Required. Enter the title of your work |
| **Creation Method** | Required. Select a Creation Method from the dropdown. This is the most important step — it determines your work's module structure, field design, and available AI skills. See [Creation Methods](/docs/en/user-guide/creation/creation-methods) for details |
| **Description** | Optional. Briefly describe the genre, protagonist, core conflict, etc. The AI assistant references this description to understand your creative intent, so filling it in leads to more relevant AI assistance |

Click **"Confirm"** when done. Your novel is created instantly and appears in the list.

### What Happens After Creation

After creating a novel, the system automatically sets up the following based on your chosen Creation Method:

1. **Module Groups Generated**: The left-side module tree is populated with groups configured by the method (e.g., Settings, Characters, Scenes, Props, Chapters, etc.)
2. **Initial Modules Created**: Some methods include "singleton modules" (like cultivation systems or world settings) that are auto-created — you can start filling them in right away
3. **AI Skills Loaded**: The method's exclusive AI skills are ready to use — type \`/\` in the AI assistant to browse them

## Managing Works

### Delete a Work

Hover over a work card and click the **delete icon** that appears. A confirmation dialog will pop up — once confirmed, the work is permanently deleted and **cannot be recovered**.

### Edit Name and Description

Inside the editor, you can modify the novel's name and description through the AI assistant. In Agent mode, just tell the AI: "Rename my novel to XXX" or "Update the description", and it will handle the rest.

## Getting Started

After clicking a work card to enter the editor, here's a recommended workflow:

1. **Flesh Out Settings**: Start with the modules under the Settings group (world-building, power systems, etc.) to lay the foundation. You can use the \`/novel-initialization\` skill to have AI batch-fill these
2. **Build Characters and Scenes**: Create your main characters and key locations in the Characters and Scenes groups
3. **Plan the Plot**: Use the plot management tools to design storylines and key events
4. **Start Writing**: Create chapters in the Chapters group and begin your story

Of course, this is just a suggestion — feel free to follow your own process, like diving straight into Chapter 1 and filling in the settings as you go.
        `,
  };
