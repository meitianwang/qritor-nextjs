-- The Ruthless Protagonist Novel「Writing Style」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Ruthless Protagonist Novel' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-ruthless-protag-writing-style-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ruthless-protag-writing-style-setting-gen',
  '「Writing Style」设定生成：为 The Ruthless Protagonist Novel 生成文风设定，包括 Narrative POV、Prose Style、Pacing、Violence Threshold、Banned Words',
  '"Writing Style" setting generation: generate writing style settings for The Ruthless Protagonist Novel, including narrative POV, prose style, pacing, violence threshold, and banned words',
  '## 「Writing Style」设定生成 — The Ruthless Protagonist Novel

「Writing Style」决定了黑暗如何呈现在纸面上。Grimdark 小说的文风不是简单地"写得暗一点"——它是一套精密的叙事策略，让读者既感受到世界的残酷，又享受主角的狠辣。文风选择直接影响读者是觉得"刺激过瘾"还是"压抑想弃"。

---

### 字段生成指南

#### Narrative POV（叙事视角）

视角选择对 grimdark 叙事的影响远大于其他类型：

| 视角 | 特点 | Grimdark 效果 | 经典参考 |
|------|------|-------------|---------|
| **First Person** | 最深的心理代入，读者直接进入主角的思维 | 读者被迫站在主角的立场思考道德困境 | 蛊真人（方源的内心独白）、Prince of Thorns |
| **Third Person Limited** | 紧跟主角视角但保持一定距离 | 可以在关键时刻拉开距离让读者"旁观"主角的恶行 | The Blade Itself（Glokta 章节）、Worm |
| **Third Person Omniscient** | 全知视角，可展示多方势力 | 适合多线叙事，展示主角的计划如何影响所有人 | Malazan、ASOIAF |
| **Unreliable Narrator** | 叙述者有意或无意地扭曲事实 | 最高级的叙事技巧——读者不确定主角的版本是否真实 | Gone Girl、The Murder of Roger Ackroyd |

**选择建议**：
- **First Person** 最适合 Calculating Strategist 原型——读者直接体验主角冰冷的算计过程。但风险是主角的"恶"可能让读者不适
- **Third Person Limited** 是最安全的选择——既有代入感，又可以在主角做出极端行为时拉开叙事距离
- **Unreliable Narrator** 风险最高但效果最强——适合 Pretends to Be Worse 的道德罗盘设定

#### Prose Style（散文风格）

散文风格决定了文字的质感。每种风格传递不同的黑暗体验：

| 风格 | 特征 | 适合场景 | 经典参考 |
|------|------|---------|---------|
| **Lean and Brutal** | 短句、直接、不修饰、零废话 | 动作场景、决断时刻 | Cormac McCarthy、Joe Abercrombie |
| **Visceral and Sensory** | 强调感官细节——血的气味、骨头断裂的声音 | 战斗、酷刑、肉体痛苦 | Mark Lawrence、R. Scott Bakker |
| **Cold and Clinical** | 主角用冷淡、分析性的语气描述残酷事件 | Strategist 型主角的内心独白 | Fang Yuan 的内心戏、Hannibal Lecter |
| **Lyrical Despite the Darkness** | 优美的文笔描写残酷的内容——美与暴力的反差 | 哲学思考、世界描写、悲剧时刻 | Malazan、Gormenghast、The Silmarillion |
| **Stream of Consciousness** | 碎片化、混乱的意识流 | 心理崩溃、战斗中的极端状态 | Worm（Taylor 的触发事件）、Berserk 内心戏 |

**关键原则**：大多数 grimdark 小说不会全书只用一种风格。选择一个主要风格作为基调，在特定场景中切换：
- 算计时用 Cold and Clinical
- 战斗时用 Lean and Brutal 或 Visceral and Sensory
- 关键转折用 Lyrical Despite the Darkness

#### Pacing（节奏）

节奏控制读者的情绪起伏。Grimdark 的节奏核心是"张力管理"——永远不让读者觉得安全：

| 节奏类型 | 特点 | 适合的冲突类型 |
|---------|------|-------------|
| **Relentless — Never Lets Up** | 持续高压，每一章都有危机 | Survival Against All Odds |
| **Calculated Build and Release** | 精心构建张力→爆发→短暂喘息→更大的张力 | Rise to Power, Domination |
| **Slow Burn to Explosive** | 前期慢慢积累，后期集中爆发 | Revenge, War of Ideologies |
| **Episodic Escalation** | 每个小故事弧独立但逐步升级 | 长篇连载的最佳选择 |

**Grimdark 节奏的特殊原则**：
- "安全"的章节也必须暗含威胁——即使主角在休息，读者也应该感到不安
- 每次"喘息"之后的下一波冲突必须比上一波更严重
- 主角取得胜利后不应有太长的庆祝时间——新的威胁立刻出现

#### Violence Threshold（暴力阈值）

暴力阈值定义故事对暴力描写的尺度。这是 grimdark 文风最敏感的设定之一：

| 阈值 | 特征 | 读者体验 | 风险 |
|------|------|---------|------|
| **Unflinching — Nothing Off-Screen** | 所有暴力完整呈现，不回避任何细节 | 最强冲击力，最深代入感 | 可能让部分读者不适/弃书 |
| **Strategic — Violence with Purpose** | 只在暴力推动剧情或角色发展时详写 | 平衡冲击力和可读性 | 最佳选择 |
| **Restrained — Implied More Than Shown** | 暗示多于展示，让读者想象 | 心理恐怖效果最强 | 可能被觉得不够"grimdark" |
| **Stylized — Choreographed Brutality** | 暴力被美学化、仪式化呈现 | 动作美学的享受 | 可能削弱暴力的道德重量 |

**选择建议**：
- **Strategic** 是最推荐的默认选择——不是每一场暴力都需要详写，但关键的暴力场景必须让读者感受到重量
- **Unflinching** 适合特定的硬核读者群，但要有意识地控制频率——如果每一章都是最高烈度的暴力，读者会麻木
- **Restrained** 虽然看起来"温和"，但其实是最恐怖的——因为读者的想象力比任何文字都更可怕

#### Banned Words（禁用词汇）

禁用词汇在 grimdark 小说中有特殊意义——它们定义了故事的"语言边界"，防止文风偏离预期方向：

**通用禁用建议**：
- 过度热血正能量的表达（"正义必胜"、"友情的力量"、"相信自己"——除非是反讽使用）
- 少女心/浪漫化的暴力描写（不要用"美丽的鲜血"这种修辞来美化暴力）
- 轻小说式的吐槽和颜文字（与 grimdark 氛围不兼容）
- 过度解释角色情感（不说"他很愤怒"，而是展示愤怒的行为）

**应根据具体的 Prose Style 制定更详细的禁用词列表**

---

### 推荐搭配

根据 Core Premise 中的原型和基调，以下是经典搭配方案：

| 角色原型 + 故事基调 | 视角 | 散文风格 | 节奏 | 暴力阈值 |
|-------------------|------|---------|------|---------|
| Strategist + Dark but Cathartic | 第一人称 | Cold and Clinical | Calculated Build | Strategic |
| Pragmatist + Bleak and Unforgiving | 第三人称限知 | Lean and Brutal | Relentless | Unflinching |
| Fallen Idealist + Operatic and Tragic | 第三人称限知 | Lyrical Despite Darkness | Slow Burn | Strategic |
| Climber + Dark but Cathartic | 第三人称限知 | Visceral and Sensory | Episodic Escalation | Stylized |
| Avenger + Cynical with Dark Humor | 第一人称 | Cold and Clinical | Calculated Build | Strategic |
| Apathetic + Bleak | 不可靠叙述者 | Stream of Consciousness | Relentless | Unflinching |

---

### 常见错误

1. **全书暴力强度恒定**：从头到尾都是最高烈度——读者会麻木。暴力描写需要有节奏感
2. **文风与原型不匹配**：Cold Strategist 用热血风格写——读者感觉割裂
3. **禁用词汇太宽泛**：只禁了几个词，没有建立完整的语言边界
4. **节奏太平**：没有明显的张力起伏——即使是 Relentless 节奏，也需要微观层面的张弛
5. **叙事视角不稳定**：在同一章中无意识地切换视角限制，破坏读者的信任
6. **暴力描写沦为猎奇**：暴力不服务于剧情或角色，纯粹为了shock value——这是 grimdark 新手最常犯的错误',
  '## "Writing Style" Setting Generation — The Ruthless Protagonist Novel

The "Writing Style" determines how darkness is rendered on the page. Grimdark prose is not simply "writing darker" — it is a precise narrative strategy that allows readers to feel the world''s cruelty while enjoying the protagonist''s ruthlessness. The writing style choice directly determines whether readers feel "thrilling and satisfying" or "oppressive and wanting to quit."

The craft of grimdark prose is a balancing act. *The First Law* succeeds because Abercrombie''s lean, brutal prose makes violence feel weighty without being gratuitous. *Reverend Insanity* succeeds because its cold, analytical narration lets readers appreciate Fang Yuan''s calculations without moralizing. *Worm* succeeds because Wildbow''s relentless pacing never gives readers time to question whether they should still be rooting for Taylor. The writing style is not decorative — it is *functional*.

---

### Field Generation Guide

#### Narrative POV

Point of view choice impacts grimdark narration far more than other genres. In grimdark fiction, POV determines how much the reader is *complicit* in the protagonist''s actions:

| POV | Characteristics | Grimdark Effect | Classic Reference |
|-----|----------------|----------------|-------------------|
| **First Person** | Deepest psychological immersion; reader enters the protagonist''s mind directly | Reader is *forced* to stand in the protagonist''s position when facing moral dilemmas; creates uncomfortable complicity | Reverend Insanity (Fang Yuan''s inner monologue), Prince of Thorns (Jorg), Best Served Cold (partial) |
| **Third Person Limited** | Follows protagonist''s perspective closely but maintains some distance | Can pull back at critical moments to let the reader "observe" the protagonist''s evil acts from outside; provides emotional breathing room | The Blade Itself (Glokta chapters), Worm, The Poppy War |
| **Third Person Omniscient** | Omniscient perspective; can show multiple factions | Suitable for multi-thread narratives showing how the protagonist''s plans ripple outward and affect everyone | Malazan Book of the Fallen, ASOIAF, The Black Company |
| **Unreliable Narrator** | Narrator intentionally or unintentionally distorts facts | The highest-level narrative technique for grimdark — the reader cannot be certain if the protagonist''s version of events is real; creates paranoia and doubt | Gone Girl, The Book of the New Sun, Piranesi |

**Selection guidance**:
- **First Person** is ideal for the **Calculating Strategist** archetype — the reader directly experiences the protagonist''s cold calculation process. The reader thinks alongside the protagonist: "If I sacrifice this ally, I gain X advantage." The risk: the protagonist''s evil may make some readers deeply uncomfortable because there''s no narrative distance.

- **Third Person Limited** is the **safest and most versatile choice**. It provides immersion while allowing the narrative camera to "pull back" during the protagonist''s most extreme actions. This slight distance is often the difference between "fascinating character study" and "repulsive power fantasy." Recommended for first-time grimdark writers.

- **Third Person Omniscient** works best for **epic-scale grimdark** with multiple factions — the reader sees the protagonist''s plans from the outside, watches other characters react, and understands the full scope of consequences. However, it dilutes the protagonist''s personal intensity.

- **Unreliable Narrator** carries the **highest risk but highest reward**. It''s perfect for the "Pretends to Be Worse Than They Are" moral compass — the narrator claims to be ruthless, but the reader gradually realizes the truth is more complex. However, if done poorly, readers simply feel deceived rather than intrigued.

#### Prose Style

Prose style determines the texture of the writing. Each style transmits a different experience of darkness:

| Style | Characteristics | Best Scenes | Classic Reference |
|-------|----------------|-------------|-------------------|
| **Lean and Brutal** | Short sentences, direct, unadorned, zero waste; every word hits like a fist | Action scenes, decisive moments, betrayals, kill-or-be-killed situations | Cormac McCarthy (*Blood Meridian*, *The Road*), Joe Abercrombie (*First Law*), Ernest Hemingway''s war prose |
| **Visceral and Sensory** | Heavy emphasis on sensory detail — the smell of blood, the sound of breaking bones, the taste of fear | Combat sequences, torture scenes, physical suffering, body horror | Mark Lawrence (*Prince of Thorns*), R. Scott Bakker (*The Second Apocalypse*), Glen Cook (*The Black Company*) |
| **Cold and Clinical** | The protagonist describes brutal events with detached, analytical language — as if dissecting rather than experiencing | Strategist-type protagonist''s inner monologue, planning scenes, calm assessment of carnage | Fang Yuan''s internal narration in *Reverend Insanity*, Hannibal Lecter scenes, *American Psycho* (Patrick Bateman''s tone) |
| **Lyrical Despite the Darkness** | Beautiful prose describing cruel content — the contrast between aesthetic beauty and moral horror creates a unique effect | Philosophical reflection, world description, tragic turning points, the beauty of destruction | *Malazan Book of the Fallen* (Erikson), *Gormenghast* (Peake), *The Silmarillion* (Turin Turambar arc), *Berserk* (manga narration boxes) |
| **Stream of Consciousness** | Fragmented, chaotic flow of awareness; thoughts bleeding into each other | Psychological breakdowns, extreme combat states, moments of transformation, drug/magic-induced altered states | *Worm* (Taylor''s trigger event), *Berserk* inner monologues, *House of Leaves* |

**Critical principle**: Most successful grimdark novels do NOT use a single style throughout. Choose a **primary style** as the baseline, then switch during specific scenes:
- Calculation/planning scenes → Cold and Clinical
- Combat/violence scenes → Lean and Brutal or Visceral and Sensory
- Key revelations/turning points → Lyrical Despite the Darkness
- Psychological crisis moments → Stream of Consciousness

This shifting creates **tonal texture** — the reader''s experience changes chapter to chapter, preventing monotony. The primary style should match the protagonist archetype, and the secondary styles should activate during genre-specific scenes.

#### Pacing

Pacing controls the reader''s emotional rhythm. Grimdark pacing''s core principle is **tension management** — never let the reader feel safe:

| Pacing Type | Characteristics | Best Conflict Match |
|-------------|----------------|-------------------|
| **Relentless — Never Lets Up** | Sustained high pressure; every chapter has a crisis or escalation; minimal downtime | Survival Against All Odds — the world keeps trying to kill the protagonist |
| **Calculated Build and Release** | Carefully constructed tension → explosion → brief breathing room → even greater tension | Rise to Power, Domination — the protagonist''s plans unfold in waves |
| **Slow Burn to Explosive** | Extended setup phase building pressure; concentrated explosive payoff | Revenge, War of Ideologies — patience rewarded with devastating climax |
| **Episodic Escalation** | Each story arc is self-contained but stakes progressively increase arc to arc | Best for long-form serialized fiction — each arc can be satisfying independently while building toward a larger conclusion |

**Grimdark-specific pacing principles**:

1. **"Safe" chapters must still contain threat**: Even when the protagonist is resting, planning, or recovering, the reader should feel unease. An overheard conversation, a subtle sign that enemies are moving, a reminder of costs paid — *something* must keep tension present. In *First Law*, even Glokta''s "quiet" scenes are tense because of his physical pain and political vulnerability.

2. **Post-respite escalation**: Every breathing room period must be followed by a crisis *worse* than the previous one. If the reader notices the pattern, that''s fine — grimdark readers *expect* the other shoe to drop. The anticipation is part of the fun.

3. **Victory never lasts**: After the protagonist achieves a win, new threats should appear almost immediately. Not to be exhausting (see Common Mistakes), but to maintain the grimdark atmosphere that no victory is permanent and every gain has a cost.

4. **Information reveals as pacing tools**: In grimdark, the protagonist often knows more than other characters. Timing when the reader learns the protagonist''s plan is a powerful pacing lever — reveal too early and there''s no tension; reveal too late and the payoff feels like an ass-pull.

#### Violence Threshold

The violence threshold defines how graphic the story''s violence is. This is one of the most sensitive settings in grimdark writing:

| Threshold | Characteristics | Reader Experience | Risk |
|-----------|----------------|-------------------|------|
| **Unflinching — Nothing Off-Screen** | All violence fully rendered; no detail avoided; the reader sees everything | Maximum impact and immersion; reader feels the weight of every act of violence | May alienate some readers; risk of desensitization if used too frequently |
| **Strategic — Violence with Purpose** | Violence is detailed only when it serves character development or plot advancement | Balances impact and readability; each violent scene carries narrative weight | **Best default choice** for most grimdark fiction |
| **Restrained — Implied More Than Shown** | Violence is implied, suggested, referenced; reader''s imagination fills in the gaps | Strongest psychological horror effect; the reader''s mind generates worse images than any prose could | May be perceived as "not grimdark enough" by hardcore fans |
| **Stylized — Choreographed Brutality** | Violence rendered with aesthetic precision; fights are beautiful in their brutality | Action-aesthetic enjoyment; combat as art form | May reduce the moral weight of violence by making it "cool" rather than horrifying |

**Selection guidance**:
- **Strategic** is the recommended default — not every instance of violence needs full detail, but key violence scenes must make the reader feel their weight. A betrayal killing that advances the plot? Full detail. Random background violence? A sentence suffices. This selective approach makes the detailed scenes hit harder by contrast.

- **Unflinching** suits a specific hardcore readership, but requires conscious *frequency control*. If every chapter runs at maximum violence intensity, the reader becomes desensitized — the 50th detailed killing hits less hard than the first. Unflinching works best when used as a *baseline expectation* punctuated by scenes of exceptional brutality.

- **Restrained** may seem "mild" but is actually the most terrifying approach — because the reader''s imagination is always worse than any explicit description. A closed door, muffled screams, and the protagonist''s calm expression often generate more horror than a blow-by-blow account. Works exceptionally well with Cold and Clinical prose style.

- **Stylized** is excellent for wuxia-influenced or martial arts grimdark, where combat is both brutal and beautiful. The risk is that stylization can make violence feel *fun* rather than *weighty*, which may undermine the grimdark tone.

**The golden rule of grimdark violence**: Violence should always *cost* something — not just for the victim, but for the reader. After a major violent scene, the reader should sit with it. If the violence passes without emotional residue, it was either too frequent (desensitization) or too shallow (lacking stakes).

#### Banned Words

Banned words in grimdark fiction serve a special purpose — they define the story''s "linguistic boundaries," preventing the prose from drifting away from the intended tone:

**Universal recommendations for grimdark banned words**:
- **Shonen/heroic exclamations**: "Justice will prevail," "The power of friendship," "I believe in myself," "Never give up" — unless used ironically by the protagonist or by a naive character who is about to learn a harsh lesson
- **Romanticized violence descriptions**: Do NOT use "beautiful crimson blood" or "graceful arc of the blade" to aestheticize violence (unless Stylized threshold is specifically chosen). Violence should feel weighty, not pretty
- **Light novel tropes**: Comedic asides, emoji-style expressions, anime reaction descriptions (e.g., "sweat dropped") — fundamentally incompatible with grimdark atmosphere
- **Telling instead of showing emotions**: Ban "he felt angry" — instead show the anger through action, dialogue, and physical response. "He felt sad" becomes "His hand tightened around the hilt until his knuckles turned white"
- **Absolutist moral language**: "Pure evil," "purely good," "completely righteous" — grimdark fiction exists in moral gray; absolute moral language undermines the genre''s core premise
- **Diminutive/cutesy language**: Nicknames, pet names, childish expressions — unless specifically characterizing a particular character''s speech pattern

**Customize based on chosen Prose Style**:
- Lean and Brutal → also ban excessive adjectives, flowery descriptions, and sentences over 25 words
- Cold and Clinical → also ban emotional outbursts, exclamation marks, and subjective moral judgments
- Visceral and Sensory → also ban abstract descriptions, tell-don''t-show phrases, and clinical detachment
- Lyrical Despite the Darkness → also ban cliches, stock phrases, and mundane descriptors

---

### Recommended Combinations

Based on the protagonist archetype and story tone from Core Premise, here are proven style combinations:

| Archetype + Tone | POV | Prose Style | Pacing | Violence |
|-----------------|-----|-------------|--------|----------|
| Strategist + Dark but Cathartic | First Person | Cold and Clinical | Calculated Build and Release | Strategic |
| Pragmatist + Bleak and Unforgiving | Third Person Limited | Lean and Brutal | Relentless | Unflinching |
| Fallen Idealist + Operatic and Tragic | Third Person Limited | Lyrical Despite the Darkness | Slow Burn to Explosive | Strategic |
| Power-Hungry Climber + Dark but Cathartic | Third Person Limited | Visceral and Sensory | Episodic Escalation | Stylized |
| Cold Avenger + Cynical with Dark Humor | First Person | Cold and Clinical | Calculated Build and Release | Strategic |
| Morally Apathetic + Bleak and Unforgiving | Unreliable Narrator | Stream of Consciousness | Relentless | Unflinching |

These combinations are starting points, not rigid rules. The key is that all five style elements should reinforce the same narrative experience.

---

### Common Mistakes

1. **Constant maximum violence intensity**: Every chapter at full brutality from start to finish — readers become desensitized, and violence loses its narrative weight. Violence needs rhythm just like plot does. A quiet chapter makes the next violent chapter hit harder.

2. **Style-archetype mismatch**: Writing a Cold Strategist protagonist with hot-blooded, emotional prose — the reader feels disconnect between who the character is and how they''re being presented. A cold character needs cold prose (at least in their POV sections).

3. **Banned words list too vague**: Banning only a few words without establishing comprehensive linguistic boundaries. The banned words should create a clear tonal fence around the narrative voice.

4. **Flat pacing with no tension variation**: Even Relentless pacing needs micro-level variation — a chapter of pure action followed by a chapter of tense planning, followed by an ambush. Without variation, "relentless" becomes "monotonous."

5. **Unstable POV discipline**: Unconsciously switching POV restrictions within a single chapter — suddenly revealing information the POV character couldn''t know, or shifting from limited to omniscient without justification. This breaks the reader''s trust in the narrative.

6. **Violence as spectacle rather than story**: Violence serves no narrative function — it doesn''t advance the plot, reveal character, or raise stakes. It exists purely for shock value. This is the most common mistake of new grimdark writers. Every significant violent scene should change something — a relationship, a power balance, the protagonist''s position, or the reader''s understanding.

7. **Forgetting that "dark" is a flavor, not the whole meal**: A story that is relentlessly dark without any variation (humor, beauty, quiet moments, small victories) becomes exhausting rather than engaging. Even the darkest grimdark classics have moments of levity or beauty — Glokta''s dark humor, Fang Yuan''s intellectual satisfaction, Taylor''s brief moments of genuine connection.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Ruthless Protagonist Novel' LIMIT 1),
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
