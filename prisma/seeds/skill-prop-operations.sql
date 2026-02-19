-- 全局道具操作 Skill / Global Prop Operations Skill
-- novel_creation_method_id = NULL 表示全局可用 / NULL means globally available
-- 执行方式 / Execute: mysql -u <user> -p <database> < skill-prop-operations.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'prop-operations',
  '道具全生命周期管理：创建、修改、删除道具，同步维护关系图谱，确保与角色持有、场景分布、剧情线索保持一致',
  'Full lifecycle management of props: create, modify, and delete props while synchronizing the knowledge graph to ensure consistency with character ownership, scene distribution, and plot threads',
  '## 道具操作技能

本技能指导你完成道具的创建、修改、删除操作，并确保道具数据与小说的角色持有、场景分布和剧情线索保持一致。

---

### 核心原则

1. **先调研，后执行**：任何道具操作前必须收集充分的上下文信息
2. **Schema 驱动**：道具属性必须严格遵循当前项目的 JSON Schema 定义
3. **关系同步**：道具变动必须同步维护知识图谱中的关系（道具与角色、道具与场景、道具与组织等）
4. **影响评估**：操作完成后评估对剧情线索、角色能力、伏笔设计的连锁影响

---

### 一、操作前：信息收集阶段

在执行任何道具操作之前，根据操作类型收集必要信息：

#### 1.1 必须调用的工具

| 操作 | 必须调用 | 说明 |
|------|---------|------|
| **创建道具** | `get_prop_schema` | 获取道具 JSON Schema，了解必填字段和可选字段 |
| **创建道具** | `list_props` | 查看已有道具，避免重名或功能重叠 |
| **修改道具** | `get_prop_detail` | 获取道具当前完整数据 |
| **删除道具** | `get_prop_detail` | 确认道具信息 |
| **删除道具** | `query_character_relations` | 查看与该道具相关的所有关系（该工具支持查询所有实体类型） |

#### 1.2 上下文收集（按需）

根据操作的复杂度，选择性调用以下工具补充上下文：

- `get_setting_detail`：查看世界观设定，确保道具的设定与世界观一致（如力量体系、科技水平）
- `get_plot_overview`：了解主线剧情和关键事件，判断道具在故事中承载的功能
- `get_story_line_events`：查看具体故事线的事件，了解道具参与的情节
- `list_characters`：浏览角色列表，了解哪些角色可能持有或使用该道具
- `list_scenes`：浏览场景列表，了解道具可能存放或出现的地点
- `list_props`：浏览已有道具，评估道具体系的完整性和平衡性
- `search_across_chapters`：搜索道具在正文中的出现情况

**判断标准**：
- 简单操作（如修改道具的某个描述属性）：调研可精简
- 复杂操作（如创建关键剧情道具、删除核心线索道具）：必须充分调研

---

### 二、创建道具

#### 2.1 流程

```
get_prop_schema → 收集上下文 → 设计道具属性 → create_prop → 创建关系
```

#### 2.2 步骤

**Step 1**：调用 `get_prop_schema` 获取 Schema 定义

- 确认所有 `required` 字段
- 了解每个字段的 `type`、`enum` 约束、`title` 含义

**Step 2**：收集上下文

- 调用 `list_props` 了解已有道具体系
- 调用 `get_setting_detail` 了解世界观设定，确保道具与世界观契合
- 调用 `get_plot_overview` 理解剧情需求，判断道具应承载的叙事功能
- 如有需要，查看相关角色和场景信息

**Step 3**：构建道具数据

- `name` 参数：道具名称（不可与已有道具重复）
- `properties` 参数：严格按照 Schema 定义构建 JSON 对象
- 必须填写所有 `required` 字段
- `enum` 类型字段只能使用预定义的选项值
- 嵌套 `object` 或 `array` 类型字段需递归遵循子 Schema

**Step 4**：调用 `create_prop` 创建道具

**Step 5**：创建道具关系

分析新道具与其他实体之间应该存在的关系，对每条关系调用 `create_relation`：

**道具 ↔ 角色**（持有/使用关系）：
- 用 `fromCategory: "prop"`, `toCategory: "character"`（或反向）

**道具 ↔ 场景**（存放/出现关系）：
- 用 `fromCategory: "prop"`, `toCategory: "scene"`（或反向）

**道具 ↔ 组织**（归属关系）：
- 用 `fromCategory: "prop"`, `toCategory: "organization"`（或反向）

**道具 ↔ 道具**（关联关系）：
- 用 `fromCategory: "prop"`, `toCategory: "prop"`

**通用参数**：
- `fromName`：关系起点实体名
- `toName`：关系终点实体名
- `relationType`：关系类型
- `description`：关系的具体描述
- `strength`：关系强度（1-5，可选）

#### 2.3 注意事项

- 如果用户提供的信息不足以填写必填字段，**主动询问**用户补充
- 道具的能力设定要考虑与世界观力量体系的平衡
- 关系描述要具体，说明持有方式、获取途径、存放条件等

---

### 三、修改道具

#### 3.1 流程

```
get_prop_detail → 收集上下文 → update_prop → 评估关系影响 → 更新关系
```

#### 3.2 步骤

**Step 1**：调用 `get_prop_detail` 获取道具当前数据

**Step 2**：评估修改范围

- 如果修改涉及道具的核心属性（能力、归属、状态等），需要额外调研：
  - `query_character_relations`：查看与该道具相关的所有关系（传入道具名称作为 `characterName` 参数）
  - `search_across_chapters`：搜索道具在正文中的描写
  - `get_setting_detail`：检查修改后是否仍符合世界观

**Step 3**：调用 `update_prop`

- `properties` 只需传入要修改的字段（增量更新，系统自动合并）
- 修改后的值仍必须符合 Schema 约束

**Step 4**：同步更新关系图谱

- 如果修改了道具的归属、能力或状态等，检查现有关系是否需要调整
- 对需要变更的关系调用 `update_relation` 或 `delete_relation` + `create_relation`

#### 3.3 典型修改场景

| 修改内容 | 关系影响 | 处理方式 |
|---------|---------|---------|
| 外观描述等表面属性 | 通常无影响 | 直接 `update_prop` |
| 持有者变更 | 影响道具与角色的关系 | 删除旧持有关系，创建新持有关系 |
| 存放位置变更 | 影响道具与场景的关系 | 更新道具与场景的关系 |
| 能力/效果变化 | 影响持有角色的能力对比 | 检查角色间力量关系是否需要调整 |
| 道具损毁/消耗 | 影响所有与该道具关联的关系 | 全面审查：持有者失去能力加成、相关伏笔是否需要调整 |
| 归属组织变更 | 影响道具与组织的关系 | 更新组织归属关系 |

---

### 四、删除道具

#### 4.1 流程

```
get_prop_detail → query_character_relations → 评估影响 → 清理关系 → delete_prop
```

#### 4.2 步骤

**Step 1**：调用 `get_prop_detail` 确认道具信息

**Step 2**：调用 `query_character_relations` 获取与该道具相关的所有关系（传入道具名称作为 `characterName` 参数）

**Step 3**：影响评估（删除前必须告知用户）

- 该道具涉及多少条关系连接（持有角色、存放场景、归属组织）
- 该道具在哪些章节中出现（`search_across_chapters`）
- 该道具是否参与关键剧情事件或伏笔（`get_plot_overview`）
- 哪些角色依赖该道具的能力
- 删除后对剧情线索的影响

**Step 4**：清理关系图谱

- 对该道具的每条关系调用 `delete_relation` 清除
- 如果道具是角色能力的来源，考虑角色是否需要连带调整

**Step 5**：调用 `delete_prop` 删除道具

#### 4.3 警告

- 删除操作不可逆
- 关键道具（剧情核心道具、伏笔线索道具）的删除务必与用户充分确认

---

### 五、操作后：影响评估阶段

每次道具操作完成后，评估以下维度的连锁影响并汇报给用户：

#### 5.1 评估清单

| 维度 | 评估内容 | 可能需要的操作 |
|------|---------|--------------|
| **持有关系** | 道具归属变动对角色的影响 | `create_relation` / `update_relation` / `delete_relation` |
| **角色能力** | 道具变动是否影响持有角色的能力表现 | 提醒用户调整角色相关设定 |
| **剧情线索** | 道具是否承载剧情线索或推动情节 | 提醒用户检查相关剧情设计 |
| **伏笔设计** | 与该道具相关的伏笔是否受影响 | 提醒用户检查伏笔设计 |
| **场景分布** | 道具的存放/出现地点是否需要调整 | 更新道具与场景的关系 |
| **世界观一致性** | 道具设定是否与力量体系、科技水平矛盾 | 提醒用户审查世界观设定 |

#### 5.2 汇报格式

操作完成后，向用户简明扼要地汇报：

1. **已完成的操作**：道具创建/修改/删除 + 关系图谱变更
2. **潜在影响**：列出可能受影响的维度
3. **建议后续操作**：如果需要额外处理，给出具体建议

---

### 六、工具速查

| 工具名 | 用途 | 关键参数 |
|--------|------|---------|
| `get_prop_schema` | 获取道具 JSON Schema | 无参数 |
| `list_props` | 列出所有道具 | `keyword?`, `limit?` |
| `get_prop_detail` | 获取道具详情 | `propName` 或 `propId` |
| `search_props` | 搜索道具 | `keyword` |
| `create_prop` | 创建道具 | `name`, `properties?` |
| `update_prop` | 修改道具 | `propName`/`propId`, `properties` |
| `delete_prop` | 删除道具 | `propName` 或 `propId` |
| `query_character_relations` | 查询实体关系（支持所有类型） | `characterName?`（传入道具名）, `relationType?` |
| `create_relation` | 创建关系 | `fromName`, `toName`, `relationType`, `description?`, `fromCategory?`, `toCategory?` |
| `update_relation` | 更新关系 | `relationId` 或 `fromName`+`toName`+`relationType` |
| `delete_relation` | 删除关系 | `relationId` 或 `fromName`+`toName`+`relationType` |
| `get_plot_overview` | 获取剧情概览 | 无参数 |
| `get_story_line_events` | 获取故事线事件 | `storyLineName` |
| `search_across_chapters` | 搜索章节内容 | `keyword` |
| `get_setting_detail` | 获取世界设定 | `settingName` 或 `settingId` |
| `list_characters` | 列出所有角色 | `keyword?`, `limit?` |
| `list_scenes` | 列出所有场景 | `keyword?`, `limit?` |
| `list_organizations` | 列出所有组织 | `keyword?`, `limit?` |',

  '## Prop Operations Skill

This skill guides you through creating, modifying, and deleting props, ensuring that prop data remains consistent with the novel''s character ownership, scene distribution, and plot threads.

---

### Core Principles

1. **Research before action**: Gather sufficient context before any prop operation
2. **Schema-driven**: Prop attributes must strictly follow the current project''s JSON Schema definition
3. **Relationship synchronization**: Prop changes must synchronize relationships in the knowledge graph (prop-character, prop-scene, prop-organization, etc.)
4. **Impact assessment**: After each operation, assess cascading effects on plot threads, character abilities, and foreshadowing

---

### I. Pre-Operation: Information Gathering Phase

Before executing any prop operation, gather necessary information based on the operation type:

#### 1.1 Required Tool Calls

| Operation | Required Call | Description |
|-----------|--------------|-------------|
| **Create prop** | `get_prop_schema` | Retrieve the prop JSON Schema to understand required and optional fields |
| **Create prop** | `list_props` | Review existing props to avoid duplicate names or overlapping functionality |
| **Modify prop** | `get_prop_detail` | Retrieve the prop''s current complete data |
| **Delete prop** | `get_prop_detail` | Confirm prop information |
| **Delete prop** | `query_character_relations` | Review all relationships involving the prop (this tool supports querying all entity types) |

#### 1.2 Context Gathering (As Needed)

Depending on the complexity of the operation, selectively call the following tools to supplement context:

- `get_setting_detail`: Review world-building settings to ensure the prop aligns with the world (e.g., power systems, technology level)
- `get_plot_overview`: Understand the main plot and key events to determine the prop''s narrative function
- `get_story_line_events`: Review specific storyline events to understand the prop''s involvement in the plot
- `list_characters`: Browse the character list to identify which characters might possess or use the prop
- `list_scenes`: Browse the scene list to identify where the prop might be stored or appear
- `list_props`: Browse existing props to evaluate the completeness and balance of the prop system
- `search_across_chapters`: Search for the prop''s appearances in the manuscript text

**Decision criteria**:
- Simple operations (e.g., modifying a prop''s descriptive attribute): Research can be minimal
- Complex operations (e.g., creating a key plot prop, deleting a core clue prop): Thorough research is mandatory

---

### II. Creating Props

#### 2.1 Workflow

```
get_prop_schema -> gather context -> design prop attributes -> create_prop -> create relationships
```

#### 2.2 Steps

**Step 1**: Call `get_prop_schema` to retrieve the Schema definition

- Confirm all `required` fields
- Understand each field''s `type`, `enum` constraints, and `title` meaning

**Step 2**: Gather context

- Call `list_props` to understand the existing prop system
- Call `get_setting_detail` to review world-building settings and ensure the prop fits the world
- Call `get_plot_overview` to understand plot requirements and determine the prop''s narrative function
- If needed, review related character and scene information

**Step 3**: Construct prop data

- `name` parameter: Prop name (must not duplicate existing props)
- `properties` parameter: Build a JSON object strictly following the Schema definition
- All `required` fields must be populated
- `enum` type fields can only use predefined option values
- Nested `object` or `array` type fields must recursively follow sub-Schemas

**Step 4**: Call `create_prop` to create the prop

**Step 5**: Create prop relationships

Analyze the relationships that should exist between the new prop and other entities, and call `create_relation` for each:

**Prop <-> Character** (ownership/usage relationships):
- Use `fromCategory: "prop"`, `toCategory: "character"` (or reversed)

**Prop <-> Scene** (storage/appearance relationships):
- Use `fromCategory: "prop"`, `toCategory: "scene"` (or reversed)

**Prop <-> Organization** (affiliation relationships):
- Use `fromCategory: "prop"`, `toCategory: "organization"` (or reversed)

**Prop <-> Prop** (association relationships):
- Use `fromCategory: "prop"`, `toCategory: "prop"`

**Common parameters**:
- `fromName`: Source entity name of the relationship
- `toName`: Target entity name of the relationship
- `relationType`: Relationship type
- `description`: Specific description of the relationship
- `strength`: Relationship strength (1-5, optional)

#### 2.3 Important Notes

- If the user provides insufficient information to fill required fields, **proactively ask** the user for additional details
- Prop ability settings should consider balance with the world''s power system
- Relationship descriptions should be specific, detailing how the prop is held, how it was obtained, storage conditions, etc.

---

### III. Modifying Props

#### 3.1 Workflow

```
get_prop_detail -> gather context -> update_prop -> assess relationship impact -> update relationships
```

#### 3.2 Steps

**Step 1**: Call `get_prop_detail` to retrieve the prop''s current data

**Step 2**: Assess the scope of modifications

- If the modification involves core prop attributes (abilities, ownership, status, etc.), additional research is needed:
  - `query_character_relations`: Review all relationships involving the prop (pass the prop name as the `characterName` parameter)
  - `search_across_chapters`: Search for the prop''s descriptions in the manuscript text
  - `get_setting_detail`: Verify the modification still conforms to the world-building

**Step 3**: Call `update_prop`

- `properties` only needs to contain the fields being modified (incremental update; the system auto-merges)
- Modified values must still comply with Schema constraints

**Step 4**: Synchronize the knowledge graph

- If ownership, abilities, or status were modified, check whether existing relationships need adjustment
- For relationships that need changes, call `update_relation` or `delete_relation` + `create_relation`

#### 3.3 Typical Modification Scenarios

| Modification | Relationship Impact | Handling Approach |
|-------------|-------------------|-------------------|
| Surface attributes like appearance description | Usually no impact | Directly call `update_prop` |
| Owner change | Affects prop-character relationships | Delete old ownership relationship, create new one |
| Storage location change | Affects prop-scene relationships | Update prop-scene relationship |
| Ability/effect change | Affects owning character''s power balance | Check whether inter-character power relationships need adjustment |
| Prop destruction/consumption | Affects all relationships linked to the prop | Comprehensive review: owner loses ability bonuses, check if related foreshadowing needs adjustment |
| Affiliated organization change | Affects prop-organization relationships | Update organization affiliation relationship |

---

### IV. Deleting Props

#### 4.1 Workflow

```
get_prop_detail -> query_character_relations -> assess impact -> clean up relationships -> delete_prop
```

#### 4.2 Steps

**Step 1**: Call `get_prop_detail` to confirm prop information

**Step 2**: Call `query_character_relations` to retrieve all relationships involving the prop (pass the prop name as the `characterName` parameter)

**Step 3**: Impact assessment (must inform the user before deletion)

- How many relationship connections the prop has (owning characters, storage scenes, affiliated organizations)
- Which chapters the prop appears in (`search_across_chapters`)
- Whether the prop participates in key plot events or foreshadowing (`get_plot_overview`)
- Which characters depend on the prop''s abilities
- Impact on plot threads after deletion

**Step 4**: Clean up the knowledge graph

- Call `delete_relation` for each of the prop''s relationships to remove them
- If the prop is the source of a character''s abilities, consider whether the character needs corresponding adjustments

**Step 5**: Call `delete_prop` to delete the prop

#### 4.3 Warnings

- Deletion is irreversible
- Deletion of key props (core plot props, foreshadowing clue props) must be thoroughly confirmed with the user

---

### V. Post-Operation: Impact Assessment Phase

After each prop operation, assess cascading effects across the following dimensions and report to the user:

#### 5.1 Assessment Checklist

| Dimension | Assessment Content | Possible Actions Needed |
|-----------|-------------------|------------------------|
| **Ownership relationships** | Impact of prop ownership changes on characters | `create_relation` / `update_relation` / `delete_relation` |
| **Character abilities** | Whether prop changes affect the owning character''s ability performance | Remind user to adjust character-related settings |
| **Plot threads** | Whether the prop carries plot threads or drives the storyline | Remind user to review related plot design |
| **Foreshadowing** | Whether foreshadowing related to the prop is affected | Remind user to review foreshadowing design |
| **Scene distribution** | Whether the prop''s storage/appearance locations need adjustment | Update prop-scene relationships |
| **World-building consistency** | Whether the prop''s settings conflict with the power system or technology level | Remind user to review world-building settings |

#### 5.2 Report Format

After the operation is complete, provide a concise report to the user:

1. **Completed operations**: Prop creation/modification/deletion + knowledge graph changes
2. **Potential impact**: List dimensions that may be affected
3. **Recommended follow-up actions**: If additional handling is needed, provide specific suggestions

---

### VI. Tool Quick Reference

| Tool Name | Purpose | Key Parameters |
|-----------|---------|---------------|
| `get_prop_schema` | Retrieve prop JSON Schema | No parameters |
| `list_props` | List all props | `keyword?`, `limit?` |
| `get_prop_detail` | Get prop details | `propName` or `propId` |
| `search_props` | Search props | `keyword` |
| `create_prop` | Create a prop | `name`, `properties?` |
| `update_prop` | Modify a prop | `propName`/`propId`, `properties` |
| `delete_prop` | Delete a prop | `propName` or `propId` |
| `query_character_relations` | Query entity relationships (supports all types) | `characterName?` (pass prop name), `relationType?` |
| `create_relation` | Create a relationship | `fromName`, `toName`, `relationType`, `description?`, `fromCategory?`, `toCategory?` |
| `update_relation` | Update a relationship | `relationId` or `fromName`+`toName`+`relationType` |
| `delete_relation` | Delete a relationship | `relationId` or `fromName`+`toName`+`relationType` |
| `get_plot_overview` | Get plot overview | No parameters |
| `get_story_line_events` | Get storyline events | `storyLineName` |
| `search_across_chapters` | Search chapter content | `keyword` |
| `get_setting_detail` | Get world-building settings | `settingName` or `settingId` |
| `list_characters` | List all characters | `keyword?`, `limit?` |
| `list_scenes` | List all scenes | `keyword?`, `limit?` |
| `list_organizations` | List all organizations | `keyword?`, `limit?` |',

  NULL,
  1,
  3,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  updated_at = NOW();
