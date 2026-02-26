-- Paranormal Forensics Novel「Plot Generation」domain knowledge skill (Layer 3)
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'Paranormal Forensics Novel' LIMIT 1)
-- Usage: mysql -u <user> -p <database> < skill-foren-plot-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'foren-plot-gen',
  '「情节设计」领域知识：超自然法证小说的叙事结构，涵盖倒置侦查逻辑、三线叙事架构、证据墙技术、超自然揭示节奏与机构对抗张力的编排方法',
  '"Plot Generation" domain knowledge: narrative structure for paranormal forensics novels, covering inverted investigation logic, three-line story architecture, Evidence Wall technique, paranormal reveal pacing, and institutional cover-up tension',
  '## 「情节设计」领域知识 — 超自然法证小说

超自然法证小说的情节核心是**"倒置侦查"**：法证工作揭示的答案越多，疑问也越多，直到超自然解释成为唯一剩余的可能性。张力来源不是能力碾压，而是专业理性与无法解释的现实之间的持续摩擦。三条叙事线交织推进：调查线、机构线、个人线。',
  '## "Plot Generation" Domain Knowledge — Paranormal Forensics Novel

The paranormal forensics novel is driven by a single irreducible tension: a trained professional who has dedicated their life to evidence-based reasoning is forced, step by inescapable step, to conclude that the evidence points somewhere their training cannot follow. The genre lives or dies on this friction. If the protagonist surrenders too easily, you lose the forensic voice. If they resist too long, the supernatural elements feel like an intrusion rather than a revelation. Getting the plot architecture right means managing this tension across every chapter.

---

### The Inverted Investigation Structure

Most detective fiction works by accumulation: clues pile up until they point to a human perpetrator. The paranormal forensics novel inverts this. Forensic work eliminates possibilities. Each test run, each autopsy finding, each toxicology result rules out a category of conventional explanation. The plot engine is not "what happened?" but "what is left when everything possible has been ruled out?"

This means the protagonist must be genuinely competent. Every conventional explanation must be tried seriously and genuinely eliminated. If the investigator skips obvious tests or ignores likely explanations, the supernatural answer feels like a shortcut rather than a logical conclusion. The reader must feel that the protagonist has done their job — that the supernatural is the answer arrived at by exhaustion of alternatives, not laziness or credulity.

The structural implication: plant real forensic anomalies that cannot be explained away. These are not spooky atmosphere — they are load-bearing plot elements. A wound pattern inconsistent with any known instrument. A time of death established by entomology that contradicts all witness testimony. A chemical compound found in the victim''s bloodstream that does not exist in any database. Each of these anomalies must be addressed by the protagonist''s professional methodology, found intractable, and filed — until they accumulate into a pattern that only one explanation fits.

---

### Chapter Architecture

**Opening scene (forensic anomaly hook)**

The novel must begin at a crime scene or with evidence, not with backstory. The opening anomaly — the impossible wound, the inexplicable finding, the scene that doesn''t add up — establishes the genre contract immediately. The reader must understand within the first chapter that they are in a forensic world and that something in that world does not obey its rules.

The hook should be specific and technical. Not "there was something wrong with the body" but "the internal temperature was fourteen degrees below ambient despite a core body temperature that established time of death at no more than two hours ago." Specificity is credibility.

**Investigation phases (30-40% of narrative)**

The early investigation is methodical and largely conventional. Run the standard protocols. Interview witnesses. Submit samples to the lab. Build the case file. The anomalies accumulate quietly — the investigator notes them, files them, returns to them. This section establishes the protagonist''s professional competence and the novel''s forensic authenticity. If the reader does not believe the investigator is genuinely good at their job, the paranormal revelation loses its weight.

Introduce the institutional resistance early. A superior who wants the case closed. A missing file. An interview that gets flagged. The obstruction begins before the investigator understands why it''s happening.

**Escalating paranormal contact (30-35%)**

The transition from "anomalous evidence" to "direct encounter" should be gradual and reluctant. The protagonist does not seek supernatural experiences — they happen anyway, and the investigator''s first response is always to find a rational explanation. The escalation follows a specific logic: first, impossible physical evidence; then, witness testimony that is too consistent to dismiss; then, personal perceptual experience that the investigator initially attributes to stress, sleep deprivation, or contamination; finally, an encounter that cannot be explained away.

Each escalation step should be accompanied by a professional response: the investigator documents it, tries to account for it, and — failing — notes it in the case file with controlled language that cannot quite conceal what they are describing.

**Confrontation (15-20%)**

The confrontation is not necessarily a physical fight. In the paranormal forensics novel, the confrontation is epistemic: the moment the investigator must choose between their professional identity (which says the supernatural does not exist) and the evidence (which says it does). This is the novel''s true climax. Whatever follows — entity encounter, institutional showdown, resolution of the case — is downstream of this moment.

**Resolution (10-15%)**

Resolution in this genre does not mean the supernatural is explained away. It means the case is closed in some sense — the entity''s purpose is fulfilled, the victim receives something like justice, the cover-up is partially exposed, or the investigator finds a way to live with what they now know. Open endings are acceptable; the protagonist''s worldview has been permanently altered, and the novel should honor the weight of that change.

---

### Three Story Line Types

**The Investigation Line (the case itself)**

This is the forensic spine of the novel. Scene → evidence → lab → interviews → analysis → conclusion. Every plot beat in this line should be grounded in actual forensic methodology. The Investigation Line gives the novel its credibility and its pacing — forensic work has its own rhythm, and the novel should honor it. Results come back from the lab on their own schedule. Autopsies take time. Witnesses are unavailable or unreliable.

The Investigation Line must reach a genuine forensic conclusion by the end: the cause of death, the sequence of events, the evidence trail. The paranormal explanation must be the conclusion this line reaches, not a deus ex machina that replaces it.

**The Institutional Line (cover-up and obstruction)**

Someone knows what is happening and does not want it investigated. This line tracks the protagonist''s growing awareness that their investigation is being managed — files go missing, jurisdiction is reassigned, witnesses recant. The institutional antagonist is not simply obstructing justice; they have their own logic, their own fear of what the investigation will uncover.

The Institutional Line creates a second layer of mystery running parallel to the supernatural one: who is covering this up, and why? The answer is often more mundane than the protagonist initially suspects — not malevolent conspirators but frightened bureaucrats, career-protecting administrators, people who have seen what the investigator is beginning to see and chose to look away.

**The Personal Line (protagonist''s relationship to the supernatural)**

Why does this investigator encounter the paranormal when others do not? The Personal Line answers this. It may be a history the protagonist cannot remember, a sensitivity they have always dismissed as a professional liability, a connection to a previous case that was never properly closed. The Personal Line connects the investigator''s history to the current case in a way that makes the investigation feel inevitable — they were always going to end up here.

The Personal Line should develop slowly and be withheld from the reader almost as long as it is withheld from the protagonist. Its revelation should recontextualize earlier events, not introduce new information.

---

### The Evidence Wall Technique

The Evidence Wall is a structural device: the investigator''s running record of anomalies, organized by category and impossibility. Used well, it serves as the novel''s internal logic display — the reader can track the accumulation of inexplicable findings alongside the protagonist.

Structure the Evidence Wall in three columns: **Forensic Fact** (what the evidence shows), **Standard Explanation** (why this should be impossible or what normally explains it), **Status** (open, ruled out, no explanation found). Each entry is added when discovered; entries in the "no explanation found" column accumulate across the novel until their weight forces the protagonist to reconsider what they thought they knew.

The paranormal revelation works best when the Evidence Wall entries, reviewed together, could only be explained by the supernatural event the novel eventually confirms. The reader should be able to look back and see that the evidence was always pointing at the truth — the investigator was simply not ready to follow it there.

---

### Pacing: Procedural to Paranormal Ratio

A paranormal forensics novel is approximately 60% forensic procedural and 40% supernatural. If the ratio tips further toward the supernatural, the novel becomes a horror story with a forensic investigator as protagonist — the professional voice loses its authority. If the ratio tips further toward procedural, the supernatural elements feel like interruptions.

The 60/40 ratio means: lab scenes, evidence analysis, witness interviews, report writing, and institutional navigation occupy more narrative space than entity encounters, inexplicable phenomena, and supernatural manifestations. But the supernatural is never absent — it inflects the procedural material, makes it strange, leaves traces in the clinical record that the attentive reader notices before the protagonist does.

---

### Managing the Supernatural Reveal

The escalation from "this is strange" to "this is definitively supernatural" should cross three thresholds:

1. **The Anomaly Threshold**: Evidence that contradicts established forensic knowledge. The investigator notes it but assumes methodological error, contamination, or an explanation yet to be found. (Chapters 1-5 typically)

2. **The Pattern Threshold**: Multiple independent anomalies of the same type, ruling out methodological error. The investigator begins to consider whether the case itself is the problem. (Midpoint)

3. **The Personal Threshold**: The investigator experiences something directly — not through evidence but through perception. This cannot be entered in a case file. This is where the professional identity cracks and the person beneath it begins to respond. (Final third)

Never let the protagonist skip a threshold. Each must be experienced and processed before the next one becomes credible. Readers who see the protagonist accept the supernatural too quickly lose faith in the forensic premise.

---

### Foreshadowing Strategies

Forensic detail gains new meaning in retrospect. The first autopsy describes a finding that seems minor — an unusual cell structure, an anomalous calcium deposit — which, when the supernatural explanation is finally reached, turns out to be the physical signature of the entity''s presence. Plant these details early, describe them with clinical precision, and let them sit without commentary.

Witness statements contain embedded impossibilities that the investigator initially edits out. "She was standing in the room when I arrived — but I''d locked the door and there''s no other way in." The investigator focuses on confirming the locked door and moves on. The impossible part is filed away.

Institutional behavior is itself a form of foreshadowing. Every act of cover-up reveals the shape of what is being covered up. A file that is missing tells the reader something about what the file contained. An interview that is flagged tells the reader something about the witness.

---

### Multi-Case Structure (Episodic Format)

In an episodic paranormal forensics novel, individual cases are connected through the protagonist''s developing understanding of the paranormal rather than a single through-line plot. Each case advances the protagonist''s knowledge by one step: the first case establishes that impossible things can happen; the second establishes a pattern; the third establishes a rule; the fourth breaks the rule in a way that forces a more sophisticated understanding.

The episodic structure requires a meta-mystery: what is the nature of the paranormal world the protagonist is gradually mapping? Individual cases are data points. The meta-mystery is the model being built from those data points.

---

### The Antagonist Function

The paranormal forensics novel typically has two antagonist forces operating at different levels:

**The Supernatural Entity** operates as a plot engine: its actions generate the evidence, its nature determines what the investigation will find, its resolution determines the case''s end. The entity is not necessarily malevolent — in many of the best examples of the genre, the entity is simply persistent, pursuing some purpose the investigator must understand before the case can be closed.

**The Institutional Cover-Up** operates as an antagonist of process: it impedes the investigation, controls access to evidence, manages the protagonist''s conclusions. The institutional antagonist is human, motivated by recognizable fears (career, authority, secrecy), and — crucially — is not fully wrong. The paranormal exists. Containing knowledge of it serves some purpose. The investigator is the disruptive force here, not necessarily the righteous one.

The tension between these two antagonist forces is the novel''s structural core: the entity wants something; the institution wants to suppress it; the investigator is caught between them, trying to pursue truth while both forces attempt to use or obstruct them.

---

### Common Mistakes

1. **Competence failure**: Making the protagonist overlook obvious conventional explanations undermines the premise. The supernatural must be earned through genuine forensic elimination of alternatives.

2. **Premature acceptance**: If the investigator concludes "this is supernatural" too early, the forensic voice collapses. Resistance must be genuine and prolonged.

3. **Evidence without procedure**: Describing impossible findings without showing the work that confirms their impossibility. Every anomaly needs a test result, a measurement, a professional methodology that established it.

4. **Cover-up without logic**: Institutional obstruction that is cartoonishly malevolent rather than bureaucratically human. The people covering things up should have understandable (if not sympathetic) reasons.

5. **Entity without rules**: The supernatural element must have internal consistency. What it can and cannot do, what it wants, how it manifests — these should be discoverable through evidence, not arbitrary.

6. **Clinical prose that forgets the horror**: Forensic precision is an asset, but pure procedural flatness fails the genre. The horror must find its way into the clinical language — in what is not said, in what the report cannot quite describe, in the gap between the official finding and the investigator''s private knowledge.',

  (SELECT id FROM novel_creation_method WHERE name = 'Paranormal Forensics Novel' LIMIT 1),
  1,
  40,
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
