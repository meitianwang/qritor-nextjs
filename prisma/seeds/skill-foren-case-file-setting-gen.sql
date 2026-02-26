-- Paranormal Forensics Novel: Case File Setting Generation Skill
-- Module: Case File (setting category)
-- Usage: mysql -u <user> -p <database> < skill-foren-case-file-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'foren-case-file-setting-gen',
  '超自然法证小说案件档案生成技能。指导如何设计具有双重现实（官方解释与真实超自然原因）的案件，包括法证异常、受害者档案、调查时间线等核心字段。',
  'Generates a complete Case File for a paranormal forensics investigation, including the dual-reality framework, forensic anomalies, victim profile, and investigation timeline.',
  '用于生成超自然法证小说的案件档案模块。涵盖案件名称、类型、官方解释与真实超自然性质、受害者档案、法证异常、调查时间线、当前状态等字段的生成指导。',
  '# Case File Generation Guide for Paranormal Forensics Novels

## Overview

The Case File is the engine of every paranormal forensics story. It is simultaneously a police record and a portal to the uncanny. Your goal when filling out this module is to create a case that works on two levels at once: as a plausible (if puzzling) conventional case, and as a supernatural event whose true nature gradually becomes visible through forensic evidence. The tension between these two layers — what the official record says versus what the evidence actually implies — is the fundamental dramatic engine of the genre.

---

## Field-by-Field Generation Guide

### Case Name

Choose a name that sounds procedural and bureaucratic, not gothic. Real cases are named after locations, victims, or file numbers, not their supernatural nature. Good examples:
- **"The Harwick Mill Incident"** — geographic, neutral
- **"RE: Mallory, Judith Ann — Unexplained Death"** — victim-centered, formal
- **"Case 7714-B: Overnight Disappearances, St. Anselm''s Hospital"** — file-number format

Avoid names like "The Curse of..." or "The Ghost of..." — these belong in the chapter title, not the case file. The mundane name creates ironic distance that pays off when the supernatural truth is revealed.

### Case Type

Select a case type that best fits the core supernatural event, but think carefully about what each type grants narratively:

- **Unexplained Homicide**: The most direct type. A body exists. Cause of death is either impossible or contradictory. Opens access to the autopsy suite — the genre''s richest stage.
- **Disappearance**: No body, no conventional crime scene. Creates maximum ambiguity. The investigator must infer everything. Works best when the missing person leaves behind impossible traces (a room that shows signs of struggle but no exit point, belongings that vanish then reappear).
- **Haunting**: Entity-focused rather than victim-focused. The case is defined by escalating paranormal activity at a location. Best paired with Crime Scene modules that accumulate evidence over time.
- **Mass Panic Event**: Multiple witnesses, contradictory accounts, institutional pressure to provide a rational explanation quickly. Creates a social dimension (hysteria vs. reality) that adds narrative complexity.
- **Cursed Object Incident**: The artifact is the active agent. Multiple victims connected by proximity to the object. Works well as a series driver when the object reappears across cases.
- **Possession**: The victim is both perpetrator and victim simultaneously. Raises legal and ethical dimensions (how do you charge someone who was not in control?). Potentially the most psychologically complex case type.
- **Entity Manifestation**: The entity is the entire event — not a haunting in a location, but an entity that appears, acts, and leaves. Often the rarest and most dangerous case type in a series.

### Case Type Details

Expand on the specific sub-category. If you selected "Unexplained Homicide," specify: is it a single victim or multiple? Is the body found or just the evidence of death? What makes it supernatural rather than a routine unusual death? Be precise. Vague case files produce vague stories.

**Example**: "Single victim found in a sealed basement laboratory. No entry or exit points show any disturbance. Cause of death listed as cardiac arrest but cardiac tissue shows cellular damage consistent with extreme low temperature, despite core body temperature being 98.4°F at discovery. No cold source within 200 meters."

### Official Explanation

This is what the mundane world believes, or what it will be made to believe. The Official Explanation must be:

1. **Plausible** — not ridiculous, just insufficient
2. **Institutional** — bureaucratic language, qualifying hedges ("consistent with," "appears to indicate," "no evidence of foul play")
3. **Incomplete** — it explains most of the surface facts but cannot account for the specific forensic anomalies your case will generate

The Official Explanation is also how the cover-up works. By ensuring the official record reads as mundane, the organization buries the supernatural truth. Design it to leave two or three specific holes that your protagonist will notice.

**Example**: "Death by cardiac arrhythmia, exacerbated by extreme psychological stress (patient had documented anxiety disorder). Sealed environment explained by automatic door lock malfunction. Case closed pending routine toxicology."

The hole: cardiac arrhythmia does not produce the cellular cold damage observed.

### True Supernatural Nature

This is your working document — the actual explanation your investigator will uncover. Be specific and creative. The supernatural nature should:

1. **Be distinctive** — not "a ghost did it" but "a residual energy imprint of a woman who died here in 1943 was activated by the victim''s emotional state and attempted to draw warmth from living tissue, causing cellular frostbite from the inside"
2. **Explain the forensic anomalies** — every anomaly you list later should be traceable to this cause
3. **Have internal logic** — the supernatural framework must be consistent enough that your investigator can eventually deduce it from evidence
4. **Have a reason** — random supernatural events are dramatically unsatisfying. Why this victim? Why now? What triggered it?

### Victim Profile

Victims in paranormal forensic fiction are rarely random. The supernatural is drawn to certain people through:

- **Professional contact** — the archaeologist who disturbed the site, the pathologist who autopsied the wrong body
- **Emotional resonance** — individuals in states of acute grief, fear, or guilt that mirror the entity''s own state
- **Blood or heritage** — descendants of those involved in the original supernatural event
- **Deliberate selection** — when the entity has an agenda, the victim was chosen

Design the victim with a specific connection to the supernatural cause. This connection becomes a clue trail: as the investigator learns more about the victim''s life, they learn more about what killed them.

Include: age, profession, personal circumstances at time of death, relevant history, and the specific factor that made them a target.

### Forensic Anomalies

**This is the heart of your case file.** Forensic anomalies are the evidence that refuses to cooperate with the official explanation. They must be:

1. **Specific** — not "strange wounds" but "linear lacerations on the inner surface of the ribcage, consistent with fingernail scratches, oriented outward as if made from within"
2. **Scientifically framed** — expressed in the language of pathology, chemistry, or forensics
3. **Individually explicable but collectively impossible** — each anomaly might have a mundane explanation in isolation; together they cannot
4. **Connected to the supernatural cause** — each anomaly should be a forensic fingerprint of the entity or event type

**Examples by entity type:**

*Residual Haunting*:
- Electromagnetic interference recorded on all devices within a 4-meter radius of the victim at time of death, source unidentified
- Post-mortem lividity in a pattern inconsistent with body position — blood settled upward, as if body had been inverted after death (impossible given sealed room)
- Victim''s watch stopped at 3:14 AM; stomach contents suggest death occurred at approximately 11 PM

*Intelligent Entity*:
- Cortisol and adrenaline levels in victim''s bloodstream indicate severe terror response that began approximately 40 minutes after clinical death
- Postmortem bruising in handprint configuration on both shoulders; finger-count in prints: seven per hand
- Bite marks on victim''s neck consistent with human dentition but with jaw width of approximately 11 inches

*Possession*:
- Victim''s fingerprints found at scene, but handwriting on messages found nearby is biomechanically impossible for the victim (pressure, angle, stroke length all wrong)
- Victim''s brain tissue shows activity markers consistent with severe epileptic event, but no history of epilepsy; additionally, the markers indicate bilateral simultaneous activity in regions that do not communicate
- Hair and skin cells not belonging to victim found embedded in victim''s palms

Aim for 3-5 distinct anomalies per case, each pointing toward a different aspect of the supernatural cause.

### Investigation Timeline

Design the timeline with escalation in mind. A flat investigation with no urgency is a dead investigation. Key elements:

- **Discovery event** — when and how the case came to the investigator''s attention
- **Initial findings** — what the first 48 hours established
- **Escalation event** — the moment that made this more than a routine anomalous death (a second victim, a repeat event, new evidence that contradicts the official timeline)
- **Deadline** — what happens if the investigator does not resolve the case in time (more deaths, the organization closes it, a cover-up is finalized)
- **Current position** — where in this timeline the story begins

### Current Status

This enum controls the institutional context:

- **Active Investigation**: Full resources available but full institutional scrutiny too. The investigator can use official channels but is watched.
- **Cold Case Reopened**: New evidence allows re-examination. Resources limited but scrutiny lower. Often the status when the protagonist must justify why they''re going back.
- **Officially Closed (Cover-up)**: The most productive status for institutional conflict. The investigator must investigate without official authorization, using personal resources and risking career consequences.
- **Escalating Emergency**: Urgency overrides protocol. Fast pace, high stakes, less time for forensic patience.
- **Multi-jurisdiction**: Bureaucratic complexity amplified. Multiple agencies, conflicting authorities, information silos.

---

## The Dual Reality Principle

Every element of your case file should exist in two versions simultaneously: the official version and the true version. The forensic anomalies are the seams where these two realities fail to align perfectly. Designing a strong case means designing a strong gap between what the institution believes and what the evidence actually implies.

This gap is not just a plot device — it is a thematic statement about epistemology. How do we know what we know? What does evidence prove? Who decides what counts as evidence? These questions are why the genre exists.

---

## Common Mistakes

1. **Making anomalies too obvious** — if the forensic evidence screams "supernatural," there is no procedural tension. Anomalies should be subtle enough that a determined skeptic could explain each one away individually.

2. **No connection between victim and cause** — a random victim is dramatically unsatisfying and eliminates an entire dimension of the investigation (the victim''s background as a clue trail).

3. **Vague supernatural nature** — "some kind of evil entity" is not a working hypothesis. Define the entity type, mechanism, and motivation before writing the case.

4. **Official explanation that is too wrong** — if the official explanation is obviously inadequate, there is no institutional tension. Make it good enough that a competent, honest investigator might accept it.

5. **Timeline without urgency** — if nothing is at stake by a specific time, the investigation can meander. Every case needs a clock running.

6. **Forensic anomalies that do not connect** — random weird things are just weird. Each anomaly should be a clue that points toward the same underlying cause, even if the connection is not immediately apparent.',
  (SELECT id FROM novel_creation_method WHERE name = 'Paranormal Forensics Novel' LIMIT 1),
  1,
  20,
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
