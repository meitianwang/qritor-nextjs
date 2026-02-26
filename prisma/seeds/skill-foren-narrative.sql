-- Paranormal Forensics Novel「Narrative Craft」domain knowledge skill (Layer 3)
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'Paranormal Forensics Novel' LIMIT 1)
-- Usage: mysql -u <user> -p <database> < skill-foren-narrative.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'foren-narrative',
  '「叙事技巧」领域知识：超自然法证小说的法证视角叙述、犯罪现场描写、解剖叙事、目击者访谈写作、超自然认知转变瞬间及机构场景氛围营造的详细写作指南',
  '"Narrative Craft" domain knowledge: detailed writing guide for paranormal forensics novels covering forensic investigator voice, crime scene walk-through technique, autopsy narration, witness interview prose, the moment of paranormal recognition, and institutional scene writing',
  '## 「叙事技巧」领域知识 — 超自然法证小说

法证调查员叙述视角是本类型的核心资产：临床观察、精确词汇、模式识别构成独特的第一人称或紧贴第三人称叙事。写作的关键挑战是：在维持法证精确性的同时，让超自然恐惧渗入字里行间——不靠直白恐吓，靠克制、细节与暗示。',
  '## "Narrative Craft" Domain Knowledge — Paranormal Forensics Novel

The paranormal forensics novel succeeds or fails on the strength of its professional voice. The protagonist is not a civilian who stumbles into supernatural horror — they are a trained expert who encounters something their training cannot explain. Every scene must be filtered through that expertise. The clinical gaze is not a stylistic choice; it is the engine of the genre''s horror. When an experienced forensic pathologist writes "the wound geometry is inconsistent with any instrument in my reference database," the reader understands that something has gone profoundly wrong with the world.

---

### The Forensic Investigator''s Voice

The forensic professional narrates through a specific cognitive lens: observation precedes interpretation, measurement precedes conclusion, and every claim is qualified by the method that produced it. This creates a narrative voice with several distinctive features.

**Categorical precision**: Forensic professionals think in categories. Not "the body" but "the decedent." Not "he was cut" but "a sharp-force injury consistent with a single-edged blade, width approximately 28 millimeters, entering at a 45-degree angle to the skin surface." The protagonist names what they see with exactness, and this exactness is itself character — it reveals a mind trained to resist vagueness.

**Qualified statement**: Professionals rarely state certainties. "Consistent with," "suggests," "cannot rule out," "within the margin of," "at the time of examination" — these hedges are not weakness but rigor. They also create narrative space: what is "not ruled out" is, by implication, the thing the protagonist is thinking about.

**Pattern recognition as perception**: A forensic investigator does not simply see a scene; they read it. They notice what is absent (no defensive wounds when there should be), what is inconsistent (lividity pattern that contradicts the body''s position), what is out of sequence (evidence of post-mortem activity when the timeline says there was none). This analytical perception is the investigator''s superpower and should be rendered in prose as a constant, slightly exhausting alertness.

**Emotional compression**: Forensic professionals work in proximity to death, trauma, and human suffering as a routine professional matter. The prose should reflect this — not callousness, but professional distance, the careful management of emotional response. The horror of the paranormal works precisely because it penetrates this professional armor. Something is wrong when the investigator''s clinical detachment begins to slip.

**First-person versus close-third**: First-person gives maximum access to the investigator''s interior professional reasoning but risks claustrophobia. Close-third allows the narrative to occasionally observe the protagonist from outside — noticing what the investigator fails to notice about themselves — but risks losing the intimacy of the forensic voice. Either can work; the choice should be consistent and deliberate.

---

### Scene-Writing Technique: The Crime Scene Walk-Through

The crime scene walk-through is the genre''s signature scene and should be rendered with care each time. The structure is:

**Entry protocol**: The investigator does not simply walk in. They note the perimeter, the access control, who has been in and out and when. They put on PPE. They do not touch anything immediately. This procedural entry establishes the investigator''s professionalism and creates a brief delay before the scene is fully revealed — which is its own form of tension.

**First impression before analysis**: Before the systematic catalogue, there is a moment of unmediated perception. The professional eye cannot be entirely suppressed. Something about the scene strikes the investigator as wrong before they can say why — a smell that doesn''t belong, a silence that is too complete, an arrangement that the eye refuses to accept as normal. This is the moment where forensic precision and instinctive dread first meet.

**Systematic catalogue**: Moving from perimeter to center, or from entry to focus point, the investigator describes what they see with professional precision. Every detail is noted. Measurements are taken. The prose mirrors the actual methodology — thorough, patient, covering the obvious before the anomalous. This section earns the anomaly by demonstrating the investigator''s competence.

**The anomaly**: Embedded in the catalogue is the impossible finding. It should be described in the same clinical register as everything else — no special emphasis, no sudden shift in tone. The investigator notes it as they note everything else. Its significance is communicated by the pause it creates in the systematic documentation: the investigator notes it, moves on, returns to it.

**Hypothesis formation and failure**: The investigator forms hypotheses. Each one is tested against the available evidence and found inadequate. The prose should make this failure visible — the professional mind working through its framework and finding the framework insufficient.

---

### Autopsy Narration

The autopsy scene is both technically demanding and atmospherically critical. It must be grounded enough to be credible and strange enough to carry the genre''s horror.

**Technical grounding**: An autopsy follows a sequence — external examination, incision, organ removal and weighing, tissue sampling, toxicology specimens. The narrative does not need to reproduce the full sequence, but it must feel like it could. The protagonist names organs correctly, uses anatomical terminology accurately, and employs actual forensic measurement conventions (lividity, rigor, gastric contents as time-of-death indicators).

**The uncanny in the clinical**: The autopsy scene''s horror arises from the gap between the body''s biological reality and whatever the investigation is finding. A body that shows no physiological sign of having died of the cause that killed it. Tissue that has undergone a process the pathologist cannot name. Cellular structures that are not in the reference literature. The clinical voice describing these findings is what makes them horrifying — if the prose became emotional or metaphorical at this point, the horror would diffuse. It must remain precise.

**Internal organ as evidence**: In the paranormal forensics novel, the autopsy does not simply establish cause of death — it establishes something about what the entity did to the victim. The physical trace of the paranormal is most often found inside the body, in what the cells have become, in what the biochemistry shows. The protagonist is reading a text written in the victim''s flesh, and the text says something that has no place in the medical literature.

**Writing the emotional cost**: The investigator is professionally accustomed to autopsies, but this one is different. The prose should track the moment when professional equanimity fails — briefly, quickly suppressed — and what the investigator does with that response.

---

### Witness Interview Technique in Prose

Witness interviews are a core investigative tool and a primary vehicle for supernatural information delivery. The craft challenge is writing them so they function simultaneously as realistic investigative procedure and as controlled revelation.

**The investigator''s listening posture**: Forensic investigators are trained to listen for what is not said. They note hesitations, redirections, the witness who answers a slightly different question than the one asked, the detail that is volunteered once and then not repeated. In prose, this means the investigator''s internal commentary runs alongside the witness''s dialogue — noting the evasion, clocking the inconsistency, flagging the suppressed knowledge.

**Evasion as evidence**: Witnesses who know about the paranormal often cannot say what they know directly. They use circumlocutions ("there was something there, I don''t know what to call it"), they minimize ("I might have imagined it"), they deflect ("you wouldn''t believe me"). The investigator should pursue these moments with professional persistence — not psychologically, but evidentiary: "What specifically did you see?" "Can you describe the movement?" "You said ''something'' — can you be more precise?"

**Consistency as a supernatural indicator**: Multiple witnesses, interviewed independently, describing the same impossible detail — same cold, same sound, same sense of directional attention — is more significant than any single dramatic encounter. The convergence of independent testimony is itself a forensic finding. The investigator should track this across the investigation.

**Class of witness**: Different witnesses occupy different epistemic positions. The civilian witness is unfiltered and emotional but may be the most accurate observer. The institutional witness (police officer, emergency responder) has training that may cause them to suppress or rationalize what they saw. The expert witness (local historian, occultist, prior investigator) has framework but may have motivated reasoning. Each class of witness requires a different interview approach, and the prose should reflect this.

---

### The Moment of Paranormal Recognition

This is the novel''s most technically demanding scene: the transition in the investigator''s internal state from "anomalous evidence" to "this is supernatural." Writing it requires precision and restraint.

The moment should not be dramatic. The investigator does not have a revelation — they complete a process. The prose should make visible the final step in a logical sequence that the reader has been watching build for chapters. "The evidence eliminates every conventional explanation. The only remaining hypothesis is one that my training says cannot be correct. I am filing it as the working hypothesis."

The investigator''s response is professional, not emotional — but the professional response itself reveals the emotional reality. The investigator documents more carefully. They begin to follow protocols they had not previously considered necessary. They review their notes for the third time. The compulsive review of evidence is the forensic professional''s form of denial.

What breaks through professional distance is sensory experience, not intellectual conclusion. The investigator can accept, intellectually, that the evidence points to something impossible. What they cannot prepare for is the smell in the room, the temperature drop, the sense of being observed by something that cannot be there. The physical experience of the paranormal bypasses the professional framework in a way that evidence alone cannot.

---

### Atmosphere and Dread in Procedural Prose

Forensic precision and atmospheric horror are not opposites. The clinical voice creates dread through restraint: what is not named is more frightening than what is. "The tissue sample showed cellular differentiation inconsistent with any known biological process" is more disturbing than "the flesh had been transformed by supernatural forces."

Specific strategies:

**Accumulating impossibilities without comment**: List the forensic findings in sequence, clinical and matter-of-fact, and let the reader feel the impossibilities pile up without the narrative acknowledging their weight. The absence of comment is itself significant.

**The gap between report and reality**: The formal case report and the protagonist''s private notes (or internal monologue) describe the same events in different registers. The report is controlled, qualified, defensible. The private record contains what the report cannot say. This gap is where the horror lives.

**Silence and absence**: Forensic investigators work in environments where silence is informative. A scene with no ambient sound, a body with no smell despite decomposition timeline, evidence that should exist but does not — these absences are themselves data points. Render them with the same precision as presence.

**Temperature as a recurring indicator**: The paranormal in forensic fiction is often cold. The protagonist notes temperature readings that contradict expectations. The cold becomes a diagnostic indicator — the investigator begins to treat unusual cold as a forensic finding in its own right.

---

### Dialogue for Expert Characters

Forensic professionals speak differently to each other than to civilians. Get this distinction right.

**Expert-to-expert**: Technical vocabulary without explanation. No patient clarification of terms. Shorthand. Challenge and counter-challenge. "The lividity''s wrong for the position." "I know. The body was moved." "How long before?" Efficient, precise, professional. These exchanges can carry large amounts of plot information at speed.

**Expert-to-civilian**: The investigator translates, simplifies, manages emotional response. But they also assess the civilian''s knowledge level in real time — a civilian who uses technical vocabulary correctly is a signal. The investigator should be noticeably adjusting their register in these conversations.

**Expert-to-superior**: Institutional hierarchy inflects the dialogue. Information is shaped for the audience — what the superior wants to hear, what the investigator needs them to act on, what cannot be said directly. These conversations are often where the institutional cover-up becomes visible in the gaps.

---

### Institutional Scene Writing

The bureaucratic scene — the departmental meeting, the classified briefing, the visit from a senior official who wants the case closed — is as important to the genre as the crime scene.

Key techniques: **deliberate vagueness** (official language that communicates without committing), **visible hierarchy** (who speaks and who listens, where people sit, who does not attend), **the thing that is not said** (the subject that everyone in the room knows is not being discussed), and **the investigator''s position** (professionally subordinate, epistemically superior — they know more than anyone in the room wants them to know).

---

### Handling the Supernatural Encounter

When the investigator faces the entity directly, the prose faces its hardest challenge: the forensic voice must engage with something for which it has no framework.

The correct approach is not to abandon the forensic voice but to show it failing in real time. The investigator attempts to apply their professional methodology — they observe, measure, categorize — and finds that the methodology produces nonsense. A body that is present and not present. A temperature reading that changes between measurements taken seconds apart. A recorded image that does not show what the investigator can see with their own eyes.

The entity should not be described with horror genre vocabulary (malevolent, terrifying, inhuman). It should be described with forensic precision applied to phenomena that resist forensic precision — which creates its own, stranger kind of dread.

---

### Common Mistakes

1. **Accurate-sounding jargon that is wrong**: Forensic errors undermine the professional premise. Research actual forensic methodology, cause-of-death determinations, and autopsy procedure before writing these scenes.

2. **Abandoning the clinical voice at the horror moment**: Shifting into standard horror prose when the entity appears sacrifices the genre''s defining asset. The clinical voice must try to hold, and fail interestingly.

3. **Witnesses who simply deliver information**: Witnesses who tell the investigator exactly what they need to know, without resistance, evasion, or inconsistency, read as plot devices rather than people.

4. **Institutional obstruction that is cartoonishly sinister**: Bureaucratic antagonists who are obviously evil miss the genre''s most interesting tension. They should be recognizably human, even sympathetic, in their desire to suppress the investigation.

5. **Autopsy scenes that are gratuitously graphic without forensic purpose**: Gore for its own sake undermines the clinical frame. Every physical detail should be forensically significant — either as conventional evidence or as a paranormal indicator.

6. **The protagonist who is too comfortable with the supernatural**: Professional resistance to paranormal explanation must be genuine and sustained. An investigator who accepts the supernatural too readily ceases to be a forensic investigator and becomes a protagonist in a different kind of story.',

  (SELECT id FROM novel_creation_method WHERE name = 'Paranormal Forensics Novel' LIMIT 1),
  1,
  101,
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
