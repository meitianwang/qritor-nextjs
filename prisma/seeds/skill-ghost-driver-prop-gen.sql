-- 灵异司机职业流小说 - 道具生成技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-ghost-driver-prop-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ghost-driver-prop-gen',
  '道具生成：为灵异司机职业流小说设计有能力边界与代价的公交装备升级体系',
  'Prop generation: design bus equipment and upgrade items with clear capability limits and costs for ghost bus novels',
  '## 道具生成 — 灵异司机职业流小说

公交装备是灵异司机职业流的核心成长系统。好的装备设计遵循一个核心原则：**装备是对现有问题的解决方案，不是万能钥匙**。每件装备解决一类具体问题，同时引入一个新的局限或代价，让升级系统保持持续的动力和张力。

---

### 装备体系概览

公交装备分为两个维度：

**按安装位置**：
- 车体外部（防护/冲撞类）
- 车内设施（环境/隔离类）
- 驾驶区（司机专属工具类）
- 随身道具（司机个人携带）

**按功能类型（即装备类型 enum）**：
- **被动防护**：持续发挥作用，不需要主动使用
- **主动防护**：需要在特定时机触发，有使用次数或冷却
- **威慑/震慑**：让某类存在不敢靠近或行动，但不能消灭
- **信息获取**：帮助司机知道更多（乘客背景/今晚风险/危险来源）
- **关系工具**：用于与特定存在谈判、安抚或交换
- **驾驶增强**：提升车辆本身的某种性能（速度/稳定性/在阴间的适应性）
- **特殊道具**：不属于上述分类的独特物件，功能可能不完全已知

---

### 字段生成指南

#### 装备名称

**命名原则**：

- **公交改装类**：用真实零件/改装的命名逻辑，加上用途修饰词
  - 好：「加固型驾驶室隔板」「特制后视镜涂层」「驱邪玻璃贴膜」
  - 差：「神圣护盾」「灵魂隔离罩」（太玄幻，失去职业感）

- **随身道具类**：日常物品的特殊化，强调材质/来源
  - 好：「老黄历（1987年版，标注了特殊时日）」「前任司机留下的铜哨」
  - 差：「神圣法器」「上古符印」（普通日常物品名称更有代入感）

- **消耗品类**：强调用量/批次概念（像正常采购）
  - 好：「冥界供应站补给包（内含三张驱邪符）」「月度更换的安全镜贴」

#### 装备类型

从上述 enum 中选择一个主类型，确保「效果描述」和「代价/副作用」与类型一致。

#### 获取方式

这是装备叙事价值的来源——获取过程本身应该是一个故事：

**常见获取渠道**：

| 渠道 | 叙事特点 |
|------|---------|
| 用冥币在「供应处」购买 | 最基础，建立经济系统，价格是代价 |
| 从完成特殊任务中获得 | 任务本身是故事，道具是奖励 |
| 前任司机遗留 | 带有神秘背景，功能不完全已知 |
| 从乘客处获得（作为感谢或交换） | 与乘客关系的深化，可能带有感情色彩 |
| 自己制作/改造 | 主角能动性，但成功率和效果不确定 |
| 偶然发现 | 意外收获，但来历不明意味着风险 |

**获取方式的设计原则**：
- 越强力的装备，获取过程越复杂
- 「偶然获得」的道具总是附带未知风险
- 前任司机遗留的物品最神秘，但使用时可能触发意外

#### 效果描述

描述这件装备**实际能做什么**，要具体到「这个装备能解决什么具体情境中的什么问题」：

**好的效果描述格式**：
- 「当[特定触发条件]时，能[具体效果]，持续[时间/次数]」
- 「针对[特定存在类型]有效，让其[具体行为变化]」

**示例对比**：
- ❌「增强防护，减少鬼怪威胁」（太模糊，无法推动情节）
- ✅「防鬼玻璃涂层：针对意志强烈的执念鬼，阻止其通过玻璃向外投射影响力；对物质化存在（能接触物品的鬼）无效」

**装备要有明确边界**：写清楚「对什么有效」的同时，写清楚「对什么无效」，这样读者能理解为什么主角遇到新威胁时又需要新装备。

#### 代价/副作用

这是让升级系统保持张力的关键——没有代价的道具是破坏平衡的万能药。

**代价类型**：

| 代价类型 | 示例 | 叙事效果 |
|---------|------|---------|
| 经济代价 | 冥币消耗/定期补充费用 | 建立经济压力，驱动接班动力 |
| 副作用 | 使用后X小时内某种副反应 | 增加使用的策略性 |
| 局限性 | 只对某类有效，对其他无效 | 保留威胁来源 |
| 信号暴露 | 使用时会被某类存在「看见」 | 解决一个问题可能引发另一个 |
| 材料消耗 | 使用次数有限，需要特殊材料补充 | 稀缺感，资源管理 |
| 未知代价 | 前任司机的装备，代价不明 | 悬念，谨慎使用的动因 |

**生成要点**：至少设定一种代价，强力装备需要多种代价叠加。

#### 当前状态（isDynamic）

随故事发展更新：
- 装备当前的耐久/剩余使用次数
- 是否已发现新的使用方式或局限
- 维护/补充需求

---

### 装备生成的叙事原则

**1. 装备是问题的记录**：每件重要装备的存在都意味着主角曾经遭遇过某类问题——装备清单本身就是一部危险史。

**2. 「初始缺陷」决定前期目标**：在公交系统设定中定义的初始弱点，应该对应前三章内可以用冥币修复的装备，形成明确的短期目标。

**3. 装备升级 ≠ 越来越安全**：升级解决旧威胁，新威胁随之而来。司机能处理执念鬼了，厉鬼开始出现；有了防鬼玻璃，有什么东西开始在玻璃外面等。

**4. 前任司机的遗留物是叙事宝库**：这类道具功能未知、来历成谜，是制造悬念和揭示世界观的绝佳载体。

---

### 常见错误

- ❌ 装备效果无边界（「可以对付任何鬼」），后续无法引入新威胁
- ❌ 所有装备都通过「用冥币购买」获得，缺乏多样叙事来源
- ❌ 代价太轻（「每次使用消耗1%耐久」），读者感觉不到真正的代价
- ❌ 装备堆积太多，主角后期拥有十几件各有功能的装备，每次危机都有对应工具，失去悬念',
  'Prop Generation — Ghost Driver Paranormal Novel

Core principle: equipment is a solution to a specific problem, not a universal key. Each item solves one type of threat while introducing a new limitation or cost.

**Equipment type enum**: passive protection / active protection / deterrence / information gathering / relationship tools / driving enhancement / special item

**Naming principles**:
- Bus modifications: use realistic auto-parts naming logic ("reinforced driver partition", "anti-ghost glass coating")
- Personal items: everyday objects with specific origins ("1987 almanac with marked dates", "previous driver''s brass whistle")
- Consumables: batch/quantity framing ("monthly replacement mirror decals")

**Acquisition channels** (each is a story opportunity):
- Purchase with hell money (economic system foundation)
- Reward from special tasks (the task is the story)
- Previous driver''s legacy (mysterious, unknown functions)
- Gift/trade from passengers (deepens passenger relationship)
- Self-made/modified (protagonist agency, uncertain results)
- Accidental discovery (unknown risk attached)

**Effect description format**: "When [specific trigger condition], can [specific effect] for [duration/uses] against [specific entity type]." Always specify what it''s effective against AND what it''s ineffective against.

**Cost types**: economic (ongoing hell money), side effects (post-use reactions), limitations (type-specific), signal exposure (being seen using it), material consumption (limited uses), unknown cost (previous driver''s items).

**Key narrative principle**: upgrades don''t mean increasing safety — solving old threats introduces new ones.',
  (SELECT id FROM novel_creation_method WHERE name = '灵异司机职业流小说' LIMIT 1),
  1,
  23,
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
