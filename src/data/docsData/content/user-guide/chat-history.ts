import type { DocsContentEntry } from "../../types";

export const zhChatHistory: DocsContentEntry = {
    title: "对话管理",
    description:
      "了解 AI 助手中对话的工作方式——当前对话、历史对话、何时新建、对话之间的隔离与共享。",
    body: `
## 什么是对话

在 Qritor 中，您与 AI 助手的每一次交流都发生在一个**对话**中。一个对话包含完整的消息记录——您说的话、AI 的回复、工具调用的结果，全部保存在一起。

每部小说可以有多个对话，它们之间的消息完全独立，互不干扰。

## 当前对话

打开 AI 助手后，您默认处于**当前对话**中。所有发送的消息和 AI 的回复都会追加到这个对话里。

对话的**标题**由第一条消息自动生成，方便您在历史列表中识别。

### 上下文是怎么工作的

每次您发送消息时，AI 不仅能看到当前对话的聊天记录，还会自动获取以下信息作为背景知识：

- **当前选中的模块/章节**：左侧模块树中高亮的项目
- **通过 @提及 引用的模块**：您在消息中主动引用的角色、场景等
- **小说的设定、模块结构、知识图谱**等全局信息

这意味着即使在新对话中，AI 也能访问您的小说数据——对话隔离的是**聊天记录**，不是小说内容。

## 新建对话

### 如何新建

点击 AI 助手顶部的 **「+」** 按钮即可新建对话。当前对话会自动保存到历史中。

### 什么时候应该新建对话

以下情况建议新建一个对话：

- **切换工作主题**：比如刚讨论完角色设定，现在要规划剧情——新建对话可以避免之前的讨论干扰 AI 的判断
- **对话变长时**：当一个对话积累了大量消息，AI 需要处理的上下文越来越多，可能影响响应速度和质量。此时新建对话可以重新开始
- **想做实验**：比如想尝试不同的剧情走向，新建一个对话试试，不满意直接删除，不影响原来的对话
- **清空当前聊天**：新建对话会让聊天区域回到空白状态，但之前的对话不会丢失

以下情况**不需要**新建对话：

- 围绕同一个章节/角色的多轮讨论，保持在同一个对话中效果更好
- AI 刚执行了某个操作，您想让它继续调整——在同一对话中追问即可

## 对话的隔离与共享

理解对话之间什么是隔离的、什么是共享的，有助于更好地使用 AI 助手：

| 内容 | 是否跨对话共享 | 说明 |
|------|-------------|------|
| **聊天记录** | 隔离 | 每个对话有独立的消息历史，互不可见 |
| **小说数据** | 共享 | 设定、角色、章节等所有小说内容，每个对话都能访问 |
| **知识图谱** | 共享 | 关系图谱中的所有实体和关系 |
| **AI 操作结果** | 共享 | 在 A 对话中让 AI 修改了章节内容，B 对话能看到修改后的结果 |
| **@提及引用** | 隔离 | 每条消息中通过 @ 引用的模块只作用于当前消息 |

简单来说：**对话隔离的是"交流过程"，共享的是"作品数据"。**

## 历史对话

![历史对话](/images/docs/chat-history.png)

### 查看历史

点击 AI 助手顶部的 **时钟图标** 打开历史对话列表。列表按最近使用时间排序，显示每个对话的标题和时间。

### 继续历史对话

点击某个历史对话，即可加载它的完整消息记录，继续之前的交流。所有的聊天上下文都会恢复，AI 能"记住"你们之前讨论的内容。

### 删除对话

鼠标悬停在某个历史对话上，右侧会出现删除按钮。删除后该对话的所有消息将被永久移除。

## 长对话的自动压缩

当一个对话积累了大量消息，即将超出 AI 模型的上下文窗口时，系统会自动触发**上下文压缩**：

1. 将较早的消息压缩为一份摘要
2. 保留最近的消息原文
3. AI 继续对话时会参考摘要 + 最近消息

这个过程是自动的，您不需要手动操作。压缩后 AI 仍然"记得"之前讨论的要点，只是不再逐条保留所有历史消息的细节。

如果您发现 AI 的回忆开始变得模糊，可以新建一个对话重新开始，并在新对话中用 @提及 引用需要参考的内容。

## 使用建议

- **一个话题一个对话**：按工作主题分组对话，比如"设计主角""规划第一卷剧情""润色第三章"，便于回顾和管理
- **定期清理**：完成的对话如果不再需要回顾，可以删除以保持列表整洁
- **善用历史**：之前讨论过的方案不确定了？直接打开历史对话查看，不用重新问一遍
        `,
  };

export const enChatHistory: DocsContentEntry = {
    title: "Conversations",
    description:
      "Understand how conversations work in the AI assistant — current chat, history, when to start new ones, and what's isolated vs. shared.",
    body: `
## What Is a Conversation

In Qritor, every interaction with the AI assistant happens within a **conversation**. A conversation contains the complete message history — everything you've said, AI's responses, and tool call results, all saved together.

Each novel can have multiple conversations, and their messages are completely independent of each other.

## Current Conversation

When you open the AI assistant, you're in the **current conversation** by default. All messages you send and AI's replies are appended to this conversation.

The conversation **title** is automatically generated from the first message, making it easy to identify in the history list.

### How Context Works

Each time you send a message, the AI doesn't just see the current conversation's chat history — it also automatically receives the following as background knowledge:

- **Currently selected module/chapter**: The highlighted item in the left module tree
- **Modules referenced via @mention**: Characters, scenes, etc. you actively reference in your message
- **Novel settings, module structure, knowledge graph**, and other global information

This means even in a new conversation, AI can access your novel data — conversations isolate **chat history**, not novel content.

## Starting a New Conversation

### How to Create

Click the **"+"** button at the top of the AI assistant to start a new conversation. The current conversation is automatically saved to history.

### When You Should Start a New Conversation

The following situations call for a new conversation:

- **Switching work topics**: For example, you just finished discussing character design and now want to plan plot — a new conversation prevents earlier discussion from biasing AI's judgment
- **When conversations get long**: As a conversation accumulates many messages, AI has more context to process, which may affect response speed and quality. Starting fresh can help
- **Experimenting**: Want to try a different plot direction? Start a new conversation to test it out — if unsatisfied, just delete it without affecting the original conversation
- **Clearing the chat area**: A new conversation gives you a blank slate, but previous conversations aren't lost

The following situations **don't need** a new conversation:

- Multiple rounds of discussion about the same chapter/character — keeping them in one conversation works better
- AI just performed an action and you want adjustments — follow up in the same conversation

## Isolation vs. Sharing Between Conversations

Understanding what's isolated and what's shared between conversations helps you use the AI assistant more effectively:

| Content | Shared Across Conversations? | Notes |
|---------|-----|-------|
| **Chat history** | Isolated | Each conversation has independent message history, invisible to others |
| **Novel data** | Shared | Settings, characters, chapters — all novel content is accessible from every conversation |
| **Knowledge graph** | Shared | All entities and relationships in the relation graph |
| **AI operation results** | Shared | If AI modifies chapter content in conversation A, conversation B sees the updated result |
| **@mention references** | Isolated | Modules referenced via @ in a message only apply to that message |

In short: **Conversations isolate the "exchange process" but share the "work data."**

## Conversation History

![Conversation History](/images/docs/chat-history.png)

### Viewing History

Click the **clock icon** at the top of the AI assistant to open the conversation history list. The list is sorted by most recently used, showing each conversation's title and time.

### Continuing a Past Conversation

Click a historical conversation to load its complete message history and continue where you left off. All chat context is restored, so AI can "remember" what you discussed before.

### Deleting Conversations

Hover over a historical conversation to reveal a delete button on the right. Deleting permanently removes all messages in that conversation.

## Automatic Compression for Long Conversations

When a conversation accumulates enough messages to approach the AI model's context window limit, the system automatically triggers **context compression**:

1. Older messages are compressed into a summary
2. Recent messages are kept in full
3. AI references the summary + recent messages when continuing

This process is automatic — no manual action needed. After compression, AI still "remembers" the key points discussed, just without retaining every detail of all historical messages.

If you notice AI's recall becoming fuzzy, you can start a new conversation and use @mention to reference any content you need.

## Tips

- **One topic per conversation**: Group conversations by work topic — e.g., "Design protagonist," "Plan Volume 1 plot," "Polish Chapter 3" — for easier review and management
- **Clean up periodically**: Delete completed conversations you no longer need to keep the list tidy
- **Leverage history**: Unsure about a previously discussed approach? Open the historical conversation to review instead of asking again
        `,
  };
