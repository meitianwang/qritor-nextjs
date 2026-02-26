-- The Villainous Lead - 剧情生成（Layer 3）
-- novel_creation_method: The Villainous Lead (Villainous Lead)
-- 执行方式 / Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-villain-lead-plot-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'villain-lead-plot-gen',
  '剧情生成：为 The Villainous Lead 提供剧情推进指导，围绕反派的计划推进、英雄的逐步觉醒与反派的应对、以及最终的终局博弈设计故事弧线',
  'Plot generation: plot progression guidance for The Villainous Lead, centered on the villain''s plan execution, the hero''s escalating awareness, and the endgame confrontation',
  '## 剧情生成 — The Villainous Lead

反派视角剧情的核心驱动力是**信息不对称的动态管理**。反派主角始终比英雄掌握更多信息，整个故事是这一优势被维持、被威胁、被局部侵蚀，然后被重新调整的过程。结局未必是反派获胜，但必须是反派「在局势允许的最高水平上博弈到最后」。

---

### 三幕结构变体

**第一幕：棋局布置**

反派已经在运作中——读者进入的是一盘已经开始的棋局，而不是刚刚开始的故事。英雄出现，被反派评估：「这是当前的天命之子。能力评估如下。可利用弱点：以下几点。」

第一幕的核心成就：读者理解了反派的运作架构，英雄对反派毫无真实认知，至少两个棋局已经可见运转，而读者知道第三个棋局是隐形的。

**第二幕前半：计划推进期**

计划开始产生成果。英雄感知到威胁但错误地识别了来源。双方发生第一次实质性对抗——反派表面上输了，或者赢得太彻底以至于看起来根本不像对抗。

关键节拍：英雄的「胜利」实际上是反派设计好的。这是读者回报开始兑现的时刻：眼看英雄庆祝一场被反派当作礼物送出去的胜利。

**第二幕后半：拉锯期**

英雄开始接近真相。一个重要的意外变量出现——最好的意外变量是某个有自己议程的角色，其议程与英雄和反派的计划都有交叉，而双方都没有完全预见。反派被迫展示读者此前未见的能力。计划需要真正的修改，而非小幅调整。

这一阶段的任务：证明反派的能力不依赖于一切顺利——当事情变糟时他们仍然赢，因为他们为事情变糟做好了准备。

**第三幕：终局博弈**

双方对彼此的信息趋于对等。最终对抗是英雄的结构性优势（天命、预言、正义盟友、叙事规律对英雄主义的偏袒）对反派的准备、智识和行动意愿之间的最终博弈。

最佳结局设计：反派的最后一步棋在第一幕开始之前就已经布置好，读者可以回溯整本书，看到每一个棋子是在哪里放下的。

---

### 关键剧情要素

**信息不对称管理**

整本书的核心变量是「英雄知道多少」。这个变量由以下三类信息构成：
- 反派知道而英雄不知道的（操作优势）
- 英雄知道而反派不知道的（风险监控）
- 双方都不知道的（真正的意外，无法完全计划的部分）

最有效的剧情结构：第一类减少（英雄逐渐学习），第三类产生真正的复杂化，迫使双方即兴应对。

**计划变动节点**

必须有 2-3 个点，反派的计划遇到真正的意外而非预期内的阻碍。每一次变动都应当揭示反派此前未显现的能力——计划变动节点是「聪明角色证明聪明不是台词而是行动」的时刻。

**假胜利陷阱**

英雄至少有一次「以为自己赢了」然后发现被利用的时刻。这是类型最强的快感之一。设计要点：揭示应该通过反派视角发生，反派冷静地观察英雄的庆祝——「正如预期，他们找到了我留给他们找的东西」。

**终局揭示**

反派真实目的的完整揭示，重新解读此前所有行动。最佳揭示至少重新解读三件此前读者认为是失败、错误或次要事件的事情。

---

### 常见错误

1. **反派等待英雄**：反派在战略上始终是主动方，即便在身体上处于守势也在战略上进攻
2. **意外过多或过少**：过多意外让反派看起来没有真正计划过；过少让故事缺乏真实张力
3. **假胜利缺乏铺垫**：英雄被利用的那一刻需要提前埋下反派的意图线索
4. **终局揭示只是解释**：揭示应该重新解读，而不只是说明——让英雄或读者自己拼凑出真相
5. **信息不对称崩塌太早**：英雄太早掌握太多真相，后半程失去驱动力',

  '## Plot Generation — The Villainous Lead

The Villainous Lead plot engine runs on the management of information asymmetry. The villain protagonist begins with significant information advantage over the hero. The story is the process by which that advantage is maintained, threatened, partially lost, and the villain adapts. The resolution is not necessarily "villain wins" but "villain played at the highest level the situation allowed."

---

### The Information Asymmetry Engine

The fundamental plot mechanism of this genre: the reader knows approximately what the villain knows; the hero operates on significantly less information; the dramatic question is not "what will happen" (we know the villain''s plan) but "can the hero figure it out in time, and can the villain adapt when they get close."

Three categories of information for tracking:
- What the villain knows that the hero doesn''t (operational advantage)
- What the hero knows that the villain doesn''t (risk monitoring)
- What neither knows (the genuine wild cards that neither can fully plan for)

The most effective plot structure: Category 1 decreases as the hero learns more; Category 3 produces the actual complications that force both sides to improvise. Category 2 is the villain''s ongoing monitoring task — the villain should be actively tracking what the hero has figured out, not passively unaware of the hero''s progress.

---

### Act Structure

**Act One — The Board is Set**

The villain is already in motion. The reader enters a game that has been in progress, not one that is beginning. The hero appears and is assessed: "This is the current chosen hero. These are their capabilities. These are the exploitable elements in their profile."

Key Act One achievement: the reader understands the villain''s operational architecture, the hero has no real picture of the villain, and at least two schemes are visibly in motion while the reader knows a third is invisible. By the end of Act One, the reader should know the villain''s goal, the villain''s method, and at least one structural vulnerability in the hero that the villain intends to exploit.

**Act Two A — Execution and Adjustment**

The plan produces results. The hero responds to visible effects without understanding causes. A first significant confrontation occurs that the villain appears to lose — or wins so completely that it doesn''t look like a confrontation at all.

Key beat: the hero''s "victory" that was actually designed. This is where the reader''s payoff begins: watching the hero celebrate a win that was the villain''s gift. The reveal of this design should happen through the villain''s internal perspective, with minimal dramatic emphasis — the villain notes the outcome was as expected and moves to the next calculation.

**Act Two B — The Pressure Test**

The hero gets closer to the truth. A significant unexpected variable appears — the best unexpected variable is a character who has their own agenda that intersects with both the hero''s and villain''s plans in ways neither fully anticipated.

The villain is forced to show capabilities the reader hasn''t seen before. The plan requires genuine modification, not just minor adjustment. This is the act where the villain demonstrates that their competence is not contingent on everything going right — they win even when things go wrong, because they planned for things going wrong.

The key dramatic question of Act Two B: is the villain''s adaptation to unexpected complications as precise as their original planning? The answer should be yes, but demonstrated through action rather than assertion.

**Act Three — The Endgame**

Both parties have approximately symmetric information about each other. The final confrontation is between the hero''s structural advantages (divine favor, prophecy, righteous allies, the narrative tendency of these worlds to reward heroism) and the villain''s preparation, intelligence, and willingness to use methods the hero won''t.

The best resolution: the villain''s final move was prepared before Act One began, and the reader can trace back through the entire book to see where each element was placed. Even if the villain loses physically, the reader should feel that the villain was never truly reactive — every position the villain occupied, including the final one, was chosen.

---

### Key Plot Elements

**The False Victory**

At least once, the hero must believe they have won — caught the villain, exposed the plan, saved the victim — and the reader must watch this apparent victory be revealed as exactly what the villain needed.

Design principles:
- The reveal should happen through the villain''s perspective, where the villain observes the hero''s celebration with dispassionate assessment
- The reader should be able to look back and see the groundwork for this false victory in earlier scenes
- The hero''s actions that produced the "victory" should have been anticipated and accounted for by the villain''s plan
- The emotional register of the reveal: not triumph, but confirmation — the villain is not surprised, because they planned for this

**The Plan Disruption Nodes**

2-3 points where the plan encounters genuine surprise rather than anticipated resistance. Each disruption should reveal capabilities the villain hadn''t previously shown. These are the moments that prove the villain''s competence isn''t contingent on a static environment.

The disruption''s narrative function: it prevents the story from feeling like watching a predetermined outcome. Even readers who trust the villain needs to feel the genuine possibility of failure — not because the villain is actually in danger, but because the situation is genuinely complex enough that the villain''s response is interesting rather than automatic.

**The Final Reveal**

The Villainous Lead''s terminal plot device: the full scope of the villain''s actual plan is revealed, retroactively recontextualizing actions that seemed like setbacks, mistakes, or secondary concerns.

The best reveals:
- Recontextualize a minimum of three earlier events the reader interpreted differently at the time
- Are triggered by the hero arriving at a partial correct conclusion, with the villain confirming rather than explaining
- Use the villain''s own earlier words — dialogue from Act One that meant one thing in context and means something different now
- Don''t require a monologue: the strongest reveals are implications, not explanations

---

### Common Errors

1. **The Villain Waits:** The villain should be strategically offensive at all times, even when physically defensive. A villain who waits for the hero to act is a passive villain — and passive villains don''t deserve the genre''s central position.

2. **Too Many or Too Few Surprises:** Too many genuine surprises suggests the villain never had a real plan; too few creates a predetermined feeling that removes genuine tension.

3. **Unearned False Victory:** The hero being used requires prior groundwork — the villain''s intent must be traceable backward from the reveal.

4. **Reveal as Explanation Only:** The final reveal should recontextualize, not merely explain. Let the hero or reader do the work of reconstruction. If the villain is explaining, they''re doing too much.

5. **Information Asymmetry Collapsing Too Early:** If the hero achieves rough parity with the villain too early, the story loses its central engine. The asymmetry should decrease gradually and partially, not collapse.',

  (SELECT id FROM novel_creation_method WHERE name = 'The Villainous Lead' LIMIT 1),
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
