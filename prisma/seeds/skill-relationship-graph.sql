-- 全局关系图谱管理 Skill / Global Relationship Graph Management Skill
-- novel_creation_method_id = NULL 表示全局可用 / NULL means globally available
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-relationship-graph.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'relationship-graph',
  '关系图谱管理：知识图谱节点维护、实体间关系建立与调整、字段动态信息追踪，构建完整的小说世界关联网络',
  'Relationship graph management: knowledge graph node maintenance, entity relationship creation and adjustment, field dynamic state tracking, building a complete novel world relationship network',
  '## 关系图谱管理技能

本技能指导你维护知识图谱节点、管理实体间关系、追踪字段动态变化，帮助构建清晰完整的小说世界关联网络。

---

### 核心概念

本技能涉及三个相互关联的系统：

| 系统 | 说明 | 核心工具 |
|------|------|---------|
| **节点（实体）** | 知识图谱中的实体（角色、场景、道具、组织、概念等） | `list_nodes`, `get_node_detail`, `create_node`, `update_node`, `delete_node` |
| **关系（边）** | 实体之间的连接（朋友、敌人、隶属、持有等） | `create_relation`, `update_relation`, `delete_relation` |
| **动态信息** | 实体字段随章节变化的追踪记录 | `get_field_dynamic_info`, `update_field_dynamic_info` |

**关系**：节点 → 通过关系互相连接 → 关系有类型和强度 → 节点字段可有动态变化记录

---

### 核心原则

1. **先查后改**：操作前必须了解现有图谱结构，避免重复创建或错误删除
2. **语义准确**：关系类型和节点类别要准确反映小说中的实际含义
3. **双向思考**：创建关系时考虑是否需要反向关系（如 A是B的师父 → B是A的徒弟）
4. **强度分级**：合理使用关系强度（1-5）区分关系的紧密程度
5. **动态追踪**：重要实体属性发生变化时及时记录动态信息

---

### 一、操作前：了解现有图谱

在进行任何关系图谱操作之前，先了解小说的图谱全貌：

#### 1.1 必须调用的工具

| 场景 | 必须调用 | 说明 |
|------|---------|------|
| **任何图谱操作** | `list_nodes` | 查看现有节点列表，了解图谱规模和结构 |
| **操作特定节点** | `get_node_detail` | 查看节点的完整属性和所有关联关系 |
| **动态信息操作** | `list_chapters` | 了解章节结构，动态信息通常关联到章节 |

#### 1.2 上下文收集（按需）

- `list_characters`：了解已有角色，角色操作类 skill 创建的角色也是图谱节点
- `list_scenes`：了解已有场景
- `get_plot_overview`：了解剧情发展，判断哪些关系需要随剧情变化
- `get_novel_overview`：了解小说整体结构

#### 1.3 新小说场景

对于新小说（图谱为空），应当：
- 先通过 `list_characters`、`list_scenes` 等确认已有哪些实体
- 注意：通过角色操作、场景操作等 skill 创建的实体已自动同步到知识图谱
- 仅需为尚未存在于图谱中的概念性实体（如世界观设定、势力概念）手动创建节点

---

### 二、节点管理

#### 2.1 节点类别

| 类别 | category 值 | 说明 | 示例 |
|------|------------|------|------|
| 角色 | `character` | 小说中的人物 | 主角、配角、龙套 |
| 场景 | `scene` | 故事发生的地点 | 城镇、战场、密室 |
| 道具 | `prop` | 重要物品 | 武器、信物、宝物 |
| 组织 | `organization` | 团体和组织 | 门派、家族、国家 |
| 概念 | `concept` | 抽象概念和设定 | 魔法体系、社会制度、预言 |

**注意**：角色、场景、道具、组织类型的节点通常由对应的实体操作 skill 自动创建和同步。`concept` 类型是关系图谱独有的，用于表示抽象概念。

#### 2.2 创建节点

**流程**：
```
list_nodes → 确认不存在同名节点 → create_node
```

**步骤**：

**Step 1**：调用 `list_nodes` 查看现有节点

- 按类别筛选：`list_nodes(category="concept")` 查看已有概念节点
- 按名称搜索：`list_nodes(keyword="某关键词")` 检查是否已存在

**Step 2**：调用 `create_node`

- `name`：节点名称，简洁明确
- `category`：节点类别（character/scene/prop/organization/concept）
- `properties`：可选，键值对形式的附加属性

**创建建议**：
- 优先使用实体操作 skill（角色操作、场景操作等）创建实体，它们会自动同步到图谱
- 仅在需要创建独立概念性节点时使用 `create_node`
- 同名节点会报错，请先查询确认

#### 2.3 更新节点

**流程**：
```
get_node_detail → 分析当前信息 → update_node
```

**步骤**：

**Step 1**：调用 `get_node_detail` 查看节点当前信息

- 确认节点的完整属性和关联关系
- 了解哪些信息需要修改

**Step 2**：调用 `update_node`

- 定位方式：`nodeId` 或 `nodeName` 二选一
- `newName`：修改名称（新名称不能与已有节点重复）
- `newCategory`：修改类别
- `properties`：要更新的属性（会与现有属性合并，不会覆盖未指定的属性）

#### 2.4 删除节点

**流程**：
```
get_node_detail → 评估影响 → delete_node
```

**步骤**：

**Step 1**：调用 `get_node_detail` 查看节点详情

- 重点查看 `relations` 列表，了解有多少关联关系
- 删除节点会**级联删除**所有相关关系

**Step 2**：调用 `delete_node`

- 定位方式：`nodeId` 或 `nodeName` 二选一
- 删除不可恢复，操作前务必确认

---

### 三、关系管理

#### 3.1 关系的结构

每条关系包含三个核心要素：

```
起点实体 →（关系类型）→ 终点实体
fromName   relationType    toName
```

附加属性：
- `description`：关系的具体描述
- `strength`：关系强度（1-5）

| 强度 | 含义 | 示例 |
|------|------|------|
| 1 | 极弱/偶然 | 路人、曾经见过一面 |
| 2 | 较弱/一般 | 普通同事、远房亲戚 |
| 3 | 中等（默认） | 朋友、同门 |
| 4 | 较强/重要 | 挚友、师徒 |
| 5 | 极强/核心 | 生死之交、宿敌、至亲 |

#### 3.2 常见关系类型

**角色↔角色**：
- 朋友、敌人、恋人、师徒、父子/母女、兄弟/姐妹、同门、对手

**角色↔组织**：
- 隶属、领导、创立、叛离、效忠

**角色↔道具**：
- 持有、创造、寻找、守护

**角色↔场景**：
- 居住、驻守、发现

**组织↔组织**：
- 同盟、敌对、附庸、竞争

**概念↔实体**：
- 掌握（角色→概念）、约束（概念→角色）、起源于（概念→场景）

#### 3.3 创建关系

**流程**：
```
list_nodes / get_node_detail → 确认实体存在 → create_relation
```

**步骤**：

**Step 1**：确认两个实体的准确名称

- 调用 `list_nodes` 或 `get_node_detail` 查看节点名称
- 名称必须精确匹配（不存在的实体会被自动创建为图谱节点）

**Step 2**：调用 `create_relation`

- `fromName`：起点实体名称
- `toName`：终点实体名称
- `relationType`：关系类型（如"朋友"、"师徒"）
- `description`：补充描述关系的具体情况
- `strength`：关系强度 1-5，默认 3
- `fromCategory`/`toCategory`：通常不需要指定，系统会自动识别

**注意事项**：
- 如果 fromName 或 toName 对应的实体不存在于图谱中，系统会自动创建对应节点
- 相同方向、相同类型的关系不能重复创建
- A→朋友→B 和 B→朋友→A 是两条不同的关系

**关于双向关系**：
- 有些关系是对称的（如"朋友"），考虑是否需要创建反向关系
- 有些关系是不对称的（如"师父→徒弟"），方向有实际意义
- 根据小说需要决定是否创建双向关系

#### 3.4 更新关系

**流程**：
```
get_node_detail → 找到关系 → update_relation
```

**步骤**：

**Step 1**：调用 `get_node_detail` 查看节点的所有关系

- 从返回的 `relations` 列表中找到目标关系的 `id`

**Step 2**：调用 `update_relation`

- 定位方式（二选一）：
  - `relationId`：直接使用关系 ID
  - `fromName` + `toName` + `relationType`：通过三元组查找
- 可修改：
  - `newRelationType`：新的关系类型
  - `newDescription`：新的描述
  - `newStrength`：新的关系强度

**典型场景**：
- 剧情发展导致关系变化（朋友→敌人、陌生人→恋人）
- 关系强度变化（从普通朋友变为生死之交）
- 补充或修正关系描述

#### 3.5 删除关系

**流程**：
```
get_node_detail → 找到关系 → delete_relation
```

**步骤**：

**Step 1**：调用 `get_node_detail` 找到目标关系

**Step 2**：调用 `delete_relation`

- 定位方式（二选一）：
  - `relationId`：直接使用关系 ID
  - `fromName` + `toName` + `relationType`：通过三元组查找
- 删除关系不会删除关联的实体节点
- 删除不可恢复

---

### 四、动态信息追踪

动态信息用于记录实体字段随剧情发展的变化。这是关系图谱独有的高级功能，能追踪实体属性在不同章节的演变。

#### 4.1 适用场景

- 角色性格在某章节发生重大转变
- 角色的位置、状态、能力随剧情变化
- 场景的氛围或物理状态发生改变
- 道具的持有者更替或状态变化

#### 4.2 查询动态信息

**流程**：
```
get_field_dynamic_info(entityName) → 了解字段变化历史
```

**参数**：
- `entityName`：实体名称（必填）
- `entityCategory`：实体类型（可选，通常自动识别）
- `fieldName`：指定字段名（不传则返回所有字段的动态信息）
- `chapterId`：指定章节（查看该章节时的动态信息）

**使用建议**：
- 不传 `fieldName` 可以概览实体所有字段的动态状态
- 传 `chapterId` 可以回溯某章节时的状态快照

#### 4.3 更新动态信息

**流程**：
```
get_field_dynamic_info → 了解现状 → list_chapters → 确定章节 → update_field_dynamic_info
```

**步骤**：

**Step 1**：调用 `get_field_dynamic_info` 了解当前动态信息

- 确认该实体已存在
- 了解已有哪些字段的动态记录

**Step 2**：调用 `list_chapters` 确定关联章节

- 动态信息通常关联到引起变化的章节

**Step 3**：调用 `update_field_dynamic_info`

- `entityName`：实体名称
- `entityCategory`：实体类型（可选）
- `chapterId`：关联章节 ID（可选但推荐）
- `fields`：字段列表，每项包含：
  - `fieldName`：字段名称（如"性格"、"位置"、"状态"）
  - `dynamicValue`：该字段的新动态值描述

**注意**：
- 每次更新是**追加**新记录，不会覆盖历史记录
- 同一字段可以有多条动态记录，形成变化轨迹
- 推荐关联到具体章节，便于回溯

---

### 五、典型工作流

#### 5.1 为新小说构建初始关系网络

```
Step 1: list_characters / list_scenes / list_nodes  → 了解已有实体
Step 2: 规划核心关系（主角与关键角色、角色与组织等）
Step 3: 批量 create_relation  → 建立核心关系
Step 4: create_node(concept)  → 补充概念性节点（如魔法体系、世界规则）
Step 5: create_relation  → 建立概念与实体的关联
```

#### 5.2 章节写作后同步关系变化

```
Step 1: get_node_detail(角色名)  → 查看角色当前关系
Step 2: 根据章节内容判断关系变化
Step 3: create_relation / update_relation / delete_relation  → 更新变化的关系
Step 4: update_field_dynamic_info  → 记录关键字段的动态变化
```

#### 5.3 梳理角色关系网络

```
Step 1: list_nodes(category="character")  → 列出所有角色节点
Step 2: 逐个 get_node_detail  → 查看每个角色的关系
Step 3: 分析关系网络的完整性
Step 4: create_relation  → 补充缺失的关系
Step 5: update_relation  → 修正不准确的关系
```

#### 5.4 追踪角色成长轨迹

```
Step 1: get_field_dynamic_info(角色名)  → 查看已有动态记录
Step 2: list_chapters  → 确定要关联的章节
Step 3: update_field_dynamic_info  → 记录各章节的变化
```

---

### 六、工具速查表

| 工具名 | 用途 | 必要参数 |
|--------|------|---------|
| `list_nodes` | 列出图谱节点 | 可选：keyword, category, limit |
| `get_node_detail` | 查看节点详情和关系 | nodeId 或 nodeName |
| `create_node` | 创建新节点 | name, category |
| `update_node` | 更新节点信息 | nodeId/nodeName + 修改字段 |
| `delete_node` | 删除节点（级联删除关系） | nodeId 或 nodeName |
| `create_relation` | 创建实体间关系 | fromName, toName, relationType |
| `update_relation` | 修改已有关系 | relationId 或三元组 + 修改字段 |
| `delete_relation` | 删除关系 | relationId 或三元组 |
| `get_field_dynamic_info` | 查询字段动态信息 | entityName |
| `update_field_dynamic_info` | 更新字段动态信息 | entityName, fields |',
  '## Relationship Graph Management Skill

This skill guides you in maintaining knowledge graph nodes, managing relationships between entities, and tracking dynamic field changes to build a clear and complete relationship network for the novel world.

---

### Core Concepts

This skill involves three interconnected systems:

| System | Description | Core Tools |
|--------|-------------|------------|
| **Nodes (Entities)** | Entities in the knowledge graph (characters, scenes, props, organizations, concepts, etc.) | `list_nodes`, `get_node_detail`, `create_node`, `update_node`, `delete_node` |
| **Relations (Edges)** | Connections between entities (friends, enemies, membership, possession, etc.) | `create_relation`, `update_relation`, `delete_relation` |
| **Dynamic Info** | Tracking records of entity field changes across chapters | `get_field_dynamic_info`, `update_field_dynamic_info` |

**Relationships**: Nodes → connected via Relations → relations have types and strengths → node fields can have dynamic change records

---

### Core Principles

1. **Query before modifying**: Always understand the existing graph structure before making changes to avoid duplicates or accidental deletions
2. **Semantic accuracy**: Relationship types and node categories should accurately reflect the actual meaning in the novel
3. **Bidirectional thinking**: When creating relations, consider whether a reverse relation is needed (e.g., A is B''s master → B is A''s apprentice)
4. **Strength grading**: Use relationship strength (1-5) appropriately to differentiate closeness
5. **Dynamic tracking**: Record dynamic info promptly when important entity attributes change

---

### Section 1: Pre-Operation — Understand the Existing Graph

Before performing any relationship graph operation, understand the current state of the graph:

#### 1.1 Required Tools

| Scenario | Must Call | Description |
|----------|----------|-------------|
| **Any graph operation** | `list_nodes` | View existing node list to understand graph scale and structure |
| **Operating on a specific node** | `get_node_detail` | View complete properties and all associated relations of a node |
| **Dynamic info operations** | `list_chapters` | Understand chapter structure, as dynamic info is typically associated with chapters |

#### 1.2 Contextual Collection (As Needed)

- `list_characters`: Check existing characters; characters created by other skills are also graph nodes
- `list_scenes`: Check existing scenes
- `get_plot_overview`: Understand plot development to determine which relations may change with the story
- `get_novel_overview`: Understand the overall novel structure

#### 1.3 New Novel Scenario

For a new novel (empty graph):
- First check existing entities via `list_characters`, `list_scenes`, etc.
- Note: Entities created through character/scene/prop/organization operation skills are automatically synced to the knowledge graph
- Only manually create nodes for conceptual entities not yet in the graph (e.g., world-building rules, faction concepts)

---

### Section 2: Node Management

#### 2.1 Node Categories

| Category | category Value | Description | Examples |
|----------|---------------|-------------|----------|
| Character | `character` | People in the novel | Protagonist, supporting characters, extras |
| Scene | `scene` | Locations where events happen | Towns, battlefields, secret rooms |
| Prop | `prop` | Important items | Weapons, tokens, treasures |
| Organization | `organization` | Groups and organizations | Sects, families, nations |
| Concept | `concept` | Abstract concepts and settings | Magic systems, social systems, prophecies |

**Note**: Character, scene, prop, and organization type nodes are typically created and synced automatically by the corresponding entity operation skills. The `concept` type is unique to the relationship graph, used for abstract concepts.

#### 2.2 Creating Nodes

**Flow**:
```
list_nodes → confirm no duplicate name exists → create_node
```

**Steps**:

**Step 1**: Call `list_nodes` to check existing nodes

- Filter by category: `list_nodes(category="concept")` to see existing concept nodes
- Search by name: `list_nodes(keyword="some keyword")` to check for existing nodes

**Step 2**: Call `create_node`

- `name`: Node name, concise and clear
- `category`: Node category (character/scene/prop/organization/concept)
- `properties`: Optional key-value pairs for additional attributes

**Guidelines**:
- Prefer using entity operation skills (character operations, scene operations, etc.) to create entities, as they auto-sync to the graph
- Only use `create_node` when you need to create standalone conceptual nodes
- Duplicate names will cause an error; always check first

#### 2.3 Updating Nodes

**Flow**:
```
get_node_detail → analyze current info → update_node
```

**Steps**:

**Step 1**: Call `get_node_detail` to view current node info

- Review complete properties and associated relations
- Identify what needs to be changed

**Step 2**: Call `update_node`

- Locate via: `nodeId` or `nodeName`
- `newName`: Change name (new name must not conflict with existing nodes)
- `newCategory`: Change category
- `properties`: Properties to update (merged with existing properties; unspecified properties remain unchanged)

#### 2.4 Deleting Nodes

**Flow**:
```
get_node_detail → assess impact → delete_node
```

**Steps**:

**Step 1**: Call `get_node_detail` to view node details

- Focus on the `relations` list to understand how many associated relations exist
- Deleting a node will **cascade delete** all related relations

**Step 2**: Call `delete_node`

- Locate via: `nodeId` or `nodeName`
- Deletion is irreversible; always confirm before proceeding

---

### Section 3: Relation Management

#### 3.1 Relation Structure

Each relation consists of three core elements:

```
Source Entity →(Relation Type)→ Target Entity
fromName       relationType      toName
```

Additional attributes:
- `description`: Specific description of the relationship
- `strength`: Relationship strength (1-5)

| Strength | Meaning | Examples |
|----------|---------|----------|
| 1 | Very weak / incidental | Strangers, met once |
| 2 | Weak / casual | Ordinary colleagues, distant relatives |
| 3 | Moderate (default) | Friends, fellow students |
| 4 | Strong / important | Close friends, master-apprentice |
| 5 | Very strong / core | Life-and-death bond, nemesis, closest family |

#### 3.2 Common Relation Types

**Character ↔ Character**:
- Friends, enemies, lovers, master-apprentice, parent-child, siblings, fellow disciples, rivals

**Character ↔ Organization**:
- Member of, leader of, founder, defector, loyal to

**Character ↔ Prop**:
- Possesses, created, seeking, guarding

**Character ↔ Scene**:
- Resides in, stationed at, discovered

**Organization ↔ Organization**:
- Allied, hostile, vassal, competing

**Concept ↔ Entity**:
- Masters (character → concept), constrains (concept → character), originates from (concept → scene)

#### 3.3 Creating Relations

**Flow**:
```
list_nodes / get_node_detail → confirm entities exist → create_relation
```

**Steps**:

**Step 1**: Confirm the exact names of both entities

- Call `list_nodes` or `get_node_detail` to check node names
- Names must match exactly (non-existing entities will be auto-created as graph nodes)

**Step 2**: Call `create_relation`

- `fromName`: Source entity name
- `toName`: Target entity name
- `relationType`: Relationship type (e.g., "friend", "master-apprentice")
- `description`: Additional context about the relationship
- `strength`: Relationship strength 1-5, default 3
- `fromCategory`/`toCategory`: Usually not needed; the system auto-detects

**Notes**:
- If the entity referenced by fromName or toName does not exist in the graph, the system will auto-create the corresponding node
- Duplicate relations (same direction, same type) cannot be created
- A→friend→B and B→friend→A are two distinct relations

**About bidirectional relations**:
- Some relations are symmetric (e.g., "friend"); consider creating a reverse relation
- Some relations are asymmetric (e.g., "master→apprentice"); direction matters
- Decide based on the novel''s needs

#### 3.4 Updating Relations

**Flow**:
```
get_node_detail → find the relation → update_relation
```

**Steps**:

**Step 1**: Call `get_node_detail` to view all relations of a node

- Find the target relation''s `id` from the returned `relations` list

**Step 2**: Call `update_relation`

- Locate via (choose one):
  - `relationId`: Directly use the relation ID
  - `fromName` + `toName` + `relationType`: Find by triplet
- Modifiable fields:
  - `newRelationType`: New relationship type
  - `newDescription`: New description
  - `newStrength`: New relationship strength

**Typical scenarios**:
- Plot developments cause relationship changes (friend → enemy, stranger → lover)
- Relationship strength changes (from casual friend to life-and-death bond)
- Supplementing or correcting relationship descriptions

#### 3.5 Deleting Relations

**Flow**:
```
get_node_detail → find the relation → delete_relation
```

**Steps**:

**Step 1**: Call `get_node_detail` to find the target relation

**Step 2**: Call `delete_relation`

- Locate via (choose one):
  - `relationId`: Directly use the relation ID
  - `fromName` + `toName` + `relationType`: Find by triplet
- Deleting a relation does not delete the associated entity nodes
- Deletion is irreversible

---

### Section 4: Dynamic Info Tracking

Dynamic info records how entity fields change as the plot develops. This is an advanced feature of the relationship graph that tracks the evolution of entity attributes across chapters.

#### 4.1 When to Use

- A character''s personality undergoes a major shift in a chapter
- A character''s location, status, or abilities change with the plot
- A scene''s atmosphere or physical state changes
- A prop''s owner changes or its state shifts

#### 4.2 Querying Dynamic Info

**Flow**:
```
get_field_dynamic_info(entityName) → understand field change history
```

**Parameters**:
- `entityName`: Entity name (required)
- `entityCategory`: Entity category (optional, usually auto-detected)
- `fieldName`: Specify a field name (omit to get all fields'' dynamic info)
- `chapterId`: Specify a chapter (view dynamic info at that chapter)

**Tips**:
- Omitting `fieldName` gives an overview of all fields'' dynamic states
- Providing `chapterId` allows you to look back at the state snapshot at a specific chapter

#### 4.3 Updating Dynamic Info

**Flow**:
```
get_field_dynamic_info → understand current state → list_chapters → determine chapter → update_field_dynamic_info
```

**Steps**:

**Step 1**: Call `get_field_dynamic_info` to understand the current dynamic info

- Confirm the entity exists
- Review existing dynamic records for fields

**Step 2**: Call `list_chapters` to determine the associated chapter

- Dynamic info is typically associated with the chapter that caused the change

**Step 3**: Call `update_field_dynamic_info`

- `entityName`: Entity name
- `entityCategory`: Entity category (optional)
- `chapterId`: Associated chapter ID (optional but recommended)
- `fields`: List of fields, each containing:
  - `fieldName`: Field name (e.g., "personality", "location", "status")
  - `dynamicValue`: New dynamic value description for the field

**Notes**:
- Each update **appends** a new record; historical records are never overwritten
- The same field can have multiple dynamic records, forming a change trajectory
- Associating with a specific chapter is recommended for traceability

---

### Section 5: Typical Workflows

#### 5.1 Building an Initial Relationship Network for a New Novel

```
Step 1: list_characters / list_scenes / list_nodes  → understand existing entities
Step 2: Plan core relations (protagonist & key characters, characters & organizations, etc.)
Step 3: Batch create_relation  → establish core relations
Step 4: create_node(concept)  → add conceptual nodes (e.g., magic system, world rules)
Step 5: create_relation  → link concepts to entities
```

#### 5.2 Syncing Relation Changes After Chapter Writing

```
Step 1: get_node_detail(character name)  → view character''s current relations
Step 2: Determine relation changes based on chapter content
Step 3: create_relation / update_relation / delete_relation  → update changed relations
Step 4: update_field_dynamic_info  → record key field dynamic changes
```

#### 5.3 Auditing a Character Relationship Network

```
Step 1: list_nodes(category="character")  → list all character nodes
Step 2: get_node_detail for each  → view each character''s relations
Step 3: Analyze the completeness of the relationship network
Step 4: create_relation  → fill in missing relations
Step 5: update_relation  → correct inaccurate relations
```

#### 5.4 Tracking a Character''s Growth Arc

```
Step 1: get_field_dynamic_info(character name)  → view existing dynamic records
Step 2: list_chapters  → determine chapters to associate with
Step 3: update_field_dynamic_info  → record changes at each chapter
```

---

### Section 6: Tool Quick Reference

| Tool Name | Purpose | Required Parameters |
|-----------|---------|-------------------|
| `list_nodes` | List graph nodes | Optional: keyword, category, limit |
| `get_node_detail` | View node details and relations | nodeId or nodeName |
| `create_node` | Create a new node | name, category |
| `update_node` | Update node info | nodeId/nodeName + fields to modify |
| `delete_node` | Delete a node (cascades to relations) | nodeId or nodeName |
| `create_relation` | Create a relation between entities | fromName, toName, relationType |
| `update_relation` | Modify an existing relation | relationId or triplet + fields to modify |
| `delete_relation` | Delete a relation | relationId or triplet |
| `get_field_dynamic_info` | Query field dynamic info | entityName |
| `update_field_dynamic_info` | Update field dynamic info | entityName, fields |',
  NULL,
  1,
  60,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  is_active = VALUES(is_active),
  sort_order = VALUES(sort_order);
