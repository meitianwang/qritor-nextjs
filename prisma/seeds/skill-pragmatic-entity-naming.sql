-- The Purely Pragmatic Novel — "Entity Naming" Skill (Layer 3)
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Purely Pragmatic Novel' LIMIT 1)
-- Usage: mysql -u <user> -p <database> < skill-pragmatic-entity-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'pragmatic-entity-naming',
  'Entity naming: provides naming guidance for characters, scenes, and factions in The Purely Pragmatic Novel',
  'Entity naming: provides naming guidance for characters, scenes, and factions in The Purely Pragmatic Novel',
  '## Entity Naming — The Purely Pragmatic Novel

The naming aesthetic of The Purely Pragmatic Novel is built on a single paradox: ordinary names that carry extraordinary weight. The protagonist should not be named "Victor Strategos." They should be named something that sounds like a person — because they are a person, and the reader''s discomfort comes from the fact that a person is doing what they do.

The worst names in this genre announce their function. "Lord Wisdom", "Kalculus", "Vera Sharp" — these names reach for the protagonist''s intelligence so hard that they accidentally undercut it. Real high-intelligence individuals are not named for their gifts. They are named like everyone else. The power accumulates in the name through the story. The name does not arrive pre-loaded.

This principle extends to all entities: characters, locations, factions. The naming convention of The Purely Pragmatic Novel is legibility over atmosphere, function over drama, and the quiet weight of ordinary words in extraordinary contexts.

---

## I. Character Naming

### The Protagonist: Ordinary Name, Accumulated Weight

The protagonist''s name should be:
- **Phonetically clean**: Easy to read and remember, no unusual spellings, no dramatic emphasis
- **Nationally and historically plausible**: The name should fit the story''s setting without drawing attention to itself
- **Gender-neutral or conventionally gendered depending on the story''s design**: No decision is neutral — make it deliberately
- **Available to carry weight**: Short names accumulate weight faster. One or two syllables for first names is often more effective.

The name becomes powerful through repetition and association. By chapter thirty, "Cain" or "Marsh" or "Nora" carries everything the reader has witnessed. This is the correct way to name a protagonist.

**Examples of effective protagonist names** (across settings):
- Contemporary / corporate: Marcus, Cain, Nora, Elise, Marsh, Vivian, Cole
- Historical European: Aldric, Cecily, Hugh, Margot, Edmund, Constance
- Contemporary international: Yael, Ryo, Priya, Kofi, Leila, Sven
- Near-future / institutional: Arden, Sable, Marin, Cress, Lev

**What to avoid**:
- Names that are phonetically aggressive or difficult (Xyzer, Krathos)
- Names that announce a quality ("Victor", "Grace", "Hunter" — unless the irony is intentional)
- Names that are too familiar from other famous characters in the same genre (readers will layer in the wrong associations)

### The Anomaly: A Name That Doesn''t Quite Fit the Pattern

The Anomaly is the character who does not respond to the protagonist''s calculations as predicted. Their name should carry a slight irregularity — not something impossible, but something that the reader might later recognize as an early signal.

Techniques:
- **An unusual origin for the setting**: A Welsh name in a mostly Anglo-American cast, or a Japanese name in a European historical setting — the name arrives from a different system
- **A name the protagonist would not have chosen**: If the protagonist is surrounded by functional, compact names, the Anomaly might have something slightly elaborate or old-fashioned
- **A name with unexpected nickname potential**: "Bartholomew" who everyone calls "Bart" except the protagonist who initially calls him "Bartholomew" and later shifts — the shift marks a change in the relationship''s calculation

**Examples**:
- Ffion (in an otherwise Anglo setting)
- Saoirse
- Mattias (in an American corporate story)
- Xiulan
- Oisín

The name should be pronounceable and not exotic for its own sake — but it should not fit the naming pattern of the protagonist''s usual world.

### High-Value Assets: Names That Imply Capability Without Declaring It

The people the protagonist has invested in or positioned — the ones who are valuable precisely because they are competent — should have names that feel established. Names that sound like they belong to people who have been somewhere, done something, earned a degree of gravity.

Techniques:
- **Surnames as first names**: "Calloway", "Mercer", "Fletcher" — these carry professional weight
- **Names from the field the character operates in**: A name common among lawyers, or military officers, or academics in that region
- **Full names used consistently**: If the protagonist calls someone by their full name ("Elspeth", not "Beth"), this signals respect or calculation — both are relevant

**Examples by domain**:
- Legal/governmental: Alistair, Marguerite, Theron, Claudia, Wren
- Academic/research: Helena, Aldous, Vera, Phineas, Cecily
- Military/intelligence: Graves, Marsh, Dunbar, Reyes, Holt
- Corporate: Farren, Renata, Kieran, Sable, Thorpe

### Secondary Characters Without Strategic Significance: Unobtrusive and Plausible

Characters the protagonist does not value strategically should have names that do not compete for the reader''s attention. They should be easy to remember but not memorable enough to distract from the characters who matter.

Rule: Do not give significant names to insignificant characters. Save the interesting names for the people who will carry weight in the story.

**Practical guidance**:
- Use common names for the setting (James, Sarah, Michael, Emma in contemporary English-language fiction)
- Give them a surname if they appear more than once
- Do not invent a name with unusual spelling for a character who appears twice

### Diversity and the Naming Register

Every character in the novel should feel like they came from a real place with a real history. This means the cast should not all sound like they came from the same naming convention — because real environments are not monocultural.

The rational protagonist operates in worlds that contain multiple naming traditions. A corporate headquarters in New York contains names from Korean, Nigerian, Brazilian, Israeli, Indian, and Irish backgrounds alongside traditional Anglo-American names. A historical European court contains names from the dominant culture plus names from allied or conquered territories.

Practical guidance:
- Identify the setting''s likely demographic composition
- Assign names consistent with that composition
- Do not cluster all the "unusual" names on secondary characters — the protagonist''s inner circle should reflect realistic diversity

---

## II. Location Naming

### Power Centers: Formal, Functional, Institutional

The places where the protagonist''s most significant work happens — headquarters, ministries, courts, corporate towers — should be named with institutional gravity. These names reflect how the institution sees itself.

Naming conventions:
- **Named for their function**: The Exchequer, the Bureau, the Institute, the Exchange
- **Named for their founder or patron**: Harwick House, the Aldenmere Building, St. Crispin''s Hall
- **Named for their geographic position**: The Tower, the Annex, the Lower Office, the Riverside Facility

**What to avoid**: Names that signal evil or power too dramatically ("The Citadel of Control", "The Shadow Ministry"). Real power centers have boring names. The power is in what happens there, not in the name itself. Boring names for powerful places are more unsettling than dramatic ones.

### Intelligence Sources: Ordinary Names, Disproportionate Importance

The places where the protagonist gathers information — the café where a contact meets them, the archive where a file is kept, the unremarkable office building where someone useful works — should have names that feel mundane.

The mundanity is intentional. Part of what makes the protagonist''s world feel real is that vital information passes through ordinary places. The contrast between the importance of what is discussed and the ordinariness of where it is discussed is part of the genre''s texture.

**Examples**:
- The Anchor (a pub, or a hotel, or a diner — a place people gather without noticing each other)
- Room 14 / the third-floor archive / the back office
- The Southwark branch, the Aldgate depot, the overnight post at Fairfax Street
- Named for a forgettable previous occupant: the old Grayson place, the former transit depot

### Testing Grounds / Dangerous Locations: Names That Do Not Warn

The places where the protagonist (or others) face real danger should not have names that signal danger. A space called "The Kill Room" is a parody. A space called "The Meridian Processing Center" that turns out to be where decisions about people''s fates are made — that is the correct move.

The protagonist''s model for these places should be established before their danger is — so when the danger is revealed, the reader feels the gap between the name and the reality.

**Technique**: Name dangerous locations for their surface function or their administrative designation. Never name them for their actual function.

- The Placement Office (where careers end)
- The Assessment Wing (where candidates are reduced to numbers)
- The Correction Facility (where people who knew too much are managed)
- The Transition Center (temporary, therefore presumably not permanent — except it is)

---

## III. Faction Naming

### The Legitimate Name: How the Faction Names Itself

Every faction in The Purely Pragmatic Novel should have a name it uses publicly — a name that reflects its official purpose, its historical origins, or the image it cultivates. This is the name that appears on documents, on doors, and in polite conversation.

**Naming conventions for the legitimate name**:
- **Function-based**: The Meridian Trust, the Northern Review Committee, the Standards Board, the Regulatory Office — names that describe an institutional role without implying power
- **Founder-based**: The Ashworth Foundation, the Delacroix Institute, the Harwick Society — old money and old influence wearing the name of an ancestor
- **Mission-based**: The Advancement Council, the Reform Coalition, the Stability Group — aspirational language that is deliberately vague about methods

**Principle**: The more power a faction actually holds, the more its name should understate that power. Genuine power does not need to announce itself.

### Avoiding the "Shadow Guild" Problem

The naming failure specific to this genre is the faction that declares its own nature: "The Obsidian Circle", "The Masters of the Hidden Market", "The Syndicate of Shadows". These names signal that the faction knows it is a villain in a story.

Real organizations with dangerous purposes name themselves for their ostensible function. A cartel is incorporated as a logistics company. An intelligence black program is administered by a consulting firm. A faction that controls political appointments is structured as a civic association.

**The test**: Would a mid-level employee of this faction know its real purpose from its name? If yes, the name needs revision. Faction members should know what the faction does through experience and disclosure, not through the name.

### Faction Names Across the Power Spectrum

**Dominant / Established Factions**:
Names that sound old and inevitable. They do not need to announce power because they have always had it.
- The Founders'' Assembly, the Elder Council, the Senior Committee
- The Exchequer, the Governing Trust, the Commission
- Named for a physical location that has become synonymous with power: the Whitehall Group, the Somerset Accord, the Aldgate Agreement

**Challenging / Rising Factions**:
Names that are newer and slightly more aggressive — not openly so, but carrying a subtle urgency.
- The Reform Consortium, the Progress Alliance, the Modernization Board
- Named for an ambition rather than a history: the Development Institute, the Forward Foundation

**Intelligence / Covert Factions**:
Names that are maximally bureaucratic and mundane.
- Office 7, the Special Projects Division, the External Review Directorate
- A name that sounds like a sub-department no one asked to know about: the Interagency Coordination Unit, the Strategic Assessment Group

**Factions Based on Informal Power** (the ones that have no official name but have an understood one):
These factions may not have a formal name at all — they are referred to by shorthand among those who know about them ("the old boys", "the Tuesday group", "the Harwick people"). The absence of a formal name is itself a signal of how embedded their power is.

---

## Common Mistakes

1. **Names that announce the character''s function** ("Victor Keen", "Mira Sharp", "Lord Strategos"): The name should carry weight, not predict it. The reader should not be able to guess a character''s role from their name alone.

2. **Giving the Anomaly an unpronounceable name to signal their strangeness**: The Anomaly is unusual within the world of the story — not unpronounceable in the world of the reader. Their name should be unusual for the protagonist''s environment, not difficult to read.

3. **All faction names sounding like the same organization** (all institutional and vague): Vary the register. Some factions are old and inevitable; some are new and urgent; some are deliberately invisible. The naming should reflect this.

4. **Dangerous locations with dramatic names**: "The Pit", "The Killing Floor", "The Dark Annex". Real dangerous institutional spaces have administrative names. The drama comes from knowing what they are — not from the name telling you.

5. **Naming secondary characters inventively and primary characters plainly by accident**: Attention naturally goes to names that feel interesting. If the most interesting name in a scene belongs to a character who appears once, the reader''s attention goes to the wrong place. Budget distinctive names carefully.

6. **Homogeneous cast naming** (all names from one cultural origin): The protagonist''s world should feel real. Real environments contain names from multiple traditions. Monocultural casting — especially when it is the dominant culture by default — is a failure of worldbuilding.

7. **Faction names that describe their secret function**: Any faction name that an investigative journalist could use as a headline ("The Secret Control Syndicate") has been named incorrectly. Factions name themselves for their public purpose or their historical origin — never for what they actually do.',
  '## Entity Naming — The Purely Pragmatic Novel

The naming aesthetic of The Purely Pragmatic Novel is built on a single paradox: ordinary names that carry extraordinary weight. The protagonist should not be named "Victor Strategos." They should be named something that sounds like a person — because they are a person, and the reader''s discomfort comes from the fact that a person is doing what they do.

The worst names in this genre announce their function. "Lord Wisdom", "Kalculus", "Vera Sharp" — these names reach for the protagonist''s intelligence so hard that they accidentally undercut it. Real high-intelligence individuals are not named for their gifts. The power accumulates in the name through the story. The name does not arrive pre-loaded.

---

## I. Character Naming

### The Protagonist: Ordinary Name, Accumulated Weight

The protagonist''s name should be phonetically clean, nationally plausible, and available to carry weight through repetition. Short names accumulate meaning faster. By chapter thirty, "Cain" or "Nora" carries everything the reader has witnessed.

**Effective examples by setting**:
- Contemporary / corporate: Marcus, Cain, Nora, Elise, Marsh, Vivian, Cole
- Historical European: Aldric, Cecily, Hugh, Margot, Edmund, Constance
- Contemporary international: Yael, Ryo, Priya, Kofi, Leila, Sven
- Near-future / institutional: Arden, Sable, Marin, Cress, Lev

**Avoid**: Names that announce a quality ("Victor", "Hunter", "Grace" — unless the irony is intentional); names phonetically aggressive or difficult; names too closely associated with other famous characters in the same genre.

### The Anomaly: A Name That Doesn''t Quite Fit the Pattern

The Anomaly is the character who does not respond to the protagonist''s calculations as predicted. Their name should carry a slight irregularity — an unusual origin for the setting, or a name the protagonist''s usual world would not generate.

**Techniques**:
- An unusual national origin for the setting (Welsh name in an Anglo-American cast, or Japanese name in European historical fiction)
- Something slightly elaborate or old-fashioned among otherwise compact names
- A name with nickname potential — how the protagonist uses the name (full vs. short) tracks the evolving calculation

**Examples**: Ffion, Saoirse, Mattias, Xiulan, Oisín

The name should be pronounceable and not exotic for its own sake — but it should not fit the naming pattern of the protagonist''s usual world.

### High-Value Assets: Names That Imply Capability Without Declaring It

Characters the protagonist has invested in — the ones valuable precisely because they are competent — should have names that feel established. Names that belong to people who have earned gravity.

**Techniques**: Surnames used as first names (Calloway, Mercer, Fletcher); names common in the character''s professional domain; full names used consistently by the protagonist (signaling respect or calculation).

**By domain**:
- Legal/governmental: Alistair, Marguerite, Theron, Claudia, Wren
- Academic/research: Helena, Aldous, Vera, Phineas, Cecily
- Military/intelligence: Graves, Marsh, Dunbar, Reyes, Holt
- Corporate: Farren, Renata, Kieran, Sable, Thorpe

### Secondary Characters Without Strategic Significance

Should have names that do not compete for attention. Easy to remember, not memorable enough to distract. Use common names for the setting. Do not give unusual spellings to characters who appear twice.

### Diversity and the Naming Register

The protagonist operates in worlds containing multiple naming traditions. A realistic corporate setting, a realistic court, a realistic institution — all contain names from multiple origins. Do not cluster distinctive names on secondary characters only. The protagonist''s inner circle should reflect realistic demographic composition.

---

## II. Location Naming

### Power Centers: Formal, Functional, Institutional

Named for function, founder, or geographic position — never for the power they hold. Real power centers have boring names.

- Function-based: The Exchequer, the Bureau, the Institute, the Exchange
- Founder-based: Harwick House, the Aldenmere Building, St. Crispin''s Hall
- Geographic: The Tower, the Annex, the Lower Office, the Riverside Facility

**Avoid**: Names that signal power or danger dramatically ("The Citadel of Control"). Boring names for powerful places are more unsettling than dramatic ones.

### Intelligence Sources: Ordinary Names, Disproportionate Importance

Places where vital information is exchanged should feel mundane. The contrast between the importance of what is discussed and the ordinariness of where it is discussed is part of the genre''s texture.

- The Anchor (a pub, hotel, or diner)
- Room 14, the third-floor archive, the back office
- Named for a forgettable previous occupant: the old Grayson place, the former transit depot

### Dangerous Locations: Names That Do Not Warn

Spaces where real danger occurs should not have names that signal danger. Name them for their surface function or administrative designation.

- The Placement Office (where careers end)
- The Assessment Wing (where candidates are reduced to numbers)
- The Correction Facility (where people who knew too much are managed)
- The Transition Center (described as temporary; turns out not to be)

---

## III. Faction Naming

### Every Faction Names Itself Legitimately

Each faction should have a public name reflecting its official purpose, historical origins, or cultivated image. This is what appears on documents and in polite conversation.

**Conventions**:
- Function-based: The Meridian Trust, the Northern Review Committee, the Standards Board
- Founder-based: The Ashworth Foundation, the Delacroix Institute, the Harwick Society
- Mission-based: The Advancement Council, the Reform Coalition, the Stability Group

**Principle**: The more power a faction actually holds, the more its name should understate that power. Genuine power does not need to announce itself.

### The "Shadow Guild" Problem

The naming failure in this genre is the faction that declares its own nature: "The Obsidian Circle", "The Masters of the Hidden Market", "The Syndicate of Shadows".

Real organizations with dangerous purposes name themselves for their ostensible function. A cartel incorporates as a logistics company. A black program is administered by a consulting firm. A faction controlling political appointments is structured as a civic association.

**The test**: Would a mid-level employee of this faction know its real purpose from its name? If yes, the name needs revision.

### Faction Names Across the Power Spectrum

**Dominant / Established Factions**: Sound old and inevitable.
- The Founders'' Assembly, the Elder Council, the Governing Trust
- Named for a location synonymous with power: the Whitehall Group, the Somerset Accord

**Challenging / Rising Factions**: Newer, slightly more urgent.
- The Reform Consortium, the Progress Alliance, the Modernization Board

**Intelligence / Covert Factions**: Maximally bureaucratic.
- Office 7, the Special Projects Division, the External Review Directorate
- Sub-department names no one asked to know about: the Interagency Coordination Unit

**Informal Power Factions**: May have no formal name at all — referred to by shorthand among those who know ("the old boys", "the Tuesday group", "the Harwick people"). Absence of a formal name signals the depth of their embeddedness.

---

## Common Mistakes

1. **Names that announce the character''s function** ("Victor Keen", "Mira Sharp"): The name should carry weight, not predict it. The reader should not guess a character''s role from their name alone.

2. **Making the Anomaly unpronounceable to signal strangeness**: The Anomaly is unusual within the story''s world — not unreadable in the reader''s world. Their name should be unusual for the protagonist''s environment, not phonetically impossible.

3. **All faction names sounding like the same organization**: Vary the register across old/established, new/urgent, and deliberately invisible. The naming should reflect real differences in how power is held.

4. **Dangerous locations with dramatic names** ("The Pit", "The Dark Annex"): Real dangerous institutional spaces have administrative names. The drama comes from knowing what they are, not from being told.

5. **Interesting names on characters who appear once**: Attention goes to names that feel distinctive. Budget distinctive names for characters who will carry weight.

6. **Homogeneous cast naming** (all names from one cultural origin): The protagonist''s world should feel real. Monocultural casting by default is a failure of worldbuilding.

7. **Faction names describing secret function**: Any faction name that could serve as an investigative journalism headline has been named incorrectly. Factions name themselves for their public purpose or historical origin — never for what they actually do.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Purely Pragmatic Novel' LIMIT 1),
  1,
  36,
  NOW()
)
ON DUPLICATE KEY UPDATE
  novel_creation_method_id = VALUES(novel_creation_method_id),
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  is_active = VALUES(is_active),
  sort_order = VALUES(sort_order);
