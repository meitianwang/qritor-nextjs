import type { DocsContentEntry } from "../../types";

export const zhNovelSettings: DocsContentEntry = {
    title: "小说设定",
    description:
      "为您的作品建立世界观基础——修炼体系、故事背景、核心设定等，AI 创作时自动参考。",
    body: `
## 什么是小说设定

在开始正式写作之前，大多数长篇小说都需要先确立世界观的基础规则——比如修炼体系怎么运作、故事发生在什么样的世界、有哪些核心冲突等等。这些内容不属于正文，但直接决定了整个故事的走向。

Qritor 中的 **「设定」** 就是用来管理这些内容的。每个设定都是一个结构化的表单，由创作方法预定义好字段，您只需填写即可。

## 设定与创作方法的关系

小说的设定类型由您选择的 **创作方法** 决定。不同题材的创作方法预设了不同的设定模块：

- **仙侠题材**可能预设：修炼体系、宗门体系、天地法则
- **科幻题材**可能预设：科技树、星际格局、种族设定
- **悬疑题材**可能预设：故事钩子、核心谜题、线索链

创建小说时，系统会自动为每个 **单例设定** 创建对应的模块，您直接填写即可，无需手动创建。

## 在哪里找到设定

进入小说编辑器后，在左侧模块树中，**「设定」** 分组始终排在最上方。点击展开即可看到当前小说的所有设定项。

## 编辑设定

点击一个设定项后，右侧编辑面板会显示该设定的表单。不同的设定类型有不同的字段，常见的字段形式包括：

- **文本字段**：如故事背景概述、核心冲突描述
- **长文本字段**：如详细的体系说明、世界规则
- **数组字段**：如多个境界层级、多条核心法则
- **嵌套结构**：如每个境界包含名称、描述、特征等子字段

填写完成后点击保存，内容会立即持久化到本地数据库。

## 添加设定

如果创作方法中有非单例的设定类型，您可以手动添加更多设定：

1. 在左侧「设定」分组右侧，点击 **「+」** 按钮
2. 选择要创建的设定类型
3. 输入设定标题
4. 填写表单内容并保存

## 设定对 AI 创作的作用

**这是设定最重要的价值**——您填写的每一项设定都会被 AI 在创作时自动引用：

- **AI 续写章节**时，会读取设定作为背景知识，确保情节符合世界观规则
- **AI 生成角色**时，会参考设定来设计合理的角色属性（比如仙侠世界的角色会有"修为境界"而不是"科技等级"）
- **AI 规划剧情**时，会根据设定中的核心冲突和故事钩子来推进叙事

设定越完善，AI 的输出就越贴合您心中的作品构想。即使暂时没想清楚所有细节，也建议先写个大概框架，后续随时可以回来补充和修改。

## AI 辅助填写

您也可以让 AI 帮您填写设定，有以下几种方式：

### 单个设定生成

在左侧模块树中选中某个设定项，然后点击 AI 助手中的 **「AI 生成」** 按钮，AI 会根据创作方法和已有上下文，为当前设定自动生成内容。

![AI 生成设定](/images/docs/ai-setting-generate.png)

### 使用技能批量初始化

在 AI 助手中输入 **/** 调出技能列表，选择类似 **/setting-generation** 的初始化技能，可以一次性为小说的所有设定生成内容。不同的创作方法会提供不同的初始化技能。

![技能初始化](/images/docs/skills-init.png)

### 自然语言描述

您也可以在 AI 助手中直接用自然语言告诉 AI 您的需求，或者通过 **@提及** 引用已有的设定让 AI 在此基础上扩展。例如："帮我设计一套修炼体系，要有九个大境界"。

## 使用建议

- **创建小说后优先填写设定**：设定是 AI 理解您作品的基础，越早越完善，后续 AI 辅助创作的质量越高
- **不必追求一次写完**：设定可以随时修改，随着创作深入逐步丰富即可
- **善用创作方法的预设**：创作方法已为您设计好了该题材最需要的设定字段，按照表单引导填写就好
        `,
  };

export const enNovelSettings: DocsContentEntry = {
    title: "Novel Settings",
    description:
      "Establish the worldbuilding foundations of your work — cultivation systems, story backgrounds, core settings, and more. AI automatically references them during creation.",
    body: `
## What Are Novel Settings

Before starting to write, most long-form novels need to establish the foundational rules of their world — how the power system works, what kind of world the story takes place in, what the core conflicts are, and so on. These elements aren't part of the main text, but they directly determine the direction of the entire story.

**Settings** in Qritor are designed to manage exactly this kind of content. Each setting is a structured form with fields predefined by the Creation Method — you just need to fill them in.

## How Settings Relate to Creation Methods

The types of settings available for your novel are determined by the **Creation Method** you choose. Different genre methods come with different preset setting modules:

- **Xianxia genre** might include: Cultivation System, Sect System, Laws of Heaven and Earth
- **Sci-fi genre** might include: Tech Tree, Interstellar Politics, Species Settings
- **Mystery genre** might include: Story Hook, Core Mystery, Clue Chain

When you create a novel, the system automatically creates a module for each **singleton setting** — you can start filling them in right away without manual creation.

## Where to Find Settings

After entering the novel editor, in the left-side module tree, the **"Settings"** group is always at the very top. Click to expand it and see all settings for your current novel.

## Editing Settings

Click a setting item, and the editing panel on the right will display its form. Different setting types have different fields. Common field types include:

- **Text fields**: Such as story background overview, core conflict description
- **Long text fields**: Such as detailed system explanations, world rules
- **Array fields**: Such as multiple power levels, multiple core laws
- **Nested structures**: Such as each level containing name, description, and characteristics sub-fields

Click save after filling in, and the content is immediately persisted to the local database.

## Adding Settings

If the Creation Method includes non-singleton setting types, you can manually add more:

1. Next to the "Settings" group on the left, click the **"+"** button
2. Select the setting type to create
3. Enter a setting title
4. Fill in the form content and save

## How Settings Help AI Creation

**This is the most important value of settings** — every setting you fill in is automatically referenced by AI during creation:

- **When AI continues writing chapters**, it reads settings as background knowledge to ensure the plot follows worldbuilding rules
- **When AI generates characters**, it references settings to design appropriate attributes (e.g., xianxia characters will have "cultivation level" instead of "tech rank")
- **When AI plans plot**, it uses the core conflicts and story hooks from settings to drive the narrative

The more complete your settings, the more closely AI output will match your vision for the work. Even if you haven't figured out every detail yet, we recommend writing a rough framework first — you can always come back to supplement and modify later.

## AI-Assisted Filling

You can also have AI help you fill in settings. There are several ways:

### Generate a Single Setting

Select a setting item in the left module tree, then click the **"AI Generate"** button in the AI assistant. AI will automatically generate content for the current setting based on the Creation Method and existing context.

![AI Generate Setting](/images/docs/ai-setting-generate.png)

### Batch Initialize with Skills

Type **/** in the AI assistant to bring up the skills list, then select an initialization skill like **/setting-generation** to generate content for all settings at once. Different Creation Methods provide different initialization skills.

![Skills Initialization](/images/docs/skills-init.png)

### Natural Language Description

You can also tell AI what you need directly in natural language, or use **@mention** to reference existing settings and let AI expand from there. For example: "Help me design a cultivation system with nine major realms."

## Tips

- **Fill in settings right after creating your novel**: Settings are the foundation for AI to understand your work — the earlier and more complete they are, the better AI-assisted creation will be
- **No need to write everything at once**: Settings can be modified anytime; enrich them gradually as your writing deepens
- **Leverage Creation Method presets**: The Creation Method has already designed the most essential setting fields for your genre — just follow the form prompts
        `,
  };
