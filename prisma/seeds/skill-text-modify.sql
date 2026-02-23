-- 全局正文修改 Skill / Global Text Modification Skill
-- novel_creation_method_id = NULL 表示全局可用 / NULL means globally available
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-text-modify.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'text-modify',
  '章节正文修改：对现有正文做局部替换或插入，管理参与实体，确保修改后与上下文保持连贯',
  'Chapter body text modification: make local replacements or insertions in existing body text, manage participating entities, ensuring modifications remain coherent with context',
  '## 正文修改技能

本技能指导你完成章节正文的局部修改操作，确保修改后与上下文保持连贯。

---

### 核心原则

1. **禁止向用户提问**：禁止询问偏好、想法、选择。禁止在调用工具之前征求意见。信息不足时自行做出合理决策。2. **上下文连贯**：修改后的内容必须与前后文、角色状态、剧情走向保持连贯
3. **精准定位**：修改前必须准确定位目标文本，避免误操作
4. **实体关联**：正文修改后如有实体变动，及时更新参与实体（角色、场景、组织、道具）

---

### 一、操作前：信息收集阶段

在修改正文之前，收集必要信息：

#### 1.1 必须调用的工具

| 场景 | 必须调用 | 说明 |
|------|---------|------|
| **修改正文** | `search_in_chapter` | 定位要修改的文本位置 |

#### 1.2 上下文收集（按需）

根据修改的复杂度，选择性调用以下工具补充上下文：

- `read_chapter_section`：分段阅读章节正文，了解修改位置的上下文
- `get_chapter_with_context`：获取前后章节信息，确保修改不破坏连贯性
- `list_settings`：获取所有设定模块内容（世界观、核心设定等）
- `search_across_chapters`：搜索关键词在全书中的出现情况
- `get_character_detail`：查看相关角色详情，确保人物言行一致
- `get_scene_detail`：查看场景详情，确保环境描写准确
- `get_plot_overview`：了解主线剧情和故事线
- `query_character_dynamic_info`：查看角色在各章节中的状态变化

**判断标准**：
- 简单操作（如修改错别字、替换名称）：调研可精简
- 复杂操作（如大幅改写段落、调整剧情）：必须充分调研

---

### 二、修改正文

> 使用 `edit_chapter` 工具，一次调用完成替换。类似 Claude Code 的 Edit 工具。

#### 2.1 流程

```
search_in_chapter → 确认目标文本 → edit_chapter(old_string, new_string)
```

#### 2.2 参数说明

| 参数 | 说明 |
|------|------|
| `chapterId` / `chapterTitle` | 定位章节（二选一） |
| `old_string` | 要被替换的原文本，必须在章节中**完全匹配且唯一** |
| `new_string` | 替换后的新文本（可以是空字符串，表示删除） |

#### 2.3 步骤

**Step 1**：调用 `search_in_chapter` 定位目标文本

- 确认 old_string 在章节中存在
- 如果有多处匹配，需要选择足够长的文本来唯一定位

**Step 2**：调用 `edit_chapter`

- 提供 old_string（要替换的原文）和 new_string（替换后的新文本）
- 工具会自动验证、替换、保存

#### 2.4 典型修改场景

| 场景 | old_string | new_string |
|------|-----------|------------|
| 改错别字/改名 | 包含错误文字的短句 | 修正后的短句 |
| 改写一段描写 | 要改写的完整段落 | 改写后的段落 |
| 在某段后补充内容 | 目标段落的最后一句 | 最后一句 + 新增内容 |
| 删除一段内容 | 要删除的文本 | 空字符串 "" |

#### 2.5 多处修改

- 每次调用 `edit_chapter` 只做一处替换
- 多处修改请多次调用
- 注意：前一次替换可能改变后续文本的位置，建议每次替换前重新搜索确认

#### 2.6 注意事项

- old_string 必须在章节中**精确存在**且**唯一出现**，否则会报错
- 如果多处出现相同文本，使用更长的文本片段来唯一定位
- 修改前建议先用 `read_chapter_section` 阅读周围上下文，确保修改后的内容衔接自然
- 如果需要重写整个章节正文，不要用编辑模式，改用 `text-write` 技能

---

### 三、管理参与实体

#### 3.1 何时更新

- 修改正文后（实体变动，如新增角色出场、移除场景等）

#### 3.2 流程

```
get_chapter_content → 分析参与实体 → list_characters/list_scenes → update_chapter_entities
```

#### 3.3 步骤

**Step 1**：调用 `get_chapter_content` 查看章节的 `characterIds`、`sceneIds` 等现有关联

**Step 2**：分析修改后正文中实际参与的实体

**Step 3**：调用 `list_characters` / `list_scenes` 等获取实体 ID

**Step 4**：调用 `update_chapter_entities` 更新

- 注意：每个参数都是**覆盖**操作，不是追加
- 如果要追加，需要先获取现有列表，合并后再更新

---

### 四、操作后：影响评估阶段

每次正文修改完成后，评估以下维度的影响：

#### 4.1 评估清单

| 维度 | 评估内容 | 可能需要的操作 |
|------|---------|--------------|
| **参与实体** | 修改后出场的角色/场景/道具是否已关联 | `update_chapter_entities` |
| **前后衔接** | 修改后与前后文的衔接是否自然 | 继续修改相关段落 |
| **剧情一致** | 修改后是否仍符合大纲和主线剧情 | 调整修改内容 |
| **角色状态** | 修改后角色行为是否仍符合其设定 | 修改相关描写 |
| **全书一致** | 修改是否影响其他章节的内容 | 检查并修改相关章节 |

#### 4.2 汇报格式

操作完成后，简明扼要地汇报：

1. **已完成的操作**：正文修改（操作类型）
2. **内容概要**：修改位置、修改内容摘要
3. **建议后续操作**：如需额外处理，给出具体建议

---

### 五、工具速查

#### 查询工具

| 工具名 | 用途 | 关键参数 |
|--------|------|---------|
| `search_in_chapter` | 章节内搜索关键词 | `chapterId`/`chapterTitle`, `keyword`, `contextChars?` |
| `read_chapter_section` | 分段读取长章节 | `chapterId`/`chapterTitle`, `offset?`, `limit?` |
| `get_chapter_with_context` | 获取章节及前后章节内容 | `chapterId`/`chapterTitle`, `prevCount?`, `nextCount?`, `includeFullText?`, `includeSurroundingFullText?` |
| `get_chapter_content` | 获取章节完整内容 | `chapterId` 或 `chapterTitle`, `includeFullText?` |
| `search_across_chapters` | 跨章节搜索关键词 | `keyword`, `searchIn?`, `contextChars?`, `limit?` |

#### 编辑工具

| 工具名 | 用途 | 关键参数 |
|--------|------|---------|
| `edit_chapter` | 精确替换章节正文 | `chapterId`/`chapterTitle`, `old_string`, `new_string` |

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
  '## Text Modification Skill

This skill guides you through chapter body text modification operations, ensuring modifications remain coherent with context.

---

### Core Principles

1. **NEVER ask the user any questions**: Do not ask for preferences, ideas, or choices. Do not seek input before calling tools. When information is insufficient, make reasonable decisions on your own2. **Contextual continuity**: Modified content must remain coherent with surrounding text, character states, and plot direction
3. **Precise targeting**: Before modifying, accurately locate the target text to avoid accidental changes
4. **Entity association**: After modifying body text with entity changes, promptly update participating entities (characters, scenes, organizations, props)

---

### I. Pre-Operation: Information Gathering Phase

Before modifying body text, gather necessary information:

#### 1.1 Required Tool Calls

| Scenario | Required Call | Description |
|----------|--------------|-------------|
| **Modify content** | `search_in_chapter` | Locate the text to be modified |

#### 1.2 Context Gathering (As Needed)

Depending on the complexity of the modification, selectively call the following tools to supplement context:

- `read_chapter_section`: Read sections of the chapter to understand the context around the modification point
- `get_chapter_with_context`: Get surrounding chapter information to ensure modification doesn''t break continuity
- `list_settings`: Get all setting module contents (worldview, core settings, etc.)
- `search_across_chapters`: Search for keyword occurrences across all chapters
- `get_character_detail`: Check relevant character details to ensure consistent character behavior
- `get_scene_detail`: Check scene details to ensure accurate environment descriptions
- `get_plot_overview`: Understand main plot and storylines
- `query_character_dynamic_info`: View character state changes across chapters

**Decision criteria**:
- Simple operations (e.g., fixing typos, replacing names): Research can be streamlined
- Complex operations (e.g., major paragraph rewrite, adjusting plot): Thorough research is required

---

### II. Modify Body Text

> Uses the `edit_chapter` tool for precise text replacement in a single call. Similar to Claude Code''s Edit tool.

#### 2.1 Workflow

```
search_in_chapter → confirm target text → edit_chapter(old_string, new_string)
```

#### 2.2 Parameters

| Parameter | Description |
|-----------|-------------|
| `chapterId` / `chapterTitle` | Locate the chapter (choose one) |
| `old_string` | Original text to replace, must **exactly match and be unique** in the chapter |
| `new_string` | New text to replace with (can be empty string for deletion) |

#### 2.3 Steps

**Step 1**: Call `search_in_chapter` to locate the target text

- Confirm that old_string exists in the chapter
- If there are multiple matches, select a longer text segment for unique positioning

**Step 2**: Call `edit_chapter`

- Provide old_string (text to replace) and new_string (replacement text)
- The tool automatically validates, replaces, and saves

#### 2.4 Typical Modification Scenarios

| Scenario | old_string | new_string |
|----------|-----------|------------|
| Fix typo / rename | Short sentence containing the error | Corrected sentence |
| Rewrite a description | The complete paragraph to rewrite | Rewritten paragraph |
| Add content after a paragraph | The last sentence of the target paragraph | Last sentence + new content |
| Delete content | Text to delete | Empty string "" |

#### 2.5 Multiple Edits

- Each `edit_chapter` call makes one replacement
- For multiple edits, call multiple times
- Note: Previous replacements may change subsequent text positions; recommend re-searching before each replacement

#### 2.6 Notes

- old_string must **exactly exist** and appear **exactly once** in the chapter; otherwise an error will be returned
- If the same text appears in multiple places, use a longer text fragment for unique positioning
- Before modifying, consider using `read_chapter_section` to read the surrounding context to ensure the modified content transitions naturally
- If you need to rewrite the entire chapter body text, do not use edit mode; use the `text-write` skill instead

---

### III. Manage Participating Entities

#### 3.1 When to Update

- After modifying body text (entity changes, such as new character appearances, scene removals, etc.)

#### 3.2 Workflow

```
get_chapter_content → analyze participating entities → list_characters/list_scenes → update_chapter_entities
```

#### 3.3 Steps

**Step 1**: Call `get_chapter_content` to view the chapter''s existing `characterIds`, `sceneIds`, etc.

**Step 2**: Analyze the entities that actually participate in the modified body text

**Step 3**: Call `list_characters` / `list_scenes` etc. to get entity IDs

**Step 4**: Call `update_chapter_entities` to update

- Note: each parameter is an **overwrite** operation, not an append
- To append, first get the existing list, merge, then update

---

### IV. Post-Operation: Impact Assessment Phase

After each text modification, assess the impact across the following dimensions:

#### 4.1 Assessment Checklist

| Dimension | Assessment Content | Possible Actions |
|-----------|-------------------|-----------------|
| **Participating entities** | Are the characters/scenes/props after modification properly associated? | `update_chapter_entities` |
| **Continuity** | Is the transition with surrounding text natural after modification? | Continue modifying related paragraphs |
| **Plot consistency** | Does the content still match the outline and main plot after modification? | Adjust the modification |
| **Character state** | Does the character''s behavior still match their settings after modification? | Modify related descriptions |
| **Book-wide consistency** | Does the modification affect content in other chapters? | Check and modify related chapters |

#### 4.2 Report Format

After the operation is complete, provide a concise report:

1. **Completed operations**: Body text modification (operation type)
2. **Content summary**: Modification location, summary of changes
3. **Suggested follow-up actions**: If additional handling is needed, provide specific suggestions

---

### V. Tool Quick Reference

#### Query Tools

| Tool Name | Purpose | Key Parameters |
|-----------|---------|---------------|
| `search_in_chapter` | Search keywords in a chapter | `chapterId`/`chapterTitle`, `keyword`, `contextChars?` |
| `read_chapter_section` | Read a section of a long chapter | `chapterId`/`chapterTitle`, `offset?`, `limit?` |
| `get_chapter_with_context` | Get chapter with surrounding chapters | `chapterId`/`chapterTitle`, `prevCount?`, `nextCount?`, `includeFullText?`, `includeSurroundingFullText?` |
| `get_chapter_content` | Get complete chapter content | `chapterId` or `chapterTitle`, `includeFullText?` |
| `search_across_chapters` | Search keywords across chapters | `keyword`, `searchIn?`, `contextChars?`, `limit?` |

#### Edit Tools

| Tool Name | Purpose | Key Parameters |
|-----------|---------|---------------|
| `edit_chapter` | Precisely replace chapter text | `chapterId`/`chapterTitle`, `old_string`, `new_string` |

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
  2,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  updated_at = NOW();
