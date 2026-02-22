-- 全局大纲操作 Skill / Global Outline Operations Skill
-- novel_creation_method_id = NULL 表示全局可用 / NULL means globally available
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-outline-operations.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'outline-operations',
  '大纲全生命周期管理：规划章节结构、创建章节大纲、更新大纲、管理章节顺序和参与实体、删除章节，确保章节结构与小说整体设定保持一致',
  'Full lifecycle outline management: plan chapter structure, create chapter outlines, update outlines, manage chapter order and participating entities, delete chapters, ensuring chapter structure remains consistent with overall novel settings',
  '## 大纲操作技能

本技能指导你完成章节大纲的规划、创建、更新、管理和删除操作，确保章节结构与小说整体设定保持一致。

---

### 核心原则

1. **禁止向用户提问**：禁止询问偏好、想法、选择。禁止在调用工具之前征求意见。信息不足时自行做出合理决策。用户通过系统确认 UI 审批
2. **先了解全局，再操作局部**：任何章节操作前必须了解小说的整体结构和进度
3. **上下文连贯**：章节大纲必须与前后章节、角色状态、剧情走向保持连贯
4. **实体关联**：章节创建后，及时更新参与实体（角色、场景、组织、道具）

---

### 一、操作前：信息收集阶段

在执行任何大纲操作之前，根据操作类型收集必要信息：

#### 1.1 必须调用的工具

| 场景 | 必须调用 | 说明 |
|------|---------|------|
| **创建章节** | `list_chapters` | 了解现有章节结构，确定卷号和章节号 |
| **创建章节** | `get_plot_overview` | 了解剧情走向，确保新章节契合主线 |
| **更新大纲** | `get_chapter_outline` | 获取当前大纲内容 |
| **更新大纲** | `get_chapter_content` | 检查章节是否已有正文，评估大纲变更对正文的影响 |
| **修改标题/顺序** | `list_chapters` | 确认现有章节结构，避免标题重复或编号冲突 |
| **删除章节** | `get_chapter_content` | 确认章节内容和字数 |

#### 1.2 上下文收集（按需）

根据操作的复杂度，选择性调用以下工具补充上下文：

- `list_settings`：获取所有设定模块内容（世界观、核心设定等），作为创意决策的基础
- `get_chapter_statistics`：查看全书写作进度、字数分布，发现异常章节
- `get_chapter_outline`：快速查看某章大纲，不加载正文
- `list_characters` / `list_scenes`：查看可用的角色和场景，为章节关联实体做准备
- `get_plot_overview`：了解主线剧情和故事线，确保章节内容不偏离
- `get_story_line_events`：查看具体故事线的事件，确保章节覆盖关键情节
- `query_character_dynamic_info`：查看角色在各章节中的状态变化，确保状态连续

**判断标准**：
- 简单操作（如修改标题、调整章节号）：调研可精简
- 复杂操作（如规划多章大纲）：必须充分调研

---

### 二、创建章节

> `create_chapter` 只创建大纲骨架，不生成正文。适用于批量规划章节结构。

#### 2.1 流程

```
了解小说全貌 → 设计大纲 → create_chapter → 更新参与实体
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

**Step 4**：为新章节关联参与实体（`update_chapter_entities`）

#### 2.3 批量创建

当需要一次性规划多个章节（如规划第1-10章的大纲）：

- 先充分了解小说全貌（角色、场景、设定、剧情）
- 按顺序逐章调用 `create_chapter`
- 每章的大纲要与前一章自然衔接
- 完成后用 `list_chapters` 确认整体结构

---

### 三、更新大纲

#### 3.1 流程

```
get_chapter_outline → get_chapter_content（检查正文状态） → 评估修改范围 → update_chapter_outline → 评估正文兼容性
```

#### 3.2 步骤

**Step 1**：调用 `get_chapter_outline` 获取当前大纲

**Step 2**：调用 `get_chapter_content` 检查章节是否已有正文

- 如果章节有正文，记录正文字数和核心内容，后续评估大纲变更对正文的影响

**Step 3**：根据需求修改大纲

- 如果是微调（补充细节、修正措辞）：直接修改
- 如果是大改（改变核心事件、调整剧情走向）：需额外调研前后章节

**Step 4**：调用 `update_chapter_outline` 更新

- `outline` 参数传入完整的新大纲（覆盖模式）

**Step 5**：评估正文兼容性

- 如果章节已有正文且大纲改动较大，在影响评估中标注正文可能需要重写或调整

---

### 四、管理参与实体

#### 4.1 何时更新

- 创建新章节后
- 角色或场景发生变动后

#### 4.2 流程

```
get_chapter_content → 分析参与实体 → list_characters/list_scenes → update_chapter_entities
```

#### 4.3 步骤

**Step 1**：调用 `get_chapter_content` 查看章节的 `characterIds`、`sceneIds` 等现有关联

**Step 2**：分析大纲中实际参与的实体

**Step 3**：调用 `list_characters` / `list_scenes` 等获取实体 ID

**Step 4**：调用 `update_chapter_entities` 更新

- 注意：每个参数都是**覆盖**操作，不是追加
- 如果要追加，需要先获取现有列表，合并后再更新

---

### 五、修改章节标题/顺序

#### 5.1 使用 `update_chapter_title`

- **定位参数**和**更新参数**是分开的两组，不要混淆
- 定位参数（三选一）：`chapterId`、`chapterTitle`、`volumeNumber` + `chapterNumber`
- 更新参数（至少一个）：`newTitle`、`newVolumeNumber`、`newChapterNumber`

#### 5.2 常见错误

- 把 `chapterNumber`（定位参数）误用为更新参数 → 应该用 `newChapterNumber`
- 新标题与已有章节重复
- 新卷号+章节号组合与已有章节冲突

---

### 六、删除章节

#### 6.1 流程

```
get_chapter_content → 评估影响 → delete_chapter
```

#### 6.2 步骤

**Step 1**：调用 `get_chapter_content` 确认章节信息和字数

**Step 2**：影响评估

- 章节包含多少字的正文
- 章节关联了哪些角色/场景/组织/道具
- 删除后对章节编号连续性的影响
- 删除后对剧情连贯性的影响

需在影响评估中重点标注风险，然后执行删除。

**Step 3**：调用 `delete_chapter` 删除

---

### 七、操作后：影响评估阶段

每次大纲操作完成后，评估以下维度的影响：

#### 7.1 评估清单

| 维度 | 评估内容 | 可能需要的操作 |
|------|---------|--------------|
| **参与实体** | 大纲中出场的角色/场景/道具是否已关联 | `update_chapter_entities` |
| **前后衔接** | 与前一章、后一章的大纲衔接是否自然 | 修改相关章节大纲 |
| **剧情一致** | 章节大纲是否符合主线剧情 | 调整大纲内容 |
| **正文兼容** | 大纲更新后，已有正文是否仍与大纲一致 | 标注需要重写或调整的正文 |
| **章节编号** | 创建/删除后章节编号是否连续 | `update_chapter_title` 调整编号 |

#### 7.2 汇报格式

操作完成后，简明扼要地汇报：

1. **已完成的操作**：章节创建/大纲更新/章节删除
2. **内容概要**：涉及的关键角色和事件
3. **建议后续操作**：如需额外处理，给出具体建议

---

### 八、工具速查

#### 查询工具

| 工具名 | 用途 | 关键参数 |
|--------|------|---------|
| `list_chapters` | 列出所有章节 | `includeOutline?`, `includeWordCount?`, `limit?`, `offset?` |
| `get_chapter_content` | 获取章节完整内容 | `chapterId` 或 `chapterTitle`, `includeFullText?` |
| `get_chapter_outline` | 获取章节大纲 | `chapterId` 或 `chapterTitle` |
| `get_chapter_statistics` | 获取章节统计信息 | 无参数 |
| `search_across_chapters` | 跨章节搜索关键词 | `keyword`, `searchIn?`, `contextChars?`, `limit?` |

#### 变更工具

| 工具名 | 用途 | 关键参数 |
|--------|------|---------|
| `create_chapter` | 创建章节（只含大纲） | `title`, `chapterNumber`, `outline`, `volumeNumber?` |
| `update_chapter_outline` | 更新章节大纲 | `chapterId`/`chapterTitle`, `outline` |
| `update_chapter_title` | 修改标题/卷号/章节号 | 定位参数 + `newTitle?`/`newVolumeNumber?`/`newChapterNumber?` |
| `update_chapter_entities` | 更新参与实体 | 定位参数 + `characterIds?`/`sceneIds?`/`organizationIds?`/`propIds?` |
| `delete_chapter` | 删除章节 | `chapterId`/`chapterTitle` 或 `volumeNumber`+`chapterNumber` |

#### 其他常用工具

| 工具名 | 用途 |
|--------|------|
| `get_chapter_with_context` | 获取章节及前后章节的大纲和内容 |
| `get_plot_overview` | 获取剧情概览 |
| `get_story_line_events` | 获取故事线事件 |
| `list_characters` | 列出所有角色 |
| `list_scenes` | 列出所有场景 |
| `list_settings` | 列出所有设定 |',
  '## Outline Operations Skill

This skill guides you through chapter outline planning, creation, updating, management, and deletion operations, ensuring chapter structure remains consistent with the overall novel settings.

---

### Core Principles

1. **NEVER ask the user any questions**: Do not ask for preferences, ideas, or choices. Do not seek input before calling tools. When information is insufficient, make reasonable decisions on your own. Users review via system confirmation UI
2. **Understand the whole before acting on parts**: Understand the overall novel structure and progress before any chapter operation
3. **Contextual continuity**: Chapter outlines must remain coherent with surrounding chapters, character states, and plot direction
4. **Entity association**: After chapter creation, promptly update participating entities (characters, scenes, organizations, props)

---

### I. Pre-Operation: Information Gathering Phase

Before performing any outline operation, gather necessary information based on the operation type:

#### 1.1 Required Tool Calls

| Scenario | Required Call | Description |
|----------|--------------|-------------|
| **Create chapter** | `list_chapters` | Understand existing chapter structure, determine volume and chapter numbers |
| **Create chapter** | `get_plot_overview` | Understand plot direction, ensure new chapter fits the main storyline |
| **Update outline** | `get_chapter_outline` | Get the current outline content |
| **Update outline** | `get_chapter_content` | Check if the chapter has existing body text, assess outline change impact on body text |
| **Modify title/order** | `list_chapters` | Confirm existing chapter structure to avoid title duplication or number conflicts |
| **Delete chapter** | `get_chapter_content` | Confirm chapter content and word count |

#### 1.2 Context Gathering (As Needed)

Depending on the complexity of the operation, selectively call the following tools to supplement context:

- `list_settings`: Get all setting module contents (worldview, core settings, etc.) as foundation for creative decisions
- `get_chapter_statistics`: View overall writing progress, word count distribution, identify abnormal chapters
- `get_chapter_outline`: Quickly view a chapter''s outline without loading body text
- `list_characters` / `list_scenes`: View available characters and scenes for entity association
- `get_plot_overview`: Understand main plot and storylines to ensure chapter content stays on track
- `get_story_line_events`: View specific storyline events to ensure the chapter covers key plot points
- `query_character_dynamic_info`: View character state changes across chapters to ensure state continuity

**Decision criteria**:
- Simple operations (e.g., modifying title, adjusting chapter number): Research can be streamlined
- Complex operations (e.g., planning multiple chapter outlines): Thorough research is required

---

### II. Create Chapter

> `create_chapter` only creates the outline skeleton without generating body text. Suitable for batch planning of chapter structure.

#### 2.1 Workflow

```
understand novel overview → design outline → create_chapter → update participating entities
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

**Step 4**: Associate participating entities with the new chapter (`update_chapter_entities`)

#### 2.3 Batch Creation

When planning multiple chapters at once (e.g., plan outlines for chapters 1-10):

- First thoroughly understand the novel overview (characters, scenes, settings, plot)
- Call `create_chapter` sequentially for each chapter
- Each chapter''s outline should naturally connect to the previous chapter
- After completion, use `list_chapters` to confirm the overall structure

---

### III. Update Outline

#### 3.1 Workflow

```
get_chapter_outline → get_chapter_content (check body text status) → assess scope of changes → update_chapter_outline → assess body text compatibility
```

#### 3.2 Steps

**Step 1**: Call `get_chapter_outline` to get the current outline

**Step 2**: Call `get_chapter_content` to check if the chapter has existing body text

- If the chapter has body text, note the word count and core content for later impact assessment

**Step 3**: Modify the outline based on requirements

- For minor adjustments (adding details, fixing wording): modify directly
- For major changes (changing core events, adjusting plot direction): research surrounding chapters first

**Step 4**: Call `update_chapter_outline` to update

- The `outline` parameter takes the complete new outline (overwrite mode)

**Step 5**: Assess body text compatibility

- If the chapter has existing body text and the outline change is significant, flag in the impact assessment that the body text may need to be rewritten or adjusted

---

### IV. Manage Participating Entities

#### 4.1 When to Update

- After creating a new chapter
- After characters or scenes change

#### 4.2 Workflow

```
get_chapter_content → analyze participating entities → list_characters/list_scenes → update_chapter_entities
```

#### 4.3 Steps

**Step 1**: Call `get_chapter_content` to view the chapter''s existing `characterIds`, `sceneIds`, etc.

**Step 2**: Analyze the entities that actually participate in the outline

**Step 3**: Call `list_characters` / `list_scenes` etc. to get entity IDs

**Step 4**: Call `update_chapter_entities` to update

- Note: each parameter is an **overwrite** operation, not an append
- To append, first get the existing list, merge, then update

---

### V. Modify Chapter Title/Order

#### 5.1 Using `update_chapter_title`

- **Locating parameters** and **update parameters** are two separate groups; do not confuse them
- Locating parameters (choose one): `chapterId`, `chapterTitle`, `volumeNumber` + `chapterNumber`
- Update parameters (at least one): `newTitle`, `newVolumeNumber`, `newChapterNumber`

#### 5.2 Common Mistakes

- Using `chapterNumber` (locating parameter) as an update parameter → should use `newChapterNumber`
- New title duplicating an existing chapter
- New volume + chapter number combination conflicting with an existing chapter

---

### VI. Delete Chapter

#### 6.1 Workflow

```
get_chapter_content → assess impact → delete_chapter
```

#### 6.2 Steps

**Step 1**: Call `get_chapter_content` to confirm chapter information and word count

**Step 2**: Impact assessment

- How many words of body text the chapter contains
- Which characters/scenes/organizations/props are associated with the chapter
- Impact on chapter numbering continuity after deletion
- Impact on plot coherence after deletion

Flag risks in the impact assessment, then proceed with deletion.

**Step 3**: Call `delete_chapter` to delete

---

### VII. Post-Operation: Impact Assessment Phase

After each outline operation, assess the impact across the following dimensions:

#### 7.1 Assessment Checklist

| Dimension | Assessment Content | Possible Actions |
|-----------|-------------------|-----------------|
| **Participating entities** | Are the characters/scenes/props in the outline associated? | `update_chapter_entities` |
| **Continuity** | Is the transition with the previous and next chapter outlines natural? | Modify related chapter outlines |
| **Plot consistency** | Does the chapter outline match the main plot? | Adjust outline content |
| **Body text compatibility** | After outline update, does existing body text still match the outline? | Flag body text that needs rewriting or adjustment |
| **Chapter numbering** | Is the chapter numbering continuous after creation/deletion? | `update_chapter_title` to adjust numbering |

#### 7.2 Report Format

After the operation is complete, provide a concise report:

1. **Completed operations**: Chapter creation/outline update/chapter deletion
2. **Content summary**: Key characters and events involved
3. **Suggested follow-up actions**: If additional handling is needed, provide specific suggestions

---

### VIII. Tool Quick Reference

#### Query Tools

| Tool Name | Purpose | Key Parameters |
|-----------|---------|---------------|
| `list_chapters` | List all chapters | `includeOutline?`, `includeWordCount?`, `limit?`, `offset?` |
| `get_chapter_content` | Get complete chapter content | `chapterId` or `chapterTitle`, `includeFullText?` |
| `get_chapter_outline` | Get chapter outline | `chapterId` or `chapterTitle` |
| `get_chapter_statistics` | Get chapter statistics | No parameters |
| `search_across_chapters` | Search keywords across chapters | `keyword`, `searchIn?`, `contextChars?`, `limit?` |

#### Mutation Tools

| Tool Name | Purpose | Key Parameters |
|-----------|---------|---------------|
| `create_chapter` | Create chapter (outline only) | `title`, `chapterNumber`, `outline`, `volumeNumber?` |
| `update_chapter_outline` | Update chapter outline | `chapterId`/`chapterTitle`, `outline` |
| `update_chapter_title` | Modify title/volume/chapter number | Locating params + `newTitle?`/`newVolumeNumber?`/`newChapterNumber?` |
| `update_chapter_entities` | Update participating entities | Locating params + `characterIds?`/`sceneIds?`/`organizationIds?`/`propIds?` |
| `delete_chapter` | Delete chapter | `chapterId`/`chapterTitle` or `volumeNumber`+`chapterNumber` |

#### Other Commonly Used Tools

| Tool Name | Purpose |
|-----------|---------|
| `get_chapter_with_context` | Get chapter with surrounding chapters'' outlines and content |
| `get_plot_overview` | Get plot overview |
| `get_story_line_events` | Get storyline events |
| `list_characters` | List all characters |
| `list_scenes` | List all scenes |
| `list_settings` | List all settings |',

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
