-- The Eldritch Horror Novel「Forbidden Knowledge」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Eldritch Horror Novel' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-eldritch-horror-forbidden-knowledge-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'eldritch-horror-forbidden-knowledge-setting-gen',
  '「Forbidden Knowledge」设定生成：为 The Eldritch Horror Novel 生成禁忌知识体系，包括 Knowledge Source、Knowledge Type、Power Gained、Sanity System、Sanity Costs、Point of No Return',
  '"Forbidden Knowledge" setting generation: generate forbidden knowledge system for The Eldritch Horror Novel, covering knowledge source, power gained, sanity system, sanity costs, and point of no return',
  '## 「Forbidden Knowledge」设定生成 — The Eldritch Horror Novel

禁忌知识体系是洛夫克拉夫特小说的核心叙事引擎——它同时充当力量体系和"诅咒"。知识即力量，但每一条新知识都以理智、人性或自我为代价。

---

### 字段生成指南

#### Knowledge Source

决定主角接触知识的方式：
- **古老典籍**（死灵之书类型）：知识由一个已经部分消失的人写成，阅读本身就是暴露
- **宇宙信号**：宇宙广播信息，特定频率或数学模式携带现实结构的编码真相
- **基因记忆**：知识已在主角体内，由曾与实体接触的祖先遗传
- **梦境渗透**：实体通过梦境交流——不是刻意的，而是背景辐射式的存在
- **直接接触**：主角遭遇实体本身或其仆役，接触留下"残留"——未经同意上传的知识
- **接触造物**：实体创造或触碰过的物体、地点或存在，将其制造者的本质传递给足够敏感的观察者

#### Knowledge Type

描述知识的性质——不是"魔法咒语"，而是"现实真实的运作方式，大多数人类无法承受这一认知"。知识是关于存在的结构性真相，关于实体的本质，关于时间和空间的实际运作方式——在人类通常感知它们的方式之下。

#### Power Gained

具体能力，但这些能力本身就令人不安。例如：
- 能够感知所有人类的恐惧，但从此无法屏蔽这种感知
- 能够阅读现实中的结构性断裂，但每次使用都侵蚀正常感知
- 能够与实体的仆役交流，但交流本身具有感染性

#### Sanity System（五选一）

- **碎片化模型**：理智分裂成碎片，主角保持功能性智力但失去整合的自我
- **侵蚀模型**：理智是一种随暴露减少的资源，高侵蚀时主角开始以实体的方式看世界
- **阈值模型**：大多数知识没有理智代价，但某些"阈值真相"一旦跨越就无法恢复
- **转化模型**：理智丧失不是退化而是转变，主角正在变成不同的东西
- **积累模型**：每次接触都增加积累的负担，单次接触看似可控，恐惧在于负担永不减少

#### Sanity Costs

每次获得力量/知识的代价——必须具体、可见（不只是"神志不清"）：
- 持续的感知扰动
- 特定情感能力的丧失
- 记忆入侵（非人类记忆逐渐取代人类记忆）
- 感知转变（现实的底层结构渗透进正常感知）
- 行为强迫（执行仪式，说话带有模式，被吸引到特定地点）

#### Point of No Return

主角知道了多少之后就不可能回头过普通人的生活。最有力的版本是：主角几乎没有注意到他们已经跨越了这个点——选择来得太容易、太自动，只有在事后他们才意识到某些根本性的东西改变了。

---

### 核心张力

主角**想**知道。每一点禁忌知识都让他们更接近于理解他们正在处理的事情，并可能活下去。但每一点禁忌知识也侵蚀了让他们成为人类的心理基础设施。这是根本的陷阱——为了生存，他们必须变成不再需要生存的东西。',
  '## "Forbidden Knowledge" Setting Generation — The Eldritch Horror Novel

The Forbidden Knowledge system is the central narrative engine of Lovecraftian fiction — it simultaneously functions as the power system and the curse. Unlike traditional fantasy where power is purely beneficial, forbidden knowledge in cosmic horror is inherently poisoned: every revelation brings capability and destroys something irreplaceable.

---

### The Core Tension

The protagonist WANTS to know. Every bit of forbidden knowledge brings them closer to understanding what they''re dealing with and potentially surviving it. But every bit of forbidden knowledge also erodes the psychological infrastructure that makes them human. This is the fundamental trap — to survive, they must become something that no longer needs to survive.

This is what separates forbidden knowledge from conventional power systems. In a cultivation novel, the protagonist gains power and retains themselves. In cosmic horror, the price of power is the self that wanted the power. By the time the protagonist is capable of surviving, they may no longer be capable of caring whether they do.

---

### Field Generation Guide

#### Knowledge Source

Determines how the protagonist accesses forbidden knowledge — and what the access costs at the point of contact:

- **Ancient Texts** (Necronomicon-type): The knowledge was written by someone who was already partially gone. Reading is not just information transfer — it is exposure. The text was written in such a way that comprehension requires a mind that has already been altered. Reading it changes the reader to make them capable of reading more. The book and the reader co-evolve. Secondary effect: the protagonist may find marginalia from previous readers who descended further than they''ve gone yet.

- **Cosmic Signals**: The universe broadcasts information. Certain frequencies, mathematical patterns, or sensory experiences carry encoded truths about reality''s structure. The protagonist learns to read this signal — and cannot unlearn it. The signal is always broadcasting; the protagonist has simply become sensitive to it. Every moment of silence they previously enjoyed is now filled with information they cannot block out.

- **Genetic Memory**: The knowledge is already inside the protagonist, inherited from ancestors who had contact with the entities. Accessing it requires going to dark places in the mind — the places where something old is sleeping. The horror of this source is personal: the protagonist is not finding external knowledge, they are finding out what they already are. Their ancestry is a horror they carry within them.

- **Dream Incursion**: The entities communicate through dreams — not deliberately, the way humans communicate, but the way that background radiation is always present. Sleeping near certain places or objects exposes the dreaming mind to transmissions not meant for human perception. The protagonist begins to learn in their sleep and wake with knowledge they didn''t have before — and an increasing inability to distinguish dream-knowledge from waking reality.

- **Direct Contact**: The protagonist has encountered the entity itself or its servitors, and the contact left residue. Knowledge that uploaded itself without consent. The protagonist did not choose to learn — the learning was done to them. This is uniquely violating: their mind was entered and altered without permission, and they must now process what was deposited there.

- **Constructed Servants**: Objects, locations, or beings created or touched by entities that transmit their makers'' nature to sufficiently sensitive observers. Prolonged exposure to such artifacts produces unintended education. The protagonist may not even realize they''re being changed until the changes are already significant.

#### Knowledge Type

The nature of what is learned — not magical spells but structural truths about reality that most human minds cannot survive knowing:

- **Ontological Truths**: How reality is actually structured beneath the layer humans perceive. The entities exist in this underlying structure, which is not bound by the physical laws humans have mapped.
- **Historical Revelation**: What actually happened in human history — which events were caused by entity influence, which "myths" are accurate accounts. The horror is learning that humanity''s story has always been peripheral to a story it didn''t know was being told.
- **Operational Knowledge**: Understanding how to work with the entities'' reality — rituals, sigils, methods of contact. This knowledge is immediately practical and immediately corrosive.
- **Prophetic Perception**: Understanding how time works from the entities'' perspective — seeing probable futures, understanding inevitability. The horror is that this perception cannot be turned off.

#### Power Gained

Concrete abilities, but inherently disturbing in their nature. The power should feel wrong even when it''s useful:

Examples of appropriately poisoned powers:
- The ability to perceive the fear of everyone nearby — effective for reading social situations, impossible to stop, an endless flood of others'' terror
- The ability to read structural fractures in reality — useful for finding entity-related anomalies, erodes normal perception with each use, eventually normal reality looks fractured all the time
- The ability to communicate with entity servitors — provides intelligence and occasional assistance, every exchange is cognitively contaminating, the protagonist begins to think in the servitors'' idiom
- The ability to move through dream-space — useful for information gathering and limited travel, every use deepens the protagonist''s loss of boundary between dream and waking

The power''s cost should be proportional to its utility — and should compound. Early use has minor cost; sustained use accumulates toward crisis.

#### Sanity System (choose one primary, can combine secondary elements)

- **Fragmentation Model**: Sanity breaks in pieces. The protagonist maintains functional intelligence but loses integrated self — memories become disconnected, emotional responses become inappropriate, identity becomes patchwork. They can still perform at a high level, but the coherent "I" that connects all their experiences is dissolving. Effective for stories about identity loss.

- **Erosion Model**: Sanity is a resource that decreases with exposure. At high erosion, the protagonist is still functional but increasingly sees the world as the entities see it — which is effective for navigating their situation and terrifying for everyone around them. Effective for stories about gradual transformation.

- **Threshold Model**: Most knowledge has no sanity cost, but certain revelations are "threshold truths" — understanding the full nature of the Outer Gods, witnessing a complete manifestation, learning what happens after death in this reality. Cross enough thresholds and recovery becomes impossible. Effective for stories with discrete revelation beats.

- **Transformation Model**: Sanity loss is not degradation but change. The protagonist is becoming something different. What they''re becoming may be more capable, but it is less human. The question is whether they can maintain enough humanity to care about their original goals. Effective for stories about the cost of power.

- **Accumulation Model**: Each contact adds to an accumulated burden. Individual exposures seem manageable. The horror is the slow realization that the burden never decreases — it only grows. The protagonist does not notice the accumulation until it is already overwhelming. Effective for slow-burn stories.

#### Sanity Costs

Must be concrete and specific — not vague "madness" but particular, observable changes:

- **Persistent sensory disturbances**: Hearing things that are not there — but are they not there, really? Seeing patterns in random data that turn out to be meaningful. Tasting wrongness in familiar food.
- **Loss of specific emotional capacities**: Cannot feel tenderness anymore, only its memory. Humor has become inaccessible. The protagonist knows intellectually that they should feel a particular emotion but the mechanism for producing it is gone.
- **Memory intrusions**: Human memories increasingly interspersed with inhuman ones — vast, cold, geological perspectives that are not the protagonist''s but feel as immediate as their own childhood.
- **Perceptual shifts**: Seeing the underlying structure of reality bleeding through normal perception. The protagonist looks at a wall and sees, briefly, what the wall is made of at the quantum level, and at the level below that, and at what exists where that bottoms out.
- **Behavioral compulsions**: Performing rituals without understanding why. Speaking in patterns. Being drawn to specific locations at specific times without being able to articulate the reason. The compulsions work — they accomplish something in the entity''s reality — which makes them more disturbing, not less.

#### Point of No Return

The narrative moment when the protagonist could theoretically stop, walk away, and live a diminished but human life — and instead chooses to continue.

This is distinct from the plot''s point of no return. It is the psychological threshold where the protagonist accepts that they are no longer fully what they were, and that the knowledge they have will never let them be ordinary again.

The most powerful versions of this moment: the protagonist barely notices they''ve crossed it. They make the choice too easily, too automatically, and only realize later that something fundamental changed. The reader may notice before the protagonist does. The choice that crossed the line was not the dramatic moment — it was a small, practical decision that the protagonist made without hesitation, and the absence of hesitation is itself the revelation.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Eldritch Horror Novel' LIMIT 1),
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
