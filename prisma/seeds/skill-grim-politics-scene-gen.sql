-- Grim-Politics Novel「Location」scene generation skill (Layer 3)
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-grim-politics-scene-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'grim-politics-scene-gen',
  '「场景」生成：为 Grim-Politics Novel 生成场景/地点，涵盖政治意涵、氛围营造、隐藏秘密与权力归属',
  '"Location" scene generation: generate locations for Grim-Politics novels, covering political significance, atmosphere, hidden layers, and controlling faction',
  '## "Location" Generation — Grim-Politics Novel

In Grim-Politics, locations are not neutral backdrops — they are stages where the game is played, and they carry the weight of the political history that happened in them. Every significant location should tell a story about power: who built it, who lost it, and who currently holds it at a cost they may not be able to sustain.

The most important question for any location: **What happens here that cannot happen anywhere else, and who controls access to this space?**

---

### Field Generation Guide

#### Location Name

Names should reflect the location''s history and political weight. In Grim-Politics, even the name of a place is a political act — who named it, and what the name erases or commemorates.

- **Institutional names**: Names that reflect the institution they house ("The Council Chamber of [Dynasty Name]", "The High Inquisitor''s Tower")
- **Historical names**: Names that encode a past event, often one the current regime has complicated feelings about
- **Unofficial names**: What ordinary people actually call the place, often at odds with the official name — this gap is itself revealing

#### Location Type

Each type creates a different kind of scene and a different kind of political event.

| Type | What Happens Here | Political Dynamic |
|------|------------------|------------------|
| **Throne Room / Seat of Power** | Formal declarations, investitures, public audiences, ritual displays of authority | Power is performed here; the performance gap between what is said and what is real is widest |
| **Council Chamber** | Formal deliberation; the space where decisions are supposedly made | Often not where real decisions are made; the chamber is theater; the real meeting was beforehand |
| **Spymaster''s Lair** | Intelligence operations, interrogations, the management of agents | The most private space in any power structure; what happens here is what can never be acknowledged |
| **Battlefield / Siege Ground** | Armed conflict; the place where political calculation meets physical reality | Where the abstractions of political intrigue become concrete in blood; generals reveal who they actually obey |
| **Prison / Dungeon** | Detention, interrogation, disposal | The place where the system''s capacity for violence is stored; those who end up here have lost |
| **Diplomatic Neutral Ground** | Negotiations between players who cannot trust each other | The most performative space; both sides are lying and both sides know it |
| **Black Market / Underground** | The commerce of things that cannot be traded openly | Where the system''s official prohibitions meet the actual demand they create; operators are protected by everyone''s need for deniability |
| **Religious Sanctuary** | Formal protection from political violence; the administration of legitimacy | The place where the church''s power to grant or withhold divine sanction is exercised; whether that sanction still means anything is always a live question |
| **Border Fortress** | The edge of the realm''s actual control | The question of whether an army is defending or threatening depends entirely on whose army it is |
| **Abandoned Palace / Ruins of Former Power** | Ghosts of a previous regime; contested legitimacy | The most atmospheric type; the ruins of the last failed power structure; the current regime''s predecessor |

#### Political Significance

Why this location matters in the power game. Every significant location in Grim-Politics should have a specific answer to: **controlling this location gives its holder what specific advantage?**

- **Access control**: Whoever controls this space controls who can reach the decision-maker
- **Information**: What is said here is monitored; records kept here are leverage
- **Symbolic legitimacy**: Certain acts can only be performed here; certain claims can only be made here
- **Military choke point**: Whoever holds this can block movement, supply, or communication
- **Economic control**: Revenue, goods, or trade flow through here

#### Atmosphere

The physical experience of the location — what it looks, sounds, and smells like. In Grim-Politics, atmosphere is never decorative; it is the physical expression of the power dynamic that operates there.

**Key principles**:
- **Age and history should be visible**: The weight of what has happened here should be palpable
- **Hierarchy should be encoded in space**: Who stands where, who sits, who must bow at the threshold
- **Surveillance should be ambient**: The sense that observation is constant, that nothing said here is private, even when you cannot see who is watching
- **Decay and maintenance as political signals**: Is this place well-maintained (the current power wants to project strength) or neglected (they don''t care what it signals, or they can''t afford to care)?

#### Hidden Layers

What the location contains that is not visible on the surface. In Grim-Politics, every significant location has a layer of secrets.

- **Architectural secrets**: Passages, hidden rooms, observation points that some players know about and others don''t
- **Historical atrocities**: What happened here that the current regime would prefer forgotten, and the evidence that remains
- **Surveillance infrastructure**: The mechanisms by which the location''s occupants or guests are monitored
- **Concealed records**: Documentation of past decisions, agreements, or crimes that would change the political landscape if revealed
- **The real purpose**: What this location is officially said to be for, vs. what it is actually used for

---

### Location Lineup Recommendations

**A Grim-Politics setting needs at least**:
1. **The seat of formal power**: Where the official game is played — the throne room or its equivalent
2. **The real decision-making space**: Where the actual politics happen — a private council room, a spymaster''s lair, a neutral dining table
3. **The place of consequence**: The dungeon, the scaffold, the border — where the game''s outcomes become physical
4. **At least one liminal space**: A location that is contested, transitional, or ambiguous — a diplomatic meeting ground, a neutral city, a border crossing

**Optional but enriching**:
- A location from a previous political order (ruins, repurposed palace) that makes the current arrangement feel provisional
- A location outside formal power structures (a black market, an underground meeting place) where the game is played by different rules

---

### Setting Linkage

| Setting Module | Impact on Location |
|---------------|-------------------|
| **Political Landscape** | Government System → determines what formal locations exist; Power Centers → specifies which locations are most important |
| **Magic & Dark Arts** | Magic Presence → some locations may be associated with magic, either as sites of its use or as places magic is supposed to be excluded from |
| **Core Premise** | Story Archetype → determines which types of locations will feature most prominently (Succession War → throne room, council chamber; Spy at the Center → spymaster''s lair, black market) |

---

### Common Errors

1. **Locations without political function**: A beautiful throne room that is never used for anything politically significant
2. **Hidden layers that are never relevant**: Secrets should be discovered, used, or threatened to be used
3. **Atmosphere disconnected from power dynamics**: A well-maintained dungeon in a kingdom whose regime is collapsing
4. **All locations feel interchangeable**: Each location should have a distinct identity and a distinct kind of scene it enables',
  '"Location" scene generation for Grim-Politics novels.

Locations are stages where the game is played. Every location should answer: what happens here that cannot happen anywhere else, and who controls access?

### Location Types
Throne Room (power is performed; the performance gap is widest here), Council Chamber (theater — the real meeting was beforehand), Spymaster''s Lair (what happens here can never be acknowledged), Battlefield (where abstractions become concrete in blood), Prison/Dungeon (where the system stores its capacity for violence), Diplomatic Neutral Ground (both sides are lying and both sides know it), Black Market (where official prohibitions meet actual demand), Religious Sanctuary (church''s power to grant or withhold legitimacy), Border Fortress (whose army it is determines whether it''s defending or threatening), Abandoned Palace/Ruins (the current arrangement feels provisional).

### Political Significance
Access control (who reaches the decision-maker), information leverage (what is said here is monitored), symbolic legitimacy (certain acts can only be performed here), military choke point, economic control.

### Atmosphere
Age and history should be visible; hierarchy encoded in space; surveillance ambient (nothing said here is private); decay vs. maintenance as political signal.

### Hidden Layers
Architectural secrets (passages some know about), historical atrocities (evidence remaining), surveillance infrastructure, concealed records, the real purpose (vs. official purpose).',
  (SELECT id FROM novel_creation_method WHERE name = 'Grim-Politics Novel' LIMIT 1),
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
