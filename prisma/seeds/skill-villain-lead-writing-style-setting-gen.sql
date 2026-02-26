-- The Villainous Lead「Writing Style」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Villainous Lead' LIMIT 1)
-- 执行方式 / Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-villain-lead-writing-style-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'villain-lead-writing-style-setting-gen',
  '「Writing Style」设定生成：为反派视角（Villainous Lead）小说设定文风，包括叙事视角选择、散文风格、反派内心独白语气、英雄主义呈现方式与节奏控制',
  '"Writing Style" setting generation: define writing style for Villainous Lead novels, covering narrative POV, prose style, villain''s internal voice, heroism depiction mode, and pacing control',
  '## 「Writing Style」设定生成 — 反派视角（Villainous Lead）

反派视角的写作风格核心：**读者通过反派的眼睛看世界，而反派的眼睛是一台冷静的分析机器**。文风直接决定这个反派是令人着迷的战略家，还是普通的黑化主角。

---

### 字段生成指南

#### Narrative POV（叙事视角）

视角选择直接影响整体体验：

**第一人称反派叙事者**
最沉浸。读者直接接收反派的思维流程，感受那种高效而冷静的分析快感。挑战：叙事者的不可靠性需要通过事件展示，而非告知。反派相信的关于自己的事情和读者看到的事实之间的落差，就是故事的深度来源。

**第三人称限知**
保持一定观察距离，让读者观察反派而非完全认同。适合"暗中认为自己才是英雄"类型的反派——叙事者的距离允许对反派自我认知进行讽刺性的再框架。

**双视角（反派 + 英雄）**
这个类型最独特的优势。核心爽点：
- 英雄视角：一切看起来正常，甚至令人尊敬
- 反派视角：同一场景揭示完全不同的层次
这种对比必须让英雄显得聪明，而非愚蠢——英雄做出了给定信息下最优的决策，只是他们的信息被反派控制了。

**禁止**：全知叙事者在这个类型中几乎总是错误的选择——它消除了视角带来的信息不对称，而信息不对称正是核心爽点来源。

---

#### Prose Style（散文风格）

**锐利精准型**
短句，没有多余字。反派的语言像刀——干净、准确、不解释。每个句子只做一件事。适合谋士型、捕食者型反派。标志：即使描述暴力或残忍，语气也不变。语气的稳定本身就是一种声明。

**优雅讽刺型**
书面感强，对英雄主义的批评通过精致的用词体现。每一句吐槽都是文学级的——不是嘲笑，而是精准的解剖。适合智识型、哲学型反派。标志：读者既认同反派的分析，又隐约感到不适，这种双重感是散文风格的成功。

**冰冷超然型**
叙述者距离事件有临床般的距离感。越残忍的事情，语气越平稳——对比制造冲击。适合极端高自我意识型反派。标志：读者的情感反应比叙述者强烈，这个落差本身是主要的文学效果。

**戏剧宏大型**
反派本人带有自我意识地享受"反派"这个身份的戏剧性，同时完全掌控场面。暗示式的自嘲——他们知道自己在表演，表演是工具而非虚荣。适合享受权力展示的君主型反派。

---

#### Villain''s Voice（反派内心独白语气）

最关键的设计原则：**反派的内心独白不应该听起来像邪恶，而应该听起来像一个有更高精度思考框架的人在分析现实。**

英雄不是"可憎的"，而是"可预测的"。
对手不是"威胁"，而是"有待解决的变量"。
障碍不是"麻烦"，而是"需要投入资源的问题"。

**声音实例（内心独白）**：
> 已识别三个利用向量。仁慈利用：他在对手投降时不会补刀——这给了我至少六周的恢复窗口。荣誉利用：在证人面前发出正式挑战会显著限制他的战术选项。自我牺牲利用：对平民的威胁会可靠地转移他对主要目标的注意力。建议：依序使用以上三个。

**关键要求**：
- 对英雄的观察：分类（匹配已知类型）→ 评估（识别能力与局限）→ 威胁评级（具体而非戏剧性）→ 利用图谱（可以对抗他们的手段）
- 对事件的观察：结果分析（这发生是因为X，意味着Y将随之而来）→ 方差追踪（今天出现了三个意外变量，其中两个可以解释，一个需要监控）

---

#### Heroism Depiction Style（英雄主义呈现方式）

**讽刺式（英雄是傻瓜）**
快感直接，但持续讽刺会使英雄显得无能，从而缩小击败他们的成就感。适合短篇或喜剧性反派故事，不适合严肃长篇。

**解构式（英雄是更深层系统的受害者）**
最有深度的选择。英雄做英雄的事情做得很正确——是英雄主义系统本身在被解构：预言的设计、神明的意图、"天选之人"框架的实际受益者。英雄变得悲剧而非可笑，反派变得不只是捕食者。

**尊重式（英雄是真正值得尊重的对手）**
最难写但最有力量。如果反派真心认为英雄是值得尊重的对手，击败他们的快感才是真正的成就感。读者感受到的是两个同等优秀的人在完全不同的操作体系下竞争——这个版本产生最高的戏剧强度。

---

#### Pacing（节奏控制）

**棋局节奏**（推荐谋士型）
方法论的、缓慢但不可阻挡的进展。每一章都是棋盘上的一步移动，单独来看可能看不出大局，但每一步都在确定下一步的可能性。适合建立"计划始终在进行中"的持续感。

**快速升级节奏**（推荐力量型/暴君型）
每次对抗都升级到下一个层次，反派持续在更高难度下展示能力。适合行动导向的故事。

**避免**：以"缓慢揭示真相"为主导节奏。反派视角小说的魅力之一是读者始终比英雄知道更多。"悬念"来自"会不会有人打破反派的计划"，而非"真相是什么"。让读者长时间处于信息缺失状态会破坏这个类型的核心爽点。',
  '## "Writing Style" Setting Generation — The Villainous Lead

The writing style of the Villainous Lead is the technical foundation for the story''s primary pleasure: the reader experiences the world through a consciousness that operates at higher resolution than the heroes, the institutions, and the moral frameworks arrayed against it. Get the voice right, and every scene becomes a chess demonstration. Get it wrong, and the protagonist becomes just another dark anti-hero with attitude.

---

### Field Generation Guide

#### The Core Voice Principle

The villain protagonist''s narrative voice should not sound *evil*. It should sound *more precise*.

The difference: evil voices are about emotion — desire, contempt, rage, gloating. Precision voices are about information — pattern recognition, resource assessment, outcome modeling, variance tracking. When the villain observes the hero, they are not thinking "this fool." They are thinking: "this person has the following decision architecture, which makes them predictable under these conditions, exploitable in these ways, and dangerous in these specific circumstances."

The reader does not identify with the villain because they are evil. The reader identifies because the villain is *right* — their model of the situation is more accurate than everyone else''s. Competence, not malevolence, is the primary identification mechanism.

---

#### Narrative POV — Technical Choices

**First Person Villain Narrator:**
Most immersive. The reader receives the villain''s thought process directly — every analysis, every assessment, every decision. The pleasure is experiencing superior intelligence from the inside.

Technical requirement: the narrator''s unreliability (if any) must be shown through events, not stated. If the villain believes something false about themselves, the events should consistently contradict it while the narrator continues to believe it. The gap between what the narrator says and what the reader can see is the depth of the story.

**Third Person Limited:**
Maintains observational distance, allowing the reader to watch the villain rather than fully inhabit them. Most appropriate for "Believes They Are Secretly the Hero" type protagonists — the narrative distance allows ironic reframing of the villain''s self-perception. The narrator can show the villain''s self-deception with a kind of careful, clinical attention that first person would undermine.

**Dual POV (Villain + Hero):**
The most powerful technique specific to this genre. Structure:

In hero POV scenes: everything looks heroic, reasonable, consistent with the hero''s model of the situation. The hero is making good decisions. Their confidence is justified given their information.

In villain POV scenes: the same story elements are shown to be exactly what the villain intends them to look like. The hero''s confidence is revealed as manufactured. Their "initiative" is a response to a villain-controlled stimulus.

Critical design rule: **the hero must never seem stupid in their own POV scenes.** The pleasure of the dual POV is watching a genuinely capable, genuinely heroic person operating under a false model of reality — not watching an idiot walk into obvious traps. The hero''s misreading should be the best possible misreading given the evidence available to them.

Structural recommendation: hero POV scenes should end on notes of confidence or progress; villain POV scenes following them should reveal exactly what progress was actually made (and for whom).

**What to avoid:** Omniscient narrator. The villainous lead genre''s core pleasure is information asymmetry — the reader knows more than the hero. An omniscient narrator who knows everything including the villain''s plan removes the special intimacy of riding the villain''s perspective and gives everyone equal information. The asymmetry collapses.

---

#### Prose Style — Technical Execution

**Sharp Precision:**
Short sentences. No surplus words. The villain''s language is a tool, not a performance. Every sentence does one thing and stops. Characteristic: the same tone describes a calculation, a conversation, and a killing — the emotional register does not shift because the narrator does not emotionally respond to events the way humans typically do. This tonal consistency is itself a statement about the narrator''s nature.

Best for: Schemers, Predators, pure efficiency-coded villains.

Sample rhythm: "He expected a conversation. I had already decided the outcome. The conversation was for his benefit." (Three sentences. Three facts. No editorializing.)

**Elegant Irony:**
Formal, highly literate, slightly archaic when useful. The critique of heroism is conducted through precision of diction — each word choice is a small demonstration of how much more carefully the villain has thought about this than the hero has. The reader feels both the accuracy of the analysis and a slight unease at how beautiful the dissection is.

Best for: Intellectual villains, philosophical villains, villains who genuinely enjoy the irony of their situation.

The irony should never tip into contempt — contempt is an emotion, and this voice does not do emotions. The irony should read like someone noting an interesting structural feature of the world.

**Cold Clinical Distance:**
The narrator observes events with the affect of a researcher noting results. The more extreme the event, the more level the voice. The contrast between content and tone is the primary technique — the reader''s emotional response is more intense than the narrator''s, and this gap is the story''s main source of impact.

Best for: villains who have genuinely transcended ordinary human emotional responses, or who are performing that transcendence so consistently it has become real.

Technical note: clinical distance requires very precise word selection. Every word choice must be the neutral, technical, accurate term rather than the emotionally loaded one. "Neutralized" not "killed." "The asset''s cooperation was discontinued" not "I turned him." The euphemisms are not evasion — they are the villain''s actual internal language.

**Theatrical Command:**
The villain is self-aware about inhabiting the "villain" dramatic tradition and finds this amusing rather than embarrassing. The theatrical elements (dramatic pauses, grand gestures, the occasional perfectly-timed revelation) are not vanity — they are control mechanisms. The performance shapes how others perceive and react. Behind the theater is something considerably colder.

Best for: villains who genuinely enjoy the exercise of power, monarchs and warlords, villains who use theater as an actual weapon.

The self-awareness is the key: this villain knows they''re performing, which makes the performance a choice rather than a compulsion. The slight ironic distance from their own theatricality is what makes them interesting rather than campy.

---

#### Villain''s Voice — In Practice

What the villain''s internal observations should sound like:

**Observing an enemy:**
"Type: honor-bound champion, second generation. Capabilities: above-average combat, exceptional recovery rate, strong institutional backing. Limitations: predictable in civilian-threat scenarios, constrained by witnessed commitments, trust architecture heavily weighted toward existing allies. Threat assessment: significant but bounded. Exploit mapping: mercy window following formal defeat, honor constraint via public challenge, redirection via civilian targeting."

**Observing an unexpected event:**
"Variance from projection: 23%. Contributing factors identified: three. Two accountable for within existing models. One requiring updated modeling. Operational impact: timeline extension of approximately two weeks. Tactical adjustment: accelerate Phase 2 asset deployment to compensate."

**Observing the hero specifically:**
"He arrived on time. He always arrives on time — the preparation for his entrance is itself information about his priorities. Today''s entrance was designed for the audience he brought. He is more politically aware than last month''s assessment indicated. Updating accordingly."

The villain thinks about the hero the way a predator thinks about challenging prey: not with contempt, but with the particular focused attention of finding something genuinely difficult and therefore genuinely interesting.

---

#### Heroism Depiction — Choosing the Mode

**Satirical Mode:**
Works best in controlled doses — a scene, a chapter, a specific moment. Sustained satire of heroic characters reduces them to incompetents, which deflates the achievement of defeating them. If the hero is a fool, the villain''s victory proves nothing about the villain''s intelligence. Use satire to puncture specific heroic pretensions, not to characterize the hero wholesale.

**Deconstructive Mode:**
The richest available option. The hero is doing heroism correctly — their virtue is genuine. It''s the *system of heroism* that is being examined: who built the prophecy, who benefits from the chosen-one framework, what the "divine mandate" actually requires of its recipients and why. The hero becomes tragic rather than foolish. Their genuine virtue is being used against them by the system that created them. The villain becomes something more than a predator — they are the only honest person in the story about how the machinery actually works.

**Respectful Mode:**
Most difficult, highest payoff. The villain genuinely regards the hero as a worthy adversary — possibly even someone they would respect in different circumstances. This creates the highest-stakes version of the genre: two genuinely capable people operating from incompatible systems, where the outcome is not guaranteed by the genre''s premise. The reader cannot be certain the villain will win, because the hero is genuinely threatening. The payoff when the villain''s system prevails is the most satisfying version of the genre''s core pleasure.

---

#### Pacing — Structural Control

**Chess Clock Pacing (recommended for Schemers):**
Methodical, slow but inexorable progress. Each chapter is a move on the board. Individual moves may not reveal the larger pattern, but each move constrains future possibilities. The reader should feel, in each chapter, both the specific tactical event AND the slight, steady advance of something larger. This pacing creates the sustained "the plan is always in motion" feeling that is the Schemer''s genre signature.

**Escalation Pacing (recommended for power-type villains):**
Each confrontation escalates to the next level. The villain demonstrates capability at increasing difficulty. Faster than Chess Clock, more viscerally satisfying scene-to-scene.

**What to avoid — the Slow Revelation trap:**
This genre''s primary pleasure is that the reader always knows more than the hero. "What is the villain''s true plan?" is not the suspense question. The suspense question is "will anyone manage to disrupt the plan?" Keeping readers in the dark about the villain''s intentions for extended periods undermines the core pleasure architecture. Suspense in this genre comes from watching the trap close, not from wondering what the trap is.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Villainous Lead' LIMIT 1),
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
