-- 全局章节操作 Skill / Global Chapter Operations Skill
-- novel_creation_method_id = NULL 表示全局可用 / NULL means globally available
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-chapter-operations.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'chapter-operations',
  '章节全生命周期管理：规划大纲、创建章节、撰写正文、修改内容、管理参与实体，确保章节与小说整体结构保持一致',
  'Full lifecycle chapter management: plan outlines, create chapters, write body text, modify content, manage participating entities, and ensure chapters remain consistent with the overall novel structure',
  '## 章节操作技能

本技能指导你完成章节的规划、创建、撰写、修改和删除操作，并确保章节与小说整体结构保持一致。

---

### 核心原则

1. **先了解全局，再操作局部**：任何章节操作前必须了解小说的整体结构和进度
2. **大纲先行**：先规划大纲，再撰写正文，不要跳过大纲直接写
3. **上下文连贯**：章节内容必须与前后章节、角色状态、剧情走向保持连贯
4. **写入与修改分离**：全新正文用写入模式（覆盖），局部改动用修改模式（替换/插入）
5. **实体关联**：章节创建或修改后，及时更新参与实体（角色、场景、组织、道具）

---

### 一、操作前：信息收集阶段

在执行任何章节操作之前，根据操作类型收集必要信息：

#### 1.1 必须调用的工具

| 场景 | 必须调用 | 说明 |
|------|---------|------|
| **创建章节** | `list_chapters` | 了解现有章节结构，确定卷号和章节号 |
| **创建章节** | `get_plot_overview` | 了解剧情走向，确保新章节契合主线 |
| **撰写正文** | `get_chapter_content` | 获取目标章节的大纲和现有内容 |
| **撰写正文** | `get_chapter_content`（前一章） | 获取前一章正文，确保衔接连贯 |
| **修改内容** | `search_in_chapter` | 定位要修改的文本位置 |
| **删除章节** | `get_chapter_content` | 确认章节内容和字数 |

#### 1.2 上下文收集（按需）

根据操作的复杂度，选择性调用以下工具补充上下文：

- `get_chapter_statistics`：查看全书写作进度、字数分布，发现异常章节
- `get_chapter_outline`：快速查看某章大纲，不加载正文
- `search_across_chapters`：搜索关键词在全书中的出现情况
- `list_characters` / `list_scenes`：查看可用的角色和场景，为章节关联实体做准备
- `get_plot_overview`：了解主线剧情和故事线，确保章节内容不偏离
- `get_story_line_events`：查看具体故事线的事件，确保章节覆盖关键情节
- `query_character_dynamic_info`：查看角色在各章节中的状态变化，确保状态连续

**判断标准**：
- 简单操作（如修改标题、调整章节号）：调研可精简
- 复杂操作（如撰写新章节、大幅修改正文）：必须充分调研

---

### 二、创建章节

> `create_chapter` 只创建大纲骨架，不生成正文。适用于批量规划章节结构。

#### 2.1 流程

```
了解小说全貌 → 设计大纲 → create_chapter → 评估实体关联
```

#### 2.2 步骤

**Step 1**：了解小说全貌

创建章节前必须充分了解小说的素材和结构，根据实际情况调用：

- `get_novel_overview`：获取小说基本信息
- `list_chapters`：了解已有章节结构（如果有的话），确定卷号和章节号
- `get_plot_overview`：了解主线剧情和故事线走向
- `list_characters`：了解现有角色阵容
- `list_scenes`：了解已有的场景
- `list_settings`：了解世界观设定

> **特别注意**：新小说可能还没有章节，此时不能仅依赖 `list_chapters`，需要从角色、场景、设定、剧情等维度全面了解素材后再规划章节。

**Step 2**：设计章节大纲

- 大纲要包含：核心事件、参与角色、场景转换、情绪基调
- 基于已有素材（角色、场景、设定）展开情节，不要凭空捏造
- 如果已有章节，与前后章节的衔接关系要在大纲中体现

**Step 3**：调用 `create_chapter`

- `title`：章节标题（不可与已有章节重复）
- `chapterNumber`：章节号（不可与同卷已有章节冲突）
- `outline`：章节大纲内容
- `volumeNumber`：卷号，默认 1

**Step 4**：提醒用户后续操作

- 建议为新章节关联参与实体（`update_chapter_entities`）
- 若需要撰写正文，引导用户使用写入流程

#### 2.3 批量创建

当用户要求一次性规划多个章节（如"帮我规划第1-10章的大纲"）：

- 先充分了解小说全貌（角色、场景、设定、剧情）
- 按顺序逐章调用 `create_chapter`
- 每章的大纲要与前一章自然衔接
- 完成后用 `list_chapters` 确认整体结构

---

### 三、更新大纲

#### 3.1 流程

```
get_chapter_outline → 评估修改范围 → update_chapter_outline
```

#### 3.2 步骤

**Step 1**：调用 `get_chapter_outline` 获取当前大纲

**Step 2**：根据用户需求修改大纲

- 如果是微调（补充细节、修正措辞）：直接修改
- 如果是大改（改变核心事件、调整剧情走向）：需额外调研前后章节

**Step 3**：调用 `update_chapter_outline` 更新

- `outline` 参数传入完整的新大纲（覆盖模式）

---

### 四、撰写正文（写入模式）

> 使用 `start_chapter_write` + `end_chapter_write`，适用于为章节生成全新的完整正文。
> 写入内容会**覆盖**原有正文。

#### 4.1 流程

```
get_chapter_content（目标章节） → get_chapter_content（前一章） → 收集上下文 → start_chapter_write → 输出正文 → end_chapter_write
```

#### 4.2 步骤

**Step 1**：调用 `get_chapter_content` 获取目标章节信息

- 阅读大纲，确认要写的内容方向
- 注意 `characterIds` / `sceneIds` 等参与实体，写作时要涉及这些要素

**Step 2**：调用 `get_chapter_content` 获取前一章内容

- 阅读前一章末尾段落，确保开头衔接自然
- 注意前一章的叙事节奏和风格

**Step 3**：根据需要收集更多上下文

- 查看相关角色详情（`get_character_detail`），确保人物言行一致
- 查看场景详情（`get_scene_detail`），确保环境描写准确
- 查看角色动态（`query_character_dynamic_info`），确保角色状态连续

**Step 4**：调用 `start_chapter_write`

- 传入 `chapterTitle` 或 `chapterId` 定位目标章节

**Step 5**：直接输出完整的章节正文

- **只输出正文内容**，不要输出解释、评论或标注
- 正文风格要与前文保持一致
- 按大纲的核心事件逐步展开
- 注意节奏把控：开头承接前章 → 主体推进事件 → 结尾留有悬念或转折

**Step 6**：调用 `end_chapter_write` 结束写入

#### 4.3 注意事项

- 写入期间**禁止**输出非正文内容（解释、评论、markdown 标记等）
- 如需与用户交流，必须先调用 `end_chapter_write` 结束写入模式
- 如果只是局部修改，不要用写入模式，改用修改模式（见第五节）

---

### 五、修改正文（修改模式）

> 使用 `start_chapter_modify` + `end_chapter_modify`，适用于对现有正文做局部替换或插入。

#### 5.1 流程

```
search_in_chapter → 确认目标文本 → start_chapter_modify → 输出新内容 → end_chapter_modify
```

#### 5.2 三种操作类型

| 操作 | 说明 | 场景 |
|------|------|------|
| `replace` | 替换 searchText 为新内容 | 修改错别字、改写段落、替换名称 |
| `insert_after` | 在 searchText 之后插入 | 在某段后添加新内容 |
| `insert_before` | 在 searchText 之前插入 | 在某段前添加新内容 |

#### 5.3 步骤

**Step 1**：调用 `search_in_chapter` 定位目标文本

- 确认 searchText 在章节中存在
- 如果有多处匹配，需要选择足够长的文本来唯一定位

**Step 2**：调用 `start_chapter_modify`

- `chapterTitle` 或 `chapterId`：定位章节
- `operation`：选择操作类型
- `searchText`：定位文本（必须在章节中存在）

**Step 3**：输出新内容

- **只输出替换/插入的内容**，不要输出解释或评论

**Step 4**：调用 `end_chapter_modify` 结束修改

#### 5.4 典型修改场景

| 场景 | 操作类型 | searchText 选择 |
|------|---------|----------------|
| 改错别字/改名 | `replace` | 包含错误文字的短句 |
| 改写一段描写 | `replace` | 要改写的完整段落 |
| 在某段后补充内容 | `insert_after` | 目标段落的最后一句 |
| 在章节开头添加内容 | `insert_before` | 章节正文的第一句 |

#### 5.5 注意事项

- searchText 必须在章节中**精确存在**，否则会报错
- 如果多处出现相同文本，使用更长的文本片段来唯一定位
- 修改前建议先用 `read_chapter_section` 阅读周围上下文，确保修改后的内容衔接自然

---

### 六、管理参与实体

#### 6.1 何时更新

- 创建新章节后
- 撰写正文后（正文中出现了新的角色/场景/道具/组织）
- 角色或场景发生变动后

#### 6.2 流程

```
get_chapter_content → 分析参与实体 → list_characters/list_scenes → update_chapter_entities
```

#### 6.3 步骤

**Step 1**：调用 `get_chapter_content` 查看章节的 `characterIds`、`sceneIds` 等现有关联

**Step 2**：分析正文（或大纲）中实际参与的实体

**Step 3**：调用 `list_characters` / `list_scenes` 等获取实体 ID

**Step 4**：调用 `update_chapter_entities` 更新

- 注意：每个参数都是**覆盖**操作，不是追加
- 如果要追加，需要先获取现有列表，合并后再更新

---

### 七、修改章节标题/顺序

#### 7.1 使用 `update_chapter_title`

- **定位参数**和**更新参数**是分开的两组，不要混淆
- 定位参数（三选一）：`chapterId`、`chapterTitle`、`volumeNumber` + `chapterNumber`
- 更新参数（至少一个）：`newTitle`、`newVolumeNumber`、`newChapterNumber`

#### 7.2 常见错误

- 把 `chapterNumber`（定位参数）误用为更新参数 → 应该用 `newChapterNumber`
- 新标题与已有章节重复
- 新卷号+章节号组合与已有章节冲突

---

### 八、删除章节

#### 8.1 流程

```
get_chapter_content → 评估影响 → delete_chapter
```

#### 8.2 步骤

**Step 1**：调用 `get_chapter_content` 确认章节信息和字数

**Step 2**：影响评估

- 章节包含多少字的正文
- 章节关联了哪些角色/场景/组织/道具
- 删除后对章节编号连续性的影响
- 删除后对剧情连贯性的影响

**Step 3**：调用 `delete_chapter` 删除

---

### 九、操作后：影响评估阶段

每次章节操作完成后，评估以下维度的影响并汇报给用户：

#### 9.1 评估清单

| 维度 | 评估内容 | 可能需要的操作 |
|------|---------|--------------|
| **参与实体** | 正文中出场的角色/场景/道具是否已关联 | `update_chapter_entities` |
| **前后衔接** | 与前一章、后一章的衔接是否自然 | 修改开头/结尾段落 |
| **剧情一致** | 章节内容是否符合大纲和主线剧情 | 提醒用户检查 |
| **角色状态** | 角色在本章中的行为是否符合其设定 | 提醒用户审查角色一致性 |
| **伏笔线索** | 本章是否涉及伏笔的埋设或回收 | 提醒用户检查伏笔设计 |
| **章节编号** | 创建/删除后章节编号是否连续 | `update_chapter_title` 调整编号 |

#### 9.2 汇报格式

操作完成后，向用户简明扼要地汇报：

1. **已完成的操作**：章节创建/大纲更新/正文撰写/内容修改/删除
2. **内容概要**：字数、涉及的关键角色和事件
3. **建议后续操作**：如需额外处理，给出具体建议

---

### 十、工具速查

#### 查询工具

| 工具名 | 用途 | 关键参数 |
|--------|------|---------|
| `list_chapters` | 列出所有章节 | `includeOutline?`, `includeWordCount?`, `limit?`, `offset?` |
| `get_chapter_content` | 获取章节完整内容 | `chapterId` 或 `chapterTitle`, `includeFullText?` |
| `get_chapter_outline` | 获取章节大纲 | `chapterId` 或 `chapterTitle` |
| `get_chapter_statistics` | 获取章节统计信息 | 无参数 |
| `search_across_chapters` | 跨章节搜索关键词 | `keyword`, `searchIn?`, `contextChars?`, `limit?` |
| `search_in_chapter` | 章节内搜索关键词 | `chapterId`/`chapterTitle`, `keyword`, `contextChars?` |
| `read_chapter_section` | 分段读取长章节 | `chapterId`/`chapterTitle`, `offset?`, `limit?` |

#### 变更工具

| 工具名 | 用途 | 关键参数 |
|--------|------|---------|
| `create_chapter` | 创建章节（只含大纲） | `title`, `chapterNumber`, `outline`, `volumeNumber?` |
| `update_chapter_outline` | 更新章节大纲 | `chapterId`/`chapterTitle`, `outline` |
| `update_chapter_title` | 修改标题/卷号/章节号 | 定位参数 + `newTitle?`/`newVolumeNumber?`/`newChapterNumber?` |
| `update_chapter_entities` | 更新参与实体 | 定位参数 + `characterIds?`/`sceneIds?`/`organizationIds?`/`propIds?` |
| `delete_chapter` | 删除章节 | `chapterId`/`chapterTitle` 或 `volumeNumber`+`chapterNumber` |

#### 写入工具（覆盖模式）

| 工具名 | 用途 | 关键参数 |
|--------|------|---------|
| `start_chapter_write` | 开始写入新正文 | `chapterId` 或 `chapterTitle` |
| `end_chapter_write` | 结束写入 | 无参数 |

#### 修改工具（替换/插入模式）

| 工具名 | 用途 | 关键参数 |
|--------|------|---------|
| `start_chapter_modify` | 开始修改正文 | `chapterId`/`chapterTitle`, `operation`, `searchText` |
| `end_chapter_modify` | 结束修改 | 无参数 |

#### 其他常用工具

| 工具名 | 用途 |
|--------|------|
| `get_plot_overview` | 获取剧情概览 |
| `get_story_line_events` | 获取故事线事件 |
| `get_character_detail` | 获取角色详情 |
| `get_scene_detail` | 获取场景详情 |
| `query_character_dynamic_info` | 查询角色动态状态 |
| `list_characters` | 列出所有角色 |
| `list_scenes` | 列出所有场景 |',
  '## Chapter Operations Skill

This skill guides you through chapter planning, creation, writing, modification, and deletion operations, ensuring chapters remain consistent with the overall novel structure.

---

### Core Principles

1. **Understand the whole before acting on parts**: Understand the overall novel structure and progress before any chapter operation
2. **Outline first**: Plan the outline before writing body text; do not skip the outline
3. **Contextual continuity**: Chapter content must remain coherent with surrounding chapters, character states, and plot direction
4. **Separate writing and modification**: Use write mode (overwrite) for brand new body text, use modify mode (replace/insert) for local changes
5. **Entity association**: After chapter creation or modification, promptly update participating entities (characters, scenes, organizations, props)

---

### I. Pre-Operation: Information Gathering Phase

Before performing any chapter operation, gather necessary information based on the operation type:

#### 1.1 Required Tool Calls

| Scenario | Required Call | Description |
|----------|--------------|-------------|
| **Create chapter** | `list_chapters` | Understand existing chapter structure, determine volume and chapter numbers |
| **Create chapter** | `get_plot_overview` | Understand plot direction, ensure new chapter fits the main storyline |
| **Write body text** | `get_chapter_content` | Get target chapter''s outline and existing content |
| **Write body text** | `get_chapter_content` (previous chapter) | Get previous chapter''s body text to ensure smooth transition |
| **Modify content** | `search_in_chapter` | Locate the text to be modified |
| **Delete chapter** | `get_chapter_content` | Confirm chapter content and word count |

#### 1.2 Context Gathering (As Needed)

Depending on the complexity of the operation, selectively call the following tools to supplement context:

- `get_chapter_statistics`: View overall writing progress, word count distribution, identify abnormal chapters
- `get_chapter_outline`: Quickly view a chapter''s outline without loading body text
- `search_across_chapters`: Search for keyword occurrences across all chapters
- `list_characters` / `list_scenes`: View available characters and scenes for entity association
- `get_plot_overview`: Understand main plot and storylines to ensure chapter content stays on track
- `get_story_line_events`: View specific storyline events to ensure the chapter covers key plot points
- `query_character_dynamic_info`: View character state changes across chapters to ensure state continuity

**Decision criteria**:
- Simple operations (e.g., modifying title, adjusting chapter number): Research can be streamlined
- Complex operations (e.g., writing a new chapter, major body text revision): Thorough research is required

---

### II. Create Chapter

> `create_chapter` only creates the outline skeleton without generating body text. Suitable for batch planning of chapter structure.

#### 2.1 Workflow

```
understand novel overview → design outline → create_chapter → assess entity associations
```

#### 2.2 Steps

**Step 1**: Understand the novel overview

Before creating chapters, you must thoroughly understand the novel''s materials and structure. Call as needed:

- `get_novel_overview`: Get basic novel information
- `list_chapters`: Understand existing chapter structure (if any), determine volume and chapter numbers
- `get_plot_overview`: Understand main plot and storyline direction
- `list_characters`: Understand the existing character roster
- `list_scenes`: Understand existing scenes
- `list_settings`: Understand world-building settings

> **Important note**: A new novel may have no chapters yet. In this case, do not rely solely on `list_chapters`. You need to comprehensively understand the materials from characters, scenes, settings, and plot before planning chapters.

**Step 2**: Design the chapter outline

- The outline should include: core events, participating characters, scene transitions, emotional tone
- Develop the plot based on existing materials (characters, scenes, settings); do not fabricate from nothing
- If chapters already exist, the connection with preceding and following chapters should be reflected in the outline

**Step 3**: Call `create_chapter`

- `title`: Chapter title (must not duplicate existing chapters)
- `chapterNumber`: Chapter number (must not conflict with existing chapters in the same volume)
- `outline`: Chapter outline content
- `volumeNumber`: Volume number, default 1

**Step 4**: Remind user of follow-up actions

- Suggest associating participating entities with the new chapter (`update_chapter_entities`)
- If body text needs to be written, guide the user to use the write workflow

#### 2.3 Batch Creation

When the user asks to plan multiple chapters at once (e.g., "plan outlines for chapters 1-10"):

- First thoroughly understand the novel overview (characters, scenes, settings, plot)
- Call `create_chapter` sequentially for each chapter
- Each chapter''s outline should naturally connect to the previous chapter
- After completion, use `list_chapters` to confirm the overall structure

---

### III. Update Outline

#### 3.1 Workflow

```
get_chapter_outline → assess scope of changes → update_chapter_outline
```

#### 3.2 Steps

**Step 1**: Call `get_chapter_outline` to get the current outline

**Step 2**: Modify the outline based on user requirements

- For minor adjustments (adding details, fixing wording): modify directly
- For major changes (changing core events, adjusting plot direction): research surrounding chapters first

**Step 3**: Call `update_chapter_outline` to update

- The `outline` parameter takes the complete new outline (overwrite mode)

---

### IV. Write Body Text (Write Mode)

> Uses `start_chapter_write` + `end_chapter_write`. Suitable for generating brand new complete body text for a chapter.
> Written content will **overwrite** existing body text.

#### 4.1 Workflow

```
get_chapter_content (target chapter) → get_chapter_content (previous chapter) → gather context → start_chapter_write → output body text → end_chapter_write
```

#### 4.2 Steps

**Step 1**: Call `get_chapter_content` to get target chapter information

- Read the outline to confirm the content direction
- Note `characterIds` / `sceneIds` and other participating entities to include them in the writing

**Step 2**: Call `get_chapter_content` to get the previous chapter''s content

- Read the closing paragraphs of the previous chapter to ensure a natural transition
- Note the previous chapter''s narrative rhythm and style

**Step 3**: Gather additional context as needed

- Check relevant character details (`get_character_detail`) to ensure consistent character behavior
- Check scene details (`get_scene_detail`) to ensure accurate environment descriptions
- Check character dynamics (`query_character_dynamic_info`) to ensure character state continuity

**Step 4**: Call `start_chapter_write`

- Pass `chapterTitle` or `chapterId` to locate the target chapter

**Step 5**: Output the complete chapter body text

- **Output only the body text content**; do not output explanations, comments, or markers
- The writing style should be consistent with previous text
- Develop the outline''s core events step by step
- Control the pacing: opening connects to previous chapter → main body advances events → ending leaves suspense or a turning point

**Step 6**: Call `end_chapter_write` to end writing

#### 4.3 Notes

- During writing, it is **forbidden** to output non-body content (explanations, comments, markdown markers, etc.)
- If you need to communicate with the user, you must call `end_chapter_write` to exit write mode first
- If only making local changes, do not use write mode; use modify mode instead (see Section V)

---

### V. Modify Body Text (Modify Mode)

> Uses `start_chapter_modify` + `end_chapter_modify`. Suitable for making local replacements or insertions in existing body text.

#### 5.1 Workflow

```
search_in_chapter → confirm target text → start_chapter_modify → output new content → end_chapter_modify
```

#### 5.2 Three Operation Types

| Operation | Description | Scenarios |
|-----------|-------------|-----------|
| `replace` | Replace searchText with new content | Fix typos, rewrite paragraphs, replace names |
| `insert_after` | Insert after searchText | Add new content after a specific paragraph |
| `insert_before` | Insert before searchText | Add new content before a specific paragraph |

#### 5.3 Steps

**Step 1**: Call `search_in_chapter` to locate the target text

- Confirm that searchText exists in the chapter
- If there are multiple matches, select a longer text segment for unique positioning

**Step 2**: Call `start_chapter_modify`

- `chapterTitle` or `chapterId`: locate the chapter
- `operation`: select the operation type
- `searchText`: locating text (must exist in the chapter)

**Step 3**: Output new content

- **Output only the replacement/insertion content**; do not output explanations or comments

**Step 4**: Call `end_chapter_modify` to end modification

#### 5.4 Typical Modification Scenarios

| Scenario | Operation Type | searchText Selection |
|----------|---------------|---------------------|
| Fix typo / rename | `replace` | Short sentence containing the error |
| Rewrite a description | `replace` | The complete paragraph to rewrite |
| Add content after a paragraph | `insert_after` | The last sentence of the target paragraph |
| Add content at chapter beginning | `insert_before` | The first sentence of the chapter body |

#### 5.5 Notes

- searchText must **exactly exist** in the chapter; otherwise an error will be returned
- If the same text appears in multiple places, use a longer text fragment for unique positioning
- Before modifying, consider using `read_chapter_section` to read the surrounding context to ensure the modified content transitions naturally

---

### VI. Manage Participating Entities

#### 6.1 When to Update

- After creating a new chapter
- After writing body text (new characters/scenes/props/organizations appear in the text)
- After characters or scenes change

#### 6.2 Workflow

```
get_chapter_content → analyze participating entities → list_characters/list_scenes → update_chapter_entities
```

#### 6.3 Steps

**Step 1**: Call `get_chapter_content` to view the chapter''s existing `characterIds`, `sceneIds`, etc.

**Step 2**: Analyze the entities that actually participate in the body text (or outline)

**Step 3**: Call `list_characters` / `list_scenes` etc. to get entity IDs

**Step 4**: Call `update_chapter_entities` to update

- Note: each parameter is an **overwrite** operation, not an append
- To append, first get the existing list, merge, then update

---

### VII. Modify Chapter Title/Order

#### 7.1 Using `update_chapter_title`

- **Locating parameters** and **update parameters** are two separate groups; do not confuse them
- Locating parameters (choose one): `chapterId`, `chapterTitle`, `volumeNumber` + `chapterNumber`
- Update parameters (at least one): `newTitle`, `newVolumeNumber`, `newChapterNumber`

#### 7.2 Common Mistakes

- Using `chapterNumber` (locating parameter) as an update parameter → should use `newChapterNumber`
- New title duplicating an existing chapter
- New volume + chapter number combination conflicting with an existing chapter

---

### VIII. Delete Chapter

#### 8.1 Workflow

```
get_chapter_content → assess impact → delete_chapter
```

#### 8.2 Steps

**Step 1**: Call `get_chapter_content` to confirm chapter information and word count

**Step 2**: Impact assessment

- How many words of body text the chapter contains
- Which characters/scenes/organizations/props are associated with the chapter
- Impact on chapter numbering continuity after deletion
- Impact on plot coherence after deletion

**Step 3**: Call `delete_chapter` to delete

---

### IX. Post-Operation: Impact Assessment Phase

After each chapter operation, assess the impact across the following dimensions and report to the user:

#### 9.1 Assessment Checklist

| Dimension | Assessment Content | Possible Actions |
|-----------|-------------------|-----------------|
| **Participating entities** | Are the characters/scenes/props appearing in the text associated? | `update_chapter_entities` |
| **Continuity** | Is the transition with the previous and next chapters natural? | Modify opening/closing paragraphs |
| **Plot consistency** | Does the chapter content match the outline and main plot? | Remind user to check |
| **Character state** | Does the character''s behavior in this chapter match their settings? | Remind user to review character consistency |
| **Foreshadowing** | Does this chapter involve planting or resolving foreshadowing? | Remind user to check foreshadowing design |
| **Chapter numbering** | Is the chapter numbering continuous after creation/deletion? | `update_chapter_title` to adjust numbering |

#### 9.2 Report Format

After the operation is complete, provide a concise report to the user:

1. **Completed operations**: Chapter creation/outline update/body text writing/content modification/deletion
2. **Content summary**: Word count, key characters and events involved
3. **Suggested follow-up actions**: If additional handling is needed, provide specific suggestions

---

### X. Tool Quick Reference

#### Query Tools

| Tool Name | Purpose | Key Parameters |
|-----------|---------|---------------|
| `list_chapters` | List all chapters | `includeOutline?`, `includeWordCount?`, `limit?`, `offset?` |
| `get_chapter_content` | Get complete chapter content | `chapterId` or `chapterTitle`, `includeFullText?` |
| `get_chapter_outline` | Get chapter outline | `chapterId` or `chapterTitle` |
| `get_chapter_statistics` | Get chapter statistics | No parameters |
| `search_across_chapters` | Search keywords across chapters | `keyword`, `searchIn?`, `contextChars?`, `limit?` |
| `search_in_chapter` | Search keywords in a chapter | `chapterId`/`chapterTitle`, `keyword`, `contextChars?` |
| `read_chapter_section` | Read a section of a long chapter | `chapterId`/`chapterTitle`, `offset?`, `limit?` |

#### Mutation Tools

| Tool Name | Purpose | Key Parameters |
|-----------|---------|---------------|
| `create_chapter` | Create chapter (outline only) | `title`, `chapterNumber`, `outline`, `volumeNumber?` |
| `update_chapter_outline` | Update chapter outline | `chapterId`/`chapterTitle`, `outline` |
| `update_chapter_title` | Modify title/volume/chapter number | Locating params + `newTitle?`/`newVolumeNumber?`/`newChapterNumber?` |
| `update_chapter_entities` | Update participating entities | Locating params + `characterIds?`/`sceneIds?`/`organizationIds?`/`propIds?` |
| `delete_chapter` | Delete chapter | `chapterId`/`chapterTitle` or `volumeNumber`+`chapterNumber` |

#### Write Tools (Overwrite Mode)

| Tool Name | Purpose | Key Parameters |
|-----------|---------|---------------|
| `start_chapter_write` | Start writing new body text | `chapterId` or `chapterTitle` |
| `end_chapter_write` | End writing | No parameters |

#### Modify Tools (Replace/Insert Mode)

| Tool Name | Purpose | Key Parameters |
|-----------|---------|---------------|
| `start_chapter_modify` | Start modifying body text | `chapterId`/`chapterTitle`, `operation`, `searchText` |
| `end_chapter_modify` | End modification | No parameters |

#### Other Commonly Used Tools

| Tool Name | Purpose |
|-----------|---------|
| `get_plot_overview` | Get plot overview |
| `get_story_line_events` | Get storyline events |
| `get_character_detail` | Get character details |
| `get_scene_detail` | Get scene details |
| `query_character_dynamic_info` | Query character dynamic state |
| `list_characters` | List all characters |
| `list_scenes` | List all scenes |',

  NULL,
  1,
  0,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  updated_at = NOW();
