-- The Ruthless Protagonist Novel「Power System」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Ruthless Protagonist Novel' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-ruthless-protag-power-system-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ruthless-protag-power-system-setting-gen',
  '「Power System」设定生成：为 The Ruthless Protagonist Novel 生成力量体系设定，包括 Power Type、Power Description、Power Costs、Power Tiers、Protagonist Advantage、Forbidden Powers',
  '"Power System" setting generation: generate power system settings for The Ruthless Protagonist Novel, including power type, power description, power costs, power tiers, protagonist advantage, and forbidden powers',
  '## 「Power System」设定生成 — The Ruthless Protagonist Novel

「Power System」是 grimdark 小说的骨架。在狠辣主角类小说中，力量体系不仅仅是"怎么打架"——它是道德选择的具象化。好的 grimdark 力量体系会在机制层面奖励掠夺、惩罚善良，让主角的"狠"成为力量体系内的最优解。

---

### 字段生成指南

#### Power Type

力量类型定义世界的基础规则框架。每种类型有不同的叙事可能性：

| 类型 | 特征 | Grimdark 适配度 | 经典参考 |
|------|------|----------------|---------|
| **Hard Magic System** | 规则明确、逻辑严密、可以被计算和优化 | ★★★★★ | 蛊真人（蛊道）、Mistborn（镕金术） |
| **Soft/Mysterious Magic** | 规则模糊、充满未知、力量来源神秘 | ★★★★ | Malazan（warren系统）、LOTR |
| **Martial Arts/Combat Skills** | 以身体为媒介的战斗技艺 | ★★★★ | 修仙体系、武侠内力 |
| **Political/Economic Power** | 权力、金钱、影响力即是力量 | ★★★★ | ASOIAF（权力游戏）、Dune |
| **Technology/Artifacts** | 科技或远古器物赋予的力量 | ★★★ | Worm（触发能力）、40K |
| **Divine/Demonic Pacts** | 与超自然实体签订契约获取力量 | ★★★★★ | Berserk（蚀之刻）、Chainsaw Man |
| **No Supernatural Powers** | 纯粹依靠智谋、政治、暴力 | ★★★ | 第一法则、冰与火之歌 |

**选择建议**：
- Hard Magic + grimdark = 最强组合，因为读者可以清楚地看到主角在规则内如何利用体系的黑暗面
- Divine/Demonic Pacts 天然适合"力量需要代价"的叙事
- Political Power 适合低魔世界，主角的"力量"是操纵人心和控制资源

#### Power Description

力量描述必须回答三个核心问题：
1. **力量从哪里来？**（内在修炼、外部吸收、血脉传承、神灵赐予、科技赋能）
2. **力量怎么用？**（施法、战斗、增强身体、操控环境、影响心智）
3. **这个体系的"游戏规则"是什么？**（可以量化吗？有等级吗？有属性克制吗？）

**Grimdark 力量描述的关键**：体系的规则必须内含不公平性或残酷性。好的 grimdark 力量体系不是公平竞技——它本身就偏袒某些人、惩罚某些人。例如：
- 蛊真人的蛊道：精炼蛊虫需要大量资源，富者越富，穷者永远无法入门
- Worm 的触发：获得超能力需要经历极端创伤——力量本身就来自痛苦
- Berserk 的使徒化：获得神之力的代价是牺牲最珍视的人

#### Power Costs

力量代价是 grimdark 力量体系的灵魂。没有代价的力量体系不适合狠辣主角类小说。

**代价类型层次**：

| 代价层次 | 类型 | 示例 | 叙事效果 |
|---------|------|------|---------|
| **身体代价** | 生命、健康、寿命 | 每次施法燃烧生命力 | 基础但有效 |
| **心智代价** | 理智、记忆、情感能力 | 力量越强越失去人类情感 | 角色堕落弧 |
| **关系代价** | 必须牺牲他人 | 升级需要献祭同伴 | 道德冲突的核心 |
| **存在代价** | 身份、自我、人性 | 变强到最后不再是"人" | 终极哲学困境 |
| **社会代价** | 声誉、地位、被排斥 | 使用禁术被全世界通缉 | 社会冲突线 |

**最佳实践**：一个力量体系应该有多层代价。基础使用只付身体代价，高阶使用付心智代价，极限使用付关系或存在代价。

#### Power Tiers

力量层级定义了从弱到强的阶梯。在 grimdark 小说中，层级不只是数字——每一级都意味着更深的道德妥协：

**层级设计原则**：
- 通常 4-6 个等级最为合适
- 每一级之间应有质的飞跃而非量的积累
- 高层级的门槛应包含道德选择（不仅是"练到一定程度"，而是"你愿意付出什么"）
- 最顶层应该是几乎不可能达到的——需要的代价大到几乎没有人愿意支付

**Grimdark 层级的特殊要求**：
- 层级之间的差距必须残酷——低阶在高阶面前完全没有反抗能力
- 每个层级的提升方式应该越来越黑暗
- 主角的优势在于他愿意支付别人不愿支付的代价

#### Protagonist Advantage

主角优势定义了为什么他能比别人爬得更快或战斗力更强。但在 grimdark 中，优势不是"天选之人的血脉"，而是与主角的"狠"直接相关：

**优秀的主角优势设计**：
- **道德上的无底线**：别人不敢用的禁术、不敢付的代价，他敢（如方源愿意炼化任何人）
- **前世/先知知识**：知道未来或体系漏洞，但利用这些知识的方式是冷酷的（如方源 500 年的记忆）
- **独特的体质/天赋 + 黑暗应用**：天赋本身可能是中性的，但主角发现了它的黑暗用法
- **极端的意志力**：不是"热血永不放弃"，而是"为了活下去可以承受任何痛苦"

**避免**：
- 纯粹的外挂式金手指（系统、面板、商城）——除非这些金手指本身有黑暗的代价
- 毫无代价的天选之人设定——削弱了 grimdark 的核心张力

#### Forbidden Powers

禁忌力量是力量体系中最黑暗的部分——大多数人不敢碰，但主角可能会碰：

**禁忌力量的设计要素**：
- **为什么被禁？**：不仅是"太强了"，而是使用它会造成不可逆的后果（毁灭区域、扭曲现实、引来更高层次的威胁）
- **为什么主角敢用？**：这直接体现主角的"狠"——代价对他来说可以接受，或者他有独特的方式承受代价
- **使用的后果是什么？**：禁忌力量的后果应该在故事中持续产生影响，而不是"用了就过去了"

---

### 字段联动关系

1. **Power Type → Power Description**：类型限定了描述的框架。Hard Magic 的描述需要精确规则；Soft Magic 的描述可以更神秘
2. **Power Description → Power Costs**：力量的运作方式决定了代价的形式。吸收型力量的代价是被吸收者；修炼型力量的代价是自身
3. **Power Costs → Power Tiers**：每一级的提升代价应该递增，从身体代价升级到存在代价
4. **Power Tiers → Protagonist Advantage**：主角的优势应该让他能跨级挑战，但方式是"付出更多代价"而非"天赋异禀"
5. **所有字段 → Forbidden Powers**：禁忌力量是力量体系所有规则的极端延伸

---

### 常见错误

1. **力量体系没有代价**：升级和使用力量完全无痛——这不是 grimdark，是普通升级流
2. **代价太抽象**：只说"会付出代价"但不具体化——代价必须可感知、可量化
3. **层级差距不够残酷**：低阶和高阶只是"强一点弱一点"——grimdark 的层级差距应该是碾压级的
4. **主角优势太像外挂**：系统赋予无限金手指，削弱了"为什么必须狠"的逻辑
5. **禁忌力量没有真正的后果**：用了禁术但啥事没有——禁忌力量的后果必须持续影响剧情
6. **力量体系与世界观脱节**：力量体系独立存在，没有与社会结构、政治格局产生联动',
  '## "Power System" Setting Generation — The Ruthless Protagonist Novel

The "Power System" is the skeleton of a grimdark novel. In ruthless protagonist fiction, the power system is not just "how to fight" — it is the *concretization of moral choices*. A well-designed grimdark power system rewards predation and punishes kindness at the mechanical level, making the protagonist''s ruthlessness the optimal strategy *within the system''s own rules*.

This is what separates great grimdark power systems from generic ones. In *Reverend Insanity*, the Gu cultivation system rewards resource hoarding and punishes sharing — Fang Yuan''s ruthlessness is literally the mathematically optimal approach. In *Worm*, powers triggered by trauma create a feedback loop where suffering breeds strength. In *Berserk*, the God Hand offers unlimited power at the cost of sacrificing what you love most. The power system doesn''t just permit ruthlessness — it *incentivizes* it.

---

### Field Generation Guide

#### Power Type

The power type defines the world''s foundational rule framework. Each type offers different narrative possibilities for grimdark fiction:

| Type | Characteristics | Grimdark Fit | Classic Reference |
|------|----------------|-------------|-------------------|
| **Hard Magic System** | Clear rules, rigorous logic, can be calculated and optimized | ★★★★★ | Reverend Insanity (Gu), Mistborn (Allomancy), Hunter x Hunter (Nen) |
| **Soft/Mysterious Magic** | Vague rules, full of unknowns, mysterious power sources | ★★★★ | Malazan (Warrens), LOTR (Gandalf), Dark Souls |
| **Martial Arts/Combat Skills** | Body-mediated combat arts | ★★★★ | Xianxia cultivation, wuxia internal energy, Kengan Ashura |
| **Political/Economic Power** | Authority, money, and influence as power | ★★★★ | ASOIAF (Game of Thrones), Dune (spice economy), Lies of Locke Lamora |
| **Technology/Artifacts** | Power granted by technology or ancient relics | ★★★ | Worm (Trigger powers), Warhammer 40K (warp tech), Blame! |
| **Divine/Demonic Pacts** | Power obtained through contracts with supernatural entities | ★★★★★ | Berserk (Eclipse), Chainsaw Man, Black Clover (devil contracts) |
| **No Supernatural Powers** | Pure reliance on cunning, politics, violence | ★★★ | First Law, ASOIAF (non-magic characters), The Prince |

**Selection guidance**:
- **Hard Magic + grimdark = strongest combination** because readers can clearly see how the protagonist exploits the system''s dark side within its rules. When the rules are clear, the moral compromises are also clear. The reader can follow the logic: "Given these rules, ruthlessness *is* the optimal strategy."
- **Divine/Demonic Pacts** are naturally suited to "power demands a price" narratives — the transaction is explicit and dramatic. The moment of choosing to pay the price is always a story highlight.
- **Political/Economic Power** works best for low-magic worlds where the protagonist''s "power" is manipulation and resource control. This type requires the strongest character writing since power conflicts are between people, not between abilities.
- **Soft/Mysterious Magic** adds horror and uncertainty — the protagonist''s ruthlessness extends to willingness to interact with forces they don''t fully understand, which other characters fear.

#### Power Description

The power description must answer three core questions:
1. **Where does power come from?** (Internal cultivation, external absorption, bloodline inheritance, divine bestowal, technological enhancement, environmental harvesting)
2. **How is power used?** (Spellcasting, physical combat, body enhancement, environmental manipulation, mental influence, reality warping)
3. **What are the system''s "game rules"?** (Can it be quantified? Are there levels? Are there type advantages? Can it be stolen or transferred?)

**Key requirement for grimdark power descriptions**: The system''s rules must contain inherent unfairness or cruelty. A good grimdark power system is *not* a fair competition — it structurally favors some and punishes others.

Design patterns that create inherent unfairness:
- **Resource-gated progression**: Advancing requires rare resources that can be obtained by taking from others. The rich get richer; the poor can never enter the game. (Reverend Insanity: Gu refinement requires massive resources)
- **Trauma-gated activation**: Gaining power requires experiencing extreme suffering or loss. Power literally comes from pain. (Worm: Trigger events require worst-moment-of-your-life experiences)
- **Sacrifice-gated breakthroughs**: Breaking through to the next level requires sacrificing something irreplaceable — relationships, humanity, or other people. (Berserk: Becoming an Apostle requires sacrificing what you love most)
- **Predation-based growth**: The system literally allows or requires absorbing others'' power, making every practitioner a potential target. (Reverend Insanity: Gu Masters can steal and refine others'' Gu worms)
- **Hereditary advantage**: Some bloodlines start with advantages that no amount of effort can overcome — unless you''re willing to do what others won''t. (Naruto: Kekkei Genkai; the grimdark version would emphasize how this creates permanent underclasses)

#### Power Costs

Power costs are the *soul* of a grimdark power system. A costless power system is fundamentally incompatible with ruthless protagonist fiction — if there''s no price to pay, there''s no reason for ruthlessness.

**Cost type hierarchy** (designed for escalation throughout the story):

| Cost Tier | Type | Examples | Narrative Effect |
|-----------|------|---------|-----------------|
| **Physical** | Life, health, lifespan | Each spell burns life force; combat skills damage the body permanently; aging accelerated | Basic but effective; establishes that power is not free |
| **Mental** | Sanity, memory, emotional capacity | Growing stronger means losing the ability to feel empathy; each use erodes memories | Drives character corruption arc; reader watches the protagonist change |
| **Relational** | Must sacrifice others | Advancement requires offering companions; power grows by absorbing allies | Core of moral conflict; every relationship becomes a potential resource |
| **Existential** | Identity, self, humanity | At the peak, the practitioner is no longer "human" in any meaningful sense | Ultimate philosophical dilemma; the question becomes "is it still you who won?" |
| **Social** | Reputation, status, being hunted | Using forbidden methods makes the practitioner an enemy of all organized society | Creates external conflict alongside internal moral conflict |

**Best practice**: A well-designed system should have **multiple cost tiers**. Basic usage incurs physical costs. Advanced usage incurs mental costs. Extreme usage incurs relational or existential costs. This creates a natural escalation where the protagonist must choose increasingly dark tradeoffs as they grow stronger.

**The golden rule of grimdark costs**: The cost should be *specific* and *visible*. Not "there will be consequences" but "each use of Blood Arts requires draining the life of a living person, and the caster can feel their victim''s final moments of terror." Specificity creates visceral impact.

#### Power Tiers

Power tiers define the ladder from weak to strong. In grimdark fiction, tiers are not just numbers — each level represents a deeper moral compromise:

**Tier design principles**:
- **4-6 tiers is optimal**: Too few tiers and progression feels rushed; too many and each tier feels meaningless. The sweet spot gives enough rungs for a full story arc.
- **Qualitative jumps between tiers**: Each tier should represent a *fundamental* change, not just "more power." A Tier 3 practitioner doesn''t just hit harder than Tier 2 — they operate on a different level of reality/capability.
- **Moral gates at each breakthrough**: Advancing should not just require training or resources — it should require a *choice*. "Are you willing to sacrifice X to reach the next level?" This is what makes grimdark power progression compelling.
- **The peak should be nearly unreachable**: The ultimate tier requires a price so extreme that almost no one in history has paid it. This makes the protagonist''s willingness to consider it meaningful.

**Grimdark-specific tier requirements**:
- **Tier gaps must be brutal**: A lower-tier practitioner against a higher-tier one should be genuinely hopeless — not "a tough fight" but "complete helplessness." This makes climbing the tiers urgent and meaningful, and makes the protagonist''s willingness to pay any price understandable.
- **Each tier''s advancement method should be darker**: Tier 1→2 might require dedication. Tier 2→3 might require sacrifice. Tier 3→4 might require consuming others. Tier 4→5 might require abandoning humanity.
- **The protagonist''s edge**: Their advantage is *willingness to pay* what others won''t. This must be reflected in the tier structure.

**Example tier progression** (for a Gu/cultivation-style system):
1. **Initiate**: Can use basic abilities; cost is physical effort and minor resources
2. **Practitioner**: Significant combat power; advancement requires consuming rare resources (often fought over, encouraging conflict)
3. **Master**: Regional-level threat; breakthrough requires a major sacrifice (a relationship, a piece of identity, years of lifespan)
4. **Grandmaster**: Nation-level influence; requires absorbing or destroying other Masters; the practitioner is now visibly "less human"
5. **Sovereign**: World-shaking; requires an act that crosses a fundamental moral line (mass sacrifice, reality distortion, soul consumption); perhaps 3-5 exist in the entire world
6. **[Theoretical Maximum]**: The level everyone knows about but almost no one has reached; the cost is so extreme it serves as the story''s ultimate question

#### Protagonist Advantage

The protagonist''s advantage defines why they can climb faster or fight dirtier than others. In grimdark fiction, the advantage must be *directly tied to the protagonist''s ruthlessness* — not a gift from fate:

**Well-designed protagonist advantages**:
- **Moral bottomlessness**: Forbidden techniques, unacceptable costs — others won''t pay them, the protagonist will. This is the purest grimdark advantage:
  - Fang Yuan (Reverend Insanity): Willing to refine anyone into Gu, including allies and innocents
  - This works because the power system rewards it — the advantage is not arbitrary but *systematic*

- **Past-life/prophetic knowledge**: Knowing the future or system exploits, but using that knowledge in ruthless ways:
  - Fang Yuan: 500 years of memories allow him to know every opportunity and exploit it without sentiment
  - The knowledge advantage only works because the protagonist is willing to act on knowledge that requires immoral choices

- **Unique constitution + dark application**: The talent itself may be neutral, but the protagonist discovers its dark potential:
  - A healing ability that can also *reverse* healing (rotting flesh)
  - An empathy ability used to manipulate emotions rather than comfort
  - A time ability used to trap enemies in loops of suffering

- **Extreme willpower**: Not "hot-blooded never give up" but "willing to endure any pain, any loss, any degradation to survive and advance":
  - This is different from typical shonen willpower — it''s not about hope, it''s about the absolute refusal to die
  - The willpower enables them to pay costs that would break anyone else

**Avoid**:
- **Pure cheat-code advantages** (System, Status Panel, Shop) — unless these cheat codes themselves have dark costs. "The System gives quests but the failure penalty is your memories" works. "The System gives free power" does not.
- **Costless Chosen One status** — undermines grimdark''s core tension. If the protagonist is destined to win, there''s no reason for them to be ruthless. The entire genre is built on the premise that survival/success requires terrible choices.

#### Forbidden Powers

Forbidden powers represent the darkest region of the power system — what most practitioners refuse to touch, but the protagonist might:

**Forbidden power design elements**:

- **Why is it forbidden?**: The reason must go beyond "it''s too strong." Forbidden powers should have consequences that affect the *world*, not just the user:
  - Creates permanent environmental damage (blighted zones, reality tears)
  - Attracts attention from higher-order threats (cosmic entities, divine punishment)
  - Corrupts not just the user but everyone nearby
  - Violates a fundamental law of the power system (like conservation of energy but for souls)

- **Why would the protagonist use it?**: This directly demonstrates the protagonist''s ruthlessness — the cost is something others consider unacceptable, but the protagonist sees it as an acceptable trade:
  - Others value the things the forbidden power costs (loved ones, their own humanity)
  - The protagonist either doesn''t value those things or values their goal more
  - Or the protagonist has found a loophole to mitigate the cost (at someone else''s expense)

- **What are the lasting consequences?**: Forbidden power usage should create *persistent* story effects, not one-time events:
  - The protagonist is now hunted by every faction
  - The world itself is changed in ways that create new conflicts
  - The protagonist''s body/mind/soul is permanently altered
  - A countdown begins toward something terrible

**Types of forbidden powers**:
- **Life-consuming arts**: Directly uses the lives of others as fuel (mass sacrifice, soul harvesting)
- **Self-destructive techniques**: Burns the user''s own existence (lifespan, memories, identity) for temporary supreme power
- **Reality-breaking abilities**: Violates the world''s fundamental rules (time manipulation, causality reversal, death negation)
- **Corruption-spreading methods**: The power infects everything around it, turning allies into monsters or landscapes into wastelands
- **Pact-escalation**: Deepening the deal with entities that always take more than they give

---

### Field Interdependencies

1. **Power Type → Power Description**: The type constrains the description''s framework. Hard Magic descriptions need precise rules and quantifiable mechanics; Soft Magic descriptions can be more atmospheric and mysterious.

2. **Power Description → Power Costs**: How the power operates determines the form of its costs. Absorption-type power''s cost is the absorbed; cultivation-type power''s cost falls on the self; pact-type power''s cost is whatever the entity demands.

3. **Power Costs → Power Tiers**: Each tier''s advancement cost should escalate, from physical costs at lower tiers to existential costs at the peak. The cost escalation IS the tier structure.

4. **Power Tiers → Protagonist Advantage**: The protagonist''s advantage should enable them to challenge opponents above their tier — but the mechanism is "paying greater costs" not "being innately special."

5. **All fields → Forbidden Powers**: Forbidden powers are the extreme extension of every rule in the power system. They are what happens when someone pushes every cost to the absolute maximum.

---

### Common Mistakes

1. **Costless power system**: Advancement and power usage are entirely painless — this is not grimdark, it is standard power fantasy. Every use of power, especially significant power, must cost something. The cost is what makes the protagonist''s choices meaningful.

2. **Abstract costs**: Writing "there will be a price" without specifying what it is. Costs must be perceivable, quantifiable, and visceral. Not "it costs life force" but "each cast ages the user by one year, and at Tier 4, a single battle can cost a decade."

3. **Insufficient tier gaps**: Lower and higher tiers are just "a bit stronger and a bit weaker." Grimdark tier gaps should be crushing — a Tier 2 against a Tier 4 is not a hard fight, it is a massacre. This makes the protagonist''s need to advance (and pay the costs) urgent and believable.

4. **Protagonist advantage is a pure cheat code**: The System gives unlimited golden fingers, undermining the "why must they be ruthless" logic entirely. If the protagonist can level up for free, there''s no narrative reason for moral compromise.

5. **Forbidden powers without real consequences**: Using forbidden arts with no lasting effects — forbidden power consequences must persistently impact the plot, create new enemies, change the protagonist, or alter the world.

6. **Power system disconnected from worldbuilding**: The power system exists in isolation without connecting to social structure, political landscape, or economic systems. Power should shape society — who has it, who doesn''t, and how that creates the inequalities the protagonist exploits.

7. **Forgetting power system implications for the world**: If the power system allows absorbing others'' strength, then EVERYONE is both predator and prey. If power requires rare resources, then wars over those resources are inevitable. The power system''s rules should logically produce the world''s conflicts.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Ruthless Protagonist Novel' LIMIT 1),
  1,
  51,
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
