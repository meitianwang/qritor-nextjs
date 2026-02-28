import type { DocsContentEntry } from "../../types";

export const zhChapterEdit: DocsContentEntry = {
    title: "章节编辑",
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
- **更多工具**：详见 [编辑器工具栏](/docs/zh/user-guide/editor-toolbar)。
        `,
  };

export const enChapterEdit: DocsContentEntry = {
    title: "Chapter Editing",
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
- **More Tools**: See [Editor Toolbar](/docs/en/user-guide/editor-toolbar) for details.
        `,
  };
