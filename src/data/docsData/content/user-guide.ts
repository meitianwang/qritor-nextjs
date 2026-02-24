import type { DocsContentEntry } from '../types'

// ============== 用户指南 ==============

export const zhUserGuideContent: Record<string, DocsContentEntry> = {
    creation: {
        title: '创作功能',
        body: `
Qritor 的创作核心围绕 **"工程化写作"** 理念设计。

## 小说管理
在侧边栏的「小说」页面，您可以管理所有的作品。创建作品时，最重要的一步是选择 **创作方法**。
- 创作方法按小说题材分类（穿越、末世、灵异等），每种方法预定义了适合该题材的模块类型和结构。
- 选择创作方法后，系统会根据方法中定义的单例模块自动生成初始模块。

## 模块化编辑
不同于传统写作软件的线性文档，Qritor 将一个作品拆分为多个 **模块 (Module)**。
- **模块树**：在左侧，您可以创建章节、分卷、角色卡、地理设定等任何类型的节点。
- **Tab页签**：中间的工作区支持多开 Tab，您可以同时打开大纲和正文，对照写作。
- **模块库**：如果不习惯树状结构，可以在 "Library" 视图中以卡片形式查看所有模块。
        `
    },
    'novel-create': {
        title: '创建小说',
        body: `
## 新建小说
在「小说」页面点击右上角的 **「新建小说」** 按钮，填写基础信息：
- **作品名称**：输入作品标题。
- **创作方法**：从下拉列表中选择。创作方法决定了作品拥有哪些模块类型（如角色卡、场景、道具等），系统会根据方法中的单例模块自动生成初始结构。
- **简介**（可选）：输入作品简介，帮助 AI 理解您的创作意图。

## 管理作品
- **进入编辑**：点击作品卡片进入编辑器。
- **删除作品**：在作品卡片上右键或点击菜单按钮，选择删除。
- **搜索作品**：使用顶部搜索栏快速定位作品。
        `
    },
    'chapter-edit': {
        title: '章节编辑',
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
- **更多工具**：详见 [编辑器工具栏](/docs/zh/user-guide/ai-assistant/editor-toolbar)。
        `
    },
    'module-tree': {
        title: '模块树操作',
        body: `
## 模块树介绍
模块树是 Qritor 的核心组织结构，用于管理您作品的所有内容节点。

## 基本操作
- **创建模块**：点击模块树顶部的 "+" 按钮，或在父模块上右键选择"添加子模块"。
- **选择类型**：根据创作方法，可选择章节、角色卡、设定等不同类型。
- **重命名**：双击模块名称，或右键选择"重命名"。
- **删除模块**：右键选择"删除"，会递归删除所有子模块。

## 高级功能
- **拖拽排序**：按住模块拖动可调整顺序或层级关系。
- **展开/折叠**：点击箭头图标可展开或折叠子树。
- **右键菜单**：提供创建、重命名、删除等快捷操作。
        `
    },
    'ai-assistant': {
        title: 'AI 助手',
        body: `
Qritor 的 AI 助手拥有 **上下文感知 (Context Awareness)** 能力。

## 核心功能
- **智能问答 (RAG)**：AI 会实时读取当前作品的所有模块内容。您可以问它："主角的佩剑叫什么名字？"，它会从设定集中查找答案。
- **一键续写**：在卡文时，点击助手栏的 "续写" 按钮，AI 会根据前文逻辑生成后续发展。
- **文笔润色**：选中一段文字，让 AI 优化修辞或转换风格。

## 唤起方式
- AI 助手面板默认开启，位于编辑器右侧。
        `
    },
    'ai-mention': {
        title: '@提及',
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
        `
    },
    'chat-history': {
        title: '对话历史',
        body: `
## 功能说明
AI 助手会保存您的对话历史，方便随时回顾和继续。

## 操作方式
- **查看历史**：点击 AI 助手顶部的时钟图标。
- **加载对话**：点击历史记录中的某个会话，继续之前的对话。
- **新建对话**：点击 "+" 按钮开始新的对话。
- **删除对话**：在历史列表中滑动或右键删除不需要的记录。

## 注意事项
- 每个作品的对话历史独立保存。
- 对话历史存储在本地数据库中。
        `
    },
    'smart-write': {
        title: '智能写作工具',
        body: `
## 功能概述
智能写作工具是 AI 助手的核心能力，帮助您突破创作瓶颈。

## 续写 (Continue)
- **触发方式**：将光标放在段落末尾，点击工具栏的"续写"按钮。
- **效果**：AI 会根据前文语境、章节大纲、参与实体的设定信息，自动生成后续内容。
- 生成的内容以流式传输实时呈现，完成后您可以确认或拒绝。

## 润色 (Polish)
- **触发方式**：选中需要润色的文本，点击"润色"按钮。
- **效果**：AI 会优化措辞、增强文采，同时保持原意。
- 修改会以差异对比形式展示，您可以确认或拒绝。

## AI 写作模式

当您让 AI **从零生成整章内容**时（例如通过 Agent 模式对话），编辑器进入写作模式：
1. AI 以流式传输生成内容，您可以实时看到文字出现。
2. 生成完成后，内容以预览形式展示。
3. 点击 **确认** 接受内容写入章节，或 **拒绝** 放弃。

## AI 修改模式

当 AI **修改已有章节内容**时，编辑器进入修改模式：
1. AI 精确定位需要修改的段落，进行替换或插入操作。
2. 编辑器显示**差异对比视图**：
   - 绿色标记：新增内容
   - 红色标记：删除内容
3. 底部展示修改统计（新增/删除字数）。
4. 点击 **确认** 应用修改，或 **拒绝** 恢复原文。

## 更多工具

编辑器工具栏还提供了提取实体、提取关系、文风检测、质量评估等更多 AI 工具。详见 [编辑器工具栏](/docs/zh/user-guide/ai-assistant/editor-toolbar)。
        `
    },
    'knowledge-base': {
        title: '世界观管理',
        body: `
Qritor 提供了一整套**世界观管理**工具，帮助您系统化地构建和维护小说的世界观。

## 核心理念

长篇小说的世界观往往庞大而复杂。Qritor 将世界观拆解为三个维度来管理：

### 实体 — "有什么"
您作品中的所有角色、场景、组织、道具、设定等，都以**模块**的形式存在。每个模块有结构化的字段，让信息井然有序。

### 关系 — "怎么连"
实体之间的关系通过**关系图谱**可视化展示。角色之间的敌对、同盟、师徒关系，组织之间的隶属关系，一目了然。

### 变化 — "如何演"
实体的状态随剧情发展而变化。**动态信息**系统追踪每个实体在不同章节中的状态变迁，确保前后一致。

## AI 自动维护

最强大的特性是：您**不需要手动维护**这一切。

1. 编写章节正文时，使用编辑器工具栏的"提取"系列工具。
2. AI 自动从文本中识别新实体、新关系、状态变化。
3. 确认后一键写入数据库。

您的世界观会随着创作自然生长，始终与最新内容保持同步。
        `
    },
    'entity-types': {
        title: '实体类型',
        body: `
## 概述

Qritor 将小说世界观中的一切事物组织为**实体**，每种实体类型有特定的属性字段。实体在模块树中按分类分组显示。

## 内置实体类型

### 角色 (Character)
- **定义**：小说中的具有能动性的人物或生物。
- **典型字段**：姓名、年龄、性别、性格特征、外貌描写、背景故事。
- **在模块树中**：归入"角色库"分组。

### 场景 (Scene)
- **定义**：故事发生的地理位置、空间或环境。
- **典型字段**：名称、地理位置、环境描述、氛围、历史背景。
- **在模块树中**：归入"场景库"分组。
- **层级关系**：场景可以有包含关系（如 王国 → 城市 → 酒馆）。

### 组织 (Organization)
- **定义**：由多个角色组成的团体，如门派、国家、帮派、商会等。
- **典型字段**：名称、宗旨、规模、主要成员、势力范围。
- **在模块树中**：归入"组织库"分组。
- **复杂关系**：组织之间往往存在外交、战争或贸易关系。

### 道具 (Prop)
- **定义**：具有特殊意义或功能的物体，如武器、法宝、信物等。
- **典型字段**：名称、类型、功能描述、持有人、来历。
- **在模块树中**：归入"道具库"分组。

### 设定 (Setting)
- **定义**：世界观层面的规则和背景，如魔法体系、修炼等级、历史纪元等。
- **典型字段**：根据创作方法自定义。
- **在模块树中**：归入"设定"分组。

### 章节 (Chapter)
- **定义**：小说的章节内容。
- **特殊性**：章节模块使用专用的文本编辑器，而非表单界面。
- **在模块树中**：归入"章节"分组。

## 自定义类型

在**创作方法**中，您可以完全自定义实体类型：
1. **定义新类型**：例如"功法"、"魔兽"、"时间线事件"、"阵法"等。
2. **定制字段**：为每种类型设计专属的表单字段（文本、数字、下拉选择等）。
3. **AI 生成**：为自定义类型配置 AI 提示，让 AI 辅助生成内容。

不同的创作方法预设了不同的实体类型组合，适配不同的小说题材（玄幻、悬疑、修仙、言情等）。
        `
    },
    'module-edit': {
        title: '模块编辑',
        body: `
## 概述

在 Qritor 中，**非章节模块**（角色、场景、组织、道具、设定等）通过**表单界面**进行编辑。每种模块类型都有由创作方法预定义的字段结构，系统会根据 JSON Schema 自动生成对应的编辑表单。

## 打开模块编辑

在模块树中点击任意非章节模块，中间工作区会自动切换到该模块的编辑界面。

## 三个 Tab 页签

模块编辑界面分为三个 Tab：

### 信息 (Info)
主要的内容编辑区域。
- 系统根据模块类型的 JSON Schema 自动生成表单字段。
- 常见字段类型：文本输入、多行文本、数字、下拉选择、布尔开关等。
- 例如"角色"模块可能包含：姓名、年龄、性别、性格描述、外貌特征、背景故事等字段。
- 修改后自动保存。

### 动态信息 (Dynamic Info)
追踪该实体随剧情发展的状态变化。
- 记录"在第 X 章，该角色发生了什么变化"。
- 例如：角色在第 3 章受伤，第 5 章恢复；势力在第 8 章灭亡。
- 可手动添加，也可由 AI 从正文中自动提取。
- 详见 [动态信息](/docs/zh/user-guide/worldbuilding/dynamic-info) 页面。

### 关系 (Relations)
查看该实体与其他实体之间的关系。
- 显示以当前实体为中心的关系子图。
- 可直接查看关联的角色、组织、场景等。
- 详见 [关系图谱](/docs/zh/user-guide/worldbuilding/relation-graph) 页面。

## AI 辅助填写

如果模块类型启用了 AI 生成，您可以：
1. 在 AI 助手中使用 **Agent 模式**。
2. 让 AI 根据上下文自动填充模块字段。
3. 也可以使用编辑器工具栏的"提取实体"功能，从已写好的章节中自动提取信息到模块中。
        `
    },
    'ai-modes': {
        title: 'AI 模式',
        body: `
## 两种工作模式

Qritor 的 AI 助手提供两种工作模式，适用于不同场景：

### Agent 模式

**默认模式**。AI 不仅可以回答问题，还能**直接执行操作**。

AI 在 Agent 模式下可以：
- **章节操作**：创建章节、修改章节内容、更新章节标题、删除章节
- **实体管理**：创建/更新/删除角色、场景、组织、道具等模块
- **内容搜索**：全文搜索、跨章节搜索、章节内搜索
- **关系管理**：创建/更新/删除实体之间的关系
- **剧情管理**：创建剧情事件、管理故事线、处理伏笔
- **动态信息**：更新实体的状态变化记录
- **智能写作**：直接在编辑器中进行续写和修改

适合需要 AI 帮你"动手"的场景，例如："帮我创建一个反派角色"、"把第三章的结尾改得更紧张"。

### 问答模式 (Ask)

AI **只回答问题，不执行任何操作**。

适用于：
- **头脑风暴**：讨论剧情走向、人物设计。
- **分析咨询**：让 AI 分析情节逻辑、指出矛盾。
- **灵感探索**：自由对话，不担心 AI 误操作。

适合只想聊天讨论、不想让 AI 改动任何内容的场景。

## 如何切换

在 AI 助手输入框左侧，点击模式切换按钮即可在两种模式间切换。
- **Agent**：显示为 Agent 标签
- **Ask**：显示为 Ask 标签
        `
    },
    'editor-toolbar': {
        title: '编辑器工具栏',
        body: `
## 概述

当您选中一个**章节模块**并进入编辑器视图时，顶部会显示一排工具栏按钮。这些工具覆盖了章节编辑的方方面面。

## 写作工具

### 续写
AI 根据前文内容自动生成后续段落。将光标放在文本末尾，点击"续写"按钮即可。

### 润色
选中一段文本后，点击"润色"按钮，AI 会优化措辞和文采，同时保持原意。

## 章节管理工具

### 大纲
打开章节大纲编辑弹窗，为当前章节编写摘要或提纲。大纲内容会作为 AI 理解章节意图的重要上下文。

### 参与实体
管理当前章节中出场的角色、场景、道具等。
- 打开弹窗后可以勾选哪些实体在本章登场。
- 选中的实体信息会自动传递给 AI，提供更精准的创作辅助。

## AI 提取工具

这一组工具让 AI **从已写好的章节正文中自动识别和提取结构化信息**，发送到 AI 助手进行处理。

### 提取实体
AI 分析正文，识别出新出现的角色、场景、组织、道具等，提取为结构化数据。您可以一键将提取结果应用到模块中。

### 提取动态信息
AI 识别正文中实体状态的变化（如角色受伤、获得新能力、关系转变等），提取为时间线记录。

### 提取关系
AI 识别正文中人物之间的关系（如敌对、同盟、师徒等），提取为关系数据，可直接写入知识图谱。

## 分析工具

### 剧情整理
打开剧情事件编辑器，查看和管理当前章节关联的剧情事件。详见 [故事线与事件](/docs/zh/user-guide/plot-management/storylines)。

### 文风检测
AI 分析当前章节的写作风格，检查与全书整体风格是否一致，并给出调整建议。

### 质量评估
AI 对当前章节进行综合质量评估，从情节逻辑、人物塑造、节奏把控、文笔水平等维度给出评分和改进建议。
        `
    },
    worldbuilding: {
        title: '世界观管理',
        body: `
Qritor 提供了一整套**世界观管理**工具，帮助您系统化地构建和维护小说的世界观。

## 核心理念

长篇小说的世界观往往庞大而复杂。Qritor 将世界观拆解为三个维度来管理：

### 实体 — "有什么"
您作品中的所有角色、场景、组织、道具、设定等，都以**模块**的形式存在。每个模块有结构化的字段，让信息井然有序。

### 关系 — "怎么连"
实体之间的关系通过**关系图谱**可视化展示。角色之间的敌对、同盟、师徒关系，组织之间的隶属关系，一目了然。

### 变化 — "如何演"
实体的状态随剧情发展而变化。**动态信息**系统追踪每个实体在不同章节中的状态变迁，确保前后一致。

## AI 自动维护

最强大的特性是：您**不需要手动维护**这一切。

1. 编写章节正文时，使用编辑器工具栏的"提取"系列工具。
2. AI 自动从文本中识别新实体、新关系、状态变化。
3. 确认后一键写入数据库。

您的世界观会随着创作自然生长，始终与最新内容保持同步。
        `
    },
    'relation-graph': {
        title: '关系图谱',
        body: `
## 概述

关系图谱以可视化的网络图展示作品中所有实体之间的关系。切换到编辑器底部的 **"关系图谱"** Tab 即可查看。

## 交互操作

- **缩放**：使用鼠标滚轮放大或缩小视图。
- **平移**：按住鼠标左键拖拽画布。
- **移动节点**：拖拽单个节点调整布局。
- **查看详情**：点击节点查看实体信息，点击连线查看关系描述。
- **适应视图**：使用底部控制栏的"适应视图"按钮，让图谱自动缩放以显示全部内容。

## 关系类型

图谱使用颜色编码区分不同的关系类型：

| 关系 | 颜色 | 说明 |
|------|------|------|
| **亲属** | <span style="color:#ec4899">■</span> 粉色 | 血缘、家族关系 |
| **同盟** | <span style="color:#22c55e">■</span> 绿色 | 联盟、合作关系 |
| **敌对** | <span style="color:#ef4444">■</span> 红色 | 冲突、对立关系 |
| **师徒** | <span style="color:#a855f7">■</span> 紫色 | 传承、指导关系 |
| **位于** | <span style="color:#3b82f6">■</span> 蓝色 | 地理位置关系 |
| **隶属** | <span style="color:#eab308">■</span> 黄色 | 从属、雇用关系 |
| **恋人** | <span style="color:#f43f5e">■</span> 玫红 | 恋爱、婚姻关系 |
| **朋友** | <span style="color:#14b8a6">■</span> 青色 | 友好关系 |
| **其他** | <span style="color:#6b7280">■</span> 灰色 | 未分类的关系 |

## 关系的创建方式

### AI 自动提取
在章节编辑器中使用工具栏的"提取关系"按钮，AI 会从正文中自动识别人物关系并生成结构化数据。确认后即可写入图谱。

### AI Agent 操作
在 Agent 模式下，您可以直接告诉 AI："把张三和李四设为师徒关系"，AI 会自动执行。

### 手动创建
在模块编辑界面的"关系"Tab 中，也可以手动添加关系。
        `
    },
    'dynamic-info': {
        title: '动态信息',
        body: `
## 什么是动态信息

在长篇小说中，角色和事物的状态会随着剧情不断变化。比如：
- 角色在第 3 章受了重伤
- 某个组织在第 8 章被瓦解
- 一件神器在第 12 章被损毁

**动态信息**系统专门追踪这些变化，让 AI 和您自己都能清楚知道"在故事的某个时间点，这个实体是什么状态"。

## 查看方式

### 模块编辑 — 动态信息 Tab
在模块编辑界面切换到"动态信息"Tab，可以看到该实体所有的状态变化记录，按时间线排列。

### 状态历史面板
在编辑器底部的"状态历史"Tab 中，可以查看全局的状态变化总览。

## 记录内容

每条动态信息包含：
- **变化描述**：发生了什么（如"左臂受伤"）
- **关联章节**：在哪一章发生的
- **影响字段**：哪个属性发生了变化

## 创建方式

### AI 自动提取
在章节编辑器中使用"提取动态信息"工具，AI 会分析正文，自动识别实体状态的变化并生成记录。

### AI Agent 操作
在 Agent 模式下告诉 AI："记录一下张三在这一章失去了内力"，AI 会自动创建动态信息。

### 手动添加
在模块的"动态信息"Tab 中手动添加记录。

## 对 AI 创作的意义

动态信息是 AI 上下文感知的重要组成部分。当 AI 续写后续章节时，它会读取相关角色的最新状态，避免出现"已经受伤的角色突然生龙活虎"这类逻辑矛盾。
        `
    },
    'plot-management': {
        title: '剧情管理',
        body: `
Qritor 提供了专业的**剧情管理**工具，帮助您从宏观层面把控故事的节奏和结构。

## 核心功能

### 故事线管理
将复杂的剧情拆分为多条故事线（主线、感情线、副线等），分别管理和追踪进展。

### 剧情事件追踪
为每一章标记关键的剧情事件，区分事件类型（转折、高潮、伏笔等），建立事件与章节的双向关联。

### 伏笔系统
创建和追踪伏笔，确保每个埋下的伏笔都能在后续章节中被妥善回收。

## 打开方式

- 在编辑器底部的 Tab 栏中，点击 **"剧情历史"** 即可打开剧情管理面板。
- 在章节编辑器工具栏中，点击 **"剧情整理"** 可查看当前章节关联的事件。
        `
    },
    storylines: {
        title: '故事线与事件',
        body: `
## 故事线管理

### 什么是故事线
故事线是对小说剧情的宏观划分。一部长篇小说通常包含多条并行或交织的故事线，例如：
- **主线**：核心冲突的推进
- **感情线**：角色间的情感发展
- **副线**：支线剧情、配角故事

### 操作方式
- **创建故事线**：在剧情管理面板中点击"新建故事线"。
- **编辑故事线**：修改名称或描述。
- **删除故事线**：移除不再需要的故事线（其下的事件不会被删除）。

## 剧情事件

### 什么是剧情事件
剧情事件是故事中的关键节点。每个事件关联到一个特定的章节，并归属于某条故事线。

### 事件类型

| 类型 | 说明 | 适用场景 |
|------|------|---------|
| **普通** | 常规剧情推进 | 日常情节、过渡段落 |
| **转折点** | 剧情方向发生重大变化 | 背叛、意外发现、身份揭露 |
| **高潮** | 故事的紧张顶点 | 决战、最终对峙、情感爆发 |
| **结局** | 某条线索的收束 | 谜题解开、冲突化解 |
| **伏笔** | 为后续发展埋下线索 | 暗示、预兆、看似无关的细节 |

### 创建事件
1. 在剧情管理面板中点击"新建事件"。
2. 选择事件类型和所属故事线。
3. 关联到对应的章节。
4. 填写事件描述。

也可以在章节编辑器的"剧情整理"工具中直接创建。

## 筛选与查看

- **按故事线筛选**：只显示某条故事线的事件。
- **按章节筛选**：只显示某章的事件。
- **只看伏笔**：筛选出所有伏笔类型的事件，快速检查回收情况。
        `
    },
    foreshadowing: {
        title: '伏笔系统',
        body: `
## 什么是伏笔系统

伏笔是长篇小说的灵魂。Qritor 提供了专门的伏笔管理工具，帮您追踪每一个埋下的种子，确保不会遗忘。

## 伏笔状态

每个伏笔有两种状态：
- **待回收**：已埋下但尚未揭示的伏笔。
- **已回收**：已在后续章节中回收/揭示的伏笔。

## 创建伏笔

### 方式一：创建剧情事件时标记
在创建剧情事件时，选择事件类型为"伏笔"。系统会自动将其加入伏笔追踪列表。

### 方式二：AI 辅助识别
在 Agent 模式下，AI 可以帮您识别文中潜在的伏笔，或主动创建伏笔记录。

## 回收伏笔

当后续章节揭示了某个伏笔时：
1. 在剧情管理面板中找到该伏笔。
2. 点击"回收"按钮。
3. 选择在哪一章进行了回收。
4. 伏笔状态变为"已回收"。

## 伏笔检查

在剧情管理面板中，使用"只看伏笔"筛选，可以一览所有伏笔的状态：
- 哪些伏笔还未回收？
- 是否有遗忘的伏笔？
- 伏笔分布是否合理？

这对于长篇连载尤为重要，可以避免"挖坑不填"的问题。
        `
    },
    skills: {
        title: '技能',
        description: '技能（Skill）是 Qritor 中可复用的 AI 知识模块，让 AI 助手在特定创作场景下具备专业能力。',
        body: `
## 什么是技能

技能是一段预置的 **AI 指令集**，包含特定创作任务的流程、规则和领域知识。当技能被加载后，AI 助手会按照技能中定义的步骤执行任务，无需你逐步指导。

例如，加载 \`/novel-initialization\` 技能后，AI 会自动遍历所有设定模块、加载专属生成技能、逐个填充结构化内容——整个流程由技能编排，你只需审阅确认。

## 运作方式

技能系统分为三个阶段：

1. **注册**：应用启动时，从本地数据库加载所有可用技能的名称和描述，注入 AI 助手的系统提示词中。
2. **匹配**：当你的请求与某个技能的描述匹配时，AI 会自动调用该技能；你也可以通过 \`/技能名\` 手动触发。
3. **执行**：AI 获取技能的完整指令，按照指令中定义的流程调用工具、生成内容。

## 技能的来源

技能由 Qritor 团队维护，存储在云端。桌面客户端登录后会自动同步最新技能到本地。你可以在侧边栏的 **「小说创作方法」** 页面点击 **「同步」** 按钮手动更新。

技能按作用范围分为以下粒度：

| 粒度 | 说明 | 状态 |
|------|------|------|
| **全局技能** | 适用于所有项目，如章节操作、角色操作、剧情设计等 | 已上线 |
| **方法专属技能** | 绑定到特定创作方法（如「古代架空穿越」），仅在使用该方法的小说中可用 | 已上线 |
| **项目级技能** | 绑定到单个小说项目，针对该项目的特定需求定制 | 即将推出 |

## 使用方式

### 手动触发

在 AI 助手输入框中输入 \`/\` 加技能名称即可触发。输入 \`/\` 后会弹出技能选择器，支持模糊搜索。

**示例**：
- \`/novel-initialization\` — 批量初始化所有设定模块
- \`/character-operations 创建一个亦正亦邪的剑修角色\` — 加载角色操作技能并执行指令

### 自动触发

AI 助手的系统提示词中包含所有可用技能的名称和描述。当你的请求与某个技能匹配时，AI 会通过 \`use_skill\` 工具自动加载对应技能，无需手动输入斜杠命令。

### 查看可用技能

输入 \`/\` 后，下拉列表会显示当前项目可用的所有技能。列表包含全局技能和当前创作方法的专属技能。

## 全局操作技能

以下技能全局可用，适用于所有项目：

| 技能 | 说明 |
|------|------|
| \`chapter-operations\` | 章节创建、续写、修改、删除等操作 |
| \`character-operations\` | 角色创建、编辑、批量管理 |
| \`scene-operations\` | 场景创建、编辑、层级管理 |
| \`prop-operations\` | 道具创建、编辑、管理 |
| \`organization-operations\` | 组织创建、编辑、成员管理 |
| \`outline-operations\` | 大纲编写和管理 |
| \`plot-design\` | 剧情结构设计与事件规划 |
| \`relationship-graph\` | 关系图谱维护与分析 |
| \`consistency-audit\` | 全文一致性审查 |

## 技能与 Agent 模式

技能在 **Agent 模式** 下运行。加载技能后，AI 助手可以调用所有可用工具（创建模块、修改内容、搜索章节等）来完成技能指令中定义的任务。

在 **Ask 模式** 下，技能仅作为知识参考，AI 不会执行任何操作。

## 常见问题

### 技能没有触发怎么办？
确保使用 Agent 模式，并检查技能名称拼写是否正确。如果手动触发，需要在消息开头输入 \`/技能名\`。

### 技能列表是空的？
请点击侧边栏「小说创作方法」页面的「同步」按钮，从云端同步最新技能。

### 技能和创作方法是什么关系？
创作方法定义了小说的模块类型和结构，技能则提供该方法下各模块的 AI 生成能力。选择创作方法后，对应的专属技能会自动可用。
        `
    },
    configuration: {
        title: '系统配置',
        body: `
## LLM 配置
在设置中可以配置 AI 模型参数：
- **API Base URL**：自定义 API 端点（兼容 OpenAI 格式）。
- **模型选择**：选择要使用的语言模型。
- **最大轮次**：AI 工具调用的最大轮数，控制与工具交互的深度。

## 自动更新
- **启用/禁用**：控制应用是否自动检查更新。
- **检查频率**：设置自动检查更新的时间间隔（默认为 6 小时）。

## 语言设置
切换界面语言，支持简体中文、繁体中文、英语、日语、韩语等 10+ 种语言。
        `
    },
    'ai-models': {
        title: 'AI 模型',
        description: 'Qritor 集成了多款顶尖 AI 语言模型，覆盖从经济实用到旗舰高能的全系需求，满足不同场景和预算的创作要求。',
        body: `
## 模型等级

Qritor 将 AI 模型划分为四个等级。等级越高，综合能力越强，积分消耗也相应增加。

| 等级 | 说明 |
|------|------|
| **经济型** | 性价比最高，适合日常续写、快速测试、短对话 |
| **标准型** | 能力均衡，适合常规中长篇创作 |
| **高级型** | 超强上下文，适合超长篇、全文风格控制 |
| **旗舰型** | 综合能力最强，适合高品质精品创作 |

---

## 经济型

### DeepSeek（默认模型）

DeepSeek V3.2 Thinking 是 Qritor 的**默认模型**，国产推理模型代表作。内置思维链（Chain-of-Thought）能力，在中文创作推理上表现出色，是性价比最高的选择。

- **特点**：思维链推理、中文优化、快速响应、富有创意
- **适合**：日常续写、剧情构思、角色对话
- **上下文窗口**：131K tokens
- **倍率**：0.4x / 0.6x

### GLM-4.7 Flash

智谱 AI 的轻量快速模型，响应速度极快，适合需要即时反馈的短任务。

- **特点**：极速响应、轻量高效、中文友好
- **适合**：快速测试、即时灵感、短对话
- **上下文窗口**：128K tokens
- **倍率**：0.3x / 0.5x

### MiniMax M2.5

MiniMax 的中文叙事专项模型，超长上下文配合叙事能力，擅长维护长篇创作的连贯性。

- **特点**：超长上下文、叙事连贯、中文优化
- **适合**：长篇章节续写、叙事一致性维护
- **上下文窗口**：200K tokens
- **倍率**：0.5x / 1.4x

---

## 标准型

### Gemini 3 Flash

Google 的快速大上下文模型，200K tokens 上下文，流式响应迅速，擅长长文档理解与生成。

- **特点**：大上下文、快速流式、多语言
- **适合**：全文参考续写、长章节生成
- **上下文窗口**：200K tokens
- **倍率**：0.7x / 3.5x

### Kimi K2.5

月之暗面（Moonshot AI）的创意对话模型，对中文语境理解深入，角色塑造能力出色。

- **特点**：中文对话自然、角色塑造、富有创意
- **适合**：角色设计、对话生成、情感描写
- **上下文窗口**：131K tokens
- **倍率**：0.8x / 3x

### GLM-5

智谱 AI 的中文叙事旗舰，风格稳定，输出质量高，是对文风一致性有要求时的首选。

- **特点**：风格稳定、中文叙事流畅、输出质量高
- **适合**：正式章节写作、需要稳定文风的场景
- **上下文窗口**：128K tokens
- **倍率**：1x / 3.2x

---

## 高级型

### Gemini 3.1 Pro

Google 最新旗舰模型，具备惊人的 **100 万 tokens** 超长上下文，可以将整部长篇小说都纳入单次对话，风格稳定，创意叙事能力突出。

- **特点**：100 万 tokens 超长上下文、风格稳定、创意叙事
- **适合**：百万字超长篇全文参考续写、全书风格一致性控制
- **上下文窗口**：1,000,000 tokens
- **倍率**：2x / 12x

---

## 旗舰型

### Claude Sonnet 4.6

Anthropic 旗舰中级模型，在创意写作领域表现顶尖。角色心理刻画细腻，情感层次丰富，文风稳定可控，是高品质创作的主力之选。

- **特点**：创意写作顶尖、角色塑造深入、风格精细控制
- **适合**：精品章节写作、复杂人物设计、高品质续写
- **上下文窗口**：200K tokens
- **倍率**：3x / 15x

### Claude Opus 4.6

Anthropic 最强旗舰模型，综合能力全面领先。在叙事深度、角色心理描写、文风把控方面均处于业界顶尖水平，适合追求文学质感的高要求创作。

- **特点**：全面最强、叙事深度、角色心理、文风极佳
- **适合**：高要求精品创作、复杂剧情设计、文学性写作
- **上下文窗口**：200K tokens
- **倍率**：5x / 25x

---

## 如何选择模型

| 场景 | 推荐模型 |
|------|---------|
| 日常续写，性价比优先 | DeepSeek（默认） |
| 快速测试和即时灵感 | GLM-4.7 Flash |
| 长篇叙事连贯性维护 | MiniMax M2.5 |
| 角色设计与对话生成 | Kimi K2.5 |
| 稳定文风写作 | GLM-5 |
| 百万字全文参考续写 | Gemini 3.1 Pro |
| 高品质精品章节 | Claude Sonnet 4.6 |
| 极致文学质感 | Claude Opus 4.6 |

## 倍率说明

模型选择器中每个模型名称右侧显示的 **输入倍率 / 输出倍率**，反映该模型相对的积分消耗比例——倍率越高，同等长度的文本消耗积分越多。

---

## 遇到网络错误时

AI 调用失败时，对话框中会显示错误提示。常见情况及处理方式如下：

| 错误提示 | 原因 | 处理方式 |
|---------|------|---------|
| 网络连接失败，请检查网络后重试 | 本地网络问题或服务器无法访问 | 检查网络，或切换到其他模型重试 |
| 网络连接超时，请检查网络后重试 | 请求超时，模型响应较慢 | 稍后重试，或切换到响应更快的模型 |
| AI 服务暂时不可用，请稍后再试 | 模型提供商服务器故障 | 切换到其他提供商的模型 |
| 所选模型不可用，请切换其他模型 | 当前模型已下线或暂停服务 | 在模型选择器中切换到其他模型 |

### 如何切换模型

遇到错误后，点击 AI 助手输入框左侧的**模型选择器**，选择其他模型即可继续创作。切换后的选择会自动保存，下次打开时沿用。

### 备用模型推荐

不同提供商独立运营，单一提供商故障不影响其他模型。遇到错误时，优先切换到不同提供商的模型：

- **DeepSeek / GLM 不可用**：切换到 Gemini 3 Flash 或 Kimi K2.5
- **Gemini 不可用**：切换到 DeepSeek 或 Claude 系列
- **Claude 不可用**：切换到 GLM-5 或 Gemini 3.1 Pro
        `
    },
}

export const enUserGuideContent: Record<string, DocsContentEntry> = {
    creation: {
        title: 'Creation Features',
        body: `
Qritor's core design philosophy is built around **"Engineering-based Writing"**.

## Novel Management
On the "Novels" page in the sidebar, you can manage all your works. When creating a novel, the most crucial step is selecting a **Creation Method**.
- Creation methods are organized by novel genre (time travel, post-apocalyptic, supernatural, etc.), each with predefined module types and structure for that genre.
- After selecting a method, the system will automatically generate initial modules based on the method's singleton module definitions.

## Modular Editing
Unlike linear document editors, Qritor breaks a work down into multiple **Modules**.
- **Module Tree**: On the left, you can create nodes of any type: chapters, volumes, character sheets, geographical settings, etc.
- **Tabs**: The center workspace supports multiple tabs, allowing you to open outlines and chapters side-by-side for reference.
- **Library**: If you prefer a non-tree view, the "Library" view shows all modules as cards.
        `
    },
    'novel-create': {
        title: 'Create Novel',
        body: `
## New Project
On the "Novels" page, click the **"New Novel"** button at the top right and fill in basic info:
- **Novel Name**: Enter the title of your work.
- **Creation Method**: Select from the dropdown. The creation method determines which module types your work will have (e.g., character sheets, scenes, props, etc.). The system will auto-generate initial modules based on the method's singleton definitions.
- **Description** (optional): Enter a brief description to help AI understand your creative intent.

## Managing Works
- **Open Editor**: Click a work card to enter the editor.
- **Delete Work**: Right-click or use the menu button on a work card to delete.
- **Search**: Use the search bar at the top to quickly locate a work.
        `
    },
    'chapter-edit': {
        title: 'Chapter Editing',
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
- **More Tools**: See [Editor Toolbar](/docs/en/user-guide/ai-assistant/editor-toolbar) for details.
        `
    },
    'module-tree': {
        title: 'Module Tree Operations',
        body: `
## Introduction
The Module Tree is Qritor's core organizational structure for managing all content nodes in your work.

## Basic Operations
- **Create Module**: Click the "+" button at the top of the tree, or right-click a parent module to select "Add Child".
- **Select Type**: Based on your creation method, you can choose chapters, character sheets, settings, etc.
- **Rename**: Double-click the module name, or right-click and select "Rename".
- **Delete**: Right-click and select "Delete". This will recursively delete all child modules.

## Advanced Features
- **Drag & Drop Sorting**: Hold and drag modules to reorder or change hierarchy.
- **Expand/Collapse**: Click the arrow icon to expand or collapse the subtree.
- **Context Menu**: Provides quick access to create, rename, and delete actions.
        `
    },
    'ai-assistant': {
        title: 'AI Assistant',
        body: `
Qritor's AI Assistant features **Context Awareness**.

## Core Features
- **RAG (Retrieval-Augmented Generation)**: The AI reads all module content in real-time. You can ask: "What is the protagonist's sword name?", and it will find the answer from your settings.
- **Smart Completion**: When stuck, click the "Continue" button in the assistant panel, and AI will generate the next part based on previous context.
- **Polishing**: Select text to have AI optimize rhetoric or change style.

## How to Invoke
- The AI Assistant panel is open by default on the right side of the editor.
        `
    },
    'ai-mention': {
        title: '@Mention',
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
        `
    },
    'chat-history': {
        title: 'Chat History',
        body: `
## Overview
The AI Assistant saves your conversation history for easy review and continuation.

## Operations
- **View History**: Click the clock icon at the top of the AI Assistant.
- **Load Conversation**: Click a session in the history to continue the previous chat.
- **New Conversation**: Click the "+" button to start a new chat.
- **Delete Conversation**: Swipe or right-click in the history list to delete unwanted records.

## Notes
- Conversation history is saved separately for each work.
- History is stored in the local database.
        `
    },
    'smart-write': {
        title: 'Smart Writing Tools',
        body: `
## Overview
Smart Writing Tools are the core capability of the AI Assistant, helping you overcome creative blocks.

## Continue
- **Trigger**: Place the cursor at the end of a paragraph, then click the "Continue" button in the toolbar.
- **Effect**: AI generates the next part based on previous context, chapter outline, and participant entity settings.
- Generated content streams in real-time; you can confirm or reject after completion.

## Polish
- **Trigger**: Select text that needs polishing, then click the "Polish" button.
- **Effect**: AI optimizes wording and enhances style while preserving the original meaning.
- Changes are displayed in a diff view; you can confirm or reject.

## AI Writing Mode

When you ask AI to **generate an entire chapter from scratch** (e.g., via Agent mode conversation), the editor enters Writing Mode:
1. AI streams content in real-time — you can watch text appear as it's generated.
2. After generation completes, content is displayed as a preview.
3. Click **Confirm** to accept and write to the chapter, or **Reject** to discard.

## AI Modify Mode

When AI **modifies existing chapter content**, the editor enters Modify Mode:
1. AI precisely locates passages to modify, performing replacements or insertions.
2. The editor displays a **diff view**:
   - Green highlights: Added content
   - Red highlights: Removed content
3. Modification statistics (words added/removed) are shown at the bottom.
4. Click **Confirm** to apply changes, or **Reject** to restore original text.

## More Tools

The editor toolbar also provides entity extraction, relation extraction, style checking, quality assessment, and more AI tools. See [Editor Toolbar](/docs/en/user-guide/ai-assistant/editor-toolbar) for details.
        `
    },
    'knowledge-base': {
        title: 'Worldbuilding',
        body: `
Qritor provides a complete set of **worldbuilding** tools to help you systematically build and maintain your novel's world.

## Core Philosophy

A long-form novel's worldbuilding is often vast and complex. Qritor manages worldbuilding across three dimensions:

### Entities — "What Exists"
All characters, scenes, organizations, props, and settings in your work exist as **modules**. Each module has structured fields to keep information organized.

### Relations — "How They Connect"
Relationships between entities are visualized through the **Relation Graph**. Hostile, alliance, and master-student relationships between characters, subordination between organizations — all at a glance.

### Changes — "How They Evolve"
Entity states change as the plot develops. The **Dynamic Info** system tracks each entity's state transitions across chapters, ensuring consistency.

## AI Auto-Maintenance

The most powerful feature: you **don't need to maintain** any of this manually.

1. While writing chapter text, use the "Extract" tools in the editor toolbar.
2. AI automatically identifies new entities, relationships, and state changes from the text.
3. Confirm and write to the database with one click.

Your worldbuilding grows naturally with your writing, always in sync with the latest content.
        `
    },
    'entity-types': {
        title: 'Entity Types',
        body: `
## Overview

Qritor organizes everything in your novel's world as **entities**. Each entity type has specific attribute fields. Entities are displayed grouped by category in the module tree.

## Built-in Entity Types

### Character
- **Definition**: People or beings with agency in your novel.
- **Typical Fields**: Name, Age, Gender, Personality, Appearance, Backstory.
- **In Module Tree**: Grouped under "Characters."

### Scene
- **Definition**: Geographical locations, spaces, or environments where the story takes place.
- **Typical Fields**: Name, Location, Environment Description, Atmosphere, Historical Background.
- **In Module Tree**: Grouped under "Scenes."
- **Hierarchy**: Scenes can have containment relationships (e.g., Kingdom → City → Tavern).

### Organization
- **Definition**: Groups composed of multiple characters, such as sects, nations, gangs, guilds, etc.
- **Typical Fields**: Name, Purpose, Scale, Key Members, Territory.
- **In Module Tree**: Grouped under "Organizations."
- **Complex Relations**: Organizations often have diplomatic, military, or trade relationships.

### Prop
- **Definition**: Objects with special significance or function, such as weapons, artifacts, tokens, etc.
- **Typical Fields**: Name, Type, Function Description, Owner, Origin.
- **In Module Tree**: Grouped under "Props."

### Setting
- **Definition**: World-level rules and background, such as magic systems, cultivation ranks, historical eras, etc.
- **Typical Fields**: Customized per creation method.
- **In Module Tree**: Grouped under "Settings."

### Chapter
- **Definition**: Story chapter content.
- **Special**: Chapter modules use a dedicated text editor rather than a form interface.
- **In Module Tree**: Grouped under "Chapters."

## Custom Types

In your **Creation Method**, you can fully customize entity types:
1. **Define New Types**: e.g., "Martial Arts Technique", "Magical Beast", "Timeline Event", "Formation", etc.
2. **Custom Fields**: Design dedicated form fields for each type (text, number, dropdown, etc.).
3. **AI Generation**: Configure AI prompts for custom types to enable AI-assisted content generation.

Different creation methods come with different entity type combinations, tailored for different novel genres (fantasy, mystery, cultivation, romance, etc.).
        `
    },
    'module-edit': {
        title: 'Module Editing',
        body: `
## Overview

In Qritor, **non-chapter modules** (characters, scenes, organizations, props, settings, etc.) are edited through a **form interface**. Each module type has a field structure predefined by the creation method, and the system automatically generates the corresponding edit form based on JSON Schema.

## Opening Module Editor

Click any non-chapter module in the module tree, and the center workspace will automatically switch to that module's editing interface.

## Three Tabs

The module editing interface is divided into three tabs:

### Info
The primary content editing area.
- The system generates form fields automatically based on the module type's JSON Schema.
- Common field types: text input, multi-line text, numbers, dropdowns, boolean toggles, etc.
- For example, a "Character" module might include: Name, Age, Gender, Personality, Appearance, Backstory, etc.
- Changes are auto-saved.

### Dynamic Info
Tracks how the entity's state changes as the plot progresses.
- Records "In Chapter X, what changed about this entity."
- Example: A character gets injured in Chapter 3, recovers in Chapter 5; an organization is dissolved in Chapter 8.
- Can be added manually or auto-extracted by AI from the text.
- See [Dynamic Info](/docs/en/user-guide/worldbuilding/dynamic-info) for details.

### Relations
View the relationships between this entity and others.
- Displays a relationship subgraph centered on the current entity.
- Directly see connected characters, organizations, scenes, etc.
- See [Relation Graph](/docs/en/user-guide/worldbuilding/relation-graph) for details.

## AI-Assisted Editing

If AI generation is enabled for the module type:
1. Use **Agent mode** in the AI Assistant.
2. Let AI automatically fill module fields based on context.
3. You can also use the "Extract Entities" tool in the editor toolbar to auto-extract information from written chapters into modules.
        `
    },
    'ai-modes': {
        title: 'AI Modes',
        body: `
## Two Working Modes

Qritor's AI Assistant offers two working modes for different scenarios:

### Agent Mode

**Default mode.** The AI can not only answer questions but also **directly execute operations**.

In Agent mode, AI can:
- **Chapter Operations**: Create chapters, modify content, update titles, delete chapters
- **Entity Management**: Create/update/delete characters, scenes, organizations, props, etc.
- **Content Search**: Full-text search, cross-chapter search, in-chapter search
- **Relation Management**: Create/update/delete relationships between entities
- **Plot Management**: Create plot events, manage storylines, handle foreshadowing
- **Dynamic Info**: Update entity state change records
- **Smart Writing**: Directly continue or modify content in the editor

Best for scenarios where you need AI to "take action," such as: "Create a villain character for me," or "Make the ending of Chapter 3 more tense."

### Ask Mode

The AI **only answers questions and does not execute any operations**.

Best for:
- **Brainstorming**: Discuss plot directions and character design.
- **Analysis**: Have AI analyze plot logic and identify inconsistencies.
- **Inspiration**: Free conversation without worrying about unintended changes.

Best for when you just want to chat and discuss without AI modifying any content.

## How to Switch

Click the mode toggle button on the left side of the AI Assistant input area to switch between modes.
- **Agent**: Displayed as an "Agent" label
- **Ask**: Displayed as an "Ask" label
        `
    },
    'editor-toolbar': {
        title: 'Editor Toolbar',
        body: `
## Overview

When you select a **chapter module** and enter the editor view, a toolbar appears at the top. These tools cover all aspects of chapter editing.

## Writing Tools

### Continue
AI generates the next paragraph based on previous content. Place your cursor at the end of the text and click the "Continue" button.

### Polish
Select a passage of text, then click "Polish." AI will optimize wording and enhance style while preserving the original meaning.

## Chapter Management Tools

### Outline
Opens a chapter outline editing modal to write a summary or outline for the current chapter. Outline content serves as important context for AI to understand the chapter's intent.

### Participants
Manage which characters, scenes, and props appear in the current chapter.
- Open the modal to check which entities appear in this chapter.
- Selected entity information is automatically passed to AI for more precise creative assistance.

## AI Extraction Tools

These tools let AI **automatically identify and extract structured information from written chapter text**, sending it to the AI Assistant for processing.

### Extract Entities
AI analyzes the text, identifies newly appeared characters, scenes, organizations, props, etc., and extracts them as structured data. You can apply the results to modules with one click.

### Extract Dynamic Info
AI identifies entity state changes in the text (e.g., character injuries, new abilities gained, relationship shifts), extracting them as timeline records.

### Extract Relations
AI identifies relationships between characters in the text (e.g., hostile, alliance, master-student), extracting them as relationship data that can be written directly to the knowledge graph.

## Analysis Tools

### Plot Organization
Opens the plot event editor to view and manage plot events associated with the current chapter. See [Storylines & Events](/docs/en/user-guide/plot-management/storylines).

### Style Check
AI analyzes the current chapter's writing style, checking consistency with the overall book style and providing adjustment suggestions.

### Quality Assessment
AI performs a comprehensive quality evaluation of the current chapter, scoring and suggesting improvements across dimensions like plot logic, character development, pacing, and writing quality.
        `
    },
    worldbuilding: {
        title: 'Worldbuilding',
        body: `
Qritor provides a complete set of **worldbuilding** tools to help you systematically build and maintain your novel's world.

## Core Philosophy

A long-form novel's worldbuilding is often vast and complex. Qritor manages worldbuilding across three dimensions:

### Entities — "What Exists"
All characters, scenes, organizations, props, and settings in your work exist as **modules**. Each module has structured fields to keep information organized.

### Relations — "How They Connect"
Relationships between entities are visualized through the **Relation Graph**. Hostile, alliance, and master-student relationships between characters, subordination between organizations — all at a glance.

### Changes — "How They Evolve"
Entity states change as the plot develops. The **Dynamic Info** system tracks each entity's state transitions across chapters, ensuring consistency.

## AI Auto-Maintenance

The most powerful feature: you **don't need to maintain** any of this manually.

1. While writing chapter text, use the "Extract" tools in the editor toolbar.
2. AI automatically identifies new entities, relationships, and state changes from the text.
3. Confirm and write to the database with one click.

Your worldbuilding grows naturally with your writing, always in sync with the latest content.
        `
    },
    'relation-graph': {
        title: 'Relation Graph',
        body: `
## Overview

The Relation Graph displays all entity relationships in your work as a visual network. Switch to the **"Relation Graph"** tab at the bottom of the editor to view it.

## Interactions

- **Zoom**: Use the mouse scroll wheel to zoom in or out.
- **Pan**: Hold left mouse button and drag the canvas.
- **Move Nodes**: Drag individual nodes to adjust layout.
- **View Details**: Click a node to view entity info, click an edge to see relationship description.
- **Fit View**: Use the "Fit View" button in the bottom controls to auto-zoom and show all content.

## Relationship Types

The graph uses color coding to distinguish different relationship types:

| Relation | Color | Description |
|----------|-------|-------------|
| **Kinship** | <span style="color:#ec4899">■</span> Pink | Blood relations, family ties |
| **Alliance** | <span style="color:#22c55e">■</span> Green | Alliance, cooperation |
| **Hostile** | <span style="color:#ef4444">■</span> Red | Conflict, opposition |
| **Master-Student** | <span style="color:#a855f7">■</span> Purple | Mentorship, guidance |
| **Located At** | <span style="color:#3b82f6">■</span> Blue | Geographical location |
| **Subordinate** | <span style="color:#eab308">■</span> Yellow | Subordination, employment |
| **Lovers** | <span style="color:#f43f5e">■</span> Rose | Romance, marriage |
| **Friends** | <span style="color:#14b8a6">■</span> Teal | Friendship |
| **Other** | <span style="color:#6b7280">■</span> Gray | Unclassified relationships |

## Creating Relationships

### AI Auto-Extraction
Use the "Extract Relations" button in the chapter editor toolbar. AI will identify character relationships from the text and generate structured data. Confirm to write them into the graph.

### AI Agent Operations
In Agent mode, you can tell AI directly: "Set Zhang San and Li Si as master and student," and AI will execute it automatically.

### Manual Creation
In the module editing interface's "Relations" tab, you can also add relationships manually.
        `
    },
    'dynamic-info': {
        title: 'Dynamic Info',
        body: `
## What Is Dynamic Info

In long-form novels, the states of characters and things change as the plot progresses. For example:
- A character gets seriously injured in Chapter 3
- An organization is dissolved in Chapter 8
- A magical artifact is destroyed in Chapter 12

The **Dynamic Info** system specifically tracks these changes, so both AI and you can clearly know "at a certain point in the story, what state is this entity in."

## How to View

### Module Editor — Dynamic Info Tab
Switch to the "Dynamic Info" tab in the module editing interface to see all state change records for that entity, arranged in a timeline.

### State History Panel
In the "State History" tab at the bottom of the editor, you can view a global overview of all state changes.

## Record Contents

Each dynamic info entry includes:
- **Change Description**: What happened (e.g., "Left arm injured")
- **Associated Chapter**: Which chapter it happened in
- **Affected Field**: Which attribute changed

## Creation Methods

### AI Auto-Extraction
Use the "Extract Dynamic Info" tool in the chapter editor. AI will analyze the text, automatically identify entity state changes, and generate records.

### AI Agent Operations
In Agent mode, tell AI: "Record that Zhang San lost his inner power in this chapter," and AI will automatically create the dynamic info.

### Manual Addition
Manually add records in the module's "Dynamic Info" tab.

## Significance for AI Writing

Dynamic Info is a crucial part of AI context awareness. When AI writes subsequent chapters, it reads the latest state of relevant characters, avoiding logical contradictions like "a character who was injured suddenly appears perfectly fine."
        `
    },
    'plot-management': {
        title: 'Plot Management',
        body: `
Qritor provides professional **plot management** tools to help you control the rhythm and structure of your story from a macro perspective.

## Core Features

### Storyline Management
Break complex plots into multiple storylines (main plot, romance arc, subplots, etc.) and manage each one separately.

### Plot Event Tracking
Mark key plot events for each chapter, distinguish event types (turning points, climaxes, foreshadowing, etc.), and establish two-way links between events and chapters.

### Foreshadowing System
Create and track foreshadowing to ensure every seed you plant is properly resolved in later chapters.

## How to Access

- In the tab bar at the bottom of the editor, click **"Plot History"** to open the plot management panel.
- In the chapter editor toolbar, click **"Plot Organization"** to view events associated with the current chapter.
        `
    },
    storylines: {
        title: 'Storylines & Events',
        body: `
## Storyline Management

### What Are Storylines
Storylines are macro-level divisions of your novel's plot. A long novel typically contains multiple parallel or intertwined storylines, such as:
- **Main Plot**: Core conflict progression
- **Romance Arc**: Emotional development between characters
- **Subplots**: Side stories, supporting character arcs

### Operations
- **Create Storyline**: Click "New Storyline" in the plot management panel.
- **Edit Storyline**: Modify name or description.
- **Delete Storyline**: Remove storylines no longer needed (events under them are not deleted).

## Plot Events

### What Are Plot Events
Plot events are key nodes in the story. Each event is linked to a specific chapter and belongs to a storyline.

### Event Types

| Type | Description | Use Cases |
|------|-------------|-----------|
| **Normal** | Regular plot progression | Daily scenes, transitional passages |
| **Turning Point** | Major change in plot direction | Betrayal, unexpected discovery, identity reveal |
| **Climax** | Peak tension of the story | Final battle, ultimate confrontation, emotional explosion |
| **Resolution** | Closure of a storyline thread | Mystery solved, conflict resolved |
| **Foreshadowing** | Seeds planted for future developments | Hints, omens, seemingly unrelated details |

### Creating Events
1. Click "New Event" in the plot management panel.
2. Select the event type and storyline.
3. Link it to the corresponding chapter.
4. Fill in the event description.

You can also create events directly from the "Plot Organization" tool in the chapter editor.

## Filtering & Viewing

- **Filter by Storyline**: Show only events for a specific storyline.
- **Filter by Chapter**: Show only events for a specific chapter.
- **Foreshadowing Only**: Filter to show only foreshadowing events for quick status checks.
        `
    },
    foreshadowing: {
        title: 'Foreshadowing',
        body: `
## What Is the Foreshadowing System

Foreshadowing is the soul of a long novel. Qritor provides dedicated foreshadowing management tools to help you track every seed you plant, ensuring nothing is forgotten.

## Foreshadowing Status

Each piece of foreshadowing has two states:
- **Pending**: Planted but not yet revealed.
- **Resolved**: Resolved/revealed in a later chapter.

## Creating Foreshadowing

### Method 1: Mark When Creating Plot Events
When creating a plot event, select "Foreshadowing" as the event type. The system will automatically add it to the foreshadowing tracking list.

### Method 2: AI-Assisted Identification
In Agent mode, AI can help identify potential foreshadowing in your text or proactively create foreshadowing records.

## Resolving Foreshadowing

When a later chapter reveals a piece of foreshadowing:
1. Find the foreshadowing in the plot management panel.
2. Click the "Resolve" button.
3. Select which chapter resolved it.
4. The status changes to "Resolved."

## Foreshadowing Review

In the plot management panel, use the "Foreshadowing Only" filter to get an overview of all foreshadowing status:
- Which foreshadowing hasn't been resolved yet?
- Are there any forgotten seeds?
- Is the foreshadowing distribution reasonable?

This is especially important for serialized long novels, helping avoid the "digging holes without filling them" problem.
        `
    },
    skills: {
        title: 'Skills',
        description: 'Skills are reusable AI knowledge modules in Qritor that give the AI assistant specialized capabilities for specific creative tasks.',
        body: `
## What Are Skills

A skill is a pre-built set of **AI instructions** containing the workflow, rules, and domain knowledge for a specific creative task. Once loaded, the AI assistant follows the steps defined in the skill to execute the task without requiring step-by-step guidance from you.

For example, loading the \`/novel-initialization\` skill causes the AI to automatically iterate through all setting modules, load specialized generation skills for each, and fill in structured content — the entire flow is orchestrated by the skill, and you only need to review and confirm.

## How It Works

The skill system operates in three phases:

1. **Registration**: On startup, all available skill names and descriptions are loaded from the local database and injected into the AI assistant's system prompt.
2. **Matching**: When your request matches a skill's description, the AI automatically invokes it. You can also trigger skills manually via \`/skill-name\`.
3. **Execution**: The AI retrieves the skill's full instructions and follows the defined workflow, calling tools and generating content.

## Where Skills Come From

Skills are maintained by the Qritor team and stored in the cloud. The desktop client automatically syncs the latest skills on login. You can manually update by clicking the **"Sync"** button on the **"Novel Creation Methods"** page in the sidebar.

Skills are organized by scope:

| Scope | Description | Status |
|-------|-------------|--------|
| **Global Skills** | Available for all projects (e.g., chapter operations, character operations, plot design) | Available |
| **Method-Specific Skills** | Bound to a specific creation method (e.g., "Ancient Crossing"). Only available in novels using that method | Available |
| **Project-Level Skills** | Bound to a single novel project, customized for that project's specific needs | Coming Soon |

## How to Use

### Manual Trigger

Type \`/\` followed by the skill name in the AI assistant input box. A skill selector dropdown appears after typing \`/\`, with fuzzy search support.

**Examples**:
- \`/novel-initialization\` — Batch-initialize all setting modules
- \`/character-operations Create a morally ambiguous sword cultivator\` — Load the character operations skill with your instruction

### Automatic Trigger

The AI assistant's system prompt includes all available skill names and descriptions. When your request matches a skill, the AI automatically loads it via the \`use_skill\` tool — no slash command needed.

### View Available Skills

Type \`/\` to see the dropdown list of all skills available for the current project. The list includes both global skills and method-specific skills.

## Global Operation Skills

The following skills are globally available for all projects:

| Skill | Description |
|-------|-------------|
| \`chapter-operations\` | Chapter creation, continuation, modification, deletion |
| \`character-operations\` | Character creation, editing, batch management |
| \`scene-operations\` | Scene creation, editing, hierarchy management |
| \`prop-operations\` | Prop creation, editing, management |
| \`organization-operations\` | Organization creation, editing, member management |
| \`outline-operations\` | Outline writing and management |
| \`plot-design\` | Plot structure design and event planning |
| \`relationship-graph\` | Relationship graph maintenance and analysis |
| \`consistency-audit\` | Full-text consistency review |

## Skills and Agent Mode

Skills run in **Agent mode**. Once a skill is loaded, the AI assistant can call all available tools (create modules, modify content, search chapters, etc.) to complete the tasks defined in the skill instructions.

In **Ask mode**, skills serve only as knowledge references — the AI will not execute any operations.

## FAQ

### What if a skill doesn't trigger?
Make sure you're in Agent mode and check the skill name spelling. For manual triggers, the \`/skill-name\` must be at the beginning of your message.

### The skill list is empty?
Click the "Sync" button on the "Novel Creation Methods" page in the sidebar to sync the latest skills from the cloud.

### What's the relationship between skills and creation methods?
Creation methods define the module types and structure for a novel. Skills provide the AI generation capabilities for each module type within that method. After selecting a creation method, its corresponding skills become automatically available.
        `
    },
    configuration: {
        title: 'System Configuration',
        body: `
## LLM Settings
In Settings, you can configure AI model parameters:
- **API Base URL**: Custom API endpoint (OpenAI-compatible format)
- **Model Selection**: Choose the language model to use
- **Max Rounds**: Maximum number of AI tool call rounds

## Auto-Update
- **Enable/Disable**: Control whether the app auto-checks for updates
- **Check Frequency**: Set the interval for auto-checking updates

## Language Settings
Switch the interface language. Supports Simplified Chinese, Traditional Chinese, English, and more.
        `
    },
    'ai-models': {
        title: 'AI Models',
        description: 'Qritor integrates a curated selection of top-tier AI language models, from economical to flagship, to suit different creative needs and budgets.',
        body: `
## Model Tiers

Qritor organizes AI models into four tiers. Higher tiers offer stronger capabilities at a correspondingly higher credit cost.

| Tier | Description |
|------|-------------|
| **Economy** | Best value — daily writing, quick tests, short chats |
| **Standard** | Balanced — mid-to-long-form creative writing |
| **Advanced** | Massive context — ultra-long novels, full-book style control |
| **Flagship** | Top capability — premium, high-quality creative work |

---

## Economy

### DeepSeek (Default)

DeepSeek V3.2 Thinking is Qritor's **default model** — a leading Chinese-developed reasoning model. Built-in Chain-of-Thought capability delivers excellent reasoning for Chinese creative writing at the best value.

- **Strengths**: Chain-of-Thought reasoning, Chinese-optimized, fast, creative
- **Best for**: Daily continuation, plot brainstorming, character dialogue
- **Context window**: 131K tokens
- **Rate**: 0.4x / 0.6x

### GLM-4.7 Flash

A lightweight, ultra-fast model from Zhipu AI. Ideal for tasks where instant response matters most.

- **Strengths**: Ultra-fast response, lightweight, Chinese-friendly
- **Best for**: Quick tests, instant inspiration, short conversations
- **Context window**: 128K tokens
- **Rate**: 0.3x / 0.5x

### MiniMax M2.5

MiniMax's narrative-focused Chinese model. Excels at maintaining long-form narrative coherence.

- **Strengths**: Long context, narrative consistency, Chinese-optimized
- **Best for**: Long chapter continuation, narrative cohesion
- **Context window**: 200K tokens
- **Rate**: 0.5x / 1.4x

---

## Standard

### Gemini 3 Flash

Google's fast large-context model with 200K tokens context. Rapid streaming output with strong long-document comprehension.

- **Strengths**: Large context, fast streaming, multilingual
- **Best for**: Full-book reference continuation, long chapter generation
- **Context window**: 200K tokens
- **Rate**: 0.7x / 3.5x

### Kimi K2.5

Moonshot AI's creative dialogue model. Deep understanding of Chinese nuance with outstanding character portrayal.

- **Strengths**: Natural Chinese dialogue, character portrayal, creative
- **Best for**: Character design, dialogue generation, emotional writing
- **Context window**: 131K tokens
- **Rate**: 0.8x / 3x

### GLM-5

Zhipu AI's Chinese narrative flagship. Consistent style and high output quality, ideal when stylistic stability matters.

- **Strengths**: Stable style, fluent Chinese narrative, high output quality
- **Best for**: Formal chapter writing, style-consistent scenes
- **Context window**: 128K tokens
- **Rate**: 1x / 3.2x

---

## Advanced

### Gemini 3.1 Pro

Google's latest flagship model with an extraordinary **1 million token** context window — fit an entire long novel into a single conversation. Stable style with exceptional creative narrative.

- **Strengths**: 1M token context, stable style, creative narrative
- **Best for**: Million-word novels with full-book reference, global style consistency
- **Context window**: 1,000,000 tokens
- **Rate**: 2x / 12x

---

## Flagship

### Claude Sonnet 4.6

Anthropic's flagship mid-tier model — a top performer for creative writing. Nuanced character psychology, rich emotional depth, and precise style control make it the go-to for quality writing.

- **Strengths**: Top creative writing, deep character portrayal, precise style control
- **Best for**: Premium chapters, complex character design, high-quality continuation
- **Context window**: 200K tokens
- **Rate**: 3x / 15x

### Claude Opus 4.6

Anthropic's most powerful model — industry-leading across the board. Unmatched narrative depth, character psychology, and stylistic mastery for writers who demand the best.

- **Strengths**: All-around strongest, narrative depth, character psychology, exceptional style
- **Best for**: High-demand premium writing, complex plots, literary-quality prose
- **Context window**: 200K tokens
- **Rate**: 5x / 25x

---

## How to Choose

| Scenario | Recommended Model |
|----------|-------------------|
| Daily writing, best value | DeepSeek (default) |
| Quick tests & instant inspiration | GLM-4.7 Flash |
| Long-form narrative consistency | MiniMax M2.5 |
| Character design & dialogue | Kimi K2.5 |
| Consistent style writing | GLM-5 |
| Million-word full-book reference | Gemini 3.1 Pro |
| High-quality premium chapters | Claude Sonnet 4.6 |
| Literary excellence | Claude Opus 4.6 |

## About Rates

The **input rate / output rate** shown next to each model in the model selector reflects the relative credit cost — a higher rate means more credits consumed for the same amount of text.

---

## When You Encounter Network Errors

If an AI call fails, an error message appears in the chat. Common errors and how to handle them:

| Error Message | Cause | What to Do |
|--------------|-------|------------|
| Network connection failed, please check your network and retry | Local network issue or server unreachable | Check your connection, or switch to another model |
| Network connection timed out, please check your network and retry | Request timed out — model responding slowly | Wait and retry, or switch to a faster model |
| AI service temporarily unavailable, please try again later | Provider server outage | Switch to a model from a different provider |
| The selected model is unavailable. Please switch to another model | Model has been taken offline or suspended | Select a different model in the model selector |

### How to Switch Models

After an error, click the **model selector** to the left of the AI assistant input box and select a different model to continue writing. Your selection is saved automatically and will persist on next launch.

### Backup Model Suggestions

Each provider operates independently — an outage from one provider does not affect others. When errors occur, switch to a model from a different provider:

- **DeepSeek / GLM unavailable**: Switch to Gemini 3 Flash or Kimi K2.5
- **Gemini unavailable**: Switch to DeepSeek or the Claude series
- **Claude unavailable**: Switch to GLM-5 or Gemini 3.1 Pro
        `
    },
}
