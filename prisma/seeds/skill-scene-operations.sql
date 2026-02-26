-- 全局场景操作 Skill / Global Scene Operations Skill
-- novel_creation_method_id = NULL 表示全局可用 / NULL means globally available
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-scene-operations.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'scene-operations',
  '场景全生命周期管理：创建、修改、删除场景，同步维护关系图谱，确保与世界观设定、剧情动线、角色活动保持一致',
  'Full lifecycle scene management: create, modify, and delete scenes, synchronize the relationship graph, and ensure consistency with world-building settings, plot progression, and character activities',
  '## 场景操作技能

本技能指导你完成场景的创建、修改、删除操作，并确保场景数据与小说的世界观、剧情动线和角色活动保持一致。

---

### 核心原则

1. **禁止向用户提问**：禁止询问偏好、想法、选择。禁止在调用工具之前征求意见。信息不足时自行做出合理决策。用户通过系统确认 UI 审批
2. **Schema 驱动**：场景属性必须严格遵循当前项目的 JSON Schema 定义
3. **关系同步**：场景变动必须同步维护知识图谱中的关系（场景与角色、场景与场景、场景与组织等）
4. **影响评估**：操作完成后评估对剧情动线、角色活动、事件发生地的连锁影响

---

### 一、操作前：信息收集阶段

在执行任何场景操作之前，根据操作类型收集必要信息：

#### 1.1 必须调用的工具

| 操作 | 必须调用 | 说明 |
|------|---------|------|
| **创建场景** | `get_scene_schema` | 获取场景 JSON Schema，了解必填字段和可选字段 |
| **创建场景** | `list_scenes` | 查看已有场景，避免重名或功能重叠 |
| **修改场景** | `get_scene_detail` | 获取场景当前完整数据 |
| **删除场景** | `get_scene_detail` | 确认场景信息 |
| **删除场景** | `query_character_relations` | 查看与该场景相关的所有关系（该工具支持查询所有实体类型） |

#### 1.2 上下文收集（按需）

根据操作的复杂度，选择性调用以下工具补充上下文：

- `list_settings`：获取所有设定模块内容（世界观、核心设定等），作为创意决策的基础
- `get_setting_detail`：查看特定设定的详细内容
- `get_plot_overview`：了解主线剧情和关键事件，判断场景在故事中承载的功能
- `get_story_line_events`：查看具体故事线的事件，了解哪些事件发生在相关场景
- `list_characters`：浏览角色列表，了解哪些角色可能活动在该场景
- `list_scenes`：浏览已有场景，评估空间关系和地理分布
- `search_across_chapters`：搜索场景在正文中的出现情况
- `list_organizations`：查看组织列表，了解哪些组织驻扎在相关场景

**判断标准**：
- 简单操作（如修改场景的某个描述属性）：调研可精简
- 复杂操作（如创建核心场景、删除关键剧情场景）：必须充分调研

#### 1.3 领域知识注入

在可用技能列表中查找：名称含 `-scene-gen` 的专属场景生成技能。如有，调用 `use_skill` 加载，获取该小说类型下的领域知识指导。

领域知识在各操作中的作用：
- **创建**：指导场景属性的生成，确保符合该小说类型的惯例和风格
- **修改**：指导属性值的调整，确保修改后的内容与小说类型风格一致
- **删除**：辅助影响评估，帮助判断删除后对场景体系和空间关系的影响

---

### 二、创建场景

#### 2.1 流程

```
get_scene_schema → 收集上下文 → 设计场景属性 → create_scene → 创建关系
```

#### 2.2 步骤

**Step 1**：调用 `get_scene_schema` 获取 Schema 定义

- 确认所有 `required` 字段
- 了解每个字段的 `type`、`enum` 约束、`title` 含义

**Step 2**：收集上下文

- 调用 `list_settings` 获取所有设定模块内容（世界观、核心设定等）
- 调用 `list_scenes` 了解已有场景布局
- 如有需要，调用 `get_plot_overview` 理解剧情需求，查看相关角色和组织信息

**Step 3**：分析 Schema 字段并生成场景数据

遍历 Schema 的 `properties`，对每个字段确定生成策略：
- `required` 数组中的字段 → 必须填充
- 其余字段 → 根据 `description` 判断是否适合生成
- 嵌套 `object` 类型字段 → 递归遵循子 Schema

严格按类型生成：
- `string` → 生成文本（对 `x-uiWidget: textarea` 的字段写详细内容）
- `object` → 生成嵌套对象（填充所有子字段）
- `array` → 生成数组（注意 `items` 的类型定义）
- `number`/`integer` → 生成数值
- `enum` 约束 → 从可选值中选择一个

构建创建参数：
- `name` 参数：场景名称（不可与已有场景重复）
- `properties` 参数：包含所有需要生成的字段的 JSON 对象

**Step 4**：调用 `create_scene` 创建场景

**Step 5**：创建场景关系

分析新场景与其他实体之间应该存在的关系，对每条关系调用 `create_relation`：

**场景 ↔ 场景**（空间关系）：
- 用 `categoryA: "scene"`, `categoryB: "scene"` 明确类型

**场景 ↔ 角色**（活动关系）：
- 用 `categoryA: "scene"`, `categoryB: "character"`（或反向）

**场景 ↔ 组织**（归属关系）：
- 用 `categoryA: "scene"`, `categoryB: "organization"`（或反向）

**通用参数**：
- `nameA`：实体 A 名称
- `nameB`：实体 B 名称
- `relation`：关系描述（自由文本）
- `description`：关系的具体描述
- `strength`：关系强度（1-5，可选）

**立即调用工具，不要先用文字描述计划。**

#### 2.3 注意事项

- 信息不足时自行做出合理的创意决策，不要向用户提问
- 新场景的空间关系要与已有场景的地理逻辑自洽（如不能与相隔万里的场景"相邻"）
- 关系描述要具体，说明空间距离、通行方式、归属性质等

---

### 三、修改场景

#### 3.1 流程

```
get_scene_detail → 收集上下文 → update_scene → 评估关系影响 → 更新关系
```

#### 3.2 步骤

**Step 1**：调用 `get_scene_detail` 获取场景当前数据

**Step 2**：评估修改范围

- 如果修改涉及场景的核心属性（地理位置、归属势力、环境性质等），需要额外调研：
  - `query_character_relations`：查看与该场景相关的所有关系（传入场景名称作为 `characterName` 参数）
  - `search_across_chapters`：搜索场景在正文中的描写
  - `get_setting_detail`：检查修改后是否仍符合世界观

**Step 3**：调用 `update_scene`

- `properties` 只需传入要修改的字段（增量更新，系统自动合并）
- 修改后的值仍必须符合 Schema 约束

**Step 4**：同步更新关系图谱

- 如果修改了场景的归属、性质或空间位置等，检查现有关系是否需要调整
- 对需要变更的关系调用 `update_relation` 或 `delete_relation` + `create_relation`

#### 3.3 典型修改场景

| 修改内容 | 关系影响 | 处理方式 |
|---------|---------|---------|
| 外观描述、氛围等表面属性 | 通常无影响 | 直接 `update_scene` |
| 地理位置、空间布局 | 影响与相邻场景的空间关系 | 检查并更新场景间的 relation 文本和 description |
| 归属势力、控制权变更 | 影响场景与组织的关系 | 更新场景与组织的关系，可能需要新建或删除 |
| 环境性质变化（如毁灭、重建） | 影响所有与该场景关联的关系 | 全面审查：角色是否需要迁移、组织是否失去据点 |
| 可达性变化（封锁、开放） | 影响场景间通行关系 | 更新与相关场景的 relation 文本 |

---

### 四、删除场景

#### 4.1 流程

```
get_scene_detail → query_character_relations → 评估影响 → 清理关系 → delete_scene
```

#### 4.2 步骤

**Step 1**：调用 `get_scene_detail` 确认场景信息

**Step 2**：调用 `query_character_relations` 获取与该场景相关的所有关系（传入场景名称作为 `characterName` 参数）

**Step 3**：影响评估（删除前必须告知用户）

- 该场景涉及多少条关系连接（与角色、组织、其他场景）
- 该场景在哪些章节中出现（`search_across_chapters`）
- 该场景是否是关键剧情事件的发生地（`get_plot_overview`）
- 哪些角色以该场景为居住地/活动地
- 哪些组织以该场景为据点
- 删除后对故事空间结构的影响

**Step 4**：清理关系图谱

- 对该场景的每条关系调用 `delete_relation` 清除
- 如果场景 A 被删除后，原本通过 A 连通的场景 B 和场景 C 之间失去通行路径，考虑是否需要补建直接关系
- 角色的居住地/活动地关系需要转移到其他场景

**Step 5**：调用 `delete_scene` 删除场景

#### 4.3 警告

- 删除操作不可逆
- 关键场景（主线剧情发生地、角色聚集地）的删除需在影响评估中重点标注风险

---

### 五、操作后：影响评估阶段

每次场景操作完成后，评估以下维度的连锁影响并汇报给用户：

#### 5.1 评估清单

| 维度 | 评估内容 | 可能需要的操作 |
|------|---------|--------------|
| **空间关系** | 与相邻场景的连通性是否受影响 | `create_relation` / `update_relation` / `delete_relation` |
| **角色活动** | 在该场景活动的角色是否受影响（居住地、工作地） | 提醒用户调整角色的场景归属 |
| **组织据点** | 以该场景为据点的组织是否受影响 | 提醒用户调整组织的据点设定 |
| **剧情事件** | 以该场景为发生地的事件是否受影响 | 提醒用户检查事件的发生地设定 |
| **伏笔线索** | 与该场景相关的伏笔是否受影响（如隐藏在某处的线索） | 提醒用户检查伏笔设计 |
| **世界观一致性** | 场景变动是否导致地理或空间逻辑矛盾 | 提醒用户审查世界观设定 |

#### 5.2 汇报格式

操作完成后，向用户简明扼要地汇报：

1. **已完成的操作**：场景创建/修改/删除 + 关系图谱变更
2. **潜在影响**：列出可能受影响的维度
3. **建议后续操作**：如果需要额外处理，给出具体建议

---

### 六、工具速查

| 工具名 | 用途 | 关键参数 |
|--------|------|---------|
| `get_scene_schema` | 获取场景 JSON Schema | 无参数 |
| `list_scenes` | 列出所有场景 | `keyword?`, `limit?` |
| `get_scene_detail` | 获取场景详情 | `sceneName` 或 `sceneId` |
| `search_scenes` | 搜索场景 | `keyword` |
| `create_scene` | 创建场景 | `name`, `properties?` |
| `update_scene` | 修改场景 | `sceneName`/`sceneId`, `properties` |
| `delete_scene` | 删除场景 | `sceneName` 或 `sceneId` |
| `query_character_relations` | 查询实体关系（支持所有类型） | `characterName?`（传入场景名）, `relation?` |
| `create_relation` | 创建关系 | `nameA`, `nameB`, `relation`, `color`, `categoryA?`, `categoryB?` |
| `update_relation` | 更新关系 | `relationId` 或 `nameA`+`nameB`+`relation` |
| `delete_relation` | 删除关系 | `relationId` 或 `nameA`+`nameB`+`relation` |
| `get_plot_overview` | 获取剧情概览 | 无参数 |
| `get_story_line_events` | 获取故事线事件 | `storyLineName` |
| `search_across_chapters` | 搜索章节内容 | `keyword` |
| `get_setting_detail` | 获取世界设定 | `settingName` 或 `settingId` |
| `list_characters` | 列出所有角色 | `keyword?`, `limit?` |
| `list_organizations` | 列出所有组织 | `keyword?`, `limit?` |',

  '## Scene Operations Skill

This skill guides you through creating, modifying, and deleting scenes, ensuring that scene data remains consistent with the novel''s world-building, plot progression, and character activities.

---

### Core Principles

1. **NEVER ask the user any questions**: Do not ask for preferences, ideas, or choices. Do not seek input before calling tools. When information is insufficient, make reasonable decisions on your own. Users review via the system confirmation UI
2. **Schema-driven**: Scene properties must strictly follow the current project''s JSON Schema definition
3. **Relationship synchronization**: Scene changes must synchronize relationships in the knowledge graph (scene-to-character, scene-to-scene, scene-to-organization, etc.)
4. **Impact assessment**: After each operation, evaluate cascading effects on plot progression, character activities, and event locations

---

### I. Pre-Operation: Information Gathering Phase

Before executing any scene operation, gather the necessary information based on the operation type:

#### 1.1 Required Tool Calls

| Operation | Required Call | Description |
|-----------|--------------|-------------|
| **Create scene** | `get_scene_schema` | Retrieve the scene JSON Schema to understand required and optional fields |
| **Create scene** | `list_scenes` | Review existing scenes to avoid duplicate names or overlapping functions |
| **Modify scene** | `get_scene_detail` | Retrieve the scene''s current complete data |
| **Delete scene** | `get_scene_detail` | Confirm scene information |
| **Delete scene** | `query_character_relations` | Review all relationships associated with the scene (this tool supports querying all entity types) |

#### 1.2 Context Gathering (As Needed)

Depending on the operation''s complexity, selectively call the following tools to supplement context:

- `list_settings`: Retrieve all setting module contents (worldview, core settings, etc.) as the foundation for creative decisions
- `get_setting_detail`: Review specific setting details
- `get_plot_overview`: Understand the main plot and key events to determine the scene''s narrative function in the story
- `get_story_line_events`: Review specific storyline events to identify which events occur at the relevant scene
- `list_characters`: Browse the character list to understand which characters may be active at the scene
- `list_scenes`: Browse existing scenes to evaluate spatial relationships and geographic distribution
- `search_across_chapters`: Search for the scene''s appearances in the manuscript text
- `list_organizations`: Review the organization list to understand which organizations are stationed at the relevant scene

**Decision criteria**:
- Simple operations (e.g., modifying a scene''s descriptive attribute): Research can be streamlined
- Complex operations (e.g., creating a core scene, deleting a key plot scene): Thorough research is required

#### 1.3 Domain Knowledge Injection

Search the available skills list for one whose name contains `-scene-gen`. If found, call `use_skill` to load it and obtain domain knowledge guidance for the specific novel type.

How domain knowledge applies across operations:
- **Create**: Guides scene attribute generation to ensure compliance with the novel type''s conventions and style
- **Modify**: Guides attribute value adjustments to ensure modified content remains consistent with the novel type''s style
- **Delete**: Assists impact assessment, helping evaluate the effect of deletion on the scene system and spatial relationships

---

### II. Creating a Scene

#### 2.1 Workflow

```
get_scene_schema -> gather context -> design scene properties -> create_scene -> create relationships
```

#### 2.2 Steps

**Step 1**: Call `get_scene_schema` to retrieve the Schema definition

- Confirm all `required` fields
- Understand each field''s `type`, `enum` constraints, and `title` meaning

**Step 2**: Gather context

- Call `list_settings` to retrieve all setting module contents (worldview, core settings, etc.)
- Call `list_scenes` to understand the existing scene layout
- If needed, call `get_plot_overview` to understand plot requirements, and review related character and organization information

**Step 3**: Analyze Schema fields and generate scene data

Iterate through the Schema''s `properties` to determine the generation strategy for each field:
- Fields in the `required` array → must be populated
- Other fields → determine whether to generate based on `description`
- Nested `object` type fields → recursively follow sub-Schemas

Generate strictly by type:
- `string` → generate text (write detailed content for fields with `x-uiWidget: textarea`)
- `object` → generate nested objects (populate all sub-fields)
- `array` → generate arrays (follow the `items` type definition)
- `number`/`integer` → generate numerical values
- `enum` constraints → select from the available options

Build creation parameters:
- `name` parameter: Scene name (must not duplicate existing scene names)
- `properties` parameter: A JSON object containing all fields to be generated

**Step 4**: Call `create_scene` to create the scene

**Step 5**: Create scene relationships

Analyze the relationships that should exist between the new scene and other entities, and call `create_relation` for each:

**Scene <-> Scene** (spatial relationships):
- Use `categoryA: "scene"`, `categoryB: "scene"` to specify the types

**Scene <-> Character** (activity relationships):
- Use `categoryA: "scene"`, `categoryB: "character"` (or reverse)

**Scene <-> Organization** (affiliation relationships):
- Use `categoryA: "scene"`, `categoryB: "organization"` (or reverse)

**Common parameters**:
- `nameA`: Name of entity A
- `nameB`: Name of entity B
- `relation`: Relationship description (free-form text)
- `description`: Specific description of the relationship
- `strength`: Relationship strength (1-5, optional)

**Call tools immediately. Do not describe your plan in text first.**

#### 2.3 Notes

- When information is insufficient, make reasonable creative decisions on your own — never ask the user
- Spatial relationships of the new scene must be geographically consistent with existing scenes (e.g., a scene cannot be "adjacent" to one that is thousands of miles away)
- Relationship descriptions should be specific, detailing spatial distance, travel methods, affiliation nature, etc.

---

### III. Modifying a Scene

#### 3.1 Workflow

```
get_scene_detail -> gather context -> update_scene -> assess relationship impact -> update relationships
```

#### 3.2 Steps

**Step 1**: Call `get_scene_detail` to retrieve the scene''s current data

**Step 2**: Assess the scope of modifications

- If modifications involve the scene''s core attributes (geographic location, controlling faction, environmental nature, etc.), additional research is needed:
  - `query_character_relations`: Review all relationships associated with the scene (pass the scene name as the `characterName` parameter)
  - `search_across_chapters`: Search for descriptions of the scene in the manuscript text
  - `get_setting_detail`: Verify that the modifications still conform to the world-building

**Step 3**: Call `update_scene`

- `properties` only needs to include the fields being modified (incremental update; the system merges automatically)
- Modified values must still comply with Schema constraints

**Step 4**: Synchronize the relationship graph

- If the scene''s affiliation, nature, or spatial position was modified, check whether existing relationships need adjustment
- For relationships that need changes, call `update_relation` or `delete_relation` + `create_relation`

#### 3.3 Typical Modification Scenarios

| Modification | Relationship Impact | Handling Approach |
|-------------|--------------------|--------------------|
| Appearance descriptions, atmosphere, and other surface attributes | Usually no impact | Directly call `update_scene` |
| Geographic location, spatial layout | Affects spatial relationships with adjacent scenes | Check and update relation text and description between scenes |
| Controlling faction, ownership changes | Affects scene-to-organization relationships | Update scene-to-organization relationships; may require creating or deleting |
| Environmental nature changes (e.g., destruction, reconstruction) | Affects all relationships associated with the scene | Full review: whether characters need relocation, whether organizations lose their bases |
| Accessibility changes (blockade, opening) | Affects transit relationships between scenes | Update relation text with related scenes |

---

### IV. Deleting a Scene

#### 4.1 Workflow

```
get_scene_detail -> query_character_relations -> assess impact -> clean up relationships -> delete_scene
```

#### 4.2 Steps

**Step 1**: Call `get_scene_detail` to confirm scene information

**Step 2**: Call `query_character_relations` to retrieve all relationships associated with the scene (pass the scene name as the `characterName` parameter)

**Step 3**: Impact assessment (must inform the user before deletion)

- How many relationship connections the scene has (with characters, organizations, other scenes)
- Which chapters the scene appears in (`search_across_chapters`)
- Whether the scene is the location of key plot events (`get_plot_overview`)
- Which characters use the scene as their residence/activity location
- Which organizations use the scene as their base
- The impact on the story''s spatial structure after deletion

**Step 4**: Clean up the relationship graph

- Call `delete_relation` for each relationship associated with the scene
- If deleting scene A causes scenes B and C (previously connected through A) to lose their transit path, consider whether a direct relationship needs to be created
- Character residence/activity location relationships need to be transferred to other scenes

**Step 5**: Call `delete_scene` to delete the scene

#### 4.3 Warnings

- Deletion is irreversible
- Deletion of key scenes (main plot event locations, character gathering places) requires highlighting risks in the impact assessment

---

### V. Post-Operation: Impact Assessment Phase

After each scene operation, evaluate cascading effects across the following dimensions and report to the user:

#### 5.1 Assessment Checklist

| Dimension | Assessment Content | Possible Actions Needed |
|-----------|-------------------|------------------------|
| **Spatial relationships** | Whether connectivity with adjacent scenes is affected | `create_relation` / `update_relation` / `delete_relation` |
| **Character activities** | Whether characters active at the scene are affected (residence, workplace) | Remind the user to adjust character scene assignments |
| **Organization bases** | Whether organizations based at the scene are affected | Remind the user to adjust organization base settings |
| **Plot events** | Whether events taking place at the scene are affected | Remind the user to check event location settings |
| **Foreshadowing and clues** | Whether foreshadowing related to the scene is affected (e.g., clues hidden at a location) | Remind the user to review foreshadowing design |
| **World-building consistency** | Whether scene changes cause geographic or spatial logic contradictions | Remind the user to review world-building settings |

#### 5.2 Report Format

After completing the operation, provide a concise report to the user:

1. **Completed operations**: Scene creation/modification/deletion + relationship graph changes
2. **Potential impacts**: List the dimensions that may be affected
3. **Recommended follow-up actions**: If additional handling is needed, provide specific suggestions

---

### VI. Tool Quick Reference

| Tool Name | Purpose | Key Parameters |
|-----------|---------|----------------|
| `get_scene_schema` | Retrieve scene JSON Schema | No parameters |
| `list_scenes` | List all scenes | `keyword?`, `limit?` |
| `get_scene_detail` | Get scene details | `sceneName` or `sceneId` |
| `search_scenes` | Search scenes | `keyword` |
| `create_scene` | Create a scene | `name`, `properties?` |
| `update_scene` | Modify a scene | `sceneName`/`sceneId`, `properties` |
| `delete_scene` | Delete a scene | `sceneName` or `sceneId` |
| `query_character_relations` | Query entity relationships (supports all types) | `characterName?` (pass scene name), `relation?` |
| `create_relation` | Create a relationship | `nameA`, `nameB`, `relation`, `color`, `categoryA?`, `categoryB?` |
| `update_relation` | Update a relationship | `relationId` or `nameA`+`nameB`+`relation` |
| `delete_relation` | Delete a relationship | `relationId` or `nameA`+`nameB`+`relation` |
| `get_plot_overview` | Get plot overview | No parameters |
| `get_story_line_events` | Get storyline events | `storyLineName` |
| `search_across_chapters` | Search chapter content | `keyword` |
| `get_setting_detail` | Get world-building settings | `settingName` or `settingId` |
| `list_characters` | List all characters | `keyword?`, `limit?` |
| `list_organizations` | List all organizations | `keyword?`, `limit?` |',

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
