-- The Protagonist Hunter「Plot Foreknowledge」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Protagonist Hunter' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-protag-hunter-plot-foreknowledge-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'protag-hunter-plot-foreknowledge-setting-gen',
  '「Plot Foreknowledge」设定生成：为 The Protagonist Hunter 生成剧情预知情报设定，包括勇者身份外挂、关键剧情节点、时间窗口、知识盲区',
  '"Plot Foreknowledge" setting generation: generate plot foreknowledge settings for The Protagonist Hunter, including hero identity and cheat abilities, key plot events, critical time windows, and knowledge blind spots',
  '## 「Plot Foreknowledge」设定生成 — The Protagonist Hunter

「Plot Foreknowledge」是猎杀主角小说中最核心的系统性设计。它不只是"主角知道原著剧情"这一句话——它是一个精密的情报体系，定义了主角知道什么、不知道什么、以及这些情报在实际行动中如何转化为优势或陷阱。

预知情报设计的最大误区是让主角"无所不知"。一个知道一切的主角不会产生戏剧张力——读者会觉得猎杀只是在走流程。真正精彩的预知设定是：主角掌握足够的核心情报发动精准打击，同时在关键时刻面对情报不完整带来的生死抉择。

---

### 字段生成指南

#### 勇者身份与外挂

主角对勇者的了解是猎杀行动的核心靶标信息。需要设计以下几个维度：

**勇者的显性信息**（主角清楚了解）
- 勇者的姓名、原始世界身份（普通高中生/大学生/社会人）
- 勇者的基础性格（热血型/冷静型/胆小型）
- 勇者的核心成长路线（剑圣/魔法师/多系全才）

**勇者的外挂/天命机缘**（最重要的情报）
- 系统类外挂：状态面板、技能书、经验值加成
- 关系类外挂：被神明庇护、圣女爱上勇者、国王视勇者为救星
- 机缘类外挂：主角光环（幸运值极高）、关键时刻总能获得援助、绝境中会触发隐藏力量

**勇者的弱点**（猎杀的切入点）
- 人格弱点：善良到天真、对盟友的感情牵绊、容易被激怒
- 战斗弱点：特定属性克制、需要热身时间、单挑强团战弱
- 成长瓶颈：哪些机缘是他成长的必要条件（一旦被阻断，成长就停滞）

设计原则：勇者的外挂必须设计得足够强大，让读者感受到"猎杀真的很难"，但同时主角的预知让他找到了外挂的缝隙。

#### 关键剧情事件清单

原著中的剧情事件按照对主角的危险程度和可干预性进行分级：

**S级事件**（必须干预，否则主角直接死亡）
- 示例：勇者攻打主角据点的时间节点
- 示例：原著中主角被秘密暗杀的事件
- 干预策略：在事件发生前主动破坏触发条件

**A级事件**（高优先级干预，对主角利益影响重大）
- 示例：勇者获得某件神器的关键任务
- 示例：某位重要盟友在原著中会被勇者策反的时间点
- 干预策略：提前截断机缘，或将勇者引向其他方向

**B级事件**（可利用事件，主动干预可获得额外收益）
- 示例：原著中某个强大的怪物会在第X章出现并杀死勇者队友（主角可以将怪物收编）
- 示例：原著中的某场大战会削弱正派主力（主角可以趁虚而入）
- 干预策略：顺势利用，最小化自身成本

**C级事件**（情报监控，暂不干预）
- 示例：勇者在原著中的日常成长事件
- 干预策略：监控并记录实际走向，与预期对比，发现偏差

#### 必须抢占的关键时间窗口

时间窗口是预知优势的最直接体现：在勇者行动之前，提前到达关键地点，获得关键资源或信息。

**资源抢占窗口**
- 在勇者去获得某件神器之前，先一步找到它
- 在原著中某个强力NPC加入勇者队伍之前，先与其建立关系
- 在原著中某个势力向勇者投诚之前，先派人渗透或收买

**关键时间点的设计原则**
- 窗口必须有明确的截止时间（不能是"大概在某个时期"）
- 窗口的长短直接影响行动的难度：提前一年到达很容易，提前三天是极限挑战
- 每个窗口都应该有一个"如果没能抢占会发生什么"的后果

#### 知识盲区

这是整个预知系统中最重要的设计元素，也是最常被忽略的。知识盲区让主角的预知有限制，让故事保持张力。

**盲区类型一：未读章节**
主角只读过原著的部分内容（比如前30章），后续剧情完全不知道。
- 设计要点：明确划定已知和未知的边界
- 戏剧效果：主角越接近"阅读截止点"，不安全感越强

**盲区类型二：自身干预造成的剧情偏差**
主角每次成功干预，都会造成原著剧情的偏移。偏移积累到一定程度后，原著的预知失效——勇者不再按照原著的路线行动了。
- 这是最危险的盲区：主角的成功越多，未来情报越不可靠
- 设计要点：设定一个"蝴蝶效应阈值"——当主角的干预累积到某个程度，剧情会开始大幅偏离
- 戏剧效果：主角面临"越成功越盲目"的困境

**盲区类型三：原著未深入描写的领域**
原著以勇者视角为主，大量反派内部情况没有被详细描写。主角虽然知道结果，但不知道过程。
- 示例：原著中写"魔王最终被打败"，但没有描写魔王军内部的政治斗争
- 主角转生成魔王军成员后，发现内部比想象中复杂得多

**盲区类型四：角色内心活动的不可见性**
主角知道原著角色的行为，但不知道他们的内心。这让利用人物关系变得危险：
- 主角知道某人最终会背叛，但不知道背叛的具体触发条件
- 主角知道某人会帮助勇者，但不知道他们为什么这么做——而这个"为什么"可能是主角可以利用的漏洞

---

### 字段联动关系

- **勇者外挂强度 → 猎杀难度 → 知识盲区的容忍空间**：勇者外挂越强，主角对盲区的容忍度越低——每一个意外都可能是致命的
- **关键事件密度 → 节奏控制**：S级和A级事件的数量决定了故事的紧张程度；过多会让主角疲于奔命，过少会让剧情平淡
- **时间窗口长短 → 积累期设定**：如果最早的A级事件在原著第50章，则主角有约50章的时间积累实力再开始干预
- **盲区设计 → 意外剧情来源**：每个盲区都应该在故事中产生至少一次"意外"，这些意外是故事最精彩的节点

---

### 常见错误

1. **预知设定为"万能"**：主角知道每一个细节，所有行动都是完美的流程走完——这等于取消了故事的悬念，读者很快厌倦
2. **盲区设计但从不激活**：说主角有知识盲区，但剧情中从来没有出现因为盲区导致的意外——盲区必须真正"咬"到主角
3. **关键事件清单过长且无主次**：列了几十个事件，主角东奔西跑，故事失去焦点。每个阶段只需要1-2个核心干预目标
4. **时间窗口设计太宽松**：主角总是提前很久到达，没有惊险感。优秀的时间窗口设计应该时常让主角"刚好赶上"甚至"险些来不及"
5. **勇者外挂强度与故事阶段不匹配**：前期勇者就有压倒性优势，主角根本无从下手；或者勇者外挂太弱，主角轻松碾压失去"猎杀的意义"',
  '## "Plot Foreknowledge" Setting Generation — The Protagonist Hunter

The "Plot Foreknowledge" is the most central systematic design element in the Protagonist Hunter subgenre. It is not simply "the protagonist knows the original story" — it is a precise intelligence system that defines what the protagonist knows, what they *do not* know, and how this intelligence translates into strategic advantage or catastrophic failure in practice.

The most critical mistake in designing foreknowledge is making the protagonist omniscient. An all-knowing protagonist generates zero dramatic tension — the reader will feel that the hunt is merely executing a predetermined script. The best foreknowledge design creates a protagonist with *enough* core intelligence to mount precise strikes, while facing life-or-death decisions when that intelligence proves incomplete or invalidated.

---

### Field Generation Guide

#### Hero Identity and Cheat Abilities

The protagonist''s knowledge of the hero (Yuusha) is the core targeting intelligence for the hunt. This must be designed across several dimensions:

**Explicit Information** (what the protagonist knows clearly)

- The hero''s name and original-world identity (ordinary high school student / college student / working adult)
- The hero''s baseline personality type: hot-blooded idealist, calm tactician, cowardly but growth-oriented, naive pacifist
- The hero''s core growth trajectory: sword saint, magic specialist, multi-attribute generalist, support-type that becomes overwhelming at full power

This explicit information is the protagonist''s most reliable foreknowledge, because it is established at the story''s beginning before any interference occurs.

**The Hero''s Cheat Ability / Destiny Boon** (the most critical intelligence)

The cheat ability is the mechanism through which the hero is "chosen" — it is what makes killing them so difficult and what the protagonist must design around.

*System-type cheats*:
- Status panel with visible level, attributes, and skills
- Skill books that appear in front of the hero at key moments
- Experience multipliers that make the hero grow faster than any native of the world

*Relationship-type cheats*:
- Divine protection that alerts the hero to mortal danger
- The Saintess falling for the hero (providing healing and political connections)
- The King treating the hero as the nation''s hope (resources, troops, sanctuary)
- Key NPCs inexplicably trusting and helping the hero

*Fortune-type cheats*:
- Protagonist aura: the hero''s luck is statistically impossible — they always encounter the right person, find the right item, survive the unsurvivable
- Crisis power spikes: when backed into a corner, the hero unlocks hidden power
- Reinforcement timing: allies always arrive exactly when needed

Understanding *how* the cheat functions is more important than knowing that it exists. The protagonist who knows the cheat can hunt for its weaknesses; the protagonist who only knows the hero is "lucky" cannot.

**The Hero''s Exploitable Weaknesses** (the hunt''s entry points)

*Personality weaknesses*:
- Excessive altruism: cannot abandon those in need, even enemies who feign distress
- Emotional attachments to party members: can be manipulated through those relationships
- Easily provoked by injustice: can be baited into situations advantageous to the protagonist
- Black-and-white moral framework: struggles with moral dilemmas that have no clean answer

*Combat weaknesses*:
- Elemental resistance gaps (fire-type heroes weak to water)
- Needs "warm-up" time before reaching peak performance — ambushes before that peak are devastating
- Strong in 1v1 duels, weak in chaotic multi-enemy engagements
- Relies on a specific ally''s support (remove the ally, reduce effectiveness)

*Growth bottlenecks*:
- Specific milestones the hero *must* hit to continue growing (particular dungeons, particular NPCs, particular items)
- If these growth gates are blocked, the hero stagnates
- This is the most powerful form of strategic interference: denying growth rather than direct confrontation

**Design principle**: The hero''s cheat must feel genuinely formidable. Readers need to feel the difficulty of the hunt. At the same time, the protagonist''s foreknowledge must expose the cheat''s *seams* — the specific conditions under which it fails or can be circumvented.

---

#### Key Plot Events Catalog

Plot events from the original novel should be organized by threat level and intervention feasibility:

**S-Tier Events** (Must Intervene — Failure Means Death or Catastrophic Loss)

These are events where the original storyline directly threatens the protagonist''s existence. Intervention is non-negotiable.

- Example: The hero''s assault on the protagonist''s stronghold at a specific story milestone
- Example: A secret assassination of the protagonist''s character in the original story, triggered when the protagonist takes a specific action
- Example: A betrayal within the protagonist''s inner circle that the original novel established as the beginning of the villain''s downfall

*Intervention strategy*: Proactively destroy the triggering conditions before the event window opens. Do not wait for the event to begin — prevent the setup.

**A-Tier Events** (High Priority — Significant Strategic Impact)

These events don''t directly kill the protagonist but substantially alter the power balance.

- Example: The hero acquiring a divine artifact in a quest that the protagonist can reach first
- Example: A powerful neutral faction choosing to ally with the hero in the original story — which the protagonist can preempt
- Example: A key subordinate''s defection to the hero''s side at a specific story moment

*Intervention strategy*: Cut off the opportunity before it opens (arrive first, corrupt the trigger, redirect the hero), or convert the event into an advantage.

**B-Tier Events** (Exploitable — Passive Interference Creates Gains)

These events in the original story created outcomes the protagonist can opportunistically exploit.

- Example: A powerful monster that killed one of the hero''s party members in Chapter X — the protagonist can recruit it or redirect it
- Example: A major battle in the original that exhausted the righteous faction''s main forces — the protagonist can use this window to expand
- Example: A schism in the hero''s party that the protagonist can widen into a permanent split

*Intervention strategy*: Position assets to exploit the event as it unfolds; minimize direct protagonist involvement to preserve intelligence secrecy.

**C-Tier Events** (Monitoring Only — Intelligence Gathering)

Routine hero growth events that do not require intervention.

- Example: The hero completing standard dungeons, gaining levels, acquiring minor items
- *Intervention strategy*: Maintain surveillance; compare actual outcomes to the expected original storyline to detect deviation and recalibrate threat assessments.

**Catalog design principle**: Each tier should have progressively more events than the one above it. An overloaded S-tier (too many existential threats simultaneously) is as bad as an underloaded one. The protagonist should face *one primary existential threat at a time*, with A-tier events creating constant background pressure.

---

#### Critical Time Windows

Time windows are the most direct expression of the protagonist''s foreknowledge advantage: arriving before the hero at locations, resources, and relationships the hero is destined to claim.

**Resource Interception Windows**

- Locating a divine artifact before the hero''s "destined" dungeon run to find it
- Recruiting a powerful NPC before the hero''s storyline encounter makes them an inevitable ally
- Infiltrating or subverting a neutral faction before the hero''s diplomatic mission converts them

**Window Design Principles**

1. *Every window must have a hard deadline*. Vague timing ("sometime in the second half of the story") eliminates urgency. Precise deadlines create tension: "The Dragon King accepts the alliance offer any time before the Midsummer Festival — the hero arrives at the Dragon Kingdom on the third day of that festival."

2. *Window duration determines difficulty*. Arriving one year early is comfortable; arriving three days early is a crisis. Vary the window lengths across the story to control pacing.

3. *Every window must have a "failure cost"*. If the protagonist misses a window, what happens? The answer should be serious enough to matter but not automatically fatal — missing one window should escalate pressure, not end the story.

4. *Some windows should be deliberately foregone*. The protagonist cannot be everywhere. Choosing which windows to prioritize and which to sacrifice creates strategic depth and character revelation.

---

#### Knowledge Blind Spots

This is the most important design element in the entire foreknowledge system — and the most frequently neglected. Blind spots give the protagonist''s foreknowledge meaningful limitations, maintaining the story''s tension and creating its most dramatically powerful moments.

**Blind Spot Type 1: Unread Chapters**

The protagonist only read part of the original novel. Everything beyond their reading point is unknown.

- Design requirement: establish a clear boundary between known and unknown territory
- Calibrate: a protagonist who read the entire story has minimal blind spots; one who only read the first arc faces massive uncertainty in later arcs
- Dramatic effect: as the story approaches the boundary of the protagonist''s knowledge, anxiety escalates. Chapters near the boundary should feel qualitatively different — less confident planning, more improvisation.
- Example: "I read up to the end of Volume 3. Everything after the Demon King''s Coronation Arc is a complete blank. And the Coronation Arc ends in... approximately four months."

**Blind Spot Type 2: Self-Induced Divergence**

Every successful intervention causes the original storyline to deviate. As deviations accumulate, the foreknowledge becomes unreliable — the hero no longer follows the expected path.

This is the most dangerous blind spot because *the protagonist''s success creates it*.

- The more effectively the protagonist hunts, the less accurate their intelligence becomes
- Design requirement: establish a "butterfly effect threshold" — when cumulative interventions exceed a certain scope, major storyline divergences begin occurring
- Dramatic effect: the protagonist faces the dilemma of "the more I succeed, the blinder I become." Their foreknowledge is a wasting resource that they must use wisely before it expires.
- Example: "After I intercepted the hero''s Fire Spirit encounter, the original Chapter 12 events clearly did not happen as written. By Chapter 18, I was noticing three other predicted events that failed to materialize. I am running out of reliable intelligence."

**Blind Spot Type 3: Villain-Side Internal Mechanics**

The original novel was written from the hero''s perspective. The villain faction''s internal politics, resources, and betrayal timelines were rarely detailed.

- The protagonist knows the *results* (the villain faction ultimately lost) but not the *process* (which specific subordinates were moles, which resources were secretly diverted, which alliances were secretly broken)
- Reincarnating into a villain-faction identity means the protagonist faces significant uncertainty about their own faction
- Example: "The novel mentioned that the Demon Lord''s armies were undermined by internal betrayal. Which general? I don''t know. The novel never specified. And I have twelve generals."

**Blind Spot Type 4: Character Internal States**

The protagonist knows what characters *do* but not why. This makes relationship exploitation dangerous:

- The protagonist knows "Commander Aldric betrays the protagonist''s faction in Chapter 28" but does not know what *triggers* the betrayal — is it a bribe? A threat against his family? A philosophical disillusionment?
- Without knowing the trigger, the protagonist cannot reliably prevent the betrayal (they can only remove Aldric, which creates its own consequences)
- The protagonist knows "the Saintess eventually helps the hero" but not what changed her initially neutral stance — understanding the "why" would allow the protagonist to prevent it; not knowing the "why" means they can only respond after the fact

**Design requirement**: Each blind spot type should produce at least one significant "unexpected crisis" in the story. Blind spots that never activate are wasted potential. The reader needs to see the protagonist genuinely surprised, wrong, and forced to improvise — these are the most engaging moments in the entire narrative.

---

### Field Interaction Guidelines

The foreknowledge system''s four components interact to shape the story''s strategic texture:

- **Hero cheat strength → Hunt difficulty → Blind spot tolerance**: The more powerful the hero''s cheat, the less margin for error the protagonist has. Even small blind spots become potentially fatal when the hero is formidable.
- **Event tier density → Pacing control**: Too many simultaneous S-tier and A-tier events creates chaos without focus. Too few creates stagnation. The ideal is a constant A-tier background pressure with S-tier crises arriving at dramatically appropriate intervals.
- **Time window length → Accumulation phase**: If the earliest A-tier events are far into the original storyline, the protagonist has time to accumulate. If they are early, the protagonist must begin active hunting almost immediately.
- **Blind spot design → Improvisation moments**: Each blind spot should generate exactly one moment where the protagonist must operate without the foreknowledge advantage. These moments reveal character most clearly.

---

### Common Mistakes

1. **Treating foreknowledge as omniscience**: The protagonist knows every detail and executes perfectly every time. This eliminates suspense and makes the story feel like a walkthrough guide rather than a narrative. Foreknowledge should be powerful but *specific and bounded*.

2. **Designing blind spots that never activate**: The system mentions knowledge limitations, but the story never produces a scenario where those limitations cause real problems. Every designed blind spot must bite the protagonist at least once.

3. **Event catalogs too long and undifferentiated**: Listing thirty plot events with equal weight gives the protagonist no focus and the reader no way to track priorities. Each story phase should have *one primary intervention target*, with secondary events creating supporting pressure.

4. **Time windows consistently too generous**: The protagonist always arrives comfortably early, never under pressure. Effective time window design should occasionally put the protagonist at the absolute edge — arriving with minutes to spare, executing imperfectly under duress.

5. **Hero cheat power imbalance across story phases**: A hero with overwhelming advantage in the early chapters gives the protagonist no room to maneuver. A hero who is too weak makes the hunt feel trivial. Scale the hero''s cheat power to grow alongside the protagonist''s interference — the hunt should become progressively more demanding as both sides escalate.

6. **Ignoring divergence feedback loops**: Once the protagonist starts interfering, the original plot begins to change. Stories that fail to track these changes create logical inconsistencies — the protagonist predicts events that should no longer be on schedule given their earlier interventions. Foreknowledge must be actively updated and recalibrated as the story progresses.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Protagonist Hunter' LIMIT 1),
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
