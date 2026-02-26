-- Grim-Politics Novel「Magic & Dark Arts」setting generation skill (Layer 3)
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-grim-politics-magic-dark-arts-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'grim-politics-magic-dark-arts-setting-gen',
  '「Magic & Dark Arts」设定生成：为 Grim-Politics Novel 生成魔法与黑暗艺术设定，包括魔法存在形式、代价、社会认知与政治工具化方式',
  '"Magic & Dark Arts" setting generation: generate magic and dark arts settings for Grim-Politics novels, covering magic presence, its costs, social perception, and weaponization as a political tool',
  '## "Magic & Dark Arts" Setting Generation — Grim-Politics Novel

In Grim-Politics, magic is never glorious. It is not a system of heroic power or cosmic significance — it is a dirty secret, a last resort, a weapon that leaves stains on everyone who touches it. The most important design question is not what magic can do, but **what it costs, who it marks, and who in the power structure controls access to it**.

Magic in this genre works best when it is politically integrated — when its existence creates power asymmetries, when its users are feared or exploited, and when the question of who wields it is itself a political question.

---

### Field Generation Guide

#### Magic Presence

The single most important decision for a Grim-Politics story. Different presence levels produce radically different stories.

| Presence | Story Implication | Best For |
|----------|------------------|----------|
| **Absent — Pure Political Realism** | No supernatural elements; all power is institutional, economic, and personal | Stories where the horror is entirely human; maximum cynicism about human nature |
| **Rare and Feared — Treated as Aberration** | Magic exists but is so rare it functions as a plot device rather than a system; individuals who use it are freaks or monsters in the eyes of society | Stories where a single supernatural ability creates an individual imbalance |
| **Open Secret — Used but Never Acknowledged** | The ruling class uses magic regularly but the official ideology denies its existence; knowing about it is dangerous | Stories about the gap between official reality and actual reality; complicity and silence |
| **Underground Currency — Traded in the Shadows** | Magic is illegal but commercially available; it exists in a black market ecosystem with its own political economy | Stories where enforcement is selective and corruption is the point |
| **State Weapon — Controlled by the Regime** | The government has monopolized magic; using it without state sanction is treason | Stories about the weaponization of any asymmetric advantage; analogous to nuclear weapons |
| **Religious Monopoly — The Church Alone Decides** | The institution that claims divine authority also claims magical authority; anyone else who uses it is a heretic | Stories about the relationship between legitimacy and raw power; what happens when the church is wrong |

#### Nature of Magic

What magic actually does — its fundamental rules and capabilities. In Grim-Politics, **magic should create political problems, not solve them**.

**Useful magical capabilities in this genre**:
- **Information magic**: Divination, scrying, truth-detection — creates power asymmetry around information, and the political question of whether testimony extracted under magical coercion is reliable
- **Compulsion/mind-affecting**: The ability to compel obedience or alter memory — the most politically dangerous capability; instantly threatens all voluntary institutions
- **Concealment and appearance**: The ability to look like someone else or hide information — creates a culture of paranoia; no one can be verified
- **Life and death manipulation**: Extending life, communicating with the dead — the most obvious threat to normal succession; creates dynasties that refuse to end
- **Subtle poisoning or weakening**: Long-term afflictions that look like illness or bad luck — the assassin''s toolkit, undetectable and deniable

**Magic capabilities to avoid or handle carefully**: Anything that allows one person to simply destroy armies or level cities tends to break political stories by making personal power overwhelming.

#### The Cost

In Grim-Politics, magic should cost something that matters. The cost is what makes magic a political question — because the cost falls on someone, and who bears that cost is always a power question.

**Cost categories**:
- **Personal physical cost**: Health, sanity, years of life, fertility — the user is marked and diminished
- **Relational cost**: The magic requires the sacrifice of someone else — power extracted from another person''s suffering
- **Social cost**: Using magic makes you identifiable, feared, or permanently outside normal society — a form of irreversible status marking
- **Metaphysical debt**: Obligations incurred to powers that will collect in ways and at times the user cannot control
- **Political cost**: Using magic creates evidence, witnesses, or records that can be used as leverage against you

**The most interesting costs** are the ones that integrate with the political story — using magic to secure your position creates the evidence your enemies need to destroy you.

#### Social Perception

How society thinks and talks about magic users. In Grim-Politics, the gap between private use and public discourse is itself a form of power.

- **Officially, magic doesn''t exist**: The ruling ideology denies it; anyone who claims otherwise is dismissed as superstitious or politically dangerous
- **Magic users are servants or slaves**: Those with abilities are owned by the state or by wealthy families; their power belongs to their masters
- **Magic users are ritual outcasts**: They can do things normal people cannot, but they are permanently outside society; used but not respected
- **Magic is associated with the old order**: Whatever came before — a deposed dynasty, a defeated people, a suppressed religion — and using it is politically suspect

#### Who Wields It

Which factions currently control access to magic, and how they leverage that monopoly. Access to magic is always a political resource.

- Does the throne have court mages who are effectively a secret police?
- Does a religious institution claim monopoly and use it to validate or undermine secular rulers?
- Is there a hereditary class of magic-users who extract rents from everyone else for their services?
- Is there an underground market where magic is available to the highest bidder, regardless of allegiance?

#### Magic as Political Tool

Specific operational uses of magic in the power game. These are the tools characters actually use.

- **Manufactured legitimacy**: Staged miracles, false prophecies, or fabricated divine signs used to validate a political claim
- **Assassination tools**: Poisons, curses, or afflictions that look like natural causes
- **Intelligence operations**: Divination used for surveillance; truth detection used in interrogation
- **Psychological warfare**: Creating illusions, manufacturing evidence of supernatural sanction for an enemy''s defeat
- **Loyalty insurance**: Memory alteration, compulsion, or binding oaths that cannot be broken — the nightmare of institutionalized coercion

---

### Field Linkage

- Magic Presence → determines the scale of magic-related political plots
- The Cost → creates the risk calculus; players use magic when they must, not casually
- Who Wields It → directly maps to power centers; magical monopoly should be represented in the Political Landscape
- Magic as Political Tool → should produce specific plot moments and factional motivations

### Common Errors

1. **Magic that solves problems**: In Grim-Politics, magic should create problems or be a desperate gamble, not a reliable solution
2. **Costless magic**: If using magic doesn''t risk something, there is no reason to use politics instead
3. **Magic user as exceptional hero**: The magic user who is above the political game breaks the genre
4. **Magic presence inconsistency**: Establishing magic as rare and feared, then using it casually throughout
5. **The cost falls on no one important**: If the cost of magic always falls on expendable characters, it has no political weight',
  '"Magic & Dark Arts" setting generation for Grim-Politics novels.

Magic is never glorious in this genre — it is a dirty secret, a last resort, a weapon that marks everyone who touches it.

Key design question: not what magic can do, but what it costs, who it marks, and who controls access to it.

### Magic Presence
Absent (pure political realism), Rare and Feared (individual aberration), Open Secret (used but never acknowledged), Underground Currency (illegal but commercially available), State Weapon (government monopoly), Religious Monopoly (church controls it).

### Nature of Magic
Should create political problems, not solve them. Useful types: information magic (divination, truth-detection), compulsion/mind-affecting, concealment, life/death manipulation, subtle poisoning. Avoid: anything that allows one person to destroy armies.

### The Cost
Must fall on someone politically meaningful. Physical cost (health, sanity), relational cost (sacrifice of another person), social cost (permanent status marking), metaphysical debt, political cost (creates evidence enemies can use).

### Social Perception
Officially denied / users are servants or slaves / ritual outcasts / associated with a deposed order.

### Who Wields It
Court mages as secret police, religious monopoly, hereditary magic class, underground market.

### Magic as Political Tool
Manufactured legitimacy (false prophecies), assassination tools, intelligence operations (divination as surveillance), psychological warfare, loyalty insurance (compulsion).',
  (SELECT id FROM novel_creation_method WHERE name = 'Grim-Politics Novel' LIMIT 1),
  1,
  13,
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
