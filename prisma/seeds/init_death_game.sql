-- Death Game & Cosmic Streamer Novel Creation Method
-- Language: English (en)
-- Includes: creation method + 8 module types

INSERT INTO novel_creation_method (name, description, novel_type, language, visible_categories, is_preset, user_id, status, created_at)
VALUES (
  'Death Game & Cosmic Streamer Novel',
  'For creating death-game and cosmic broadcasting fiction (e.g., Hunger Games meets Twitch streaming/Omniscient Reader''s Viewpoint). The protagonist must survive brutal instances while entertaining higher-dimensional "Gods/Constellations" via a live stream to earn donations for survival items.',
  'Horror',
  'en',
  '["setting","character","organization","scene"]',
  1,
  NULL,
  'published',
  NOW()
)
ON DUPLICATE KEY UPDATE description=VALUES(description), novel_type=VALUES(novel_type), visible_categories=VALUES(visible_categories), updated_at=NOW();

SET @method_id = (SELECT id FROM novel_creation_method WHERE name = 'Death Game & Cosmic Streamer Novel' LIMIT 1);

-- 1. Story Hook
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Story Hook',
  'The sudden apocalypse/abduction and the awakening of the streaming interface.',
  '{"type":"object","required":["The Abduction Event"],"properties":{"The Abduction Event":{"type":"string","title":"The Abduction Event","description":"How mundane life was violently interrupted (e.g., subway car suddenly teleports to a monster arena)","x-uiWidget":"textarea","useForAI":true},"The First Broadcast":{"type":"string","title":"The First Broadcast","description":"The terrifying realization that floating eyes/drones are filming them dying for entertainment","x-uiWidget":"textarea","useForAI":true},"The Protagonist’s Edge":{"type":"string","title":"The Protagonist’s Edge","description":"Why the MC stands out to the viewers immediately (e.g., extreme ruthlessness, knowing the future, exploiting a bug)","x-uiWidget":"textarea","useForAI":true}}}',
  1.0, @method_id, 1, 1, 0, 'setting', NOW()
) ON DUPLICATE KEY UPDATE json_schema=VALUES(json_schema);

-- 2. Core Premise
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Core Premise',
  'MC identity, their specific stream persona, and the main goal.',
  '{"type":"object","required":["The Persona"],"properties":{"The Persona":{"type":"string","title":"Stream Persona (The Gimmick)","description":"How the MC acts to get tips (e.g., The Psychopathic Comedian, The Quiet Professional, The Scammer)","x-uiWidget":"textarea","useForAI":true},"The Ultimate Goal":{"type":"string","title":"The Ultimate Goal","description":"Besides survival, what do they want? (e.g., Hunt down the Constellations, save their sister, buy their planet''s freedom)","x-uiWidget":"textarea","useForAI":true},"The Audience Dynamic":{"type":"string","title":"The Audience Dynamic","description":"Are the gods bloodthirsty, bored, or treating it like a comedy?","x-uiWidget":"textarea","useForAI":true},"Dominant Tone":{"type":"string","title":"Dominant Tone","enum":["Dark Comedy & Gore","Desperate Thriller","Manipulative Mastermind"],"x-uiWidget":"radio","useForAI":true}}}',
  1.0, @method_id, 1, 1, 0, 'setting', NOW()
) ON DUPLICATE KEY UPDATE json_schema=VALUES(json_schema);

-- 3. System Mechanics
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'System Mechanics',
  'How the chat, donations, and sponsorship work.',
  '{"type":"object","required":["The Streaming Interface"],"properties":{"The Streaming Interface":{"type":"string","title":"The Streaming Interface","description":"How chat messages appear (blue holograms in retina) and how tipping works","x-uiWidget":"textarea","useForAI":true},"The Sponsor System":{"type":"string","title":"The Sponsor System","description":"How powerful Gods can become a ''Sponsor'' (sugar daddy) granting exclusive powers/stigmas","x-uiWidget":"textarea","useForAI":true},"The Penalty/Bounty":{"type":"string","title":"The Penalty/Bounty System","description":"If chat gets bored, stats drop or a bounty is placed on the MC''s head","x-uiWidget":"textarea","useForAI":true}}}',
  0.8, @method_id, 1, 1, 0, 'setting', NOW()
) ON DUPLICATE KEY UPDATE json_schema=VALUES(json_schema);

-- 4. Worldbuilding
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Worldbuilding',
  'The hierarchy of the cosmic broadcasters and the structure of the death games.',
  '{"type":"object","required":["The Constellations"],"properties":{"The Constellations":{"type":"string","title":"The Constellations/Viewers","description":"Cosmic entities, mythological gods, or highly advanced aliens watching the stream","x-uiWidget":"textarea","useForAI":true},"The Game Structure":{"type":"string","title":"The Game Structure (Scenarios)","description":"How levels progress (e.g., Floor 1 is Battle Royale, Floor 2 is Puzzle Survival)","x-uiWidget":"textarea","useForAI":true},"The True Organizers":{"type":"string","title":"The True Organizers","description":"The central AI or High Council that runs the streaming platform","x-uiWidget":"textarea","useForAI":true}}}',
  1.0, @method_id, 1, 1, 0, 'setting', NOW()
) ON DUPLICATE KEY UPDATE json_schema=VALUES(json_schema);

-- 5. Writing Style
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Writing Style',
  'Intercutting bloody survival with sarcastic chat messages and system prompts.',
  '{"type":"object","required":["Intercutting Chat"],"properties":{"Intercutting Chat":{"type":"string","title":"Intercutting Chat Messages","description":"How to seamlessly weave floating chat messages (''Constellation [Blood Demon] throws 500 coins and laughs at your misery'') mid-combat","x-uiWidget":"textarea","useForAI":true},"Pacing of Stakes":{"type":"string","title":"Pacing of Stakes","description":"High-octane action combined with the stress of the ''Viewer Count'' dropping","x-uiWidget":"textarea","useForAI":true},"The Fourth Wall Break":{"type":"string","title":"The Fourth Wall Break","description":"MC often directly speaks to the \'camera\' to manipulate gods","x-uiWidget":"textarea","useForAI":true}}}',
  0.7, @method_id, 1, 1, 0, 'setting', NOW()
) ON DUPLICATE KEY UPDATE json_schema=VALUES(json_schema);

-- 6. Character
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Character',
  'The MC, the sugar-daddy gods, and the fellow terrified/ruthless candidates.',
  '{"type":"object","x-titleField":"Name","required":["Name","Role"],"properties":{"Name":{"type":"string","title":"Name / Title","useForAI":true},"Role":{"type":"string","title":"Role","enum":["The Protagonist (Incarnation)","Sugar-Daddy Constellation (Sponsor)","Rival Player (Top Streamer)","Cannon Fodder Teammate","Sadistic Game Master"],"x-uiWidget":"select","useForAI":true},"Abilities / Stigma":{"type":"string","title":"Abilities / Stigma","description":"Their sponsored power","x-uiWidget":"textarea","useForAI":true},"True Nature/Motivation":{"type":"string","title":"True Nature vs Stream Persona","description":"Are they faking their cruelty for views, or actually psycho?","x-uiWidget":"textarea","useForAI":true},"Current Status":{"type":"string","title":"Current Status / Coin Balance","isDynamic":true},"Current Location":{"type":"string","title":"Current Location (Scenario Zone)","isDynamic":true}}}',
  1.0, @method_id, 1, 0, 0, 'character', NOW()
) ON DUPLICATE KEY UPDATE json_schema=VALUES(json_schema);

-- 7. Faction
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Faction',
  'Player Alliances vs Constellation Pantheons.',
  '{"type":"object","x-titleField":"Faction Name","required":["Faction Name","Faction Type"],"properties":{"Faction Name":{"type":"string","title":"Faction Name","useForAI":true},"Faction Type":{"type":"string","title":"Faction Type","enum":["Player Alliance / Guild","Cosmic Broadcasting Network","Constellation Pantheon (e.g. Mount Olympus)","Anti-Stream Rebellion"],"x-uiWidget":"select","useForAI":true},"Agenda":{"type":"string","title":"Agenda","description":"Win the championship, or destroy the broadcasting servers?","x-uiWidget":"textarea","useForAI":true},"Key Assets":{"type":"string","title":"Key Assets","description":"Massive coin wealth or high-ranking players","x-uiWidget":"textarea","useForAI":true},"Current Influence":{"type":"string","title":"Current Influence / Sub Count","isDynamic":true}}}',
  1.0, @method_id, 1, 0, 0, 'organization', NOW()
) ON DUPLICATE KEY UPDATE json_schema=VALUES(json_schema);

-- 8. Scene
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Scene',
  'Brutal death arenas shaped like normal places, and the cosmic VIP lounge.',
  '{"type":"object","x-titleField":"Location Name","required":["Location Name","Location Type"],"properties":{"Location Name":{"type":"string","title":"Location Name","useForAI":true},"Location Type":{"type":"string","title":"Location Type","enum":["Death Game Arena (Earth Ruin)","The Waiting Room / Shop","The Cosmic VIP Lounge","The Administrator''s Void"],"x-uiWidget":"select","useForAI":true},"Arena Trap Mechanics":{"type":"string","title":"Arena Trap Mechanics","description":"How it kills players (e.g., floors drop into lava if viewer count dips under 1000)","x-uiWidget":"textarea","useForAI":true},"Atmosphere":{"type":"string","title":"Atmosphere","description":"Neon holograms mixed with brutal blood and gore","x-uiWidget":"textarea","useForAI":true},"Current State":{"type":"string","title":"Current State (Active/Cleared)","isDynamic":true}}}',
  1.0, @method_id, 1, 0, 0, 'scene', NOW()
) ON DUPLICATE KEY UPDATE json_schema=VALUES(json_schema);
