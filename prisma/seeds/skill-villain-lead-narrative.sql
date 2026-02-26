-- The Villainous Lead - 叙事写作（Layer 3）
-- novel_creation_method: The Villainous Lead (Villainous Lead)
-- 执行方式 / Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-villain-lead-narrative.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'villain-lead-narrative',
  '叙事写作专项指导：为 The Villainous Lead 提供反派视角叙事美学、核心场景写法、以及如何通过文字维持智识优越感的全面写作指导',
  'Narrative writing guidance: comprehensive guidance for The Villainous Lead covering villain POV aesthetics, core scene techniques, and maintaining intellectual superiority in prose',
  '## 叙事写作 — The Villainous Lead

反派视角叙事的核心美学：**读者通过一个运作精度更高的意识体验世界**。好的反派叙事让读者感受到的不是「看，主角多坏」，而是「看，主角多准——那些被他分析得一清二楚的人，他们的局限性如此鲜明，而他们完全不自知」。

区分「令人恐惧的反派」和「令人信服的反派视角主角」的关键在于：前者靠断言建立形象（「他冷笑，知道他们都在他手中」），后者靠准确的观察和运算来展示（「他还有三秒，之后他的动量就会把他带过那个可以转身的点」）。

---

### 反派分析声音的建立

**断言 vs. 展示**

错误写法：「我看着这个傻瓜落入了我的陷阱，嘴角微微上扬。」（通过内心炫耀断言优越性）

正确写法：「他在做英雄发现反派弱点时会做的事：快速移动，大声移动，全力投入。三秒后，他的动量会把他带过那个后退比前进更快的点。」（通过准确预测对方的行为展示优越性）

测试每一段反派视角文字的标准：这段文字是在展示反派理解了别人不理解的东西，还是只是在断言他们更厉害？断言是空洞的，展示创造类型快感。

**分析密度的控制**

反派的内心独白应该是密集的，但不能是喋喋不休的。参考密度原则：当反派在执行某个行动时，描述行动本身的文字应该简洁（反派不废话），描述内心分析层的文字可以更丰富——但两者都应该是「精准的」而非「大量的」。

好的反派叙事读起来像一个高度专注的人的内心：没有废话，每个细节都被快速评估和赋予意义，然后处理完毕，继续前进。

---

### 五种核心场景写法

**一、计划执行场景**

结构：简洁的行动描写 + 密集的分析性内心独白。

行动描写用平静、精准的语调——没有激动，没有戏剧感，只有执行。内心独白提前若干步思考：当反派在做 A 的时候，内心已经在算 B 和 C 的连锁反应，以及这个步骤对更长远目标的贡献。

节奏示例：「我在早上的信使出发前把信送出去了。它会和一份假情报同时到达——那份假情报会通过将军的助手收到，而那位助手相信他的『可靠线人』。两份相互独立的确认。下午，将军会向错误的方向投入兵力。」行动一句，推演三句——分析重量大于行动重量。

**二、与英雄直接对抗场景**

最关键的场景类型，也是最容易写坏的场景类型。

反派不能「等」英雄出招——即便在身体上处于防守，在战略上也始终在进攻。

当英雄在发表正义宣言时，反派的内心在做什么：分析宣言的逻辑结构、提取信息（英雄的情绪状态、知道多少、注意力在哪里）、评估宣言对观众的效果，以及计算这个时刻之后对方会做什么。

英雄的最强时刻（发现线索、发表宣言、发动攻击）从反派视角看时，应该显示出一个附加层次：英雄不知道的东西，英雄以为的和实际情况的差距，以及这个「强」在反派眼里意味着什么。

**三、伪装/渗透场景**

同时运行两条叙事轨道：
- 表层轨道：反派作为另一个身份在做和说的事（对话和行动，用外在的第三人称质感书写，即便是第一人称叙事）
- 内层轨道：反派真实的观察、评估、信息收集（用紧凑的内心独白）

读者同时接收两层信息，而场景里的其他角色只能看到一层。这是这个类型信息不对称快感最高度集中的场景类型。

写法要点：两条轨道的切换不能太频繁（会变成碎片化的跳来跳去），也不能太少（内层轨道消失就失去了类型核心快感）。找到节奏：几句表层行为，一段内层分析，几句表层行为，一段内层分析。

**四、计划失控场景**

最考验作者能力的场景类型。反派面临真正的意外时，文字节奏的要求：快速但不慌乱，像一台高速运转但从不过热的机器。

内心独白的参考结构：「新变量。[命名]。后果范围：[X到Y]。我对这个场景的预先概率估计是0.2。现有准备：[具体列举]。充足。需要调整：[具体调整内容]。新预计完成时间：[条件]。代价：可接受。」

这不是冷酷为了冷酷——这是一个为这类突发事件做过充分准备的人正在执行预案的反应。效率本身就是角色性格的体现。绝对不要让反派出现慌乱、犹豫或失控——这个时刻的准确和快速是类型承诺的一部分。

**五、终局揭示场景**

节奏应该比全书其余部分更慢——这是少数反派可以让自己「精确」而非「隐藏」的时刻。

但揭示不应该是独白。最有力量的揭示：让英雄自己拼凑出真相的大部分，反派只需确认。这承认了英雄最终配得上看穿计划，使反派的胜利有意义而非廉价。第二强的揭示：反派做出一个观察，这个观察重构了读者对前面所有事件的理解，而不需要解释重构。读者自己完成工作。

绝对避免：反派洋洋洒洒地向无法阻止的对手解释自己的完整计划。如果反派想这样做，应该有一个自我意识的内心节拍，注意到这个冲动然后驳回它——「但我不说多余的话」。

---

### 关键禁区

**反派独白（类型原罪）**：向无法阻止的人解释完整计划，是这个类型的最严重错误，也是类型本身的自嘲对象。反派主角明白这个陷阱并主动避免它。

**无依据的蔑视**：在没有展示理由的情况下蔑视角色（尤其是英雄）。每一次蔑视之前或之后都应该有对应能力局限的具体展示。「他会心慈手软」是一个准确的观察，如果反派已经看到过证据的话——但如果只是「他是个蠢货」而没有展示，那是反派的意见，叙事不应该直接背书。

**未兑现的胜利**：反派赢，因为叙事需要他赢，而不是因为他的准备和智识使胜利成为必然。每一次重大胜利都应该可以被追溯到此前的具体准备工作。如果读者找不到铺垫，胜利感觉像作者干预而非角色成就。',

  '## Narrative Writing — The Villainous Lead

The Villainous Lead narrative craft centers on a single principle: the reader experiences the world through a consciousness operating at higher resolution. The villain doesn''t see more things than the hero — they see the same things more accurately. Every scene should reinforce this difference not through telling ("the villain was smarter") but through showing — giving the reader access to the analytical layer beneath the villain''s surface behavior.

The distinction that separates effective Villainous Lead prose from common failure modes: menacing versus accurate. Menacing is easy to write and produces flat prose. Accurate is harder and produces the genre''s distinctive satisfaction.

Menacing: "I watched the fool stumble into my trap, and I smiled." (Superiority stated, not demonstrated.)

Accurate: "He was doing what heroes do when they think they''ve found the villain''s weakness: moving fast, moving loud, committing fully. In three seconds, his momentum would carry him past the point where retreat was the faster option." (Superiority demonstrated through operational prediction.)

---

### I. The Villain''s Analytical Voice

**The Demonstration Principle**

Test for every paragraph of villain-POV prose: does this show the villain understanding something that the hero and other characters don''t, or does it simply assert that they''re superior?

Assertions are empty. Demonstrations create the genre.

The demonstration can take multiple forms: accurate prediction of another character''s behavior before it happens; noticing a detail that other characters missed and drawing a correct inference from it; understanding the structural reason a situation will develop in a particular direction when others only see the surface; processing emotional signals (the hero''s passion, the ally''s hesitation, the enemy''s fear) as information rather than noise.

What demonstration never looks like: internal monologue that amounts to "I am so much smarter than everyone here." This is the villain telling the reader what to think about the villain. The villain''s analytical voice should be directed outward — toward the environment, toward other characters, toward the situation''s structure — not inward toward self-congratulation.

**Analytical Density Management**

The villain''s internal monologue should be dense but not verbose. Reference principle: action description should be brief (no wasted motion, no emotional ornamentation), analytical monologue can be slightly more elaborate — but both should be precise rather than plentiful.

Effective villain prose reads like the interior of a highly focused person: no noise, every detail rapidly assessed and assigned a value, then processed and filed. The analytical voice has momentum — it doesn''t linger on information after it''s been processed, it moves to the next calculation.

Contrast: a hero-POV character might process information emotionally before analytically. A villain protagonist in this genre processes analytically first, or exclusively. Emotional responses, if they appear, are brief, quickly integrated into the analytical framework, and the character moves on.

---

### II. Five Core Scene Types

**Plan Execution Scenes**

Structure: clean action description + dense analytical internal monologue.

Action description: written in a calm, precise register. No excitement, no dramatic staging, just execution. The action is doing what was planned. The prose reflects this: economical, specific, without emotional coloring.

Internal monologue: already ahead of the current action. While executing A, the villain is calculating the chain consequences of B and C, and the contribution of this step to longer-range objectives. The calculation isn''t performed in the moment — it''s already been performed; the villain is now confirming that the situation matches the prediction.

Rhythm example: "I sent the letter by the morning courier. It would arrive simultaneously with the false intelligence the general''s aide would receive from his ''trusted informant.'' Two independent confirmations of the same story. By afternoon, the general would commit forces to the wrong position." Action: one sentence. Projection: three sentences. Analytical weight exceeds action weight.

**Confrontation with the Hero**

The highest-stakes scene type and the most commonly failed.

The villain must never be waiting for the hero to act — even when physically defensive, always strategically offensive. Waiting is reactive. Reactive is not the villain''s mode.

When the hero is delivering their righteous declaration or making their best move: what is the villain''s internal process? Analyzing the logical structure of the declaration. Extracting information (the hero''s emotional state, their current knowledge level, where their attention is). Assessing the declaration''s effect on any present audience. Calculating what the hero will do in the next thirty seconds based on this pattern.

The hero''s strongest moment — finding the clue, making the declaration, launching the attack — should reveal an additional layer when seen from the villain''s perspective: what the hero doesn''t know, the gap between what the hero believes is true and what is actually true, and what this display of strength means to the villain analytically rather than theatrically.

Structural principle: the hero is performing at their best. The villain''s advantage is structural (better information, better preparation, willingness to act without constraint) rather than individual (they hit harder, they''re faster). Individual superiority is boring — it means the conflict was predetermined by power levels. Structural superiority is interesting — it means the conflict was predetermined by planning, and the hero''s best genuine effort still wasn''t enough because the architecture was wrong before the fight began.

**Infiltration/Disguise Scenes**

Run two simultaneous narrative tracks:
- Surface track: what the villain says and does as their cover identity — dialogue, described action, written with slight external-observer quality even in first person
- Internal track: what the villain is actually observing, assessing, and recording — tight internal monologue

The reader receives both layers simultaneously. The other characters in the scene receive only the surface layer. This is the genre''s highest-concentration payoff: the absolute information asymmetry between what the people in the scene think is happening and what the reader knows is happening.

Pacing principle: the two tracks shouldn''t switch too rapidly (fragmented) or too infrequently (internal track disappears, genre core pleasure disappears). Find the rhythm: several sentences of surface behavior, a paragraph of internal assessment, several sentences of surface behavior, a paragraph of internal assessment. The rhythm should feel natural, not mechanical.

**Plan Disruption Scenes**

The moment the plan encounters genuine surprise. The prose challenge: show rapid recomputation without panic.

Rhythm model for the internal response: "Unexpected variable. [Named variable]. Consequence range: [X to Y]. I had assigned this scenario a probability of 0.2. Preparation in place: [specific list]. Sufficient. Adjustment required: [specific]. New projected completion: [condition]. Cost: acceptable." Then the villain acts on the adjusted plan.

This is not cold for the sake of being cold. This is the professional response of someone who has prepared for exactly this type of disruption and is now executing their prepared response. The efficiency IS the character. The speed of recovery demonstrates that the villain''s competence isn''t a function of favorable circumstances — they prepared for unfavorable circumstances too.

What to avoid: any sign of panic, hesitation, or genuine uncertainty about whether the operation will succeed. The villain may need more time, may need to accept higher costs, may need to sacrifice a prepared element — but they always know what the adjusted plan is and they execute it without emotional reaction to the setback.

**The Final Reveal Scene**

Prose tempo: slower than the rest of the book. The villain is allowing themselves a precision moment — they are being exact rather than concealed. But this is rare, and the restraint should be visible: the villain isn''t savoring, they''re confirming.

Design hierarchy for reveal effectiveness:
1. The hero arrives at the correct conclusion through their own intelligence, and the villain confirms rather than reveals — the strongest version. It acknowledges the hero was worthy of eventually understanding, making the villain''s victory meaningful rather than the product of facing an incompetent opponent.
2. The villain makes a single observation that restructures the reader''s understanding of all preceding events without explaining the restructuring — the reader does the reconstruction work. This is the most elegant form.
3. The villain reveals the plan directly but through implication rather than enumeration — each statement opens a new perspective on a previous event, and the reader''s mind does the connecting.
4. The villain explains the complete plan in sequence to a captive audience — the worst version. This is the genre''s cardinal sin, and the Villainous Lead''s villain protagonist knows it and avoids it.

If the villain protagonist notices the impulse toward a full explanation, include a self-aware beat: they recognize the impulse, note that it''s the kind of thing their type of person does, and dismiss it. "But I don''t say unnecessary things." Then they act.

---

### III. What Not to Do

**The Villain Monologue:** Explaining the complete plan to someone who cannot stop it. The genre knows this is the villain''s cardinal sin. The Villainous Lead protagonist explicitly avoids it. If it appears, the narrative should be aware that this character would find it objectionable in themselves.

**Contempt Without Evidence:** Dismissing any character — especially the hero — without prior demonstration of the specific limitation being dismissed. "He would be merciful" is an accurate observation if the villain has seen evidence of this mercy. "He was a fool" without demonstration is the villain''s assertion, which the narrative endorses if unchallenged. The villain''s assessments should be demonstrably correct, not axiomatically accepted.

**Unearned Victory:** The villain wins because the narrative required it. Every significant villain victory should be traceable to specific earlier preparation. If the reader cannot identify the groundwork, the victory reads as authorial intervention rather than character achievement. The distinction matters: authorial intervention makes the villain a plot function; character achievement makes the villain a person with a mind.

**The Invincible Villain Syndrome:** The villain never faces genuine difficulty, their plans never require real adaptation, every outcome was anticipated. This is the mirror failure of "unearned victory" — it removes the interesting question of whether the villain''s competence is sufficient to handle genuinely difficult circumstances. The villain should face real pressure. Their adaptation to real pressure is where the characterization lives.',

  (SELECT id FROM novel_creation_method WHERE name = 'The Villainous Lead' LIMIT 1),
  1,
  100,
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
