-- Modern Dungeon Break (Hunter) Novel Creation Method
-- Language: English (en)
-- Includes: creation method + 8 module types

INSERT INTO novel_creation_method (name, description, novel_type, language, visible_categories, is_preset, user_id, status, created_at)
VALUES (
  'Modern Dungeon Break (Hunter) Novel',
  'For creating modern urban fantasy with LitRPG elements (e.g., Solo Leveling, Hunter x Hunter). Portals/Gates open in modern cities like Seoul or New York, unleashing monsters. Society is restructured around "Hunters" (Awakened humans) and powerful Guild corporations. The MC is usually a weak/underestimated Hunter who awakens a unique growth system.',
  'LitRPG',
  'en',
  '["setting","character","organization","scene"]',
  1,
  NULL,
  'published',
  NOW()
)
ON DUPLICATE KEY UPDATE description=VALUES(description), novel_type=VALUES(novel_type), visible_categories=VALUES(visible_categories), updated_at=NOW();

SET @method_id = (SELECT id FROM novel_creation_method WHERE name = 'Modern Dungeon Break (Hunter) Novel' LIMIT 1);

-- 1. Story Hook
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Story Hook',
  'The MC''s tragic awakening and the discovery of their solo-cheat system.',
  '{"type":"object","required":["The Pathetic Reality"],"properties":{"The Pathetic Reality":{"type":"string","title":"The Pathetic Reality","description":"Why the MC is at the bottom of the Hunter hierarchy (e.g., F-Rank, drowning in debt to pay hospital bills)","x-uiWidget":"textarea","useForAI":true},"The Hidden Dungeon/Double Lair":{"type":"string","title":"The Hidden Dungeon/Double Lair","description":"The terrifying near-death experience that forces the MC’s second awakening","x-uiWidget":"textarea","useForAI":true},"The Unique System":{"type":"string","title":"The Unique System (The Cheat)","description":"The MC becomes the ONLY player who can level up, view quests, or summon undead","x-uiWidget":"textarea","useForAI":true}}}',
  1.0, @method_id, 1, 1, 0, 'setting', NOW()
) ON DUPLICATE KEY UPDATE json_schema=VALUES(json_schema);

-- 2. Core Premise
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Core Premise',
  'The MC''s hidden class and their brutal climb to the top of the Guild hierarchy.',
  '{"type":"object","required":["The Hidden Class"],"properties":{"The Hidden Class":{"type":"string","title":"The Hidden Class","description":"The MC''s insanely overpowered unique job (e.g., Shadow Monarch, Necromancer, Mythic Spellcaster)","x-uiWidget":"textarea","useForAI":true},"Current Goal":{"type":"string","title":"Current Goal","description":"Cure a sick relative, pay off massive debt, or revenge against the top Guild","x-uiWidget":"textarea","useForAI":true},"Handling Fame":{"type":"string","title":"Handling Fame","description":"Does the MC hide their power (smurfing) or immediately flex to get corporate sponsorships?","x-uiWidget":"textarea","useForAI":true},"Tone":{"type":"string","title":"Dominant Tone","enum":["Edgy Solo Power Fantasy","Corporate/Guild Warfare","Monster Hunting Progression"],"x-uiWidget":"radio","useForAI":true}}}',
  1.0, @method_id, 1, 1, 0, 'setting', NOW()
) ON DUPLICATE KEY UPDATE json_schema=VALUES(json_schema);

-- 3. System Mechanics
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'System Mechanics',
  'How Hunters are ranked and how the MC breaks those rules via their UI.',
  '{"type":"object","required":["The Global Ranking System"],"properties":{"The Global Ranking System":{"type":"string","title":"Global Ranking System","description":"F-Rank to S-Rank. Once awakened, power levels are totally fixed for normal people.","x-uiWidget":"textarea","useForAI":true},"MC''s Solo Leveling Interface":{"type":"string","title":"MC''s Interface","description":"How the MC alone sees floating blue stat screens (STR, AGI, INT) and earns EXP","x-uiWidget":"textarea","useForAI":true},"Daily Quests / Penalties":{"type":"string","title":"Daily Quests & Penalties","description":"E.g., 100 pushups daily; failure results in being teleported to a desert survival zone","x-uiWidget":"textarea","useForAI":true}}}',
  0.8, @method_id, 1, 1, 0, 'setting', NOW()
) ON DUPLICATE KEY UPDATE json_schema=VALUES(json_schema);

-- 4. Worldbuilding
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Worldbuilding',
  'A modern society dependent on monster magic cores and ruled by Guild Corporations.',
  '{"type":"object","required":["The Gates"],"properties":{"The Gates / Dungeon Breaks":{"type":"string","title":"The Gates (Portals)","description":"Swirling portals appear randomly in cities. If not cleared in 7 days, monsters break out.","x-uiWidget":"textarea","useForAI":true},"The Monster Economy":{"type":"string","title":"The Monster Economy","description":"Society runs on Mana Cores and monster parts used for power and new materials","x-uiWidget":"textarea","useForAI":true},"The Guild Corporations":{"type":"string","title":"Guild Corporations","description":"Top Guilds have more power and military might than the national government","x-uiWidget":"textarea","useForAI":true}}}',
  1.0, @method_id, 1, 1, 0, 'setting', NOW()
) ON DUPLICATE KEY UPDATE json_schema=VALUES(json_schema);

-- 5. Writing Style
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Writing Style',
  'Extreme power fantasy pacing, focusing on visual dominance and leveling up.',
  '{"type":"object","required":["Combat Aesthetics"],"properties":{"Combat Aesthetics":{"type":"string","title":"Combat Aesthetics","description":"Fast-paced, brutal, showing the sheer physical gap between the MC and enemies (e.g. punching a dragon through a skyscraper)","x-uiWidget":"textarea","useForAI":true},"The ''Face-Slapping'' (Satisfaction)":{"type":"string","title":"The Satisfaction / Face-Slapping","description":"Building up arrogant A-Rank hunters only for the seemingly ''weak'' MC to instantly crush them","x-uiWidget":"textarea","useForAI":true},"Stat Prompt Integration":{"type":"string","title":"Stat Prompt Integration","description":"Using [LEVEL UP!] and [NEW SKILL ACQUIRED] to punctuate dramatic moments","x-uiWidget":"textarea","useForAI":true}}}',
  0.7, @method_id, 1, 1, 0, 'setting', NOW()
) ON DUPLICATE KEY UPDATE json_schema=VALUES(json_schema);

-- 6. Character
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Character',
  'The MC, arrogant S-Ranks, Guild Masters, and loyal summons/teammates.',
  '{"type":"object","x-titleField":"Name","required":["Name","Role"],"properties":{"Name":{"type":"string","title":"Name","useForAI":true},"Role":{"type":"string","title":"Role","enum":["The Solo MC","Arrogant S-Rank Hunter","Loyal Porter/Healer (Sidekick)","Corporate Guild Master","Government Hunter Association Agent"],"x-uiWidget":"select","useForAI":true},"Rank & Class":{"type":"string","title":"Hunter Rank & Class","description":"e.g., A-Rank Tank, B-Rank Assasin, or ''Unmeasurable''","x-uiWidget":"textarea","useForAI":true},"Personality":{"type":"string","title":"Personality","description":"Arrogant, calculating, fiercely loyal, or money-driven","x-uiWidget":"textarea","useForAI":true},"Relationship to MC":{"type":"string","title":"Relationship to MC","description":"Do they worship the MC, want to recruit them, or want them dead?","x-uiWidget":"textarea","useForAI":true},"Current Status":{"type":"string","title":"Current Status / Weapon","isDynamic":true},"Current Location":{"type":"string","title":"Current Location","isDynamic":true}}}',
  1.0, @method_id, 1, 0, 0, 'character', NOW()
) ON DUPLICATE KEY UPDATE json_schema=VALUES(json_schema);

-- 7. Faction
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Faction',
  'Mega-Guilds, the Hunter Association, and Villain Syndicates.',
  '{"type":"object","x-titleField":"Faction Name","required":["Faction Name","Faction Type"],"properties":{"Faction Name":{"type":"string","title":"Faction Name","useForAI":true},"Faction Type":{"type":"string","title":"Faction Type","enum":["Top-Tier Mega Guild","Hunter Association (Government)","Dark/Villain Syndicate","Scavenger/Porter Group (Bottom tier)"],"x-uiWidget":"select","useForAI":true},"Corporate Strategy":{"type":"string","title":"Corporate Strategy/Vibe","description":"Are they ruthless capitalists, military structured, or a brotherhood?","x-uiWidget":"textarea","useForAI":true},"Key Assets":{"type":"string","title":"Key Assets (Top Hunters)","description":"Who is their ace? (e.g., they employ two S-Rank Hunters)","x-uiWidget":"textarea","useForAI":true},"Current Influence":{"type":"string","title":"Current Influence","isDynamic":true}}}',
  1.0, @method_id, 1, 0, 0, 'organization', NOW()
) ON DUPLICATE KEY UPDATE json_schema=VALUES(json_schema);

-- 8. Scene
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Scene',
  'Neon-lit city streets, glowing blue portals, and terrifying underground boss rooms.',
  '{"type":"object","x-titleField":"Location Name","required":["Location Name","Location Type"],"properties":{"Location Name":{"type":"string","title":"Location Name","useForAI":true},"Location Type":{"type":"string","title":"Location Type","enum":["City Gate Appearance (Urban)","Low-Rank Mine/Dungeon","S-Rank Red Gate (Boss Room)","Guild Corporate Headquarters"],"x-uiWidget":"select","useForAI":true},"Atmosphere / Lighting":{"type":"string","title":"Atmosphere / Lighting","description":"Contrast the sleek glass of the corporate HQ with the blood-drenched stalactites of a dungeon","x-uiWidget":"textarea","useForAI":true},"The Hidden Threat":{"type":"string","title":"The Hidden Threat (Monsters)","description":"Giant iron-jawed ants, undead knights, or corrupted hunters","x-uiWidget":"textarea","useForAI":true},"Current State":{"type":"string","title":"Current State (Uncleared/Cleared)","isDynamic":true}}}',
  1.0, @method_id, 1, 0, 0, 'scene', NOW()
) ON DUPLICATE KEY UPDATE json_schema=VALUES(json_schema);
