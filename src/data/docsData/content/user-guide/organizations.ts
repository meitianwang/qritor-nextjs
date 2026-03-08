import type { DocsContentEntry } from "../../types";

export const zhOrganizations: DocsContentEntry = {
  title: "组织",
  description:
    "创建和管理小说中的组织势力——手动创建、AI 批量生成、章节提取，以及组织在 AI 创作中的作用。",
  body: `
## 什么是组织模块

组织是小说中由多个角色组成的**团体或势力**——门派、国家、帮派、公司、家族、军团等。在 Qritor 中，每个组织都是一个**结构化的模块**，由创作方法预定义好字段的表单，包含名称、类型、宗旨、规模、层级结构、势力范围等属性。

这种结构化的好处在于：AI 在续写章节时，能够精确读取组织的背景和势力格局，让派系斗争、权力博弈等情节更加合理，不会写出"两个已经结盟的势力突然开战"这类矛盾。

## 在哪里找到组织

进入小说编辑器后，左侧模块树中的 **「组织库」** 分组就是管理组织的地方。所有组织按列表排列，点击任一组织即可在右侧编辑面板查看和编辑。

## 组织的字段

组织模块有哪些字段取决于您选择的**创作方法**。不同题材的创作方法为组织设计了不同的属性结构：

- **仙侠题材**的组织可能包含：名称、类型（门派/世家/妖族）、势力等级、镇派之宝、核心功法、驻地
- **悬疑题材**的组织可能包含：名称、组织类型、公开身份、隐秘目的、核心成员、活动区域
- **科幻题材**的组织可能包含：名称、阵营、技术水平、控制星域、军事力量、政治体制

这些字段由创作方法的模块类型定义，创建小说时自动确定。

## 创建组织

有多种方式为小说添加组织：

### 手动创建

1. 在左侧模块树的「组织库」分组右侧，点击 **「+」** 按钮
2. 输入组织名称
3. 如果创作方法定义了多种组织类型，选择对应的类型
4. 点击创建，新组织会出现在组织库中
5. 在右侧编辑面板中填写组织的各项属性

### AI 批量生成

这是快速构建势力格局的方式——让 AI 根据您的小说设定一次性生成多个关键组织。

1. 在左侧模块树中，选中 **「组织库」** 分组
2. 点击分组上的 **「AI 生成」** 按钮
3. AI 会读取您的小说设定（世界观、地理格局、权力体系等），自动生成多个组织
4. 生成过程以流式预览展示，您可以实时看到每个组织的信息
5. 生成完成后，点击 **「采纳」** 将组织添加到组织库

AI 生成的组织会自动填充创作方法定义的所有字段，您可以在此基础上调整和完善。

### 从章节中提取

如果您已经写了一些章节内容，AI 可以从正文中自动识别并提取组织：

1. 打开已写好内容的章节
2. 在右侧 AI 助手工具栏中，点击 **「提取实体」** 按钮
3. AI 分析章节正文，自动识别出现的组织（以及角色、场景等）
4. 提取结果在 AI 助手中展示
5. 确认后，组织会被创建到组织库中

### 自然语言描述

在 AI 助手中，您可以直接用自然语言告诉 AI 您想要什么样的组织：

- "帮我创建一个隐藏在朝廷中的秘密组织，表面是文官集团，实际暗中操控政局"
- "我需要一个由落魄修士组成的佣兵团，实力不强但情报网遍布大陆"

AI 会根据您的描述和小说设定，创建结构化的组织模块。

### 使用技能初始化

在 AI 助手中输入 **/** 调出技能列表，选择组织相关的技能，可以按照预设流程批量生成符合题材特点的组织。

## 编辑组织

点击组织后，右侧编辑面板提供两种编辑方式：

### 表单模式

默认的编辑方式。面板以表单形式显示组织的所有字段，您可以逐项填写或修改。编辑完成后点击 **「保存」** 即可。

### 智能写作模式

切换到智能写作模式后，可以让 AI 基于您的描述自动填充组织的各项属性。适合快速为空白组织生成内容。

## 组织的扩展信息

除了基本属性，每个组织还有以下扩展信息：

### 动态信息

组织的状态会随着剧情发展而变化——壮大、衰落、分裂、合并、覆灭等。在组织编辑面板切换到 **「动态信息」** Tab，可以查看该组织在不同章节中的状态变化记录。

详见 [动态信息](/docs/zh/user-guide/dynamic-info) 文档。

### 关系

组织与其他实体之间的关系（隶属、同盟、敌对、控制等）在 **关系图谱** 中可视化呈现。组织之间的势力版图和角色与组织之间的从属关系一目了然。

详见 [关系图谱](/docs/zh/user-guide/relation-graph) 文档。

## 组织在 AI 创作中的作用

组织模块不仅是给您自己看的备忘录，更是 AI 创作的重要参考资料：

### 参与实体

编辑章节时，通过工具栏的 **「参与实体」** 按钮，您可以指定当前章节涉及哪些组织。被选中的组织信息会自动传递给 AI，让 AI 在续写时准确把握组织的立场、行事风格和内部关系。

### @提及

在 AI 助手中输入 **@** 可以引用任意组织模块。引用后，AI 会在回答中参考该组织的详细信息。例如输入"@天机阁 写一段关于天机阁内部权力斗争的情节"，AI 会基于天机阁的组织架构和成员关系来创作。

### AI 自动参考

即使您没有主动引用，AI 在续写章节时也会自动读取参与实体中组织的设定信息，确保不会写出与组织设定矛盾的内容。

## 使用建议

- **构建势力格局**：在创作初期用 AI 批量生成主要组织，搭建好势力版图，后续剧情中的权谋博弈才有据可依
- **明确组织关系**：在关系图谱中标注组织之间的同盟、敌对、隶属关系，AI 写派系冲突时会更加合理
- **及时更新组织状态**：组织在剧情中发生重大变化后（覆灭、合并、分裂等），记得更新动态信息，让 AI 跟上势力格局的演变
- **配合角色使用**：将角色与组织关联（通过关系图谱或参与实体），AI 就能理解"某角色是某组织的成员"，写出符合其立场的言行
        `,
};

export const enOrganizations: DocsContentEntry = {
  title: "Organizations",
  description:
    "Create and manage organizations in your novel — manual creation, AI batch generation, chapter extraction, and how organizations enhance AI writing.",
  body: `
## What Are Organization Modules

Organizations are **groups or factions** composed of multiple characters — sects, nations, gangs, corporations, families, legions, and more. In Qritor, each organization is a **structured module** with fields predefined by the Creation Method, including name, type, purpose, scale, hierarchy, sphere of influence, and more.

The benefit of this structure is that AI can precisely read an organization's background and power dynamics when continuing chapters, making faction conflicts and political intrigue more logical — no more "two allied factions suddenly going to war" contradictions.

## Where to Find Organizations

After entering the novel editor, the **"Organizations"** group in the left module tree is where you manage organizations. All organizations are listed there; click any one to view and edit it in the right panel.

## Organization Fields

What fields an organization module has depends on your **Creation Method**. Different genre methods design different attribute structures for organizations:

- **Xianxia genre** organizations might include: Name, Type (Sect/Clan/Demon Tribe), Power Level, Sect Treasure, Core Techniques, Headquarters
- **Mystery genre** organizations might include: Name, Organization Type, Public Identity, Hidden Purpose, Core Members, Operating Area
- **Sci-fi genre** organizations might include: Name, Faction, Technology Level, Controlled Star Systems, Military Strength, Political System

These fields are defined by the Creation Method's module types and are automatically determined when you create a novel.

## Creating Organizations

There are several ways to add organizations to your novel:

### Manual Creation

1. Next to the "Organizations" group in the left module tree, click the **"+"** button
2. Enter the organization name
3. If the Creation Method defines multiple organization types, select the appropriate one
4. Click create — the new organization appears in the Organizations group
5. Fill in the organization's attributes in the right editing panel

### AI Batch Generation

This is the fastest way to build your power landscape — have AI generate multiple key organizations at once based on your novel settings.

1. In the left module tree, select the **"Organizations"** group
2. Click the **"AI Generate"** button on the group
3. AI reads your novel settings (worldbuilding, geographic layout, power systems, etc.) and automatically generates multiple organizations
4. The generation process is shown as a streaming preview — you can watch each organization's info appear in real time
5. When generation is complete, click **"Accept"** to add the organizations to your library

AI-generated organizations will have all fields defined by the Creation Method automatically filled in. You can then adjust and refine them.

### Extracting from Chapters

If you've already written some chapter content, AI can automatically identify and extract organizations from the text:

1. Open a chapter that already has content
2. In the AI assistant toolbar on the right, click the **"Extract Entities"** button
3. AI analyzes the chapter text and identifies organizations (as well as characters, scenes, etc.)
4. Extracted results are displayed in the AI assistant
5. After confirmation, organizations are created in the Organizations group

### Natural Language Description

In the AI assistant, you can tell AI what kind of organization you want using natural language:

- "Create a secret organization hidden within the court — publicly a civil official faction, but secretly manipulating politics behind the scenes"
- "I need a mercenary group composed of fallen cultivators — not very powerful but with an intelligence network spanning the continent"

AI will create a structured organization module based on your description and novel settings.

### Using Skills to Initialize

Type **/** in the AI assistant to bring up the skills list, then select organization-related skills to batch-generate organizations that fit your genre following a preset workflow.

## Editing Organizations

After clicking an organization, the right editing panel offers two editing modes:

### Form Mode

The default editing mode. The panel displays all organization fields as a form, and you can fill in or modify each field. Click **"Save"** when done.

### Smart Write Mode

Switch to Smart Write mode to have AI automatically fill in organization attributes based on your description. Great for quickly generating content for blank organizations.

## Extended Organization Information

Beyond basic attributes, each organization has the following extended information:

### Dynamic Info

Organization states change as the plot progresses — growth, decline, splits, mergers, destruction, etc. Switch to the **"Dynamic Info"** tab in the organization editing panel to view state change records across different chapters.

See the [Dynamic Info](/docs/en/user-guide/dynamic-info) documentation for details.

### Relations

Relationships between organizations and other entities (subordination, alliances, rivalries, control, etc.) are visualized in the **Relation Graph**. The power map between organizations and membership relationships between characters and organizations are shown at a glance.

See the [Relation Graph](/docs/en/user-guide/relation-graph) documentation for details.

## How Organizations Enhance AI Writing

Organization modules aren't just notes for yourself — they're important reference material for AI creation:

### Participating Entities

When editing a chapter, use the **"Participants"** button in the toolbar to specify which organizations are involved in the current chapter. Selected organization information is automatically passed to AI, enabling it to accurately grasp the organization's stance, operating style, and internal dynamics when continuing the story.

### @Mention

Type **@** in the AI assistant to reference any organization module. Once referenced, AI will consider that organization's detailed information in its response. For example, typing "@Tianji Pavilion write a scene about internal power struggles within Tianji Pavilion" will prompt AI to create based on the organization's structure and member relationships.

### Automatic AI Reference

Even without explicit references, AI automatically reads the organization settings of participating entities when continuing chapters, ensuring it won't write content that contradicts organization designs.

## Tips

- **Build the power landscape**: Use AI batch generation early to create major organizations and establish the faction map — subsequent political intrigue will have solid foundations
- **Define organization relationships**: Mark alliances, rivalries, and subordination between organizations in the Relation Graph — AI will write faction conflicts more logically
- **Update organization states promptly**: After an organization undergoes major changes in the plot (destruction, merger, split, etc.), remember to update dynamic info so AI keeps up with the evolving power landscape
- **Combine with characters**: Link characters to organizations (via Relation Graph or participating entities) so AI understands "this character belongs to this organization" and writes actions consistent with their allegiance
        `,
};
