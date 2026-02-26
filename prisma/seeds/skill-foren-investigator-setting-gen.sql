-- Paranormal Forensics Novel: Investigator Profile Setting Generation Skill
-- Module: Investigator Profile (setting category)
-- Usage: mysql -u <user> -p <database> < skill-foren-investigator-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'foren-investigator-setting-gen',
  '超自然法证小说调查员档案生成技能。指导如何设计专业背景真实、超自然敏感度光谱清晰、调查方法独特的主角，涵盖职业、专业化领域、可信度、动机等核心字段。',
  'Generates a complete Investigator Profile for a paranormal forensics protagonist, covering professional background, paranormal sensitivity spectrum, investigative method, and core motivation.',
  '用于生成超自然法证小说的调查员档案模块。涵盖姓名、职业、专业化领域、超自然敏感度、职业可信度、核心调查方法、个人背景故事、核心动机等字段的生成指导。',
  '# Investigator Profile Generation Guide for Paranormal Forensics Novels

## Overview

The investigator is the reader''s guide through a world where physical evidence and supernatural reality exist in permanent collision. Unlike the typical detective protagonist, the paranormal forensics investigator carries a dual credential: they must be genuinely expert in their professional field, and they must have a credible relationship to the paranormal dimension of the cases they handle. Getting this balance right is the difference between a protagonist who feels authoritative and one who feels like a narrative convenience.

This guide walks through each field in the Investigator Profile module, explains the narrative implications of each choice, and shows how to build a protagonist whose professional expertise and paranormal sensitivity work together rather than in opposition.

---

## Field-by-Field Generation Guide

### Name

Choose a name that fits the professional context. Forensic investigators in fiction often carry names that signal their cultural background and, implicitly, how they relate to the institutional world they navigate. Consider:

- A name that sounds institutional and trustworthy (Dr. Claire Morrow, Agent James Voss) for investigators whose credibility is their primary asset
- A name with cultural weight that hints at an alternative knowledge tradition (Yuki Tanaka, Dr. Amara Osei) for investigators whose background gives them access to supernatural understanding that their institution lacks
- Avoid names that are too obviously "paranormal detective" (Hunter, Cross, Darkwood) — these signal genre rather than character

### Profession

This is the most architecturally important choice in the entire module. The investigator''s profession determines access: what they can examine, where they are allowed to go, who they can compel to speak, and what institutional authority they carry.

**Forensic Pathologist / Medical Examiner**
The richest access point in the genre. The autopsy table is the genre''s most productive stage because the body is the primary text of every death. A pathologist''s expertise means they can read the body''s story in tissue samples, wound patterns, cellular damage, organ condition, and chemical traces. When the supernatural has been at work, the body holds its signature.
- *What they can access*: Bodies, autopsy suites, toxicology labs, medical records, death certificates
- *What they cannot access*: Crime scenes (unless invited), witness interviews (officially), pattern analysis across cases (unless they compile it themselves)
- *Narrative strength*: They are always in the room with the most evidence. Every autopsy is an intimate encounter with the supernatural''s traces.

**Homicide Detective**
The most procedurally conventional choice. They work within the institutional machinery of law enforcement, which gives them broad investigative powers and also subjects them to maximum institutional scrutiny and cover-up pressure.
- *What they can access*: Crime scenes, witness interviews, surveillance footage, arrest powers, warrants
- *What they cannot access*: They depend on forensic specialists for technical analysis (creating partner dynamics), medical records require workarounds
- *Narrative strength*: They see the full picture of the case, not just the body. They experience the social dimension — how normal people respond to the supernatural.

**FBI Special Agent**
Federal jurisdiction allows crossing of geographic and departmental boundaries, which is essential for multi-state or pattern-based investigations. Often used in series where the conspiracy dimension is central.
- *What they can access*: Federal databases, cross-jurisdictional authority, specialized lab resources, classified files (with appropriate clearance)
- *What they cannot access*: They are subject to institutional politics at the highest level; cover-ups operate through their own chain of command
- *Narrative strength*: The scope of investigation can be national or international; the institutional obstruction comes from the highest levels

**Criminal Profiler**
The most psychologically oriented profession. Rather than physical evidence, they read behavioral patterns — meaning they approach the supernatural through the lens of entity psychology. What does the pattern of attacks reveal about motive? What does the choice of victim reveal about the entity''s emotional state?
- *What they can access*: Behavioral pattern analysis, psychological records, interview techniques, cross-case database analysis
- *What they cannot access*: Technical forensic analysis (they must collaborate), physical crime scenes (they interpret secondhand)
- *Narrative strength*: They ask "why" before "how," which creates a different investigative logic. They are the profession most likely to understand an entity as a thinking, motivated being.

**Private Investigator**
Operates outside institutional authority entirely. This removes both the access and the obstruction that institutional affiliation provides. Creates maximum autonomy (they investigate what they want, how they want) at the cost of resources and authority.
- *What they can access*: Whatever they can find through ingenuity, contacts, and sometimes legally gray methods; no official obstruction but also no official protection
- *What they cannot access*: Autopsies, classified files, crime scenes without invitation, any authority-backed access
- *Narrative strength*: They can follow the investigation where institutions cannot or will not go. They are already outside the system, so the cover-up cannot threaten their career — only their life.

### Professional Specialization

Within the broad profession, what is the investigator''s specific technical expertise? This should be concrete enough to feel real:

- Forensic Pathologist: *Neuropathology, toxicology, forensic odontology, wound pattern analysis, cold case tissue recovery*
- Detective: *Financial crimes, missing persons, organized crime, behavioral analysis, digital forensics*
- Profiler: *Ritual crime analysis, entity classification (if trained by a paranormal-aware institution), geographic profiling*
- Private Investigator: *Insurance fraud (cover for supernatural investigation), missing persons, surveillance*

The specialization shapes what the investigator notices and what they miss. A toxicologist will read the supernatural through chemistry. A wound-pattern analyst will read it through geometry and physics. Choose the specialization that creates the most interesting interpretive lens for your story''s specific supernatural elements.

### Paranormal Sensitivity

The sensitivity spectrum is one of the most important narrative choices in this module because it determines the investigator''s relationship to evidence — and therefore the reader''s.

**Natural Sensitive (always perceived it)**
Has experienced paranormal phenomena since childhood. Has developed coping mechanisms, interpretive frameworks, and possibly suppression strategies. The challenge: maintaining professional credibility when your perception exceeds what your instruments can measure. Creates internal conflict between instinct and protocol.
- *Narrative effect*: Reader has access to information the protagonist ''knows'' but cannot prove. Creates dramatic irony when the investigator is right but cannot act on their perception officially.

**Reluctant Believer (forced by evidence)**
The most classic arc. The investigator is professionally skeptical and their encounter with the supernatural is an unwanted disruption to a coherent worldview. Every step toward belief is a step away from who they thought they were.
- *Narrative effect*: The reader follows the investigation and the psychological transformation simultaneously. Works best in origin stories or series beginnings.

**Clinical Detachment (treats it as data)**
Does not believe or disbelieve — simply collects data that does not fit existing categories. Neither frightened nor convinced, just methodically curious. Creates an investigator who is almost alien in their equanimity, which can be deeply unnerving or deeply reassuring depending on the narrative context.
- *Narrative effect*: Maximum procedural tension. The horror is in the evidence, not the investigator''s reaction to it. Works well in high-technical-detail stories.

**Trained Specialist (institutional training)**
The paranormal unit trained them. They believe because they were taught the taxonomy, protocols, and operational procedures for dealing with entities. Their sensitivity is institutionally sanctioned, which creates interesting conflicts when their training''s limitations become apparent.
- *Narrative effect*: They can name what they''re seeing, which raises the stakes immediately. But institutional taxonomy may be inadequate for what they actually encounter.

**Inherited Ability**
Family heritage gives them perceptual access that others lack. This creates a backstory dimension that often becomes the personal emotional thread of the story. Why did this family develop this sensitivity? What price has it cost?
- *Narrative effect*: Personal history and professional case converge. The backstory IS the case file, in one dimension.

**No Sensitivity (purely rational)**
Investigates purely through evidence, never perceiving the supernatural directly. Must always infer the paranormal from physical traces alone. The most epistemologically rigorous approach — and the most frightening, because nothing protects them from entities they cannot sense coming.
- *Narrative effect*: The reader may perceive danger the protagonist cannot. Creates tension through the gap between reader knowledge and protagonist awareness.

### Professional Credibility

This determines the institutional context in which the investigator operates:

- **Respected Authority**: Their opinion carries weight; their reports are believed; they have access they can use. The cost: they have more to lose by pursuing paranormal cases.
- **Rising Expert**: Still building reputation; motivated to prove themselves; more willing to take risks to establish credibility. Vulnerable to being discredited.
- **Maverick Outsider**: Technically qualified but institutionally suspect. May have published heterodox views, challenged authority, or been associated with a scandal. Access is limited but pressure is reduced.
- **Disgraced Specialist (seeking redemption)**: Once respected, now marginalized. Often because a paranormal case went wrong and was blamed on them. The deep motivation: prove what really happened.
- **Deep Cover Agent**: Official identity is a constructed cover. True affiliation is with the paranormal unit. Creates complexity when official and covert roles conflict.

### Core Investigative Method

This is the investigator''s "lens" — the primary framework through which they interpret evidence. It shapes not just what they do but what they SEE:

- **Evidence-First**: Follows physical evidence wherever it leads; resists hypothesis until evidence demands it. Will not accept supernatural explanation until all mundane explanations are eliminated. The most rigorous approach but the slowest to reach the truth.
- **Behavioral Profiling**: Asks "what kind of mind/entity produced this pattern?" Treats the paranormal event as a communication — a trace of the entity''s psychology. Fastest to generate hypotheses but most prone to anthropomorphizing non-human entities.
- **Forensic Science**: Lab-centered. Everything goes to analysis. Waits for chemistry, histology, toxicology, and physics to speak. May miss what cannot be measured.
- **Intuition-Led**: Perception or instinct first, evidence second. Can follow leads that purely rational investigation would miss. Credibility risk: how do you document an intuition in an official report?
- **Hybrid Methodology**: Combines multiple approaches; switches between them depending on what the evidence demands. The most flexible but risks inconsistency that opponents can exploit.

### Personal Backstory

The backstory serves two functions: it explains the investigator''s professional path, and it establishes the personal paranormal event that made them who they are.

Every effective investigator in this genre has a case that changed everything — the event that proved to them the supernatural was real, that cost them something they cannot get back, and that motivates everything they do afterward. Design this event with specificity:

- **The event**: What happened? To whom? When?
- **The professional consequence**: How did it affect their career? Was it the beginning of their paranormal involvement or the crisis that almost ended it?
- **The personal cost**: Who did they lose, or what did they discover about themselves?
- **The unresolved element**: What part of that event remains unexplained? This thread can be woven into the current story.

**Example**: "Medical Examiner Dr. Voss performed the autopsy of a teenager found in the river — officially ruled drowning. But the girl''s lungs contained no water. Three years later, he still cannot explain it. He kept the file. He kept everything."

### Core Motivation

The motivation matrix balances professional, personal, and philosophical drives:

- **Professional (Find Truth No Matter the Cost)**: The investigator is epistemologically committed. They will follow evidence into career ruin because intellectual honesty is non-negotiable.
- **Professional (Protect the Public)**: They are protectors. The paranormal is dangerous, and they stand between it and people who cannot see it coming.
- **Personal (Personal Loss Linked to the Supernatural)**: Someone they loved was taken, or transformed, or destroyed by the paranormal. They investigate to understand, to avenge, or to reconnect.
- **Personal (Advance Scientific Understanding)**: The supernatural represents the frontier of human knowledge. They are drawn to it as a scientist, not a survivor.
- **Philosophical (Institutional Duty)**: They were assigned this work and chose to honor the assignment. Less dramatically obvious but creates a character whose motivation can deepen as they learn how much the institution has hidden.

---

## Making the Investigator Feel Genuinely Expert

The most common failure in this genre is an investigator who references their expertise without demonstrating it. Expertise shows in:

1. **Vocabulary** — they use professional terms naturally, without translating every one for the reader
2. **Process** — they follow procedures, not because the plot requires it but because their training demands it
3. **Observation** — they notice specific things that non-experts would not: the angle of a wound, the color of tissue under particular lighting, the behavioral inconsistency in a witness
4. **Limitation** — genuine experts know what they do not know. A pathologist defers to a toxicologist. A detective calls in a behavioral specialist. Knowing the limit of your expertise is itself a sign of expertise.
5. **Frustration** — experts are frustrated when evidence does not cooperate with their methods. They do not simply accept "the tools don''t work here." They try to find out why.

---

## Common Mistakes

1. **Profession as label** — choosing "Detective" and then having them do pathologist work, or vice versa. Each profession has specific access rules; stick to them or explain why they are being violated.

2. **Sensitivity as superpower** — if the investigator can always sense the supernatural, there is no forensic tension. Sensitivity should create questions, not answers.

3. **Backstory as exposition dump** — the original paranormal event should be revealed gradually, as it becomes relevant. Starting with five paragraphs of the founding trauma is almost always a structural mistake.

4. **Motivation without cost** — if pursuing the truth costs the investigator nothing professionally or personally, there are no stakes. Make sure the core motivation creates real risk in the context of the story.

5. **Credibility without limitation** — a Respected Authority investigator who faces no institutional resistance is dramatically inert. Their credibility must be in tension with their investigation.',
  (SELECT id FROM novel_creation_method WHERE name = 'Paranormal Forensics Novel' LIMIT 1),
  1,
  21,
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
