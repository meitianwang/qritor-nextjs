import type { DocsContentEntry } from "../../types";

export const zhAiAssistant: DocsContentEntry = {
    title: "聊天",
    description:
      "Qritor 的 AI 助手是小说创作的核心——通过对话驱动一切创作操作，从写章节、建角色到管理剧情，AI 都能直接帮您执行。",
    body: `
## 什么是 AI 助手

AI 助手是 Qritor 的**创作中枢**。在 Qritor 中，几乎所有创作操作都通过与 AI 对话来完成——您用自然语言描述需求，AI 理解后直接执行。

它不是一个简单的聊天机器人，而是一个拥有**工具调用能力**的智能体 (Agent)：能读取您的小说数据、创建和修改模块、写作和润色章节、管理剧情线和关系图谱。您只需要说"帮我创建一个亦正亦邪的剑修角色"，AI 就会自动调用相应工具完成操作。

## 面板位置

AI 助手面板位于编辑器**右侧**，默认开启。面板宽度可通过拖拽左边缘调整。

面板从上到下分为三个区域：

- **顶部栏**：标题、历史对话按钮、新建对话按钮
- **消息区**：滚动显示对话内容
- **输入区**：文本输入框、工具栏、模式选择、模型选择

## Agent 能做什么

在默认的 **Agent 模式**下，AI 拥有完整的创作能力。以下是 AI 可以执行的操作：

| 能力 | 说明 | 示例指令 |
|------|------|---------|
| **章节写作** | 续写、改写、从零生成整章内容 | "帮我续写第三章"、"把这段对话改得更紧张" |
| **章节管理** | 创建、重命名、删除章节 | "创建第四章，标题叫'暗流涌动'" |
| **角色/场景/道具/组织** | 创建、编辑、删除各类模块 | "创建一个亦正亦邪的剑修角色" |
| **关系管理** | 建立、修改实体间的关系 | "把张三和李四设为师徒关系" |
| **剧情管理** | 创建剧情事件、管理故事线和伏笔 | "在第五章标记一个转折点事件" |
| **动态信息** | 记录实体随剧情发展的状态变化 | "记录主角在这章觉醒了血脉" |
| **信息查询** | 搜索角色、章节、关系等信息 | "列出所有出场过的角色" |

## 工具调用可视化

当 AI 执行操作时，消息区会显示**工具调用卡片**，让您清楚看到 AI 正在做什么：

- 每个工具调用显示为一张可展开的卡片
- 卡片左侧有**状态指示灯**：橙色（执行中）、绿色（成功）、红色（失败）
- 点击卡片可展开查看详细结果
- 多个工具调用以时间线形式串联显示

## 确认机制

对于会**修改您作品**的操作，AI 不会直接执行，而是先展示结果等待您确认：

- **创建/修改模块**：AI 生成内容后，工具卡片自动展开，显示预览和 **「确认」「拒绝」** 两个按钮
- **写入章节**：编辑器进入写入模式，您可以预览后选择确认或取消（详见 [智能写作工具](/docs/zh/user-guide/smart-write)）
- **修改章节**：编辑器进入修改模式，以分栏对比展示改动（详见 [智能写作工具](/docs/zh/user-guide/smart-write)）

查询类操作（如搜索角色、查看章节内容）会自动执行，无需确认。

## 上下文感知

AI 不只是读取您发送的消息——每次对话时，它还会自动获取丰富的背景信息：

- **当前选中项**：左侧模块树中高亮的章节或模块，AI 会自动了解您当前的工作对象
- **@提及的模块**：您在消息中主动引用的角色、场景等（详见 [@提及](/docs/zh/user-guide/ai-mention)）
- **小说全局信息**：设定、模块结构、知识图谱等

这意味着您不需要每次都重复解释背景——AI 始终了解您的小说。

### 上下文窗口与自动压缩

AI 模型有一个**上下文窗口**——它能同时"看到"的信息总量。您的聊天记录、小说数据、@提及的模块内容都会占用这个窗口。

输入区左下角有一个**饼图图标**，实时显示上下文窗口的使用比例。悬停可查看具体的 Token 用量和窗口大小。

当对话积累了大量消息、即将接近窗口上限时，系统会**自动触发上下文压缩**——将较早的消息压缩为一份摘要，保留最近的消息原文。压缩后 AI 仍然"记得"之前讨论的要点，只是不再逐条保留所有历史消息的细节。这个过程是自动的，您不需要手动操作。

如果对话经过多次压缩后，AI 的回忆开始变得模糊，可以考虑新建对话并用 @提及 引用需要参考的内容。详见 [对话管理](/docs/zh/user-guide/chat-history)。

## 输入区功能

### 文本输入

- 直接输入文字与 AI 对话
- **Enter** 发送消息，**Shift+Enter** 换行
- 输入框高度随内容自动调整

### @提及

输入 **@** 可引用小说中的模块作为上下文，帮助 AI 更精准地理解您的需求。详细用法见 [@提及](/docs/zh/user-guide/ai-mention) 页面。

### /技能

输入 **/** 可触发技能命令——这些是预设的专业操作流程，例如生成大纲、提取角色等。技能支持模糊搜索，按回车或点击选择。详见 [技能](/docs/zh/user-guide/skills) 页面。

### 快捷操作按钮

输入框左侧提供以下快捷按钮：

- **+（添加引用）**：手动添加模块引用或文字引用
- **AI 生成**：一键为当前选中的模块生成 AI 内容（仅支持 AI 生成的模块类型显示此按钮）

## 消息类型

AI 助手中的消息包含多种内容形式：

- **文本回复**：AI 的普通文字回复，支持 Markdown 格式
- **工具调用卡片**：AI 执行操作时的可视化展示（见上文）
- **思考过程**：如果模型支持，AI 的推理过程会以可折叠的卡片形式展示，帮助您理解 AI 的决策逻辑
- **流式 JSON 预览**：提取实体等操作时，实时预览生成的结构化数据

## 模型选择

输入区右下角的**模型选择器**让您随时切换 AI 模型：

- 点击显示可用模型列表
- 不同模型在能力、速度和价格上各有特点
- 可以在对话中途切换模型
- 如果某个模型出现问题，错误提示中会提供"切换模型"的快捷入口

详见 [模型](/docs/zh/user-guide/ai-models) 页面。

## 模式切换

输入区左下角的**模式选择器**用于切换 AI 的工作模式。详见 [AI 模式](/docs/zh/user-guide/ai-modes) 页面。

## 使用建议

- **直接说需求**：不需要使用特定的指令格式，用自然语言描述您想做什么，AI 会理解并执行
- **善用确认机制**：AI 的每个修改操作都需要您确认，不满意可以拒绝并提出调整要求
- **关注工具卡片**：展开工具调用卡片可以了解 AI 具体做了什么，帮助您验证结果
- **搭配 @提及**：讨论特定角色或场景时，用 @ 引用它们，AI 能给出更精准的回应
- **留意上下文用量**：关注饼图指示器的颜色变化，系统会自动压缩过长的对话，但如果 AI 回忆变模糊，可以新建对话重新开始
        `,
  };

export const enAiAssistant: DocsContentEntry = {
    title: "Chat",
    description:
      "Qritor's AI assistant is the heart of novel writing — drive all creative operations through conversation, from writing chapters and creating characters to managing plot, AI can execute it all for you.",
    body: `
## What Is the AI Assistant

The AI assistant is Qritor's **creative command center**. In Qritor, virtually all creative operations are accomplished through conversation with AI — describe what you need in natural language, and AI understands and executes it directly.

It's not a simple chatbot, but an intelligent agent with **tool-calling capabilities**: it can read your novel data, create and modify modules, write and polish chapters, and manage plot lines and relation graphs. Just say "create a morally ambiguous sword master character," and AI will automatically call the appropriate tools to complete the task.

## Panel Location

The AI assistant panel is on the **right side** of the editor, open by default. You can adjust its width by dragging the left edge.

The panel is divided into three areas from top to bottom:

- **Header bar**: Title, conversation history button, new chat button
- **Message area**: Scrollable conversation content
- **Input area**: Text input field, toolbar, mode selector, model selector

## What Agent Can Do

In the default **Agent mode**, AI has full creative capabilities. Here are the operations AI can perform:

| Capability | Description | Example Commands |
|------------|-------------|-----------------|
| **Chapter Writing** | Continue, rewrite, or generate entire chapters from scratch | "Continue writing Chapter 3", "Make this dialogue more tense" |
| **Chapter Management** | Create, rename, delete chapters | "Create Chapter 4 titled 'Undercurrents'" |
| **Characters/Scenes/Props/Organizations** | Create, edit, delete all module types | "Create a morally ambiguous sword master character" |
| **Relationship Management** | Create and modify relationships between entities | "Set Zhang San and Li Si as master and disciple" |
| **Plot Management** | Create plot events, manage storylines and foreshadowing | "Mark a turning point event in Chapter 5" |
| **Dynamic Info** | Record entity state changes as the plot progresses | "Record that the protagonist awakened their bloodline in this chapter" |
| **Information Queries** | Search characters, chapters, relationships, and more | "List all characters who have appeared" |

## Tool Call Visualization

When AI performs operations, the message area displays **tool call cards**, so you can clearly see what AI is doing:

- Each tool call appears as an expandable card
- A **status indicator** on the left: amber (executing), green (success), red (failed)
- Click to expand and view detailed results
- Multiple tool calls are displayed in a timeline sequence

## Confirmation Mechanism

For operations that **modify your work**, AI doesn't execute directly — it shows the result first and waits for your confirmation:

- **Creating/modifying modules**: After AI generates content, the tool card auto-expands showing a preview with **"Confirm"** and **"Reject"** buttons
- **Writing to chapters**: The editor enters writing mode where you can preview before confirming or canceling (see [Smart Writing Tools](/docs/en/user-guide/smart-write))
- **Modifying chapters**: The editor enters modify mode with a side-by-side comparison of changes (see [Smart Writing Tools](/docs/en/user-guide/smart-write))

Query operations (like searching characters or viewing chapter content) execute automatically without confirmation.

## Context Awareness

AI doesn't just read the messages you send — with each conversation, it automatically receives rich background information:

- **Currently selected item**: The highlighted chapter or module in the left module tree — AI automatically understands your current focus
- **@mentioned modules**: Characters, scenes, etc. you actively reference in your message (see [@Mention](/docs/en/user-guide/ai-mention))
- **Novel-wide information**: Settings, module structure, knowledge graph, and more

This means you don't need to re-explain background every time — AI always knows your novel.

### Context Window and Auto-Compression

AI models have a **context window** — the total amount of information they can "see" at once. Your chat history, novel data, and @mentioned module content all consume this window.

A **pie chart icon** in the bottom-left of the input area shows real-time context window usage. Hover to see exact token counts and window size.

When a conversation accumulates enough messages to approach the window limit, the system **automatically triggers context compression** — older messages are compressed into a summary while recent messages are kept in full. After compression, AI still "remembers" the key points discussed, just without retaining every detail of all historical messages. This process is automatic and requires no manual action.

If AI's recall becomes fuzzy after multiple compressions, consider starting a new conversation and using @mention to reference the content you need. See [Conversations](/docs/en/user-guide/chat-history) for details.

## Input Area Features

### Text Input

- Type directly to chat with AI
- **Enter** to send, **Shift+Enter** for line breaks
- Input field height adjusts automatically with content

### @Mention

Type **@** to reference modules from your novel as context, helping AI understand your needs more precisely. See the [@Mention](/docs/en/user-guide/ai-mention) page for detailed usage.

### /Skills

Type **/** to trigger skill commands — these are preset professional workflows such as outline generation, character extraction, etc. Skills support fuzzy search; press Enter or click to select. See the [Skills](/docs/en/user-guide/skills) page for details.

### Quick Action Buttons

The left side of the input field provides these quick buttons:

- **+ (Add Reference)**: Manually add module references or text quotes
- **AI Generate**: One-click AI content generation for the currently selected module (only shown for AI-enabled module types)

## Message Types

Messages in the AI assistant come in several content forms:

- **Text replies**: AI's regular text responses, rendered in Markdown format
- **Tool call cards**: Visual display of AI operations (see above)
- **Thinking process**: If the model supports it, AI's reasoning process appears as collapsible cards, helping you understand AI's decision-making logic
- **Streaming JSON preview**: Real-time preview of structured data during entity extraction and similar operations

## Model Selection

The **model selector** in the bottom-right of the input area lets you switch AI models at any time:

- Click to show available models
- Different models vary in capability, speed, and cost
- You can switch models mid-conversation
- If a model encounters issues, the error message provides a quick "switch model" shortcut

See the [AI Models](/docs/en/user-guide/ai-models) page for details.

## Mode Switching

The **mode selector** in the bottom-left of the input area switches AI's operating mode. See the [AI Modes](/docs/en/user-guide/ai-modes) page for details.

## Tips

- **Just state your needs**: No special command syntax required — describe what you want in natural language and AI will understand and execute
- **Use the confirmation mechanism**: Every modification by AI requires your approval — reject and ask for adjustments if unsatisfied
- **Check tool cards**: Expanding tool call cards shows exactly what AI did, helping you verify results
- **Pair with @mentions**: When discussing specific characters or scenes, reference them with @ for more precise AI responses
- **Watch context usage**: Keep an eye on the pie chart indicator — the system auto-compresses long conversations, but if AI's recall becomes fuzzy, start a new conversation
        `,
  };
