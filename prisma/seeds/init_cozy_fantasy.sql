-- The Cozy Fantasy / Low-Stakes Fantasy Novel Creation Method
-- Language: English (en)
-- Includes: creation method + 8 module types
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/init_cozy_fantasy.sql

-- ============================================================
-- 1. Create the creation method
-- ============================================================

INSERT INTO novel_creation_method (name, description, novel_type, language, visible_categories, is_preset, user_id, status, created_at)
VALUES (
  'The Cozy Fantasy / Low-Stakes Fantasy Novel',
  'For warm, stress-free stories where the protagonist steps away from epic quests and world-saving to focus on slice-of-life pursuits like running a cafe, farming, or managing a small shop in a magical world. Core appeals: Relaxation, healing, escapism, and low stakes.',
  'Romantasy',
  'en',
  '["setting","character","organization","scene"]',
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

SET @method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Cozy Fantasy / Low-Stakes Fantasy Novel' LIMIT 1);

-- ============================================================
-- 2. Create module types (8 total)
-- ============================================================

-- 2.1 Story Hook (setting, singleton)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Story Hook',
  'The core hook that draws readers into the peaceful premise and sets expectations for a low-stakes, comforting narrative.',
  '{"type":"object","required":["The Retirement/Arrival"],"properties":{"The Retirement/Arrival":{"type":"string","title":"The Retirement/Arrival","description":"How did the protagonist end up here? (e.g., A tired hero retiring, an office worker transmigrating to open a bakery).","x-uiWidget":"textarea","useForAI":true},"The Cozy Business/Goal":{"type":"string","title":"The Cozy Business/Goal","description":"What peaceful endeavor are they undertaking? (e.g., Opening a tavern for exhausted adventurers, being a therapist for orcs).","x-uiWidget":"textarea","useForAI":true},"Core Selling Point":{"type":"string","title":"Core Selling Point","description":"What makes this relaxing story unique? (e.g., The contrast between a fierce barbarian and his delicate pastries).","x-uiWidget":"textarea","useForAI":true},"Reader Expectation":{"type":"string","title":"Reader Expectation","description":"The anticipated payoffs: cozy vibes, mouth-watering food descriptions, wholesome friendships, and absolutely no world-ending threats.","x-uiWidget":"textarea","useForAI":true}}}',
  1.1,
  @method_id,
  1,
  1,
  0,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  json_schema = VALUES(json_schema),
  temperature = VALUES(temperature),
  updated_at = NOW();

-- 2.2 Core Premise (setting, singleton)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Core Premise',
  'The foundational premise defining the protagonist''s background, their peaceful skills, and their approach to their new life.',
  '{"type":"object","required":["Protagonist Archetype","The Gentle Cheat"],"properties":{"Protagonist Archetype":{"type":"string","title":"Protagonist Archetype","enum":["The Exhausted Hero/Villain Retiree","The Transmigrated Modern Professional (Chef/Craftsman)","The Misunderstood Scary-Looking Softie","The Magical Practitioner wanting a normal life"],"x-uiWidget":"select","useForAI":true},"The Gentle Cheat":{"type":"string","title":"The Gentle Cheat (Golden Finger)","description":"Their unfair but peaceful advantage. (e.g., An overpowered cleaning spell, the ability to make any ingredient taste amazing, infinite patience).","x-uiWidget":"textarea","useForAI":true},"Primary Conflict":{"type":"string","title":"Primary Conflict (Low Stakes)","enum":["Running out of a rare ingredient","A grumpy customer who needs thawing","Rivalry with the snooty shop next door","Keeping their overpowered past a secret"],"x-uiWidget":"select","useForAI":true},"Social Philosophy":{"type":"string","title":"Social Philosophy","enum":["Found Family (Gathering misfits)","The Quiet Observer (Listening to travelers'' tales)","The Community Pillar (Helping everyone gently)"],"x-uiWidget":"select","useForAI":true}}}',
  1.0,
  @method_id,
  1,
  1,
  0,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  json_schema = VALUES(json_schema),
  temperature = VALUES(temperature),
  updated_at = NOW();

-- 2.3 The Craft / Business Mechanics (setting, singleton)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'The Craft & Daily Life',
  'The rules and routines of the protagonist''s peaceful profession and how it interacts with the magical world.',
  '{"type":"object","required":["Business Type"],"properties":{"Business Type":{"type":"string","title":"Business Type","enum":["Food & Drink (Tavern, Cafe, Bakery)","Healing & Care (Therapist, Spa, Clinic)","Crafting & Repair (Potion shop, Blacksmith, Magic item repair)","Farming & Nature (Magical crop farming, Beast sanctuary)"],"x-uiWidget":"select","useForAI":true},"Daily Routine":{"type":"string","title":"Daily Routine","description":"The comforting, repetitive tasks that ground the story (e.g., Waking up at dawn to brew the magical beans, sweeping the front porch).","x-uiWidget":"textarea","useForAI":true},"Magic Integration":{"type":"string","title":"Magic Integration","description":"How is magic used for mundane chores? (e.g., Using high-tier fire magic just to get the oven to the perfect temperature).","x-uiWidget":"textarea","useForAI":true},"The Specialty Item":{"type":"string","title":"The Specialty Item/Service","description":"The one thing they are famous for that brings characters together (e.g., A latte that cures heartbreak, a perfectly repaired family heirloom).","x-uiWidget":"textarea","useForAI":true}}}',
  0.9,
  @method_id,
  1,
  1,
  0,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  json_schema = VALUES(json_schema),
  temperature = VALUES(temperature),
  updated_at = NOW();

-- 2.4 Worldbuilding (setting, singleton)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Worldbuilding',
  'The world outside the cozy bubble, which exists primarily to contrast with the peacefulness of the protagonist''s life.',
  '{"type":"object","required":["The Outside World"],"properties":{"The Outside World":{"type":"string","title":"The Outside World (The Contrast)","enum":["High Magic Fantasy (Knights and Dragons)","Dungeon City (Right next to a dangerous abyss)","Steampunk/Gaslamp City","Peaceful Countryside/Frontier Town"],"x-uiWidget":"select","useForAI":true},"The Neighborhood":{"type":"string","title":"The Neighborhood","description":"The immediate surroundings of the protagonist''s shop/home. (e.g., A bustling cobblestone street with idiosyncratic neighbors).","x-uiWidget":"textarea","useForAI":true},"Local Quirks/Laws":{"type":"string","title":"Local Quirks/Laws","description":"Funny or charming rules of the area (e.g., No sword-drawing on Sundays, Goblins must wipe their feet before entering).","x-uiWidget":"textarea","useForAI":true},"The Threat Level":{"type":"string","title":"The Threat Level (Non-Existential)","description":"What is the worst that can happen? (e.g., A bad review from a noble, a rainy week keeping customers away). Remember: NO world-ending threats.","x-uiWidget":"textarea","useForAI":true}}}',
  1.0,
  @method_id,
  1,
  1,
  0,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  json_schema = VALUES(json_schema),
  temperature = VALUES(temperature),
  updated_at = NOW();

-- 2.5 Writing Style (setting, singleton)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Writing Style',
  'The narrative voice and tone that evokes warmth, comfort, and sensory delight.',
  '{"type":"object","required":["Sensory Focus"],"properties":{"Narrative POV":{"type":"string","title":"Narrative POV","enum":["First Person (Intimate and diary-like)","Third Person Limited (Warm and observant)"],"x-uiWidget":"radio","useForAI":true},"Prose Tone":{"type":"string","title":"Prose Tone","enum":["Warm, Gentle, and Healing","Lighthearted and Humorous","Slightly Melancholic but Hopeful"],"x-uiWidget":"radio","useForAI":true},"Sensory Focus":{"type":"string","title":"Sensory Focus","description":"Emphasis on smells (baking bread), sounds (rain on the window, clinking glasses), and textures (soft blankets, polished wood). MUST be prominent.","x-uiWidget":"textarea","useForAI":true},"Pacing":{"type":"string","title":"Pacing","enum":["Slow-burn Slice of Life","Episodic (Customer of the week)","Gentle Seasonal Progression"],"x-uiWidget":"radio","useForAI":true}}}',
  0.7,
  @method_id,
  1,
  1,
  0,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  json_schema = VALUES(json_schema),
  temperature = VALUES(temperature),
  updated_at = NOW();

-- 2.6 Character (character, non-singleton)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Character',
  'The protagonist, their quirky found-family employees, regular customers, and minor localized rivals.',
  '{"type":"object","x-titleField":"Name","required":["Name","Role"],"properties":{"Name":{"type":"string","title":"Name","useForAI":true},"Role":{"type":"string","title":"Role","enum":["The Shopkeeper/Owner (MC)","The Quirky Assistant/Employee","The Regular Customer","The Grumpy but Soft-Hearted Neighbor","The Tired Adventurer (Seeking respite)","The Minor Rival (Snooty but harmless)"],"x-uiWidget":"select","useForAI":true},"Personality Trait":{"type":"string","title":"Core Personality","description":"Their endearing flaw or charm (e.g., Chronically sleepy, fiercely protective of the shop''s pastries, speaks in riddles).","x-uiWidget":"textarea","useForAI":true},"Source of Stress/Need":{"type":"string","title":"Source of Stress (Why they need healing)","description":"What are they retreating from? (e.g., PTSD from dungeon diving, pressure from a noble family, simple exhaustion).","x-uiWidget":"textarea","useForAI":true},"Relationship to MC":{"type":"string","title":"Relationship to MC","description":"How do they interact with the protagonist? (e.g., Acts as a surrogate grandparent, a tsundere regular).","x-uiWidget":"textarea","useForAI":true},"Current Mood":{"type":"string","title":"Current Mood","isDynamic":true},"Current Location/Activity":{"type":"string","title":"Current Location/Activity","isDynamic":true}}}',
  1.0,
  @method_id,
  1,
  0,
  0,
  'character',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  json_schema = VALUES(json_schema),
  temperature = VALUES(temperature),
  updated_at = NOW();

-- 2.7 Faction (organization, non-singleton)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Faction',
  'Guilds, town councils, and neighborhood associations instead of warring empires.',
  '{"type":"object","x-titleField":"Organization Name","required":["Organization Name","Type"],"properties":{"Organization Name":{"type":"string","title":"Organization Name","useForAI":true},"Type":{"type":"string","title":"Type","enum":["The Local Guild Branch","The Merchant''s Association","The Neighborhood Watch","A specific Adventuring Party","The Snooty Competitor Chain"],"x-uiWidget":"select","useForAI":true},"Reputation/Vibe":{"type":"string","title":"Reputation/Vibe","description":"How do locals view them? (e.g., Loud but generous, strictly bureaucratic, a bunch of lovable idiots).","x-uiWidget":"textarea","useForAI":true},"Interaction with Protagonist":{"type":"string","title":"Interaction with Protagonist","description":"How do they bother or support the MC? (e.g., The guild master constantly sneaks away to the MC''s cafe to avoid paperwork).","x-uiWidget":"textarea","useForAI":true},"Key Figures":{"type":"string","title":"Key Figures","description":"Notable members who frequent the MC''s establishment.","x-uiWidget":"textarea","useForAI":true},"Current Stance towards MC":{"type":"string","title":"Current Stance towards MC","isDynamic":true}}}',
  1.0,
  @method_id,
  1,
  0,
  0,
  'organization',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  json_schema = VALUES(json_schema),
  temperature = VALUES(temperature),
  updated_at = NOW();

-- 2.8 Scene (scene, non-singleton)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Scene',
  'The warm hearth of the shop, the bustling local market, or the serene back garden.',
  '{"type":"object","x-titleField":"Location Name","required":["Location Name","Type"],"properties":{"Location Name":{"type":"string","title":"Location Name","useForAI":true},"Type":{"type":"string","title":"Type","enum":["The Protagonist''s Shop/Home","The Local Market/Plaza","The Competitor''s Flashy Store","A Peaceful Nature Spot","The Adventurer''s Guildhall"],"x-uiWidget":"select","useForAI":true},"Atmosphere & Sensory Details":{"type":"string","title":"Atmosphere & Sensory Details","description":"What does it feel, smell, and sound like? (e.g., Smells of cinnamon and woodsmoke, soft lighting from glowing moss).","x-uiWidget":"textarea","useForAI":true},"Significance to the Story":{"type":"string","title":"Significance","description":"Why does the MC go here? (e.g., This is where they find peace, where they buy the freshest magical herbs).","x-uiWidget":"textarea","useForAI":true},"Regular Occupants":{"type":"string","title":"Regular Occupants","description":"Who is usually hanging around here?","x-uiWidget":"textarea","useForAI":true},"Current Weather/Time of Day":{"type":"string","title":"Current Weather/Time of Day","isDynamic":true}}}',
  1.0,
  @method_id,
  1,
  0,
  0,
  'scene',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  json_schema = VALUES(json_schema),
  temperature = VALUES(temperature),
  updated_at = NOW();
