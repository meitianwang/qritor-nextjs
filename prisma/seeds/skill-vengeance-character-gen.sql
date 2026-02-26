-- "Character" Generation — The Vengeance Soul Novel
-- Layer 3 domain knowledge skill for character generation
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-vengeance-character-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'vengeance-character-gen',
  '"Character" generation: generates characters for The Vengeance Soul Novel — protagonists, targets, allies, and those caught in the wreckage',
  '"Character" generation: generates characters for The Vengeance Soul Novel — protagonists, targets, allies, and those caught in the wreckage',
  '## "Character" Generation — The Vengeance Soul Novel

In Vengeance Driven fiction, every character exists in relation to the protagonist''s wound. This does not mean the cast is flat — quite the opposite. The most powerful vengeance narratives are populated by characters who have depth, contradictory motives, and genuine humanity, because the moral weight of the protagonist''s actions depends on the humanity of what surrounds them. A revenge story where everyone the protagonist destroys deserves it completely is wish fulfillment. A revenge story where some of them didn''t deserve it, or where the guilty are also capable of love, becomes something much more uncomfortable and much more powerful.

---

### Character Role Design

#### The Protagonist
The central design challenge: create someone readers will follow into moral territory that should repel them. Key attributes:
- **The wound is visible but not performed**: The damage is in how they see the world, not in dramatic speeches about their suffering
- **Competence as survival**: They are exceptional at what they do — and what they do is now destruction. The competence that readers admire is deployed in service of something troubling.
- **Involuntary humanity**: They have not successfully amputated all feeling. Readers see this in moments the protagonist would prefer not to have.
- **Consistency of purpose**: Even readers who are disturbed by the protagonist''s methods should understand, at every point, exactly why they are doing what they are doing.

#### Primary Target / Enemy
The most important secondary character. Design principles:
- **Give them something human**: A love they protect, a code they actually believe in, a moment of genuine grace. This does not excuse them — it makes the protagonist''s destruction of them more morally complex and more satisfying.
- **The specific nature of their guilt**: Precisely what did they do, and why? Self-interest? Fear? Ideology? Pleasure? The motivation shapes everything about the confrontation.
- **Their relationship to the crime over time**: Do they regret it? Rationalize it? Have they built their entire identity on denying it? Have they genuinely moved on and prospered? Each answer creates different dramatic potential.
- **Their awareness of the protagonist**: Do they know they are being hunted? Do they remember the protagonist at all? Indifference from the target can be more maddening than hostility.

#### Accomplice in the Betrayal
Someone who played a role in the original crime, perhaps a smaller one. Design principles:
- **The burden of partial guilt**: They were complicit but perhaps not the architect. Their guilt is real but quantifiable.
- **What they''ve done with the guilt**: Buried it, fled from it, built a new life on top of it, or converted it into self-justification
- **Their potential as a tool**: The protagonist may use their guilt as leverage. Or may destroy them regardless.
- **The question of proportionate response**: Readers should be uncertain whether the protagonist''s treatment of them is just.

#### Reluctant Ally
Someone who helps the protagonist, usually against their better judgment. Design principles:
- **Their reason for helping should be self-interested or unavoidable**: Pure altruism toward a vengeance protagonist feels false.
- **They see what the protagonist is becoming**: And either accept it, fight against it, or use it.
- **They have their own wound or agenda**: Overlapping interests, not identical ones.
- **They will become a liability**: Eventually the protagonist''s obsession will cost this person something.

#### Collateral Victim
Someone who suffers not because they were guilty but because they were in the way. This is the character that tests the reader''s alliance with the protagonist most severely.
- **They must be rendered as fully human**: No one-note innocents. Give them a life, a worry, a person they love.
- **The protagonist knows what they are doing**: If they don''t register the collateral damage, the reader cannot trust them as a narrator. If they register it and proceed anyway, readers must decide what to do with that.

#### Mirror Character
Someone who suffered a similar wound but chose a different response — redemption, acceptance, or a different form of destruction. Creates the question the narrative is really asking: was the protagonist''s choice inevitable, or was it a choice?
- **Their path should be genuinely viable, not a straw man**: Make the reader understand why someone could have chosen differently.
- **Their fate should rhyme with the protagonist''s**: Not as punishment or reward, but as a comment on what different choices cost.

---

### Character Roster Recommendations

For a Vengeance Driven novel, a functional initial cast:

| Role | Count | Notes |
|------|-------|-------|
| Protagonist | 1 | The wound and the purpose |
| Primary Target(s) | 1-2 | The final confrontation |
| Accomplice(s) in Betrayal | 2-3 | Intermediate targets; varying guilt levels |
| Reluctant Ally | 1 | The human connection the protagonist maintains |
| Collateral Victim | 1-2 | Tests reader alliance; creates moral weight |
| Mirror Character | 1 | The road not taken |
| Ghost of the Past | 1 | A vision of who the protagonist was, or a person who knew them before |

Avoid: large casts of uniformly villainous characters. The moral territory requires dimension.

---

### Field Generation Guide

#### Name
For English-language Vengeance Driven fiction, character names should:
- Have weight without being operatically theatrical
- Avoid names that signal villain status before readers have met the character
- The protagonist may have a "before" name and an "after" identity — a name they abandoned or were given after the betrayal

#### Role
See the design principles above. The most important thing is that every character''s role is defined in relation to the original wound.

#### Connection to the Incident
Be specific. "Ordered the attack" is weaker than "signed the warrant with my father''s name on it." The specific nature of their connection determines the specific shape of the reckoning.

#### Core Motivation
Vengeance Driven fiction is most powerful when characters'' motivations are coherent and internally consistent, even when they are wrong or evil. Nobody is a villain in their own story.

#### Guilt and Complicity
The moral accounting. This field should create discomfort — it should be neither perfectly clear nor perfectly ambiguous. Leave room for the reader to argue about it.

#### Exploitable Weaknesses
In this genre, the protagonist will look for these. Be honest about what they are: a child, a secret, a belief, a love.

---

### Setting Interdependencies

- **Origin of Vengeance → Character Roster**: Every named perpetrator in the origin becomes a character. Every named loss potentially becomes a ghost.
- **Psychological Fracture → Protagonist Design**: The obsession profile and remaining humanity fields directly shape how the protagonist is rendered in character form.
- **Vengeance Architecture → Fate Field**: The kill order in the architecture tells you which characters will be confronted when.

### Common Errors

- **Cartoon villains**: If every target is irredeemably evil with no human dimension, the revenge satisfies completely — which removes the moral complexity that makes the genre meaningful.
- **The pure innocent**: A character who exists solely to be wronged by the protagonist, with no complexity of their own. Collateral victims must have lives.
- **The protagonist''s loss is generic**: The specific people lost must be specific people — with habits, voices, a particular way of laughing. Abstract grief produces abstract prose.
- **Every character serves the plot**: Secondary characters should feel like they have lives that continue when the protagonist isn''t watching them.
',
  '## "Character" Generation — The Vengeance Soul Novel

Every character exists in relation to the protagonist''s wound. The most powerful vengeance narratives are populated by characters with genuine depth — because moral weight depends on the humanity of what surrounds the protagonist.

---

### Key Roles

**Protagonist**: Wound visible but not performed. Competence deployed in service of destruction. Involuntary humanity that persists despite their attempts to amputate it.

**Primary Target**: Give them something human. The specific nature of their guilt and relationship to the crime over time determine the drama of confrontation.

**Accomplice**: Partial guilt. What they''ve done with that guilt. Whether their destruction feels proportionate.

**Reluctant Ally**: Self-interested reason for helping. Sees what the protagonist is becoming. Will eventually pay a cost.

**Collateral Victim**: Fully human, not a one-note innocent. Tests reader alliance most severely.

**Mirror Character**: Chose a different response to a similar wound. Makes the protagonist''s choice feel like a choice, not an inevitability.

---

### Roster Recommendation
1 Protagonist, 1-2 Primary Targets, 2-3 Accomplices, 1 Reluctant Ally, 1-2 Collateral Victims, 1 Mirror Character.

---

### Common Errors

- Cartoon villains — remove moral complexity
- Generic grief — the specific people lost must be specific people
- Every character serves the plot — secondary characters need lives of their own
',
  (SELECT id FROM novel_creation_method WHERE name = 'The Vengeance Soul Novel' LIMIT 1),
  1,
  21,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  is_active = VALUES(is_active),
  sort_order = VALUES(sort_order);
