-- -----------------------------------------------------------------------------
-- Hybrid Romantasy / Thriller Creation Method Initialization SQL
-- -----------------------------------------------------------------------------

SET @method_id = 106; 
SET @method_name = 'Hybrid Romantasy / Thriller';
SET @method_desc = 'A trending genre blending epic romance with mind-bending thriller, crime, or sci-fi elements. The protagonist navigates complex conspiracies, royal intrigues, or dystopian futures while confronting a fatal, undeniable attraction to a dangerous or morally gray counterpart.';
SET @novel_type = 'Romantasy';
SET @language = 'en';
SET @visible_categories = '["setting", "character", "scene", "prop", "organization"]';

-- 1. Create Novel Creation Method
INSERT INTO novel_creation_method 
  (id, name, description, novel_type, language, visible_categories, created_at, updated_at)
VALUES
  (@method_id, @method_name, @method_desc, @novel_type, @language, @visible_categories, NOW(), NOW())
ON DUPLICATE KEY UPDATE
  name = VALUES(name), description = VALUES(description), novel_type = VALUES(novel_type), 
  language = VALUES(language), visible_categories = VALUES(visible_categories), updated_at = NOW();

-- Preset Module IDs
SET @m_hook_id  = 8170501106000000001;
SET @m_world_id = 8170501106000000002;
SET @m_style_id = 8170501106000000003;
SET @m_char_id  = 8170501106000000004;
SET @m_scene_id = 8170501106000000005;
SET @m_prop_id  = 8170501106000000006;
SET @m_org_id   = 8170501106000000007;

-- -------------------------
-- 3.1 Hook (setting) - Singleton
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_hook_id, 
    'Fatal Encounter Hook', 
    'The inciting incident where high-stakes danger collides with an undeniable romantic attraction.', 
    '{"type": "object", "title": "Story Hook", "properties": {"Inciting_Incident": {"title": "The Inciting Incident", "type": "string", "description": "The crime, betrayal, or conspiracy that forces the protagonist into action (e.g., investigating a royal assassination, uncovering a cyberpunk corporate secret).", "x-uiWidget": "textarea", "useForAI": true}, "The_Fatal_Encounter": {"title": "The Fatal Encounter", "type": "string", "description": "How the protagonist meets the dangerous love interest. Why is their dynamic immediately tense and forbidden?", "x-uiWidget": "textarea", "useForAI": true}, "Hidden_Agendas": {"title": "Clashing Agendas", "type": "string", "description": "What secret motive does each harbor that could destroy the other if revealed?", "x-uiWidget": "textarea", "useForAI": true}, "The_Spark_of_Danger": {"title": "The Spark of Danger", "type": "string", "description": "The exact moment they realize they are enemies, yet utterly drawn to each other.", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Inciting_Incident", "The_Fatal_Encounter", "Hidden_Agendas"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.2 Worldview (setting) - Singleton
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_world_id, 
    'Deceptive World Dynamics', 
    'The intricate, treacherous setting—be it a magical royal court or a neon-lit sci-fi metropolis.', 
    '{"type": "object", "title": "World Dynamics", "properties": {"Setting_Type": {"title": "Core Setting Type", "type": "string", "enum": ["High Fantasy Royal Court (Intrigue & Magic)", "Cyberpunk / Dystopian City (Tech & Crime)", "Interstellar Empire (Space Opera Romance)", "Urban Fantasy Underworld (Mafia & Monsters)"], "x-uiWidget": "radio", "useForAI": true}, "The_Facade": {"title": "The Facade of Society", "type": "string", "description": "What does this world look like to the innocent? (e.g., a glorious, opulent empire built on peace).", "x-uiWidget": "textarea", "useForAI": true}, "The_Underlying_Rot": {"title": "The Underlying Conspiracy", "type": "string", "description": "The dark truth running beneath the surface (e.g., blood magic sacrifices, mind-control chips, political massacres).", "x-uiWidget": "textarea", "useForAI": true}, "Rules_of_Survival": {"title": "Rules of Survival", "type": "string", "description": "What are the lethal consequences for showing weakness or falling in love in this world?", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Setting_Type", "The_Facade", "The_Underlying_Rot"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.3 Style (setting) - Singleton
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_style_id, 
    'Narrative Style', 
    'A tone that balances heart-pounding suspense with intense, slow-burn romantic chemistry.', 
    '{"type": "object", "title": "Narrative Style", "properties": {"Tone": {"title": "Primary Tone", "type": "string", "enum": ["Dark & Seductive Slow-Burn", "Fast-Paced Action & Snarky Banter", "Gothic, Brooding, and Deadly Serious", "Cinematic Cyberpunk/Sci-Fi Tension"], "x-uiWidget": "radio", "useForAI": true}, "Sensory_Focus": {"title": "Sensory Focus Instructions", "type": "string", "description": "Guidance on describing tension: Focus equally on the immediate physical threat (a blade to the throat) and the electric intimacy of proximity (the scent of the enemy, the brush of skin).", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Tone"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.4 Characters (character) - Multiple
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_char_id, 
    'Morally Gray Leads & Suspects', 
    'Characters who lie, betray, and love fiercely. No one is purely good.', 
    '{"type": "object", "title": "Character Profile", "x-titleField": "Name_and_Alias", "properties": {"Name_and_Alias": {"title": "Name & Alias", "type": "string", "description": "e.g., Crown Prince Kael or \'The Viper\'", "useForAI": true}, "Role": {"title": "Role in the Web", "type": "string", "enum": ["Protagonist (The Seeker/Avenger)", "Love Interest (The Dangerous Enigma)", "The Suspect / Rival", "The Mastermind in the Shadows", "The Tragic Informant"], "x-uiWidget": "select", "useForAI": true}, "Public_Persona": {"title": "Public Persona", "type": "string", "description": "How society views them (e.g., a spoiled royal, a ruthless corporate fixer).", "x-uiWidget": "textarea", "useForAI": true}, "Hidden_Vulnerability": {"title": "Hidden Truth / Vulnerability", "type": "string", "description": "The secret that makes them human, or the trauma driving their cruelty.", "x-uiWidget": "textarea", "useForAI": true}, "Romantic_Dynamic": {"title": "Romantic / Betrayal Dynamic", "type": "string", "description": "Their specific tension with the protagonist (e.g., \'Enemies to lovers\', \'Fake dating to uncover a murderer\').", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Name_and_Alias", "Role", "Public_Persona", "Hidden_Vulnerability"]}',
    @method_id, 'character', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.5 Scenes (scene) - Multiple
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_scene_id, 
    'High-Stakes Locations', 
    'Places designed for both espionage/murder and illicit romantic encounters.', 
    '{"type": "object", "title": "Location Profile", "x-titleField": "Location_Name", "properties": {"Location_Name": {"title": "Location Name", "type": "string", "description": "e.g., The Midnight Masquerade Hall, Sector 4 Neon Alleys, The Emperor\'s Private Vault", "useForAI": true}, "Aesthetic_Vibe": {"title": "Aesthetic & Vibe", "type": "string", "description": "Glamorous yet deadly (e.g., chandeliers casting sharp shadows, deafening club music masking gunshots).", "x-uiWidget": "textarea", "useForAI": true}, "Espionage_Opportunity": {"title": "Opportunities for Secrets", "type": "string", "description": "Why is this the perfect place to drop a body, steal a key, or have a forbidden conversation?", "x-uiWidget": "textarea", "useForAI": true}, "Romantic_Tension_Trigger": {"title": "Romantic Tension Trigger", "type": "string", "description": "How the environment forces intimacy (e.g., hiding together in a cramped closet from guards).", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Location_Name", "Aesthetic_Vibe", "Espionage_Opportunity"]}',
    @method_id, 'scene', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.6 Props (prop) - Multiple
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_prop_id, 
    'MacGuffins & Romantic Tokens', 
    'Items that drive the thriller plot or symbolize the forbidden romance.', 
    '{"type": "object", "title": "Item Profile", "x-titleField": "Item_Name", "properties": {"Item_Name": {"title": "Item Name", "type": "string", "description": "e.g., The Bloodstone Ring, A Decrypted Data Drive, A Poisoned Chalice", "useForAI": true}, "Thriller_Significance": {"title": "Thriller/Crime Significance", "type": "string", "description": "Why people are dying over this item (e.g., it contains the list of rebel spies, it is the murder weapon).", "x-uiWidget": "textarea", "useForAI": true}, "Romantic_Subtext": {"title": "Romantic Subtext", "type": "string", "description": "How does it connect the two leads? (e.g., a tracking device disguised as an engagement ring he gave her).", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Item_Name", "Thriller_Significance"]}',
    @method_id, 'prop', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.7 Organizations (organization) - Multiple
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_org_id, 
    'Factions & Secret Societies', 
    'The powerful groups treating the protagonists like pawns.', 
    '{"type": "object", "title": "Faction Profile", "x-titleField": "Faction_Name", "properties": {"Faction_Name": {"title": "Faction Name", "type": "string", "description": "e.g., The Shadow Court, Cyber-Syndicate 9, The Inquisition", "useForAI": true}, "Public_Goal": {"title": "Public Goal", "type": "string", "description": "What they claim to stand for (e.g., peace, technological advancement).", "x-uiWidget": "textarea", "useForAI": true}, "Dark_Secret": {"title": "Dark Secret / Method", "type": "string", "description": "Their true, ruthless methods (e.g., assassinating political rivals, illegal human experimentation).", "x-uiWidget": "textarea", "useForAI": true}, "Stance_on_the_Lovers": {"title": "Stance on the Protagonists", "type": "string", "description": "How this group aims to use or destroy the romance to their advantage.", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Faction_Name", "Public_Goal", "Dark_Secret"]}',
    @method_id, 'organization', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();
