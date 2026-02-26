-- The Purely Pragmatic Novel「Power System」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Purely Pragmatic Novel' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-pragmatic-power-system-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'pragmatic-power-system-setting-gen',
  '"Power System" setting generation: generates the quantifiable power hierarchy that the rational protagonist optimizes within for The Purely Pragmatic Novel',
  '"Power System" setting generation: generates the quantifiable power hierarchy that the rational protagonist optimizes within for The Purely Pragmatic Novel',
  '## "Power System" Setting Generation — The Purely Pragmatic Novel

The Power System module defines the external structure of power within which the rational protagonist operates. This is not merely worldbuilding decoration — it is the optimization landscape. Every field in this module should be designed with a single test in mind: can the protagonist analyze this system, identify its efficiency frontier, and calculate an optimal advancement path? If the answer is no, the power system has failed its narrative function.

The central insight of this module: the power system exists to be solved. A rational protagonist in an opaque, arbitrary, or unstructured power environment has no advantage over any other protagonist. The power system must have rules, have gaps in those rules, and have an efficiency frontier that a sufficiently intelligent actor could identify. The protagonist''s analytical edge is only visible when the system rewards analysis.

---

### Field Generation Guide

#### Power Type

**Purpose:** The fundamental category of power the world runs on — and how that category interacts with the rational protagonist''s core advantage of systematic analysis and optimization.

**Why Power Type is a narrative choice, not just a worldbuilding choice:**
Different power types create radically different analytical challenges for the rational protagonist. The genre''s signature pleasure — watching a supremely capable mind optimize through a complex system — depends entirely on the system being the right type of analyzable. The author must choose a power type with full awareness of what kind of calculation scenes it enables and what kind it forecloses.

**The major power type categories and their narrative implications for a rational protagonist:**

1. **Hard Magic Systems (Quantifiable, Rule-Bound)**
   Hard magic operates by explicit, learnable rules. There are specific inputs (resources, training, techniques) that produce specific outputs (effects, power levels, capabilities) with predictable reliability. This is the category most naturally suited to a rational protagonist, for the following reasons:
   - The system can be fully modeled given sufficient observation
   - Advancement thresholds are identifiable and therefore targetable
   - Other practitioners'' capabilities can be assessed and compared
   - Inefficiencies and underexploited techniques can be identified through analysis
   - The protagonist''s advantage is not just intelligence but systematically superior model-building

   The design challenge with hard magic: the system must be sophisticated enough that the protagonist''s optimization is non-obvious. If the optimal path is apparent to any practitioner with basic competence, the protagonist''s analytical edge disappears. The system needs hidden rules, second-order effects, counterintuitive efficiency frontiers, and exploitable gaps that reward the specific kind of systematic analysis the protagonist applies.

   Hard magic narrative signature: the protagonist achieves disproportionate results relative to their resource investment because they have identified paths that other practitioners, optimizing locally or following convention, have missed.

2. **Soft Magic Systems (Atmospheric, Incompletely Specified)**
   Soft magic operates by incomplete or inaccessible rules. Effects are real but the underlying mechanism is opaque. Power is felt but not fully calculable. This category creates a different and more interesting analytical challenge for a rational protagonist:
   - The protagonist must build a model under fundamental uncertainty
   - The model will always be incomplete, which requires explicit probability management
   - Optimization becomes: maximize expected value given irreducible uncertainty in the power model
   - The protagonist must decide how much resource to invest in understanding the system before acting on incomplete models

   The narrative advantage of soft magic for this genre: the protagonist cannot rely on complete information. They must reason under genuine uncertainty, which forces explicit probability calculations and creates opportunities for the protagonist to be wrong in systematically revealing ways. The Unknown Blind Spots from The Rational Mind module are more naturally activated in a soft magic environment.

   Soft magic narrative signature: the protagonist achieves superior results not through complete optimization but through superior model management — knowing what they don''t know, hedging appropriately, and updating faster than competitors when new information arrives.

3. **Political Power Systems**
   Political power is distributed through institutional structures, coalition dynamics, legitimacy claims, and negotiated arrangements between actors with competing interests. It is characterized by:
   - High liquidity: political power can be rapidly transferred, built, or destroyed
   - High volatility: a single event can shift the entire landscape
   - High social embeddedness: almost all political transactions require social performance
   - Network effects: the value of political assets depends heavily on the assets held by one''s allies

   For a rational protagonist, political power is the most analytically demanding type because the system is both deeply complex and deeply human. The protagonist must model not just the rules but the other players — their interests, their information, their irrationalities, their response functions. Political power rewards information asymmetry: the protagonist who knows more about the other actors than the other actors know about each other has a structural advantage.

   Political power narrative signature: the protagonist''s analytical advantage manifests as superior coalition architecture — they see alliances others don''t see, anticipate defections others don''t expect, and create structural positions that look weak but are actually resilient.

4. **Economic Power Systems**
   Economic power operates through resource control, market position, production capacity, and financial leverage. It is characterized by:
   - Quantifiability: economic resources are inherently measurable
   - Compounding: economic advantages tend to self-reinforce over time
   - Impersonality: economic transactions do not require social performance to execute
   - Convertibility: economic resources can often be converted to other power types at known exchange rates

   For a rational protagonist, economic power is comfortable because it is legible — the scoreboard is public, the rules are relatively clear, and optimization is conceptually straightforward (if operationally difficult). The narrative challenge is that economic optimization alone rarely generates moral complexity of the kind that makes this genre interesting. Economic power stories tend to be most compelling when they involve converting economic power to other types, or when the protagonist must make economic sacrifices for non-economic objectives.

5. **Hybrid Systems**
   Most interesting settings combine multiple power types with conversion mechanisms between them. The rational protagonist''s advantage in hybrid systems is identifying the optimal portfolio mix and the most efficient conversion pathways. This creates a specific analytical challenge: not just optimizing within a single power type, but managing a multi-currency portfolio where the exchange rates are dynamic and sometimes hidden.

   Hybrid systems are generally the richest environment for this genre because they create genuine strategic complexity that rewards systematic analysis.

**The critical question for Power Type selection:** What kind of calculations does this power type allow the protagonist to perform in front of the reader? Those calculations are the story''s primary pleasure delivery mechanism.

---

#### Power Mechanics

**Purpose:** The operational rules of the power system — specific enough that the protagonist (and the reader) can use them to derive predictions, identify inefficiencies, and plan optimization strategies.

**The design standard for Power Mechanics:**
Power Mechanics must pass the "protagonist''s model" test. The author should be able to write a scene where the protagonist, based on their understanding of the mechanics, makes a prediction about what will happen if they take a specific action. The mechanics are well-designed if: (a) the prediction is derivable from the rules, (b) the prediction is non-obvious to other characters, and (c) the prediction turns out to be correct (or interestingly wrong in ways that reveal gaps in the model).

**The three essential properties of a analytically productive power system:**

1. **The System Must Have Rules**
   Not just "there are rules," but specific, operational rules that can be learned, internalized, and applied. Rules should include:
   - Inputs required to advance (what resources, actions, or conditions are necessary for power growth?)
   - Output functions (given specific inputs, what power growth is produced?)
   - Capacity constraints (are there limits on how fast advancement can occur, or how much power can be held simultaneously?)
   - Interaction rules (how does this practitioner''s power interact with another''s — additively, multiplicatively, with specific counters and weaknesses?)
   - Degradation conditions (under what conditions does power decrease or become inaccessible?)

2. **The System Must Have Gaps**
   Every power system has inefficiencies — paths that are underexplored, techniques that are deprecated but functional, combinations that are non-obvious but highly effective. These gaps are the protagonist''s opportunity space. Design them deliberately:
   - Convention gaps: paths that are avoided because of cultural assumptions, not because they are inefficient
   - Information gaps: techniques that are unknown because the knowledge has been lost or suppressed
   - Combination gaps: interactions between sub-systems that produce non-obvious synergies
   - Scale gaps: techniques that are inefficient at low power levels but become dominant at high power levels (or vice versa)

   The protagonist''s analytical advantage is their ability to identify and exploit these gaps while other practitioners remain on conventional paths.

3. **The System Must Have an Efficiency Frontier**
   There exists a theoretical maximum performance achievable with given resources — a Pareto frontier of optimal strategies. Most practitioners operate well inside this frontier, either because they lack information about the frontier''s location, or because they lack the discipline to execute frontier-adjacent strategies. The protagonist''s goal is to operate as close to the frontier as possible, and eventually, to find strategies that push the frontier itself.

   The efficiency frontier creates the genre''s central calculation pleasure: the protagonist identifies where the frontier is, how far current practitioners are from it, and what path would close the gap. This is the "math problem" the reader is being invited to watch the protagonist solve.

**Power Mechanics interaction design:**
The mechanics must also specify what happens when practitioners interact. A power system where all interaction is direct confrontation (the stronger practitioner always wins) has limited strategic complexity. Richer systems feature:
- Asymmetric matchups: power configurations that beat higher-ranked opponents in specific contexts
- Strategic timing: advantages that are position-dependent rather than power-level dependent
- Information-based advantages: outcomes that depend on what each practitioner knows about the other''s capabilities
- Coalition mechanics: how multiple practitioners can combine to exceed what individuals can achieve

---

#### Acquisition Cost Analysis

**Purpose:** A systematic analysis of the cost structure of power advancement — what resources, time, and sacrifices are required to move from each tier to the next, and how those costs scale.

**Why this field is mandatory for the rational protagonist:**
A rational protagonist does not just want to advance. They want to advance efficiently. To do so, they must first model the cost structure of advancement with precision. The Acquisition Cost Analysis is the protagonist''s first major piece of analytical work in the power system — and producing it is a significant demonstration of their analytical capability.

**The four dimensions of a complete cost analysis:**

1. **Resource Requirements Per Tier**
   For each advancement threshold in the power hierarchy, specify:
   - Primary resources required (the main input that advancement consumes)
   - Secondary resources required (supporting inputs, often underappreciated)
   - Time minimum (is there a minimum calendar time regardless of resource availability?)
   - Bottleneck resource (which resource is most likely to constrain advancement?)

   The protagonist should map these requirements across all relevant tiers, not just the next one. Long-range planning requires knowing the full cost structure, not just the immediate next step.

2. **Marginal Cost Scaling**
   How do resource requirements change as rank increases? Three common patterns, each with different strategic implications:
   - **Exponential scaling (diminishing returns to effort):** Each tier costs dramatically more than the last. This creates a natural equilibrium level where most practitioners stop, because the cost of further advancement is not worth the marginal power gain. Strategic implication: the protagonist should identify the tier where most competitors stop and design around being ahead of that tier without necessarily pushing to the absolute maximum.
   - **Linear scaling (constant marginal cost):** Each tier costs approximately the same. This is rare in practice but creates a simple optimization problem. Strategic implication: advancement is purely a function of resource accumulation, so the bottleneck is resource acquisition.
   - **Non-monotonic scaling (efficiency cliffs and valleys):** Some tiers are dramatically cheaper or more expensive than adjacent tiers. This is the most interesting pattern for a rational protagonist because it creates exploitable inefficiencies — certain advancement levels that are "underpriced" relative to the power they confer. Strategic implication: the protagonist specifically targets underpriced tiers while deferring expensive ones.

3. **Shortcut Analysis**
   What are the known and unknown shortcuts in the advancement structure? Shortcuts are paths that bypass conventional costs by substituting alternative (often riskier or less accessible) resources:
   - **Talent-based shortcuts:** Natural aptitude that reduces training costs
   - **Knowledge-based shortcuts:** Understanding of the system that allows more efficient resource use
   - **Resource substitution shortcuts:** Alternative inputs that can replace conventional ones at different cost ratios
   - **Risk-premium shortcuts:** High-probability-of-failure paths that yield faster advancement if successful
   - **Exploitative shortcuts:** Paths that extract advancement cost from others (taking power from competitors, inheriting accumulated power, etc.)

   The protagonist''s analytical advantage often reveals shortcuts invisible to convention-following practitioners. This should be a specific, concrete discovery — not "the protagonist is clever" but "the protagonist notices that technique X, while deprecated, is actually more resource-efficient than the conventional technique Y for practitioners with characteristic Z."

4. **The Optimal Stopping Analysis**
   At what tier does further advancement become net-negative relative to the protagonist''s Ultimate Objective? This is the question most practitioners never ask because they assume more power is always better. The rational protagonist asks it explicitly:
   - What is the marginal return to additional power at each tier, measured in terms of the Ultimate Objective?
   - Is there a tier beyond which power investment cannibalizes other resources (time, attention, social capital) that are more valuable for the objective than the additional power would be?
   - Is there a strategic advantage to being perceived as lower-ranked than one actually is?

---

#### Protagonist''s Current Position

**Purpose:** A precise, unflinching assessment of where the protagonist currently stands in the power hierarchy — including not just rank, but relative positioning on every dimension the system measures.

**The purpose of this field is not exposition — it is characterization.**
How the protagonist assesses their current position reveals the quality of their self-model. A protagonist who assesses themselves accurately (including disadvantages and weaknesses) is a more sophisticated analyst than one who focuses on strengths. The assessment should make the protagonist''s strategic situation clear to the reader: where they are strong, where they are weak, and what that means for the path forward.

**The four components of a complete current position assessment:**

1. **Absolute Rank**
   The protagonist''s position in the power hierarchy by whatever metric the system uses. This should be stated precisely — not "mid-tier" but "the 7th percentile of active practitioners in this region, which places them in the bottom of the third tier by conventional classification."

2. **Relative Advantage Profile**
   Where within their tier does the protagonist exceed typical performance, and where do they underperform? This creates a nuanced picture: the protagonist is not just a rank, they are a specific capability profile within that rank. Examples:
   - "At tier 3, conventional practitioners have balanced development across all six attributes. I have 180% of typical tier 3 performance in analytical application and 60% in raw power output. This makes me less effective in direct confrontation than my rank implies, and significantly more effective in scenarios that reward precision over force."
   - "My information-gathering capability exceeds typical tier 4 performance despite my tier 3 rank. This creates an effective intelligence advantage two tiers above my combat rank."

3. **Identified Opportunities**
   Specific gaps in the current landscape that the protagonist has identified as exploitable. These should be concrete: not "there are opportunities" but "practitioner X at tier 5 has an obvious dependency on resource Y; if that dependency is disrupted, they will be forced to operate at effective tier 4 for at least three months, during which window my relative position improves significantly."

4. **Competitive Gap Analysis**
   How far is the protagonist from the key thresholds in the power hierarchy? Not just the next tier, but the tiers that are strategically significant — the tier at which they become a credible threat to specific adversaries, the tier at which specific resources become accessible, the tier at which they can operate in specific arenas.

---

#### Optimal Advancement Path

**Purpose:** The protagonist''s calculated optimal sequence of advancement actions — and, critically, the explicit reasoning for why this sequence was chosen over alternatives.

**This is the most important field in the module for reader satisfaction.**
The core pleasure of the rational protagonist genre is watching a supremely capable mind make non-obvious choices for compelling reasons. The Optimal Advancement Path is where that pleasure is concentrated. The reader should be able to follow the protagonist''s reasoning, understand why alternative paths were rejected, and feel the satisfaction of seeing a well-constructed plan unfold — or the productive tension of watching it encounter unexpected obstacles.

**The design structure for a satisfying Optimal Advancement Path:**

1. **The Path Itself**
   A specific sequence of actions, investments, and advancement milestones. Not "advance through the tiers," but "Phase 1: acquire resource X through mechanism Y (12-18 months); Phase 2: exploit the underpriced advancement gap between tier 4 and 5 using technique Z; Phase 3: use tier 5 access to information source A to identify the actual bottleneck in tier 6 advancement, which conventional models misidentify."

2. **The Rejected Alternatives**
   This is the most important component. The protagonist should have explicitly considered and rejected alternative paths, with specific reasoning. This serves two purposes:
   - It demonstrates the quality of the protagonist''s analysis (they considered alternatives, not just the obvious path)
   - It tells the reader what the protagonist believes they are giving up and why the tradeoff is acceptable

   Examples of well-specified rejections:
   - "The conventional path through tier 4 via resource accumulation was rejected because at current accumulation rates, the time cost exceeds the strategic window for the objective."
   - "The fast-track path via high-risk resource extraction was rejected because the failure probability of 35% creates an unacceptable setback scenario that delays the objective by approximately 4 years."
   - "The alliance-based acceleration path was rejected because the social capital expenditure required would deplete resources needed for phase 3."

3. **The Key Assumptions**
   The path depends on specific assumptions about the world that may turn out to be wrong. Explicit identification of these assumptions serves as foreshadowing: the reader is primed to notice when an assumption is violated, which creates dramatic tension.

4. **The Contingency Map**
   What does the protagonist do if key assumptions fail? A well-designed rational protagonist does not have a single plan — they have a decision tree. The branches should be specified at least one level deep: "If assumption A fails, switch to alternative B, accepting the following costs."

**The calculation scene as narrative unit:**
The Optimal Advancement Path field should generate specific scenes where the protagonist explicitly works through a calculation. These scenes are the genre''s signature set-piece. They work best when:
- The calculation involves specific numbers or qualitative comparisons that the reader can follow
- The conclusion is non-obvious (the reader could not have derived it without the protagonist''s analytical work)
- The conclusion is revealed to be correct (or wrong in illuminating ways) later in the story

---

#### Key Resource Bottlenecks

**Purpose:** The specific scarcities that constrain advancement — and how those scarcities create plot pressure, force difficult choices, and drive the narrative forward.

**Bottlenecks are not obstacles. They are plot engines.**
A bottleneck in the power system is a narrative mechanism that creates guaranteed story moments: the protagonist must either find a way to overcome the bottleneck (which requires a specific analytical or strategic solution), circumvent it (which requires finding an alternative resource or path), or accept a cost (which tests the Acceptable Expenditure thresholds from the Objective Architecture module).

**The three categories of bottlenecks and their narrative functions:**

1. **Resource Scarcity Bottlenecks**
   The advancement input is genuinely scarce — there is not enough of it in the world to allow all practitioners to advance freely. Narrative function: creates competition, which creates conflict. The protagonist must either outcompete others for the scarce resource, find alternative sources, or reduce their consumption rate through efficiency gains.

   Design requirement: specify why the resource is scarce, who controls access to it, and what the market for it looks like. The protagonist''s analysis of the bottleneck should reveal information about the power structure that goes beyond the surface appearance.

2. **Structural Access Bottlenecks**
   The advancement path requires access to knowledge, techniques, or facilities that are controlled by specific actors. The bottleneck is not scarcity of the underlying resource, but gatekeeping of access. Narrative function: forces the protagonist to either earn access through legitimate channels (which requires interacting with gatekeepers, who are characters), circumvent the gatekeeping (which requires creative problem-solving and has costs), or find alternative paths that bypass the controlled access entirely.

3. **Knowledge Bottlenecks**
   The protagonist does not know what is required to advance — not because the information doesn''t exist, but because it hasn''t been acquired yet. Narrative function: creates information-seeking arcs where the protagonist must invest in intelligence-gathering before they can invest efficiently in advancement. The knowledge bottleneck is particularly interesting because solving it changes the protagonist''s understanding of all other bottlenecks.

**Bottleneck interactions with other modules:**
- When a bottleneck requires social capital to overcome, it activates the Social Performance field from The Rational Mind module
- When a bottleneck requires resource expenditure that approaches the protagonist''s Acceptable Expenditure threshold, it creates moral tension
- When a bottleneck reveals information about the power structure that contradicts the protagonist''s model, it forces an update to the protagonist''s decision framework

---

### Field Interdependencies

The Power System module does not operate in isolation. Its fields interact with the other core modules of The Purely Pragmatic Novel in specific, important ways:

**Power System ↔ Objective Architecture:**
The protagonist''s Ultimate Objective (from Objective Architecture) determines which tier of the power system they actually need to reach, and therefore which portions of the cost analysis are relevant. A protagonist who needs access to tier 6 resources for their objective does not need to optimize advancement beyond tier 6, even if tier 7 is achievable. The Acquisition Cost Analysis should be conducted with the Ultimate Objective''s power requirements as the termination condition.

The Optimization Metric (from Objective Architecture) determines how the protagonist converts power advancement into objective progress. Different metrics value different aspects of power (raw capability, access, information, social standing within the practitioner hierarchy) in different proportions. The Optimal Advancement Path should be designed to maximize power value as denominated in the protagonist''s specific Optimization Metric, not in generic "power."

**Power System ↔ The Rational Mind:**
The protagonist''s Decision Framework (from The Rational Mind) determines how they process tradeoffs in the Acquisition Cost Analysis — specifically, how they weight time costs against resource costs, how they handle uncertainty in the shortcut analysis, and what revision triggers would cause them to update the Optimal Advancement Path.

The Unknown Blind Spots (from The Rational Mind) should contain at least one blind spot that is specifically connected to the Power System design. The most powerful version: the protagonist''s power system model contains a systematic error that is invisible to them because it is embedded in their analytical framework, not in their information. This error should become consequential at a specific point in the advancement path.

---

### Common Errors

**Error 1: The Opaque Power System**
The power system is designed to feel mysterious and awe-inspiring, with deliberately incomprehensible mechanics and arbitrary-seeming power levels. This eliminates the rational protagonist''s central advantage. If the system cannot be analyzed, the protagonist''s analytical capability produces no edge. The result is a rational protagonist who is simply a talented practitioner, indistinguishable from any other protagonist type. Mystery is appropriate for specific elements of the system, but the core mechanics must be analyzable.

**Error 2: The Power System With No Gaps**
Every advancement path is equally efficient; the conventional path is also the optimal path; there are no underexploited techniques or hidden efficiencies. This eliminates the protagonist''s analytical advantage, because the analysis produces no actionable insights that differ from conventional wisdom. If the smartest possible analysis of the power system produces the same advice as "just do what everyone else does," the system has failed its genre function.

**Error 3: The Power System That Rewards Effort, Not Intelligence**
Power advancement is purely a function of accumulated training time, resource expenditure, or raw talent — and the protagonist advances faster than others only because they train harder or have more resources. This is a story about diligence and resource advantage, not analytical advantage. The rational protagonist''s edge must come from the quality of their analysis, not from outspending or outworking competitors.

**Error 4: The Protagonist Who Skips the Analysis**
The protagonist has analytical capabilities that are asserted but not demonstrated. They advance efficiently, but the reader never sees the specific calculations that justify the efficiency. This is the cardinal sin of the genre: telling the reader the protagonist is smart rather than showing the protagonist being smart. The Power System fields should generate specific scenes where the protagonist conducts visible analytical work that produces non-obvious insights.

**Error 5: The Cost Analysis That Never Bites**
The Acquisition Cost Analysis identifies bottlenecks and costs, but those costs are never actually paid. The protagonist always finds a way around every constraint without genuine sacrifice. This eliminates tension and makes the power system feel like a formality rather than a real constraint. The bottlenecks must bite at least once in the story — the protagonist must face a situation where the cost analysis''s worst-case scenario is realized, and the Acceptable Expenditure thresholds are genuinely tested.',
  '"Power System" setting generation: generates the quantifiable power hierarchy that the rational protagonist optimizes within for The Purely Pragmatic Novel

The Power System module defines the external structure of power within which the rational protagonist operates. This is not merely worldbuilding decoration — it is the optimization landscape. Every field in this module should be designed with a single test in mind: can the protagonist analyze this system, identify its efficiency frontier, and calculate an optimal advancement path? If the answer is no, the power system has failed its narrative function.

The central insight of this module: the power system exists to be solved. A rational protagonist in an opaque, arbitrary, or unstructured power environment has no advantage over any other protagonist. The power system must have rules, have gaps in those rules, and have an efficiency frontier that a sufficiently intelligent actor could identify. The protagonist''s analytical edge is only visible when the system rewards analysis.

---

### Field Generation Guide

#### Power Type

**Purpose:** The fundamental category of power the world runs on — and how that category interacts with the rational protagonist''s core advantage of systematic analysis and optimization.

**Why Power Type is a narrative choice, not just a worldbuilding choice:**
Different power types create radically different analytical challenges for the rational protagonist. The genre''s signature pleasure — watching a supremely capable mind optimize through a complex system — depends entirely on the system being the right type of analyzable. The author must choose a power type with full awareness of what kind of calculation scenes it enables and what kind it forecloses.

**The major power type categories and their narrative implications for a rational protagonist:**

1. **Hard Magic Systems (Quantifiable, Rule-Bound)**
   Hard magic operates by explicit, learnable rules. There are specific inputs (resources, training, techniques) that produce specific outputs (effects, power levels, capabilities) with predictable reliability. This is the category most naturally suited to a rational protagonist, for the following reasons:
   - The system can be fully modeled given sufficient observation
   - Advancement thresholds are identifiable and therefore targetable
   - Other practitioners'' capabilities can be assessed and compared
   - Inefficiencies and underexploited techniques can be identified through analysis
   - The protagonist''s advantage is not just intelligence but systematically superior model-building

   The design challenge with hard magic: the system must be sophisticated enough that the protagonist''s optimization is non-obvious. If the optimal path is apparent to any practitioner with basic competence, the protagonist''s analytical edge disappears. The system needs hidden rules, second-order effects, counterintuitive efficiency frontiers, and exploitable gaps that reward the specific kind of systematic analysis the protagonist applies.

   Hard magic narrative signature: the protagonist achieves disproportionate results relative to their resource investment because they have identified paths that other practitioners, optimizing locally or following convention, have missed.

2. **Soft Magic Systems (Atmospheric, Incompletely Specified)**
   Soft magic operates by incomplete or inaccessible rules. Effects are real but the underlying mechanism is opaque. Power is felt but not fully calculable. This category creates a different and more interesting analytical challenge for a rational protagonist:
   - The protagonist must build a model under fundamental uncertainty
   - The model will always be incomplete, which requires explicit probability management
   - Optimization becomes: maximize expected value given irreducible uncertainty in the power model
   - The protagonist must decide how much resource to invest in understanding the system before acting on incomplete models

   The narrative advantage of soft magic for this genre: the protagonist cannot rely on complete information. They must reason under genuine uncertainty, which forces explicit probability calculations and creates opportunities for the protagonist to be wrong in systematically revealing ways. The Unknown Blind Spots from The Rational Mind module are more naturally activated in a soft magic environment.

   Soft magic narrative signature: the protagonist achieves superior results not through complete optimization but through superior model management — knowing what they don''t know, hedging appropriately, and updating faster than competitors when new information arrives.

3. **Political Power Systems**
   Political power is distributed through institutional structures, coalition dynamics, legitimacy claims, and negotiated arrangements between actors with competing interests. It is characterized by:
   - High liquidity: political power can be rapidly transferred, built, or destroyed
   - High volatility: a single event can shift the entire landscape
   - High social embeddedness: almost all political transactions require social performance
   - Network effects: the value of political assets depends heavily on the assets held by one''s allies

   For a rational protagonist, political power is the most analytically demanding type because the system is both deeply complex and deeply human. The protagonist must model not just the rules but the other players — their interests, their information, their irrationalities, their response functions. Political power rewards information asymmetry: the protagonist who knows more about the other actors than the other actors know about each other has a structural advantage.

   Political power narrative signature: the protagonist''s analytical advantage manifests as superior coalition architecture — they see alliances others don''t see, anticipate defections others don''t expect, and create structural positions that look weak but are actually resilient.

4. **Economic Power Systems**
   Economic power operates through resource control, market position, production capacity, and financial leverage. It is characterized by:
   - Quantifiability: economic resources are inherently measurable
   - Compounding: economic advantages tend to self-reinforce over time
   - Impersonality: economic transactions do not require social performance to execute
   - Convertibility: economic resources can often be converted to other power types at known exchange rates

   For a rational protagonist, economic power is comfortable because it is legible — the scoreboard is public, the rules are relatively clear, and optimization is conceptually straightforward (if operationally difficult). The narrative challenge is that economic optimization alone rarely generates moral complexity of the kind that makes this genre interesting. Economic power stories tend to be most compelling when they involve converting economic power to other types, or when the protagonist must make economic sacrifices for non-economic objectives.

5. **Hybrid Systems**
   Most interesting settings combine multiple power types with conversion mechanisms between them. The rational protagonist''s advantage in hybrid systems is identifying the optimal portfolio mix and the most efficient conversion pathways. This creates a specific analytical challenge: not just optimizing within a single power type, but managing a multi-currency portfolio where the exchange rates are dynamic and sometimes hidden.

   Hybrid systems are generally the richest environment for this genre because they create genuine strategic complexity that rewards systematic analysis.

**The critical question for Power Type selection:** What kind of calculations does this power type allow the protagonist to perform in front of the reader? Those calculations are the story''s primary pleasure delivery mechanism.

---

#### Power Mechanics

**Purpose:** The operational rules of the power system — specific enough that the protagonist (and the reader) can use them to derive predictions, identify inefficiencies, and plan optimization strategies.

**The design standard for Power Mechanics:**
Power Mechanics must pass the "protagonist''s model" test. The author should be able to write a scene where the protagonist, based on their understanding of the mechanics, makes a prediction about what will happen if they take a specific action. The mechanics are well-designed if: (a) the prediction is derivable from the rules, (b) the prediction is non-obvious to other characters, and (c) the prediction turns out to be correct (or interestingly wrong in ways that reveal gaps in the model).

**The three essential properties of a analytically productive power system:**

1. **The System Must Have Rules**
   Not just "there are rules," but specific, operational rules that can be learned, internalized, and applied. Rules should include:
   - Inputs required to advance (what resources, actions, or conditions are necessary for power growth?)
   - Output functions (given specific inputs, what power growth is produced?)
   - Capacity constraints (are there limits on how fast advancement can occur, or how much power can be held simultaneously?)
   - Interaction rules (how does this practitioner''s power interact with another''s — additively, multiplicatively, with specific counters and weaknesses?)
   - Degradation conditions (under what conditions does power decrease or become inaccessible?)

2. **The System Must Have Gaps**
   Every power system has inefficiencies — paths that are underexplored, techniques that are deprecated but functional, combinations that are non-obvious but highly effective. These gaps are the protagonist''s opportunity space. Design them deliberately:
   - Convention gaps: paths that are avoided because of cultural assumptions, not because they are inefficient
   - Information gaps: techniques that are unknown because the knowledge has been lost or suppressed
   - Combination gaps: interactions between sub-systems that produce non-obvious synergies
   - Scale gaps: techniques that are inefficient at low power levels but become dominant at high power levels (or vice versa)

   The protagonist''s analytical advantage is their ability to identify and exploit these gaps while other practitioners remain on conventional paths.

3. **The System Must Have an Efficiency Frontier**
   There exists a theoretical maximum performance achievable with given resources — a Pareto frontier of optimal strategies. Most practitioners operate well inside this frontier, either because they lack information about the frontier''s location, or because they lack the discipline to execute frontier-adjacent strategies. The protagonist''s goal is to operate as close to the frontier as possible, and eventually, to find strategies that push the frontier itself.

   The efficiency frontier creates the genre''s central calculation pleasure: the protagonist identifies where the frontier is, how far current practitioners are from it, and what path would close the gap. This is the "math problem" the reader is being invited to watch the protagonist solve.

**Power Mechanics interaction design:**
The mechanics must also specify what happens when practitioners interact. A power system where all interaction is direct confrontation (the stronger practitioner always wins) has limited strategic complexity. Richer systems feature:
- Asymmetric matchups: power configurations that beat higher-ranked opponents in specific contexts
- Strategic timing: advantages that are position-dependent rather than power-level dependent
- Information-based advantages: outcomes that depend on what each practitioner knows about the other''s capabilities
- Coalition mechanics: how multiple practitioners can combine to exceed what individuals can achieve

---

#### Acquisition Cost Analysis

**Purpose:** A systematic analysis of the cost structure of power advancement — what resources, time, and sacrifices are required to move from each tier to the next, and how those costs scale.

**Why this field is mandatory for the rational protagonist:**
A rational protagonist does not just want to advance. They want to advance efficiently. To do so, they must first model the cost structure of advancement with precision. The Acquisition Cost Analysis is the protagonist''s first major piece of analytical work in the power system — and producing it is a significant demonstration of their analytical capability.

**The four dimensions of a complete cost analysis:**

1. **Resource Requirements Per Tier**
   For each advancement threshold in the power hierarchy, specify:
   - Primary resources required (the main input that advancement consumes)
   - Secondary resources required (supporting inputs, often underappreciated)
   - Time minimum (is there a minimum calendar time regardless of resource availability?)
   - Bottleneck resource (which resource is most likely to constrain advancement?)

   The protagonist should map these requirements across all relevant tiers, not just the next one. Long-range planning requires knowing the full cost structure, not just the immediate next step.

2. **Marginal Cost Scaling**
   How do resource requirements change as rank increases? Three common patterns, each with different strategic implications:
   - **Exponential scaling (diminishing returns to effort):** Each tier costs dramatically more than the last. This creates a natural equilibrium level where most practitioners stop, because the cost of further advancement is not worth the marginal power gain. Strategic implication: the protagonist should identify the tier where most competitors stop and design around being ahead of that tier without necessarily pushing to the absolute maximum.
   - **Linear scaling (constant marginal cost):** Each tier costs approximately the same. This is rare in practice but creates a simple optimization problem. Strategic implication: advancement is purely a function of resource accumulation, so the bottleneck is resource acquisition.
   - **Non-monotonic scaling (efficiency cliffs and valleys):** Some tiers are dramatically cheaper or more expensive than adjacent tiers. This is the most interesting pattern for a rational protagonist because it creates exploitable inefficiencies — certain advancement levels that are "underpriced" relative to the power they confer. Strategic implication: the protagonist specifically targets underpriced tiers while deferring expensive ones.

3. **Shortcut Analysis**
   What are the known and unknown shortcuts in the advancement structure? Shortcuts are paths that bypass conventional costs by substituting alternative (often riskier or less accessible) resources:
   - **Talent-based shortcuts:** Natural aptitude that reduces training costs
   - **Knowledge-based shortcuts:** Understanding of the system that allows more efficient resource use
   - **Resource substitution shortcuts:** Alternative inputs that can replace conventional ones at different cost ratios
   - **Risk-premium shortcuts:** High-probability-of-failure paths that yield faster advancement if successful
   - **Exploitative shortcuts:** Paths that extract advancement cost from others (taking power from competitors, inheriting accumulated power, etc.)

   The protagonist''s analytical advantage often reveals shortcuts invisible to convention-following practitioners. This should be a specific, concrete discovery — not "the protagonist is clever" but "the protagonist notices that technique X, while deprecated, is actually more resource-efficient than the conventional technique Y for practitioners with characteristic Z."

4. **The Optimal Stopping Analysis**
   At what tier does further advancement become net-negative relative to the protagonist''s Ultimate Objective? This is the question most practitioners never ask because they assume more power is always better. The rational protagonist asks it explicitly:
   - What is the marginal return to additional power at each tier, measured in terms of the Ultimate Objective?
   - Is there a tier beyond which power investment cannibalizes other resources (time, attention, social capital) that are more valuable for the objective than the additional power would be?
   - Is there a strategic advantage to being perceived as lower-ranked than one actually is?

---

#### Protagonist''s Current Position

**Purpose:** A precise, unflinching assessment of where the protagonist currently stands in the power hierarchy — including not just rank, but relative positioning on every dimension the system measures.

**The purpose of this field is not exposition — it is characterization.**
How the protagonist assesses their current position reveals the quality of their self-model. A protagonist who assesses themselves accurately (including disadvantages and weaknesses) is a more sophisticated analyst than one who focuses on strengths. The assessment should make the protagonist''s strategic situation clear to the reader: where they are strong, where they are weak, and what that means for the path forward.

**The four components of a complete current position assessment:**

1. **Absolute Rank**
   The protagonist''s position in the power hierarchy by whatever metric the system uses. This should be stated precisely — not "mid-tier" but "the 7th percentile of active practitioners in this region, which places them in the bottom of the third tier by conventional classification."

2. **Relative Advantage Profile**
   Where within their tier does the protagonist exceed typical performance, and where do they underperform? This creates a nuanced picture: the protagonist is not just a rank, they are a specific capability profile within that rank. Examples:
   - "At tier 3, conventional practitioners have balanced development across all six attributes. I have 180% of typical tier 3 performance in analytical application and 60% in raw power output. This makes me less effective in direct confrontation than my rank implies, and significantly more effective in scenarios that reward precision over force."
   - "My information-gathering capability exceeds typical tier 4 performance despite my tier 3 rank. This creates an effective intelligence advantage two tiers above my combat rank."

3. **Identified Opportunities**
   Specific gaps in the current landscape that the protagonist has identified as exploitable. These should be concrete: not "there are opportunities" but "practitioner X at tier 5 has an obvious dependency on resource Y; if that dependency is disrupted, they will be forced to operate at effective tier 4 for at least three months, during which window my relative position improves significantly."

4. **Competitive Gap Analysis**
   How far is the protagonist from the key thresholds in the power hierarchy? Not just the next tier, but the tiers that are strategically significant — the tier at which they become a credible threat to specific adversaries, the tier at which specific resources become accessible, the tier at which they can operate in specific arenas.

---

#### Optimal Advancement Path

**Purpose:** The protagonist''s calculated optimal sequence of advancement actions — and, critically, the explicit reasoning for why this sequence was chosen over alternatives.

**This is the most important field in the module for reader satisfaction.**
The core pleasure of the rational protagonist genre is watching a supremely capable mind make non-obvious choices for compelling reasons. The Optimal Advancement Path is where that pleasure is concentrated. The reader should be able to follow the protagonist''s reasoning, understand why alternative paths were rejected, and feel the satisfaction of seeing a well-constructed plan unfold — or the productive tension of watching it encounter unexpected obstacles.

**The design structure for a satisfying Optimal Advancement Path:**

1. **The Path Itself**
   A specific sequence of actions, investments, and advancement milestones. Not "advance through the tiers," but "Phase 1: acquire resource X through mechanism Y (12-18 months); Phase 2: exploit the underpriced advancement gap between tier 4 and 5 using technique Z; Phase 3: use tier 5 access to information source A to identify the actual bottleneck in tier 6 advancement, which conventional models misidentify."

2. **The Rejected Alternatives**
   This is the most important component. The protagonist should have explicitly considered and rejected alternative paths, with specific reasoning. This serves two purposes:
   - It demonstrates the quality of the protagonist''s analysis (they considered alternatives, not just the obvious path)
   - It tells the reader what the protagonist believes they are giving up and why the tradeoff is acceptable

   Examples of well-specified rejections:
   - "The conventional path through tier 4 via resource accumulation was rejected because at current accumulation rates, the time cost exceeds the strategic window for the objective."
   - "The fast-track path via high-risk resource extraction was rejected because the failure probability of 35% creates an unacceptable setback scenario that delays the objective by approximately 4 years."
   - "The alliance-based acceleration path was rejected because the social capital expenditure required would deplete resources needed for phase 3."

3. **The Key Assumptions**
   The path depends on specific assumptions about the world that may turn out to be wrong. Explicit identification of these assumptions serves as foreshadowing: the reader is primed to notice when an assumption is violated, which creates dramatic tension.

4. **The Contingency Map**
   What does the protagonist do if key assumptions fail? A well-designed rational protagonist does not have a single plan — they have a decision tree. The branches should be specified at least one level deep: "If assumption A fails, switch to alternative B, accepting the following costs."

**The calculation scene as narrative unit:**
The Optimal Advancement Path field should generate specific scenes where the protagonist explicitly works through a calculation. These scenes are the genre''s signature set-piece. They work best when:
- The calculation involves specific numbers or qualitative comparisons that the reader can follow
- The conclusion is non-obvious (the reader could not have derived it without the protagonist''s analytical work)
- The conclusion is revealed to be correct (or wrong in illuminating ways) later in the story

---

#### Key Resource Bottlenecks

**Purpose:** The specific scarcities that constrain advancement — and how those scarcities create plot pressure, force difficult choices, and drive the narrative forward.

**Bottlenecks are not obstacles. They are plot engines.**
A bottleneck in the power system is a narrative mechanism that creates guaranteed story moments: the protagonist must either find a way to overcome the bottleneck (which requires a specific analytical or strategic solution), circumvent it (which requires finding an alternative resource or path), or accept a cost (which tests the Acceptable Expenditure thresholds from the Objective Architecture module).

**The three categories of bottlenecks and their narrative functions:**

1. **Resource Scarcity Bottlenecks**
   The advancement input is genuinely scarce — there is not enough of it in the world to allow all practitioners to advance freely. Narrative function: creates competition, which creates conflict. The protagonist must either outcompete others for the scarce resource, find alternative sources, or reduce their consumption rate through efficiency gains.

   Design requirement: specify why the resource is scarce, who controls access to it, and what the market for it looks like. The protagonist''s analysis of the bottleneck should reveal information about the power structure that goes beyond the surface appearance.

2. **Structural Access Bottlenecks**
   The advancement path requires access to knowledge, techniques, or facilities that are controlled by specific actors. The bottleneck is not scarcity of the underlying resource, but gatekeeping of access. Narrative function: forces the protagonist to either earn access through legitimate channels (which requires interacting with gatekeepers, who are characters), circumvent the gatekeeping (which requires creative problem-solving and has costs), or find alternative paths that bypass the controlled access entirely.

3. **Knowledge Bottlenecks**
   The protagonist does not know what is required to advance — not because the information doesn''t exist, but because it hasn''t been acquired yet. Narrative function: creates information-seeking arcs where the protagonist must invest in intelligence-gathering before they can invest efficiently in advancement. The knowledge bottleneck is particularly interesting because solving it changes the protagonist''s understanding of all other bottlenecks.

**Bottleneck interactions with other modules:**
- When a bottleneck requires social capital to overcome, it activates the Social Performance field from The Rational Mind module
- When a bottleneck requires resource expenditure that approaches the protagonist''s Acceptable Expenditure threshold, it creates moral tension
- When a bottleneck reveals information about the power structure that contradicts the protagonist''s model, it forces an update to the protagonist''s decision framework

---

### Field Interdependencies

The Power System module does not operate in isolation. Its fields interact with the other core modules of The Purely Pragmatic Novel in specific, important ways:

**Power System ↔ Objective Architecture:**
The protagonist''s Ultimate Objective (from Objective Architecture) determines which tier of the power system they actually need to reach, and therefore which portions of the cost analysis are relevant. A protagonist who needs access to tier 6 resources for their objective does not need to optimize advancement beyond tier 6, even if tier 7 is achievable. The Acquisition Cost Analysis should be conducted with the Ultimate Objective''s power requirements as the termination condition.

The Optimization Metric (from Objective Architecture) determines how the protagonist converts power advancement into objective progress. Different metrics value different aspects of power (raw capability, access, information, social standing within the practitioner hierarchy) in different proportions. The Optimal Advancement Path should be designed to maximize power value as denominated in the protagonist''s specific Optimization Metric, not in generic "power."

**Power System ↔ The Rational Mind:**
The protagonist''s Decision Framework (from The Rational Mind) determines how they process tradeoffs in the Acquisition Cost Analysis — specifically, how they weight time costs against resource costs, how they handle uncertainty in the shortcut analysis, and what revision triggers would cause them to update the Optimal Advancement Path.

The Unknown Blind Spots (from The Rational Mind) should contain at least one blind spot that is specifically connected to the Power System design. The most powerful version: the protagonist''s power system model contains a systematic error that is invisible to them because it is embedded in their analytical framework, not in their information. This error should become consequential at a specific point in the advancement path.

---

### Common Errors

**Error 1: The Opaque Power System**
The power system is designed to feel mysterious and awe-inspiring, with deliberately incomprehensible mechanics and arbitrary-seeming power levels. This eliminates the rational protagonist''s central advantage. If the system cannot be analyzed, the protagonist''s analytical capability produces no edge. The result is a rational protagonist who is simply a talented practitioner, indistinguishable from any other protagonist type. Mystery is appropriate for specific elements of the system, but the core mechanics must be analyzable.

**Error 2: The Power System With No Gaps**
Every advancement path is equally efficient; the conventional path is also the optimal path; there are no underexploited techniques or hidden efficiencies. This eliminates the protagonist''s analytical advantage, because the analysis produces no actionable insights that differ from conventional wisdom. If the smartest possible analysis of the power system produces the same advice as "just do what everyone else does," the system has failed its genre function.

**Error 3: The Power System That Rewards Effort, Not Intelligence**
Power advancement is purely a function of accumulated training time, resource expenditure, or raw talent — and the protagonist advances faster than others only because they train harder or have more resources. This is a story about diligence and resource advantage, not analytical advantage. The rational protagonist''s edge must come from the quality of their analysis, not from outspending or outworking competitors.

**Error 4: The Protagonist Who Skips the Analysis**
The protagonist has analytical capabilities that are asserted but not demonstrated. They advance efficiently, but the reader never sees the specific calculations that justify the efficiency. This is the cardinal sin of the genre: telling the reader the protagonist is smart rather than showing the protagonist being smart. The Power System fields should generate specific scenes where the protagonist conducts visible analytical work that produces non-obvious insights.

**Error 5: The Cost Analysis That Never Bites**
The Acquisition Cost Analysis identifies bottlenecks and costs, but those costs are never actually paid. The protagonist always finds a way around every constraint without genuine sacrifice. This eliminates tension and makes the power system feel like a formality rather than a real constraint. The bottlenecks must bite at least once in the story — the protagonist must face a situation where the cost analysis''s worst-case scenario is realized, and the Acceptable Expenditure thresholds are genuinely tested.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Purely Pragmatic Novel' LIMIT 1),
  1,
  13,
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
