-- Grim-Politics Novel「Entity Naming」skill (Layer 3)
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-grim-politics-entity-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'grim-politics-entity-naming',
  '实体命名：为 Grim-Politics Novel 中的角色、场景、势力等实体提供符合黑暗政治阴谋类型美学的专业命名指导',
  '"Entity Naming": provide professional naming guidance for characters, locations, and factions in Grim-Politics novels, consistent with dark political intrigue genre aesthetics',
  '## Entity Naming — Grim-Politics Novel

Naming in Grim-Politics should do one of two things: feel so ordinary and institutional that it implies a whole world of bureaucratic normalcy masking ruthlessness, or carry enough historical and cultural weight that the setting feels embedded in real power structures. What it should never do is signal heroism, destiny, or specialness. The most dangerous spymaster in the realm should have a name that sounds like a minor court clerk.

---

## I. Character Naming

### The Central Principle

Grim-Politics character names must be **plausible within the political culture** and should not telegraph the character''s moral role. Avoid names that sound like fantasy heroes or obvious villains.

### Rulers and High Nobility

Names should feel historical — drawn from real historical naming conventions (medieval European, Byzantine, Persian, whatever fits your setting) rather than invented fantasy conventions.

**Effective approaches**:
- Dynastic repetition: rulers in the same line often reuse names with numerical suffixes (*Edward IV*, *Aldric III*), which signals continuity and also the bankruptcy of dynastic legitimacy
- Names that were great in a previous era but have become clichéd through overuse — the current king shares a name with a legendary predecessor, and the gap between them is part of the story
- Family names (surnames or house names) that encode political history: a house named after a battle, a region, or an old function

**Avoid**:
- Names that sound inherently noble or heroic (*Aurelius Brightwind*)
- Names that signal obvious villainy (*Malachar the Cruel* — let the text establish cruelty)

### Spymasters, Operators, and Bureaucrats

The most important naming insight for Grim-Politics: **the most dangerous people have the most forgettable names**. A spymaster named "Aldric Vane" is more frightening than one named "Shadowhand."

**Effective approaches**:
- Names drawn from the bureaucratic register: names that sound like they belong to a senior civil servant, a tax administrator, a court secretary
- Titles that describe function rather than status: "The Master of Letters," "The Lord of the Rolls," "The Chief Almoner" — positions that sound administrative but carry real power
- Informal names that reveal nothing about the person''s actual capabilities

### Military Figures

Names should reflect the military culture of the setting — rough, regional, or functional rather than noble.

### Common People and Servants

When named at all, these characters should have names that reflect their regional and social origin — very different from the names of the nobility.

### Naming Diversity

Avoid giving all characters names from the same sound palette. A realistic court has names reflecting multiple regional, ethnic, and social origins:
- Old families with archaic names that nobody in the current generation would choose
- New money with names that are slightly too polished — they paid for the name as much as the title
- Regional names that immediately signal origin and allegiance

---

## II. Location Naming

### Seats of Power

Formal political structures should have names that reflect their institutional function and history:
- The formal name (used in official documents) vs. the common name (used by everyone): *The Royal Hall of Council Hearings* vs. *The Long Room*
- Locations named after events that happened in them: *The Hall of the First Compact*, *The Chamber of the Sixty*
- Locations named after former rulers who built them — and the political baggage those names carry now

**Avoid**: Names that are evocatively ominous (*The Dark Tower*, *The Chamber of Whispers*). Real political buildings have boring, institutional names. The terror is in what happens there, not the name.

### Geographic Features

Cities, fortresses, and regions should have names that feel like they accumulated over time:
- Layered names: a city with an old name and a new official name (the new name is what the current regime calls it; locals still use the old name)
- Descriptive names that sound like they were given by settlers: *Stoneford*, *Coldwater*, *The Pale March*
- Names that encode political history: a province named after a conquered people, a fortress named after the siege that built it

### Underground and Shadow Locations

Black markets, secret meeting places, and unofficial spaces should have names that arise from use rather than designation:
- Names that describe what you do there (*The Exchange*, *The Market Below the Market*)
- Names that came from a single incident (*The Alley Where the Tax Collector Died*)
- Names that are purely directional (*The East Storeroom*, *Third Door Left*)

---

## III. Faction / Power Bloc Naming

### Formal Institutions

Formal power structures should have official names that sound bureaucratic and important:
- Named after their function: *The Council of Regents*, *The Office of the High Inquisitor*, *The Treasury of the Realm*
- Named after their founding: *The Order of the First Compact*, *The Charter Commission*
- Named after a person: *The Vane Apparatus* (named after the spymaster who built it)

**Avoid**: Names that sound like fantasy guilds or evil organizations (*The Brotherhood of Shadow*, *The Order of the Dark Flame*). Real powerful institutions sound boring.

### Informal Factions

Court factions that don''t have official existence should have:
- Names given by their opponents (often derogatory) that have stuck: *The Old Guard*, *The Queen''s Men*, *The River Faction*
- Names derived from their meeting places: *The White Room Faction*, *The Corridor Men*
- Names that deliberately reference nothing: *The Friends of [Person]*, *Those Who Prefer the Current Arrangement*

### Noble Houses

Noble house names should encode historical origin:
- Geographic origin: *House Vael* (from a region), *House Coldwater* (from a fortress)
- Battle or founding event: *House of the Long Siege*
- Old function: *House Warden*, *House Tollman* (their ancestors held a bridge)
- A single name that is now completely divorced from its original meaning — the house has been around so long nobody remembers what it refers to

---

## Common Errors

- ❌ Heroic-sounding names for any character (*Kaidan Stormblade*, *Lyra Brightwater*)
- ❌ Obviously villainous names (*Malachar the Usurper* — the story should establish usurpation, not the name)
- ❌ Organization names that sound inherently sinister (*The Shadowhand*, *The Dark Compact*)
- ❌ Naming patterns that are too uniform — the entire cast should not have names from the same phonetic family
- ❌ Location names that editorialized (*The Hall of Whispers* — let the function be the horror, not the name)
- ❌ Noble house names that sound invented (*House Goldenmane*, *House Shadowthorne*) rather than accumulated',
  '## Entity Naming — Grim-Politics Novel

Naming should feel ordinary and institutional, masking ruthlessness — or carry historical weight. Never signal heroism, destiny, or specialness. The most dangerous spymaster should sound like a court clerk.

---

## I. Character Naming

### Central Principle
Plausible within the political culture; does not telegraph moral role. Avoid names that sound like fantasy heroes or obvious villains.

### Rulers and High Nobility
Dynastic repetition (Aldric III), names that were great but have become clichéd, house names encoding political history (named after battles, regions, old functions). Avoid names that sound inherently noble (*Aurelius Brightwind*) or signal villainy (*Malachar the Cruel*).

### Operators and Spymasters
The most dangerous people have the most forgettable names. Bureaucratic register names; titles that sound administrative but carry real power (*Master of Letters*, *Lord of the Rolls*).

### Diversity
Old families with archaic names nobody would choose today; new money with names slightly too polished; regional names signaling origin and allegiance.

---

## II. Location Naming

### Seats of Power
Institutional, not ominous. Formal name vs. common name gap (*Royal Hall of Council Hearings* vs. *The Long Room*). Named after events or former rulers — not evocatively sinister.

### Geography
Layered names (official new name vs. locals using the old); descriptive settlement names (*Stoneford*, *Coldwater*); names encoding political history.

### Shadow Locations
Names from use, not designation. Descriptive (*The Exchange*), incident-based (*The Alley Where the Tax Collector Died*), purely directional.

---

## III. Faction Naming

### Formal Institutions
Bureaucratic and important: *Council of Regents*, *Office of the High Inquisitor*. Named after function, founding, or a person. Avoid guild/evil organization names (*Brotherhood of Shadow*).

### Court Factions
Names given by opponents that stuck (*The Old Guard*, *The River Faction*); meeting-place names; deliberately bland designations.

### Noble Houses
Geographic origin, battle/founding event, old function. Should feel accumulated, not invented.',
  (SELECT id FROM novel_creation_method WHERE name = 'Grim-Politics Novel' LIMIT 1),
  1,
  36,
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
