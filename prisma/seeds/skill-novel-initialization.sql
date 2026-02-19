-- 全局新小说初始化 Skill / Global New Novel Initialization Skill
-- novel_creation_method_id = NULL 表示全局可用 / NULL means globally available
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-novel-initialization.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'novel-initialization',
  '新小说初始化：从零开始搭建小说框架，按正确顺序创建项目信息、设定、角色、场景、故事线、关系网络和章节大纲',
  'New novel initialization: build the novel framework from scratch, creating project info, settings, characters, scenes, story lines, relationship networks, and chapter outlines in the correct order',
  '## 新小说初始化技能

本技能指导你从零开始为新小说搭建完整的创作框架。按照正确的依赖顺序，逐步创建项目信息、设定、角色、场景、道具、组织、故事线、关系网络和章节大纲。

---

### 核心原则

1. **先了解再动手**：先获取项目和创作方法信息，了解可用的模块类型和 Schema
2. **依赖顺序**：实体创建有先后依赖，必须按正确顺序进行
3. **逐步确认**：每一步创建都需要用户确认，确认后再进入下一步
4. **Schema 驱动**：所有实体的属性必须遵循创作方法定义的 JSON Schema
5. **用户主导**：在关键节点询问用户意愿，不要一次性创建所有内容

---

### 依赖关系与创建顺序

```
第一阶段：项目基础
  ├─ 项目名称和描述
  └─ 了解创作方法和可用模块类型

第二阶段：世界观设定
  └─ 设定类模块（世界观、文风、故事钩子等）

第三阶段：核心实体
  ├─ 角色（主角 → 关键配角 → 次要角色）
  ├─ 场景（主要场景 → 次要场景）
  ├─ 组织（如有需要）
  └─ 道具（如有需要）

第四阶段：关系网络
  ├─ 角色间关系
  ├─ 角色与组织的关系
  └─ 概念节点及关联

第五阶段：剧情框架
  ├─ 故事线（主线 → 支线）
  └─ 核心剧情事件

第六阶段：章节规划
  ├─ 章节创建
  └─ 章节大纲
```

**为什么要按此顺序**：
- 设定先于角色：角色设计需要基于世界观（如魔法体系决定角色能力）
- 角色先于关系：关系的两端实体必须先存在
- 角色先于故事线事件：事件通常围绕角色展开
- 故事线先于章节：章节大纲需要引用故事线和事件

---

### 第一阶段：项目基础

#### Step 1：了解当前项目状态

调用 `get_novel_overview`，获取：
- 项目名称和描述
- 创作方法 ID
- 可用的模块类型列表
- 已有模块统计

**关键信息**：`availableModuleTypes` 决定了你能创建哪些类型的实体和设定。不同创作方法的可用类型不同。

#### Step 2：完善项目名称和描述

如果项目名称或描述不理想，与用户沟通后：
- `rename_novel`：修改项目名称
- `update_novel_description`：设置项目简介

**项目描述建议包含**：
- 故事类型/题材（如玄幻、都市、科幻）
- 核心主题或立意
- 简要故事梗概（1-3 句话）

---

### 第二阶段：世界观设定

#### Step 1：了解设定类型

调用 `list_settings` 查看当前已有设定（新小说通常为空）。

根据 `get_novel_overview` 返回的 `availableModuleTypes`，识别其中属于设定类的类型（如"世界观"、"文风设定"、"故事钩子"等）。

#### Step 2：获取设定 Schema

对每个设定类型调用 `get_setting_type_schema(moduleTypeName)`，了解需要填写哪些字段。

#### Step 3：与用户讨论世界观

基于设定 Schema 的字段，引导用户思考：
- 故事发生的世界是什么样的？
- 有什么特殊的规则或体系？（如魔法、科技、武力体系）
- 时代背景和社会结构
- 故事的核心冲突来源

#### Step 4：创建设定

根据用户反馈，调用 `update_setting` 填写各项设定内容。

**注意**：不同创作方法的设定类型完全不同，必须先获取 Schema 再填写，不能假设有哪些字段。

---

### 第三阶段：核心实体创建

#### 3.1 创建角色

**准备工作**：

**Step 1**：调用 `get_character_schema` 获取角色的 JSON Schema

- 了解角色需要填写哪些字段
- 注意 required 字段和可选字段
- 不同创作方法的角色 Schema 可能不同

**Step 2**：与用户讨论角色阵容

引导用户思考：
- 主角是谁？核心特质和动机？
- 有哪些关键配角？与主角的关系？
- 反派/对手角色？
- 每个角色的基本信息（按 Schema 字段）

**创建顺序**：

```
主角 → 核心配角（2-3个） → 反派/对手 → 其他次要角色
```

**Step 3**：逐个调用 `create_character` 创建角色

- 按 Schema 填写完整属性
- 每创建一个角色后，等待确认再创建下一个
- 建议先创建 3-5 个核心角色，后续可以随写作补充

#### 3.2 创建场景

**Step 1**：调用 `get_scene_schema` 获取场景 Schema

**Step 2**：与用户讨论主要场景

引导用户思考：
- 故事主要发生在哪里？
- 有哪些关键场景？（开篇场景、重要转折场景、高潮场景）
- 场景的物理特征和氛围

**Step 3**：逐个调用 `create_scene` 创建场景

- 建议先创建 2-4 个核心场景

#### 3.3 创建组织（按需）

如果故事涉及组织/团体/势力：

**Step 1**：调用 `get_organization_schema` 获取 Schema

**Step 2**：调用 `create_organization` 创建组织

#### 3.4 创建道具（按需）

如果故事涉及重要道具：

**Step 1**：调用 `get_prop_schema` 获取 Schema

**Step 2**：调用 `create_prop` 创建道具

---

### 第四阶段：关系网络构建

在核心实体创建完成后，建立实体间的关系网络。

#### Step 1：梳理角色关系

与用户确认角色之间的关系：
- 主角与各配角的关系类型和描述
- 角色与组织的归属关系
- 角色与道具的持有关系
- 关系的强度（1-5）

#### Step 2：批量创建关系

调用 `create_relation` 逐条建立关系：

- `fromName`：起点实体名称
- `toName`：终点实体名称
- `relationType`：关系类型
- `description`：关系描述
- `strength`：关系强度

**创建建议**：
- 先建立主角与各角色的关系
- 再建立角色与组织的关系
- 最后建立其他实体间的关系
- 对于对称关系（如"朋友"），考虑是否需要双向创建

#### Step 3：补充概念节点（按需）

如果故事有重要的抽象概念（如魔法体系、预言、家族血脉）：

调用 `create_node(category="concept")` 创建概念节点，然后用 `create_relation` 建立概念与实体的关联。

---

### 第五阶段：剧情框架搭建

#### 5.1 规划故事线

**Step 1**：与用户讨论剧情框架

引导用户思考：
- 核心冲突是什么？（主线）
- 有哪些副线剧情？（支线）
- 故事的大致走向（开端→发展→高潮→结局）

**Step 2**：创建故事线

调用 `create_story_line`：
- 先创建主线（`lineType: "main"`）
- 再创建 1-2 条支线（`lineType: "branch"`）
- 每条故事线需要有清晰的 `description` 描述核心冲突和走向

#### 5.2 规划核心事件

**Step 1**：为每条故事线规划关键事件

引导用户思考：
- 主线的关键转折点有哪些？
- 故事的高潮设计？
- 是否有伏笔需要埋设？

**Step 2**：创建剧情事件

调用 `create_plot_event`：

- 先创建故事线后再创建事件（事件通过 `storyLineName` 关联到故事线）
- 合理分配事件类型：
  - `normal`：普通推进事件
  - `turning_point`：关键转折
  - `climax`：高潮
  - `resolution`：结局
  - `foreshadowing`：伏笔

**创建建议**：
- 每条故事线至少规划 3-5 个关键事件
- 主线应有完整的"起承转合"结构
- 初始阶段不必规划太细，后续随写作补充

#### 5.3 埋设初始伏笔（按需）

如果有明确的伏笔计划：

调用 `create_foreshadow` 埋设伏笔，记录：
- 伏笔内容
- 计划在哪个章节回收

---

### 第六阶段：章节规划

#### Step 1：与用户讨论章节计划

引导用户思考：
- 预计分几卷？每卷大约多少章？
- 开篇的几章要写什么？
- 每章的大致主题或事件

#### Step 2：创建章节

调用 `create_chapter` 逐章创建：
- `title`：章节标题
- `volumeNumber`：卷号
- `chapterNumber`：章节号

**创建建议**：
- 初始可以只创建前 5-10 章
- 后续章节可以随写作进度逐步添加
- 章节标题尽量有辨识度，能反映章节内容

#### Step 3：编写章节大纲

对已创建的章节，调用 `update_chapter_outline` 编写大纲：

大纲建议包含：
- 本章核心事件
- 出场角色
- 场景转换
- 推进的故事线
- 章节目标（读者看完这章应该了解/感受什么）

---

### 灵活运用策略

#### 策略一：最小化启动

对于急于开始写作的用户，只执行最核心的步骤：

```
第一阶段 → 第三阶段（只创建主角和1-2个核心角色）→ 第六阶段（只创建第1章）
```

其他内容在写作过程中逐步补充。

#### 策略二：完整规划

对于喜欢充分准备的用户，完整执行所有六个阶段：

```
全部六个阶段按顺序执行，每个阶段都充分讨论和创建
```

#### 策略三：世界观驱动

对于注重世界观构建的用户（如玄幻、科幻）：

```
第一阶段 → 第二阶段（深入） → 第三阶段 → 第四阶段（重点构建概念网络） → 第五阶段 → 第六阶段
```

#### 策略四：角色驱动

对于以角色为核心的用户（如言情、群像）：

```
第一阶段 → 第三阶段（深入创建角色） → 第四阶段（重点构建关系） → 第五阶段 → 第六阶段
```

---

### 与用户沟通的关键节点

在以下节点必须与用户沟通，获取反馈后再继续：

| 节点 | 需要确认的内容 |
|------|---------------|
| 阶段一完成后 | 项目名称和描述是否满意？选择哪种启动策略？ |
| 阶段二完成后 | 世界观设定是否完整？是否需要调整？ |
| 阶段三：每创建 3-5 个角色后 | 角色阵容是否合理？是否需要补充或调整？ |
| 阶段四完成后 | 关系网络是否准确？是否有遗漏？ |
| 阶段五完成后 | 剧情框架是否满意？故事走向是否明确？ |
| 阶段六完成后 | 章节规划是否合理？是否可以开始写作？ |

---

### 工具速查表

#### 信息获取

| 工具名 | 用途 | 阶段 |
|--------|------|------|
| `get_novel_overview` | 获取项目信息和可用模块类型 | 一 |
| `get_character_schema` | 获取角色 Schema | 三 |
| `get_scene_schema` | 获取场景 Schema | 三 |
| `get_prop_schema` | 获取道具 Schema | 三 |
| `get_organization_schema` | 获取组织 Schema | 三 |
| `get_setting_type_schema` | 获取设定类型 Schema | 二 |
| `list_settings` | 查看已有设定 | 二 |

#### 项目级操作

| 工具名 | 用途 | 阶段 |
|--------|------|------|
| `rename_novel` | 修改项目名称 | 一 |
| `update_novel_description` | 修改项目描述 | 一 |

#### 实体创建

| 工具名 | 用途 | 阶段 |
|--------|------|------|
| `create_character` | 创建角色 | 三 |
| `create_scene` | 创建场景 | 三 |
| `create_organization` | 创建组织 | 三 |
| `create_prop` | 创建道具 | 三 |
| `update_setting` | 填写设定 | 二 |

#### 关系构建

| 工具名 | 用途 | 阶段 |
|--------|------|------|
| `create_relation` | 创建实体间关系 | 四 |
| `create_node` | 创建概念节点 | 四 |

#### 剧情框架

| 工具名 | 用途 | 阶段 |
|--------|------|------|
| `create_story_line` | 创建故事线 | 五 |
| `create_plot_event` | 创建剧情事件 | 五 |
| `create_foreshadow` | 埋设伏笔 | 五 |

#### 章节规划

| 工具名 | 用途 | 阶段 |
|--------|------|------|
| `create_chapter` | 创建章节 | 六 |
| `update_chapter_outline` | 编写章节大纲 | 六 |',
  '## New Novel Initialization Skill

This skill guides you in building a complete creative framework for a new novel from scratch. Following the correct dependency order, it walks through creating project info, settings, characters, scenes, props, organizations, story lines, relationship networks, and chapter outlines step by step.

---

### Core Principles

1. **Understand before acting**: First obtain project and creation method info, understand available module types and Schemas
2. **Dependency order**: Entity creation has dependencies and must follow the correct sequence
3. **Step-by-step confirmation**: Each creation step requires user confirmation before moving to the next
4. **Schema-driven**: All entity attributes must conform to the JSON Schema defined by the creation method
5. **User-led**: Ask the user at key decision points; do not create everything at once

---

### Dependency Graph and Creation Order

```
Phase 1: Project Foundation
  ├─ Project name and description
  └─ Understand creation method and available module types

Phase 2: World-building Settings
  └─ Setting modules (worldview, writing style, story hooks, etc.)

Phase 3: Core Entities
  ├─ Characters (protagonist → key supporting → secondary)
  ├─ Scenes (primary → secondary)
  ├─ Organizations (if needed)
  └─ Props (if needed)

Phase 4: Relationship Network
  ├─ Inter-character relations
  ├─ Character-organization relations
  └─ Concept nodes and associations

Phase 5: Plot Framework
  ├─ Story lines (main → branch)
  └─ Core plot events

Phase 6: Chapter Planning
  ├─ Chapter creation
  └─ Chapter outlines
```

**Why this order**:
- Settings before characters: Character design needs to be based on the worldview (e.g., the magic system determines character abilities)
- Characters before relations: Both endpoints of a relation must exist first
- Characters before story line events: Events typically revolve around characters
- Story lines before chapters: Chapter outlines need to reference story lines and events

---

### Phase 1: Project Foundation

#### Step 1: Understand the Current Project State

Call `get_novel_overview` to obtain:
- Project name and description
- Creation method ID
- List of available module types
- Existing module statistics

**Key info**: `availableModuleTypes` determines what types of entities and settings you can create. Different creation methods have different available types.

#### Step 2: Refine Project Name and Description

If the project name or description needs improvement, after discussing with the user:
- `rename_novel`: Change the project name
- `update_novel_description`: Set the project synopsis

**Project description should include**:
- Story genre (e.g., fantasy, urban, sci-fi)
- Core theme or message
- Brief story synopsis (1-3 sentences)

---

### Phase 2: World-building Settings

#### Step 1: Understand Setting Types

Call `list_settings` to see existing settings (usually empty for a new novel).

From the `availableModuleTypes` returned by `get_novel_overview`, identify the setting-type modules (e.g., "Worldview", "Writing Style", "Story Hook").

#### Step 2: Get Setting Schemas

Call `get_setting_type_schema(moduleTypeName)` for each setting type to understand what fields need to be filled in.

#### Step 3: Discuss the Worldview with the User

Based on the Schema fields, guide the user to think about:
- What is the world of the story like?
- Are there special rules or systems? (e.g., magic, technology, power systems)
- Historical period and social structure
- Source of the core conflict

#### Step 4: Create Settings

Based on user feedback, call `update_setting` to fill in each setting.

**Note**: Different creation methods have entirely different setting types. You must get the Schema first before filling in; do not assume what fields exist.

---

### Phase 3: Core Entity Creation

#### 3.1 Creating Characters

**Preparation**:

**Step 1**: Call `get_character_schema` to get the character JSON Schema

- Understand what fields need to be filled in for characters
- Note required vs. optional fields
- Different creation methods may have different character Schemas

**Step 2**: Discuss the Character Lineup with the User

Guide the user to think about:
- Who is the protagonist? Core traits and motivations?
- Who are the key supporting characters? Their relationship to the protagonist?
- Antagonist/rival characters?
- Basic info for each character (per Schema fields)

**Creation order**:

```
Protagonist → Core supporting characters (2-3) → Antagonist/rival → Other secondary characters
```

**Step 3**: Call `create_character` one by one

- Fill in complete attributes per Schema
- Wait for confirmation after each character before creating the next
- Suggest starting with 3-5 core characters; more can be added during writing

#### 3.2 Creating Scenes

**Step 1**: Call `get_scene_schema` to get the scene Schema

**Step 2**: Discuss Key Scenes with the User

Guide the user to think about:
- Where does the story mainly take place?
- What are the key scenes? (opening, major turning points, climax)
- Physical characteristics and atmosphere of scenes

**Step 3**: Call `create_scene` one by one

- Suggest starting with 2-4 core scenes

#### 3.3 Creating Organizations (As Needed)

If the story involves organizations/groups/factions:

**Step 1**: Call `get_organization_schema` to get the Schema

**Step 2**: Call `create_organization` to create organizations

#### 3.4 Creating Props (As Needed)

If the story involves important props:

**Step 1**: Call `get_prop_schema` to get the Schema

**Step 2**: Call `create_prop` to create props

---

### Phase 4: Relationship Network Building

After core entities are created, build the relationship network between them.

#### Step 1: Map Out Character Relations

Confirm relationships between characters with the user:
- Relationship types and descriptions between the protagonist and supporting characters
- Character-to-organization affiliations
- Character-to-prop possession relations
- Relationship strength (1-5)

#### Step 2: Batch Create Relations

Call `create_relation` to establish relations one by one:

- `fromName`: Source entity name
- `toName`: Target entity name
- `relationType`: Relationship type
- `description`: Relationship description
- `strength`: Relationship strength

**Creation guidelines**:
- First establish the protagonist''s relations with other characters
- Then character-organization relations
- Finally other inter-entity relations
- For symmetric relations (e.g., "friend"), consider whether bidirectional creation is needed

#### Step 3: Add Concept Nodes (As Needed)

If the story has important abstract concepts (e.g., magic systems, prophecies, bloodlines):

Call `create_node(category="concept")` to create concept nodes, then use `create_relation` to link concepts to entities.

---

### Phase 5: Plot Framework Setup

#### 5.1 Planning Story Lines

**Step 1**: Discuss the Plot Framework with the User

Guide the user to think about:
- What is the core conflict? (main line)
- What subplot threads exist? (branch lines)
- General story arc (beginning → development → climax → resolution)

**Step 2**: Create Story Lines

Call `create_story_line`:
- First create the main line (`lineType: "main"`)
- Then create 1-2 branch lines (`lineType: "branch"`)
- Each story line should have a clear `description` of its core conflict and direction

#### 5.2 Planning Core Events

**Step 1**: Plan Key Events for Each Story Line

Guide the user to think about:
- What are the key turning points in the main line?
- How is the climax designed?
- Are there foreshadows to plant?

**Step 2**: Create Plot Events

Call `create_plot_event`:

- Story lines must be created before events (events link to story lines via `storyLineName`)
- Distribute event types appropriately:
  - `normal`: Regular progression events
  - `turning_point`: Key turning points
  - `climax`: Climax
  - `resolution`: Resolution
  - `foreshadowing`: Foreshadowing

**Creation guidelines**:
- Plan at least 3-5 key events per story line
- The main line should have a complete story arc structure
- Don''t over-plan at this stage; refine as you write

#### 5.3 Plant Initial Foreshadows (As Needed)

If there are clear foreshadow plans:

Call `create_foreshadow` to plant foreshadows, recording:
- Foreshadow content
- Planned resolution chapter

---

### Phase 6: Chapter Planning

#### Step 1: Discuss Chapter Plans with the User

Guide the user to think about:
- How many volumes? Approximately how many chapters per volume?
- What should the opening chapters cover?
- General theme or event for each chapter

#### Step 2: Create Chapters

Call `create_chapter` to create chapters one by one:
- `title`: Chapter title
- `volumeNumber`: Volume number
- `chapterNumber`: Chapter number

**Creation guidelines**:
- Start by creating only the first 5-10 chapters
- Additional chapters can be added as writing progresses
- Chapter titles should be distinctive and reflect the content

#### Step 3: Write Chapter Outlines

For created chapters, call `update_chapter_outline` to write outlines:

Outlines should include:
- Core events of the chapter
- Characters appearing
- Scene transitions
- Story lines being advanced
- Chapter goal (what should readers understand/feel after reading)

---

### Flexible Strategies

#### Strategy 1: Minimal Start

For users eager to start writing, execute only the essential steps:

```
Phase 1 → Phase 3 (only protagonist and 1-2 core characters) → Phase 6 (only Chapter 1)
```

Everything else can be filled in gradually during writing.

#### Strategy 2: Full Planning

For users who prefer thorough preparation, execute all six phases:

```
All six phases in order, with thorough discussion and creation at each stage
```

#### Strategy 3: World-building Driven

For users focused on world-building (e.g., fantasy, sci-fi):

```
Phase 1 → Phase 2 (in depth) → Phase 3 → Phase 4 (focus on concept networks) → Phase 5 → Phase 6
```

#### Strategy 4: Character Driven

For users focused on characters (e.g., romance, ensemble cast):

```
Phase 1 → Phase 3 (deep character creation) → Phase 4 (focus on relationships) → Phase 5 → Phase 6
```

---

### Key Communication Checkpoints

At these checkpoints, you must communicate with the user and get feedback before continuing:

| Checkpoint | What to Confirm |
|------------|----------------|
| After Phase 1 | Is the project name and description satisfactory? Which startup strategy to use? |
| After Phase 2 | Are the world-building settings complete? Any adjustments needed? |
| Phase 3: after every 3-5 characters | Is the character lineup reasonable? Need additions or changes? |
| After Phase 4 | Is the relationship network accurate? Any omissions? |
| After Phase 5 | Is the plot framework satisfactory? Is the story direction clear? |
| After Phase 6 | Is the chapter plan reasonable? Ready to start writing? |

---

### Tool Quick Reference

#### Information Gathering

| Tool Name | Purpose | Phase |
|-----------|---------|-------|
| `get_novel_overview` | Get project info and available module types | 1 |
| `get_character_schema` | Get character Schema | 3 |
| `get_scene_schema` | Get scene Schema | 3 |
| `get_prop_schema` | Get prop Schema | 3 |
| `get_organization_schema` | Get organization Schema | 3 |
| `get_setting_type_schema` | Get setting type Schema | 2 |
| `list_settings` | View existing settings | 2 |

#### Project-Level Operations

| Tool Name | Purpose | Phase |
|-----------|---------|-------|
| `rename_novel` | Change project name | 1 |
| `update_novel_description` | Change project description | 1 |

#### Entity Creation

| Tool Name | Purpose | Phase |
|-----------|---------|-------|
| `create_character` | Create a character | 3 |
| `create_scene` | Create a scene | 3 |
| `create_organization` | Create an organization | 3 |
| `create_prop` | Create a prop | 3 |
| `update_setting` | Fill in settings | 2 |

#### Relationship Building

| Tool Name | Purpose | Phase |
|-----------|---------|-------|
| `create_relation` | Create inter-entity relations | 4 |
| `create_node` | Create concept nodes | 4 |

#### Plot Framework

| Tool Name | Purpose | Phase |
|-----------|---------|-------|
| `create_story_line` | Create a story line | 5 |
| `create_plot_event` | Create a plot event | 5 |
| `create_foreshadow` | Plant a foreshadow | 5 |

#### Chapter Planning

| Tool Name | Purpose | Phase |
|-----------|---------|-------|
| `create_chapter` | Create a chapter | 6 |
| `update_chapter_outline` | Write chapter outlines | 6 |',
  NULL,
  1,
  10,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  is_active = VALUES(is_active),
  sort_order = VALUES(sort_order);
