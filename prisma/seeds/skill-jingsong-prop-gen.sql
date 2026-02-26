-- 惊悚乐园小说「道具/技能」生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '惊悚乐园小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-jingsong-prop-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'jingsong-prop-gen',
  '「道具/技能」生成：为惊悚乐园小说生成道具和技能，涵盖类型分类、稀有度体系、效果平衡性设计、恐怖风格副作用、阵容搭配等完整体系',
  '"Prop/Skill" generation: generate props and skills for thriller park novels, covering type classification, rarity system, effect balance design, horror-themed side effects, and loadout composition',
  '## 「道具/技能」生成 — 惊悚乐园小说

惊悚乐园小说的道具/技能设计核心是**游戏化的能力体系 × 恐怖风格的代价机制 × 副本适配性**。道具和技能是玩家在恐怖副本中求生的工具，但它们不应该让恐怖变得不恐怖——好的道具设计是"给你一把伞，但伞会吸引雷电"：有用，但用了之后可能面临新的危险。

这个类型的道具/技能有一个独特的张力：它们来自一个**游戏系统**，所以有明确的数值化属性（稀有度、使用次数、冷却时间）；但它们服务于**恐怖叙事**，所以效果和副作用都要带有恐怖色彩。这种"游戏化的恐怖"正是惊悚乐园的魅力所在。

---

### 字段生成指南

#### 名称

- 名称要兼顾"游戏感"和"恐怖感"
- 好的命名：「亡者之眼」「幽灵手套」「时间沙漏（碎裂的）」「回声录音机」「诅咒弹匣」「第六感」
- 差的命名：「超级武器」「万能钥匙」「无敌护盾」
- 命名策略：
  - **功能暗示**："亡者之眼"→ 能看到死者/灵异存在
  - **材质/来源暗示**："诅咒弹匣"→ 来源不正、有代价
  - **状态暗示**："碎裂的沙漏"→ 不完美、有缺陷
  - **感官暗示**："回声录音机"→ 与声音/听觉相关
- 避免过于通用的命名——每件道具的名字都应该让人好奇"这东西是什么？"

#### 类型

七个选项的设计要点和分类说明：

| 类型 | 核心定位 | 在恐怖副本中的功能 | 设计注意 |
|------|---------|-------------------|---------|
| **武器** | 直接对抗恐怖存在 | 对怪物/鬼怪造成伤害或驱离 | 武器不应该太强——能伤害鬼怪但不能一击必杀，否则恐怖感全无。武器使用应有风险（声音会吸引更多怪物、弹药有限等） |
| **防具** | 被动防御 | 减少伤害、抵御特定恐怖效果 | 防具保护的是特定类型的威胁（防物理但不防精神攻击、防诅咒但不防物理伤害）。没有万能防具 |
| **消耗品** | 一次性使用 | 解决即时危机、恢复状态 | 消耗品是"救命稻草"——数量有限是核心约束。使用时机的选择本身就是一个决策难题 |
| **探索工具** | 获取信息和线索 | 发现隐藏事物、探测危险、解读线索 | 探索工具让玩家"看到更多"——但看到更多不一定是好事。有些真相不如不知道 |
| **被动技能** | 常驻效果 | 持续增强某项能力 | 被动技能塑造角色的"职业特征"——有了某个被动技能，角色在特定场景下就有优势。但被动技能通常伴随持续的小代价 |
| **主动技能** | 需要触发 | 在关键时刻发挥作用 | 主动技能是"底牌"——强大但有冷却时间或使用次数限制。使用时机的判断是角色智慧的体现 |
| **特殊道具** | 不归入以上分类 | 特殊功能或剧情道具 | 特殊道具往往与特定副本或剧情深度绑定——它的功能可能很奇特，无法用常规分类描述 |

选择类型时要考虑：这个道具/技能在副本求生中扮演什么角色？是帮助战斗、帮助探索、还是帮助生存？

#### 稀有度

五个等级的设计哲学——**白蓝紫橙红的能力曲线**：

| 稀有度 | 能力等级 | 获取难度 | 副作用程度 | 叙事定位 |
|--------|---------|---------|----------|---------|
| **普通（白）** | 基础但实用 | 容易获取，新手就有 | 几乎无副作用 | 日常装备，消耗品的主要等级。"有比没有好"的程度 |
| **稀有（蓝）** | 明显增强 | 需要通关或完成任务 | 轻微副作用 | 标准装备升级，大部分玩家的主力装备。效果稳定可靠 |
| **史诗（紫）** | 强力效果 | 困难副本奖励或隐藏掉落 | 显著副作用 | 改变战局的关键道具。使用时要权衡利弊 |
| **传说（橙）** | 颠覆性效果 | 极其稀有，可能全书只出现1-2件 | 重大副作用 | 剧情级道具，获得和使用都是大事件。可能决定副本的胜负 |
| **诡异（红）** | 不可预测的强大效果 | 来源诡异，往往伴随恐怖事件获得 | **副作用本身就是恐怖的**——可能改变使用者 | 最具惊悚乐园特色的稀有度。"诡异"意味着这件道具的来源和本质与恐怖力量有关，使用它等于与恐怖做交易 |

**稀有度曲线的核心原则**：能力越强，代价越大——但代价不只是数值上的"扣血扣蓝"，而是叙事上的恐怖代价（精神侵蚀、吸引恐怖存在的注意、改变使用者的认知）。

#### 效果描述

效果设计的平衡性原则——**不能太强破坏恐怖感，不能太弱没存在感**：

- **效果要具体、有边界**：好的描述——"在30秒内能看到半径5米内所有隐形存在的轮廓"；差的描述——"能看到一切隐藏的东西"
- **效果要与类型匹配**：武器的效果是伤害/驱离，探索工具的效果是发现/探测，不要错位
- **效果要有"恐怖版本"的表述**：不说"增加10%攻击力"，而说"握住刀柄时能感受到它渴望切割灵体的震颤"——同样的数值效果，恐怖化的表述增加氛围
- **效果的上限要明确**：这件道具能做什么、不能做什么——玩家不应该依赖一件道具解决所有问题
- **效果可以有"发现过程"**：刚获得时只知道部分效果，使用过程中逐渐发现完整功能（和副作用）

#### 获取方式

六个选项的叙事意义：

| 获取方式 | 叙事功能 | 设计要点 |
|---------|---------|---------|
| **副本通关奖励** | 努力的回报 | 与副本主题和难度匹配——鬼屋副本掉落与灵异相关的道具 |
| **商店兑换** | 积分的用途 | 商店道具是"稳定但不惊艳"的选择——真正强力的道具不会在商店里卖 |
| **任务奖励** | 额外挑战的回报 | 任务通常是副本内的支线任务——增加副本的探索深度 |
| **隐藏掉落** | 奖励探索和细心 | 最有叙事价值——发现隐藏道具的过程本身就是一个小故事 |
| **特殊触发条件** | 剧情驱动 | 特定行为或选择触发——"在鬼面前不退缩"获得「无畏者之心」 |
| **初始装备** | 角色起点 | 新手保护——简单但可靠的基础装备 |

#### 使用限制

- 使用限制是平衡性的关键——没有限制的道具等于没有设计
- **次数限制**："仅可使用3次，用完消失"——制造珍惜感和使用决策
- **冷却时间**："使用后需要等待一个副本才能再次使用"——防止反复使用
- **条件限制**："只在黑暗环境中生效"、"需要有同伴在场"——增加使用的策略性
- **等级限制**："需要达到X等级才能使用"——给予成长目标
- **兼容限制**："不能与Y类道具同时装备"——防止过于强力的组合
- 限制本身可以制造紧张——"只剩最后一次使用机会了"是经典的叙事张力

#### 副作用

**副作用设计是惊悚乐园道具系统最有特色的部分——副作用不只是"扣血"，而是恐怖叙事的一部分。**

恐怖风格副作用的创意方向：

| 副作用类别 | 恐怖表现 | 示例 |
|----------|---------|------|
| **感知扭曲** | 使用后五感出现异常 | "使用后的24小时内，视野边缘会出现不存在的影子"、"会听到只有自己能听到的耳语" |
| **存在感变化** | 吸引恐怖存在的注意 | "每次使用都会被副本中的Boss感知到你的位置"、"使用三次后，你在鬼怪的感知中会变得''更亮''" |
| **精神侵蚀** | 影响使用者的心智 | "每次使用后做一个噩梦，噩梦内容与使用次数有关"、"使用者会逐渐产生某种执念" |
| **代价转嫁** | 使用的代价由他人承担 | "治愈自己的同时，队伍中随机一人会感到等量的痛苦"、"消耗品回复的生命值从队友处扣除" |
| **不可逆改变** | 永久性的影响 | "每使用一次，使用者的某段记忆会模糊"、"使用10次后，使用者在镜子中的倒影会延迟一秒" |
| **条件触发** | 在特定条件下爆发 | "在黑暗中使用没有副作用，但在光亮处使用会..." 、"平时无害，但在特定副本中副作用翻倍" |

副作用设计的核心原则：
- 副作用的恐怖程度要与道具的能力强度成正比——白色道具可以几乎没有副作用，红色（诡异）道具的副作用本身就是一个恐怖故事
- 副作用要能推动剧情——好的副作用不是"扣100HP"，而是会影响角色的行为和决策
- 副作用可以有"叠加效应"——使用次数越多，副作用越严重——这制造了"要不要继续用"的纠结

---

### 道具/技能阵容搭配建议

**单个玩家的标准配置**：
1. **核心武器/技能**（1件，蓝色或紫色）：主要的战斗/应对手段
2. **探索工具**（1件，白色或蓝色）：帮助发现线索和规避危险
3. **保命消耗品**（2-3件，白色）：危急时刻的救命稻草
4. **被动技能**（1个）：定义角色在团队中的职能
5. **底牌**（0-1件，紫色或橙色）：关键时刻翻盘的王牌，有重大代价

**团队层面的搭配原则**：
- 道具/技能要形成互补——不是每个人都拿武器，而是有人攻击、有人探索、有人辅助
- 诡异（红色）道具每个团队最多1件——太多会失去恐怖感的稀缺性
- 消耗品的总量要控制——如果消耗品无限，就不存在资源压力

**全书层面的阵容演进**：
- 前期：白色和蓝色道具为主，角色能力有限
- 中期：紫色道具开始出现，角色有了"底牌"
- 后期：橙色和红色道具登场，能力强大但代价同样惊人
- 道具的升级要伴随副本难度的升级——永远不要让玩家觉得"装备碾压"

---

### 与已有设定的联动

| 设定模块 | 对道具/技能的影响 |
|---------|----------------|
| **游戏系统** | 积分货币系统→商店道具的定价逻辑；等级体系→道具的等级限制；奖励机制→通关奖励的道具类型 |
| **副本机制** | 难度分级→不同难度副本的掉落道具稀有度；隐藏机制→隐藏掉落的条件设计 |
| **主角档案** | 核心能力→主角适配的道具类型；成长路线→道具升级的方向 |
| **副本** | 恐怖主题→道具的风格和来源（灵异副本产灵异道具）；怪物弱点→对应的武器设计 |

---

### 常见错误

1. **道具万能**：一件道具能解决所有类型的恐怖威胁——这会彻底摧毁恐怖感。每件道具的功能必须有明确的边界
2. **副作用敷衍**：副作用只是"使用后头疼"——好的副作用应该是有恐怖叙事价值的，能影响角色的行为和剧情走向
3. **稀有度与能力不匹配**：白色道具效果比紫色道具还强——稀有度体系要严格遵循能力曲线
4. **名称无辨识度**：道具名字像编号——"道具A"、"武器1"。每件道具的名字都应该暗示其功能、来源或恐怖属性
5. **忽视恐怖属性**：道具设计完全像RPG游戏——纯数值、无恐怖感。惊悚乐园的道具必须带有恐怖色彩，无论是外观、效果还是副作用
6. **消耗品泛滥**：消耗品太多太容易获得——消耗品的稀缺性是资源管理紧张感的来源
7. **道具同质化**：每件武器都是"对鬼造成X点伤害"，缺乏功能差异——不同武器应有不同的使用场景、触发条件和副作用
8. **技能与道具界限模糊**：分不清什么是道具什么是技能——道具是外部物品（可以丢失、损坏、交易），技能是内在能力（不会丢失但可能有成长/退化）',
  '## "Prop/Skill" Generation — Thriller Park Novel

Prop/skill design in thriller park novels balances **gamified ability systems × horror-themed cost mechanisms × dungeon adaptability**. Props give players survival tools but should not eliminate horror — good design is "here''s an umbrella, but it attracts lightning."

---

### Field Generation Guide

#### Name (名称)
Balance "game feel" and "horror feel." Strategies: function hint ("Dead Man''s Eye"), source hint ("Cursed Magazine"), state hint ("Cracked Hourglass"), sensory hint ("Echo Recorder"). Avoid generic names.

#### Type (类型)
Seven categories: Weapon (direct confrontation — must not be too powerful), Armor (passive defense against specific threats), Consumable (one-time crisis solution — scarcity is key), Exploration Tool (reveals hidden things — seeing more isn''t always good), Passive Skill (constant enhancement with constant minor cost), Active Skill (powerful trump card with cooldown/limits), Special Item (unique plot-bound items).

#### Rarity (稀有度)
Five tiers forming a power-cost curve: Common/White (basic, practical, minimal side effects), Rare/Blue (notable boost, slight side effects), Epic/Purple (powerful, significant side effects), Legendary/Orange (game-changing, major side effects, 1-2 per novel), Eerie/Red (unpredictable power, side effects ARE horror — using it means dealing with horror forces).

#### Effect Description (效果描述)
Balance principle: not too strong (destroys horror) nor too weak (irrelevant). Effects must be specific with clear boundaries. Use horror-themed descriptions rather than pure game stats. Effects can be progressively discovered.

#### Side Effects (副作用)
**Most distinctive design element.** Horror-themed categories: Perception Distortion (phantom shadows/whispers), Presence Change (attracts monster attention), Mental Erosion (nightmares/obsessions), Cost Transfer (team members bear the price), Irreversible Change (permanent effects like delayed mirror reflections), Conditional Trigger (specific situations amplify side effects). Side effect severity must match power level.

---

### Loadout Suggestions

Per player: core weapon/skill (1, blue/purple), exploration tool (1, white/blue), emergency consumables (2-3, white), passive skill (1), trump card (0-1, purple/orange with major cost). Team-level: complementary roles (attack/explore/support), max 1 eerie/red item per team. Novel progression: early = white/blue, mid = purple appears, late = orange/red with escalating costs.

---

### Common Errors

1. Omnipotent props that solve all threats
2. Trivial side effects with no narrative horror value
3. Rarity-power mismatch breaking the tier system
4. Generic names with no identity or horror suggestion
5. Pure RPG stat design ignoring horror atmosphere
6. Excessive consumables eliminating resource tension
7. Homogeneous weapons with identical "deal X damage to ghosts"
8. Blurred line between props and skills',
  (SELECT id FROM novel_creation_method WHERE name = '惊悚乐园小说' LIMIT 1),
  1,
  32,
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
