-- The Ruthless Protagonist Novel "Plot Design" skill (Layer 3)
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Ruthless Protagonist Novel' LIMIT 1)
-- Usage: mysql -u <user> -p <database> < skill-ruthless-protag-plot-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ruthless-protag-plot-gen',
  '「情节设计」领域知识：为 Grimdark & Anti-Hero 小说提供剧情设计指导，涵盖道德代价驱动的故事结构、权力博弈节奏、背叛与牺牲循环、伏笔策略等典型剧情模式',
  '"Plot Design" domain knowledge: plot design guidance for Grimdark & Anti-Hero fiction, covering moral-cost-driven story structure, power game pacing, betrayal-sacrifice cycles, and foreshadowing strategies',
  '## 「情节设计」领域知识 — The Ruthless Protagonist Novel

Grimdark 与反英雄小说的核心剧情逻辑：**每一次胜利都有代价，每一次选择都是道德妥协**。主角不是善良的人在被迫做坏事——他是一个彻底务实（甚至冷酷）的人在一个不允许善良存在的世界里攀登。读者的满足感来自看主角用理性和狠辣碾碎虚伪的"正义"。

剧情设计关键：权力博弈的节奏控制（不断升级的对手和筹码）、背叛与牺牲的循环（每次前进都要付出代价）、道德灰色的两难选择（没有"正确答案"），以及伏笔的精密布局。

---

### 典型故事结构

Grimdark 小说通常遵循"困境→博弈→扩张→背叛→决战"的权力攀升结构：

| 阶段 | 章节占比 | 核心任务 | 典型事件类型 |
|------|---------|---------|-------------|
| **起始困境** | 10-15% | 建立主角的绝境处境、展示世界的残酷规则 | 生存事件 + 性格展示 |
| **初始博弈** | 20-25% | 主角第一次运用手段获取资源/权力，建立初始势力 | 策略事件 + 关键抉择 |
| **势力扩张** | 25-30% | 攻城略地、结盟与利用、势力壮大 | 高潮事件 + 多线推进 |
| **关键背叛/危机** | 15-20% | 核心盟友背叛或重大失败，主角被打到谷底 | 反转 + 情感冲击 |
| **最终决战** | 10-15% | 主角用一切手段（包括最狠辣的）赢得最终胜利 | 终极高潮 + 代价清算 |

**节奏特点**：不是线性上升，而是"攀升→坠落→更高攀升"。每一次成功后都伴随新的威胁或代价。

---

### 故事线模式

#### 典型主线

- **权力攀升线**：从底层到权力巅峰，每一层都有更强的对手和更高的道德代价
- **复仇线**：为了复仇不断牺牲身边的人和自己的人性，复仇完成时发现自己已面目全非
- **生存线**：在极端环境中求生，不断做出"谁活谁死"的选择

#### 常见支线

| 支线类型 | 说明 | 与主线的关系 |
|---------|------|-------------|
| **势力斗争** | 各派系的明争暗斗、合纵连横 | 为主角提供可利用的裂缝 |
| **内心冲突** | 主角最后的人性底线与务实需求的拉扯 | 制造"他还是人吗"的核心张力 |
| **牺牲链** | 被主角利用/抛弃的人的命运 | 展示主角行为的真实代价 |
| **伪正义线** | 打着正义旗号的反派的虚伪面目 | 为主角的"恶"提供相对正当性 |
| **忠诚考验** | 核心同伴面临选择：继续跟随还是离开 | 增加人际层面的紧张感 |

---

### 事件编排模式

#### 起始困境期
- 展示世界的残酷规则（强者通吃，弱者被践踏）
- 主角的原始处境（奴隶、囚徒、被追杀、被放逐）
- 第一次展示主角的冷酷特质（面对危机时的理性反应）
- 事件重要度：1-3（但性格伏笔重要度很高）

#### 初始博弈期
- 第一次关键抉择（牺牲无辜者换取生存机会）
- 建立第一个工具性"盟友"关系
- 与第一个对手的智力/武力博弈
- 小规模背叛或利用展示
- 事件重要度：2-4

#### 势力扩张期
- 多条势力线并行推进
- 联盟的建立与背后的暗中布局
- 更大规模的道德抉择（牺牲一群人保全大局）
- 与"正义"势力的第一次正面冲突
- 事件重要度：3-5

#### 关键背叛/危机期
- 核心盟友的背叛或自己布局被反噬
- 主角失去一切或几乎一切
- 最黑暗的时刻——主角必须做出最残忍的选择
- 情感层面的冲击（主角是否还有人性）
- 事件重要度：4-5

#### 最终决战期
- 所有伏笔收束——主角早已布下的暗棋揭晓
- 终极对手的对决（不只是武力，更是理念碰撞）
- 最终代价的支付（胜利的代价是什么）
- 模糊的结局：赢了一切，但失去了什么
- 事件重要度：5

---

### 伏笔策略

#### 常用伏笔类型

| 伏笔类型 | 说明 | 埋设时机 | 回收时机 |
|---------|------|---------|---------|
| **角色忠诚度暗示** | 同伴的微妙不满或犹豫暗示未来背叛 | 初始博弈期 | 关键背叛期 |
| **力量代价预兆** | 主角获取力量时暗示的身体/精神代价 | 势力扩张期 | 最终决战期 |
| **背叛种子** | 主角早期对某人的利用为日后反噬埋下伏笔 | 起始困境期 | 关键背叛期 |
| **暗棋布局** | 主角看似无意的行为实为深谋远虑 | 任意早期阶段 | 最终决战期 |
| **道德底线** | 主角少数表露人性的瞬间 | 散布各阶段 | 终极抉择时刻 |
| **伪正义本质** | "正义"对手的虚伪本质线索 | 初始博弈期 | 势力扩张期揭露 |

#### Grimdark 特有伏笔技巧

- **棋子视角**：被主角利用的人从自己的视角讲述，读者后来才意识到主角早就算计好了一切
- **代价延迟**：获取力量/胜利后很久才显现代价，让读者以为"这次免费了"
- **镜像对照**：主角和反派的相似之处暗示"换个处境他们会做一样的事"
- **信任与背叛循环**：每次建立信任都暗含下一次背叛的种子

---

### 常见错误

1. **主角无代价碾压**：主角太强、太聪明，赢得不费力气——失去 grimdark 核心张力
2. **黑暗沦为刻奇**：为了"黑暗"而"黑暗"，暴力和残忍没有叙事目的，变成展览式猎奇
3. **配角沦为工具人**：被牺牲的角色没有足够的塑造，读者无感，代价就没有重量
4. **道德选择伪两难**：看似两难实际有明显正确答案，降低了选择的冲击力
5. **背叛没有铺垫**：盟友突然背叛但之前毫无征兆，显得突兀
6. **结局过于圆满**：grimdark 的结局应该是苦涩的胜利或代价沉重的成功，全面圆满的大团圆破坏基调
7. **权力攀升没有挫折**：主角一路顺风直上，缺乏"坠落后再爬起"的核心节奏',
  '## "Plot Design" Domain Knowledge — The Ruthless Protagonist Novel

The core plot logic of grimdark and anti-hero fiction: **every victory has a price, and every choice is a moral compromise**. The protagonist is not a good person forced into bad deeds — they are a thoroughly pragmatic (even cold-blooded) individual climbing through a world that does not permit kindness. Reader satisfaction comes from watching the MC use rationality and ruthless tactics to crush the hypocrisy of so-called "justice."

The keys to plot design: pacing of power games (ever-escalating opponents and stakes), cycles of betrayal and sacrifice (every advance costs something), morally gray dilemmas (no "right answer"), and meticulously planted foreshadowing.

---

### Typical Story Structure

Grimdark novels follow a "predicament → initial gambit → expansion → betrayal → final reckoning" power-ascent structure:

| Phase | Chapter Ratio | Core Task | Typical Event Types |
|-------|--------------|-----------|-------------------|
| **Opening Predicament** | 10-15% | Establish the MC''s desperate situation and the world''s brutal rules | Survival events + character reveal |
| **Initial Gambit** | 20-25% | MC first uses cunning/force to acquire resources or power; forms initial power base | Strategic events + key choices |
| **Power Expansion** | 25-30% | Territory acquisition, alliances of convenience, growing influence | Climax events + multi-thread progression |
| **Critical Betrayal / Crisis** | 15-20% | Core ally betrays MC or a major scheme backfires; MC is brought to their lowest point | Reversals + emotional impact |
| **Final Reckoning** | 10-15% | MC uses every tool available — including the most ruthless — to claim ultimate victory | Ultimate climax + cost accounting |

**Pacing note**: The trajectory is not linear ascent but "climb → fall → higher climb." Every success is followed by a new threat or cost.

---

### Story Line Patterns

#### Main Line Archetypes

- **Power Ascent**: From the bottom to the pinnacle of power — each level brings stronger enemies and higher moral costs. The MC trades pieces of their humanity at every rung of the ladder.
- **Revenge Arc**: The MC sacrifices everyone around them and their own humanity for vengeance, only to find that by the time vengeance is complete, they are unrecognizable. The question shifts from "will they succeed?" to "what will be left of them?"
- **Survival Arc**: In an extreme environment where someone must die for others to live, the MC consistently makes the "who lives, who dies" calls that others cannot. The tension is in whether they truly have no choice, or whether they''ve started to enjoy choosing.

#### Common Subplots

| Subplot Type | Description | Relationship to Main Line |
|-------------|-------------|--------------------------|
| **Faction warfare** | Open and covert struggles between power groups, shifting alliances | Provides exploitable fractures for the MC |
| **Inner conflict** | The tension between the MC''s last shred of humanity and their pragmatic needs | Creates the core "are they still human?" tension |
| **Sacrifice chain** | The fates of people used and discarded by the MC | Demonstrates the real cost of the MC''s actions |
| **False righteousness** | Antagonists who wave the banner of justice while being deeply corrupt | Provides relative justification for the MC''s "evil" |
| **Loyalty test** | Core companions facing the choice: continue following or walk away | Adds interpersonal tension and stakes |

---

### Event Arrangement Patterns

#### Opening Predicament Phase

- **World rules on display**: Show the world''s brutal mechanics (the strong devour the weak; mercy is a death sentence)
- **MC''s initial situation**: Slave, prisoner, hunted, exiled, or otherwise at the very bottom
- **First display of ruthless character**: When facing a life-or-death crisis, the MC reacts with cold calculation rather than panic or heroism
- **Hook moment**: Something happens that forces the MC onto a path of power — not by choice, but because the alternative is death
- Event importance: 1-3 (but character-seed foreshadowing importance is very high)

#### Initial Gambit Phase

- **First critical choice**: Sacrifice an innocent or bystander to seize a survival opportunity
- **First instrumental "alliance"**: Partner with someone not out of trust, but mutual utility — both know the arrangement is temporary
- **First opponent clash**: An intellectual or physical contest with a local power figure; the MC wins by fighting dirty or thinking three steps ahead
- **Small-scale betrayal demonstration**: Show the MC breaking a promise or using someone, establishing the pattern early
- **Power system engagement**: MC discovers how to gain power in this world — and what it costs
- Event importance: 2-4

#### Power Expansion Phase

- **Multi-thread power consolidation**: Multiple faction lines advancing simultaneously; the MC plays different groups against each other
- **Alliance-building with hidden agendas**: Every alliance the MC forms has a secret exit strategy or exploitation plan baked in
- **Large-scale moral dilemma**: Sacrifice a group of people to protect the bigger picture — or sacrifice the bigger picture to save a few
- **First clash with "righteous" forces**: The MC confronts enemies who genuinely believe they are heroes, creating the genre''s signature moral ambiguity
- **Expanding costs**: Each victory now costs more — allies are growing suspicious, enemies are learning the MC''s patterns, and the MC''s own methods are getting darker
- Event importance: 3-5

#### Critical Betrayal / Crisis Phase

- **The turn**: A core ally betrays the MC, or the MC''s own scheme is turned against them by a smarter opponent
- **Losing everything**: The MC is stripped of power, allies, resources — or comes close enough that recovery seems impossible
- **Darkest moment**: The MC must make their most ruthless choice yet — one that would have horrified their earlier self
- **Emotional confrontation**: A scene that forces the reader to ask whether the MC has crossed a line from which there is no return
- **The pivot**: In the wreckage, the MC finds or creates one last play — using the desperation itself as a weapon
- Event importance: 4-5

#### Final Reckoning Phase

- **Foreshadow payoff**: All the quiet moves the MC made in earlier phases — seemingly minor decisions, overlooked allies, planted information — reveal themselves as a coordinated strategy
- **Ultimate opponent confrontation**: Not just a physical battle, but a collision of worldviews. The MC''s pragmatic ruthlessness versus the antagonist''s power (which may be built on equally dark foundations)
- **The price of victory**: The final cost is paid. What did winning actually cost? A beloved companion? The MC''s last bit of humanity? The world they were trying to save?
- **Bittersweet resolution**: The MC achieves their goal, but the victory is hollow, costly, or darkly ironic. The world hasn''t become a better place — the MC has simply become the one on top of the pile
- Event importance: 5

---

### Foreshadowing Strategy

#### Common Foreshadow Types

| Type | Description | Planting Phase | Payoff Phase |
|------|-------------|---------------|-------------|
| **Loyalty erosion hints** | Subtle signs of a companion''s dissatisfaction, hesitation, or private ambition | Initial Gambit | Critical Betrayal |
| **Power cost omens** | Physical or mental deterioration hints when the MC gains power | Power Expansion | Final Reckoning |
| **Betrayal seeds** | The MC''s early exploitation of someone plants the seeds of future retaliation | Opening Predicament | Critical Betrayal |
| **Hidden chess moves** | Seemingly inconsequential MC actions that are actually long-range strategy | Any early phase | Final Reckoning |
| **Humanity flickers** | Rare moments where the MC shows genuine emotion or mercy | Scattered throughout | Ultimate choice moment |
| **False righteousness exposure** | Clues that the "righteous" antagonist is fundamentally corrupt | Initial Gambit | Revealed during Expansion |

#### Foreshadowing Techniques Unique to Grimdark

- **Pawn perspective**: A character used by the MC tells events from their own viewpoint; readers only later realize the MC had orchestrated everything from the start. This creates a devastating "re-read" experience.
- **Delayed cost**: A power gain or victory appears free in the moment, with the price not manifesting until chapters later. Conditions readers to dread every success.
- **Mirror parallels**: Subtle similarities between MC and villain suggest that under different circumstances, they would have made identical choices. Blurs the moral line that readers want to draw.
- **Trust-betrayal cycles**: Every instance of trust-building contains the seed of the next betrayal. The pattern should accelerate — each cycle shorter than the last — building toward the critical betrayal phase.
- **Environmental echoes**: The world''s geography and atmosphere shift to reflect the MC''s moral state. Lush landscapes gradually become barren as the MC''s humanity erodes.
- **Prophecy subversion**: If the world has prophecies or fate, the MC either deliberately subverts them or fulfills them through methods no one anticipated.

---

### Common Mistakes

1. **Costless domination**: The MC is too strong and too smart, winning effortlessly — this destroys the core grimdark tension. Every victory MUST hurt. If the MC never bleeds, the reader never cares.
2. **Darkness as spectacle**: Violence and cruelty exist purely for shock value with no narrative purpose. Grimdark is not torture porn. Every act of darkness should reveal character, advance plot, or deepen theme.
3. **Expendable cardboard allies**: Characters who exist only to be sacrificed aren''t given enough development for readers to care. If the reader feels nothing when a pawn dies, the MC''s ruthlessness carries no weight.
4. **False dilemmas**: Moral choices with one obviously correct answer pretending to be agonizing decisions. True grimdark dilemmas should make the reader argue with themselves about what THEY would do.
5. **Unsignaled betrayal**: An ally betrays the MC with zero prior hints. Betrayal should feel inevitable in hindsight — re-readers should spot all the signs they missed.
6. **Happy endings that betray the genre**: A grimdark story ending with everyone alive and reconciled destroys the contract with the reader. The ending should be bittersweet at best: victory achieved, but at a cost that makes the reader question whether it was worth it.
7. **Monotonic power escalation without setbacks**: The MC climbs steadily upward with no falls. The core rhythm MUST include "fall hard, then climb higher." Without the falls, the climbs have no dramatic weight.',

  (SELECT id FROM novel_creation_method WHERE name = 'The Ruthless Protagonist Novel' LIMIT 1),
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
