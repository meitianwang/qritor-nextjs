-- The Protagonist Hunter「情节设计」skill (Layer 3)
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Protagonist Hunter' LIMIT 1)
-- Usage: mysql -u <user> -p <database> < skill-protag-hunter-plot-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'protag-hunter-plot-gen',
  '「情节设计」领域知识：为猎杀主角型小说提供剧情设计指导，涵盖4阶段典型故事结构（觉醒与定向→积累与拦截→正面交锋→终局）、"天命符合"vs"天命偏离"情节交替节奏、原著情节的预言埋设与现实验证伏笔策略，以及如何制造蝴蝶效应高潮',
  '"Plot Design" domain knowledge for Protagonist Hunter fiction: story structure guidance covering the 4-phase arc (Awakening & Orientation → Accumulation & Interception → Direct Confrontation → Endgame), the alternating rhythm of Canon-Aligned vs Canon-Divergent plot events, foreshadowing strategies using "original novel prophecy" and "reality verification," and how to construct a Butterfly Effect climax',
  '## 「情节设计」领域知识 — The Protagonist Hunter

猎杀主角型小说的核心剧情逻辑与其他类型截然不同：**故事不只发生在一个层面，而是原著剧情与猎手干预两条时间线的持续博弈**。好的情节设计让读者同时感受到"原著命运的必然性"和"猎手破局的爽感"——这两种力量形成持续张力，推动故事前进。

情节设计的三大核心任务：天命的可见性（读者始终能感受到原著命运的引力）、干预的有代价性（每次猎手行动都打乱某些东西，带来意外后果），以及节奏的交替感（天命符合与天命偏离的情节轮流出现，形成独特韵律）。

---

### 典型故事结构（4个阶段）

猎杀主角小说通常遵循"觉醒定向 → 积累拦截 → 正面交锋 → 终局清算"的结构：

| 阶段 | 章节占比 | 核心任务 | 典型事件类型 |
|------|---------|---------|-------------|
| **第一阶段：觉醒与定向** | 10-15% | 猎手确认身份、定位原著勇者、制定初步猎杀方案 | 身份确认事件 + 情报收集事件 |
| **第二阶段：积累与拦截** | 35-40% | 拦截勇者的关键成长机缘、积累自身力量和资源、处理蝴蝶效应副作用 | 机缘争夺事件 + 意外变量事件 |
| **第三阶段：正面交锋** | 25-30% | 猎手与勇者的正面或侧面对抗、猎手计划开始暴露、最艰难的拦截行动 | 高风险对抗事件 + 计划危机事件 |
| **第四阶段：终局** | 15-20% | 所有布局汇聚、勇者最终被超越或消除、代价显现 | 终极对决事件 + 代价清算事件 |

**节奏特点**：不是线性进行，而是"拦截成功→意外出现→再次拦截"的循环递进。每一次成功后，蝴蝶效应带来的新变量使局势更加复杂。

---

### 关键情节类型：天命符合 vs 天命偏离的交替节奏

猎杀主角故事最独特的情节机制是**两种事件类型的交替出现**。这种交替产生节奏感——读者在"原著命运压下来"和"猎手成功干预"之间持续切换，形成强烈的张力循环。

#### 天命符合情节（Canon-Aligned Events）

定义：原著中预定发生的事件，尽管猎手干预，仍然以某种形式发生。

天命符合情节的作用：
- 提醒读者和猎手，"命运"是一种真实的结构性力量，不容易打破
- 制造挫败感和危机感（猎手的计划不是每次都奏效）
- 通过"猎手以为成功了但命运换个方式补偿了勇者"的设计，展示主角光环的强大

天命符合事件的常见形态：
1. **机缘转移**：猎手成功拦截了原著中的A机缘，但命运以B机缘的形式给了勇者同等价值的收获。例：猎手提前拿走了圣地宝物，但勇者因此偶遇了那位原本守护宝物的老者，并从老者处学到了更重要的东西
2. **人物替换**：猎手消灭了原著中的某个关键NPC，但另一个人物出现并扮演了类似的角色。命运的"槽位"被填满了，只是用不同的人
3. **延迟兑现**：猎手成功推迟了某个关键事件，但事件在更危险的时机以更强烈的形式爆发

天命符合情节的写作要点：
- 猎手事先预见到某个天命符合的可能性（体现先知优势）
- 尽管预见，仍然无法完全阻止（体现命运的结构性力量）
- 揭露"天命找到了出口"的瞬间应该让读者感到震撼

#### 天命偏离情节（Canon-Divergent Events）

定义：由于猎手干预，原著中不存在的事件发生，或原著中预定发生的事件没有发生。

天命偏离情节的作用：
- 提供核心爽感（猎手的先知优势产生了实际效果）
- 展示猎手的能力和智慧
- 引入蝴蝶效应——每次偏离都带来新的不可预测变量

天命偏离事件的常见形态：
1. **机缘剥夺**：猎手在勇者到达之前拿走了关键宝物、斩断了关键人脉、提前触发了关键事件。勇者到达时一无所获
2. **盟友挖墙**：猎手将原著中注定成为勇者伙伴的人物收入麾下，或通过操作使其对勇者产生敌意
3. **成长拦截**：猎手识别了勇者的成长触发点（特定危机、特定挑战），提前消除或替换这个触发点，使勇者的成长停滞
4. **情报优势展示**：猎手利用对原著情节的了解，在"正确的时间、正确的地点"出现，以极低代价完成高难度目标

#### 交替节奏的设计原则

两种类型事件的建议比例：
- 第一阶段：天命符合6：天命偏离4（猎手刚开始，胜率不高）
- 第二阶段：天命偏离6：天命符合4（猎手进入状态，但蝴蝶效应开始积累）
- 第三阶段：五五开（局势复杂，双方进入博弈均势）
- 第四阶段：由前三阶段的积累决定，最终结局不应是纯粹的压倒性胜利

---

### 伏笔策略：原著情节的"预言"埋设与"现实验证"

猎杀主角小说有一种独特的伏笔机制——**原著知识本身就是一种预言系统**。猎手的每一次行动，都是在用自己的先知优势对抗命运的进程。

#### 预言埋设技巧

**显性预言**：猎手（以第一人称或限制视角）明确陈述他知道某件事将要发生。这建立了读者与猎手的共谋感——我们都知道原著剧情，我们一起看着它是否会发生。

正确的显性预言写法：
- 具体而非笼统："三天后，勇者将在森林北端的石桥遭遇那只黑熊，并在濒死中觉醒初始技能"（而不是"勇者很快就会遭遇危险"）
- 伴随行动计划："我必须在他到达石桥之前完成两件事"
- 建立可验证的预期，为后续"现实验证"或"现实否验"做准备

**隐性预言**：猎手采取某个行动，但不明说原因，留待读者后来发现这个行动与某个原著情节的关联。

隐性预言的运用：
- 猎手在某章结束前做了一件看似无关的小事（提前购买某种物资、提前结交某个看似不重要的人物）
- 数章之后，读者发现这个小事精确对应了某个原著情节的拦截需求
- 产生"啊，原来早就布好了"的伏笔回收快感

#### 现实验证写法

"现实验证"是指原著情节按预言发生，猎手（和读者）见证它的实现。这类场景的写作重点：
- **视角对比**：同一事件，原著视角（如果读者知道）是这样写的；猎手视角是截然不同的阅读体验
- **情感复杂性**：猎手看着原著情节发生，内心是什么感受？是确认感？还是某种无法言说的"看着虚构世界在自己眼前变成现实"的奇异感？
- **决策时机**：验证的瞬间通常也是猎手必须决定是否干预的时机

"现实否验"是指原著情节因猎手干预而没有发生。这类场景的写法：
- 展示原著情节"应该在这里发生"的迹象（氛围、道具、人物聚集），然后因猎手的介入戛然而止
- 勇者到达现场时，猎手已经完成了行动，一切已变
- 勇者的困惑和失落是最好的天命偏离确认

---

### 蝴蝶效应高潮的构建

蝴蝶效应是猎杀主角情节体系中最重要的高潮机制——它的本质是**猎手干预导致的连锁后果在某个关键时刻集中爆发**，制造出远超预期的灾难性或转折性局势。

#### 蝴蝶效应高潮的三要素

**要素1：积累期（多章节的微小偏离）**

在高潮爆发之前，需要在多个章节里埋下若干"微小干预"，这些干预单独看起来无关紧要，但实际上正在改变世界状态：
- 猎手拦截的某个机缘，使原本该在A处的某人出现在了B处
- 猎手操控的某段关系，使原本是盟友的两个势力产生了裂痕
- 猎手提前获取的某种资源，使某个组织的权力格局发生了微妙变化

这些微小变化不被读者（甚至猎手）所关注，但它们在系统层面正在积累变化。

**要素2：触发点（单一事件引爆连锁）**

一个看似普通的事件触发了所有积累的变化同时爆发。触发点的设计要点：
- 触发点本身可以是很小的事件（不是猎手计划的一部分，甚至是猎手疏忽或意外导致的）
- 它激活了之前所有积累变化的联动反应
- 爆发速度要快——读者应该在几段话内就看到多条因果线同时断裂

**要素3：涌现结果（超出任何人预期的新局面）**

蝴蝶效应高潮的结果必须是**任何人都无法预期**的新局面：
- 不是原著中存在的情节
- 不是猎手计划的结果
- 是所有干预叠加后的系统涌现

这个新局面通常对猎手来说既是机遇又是危险——它瓦解了原著情节的某个重要支撑，但同时也引入了猎手完全陌生的变量。

#### 蝴蝶效应高潮的写法

1. **慢镜头展示连锁**：高潮来临时，放慢叙事节奏，一步步展示各条因果线的连锁反应。读者需要理解"哪个干预导致了哪个后果"，这种理解本身就是阅读快感的来源

2. **猎手的错愕与重新定向**：即使是猎手，也应该对蝴蝶效应的规模感到震惊。他必须在新局面下快速重新规划。这个"重新定向"的过程应该展示猎手的适应能力，但也应该展示他的限制

3. **勇者在蝴蝶效应中的位置**：蝴蝶效应通常对勇者造成意想不到的打击或赐予意想不到的机遇。勇者面对蝴蝶效应的反应揭示了主角光环的工作方式——他是否能从这片混乱中找到新的成长路径？

4. **情感高潮的来源**：蝴蝶效应高潮的情感高潮来自"猎手看着自己一手造成的混乱意识到自己已经无法回头"的那一刻——他改变世界的能力，同时也是他失控的证明

---

### 常见错误

1. **天命偏离比例过高**：猎手总是成功拦截，天命符合事件太少。读者感受不到命运的压迫感，猎杀主角的核心张力消失——故事变成了"开挂流"而不是"对抗命运流"
2. **蝴蝶效应缺失**：猎手的每次干预都是干净的、单线的、没有副作用的。真实的世界干预必然产生连锁后果。缺少蝴蝶效应的猎杀主角故事会失去最重要的叙事深度
3. **预言系统不具体**：猎手知道"大概会发生什么"，但原著情报细节模糊——这使得伏笔系统无法运作，因为读者无法感受到"命中"或"未中"
4. **两个阶段混淆**：积累拦截阶段就开始进行正面交锋，或者正面交锋阶段还在做积累工作——节奏失调使读者无法感受到叙事的进展
5. **终局代价缺失**：猎手完成猎杀但几乎没有付出代价。猎杀主角的终局必须展示真实代价——他改变了什么？失去了什么？他成为了什么样的人？',
  '## "Plot Design" Domain Knowledge — The Protagonist Hunter

The core plot logic of Protagonist Hunter fiction is fundamentally different from other genres: **the story does not unfold on a single level — it is a continuous contest between the original novel''s timeline and the Hunter''s interventions.** Good plot design makes readers simultaneously feel "the inevitability of canonical fate" and "the satisfaction of the Hunter breaking free of it" — these two forces create sustained tension that drives the story forward.

Three core tasks of plot design: the Visibility of Fate (readers must always feel the gravitational pull of the original novel''s destiny), the Cost of Intervention (every Hunter action disrupts something and brings unexpected consequences), and Alternating Rhythm (Canon-Aligned and Canon-Divergent plot events must alternate, creating the genre''s distinctive pulse).

---

### Typical Story Structure (4 Phases)

Protagonist Hunter fiction typically follows an "Awakening & Orientation → Accumulation & Interception → Direct Confrontation → Endgame" structure:

| Phase | Chapter Ratio | Core Task | Typical Event Types |
|-------|--------------|-----------|-------------------|
| **Phase 1: Awakening & Orientation** | 10-15% | Hunter confirms their identity, locates the canonical hero, drafts initial hunting strategy | Identity confirmation events + intelligence gathering events |
| **Phase 2: Accumulation & Interception** | 35-40% | Intercept hero''s key growth opportunities, accumulate Hunter''s own power and resources, manage butterfly effect side-effects | Fortune-seizure events + unexpected variable events |
| **Phase 3: Direct Confrontation** | 25-30% | Open or lateral conflict between Hunter and hero, Hunter''s plans begin to be exposed, most difficult interception operations | High-risk confrontation events + plan crisis events |
| **Phase 4: Endgame** | 15-20% | All schemes converge, hero is finally surpassed or eliminated, costs emerge | Ultimate showdown events + cost reckoning events |

**Pacing note**: This is not linear progression, but "interception succeeds → unexpected variable appears → re-interception" as a recursive cycle. After each success, butterfly effect variables make the situation more complex.

---

### Key Plot Types: The Alternating Rhythm of Canon-Aligned vs Canon-Divergent Events

The most distinctive plot mechanism in Protagonist Hunter fiction is **the alternating appearance of two event types**. This alternation creates rhythm — readers continuously oscillate between "canonical fate pressing down" and "Hunter successfully intervening," generating a sustained tension loop.

#### Canon-Aligned Events

Definition: Events predetermined in the original novel that still occur in some form despite the Hunter''s interventions.

The role of Canon-Aligned events:
- Remind readers and the Hunter that "fate" is a real structural force, not easily broken
- Create frustration and crisis (the Hunter''s plans don''t always work)
- Through the design of "Hunter thought they succeeded but fate compensated the hero another way," demonstrate the power of the protagonist aura

Common forms of Canon-Aligned events:
1. **Fortune Transfer**: The Hunter successfully intercepts Fortune A from the original novel, but fate delivers an equivalent fortune to the hero through Fortune B. Example: the Hunter takes the holy relic before the hero arrives, but the hero thereby encounters the old guardian who reveals something far more important
2. **Character Substitution**: The Hunter eliminates a key NPC from the original novel, but another character appears and fulfills the same narrative role. Fate''s "slot" is filled — just with different personnel
3. **Delayed Manifestation**: The Hunter successfully postpones a key event, but it erupts more intensely at a more dangerous moment

Writing notes for Canon-Aligned events:
- The Hunter should foresee the possibility of this Canon-Aligned event (demonstrating foreknowledge advantage)
- Despite foreseeing, they still cannot fully prevent it (demonstrating fate''s structural force)
- The moment of revealing "fate found its outlet" should shock the reader

#### Canon-Divergent Events

Definition: Events that occur because of the Hunter''s intervention that do not exist in the original novel, or canonical events that fail to occur due to the Hunter''s actions.

The role of Canon-Divergent events:
- Provide the core satisfaction (the Hunter''s foreknowledge advantage produces real results)
- Demonstrate the Hunter''s skill and intelligence
- Introduce butterfly effects — every divergence brings new unpredictable variables

Common forms of Canon-Divergent events:
1. **Fortune Seizure**: The Hunter takes the key treasure, severs the key relationship, or pre-triggers the key event before the hero arrives. The hero arrives to nothing
2. **Companion Poaching**: The Hunter recruits a character destined to be the hero''s companion, or through manipulation creates hostility between them and the hero
3. **Growth Interception**: The Hunter identifies the hero''s growth trigger (a specific crisis, a specific challenge) and preemptively eliminates or replaces it, stalling the hero''s development
4. **Intelligence Advantage Demonstration**: The Hunter uses foreknowledge of the original novel to appear at "the right place at the right time," completing high-difficulty objectives at minimal cost

#### Design Principles for the Alternating Rhythm

Suggested ratios of the two event types:
- Phase 1: Canon-Aligned 6 : Canon-Divergent 4 (Hunter is just starting, success rate is modest)
- Phase 2: Canon-Divergent 6 : Canon-Aligned 4 (Hunter hits their stride, but butterfly effects accumulate)
- Phase 3: 50-50 (situation is complex, both sides enter strategic equilibrium)
- Phase 4: Determined by the accumulated weight of Phases 1-3; the ending should not be a purely overwhelming victory

---

### Foreshadowing Strategy: "Original Novel Prophecy" Planting and "Reality Verification"

Protagonist Hunter fiction has a unique foreshadowing mechanism: **the original novel''s knowledge itself functions as a prophecy system.** Every Hunter action is wielding foreknowledge against the flow of destiny.

#### Prophecy Planting Techniques

**Explicit Prophecy**: The Hunter (in first person or limited perspective) explicitly states that they know something is going to happen. This creates a sense of complicity between reader and Hunter — we both know the original plot, and we watch together to see whether it unfolds.

Correct approach to explicit prophecy:
- Specific, not vague: "In three days, the hero will encounter that black bear at the stone bridge at the north end of the forest, and in near-death will awaken their initial skill" (not "the hero will soon face danger")
- Accompanied by an action plan: "I must accomplish two things before he reaches the stone bridge"
- Establishes verifiable expectations, preparing the reader for subsequent "reality verification" or "reality contradiction"

**Implicit Prophecy**: The Hunter takes an action without explaining why, leaving the reader to discover its connection to a canonical plot event later.

How to use implicit prophecy:
- Before a chapter ends, the Hunter does something seemingly unrelated (buying a specific supply, befriending an apparently unimportant character)
- Several chapters later, the reader discovers this action precisely corresponds to an interception need for a canonical event
- Produces the foreshadow-payoff satisfaction of "ah, it was all laid out from the beginning"

#### Writing "Reality Verification" Scenes

"Reality Verification" is when a canonical event occurs as prophesied, and the Hunter (with the reader) witnesses its realization. Writing focus for this type of scene:
- **Perspective contrast**: The same event, from the canonical perspective, reads one way; from the Hunter''s perspective, it is an entirely different reading experience
- **Emotional complexity**: The Hunter watches a canonical plot unfold. What does the Hunter feel in that moment? A sense of confirmation? Some inexpressible strangeness at "watching fiction become reality before their eyes"?
- **Decision timing**: The moment of verification is usually also the moment the Hunter must decide whether to intervene

"Reality Contradiction" is when a canonical event fails to happen because of the Hunter''s intervention. Writing approach:
- Show the signs that the canonical event "should be happening here" (atmosphere, props, characters gathering), then have it cut short by the Hunter''s prior action
- The hero arrives to find everything already changed
- The hero''s confusion and loss is the clearest confirmation of Canon-Divergence

---

### Constructing the Butterfly Effect Climax

The Butterfly Effect is the most important climax mechanism in Protagonist Hunter fiction. Its essence is **the chain consequences of the Hunter''s interventions converging at a critical moment, erupting into a situation far beyond anyone''s anticipation** — catastrophic or transformative.

#### Three Elements of the Butterfly Effect Climax

**Element 1: Accumulation Period (minor divergences across multiple chapters)**

Before the climax erupts, multiple "micro-interventions" must be seeded across earlier chapters. Individually, each looks inconsequential, but they are collectively changing the world''s state:
- An intercepted fortune causes someone who should have been at location A to appear at location B
- A manipulated relationship cracks the alliance between two factions that should have been united
- A pre-acquired resource subtly shifts the power balance within an organization

These micro-changes go unnoticed by readers (even the Hunter), but they are accumulating systemic changes.

**Element 2: Trigger Point (a single event detonating the chain)**

A seemingly ordinary event triggers all accumulated changes to erupt simultaneously. Design principles for the trigger:
- The trigger itself can be a small event (not part of the Hunter''s plan — even something the Hunter overlooked or accidentally caused)
- It activates the cascading interaction of all previously accumulated changes
- The eruption speed should be fast — readers should see multiple causal chains breaking simultaneously within a few paragraphs

**Element 3: Emergent Outcome (a new situation no one anticipated)**

The Butterfly Effect climax must result in a **new situation that no one could have predicted**:
- It does not exist in the original novel
- It is not the result of the Hunter''s plans
- It is the systemic emergence of all interventions combined

This new situation is usually simultaneously an opportunity and a danger for the Hunter — it dismantles an important supporting element of the canonical plot, but also introduces variables completely unknown to the Hunter.

#### Writing the Butterfly Effect Climax

1. **Slow-motion display of the chain reaction**: As the climax arrives, slow the narrative pace and show step-by-step how each causal chain activates the next. Readers need to understand "which intervention caused which consequence" — this understanding IS the source of reading satisfaction

2. **Hunter''s shock and re-orientation**: Even the Hunter should be stunned by the scale of the butterfly effect. They must rapidly re-plan under the new situation. This "re-orientation" process should demonstrate the Hunter''s adaptability — but also their limits

3. **The hero''s position in the butterfly effect**: The butterfly effect usually delivers an unexpected blow to the hero OR grants them an unexpected opportunity. The hero''s response to the butterfly effect reveals how the protagonist aura works — can they find a new growth path in this chaos?

4. **Source of emotional climax**: The emotional peak of the butterfly effect climax is the moment "the Hunter looks at the chaos they created and realizes they cannot go back" — the ability to change the world is simultaneously the proof of their loss of control

---

### Common Mistakes

1. **Canon-Divergent ratio too high**: The Hunter always successfully intercepts; Canon-Aligned events are too rare. Readers cannot feel the pressure of fate, and the core tension of Protagonist Hunter fiction disappears — the story becomes "cheat mode" rather than "fight-against-fate mode"
2. **No butterfly effects**: The Hunter''s every intervention is clean, single-threaded, and without side effects. Real-world interventions inevitably produce chain consequences. A Protagonist Hunter story without butterfly effects loses its most important narrative depth
3. **Prophecy system not specific enough**: The Hunter knows "roughly what will happen," but original novel intelligence is vague — this prevents the foreshadowing system from working, because readers cannot feel the "hit" or "miss"
4. **Phase confusion**: Direct confrontation starts during the Accumulation & Interception phase, or accumulation work continues during the Direct Confrontation phase — rhythm disruption prevents readers from feeling the narrative''s progression
5. **Endgame lacks cost**: The Hunter completes the hunt but pays almost no price. The Protagonist Hunter''s endgame must reveal the real cost — what did they change? What did they lose? What kind of person have they become?',
  (SELECT id FROM novel_creation_method WHERE name = 'The Protagonist Hunter' LIMIT 1),
  1,
  30,
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
