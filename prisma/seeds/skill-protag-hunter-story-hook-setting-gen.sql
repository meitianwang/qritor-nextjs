-- The Protagonist Hunter「Story Hook」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Protagonist Hunter' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-protag-hunter-story-hook-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'protag-hunter-story-hook-setting-gen',
  '「Story Hook」设定生成：为 The Protagonist Hunter 生成故事钩子设定，核心吸引力是"先知优势 vs 天命"的博弈，钩子公式为转生身份的悲剧性讽刺加主角掌握的预知优势加猎杀勇者的代价',
  '"Story Hook" setting generation: generate story hook settings for The Protagonist Hunter, centered on the "foreknowledge vs destiny" conflict, with the hook formula of tragic irony of reincarnated identity plus protagonist''s foreknowledge advantage plus the cost of hunting the hero',
  '## 「Story Hook」设定生成 — The Protagonist Hunter

「Story Hook」是读者拿起这本书后决定是否追读的关键。猎杀主角类型的独特魅力在于一种极具张力的对立结构：主角拥有"先知优势"——他了解原著剧情，知道勇者的成长路线和终极命运；然而他面对的是"天命"——原著世界有其内在的推进逻辑，勇者被命运本身庇护，每次阻碍都可能触发新的连锁反应。

这不是简单的"强者碾压弱者"，而是一场**精密博弈**：预知者 vs 天命机制。这个核心张力必须在故事钩子中清晰呈现。

---

### 字段生成指南

#### Story Hook

Story Hook 是一句话或两句话的精准概括，要同时传达三个要素：

**要素一：转生身份的悲剧性讽刺**
主角不是转生成英雄，不是成为另一个强大的异世界者，而是成了他曾经在原著中看着被打败的小反派/炮灰。这种身份本身就是一种讽刺——他越了解原著，就越清楚自己现在的处境有多危险。

优秀的讽刺来自"身份与知识的错位"：
- "我读过整本书，我知道每一个主角光环事件——但我现在是那个在第7章被主角一刀秒杀的哥布林首领"
- "我是唯一一个知道那个''天真少年''会成为拯救世界的勇者的人——但现在我是他命定要推翻的魔王"

**要素二：主角掌握的预知优势**
预知是主角对抗天命的唯一武器。Story Hook 中不需要解释预知的来源（转生/重生/读过原著），但要让读者感受到这种优势的存在：
- 主角知道某些其他人不可能知道的事情
- 主角能做出让周围人震惊的精准判断
- 主角总是比勇者"早一步"

**要素三：猎杀勇者的代价**
猎杀不是零成本的行动。好的钩子要暗示这种代价的存在：
- 每次干预都可能改变原著剧情，让预知失效
- 主角需要做一些让读者感到不安的事情（对付"好人"）
- 存在一个系统性的反制力量（天命/主角光环/世界修正）

**钩子公式：转生身份的悲剧性讽刺 + 预知优势 + 猎杀代价**

优秀钩子示例：
- "我在地球上读过这本异世界轻小说，知道这里每一个主要情节。现在我成了书里第四章的小兵——原著里被勇者秒杀的那种。但今天，那个注定要拯救世界的少年刚刚踏入这片领域，而我已经在等他了"（讽刺：从读者到被猎杀的配角；优势：早已部署；代价：未明示但暗含）
- "转生成原著反派的第一天，我就收到了一个消息：那个将来要杀我的勇者，今年才十岁"（讽刺：反派身份；优势：知道确切时间轴；代价：要对抗一个孩子，在道德上造成不适）

#### Core Selling Point

猎杀主角类型有独特的核心卖点，需要与同类竞争作品（如《我成了反派的爸爸》《反派就是这么任性》《我是大反派》等）拉开差异：

**"先知 vs 天命"的博弈是核心差异化**
大多数反派转生小说的核心是"反派努力改变结局"——重点是改变。猎杀主角小说的核心是**主动猎杀**——重点是猎杀行动本身的策略和心理张力。

差异化维度：
- **猎杀的主动性**：主角不是被动等待勇者来打，而是主动部署、主动干预、主动猎杀
- **情报优势的层次感**：主角的优势不是"变强了"，而是"比勇者更了解这个世界的走向"
- **天命反制机制**：是否引入"世界意志"或"主角光环强化"作为猎杀的最大障碍

**讽刺感是情感核心**
最好的猎杀主角故事有强烈的讽刺意味：
- 主角越了解原著，就越清楚自己的处境有多危险
- 读者知道主角"原本应该"死，所以他的每一次成功都是对命运的冒犯
- 主角用勇者世界的逻辑去对抗勇者，这本身就充满反讽

#### Opening Tension

猎杀主角小说的开篇必须同时建立三层张力：

**第一层：生存危机**
主角需要立刻意识到他的转生身份是一个死亡判决，不是礼物。
- 他在原著中注定死于勇者之手（或注定在某个节点消亡）
- 他现在的实力相对于这个死亡威胁是不足的
- 他有多少时间？节点有多近？

**第二层：预知激活**
主角必须在开篇展示他对原著的了解——让读者确信这种优势是真实的，而不是主角自以为是。
- 他预言了某件事（小到别人的行动，大到某个大事件）
- 这个预言在开篇的某个时刻成真
- 其他角色的反应证明这种预知是异常的

**第三层：猎杀者定性**
开篇必须明确主角的选择：不是改变命运，不是接受死亡，而是主动猎杀。
- 这个选择必须有内在逻辑（为什么是猎杀而不是逃跑？）
- 可以是因为恐惧（只有消灭勇者才能真正安全）
- 可以是因为仇恨（主角对被命运安排好的死亡感到愤恨）
- 可以是因为算计（主角分析后认为猎杀是最优策略）
- 不应该仅仅是因为"坏"——目的必须有说服力

**经典开篇模式**：
- **确认死亡节点型**：主角刚刚转生，立刻确认原著剧情已经开始——距离他的死亡节点还有X天/X章的时间
- **第一次预知命中型**：主角在某件微小事情上展示了精确预知（某个人说了某句原著台词，或某个事件按照原著发展），确立了预知的真实性
- **道德边界挑战型**：开篇让主角面临第一个道德困境——为了活命，他需要对一个"原著好人"做某些事情，考验读者是否接受主角的立场

#### Reader Expectation

猎杀主角类型的读者有特定的期待模式：

**期待一：智谋博弈的快感**
读者想看主角用预知情报设计精密的陷阱，将勇者引入精心准备好的局中。最大的爽感来自"原来他早就算到了这一步"的恍然大悟时刻。

**期待二：讽刺逆转**
原本应该"扶大厦于将倾"的勇者，在主角的干预下一次次错过机缘、走向错误的路。读者享受原著逻辑被主角精准解构的快感。

**期待三：天命的反制与突破**
勇者的主角光环不是摆设——读者期待看到光环真的在运作（某些干预失败，某些机缘怎么阻挠都还是发生），主角需要找到比光环更高层次的解法。

**期待四：知识盲区的紧张**
随着主角的干预积累，原著剧情越来越不可靠。读者和主角一起进入"未知领域"，体验原著预知逐渐失效的紧张感。

---

### 字段联动关系

- **Story Hook 的讽刺感 → 情感共鸣的基础**：讽刺感越强，读者的情感投入越深——他们会更想看主角"逆天改命"
- **Core Selling Point → 区别于同类的核心定位**：必须在设定阶段就明确主动猎杀 vs 被动改命的差异
- **Opening Tension 的三层结构 → 节奏设定**：三层张力需要在开篇的合适位置各自激活，不能全堆在第一章
- **Reader Expectation → 后续剧情承诺**：Story Hook 承诺的爽感，全书都必须兑现；不能前几章是猎杀流，后面变成和勇者称兄道弟

---

### 常见错误

1. **钩子缺乏讽刺感**：只写主角"转生成反派，利用预知求生"，没有传达那种"我越了解原著越危险"的讽刺张力
2. **过度强调主角的优势而淡化天命压力**：读者需要感受到勇者的威胁是真实的，主角的胜利是来之不易的，而不是"先知轻松碾压"
3. **开篇道德立场模糊**：主角为什么要猎杀而不是逃跑？这个问题如果没有在开篇给出清晰答案，读者会缺乏代入感
4. **猎杀动机苍白**：纯粹为了"活命"而猎杀缺乏深度；为了"我凭什么被命运安排好的剧本杀死"而猎杀有道德层次感，更能引发读者共鸣
5. **忽视勇者作为角色的塑造**：如果勇者只是一个靶标，没有人格，猎杀就失去了其核心张力。读者需要感受到被猎杀的对象是有真实存在感的人，才会觉得猎杀本身有意义',
  '## "Story Hook" Setting Generation — The Protagonist Hunter

The "Story Hook" is the threshold that determines whether a reader commits to this story. The Protagonist Hunter subgenre has a unique core appeal built on a profoundly tense oppositional structure: the protagonist possesses "foreknowledge advantage" — they know the original novel''s plot, understand the hero''s growth trajectory and ultimate fate. Yet they face "Destiny" — the original world has its own internal momentum, the hero is protected by fate itself, and every interference may trigger new chain reactions.

This is not a simple story of a stronger party crushing a weaker one. It is a **precision game**: the foreknower vs. the destiny mechanism. This core tension must be crystallized in the story hook.

The hook formula for Protagonist Hunter fiction: **Tragic irony of the reincarnated identity + protagonist''s foreknowledge advantage + the cost of hunting the hero**

---

### Field Generation Guide

#### Story Hook

The story hook is a one- to two-sentence precise summary that must simultaneously convey three elements:

**Element 1: The Tragic Irony of the Reincarnated Identity**

The protagonist did not reincarnate as a hero. They did not become another powerful otherworlder. They became the minor villain, the cannon fodder, the mid-boss they once watched get defeated while reading the original novel. This identity is itself an irony — the more they know about the original story, the more clearly they understand how precarious their position is.

The best irony comes from the *gap between knowledge and situation*:
- "I read the entire book. I know every protagonist-aura event, every divine blessing, every destined encounter. But right now I am the Goblin Warchief who gets one-shotted by the hero in Chapter 7."
- "I am the only person in this world who knows that ''naïve boy'' will grow up to save everything. I am also the Demon Lord he is destined to overthrow."

The irony cuts deeper when the protagonist''s knowledge *increases* their awareness of danger rather than relieving it. A regular villain does not know their fate. This protagonist knows *exactly* how they die, *exactly* when, and *exactly* what the hero''s expression will look like. That specificity of doom is what makes this irony uniquely tormenting.

**Element 2: The Protagonist''s Foreknowledge Advantage**

The foreknowledge is the protagonist''s only weapon against destiny. The story hook does not need to explain its source (reincarnation, transmigration, having read the original work in another world) — but it must make the reader *feel* the advantage''s presence:
- The protagonist knows things no one else in this world could possibly know
- They make precisely accurate judgments that shock everyone around them
- They are always "one step ahead" of the hero — arriving before, preparing before, knowing before

The hook should make this advantage *feel dangerous* rather than comfortable. The foreknowledge is not a cheat code that makes everything easy; it is a weapon with a limited ammunition count (the knowledge degrades as the protagonist alters the plot).

**Element 3: The Cost of Hunting the Hero**

Hunting is not a zero-cost action. A strong hook implies the existence of this cost:
- Every intervention risks changing the original plot, potentially invalidating future foreknowledge
- The protagonist must do things that create reader discomfort (acting against characters the original novel framed as good)
- There is a systemic counterforce — the "world''s will," the protagonist aura actively reinforcing itself, or fate''s tendency to course-correct

**Strong Hook Examples**:

Example 1: "I read this isekai light novel cover-to-cover back on Earth. I know every major plot event, every divine artifact location, every character''s final fate. Now I''m living as the nameless soldier in Chapter 4 — the one the hero casually cuts down while smiling about saving the world. But the ''hero'' just turned ten years old today. I have time. I intend to use it."
- Irony: from reader to cannon fodder; Knowledge: clearly established; Cost: implied — acting against a ten-year-old future hero

Example 2: "The Demon Lord reincarnated with complete knowledge of the original story. The first thing I did: locate the Holy Sword before the hero''s destined dungeon quest. The second thing: bury it under forty meters of reinforced stone. The third: wait. He''s coming. He always comes. But this time, his destiny arrives empty-handed."
- Irony: Demon Lord trying to subvert the prophecy of his own defeat; Knowledge: demonstrated through decisive action; Cost: the inevitability of the hero''s approach despite precautions

Example 3: "I read to Chapter 23 before falling asleep and waking up as the mid-boss — the Dungeon Lord who gets defeated and reformed by the hero''s speech about ''the goodness in everyone.'' No. I am not getting reformed. I am going to make sure there is no hero left to give speeches."
- Irony: destined to be reformed (a uniquely humiliating fate); Knowledge: knows the exact death method; Cost: must actively resist narrative destiny

---

#### Core Selling Point

The Protagonist Hunter subgenre has a distinct core selling point that must differentiate it from competitors in the villain-reincarnation / reverse-isekai space (*I Became the Villain''s Father*, *The Villainess Reverses the Hourglass*, *I''m the Villain* etc.):

**"Foreknowledge vs. Destiny" Conflict — The Primary Differentiator**

Most villain-reincarnation stories center on "changing the outcome" — the protagonist tries to prevent their fated death by becoming good, by warning the hero, by changing circumstances. The Protagonist Hunter''s core is *active hunting* — the emphasis is on the hunt''s strategy and psychological intensity, not on redemption or passive fate-avoidance.

Differentiation dimensions:

1. *Active posture*: The protagonist does not wait for the hero to come — they position ahead, intercept resources, design traps. Every chapter is about the protagonist''s next move, not about reacting to the hero''s.

2. *Intelligence as the core advantage*: The protagonist''s edge is not increased strength (though strength matters); it is *knowing more about this world''s future than anyone else*. This creates a different kind of power fantasy — not physical domination but informational dominance.

3. *The destiny counter-mechanism*: Does the story introduce a "world''s will" or "protagonist aura amplification" that actively resists the hunt? This counter-mechanism is what separates intelligent Protagonist Hunter stories from simple "smart villain wins easily" power fantasies.

**Irony as the Emotional Core**

The best Protagonist Hunter stories are saturated with a specific flavor of irony:
- The protagonist understands the original story''s moral framework (the hero is the good one, the villain deserves to fall) — and must violate that framework to survive
- The reader knows the protagonist "should" die — so every success feels like a transgression against fate, which is exhilarating
- The protagonist uses the logic of the hero''s world (prophecy, divine artifacts, heroic bonds) as tools for the hunt — a deeply ironic co-optation of the systems designed to protect the hero

This irony is what distinguishes the subgenre''s emotional flavor from both standard power fantasy and tragedy. It is neither triumphant nor melancholic — it is unsettling, intellectually stimulating, and darkly funny.

---

#### Opening Tension

Protagonist Hunter openings must simultaneously establish three layers of tension:

**Layer 1: The Survival Crisis**

The protagonist must immediately recognize their reincarnated identity as a death sentence, not a gift:
- Their designated death in the original story is real, imminent, and involuntary
- Their current power level is insufficient relative to this death threat
- The clock is already running: how much time before the death node? How close is the hero?

This layer must be visceral. The reader needs to feel the protagonist''s recognition — "this isn''t an adventure, this is a countdown."

**Layer 2: Foreknowledge Demonstration**

The protagonist must demonstrate their foreknowledge in the opening — making the reader certain this advantage is real, not self-delusion:
- The protagonist predicts a specific event, small or large
- That prediction comes true within the opening chapter
- Other characters'' reactions confirm that this prediction was impossible under normal circumstances

The demonstration should feel earned: not "I know everything," but "I know *this specific thing* that just happened to be critical." The precision of the prediction matters more than its scale.

**Layer 3: The Hunter''s Commitment**

The opening must establish the protagonist''s choice — not fate-changing, not surrender, but active hunting:
- This choice must have internal logic. Why hunt rather than run? Why hunt rather than accept fate?
- Acceptable motivations (each creates different narrative flavors):
  - *Fear-based*: "Only eliminating the hero can guarantee my survival — running only delays the inevitable"
  - *Resentment-based*: "I refuse to die because someone else''s story says I should"
  - *Analytical*: "I have calculated all options; hunting has the highest survival probability"
  - *Philosophical*: "If I am fated to be a villain, I will be the most effective villain this story has ever seen"
- The protagonist should NOT hunt simply because they are "evil." The motivation must be coherent and emotionally legible.

**Classic opening patterns for Protagonist Hunter**:

*Death Node Confirmation Opening*: The protagonist just reincarnated and immediately confirms the original plot has started — countdown to their death node is X days / X chapters.
- Best for: building immediate urgency, establishing the foreknowledge system early

*First Foreknowledge Strike*: A small event plays out exactly as the original story predicted — someone says a line of dialogue word-for-word, or a minor event unfolds precisely as the protagonist foresaw — cementing the reality of their advantage.
- Best for: establishing the foreknowledge as real before any action is taken; creating the reader''s confidence in the protagonist

*Moral Boundary Opening*: The protagonist faces their first moral dilemma in the opening — to survive, they must act against someone the original story framed as unambiguously good. The reader is immediately forced to decide: are they with the protagonist?
- Best for: establishing the tone early (this is not a light story), filtering the target audience, creating immediate character definition

---

#### Reader Expectation

Protagonist Hunter readers have a specific expectation profile that must be satisfied throughout the story:

**Expectation 1: Strategic Chess Satisfaction**

Readers want to see the protagonist design precise traps using foreknowledge, guiding the hero into carefully prepared situations. The peak satisfaction is the "he planned this all along" revelation moment — when an action from twenty chapters ago turns out to have been a setup for the current crisis.

This expectation requires: complex, multi-stage plans; plans that are revealed gradually; opponents who are not stupid (so the plan''s success feels earned).

**Expectation 2: Ironic Reversal**

The hero who was "destined to save everything" misses destined opportunities, is redirected toward wrong paths, finds the divine artifacts already claimed. Readers enjoy watching the protagonist precisely deconstruct the original story''s logic.

This expectation requires: specific, memorable interceptions (not vague "prevented the hero''s growth"); the hero''s confusion and frustration as visible reactions; occasional partial failures that show the protagonist is not infallible.

**Expectation 3: The Destiny Counter-Mechanism**

The protagonist aura must be real. Readers expect to see it actually operating — some interventions fail despite perfect planning, some destined encounters occur despite elaborate prevention. The protagonist must find solutions that work *above* the aura level, not just around it.

This expectation requires: at least some events that occur regardless of the protagonist''s interference; visible escalation of the hero''s power despite interceptions; the protagonist facing genuinely unexpected hero capabilities.

**Expectation 4: The Expanding Blind Zone**

As the protagonist''s interventions accumulate, the original plot becomes less reliable. Readers want to experience this transition — the shift from confident, foreknowledge-driven action to improvised responses in unknown territory. This creates a second act of tension distinct from the first.

---

### Field Interaction Guidelines

- **Story Hook irony strength → Emotional investment depth**: Stronger irony creates deeper reader investment — readers become more personally invested in seeing the protagonist defy fate precisely because the irony makes fate''s original design feel particularly unfair.
- **Core Selling Point → Differentiation positioning**: The active-hunting vs. passive-fate-changing distinction must be established in the setting phase itself, not after the first arc.
- **Three-layer Opening Tension → Pacing calibration**: All three tension layers should activate within the opening sequence, but not all in the same chapter. Stagger them across the first three to five chapters.
- **Reader Expectation → Story-long commitment**: Whatever the hook promises — strategic chess, ironic reversals, destiny battles — must be delivered consistently throughout the entire novel. A story that opens as a strategic hunt and gradually becomes a friendship story with the hero has broken its contract with the reader.

---

### Common Mistakes

1. **Hook lacks ironic tension**: Only states "reincarnated as villain, using foreknowledge to survive" without transmitting the "the more I know, the more dangerous I am" ironic charge. The irony is the emotional engine — without it, the hook is purely mechanical.

2. **Overemphasizing protagonist advantage, diluting destiny pressure**: Readers need to feel the hero''s threat is genuine and the protagonist''s victories are hard-won. A hero who feels like a trivially beatable obstacle makes the hunt feel like routine administration rather than a life-or-death struggle.

3. **Ambiguous opening moral stance**: Why hunt rather than flee? This must be answered clearly in the opening. Without it, readers lack the alignment needed to invest in the protagonist''s choices.

4. **Shallow hunting motivation**: "Hunting to survive" is necessary but insufficient as a sole motivation. "I refuse to die on someone else''s predetermined script" adds a layer of existential defiance. "I am going to prove that fate is a story humans tell themselves" adds philosophical depth. Layer the motivation.

5. **Neglecting the hero as a character**: If the hero is only a target — a stat block with a protagonist aura — the hunt loses its core tension. Readers need to feel that the hunted subject has genuine presence, intelligence, and even emotional resonance. The best Protagonist Hunter stories make the reader simultaneously want the protagonist to succeed *and* feel something about what that success means for the hero.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Protagonist Hunter' LIMIT 1),
  1,
  52,
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
