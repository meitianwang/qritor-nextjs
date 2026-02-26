-- The Eldritch Horror Novel「Story Hook」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Eldritch Horror Novel' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-eldritch-horror-story-hook-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'eldritch-horror-story-hook-setting-gen',
  '「Story Hook」设定生成：为 The Eldritch Horror Novel 生成故事钩子，包括 Story Hook、Core Dread、Opening Event、Reader Promise',
  '"Story Hook" setting generation: generate story hook for The Eldritch Horror Novel, covering story hook, core dread, opening event, and reader promise',
  '## 「Story Hook」设定生成 — The Eldritch Horror Novel

洛夫克拉夫特式钩子的核心是「压抑窒息的恐惧感」，而非直接的暴力恐惧——是面对「不可知」的存在主义恐惧。好的故事钩子公式：**绝对力量差距 + 主角如何用人类的卑微智慧求生 + 禁忌知识的代价（理智/人性的丧失）**。

---

### 字段生成指南

#### Story Hook

一句话概括故事最引人入胜的核心元素。钩子必须立即建立力量差距——这些实体不是可以击败的反派，而是需要在其中求生的自然力量。

优秀示例：
- "一位声名狼藉的人类学家发现了一份早于人类文明的文本译稿——他每读懂一个词，现实就变得稍微不稳定一点"
- "一名调查邪教的侦探发现邪教的神明是真实存在的、正在注视着她，并且决定她是个有趣的存在"

好的钩子：立即建立力量差距，暗示禁忌知识的角度，并承诺某种特定风味的存在主义恐惧。

#### Core Dread

故事的核心恐惧类型——是什么让这个故事具体而独特的恐惧感：
- **宇宙漠视感**：实体并不憎恨我们，我们只是无关紧要的昆虫
- **存在被篡改**：接近实体会从根本上改变主角的本质
- **知识即武器亦即毒药**：每一条真相都带来力量并摧毁理智
- **身份消融**：自我与虚空之间的边界开始模糊
- **不可避免的厄运**：主角或许能活下去，但世界的终结已经注定

#### Opening Event

开篇事件必须在前三章建立压抑窒息的氛围。不要从暴力开始——要从「不对劲」开始，在任何可见的可怕事件发生之前就让读者感到不安。

经典模式：
- **不可能的发现**：发现一件不应存在的东西——过于古老的文本，过于久远的构造，没有任何文化应该知晓的符号
- **第一次接触恐惧**：主角目睹某件打破其现实模型的事情——不应移动的东西在移动，不应发声的声音在说话
- **不受欢迎的馈赠**：主角获得了他未曾寻求的知识或能力——并立即明白他无法回到无知的状态

#### Reader Promise

读者的核心期待：
- 在某种根本上出了错的世界中穿行时那种压抑的氛围满足感
- 观看主角用有限的人类智慧与可以漠然抹去他们的力量周旋的智识乐趣
- 知道比自己想知道的更多的黑暗回报
- 禁忌知识带来的力量增长与理智侵蚀之间的特定洛夫克拉夫特式张力

---

### 常见错误

1. **主角太强，直接与神对抗**：破坏压抑感，这些不是BOSS怪
2. **恐惧过于直白**：暗示和未知永远比直接揭示更恐怖
3. **缺乏存在主义深度**：仅仅是"怪物猎人"故事，穿着洛夫克拉夫特的外衣
4. **理智丧失被当作玩法而非悲剧**：理智侵蚀应该是叙事的悲剧核心',
  '## "Story Hook" Setting Generation — The Eldritch Horror Novel

The Lovecraftian hook operates on existential dread — not fear of pain or death, but fear of *significance*: the cosmic horror that humanity is utterly irrelevant to indifferent forces beyond comprehension. The hook formula: absolute power disparity + protagonist''s use of limited human ingenuity to survive/gain power + the price of forbidden knowledge (sanity, humanity, identity).

---

### Field Generation Guide

#### Story Hook

One sentence capturing the core compelling element. Strong examples:
- "A disgraced anthropologist discovers a translation of a text that predates human civilization — and every word he reads makes reality slightly less stable."
- "A detective investigating a cult finds that the cult''s god is real, is watching, and has decided that she is interesting."

Good hooks establish the power gap immediately (these entities are not villains to defeat — they are forces of nature to survive), hint at the forbidden knowledge angle, and promise a specific flavor of existential dread.

What makes these work:
1. **Immediate power disparity**: The entity is not a boss monster — it is an environmental condition
2. **Forbidden knowledge angle**: The protagonist learns things they cannot unlearn
3. **Personal intersection**: Despite cosmic indifference, the protagonist is somehow caught in the entity''s orbit
4. **Promise of erosion**: The reader understands that the protagonist will be changed by what they encounter

Avoid:
- Hooks that imply the protagonist can "defeat" the cosmic entity
- Horror framed as conventional monster-hunting
- Explicit gore as the primary appeal (dread is atmospheric, not visceral)
- Hooks that could apply to any horror subgenre

#### Core Dread

The specific flavor of cosmic horror — the precise existential terror this story delivers:

- **Cosmic Indifference**: The entities don''t hate us — we are simply irrelevant insects. The horror is not malice but the absence of any significance whatsoever.
- **Ontological Corruption**: Proximity to the entities changes the protagonist''s fundamental nature. They are not the same person who began the story — and the change is irreversible.
- **Knowledge as Weapon and Poison**: Every truth learned brings power and destroys sanity. The protagonist is in a race between capability and collapse.
- **Identity Dissolution**: The boundary between self and the void begins to blur. The protagonist is not sure where they end and something else begins.
- **Inevitable Doom**: The protagonist may survive, but the world''s end is already written. Their struggle is meaningful in human terms and utterly insignificant in cosmic ones.

The core dread should be established in the hook and deepened throughout the story — it is the emotional spine of the entire narrative.

#### Opening Event

Must establish the suffocating atmosphere within three chapters. Classic patterns:

- **The Impossible Discovery**: Finding something that cannot exist — a text too old, a structure too ancient, a symbol that no culture should know. The impossibility is what matters, not the violence. The protagonist''s certainty about how the world works cracks.
- **The First Contact Horror**: The protagonist witnesses something that breaks their model of reality — something moving that should not move, something speaking in a voice that should not be able to speak. The horror is in the wrongness, not the threat.
- **The Unwanted Gift**: The protagonist gains knowledge or ability they did not seek — and immediately understands they cannot return to ignorance. The knowledge itself is the violation.

The opening should NOT begin with violence — it should begin with wrongness. Something feels wrong before anything visible is wrong. The reader should experience the protagonist''s unease before understanding its source.

First chapter goal: establish that the world operates by rules different from what the protagonist (and reader) assumed. Not through explicit revelation — through the accumulation of small details that don''t quite fit.

#### Reader Promise

The core appeal of cosmic horror fiction:

- **Suffocating atmospheric satisfaction**: The pleasure of moving through a world where something is fundamentally wrong — the aesthetic of dread as an environment to inhabit
- **Intellectual survival pleasure**: Watching a protagonist use limited human intelligence to navigate around forces that could erase them with indifference. The satisfaction is not the protagonist''s power but their ingenuity
- **Dark knowledge reward**: The reader learns, alongside the protagonist, truths that are both illuminating and horrifying. Knowing more than you want to know, and being unable to stop
- **Lovecraftian tension**: The specific dynamic between growing capability (forbidden knowledge) and growing fragility (sanity erosion). The protagonist becomes more effective and less human simultaneously

---

### Common Mistakes

1. **Protagonist fights and defeats the cosmic entity**: Defeats the entire purpose — these are not boss monsters. If the entity can be killed, it was never truly cosmic.
2. **Horror too explicit**: Show less, imply more. The unknown is always more terrifying than the revealed. What the reader imagines is calibrated perfectly to their individual fears.
3. **No existential depth**: Just a monster-hunter story in Lovecraftian costume. The horror must reach toward the philosophical — what does it mean that these entities exist? What does it mean for human significance?
4. **Sanity loss treated as gameplay rather than tragedy**: The erosion of the protagonist''s humanity should be grieved, not celebrated. Each loss should cost something real.
5. **Hook promises action delivery**: If the hook sounds like an action-adventure, the reader will expect action-adventure pacing and be confused by the deliberate, atmospheric slowness.
6. **Opening with violence instead of wrongness**: Visceral horror is a different genre. Cosmic horror opens with unease, anomaly, the faint wrong note that grows into a symphony of dread.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Eldritch Horror Novel' LIMIT 1),
  1,
  52,
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
