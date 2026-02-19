-- 全局一致性审查 Skill / Global Consistency Audit Skill
-- novel_creation_method_id = NULL 表示全局可用 / NULL means globally available
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-consistency-audit.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'consistency-audit',
  '一致性审查：检查角色属性、剧情逻辑、章节引用、关系图谱、伏笔回收等多维度的前后一致性，发现矛盾并提供修复建议',
  'Consistency audit: check multi-dimensional consistency including character attributes, plot logic, chapter references, relationship graph, foreshadow resolution, and provide fix suggestions',
  '## 一致性审查技能

本技能指导你对小说进行系统性的一致性检查，发现角色属性、剧情逻辑、章节引用、关系图谱等方面的矛盾和遗漏，并提供修复建议。

---

### 核心原则

1. **只读优先**：审查阶段只使用查询工具收集信息，不主动执行修改操作
2. **证据驱动**：每个问题必须引用具体来源（章节名、工具返回数据等）
3. **分级报告**：按严重程度分类（严重矛盾 / 轻微不一致 / 优化建议）
4. **按需深入**：先做全局扫描，再对发现的问题进行深入排查
5. **修复可选**：列出所有问题后，由用户决定是否执行修复

---

### 审查维度概览

| 维度 | 检查内容 | 核心工具 |
|------|---------|---------|
| **角色一致性** | 属性矛盾、称呼变化、行为逻辑 | `list_characters`, `get_character_detail`, `fulltext_search` |
| **剧情一致性** | 事件顺序、因果逻辑、伏笔闭环 | `get_plot_overview`, `analyze_plot_structure`, `list_pending_foreshadows` |
| **章节一致性** | 实体关联、编号连续、大纲与正文匹配 | `list_chapters`, `get_chapter_content`, `get_chapter_outline`, `get_chapter_statistics` |
| **关系图谱一致性** | 孤立节点、矛盾关系、遗漏关系 | `list_nodes`, `get_node_detail`, `query_character_relations` |
| **实体引用一致性** | 正文提及但未注册、已注册但从未提及 | `fulltext_search`, `search_across_chapters`, `list_characters`, `list_scenes` |
| **动态信息一致性** | 状态变化是否与章节内容吻合 | `get_field_dynamic_info`, `query_character_current_state` |

---

### 一、全局扫描（必做）

每次执行一致性审查，必须先做全局扫描以建立基准：

#### Step 1：收集全局数据

按顺序调用以下工具：

1. `get_novel_overview` — 了解小说基本结构
2. `list_chapters` — 获取完整章节列表（编号、标题、字数）
3. `list_characters` — 获取所有角色
4. `list_scenes` — 获取所有场景
5. `list_props` — 获取所有道具
6. `list_organizations` — 获取所有组织
7. `list_nodes` — 获取知识图谱全部节点
8. `get_plot_overview` — 获取剧情全貌（故事线 + 事件）
9. `analyze_plot_structure` — 获取剧情结构诊断

#### Step 2：快速识别问题信号

根据全局数据，标记以下异常信号：

- 章节编号不连续或有跳跃
- 角色/场景/道具数量与章节数量严重不匹配（如 50 章只有 2 个角色）
- 剧情事件数为 0 或极少
- `analyze_plot_structure` 返回的 suggestions 不为空
- 存在待回收伏笔（pendingForeshadows > 0）
- 知识图谱节点数远少于或远多于已注册实体数

---

### 二、角色一致性审查

#### 2.1 角色属性矛盾检查

**流程**：
```
list_characters → 逐个 get_character_detail → fulltext_search(角色名) → 比对属性
```

**检查要点**：

| 检查项 | 方法 | 问题示例 |
|--------|------|---------|
| 姓名一致性 | `fulltext_search` 搜索角色名的不同写法 | "李明"有时写成"黎明" |
| 外貌矛盾 | 搜索外貌关键词，对比 character detail | 第3章"黑发"，第15章"金发"（无染发情节） |
| 年龄矛盾 | 搜索年龄相关描述 | 第1章"20岁"，第5章（1年后）"25岁" |
| 能力矛盾 | 搜索能力/技能关键词 | 已失去某能力后仍在使用 |
| 身份矛盾 | 搜索身份/职业相关描述 | 已辞职但后文仍以旧身份出场 |

**步骤**：

**Step 1**：调用 `list_characters` 获取角色列表

**Step 2**：对每个重要角色调用 `get_character_detail` 获取注册属性

**Step 3**：对每个角色调用 `fulltext_search(角色名)` 查看出现的所有章节

**Step 4**：对可疑章节调用 `get_chapter_content` 或 `search_in_chapter` 深入检查

**Step 5**：比对注册属性与正文描述，记录矛盾

#### 2.2 角色动态信息审查

**流程**：
```
list_characters → query_character_current_state → 比对章节内容
```

**检查要点**：
- 角色的动态信息是否与最新章节内容一致
- 是否有重要变化遗漏记录
- 动态信息关联的章节是否正确

---

### 三、剧情一致性审查

#### 3.1 事件逻辑检查

**流程**：
```
get_plot_overview → 按故事线分组分析事件序列
```

**检查要点**：

| 检查项 | 方法 | 问题示例 |
|--------|------|---------|
| 因果顺序 | 检查事件的 story_time_order 排列 | 结果事件排在原因事件之前 |
| 事件类型分布 | 检查 analyze_plot_structure 的 typeDistribution | 长篇小说无转折点或高潮 |
| 故事线完整性 | 检查每条故事线的事件覆盖 | 某故事线只有开头没有后续 |
| 章节关联 | 检查事件的 chapter_id 是否有效 | 关联的章节已被删除 |

**步骤**：

**Step 1**：调用 `get_plot_overview` 获取所有事件

**Step 2**：按故事线分组，检查每组事件的逻辑顺序

**Step 3**：调用 `analyze_plot_structure`，重点关注 suggestions 和各项统计

**Step 4**：对可疑事件，调用对应章节内容进行验证

#### 3.2 伏笔闭环检查

**流程**：
```
list_pending_foreshadows → 逐个 get_foreshadow_detail → 评估回收紧迫性
```

**检查要点**：
- 所有 planted 状态的伏笔是否有回收计划
- 已回收伏笔的回收章节是否合理（不能在埋设之前回收）
- 伏笔密度是否合理（过多未回收伏笔会让读者遗忘）

**步骤**：

**Step 1**：调用 `list_pending_foreshadows` 获取待回收伏笔清单

**Step 2**：对每个伏笔调用 `get_foreshadow_detail` 查看详情

**Step 3**：评估每个伏笔的紧迫程度：
- 紧急：伏笔埋设超过 10 章仍未回收
- 注意：伏笔埋设超过 5 章未回收
- 正常：刚埋设的伏笔

---

### 四、章节一致性审查

#### 4.1 章节编号与结构检查

**流程**：
```
list_chapters → 检查编号连续性和结构完整性
```

**检查要点**：

| 检查项 | 方法 | 问题示例 |
|--------|------|---------|
| 编号连续性 | 检查 volume_number 和 chapter_number | 第3章后直接跳到第5章 |
| 标题重复 | 检查是否有相同标题 | 两个章节都叫"新的开始" |
| 空章节 | 检查字数为 0 的章节 | 有大纲但无正文的章节 |

#### 4.2 章节实体关联检查

**流程**：
```
list_chapters → 逐章 get_chapter_content → 比对参与实体与正文内容
```

**检查要点**：
- 正文中提到的角色是否都在参与实体列表中
- 参与实体列表中的角色是否真的在正文中出现
- 场景、道具、组织同理

**步骤**：

**Step 1**：调用 `list_chapters` 获取章节列表

**Step 2**：对每章调用 `get_chapter_content` 获取正文和参与实体

**Step 3**：用 `search_in_chapter` 搜索每个已注册角色/场景/道具名称是否出现在正文中

**Step 4**：记录不匹配的情况：
- **遗漏关联**：正文提到但未在参与实体中
- **多余关联**：参与实体中有但正文未提及

#### 4.3 大纲与正文一致性检查

**流程**：
```
list_chapters → 逐章对比 get_chapter_outline 和 get_chapter_content
```

**检查要点**：
- 大纲中规划的关键情节是否在正文中实现
- 正文是否偏离大纲的核心方向
- 大纲中提到的角色是否都在正文中出场

---

### 五、关系图谱一致性审查

#### 5.1 节点完整性检查

**流程**：
```
list_nodes → 对比 list_characters / list_scenes / list_props / list_organizations
```

**检查要点**：

| 检查项 | 方法 | 问题示例 |
|--------|------|---------|
| 遗漏节点 | 对比实体列表和节点列表 | 已注册角色未出现在图谱中 |
| 孤立节点 | 检查 relationCount = 0 的节点 | 某节点无任何关系连接 |
| 类别错误 | 比对节点 category 与实体实际类型 | 角色被错误标记为 prop |

**步骤**：

**Step 1**：调用 `list_nodes` 获取所有节点

**Step 2**：分别调用 `list_characters`、`list_scenes`、`list_props`、`list_organizations`

**Step 3**：交叉比对，找出：
- 实体存在但图谱中无对应节点
- 图谱节点存在但无对应实体（concept 类型除外）
- 关系数为 0 的非概念节点（可能遗漏了关系建立）

#### 5.2 关系矛盾检查

**流程**：
```
query_character_relations → 逐条分析关系逻辑
```

**检查要点**：
- **方向矛盾**：A→师父→B 同时 B→师父→A
- **类型矛盾**：A→朋友→B 同时 A→敌人→B（除非有剧情转变）
- **缺失对称关系**：A→朋友→B 但无 B→朋友→A（对于对称关系）
- **悬空关系**：关系指向不存在的节点

**步骤**：

**Step 1**：调用 `query_character_relations` 获取所有关系

**Step 2**：检查是否存在逻辑矛盾的关系对

**Step 3**：对可疑关系，调用 `get_node_detail` 查看相关节点的所有关系做综合判断

---

### 六、实体引用一致性审查

#### 6.1 正文引用检查

**流程**：
```
list_characters → 逐个 fulltext_search → 标记从未出现的角色
```

**检查要点**：

| 检查项 | 方法 | 问题示例 |
|--------|------|---------|
| 幽灵实体 | fulltext_search 搜索实体名 | 注册了角色但从未在正文中提及 |
| 未注册引用 | 阅读正文时注意陌生名字 | 正文中出现的角色名不在角色列表中 |
| 名称变体 | 搜索角色的别名/绰号 | 角色有多个称呼但只注册了一个 |

**步骤**：

**Step 1**：对每个已注册角色，调用 `fulltext_search(角色名)` 检查出现次数

**Step 2**：标记从未出现或仅出现 1 次的角色（可能是遗漏或多余注册）

**Step 3**：对场景、道具、组织重复同样的检查

**Step 4**：对出现频率高但未注册的名称，建议补充注册

---

### 七、审查报告格式

完成所有检查后，按以下格式输出审查报告：

#### 7.1 报告结构

```
## 一致性审查报告

### 审查概况
- 小说：{小说名}
- 章节数：{N}
- 角色数：{N}
- 审查时间：{时间}

### 🔴 严重矛盾（必须修复）
1. [矛盾描述]
   - 来源：[章节名/工具数据]
   - 建议修复方式：[具体操作]

### 🟡 轻微不一致（建议修复）
1. [不一致描述]
   - 来源：[章节名/工具数据]
   - 建议修复方式：[具体操作]

### 🔵 优化建议
1. [建议描述]

### 统计摘要
- 严重矛盾：N 处
- 轻微不一致：N 处
- 优化建议：N 条
```

#### 7.2 严重程度分级标准

| 级别 | 标准 | 示例 |
|------|------|------|
| 🔴 严重 | 读者能直接发现的逻辑矛盾 | 角色已死亡但后文复活（无相关情节）、时间线前后矛盾 |
| 🟡 轻微 | 仔细阅读才能发现的小问题 | 参与实体列表遗漏、某章节角色称呼不统一 |
| 🔵 建议 | 不影响阅读但可以优化的项目 | 伏笔长期未回收、孤立图谱节点、空章节 |

---

### 八、按需深入审查

全局扫描完成后，可以根据用户需求进行专项深入审查：

#### 8.1 单角色深度审查

```
get_character_detail(角色名) → fulltext_search(角色名) → 逐章 search_in_chapter → query_character_current_state(角色名) → get_node_detail(角色名)
```

逐章追踪该角色的出场、属性描述、关系变化、动态状态。

#### 8.2 单章节深度审查

```
get_chapter_content(章节) → get_chapter_outline(章节) → 逐个搜索参与实体 → 检查剧情事件关联
```

全面检查该章节的内容与各系统的数据是否一致。

#### 8.3 时间线专项审查

```
get_plot_overview → 按 story_time_order 排列事件 → 逐事件验证时间逻辑
```

专注于事件的时间先后顺序是否合理。

---

### 九、工具速查表

#### 查询工具（审查阶段使用）

| 工具名 | 用途 |
|--------|------|
| `get_novel_overview` | 小说基本信息 |
| `list_chapters` | 章节列表 |
| `get_chapter_content` | 章节正文和参与实体 |
| `get_chapter_outline` | 章节大纲 |
| `get_chapter_statistics` | 章节统计（字数等） |
| `search_across_chapters` | 跨章节搜索 |
| `search_in_chapter` | 单章节内搜索 |
| `fulltext_search` | 全文搜索（大纲+正文） |
| `list_characters` | 角色列表 |
| `get_character_detail` | 角色详情 |
| `list_scenes` | 场景列表 |
| `list_props` | 道具列表 |
| `list_organizations` | 组织列表 |
| `list_nodes` | 图谱节点列表 |
| `get_node_detail` | 节点详情和关系 |
| `query_character_relations` | 角色关系查询 |
| `query_character_current_state` | 角色当前动态状态 |
| `get_plot_overview` | 剧情概览 |
| `analyze_plot_structure` | 剧情结构分析 |
| `list_pending_foreshadows` | 待回收伏笔 |
| `get_foreshadow_detail` | 伏笔详情 |
| `get_field_dynamic_info` | 字段动态信息 |

#### 修复工具（用户确认后使用）

| 工具名 | 用途 |
|--------|------|
| `update_character` | 修正角色属性 |
| `update_chapter_entities` | 修正章节参与实体 |
| `create_relation` / `update_relation` / `delete_relation` | 修正关系图谱 |
| `update_node` | 修正节点信息 |
| `resolve_foreshadow` | 标记伏笔已回收 |
| `update_field_dynamic_info` | 补充动态信息 |
| `update_story_line` | 修正故事线信息 |',
  '## Consistency Audit Skill

This skill guides you through a systematic consistency check of the novel, identifying contradictions and omissions in character attributes, plot logic, chapter references, relationship graphs, and more, and provides fix suggestions.

---

### Core Principles

1. **Read-only first**: During the audit phase, only use query tools to collect information; do not proactively execute modifications
2. **Evidence-driven**: Every issue must cite a specific source (chapter name, tool return data, etc.)
3. **Graded reporting**: Categorize by severity (critical contradiction / minor inconsistency / optimization suggestion)
4. **Drill down as needed**: Start with a global scan, then deep-dive into discovered issues
5. **Fixes are optional**: List all issues first, then let the user decide whether to execute fixes

---

### Audit Dimensions Overview

| Dimension | What to Check | Core Tools |
|-----------|--------------|------------|
| **Character consistency** | Attribute contradictions, name variations, behavioral logic | `list_characters`, `get_character_detail`, `fulltext_search` |
| **Plot consistency** | Event order, causal logic, foreshadow closure | `get_plot_overview`, `analyze_plot_structure`, `list_pending_foreshadows` |
| **Chapter consistency** | Entity associations, numbering continuity, outline vs. body alignment | `list_chapters`, `get_chapter_content`, `get_chapter_outline`, `get_chapter_statistics` |
| **Relationship graph consistency** | Orphan nodes, contradictory relations, missing relations | `list_nodes`, `get_node_detail`, `query_character_relations` |
| **Entity reference consistency** | Mentioned in text but unregistered, registered but never mentioned | `fulltext_search`, `search_across_chapters`, `list_characters`, `list_scenes` |
| **Dynamic info consistency** | Whether state changes match chapter content | `get_field_dynamic_info`, `query_character_current_state` |

---

### Section 1: Global Scan (Required)

Every consistency audit must begin with a global scan to establish a baseline:

#### Step 1: Collect Global Data

Call the following tools in order:

1. `get_novel_overview` — Understand the novel''s basic structure
2. `list_chapters` — Get the full chapter list (numbering, titles, word counts)
3. `list_characters` — Get all characters
4. `list_scenes` — Get all scenes
5. `list_props` — Get all props
6. `list_organizations` — Get all organizations
7. `list_nodes` — Get all knowledge graph nodes
8. `get_plot_overview` — Get the full plot picture (story lines + events)
9. `analyze_plot_structure` — Get plot structure diagnostics

#### Step 2: Quick Anomaly Detection

Based on the global data, flag the following anomaly signals:

- Chapter numbering is non-consecutive or has gaps
- Character/scene/prop count is severely mismatched with chapter count (e.g., 50 chapters but only 2 characters)
- Plot event count is 0 or very low
- `analyze_plot_structure` returned non-empty suggestions
- There are pending foreshadows (pendingForeshadows > 0)
- Knowledge graph node count is far less than or far more than the number of registered entities

---

### Section 2: Character Consistency Audit

#### 2.1 Character Attribute Contradiction Check

**Flow**:
```
list_characters → get_character_detail for each → fulltext_search(character name) → compare attributes
```

**Check points**:

| Check Item | Method | Example Issue |
|------------|--------|---------------|
| Name consistency | `fulltext_search` for different spellings | "Li Ming" sometimes written as "Li Min" |
| Appearance contradiction | Search appearance keywords, compare with character detail | Chapter 3: "black hair", Chapter 15: "blonde hair" (no dyeing scene) |
| Age contradiction | Search age-related descriptions | Chapter 1: "20 years old", Chapter 5 (1 year later): "25 years old" |
| Ability contradiction | Search ability/skill keywords | Still using an ability that was already lost |
| Identity contradiction | Search identity/profession descriptions | Already resigned but still appearing in old role |

**Steps**:

**Step 1**: Call `list_characters` to get the character list

**Step 2**: Call `get_character_detail` for each important character to get registered attributes

**Step 3**: Call `fulltext_search(character name)` for each character to see all chapters where they appear

**Step 4**: Call `get_chapter_content` or `search_in_chapter` for suspicious chapters to deep-dive

**Step 5**: Compare registered attributes with text descriptions, record contradictions

#### 2.2 Character Dynamic Info Audit

**Flow**:
```
list_characters → query_character_current_state → compare with chapter content
```

**Check points**:
- Whether a character''s dynamic info matches the latest chapter content
- Whether important changes are missing from the records
- Whether dynamic info is linked to the correct chapter

---

### Section 3: Plot Consistency Audit

#### 3.1 Event Logic Check

**Flow**:
```
get_plot_overview → group events by story line → analyze event sequences
```

**Check points**:

| Check Item | Method | Example Issue |
|------------|--------|---------------|
| Causal order | Check events'' story_time_order | Result event ordered before cause event |
| Event type distribution | Check analyze_plot_structure typeDistribution | Long novel with no turning points or climax |
| Story line completeness | Check event coverage per story line | A story line has only a beginning with no follow-up |
| Chapter association | Check whether event chapter_id is valid | Associated chapter has been deleted |

**Steps**:

**Step 1**: Call `get_plot_overview` to get all events

**Step 2**: Group by story line and check logical order within each group

**Step 3**: Call `analyze_plot_structure`, focus on suggestions and statistics

**Step 4**: For suspicious events, verify against chapter content

#### 3.2 Foreshadow Closure Check

**Flow**:
```
list_pending_foreshadows → get_foreshadow_detail for each → assess resolution urgency
```

**Check points**:
- Whether all planted foreshadows have a resolution plan
- Whether resolved foreshadows have a reasonable resolution chapter (cannot be resolved before planting)
- Whether foreshadow density is reasonable (too many unresolved foreshadows will make readers forget)

**Steps**:

**Step 1**: Call `list_pending_foreshadows` to get the list of pending foreshadows

**Step 2**: Call `get_foreshadow_detail` for each foreshadow

**Step 3**: Assess urgency for each foreshadow:
- Urgent: Foreshadow planted more than 10 chapters ago and still unresolved
- Warning: Foreshadow planted more than 5 chapters ago and unresolved
- Normal: Recently planted foreshadow

---

### Section 4: Chapter Consistency Audit

#### 4.1 Chapter Numbering and Structure Check

**Flow**:
```
list_chapters → check numbering continuity and structural completeness
```

**Check points**:

| Check Item | Method | Example Issue |
|------------|--------|---------------|
| Numbering continuity | Check volume_number and chapter_number | Chapter 3 jumps directly to Chapter 5 |
| Duplicate titles | Check for identical titles | Two chapters both titled "A New Beginning" |
| Empty chapters | Check for chapters with 0 word count | Chapters with outlines but no body text |

#### 4.2 Chapter Entity Association Check

**Flow**:
```
list_chapters → get_chapter_content for each → compare participating entities with body text
```

**Check points**:
- Whether characters mentioned in the body text are all in the participating entities list
- Whether characters in the participating entities list actually appear in the body text
- Same applies for scenes, props, and organizations

**Steps**:

**Step 1**: Call `list_chapters` to get the chapter list

**Step 2**: Call `get_chapter_content` for each chapter to get body text and participating entities

**Step 3**: Use `search_in_chapter` to search for each registered character/scene/prop name in the body text

**Step 4**: Record mismatches:
- **Missing association**: Mentioned in text but not in participating entities
- **Excess association**: In participating entities but not mentioned in text

#### 4.3 Outline vs. Body Text Consistency Check

**Flow**:
```
list_chapters → compare get_chapter_outline and get_chapter_content for each
```

**Check points**:
- Whether key plot points planned in the outline are implemented in the body text
- Whether the body text deviates from the outline''s core direction
- Whether characters mentioned in the outline all appear in the body text

---

### Section 5: Relationship Graph Consistency Audit

#### 5.1 Node Completeness Check

**Flow**:
```
list_nodes → compare with list_characters / list_scenes / list_props / list_organizations
```

**Check points**:

| Check Item | Method | Example Issue |
|------------|--------|---------------|
| Missing nodes | Compare entity lists with node list | A registered character is missing from the graph |
| Orphan nodes | Check nodes with relationCount = 0 | A node with no relations at all |
| Category error | Compare node category with actual entity type | A character incorrectly labeled as prop |

**Steps**:

**Step 1**: Call `list_nodes` to get all nodes

**Step 2**: Call `list_characters`, `list_scenes`, `list_props`, `list_organizations` separately

**Step 3**: Cross-compare to find:
- Entities that exist but have no corresponding graph node
- Graph nodes that exist but have no corresponding entity (except concept type)
- Non-concept nodes with 0 relations (may have missed establishing relations)

#### 5.2 Relation Contradiction Check

**Flow**:
```
query_character_relations → analyze each relation''s logic
```

**Check points**:
- **Direction contradiction**: A→master→B and B→master→A simultaneously
- **Type contradiction**: A→friend→B and A→enemy→B simultaneously (unless there''s a plot transition)
- **Missing symmetric relation**: A→friend→B but no B→friend→A (for symmetric relations)
- **Dangling relation**: Relation pointing to a non-existent node

**Steps**:

**Step 1**: Call `query_character_relations` to get all relations

**Step 2**: Check for logically contradictory relation pairs

**Step 3**: For suspicious relations, call `get_node_detail` to view all relations of related nodes for comprehensive assessment

---

### Section 6: Entity Reference Consistency Audit

#### 6.1 Text Reference Check

**Flow**:
```
list_characters → fulltext_search for each → flag never-mentioned characters
```

**Check points**:

| Check Item | Method | Example Issue |
|------------|--------|---------------|
| Ghost entities | fulltext_search for entity names | A registered character never mentioned in text |
| Unregistered references | Look for unfamiliar names while reading text | A character name appears in text but not in the character list |
| Name variants | Search for character aliases/nicknames | A character has multiple names but only one is registered |

**Steps**:

**Step 1**: For each registered character, call `fulltext_search(character name)` to check occurrence count

**Step 2**: Flag characters that never appear or appear only once (may be an omission or unnecessary registration)

**Step 3**: Repeat the same check for scenes, props, and organizations

**Step 4**: For high-frequency names that are not registered, suggest adding registration

---

### Section 7: Audit Report Format

After completing all checks, output the audit report in the following format:

#### 7.1 Report Structure

```
## Consistency Audit Report

### Audit Summary
- Novel: {novel name}
- Chapters: {N}
- Characters: {N}
- Audit time: {time}

### 🔴 Critical Contradictions (Must Fix)
1. [Contradiction description]
   - Source: [chapter name / tool data]
   - Suggested fix: [specific action]

### 🟡 Minor Inconsistencies (Recommended Fix)
1. [Inconsistency description]
   - Source: [chapter name / tool data]
   - Suggested fix: [specific action]

### 🔵 Optimization Suggestions
1. [Suggestion description]

### Statistics
- Critical contradictions: N
- Minor inconsistencies: N
- Optimization suggestions: N
```

#### 7.2 Severity Grading Criteria

| Level | Criteria | Examples |
|-------|----------|----------|
| 🔴 Critical | Logical contradictions readers can directly spot | Character already dead but reappears later (no related plot), timeline contradiction |
| 🟡 Minor | Small issues only noticeable on careful reading | Missing entity associations, inconsistent character naming in a chapter |
| 🔵 Suggestion | Items that don''t affect reading but can be improved | Long-unresolved foreshadows, orphan graph nodes, empty chapters |

---

### Section 8: On-Demand Deep Audits

After the global scan, you can perform specialized deep audits based on user needs:

#### 8.1 Single Character Deep Audit

```
get_character_detail(name) → fulltext_search(name) → search_in_chapter per chapter → query_character_current_state(name) → get_node_detail(name)
```

Track the character''s appearances, attribute descriptions, relationship changes, and dynamic states chapter by chapter.

#### 8.2 Single Chapter Deep Audit

```
get_chapter_content(chapter) → get_chapter_outline(chapter) → search for each participating entity → check plot event associations
```

Comprehensively check whether the chapter''s content is consistent with data across all systems.

#### 8.3 Timeline Specialized Audit

```
get_plot_overview → sort events by story_time_order → verify temporal logic event by event
```

Focus exclusively on whether the chronological order of events is logical.

---

### Section 9: Tool Quick Reference

#### Query Tools (Audit Phase)

| Tool Name | Purpose |
|-----------|---------|
| `get_novel_overview` | Novel basic info |
| `list_chapters` | Chapter list |
| `get_chapter_content` | Chapter body text and participating entities |
| `get_chapter_outline` | Chapter outline |
| `get_chapter_statistics` | Chapter statistics (word count, etc.) |
| `search_across_chapters` | Cross-chapter search |
| `search_in_chapter` | Single chapter search |
| `fulltext_search` | Full-text search (outline + body) |
| `list_characters` | Character list |
| `get_character_detail` | Character details |
| `list_scenes` | Scene list |
| `list_props` | Prop list |
| `list_organizations` | Organization list |
| `list_nodes` | Graph node list |
| `get_node_detail` | Node details and relations |
| `query_character_relations` | Character relation query |
| `query_character_current_state` | Character current dynamic state |
| `get_plot_overview` | Plot overview |
| `analyze_plot_structure` | Plot structure analysis |
| `list_pending_foreshadows` | Pending foreshadows |
| `get_foreshadow_detail` | Foreshadow details |
| `get_field_dynamic_info` | Field dynamic info |

#### Fix Tools (Use After User Confirmation)

| Tool Name | Purpose |
|-----------|---------|
| `update_character` | Fix character attributes |
| `update_chapter_entities` | Fix chapter entity associations |
| `create_relation` / `update_relation` / `delete_relation` | Fix relationship graph |
| `update_node` | Fix node info |
| `resolve_foreshadow` | Mark foreshadow as resolved |
| `update_field_dynamic_info` | Supplement dynamic info |
| `update_story_line` | Fix story line info |',
  NULL,
  1,
  70,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  is_active = VALUES(is_active),
  sort_order = VALUES(sort_order);
