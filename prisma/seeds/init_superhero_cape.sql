-- Superhero / Cape Fiction Novel Creation Method
-- Language: English (en)
-- Includes: creation method + 8 module types
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/init_superhero_cape.sql

-- ============================================================
-- 1. Create the creation method
-- ============================================================

INSERT INTO novel_creation_method (name_zh, name_en, description_en, novel_type_zh, novel_type_en, language, visible_categories, created_at)
VALUES (
  '超级英雄小说',
  'Superhero / Cape Fiction Novel',
  'For creating superhero fiction, focusing on anti-heroes, system upgrades, and deconstructions of the genre. The protagonist often navigates a world of corrupt corporate heroes and crazy villains, using a weak or misunderstood power with extreme intellect and effort.',
  '超级英雄',
  'Superhero',
  'en',
  '["setting","character","organization","scene"]',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_en = VALUES(description_en),
  novel_type_en = VALUES(novel_type_en),
  visible_categories = VALUES(visible_categories),
  updated_at = NOW();

SET @method_id = (SELECT id FROM novel_creation_method WHERE name_en = 'Superhero / Cape Fiction Novel' LIMIT 1);

-- ============================================================
-- 2. Create module types (8 total)
-- ============================================================

-- 2.1 Story Hook (setting, singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '故事钩子',
  'Story Hook',
  'The core hook that draws readers into the protagonist''s journey of surviving and thriving in a superhuman world.',
  '{"type":"object","required":["Story Hook"],"properties":{"Story Hook":{"type":"string","title":"Story Hook","description":"One sentence capturing the core appeal of the story (e.g., A D-rank hero with a trash skill discovers a bug in the system to steal powers from corrupt S-ranks)","x-uiWidget":"textarea","useForAI":true},"Unique Power/System":{"type":"string","title":"Unique Power/System","description":"The specific cheat, system, or misunderstood power that gives the protagonist an edge","x-uiWidget":"textarea","useForAI":true},"Opening Tension":{"type":"string","title":"Opening Tension","description":"The inciting incident (e.g., framed by a top hero, surviving an unrecorded villain attack)","x-uiWidget":"textarea","useForAI":true},"Reader Expectation":{"type":"string","title":"Reader Expectation","description":"The anticipated payoffs: tearing down arrogant heroes, exposing the truth, mastering the system","x-uiWidget":"textarea","useForAI":true}}}',
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
  'The foundational premise defining the protagonist''s identity and the central conflict with the hero society.',
  '{"type":"object","required":["Protagonist Archetype","Central Conflict"],"properties":{"Protagonist Archetype":{"type":"string","title":"Protagonist Archetype","enum":["Awakened Nobody/Underdog","Misunderstood Villain","Betrayed/Fallen Hero","System-Bound Civilian","Vigilante Hacker/Inventor"],"x-uiWidget":"select","useForAI":true},"Archetype Details":{"type":"string","title":"Archetype Details","description":"Elaborate on their background — how they acquired their power and their initial worldview","x-uiWidget":"textarea","useForAI":true},"Central Conflict":{"type":"string","title":"Central Conflict","enum":["Exposing Corrupt Heroes","Surviving as a Wanted Target","Climbing the Hero Ranks from the Bottom","Preventing an Unseen Apocalypse","Revenge Against the Hero Guild"],"x-uiWidget":"select","useForAI":true},"Moral Compass":{"type":"string","title":"Moral Compass","enum":["Does the right thing, legally or not (Anti-Hero)","Purely self-interested survival","Protects the innocent, punishes the guilty brutally","A villain with standards","Reluctant savior"],"x-uiWidget":"select","useForAI":true},"Story Tone":{"type":"string","title":"Story Tone","enum":["Gritty and Realistic (The Boys style)","Action-Packed LitRPG","Dark Satire of Corporate Heroes","Underground Noir/Vigilante","Epic but Morally Gray"],"x-uiWidget":"radio","useForAI":true}}}',
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

-- 2.3 Power & System Mechanics (setting, singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '力量体系',
  'Power System',
  'The mechanics of superpowers, the RPG system, and the limitations of abilities in this world.',
  '{"type":"object","required":["System Type"],"properties":{"System Type":{"type":"string","title":"System Type","enum":["LitRPG Status Screen","Gacha/Skill Stealing System","Mutant/Genetic Awakening","Cybernetic Enhancements","Magic disguised as Science"],"x-uiWidget":"select","useForAI":true},"Core Mechanics":{"type":"string","title":"Core Mechanics","description":"How powers work, level up, or evolve (e.g., gaining XP by defeating villains or exposing crimes)","x-uiWidget":"textarea","useForAI":true},"Protagonist''s Cheat":{"type":"string","title":"Protagonist''s Cheat","description":"The specific advantage the MC possesses compared to normal Awakened","x-uiWidget":"textarea","useForAI":true},"Power Limitations/Costs":{"type":"string","title":"Power Limitations/Costs","description":"What keeps the powers balanced? Energy burnout, mental degradation, cooldowns?","x-uiWidget":"textarea","useForAI":true},"Power Tiers/Ranks":{"type":"string","title":"Power Tiers/Ranks","description":"The official (or unofficial) ranking system (e.g., F to SSS Rank, Class 1-5)","x-uiWidget":"textarea","useForAI":true}}}',
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
  'The societal structure, corporate hero management, and the hidden dark side of the superhero world.',
  '{"type":"object","required":["World Structure"],"properties":{"World Structure":{"type":"string","title":"World Structure","enum":["Corporate Superheroes (Vought style)","Government Registered Awakened","Post-Gate Outbreak Modern World","Underground Vigilante City","Superhuman Academy"],"x-uiWidget":"select","useForAI":true},"Public Perception":{"type":"string","title":"Public Perception & PR","description":"How the public views heroes vs. reality (e.g., heroes are celebrities with PR teams hiding their crimes)","x-uiWidget":"textarea","useForAI":true},"Power Hierarchy":{"type":"string","title":"Power Hierarchy & Law","description":"Who actually runs the world? The top S-ranks, mega-corporations, or hidden government branches?","x-uiWidget":"textarea","useForAI":true},"The Underground":{"type":"string","title":"The Underground","description":"The black market, unlisted villains, and places the law/heroes ignore","x-uiWidget":"textarea","useForAI":true},"Key History/Event":{"type":"string","title":"Key History/Event","description":"The origin of powers or a major catastrophe that shaped current society","x-uiWidget":"textarea","useForAI":true}}}',
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
  'The narrative tone, perspective, and pacing of the superhero story.',
  '{"type":"object","required":["Narrative POV"],"properties":{"Narrative POV":{"type":"string","title":"Narrative POV","enum":["First Person (Gritty/Inner Monologue)","Third Person Limited","Alternating with Hero/Villain POV","Third Person Omniscient"],"x-uiWidget":"radio","useForAI":true},"Prose Style":{"type":"string","title":"Prose Style","enum":["Cinematic and Action-Heavy","Cynical and Sarcastic","Investigative/Noir","Fast-paced LitRPG"],"x-uiWidget":"radio","useForAI":true},"Focus Areas":{"type":"string","title":"Focus Areas","enum":["Creative Power Battles","System Exploitation/Grinding","Social Engineering & PR Destruction","Vigilante Justice Scenes"],"x-uiWidget":"radio","useForAI":true},"Theme Handling":{"type":"string","title":"Theme Handling","enum":["Deconstruction of Hero Tropes","Classic Zero to Hero","Morally Gray Survival","Unapologetic OP Beatdowns"],"x-uiWidget":"radio","useForAI":true}}}',
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
  'Heroes, villains, civilians, and system-users in the cape fiction world.',
  '{"type":"object","x-titleField":"Name","required":["Name","Role"],"properties":{"Name":{"type":"string","title":"Name","useForAI":true},"Hero/Villain Alias":{"type":"string","title":"Hero/Villain Alias","description":"Their public or underground moniker (if any)","useForAI":true},"Role":{"type":"string","title":"Role","enum":["Protagonist","Corrupt Top Hero","True Villain","Reluctant Ally/Sidekick","Corporate PR/Handler","Underground Broker","Innocent Civilian"],"x-uiWidget":"select","useForAI":true},"Power/Ability":{"type":"string","title":"Power/Ability","description":"Their specific superpower, rank, and combat style","x-uiWidget":"textarea","useForAI":true},"Public Persona vs True Nature":{"type":"string","title":"Public Persona vs True Nature","description":"How they act on camera vs behind closed doors","x-uiWidget":"textarea","useForAI":true},"Core Motivation":{"type":"string","title":"Core Motivation","description":"What drives them (fame, money, genuine justice, madness, survival)","x-uiWidget":"textarea","useForAI":true},"Relationship to Protagonist":{"type":"string","title":"Relationship to Protagonist","description":"Enemy, target, employer, secret ally?","x-uiWidget":"textarea","useForAI":true},"Current Status":{"type":"string","title":"Current Status & Rank","isDynamic":true},"Current Public Image":{"type":"string","title":"Current Public Image (Approval Rating)","isDynamic":true}}}',
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
  'Hero associations, villain syndicates, megacorporations, and vigilante groups.',
  '{"type":"object","x-titleField":"Faction Name","required":["Faction Name","Faction Type"],"properties":{"Faction Name":{"type":"string","title":"Faction Name","useForAI":true},"Faction Type":{"type":"string","title":"Faction Type","enum":["Megacorporation/Hero Agency","Government Bureau","Villain Syndicate","Underground Vigilantes","Cult/Extremist Group","Awakened Academy"],"x-uiWidget":"select","useForAI":true},"Public Mission":{"type":"string","title":"Public Mission","description":"What they claim to do for society","x-uiWidget":"textarea","useForAI":true},"True Agenda":{"type":"string","title":"True Agenda","description":"Their hidden dark operations and actual goals","x-uiWidget":"textarea","useForAI":true},"Key Assets":{"type":"string","title":"Key Assets","description":"Top S-rank heroes, money, political influence, unique tech","x-uiWidget":"textarea","useForAI":true},"Relationship to Protagonist":{"type":"string","title":"Relationship to Protagonist","enum":["Employer","Primary Target","Temporary Ally","Hunting the MC","Neutral/Black Market"],"x-uiWidget":"select","useForAI":true},"Current Influence":{"type":"string","title":"Current Influence/Power Level","isDynamic":true},"Current Scandals/Secrets Exposed":{"type":"string","title":"Current Scandals/Secrets Exposed","isDynamic":true}}}',
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
  'Locations where battles, deals, or daily life occur in the superhero city.',
  '{"type":"object","x-titleField":"Location Name","required":["Location Name","Location Type"],"properties":{"Location Name":{"type":"string","title":"Location Name","useForAI":true},"Location Type":{"type":"string","title":"Location Type","enum":["Corporate HQ/Hero Tower","Dungeon/Gate Instance","Underground Black Market","Destroyed Sector/Slums","Secret Lair/Hideout","Public City Plaza"],"x-uiWidget":"select","useForAI":true},"Appearance/Atmosphere":{"type":"string","title":"Appearance/Atmosphere","description":"Visual details (e.g., gleaming glass tower covering up the slums below)","x-uiWidget":"textarea","useForAI":true},"Function/Significance":{"type":"string","title":"Function/Significance","description":"What role does this place serve in the story or economy?","x-uiWidget":"textarea","useForAI":true},"Hazards/Security":{"type":"string","title":"Hazards/Security","description":"Monsters, high-tech security, or corrupt police patrols","x-uiWidget":"textarea","useForAI":true},"Controlling Faction":{"type":"string","title":"Controlling Faction","isDynamic":true},"Current State":{"type":"string","title":"Current State (Intact/Destroyed)","isDynamic":true}}}',
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
