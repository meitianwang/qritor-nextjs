-- 全局情节设计 Skill / Global Plot Design Skill
-- novel_creation_method_id = NULL 表示全局可用 / NULL means globally available
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-plot-design.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'plot-design',
  '情节设计与管理：故事线规划、剧情事件编排、伏笔埋设与回收、剧情结构分析与优化',
  'Plot design and management: story line planning, plot event arrangement, foreshadow planting and resolution, plot structure analysis and optimization',
  '## 情节设计技能

本技能指导你完成故事线规划、剧情事件编排、伏笔管理和剧情结构优化，帮助构建完整而有张力的故事架构。

---

### 核心概念

本技能涉及三个相互关联的系统：

| 系统 | 说明 | 核心工具 |
|------|------|---------|
| **故事线** | 小说的剧情线索（主线/支线/片段） | `create_story_line`, `update_story_line`, `delete_story_line` |
| **剧情事件** | 故事线上的关键节点 | `create_plot_event`, `get_plot_overview` |
| **伏笔** | 需要埋设和回收的线索 | `create_foreshadow`, `resolve_foreshadow` |

**关系**：故事线 → 包含多个剧情事件 → 事件可以是伏笔类型 → 伏笔需要在后续章节回收

---

### 核心原则

1. **结构先行**：先规划故事线，再填充事件，最后埋设伏笔
2. **主次分明**：主线承载核心冲突，支线丰富故事层次，避免喧宾夺主
3. **节奏把控**：事件类型（普通→转折→高潮→结局）的分布要有节奏感
4. **伏笔闭环**：每个埋下的伏笔都必须回收，避免烂尾
5. **章节锚定**：事件和伏笔应尽量关联到具体章节，便于追踪

---

### 一、操作前：了解现有剧情

在进行任何情节操作之前，先了解小说的剧情全貌：

#### 1.1 必须调用的工具

| 场景 | 必须调用 | 说明 |
|------|---------|------|
| **任何情节操作** | `get_plot_overview` | 获取所有故事线和事件，了解剧情全貌 |
| **评估剧情健康度** | `analyze_plot_structure` | 获取结构统计和诊断建议 |
| **伏笔相关操作** | `list_pending_foreshadows` | 查看待回收伏笔清单 |

#### 1.2 上下文收集（按需）

- `get_story_line_events`：聚焦查看某条故事线的事件发展
- `get_story_line_detail`：查看故事线的详细信息和事件统计
- `get_foreshadow_detail`：查看某个伏笔的详细信息
- `list_chapters`：了解章节结构，为事件关联章节做准备
- `list_characters`：了解角色阵容，确保事件中的角色已存在

---

### 二、故事线管理

#### 2.1 创建故事线

**流程**：
```
get_plot_overview → 分析现有故事线 → create_story_line
```

**故事线类型**：

| 类型 | 说明 | 适用场景 |
|------|------|---------|
| `main` | 主线 | 核心冲突和主要角色的发展 |
| `branch` | 支线 | 次要角色的故事、副线剧情 |
| `episode` | 片段 | 独立小故事、过渡性情节 |

**故事线状态**：

| 状态 | 说明 |
|------|------|
| `active` | 进行中（默认） |
| `completed` | 已完结 |
| `paused` | 暂停 |

**步骤**：

**Step 1**：调用 `get_plot_overview` 查看已有故事线

- 确认是否已有同名或类似功能的故事线
- 评估主线与支线的比例

**Step 2**：调用 `create_story_line`

- `name`：故事线名称，简洁有辨识度（如"复仇线"、"成长线"）
- `lineType`：类型（main/branch/episode）
- `description`：描述故事线的核心冲突和走向
- `color`：显示颜色，便于可视化区分

**注意事项**：
- 一部小说通常只有 1 条主线，2-5 条支线
- 同名故事线会返回已有的而不是创建新的
- 故事线创建后才能在 `create_plot_event` 中引用

#### 2.2 修改故事线

使用 `update_story_line`，通过 `storyLineId` 或 `storyLineName` 定位。

常见修改场景：

| 场景 | 修改字段 |
|------|---------|
| 故事线已写完 | `newStatus: "completed"` |
| 支线升格为主线 | `newLineType: "main"` |
| 调整故事线方向 | `newDescription` |
| 更改显示颜色 | `newColor` |

#### 2.3 删除故事线

使用 `delete_story_line`。

**注意**：删除故事线不会删除其关联的剧情事件，但事件会失去故事线关联。

---

### 三、剧情事件管理

#### 3.1 事件类型

| 类型 | 说明 | 叙事作用 |
|------|------|---------|
| `normal` | 普通事件 | 推进剧情、铺垫背景 |
| `turning_point` | 转折点 | 改变故事走向的关键节点 |
| `climax` | 高潮 | 故事线的张力顶峰 |
| `resolution` | 结局 | 故事线的收束和解决 |
| `foreshadowing` | 伏笔 | 埋设线索，待后续回收 |

#### 3.2 创建剧情事件

**流程**：
```
get_plot_overview → 确定故事线 → create_plot_event
```

**步骤**：

**Step 1**：调用 `get_plot_overview` 了解现有事件

- 查看目标故事线已有哪些事件
- 确认事件的时间线顺序
- 检查事件类型分布是否合理

**Step 2**：调用 `create_plot_event`

- `name`：事件名称（必填），简洁概括事件内容
- `storyLineName`：所属故事线名称（必须已存在）
- `eventType`：事件类型
- `description`：事件的详细描述
- `storyTime`：故事内时间（如"第一章"、"三天后"）
- `chapterId`：关联章节 ID（如果已知）
- `importance`：重要程度 1-5

**注意事项**：
- `storyLineName` 必须引用已存在的故事线，拼写必须精确
- 如果需要创建新故事线并关联事件，必须先创建故事线，再创建事件

#### 3.3 事件编排原则

**节奏参考**：

```
普通事件 → 普通事件 → 转折点 → 普通事件 → 高潮 → 结局
```

- **开局**：用 2-3 个普通事件建立背景和冲突
- **发展**：穿插转折点推动剧情升级
- **高潮**：每条故事线至少应有一个高潮事件
- **收束**：用结局事件为故事线划上句号

**重要程度（importance）参考**：

| 等级 | 说明 | 示例 |
|------|------|------|
| 1 | 背景铺垫 | 日常描写、环境交代 |
| 2 | 次要推进 | 次要角色互动 |
| 3 | 一般推进 | 主线剧情正常推进（默认） |
| 4 | 重要节点 | 关键信息揭露、重大决策 |
| 5 | 核心事件 | 转折点、高潮、重大转变 |

#### 3.4 批量创建事件

当用户要求规划一条故事线的完整事件时：

- 先用 `get_plot_overview` 了解全局
- 按时间线顺序设计事件序列
- 合理分配事件类型和重要程度
- 逐个调用 `create_plot_event` 创建

---

### 四、伏笔管理

#### 4.1 埋设伏笔

**流程**：
```
get_plot_overview → list_pending_foreshadows → create_foreshadow
```

**步骤**：

**Step 1**：了解现有伏笔状况

- 调用 `list_pending_foreshadows` 查看待回收伏笔
- 避免埋设与已有伏笔重复或冲突的线索

**Step 2**：调用 `create_foreshadow`

- `name`：伏笔名称，简洁明确（如"神秘来信"、"消失的匕首"）
- `description`：说明伏笔内容和预期回收方式
- `chapterId` / `chapterTitle`：埋设章节
- `storyLineName`：所属故事线（可选）
- `importance`：重要程度 1-5
- `deadlineChapter`：预期回收章节序号（用于提醒）

**伏笔设计要点**：
- 伏笔的埋设要自然，不能过于刻意
- 描述中要明确预期的回收方式，便于后续执行
- 设置 `deadlineChapter` 可以避免伏笔被遗忘

#### 4.2 回收伏笔

**流程**：
```
list_pending_foreshadows → get_foreshadow_detail → resolve_foreshadow
```

**步骤**：

**Step 1**：调用 `list_pending_foreshadows` 查看待回收伏笔

**Step 2**：调用 `get_foreshadow_detail` 查看伏笔详情

- 回顾伏笔的内容和预期回收方式
- 确认在哪个章节回收合适

**Step 3**：调用 `resolve_foreshadow`

- `foreshadowId` 或 `foreshadowName`：定位伏笔
- `resolveChapterId` 或 `resolveChapterTitle`：回收章节

**注意事项**：
- 只能回收状态为 `planted` 的伏笔
- `foreshadowName` 支持模糊匹配
- 回收时机要合理，不要过早也不要拖太久

#### 4.3 伏笔管理策略

| 策略 | 说明 |
|------|------|
| **定期检查** | 每写 3-5 章后用 `list_pending_foreshadows` 检查待回收伏笔 |
| **设置 deadline** | 创建伏笔时设置 `deadlineChapter`，便于追踪 |
| **重要程度分级** | 高重要度伏笔（4-5）优先回收，低重要度伏笔可延后 |
| **故事线关联** | 将伏笔关联到故事线，便于按线索管理 |

---

### 五、剧情结构分析

#### 5.1 使用 `analyze_plot_structure`

此工具提供全面的剧情结构诊断，返回内容包括：

- **事件类型分布**：普通/转折/高潮/结局/伏笔的数量和占比
- **故事线分布**：各故事线的事件数量，是否有高潮
- **章节关联情况**：多少事件已关联章节，多少未关联
- **重要程度分布**：1-5 级事件的分布
- **待回收伏笔数**
- **诊断建议**：具体的优化建议列表

#### 5.2 常见诊断及处理

| 诊断 | 含义 | 处理建议 |
|------|------|---------|
| 事件太少 | 剧情单薄 | 补充更多事件来丰富故事 |
| 缺少高潮 | 故事没有张力顶峰 | 为故事线添加高潮事件 |
| 缺少结局 | 故事线没有收束 | 规划结局事件 |
| 缺少转折点 | 剧情过于平淡 | 添加转折点增加戏剧性 |
| 未回收伏笔多 | 伏笔可能被遗忘 | 逐个回收或设置 deadline |
| 未关联章节事件多 | 事件悬空 | 将事件关联到具体章节 |
| 支线占比过高 | 主线被淹没 | 精简支线或加强主线 |
| 支线占比过低 | 故事层次单一 | 补充支线丰富层次 |
| 故事线无高潮 | 故事线虎头蛇尾 | 为该故事线添加高潮 |

---

### 六、典型工作流

#### 6.1 从零规划剧情

适用于新小说、还没有剧情结构的情况：

```
1. 了解小说素材（角色、场景、设定）
2. 规划故事线结构（主线 + 支线）
3. 为每条故事线设计事件序列
4. 在关键节点埋设伏笔
5. 用 analyze_plot_structure 检查结构健康度
```

#### 6.2 续写前检查

适用于已有部分剧情、准备续写的情况：

```
1. get_plot_overview 了解剧情全貌
2. list_pending_foreshadows 检查待回收伏笔
3. analyze_plot_structure 评估结构健康度
4. 确认下一章需要推进哪些事件、回收哪些伏笔
```

#### 6.3 剧情优化

适用于已有完整剧情、需要优化的情况：

```
1. analyze_plot_structure 获取诊断建议
2. 逐项处理建议（补充事件类型、回收伏笔、关联章节等）
3. 再次分析确认优化效果
```

---

### 七、工具速查

#### 剧情工具

| 工具名 | 用途 | 关键参数 |
|--------|------|---------|
| `get_plot_overview` | 获取剧情概览（故事线 + 事件） | 无参数 |
| `get_story_line_events` | 获取某条故事线的事件 | `storyLineName` |
| `analyze_plot_structure` | 分析剧情结构 | 无参数 |
| `create_plot_event` | 创建剧情事件 | `name`, `storyLineName?`, `eventType?`, `description?`, `storyTime?`, `chapterId?` |

#### 故事线工具

| 工具名 | 用途 | 关键参数 |
|--------|------|---------|
| `get_story_line_detail` | 获取故事线详情 | `storyLineId` 或 `storyLineName` |
| `create_story_line` | 创建故事线 | `name`, `lineType?`, `description?`, `color?`, `status?` |
| `update_story_line` | 修改故事线 | 定位参数 + `newName?`/`newLineType?`/`newStatus?`/`newDescription?`/`newColor?` |
| `delete_story_line` | 删除故事线 | `storyLineId` 或 `storyLineName` |

#### 伏笔工具

| 工具名 | 用途 | 关键参数 |
|--------|------|---------|
| `list_pending_foreshadows` | 列出伏笔清单 | `includeResolved?`, `limit?` |
| `get_foreshadow_detail` | 获取伏笔详情 | `foreshadowId` 或 `foreshadowName` |
| `create_foreshadow` | 创建伏笔 | `name`, `description?`, `chapterId?`/`chapterTitle?`, `storyLineName?`, `importance?`, `deadlineChapter?` |
| `resolve_foreshadow` | 回收伏笔 | `foreshadowId`/`foreshadowName`, `resolveChapterId?`/`resolveChapterTitle?` |

#### 辅助工具

| 工具名 | 用途 |
|--------|------|
| `list_chapters` | 了解章节结构，为事件关联章节做准备 |
| `list_characters` | 了解角色阵容，确保事件中的角色已存在 |
| `get_chapter_content` | 查看章节内容，确认伏笔埋设/回收位置 |',
  '## Plot Design Skill

This skill guides you through story line planning, plot event arrangement, foreshadow management, and plot structure optimization, helping build a complete and compelling story architecture.

---

### Core Concepts

This skill involves three interconnected systems:

| System | Description | Core Tools |
|--------|-------------|-----------|
| **Story Lines** | The narrative threads of the novel (main/branch/episode) | `create_story_line`, `update_story_line`, `delete_story_line` |
| **Plot Events** | Key nodes on the story lines | `create_plot_event`, `get_plot_overview` |
| **Foreshadows** | Clues that need to be planted and resolved | `create_foreshadow`, `resolve_foreshadow` |

**Relationship**: Story lines → contain multiple plot events → events can be of foreshadowing type → foreshadows need to be resolved in later chapters

---

### Core Principles

1. **Structure first**: Plan story lines first, then fill in events, finally plant foreshadows
2. **Clear hierarchy**: The main line carries the core conflict; branch lines enrich the story layers without overshadowing the main plot
3. **Pacing control**: The distribution of event types (normal → turning point → climax → resolution) should have a sense of rhythm
4. **Foreshadow closure**: Every planted foreshadow must be resolved; avoid loose ends
5. **Chapter anchoring**: Events and foreshadows should be linked to specific chapters whenever possible for easy tracking

---

### I. Pre-Operation: Understand Existing Plot

Before any plot operation, understand the full picture of the novel''s plot:

#### 1.1 Required Tool Calls

| Scenario | Required Call | Description |
|----------|--------------|-------------|
| **Any plot operation** | `get_plot_overview` | Get all story lines and events to understand the full plot |
| **Assess plot health** | `analyze_plot_structure` | Get structural statistics and diagnostic suggestions |
| **Foreshadow operations** | `list_pending_foreshadows` | View the list of unresolved foreshadows |

#### 1.2 Context Gathering (As Needed)

- `get_story_line_events`: Focused view of a specific story line''s event development
- `get_story_line_detail`: View detailed information and event statistics of a story line
- `get_foreshadow_detail`: View detailed information of a specific foreshadow
- `list_chapters`: Understand the chapter structure, for linking events to chapters
- `list_characters`: Understand the character roster, to ensure characters in events exist

---

### II. Story Line Management

#### 2.1 Create Story Line

**Workflow**:
```
get_plot_overview → analyze existing story lines → create_story_line
```

**Story Line Types**:

| Type | Description | Use Case |
|------|-------------|----------|
| `main` | Main line | Core conflict and main character development |
| `branch` | Branch line | Secondary character stories, subplots |
| `episode` | Episode | Standalone short stories, transitional plots |

**Story Line Status**:

| Status | Description |
|--------|-------------|
| `active` | In progress (default) |
| `completed` | Finished |
| `paused` | Paused |

**Steps**:

**Step 1**: Call `get_plot_overview` to view existing story lines

- Check if there are already story lines with the same name or similar function
- Evaluate the ratio of main lines to branch lines

**Step 2**: Call `create_story_line`

- `name`: Story line name, concise and recognizable (e.g., "Revenge Arc", "Growth Arc")
- `lineType`: Type (main/branch/episode)
- `description`: Describe the core conflict and direction of the story line
- `color`: Display color for visual differentiation

**Notes**:
- A novel typically has only 1 main line and 2-5 branch lines
- If a story line with the same name already exists, the existing one is returned
- Story lines must be created before they can be referenced in `create_plot_event`

#### 2.2 Update Story Line

Use `update_story_line`, locating by `storyLineId` or `storyLineName`.

Common update scenarios:

| Scenario | Field to Modify |
|----------|----------------|
| Story line is complete | `newStatus: "completed"` |
| Promote branch to main | `newLineType: "main"` |
| Adjust story direction | `newDescription` |
| Change display color | `newColor` |

#### 2.3 Delete Story Line

Use `delete_story_line`.

**Note**: Deleting a story line does not delete its associated plot events, but events will lose their story line association.

---

### III. Plot Event Management

#### 3.1 Event Types

| Type | Description | Narrative Purpose |
|------|-------------|-------------------|
| `normal` | Regular event | Advance the plot, set up background |
| `turning_point` | Turning point | Key node that changes the story direction |
| `climax` | Climax | The peak of tension in a story line |
| `resolution` | Resolution | The closure and resolution of a story line |
| `foreshadowing` | Foreshadowing | Plant clues to be resolved later |

#### 3.2 Create Plot Event

**Workflow**:
```
get_plot_overview → determine story line → create_plot_event
```

**Steps**:

**Step 1**: Call `get_plot_overview` to understand existing events

- Check what events the target story line already has
- Confirm the timeline order of events
- Check if the event type distribution is reasonable

**Step 2**: Call `create_plot_event`

- `name`: Event name (required), concisely summarizing the event content
- `storyLineName`: Story line name (must already exist)
- `eventType`: Event type
- `description`: Detailed event description
- `storyTime`: In-story time (e.g., "Chapter One", "Three days later")
- `chapterId`: Associated chapter ID (if known)
- `importance`: Importance level 1-5

**Notes**:
- `storyLineName` must reference an existing story line; spelling must be exact
- If you need to create a new story line and link events to it, create the story line first, then create the events

#### 3.3 Event Arrangement Principles

**Pacing reference**:

```
normal events → normal events → turning point → normal events → climax → resolution
```

- **Opening**: Use 2-3 normal events to establish background and conflict
- **Development**: Intersperse turning points to escalate the plot
- **Climax**: Each story line should have at least one climax event
- **Closure**: Use resolution events to wrap up the story line

**Importance level reference**:

| Level | Description | Examples |
|-------|-------------|----------|
| 1 | Background setup | Daily scenes, environment introduction |
| 2 | Minor advancement | Secondary character interactions |
| 3 | Normal advancement | Main plot progression (default) |
| 4 | Important node | Key information reveals, major decisions |
| 5 | Core event | Turning points, climaxes, major transformations |

#### 3.4 Batch Event Creation

When the user asks to plan a complete sequence of events for a story line:

- First use `get_plot_overview` to understand the big picture
- Design events in chronological order
- Distribute event types and importance levels reasonably
- Call `create_plot_event` for each event sequentially

---

### IV. Foreshadow Management

#### 4.1 Plant Foreshadow

**Workflow**:
```
get_plot_overview → list_pending_foreshadows → create_foreshadow
```

**Steps**:

**Step 1**: Understand the current foreshadow situation

- Call `list_pending_foreshadows` to view unresolved foreshadows
- Avoid planting clues that duplicate or conflict with existing foreshadows

**Step 2**: Call `create_foreshadow`

- `name`: Foreshadow name, concise and clear (e.g., "Mysterious Letter", "Missing Dagger")
- `description`: Explain the foreshadow content and expected resolution method
- `chapterId` / `chapterTitle`: Chapter where the foreshadow is planted
- `storyLineName`: Associated story line (optional)
- `importance`: Importance level 1-5
- `deadlineChapter`: Expected chapter number for resolution (used as a reminder)

**Design tips**:
- Foreshadow planting should feel natural, not overly deliberate
- The description should clearly state the expected resolution method for future reference
- Setting `deadlineChapter` helps prevent foreshadows from being forgotten

#### 4.2 Resolve Foreshadow

**Workflow**:
```
list_pending_foreshadows → get_foreshadow_detail → resolve_foreshadow
```

**Steps**:

**Step 1**: Call `list_pending_foreshadows` to view unresolved foreshadows

**Step 2**: Call `get_foreshadow_detail` to review foreshadow details

- Review the foreshadow''s content and expected resolution method
- Determine which chapter is appropriate for resolution

**Step 3**: Call `resolve_foreshadow`

- `foreshadowId` or `foreshadowName`: Locate the foreshadow
- `resolveChapterId` or `resolveChapterTitle`: Resolution chapter

**Notes**:
- Only foreshadows with `planted` status can be resolved
- `foreshadowName` supports fuzzy matching
- Resolution timing should be appropriate—neither too early nor too late

#### 4.3 Foreshadow Management Strategy

| Strategy | Description |
|----------|-------------|
| **Regular check** | Use `list_pending_foreshadows` every 3-5 chapters to check unresolved foreshadows |
| **Set deadlines** | Set `deadlineChapter` when creating foreshadows for tracking |
| **Prioritize by importance** | Resolve high-importance foreshadows (4-5) first; low-importance ones can be deferred |
| **Story line association** | Link foreshadows to story lines for organized management |

---

### V. Plot Structure Analysis

#### 5.1 Using `analyze_plot_structure`

This tool provides comprehensive plot structure diagnostics, returning:

- **Event type distribution**: Count and percentage of normal/turning point/climax/resolution/foreshadowing
- **Story line distribution**: Event count per story line, whether each has a climax
- **Chapter coverage**: How many events are linked to chapters vs. unlinked
- **Importance distribution**: Event counts for levels 1-5
- **Pending foreshadow count**
- **Diagnostic suggestions**: A specific list of optimization suggestions

#### 5.2 Common Diagnostics and Remedies

| Diagnostic | Meaning | Suggested Action |
|-----------|---------|-----------------|
| Too few events | Thin plot | Add more events to enrich the story |
| No climax | Story lacks a tension peak | Add climax events to story lines |
| No resolution | Story lines are not closed | Plan resolution events |
| No turning points | Plot is too flat | Add turning points for dramatic effect |
| Many unresolved foreshadows | Foreshadows may be forgotten | Resolve them or set deadlines |
| Many unlinked events | Events are orphaned | Link events to specific chapters |
| Branch lines dominate | Main line is overshadowed | Streamline branches or strengthen the main line |
| Branch lines too sparse | Story lacks layers | Add branch lines for depth |
| Story line has no climax | Story line fizzles out | Add a climax for that story line |

---

### VI. Typical Workflows

#### 6.1 Planning Plot from Scratch

For new novels with no plot structure yet:

```
1. Understand novel materials (characters, scenes, settings)
2. Plan story line structure (main + branches)
3. Design event sequences for each story line
4. Plant foreshadows at key points
5. Use analyze_plot_structure to check structural health
```

#### 6.2 Pre-Writing Check

For novels with existing plot, preparing to continue writing:

```
1. get_plot_overview to understand the full plot
2. list_pending_foreshadows to check unresolved foreshadows
3. analyze_plot_structure to assess structural health
4. Determine which events to advance and which foreshadows to resolve in the next chapter
```

#### 6.3 Plot Optimization

For novels with complete plot that needs optimization:

```
1. analyze_plot_structure to get diagnostic suggestions
2. Address each suggestion (add event types, resolve foreshadows, link chapters, etc.)
3. Analyze again to confirm improvements
```

---

### VII. Tool Quick Reference

#### Plot Tools

| Tool Name | Purpose | Key Parameters |
|-----------|---------|---------------|
| `get_plot_overview` | Get plot overview (story lines + events) | No parameters |
| `get_story_line_events` | Get events for a story line | `storyLineName` |
| `analyze_plot_structure` | Analyze plot structure | No parameters |
| `create_plot_event` | Create plot event | `name`, `storyLineName?`, `eventType?`, `description?`, `storyTime?`, `chapterId?` |

#### Story Line Tools

| Tool Name | Purpose | Key Parameters |
|-----------|---------|---------------|
| `get_story_line_detail` | Get story line details | `storyLineId` or `storyLineName` |
| `create_story_line` | Create story line | `name`, `lineType?`, `description?`, `color?`, `status?` |
| `update_story_line` | Update story line | Locating params + `newName?`/`newLineType?`/`newStatus?`/`newDescription?`/`newColor?` |
| `delete_story_line` | Delete story line | `storyLineId` or `storyLineName` |

#### Foreshadow Tools

| Tool Name | Purpose | Key Parameters |
|-----------|---------|---------------|
| `list_pending_foreshadows` | List foreshadows | `includeResolved?`, `limit?` |
| `get_foreshadow_detail` | Get foreshadow details | `foreshadowId` or `foreshadowName` |
| `create_foreshadow` | Create foreshadow | `name`, `description?`, `chapterId?`/`chapterTitle?`, `storyLineName?`, `importance?`, `deadlineChapter?` |
| `resolve_foreshadow` | Resolve foreshadow | `foreshadowId`/`foreshadowName`, `resolveChapterId?`/`resolveChapterTitle?` |

#### Helper Tools

| Tool Name | Purpose |
|-----------|---------|
| `list_chapters` | Understand chapter structure, for linking events to chapters |
| `list_characters` | Understand the character roster, to ensure characters in events exist |
| `get_chapter_content` | View chapter content, to confirm foreshadow planting/resolution locations |',

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
