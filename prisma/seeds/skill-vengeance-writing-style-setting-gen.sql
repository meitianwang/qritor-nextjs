-- "Writing Style" Setting Generation — The Vengeance Soul Novel
-- Layer 3 domain knowledge skill for writing style module
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-vengeance-writing-style-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'vengeance-writing-style-setting-gen',
  '"Writing Style" setting generation: generates the narrative voice and prose approach for The Vengeance Soul Novel',
  '"Writing Style" setting generation: generates the narrative voice and prose approach for The Vengeance Soul Novel',
  '## "Writing Style" Setting Generation — The Vengeance Soul Novel

Writing style in Vengeance Driven fiction is not decoration — it is the delivery mechanism for the genre''s core emotional experience: the sustained presence inside a fractured, obsessed mind. The style choices here will determine whether readers feel they are watching a revenge story from a safe distance, or whether they are trapped inside one, unable to look away.

---

### Field Generation Guide

#### Narrative POV
Each POV creates a fundamentally different reader experience:

- **First Person — Inside the Obsession**: The reader is inside the protagonist''s fractured consciousness. Every observation is filtered through the wound. The revenge obsession is inescapable and immediate. Risk: the protagonist''s moral compromises become the reader''s. Power: the reader cannot maintain comfortable distance.
- **Third Person Limited — Close But One Step Removed**: Slightly more analytical distance than first person. The narrator can describe the protagonist''s state with a clinical precision the protagonist might lack. Creates a subtle horror: we see what the protagonist does not quite see about themselves.
- **Third Person Omniscient**: Risky in this genre. The reader gains perspective on the protagonist that undermines the obsession''s grip. Best used when the story deliberately interrogates the revenge narrative rather than inhabiting it.
- **Unreliable Narrator — They Have Convinced Themselves They Are Right**: A variant of first person. The protagonist presents their actions as reasonable, just, even necessary. The gap between their self-narration and the reality the narrative subtly reveals is the horror. Requires great technical precision.

The strongest choices for pure Vengeance Driven fiction are First Person and Third Person Limited — Unreliable Narrator.

#### Emotional Register
The emotional register is the sustained undertone beneath every scene:

- **Cold Fury — Ice Over Fire**: The surface is calm, controlled, almost affectless. The fire is visible only in what the protagonist chooses to describe and how — what they linger on, what they omit, what they return to. Creates mounting dread.
- **Barely Contained Explosion**: Every scene is pressurized. The protagonist is always on the edge of something that readers feel they''re holding back with them. Violence and tenderness are equally near the surface.
- **Detached Clinical Observation**: The protagonist processes everything as data. Emotions are noted, catalogued, filed. The horror is that they once felt things normally, and readers can see the scar tissue where that capacity used to be.
- **Grief Twisted Into Something Terrible**: The emotional register is recognizable as grief but distorted — the love is still there, but it''s now an accelerant. Creates deep, complicated reader sympathy.
- **Savage and Exultant**: The protagonist does not pretend to regret. When the violence comes, they feel something close to joy. The reader must decide what to do with that.

#### Prose Style
The prose style executes the emotional register at the sentence level:

- **Lean and Surgical — Every Word Cuts**: Short sentences. Active voice. No comfort in elaborate description. The prose performs the protagonist''s focused, stripped-down purpose. Nothing exists in the narrative that does not serve the mission.
- **Visceral and Immersive — Pain Made Physical**: The prose forces readers to inhabit sensation: physical pain, the smell of blood, the specific weight of grief in the chest. Creates discomfort and complicity simultaneously.
- **Lyrical Despite the Darkness**: The protagonist finds terrible beauty in what they do. The beauty of the prose is part of the horror — it seduces readers into a place they know they shouldn''t be.
- **Stream of Consciousness — The Obsession Is the Narration**: Fragmented, recursive, obsessive. The prose itself enacts the psychological damage. Best used in scenes of extreme stress or when approaching the origin trauma.

#### Pacing
Pacing determines the reader''s experience of time — and of waiting:

- **Relentless — The Hunt Never Pauses**: Scene after scene moves the revenge forward. Minimal reflection, maximum momentum. Risk: emotional depth is sacrificed; readers don''t have time to feel the weight of what''s happening.
- **Calculated Build — Long Patience, Explosive Release**: Chapters of preparation, infiltration, and planning — then a moment of violence or revelation that releases everything. Mirrors the protagonist''s internal rhythm.
- **Slow Burn — Years Pass Between Strikes**: The narrative tracks the protagonist over years of waiting. Requires the mundane details of that waiting to carry emotional weight. When the strike comes, it has the power of accumulated time.
- **Episodic — Each Target a Complete Arc**: Each section of the novel functions almost as a standalone story: the protagonist identifies, infiltrates, destroys, moves on. Creates satisfying rhythmic structure.

#### Violence and Torture Threshold
This is a craft choice with significant implications:

- **Unflinching — Every Detail On-Page**: The violence is rendered completely. Creates moral weight — readers cannot enjoy it cleanly, cannot separate the satisfaction from the horror. Requires exceptional skill to maintain reader engagement without losing them.
- **Purposeful — Violence Serves the Emotional Beat**: Violence is shown when it reveals character or advances emotional stakes. The question is not "how brutal was it" but "what did it mean."
- **Strategic — Implication Over Depiction**: The camera cuts away, or arrives after. What the reader''s imagination constructs may be worse than what could be written. Maintains a certain kind of complicity — the reader''s imagination is implicated.
- **Stylized — The Beauty of the Terrible**: Violence rendered with a kind of terrible aesthetic precision — controlled, choreographed, even beautiful in its execution. Disturbing precisely because it is not ugly.

#### Banned Words
Words and phrases that break the register or introduce false comfort:
- Redemption arc language: "began to heal," "found peace," "let go"
- Action hero clichés: "cold-blooded killer," "eyes of steel"
- Sanitizing euphemisms for what the protagonist is doing
- Comfort words that belong to a different genre

---

### Field Interdependencies

- **Narrative POV → Emotional Register**: First Person and Unreliable Narrator require the emotional register to be sustained within the protagonist''s voice.
- **Obsession Profile (from Psychological Fracture) → Prose Style**: Ice-Cold Patience → Lean and Surgical. Burning Fever → Visceral and Immersive. Dissociation → Stream of Consciousness.
- **Vengeance Architecture Methods → Violence Threshold**: The choice of method determines what violence the narrative will depict and how.
- **Emotional Register → Pacing**: Cold Fury → Calculated Build. Barely Contained Explosion → Relentless.

### Common Errors

- **Inconsistent register**: The prose occasionally lapses into the warmth of a different genre. Every sentence must serve the established emotional climate.
- **The violence is only spectacle**: If violent scenes produce only excitement without moral weight or psychological revelation, the prose is doing less than the genre requires.
- **First Person with therapeutic distance**: The protagonist uses first person but narrates their trauma with the emotional distance of someone who has processed it. This is not the genre. The wound should be open.
- **The lyrical style obscures the darkness**: Beautiful writing that makes the horror palatable. The prose should make the horror beautiful and inescapable, not comfortable.
',
  '## "Writing Style" Setting Generation — The Vengeance Soul Novel

Writing style in Vengeance Driven fiction is the delivery mechanism for the genre''s core experience: sustained presence inside a fractured, obsessed mind.

---

### Key Fields

#### Narrative POV
First Person (reader is inside the obsession), Third Person Limited (clinical precision the protagonist lacks), Unreliable Narrator (the gap between self-narration and reality is the horror).

#### Emotional Register
Cold Fury (ice over fire), Barely Contained Explosion (pressurized scenes), Detached Clinical Observation (emotions catalogued), Grief Twisted Into Something Terrible (love as accelerant), Savage and Exultant (no pretense of regret).

#### Prose Style
Lean and Surgical (nothing exists that doesn''t serve the mission), Visceral and Immersive (readers inhabit sensation), Lyrical Despite the Darkness (beautiful and inescapable), Stream of Consciousness (enacts the psychological damage).

#### Pacing
Relentless (no pause), Calculated Build (long patience, explosive release), Slow Burn (years between strikes), Episodic (each target an arc).

#### Violence Threshold
Unflinching, Purposeful, Strategic (implication), Stylized (terrible aesthetic precision).

---

### Common Errors

- Inconsistent register — every sentence must serve the emotional climate
- Violence as spectacle only — must carry moral weight
- First Person with therapeutic distance — the wound should be open
',
  (SELECT id FROM novel_creation_method WHERE name = 'The Vengeance Soul Novel' LIMIT 1),
  1,
  14,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  is_active = VALUES(is_active),
  sort_order = VALUES(sort_order);
