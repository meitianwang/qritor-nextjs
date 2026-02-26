-- The Protagonist Hunter「角色」生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Protagonist Hunter' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-protag-hunter-character-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'protag-hunter-character-gen',
  '「角色」生成：为 The Protagonist Hunter 生成角色体系，涵盖4种核心角色类型（猎手/目标勇者/勇者伙伴/棋子），猎手先知优势的代入感设计，角色的"原著身份 vs 现实表现"偏差处理，以及野牌角色的不确定性设计',
  '"Character" generation for The Protagonist Hunter: generate character systems including 4 core character types (hunter/target hero/hero companions/pawns), immersion design for the hunter''s foreknowledge advantage, handling the "original identity vs actual behavior" gap, and wildcard character design for uncertainty',
  '## 「角色」生成 — The Protagonist Hunter

猎杀主角小说的角色体系有一个根本性的特殊之处：每个角色都同时存在于两个层面——**原著层**（他们在原著小说中的预定命运和性格）和**现实层**（他们在主角干预后实际的行为和发展）。设计角色时必须始终保持对这两个层面的意识。

---

### 一、4种核心角色类型

#### 类型1：猎手（The Hunter）—— 转生主角

猎手是整个故事的核心视角角色，其独特性在于**双重身份**：他既是转生者（拥有来自"现代读者"的认知），也是原著角色（有着预设的身份、过去和人际关系）。

**猎手的核心矛盾**：
- 外在身份是原著中的某个反派/小怪，内在意识是一个知道剧情走向的现代人
- 必须在"扮演原著角色"和"推进猎杀计划"之间取得平衡
- 对原著世界有情感（可能曾经是这部小说的读者粉丝），但必须做出伤害这个世界人物的决定

**先知优势的代入感设计**：
先知优势的核心是"读者视角"——猎手知道哪些事情要发生，这在代入感上与读者形成了强烈共鸣。设计先知优势时应注意：

1. **知识的具体性**：先知不应该是模糊的"我知道会发生大事"，而应该是具体的"我知道这个看起来老实的商人三个月后会出卖我"。具体的预知创造具体的决策张力。

2. **知识的有限性**：猎手对原著的了解有上限——或许他只读过前10卷，之后的剧情是盲区；或许他记住了主要情节但忘了细节；或许某些角色的内心戏他从未知道。这些限制是制造悬念的关键。

3. **知识的情感负担**：猎手知道某些人物会死，或者某些美好的事情会被摧毁。这种预知带来的情感压力应该体现在角色刻画中——他是麻木地接受，还是在内心挣扎？

4. **知识失效的时刻**：每次干预后，时间线偏离，已知的情报逐渐失效。猎手从"先知"变成"普通人"的过渡过程，是角色成长的重要弧线。

**猎手的原著身份继承**：
猎手继承了原著角色的身体、技能、记忆和人际关系，但内在意识是完全不同的人。这种继承产生的张力点：
- 原著角色可能有他不认同的价值观（必须假装认同）
- 原著角色的部下可能对"旧主"有期待（猎手必须满足这些期待或承受怀疑）
- 原著角色可能有复仇对象或情感羁绊（猎手如何处理这些"继承来的感情"？）

---

#### 类型2：目标勇者（The Target Hero）

目标勇者是猎手行动的核心对象。在传统异世界故事里，勇者是主角；在猎杀主角故事里，他是被猎杀的对象。这种视角反转必须通过精心的人物设计来实现戏剧张力，而不是简单地将勇者丑化。

**勇者的主角光环设计**：
主角光环不只是"运气好"，它是勇者成长的底层驱动力，需要被系统性地设计：

1. **社交光环**：勇者天然能够赢得他人的信任和爱戴。设计具体表现：在何种情况下勇者的魅力会发生效应？对哪类人物最有效？猎手如何识别这种光环并提前隔离目标人物？

2. **危机感知光环**：在危险接近时，勇者会有模糊的"不对劲"感觉——不足以完全规避，但足以触发他的应变能力。设计猎手如何"欺骗"这种感知（例：化装、通过中间人传递威胁，而非直接出手）。

3. **成长爆发光环**：在陷入绝境时，勇者会激发潜力，出现超出当前水平的爆发。设计猎手如何避免将勇者逼入绝境的情境（不要制造完美的"反转时机"）。

4. **命运补偿光环**：当一个机缘被剥夺时，命运会以另一种形式补偿同等价值的机缘。设计猎手如何追踪和预判这种补偿效应。

**勇者的人物深度**：
猎杀主角小说的陷阱是将勇者写成纸片人反派，让读者无法理解为什么猎手要这么费劲。勇者必须是**真正值得被猎杀的威胁**：
- 他有真实的正义感和善良，不只是工具人
- 他的成长弧线在原著中是真实感人的
- 读者应该能够理解：如果不从猎手的视角看，勇者就是无可指摘的英雄

这种设计让猎手的每一次行动都带有道德张力——他不是在对抗邪恶，而是在对抗"命定的善良"。

---

#### 类型3：勇者伙伴（The Hero''s Companions）

勇者伙伴是猎手同时需要监控、操控和规避的复杂群体。他们对猎手有三重意义：

**意义1：情报来源**
- 伙伴的行动和动向反映了勇者的下一步计划
- 伙伴之间的关系状态告诉猎手联盟瓦解策略的进展

**意义2：间接攻击目标**
- 伤害或移除伙伴比直接攻击勇者更安全（不会直接触发主角光环的最强模式）
- 伙伴的消失会影响勇者的心理状态，间接削弱其表现

**意义3：潜在"野牌"**
- 某些伙伴在原著中有背叛/转变的潜力，猎手需要判断是否加速这种转变
- 原著中死亡的伙伴，在猎手干预后可能存活，带来不可预测的影响

**伙伴的"原著身份 vs 现实表现"偏差设计**：
这是最核心的角色设计挑战。每个伙伴在原著中有预设的性格和命运，但猎手的干预会让他们的实际表现偏离原著设定：

- **偏差类型A（正偏差）**：原著中这个伙伴在某次危机后成长，但由于猎手提前消除了那次危机，这个伙伴没有得到成长契机，实际能力停滞
- **偏差类型B（负偏差）**：原著中这个伙伴是善良可靠的，但由于猎手的渗透操控，这个伙伴被迫做出了违背本性的选择，开始向黑化方向发展
- **偏差类型C（量子态偏差）**：由于多个干预叠加，这个伙伴的性格走向变得完全不可预测，猎手已经无法用原著知识来判断她/他的下一步行动

---

#### 类型4：棋子（Pawns）

棋子是猎手在猎杀行动中使用的工具型人物——他们知道或不知道自己被利用，在猎手的战略棋盘上扮演特定角色。

**棋子的分类**：

1. **知情棋子（Conscious Pawns）**：明确知道自己在服务猎手的计划，通常是猎手直接招募的心腹。风险：知情越多，背叛或泄露的风险越高。

2. **蒙蔽棋子（Deceived Pawns）**：被猎手以虚假理由驱使，在不知情的状态下执行猎杀计划的某个步骤。优势：没有主观叛意；劣势：任务执行可能偏差，因为他们不知道真实目标。

3. **原著棋子（Canon Pawns）**：原著中本就对勇者持敌视态度的角色，猎手只是借助他们已有的行动倾向加以引导。这是风险最低的棋子类型。

4. **反转棋子（Double-Edged Pawns）**：表面上服务于正派，实际上被猎手秘密策反的角色。最危险的类型，一旦暴露，双方都受到严重打击。

---

### 二、野牌角色（Wildcard Characters）设计

野牌角色是**不在原著剧情中的人物**——他们是猎手干预行为催生的新角色，或是原著中存在但完全不重要的背景人物，因为猎手的干预而走到了历史的前台。

**野牌角色的来源**：

1. **蝴蝶效应生成者**：猎手某次行动意外影响了一个背景NPC的命运，使其走上了原著中不存在的成长路径。例：猎手为了一个任务雇用了一个流浪者，这个流浪者因此进入了上层社会，成为了一个有影响力的政治人物。

2. **原著删减角色**：有些故事中，原著小说本身也有"草稿版本"——原著作者删去的角色或情节，在这个现实世界中却实际存在。

3. **原著外来者**：完全不属于原著世界设定的外来者（例：另一个异世界转生者，来自完全不同的小说背景）。

**野牌角色的设计原则**：

1. **不可预测性**：野牌角色的行动完全在猎手的知识盲区之外，这是他们存在的首要价值——他们打破猎手"一切都在掌控中"的错觉

2. **功能性**：每个野牌角色的出现都应该有其叙事功能——可以是威胁（挑战猎手的计划）、机遇（提供猎手原著中没有的资源）或复杂化（使本已明朗的局势重新变得扑朔迷离）

3. **与原著世界的有机联系**：野牌角色不是凭空出现的，他们的存在应该有合理的世界逻辑——为什么他们在原著中不重要？因为原著主角从未接触过他们的生活轨迹。但他们一直都存在于这个世界里。

---

### 三、角色的"原著身份 vs 现实表现"偏差处理总则

设计任何角色时，必须同时建立两个版本：

**版本A（原著设定）**：这个角色在原著中是什么性格？有什么命运节点？对勇者是什么态度？原著中他/她是否死亡？死于何时？

**版本B（现实发展）**：由于猎手的介入，这个角色实际上走向了什么路径？哪些原著设定仍然成立？哪些已经被改变了？

**偏差的戏剧价值**：
偏差不只是"改变发生了"——偏差本身是戏剧冲突的来源：
- 当猎手预期某个角色会做A，但由于偏差他做了B，猎手必须即时调整计划
- 当一个原著中的反派因为猎手的意外善意变成了猎手的盟友，这种反转带来的戏剧价值
- 当原著中的好人因为猎手的操控变成了对立面，猎手内心的道德重量

---

### 常见错误

1. **勇者角色工具化**：勇者只是被猎杀的对象，没有真实的人物深度。读者无法理解为什么猎手需要如此费力——因为勇者看起来根本不是真正的威胁
2. **棋子角色一维化**：棋子只是执行功能，没有自己的动机和利益冲突。真实的棋子会有自己的算计，可能在关键时刻出于自身利益背叛或超出预期地投入
3. **野牌角色缺失**：故事完全在猎手的预知范围内运行，没有真正意义上的"意外"。缺少野牌角色的猎杀主角故事会让读者感到主角在"开挂"而非在搏斗
4. **偏差设计单向化**：只设计负面偏差（好角色变坏），忽略正向偏差（坏角色变好）和中性偏差（角色走向不同但非好坏判断）。真实的世界干预会产生各种方向的变化
5. **猎手视角单一化**：只从猎手的计划视角看其他角色，忽视了其他角色是有主体性的人。偶尔使用其他角色的主观视角，可以有效增加叙事的立体感',
  '## "Character" Generation — The Protagonist Hunter

Character systems in Protagonist Hunter fiction have one fundamental distinguishing feature: every character simultaneously exists on two levels — the **Canon Layer** (their predestined fate and personality in the original novel) and the **Reality Layer** (their actual behavior and development after the protagonist''s intervention). Character design must always maintain awareness of both layers.

---

### Part I: The 4 Core Character Types

#### Type 1: The Hunter — The Reincarnated Protagonist

The Hunter is the central perspective character of the entire story. Their uniqueness lies in the **dual identity**: they are simultaneously a reincarnator (possessing the cognition of a "modern reader") and an original-novel character (with a predetermined identity, history, and interpersonal relationships).

**The Hunter''s Core Tension**:
- External identity is some villain or minor monster from the original novel; internal consciousness is a modern person who knows the plot trajectory
- Must balance "performing the original character''s role" with "advancing the hunting plan"
- Has emotional investment in the original world (may have been a fan of this novel in their former life) but must make decisions that harm this world''s people

**Designing Immersive Foreknowledge**:

The foreknowledge advantage''s core is the "reader perspective" — the Hunter knows what is going to happen, creating strong resonance with the audience. Key design considerations:

1. **Specificity of Knowledge**: Foreknowledge should not be vague ("I know something big will happen") but concrete ("I know that honest-looking merchant will betray me in three months"). Specific foreknowledge creates specific decision tension.

2. **Limits of Knowledge**: The Hunter''s understanding of the original novel has a ceiling — perhaps they only read the first 10 volumes; perhaps they remember major events but forgot details; perhaps they never knew what certain characters were thinking internally. These limits are the key to generating suspense.

3. **The Emotional Burden of Knowledge**: The Hunter knows that certain people will die, or that certain beautiful things will be destroyed. The emotional pressure of this foreknowledge should manifest in character writing — does the Hunter become numb to it, or struggle internally?

4. **Moments When Knowledge Fails**: After each intervention, the timeline diverges and intelligence progressively becomes invalid. The transition from "prophet" to "ordinary person who must improvise" is a vital character growth arc.

**Inheriting the Original Character''s Identity**:
The Hunter inherits the original character''s body, skills, memories, and interpersonal relationships — but their internal consciousness is an entirely different person. Tension points generated by this inheritance:
- The original character may have held values the Hunter does not endorse (and must pretend to endorse)
- The original character''s subordinates may have expectations of their "former master" (the Hunter must meet those expectations or face suspicion)
- The original character may have targets of revenge or emotional bonds (how does the Hunter handle these "inherited feelings"?)

---

#### Type 2: The Target Hero

The Target Hero is the central object of the Hunter''s actions. In conventional isekai, the hero is the protagonist; in Protagonist Hunter fiction, they are the prey. This perspective inversion must generate dramatic tension through careful character design — not by simply making the hero into a villain.

**Designing the Protagonist Aura**:
The Protagonist Aura is not merely "good luck" — it is the foundational drive of the hero''s growth and must be systematically designed:

1. **Social Aura**: The hero naturally wins trust and affection from others. Design specific manifestations: in what circumstances does the hero''s charisma activate? Which types of characters are most susceptible? How does the Hunter identify this aura and pre-isolate target individuals?

2. **Crisis Perception Aura**: When danger approaches, the hero experiences a vague "something''s wrong" sensation — insufficient to fully evade, but enough to trigger adaptive responses. Design how the Hunter "deceives" this perception (example: using disguise, transmitting threats through intermediaries rather than acting directly).

3. **Breakthrough Under Pressure Aura**: When pushed to extremes, the hero unleashes potential — manifesting power that exceeds their current level. Design how the Hunter avoids creating the conditions that trigger this effect (never push the hero into perfect "reversal moments").

4. **Destiny Compensation Aura**: When one fortune is denied, fate compensates with an equivalent fortune through a different channel. Design how the Hunter tracks and anticipates this compensation effect.

**The Hero''s Character Depth**:
The trap in Protagonist Hunter fiction is writing the hero as a flat antagonist — making it incomprehensible why the Hunter would go to such lengths. The hero must be a **genuinely threatening force worth hunting**:
- They possess real justice and goodness, not merely symbolic virtue
- Their growth arc in the original novel is authentic and moving
- Readers should be able to understand: if not seen from the Hunter''s perspective, this hero is an unimpeachable champion

This design ensures that every one of the Hunter''s actions carries moral weight — they are not opposing evil, but opposing "fated goodness."

---

#### Type 3: The Hero''s Companions

The hero''s companions are a complex group that the Hunter must simultaneously monitor, manipulate, and avoid. They hold three-dimensional significance for the Hunter:

**Significance 1: Intelligence Source**
- The companions'' movements reflect the hero''s next steps
- The relationship status among companions tells the Hunter how far the alliance disruption strategy has progressed

**Significance 2: Indirect Attack Targets**
- Harming or removing companions is safer than directly attacking the hero (does not directly trigger the Protagonist Aura''s maximum response mode)
- The loss of companions affects the hero''s psychological state, indirectly degrading their performance

**Significance 3: Potential Wildcards**
- Some companions have betrayal or transformation potential in the original novel; the Hunter must judge whether to accelerate these shifts
- Companions who die in the original novel may survive due to the Hunter''s interventions, introducing unpredictable new factors

**Designing the "Original Identity vs Actual Behavior" Gap**:
This is the central character design challenge. Each companion has preset personality and fate in the original novel, but the Hunter''s interventions cause their actual behavior to diverge from the canon:

- **Gap Type A (Positive Deviation)**: In the original novel, this companion undergoes crucial growth after a crisis — but because the Hunter preemptively eliminated that crisis, the companion never receives the growth catalyst, leaving their actual capabilities stagnant
- **Gap Type B (Negative Deviation)**: In the original novel, this companion is reliably good — but due to the Hunter''s infiltration and manipulation, they have been forced into choices that violate their nature, and are beginning to develop in a darker direction
- **Gap Type C (Quantum State Deviation)**: Due to multiple overlapping interventions, this companion''s trajectory has become entirely unpredictable — the Hunter can no longer use original novel knowledge to anticipate their next move

---

#### Type 4: Pawns

Pawns are the instrumental characters the Hunter employs during the hunting operation — whether or not they know they are being used, they play specific roles on the Hunter''s strategic chessboard.

**Pawn Classifications**:

1. **Conscious Pawns**: Explicitly know they are serving the Hunter''s plan; typically trusted agents directly recruited by the Hunter. Risk: the more they know, the higher the risk of betrayal or information leakage.

2. **Deceived Pawns**: Driven by the Hunter under false pretenses, executing a step of the hunting plan without knowing the true objective. Advantage: no deliberate betrayal intent. Disadvantage: task execution may deviate because they are blind to the real target.

3. **Canon Pawns**: Characters already hostile to the hero in the original novel — the Hunter simply channels their pre-existing hostility rather than creating new motivation. The lowest-risk pawn type.

4. **Double-Edged Pawns**: Ostensibly serving the righteous faction, secretly turned by the Hunter. The most dangerous type — once exposed, both the pawn and the Hunter suffer severe consequences.

---

### Part II: Wildcard Character Design

Wildcard characters are **people who do not exist in the original novel''s plot** — they are new figures generated by the Hunter''s intervention, or background characters who existed in the original world but were completely irrelevant, now pulled into the foreground by the Hunter''s actions.

**Sources of Wildcard Characters**:

1. **Butterfly Effect Products**: The Hunter''s actions accidentally alter the fate of a background NPC, sending them down a growth path that does not exist in the original novel. Example: the Hunter hires a wanderer for a task — this wanderer subsequently gains access to upper-class society and becomes an influential political figure.

2. **Deleted Canon Characters**: In some story setups, the original novel itself had a "draft version" — characters or plot threads the original author discarded, which nevertheless exist as reality in this world.

3. **Extra-Canon Arrivals**: Someone who does not belong to this world''s setting at all — another isekai reincarnator from a completely different novel background, for instance.

**Wildcard Character Design Principles**:

1. **Unpredictability**: Wildcard characters operate entirely outside the Hunter''s knowledge — this is their primary narrative value. They shatter the Hunter''s illusion that "everything is under control."

2. **Functional Role**: Every wildcard character''s appearance must serve a narrative function — threat (challenging the Hunter''s plan), opportunity (providing resources unavailable in the original novel), or complication (re-obscuring a situation that had seemed clear).

3. **Organic Connection to the World**: Wildcard characters do not appear from nowhere — their existence must have logical grounding. Why were they unimportant in the original novel? Because the original hero''s trajectory never intersected with theirs. But they always existed in this world.

---

### Part III: The "Original Identity vs Actual Behavior" Gap — General Principles

When designing any character, always establish two versions:

**Version A (Canon Setting)**: What was this character like in the original novel? What fate nodes did they have? What was their attitude toward the hero? Did they die in the original? When?

**Version B (Reality Development)**: Due to the Hunter''s intervention, what path is this character actually taking? Which canonical elements still hold? Which have been altered?

**The Dramatic Value of Gaps**:
Gaps are not merely "changes happened" — the gaps themselves are sources of dramatic conflict:
- When the Hunter expects a character to do A, but due to gap effects they do B, the Hunter must adjust plans in real time
- When a canon villain unexpectedly becomes the Hunter''s ally due to the Hunter''s accidental kindness — the dramatic value of this reversal
- When a canon good person becomes an adversary due to the Hunter''s manipulation — the moral weight carried by the Hunter

---

### Common Mistakes

1. **Instrumentalizing the hero**: The hero exists only as a hunting target, with no genuine character depth. Readers cannot understand why the Hunter needs to work so hard — because the hero does not appear to be a real threat.

2. **One-dimensional pawns**: Pawns only serve their functional role, with no personal motivations or conflicting interests. Real pawns have their own calculations — they may betray at a critical moment out of self-interest, or unexpectedly go far beyond what the Hunter asked of them.

3. **No wildcard characters**: The story operates entirely within the Hunter''s foreknowledge. Without genuine wildcards, a Protagonist Hunter story gives readers the sense that the protagonist is "cheating at life" rather than fighting a genuine battle.

4. **Unidirectional gap design**: Only negative gaps (good characters turning bad) are designed, while positive gaps (bad characters turning good) and neutral gaps (different trajectory without moral valence) are ignored. Real-world interventions produce changes in all directions.

5. **Single-perspective protagonist**: Other characters are only seen through the lens of the Hunter''s planning, with no recognition that they are autonomous people. Occasionally using other characters'' subjective perspectives significantly increases narrative depth.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Protagonist Hunter' LIMIT 1),
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
