-- 未来科幻穿越创作方法「科技与设定」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '未来科幻穿越创作' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-scifi-crossing-tech-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'scifi-crossing-tech-setting-gen',
  '「科技与设定」设定生成：为未来科幻穿越小说生成科技与设定条目，涵盖名称、类别、原理/设定、功能/影响',
  '"Technology & Setting" setting generation: generate technology and setting entries for future sci-fi crossing novels, covering name, category, principle/setting, and function/impact',
  '## 「科技与设定」设定生成 — 未来科幻穿越创作

「科技与设定」是本创作方法的**自定义实体类型**，属于 technology 类别。它是**非 singleton 的**——你可以创建多个条目来构建完整的「科技圣经」。每个条目包含四个字段：名称、类别、原理/设定、功能/影响。

**为什么需要这个模块**：科幻小说的世界观严重依赖科技设定的一致性。将每项关键科技/设定独立建档，可以避免前后矛盾、为剧情冲突提供素材库、帮助维护硬科幻的逻辑严谨性，并在写作过程中快速查阅参考。

---

### 字段生成指南

#### 名称

给每项科技/设定一个简洁明确的名字。命名要求：
- 名称应能让读者直观理解这是什么
- 核心科技条目可以使用专业术语
- 衍生科技条目应体现与核心科技的关系
- 历史事件条目应包含时间或关键词

#### 类别

共 6 种可选类别：

| 类别 | 说明 | 示例 |
|------|------|------|
| **武器装备** | 战斗相关的科技 | 等离子步枪、纳米护盾、义体战斗模块 |
| **交通载具** | 移动和运输科技 | 反重力悬浮车、曲率引擎飞船、传送门 |
| **生物科技** | 与生命相关的科技 | 基因编辑疗法、意识备份、克隆技术 |
| **信息技术** | 数据和通信科技 | 脑机接口、量子通信、全息投影 |
| **理论概念** | 科学理论和假说 | 暗物质引擎原理、意识量子化理论 |
| **历史事件** | 影响世界格局的重大事件 | 第三次世界大战、AI 觉醒事件、首次星际接触 |

**选择要点**：一个条目只能属于一个类别。如果一项科技跨越多个类别（如既是武器又是交通工具），选择其在故事中最主要的用途对应的类别。

#### 原理/设定

描述这项科技/设定的运作方式或背景。硬科幻需要详细的技术原理；软科幻可以用模糊但自洽的描述。

**硬科幻写法**：
- 说明科学基础（基于什么已知理论的推演）
- 描述技术实现路径
- 注明能力边界和局限

**软科幻写法**：
- 用通俗语言描述运作效果
- 保持模糊但不自相矛盾
- 重点放在对角色和社会的影响而非技术细节

**历史事件写法**：
- 描述事件的起因、经过、结果
- 注明对当前世界格局的影响
- 关联相关的科技条目

#### 功能/影响

这项科技对世界和角色的具体影响。务必思考两个方面：

**直接功能**：它能做什么
- 具体的能力表现
- 使用条件和限制
- 与其他科技的协同或冲突

**社会影响**：它如何改变了社会、经济、伦理或日常生活
- 对社会结构的影响（谁受益，谁受损）
- 对日常生活的改变
- 引发的伦理争议
- 对穿越者的特殊影响（穿越者如何看待和应对这项科技）

**重要检验标准**：如果「社会影响」写不出东西，说明这项设定是多余的——每项科幻设定都必须至少在一个关键剧情中发挥作用。

---

### 构建科技圣经的推荐流程

按以下顺序创建条目，确保科技体系层层递进、逻辑自洽：

**第一步：从核心科技出发**
根据科幻世界观中的「核心科技」字段，创建 3-5 个核心科技条目。这些是整个科技体系的基石。

**第二步：推导衍生科技**
每项核心科技都会催生衍生应用，创建次级条目。示例：
```
核心科技：意识上传
  |-- 衍生 - 信息技术：意识云存储网络
  |-- 衍生 - 生物科技：意识载体克隆技术
  |-- 衍生 - 理论概念：意识连续性悖论
  |-- 衍生 - 历史事件：第一例意识上传实验（公元 2187 年）
  |-- 剧情相关 - 武器装备：意识病毒（可以攻击上传意识）
```

**第三步：补充历史事件**
创建那些塑造了当前世界格局的重大事件。历史事件是连接科技设定与世界现状的桥梁。

**第四步：添加对剧情有影响的特定科技**
主角会使用或遭遇的具体科技。这些条目直接服务于剧情需要。

**第五步：交叉验证**
检查所有科技条目之间是否存在逻辑矛盾。使用以下检查清单：

- 核心科技之间是否存在矛盾？（如：有了传送门，为什么还需要飞船？）
- 文明等级与科技水平是否匹配？（1 级文明不应拥有星系级科技）
- 能源体系是否能支撑所列出的科技？
- 科技发展的时间线是否合理？（历史事件之间的因果关系）
- 穿越者的金手指是否在科技体系内可解释？

---

### 「一个谎言」原则

优秀的科幻遵循「一个谎言」原则——你可以假设一项不存在的科技（如超光速旅行），但从这项假设出发的所有推论必须严格合理。

实践方法：
- 确定你的「一个谎言」是什么（通常是核心科技中最基础的那项）
- 从这个假设出发，严格推演所有衍生科技
- 每个条目的「原理/设定」都应该能追溯到这个基础假设
- 如果某项科技需要第二个「谎言」来解释，考虑是否必要

### 科学一致性检查清单

完成所有条目后，进行以下检查：

- [ ] 核心科技之间是否存在矛盾
- [ ] 文明等级与核心科技是否匹配
- [ ] 社会形态是否合理反映了核心科技的影响
- [ ] 能源体系是否能支撑所列出的科技
- [ ] 穿越者的金手指是否在科技体系内可解释
- [ ] 每项科技的功能/影响中「社会影响」是否非空
- [ ] 历史事件之间的因果关系是否合理
- [ ] 科技设定是否避免了「科幻设定沦为装饰」的陷阱

---

### 生成注意事项

1. 条目数量建议：至少 5 个条目构成基本科技体系，推荐 8-12 个条目构建完整科技圣经
2. 类别分布建议：确保六种类别都有覆盖，尤其不要遗漏「历史事件」和「理论概念」
3. 每个条目的「功能/影响」必须包含社会影响维度，否则该条目可能是多余的
4. 所有条目必须与科幻世界观中的核心科技、文明等级、能源体系保持一致
5. 硬科幻和软科幻对「原理/设定」字段的详细程度要求不同，但都不能自相矛盾
6. 穿越者与每项科技的关系值得思考——哪些科技对穿越者构成威胁，哪些可以被穿越者利用',
  '## "Technology & Setting" Generation — Sci-Fi Crossing Creation

"Technology & Setting" (科技与设定) is this creation method''s **custom entity type**, belonging to the technology category. It is **non-singleton** — you can create multiple entries to build a complete "tech bible." Each entry contains four fields: name, category, principle/setting, and function/impact.

**Why this module exists**: Sci-fi novel worldviews depend heavily on technological consistency. Documenting each key technology/setting as an independent entry helps avoid contradictions, builds a material library for plot conflicts, maintains hard sci-fi logical rigor, and provides quick reference during writing.

---

### Field Generation Guide

#### Name (名称)

Give each tech/setting a concise, clear name. Requirements:
- The name should let readers intuitively understand what it is
- Core tech entries can use professional terminology
- Derivative tech entries should reflect the relationship with core tech
- Historical event entries should include a time or keyword

#### Category (类别)

Six options available:

| Category | Description | Examples |
|----------|-------------|---------|
| **Weapons & Equipment** (武器装备) | Combat-related technology | Plasma rifle, nano-shield, prosthetic combat module |
| **Vehicles** (交通载具) | Movement and transport tech | Anti-gravity hover car, warp-drive ship, teleportation gate |
| **Biotechnology** (生物科技) | Life-related technology | Gene editing therapy, consciousness backup, cloning |
| **Information Technology** (信息技术) | Data and communication tech | Brain-computer interface, quantum communication, holographic projection |
| **Theoretical Concepts** (理论概念) | Scientific theories and hypotheses | Dark matter engine principles, consciousness quantization theory |
| **Historical Events** (历史事件) | World-shaping major events | World War III, AI Awakening Event, First Interstellar Contact |

**Selection tip**: Each entry belongs to one category only. If a technology spans multiple categories (e.g., both weapon and vehicle), choose the category matching its primary role in the story.

#### Principle/Setting (原理/设定)

Describes how the technology works or its background. Hard sci-fi requires detailed technical principles; soft sci-fi can use vague but consistent descriptions.

**Hard sci-fi approach**:
- State the scientific basis (what known theory it extrapolates from)
- Describe the technical implementation path
- Note capability boundaries and limitations

**Soft sci-fi approach**:
- Describe operational effects in plain language
- Stay vague but never self-contradictory
- Focus on impact on characters and society rather than technical detail

**Historical event approach**:
- Describe the event''s cause, progression, and outcome
- Note its impact on the current world order
- Link to related technology entries

#### Function/Impact (功能/影响)

The technology''s concrete impact on the world and characters. Consider two aspects:

**Direct function**: What it can do
- Specific capability manifestations
- Usage conditions and limitations
- Synergies or conflicts with other technologies

**Social impact**: How it changed society, economy, ethics, or daily life
- Impact on social structure (who benefits, who suffers)
- Changes to daily life
- Ethical controversies sparked
- Special impact on the crosser (how the crosser perceives and responds to this technology)

**Critical test**: If "social impact" comes up empty, the setting is superfluous — every sci-fi setting must play a role in at least one key plot point.

---

### Recommended Process for Building the Tech Bible

Create entries in this order to ensure the tech system builds progressively with logical consistency:

**Step 1: Start from core tech**
Based on the 核心科技 field in the sci-fi worldview, create 3-5 core technology entries. These are the cornerstones of the entire tech system.

**Step 2: Derive secondary tech**
Each core technology spawns derivative applications; create sub-entries. Example:
```
Core tech: Consciousness Uploading
  |-- Derivative - IT: Consciousness Cloud Storage Network
  |-- Derivative - Biotech: Consciousness Vessel Cloning
  |-- Derivative - Theory: Consciousness Continuity Paradox
  |-- Derivative - Historical: First Consciousness Upload Experiment (2187 CE)
  |-- Plot-relevant - Weapon: Consciousness Virus (attacks uploaded minds)
```

**Step 3: Add historical events**
Create entries for major events that shaped the current world order. Historical events bridge tech settings and the present world state.

**Step 4: Add plot-relevant specific tech**
Specific technologies the protagonist will use or encounter. These entries directly serve plot needs.

**Step 5: Cross-verify**
Check all tech entries for logical contradictions using this checklist:

- Are there contradictions between core technologies? (e.g., if teleportation gates exist, why are ships still needed?)
- Does civilization level match technology level? (Level 1 civilization should not possess galactic-level tech)
- Can the energy system support the listed technologies?
- Is the technology development timeline plausible? (causal relationships between historical events)
- Is the crosser''s cheat-ability explainable within the tech system?

---

### The "One Lie" Principle

Great sci-fi follows the "one lie" principle — you can assume one nonexistent technology (like faster-than-light travel), but all deductions from that assumption must be rigorously logical.

In practice:
- Identify what your "one lie" is (usually the most fundamental core technology)
- From that assumption, rigorously derive all secondary technologies
- Every entry''s 原理/设定 should be traceable to this foundational assumption
- If a technology requires a second "lie" to explain, consider whether it''s necessary

### Science Consistency Checklist

After completing all entries, perform these checks:

- [ ] No contradictions between core technologies
- [ ] Civilization level matches core technologies
- [ ] Social structure reasonably reflects core technology''s impact
- [ ] Energy system can support the listed technologies
- [ ] Crosser''s cheat-ability is explainable within the tech system
- [ ] Every technology''s function/impact includes a non-empty social impact dimension
- [ ] Causal relationships between historical events are plausible
- [ ] Tech settings avoid the "sci-fi as mere decoration" pitfall

---

### Generation Notes

1. Recommended entry count: at least 5 entries for a basic tech system; 8-12 entries for a complete tech bible
2. Category distribution: ensure all six categories are covered, especially don''t omit "historical events" and "theoretical concepts"
3. Every entry''s function/impact must include a social impact dimension; otherwise the entry may be superfluous
4. All entries must be consistent with the worldview''s core technology, civilization level, and energy system
5. Hard sci-fi and soft sci-fi have different detail requirements for the principle/setting field, but neither can self-contradict
6. Consider the crosser''s relationship with each technology — which technologies threaten the crosser, which can be leveraged',
  (SELECT id FROM novel_creation_method WHERE name = '未来科幻穿越创作' LIMIT 1),
  1,
  62,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  novel_creation_method_id = VALUES(novel_creation_method_id),
  is_active = VALUES(is_active),
  sort_order = VALUES(sort_order);
