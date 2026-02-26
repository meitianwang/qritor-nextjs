-- The Ruthless Protagonist Novel - Grimdark & Anti-Hero Creation Method
-- Language: English (en)
-- Includes: creation method + 8 module types
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/init_ruthless_protagonist.sql

-- ============================================================
-- 1. Create the creation method
-- ============================================================

INSERT INTO novel_creation_method (name, description, novel_type, language, visible_categories, is_preset, user_id, status, created_at)
VALUES (
  'The Ruthless Protagonist Novel',
  'For creating grimdark and anti-hero fiction. The protagonist has no traditional hero''s moral burden — their core driving force is survival or power. They will sacrifice companions, exploit innocents, and betray allies to achieve their goals. Core appeal: watching the MC use cold rationality and ruthless tactics to defeat hypocritical "righteous" figures. Tags: Evil MC, Cold Protagonist.',
  'Dark Fantasy',
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

SET @method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Ruthless Protagonist Novel' LIMIT 1);

-- ============================================================
-- 2. Create module types (8 total)
-- ============================================================

-- 2.1 Story Hook (setting, singleton)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Story Hook',
  'The core hook that makes readers invested in this ruthless protagonist''s story',
  '{"type":"object","required":["Story Hook"],"properties":{"Story Hook":{"type":"string","title":"Story Hook","description":"One sentence capturing the most compelling aspect of the story — what makes readers NEED to keep reading","x-uiWidget":"textarea","useForAI":true},"Core Selling Point":{"type":"string","title":"Core Selling Point","description":"What makes this ruthless protagonist story unique — the specific brand of ruthlessness and the world that demands it","x-uiWidget":"textarea","useForAI":true},"Opening Tension":{"type":"string","title":"Opening Tension","description":"The tension or impossible situation that hooks readers in the opening chapters","x-uiWidget":"textarea","useForAI":true},"Reader Expectation":{"type":"string","title":"Reader Expectation","description":"What satisfying payoffs readers anticipate — the promise you make to the reader","x-uiWidget":"textarea","useForAI":true}}}',
  1.2,
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
  'The foundational premise defining the ruthless protagonist, their driving force, and the central conflict',
  '{"type":"object","required":["Protagonist Archetype","Central Conflict","Moral Compass"],"properties":{"Protagonist Archetype":{"type":"string","title":"Protagonist Archetype","enum":["The Calculating Strategist","The Survival-Driven Pragmatist","The Fallen Idealist","The Power-Hungry Climber","The Cold Avenger","The Morally Apathetic","Other"],"x-uiWidget":"select","useForAI":true},"Archetype Details":{"type":"string","title":"Archetype Details","description":"Elaborate on the protagonist''s ruthless nature — what broke them or what they were born as","x-uiWidget":"textarea","useForAI":true},"Central Conflict":{"type":"string","title":"Central Conflict","enum":["Rise to Power","Survival Against All Odds","Revenge Across a Broken World","Domination of a Corrupt System","Escape from Chains","War of Ideologies"],"x-uiWidget":"select","useForAI":true},"Moral Compass":{"type":"string","title":"Moral Compass","enum":["No Lines — Pure Pragmatism","Protects Only Inner Circle","Has a Code but Breaks It When Needed","Slowly Losing Humanity","Pretends to Be Worse Than They Are"],"x-uiWidget":"select","useForAI":true},"Story Tone":{"type":"string","title":"Story Tone","enum":["Bleak and Unforgiving","Dark but Cathartic","Cynical with Dark Humor","Grim but Hopeful Undercurrent","Operatic and Tragic"],"x-uiWidget":"radio","useForAI":true},"Stakes":{"type":"string","title":"Stakes","description":"What the protagonist stands to lose if they fail, and what they sacrifice along the way","x-uiWidget":"textarea","useForAI":true}}}',
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

-- 2.3 Power System (setting, singleton)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Power System',
  'The system of power that the protagonist exploits ruthlessly — where gaining strength always costs something',
  '{"type":"object","required":["Power Type"],"properties":{"Power Type":{"type":"string","title":"Power Type","enum":["Hard Magic System","Soft/Mysterious Magic","Martial Arts/Combat Skills","Political/Economic Power","Technology/Artifacts","Divine/Demonic Pacts","No Supernatural Powers"],"x-uiWidget":"select","useForAI":true},"Power Description":{"type":"string","title":"Power Description","description":"How the power system works — its fundamental rules and mechanics","x-uiWidget":"textarea","useForAI":true},"Power Costs":{"type":"string","title":"Power Costs","description":"What price must be paid for power — blood, sanity, humanity, years of life, or the lives of others","x-uiWidget":"textarea","useForAI":true},"Power Tiers":{"type":"string","title":"Power Tiers","description":"The hierarchy of power levels — from street-level threats to world-shaking forces","x-uiWidget":"textarea","useForAI":true},"Protagonist Advantage":{"type":"string","title":"Protagonist Advantage","description":"The protagonist''s unique edge — what lets them climb faster or fight dirtier than others","x-uiWidget":"textarea","useForAI":true},"Forbidden Powers":{"type":"string","title":"Forbidden Powers","description":"Taboo abilities or methods that most won''t touch — but the protagonist might","x-uiWidget":"textarea","useForAI":true}}}',
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

-- 2.4 Writing Style (setting, singleton)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Writing Style',
  'The narrative voice and prose style — how the darkness is rendered on the page',
  '{"type":"object","required":["Narrative POV","Prose Style"],"properties":{"Narrative POV":{"type":"string","title":"Narrative POV","enum":["First Person","Third Person Limited","Third Person Omniscient","Unreliable Narrator"],"x-uiWidget":"radio","useForAI":true},"Prose Style":{"type":"string","title":"Prose Style","enum":["Lean and Brutal","Visceral and Sensory","Cold and Clinical","Lyrical Despite the Darkness","Stream of Consciousness"],"x-uiWidget":"radio","useForAI":true},"Pacing":{"type":"string","title":"Pacing","enum":["Relentless — Never Lets Up","Calculated Build and Release","Slow Burn to Explosive","Episodic Escalation"],"x-uiWidget":"radio","useForAI":true},"Violence Threshold":{"type":"string","title":"Violence Threshold","enum":["Unflinching — Nothing Off-Screen","Strategic — Violence with Purpose","Restrained — Implied More Than Shown","Stylized — Choreographed Brutality"],"x-uiWidget":"radio","useForAI":true},"Banned Words":{"type":"string","title":"Banned Words","description":"Words or expressions to avoid in the writing","x-uiWidget":"textarea","useForAI":true}}}',
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

-- 2.5 Worldbuilding (setting, singleton)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Worldbuilding',
  'The brutal world that demands ruthlessness to survive — where the setting itself is an antagonist',
  '{"type":"object","required":["World Type"],"properties":{"World Type":{"type":"string","title":"World Type","enum":["Dark Fantasy Medieval","Post-Apocalyptic Wasteland","Dystopian Empire","Warring Kingdoms","Grimdark Urban","Cosmic Horror Setting","Other"],"x-uiWidget":"select","useForAI":true},"World Details":{"type":"string","title":"World Details","description":"What makes this world particularly harsh or unforgiving — the specific flavor of its cruelty","x-uiWidget":"textarea","useForAI":true},"Power Structure":{"type":"string","title":"Power Structure","description":"Who holds power and how it''s maintained — through violence, wealth, magic, fear, or all of the above","x-uiWidget":"textarea","useForAI":true},"Social Hierarchy":{"type":"string","title":"Social Hierarchy","description":"The class structure — who gets crushed underfoot and who does the crushing","x-uiWidget":"textarea","useForAI":true},"Key Locations":{"type":"string","title":"Key Locations","description":"Major locations that shape the story''s atmosphere and serve as stages for conflict","x-uiWidget":"textarea","useForAI":true},"World Rules":{"type":"string","title":"World Rules","description":"Laws, customs, or harsh realities that force moral compromise on everyone","x-uiWidget":"textarea","useForAI":true}}}',
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

-- 2.6 Character (character, non-singleton)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Character',
  'Characters in this ruthless world — allies, enemies, pawns, and those caught in between',
  '{"type":"object","x-titleField":"Name","required":["Name","Role"],"properties":{"Name":{"type":"string","title":"Name","description":"Character''s name — no parenthetical notes","useForAI":true},"Role":{"type":"string","title":"Role","enum":["Protagonist","Rival/Nemesis","Reluctant Ally","Expendable Pawn","Mentor Figure","Love Interest","Betrayer","Innocent Victim"],"x-uiWidget":"radio","useForAI":true},"Gender":{"type":"string","title":"Gender","enum":["Male","Female","Non-binary","Other"],"x-uiWidget":"radio","useForAI":true},"Age":{"type":"string","title":"Age","description":"Character''s age or age range","useForAI":true},"Core Motivation":{"type":"string","title":"Core Motivation","description":"What drives this character above all else — their deepest want or need","x-uiWidget":"textarea","useForAI":true},"Moral Alignment":{"type":"string","title":"Moral Alignment","description":"Where they fall on the moral spectrum and why they ended up there","x-uiWidget":"textarea","useForAI":true},"Strengths":{"type":"string","title":"Strengths","description":"Combat skills, political cunning, knowledge, connections, or other advantages","x-uiWidget":"textarea","useForAI":true},"Weaknesses":{"type":"string","title":"Weaknesses","description":"Hidden vulnerabilities, blind spots, or exploitable flaws","x-uiWidget":"textarea","useForAI":true},"Relationship to Protagonist":{"type":"string","title":"Relationship to Protagonist","description":"Their dynamic with the ruthless protagonist — and how it might shift","x-uiWidget":"textarea","useForAI":true},"Current Status":{"type":"string","title":"Current Status","description":"Their current situation in the story","isDynamic":true},"Current Emotional State":{"type":"string","title":"Current Emotional State","description":"Their present emotional/mental state","isDynamic":true}}}',
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
  'Power groups, organizations, and factions the protagonist must navigate, infiltrate, or destroy',
  '{"type":"object","x-titleField":"Faction Name","required":["Faction Name","Faction Type"],"properties":{"Faction Name":{"type":"string","title":"Faction Name","useForAI":true},"Faction Type":{"type":"string","title":"Faction Type","enum":["Criminal Syndicate","Military Order","Religious Cult","Merchant Guild","Noble House","Rebel Movement","Secret Society","Government Body"],"x-uiWidget":"select","useForAI":true},"Philosophy":{"type":"string","title":"Philosophy","description":"The faction''s public ideology versus their hidden true nature","x-uiWidget":"textarea","useForAI":true},"Power Base":{"type":"string","title":"Power Base","description":"What gives this faction its power — resources, territory, military strength, or forbidden knowledge","x-uiWidget":"textarea","useForAI":true},"Key Figures":{"type":"string","title":"Key Figures","description":"The faction''s leaders and power players","x-uiWidget":"textarea","useForAI":true},"Relationship to Protagonist":{"type":"string","title":"Relationship to Protagonist","enum":["Tool to Be Used","Temporary Ally","Sworn Enemy","Unknown to MC","Under MC Control","Rival Power"],"x-uiWidget":"select","useForAI":true},"Internal Weakness":{"type":"string","title":"Internal Weakness","description":"The faction''s exploitable vulnerabilities — every organization has cracks","x-uiWidget":"textarea","useForAI":true},"Current Strength":{"type":"string","title":"Current Strength","description":"Current military and political power level","isDynamic":true},"Internal Stability":{"type":"string","title":"Internal Stability","description":"Internal conflicts, betrayals, or loyalty fractures","isDynamic":true}}}',
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
  'Key locations where pivotal events unfold in this brutal world',
  '{"type":"object","x-titleField":"Location Name","required":["Location Name","Scene Type"],"properties":{"Location Name":{"type":"string","title":"Location Name","useForAI":true},"Scene Type":{"type":"string","title":"Scene Type","enum":["Power Seat","Battlefield","Black Market","Prison/Dungeon","Safe Haven","Forbidden Zone","Public Arena","Ruins/Wasteland"],"x-uiWidget":"select","useForAI":true},"Atmosphere":{"type":"string","title":"Atmosphere","description":"The mood, sensory details, and feeling of this place — what you see, hear, smell","x-uiWidget":"textarea","useForAI":true},"Strategic Value":{"type":"string","title":"Strategic Value","description":"Why this location matters for power, resources, or survival","x-uiWidget":"textarea","useForAI":true},"Dangers":{"type":"string","title":"Dangers","description":"What threats lurk in or around this location","x-uiWidget":"textarea","useForAI":true},"Controlling Faction":{"type":"string","title":"Controlling Faction","description":"Which faction claims or controls this location","isDynamic":true},"Current State":{"type":"string","title":"Current State","description":"Current condition: intact, contested, destroyed, under siege, etc.","isDynamic":true}}}',
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
