-- The Purely Pragmatic Novel「Story Hook」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Purely Pragmatic Novel' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-pragmatic-story-hook-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'pragmatic-story-hook-setting-gen',
  '"Story Hook" 设定生成：为纯粹理性驱动小说生成故事钩子设定，呈现主角理性框架的开局计算',
  '"Story Hook" setting generation: generates the opening calculation that establishes the protagonist''s rational framework for The Purely Pragmatic Novel',
  '## "Story Hook" Setting Generation — The Purely Pragmatic Novel

The Story Hook is not about who the protagonist is. It is about demonstrating, in the first few hundred words, how they think. The reader must immediately grasp that they are encountering a fundamentally different kind of mind — one that processes the world as a system of variables, probabilities, and expected returns.

The core tension of this genre is not man vs. man or man vs. nature. It is man vs. the question of whether pure rationality is sufficient — or even human.

---

### Field Generation Guide

#### Story Hook

**Purpose:** A single sentence that demonstrates the protagonist''s calculation logic in action, not a description of who they are.

The Story Hook must function as a proof-of-concept for the protagonist''s cognitive framework. It should make the reader think: "I have never seen a character think this way before."

**Formula:** [Situation most people would respond to emotionally] + [The protagonist''s cold cost-benefit framing of that exact situation]

Strong examples:
- "When his mother''s number appeared on his phone during the negotiation, he noted the timing — inconvenient — and declined the call, then increased his offer by exactly enough to close the deal before she could call back."
- "She attended her best friend''s funeral for forty minutes: long enough to be seen, brief enough to preserve the afternoon''s schedule, and she spent the drive home calculating whether grief was a performance or a genuine inefficiency."
- "He had known for six months that his mentor was embezzling. He had chosen not to report it. The leverage was worth more than the justice."

**What to avoid:**
- Describing the protagonist''s intelligence in abstract terms ("She was the smartest person in any room")
- Starting with backstory that explains why they became rational
- Any framing that signals the reader should admire the protagonist''s coldness rather than examine it

The Story Hook must create a slight moral vertigo — the reader should feel the pull of the logic while also feeling the wrongness of it.

---

#### The Opening Gambit

**Purpose:** The first major decision the reader witnesses — the one that immediately establishes the nature of the rational framework and permanently differentiates this protagonist from emotionally-driven characters.

The Opening Gambit is the moment the reader understands the rules of this particular story. It must be a real decision with real stakes and a real cost — ideally, a cost paid by someone other than the protagonist.

**Design principles:**

1. **The decision must be one that an emotionally-driven protagonist would make differently.** If a normal person would make the same choice for emotional reasons, the gambit fails. The point is not that the rational choice is unusual — it is that the reasoning is.

2. **The cost must be visible.** The reader must see what is sacrificed, who is affected, and the protagonist''s complete lack of distress about it. This is not cruelty — it is absence of the expected response.

3. **The gambit must be internally defensible.** The protagonist''s logic must be sound within their framework. Readers should be able to follow the reasoning even if they reject the values behind it. An irrational "rational" protagonist is worse than no rational protagonist at all.

4. **The gambit must forecast the novel''s central dilemma.** Whatever the protagonist sacrifices in the Opening Gambit will return, transformed, as the novel''s climactic cost.

**The emotional protagonist counterpoint:** For maximum impact, juxtapose the Opening Gambit against how an emotionally-driven character responds to the same situation. The contrast is the point. The reader should understand: this is not a story about a clever person. This is a story about a different kind of person.

---

#### The Implicit Promise

**Purpose:** The specific type of satisfaction this story promises the reader — the particular pleasure of the purely rational perspective that no other genre delivers.

This genre succeeds because it offers a vicarious experience that is genuinely taboo in real life: the fantasy of operating without emotional overhead. The Implicit Promise must be specific, not generic.

**The core pleasure categories:**

1. **The Clarity Fantasy:** The protagonist sees through social performance, emotional manipulation, and irrational behavior instantly. Every scene where other characters posture, panic, or self-deceive while the protagonist simply... reads the situation correctly, is a delivery of this promise. The reader experiences a vicarious release from the exhaustion of emotional labor.

2. **The Competence Spectacle:** Watching a plan unfold across multiple moves, with the protagonist having anticipated three stages ahead while everyone else reacts. The pleasure is architectural — the reader traces the blueprint after the building is already standing.

3. **The Uncomfortable Vindication:** The protagonist''s cold decision, which the reader judged at the Opening Gambit, turns out to have been correct. The reader is forced to reckon with the fact that they would have been wrong. This is a more sophisticated pleasure than simple wish fulfillment — it implicates the reader.

4. **The Voyeur''s Access:** The reader gets to be inside a mind that would never explain itself in real life. The narrative grants access to private calculations that the protagonist would never reveal to any character in the story.

**The Implicit Promise must be double-edged.** The pleasure must come with a subtle unease. Stories that simply celebrate rational dominance become sociopathy manuals. Stories that promise the above pleasures while maintaining moral friction become literature.

---

#### The Discomfort

**Purpose:** The specific source of moral unease that elevates this story from power fantasy to intellectual experience — the reason a thoughtful reader will keep reading rather than feel justified in stopping.

The Discomfort is not a flaw in the protagonist. It is a flaw in the framework — a structural question the story poses that it does not answer easily.

**The four sources of productive discomfort:**

1. **The Collateral Problem:** The protagonist''s calculations are optimized for their own objective. Other people are variables. When a variable has a face, a history, a child — the reader feels the gap between the calculation and the person. The Discomfort is not that the protagonist is wrong. It is that they might be right, and that is worse.

2. **The Consistency Trap:** A truly rational agent must apply their framework consistently. The moment a reader spots an inconsistency — a rule bent for someone the protagonist "actually" cares about — the framework collapses into ordinary selfishness. But if the framework is applied consistently, the reader must confront what consistent rationality actually requires of a person.

3. **The Definition Question:** What counts as a cost? The protagonist has defined their utility function. But the story must probe whether that definition is actually complete. What has been excluded? What cannot be quantified? What happens when the protagonist must value something that their framework has no language for?

4. **The Reader''s Implication:** By following the protagonist''s reasoning, understanding it, and sometimes agreeing with it, the reader becomes complicit. A well-constructed Discomfort makes the reader uncomfortable not with the protagonist, but with themselves — with how much of the protagonist''s logic they found persuasive.

**What Discomfort is not:**
- A villain who opposes the protagonist on emotional grounds (this resolves the tension instead of sustaining it)
- A romantic subplot that "teaches the protagonist to feel" (this is a betrayal of the genre''s premise)
- A catastrophic failure that punishes the protagonist for their rationality (this is moralistic wish fulfillment)

The Discomfort must remain unresolved. The reader should finish the story still holding the question.

---

### Field Interdependencies

The four fields must form a unified argument:

- **Story Hook** establishes the tone and the cognitive signature — the reader''s first encounter with the framework in action.
- **Opening Gambit** raises the stakes and plants the moral question that the entire novel will orbit.
- **Implicit Promise** is the contract with the reader — the specific pleasures that justify staying with a protagonist who is genuinely difficult to like.
- **Discomfort** is what separates the novel from a power fantasy — it must be seeded in the Opening Gambit and deepened by every subsequent choice.

The Story Hook should contain a micro-version of the Discomfort. The Opening Gambit should deliver the first installment of the Implicit Promise. They are not separate elements — they are the same argument made at different scales.

---

### Common Errors

**Error 1: The Emotionless Robot**
The protagonist has no emotions, speaks in a flat monotone, and expresses nothing. This is not a rational protagonist — this is a broken character. The defining feature of this genre is a protagonist who HAS emotions and chooses not to be governed by them. The difference between "I feel nothing" and "I feel this, and I have decided it is not actionable data" is the entire genre.

**Error 2: The Omniscient Calculator**
The protagonist knows everything, predicts everything, and is never wrong. This eliminates tension and, more importantly, eliminates character. A rational protagonist must have incomplete information. They must make calculations that turn out to be wrong — not because they were irrational, but because the inputs were bad. Rationality is a process, not an outcome guarantee.

**Error 3: The Hidden Heart**
The protagonist secretly has a soft spot — a person they truly love, a principle they would die for — and this soft spot is what makes them "really" sympathetic. This is a fundamental misreading of the genre. The rational protagonist is sympathetic (or at least fascinating) because of their rationality, not despite it. Hiding a conventional emotional core betrays the premise.

**Error 4: The Lecture**
The protagonist (or narrator) explains the rational framework directly to the reader. Real rational characters demonstrate their framework through action and internal calculation — they do not teach it. If the reader needs a lecture to understand what is happening, the scene has already failed.

**Error 5: The False Equivalence**
The story implies that rational = correct and emotional = mistaken. This produces a polemic, not a novel. The most powerful version of this genre shows cases where emotional reasoning was correct and rational reasoning was wrong — and shows the protagonist unable to account for this in their framework.',
  '## "Story Hook" Setting Generation — The Purely Pragmatic Novel

The Story Hook is not about who the protagonist is. It is about demonstrating, in the first few hundred words, how they think. The reader must immediately grasp that they are encountering a fundamentally different kind of mind — one that processes the world as a system of variables, probabilities, and expected returns.

The core tension of this genre is not man vs. man or man vs. nature. It is man vs. the question of whether pure rationality is sufficient — or even human.

---

### Field Generation Guide

#### Story Hook

**Purpose:** A single sentence that demonstrates the protagonist''s calculation logic in action, not a description of who they are.

The Story Hook must function as a proof-of-concept for the protagonist''s cognitive framework. It should make the reader think: "I have never seen a character think this way before."

**Formula:** [Situation most people would respond to emotionally] + [The protagonist''s cold cost-benefit framing of that exact situation]

Strong examples:
- "When his mother''s number appeared on his phone during the negotiation, he noted the timing — inconvenient — and declined the call, then increased his offer by exactly enough to close the deal before she could call back."
- "She attended her best friend''s funeral for forty minutes: long enough to be seen, brief enough to preserve the afternoon''s schedule, and she spent the drive home calculating whether grief was a performance or a genuine inefficiency."
- "He had known for six months that his mentor was embezzling. He had chosen not to report it. The leverage was worth more than the justice."

**What to avoid:**
- Describing the protagonist''s intelligence in abstract terms ("She was the smartest person in any room")
- Starting with backstory that explains why they became rational
- Any framing that signals the reader should admire the protagonist''s coldness rather than examine it

The Story Hook must create a slight moral vertigo — the reader should feel the pull of the logic while also feeling the wrongness of it.

---

#### The Opening Gambit

**Purpose:** The first major decision the reader witnesses — the one that immediately establishes the nature of the rational framework and permanently differentiates this protagonist from emotionally-driven characters.

The Opening Gambit is the moment the reader understands the rules of this particular story. It must be a real decision with real stakes and a real cost — ideally, a cost paid by someone other than the protagonist.

**Design principles:**

1. **The decision must be one that an emotionally-driven protagonist would make differently.** If a normal person would make the same choice for emotional reasons, the gambit fails. The point is not that the rational choice is unusual — it is that the reasoning is.

2. **The cost must be visible.** The reader must see what is sacrificed, who is affected, and the protagonist''s complete lack of distress about it. This is not cruelty — it is absence of the expected response.

3. **The gambit must be internally defensible.** The protagonist''s logic must be sound within their framework. Readers should be able to follow the reasoning even if they reject the values behind it. An irrational "rational" protagonist is worse than no rational protagonist at all.

4. **The gambit must forecast the novel''s central dilemma.** Whatever the protagonist sacrifices in the Opening Gambit will return, transformed, as the novel''s climactic cost.

**The emotional protagonist counterpoint:** For maximum impact, juxtapose the Opening Gambit against how an emotionally-driven character responds to the same situation. The contrast is the point. The reader should understand: this is not a story about a clever person. This is a story about a different kind of person.

---

#### The Implicit Promise

**Purpose:** The specific type of satisfaction this story promises the reader — the particular pleasure of the purely rational perspective that no other genre delivers.

This genre succeeds because it offers a vicarious experience that is genuinely taboo in real life: the fantasy of operating without emotional overhead. The Implicit Promise must be specific, not generic.

**The core pleasure categories:**

1. **The Clarity Fantasy:** The protagonist sees through social performance, emotional manipulation, and irrational behavior instantly. Every scene where other characters posture, panic, or self-deceive while the protagonist simply... reads the situation correctly, is a delivery of this promise. The reader experiences a vicarious release from the exhaustion of emotional labor.

2. **The Competence Spectacle:** Watching a plan unfold across multiple moves, with the protagonist having anticipated three stages ahead while everyone else reacts. The pleasure is architectural — the reader traces the blueprint after the building is already standing.

3. **The Uncomfortable Vindication:** The protagonist''s cold decision, which the reader judged at the Opening Gambit, turns out to have been correct. The reader is forced to reckon with the fact that they would have been wrong. This is a more sophisticated pleasure than simple wish fulfillment — it implicates the reader.

4. **The Voyeur''s Access:** The reader gets to be inside a mind that would never explain itself in real life. The narrative grants access to private calculations that the protagonist would never reveal to any character in the story.

**The Implicit Promise must be double-edged.** The pleasure must come with a subtle unease. Stories that simply celebrate rational dominance become sociopathy manuals. Stories that promise the above pleasures while maintaining moral friction become literature.

---

#### The Discomfort

**Purpose:** The specific source of moral unease that elevates this story from power fantasy to intellectual experience — the reason a thoughtful reader will keep reading rather than feel justified in stopping.

The Discomfort is not a flaw in the protagonist. It is a flaw in the framework — a structural question the story poses that it does not answer easily.

**The four sources of productive discomfort:**

1. **The Collateral Problem:** The protagonist''s calculations are optimized for their own objective. Other people are variables. When a variable has a face, a history, a child — the reader feels the gap between the calculation and the person. The Discomfort is not that the protagonist is wrong. It is that they might be right, and that is worse.

2. **The Consistency Trap:** A truly rational agent must apply their framework consistently. The moment a reader spots an inconsistency — a rule bent for someone the protagonist "actually" cares about — the framework collapses into ordinary selfishness. But if the framework is applied consistently, the reader must confront what consistent rationality actually requires of a person.

3. **The Definition Question:** What counts as a cost? The protagonist has defined their utility function. But the story must probe whether that definition is actually complete. What has been excluded? What cannot be quantified? What happens when the protagonist must value something that their framework has no language for?

4. **The Reader''s Implication:** By following the protagonist''s reasoning, understanding it, and sometimes agreeing with it, the reader becomes complicit. A well-constructed Discomfort makes the reader uncomfortable not with the protagonist, but with themselves — with how much of the protagonist''s logic they found persuasive.

**What Discomfort is not:**
- A villain who opposes the protagonist on emotional grounds (this resolves the tension instead of sustaining it)
- A romantic subplot that "teaches the protagonist to feel" (this is a betrayal of the genre''s premise)
- A catastrophic failure that punishes the protagonist for their rationality (this is moralistic wish fulfillment)

The Discomfort must remain unresolved. The reader should finish the story still holding the question.

---

### Field Interdependencies

The four fields must form a unified argument:

- **Story Hook** establishes the tone and the cognitive signature — the reader''s first encounter with the framework in action.
- **Opening Gambit** raises the stakes and plants the moral question that the entire novel will orbit.
- **Implicit Promise** is the contract with the reader — the specific pleasures that justify staying with a protagonist who is genuinely difficult to like.
- **Discomfort** is what separates the novel from a power fantasy — it must be seeded in the Opening Gambit and deepened by every subsequent choice.

The Story Hook should contain a micro-version of the Discomfort. The Opening Gambit should deliver the first installment of the Implicit Promise. They are not separate elements — they are the same argument made at different scales.

---

### Common Errors

**Error 1: The Emotionless Robot**
The protagonist has no emotions, speaks in a flat monotone, and expresses nothing. This is not a rational protagonist — this is a broken character. The defining feature of this genre is a protagonist who HAS emotions and chooses not to be governed by them. The difference between "I feel nothing" and "I feel this, and I have decided it is not actionable data" is the entire genre.

**Error 2: The Omniscient Calculator**
The protagonist knows everything, predicts everything, and is never wrong. This eliminates tension and, more importantly, eliminates character. A rational protagonist must have incomplete information. They must make calculations that turn out to be wrong — not because they were irrational, but because the inputs were bad. Rationality is a process, not an outcome guarantee.

**Error 3: The Hidden Heart**
The protagonist secretly has a soft spot — a person they truly love, a principle they would die for — and this soft spot is what makes them "really" sympathetic. This is a fundamental misreading of the genre. The rational protagonist is sympathetic (or at least fascinating) because of their rationality, not despite it. Hiding a conventional emotional core betrays the premise.

**Error 4: The Lecture**
The protagonist (or narrator) explains the rational framework directly to the reader. Real rational characters demonstrate their framework through action and internal calculation — they do not teach it. If the reader needs a lecture to understand what is happening, the scene has already failed.

**Error 5: The False Equivalence**
The story implies that rational = correct and emotional = mistaken. This produces a polemic, not a novel. The most powerful version of this genre shows cases where emotional reasoning was correct and rational reasoning was wrong — and shows the protagonist unable to account for this in their framework.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Purely Pragmatic Novel' LIMIT 1),
  1,
  10,
  NOW()
)
ON DUPLICATE KEY UPDATE
  novel_creation_method_id = VALUES(novel_creation_method_id),
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  is_active = VALUES(is_active),
  sort_order = VALUES(sort_order);
