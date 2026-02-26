-- The Eldritch Horror Novel「Character」生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Eldritch Horror Novel' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-eldritch-horror-character-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'eldritch-horror-character-gen',
  '「Character」生成：为 The Eldritch Horror Novel 生成角色，围绕禁忌知识与宇宙恐惧设计人物——每个角色都在理智边缘徘徊，用人类有限的智慧面对无限的存在威胁',
  '"Character" generation: generate characters for The Eldritch Horror Novel, designing figures navigating the boundary between sanity and cosmic awareness — each using limited human intelligence against unlimited existential threat',
  '## 「Character」生成 — The Eldritch Horror Novel

洛夫克拉夫特式角色设计的核心悖论：接触宇宙知识让人更有能力应对威胁，同时也在毁掉这个人。旅程开始时的那个人和旅程结束时的那个人，本质上已经不同。

---

### 字段生成指南

#### Name（姓名）

姓名风格反映角色与宇宙恐惧的距离：

- **普通人名**：强调脆弱性。Edward Marsh、Alice Corbin——这是普通人，这一点让他们遭遇的一切更令人不安
- **来自神秘传统的名字**：暗示出身或命运。某些家族姓氏在洛夫克拉夫特神话中有隐含含义
- **职业化姓名**：探长、教授、记者——职业身份提供了理性框架，这个框架将会在故事中被摧毁

#### Role（角色类型）

决定角色与知识的关系：

- **Investigator（调查者）**：被谜题、职业义务或个人损失引入。他们擅长发现真相——这个才能成为死刑判决。专业工具（研究技能、理性分析）仍然有用，即使理解证据的框架正在被摧毁
- **Scholar/Academic（学者）**：花了数年研究实体的碎片证据而不相信它们。恐惧在于他们对所有事情都是对的，对其重要性是错的
- **Cultist（邪典成员）**：大多数不是传统意义上的邪恶——他们是遭遇了什么并试图理解、取悦或在其中生存的人。最有趣的邪典成员是那些以可理解的理由加入、现在已经走向主角无法追随之处的人
- **Entity Vessel（实体容器）**：实体选中、感染或部分寄居在这个人身上。他们可能不知道，可能知道但无法阻止。他们是最接近实体本质的窗口，也是最悲剧的角色
- **Survivor（幸存者）**：曾经遭遇并存活。他们现在带着知识和损伤继续生活——「存活」的定义值得质疑
- **Innocent（无辜者）**：作为基线和对比角色。他们的存在提醒主角失去了什么
- **Keeper of Secrets（秘密守护者）**：知道真相并主动压制它——可能出于保护动机，也可能因为他们对知识的代价有更清醒的认识
- **Last Sane One（最后的清醒者）**：周围的人都在失去理智，他们还在坚守——但「坚守」本身就是一种痛苦

#### Background（背景）

背景必须回答：为什么是这个特定的人走进这条路？

洛夫克拉夫特的主角通常不是主动寻找恐惧，而是被知识找上门。触发点类型：
- 专业调查（记者的报道、侦探的案件、学者的研究）
- 个人损失（失踪的家人、无法解释的死亡）
- 地理意外（搬到了错误的地方、继承了错误的财产）
- 遗传渊源（家族历史中隐藏着与实体的联系）

#### Knowledge Level（知识层级）

与理智损耗程度直接相关：

- **Blissfully Ignorant（完全无知）**：作为对比。他们的存在提醒已经知道的人他们失去了什么
- **Awakening（觉醒中）**：第一次接触的过程中。他们的经历映照主角曾经经历的——主角现在知道结局是什么
- **Partially Initiated（部分入门）**：有碎片知识。可以正常运作但已出现行为异常，他们自己可能没有意识到。支持角色中最常见的层级
- **Deep Initiate（深度入门）**：功能性但根本上已改变。是有用的盟友，也是令人不安的同伴。他们的「正常」是表演——内部是别的什么
- **Touched by the Void（被虚空触碰）**：仍然维持某种人类结构，但越来越以异样的方式思考和感知。这些角色同时是资源和警示

#### Current Sanity（当前理智）[动态字段]

不只是一个数值，而是定性描述：「功能正常但听到两个可能不是内部的额外声音」比「74/100」更有用。随故事推进更新。

#### Sanity Trigger（理智触发点）

使其具体化并与故事相关：
- 不是「看到奇怪的东西」
- 而是「听到特定的声音序列」、「看到特定的几何图案」、「阅读特定类型的文字」、「处于特定建筑比例的空间中」

具体性使理智触发点成为真实的叙事工具而非抽象机制。

#### Core Motivation（核心动机）

动机必须足够强大才能让人在已知代价的情况下继续接触禁忌知识：
- 不是英雄主义，而是执念
- 无处可退（已知太多，退出比继续更危险）
- 已经改变得太多，回不去了
- 保护某人（即使「保护」这个概念本身已经变得复杂）
- 真正的好奇心——有些人就是无法停止想知道

#### Connection to Entity（与实体的关联）

最关键的设计元素。关系类型决定整个故事的张力：
- **偶然相交**：他们只是碰巧与实体无法理解的活动相交
- **被选中**：实体有某种方式注意到了他们——这种注意的性质令人不安
- **遗传渊源**：家族历史中有与实体的早期接触，影响遗传到了当前角色
- **主动寻求**：他们找到了实体——这个选择的后果是整个故事

---

### 动态字段说明

Current Sanity 和 Current Mental State 是随剧情推进更新的动态字段：

- **Current Sanity**：定性描述当前的功能水平和异常模式
- **Current Mental State**：追踪退化的具体风味——是偏执？碎片化？时间感变得不可靠？对特定感官输入产生特定反应？

这两个字段应该在每个重要场景后更新，反映角色与知识接触的累积代价。',
  '## "Character" Generation — The Eldritch Horror Novel

The central paradox of Lovecraftian character design: contact with cosmic knowledge makes someone more capable of dealing with the entities — and simultaneously destroys the person who started the journey. The investigator who survives is not the same person who began. The question at the story''s heart is whether survival is worth what it costs.

---

### Field Generation Guide

#### Name

Name style reflects the character''s distance from cosmic horror:

- **Ordinary names**: Emphasize vulnerability. Edward Marsh, Alice Corbin — these are ordinary people, which makes everything they encounter more disturbing. The plainness of the name contrasts with the enormity of what they face.
- **Names from esoteric traditions**: Suggest heritage or fate. Certain family names carry implicit meaning in the Lovecraftian mythos — Marsh, Whateley, Waite, Gilman. Using them signals lineage.
- **Professionally defined names**: The journalist, the professor, the detective — the professional identity provides a rational framework that will be systematically dismantled.

#### Role (Character Archetype)

Role determines the character''s relationship with knowledge:

**Investigator** (the most common protagonist archetype): Drawn in by a mystery, a professional obligation, a personal loss. They are good at finding things out — and that talent becomes a death sentence in this context. Their competence is precisely what leads them deeper. Key design insight: their professional tools (research skills, rational analysis, evidence-gathering) remain *valuable* even as their framework for understanding evidence is being destroyed. The investigator is not made helpless by the truth — they are made dangerous and damaged simultaneously.

**Scholar/Academic**: Has spent years studying fragmentary evidence of the entities without believing in them. The horror is that they were right about everything and wrong about the significance. Their specialized knowledge gives them advantages no ordinary person has — they can read the texts, recognize the symbols, understand the historical context. But they are also specifically vulnerable to revelations that contradict their life''s work. The academic''s horror is not ignorance but the collapse of expertise.

**Cultist** (supporting or antagonist): Most are not evil in a conventional sense — they are people who encountered something and responded by trying to understand, please, or survive it. Their methods are horrifying; their motivations are often desperate or deluded. The most interesting cultists are those who joined for comprehensible reasons and have now gone somewhere the protagonist cannot follow. Design them with internal logic: what did they encounter? what did they conclude from it? what have they done in response? The conclusion and the response are where characterization lives.

**Entity Vessel**: The entity has chosen, infected, or taken partial residence in this person. They may not know. They may know but be unable to stop it. They may have sought this out. They provide the most direct window into the entities'' nature while being the most tragic characters — they are simultaneously victim and conduit, and the line between their will and the entity''s influence is progressively unclear. The vessel''s tragedy: they may have wanted this once, or they may have had no choice, but the outcome is the same.

**Survivor**: Someone who has encountered and (in some sense) survived. They carry knowledge and damage in equal measure. Their usefulness to the protagonist is real; their stability is not. The question "what exactly did you survive, and are you sure you''re the same person who started?" haunts every interaction with a survivor character.

**Innocent**: Valuable as a baseline and contrast character. Their presence reminds the protagonist (and reader) of what normal human experience is — and by contrast, how far the protagonist has traveled from it. The innocent''s obliviousness is both precious and horrifying: precious because it represents something that cannot be recovered; horrifying because the protagonist can see exactly what the innocent cannot see.

**Keeper of Secrets**: Knows the truth and actively suppresses it. Their motivation may be protective (this knowledge destroys minds; better not to know), pragmatic (the entities'' influence is already contained in this location; disturbing it makes things worse), or compromised (they have an arrangement with whatever is here, and they intend to keep it). The Keeper is an antagonist who may be entirely right.

**Last Sane One**: Everyone around them is losing their grip. They are not. This is not heroism — it is its own form of horror. To watch the people around you be changed, destroyed, or consumed by something you understand and they do not, while remaining the only one who can see it clearly, is a specific and unbearable experience.

#### Background

Background must answer: **Why this specific person?**

Lovecraftian protagonists are typically not actively seeking horror — the knowledge finds them. Trigger types:

- **Professional investigation**: The journalist assigned to cover the story. The detective hired to find the missing person. The archivist cataloguing the newly donated collection. Their professional role gives them legitimate access and a rational framework — both of which will be systematically undermined.
- **Personal loss**: A family member has disappeared, died inexplicably, or returned changed. The protagonist cannot accept the official explanation. This motivation is powerful because it is *personal* — they are not looking for abstract truth but for a specific person, and they will not stop.
- **Geographic accident**: They moved to the wrong place. They inherited the wrong property. They rented the wrong apartment. They are here because of a decision made for entirely mundane reasons, and the mundanity of the original choice makes the horror more complete.
- **Genetic heritage**: The family history contains an early contact with the entities that has propagated forward in time, shaping the protagonist''s biology, their dreams, their perceptual tendencies, in ways they are only now beginning to understand.

#### Knowledge Level

Knowledge Level tracks the protagonist''s position on the spectrum from complete ignorance to entity-adjacent awareness. It correlates directly with sanity degradation:

- **Blissfully Ignorant**: Has not yet encountered the first piece of evidence. Useful as a starting point and as a contrast character later in the narrative. Their pre-contact state is a reference point for measuring the protagonist''s deterioration.

- **Awakening**: Currently experiencing first contact. The careful observer will notice the moment when they stop finding alternate explanations plausible — when the weight of accumulated anomalies becomes too heavy to rationalize. This is the narrative''s most pivotal moment, and it can only happen once.

- **Partially Initiated**: Has fragments. Can function in everyday life but has developed behavioral anomalies they may not recognize in themselves: avoidance of certain topics, unexplained anxiety in certain locations, recurring dream imagery. The most common knowledge level for supporting characters — enough to make them useful, enough to make them damaged.

- **Deep Initiate**: Functional but fundamentally altered. Their "normalcy" is a performance — they have learned to approximate the behaviors expected of ordinary people because doing so is useful. Underneath, they are perceiving, thinking, and prioritizing in ways that would be incomprehensible to the uninitiated. These characters are valuable allies and deeply unsettling companions simultaneously.

- **Touched by the Void**: The far end. Still maintaining some human structure but increasingly thinking and perceiving in alien registers. Time does not feel sequential. Spatial relationships are experienced differently. Communication with ordinary humans requires translation effort. These characters are simultaneously the most knowledgeable resources available and the most vivid warnings of where the protagonist''s path leads.

#### Current Sanity (Dynamic Field)

Not a number — a qualitative description of functional state and anomaly pattern:

- Not: "74/100"
- But: "Functional in professional contexts; experiencing intrusive geometric imagery during periods of low stimulation; has developed an inability to read certain character combinations without physical nausea; sleep is achieved but dreams cannot be recalled and the inability to recall them is experienced as a relief"

Update this field after every significant contact event. The accumulation of changes tells the character''s story more accurately than any dramatic breakdown scene.

#### Sanity Trigger

Design with specificity and story relevance. The trigger should be:
- **Specific**: Not "strange sights" but "a particular sequence of tones in the lower auditory range," "a specific arrangement of angles in architectural space," "written text in a particular character style," "the smell of a specific combination of organic compounds"
- **Story-relevant**: The trigger should connect to the entity or location at the center of this story, not be a generic horror trope
- **Narratively functional**: The trigger should be something the story can use — a weapon the antagonist can deploy, a vulnerability the protagonist must navigate, a key that unlocks something

#### Core Motivation

Motivation must be strong enough to keep someone moving toward forbidden knowledge despite demonstrated cost:

- **Obsession**: The question will not leave them alone. They have tried to stop. They cannot. This is not heroism — it is compulsion.
- **No way back**: They already know too much. Stopping now is more dangerous than continuing — either because the entities are already aware of them, or because incomplete knowledge is more dangerous than complete knowledge.
- **Already too changed**: The person they were before would have stopped. The person they are now cannot, because that person no longer fully exists.
- **Protection**: Someone they love is in the path of what they''ve found. The motivation is pure and will not survive contact with what they find intact.
- **True curiosity**: Some people genuinely cannot stop wanting to know. This is the most Lovecraftian motivation — the universe does not care about this quality, but the person cannot shed it.

#### Connection to Entity

The relationship between the protagonist and the primary entity shapes the entire story''s tension arc:

- **Purely coincidental**: They happened to intersect with the entity''s incomprehensible activity. The entity is not aware of them specifically; they simply stepped into its field of effect. This creates one kind of horror: they are not special, not chosen — they are simply in the wrong place at the wrong time, and that is all the reason needed.
- **The entity is aware of them**: At some point the protagonist realizes the entity has been aware of them for longer than they have been aware of the entity. The nature of this awareness is not comforting. The entity''s interest may be incidental by human standards but is categorically different from being unnoticed.
- **Genetic connection**: The family line has crossed paths with this entity before. The protagonist carries something — a trait, a sensitivity, a structural feature of their cognition — that the previous contact produced. They are not starting fresh; they are continuing something.
- **Active seeking**: The protagonist found the entity. They made choices that led here. The horror of this: those choices made sense at the time, and the protagonist cannot identify, looking back, where they should have stopped.

---

### Dynamic Fields Note

**Current Sanity** and **Current Mental State** are dynamic fields that should be updated after each significant story event:

- Current Sanity: qualitative functional description with specific anomalies noted
- Current Mental State: the specific flavor of the current deterioration — paranoia, fragmentation, temporal unreliability, perceptual alterations, emerging alien thought patterns

These fields tell the character''s story across time. A character whose Current Sanity begins as "Slightly anxious in enclosed spaces, otherwise functional" and ends as "Maintaining human behavioral patterns with increasing effort; experiences gaps in continuous experience; no longer certain which thoughts are original" has undergone a complete transformation that these two fields document.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Eldritch Horror Novel' LIMIT 1),
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
