-- Paranormal Forensics Novel: Story Hook Setting Generation Skill
-- Module: Story Hook (setting category)
-- Usage: mysql -u <user> -p <database> < skill-foren-story-hook-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'foren-story-hook-setting-gen',
  '超自然法证小说故事钩子生成技能。指导如何设计双层中心谜题、信号读者的开场钩子、机构张力、情感赌注、类型颠覆元素与更大阴谋，构建叙事驱动引擎。',
  'Generates the Story Hook defining the central mystery, opening scene, institutional tension, emotional stakes, genre subversion element, and larger conspiracy thread.',
  '用于生成超自然法证小说的故事钩子模块。涵盖中心谜题、开场钩子、机构张力、情感赌注、类型颠覆元素、更大阴谋等字段的生成指导，建立叙事驱动力。',
  '# Story Hook Generation Guide for Paranormal Forensics Novels

## Overview

The Story Hook module is the narrative engine specification for your story. While the other modules build the world — the case, the investigator, the supernatural rules, the institutional structure — the Story Hook defines what the story is actually about and why anyone will keep reading it. It answers the most fundamental questions: What question drives the narrative? What is the first image that pulls the reader in? What is at stake, personally and institutionally? And what makes this story more than a procedural — what is the uncanny element that transforms a detective story into something stranger and more disturbing?

Every field in this module should be designed in relation to the others. The Central Mystery determines what kind of Opening Hook works. The Institutional Tension shapes what counts as Emotional Stakes. The Genre Subversion Element should complicate, not simply contradict, the Central Mystery. And the Larger Conspiracy should be legible in the individual case as a shadow, not a spotlight.

---

## Field-by-Field Generation Guide

### Central Mystery

The Central Mystery is the core question that drives the entire narrative. In paranormal forensics fiction, this question must operate on two levels simultaneously — and designing both levels is the craft work of this field.

**The Forensic Level**: What physically happened? This is the procedural question — the cause of death, the mechanism of the event, the sequence of actions that produced the evidence at the scene. The forensic question has a specific, verifiable answer that can be established through evidence.

**The Supernatural Level**: What entity or force caused this, and why? This is the paranormal question — not just the mechanism but the agency and the motive behind the event. The supernatural question must also have a specific answer, but one that requires different kinds of evidence (behavioral patterns, historical research, entity profiling) to establish.

**The Convergence Question**: What is the connection between the victim, the entity, and the circumstances that brought them together now? This is the question where forensic and supernatural investigation converge — and it is usually the deepest question in the story.

**Designing an effective Central Mystery**:

The forensic question must be genuinely puzzling: not "who shot the victim" (the answer is on the gun) but "why did the victim die of hypothermia at the core of a building with central heating, in July?" The initial forensic puzzle must be strong enough to sustain interest before the supernatural explanation becomes available.

The supernatural question must be emotionally resonant, not just cosmological: not "what kind of ghost did this?" but "why does this entity still rage after 80 years, and who created the conditions that trapped it here?" The entity''s situation should mirror or invert the victim''s situation in some meaningful way.

**Examples of dual-level mysteries**:

- *Forensic*: A criminal profiler is found dead in a sealed interview room, officially from a stroke. *Supernatural*: An entity that feeds on analytical attention was drawn to the profiler''s investigation of a previous case — the more precisely they mapped the entity''s psychology, the more thoroughly the entity mapped theirs.

- *Forensic*: Three hospital patients in the same ward die of the same cardiac event on the same night, none with cardiac history. *Supernatural*: A residual haunting tied to a 1962 mass death in the building is not replaying the original event — it is completing it, one uncounted victim at a time.

- *Forensic*: A forensic anthropologist is found with evidence of drowning, inland, with no water source within 30 kilometers. *Supernatural*: The skeleton they exhumed last month still has one witness who drowned the night it was disturbed — and now it is demanding the same for the one who opened the grave.

### Opening Hook

The Opening Hook is the first image, scene, or discovery that signals to the reader "this is not a normal story." Its function is dual: it must work as a compelling scene in its own right, and it must plant a specific forensic or evidential anomaly that will not be fully explained until much later in the story.

**What makes an effective Opening Hook in this genre**:

1. **A specific forensic detail that is wrong**: Not atmospherically wrong (fog, cold air, an uncanny feeling) but technically wrong — the kind of wrongness that a professional would notice and that an untrained person would not.

2. **Professional language that signals expertise**: The hook is narrated or observed through expert eyes. The reader experiences the scene as a professional does — which means noticing specific things, in specific order, with specific questions.

3. **An impossibility that requires no explanation yet**: The hook introduces the problem without resolving it. The reader must carry the unanswered question forward.

**Examples of Opening Hook types**:

*The Impossible Autopsy Finding*:
"The liver temperature put death at eleven PM, which was fine. The gastric contents put death at three AM, which was not. Dr. Harlow stared at the readout for a long time before she wrote anything down. Then she wrote: CONSULT REQUIRED and left it there."

*The Crime Scene Geometry*:
"The blood spatter on the south wall was consistent with a violent blunt force impact. The blood spatter on the north wall was identical — same force, same angle of projection, same blood type. The north wall was twenty-two feet away and no weapon had been used twice."

*The Survival Account That Cannot Be*:
"She had been pronounced dead at 11:47 PM. Her deposition was dated 12:30 AM, the same night. The signature matched. The content of the deposition described the interior of the hospital morgue in precise detail."

*The Evidence That Precedes the Crime*:
"The emergency call was logged at 8:14 PM. The victim''s fingerprints were found on the call button. The victim''s time of death, confirmed by four independent indicators, was 7:50 PM."

The opening hook should be short — a single paragraph is often more effective than a scene. The reader should feel the wrongness before they can articulate what it is.

### Institutional Tension

Institutional tension is the specific form of obstruction the investigator faces from within their own system — not from external antagonists but from the organization that is supposed to support them. This field defines what specific institutional force is working against the investigation.

**The most productive institutional tensions**:

*The Closing Pressure*: The case is officially closed (or about to be closed) and the investigator is the only person who refuses to accept the official explanation. Every day they continue investigating, they risk being formally pulled from the case, transferred, or sanctioned.

*The Classification Barrier*: Key evidence exists — the investigator can see it referenced in reports — but accessing it requires clearance they do not have, authorization that is being denied, or a physical location they cannot reach without triggering further suppression.

*The Chain of Command*: A specific superior (not a villain, but a professionally cautious person protecting their department) is actively ordering the investigator to stand down. Following the order means abandoning the case. Defying it means career consequences.

*The Competing Investigation*: Another agency or unit is investigating the same case with different goals — not to find the truth but to contain it. Their investigation is moving faster and, if it reaches the official closure first, the investigator''s findings will be permanently buried.

*The Internal Informant Problem*: Someone inside the organization is feeding information to people who want the case buried. The investigator does not know who. Every internal conversation is a potential security risk.

The institutional tension should feel genuinely threatening — not just a bureaucratic inconvenience but a real professional risk with concrete consequences if the investigator fails to navigate it successfully.

### Emotional Stakes

Professional duty becomes a story when it costs something personal. The emotional stakes are what the investigator personally risks — not as an abstraction (their career, their reputation) but as something specific and irreplaceable.

**The spectrum of emotional stakes**:

*Professional Identity*: The investigator''s sense of who they are as a professional is at stake. If the paranormal is real, their entire framework for understanding evidence and truth must be rebuilt. This is not dramatic loss but it is deep, slow damage — the dismantling of a self that took years to construct.

*Specific Relationships*: A colleague, mentor, or trusted partner is at risk — professionally (they will be implicated if the investigator proceeds) or personally (they are connected to the case in a way that makes the investigation painful). The specific person must matter to the reader before they can be at stake.

*Personal History Connection*: The case connects to something in the investigator''s past — a previous case they couldn''t close, a loss they couldn''t prevent, a truth they''ve been unable to accept. Pursuing this case means revisiting that wound.

*Sanity and Perception*: Investigating the supernatural means trusting perceptions that the investigator''s professional training tells them to doubt. The emotional stake is the risk of no longer being able to trust their own mind — the foundational professional crisis of someone whose work depends on reliable perception.

**Combining multiple stakes**:

The strongest paranormal forensics stories create multiple simultaneous emotional risks that pull in different directions. The investigator must choose: pursue the truth and damage a relationship; protect a colleague and abandon the case; or maintain professional credibility and let the evidence be buried. No emotionally clean option should exist.

### Genre Subversion Element

This is the twist on forensic convention that the paranormal introduces — the moment when the standard procedural playbook produces an impossible result. Every great paranormal forensics story has at least one of these: a forensic principle that the supernatural inverts, a professional assumption that the case proves wrong, a moment when the investigator''s expertise becomes insufficient in a specific, revelatory way.

**Design principle**: The subversion should use a real forensic convention and break it in a way that is simultaneously impossible and perfectly logical within the story''s supernatural framework.

**Examples of genre subversions**:

*The autopsy that proves the victim was already dead before the murder occurred*: Clinical death was medically established three days before the physical injuries that killed them were inflicted. The body was inhabited and then abandoned.

*The crime scene with no perpetrator but two victims*: All physical evidence indicates two people were in the room. One is dead. The other''s fingerprints, DNA, and footprints are everywhere — but they were confirmed to be in another country at the time.

*The forensic timeline running backward*: Cellular decomposition, gastric motility, and rigor mortis all indicate death in a different sequence than the external wound evidence. The body is decomposing in reverse chronological order.

*The profile that describes no known human psychology*: The behavioral profiler''s analysis of the crime scene produces a psychological profile that is internally consistent, fully coherent — and describes a psychology that no human being could possess. Too consistent, too patient, too certain.

*The witness whose testimony is forensically impossible*: A survivor describes an event in such precise forensic detail that they could only have knowledge if they were the perpetrator — but physical evidence proves they were the victim.

*The evidence that cannot be both real and explicable*: A chemical compound found at the scene exists in current scientific knowledge — but was last manufactured in 1887 and the remaining known samples are all in museum collections.

### Larger Conspiracy

The Larger Conspiracy connects the individual case to a pattern that implies deliberate intent, systemic concealment, or a supernatural agenda that extends beyond any single case. It should be legible in the individual case as a shadow — a hint, a discrepancy, a connection that seems meaningful without being explained — not as a lecture.

**Types of larger conspiracies**:

*The Pattern*: This is not the first case. Examination of historical files reveals similar forensic signatures going back decades or centuries. Someone — or something — has been doing this for a very long time, and the organization''s own archives hold the evidence of its scale.

*The Institutional Complicity*: The cover-up is not bureaucratic inertia. Key figures within the organization actively cultivated the supernatural force, or made a deliberate bargain with it. The investigator''s own institution is not just suppressing the truth — it is implicated in the creation of the threat.

*The Entity Agenda*: Multiple cases, investigated separately, reveal a pattern of entity behavior that implies a larger goal: the entities are not acting randomly but executing a plan. The individual case is one step in a sequence.

*The Prophylactic Cover-up*: The organization knows what is coming — a major paranormal event is anticipated — and is suppressing individual cases to prevent public panic before they are ready to manage the event. The cover-up is not malicious but utilitarian, and the investigator''s pursuit of the truth may actually serve the thing the organization is trying to prevent.

*The Research Program*: Evidence in the current case connects to a classified research program — historical or ongoing — in which the supernatural was deliberately studied, cultivated, or weaponized. The current event is a consequence of that research.

**How to hint at the conspiracy in the individual case**:
- A case file number that is sequential in a series that should not exist
- A piece of evidence that was clearly planted or altered, not to hide a specific fact but to prevent a specific connection from being made
- A witness who uses terminology that no untrained civilian should know
- A physical object that appears in historical case photographs of a different case

---

## Integration: How the Fields Work Together

The most effective Story Hooks create resonance between fields:

- The **Central Mystery**''s supernatural level should connect thematically to the **Emotional Stakes** — what the entity is doing should mirror or invert what the investigator fears losing
- The **Opening Hook** should introduce the specific forensic anomaly that the **Genre Subversion Element** will later invert at the climax
- The **Institutional Tension** should make the **Larger Conspiracy** partially visible — the specific form of cover-up pressure should hint at what they are really protecting
- The **Genre Subversion Element** should be the moment the reader fully accepts the paranormal premise — before this moment, the story is a mystery; after it, the investigation has a new shape

---

## Common Mistakes

1. **A mystery with only one level** — either purely forensic (a complicated crime with no paranormal dimension) or purely supernatural (a haunting with no investigative structure). Both levels must be present and specific.

2. **An Opening Hook that relies on atmosphere** — fog, shadows, and a sense of dread are mood, not hook. The hook must be a specific anomaly with a specific professional observer.

3. **Institutional tension as background noise** — if the obstruction never forces a specific choice with real consequences, it is scenery. Create at least one moment where the institutional pressure demands a concrete decision.

4. **Emotional stakes that are too abstract** — "their career" is not a stake; "the testimony of the three colleagues who will be implicated if this investigation goes public" is.

5. **A Genre Subversion Element that is just weird** — weirdness for its own sake has no narrative function. The subversion must flip a forensic convention in a way that forces both the investigator and the reader to reconsider what they know.

6. **A Larger Conspiracy that explains everything** — the conspiracy should open questions, not close them. If it provides a complete explanation, it is a plot summary, not a conspiracy.',
  (SELECT id FROM novel_creation_method WHERE name = 'Paranormal Forensics Novel' LIMIT 1),
  1,
  24,
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
