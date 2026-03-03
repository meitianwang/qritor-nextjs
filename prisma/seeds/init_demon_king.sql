-- The Demon King / Monster Overlord Novel Creation Method
-- Language: English (en)
-- Includes: creation method + 8 module types
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/init_demon_king.sql

-- ============================================================
-- 1. Create the creation method
-- ============================================================

INSERT INTO novel_creation_method (name_zh, name_en, description_en, novel_type_zh, novel_type_en, language, visible_categories, created_at)
VALUES (
  '魔王小说',
  'The Demon King / Monster Overlord Novel',
  'For creating stories where the protagonist is forced to build an evil empire, conquer human kingdoms, and become the legendary Demon King to protect their race or survive. Core appeals: Kingdom Building, Non-human perspective, Conquest.',
  '黑暗奇幻',
  'Dark Fantasy',
  'en',
  '["setting","character","organization","scene"]',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_en = VALUES(description_en),
  novel_type_en = VALUES(novel_type_en),
  visible_categories = VALUES(visible_categories),
  updated_at = NOW();

SET @method_id = (SELECT id FROM novel_creation_method WHERE name_en = 'The Demon King / Monster Overlord Novel' LIMIT 1);

-- ============================================================
-- 2. Create module types (8 total)
-- ============================================================

-- 2.1 Story Hook (setting, singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '故事钩子',
  'Story Hook',
  'The core hook that draws readers into the protagonist''s path to becoming the Demon King',
  '{"type":"object","required":["Story Hook"],"properties":{"Story Hook":{"type":"string","title":"Story Hook","description":"One sentence capturing the core appeal of the story (e.g., A low-level skeleton forced to build an undead empire to survive)","x-uiWidget":"textarea","useForAI":true},"Core Selling Point":{"type":"string","title":"Core Selling Point","description":"What makes this Overlord story unique — the specific kingdom building mechanics or survival stakes","x-uiWidget":"textarea","useForAI":true},"Opening Tension":{"type":"string","title":"Opening Tension","description":"The immediate threat forcing the protagonist to start building their power base","x-uiWidget":"textarea","useForAI":true},"Reader Expectation":{"type":"string","title":"Reader Expectation","description":"The anticipated payoffs: crushing arrogant enemies, expanding territory, evolving minions","x-uiWidget":"textarea","useForAI":true}}}',
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
  'The foundational premise defining the protagonist''s monstrous origin and forced descent into villainy',
  '{"type":"object","required":["Origin Archetype","Central Conflict"],"properties":{"Origin Archetype":{"type":"string","title":"Origin Archetype","enum":["Reincarnated Monster","Fallen Hero/Noble","Ancient Progenitor Awakened","Accidental Demon Lord","Created Weapon/Homunculus"],"x-uiWidget":"select","useForAI":true},"Archetype Details":{"type":"string","title":"Archetype Details","description":"Elaborate on the origin — what monstrous traits they inherited and how they retain/lose humanity","x-uiWidget":"textarea","useForAI":true},"Central Conflict":{"type":"string","title":"Central Conflict","enum":["Survival Against Extermination","Conquest for Resources","Revenge on Human Kingdoms","Breaking a Divine Curse/System","Protecting a Persecuted Race"],"x-uiWidget":"select","useForAI":true},"Moral Compass":{"type":"string","title":"Moral Compass","enum":["Ruthless Pragmatism","Protect My People Above All","Reluctant Overlord (Secretly Soft)","Complete Loss of Humanity","Misunderstood Ruler"],"x-uiWidget":"select","useForAI":true},"Story Tone":{"type":"string","title":"Story Tone","enum":["Epic Kingdom Building","Dark Fantasy & Conquest","Comedic Misunderstandings","Gritty Survival","Strategic Warfare"],"x-uiWidget":"radio","useForAI":true}}}',
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

-- 2.3 Kingdom / Territory System (setting, singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '王国系统',
  'Kingdom System',
  'The mechanics of building the evil empire — resource management, unit evolution, and territorial expansion',
  '{"type":"object","required":["System Type"],"properties":{"System Type":{"type":"string","title":"System Type","enum":["Evolution & Mutation Tree","Resource-based RTS System","Dungeon Core Management","Political & Economic Subjugation","Necromancy/Summoning Horde","Tech/Magic Industrialization"],"x-uiWidget":"select","useForAI":true},"Core Mechanics":{"type":"string","title":"Core Mechanics","description":"How the protagonist gains power or expands territory (e.g., absorbing souls to unlock monster tech)","x-uiWidget":"textarea","useForAI":true},"Minion Types":{"type":"string","title":"Minion Types","description":"The typical units/races under the Demon King''s command and their unique traits","x-uiWidget":"textarea","useForAI":true},"Territory Upgrades":{"type":"string","title":"Territory Upgrades","description":"Key infrastructure levels (e.g., from a muddy cave to an abyssal fortress)","x-uiWidget":"textarea","useForAI":true},"Growth Bottlenecks":{"type":"string","title":"Growth Bottlenecks","description":"What slows them down? (Scarce rare resources, heroic interventions, internal rebellion)","x-uiWidget":"textarea","useForAI":true}}}',
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

-- 2.4 Worldbuilding (setting, singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '世界观',
  'Worldbuilding',
  'The hostile world governed by human supremacy or divine decrees, forcing the protagonist into the Demon King role',
  '{"type":"object","required":["World Type"],"properties":{"World Type":{"type":"string","title":"World Type","enum":["Standard JRPG Fantasy","Grimdark Dark Fantasy","LitRPG/System World","Post-Apocalyptic Magical","Fragmented Realms"],"x-uiWidget":"select","useForAI":true},"Human Supremacy":{"type":"string","title":"Human Supremacy/Divine Order","description":"How the ruling powers oppress non-humans or justify their crusades","x-uiWidget":"textarea","useForAI":true},"Power Structure":{"type":"string","title":"Power Structure","description":"The hierarchy of the world''s factions (e.g., The Holy Church, The Human Empires, Hero Guilds)","x-uiWidget":"textarea","useForAI":true},"Geography":{"type":"string","title":"Geography","description":"The lay of the land, specifically the dangerous/uncharted zones where the empire begins","x-uiWidget":"textarea","useForAI":true},"Magic/Logic Rules":{"type":"string","title":"Magic/Logic Rules","description":"Rules that govern the verse (e.g., Monsters cannot level up naturally unless...)","x-uiWidget":"textarea","useForAI":true}}}',
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
  'The narrative voice and tone for the story of conquest and empire management',
  '{"type":"object","required":["Narrative POV"],"properties":{"Narrative POV":{"type":"string","title":"Narrative POV","enum":["First Person","Third Person Limited","Alternating with Enemy POV","Third Person Omniscient"],"x-uiWidget":"radio","useForAI":true},"Prose Style":{"type":"string","title":"Prose Style","enum":["Grand and Epic","Pragmatic and Strategic","Dark and Visceral","Humorous and Ironic"],"x-uiWidget":"radio","useForAI":true},"Focus Areas":{"type":"string","title":"Focus Areas","enum":["Detailed Kingdom Logistics","Fast-paced Conquest","Character Interactions/Devotion","Tactical Battles"],"x-uiWidget":"radio","useForAI":true},"Tone of Villainy":{"type":"string","title":"Tone of Villainy","enum":["Unapologetically Evil","Misunderstood Saviors","Cold Rationality","Cartoonishly Villainous but Effective"],"x-uiWidget":"radio","useForAI":true}}}',
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
  'Minions, generals, heroes, and human adversaries in the crusade',
  '{"type":"object","x-titleField":"Name","required":["Name","Role"],"properties":{"Name":{"type":"string","title":"Name","useForAI":true},"Role":{"type":"string","title":"Role","enum":["The Demon King (MC)","Loyal Minion/General","The Chosen Hero","Human King/Politician","Traitor/Spy","Neutral Merchant/Ally","Captive/Subjugated"],"x-uiWidget":"select","useForAI":true},"Race":{"type":"string","title":"Race","enum":["Human","Demon","Undead","Beastkin","Elf","Other"],"x-uiWidget":"select","useForAI":true},"Core Motivation":{"type":"string","title":"Core Motivation","description":"What drives them (e.g., extreme loyalty to the Demon King, religious fervor, greed)","x-uiWidget":"textarea","useForAI":true},"Abilities":{"type":"string","title":"Abilities/Role in Empire","description":"Their specific function (e.g., Logistics Manager, Vanguard Commander, Holy Magic User)","x-uiWidget":"textarea","useForAI":true},"View of the Protagonist":{"type":"string","title":"View of the Protagonist","description":"How they perceive the Demon King (e.g., a terrifying god, a misguided fool, a supreme savior)","x-uiWidget":"textarea","useForAI":true},"Current Status":{"type":"string","title":"Current Status","isDynamic":true},"Current Loyalty/Hostility Level":{"type":"string","title":"Current Loyalty/Hostility Level","isDynamic":true}}}',
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
  'The protagonist''s monstrous legions and the human/divine organizations opposing them',
  '{"type":"object","x-titleField":"Faction Name","required":["Faction Name","Faction Type"],"properties":{"Faction Name":{"type":"string","title":"Faction Name","useForAI":true},"Faction Type":{"type":"string","title":"Faction Type","enum":["The Demon Kingdom","Human Empire","Holy Church","Hero''s Party","Non-human Tribe","Mercenary Company","Other"],"x-uiWidget":"select","useForAI":true},"Ideology":{"type":"string","title":"Ideology","description":"Their driving belief system","x-uiWidget":"textarea","useForAI":true},"Military Strength":{"type":"string","title":"Military Strength","description":"Troop composition and special units","x-uiWidget":"textarea","useForAI":true},"Key Leaders":{"type":"string","title":"Key Leaders","description":"The figures directing the faction","x-uiWidget":"textarea","useForAI":true},"Relationship to Demon King":{"type":"string","title":"Relationship to Demon King","enum":["Direct Subordinates","Mortal Enemy","Temporary Truce","Subjugated Vassal","Unaware/Neutral"],"x-uiWidget":"select","useForAI":true},"Current Territory":{"type":"string","title":"Current Territory","isDynamic":true},"Current Morale/Stability":{"type":"string","title":"Current Morale/Stability","isDynamic":true}}}',
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
  'Territories, battlefields, and key locations in the conquest',
  '{"type":"object","x-titleField":"Location Name","required":["Location Name","Location Type"],"properties":{"Location Name":{"type":"string","title":"Location Name","useForAI":true},"Location Type":{"type":"string","title":"Location Type","enum":["Demon King''s Castle","Frontier Outpost","Human Capital","Holy Dungeon","Resource Mine","Battlefield"],"x-uiWidget":"select","useForAI":true},"Appearance/Atmosphere":{"type":"string","title":"Appearance/Atmosphere","description":"Visual description of the area (e.g., jagged obsidian spires, radiant marble temples)","x-uiWidget":"textarea","useForAI":true},"Strategic Value":{"type":"string","title":"Strategic Value","description":"Why this location is important for kingdom building or conquest","x-uiWidget":"textarea","useForAI":true},"Defenses":{"type":"string","title":"Defenses","description":"Traps, garrisons, or magical barriers present","x-uiWidget":"textarea","useForAI":true},"Controlling Faction":{"type":"string","title":"Controlling Faction","isDynamic":true},"Current State of Development":{"type":"string","title":"Current State of Development","isDynamic":true}}}',
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
