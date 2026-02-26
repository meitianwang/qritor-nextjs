-- Paranormal Forensics Novel「Entity Naming」domain knowledge skill (Layer 3)
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'Paranormal Forensics Novel' LIMIT 1)
-- Usage: mysql -u <user> -p <database> < skill-foren-entity-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'foren-entity-naming',
  '「实体命名」领域知识：超自然法证小说中人物、实体/幽灵、犯罪现场、证据、机构与案卷的命名规范，包括正式档案命名与调查员非正式称呼的双重体系',
  '"Entity Naming" domain knowledge: naming conventions for characters, entities/ghosts, crime scenes, evidence, organizations, and case files in paranormal forensics novels, covering the dual system of official designation versus investigator informal shorthand',
  '## 「实体命名」领域知识 — 超自然法证小说

命名是法证类型小说世界构建的关键技术。人物名需传递专业权威感或身份模糊性；实体有三重命名（档案编号、调查员昵称、实体自我认同）；机构采用朴素掩护名；案卷存在官方编号与调查员非正式称呼的双轨体系。每个命名决定都应服务于专业理性与超自然现实之间的核心张力。',
  '## "Entity Naming" Domain Knowledge — Paranormal Forensics Novel

Naming in the paranormal forensics novel is not decoration — it is world-building through nomenclature. The dual naming system (official designation versus investigator shorthand) is one of the genre''s most effective structural tools. It embeds the tension between institutional control and individual knowledge directly into the language of the story. When the official case file reads "Incident 7-Alpha: Cause of Death Undetermined" and the investigators call it "the Voss case" or "the hollow one," both names carry information, and the gap between them tells the reader something about the relationship between official knowledge and actual knowledge.

Every naming decision in this genre should serve the core tension: professional rationality operating in a world where the rational framework is no longer sufficient.

---

### Character Naming: Investigators

Forensic investigators carry names that signal professional authority. These are not memorable aesthetic names — they are functional names that belong in a departmental directory, on a report header, on a name badge worn at a crime scene.

**Full professional name conventions**: Use names that are legible across professional contexts — not overly ethnic, not overly generic, not conspicuously literary. The protagonist''s name should be forgettable in the right way: you do not remember the detective''s name from reading it on a badge, you remember it from how they work.

Effective investigator name patterns:
- First name that is professional and slightly formal (Sarah, David, Elena, Marcus, Katherine, James)
- Surname that carries quiet authority without being theatrical (Voss, Kellner, Ashford, Hargrove, Reyes, Tamura, Sinclair, Pryce)
- The combination should sound like a name on a departmental photo that hangs in an institutional corridor

**Specialization signals in names**: The protagonist''s professional title is more important than their name. "Medical Examiner Dr. Katherine Pryce" establishes more character than the name alone. Titles that carry specific forensic weight: Medical Examiner, Forensic Pathologist, Criminal Profiler, Special Agent, Forensic Anthropologist, Crime Scene Investigator, Behavioral Analyst. These titles are not interchangeable — each implies a specific methodology and institutional position.

**Investigator teams**: Supporting investigators should have names that are distinct from each other and distinct from the protagonist. Avoid names that start with the same letter. Avoid names that sound similar (Voss and Ross, Kelly and Kelley). In an institutional world, names are identifiers; they should function that way in the prose.

**The protagonist''s professional nickname**: How colleagues address the protagonist signals their standing. A protagonist called "Doc" by crime scene officers occupies a different institutional position than one called "Dr. Voss." The informal name is earned and signals professional intimacy with the broader investigative community.

---

### Character Naming: Suspects

Suspects should have names that do not telegraph guilt. The naming convention is deliberately ordinary — suspects who have conspicuously sinister names are poorly concealed villains. The most effective suspects have names that are slightly forgettable, that could belong to the background of any investigation.

**Ambiguity principle**: The suspect''s name should not signal anything about their relationship to the paranormal. A suspect named "Victor Grimm" has been pre-convicted by the author. A suspect named "Martin Cole" or "Jennifer Walsh" occupies the story neutrally.

**Profession signals**: If the suspect has a professional identity (a hospital administrator, a property developer, a local official), their name should fit that professional context. Institutional people have institutional-sounding names.

**The witness-suspect boundary**: In paranormal forensics, some characters occupy the space between witness and suspect — they know something the investigator needs, but their knowledge may make them dangerous to the investigation. These characters should have names that are memorable for non-sinister reasons: a distinctive first name paired with an ordinary surname, or vice versa. "Miriam Ashton." "Patrick Lue." The name signals that this person is worth remembering without signaling why.

---

### Character Naming: Victims

Victims must be humanized before they become "the body." The name does this work.

**Before they are a case**: The victim''s name should be full and specific — first name, often a middle name or family connection, a name that implies a life. "Eleanor Ruth Marsh" is a person. "The decedent" is a case. The novel should introduce Eleanor Ruth Marsh before it shows the crime scene, even briefly.

**Name as character**: The victim''s name often carries information about who they were — profession, family, community. A victim named "Father Dominic Callaghan" carries religious institution. A victim named "Dr. Wei Huang" carries academic or medical world. These associations are relevant to why they were the target, what the investigator must understand about them.

**Post-mortem reference**: After the victim is established as a person, the investigator''s professional language shifts to clinical designations. The prose should track this shift and make it uncomfortable — the moment the report says "the decedent" instead of "Eleanor Marsh" is itself a kind of violence. Good paranormal forensics novels do not let this shift go unnoticed.

---

### Entity / Ghost Naming: The Three-Name System

Non-human entities in the paranormal forensics novel typically carry three distinct names, each belonging to a different relationship with the entity.

**Name 1 — Case File Designation**

The official case file cannot name an entity as an entity — the institution does not acknowledge the paranormal. Instead, the case file designates the entity by incident type and identifier. This designation is what appears in official reports, departmental communications, and institutional records.

Format conventions:
- Incident type code: "UI" (Unidentified Incident), "PE" (Paranormal Event), "AU" (Anomalous Unresolved), "X" (exceptional/classified), "NID" (Non-Identified Decedent, repurposed)
- Sequential identifier: number or alphanumeric
- Location or case association

Examples: UI-7, PE-Alpha-12, Case AX-33, Incident 119-B, Subject NID-7

The case file designation is deliberate in its refusal to name what is actually there. "UI-7" says nothing about what UI-7 is, which is precisely the point. The designation is the institutional strategy of containment applied to nomenclature.

**Name 2 — Investigator Informal Nickname**

Investigators who work with paranormal cases long enough develop informal names for the entities they have encountered. These names are never in the official record; they exist in private notes, in inter-investigator conversation, in the verbal shorthand of people who know what they are actually dealing with.

The informal nickname is typically derived from one distinctive aspect of the entity''s manifestation, or from the case it is associated with, or from the witness who first reported it.

Naming conventions for informal investigator nicknames:
- **Descriptive**: Named for a physical quality or behavioral pattern ("the Cold One," "the Hollow," "the Still," "the Repeating," "the Watcher in Ward Six")
- **Case-derived**: Named for the case or victim ("the Marsh incident," "the Eleanor case," "the Voss entity")
- **Location-derived**: Named for where it was encountered ("the third-floor thing," "the Kellner building," "the Eastgate")
- **Behavioral**: Named for what it does ("the Collector," "the Messenger," "the One That Waits")

Effective informal names are short, slightly uncomfortable, and not quite accurate — they name one aspect of the entity without claiming to name the whole. "The Cold One" is an investigator''s attempt to describe something they do not fully understand, and the name reflects that limitation.

**Name 3 — The Entity''s Own Identity**

Some paranormal forensics novels develop a third name: what the entity was before it became what it is, or what it calls itself if it has retained enough selfhood to communicate. This name is typically discovered late in the investigation and recontextualizes the entire case.

The entity''s own identity is usually a human name — the name they carried in life — which makes its situation both more comprehensible and more tragic. Learning that "UI-7" was once "Eleanor Ruth Marsh" completes the victim-to-entity arc and is one of the genre''s most effective emotional moves.

If the entity has moved further from its human origin, its name may be something older or stranger — a designation from whatever taxonomy the novel''s paranormal system uses. But even these names should feel like something a person could say, not a collection of unpronounceable consonants.

---

### Crime Scene Naming: Location Names

Crime scenes in the paranormal forensics novel carry history. The location name should do some of this work without being heavy-handed.

**The principle of earned dread**: A location named "the Hollow House" announces its horror. A location named "the Eastgate Medical Center, third floor, South Wing, room 319" earns its dread through what is found there. Specific, institutional, mundane location names are more effective than atmospheric ones — because the horror comes from what the investigation finds, not from the name.

**History embedded in names**: Location names that carry historical weight without announcing it: "the old Kellner property," "the site of the former Voss facility," "the building that was demolished in 1987 and rebuilt in 1989." The history is in the name without being explained by it.

**The official address versus the investigator shorthand**: A crime scene at "4417 South Hargrove Avenue, Unit 7" becomes "the Hargrove scene" or "the Unit 7 case" in investigator conversation. The official address is in the file; the shorthand is in the dialogue. Both are used, and the tension between them — between the location as a geographical fact and as an investigative event — is productive.

**Recurring locations**: If the investigation returns to a location, the name accretes meaning. "The Kellner building" means something different in chapter 12 than it did in chapter 2. The name becomes a shorthand for everything that was found there, everything that happened there, everything the investigator now knows about what the location is.

---

### Evidence Naming: Case Numbering and Item Designation

Forensic evidence has a dual naming system by professional convention, and the novel should use both registers.

**Official item designation**: Evidence is catalogued by case number and item number. "Case 7-Alpha, Item 23" or "Evidence batch 119, specimen 7-B." These designations appear in case files, chain-of-custody documentation, and lab reports. They are anonymous, sequential, and deliberately non-descriptive — what matters is the number, not the item.

**Investigator shorthand for significant items**: Items that become significant in the investigation acquire informal names among the investigators working the case. This naming process is itself a signal — when the investigator starts calling a piece of evidence "the compass" or "the photograph" rather than "Item 23," they are acknowledging that this item has meaning beyond its evidentiary function.

Effective informal evidence names:
- Named for what the item is ("the photograph," "the watch," "the letter")
- Named for where it was found ("the under-floor sample," "the roof specimen")
- Named for what the item does or suggests ("the compass" for an item that seemed to orient toward something, "the trigger" for the piece of evidence that broke the case open)
- Named for their anomalous quality ("the impossible sample," "the one that came back negative for everything")

---

### Organization Naming: Institutional Bodies

The secret government unit or classified department that knows about the paranormal must be named in a way that reflects institutional psychology: bureaucracies name their most sensitive operations in the most mundane possible language.

**The cover name principle**: Classified units do not name themselves "the Paranormal Division" or "Bureau X." They name themselves something that sounds like a routine administrative function. "The Office of Epidemiological Monitoring," "the Special Forensic Review Unit," "the Division of Unexplained Mortalities." The name describes a function that could plausibly exist in any large institution, which is the point — the cover name is designed to be unremarkable.

**Naming conventions for classified units**:
- Generic institutional function + division/office/unit/bureau
- Acronyms that sound like routine administrative designations (SERU, UFM, ARC, NEI)
- Named after a procedure rather than a subject ("the Review Unit," "the Assessment Division")
- Named after a policy rather than an entity ("the Protocol Seven office")

**The informal investigator name for the institution**: Investigators who know what the classified unit actually does give it their own name. "The Black Files people," "Division X," "the Redacted," "the people who come after." These informal institutional names carry the investigator''s relationship to the institution — usually a mixture of professional recognition and personal wariness.

---

### Case File Naming Conventions

The paranormal forensics case has a formal designation and an informal name, and both matter.

**Official case designation**: Follows the conventions of the investigative institution (law enforcement, medical examiner''s office, classified government unit). Typically: case number + year + jurisdiction code + status indicator. "Case 7-119-A: Open/Undetermined." The official designation says nothing about what the case actually contains.

**Unofficial investigator case names**: What the investigators actually call the case. Named for the victim ("the Marsh case"), the location ("the Eastgate incident"), the anomaly ("the hollow case," "the cold one"), or the investigation''s defining moment ("the night of the readings"). These informal names circulate among investigators who know what the case actually is; they appear in personal notes, private conversation, and eventually — if the investigation is ever officially acknowledged — in the classified record as a parenthetical alias.

**The naming arc**: A case often starts with an official designation, acquires an informal investigator name as it develops, and — if the paranormal explanation is confirmed — may eventually acquire a third name: the entity''s own terminology for what happened, recovered through whatever channel the novel''s investigation uses to access that information.

---

### Common Mistakes

1. **Villain names that announce guilt**: Suspects named "Mors," "Grimm," "Shadow," or any name with obvious dark connotation. The most effective paranormal forensics suspects have names that could belong to a mid-level hospital administrator.

2. **Entity names that over-describe**: "The Darkness That Walks," "the Screaming One," "the Devourer" — these names belong to a different genre. Entity names in forensic fiction should be minimal, observational, and slightly inadequate, as if the investigator is describing something they cannot fully name.

3. **Institutions named for what they do**: "The Paranormal Investigation Bureau," "the Supernatural Events Unit," "the Ghost Division." Real classified programs are named to obscure their function, not announce it.

4. **Evidence without provenance**: Significant evidence items that are not properly designated in the case file, or that the protagonist handles without logging. The chain of custody is a forensic principle and a narrative one — evidence must be tracked, and departures from tracking are themselves significant.

5. **Victims who remain clinical from the start**: Introducing the victim as "the decedent" or "the body" before establishing them as a person. The clinical term should feel like a cost, not a convenience.

6. **Inconsistent naming registers**: Mixing official case file language and investigator informal language without purpose. The shift between registers should always be deliberate and carry meaning — when the investigator shifts from "the Marsh case" to "Case 7-119-A," something has changed in their relationship to the investigation.',

  (SELECT id FROM novel_creation_method WHERE name = 'Paranormal Forensics Novel' LIMIT 1),
  1,
  51,
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
