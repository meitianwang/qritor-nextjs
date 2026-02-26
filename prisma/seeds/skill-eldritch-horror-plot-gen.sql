-- The Eldritch Horror Novel "Plot Generation" skill (Layer 3)
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Eldritch Horror Novel' LIMIT 1)
-- Usage: mysql -u <user> -p <database> < skill-eldritch-horror-plot-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'eldritch-horror-plot-gen',
  '剧情生成：为 The Eldritch Horror Novel 提供剧情推进指导，围绕知识-代价螺旋、理智侵蚀与宇宙力量面前的人类应对设计故事弧线',
  'Plot generation: plot progression guidance for The Eldritch Horror Novel, centered on the knowledge-cost spiral, sanity erosion, and human response to cosmic forces',
  '## 剧情生成 — The Eldritch Horror Novel

洛夫克拉夫特式剧情的核心结构是**知识-代价螺旋**：每一步深入都揭示更多真相，同时付出更多代价（理智、人际关系、身份认同）。读者的满足感不来自英雄胜利，而来自见证人类在宇宙面前的渺小与韧性。

---

### 三幕结构变体

| 阶段 | 占比 | 核心任务 | 典型事件 |
|------|------|---------|---------|
| **第一幕：异常发现期** | 15-20% | 发现无法用理性解释的异常，初次接触禁忌知识 | 环境异常 + 初次理智损耗 |
| **第二幕前半：深入探究期** | 25-30% | 知识积累，能力增长，代价初现 | 部分真相揭示 + 人际关系松动 |
| **第二幕后半：不可逆转期** | 20-25% | 意识到无法回头，代价急剧加重 | 与邪典全面冲突 + 重大损失 |
| **第三幕：抉择与代价期** | 20-25% | 用禁忌知识完成目标，付出永久代价 | 直面实体 + 幸存的代价 |

**节奏特点**：不是"英雄胜利"而是"以某种形式幸存，但幸存的代价彻底改变了幸存者"。

---

### 知识-代价螺旋设计

每次知识获取节点必须设计对应的代价：

| 知识层级 | 代价类型 | 不可逆程度 |
|---------|---------|----------|
| 初级异常线索 | 轻微困惑，睡眠质量下降 | 可逆 |
| 禁忌文本接触 | 具体理智损耗事件，关系开始疏远 | 部分可逆 |
| 实体存在确认 | 世界观崩溃，无法回归日常生活 | 基本不可逆 |
| 实体直接接触 | 永久性理智/身份/能力改变 | 完全不可逆 |

---

### 关键剧情节点

1. **第一异常**：现实出现第一道裂缝，感觉「不对」但无法证明
2. **初次知识接触**：获取禁忌知识，感觉是成就，代价尚未显现
3. **第一理智事件**：具体、可见、无法合理化解释的理智损耗
4. **间接实体证据**：实体存在的痕迹，但主角不确定是否是自己想象
5. **真实规模揭示**：理解实体的真正性质——不是强力怪物而是根本不同的存在类别
6. **不可返回点**：在技术上还能撤退时选择继续
7. **直接实体遭遇**：完整或部分接触，主角无论如何都被改变
8. **终局对决**：用所有积累的知识达成最终目标

---

### 结局类型

洛夫克拉夫特式结局不等于"坏结局"，而是**代价永久的幸存**：

- **代价幸存**：活着，但所付代价彻底改变了主角
- **惨胜**：直接威胁被遏制，但更大的真相（实体永远存在）依然成立
- **悲剧妥协**：通过成为自己不想成为的东西实现目标
- **苦涩理解**：无法阻止即将到来的事，但现在清晰地理解了它

---

### 常见错误

1. 把实体设计成"可以被打败的终极Boss"——破坏宇宙恐惧核心
2. 过度解释恐惧来源——一旦完全说清楚，恐惧消失
3. 快速解决和逃脱——压抑感需要时间积累
4. 使用英雄主义叙事框架——主角是在求生，不是在拯救世界
5. 理智损耗没有具体可见的后果',
  '## Plot Generation — The Eldritch Horror Novel

The structural engine of cosmic horror fiction is the **knowledge-cost spiral**: each step deeper into understanding brings both capability and destruction. Unlike traditional adventure plots where the hero gains power without proportional loss, the Lovecraftian protagonist trades pieces of themselves for each revelation.

---

### The Spiral Structure

**Phase 1 — Anomaly (Act One)**: The protagonist encounters something that does not fit their model of reality. Crucially, the anomaly is NOT immediately terrifying — it is puzzling, wrong, slightly off. The horror at this stage is subtle: a door that should not exist, a record that has been deliberately destroyed, a person who seems to be afraid of something they cannot name. The protagonist is drawn in by competence (their investigative drive) rather than pushed in by threat.

By the end of Act One: the protagonist has begun to suspect they are dealing with something outside their existing understanding, has taken their first step into forbidden knowledge (acquiring a text, learning a name, accessing a location), and has experienced their first minor but unambiguous sanity impact.

**Phase 2A — Descent (Act Two, first half)**: The protagonist pursues knowledge aggressively because they believe that understanding will lead to solution. Every answer generates two new questions. The knowledge is useful — they ARE able to accomplish things they could not before. The cost is also real but manageable. Relationships begin to fray (others notice the protagonist is changing). The protagonist rationalizes: "I can handle this." A major revelation occurs that makes the protagonist understand the true scale of what they are dealing with — and they continue anyway.

**Phase 2B — The Point of No Return (Act Two, second half)**: The protagonist realizes they cannot return to ordinary life — the knowledge makes ordinary life impossible. Two things happen simultaneously: their capabilities peak (they are most effective at dealing with the entities here) and their cost acceleration begins (each additional revelation costs more than the last). The antagonist forces (cult, entity influence, transformed individuals) press harder. The protagonist must make choices that would have been unthinkable in Act One. At least one significant loss occurs that cannot be recovered.

**Phase 3 — Resolution and Cost (Act Three)**: The protagonist uses everything they have learned to achieve their goal — stopping the summoning, exposing the cult, surviving the entity''s attention, preventing a specific catastrophe. They succeed, or partially succeed, or fail in a way that limits the damage. But the resolution is not a return — there is no return. The cost is permanent.

---

### The Knowledge-Cost Spiral Design

Every knowledge acquisition node must be designed with a corresponding cost:

| Knowledge Level | Cost Type | Reversibility |
|----------------|-----------|---------------|
| Initial anomaly clues | Mild confusion, sleep disruption | Reversible |
| Forbidden text contact | Concrete sanity event, relationships begin to fray | Partially reversible |
| Entity existence confirmed | Worldview collapse, inability to return to normal life | Largely irreversible |
| Direct entity contact | Permanent change to sanity / identity / capability | Completely irreversible |

---

### Key Plot Beats

- *First Anomaly*: The moment reality first shows its seam. Should feel wrong but not obviously supernatural.
- *First Knowledge Contact*: Acquiring the first piece of forbidden knowledge. Should feel like accomplishment before the cost becomes clear.
- *First Sanity Event*: The first visible, concrete sanity loss. Small but undeniable. The protagonist cannot rationalize it away.
- *First Entity Contact*: Indirect initially (evidence of its passage, effects of its presence). The protagonist is not sure they are not imagining it.
- *The True Scale Revelation*: Understanding what the entity actually is — not a powerful monster but a fundamentally different category of existence. This is where most characters break.
- *The Point of No Return*: The choice to continue when retreat is still technically possible.
- *Direct Entity Encounter*: Full or partial direct contact. Almost never survivable at full sanity. The protagonist is changed by this moment regardless of what happens next.
- *Resolution Confrontation*: The protagonist uses everything they have to achieve their terminal goal.

---

### Resolution Types

What constitutes a satisfying Lovecraftian resolution (NOT the same as a happy ending):

- **Survival at cost**: The protagonist is alive. What they are now is different from what they were, but they are alive and functional. The survival itself feels like a kind of loss.
- **Pyrrhic victory**: The immediate threat is contained or diminished, but the larger truth (the entities exist, will always exist, and humanity''s safety is provisional at best) remains unchanged.
- **Tragic compromise**: The protagonist achieves their goal by becoming something they would not have wanted to become. The victory validates their methods while condemning them.
- **Bitter understanding**: The protagonist cannot stop what is coming, but they understand it clearly now. The knowledge is the only thing they have left, and it is a burden, not a reward.

---

### Common Mistakes

1. **Designing the entity as a defeatable final boss** — this destroys the cosmic dread. The entity is not a monster; it is a category of existence. You do not defeat it; at best, you survive its attention.
2. **Over-explaining the horror source** — the moment the horror is fully explained, the fear evaporates. The most terrifying thing is what the reader''s imagination generates in the space of what is NOT described.
3. **Fast resolution and escape** — suffocating atmosphere requires time to accumulate. Do not let the protagonist solve the problem in a single clever move.
4. **Applying a heroic narrative framework** — the protagonist is surviving, not saving the world. The scale of the cosmic entities means no individual human action "defeats" anything.
5. **Sanity loss without visible, concrete consequences** — sanity deterioration must be shown through specific behavioral, perceptual, and relational changes. "They felt scared" is not a sanity event.',

  (SELECT id FROM novel_creation_method WHERE name = 'The Eldritch Horror Novel' LIMIT 1),
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
