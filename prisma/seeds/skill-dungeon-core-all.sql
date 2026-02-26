-- The Dungeon Core Novel Skills (Layer 3)
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-dungeon-core-all.sql

SET @method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Dungeon Core Novel' LIMIT 1);

-- 1. Story Hook Setting Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'dungeon-core-story-hook-setting-gen',
  'Generate "Story Hook": How the core awakens and claims its first prey',
  'Generate "Story Hook": Design the Dungeon Core novel introduction',
  '## "Story Hook" Generation — The Dungeon Core Novel

  Design the awakening of the sentient crystal.
  - **The Awakening**: Did a dead architect reincarnate, or is it an AI gone rogue?
  - **First Blood**: The first trap kill. (e.g., placing a shiny coin near a spike pit).
  - **Core Selling Point**: Satisfying base-building, god-game perspective, and trap synergies.',
  '## "Story Hook" Generation — The Dungeon Core Novel

  Design the awakening of the sentient crystal.
  - **The Awakening**: Did a dead architect reincarnate, or is it an AI gone rogue?
  - **First Blood**: The first trap kill. (e.g., placing a shiny coin near a spike pit).
  - **Core Selling Point**: Satisfying base-building, god-game perspective, and trap synergies.',
  @method_id, 1, 1, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 2. Core Premise Setting Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'dungeon-core-core-premise-setting-gen',
  'Generate "Core Premise": The Dungeon''s alignment, guide, and cheat',
  'Generate "Core Premise": Design the Dungeon Core''s golden finger',
  '## "Core Premise" Generation

  - **Dungeon Alignment**: Is it a ravenous horror, or a symbiotic dungeon feeding a town?
  - **The Fairy/Guide Companion**: The energetic or sarcastic fairy that explains the System to the mute crystal.
  - **Golden Finger**: Unique mechanic (e.g., ability to mutate slimes into liquid metal, or zero mana cost for trap layouts).',
  '## "Core Premise" Generation

  - **Dungeon Alignment**: Is it a ravenous horror, or a symbiotic dungeon feeding a town?
  - **The Fairy/Guide Companion**: The energetic or sarcastic fairy that explains the System to the mute crystal.
  - **Golden Finger**: Unique mechanic (e.g., ability to mutate slimes into liquid metal, or zero mana cost for trap layouts).',
  @method_id, 1, 2, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 3. Dungeon Mechanics Setting Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'dungeon-core-mechanics-setting-gen',
  'Generate "Dungeon Mechanics": Hard rules for DP, spawning, and traps',
  'Generate "Dungeon Mechanics": DP costs, topology, and loot generation',
  '## "Dungeon Mechanics" Generation

  The "LitRPG Crunchiness" of the building mechanics.
  - **Mana Economy**: How is DP (Dungeon Points) earned? (Killing delvers, ambient absorption, or absorbing magic stones).
  - **Spawning Rules**: Do monsters need dens? Do they reproduce logically, or crystallize out of thin air?
  - **Loot Generation**: How does the Dungeon bait humans? Does it forge swords out of condensed mana?',
  '## "Dungeon Mechanics" Generation

  The "LitRPG Crunchiness" of the building mechanics.
  - **Mana Economy**: How is DP (Dungeon Points) earned? (Killing delvers, ambient absorption, or absorbing magic stones).
  - **Spawning Rules**: Do monsters need dens? Do they reproduce logically, or crystallize out of thin air?
  - **Loot Generation**: How does the Dungeon bait humans? Does it forge swords out of condensed mana?',
  @method_id, 1, 3, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 4. Writing Style Setting Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'dungeon-core-writing-style-setting-gen',
  'Generate "Writing Style": God-game tone and analytical stat crunching',
  'Generate "Writing Style": Focuses on architectural crunchiness and comedy/horror',
  '## "Writing Style" Generation

  - **Narrative POV**: Usually First Person from a stationary, omniscient entity observing its floors via "camera zones."
  - **Tone**: Analytical (designing floors like a god game) combined with the dark comedy or horror of watching interlopers fall into trap combos.
  - **Crunchiness**: Expect frequent tallies of DP, Dungeon Level, and unlocked monster blueprints.',
  '## "Writing Style" Generation

  - **Narrative POV**: Usually First Person from a stationary, omniscient entity observing its floors via "camera zones."
  - **Tone**: Analytical (designing floors like a god game) combined with the dark comedy or horror of watching interlopers fall into trap combos.
  - **Crunchiness**: Expect frequent tallies of DP, Dungeon Level, and unlocked monster blueprints.',
  @method_id, 1, 5, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 5. Character Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'dungeon-core-character-gen',
  'Character Generation: Companions, Floor Bosses, and arrogant Delvers',
  'Character Generation: Named Bosses, fairies, and invading adventurers',
  '## Character Generator for Dungeon Core

  - **Roles**: Floor Bosses (evolved minions), the Fairy Guide, Arrogant Invaders, and Friendly Town Mayors.
  - **Utility to the Dungeon**: Characters are evaluated by the Core on their utility—either as excellent managers for floor ecosystems, or as juicy sacks of DP when killed.
  - **Current Status**: Are they alive, digested by a trap, or evolving in a cocoon?',
  '## Character Generator for Dungeon Core

  - **Roles**: Floor Bosses (evolved minions), the Fairy Guide, Arrogant Invaders, and Friendly Town Mayors.
  - **Utility to the Dungeon**: Characters are evaluated by the Core on their utility—either as excellent managers for floor ecosystems, or as juicy sacks of DP when killed.
  - **Current Status**: Are they alive, digested by a trap, or evolving in a cocoon?',
  @method_id, 1, 6, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 6. Faction (Organization) Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'dungeon-core-faction-gen',
  'Faction Generation: Adventurer Guilds and Rival Ecosystems',
  'Faction Generation: Surface powers and Dungeon alliances',
  '## Faction Generator for Dungeon Core

  - **Core Idea**: Groups exist largely to provide "waves" of enemies, similar to a Tower Defense game.
  - **Opinion of the Dungeon**: Do they view the dungeon as a threat to be eradicated, or a farmable asset that boosts the local economy?
  - **Examples**: The arrogant Silver Swords Mercenary Company; the oppressive Royal Scouting Division.',
  '## Faction Generator for Dungeon Core

  - **Core Idea**: Groups exist largely to provide "waves" of enemies, similar to a Tower Defense game.
  - **Opinion of the Dungeon**: Do they view the dungeon as a threat to be eradicated, or a farmable asset that boosts the local economy?
  - **Examples**: The arrogant Silver Swords Mercenary Company; the oppressive Royal Scouting Division.',
  @method_id, 1, 7, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 7. Scene Gen (Dungeon Floors)
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'dungeon-core-scene-gen',
  'Scene (Floor) Generation: Biomes, aesthetics, and synergistic traps',
  'Floor Generation: Design the ecology and trap synergies of Dungeon Floors',
  '## Floor Generation for Dungeon Core

  The heart of the dungeon.
  - **Biome & Aesthetic**: Instead of random stone walls, give it a theme: A bioluminescent mushroom forest, a flooded clockwork factory, a hellscape of rolling boulders.
  - **Trap Synergy**: Explain how traps combine. (e.g., Slimes covering the floor in oil, followed by an exploding fire-bat).
  - **Resident Monsters**: Ecosystem logic (how do the monsters feed themselves when adventurers aren''t around?).',
  '## Floor Generation for Dungeon Core

  The heart of the dungeon.
  - **Biome & Aesthetic**: Instead of random stone walls, give it a theme: A bioluminescent mushroom forest, a flooded clockwork factory, a hellscape of rolling boulders.
  - **Trap Synergy**: Explain how traps combine. (e.g., Slimes covering the floor in oil, followed by an exploding fire-bat).
  - **Resident Monsters**: Ecosystem logic (how do the monsters feed themselves when adventurers aren''t around?).',
  @method_id, 1, 8, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 8. Prop Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'dungeon-core-prop-gen',
  'Prop Generation: Loot bait, dungeon blueprints, and magical chests',
  'Prop Generation: Create enticing loot to lure high-level adventurers',
  '## Prop/Loot Generation for Dungeon Core

  - **Item Purpose**: Loot is essentially psychological bait. The better the loot, the stronger the adventurers who come to steal it (and deliver juicy DP).
  - **Effects**: Stat boosts, magical utility.
  - **Cost to Generate**: High-tier loot costs the dungeon massive amounts of DP, so it must be placed behind lethal bosses to ensure a return on investment.',
  '## Prop/Loot Generation for Dungeon Core

  - **Item Purpose**: Loot is essentially psychological bait. The better the loot, the stronger the adventurers who come to steal it (and deliver juicy DP).
  - **Effects**: Stat boosts, magical utility.
  - **Cost to Generate**: High-tier loot costs the dungeon massive amounts of DP, so it must be placed behind lethal bosses to ensure a return on investment.',
  @method_id, 1, 9, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 9. Plot Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'dungeon-core-plot-gen',
  'Plot Design: Base building progression, defending against waves, and expansion',
  'Plot Design: Designing base building, sieges, and boss fights',
  '## Plot Generator for Dungeon Core

  - **The Initial Delve**: The awakening, building the first room, killing a rat to get DP, then baiting a greedy novice.
  - **The Economy Arc**: Realizing killing everything attracts the scary Royal Army. The dungeon decides to let weak adventurers live to harvest a steady tax of ambient mana.
  - **The Base Defense / Siege**: A massive guild expedition attacks perfectly synchronized with the Dungeon unlocking a destructive new biome/boss. It becomes a massive Tower Defense battle.
  - **Progression Marker**: Every arc must end with acquiring enough DP to unlock a new Tier of monsters or digging a new, deadly Floor.',
  '## Plot Generator for Dungeon Core

  - **The Initial Delve**: The awakening, building the first room, killing a rat to get DP, then baiting a greedy novice.
  - **The Economy Arc**: Realizing killing everything attracts the scary Royal Army. The dungeon decides to let weak adventurers live to harvest a steady tax of ambient mana.
  - **The Base Defense / Siege**: A massive guild expedition attacks perfectly synchronized with the Dungeon unlocking a destructive new biome/boss. It becomes a massive Tower Defense battle.
  - **Progression Marker**: Every arc must end with acquiring enough DP to unlock a new Tier of monsters or digging a new, deadly Floor.',
  @method_id, 1, 11, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 10. Narrative Writing
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'dungeon-core-narrative',
  'Narrative Writing: Writing from a god-game perspective, building architecture and managing DP',
  'Narrative Writing: Writing architectural crunchiness and watching traps spring',
  '## Narrative Writing for Dungeon Core

  - **The Blueprint Perspective**: Write as if the MC is hovering over a blueprint. Use architectural terms (excavating, reinforcing load-bearing pillars, routing water channels).
  - **The Satisfaction of the Trap**: Slow down time during a kill. Describe the *click* of the pressure plate, the arrogant adventurer realizing too late, and the glorious rain of DP (Dungeon Points).
  - **Lack of Body**: Remember the MC does not have a human body. Their focus is on the Dungeon Heart (the core crystal) extending its sensory network through moss, bugs, or stone vibrations.',
  '## Narrative Writing for Dungeon Core

  - **The Blueprint Perspective**: Write as if the MC is hovering over a blueprint. Use architectural terms (excavating, reinforcing load-bearing pillars, routing water channels).
  - **The Satisfaction of the Trap**: Slow down time during a kill. Describe the *click* of the pressure plate, the arrogant adventurer realizing too late, and the glorious rain of DP (Dungeon Points).
  - **Lack of Body**: Remember the MC does not have a human body. Their focus is on the Dungeon Heart (the core crystal) extending its sensory network through moss, bugs, or stone vibrations.',
  @method_id, 1, 12, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 11. Novel Naming
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'dungeon-core-novel-naming',
  'Novel Naming: Titles capturing base-building and non-human progression',
  'Novel Naming: Titles and Synopses focusing on dungeons and crystals',
  '## Novel Naming for Dungeon Core

  - **Titles**: Need to clearly specify the subgenre. E.g., The Slime Dungeon, Dungeon Born, There Is No Epic Loot Here, The Mad Core.
  - **Themes**: Unfair traps, strange ecologies, or being reborn as a rock.
  - **Synopsis**: "I died to a truck, but instead of getting a harem, I woke up as a glowing rock in a cave. Now, I have five angry goblins outside and a tutorial fairy yelling at me to build a pitfall trap. It''s time to show this fantasy world what an engineer can do with unlimited mana and a million angry slimes."',
  '## Novel Naming for Dungeon Core

  - **Titles**: Need to clearly specify the subgenre. E.g., The Slime Dungeon, Dungeon Born, There Is No Epic Loot Here, The Mad Core.
  - **Themes**: Unfair traps, strange ecologies, or being reborn as a rock.
  - **Synopsis**: "I died to a truck, but instead of getting a harem, I woke up as a glowing rock in a cave. Now, I have five angry goblins outside and a tutorial fairy yelling at me to build a pitfall trap. It''s time to show this fantasy world what an engineer can do with unlimited mana and a million angry slimes."',
  @method_id, 1, 13, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 12. Entity Naming
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'dungeon-core-entity-naming',
  'Entity Naming: Naming floors, monsters, and traps with terrifying or comedic logic',
  'Entity Naming: Designing floor names, minion titles, and loot',
  '## Entity Naming for Dungeon Core

  - **Floor/Biome Names**: Evocative and dangerous. E.g., The Weeping Caverns, Sector 4: Magma Refinery, The Crystal Labyrinth.
  - **Trap Names**: "The Goblin-Squasher 3000", "Acid-Mist Vent", "Corridor of False Hope".
  - **Boss Titles**: A normal monster evolved, so add a title. E.g., "Snuffles, The Terror-Wolf Boss of Floor 3," or "General Zax, the Skeleton Vanguard."',
  '## Entity Naming for Dungeon Core

  - **Floor/Biome Names**: Evocative and dangerous. E.g., The Weeping Caverns, Sector 4: Magma Refinery, The Crystal Labyrinth.
  - **Trap Names**: "The Goblin-Squasher 3000", "Acid-Mist Vent", "Corridor of False Hope".
  - **Boss Titles**: A normal monster evolved, so add a title. E.g., "Snuffles, The Terror-Wolf Boss of Floor 3," or "General Zax, the Skeleton Vanguard."',
  @method_id, 1, 14, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();
