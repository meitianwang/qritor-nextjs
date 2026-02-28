import type { DocsContentEntry } from "../../types";

export const zhCreationMethods: DocsContentEntry = {
    title: "创作方法",
    description:
      "创作方法是 Qritor 的核心概念，它为不同题材的小说提供了量身定制的创作框架，包括模块结构、AI 技能和生成规则。",
    body: `
## 什么是创作方法

**创作方法**是 Qritor 为不同类型的小说题材精心设计的**创作框架**。

传统写作软件只提供一个空白文档，所有的结构和规划都需要作者从零开始。而 Qritor 的创作方法会根据您选择的小说题材，自动搭建好一整套创作环境：

- **预设模块类型**：根据题材定义好角色卡、场景卡、道具卡等的字段结构，每种模块都有最适合该题材的属性设计
- **初始模块生成**：选择创作方法后，系统自动生成必要的初始模块（如世界观设定、修炼体系等），让您不必从空白开始
- **专属 AI 技能**：每种创作方法都附带该题材专属的 AI 技能，让 AI 在生成角色、场景、剧情时更贴合该类型的创作惯例
- **可见分组配置**：根据题材需要，自动配置哪些分组（角色库、场景库、组织库、道具库等）在编辑器中显示

简单来说，选择一个创作方法，就像为您的小说搭好了脚手架——结构已就绪，您只需专注于创作本身。

## 丰富的题材覆盖

Qritor 已覆盖东方玄幻、穿越、科幻、悬疑灵异、女性向等中文网文主流流派，以及 LitRPG、Isekai、Dark Fantasy、Horror、Romantasy 等英文流行题材。每个大类下又细分了多种具体的创作方法——例如东方玄幻下就有古典仙侠、凡人流、洪荒流等十余种不同方向。

![创作方法列表](/images/features/creation_method.png)

**我们一直在持续新增和优化创作方法。** 您可以在桌面客户端的「创作方法」页面浏览当前所有可用的方法，随时点击「同步」获取最新上线的内容。

如果您想写的题材还没有对应的创作方法，非常欢迎向我们提交需求——告诉我们您想要什么类型，我们会优先安排制作。

## 如何使用创作方法

### 第一步：浏览创作方法

在桌面客户端侧边栏点击 **「创作方法」** 页面，可以浏览所有可用的创作方法。

- **按类型筛选**：顶部标签页按小说大类分组（东方玄幻、穿越、科幻等），点击标签快速筛选
- **搜索**：使用搜索栏按名称或描述快速定位
- **查看详情**：每个方法卡片展示名称、描述和所属类型

### 第二步：创建小说时选择

在 **「小说」** 页面点击「新建小说」，在创建表单中选择一个创作方法。这是创建小说时最关键的一步——它决定了整个作品的模块结构。

### 第三步：开始创作

选择创作方法并创建小说后，进入编辑器，您会看到：

1. **模块树已就绪**：左侧模块树已按创作方法的配置生成了初始分组和模块
2. **专属字段结构**：每种模块类型都有该题材量身定制的表单字段
3. **AI 技能已加载**：在 AI 助手中输入 \`/\`，可以看到该创作方法专属的技能已自动可用

## 创作方法的组成

每个创作方法包含以下几个核心部分：

### 模块类型

模块类型定义了您可以在作品中创建哪些类型的内容节点，以及每种节点有哪些字段。

例如，一个"古典仙侠"创作方法可能包含这些模块类型：

| 分组 | 模块类型示例 | 用途 |
|------|------------|------|
| **设定** | 修炼体系、宗门体系、天地法则 | 世界观基础规则 |
| **角色库** | 仙侠角色卡 | 包含修为境界、功法、法宝等字段 |
| **场景库** | 仙侠场景卡 | 包含灵气浓度、地形特征等字段 |
| **组织库** | 宗门/势力卡 | 包含门规、传承、势力范围等字段 |
| **道具库** | 法宝/丹药卡 | 包含品阶、功效、炼制方法等字段 |
| **章节** | 章节 | 正文写作 |

不同题材的创作方法会有完全不同的模块类型设计。比如科幻题材可能有"科技树"、"星球"等模块，而悬疑题材可能有"线索"、"嫌疑人"等模块。

### 单例模块

部分模块类型被标记为 **单例 (Singleton)**。选择创作方法后，系统会自动为每个单例类型创建一个模块。这些通常是设定类的模块——它们是整个世界观的基础，每部作品只需要一份。

例如：选择"古典仙侠"方法后，系统会自动创建"修炼体系"、"宗门体系"等设定模块，您可以直接开始填写，无需手动创建。

### 专属 AI 技能

每个创作方法都绑定了一组专属的 AI 技能。这些技能让 AI 在执行任务时遵循该题材的创作惯例和规则。

例如：
- **角色生成技能**：AI 在生成角色时会根据题材特点设计属性（仙侠的修为境界 vs 科幻的科技装备）
- **设定生成技能**：AI 在填充世界观设定时会遵循该题材的常见模式
- **剧情规划技能**：AI 在设计剧情时会参考该类型小说的经典叙事结构

## 同步创作方法

创作方法由 Qritor 团队维护并持续更新。要获取最新的创作方法：

1. 在侧边栏点击 **「创作方法」** 页面
2. 点击页面顶部的 **「同步」** 按钮
3. 系统会从云端下载最新的创作方法和关联的 AI 技能

同步完成后，新的创作方法会立即出现在列表中，可用于创建新小说。

## 常见问题

### 创建小说后还能换创作方法吗？
目前不支持切换已创建小说的创作方法。创作方法决定了模块类型的结构，更换可能导致已有数据不兼容。建议在创建前仔细选择。

### 找不到适合我的题材怎么办？
我们一直在持续新增创作方法。您可以先选择最接近的方法开始创作，同时欢迎通过 [联系我们](/docs/zh/support/contact) 告诉我们您想要的题材——用户的反馈是我们优先开发新方法的重要参考。

### 创作方法和技能是什么关系？
创作方法定义了小说的**结构**（有哪些模块类型、字段），技能则提供了该结构下的 **AI 生成能力**（如何用 AI 填充这些模块）。两者配合，构成完整的 AI 辅助创作体验。详见 [技能](/docs/zh/user-guide/skills) 文档。
        `,
  };

export const enCreationMethods: DocsContentEntry = {
    title: "Creation Methods",
    description:
      "Creation Methods are a core concept in Qritor, providing tailored writing frameworks for different novel genres, including module structures, AI skills, and generation rules.",
    body: `
## What is a Creation Method

A **Creation Method** is a **writing framework** carefully designed by Qritor for different novel genres.

Traditional writing software gives you a blank document where all structure and planning must start from scratch. Qritor's Creation Methods automatically set up an entire writing environment based on your chosen genre:

- **Preset Module Types**: Defines character cards, scene cards, prop cards, etc. with field structures optimized for the genre
- **Auto-generated Initial Modules**: After selecting a method, the system automatically creates essential modules (e.g., world settings, power systems), so you don't start from blank
- **Genre-specific AI Skills**: Each method comes with AI skills tailored to that genre's conventions for generating characters, scenes, and plots
- **Visible Group Configuration**: Automatically configures which groups (Characters, Scenes, Organizations, Props, etc.) appear in the editor

In short, choosing a Creation Method is like having scaffolding built for your novel — the structure is ready, and you can focus purely on writing.

## Rich Genre Coverage

Qritor already covers popular Chinese web fiction genres such as Eastern Fantasy, Isekai/Transmigration, Sci-Fi, Mystery & Supernatural, Female-oriented fiction, and more. For English genres, we support LitRPG, Isekai, Dark Fantasy, Horror, Romantasy, and beyond. Each major category contains multiple specific creation methods — for example, Eastern Fantasy alone includes over a dozen variations like Classic Xianxia, Mortal Cultivation, and Primordial Chaos.

![Creation Methods List](/images/features/creation_method.png)

**We are continuously adding and refining Creation Methods.** You can browse all currently available methods on the "Creation Methods" page in the desktop app, and click "Sync" anytime to get the latest additions.

If the genre you want to write doesn't have a matching Creation Method yet, we'd love to hear from you — tell us what you need, and we'll prioritize building it.

## How to Use Creation Methods

### Step 1: Browse Creation Methods

In the desktop app sidebar, click the **"Creation Methods"** page to browse all available methods.

- **Filter by Genre**: Top tabs group methods by genre category (Eastern Fantasy, Sci-Fi, etc.) — click to filter
- **Search**: Use the search bar to find methods by name or description
- **View Details**: Each method card shows its name, description, and genre

### Step 2: Select When Creating a Novel

On the **"Novels"** page, click "New Novel" and select a Creation Method in the form. This is the most crucial step — it determines your entire work's module structure.

### Step 3: Start Writing

After selecting a method and creating your novel, enter the editor to find:

1. **Module Tree Ready**: The left-side module tree has been pre-populated with groups and modules based on the method's configuration
2. **Genre-specific Fields**: Each module type has form fields tailored to the genre
3. **AI Skills Loaded**: Type \`/\` in the AI assistant to see the method's exclusive skills are already available

## What Makes Up a Creation Method

Each Creation Method consists of these core components:

### Module Types

Module types define what kinds of content nodes you can create and what fields each node has.

For example, a "Classic Xianxia" method might include:

| Group | Module Type Examples | Purpose |
|-------|---------------------|---------|
| **Settings** | Cultivation System, Sect System, World Laws | World-building foundation rules |
| **Characters** | Xianxia Character Card | Fields for cultivation realm, techniques, artifacts, etc. |
| **Scenes** | Xianxia Scene Card | Fields for spiritual energy density, terrain features, etc. |
| **Organizations** | Sect/Faction Card | Fields for rules, heritage, territory, etc. |
| **Props** | Artifact/Pill Card | Fields for grade, effects, crafting method, etc. |
| **Chapters** | Chapter | Main text writing |

Different genres have completely different module type designs. Sci-fi might have "Tech Tree" or "Planet" modules, while mystery might have "Clue" or "Suspect" modules.

### Singleton Modules

Some module types are marked as **Singleton**. After selecting a method, the system automatically creates one module for each singleton type. These are typically setting-type modules — they form the foundation of the entire world-building and each work only needs one copy.

For example: After selecting the "Classic Xianxia" method, the system auto-creates "Cultivation System", "Sect System", and other setting modules that you can start filling in immediately.

### Genre-specific AI Skills

Each Creation Method comes with a set of exclusive AI skills. These skills ensure the AI follows the genre's conventions and rules when performing tasks.

For example:
- **Character Generation Skill**: AI designs character attributes based on the genre (Xianxia cultivation realms vs. Sci-Fi tech equipment)
- **Setting Generation Skill**: AI follows the genre's common patterns when filling in world-building settings
- **Plot Planning Skill**: AI references classic narrative structures of the genre when designing the plot

## Syncing Creation Methods

Creation Methods are maintained and continuously updated by the Qritor team. To get the latest methods:

1. Click **"Creation Methods"** in the sidebar
2. Click the **"Sync"** button at the top of the page
3. The system will download the latest methods and associated AI skills from the cloud

After syncing, new methods will immediately appear in the list and can be used for new novels.

## FAQ

### Can I change the Creation Method after creating a novel?
Currently, switching methods for an existing novel is not supported. The method determines module type structures, and switching could cause data incompatibility. Choose carefully before creating.

### What if I can't find a method for my genre?
We're continuously adding new Creation Methods. You can start with the closest available method for now, and we'd love to hear from you via [Contact Us](/docs/en/support/contact) — your feedback directly influences which methods we build next.

### What's the relationship between Creation Methods and Skills?
Creation Methods define the **structure** of a novel (what module types and fields exist), while Skills provide the **AI generation capabilities** for that structure (how to use AI to fill those modules). Together, they form the complete AI-assisted writing experience. See the [Skills](/docs/en/user-guide/skills) documentation for details.
        `,
  };
