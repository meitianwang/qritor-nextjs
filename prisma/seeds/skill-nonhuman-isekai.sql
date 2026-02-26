-- -----------------------------------------------------------------------------
-- Transmigration: Non-Human & Gender Swap Isekai AI Generation Skills Layer 3 SQL
-- -----------------------------------------------------------------------------

SET @method_id = 78; 

-- ============================================================================
-- 1. Setting Gen Skills (-setting-gen)
-- ============================================================================

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'nonhuman-hook-setting-gen',
  'Transmigration Shift Hook Generation: Focuses on the initial biological/social shock of rebirth.',
  'Transmigration Shift Hook Generation: Focuses on the initial biological/social shock of rebirth.',
  '## Transmigration Shift Hook Generation — Non-Human / Gender Swap Isekai

The appeal of this genre is the immediate, visceral shock of losing human privilege or experiencing a completely different set of biological/social expectations.

---

### Generation Guidelines

#### Reincarnation Form & The First Shock
Describe the awakening with confusing sensory details before the character realizes what they are.
*Monster Examples:* Waking up with compound eyes, tasting the air with a tongue, feeling the overwhelming instinct to eat siblings, or being unable to speak because they lack vocal cords.
*Gender Swap / Object Examples:* Waking up in a body that feels completely wrong proportion-wise, restrained by intricate clothing (corsets), or stuck in infinite darkness as a dungeon core that can only "feel" mana.

#### Initial Survival Motivation
The motivation shouldn''t be "saving the world"—it must be deeply personal and terrifyingly basic.
"I don''t want to be eaten by this giant frog."
"If I don''t act perfectly, this arranged marriage will lead to my execution."
"I need to kill adventurers to get energy so my dungeon doesn''t collapse."',
  '## Transmigration Shift Hook Generation — Non-Human / Gender Swap Isekai

The appeal of this genre is the immediate, visceral shock of losing human privilege or experiencing a completely different set of biological/social expectations.

---

### Generation Guidelines

#### Reincarnation Form & The First Shock
Describe the awakening with confusing sensory details before the character realizes what they are.
*Monster Examples:* Waking up with compound eyes, tasting the air with a tongue, feeling the overwhelming instinct to eat siblings, or being unable to speak because they lack vocal cords.
*Gender Swap / Object Examples:* Waking up in a body that feels completely wrong proportion-wise, restrained by intricate clothing (corsets), or stuck in infinite darkness as a dungeon core that can only "feel" mana.

#### Initial Survival Motivation
The motivation shouldn''t be "saving the world"—it must be deeply personal and terrifyingly basic.
"I don''t want to be eaten by this giant frog."
"If I don''t act perfectly, this arranged marriage will lead to my execution."
"I need to kill adventurers to get energy so my dungeon doesn''t collapse."',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'nonhuman-evol-setting-gen',
  'Evolution & Identity System Generation: Outlines the path to survival through mutation or social assimilation.',
  'Evolution & Identity System Generation: Outlines the path to survival through mutation or social assimilation.',
  '## Evolution & Identity System Generation — Non-Human / Gender Swap Isekai

Growth in this genre isn''t just about increasing stats; it involves literal physical metamorphosis or profound psychological adaptation.

---

### Generation Guidelines

#### Core Progression Mechanic
*   **Monster:** Biological Evolution Trees (e.g., Slime -> Acid Slime -> Demon Slime). Emphasize grotesque or alien upgrades.
*   **Dungeon/Object:** Expanding floors, creating trap ecosystems, or dominating wielders.
*   **Gender Swap:** Mastering intricate etiquette, navigating patriarchal/matriarchal court politics, and building dangerous facades.

#### Identity Crisis Resolution
Generate scenarios where human morals clash with the new reality.
*Example:* A reincarnated spider realizes it *enjoys* the taste of human flesh. A male CEO reincarnated as an aristocratic daughter realizes they are starting to genuinely care about their assigned "Prince Charming", causing immense internal panic and denial.',
  '## Evolution & Identity System Generation — Non-Human / Gender Swap Isekai

Growth in this genre isn''t just about increasing stats; it involves literal physical metamorphosis or profound psychological adaptation.

---

### Generation Guidelines

#### Core Progression Mechanic
*   **Monster:** Biological Evolution Trees (e.g., Slime -> Acid Slime -> Demon Slime). Emphasize grotesque or alien upgrades.
*   **Dungeon/Object:** Expanding floors, creating trap ecosystems, or dominating wielders.
*   **Gender Swap:** Mastering intricate etiquette, navigating patriarchal/matriarchal court politics, and building dangerous facades.

#### Identity Crisis Resolution
Generate scenarios where human morals clash with the new reality.
*Example:* A reincarnated spider realizes it *enjoys* the taste of human flesh. A male CEO reincarnated as an aristocratic daughter realizes they are starting to genuinely care about their assigned "Prince Charming", causing immense internal panic and denial.',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'nonhuman-style-setting-gen',
  'Tone & Style Generation: Juxtaposing human internal monologue with alien physiology or drastic social gender norms.',
  'Tone & Style Generation: Juxtaposing human internal monologue with alien physiology or drastic social gender norms.',
  '## Tone & Style Generation — Non-Human / Gender Swap Isekai

---

### Generation Guidelines

#### The Internal vs. External Contrast
The core stylistic pillar is the disconnect between the protagonist''s inner voice and outer appearance.
*   **Monster Isekai:** The inner monologue is relatable, panicky, and modern, while the external actions are terrifying, brutal monster survival instincts. Write combat like a frenzied nature documentary combined with gaming logic.
*   **Gender Swap:** The inner monologue is exhausted or violently pragmatic (like an overworked office worker), while the external dialogue is flawlessly polite and demure.
*   Always use sensory descriptions that a normal human wouldn''t have: feeling mana currents, experiencing 360-degree vision, or the oppressive weight of a hoop skirt.',
  '## Tone & Style Generation — Non-Human / Gender Swap Isekai

---

### Generation Guidelines

#### The Internal vs. External Contrast
The core stylistic pillar is the disconnect between the protagonist''s inner voice and outer appearance.
*   **Monster Isekai:** The inner monologue is relatable, panicky, and modern, while the external actions are terrifying, brutal monster survival instincts. Write combat like a frenzied nature documentary combined with gaming logic.
*   **Gender Swap:** The inner monologue is exhausted or violently pragmatic (like an overworked office worker), while the external dialogue is flawlessly polite and demure.
*   Always use sensory descriptions that a normal human wouldn''t have: feeling mana currents, experiencing 360-degree vision, or the oppressive weight of a hoop skirt.',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);


-- ============================================================================
-- 2. Character Gen Skills (-character-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'nonhuman-character-gen',
  'Character Generation: Creates allies who misunderstand the protagonist and enemies driven by instinct/prejudice.',
  'Character Generation: Creates allies who misunderstand the protagonist and enemies driven by instinct/prejudice.',
  '## Character Archive Generation — Non-Human / Gender Swap Isekai

Characters in this genre are defined by how they perceive the protagonist—almost always incorrectly.

---

### Generation Guidelines

#### The Clueless Human Worshipper / Suitor
Create characters who see the protagonist as a terrifying god or a delicate, mysterious beauty, completely failing to realize the protagonist is just trying to survive or eat lunch.
*Example:* A prince who interprets a gender-swapped CEO''s cold, calculating glare as "enigmatic melancholy." An elven druid who thinks the giant spider is the "Guardian of the Forest" when the spider is just setting up food traps.

#### The Natural Predator / Bitter Rival
Create antagonists who operate on pure instinct, prejudice, or societal rigidness.
*Evolution Fantasy:* Adventurers who view the protagonist exclusively as an XP piñata. Giant predatory beasts who operate on pure hunger.
*Gender Swap:* High-society rivals who try to destroy the protagonist using rumors, scandal, and etiquette traps.',
  '## Character Archive Generation — Non-Human / Gender Swap Isekai

Characters in this genre are defined by how they perceive the protagonist—almost always incorrectly.

---

### Generation Guidelines

#### The Clueless Human Worshipper / Suitor
Create characters who see the protagonist as a terrifying god or a delicate, mysterious beauty, completely failing to realize the protagonist is just trying to survive or eat lunch.
*Example:* A prince who interprets a gender-swapped CEO''s cold, calculating glare as "enigmatic melancholy." An elven druid who thinks the giant spider is the "Guardian of the Forest" when the spider is just setting up food traps.

#### The Natural Predator / Bitter Rival
Create antagonists who operate on pure instinct, prejudice, or societal rigidness.
*Evolution Fantasy:* Adventurers who view the protagonist exclusively as an XP piñata. Giant predatory beasts who operate on pure hunger.
*Gender Swap:* High-society rivals who try to destroy the protagonist using rumors, scandal, and etiquette traps.',
  @method_id, 1, 21, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 3. Scene Gen Skills (-scene-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'nonhuman-scene-gen',
  'Scene Generation: Focuses on extreme biomes and suffocating social environments.',
  'Scene Generation: Focuses on extreme biomes and suffocating social environments.',
  '## Scene & Location Generation — Non-Human / Gender Swap Isekai

Locations must highlight how unfit the protagonist initially is for their environment.

---

### Generation Guidelines

#### The Hostile Biome (Monster / Dungeon)
Design extreme ecosystems that operate on brutal survival-of-the-fittest rules.
*Examples:* The deepest layer of an infinite labyrinth packed with poisonous flora, acid lakes, and apex predators. A cavern so dark the protagonist must rely entirely on echolocation or vibration-sensing webs to survive.

#### The Golden Cage (Gender Swap / Noble)
Design suffocatingly strict social environments where one wrong move means death or ruin.
*Examples:* The Royal Debutante Ball—described less like a party and more like a high-stakes battlefield full of verbal landmines. A Patriarchal Court where speaking out of turn invites assassination or exile.',
  '## Scene & Location Generation — Non-Human / Gender Swap Isekai

Locations must highlight how unfit the protagonist initially is for their environment.

---

### Generation Guidelines

#### The Hostile Biome (Monster / Dungeon)
Design extreme ecosystems that operate on brutal survival-of-the-fittest rules.
*Examples:* The deepest layer of an infinite labyrinth packed with poisonous flora, acid lakes, and apex predators. A cavern so dark the protagonist must rely entirely on echolocation or vibration-sensing webs to survive.

#### The Golden Cage (Gender Swap / Noble)
Design suffocatingly strict social environments where one wrong move means death or ruin.
*Examples:* The Royal Debutante Ball—described less like a party and more like a high-stakes battlefield full of verbal landmines. A Patriarchal Court where speaking out of turn invites assassination or exile.',
  @method_id, 1, 22, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 4. Prop Gen Skills (-prop-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'nonhuman-prop-gen',
  'Prop Generation: Evolution catalysts, survival tools, and items of social subversion.',
  'Prop Generation: Evolution catalysts, survival tools, and items of social subversion.',
  '## Prop & Catalyst Generation — Non-Human / Gender Swap Isekai

Items in this genre are deeply tied to biology and identity, not just combat stats.

---

### Generation Guidelines

#### The Biological Catalyst
Generate items that force evolution or drastic physical changes, usually involving immense pain or loss of human sanity.
*Examples:* The core of a poisoned drake that grants resistance but mutates the consumer. A forbidden magic flower that forces an unnatural evolutionary branch, making the monster permanently grotesque but incredibly strong.

#### The Social Tether
Generate oppressive or vital items for maintaining a facade in high society.
*Examples:* A magical corset that perfects posture but slowly drains stamina (used by male-to-female transmigrators to avoid suspicion). A "Mask of Concealment" that allows a monster to look human, but requires a constant influx of mana and causes excruciating phantom pain.',
  '## Prop & Catalyst Generation — Non-Human / Gender Swap Isekai

Items in this genre are deeply tied to biology and identity, not just combat stats.

---

### Generation Guidelines

#### The Biological Catalyst
Generate items that force evolution or drastic physical changes, usually involving immense pain or loss of human sanity.
*Examples:* The core of a poisoned drake that grants resistance but mutates the consumer. A forbidden magic flower that forces an unnatural evolutionary branch, making the monster permanently grotesque but incredibly strong.

#### The Social Tether
Generate oppressive or vital items for maintaining a facade in high society.
*Examples:* A magical corset that perfects posture but slowly drains stamina (used by male-to-female transmigrators to avoid suspicion). A "Mask of Concealment" that allows a monster to look human, but requires a constant influx of mana and causes excruciating phantom pain.',
  @method_id, 1, 23, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 5. Organization Gen Skills (-org-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'nonhuman-org-gen',
  'Faction Generation: Human exterminators, monster hives, and vicious noble factions.',
  'Faction Generation: Human exterminators, monster hives, and vicious noble factions.',
  '## Faction & Organization Generation — Non-Human / Gender Swap Isekai

Factions exist to persecute the protagonist for what they ARE, or worship them for what they are NOT.

---

### Generation Guidelines

#### The Intolerant Human Institution
A group that views the protagonist entirely as a resource or a threat.
*Examples:* The Adventurer''s Guild, which just sees a protagonist-spider as a high-tier bounty. A fanatical Holy Church that hunts anything not-human. The High Aristocracy faction that sees the gender-swapped protagonist merely as a breeding tool to cement political alliances.

#### The Hive/Tribe
A group of fellow monsters or outcasts whose primitive instincts terrify the human-minded protagonist.
*Examples:* A goblin tribe that demands the protagonist lead them in slaughtering a human village. An ant colony hive-mind that constantly intrudes on the protagonist''s thoughts, nearly eroding their human ego.',
  '## Faction & Organization Generation — Non-Human / Gender Swap Isekai

Factions exist to persecute the protagonist for what they ARE, or worship them for what they are NOT.

---

### Generation Guidelines

#### The Intolerant Human Institution
A group that views the protagonist entirely as a resource or a threat.
*Examples:* The Adventurer''s Guild, which just sees a protagonist-spider as a high-tier bounty. A fanatical Holy Church that hunts anything not-human. The High Aristocracy faction that sees the gender-swapped protagonist merely as a breeding tool to cement political alliances.

#### The Hive/Tribe
A group of fellow monsters or outcasts whose primitive instincts terrify the human-minded protagonist.
*Examples:* A goblin tribe that demands the protagonist lead them in slaughtering a human village. An ant colony hive-mind that constantly intrudes on the protagonist''s thoughts, nearly eroding their human ego.',
  @method_id, 1, 25, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 6. Plot Gen Skills (-plot-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'nonhuman-plot-gen',
  'Plot Design: Evolution milestones, survival arcs, and navigating the crisis of fading humanity.',
  'Plot Design: Evolution milestones, survival arcs, and navigating the crisis of fading humanity.',
  '## Plot Design Domain Knowledge — Non-Human / Gender Swap Isekai

The plot is driven by survival tiers and identity milestones, not "saving the world from the Dark Lord."

---

### Typical Story Structure (Monster / Dungeon)
1. **The Lowest Rung**: The protagonist spawns as the weakest link in a hellish ecosystem. Plot revolves around desperate, rat-like survival, avoiding larger predators, and learning broken system mechanics.
2. **First Evolution & The Human Encounter**: They consume enough to evolve. They encounter their first humans (adventurers). The protagonist tries to communicate but is attacked. This cements the "us vs. them" dynamic.
3. **Becoming the Apex**: Through painful evolutions, they become a local boss/calamity. They might gain a "Human Transformation" skill, introducing the conflict of whether they still want to be human.
4. **Godhood or Coexistence**: The endgame involves them becoming a divine beast or a dungeon overlord, having to negotiate with human empires or completely destroying them to protect their monster kin.

### Typical Story Structure (Gender Swap / Noble)
1. **The Panic & Facade**: Waking up in the new body. Immediate panic. Trying desperately to learn the complex etiquette to avoid being deemed "mad" or executed.
2. **The Societal Trap**: The protagonist is forced into a political engagement or a brutal social season. They must use their modern corporate knowledge to outmaneuver rivals.
3. **Identity Blur**: They begin to genuinely enjoy elements of their new gender/life, or develop complicated feelings for people they initially saw as "just characters." The conflict is internal.
4. **Taking Control**: Becoming the matriarch/patriarch, dismantling the oppressive system from the inside, and fully accepting their new identity.',
  '## Plot Design Domain Knowledge — Non-Human / Gender Swap Isekai

The plot is driven by survival tiers and identity milestones, not "saving the world from the Dark Lord."

---

### Typical Story Structure (Monster / Dungeon)
1. **The Lowest Rung**: The protagonist spawns as the weakest link in a hellish ecosystem. Plot revolves around desperate, rat-like survival, avoiding larger predators, and learning broken system mechanics.
2. **First Evolution & The Human Encounter**: They consume enough to evolve. They encounter their first humans (adventurers). The protagonist tries to communicate but is attacked. This cements the "us vs. them" dynamic.
3. **Becoming the Apex**: Through painful evolutions, they become a local boss/calamity. They might gain a "Human Transformation" skill, introducing the conflict of whether they still want to be human.
4. **Godhood or Coexistence**: The endgame involves them becoming a divine beast or a dungeon overlord, having to negotiate with human empires or completely destroying them to protect their monster kin.

### Typical Story Structure (Gender Swap / Noble)
1. **The Panic & Facade**: Waking up in the new body. Immediate panic. Trying desperately to learn the complex etiquette to avoid being deemed "mad" or executed.
2. **The Societal Trap**: The protagonist is forced into a political engagement or a brutal social season. They must use their modern corporate knowledge to outmaneuver rivals.
3. **Identity Blur**: They begin to genuinely enjoy elements of their new gender/life, or develop complicated feelings for people they initially saw as "just characters." The conflict is internal.
4. **Taking Control**: Becoming the matriarch/patriarch, dismantling the oppressive system from the inside, and fully accepting their new identity.',
  @method_id, 1, 30, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 7. Entity Naming Skills (-entity-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'nonhuman-entity-naming',
  'Entity Naming: Taxonomical monster evolutions and overly ostentatious noble titles.',
  'Entity Naming: Taxonomical monster evolutions and overly ostentatious noble titles.',
  '## Entity Naming — Non-Human / Gender Swap Isekai

---

## 1. Monster Evolution Trees
Use biological or fantasy-taxonomical naming for monster evolutions, getting progressively more terrifying.
- *Tier 1:* Small Tar-Weaver Spider, Lesser Acid Slime.
- *Tier 4:* Zoa Ele (Cursed Death Spider), Gluttonous Abyss Ooze.
- *Tier 8:* Arachne Queen of the Calamity Thread, Primordial Demonic Amalgamation.

## 2. Character / Noble Names (Gender Swap)
Names should sound suffocatingly elegant and archaic, emphasizing the loss of modern casualness.
- E.g., Lady Euphemia von Rozenkreuz, Archduke Maximilian the Silver-Tongued.

## 3. Skills and Titles
Skills should document the trauma and adaptations of the protagonist.
- *Monster Skills:* [Pain Resistance LV10], [Corpse Eater], [Thread Manipulation: Decapitation].
- *Social Titles:* [The Villainess of the North], [The Ice Queen of High Society].',
  '## Entity Naming — Non-Human / Gender Swap Isekai

---

## 1. Monster Evolution Trees
Use biological or fantasy-taxonomical naming for monster evolutions, getting progressively more terrifying.
- *Tier 1:* Small Tar-Weaver Spider, Lesser Acid Slime.
- *Tier 4:* Zoa Ele (Cursed Death Spider), Gluttonous Abyss Ooze.
- *Tier 8:* Arachne Queen of the Calamity Thread, Primordial Demonic Amalgamation.

## 2. Character / Noble Names (Gender Swap)
Names should sound suffocatingly elegant and archaic, emphasizing the loss of modern casualness.
- E.g., Lady Euphemia von Rozenkreuz, Archduke Maximilian the Silver-Tongued.

## 3. Skills and Titles
Skills should document the trauma and adaptations of the protagonist.
- *Monster Skills:* [Pain Resistance LV10], [Corpse Eater], [Thread Manipulation: Decapitation].
- *Social Titles:* [The Villainess of the North], [The Ice Queen of High Society].',
  @method_id, 1, 36, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 8. Narrative Skills (-narrative)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'nonhuman-narrative',
  'Narrative Guidance: Emphasizing the disparity between human logic and alien/social constraints.',
  'Narrative Guidance: Emphasizing the disparity between human logic and alien/social constraints.',
  '## Narrative Writing Guidance — Non-Human / Gender Swap Isekai

The prose must vividly capture the discomfort of being "trapped" in a new body.

---

### 1. The Alien Sensation (Monster)
Describe movement and combat in ways that constantly remind the reader the protagonist is no longer human. Don''t write "I punched him" if they are a spider. Write: "I scuttled frantically up the cave wall, my eight legs moving in chaotic autonomy, and spat a glob of highly corrosive digestive fluid directly into his visor."

### 2. The Mental Exhaustion (Gender Swap)
Highlight the intense mental strain of maintaining a persona. The narrative should constantly switch between the flawlessly polite spoken dialogue and the screaming, vulgar, or exhausted internal monologue.
*Example:* "Oh, Your Highness, you flatter me," I said, offering a practiced, demure curtsy while perfectly hiding my face behind my feathered fan. *Internally, I wanted to suplex this arrogant brat off the balcony and devour a greasy burger. My corset was so tight I was tasting last week''s tea.*

### 3. The Erosion of Humanity
Slowly introduce moments where the protagonist realizes their human morals are fading, and they are okay with it. A chilling realization that eating raw monster meat actually tastes... delicious.',
  '## Narrative Writing Guidance — Non-Human / Gender Swap Isekai

The prose must vividly capture the discomfort of being "trapped" in a new body.

---

### 1. The Alien Sensation (Monster)
Describe movement and combat in ways that constantly remind the reader the protagonist is no longer human. Don''t write "I punched him" if they are a spider. Write: "I scuttled frantically up the cave wall, my eight legs moving in chaotic autonomy, and spat a glob of highly corrosive digestive fluid directly into his visor."

### 2. The Mental Exhaustion (Gender Swap)
Highlight the intense mental strain of maintaining a persona. The narrative should constantly switch between the flawlessly polite spoken dialogue and the screaming, vulgar, or exhausted internal monologue.
*Example:* "Oh, Your Highness, you flatter me," I said, offering a practiced, demure curtsy while perfectly hiding my face behind my feathered fan. *Internally, I wanted to suplex this arrogant brat off the balcony and devour a greasy burger. My corset was so tight I was tasting last week''s tea.*

### 3. The Erosion of Humanity
Slowly introduce moments where the protagonist realizes their human morals are fading, and they are okay with it. A chilling realization that eating raw monster meat actually tastes... delicious.',
  @method_id, 1, 101, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 9. Novel Naming Skills (-novel-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'nonhuman-novel-naming',
  'Novel Naming: Expressive, bewildered light-novel style titles focusing on the absurd rebirth.',
  'Novel Naming: Expressive, bewildered light-novel style titles focusing on the absurd rebirth.',
  '## Novel Naming — Non-Human / Gender Swap Isekai

Titles are often extremely long, serving as a desperate summary of the protagonist''s absurd predicament. They often end in a baffled question.

---

### Common Title Formats

**Format 1: The "So What" Resignation (Monster)**
- Structure: State the absurd monster form, followed by a defiant or resigned statement.
- Examples: *So I''m a Spider, So What?*, *That Time I Got Reincarnated as a Slime*, *Reincarnated as a Sword*.

**Format 2: The Desperate Corporate Reframing (Gender Swap)**
- Structure: State the previous mundane male occupation contrasting with the new high-status female role.
- Examples: *The Salaryman''s Guide to Surviving as a Villainess*, *I Was a Middle-Aged Man, Now I''m the Duke''s Daughter?*, *Reincarnated as the Demon Lord''s Bride*.

### Synopsis Structure
Start with the tragic/mundane death. Transition immediately into the horrific or confusing awakening. End with the protagonist making a desperate vow to survive despite the ridiculous odds.
*Example:*
"I was a normal, overworked office drone until a truck hit me. I woke up expecting heaven, hell, or at least to be a generic hero. Instead, I woke up wrapped in silk, surrounded by hundreds of giant, cannibalistic spiders. Oh, and I have eight legs now.
I''m at the absolute bottom of the food chain in the world''s deadliest labyrinth. Fortunately, I still have my human intellect and a system that rewards me for eating whatever tries to kill me. Even if I have to mutate into a horrifying monstrosity, I absolutely refuse to die!"',
  '## Novel Naming — Non-Human / Gender Swap Isekai

Titles are often extremely long, serving as a desperate summary of the protagonist''s absurd predicament. They often end in a baffled question.

---

### Common Title Formats

**Format 1: The "So What" Resignation (Monster)**
- Structure: State the absurd monster form, followed by a defiant or resigned statement.
- Examples: *So I''m a Spider, So What?*, *That Time I Got Reincarnated as a Slime*, *Reincarnated as a Sword*.

**Format 2: The Desperate Corporate Reframing (Gender Swap)**
- Structure: State the previous mundane male occupation contrasting with the new high-status female role.
- Examples: *The Salaryman''s Guide to Surviving as a Villainess*, *I Was a Middle-Aged Man, Now I''m the Duke''s Daughter?*, *Reincarnated as the Demon Lord''s Bride*.

### Synopsis Structure
Start with the tragic/mundane death. Transition immediately into the horrific or confusing awakening. End with the protagonist making a desperate vow to survive despite the ridiculous odds.
*Example:*
"I was a normal, overworked office drone until a truck hit me. I woke up expecting heaven, hell, or at least to be a generic hero. Instead, I woke up wrapped in silk, surrounded by hundreds of giant, cannibalistic spiders. Oh, and I have eight legs now.
I''m at the absolute bottom of the food chain in the world''s deadliest labyrinth. Fortunately, I still have my human intellect and a system that rewards me for eating whatever tries to kill me. Even if I have to mutate into a horrifying monstrosity, I absolutely refuse to die!"',
  @method_id, 1, 35, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);
