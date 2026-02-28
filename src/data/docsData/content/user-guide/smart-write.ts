import type { DocsContentEntry } from "../../types";

export const zhSmartWrite: DocsContentEntry = {
    title: "智能写作工具",
    description:
      "Qritor 的章节编辑器内置 AI 写作能力——续写正文、润色文本，以及写入模式和修改模式的预览确认机制。",
    body: `
## 什么是智能写作工具

打开任意章节模块后，您会进入 Qritor 的**智能写作编辑器**。它不仅是一个文本编辑器，还深度集成了 AI 写作能力——AI 生成的内容会直接流入编辑器，以可视化的方式供您预览和确认。

编辑器顶部有一排工具栏按钮，提供续写、润色、提取、分析等功能。本文重点介绍编辑器的**核心写作能力和 AI 交互方式**，工具栏上所有按钮的详细说明请参见 [编辑器工具栏](/docs/zh/user-guide/editor-toolbar)。

## 续写

点击工具栏 **「写作」** 按钮（快捷键 Cmd+G / Ctrl+G），AI 会根据以下上下文信息为当前章节续写正文：

- 章节已有内容（前文）
- 章节大纲（如果您设置了）
- 参与实体的设定和动态信息
- 小说的整体设定

AI 生成的内容以流式传输实时显示——您可以看到文字逐段出现。生成完成后进入**写入模式**（见下文），您可以预览并决定是否采纳。

## 润色

先在编辑器中**选中一段文本**，然后点击工具栏 **「润色」** 按钮（快捷键 Cmd+P / Ctrl+P），或在右键菜单中选择 **「润色」**。

AI 会优化选中文本的措辞和文采，同时保持原意不变。完成后进入**修改模式**（见下文），以分栏对比的方式展示修改前后的差异。

## 添加到对话

选中一段文本后，右键菜单中的 **「添加到对话」**（快捷键 Cmd+L / Ctrl+L）可以将选中内容发送到 AI 助手对话中，方便您针对特定段落与 AI 讨论、修改或扩展。

## 写入模式

当 AI 为章节**生成新内容**时（无论是通过工具栏的"写作"按钮，还是在 AI 助手中让 Agent 写一章内容），编辑器会进入**写入模式**：

1. 编辑器顶部出现状态栏，显示 **「正在写入...」** 和实时新增字数
2. AI 以流式传输生成内容，您可以实时看到文字逐段出现，编辑器自动滚动到最新位置
3. 生成完成后，状态栏变为 **「写入完成」**，并显示两个按钮：
   - **「确认」** — 将 AI 生成的内容正式写入章节
   - **「取消」** — 放弃所有生成内容，恢复原状

如果生成过程中连接中断，状态栏会显示 **「写入中断」**，您仍然可以选择确认已生成的部分内容。

## 修改模式

当 AI **修改章节中的已有内容**时（无论是通过"润色"功能，还是在 AI 助手中让 Agent 修改某个段落），编辑器会进入**修改模式**：

1. 编辑器顶部出现状态栏，显示修改统计信息
2. 编辑区域切换为**分栏对比视图**：
   - **左侧**：原文——被删除的部分以**红色**高亮
   - **右侧**：修改后——新增的部分以**绿色**高亮
3. 两栏**同步滚动**，方便您逐段对比
4. 状态栏显示两个按钮：
   - **「确认」** — 应用修改，用新内容替换原文
   - **「取消」** — 放弃修改，保留原文不变

## AI 助手与编辑器的协作

智能写作编辑器与右侧的 AI 助手深度联动：

- **工具栏的所有 AI 功能**都通过向 AI 助手发送指令来工作——点击工具栏按钮，AI 助手会收到对应的提示词并开始处理
- **AI 助手的写作结果**会自动流入编辑器——当 Agent 执行写入或修改操作时，编辑器会自动进入对应的模式
- **双向交互**：您可以在 AI 助手中继续讨论、调整要求，AI 会根据反馈重新生成

这种设计让 AI 写作成为一个**可控的协作过程**——AI 负责生成，您保留最终决定权。

## 使用建议

- **善用大纲**：写作前先设置章节大纲，AI 续写时会参考大纲来把控方向和节奏
- **配置参与实体**：将当前章节涉及的角色、场景加入参与实体，AI 续写时会自动参考它们的设定
- **先写后润**：建议先用"写作"快速生成初稿，再选中需要优化的段落逐段润色
- **对比后再确认**：修改模式的分栏对比让您清楚看到每一处改动，不满意可以直接取消
        `,
  };

export const enSmartWrite: DocsContentEntry = {
    title: "Smart Writing Tools",
    description:
      "Qritor's chapter editor features built-in AI writing capabilities — continue writing, polish text, plus preview-and-confirm mechanisms for writing mode and modify mode.",
    body: `
## What Are Smart Writing Tools

When you open any chapter module, you enter Qritor's **Smart Writing Editor**. It's not just a text editor — it deeply integrates AI writing capabilities. AI-generated content streams directly into the editor, presented visually for you to preview and confirm.

A toolbar at the top of the editor provides buttons for continue writing, polish, extraction, analysis, and more. This article focuses on the **core writing capabilities and AI interaction patterns**. For a detailed description of every toolbar button, see [Editor Toolbar](/docs/en/user-guide/editor-toolbar).

## Continue Writing

Click the **"Write"** button in the toolbar (shortcut Cmd+G / Ctrl+G), and AI will continue writing for the current chapter based on the following context:

- Existing chapter content (preceding text)
- Chapter outline (if you've set one)
- Settings and dynamic info of participating entities
- Overall novel settings

AI-generated content appears in real-time via streaming — you can watch text appear paragraph by paragraph. Once generation completes, the editor enters **writing mode** (see below), where you can preview and decide whether to accept.

## Polish

First **select a passage of text** in the editor, then click the **"Polish"** button in the toolbar (shortcut Cmd+P / Ctrl+P), or choose **"Polish"** from the right-click menu.

AI will refine the wording and literary quality of the selected text while preserving its original meaning. Once complete, the editor enters **modify mode** (see below), displaying a side-by-side comparison of the before and after.

## Add to Chat

After selecting text, **"Add to Chat"** in the right-click menu (shortcut Cmd+L / Ctrl+L) sends the selected content to the AI assistant conversation, allowing you to discuss, revise, or expand on a specific passage with AI.

## Writing Mode

When AI **generates new content** for a chapter — whether via the toolbar's "Write" button or by asking Agent to write a chapter in the AI assistant — the editor enters **writing mode**:

1. A status bar appears at the top of the editor, showing **"Writing..."** and a real-time word count of new content
2. AI generates content via streaming — you can watch text appear paragraph by paragraph as the editor automatically scrolls to the latest position
3. Once generation is complete, the status bar changes to **"Writing Complete"** and displays two buttons:
   - **"Confirm"** — officially writes the AI-generated content into the chapter
   - **"Cancel"** — discards all generated content and restores the original state

If the connection is interrupted during generation, the status bar shows **"Writing Interrupted"**, and you can still choose to confirm the partially generated content.

## Modify Mode

When AI **modifies existing content** in a chapter — whether via the "Polish" feature or by asking Agent to revise a paragraph in the AI assistant — the editor enters **modify mode**:

1. A status bar appears at the top of the editor, showing modification statistics
2. The editing area switches to a **side-by-side comparison view**:
   - **Left side**: Original text — deleted portions highlighted in **red**
   - **Right side**: Modified text — added portions highlighted in **green**
3. Both panels **scroll in sync**, making it easy to compare paragraph by paragraph
4. The status bar displays two buttons:
   - **"Confirm"** — applies the modifications, replacing the original with the new content
   - **"Cancel"** — discards the modifications, keeping the original text unchanged

## AI Assistant and Editor Collaboration

The Smart Writing Editor works in deep coordination with the AI assistant on the right:

- **All AI features in the toolbar** work by sending instructions to the AI assistant — clicking a toolbar button triggers the AI assistant to receive the corresponding prompt and begin processing
- **AI assistant writing results** automatically stream into the editor — when Agent performs a write or modify operation, the editor automatically enters the corresponding mode
- **Two-way interaction**: You can continue discussing and adjusting requirements in the AI assistant, and AI will regenerate based on your feedback

This design makes AI writing a **controllable collaborative process** — AI handles generation, while you retain the final say.

## Tips

- **Make good use of outlines**: Set chapter outlines before writing — AI references them to maintain direction and pacing when continuing
- **Configure participating entities**: Add relevant characters and scenes to the chapter's participants — AI automatically references their settings when continuing
- **Write first, polish later**: We recommend using "Write" to quickly generate a draft, then selecting passages that need improvement for individual polishing
- **Review comparisons before confirming**: Modify mode's side-by-side comparison lets you clearly see every change — if unsatisfied, simply cancel
        `,
  };
