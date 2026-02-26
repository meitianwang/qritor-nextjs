-- The Purely Pragmatic Novel「Writing Style」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Purely Pragmatic Novel' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-pragmatic-writing-style-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'pragmatic-writing-style-setting-gen',
  '"Writing Style" setting generation: generates the narrative voice and calculus display technique for The Purely Pragmatic Novel',
  '"Writing Style" setting generation: generates the narrative voice and calculus display technique for The Purely Pragmatic Novel',
  '## "Writing Style" Setting Generation — The Purely Pragmatic Novel

The Writing Style module defines how the story is told — not what happens, but how the reader experiences it. In most genres, writing style is primarily an aesthetic choice. In The Purely Pragmatic Novel, it is a technical choice. The genre''s central pleasure — watching a rational mind calculate — can only be delivered if the narrative infrastructure is designed to transmit that calculation to the reader. The wrong stylistic choices do not just make the story less beautiful; they make the genre''s core pleasure inaccessible.

Every field in this module must answer a single design question: does this choice help the reader experience the protagonist''s calculus as it happens? If not, it serves no special function in this genre.

---

### Field Generation Guide

#### Narrative POV

**Purpose:** The point-of-view architecture that determines how much of the protagonist''s internal calculation the reader can access, and what relationship the reader has with other characters'' inner lives.

**Why POV is a structural decision, not a stylistic preference:**
In The Purely Pragmatic Novel, POV determines the fundamental information architecture of the story. The rational protagonist''s advantage comes from superior information processing. The reader''s pleasure comes from watching that processing in real time, or from discovering after the fact that they were watching it without knowing it. The POV choice determines which of these pleasures is available and at what intensity.

**The three viable POV configurations and their specific properties for this genre:**

1. **First Person: Direct Access, Limited External View**

   First person gives the reader immediate, unmediated access to the protagonist''s thought process. The narrator is the protagonist, and the narrative is the protagonist''s consciousness made visible.

   Advantages for this genre:
   - The reader lives inside the calculation. They follow the protagonist''s reasoning in real time, hear the probability estimates, see the cost-benefit analysis as it forms. This creates the maximum possible identification with the rational framework.
   - Emotional events can be rendered with full phenomenological detail while simultaneously being processed by the rational framework. The reader watches the protagonist feel something and immediately watches the protagonist categorize, evaluate, and decide what to do with that feeling.
   - The protagonist''s voice becomes the novel''s primary aesthetic register. A well-crafted rational first-person narrator has a distinctive cadence — precise, analytical, sometimes coldly beautiful — that is itself a source of readerly pleasure.

   Disadvantages for this genre:
   - External observation is unavailable. The reader cannot see the protagonist from outside, which means the reader cannot see what the protagonist''s behavior looks like to others — its coldness, its strangeness, its occasional terrifying clarity — except through the protagonist''s reports of other people''s reactions.
   - The protagonist''s blind spots become the reader''s blind spots in real time. This is either a feature (the reader discovers the blind spot at the same moment the protagonist does) or a bug (the reader can''t see the blind spot coming and therefore can''t dread it). Which it is depends entirely on pacing design.
   - Self-report unreliability: a first-person rational narrator may misrepresent their own emotional states, not through deception but through genuinely inadequate self-model. The author must decide whether this unreliability is visible to the reader or invisible, and execute that decision consistently.

   First person works best when: the story''s primary interest is the phenomenology of rationality — what it feels like from the inside to think this way, to process the world through this framework, to have these particular emotions and process them in this particular way.

2. **Third Person Limited: Calibrated Distance, Selective Access**

   Third person limited maintains an observer''s perspective on the protagonist while granting access to their inner life. The narrator is separate from the protagonist, but the narrative is anchored in the protagonist''s consciousness.

   Advantages for this genre:
   - The narrator can observe the protagonist as an object in the world, which means the prose can describe the protagonist''s behavior as it appears externally — the stillness of their face during a crisis, the quality of their attention in a social setting, the particular way they go quiet before making a major decision — while simultaneously rendering the internal calculation that produces that behavior.
   - The distance enables a second aesthetic register: the narrator''s own voice, which can be distinct from the protagonist''s framework. This allows subtle ironic commentary — the narrator noticing something the protagonist has classified and set aside, the narrator''s sentence rhythm suggesting an emotional weight the protagonist''s analysis has discounted.
   - The protagonist''s blind spots can be foreshadowed without being named. The narrator can position information in a way that a careful reader will notice and the protagonist will not, creating dramatic irony without sacrificing first-person immediacy for scenes that require it.

   Disadvantages for this genre:
   - Managing the access level requires constant precision. How deeply does the narrator go into the protagonist''s consciousness on any given page? Too shallow, and the calculation scenes lose their intimacy. Too deep, and the external perspective collapses back into first person. The author must develop a consistent protocol for when to surface and when to dive.
   - The voice is more complex to sustain — the narrator must feel distinct from the protagonist without feeling uninvested, and must be capable of rendering both the protagonist''s analysis and its external appearance without editorializing in a way that undercuts reader identification.

   Third person limited works best when: the story benefits from occasional external perspective — particularly in social scenes, where the protagonist''s behavior is observed by others, and in scenes where dramatic irony requires the reader to see something the protagonist has missed.

3. **Dual POV: Rational Protagonist Plus External Observer**

   Dual POV alternates between the protagonist''s perspective and the perspective of at least one other character — specifically, a character who interacts with the protagonist without understanding them, and whose chapters allow the reader to see the protagonist from outside.

   Advantages for this genre:
   - The contrast between the protagonist''s internal view and the external observer''s interpretation creates the most powerful ironic structure available to this genre. The reader, who has access to both, sees exactly how the protagonist is being misread — and can appreciate both the misreading and the reality simultaneously.
   - The external observer''s emotional responses to the protagonist can carry the emotional weight that the protagonist''s own narration cannot. If the protagonist is incapable of feeling grief about a loss, the external observer''s grief can render the loss''s weight for the reader.
   - The external observer''s POV chapters can advance plot in ways that the protagonist cannot know about, which creates genuine suspense: the reader knows what is coming, the protagonist does not. This is the purest form of dramatic irony available in this structure.

   Disadvantages for this genre:
   - The external observer POV must be written with as much care as the protagonist''s. An underdeveloped secondary POV reads as an obligatory interlude rather than a structural counterweight.
   - The dual structure risks dividing the reader''s identification, particularly if the external observer is sympathetic and the protagonist''s behavior toward them is troubling.
   - Pacing is more complex: the calculation scenes that are the genre''s primary pleasure can only occur in the protagonist''s chapters. The external observer chapters must deliver their own pleasures (dramatic irony, emotional depth, plot advancement) without becoming merely transitional.

   Dual POV works best when: the story''s central relationship is between the protagonist and a specific other person who is being analyzed, manipulated, or unknowingly cultivated. The dual structure allows the reader to experience that relationship from both sides simultaneously.

---

#### Calculus Display

**Purpose:** The technical toolkit for transmitting the protagonist''s rational analysis to the reader — the specific narrative techniques that make the calculation visible, engaging, and satisfying.

**This is the most important field in the module.**
The Calculus Display is the genre''s core delivery mechanism. Everything else in the power system, the protagonist''s capabilities, the plot — these exist to create situations that require calculation. The Calculus Display determines how that calculation reaches the reader. A poorly executed Calculus Display turns a compelling rational protagonist into a character who is merely described as intelligent. A well-executed Calculus Display makes the reader feel, temporarily, like they are thinking at the protagonist''s level.

**The four primary Calculus Display techniques, their mechanics, their optimal applications, and their failure modes:**

1. **Interior Monologue Display: The Open Calculation**

   Technique: The protagonist''s reasoning is rendered explicitly and in real time. The reader is inside the protagonist''s head as the calculation is performed, seeing the variables identified, the weights assigned, the alternatives considered, the conclusion reached.

   Mechanics: Executed through first-person or deep third-person narration. The prose shifts register — from event-description to thought-process-description. Sentence structure often becomes more conditional, more enumerated, more explicitly logical: "If X, then Y. But X assumes Z, which I haven''t confirmed. Alternative: if not Z, then..."

   Optimal applications:
   - Major strategic decisions where the reader needs to understand the protagonist''s reasoning to follow the plot
   - Moments where the protagonist''s conclusion will seem wrong or cold to a typical reader — showing the calculation allows the reader to understand, even if not endorse, the reasoning
   - Set-piece "calculation scenes" that are the genre''s signature pleasure, where the protagonist solves a complex problem in real time and the reader is invited to follow along

   Failure modes:
   - Overuse: if every decision is rendered as explicit interior monologue, the prose becomes exhausting and the protagonist reads as a reasoning machine rather than a character. The technique''s power depends on strategic deployment.
   - Didacticism: the calculation becomes a lecture. The protagonist is not calculating — they are explaining. This kills the dynamic quality of real-time reasoning.
   - False precision: the protagonist assigns specific numerical probabilities to situations where the reader knows that such precision is not actually achievable, breaking immersion.

2. **Revelation Display: The Post-Hoc Explanation**

   Technique: The protagonist acts in ways that seem strange, counterintuitive, or opaque. The reasoning is not revealed at the time. Later — sometimes much later — the calculation is revealed, and the reader retrospectively understands what they witnessed.

   Mechanics: Requires careful construction of the original scene so that the protagonist''s behavior is genuinely puzzling but not inexplicable. The revelation scene must then deliver enough information to fully resolve the puzzle, and must do so with enough elegance that the resolution is satisfying rather than merely clarifying.

   Optimal applications:
   - Social scenes where the protagonist is deploying a strategy that cannot be revealed in real time without destroying the strategy
   - Multi-stage plans where the earliest actions only make sense when the complete plan is visible
   - Situations where the calculation involves information the protagonist has that other characters (and temporarily the reader) do not have

   Failure modes:
   - The behavior is so opaque that the reader loses interest before the revelation
   - The revelation is insufficiently satisfying — the behavior, once explained, seems like it could have been explained another way just as easily, which means the calculation didn''t actually determine the behavior uniquely
   - The technique is overused, making the protagonist feel deliberately obscure rather than strategically opaque

3. **Dramatic Irony Display: The Asymmetric Information Scene**

   Technique: The reader knows something that other characters in the scene do not know. This knowledge was provided (explicitly or implicitly) by the protagonist''s POV chapters. The reader watches a scene in which other characters are operating on incomplete information, and the irony lies in the gap between what they think is happening and what the reader knows is actually happening.

   Mechanics: Requires careful information architecture across the narrative. The reader must have been given the information that creates the irony — but not necessarily told explicitly that it is the information that will create irony. The technique works best when the reader recognizes the relevant information only as the ironic scene unfolds.

   Optimal applications:
   - Scenes where a character who is being cultivated by the protagonist performs their role without knowing they are being cultivated
   - Scenes where an adversary makes a move that the protagonist has anticipated and prepared for — the reader watches the adversary commit to a trap
   - Social scenes where the protagonist is performing an emotional script that the reader knows is performance

   Failure modes:
   - The irony is too heavy-handed — the reader is made to feel superior to the other characters in a way that feels contemptuous rather than structural
   - The information that creates the irony was provided too obliquely, and the reader misses it, which turns the ironic scene into merely a confusing one

4. **Subtext Display: The Double-Layer Conversation**

   Technique: A social interaction between the protagonist and another character operates simultaneously on two levels. The surface level is a normal conversation — pleasantries, negotiation, information exchange. The subtext level is the protagonist''s actual agenda: gathering specific information, positioning the other character, testing a hypothesis about their motivations, executing a step in a longer strategy.

   Mechanics: Rendered through dialogue that is subtly over-determined — every line the protagonist speaks serves both the surface function and the strategic function. The prose can render the dual layer through brief interior observations that mark the surface exchange while indicating the subtext operation: "He said what I needed him to say." or "She was giving me exactly the information I hadn''t asked for."

   Optimal applications:
   - All social scenes in which the protagonist is operating strategically
   - Negotiations, where the surface topic and the actual objective are different
   - Cultivation scenes, where the protagonist is building a relationship they have internally classified as an asset

   Failure modes:
   - The subtext is too visible, making the protagonist seem obviously manipulative rather than strategically fluent
   - The subtext is too invisible, making the scene read as a normal conversation when it is meant to read as a double operation
   - The protagonist''s surface performance is implausibly smooth — real social performance has seams, and showing those seams (while the subtext operation proceeds through them) is more interesting than perfect execution

---

#### Prose Style

**Purpose:** The sentence-level aesthetic choices that define the novel''s voice — and how those choices serve (or undermine) the genre''s specific narrative requirements.

**The prose style serves the calculus, not the other way around.**
Every prose style choice should be evaluated by whether it supports the genre''s core function: transmitting rational analysis in a way that is engaging, credible, and at least occasionally beautiful. Prose that is too ornate disrupts the analytical register. Prose that is too stripped distracts with its austerity. The optimal style for this genre has a specific character: precise, occasionally cold, capable of sudden unexpected grace.

**The four prose style registers and their appropriate applications:**

1. **Analytical Register**
   Characteristic syntax: conditional constructions, enumeration, explicit logical connectors ("therefore," "which implies," "the alternative is"), precise quantification where possible.
   Characteristic diction: technical terms from whatever domain the protagonist is analyzing (power system terminology, economic vocabulary, psychological clinical language), used accurately and without explanation.
   Appropriate application: calculation scenes, strategy formulations, the protagonist''s interior monologue during active analysis.
   Risk: extended analytical register becomes exhausting and distances the reader. Use in concentrated doses, not as the dominant mode.

2. **Observational Register**
   Characteristic syntax: clean declarative sentences, active voice, specific concrete nouns over abstract ones.
   Characteristic diction: precise behavioral observation ("she touched her left earlobe — a tell she had not noticed she had"), detail that implies analysis without stating it.
   Appropriate application: social scenes, action sequences, external description that reveals the protagonist''s model of the world through what they notice and how they categorize it.
   Risk: can slide into flat reportage if the observational detail is not selected with analytical precision. Every observed detail should imply a calculation or a hypothesis.

3. **Performance Register**
   Characteristic syntax: more conventional, more emotionally legible — the protagonist adopting the stylistic conventions of the social script they are executing.
   Characteristic diction: deliberately generic emotional vocabulary, social formulas, the language of someone performing normalcy.
   Appropriate application: dialogue and scenes where the protagonist is in social performance mode. The contrast between the performance register in dialogue and the analytical register in interior narration is a primary source of character texture.
   Risk: the performance register can flatten the protagonist''s voice to the point where they become indistinguishable from other characters. It should be used in dialogue, rarely in narration.

4. **Grace Register**
   Characteristic syntax: longer, more sinuous sentences, unexpected metaphors, imagery that is both precise and unexpected.
   Characteristic diction: the protagonist''s aesthetic sensibility emerging from the analytical framework — finding beauty in efficiency, elegance in parsimony, satisfaction in a correctly solved problem.
   Appropriate application: rare, deliberate moments — the resolution of a long-running calculation, the recognition of an unexpected variable, a moment of genuine emotional response that the protagonist cannot classify.
   Risk: overuse destroys its effect. The grace register must be rare enough that its appearance signals something to the reader — that this moment is different, more significant, less contained than what came before.

---

#### Pacing

**Purpose:** The temporal architecture of the novel — how fast and slow the narrative moves, and how those variations create the genre''s distinctive rhythm.

**The Purely Pragmatic Novel has a characteristic pacing structure that differs from most fiction:**
Most fiction paces toward confrontation — the plot accelerates toward conflict and then releases. The rational protagonist story paces toward consequence — the plot accelerates through the setup of a complex plan and then releases when the plan''s effects materialize. This creates a distinctive two-phase rhythm that must be designed explicitly.

**The Setup Phase ("Laying Groundwork") — characteristics and design principles:**

The setup phase is the novel''s investment period. The protagonist is acquiring resources, positioning assets, identifying bottlenecks, and executing early steps in the optimal advancement path. From the outside, very little seems to be happening. From inside the protagonist''s framework, an enormous amount is happening — every apparently minor action is a calculated investment in a specific future return.

Pacing design for the setup phase:
- Time compression: the narrative can move faster than real time, compressing weeks of activity into focused summary
- Calculation scenes as punctuation: at key decision points in the setup, slow down to render the full calculation; between those points, move efficiently through the actions the calculation dictated
- Tension maintenance: the reader must feel the stakes even when the action is quiet. This is achieved through: the protagonist''s explicit awareness of the time window for the objective, the accumulation of small costs that make the eventual payoff feel earned, and the seeding of the assumptions that will later be violated

The setup phase''s most common failure: it reads as setup. The reader feels they are waiting for the story to start, rather than watching the story''s most important phase. This is a design failure, not an inevitable consequence of the genre. The setup phase should be the novel''s most intellectually engaging section — the place where the reader is most actively invited to follow the protagonist''s analysis.

**The Harvest Phase ("Reaping What Was Sown") — characteristics and design principles:**

The harvest phase is when the protagonist''s investments pay off — or fail to. It is the period when the plan encounters reality, when the assumptions are tested, when the bottlenecks either yield or don''t. From outside, this phase looks like the story''s main action. From inside, it is the verification of the setup''s calculations.

Pacing design for the harvest phase:
- Real-time rendering: the harvest phase should generally move at or near story time, allowing the reader to experience events as they unfold rather than in summary
- Calculation scenes shift character: in the setup phase, calculation scenes are planning. In the harvest phase, they are real-time adjustment — the protagonist recalculating in response to unexpected information, updating the model, issuing new decisions
- The cost accounting: the harvest phase should explicitly register what is being spent to achieve the objectives — not just in terms of power system resources, but in terms of the Acceptable Expenditure thresholds

**Phase transition design:**
The transition between setup and harvest is the novel''s first major turning point. It should be marked by a specific event that shifts the protagonist from primarily investing to primarily executing. This event is usually the point at which the protagonist has committed enough resources that retreat would be more costly than completion — the rational protagonist''s version of the point of no return.

---

#### Dramatic Irony Level

**Purpose:** How much information advantage the reader has over the other characters in the story — and how that advantage is managed across the narrative.

**Dramatic irony is this genre''s native medium.**
The rational protagonist operates with information advantages over other characters. By giving the reader access to the protagonist''s information, the narrative automatically creates dramatic irony whenever that protagonist interacts with others. The question is not whether to use dramatic irony — it is how much, how consistently, and to what effect.

**The information asymmetry spectrum:**

At one end: the reader knows everything the protagonist knows, always. Every social interaction is legible to the reader at its strategic layer. Every character is seen through the protagonist''s analytical lens at all times. This creates maximum irony density but can produce reader fatigue — the protagonist is always right, always ahead, always in control, and no other character ever surprises them (or us).

At the other end: the reader knows only what the protagonist chooses to reveal. The protagonist''s calculations are often opaque even to the reader. Social interactions are mysterious because neither the protagonist nor the reader is fully sharing their read of the situation. This creates suspense but sacrifices the genre''s signature pleasure of real-time calculation access.

**The design target:** A dynamic information asymmetry where:
- The reader has full access to the protagonist''s analysis during calculation scenes (maximum transparency at key decision points)
- The reader has partial access during execution (enough to understand what the protagonist is doing, not always enough to see exactly where it is going)
- The reader occasionally discovers that they missed something the protagonist was doing — because the protagonist''s information advantage was complete, but the narrative chose not to render it in real time

This dynamic management of reader information is one of the most sophisticated craft elements in the genre. It creates the distinctive feeling of reading a rational protagonist novel: the reader is simultaneously inside the calculation (intimate, engaged, complicit) and occasionally surprised (reminded that the protagonist''s advantage exceeds what the narrative has shared).

---

#### Banned Words

**Purpose:** A curated list of specific vocabulary, constructions, and register-indicators that are prohibited in the novel''s prose — and the craft reasoning behind each prohibition.

**Why a Banned Words list is a serious craft tool:**
This genre fails when its prose slips into the vocabulary of emotional intuition, spiritual insight, or mystical certainty. The rational protagonist''s credibility depends entirely on the consistency of their analytical framework — and prose that smuggles in non-analytical framing undermines that consistency even when the content is analytically intended.

**Category 1: Intuition Vocabulary**
Words and phrases that imply non-analytical, non-calculable insight:
- "Instinct told her..." / "She sensed..." / "Something felt wrong..."
- "Inexplicably," "mysteriously," "without knowing why"
- "A sudden realization" (when unaccompanied by the content of the realization)
- "She just knew"

Why banned: These constructions imply that the protagonist''s analytical capability is supplemented by something outside the framework — a felt sense, a gut reaction, an intuitive flash. This undermines the core premise. If the protagonist is arriving at conclusions non-analytically, the story is not about rational optimization; it is about a character who sometimes calculates and sometimes just knows things.

Exception: these constructions can appear in dialogue from other characters, and can appear in the protagonist''s narration when they are explicitly marking an emotional signal that they are then subjecting to analysis ("I noticed something that could be described as unease — and I noted it as potentially informative, which implied I was registering something I hadn''t yet consciously identified").

**Category 2: Destiny and Inevitability Vocabulary**
Words and phrases that imply teleological structure outside the protagonist''s calculation:
- "Fate," "destiny," "meant to be"
- "Everything happens for a reason"
- "The universe" as agent
- "As if the world were conspiring to..."

Why banned: These constructions imply a structure to events that exists independently of the protagonist''s analysis and that will produce the right outcomes regardless of the protagonist''s choices. This is antithetical to the genre''s premise, which is that outcomes are functions of decisions, and decisions are functions of analysis quality. The rational protagonist operates in a world of probability and consequence, not fate.

**Category 3: Vague Emotional Attribution**
Constructions that attribute emotional states without the analytical processing the protagonist would actually apply:
- "She was overwhelmed"
- "He felt terrible"
- "She couldn''t help but feel..."
- "The emotion was too much"

Why banned: not because the protagonist doesn''t have strong emotions (they do), but because these constructions render emotion without analytical processing. The rational protagonist''s emotional life is always engaged by the framework — they may be overwhelmed, but they notice they are overwhelmed, categorize the overwhelm, and decide how to respond. The prose must render all three steps, not just the first.

**Category 4: False Precision**
Conversely, numerical or pseudo-scientific language that implies quantitative rigor where none exists:
- "Exactly 73% certain" when no such calculation is possible
- Made-up metrics presented as real measurements
- Probability estimates that could not actually be derived from available information

Why banned: false precision destroys the credibility of the genuine precision that is the genre''s source of authority. The protagonist''s analytical advantage comes from applying real analysis to real information. When the prose invents quantification, it signals that the analysis is performance rather than substance.

---

### Field Interdependencies

The Writing Style module connects to every other module in The Purely Pragmatic Novel, because style is the medium through which all content is delivered.

**Writing Style ↔ The Rational Mind:**
The protagonist''s Decision Framework determines the analytical register of the prose — how the calculations are structured, what variables are named, what the protagonist notices and does not notice. The Emotional Inventory determines when and how emotional content enters the narration and how it is processed. The Social Performance field determines the performance register in dialogue. Writing Style is, in the deepest sense, the externalization of The Rational Mind.

**Writing Style ↔ Power System:**
Calculation scenes in the Calculus Display are where the Power System''s mechanics become narratively visible. The quality of these scenes determines whether the protagonist''s power system optimization reads as genuinely analytical or as arbitrary advancement. The Calculus Display techniques must be designed specifically around the Power System''s type — hard magic systems allow more precise Interior Monologue Display, while political systems may rely more heavily on Subtext Display and Revelation Display.

**Writing Style ↔ Objective Architecture:**
The Pacing design (Setup Phase vs. Harvest Phase rhythm) is determined by the structure of the protagonist''s Optimal Advancement Path and the Active Investments from Objective Architecture. The Dramatic Irony Level is partly a function of how much of the protagonist''s plan the reader has been given access to at any moment in the narrative. The moral weight of the Acceptable Expenditure field is fully realized only when the Calculus Display renders the relevant calculations with sufficient intimacy that the reader feels complicit in them.

---

### Common Writing Errors

**Error 1: The Narrated Intelligence**
The protagonist''s intelligence is described rather than demonstrated. Other characters remark on how clever the protagonist is. The narrator notes that the protagonist''s analysis was correct. But the prose never renders the analysis itself — never lets the reader follow the calculation in real time. This is the genre''s cardinal failure. Intelligence that is asserted but not demonstrated is characterization, not genre execution.

**Error 2: The Calculation Monologue**
The interior monologue display is executed as a lecture. The protagonist is not calculating — they are explaining. The prose loses the dynamic quality of real-time reasoning and becomes a series of conclusions presented in logical order. This turns the protagonist from a thinker into a teacher, and loses the intimacy that makes Calculus Display effective. Real calculation is messy, iterative, and self-correcting; the prose should render those qualities even when the conclusions are clean.

**Error 3: The POV That Cannot Sustain Its Own Irony**
A dual POV structure where the external observer''s chapters are written without sufficient craft to deliver their half of the dramatic irony. The ironic contrast between the protagonist''s view and the external observer''s view only works if both views are rendered with full depth and specificity. An underdeveloped external POV makes the irony shallow — the reader can see the gap between the two perspectives, but doesn''t feel it.

**Error 4: Pacing That Loses the Setup Phase**
The Setup Phase is compressed past the point where it can do its work. Events are summarized, decisions are reported rather than rendered, the protagonist''s investments are catalogued rather than experienced. The reader arrives at the Harvest Phase without having followed the calculation that makes the harvest meaningful. This is typically a consequence of authorial impatience — the writer knows what the payoff is and rushes to get there. The payoff requires the setup to work.

**Error 5: Inconsistent Banned Word Enforcement**
The Banned Words prohibitions are applied selectively — the protagonist uses analytical vocabulary in formal analysis scenes but slips into intuition vocabulary in emotional moments. This is inconsistent characterization. The rational protagonist''s framework operates continuously, not only when they are consciously analyzing. Emotional moments should be rendered through the framework with at least as much care as analytical ones, because those are the moments when the framework is most under pressure and therefore most revealing.',
  '"Writing Style" setting generation: generates the narrative voice and calculus display technique for The Purely Pragmatic Novel

The Writing Style module defines how the story is told — not what happens, but how the reader experiences it. In most genres, writing style is primarily an aesthetic choice. In The Purely Pragmatic Novel, it is a technical choice. The genre''s central pleasure — watching a rational mind calculate — can only be delivered if the narrative infrastructure is designed to transmit that calculation to the reader. The wrong stylistic choices do not just make the story less beautiful; they make the genre''s core pleasure inaccessible.

Every field in this module must answer a single design question: does this choice help the reader experience the protagonist''s calculus as it happens? If not, it serves no special function in this genre.

---

### Field Generation Guide

#### Narrative POV

**Purpose:** The point-of-view architecture that determines how much of the protagonist''s internal calculation the reader can access, and what relationship the reader has with other characters'' inner lives.

**Why POV is a structural decision, not a stylistic preference:**
In The Purely Pragmatic Novel, POV determines the fundamental information architecture of the story. The rational protagonist''s advantage comes from superior information processing. The reader''s pleasure comes from watching that processing in real time, or from discovering after the fact that they were watching it without knowing it. The POV choice determines which of these pleasures is available and at what intensity.

**The three viable POV configurations and their specific properties for this genre:**

1. **First Person: Direct Access, Limited External View**

   First person gives the reader immediate, unmediated access to the protagonist''s thought process. The narrator is the protagonist, and the narrative is the protagonist''s consciousness made visible.

   Advantages for this genre:
   - The reader lives inside the calculation. They follow the protagonist''s reasoning in real time, hear the probability estimates, see the cost-benefit analysis as it forms. This creates the maximum possible identification with the rational framework.
   - Emotional events can be rendered with full phenomenological detail while simultaneously being processed by the rational framework. The reader watches the protagonist feel something and immediately watches the protagonist categorize, evaluate, and decide what to do with that feeling.
   - The protagonist''s voice becomes the novel''s primary aesthetic register. A well-crafted rational first-person narrator has a distinctive cadence — precise, analytical, sometimes coldly beautiful — that is itself a source of readerly pleasure.

   Disadvantages for this genre:
   - External observation is unavailable. The reader cannot see the protagonist from outside, which means the reader cannot see what the protagonist''s behavior looks like to others — its coldness, its strangeness, its occasional terrifying clarity — except through the protagonist''s reports of other people''s reactions.
   - The protagonist''s blind spots become the reader''s blind spots in real time. This is either a feature (the reader discovers the blind spot at the same moment the protagonist does) or a bug (the reader can''t see the blind spot coming and therefore can''t dread it). Which it is depends entirely on pacing design.
   - Self-report unreliability: a first-person rational narrator may misrepresent their own emotional states, not through deception but through genuinely inadequate self-model. The author must decide whether this unreliability is visible to the reader or invisible, and execute that decision consistently.

   First person works best when: the story''s primary interest is the phenomenology of rationality — what it feels like from the inside to think this way, to process the world through this framework, to have these particular emotions and process them in this particular way.

2. **Third Person Limited: Calibrated Distance, Selective Access**

   Third person limited maintains an observer''s perspective on the protagonist while granting access to their inner life. The narrator is separate from the protagonist, but the narrative is anchored in the protagonist''s consciousness.

   Advantages for this genre:
   - The narrator can observe the protagonist as an object in the world, which means the prose can describe the protagonist''s behavior as it appears externally — the stillness of their face during a crisis, the quality of their attention in a social setting, the particular way they go quiet before making a major decision — while simultaneously rendering the internal calculation that produces that behavior.
   - The distance enables a second aesthetic register: the narrator''s own voice, which can be distinct from the protagonist''s framework. This allows subtle ironic commentary — the narrator noticing something the protagonist has classified and set aside, the narrator''s sentence rhythm suggesting an emotional weight the protagonist''s analysis has discounted.
   - The protagonist''s blind spots can be foreshadowed without being named. The narrator can position information in a way that a careful reader will notice and the protagonist will not, creating dramatic irony without sacrificing first-person immediacy for scenes that require it.

   Disadvantages for this genre:
   - Managing the access level requires constant precision. How deeply does the narrator go into the protagonist''s consciousness on any given page? Too shallow, and the calculation scenes lose their intimacy. Too deep, and the external perspective collapses back into first person. The author must develop a consistent protocol for when to surface and when to dive.
   - The voice is more complex to sustain — the narrator must feel distinct from the protagonist without feeling uninvested, and must be capable of rendering both the protagonist''s analysis and its external appearance without editorializing in a way that undercuts reader identification.

   Third person limited works best when: the story benefits from occasional external perspective — particularly in social scenes, where the protagonist''s behavior is observed by others, and in scenes where dramatic irony requires the reader to see something the protagonist has missed.

3. **Dual POV: Rational Protagonist Plus External Observer**

   Dual POV alternates between the protagonist''s perspective and the perspective of at least one other character — specifically, a character who interacts with the protagonist without understanding them, and whose chapters allow the reader to see the protagonist from outside.

   Advantages for this genre:
   - The contrast between the protagonist''s internal view and the external observer''s interpretation creates the most powerful ironic structure available to this genre. The reader, who has access to both, sees exactly how the protagonist is being misread — and can appreciate both the misreading and the reality simultaneously.
   - The external observer''s emotional responses to the protagonist can carry the emotional weight that the protagonist''s own narration cannot. If the protagonist is incapable of feeling grief about a loss, the external observer''s grief can render the loss''s weight for the reader.
   - The external observer''s POV chapters can advance plot in ways that the protagonist cannot know about, which creates genuine suspense: the reader knows what is coming, the protagonist does not. This is the purest form of dramatic irony available in this structure.

   Disadvantages for this genre:
   - The external observer POV must be written with as much care as the protagonist''s. An underdeveloped secondary POV reads as an obligatory interlude rather than a structural counterweight.
   - The dual structure risks dividing the reader''s identification, particularly if the external observer is sympathetic and the protagonist''s behavior toward them is troubling.
   - Pacing is more complex: the calculation scenes that are the genre''s primary pleasure can only occur in the protagonist''s chapters. The external observer chapters must deliver their own pleasures (dramatic irony, emotional depth, plot advancement) without becoming merely transitional.

   Dual POV works best when: the story''s central relationship is between the protagonist and a specific other person who is being analyzed, manipulated, or unknowingly cultivated. The dual structure allows the reader to experience that relationship from both sides simultaneously.

---

#### Calculus Display

**Purpose:** The technical toolkit for transmitting the protagonist''s rational analysis to the reader — the specific narrative techniques that make the calculation visible, engaging, and satisfying.

**This is the most important field in the module.**
The Calculus Display is the genre''s core delivery mechanism. Everything else in the power system, the protagonist''s capabilities, the plot — these exist to create situations that require calculation. The Calculus Display determines how that calculation reaches the reader. A poorly executed Calculus Display turns a compelling rational protagonist into a character who is merely described as intelligent. A well-executed Calculus Display makes the reader feel, temporarily, like they are thinking at the protagonist''s level.

**The four primary Calculus Display techniques, their mechanics, their optimal applications, and their failure modes:**

1. **Interior Monologue Display: The Open Calculation**

   Technique: The protagonist''s reasoning is rendered explicitly and in real time. The reader is inside the protagonist''s head as the calculation is performed, seeing the variables identified, the weights assigned, the alternatives considered, the conclusion reached.

   Mechanics: Executed through first-person or deep third-person narration. The prose shifts register — from event-description to thought-process-description. Sentence structure often becomes more conditional, more enumerated, more explicitly logical: "If X, then Y. But X assumes Z, which I haven''t confirmed. Alternative: if not Z, then..."

   Optimal applications:
   - Major strategic decisions where the reader needs to understand the protagonist''s reasoning to follow the plot
   - Moments where the protagonist''s conclusion will seem wrong or cold to a typical reader — showing the calculation allows the reader to understand, even if not endorse, the reasoning
   - Set-piece "calculation scenes" that are the genre''s signature pleasure, where the protagonist solves a complex problem in real time and the reader is invited to follow along

   Failure modes:
   - Overuse: if every decision is rendered as explicit interior monologue, the prose becomes exhausting and the protagonist reads as a reasoning machine rather than a character. The technique''s power depends on strategic deployment.
   - Didacticism: the calculation becomes a lecture. The protagonist is not calculating — they are explaining. This kills the dynamic quality of real-time reasoning.
   - False precision: the protagonist assigns specific numerical probabilities to situations where the reader knows that such precision is not actually achievable, breaking immersion.

2. **Revelation Display: The Post-Hoc Explanation**

   Technique: The protagonist acts in ways that seem strange, counterintuitive, or opaque. The reasoning is not revealed at the time. Later — sometimes much later — the calculation is revealed, and the reader retrospectively understands what they witnessed.

   Mechanics: Requires careful construction of the original scene so that the protagonist''s behavior is genuinely puzzling but not inexplicable. The revelation scene must then deliver enough information to fully resolve the puzzle, and must do so with enough elegance that the resolution is satisfying rather than merely clarifying.

   Optimal applications:
   - Social scenes where the protagonist is deploying a strategy that cannot be revealed in real time without destroying the strategy
   - Multi-stage plans where the earliest actions only make sense when the complete plan is visible
   - Situations where the calculation involves information the protagonist has that other characters (and temporarily the reader) do not have

   Failure modes:
   - The behavior is so opaque that the reader loses interest before the revelation
   - The revelation is insufficiently satisfying — the behavior, once explained, seems like it could have been explained another way just as easily, which means the calculation didn''t actually determine the behavior uniquely
   - The technique is overused, making the protagonist feel deliberately obscure rather than strategically opaque

3. **Dramatic Irony Display: The Asymmetric Information Scene**

   Technique: The reader knows something that other characters in the scene do not know. This knowledge was provided (explicitly or implicitly) by the protagonist''s POV chapters. The reader watches a scene in which other characters are operating on incomplete information, and the irony lies in the gap between what they think is happening and what the reader knows is actually happening.

   Mechanics: Requires careful information architecture across the narrative. The reader must have been given the information that creates the irony — but not necessarily told explicitly that it is the information that will create irony. The technique works best when the reader recognizes the relevant information only as the ironic scene unfolds.

   Optimal applications:
   - Scenes where a character who is being cultivated by the protagonist performs their role without knowing they are being cultivated
   - Scenes where an adversary makes a move that the protagonist has anticipated and prepared for — the reader watches the adversary commit to a trap
   - Social scenes where the protagonist is performing an emotional script that the reader knows is performance

   Failure modes:
   - The irony is too heavy-handed — the reader is made to feel superior to the other characters in a way that feels contemptuous rather than structural
   - The information that creates the irony was provided too obliquely, and the reader misses it, which turns the ironic scene into merely a confusing one

4. **Subtext Display: The Double-Layer Conversation**

   Technique: A social interaction between the protagonist and another character operates simultaneously on two levels. The surface level is a normal conversation — pleasantries, negotiation, information exchange. The subtext level is the protagonist''s actual agenda: gathering specific information, positioning the other character, testing a hypothesis about their motivations, executing a step in a longer strategy.

   Mechanics: Rendered through dialogue that is subtly over-determined — every line the protagonist speaks serves both the surface function and the strategic function. The prose can render the dual layer through brief interior observations that mark the surface exchange while indicating the subtext operation: "He said what I needed him to say." or "She was giving me exactly the information I hadn''t asked for."

   Optimal applications:
   - All social scenes in which the protagonist is operating strategically
   - Negotiations, where the surface topic and the actual objective are different
   - Cultivation scenes, where the protagonist is building a relationship they have internally classified as an asset

   Failure modes:
   - The subtext is too visible, making the protagonist seem obviously manipulative rather than strategically fluent
   - The subtext is too invisible, making the scene read as a normal conversation when it is meant to read as a double operation
   - The protagonist''s surface performance is implausibly smooth — real social performance has seams, and showing those seams (while the subtext operation proceeds through them) is more interesting than perfect execution

---

#### Prose Style

**Purpose:** The sentence-level aesthetic choices that define the novel''s voice — and how those choices serve (or undermine) the genre''s specific narrative requirements.

**The prose style serves the calculus, not the other way around.**
Every prose style choice should be evaluated by whether it supports the genre''s core function: transmitting rational analysis in a way that is engaging, credible, and at least occasionally beautiful. Prose that is too ornate disrupts the analytical register. Prose that is too stripped distracts with its austerity. The optimal style for this genre has a specific character: precise, occasionally cold, capable of sudden unexpected grace.

**The four prose style registers and their appropriate applications:**

1. **Analytical Register**
   Characteristic syntax: conditional constructions, enumeration, explicit logical connectors ("therefore," "which implies," "the alternative is"), precise quantification where possible.
   Characteristic diction: technical terms from whatever domain the protagonist is analyzing (power system terminology, economic vocabulary, psychological clinical language), used accurately and without explanation.
   Appropriate application: calculation scenes, strategy formulations, the protagonist''s interior monologue during active analysis.
   Risk: extended analytical register becomes exhausting and distances the reader. Use in concentrated doses, not as the dominant mode.

2. **Observational Register**
   Characteristic syntax: clean declarative sentences, active voice, specific concrete nouns over abstract ones.
   Characteristic diction: precise behavioral observation ("she touched her left earlobe — a tell she had not noticed she had"), detail that implies analysis without stating it.
   Appropriate application: social scenes, action sequences, external description that reveals the protagonist''s model of the world through what they notice and how they categorize it.
   Risk: can slide into flat reportage if the observational detail is not selected with analytical precision. Every observed detail should imply a calculation or a hypothesis.

3. **Performance Register**
   Characteristic syntax: more conventional, more emotionally legible — the protagonist adopting the stylistic conventions of the social script they are executing.
   Characteristic diction: deliberately generic emotional vocabulary, social formulas, the language of someone performing normalcy.
   Appropriate application: dialogue and scenes where the protagonist is in social performance mode. The contrast between the performance register in dialogue and the analytical register in interior narration is a primary source of character texture.
   Risk: the performance register can flatten the protagonist''s voice to the point where they become indistinguishable from other characters. It should be used in dialogue, rarely in narration.

4. **Grace Register**
   Characteristic syntax: longer, more sinuous sentences, unexpected metaphors, imagery that is both precise and unexpected.
   Characteristic diction: the protagonist''s aesthetic sensibility emerging from the analytical framework — finding beauty in efficiency, elegance in parsimony, satisfaction in a correctly solved problem.
   Appropriate application: rare, deliberate moments — the resolution of a long-running calculation, the recognition of an unexpected variable, a moment of genuine emotional response that the protagonist cannot classify.
   Risk: overuse destroys its effect. The grace register must be rare enough that its appearance signals something to the reader — that this moment is different, more significant, less contained than what came before.

---

#### Pacing

**Purpose:** The temporal architecture of the novel — how fast and slow the narrative moves, and how those variations create the genre''s distinctive rhythm.

**The Purely Pragmatic Novel has a characteristic pacing structure that differs from most fiction:**
Most fiction paces toward confrontation — the plot accelerates toward conflict and then releases. The rational protagonist story paces toward consequence — the plot accelerates through the setup of a complex plan and then releases when the plan''s effects materialize. This creates a distinctive two-phase rhythm that must be designed explicitly.

**The Setup Phase ("Laying Groundwork") — characteristics and design principles:**

The setup phase is the novel''s investment period. The protagonist is acquiring resources, positioning assets, identifying bottlenecks, and executing early steps in the optimal advancement path. From the outside, very little seems to be happening. From inside the protagonist''s framework, an enormous amount is happening — every apparently minor action is a calculated investment in a specific future return.

Pacing design for the setup phase:
- Time compression: the narrative can move faster than real time, compressing weeks of activity into focused summary
- Calculation scenes as punctuation: at key decision points in the setup, slow down to render the full calculation; between those points, move efficiently through the actions the calculation dictated
- Tension maintenance: the reader must feel the stakes even when the action is quiet. This is achieved through: the protagonist''s explicit awareness of the time window for the objective, the accumulation of small costs that make the eventual payoff feel earned, and the seeding of the assumptions that will later be violated

The setup phase''s most common failure: it reads as setup. The reader feels they are waiting for the story to start, rather than watching the story''s most important phase. This is a design failure, not an inevitable consequence of the genre. The setup phase should be the novel''s most intellectually engaging section — the place where the reader is most actively invited to follow the protagonist''s analysis.

**The Harvest Phase ("Reaping What Was Sown") — characteristics and design principles:**

The harvest phase is when the protagonist''s investments pay off — or fail to. It is the period when the plan encounters reality, when the assumptions are tested, when the bottlenecks either yield or don''t. From outside, this phase looks like the story''s main action. From inside, it is the verification of the setup''s calculations.

Pacing design for the harvest phase:
- Real-time rendering: the harvest phase should generally move at or near story time, allowing the reader to experience events as they unfold rather than in summary
- Calculation scenes shift character: in the setup phase, calculation scenes are planning. In the harvest phase, they are real-time adjustment — the protagonist recalculating in response to unexpected information, updating the model, issuing new decisions
- The cost accounting: the harvest phase should explicitly register what is being spent to achieve the objectives — not just in terms of power system resources, but in terms of the Acceptable Expenditure thresholds

**Phase transition design:**
The transition between setup and harvest is the novel''s first major turning point. It should be marked by a specific event that shifts the protagonist from primarily investing to primarily executing. This event is usually the point at which the protagonist has committed enough resources that retreat would be more costly than completion — the rational protagonist''s version of the point of no return.

---

#### Dramatic Irony Level

**Purpose:** How much information advantage the reader has over the other characters in the story — and how that advantage is managed across the narrative.

**Dramatic irony is this genre''s native medium.**
The rational protagonist operates with information advantages over other characters. By giving the reader access to the protagonist''s information, the narrative automatically creates dramatic irony whenever that protagonist interacts with others. The question is not whether to use dramatic irony — it is how much, how consistently, and to what effect.

**The information asymmetry spectrum:**

At one end: the reader knows everything the protagonist knows, always. Every social interaction is legible to the reader at its strategic layer. Every character is seen through the protagonist''s analytical lens at all times. This creates maximum irony density but can produce reader fatigue — the protagonist is always right, always ahead, always in control, and no other character ever surprises them (or us).

At the other end: the reader knows only what the protagonist chooses to reveal. The protagonist''s calculations are often opaque even to the reader. Social interactions are mysterious because neither the protagonist nor the reader is fully sharing their read of the situation. This creates suspense but sacrifices the genre''s signature pleasure of real-time calculation access.

**The design target:** A dynamic information asymmetry where:
- The reader has full access to the protagonist''s analysis during calculation scenes (maximum transparency at key decision points)
- The reader has partial access during execution (enough to understand what the protagonist is doing, not always enough to see exactly where it is going)
- The reader occasionally discovers that they missed something the protagonist was doing — because the protagonist''s information advantage was complete, but the narrative chose not to render it in real time

This dynamic management of reader information is one of the most sophisticated craft elements in the genre. It creates the distinctive feeling of reading a rational protagonist novel: the reader is simultaneously inside the calculation (intimate, engaged, complicit) and occasionally surprised (reminded that the protagonist''s advantage exceeds what the narrative has shared).

---

#### Banned Words

**Purpose:** A curated list of specific vocabulary, constructions, and register-indicators that are prohibited in the novel''s prose — and the craft reasoning behind each prohibition.

**Why a Banned Words list is a serious craft tool:**
This genre fails when its prose slips into the vocabulary of emotional intuition, spiritual insight, or mystical certainty. The rational protagonist''s credibility depends entirely on the consistency of their analytical framework — and prose that smuggles in non-analytical framing undermines that consistency even when the content is analytically intended.

**Category 1: Intuition Vocabulary**
Words and phrases that imply non-analytical, non-calculable insight:
- "Instinct told her..." / "She sensed..." / "Something felt wrong..."
- "Inexplicably," "mysteriously," "without knowing why"
- "A sudden realization" (when unaccompanied by the content of the realization)
- "She just knew"

Why banned: These constructions imply that the protagonist''s analytical capability is supplemented by something outside the framework — a felt sense, a gut reaction, an intuitive flash. This undermines the core premise. If the protagonist is arriving at conclusions non-analytically, the story is not about rational optimization; it is about a character who sometimes calculates and sometimes just knows things.

Exception: these constructions can appear in dialogue from other characters, and can appear in the protagonist''s narration when they are explicitly marking an emotional signal that they are then subjecting to analysis ("I noticed something that could be described as unease — and I noted it as potentially informative, which implied I was registering something I hadn''t yet consciously identified").

**Category 2: Destiny and Inevitability Vocabulary**
Words and phrases that imply teleological structure outside the protagonist''s calculation:
- "Fate," "destiny," "meant to be"
- "Everything happens for a reason"
- "The universe" as agent
- "As if the world were conspiring to..."

Why banned: These constructions imply a structure to events that exists independently of the protagonist''s analysis and that will produce the right outcomes regardless of the protagonist''s choices. This is antithetical to the genre''s premise, which is that outcomes are functions of decisions, and decisions are functions of analysis quality. The rational protagonist operates in a world of probability and consequence, not fate.

**Category 3: Vague Emotional Attribution**
Constructions that attribute emotional states without the analytical processing the protagonist would actually apply:
- "She was overwhelmed"
- "He felt terrible"
- "She couldn''t help but feel..."
- "The emotion was too much"

Why banned: not because the protagonist doesn''t have strong emotions (they do), but because these constructions render emotion without analytical processing. The rational protagonist''s emotional life is always engaged by the framework — they may be overwhelmed, but they notice they are overwhelmed, categorize the overwhelm, and decide how to respond. The prose must render all three steps, not just the first.

**Category 4: False Precision**
Conversely, numerical or pseudo-scientific language that implies quantitative rigor where none exists:
- "Exactly 73% certain" when no such calculation is possible
- Made-up metrics presented as real measurements
- Probability estimates that could not actually be derived from available information

Why banned: false precision destroys the credibility of the genuine precision that is the genre''s source of authority. The protagonist''s analytical advantage comes from applying real analysis to real information. When the prose invents quantification, it signals that the analysis is performance rather than substance.

---

### Field Interdependencies

The Writing Style module connects to every other module in The Purely Pragmatic Novel, because style is the medium through which all content is delivered.

**Writing Style ↔ The Rational Mind:**
The protagonist''s Decision Framework determines the analytical register of the prose — how the calculations are structured, what variables are named, what the protagonist notices and does not notice. The Emotional Inventory determines when and how emotional content enters the narration and how it is processed. The Social Performance field determines the performance register in dialogue. Writing Style is, in the deepest sense, the externalization of The Rational Mind.

**Writing Style ↔ Power System:**
Calculation scenes in the Calculus Display are where the Power System''s mechanics become narratively visible. The quality of these scenes determines whether the protagonist''s power system optimization reads as genuinely analytical or as arbitrary advancement. The Calculus Display techniques must be designed specifically around the Power System''s type — hard magic systems allow more precise Interior Monologue Display, while political systems may rely more heavily on Subtext Display and Revelation Display.

**Writing Style ↔ Objective Architecture:**
The Pacing design (Setup Phase vs. Harvest Phase rhythm) is determined by the structure of the protagonist''s Optimal Advancement Path and the Active Investments from Objective Architecture. The Dramatic Irony Level is partly a function of how much of the protagonist''s plan the reader has been given access to at any moment in the narrative. The moral weight of the Acceptable Expenditure field is fully realized only when the Calculus Display renders the relevant calculations with sufficient intimacy that the reader feels complicit in them.

---

### Common Writing Errors

**Error 1: The Narrated Intelligence**
The protagonist''s intelligence is described rather than demonstrated. Other characters remark on how clever the protagonist is. The narrator notes that the protagonist''s analysis was correct. But the prose never renders the analysis itself — never lets the reader follow the calculation in real time. This is the genre''s cardinal failure. Intelligence that is asserted but not demonstrated is characterization, not genre execution.

**Error 2: The Calculation Monologue**
The interior monologue display is executed as a lecture. The protagonist is not calculating — they are explaining. The prose loses the dynamic quality of real-time reasoning and becomes a series of conclusions presented in logical order. This turns the protagonist from a thinker into a teacher, and loses the intimacy that makes Calculus Display effective. Real calculation is messy, iterative, and self-correcting; the prose should render those qualities even when the conclusions are clean.

**Error 3: The POV That Cannot Sustain Its Own Irony**
A dual POV structure where the external observer''s chapters are written without sufficient craft to deliver their half of the dramatic irony. The ironic contrast between the protagonist''s view and the external observer''s view only works if both views are rendered with full depth and specificity. An underdeveloped external POV makes the irony shallow — the reader can see the gap between the two perspectives, but doesn''t feel it.

**Error 4: Pacing That Loses the Setup Phase**
The Setup Phase is compressed past the point where it can do its work. Events are summarized, decisions are reported rather than rendered, the protagonist''s investments are catalogued rather than experienced. The reader arrives at the Harvest Phase without having followed the calculation that makes the harvest meaningful. This is typically a consequence of authorial impatience — the writer knows what the payoff is and rushes to get there. The payoff requires the setup to work.

**Error 5: Inconsistent Banned Word Enforcement**
The Banned Words prohibitions are applied selectively — the protagonist uses analytical vocabulary in formal analysis scenes but slips into intuition vocabulary in emotional moments. This is inconsistent characterization. The rational protagonist''s framework operates continuously, not only when they are consciously analyzing. Emotional moments should be rendered through the framework with at least as much care as analytical ones, because those are the moments when the framework is most under pressure and therefore most revealing.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Purely Pragmatic Novel' LIMIT 1),
  1,
  14,
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
