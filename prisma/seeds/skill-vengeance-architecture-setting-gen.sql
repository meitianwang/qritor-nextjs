-- "Vengeance Architecture" Setting Generation — The Vengeance Soul Novel
-- Layer 3 domain knowledge skill for vengeance architecture module
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-vengeance-architecture-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'vengeance-architecture-setting-gen',
  '"Vengeance Architecture" setting generation: generates the revenge plan structure for The Vengeance Soul Novel',
  '"Vengeance Architecture" setting generation: generates the revenge plan structure for The Vengeance Soul Novel',
  '## "Vengeance Architecture" Setting Generation — The Vengeance Soul Novel

The Vengeance Architecture is the skeleton of the plot. It defines who will be destroyed, in what order, by what means, and at what cost. Unlike a traditional plot outline, the Architecture is not about events — it is about the protagonist''s internal logic: the structure of their obsession, the shape of what they consider complete, and the void waiting on the other side.

Good Vengeance Architecture creates escalating dramatic tension: each completed objective should cost more than the last, and the approaching finish line should feel increasingly ominous rather than triumphant.

---

### Field Generation Guide

#### Primary Targets
The ultimate objects of revenge. This is not a list of everyone who wronged the protagonist — it is the distillation: the one or two figures whose destruction represents the completion of the oath. Consider:
- The mastermind vs. the instrument: Who designed the protagonist''s suffering? Who carried it out? Both may be targets, but destroying the instrument first when the mastermind is still untouched creates a specific kind of frustration.
- The target''s current relationship to what happened: Do they regret it? Have they prospered from it? Do they even remember the protagonist exists? Each answer creates different dramatic possibilities.
- What destroying them means symbolically: Not just their death or ruin, but what it represents — the completion of the account, the acknowledgment that what happened was real.

#### Revenge Scale
The scale shapes the novel''s scope and its moral territory:

- **Personal — One Face in the Crowd**: Intimate, claustrophobic. The protagonist and their target are locked in a private war the world doesn''t know about. Creates intense psychological focus.
- **Organizational — Tear Down an Institution**: The protagonist must dismantle a structure, not just kill individuals. Requires strategy, patience, infiltration. Satisfying because institutions are complicit in a way individuals can deny.
- **Systemic — Burn an Entire Social Order**: The protagonist''s target is the corruption itself — the aristocracy, the church, the government. Spectacular but risks making revenge feel abstract. Best used when the protagonist is also willing to burn themselves.
- **Dynastic — Erase a Bloodline**: Inherited guilt. The protagonist extends their revenge to those who benefited from the crime, even if they didn''t commit it. Creates profound moral complexity.
- **Cosmic — Even the Gods Will Answer**: The protagonist''s rage exceeds human scale. For fantasy settings where the divine or supernatural was complicit in the original injustice.

#### Kill Order
The sequence has narrative logic. The kill order should follow one of these patterns — or deliberately subvert one:
- **Ascending order of guilt**: The protagonist destroys lesser accomplices first, gaining resources, information, and confidence before the final confrontation.
- **Ascending order of protection**: Strategically stripping the primary target''s defenses before the final strike. Each eliminated target is a removed shield.
- **Emotional order**: Saving the most personal target for last, or confronting the most painful one first to get it over with.
- **Logistical order**: The protagonist must take what they can get, when they can get it — the order is driven by opportunity as much as preference.

Note which targets will try to run, which will negotiate, which will fight back, and which will simply break.

#### Methods Preferred
The method reveals character:
- **Psychological Destruction — Break the Mind Before the Body**: The protagonist wants their target to understand what they''re losing before they lose it. Requires proximity and patience. The most intimate method.
- **Physical Elimination — Direct and Brutal**: Clean, efficient, and sometimes disturbingly unsatisfying. The protagonist may find they feel less than they expected.
- **Social Ruin — Strip Away Everything They Value**: The protagonist attacks what the target loves: reputation, wealth, family, legacy. Slow, methodical, devastating.
- **Orchestrated Betrayal — Use Their Own People Against Them**: The protagonist lets the target''s allies destroy them. Requires the protagonist to be a skilled manipulator. Has poetic resonance when betrayal was the original weapon used against them.
- **Public Humiliation Then Death**: The protagonist needs witnesses. The target must be seen to fall. Best when the original crime involved public shame or false accusation.
- **Slow Suffering — They Will Beg for the End**: The protagonist is not interested in mercy or efficiency. Morally the most challenging method to render without losing the reader.

#### Acceptable Collateral
This field defines the protagonist''s moral floor — or reveals they have none. The most interesting versions:
- The protagonist draws one line they won''t cross (children, the innocent, former lovers) — and the plot will test exactly that line
- The protagonist once had a line and has since crossed it, without fully registering they did
- The protagonist has no floor. This must be handled with great care — readers need another reason to stay invested

#### The Final Vision
What does "finished" look like? This field is as important as the plan itself. The protagonist''s fantasy of completion tells us everything about what they''ve become:
- Do they imagine themselves alive or dead when it''s over?
- Do they imagine anyone witnessing it, or is the satisfaction entirely private?
- Does the fantasy include anything beyond the last target''s destruction — a grave they visit, a confession they make, a child they finally let themselves think about?
- Is the fantasy achievable, or has their hatred grown beyond the original wound to encompass things revenge cannot reach?

#### After the Reckoning
This is the question the protagonist refuses to think about. What happens when the list is complete? Options:
- They have no plan. They didn''t expect to survive.
- They imagine a peace they no longer believe in.
- The void. They know that finishing will not fill the emptiness — and they are doing it anyway.
- The list grows. Every act of revenge reveals new complicity, new betrayal.

---

### Field Interdependencies

- **Origin of Vengeance → Primary Targets**: The targets emerge directly from the origin. Every named perpetrator should appear somewhere in the architecture.
- **Kill Order → Psychological Fracture**: The obsession profile shapes the kill order. Ice-Cold Patience plans the perfect order. Burning Fever might strike out of sequence.
- **Methods Preferred → Writing Style**: The choice of method determines the kind of scenes the novel will require. Psychological destruction requires extended proximity scenes; physical elimination requires confrontation choreography.
- **Acceptable Collateral ↔ Remaining Humanity**: What the protagonist will and won''t sacrifice maps directly to their remaining humanity.
- **The Final Vision → Narrative ending**: The final vision is the promise that the ending must address, fulfill, or subvert.

### Common Errors

- **The revenge that feels like justice**: If every target is a cartoon villain with no redemptive dimension, the revenge produces comfortable satisfaction rather than the complex morbid pleasure the genre requires. Give targets dimension.
- **The protagonist always wins cleanly**: Vengeance Driven fiction requires the protagonist to pay. Each victory should cost something that cannot be recovered.
- **The final vision is noble**: "When it''s over, I will be at peace." This is not the genre. The final vision should be haunted, hollow, or frightening in its simplicity.
- **No After the Reckoning**: If the protagonist has never considered what comes after, they are a plot device, not a person. Even if they refuse to answer the question, they must have considered it.
',
  '## "Vengeance Architecture" Setting Generation — The Vengeance Soul Novel

The Vengeance Architecture is the skeleton of the plot — not events, but the protagonist''s internal logic: who will be destroyed, in what order, at what cost, and what void waits on the other side.

---

### Key Fields

#### Primary Targets
The mastermind vs. the instrument. What destroying them means symbolically — the completion of the account.

#### Revenge Scale
Personal (claustrophobic), Organizational (dismantle a structure), Systemic (burn social order), Dynastic (erase a bloodline), Cosmic (exceed human scale).

#### Kill Order
Follows narrative logic: ascending guilt, ascending protection, emotional order, or logistical opportunity. Each target has a different response: flee, negotiate, fight, break.

#### Methods Preferred
The method reveals character: Psychological Destruction (most intimate), Physical Elimination (potentially unsatisfying), Social Ruin (slow and devastating), Orchestrated Betrayal (poetic resonance), Public Humiliation (needs witnesses), Slow Suffering (most morally challenging).

#### Acceptable Collateral
The protagonist''s moral floor — or the absence of one. Plot must test exactly the line they draw.

#### The Final Vision
The fantasy of completion. Do they imagine surviving? Does it include anything beyond the last kill? Is it achievable?

#### After the Reckoning
The question they refuse to think about: no plan, imagined peace, the void, or the growing list.

---

### Common Errors

- Revenge that feels like justice — give targets dimension
- Protagonist always wins cleanly — each victory must cost something
- The noble final vision — it should be haunted, hollow, or frightening
',
  (SELECT id FROM novel_creation_method WHERE name = 'The Vengeance Soul Novel' LIMIT 1),
  1,
  13,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  is_active = VALUES(is_active),
  sort_order = VALUES(sort_order);
