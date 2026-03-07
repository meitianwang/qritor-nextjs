import type { DocsContentEntry } from "../types";

// ============== 快速入门 ==============

export const zhQuickStartContent: Record<string, DocsContentEntry> = {
  overview: {
    breadcrumb: "快速入门",
    title: "产品概述",
    description:
      "Qritor（/kriːtər/）是一款面向真实小说创作的 Agentic 写作平台。通过增强上下文工程与智能体无缝结合，全面理解你的作品世界观，并以系统化方式推进创作任务。",
    body: `
它提供模块化世界构建、AI 协同写作、关系图谱可视化、剧情管理等能力，构思更深入、创作更高效、叙事更精彩，为创作者带来专业、流畅的写作体验。

## 核心特性

### 沉浸式小说创作
专为桌面端打造的专业写作环境。
- **现代化编辑器**：支持多 Tab 切换，像 IDE 一样高效管理多个章节和设定。
- **极简美学**：精心打磨的 UI 设计，提供无干扰的沉浸式写作体验。
- **本地存储**：所有创作数据存储在本地数据库，安全可靠。

### 模块化故事引擎
打破线性写作的限制，用工程化的思维构建故事。
- **模块树管理**：灵活管理章节、角色、场景、组织、道具和设定等各类内容。
- **创作方法**：按小说题材（穿越、末世、灵异等）提供专业的创作方法，每种方法预定义了对应的模块类型和结构。

### 智能上下文 AI
比通用对话更懂你的创作助手。
- **RAG 增强**：AI 助手能够实时读取你当前的项目上下文、人物小传和剧情大纲，提供连贯且符合逻辑的建议。
- **智能续写与润色**：在编辑器中随时唤起 AI，进行情节续写、文笔润色或灵感扩充。

### 可视化关系图谱
让复杂的故事脉络一目了然。
- **实体关系网**：自动提取或手动构建人物、势力、地点之间的复杂关系。
- **动态演化**：随着剧情发展，直观地管理和检视故事结构的变化。

## 未来规划

我们正在持续扩展 Qritor 的创作边界，未来将支持更多元的创作形式：

### 推文制作 (即将推出)
- **一键转推**：将精彩段落或金句智能转化为适合社交媒体传播的卡片。
- **多平台适配**：内置主流社交平台的排版规范，轻松分享你的创作瞬间。

### 漫剧创作 (规划中)
- **脚本可视化**：辅助将小说文本转化为分镜脚本。
- **角色立绘生成**：联动 AI 绘画能力，为你的角色生成一致性的视觉形象。

### 短视频创作 (规划中)
- **文本转视频**：基于小说精彩片段，智能生成短视频内容。
- **有声剧制作**：AI 语音合成，为你的故事赋予声音。

## 快速上手

1. **下载安装** - 获取适用于 macOS 或 Windows 的桌面客户端
2. **创建项目** - 开始一个新的创作项目或导入现有作品
3. **探索方法** - 选择适合你的创作方法论
4. **开始创作** - 享受 AI 赋能的流畅写作体验
        `,
    quickLinks: [
      {
        title: "快速开始",
        description: "5分钟入门指南",
        path: "/docs/zh/quick-start",
        icon: "arrow",
      },
      {
        title: "下载客户端",
        description: "获取 Windows/macOS 版本",
        path: "/download",
        icon: "arrow",
      },
    ],
  },
  "quick-start": {
    title: "快速开始",
    description:
      "本文将带你从零开始创建一部小说，以个人用户的身份体验 Qritor 的核心功能。完成后，你将熟悉模块化创作、AI 双模式助手和世界观管理——这些是进行 AI 辅助小说创作的关键工具。",
    layout: "stepper",
    body: `
## 下载并安装 Qritor

1. 从 [下载页面](/download) 获取适用于你操作系统的安装包。
2. 双击安装包完成安装。
3. 启动 Qritor 桌面客户端。

详细的系统要求和安装说明请参考 [下载安装指南](/docs/zh/support/download-guide)。

## 登录

1. 启动 Qritor 桌面客户端后，首页右侧会显示登录卡片。
2. 点击 **「登录」** 按钮，通过 OAuth 授权完成登录或注册（首次使用可点击底部的 **「立即注册」** 注册新账号）。
3. 登录成功后，应用会自动跳转到小说工作区。所有创作数据存储在本地。

![登录页面](/images/docs/desktop-login-zh.png)

## 浏览小说创作方法

在侧边栏点击 **「小说创作方法」** 进入创作方法页面。

1. 小说创作方法按题材分类（穿越、末世、灵异等），每种方法为特定题材预定义了模块类型和结构。
2. 搜索或浏览所有可用方法，了解每种方法适合什么类型的故事。
3. 点击 **「同步」** 按钮可从云端获取最新的小说创作方法。

## 创建小说

1. 在侧边栏点击 **「小说」** 回到作品列表，点击右上角 **「新建小说」**。
2. 填写 **作品名称**，从下拉列表选择一种 **小说创作方法**（决定作品拥有哪些模块类型，如角色卡、场景、道具等），可选填写简介。

> 没有想法的话可以随便填写名称，后续让创作助手帮你起一个合适的名字。
3. 点击创建，系统会根据所选方法自动生成初始模块结构。

## 熟悉编辑器界面

点击小说卡片进入编辑器，你将看到三栏布局：

- **左侧：模块树** — 按分类管理所有模块，包括章节、角色、场景、组织、道具和设定。
- **中间：工作区** — 包含三个 Tab 页签：编辑器（文本编辑或模块表单）、关系图谱（实体关系网络）、剧情管理（故事线和事件）。
- **右侧：AI 助手** — 默认开启，支持 Agent 模式（可执行创建/修改/删除等操作）和问答模式（仅对话）。

## 初始化小说

创建小说后，你可以通过以下三种方式之一在右侧 AI 助手中启动设定初始化流程：
1. **快捷按钮**：点击输入框左侧的闪光魔棒图标（初始化按钮），系统会自动发送“请初始化小说设定”指令。
2. **斜杠指令**：在输入框中输入并发送 \`/novel-initialization\`。
3. **自然语言**：直接手动输入并发送“请初始化小说设定”或类似指令。

![启动设定初始化](/images/docs/novel-init-zh.png)

AI 会自动读取你选择的创作方法和小说信息，依次遍历所有设定模块（如世界观、力量体系、故事钩子等），为每个模块加载对应的专属生成技能，自动填充结构化内容。整个过程无需手动干预，每个模块生成完成后会通过确认弹窗供你审阅。

**反复调整与沟通**：如果对初始化的设定产生了新的想法、或者有需要调整的内容，您可以随时在对话框中和创作助手反复沟通、修改。
初始化完成后，你将获得一套完整的世界观设定基础，可以在此基础上进一步调整和细化。

## 推荐创作流程

完成设定初始化后，建议按以下顺序推进创作。每个阶段都依赖前一阶段的产出，遵循此顺序可以让 AI 在每个环节都拥有最充分的上下文：

| 阶段 | AI 指令示例 | 说明 |
|------|-----------|------|
| **① 实体库初始化** | /character-initialization, /scene-initialization 等 | 基于已有设定生成角色、场景、组织、道具等实体库 |
| **② 故事线设计** | "设计主线和支线故事线" | 规划故事线结构、编排剧情事件、埋设伏笔 |
| **③ 章节大纲** | "规划前 10 章大纲" | 依据故事线事件将剧情分配到具体章节 |
| **④ 正文撰写** | "撰写第一章正文" | 根据大纲和上下文生成章节正文 |

**为什么是这个顺序？**
- 实体库（角色、场景等）的设计依赖世界观设定，但不依赖剧情。先建好实体库，后续设计故事线时可以直接引用具体角色和场景
- 故事线设计需要知道有哪些角色和场景可用，才能编排出合理的剧情事件
- 章节大纲的本质是"把故事线事件分配到具体章节"，需要先有故事线数据
- 正文撰写依赖章节大纲和前序章节内容

当然，创作并非严格线性的过程。你随时可以回到前一阶段调整——比如写到某章发现需要新增角色，可以随时创建。上述顺序是"从零开始"时的最佳实践。

## 人机协同创作

右侧 AI 助手是你的全程创作搭档，支持 **Agent 模式**（可直接操作模块和内容）和 **问答模式**（仅对话），覆盖从世界观构建到正文写作的全流程。

### 世界观构建

通过自然语言指令，AI 可以帮你创建和完善角色、场景、组织、道具等模块。例如输入"创建一个亦正亦邪的剑修角色"，AI 会根据模块 Schema 生成结构化内容，经你确认后写入。你也可以随时要求 AI 修改已有模块的属性。

### 章节创作

选择章节节点后进入文本编辑器。你可以直接写作，也可以让 AI 协助：
- **AI 续写**：AI 根据大纲、参与实体和上下文生成整段或整章内容，实时流式输出，确认后写入。
- **AI 润色**：选中文本后，AI 优化措辞和表达。
- **AI 修改**：AI 定位到指定段落进行替换或插入，编辑器会显示差异对比供你审阅。

### 信息提取与维护

写完章节后，使用编辑器工具栏的自动化工具，让 AI 持续维护作品的结构化数据：
- **提取实体**：自动识别章节中出场的角色、场景、道具，更新参与实体列表。
- **提取关系**：分析文中的人物互动，自动创建或更新关系图谱中的关系节点。
- **提取动态信息**：捕捉角色在章节中的状态变化（情绪、伤势、能力提升等），更新动态档案。
- **剧情整理**：梳理章节中的剧情事件，更新故事线和剧情进度。

### 质量评估

- **质量评估**：AI 从多个维度评估章节写作质量，给出改进建议。
- **文风检测**：检测文风一致性，发现与整体风格不符的段落。
- **剧情分析**：分析剧情结构的合理性，发现潜在的逻辑漏洞。

### 伏笔管理

AI 可以帮你埋设和追踪伏笔。你可以随时提问"目前有哪些未回收的伏笔？"，AI 会基于全文内容回答，确保叙事线索不遗漏。
        `,
    quickLinks: [
      {
        title: "最佳实践",
        description: "探索 Qritor 小说创作最佳实践",
        path: "/docs/zh/best-practices",
        icon: "arrow",
      },
    ],
  },
  "best-practices": {
    breadcrumb: "快速入门",
    title: "小说创作最佳实践",
    description:
      "充分发挥 Qritor 的能力，将您的创作效率最大化。掌握核心工作流，让人工智能无缝融入您的写作过程。",
    body: `
在您开始进行小说创作之前，我们强烈建议您采用以下总结出来的最佳实践流程。这些建议能够有效地帮助您构建扎实的世界观，保持写作过程的连续性，并最大程度上释放 Qritor Agentic AI 助手的能力。

## 1. 选对合适的创作方法

不要随便选择一个不相干的题材就开始。万丈高楼平地起，在点击“新建小说”的那一刻，选择一个与您构思最契合的**[小说创作方法](/docs/zh/user-guide/creation/creation-methods)**至关重要。

![小说创作方法](/images/docs/examples/creation-method.png)

Qritor 中不同的创作方法（如无限流、修仙、末世、悬疑等）并非只是一个简单的标签，它们**在底层为您预置了完全不同的核心设定和模块体系**。这代表着接下来您的整个小说项目将拥有什么样骨架结构。
- 如果您写修仙小说选了“修仙题材”，系统会自动为您准备“灵根、境界、功法、门派”等专属设定模块。
- 如果您写悬疑小说选了“悬疑题材”，系统则会为您切换为“线索、案件、嫌疑人档案”等结构模块。

在新建项目前，可以先在侧边栏的**“小说创作方法”**分类下浏览各方法的说明。选对了方法，能让 AI 在后续进行“设定初始化”或内容生成时“对症下药”，避免张冠李戴。

## 2. 结构先于内容

不要一上来就马上开始敲打小说的正文字符。

- **初始化创作框架**：你可以通过以下三种方式之一在右侧 AI 助手中启动**[设定初始化](/docs/zh/user-guide/novel-settings)**流程：
  1. **快捷按钮**：点击输入框左侧的闪光魔棒图标（初始化按钮），系统会自动发送“请初始化小说设定”指令。
  2. **斜杠指令**：在输入框中输入并发送 \`/novel-initialization\`。
  3. **自然语言**：直接手动输入并发送“请初始化小说设定”或类似指令。

  ![启动设定初始化](/images/docs/novel-init-zh.png)

  **沟通案例：从干瘪点子到定制佳作**：

  为了让故事足够出彩，**强烈建议您与 AI 进行多次对话沟通，不断打磨设定，直到满意为止**。您可以像跟一位专业的策划编辑开会一样，直接提出修改要求。
  
  **步骤一：启动初始化**
  首先，通过按钮或指令发送初始化请求。AI 会开始结构化思考并加载当前创作方法的专有技能。
  ![初始化设定](/images/docs/examples/novel-setting1.png)
  
  **步骤二：审阅初稿**
  AI 生成了第一版设定：一个严肃的“明末崇祯拯救大明”的正剧向历史穿越设定。这很完整，但可能不是您想要的风格。
  ![初稿完成](/images/docs/examples/novel-setting2.png)
  
  **步骤三：调整基调与文风**
  您觉得正剧太沉闷，直接告诉 AI：“要一个节奏欢快、文风幽默的故事”。AI 立即将小说的整体基调、语言风格和叙事视角（改为第一人称吐槽）进行了重构。
  ![调整文风基调](/images/docs/examples/novel-setting3.png)
  
  **步骤四：制造人设反差**
  您觉得传统的穿越者不够有意思，要求：“穿越的这个人太千篇一律了，不够抓人眼球”。AI 理解了幽默基调后，将主角设定为“全网最臭名昭著的成功学大师兼带货一哥”，故事钩子变成了“把朝堂变成万人直播卖货现场”。
  ![强化人设反差](/images/docs/examples/novel-setting4.png)
  
  **步骤五：替换目标人物增强喜剧效果**
  您进一步提出：“穿越的这个目标人物（崇祯）也不够有吸引力”。AI 甚至帮您跨越了朝代，将附身对象改为了三国第一废柴“蜀汉后主刘禅（阿斗）”，并设计了“诸葛亮念出师表时，主角掏出A轮融资白皮书”的名场面。
  ![更换附身对象](/images/docs/examples/novel-setting5.png)
  
  **步骤六：结合真实历史把控尺度**
  您发现剧情走向逐渐失控：“有点太无厘头了，是要结合三国演义适当改编”。AI 收到指令后，不仅保留了喜剧商业元素，还完美地将其与历史真实的“石亭之战”结合起来——让刘禅向孙权推销“东吴防务协议”。
  ![结合真实历史战役](/images/docs/examples/novel-setting6.png)

  通过这样一步步的头脑风暴，一个原本平平无奇的点子，就被打磨成了极具反差感和戏剧张力的独特设定。让 AI 深入理解您的最终蓝图后，后续的章节创作才会充满灵魂。

## 3. 执行角色及实体初始化

在与 AI 反复敲定完世界观和基础设定之后，您应该立即让 AI 帮您进行实体的初始化工作。使用 \`/character-initialization\` (初始化角色) 或 \`/scene-initialization\` (初始化场景) 等快捷指令，让 AI 基于刚刚确认的宏伟蓝图，自动为您推演和批量生成这本小说的**[核心人物](/docs/zh/user-guide/characters)**与**[主要场景](/docs/zh/user-guide/scenes)**。这些实体不仅仅是备忘录，更是 RAG (检索增强生成) 引擎在后续写作时提取上下文的唯一依据。

> 💡 **提示**：实体的特征描写越详细、关系越清晰，后续让 AI 参与章节写作时所生成的文字就越有血有肉，减少 OOC (性格崩坏) 的出现。

## 4. 合理组织章节与大纲

在正式执笔写新章节前，请一定要先**建立大纲**。

- 在 Qritor 中建立一个明确的**[情节线路 (Storyline)](/docs/zh/user-guide/plot-management)**，并将关键情节（Plot Events）分配到具体的章节上。
- 选择章节并在工具中利用“大纲”选项卡，用几句话简单概括该章要发生的核心冲突和走向。AI 在协助您续写或润色时，大纲是除了之前正文以外最主要的指示灯。

## 5. 从双工到协同

Qritor 拥有 **[Agent (智能体操作)](/docs/zh/user-guide/ai-modes)** 与 **[Ask (问答)](/docs/zh/user-guide/ai-modes)** 两种截然不同的模式。善用模式切换能够使得您的创作极其舒适。

- **使用 Agent 模式**：当你需要 AI 创建、修改或者删除任何模块和文本实质内容时，请务必停留在 Agent 模式中。不要手工去改动几十个角色的属性，直接命令 Agent 去帮你修改。
- **使用 Ask 模式**：当你只是想获得一些灵感、抛出设定疑问或询问伏笔回收状态时，请切换到 Ask 模式，避免它"好心办坏事"直接触发对你小说的修改流程。

## 6. 自动化归档与状态维护

不要靠人脑去记忆一本书几百万字中的所有线索。Qritor 提供了一键完成的工具栏，用来**提取并整理当前章节的结构化信息**。

- **每写完一两个章节，就点击一下[编辑器工具栏](/docs/zh/user-guide/editor-toolbar)中的信息特征提取**，比如“提取实体”、“**[提取动态信息](/docs/zh/user-guide/dynamic-info)**”或者“**[提取关系](/docs/zh/user-guide/relation-graph)**”。让平台去帮你跟踪某角色在刚才的剧情中获得了什么神奇法宝，受了什么伤，甚至情感发生了怎样微妙的变化。
- **这种良好的“归档习惯”正是利用系统记忆代替人脑记忆的关键**，长篇小说连载中不会再出现前后矛盾的尴尬局面。
        `,
    quickLinks: [
      {
        title: "小说创作入门",
        description: "开始创建你的第一部小说",
        path: "/docs/zh/user-guide/creation/novel-create",
        icon: "arrow",
      },
    ],
  },
};

export const enQuickStartContent: Record<string, DocsContentEntry> = {
  overview: {
    breadcrumb: "Quick Start",
    title: "Product Overview",
    description:
      "Qritor (/kriːtər/) is an Agentic writing platform built for real novel creation. By seamlessly combining enhanced context engineering with intelligent agents, it fully understands your story world and drives creative tasks in a systematic way.",
    body: `
It provides modular worldbuilding, AI collaborative writing, relationship graph visualization, plot management, and more — enabling deeper thinking, more efficient creation, and richer storytelling for a professional, fluid writing experience.

## Core Features

### Immersive Novel Creation
A professional writing environment built for desktop.
- **Modern Editor**: Multi-tab support to manage chapters and settings efficiently.
- **Minimalist Aesthetic**: Distraction-free immersive writing experience.
- **Local Storage**: All creative data stored in a local database, safe and reliable.

### Modular Story Engine
Build stories with engineering thinking.
- **Module Tree**: Flexibly manage chapters, characters, scenes, organizations, props, and settings.
- **Creation Methods**: Professional creation methods organized by novel genre (time travel, post-apocalyptic, supernatural, etc.), each with predefined module types and structure.

### Intelligent Context AI
- **RAG Enhanced**: Real-time understanding of project context and character bios.
- **Smart Completion**: Continuation, polishing, and inspiration at your fingertips.

### Visual Relationship Graph
- **Entity Networks**: Visualize complex relationships between characters and factions.
- **Dynamic Evolution**: Track story structure changes as the plot progresses.

## Future Roadmap

### Social Media Tweets (Coming Soon)
- One-click transformation of highlights into social media cards.

### Webtoon/Comics (Planned)
- Script visualization and character design generation.

### Short Videos (Planned)
- Text-to-video generation for story highlights.

## Getting Started

1. **Download & Install** - Get the desktop client for macOS or Windows
2. **Create Project** - Start a new creative project
3. **Explore Methods** - Choose your creative methodology
4. **Start Writing** - Enjoy the AI-empowered writing experience
        `,
    quickLinks: [
      {
        title: "Quick Start",
        description: "Get started in 5 minutes",
        path: "/docs/en/quick-start",
        icon: "arrow",
      },
      {
        title: "Download",
        description: "Get Windows/macOS client",
        path: "/download",
        icon: "arrow",
      },
    ],
  },
  "quick-start": {
    title: "Getting Started",
    description:
      "This guide walks you through creating a novel from scratch as an individual user. By the end, you will be familiar with modular writing, the dual-mode AI assistant, and worldbuilding management — the key tools for AI-assisted novel creation.",
    layout: "stepper",
    body: `
## Download and Install Qritor

1. Visit the [download page](/download) to get the installer for your operating system.
2. Double-click the installer to complete installation.
3. Launch the Qritor desktop client.

For detailed system requirements and installation instructions, see the [Download & Install Guide](/docs/en/support/download-guide).

## Sign In

1. After launching the Qritor desktop client, a login card will appear on the right side of the home screen.
2. Click the **"Sign In"** button to log in or register via OAuth (first-time users can click **"Register now"** at the bottom to create an account).
3. Once signed in, the app will automatically redirect to the novels workspace. All creative data is stored locally.

![Login page](/images/docs/desktop-login-en.png)

## Browse Novel Creation Methods

Click **"Novel Creation Methods"** in the sidebar to enter the creation methods page.

1. Novel creation methods are organized by genre (time travel, post-apocalyptic, supernatural, etc.), each with predefined module types and structure for that genre.
2. Search or browse all available methods to learn which one fits your story.
3. Click the **"Sync"** button to fetch the latest novel creation methods from the cloud.

## Create a Novel

1. Click **"Novels"** in the sidebar to return to the works list, then click **"New Novel"** at the top right.
2. Enter a **Novel Name**, select a **Novel Creation Method** from the dropdown (this determines which module types your work will have, e.g., character sheets, scenes, props), and optionally add a description.

> No name ideas? Just enter anything for now — you can ask the AI assistant to suggest a better title later.
3. Click create. The system will automatically generate an initial module structure based on the selected method.

## Explore the Editor Interface

Click a novel card to enter the editor. You will see a three-column layout:

- **Left: Module Tree** — Manage all modules by category, including chapters, characters, scenes, organizations, props, and settings.
- **Center: Workspace** — Contains three tabs: Editor (text editing or module forms), Relation Graph (entity relationship network), and Plot Management (storylines and events).
- **Right: AI Assistant** — Enabled by default. Supports Agent mode (can create/modify/delete modules and more) and Ask mode (conversation only).

## Initialize Your Novel

After creating a novel, you can start the setting initialization process in the AI Assistant using one of three methods:
1. **Shortcut Button**: Click the magic wand icon (Initialization button) on the left side of the input field, which will automatically send "Please initialize the novel settings".
2. **Slash Command**: Type and send \`/novel-initialization\` in the input field.
3. **Natural Language**: Directly type and send a message like "Please initialize the novel settings".

![Initialize Novel Settings](/images/docs/novel-init-en.png)

The AI will automatically read your chosen creation method and novel information, iterate through all setting modules (worldview, power system, story hooks, etc.), load specialized generation skills for each module, and fill in structured content. The entire process requires no manual input — each module is presented via a confirmation dialog for your review.

**Iterate and Discuss**: If you have new ideas for the initialized settings or need to make adjustments, you can always discuss and refine them back-and-forth with the creative assistant in the chat box at any time.
Once complete, you will have a full worldbuilding foundation to further refine and customize.

## Recommended Creation Workflow

After setting initialization, we recommend progressing in the following order. Each phase builds on the output of the previous one, ensuring the AI has the fullest context at every step:

| Phase | AI Command Example | Description |
|-------|-------------------|-------------|
| **① Entity Libraries** | /character-initialization, /scene-initialization, etc. | Generate characters, scenes, organizations, and props based on your settings |
| **② Storyline Design** | "Design main and branch storylines" | Plan storyline structure, arrange plot events, plant foreshadowing |
| **③ Chapter Outlines** | "Plan outlines for the first 10 chapters" | Distribute plot events into specific chapters based on storylines |
| **④ Prose Writing** | "Write chapter 1" | Generate chapter prose based on outlines and context |

**Why this order?**
- Entity libraries (characters, scenes, etc.) depend on world settings but not on plot. Building them first lets you reference specific characters and scenes when designing storylines
- Storyline design needs to know which characters and scenes are available to arrange reasonable plot events
- Chapter outlines are essentially "assigning storyline events to specific chapters" — they need storyline data first
- Prose writing depends on chapter outlines and preceding chapter content

Of course, creation is not a strictly linear process. You can always go back to a previous phase — for example, if you realize you need a new character while writing a chapter, just create one. The order above is a best practice for starting from scratch.

## Human-AI Collaborative Writing

The AI Assistant on the right is your full-cycle creative partner. It supports **Agent mode** (can directly manipulate modules and content) and **Ask mode** (conversation only), covering everything from worldbuilding to prose writing.

### Worldbuilding

Using natural language commands, the AI can create and refine characters, scenes, organizations, props, and other modules. For example, type "Create a morally ambiguous sword cultivator character" and the AI will generate structured content based on the module Schema for your confirmation. You can also ask the AI to modify existing module attributes at any time.

### Chapter Writing

Select a chapter node to enter the text editor. Write directly or let the AI assist:
- **AI Continue**: The AI generates paragraphs or entire chapters based on outlines, participating entities, and context, streaming in real-time for your confirmation.
- **AI Polish**: Select text and let the AI refine the wording and expression.
- **AI Modify**: The AI locates specific passages for replacement or insertion, with a diff preview in the editor for your review.

### Information Extraction & Maintenance

After writing a chapter, use the editor toolbar's automated tools to let the AI continuously maintain your novel's structured data:
- **Extract Entities**: Automatically identify characters, scenes, and props that appear in the chapter, updating the participating entities list.
- **Extract Relations**: Analyze character interactions in the text, automatically creating or updating relationship nodes in the relation graph.
- **Extract Dynamic Info**: Capture character state changes within the chapter (emotions, injuries, power-ups, etc.), updating dynamic profiles.
- **Plot Organization**: Organize plot events from the chapter, updating storylines and plot progression.

### Quality Assessment

- **Quality Check**: The AI evaluates chapter writing quality across multiple dimensions and provides improvement suggestions.
- **Style Check**: Detects writing style consistency and flags passages that deviate from the overall tone.
- **Plot Analysis**: Analyzes plot structure for logical soundness and identifies potential plot holes.

### Foreshadowing Management

The AI can help you plant and track foreshadowing. Ask anytime — "What unresolved foreshadowing is there?" — and the AI will answer based on the full text, ensuring no narrative threads are lost.
        `,
    quickLinks: [
      {
        title: "Best Practices",
        description: "Explore novel creation best practices",
        path: "/docs/en/best-practices",
        icon: "arrow",
      },
    ],
  },
  "best-practices": {
    breadcrumb: "Quick Start",
    title: "Novel Creation Best Practices",
    description:
      "Maximize your creative efficiency with Qritor. Master the core workflows to seamlessly integrate artificial intelligence into your writing process.",
    body: `
Before diving into the prose of your novel, we highly recommend following these best practices. These guidelines will help you build solid worldbuilding, maintain narrative continuity, and unleash the full potential of Qritor's Agentic AI assistant.

## 1. Choose the Right Creation Method

Don't just pick a random genre and start. A great foundation is essential. The moment you click "New Novel," selecting a **[Novel Creation Method](/docs/en/user-guide/creation/creation-methods)** that perfectly aligns with your vision is critical.

![Novel Creation Methods](/images/docs/examples/creation-method.png)

In Qritor, different creation methods (e.g., Infinite Genre, Cultivation, Post-Apocalyptic, Suspense) are not just superficial tags. They **pre-configure completely different core settings and module structures at the foundation level**. This determines the skeletal framework your entire novel project will have.
- If you write a Cultivation novel and pick the "Cultivation" method, the system will automatically prepare specialized modules like "Spiritual Roots," "Cultivation Realms," "Techniques," and "Sects."
- If you write a Suspense novel and pick the "Suspense" method, the system swaps these out for structures like "Clues," "Cases," and "Suspect Profiles."

Before creating a project, we recommend browsing the descriptions under the **"Novel Creation Methods"** section in the sidebar. Choosing the right method ensures the AI uses the correct context and precise logic when helping you "Initialize Settings" and flesh out the story later, avoiding off-genre mismatches.

## 2. Architecture Before Content

Resist the urge to start typing the manuscript immediately.

- **Initialize the Framework**: You can start the **[setting initialization](/docs/en/user-guide/novel-settings)** process in the AI Assistant using one of three methods:
  1. **Shortcut Button**: Click the magic wand icon (Initialization button) on the left side of the input field, which will automatically send "Please initialize the novel settings".
  2. **Slash Command**: Type and send \`/novel-initialization\` in the input field.
  3. **Natural Language**: Directly type and send a message like "Please initialize the novel settings".

  ![Initialize Novel Settings](/images/docs/novel-init-en.png)

  **Case Study: From Generic Concept to Custom Masterpiece**

  The initial generation is often just the beginning. To make your story truly stand out, **we strongly recommend having multiple rounds of discussion with the AI, continuously polishing your settings until you are fully satisfied**. Converse with it as you would with a human creative editor.
  
  **Step 1: Start Initialization**
  By sending the initialization command, the AI begins its structured thought process and loads the specific skills for your chosen creation method.
  ![Initialize Settings](/images/docs/examples/novel-setting1.png)
  
  **Step 2: Review the First Draft**
  The AI generates a structurally complete but completely serious historical time-travel setting (e.g., saving the falling Ming Dynasty as Emperor Chongzhen).
  ![First Draft](/images/docs/examples/novel-setting2.png)
  
  **Step 3: Adjust Tone and Style**
  You feel the drama is too heavy, so you tell the AI: "I want a fast-paced, humorous tone." The AI instantly restructures the atmospheric tone, language style, and shifts the narrative to a comedic first-person perspective.
  ![Adjust Tone](/images/docs/examples/novel-setting3.png)
  
  **Step 4: Create Character Contrast**
  You note that the protagonist is too cliché: "The time-traveler is too generic, it needs to be more eye-catching." Adapting to the new comedic tone, the AI shifts the protagonist's pre-travel identity to a "notorious online success-guru/grifter," turning the court into a massive live-stream marketing event.
  ![Enhance Character Contrast](/images/docs/examples/novel-setting4.png)
  
  **Step 5: Change the Possession Target**
  You push further: "The historical figure being possessed isn't interesting enough." The AI jumps across dynasties, replacing Emperor Chongzhen with the most famously incompetent ruler in Chinese history, Liu Shan from the Three Kingdoms era, creating an absurd narrative conflict.
  ![Change Possession Target](/images/docs/examples/novel-setting5.png)
  
  **Step 6: Ground with Reality to Control Pacing**
  Noticing the plot getting too chaotic, you instruct: "This is getting too absurd. It needs to adapt actual historical battles from the Three Kingdoms." The AI brilliantly obliges, maintaining the comedy by having the protagonist sell absurd "VIP defense subscriptions" during the very real historical Battle of Shiting.
  ![Integrate Historical Battles](/images/docs/examples/novel-setting6.png)

  Through this step-by-step iterative brainstorming, a conventional trope is molded into a highly engaging and unique narrative foundation. Once the AI deeply understands this finalized, detailed blueprint, the ensuing prose writing will flow naturally and stay perfectly on character.

## 3. Execute Character and Entity Initialization

Once you have locked in your overarching worldview and settings with the AI, your immediate next step is entity initialization. Use commands like \`/character-initialization\` and \`/scene-initialization\` to let the AI batch-generate **[key characters](/docs/en/user-guide/characters)** and **[major scenes](/docs/en/user-guide/scenes)** deduced directly from your newly established blueprint. These entity modules are not merely notes; they are the sole reference points for the RAG engine when generating contextual prose later.

> 💡 **Tip**: The more detailed your entity descriptions and relations are, the more fleshed out the AI's later writing will be—minimizing "Out Of Character" (OOC) occurrences.

## 4. Outlines Drive Chapters

Before officially writing a new chapter, it is critical to **build an outline**.

- Establish a clear **[storyline](/docs/en/user-guide/plot-management)** in Qritor, distributing key plot events entirely into specific chapters.
- Select your chapter and use the "Outline" feature to briefly summarize the core conflict and direction in a few sentences. This acts as the primary guiding light (aside from existing text) for the AI when helping you continue or polish your writing.

## 5. Human-AI Symbiosis

Qritor features two distinct assistant modes: **[Agent](/docs/en/user-guide/ai-modes)** and **[Ask](/docs/en/user-guide/ai-modes)**. Swapping between these appropriately makes for a highly comfortable writing experience.

- **Use Agent Mode**: Switch to this mode when you need the AI to actively create, modify, or delete modules and content. Avoid manually updating dozens of character traits—simply instruct the Agent to make these edits.
- **Use Ask Mode**: Use this mode when seeking inspiration, bouncing off setting ideas, or checking on unresolved foreshadowing. This prevents the AI from unintentionally modifying your novel's structure.

## 6. Automated Maintenance

Don't rely on your brain to remember every thread in a million-word novel.

- **After writing a chapter or two, click the [extraction tools](/docs/en/user-guide/editor-toolbar)** in the editor toolbar, such as Extract Entities, Extract Relations, or **[Extract Dynamic Info](/docs/en/user-guide/dynamic-info)**. Let the platform track what magical artifact a character acquired, what injuries they suffered, or how their feelings shifted within the latest plot developments.
- **This habit of "archiving"** is crucial for replacing memory load with system memory, eliminating continuity errors in long serialized fiction.
        `,
    quickLinks: [
      {
        title: "Create Novel",
        description: "Start creating your first novel",
        path: "/docs/en/user-guide/creation/novel-create",
        icon: "arrow",
      },
    ],
  },
};
