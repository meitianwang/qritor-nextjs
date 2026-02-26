-- "Story Hook" Setting Generation — The Vengeance Soul Novel
-- Layer 3 domain knowledge skill for story hook module
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-vengeance-story-hook-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'vengeance-story-hook-setting-gen',
  '"Story Hook" setting generation: generates the core injustice hook for The Vengeance Soul Novel',
  '"Story Hook" setting generation: generates the core injustice hook for The Vengeance Soul Novel',
  '## "Story Hook" Setting Generation — The Vengeance Soul Novel

The Story Hook is the reader''s first contract with the protagonist''s wound. It must communicate one thing with absolute clarity: this injustice is so severe, so personal, so unforgivable that readers instantly understand why this person has no choice but to burn everything down. A weak story hook produces a protagonist whose revenge feels optional. A strong one makes readers complicit — hungry for the reckoning before it even begins.

---

### Field Generation Guide

#### Story Hook
The single sentence that encapsulates the wound and the promise. Structure: [Who the protagonist was] + [the specific act of destruction] + [what their existence has become].

Good examples:
- "A man who once believed in justice watches his family burned alive by the lord he served — and spends the next decade becoming something justice cannot contain."
- "She survived every torture they designed for her. Now she has come back to teach them what she learned."

Avoid abstract formulations like "A person seeks revenge after tragedy." The hook must be specific enough that a reader can picture the face, hear the scream, feel the cold resolution afterward.

#### The Wound
This is the most important field. The wound must have three properties:
1. **Specificity** — Not "his family was killed" but "his daughter''s dress was still on the clothesline when they came back to burn what was left"
2. **Irreversibility** — The thing destroyed cannot be restored. Revenge doesn''t undo it — it only fills the hole with ash
3. **Betrayal by proximity** — The most powerful wounds come from those the protagonist trusted: a mentor, a lord they served loyally, a family member, a lover

The wound should generate a single indelible image that the narrative will return to.

#### Revenge Promise
This is the protagonist''s internal oath, not necessarily spoken aloud. It should feel less like a decision and more like a biological imperative — the only thing keeping them from simply dying.

The most effective revenge promises have a specific target ("I will make him watch what I take from him") rather than a vague direction ("I will have revenge"). If the protagonist has a list, the promise should imply the list exists.

Avoid: generic warrior vows, noble-sounding proclamations, anything that sounds like a hero''s oath. This is the oath of someone who has decided to stop being a person and become a purpose.

#### Reader Bait
This field defines the emotional contract between the narrative and the reader. Vengeance fiction readers want one of three promises:
1. **Cathartic destruction** — Watch the guilty be torn apart
2. **Psychological unraveling** — Watch the enemy''s empire crumble from within, brick by brick
3. **The cost** — Watch what the protagonist sacrifices to get there, and whether they recognize what they''ve become

The best Reader Bait hints at all three. Write it as a "what you''re here to see" statement: "You are here to watch a broken man dismantle an empire. You are here to see if there is anything left of him when it''s done."

---

### Field Interdependencies

- **The Wound → Revenge Promise**: The promise must be proportional to the wound. A wound that destroyed one person produces a promise about one person. A wound that destroyed a world produces a promise that consumes a world.
- **Revenge Promise → Reader Bait**: The promise tells readers what they''re waiting for. Reader Bait tells them why they''re staying through the hard parts.
- **Story Hook ↔ The Wound**: The hook is the wound compressed to one sentence. Generate the wound first, then distill it.

### Common Errors

- **The vague wound**: "He lost everything" tells us nothing. Name what was lost. Make it breathe.
- **The noble avenger**: The protagonist''s promise sounds heroic and principled. Vengeance Driven protagonists are not heroes — they are people for whom heroism died on the same day everything else did.
- **The optional revenge**: The hook implies the protagonist *could* let it go but *chooses* not to. In this genre, there is no choice. Revenge is what they are now.
- **Too much backstory in the hook**: The hook is one sentence. Save the full betrayal for Origin of Vengeance.
',
  '## "Story Hook" Setting Generation — The Vengeance Soul Novel

The Story Hook is the reader''s first contract with the protagonist''s wound. It must communicate one thing with absolute clarity: this injustice is so severe, so personal, so unforgivable that readers instantly understand why this person has no choice but to burn everything down. A weak story hook produces a protagonist whose revenge feels optional. A strong one makes readers complicit — hungry for the reckoning before it even begins.

---

### Field Generation Guide

#### Story Hook
The single sentence that encapsulates the wound and the promise. Structure: [Who the protagonist was] + [the specific act of destruction] + [what their existence has become].

Avoid abstract formulations like "A person seeks revenge after tragedy." The hook must be specific enough that a reader can picture the face, hear the scream, feel the cold resolution afterward.

#### The Wound
Must have three properties: Specificity, Irreversibility, and Betrayal by proximity. The wound should generate a single indelible image that the narrative will return to.

#### Revenge Promise
The protagonist''s internal oath — the only thing keeping them from simply dying. Must have a specific target, not a vague direction. Avoid generic warrior vows or noble-sounding proclamations.

#### Reader Bait
The emotional contract with the reader: cathartic destruction, psychological unraveling, or the cost. The best Reader Bait hints at all three.

---

### Common Errors

- The vague wound — "He lost everything" tells us nothing. Name what was lost.
- The noble avenger — Revenge Driven protagonists are not heroes.
- The optional revenge — In this genre, there is no choice. Revenge is what they are now.
',
  (SELECT id FROM novel_creation_method WHERE name = 'The Vengeance Soul Novel' LIMIT 1),
  1,
  10,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  is_active = VALUES(is_active),
  sort_order = VALUES(sort_order);
