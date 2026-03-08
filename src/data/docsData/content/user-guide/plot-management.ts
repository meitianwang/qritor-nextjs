import type { DocsContentEntry } from "../../types";

export const zhPlotManagement: DocsContentEntry = {
  title: "剧情管理",
  description:
    "用故事线、剧情事件和伏笔系统从宏观层面把控故事的节奏和结构，支持手动管理和 AI 自动提取。",
  body: `
## 概述

写长篇小说最怕的就是"写着写着就乱了"——剧情线索纠缠不清、伏笔埋了就忘、节奏忽快忽慢。Qritor 的剧情管理工具帮您从宏观层面掌控全局，把复杂的故事拆解为清晰的结构。

![剧情管理](/images/features/plot_engine.png)

剧情管理围绕三个核心概念：

- **故事线**：把剧情拆分为多条并行的线索（主线、感情线、副线等）
- **剧情事件**：标记每一章的关键节点（转折、高潮、伏笔等）
- **伏笔追踪**：确保埋下的每一个伏笔都能被妥善回收

## 打开方式

在编辑器底部 Tab 栏中，点击 **「剧情管理」** 即可进入剧情管理面板，查看整部作品的所有故事线和剧情事件。

面板支持按章节筛选——在顶部选择具体章节后，面板只显示与该章节关联的事件，方便您聚焦当前正在编辑的部分。

此外，选中章节时右侧 AI 助手工具栏中会出现 **「剧情整理」** 按钮，用于让 AI 分析当前章节并自动提取剧情事件（详见下文"AI 自动提取事件"）。

## 故事线

故事线是对小说剧情的宏观划分。一部长篇小说通常包含多条并行或交织的故事线，例如：

- **主线**：核心冲突的推进
- **感情线**：角色间的情感发展
- **副线**：支线剧情、配角故事

创建小说后，系统会自动创建一条 **「主线剧情」** 故事线。

### 管理故事线

在剧情管理面板顶部，您可以通过故事线下拉菜单进行操作：

- **切换故事线**：点击下拉菜单选择要查看的故事线，面板会只显示该故事线的事件
- **新建故事线**：点击 **「+」** 按钮，输入名称和描述即可创建
- **编辑故事线**：点击编辑按钮，修改名称或描述
- **删除故事线**：点击删除按钮，故事线及其下所有事件将一并删除

## 剧情事件

剧情事件是故事中的关键节点。每个事件归属于一条故事线，可以关联到具体的章节。事件按时间线排列，形成直观的剧情脉络。

### 事件类型

| 类型 | 颜色 | 说明 | 适用场景 |
|------|------|------|---------|
| **普通事件** | 青色 | 常规剧情推进 | 日常情节、过渡段落 |
| **转折点** | 紫色 | 剧情方向发生重大变化 | 背叛、意外发现、身份揭露 |
| **高潮** | 红色 | 故事的紧张顶点 | 决战、最终对峙、情感爆发 |
| **结局** | 绿色 | 某条线索的收束 | 谜题解开、冲突化解 |
| **伏笔** | 蓝色 | 为后续发展埋下线索 | 暗示、预兆、看似无关的细节 |

### 手动创建事件

1. 在剧情管理面板中点击 **「添加事件」** 按钮
2. 输入事件名称
3. 选择事件类型（普通、转折点、高潮、结局或伏笔）
4. 选择关联章节
5. 输入事件描述（可选）
6. 点击确认

### AI 自动提取事件

这是更高效的方式——让 AI 帮您从已写好的章节中自动识别关键剧情节点：

1. 选中章节后，在右侧 AI 助手工具栏中点击 **「剧情整理」** 按钮
2. AI 分析当前章节正文，自动提取关键情节点、伏笔、冲突和转折
3. 提取结果在 AI 助手中展示，每个事件显示名称、类型、所属故事线
4. 您可以勾选要保留的事件，点击 **「应用事件」** 批量添加到剧情管理中

您也可以在 Agent 模式下直接告诉 AI："为第三章整理剧情事件"，AI 会自动完成提取和创建。

### 编辑和删除事件

鼠标悬停在事件卡片上，右侧会出现编辑和删除按钮：
- **编辑**：修改事件的名称、类型、描述、关联章节等所有属性
- **删除**：永久删除该事件（需确认）

### 筛选事件

面板提供多种筛选方式，帮您快速定位：

- **按故事线筛选**：通过顶部下拉菜单选择故事线，只显示该线的事件
- **按章节筛选**：选择具体章节，只显示该章关联的事件
- **只看伏笔**：点击 **「仅伏笔」** 按钮，只显示未回收的伏笔，快速检查哪些坑还没填

## 伏笔追踪

伏笔是长篇小说的灵魂，也是最容易遗忘的东西。Qritor 将伏笔作为一种特殊的剧情事件来追踪，确保每个埋下的种子都不会被遗忘。

### 伏笔状态

每个伏笔有三种状态：

| 状态 | 说明 |
|------|------|
| **已埋设** | 伏笔已在某章设置，等待后续揭示 |
| **已揭示** | 伏笔已在后续章节中被回收，需记录揭示章节 |
| **已弃用** | 伏笔被放弃，不再计划回收 |

### 创建伏笔

有三种方式创建伏笔：

1. **手动创建**：添加剧情事件时，将事件类型选择为 **「伏笔」**
2. **AI 提取**：使用「剧情整理」工具，AI 会自动识别正文中的伏笔并标记
3. **AI Agent**：在 Agent 模式下告诉 AI："在这一章创建一个关于传国玉玺的伏笔"

### 回收伏笔

当后续章节揭示了某个伏笔时：

1. 在剧情管理面板中找到该伏笔事件
2. 点击编辑按钮
3. 将伏笔状态改为 **「已揭示」**
4. 选择揭示发生在哪一章
5. 保存

也可以在 Agent 模式下告诉 AI："回收 XXX 伏笔，在第 N 章揭示"。

### 伏笔检查

点击 **「仅伏笔」** 筛选按钮，可以快速检查：

- 还有多少伏笔未回收？
- 有没有遗忘很久的伏笔？
- 是否需要放弃某些不再适合的伏笔？

这对于长篇连载尤为重要——避免"挖坑不填"是读者最在意的事情之一。
        `,
};

export const enPlotManagement: DocsContentEntry = {
  title: "Plot Management",
  description:
    "Use storylines, plot events, and the foreshadowing system to control your story's rhythm and structure from a macro level, with both manual management and AI auto-extraction.",
  body: `
## Overview

The biggest fear when writing a long novel is losing track of things — tangled plot threads, forgotten foreshadowing, uneven pacing. Qritor's plot management tools help you maintain control at the macro level, breaking complex stories into clear structures.

![Plot Management](/images/features/plot_engine.png)

Plot management revolves around three core concepts:

- **Storylines**: Split your plot into multiple parallel threads (main plot, romance arc, subplots, etc.)
- **Plot Events**: Mark key moments in each chapter (turning points, climaxes, foreshadowing, etc.)
- **Foreshadowing Tracking**: Ensure every seed you plant gets properly resolved

## How to Access

Click the **"Plot Management"** tab in the tab bar at the bottom of the editor to open the plot management panel, where you can view all storylines and plot events across your entire work.

The panel supports chapter filtering — select a specific chapter at the top to show only events linked to that chapter, making it easy to focus on the section you're currently editing.

Additionally, when a chapter is selected, the AI assistant toolbar on the right displays a **"Plot Organization"** button. This button triggers AI to analyze the current chapter and automatically extract plot events (see "AI Auto-extraction" below).

## Storylines

Storylines are macro-level divisions of your novel's plot. A long novel typically contains multiple parallel or intertwined storylines, such as:

- **Main Plot**: Core conflict progression
- **Romance Arc**: Emotional development between characters
- **Subplots**: Side stories, supporting character arcs

After creating a novel, the system automatically creates a **"Main Plot"** storyline.

### Managing Storylines

At the top of the plot management panel, you can use the storyline dropdown to:

- **Switch Storylines**: Select a storyline from the dropdown to filter events by that thread
- **Create Storyline**: Click the **"+"** button, enter a name and description
- **Edit Storyline**: Click the edit button to modify the name or description
- **Delete Storyline**: Click the delete button — the storyline and all its events will be permanently removed

## Plot Events

Plot events are key nodes in your story. Each event belongs to a storyline and can be linked to a specific chapter. Events are displayed in a timeline, forming a visual plot progression.

### Event Types

| Type | Color | Description | Use Cases |
|------|-------|-------------|-----------|
| **Normal** | Teal | Regular plot progression | Daily scenes, transitional passages |
| **Turning Point** | Purple | Major change in plot direction | Betrayal, unexpected discovery, identity reveal |
| **Climax** | Red | Peak tension of the story | Final battle, ultimate confrontation, emotional explosion |
| **Resolution** | Green | Closure of a storyline thread | Mystery solved, conflict resolved |
| **Foreshadowing** | Blue | Seeds planted for future developments | Hints, omens, seemingly unrelated details |

### Creating Events Manually

1. Click the **"Add Event"** button in the plot management panel
2. Enter an event name
3. Select the event type (Normal, Turning Point, Climax, Resolution, or Foreshadowing)
4. Select the linked chapter
5. Enter an event description (optional)
6. Click confirm

### AI Auto-extraction

This is the more efficient approach — let AI automatically identify key plot points from your written chapters:

1. Select a chapter, then click the **"Plot Organization"** button in the AI assistant toolbar
2. AI analyzes the current chapter text, automatically extracting key plot points, foreshadowing, conflicts, and turning points
3. Extracted results are displayed in the AI assistant, showing each event's name, type, and storyline
4. Check the events you want to keep, then click **"Apply Events"** to batch-add them to plot management

You can also tell AI in Agent mode: "Organize the plot events for Chapter 3", and it will handle the extraction and creation automatically.

### Editing and Deleting Events

Hover over an event card to reveal edit and delete buttons on the right:
- **Edit**: Modify the event's name, type, description, linked chapter, and all other properties
- **Delete**: Permanently remove the event (confirmation required)

### Filtering Events

The panel provides multiple filtering options for quick navigation:

- **By Storyline**: Use the top dropdown to select a storyline and show only its events
- **By Chapter**: Select a specific chapter to show only its linked events
- **Foreshadowing Only**: Click the **"Foreshadowing Only"** button to show only unresolved foreshadowing — quickly check which seeds haven't been addressed

## Foreshadowing Tracking

Foreshadowing is the soul of a long novel — and the easiest thing to forget. Qritor tracks foreshadowing as a special type of plot event, ensuring every seed you plant is never lost.

### Foreshadowing Status

Each piece of foreshadowing has three states:

| Status | Description |
|--------|-------------|
| **Planted** | Foreshadowing has been set up in a chapter, awaiting future revelation |
| **Resolved** | Foreshadowing has been revealed in a later chapter — the resolution chapter is recorded |
| **Abandoned** | Foreshadowing has been dropped and is no longer planned for resolution |

### Creating Foreshadowing

Three ways to create foreshadowing:

1. **Manual**: When adding a plot event, select **"Foreshadowing"** as the event type
2. **AI Extraction**: Use the "Plot Organization" tool — AI will automatically identify foreshadowing in the text
3. **AI Agent**: In Agent mode, tell AI: "Create a foreshadowing about the Imperial Seal in this chapter"

### Resolving Foreshadowing

When a later chapter reveals a piece of foreshadowing:

1. Find the foreshadowing event in the plot management panel
2. Click the edit button
3. Change the status to **"Resolved"**
4. Select which chapter the revelation occurs in
5. Save

You can also tell AI in Agent mode: "Resolve the XXX foreshadowing — it's revealed in Chapter N."

### Foreshadowing Review

Click the **"Foreshadowing Only"** filter button to quickly check:

- How many foreshadowing seeds are still unresolved?
- Are there any long-forgotten seeds?
- Should any outdated foreshadowing be abandoned?

This is especially critical for serialized long novels — avoiding "digging holes without filling them" is one of the things readers care about most.
        `,
};
