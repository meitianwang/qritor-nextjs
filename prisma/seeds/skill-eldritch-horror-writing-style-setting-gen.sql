-- The Eldritch Horror Novel「Writing Style」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Eldritch Horror Novel' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-eldritch-horror-writing-style-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'eldritch-horror-writing-style-setting-gen',
  '「Writing Style」设定生成：为 The Eldritch Horror Novel 生成文风设定，包括 Narrative POV、Prose Style、Horror Mode、Pacing、Banned Words',
  '"Writing Style" setting generation: generate writing style settings for The Eldritch Horror Novel, covering narrative POV, prose style, horror mode, pacing, and banned words',
  '## 「Writing Style」设定生成 — The Eldritch Horror Novel

洛夫克拉夫特式写作风格的核心是「恰当的隐晦」——暗示永远比直接描述更恐怖。人类想象力会用每个读者内心最深的恐惧来填补空白，这是任何作家用直接描述都无法复制的效果。

---

### 字段生成指南

#### Narrative POV

影响恐惧的传递方式：
- **第一人称**：创造最强的恐惧体验，最自然地产生不可靠叙述者
- **第三人称限知**：允许对主角知道和不知道的事情进行精确控制，更适合观察主角退化
- **不可靠叙述者**：叙述者的叙述自相矛盾，读者比叙述者更了解发生了什么
- **多视角碎片化**：多个角色的证词，每个都是局部的、略有不兼容的，完整图景只从叙述之间的缝隙中浮现

#### Prose Style

影响整体基调：
- **Gothic Atmosphere**：密集分层的句子，唤起腐朽、衰老、不对劲——叙述者试图捕捉某些语言不足以容纳的东西
- **Journalistic Detachment**：临床、事实性的语调。不可能的事情被像新闻报道一样描述，对比本身产生了效果
- **Stream of Dread**：叙述者的意识已经部分被恐惧占据——句法崩溃，联想变得奇怪，理性实时碎裂
- **Academic Precision**：像学术文件一样写作——脚注、引用、正式语言——恐惧在于给这类主题同样的分析处理
- **Fragmented and Failing**：叙述者正在积极失去交流能力——句子中断，词语被无法翻译概念的描述所取代

#### Horror Mode

决定恐惧类型：
- **Psychological**：主角心智发生的事情是主要恐惧，实体几乎是次要的
- **Atmospheric**：世界就是不对劲。每个细节都略有偏差，在任何明显可怕的事情发生之前读者就感到恐惧
- **Existential Dread**：恐惧是对人类在宇宙中真实位置的认识，不是怪物，而是我们无关紧要的真相
- **Body Horror**：实体改变物理形态，接触留下痕迹，主角的身体开始反映其暴露

#### Pacing

对洛夫克拉夫特小说尤为重要——节奏必须慢，让压抑感积累：
- **Slow Burn**：恐惧在第一页就存在但许多章节后才可见，需要抵制过早揭示的诱惑
- **Measured Dread**：定期的不对劲节拍，每次略微更强烈，读者开始识别模式并更加恐惧
- **Spiral Descent**：主角在缩小的圆圈中移动，每次转动带他们更接近中心，但每次都略微更糟
- **Episodic Revelation**：每章揭示更大真相的一部分，恐惧是累积性的

#### Banned Words

应包括会破坏氛围的词汇：
- 让宇宙感觉平凡的任何词（"酷"、"没问题"）
- 暗示主角有控制力的词（"击败"、"解决"、"安全"）
- 精神疾病的临床诊断术语（将恐惧简化为医学状况）
- 任何使实体变得亲切或可理解的词（一旦实体被以熟悉术语描述，宇宙恐惧就消失了）

---

### 核心原则

**展示更少，暗示更多**。在任何明显可怕的事情发生之前，读者应该感到不安。氛围是一种积累——许多微小的细节都略微不对，比单一的戏剧性恐惧时刻更有效。',
  '## "Writing Style" Setting Generation — The Eldritch Horror Novel

Lovecraftian writing style is built on the principle of **appropriate obscurity** — implication is always more terrifying than explicit description. The human imagination fills in gaps with something perfectly calibrated to each reader''s deepest fears, which no writer can replicate with direct description. The moment you describe the monster fully, it becomes the monster you described — finite, known, survivable in imagination. The moment you imply the monster, it becomes every reader''s worst version of itself.

---

### Field Generation Guide

#### Narrative POV

How horror is transmitted depends fundamentally on who is telling the story and what they can know:

- **First Person** (most commonly associated with classic Lovecraft): Creates the most intense fear experience — the reader is experiencing the horror alongside the narrator. Critical advantage: unreliable first-person narrators are the most natural result of someone whose perception of reality is being distorted. The reader constantly wonders: is what the narrator is describing real, or is it the first sign of their breakdown? The ambiguity is not a flaw — it is the mechanism. First person also creates the strongest identification, meaning the reader''s sanity and the narrator''s sanity erode in parallel.

- **Third Person Limited**: Allows more precision about what the protagonist knows and does not know. Creates a useful distance — the reader observes the protagonist''s deterioration rather than experiencing it. This is better for stories where the horror is partly watching the protagonist change from outside, seeing what they can no longer see themselves. The narrator can notice things the protagonist rationalizes away.

- **Unreliable Narrator**: The narrator''s account contradicts itself, contains gaps, insists on normalcy while describing increasingly abnormal events. Key technique: the narrator''s explanations for the anomalies should be increasingly desperate and increasingly inadequate. The reader pieces together the real story from the gaps. The unreliable narrator should not be obviously lying — they should be genuinely trying to tell the truth, but their capacity for truth has been compromised.

- **Multi-perspective Fragmentation**: Multiple characters'' testimonies, each partial, each slightly incompatible. The full picture only emerges from the gaps between accounts. This form mimics the way cosmic horror actually works — no single human observer can perceive it fully, and the truth can only be assembled from multiple partial perspectives that are each insufficient alone. Effective for stories that span decades or locations.

#### Prose Style

The tone and texture of the prose — how the words feel, not just what they say:

- **Gothic Atmosphere**: Dense, layered sentences that evoke decay, age, wrongness. Descriptive excess that suggests the narrator is trying to capture something their language is not adequate to contain. The sentences should feel heavy, weighted, as if the words themselves are struggling against something. Long sentences that accumulate clauses, building dread through accumulation rather than through any single element. The Gothic style does not say "this was frightening" — it describes with such careful excess that fear is the only possible response to the description.

- **Journalistic Detachment**: Clinical, factual. Events are reported. The horror of this style is that the narrator is describing impossible things in the tone of a news report — the contrast does the work. "At 3:14 AM, the specimen''s temperature dropped to a level inconsistent with biological life. It continued to move." This style implies that the narrator has seen worse — which is its own kind of horror.

- **Stream of Dread**: The narrator''s consciousness is already partially colonized by the horror — syntax breaks down, associations become strange, rationality fragments in real-time. The reader experiences the protagonist''s breakdown from inside it. Effective for late-story passages when the protagonist is at their most compromised. Should be used selectively — constant fragmentation loses its impact; it works best as contrast against earlier, more coherent prose.

- **Academic Precision**: Written as if it is a scholarly document — footnotes, citations, formal language. The horror is that the subject matter is being given the same analytical treatment as an archaeological report. This style implies a narrator who is desperately maintaining scholarly objectivity as a defense mechanism against the reality of what they''re studying. The footnotes, especially, can carry enormous horror — the things the narrator cannot bring themselves to put in the main text.

- **Fragmented and Failing**: The narrator is actively losing their ability to communicate — sentences break off, words are replaced by descriptions of untranslatable concepts, structure collapses as the horror intensifies. The prose itself should enact the protagonist''s deterioration. Used for the deepest moments of cosmic encounter. The challenge is maintaining coherence for the reader while depicting incoherence in the narrator.

#### Horror Mode

The specific register of fear the story operates in:

- **Psychological**: The primary horror is what''s happening to the protagonist''s mind. The entities are almost secondary — the real horror is watching someone rational become irrational, watching certainty become doubt. This mode works best when the reader cannot be entirely sure whether the protagonist is experiencing genuine supernatural phenomena or a breakdown. The ambiguity should be maintained for as long as possible — because once you confirm either interpretation, you lose the other''s horror.

- **Atmospheric**: The world is just wrong. Every detail is slightly off. The reader feels dread before anything overtly horrible has happened. Mastery of atmosphere means readers are afraid of rooms, of weather, of colors, of the quality of light on an ordinary afternoon. This mode requires the most craft — it cannot rely on events for its effect, only on description.

- **Existential Dread**: The horror is the realization of humanity''s actual place in the universe. Not a monster, not a threat — just the truth of our insignificance. The most effective and most difficult mode. It asks the reader to sit with the knowledge that nothing we do ultimately matters to the vast majority of what exists. The horror is philosophical. The story must be good enough to make a philosophical horror feel visceral.

- **Body Horror**: The entities change physical form. Contact leaves marks. The protagonist''s body begins to reflect their exposure to cosmic forces. Gill-slits, altered pigmentation, changed proportions, new senses. This mode bridges horror and disgust, and works well in combination with Psychological — the physical changes are evidence of the internal transformation.

#### Pacing

Pacing is especially critical for cosmic horror — the atmosphere must be allowed to build slowly. Cosmic horror that is paced like an action-thriller defeats itself:

- **Slow Burn**: The horror is present in the first page but not visible for many chapters. The reader feels it before they see it. Requires discipline to resist revealing too much — every time you reveal something, you remove a source of atmospheric dread. Revelation should be earned and rationed. The reader''s growing certainty that something is wrong should precede any confirmation of what it is.

- **Measured Dread**: Regular beats of wrongness, each slightly more intense. The reader begins to recognize the pattern and dread each new beat more than the last — not because they know what it will be, but because they know the pattern escalates. The horror of the next beat is partly the knowledge that there will be a beat after that one too.

- **Spiral Descent**: The protagonist moves in decreasing circles, each revolution bringing them closer to the center while covering the same ground — except everything is slightly worse each time. The same locations, the same characters, the same concerns — but each repetition is more compromised, more distorted, more revealing of what was always underneath.

- **Episodic Revelation**: Each chapter reveals one piece of the larger truth. The horror is cumulative — individually the pieces seem manageable; together they are unbearable. This pacing works well with multi-perspective narration, where each perspective adds a piece and the reader assembles the whole picture before the protagonist does.

#### Banned Words

Words and phrases that destroy the atmospheric register of cosmic horror:

- **Mundanizing language**: Any word that makes the cosmic feel ordinary or exciting rather than dreadful — "cool," "awesome," "amazing," "interesting," "weird" (too casual). The cosmic should feel *wrong*, not *unusual*.
- **Control language**: Words that imply the protagonist has agency over the cosmic threat — "defeated," "solved," "killed" (applied to the entity), "safe," "under control." The protagonist is never in control; they are at best temporarily not-yet-destroyed.
- **Clinical mental health terms**: "Psychosis," "hallucination," "delusion," "paranoia" applied to the protagonist''s experience. These terms reduce cosmic horror to a diagnosable condition, which eliminates the ambiguity that makes the horror work. The protagonist''s experience should be describable without these terms.
- **Comprehension language**: Any terms that make the entity relatable or fully comprehensible — "it wanted," "it felt," "it decided" (in human-equivalent terms), "the god''s plan." The moment an entity''s motivations are legible in human terms, it stops being cosmic and becomes a villain.
- **Genre-breaking colloquialisms**: Any language that would feel at home in an action novel, a romance, or a comedy. The prose register must be maintained consistently — a single out-of-register word can shatter the atmospheric effect that took chapters to build.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Eldritch Horror Novel' LIMIT 1),
  1,
  53,
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
