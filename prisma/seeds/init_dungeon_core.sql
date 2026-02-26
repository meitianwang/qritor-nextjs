-- The Dungeon Core Novel Creation Method
-- Language: English (en)
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/init_dungeon_core.sql

INSERT INTO novel_creation_method (name, description, novel_type, language, visible_categories, is_preset, user_id, status, created_at)
VALUES (
  'The Dungeon Core Novel',
  'For stories where the protagonist is not human, but a sentient Dungeon Core crystal. They must absorb mana, design floors, spawn monsters, and place traps to defend themselves against delving adventurers. Core appeals: Base building, Tower Defense, Ecology Design, and non-human progression.',
  'LitRPG',
  'en',
  '["setting","character","organization","scene","prop"]',
  1,
  NULL,
  'published',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  novel_type = VALUES(novel_type),
  visible_categories = VALUES(visible_categories),
  updated_at = NOW();

SET @method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Dungeon Core Novel' LIMIT 1);

-- ============================================================
-- 2. Create module types (8 total)
-- ============================================================

-- 2.1 Story Hook
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Story Hook',
  'The core hook that draws readers into the awakening of the dungeon and its very first delvers.',
  '{"type":"object","required":["The Awakening"],"properties":{"The Awakening":{"type":"string","title":"The Awakening","description":"How did the protagonist become a Dungeon Core? (e.g., A dead architect reincarnated as a gem, an AI system glitching into a fantasy world).","x-uiWidget":"textarea","useForAI":true},"The First Concept":{"type":"string","title":"The Dungeon Theme","description":"The core aesthetic/trap style of the dungeon. (e.g., A clockwork labyrinth, a toxic swamp, a library of deadly books).","x-uiWidget":"textarea","useForAI":true},"First Blood (The First Delvers)":{"type":"string","title":"First Blood","description":"How do they handle their very first weak adventurers? (e.g., Luring them into a pit trap with a shiny copper coin).","x-uiWidget":"textarea","useForAI":true},"Core Selling Point":{"type":"string","title":"Core Selling Point","description":"Base-building satisfaction, intricate trap combos, or watching arrogant heroes get outsmarted by a rock.","x-uiWidget":"textarea","useForAI":true}}}',
  1.1, @method_id, 1, 1, 0, 'setting', NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), json_schema = VALUES(json_schema), updated_at = NOW();

-- 2.2 Core Premise
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Core Premise',
  'Defines the dungeon''s relationship with the surface world and its fairy companion.',
  '{"type":"object","required":["Dungeon Alignment"],"properties":{"Dungeon Alignment":{"type":"string","title":"Dungeon Alignment","enum":["Predatory (Kills everything for mana)","Symbiotic (Trades loot for adventurer mana to sustain a local town)","Experimental (Just wants to test weird trap physics)","Hidden/Secret (Wants to be left alone)"],"x-uiWidget":"select","useForAI":true},"The Dungeon Fairy/Guide":{"type":"string","title":"The Fairy/Guide Companion","description":"Cores usually can''t speak to humans. Who is their mouth-piece? (e.g., A hyperactive pixie, a sarcastic floating skull).","x-uiWidget":"textarea","useForAI":true},"The Golden Finger":{"type":"string","title":"The Unfair Advantage","description":"What makes this core special? (e.g., Can assimilate modern tech, can mutate monsters beyond the system''s limits).","x-uiWidget":"textarea","useForAI":true},"Ultimate Goal":{"type":"string","title":"Ultimate Goal","description":"Becoming a World Dungeon, reaching the surface, or destroying the Gods.","x-uiWidget":"textarea","useForAI":true}}}',
  1.0, @method_id, 1, 1, 0, 'setting', NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), json_schema = VALUES(json_schema), updated_at = NOW();

-- 2.3 Dungeon Mechanics
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Dungeon Mechanics',
  'The hard rules of how the dungeon expands, spawns monsters, and generates loot.',
  '{"type":"object","required":["Mana Economy"],"properties":{"Mana Economy":{"type":"string","title":"Mana Economy","description":"How is DP (Dungeon Points) or mana generated and spent? What are the strict limitations?","x-uiWidget":"textarea","useForAI":true},"Spawning Rules":{"type":"string","title":"Monster Spawning Rules","description":"Can they spawn anything, or do they need to absorb a creature''s soul first? Do monsters respawn?","x-uiWidget":"textarea","useForAI":true},"Trap & Topology Physics":{"type":"string","title":"Trap & Topology Physics","description":"How do they shape the dungeon? (e.g., Digging costs mana per cubic meter, gravity traps cost upkeep).","x-uiWidget":"textarea","useForAI":true},"Loot Generation":{"type":"string","title":"Loot Generation","description":"Does the dungeon compress ambient mana into swords to bait adventurers, or do monsters drop classic MMORPG loot?","x-uiWidget":"textarea","useForAI":true}}}',
  0.8, @method_id, 1, 1, 0, 'setting', NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), json_schema = VALUES(json_schema), updated_at = NOW();

-- 2.4 Writing Style
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Writing Style',
  'The tone of the novel, balancing architectural crunchiness with the comedy or horror of delving.',
  '{"type":"object","required":["Narrative POV"],"properties":{"Narrative POV":{"type":"string","title":"Narrative POV","enum":["First Person (From the Core''s perspective)","Third Person (Omniscient over the dungeon)","Split POV (Core vs Delvers)"],"x-uiWidget":"radio","useForAI":true},"Tone":{"type":"string","title":"Prose Tone","enum":["Analytical & Min-Maxing","Dark, Brutal, and Merciless Trap-Horror","Comedic (Watching adventurers fail miserably)"],"x-uiWidget":"radio","useForAI":true},"Crunchiness":{"type":"string","title":"Crunchiness","description":"How often do we see DP (Dungeon Point) spreadsheets and floor layout blueprints?","x-uiWidget":"textarea","useForAI":true}}}',
  0.7, @method_id, 1, 1, 0, 'setting', NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), json_schema = VALUES(json_schema), updated_at = NOW();

-- 2.5 Character
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Character',
  'Adventurers (prey), Boss Monsters (minions), and surface dwellers.',
  '{"type":"object","x-titleField":"Name","required":["Name","Role"],"properties":{"Name":{"type":"string","title":"Name","useForAI":true},"Role":{"type":"string","title":"Role","enum":["The Dungeon Core (MC)","Dungeon Companion/Fairy","Floor Boss/Named Minion","Arrogant Invader (Prey)","Friendly Guild Master (Surface Ally)","Rival Core"],"x-uiWidget":"select","useForAI":true},"Class/Species":{"type":"string","title":"Species or Adventurer Class","description":"e.g., Slime King, S-Rank Rogue, System Pixie.","x-uiWidget":"textarea","useForAI":true},"Utility to the Dungeon":{"type":"string","title":"Utility to the Dungeon","description":"Why does the core care about them? (A brilliant boss monster, or just a juicy bag of high-quality mana to kill?).","x-uiWidget":"textarea","useForAI":true},"Current Floor/Location":{"type":"string","title":"Current Location","isDynamic":true},"Current Status":{"type":"string","title":"Current Status (Alive, Digested, Evolving)","isDynamic":true}}}',
  1.0, @method_id, 1, 0, 0, 'character', NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), json_schema = VALUES(json_schema), updated_at = NOW();

-- 2.6 Organization (Faction)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Faction',
  'Adventurer Guilds, surface Kingdoms, and rival Dungeon alliances.',
  '{"type":"object","x-titleField":"Faction Name","required":["Faction Name","Faction Type"],"properties":{"Faction Name":{"type":"string","title":"Faction Name","useForAI":true},"Faction Type":{"type":"string","title":"Faction Type","enum":["Adventurer''s Guild","Surface Kingdom/Nobility","Cult worshipping the Dungeon","Rival Dungeon Ecosystem"],"x-uiWidget":"select","useForAI":true},"Opinion of the Dungeon":{"type":"string","title":"Opinion of the MC''s Dungeon","description":"Do they see the MC as a cash cow, a deadly threat to be starved out, or a god?","x-uiWidget":"textarea","useForAI":true},"Roster Strength":{"type":"string","title":"Available Delvers/Manpower","description":"How many people can they send to raid the core?","x-uiWidget":"textarea","useForAI":true},"Current Threat Level":{"type":"string","title":"Current Threat Level","isDynamic":true}}}',
  1.0, @method_id, 1, 0, 0, 'organization', NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), json_schema = VALUES(json_schema), updated_at = NOW();

-- 2.7 Scene (Floor Designs)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Dungeon Floor (Scene)',
  'The carefully crafted floors, biomes, and trap rooms designed by the MC.',
  '{"type":"object","x-titleField":"Floor Name","required":["Floor Name"],"properties":{"Floor Name":{"type":"string","title":"Floor Number/Name","description":"e.g., Floor 1: The Fungal Caves","useForAI":true},"Biome/Aesthetic":{"type":"string","title":"Biome & Aesthetic","description":"What does the environment look like? (e.g., Burning lava tubes, crystal forests, claustrophobic stone mazes).","x-uiWidget":"textarea","useForAI":true},"Trap Synergy":{"type":"string","title":"Trap Synergy/Gimmick","description":"The core gimmick. (e.g., Water elementals pushing delvers into electrified grates).","x-uiWidget":"textarea","useForAI":true},"Resident Monsters":{"type":"string","title":"Resident Monsters","description":"Who lives here?","x-uiWidget":"textarea","useForAI":true},"Current Completion Status":{"type":"string","title":"Construction Status","isDynamic":true},"Highest Delver Reached":{"type":"string","title":"Has it been breached?","isDynamic":true}}}',
  1.1, @method_id, 1, 0, 0, 'scene', NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), json_schema = VALUES(json_schema), updated_at = NOW();

-- 2.8 Prop (Loot & Items)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Loot & Artifacts',
  'The bait dropped by the dungeon, or unique items crafted by the core.',
  '{"type":"object","x-titleField":"Item Name","required":["Item Name"],"properties":{"Item Name":{"type":"string","title":"Item Name","useForAI":true},"Item Purpose":{"type":"string","title":"Item Purpose","enum":["Bait/Loot for Delvers","Core Upgrade/Blueprint","Consumable Resource"],"x-uiWidget":"select","useForAI":true},"Effects & Stats":{"type":"string","title":"Effects & Stats","description":"What does it do?","x-uiWidget":"textarea","useForAI":true},"DP Cost to Generate":{"type":"string","title":"DP Cost to Generate","description":"How much mana does the core spend to create this?","x-uiWidget":"textarea","useForAI":true},"Current Location":{"type":"string","title":"Current Location (e.g., In Floor 3 Chest)","isDynamic":true}}}',
  0.9, @method_id, 1, 0, 0, 'prop', NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), json_schema = VALUES(json_schema), updated_at = NOW();
