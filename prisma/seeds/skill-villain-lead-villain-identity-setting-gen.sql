-- The Villainous Lead「Villain Identity」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Villainous Lead' LIMIT 1)
-- 执行方式 / Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-villain-lead-villain-identity-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'villain-lead-villain-identity-setting-gen',
  '「Villain Identity」设定生成：为反派视角（Villainous Lead）小说生成反派身份核心设定，包括原型类型、自我认知等级、哲学体系、作恶准则与标志性风格',
  '"Villain Identity" setting generation: generate core villain identity settings for Villainous Lead novels, covering archetype, self-awareness level, philosophy, code of villainy, and signature style',
  '## 「Villain Identity」设定生成 — 反派视角（Villainous Lead）

Villain Identity 是反派视角小说的核心支柱——主角**主动选择并拥抱自己的反派身份**。这不是创伤反应，不是被迫无奈，而是经过深思熟虑的选择或清醒的认知。这种自我意识是反派对英雄的结构性优势来源。

---

### 字段生成指南

#### Villain Archetype（反派原型）

反派原型决定主角的核心运作方式和权力来源：

| 原型 | 核心能力 | 最大优势 | 设计难点 |
|-----|---------|---------|---------|
| **谋士型（Schemer）** | 多层计划、信息控制 | 计划在失败时推进另一层 | 智力必须通过具体预判展示，不能靠"突然发现计划早有安排"取巧 |
| **暴君型（Tyrant）** | 压倒性力量、建立秩序 | 将混乱本身变为工具 | 避免变成单纯的"强者"，需要展示秩序建立的逻辑 |
| **堕化者型（Corruptor）** | 理解并利用人性弱点 | 把英雄的美德变成武器对英雄自己 | 腐化过程必须对被腐化者自己看来完全合理 |
| **竞争者型（Rival）** | 与英雄旗鼓相当的能力 | 展示为何同等力量下反派胜出 | 保持双方真实威胁感，反派的胜出靠智慧非蛮力 |
| **篡位者型（Usurper）** | 颠覆现有权力结构 | "我会做得更好"的真实可信度 | 需要展示反派确实有更好的替代方案 |
| **虚无主义者（Nihilist）** | 识破所有系统为骗局 | 不受任何意识形态束缚 | 避免变成纯粹的破坏——虚无主义反派需要有他们守护的东西 |
| **革命者型（Revolutionary）** | 真正的改变意愿 | 道德复杂性最高 | 手段与目的之间的张力必须始终存在，不能轻易化解 |

---

#### Self-Awareness Level（自我认知等级）

这是整个 Villain Identity 最关键的字段，直接决定故事的核心魅力：

**完全拥抱反派标签（Fully Embraces the Villain Label）**
效率最高的反派类型。他们不自欺，不辩护，直接行动。内心独白读起来像战略家的作战笔记，而非道德剧。
- 优势：最高的初始冲击力，读者认同通过能力和哲学一致性建立
- 风险：需要精心处理，让读者理解逻辑的同时保持对伦理的清醒认知

**因必要而为反派（Villain by Necessity）**
已被推过英雄式方法仍然可行的临界点。仍有道德框架，但接受了当前任务需要暂停该框架。
- 优势：最高的读者共情度，对普通读者最易接受
- 风险：易被读到为"被误解的英雄"，必须有足够多的真正反派选择来平衡

**暗中认为自己才是英雄（Believes They Are Secretly the Hero）**
最危险的类型——自我欺骗使其行为不可预测。英雄式自我形象有时会凌驾于实际利益之上，形成引人入胜的内部矛盾。
- 优势：最适合长篇故事，叙事者需要保持稳定的讽刺距离
- 风险：读者可能真的相信他们是英雄，必须通过事件揭示其自欺程度

---

#### Villain Philosophy（反派哲学）

**应避免的空洞哲学**：
- 泛泛的虚无主义（"一切都没有意义"）
- 泛泛的社会达尔文主义（"力量就是一切"）
- 泛泛的仇恨（"我被伤害过，所以现在作恶"）

**有效哲学的特征**——必须是对英雄主义系统的具体批判：
- **针对机制**："天选之人神话的存在，是为了将宇宙资源集中在一个神明可以控制的人身上。我不是在攻击英雄，我在攻击神明的版权体系。"
- **替代伦理**："我杀一人救百人。英雄为救一人牺牲自己，然后叫做道德。谁在认真数尸体？"
- **揭示被回避的真相**："我造成的''恶''是可见的。英雄系统造成的''善''，要求人们不去检查他们''拯救''的村庄在他们离开后发生了什么。"

---

#### Code of Villainy（作恶准则）

定义反派的边界，同时定义故事的底线。三个核心问题：
1. 他们坚持什么原则（如果有）？
2. 这些原则的存在是为了保护自己的效率，还是确实有他们真正守护的东西？
3. 有什么事是他们绝对不会做的，以及为什么？

**警告**：作恶准则不等于隐藏的善良。反派可以有准则完全出于战略原因（不杀无辜是因为制造不必要的敌人效率低下，而非因为在乎无辜者）。

---

#### Signature Style（标志性风格）

区分这个反派与所有其他反派的作恶美学：
- **冰冷精准型**：先补刀后说话，动作永远先于解释
- **权谋碾压型**：让对手的力量为自己所用，用对方的系统对付对方
- **彻底颠覆型**：完全颠覆对手的价值观框架，使其根本无法在原有参照系内理解发生了什么
- **优雅超然型**：带有自我意识地享受"反派"这个身份的戏剧性，完全掌控场面感',
  '## "Villain Identity" Setting Generation — The Villainous Lead

Villain Identity is the foundation of the Villainous Lead story. The protagonist''s specific self-aware villainy determines everything else: their voice, their methods, their relationship to the hero, and the type of satisfaction the story delivers.

The defining characteristic of the Villainous Lead protagonist: **explicit identity ownership**. They have looked at the label "villain" and either accepted it as accurate or actively chosen it as a useful designation. This self-awareness is what gives them their structural advantage over heroes still operating from the mythology.

---

### Field Generation Guide

#### Villain Archetype — Deep Design

**The Schemer:**
Power source: plans within plans within plans. The Schemer''s threat must be established through demonstrated intelligence, not through retroactive revelation ("I planned this all along"). Key design requirement: the Schemer''s plans must survive at least one significant unexpected complication — their genius is shown in contingencies, not in perfect execution. Best Schemers don''t just plan for failure; they plan to *use* failure as a tool. Reference models: Light Yagami (Death Note), Tyrion Lannister in his prime, Meruem''s political intelligence (HxH). Avoid: Schemers whose plans only work because other characters become suddenly stupid.

**The Tyrant:**
Power source: overwhelming force that establishes a particular kind of order. The Tyrant''s narrative interest comes not from "how powerful are they" but from "what order are they building and why." The most compelling Tyrants are building something — their empire, their system, their vision of how the world should work. The hero is not just their enemy; the hero is a representative of the disorder the Tyrant is trying to eliminate. Avoid: Tyrants who just want power for power''s sake (this is not a philosophy, it''s an absence of one).

**The Corruptor:**
Power source: deep understanding of human psychology and the ability to redirect it. The Corruptor doesn''t defeat heroes by overpowering them — they turn heroes'' own strengths into liabilities. Their corruption must always seem justified from the victim''s perspective; no one realizes they''re being corrupted until it''s too late. This is the archetype most directly suited to the "weaponizing heroism" theme. Key design: the hero should remain genuinely heroic while being genuinely exploited. The tragedy is real, not just surface irony.

**The Rival:**
Power source: comparable or equal ability to the hero. The Rival''s story is not "how the hero loses" but "why the villain''s approach wins even when raw power is comparable." Narrative function: provides the most direct test of the thesis that the villain''s operating model is superior to the hero''s. Design challenge: maintain genuine threat from both sides. The Rival must never seem obviously superior — that would make the hero seem incompetent.

**The Usurper:**
Power source: the argument "I would do this better." The Usurper''s narrative interest depends entirely on whether this argument is credible. If the current power structure is genuinely corrupt or incompetent, the Usurper becomes a revolutionary. If it is not, the Usurper is just ambitious. The most interesting Usurpers are correct about the problems and wrong about whether they themselves are the solution.

**The Revolutionary:**
The most morally complex archetype in this genre. They may genuinely have a point. The system they want to destroy may genuinely be corrupt. The story''s job is NOT to resolve this cleanly. The Revolutionary should never become simply right or simply wrong — they should remain genuinely challenging to the reader''s moral framework throughout.

---

#### Self-Awareness Level — Narrative Function

**"Fully Embraces the Villain Label":**
The most efficient villain. Zero energy wasted on self-justification or self-deception. Their internal monologue reads like a strategist''s operational notes: target assessed, method selected, execution initiated. They do not filter their choices through moral acceptability — they filter them through effectiveness.

Voice sample: "Three exploits identified. Mercy exploit: he will not execute me when I surrender. This gives me a recovery window of approximately six weeks minimum. Honor exploit: formal challenge in front of witnesses constrains his tactical options significantly. Self-sacrifice exploit: placing civilians in danger will reliably redirect his attention from the primary objective. Recommend: use all three in sequence."

Building reader alignment: the reader doesn''t identify with this character because they are evil. The reader identifies because they are *right*. Their analysis is accurate. Their predictions prove correct. The pleasure is watching superior intelligence operate in an environment that cannot perceive its own exploitation.

**"Villain by Necessity":**
Has been pushed past the point where heroic methods remain viable. Still maintains a moral framework — they know what they''re doing crosses lines they would not have crossed before. The most important design question: what happened that pushed them past this threshold, and is that event proportionate to the methods they are now using?

The risk: this archetype is most susceptible to being read as a "misunderstood hero" (the character is actually good, just in bad circumstances). To prevent this, ensure the character makes at least two to three choices that cannot be explained by necessity — choices that reveal they have genuinely changed, not just adapted.

**"Believes They Are Secretly the Hero":**
The most psychologically complex and the most dangerous to write. This character''s self-deception creates genuine unpredictability — they will sometimes act against their own stated interests because their internal heroic self-image demands it. This is fascinating because it makes the character simultaneously smarter than everyone else (in tactical analysis) and deeply self-deceived (about their own motivations).

Narrative requirement: the narrator must maintain consistent ironic distance. The reader must be able to see the gap between what the character believes about themselves and what the evidence shows — and this gap must be demonstrated through events, not just asserted.

---

#### Villain Philosophy — What Works and What Doesn''t

**Avoid:** Generic nihilism ("nothing matters"), generic social Darwinism ("strength is everything"), generic grievance ("I was wronged so now I''m evil"). These are emotional states, not philosophies. They explain nothing and predict nothing.

**What works — a specific critique of a specific mechanism:**
- "The Chosen One mythology exists to concentrate cosmic resources in one person the gods control. I''m not attacking the hero. I''m attacking divine copyright."
- "I count bodies. Heroes count their own moral consistency. Our accounting systems are incompatible, and mine produces fewer bodies."
- "The ''evil'' I do is visible and attributed to me. The ''good'' the hero system does requires not examining what happens to the villages after the heroes leave."
- "Heroism is a performance requirement the institutions use to prevent the powerful from acting in their own interest. I simply stopped performing."

A villain philosophy is effective when: it could convince a reasonable person under the right circumstances, it contains a genuine insight about how power actually operates, and it cannot be dismissed with a single heroic speech.

---

#### Code of Villainy — Strategic vs. Moral Limits

A villain''s code exists on a spectrum:

**Pure efficiency code (no moral content):** "I don''t kill people who have no tactical relevance — not because I care about them, but because creating unnecessary enemies is operationally wasteful." This is internally consistent and genuinely villainous. It can look like mercy from the outside while being completely calculated.

**Mixed code (efficiency + genuine limits):** Some limits exist for strategic reasons; one or two exist because the villain has something they actually protect. The "something they protect" should be specific and somewhat surprising — not "family" in the abstract but a particular person, a specific principle, a concrete thing they built.

**Inverted heroic code:** The villain has exactly the same values as the hero, but has concluded that the heroic implementation of those values is counterproductive. They pursue the same goods through methods the hero''s code forbids.

---

#### Signature Style — The Aesthetic of Their Villainy

The villain''s style is not just how they fight — it is how they move through the world, how they communicate, how they make their opponents feel.

**Cold Precision:** No wasted motion, no unnecessary speech. Every action is the minimum required. The most terrifying version: they are courteous, calm, and completely deadly — the contrast is the weapon.

**Strategic Domination:** They use the enemy''s own power against the enemy. Systems, institutions, the hero''s allies — everything becomes material. They don''t fight the world''s structure; they repurpose it.

**Complete Inversion:** They don''t just defeat the hero''s plans; they make the hero''s heroism itself into the mechanism of the hero''s defeat. The most satisfying version of this archetype for readers who came for deconstruction.

**Theatrical Mastery:** Self-aware, slightly self-mocking enjoyment of the "villain" theatrical tradition — while being completely lethal underneath the performance. The performance is not vanity; it is a control mechanism.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Villainous Lead' LIMIT 1),
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
