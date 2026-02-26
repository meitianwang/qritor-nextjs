-- "Scene" Generation — The Vengeance Soul Novel
-- Layer 3 domain knowledge skill for scene generation
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-vengeance-scene-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'vengeance-scene-gen',
  '"Scene" generation: generates emotionally-charged locations for The Vengeance Soul Novel',
  '"Scene" generation: generates emotionally-charged locations for The Vengeance Soul Novel',
  '## "Scene" Generation — The Vengeance Soul Novel

In Vengeance Driven fiction, locations are not neutral backdrops. Every significant space carries emotional and narrative freight: it is either where something terrible happened, where the protagonist plans the reckoning, where their enemies feel safe (and therefore vulnerable), or where the final confrontation will occur. Scenes should be designed to carry this weight — to feel charged before anything happens in them, and to feel different after.

The central design principle: **every scene in a vengeance story is haunted.** The past is present in every room.

---

### Scene Type Design Guide

#### The Place It Happened — Where Everything Was Destroyed
This is the most powerful location type in the genre. Design considerations:
- **Sensory specificity is essential**: The protagonist returns here, in memory or in person. What do they see? What has changed and what is unchanged? What detail most tortures them?
- **The contrast between then and now**: If the place has been reclaimed — turned into a market, a manor house, a church — the transformation is its own form of violence. Someone built a life on top of the ruins.
- **What the protagonist does when they return**: Do they break? Do they become more resolved? Do they feel nothing, and that nothingness frightens them?
- **Whether the location still exists**: Destruction of the place might be part of the revenge plan. Or its preservation might be.

#### Sanctuary of Obsession — Where the Protagonist Plans
The space that belongs entirely to the protagonist''s purpose. Design considerations:
- **It should reflect the protagonist''s psychology**: Cold and methodical (maps, lists, dossiers), or fever-lived (evidence everywhere, obsessive annotation)
- **What is hidden here that would terrify others**: The true scope of the plan, the list of names, evidence of what they are willing to do
- **What is also hidden here that would surprise others**: The remnant of the pre-trauma self — a photograph, a child''s toy, one ordinary thing they cannot let go of
- **Whether anyone else knows this place exists**: The sanctuary''s secrecy is part of its function

#### The Enemy''s Domain — Their Palace or Stronghold
The target''s seat of power. Design considerations:
- **The gap between the facade and the truth**: What the location presents to the world (legitimacy, wealth, power) versus what it conceals (guilt, fear, corruption)
- **The protagonist must be able to imagine themselves inside it**: Planning the infiltration is part of the scene''s dramatic function
- **What the enemy finds beautiful here**: Understanding what they value is understanding how to take it from them
- **The security and its gaps**: Every fortress has a crack. Where is it?

#### The Hunting Ground
A space where the protagonist pursues intermediate targets or gathers intelligence. Design considerations:
- **Controlled terrain**: The protagonist chooses this ground because they have an advantage here
- **The risk of exposure**: What happens if the protagonist is recognized or discovered
- **The rules of this space**: Social environments (courts, markets, taverns) have rules the protagonist must navigate while concealing their purpose

#### Prison or Place of Former Captivity
Where the protagonist was held, tortured, or confined. Design considerations:
- **This location is a trauma trigger**: The protagonist cannot approach this space without experiencing intrusive memory
- **The current state vs. the remembered state**: Is it still in use? Has it been repurposed? Is it abandoned?
- **The protagonist''s relationship with returning**: Do they need to see it again? Do they avoid it? Is destroying it part of the revenge plan?

#### Public Stage — Where the Reckoning Will Be Witnessed
Some revenge plans require witnesses. The public stage is where the protagonist''s action will be seen. Design considerations:
- **Who the audience is and what seeing this will mean to them**: If the crime was covered up, exposure matters. If the enemy derived power from public respect, public humiliation is specifically devastating.
- **The risks of a public venue**: The protagonist loses control variables in a public space
- **What the protagonist wants the audience to know**: Not just the enemy''s guilt, but the protagonist''s survival, their refusal to have been erased

#### The Final Confrontation Site
Where the last act occurs. Design considerations:
- **It should resonate with the origin**: The final location should echo or invert the original site of the crime — completing a circle
- **The protagonist''s control of this space**: Do they choose it (maximum control, potentially clinical) or does the enemy choose it (greater danger, greater power if they still prevail)?
- **What the space means after**: If the protagonist survives, what does this place become to them?

---

### Scene Roster Recommendations

For an initial set of locations:

| Priority | Scene Type | Count | Notes |
|---------|------------|-------|-------|
| Essential | The Place It Happened | 1 | The founding wound''s geography |
| Essential | The Enemy''s Domain | 1-2 | Per major target |
| Essential | The Final Confrontation Site | 1 | The ending''s geography |
| High | Sanctuary of Obsession | 1 | The protagonist''s inner world made external |
| High | Public Stage | 1 | If the revenge plan involves exposure |
| Conditional | Prison/Captivity | 1 | If the origin includes imprisonment or torture |
| Variable | Hunting Grounds | 1-3 | As needed for intermediate targets |

---

### Field Generation Guide

#### Location Name
Vengeance Driven fiction in English typically favors names that are:
- Concrete and specific rather than evocative (the actual name of the place, not a poetic title)
- Sometimes deliberately ordinary, contrasting the emotional weight with mundane geography
- Occasionally named for what happened there rather than what it is (the protagonist may rename places in their mind)

#### Atmosphere
The emotional texture of the space should be inseparable from its physical description:
- What the protagonist feels when they approach it (before anything has happened in the scene)
- What the space''s default state is: abandoned? busy? falsely cheerful? coldly functional?
- What sensory detail is most specific and most charged

#### Memory Embedded Here
The key field for vengeance fiction. Every important location should carry at least one specific memory:
- What happened here
- Who was present
- What the protagonist saw, heard, or felt
- Whether the memory is complete or fragmented (trauma interrupts memory in specific ways)

#### Strategic Significance
How does this location serve the revenge plan? Be specific about the tactical or emotional function.

---

### Setting Interdependencies

- **Origin of Vengeance → The Place It Happened**: The geography of the original crime becomes the geography of memory.
- **Vengeance Architecture → Enemy Domain + Final Site**: The targets'' strongholds and the final confrontation site should map to the kill order.
- **Psychological Fracture → Trauma Triggers**: The triggers listed in Psychological Fracture should appear in scene descriptions — the sensory details that shatter the protagonist''s control.

### Common Errors

- **Generic dark settings**: "A dark alley," "a crumbling castle" with no specific emotional charge. Every location must be haunted by something specific.
- **The sanctuary as torture**: The protagonist''s planning space should not be solely a space of suffering. It is also where they feel most purpose, most alive — however disturbing that is.
- **The enemy''s domain is pure evil**: If the target''s seat of power feels uniformly villainous, readers lose the moral complexity. Beautiful things should exist there. Good people may live there.
- **No after-thought**: What happens to these spaces after the revenge? A scene that exists only as a set piece is less powerful than one that will mean something different by the end of the novel.
',
  '## "Scene" Generation — The Vengeance Soul Novel

In Vengeance Driven fiction, every location carries emotional freight. The central principle: every scene is haunted. The past is present in every room.

---

### Key Scene Types

**The Place It Happened**: Sensory specificity is essential. What has changed and what is unchanged? The contrast between then and now.

**Sanctuary of Obsession**: Reflects the protagonist''s psychology. Contains both the plan and the one remnant of who they were.

**The Enemy''s Domain**: The gap between facade and truth. What they find beautiful here — that''s what can be taken.

**The Hunting Ground**: Controlled terrain. The protagonist has an advantage here.

**Prison or Place of Captivity**: A trauma trigger location. The protagonist''s relationship with returning.

**Public Stage**: Where the reckoning will be witnessed. Requires an audience and carries risk.

**Final Confrontation Site**: Should resonate with and echo the origin. Completes a circle.

---

### Roster Recommendation
1 Place It Happened, 1-2 Enemy Domains, 1 Sanctuary, 1 Final Site, plus hunting grounds and public stages as needed.

---

### Common Errors

- Generic dark settings — every location must be haunted by something specific
- Enemy domain as pure evil — beautiful things should exist there
- No after-thought — locations should mean something different by the end
',
  (SELECT id FROM novel_creation_method WHERE name = 'The Vengeance Soul Novel' LIMIT 1),
  1,
  22,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  is_active = VALUES(is_active),
  sort_order = VALUES(sort_order);
