-- "Psychological Fracture" Setting Generation — The Vengeance Soul Novel
-- Layer 3 domain knowledge skill for psychological fracture module
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-vengeance-psychological-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'vengeance-psychological-setting-gen',
  '"Psychological Fracture" setting generation: generates the trauma-warped psychology for The Vengeance Soul Novel',
  '"Psychological Fracture" setting generation: generates the trauma-warped psychology for The Vengeance Soul Novel',
  '## "Psychological Fracture" Setting Generation — The Vengeance Soul Novel

The Psychological Fracture is what separates Vengeance Driven fiction from simple revenge thrillers. In a revenge thriller, the protagonist has a goal. In Vengeance Driven fiction, the protagonist IS the goal — or rather, what''s left of them. This module captures the precise shape of the damage: how the trauma restructured the protagonist''s interior world, what their obsession feels like from the inside, and the small, terrible remnants of who they used to be.

Readers should finish this module with a troubling understanding: they are watching someone who was destroyed. The revenge is not redemption. It is what destruction looks like when it gets up and walks.

---

### Field Generation Guide

#### Pre-Trauma Self
This field exists to create a before-and-after contrast that amplifies the horror of what was lost. The pre-trauma self should be:
- Recognizably human and sympathetic: someone readers would have liked
- Specific rather than generically virtuous: a father who sang badly at dinner, a loyal soldier who believed in the institution, a young woman who was just beginning to hope
- Closely tied to what was destroyed: their defining characteristic should be exactly what was targeted

The pre-trauma self should feel like a ghost haunting the current protagonist. Readers glimpse it in involuntary moments — a reflex of kindness quickly suppressed, a pause before a cruelty they once couldn''t have imagined.

#### Breaking Mechanism
How did the trauma actually break them? This is not the event itself (that''s in Origin of Vengeance) but the psychological process:
- **Incremental erosion**: Each day of imprisonment/torture took one more thing. They didn''t break all at once — they watched themselves break, piece by piece.
- **Sudden catastrophic failure**: There was a moment when something fundamental snapped. After that moment, they were different. They could feel the difference.
- **The weaponization of grief**: The grief didn''t disappear — it transformed. The love they felt for what was lost became the fuel for destruction.
- **The death of the self**: They decided, consciously or not, that who they were before must die in order to do what must be done.

#### Obsession Profile
The obsession profile determines the narrative''s tone and pacing:

- **Ice-Cold Patience — Waits Years, Plans in Silence**: Creates a strategic, methodical story. The protagonist is functional in daily life. Readers see the gulf between their surface normalcy and the roiling purpose underneath. High tension in quiet scenes.
- **Burning Fever — Can Think of Nothing Else**: Creates a driven, relentless narrative. The protagonist makes mistakes born of obsession. Their single-mindedness is simultaneously their greatest strength and their most dangerous vulnerability.
- **Dual Existence — Functions Normally Until Triggered**: Creates unpredictability. The protagonist has constructed a seemingly normal life as camouflage or cope — until something breaks through the walls. Trauma triggers become plot devices.
- **Dissociation — Watches Themselves Become a Monster**: Creates psychological horror. The protagonist narrates their own transformation with clinical detachment. They see what they''re becoming and cannot stop. May address the reader directly.
- **Righteous Fury — Believes They ARE Justice Itself**: Creates moral horror. The protagonist has reframed their revenge as righteous punishment. They are not broken — they are *correcting* an imbalance. This is the most chilling variant.
- **Hollow Shell — Emotion Replaced by Pure Function**: Creates existential dread. The protagonist no longer feels the revenge as a goal. They are simply executing a program. Whether they even want to finish becomes a question.

#### Remaining Humanity
This is the most important field for reader investment. Without remaining humanity, the protagonist is a shark — frightening but not engaging. The remnants should be:
- **Small and involuntary**: A flash of something when they see a child, an instinctive protectiveness they haven''t yet strangled
- **Painful**: Each remnant reminds them of who they were and what they lost
- **Potentially dangerous to the mission**: The remaining humanity is what enemies will try to exploit, and what the protagonist tries to amputate

Common effective remnants: the ability to love a single person, an involuntary kindness toward the powerless, a code against targeting children, the one memory they cannot weaponize.

#### Trauma Triggers
Triggers are scene-creation tools. List 3-5 specific sensory triggers:
- A smell (specific: "the specific kind of cheap wine he was drinking that night")
- A sound (a particular tone of voice, a type of cry)
- A visual detail (a color, a type of light, a physical resemblance)
- A physical sensation (a particular kind of touch, a temperature)

Triggers should be common enough to appear naturally in scenes, but specific enough to feel authentic rather than cliché.

#### Dark Satisfaction
This is the disturbing centerpiece of Vengeance Driven fiction. What does revenge actually feel like for this protagonist? Be specific and honest about the pathology:
- **It doesn''t feel like justice** — it feels like a drug, like filling a hole with something that won''t stay
- **It feels like power** — the first real power they''ve had since everything was taken
- **It feels like communion with the dead** — like they are acting on behalf of someone who can no longer act
- **It feels like nothing** — and that emptiness is the most terrifying thing of all

The dark satisfaction should disturb readers even as they crave it alongside the protagonist. This is the moral complexity that elevates the genre.

#### Cost of Obsession
What does the protagonist pay daily to keep the fire burning? This creates texture and humanity:
- Physical costs: the sleep they don''t get, the food they forget to eat, the body they''ve turned into a tool
- Social costs: the relationships they''ve ended, the connections they maintain only as instruments
- Psychological costs: the parts of themselves they''ve had to kill to stay functional
- Ethical costs: the compromises that once would have been impossible

---

### Field Interdependencies

- **Pre-Trauma Self ↔ Remaining Humanity**: The remnants are fragments of the pre-trauma self. They should echo each other.
- **Breaking Mechanism → Obsession Profile**: How they broke determines how they obsess. Incremental erosion → Ice-Cold Patience. Sudden catastrophic failure → Burning Fever or Righteous Fury.
- **Trauma Triggers → Dark Satisfaction**: The triggers drag them back; the dark satisfaction is what they feel when they move toward the target instead of away.
- **Cost of Obsession → The Vengeance Architecture**: The costs should escalate as the revenge plan advances.

### Common Errors

- **The healthy avenger**: The protagonist processes their trauma in reasonable ways and pursues revenge from a position of psychological stability. This is not the genre. The fracture must be real and visible.
- **The generic tortured soul**: Every dark hero has "demons." This module should specify exactly which demons, in exactly what form.
- **No remaining humanity**: Readers need something to hold onto. Without it, they''re watching a monster, not a person.
- **Dark satisfaction that feels heroic**: If the revenge feels cleanly satisfying — like justice delivered — the moral complexity is gone. The satisfaction should be tainted, morbid, or hollow.
',
  '## "Psychological Fracture" Setting Generation — The Vengeance Soul Novel

The Psychological Fracture captures the precise shape of the damage: how the trauma restructured the protagonist''s interior world. Readers should understand they are watching someone who was destroyed — the revenge is not redemption, it is what destruction looks like when it gets up and walks.

---

### Key Fields

#### Pre-Trauma Self
Create a specific, sympathetic before-and-after contrast. The pre-trauma self should feel like a ghost haunting the current protagonist.

#### Breaking Mechanism
Not the event itself but the psychological process: incremental erosion, sudden catastrophic failure, weaponization of grief, or the conscious death of the self.

#### Obsession Profile
Determines narrative tone: Ice-Cold Patience (strategic), Burning Fever (relentless), Dual Existence (unpredictable), Dissociation (psychological horror), Righteous Fury (moral horror), Hollow Shell (existential dread).

#### Remaining Humanity
Small, involuntary, painful, potentially dangerous to the mission. Without this, there is no reader investment.

#### Dark Satisfaction
What revenge actually feels like — a drug, power, communion with the dead, or nothing. Should disturb readers even as they crave it alongside the protagonist.

---

### Common Errors

- The healthy avenger — the fracture must be real and visible
- Generic tortured soul — specify exactly which demons in exactly what form
- No remaining humanity — readers need something to hold onto
- Dark satisfaction that feels heroic — it should be tainted, morbid, or hollow
',
  (SELECT id FROM novel_creation_method WHERE name = 'The Vengeance Soul Novel' LIMIT 1),
  1,
  12,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  is_active = VALUES(is_active),
  sort_order = VALUES(sort_order);
