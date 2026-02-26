-- The Ruthless Protagonist Novel「Core Premise」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Ruthless Protagonist Novel' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-ruthless-protag-core-premise-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ruthless-protag-core-premise-setting-gen',
  '「Core Premise」设定生成：为 The Ruthless Protagonist Novel 生成核心设定，包括 Protagonist Archetype、Archetype Details、Central Conflict、Moral Compass、Story Tone、Stakes',
  '"Core Premise" setting generation: generate core premise settings for The Ruthless Protagonist Novel, including protagonist archetype, archetype details, central conflict, moral compass, story tone, and stakes',
  '## 「Core Premise」设定生成 — The Ruthless Protagonist Novel

「Core Premise」是整个故事的基因组。它决定了主角是什么类型的"狠人"、世界为什么逼他必须狠、以及他要付出什么代价。这六个字段之间的化学反应直接决定了故事是经典还是平庸。

---

### 字段生成指南

#### Protagonist Archetype

主角原型定义了他的"狠"的方式。每种原型有不同的叙事节奏和读者吸引力：

| 原型 | 核心特征 | 经典参考 | 读者吸引力 |
|------|---------|---------|-----------|
| **The Calculating Strategist** | 冷静理性，把所有人当棋子 | 方源（诡秘之主）、Aizen（死神） | 智力碾压的快感 |
| **The Survival-Driven Pragmatist** | 被逼无奈，在残酷环境中做最优解 | Logan（第一法则）、Joel（最后生还者） | 共情与道德困境 |
| **The Fallen Idealist** | 曾经有理想，被世界毁灭后变得冷酷 | Taylor（Worm）、Anakin/Vader | 堕落弧的悲剧张力 |
| **The Power-Hungry Climber** | 从底层攀爬，对权力的渴望驱动一切 | 方源（蛊真人）、Griffith（剑风传奇） | 力量攀升的上瘾感 |
| **The Cold Avenger** | 被深深伤害后，以复仇为唯一目的 | Monte Cristo、Sasuke | 复仇爽感和道德代价 |
| **The Morally Apathetic** | 天生或后天对道德无感 | Patrick Bateman、Anton Chigurh | 不可预测性的刺激 |
| **Other** | 自定义原型 | — | 需要额外解释 |

**选择建议**：
- 新手作者建议选择 Survival-Driven Pragmatist 或 Fallen Idealist——因为读者最容易共情"被迫作恶"
- Calculating Strategist 要求极高的智谋写作能力——每个决定都必须在逻辑上站得住
- Morally Apathetic 风险最高——需要极强的叙事功力才能让读者不反感

#### Archetype Details

原型细节是对上述选择的具体化。核心问题：**是什么让这个人变成了现在这样？**

必须回答：
- 主角的核心创伤或原点事件是什么？（背叛、失去、觉醒、重生）
- 他的"狠"体现在哪些具体行为上？（牺牲同伴、操纵人心、利用无辜者）
- 他是否有一个"底线"？如果有，这条底线是什么？如果没有，为什么？
- 他对自己的"恶"有什么态度？（无所谓、必要之恶、享受、痛苦但无法停止）

#### Central Conflict

核心冲突定义故事的主引擎。每种冲突类型对应不同的叙事结构：

| 冲突类型 | 核心驱动 | 叙事结构 | 适合的原型 |
|---------|---------|---------|-----------|
| **Rise to Power** | 从底层到巅峰 | 线性上升 + 阶梯式挑战 | Power-Hungry Climber, Strategist |
| **Survival Against All Odds** | 活下去就是胜利 | 连续的生存危机 | Pragmatist |
| **Revenge Across a Broken World** | 找到并消灭仇人 | 猎杀 + 路上的道德选择 | Cold Avenger, Fallen Idealist |
| **Domination of a Corrupt System** | 控制或摧毁腐败体制 | 渗透 + 颠覆 + 取而代之 | Strategist, Climber |
| **Escape from Chains** | 挣脱束缚（奴役、诅咒、命运） | 逃脱 + 反击 | Pragmatist, Fallen Idealist |
| **War of Ideologies** | 用黑暗手段对抗另一种"恶" | 道德灰度最高的博弈 | Strategist, Fallen Idealist |

#### Moral Compass

道德罗盘定义主角的道德底线在哪里。这是 grimdark 小说最关键的设定之一：

| 道德定位 | 特征 | 读者感受 | 写作难度 |
|---------|------|---------|---------|
| **No Lines — Pure Pragmatism** | 完全理性，没有道德禁忌 | 震撼但可能疏远读者 | ★★★★★ |
| **Protects Only Inner Circle** | 对圈内人有底线，对外人无情 | 读者能锚定情感 | ★★★ |
| **Has a Code but Breaks It When Needed** | 有底线但在关键时刻会打破 | 最有戏剧张力 | ★★★★ |
| **Slowly Losing Humanity** | 每次跨越底线都付出心理代价 | 悲剧感最强 | ★★★★★ |
| **Pretends to Be Worse Than They Are** | 外表冷酷但内心保留善意 | 反差萌、隐藏的温情 | ★★★ |

**关键原则**：道德罗盘决定了故事的情感基调。Pure Pragmatism 适合冷酷智谋型故事；Slowly Losing Humanity 适合悲剧叙事；Protects Only Inner Circle 给读者提供情感锚点。

#### Story Tone

故事基调决定叙事的整体氛围。必须与原型和冲突类型一致：

- **Bleak and Unforgiving**：世界没有救赎，胜利只是暂时的喘息。适合纯粹的 grimdark 体验（如 The Road、Blood Meridian）
- **Dark but Cathartic**：黑暗中有爽感——主角每一次胜利都让读者痛快。适合力量攀升型（如 Reverend Insanity）
- **Cynical with Dark Humor**：用黑色幽默消解沉重——主角对残酷世界的讽刺态度。适合老练世故的主角（如 Glokta、Locke Lamora）
- **Grim but Hopeful Undercurrent**：黑暗表面下有微弱的希望——主角内心深处还保留着什么。适合 Fallen Idealist 原型
- **Operatic and Tragic**：宏大叙事的悲剧美学——命运、背叛、毁灭的诗意。适合史诗级别的故事（如 Berserk、Macbeth）

#### Stakes

赌注定义主角的失败代价和沿途牺牲。好的赌注必须双向——不仅是"失败会怎样"，还有"为了不失败他必须放弃什么"：

- **失败的代价**：死亡？比死亡更糟的东西？（永恒囚禁、灵魂被吞噬、被遗忘）
- **胜利的代价**：每次前进一步必须牺牲什么？（同伴、人性、原则、爱人）
- **escalation 的空间**：赌注是否能在故事进展中不断升级？初期是个人生存，后期是世界命运？

---

### 字段联动关系

1. **Archetype → Central Conflict**：原型决定最适合的冲突类型。Strategist 适合 Rise to Power/Domination；Avenger 适合 Revenge
2. **Moral Compass → Story Tone**：No Lines 配 Bleak/Dark but Cathartic；Slowly Losing Humanity 配 Operatic and Tragic
3. **Central Conflict → Stakes**：Rise to Power 的赌注是沿途牺牲的人；Survival 的赌注是主角自身的人性
4. **Archetype + Moral Compass → Archetype Details**：细节必须与原型和道德定位逻辑自洽

---

### 常见错误

1. **原型与冲突类型不匹配**：Morally Apathetic 原型配 Grim but Hopeful 基调——读者会感到割裂
2. **Archetype Details 缺乏具体创伤**：只说"主角很冷酷"但不解释为什么——缺少原点事件让角色变得扁平
3. **Moral Compass 不一致**：设定为 No Lines 但主角在关键时刻突然圣母——除非这是有意的角色弧
4. **Stakes 不够具体**：只写"失败就会死"——需要说明具体的失败方式和沿途的具体牺牲
5. **Story Tone 与实际写作不匹配**：选了 Cynical with Dark Humor 但整篇都在写严肃哲学
6. **所有字段各自为政**：六个字段没有形成有机整体——应该是一个统一的角色设计',
  '## "Core Premise" Setting Generation — The Ruthless Protagonist Novel

The "Core Premise" is the genome of the entire story. It determines what kind of ruthless person the protagonist is, why the world forces them to be ruthless, and what price they pay. The chemical reaction between these six fields directly determines whether the story becomes a classic or remains mediocre.

The best grimdark fiction — *Reverend Insanity*, *The First Law Trilogy*, *Worm*, *Berserk*, *The Black Company* — all have one thing in common: a Core Premise where every element reinforces every other element. Fang Yuan''s calculating nature makes sense because of the Gu world''s dog-eat-dog rules. Glokta''s bitter pragmatism makes sense because of the Union''s corrupt nobility. Taylor''s escalation makes sense because Brockton Bay keeps presenting worse threats.

---

### Field Generation Guide

#### Protagonist Archetype

The archetype defines the *method* of the protagonist''s ruthlessness. Each archetype has a distinct narrative rhythm and reader appeal:

| Archetype | Core Trait | Classic Reference | Reader Appeal |
|-----------|-----------|-------------------|--------------|
| **The Calculating Strategist** | Cold rationality; treats everyone as chess pieces | Fang Yuan (Reverend Insanity), Aizen (Bleach), Thrawn | Intellectual domination satisfaction |
| **The Survival-Driven Pragmatist** | Forced by circumstances; always chooses the optimal path in a cruel environment | Logan Ninefingers (First Law), Joel (TLOU), Geralt | Empathy combined with moral dilemmas |
| **The Fallen Idealist** | Once had ideals; after the world destroyed them, became cold | Taylor Hebert (Worm), Anakin/Vader, Daenerys late-arc | Tragic tension of the corruption arc |
| **The Power-Hungry Climber** | Climbing from the bottom; hunger for power drives everything | Fang Yuan (Reverend Insanity), Griffith (Berserk) | Addictive power progression |
| **The Cold Avenger** | Deeply wronged; revenge is the sole purpose | Edmond Dantes, Sasuke, V (V for Vendetta) | Revenge satisfaction and moral cost |
| **The Morally Apathetic** | Innately or conditionally indifferent to morality | Anton Chigurh, Patrick Bateman, some interpretations of Rand al''Thor late-arc | Thrill of unpredictability |
| **Other** | Custom archetype | — | Requires additional justification |

**Selection guidance**:
- For newer writers: **Survival-Driven Pragmatist** or **Fallen Idealist** — readers empathize most easily with "forced into evil" narratives. The moral tension writes itself because every decision is "I had no choice."
- **Calculating Strategist** demands exceptional plotting ability — every decision must be logically airtight, and the protagonist must genuinely outsmart both enemies and readers. If the "genius" protagonist makes obvious mistakes, the entire narrative collapses.
- **Morally Apathetic** carries the highest risk — requires extraordinary narrative craft to keep readers engaged with a character they cannot empathize with. Works best in shorter narratives or when paired with a POV character who provides the emotional anchor.
- **Fallen Idealist** is the most emotionally resonant for long-form fiction — the slow corruption arc gives readers time to care before the darkness sets in. The key is making the "before" version compelling enough that the fall hurts.

#### Archetype Details

Archetype Details is the concrete elaboration of the chosen archetype. The central question: **What made this person become who they are?**

Must address:
- **Origin event/core trauma**: What specific event catalyzed their transformation? (Betrayal, loss, awakening, rebirth, revelation). The more specific, the better — not "they were betrayed" but "their mentor fed them to a demon to power a ritual, and they survived by eating the demon instead."
- **Behavioral manifestations**: How does their ruthlessness manifest in concrete actions? (Sacrificing companions for advantage, manipulating emotions, exploiting innocents as shields, breaking promises strategically, consuming others'' resources/lives)
- **Bottom line**: Do they have one? If yes, what is it? (Won''t harm children? Won''t betray someone who saved them? Will always keep one specific promise?) If no, why not? (Survival eliminated all moral luxury? Born without empathy? Deliberately burned every bridge?)
- **Self-awareness**: What is their attitude toward their own "evil"?
  - **Indifferent**: "Good and evil are constructs. Only power is real." (Fang Yuan)
  - **Necessary evil**: "I do what must be done. Someone has to." (Glokta)
  - **Enjoys it**: "I won''t pretend I don''t like winning." (Locke Lamora)
  - **In pain but unable to stop**: "I hate who I''m becoming, but stopping means dying." (Taylor Hebert)

#### Central Conflict

The central conflict defines the story''s primary engine. Each conflict type maps to a distinct narrative structure:

| Conflict Type | Core Drive | Narrative Structure | Best Archetype Match |
|--------------|-----------|--------------------|--------------------|
| **Rise to Power** | Bottom to top | Linear ascent with tiered challenges; each level has new enemies and higher stakes | Power-Hungry Climber, Calculating Strategist |
| **Survival Against All Odds** | Staying alive is victory | Continuous survival crises; no stable ground; the world keeps escalating threats | Survival-Driven Pragmatist |
| **Revenge Across a Broken World** | Find and destroy the enemy | Hunt structure + moral choices along the way; revenge may hollow the protagonist | Cold Avenger, Fallen Idealist |
| **Domination of a Corrupt System** | Control or destroy the rotten institution | Infiltration → Subversion → Replacement; the protagonist may become what they fought | Calculating Strategist, Power-Hungry Climber |
| **Escape from Chains** | Break free from bondage (slavery, curse, fate, system) | Escape + counterattack; freedom is the reward, but the cost of obtaining it changes the protagonist | Pragmatist, Fallen Idealist |
| **War of Ideologies** | Using dark methods to fight a different kind of "evil" | Highest moral ambiguity; both sides have valid points; the protagonist wins by being willing to go further | Strategist, Fallen Idealist |

**Conflict design principles**:
- The conflict should be **unwinnable through conventional means** — if the protagonist could succeed by being good, there''s no reason to be ruthless
- The conflict should **escalate** — initial stakes are personal, final stakes are existential
- The conflict should **create moral dilemmas** — not just "can they win?" but "what will winning cost?"

#### Moral Compass

The moral compass defines where the protagonist''s ethical boundaries lie. This is one of the most critical settings in grimdark fiction — it determines the reader''s emotional relationship with the protagonist:

| Moral Position | Characteristics | Reader Experience | Writing Difficulty |
|---------------|----------------|-------------------|-------------------|
| **No Lines — Pure Pragmatism** | Complete rationality, no moral taboos; every action is cost-benefit analysis | Awe-inspiring but potentially alienating; works best when the reader admires the logic even while being horrified | ★★★★★ |
| **Protects Only Inner Circle** | Has boundaries for "their people," merciless to everyone else | Readers can anchor emotionally to the protected relationships; provides warmth in darkness | ★★★ |
| **Has a Code but Breaks It When Needed** | Maintains principles but crosses them at critical moments | Maximum dramatic tension at the breaking points; each violation is a story event | ★★★★ |
| **Slowly Losing Humanity** | Every moral line crossed extracts a psychological toll | Strongest tragic resonance; the reader watches the protagonist''s soul erode | ★★★★★ |
| **Pretends to Be Worse Than They Are** | Cold exterior but secretly retains goodness | Gap moe; hidden warmth; readers enjoy seeing through the facade | ★★★ |

**Critical principle**: The moral compass determines the story''s emotional register.
- Pure Pragmatism → cold satisfaction, intellectual admiration (Fang Yuan)
- Protects Only Inner Circle → provides emotional anchoring points (Kelsier protecting crew)
- Has a Code but Breaks It → maximum "will they or won''t they" tension
- Slowly Losing Humanity → tragedy, the reader watches helplessly as the protagonist darkens (Taylor Hebert)
- Pretends to Be Worse → hidden warmth creates the most complex reader relationship

#### Story Tone

The story tone determines the overall atmospheric texture. It must be consistent with the archetype and conflict type:

- **Bleak and Unforgiving**: No redemption exists in this world. Victories are temporary reprieves. The protagonist survives but the cost keeps mounting. Best for pure grimdark experiences where the darkness *is* the point. (References: *The Road*, *Blood Meridian*, *Berserk''s Eclipse*)

- **Dark but Cathartic**: Darkness with payoff — every protagonist victory delivers satisfaction. The world is cruel but watching the MC triumph through ruthlessness is *fun*. This is the most commercially successful grimdark tone. (References: *Reverend Insanity*, *Practical Guide to Evil*, *Solo Leveling dark arcs*)

- **Cynical with Dark Humor**: Black comedy defuses the heaviness — the protagonist''s sardonic worldview adds levity. Suits worldly, experienced protagonists who''ve seen too much to take anything seriously. (References: *The Blade Itself* (Glokta chapters), *Gentlemen Bastards*, *Catch-22*)

- **Grim but Hopeful Undercurrent**: Beneath the dark surface, something faintly luminous persists — a person the protagonist protects, a principle they haven''t yet abandoned, a possibility of redemption. Best for Fallen Idealist archetypes. (References: *Worm* (early arcs), *The Stormlight Archive* (Kaladin arcs), *Vinland Saga*)

- **Operatic and Tragic**: Grand-scale tragedy with poetic resonance — fate, betrayal, destruction rendered as epic narrative. Characters are larger than life; their falls shake the world. (References: *Berserk*, *Macbeth*, *The Silmarillion* (Turin arc), *Fate/Zero*)

#### Stakes

Stakes define what the protagonist loses in failure AND what they sacrifice along the way. Great stakes must be **bidirectional** — not just "what happens if they fail" but "what winning costs them":

- **Cost of failure**: What happens if the protagonist loses? The best stakes are *worse than death*:
  - Eternal imprisonment / soul consumption / erasure from existence
  - Everyone they care about suffers (even if the "inner circle" is small)
  - The world they''re trying to survive/conquer is destroyed or becomes even worse

- **Cost of victory**: What must be sacrificed along the way? This is more important for grimdark than the failure cost:
  - Companions used as pawns and discarded
  - Humanity eroding with each moral compromise
  - Relationships destroyed by necessary betrayals
  - The protagonist becoming indistinguishable from the enemies they set out to defeat

- **Escalation headroom**: Can the stakes increase throughout the story?
  - Act 1: Personal survival → Act 2: Control of a faction → Act 3: Fate of a nation/world
  - Act 1: Physical freedom → Act 2: Destroying the system → Act 3: Reshaping reality
  - Each escalation should raise both the failure cost AND the victory cost

---

### Field Interdependencies

1. **Archetype → Central Conflict**: The archetype constrains which conflicts feel natural. A Calculating Strategist fits Rise to Power or Domination; a Cold Avenger fits Revenge. Mismatches create dissonance.

2. **Moral Compass → Story Tone**: No Lines pairs with Bleak or Dark but Cathartic; Slowly Losing Humanity pairs with Operatic and Tragic; Pretends to Be Worse pairs with Grim but Hopeful. Mismatches confuse the reader''s emotional experience.

3. **Central Conflict → Stakes**: Rise to Power''s stakes are the people sacrificed along the climb; Survival''s stakes are the protagonist''s own humanity; Revenge''s stakes are whether revenge is worth the cost.

4. **Archetype + Moral Compass → Archetype Details**: The details MUST be logically consistent with both. A "No Lines" Calculating Strategist should have details explaining why emotion was eliminated. A "Slowly Losing Humanity" Fallen Idealist should have details showing what they were *before*.

5. **All fields → Story Tone**: The tone is the synthesis. If archetype, conflict, moral compass, and stakes all point toward tragedy, but the tone says "Dark Humor," something is wrong.

---

### Common Mistakes

1. **Archetype-conflict mismatch**: Pairing a Morally Apathetic archetype with a Grim but Hopeful tone — the reader will feel cognitive dissonance because they cannot root for the protagonist AND expect hope simultaneously.

2. **Archetype Details lack a specific trauma**: Writing "the protagonist is cold-hearted" without explaining WHY. Every ruthless protagonist needs an origin — either an event that broke them or a world condition that shaped them. Without this, the character feels flat and cartoonish.

3. **Inconsistent Moral Compass**: Setting the compass to "No Lines" but having the protagonist inexplicably spare enemies or show mercy at key moments — unless this is an intentional character arc (which should be noted), this is a contradiction that breaks immersion.

4. **Stakes too vague**: Writing "failure means death" — death is the *minimum* stake. For grimdark, specify: whose death? In what manner? What is worse than death in this world? And more importantly, what does the protagonist sacrifice even when they *win*?

5. **Story Tone doesn''t match the writing**: Selecting "Cynical with Dark Humor" but writing deadly serious philosophical prose throughout. The tone setting should guide the actual narrative voice.

6. **Six fields operating independently**: Each field exists in isolation instead of forming an organic whole. The protagonist''s archetype, their moral compass, the world''s conflict, the tone, and the stakes should all be expressions of a single unified character concept.

7. **Forgetting that "ruthless" needs context**: A protagonist who is cruel in a kind world is a villain. A protagonist who is cruel in a cruel world is a survivor. The Core Premise must establish why ruthlessness is the *rational* response to this specific world.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Ruthless Protagonist Novel' LIMIT 1),
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
