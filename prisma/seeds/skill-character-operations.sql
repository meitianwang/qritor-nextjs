-- 全局角色操作 Skill / Global Character Operations Skill
-- novel_creation_method_id = NULL 表示全局可用 / NULL means globally available
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-character-operations.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'character-operations',
  '角色全生命周期管理：创建、修改、删除角色，同步维护关系图谱，确保与小说设定、剧情、事件保持一致',
  'Full lifecycle character management: create, edit, and delete characters, synchronize relationship graphs, and ensure consistency with novel settings, plot, and events',
  '## 角色操作技能

本技能指导你完成角色的创建、修改、删除操作，并确保角色数据与小说整体设定保持一致。

---

### 核心原则

1. **禁止向用户提问**：禁止询问偏好、想法、选择。禁止在调用工具之前征求意见。信息不足时自行做出合理决策。用户通过系统确认 UI 审批
2. **Schema 驱动**：角色属性必须严格遵循当前项目的 JSON Schema 定义
3. **关系同步**：角色变动必须同步维护知识图谱中的关系
4. **影响评估**：操作完成后评估对小说其他要素的连锁影响

---

### 一、操作前：信息收集阶段

在执行任何角色操作之前，根据操作类型收集必要信息：

#### 1.1 必须调用的工具

| 场景 | 必须调用 | 说明 |
|------|---------|------|
| **创建角色** | `get_character_schema` | 获取角色 JSON Schema，了解必填字段和可选字段 |
| **创建角色** | `list_characters` | 查看已有角色，避免重名或定位冲突 |
| **修改角色** | `get_character_detail` | 获取角色当前完整数据 |
| **删除角色** | `get_character_detail` | 确认角色身份 |
| **删除角色** | `query_character_relations` | 查看该角色的所有关系 |

#### 1.2 上下文收集（按需）

根据操作的复杂度，选择性调用以下工具补充上下文：

- `list_settings`：获取所有设定模块内容（世界观、核心设定等），作为创意决策的基础
- `get_plot_overview`：了解主线剧情和关键事件，判断角色在故事中的定位
- `get_story_line_events`：查看具体故事线的事件，了解角色参与的情节
- `query_character_relations`：查看与目标角色相关的所有关系
- `query_character_dynamic_info`：查看角色在各章节中的状态变化轨迹
- `list_characters`：浏览现有角色阵容，评估新角色的差异化定位
- `search_across_chapters`：搜索角色在正文中的出场情况
- `get_setting_detail`：查看特定设定的详细内容

**判断标准**：
- 简单操作（如修改角色的某个属性值）：调研可精简
- 复杂操作（如创建核心角色、删除关键角色）：必须充分调研

#### 1.3 领域知识注入

在可用技能列表中查找：名称含 `-character-gen` 的专属角色生成技能。如有，调用 `use_skill` 加载，获取该小说类型下的领域知识指导。

领域知识在各操作中的作用：
- **创建**：指导角色属性的生成，确保符合该小说类型的惯例和风格
- **修改**：指导属性值的调整，确保修改后的内容与小说类型风格一致
- **删除**：辅助影响评估，帮助判断删除后对角色体系的影响

---

### 二、创建角色

#### 2.1 流程

```
get_character_schema → 收集上下文 → 设计角色属性 → create_character → 创建关系
```

#### 2.2 步骤

**Step 1**：调用 `get_character_schema` 获取 Schema 定义

- 确认所有 `required` 字段
- 了解每个字段的 `type`、`enum` 约束、`title` 含义

**Step 2**：收集上下文

- 调用 `list_settings` 获取所有设定模块内容（世界观、核心设定等）
- 调用 `list_characters` 了解现有角色阵容
- 如有需要，调用 `get_plot_overview` 理解剧情走向

**Step 3**：分析 Schema 字段并生成角色数据

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
- `name` 参数：角色名称（不可与已有角色重复）
- `properties` 参数：包含所有需要生成的字段的 JSON 对象

**Step 4**：调用 `create_character` 创建角色

**Step 5**：创建角色关系

- 分析新角色与现有角色之间应该存在的关系
- 对每对关系调用 `create_relation`，设置：
  - `nameA`：实体 A 名称
  - `nameB`：实体 B 名称
  - `relation`：关系描述（自由文本）
  - `description`：关系的具体描述
  - `strength`：关系强度（1-5，可选）

**立即调用工具，不要先用文字描述计划。**

#### 2.3 注意事项

- 信息不足时自行做出合理的创意决策，不要向用户提问
- 角色定位要与现有角色差异化，避免功能性重复
- 关系描述要具体，不要泛泛而谈

---

### 三、修改角色

#### 3.1 流程

```
get_character_detail → 收集上下文 → update_character → 评估关系影响 → 更新关系
```

#### 3.2 步骤

**Step 1**：调用 `get_character_detail` 获取角色当前数据

**Step 2**：评估修改范围

- 如果修改涉及角色的核心属性（身份、阵营、能力等），需要额外调研：
  - `query_character_relations`：查看受影响的关系
  - `query_character_dynamic_info`：查看角色状态变化轨迹
  - `search_across_chapters`：搜索角色在正文中的表现

**Step 3**：调用 `update_character`

- `properties` 只需传入要修改的字段（增量更新，系统自动合并）
- 修改后的值仍必须符合 Schema 约束

**Step 4**：同步更新关系图谱

- 如果修改了角色的阵营、身份或立场等，检查现有关系是否需要调整
- 对需要变更的关系调用 `update_relation` 或 `delete_relation` + `create_relation`

#### 3.3 典型修改场景

| 修改内容 | 关系影响 | 处理方式 |
|---------|---------|---------|
| 外貌、年龄等外在属性 | 通常无影响 | 直接 `update_character` |
| 性格、动机等内在属性 | 可能影响关系描述 | 检查并更新相关 relation 的 description |
| 阵营、立场变化 | 可能颠覆多条关系 | 全面审查并重建关系 |
| 身份、职业变化 | 影响社会关系 | 更新关系记录的 relation 文本 |
| 能力、实力变化 | 影响力量对比关系 | 更新关系 strength |

---

### 四、删除角色

#### 4.1 流程

```
get_character_detail → query_character_relations → 评估影响 → 清理关系 → delete_character
```

#### 4.2 步骤

**Step 1**：调用 `get_character_detail` 确认角色信息

**Step 2**：调用 `query_character_relations` 获取该角色的所有关系

**Step 3**：影响评估（删除前必须告知用户）

- 该角色涉及多少条关系连接
- 该角色在哪些章节中出场（`search_across_chapters`）
- 该角色是否参与关键剧情事件（`get_plot_overview`）
- 删除后对故事结构的潜在影响

**Step 4**：清理关系图谱

- 对该角色的每条关系调用 `delete_relation` 清除
- 如果角色 A 被删除后，角色 B 和角色 C 之间的关系也失去了连接中介，考虑是否需要补建直接关系

**Step 5**：调用 `delete_character` 删除角色

#### 4.3 警告

- 删除操作不可逆
- 关键角色（主角、核心配角）的删除需在影响评估中重点标注风险

---

### 五、操作后：影响评估阶段

每次角色操作完成后，评估以下维度的连锁影响并汇报给用户：

#### 5.1 评估清单

| 维度 | 评估内容 | 可能需要的操作 |
|------|---------|--------------|
| **角色关系** | 新建/断裂/变质的关系 | `create_relation` / `update_relation` / `delete_relation` |
| **剧情事件** | 角色变动对已有事件的影响 | 提醒用户调整事件描述 |
| **伏笔线索** | 与该角色相关的伏笔是否受影响 | 提醒用户检查伏笔设计 |
| **世界观设定** | 角色设定是否与世界观矛盾 | 提醒用户审查设定一致性 |
| **力量体系** | 角色能力是否破坏平衡 | 建议调整或补充限制 |
| **其他角色** | 与其关联的角色是否需要连带调整 | 建议具体的调整方向 |

#### 5.2 汇报格式

操作完成后，向用户简明扇要地汇报：

1. **已完成的操作**：角色创建/修改/删除 + 关系图谱变更
2. **潜在影响**：列出可能受影响的维度
3. **建议后续操作**：如果需要额外处理，给出具体建议

---

### 六、工具速查

| 工具名 | 用途 | 关键参数 |
|--------|------|---------|
| `get_character_schema` | 获取角色 JSON Schema | 无参数 |
| `list_characters` | 列出所有角色 | `keyword?`, `limit?` |
| `get_character_detail` | 获取角色详情 | `characterName` 或 `characterId` |
| `search_characters` | 搜索角色 | `keyword` |
| `create_character` | 创建角色 | `name`, `properties` |
| `update_character` | 修改角色 | `characterName`/`characterId`, `properties` |
| `delete_character` | 删除角色 | `characterName` 或 `characterId` |
| `query_character_relations` | 查询角色关系 | `characterName?`, `relation?` |
| `query_character_dynamic_info` | 查询角色动态状态 | `characterName` |
| `create_relation` | 创建关系 | `nameA`, `nameB`, `relation` |
| `update_relation` | 更新关系 | `relationId` 或 `nameA`+`nameB`+`relation` |
| `delete_relation` | 删除关系 | `relationId` 或 `nameA`+`nameB`+`relation` |
| `get_plot_overview` | 获取剧情概览 | 无参数 |
| `get_story_line_events` | 获取故事线事件 | `storyLineName` |
| `search_across_chapters` | 搜索章节内容 | `keyword` |
| `get_setting_detail` | 获取世界设定 | `settingName` 或 `settingId` |',
  '## Character Operations Skill

This skill guides you through character creation, modification, and deletion operations, ensuring character data remains consistent with the overall novel settings.

---

### Core Principles

1. **NEVER ask the user any questions**: NEVER ask for preferences, ideas, or choices. NEVER seek input before calling tools. When information is insufficient, make reasonable decisions on your own. Users review via system confirmation UI
2. **Schema-driven**: Character attributes must strictly follow the current project''s JSON Schema definition
3. **Relationship sync**: Character changes must synchronize relationship maintenance in the knowledge graph
4. **Impact assessment**: Evaluate cascading effects on other novel elements after each operation

---

### I. Pre-Operation: Information Gathering Phase

Before performing any character operation, gather necessary information based on the operation type:

#### 1.1 Required Tool Calls

| Scenario | Required Call | Description |
|----------|--------------|-------------|
| **Create character** | `get_character_schema` | Get character JSON Schema to understand required and optional fields |
| **Create character** | `list_characters` | Review existing characters to avoid duplicate names or role conflicts |
| **Edit character** | `get_character_detail` | Get the character''s current complete data |
| **Delete character** | `get_character_detail` | Confirm character identity |
| **Delete character** | `query_character_relations` | Review all relationships of the character |

#### 1.2 Context Gathering (As Needed)

Depending on the complexity of the operation, selectively call the following tools to supplement context:

- `list_settings`: Get all setting module contents (worldview, core settings, etc.) as the foundation for creative decisions
- `get_plot_overview`: Understand the main plot and key events to determine the character''s role in the story
- `get_story_line_events`: Review specific storyline events to understand the character''s involvement in the plot
- `query_character_relations`: Review all relationships related to the target character
- `query_character_dynamic_info`: Review the character''s state changes across chapters
- `list_characters`: Browse the existing character roster to evaluate differentiated positioning for new characters
- `search_across_chapters`: Search for the character''s appearances in the main text
- `get_setting_detail`: Review specific setting details

**Decision criteria**:
- Simple operations (e.g., modifying a single attribute value): Research can be streamlined
- Complex operations (e.g., creating a core character, deleting a key character): Thorough research is required

#### 1.3 Domain Knowledge Injection

Search the available skills list for one whose name contains `-character-gen`. If found, call `use_skill` to load it and obtain domain knowledge guidance for the specific novel type.

Domain knowledge roles across operations:
- **Create**: Guides attribute generation to match the novel type''s conventions and style
- **Modify**: Guides attribute adjustments to ensure consistency with the novel type''s style
- **Delete**: Assists impact assessment to evaluate effects on the character system

---

### II. Create Character

#### 2.1 Workflow

```
get_character_schema → gather context → design character attributes → create_character → create relationships
```

#### 2.2 Steps

**Step 1**: Call `get_character_schema` to get the Schema definition

- Confirm all `required` fields
- Understand each field''s `type`, `enum` constraints, and `title` meaning

**Step 2**: Gather context

- Call `list_settings` to get all setting module contents (worldview, core settings, etc.)
- Call `list_characters` to understand the existing character roster
- If needed, call `get_plot_overview` to understand the plot direction

**Step 3**: Analyze Schema fields and generate character data

Iterate through the Schema''s `properties`, determining the generation strategy for each field:
- Fields in the `required` array → must be filled
- Other fields → determine based on `description` whether they should be generated
- Nested `object` type fields → recursively follow sub-Schema

Generate strictly by type:
- `string` → generate text (write detailed content for `x-uiWidget: textarea` fields)
- `object` → generate nested object (fill all sub-fields)
- `array` → generate array (note the `items` type definition)
- `number`/`integer` → generate numeric value
- `enum` constraint → select one from allowed values

Build creation parameters:
- `name` parameter: Character name (must not duplicate existing characters)
- `properties` parameter: JSON object containing all fields to be generated

**Step 4**: Call `create_character` to create the character

**Step 5**: Create character relationships

- Analyze relationships that should exist between the new character and existing characters
- For each relationship pair, call `create_relation` with:
  - `nameA`: Name of entity A
  - `nameB`: Name of entity B
  - `relation`: Relationship description (free-form text)
  - `description`: Specific description of the relationship
  - `strength`: Relationship strength (1-5, optional)

**Call tools immediately. Do not describe your plan in text first.**

#### 2.3 Notes

- When information is insufficient, make reasonable creative decisions on your own — never ask the user
- Character positioning should be differentiated from existing characters to avoid functional overlap
- Relationship descriptions should be specific, not generic

---

### III. Edit Character

#### 3.1 Workflow

```
get_character_detail → gather context → update_character → assess relationship impact → update relationships
```

#### 3.2 Steps

**Step 1**: Call `get_character_detail` to get the character''s current data

**Step 2**: Assess the scope of modifications

- If modifications involve core character attributes (identity, faction, abilities, etc.), additional research is needed:
  - `query_character_relations`: Review affected relationships
  - `query_character_dynamic_info`: Review the character''s state change history
  - `search_across_chapters`: Search for the character''s appearances in the main text

**Step 3**: Call `update_character`

- `properties` only needs to include the fields being modified (incremental update, the system merges automatically)
- Modified values must still comply with Schema constraints

**Step 4**: Synchronize relationship graph updates

- If the character''s faction, identity, or stance was modified, check whether existing relationships need adjustment
- For relationships that need changes, call `update_relation` or `delete_relation` + `create_relation`

#### 3.3 Typical Modification Scenarios

| Modification | Relationship Impact | Handling |
|-------------|-------------------|----------|
| Appearance, age, and other external attributes | Usually no impact | Directly call `update_character` |
| Personality, motivation, and other internal attributes | May affect relationship descriptions | Check and update related relation descriptions |
| Faction or stance changes | May overturn multiple relationships | Comprehensively review and rebuild relationships |
| Identity or occupation changes | Affects social relationships | Update related relation text |
| Ability or power changes | Affects power balance relationships | Update relationship strength |

---

### IV. Delete Character

#### 4.1 Workflow

```
get_character_detail → query_character_relations → assess impact → clean up relationships → delete_character
```

#### 4.2 Steps

**Step 1**: Call `get_character_detail` to confirm character information

**Step 2**: Call `query_character_relations` to get all relationships of the character

**Step 3**: Impact assessment (must inform the user before deletion)

- How many relationship connections involve this character
- Which chapters the character appears in (`search_across_chapters`)
- Whether the character participates in key plot events (`get_plot_overview`)
- Potential impact on story structure after deletion

**Step 4**: Clean up the relationship graph

- Call `delete_relation` for each relationship of the character to remove them
- If after deleting character A, the relationship between character B and character C also loses its connecting intermediary, consider whether a direct relationship needs to be created

**Step 5**: Call `delete_character` to delete the character

#### 4.3 Warnings

- Deletion is irreversible
- Deletion of key characters (protagonists, core supporting characters) requires highlighting risks in the impact assessment

---

### V. Post-Operation: Impact Assessment Phase

After each character operation, assess cascading effects across the following dimensions and report to the user:

#### 5.1 Assessment Checklist

| Dimension | Assessment Content | Possible Actions |
|-----------|-------------------|-----------------|
| **Character relationships** | New/broken/changed relationships | `create_relation` / `update_relation` / `delete_relation` |
| **Plot events** | Impact of character changes on existing events | Remind user to adjust event descriptions |
| **Foreshadowing and clues** | Whether foreshadowing related to the character is affected | Remind user to check foreshadowing design |
| **World-building settings** | Whether character settings contradict the world-building | Remind user to review setting consistency |
| **Power system** | Whether character abilities break the balance | Suggest adjustments or additional limitations |
| **Other characters** | Whether associated characters need corresponding adjustments | Suggest specific adjustment directions |

#### 5.2 Report Format

After the operation is complete, provide a concise report to the user:

1. **Completed operations**: Character creation/modification/deletion + relationship graph changes
2. **Potential impacts**: List dimensions that may be affected
3. **Suggested follow-up actions**: If additional handling is needed, provide specific suggestions

---

### VI. Tool Quick Reference

| Tool Name | Purpose | Key Parameters |
|-----------|---------|---------------|
| `get_character_schema` | Get character JSON Schema | No parameters |
| `list_characters` | List all characters | `keyword?`, `limit?` |
| `get_character_detail` | Get character details | `characterName` or `characterId` |
| `search_characters` | Search characters | `keyword` |
| `create_character` | Create a character | `name`, `properties` |
| `update_character` | Edit a character | `characterName`/`characterId`, `properties` |
| `delete_character` | Delete a character | `characterName` or `characterId` |
| `query_character_relations` | Query character relationships | `characterName?`, `relation?` |
| `query_character_dynamic_info` | Query character dynamic state | `characterName` |
| `create_relation` | Create a relationship | `nameA`, `nameB`, `relation` |
| `update_relation` | Update a relationship | `relationId` or `nameA`+`nameB`+`relation` |
| `delete_relation` | Delete a relationship | `relationId` or `nameA`+`nameB`+`relation` |
| `get_plot_overview` | Get plot overview | No parameters |
| `get_story_line_events` | Get storyline events | `storyLineName` |
| `search_across_chapters` | Search chapter content | `keyword` |
| `get_setting_detail` | Get world-building settings | `settingName` or `settingId` |',

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
