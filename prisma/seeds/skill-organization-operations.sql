-- 全局组织操作 Skill
-- novel_creation_method_id = NULL 表示全局可用
-- 执行方式: mysql -u <user> -p <database> < skill-organization-operations.sql

INSERT INTO skill (name, description, instructions, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'organization-operations',
  '组织全生命周期管理：创建、修改、删除组织，同步维护关系图谱，确保与势力格局、角色归属、场景据点保持一致',
  '## 组织操作技能

本技能指导你完成组织的创建、修改、删除操作，并确保组织数据与小说的势力格局、角色归属和场景据点保持一致。

---

### 核心原则

1. **先调研，后执行**：任何组织操作前必须收集充分的上下文信息
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

- `get_setting_detail`：查看世界观设定，确保组织的背景设定与世界观一致
- `get_plot_overview`：了解主线剧情和关键事件，判断组织在故事冲突中的定位
- `get_story_line_events`：查看具体故事线的事件，了解组织参与的情节
- `list_characters`：浏览角色列表，了解哪些角色隶属或关联该组织
- `list_scenes`：浏览场景列表，了解组织的据点和势力范围
- `list_organizations`：浏览已有组织阵容，评估势力格局平衡
- `search_across_chapters`：搜索组织在正文中的出现情况

**判断标准**：
- 简单操作（如修改组织的某个描述属性）：调研可精简
- 复杂操作（如创建核心势力、删除关键组织）：必须充分调研

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

- 调用 `list_organizations` 了解已有组织和势力分布
- 调用 `get_setting_detail` 了解世界观设定，确保组织与世界观契合
- 调用 `get_plot_overview` 理解剧情冲突结构，判断新组织应扮演的角色
- 如有需要，查看相关角色和场景信息

**Step 3**：构建组织数据

- `name` 参数：组织名称（不可与已有组织重复）
- `properties` 参数：严格按照 Schema 定义构建 JSON 对象
- 必须填写所有 `required` 字段
- `enum` 类型字段只能使用预定义的选项值
- 嵌套 `object` 或 `array` 类型字段需递归遵循子 Schema

**Step 4**：调用 `create_organization` 创建组织

**Step 5**：创建组织关系

分析新组织与其他实体之间应该存在的关系，对每条关系调用 `create_relation`：

**组织 ↔ 角色**（成员关系）：
- 用 `fromCategory: "organization"`, `toCategory: "character"`（或反向）

**组织 ↔ 场景**（据点关系）：
- 用 `fromCategory: "organization"`, `toCategory: "scene"`（或反向）

**组织 ↔ 组织**（势力关系）：
- 用 `fromCategory: "organization"`, `toCategory: "organization"`

**通用参数**：
- `fromName`：关系起点实体名
- `toName`：关系终点实体名
- `relationType`：关系类型
- `description`：关系的具体描述
- `strength`：关系强度（1-5，可选）

#### 2.3 注意事项

- 如果用户提供的信息不足以填写必填字段，**主动询问**用户补充
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
- 核心组织（主线势力、主角所属组织）的删除务必与用户充分确认

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
| `query_character_relations` | 查询实体关系（支持所有类型） | `characterName?`（传入组织名）, `relationType?` |
| `create_relation` | 创建关系 | `fromName`, `toName`, `relationType`, `description?`, `fromCategory?`, `toCategory?` |
| `update_relation` | 更新关系 | `relationId` 或 `fromName`+`toName`+`relationType` |
| `delete_relation` | 删除关系 | `relationId` 或 `fromName`+`toName`+`relationType` |
| `get_plot_overview` | 获取剧情概览 | 无参数 |
| `get_story_line_events` | 获取故事线事件 | `storyLineName` |
| `search_across_chapters` | 搜索章节内容 | `keyword` |
| `get_setting_detail` | 获取世界设定 | `settingName` 或 `settingId` |
| `list_characters` | 列出所有角色 | `keyword?`, `limit?` |
| `list_scenes` | 列出所有场景 | `keyword?`, `limit?` |',

  NULL,
  1,
  2,
  NOW()
);
