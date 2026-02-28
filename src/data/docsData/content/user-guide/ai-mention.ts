import type { DocsContentEntry } from "../../types";

export const zhAiMention: DocsContentEntry = {
    title: "@提及",
    body: `
## 什么是 @ 提及

在与 AI 对话时，你可以将小说中的内容作为上下文注入给 AI，帮助 AI 更好地理解你的创作需求。目前支持两种引用类型：

- **模块引用**：通过 **@** 符号引用角色、场景、章节等模块，模块的完整内容会传递到 AI 的上下文窗口中
- **文字引用**：从编辑器中选取文字片段添加到对话，AI 可以针对具体段落进行分析和操作

## 模块引用

### 可提及的内容

你可以 @ 当前小说中的所有模块，包括：

| 类型 | 示例 | 典型用途 |
|------|------|---------|
| **角色** | @林婉儿 | 让 AI 了解角色性格、背景，生成符合人设的对话或行为 |
| **场景** | @京城皇宫 | 提供环境细节，让描写更准确 |
| **组织** | @锦衣卫 | 参考组织结构和成员关系 |
| **道具** | @传国玉玺 | 了解道具属性和历史 |
| **设定** | @魔法体系 | 确保创作内容符合世界观规则 |
| **章节** | @第三章 | 参考已有章节内容，保持前后连贯 |

模块选择器按类型分组显示，方便快速定位。

### 添加方式

有三种方式将模块添加为 AI 对话的上下文：

**方式一：输入 @ 触发**

1. 在 AI 助手输入框中输入 \`@\`
2. 弹出模块选择下拉框，显示当前小说的所有模块（按类型分组）
3. 继续输入文字可模糊搜索过滤
4. 点击或按回车选择目标模块
5. 选中的模块会以标签形式嵌入输入框

**方式二：工具栏 + 按钮**

点击 AI 助手输入框左侧的 **+** 按钮，同样会弹出模块选择下拉框，选择后模块以标签形式嵌入输入框。

**方式三：右键菜单 / 快捷键**

在左侧模块树中右键点击任意模块，选择 **「添加到对话」**；或选中模块后按 \`⌘L\` 快捷键快速添加。

## 文字引用

除了引用整个模块，你还可以引用编辑器中的具体文字片段：

在编辑器中选中一段文字，右键选择 **「添加到对话」**（或按 \`⌘L\`），选中的文字片段会以引用标签的形式添加到 AI 助手输入框中。标签显示为 **📎 第X章 第Y-Z字** 的格式，标明引用的章节和字符位置。

## 快捷键

| 快捷键 | 场景 | 效果 |
|--------|------|------|
| \`⌘L\` | 模块树中选中模块时 | 将选中模块添加到对话 |
| \`⌘L\` | 编辑器中选中文字时 | 将选中文字作为引用添加到对话 |

## 管理已添加内容

选中的模块以绿色标签形式嵌入输入框，文字引用以 📎 标签形式嵌入。点击标签上的 **×** 可移除。你可以在同一条消息中同时提及多个模块和文字片段，自由组合上下文。

## 上下文注入机制

当你发送消息时，所有引用的内容会注入到 AI 的系统提示中：

- **模块引用**：以 **「引用资料」** 的形式注入，包含模块的 **标题、类型和完整内容**
- **文字引用**：以 **「文字引用」** 的形式注入，包含 **章节信息、字符位置和实际文字内容**
- 内容过长时会自动截断，优先保留关键信息
- 引用内容与你的消息文本一起发送，AI 能理解"你在说什么"和"你在参考什么"

## 使用场景

### 角色对话生成
> @ 两个角色，让 AI 根据双方性格生成对话

\`@林婉儿 @范闲 写一段两人在酒楼初遇的对话\`

AI 会读取两个角色的完整设定（性格、说话方式、背景），生成符合人设的对话。

### 剧情续写参考
> @ 章节大纲或前一章，让 AI 基于已有内容续写

\`@第五章 基于这一章的结尾，续写第六章开头\`

### 设定一致性检查
> @ 世界观设定，让 AI 检查内容是否合理

\`@魔法体系 我写的这段战斗场景中的法术使用是否符合设定？\`

### 跨模块关联分析
> @ 多个模块，让 AI 分析它们之间的关系

\`@林婉儿 @范闲 @庆帝 分析这三个角色之间的权力关系\`

## 提示

- **精确引用**：只 @ 当前任务相关的模块，避免注入过多无关内容占用上下文窗口
- **搭配技能使用**：在触发技能（如 \`/character-operations\`）时 @ 相关角色，AI 能更精准地执行操作
- **Agent 模式下效果最佳**：Agent 模式中 AI 可以基于引用内容直接调用工具执行操作；Ask 模式下仅作为参考回答问题
        `,
  };

export const enAiMention: DocsContentEntry = {
    title: "@Mention",
    body: `
## What Is @ Mention

When chatting with the AI, you can inject content from your novel as context to help the AI better understand your creative needs. Two types of references are supported:

- **Module references**: Use the **@** symbol to reference characters, scenes, chapters, and other modules — their full content is passed to the AI's context window
- **Text quotes**: Select text passages from the editor to add to the conversation — the AI can analyze and work with specific paragraphs

## Module References

### What You Can Mention

You can @ any module in your current novel, including:

| Type | Example | Typical Use |
|------|---------|-------------|
| **Characters** | @Lin Waner | Let AI understand personality and background for in-character dialogue |
| **Scenes** | @Imperial Palace | Provide environment details for accurate descriptions |
| **Organizations** | @Royal Guard | Reference organizational structure and members |
| **Props** | @Imperial Seal | Access prop attributes and history |
| **Settings** | @Magic System | Ensure content follows world-building rules |
| **Chapters** | @Chapter 3 | Reference existing chapter content for continuity |

The module selector groups items by type for quick navigation.

### How to Add

There are three ways to add modules as context for AI conversations:

**Method 1: Trigger with @**

1. Type \`@\` in the AI assistant input field
2. A dropdown appears showing all modules in the current novel (grouped by type)
3. Continue typing to fuzzy-search and filter
4. Click or press Enter to select a module
5. The selected module appears as a badge in the input field

**Method 2: Toolbar + Button**

Click the **+** button on the left side of the AI assistant input field to open the same module selector dropdown. Selected modules appear as badges in the input field.

**Method 3: Context Menu / Shortcut**

Right-click any module in the module tree on the left panel and select **"Add to Chat"**; or select a module and press \`⌘L\` to add it quickly.

## Text Quotes

In addition to referencing entire modules, you can also quote specific text passages from the editor:

Select a text passage in the editor, then right-click and choose **"Add to Chat"** (or press \`⌘L\`). The selected text will be added as a quote badge in the AI assistant input field, displayed as **📎 Chapter X, chars Y-Z**, indicating the chapter and character position of the quote.

## Keyboard Shortcut

| Shortcut | Context | Effect |
|----------|---------|--------|
| \`⌘L\` | Module selected in the module tree | Add the selected module to the chat |
| \`⌘L\` | Text selected in the editor | Add the selected text as a quote to the chat |

## Manage Referenced Content

Selected modules appear as green badges in the input field, while text quotes appear as 📎 badges. Click the **×** on a badge to remove it. You can mention multiple modules and text passages in a single message to freely combine context.

## Context Injection

When you send a message, all referenced content is injected into the AI's system prompt:

- **Module references**: Injected as **"Referenced Materials"**, including each module's **title, type, and full content**
- **Text quotes**: Injected as **"Text Quotes"**, including **chapter info, character positions, and the actual text content**
- Overly long content is automatically truncated, preserving key information
- Referenced content is sent alongside your message text, so the AI understands both "what you're saying" and "what you're referencing"

## Use Cases

### Character Dialogue Generation
> @ two characters to have AI generate dialogue based on their personalities

\`@Lin Waner @Fan Xian Write a dialogue for their first meeting at the tavern\`

The AI reads both characters' full profiles (personality, speech patterns, background) and generates in-character dialogue.

### Plot Continuation
> @ a chapter outline or the previous chapter for AI to continue writing

\`@Chapter 5 Based on this chapter's ending, write the opening of Chapter 6\`

### Setting Consistency Check
> @ world-building settings to have AI verify content

\`@Magic System Does the spell usage in this battle scene follow the established rules?\`

### Cross-Module Analysis
> @ multiple modules to analyze relationships between them

\`@Lin Waner @Fan Xian @Emperor Qing Analyze the power dynamics between these three characters\`

## Tips

- **Be precise**: Only @ modules relevant to the current task — avoid injecting too much unrelated content that wastes the context window
- **Combine with skills**: When triggering a skill (e.g., \`/character-operations\`), @ relevant characters so the AI can operate more precisely
- **Best in Agent mode**: In Agent mode, AI can act on referenced content by calling tools; in Ask mode, it only uses references to inform answers
        `,
  };
