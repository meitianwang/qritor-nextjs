import type { DocsContentEntry } from "../../types";

export const zhCharacters: DocsContentEntry = {
  title: "角色",
  description:
    "创建和管理小说中的角色——手动创建、AI 批量生成、章节提取，以及角色在 AI 创作中的作用。",
  body: `
## 什么是角色模块

角色是小说中最重要的元素。在 Qritor 中，每个角色都是一个**结构化的模块**——不是简单的文字描述，而是由创作方法预定义好字段的表单，包含姓名、性格、外貌、背景、动机等属性。

这种结构化的好处在于：AI 在续写章节、生成对话时，能够精确读取角色的每一项属性，确保写出来的内容与角色设定一致。

## 在哪里找到角色

进入小说编辑器后，左侧模块树中的 **「角色库」** 分组就是管理角色的地方。所有角色按列表排列，点击任一角色即可在右侧编辑面板查看和编辑。

## 角色的字段

角色模块有哪些字段取决于您选择的**创作方法**。不同题材的创作方法为角色设计了不同的属性结构：

- **仙侠题材**的角色可能包含：姓名、修为境界、功法、法宝、门派、性格、外貌
- **悬疑题材**的角色可能包含：姓名、职业、动机、秘密、不在场证明
- **言情题材**的角色可能包含：姓名、年龄、性格、感情经历、核心冲突

这些字段由创作方法的模块类型定义，创建小说时自动确定。

## 创建角色

有多种方式为小说添加角色：

### 手动创建

1. 在左侧模块树的「角色库」分组右侧，点击 **「+」** 按钮
2. 输入角色名称
3. 如果创作方法定义了多种角色类型，选择对应的类型
4. 点击创建，新角色会出现在角色库中
5. 在右侧编辑面板中填写角色的各项属性

### AI 批量生成

这是快速搭建角色阵容的方式——让 AI 根据您的小说设定一次性生成多个核心角色。

1. 在左侧模块树中，选中 **「角色库」** 分组
2. 点击分组上的 **「AI 生成」** 按钮
3. AI 会读取您的小说设定（世界观、故事钩子等），自动生成多个角色
4. 生成过程以流式预览展示，您可以实时看到每个角色的信息
5. 生成完成后，点击 **「采纳」** 将角色添加到角色库

AI 生成的角色会自动填充创作方法定义的所有字段，您可以在此基础上调整和完善。

### 从章节中提取

如果您已经写了一些章节内容，AI 可以从正文中自动识别并提取角色：

1. 打开已写好内容的章节
2. 在右侧 AI 助手工具栏中，点击 **「提取实体」** 按钮
3. AI 分析章节正文，自动识别出现的角色（以及场景、道具等）
4. 提取结果在 AI 助手中展示
5. 确认后，角色会被创建到角色库中

### 自然语言描述

在 AI 助手中，您可以直接用自然语言告诉 AI 您想要什么样的角色：

- "帮我创建一个冷傲的女主角，出身没落世家，修炼冰属性功法"
- "我需要一个反派角色，表面是正派长老，实际暗中操控一切"

AI 会根据您的描述和小说设定，创建结构化的角色模块。

### 使用技能初始化

在 AI 助手中输入 **/** 调出技能列表，选择 **/character-initialization** 等角色相关技能，可以按照预设流程批量生成符合题材特点的角色。

## 编辑角色

点击角色后，右侧编辑面板提供两种编辑方式：

### 表单模式

默认的编辑方式。面板以表单形式显示角色的所有字段，您可以逐项填写或修改。编辑完成后点击 **「保存」** 即可。

### 智能写作模式

切换到智能写作模式后，可以让 AI 基于您的描述自动填充角色的各项属性。适合快速为空白角色生成内容。

## 角色的扩展信息

除了基本属性，每个角色还有以下扩展信息：

### 动态信息

角色的状态会随着剧情发展而变化——受伤、获得新能力、性格转变等。在角色编辑面板切换到 **「动态信息」** Tab，可以查看该角色在不同章节中的状态变化记录。

详见 [动态信息](/docs/zh/user-guide/dynamic-info) 文档。

### 关系

角色与其他实体之间的关系（师徒、敌对、恋人等）在 **关系图谱** 中可视化呈现。

详见 [关系图谱](/docs/zh/user-guide/relation-graph) 文档。

## 角色在 AI 创作中的作用

角色模块不仅是给您自己看的备忘录，更是 AI 创作的核心参考资料：

### 参与实体

编辑章节时，通过工具栏的 **「参与实体」** 按钮，您可以指定哪些角色出现在当前章节中。被选中的角色信息会自动传递给 AI，让 AI 在续写时准确把握每个角色的性格、说话方式和行为逻辑。

### @提及

在 AI 助手中输入 **@** 可以引用任意角色模块。引用后，AI 会在回答中参考该角色的详细信息。例如输入"@张三 写一段他的内心独白"，AI 会基于张三的性格和当前处境来创作。

### AI 自动参考

即使您没有主动引用，AI 在续写章节时也会自动读取参与实体中角色的设定信息，确保不会写出与角色人设矛盾的内容。

## 使用建议

- **尽早创建核心角色**：AI 在续写时会参考角色设定，角色信息越完整，AI 写出的对话和行为就越贴合
- **善用 AI 批量生成**：先让 AI 生成一批角色作为基础，再手动调整细节，比从零手写效率高很多
- **及时更新角色状态**：角色在剧情中经历重大变化后，记得更新动态信息或修改属性，让 AI 跟上角色的成长
- **配合参与实体使用**：每章开始前指定参与角色，AI 就能精准地"知道"这个场景里有谁、他们各自是什么状态
        `,
};

export const enCharacters: DocsContentEntry = {
  title: "Characters",
  description:
    "Create and manage characters in your novel — manual creation, AI batch generation, chapter extraction, and how characters enhance AI writing.",
  body: `
## What Are Character Modules

Characters are the most important element of any novel. In Qritor, each character is a **structured module** — not just a plain text description, but a form with fields predefined by the Creation Method, including name, personality, appearance, background, motivation, and more.

The benefit of this structure is that AI can precisely read every attribute of a character when continuing chapters or generating dialogue, ensuring the output stays consistent with character design.

## Where to Find Characters

After entering the novel editor, the **"Characters"** group in the left module tree is where you manage characters. All characters are listed there; click any one to view and edit it in the right panel.

## Character Fields

What fields a character module has depends on your **Creation Method**. Different genre methods design different attribute structures for characters:

- **Xianxia genre** characters might include: Name, Cultivation Level, Techniques, Artifacts, Sect, Personality, Appearance
- **Mystery genre** characters might include: Name, Occupation, Motive, Secret, Alibi
- **Romance genre** characters might include: Name, Age, Personality, Romantic History, Core Conflict

These fields are defined by the Creation Method's module types and are automatically determined when you create a novel.

## Creating Characters

There are several ways to add characters to your novel:

### Manual Creation

1. Next to the "Characters" group in the left module tree, click the **"+"** button
2. Enter the character name
3. If the Creation Method defines multiple character types, select the appropriate one
4. Click create — the new character appears in the Characters group
5. Fill in the character's attributes in the right editing panel

### AI Batch Generation

This is the fastest way to build your character roster — have AI generate multiple core characters at once based on your novel settings.

1. In the left module tree, select the **"Characters"** group
2. Click the **"AI Generate"** button on the group
3. AI reads your novel settings (worldbuilding, story hooks, etc.) and automatically generates multiple characters
4. The generation process is shown as a streaming preview — you can watch each character's info appear in real time
5. When generation is complete, click **"Accept"** to add the characters to your library

AI-generated characters will have all fields defined by the Creation Method automatically filled in. You can then adjust and refine them.

### Extracting from Chapters

If you've already written some chapter content, AI can automatically identify and extract characters from the text:

1. Open a chapter that already has content
2. In the AI assistant toolbar on the right, click the **"Extract Entities"** button
3. AI analyzes the chapter text and identifies characters (as well as scenes, props, etc.)
4. Extracted results are displayed in the AI assistant
5. After confirmation, characters are created in the Characters group

### Natural Language Description

In the AI assistant, you can tell AI what kind of character you want using natural language:

- "Create a cold and proud female lead from a fallen noble family who practices ice-element techniques"
- "I need a villain character who appears to be a righteous elder but is secretly manipulating everything"

AI will create a structured character module based on your description and novel settings.

### Using Skills to Initialize

Type **/** in the AI assistant to bring up the skills list, then select **/character-initialization** or similar character skills to batch-generate characters that fit your genre following a preset workflow.

## Editing Characters

After clicking a character, the right editing panel offers two editing modes:

### Form Mode

The default editing mode. The panel displays all character fields as a form, and you can fill in or modify each field. Click **"Save"** when done.

### Smart Write Mode

Switch to Smart Write mode to have AI automatically fill in character attributes based on your description. Great for quickly generating content for blank characters.

## Extended Character Information

Beyond basic attributes, each character has the following extended information:

### Dynamic Info

Character states change as the plot progresses — injuries, new abilities, personality shifts, etc. Switch to the **"Dynamic Info"** tab in the character editing panel to view state change records across different chapters.

See the [Dynamic Info](/docs/en/user-guide/dynamic-info) documentation for details.

### Relations

Relationships between characters and other entities (mentor-student, rivals, lovers, etc.) are visualized in the **Relation Graph**.

See the [Relation Graph](/docs/en/user-guide/relation-graph) documentation for details.

## How Characters Enhance AI Writing

Character modules aren't just notes for yourself — they're core reference material for AI creation:

### Participating Entities

When editing a chapter, use the **"Participants"** button in the toolbar to specify which characters appear in the current chapter. Selected character information is automatically passed to AI, enabling it to accurately capture each character's personality, speech patterns, and behavioral logic when continuing the story.

### @Mention

Type **@** in the AI assistant to reference any character module. Once referenced, AI will consider that character's detailed information in its response. For example, typing "@Zhang San write an inner monologue for him" will prompt AI to create based on Zhang San's personality and current circumstances.

### Automatic AI Reference

Even without explicit references, AI automatically reads the character settings of participating entities when continuing chapters, ensuring it won't write content that contradicts character design.

## Tips

- **Create core characters early**: AI references character settings when writing — the more complete the character info, the more their dialogue and behavior will ring true
- **Use AI batch generation**: Let AI generate a batch of characters as a foundation, then manually fine-tune the details — much more efficient than writing from scratch
- **Update character states promptly**: After a character undergoes major changes in the plot, remember to update their dynamic info or modify attributes so AI keeps up with their growth
- **Combine with participating entities**: Specify participating characters before each chapter, so AI precisely "knows" who's in the scene and their current state
        `,
};
