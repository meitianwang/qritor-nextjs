-- Paranormal Forensics Novel「Novel Naming」domain knowledge skill (Layer 3)
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'Paranormal Forensics Novel' LIMIT 1)
-- Usage: mysql -u <user> -p <database> < skill-foren-novel-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'foren-novel-naming',
  '「小说命名」领域知识：超自然法证小说书名与内容简介生成，涵盖四种标题格式、词汇库、优劣对比及三段式内容简介结构',
  '"Novel Naming" domain knowledge: title and synopsis generation for paranormal forensics novels, covering four title formats, word banks, quality comparison table, and three-paragraph synopsis structure',
  '## 「小说命名」领域知识 — 超自然法证小说

书名必须同时传递三个信号：职业/法证世界（专业可信度）、超自然存在（类型标识）、悬疑/调查感（叙事张力）。内容简介以"不应存在的案件"为切入点，展现职业理性与超自然现实的冲突，以高风险收尾。避免空洞的恐怖类型词汇。',
  '## "Novel Naming" Domain Knowledge — Paranormal Forensics Novel

A title for a paranormal forensics novel must do three things at once: signal that this is a professional world governed by procedure and evidence; signal that something in that world has gone wrong in a way that defies ordinary explanation; and create the feeling of a mystery that demands investigation. Get any of these three wrong and the title fails its genre.

The most common errors are titles that are only one thing: only forensic (sounds like a medical thriller), only paranormal (sounds like horror), or only mysterious (sounds like a cozy mystery). The power of the genre is the collision between professional rationality and the inexplicable, and the title must embody that collision in three to seven words.

---

### Naming Philosophy

**Signal 1 — Professional/Forensic World**

The title must plant the reader inside a world of expertise. Forensic, pathology, medical examiner, evidence, autopsy, toxicology, case, file, report, record, trace — these terms carry professional authority. They tell the reader that the protagonist brings trained skepticism to the investigation, which makes the paranormal finding more significant than it would be in the hands of an amateur.

Institutional terms work equally well: division, bureau, unit, department, section, classified. These suggest not just individual expertise but an entire apparatus of rational investigation — and its eventual failure.

**Signal 2 — Supernatural Presence**

The paranormal signal should not be heavy-handed. Avoid direct naming of the supernatural entity or phenomenon ("The Ghost of Room 12", "The Demon in the Morgue"). The paranormal presence is most effectively suggested through impossibility — "The Impossible Autopsy," "Death Without Cause," "The Witness Who Died Twice." The reader understands that something supernatural is implied; the title respects their intelligence by not announcing it.

Atmospheric signals work well: hollow, absent, vanished, remaining, what the dead know, evidence of things not seen. These carry uncanny weight without naming the supernatural directly.

**Signal 3 — Mystery/Investigation**

The title must feel open, not resolved. The case is not closed. Something requires investigation. Question-form titles work ("What the Body Cannot Say"), as do partial statements that imply a missing answer ("Cause of Death: Unknown", "Case X: No Explanation Found"), and titles that name an absence ("The Missing Evidence", "The Witness Who Was Not There").

---

### Title Format 1: Forensic Term with Paranormal Twist

The forensic procedure or evidence type is named, then twisted by a modifier that signals impossibility. The modifier is where the paranormal enters.

Structure: [Forensic term] + [impossibility/paranormal modifier]

Examples:
- **The Impossible Autopsy** — autopsy is a technical forensic term; "impossible" signals that the procedure found something it should not
- **Cadaver Evidence** — uses the clinical term for corpse (stronger than "body"), signals forensic world without explaining what the evidence is
- **Cause of Death: Unknown** — mimics the format of an actual cause-of-death determination on a death certificate; "unknown" is rare and unsettling in a forensic context
- **Negative Toxicology** — a toxicology screen that found nothing when something should have been there; forensically precise and inherently mysterious
- **The Wound Pattern** — minimal, precise, lets the reader imagine what is wrong with it
- **No Manner of Death** — the forensic classification for death (natural, accident, suicide, homicide, undetermined); "no manner" is technically impossible and signals paranormal
- **Post-Mortem Activity** — a clinical phrase that, in this context, implies something wrong with the body after death
- **Unnatural Causes** — a direct inversion of the standard "natural causes," technically simple but generically clear
- **The Hollow Specimen** — "specimen" is clinical; "hollow" is wrong in any biological context

Tone: professional, precise, slightly unsettling. These titles feel like they belong on a case file, which is appropriate.

---

### Title Format 2: Case Designation Style

The case is given a file number or official designation. The investigator''s perspective on the case may be rendered as a subtitle. This format signals institutional procedure, classified information, and the bureaucratic world the investigation inhabits.

Structure: [Case/File/Report] [Designation] + [subtitle describing what makes this case different]

Examples:
- **Case No. 33: The Hollow Witness** — the case number is arbitrary but specific; "hollow witness" implies the witness is unreliable or impossible
- **File X-7: Unnatural Causes** — X suggests classified or exceptional; the subtitle is the genre signal
- **Report 119: No Body Found** — the case number is specific enough to feel real; "no body found" is a forensic impossibility if a death has been established
- **Incident Report: Third Floor, South Wing** — purely institutional, location-specific; nothing explicit is named
- **Case Closed / Unexplained** — the tension between the official status and the actual status of the case
- **Division IX: Paranormal Incidents** — the institutional designation is itself the revelation; the division exists, which means there are enough paranormal incidents to require a division
- **The X-Files of the Medical Examiner''s Office** — cultural reference, immediately understood, suggests a body of work rather than a single case
- **Redacted: Case of the Century** — the redaction is itself narrative information

Tone: bureaucratic, classified, suggestive of a larger institutional apparatus. Works especially well for series titles or episodic structures.

---

### Title Format 3: Atmospheric / Literary

These titles prioritize atmosphere and literary weight over technical precision. They work by naming something from the dead person''s perspective, or by stating an impossibility in plain language, or by using a biblical or literary register.

Structure: [Evocative phrase that implies perspective, impossibility, or uncanny knowledge]

Examples:
- **What the Dead Remember** — implies the dead have memories and that these memories are accessible, possibly to the investigator
- **The Witness Who Died Twice** — a precise impossibility stated as fact; "twice" suggests sequence, which implies the first death was not final
- **Evidence of Things Unseen** — echoes the biblical "evidence of things not seen" (Hebrews 11:1); recontextualizes a phrase about faith into forensic language
- **The Body That Would Not Stay** — implies post-mortem activity; "would not stay" is almost polite, which makes it stranger
- **She Came Back Wrong** — colloquial, immediate, and implies that whatever returned is not the person who left
- **The Last Testimony** — a testimony given from beyond death; "last" can mean the final testimony before death or the one given after it
- **Remains** — one word, multiple meanings: the forensic "human remains," the philosophical "what remains after death," the temporal "what remains of the case"
- **The Evidence of Her Death** — specific to a female victim; the "her" humanizes before the clinical framing arrives

Tone: literary, resonant, often works by double meaning or implied perspective. Best for standalone novels seeking literary credibility.

---

### Title Format 4: Institutional / Procedural

These titles name the apparatus that contains the investigation — the division, the department, the file system, the classification. The institutional name is itself suggestive because it implies that the paranormal is known and classified by official bodies, which raises the question of what has been classified and why.

Structure: [Name of the institutional body or procedural mechanism]

Examples:
- **Division X** — the unknown X suggests classified, exceptional, or simply "the division that handles this"
- **The Redacted Files** — redaction implies classification; the title is a promise that the contents have been suppressed
- **Classified: Paranormal Events** — the classification stamp becomes the title; implies the paranormal is an official category
- **The Suppressed Report** — a specific document that someone did not want released; the title is the document itself
- **Black Site Pathology** — combines the classified government term with the forensic discipline; implies autopsies conducted off the official record
- **The Unclassified Files** — the inverse of "classified"; these are the cases that fell through the institutional cracks
- **Section 7 Protocol** — the protocol number is arbitrary but specific; implies a formalized response to paranormal events

Tone: institutional, governmental, classified. Implies conspiracy and cover-up before the book opens. Works well for thrillers with heavy institutional antagonist presence.

---

### Word Bank

| Category | Terms |
|----------|-------|
| Forensic procedure | autopsy, pathology, toxicology, trace evidence, lividity, rigor, decomposition, manner of death, cause of death, case file, specimen, wound pattern, time of death, incision, examination |
| Institutional | division, bureau, unit, department, classified, redacted, protocol, section, report, file, record, clearance, black site |
| Paranormal signal (indirect) | impossible, hollow, absent, remaining, unseen, twice, wrong, persists, returns, refuses, will not, cannot, unknown |
| Mystery/investigation | witness, testimony, evidence, case, investigation, finding, conclusion, unresolved, open, no explanation |
| Atmospheric | cold, empty, silent, below, zero, depth, trace, shadow, hollow, still |
| Death from unusual perspective | what the dead know, remains, last testimony, after death, posthumous, she came back, it persisted |

---

### Title Quality Comparison Table

| Good Title | Poor Title | Analysis |
|------------|------------|----------|
| The Impossible Autopsy | The Scary Autopsy | "Scary" is subjective and generic; "impossible" is a forensic judgment with specific implications |
| Case No. 33: The Hollow Witness | Ghost Case #33 | "Ghost" names the supernatural directly and cheaply; "hollow witness" is more unsettling and specific |
| Evidence of Things Unseen | Paranormal Evidence | "Paranormal" is a genre label, not a title; "things unseen" is resonant and does not explain |
| What the Dead Remember | Voices from the Grave | "Voices from the Grave" is horror cliché; "what the dead remember" implies a forensic process |
| Division IX: Paranormal Incidents | The Ghost Division | "Ghost Division" is too direct; "paranormal incidents" is bureaucratic and therefore stranger |
| Cause of Death: Unknown | Death Mystery | "Death Mystery" is generic; the cause-of-death format is specific, familiar from forensics, and unsettling |
| The Wound Pattern | Mysterious Wounds | "Mysterious" is an adjective the author applied; "the wound pattern" lets the reader apply the adjective |
| Unnatural Causes | Supernatural Death | "Supernatural" names the genre; "unnatural" is the forensic inversion of "natural causes" |

---

### Synopsis Structure

**Paragraph 1 — The case that should not exist**

Open with the investigator and the anomaly, not with backstory. Establish the forensic world and the professional credentials in one or two sentences, then immediately introduce what is wrong. The reader needs to understand within the first paragraph that this is a case outside the range of what the protagonist''s training covers.

Do not open with "This novel tells the story of..." Write from inside the case. "When forensic pathologist Dr. Sarah Voss receives a body with no cause of death and no physiological evidence of dying, she files it as a medical anomaly and expects the lab results to close it. They don''t."

The first paragraph should establish: who the protagonist is (professional role), what the case is (specific enough to be intriguing), and what makes it impossible (the specific anomaly, not a vague suggestion of strangeness).

**Paragraph 2 — Professional versus paranormal conflict**

This paragraph is the engine of the synopsis. The investigator applies their methodology; the methodology fails; the anomalies accumulate; the institutional pressure begins. Establish the Investigation Line (the case will not resolve through conventional means), the Institutional Line (someone is managing what the investigator is allowed to find), and the Personal Line (why is this investigator in particular facing this case?).

Keep this paragraph specific. Name the forensic anomalies. Name the institutional pressure. Hint at the personal connection. Do not be vague — vagueness in a synopsis reads as a failure of story rather than a successful withholding of information.

**Paragraph 3 — What is at stake beyond the investigation**

The paranormal forensics novel is not only about solving a case. Something larger is at stake — the investigator''s professional identity, their understanding of what is real, the safety of others, the possibility of justice for the dead. The closing paragraph names this larger stake and ends on a question or an impossibility that the reader must read the novel to resolve.

Do not spoil the paranormal revelation. Do not name the entity or explain what it wants. End on the investigator''s position: they have followed the evidence to the edge of what their training can accommodate, and they must decide whether to follow it further.

**Length**: 150-250 words.

---

### Common Mistakes

1. **Titles that name the supernatural directly**: "The Ghost Files," "Demon Autopsy," "The Haunted Morgue." These are horror titles, not paranormal forensics titles. The supernatural should be implied, not announced.

2. **Titles without forensic signal**: "The Darkness Below," "Something Wicked," "The Horror in Room 12." Without the forensic/professional signal, the genre promise is not made.

3. **Synopses that bury the forensic premise**: Starting with the protagonist''s personal life before establishing their professional role. The forensic identity is the novel''s foundation and must appear in the first sentence.

4. **Synopses that explain the paranormal**: Revealing the nature of the entity or the supernatural explanation in the synopsis destroys the reader''s reason to open the book. The synopsis should establish the anomaly, not its explanation.

5. **Overly institutional cold titles without humanity**: Titles that are purely bureaucratic ("Report 7-B: Incident Classification") fail to communicate that there is a human protagonist. The title must hold both the professional apparatus and the suggestion of something beyond it.

6. **Synopsis that lists events rather than tension**: "First this happens, then this happens" is a plot summary, not a synopsis. The synopsis should establish what the protagonist wants, what is preventing them from getting it, and what is at stake if they fail.',

  (SELECT id FROM novel_creation_method WHERE name = 'Paranormal Forensics Novel' LIMIT 1),
  1,
  50,
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
