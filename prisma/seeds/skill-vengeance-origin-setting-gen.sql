-- "Origin of Vengeance" Setting Generation — The Vengeance Soul Novel
-- Layer 3 domain knowledge skill for origin module
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-vengeance-origin-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'vengeance-origin-setting-gen',
  '"Origin of Vengeance" setting generation: generates the catastrophic founding trauma for The Vengeance Soul Novel',
  '"Origin of Vengeance" setting generation: generates the catastrophic founding trauma for The Vengeance Soul Novel',
  '## "Origin of Vengeance" Setting Generation — The Vengeance Soul Novel

The Origin of Vengeance is the engine of everything. It is not backstory — it is the event that ended one story and began another. Every scene in the novel traces back to it. It must be rendered with enough specificity and weight that readers understand, viscerally, why the protagonist cannot recover. The origin is not just what happened. It is the particular way it happened that made it unforgivable.

---

### Field Generation Guide

#### Incident Type
The incident type shapes the emotional register of the entire novel. Each type carries different genre implications:

- **Family Slaughtered**: The protagonist''s most primal bond destroyed. Works well when the protagonist was a protector figure — the injustice is magnified by their failure to stop it.
- **Lover Betrayed and Killed**: Intimate betrayal. The protagonist loved the person who became the instrument of destruction. Adds layers of grief, anger at themselves, and a particular kind of self-hatred.
- **Falsely Accused and Imprisoned**: The protagonist loses years of their life, watches their world collapse from behind bars, and emerges to find nothing left. The rage has had time to crystallize into something cold and surgical.
- **Mentor''s Betrayal**: The person who shaped the protagonist, who they idolized, turns out to be the architect of their suffering. This is the deepest wound to identity — not just what was taken, but who they thought they were.
- **Tortured and Left for Dead**: Physical trauma with psychological aftershocks. The protagonist carries the scars as a daily reminder. Their body itself is evidence.
- **Everything Stripped Away**: Systematic destruction — wealth, name, relationships, future, all methodically removed. Implies an enemy who was thorough. The coldness of the calculation adds to the horror.
- **Witnessed Atrocity, Powerless to Stop It**: The protagonist was there. They saw it happen. They couldn''t save anyone. The guilt braids itself into the rage.

#### The Perpetrators
The perpetrators'' relationship to the protagonist is as important as what they did. The closer the relationship, the more devastated the wound:

- **Trusted superior / lord / mentor**: "I gave them everything. They used it to destroy me."
- **Friend or comrade**: The betrayal of mutual loyalty. Implies the protagonist was used throughout the relationship.
- **Family member**: The most intimate possible betrayal. Creates deep ambivalence.
- **Institution or system**: Impersonal betrayal — harder to focus hate on a face. Creates a protagonist who must take down something larger than individuals.
- **Someone they saved / protected**: The protagonist paid a price to protect them. They used that debt as a weapon.

Name the perpetrators specifically. Give them titles, relationships, motivations. The protagonist''s list should have names, not types.

#### The Darkest Moment
This is the one image that will haunt the entire novel. When the protagonist closes their eyes, this is what they see. It should be:
- **Visually specific**: A single frozen image, not a sequence
- **A symbol of what was taken**: Not just the violence, but the specific thing the violence destroyed
- **Personal to the protagonist**: The detail that makes it personal, not generic

Example (poor): "He watched his family die."
Example (strong): "The last thing he saw before they blindfolded him was his daughter''s name carved into the wall of the cell — she had been alive long enough to do that."

#### What Was Taken
Be comprehensive and specific. The list should include both tangible and intangible losses:
- People (family, lover, mentor, friends)
- Identity and social position
- Beliefs (in justice, in loyalty, in human decency)
- Future (the life they were building, the children they would have had)
- Innocence (the version of themselves that existed before)

The most effective "What Was Taken" lists make readers feel the full weight of the accounting. By the end, it should be clear that revenge cannot restore any of it — and the protagonist knows this.

#### What Survived
This is the paradox that drives the story. What keeps the protagonist alive should be something dark and narrow:
- Pure distilled hatred
- A list of names
- The memory of a face they loved, now used as fuel
- A promise made to someone who died
- The need to make the perpetrators understand what they created

Avoid: hope, love, inner goodness. In Vengeance Driven fiction, what survives is the wound itself — now weaponized.

#### The Oath
The oath formalizes the transformation. The protagonist ceases to be who they were and becomes the instrument of vengeance. The oath should:
- Be spoken to no one, or to the dead
- Be specific ("I will make them beg" rather than "I will have revenge")
- Mark a clear before/after: before the oath, the protagonist might have survived. After, survival is only in service of the oath.
- Feel irrevocable — like something that cannot be unsaid

---

### Field Interdependencies

- **Incident Type → The Darkest Moment**: The incident type determines what kind of image will anchor the trauma.
- **The Perpetrators → Vengeance Architecture**: The origin defines the target list. Every perpetrator at origin level must appear in the revenge plan.
- **What Was Taken → Psychological Fracture**: The specific losses map to the specific breaks in the protagonist''s psychology.
- **What Survived → The Oath**: The oath grows directly from what survived — it is the weaponization of the one thing left.

### Common Errors

- **The vague origin**: "Terrible things happened to them." Name the terrible things. Render them.
- **Easily forgettable perpetrators**: If readers don''t remember who did what and why it was unforgivable, the revenge cannot satisfy. Make the perpetrators'' faces memorable.
- **The protagonist had no warning**: The most devastating betrayals involve retrospective dread — the protagonist realizes the friendship or loyalty was always calculated. Build in signals the protagonist missed.
- **What Survived is virtuous**: If what survives is "hope" or "love for humanity," this is not Vengeance Driven fiction. What survives should disturb the reader a little.
- **The Darkest Moment is generic**: "They killed everyone he loved" is not a specific darkest moment. Find the particular detail that makes this horror unique.
',
  '## "Origin of Vengeance" Setting Generation — The Vengeance Soul Novel

The Origin of Vengeance is the engine of everything — the event that ended one story and began another. It must be rendered with enough specificity and weight that readers understand why the protagonist cannot recover.

---

### Field Generation Guide

#### Incident Type
Each type carries different implications: Family Slaughtered (primal bond), Lover Betrayed (intimate betrayal), Falsely Accused (cold crystallized rage), Mentor''s Betrayal (identity wound), Tortured and Left for Dead (physical scars as evidence), Everything Stripped Away (systematic calculation), Witnessed Atrocity (guilt braided with rage).

#### The Perpetrators
The relationship matters as much as the act. Name them specifically — the protagonist''s list should have names, not types.

#### The Darkest Moment
The one image that haunts the entire novel. Visually specific, symbolic, personal. Not a sequence — a frozen image.

#### What Was Taken
Comprehensive: people, identity, beliefs, future, innocence. The list should make readers feel the full weight.

#### What Survived
Something dark and narrow: pure hatred, a list of names, a promise to the dead. NOT hope or inner goodness.

#### The Oath
Specific, irrevocable, spoken to no one or to the dead. Marks a clear transformation: after this, there is only the purpose.

---

### Common Errors

- Vague origin — name the terrible things, render them
- Forgettable perpetrators — make their faces and their betrayal memorable
- Virtuous survival — what survives should disturb the reader slightly
',
  (SELECT id FROM novel_creation_method WHERE name = 'The Vengeance Soul Novel' LIMIT 1),
  1,
  11,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  is_active = VALUES(is_active),
  sort_order = VALUES(sort_order);
