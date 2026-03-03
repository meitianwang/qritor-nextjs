-- The Fourth Scourge (Player Summoning) Novel Creation Method
-- Language: English (en)
-- Includes: creation method + 8 module types
-- Usage: mysql -u root -p < database_name < init_fourth_scourge.sql

INSERT INTO novel_creation_method (name_zh, name_en, description_en, novel_type_zh, novel_type_en, language, visible_categories, created_at)
VALUES (
  '第四天灾（玩家召唤）小说',
  'The Fourth Scourge (Player Summoning) Novel',
  'For creating Fourth Scourge fiction. The MC, often a weak native or fallen noble in a dangerous fantasy/sci-fi world, awakens a system that summons gamers from Earth. These "players" are immortal, greedy, and chaotic, treating the deadly real world as a virtual reality game. Focuses on kingdom building and hilarious culture clash.',
  '文字RPG',
  'LitRPG',
  'en',
  '["setting","character","organization","scene"]',
  NOW()
)
ON DUPLICATE KEY UPDATE description_en=VALUES(description_en), novel_type_en=VALUES(novel_type_en), visible_categories=VALUES(visible_categories), updated_at=NOW();

SET @method_id = (SELECT id FROM novel_creation_method WHERE name_en = 'The Fourth Scourge (Player Summoning) Novel' LIMIT 1);

-- 1. Story Hook
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '故事钩子',
  'Story Hook',
  'The MC''s dire situation and the activation of the summoning system.',
  '{"type":"object","required":["The Dire Situation"],"properties":{"The Dire Situation":{"type":"string","title":"The Dire Situation","description":"Why the MC desperately needs help (e.g., about to be executed, last demon lord alive)","x-uiWidget":"textarea","useForAI":true},"The Summoning System":{"type":"string","title":"The Summoning System","description":"How the MC contacts Earth and tricks gamers (e.g., claiming it''s a 100% realistic VR MMORPG)","x-uiWidget":"textarea","useForAI":true},"The Core Comedic/Action Hook":{"type":"string","title":"The Core Hook","description":"The absurdity of gamers treating terrifying real enemies as loot piñatas","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id, 1, 1, 'setting', NOW()
) ON DUPLICATE KEY UPDATE json_schema_en=VALUES(json_schema_en);

-- 2. Core Premise
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '核心设定',
  'Core Premise',
  'Protagonist identity and the fundamental lie told to the players.',
  '{"type":"object","required":["MC Identity","The Big Lie"],"properties":{"MC Identity":{"type":"string","title":"MC Identity / The ''NPC''","enum":["Fallen Human Noble","Last Demon Lord","Rogue AI/World Spirit","Dungeon Core","Exiled God"],"x-uiWidget":"select","useForAI":true},"The Big Lie":{"type":"string","title":"The Big Lie (The Game Premise)","description":"What the players think they are playing (e.g., a grimdark survival crafter, an epic fantasy MMO)","x-uiWidget":"textarea","useForAI":true},"Ultimate Goal":{"type":"string","title":"Ultimate Goal","description":"What the MC uses the players to achieve (conquer the world, rebuild civilization, farm resources)","x-uiWidget":"textarea","useForAI":true},"Tone":{"type":"string","title":"Tone","enum":["Hilarious Culture Clash","Epic Kingdom Building but Gamers are crazy","Dark Fantasy ruined by Trolls"],"x-uiWidget":"radio","useForAI":true}}}',
  @method_id, 1, 1, 'setting', NOW()
) ON DUPLICATE KEY UPDATE json_schema_en=VALUES(json_schema_en);

-- 3. System Mechanics
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '系统机制',
  'System Mechanics',
  'How the MC issues quests, respawns players, and skims their EXP.',
  '{"type":"object","required":["Respawn Mechanic"],"properties":{"Respawn Mechanic":{"type":"string","title":"Respawn Mechanic (The Cloning Process)","description":"How players ''respawn'' (e.g., growing new bodies in vats, molding clay, divine energy)","x-uiWidget":"textarea","useForAI":true},"Quest Dynamics":{"type":"string","title":"Quest Dynamics","description":"How the MC disguises their own problems as ''Main Quests'' or ''Daily Missions''","x-uiWidget":"textarea","useForAI":true},"Economy & Exploitation":{"type":"string","title":"Economy & Exploitation","description":"How the MC taxes players or steals a percentage of their EXP to level up themselves","x-uiWidget":"textarea","useForAI":true},"Player Classes/Factions":{"type":"string","title":"Player Classes","description":"What roles can players take? Are they mutated monsters, customizable humanoids?","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id, 1, 1, 'setting', NOW()
) ON DUPLICATE KEY UPDATE json_schema_en=VALUES(json_schema_en);

-- 4. Worldbuilding
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '世界观',
  'Worldbuilding',
  'The deadly native world that is completely unprepared for immortal gamers.',
  '{"type":"object","required":["The Native World"],"properties":{"The Native World":{"type":"string","title":"The Native World Atmosphere","description":"Serious, deadly, and terrifying (contrasts with the players'' casual attitude)","x-uiWidget":"textarea","useForAI":true},"Native Power Structure":{"type":"string","title":"Native Power Structure","description":"Empires, arrogant gods, or terrifying monsters that currently rule","x-uiWidget":"textarea","useForAI":true},"NPC Perception":{"type":"string","title":"NPC Perception of Players","description":"How natives view these immortal, fearless, and utterly insane ''undead'' or ''chosen ones''","x-uiWidget":"textarea","useForAI":true},"Magic/Tech Level":{"type":"string","title":"Magic/Tech Level","description":"The baseline reality that players are about to break using video game logic","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id, 1, 1, 'setting', NOW()
) ON DUPLICATE KEY UPDATE json_schema_en=VALUES(json_schema_en);

-- 5. Writing Style
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '文风设定',
  'Writing Style',
  'Satirical and humorous, bouncing between the serious natives and the chaotic gamers.',
  '{"type":"object","required":["Narrative POV"],"properties":{"Narrative POV":{"type":"string","title":"Narrative POV","enum":["Third Person Omniscient (MC + Forums)","MC POV alternating with Native Victims","Strictly MC watching the chaos"],"x-uiWidget":"radio","useForAI":true},"Humor Style":{"type":"string","title":"Humor Style","description":"Focus on the sheer absurdity, internet slang, and the ''DiHua'' (Overthinking) of the natives","x-uiWidget":"textarea","useForAI":true},"Focus Areas":{"type":"string","title":"Focus Areas","description":"Base building, forum reactions, epic boss raids where players use stupid but effective tactics","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id, 1, 1, 'setting', NOW()
) ON DUPLICATE KEY UPDATE json_schema_en=VALUES(json_schema_en);

-- 6. Character
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '角色',
  'Character',
  'The MC (Admin), top players, and terrified native inhabitants.',
  '{"type":"object","x-titleField":"Name","required":["Name","Role"],"properties":{"Name":{"type":"string","title":"Name / Gamertag","useForAI":true},"Role":{"type":"string","title":"Role","enum":["The MC (Server Admin)","Hardcore Gamer/Speedrunner","Whale (P2W Player)","Casual/Crafter Player","Terrified Native Overlord","Confused Native Ally"],"x-uiWidget":"select","useForAI":true},"Class/Abilities":{"type":"string","title":"Class/Abilities","description":"Their build or native powers","x-uiWidget":"textarea","useForAI":true},"Personality/Behavior":{"type":"string","title":"Personality/Behavior","description":"For players: griefing, min-maxing, or RPing. For natives: serious, arrogant, or broken.","x-uiWidget":"textarea","useForAI":true},"Relationship to MC":{"type":"string","title":"Relationship to MC (The ''NPC'')","description":"Players worship/simp for the MC; Natives fear or underestimate them","x-uiWidget":"textarea","useForAI":true},"Current Status":{"type":"string","title":"Current Status / Level","isDynamic":true},"Current Location":{"type":"string","title":"Current Location","isDynamic":true}}}',
  @method_id, 1, 0, 'character', NOW()
) ON DUPLICATE KEY UPDATE json_schema_en=VALUES(json_schema_en);

-- 7. Faction
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '阵营',
  'Faction',
  'Player Guilds competing for server firsts, versus serious Native Empires.',
  '{"type":"object","x-titleField":"Faction Name","required":["Faction Name","Faction Type"],"properties":{"Faction Name":{"type":"string","title":"Faction Name","useForAI":true},"Faction Type":{"type":"string","title":"Faction Type","enum":["Player Guild (Hardcore)","Player Guild (Casual/Life Skills)","Native Empire","Native Church/Cult","Monster Horde"],"x-uiWidget":"select","useForAI":true},"Agenda/Playstyle":{"type":"string","title":"Agenda/Playstyle","description":"What is their goal? (e.g., Server first boss kill, wiping out the ''Scourge'')","x-uiWidget":"textarea","useForAI":true},"Key Assets":{"type":"string","title":"Key Assets","description":"Thousands of immortal respawning maniacs, or a legion of elite native knights","x-uiWidget":"textarea","useForAI":true},"Territory":{"type":"string","title":"Territory","description":"Where they operate","x-uiWidget":"textarea","useForAI":true},"Relationship to MC":{"type":"string","title":"Relationship to MC","enum":["The MC''s Army","Friendly/Neutral","Primary Antagonists"],"x-uiWidget":"select","useForAI":true},"Current Influence":{"type":"string","title":"Current Influence","isDynamic":true}}}',
  @method_id, 1, 0, 'organization', NOW()
) ON DUPLICATE KEY UPDATE json_schema_en=VALUES(json_schema_en);

-- 8. Scene
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '场景',
  'Scene',
  'Safe zones, boss dungeons, and lands ruined by players.',
  '{"type":"object","x-titleField":"Location Name","required":["Location Name","Location Type"],"properties":{"Location Name":{"type":"string","title":"Location Name","useForAI":true},"Location Type":{"type":"string","title":"Location Type","enum":["The Safe Zone (Respawn Point)","Raid Dungeon","Native Capital City","Resource Farm/Grinding Spot"],"x-uiWidget":"select","useForAI":true},"Appearance/Atmosphere":{"type":"string","title":"Appearance/Atmosphere","description":"What it looks like (e.g., A majestic elven forest now covered in crude player-built dirt huts)","x-uiWidget":"textarea","useForAI":true},"Strategic Value":{"type":"string","title":"Strategic Value (Loot/EXP)","description":"Why players are swarming it, or why natives are defending it","x-uiWidget":"textarea","useForAI":true},"Environmental Hazards":{"type":"string","title":"Environmental Hazards/Bosses","description":"Traps or massive world bosses residing here","x-uiWidget":"textarea","useForAI":true},"Controlling Faction":{"type":"string","title":"Controlling Faction","isDynamic":true},"Current State":{"type":"string","title":"Current State","isDynamic":true}}}',
  @method_id, 1, 0, 'scene', NOW()
) ON DUPLICATE KEY UPDATE json_schema_en=VALUES(json_schema_en);
