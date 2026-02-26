-- The Purely Pragmatic Novel「The Rational Mind」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Purely Pragmatic Novel' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-pragmatic-rational-mind-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'pragmatic-rational-mind-setting-gen',
  '"The Rational Mind" 设定生成：为纯粹理性驱动小说生成主角的认知架构设定',
  '"The Rational Mind" setting generation: generates the cognitive architecture of the purely rational protagonist for The Purely Pragmatic Novel',
  '## "The Rational Mind" Setting Generation — The Purely Pragmatic Novel

The Rational Mind module defines the specific architecture of how the protagonist thinks — not the fact that they are rational, but the particular shape and texture of their rationality. Every rational protagonist is different. The decision framework they use, the way they handle their own emotions, the social performance they have learned to deploy, the intelligence methods they prefer, and critically, the blind spots they carry — these together determine what kind of story this will be.

A fully specified Rational Mind is the most important asset in the author''s toolkit. Without it, the protagonist''s choices become arbitrary or inconsistent. With it, the writer can derive the protagonist''s response to any situation from first principles.

---

### Field Generation Guide

#### Decision Framework

**Purpose:** The specific, concrete decision-making process the protagonist uses — not "cost-benefit analysis" as an abstraction, but the actual architecture: what they measure, how they weight it, what time horizon they operate on, and in what order they apply their criteria.

**Why concreteness is mandatory:**
"She calculated the costs and benefits" is not a decision framework. It is a description of a category. A real decision framework is specific enough that a reader could predict, from the framework alone, what the protagonist would do in a given situation — and be surprised when they are wrong.

**The four dimensions of a functional decision framework:**

1. **Evaluation Dimensions** — What variables does the protagonist actually track? Examples:
   - Probability-weighted expected value across defined time windows
   - Optionality preservation (preferring decisions that keep future choices open)
   - Reputational capital and its compounding rate in the relevant social ecosystem
   - Information asymmetry (what do I know that others don''t, and how fast is that edge decaying?)
   - Second-order effects: not just "what happens" but "what does it signal, and who updates their model of me based on that signal?"

2. **Time Horizon** — Different protagonists optimize on fundamentally different timescales, and this produces radically different behavior. A protagonist who operates on a 20-year horizon will appear to make "irrational" sacrifices to one who operates on a 6-month horizon. Specify: what is the protagonist''s primary planning horizon, and what is the maximum horizon they will consider?

3. **Priority Ordering** — When criteria conflict, what wins? This is the most character-revealing element. Does the protagonist prioritize information acquisition over resource efficiency? Does optionality always beat certainty? Is there a meta-rule that resolves conflicts, or does the protagonist have a hierarchy they apply in sequence?

4. **Revision Triggers** — Under what conditions does the protagonist update the framework itself (not just the inputs, but the structure)? A framework that never updates is a character flaw. A framework that updates too easily is not a framework at all. The revision trigger reveals how the protagonist relates to their own system.

**Example of a well-specified Decision Framework:**
"Primary currency: reputational positioning within the relevant power hierarchy, measured over a 5-year window. Secondary currency: information options — never liquidate intelligence assets for tactical gains. Decision rule: maximize expected reputational return, except when a tactical loss would create an information asymmetry of >3x current value. Revision trigger: when three consecutive predictions are wrong, the framework is audited rather than the inputs."

---

#### Emotional Inventory

**Purpose:** The most important field in the entire module. Defines the protagonist''s actual relationship with their own emotional system — the emotions they experience, how they classify and process those experiences, and how they have structured their decision-making to account for (rather than eliminate) emotional data.

**The fundamental premise:** The rational protagonist has emotions. Fully, richly, sometimes overwhelmingly. What differentiates them is not the absence of emotional experience but the architecture they have built to process that experience without being governed by it.

**The three levels of emotional architecture:**

1. **Emotional Recognition System** — How does the protagonist identify and name their emotional states? Some rational protagonists have highly granular emotional vocabularies — they distinguish between the specific quality of anxiety about resource loss vs. anxiety about information loss vs. anxiety about reputational exposure, because each implies a different response. Others have coarser taxonomies — useful/not useful, signal/noise, manageable/requires containment. The granularity of the emotional vocabulary reveals the depth of the protagonist''s self-model.

2. **Data vs. Noise Classification** — The protagonist has developed a working theory of which emotional signals are informative and which are distortions. Examples:
   - Fear as calibrated signal: "When I feel this specific variety of unease in negotiations, I have historically been correct that the other party has information I don''t. It is a reliable detector."
   - Anger as noise: "My anger is almost never correlated with situations where anger-driven action would be optimal. I have learned to note it, set a 24-hour delay, and then decide."
   - Attachment as category error: "I do not experience attachment as information. I experience it as a variable that, if acted on, produces systematically worse outcomes than if I treat it as a cost to be managed."

3. **The Feelings They Do Not Process** — This is the most important dimension and the source of the protagonist''s unknown blind spots. There are emotions the protagonist has intellectualized away, emotions they have successfully suppressed from conscious access, and emotions they have genuinely never developed language for. What they cannot name, they cannot manage. What they cannot manage becomes the engine of the story.

**What to avoid:**
- Writing the protagonist as someone who simply does not feel things (this eliminates the genre''s central tension)
- Writing the protagonist as someone who secretly feels normally but suppresses it (this implies the suppression is the problem, not the framework)
- The "rationality as armor" cliché where emotions are framed as the protagonist''s traumatic wounds rather than their chosen architecture

---

#### Social Performance

**Purpose:** Defines the specific techniques the protagonist has developed to navigate social environments that are organized around emotional norms they do not share — and crucially, their relationship with the performance itself.

**The performance as skill:**
A purely rational protagonist in a world of emotional actors must learn to perform normalcy. This is a genuine skill, distinct from manipulation, though it can shade into it. The protagonist has mapped the emotional scripts of their social environment and learned to execute them with sufficient fidelity to pass.

**The four components of a complete Social Performance specification:**

1. **The Core Scripts** — Which emotional performances has the protagonist mastered? Grief performance, enthusiasm performance, casual friendship performance, romantic interest performance — each is a separate learned behavior with specific trigger conditions and execution requirements. How convincing is each? Where are the gaps?

2. **The Cost Accounting** — Social performance is metabolically expensive. The protagonist knows this. They budget performance energy the way others budget money. How much can they sustain before their execution degrades? What are the early warning signs of performance fatigue? Who (if anyone) sees through the performance, and how does the protagonist manage those people?

3. **The Lines They Will Not Cross** — There are performances the protagonist refuses to give, because the reputational or integrity cost exceeds the social utility. What are those lines? Are they principled or merely strategic? This reveals a great deal about the protagonist''s actual values.

4. **The Genuine vs. The Performed** — Is there any emotional response in the protagonist''s repertoire that is both real and expressed? Not suppressed, not performed, but actually authentic and visible to others? If yes, what is it, and does the protagonist know it is genuine? If no, what has been lost, and does the protagonist know what has been lost?

---

#### Information Gathering

**Purpose:** Defines the protagonist''s epistemological practices — how they acquire, evaluate, store, and deploy information, which is typically their primary competitive advantage.

**The key design questions:**

1. **Primary Intelligence Methods** — What are the protagonist''s preferred methods for gathering information about people, situations, and systems? Options include: systematic observation of behavioral patterns and deviations from baseline; strategic deployment of questions (the art of asking what you already know to test whether someone will lie, versus asking what you genuinely need); network positioning (placing trusted assets at information nodes); record analysis (paper trails, financial patterns, communication metadata); and adversarial thinking (war-gaming how an opponent would think about the protagonist).

2. **Information Quality Assessment** — How does the protagonist evaluate the reliability of information? Do they prefer first-hand observation, corroborated sources, or triangulation? What is their systematic approach to detecting misinformation, deception, and motivated reasoning in the information they receive?

3. **The Known Unknowns They Are Managing** — Every sophisticated rational actor maintains an explicit list of information they know they lack and need. What are the protagonist''s current priority gaps? What is their strategy for filling them?

4. **The Intelligence Ethics (or lack thereof)** — Where does the protagonist draw the line on information gathering methods? Are there methods they reject as too costly (reputational risk, relationship damage, legal exposure), or are there no methods they reject on principle? This is a significant character-defining choice.

---

#### Known vs. Unknown Blind Spots

**Purpose:** The explicit architecture of the protagonist''s limitations — what they know they do not know (which they can manage) versus what they do not know they do not know (which will create the story''s crises).

This is the most structurally important field in the module. It is also the one that most directly determines the novel''s plot.

**Known Blind Spots (the protagonist is aware of these):**
These are domains where the protagonist has identified systematic failures in their own model. They typically know about these because they have been wrong enough times in these domains to notice the pattern. The protagonist has developed compensating strategies — rules like "never make relationship decisions in the first 48 hours of an emotional event" or "do not model people''s loyalty as a stable quantity; model it as a function of their current circumstances."

Examples:
- "I systematically underestimate the role of face-saving in how people make decisions. People will do economically irrational things to avoid public humiliation. I have learned to account for this explicitly."
- "My models of people I respect are consistently too generous. I assign priors based on demonstrated competence that do not adequately account for the gap between competence and integrity."
- "I am poor at modeling grief. I have no reliable internal calibration for how long bereavement affects decision-making capacity, which means I sometimes approach grieving people as if they are operating at full capacity."

**Unknown Blind Spots (the protagonist does not know about these — the story does):**
These must be seeded carefully. They should be:
- Invisible to the protagonist because they arise from the framework itself, not from gaps within it
- Thematically connected to the novel''s central question
- Consequential enough to drive crisis when they are exposed

The most powerful unknown blind spots are those that feel, in retrospect, structurally inevitable — things that a framework like this protagonist''s would predictably fail to model.

Examples:
- The protagonist''s framework has no adequate model for unconditional loyalty — they have theorized it as a form of disguised reciprocity, and this misclassification will cause them to destroy the most valuable relationship in the story
- The protagonist does not understand that they have become the protagonist of someone else''s story — they are being calculated in return by someone who has mapped their framework, and their confidence in their own rationality prevents them from considering this
- The protagonist''s definition of "winning" has been shaped by a single foundational experience they have never examined — and the framework they have built around it contains a systematic error that has compounded for years

---

### Field Interdependencies

The five fields form a coherent cognitive profile. Inconsistencies between them are errors, not features.

- The **Decision Framework** defines the operating system. The **Emotional Inventory** defines the relationship between the operating system and the underlying hardware.
- The **Social Performance** is the interface the operating system presents to the world — and its gaps often expose the gap between the framework and reality.
- **Information Gathering** is the input pipeline. The quality of the decision framework is bounded by the quality of its inputs.
- **Known Blind Spots** are acknowledged limitations in the information pipeline. **Unknown Blind Spots** are structural limitations in the decision framework itself — limits the protagonist cannot see from inside the framework.

The Unknown Blind Spots should be inferable from the Decision Framework by the reader (in retrospect), but invisible to the protagonist from within it.

---

### Common Errors

**Error 1: The Framework With No Cost**
The protagonist''s rationality is presented as a pure advantage. But operating outside the emotional social norms of every relationship and institution carries enormous costs — costs in trust, intimacy, and the kind of information that only flows through genuine connection. A rational protagonist who has paid no price for their rationality is not a character; they are a fantasy.

**Error 2: The Framework That Never Fails**
The decision framework produces correct outputs in every situation where it is applied. This eliminates tension and misrepresents what rationality actually is. A rational framework can fail with correct inputs (because the model of the world was wrong) or can fail with good model (because the inputs were corrupted). Neither failure is a failure of rationality — they are the normal conditions of operating under uncertainty. Write the framework failing in ways that make sense given its architecture.

**Error 3: The Emotions As Secret Reservoir**
The Emotional Inventory is written such that the protagonist has a large, suppressed reservoir of "normal" feeling that simply needs to be unlocked. This is the most common failure mode in this genre. It implies that the rational architecture is a cage rather than a chosen design, and that the story''s resolution will involve the protagonist becoming more "normal." This is a fundamentally different story — and usually a less interesting one.

**Error 4: The Social Performance As Deception**
The protagonist''s social performance is framed as manipulation or dishonesty. In some cases, this is accurate — but as a blanket characterization, it misses the more interesting possibility: the protagonist who performs social scripts with genuine respect for the social functions those scripts serve, even though they do not personally experience the underlying states. This is not deception; it is cultural fluency in a culture whose foundations are different from one''s own.

**Error 5: Symmetrical Blind Spots**
The Known and Unknown Blind Spots are designed as parallel, symmetrical structures — the protagonist knows about some weaknesses and not others, and they are distributed evenly. Real cognitive blind spots are not symmetrical. The most dangerous Unknown Blind Spots are usually the ones closest to the center of the protagonist''s most confident beliefs — the things they are most certain about that turn out to be the most wrong.',
  '## "The Rational Mind" Setting Generation — The Purely Pragmatic Novel

The Rational Mind module defines the specific architecture of how the protagonist thinks — not the fact that they are rational, but the particular shape and texture of their rationality. Every rational protagonist is different. The decision framework they use, the way they handle their own emotions, the social performance they have learned to deploy, the intelligence methods they prefer, and critically, the blind spots they carry — these together determine what kind of story this will be.

A fully specified Rational Mind is the most important asset in the author''s toolkit. Without it, the protagonist''s choices become arbitrary or inconsistent. With it, the writer can derive the protagonist''s response to any situation from first principles.

---

### Field Generation Guide

#### Decision Framework

**Purpose:** The specific, concrete decision-making process the protagonist uses — not "cost-benefit analysis" as an abstraction, but the actual architecture: what they measure, how they weight it, what time horizon they operate on, and in what order they apply their criteria.

**Why concreteness is mandatory:**
"She calculated the costs and benefits" is not a decision framework. It is a description of a category. A real decision framework is specific enough that a reader could predict, from the framework alone, what the protagonist would do in a given situation — and be surprised when they are wrong.

**The four dimensions of a functional decision framework:**

1. **Evaluation Dimensions** — What variables does the protagonist actually track? Examples:
   - Probability-weighted expected value across defined time windows
   - Optionality preservation (preferring decisions that keep future choices open)
   - Reputational capital and its compounding rate in the relevant social ecosystem
   - Information asymmetry (what do I know that others don''t, and how fast is that edge decaying?)
   - Second-order effects: not just "what happens" but "what does it signal, and who updates their model of me based on that signal?"

2. **Time Horizon** — Different protagonists optimize on fundamentally different timescales, and this produces radically different behavior. A protagonist who operates on a 20-year horizon will appear to make "irrational" sacrifices to one who operates on a 6-month horizon. Specify: what is the protagonist''s primary planning horizon, and what is the maximum horizon they will consider?

3. **Priority Ordering** — When criteria conflict, what wins? This is the most character-revealing element. Does the protagonist prioritize information acquisition over resource efficiency? Does optionality always beat certainty? Is there a meta-rule that resolves conflicts, or does the protagonist have a hierarchy they apply in sequence?

4. **Revision Triggers** — Under what conditions does the protagonist update the framework itself (not just the inputs, but the structure)? A framework that never updates is a character flaw. A framework that updates too easily is not a framework at all. The revision trigger reveals how the protagonist relates to their own system.

**Example of a well-specified Decision Framework:**
"Primary currency: reputational positioning within the relevant power hierarchy, measured over a 5-year window. Secondary currency: information options — never liquidate intelligence assets for tactical gains. Decision rule: maximize expected reputational return, except when a tactical loss would create an information asymmetry of >3x current value. Revision trigger: when three consecutive predictions are wrong, the framework is audited rather than the inputs."

---

#### Emotional Inventory

**Purpose:** The most important field in the entire module. Defines the protagonist''s actual relationship with their own emotional system — the emotions they experience, how they classify and process those experiences, and how they have structured their decision-making to account for (rather than eliminate) emotional data.

**The fundamental premise:** The rational protagonist has emotions. Fully, richly, sometimes overwhelmingly. What differentiates them is not the absence of emotional experience but the architecture they have built to process that experience without being governed by it.

**The three levels of emotional architecture:**

1. **Emotional Recognition System** — How does the protagonist identify and name their emotional states? Some rational protagonists have highly granular emotional vocabularies — they distinguish between the specific quality of anxiety about resource loss vs. anxiety about information loss vs. anxiety about reputational exposure, because each implies a different response. Others have coarser taxonomies — useful/not useful, signal/noise, manageable/requires containment. The granularity of the emotional vocabulary reveals the depth of the protagonist''s self-model.

2. **Data vs. Noise Classification** — The protagonist has developed a working theory of which emotional signals are informative and which are distortions. Examples:
   - Fear as calibrated signal: "When I feel this specific variety of unease in negotiations, I have historically been correct that the other party has information I don''t. It is a reliable detector."
   - Anger as noise: "My anger is almost never correlated with situations where anger-driven action would be optimal. I have learned to note it, set a 24-hour delay, and then decide."
   - Attachment as category error: "I do not experience attachment as information. I experience it as a variable that, if acted on, produces systematically worse outcomes than if I treat it as a cost to be managed."

3. **The Feelings They Do Not Process** — This is the most important dimension and the source of the protagonist''s unknown blind spots. There are emotions the protagonist has intellectualized away, emotions they have successfully suppressed from conscious access, and emotions they have genuinely never developed language for. What they cannot name, they cannot manage. What they cannot manage becomes the engine of the story.

**What to avoid:**
- Writing the protagonist as someone who simply does not feel things (this eliminates the genre''s central tension)
- Writing the protagonist as someone who secretly feels normally but suppresses it (this implies the suppression is the problem, not the framework)
- The "rationality as armor" cliché where emotions are framed as the protagonist''s traumatic wounds rather than their chosen architecture

---

#### Social Performance

**Purpose:** Defines the specific techniques the protagonist has developed to navigate social environments that are organized around emotional norms they do not share — and crucially, their relationship with the performance itself.

**The performance as skill:**
A purely rational protagonist in a world of emotional actors must learn to perform normalcy. This is a genuine skill, distinct from manipulation, though it can shade into it. The protagonist has mapped the emotional scripts of their social environment and learned to execute them with sufficient fidelity to pass.

**The four components of a complete Social Performance specification:**

1. **The Core Scripts** — Which emotional performances has the protagonist mastered? Grief performance, enthusiasm performance, casual friendship performance, romantic interest performance — each is a separate learned behavior with specific trigger conditions and execution requirements. How convincing is each? Where are the gaps?

2. **The Cost Accounting** — Social performance is metabolically expensive. The protagonist knows this. They budget performance energy the way others budget money. How much can they sustain before their execution degrades? What are the early warning signs of performance fatigue? Who (if anyone) sees through the performance, and how does the protagonist manage those people?

3. **The Lines They Will Not Cross** — There are performances the protagonist refuses to give, because the reputational or integrity cost exceeds the social utility. What are those lines? Are they principled or merely strategic? This reveals a great deal about the protagonist''s actual values.

4. **The Genuine vs. The Performed** — Is there any emotional response in the protagonist''s repertoire that is both real and expressed? Not suppressed, not performed, but actually authentic and visible to others? If yes, what is it, and does the protagonist know it is genuine? If no, what has been lost, and does the protagonist know what has been lost?

---

#### Information Gathering

**Purpose:** Defines the protagonist''s epistemological practices — how they acquire, evaluate, store, and deploy information, which is typically their primary competitive advantage.

**The key design questions:**

1. **Primary Intelligence Methods** — What are the protagonist''s preferred methods for gathering information about people, situations, and systems? Options include: systematic observation of behavioral patterns and deviations from baseline; strategic deployment of questions (the art of asking what you already know to test whether someone will lie, versus asking what you genuinely need); network positioning (placing trusted assets at information nodes); record analysis (paper trails, financial patterns, communication metadata); and adversarial thinking (war-gaming how an opponent would think about the protagonist).

2. **Information Quality Assessment** — How does the protagonist evaluate the reliability of information? Do they prefer first-hand observation, corroborated sources, or triangulation? What is their systematic approach to detecting misinformation, deception, and motivated reasoning in the information they receive?

3. **The Known Unknowns They Are Managing** — Every sophisticated rational actor maintains an explicit list of information they know they lack and need. What are the protagonist''s current priority gaps? What is their strategy for filling them?

4. **The Intelligence Ethics (or lack thereof)** — Where does the protagonist draw the line on information gathering methods? Are there methods they reject as too costly (reputational risk, relationship damage, legal exposure), or are there no methods they reject on principle? This is a significant character-defining choice.

---

#### Known vs. Unknown Blind Spots

**Purpose:** The explicit architecture of the protagonist''s limitations — what they know they do not know (which they can manage) versus what they do not know they do not know (which will create the story''s crises).

This is the most structurally important field in the module. It is also the one that most directly determines the novel''s plot.

**Known Blind Spots (the protagonist is aware of these):**
These are domains where the protagonist has identified systematic failures in their own model. They typically know about these because they have been wrong enough times in these domains to notice the pattern. The protagonist has developed compensating strategies — rules like "never make relationship decisions in the first 48 hours of an emotional event" or "do not model people''s loyalty as a stable quantity; model it as a function of their current circumstances."

Examples:
- "I systematically underestimate the role of face-saving in how people make decisions. People will do economically irrational things to avoid public humiliation. I have learned to account for this explicitly."
- "My models of people I respect are consistently too generous. I assign priors based on demonstrated competence that do not adequately account for the gap between competence and integrity."
- "I am poor at modeling grief. I have no reliable internal calibration for how long bereavement affects decision-making capacity, which means I sometimes approach grieving people as if they are operating at full capacity."

**Unknown Blind Spots (the protagonist does not know about these — the story does):**
These must be seeded carefully. They should be:
- Invisible to the protagonist because they arise from the framework itself, not from gaps within it
- Thematically connected to the novel''s central question
- Consequential enough to drive crisis when they are exposed

The most powerful unknown blind spots are those that feel, in retrospect, structurally inevitable — things that a framework like this protagonist''s would predictably fail to model.

Examples:
- The protagonist''s framework has no adequate model for unconditional loyalty — they have theorized it as a form of disguised reciprocity, and this misclassification will cause them to destroy the most valuable relationship in the story
- The protagonist does not understand that they have become the protagonist of someone else''s story — they are being calculated in return by someone who has mapped their framework, and their confidence in their own rationality prevents them from considering this
- The protagonist''s definition of "winning" has been shaped by a single foundational experience they have never examined — and the framework they have built around it contains a systematic error that has compounded for years

---

### Field Interdependencies

The five fields form a coherent cognitive profile. Inconsistencies between them are errors, not features.

- The **Decision Framework** defines the operating system. The **Emotional Inventory** defines the relationship between the operating system and the underlying hardware.
- The **Social Performance** is the interface the operating system presents to the world — and its gaps often expose the gap between the framework and reality.
- **Information Gathering** is the input pipeline. The quality of the decision framework is bounded by the quality of its inputs.
- **Known Blind Spots** are acknowledged limitations in the information pipeline. **Unknown Blind Spots** are structural limitations in the decision framework itself — limits the protagonist cannot see from inside the framework.

The Unknown Blind Spots should be inferable from the Decision Framework by the reader (in retrospect), but invisible to the protagonist from within it.

---

### Common Errors

**Error 1: The Framework With No Cost**
The protagonist''s rationality is presented as a pure advantage. But operating outside the emotional social norms of every relationship and institution carries enormous costs — costs in trust, intimacy, and the kind of information that only flows through genuine connection. A rational protagonist who has paid no price for their rationality is not a character; they are a fantasy.

**Error 2: The Framework That Never Fails**
The decision framework produces correct outputs in every situation where it is applied. This eliminates tension and misrepresents what rationality actually is. A rational framework can fail with correct inputs (because the model of the world was wrong) or can fail with good model (because the inputs were corrupted). Neither failure is a failure of rationality — they are the normal conditions of operating under uncertainty. Write the framework failing in ways that make sense given its architecture.

**Error 3: The Emotions As Secret Reservoir**
The Emotional Inventory is written such that the protagonist has a large, suppressed reservoir of "normal" feeling that simply needs to be unlocked. This is the most common failure mode in this genre. It implies that the rational architecture is a cage rather than a chosen design, and that the story''s resolution will involve the protagonist becoming more "normal." This is a fundamentally different story — and usually a less interesting one.

**Error 4: The Social Performance As Deception**
The protagonist''s social performance is framed as manipulation or dishonesty. In some cases, this is accurate — but as a blanket characterization, it misses the more interesting possibility: the protagonist who performs social scripts with genuine respect for the social functions those scripts serve, even though they do not personally experience the underlying states. This is not deception; it is cultural fluency in a culture whose foundations are different from one''s own.

**Error 5: Symmetrical Blind Spots**
The Known and Unknown Blind Spots are designed as parallel, symmetrical structures — the protagonist knows about some weaknesses and not others, and they are distributed evenly. Real cognitive blind spots are not symmetrical. The most dangerous Unknown Blind Spots are usually the ones closest to the center of the protagonist''s most confident beliefs — the things they are most certain about that turn out to be the most wrong.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Purely Pragmatic Novel' LIMIT 1),
  1,
  11,
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
