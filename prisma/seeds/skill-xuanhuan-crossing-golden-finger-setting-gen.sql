-- 异世界玄幻穿越小说「金手指」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '异世界玄幻穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-xuanhuan-crossing-golden-finger-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xuanhuan-crossing-golden-finger-setting-gen',
  '「金手指」设定生成：为异世界玄幻穿越小说生成金手指设定，包括金手指类型、能力描述、使用限制、成长空间、获得方式',
  '"Golden Finger" setting generation: generate cheat ability settings for isekai xuanhuan crossing novels, including type, ability description, usage limitations, growth potential, and acquisition method',
  '## 「金手指」设定生成 — 异世界玄幻穿越小说

金手指是主角区别于普通修炼者的核心优势，是玄幻穿越小说的第二灵魂（第一灵魂是修炼体系）。金手指设计的核心矛盾是：**足够强大以支撑爽感，又足够受限以维持张力**。

---

### 字段生成指南

#### 金手指类型

7 种核心类型及其特点：

| 类型 | 核心优势 | 典型表现 | 适合搭配的穿越身份 |
|------|---------|---------|-----------------|
| **系统** | 任务奖励/属性面板 | 完成任务获得奖励，有等级和商店 | 平民、奴隶、学徒（低起点） |
| **神器** | 拥有远超当前境界的强力道具 | 初期压箱底，逐渐解封 | 散修、冒险者 |
| **天赋** | 修炼速度/效率碾压常人 | 别人十年他一年，悟性逆天 | 宗门弟子、学徒 |
| **血脉** | 来自强大种族的血脉觉醒 | 远古神兽/仙人血脉 | 异族、贵族 |
| **灵宠** | 强大的契约兽/同伴 | 战斗搭档+成长伙伴 | 冒险者、散修 |
| **外挂记忆** | 前世/穿越带来的知识 | 知道秘境位置、丹方、功法 | 宗门弟子、贵族 |
| **科技道具** | 现代科技在异世界的应用 | 科技碾压低文明 | 平民、学徒 |

**设计建议**：
- 系统类金手指最易写、受众最广，但也最容易模式化
- 神器类适合"逐渐解封"的叙事节奏——每次解封一层都是爽点
- 天赋类需要设计天赋的"代价"或"局限"，否则太无敌
- 血脉类适合与种族设定联动，觉醒过程可以做多个阶段
- 灵宠类增加情感维度，但要避免灵宠喧宾夺主
- 外挂记忆类是"消耗品"——信息用完了怎么办？
- 科技道具类适合"鱼与熊掌"——科技和修炼如何融合？

#### 能力描述

**必须具体化**——不是"主角很强"，而是"主角拥有XXX能力，可以做到YYY，但不能做到ZZZ"。

**好的能力描述示例**：
- 系统类："拥有修炼辅助系统，可以量化修炼进度（以百分比显示突破进度），提供每日修炼任务（完成奖励灵石和经验值），并在境界突破时给出最优修炼路径建议。但系统不能直接提升修为，也不能预测战斗结果。"
- 神器类："体内封印着一柄上古仙剑，目前只能释放剑意（等同金丹期攻击力），每次使用后需恢复三天。随着修为提升可逐步解封更多能力。"
- 天赋类："拥有''万法归一''的领悟天赋，观看任何功法一遍即可领悟其核心原理，但仍需正常时间修炼熟练度。领悟速度是常人的十倍，但身体修炼速度与常人无异。"

**避免**：
- "主角什么都能做"——没有限制的金手指等于没有故事
- "主角有一个很厉害的能力"——太模糊，无法生成有针对性的剧情

#### 使用限制

金手指**必须有限制**，否则故事没有张力。常见限制类型：

| 限制类型 | 说明 | 叙事作用 |
|---------|------|---------|
| **冷却时间** | 使用后需要等待恢复 | 关键时刻用不了，增加危机感 |
| **消耗资源** | 需要灵石、生命力等 | 使用有代价，需要权衡 |
| **境界限制** | 只有突破到某境界才能解锁新功能 | 给升级增加额外动力 |
| **使用次数** | 每日/每次战斗有次数上限 | 需要战术性使用 |
| **副作用** | 头痛、虚弱、暴露风险 | 使用有后果，需要谨慎 |

**设计原则**：
- 限制应与能力成正比——能力越强，限制越重
- 限制应在关键时刻制造"两难选择"——用了有代价，不用可能更惨
- 限制应随成长逐步放宽，但永远不会完全消失
- 至少设计 2-3 种不同类型的限制叠加使用

#### 成长空间

金手指应随主角一起成长，每个阶段的侧重不同：

| 阶段 | 金手指作用 | 示例 |
|------|---------|------|
| **初期** | 辅助生存和基础修炼 | 系统提供基础任务，神器释放微弱力量 |
| **中期** | 在关键战斗中发挥决定性作用 | 系统解锁新功能，神器解封新层 |
| **后期** | 完全觉醒，解锁终极能力 | 系统进化为高阶版本，神器恢复全部力量 |

**设计建议**：
- 初期的金手指不应太强——否则主角没有成长空间
- 中期应有 2-3 次显著的金手指升级，每次都是爽点
- 后期的终极形态应与修炼体系的巅峰境界呼应
- 金手指的成长应与主角的境界突破形成"双螺旋"——互相促进

#### 获得方式

穿越时自带 vs 后天获得：

| 获得方式 | 优势 | 劣势 |
|---------|------|------|
| **穿越自带** | 直接开局，快速展开 | 缺乏铺垫感 |
| **后天获得** | 有铺垫，获得过程本身是剧情 | 开局缺少亮点 |

**设计建议**：
- 穿越自带更适合快节奏爽文——第一章就亮出金手指
- 后天获得适合有铺垫的叙事——前几章靠穿越者本身的智慧和意志活下来，然后在关键时刻获得金手指
- 也可以折中：穿越时获得金手指的"种子"，但需要某个条件触发才正式激活

---

### 金手指设计的核心矛盾

**足够强 vs 有限制**——这是金手指设计的永恒矛盾。解决方法：

1. **初期弱、后期强**：金手指的总潜力是逆天的，但初期只能发挥一小部分
2. **能力强、代价大**：金手指很强但每次使用都有代价
3. **方向窄、深度深**：金手指只在某个特定方向上碾压（如领悟能力），其他方面与常人无异
4. **被动强、主动弱**：金手指自动提供辅助效果，但无法主动控制发挥

---

### 设计原则总结

1. **具体化**：能力描述越具体，AI 生成的剧情越有针对性
2. **有限制**：没有限制的金手指 = 没有故事张力
3. **会成长**：金手指的升级是全书的爽点节奏器
4. **与修炼体系互补**：金手指不应取代修炼体系，而是在修炼体系的框架内提供优势
5. **与穿越身份搭配**：身份越低，金手指潜力越大',
  '## "Golden Finger" Setting Generation — Isekai Xuanhuan Crossing Novel

The cheat ability (golden finger) is the protagonist''s core advantage over ordinary cultivators -- the second soul of a xuanhuan crossing novel (the first being the cultivation system). The core design tension: **strong enough to deliver satisfaction, yet limited enough to maintain story tension**.

---

### Field Generation Guide

#### Cheat Ability Type
7 core types: System (quest rewards, stat panel; best for low-start identities) / Divine Artifact (sealed powerful item, gradually unlocked) / Talent (cultivation speed/efficiency crush) / Bloodline (ancient race bloodline awakening) / Spirit Pet (contracted beast companion) / Plug-in Memory (knowledge from past life/crossing) / Tech Gadget (modern tech in otherworld). Each pairs best with specific crossing identities.

#### Ability Description
Must be specific: not "protagonist is strong" but "has XXX ability, can do YYY, cannot do ZZZ." Include clear capabilities and boundaries.

#### Usage Limitations
Cheat ability MUST have limits. Types: Cooldown periods / Resource consumption (spirit stones, life force) / Realm restrictions (new functions unlock at certain realms) / Usage counts / Side effects (headaches, weakness, exposure risk). At least 2-3 limitation types should be combined. Limitations should create "dilemma moments."

#### Growth Potential
Three stages: Early (assists survival, basic cultivation) / Mid (decisive role in key battles, major upgrades) / Late (fully awakened, ultimate abilities). Growth should form a "double helix" with realm breakthroughs -- mutually reinforcing.

#### Acquisition Method
Built-in at crossing (direct, fast start) vs. acquired later (more buildup, getting it is a plot event itself). Can compromise: receive a "seed" at crossing that activates under certain conditions.

### Core Design Tension
Strong enough vs. limited enough. Solutions: weak early / strong late; strong ability / heavy cost; narrow specialty / deep mastery; strong passive / weak active control.',
  (SELECT id FROM novel_creation_method WHERE name = '异世界玄幻穿越小说' LIMIT 1),
  1,
  33,
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
