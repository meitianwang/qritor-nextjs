import type { DocsContentEntry } from "../../types";

export const zhProps: DocsContentEntry = {
  title: "道具",
  description:
    "创建和管理小说中的道具——手动创建、AI 批量生成、章节提取，以及道具在 AI 创作中的作用。",
  body: `
## 什么是道具模块

道具是推动剧情发展的**关键物品**。在 Qritor 中，每个道具都是一个**结构化的模块**——不是一句简单的提及，而是由创作方法预定义好字段的表单，包含名称、外观、功能、来历、持有者等属性。

这种结构化的好处在于：AI 在续写章节时，能够精确读取道具的特性和功效，确保剧情中涉及道具的描写前后一致，不会出现"这把剑明明断了却又完好如初"的矛盾。

## 在哪里找到道具

进入小说编辑器后，左侧模块树中的 **「道具库」** 分组就是管理道具的地方。所有道具按列表排列，点击任一道具即可在右侧编辑面板查看和编辑。

## 道具的字段

道具模块有哪些字段取决于您选择的**创作方法**。不同题材的创作方法为道具设计了不同的属性结构：

- **仙侠题材**的道具可能包含：名称、品阶、功效、材质、炼制者、归属门派
- **悬疑题材**的道具可能包含：名称、物品类型、发现地点、指纹/DNA信息、与案件的关联
- **科幻题材**的道具可能包含：名称、技术等级、功能描述、能源类型、制造方

这些字段由创作方法的模块类型定义，创建小说时自动确定。

## 创建道具

有多种方式为小说添加道具：

### 手动创建

1. 在左侧模块树的「道具库」分组右侧，点击 **「+」** 按钮
2. 输入道具名称
3. 如果创作方法定义了多种道具类型，选择对应的类型
4. 点击创建，新道具会出现在道具库中
5. 在右侧编辑面板中填写道具的各项属性

### AI 批量生成

这是快速构建道具体系的方式——让 AI 根据您的小说设定一次性生成多个关键道具。

1. 在左侧模块树中，选中 **「道具库」** 分组
2. 点击分组上的 **「AI 生成」** 按钮
3. AI 会读取您的小说设定（世界观、力量体系等），自动生成多个道具
4. 生成过程以流式预览展示，您可以实时看到每个道具的信息
5. 生成完成后，点击 **「采纳」** 将道具添加到道具库

AI 生成的道具会自动填充创作方法定义的所有字段，您可以在此基础上调整和完善。

### 从章节中提取

如果您已经写了一些章节内容，AI 可以从正文中自动识别并提取道具：

1. 打开已写好内容的章节
2. 在右侧 AI 助手工具栏中，点击 **「提取实体」** 按钮
3. AI 分析章节正文，自动识别出现的道具（以及角色、场景等）
4. 提取结果在 AI 助手中展示
5. 确认后，道具会被创建到道具库中

### 自然语言描述

在 AI 助手中，您可以直接用自然语言告诉 AI 您想要什么样的道具：

- "帮我创建一把上古神剑，封印着远古凶兽的力量，持有者会逐渐被侵蚀心智"
- "我需要一个能穿越时空的怀表，但每次使用都会消耗使用者的寿命"

AI 会根据您的描述和小说设定，创建结构化的道具模块。

### 使用技能初始化

在 AI 助手中输入 **/** 调出技能列表，选择道具相关的技能，可以按照预设流程批量生成符合题材特点的道具。

## 编辑道具

点击道具后，右侧编辑面板提供两种编辑方式：

### 表单模式

默认的编辑方式。面板以表单形式显示道具的所有字段，您可以逐项填写或修改。编辑完成后点击 **「保存」** 即可。

### 智能写作模式

切换到智能写作模式后，可以让 AI 基于您的描述自动填充道具的各项属性。适合快速为空白道具生成内容。

## 道具的扩展信息

除了基本属性，每个道具还有以下扩展信息：

### 动态信息

道具的状态会随着剧情发展而变化——损坏、升级、易主、觉醒新能力等。在道具编辑面板切换到 **「动态信息」** Tab，可以查看该道具在不同章节中的状态变化记录。

详见 [动态信息](/docs/zh/user-guide/dynamic-info) 文档。

### 关系

道具与其他实体之间的关系（持有者、制造者、封印对象等）在 **关系图谱** 中可视化呈现。

详见 [关系图谱](/docs/zh/user-guide/relation-graph) 文档。

## 道具在 AI 创作中的作用

道具模块不仅是给您自己看的备忘录，更是 AI 创作的重要参考资料：

### 参与实体

编辑章节时，通过工具栏的 **「参与实体」** 按钮，您可以指定当前章节中涉及哪些道具。被选中的道具信息会自动传递给 AI，让 AI 在续写时准确描写道具的外观、功能和使用效果。

### @提及

在 AI 助手中输入 **@** 可以引用任意道具模块。引用后，AI 会在回答中参考该道具的详细信息。例如输入"@轩辕剑 写一段主角拔出此剑的场景"，AI 会基于轩辕剑的属性和背景来创作。

### AI 自动参考

即使您没有主动引用，AI 在续写章节时也会自动读取参与实体中道具的设定信息，确保不会写出与道具设定矛盾的内容。

## 使用建议

- **为关键道具建档**：推动剧情的核心道具一定要创建模块，AI 才能在续写时保持一致性
- **善用 AI 批量生成**：先让 AI 根据世界观和力量体系生成一批道具，再手动调整细节
- **及时更新道具状态**：道具在剧情中发生重大变化后（损坏、升级、易主等），记得更新动态信息，让 AI 跟上道具的演变
- **配合参与实体使用**：涉及重要道具的章节，提前将道具加入参与实体，AI 就能精准地"知道"这个道具此刻是什么状态、在谁手中
        `,
};

export const enProps: DocsContentEntry = {
  title: "Props",
  description:
    "Create and manage props in your novel — manual creation, AI batch generation, chapter extraction, and how props enhance AI writing.",
  body: `
## What Are Prop Modules

Props are **key items** that drive plot development. In Qritor, each prop is a **structured module** — not just a brief mention, but a form with fields predefined by the Creation Method, including name, appearance, function, origin, owner, and more.

The benefit of this structure is that AI can precisely read a prop's characteristics and effects when continuing chapters, ensuring descriptions involving props remain consistent throughout the story — no more "this sword was clearly broken but now appears intact" contradictions.

## Where to Find Props

After entering the novel editor, the **"Props"** group in the left module tree is where you manage props. All props are listed there; click any one to view and edit it in the right panel.

## Prop Fields

What fields a prop module has depends on your **Creation Method**. Different genre methods design different attribute structures for props:

- **Xianxia genre** props might include: Name, Grade, Effects, Material, Refiner, Affiliated Sect
- **Mystery genre** props might include: Name, Item Type, Discovery Location, Fingerprint/DNA Info, Case Connection
- **Sci-fi genre** props might include: Name, Technology Level, Function Description, Energy Type, Manufacturer

These fields are defined by the Creation Method's module types and are automatically determined when you create a novel.

## Creating Props

There are several ways to add props to your novel:

### Manual Creation

1. Next to the "Props" group in the left module tree, click the **"+"** button
2. Enter the prop name
3. If the Creation Method defines multiple prop types, select the appropriate one
4. Click create — the new prop appears in the Props group
5. Fill in the prop's attributes in the right editing panel

### AI Batch Generation

This is the fastest way to build your prop system — have AI generate multiple key props at once based on your novel settings.

1. In the left module tree, select the **"Props"** group
2. Click the **"AI Generate"** button on the group
3. AI reads your novel settings (worldbuilding, power systems, etc.) and automatically generates multiple props
4. The generation process is shown as a streaming preview — you can watch each prop's info appear in real time
5. When generation is complete, click **"Accept"** to add the props to your library

AI-generated props will have all fields defined by the Creation Method automatically filled in. You can then adjust and refine them.

### Extracting from Chapters

If you've already written some chapter content, AI can automatically identify and extract props from the text:

1. Open a chapter that already has content
2. In the AI assistant toolbar on the right, click the **"Extract Entities"** button
3. AI analyzes the chapter text and identifies props (as well as characters, scenes, etc.)
4. Extracted results are displayed in the AI assistant
5. After confirmation, props are created in the Props group

### Natural Language Description

In the AI assistant, you can tell AI what kind of prop you want using natural language:

- "Create an ancient divine sword that seals the power of a primordial beast, gradually corrupting the mind of its wielder"
- "I need a pocket watch that can travel through time, but each use costs the user some of their lifespan"

AI will create a structured prop module based on your description and novel settings.

### Using Skills to Initialize

Type **/** in the AI assistant to bring up the skills list, then select prop-related skills to batch-generate props that fit your genre following a preset workflow.

## Editing Props

After clicking a prop, the right editing panel offers two editing modes:

### Form Mode

The default editing mode. The panel displays all prop fields as a form, and you can fill in or modify each field. Click **"Save"** when done.

### Smart Write Mode

Switch to Smart Write mode to have AI automatically fill in prop attributes based on your description. Great for quickly generating content for blank props.

## Extended Prop Information

Beyond basic attributes, each prop has the following extended information:

### Dynamic Info

Prop states change as the plot progresses — damage, upgrades, ownership changes, awakening new abilities, etc. Switch to the **"Dynamic Info"** tab in the prop editing panel to view state change records across different chapters.

See the [Dynamic Info](/docs/en/user-guide/dynamic-info) documentation for details.

### Relations

Relationships between props and other entities (owner, creator, sealed target, etc.) are visualized in the **Relation Graph**.

See the [Relation Graph](/docs/en/user-guide/relation-graph) documentation for details.

## How Props Enhance AI Writing

Prop modules aren't just notes for yourself — they're important reference material for AI creation:

### Participating Entities

When editing a chapter, use the **"Participants"** button in the toolbar to specify which props are involved in the current chapter. Selected prop information is automatically passed to AI, enabling it to accurately describe the prop's appearance, function, and usage effects when continuing the story.

### @Mention

Type **@** in the AI assistant to reference any prop module. Once referenced, AI will consider that prop's detailed information in its response. For example, typing "@Xuanyuan Sword write a scene of the protagonist pulling out this sword" will prompt AI to create based on the sword's attributes and backstory.

### Automatic AI Reference

Even without explicit references, AI automatically reads the prop settings of participating entities when continuing chapters, ensuring it won't write content that contradicts prop designs.

## Tips

- **Document key props**: Core props that drive the plot must have modules created, so AI can maintain consistency when writing
- **Use AI batch generation**: Let AI generate a batch of props based on your worldbuilding and power systems, then manually fine-tune the details
- **Update prop states promptly**: After a prop undergoes major changes in the plot (damage, upgrade, ownership change, etc.), remember to update dynamic info so AI keeps up with the prop's evolution
- **Combine with participating entities**: For chapters involving important props, add them to participating entities in advance so AI precisely "knows" the prop's current state and whose hands it's in
        `,
};
