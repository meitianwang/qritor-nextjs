-- The Protagonist Hunter「Origin Profile」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Protagonist Hunter' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-protag-hunter-origin-profile-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'protag-hunter-origin-profile-setting-gen',
  '「Origin Profile」设定生成：为 The Protagonist Hunter 生成转生起点与原著身份设定，包括原著身份定位、指定死亡方式、起始资源优势',
  '"Origin Profile" setting generation: generate origin profile settings for The Protagonist Hunter, including the original novel identity, designated death method, and starting resource advantages',
  '## 「Origin Profile」设定生成 — The Protagonist Hunter

「Origin Profile」是猎杀主角小说中主角的出发点定义。它回答一个核心问题：主角转生成了什么？在原著世界里，他是一个被预定会死的小人物，还是一个有一定地位却注定失败的反派？这个起点直接决定了：他有多少时间、多少资源、多少行动自由，以及猎杀勇者的难度系数。

---

### 字段生成指南

#### 原著身份定位

主角可以转生为以下几种典型身份，各有利弊：

**小怪/炮灰型**
- 优势：行动隐蔽，不在勇者主线关注范围内；有大量时间积累实力；对原著世界的了解可以帮助他找到被忽略的机缘
- 劣势：起始实力极弱，积累期漫长；稍有不慎就会死在原著的随机事件中；距离勇者太远，早期难以干预
- 适合故事类型：慢热型成长流，主角在暗处蛰伏积累

**中BOSS/区域强者型**
- 优势：已有一定实力和资源；在原著中有明确的剧情节点（死于勇者之手），知道自己必须在那之前改变命运；手下有势力可以调动
- 劣势：身份显眼，勇者和正派势力会主动找上门；原著死法已定，改变命运的压力极大；身边人可能是原著中注定背叛的角色
- 适合故事类型：逆天改命型，主角利用预知绕开死亡陷阱

**主要反派/大BOSS型**
- 优势：起始资源最丰厚，手下势力最强；在原著中是勇者成长的终极考验，说明主角势力具有对抗勇者的实力
- 劣势：勇者会集中一切力量来消灭主角势力；主角需要应对整个正派阵营的围剿；原著中对主角势力的描写往往不够详细，存在大量未知
- 适合故事类型：以逸待劳型，主角在防守中主动出击

**宿命败者型（被勇者超越的前辈/天才）**
- 这是一种特殊身份：主角不是反派，而是原著中曾经的强者，最终被勇者踩着肩膀成长。他的死不是被直接杀死，而是被击败后失去地位，或间接死于勇者引发的连锁事件
- 优势：身份相对中立，有机会与勇者近距离接触；对原著世界的了解更全面，因为他本是主线世界的一部分
- 劣势：预知优势最难利用——他的"失败"是渐进式的，很难找到单一的干预节点；身份的模糊性可能让主角陷入道德困境
- 适合故事类型：扭转命运型，主角以不同的方式影响原著走向

#### 原著指定死亡方式

指定死亡方式是悬在主角头上的达摩克利斯之剑——它既是最大的动力，也是最具戏剧张力的设定。

**单一死亡节点型**
- 主角知道自己会在某个特定事件（第X章的某场战斗）中死去
- 优势：目标明确，倒计时感强；读者和主角共同感受到死线的逼近
- 示例："原著第23章，勇者到达魔王城时，我作为门卫副统领，被一刀秒杀"

**条件触发死亡型**
- 主角的死不是特定时间节点，而是特定条件触发（勇者达到某个等级、获得某件神器后）
- 优势：主角可以通过阻止条件触发来延缓死亡；策略空间更丰富
- 示例："只要勇者获得圣剑，他的力量就会超越我的上限，然后他会来找我复仇"

**渐进式消耗死亡型**
- 主角不会被直接杀死，而是随着勇者的成长，被逐步剥夺资源、地盘、盟友，最终在某次惨败中消亡
- 优势：营造"煮青蛙"式的紧张感；每一次失去都是预兆
- 劣势：需要更精密的剧情设计

#### 起始资源优势

起始资源是主角能否在积累期生存下来并开始猎杀的关键。设计原则：资源必须足够多，让主角"有资本开始行动"，但不能多到让剧情失去张力。

**情报资产**：主角对原著剧情的了解本身就是最大的资产。设计时需要明确：
- 他了解到哪种程度的细节？（只知道大事件 vs 知道章节级别的细节）
- 他知道哪些人物的内心活动？（有限的人物感知 vs 只知道行为表现）
- 他的情报来自"已看的原著"，所以未读的部分是盲区

**实力资产**：主角转生时的战斗力定位
- 相对于勇者初期的强弱对比（此时应该强于勇者，否则无法干预）
- 有无特殊能力或功法（转生时是否继承了原角色的能力）

**人脉/组织资产**：主角手下的力量
- 有无忠心的手下（注意：原著中的部下有些会在原著中背叛，这也是预知的一部分）
- 有无可以利用的政治关系

**物质资产**：金钱、资源、根据地
- 重要但不是核心——猎杀主角小说的核心资产是情报，而非物质

---

### 字段联动关系

- **身份定位 → 死亡压力**：身份越高（大BOSS），死亡节点越迟，但来临时的压力越大；身份越低（小怪），死亡威胁更分散但更早
- **死亡方式 → 策略选择**：单一节点型适合"一击必杀"式的猎杀策略；条件触发型适合"阻断勇者成长"的干预策略
- **起始资源 → 猎杀阶段划分**：资源越少，前期积累章节越多；资源较丰富，可以更快进入主动猎杀阶段

---

### 常见错误

1. **起点资源设计过于丰厚**：主角一开局就有压倒性优势，猎杀勇者变成碾压，失去戏剧张力
2. **死亡节点设计得太晚**：主角到故事结束前都不用担心死亡，丧失紧迫感
3. **身份与预知优势不匹配**：小怪身份却对原著有极为详细的了解（解释不合理）；大BOSS身份却对原著几乎一无所知（浪费了高起点）
4. **忽视"原著角色继承"的复杂性**：转生者继承了原角色的记忆和人际关系，但这些关系的人不知道主角已是"另一个人"——这种双重身份应该被用来制造张力，而非被忽视
5. **起始资源列举但不激活**：设计了丰富的资源，但在故事中没有被主角实际利用',
  '## "Origin Profile" Setting Generation — The Protagonist Hunter

The "Origin Profile" defines the protagonist''s starting point in the Protagonist Hunter subgenre. It answers one central question: *What did the protagonist reincarnate as?* In the original novel''s world, they are a character predestined to die — a minor monster, a mid-boss, a major villain, or a former genius who is fated to be surpassed. This origin directly determines how much time the protagonist has, what resources they begin with, how much freedom of action they enjoy, and how difficult it will be to hunt the hero (Yuusha).

The "Origin Profile" is not just backstory — it is the strategic foundation of the entire novel. A well-designed origin creates the essential tension: the protagonist has *just enough* to begin acting, but not so much that the hunt becomes trivially easy.

---

### Field Generation Guide

#### Original Novel Identity

The protagonist can reincarnate into several typical identities, each with distinct advantages and disadvantages:

**Type 1: Monster / Cannon Fodder**

*Advantages*:
- Extremely inconspicuous — completely outside the hero''s main storyline focus
- Ample time for slow accumulation of power before being "relevant" to the hero
- Knowledge of the original world allows the protagonist to find overlooked opportunities that the hero will never pursue
- Freedom to move without attracting attention from major factions

*Disadvantages*:
- Extremely weak starting strength; the accumulation phase is long and dangerous
- High risk of dying to "random" events in the original story (background dangers, incidental conflicts)
- Too far from the hero in the early chapters to intervene in critical events
- Hard to explain credibly why a minor monster has deep knowledge of the original plot

*Ideal story type*: Slow-burn growth narratives. The protagonist lurks in the shadows, accumulating carefully, before emerging as a force the hero never anticipated.

*Example setup*: "I reincarnated as Goblin #3, destined to be slaughtered in Chapter 2 when the hero does his first village quest. I have exactly four days to escape this forest and find a reason to survive."

---

**Type 2: Mid-Boss / Regional Power**

*Advantages*:
- Already possesses meaningful strength and established resources
- Has a known death flag — the protagonist knows exactly where and when they are supposed to die, creating a defined goal: *survive past that point*
- Commands subordinates and influence that can be leveraged
- Close enough to the hero''s storyline to begin interfering meaningfully within the first major arc

*Disadvantages*:
- Conspicuous — the hero and righteous factions will eventually come knocking
- The predetermined death is a hard deadline; every chapter before it is a countdown
- Subordinates may include characters who were supposed to betray in the original story — the protagonist knows who, but acting on that knowledge prematurely creates its own risks
- Must balance "maintaining cover as the original character" with "deviating from the expected death trajectory"

*Ideal story type*: Destiny-defying narratives. The protagonist uses foreknowledge to sidestep the death trap while actively engineering the hero''s downfall.

*Example setup*: "In the original novel, I''m the Orc Warchief of the Iron Ridge territory. In Chapter 34, the hero raids my fortress and kills me as part of his ''liberation of the oppressed'' arc. I have 34 chapters to change this outcome — and ideally make that ''liberation'' arc impossible to complete."

---

**Type 3: Major Villain / Final Boss Faction**

*Advantages*:
- The richest starting resources of all origin types — armies, treasures, political influence, magical infrastructure
- The hero''s entire growth arc in the original novel was built around ultimately defeating *you* — which means the protagonist''s faction has canon-level capacity to threaten the hero
- The protagonist knows every raid, every alliance, and every betrayal the hero will make against them

*Disadvantages*:
- Maximum threat level from the hero and the entire righteous faction coalition
- The original novel likely provided much less internal detail about the villain faction — the protagonist has significant knowledge gaps about their own side
- Every named subordinate may be a spy, a future defector, or a character the hero eventually recruits
- The pressure is immense from day one; there is no accumulation phase

*Ideal story type*: Strategic defense and counter-offensive. The protagonist transforms the original "doomed villain faction" into an unassailable force that the hero''s protagonist aura cannot overcome.

*Example setup*: "I''m the Demon Lord. In the original novel, I was defeated in the climactic battle of Volume 12. But I''ve read all 12 volumes — and I know every hero party member''s weakness, every betrayal within my own ranks before it happens, and exactly which three decisions led to my downfall. This time, I change all three."

---

**Type 4: Destined Loser (Surpassed Former Genius)**

This is a unique identity type: the protagonist is not a villain but a former powerhouse in the original story — someone who peaked before the hero arrived and was gradually eclipsed, ultimately dying not by direct confrontation but through a cascade of losses triggered by the hero''s rise.

*Advantages*:
- Relatively neutral political position; potential for close contact with the hero in early chapters
- Deep embedded knowledge of the world''s power structure (as a former top figure)
- Can legitimately pursue resources and influence without triggering "evil faction" responses
- The moral ambiguity is rich — this character did not "deserve" to be surpassed; the protagonist has a legitimate grievance

*Disadvantages*:
- The "death" is gradual and diffuse — no single intervention point prevents it
- Hard to identify the optimal moment to start actively "hunting" the hero
- The identity''s moral ambiguity creates reader confusion about the protagonist''s justification
- Easy to accidentally become the hero''s mentor or ally rather than their hunter

*Ideal story type*: Subtle manipulation and resource interception. The protagonist prevents the hero from accessing key growth opportunities rather than direct confrontation.

---

#### Designated Death Method

The designated death method is the sword of Damocles hanging over the protagonist — it is both the primary motivation and the most dramatically potent element of the origin profile.

**Single Death Node**

The protagonist knows they will die at a specific event: a particular battle, a particular encounter, a particular chapter.

- Creates a powerful countdown structure — every chapter before the death node is charged with urgency
- The reader and protagonist both feel the deadline approaching
- Strongest when the death node is known precisely: "In the 23rd chapter of the original, when the hero reaches the Demon King''s Gate, I am killed by a single sword strike as the Guard Captain."
- Design consideration: the protagonist needs *enough time* before the death node to actually change the situation. If the node is too early (Chapter 3), the setup feels rushed; if it''s too late (Chapter 150), urgency dissipates.

**Condition-Triggered Death**

The protagonist''s death is not tied to a specific time but to a specific triggering condition — when the hero reaches a certain power level, acquires a certain artifact, or achieves a certain milestone.

- Creates strategic depth: the protagonist can prevent death by *interrupting the triggering condition* rather than just avoiding a specific battle
- More open-ended planning: "As long as the hero never acquires the Holy Sword, he cannot reach the power level needed to kill me"
- Risk: the protagonist may succeed in delaying the condition indefinitely, reducing urgency. Must have secondary pressure.

**Gradual Erosion Death**

The protagonist is not directly killed but is progressively stripped of resources, allies, and influence as the hero grows, until a final catastrophic defeat becomes inevitable.

- Creates "boiling frog" tension — each individual loss is manageable, but the cumulative pattern is terrifying
- Appropriate for Major Villain / Final Boss origin types
- Requires careful plot engineering: each loss must feel inevitable in retrospect and foreshadow the ultimate ending

---

#### Starting Resource Advantages

Starting resources determine whether the protagonist can survive the accumulation phase and begin active hunting. The design principle: resources must be sufficient for the protagonist to *start acting*, but not so overwhelming that the story loses tension.

**Intelligence Assets (The Core Resource)**

The protagonist''s foreknowledge of the original plot is their most powerful asset. When designing this, specify clearly:

- *Depth of knowledge*: Does the protagonist know only major events ("the hero defeats the Demon Lord in Volume 12") or chapter-level details ("in Chapter 7, the hero receives the Fire Spirit''s blessing at the waterfall east of Elgin Village")?
- *Character insight*: Does the protagonist know characters'' internal motivations, or only their external actions? (Knowing "why" a character betrays is far more valuable than knowing "that" they betray.)
- *Knowledge gaps*: The protagonist only knows the portions of the original novel they have read. Unread portions, and portions altered by their own interference, become blind spots. This is the most important limitation to establish early.

**Strength Assets**

The protagonist''s combat capability at the start:
- Must be meaningfully stronger than the hero at the story''s beginning — if the protagonist cannot defeat the hero at Chapter 1 power levels, why wait? Direct elimination is the logical choice. (If the protagonist cannot kill early, explain clearly why: contractual protection on the hero, inability to find them, political constraints, etc.)
- Does the protagonist inherit the original character''s abilities? This can range from full inheritance (seamless) to partial (some skills, no memories) to none (reborn in the body but starting from scratch).

**Human Capital Assets**

The forces the protagonist can command:
- Loyal subordinates (but: some of them will betray in the original story — the protagonist knows who, which creates a separate sub-problem)
- Political relationships with neutral parties
- Informants or contacts outside the protagonist''s immediate faction

**Material Assets**

Gold, rare resources, territorial control:
- Important but secondary — the protagonist''s decisive advantage is information, not wealth
- Material assets exist to *enable* intelligence exploitation: bribing informants, funding interception operations, maintaining the faction while the protagonist diverts from original plot expectations

---

### Field Interaction Guidelines

The four elements of Origin Profile do not exist independently — they interact to shape the story''s strategic structure:

- **Identity → Death Pressure**: Higher identity (Major Villain) = later death node but catastrophic when it arrives. Lower identity (Cannon Fodder) = earlier death node but more diffuse threat.
- **Death Method → Strategy Choice**: Single node favors "decisive early intervention" strategy. Condition-triggered favors "interrupt the hero''s growth path" strategy. Gradual erosion favors "resource denial" strategy.
- **Starting Resources → Phase Structure**: Fewer resources = more chapters before active hunting. Richer resources = faster transition to direct interference.
- **Identity → Knowledge Credibility**: Higher identity = harder to justify detailed plot knowledge (a mid-boss would not have read the "novel" with chapter-level precision). Lower identity = easier to explain limited knowledge.

The best Origin Profiles have *internal tension*: high status but limited time, or ample time but severe resource constraints. A protagonist who has everything — high status, ample resources, early death node, and perfect knowledge — eliminates all dramatic tension.

---

### Common Mistakes

1. **Overpowered starting conditions**: The protagonist begins with such overwhelming advantages that hunting the hero becomes a trivial exercise. The story needs friction. If the protagonist can simply order their army to kill the hero in Chapter 1, the story is over. Design constraints that prevent easy resolution.

2. **Death node too distant**: The protagonist does not face meaningful death pressure until very late in the story. Without the Damocles sword, the hunting narrative loses its urgency. Consider adding *intermediate* death threats (not just the final confrontation) to maintain pressure throughout.

3. **Identity-knowledge mismatch**: A minor monster origin with chapter-level knowledge of the entire novel requires an explanation. Conversely, a Major Villain origin with barely any knowledge wastes the most powerful advantages of high-status origins. Match the depth of foreknowledge to what the origin identity can credibly possess.

4. **Ignoring inherited relationship complexity**: When the protagonist takes over a body, they inherit all of that character''s relationships — subordinates, enemies, allies, romantic partners. These people do not know they are now dealing with a different person. This creates a rich source of dramatic tension that should be exploited, not ignored. The protagonist must act like the original character while pursuing entirely different goals.

5. **Resources listed but not activated**: The design specifies impressive starting resources, but the story never actually uses them. Resources only matter if the protagonist deploys them strategically. Design resources with their *specific use cases* in mind: "The intelligence network inherited from the original character will be used in Chapter 5 to track the hero''s first dungeon run."

6. **Failing to establish knowledge limits early**: If the protagonist''s foreknowledge is presented as perfect and unlimited, the tension collapses. Establish clearly in the Origin Profile: what the protagonist does *not* know. The knowledge gaps are as important as the knowledge itself — they create the situations where the protagonist must improvise, creating the story''s most compelling moments.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Protagonist Hunter' LIMIT 1),
  1,
  50,
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
