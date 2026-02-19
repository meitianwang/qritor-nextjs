-- 全局角色操作 Skill
-- novel_creation_method_id = NULL 表示全局可用
-- 执行方式: mysql -u <user> -p <database> < skill-character-operations.sql

INSERT INTO skill (name, description, instructions, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'character-operations',
  '角色全生命周期管理：创建、修改、删除角色，同步维护关系图谱，确保与小说设定、剧情、事件保持一致',
  '## 角色操作技能

本技能指导你完成角色的创建、修改、删除操作，并确保角色数据与小说整体设定保持一致。

---

### 核心原则

1. **先调研，后执行**：任何角色操作前必须收集充分的上下文信息
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

- `get_plot_overview`：了解主线剧情和关键事件，判断角色在故事中的定位
- `get_story_line_events`：查看具体故事线的事件，了解角色参与的情节
- `query_character_relations`：查看与目标角色相关的所有关系
- `query_character_dynamic_info`：查看角色在各章节中的状态变化轨迹
- `list_characters`：浏览现有角色阵容，评估新角色的差异化定位
- `search_across_chapters`：搜索角色在正文中的出场情况
- `get_setting_detail`：查看世界观设定，确保角色背景设定合理

**判断标准**：
- 简单操作（如修改角色的某个属性值）：调研可精简
- 复杂操作（如创建核心角色、删除关键角色）：必须充分调研

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

- 调用 `list_characters` 了解现有角色阵容
- 调用 `get_plot_overview` 理解剧情走向
- 如有需要，查看相关设定和章节内容

**Step 3**：构建角色数据

- `name` 参数：角色名称（不可与已有角色重复）
- `properties` 参数：严格按照 Schema 定义构建 JSON 对象
- 必须填写所有 `required` 字段
- `enum` 类型字段只能使用预定义的选项值
- 嵌套 `object` 或 `array` 类型字段需递归遵循子 Schema

**Step 4**：调用 `create_character` 创建角色

**Step 5**：创建角色关系

- 分析新角色与现有角色之间应该存在的关系
- 对每对关系调用 `create_relation`，设置：
  - `fromName`：关系起点角色名
  - `toName`：关系终点角色名
  - `relationType`：关系类型
  - `description`：关系的具体描述
  - `strength`：关系强度（0-100，可选）

#### 2.3 注意事项

- 如果用户提供的信息不足以填写必填字段，**主动询问**用户补充
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
| 身份、职业变化 | 影响社会关系 | 更新相关 relation 的 relationType |
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
- 关键角色（主角、核心配角）的删除务必与用户充分确认

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
| `query_character_relations` | 查询角色关系 | `characterName?`, `relationType?` |
| `query_character_dynamic_info` | 查询角色动态状态 | `characterName` |
| `create_relation` | 创建关系 | `fromName`, `toName`, `relationType`, `description?` |
| `update_relation` | 更新关系 | `relationId` 或 `fromName`+`toName`+`relationType` |
| `delete_relation` | 删除关系 | `relationId` 或 `fromName`+`toName`+`relationType` |
| `get_plot_overview` | 获取剧情概览 | 无参数 |
| `get_story_line_events` | 获取故事线事件 | `storyLineName` |
| `search_across_chapters` | 搜索章节内容 | `keyword` |
| `get_setting_detail` | 获取世界设定 | `settingName` 或 `settingId` |',

  NULL,
  1,
  0,
  NOW()
);
