-- The Ruthless Protagonist Novel「角色」生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Ruthless Protagonist Novel' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-ruthless-protag-character-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ruthless-protag-character-gen',
  '「角色」生成：为 Grimdark/反英雄小说生成角色，基于冷酷主角体系设计角色阵容——每个角色都有自己的 agenda，没有纯善纯恶，只有利益与生存',
  '"Character" generation: generate characters for Grimdark & Anti-Hero fiction, building a cast around the ruthless protagonist — everyone has an agenda, no one is purely good or evil, only interests and survival matter',
  '## 「角色」生成 — 冷酷主角小说

Grimdark 角色设计的核心原则是**人人皆有 agenda**。这个世界没有无私的好人，也没有为了作恶而作恶的纯粹反派。每个角色都有自己的利益驱动、生存压力和道德底线（或没有底线）。主角的"冷酷"不是脸谱化的邪恶，而是在一个不公正世界中做出理性选择的结果。

角色设计必须与已有设定联动：Core Premise 的原型决定主角的冷酷方式，Power System 影响角色的实力定位，Worldbuilding 的残酷规则约束所有角色的行为逻辑。

---

### 字段生成指南

#### 姓名 (Name)

- 风格匹配世界观设定——奇幻风格用有质感的名字，现代/赛博朋克用简短有力的名字
- 主角的名字通常偏短且有力，避免过于花哨
- 反派/对手的名字可以有更多仪式感

#### 角色定位 (Role)

八个选项的设计要点：

| 定位 | 故事功能 | 设计重点 |
|------|---------|---------|
| **Protagonist** | 冷酷理性的核心视角 | 必须与 Core Premise 一致——原型、道德底线、中心冲突 |
| **Rival/Nemesis** | 主角的对等对手 | 不是简单的"坏人"——他们的逻辑和主角一样自洽 |
| **Reluctant Ally** | 被迫或勉强与主角合作 | 合作关系脆弱，随时可能翻脸 |
| **Expendable Pawn** | 主角可以牺牲的棋子 | 要让读者对其命运产生情感，这样牺牲才有冲击 |
| **Mentor Figure** | 教会主角生存法则的人 | 导师自身通常已被世界折磨过，教导的是残酷现实 |
| **Love Interest** | 情感联系，也是弱点 | 不是甜蜜恋爱——是在黑暗世界中罕见的人性联系 |
| **Betrayer** | 注定会背叛的角色 | 背叛必须有合理动机，不是为了背叛而背叛 |
| **Innocent Victim** | 被主角行为波及的无辜者 | 用来展示主角冷酷的代价 |

#### 性别 (Gender)

Grimdark 世界不需要政治正确的性别平衡。根据世界观设定选择。

#### 年龄 (Age)

- 年龄应反映角色的经历——在残酷世界中，年轻人往往已经历了超出年龄的创伤
- 导师通常年长但不一定——有时最好的老师是年纪不大但经历残酷的人

#### 核心动机 (Core Motivation)

**最关键的字段之一**。Grimdark 角色的动机规则：
- 每个动机都必须来自角色的个人经历，而非抽象理念
- 生存 > 理想——大多数角色的底层动机是活下去
- 动机之间可以矛盾（想复仇又想保护家人）
- 主角的动机必须与 Core Premise 的 Central Conflict 一致

#### 道德定位 (Moral Alignment)

- 不要用简单的善恶二分法
- 描述角色的道德底线在哪里——以及什么情况下他们会突破这条线
- 参考 Core Premise 的 Moral Compass 设定主角的基准

#### 优势 (Strengths)

- 必须与 Power System 联动——角色的战斗力或政治能力要在力量体系内合理
- 主角的优势通常不是最强的力量，而是最脏的手段或最灵活的头脑
- 反派的优势应该在某些方面压制主角

#### 弱点 (Weaknesses)

- **每个角色必须有真实的弱点**——这是 Grimdark 的核心
- 弱点不是表面的（"太善良"不算弱点）
- 常见的好弱点：过度自信、无法信任他人、对某人的执念、道德残留
- 弱点应该是其他角色可以利用的

#### 与主角关系 (Relationship to Protagonist)

- 关系是动态的——盟友可能变敌人，敌人可能被利用
- 描述当前关系和变化的可能方向
- 主角对不同角色的态度不同——有些是工具，有些勉强算同伴
- 所有关系都建立在利益基础上，纯粹的情感纽带极其罕见

#### 当前状态 (Current Status) [动态字段]

- 随剧情推进更新
- 格式："[处境] — [关键状况]"

#### 当前情绪状态 (Current Emotional State) [动态字段]

- 随剧情推进更新
- Grimdark 角色通常压抑情绪——表面冷静，内心可能已经崩溃

---

### 角色阵容建议

批量初始化时的推荐配置：

**第一优先级（必须创建）**：
1. **主角 (Protagonist)**：冷酷理性的核心角色。原型和动机完全由 Core Premise 决定
2. **主要对手 (Rival/Nemesis)**：与主角棋逢对手的人。他们的逻辑同样自洽，甚至可能比主角更有道理

**第二优先级（强烈建议）**：
3. **勉强盟友 (Reluctant Ally)**：与主角利益暂时一致的人。合作关系充满张力
4. **牺牲品 (Expendable Pawn)**：主角会在必要时牺牲的人。需要让读者对其产生感情

**第三优先级（可选）**：
5. **导师 (Mentor Figure)**：教会主角在这个世界的生存法则的人
6. **情感联系 (Love Interest 或 Innocent Victim)**：为故事提供人性的维度

---

### 与已有设定的联动

| 设定模块 | 对角色的影响 |
|---------|------------|
| **Core Premise** | Protagonist Archetype→主角的冷酷方式（算计型/生存型/复仇型等）；Central Conflict→角色关系的核心张力；Moral Compass→主角的道德基准线 |
| **Power System** | Power Type→角色的能力类型；Power Costs→力量的代价影响角色的选择；Forbidden Powers→主角可能使用禁忌力量 |
| **Worldbuilding** | World Type→角色的生存环境；Power Structure→角色在权力体系中的位置；Social Hierarchy→阶层关系 |
| **Story Hook** | Core Selling Point→角色设计要服务于卖点；Opening Tension→开篇角色配置 |
| **Writing Style** | Violence Threshold→角色冲突的烈度；Narrative POV→视角限制 |

---

### 常见错误

1. **主角太过刻意的邪恶**：冷酷不等于无脑残忍。最好的冷酷主角是"在这个情况下，这是最理性的选择"——读者甚至会认同
2. **反派智商下线**：反派必须聪明且有合理动机。如果反派太蠢，主角的胜利毫无含金量
3. **所有角色都是一个模子**：不是每个人都要像主角一样冷酷。有些角色的存在就是为了对比——展示"正常人"在这个世界的命运
4. **忽视弱点设计**：没有弱点的角色无法制造有意义的冲突。即使主角也需要关键弱点
5. **关系过于静态**：Grimdark 的魅力之一是关系的不确定性——盟友可能背叛，敌人可能有共同利益
6. **牺牲品没有人格**：如果要牺牲一个角色来展示主角的冷酷，这个角色必须先让读者在意
7. **道德定位非黑即白**：避免简单的善恶标签。即使是最残忍的角色也有他们的内在逻辑',
  '## "Character" Generation — The Ruthless Protagonist Novel

The foundational principle of Grimdark character design is **everyone has an agenda**. There are no selfless saints in this world, nor are there villains who are evil for evil''s sake. Every character is driven by self-interest, survival pressure, and their own moral lines (or lack thereof). The protagonist''s "ruthlessness" is not cartoonish villainy — it''s the result of making rational choices in an unjust world.

This is the lesson of Fang Yuan from *Reverend Insanity*, Bayaz from *The First Law*, Glokta from *The Blade Itself*, and Taylor Hebert from *Worm* — protagonists who make readers uncomfortable yet keep them turning pages, because in context, their choices make terrible, logical sense.

Character design must interlink with existing settings: Core Premise''s archetype determines the protagonist''s brand of ruthlessness, Power System shapes combat capabilities and their costs, and Worldbuilding''s harsh rules constrain every character''s behavioral logic.

---

### Character System Overview

In Grimdark fiction, characters exist on a spectrum of moral compromise rather than a good-evil binary. The cast should include:

- **Those who chose ruthlessness** — characters who made a conscious decision to abandon conventional morality for power, survival, or vengeance
- **Those who were broken into ruthlessness** — characters shaped by trauma, betrayal, or the cruelty of the world
- **Those who cling to ideals** — characters who still believe in mercy, justice, or honor. They exist to be tested, broken, or to serve as mirrors reflecting what the protagonist has lost
- **Those who are unknowingly complicit** — characters who think they''re good people while benefiting from the same corrupt systems they claim to oppose

Every character should have:
1. A **motivation** rooted in personal experience (never abstract ideology alone)
2. A **logical internal framework** that justifies their actions to themselves
3. At least one **relationship** that complicates their agenda
4. A **vulnerability** that could be exploited

---

### Field Generation Guide

#### Name

- Match the naming style to the worldbuilding setting — gritty fantasy names for dark fantasy, sharp monosyllabic names for modern/cyberpunk
- Protagonist names tend to be short, punchy, and unadorned — not flowery or noble-sounding
- Rivals and antagonists can have names with more gravitas, ceremony, or irony (a villain named "Mercy" or "Grace")
- Avoid names that telegraph the character''s morality ("Shadow Dark" or "Brave Light")

#### Role

Eight roles, each serving a distinct narrative function in the ruthless protagonist''s story:

| Role | Narrative Function | Design Focus |
|------|-------------------|-------------|
| **Protagonist** | The cold, rational core perspective through which readers experience the story | Must align perfectly with Core Premise — archetype, moral compass, central conflict. The protagonist''s ruthlessness should feel *necessary* given their circumstances, not gratuitous |
| **Rival/Nemesis** | The protagonist''s equal-or-superior opponent who provides the primary external pressure | Not a simple "bad guy" — their logic is as internally consistent as the protagonist''s. The best rivals are dark mirrors: they and the protagonist want the same thing or use the same methods, creating a "there but for grace" tension (e.g., Bayaz vs. Khalul in *First Law*) |
| **Reluctant Ally** | A character forced by circumstances to cooperate with the protagonist despite mutual distrust | The alliance is fragile and transactional. Neither party fully trusts the other. The tension lies in *when* (not if) the alliance will fracture (e.g., Logen Ninefingers and the Union in *The Blade Itself*) |
| **Expendable Pawn** | A character the protagonist can and will sacrifice when strategically necessary | **Critical design requirement**: this character must be sympathetic enough that their sacrifice carries emotional weight. If readers don''t care about the pawn, their death means nothing. Give them a name, a dream, a small humanity — then let the protagonist discard them (e.g., the soldiers Fang Yuan uses in *Reverend Insanity*) |
| **Mentor Figure** | The character who teaches the protagonist the rules of this brutal world | The mentor is typically someone already broken by the world. They teach survival, not morality. Their lessons are cynical truths: "Trust is a weapon others use against you." The mentor often meets an ironic end — destroyed by the very rules they taught (e.g., Juvens teaching Bayaz, who then surpasses and eclipses him) |
| **Love Interest** | An emotional connection that doubles as a vulnerability | This is NOT a romance subplot — it''s a tension point. The love interest represents the last shred of humanity the protagonist hasn''t sacrificed. The question is: will they sacrifice this too? (e.g., Ferro and Logen''s complicated dynamics) |
| **Betrayer** | A character destined to betray — but whose betrayal must feel inevitable in hindsight | The betrayal must have rational motivation. Design the betrayer with visible warning signs that become obvious only in retrospect. Their betrayal should force the protagonist to adapt, not just suffer |
| **Innocent Victim** | A character damaged or destroyed by the protagonist''s actions, directly or indirectly | Their purpose is to measure the cost of the protagonist''s ruthlessness. They represent what "normal people" experience when someone like the protagonist operates. Without victims, ruthlessness has no weight |

#### Gender

Choose based on the worldbuilding and the story''s needs. Grimdark fiction does not require gender balance — it requires *authentic* characters. Consider whether the world''s power structures create gender-specific dynamics that add depth.

#### Age

- Age should reflect experience, not just years. In a brutal world, a 16-year-old may have seen more horrors than a 40-year-old in a peaceful setting
- Young protagonists in grimdark often feel older than their years — the world aged them prematurely
- Mentors don''t have to be old — sometimes the most effective teacher is someone barely older but far more hardened

#### Core Motivation

**One of the most critical fields.** Grimdark character motivation rules:

- Every motivation must stem from **personal experience**, not abstract ideology. "I fight for justice" is weak. "I watched my village burn while the ''just'' king did nothing, so now I''ll tear his kingdom apart" is strong
- **Survival > Ideals** — most characters'' deepest motivation is staying alive. Everything else is built on top of that foundation
- Motivations can be **contradictory** — wanting revenge while also wanting to protect someone. Internal conflict creates depth
- The protagonist''s motivation must align with Core Premise''s Central Conflict
- Draw from proven patterns: Fang Yuan''s eternal life obsession, Glokta''s need to matter despite his broken body, Taylor''s escalating "the ends justify the means"

#### Moral Alignment

- **Never use simple good/evil labels.** Instead, describe:
  - Where the character draws their moral line (what they won''t do... yet)
  - Under what circumstances they''d cross that line
  - Whether they feel guilt, indifference, or satisfaction when they compromise
- Reference Core Premise''s Moral Compass for the protagonist''s baseline
- The most compelling characters are those whose moral position *shifts* during the story — not randomly, but under pressure
- Examples of well-drawn moral positions:
  - "Will kill without hesitation but cannot harm children" (a specific, testable line)
  - "Genuinely believes their actions serve a greater good, no matter how horrific" (self-justified ruthlessness)
  - "Has no moral framework at all — judges everything by utility" (pure pragmatism, like Fang Yuan)

#### Strengths

- Must link to the Power System — character combat ability and political leverage must make sense within the established power framework
- **The protagonist''s advantage is typically NOT being the strongest.** It''s being the most ruthless, the most adaptable, or the most willing to use methods others won''t touch
- The rival/nemesis should outclass the protagonist in at least one dimension — raw power, resources, social legitimacy, or number of allies
- Strengths should also include non-combat abilities: political cunning, information networks, psychological manipulation, willingness to sacrifice

#### Weaknesses

- **Every character MUST have genuine, exploitable weaknesses** — this is the heart of grimdark storytelling
- Surface-level weaknesses don''t count. "Too loyal" or "too brave" are not real weaknesses
- Strong weakness examples:
  - Overconfidence that leads to underestimating opponents
  - Inability to trust anyone, which prevents building necessary alliances
  - An obsession with a specific person or goal that creates blind spots
  - Residual morality that can be exploited by enemies who don''t share it
  - Physical limitation or trauma that can''t be overcome
- Weaknesses should be **weaponizable** — other characters in the story should be able to identify and exploit them

#### Relationship to Protagonist

- All relationships are **dynamic** — allies can become enemies, enemies can become tools. Describe both the current state AND the direction of potential change
- The protagonist views most relationships through a **utilitarian lens**: "What can this person do for me? What threat do they pose?"
- Rare genuine emotional connections should be explicitly marked as such — they''re the exception, and the story''s tension often comes from whether the protagonist will sacrifice them
- Describe the **power dynamic**: who has leverage, who depends on whom, and what would shift the balance

#### Current Status (Dynamic Field)

- Updates as the story progresses
- Format: "[Situation] — [Key circumstance]"
- Example: "Imprisoned in the Iron Keep — awaiting execution after failed coup"

#### Current Emotional State (Dynamic Field)

- Updates as the story progresses
- Grimdark characters typically suppress emotions — surface calm masking interior turmoil, numbness from repeated trauma, or cold focus that cracks under extreme pressure

---

### Character Lineup Recommendations

For batch initialization, recommended configuration:

**First Priority (must create)**:
1. **Protagonist**: The ruthless, rational core character. Archetype and motivation entirely determined by Core Premise. Design them so readers understand *why* they''re ruthless, even if they don''t approve
2. **Rival/Nemesis**: Someone who matches or exceeds the protagonist. Their logic is equally valid — they may even have a better claim to being "right." The best rivalries are between two ruthless people with incompatible goals

**Second Priority (strongly recommended)**:
3. **Reluctant Ally**: Someone whose interests temporarily align with the protagonist. The alliance is a ticking time bomb — the question is how long it lasts and what triggers the break
4. **Expendable Pawn**: Someone the protagonist WILL sacrifice. Give this character enough humanity that their sacrifice makes readers feel something. This is the character that proves the protagonist isn''t all talk — they will actually spend human lives like currency

**Third Priority (optional but enriching)**:
5. **Mentor Figure**: The person who taught the protagonist that the world runs on power and pain. They embody the worldview the protagonist has adopted — and possibly its limitations
6. **Love Interest or Innocent Victim**: The human element. For Love Interest — the one person who sees past the protagonist''s armor. For Innocent Victim — the person who pays the price for the protagonist''s choices without having chosen to be involved

---

### Setting Linkage

| Setting Module | Impact on Characters |
|---------------|---------------------|
| **Core Premise** | Protagonist Archetype → the specific brand of ruthlessness (Calculating Strategist makes very different decisions than Survival-Driven Pragmatist); Central Conflict → the axis around which all character relationships revolve; Moral Compass → the protagonist''s baseline morality that other characters are measured against; Stakes → what the protagonist stands to lose, which shapes vulnerability design |
| **Power System** | Power Type → determines what "strength" means in this world; Power Costs → creates moral dilemmas (what are characters willing to pay for power?); Power Tiers → establishes hierarchy; Protagonist Advantage → the specific edge that lets the MC compete; Forbidden Powers → temptations and moral red lines |
| **Worldbuilding** | World Type → environmental pressures on all characters; Power Structure → who holds authority and who challenges it; Social Hierarchy → class-based tensions and conflicts; World Rules → harsh realities that force moral compromise |
| **Story Hook** | Core Selling Point → characters must embody the story''s unique appeal; Opening Tension → initial character positions and conflicts; Reader Expectation → what satisfying character dynamics readers anticipate |
| **Writing Style** | Narrative POV → which character''s perspective dominates; Violence Threshold → how graphic character conflicts get; Prose Style → affects how character interiority is expressed |

---

### Common Errors

1. **Mistaking cruelty for characterization**: A protagonist who tortures people for fun is not "ruthless" — they''re a psychopath with no reader appeal. The best ruthless protagonists make readers think "I hate that they did that... but I understand why." Fang Yuan''s coldness works because his goal (eternal life) requires it; Glokta''s cruelty works because he''s in constant pain and projects it outward
2. **Incompetent antagonists**: If the rival/nemesis is stupid, the protagonist''s victories feel hollow. The antagonist must be smart, capable, and operating from a logical position. Their defeat should require the protagonist to dig deep, sacrifice something real, or use a method that costs them
3. **Homogeneous cast**: Not every character should be a cynical, hardened warrior. Variety creates contrast — a genuinely kind character in a grimdark world creates more tension than ten ruthless ones. Their kindness becomes either inspiring or tragically naive
4. **Neglecting weakness design**: Characters without genuine vulnerabilities cannot generate meaningful conflict. Even the protagonist needs critical flaws that enemies can target. Power without cost is boring
5. **Static relationships**: Grimdark''s appeal lies partly in relational uncertainty — will this ally stay loyal? Will this enemy become necessary? Relationships that never change or evolve waste the genre''s potential
6. **Expendable pawns with no personality**: If you''re going to sacrifice a character to show the protagonist''s ruthlessness, that character must first matter to the reader. A faceless minion''s death proves nothing. Give them a name, a family, a small dream — then crush it
7. **Morality as binary**: Avoid labeling characters as "good" or "evil." Every character should exist on a spectrum, and the most interesting ones occupy the uncomfortable middle ground where readers can''t quite decide whether to root for them or condemn them',
  (SELECT id FROM novel_creation_method WHERE name = 'The Ruthless Protagonist Novel' LIMIT 1),
  1,
  21,
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
