-- The Eldritch Horror Novel "Narrative Writing" skill (Layer 3)
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Eldritch Horror Novel' LIMIT 1)
-- Usage: mysql -u <user> -p <database> < skill-eldritch-horror-narrative.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'eldritch-horror-narrative',
  '叙事写作专项指导：为 The Eldritch Horror Novel 提供洛夫克拉夫特式叙事美学、恐惧渲染技巧、压抑窒息氛围的写作全面指导',
  'Narrative writing guidance: comprehensive guidance for The Eldritch Horror Novel covering Lovecraftian narrative aesthetics, dread rendering techniques, and the craft of suffocating atmosphere',
  '## 叙事写作专项指导 — The Eldritch Horror Novel

洛夫克拉夫特式叙事的核心原则：**恐惧是暗示出来的，不是描述出来的**。一旦你完整描述了恐惧——给它形状、大小、物理逻辑——你就已经败了。人类的想象力，在被引导到正确的门槛又被拒绝看到全貌时，会生成比任何描述都更可怕的东西。

---

### 三层恐惧叠加结构

**第一层：表面异常**（贯穿全篇）

持续低级别的不对感——读者在理解其含义之前就接受它为背景。技法：不合逻辑的感官细节（角度错误的阴影、没有来源的声音）、人和动物的行为异常、环境不一致（天气模式、生物、建筑）。即使没有明显超自然现象发生的场景，这一层也应该存在。

**第二层：不可知性**（递进式）

揭示正在发生的事情无法被纳入正常理解范畴。技法：互相矛盾的描述、叙述者无法调和的观察、相互一致但不符合任何物理模型的现象。当主角开始理解实体时，那种理解应该感觉像是损失而非收获。

**第三层：存在主义冲击**（高潮式）

主角（和读者）必须吸收这些知识对世界观的真正影响。技法：对比（现在知道这些之后，普通生活看起来是什么样子）、暗示（这不只影响当下情况，而是影响一切）、孤立（主角现在知道一些无法与任何没有亲历过的人分享的事情）。

---

### 核心写作技法

**氛围积累**：每个散文选择都应该为氛围做贡献。这不是装饰性描述——它是承重的。读者应该在注意到单个描述之前就感受到氛围。

**不可靠叙述**：叙述者的可靠性应该随故事推进而衰减。技法：叙述者坚持对明显不正常的事情给出正常解释；描述随理智损耗变得更不一致、更矛盾；回溯式叙述暗示叙述者幸存了但被改变了；现在时态的感知不确定时刻。

**写实体的技法**：永远不要完整描述实体。使用：
- 边缘感知（「我感知到视野边缘有什么东西...」）
- 矛盾印象（「它同时非常近又不可能地远」）
- 叙述者的心智拒绝接受信息（「我现在——即使现在——也无法让自己描述我看到的东西」）
- 间接证据（见过它的人之后做了什么，它离开后空间看起来什么样）
- 声音、气味、温度作为主要感官通道，而非视觉

**理智退化的散文**：随着叙述者理智的侵蚀，散文本身应该改变。句子结构变得更碎片化；从过去时转变为现在时；对事件的不当情绪反应；叙述中承认无法或不愿描述某事的空白。

**节奏控制**：洛夫克拉夫特式节奏比 grimdark 慢。以问题结束章节而非回答问题；将揭示延迟为更令人不安的背景；调查的节奏——研究、部分答案、新问题、更可怕的背景。

---

### 写作禁区

1. 给实体一个人类可以理解并支持或反对的动机
2. 让主角在物理对抗中击败实体（它不是Boss怪）
3. 完全解释恐惧（一旦完全解释，宇宙恐惧消失）
4. 写出完全充满希望的结局（幸存是最好情况）
5. 把实体当作善恶框架中的简单反派（它们不是邪恶的——它们是漠不关心的，这更糟糕）',
  '## Narrative Writing Guidance — The Eldritch Horror Novel

The foundational principle of Lovecraftian narrative: **fear is suggested, never described.** The moment you describe the horror explicitly — give it a shape, a size, a physical logic — you have already defeated yourself. Human imagination, when directed toward the right threshold and denied the full picture, will generate something far more terrifying than any description can provide.

---

### The Three-Layer Dread Structure

**Layer 1 — Surface Wrongness (Throughout)**: The constant low-level wrongness that the reader accepts as background before understanding its significance. Techniques: sensory details that don''t add up (shadows at wrong angles, sounds without identifiable sources), behavioral anomalies in people and animals, environmental inconsistencies (weather patterns, biology, architecture). This layer should be present in every scene even when nothing overtly supernatural is happening. The reader should feel uneasy before they understand why.

**Layer 2 — Incomprehensibility (Escalating)**: The revelation that whatever is happening cannot be contained within normal categories of understanding. Techniques: descriptions that contradict themselves, observations that the narrator cannot reconcile with their existing understanding, phenomena that are consistent with each other but not with any coherent physical model. When the protagonist starts to understand the entities, that understanding should feel like loss rather than gain — knowing what this is does not make it less terrifying; it makes it more.

**Layer 3 — Existential Impact (Climactic)**: The moment the protagonist (and reader) must absorb what the knowledge actually means for their model of reality and their place in it. This is the hardest layer to write and the most important. Techniques: contrast (showing what the protagonist''s ordinary life looks like now that they know what they know), implication (the knowledge doesn''t just affect this situation — it affects everything), isolation (the protagonist now knows something that cannot be shared with anyone who hasn''t experienced it themselves).

---

### Core Narrative Techniques

**Atmosphere Building**: Every prose choice should contribute to the atmosphere. This is not decorative description — it is load-bearing. The wrong light quality in a room, the absence of birdsong in a forest, the unusual behavior of a normally friendly animal — each of these is doing atmospheric work. The skill is making this work invisible: the reader should feel the atmosphere before they notice they''ve been influenced by individual descriptions.

**Unreliable Narration**: The Lovecraftian narrator''s reliability should decay across the story.
- The narrator insisting on normal explanations for things the reader can see are not normal
- The narrator''s descriptions becoming less consistent and more contradictory as sanity erodes
- Retrospective narration ("I know now that what I was seeing was...") that suggests the narrator survived but was changed by the experience
- Present-tense moments of perceptual uncertainty ("I thought I saw...")
- The reader should end the story uncertain about which parts of the narrative were accurate

**Writing the Entities**: Never describe an entity fully. Use:
- *Partial perception*: "I perceived something at the edge of my vision that..." — the sentence trails into incompletion because the perception cannot be completed
- *Contradictory impressions*: "It was simultaneously very near and impossibly far" — the contradiction is not a stylistic error; it is the accurate description of something outside Euclidean space
- *The narrator''s mind rejecting the information*: "I cannot — even now — bring myself to describe what I saw" — the refusal to describe is itself a description
- *Secondary evidence*: What others who saw it did afterward, what the space looked like after its presence, what animals in the vicinity did during its passage
- *Sound, smell, temperature as primary channels rather than sight*: Vision is the most analytical sense; the other senses bypass analytical processing and create more direct dread
- *The effect rather than the thing itself*: Describe what seeing the entity does to the narrator''s mind, not what the entity looks like

**Sanity Deterioration in Prose**: As the narrator''s sanity erodes, the prose itself should change. Techniques:
- Sentence structure becoming more fragmented and less syntactically reliable
- A shift from past to present tense in moments of intensity — the narrator loses temporal distance from the memory
- Inappropriate emotional responses to events (the narrator noting something horrific with sudden calm, or something ordinary with sudden terror)
- Gaps in the narrative where the narrator acknowledges they cannot or will not describe something
- Retrospective passages becoming shorter and more cryptic as the story progresses
- Increasing use of hedging language ("I thought," "It seemed," "Perhaps") where earlier narration was confident

**Pacing**: Lovecraftian pacing is inherently slower than grimdark. The horror requires accumulation.
- Chapter endings that raise questions rather than answering them
- Scenes that seem to be about one thing but are actually establishing atmosphere for a later payoff
- Deliberate misdirection: scenes that seem like they will contain revelation but reveal only more wrongness
- The rhythm of investigation: research, followed by partial answer, followed by new question, followed by exponentially more disturbing context
- Resist the urge to accelerate toward horror — the horror that comes slowly is more devastating than the horror that arrives quickly

---

### Specific Scene-Writing Guidance

**Investigation Scenes**: These are the backbone of cosmic horror. The protagonist looks into something and finds answers that create larger questions. The key is that each answer should feel like a small victory followed immediately by the recognition that the victory has made things worse. The reader should feel the same oscillation as the protagonist: relief at finding an explanation, followed by dread at what the explanation implies.

**Entity Proximity Scenes**: Before the entity appears, the environment should register its presence first. Animals leave, sounds stop, light behaves incorrectly, the narrator''s thoughts become harder to track. When the entity is present, use negative space — describe what is NOT there, what is NOT visible, what the narrator''s mind refuses to process. The most effective entity scenes end before the full encounter: the narrator loses consciousness, looks away, or finds that their memory of the moment is already deteriorating.

**Aftermath Scenes**: The scenes after an entity encounter or major revelation are often the most important for horror effect. How does the protagonist move through ordinary space now? How does food taste, how does light feel, how do people''s faces register? The contrast between ordinary life and the new knowledge is where the existential horror lives.

**Dialogue in Cosmic Horror**: Characters who know things speak around what they know, not directly about it. The cult member who knows the truth does not explain the truth — they ask oblique questions, make references that imply a shared context the protagonist does not have, and become visibly uncomfortable when the conversation approaches certain topics. The horror in these conversations is in the gaps.

---

### What to Never Do

- **Give the entity a comprehensible motive**: An entity that wants power, territory, or revenge is a monster. An entity that simply is, and whose existence happens to be incompatible with human sanity, is cosmic horror. The distinction is everything.
- **Have the protagonist defeat the entity in a physical confrontation**: It is not a boss monster. Physical combat implies the protagonist and the entity are on the same scale of existence. They are not.
- **Explain the horror completely**: The moment it is fully explained, the cosmic dread evaporates. Mystery is the mechanism. Once the mechanism is exposed, it stops working.
- **Write a fully hopeful ending**: Survival is the best case; transcendence through loss is the other option. A protagonist who emerges from the encounter unchanged, fully victorious, and looking forward to a normal future has not experienced cosmic horror — they have experienced an adventure.
- **Use the entities as simple villains in a good-versus-evil framework**: They are not evil — they are indifferent, which is worse. Evil is a category that implies the entities care about humans enough to intend harm. Indifference means humans are not significant enough to harm intentionally. The horror of being beneath notice is greater than the horror of being hated.',

  (SELECT id FROM novel_creation_method WHERE name = 'The Eldritch Horror Novel' LIMIT 1),
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
