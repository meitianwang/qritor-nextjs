-- The Eldritch Horror Novel「Cosmic Entities」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Eldritch Horror Novel' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-eldritch-horror-cosmic-entities-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'eldritch-horror-cosmic-entities-setting-gen',
  '「Cosmic Entities」设定生成：为 The Eldritch Horror Novel 生成宇宙实体设定，包括 Primary Entity、Entity Type、True Nature、Manifestation、Scope of Influence、Relationship to Protagonist',
  '"Cosmic Entities" setting generation: generate cosmic entity settings for The Eldritch Horror Novel, covering primary entity, entity type, true nature, manifestation, and relationship to protagonist',
  '## 「Cosmic Entities」设定生成 — The Eldritch Horror Novel

宇宙实体是洛夫克拉夫特式恐怖的核心。设计原则：**不可知性 > 可描述性**，即便描述也只是人类有限感知捕捉到的片段。

---

### 字段生成指南

#### Primary Entity

实体命名应该有仪式感、难以发音或意义无法翻译。名字本身应该传达出「这个存在超越了人类语言的表达范围」。避免普通的拉丁语或英语词根——应该是类似阿卡德语、苏美尔语或纯粹发明的、没有语言学对应物的词语。

#### Entity Type

决定力量等级和叙事用途：
- **Ancient One**：先于太阳系而存在的原始实体，力量是环境性的
- **Outer God**：在宇宙尺度上运作的实体，有超越人类理解的目的
- **Great Old One**：被囚禁或休眠，其苏醒是具体的威胁
- **Avatar**：更大实体的碎片或显化，是主角可以实际交互的直接对手
- **Eldritch Abomination**：被创造的事物、仆役，或宇宙活动的副作用
- **The Void Itself**：不是存在而是状态——星星之间的空虚

#### True Nature

永远不应该被完全揭示——写的时候留有缺口和矛盾，因为实体本身超越人类概念。不同邪教以不同方式崇拜同一实体，因为他们都在感知一个过于庞大而无法完整感知的存在的不同侧面。实体的"目标"（如果它有目标的话）应该无法翻译成"权力"或"崇拜"这样的人类概念。

#### Manifestation

实体从不以其"真实形态"出现——或者如果出现，目击者要么死亡要么失去描述所见的能力。显化通过以下方式发生：
- 环境扭曲（现实围绕实体的临近而弯曲）
- 中间媒介（邪教、被附身的个体、创造的仆役）
- 梦境与幻象（实体的潜意识影响）
- 局部揭示（一瞥、一个阴影、一个不可能的特征）

#### Scope of Influence

必须是宇宙级或至少世界级。实体的影响不是局部的——它的存在影响着现实本身的结构。

#### Relationship to Protagonist

最重要的设计选择——不是"敌对"而是漠视或短暂的兴趣：
- **绝对漠视**（默认）：实体对主角的意识程度不超过山对爬行其上的甲虫
- **偶然交叉**：主角的活动碰巧与实体不可理解的议程相交
- **短暂注意**：实体片刻感知到主角——被这样的存在注意到不是安全，而是危险
- **不可理解的兴趣**：实体以某种原因对主角保持持续的、异类的关注

---

### 禁忌

把实体写成可以被杀死或打败的终极BOSS——这从根本上破坏了宇宙恐怖的整个前提。',
  '## "Cosmic Entities" Setting Generation — The Eldritch Horror Novel

Cosmic entities are the gravitational center of Lovecraftian fiction. They are not antagonists in any conventional sense — they are forces, conditions, weather patterns of reality. Designing them requires a fundamentally different approach from fantasy villains or horror monsters.

---

### Field Generation Guide

#### Primary Entity

The entity''s name should carry ritual weight — difficult to pronounce, or with meaning that cannot be translated. The name itself should communicate that this being exceeds human language''s capacity for representation. Avoid ordinary Latin or English roots — reach for something that sounds like Akkadian, Sumerian, or a purely invented phonology with no linguistic equivalent. The name should feel like it requires a specific mouth shape that humans don''t quite have.

Secondary consideration: how does the entity''s name appear across different source texts? Ancient cults from different civilizations may have different names for the same entity, each capturing a different aspect, each partially wrong.

#### Entity Type

Determines power level and narrative function:

- **Ancient One**: Primordial entities that predate the solar system. Their power is environmental — their mere presence warps reality. They are not "awake" in any human sense — their existence is more like a geological force than a being with will. Direct confrontation is meaningless; you cannot fight a tectonic plate. Narrative function: background threat, the source from which other entities descend.

- **Outer God**: Entities that operate on a cosmic scale, with purpose beyond human comprehension. More "aware" than Ancient Ones, but not aware of *us* specifically. Their actions have effects on human civilization the way weather has effects — not because they intend it, but because their movements are large enough to reshape things. Narrative function: the deep horror behind the immediate threat, the context that makes everything else insignificant.

- **Great Old One**: More limited in scope but more directly dangerous. They were imprisoned or are dormant, and their awakening is a concrete narrative threat. They have something resembling will and attention, though it does not map to human psychology. Narrative function: the primary existential threat of the story, the thing whose awakening the protagonist must prevent or whose influence they are caught within.

- **Avatar**: A fragment or manifestation of a larger entity. Serves as a direct antagonist the protagonist can actually interact with — though defeating the avatar accomplishes nothing against the parent entity, and the avatar may not even register its own destruction as meaningful. Narrative function: the face of the threat, the intermediary between the incomprehensible entity and the human plot.

- **Eldritch Abomination**: Created things, servants, or side effects of cosmic activity. More comprehensible than full deities, but still fundamentally wrong. They may have been human once, or may have been created from matter that was once human. They can be interacted with, even communicated with, but communication with them is inherently distorting. Narrative function: immediate threat, source of forbidden knowledge, evidence of what the entities'' influence produces.

- **The Void Itself**: Not a being but a state — the emptiness between stars, the silence at the end of all things. The horror is the realization that this void is not absence but *presence*: something vast and empty that is nonetheless aware, in its way. Most abstract, most existentially terrifying.

#### True Nature

Always write this with deliberate gaps and internal contradictions. What is "known" about the entity should be culturally filtered — the Victorian scholar''s account, the Sumerian tablet, the cult''s oral tradition, and the protagonist''s direct experience should all describe the same entity differently, because they are all perceiving different aspects of something too large to perceive fully.

Key principle: the entity''s "goals" (if it even has goals) should be impossible to translate into human concepts like "power" or "worship" or "conquest." When characters try to interpret the entity''s behavior in these terms, they are making a category error — like asking what color a sound is.

True Nature should contain at least two genuine contradictions that are never resolved — because the entity itself transcends the human logical frameworks that produce contradiction.

#### Manifestation

The entity never appears in its "true form" — or if it does, observers either die or lose the capacity to describe what they saw. Instead, manifestation occurs through:

- **Environmental distortion**: Reality bending around the entity''s nearness. Geometry behaves incorrectly. Time moves inconsistently. Colors appear that human visual systems cannot categorize. These effects are not the entity — they are the shadow it casts on the physical world.
- **Intermediaries**: Cults, possessed individuals, created servitors. These serve as the entity''s interface with human reality — not because the entity needs them, but because the entity''s direct presence would destroy the medium of communication.
- **Dreams and visions**: The entity''s subconscious influence leaks through the membrane of sleep. Dreams near certain locations or objects carry encoded transmissions not meant for human minds — but human minds receive them anyway, and are changed by the reception.
- **Partial revelation**: A glimpse, a shadow, one impossible feature. The protagonist might see one aspect of the entity and spend years processing it. Full revelation is not survivable in any meaningful sense.

The protagonist may get progressively closer to understanding the entity as forbidden knowledge accumulates — but "understanding" is itself a sanity-destroying process, because the human mind is not built to contain the entity''s actual nature.

#### Scope of Influence

Must be cosmic or at minimum world-level. The entity''s influence is not local — its existence affects the structure of reality itself. Historical events that seemed unconnected are actually artifacts of the entity''s presence. The entity predates human civilization and will exist after humanity''s extinction. Its scope should make the protagonist''s struggle feel simultaneously meaningful (human-scale heroism) and insignificant (cosmic irrelevance).

#### Relationship to Protagonist

The most critical design choice. Options from most common to most interesting:

- **Absolute Indifference** (default and most common): The entity is no more aware of the protagonist than a mountain is aware of the beetle walking on it. The protagonist reads malice into what is actually indifference, because humans are psychologically constituted to see intention. This is the most philosophically disturbing option.

- **Coincidental Intersection**: The protagonist''s activities happen to intersect with the entity''s incomprehensible agenda. The entity is not targeting them — they simply got in the way of something vast. The protagonist''s interpretation of this as "being chosen" or "being targeted" reveals how human psychology cannot accept meaningless intersection.

- **Brief Notice**: The entity perceives the protagonist for a moment the way a human might notice an unusual ant. This is genuinely terrifying — being *noticed* by something like this is not safety, it is danger. The protagonist has become distinct enough to register, which means they are doing something that, from the entity''s incomprehensible perspective, is slightly notable. This should not be comforting.

- **Incomprehensible Interest**: The entity, for reasons that will never be fully clear, is paying the protagonist a sustained, alien form of attention. The protagonist has become "interesting" in some way. This is the worst possible outcome — not because the entity wishes harm (it has no such framework) but because sustained attention from something this vast is inherently distorting. The protagonist may be being studied, collected, or used for a purpose they cannot conceive.

---

### Design Prohibitions

- **Do not make the entity killable**: If the entity can be destroyed by the protagonist, it was never truly cosmic. Entities can be banished, bound, evaded, or bargained with in limited ways — but destroyed? No. Their scale precludes mortal destruction.
- **Do not give the entity relatable motivations**: Revenge, power, worship, love — these are human motivations. The entity''s actual motivations, if it has any, should remain untranslatable.
- **Do not fully reveal the entity''s appearance**: The moment a complete, comprehensible description exists, the entity becomes a creature rather than a force. Always leave the description partial, contradictory, or beyond language.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Eldritch Horror Novel' LIMIT 1),
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
