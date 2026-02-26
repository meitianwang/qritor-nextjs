-- Paranormal Forensics Novel: Supernatural Framework Setting Generation Skill
-- Module: Supernatural Framework (setting category)
-- Usage: mysql -u <user> -p <database> < skill-foren-supernatural-framework-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'foren-supernatural-framework-setting-gen',
  '超自然法证小说超自然框架生成技能。指导如何设计实体类型、法证特征（核心字段）、检测方法、互动规则、威胁机制、弱点与科学可信度层次，建立故事的超自然运行规则。',
  'Generates the Supernatural Framework governing how the paranormal operates in the story — forensic signatures, entity type, detection methods, interaction rules, and scientific plausibility layer.',
  '用于生成超自然法证小说的超自然框架模块。涵盖实体类型、检测方法、法证特征（核心）、互动规则、威胁机制、弱点、收容或解决方法、科学可信度层次等字段的生成指导。',
  '# Supernatural Framework Generation Guide for Paranormal Forensics Novels

## Overview

The Supernatural Framework is the rulebook for your story''s paranormal dimension. In a genre where physical evidence and supernatural cause must coexist, the framework performs a critical function: it determines what the supernatural leaves behind, how it can be detected, how it behaves, and how it can be stopped. A poorly designed framework breaks the detective logic that gives the genre its distinctive pleasure; a well-designed one creates an investigation where every clue is earned and every conclusion is logically reachable from the evidence.

The heart of this module is **Forensic Signatures** — the specific, concrete, scientifically framed physical traces that the supernatural leaves in autopsy suites, crime scenes, and laboratory analyses. Everything else in the framework supports and explains why those signatures exist.

---

## Field-by-Field Generation Guide

### Entity Type

The entity type is your foundational choice. Each type has different forensic implications, different narrative affordances, and different investigative demands.

**Residual Ghost**
A psychic recording rather than a conscious entity. The event imprinted on the environment and replays — but the ghost cannot perceive the living, respond to them, or be communicated with. The investigation becomes archaeological: reconstruct what happened, understand why it imprinted, find a way to disrupt the replay.
- *Forensic implications*: Evidence clusters around locations and times, not individual targets. Victims are in the wrong place during the replay. The evidence trail leads backward to the original event.
- *Narrative strength*: Deep historical mystery. The original event may be centuries old. Research becomes investigation.

**Intelligent Haunting**
A conscious, purposeful entity that perceives and interacts with the living. Has goals, preferences, and a psychology that can be profiled. The criminal profiler''s richest target.
- *Forensic implications*: Victim selection is non-random and profiler-decodable. Interaction patterns reveal preferences and triggers. Communication is possible but unreliable.
- *Narrative strength*: The entity is an antagonist with psychology. The investigation converges on understanding the entity''s mind.

**Demonic Entity**
An autonomous malevolent force with power that exceeds ordinary supernatural phenomena. May have agendas beyond the immediate case. Often has historical or institutional knowledge that is dangerous.
- *Forensic implications*: Evidence of disproportionate force. Biological markers that suggest cellular corruption or contamination rather than trauma. Multiple simultaneous effects.
- *Narrative strength*: Raises the stakes of the investigation to existential levels. The investigator is not just solving a crime but confronting something that may be beyond their ability to stop.

**Ancient Spirit**
A non-human consciousness predating modern civilization. May operate on values and logic entirely alien to contemporary investigative frameworks. Communication is possible but comprehension is not guaranteed.
- *Forensic implications*: Evidence may reflect ancient practices, materials, or conditions that require historical research to decode. The forensic anomalies may only make sense within a pre-modern cosmological framework.
- *Narrative strength*: Creates a cultural research dimension. The investigation requires collaboration between forensic science and anthropology/archaeology.

**Cursed Object Manifestation**
The paranormal is embedded in an artifact. It may project an entity or it may operate as an autonomous force. Multiple victims connected by proximity to or contact with the object.
- *Forensic implications*: Chain of custody for the object becomes critical. Victims show similar forensic signatures regardless of location. The object itself may show anomalous physical properties.
- *Narrative strength*: The artifact can travel across cases, creating a series thread. The investigation must trace the object''s history.

**Mass Consciousness**
A collective psychic event: group hysteria elevated to actual paranormal force, or an entity that emerges from collective emotional states. Multiple witnesses, shared symptoms, difficult to localize.
- *Forensic implications*: Simultaneous physiological effects in multiple individuals. Epidemiological investigation pattern. Shared but inexplicable neurological markers.
- *Narrative strength*: Social and political dimensions. The investigation implicates entire communities and challenges the individual psychology framework.

**Interdimensional Being**
An entity from a dimension adjacent to ours, operating according to physics that do not match ours. May not understand or care about human life in any conventional sense.
- *Forensic implications*: Evidence may include physical impossibilities (materials from outside known chemical taxonomy, spatial anomalies, time dilation effects). Standard forensic tools may not function correctly.
- *Narrative strength*: Maximum strangeness. The investigation requires building new analytical tools as it proceeds.

---

## Forensic Signatures: The Core of the Framework

Forensic signatures are the physical evidence that the entity or event leaves behind — the traces that a sufficiently expert investigator can read as a paranormal fingerprint. This field is where the genre''s distinctive pleasure is generated: the moment when a trained scientist looks at evidence that their instruments can measure but their theories cannot explain.

### Design Principles

**1. Ground every signature in a specific forensic or medical context**

Do not write "strange marks" or "unusual readings." Write in the language of the discipline:

- *Pathology*: Tissue samples, organ condition, cellular damage patterns, wound morphology, toxicology results, time of death indicators
- *Chemistry*: Anomalous compounds, impossible chemical reactions, materials with no known source
- *Physics*: Temperature readings, electromagnetic anomalies, spatial measurements that do not add up
- *Behavioral*: Victim''s last documented actions, witness physiological responses, behavioral patterns before death

**2. Make each signature specific and imaginative**

The goal is to make the reader think: "I have never encountered that in fiction before, but now that I see it, I cannot forget it." Examples:

*For a cold-energy entity*:
- "Cellular histology reveals cryonecrosis — cold-induced cellular death — in a pattern that follows nerve pathways rather than vascular ones, suggesting the cold was conducted neurologically rather than through blood or tissue contact. Core body temperature was 98.4°F at time of autopsy."
- "Ice crystal formation found within the vitreous humor of both eyes, consistent with rapid freezing, despite no external evidence of cold exposure. The crystals are structurally perfect — laboratory-grade uniformity impossible to achieve without controlled conditions."

*For a terror-entity (psychological threat)*:
- "Serum cortisol levels indicate a sustained terror response lasting approximately 90 minutes. Stomach contents and gastric motility suggest this terror response began approximately 40 minutes after clinical cardiac death."
- "The hippocampus shows pattern of hyperactivation consistent with extreme traumatic memory consolidation. The specific memory being consolidated cannot be determined, but the activation pattern suggests an event of unprecedented subjective intensity occurring immediately before death — not simply the experience of dying."

*For a possession event*:
- "Bilateral simultaneous EEG activation recorded in regions that share no direct neural pathway. The right and left hemispheres were receiving identical signals simultaneously — anatomically impossible through any known biological mechanism."
- "Fingertip abrasions inconsistent with victim''s fingerprint ridge patterns found on victim''s own wrists — as if the victim was restrained by their own hands operating under separate command."

*For a location-bound entity*:
- "All seven victims found within the building exhibit identical post-mortem lividity orientation — blood settled upward regardless of body position, as if gravitational orientation in this space differs from baseline physics."
- "Carbon-14 dating of organic material on victim''s clothing shows a date approximately 340 years in the past, despite the material being demonstrably modern in manufacture."

*For a residual haunting (temporal ghost)*:
- "Victim''s watch stopped at 3:17 AM; gastric contents indicate last meal 6-8 hours prior, placing death between 9 PM and 11 PM. Witness accounts place victim alive and well at midnight. No period of 3+ hours of unexplained absence is documented."
- "Smoke inhalation damage to lung tissue consistent with a fire. No fire occurred at the location within the victim''s lifetime. Ash particles recovered from lungs match the chemical composition of a 1943 industrial fire at this address."

**3. Scale signatures to the entity''s mechanism**

Every signature should be traceable, in hindsight, to the entity''s nature and threat mechanism. Design the framework first, then derive the signatures logically:

- *Cold entity + neurological conduction* → cold damage in nerve patterns, not vascular patterns
- *Terror entity + post-mortem consciousness* → cortisol and memory activity after clinical death
- *Temporal residual* → anachronistic physical materials, timeline impossibilities, stopped clocks

**4. Create 3-5 distinct signatures per entity type**

A single anomaly can be explained away. Multiple independent anomalies that share a common hidden explanation — the entity''s nature — constitute a forensic argument. Each signature should point toward the same underlying cause from a different analytical angle.

### Signature Examples by Entity Category

**Residual Ghost signatures**:
- Anachronistic trace materials in victim or scene
- Timeline impossibilities in forensic reconstruction
- Environmental anomalies localized to specific spatial coordinates

**Intelligent Haunting signatures**:
- Evidence of selection and intent in victim targeting
- Interaction traces (handprints, marks, communications)
- Escalation pattern visible in comparative case analysis

**Demonic Entity signatures**:
- Contamination-style cellular damage rather than trauma
- Simultaneous multi-system failure without progressive cascade
- Symbol or pattern appearances at cellular, tissue, or scene scale

**Ancient Spirit signatures**:
- Archaeologically anachronistic materials (substances not manufactured in this era)
- Physiological changes consistent with conditions not present in modern environment
- Cultural or ritual pattern embedded in wound or scene arrangement

---

## Detection Method

The detection method must be grounded in the investigator''s specific professional skills. The same entity will look different to a pathologist than to a profiler:

- *Pathologist detects*: Autopsy markers, tissue analysis, chemical anomalies in biological samples
- *Detective detects*: Scene evidence, witness accounts, behavioral patterns, crime reconstruction
- *Profiler detects*: Victim selection patterns, entity behavioral signature, psychological implication of attack methods
- *Field agent detects*: EMF readings, temperature fluctuations, environmental sensors, observational presence

The detection method should require active investigation — not a passive "I sense something" but a specific analytical procedure the investigator performs. This is what makes the protagonist''s expertise feel real.

---

## Interaction Rules

The degree of entity agency is one of the most architecturally important choices in the framework, because it determines what kind of investigation is possible:

- **No interaction possible (residual only)**: The entity cannot be communicated with, negotiated with, or even warned about. Investigation is entirely retroactive. The only resolution is understanding and disrupting the imprint.
- **Passive interaction possible**: The entity responds to stimuli without genuine communication — it reacts to presence, to specific stimuli, to emotional states, but without comprehension. Like working with a very powerful reflex.
- **Limited communication**: Information can be transmitted to the investigator through environmental manipulation or indirect means, but genuine dialogue is not possible. Creates riddles that must be decoded.
- **Full communication possible**: The entity can speak, reason, respond to questions, negotiate. This transforms the investigation into an interview with an inhuman mind. Requires careful thought about what an entity''s communication is actually like — not just a ghost who talks like a person.

### Threat Mechanism

How the entity causes harm determines the forensic signatures more than any other variable. Be specific:

- Physical violence (kinetic force, temperature, pressure) → trauma signatures
- Psychological manipulation (terror induction, memory alteration, compulsion) → neurological and neurochemical signatures
- Possession (motor control, identity replacement) → behavioral signatures plus unusual physical evidence of divided agency
- Environmental hazard (corrupting space, altering physics) → anomalous environmental readings, multiple simultaneous victims
- Ontological threat (attacking memory, identity, sense of reality) → the hardest to detect forensically; requires psychological rather than physical signatures

---

## Scientific Plausibility Layer

This field calibrates how much the story commits to pseudoscientific explanation versus accepting the supernatural on its own terms. This is a tonal and thematic choice as much as a worldbuilding one:

**Hard Paranormal Science (high plausibility)**
Every paranormal event has a pseudoscientific explanation: quantum entanglement explains entity coherence, electromagnetic fields explain perception, neurological anomalies explain possession. The story maintains scientific language throughout. Works best for readers who need a rational framework to engage with horror.

**Soft Paranormal Science (medium plausibility)**
Scientific frameworks are applied but their limits are acknowledged. The investigation uses scientific tools but accepts that some phenomena exceed current scientific understanding. The most common tone in the genre.

**Institutional Science (procedural plausibility)**
The story never explains the paranormal directly — it just documents what the instruments measured and what the evidence showed. Whether the explanation is scientific, supernatural, or something else entirely is left to the reader. Creates ambiguity that can be deeply unsettling.

**Full Supernatural Acceptance (low plausibility)**
The paranormal operates on its own logic, which the investigator must learn rather than impose scientific categories upon. More common in stories with ancient spirits or entities from outside human cosmology.

---

## Making Weaknesses Feel Logical

Weaknesses should derive from the entity''s nature rather than being arbitrary:

- A cold entity might be weakened by heat or by disrupting the thermal environment it exploits
- A terror-feeding entity might be weakened by an investigator who genuinely has no fear response (clinical detachment as an armor)
- A location-bound residual might be disrupted by changing the physical conditions that anchor the imprint (removing the original materials, flooding the space)
- An entity that operates through psychological manipulation might be partially countered by documented protocols that force rational procedure in the face of overwhelming sensory input

---

## Common Mistakes

1. **Generic forensic signatures** — "strange wounds" and "elevated EMF readings" are not sufficient. Every signature should be specific enough that a reader could describe it to someone who has not read the story.

2. **Detection method disconnected from profession** — if the pathologist is detecting entities through EMF readers, explain why their professional skill is not sufficient. The expertise should be the primary detection instrument.

3. **No constraint on interaction** — an entity that can talk freely, answer every question, and explain the plot is not a paranormal challenge but a narrative convenience. Limit communication in ways that force the investigator to do detective work.

4. **Weaknesses without logic** — "it can be stopped by salt and iron" is a convention, not an explanation. In a genre that prizes internal consistency, weaknesses should follow from the entity''s nature.

5. **Scientific plausibility inconsistency** — choose a level and maintain it. Mixing hard science explanations with full supernatural acceptance in the same story creates tonal incoherence.',
  (SELECT id FROM novel_creation_method WHERE name = 'Paranormal Forensics Novel' LIMIT 1),
  1,
  22,
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
