-- 全局正文写作 Skill / Global Text Writing Skill
-- novel_creation_method_id = NULL 表示全局可用 / NULL means globally available
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-text-write.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'text-write',
  '章节正文撰写：根据大纲和上下文为章节生成完整的正文内容，确保与前后章节保持连贯',
  'Chapter body text writing: generate complete body text for chapters based on outlines and context, ensuring coherence with surrounding chapters',
  '## 正文写作技能

本技能指导你完成章节正文的撰写，确保正文与大纲和前后章节保持连贯。

---

### 核心原则

1. **禁止向用户提问**：禁止询问偏好、想法、选择。禁止在调用工具之前征求意见。信息不足时自行做出合理决策
2. **正文必须在正式回复中输出**：调用 `start_chapter_write` 后，章节正文必须在你的正式回复文本（response text）中输出，绝不能在思考/推理过程中撰写。系统只捕获正式回复中的文本写入编辑器
3. **上下文连贯**：章节正文必须与前后章节、角色状态、剧情走向保持连贯
4. **实体关联**：正文撰写后，及时更新参与实体（角色、场景、组织、道具）

---

### 一、操作前：信息收集阶段

在撰写正文之前，收集必要信息：

#### 1.1 必须调用的工具

| 场景 | 必须调用 | 说明 |
|------|---------|------|
| **撰写正文** | `get_chapter_with_context` | 获取目标章节及前一章的大纲和内容（`prevCount=1, includeFullText=true, includeSurroundingFullText=true`） |

#### 1.2 上下文收集（按需）

根据章节的复杂度，选择性调用以下工具补充上下文：

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

**判断标准**：撰写新章节正文属于复杂操作，必须充分调研

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

**Step 4**：直接在正式回复中输出完整的章节正文

- **【关键】正文必须在正式回复（response text）中输出，不要在思考/推理过程中撰写正文。系统只捕获正式回复中的文本写入编辑器，思考过程中的内容不会被写入**
- **只输出正文内容**，不要输出解释、评论或标注
- 正文风格要与前文保持一致
- 按大纲的核心事件逐步展开
- 注意节奏把控：开头承接前章 → 主体推进事件 → 结尾留有悬念或转折

**Step 5**：调用 `end_chapter_write` 结束写入

#### 2.3 注意事项

- **【关键】正文必须在正式回复中输出**。系统只从正式回复文本中捕获内容写入编辑器。如果正文写在思考/推理过程中，编辑器将收不到任何内容（0 字）
- 写入期间**禁止**输出非正文内容（解释、评论、markdown 标记等）
- **禁止**在正文开头输出标题（如 `# 第二章 遗诏之疑`）。章节标题已显示在编辑器中，正文从第一段叙述开始
- **禁止**在正文结尾输出章节完结标记（如 `（第二章完）`、`---`）。正文自然结束即可
- **禁止**在正文中输出工具调用说明（如 `现在调用 end_chapter_write`）。写完正文后直接调用工具，不要描述你要做什么
- 如需输出非正文内容（如影响评估报告），必须先调用 `end_chapter_write` 结束写入模式
- 如果只是局部修改，不要用写入模式，改用 `text-modify` 技能

---

### 三、写作后：实体与剧情管理

正文写入完成后，依据正文内容更新项目的实体、关系、动态信息和剧情数据。

#### 3.1 管理参与实体

正文中出现了新的角色/场景/道具/组织时，更新章节关联。

```
get_chapter_content → 分析参与实体 → list_characters/list_scenes → update_chapter_entities
```

- 调用 `get_chapter_content` 查看章节的 `characterIds`、`sceneIds` 等现有关联
- 分析正文中实际参与的实体，与现有关联对比
- 调用 `list_characters` / `list_scenes` 等获取实体 ID
- 调用 `update_chapter_entities` 更新（注意：每个参数都是**覆盖**操作，需先获取现有列表合并后再更新）

#### 3.2 更新实体关系

正文中如果出现了实体之间新的关系（如角色间的敌对/结盟/师徒等），或现有关系发生变化，需要更新。

```
query_character_relations → 对比正文内容 → create_relation / update_relation
```

- 调用 `query_character_relations` 查看当前关系网络
- 分析正文中体现的关系变化（新关系、关系强化/弱化、关系性质转变）
- 新关系：调用 `create_relation`（参数：`fromName`, `toName`, `relationType`, `description`）
- 关系变化：调用 `update_relation`（参数：`fromName`+`toName`+`relationType`, `newDescription` 等）

#### 3.3 更新实体动态信息

正文中如果实体的状态发生了变化（如角色心理状态变化、获得/失去物品、能力提升等），需要记录。

```
get_field_dynamic_info → 对比正文内容 → update_field_dynamic_info
```

- 调用 `get_field_dynamic_info` 查看实体各字段的当前动态信息
- 分析正文中实体状态的变化
- 调用 `update_field_dynamic_info` 更新（参数：`entityName`, `chapterId`, `fields`（包含 `fieldName` 和 `dynamicValue`））
- **必须附带 `chapterId`**，每个字段独立记录在具体章节上

#### 3.4 故事线与剧情事件管理

正文中推进了剧情事件、引入了新的事件或故事线时，需要更新剧情数据。

```
get_plot_overview → get_story_line_events → create_plot_event / create_story_line
```

- 调用 `get_plot_overview` 查看当前所有故事线和事件概览
- 调用 `get_story_line_events` 查看具体故事线的事件列表
- **关联章节**：创建/更新事件时必须附带 `chapterId`，将事件与章节关联
- **新事件**：正文中推进了某条故事线的新情节，调用 `create_plot_event`（参数：`name`, `storyLineName`, `chapterId`, `description`, `eventType`）
- **新故事线**：正文中引出了全新的故事线（如新的支线剧情），调用 `create_story_line`（参数：`name`, `description`, `lineType`）。注意：`create_story_line` 返回 PENDING_CONFIRMATION 后需等待用户确认
- **事件类型选择**：根据事件性质选择 `eventType`（normal/turning_point/climax/resolution/foreshadowing）

#### 3.5 伏笔管理

正文中如果埋下了新伏笔或回收了已有伏笔，需要记录。

```
list_pending_foreshadows → create_foreshadow / resolve_foreshadow
```

- 调用 `list_pending_foreshadows` 查看当前待回收的伏笔
- **新伏笔**：正文中埋下了新的伏笔，调用 `create_foreshadow`（参数：`name`, `description`, `chapterId`/`chapterTitle`, `storyLineName`（可选）, `importance`）
- **回收伏笔**：正文中回收了此前的伏笔，调用 `resolve_foreshadow`（参数：`foreshadowName`, `resolveChapterId`/`resolveChapterTitle`）

---

### 四、写作后检查

写入完成（`end_chapter_write` 调用后，内容自动保存），执行以下检查：

#### 4.1 内容质量检查

用 `read_chapter_section` 逐段审读写入的正文，检查以下问题：

| 检查项 | 说明 | 发现问题时 |
|--------|------|-----------|
| **内容重复** | 检查是否有段落、句子或描写被重复写入（如同一段出现两次、同一场景重复描述） | 用 `text-modify` 删除重复部分 |
| **非正文污染** | 检查正文中是否混入了标题（`#`）、markdown 标记、工具调用说明、思维标签等非正文内容 | 用 `text-modify` 移除 |
| **断裂或缺失** | 检查正文是否有明显的叙事断裂、未完成的句子、或异常截断 | 用 `text-modify` 补充或修正 |

#### 4.2 叙事一致性检查

| 检查项 | 方法 | 发现问题时 |
|--------|------|-----------|
| **大纲覆盖** | 对照章节大纲的核心事件，确认正文是否全部涉及 | 提醒用户哪些事件未覆盖，建议补充 |
| **前章衔接** | 重读前一章末尾和本章开头，确认衔接自然 | 建议用 `text-modify` 调整开头 |
| **角色一致** | 检查正文中角色的言行是否符合其设定和前文状态 | 指出不一致之处，建议修改 |
| **参与实体** | 分析正文中出场的角色/场景/道具，与章节已关联的实体对比 | 调用 `update_chapter_entities` 补充 |

#### 4.3 检查流程

```
read_chapter_section（逐段审读，检查内容质量） → get_chapter_with_context（确认大纲覆盖、前章衔接） → get_character_detail（抽查关键角色一致性） → update_chapter_entities（补充实体关联）
```

---

### 五、写作结果汇报

检查完成后，向用户汇报写作结果。

#### 5.1 汇报格式

- **字数**：本章正文字数
- **关键对话亮点**：列出 2-3 个关键对话或场景的要点（用一句话概括每个亮点，**不要引用或复述正文原文**）
- **大纲完成度**：大纲核心事件是否全部覆盖，未覆盖的列出
- **发现的问题**：检查中发现的不一致或衔接问题（如无则省略）
- **建议后续操作**：如需修改或继续创作，给出具体建议

#### 5.2 禁止事项

- **禁止复述正文内容**：不要摘抄、引用、或逐段总结正文。用户已经在编辑器中看到了完整正文
- **禁止逐段分析**：不要像书评一样分析"第一段写了什么，第二段写了什么"
- 汇报应简短精炼，重点放在**检查结果**和**后续行动**上

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
| `read_chapter_section` | 分段读取长章节 | `chapterId`/`chapterTitle`, `offset?`, `limit?` |

#### 写入工具（覆盖模式）

| 工具名 | 用途 | 关键参数 |
|--------|------|---------|
| `start_chapter_write` | 开始写入新正文 | `chapterId` 或 `chapterTitle` |
| `end_chapter_write` | 结束写入 | 无参数 |

#### 实体与关系工具

| 工具名 | 用途 | 关键参数 |
|--------|------|---------|
| `list_characters` | 列出所有角色 | `limit?`, `offset?` |
| `list_scenes` | 列出所有场景 | `limit?`, `offset?` |
| `get_character_detail` | 获取角色详情 | `characterId`/`characterName` |
| `get_scene_detail` | 获取场景详情 | `sceneId`/`sceneName` |
| `update_chapter_entities` | 更新章节参与实体 | `chapterId`, `characterIds?`, `sceneIds?` 等 |
| `query_character_relations` | 查询角色关系 | `characterName?`, `relationType?` |
| `create_relation` | 创建实体关系 | `fromName`, `toName`, `relationType`, `description?` |
| `update_relation` | 修改实体关系 | `fromName`+`toName`+`relationType`, `newDescription?` 等 |

#### 动态信息工具

| 工具名 | 用途 | 关键参数 |
|--------|------|---------|
| `get_field_dynamic_info` | 获取实体字段动态信息 | `entityName`, `fieldName?`, `chapterId?` |
| `update_field_dynamic_info` | 更新实体字段动态信息 | `entityName`, `chapterId?`, `fields`（`fieldName`+`dynamicValue`） |
| `query_character_dynamic_info` | 查询角色动态状态 | `characterName` |

#### 剧情与伏笔工具

| 工具名 | 用途 | 关键参数 |
|--------|------|---------|
| `get_plot_overview` | 获取剧情概览 | 无参数 |
| `get_story_line_events` | 获取故事线事件 | `storyLineName` |
| `create_story_line` | 创建故事线 | `name`, `description?`, `lineType?` |
| `create_plot_event` | 创建剧情事件 | `name`, `storyLineName`, `chapterId?`, `eventType?`, `description?` |
| `list_pending_foreshadows` | 列出待回收伏笔 | `includeResolved?` |
| `create_foreshadow` | 创建伏笔 | `name`, `description?`, `chapterId?`, `storyLineName?`, `importance?` |
| `resolve_foreshadow` | 回收伏笔 | `foreshadowName`, `resolveChapterId?`/`resolveChapterTitle?` |',
  '## Text Writing Skill

This skill guides you through chapter body text writing, ensuring body text remains coherent with outlines and surrounding chapters.

---

### Core Principles

1. **NEVER ask the user any questions**: Do not ask for preferences, ideas, or choices. Do not seek input before calling tools. When information is insufficient, make reasonable decisions on your own
2. **Body text MUST be in your response text**: After calling `start_chapter_write`, chapter body text MUST be output in your response text (NOT in thinking/reasoning). The system only captures response text for the editor
3. **Contextual continuity**: Chapter body text must remain coherent with surrounding chapters, character states, and plot direction
4. **Entity association**: After writing body text, promptly update participating entities (characters, scenes, organizations, props)

---

### I. Pre-Operation: Information Gathering Phase

Before writing body text, gather necessary information:

#### 1.1 Required Tool Calls

| Scenario | Required Call | Description |
|----------|--------------|-------------|
| **Write body text** | `get_chapter_with_context` | Get target chapter and previous chapter''s outline and content (`prevCount=1, includeFullText=true, includeSurroundingFullText=true`) |

#### 1.2 Context Gathering (As Needed)

Depending on the complexity of the chapter, selectively call the following tools to supplement context:

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

**Decision criteria**: Writing a new chapter is a complex operation; thorough research is required

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

**Step 4**: Output the complete chapter body text directly in your response

- **[CRITICAL] Body text MUST be output in your response text (not in thinking/reasoning). The system only captures response text for the editor. Content written in thinking/reasoning will NOT be written to the editor**
- **Output only the body text content**; do not output explanations, comments, or markers
- The writing style should be consistent with previous text
- Develop the outline''s core events step by step
- Control the pacing: opening connects to previous chapter → main body advances events → ending leaves suspense or a turning point

**Step 5**: Call `end_chapter_write` to end writing

#### 2.3 Notes

- **[CRITICAL] Body text MUST be in your response text**. The system only captures content from your response text and writes it to the editor. If the body text is written in thinking/reasoning, the editor will receive nothing (0 words)
- During writing, it is **forbidden** to output non-body content (explanations, comments, markdown markers, etc.)
- **NEVER** output a title at the beginning (e.g., `# Chapter Two: The Edict''s Mystery`). The chapter title is already displayed in the editor; body text starts with the first narrative paragraph
- **NEVER** output chapter end markers (e.g., `(End of Chapter Two)`, `---`). The body text ends naturally
- **NEVER** output tool call descriptions in the body text (e.g., `Now calling end_chapter_write`). After finishing the body text, call the tool directly without describing what you''re about to do
- If you need to output non-body content (e.g., impact assessment report), you must call `end_chapter_write` to exit write mode first
- If only making local changes, do not use write mode; use the `text-modify` skill instead

---

### III. Post-Writing: Entity & Plot Management

After writing is complete, update project entities, relationships, dynamic info, and plot data based on the chapter content.

#### 3.1 Manage Participating Entities

When new characters/scenes/props/organizations appear in the body text, update chapter associations.

```
get_chapter_content → analyze participating entities → list_characters/list_scenes → update_chapter_entities
```

- Call `get_chapter_content` to view the chapter''s existing `characterIds`, `sceneIds`, etc.
- Analyze entities actually participating in the body text and compare with existing associations
- Call `list_characters` / `list_scenes` etc. to get entity IDs
- Call `update_chapter_entities` to update (note: each parameter is an **overwrite** operation; get the existing list first and merge before updating)

#### 3.2 Update Entity Relationships

When the body text introduces new relationships between entities (e.g., rivalry/alliance/mentorship between characters), or existing relationships change, update accordingly.

```
query_character_relations → compare with body text → create_relation / update_relation
```

- Call `query_character_relations` to view the current relationship network
- Analyze relationship changes reflected in the body text (new relationships, strengthened/weakened relationships, changed relationship nature)
- New relationships: call `create_relation` (params: `fromName`, `toName`, `relationType`, `description`)
- Changed relationships: call `update_relation` (params: `fromName`+`toName`+`relationType`, `newDescription`, etc.)

#### 3.3 Update Entity Dynamic Info

When entity states change in the body text (e.g., character''s psychological state changes, gaining/losing items, ability improvements), record these changes.

```
get_field_dynamic_info → compare with body text → update_field_dynamic_info
```

- Call `get_field_dynamic_info` to view each field''s current dynamic info for the entity
- Analyze entity state changes in the body text
- Call `update_field_dynamic_info` to update (params: `entityName`, `chapterId`, `fields` containing `fieldName` and `dynamicValue`)
- **Must include `chapterId`** — each field is recorded independently per chapter

#### 3.4 Storyline & Plot Event Management

When the body text advances plot events, introduces new events, or new storylines, update plot data.

```
get_plot_overview → get_story_line_events → create_plot_event / create_story_line
```

- Call `get_plot_overview` to view all current storylines and events
- Call `get_story_line_events` to view events for a specific storyline
- **Link to chapter**: when creating/updating events, always include `chapterId` to associate events with chapters
- **New events**: if the body text advances a storyline, call `create_plot_event` (params: `name`, `storyLineName`, `chapterId`, `description`, `eventType`)
- **New storylines**: if the body text introduces an entirely new storyline (e.g., new subplot), call `create_story_line` (params: `name`, `description`, `lineType`). Note: `create_story_line` returns PENDING_CONFIRMATION — wait for user confirmation
- **Event type selection**: choose `eventType` based on event nature (normal/turning_point/climax/resolution/foreshadowing)

#### 3.5 Foreshadowing Management

When the body text plants new foreshadowing or resolves existing foreshadowing, record accordingly.

```
list_pending_foreshadows → create_foreshadow / resolve_foreshadow
```

- Call `list_pending_foreshadows` to view current unresolved foreshadowing
- **New foreshadowing**: if the body text plants a new clue, call `create_foreshadow` (params: `name`, `description`, `chapterId`/`chapterTitle`, `storyLineName` (optional), `importance`)
- **Resolve foreshadowing**: if the body text resolves previous foreshadowing, call `resolve_foreshadow` (params: `foreshadowName`, `resolveChapterId`/`resolveChapterTitle`)

---

### IV. Post-Writing Review

After writing is complete (`end_chapter_write` called, content is auto-saved), perform the following checks:

#### 4.1 Content Quality Checks

Use `read_chapter_section` to review the written body text section by section, checking for the following issues:

| Check Item | Description | When Issues Found |
|------------|-------------|-------------------|
| **Duplicate content** | Check for paragraphs, sentences, or descriptions that were written twice (e.g., same paragraph appears twice, same scene described repeatedly) | Use `text-modify` to remove duplicates |
| **Non-body pollution** | Check whether the body text contains titles (`#`), markdown markers, tool call descriptions, thinking tags, or other non-body content | Use `text-modify` to remove |
| **Breaks or gaps** | Check for obvious narrative breaks, unfinished sentences, or abnormal truncation | Use `text-modify` to supplement or fix |

#### 4.2 Narrative Consistency Checks

| Check Item | Method | When Issues Found |
|------------|--------|-------------------|
| **Outline coverage** | Compare the chapter outline''s core events against the body text to confirm all are covered | Inform the user which events were not covered; suggest additions |
| **Previous chapter continuity** | Re-read the end of the previous chapter and the beginning of this chapter to confirm natural transition | Suggest using `text-modify` to adjust the opening |
| **Character consistency** | Check whether characters'' words and actions in the text match their settings and previous states | Point out inconsistencies; suggest modifications |
| **Participating entities** | Analyze characters/scenes/props appearing in the text and compare with the chapter''s linked entities | Call `update_chapter_entities` to supplement |

#### 4.3 Review Workflow

```
read_chapter_section (review section by section, check content quality) → get_chapter_with_context (confirm outline coverage, previous chapter continuity) → get_character_detail (spot-check key character consistency) → update_chapter_entities (supplement entity links)
```

---

### V. Writing Result Report

After the review is complete, report the writing results to the user.

#### 5.1 Report Format

- **Word count**: Body text word count for this chapter
- **Key dialogue highlights**: List 2-3 key dialogues or scene highlights (summarize each in one sentence; **do NOT quote or restate the original text**)
- **Outline completion**: Whether all core outline events are covered; list any uncovered ones
- **Issues found**: Inconsistencies or continuity problems found during review (omit if none)
- **Suggested follow-up actions**: If modifications or continued writing is needed, provide specific suggestions

#### 5.2 Prohibitions

- **NEVER restate body text content**: Do not excerpt, quote, or paragraph-by-paragraph summarize the body text. The user has already seen the full text in the editor
- **NEVER analyze paragraph by paragraph**: Do not write book-review-style analysis like "the first paragraph describes..., the second paragraph..."
- The report should be brief and focused on **review results** and **next actions**

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
| `read_chapter_section` | Read a section of a long chapter | `chapterId`/`chapterTitle`, `offset?`, `limit?` |

#### Write Tools (Overwrite Mode)

| Tool Name | Purpose | Key Parameters |
|-----------|---------|---------------|
| `start_chapter_write` | Start writing new body text | `chapterId` or `chapterTitle` |
| `end_chapter_write` | End writing | No parameters |

#### Entity & Relationship Tools

| Tool Name | Purpose | Key Parameters |
|-----------|---------|---------------|
| `list_characters` | List all characters | `limit?`, `offset?` |
| `list_scenes` | List all scenes | `limit?`, `offset?` |
| `get_character_detail` | Get character details | `characterId`/`characterName` |
| `get_scene_detail` | Get scene details | `sceneId`/`sceneName` |
| `update_chapter_entities` | Update chapter participating entities | `chapterId`, `characterIds?`, `sceneIds?`, etc. |
| `query_character_relations` | Query character relationships | `characterName?`, `relationType?` |
| `create_relation` | Create entity relationship | `fromName`, `toName`, `relationType`, `description?` |
| `update_relation` | Update entity relationship | `fromName`+`toName`+`relationType`, `newDescription?`, etc. |

#### Dynamic Info Tools

| Tool Name | Purpose | Key Parameters |
|-----------|---------|---------------|
| `get_field_dynamic_info` | Get entity field dynamic info | `entityName`, `fieldName?`, `chapterId?` |
| `update_field_dynamic_info` | Update entity field dynamic info | `entityName`, `chapterId?`, `fields` (`fieldName`+`dynamicValue`) |
| `query_character_dynamic_info` | Query character dynamic state | `characterName` |

#### Plot & Foreshadowing Tools

| Tool Name | Purpose | Key Parameters |
|-----------|---------|---------------|
| `get_plot_overview` | Get plot overview | No parameters |
| `get_story_line_events` | Get storyline events | `storyLineName` |
| `create_story_line` | Create storyline | `name`, `description?`, `lineType?` |
| `create_plot_event` | Create plot event | `name`, `storyLineName`, `chapterId?`, `eventType?`, `description?` |
| `list_pending_foreshadows` | List unresolved foreshadowing | `includeResolved?` |
| `create_foreshadow` | Create foreshadowing | `name`, `description?`, `chapterId?`, `storyLineName?`, `importance?` |
| `resolve_foreshadow` | Resolve foreshadowing | `foreshadowName`, `resolveChapterId?`/`resolveChapterTitle?` |',

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
