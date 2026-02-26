-- -----------------------------------------------------------------------------
-- Genre Savvy / Exploiting Narratives AI Generation Skills Layer 3 SQL
-- -----------------------------------------------------------------------------

SET @method_id = 76; 

-- ============================================================================
-- 1. Setting Gen Skills (-setting-gen)
-- ============================================================================

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'genre-savvy-hook-setting-gen',
  'Subverted Trope Hook Generation: Designs a classic opening scenario that the protagonist ruthlessly breaks.',
  'Subverted Trope Hook Generation: Designs a classic opening scenario that the protagonist ruthlessly breaks.',
  '## Subverted Trope Hook Generation — Genre Savvy / Exploiting Narratives

The charm of "Genre Savvy" lies in immediately derailing what should be a generic hero''s journey.

---

### Generation Guidelines

#### Identify the Cliché First
Start with an extremely common and recognizable fantasy or system trope.
Examples: A teenager summoned by a Kingdom to fight the Demon Lord; The naive fiancé of the cold Duke in a romance novel; A weak protagonist waking up with a useless "System".

#### The Pragmatic Subversion
The protagonist immediately acts like a rational adult who has read a hundred novels. They don''t follow the script.
Examples: Instead of accepting the King''s quest, they realize the King is an authoritarian dictator sending them to die for free. So they immediately betray the Kingdom, steal the royal treasury, and join the Demon Lord who offers a dental plan.

#### Narrative Retaliation
The world (or System) is a literal entity that hates deviations. How does it try to course-correct?
Examples: The "Plot" forcibly tries to throw tragic backstories at them, or violently spawns new generic heroes destined to hunt them down.',
  '## Subverted Trope Hook Generation — Genre Savvy / Exploiting Narratives

The charm of "Genre Savvy" lies in immediately derailing what should be a generic hero''s journey.

---

### Generation Guidelines

#### Identify the Cliché First
Start with an extremely common and recognizable fantasy or system trope.
Examples: A teenager summoned by a Kingdom to fight the Demon Lord; The naive fiancé of the cold Duke in a romance novel; A weak protagonist waking up with a useless "System".

#### The Pragmatic Subversion
The protagonist immediately acts like a rational adult who has read a hundred novels. They don''t follow the script.
Examples: Instead of accepting the King''s quest, they realize the King is an authoritarian dictator sending them to die for free. So they immediately betray the Kingdom, steal the royal treasury, and join the Demon Lord who offers a dental plan.

#### Narrative Retaliation
The world (or System) is a literal entity that hates deviations. How does it try to course-correct?
Examples: The "Plot" forcibly tries to throw tragic backstories at them, or violently spawns new generic heroes destined to hunt them down.',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'genre-savvy-rule-setting-gen',
  'Narrative Laws Generation: Defines the meta-rules of the universe that act as physical laws.',
  'Narrative Laws Generation: Defines the meta-rules of the universe that act as physical laws.',
  '## Narrative Laws Generation — Genre Savvy / Exploiting Narratives

In this world, tropes are not just writing tools—they are gravitational laws of reality.

---

### Generation Guidelines

#### Define the Trope as a Law of Physics
Pick a trope and make it literal.
Examples: "The Conservation of Ninjutsu" (1 minion is deadlier than 100 minions because power is divided). "The Villain Monologue Pause" (No one can attack a villain while they are explaining their dastardly plan).

#### The Exploit
How does the clever protagonist weaponize this rule?
Examples: The protagonist knows about the Ninja rule, so when attacking the Dark Lord, they bring ONLY ONE peasant allied with them, magically boosting that peasant''s combat ability to godhood. Or they monologue endlessly about their lunch to gain temporary invincibility until their reinforcements arrive.

#### The Consequence
Rule abuse attracts the universe''s attention. E.g., The universe slaps them with an "Overused Trope Penalty".',
  '## Narrative Laws Generation — Genre Savvy / Exploiting Narratives

In this world, tropes are not just writing tools—they are gravitational laws of reality.

---

### Generation Guidelines

#### Define the Trope as a Law of Physics
Pick a trope and make it literal.
Examples: "The Conservation of Ninjutsu" (1 minion is deadlier than 100 minions because power is divided). "The Villain Monologue Pause" (No one can attack a villain while they are explaining their dastardly plan).

#### The Exploit
How does the clever protagonist weaponize this rule?
Examples: The protagonist knows about the Ninja rule, so when attacking the Dark Lord, they bring ONLY ONE peasant allied with them, magically boosting that peasant''s combat ability to godhood. Or they monologue endlessly about their lunch to gain temporary invincibility until their reinforcements arrive.

#### The Consequence
Rule abuse attracts the universe''s attention. E.g., The universe slaps them with an "Overused Trope Penalty".',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'genre-savvy-style-setting-gen',
  'Tone & Style Generation: Sardonic black comedy emphasizing pragmatic solutions.',
  'Tone & Style Generation: Sardonic black comedy emphasizing pragmatic solutions.',
  '## Tone & Style Generation — Genre Savvy / Exploiting Narratives

---

### Generation Guidelines

Focus on the contrast between Epic High Fantasy/System elements and mundane, brutal bureaucracy or logistics.
- Do not use flowery, epic language to describe things unless the narrator is mocking it.
- Focus heavily on cause and effect. "The hero swung the Sword of Truth. It missed and hit a structural pillar, collapsing the roof on him."
- The inner monologue should be intensely calculating. The hero looks at a dragon and thinks about its caloric intake rather than its majesty.',
  '## Tone & Style Generation — Genre Savvy / Exploiting Narratives

---

### Generation Guidelines

Focus on the contrast between Epic High Fantasy/System elements and mundane, brutal bureaucracy or logistics.
- Do not use flowery, epic language to describe things unless the narrator is mocking it.
- Focus heavily on cause and effect. "The hero swung the Sword of Truth. It missed and hit a structural pillar, collapsing the roof on him."
- The inner monologue should be intensely calculating. The hero looks at a dragon and thinks about its caloric intake rather than its majesty.',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);


-- ============================================================================
-- 2. Character Gen Skills (-character-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'genre-savvy-character-gen',
  'Character Generation: Creates meta-aware pragmatists and blindly devoted trope caricatures.',
  'Character Generation: Creates meta-aware pragmatists and blindly devoted trope caricatures.',
  '## Character Archive Generation — Genre Savvy / Exploiting Narratives

Characters are either entirely trapped by their designated role or desperately trying to break out.

---

### Generation Guidelines

#### The Pragmatic Exploiter (Protagonist / Antagonist)
A character who understands they are in a story. They do not fight fair. They snipe wizards mid-incantation. They shoot the main character during an emotional flashback. They understand "Plot Armor" and build traps that completely bypass it (e.g., throwing the hero in concrete instead of a death laser).

#### The Cliché Victim (Foil Characters)
A character completely driven by tropes. The "Hot-headed Rival" who literally cannot stop themselves from challenging people to duels. The "Tragic Mentor" who is acutely aware they are destined to die coughing blood, but accepts it anyway.

#### Flaw and Subversion
Make the flaw fatal. If they are the "Hero", their absolute morality means they can be easily stalled by hostage situations. If they are a smart villain, they purposefully wear boring armor so the heroes don''t notice they are the final boss.',
  '## Character Archive Generation — Genre Savvy / Exploiting Narratives

Characters are either entirely trapped by their designated role or desperately trying to break out.

---

### Generation Guidelines

#### The Pragmatic Exploiter (Protagonist / Antagonist)
A character who understands they are in a story. They do not fight fair. They snipe wizards mid-incantation. They shoot the main character during an emotional flashback. They understand "Plot Armor" and build traps that completely bypass it (e.g., throwing the hero in concrete instead of a death laser).

#### The Cliché Victim (Foil Characters)
A character completely driven by tropes. The "Hot-headed Rival" who literally cannot stop themselves from challenging people to duels. The "Tragic Mentor" who is acutely aware they are destined to die coughing blood, but accepts it anyway.

#### Flaw and Subversion
Make the flaw fatal. If they are the "Hero", their absolute morality means they can be easily stalled by hostage situations. If they are a smart villain, they purposefully wear boring armor so the heroes don''t notice they are the final boss.',
  @method_id, 1, 21, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 3. Scene Gen Skills (-scene-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'genre-savvy-scene-gen',
  'Scene Generation: Cliché locations designed to host specific narrative beats, broken by the cast.',
  'Scene Generation: Cliché locations designed to host specific narrative beats, broken by the cast.',
  '## Scene & Location Generation — Genre Savvy / Exploiting Narratives

Places exist solely to serve the plot, and the protagonist knows exactly how to ruin it.

---

### Generation Guidelines

#### Identify the Narrative Function
What is this location for? E.g., The suspension bridge solely exists for a dramatic betrayal. The tavern exists for shadowy figures in corners to deliver quests.

#### The Pragmatic Deconstruction
How does a genre-savvy character view this place? They don''t see a mystical tavern; they see a poorly lit room full of unemployed mercenaries. They enter the Evil Overlord''s throne room and immediately notice terrible fire safety standards and lack of guardrails near the lava pits.
They then exploit these physical or narrative realities over the intended "epic" feeling.',
  '## Scene & Location Generation — Genre Savvy / Exploiting Narratives

Places exist solely to serve the plot, and the protagonist knows exactly how to ruin it.

---

### Generation Guidelines

#### Identify the Narrative Function
What is this location for? E.g., The suspension bridge solely exists for a dramatic betrayal. The tavern exists for shadowy figures in corners to deliver quests.

#### The Pragmatic Deconstruction
How does a genre-savvy character view this place? They don''t see a mystical tavern; they see a poorly lit room full of unemployed mercenaries. They enter the Evil Overlord''s throne room and immediately notice terrible fire safety standards and lack of guardrails near the lava pits.
They then exploit these physical or narrative realities over the intended "epic" feeling.',
  @method_id, 1, 22, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 4. Prop Gen Skills (-prop-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'genre-savvy-prop-gen',
  'Prop Generation: Generates macguffins, magical relics, and system items twisted for pragmatic uses.',
  'Prop Generation: Generates macguffins, magical relics, and system items twisted for pragmatic uses.',
  '## Prop & MacGuffin Generation — Genre Savvy / Exploiting Narratives

Weapons and items are ridiculous if put under the lens of logic. The pragmatic character abuses this.

---

### Generation Guidelines

#### The intended Epic Application
Create an item that belongs in a standard fantasy/system story.
Examples: A sword that instantly strikes down evil entities regardless of defenses. A ring of invisibility. A system bug item that gives +1 Agility every time you blink.

#### The Pragmatic Exploit
How does a munchkin (a rule-abuser) use this?
If a sword only strikes Evil, a savvy villain mounts it on a spinning motor; the blade constantly swings, stopping perfectly whenever an assassin (who meant them harm = evil) approaches, creating an automated radar defense system.
If an item grants immortality but causes immense pain, they slip it into an enemy''s pocket so the enemy cannot die while they are thrown into a volcano for eternity.',
  '## Prop & MacGuffin Generation — Genre Savvy / Exploiting Narratives

Weapons and items are ridiculous if put under the lens of logic. The pragmatic character abuses this.

---

### Generation Guidelines

#### The intended Epic Application
Create an item that belongs in a standard fantasy/system story.
Examples: A sword that instantly strikes down evil entities regardless of defenses. A ring of invisibility. A system bug item that gives +1 Agility every time you blink.

#### The Pragmatic Exploit
How does a munchkin (a rule-abuser) use this?
If a sword only strikes Evil, a savvy villain mounts it on a spinning motor; the blade constantly swings, stopping perfectly whenever an assassin (who meant them harm = evil) approaches, creating an automated radar defense system.
If an item grants immortality but causes immense pain, they slip it into an enemy''s pocket so the enemy cannot die while they are thrown into a volcano for eternity.',
  @method_id, 1, 23, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 5. Organization Gen Skills (-org-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'genre-savvy-org-gen',
  'Faction Generation: Generates highly irrational evil empires or frustratingly bureaucratic good churches.',
  'Faction Generation: Generates highly irrational evil empires or frustratingly bureaucratic good churches.',
  '## Faction & Organization Generation — Genre Savvy / Exploiting Narratives

---

### Generation Guidelines

#### The Faction''s Fatal Trope Flaw
Groups are defined by ridiculous systemic flaws introduced by the plot.
E.g., The "Dark Legion" promotes leaders exclusively through "killing your superior," meaning their generals are sociopathic but terrible at logistics. The "Holy Church" relies on Prophecy, so if the prophecy is delayed by rain, they do nothing.

#### The Pragmatic Reforms
A genre-savvy protagonist takes over and introduces terrifyingly boring common sense.
E.g., Implementing standard OSHA safety procedures in the villain''s lair so minions stop falling into acid pits. Ensuring guards patrol in pairs with walkie-talkies. Replacing "Evil Monologue" with "Shoot on Sight" protocols. This makes them astronomically more dangerous than any magical Dark Lord.',
  '## Faction & Organization Generation — Genre Savvy / Exploiting Narratives

---

### Generation Guidelines

#### The Faction''s Fatal Trope Flaw
Groups are defined by ridiculous systemic flaws introduced by the plot.
E.g., The "Dark Legion" promotes leaders exclusively through "killing your superior," meaning their generals are sociopathic but terrible at logistics. The "Holy Church" relies on Prophecy, so if the prophecy is delayed by rain, they do nothing.

#### The Pragmatic Reforms
A genre-savvy protagonist takes over and introduces terrifyingly boring common sense.
E.g., Implementing standard OSHA safety procedures in the villain''s lair so minions stop falling into acid pits. Ensuring guards patrol in pairs with walkie-talkies. Replacing "Evil Monologue" with "Shoot on Sight" protocols. This makes them astronomically more dangerous than any magical Dark Lord.',
  @method_id, 1, 25, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 6. Plot Gen Skills (-plot-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'genre-savvy-plot-gen',
  'Plot Design: Focuses on narrative escalation where tropes are weapons instead of story beats.',
  'Plot Design: Focuses on narrative escalation where tropes are weapons instead of story beats.',
  '## Plot Design Domain Knowledge — Genre Savvy / Exploiting Narratives

The plot does not follow the Hero''s Journey; it is a battle of wits against the Narrative itself.

---

### Typical Story Structure
1. **The Awakening / System Bug**: The protagonist realizes they are in a story (via reincarnation, a system interface, or sheer deduction). They recognize their destined failure (e.g. they are the villain meant to die in Chapter 3).
2. **First Subversion & System Retaliation**: They aggressively dodge their fateful encounter (e.g., they assassinate the Hero while he is a baby). The World/System responds violently by forcing coincidences to put the protagonist back in danger, creating "Plot Armor" for new antagonists.
3. **Escalation of Meta-Rules**: The story turns into a legal/tactical battle of exploiting rules. Finding loopholes in ancient curses, abusing system economy mechanics, min-maxing stats in absurd ways. Both sides use narrative momentum as a resource.
4. **The Ultimate Checkmate**: The climax involves putting the antagonists in a situation where their own Plot Armor and tropes guarantee their destruction. E.g., The protagonist forces the Hero into a "Tragic Sacrifice" scenario where the Hero''s absolute morality compells the Hero to jump into a volcano to save a kitten.

### Common Errors
- ❌ Reverting to a generic OP power fantasy. The protagonist shouldn''t just hit harder; they should cheat smarter.',
  '## Plot Design Domain Knowledge — Genre Savvy / Exploiting Narratives

The plot does not follow the Hero''s Journey; it is a battle of wits against the Narrative itself.

---

### Typical Story Structure
1. **The Awakening / System Bug**: The protagonist realizes they are in a story (via reincarnation, a system interface, or sheer deduction). They recognize their destined failure (e.g. they are the villain meant to die in Chapter 3).
2. **First Subversion & System Retaliation**: They aggressively dodge their fateful encounter (e.g., they assassinate the Hero while he is a baby). The World/System responds violently by forcing coincidences to put the protagonist back in danger, creating "Plot Armor" for new antagonists.
3. **Escalation of Meta-Rules**: The story turns into a legal/tactical battle of exploiting rules. Finding loopholes in ancient curses, abusing system economy mechanics, min-maxing stats in absurd ways. Both sides use narrative momentum as a resource.
4. **The Ultimate Checkmate**: The climax involves putting the antagonists in a situation where their own Plot Armor and tropes guarantee their destruction. E.g., The protagonist forces the Hero into a "Tragic Sacrifice" scenario where the Hero''s absolute morality compells the Hero to jump into a volcano to save a kitten.

### Common Errors
- ❌ Reverting to a generic OP power fantasy. The protagonist shouldn''t just hit harder; they should cheat smarter.',
  @method_id, 1, 30, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 7. Entity Naming Skills (-entity-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'genre-savvy-entity-naming',
  'Entity Naming: Names that are either obnoxiously epic to mock tropes, or brutally mundane.',
  'Entity Naming: Names that are either obnoxiously epic to mock tropes, or brutally mundane.',
  '## Entity Naming — Genre Savvy / Exploiting Narratives

Names in this genre play heavily on expectations. They are either absurdly caricatured to highlight the trope, or disappointingly mundane to ground the reality.

---

## 1. Character Names
- **The "Epic" Cast:** Needlessly complex and edgy. E.g., Excaliburius the Pure, Lord Darkskull the Annihilator, Prince Charming IV.
- **The Genre-Savvy Cast:** Distinctly mundane or cynical. E.g., Bob the Pragmatic Necromancer, Catherine Foundling, Logistics Officer Smith.

## 2. Location Names
- Overly descriptive plot-places: The Forbidden Forest of Infinite Respawns, The Doomed Starting Village.

## 3. Abilities & Spells
The naming scheme should transition from generic to highly specific or legally airtight.
- *Generic:* "Blast of Doom"
- *Pragmatic:* "Localized Kinetic Transfer (Level 3 Area Denial)" or "Skill: Interrupt Monologue".',
  '## Entity Naming — Genre Savvy / Exploiting Narratives

Names in this genre play heavily on expectations. They are either absurdly caricatured to highlight the trope, or disappointingly mundane to ground the reality.

---

## 1. Character Names
- **The "Epic" Cast:** Needlessly complex and edgy. E.g., Excaliburius the Pure, Lord Darkskull the Annihilator, Prince Charming IV.
- **The Genre-Savvy Cast:** Distinctly mundane or cynical. E.g., Bob the Pragmatic Necromancer, Catherine Foundling, Logistics Officer Smith.

## 2. Location Names
- Overly descriptive plot-places: The Forbidden Forest of Infinite Respawns, The Doomed Starting Village.

## 3. Abilities & Spells
The naming scheme should transition from generic to highly specific or legally airtight.
- *Generic:* "Blast of Doom"
- *Pragmatic:* "Localized Kinetic Transfer (Level 3 Area Denial)" or "Skill: Interrupt Monologue".',
  @method_id, 1, 36, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 8. Narrative Skills (-narrative)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'genre-savvy-narrative',
  'Narrative Guidance: A guide on writing dry, cynical commentary during magical duels and epic encounters.',
  'Narrative Guidance: A guide on writing dry, cynical commentary during magical duels and epic encounters.',
  '## Narrative Writing Guidance — Genre Savvy / Exploiting Narratives

The writing style should completely destroy the "cool factor" of traditional fantasy by exposing its practical flaws.

---

### 1. Deflating the Epic
Whenever an opponent strikes a cool pose or yells their ultimate attack name, the protagonist should immediately analyze how stupid it is.
*Example:* "The Paladin raised his glowing sword, screaming the name of his god. It was a very impressive light show. Unfortunately, screaming took roughly three seconds, and my crossbow bolt took about zero point five seconds to cross the room. The glowing stopped."

### 2. Emphasizing the Logistics of Magic/Systems
Use a clinical, almost spreadsheet-like approach to mystical phenomena.
*Example:* "The Demon King''s army of a million skeletons was a terrifying concept, until you realized that skeletons have zero mass to push a siege engine and break perfectly under blunt force trauma. I just ordered my men to hand out hammers and let gravity do the work."

### 3. Fourth-Wall Breaching Humor (But Kept in Character)
The character shouldn''t literally talk to the reader ("Hey reader"), but they should talk to the universe''s tropes.
*Example:* "I felt the sudden urge to explain my entire master plan to the captured spy. Recognizing this as the Terminal Villain Monologue Syndrome, I bit my tongue so hard it bled and shot him instead."',
  '## Narrative Writing Guidance — Genre Savvy / Exploiting Narratives

The writing style should completely destroy the "cool factor" of traditional fantasy by exposing its practical flaws.

---

### 1. Deflating the Epic
Whenever an opponent strikes a cool pose or yells their ultimate attack name, the protagonist should immediately analyze how stupid it is.
*Example:* "The Paladin raised his glowing sword, screaming the name of his god. It was a very impressive light show. Unfortunately, screaming took roughly three seconds, and my crossbow bolt took about zero point five seconds to cross the room. The glowing stopped."

### 2. Emphasizing the Logistics of Magic/Systems
Use a clinical, almost spreadsheet-like approach to mystical phenomena.
*Example:* "The Demon King''s army of a million skeletons was a terrifying concept, until you realized that skeletons have zero mass to push a siege engine and break perfectly under blunt force trauma. I just ordered my men to hand out hammers and let gravity do the work."

### 3. Fourth-Wall Breaching Humor (But Kept in Character)
The character shouldn''t literally talk to the reader ("Hey reader"), but they should talk to the universe''s tropes.
*Example:* "I felt the sudden urge to explain my entire master plan to the captured spy. Recognizing this as the Terminal Villain Monologue Syndrome, I bit my tongue so hard it bled and shot him instead."',
  @method_id, 1, 101, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 9. Novel Naming Skills (-novel-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'genre-savvy-novel-naming',
  'Novel Naming: Generates cynical, self-aware titles outlining the pragmatic subversion of a trope.',
  'Novel Naming: Generates cynical, self-aware titles outlining the pragmatic subversion of a trope.',
  '## Novel Naming — Genre Savvy / Exploiting Narratives

Titles in this genre are often long, highly descriptive, and extremely cynical, reading like an instruction manual or a frustrated diary entry.

---

### Common Title Formats

**Format 1: The Practical Guide**
- A scholarly or bureaucratic term applied to something mystical.
- Examples: *A Practical Guide to Evil*, *The Rules of Supervillainy*, *Logistics of a Demon Lord*.

**Format 2: The Action Subversion (Light Novel Style)**
- A long sentence detailing exact trope subversion.
- Examples: *I Reincarnated as the Villainess So I Preemptively Assassinated the Hero*, *The Hero is Overpowered but Overly Cautious*.

### Synopsis Structure
The synopsis should start with the standard cliché, immediately followed by a hard cut to the protagonist''s cynical reality.
*Example:*
"I was summoned to a magical world of elves and dragons to defeat the Dark Lord. According to the King, I am the Chosen One, blessed by the Goddess of Light.
That''s great and all, but the King just sent me out with zero armor, a rusty sword, and a party consisting of an alcoholic priest and a thief who literally steals from my own pockets. I''m refusing the quest. Instead, I''m using my modern accounting degree to exploit this world''s broken merchant gold system, buy the Dark Lord''s castle through hostile corporate takeover, and fire the King. Let''s be practical about this."',
  '## Novel Naming — Genre Savvy / Exploiting Narratives

Titles in this genre are often long, highly descriptive, and extremely cynical, reading like an instruction manual or a frustrated diary entry.

---

### Common Title Formats

**Format 1: The Practical Guide**
- A scholarly or bureaucratic term applied to something mystical.
- Examples: *A Practical Guide to Evil*, *The Rules of Supervillainy*, *Logistics of a Demon Lord*.

**Format 2: The Action Subversion (Light Novel Style)**
- A long sentence detailing exact trope subversion.
- Examples: *I Reincarnated as the Villainess So I Preemptively Assassinated the Hero*, *The Hero is Overpowered but Overly Cautious*.

### Synopsis Structure
The synopsis should start with the standard cliché, immediately followed by a hard cut to the protagonist''s cynical reality.
*Example:*
"I was summoned to a magical world of elves and dragons to defeat the Dark Lord. According to the King, I am the Chosen One, blessed by the Goddess of Light.
That''s great and all, but the King just sent me out with zero armor, a rusty sword, and a party consisting of an alcoholic priest and a thief who literally steals from my own pockets. I''m refusing the quest. Instead, I''m using my modern accounting degree to exploit this world''s broken merchant gold system, buy the Dark Lord''s castle through hostile corporate takeover, and fire the King. Let''s be practical about this."',
  @method_id, 1, 35, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);
