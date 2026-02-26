-- Paranormal Forensics Novel: Investigation Organization Setting Generation Skill
-- Module: Investigation Organization (setting category)
-- Usage: mysql -u <user> -p <database> < skill-foren-org-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'foren-org-setting-gen',
  '超自然法证小说调查组织生成技能。指导如何设计组织类型、官方掩护、许可级别、案件分类系统、掩盖机制与内部政治，将机构压力转化为叙事张力的核心动力。',
  'Generates the Investigation Organization defining the institutional context — official cover, clearance levels, cover-up mechanisms, and internal politics that create obstruction and drama.',
  '用于生成超自然法证小说的调查组织模块。涵盖组织名称、类型、官方掩护、许可级别、案件分类系统、掩盖机制、内部政治、资源与限制等字段的生成指导。',
  '# Investigation Organization Generation Guide for Paranormal Forensics Novels

## Overview

The Investigation Organization is the institutional architecture that makes the genre''s central conflict possible. Without an organization — with its hierarchy, its secrets, its competing agendas, and its mechanisms for suppressing the truth — the paranormal investigator is simply a person encountering strange events. The organization transforms the investigation into a political act. Every file pulled, every witness interviewed, every autopsy conducted takes place within a structure that may be protecting its investigator or working against them.

The organization is also the mechanism of the cover-up. In this genre, institutional suppression of paranormal evidence is not incidental — it is structural. The organization knows, at some level, that the paranormal is real. The question is what it chooses to do with that knowledge, and who it protects in the process.

This guide walks through each field in the Investigation Organization module, explaining how to design an institutional setting that generates productive narrative conflict rather than simple obstruction.

---

## Field-by-Field Generation Guide

### Organization Name

Choose a name that reflects the organization''s official function, not its paranormal mandate. The official name is the cover; the real name is what insiders use, if they use one at all. Consider the following naming strategies:

**Government/Law enforcement naming conventions**:
- Bureau designations: "FBI Behavioral Science Unit — Division Seven," "Paranormal Incident Response Division (PIRD)"
- Task force language: "Inter-agency Task Force on Anomalous Deaths"
- Anodyne code names: "The Meridian Group," "Special Projects Office 9"
- File-system language: "Unit 47," "Section K," "Black File Operations"

**Private/Academic naming conventions**:
- Research institute names: "The Hartley Foundation for Unexplained Phenomena," "Center for Anomalous Evidence Studies"
- Corporate disguise: "Veridian Consulting Associates" (actually a paranormal investigation firm)

The best organization names sound utterly boring when spoken aloud in a public setting — which is precisely the point.

### Organization Type

The organizational type determines the investigator''s structural position in the institutional world:

**Regular Police Department**
The investigator operates within a normal law enforcement context, but handles cases that the department quietly routes to them when evidence becomes inexplicable. This creates maximum mundane credibility (they are just a detective) alongside maximum institutional exposure (their colleagues, superiors, and departmental procedures are all watching).
- *Narrative function*: The paranormal must be disguised in routine police language. Reports are filed as "homicide, unusual circumstances." The cover-up happens at the department level, one case at a time.
- *Conflict type*: Immediate supervisors and colleagues. The obstructer is the lieutenant who wants the case closed, not a shadowy government agency.

**Secret Government Unit**
A division within a larger government body that officially does not exist, or is classified at a level that allows most of the parent organization to deny its existence. Think X-Files'' FBI paranormal division or the UK''s "Defence Intelligence Staff — Paranormal Analysis Branch."
- *Narrative function*: Creates institutional hierarchy conflict. The investigator has access to classified evidence and government resources, but operates under classification constraints that make their findings effectively suppressible.
- *Conflict type*: The unit''s own chain of command, rival government bodies with competing interests, and the constant threat of being "black-filed" — having their evidence classified in ways that make it permanently inaccessible.

**Federal Agency (Special Division)**
Similar to the secret unit but with more official standing — the division is acknowledged within the agency but its specific mandate is classified. The investigator can show a badge and compel cooperation in ways a secret unit cannot, but they also leave a paper trail.
- *Narrative function*: Higher resource access, higher accountability. The cover-up requires more active intervention because the investigator''s activities are documented.
- *Conflict type*: Political pressure from above; congressional oversight that doesn''t understand what they''re funding; institutional rivals.

**Private Investigation Firm**
No official mandate, no institutional authority. Maximum autonomy, minimum resources. The investigator takes cases the official world refuses to handle — or cases where the family or victim trusts no official agency.
- *Narrative function*: Freedom from institutional constraint, which means freedom from institutional protection. No official cover story. Every investigation is off the books.
- *Conflict type*: Financing (who pays for this investigation?), access (how does a private investigator get into a crime scene?), credibility (who will believe their findings?).

**Academic Research Group**
Operates under a university or research institute, studying paranormal phenomena under the umbrella of psychology, anthropology, physics, or a purpose-built "anomalous phenomena" department.
- *Narrative function*: Institutional legitimacy without government authority. Can publish, which is both a power (it threatens the cover-up) and a liability (it invites institutional suppression through academic channels rather than government ones).
- *Conflict type*: Funding pressure, peer review, university administration under government pressure, and the eternal academic warfare between "believers" and "debunkers."

**Occult Society with Institutional Cover**
A private organization with centuries of history that has cultivated institutional cover — perhaps posing as a historical preservation society, a private research library, or a consulting firm.
- *Narrative function*: Deep historical knowledge and established relationships with the paranormal, but operating in the shadows of both the official world and the supernatural world. May have its own agenda that is not aligned with the investigator''s sense of justice.
- *Conflict type*: The organization''s true goals vs. the investigator''s; the secrecy that both protects and constrains them.

### Official Cover

Design the official cover with specific operational detail. The cover must be:

1. **Plausible** — it explains why people with these skills are employed together in this unit
2. **True enough** — the unit does actually do the cover function, at least sometimes, so the deception is sustainable
3. **Limiting** — the cover creates constraints that generate conflict (they can only officially request certain evidence; they can only travel to certain locations under certain pretexts)

**Examples of effective official covers**:
- "Cold Case Review Unit" — officially reviews old, stalled investigations. Cover provides access to old files and reopened cases without triggering suspicion. Limit: cannot initiate new cases, only review old ones.
- "Behavioral Analysis Consultation Service" — officially advises local departments on complex psychological cases. Cover provides access to interview subjects and case materials without official jurisdiction. Limit: advisory only; cannot make arrests or compel anything.
- "Federal Health and Safety Incident Response" — officially investigates workplace deaths and environmental hazards. Cover provides access to bodies, autopsy facilities, and contamination sites. Limit: jurisdiction ends where non-workplace deaths begin.

### Clearance Level

The clearance level determines what the investigator can access and what others are permitted to tell them:

**Open (publicly known)**
The organization''s existence and general mandate are public. The investigator can reference their position openly. Cover-up operates through denial and discrediting rather than classification. Paradoxically vulnerable — the organization can be subjected to FOIA requests, public scrutiny, budget hearings.

**Classified (internal only)**
Existence known within the parent agency; specific mandate classified. Colleagues know something unusual is being investigated but not what. Creates an interesting social texture where everyone around the investigator is aware of a secret they are not cleared for.

**Black Budget (off the books)**
Funding and existence are not documented in any public record. Operationally very powerful (no legal constraints from public accountability) but also organizationally fragile — one hostile administrator can defund the unit by simply stopping the money flow with no record that the money ever existed.

**Deniable (officially does not exist)**
The organization''s existence is actively denied at the highest levels. Evidence of its existence is itself classified. Investigators operating under this clearance have maximum freedom from accountability and maximum vulnerability to being disappeared — professionally or otherwise.

### Case Classification System

A believable case classification system makes the organization feel institutional and real. Design it with the following components:

**Naming convention**: How are paranormal cases coded?
- "Omega files" — the highest classification tier
- "Anomalous Event Reports (AERs)" — bureaucratic, neutral
- "Black notation cases" — indicated by a black mark on otherwise routine files
- "Type IV incidents" — a tiered system where Type I is barely anomalous and Type IV is "contain and classify immediately"

**Documentation protocol**: How are cases recorded to avoid being obviously about the paranormal?
- All paranormal elements are recorded in a separate, classified annex; the public file contains only the mundane elements
- Standard language is used in official reports ("cause of death: cardiac arrest, contributing factors undocumented") with the true documentation in a separate coded system
- Physical evidence is tagged with case numbers that map to a classified system invisible to standard evidence database queries

**Redaction protocols**: How is information removed from public access?
- Automatic classification triggers when specific forensic markers appear in a report
- "Witness protection" language applied to survivors who saw paranormal events (they are protected from media — but also from independent investigators)
- File numbers that appear in public records but link to "transferred to federal jurisdiction" with no further documentation

### Cover-up Mechanism

The cover-up mechanism is how the organization suppresses paranormal cases — and it is one of the primary sources of antagonist pressure on the investigator. Cover-ups work through multiple simultaneous channels:

**Bureaucratic**: Cases are classified, redacted, transferred to jurisdictions that don''t share information, or buried under procedural requirements that outlast the investigator''s patience.

**Medical**: Deaths are recategorized as natural causes with technical justifications that require specialized knowledge to challenge. Autopsy findings are amended. Toxicology reports are altered.

**Social**: Witnesses are quietly discredited, offered explanations that satisfy them, or in extreme cases placed in psychiatric care (sometimes sincerely — institutional actors may genuinely believe witness accounts reflect mental illness).

**Informational**: Media contacts are cultivated. Alternative explanations are planted. The "official story" is constructed and distributed through trusted channels before any alternative narrative can gain traction.

**Personnel**: Investigators who pursue cases too aggressively are transferred, demoted, suspended, or assigned to cases that take them away from the investigation. Their professional credibility is quietly undermined.

### Internal Politics

The most productive organizational dynamic in this genre is the **Skeptics vs. Believers** axis — but it must be designed carefully to avoid becoming a simple binary of good believers vs. bad skeptics.

**The productive version**: Skeptics are not villains; they are people doing exactly what good empirical thinkers should do — demanding evidence before accepting extraordinary claims. They become antagonists not because they are wrong to be skeptical, but because their skepticism is being weaponized by people with an interest in the cover-up. The bureaucratic skeptic who blocks the investigation may be a genuinely honest person whose legitimate position is being exploited.

**Layered political dynamics**:

- The True Believers: Small number of senior personnel who know everything. Their motive for suppression is not ignorance but calculated decision-making about what the public can safely know.
- The Functional Skeptics: Middle management who genuinely believe the "unusual circumstances" cases are outliers. They are not covering up; they are genuinely unconvinced. They are the human face of the institutional wall.
- The Compromised: Individuals who know or suspect the truth but whose careers depend on not knowing officially. They obstruct not out of conviction but out of self-preservation.
- The Allies: The very few who believe, know, and want to help — but cannot act openly without sacrificing everything.

### Resources and Limitations

Design both sides of this equation with equal care. Resources that exist without limitations are narrative shortcuts; limitations without any resources make the investigation implausible.

**Effective resource design**:
- Specific laboratory access (the one FBI lab that can run the unusual chemical tests)
- Specific institutional relationships (the coroner who will flag unusual cases without asking why)
- Specialized equipment (sensors calibrated to detect the specific signatures the unit works with)
- Historical archive access (decades of classified case files that provide pattern data)

**Effective limitation design**:
- Jurisdictional caps (cannot operate outside specific geographic or agency boundaries without triggering scrutiny)
- Resource limits (limited budget means choosing between laboratory analysis and field investigation; evidence storage is restricted)
- Manpower constraints (a two-person unit cannot simultaneously investigate multiple escalating cases)
- Time pressure (classification review periods, congressional oversight hearings, mandatory case closure timelines)

---

## How Cover-up Mechanisms Create Antagonist Pressure

The cover-up is not a single event; it is a sustained institutional force. Design it with layered pressure that escalates as the investigation advances:

1. **Passive suppression** (early): Cases are misclassified before the investigator even sees them. Evidence is filed in ways that make it technically available but practically invisible.

2. **Active discouragement** (middle): When the investigator starts finding anomalies, supervisors counsel caution. Colleagues express concern. Resources are quietly redirected.

3. **Targeted obstruction** (escalating): Specific evidence becomes "unavailable." Witnesses cannot be located. Warrants are denied. The investigator is formally reassigned.

4. **Direct threat** (climax): The organization moves to contain not just the case but the investigator. This is the moment when the institutional cover-up becomes personal.

---

## Common Mistakes

1. **The organization as simple villain** — if the organization is simply evil, it is also simple. The most compelling organizations have actors with genuinely complex motives: they suppress the paranormal because they believe this protects the public, or because they believe the information is simply too destabilizing for the world to process responsibly.

2. **The cover-up that is too competent** — an organization that never makes mistakes, never has internal dissent, never lets anything through is dramatically static. The investigator must have a path through.

3. **Unlimited clearance** — if the investigator can access everything, institutional tension evaporates. Some things must remain genuinely out of reach.

4. **No institutional allies** — pure hostility from every direction is exhausting and ultimately implausible. Even within deeply compromised institutions, there are individuals who will share information, look the other way, or actively help when their conscience demands it.

5. **Classification that does not affect the plot** — if the clearance level never actually limits what the investigator can do, it is decorative. Every access level must create at least one specific plot constraint.',
  (SELECT id FROM novel_creation_method WHERE name = 'Paranormal Forensics Novel' LIMIT 1),
  1,
  23,
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
