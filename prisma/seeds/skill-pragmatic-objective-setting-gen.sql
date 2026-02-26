-- The Purely Pragmatic Novel「Objective Architecture」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Purely Pragmatic Novel' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-pragmatic-objective-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'pragmatic-objective-setting-gen',
  '"Objective Architecture" 设定生成：为纯粹理性驱动小说生成目标结构与投资逻辑设定',
  '"Objective Architecture" setting generation: generates the goal structure and investment logic for The Purely Pragmatic Novel',
  '## "Objective Architecture" Setting Generation — The Purely Pragmatic Novel

Objective Architecture is the strategic layer of the purely rational protagonist — the complete map of what they are trying to achieve, what they currently hold, what they are actively building, and the moral calculus that governs what they are willing to spend. Every decision in the novel derives from this architecture. Every relationship, every sacrifice, every betrayal becomes legible only against this structure.

The critical insight of this module: a rational protagonist does not pursue goals. They pursue a portfolio. Goals have endpoints. A portfolio has a logic — a set of principles about how to allocate, when to compound, when to liquidate, and what the terminal conditions are. The design task is to create a portfolio logic specific enough to generate story from first principles.

---

### Field Generation Guide

#### Ultimate Objective

**Purpose:** The terminal goal that justifies all intermediate costs — grand enough in scope that it can carry the moral weight of every sacrifice made in its pursuit, specific enough that the reader can evaluate whether a given action actually advances it.

**The two failure modes to avoid:**

1. **Too abstract:** "She wants power." Power over what? Measured how? By what date? For what purpose? An abstract objective cannot generate specific decisions, and specific decisions are the story.

2. **Too modest:** An objective that does not require extraordinary means does not justify extraordinary methods. The Ultimate Objective must be large enough that a reader, even while morally uncomfortable with the protagonist''s choices, can see why someone might consider those choices defensible. The scale of the objective must match the scale of the costs.

**Design principles for a compelling Ultimate Objective:**

1. **The Objective Must Be Falsifiable** — The protagonist must be able to know, at any given moment, whether they are closer to or further from the objective. Objectives that cannot be measured cannot be rationally pursued. They also cannot generate the specific calculation scenes that are this genre''s signature pleasure.

2. **The Objective Must Be Irreversible** — The most powerful ultimate objectives are ones where partial completion cannot be undone. The protagonist has passed a threshold and cannot retreat. This creates the specific existential tension unique to this genre: the rational protagonist must keep going not just because they want to, but because the costs already paid would be wasted otherwise. Sunk cost is not supposed to be rational — and the best novels in this genre use this contradiction.

3. **The Objective Must Have a Moral Claim** — Even objectives that require monstrous means should have a logic that a reasonable person could understand. The objective might be: ending a genuine threat that no one else can or will address; achieving a distribution of power that prevents a worse equilibrium; preserving something irreplaceable at the cost of something replaceable. The moral claim does not need to be correct — it needs to be coherent enough that the reader must argue with it rather than dismiss it.

4. **The Objective Must Have a Personal Origin** — Why does this protagonist care about this specific objective? Not just the intellectual case for it, but the formative experience that made this particular objective the organizing principle of their life. The personal origin is usually where the Unknown Blind Spot from The Rational Mind module is embedded.

**Examples of well-specified Ultimate Objectives:**
- "Ensure that the specific regulatory framework governing AI development in the next 15 years is written by people whose interests align with long-term human welfare rather than short-term commercial capture — and the window closes in four years."
- "Acquire sufficient positional influence within the Central Committee that, at the next succession crisis, the outcome is one I have designed rather than one I must survive."
- "Accumulate and preserve the complete intellectual and cultural record of a civilization that the protagonist knows will be destroyed within their lifetime, in a form that will survive and be discoverable."

---

#### Optimization Metric

**Purpose:** The specific currency in which the protagonist measures success — the primary resource they are accumulating, the unit in which all costs and gains are denominated.

**Why this field determines everything:**
Two protagonists with identical Ultimate Objectives but different Optimization Metrics will make completely different decisions and produce completely different stories. A protagonist who measures success in institutional power (positions, titles, formal authority) will behave radically differently from one who measures success in information dominance (what they know that others don''t) or in social capital (the aggregate quality of their relationship network) or in optionality (the number and quality of choices available to them at any moment).

**The primary categories and their story implications:**

1. **Power as Formal Authority**
   The protagonist collects positions, titles, formal decision-making roles. They think in terms of organizational charts and succession paths. The story they generate is about institutional maneuvering — committee decisions, coalition-building, procedural leverage. The characteristic failure mode: formal authority without the informal trust that makes it effective.

2. **Power as Information Asymmetry**
   The protagonist measures success by how much they know that others do not, and how durable that advantage is. They are suspicious of all public information and systematic gatherers of private information. The story they generate is about intelligence operations — source cultivation, deception detection, the ethics of knowledge. The characteristic failure mode: knowing too much about people they were supposed to trust.

3. **Power as Resource Control**
   The protagonist measures success in money, assets, supply chain position, resource scarcity leverage. The story they generate is about economic maneuvering — acquisitions, dependencies, financial architectures. The characteristic failure mode: wealth that creates targets rather than security.

4. **Power as Capability**
   The protagonist measures success in what they can personally do — skills, knowledge, physical capacity, cognitive enhancement. The story they generate is about self-development as strategy. The characteristic failure mode: capability without deployment context, or deployment that reveals capability before the optimal moment.

5. **Compound Metrics**
   The most sophisticated protagonists use multi-dimensional metrics with explicit conversion rates between currencies. "One unit of formal authority can be converted to approximately three units of information access but only if the authority is exercised at the right level of the hierarchy." The story this generates is about portfolio management — when to liquidate one currency for another.

**The metric must be legible to the reader.** The reader must be able to track whether the protagonist is winning or losing by their own standards, even when the protagonist''s standards differ radically from conventional measures of success.

---

#### Current Asset Portfolio

**Purpose:** A complete inventory of what the protagonist currently holds — relationships, information, resources, capabilities, and positional advantages — assessed through the protagonist''s own evaluative lens.

**The purpose of this field is twofold:**
First, it establishes the protagonist''s current strategic position. Second, and more importantly, it reveals how the protagonist thinks by showing how they categorize and value what they hold.

**The five asset classes:**

1. **Relationship Assets** — Not "friends" or "allies" — those are emotional categories. Relationship assets are people whose future behavior the protagonist can reliably predict and, to varying degrees, influence. For each significant relationship asset: current estimated value (what can this person actually do for the objective?), holding cost (what does maintaining this relationship require?), expected duration (how long will this asset remain viable?), and optionality value (what future doors does this relationship keep open?).

2. **Information Assets** — Specific pieces of knowledge the protagonist holds that others do not, assessed by: uniqueness (how many other people know this?), durability (how long before this becomes common knowledge?), leverage value (what can this knowledge be used to accomplish, and at what conversion rate?), and decay risk (what events would cause this information to lose value?).

3. **Resource Assets** — Financial, material, and institutional resources. Assessed by: liquidity (how quickly can this be deployed?), visibility (who knows the protagonist holds this, and what does that knowledge create?), and conversion efficiency (at what rate can this resource type be converted to the protagonist''s primary optimization metric?).

4. **Capability Assets** — Personal skills, knowledge, and capacities. Assessed by: current deployment level (is this capability being used at full effectiveness?), development trajectory (is this capability improving, stable, or decaying?), and differentiation (how rare is this capability in the protagonist''s competitive environment?).

5. **Positional Assets** — Access, memberships, credentials, and structural location within relevant networks. The protagonist occupies specific nodes in specific graphs, and those positions have leverage. Assessed by: centrality (how many important paths run through this position?), substitutability (could someone else occupy this position and extract the same value?), and switching cost (what would be lost by moving to a different position?).

**The strategic thinking revealed by the portfolio:**
The composition and balance of the portfolio reveals the protagonist''s strategic theory. A portfolio heavy in information assets and light in formal authority reflects a different theory of power than a portfolio heavy in resource assets and relationship leverage. The imbalances in the portfolio — what the protagonist has been building toward — are as revealing as what they currently hold.

---

#### Active Investments

**Purpose:** The relationships and situations the protagonist is currently cultivating — ongoing resource expenditures intended to yield future returns.

**Active Investments are defined by three properties:**
- Current cost: what the protagonist is spending to maintain the investment (time, attention, resources, favors, performance of affection)
- Expected return: what the protagonist believes this investment will yield, and when
- Thesis: why the protagonist believes this investment is sound (the reasoning, not just the conclusion)

**The design task:** Active Investments must create story pressure. Each investment should have at least one of the following properties:
- The investment is in a person who does not know they are being cultivated (creates dramatic irony and potential for betrayal)
- The investment requires the protagonist to behave in ways that conflict with their self-image (creates internal tension)
- The investment''s expected return depends on a belief about the target''s character that the reader has reason to doubt (creates suspense)
- The investment is competing with a different investment in the same resource allocation (creates genuine choice scenarios)

**The taxonomy of active investments:**

1. **Relationship Cultivation** — Building capacity with a specific person: trust cultivation, obligation creation, information exchange, emotional performance. The protagonist is investing in their model of the other person while simultaneously shaping the other person''s model of them.

2. **Positional Maneuvering** — Sequence of moves intended to create a future position: the protagonist is not yet where they want to be, and each current action is a step in a planned trajectory.

3. **Information Development** — Ongoing processes designed to close specific knowledge gaps: source development, pattern observation, research.

4. **Capability Building** — Skills or knowledge being deliberately developed for anticipated future deployment.

---

#### Acceptable Expenditure

**Purpose:** The most morally loaded field in the entire module. Defines the protagonist''s actual cost tolerance — what they are genuinely willing to spend in pursuit of the Ultimate Objective, and the internal logic that governs the exchange rates at which they will spend it.

**This field is where the novel''s moral argument lives.** Everything else in the Objective Architecture is strategic. This field is ethical. Or rather, it is where the protagonist''s ethics — such as they are — become concrete and testable.

**The design challenge:**
The Acceptable Expenditure must be designed so that the reader can simultaneously:
- Understand the logic (the exchange rate is internally coherent and derivable from the stated framework)
- Feel the horror (the logic does not eliminate the human cost, it just reclassifies it)
- Be implicated (the reader has, at least partially, adopted the protagonist''s framework by this point in the story, which means the reader must reckon with their own partial endorsement)

**The key design questions:**

1. **The Cost Categories** — What types of costs does the protagonist distinguish? Typical categories:
   - Direct costs to the protagonist (acceptable at a high rate if the objective return justifies it)
   - Costs to willing participants (acceptable if they are informed and compensated)
   - Costs to uninformed participants (acceptable at a much lower rate, or possibly not acceptable, depending on the protagonist''s framework)
   - Costs to uninvolved parties (this is where the moral horror lives — at what exchange rate does the protagonist accept collateral damage?)

2. **The Exchange Rate for Human Cost** — The most important and most uncomfortable question. The protagonist has, implicitly or explicitly, a model of when an uninvolved person''s loss, suffering, or death is acceptable collateral damage for a sufficiently large objective gain. This model must be made explicit, because:
   - An explicit model produces a specific, identifiable threshold — a line the reader can see and judge
   - An implicit model allows the protagonist (and the writer) to pretend the calculation is not being made when it is
   - The threshold, once established, will be tested by the story — the reader will watch as the protagonist''s actual behavior either respects or violates the threshold they articulated

3. **The Specific Prohibitions** — What will the protagonist not do, and why not? The reason matters enormously:
   - "I will not do X because it is wrong" — this is a moral prohibition, which means the protagonist has a moral floor, which means there is a potential conflict between the framework and the moral floor
   - "I will not do X because the reputational cost exceeds the expected return" — this is a strategic prohibition, which means there is no moral floor, only a cost calculation, which is a different and usually darker characterization
   - "I will not do X because I cannot calculate the downstream consequences with sufficient confidence" — this is an epistemic prohibition, which means the protagonist''s limits are informational rather than ethical

4. **The History of the Threshold** — Has the protagonist already paid specific types of costs? Have they already accepted the spending of human welfare as an instrument? If so, what was the first time, and how did they justify it then versus how they justify it now? The evolution of the threshold is a character arc in miniature.

**An example of a well-specified Acceptable Expenditure:**
"Direct personal costs: essentially unlimited if the expected value calculation supports it. Costs to consenting informed participants: acceptable at a 3:1 return ratio (they accept the risk, I provide the compensation). Costs to uninformed participants who are within the relevant system: acceptable when the expected systemic benefit exceeds the individual cost by a factor of at least 20, and only when I cannot achieve the same result through means that do not require their contribution. Costs to genuinely uninvolved parties: not acceptable as a first-order instrument. Acceptable as a known statistical risk when the objective is sufficiently large — specifically, when the objective prevents a harm to a greater number of similar parties. Note: I have paid this last cost. Twice. I do not expect to stop needing to."

---

#### Efficiency Constraints

**Purpose:** The operational limits on the protagonist''s actions — not moral prohibitions, but practical constraints derived from their own cost calculations about what is too expensive to do effectively.

**The conceptual distinction that makes this field interesting:**
Moral constraints come from outside the framework — they limit what the protagonist will do regardless of efficiency. Efficiency Constraints come from within the framework — they limit what the protagonist will do because the protagonist has calculated that doing it is not worth the cost. A protagonist with no moral constraints but robust efficiency constraints is a very specific and very interesting kind of character.

**The major categories of efficiency constraints:**

1. **Attention Economy Limits** — The protagonist cannot monitor, cultivate, and model an unlimited number of relationships and situations simultaneously. Where is the boundary? What gets deprioritized? The protagonist''s attention allocation decisions reveal their actual priorities more honestly than any stated value.

2. **Reputational Sustainability** — Some actions, even when immediately beneficial, create reputational damage that compounds over time and eventually undermines the protagonist''s ability to operate. The protagonist has a model of which actions are reputationally sustainable and which are not — not because they care about being liked, but because reputation is an operational resource.

3. **Concentration Risk** — The protagonist should be aware of over-dependency on any single asset class, relationship, or information source. What is their current exposure? What would happen if their primary relationship asset defected, or their key information source dried up?

4. **The Efficiency Cost of Deception** — Systematic deception creates an ever-growing maintenance burden: lies to remember, performances to maintain, contradictions to manage. At some scale, deception becomes inefficient. The protagonist has calculated where that threshold is. Are they currently above or below it?

5. **The Unmodelable** — There are domains where the protagonist''s model is too poor to support confident action. These are not moral prohibitions — the protagonist would act here if they could model it. They are recognized knowledge gaps that function as operational constraints: "I do not act in environments I cannot model, because my expected error rate is too high to justify the action cost."

---

### Field Interdependencies

The six fields form a complete strategic picture:

- **Ultimate Objective** is the terminal state. **Optimization Metric** is the unit of progress. Together they define the protagonist''s coordinate system.
- **Current Asset Portfolio** is the starting position. **Active Investments** are the trajectory. Together they define the protagonist''s current strategy.
- **Acceptable Expenditure** defines the moral envelope of the strategy. **Efficiency Constraints** define the operational envelope. Together they define the limits within which the strategy will be executed.

The most important interdependency: the **Acceptable Expenditure** threshold, when applied to the assets in the **Current Asset Portfolio** and the target returns of **Active Investments**, will at some point in the novel produce a situation where the protagonist must decide whether to spend a specific human cost for a specific calculated gain. That moment — and whether the protagonist''s actual behavior matches their stated threshold — is the climax of the moral argument.

---

### Common Errors

**Error 1: The Objective Without Scale**
The Ultimate Objective is impressive-sounding but modest in actual scope — achieving personal wealth, gaining a specific position, defeating a specific opponent. An objective of this scale cannot carry the moral weight of a purely rational framework. The reader will wonder why someone as intelligent as the protagonist could not simply pursue this objective through conventional means.

**Error 2: The Metric That Does Not Measure Anything**
The Optimization Metric is defined abstractly ("she measures success in power") rather than operationally. Without a specific, trackable metric, the protagonist cannot make rational decisions (they cannot calculate trade-offs between incommensurable goods), and the reader cannot evaluate whether the protagonist is winning or losing.

**Error 3: The Portfolio That Is Just Assets**
The Current Asset Portfolio lists resources without revealing the protagonist''s evaluative framework. The point of the portfolio is not to catalog what the protagonist has — it is to reveal how they think by showing what they value, how they classify it, and what they notice. A portfolio that reads like an inventory rather than a strategic document has missed the purpose of the field.

**Error 4: The Acceptable Expenditure With No Real Threshold**
The protagonist is depicted as willing to do anything, without limit, for the objective. This eliminates moral tension: there is no line to be tested, no moment where the protagonist faces a cost that genuinely challenges the framework. Without a threshold, the story has no climax — only a series of increasingly extreme acts that produce diminishing moral returns.

**Error 5: Efficiency Constraints Treated As Moral Constraints**
The writer conflates "the protagonist won''t do X because the cost is too high" with "the protagonist won''t do X because it is wrong." These are categorically different characterizations. A protagonist who never does morally horrifying things because they are never efficient is not a moral protagonist — they are a strategic one. The reader must understand the difference, because the question the story is asking is whether strategic constraints are sufficient substitutes for moral ones.',
  '## "Objective Architecture" Setting Generation — The Purely Pragmatic Novel

Objective Architecture is the strategic layer of the purely rational protagonist — the complete map of what they are trying to achieve, what they currently hold, what they are actively building, and the moral calculus that governs what they are willing to spend. Every decision in the novel derives from this architecture. Every relationship, every sacrifice, every betrayal becomes legible only against this structure.

The critical insight of this module: a rational protagonist does not pursue goals. They pursue a portfolio. Goals have endpoints. A portfolio has a logic — a set of principles about how to allocate, when to compound, when to liquidate, and what the terminal conditions are. The design task is to create a portfolio logic specific enough to generate story from first principles.

---

### Field Generation Guide

#### Ultimate Objective

**Purpose:** The terminal goal that justifies all intermediate costs — grand enough in scope that it can carry the moral weight of every sacrifice made in its pursuit, specific enough that the reader can evaluate whether a given action actually advances it.

**The two failure modes to avoid:**

1. **Too abstract:** "She wants power." Power over what? Measured how? By what date? For what purpose? An abstract objective cannot generate specific decisions, and specific decisions are the story.

2. **Too modest:** An objective that does not require extraordinary means does not justify extraordinary methods. The Ultimate Objective must be large enough that a reader, even while morally uncomfortable with the protagonist''s choices, can see why someone might consider those choices defensible. The scale of the objective must match the scale of the costs.

**Design principles for a compelling Ultimate Objective:**

1. **The Objective Must Be Falsifiable** — The protagonist must be able to know, at any given moment, whether they are closer to or further from the objective. Objectives that cannot be measured cannot be rationally pursued. They also cannot generate the specific calculation scenes that are this genre''s signature pleasure.

2. **The Objective Must Be Irreversible** — The most powerful ultimate objectives are ones where partial completion cannot be undone. The protagonist has passed a threshold and cannot retreat. This creates the specific existential tension unique to this genre: the rational protagonist must keep going not just because they want to, but because the costs already paid would be wasted otherwise. Sunk cost is not supposed to be rational — and the best novels in this genre use this contradiction.

3. **The Objective Must Have a Moral Claim** — Even objectives that require monstrous means should have a logic that a reasonable person could understand. The objective might be: ending a genuine threat that no one else can or will address; achieving a distribution of power that prevents a worse equilibrium; preserving something irreplaceable at the cost of something replaceable. The moral claim does not need to be correct — it needs to be coherent enough that the reader must argue with it rather than dismiss it.

4. **The Objective Must Have a Personal Origin** — Why does this protagonist care about this specific objective? Not just the intellectual case for it, but the formative experience that made this particular objective the organizing principle of their life. The personal origin is usually where the Unknown Blind Spot from The Rational Mind module is embedded.

**Examples of well-specified Ultimate Objectives:**
- "Ensure that the specific regulatory framework governing AI development in the next 15 years is written by people whose interests align with long-term human welfare rather than short-term commercial capture — and the window closes in four years."
- "Acquire sufficient positional influence within the Central Committee that, at the next succession crisis, the outcome is one I have designed rather than one I must survive."
- "Accumulate and preserve the complete intellectual and cultural record of a civilization that the protagonist knows will be destroyed within their lifetime, in a form that will survive and be discoverable."

---

#### Optimization Metric

**Purpose:** The specific currency in which the protagonist measures success — the primary resource they are accumulating, the unit in which all costs and gains are denominated.

**Why this field determines everything:**
Two protagonists with identical Ultimate Objectives but different Optimization Metrics will make completely different decisions and produce completely different stories. A protagonist who measures success in institutional power (positions, titles, formal authority) will behave radically differently from one who measures success in information dominance (what they know that others don''t) or in social capital (the aggregate quality of their relationship network) or in optionality (the number and quality of choices available to them at any moment).

**The primary categories and their story implications:**

1. **Power as Formal Authority**
   The protagonist collects positions, titles, formal decision-making roles. They think in terms of organizational charts and succession paths. The story they generate is about institutional maneuvering — committee decisions, coalition-building, procedural leverage. The characteristic failure mode: formal authority without the informal trust that makes it effective.

2. **Power as Information Asymmetry**
   The protagonist measures success by how much they know that others do not, and how durable that advantage is. They are suspicious of all public information and systematic gatherers of private information. The story they generate is about intelligence operations — source cultivation, deception detection, the ethics of knowledge. The characteristic failure mode: knowing too much about people they were supposed to trust.

3. **Power as Resource Control**
   The protagonist measures success in money, assets, supply chain position, resource scarcity leverage. The story they generate is about economic maneuvering — acquisitions, dependencies, financial architectures. The characteristic failure mode: wealth that creates targets rather than security.

4. **Power as Capability**
   The protagonist measures success in what they can personally do — skills, knowledge, physical capacity, cognitive enhancement. The story they generate is about self-development as strategy. The characteristic failure mode: capability without deployment context, or deployment that reveals capability before the optimal moment.

5. **Compound Metrics**
   The most sophisticated protagonists use multi-dimensional metrics with explicit conversion rates between currencies. "One unit of formal authority can be converted to approximately three units of information access but only if the authority is exercised at the right level of the hierarchy." The story this generates is about portfolio management — when to liquidate one currency for another.

**The metric must be legible to the reader.** The reader must be able to track whether the protagonist is winning or losing by their own standards, even when the protagonist''s standards differ radically from conventional measures of success.

---

#### Current Asset Portfolio

**Purpose:** A complete inventory of what the protagonist currently holds — relationships, information, resources, capabilities, and positional advantages — assessed through the protagonist''s own evaluative lens.

**The purpose of this field is twofold:**
First, it establishes the protagonist''s current strategic position. Second, and more importantly, it reveals how the protagonist thinks by showing how they categorize and value what they hold.

**The five asset classes:**

1. **Relationship Assets** — Not "friends" or "allies" — those are emotional categories. Relationship assets are people whose future behavior the protagonist can reliably predict and, to varying degrees, influence. For each significant relationship asset: current estimated value (what can this person actually do for the objective?), holding cost (what does maintaining this relationship require?), expected duration (how long will this asset remain viable?), and optionality value (what future doors does this relationship keep open?).

2. **Information Assets** — Specific pieces of knowledge the protagonist holds that others do not, assessed by: uniqueness (how many other people know this?), durability (how long before this becomes common knowledge?), leverage value (what can this knowledge be used to accomplish, and at what conversion rate?), and decay risk (what events would cause this information to lose value?).

3. **Resource Assets** — Financial, material, and institutional resources. Assessed by: liquidity (how quickly can this be deployed?), visibility (who knows the protagonist holds this, and what does that knowledge create?), and conversion efficiency (at what rate can this resource type be converted to the protagonist''s primary optimization metric?).

4. **Capability Assets** — Personal skills, knowledge, and capacities. Assessed by: current deployment level (is this capability being used at full effectiveness?), development trajectory (is this capability improving, stable, or decaying?), and differentiation (how rare is this capability in the protagonist''s competitive environment?).

5. **Positional Assets** — Access, memberships, credentials, and structural location within relevant networks. The protagonist occupies specific nodes in specific graphs, and those positions have leverage. Assessed by: centrality (how many important paths run through this position?), substitutability (could someone else occupy this position and extract the same value?), and switching cost (what would be lost by moving to a different position?).

**The strategic thinking revealed by the portfolio:**
The composition and balance of the portfolio reveals the protagonist''s strategic theory. A portfolio heavy in information assets and light in formal authority reflects a different theory of power than a portfolio heavy in resource assets and relationship leverage. The imbalances in the portfolio — what the protagonist has been building toward — are as revealing as what they currently hold.

---

#### Active Investments

**Purpose:** The relationships and situations the protagonist is currently cultivating — ongoing resource expenditures intended to yield future returns.

**Active Investments are defined by three properties:**
- Current cost: what the protagonist is spending to maintain the investment (time, attention, resources, favors, performance of affection)
- Expected return: what the protagonist believes this investment will yield, and when
- Thesis: why the protagonist believes this investment is sound (the reasoning, not just the conclusion)

**The design task:** Active Investments must create story pressure. Each investment should have at least one of the following properties:
- The investment is in a person who does not know they are being cultivated (creates dramatic irony and potential for betrayal)
- The investment requires the protagonist to behave in ways that conflict with their self-image (creates internal tension)
- The investment''s expected return depends on a belief about the target''s character that the reader has reason to doubt (creates suspense)
- The investment is competing with a different investment in the same resource allocation (creates genuine choice scenarios)

**The taxonomy of active investments:**

1. **Relationship Cultivation** — Building capacity with a specific person: trust cultivation, obligation creation, information exchange, emotional performance. The protagonist is investing in their model of the other person while simultaneously shaping the other person''s model of them.

2. **Positional Maneuvering** — Sequence of moves intended to create a future position: the protagonist is not yet where they want to be, and each current action is a step in a planned trajectory.

3. **Information Development** — Ongoing processes designed to close specific knowledge gaps: source development, pattern observation, research.

4. **Capability Building** — Skills or knowledge being deliberately developed for anticipated future deployment.

---

#### Acceptable Expenditure

**Purpose:** The most morally loaded field in the entire module. Defines the protagonist''s actual cost tolerance — what they are genuinely willing to spend in pursuit of the Ultimate Objective, and the internal logic that governs the exchange rates at which they will spend it.

**This field is where the novel''s moral argument lives.** Everything else in the Objective Architecture is strategic. This field is ethical. Or rather, it is where the protagonist''s ethics — such as they are — become concrete and testable.

**The design challenge:**
The Acceptable Expenditure must be designed so that the reader can simultaneously:
- Understand the logic (the exchange rate is internally coherent and derivable from the stated framework)
- Feel the horror (the logic does not eliminate the human cost, it just reclassifies it)
- Be implicated (the reader has, at least partially, adopted the protagonist''s framework by this point in the story, which means the reader must reckon with their own partial endorsement)

**The key design questions:**

1. **The Cost Categories** — What types of costs does the protagonist distinguish? Typical categories:
   - Direct costs to the protagonist (acceptable at a high rate if the objective return justifies it)
   - Costs to willing participants (acceptable if they are informed and compensated)
   - Costs to uninformed participants (acceptable at a much lower rate, or possibly not acceptable, depending on the protagonist''s framework)
   - Costs to uninvolved parties (this is where the moral horror lives — at what exchange rate does the protagonist accept collateral damage?)

2. **The Exchange Rate for Human Cost** — The most important and most uncomfortable question. The protagonist has, implicitly or explicitly, a model of when an uninvolved person''s loss, suffering, or death is acceptable collateral damage for a sufficiently large objective gain. This model must be made explicit, because:
   - An explicit model produces a specific, identifiable threshold — a line the reader can see and judge
   - An implicit model allows the protagonist (and the writer) to pretend the calculation is not being made when it is
   - The threshold, once established, will be tested by the story — the reader will watch as the protagonist''s actual behavior either respects or violates the threshold they articulated

3. **The Specific Prohibitions** — What will the protagonist not do, and why not? The reason matters enormously:
   - "I will not do X because it is wrong" — this is a moral prohibition, which means the protagonist has a moral floor, which means there is a potential conflict between the framework and the moral floor
   - "I will not do X because the reputational cost exceeds the expected return" — this is a strategic prohibition, which means there is no moral floor, only a cost calculation, which is a different and usually darker characterization
   - "I will not do X because I cannot calculate the downstream consequences with sufficient confidence" — this is an epistemic prohibition, which means the protagonist''s limits are informational rather than ethical

4. **The History of the Threshold** — Has the protagonist already paid specific types of costs? Have they already accepted the spending of human welfare as an instrument? If so, what was the first time, and how did they justify it then versus how they justify it now? The evolution of the threshold is a character arc in miniature.

**An example of a well-specified Acceptable Expenditure:**
"Direct personal costs: essentially unlimited if the expected value calculation supports it. Costs to consenting informed participants: acceptable at a 3:1 return ratio (they accept the risk, I provide the compensation). Costs to uninformed participants who are within the relevant system: acceptable when the expected systemic benefit exceeds the individual cost by a factor of at least 20, and only when I cannot achieve the same result through means that do not require their contribution. Costs to genuinely uninvolved parties: not acceptable as a first-order instrument. Acceptable as a known statistical risk when the objective is sufficiently large — specifically, when the objective prevents a harm to a greater number of similar parties. Note: I have paid this last cost. Twice. I do not expect to stop needing to."

---

#### Efficiency Constraints

**Purpose:** The operational limits on the protagonist''s actions — not moral prohibitions, but practical constraints derived from their own cost calculations about what is too expensive to do effectively.

**The conceptual distinction that makes this field interesting:**
Moral constraints come from outside the framework — they limit what the protagonist will do regardless of efficiency. Efficiency Constraints come from within the framework — they limit what the protagonist will do because the protagonist has calculated that doing it is not worth the cost. A protagonist with no moral constraints but robust efficiency constraints is a very specific and very interesting kind of character.

**The major categories of efficiency constraints:**

1. **Attention Economy Limits** — The protagonist cannot monitor, cultivate, and model an unlimited number of relationships and situations simultaneously. Where is the boundary? What gets deprioritized? The protagonist''s attention allocation decisions reveal their actual priorities more honestly than any stated value.

2. **Reputational Sustainability** — Some actions, even when immediately beneficial, create reputational damage that compounds over time and eventually undermines the protagonist''s ability to operate. The protagonist has a model of which actions are reputationally sustainable and which are not — not because they care about being liked, but because reputation is an operational resource.

3. **Concentration Risk** — The protagonist should be aware of over-dependency on any single asset class, relationship, or information source. What is their current exposure? What would happen if their primary relationship asset defected, or their key information source dried up?

4. **The Efficiency Cost of Deception** — Systematic deception creates an ever-growing maintenance burden: lies to remember, performances to maintain, contradictions to manage. At some scale, deception becomes inefficient. The protagonist has calculated where that threshold is. Are they currently above or below it?

5. **The Unmodelable** — There are domains where the protagonist''s model is too poor to support confident action. These are not moral prohibitions — the protagonist would act here if they could model it. They are recognized knowledge gaps that function as operational constraints: "I do not act in environments I cannot model, because my expected error rate is too high to justify the action cost."

---

### Field Interdependencies

The six fields form a complete strategic picture:

- **Ultimate Objective** is the terminal state. **Optimization Metric** is the unit of progress. Together they define the protagonist''s coordinate system.
- **Current Asset Portfolio** is the starting position. **Active Investments** are the trajectory. Together they define the protagonist''s current strategy.
- **Acceptable Expenditure** defines the moral envelope of the strategy. **Efficiency Constraints** define the operational envelope. Together they define the limits within which the strategy will be executed.

The most important interdependency: the **Acceptable Expenditure** threshold, when applied to the assets in the **Current Asset Portfolio** and the target returns of **Active Investments**, will at some point in the novel produce a situation where the protagonist must decide whether to spend a specific human cost for a specific calculated gain. That moment — and whether the protagonist''s actual behavior matches their stated threshold — is the climax of the moral argument.

---

### Common Errors

**Error 1: The Objective Without Scale**
The Ultimate Objective is impressive-sounding but modest in actual scope — achieving personal wealth, gaining a specific position, defeating a specific opponent. An objective of this scale cannot carry the moral weight of a purely rational framework. The reader will wonder why someone as intelligent as the protagonist could not simply pursue this objective through conventional means.

**Error 2: The Metric That Does Not Measure Anything**
The Optimization Metric is defined abstractly ("she measures success in power") rather than operationally. Without a specific, trackable metric, the protagonist cannot make rational decisions (they cannot calculate trade-offs between incommensurable goods), and the reader cannot evaluate whether the protagonist is winning or losing.

**Error 3: The Portfolio That Is Just Assets**
The Current Asset Portfolio lists resources without revealing the protagonist''s evaluative framework. The point of the portfolio is not to catalog what the protagonist has — it is to reveal how they think by showing what they value, how they classify it, and what they notice. A portfolio that reads like an inventory rather than a strategic document has missed the purpose of the field.

**Error 4: The Acceptable Expenditure With No Real Threshold**
The protagonist is depicted as willing to do anything, without limit, for the objective. This eliminates moral tension: there is no line to be tested, no moment where the protagonist faces a cost that genuinely challenges the framework. Without a threshold, the story has no climax — only a series of increasingly extreme acts that produce diminishing moral returns.

**Error 5: Efficiency Constraints Treated As Moral Constraints**
The writer conflates "the protagonist won''t do X because the cost is too high" with "the protagonist won''t do X because it is wrong." These are categorically different characterizations. A protagonist who never does morally horrifying things because they are never efficient is not a moral protagonist — they are a strategic one. The reader must understand the difference, because the question the story is asking is whether strategic constraints are sufficient substitutes for moral ones.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Purely Pragmatic Novel' LIMIT 1),
  1,
  12,
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
