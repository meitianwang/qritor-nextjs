-- Cli-Fi / Climate Fiction Novel Creation Method
-- Language: English (en)
-- Includes: creation method + 8 module types
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/init_clifi.sql

-- ============================================================
-- 1. Create the creation method
-- ============================================================

INSERT INTO novel_creation_method (name, description, novel_type, language, visible_categories, is_preset, user_id, status, created_at)
VALUES (
  'Cli-Fi / Climate Fiction Novel',
  'For creating Climate Fiction (Cli-Fi), focusing on survival in a world drastically altered by extreme climate change (e.g., global flooding, endless drought, deep freeze). Blends realistic sci-fi with dystopian elements, exploring resource scarcity and lost civilizations.',
  'Sci-Fi',
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

SET @method_id = (SELECT id FROM novel_creation_method WHERE name = 'Cli-Fi / Climate Fiction Novel' LIMIT 1);

-- ============================================================
-- 2. Create module types (8 total)
-- ============================================================

-- 2.1 Story Hook (setting, singleton)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Story Hook',
  'The core hook that draws readers into the harsh reality of the climate-altered world and the protagonist''s immediate struggle.',
  '{"type":"object","required":["Story Hook"],"properties":{"Story Hook":{"type":"string","title":"Story Hook","description":"One sentence capturing the core appeal (e.g., A deep-sea diver scavenging flooded skyscrapers finds a dry map to a green Eden)","x-uiWidget":"textarea","useForAI":true},"Environmental Catalyst":{"type":"string","title":"Environmental Catalyst","description":"The specific extreme weather event driving the plot (e.g., the approach of a century-long mega-storm)","x-uiWidget":"textarea","useForAI":true},"Opening Tension":{"type":"string","title":"Opening Tension","description":"The immediate survival crisis (e.g., their water filtration system breaks, or a warlord attacks their oasis)","x-uiWidget":"textarea","useForAI":true},"Reader Expectation":{"type":"string","title":"Reader Expectation","description":"The anticipated payoffs: discovering lost technology, reaching a safe haven, or overthrowing the resource monopolies","x-uiWidget":"textarea","useForAI":true}}}',
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

-- 2.2 Core Premise (setting, singleton)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Core Premise',
  'The foundational premise defining the protagonist''s identity and the central conflict in this dystopian environment.',
  '{"type":"object","required":["Protagonist Archetype","Central Conflict"],"properties":{"Protagonist Archetype":{"type":"string","title":"Protagonist Archetype","enum":["Lone Scavenger/Drifter","Protector of a Vulnerable Settlement","Escaped Dystopian Elite","Eco-Scientist/Archivist","Courier across the Wasteland"],"x-uiWidget":"select","useForAI":true},"Archetype Details":{"type":"string","title":"Archetype Details","description":"Their background and specialized survival skills (e.g., can repair old-world solar panels)","x-uiWidget":"textarea","useForAI":true},"Central Conflict":{"type":"string","title":"Central Conflict","enum":["Searching for a Mythical Safe Zone (Eden)","Protecting a Vital Resource (e.g., the last uncorrupted seeds)","Overthrowing a Resource Monopoly (Water/Air Baron)","Surviving a Cataclysmic Migration","Uncovering the Truth of the Climate Collapse"],"x-uiWidget":"select","useForAI":true},"Moral Compass":{"type":"string","title":"Moral Compass","enum":["Pragmatic Survivor (Will do anything to live)","Protector of the Weak (Holding onto humanity)","Seeking Redemption for past sins","Aesthetic preservationist of the old world"],"x-uiWidget":"select","useForAI":true},"Story Tone":{"type":"string","title":"Story Tone","enum":["Bleak and Gritty Survivalism","Melancholic but Hopeful","Action-packed Wasteland Adventure","Slow-burn Eco-Mystery","Philosophical Post-Apocalypse"],"x-uiWidget":"radio","useForAI":true}}}',
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

-- 2.3 Survival Mechanics (setting, singleton)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Survival Mechanics',
  'The realistic or semi-realistic mechanics of staying alive: resources, technology, and environmental dangers.',
  '{"type":"object","required":["Primary Threat"],"properties":{"Primary Threat":{"type":"string","title":"Primary Threat (The Climate Constraint)","enum":["Global Submersion (Water World)","Desertification (Desert Wasteland)","Ice Age (Deep Freeze)","Toxic Atmosphere (Unbreathable Air)","Extreme Volatility (Constant Mega-Storms)"],"x-uiWidget":"select","useForAI":true},"Ultimate Scarcity":{"type":"string","title":"Ultimate Scarcity","description":"What is the currency of this world? (e.g., Clean Water, Breathable Oxygen, Uncontaminated Soil, Batteries)","x-uiWidget":"textarea","useForAI":true},"Technology Level":{"type":"string","title":"Technology Level","description":"What old-world tech survived? Is it cobbled-together steampunk, decaying advanced sci-fi, or primitive?","x-uiWidget":"textarea","useForAI":true},"Adaptations/Mutations":{"type":"string","title":"Human/Biological Adaptations","description":"How have humans or animals physically adapted? (e.g., synthetic lungs, UV-resistant skin, mutated predators)","x-uiWidget":"textarea","useForAI":true}}}',
  0.8,
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
  'The history of the climate collapse and the structure of the remaining human civilization.',
  '{"type":"object","required":["The Great Collapse"],"properties":{"The Great Collapse":{"type":"string","title":"The Great Collapse (The Event)","description":"The tipping point that ruined the world (e.g., The Melt, The Ash Winter, The Great Drying)","x-uiWidget":"textarea","useForAI":true},"Current Civilization Structure":{"type":"string","title":"Current Civilization Structure","enum":["Isolated Fortified City-States","Nomadic Convoys/Flotillas","Underground Bunkers (Silos)","Floating Debris Towns","Corporate Eco-Domes for the Rich"],"x-uiWidget":"select","useForAI":true},"Old-World Relics":{"type":"string","title":"Old-World Relics","description":"How is the 21st century viewed? Are skyscrapers treated as mines? Are smartphones religious artifacts?","x-uiWidget":"textarea","useForAI":true},"Social Disparity":{"type":"string","title":"Social Disparity","description":"The gap between those who control the resources (living in climate-controlled luxury) and those suffering outside","x-uiWidget":"textarea","useForAI":true}}}',
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
  'The narrative tone, perspective, and pacing of the climate fiction story.',
  '{"type":"object","required":["Narrative POV"],"properties":{"Narrative POV":{"type":"string","title":"Narrative POV","enum":["First Person (Intimate/Journalistic)","Third Person Limited (Close focus on survival)","Multiple POVs (Different societal classes)"],"x-uiWidget":"radio","useForAI":true},"Sensory Focus":{"type":"string","title":"Sensory Focus","description":"Emphasize what the environment feels like (e.g., the cracking of dry lips, the blinding glare of the ice, the smell of algae)","x-uiWidget":"textarea","useForAI":true},"Pacing":{"type":"string","title":"Pacing","enum":["Methodical and Tension-heavy (Focus on logistics)","Fast-paced Chase/Migration","Slow burn uncovering the past"],"x-uiWidget":"radio","useForAI":true},"Theme Handling":{"type":"string","title":"Theme Handling","enum":["Warning/Cautionary Tale","Resilience of the Human Spirit","Nature Reclaiming the Earth","The Inevitability of Extinction"],"x-uiWidget":"radio","useForAI":true}}}',
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
  'Survivors, warlords, archivists, and elite citizens of the climate-altered world.',
  '{"type":"object","x-titleField":"Name","required":["Name","Role"],"properties":{"Name":{"type":"string","title":"Name","useForAI":true},"Role":{"type":"string","title":"Role","enum":["Protagonist/Scavenger","Warlord/Resource Baron","Sheltered Elite","Old-World Scholar/Archivist","Nomad Guide","Desperate Refugee"],"x-uiWidget":"select","useForAI":true},"Survival Skill":{"type":"string","title":"Survival Skill","description":"What keeps them alive? (e.g., water filtration expert, brutal fighter, weather reader)","x-uiWidget":"textarea","useForAI":true},"Physical Appearance":{"type":"string","title":"Physical Appearance & Gear","description":"How has the environment scarred them? What protective gear do they wear?","x-uiWidget":"textarea","useForAI":true},"Core Motivation":{"type":"string","title":"Core Motivation","description":"What drives them beyond mere survival? (Hope for Eden, greed, protecting a child)","x-uiWidget":"textarea","useForAI":true},"Relationship to Protagonist":{"type":"string","title":"Relationship to Protagonist","description":"Enemy, ally, dependent, employer?","x-uiWidget":"textarea","useForAI":true},"Current Status":{"type":"string","title":"Current Status (Health/Resources)","isDynamic":true},"Current Location":{"type":"string","title":"Current Location","isDynamic":true}}}',
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
  'Resource monopolies, scavenger tribes, and technological cults.',
  '{"type":"object","x-titleField":"Faction Name","required":["Faction Name","Faction Type"],"properties":{"Faction Name":{"type":"string","title":"Faction Name","useForAI":true},"Faction Type":{"type":"string","title":"Faction Type","enum":["Resource Monopoly (Water/Air Baron)","Nomadic Tribe/Flotilla","Technological Cult (Worshipping old tech)","Eco-Terrorists/Radicals","Dystopian Government Remnant","Scavenger Gang"],"x-uiWidget":"select","useForAI":true},"Ideology/Beliefs":{"type":"string","title":"Ideology/Beliefs","description":"How do they justify their actions in this harsh world?","x-uiWidget":"textarea","useForAI":true},"Key Assets":{"type":"string","title":"Key Assets/Controlled Resources","description":"What makes them powerful? (e.g., control over the only functional desalination plant)","x-uiWidget":"textarea","useForAI":true},"Territory":{"type":"string","title":"Territory","description":"Where do they operate?","x-uiWidget":"textarea","useForAI":true},"Relationship to Protagonist":{"type":"string","title":"Relationship to Protagonist","enum":["Hostile","Neutral/Trading","Allied","Protagonist belongs to them"],"x-uiWidget":"select","useForAI":true},"Current Influence":{"type":"string","title":"Current Influence/Power Level","isDynamic":true},"Current Supply Status":{"type":"string","title":"Current Supply Status (Starving/Thriving)","isDynamic":true}}}',
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
  'Locations where survival, scavenging, and conflict occur in the altered environment.',
  '{"type":"object","x-titleField":"Location Name","required":["Location Name","Location Type"],"properties":{"Location Name":{"type":"string","title":"Location Name","useForAI":true},"Location Type":{"type":"string","title":"Location Type","enum":["Old-World Ruin (Scavenging site)","Fortified Settlement/Oasis","The Open Wasteland (Desert/Ocean/Ice)","Elite Eco-Dome/Bunker","Trading Outpost/Black Market"],"x-uiWidget":"select","useForAI":true},"Atmosphere/Sensory Details":{"type":"string","title":"Atmosphere/Sensory Details","description":"What does it look, smell, and feel like? (e.g., rust, salt, blinding UV light, the hum of dying generators)","x-uiWidget":"textarea","useForAI":true},"Strategic Value":{"type":"string","title":"Strategic Value/Resources","description":"Why are people fighting over this place? (e.g., a hidden cache of old-world canned food)","x-uiWidget":"textarea","useForAI":true},"Environmental Hazards":{"type":"string","title":"Environmental Hazards","description":"Toxic storms, structural collapse, extreme temperatures, or mutated wildlife","x-uiWidget":"textarea","useForAI":true},"Controlling Faction":{"type":"string","title":"Controlling Faction","isDynamic":true},"Current State":{"type":"string","title":"Current State (Safe/Destroyed/Overrun)","isDynamic":true}}}',
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
