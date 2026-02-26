-- "Plot Design" Domain Knowledge — The Vengeance Soul Novel
-- Layer 3 domain knowledge skill for plot design
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-vengeance-plot-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'vengeance-plot-gen',
  '"Plot Design" domain knowledge: provides revenge narrative structure and story design guidance for The Vengeance Soul Novel',
  '"Plot Design" domain knowledge: provides revenge narrative structure and story design guidance for The Vengeance Soul Novel',
  '## "Plot Design" Domain Knowledge — The Vengeance Soul Novel

Vengeance Driven fiction has a distinctive narrative architecture shaped by its central engine: the protagonist has a list, and the list gets shorter. But the best revenge narratives are not mechanical checklists of destruction — they use the structure of vengeance to ask a more dangerous question: what does it cost to become the thing you need to be to do this? This question should be woven into every act.

---

### Typical Story Structure

| Phase | Chapter Range (est.) | Core Function |
|-------|----------------------|---------------|
| **I. The World Before** | Ch. 1-3 | Establish who the protagonist was — make readers love what is about to be destroyed |
| **II. The Wound** | Ch. 3-6 | The betrayal or torture. Render it without mercy. This is the engine. |
| **III. The Transformation** | Ch. 6-12 | The protagonist becomes what they need to be. Shows the cost of this transformation. |
| **IV. The Hunt Begins** | Ch. 12-25 | First movements. Establishing the target list. Early victories that feel insufficient. |
| **V. Escalating Reckoning** | Ch. 25-50 | Methodical destruction of intermediate targets. Each one costs more than the last. |
| **VI. The Complication** | Ch. 50-60 | Something disrupts the plan: unexpected humanity found in a target, a second betrayal, a collateral casualty that crosses a line, the protagonist''s remaining humanity becomes a liability |
| **VII. The Price** | Ch. 60-70 | The protagonist pays the largest single cost — something or someone they cannot get back |
| **VIII. The Final Reckoning** | Ch. 70-80 | Confrontation with the primary target(s). The culmination. |
| **IX. The Aftermath** | Ch. 80-85 | What remains. What the victory costs. The void, or the unexpected. |

Note: The World Before and The Wound can be handled in flashback if the narrative opens mid-revenge. This creates a different dynamic — readers know the protagonist is already broken before they understand why — which has its own power.

---

### Story Line Patterns

#### Primary Story Line: The Reckoning
The forward momentum: target identified → approach → strike → consequence → next target. Each iteration should differ in:
- The nature of the approach (infiltration, manipulation, direct confrontation)
- The nature of the strike (physical, psychological, social, exposure)
- The emotional weight for the protagonist (increasing cost, diminishing satisfaction, or dark acceleration)

#### Common Secondary Story Lines

**The Ghost**: A relationship with someone from the protagonist''s past who knew the person they used to be. This relationship is the conscience of the narrative — the mirror that shows readers what is being lost.

**The Unexpected Complication**: A target who turns out to be more human than expected, or a complication that forces the protagonist to choose between the mission and something they thought they didn''t care about.

**The Second Betrayal**: Someone the protagonist trusted during the revenge plot turns out to have their own agenda. This subline echoes the original wound and tests whether the protagonist has learned anything — or whether they are simply incapable of recognizing betrayal until it happens.

**The Growing Cost**: A subplot tracking what the protagonist''s obsession is doing to them, visible in small moments: a reflex they used to have that no longer fires, a person they once could have talked to who they now cannot reach, the slow disappearance of the person underneath the purpose.

---

### Event Construction Patterns

#### The Opening
Three viable opening gambits:

1. **In medias res — the protagonist mid-hunt**: Readers are thrown into a protagonist already transformed. The wound is revealed in flashback or fragments. Creates immediate tension and mystery: who did this to them?

2. **Before the fall — the protagonist before the betrayal**: Readers experience the loss in real time. More emotionally devastating but requires patience. The destruction of the opening world is the price of entry.

3. **The moment of transformation — the oath or the decision**: Opens at the pivot: the protagonist in the immediate aftermath of the wound, making the choice. Compressed, intense, declares the genre immediately.

#### Key Scene Types Per Phase

**The Wound Phase:**
- The betrayal scene: must be rendered completely. No fade to black. Readers must feel it.
- The survival scene: how did the protagonist survive what should have killed them? This is often where the protagonist''s transformation begins.
- The oath scene: the moment of decision. This is the most important scene in the novel.

**The Transformation Phase:**
- The first step: the first act the protagonist takes in pursuit of the mission, which they would not have been capable of before
- The first cost: the first thing they sacrifice that was not part of the original plan
- The first glimpse of the void: a moment where they see what they are becoming, and choose to continue

**Escalating Reckoning Phase:**
- The intermediate confrontation: destroying a lesser perpetrator. Note: this should not be cathartic. It should feel insufficient.
- The leverage scene: the protagonist discovering and using an enemy''s weakness. This is often the reader''s first sight of the protagonist''s intelligence and patience as weapons.
- The cost scene: something goes wrong or the protagonist pays an unexpected price. Usually involves a third party.

**The Complication Phase:**
- The unexpected humanity scene: the protagonist encounters a target as a person, not just a name on a list. Must be handled carefully — the humanity must be genuine but cannot undo the guilt.
- The choice scene: the protagonist must choose between the mission and something they care about (that they thought they no longer cared about).

**The Final Reckoning Phase:**
- The confrontation scene: must pay off every promise made to readers. The target must know why this is happening. The protagonist must get to say — or enact — what they came to say.
- The aftermath scene: what is left. This scene determines the novel''s ultimate moral position.

---

### Foreshadowing Strategy

| Foreshadowing Type | Plant | Payoff | Notes |
|-------------------|-------|--------|-------|
| The surviving humanity | Early — a reflex of care the protagonist tries to suppress | Late — that reflex saves someone or costs the protagonist the mission | The reader should notice the plant the second time |
| The second betrayal | Mid — a small inconsistency in an ally''s behavior | Late — the ally''s true agenda is revealed | Plant should be visible in retrospect but not obvious in moment |
| The final cost | Early — the one thing the protagonist cannot sacrifice, stated or implied | Late — they are forced to sacrifice it | The reader dreads it long before it happens |
| The hollow victory | The protagonist imagines victory as a specific feeling | Late — they achieve victory and the feeling is not what they imagined | The gap is the ending |
| The voice of the dead | Early — a memory or imagined conversation with someone they lost | Late — the same memory or voice, but the protagonist hears it differently | Character growth visible only in retrospect |

---

### Common Errors

- **The reckoning always satisfies**: Every target destroyed gives the protagonist clean catharsis. This is wish fulfillment, not the genre. Satisfaction should be tainted, insufficient, or frighteningly intense.
- **The protagonist never pays**: The revenge is achieved without meaningful cost to the protagonist. This undermines the genre''s central promise: that obsession has a price.
- **The final confrontation is physical only**: The primary target is simply killed. The Vengeance Driven genre requires that the primary target understand what is happening and why — the confrontation must include the reckoning of meaning, not only the reckoning of violence.
- **The aftermath is resolution**: The protagonist achieves revenge and is healed. This is almost never emotionally honest in this genre. The aftermath should leave questions open — is this peace or emptiness? Did it matter? Is there anything left of them?
- **The secondary story lines disappear**: The Ghost subplot fades after Phase III. The second betrayal is abandoned. These threads must be maintained and paid off.
',
  '## "Plot Design" Domain Knowledge — The Vengeance Soul Novel

Vengeance Driven fiction uses the structure of the hunt to ask a more dangerous question: what does it cost to become the thing you need to be?

---

### Typical Structure

I. The World Before (make readers love what will be destroyed) → II. The Wound (the engine, render without mercy) → III. The Transformation (the cost of becoming) → IV. The Hunt Begins → V. Escalating Reckoning (each target costs more) → VI. The Complication (unexpected humanity, second betrayal, or the line crossed) → VII. The Price (the largest single cost) → VIII. The Final Reckoning → IX. The Aftermath (the void, or the unexpected).

---

### Key Story Lines

**Primary**: Target → approach → strike → consequence → next target. Each iteration should cost more and satisfy less.

**The Ghost**: A relationship with the protagonist''s former self. The narrative''s conscience.

**The Second Betrayal**: Echoes the original wound. Tests whether the protagonist has learned anything.

**The Growing Cost**: Tracking what the obsession is doing to them in small moments.

---

### Critical Scene Types

- The oath scene — the most important scene in the novel
- The intermediate confrontation — should feel insufficient, not cathartic
- The unexpected humanity scene — target as person, not name on list
- The final confrontation — target must know why; meaning and violence both
- The aftermath scene — determines the novel''s moral position

---

### Common Errors

- The reckoning always satisfies — should be tainted, insufficient, or disturbingly intense
- The protagonist never pays — obsession must have a cost
- Final confrontation is physical only — target must understand what is happening
- The aftermath is resolution — almost never emotionally honest in this genre
',
  (SELECT id FROM novel_creation_method WHERE name = 'The Vengeance Soul Novel' LIMIT 1),
  1,
  30,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  is_active = VALUES(is_active),
  sort_order = VALUES(sort_order);
