import type { DocsContentEntry } from "../../types";

export const zhScenes: DocsContentEntry = {
    title: "场景",
    description:
      "创建和管理小说中的场景——手动创建、AI 批量生成、章节提取，以及场景在 AI 创作中的作用。",
    body: `
## 什么是场景模块

场景是小说故事发生的**空间载体**。在 Qritor 中，每个场景都是一个**结构化的模块**——不仅仅是一段环境描写，而是由创作方法预定义好字段的表单，包含场景名称、地理位置、环境特征、氛围、重要物品等属性。

这种结构化的好处在于：AI 在续写章节时，能够精确读取场景的环境信息和氛围设定，自动生成贴合场景特点的描写，让故事更具临场感。

## 在哪里找到场景

进入小说编辑器后，左侧模块树中的 **「场景库」** 分组就是管理场景的地方。所有场景按列表排列，点击任一场景即可在右侧编辑面板查看和编辑。

## 场景的字段

场景模块有哪些字段取决于您选择的**创作方法**。不同题材的创作方法为场景设计了不同的属性结构：

- **仙侠题材**的场景可能包含：名称、地理位置、灵气浓度、危险等级、特殊资源、驻留势力
- **悬疑题材**的场景可能包含：名称、地点类型、关键线索、进出通道、监控情况
- **科幻题材**的场景可能包含：名称、星球/空间站、重力环境、技术水平、资源状况

这些字段由创作方法的模块类型定义，创建小说时自动确定。

## 创建场景

有多种方式为小说添加场景：

### 手动创建

1. 在左侧模块树的「场景库」分组右侧，点击 **「+」** 按钮
2. 输入场景名称
3. 如果创作方法定义了多种场景类型，选择对应的类型
4. 点击创建，新场景会出现在场景库中
5. 在右侧编辑面板中填写场景的各项属性

### AI 批量生成

这是快速构建故事舞台的方式——让 AI 根据您的小说设定一次性生成多个关键场景。

1. 在左侧模块树中，选中 **「场景库」** 分组
2. 点击分组上的 **「AI 生成」** 按钮
3. AI 会读取您的小说设定（世界观、地理格局等），自动生成多个场景
4. 生成过程以流式预览展示，您可以实时看到每个场景的信息
5. 生成完成后，点击 **「采纳」** 将场景添加到场景库

AI 生成的场景会自动填充创作方法定义的所有字段，您可以在此基础上调整和完善。

### 从章节中提取

如果您已经写了一些章节内容，AI 可以从正文中自动识别并提取场景：

1. 打开已写好内容的章节
2. 在编辑器工具栏中，点击 **「提取实体」** 按钮
3. AI 分析章节正文，自动识别出现的场景（以及角色、道具等）
4. 提取结果在 AI 助手中展示
5. 确认后，场景会被创建到场景库中

### 自然语言描述

在 AI 助手中，您可以直接用自然语言告诉 AI 您想要什么样的场景：

- "帮我创建一个隐藏在深山中的上古遗迹，里面布满了阵法和机关"
- "我需要一个繁华的港口城市，是各方势力交汇的贸易中心"

AI 会根据您的描述和小说设定，创建结构化的场景模块。

### 使用技能初始化

在 AI 助手中输入 **/** 调出技能列表，选择场景相关的技能，可以按照预设流程批量生成符合题材特点的场景。

## 编辑场景

点击场景后，右侧编辑面板提供两种编辑方式：

### 表单模式

默认的编辑方式。面板以表单形式显示场景的所有字段，您可以逐项填写或修改。编辑完成后点击 **「保存」** 即可。

### 智能写作模式

切换到智能写作模式后，可以让 AI 基于您的描述自动填充场景的各项属性。适合快速为空白场景生成内容。

## 场景的扩展信息

除了基本属性，每个场景还有以下扩展信息：

### 动态信息

场景的状态会随着剧情发展而变化——被破坏、被封印、发生异变等。在场景编辑面板切换到 **「动态信息」** Tab，可以查看该场景在不同章节中的状态变化记录。

详见 [动态信息](/docs/zh/user-guide/dynamic-info) 文档。

### 关系

场景与其他实体之间的关系（角色的驻地、组织的总部所在地等）在 **关系图谱** 中可视化呈现。

详见 [关系图谱](/docs/zh/user-guide/relation-graph) 文档。

## 场景在 AI 创作中的作用

场景模块不仅是给您自己看的备忘录，更是 AI 创作的重要参考资料：

### 参与实体

编辑章节时，通过工具栏的 **「参与实体」** 按钮，您可以指定当前章节发生在哪些场景中。被选中的场景信息会自动传递给 AI，让 AI 在续写时准确描绘环境氛围、地理特征和空间布局。

### @提及

在 AI 助手中输入 **@** 可以引用任意场景模块。引用后，AI 会在回答中参考该场景的详细信息。例如输入"@皇宫 描写主角第一次进入皇宫的场景"，AI 会基于皇宫的建筑布局、氛围等信息来创作。

### AI 自动参考

即使您没有主动引用，AI 在续写章节时也会自动读取参与实体中场景的设定信息，确保环境描写与场景设定一致。

## 使用建议

- **尽早创建核心场景**：AI 在续写时会参考场景设定，场景信息越完整，AI 写出的环境描写就越生动准确
- **善用 AI 批量生成**：先让 AI 根据世界观生成一批场景作为基础，再手动调整细节，比从零手写效率高很多
- **及时更新场景状态**：场景在剧情中发生重大变化后（被毁、封印解除等），记得更新动态信息，让 AI 跟上世界的变化
- **配合参与实体使用**：每章开始前指定发生地点，AI 就能精准地"知道"故事正在哪里发生、周围环境是什么样的
        `,
  };

export const enScenes: DocsContentEntry = {
    title: "Scenes",
    description:
      "Create and manage scenes in your novel — manual creation, AI batch generation, chapter extraction, and how scenes enhance AI writing.",
    body: `
## What Are Scene Modules

Scenes are the **spatial containers** where your story unfolds. In Qritor, each scene is a **structured module** — not just a paragraph of environmental description, but a form with fields predefined by the Creation Method, including scene name, geographic location, environmental features, atmosphere, important objects, and more.

The benefit of this structure is that AI can precisely read a scene's environmental information and atmosphere settings when continuing chapters, automatically generating descriptions that match the scene's characteristics and making the story more immersive.

## Where to Find Scenes

After entering the novel editor, the **"Scenes"** group in the left module tree is where you manage scenes. All scenes are listed there; click any one to view and edit it in the right panel.

## Scene Fields

What fields a scene module has depends on your **Creation Method**. Different genre methods design different attribute structures for scenes:

- **Xianxia genre** scenes might include: Name, Geographic Location, Spiritual Energy Density, Danger Level, Special Resources, Resident Factions
- **Mystery genre** scenes might include: Name, Location Type, Key Clues, Entry/Exit Routes, Surveillance Status
- **Sci-fi genre** scenes might include: Name, Planet/Space Station, Gravity Environment, Technology Level, Resource Status

These fields are defined by the Creation Method's module types and are automatically determined when you create a novel.

## Creating Scenes

There are several ways to add scenes to your novel:

### Manual Creation

1. Next to the "Scenes" group in the left module tree, click the **"+"** button
2. Enter the scene name
3. If the Creation Method defines multiple scene types, select the appropriate one
4. Click create — the new scene appears in the Scenes group
5. Fill in the scene's attributes in the right editing panel

### AI Batch Generation

This is the fastest way to build your story's stage — have AI generate multiple key scenes at once based on your novel settings.

1. In the left module tree, select the **"Scenes"** group
2. Click the **"AI Generate"** button on the group
3. AI reads your novel settings (worldbuilding, geographic layout, etc.) and automatically generates multiple scenes
4. The generation process is shown as a streaming preview — you can watch each scene's info appear in real time
5. When generation is complete, click **"Accept"** to add the scenes to your library

AI-generated scenes will have all fields defined by the Creation Method automatically filled in. You can then adjust and refine them.

### Extracting from Chapters

If you've already written some chapter content, AI can automatically identify and extract scenes from the text:

1. Open a chapter that already has content
2. In the editor toolbar, click the **"Extract Entities"** button
3. AI analyzes the chapter text and identifies scenes (as well as characters, props, etc.)
4. Extracted results are displayed in the AI assistant
5. After confirmation, scenes are created in the Scenes group

### Natural Language Description

In the AI assistant, you can tell AI what kind of scene you want using natural language:

- "Create an ancient ruins hidden deep in the mountains, filled with formations and traps"
- "I need a bustling port city that serves as a trade center where various factions converge"

AI will create a structured scene module based on your description and novel settings.

### Using Skills to Initialize

Type **/** in the AI assistant to bring up the skills list, then select scene-related skills to batch-generate scenes that fit your genre following a preset workflow.

## Editing Scenes

After clicking a scene, the right editing panel offers two editing modes:

### Form Mode

The default editing mode. The panel displays all scene fields as a form, and you can fill in or modify each field. Click **"Save"** when done.

### Smart Write Mode

Switch to Smart Write mode to have AI automatically fill in scene attributes based on your description. Great for quickly generating content for blank scenes.

## Extended Scene Information

Beyond basic attributes, each scene has the following extended information:

### Dynamic Info

Scene states change as the plot progresses — destruction, sealing, anomalies, etc. Switch to the **"Dynamic Info"** tab in the scene editing panel to view state change records across different chapters.

See the [Dynamic Info](/docs/en/user-guide/dynamic-info) documentation for details.

### Relations

Relationships between scenes and other entities (a character's residence, an organization's headquarters, etc.) are visualized in the **Relation Graph**.

See the [Relation Graph](/docs/en/user-guide/relation-graph) documentation for details.

## How Scenes Enhance AI Writing

Scene modules aren't just notes for yourself — they're important reference material for AI creation:

### Participating Entities

When editing a chapter, use the **"Participants"** button in the toolbar to specify which scenes the current chapter takes place in. Selected scene information is automatically passed to AI, enabling it to accurately portray the environmental atmosphere, geographic features, and spatial layout when continuing the story.

### @Mention

Type **@** in the AI assistant to reference any scene module. Once referenced, AI will consider that scene's detailed information in its response. For example, typing "@Imperial Palace describe the protagonist entering the palace for the first time" will prompt AI to create based on the palace's architectural layout, atmosphere, and other details.

### Automatic AI Reference

Even without explicit references, AI automatically reads the scene settings of participating entities when continuing chapters, ensuring environmental descriptions stay consistent with scene settings.

## Tips

- **Create core scenes early**: AI references scene settings when writing — the more complete the scene info, the more vivid and accurate the environmental descriptions will be
- **Use AI batch generation**: Let AI generate a batch of scenes based on your worldbuilding as a foundation, then manually fine-tune the details — much more efficient than writing from scratch
- **Update scene states promptly**: After a scene undergoes major changes in the plot (destruction, seal removal, etc.), remember to update dynamic info so AI keeps up with world changes
- **Combine with participating entities**: Specify locations before each chapter, so AI precisely "knows" where the story is happening and what the surroundings look like
        `,
  };
