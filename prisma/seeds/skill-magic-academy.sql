-- -----------------------------------------------------------------------------
-- Magic Academy / Battle School AI Generation Skills Layer 3 SQL
-- -----------------------------------------------------------------------------

SET @method_id = 100; 

-- ============================================================================
-- 1. Setting Gen Skills (-setting-gen)
-- ============================================================================

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'academy-hook-setting-gen',
  'Admission Hook Generation: Defines the protagonist''s catastrophic public failure that secretly hides an overpowered mechanic.',
  'Admission Hook Generation: Defines the protagonist''s catastrophic public failure that secretly hides an overpowered mechanic.',
  '## Admission Incident Hook Generation — Magic Academy / Battle School

The quintessential start of any Battle School novel is a public test where the protagonist is officially labeled "trash" by the system, ensuring they are mocked by their peers while the audience knows they actually possess something world-breaking.

---

### Generation Guidelines

#### The Broken Evaluation
The school''s testing mechanism must completely misinterpret the protagonist.
*Example:* The ancient Awakening Obelisk explodes when the protagonist touches it. The professors assume he has "Zero Resonance" and broke it by being completely incompatible with magic. In reality, his mana was simply too dense for a 3,000-year-old rock to measure.

#### The Public Humiliation
Lean heavily into the social hierarchy of teenagers/young adults. The smug nobles or prodigies must publicly laugh at the result, isolating the protagonist and setting up a deeply satisfying future face-slapping moment.

#### The Secret Advantage
What is explicitly the "cheat" they get out of this failed exam?
*Example:* Being assigned to the "F-Class Garbage Dorms" isolates them, allowing them to secretly practice a forbidden breathing technique all night without roommates interrupting.',
  '## Admission Incident Hook Generation — Magic Academy / Battle School

The quintessential start of any Battle School novel is a public test where the protagonist is officially labeled "trash" by the system, ensuring they are mocked by their peers while the audience knows they actually possess something world-breaking.

---

### Generation Guidelines

#### The Broken Evaluation
The school''s testing mechanism must completely misinterpret the protagonist.
*Example:* The ancient Awakening Obelisk explodes when the protagonist touches it. The professors assume he has "Zero Resonance" and broke it by being completely incompatible with magic. In reality, his mana was simply too dense for a 3,000-year-old rock to measure.

#### The Public Humiliation
Lean heavily into the social hierarchy of teenagers/young adults. The smug nobles or prodigies must publicly laugh at the result, isolating the protagonist and setting up a deeply satisfying future face-slapping moment.

#### The Secret Advantage
What is explicitly the "cheat" they get out of this failed exam?
*Example:* Being assigned to the "F-Class Garbage Dorms" isolates them, allowing them to secretly practice a forbidden breathing technique all night without roommates interrupting.',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'academy-rule-setting-gen',
  'Academic System & Power Rules: Details the hard magic/sci-fi combat system, class rankings, and limitations of growth.',
  'Academic System & Power Rules: Details the hard magic/sci-fi combat system, class rankings, and limitations of growth.',
  '## Hierarchy & Power Mechanics — Magic Academy / Battle School

The school environment must feel like a microcosm of a brutal, hyper-competitive society. Information, ranking, and power are everything.

---

### Generation Guidelines

#### The Cultivation / Tech Magic System
Create a rigid, tier-based power system that relies on resources, comprehension, or genetic limits.
*Example:* "Runecraft Chanting." First Years can only channel 1-syllable fire runes. Fifth Years can chain 5-syllable domain-expansion spells. The protagonist cannot chant out loud, but can "carve" runes directly into their own bones.

#### The School Economy (Rankings = Life)
Privilege heavily heavily dictates the student experience.
*Example:* The Top 10% sleep in penthouse suites with accelerated mana recovery arrays and eat magical boar meat. The bottom 50% are forced to sweep the dungeon corridors and sleep in cramped barracks with leaky roofs.

#### The Hard Ceiling
What is the universal rule everyone follows but the protagonist breaks? E.g., You cannot absorb mana from two different elements without exploding. The protagonist absorbs four.',
  '## Hierarchy & Power Mechanics — Magic Academy / Battle School

The school environment must feel like a microcosm of a brutal, hyper-competitive society. Information, ranking, and power are everything.

---

### Generation Guidelines

#### The Cultivation / Tech Magic System
Create a rigid, tier-based power system that relies on resources, comprehension, or genetic limits.
*Example:* "Runecraft Chanting." First Years can only channel 1-syllable fire runes. Fifth Years can chain 5-syllable domain-expansion spells. The protagonist cannot chant out loud, but can "carve" runes directly into their own bones.

#### The School Economy (Rankings = Life)
Privilege heavily heavily dictates the student experience.
*Example:* The Top 10% sleep in penthouse suites with accelerated mana recovery arrays and eat magical boar meat. The bottom 50% are forced to sweep the dungeon corridors and sleep in cramped barracks with leaky roofs.

#### The Hard Ceiling
What is the universal rule everyone follows but the protagonist breaks? E.g., You cannot absorb mana from two different elements without exploding. The protagonist absorbs four.',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'academy-style-setting-gen',
  'Tone & Style Generation: Balancing mundane academic life with life-and-death tournament stakes.',
  'Tone & Style Generation: Balancing mundane academic life with life-and-death tournament stakes.',
  '## Tone & Style Generation — Magic Academy / Battle School

---

### Generation Guidelines

The tone must wildly oscillate between "teenagers stressing over a math test" and "violent, high-speed magical slaughter in the training zone."
- **Institutional Apathy:** The professors shouldn''t care if a student gets hospitalized during a sparring match; it''s considered "a learning experience." This creates a gritty, sink-or-swim atmosphere.
- **The Dopamine Climb:** Emphasize the gradual, hard-earned progress. Describe the protagonist sweating, bleeding, and failing in their solo training, making the moment they casually block the bully''s punch in the cafeteria wildly satisfying.
- **Academic Precision in Combat:** Battles shouldn''t just be flashing lights. They should read like a chess match of theories taught in class. "He countered my C-Rank Fireball not by overpowering it, but by striking the thermal weak point at exactly a 30-degree angle, destabilizing its mana matrix." ',
  '## Tone & Style Generation — Magic Academy / Battle School

---

### Generation Guidelines

The tone must wildly oscillate between "teenagers stressing over a math test" and "violent, high-speed magical slaughter in the training zone."
- **Institutional Apathy:** The professors shouldn''t care if a student gets hospitalized during a sparring match; it''s considered "a learning experience." This creates a gritty, sink-or-swim atmosphere.
- **The Dopamine Climb:** Emphasize the gradual, hard-earned progress. Describe the protagonist sweating, bleeding, and failing in their solo training, making the moment they casually block the bully''s punch in the cafeteria wildly satisfying.
- **Academic Precision in Combat:** Battles shouldn''t just be flashing lights. They should read like a chess match of theories taught in class. "He countered my C-Rank Fireball not by overpowering it, but by striking the thermal weak point at exactly a 30-degree angle, destabilizing its mana matrix." ',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);


-- ============================================================================
-- 2. Character Gen Skills (-character-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'academy-character-gen',
  'Character Generation: Smug nobles, eccentric professors, and the ride-or-die loyal squadmates.',
  'Character Generation: Smug nobles, eccentric professors, and the ride-or-die loyal squadmates.',
  '## Character Archive Generation — Magic Academy / Battle School

Characters embody different ideologies regarding power: talent vs. hard work, nobility vs. commoner, rule-followers vs. renegades.

---

### Generation Guidelines

#### The Aloof Rival (Ice Queen / Perfect Prince)
The top-ranked student who is initially completely unreachable. They ignore the protagonist early on, but slowly become obsessed with their anomalous growth. They are bound by family expectations and secretly despise their own perfect image.

#### The Corrupt Instructor & The Secret Mentor
Generate two types of authority figures:
1. *The Obstacle:* A professor bought off by noble families, deliberately grading the protagonist harshly or putting them in lethal danger during exams.
2. *The Drunk Master:* The janitor, or the suspended alcoholic ex-combat instructor, who sees the protagonist''s hidden talent and teaches them an illegal or forgotten art in the middle of the night.

#### The Bully Stepping Stone
An arrogant mid-tier student (Rank 50s-100s) whose entire purpose is to be publicly, humiliatingly defeated by the protagonist before the Midterms to establish the protagonist''s rise.',
  '## Character Archive Generation — Magic Academy / Battle School

Characters embody different ideologies regarding power: talent vs. hard work, nobility vs. commoner, rule-followers vs. renegades.

---

### Generation Guidelines

#### The Aloof Rival (Ice Queen / Perfect Prince)
The top-ranked student who is initially completely unreachable. They ignore the protagonist early on, but slowly become obsessed with their anomalous growth. They are bound by family expectations and secretly despise their own perfect image.

#### The Corrupt Instructor & The Secret Mentor
Generate two types of authority figures:
1. *The Obstacle:* A professor bought off by noble families, deliberately grading the protagonist harshly or putting them in lethal danger during exams.
2. *The Drunk Master:* The janitor, or the suspended alcoholic ex-combat instructor, who sees the protagonist''s hidden talent and teaches them an illegal or forgotten art in the middle of the night.

#### The Bully Stepping Stone
An arrogant mid-tier student (Rank 50s-100s) whose entire purpose is to be publicly, humiliatingly defeated by the protagonist before the Midterms to establish the protagonist''s rise.',
  @method_id, 1, 21, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 3. Scene Gen Skills (-scene-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'academy-scene-gen',
  'Scene Generation: Stadium tournament arenas, simulated dungeons, and restricted library sections.',
  'Scene Generation: Stadium tournament arenas, simulated dungeons, and restricted library sections.',
  '## Scene & Location Generation — Magic Academy / Battle School

The school is massive. It should contain diverse biomes and heavily restricted zones that act as natural progression barriers.

---

### Generation Guidelines

#### The Grand Arena (The Colosseum)
The setting for midterms, finals, and inter-school tournaments. Describe thousands of screaming students in floating bleachers, glaring magical barriers, and heavy corporate/military recruiters watching from VIP boxes. This is a place of absolute, objective violence where excuses don''t matter.

#### The Forbidden Archive / Dungeon
A location the protagonist sneaks into.
*Example:* Section 4 of the campus underground labyrinth. It''s officially sealed because a rogue professor unleashed a chimera there twenty years ago. The protagonist sneaks in purely because the chimera''s blood is needed for their illegal cultivation technique. Describe the eerie silence of an empty, dangerous school corridor at 3 AM.',
  '## Scene & Location Generation — Magic Academy / Battle School

The school is massive. It should contain diverse biomes and heavily restricted zones that act as natural progression barriers.

---

### Generation Guidelines

#### The Grand Arena (The Colosseum)
The setting for midterms, finals, and inter-school tournaments. Describe thousands of screaming students in floating bleachers, glaring magical barriers, and heavy corporate/military recruiters watching from VIP boxes. This is a place of absolute, objective violence where excuses don''t matter.

#### The Forbidden Archive / Dungeon
A location the protagonist sneaks into.
*Example:* Section 4 of the campus underground labyrinth. It''s officially sealed because a rogue professor unleashed a chimera there twenty years ago. The protagonist sneaks in purely because the chimera''s blood is needed for their illegal cultivation technique. Describe the eerie silence of an empty, dangerous school corridor at 3 AM.',
  @method_id, 1, 22, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 4. Prop Gen Skills (-prop-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'academy-prop-gen',
  'Prop Generation: Combat manuals, broken casting devices, and black-market enhancement drugs.',
  'Prop Generation: Combat manuals, broken casting devices, and black-market enhancement drugs.',
  '## Prop & Artefact Generation — Magic Academy / Battle School

Items highlight the wealth gap. Nobles have perfectly engineered modern equipment; the protagonist has a rusty blade that secretly houses an ancient ghost.

---

### Generation Guidelines

#### The "Trash" Artefact (Protagonist''s Gear)
Generate an item that looks completely useless to the modern academic system.
*Example:* A rusty, un-attunable heavy iron sword bought from a campus junkyard. It turns out it constantly drains mana, meaning anyone else would die using it—but it perfectly restrains the protagonist''s overwhelmingly violent, mutated mana.

#### The Elite''s Crutch
Generate an expensive, cutting-edge technology/magic item used by rivals.
*Example:* The Mark VII Aegis Bracelet, worth a million credits, capable of deploying three automated kinetic shields instantly. The protagonist defeats it not with a better item, but by exploiting its 0.5-second reset cooldown with a cheap, repetitive jab.',
  '## Prop & Artefact Generation — Magic Academy / Battle School

Items highlight the wealth gap. Nobles have perfectly engineered modern equipment; the protagonist has a rusty blade that secretly houses an ancient ghost.

---

### Generation Guidelines

#### The "Trash" Artefact (Protagonist''s Gear)
Generate an item that looks completely useless to the modern academic system.
*Example:* A rusty, un-attunable heavy iron sword bought from a campus junkyard. It turns out it constantly drains mana, meaning anyone else would die using it—but it perfectly restrains the protagonist''s overwhelmingly violent, mutated mana.

#### The Elite''s Crutch
Generate an expensive, cutting-edge technology/magic item used by rivals.
*Example:* The Mark VII Aegis Bracelet, worth a million credits, capable of deploying three automated kinetic shields instantly. The protagonist defeats it not with a better item, but by exploiting its 0.5-second reset cooldown with a cheap, repetitive jab.',
  @method_id, 1, 23, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 5. Organization Gen Skills (-org-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'academy-org-gen',
  'Faction Generation: Disciplinary committees, noble houses pulling strings, and rival academies.',
  'Faction Generation: Disciplinary committees, noble houses pulling strings, and rival academies.',
  '## Faction & Organization Generation — Magic Academy / Battle School

The school is just a proxy battlefield for massive adult organizations (Noble Houses, Corporations, the Military).

---

### Generation Guidelines

#### The Student Disciplinary Committee / Central Council
They act as the terrifying police force of the school. Mostly comprised of arrogant 3rd and 4th years who abuse their power. They will try to expel the protagonist on falsified charges because the protagonist embarrassed a noble.

#### The Shadow Sponsors (Adult Factions)
Corporate or military factions stalking the campus for talent.
*Example:* The Vanguard Mercenary Group. They watch the midterms from the shadows, seeking ruthless students for their illegal off-continent operations. They try to forcefully recruit the protagonist after witnessing their brutal fighting style.

#### The Rival Academy
The ultimate mid-to-late game antagonist faction. An elite foreign academy that visits for the "Joint Continental Tournament," full of students who look down on the protagonist''s entire school.',
  '## Faction & Organization Generation — Magic Academy / Battle School

The school is just a proxy battlefield for massive adult organizations (Noble Houses, Corporations, the Military).

---

### Generation Guidelines

#### The Student Disciplinary Committee / Central Council
They act as the terrifying police force of the school. Mostly comprised of arrogant 3rd and 4th years who abuse their power. They will try to expel the protagonist on falsified charges because the protagonist embarrassed a noble.

#### The Shadow Sponsors (Adult Factions)
Corporate or military factions stalking the campus for talent.
*Example:* The Vanguard Mercenary Group. They watch the midterms from the shadows, seeking ruthless students for their illegal off-continent operations. They try to forcefully recruit the protagonist after witnessing their brutal fighting style.

#### The Rival Academy
The ultimate mid-to-late game antagonist faction. An elite foreign academy that visits for the "Joint Continental Tournament," full of students who look down on the protagonist''s entire school.',
  @method_id, 1, 25, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 6. Plot Gen Skills (-plot-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'academy-plot-gen',
  'Plot Design: Tournament arcs, underdog class-up battles, and stopping terrorist attacks during finals.',
  'Plot Design: Tournament arcs, underdog class-up battles, and stopping terrorist attacks during finals.',
  '## Plot Design Domain Knowledge — Magic Academy / Battle School

The pacing is driven by the academic calendar: Start-of-term mockery, grueling secret training, midterm face-slapping, and the catastrophic finals.

---

### Typical Story Structure
1. **The F-Class Humiliation**: The sorting exam. The protagonist is mocked and assigned to the lowest rank. They discover their unique "cheat" (a system, a ghost mentor, an ancient bloodline) in their dorm room.
2. **The First Blood (Class Advancement)**: They train in secret. A minor noble challenges them to a duel or bullies their friend. The protagonist casually dodges their spell and breaks their arm, shocking the class and gaining the attention of an eccentric professor.
3. **The Midterm Wilderness Survival / Dungeon**: Students are dropped into a simulated, dangerous zone. The wealthy students cheat. Things go genuinely wrong (a terrorist faction attacks, or a real monster breaks in). The protagonist drops their facade, slaughters the monster, and saves the top-ranked haughty rival, shifting the power dynamic.
4. **The Inter-School Tournament**: The protagonist is chosen to represent the school. They must battle the monstrous geniuses from rival academies. The arc culminates in a stadium-shattering final match where the protagonist officially claims the title of "Rank 1".',
  '## Plot Design Domain Knowledge — Magic Academy / Battle School

The pacing is driven by the academic calendar: Start-of-term mockery, grueling secret training, midterm face-slapping, and the catastrophic finals.

---

### Typical Story Structure
1. **The F-Class Humiliation**: The sorting exam. The protagonist is mocked and assigned to the lowest rank. They discover their unique "cheat" (a system, a ghost mentor, an ancient bloodline) in their dorm room.
2. **The First Blood (Class Advancement)**: They train in secret. A minor noble challenges them to a duel or bullies their friend. The protagonist casually dodges their spell and breaks their arm, shocking the class and gaining the attention of an eccentric professor.
3. **The Midterm Wilderness Survival / Dungeon**: Students are dropped into a simulated, dangerous zone. The wealthy students cheat. Things go genuinely wrong (a terrorist faction attacks, or a real monster breaks in). The protagonist drops their facade, slaughters the monster, and saves the top-ranked haughty rival, shifting the power dynamic.
4. **The Inter-School Tournament**: The protagonist is chosen to represent the school. They must battle the monstrous geniuses from rival academies. The arc culminates in a stadium-shattering final match where the protagonist officially claims the title of "Rank 1".',
  @method_id, 1, 30, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 7. Entity Naming Skills (-entity-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'academy-entity-naming',
  'Entity Naming: Scholarly magical theories, edgy tournament aliases, and pompous noble fraternities.',
  'Entity Naming: Scholarly magical theories, edgy tournament aliases, and pompous noble fraternities.',
  '## Entity Naming — Magic Academy / Battle School

Names should sound like a mix of elite military academia and high-fantasy spells.

---

## 1. Academy / School Names
Use imposing, historical-sounding names that imply prestige or military might.
- The Aethelgard War Academy, Ironblood Institute of Magi-Tech, The Ouroboros Spire.

## 2. Ranking and Combat Systems
Create overly specific, scientific-sounding names for magic.
- *Classes:* F-Rank Combat Synthesizer, S-Class Elemental Vanguard, Zero-Star Rune Knight.
- *Techniques:* The 4th Form of the Azure Blade, Overclocked Mana Core Resonance, Phase-Shift Casting.

## 3. Tournaments and Exams
Exams aren''t just tests; they are warfare.
- The Midterm Culling, The Grand Continental Crucible, Freshmen Ranking Decathlon.',
  '## Entity Naming — Magic Academy / Battle School

Names should sound like a mix of elite military academia and high-fantasy spells.

---

## 1. Academy / School Names
Use imposing, historical-sounding names that imply prestige or military might.
- The Aethelgard War Academy, Ironblood Institute of Magi-Tech, The Ouroboros Spire.

## 2. Ranking and Combat Systems
Create overly specific, scientific-sounding names for magic.
- *Classes:* F-Rank Combat Synthesizer, S-Class Elemental Vanguard, Zero-Star Rune Knight.
- *Techniques:* The 4th Form of the Azure Blade, Overclocked Mana Core Resonance, Phase-Shift Casting.

## 3. Tournaments and Exams
Exams aren''t just tests; they are warfare.
- The Midterm Culling, The Grand Continental Crucible, Freshmen Ranking Decathlon.',
  @method_id, 1, 36, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 8. Narrative Skills (-narrative)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'academy-narrative',
  'Narrative Guidance: Creating satisfying "face-slapping" moments and breaking down complex combat geometry.',
  'Narrative Guidance: Creating satisfying "face-slapping" moments and breaking down complex combat geometry.',
  '## Narrative Writing Guidance — Magic Academy / Battle School

The core narrative drive is the "Underdog Flex"—the moment hard work and secret talent completely humiliate arrogance.

---

### 1. The Anatomy of Face-Slapping
Delay the gratification. Build up the arrogant bully making a massive, flashy attack in front of a crowd. Then, describe the protagonist defusing it with minimalist, dismissive effort.
*Example:* The heir of House Vane channeled a roaring inferno, the heat melting the arena tiles as students gasped at his talent. I didn''t draw my sword. I simply stepped inside his guard during the 0.2-second intake of his breath, tapped the pressure point on his sternum to collapse his mana lung, and watched the inferno sputter into a pathetic puff of smoke. The stadium fell dead silent.

### 2. The Analytical Internal Monologue
During exams or combat, the protagonist should sound like a hyper-focused supercomputer, analyzing variables that no one else sees.
*Example:* *''His center of gravity is too high. He''s relying entirely on the recoil-absorption of his enchanted boots. If I shatter the floorboards under his left heel, his momentum will break his own knee.''*

### 3. The Exhaustion of the Grind
Don''t just show the victory; show the brutal midnight training. The cracked knuckles, the burning mana veins, and the protagonist dragging themselves to a morning history lecture completely dead on their feet.',
  '## Narrative Writing Guidance — Magic Academy / Battle School

The core narrative drive is the "Underdog Flex"—the moment hard work and secret talent completely humiliate arrogance.

---

### 1. The Anatomy of Face-Slapping
Delay the gratification. Build up the arrogant bully making a massive, flashy attack in front of a crowd. Then, describe the protagonist defusing it with minimalist, dismissive effort.
*Example:* The heir of House Vane channeled a roaring inferno, the heat melting the arena tiles as students gasped at his talent. I didn''t draw my sword. I simply stepped inside his guard during the 0.2-second intake of his breath, tapped the pressure point on his sternum to collapse his mana lung, and watched the inferno sputter into a pathetic puff of smoke. The stadium fell dead silent.

### 2. The Analytical Internal Monologue
During exams or combat, the protagonist should sound like a hyper-focused supercomputer, analyzing variables that no one else sees.
*Example:* *''His center of gravity is too high. He''s relying entirely on the recoil-absorption of his enchanted boots. If I shatter the floorboards under his left heel, his momentum will break his own knee.''*

### 3. The Exhaustion of the Grind
Don''t just show the victory; show the brutal midnight training. The cracked knuckles, the burning mana veins, and the protagonist dragging themselves to a morning history lecture completely dead on their feet.',
  @method_id, 1, 101, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 9. Novel Naming Skills (-novel-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'academy-novel-naming',
  'Novel Naming: Titles focusing on the underdog status (F-Rank/Trash) dominating an elite institution.',
  'Novel Naming: Titles focusing on the underdog status (F-Rank/Trash) dominating an elite institution.',
  '## Novel Naming — Magic Academy / Battle School

Titles often heavily lean on the contrast between the protagonist''s low "official" rank and their actual devastating power, alongside the school setting.

---

### Common Title Formats

**Format 1: The "Trash" Flex**
- Structure: State the lowest possible academic rank + the overpowered truth.
- Examples: *The F-Rank Combat Prodigy*, *The Irregular at Magic High School*, *The Extra''s Survival Guide in the Elite Academy*.

**Format 2: The Institute Focus**
- Structure: Emphasize the brutal nature of the school.
- Examples: *Iron Prince*, *The Demon King''s Academy*, *A Practical Guide to Sorcery*, *Mage Errant*.

### Synopsis Structure
Start with the absolute obsession with rankings in this world. Explain the protagonist''s catastrophic failure at the entry exam, earning them a humiliating title (Trash, Zero-Star, F-Rank). Reveal their hidden cheat (an AI chip, a regressor''s memory, forbidden magic). End with a promise to shatter the corrupt hierarchy of the school.
*Example:*
"At the Aethelgard War Academy, your mana capacity determines your humanity. The nobles in the S-Class rule as gods, while the F-Class are treated as cannon fodder. 
During the awakening ceremony, my mana core was officially documented as fractured—a ''Zero-Star Garbage'' incapable of casting a single spell. What the scanner didn''t pick up, however, was the ancient, blood-thirsty martial arts system I inherited from a dead civilization. 
I can''t cast fireballs. I can''t conjure shields. But when the arrogant Elite First Year challenges me to a duel, he''s going to find out that it only takes one punch, delivered at the speed of sound, to break a magic barrier... and his jaw."',
  '## Novel Naming — Magic Academy / Battle School

Titles often heavily lean on the contrast between the protagonist''s low "official" rank and their actual devastating power, alongside the school setting.

---

### Common Title Formats

**Format 1: The "Trash" Flex**
- Structure: State the lowest possible academic rank + the overpowered truth.
- Examples: *The F-Rank Combat Prodigy*, *The Irregular at Magic High School*, *The Extra''s Survival Guide in the Elite Academy*.

**Format 2: The Institute Focus**
- Structure: Emphasize the brutal nature of the school.
- Examples: *Iron Prince*, *The Demon King''s Academy*, *A Practical Guide to Sorcery*, *Mage Errant*.

### Synopsis Structure
Start with the absolute obsession with rankings in this world. Explain the protagonist''s catastrophic failure at the entry exam, earning them a humiliating title (Trash, Zero-Star, F-Rank). Reveal their hidden cheat (an AI chip, a regressor''s memory, forbidden magic). End with a promise to shatter the corrupt hierarchy of the school.
*Example:*
"At the Aethelgard War Academy, your mana capacity determines your humanity. The nobles in the S-Class rule as gods, while the F-Class are treated as cannon fodder. 
During the awakening ceremony, my mana core was officially documented as fractured—a ''Zero-Star Garbage'' incapable of casting a single spell. What the scanner didn''t pick up, however, was the ancient, blood-thirsty martial arts system I inherited from a dead civilization. 
I can''t cast fireballs. I can''t conjure shields. But when the arrogant Elite First Year challenges me to a duel, he''s going to find out that it only takes one punch, delivered at the speed of sound, to break a magic barrier... and his jaw."',
  @method_id, 1, 35, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);
