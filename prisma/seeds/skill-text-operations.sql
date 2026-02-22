-- 全局正文操作 Skill / Global Text Operations Skill
-- novel_creation_method_id = NULL 表示全局可用 / NULL means globally available
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-text-operations.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'text-operations',
  '正文全生命周期管理：撰写章节正文、修改正文内容、管理参与实体，确保正文与大纲和前后章节保持连贯',
  'Full lifecycle body text management: write chapter body text, modify text content, manage participating entities, ensuring body text remains coherent with outlines and surrounding chapters',
  '## 正文操作技能

本技能指导你完成章节正文的撰写和修改操作，确保正文与大纲和前后章节保持连贯。

---

### 核心原则

1. **禁止向用户提问**：禁止询问偏好、想法、选择。禁止在调用工具之前征求意见。信息不足时自行做出合理决策。用户通过系统确认 UI 审批
2. **上下文连贯**：章节正文必须与前后章节、角色状态、剧情走向保持连贯
3. **写入与修改分离**：全新正文用写入模式（覆盖），局部改动用修改模式（替换/插入）
4. **实体关联**：正文撰写或修改后，及时更新参与实体（角色、场景、组织、道具）

---

### 一、操作前：信息收集阶段

在执行任何正文操作之前，根据操作类型收集必要信息：

#### 1.1 必须调用的工具

| 场景 | 必须调用 | 说明 |
|------|---------|------|
| **撰写正文** | `get_chapter_with_context` | 获取目标章节及前一章的大纲和内容（`prevCount=1, includeFullText=true, includeSurroundingFullText=true`） |
| **修改正文** | `search_in_chapter` | 定位要修改的文本位置 |

#### 1.2 上下文收集（按需）

根据操作的复杂度，选择性调用以下工具补充上下文：

- `list_settings`：获取所有设定模块内容（世界观、核心设定等），作为创意决策的基础
- `get_chapter_statistics`：查看全书写作进度、字数分布
- `search_across_chapters`：搜索关键词在全书中的出现情况
- `list_characters` / `list_scenes`：查看可用的角色和场景
- `get_character_detail`：查看相关角色详情，确保人物言行一致
- `get_scene_detail`：查看场景详情，确保环境描写准确
- `get_plot_overview`：了解主线剧情和故事线，确保章节内容不偏离
- `get_story_line_events`：查看具体故事线的事件，确保章节覆盖关键情节
- `query_character_dynamic_info`：查看角色在各章节中的状态变化，确保状态连续
- `read_chapter_section`：分段阅读长章节正文

**判断标准**：
- 简单操作（如修改错别字、替换名称）：调研可精简
- 复杂操作（如撰写新章节正文、大幅改写段落）：必须充分调研

---

### 二、撰写正文（写入模式）

> 使用 `start_chapter_write` + `end_chapter_write`，适用于为章节生成全新的完整正文。
> 写入内容会**覆盖**原有正文。

#### 2.1 流程

```
get_chapter_with_context → 收集上下文 → start_chapter_write → 输出正文 → end_chapter_write
```

#### 2.2 步骤

**Step 1**：调用 `get_chapter_with_context` 获取目标章节及前一章信息

- 参数：`prevCount=1, includeFullText=true, includeSurroundingFullText=true`
- 阅读目标章节大纲，确认要写的内容方向
- 注意 `characterIds` / `sceneIds` 等参与实体，写作时要涉及这些要素
- 阅读前一章末尾段落，确保开头衔接自然
- 注意前一章的叙事节奏和风格

**Step 2**：根据需要收集更多上下文

- 查看相关角色详情（`get_character_detail`），确保人物言行一致
- 查看场景详情（`get_scene_detail`），确保环境描写准确
- 查看角色动态（`query_character_dynamic_info`），确保角色状态连续

**Step 3**：调用 `start_chapter_write`

- 传入 `chapterTitle` 或 `chapterId` 定位目标章节

**Step 4**：直接输出完整的章节正文

- **只输出正文内容**，不要输出解释、评论或标注
- 正文风格要与前文保持一致
- 按大纲的核心事件逐步展开
- 注意节奏把控：开头承接前章 → 主体推进事件 → 结尾留有悬念或转折

**Step 5**：调用 `end_chapter_write` 结束写入

#### 2.3 注意事项

- 写入期间**禁止**输出非正文内容（解释、评论、markdown 标记等）
- 如需输出非正文内容（如影响评估报告），必须先调用 `end_chapter_write` 结束写入模式
- 如果只是局部修改，不要用写入模式，改用修改模式（见第三节）

---

### 三、修改正文（修改模式）

> 使用 `start_chapter_modify` + `end_chapter_modify`，适用于对现有正文做局部替换或插入。

#### 3.1 流程

```
search_in_chapter → 确认目标文本 → start_chapter_modify → 输出新内容 → end_chapter_modify
```

#### 3.2 三种操作类型

| 操作 | 说明 | 场景 |
|------|------|------|
| `replace` | 替换 searchText 为新内容 | 修改错别字、改写段落、替换名称 |
| `insert_after` | 在 searchText 之后插入 | 在某段后添加新内容 |
| `insert_before` | 在 searchText 之前插入 | 在某段前添加新内容 |

#### 3.3 步骤

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

#### 3.4 典型修改场景

| 场景 | 操作类型 | searchText 选择 |
|------|---------|----------------|
| 改错别字/改名 | `replace` | 包含错误文字的短句 |
| 改写一段描写 | `replace` | 要改写的完整段落 |
| 在某段后补充内容 | `insert_after` | 目标段落的最后一句 |
| 在章节开头添加内容 | `insert_before` | 章节正文的第一句 |

#### 3.5 注意事项

- searchText 必须在章节中**精确存在**，否则会报错
- 如果多处出现相同文本，使用更长的文本片段来唯一定位
- 修改前建议先用 `read_chapter_section` 阅读周围上下文，确保修改后的内容衔接自然

---

### 四、管理参与实体

#### 4.1 何时更新

- 撰写正文后（正文中出现了新的角色/场景/道具/组织）
- 修改正文后（实体变动）

#### 4.2 流程

```
get_chapter_content → 分析参与实体 → list_characters/list_scenes → update_chapter_entities
```

#### 4.3 步骤

**Step 1**：调用 `get_chapter_content` 查看章节的 `characterIds`、`sceneIds` 等现有关联

**Step 2**：分析正文中实际参与的实体

**Step 3**：调用 `list_characters` / `list_scenes` 等获取实体 ID

**Step 4**：调用 `update_chapter_entities` 更新

- 注意：每个参数都是**覆盖**操作，不是追加
- 如果要追加，需要先获取现有列表，合并后再更新

---

### 五、操作后：影响评估阶段

每次正文操作完成后，评估以下维度的影响：

#### 5.1 评估清单

| 维度 | 评估内容 | 可能需要的操作 |
|------|---------|--------------|
| **参与实体** | 正文中出场的角色/场景/道具是否已关联 | `update_chapter_entities` |
| **前后衔接** | 与前一章、后一章的正文衔接是否自然 | 修改开头/结尾段落 |
| **剧情一致** | 章节正文是否符合大纲和主线剧情 | 调整正文内容 |
| **角色状态** | 角色在本章中的行为是否符合其设定 | 修改相关描写 |
| **伏笔线索** | 本章是否涉及伏笔的埋设或回收 | 检查伏笔设计 |

#### 5.2 汇报格式

操作完成后，简明扼要地汇报：

1. **已完成的操作**：正文撰写/正文修改
2. **内容概要**：字数、涉及的关键角色和事件
3. **建议后续操作**：如需额外处理，给出具体建议

---

### 六、工具速查

#### 查询工具

| 工具名 | 用途 | 关键参数 |
|--------|------|---------|
| `get_chapter_with_context` | 获取章节及前后章节内容 | `chapterId`/`chapterTitle`/`volumeNumber`+`chapterNumber`, `prevCount?`, `nextCount?`, `includeFullText?`, `includeSurroundingFullText?` |
| `list_chapters` | 列出所有章节 | `includeOutline?`, `includeWordCount?`, `limit?`, `offset?` |
| `get_chapter_content` | 获取章节完整内容 | `chapterId` 或 `chapterTitle`, `includeFullText?` |
| `get_chapter_outline` | 获取章节大纲 | `chapterId` 或 `chapterTitle` |
| `get_chapter_statistics` | 获取章节统计信息 | 无参数 |
| `search_across_chapters` | 跨章节搜索关键词 | `keyword`, `searchIn?`, `contextChars?`, `limit?` |
| `search_in_chapter` | 章节内搜索关键词 | `chapterId`/`chapterTitle`, `keyword`, `contextChars?` |
| `read_chapter_section` | 分段读取长章节 | `chapterId`/`chapterTitle`, `offset?`, `limit?` |

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
| `list_scenes` | 列出所有场景 |
| `update_chapter_entities` | 更新参与实体 |',
  '## Text Operations Skill

This skill guides you through chapter body text writing and modification operations, ensuring body text remains coherent with outlines and surrounding chapters.

---

### Core Principles

1. **NEVER ask the user any questions**: Do not ask for preferences, ideas, or choices. Do not seek input before calling tools. When information is insufficient, make reasonable decisions on your own. Users review via system confirmation UI
2. **Contextual continuity**: Chapter body text must remain coherent with surrounding chapters, character states, and plot direction
3. **Separate writing and modification**: Use write mode (overwrite) for brand new body text, use modify mode (replace/insert) for local changes
4. **Entity association**: After writing or modifying body text, promptly update participating entities (characters, scenes, organizations, props)

---

### I. Pre-Operation: Information Gathering Phase

Before performing any text operation, gather necessary information based on the operation type:

#### 1.1 Required Tool Calls

| Scenario | Required Call | Description |
|----------|--------------|-------------|
| **Write body text** | `get_chapter_with_context` | Get target chapter and previous chapter''s outline and content (`prevCount=1, includeFullText=true, includeSurroundingFullText=true`) |
| **Modify content** | `search_in_chapter` | Locate the text to be modified |

#### 1.2 Context Gathering (As Needed)

Depending on the complexity of the operation, selectively call the following tools to supplement context:

- `list_settings`: Get all setting module contents (worldview, core settings, etc.) as foundation for creative decisions
- `get_chapter_statistics`: View overall writing progress, word count distribution
- `search_across_chapters`: Search for keyword occurrences across all chapters
- `list_characters` / `list_scenes`: View available characters and scenes
- `get_character_detail`: Check relevant character details to ensure consistent character behavior
- `get_scene_detail`: Check scene details to ensure accurate environment descriptions
- `get_plot_overview`: Understand main plot and storylines to ensure chapter content stays on track
- `get_story_line_events`: View specific storyline events to ensure the chapter covers key plot points
- `query_character_dynamic_info`: View character state changes across chapters to ensure state continuity
- `read_chapter_section`: Read sections of long chapter body text

**Decision criteria**:
- Simple operations (e.g., fixing typos, replacing names): Research can be streamlined
- Complex operations (e.g., writing a new chapter, major paragraph rewrite): Thorough research is required

---

### II. Write Body Text (Write Mode)

> Uses `start_chapter_write` + `end_chapter_write`. Suitable for generating brand new complete body text for a chapter.
> Written content will **overwrite** existing body text.

#### 2.1 Workflow

```
get_chapter_with_context → gather context → start_chapter_write → output body text → end_chapter_write
```

#### 2.2 Steps

**Step 1**: Call `get_chapter_with_context` to get the target chapter and previous chapter information

- Parameters: `prevCount=1, includeFullText=true, includeSurroundingFullText=true`
- Read the target chapter''s outline to confirm the content direction
- Note `characterIds` / `sceneIds` and other participating entities to include them in the writing
- Read the closing paragraphs of the previous chapter to ensure a natural transition
- Note the previous chapter''s narrative rhythm and style

**Step 2**: Gather additional context as needed

- Check relevant character details (`get_character_detail`) to ensure consistent character behavior
- Check scene details (`get_scene_detail`) to ensure accurate environment descriptions
- Check character dynamics (`query_character_dynamic_info`) to ensure character state continuity

**Step 3**: Call `start_chapter_write`

- Pass `chapterTitle` or `chapterId` to locate the target chapter

**Step 4**: Output the complete chapter body text

- **Output only the body text content**; do not output explanations, comments, or markers
- The writing style should be consistent with previous text
- Develop the outline''s core events step by step
- Control the pacing: opening connects to previous chapter → main body advances events → ending leaves suspense or a turning point

**Step 5**: Call `end_chapter_write` to end writing

#### 2.3 Notes

- During writing, it is **forbidden** to output non-body content (explanations, comments, markdown markers, etc.)
- If you need to output non-body content (e.g., impact assessment report), you must call `end_chapter_write` to exit write mode first
- If only making local changes, do not use write mode; use modify mode instead (see Section III)

---

### III. Modify Body Text (Modify Mode)

> Uses `start_chapter_modify` + `end_chapter_modify`. Suitable for making local replacements or insertions in existing body text.

#### 3.1 Workflow

```
search_in_chapter → confirm target text → start_chapter_modify → output new content → end_chapter_modify
```

#### 3.2 Three Operation Types

| Operation | Description | Scenarios |
|-----------|-------------|-----------|
| `replace` | Replace searchText with new content | Fix typos, rewrite paragraphs, replace names |
| `insert_after` | Insert after searchText | Add new content after a specific paragraph |
| `insert_before` | Insert before searchText | Add new content before a specific paragraph |

#### 3.3 Steps

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

#### 3.4 Typical Modification Scenarios

| Scenario | Operation Type | searchText Selection |
|----------|---------------|---------------------|
| Fix typo / rename | `replace` | Short sentence containing the error |
| Rewrite a description | `replace` | The complete paragraph to rewrite |
| Add content after a paragraph | `insert_after` | The last sentence of the target paragraph |
| Add content at chapter beginning | `insert_before` | The first sentence of the chapter body |

#### 3.5 Notes

- searchText must **exactly exist** in the chapter; otherwise an error will be returned
- If the same text appears in multiple places, use a longer text fragment for unique positioning
- Before modifying, consider using `read_chapter_section` to read the surrounding context to ensure the modified content transitions naturally

---

### IV. Manage Participating Entities

#### 4.1 When to Update

- After writing body text (new characters/scenes/props/organizations appear in the text)
- After modifying body text (entity changes)

#### 4.2 Workflow

```
get_chapter_content → analyze participating entities → list_characters/list_scenes → update_chapter_entities
```

#### 4.3 Steps

**Step 1**: Call `get_chapter_content` to view the chapter''s existing `characterIds`, `sceneIds`, etc.

**Step 2**: Analyze the entities that actually participate in the body text

**Step 3**: Call `list_characters` / `list_scenes` etc. to get entity IDs

**Step 4**: Call `update_chapter_entities` to update

- Note: each parameter is an **overwrite** operation, not an append
- To append, first get the existing list, merge, then update

---

### V. Post-Operation: Impact Assessment Phase

After each text operation, assess the impact across the following dimensions:

#### 5.1 Assessment Checklist

| Dimension | Assessment Content | Possible Actions |
|-----------|-------------------|-----------------|
| **Participating entities** | Are the characters/scenes/props appearing in the text associated? | `update_chapter_entities` |
| **Continuity** | Is the transition with the previous and next chapters natural? | Modify opening/closing paragraphs |
| **Plot consistency** | Does the chapter content match the outline and main plot? | Adjust text content |
| **Character state** | Does the character''s behavior in this chapter match their settings? | Modify related descriptions |
| **Foreshadowing** | Does this chapter involve planting or resolving foreshadowing? | Check foreshadowing design |

#### 5.2 Report Format

After the operation is complete, provide a concise report:

1. **Completed operations**: Body text writing/body text modification
2. **Content summary**: Word count, key characters and events involved
3. **Suggested follow-up actions**: If additional handling is needed, provide specific suggestions

---

### VI. Tool Quick Reference

#### Query Tools

| Tool Name | Purpose | Key Parameters |
|-----------|---------|---------------|
| `get_chapter_with_context` | Get chapter with surrounding chapters | `chapterId`/`chapterTitle`/`volumeNumber`+`chapterNumber`, `prevCount?`, `nextCount?`, `includeFullText?`, `includeSurroundingFullText?` |
| `list_chapters` | List all chapters | `includeOutline?`, `includeWordCount?`, `limit?`, `offset?` |
| `get_chapter_content` | Get complete chapter content | `chapterId` or `chapterTitle`, `includeFullText?` |
| `get_chapter_outline` | Get chapter outline | `chapterId` or `chapterTitle` |
| `get_chapter_statistics` | Get chapter statistics | No parameters |
| `search_across_chapters` | Search keywords across chapters | `keyword`, `searchIn?`, `contextChars?`, `limit?` |
| `search_in_chapter` | Search keywords in a chapter | `chapterId`/`chapterTitle`, `keyword`, `contextChars?` |
| `read_chapter_section` | Read a section of a long chapter | `chapterId`/`chapterTitle`, `offset?`, `limit?` |

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
| `list_scenes` | List all scenes |
| `update_chapter_entities` | Update participating entities |',

  NULL,
  1,
  1,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  updated_at = NOW();
