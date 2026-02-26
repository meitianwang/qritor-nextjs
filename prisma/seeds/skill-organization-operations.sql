-- 全局组织操作 Skill / Global Organization Operations Skill
-- novel_creation_method_id = NULL 表示全局可用 / NULL means globally available
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-organization-operations.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'organization-operations',
  '组织全生命周期管理：创建、修改、删除组织，同步维护关系图谱，确保与势力格局、角色归属、场景据点保持一致',
  'Full lifecycle management of organizations: create, modify, and delete organizations while synchronizing relationship graphs to ensure consistency with power dynamics, character affiliations, and scene strongholds',
  '## 组织操作技能

本技能指导你完成组织的创建、修改、删除操作，并确保组织数据与小说的势力格局、角色归属和场景据点保持一致。

---

### 核心原则

1. **禁止向用户提问**：禁止询问偏好、想法、选择。禁止在调用工具之前征求意见。信息不足时自行做出合理决策。用户通过系统确认 UI 审批
2. **Schema 驱动**：组织属性必须严格遵循当前项目的 JSON Schema 定义
3. **关系同步**：组织变动必须同步维护知识图谱中的关系（组织与角色、组织与场景、组织与组织等）
4. **影响评估**：操作完成后评估对势力格局、角色归属、剧情冲突的连锁影响

---

### 一、操作前：信息收集阶段

在执行任何组织操作之前，根据操作类型收集必要信息：

#### 1.1 必须调用的工具

| 操作 | 必须调用 | 说明 |
|------|---------|------|
| **创建组织** | `get_organization_schema` | 获取组织 JSON Schema，了解必填字段和可选字段 |
| **创建组织** | `list_organizations` | 查看已有组织，避免重名或定位冲突 |
| **修改组织** | `get_organization_detail` | 获取组织当前完整数据 |
| **删除组织** | `get_organization_detail` | 确认组织信息 |
| **删除组织** | `query_character_relations` | 查看与该组织相关的所有关系（该工具支持查询所有实体类型） |

#### 1.2 上下文收集（按需）

根据操作的复杂度，选择性调用以下工具补充上下文：

- `list_settings`：获取所有设定模块内容（世界观、核心设定等），作为创意决策的基础
- `get_setting_detail`：查看特定设定的详细内容
- `get_plot_overview`：了解主线剧情和关键事件，判断组织在故事冲突中的定位
- `get_story_line_events`：查看具体故事线的事件，了解组织参与的情节
- `list_characters`：浏览角色列表，了解哪些角色隶属或关联该组织
- `list_scenes`：浏览场景列表，了解组织的据点和势力范围
- `list_organizations`：浏览已有组织阵容，评估势力格局平衡
- `search_across_chapters`：搜索组织在正文中的出现情况

**判断标准**：
- 简单操作（如修改组织的某个描述属性）：调研可精简
- 复杂操作（如创建核心势力、删除关键组织）：必须充分调研

#### 1.3 领域知识注入

在可用技能列表中查找：名称含 `-org-gen` 的专属组织生成技能。如有，调用 `use_skill` 加载，获取该小说类型下的领域知识指导。

领域知识在各操作中的作用：
- **创建**：指导组织属性的生成，确保符合该小说类型的惯例和风格
- **修改**：指导属性值的调整，确保修改后的内容与小说类型风格一致
- **删除**：辅助影响评估，帮助判断删除后对势力格局和角色归属的影响

---

### 二、创建组织

#### 2.1 流程

```
get_organization_schema → 收集上下文 → 设计组织属性 → create_organization → 创建关系
```

#### 2.2 步骤

**Step 1**：调用 `get_organization_schema` 获取 Schema 定义

- 确认所有 `required` 字段
- 了解每个字段的 `type`、`enum` 约束、`title` 含义

**Step 2**：收集上下文

- 调用 `list_settings` 获取所有设定模块内容（世界观、核心设定等）
- 调用 `list_organizations` 了解已有组织和势力分布
- 如有需要，调用 `get_plot_overview` 理解剧情冲突结构，查看相关角色和场景信息

**Step 3**：分析 Schema 字段并生成组织数据

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
- `name` 参数：组织名称（不可与已有组织重复）
- `properties` 参数：包含所有需要生成的字段的 JSON 对象

**Step 4**：调用 `create_organization` 创建组织

**Step 5**：创建组织关系

分析新组织与其他实体之间应该存在的关系，对每条关系调用 `create_relation`：

**组织 ↔ 角色**（成员关系）：
- 用 `categoryA: "organization"`, `categoryB: "character"`（或反向）

**组织 ↔ 场景**（据点关系）：
- 用 `categoryA: "organization"`, `categoryB: "scene"`（或反向）

**组织 ↔ 组织**（势力关系）：
- 用 `categoryA: "organization"`, `categoryB: "organization"`

**通用参数**：
- `nameA`：实体 A 名称
- `nameB`：实体 B 名称
- `relation`：关系描述（自由文本）
- `description`：关系的具体描述
- `strength`：关系强度（1-5，可选）

**立即调用工具，不要先用文字描述计划。**

#### 2.3 注意事项

- 信息不足时自行做出合理的创意决策，不要向用户提问
- 新组织的势力定位要考虑与已有组织的平衡和冲突张力
- 关系描述要具体，说明隶属性质、合作方式、敌对原因等

---

### 三、修改组织

#### 3.1 流程

```
get_organization_detail → 收集上下文 → update_organization → 评估关系影响 → 更新关系
```

#### 3.2 步骤

**Step 1**：调用 `get_organization_detail` 获取组织当前数据

**Step 2**：评估修改范围

- 如果修改涉及组织的核心属性（宗旨、阵营、领导层、势力范围等），需要额外调研：
  - `query_character_relations`：查看与该组织相关的所有关系（传入组织名称作为 `characterName` 参数）
  - `search_across_chapters`：搜索组织在正文中的描写
  - `get_setting_detail`：检查修改后是否仍符合世界观

**Step 3**：调用 `update_organization`

- `properties` 只需传入要修改的字段（增量更新，系统自动合并）
- 修改后的值仍必须符合 Schema 约束

**Step 4**：同步更新关系图谱

- 如果修改了组织的阵营、宗旨或势力范围等，检查现有关系是否需要调整
- 对需要变更的关系调用 `update_relation` 或 `delete_relation` + `create_relation`

#### 3.3 典型修改场景

| 修改内容 | 关系影响 | 处理方式 |
|---------|---------|---------|
| 名称、口号等表面属性 | 通常无影响 | 直接 `update_organization` |
| 宗旨、目标变化 | 可能影响与其他组织的关系 | 检查同盟/敌对关系是否需要调整 |
| 阵营、立场变化 | 可能颠覆多条势力关系 | 全面审查：同盟→敌对、附庸→独立等 |
| 领导层变更 | 影响角色与组织的关系 | 更新领袖/成员关系，原领袖可能降级或离开 |
| 势力范围扩张/收缩 | 影响据点和场景关系 | 新增/移除场景据点关系 |
| 组织分裂/合并 | 大规模关系重构 | 创建新组织 + 重新分配成员和据点关系 |

---

### 四、删除组织

#### 4.1 流程

```
get_organization_detail → query_character_relations → 评估影响 → 清理关系 → delete_organization
```

#### 4.2 步骤

**Step 1**：调用 `get_organization_detail` 确认组织信息

**Step 2**：调用 `query_character_relations` 获取与该组织相关的所有关系（传入组织名称作为 `characterName` 参数）

**Step 3**：影响评估（删除前必须告知用户）

- 该组织涉及多少条关系连接（成员角色、据点场景、势力关系）
- 该组织在哪些章节中出现（`search_across_chapters`）
- 该组织是否参与关键剧情冲突（`get_plot_overview`）
- 哪些角色隶属于该组织，删除后这些角色的归属如何处理
- 哪些场景是该组织的据点，删除后这些场景的归属如何处理
- 与其他组织的势力平衡是否被打破

**Step 4**：清理关系图谱

- 对该组织的每条关系调用 `delete_relation` 清除
- 如果组织 A 被删除后，原属于 A 的角色失去组织归属，考虑是否需要转移到其他组织
- 据点场景可能需要标记为"无主"或转移给其他组织

**Step 5**：调用 `delete_organization` 删除组织

#### 4.3 警告

- 删除操作不可逆
- 核心组织（主线势力、主角所属组织）的删除需在影响评估中重点标注风险

---

### 五、操作后：影响评估阶段

每次组织操作完成后，评估以下维度的连锁影响并汇报给用户：

#### 5.1 评估清单

| 维度 | 评估内容 | 可能需要的操作 |
|------|---------|--------------|
| **势力格局** | 组织变动是否打破现有势力平衡 | 提醒用户审视整体势力分布 |
| **角色归属** | 组织成员的去留和归属变化 | `create_relation` / `update_relation` / `delete_relation` |
| **据点场景** | 组织据点的归属和控制权变化 | 更新场景与组织的关系 |
| **剧情冲突** | 组织变动对核心冲突的影响 | 提醒用户调整冲突设计 |
| **伏笔线索** | 与该组织相关的伏笔是否受影响 | 提醒用户检查伏笔设计 |
| **世界观一致性** | 组织变动是否导致设定矛盾 | 提醒用户审查世界观设定 |

#### 5.2 汇报格式

操作完成后，向用户简明扼要地汇报：

1. **已完成的操作**：组织创建/修改/删除 + 关系图谱变更
2. **潜在影响**：列出可能受影响的维度
3. **建议后续操作**：如果需要额外处理，给出具体建议

---

### 六、工具速查

| 工具名 | 用途 | 关键参数 |
|--------|------|---------|
| `get_organization_schema` | 获取组织 JSON Schema | 无参数 |
| `list_organizations` | 列出所有组织 | `keyword?`, `limit?` |
| `get_organization_detail` | 获取组织详情 | `organizationName` 或 `organizationId` |
| `search_organizations` | 搜索组织 | `keyword` |
| `create_organization` | 创建组织 | `name`, `properties?` |
| `update_organization` | 修改组织 | `organizationName`/`organizationId`, `properties` |
| `delete_organization` | 删除组织 | `organizationName` 或 `organizationId` |
| `query_character_relations` | 查询实体关系（支持所有类型） | `characterName?`（传入组织名）, `relation?` |
| `create_relation` | 创建关系 | `nameA`, `nameB`, `relation`, `color`, `categoryA?`, `categoryB?` |
| `update_relation` | 更新关系 | `relationId` 或 `nameA`+`nameB`+`relation` |
| `delete_relation` | 删除关系 | `relationId` 或 `nameA`+`nameB`+`relation` |
| `get_plot_overview` | 获取剧情概览 | 无参数 |
| `get_story_line_events` | 获取故事线事件 | `storyLineName` |
| `search_across_chapters` | 搜索章节内容 | `keyword` |
| `get_setting_detail` | 获取世界设定 | `settingName` 或 `settingId` |
| `list_characters` | 列出所有角色 | `keyword?`, `limit?` |
| `list_scenes` | 列出所有场景 | `keyword?`, `limit?` |',
  '## Organization Operations Skill

This skill guides you through creating, modifying, and deleting organizations, ensuring that organization data remains consistent with the novel''s power dynamics, character affiliations, and scene strongholds.

---

### Core Principles

1. **NEVER ask the user any questions**: Do not ask for preferences, ideas, or choices. Do not seek input before calling tools. When information is insufficient, make reasonable decisions on your own. Users review via the system confirmation UI
2. **Schema-driven**: Organization properties must strictly follow the current project''s JSON Schema definition
3. **Relationship synchronization**: Organization changes must synchronize relationships in the knowledge graph (organization-character, organization-scene, organization-organization, etc.)
4. **Impact assessment**: After completing an operation, assess cascading effects on power dynamics, character affiliations, and plot conflicts

---

### I. Pre-Operation: Information Gathering Phase

Before executing any organization operation, gather necessary information based on the operation type:

#### 1.1 Required Tool Calls

| Operation | Required Call | Description |
|-----------|--------------|-------------|
| **Create organization** | `get_organization_schema` | Get the organization JSON Schema to understand required and optional fields |
| **Create organization** | `list_organizations` | View existing organizations to avoid name duplication or positioning conflicts |
| **Modify organization** | `get_organization_detail` | Get the organization''s current complete data |
| **Delete organization** | `get_organization_detail` | Confirm organization information |
| **Delete organization** | `query_character_relations` | View all relationships related to the organization (this tool supports querying all entity types) |

#### 1.2 Context Gathering (As Needed)

Based on the operation''s complexity, selectively call the following tools to supplement context:

- `list_settings`: Retrieve all setting module contents (worldview, core settings, etc.) as the foundation for creative decisions
- `get_setting_detail`: View specific setting details
- `get_plot_overview`: Understand the main plot and key events to determine the organization''s role in story conflicts
- `get_story_line_events`: View specific storyline events to understand the organization''s involvement in the plot
- `list_characters`: Browse the character list to see which characters belong to or are associated with the organization
- `list_scenes`: Browse the scene list to understand the organization''s strongholds and sphere of influence
- `list_organizations`: Browse the existing organization roster to assess power balance
- `search_across_chapters`: Search for the organization''s appearances in the text

**Decision criteria**:
- Simple operations (e.g., modifying a descriptive attribute of an organization): Research can be streamlined
- Complex operations (e.g., creating a core faction, deleting a key organization): Thorough research is required

#### 1.3 Domain Knowledge Injection

Search the available skills list for one whose name contains `-org-gen`. If found, call `use_skill` to load it and obtain domain knowledge guidance for the specific novel type.

How domain knowledge applies across operations:
- **Create**: Guides organization attribute generation to ensure compliance with the novel type''s conventions and style
- **Modify**: Guides attribute value adjustments to ensure modified content remains consistent with the novel type''s style
- **Delete**: Assists impact assessment, helping evaluate the effect of deletion on the power dynamics and character affiliations

---

### II. Creating an Organization

#### 2.1 Workflow

```
get_organization_schema -> gather context -> design organization attributes -> create_organization -> create relationships
```

#### 2.2 Steps

**Step 1**: Call `get_organization_schema` to get the Schema definition

- Confirm all `required` fields
- Understand each field''s `type`, `enum` constraints, and `title` meaning

**Step 2**: Gather context

- Call `list_settings` to retrieve all setting module contents (worldview, core settings, etc.)
- Call `list_organizations` to understand existing organizations and power distribution
- If needed, call `get_plot_overview` to understand the conflict structure, and review related character and scene information

**Step 3**: Analyze Schema fields and generate organization data

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
- `name` parameter: Organization name (must not duplicate existing organizations)
- `properties` parameter: A JSON object containing all fields to be generated

**Step 4**: Call `create_organization` to create the organization

**Step 5**: Create organization relationships

Analyze the relationships that should exist between the new organization and other entities, and call `create_relation` for each relationship:

**Organization <-> Character** (membership relationships):
- Use `categoryA: "organization"`, `categoryB: "character"` (or reverse)

**Organization <-> Scene** (stronghold relationships):
- Use `categoryA: "organization"`, `categoryB: "scene"` (or reverse)

**Organization <-> Organization** (power relationships):
- Use `categoryA: "organization"`, `categoryB: "organization"`

**Common parameters**:
- `nameA`: Name of entity A
- `nameB`: Name of entity B
- `relation`: Relationship description (free-form text)
- `description`: Specific description of the relationship
- `strength`: Relationship strength (1-5, optional)

**Call tools immediately. Do not describe your plan in text first.**

#### 2.3 Notes

- When information is insufficient, make reasonable creative decisions on your own — never ask the user
- The new organization''s power positioning should consider balance and conflict tension with existing organizations
- Relationship descriptions should be specific, explaining the nature of affiliation, cooperation methods, reasons for hostility, etc.

---

### III. Modifying an Organization

#### 3.1 Workflow

```
get_organization_detail -> gather context -> update_organization -> assess relationship impact -> update relationships
```

#### 3.2 Steps

**Step 1**: Call `get_organization_detail` to get the organization''s current data

**Step 2**: Assess the scope of modifications

- If the modification involves core organization attributes (mission, faction, leadership, sphere of influence, etc.), additional research is needed:
  - `query_character_relations`: View all relationships related to the organization (pass the organization name as the `characterName` parameter)
  - `search_across_chapters`: Search for the organization''s descriptions in the text
  - `get_setting_detail`: Check whether the modification still aligns with the world setting

**Step 3**: Call `update_organization`

- `properties` only needs to contain the fields being modified (incremental update, the system auto-merges)
- Modified values must still comply with Schema constraints

**Step 4**: Synchronize relationship graph updates

- If the organization''s faction, mission, or sphere of influence was modified, check whether existing relationships need adjustment
- Call `update_relation` or `delete_relation` + `create_relation` for relationships that need changes

#### 3.3 Typical Modification Scenarios

| Modification | Relationship Impact | Handling Approach |
|-------------|-------------------|------------------|
| Name, slogan, and other surface attributes | Usually no impact | Directly `update_organization` |
| Mission or objective changes | May affect relationships with other organizations | Check whether alliance/hostile relationships need adjustment |
| Faction or stance changes | May overturn multiple power relationships | Full review: alliance->hostile, vassal->independent, etc. |
| Leadership changes | Affects character-organization relationships | Update leader/member relationships; former leader may be demoted or leave |
| Sphere of influence expansion/contraction | Affects stronghold and scene relationships | Add/remove scene stronghold relationships |
| Organization split/merger | Large-scale relationship restructuring | Create new organization + reassign member and stronghold relationships |

---

### IV. Deleting an Organization

#### 4.1 Workflow

```
get_organization_detail -> query_character_relations -> assess impact -> clean up relationships -> delete_organization
```

#### 4.2 Steps

**Step 1**: Call `get_organization_detail` to confirm organization information

**Step 2**: Call `query_character_relations` to get all relationships related to the organization (pass the organization name as the `characterName` parameter)

**Step 3**: Impact assessment (must inform the user before deletion)

- How many relationship connections the organization has (member characters, stronghold scenes, power relationships)
- Which chapters the organization appears in (`search_across_chapters`)
- Whether the organization participates in key plot conflicts (`get_plot_overview`)
- Which characters belong to the organization, and how their affiliation should be handled after deletion
- Which scenes are the organization''s strongholds, and how their ownership should be handled after deletion
- Whether the power balance with other organizations will be disrupted

**Step 4**: Clean up the relationship graph

- Call `delete_relation` for each of the organization''s relationships to remove them
- If organization A is deleted and characters formerly belonging to A lose their organizational affiliation, consider whether they need to be transferred to another organization
- Stronghold scenes may need to be marked as "unoccupied" or transferred to another organization

**Step 5**: Call `delete_organization` to delete the organization

#### 4.3 Warnings

- Deletion is irreversible
- Deletion of core organizations (main factions, protagonist''s organization) requires highlighting risks in the impact assessment

---

### V. Post-Operation: Impact Assessment Phase

After each organization operation, assess the cascading effects across the following dimensions and report to the user:

#### 5.1 Assessment Checklist

| Dimension | Assessment Content | Possible Actions Needed |
|-----------|-------------------|------------------------|
| **Power dynamics** | Whether the organization change disrupts the current power balance | Remind user to review overall power distribution |
| **Character affiliations** | Changes in organization member retention and affiliation | `create_relation` / `update_relation` / `delete_relation` |
| **Stronghold scenes** | Changes in organization stronghold ownership and control | Update scene-organization relationships |
| **Plot conflicts** | Impact of organization changes on core conflicts | Remind user to adjust conflict design |
| **Foreshadowing and clues** | Whether foreshadowing related to the organization is affected | Remind user to review foreshadowing design |
| **World-building consistency** | Whether organization changes cause setting contradictions | Remind user to review world-building settings |

#### 5.2 Report Format

After completing the operation, report concisely to the user:

1. **Completed operations**: Organization creation/modification/deletion + relationship graph changes
2. **Potential impact**: List dimensions that may be affected
3. **Recommended follow-up actions**: If additional processing is needed, provide specific suggestions

---

### VI. Tool Quick Reference

| Tool Name | Purpose | Key Parameters |
|-----------|---------|---------------|
| `get_organization_schema` | Get organization JSON Schema | No parameters |
| `list_organizations` | List all organizations | `keyword?`, `limit?` |
| `get_organization_detail` | Get organization details | `organizationName` or `organizationId` |
| `search_organizations` | Search organizations | `keyword` |
| `create_organization` | Create organization | `name`, `properties?` |
| `update_organization` | Modify organization | `organizationName`/`organizationId`, `properties` |
| `delete_organization` | Delete organization | `organizationName` or `organizationId` |
| `query_character_relations` | Query entity relationships (supports all types) | `characterName?` (pass organization name), `relation?` |
| `create_relation` | Create relationship | `nameA`, `nameB`, `relation`, `color`, `categoryA?`, `categoryB?` |
| `update_relation` | Update relationship | `relationId` or `nameA`+`nameB`+`relation` |
| `delete_relation` | Delete relationship | `relationId` or `nameA`+`nameB`+`relation` |
| `get_plot_overview` | Get plot overview | No parameters |
| `get_story_line_events` | Get storyline events | `storyLineName` |
| `search_across_chapters` | Search chapter content | `keyword` |
| `get_setting_detail` | Get world setting | `settingName` or `settingId` |
| `list_characters` | List all characters | `keyword?`, `limit?` |
| `list_scenes` | List all scenes | `keyword?`, `limit?` |',
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
