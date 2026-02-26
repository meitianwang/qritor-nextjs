-- Paranormal Forensics Novel: Writing Style Setting Generation Skill
-- Module: Writing Style (setting category)
-- Usage: mysql -u <user> -p <database> < skill-foren-writing-style-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'foren-writing-style-setting-gen',
  '超自然法证小说写作风格生成技能。指导叙事视角选择、四级语气平衡矩阵、技术细节层次、节奏类型、语言语域及参考作品，帮助确立故事的独特叙事声音。',
  'Generates the Writing Style configuration covering narrative POV, tone balance matrix, technical detail level, pacing style, language register, and curated reference works.',
  '用于生成超自然法证小说的写作风格模块。涵盖叙事视角、语气平衡（四级矩阵）、技术细节层次、节奏风格、语言语域、参考作品等字段的生成指导，确立叙事声音。',
  '# Writing Style Generation Guide for Paranormal Forensics Novels

## Overview

The Writing Style module defines the narrative voice and formal strategy of your story — not what happens but how it is told. In paranormal forensics fiction, style is especially consequential because the genre depends on a precise calibration between the rational and the uncanny. Too much clinical distance and the horror evaporates; too much supernatural atmosphere and the forensic credibility dissolves. The choices made in this module determine what reading experience the story creates and which tradition of the genre it inhabits.

This guide walks through each field, explains the specific narrative implications of each choice, and provides concrete writing technique guidance for executing each option effectively.

---

## Field-by-Field Generation Guide

### Narrative POV

Point of view in this genre is not simply a technical choice — it determines what kind of access the reader has to expertise, interiority, and information.

**First Person (Investigator Voice)**

The reader inhabits the investigator''s mind completely. Every observation, deduction, and emotional response is filtered through the protagonist''s professional consciousness.

*Narrative advantages*:
- Maximum access to expert interiority: the reader understands exactly why a specific piece of evidence matters, what it should mean, and why it cannot mean what it appears to. The professional interpretation is built into the narration.
- Voice as character: The prose style itself communicates who this person is. A pathologist narrates differently from a profiler; a reluctant believer narrates differently from a natural sensitive. The first-person voice is a continuous character performance.
- Dramatic irony from the reader''s perspective: When the investigator notices something and deliberately does not record it officially, the reader is complicit in the suppression. When the investigator is wrong about something, the reader may see it before they do.

*Writing techniques for first-person investigator voice*:
- Use professional vocabulary naturally, without translation, and allow context to do the explanatory work: "The lividity pattern was wrong" is more effective than "Lividity, the pooling of blood after death, showed a pattern that was wrong."
- Let the voice shift register when the investigator is off-duty vs. on-duty: "I ordered a second coffee and thought about the cortisol levels for forty minutes. Then I went back to the body."
- Embed the investigator''s doubt directly in the narration: "I wrote ''cold damage'' in my notes because that was what it looked like. I did not write what I thought it meant."

*Narrative limitations*:
- Cannot show events the investigator does not witness
- Cannot provide the reader with information the investigator does not have, which limits dramatic irony that depends on reader foreknowledge
- The investigator''s blind spots become the story''s blind spots; this is a feature when the blind spot is thematically important, a limitation otherwise

**Third Person Limited**

The narrative follows the investigator closely but from outside their head. Access to thoughts and feelings is available but selective — the narrator chooses what to show of the protagonist''s interiority.

*Narrative advantages*:
- Narrative distance creates a separation between what the investigator experiences and how the reader receives it. This distance can generate atmosphere that first person collapses.
- More flexibility to skip forward in time, to cut away from a scene for effect, to observe the protagonist from a slight remove that makes them more mysterious.
- The reader can, on occasion, notice things about the investigator that the investigator cannot see about themselves.

*Writing techniques for third-person limited*:
- Maintain close access to the protagonist''s professional reasoning while occasionally pulling back to observe them from the outside: "She had been standing at the whiteboard for twenty minutes when Chen came in. Looking at it from the doorway, he could not tell if the diagram was a crime reconstruction or a map of something else entirely."
- Use selective free indirect discourse: move in and out of the investigator''s thoughts without explicit attribution, creating a fluid sense of interiority without full immersion.
- Allow the narrative''s observation to precede the investigator''s understanding: show the reader what the investigator is doing before showing them what it means.

**Third Person Omniscient**

Rarely the best choice for this genre, because omniscience removes the epistemological tension that is the genre''s engine. If the narrator knows everything — including the supernatural truth — the investigation''s uncertainty becomes performative.

*When to use it*: Only when the story is explicitly about multiple perspectives (different investigators, different institutions, the entity itself) and the dramatic interest lies in the collision of these perspectives rather than in a single investigator''s journey toward knowledge.

*Technique if used*: Maintain consistent narrative distance across all viewpoint characters. Do not give the reader supernatural knowledge that none of the characters possess — this destroys the shared uncertainty that makes the investigation compelling.

**Alternating POV**

Alternating between two or more viewpoint characters — often the investigator and someone connected to the case (a survivor, a colleague, or even the entity).

*Narrative advantages*:
- The entity''s perspective, rendered carefully, is one of the most effective tools for generating dread. Not explained or understood, but glimpsed — enough to establish that there is a mind there, with its own incomprehensible experience.
- A second investigator POV reveals how the same evidence is read differently by different professional frameworks, which is a structural way to explore the story''s epistemological themes.

*Technique for entity POV*: Do not make the entity articulate. Use fragmentary, associative prose that registers time, memory, and perception differently from human consciousness: "It had waited. It was still waiting. The room had changed four times and it was still waiting. This one had opened the box. Good. This one was paying attention."

---

## Tone Balance

The Tone Balance is the single most important stylistic choice in the module. It determines the emotional register of the entire story and shapes every specific writing decision.

### Level 1: Clinical/Procedural (Forensics-First, Horror Secondary)

The story is told in the dry, precise language of professional documentation. Horror is generated not through atmospheric description but through the accumulation of evidence that should not exist.

*Tonal characteristics*:
- Sparse, declarative sentences. No emotional editorializing.
- Professional vocabulary used without apology.
- Horror arises from the gap between the calm clinical voice and the content being described.
- The investigator''s emotional responses are reported as data: "Heart rate elevated. Focus narrowed. I noted the time and continued."

*Specific writing techniques*:
- Vary sentence length to create rhythm: long sentences for procedural description, short sentences when the evidence becomes impossible.
- Use the passive voice deliberately in official report sections: "The anomaly was noted. The finding was recorded. The question was not asked."
- Let technical precision carry the atmosphere: "The temperature differential between the victim''s core and extremities was 23.4 degrees Fahrenheit — an impossibility for a body dead less than four hours in a room maintained at 68 degrees."

*Best for*: Readers who come to the genre from crime fiction and procedurals; stories where the horror must be earned through evidence; investigations where the rational-irrational tension is the primary experience.

*Reference works*: Patricia Cornwell''s Kay Scarpetta series (forensic procedural as foundation); Thomas Harris''s *The Silence of the Lambs* (behavioral analysis rendered with clinical precision); the early episodes of the TV series *Fringe* (procedural foundation with escalating strangeness).

### Level 2: Equal Balance (Procedural and Supernatural Equally Weighted)

The most common and accommodating tone in the genre. Forensic detail grounds the narrative while the supernatural dimension is given its full dramatic weight. Neither element is subordinate to the other.

*Tonal characteristics*:
- The prose can shift registers: clinical precision in investigation sequences, more sensory and atmospheric in supernatural encounter sequences.
- The investigator''s emotional responses are present and allowed to matter.
- Genre conventions from both procedural and horror are visible and honored.

*Specific writing techniques*:
- Use POV shifts within a scene to create tonal transitions: begin a scene in procedural mode (inventory of the evidence, professional observations) and allow the supernatural element to pull the register toward something stranger.
- Create contrast between the investigator''s professional vocabulary and the inadequacy of that vocabulary when facing certain phenomena: "I could describe what I was looking at in anatomical terms. I could list every measurement and anomaly. What I could not do was explain why I was crying."
- Allow the forensic finding and the horror to occur in the same sentence: "The internal temperature was correct for a body dead twelve hours; the eyelids moved."

*Best for*: Broad genre readership; series fiction where both dimensions must be sustained across multiple volumes; stories with ensemble casts spanning the professional and personal dimensions.

*Reference works*: The X-Files (television, tone benchmark for the genre); Jonathan Kellerman''s Alex Delaware series when it strays into darker territory; Charlie Huston''s Joe Pitt novels (professional voice meeting supernatural reality with equal weight).

### Level 3: Supernatural-Forward (Forensics Grounds the Horror)

The primary experience is horror, uncanny atmosphere, or supernatural dread. The forensic dimension serves as the anchoring structure — the professional methodology that makes the horror legible and specific rather than diffuse.

*Tonal characteristics*:
- Atmospheric prose predominates. Sensory detail, environmental presence, and psychological intensity are primary.
- Forensic findings are presented as revelations rather than procedures — each one peels back a layer of unreality.
- The investigator''s professional composure is under constant pressure and may fail at key moments.

*Specific writing techniques*:
- Use setting as an active presence: the autopsy suite, the crime scene, the sealed building — these spaces have their own mood that the prose must establish before evidence can be examined.
- Allow professional detachment to fail with specific triggers: "I had autopsied two hundred bodies. I had never needed to leave the room. I needed to leave the room."
- Structure revelation as horror: the specific forensic finding that proves the supernatural is not an answer but a deepening of the dread.
- Use sensory detail beyond the visual: the smell of the autopsy suite, the specific sound of the evidence bag being sealed, the physical sensation of cold in a room that should not be cold.

*Best for*: Horror-first readers; gothic settings; stories where the atmosphere IS the argument — where the world is already wrong and the investigation confirms it.

*Reference works*: John Connolly''s Charlie Parker series (paranormal within crime fiction, gothic atmosphere as foundation); Shirley Jackson''s *The Haunting of Hill House* (environmental horror with investigative structure); Paul Tremblay''s *A Head Full of Ghosts* (professional investigation of paranormal phenomena with horror as primary register).

### Level 4: Dark Comedy (Irony and Black Humor)

The supernatural is treated with mordant irony. The investigator has usually seen enough that the uncanny no longer produces reverence or terror — only a bone-deep professional weary amusement. The humor is not lightness; it is the comedy of impossible situations managed with competence.

*Tonal characteristics*:
- The gap between the extraordinary content and the bureaucratic procedures for handling it is played as comedy.
- Professional vocabulary applied to supernatural phenomena is inherently absurd, and the prose acknowledges this.
- The investigator''s relationship to the supernatural is one of frustrated expertise: "I have protocol for this. The protocol does not work. I follow it anyway."

*Specific writing techniques*:
- Use bureaucratic language in obviously inadequate situations: "The entity, hereinafter referred to as Subject Alpha, did not comply with standard containment protocols. This was noted in the incident report."
- Let the investigator''s professional equanimity be genuinely funny: "I had filled out a Form 7-B for this situation before. The 7-B has a field for ''estimated entity threat level.'' I wrote ''significant'' because ''apocalyptic'' is not a recognized category."
- Allow horror and comedy to coexist without resolving the tension: the same event can be genuinely terrifying and genuinely absurd, and the prose should not choose between them.

*Best for*: Readers who appreciate genre awareness; series with established protagonists who have "seen everything"; stories where institutional absurdity is a central theme.

*Reference works*: Ben Aaronovitch''s Peter Grant / Rivers of London series (police procedural applied to magic, consistently comic in register); Seanan McGuire''s InCryptid series (professional monster hunting with comedic voice); Charles Stross''s Laundry Files series (government bureaucracy applied to Lovecraftian horror).

---

## Technical Detail Level

**Hard Forensics (Forensically Accurate, Educational)**
Research-backed. Procedures are accurate. Chemical names, anatomical terms, and forensic methodologies are correct. The story can be read as an accurate (if unusual) account of real forensic practice, with the paranormal elements being the only departures from realism.
- *Requires*: Research into actual forensic pathology, toxicology, crime scene procedure, and behavioral analysis
- *Advantage*: Authenticity generates trust; readers who know the field experience the professional accuracy as a marker of quality
- *Risk*: Technical accuracy can slow narrative pace; errors are more visible to expert readers

**Soft Forensics (Accurate Enough, Reader-Friendly)**
The procedures and vocabulary are plausible and internally consistent, but not rigorously accurate. The story uses forensic language in a way that feels real without requiring research verification.
- *Technique*: Choose 3-4 specific real forensic concepts, research them accurately, and build the professional vocabulary around them while keeping procedures general enough to avoid errors
- *Advantage*: Accessible to non-specialist readers; narrative momentum is not sacrificed to procedural accuracy
- *Risk*: Expert readers may identify inaccuracies; some of the authenticity effect is lost

**Impressionistic (Technical Atmosphere, Not Accuracy)**
The forensic dimension is evoked through tone, vocabulary, and professional attitude rather than accurate procedure. The investigator sounds like an expert; the investigation feels like real professional practice; the specific details are invented rather than researched.
- *Technique*: Focus on the investigator''s decision-making process and sensory experience rather than technical procedure. "She knew what the tissue should look like. It did not look like that" is impressionistic forensics — it invokes expertise without specifying it.
- *Advantage*: Maximum narrative freedom; the forensic dimension serves the story rather than constraining it
- *Risk*: Readers with forensic knowledge will notice; the distinctive pleasure of accurate detail is unavailable

---

## Pacing Style

**Police Procedural Pace (Methodical, Evidence-Driven)**
Investigation unfolds step by step. Each piece of evidence is examined, analyzed, and connected to the next. Urgency comes from accumulation rather than acceleration. Time feels deliberate.
- *Chapter structure*: Each chapter advances one thread of the investigation; chapters end on findings, not cliffhangers
- *Best with*: Clinical/Procedural tone; Hard or Soft forensics detail

**Thriller Pace (Fast Cuts, Rising Tension)**
Chapters are short. Scenes end on unresolved threats or revelations. Investigation is interrupted by threats, complications, and escalation. Multiple timelines may run in parallel.
- *Chapter structure*: Short scenes (2-5 pages); chapters end on high-tension beats; parallel plot lines create cross-cutting
- *Best with*: Equal Balance tone; Soft Forensics detail

**Gothic Slow Burn (Atmosphere Builds Over Time)**
The horror accumulates slowly. Early scenes establish dread before anything overtly supernatural occurs. The investigation is as much psychological as evidential. The uncanny bleeds into the mundane gradually.
- *Chapter structure*: Longer, denser scenes; atmosphere is established before event; evidence reveals and takes back at equal pace
- *Best with*: Supernatural-Forward tone; any technical level

**Case-of-the-Week (Episodic, Standalone Cases)**
Each story or chapter arc is a complete case with its own beginning, investigation, and resolution. The larger arc (institutional conspiracy, investigator''s personal history) advances in each case but does not require it.
- *Chapter structure*: Case intake, investigation phases, and resolution form a regular structure across multiple volumes
- *Best with*: Any tone; establishes series rhythms that readers learn to anticipate

---

## Language Register

The language register determines how the investigator sounds and how professional expertise is expressed in prose. Key choices:

- **High jargon density**: Uses professional terminology throughout, trusting the reader to absorb meaning from context. Signals deep expertise but may alienate non-specialist readers.
- **Translated expertise**: Uses professional terms and then provides context that allows a non-specialist to follow. More accessible but can feel condescending to readers who know the field.
- **Colloquial expertise**: The investigator is an expert whose voice has been worn smooth by years of daily practice. They use precise terms but without ceremony. "The liver was wrong" rather than "hepatic tissue analysis indicated anomalous cellular morphology."

The colloquial expert is usually the most effective register: it signals genuine expertise (casual mastery is more convincing than performed formality) while remaining accessible.

---

## Common Mistakes

1. **Inconsistent tone register** — shifting from clinical precision to gothic atmosphere without intention or effect. The shift in register should always be motivated by the narrative.

2. **Technical detail that stops the story** — forensic accuracy is a tool for authenticity, not the story''s purpose. If a technical explanation takes three paragraphs, it is probably a research note that should be condensed.

3. **POV chosen for familiarity rather than function** — first person feels natural but creates real constraints. Third person limited offers advantages in specific story shapes. Choose based on the story''s needs, not default preference.

4. **Reference works as imitation targets** — the listed reference works identify tone and tradition, not templates. A story that sounds like a direct imitation of The X-Files is not a paranormal forensics novel; it is fan fiction. Use references to understand tradition; develop an original voice within it.

5. **Pacing that does not match tone** — gothic slow burn with thriller pacing creates incoherence. The pace and tone should reinforce the same reading experience.',
  (SELECT id FROM novel_creation_method WHERE name = 'Paranormal Forensics Novel' LIMIT 1),
  1,
  25,
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
