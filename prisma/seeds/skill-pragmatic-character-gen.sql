-- Layer 3 Skill: Character Generation for "The Purely Pragmatic Novel"
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'pragmatic-character-gen',
  '"Character" generation: generates the cast of assets, liabilities, and complications for The Purely Pragmatic Novel',
  '"Character" generation: generates the cast of assets, liabilities, and complications for The Purely Pragmatic Novel',
  '## "Character" Generation — The Purely Pragmatic Novel

### The Core Paradox of This Character System

In a story centered on a purely rational protagonist, every other character is initially processed through the protagonist''s analytical framework — classified as Asset, Liability, Obstacle, Tool, Variable, or Anomaly. This is the protagonist''s lens. It is not the author''s lens.

The fundamental design principle: **characters are not merely objects of the protagonist''s evaluation. They have complete inner lives — and those complete inner lives are the blind spots in the protagonist''s model.**

The story''s tension lives precisely in the gap between how the protagonist categorizes people and who those people actually are. If the protagonist''s model is always correct, you have a power fantasy. If the model is always wrong, you have a satire. The most interesting territory is: the model is mostly correct, and catastrophically wrong about the things that matter most.

---

### Character Type Design Guide

#### The Protagonist

The rational protagonist is not emotionless. They experience emotions — they simply do not permit emotions to override analysis. This distinction is critical for authentic characterization.

**Design the protagonist with:**

- **Emotional Inventory**: A private ledger of emotional states the protagonist acknowledges but quarantines. What do they feel but refuse to act on? What do they feel without being aware they feel it?
- **Social Performance Capability**: The protagonist has likely reverse-engineered social norms and can perform warmth, vulnerability, or enthusiasm when strategically useful. This performance is skillful but not total — there are tells.
- **Known Blind Spots**: The protagonist should be aware of certain categories of error they are prone to. They compensate. The compensation itself introduces new blind spots.
- **Unknown Blind Spots**: The more dangerous category. These are the fracture lines the narrative will eventually exploit. Common examples: systematically undervaluing emotional labor others perform for them; misreading loyalty as transactional when it is not; failing to account for how their own behavior shapes others'' behavior over time.
- **The Question of Loneliness**: Does the protagonist want connection? Do they even know they want it? Their answer to this question — and whether that answer is honest — is a character engine.

---

#### High-Value Asset (高价值资产)

These are individuals whose capabilities, access, or information make them worth the protagonist''s investment of time and resources.

**The design trap to avoid**: turning them into pure utility delivery mechanisms with no interiority.

**Design with:**
- **Their own agenda**: What does this person actually want? It probably partially overlaps with what the protagonist wants, but never completely. Where is the divergence?
- **Awareness of being used**: High-value assets are often perceptive. Do they know they''re being managed? How do they feel about it? Do they find it acceptable, flattering, or quietly corrosive?
- **Conditions on their cooperation**: What would cause them to withdraw? The protagonist assumes they can predict this. They are probably wrong about at least one condition.
- **What they see in the protagonist**: Is this purely transactional on their side too? Or is there something they find genuinely compelling about the protagonist — a quality the protagonist would never claim as a strength?

---

#### The Anomaly (异常量) — The Most Important Secondary Character Type

The Anomaly is a person who does not fit the protagonist''s model. Their behavior is not predictably self-interested in ways the protagonist can map. They may be altruistic in ways that seem irrational, cruel in ways that have no strategic logic, or loyal beyond any reasonable return on investment.

The Anomaly is the primary source of narrative tension. Design them carefully.

**Why they matter:**
- They force the protagonist to either update their model (growth) or rationalize away the data (stagnation or hubris)
- They are often the character the protagonist is most dismissive of early in the story — and most affected by later
- They represent values the protagonist''s framework cannot fully account for: unconditional loyalty, principled refusal, love as a non-instrumental state

**Design with:**
- **A coherent internal logic the protagonist cannot access**: The Anomaly is not irrational — they operate on a different value system. The reader should be able to understand their logic even when the protagonist cannot.
- **The capacity to surprise without being inconsistent**: Their surprising actions should, in retrospect, have been predictable from their actual values — not the protagonist''s model of their values.
- **A specific moment of challenge**: When does the Anomaly most directly challenge the protagonist''s worldview? This should be a scene you can point to.

---

#### Necessary Liability (必要负担)

These are relationships the protagonist must maintain despite negative ROI — family obligations, institutional affiliations, inherited loyalties. The protagonist bears the cost deliberately because severing the relationship would be more expensive.

**Design with:**
- **Escalating cost**: The liability relationship should not stay static. The cost of maintaining it increases over the story. Why? What changes?
- **Leverage in the other direction**: The liability figure often has something on the protagonist — emotional leverage, social leverage, or actual information. They may not know they have it.
- **A moment of reckoning**: At some point, the protagonist will have to decide whether the relationship is still worth maintaining at its current cost. This decision reveals character.
- **What the protagonist owes**: Is the protagonist actually wrong to categorize this as a pure liability? Is there something they received early in their history from this person that they have failed to properly account for?

---

#### Unknown Quantity (未评估变量)

Characters the protagonist has not yet fully analyzed. They exist at the edge of the protagonist''s awareness — noticed, flagged, not yet categorized.

**Design with:**
- **Narrative suspense**: The reader should be curious about how the protagonist will eventually classify this person — and whether that classification will be accurate.
- **Clues the protagonist misses**: Small behavioral signals that a careful reader can notice even when the protagonist does not register their significance.
- **A true nature that matters**: The Unknown Quantity''s eventual revelation should affect the plot. They are not background texture.

---

### Recommended Cast Configuration

For a novel-length work, consider:

- **1 Protagonist** (fully developed per above)
- **1–2 High-Value Assets** (both of whom have their own agendas)
- **1–2 Anomalies** (at least one of whom the protagonist significantly misreads)
- **1 Necessary Liability** (whose cost escalates at a plot-critical moment)
- **2–3 Unknown Quantities** (revealed across the story''s middle)
- **1–2 Obstacles** (antagonistic forces — can be individuals or institutions)

Smaller casts are acceptable if each character carries more weight. Do not pad the cast with characters who serve only one function.

---

### The Hidden Complexity Field — Non-Negotiable

Every character entry must include a **Hidden Complexity** field: the dimension of this person that the protagonist''s model cannot capture.

This is not a flaw in the character. It is a flaw in the model.

The Hidden Complexity field is the author''s private knowledge — it may not be revealed to the reader immediately, or at all. But it must exist. Without it, the characters are as flat as the protagonist believes them to be, and the story has no depth beneath its analytical surface.

Ask for every character: *What would the protagonist never predict this person would do — and why would they do it?*

---

### Coordination with the Setting Module

**Objective Architecture** constrains character design: the protagonist''s goals determine what kinds of people are relevant to the story. Characters who have no relationship to the protagonist''s objective hierarchy are either setup for a pivot or clutter.

**Emotional Inventory** (from the Setting module) should be cross-referenced with character design: the emotional states the protagonist has quarantined often correspond to specific characters who activate those states. The character who makes the protagonist feel something they refuse to act on is frequently the most important character in the story.

---

### Common Design Errors

**Error 1: All secondary characters are perfectly predicted by the protagonist.**
If the protagonist''s model is never wrong, there is no story — only demonstration. Every major secondary character should have at least one dimension that falls outside the protagonist''s model.

**Error 2: The "tool" remains only a tool.**
Characters the protagonist uses as instruments must eventually reveal themselves as something more — either to the protagonist, to the reader, or to both. A character who is used and then discarded with no complication is a missed opportunity. Even if the protagonist discards them cleanly, the reader should feel the weight of what was discarded.

**Error 3: The Anomaly is merely quirky.**
An Anomaly who is just eccentric or unpredictable provides no real challenge to the protagonist''s framework. The Anomaly must operate from a value system that is coherent and meaningful — one that implicitly interrogates the protagonist''s values by its very existence.

**Error 4: Hidden Complexity is a twist, not a character.**
Hidden Complexity is not a secret backstory reveal. It is the ongoing fullness of the character''s inner life. It should be subtly present throughout, not saved for a dramatic disclosure.

**Error 5: The Necessary Liability is purely a burden.**
The character the protagonist maintains as a liability often represents something real they cannot admit needing. The cost is real. So is the need. Both must be present.',
  '## "Character" Generation — The Purely Pragmatic Novel

### The Core Paradox of This Character System

In a story centered on a purely rational protagonist, every other character is initially processed through the protagonist''s analytical framework — classified as Asset, Liability, Obstacle, Tool, Variable, or Anomaly. This is the protagonist''s lens. It is not the author''s lens.

The fundamental design principle: **characters are not merely objects of the protagonist''s evaluation. They have complete inner lives — and those complete inner lives are the blind spots in the protagonist''s model.**

The story''s tension lives precisely in the gap between how the protagonist categorizes people and who those people actually are. If the protagonist''s model is always correct, you have a power fantasy. If the model is always wrong, you have a satire. The most interesting territory is: the model is mostly correct, and catastrophically wrong about the things that matter most.

---

### Character Type Design Guide

#### The Protagonist

The rational protagonist is not emotionless. They experience emotions — they simply do not permit emotions to override analysis. This distinction is critical for authentic characterization.

**Design the protagonist with:**

- **Emotional Inventory**: A private ledger of emotional states the protagonist acknowledges but quarantines. What do they feel but refuse to act on? What do they feel without being aware they feel it?
- **Social Performance Capability**: The protagonist has likely reverse-engineered social norms and can perform warmth, vulnerability, or enthusiasm when strategically useful. This performance is skillful but not total — there are tells.
- **Known Blind Spots**: The protagonist should be aware of certain categories of error they are prone to. They compensate. The compensation itself introduces new blind spots.
- **Unknown Blind Spots**: The more dangerous category. These are the fracture lines the narrative will eventually exploit. Common examples: systematically undervaluing emotional labor others perform for them; misreading loyalty as transactional when it is not; failing to account for how their own behavior shapes others'' behavior over time.
- **The Question of Loneliness**: Does the protagonist want connection? Do they even know they want it? Their answer to this question — and whether that answer is honest — is a character engine.

---

#### High-Value Asset (高价值资产)

These are individuals whose capabilities, access, or information make them worth the protagonist''s investment of time and resources.

**The design trap to avoid**: turning them into pure utility delivery mechanisms with no interiority.

**Design with:**
- **Their own agenda**: What does this person actually want? It probably partially overlaps with what the protagonist wants, but never completely. Where is the divergence?
- **Awareness of being used**: High-value assets are often perceptive. Do they know they''re being managed? How do they feel about it? Do they find it acceptable, flattering, or quietly corrosive?
- **Conditions on their cooperation**: What would cause them to withdraw? The protagonist assumes they can predict this. They are probably wrong about at least one condition.
- **What they see in the protagonist**: Is this purely transactional on their side too? Or is there something they find genuinely compelling about the protagonist — a quality the protagonist would never claim as a strength?

---

#### The Anomaly (异常量) — The Most Important Secondary Character Type

The Anomaly is a person who does not fit the protagonist''s model. Their behavior is not predictably self-interested in ways the protagonist can map. They may be altruistic in ways that seem irrational, cruel in ways that have no strategic logic, or loyal beyond any reasonable return on investment.

The Anomaly is the primary source of narrative tension. Design them carefully.

**Why they matter:**
- They force the protagonist to either update their model (growth) or rationalize away the data (stagnation or hubris)
- They are often the character the protagonist is most dismissive of early in the story — and most affected by later
- They represent values the protagonist''s framework cannot fully account for: unconditional loyalty, principled refusal, love as a non-instrumental state

**Design with:**
- **A coherent internal logic the protagonist cannot access**: The Anomaly is not irrational — they operate on a different value system. The reader should be able to understand their logic even when the protagonist cannot.
- **The capacity to surprise without being inconsistent**: Their surprising actions should, in retrospect, have been predictable from their actual values — not the protagonist''s model of their values.
- **A specific moment of challenge**: When does the Anomaly most directly challenge the protagonist''s worldview? This should be a scene you can point to.

---

#### Necessary Liability (必要负担)

These are relationships the protagonist must maintain despite negative ROI — family obligations, institutional affiliations, inherited loyalties. The protagonist bears the cost deliberately because severing the relationship would be more expensive.

**Design with:**
- **Escalating cost**: The liability relationship should not stay static. The cost of maintaining it increases over the story. Why? What changes?
- **Leverage in the other direction**: The liability figure often has something on the protagonist — emotional leverage, social leverage, or actual information. They may not know they have it.
- **A moment of reckoning**: At some point, the protagonist will have to decide whether the relationship is still worth maintaining at its current cost. This decision reveals character.
- **What the protagonist owes**: Is the protagonist actually wrong to categorize this as a pure liability? Is there something they received early in their history from this person that they have failed to properly account for?

---

#### Unknown Quantity (未评估变量)

Characters the protagonist has not yet fully analyzed. They exist at the edge of the protagonist''s awareness — noticed, flagged, not yet categorized.

**Design with:**
- **Narrative suspense**: The reader should be curious about how the protagonist will eventually classify this person — and whether that classification will be accurate.
- **Clues the protagonist misses**: Small behavioral signals that a careful reader can notice even when the protagonist does not register their significance.
- **A true nature that matters**: The Unknown Quantity''s eventual revelation should affect the plot. They are not background texture.

---

### Recommended Cast Configuration

For a novel-length work, consider:

- **1 Protagonist** (fully developed per above)
- **1–2 High-Value Assets** (both of whom have their own agendas)
- **1–2 Anomalies** (at least one of whom the protagonist significantly misreads)
- **1 Necessary Liability** (whose cost escalates at a plot-critical moment)
- **2–3 Unknown Quantities** (revealed across the story''s middle)
- **1–2 Obstacles** (antagonistic forces — can be individuals or institutions)

Smaller casts are acceptable if each character carries more weight. Do not pad the cast with characters who serve only one function.

---

### The Hidden Complexity Field — Non-Negotiable

Every character entry must include a **Hidden Complexity** field: the dimension of this person that the protagonist''s model cannot capture.

This is not a flaw in the character. It is a flaw in the model.

The Hidden Complexity field is the author''s private knowledge — it may not be revealed to the reader immediately, or at all. But it must exist. Without it, the characters are as flat as the protagonist believes them to be, and the story has no depth beneath its analytical surface.

Ask for every character: *What would the protagonist never predict this person would do — and why would they do it?*

---

### Coordination with the Setting Module

**Objective Architecture** constrains character design: the protagonist''s goals determine what kinds of people are relevant to the story. Characters who have no relationship to the protagonist''s objective hierarchy are either setup for a pivot or clutter.

**Emotional Inventory** (from the Setting module) should be cross-referenced with character design: the emotional states the protagonist has quarantined often correspond to specific characters who activate those states. The character who makes the protagonist feel something they refuse to act on is frequently the most important character in the story.

---

### Common Design Errors

**Error 1: All secondary characters are perfectly predicted by the protagonist.**
If the protagonist''s model is never wrong, there is no story — only demonstration. Every major secondary character should have at least one dimension that falls outside the protagonist''s model.

**Error 2: The "tool" remains only a tool.**
Characters the protagonist uses as instruments must eventually reveal themselves as something more — either to the protagonist, to the reader, or to both. A character who is used and then discarded with no complication is a missed opportunity. Even if the protagonist discards them cleanly, the reader should feel the weight of what was discarded.

**Error 3: The Anomaly is merely quirky.**
An Anomaly who is just eccentric or unpredictable provides no real challenge to the protagonist''s framework. The Anomaly must operate from a value system that is coherent and meaningful — one that implicitly interrogates the protagonist''s values by its very existence.

**Error 4: Hidden Complexity is a twist, not a character.**
Hidden Complexity is not a secret backstory reveal. It is the ongoing fullness of the character''s inner life. It should be subtly present throughout, not saved for a dramatic disclosure.

**Error 5: The Necessary Liability is purely a burden.**
The character the protagonist maintains as a liability often represents something real they cannot admit needing. The cost is real. So is the need. Both must be present.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Purely Pragmatic Novel' LIMIT 1),
  1,
  21,
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
