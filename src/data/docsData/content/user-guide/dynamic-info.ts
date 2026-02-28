import type { DocsContentEntry } from "../../types";

export const zhDynamicInfo: DocsContentEntry = {
    title: "动态信息",
    description:
      "追踪角色、场景、道具、组织的状态随剧情变化——让 AI 在续写时始终了解每个实体的最新状态。",
    body: `
## 什么是动态信息

写长篇小说时，角色和事物的状态会随着剧情不断变化：

- 角色在第 3 章受了重伤，第 7 章才恢复
- 角色的性格从冷淡逐渐变得热情
- 某个组织在第 8 章被瓦解，成员四散
- 一件法宝在第 12 章易主，从反派手中落入主角之手

如果 AI 不知道这些变化，就可能写出"已经受伤的角色突然生龙活虎"或"已经覆灭的门派还在正常运作"这类逻辑矛盾。

**动态信息**系统就是专门解决这个问题的——它按字段追踪每个实体在不同章节中的状态变化，让 AI 在续写时始终了解"此时此刻，这个实体是什么状态"。

## 谁有动态信息

以下类型的实体支持动态信息：

- **角色** — 性格转变、能力变化、受伤/恢复、情绪状态等
- **场景** — 被破坏、封印、天气/氛围变化等
- **道具** — 损坏、升级、易主、觉醒新能力等
- **组织** — 壮大、衰落、分裂、覆灭等

## 在哪里查看

### 模块编辑面板 — 动态信息 Tab

打开任意角色、场景、道具或组织模块后，编辑面板顶部有两个 Tab：**「基本信息」** 和 **「动态信息」**。

切换到 **「动态信息」** Tab，您可以看到该实体所有字段的状态变化记录：

- 记录按**字段分组**显示（如"性格""位置""修为"各自独立一组）
- 每组默认折叠，只显示**最新一条**记录
- 展开后可查看该字段的**完整变化历史**，按时间倒序排列
- 有数据的字段排列在前，暂无记录的字段排列在后

### 每条记录的内容

| 字段 | 说明 |
|------|------|
| **属性名称** | 发生变化的字段（如"性格""位置""持有者"） |
| **变化描述** | 具体发生了什么（如"从冷淡变得热情""从家里逃离"） |
| **关联章节** | 这个变化发生在哪一章（可选） |

## 创建动态信息

有三种方式添加动态信息：

### AI 自动提取（推荐）

这是最高效的方式。写完一章后，在编辑器工具栏中点击 **「提取动态信息」** 按钮：

1. AI 分析当前章节正文，自动识别各实体的状态变化（情绪、位置、关系、能力等）
2. 提取结果在 AI 助手中展示，显示实体名称和各字段的变化描述
3. 每个实体的变化需要您确认——点击 **「确认更新」** 写入数据库，或点击 **「取消」** 放弃

AI 可以一次提取多个实体、多个字段的变化，并自动关联到当前章节。

### AI Agent 操作

在 Agent 模式下，您可以直接用自然语言告诉 AI：

- "记录一下张三在这一章失去了内力"
- "更新林婉儿的位置为'长安城'"
- "这一章中轩辕剑觉醒了新能力，记录一下"

AI 会自动找到对应实体和字段，创建动态信息记录。同样需要您确认后才会保存。

### 手动添加

在模块的 **「动态信息」** Tab 中，点击 **「+ 添加记录」** 按钮：

1. 从下拉列表中选择要记录变化的**字段**
2. 填写**变化描述**
3. 可选择**关联章节**（标记这个变化发生在哪一章）
4. 点击确认，记录即添加成功

## 管理动态信息

在动态信息面板中，您可以对已有记录进行管理：

- **编辑**：修改某条记录的变化描述
- **删除**：移除不再需要的记录

## 动态信息在 AI 创作中的作用

动态信息是 AI 上下文感知的核心组成部分：

### 时间感知

AI 在续写某一章时，会自动查询截至该章的最新动态信息。比如续写第 10 章时，AI 读取的是第 10 章之前（含第 10 章）最近一次记录的状态，而不是创建角色时的初始状态。

### 避免矛盾

有了动态信息，AI 不会写出这类逻辑错误：

- 已受伤的角色突然生龙活虎
- 已覆灭的组织还在正常运作
- 已损毁的法宝突然完好如初
- 角色性格莫名其妙地前后矛盾

### 多字段追踪

一个实体的多个属性可以同时被追踪。比如一个角色可以同时追踪性格、修为、位置、情绪等多个字段的变化，AI 在续写时会综合参考所有最新状态。

## 使用建议

- **每章写完后提取一次**：养成习惯，写完一章就用"提取动态信息"让 AI 自动记录变化，这样后续续写时 AI 始终掌握最新状态
- **重点关注核心角色**：主要角色的状态变化对剧情影响最大，优先确保他们的动态信息完整
- **善用关联章节**：为记录关联章节后，AI 能更精确地理解"这个变化是什么时候发生的"
- **配合参与实体使用**：将实体加入章节的参与实体后，AI 在续写时会同时读取该实体的基本属性和动态信息
        `,
  };

export const enDynamicInfo: DocsContentEntry = {
    title: "Dynamic Info",
    description:
      "Track how characters, scenes, props, and organizations change throughout your story — so AI always knows each entity's current state when writing.",
    body: `
## What Is Dynamic Info

When writing a long novel, the states of characters and things constantly change as the plot progresses:

- A character gets seriously injured in Chapter 3 and doesn't recover until Chapter 7
- A character's personality gradually shifts from cold to warm
- An organization is dissolved in Chapter 8, its members scattered
- An artifact changes hands in Chapter 12, falling from the villain to the protagonist

If AI doesn't know about these changes, it might write contradictions like "an injured character suddenly appearing perfectly fine" or "a destroyed organization still operating normally."

The **Dynamic Info** system solves exactly this problem — it tracks each entity's state changes by field across different chapters, so AI always knows "right now, what state is this entity in" when continuing the story.

## Which Entities Have Dynamic Info

The following entity types support Dynamic Info:

- **Characters** — personality shifts, ability changes, injuries/recovery, emotional states, etc.
- **Scenes** — destruction, sealing, weather/atmosphere changes, etc.
- **Props** — damage, upgrades, ownership changes, awakening new abilities, etc.
- **Organizations** — growth, decline, splits, destruction, etc.

## Where to View

### Module Editing Panel — Dynamic Info Tab

After opening any character, scene, prop, or organization module, the editing panel has two tabs at the top: **"Basic Info"** and **"Dynamic Info"**.

Switch to the **"Dynamic Info"** tab to see all state change records for that entity:

- Records are **grouped by field** (e.g., "Personality", "Location", "Cultivation Level" each in their own group)
- Each group is collapsed by default, showing only the **latest record**
- Expand to view the **complete change history** for that field, in reverse chronological order
- Fields with data are listed first; fields with no records appear at the bottom

### What Each Record Contains

| Field | Description |
|-------|-------------|
| **Attribute Name** | The field that changed (e.g., "Personality", "Location", "Owner") |
| **Change Description** | What specifically happened (e.g., "Shifted from cold to warm", "Fled from home") |
| **Associated Chapter** | Which chapter this change occurred in (optional) |

## Creating Dynamic Info

There are three ways to add Dynamic Info:

### AI Auto-Extraction (Recommended)

This is the most efficient method. After finishing a chapter, click the **"Extract Dynamic Info"** button in the editor toolbar:

1. AI analyzes the current chapter text and automatically identifies state changes for each entity (emotions, locations, relationships, abilities, etc.)
2. Extracted results are displayed in the AI assistant, showing entity names and field-level change descriptions
3. Each entity's changes require your confirmation — click **"Confirm Update"** to save to the database, or click **"Cancel"** to discard

AI can extract changes for multiple entities and multiple fields in a single operation, automatically associating them with the current chapter.

### AI Agent Operations

In Agent mode, you can tell AI directly using natural language:

- "Record that Zhang San lost his inner power in this chapter"
- "Update Lin Wan'er's location to 'Chang'an City'"
- "The Xuanyuan Sword awakened a new ability in this chapter, record it"

AI will automatically find the corresponding entity and field, and create a Dynamic Info record. Your confirmation is still required before saving.

### Manual Addition

In a module's **"Dynamic Info"** tab, click the **"+ Add Record"** button:

1. Select the **field** you want to record a change for from the dropdown
2. Fill in the **change description**
3. Optionally select an **associated chapter** (marking when this change occurred)
4. Click confirm — the record is added

## Managing Dynamic Info

In the Dynamic Info panel, you can manage existing records:

- **Edit**: Modify the change description of a record
- **Delete**: Remove records that are no longer needed

## How Dynamic Info Enhances AI Writing

Dynamic Info is a core component of AI context awareness:

### Time Awareness

When AI continues writing a chapter, it automatically queries the latest Dynamic Info up to that chapter. For example, when writing Chapter 10, AI reads the most recent record before or at Chapter 10, not the character's initial state when first created.

### Avoiding Contradictions

With Dynamic Info, AI won't make these logical errors:

- An injured character suddenly appearing perfectly fine
- A destroyed organization still operating normally
- A damaged artifact suddenly appearing intact
- A character's personality inexplicably flip-flopping

### Multi-Field Tracking

Multiple attributes of a single entity can be tracked simultaneously. For example, a character can have personality, cultivation level, location, and mood all tracked at once — AI will reference all latest states comprehensively when continuing the story.

## Tips

- **Extract after every chapter**: Build the habit of using "Extract Dynamic Info" after finishing each chapter, so AI always has the latest state information for subsequent writing
- **Focus on core characters**: State changes for main characters have the biggest impact on the plot — prioritize keeping their Dynamic Info complete
- **Use chapter associations**: Associating records with chapters helps AI more precisely understand "when did this change happen"
- **Combine with participating entities**: After adding entities to a chapter's participants, AI will read both their basic attributes and Dynamic Info when continuing the story
        `,
  };
