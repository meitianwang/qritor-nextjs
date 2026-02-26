-- The Protagonist Hunter「Writing Style」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Protagonist Hunter' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-protag-hunter-writing-style-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'protag-hunter-writing-style-setting-gen',
  '「Writing Style」设定生成：为 The Protagonist Hunter 生成叙事风格设定，包括 meta-awareness 的表达方式、叙述语气类型、以及如何在不破坏叙事的前提下展现主角的预知',
  '"Writing Style" setting generation: generate writing style settings for The Protagonist Hunter, including meta-awareness expression modes, narrative tone types, and how to convey the protagonist''s foreknowledge without breaking narrative immersion',
  '## 「Writing Style」设定生成 — The Protagonist Hunter

「Writing Style」在猎杀主角类型中承担着特殊的叙事功能：它不仅决定故事的阅读体验，还直接影响预知这一核心元素如何在文本中呈现。预知不是一个可以直白说出的能力（"我知道第34章会发生什么"）——它必须以某种叙事方式融入文本，让读者感受到主角的先知优势，同时保持叙事的沉浸感。

这里有一个独特的叙事挑战：猎杀主角故事的主角本质上是一个在两个层次上操作的人——他既生活在故事世界中，又以"读者的视角"观察着这个世界。Writing Style 必须设计如何在这两个层次之间移动，而不让读者感到割裂。

---

### 字段生成指南

#### Meta-Awareness 的三种表达方式

Meta-awareness 是指主角对自己处于"原著世界"这一事实的意识。这是猎杀主角类型最独特的叙事元素，也是最难处理的：

**表达方式一：明示型（Explicit）**

主角在内心独白中直接提及原著信息，包括章节编号、角色名字（原著中的名字）、剧情走向等。

优点：
- 信息密度高，读者立刻明白主角知道什么
- 可以用来制造幽默效果（"哦，这就是第23章的那个神圣仪式，原著里写得很无聊"）
- 对于喜欢"爽文"的读者来说阅读体验顺畅

缺点：
- 过度使用会破坏叙事沉浸感（读者不断被拉出故事世界）
- 把原著世界"降格"为一个游戏，减少了角色的情感重量
- 很难写出有深度的角色——一个总在说"我知道这会发生"的主角缺乏脆弱性

适合场景：轻松型猎杀流，以策略解谜和爽感为主；不适合追求文学深度的作品。

频率控制：每章不超过1-2次，且通常是在小的预知验证时刻（主角说了一句话，然后某个预期事件发生）。

**表达方式二：暗示型（Implicit）**

主角从不直接说出原著信息，但他的行为、决策和准备总是"刚好"领先于事件。读者通过事后对照，意识到主角早已知道。

优点：
- 叙事沉浸感最强，读者完全处于故事世界中
- 主角的先知优势以"完美判断"的形式呈现，增加神秘感
- 给读者带来"恍然大悟"的智力满足感

缺点：
- 需要极其精密的情节设计——每个"恍然大悟"时刻都需要提前布线
- 对于不耐心的读者可能感觉"主角总是莫名其妙的正确"
- 难以传达主角内心的焦虑和不确定（因为外显行为总是正确的）

适合场景：节奏较慢、重视叙事层次的作品；适合有耐心的目标读者群。

技巧：在重要的"暗示时刻"之前，给主角一个小小的内心活动（犹豫、计算），让读者感受到他在主动做判断，而不是无意识地"凑巧正确"。

**表达方式三：极简型（Minimalist）**

主角只在极少数关键时刻（每十章一次甚至更少）直接提及他的原著知识。其余时间完全以"在世界中的人"的视角行动。

优点：
- 每次明示预知都有极强的冲击力（因为稀少）
- 让读者时常"忘记"主角有预知优势，当预知发挥作用时产生惊喜
- 主角能够以完整的情感深度存在于故事中，不被"读者视角"稀释

缺点：
- 普通读者可能丧失部分阅读乐趣（感觉预知优势不明显）
- 需要更复杂的叙事技巧来维持一致性

适合场景：追求文学性的猎杀主角作品，主角的情感内核比策略本身更重要。

---

#### 叙述语气的三种选择

**冷静计算型（Cold and Calculating）**

以第一人称或紧贴主角的第三人称写作，内心独白呈现冷静的分析和推演。主角的情绪不直接表达，而是通过对情况的评估和决策呈现。

示例风格：
> 他走入大厅时，我已经知道他的目的地。原著第12章——英雄在这里招募了他的第一个伙伴。
> 我比那个伙伴早了三天到达这座城市。
> 三天，足够了。

特点：信息密度高、叙事效率高、有算计的冷酷美感。适合以策略博弈为核心卖点的作品。

**黑色幽默型（Dark Humor）**

主角以一种冷嘲热讽、自我解嘲的语气看待自己的处境和原著世界的荒谬。对"天命"的嘲弄是这种风格的核心。

示例风格：
> 好消息：我知道他今天会来。坏消息：在原著里，他来了之后，我作为这个地牢的守卫，在第一场战斗里被一刀秒杀。
> 更好的消息：我已经提前离职了。
> 坏消息：我现在没有工作。

特点：轻快、有节奏感、制造情绪的上下起伏；但过度使用会让人觉得主角不严肃，削弱紧张时刻的力度。适合面向大众读者、强调娱乐性的作品。

**紧张偏执型（Tense and Paranoid）**

主角对原著剧情的了解不是一种安全感，而是一种慢性焦虑——他越了解，就越害怕出现意外，越担心某个盲区藏着致命威胁。内心独白常常包含对不确定性的反复审视。

示例风格：
> 他走入大厅，我认出了他的脸——勇者，比原著描述的要年轻一点，也更疲惫。
> 为什么疲惫？原著里这个阶段他应该精力充沛。
> 哪里出了问题？我干预了什么吗？还是我没读到的内容里藏着某个我不知道的事件？
> 我需要更多情报。

特点：张力感强、代入感深；读者和主角一起感受到不安全感。适合后期剧情（当预知开始失效）或整体基调偏暗的作品。

---

#### 如何在不破坏叙事的前提下展现预知

这是写作技巧层面最核心的问题。以下是几种经典手法：

**手法一：事后对照法**
主角做出某个决策，不给内心独白，几章后读者看到"如果没有那个决策会发生什么"——可以通过另一个角色走了原著路线来对照。读者恍然大悟，主角的预知通过对比得到体现。

**手法二：微小细节预知法**
主角提到一个微小的细节（"这个人今天会早退"），读者以为是随口一说，然后那个细节成真。这种小规模的预知验证建立了读者对主角预知能力的信任，为后续更大的预知行动铺垫。

**手法三：反应差异法**
其他角色对某件事感到震惊，但主角的反应过于平静——读者通过这种反应差异推断主角早已知道。好的执行是让主角的平静本身成为一种表达：他不只是知道，他已经消化了。

**手法四：精准布局暗示法**
主角提前做了某项准备（储存某种物资、培养某个联系人、了解某条路线），但在当时没有解释原因。当事件触发时，这个准备恰好派上用场——读者意识到主角早已预判。

**关于频率：原著剧情引用的分寸**

主角在内心OS中多久提一次"这是原著第X章"或"勇者的外挂是Y"？

- **过于频繁**（每段落都有）：叙事变成原著解说，读者厌倦
- **适中**（每3-5章有一次明显的预知应用）：节奏最佳，读者时刻记得这个设定但不被淹没
- **过于稀少**（超过10章没有预知体现）：读者忘记这个核心设定，当预知忽然发挥作用时感觉突兀

推荐：明示预知每3-5章一次；暗示预知（行为层面）每章都有微小体现。

---

### 字段联动关系

- **Meta-Awareness 表达方式 → 叙述语气的匹配**：明示型最适配黑色幽默型（直接讲出来，然后嘲讽）；暗示型最适配冷静计算型（用行为体现，不需要说出来）；极简型最适配紧张偏执型（偶尔泄露的预知信息最有冲击力）
- **叙述语气 → 故事整体基调**：冷静计算型趋向智识派爽文；黑色幽默型趋向娱乐向轻松流；紧张偏执型趋向心理悬疑向
- **预知展现手法 → 读者信任建立**：前几章的手法选择决定了读者对主角能力的信任基线；信任建立后，大规模的预知应用才会有冲击力

---

### 常见错误

1. **全程明示型但频率无节制**：主角每段话都在引用"原著第X章"，叙事沦为章节预告，完全没有悬念
2. **预知展现与叙事节奏脱钩**：在紧张的战斗场景中插入大段"原著回顾"式的内心独白，破坏节奏感
3. **语气选择与角色性格矛盾**：一个设定为冷静算计型的主角却用黑色幽默语气——读者对角色性格感到困惑
4. **从不承认预知的局限**：主角的内心独白永远充满自信，从未展现不确定和焦虑——让人感觉主角是"万能"的，削弱了戏剧张力
5. **"完美预判"使用过度**：每一次主角的判断都100%正确，读者失去期待——偶尔的"主角预判失误"反而是最强的张力制造器',
  '## "Writing Style" Setting Generation — The Protagonist Hunter

The "Writing Style" in Protagonist Hunter fiction carries a specialized narrative function: it does not merely shape the reading experience, it directly determines how the foreknowledge — the genre''s central element — manifests in the text. Foreknowledge cannot simply be stated aloud ("I know what happens in Chapter 34"). It must be woven into the narrative so that readers *feel* the protagonist''s advantage without being pulled out of the story''s world.

This presents a unique narrative challenge. The Protagonist Hunter''s protagonist operates simultaneously on two levels: they live inside the story world and observe it with the perspective of a reader who has read it. The writing style must design how the narrative moves between these two levels without creating a sense of fragmentation.

---

### Field Generation Guide

#### Meta-Awareness: Three Expression Modes

Meta-awareness is the protagonist''s consciousness of being inside a story they have previously read. It is the Protagonist Hunter''s most distinctive narrative element — and its most technically demanding.

**Mode 1: Explicit**

The protagonist directly references original novel information in internal monologue — chapter numbers, character names as they appeared in the novel, plot trajectories stated plainly.

*Strengths*:
- High information density; readers immediately understand what the protagonist knows
- Can generate comedy ("Oh, this is that sacred ritual from Chapter 23 — the novel made it sound much more impressive")
- Smooth reading experience for audiences seeking strategic satisfaction and power-fantasy enjoyment

*Weaknesses*:
- Overuse breaks narrative immersion — readers are repeatedly pulled out of the story world
- Reduces the original world to a "game level," diminishing emotional weight of characters
- Difficult to write a psychologically deep protagonist — a character who constantly says "I knew this would happen" lacks authentic vulnerability

*Best suited for*: Light, entertainment-focused Protagonist Hunter stories where strategic puzzles and satisfying power execution are the primary draws.

*Frequency control*: No more than 1-2 direct meta-references per chapter, and ideally reserved for moments of small foreknowledge confirmation ("I said this aloud, knowing what response it would trigger — and she said exactly the words I expected").

---

**Mode 2: Implicit**

The protagonist never directly states original novel information. Instead, their decisions, preparations, and actions are always precisely calibrated to incoming events — which readers realize in retrospect were known in advance.

*Strengths*:
- Maximum narrative immersion — readers remain entirely inside the story world
- The protagonist''s foreknowledge presents as "perfect judgment," creating an aura of mystery and competence
- Generates the "I should have realized earlier" intellectual satisfaction that is one of the genre''s premium pleasures

*Weaknesses*:
- Requires extremely precise plotting — every "revelation in retrospect" must be set up chapters earlier
- Impatient readers may find the protagonist "inexplicably always correct" without understanding the mechanism
- Difficult to convey the protagonist''s internal anxiety and uncertainty (external behavior is always correct)

*Best suited for*: Slower-paced, narratively layered works with patient target audiences.

*Technique*: Before important implicit foreknowledge moments, give the protagonist a brief internal beat — a calculation, a hesitation, an assessment. This signals to readers that the protagonist is *actively deciding* based on information, not unconsciously "happening to be right." The difference: "I turned left" (mysterious but feels random) vs. "I turned left — the shortest route to the eastern gate, and the eastern gate was where Chapter 9''s supply convoy ambush would happen in approximately four hours" (deferred revelation: readers only understand this two chapters later).

---

**Mode 3: Minimalist**

The protagonist references their original novel knowledge extremely rarely — once every ten chapters or less. The rest of the time, they act entirely as "a person living in this world," with no visible meta-awareness.

*Strengths*:
- Each direct meta-reference carries enormous impact (scarcity creates weight)
- Readers periodically "forget" the protagonist has foreknowledge, making the rare activation surprising
- The protagonist can exist with full emotional depth, not diluted by constant reader-perspective intrusion

*Weaknesses*:
- General readers may feel the foreknowledge advantage is underutilized and the story''s premise under-delivered
- Requires sophisticated narrative technique to maintain consistency

*Best suited for*: Literary-ambition Protagonist Hunter works where the protagonist''s emotional interiority matters more than strategic demonstration.

---

#### Narrative Tone: Three Options

**Cold and Calculating**

First-person or tightly protagonist-anchored third-person narration, with internal monologue presenting calm analysis and inference. The protagonist''s emotions are not stated directly — they are expressed through situation assessment and decision-making.

*Style example*:
> He entered the hall, and I already knew his destination. Chapter 12 of the original — where the hero recruited his first companion.
> I had arrived in this city three days before that companion.
> Three days was sufficient.

*Characteristics*: High information density, high narrative efficiency, the cold aesthetic of pure calculation. Well-suited for stories where strategic chess is the primary selling point.

*Works well with*: Implicit meta-awareness mode (the protagonist''s "knowing" is expressed through precise decisions, not stated).

*Risk*: A protagonist who is *always* cold and calculating never generates emotional identification. Even the most cold-blooded Protagonist Hunter should have one or two things they genuinely care about — and the threat to those things is what makes the calculation feel like it costs something.

---

**Dark Humor**

The protagonist views their situation and the original story''s absurdities with sardonic irony. Mocking "destiny" is the core of this tone.

*Style example*:
> Good news: I knew he was coming today. Bad news: in the original story, when he arrived, I — as the dungeon''s guard captain — got one-shotted in the opening fight.
> Better news: I resigned three days ago.
> Bad news: I am now unemployed.

*Characteristics*: Light, rhythmically satisfying, generates emotional ups and downs. Uniquely suited to the Protagonist Hunter''s premise, because the protagonist''s entire situation is inherently absurd — someone who knows they are supposed to die, and refuses to.

*Works well with*: Explicit meta-awareness mode (the humor comes from the gap between "what the novel said would happen" and "what is actually happening because of the protagonist''s interference").

*Risk*: Overuse makes the protagonist feel unserious, significantly weakening the tension of moments that *should* be dangerous. The best dark humor in this genre punctuates genuine threat — the joke works *because* the protagonist is in real danger and responding with dark comedy rather than fear.

---

**Tense and Paranoid**

The protagonist''s foreknowledge is not a source of security — it is a source of chronic anxiety. The more they know, the more they fear the unexpected, the more they worry about blind spots concealing lethal threats. Internal monologue frequently revisits uncertainty.

*Style example*:
> He walked into the hall, and I recognized his face — the hero, younger than the novel described, and more exhausted.
> Why exhausted? In the original story, at this stage, he should have been full of energy.
> What had gone wrong? Had one of my interventions changed something? Or was this from a chapter I had never read — some event I was completely unaware of?
> I needed more intelligence. I needed it before I moved.

*Characteristics*: High tension, deep immersion; readers share the protagonist''s anxiety.

*Works well with*: Minimalist or implicit meta-awareness (the protagonist''s paranoia is more believable when they *don''t* have constant access to confirmed plot information).

*Best suited for*: Later story phases (when foreknowledge has begun to degrade), or stories with an overall darker, more psychological tone.

---

#### How to Convey Foreknowledge Without Breaking Narrative Immersion

This is the most technically critical craft question for Protagonist Hunter writing. Several proven techniques:

**Technique 1: Post-Hoc Contrast**

The protagonist makes a decision without internal monologue explaining why. Several chapters later, readers see what would have happened if that decision had not been made — through another character taking the original story''s path, or a brief scene showing the alternative. The contrast reveals the protagonist''s foreknowledge through inference, preserving first-read mystery while delivering the intellectual payoff.

**Technique 2: Minor Detail Prophecy**

The protagonist mentions a small detail ("this person will leave early today") without apparent significance. Readers read past it. The detail proves accurate. This small-scale foreknowledge confirmation builds reader trust in the protagonist''s predictive ability — making larger, high-stakes foreknowledge applications feel earned rather than arbitrary.

**Technique 3: Reaction Differential**

Other characters are shocked by a development. The protagonist''s reaction is conspicuously calm — not dramatically calm (making a scene of their calm), just... quiet, already moving to the next problem. Readers infer foreknowledge from this reaction gap. Strong execution makes the protagonist''s composure expressive in itself: not just "they knew," but "they have already processed this and moved past it."

**Technique 4: Prepared Assets**

The protagonist made specific preparations earlier in the story — stocked a particular resource, cultivated a specific contact, memorized a particular route — without explaining why. When the relevant event triggers, these preparations deploy perfectly. Readers recognize the setup, realizing the protagonist had anticipated this precise scenario. The key: the preparation must be mentioned clearly enough to register but not so obviously foreshadowed that it telegraphs the event.

**Regarding Frequency: How Often to Reference the Original Novel**

How frequently should the protagonist''s internal monologue reference "Chapter X of the original" or "the hero''s cheat ability is Y"?

- *Too frequent* (every few paragraphs): The narrative becomes a plot synopsis. Readers lose the sense of experiencing events and feel they are reading an annotated summary. Immersion collapses.
- *Optimal* (one clear foreknowledge application every 3-5 chapters): Best pacing. Readers consistently remember the premise but are not overwhelmed by constant reminders.
- *Too infrequent* (no foreknowledge activation for more than 10 chapters): Readers forget the story''s central premise. When foreknowledge suddenly activates after a long absence, it feels like a deus ex machina rather than an established character capability.

*Recommended rhythm*: Explicit meta-awareness every 3-5 chapters; implicit foreknowledge (behavioral level — decisions that "happen to be right") present in nearly every chapter as background texture.

---

#### Handling "Perfect Prediction" Moments

The protagonist''s most powerful tool is also their most dangerous writing challenge: if every prediction is 100% correct, readers lose the capacity for suspense. Perfect prediction must be used selectively.

*Strategic use of prediction accuracy*:

- **Always accurate**: Information from the original story that has not yet been affected by the protagonist''s interference. Early in the story, predictions should be reliable.
- **Partially accurate**: As the protagonist''s interventions accumulate, some predictions should begin to fail in small ways — someone acts differently than expected, an event is shifted slightly off-schedule. These small failures foreshadow the coming larger breakdown of foreknowledge.
- **Systematically unreliable**: In the later story phases, when significant divergence has accumulated, the protagonist should be operating with foreknowledge they no longer trust. They know what was *supposed* to happen; they do not know if it still will.

The *deliberate prediction failure* is one of the most powerful tension-generating tools in the genre. The moment the protagonist confidently moves based on foreknowledge — and the world does not cooperate — is when the story becomes most alive.

*How to write a prediction failure*:
- The protagonist''s internal preparation should be visible (readers can see they are acting on foreknowledge)
- The failure should be specific (not "something went wrong" but "he said the wrong words — he was not supposed to say those words here, this scene happens in Chapter 14, not Chapter 9, why is it happening now?")
- The protagonist''s response to the failure reveals character: do they recalibrate instantly? Panic? Freeze? The recovery is as important as the failure.

---

### Field Interaction Guidelines

- **Meta-awareness mode + Narrative tone pairing**: Explicit mode pairs best with Dark Humor (stating what you know, then mocking it); Implicit mode pairs best with Cold and Calculating (behavior demonstrates knowledge, no explanation needed); Minimalist mode pairs best with Tense and Paranoid (the rare moments of meta-awareness emerge from anxiety, not confidence).
- **Narrative tone → Overall story register**: Cold and Calculating trends toward intellectual power fantasy; Dark Humor trends toward entertainment-focused comedy-action; Tense and Paranoid trends toward psychological suspense.
- **Foreknowledge technique → Reader trust establishment**: The technique choices in the first three to five chapters determine the reader''s baseline trust in the protagonist''s capabilities. That trust must be established before the large-scale foreknowledge actions can land with proper impact.

---

### Common Mistakes

1. **Unlimited explicit mode**: The protagonist references "Chapter X of the original" in nearly every paragraph. The narrative becomes a chapter-by-chapter plot preview with no suspense. Readers feel they are watching someone speedrun a game with a walkthrough open.

2. **Foreknowledge display disconnected from narrative pacing**: Long "original story recap" internal monologues inserted into tense combat sequences. The pacing ruptures; tension evaporates. Foreknowledge display must be paced to match the scene''s energy level.

3. **Tone-character contradiction**: A protagonist designed as cold and calculating who narrates with sardonic dark humor — readers cannot form a coherent mental model of the character.

4. **Never acknowledging the foreknowledge''s limits**: The protagonist''s internal monologue is consistently confident, never expressing uncertainty or anxiety. This creates an impression of omniscience that kills dramatic tension. Even the most prepared Protagonist Hunter must occasionally face the wall of what they do not know.

5. **Overusing "perfect prediction"**: Every single foreknowledge application succeeds perfectly. Readers stop expecting surprises. The story becomes a competence demonstration rather than a narrative. A deliberate, well-placed foreknowledge *failure* — where the protagonist confidently acts on intelligence that turns out to be wrong — is often the single most tension-generating event in the entire novel. Do not save it only for the climax; use it periodically to reset the reader''s expectations.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Protagonist Hunter' LIMIT 1),
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
