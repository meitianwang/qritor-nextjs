import type { DocsContentEntry } from "../../types";

export const zhEditorToolbar: DocsContentEntry = {
  title: "编辑器基础工具",
  description:
    "章节编辑器顶部的工具栏，提供字号调节、大纲管理、参与实体管理和字数统计等基础编辑功能。",
  body: `
## 概述

打开一个**章节模块**后，编辑区域顶部会显示工具栏。工具栏包含排版控制、章节管理工具，以及右侧的实时字数统计。

> **关于 AI 写作工具**：续写、润色、提取实体、剧情整理、文风检测、质量评估等 AI 功能按钮已迁移到右侧 **[AI 助手](/docs/zh/user-guide/ai-assistant)** 的输入区工具栏中。当您选中具体章节时，这些按钮会自动出现在 AI 助手的输入框上方。详见 [AI 助手 - 上下文感知工具栏](/docs/zh/user-guide/ai-assistant) 章节。

## 字号调节

工具栏左侧的 **A-** 和 **A+** 按钮用于调节编辑器的显示字号（范围 12-24px），方便您在不同屏幕上获得舒适的阅读体验。

## 章节管理工具

### 大纲

点击 **「大纲」** 按钮（快捷键 Cmd+O / Ctrl+O），弹出章节大纲编辑窗口。

大纲用于为当前章节编写摘要或写作提纲——比如"本章主要讲述主角进入秘境，遭遇第一个考验"。大纲内容会作为 AI 理解您写作意图的重要上下文，让续写和润色更贴合您的规划。

### 参与实体

点击 **「参与实体」** 按钮（快捷键 Cmd+E / Ctrl+E），打开实体管理弹窗。

在这里您可以勾选当前章节中出场的角色、场景、组织和道具。被选中的实体信息会自动传递给 AI——这意味着 AI 在续写时能"看到"这些实体的完整设定和最新动态信息，写出的内容会更贴合人物性格、场景氛围和道具特性。

## 字数统计

工具栏右侧实时显示当前章节的字数。每次内容变化时自动更新。

## 快捷键一览

### 编辑器工具栏快捷键

| 功能 | Mac | Windows |
|------|-----|---------|
| 大纲 | Cmd+O | Ctrl+O |
| 参与实体 | Cmd+E | Ctrl+E |

### AI 助手快捷键

以下快捷键触发 AI 助手工具栏中的对应功能（需先选中章节）：

| 功能 | Mac | Windows |
|------|-----|---------|
| 续写 | Cmd+G | Ctrl+G |
| 润色 | Cmd+P | Ctrl+P |
| 文风检测 | Cmd+Y | Ctrl+Y |
| 质量评估 | Cmd+Q | Ctrl+Q |
        `,
};

export const enEditorToolbar: DocsContentEntry = {
  title: "Editor Basics",
  description:
    "The toolbar at the top of the chapter editor, providing font size controls, outline management, participant management, and word count.",
  body: `
## Overview

When you open a **chapter module**, a toolbar appears at the top of the editing area. It contains layout controls, chapter management tools, and a real-time word count on the right.

> **About AI Writing Tools**: Buttons for continuation, polishing, entity extraction, plot organization, style check, quality assessment, and other AI features have been moved to the **[AI Assistant](/docs/en/user-guide/ai-assistant)** input area toolbar on the right. When you select a specific chapter, these buttons automatically appear above the AI assistant's input field. See [AI Assistant - Context-Aware Toolbar](/docs/en/user-guide/ai-assistant) for details.

## Font Size

The **A-** and **A+** buttons on the left adjust the editor's display font size (range 12-24px), helping you find a comfortable reading size for your screen.

## Chapter Management Tools

### Outline

Click the **"Outline"** button (shortcut: Cmd+O / Ctrl+O) to open the chapter outline editing window.

Use the outline to write a summary or plan for the current chapter — for example, "This chapter covers the protagonist entering the secret realm and facing the first trial." The outline serves as important context for AI to understand your writing intent, making continuation and polishing better aligned with your plans.

### Participants

Click the **"Participants"** button (shortcut: Cmd+E / Ctrl+E) to open the entity management modal.

Here you can select which characters, scenes, organizations, and props appear in the current chapter. Selected entity information is automatically passed to AI — this means AI can "see" these entities' complete settings and latest dynamic info when continuing the story, producing content that better matches character personalities, scene atmospheres, and prop characteristics.

## Word Count

The right side of the toolbar displays the current chapter's word count in real time, updating automatically with every content change.

## Keyboard Shortcuts

### Editor Toolbar Shortcuts

| Function | Mac | Windows |
|----------|-----|---------|
| Outline | Cmd+O | Ctrl+O |
| Participants | Cmd+E | Ctrl+E |

### AI Assistant Shortcuts

The following shortcuts trigger corresponding features in the AI assistant toolbar (requires a chapter to be selected):

| Function | Mac | Windows |
|----------|-----|---------|
| Continue | Cmd+G | Ctrl+G |
| Polish | Cmd+P | Ctrl+P |
| Style Check | Cmd+Y | Ctrl+Y |
| Quality Assessment | Cmd+Q | Ctrl+Q |
        `,
};
