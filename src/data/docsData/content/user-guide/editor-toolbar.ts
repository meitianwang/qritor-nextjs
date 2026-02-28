import type { DocsContentEntry } from "../../types";

export const zhEditorToolbar: DocsContentEntry = {
    title: "编辑器工具栏",
    description:
      "章节编辑器顶部的工具栏，提供续写、润色、大纲、参与实体管理、AI 提取和质量分析等一站式写作工具。",
    body: `
## 概述

打开一个**章节模块**后，编辑区域顶部会显示工具栏。工具栏从左到右依次包含：字号调节、章节管理工具、AI 写作与分析工具，以及右侧的实时字数统计。

所有 AI 工具的结果都会在右侧 AI 助手面板中展示，您可以在对话中查看、确认或继续讨论。

## 字号调节

工具栏最左侧的 **A-** 和 **A+** 按钮用于调节编辑器的显示字号（范围 12-24px），方便您在不同屏幕上获得舒适的阅读体验。

## 章节管理工具

### 大纲

点击 **「大纲」** 按钮（快捷键 Cmd+O / Ctrl+O），弹出章节大纲编辑窗口。

大纲用于为当前章节编写摘要或写作提纲——比如"本章主要讲述主角进入秘境，遭遇第一个考验"。大纲内容会作为 AI 理解您写作意图的重要上下文，让续写和润色更贴合您的规划。

### 参与实体

点击 **「参与实体」** 按钮（快捷键 Cmd+E / Ctrl+E），打开实体管理弹窗。

在这里您可以勾选当前章节中出场的角色、场景、组织和道具。被选中的实体信息会自动传递给 AI——这意味着 AI 在续写时能"看到"这些实体的完整设定和最新动态信息，写出的内容会更贴合人物性格、场景氛围和道具特性。

## AI 写作工具

### 写作（续写）

点击 **「写作」** 按钮（快捷键 Cmd+G / Ctrl+G），AI 会根据章节已有内容、大纲、参与实体等上下文信息，为当前章节续写正文。

- 续写过程中，按钮会变为旋转加载状态，再次点击可**停止**生成
- 生成完成后，编辑器会以分栏预览的形式展示 AI 生成的内容
- 您可以选择**采纳**将内容写入章节，或**取消**丢弃

### 润色

先在编辑器中**选中一段文本**，然后点击 **「润色」** 按钮（快捷键 Cmd+P / Ctrl+P）。

AI 会优化选中文本的措辞和文采，同时保持原意不变。润色结果以分栏对比的形式展示，您可以清楚看到修改前后的差异，确认后一键应用。

未选中文本时，润色按钮为灰色不可用状态。

## AI 提取工具

这一组工具让 AI **从已写好的章节正文中自动识别和提取结构化信息**。每个提取工具的结果都会在 AI 助手中展示，需要您确认后才会写入数据库。

### 提取实体

点击 **「提取实体」** 按钮，AI 分析章节正文，自动识别新出现的角色、场景、组织、道具等。

提取结果会显示在 AI 助手中，标注出哪些是新实体、共提取了多少个。您可以逐个选择要保留的实体，确认后一键创建到对应的模块库中，并自动更新章节的参与实体列表。

### 提取动态信息

点击 **「提取动态信息」** 按钮，AI 分析章节正文，识别各实体在本章中的状态变化——情绪波动、位置移动、能力变化、关系转变等。

提取结果按实体分组展示，每个实体显示发生变化的字段和描述。您可以选择要保留的记录，确认后写入对应实体的动态信息中。

详见 [动态信息](/docs/zh/user-guide/dynamic-info) 文档。

### 提取实体关系

点击 **「提取实体关系」** 按钮，AI 分析章节正文，识别角色之间、角色与组织之间、角色与场景之间的关系变化。

提取结果显示每条关系的双方实体、关系类型和描述，并标注哪些是新关系、哪些是已有关系的变化。您可以选择要保留的关系，确认后一键写入关系图谱。

详见 [关系图谱](/docs/zh/user-guide/relation-graph) 文档。

### 剧情整理

点击 **「剧情整理」** 按钮，AI 分析章节正文，自动提取关键情节点——伏笔、冲突、转折、高潮等，为每个情节点创建对应的剧情事件。

您可以选择要保留的事件，确认后添加到剧情管理面板中。

详见 [剧情管理](/docs/zh/user-guide/plot-management) 文档。

## 分析工具

### 文风检测

点击 **「文风检测」** 按钮（快捷键 Cmd+Y / Ctrl+Y），AI 会分析当前章节的叙事风格、用词习惯和句式特点，与小说整体的文风设定进行对比，找出不一致的地方并给出修改建议。

结果直接显示在 AI 助手对话中。

### 质量评估

点击 **「质量评估」** 按钮（快捷键 Cmd+Q / Ctrl+Q），AI 从多个维度对当前章节进行综合评估：

- **连贯性** — 情节是否通顺
- **角色一致性** — 人物言行是否符合设定
- **语言质量** — 文笔和措辞水平
- **情节推进** — 故事是否有效向前发展
- **细节质量** — 描写是否生动到位
- **情感共鸣** — 是否能打动读者

结果直接显示在 AI 助手对话中，包含评分和具体的改进建议。章节内容为空时此按钮不可用。

## 字数统计

工具栏右侧实时显示当前章节的字数。每次内容变化时自动更新。

## 快捷键一览

| 功能 | Mac | Windows |
|------|-----|---------|
| 写作（续写） | Cmd+G | Ctrl+G |
| 润色 | Cmd+P | Ctrl+P |
| 大纲 | Cmd+O | Ctrl+O |
| 参与实体 | Cmd+E | Ctrl+E |
| 文风检测 | Cmd+Y | Ctrl+Y |
| 质量评估 | Cmd+Q | Ctrl+Q |
        `,
  };

export const enEditorToolbar: DocsContentEntry = {
    title: "Editor Toolbar",
    description:
      "The toolbar at the top of the chapter editor, providing one-stop writing tools including continuation, polishing, outline, participants, AI extraction, and quality analysis.",
    body: `
## Overview

When you open a **chapter module**, a toolbar appears at the top of the editing area. From left to right, it contains: font size controls, chapter management tools, AI writing and analysis tools, and a real-time word count on the right.

All AI tool results are displayed in the AI assistant panel on the right, where you can review, confirm, or continue discussing them.

## Font Size

The **A-** and **A+** buttons on the far left adjust the editor's display font size (range 12-24px), helping you find a comfortable reading size for your screen.

## Chapter Management Tools

### Outline

Click the **"Outline"** button (shortcut: Cmd+O / Ctrl+O) to open the chapter outline editing window.

Use the outline to write a summary or plan for the current chapter — for example, "This chapter covers the protagonist entering the secret realm and facing the first trial." The outline serves as important context for AI to understand your writing intent, making continuation and polishing better aligned with your plans.

### Participants

Click the **"Participants"** button (shortcut: Cmd+E / Ctrl+E) to open the entity management modal.

Here you can select which characters, scenes, organizations, and props appear in the current chapter. Selected entity information is automatically passed to AI — this means AI can "see" these entities' complete settings and latest dynamic info when continuing the story, producing content that better matches character personalities, scene atmospheres, and prop characteristics.

## AI Writing Tools

### Write (Continue)

Click the **"Write"** button (shortcut: Cmd+G / Ctrl+G). AI will continue writing the chapter based on existing content, outline, participants, and other context.

- During generation, the button shows a spinning loader — click again to **stop** generation
- When complete, the editor shows AI-generated content in a split preview
- You can **accept** to write the content into the chapter, or **cancel** to discard it

### Polish

First **select a passage of text** in the editor, then click the **"Polish"** button (shortcut: Cmd+P / Ctrl+P).

AI will optimize the wording and style of the selected text while preserving the original meaning. Results are shown in a side-by-side comparison so you can clearly see before-and-after differences, then apply with one click.

When no text is selected, the polish button is grayed out and unavailable.

## AI Extraction Tools

These tools let AI **automatically identify and extract structured information from written chapter text**. Each extraction tool's results are displayed in the AI assistant and require your confirmation before being saved to the database.

### Extract Entities

Click the **"Extract Entities"** button. AI analyzes the chapter text and automatically identifies newly appeared characters, scenes, organizations, props, and more.

Results are displayed in the AI assistant, showing which are new entities and the total count. You can select which entities to keep, then create them in the corresponding module libraries with one click — the chapter's participant list is automatically updated too.

### Extract Dynamic Info

Click the **"Extract Dynamic Info"** button. AI analyzes the chapter text and identifies state changes for each entity in this chapter — emotional shifts, location changes, ability changes, relationship transitions, and more.

Results are grouped by entity, showing changed fields and descriptions for each. You can select which records to keep, then write them to the corresponding entity's dynamic info.

See the [Dynamic Info](/docs/en/user-guide/dynamic-info) documentation for details.

### Extract Relations

Click the **"Extract Relations"** button. AI analyzes the chapter text and identifies relationship changes between characters, between characters and organizations, and between characters and scenes.

Results show both entities, relationship type, and description for each relationship, marking which are new and which are updates to existing ones. You can select which to keep, then write them to the Relation Graph with one click.

See the [Relation Graph](/docs/en/user-guide/relation-graph) documentation for details.

### Plot Organization

Click the **"Plot Organization"** button. AI analyzes the chapter text and automatically extracts key plot points — foreshadowing, conflicts, turning points, climaxes — creating corresponding plot events for each.

You can select which events to keep, then add them to the plot management panel.

See the [Plot Management](/docs/en/user-guide/plot-management) documentation for details.

## Analysis Tools

### Style Check

Click the **"Style Check"** button (shortcut: Cmd+Y / Ctrl+Y). AI analyzes the current chapter's narrative style, word choices, and sentence patterns, comparing them against the novel's overall style settings to identify inconsistencies and provide revision suggestions.

Results are displayed directly in the AI assistant conversation.

### Quality Assessment

Click the **"Quality Assessment"** button (shortcut: Cmd+Q / Ctrl+Q). AI evaluates the current chapter across multiple dimensions:

- **Coherence** — Whether the plot flows smoothly
- **Character Consistency** — Whether characters' words and actions match their settings
- **Language Quality** — Writing and wording quality
- **Plot Progression** — Whether the story effectively moves forward
- **Detail Quality** — Whether descriptions are vivid and effective
- **Emotional Resonance** — Whether it can move the reader

Results are displayed directly in the AI assistant conversation, including scores and specific improvement suggestions. This button is unavailable when the chapter content is empty.

## Word Count

The right side of the toolbar displays the current chapter's word count in real time, updating automatically with every content change.

## Keyboard Shortcuts

| Function | Mac | Windows |
|----------|-----|---------|
| Write (Continue) | Cmd+G | Ctrl+G |
| Polish | Cmd+P | Ctrl+P |
| Outline | Cmd+O | Ctrl+O |
| Participants | Cmd+E | Ctrl+E |
| Style Check | Cmd+Y | Ctrl+Y |
| Quality Assessment | Cmd+Q | Ctrl+Q |
        `,
  };
