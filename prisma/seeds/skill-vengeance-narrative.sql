-- Vengeance Driven Narrative Writing — The Vengeance Soul Novel
-- Layer 3 domain knowledge skill for narrative/prose writing
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-vengeance-narrative.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'vengeance-narrative',
  'Narrative writing guidance for The Vengeance Soul Novel: how to write the wound, the obsession, and the reckoning on the page',
  'Narrative writing guidance for The Vengeance Soul Novel: how to write the wound, the obsession, and the reckoning on the page',
  '## Vengeance Driven Narrative Writing — The Vengeance Soul Novel

This skill focuses exclusively on the craft of writing vengeance fiction on the page — not what to include (see other setting skills), but how to write it. The specific techniques for rendering a fractured psychology, the prose strategies that make readers feel complicit, and the scene-writing approaches that carry the genre''s particular emotional weight.

---

### I. Language Style

**The Register of Controlled Damage**

The prose voice in Vengeance Driven fiction should sound like someone who has learned to be very, very careful about what they let themselves feel in public. The narrator is not numb — they are controlled. The control is what tells you how much is beneath it.

Practical principles:
- **Short declarative sentences for high-emotion moments**: When the protagonist is closest to the wound, the prose strips down. "He had kept his daughter''s name on his lips for five years. He said it now, to no one. Then he went inside."
- **Sensory specificity over emotional abstraction**: Don''t tell readers the protagonist is in pain. Give them the exact thing they smell or see or feel that carries the pain. "The wool of his old coat. The particular way it smelled. He burned it that night."
- **Active verbs, sparse adjectives**: The protagonist moves through the world purposefully. The prose should reflect that. Verbs do the work. Adjectives are used deliberately, not decoratively.
- **Emotional restraint as revelation**: What the protagonist does NOT say or feel is as important as what they do. The flat affect that appears where anguish should be tells readers more than anguish would.

---

### II. Core Scene Writing Techniques

#### 2.1 The Wound Scene
The betrayal or torture that created the protagonist. This is the most important scene in the novel.

Do:
- Stay close to the protagonist''s immediate sensory experience, not the overview
- Use fragmentation if the trauma interrupts coherent memory: "He remembered the window. Not what happened at the window. The light through it, and then nothing."
- Include one specific detail that will become a recurring image — the detail the protagonist''s memory keeps returning to
- Don''t cut away. Don''t fade to black. Readers must experience the full weight, or the revenge has no anchor.

Don''t:
- Load it with narrative editorializing ("this would change him forever")
- Make it operatically dramatic. The worst things often happen quietly.
- Give the perpetrators mustache-twirling dialogue. Their casual disregard is more disturbing than theatrical villainy.

Example (poor): *As the flames consumed everything he loved, he knew his life would never be the same. "You should have stayed out of our business," the lord said with a cruel smile.*

Example (stronger): *The fire sounded like paper. He had not known that. He had a child''s understanding of fire — loud, dramatic, monstrous. This was quiet. His daughter had called his name twice. Then she hadn''t.*

#### 2.2 The Transformation Scene
The moment or sequence where the protagonist becomes what they need to be.

Do:
- Show the transformation through action, not declaration
- Include a moment where the protagonist does something they would not have done before — and note the absence of the revulsion they expected
- Use the physical body to track psychological change: what they eat, how they sleep, what they no longer notice

Don''t:
- Have the protagonist deliver a speech about who they now are
- Mark the transformation with dramatic visual signifiers (new outfit, dramatic haircut alone) without internal counterpart

#### 2.3 The Dark Satisfaction Scene
When the protagonist achieves a piece of the revenge. The genre''s most technically demanding scene type.

Do:
- Make the satisfaction specific, physical, and troubling: "It was not relief. It was closer to the feeling of setting down something very heavy, and then realizing the weight was gone and you had been carrying it so long you had forgotten what your hands felt like without it."
- Follow it immediately with the insufficiency: the satisfaction peaks and then drops. The account is not closed. The wound is not healed.
- Show what the protagonist notices in themselves during the satisfaction — and whether they can recognize that it is pathological

Don''t:
- Make it a triumphant victory scene. Clean catharsis is a different genre.
- Moralize about it in the narrative. Let the reader sit with the discomfort.
- Make the satisfaction too brief — readers waited for this. Honor the moment, even in its darkness.

#### 2.4 The Trauma Flashback
When the wound intrudes on the present narrative.

Do:
- Trigger the flashback with a specific sensory detail established in the wound scene
- Use present tense within the flashback to create immediacy, then return to past tense for the present timeline
- Make the flashback fragmentary — trauma does not replay as coherent narrative
- Show how the protagonist manages the flashback: suppresses it, uses it as fuel, or loses control of it

Don''t:
- Use the flashback as a dump for exposition that wasn''t established in the wound scene
- Make flashbacks too long — they are intrusions, not chapters
- Have the protagonist simply "remember" neutrally. The flashback should cost them something.

#### 2.5 The Confrontation Scene
When the protagonist faces a target directly.

Do:
- Let the target speak. Let them defend themselves, or beg, or be indifferent. What they say in this moment reveals character.
- Track the protagonist''s physical state through the confrontation — the body often knows before the mind
- If the target shows unexpected humanity, include the protagonist''s awareness of it. They notice. What they do with that awareness defines them.
- Honor the weight of the moment: this is what the protagonist has been moving toward. Give it room.

Don''t:
- Rush to the violence. The approach and the confrontation are as important as the outcome.
- Have the target simply be confirmed as monstrous. The moral territory requires complication.
- Provide neat resolution. What happens after the confrontation ends should leave something unresolved.

#### 2.6 The Aftermath Scene
After a piece of revenge is complete.

Do:
- Show the silence that follows: the protagonist alone with what they have done
- Use the absence of the expected feeling as a scene — what they thought they would feel versus what they actually feel
- Include an involuntary moment: a memory, a reflex, something that breaks through the controlled surface

Don''t:
- Cut away too quickly. The aftermath is where the genre lives.
- Have the protagonist immediately move to the next target without registering what just happened. The accumulation matters.

---

### III. Dialogue Style

Vengeance Driven fiction in English has specific dialogue requirements:

**The protagonist speaks economically**: Years of obsession have stripped away conversational superfluity. They say what is necessary. They do not elaborate. When they do say more than necessary, it is significant.

**Subtext over text**: The things the protagonist cannot say to anyone — because no one could understand — are the most important things in the novel. This creates dialogue that is always slightly elsewhere.

**The confrontation dialogue**: When the protagonist speaks directly to a target, the dialogue should be precise. Not shouted. Not impassioned. Specific. "You signed the warrant on the fifteenth. In the morning. You had breakfast first."

**The ordinary conversation as horror**: The protagonist, in social situations, performs normalcy. This performance is itself disturbing — particularly in scenes where readers know what they are thinking.

**What they cannot say to the Ghost**: The character who knew them before. Dialogue with this character should carry the weight of everything that cannot be explained — the protagonist editing themselves in real time, choosing what to show.

---

### IV. Pacing and Rhythm

**Chapter structure for Vengeance Driven fiction:**
- Most chapters should advance the mission in some way — even preparatory chapters should feel purposeful
- End chapters on tension that pulls forward: not necessarily a cliffhanger, but an unresolved question
- Alternate scene types: confrontation scenes need preparation scenes to give them weight; planning scenes need human moments to prevent them from feeling mechanical

**Rhythm of satisfaction and insufficiency:**
The reader''s experience should follow a pattern: anticipation → partial satisfaction → the hollow → drive for the next. This cycle is the engine of the reading experience. Do not skip the hollow.

**The use of white space:**
Short scenes and white space can be as powerful as extended prose. After a significant event, a very short chapter — even a single page — that simply registers the protagonist alone can carry enormous weight.

**Managing the long game:**
For novels that span years of a revenge plan, the prose must find a way to convey the passage of time without losing momentum:
- Summarize the time in transition; dramatize the significant moments
- Show what changes and what does not: the protagonist''s discipline versus the small ways the obsession is consuming them
- Don''t let the reader forget what is being sacrificed daily

---

### V. Common Writing Errors

1. **The protagonist explains their psychology**: "I did this because when they killed my daughter, I lost everything." Let the action speak. Let the reader piece together the psychology from behavior and response.

2. **The wound is rendered in summary**: "It had been terrible. He had survived things no one should survive." Name the terrible things. Put the reader there.

3. **The dark satisfaction is either too clean or too guilty**: Straight catharsis removes moral complexity; immediate authorial guilt-trip removes the reader''s ability to feel the complexity themselves. Trust the reader to notice what the protagonist is feeling is disturbing.

4. **Every scene ends with the protagonist resolving**: No ambivalence, no open wounds, no doubt that persists past the scene''s end. Vengeance Driven protagonists do not resolve cleanly.

5. **The violence is described from the outside**: Action-scene choreography rather than interior experience. The protagonist''s consciousness during violence is the story, not what their fists are doing.

6. **The Ghost subplot is only supportive**: The character who knew the protagonist before exists only to worry about them and care for them. This character should also have moments of horror, moments of complicity, moments where they see clearly what the protagonist is and must decide what to do with that knowledge.

7. **Flashbacks are used for sympathy only**: Every flashback to the wound is designed to remind readers to feel sorry for the protagonist. Some flashbacks should be used to show what the protagonist has lost that was not the direct victim of the crime: their way of being in the world, their capacity for joy, their patience, their forgiveness.

8. **The final confrontation is the climax**: The confrontation is the climax of the action, but the real climax is the aftermath — what is left. Make sure the aftermath is written with the same care as the confrontation.
',
  '## Vengeance Driven Narrative Writing — The Vengeance Soul Novel

This skill focuses on craft: how to write the wound, the obsession, and the reckoning on the page.

---

### I. Language Style
The register of controlled damage: short declaratives for high-emotion moments, sensory specificity over emotional abstraction, emotional restraint as revelation. What the protagonist does NOT say is as important as what they do.

---

### II. Core Scene Types

**The Wound Scene**: Stay close to sensory experience. Don''t cut away. Include one specific detail that will recurse. The worst things often happen quietly.

**The Transformation Scene**: Show it through action, not declaration. Include the absence of expected revulsion.

**The Dark Satisfaction Scene**: Make it specific, physical, and troubling. Follow it with the insufficiency. Don''t moralize.

**The Trauma Flashback**: Trigger with established sensory detail. Fragmentary, present tense inside. Should cost the protagonist something.

**The Confrontation Scene**: Let the target speak and defend themselves. Track the protagonist''s physical state. Honor the weight of the moment.

**The Aftermath Scene**: The silence that follows. The absence of expected feeling. Do not cut away too quickly.

---

### III. Dialogue Style
Protagonist speaks economically. Confrontation dialogue is precise, not impassioned. Ordinary conversation as horror — performing normalcy while readers know what they''re thinking.

---

### IV. Pacing
Rhythm of anticipation → partial satisfaction → the hollow → next target. Do not skip the hollow. The hollow is the genre.

---

### V. Common Errors

1. Protagonist explains their psychology — let action speak
2. The wound rendered in summary — put the reader there
3. Dark satisfaction too clean or too guilty — trust the reader
4. Violence described from the outside — interior experience is the story
5. Flashbacks used for sympathy only — some should show loss of capacity, not just loss of people
6. The aftermath is rushed — the real climax is what is left after the confrontation
',
  (SELECT id FROM novel_creation_method WHERE name = 'The Vengeance Soul Novel' LIMIT 1),
  1,
  100,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  is_active = VALUES(is_active),
  sort_order = VALUES(sort_order);
