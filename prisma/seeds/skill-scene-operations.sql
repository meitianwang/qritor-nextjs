-- 全局场景操作 Skill
-- novel_creation_method_id = NULL 表示全局可用
-- 执行方式: mysql -u <user> -p <database> < skill-scene-operations.sql

INSERT INTO skill (name, description, instructions, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'scene-operations',
  '场景全生命周期管理：创建、修改、删除场景，同步维护关系图谱，确保与世界观设定、剧情动线、角色活动保持一致',
  '## 场景操作技能

本技能指导你完成场景的创建、修改、删除操作，并确保场景数据与小说的世界观、剧情动线和角色活动保持一致。

---

### 核心原则

1. **先调研，后执行**：任何场景操作前必须收集充分的上下文信息
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

- `get_setting_detail`：查看世界观设定，确保场景的地理、文化、环境设定与世界观一致
- `get_plot_overview`：了解主线剧情和关键事件，判断场景在故事中承载的功能
- `get_story_line_events`：查看具体故事线的事件，了解哪些事件发生在相关场景
- `list_characters`：浏览角色列表，了解哪些角色可能活动在该场景
- `list_scenes`：浏览已有场景，评估空间关系和地理分布
- `search_across_chapters`：搜索场景在正文中的出现情况
- `list_organizations`：查看组织列表，了解哪些组织驻扎在相关场景

**判断标准**：
- 简单操作（如修改场景的某个描述属性）：调研可精简
- 复杂操作（如创建核心场景、删除关键剧情场景）：必须充分调研

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

- 调用 `list_scenes` 了解已有场景布局
- 调用 `get_setting_detail` 了解世界观设定，确保场景与世界观契合
- 调用 `get_plot_overview` 理解剧情需求，判断场景应承载的叙事功能
- 如有需要，查看相关角色和组织信息

**Step 3**：构建场景数据

- `name` 参数：场景名称（不可与已有场景重复）
- `properties` 参数：严格按照 Schema 定义构建 JSON 对象
- 必须填写所有 `required` 字段
- `enum` 类型字段只能使用预定义的选项值
- 嵌套 `object` 或 `array` 类型字段需递归遵循子 Schema

**Step 4**：调用 `create_scene` 创建场景

**Step 5**：创建场景关系

分析新场景与其他实体之间应该存在的关系，对每条关系调用 `create_relation`：

**场景 ↔ 场景**（空间关系）：
- 用 `fromCategory: "scene"`, `toCategory: "scene"` 明确类型

**场景 ↔ 角色**（活动关系）：
- 用 `fromCategory: "scene"`, `toCategory: "character"`（或反向）

**场景 ↔ 组织**（归属关系）：
- 用 `fromCategory: "scene"`, `toCategory: "organization"`（或反向）

**通用参数**：
- `fromName`：关系起点实体名
- `toName`：关系终点实体名
- `relationType`：关系类型
- `description`：关系的具体描述
- `strength`：关系强度（1-5，可选）

#### 2.3 注意事项

- 如果用户提供的信息不足以填写必填字段，**主动询问**用户补充
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
| 地理位置、空间布局 | 影响与相邻场景的空间关系 | 检查并更新场景间的 relationType 和 description |
| 归属势力、控制权变更 | 影响场景与组织的关系 | 更新场景与组织的关系，可能需要新建或删除 |
| 环境性质变化（如毁灭、重建） | 影响所有与该场景关联的关系 | 全面审查：角色是否需要迁移、组织是否失去据点 |
| 可达性变化（封锁、开放） | 影响场景间通行关系 | 更新与相关场景的 relationType |

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
- 关键场景（主线剧情发生地、角色聚集地）的删除务必与用户充分确认

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
| `query_character_relations` | 查询实体关系（支持所有类型） | `characterName?`（传入场景名）, `relationType?` |
| `create_relation` | 创建关系 | `fromName`, `toName`, `relationType`, `description?`, `fromCategory?`, `toCategory?` |
| `update_relation` | 更新关系 | `relationId` 或 `fromName`+`toName`+`relationType` |
| `delete_relation` | 删除关系 | `relationId` 或 `fromName`+`toName`+`relationType` |
| `get_plot_overview` | 获取剧情概览 | 无参数 |
| `get_story_line_events` | 获取故事线事件 | `storyLineName` |
| `search_across_chapters` | 搜索章节内容 | `keyword` |
| `get_setting_detail` | 获取世界设定 | `settingName` 或 `settingId` |
| `list_characters` | 列出所有角色 | `keyword?`, `limit?` |
| `list_organizations` | 列出所有组织 | `keyword?`, `limit?` |',

  NULL,
  1,
  1,
  NOW()
);
