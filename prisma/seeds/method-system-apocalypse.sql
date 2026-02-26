-- -----------------------------------------------------------------------------
-- System Apocalypse Creation Method Initialization SQL
-- -----------------------------------------------------------------------------

SET @method_id = 79; 
SET @method_name = 'System Apocalypse (LitRPG)';
SET @method_desc = 'A reality-bending LitRPG genre where Earth is suddenly integrated into a universal "System". Modern civilization collapses instantly as game mechanics, classes, monsters, and stats become the new rules of survival.';
SET @novel_type = 'LitRPG';
SET @language = 'en';
SET @visible_categories = '["setting", "character", "scene", "prop", "organization"]';

-- 1. Create Novel Creation Method
INSERT INTO novel_creation_method 
  (id, name, description, novel_type, language, visible_categories, is_preset, status, created_at, updated_at)
VALUES
  (@method_id, @method_name, @method_desc, @novel_type, @language, @visible_categories, 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
  name = VALUES(name), description = VALUES(description), novel_type = VALUES(novel_type), 
  language = VALUES(language), visible_categories = VALUES(visible_categories), is_preset = VALUES(is_preset), status = VALUES(status), updated_at = NOW();

-- Preset Module IDs
SET @m_hook_id  = 8170501790000000001;
SET @m_world_id = 8170501790000000002;
SET @m_style_id = 8170501790000000003;
SET @m_char_id  = 8170501790000000004;
SET @m_scene_id = 8170501790000000005;
SET @m_prop_id  = 8170501790000000006;
SET @m_org_id   = 8170501790000000007;

-- -------------------------
-- 3.1 Hook (setting) - Singleton
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_hook_id, 
    'The Integration Event', 
    'The chaotic first hour when the blue screens appear and the world ends.', 
    '{"type": "object", "title": "The Integration Event", "properties": {"The_Initial_Blue_Screen": {"title": "The Initial Blue Screen", "type": "string", "description": "What is the exact text of the first System notification everyone receives? (e.g., \'Welcome to the Multiverse. Tutorial Phase 1 starting in 3...\')", "x-uiWidget": "textarea", "useForAI": true}, "Protagonists_Current_Location": {"title": "Protagonist\'s Starting Location", "type": "string", "enum": ["In the middle of a crowded city center (Mass panic)", "Trapped in a moving vehicle/flight", "Isolated in the wilderness or a remote cabin", "At a mundane office or school"], "x-uiWidget": "radio", "useForAI": true}, "First_Blood": {"title": "First Blood / First Monster", "type": "string", "description": "How does the protagonist secure their first kill and unlock the system? What mundane item do they use?", "x-uiWidget": "textarea", "useForAI": true}, "The_Exploit": {"title": "The Early Advantage/Exploit", "type": "string", "description": "What unique advantage does the protagonist get? (e.g., They are a regressor, they found a hidden bug in the tutorial, or unlocked a hidden SSS-class).", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["The_Initial_Blue_Screen", "First_Blood", "The_Exploit"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.2 Worldview (setting) - Singleton
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_world_id, 
    'The System & Earth\'s Ruin', 
    'The mechanical rules governing the new reality and the clash with modern tech.', 
    '{"type": "object", "title": "World Mechanics", "properties": {"System_Origin": {"title": "System Origin & Purpose", "type": "string", "enum": ["Alien Entertainment / Broadcasted Death Game", "Cosmic Trial for Evolutionary Advancement", "A magical virus infecting reality itself", "Unknown/Indifferent Eldritch Force"], "x-uiWidget": "radio", "useForAI": true}, "Class_and_Stat_Mechanics": {"title": "Class & Stat Mechanics", "type": "string", "description": "How do stats work? Is it an open class system, or do you choose paths? How rare is magic compared to physical skills?", "x-uiWidget": "textarea", "useForAI": true}, "The_Collapse_of_Modern_Tech": {"title": "Tech vs System", "type": "string", "description": "Do guns still work, or does the System \'nerf\' physics? How fast did governments fall?", "x-uiWidget": "textarea", "useForAI": true}, "Safe_Zones_and_Tutorials": {"title": "Safe Zones / Turf Mechanics", "type": "string", "description": "Are there glowing blue circles that monsters can\'t enter? Do they cost points to maintain?", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["System_Origin", "Class_and_Stat_Mechanics", "The_Collapse_of_Modern_Tech"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.3 Style (setting) - Singleton
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_style_id, 
    'LitRPG Survival Style', 
    'Balancing gritty apocalyptic survival with crunchy game mechanics.', 
    '{"type": "object", "title": "Narrative Style", "properties": {"Crunchiness_Level": {"title": "LitRPG \'Crunchiness\'", "type": "string", "enum": ["Crunchy (Tables, exact stats, heavy math focus)", "Medium (Stats matter but are summarized)", "Lite (Blue screens appear but focus is on action/world)"], "x-uiWidget": "radio", "useForAI": true}, "Tone_and_Focus": {"title": "Tone & Focus", "type": "string", "description": "Guideline: The tone must blend visceral survival horror (people dying brutally) with the dopamine hit of gaming progression (level up notifications, unboxing loot).", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Crunchiness_Level"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.4 Characters (character) - Multiple
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_char_id, 
    'Pioneers & Survivors', 
    'Characters defined by their apocalyptic builds and moral compromises.', 
    '{"type": "object", "title": "Character Profile", "x-titleField": "Name_and_Class", "properties": {"Name_and_Class": {"title": "Name & Class", "type": "string", "description": "e.g., John (Spellblade), Sarah (Shadow Cleric)", "useForAI": true}, "Pre_Apocalypse_Background": {"title": "Pre-Apocalypse Job", "type": "string", "enum": ["Office Worker / Gamer (The Everyman)", "Military / Ex-Cop (Combat Ready)", "Doctor / Engineer (Support/Crafter)", "Criminal / Outsider (Ruthless)"], "x-uiWidget": "select", "useForAI": true}, "Build_and_Unique_Skill": {"title": "Build & Unique Skill", "type": "string", "description": "What is their combat style? (e.g., A tank who uses blood magic, a sniper who uses telekinesis). What is their one overpowered \'cheat\' skill?", "x-uiWidget": "textarea", "useForAI": true}, "Moral_Alignment": {"title": "Moral Alignment Post-Integration", "type": "string", "description": "Are they a ruthless pragmatist saving only themselves, a reluctant hero building a safe zone, or a villain exploiting the weak?", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Name_and_Class", "Build_and_Unique_Skill", "Moral_Alignment"]}',
    @method_id, 'character', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.5 Scenes (scene) - Multiple
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_scene_id, 
    'Apocalyptic Dungeons', 
    'Everyday modern locations twisted by the System into deadly instances.', 
    '{"type": "object", "title": "Dungeon/Location Profile", "x-titleField": "Location_Name", "properties": {"Location_Name": {"title": "Location Name & Tier", "type": "string", "description": "e.g., The Walmart Catacombs (Tier 1), The Subscribed Subway Station (Tier 2)", "useForAI": true}, "Modern_Twist": {"title": "Modern Environment Twist", "type": "string", "description": "How the modern setting is mutated (e.g., the escalators in the mall are now rivers of lava, the mannequins are possessed).", "x-uiWidget": "textarea", "useForAI": true}, "Monster_Ecology": {"title": "Monster Ecology", "type": "string", "description": "What spawns here? (e.g., Acid-spitting cockroaches, mutated office workers, dimensional goblins).", "x-uiWidget": "textarea", "useForAI": true}, "The_Boss_Room": {"title": "The Boss Room & Mechanic", "type": "string", "description": "What is the final boss of this area and what game mechanic must be solved to beat it?", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Location_Name", "Modern_Twist", "Monster_Ecology", "The_Boss_Room"]}',
    @method_id, 'scene', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.6 Props (prop) - Multiple
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_prop_id, 
    'System Loot & Artifacts', 
    'Weapons, skill books, and consumables dropped by monsters or the System.', 
    '{"type": "object", "title": "Loot Profile", "x-titleField": "Item_Name", "properties": {"Item_Name": {"title": "Item Name & Rarity", "type": "string", "description": "e.g., Sub-Space Ring (Epic), Goblin Bone Dagger (Common), Skill Book: Blink (Legendary)", "useForAI": true}, "Item_Stats_and_Effects": {"title": "Stats & Effects", "type": "string", "description": "The exact system description (e.g., +5 Strength, causes bleeding effect for 3s. Cooldown: 1 min).", "x-uiWidget": "textarea", "useForAI": true}, "Acquisition_Lore": {"title": "Acquisition Context", "type": "string", "description": "Did it drop from a boss? Was it bought from a mysterious System Shop? Or crafted from mutated car parts?", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Item_Name", "Item_Stats_and_Effects"]}',
    @method_id, 'prop', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.7 Organizations (organization) - Multiple
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_org_id, 
    'Factions & Guilds', 
    'Groups formed from the ashes: survivor camps, military remnants, or player guilds.', 
    '{"type": "object", "title": "Guild/Faction Profile", "x-titleField": "Faction_Name", "properties": {"Faction_Name": {"title": "Faction Name", "type": "string", "description": "e.g., The Vanguard (Military remnant), Blood-Iron Syndicate (Raiders), The First City SafeZone", "useForAI": true}, "Ideology_and_Law": {"title": "Ideology & Law", "type": "string", "description": "How do they rule? (e.g., Survival of the fittest where low-levels are slaves, or a democratic system taxing monster cores).", "x-uiWidget": "textarea", "useForAI": true}, "Base_of_Operations": {"title": "Base of Operations", "type": "string", "description": "A fortified stadium, an underground bunker, or a floating system city?", "x-uiWidget": "textarea", "useForAI": true}, "Attitude_to_Protagonist": {"title": "Attitude towards Protagonist", "type": "string", "description": "Are they trying to recruit the OP protagonist, or looking to steal their unique items?", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Faction_Name", "Ideology_and_Law", "Base_of_Operations"]}',
    @method_id, 'organization', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();
