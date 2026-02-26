-- The Villainous Lead「Character」角色生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Villainous Lead' LIMIT 1)
-- 执行方式 / Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-villain-lead-character-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'villain-lead-character-gen',
  '「Character」角色生成：为反派视角（Villainous Lead）小说生成角色设定，涵盖反派主角、英雄目标、忠诚下属、野心下属及不知情棋子的战略分析视角',
  '"Character" generation: generate character profiles for Villainous Lead novels, covering villain protagonist, hero target, loyal subordinate, ambitious underling, and unwitting pawn from a strategic analysis perspective',
  '## 「Character」角色生成 — 反派视角（Villainous Lead）

反派视角的角色设计有独特的逻辑：**每个角色首先是一个「变量」**——反派主角看待世界上所有人的方式，都是先分析「他们的行为模式」「他们的可利用弱点」「他们对计划的威胁或价值」。

---

### 角色类型设计要点

#### Villain Protagonist（反派主角）

反派主角的角色卡记录能力、动机和当前状态。最重要的设计原则：**反派主角的「弱点」必须是真实的、可被利用的**。

无懈可击的反派是叙事毒药——英雄永远无法威胁他，读者就不会紧张；英雄从不逼近胜利，反派的计划就没有张力。有效的反派弱点来自结构，而非道德：
- 对特定结果的执念（使他的行为变得可预测）
- 信息网络的盲区（总有他不知道的角落）
- 能力需要特定条件才能发挥
- 有一段关系没有被完全工具化——这个人的行为偶尔让反派感到意外

---

#### The Hero / Primary Target（英雄/主要目标）

英雄的设计必须认真。**英雄必须足够强大和正义，以至于读者理解为什么整个系统都在支持他们**。弱英雄使反派的胜利显得廉价；被系统性操控的强英雄才是最高张力来源。

设计原则：
- 英雄应该是真诚的——不是天真，不是虚伪，而是真心信仰自己的价值观
- 英雄的价值观应该有足够的内在一致性，使反派可以可靠地从价值观预测行为
- 英雄必须在某些交锋中获胜——从不接近胜利的英雄制造不了紧张感

**「可利用弱点」是最关键字段**，必须具体且来源于英雄的美德：
- 仁慈的英雄会放走投降的敌人（计划好的战术失败可以转化为生存）
- 荣誉的英雄会接受公平决斗挑战（可以用规则锁定他）
- 自我牺牲的英雄在有人质时会放弃战略优势（无辜者是永久有效的工具）
- 信任的英雄会被他珍视的关系所利用

---

#### Loyal Subordinate（忠诚下属）

反派的可靠执行工具。设计核心：**为什么他们忠诚？** 不同的忠诚基础有不同的断裂点：
- 真心信仰反派哲学 → 在哲学被证伪时动摇
- 利益绑定 → 在更大利益出现时动摇
- 无处可去 → 在出路出现时动摇

最有趣的忠诚下属有自己的视角，偶尔对计划提出质疑——不是背叛，而是真正的智识输入。反派如何对待内部异议，暴露了他的管理智慧。

---

#### Ambitious Underling（有野心的下属）

可能背叛的变量。反派通常雇用有野心的人，因为他们能力更强——同时准备好处理他们的背叛。这个角色的存在意义：测试反派的管理能力，提供内部威胁来源，使反派的组织真实而非卡纸板。

设计要点：野心下属的忠诚是效用计算，而非信仰。他们忠诚，直到背叛的收益超过忠诚的收益。反派的工作是让这个计算长期对忠诚有利。

---

#### Unwitting Pawn（不知情的棋子）

不知道自己在为反派服务的角色——可以是英雄阵营的信息源、行动工具，或被操控的对象。

设计最关键点：**棋子必须足够立体，读者才会在他被利用时感受到重量**。给棋子完整的生活、真诚的信念、读者在乎的关系，然后展示反派的计划如何通过他们的自主选择运作——棋子的悲剧在于，他们所有的决定都是真实的，结果却是别人安排的。

---

#### Current Awareness Level（当前认知水平）——动态字段

这个角色对反派真实计划的了解程度。精确追踪，而非笼统百分比：

「相信反派是有犯罪背景的政治对手；不怀疑在[特定事件]中的操盘作用；已经注意到X模式但尚未与反派关联」

这个字段决定了每个角色在当前阶段能做什么、不能做什么，是信息不对称的核心追踪工具。

---

### 生成原则

- 反派主角的弱点必须是真实的、结构性的，而非象征性的
- 英雄必须认真设计——强英雄被系统性操控，才是反派魅力的最佳证明
- 棋子需要足够立体，被利用时才有戏剧重量
- Current Awareness Level 用定性描述而非数字，确保精确追踪信息不对称',
  '## "Character" Generation — The Villainous Lead

In the Villainous Lead, every character is primarily an information problem: what does this person want, what do they know, how reliably will they behave under pressure, and what can they be made to do or not do? The villain protagonist maintains this analytical framework as a baseline for every relationship. This is not sociopathy — it is strategic clarity. The reader shares this perspective, and through it experiences the story''s core pleasure: knowing more than the heroes do.

---

### Role Design Deep Analysis

#### Villain Protagonist

The protagonist needs genuine vulnerabilities to function as a character rather than a power fantasy. Effective villain weaknesses are structural, not moral:

- **Investment in specific outcomes**: creates exploitable predictability. The villain who needs event X to happen by date Y is operating on a deadline — and deadlines can be manipulated.
- **Information network gaps**: there are always areas where the villain''s intelligence is incomplete. Design these gaps deliberately and allow them to produce genuine surprises.
- **Conditional capabilities**: abilities that require specific circumstances to function — resources, allies, locations, timing windows — create operational constraints.
- **One uncontrolled relationship**: the most interesting type for long-form stories. The one person the villain has not fully categorized — whose behavior occasionally surprises them. This character becomes the source of the villain''s most interesting decision points.

The villain who never faces genuine threat produces no tension. The villain who faces genuine threat and overcomes it through intelligence produces satisfaction. Design the protagonist''s vulnerabilities to enable the second scenario repeatedly.

---

#### The Hero (Primary Target)

This is the design challenge that defines the entire story''s quality. A weak hero makes the villain''s victory feel cheap. A strong hero who is nonetheless systematically outmaneuvered creates the story''s maximum satisfaction.

Design principles for a hero worth outmaneuvering:
- The hero should be **genuinely good** — not naive, not hypocritical, but authentically committed to their values. Genuine goodness is more interesting to exploit than fake goodness.
- The hero''s values should be **internally consistent** enough that the villain can reliably predict behavior from them. The more coherent the hero''s moral code, the more useful it is as a prediction engine.
- The hero''s divine protection / destined status should be **real and significant** while having **specific operational blind spots**. The hero''s advantages make the game difficult; the blind spots make it winnable.
- The hero **must win some engagements** — a hero who never comes close to winning creates no tension. The hero should be making the best possible decisions given their information. Their information is just controlled.

**The Exploitable Weaknesses field is the architectural core.** Do not write "the hero is overconfident." Write: "The hero will not pursue a retreating enemy who invokes surrender — which means a planned tactical defeat can always be converted to survival and regrouping." The weakness must be operationalizable: given this weakness, what specific action does the villain take?

The virtue-to-exploit mapping:
- Mercy → enemies who surrender survive to fight again; the villain can always manufacture a "surrender" to exit losing engagements
- Honor → the hero can be legally constrained by the same rules the villain ignores; challenge to honorable combat removes the hero''s contextual advantages
- Self-sacrifice → innocent victims are permanent leverage; the hero''s protective instinct creates reliable behavioral predictions
- Trust → the hero''s allies are potential backdoors; every close relationship is an attack surface

---

#### Loyal Subordinate

The quality of the villain''s organization reveals their intelligence. A villain with only fearful subordinates is brittle — fear loyalty breaks under sufficient external pressure. A villain who has built actual loyalty (through demonstrated effectiveness, shared philosophy, or reciprocal care) has a more durable organization.

Loyalty basis determines fracture conditions:
- Genuine philosophical alignment → fractures when the philosophy is demonstrably falsified
- Interest binding → fractures when a more advantageous offer appears
- No viable alternative → fractures when an exit becomes available

The most interesting loyal subordinates have genuine perspectives that occasionally push back on the villain''s plans — not as betrayal signals, but as authentic intellectual input. How the villain handles internal dissent reveals whether their intelligence is real or performative. A villain who can only tolerate agreement is operationally fragile.

---

#### Unwitting Pawn

The most purely villainous role in the cast, but also the one requiring the most careful handling. Cold manipulation of cardboard figures has no dramatic impact. The pawn must be sympathetic enough that the reader feels something when they are used.

Design the pawn with a full life: genuine beliefs they act on, relationships the reader comes to care about, a perspective that is internally coherent and even admirable in context. Then show the villain''s plan operating through their choices — choices that are genuinely the pawn''s own, made for their own reasons, producing outcomes the villain anticipated. The pawn''s tragedy is not that they were stupid or weak. It is that all their decisions were real, and the results were arranged.

This combination — clever villain satisfaction plus genuine discomfort at watching an unknowing person be used — is uniquely available to the Villainous Lead genre. Handle it with precision.

---

#### Current Awareness Level (Dynamic Field)

Track qualitatively, not quantitatively. Not "30% awareness" but: "Believes the villain is a political rival with criminal connections; does not suspect the villain''s operational role in [specific event]; has begun noticing pattern X but has not connected it to the villain; has no suspicion that their primary intelligence source is compromised."

This precision allows for tightly plotted information reveals — the reader can track exactly what each character knows, creating dramatic irony that operates at maximum effect. The moment when a character''s awareness crosses from "suspects" to "knows" should be designed as a scene, not a background fact.

---

### Generation Principles

- Villain protagonist vulnerabilities must be structural and genuine — not decorative
- The hero must be worth outmaneuvering: strong, principled, with real advantages and specific blind spots
- Subordinate loyalty types must be designed with their fracture conditions in mind
- The pawn requires full characterization to generate dramatic weight when used
- Current Awareness Level uses precise qualitative description to enable maximum information asymmetry tracking',
  (SELECT id FROM novel_creation_method WHERE name = 'The Villainous Lead' LIMIT 1),
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
