-- The System Apocalypse Novel Creation Method
-- Language: English (en)
-- Includes: creation method + 9 module types (now including drops/props!)
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/init_system_apocalypse.sql

-- ============================================================
-- 1. Create the creation method
-- ============================================================

INSERT INTO novel_creation_method (name_zh, name_en, description_en, novel_type_zh, novel_type_en, language, visible_categories, created_at)
VALUES (
  '系统末日小说',
  'The System Apocalypse Novel',
  'For stories where Earth is suddenly integrated into a gamified "System". Modern civilization collapses, magic and monsters arrive, and humanity must level up to survive. Core appeals: LitRPG progression, modern weapons clashing with magic, and gritty post-apocalyptic survival.',
  '文字RPG',
  'LitRPG',
  'en',
  '["setting","character","organization","scene","prop"]',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_en = VALUES(description_en),
  novel_type_en = VALUES(novel_type_en),
  visible_categories = VALUES(visible_categories),
  updated_at = NOW();

SET @method_id = (SELECT id FROM novel_creation_method WHERE name_en = 'The System Apocalypse Novel' LIMIT 1);

-- ============================================================
-- 2. Create module types (9 total)
-- ============================================================

-- 2.1 Story Hook (setting, singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '故事钩子',
  'Story Hook',
  'The core hook that draws readers into the exact moment the apocalypse begins and how the protagonist achieves their first edge.',
  '{"type":"object","required":["The Arrival"],"properties":{"The Arrival":{"type":"string","title":"The Arrival","description":"How did the System announce itself? (e.g., A blue screen in everyone''s vision, the sky turning red, a robotic voice proclaiming the integration of Earth).","x-uiWidget":"textarea","useForAI":true},"First Blood":{"type":"string","title":"First Blood","description":"The exact moment the protagonist makes their first kill or survives the initial chaos to get their starting advantage.","x-uiWidget":"textarea","useForAI":true},"Core Selling Point":{"type":"string","title":"Core Selling Point","description":"What makes this survival story unique? (e.g., A unique loophole they abused, a powerful hidden class, or unparalleled ruthlessness).","x-uiWidget":"textarea","useForAI":true},"Reader Expectation":{"type":"string","title":"Reader Expectation","description":"The anticipated payoffs: satisfying level-ups, looting epic gear, building a safe zone, and crushing arrogant warlords.","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id,
  1,
  1,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_en = VALUES(description_en),
  json_schema_en = VALUES(json_schema_en),
  updated_at = NOW();

-- 2.2 Core Premise (setting, singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '核心设定',
  'Core Premise',
  'The foundational premise defining the protagonist''s archetype, their golden finger (if any), and their ultimate goal in the ruined world.',
  '{"type":"object","required":["Protagonist Archetype","Primary Goal"],"properties":{"Protagonist Archetype":{"type":"string","title":"Protagonist Archetype","enum":["The Prepared Prepper","The Hardcore Gamer/Min-Maxer","The Unlucky Ordinary Worker","The Ruthless Military Veteran","The Regressor (Returned from the future)"],"x-uiWidget":"select","useForAI":true},"The Golden Finger":{"type":"string","title":"System Advantage (Golden Finger)","description":"What unfair advantage do they possess? (e.g., A unique mythical class, EX-rank hidden skill, system-breaking trait).","x-uiWidget":"textarea","useForAI":true},"Primary Goal":{"type":"string","title":"Primary Goal","enum":["Lone Wolf Survivor","Building the Ultimate Safe Zone","Finding Lost Family","Rebellion against the System Gods","Becoming the Strongest/Ascension"],"x-uiWidget":"select","useForAI":true},"Moral Compass in the Apocalypse":{"type":"string","title":"Moral Compass","enum":["Gritty Pragmatism (Will kill if necessary)","Ruthless (Trusts no one)","Protector (Shields the weak but strict)","Chaotic Opportunist"],"x-uiWidget":"select","useForAI":true}}}',
  @method_id,
  1,
  1,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_en = VALUES(description_en),
  json_schema_en = VALUES(json_schema_en),
  updated_at = NOW();

-- 2.3 The System Mechanics (setting, singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '系统机制',
  'System Mechanics',
  'The rules of the game: leveling, stats, classes, and how the magic system interacts with the physical world.',
  '{"type":"object","required":["System Type"],"properties":{"System Type":{"type":"string","title":"System Type","enum":["Standard LitRPG (Stats, Classes, Skills)","Gacha/Card-based System","Cultivation/Dao Integration","Evolution/Mutation Focus","Alien Reality Show/Sponsorship"],"x-uiWidget":"select","useForAI":true},"Progression Rules":{"type":"string","title":"Progression Rules","description":"How do people level up? (Killing monsters, completing System Quests, surviving dungeons, gathering mana).","x-uiWidget":"textarea","useForAI":true},"Class & Skill Structure":{"type":"string","title":"Class & Skill Structure","description":"Are classes locked? Can you combine skills? Are there hidden classes?","x-uiWidget":"textarea","useForAI":true},"Modern Tech vs Magic":{"type":"string","title":"Modern Tech vs Magic","description":"Do guns still work? Do they become obsolete after level 10? Are there System-modified firearms or mana-batteries?","x-uiWidget":"textarea","useForAI":true},"Death Penalties":{"type":"string","title":"Death Penalties / Revival","description":"Is death permanent? If not, what is the cost of respawning?","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id,
  1,
  1,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_en = VALUES(description_en),
  json_schema_en = VALUES(json_schema_en),
  updated_at = NOW();

-- 2.4 World & Society Collapse (setting, singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '世界与社会崩溃',
  'World & Society Collapse',
  'The state of Earth after the integration: terrain alterations, monster outbreaks, and the fall of human governments.',
  '{"type":"object","required":["Terrain Alteration"],"properties":{"Terrain Alteration":{"type":"string","title":"Terrain Alteration","description":"How did the world physical change? (e.g., Continents split, skyscrapers turned into dungeons, mana zones appeared).","x-uiWidget":"textarea","useForAI":true},"The Monsters":{"type":"string","title":"The Monsters","description":"What kind of beasts roam the earth now? (Classic fantasy goblins/orcs, grotesque alien mutants, corrupted animals).","x-uiWidget":"textarea","useForAI":true},"Fall of the Old World":{"type":"string","title":"Fall of the Old World","description":"How quickly did society collapse? Did the military get wiped out by high-level bosses or did EMPs disable technology?","x-uiWidget":"textarea","useForAI":true},"New Social Order":{"type":"string","title":"New Social Order","description":"The law of the jungle. How do survivors group up? (Warlords ruling by level, corporate safe zones, cults, democratic survivor camps).","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id,
  1,
  1,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_en = VALUES(description_en),
  json_schema_en = VALUES(json_schema_en),
  updated_at = NOW();

-- 2.5 Writing Style (setting, singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '文风设定',
  'Writing Style',
  'The narrative voice and tone for the gritty, numbers-driven story of survival.',
  '{"type":"object","required":["Narrative POV"],"properties":{"Narrative POV":{"type":"string","title":"Narrative POV","enum":["First Person (Immersive survival)","Third Person Limited (Action focused)"],"x-uiWidget":"radio","useForAI":true},"Crunchiness Level":{"type":"string","title":"Crunchiness Level (LitRPG Stats)","enum":["Crunchy (Frequent stat sheets, detailed math)","Moderate (Focus on skill unlocks and major milestones)","Lite (System exists but numbers are fuzzy/rare)"],"x-uiWidget":"radio","useForAI":true},"Prose Tone":{"type":"string","title":"Prose Tone","enum":["Gritty, Desperate, Tension-heavy","Action-Packed Blockbuster","Sarcastic/Cynical Survivor Humor","Analytical/Min-Maxing Focus"],"x-uiWidget":"radio","useForAI":true},"Focus Areas":{"type":"string","title":"Focus Areas","enum":["Loot and Build Crafting","Visceral Combat and Tactics","Human Psychology and Betrayal","Base Building and Logistics"],"x-uiWidget":"radio","useForAI":true}}}',
  @method_id,
  1,
  1,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_en = VALUES(description_en),
  json_schema_en = VALUES(json_schema_en),
  updated_at = NOW();

-- 2.6 Character (character, non-singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '角色',
  'Character',
  'Fellow survivors, opportunistic betrayers, military remnants, and enigmatic System guides.',
  '{"type":"object","x-titleField":"Name","required":["Name","Role"],"properties":{"Name":{"type":"string","title":"Name","useForAI":true},"Role":{"type":"string","title":"Role","enum":["The Survivor (MC)","Trusted Ally/Party Member","Rival Survivor/Min-Maxer","Warlord/Gang Leader","Military Remnant Officer","System Administrator/Guide","Betrayer/Coward"],"x-uiWidget":"select","useForAI":true},"Class & Build":{"type":"string","title":"Class & Build Focus","description":"Their System Class (e.g., Pyromancer, Shieldbearer, Scavenger) and what stats they focus on.","x-uiWidget":"textarea","useForAI":true},"Survival Philosophy":{"type":"string","title":"Survival Philosophy","description":"Their approach to the apocalypse (e.g., strength rules all, safety in numbers, hoard everything).","x-uiWidget":"textarea","useForAI":true},"Utility to Protagonist":{"type":"string","title":"Utility/Danger to MC","description":"How they interact with the MC. (e.g., A reliable tank, a merchant, or a threat to be eliminated).","x-uiWidget":"textarea","useForAI":true},"Current Level/Tier":{"type":"string","title":"Current Level/Tier","isDynamic":true},"Current Status/Location":{"type":"string","title":"Current Status/Location","isDynamic":true}}}',
  @method_id,
  1,
  0,
  'character',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_en = VALUES(description_en),
  json_schema_en = VALUES(json_schema_en),
  updated_at = NOW();

-- 2.7 Faction (organization, non-singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '阵营',
  'Faction',
  'Survivor settlements, raider gangs, military holdouts, and alien guilds.',
  '{"type":"object","x-titleField":"Faction Name","required":["Faction Name","Faction Type"],"properties":{"Faction Name":{"type":"string","title":"Faction Name","useForAI":true},"Faction Type":{"type":"string","title":"Faction Type","enum":["Safe Zone/Settlement","Raider Gang/Bandits","Military Remnant","System Cult","Corporate Holdout","Alien/Interdimensional Guild"],"x-uiWidget":"select","useForAI":true},"Core Ideology/Rule":{"type":"string","title":"Core Ideology/Rule","description":"How they govern themselves. (e.g., High-levels take all, democratic rationing, religious devotion to the System).","x-uiWidget":"textarea","useForAI":true},"Key Resources":{"type":"string","title":"Key Resources & Strength","description":"What makes them powerful? (e.g., Control over a mana crystal mine, stockpiles of old-world firearms, high-level elites).","x-uiWidget":"textarea","useForAI":true},"Threat Level to MC":{"type":"string","title":"Threat Level to MC","description":"Are they friendly traders, potential allies, or hostile conquerors?","x-uiWidget":"textarea","useForAI":true},"Current Territory":{"type":"string","title":"Current Territory","isDynamic":true},"Current Population/Power":{"type":"string","title":"Current Population/Power","isDynamic":true}}}',
  @method_id,
  1,
  0,
  'organization',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_en = VALUES(description_en),
  json_schema_en = VALUES(json_schema_en),
  updated_at = NOW();

-- 2.8 Scene (scene, non-singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '场景',
  'Scene',
  'Ruined cities, deadly System dungeons, and fortified safe zones.',
  '{"type":"object","x-titleField":"Location Name","required":["Location Name","Location Type"],"properties":{"Location Name":{"type":"string","title":"Location Name","useForAI":true},"Location Type":{"type":"string","title":"Location Type","enum":["System Dungeon","Ruined Urban Center","Fortified Safe Zone","Tutorial Area","Wilderness/Mana Zone"],"x-uiWidget":"select","useForAI":true},"Atmosphere & Danger":{"type":"string","title":"Atmosphere & Danger","description":"Visual description and environmental hazards (e.g., Subway tunnels filled with giant spiders and toxic gas).","x-uiWidget":"textarea","useForAI":true},"Loot/Resource Value":{"type":"string","title":"Loot/Resource Value","description":"Why risk going here? (e.g., Boss drops a core, pre-apocalypse supermarket supplies).","x-uiWidget":"textarea","useForAI":true},"Dominant Monsters/Occupants":{"type":"string","title":"Dominant Monsters/Occupants","description":"Who controls this area?","x-uiWidget":"textarea","useForAI":true},"Current Clear Status":{"type":"string","title":"Current Clear Status","isDynamic":true}}}',
  @method_id,
  1,
  0,
  'scene',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_en = VALUES(description_en),
  json_schema_en = VALUES(json_schema_en),
  updated_at = NOW();

-- 2.9 Prop (prop, non-singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '装备与战利品',
  'Equipment & Loot',
  'System artifacts, magical weapons, modified firearms, and survival gear.',
  '{"type":"object","x-titleField":"Item Name","required":["Item Name","Item Tier"],"properties":{"Item Name":{"type":"string","title":"Item Name","useForAI":true},"Item Tier":{"type":"string","title":"Item Tier/Rarity","enum":["Common/Normal","Uncommon/Magic","Rare/Elite","Epic/Heroic","Legendary/Mythic","Unique/Artifact","Pre-System Modern Tech"],"x-uiWidget":"select","useForAI":true},"Item Type":{"type":"string","title":"Item Type","enum":["Melee Weapon","Ranged Weapon/Firearm","Armor/Apparel","Consumable/Potion","Skill Book","Materials","System Utility/Storage"],"x-uiWidget":"select","useForAI":true},"Stats & Effects":{"type":"string","title":"Stats & Effects","description":"Numerical boosts or magical properties (e.g., +15 Strength, 5% chance to inflict Bleed, Infinite Ammo).","x-uiWidget":"textarea","useForAI":true},"Visual Description":{"type":"string","title":"Visual Description","description":"What does it look like? (e.g., A sleek sniper rifle coursing with blue mana veins).","x-uiWidget":"textarea","useForAI":true},"Origin/Drop Source":{"type":"string","title":"Origin/Drop Source","description":"Did it drop from a boss, crafted, or bought from the System Shop?","x-uiWidget":"textarea","useForAI":true},"Current Owner":{"type":"string","title":"Current Owner","isDynamic":true}}}',
  @method_id,
  1,
  0,
  'prop',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_en = VALUES(description_en),
  json_schema_en = VALUES(json_schema_en),
  updated_at = NOW();
