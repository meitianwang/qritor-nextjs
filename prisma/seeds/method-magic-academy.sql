-- -----------------------------------------------------------------------------
-- Magic Academy / Battle School Creation Method Initialization SQL
-- -----------------------------------------------------------------------------

SET @method_id = 100; 
SET @method_name = 'Magic Academy / Battle School';
SET @method_desc = 'A high-stakes progression fantasy set within a competitive academic or military institution. The narrative focuses on the protagonist climbing the ranks from a ridiculed underdog to the top of the school hierarchy through brutal exams, tournament arcs, faction disputes, and uncovering sinister conspiracies hidden behind elite academia.';
SET @novel_type = 'Isekai';
SET @language = 'en';
SET @visible_categories = '["setting", "character", "scene", "prop", "organization"]';

-- 1. Create Method
INSERT INTO novel_creation_method 
  (id, name, description, novel_type, language, visible_categories, is_preset, status, created_at, updated_at)
VALUES
  (@method_id, @method_name, @method_desc, @novel_type, @language, @visible_categories, 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
  name = VALUES(name), description = VALUES(description), novel_type = VALUES(novel_type), 
  language = VALUES(language), visible_categories = VALUES(visible_categories), is_preset = VALUES(is_preset), status = VALUES(status), updated_at = NOW();

-- Module IDs preset
SET @m_hook_id  = 8170502000000000001;
SET @m_rule_id  = 8170502000000000002;
SET @m_style_id = 8170502000000000003;
SET @m_char_id  = 8170502000000000004;
SET @m_scene_id = 8170502000000000005;
SET @m_prop_id  = 8170502000000000006;
SET @m_org_id   = 8170502000000000007;

-- -------------------------
-- 3.1 The Sorting / Admission Hook (setting) - Singleton
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_hook_id, 
    'The Admission Assessment Hook', 
    'The defining moment where the protagonist is judged by the academy''s system, usually ending in public humiliation or shocking anomaly.', 
    '{"type": "object", "title": "The Assessment Incident", "properties": {"The Evaluation Mechanic": {"title": "The Evaluation Mechanic", "type": "string", "enum": ["The Affinity Crystal / Awakening Orb", "The AI Combat Simulator", "The Bloodline Resonance Test", "The Written Magic Theory Exam"], "x-uiWidget": "radio", "useForAI": true}, "The Protagonist''s Underdog Start": {"title": "The Anomalous Result", "type": "string", "description": "How does the protagonist disastrously fail (or mysteriously break) the initial test? (e.g., They awaken a ''Trash Tier'' F-Rank combat class; The crystal physically shatters but registers as zero mana; They score a literal 0% on practical magic).", "x-uiWidget": "textarea", "useForAI": true}, "The Hidden Loophole": {"title": "The Hidden Secret Advatange", "type": "string", "description": "What is the secret reason their failure is actually a disguised legendary advantage? (e.g., F-Rank means their body can organically evolve limits; Zero mana means immunity to magical tracking; They possess an extinct ancient system the modern orb cannot read).", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["The Evaluation Mechanic", "The Protagonist''s Underdog Start", "The Hidden Loophole"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
);

-- -------------------------
-- 3.2 The Academy Hierarchy & Power System (setting) - Singleton
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_rule_id, 
    'Hierarchy & Power Mechanics', 
    'The rigid ranking system of the school and the exact mechanics of combat/magic progression.', 
    '{"type": "object", "title": "System Mechanics", "properties": {"The Academic Hierarchy": {"title": "The Ranking System", "type": "string", "description": "How is status determined in the school? (e.g., A brutal meritocracy where the Top 10 ''Kings'' rule; Assigned dorms based on aristocratic blood vs. commoner talent; A continuous competitive leaderboard updated weekly).", "x-uiWidget": "textarea", "useForAI": true}, "Core Power Progression": {"title": "Power Progression Mechanics", "type": "string", "enum": ["Mana Core Cultivation (Condensing, Forming, Expanding)", "Cybernetic Enhancements & CAD (Casting Assistant Devices) Syncing", "Elemental Runology & Spell Chanting", "System Leveling / Stat Allocation via Dungeons"], "x-uiWidget": "radio", "useForAI": true}, "The Hard Limitation": {"title": "The Danger of Progression", "type": "string", "description": "What is the physical/mental toll of growing stronger? (e.g., Using too much mana burns out the neural pathways; Forcing core expansion can cause the cultivator to explode; High-level spells require permanent bodily sacrifice).", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["The Academic Hierarchy", "Core Power Progression", "The Hard Limitation"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
);

-- -------------------------
-- 3.3 Tone & Style (setting) - Singleton
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_style_id, 
    'Tone & Style', 
    'The balance between slice-of-life academy friendships and brutal, life-threatening combat exams.', 
    '{"type": "object", "title": "Tone & Style", "properties": {"Narrative Tone": {"title": "Narrative Tone", "type": "string", "enum": ["Shonen-style Hot-Blooded Rivalry", "Cold & Calculating Pragmatic Climb", "Dark Academia / Hidden Conspiracies", "Military Prep / Brutal Bootcamp"], "x-uiWidget": "radio", "useForAI": true}, "Stylistic Guidelines": {"title": "Stylistic Guidelines", "type": "string", "description": "Guidelines for pacing and focus. The narrative must regularly juxtapose extreme hype/power-fantasy moments (climbing leaderboards, shocking the snobby nobles) with the grounded reality of being a teenager/student (cramming for midterms, cafeteria gossip, dorm life).", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Narrative Tone", "Stylistic Guidelines"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
);

-- -------------------------
-- 3.4 Characters (character) - Multiple
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_char_id, 
    'The Cadets, Nobles, & Faculty', 
    'The diverse cast of students representing different classes and ideals, alongside the mysterious professors.', 
    '{"type": "object", "title": "Character File", "x-titleField": "Name & Title", "properties": {"Name & Title": {"title": "Name & Title", "type": "string", "description": "e.g., Professor Kaelen the Blood Mage, Aria of the Silver Moon Clan, Bully A", "useForAI": true}, "Academy Role / Archetype": {"title": "Academy Role", "type": "string", "enum": ["The Underdog Protagonist", "The Arrogant Noble Rival", "The Aloof Combat Prodigy (Love Interest/Rival)", "The Secretly Overpowered Eccentric Mentor", "The Corrupt Faculty Member", "The Loyal Best Friend (Comic Relief)"], "x-uiWidget": "select", "useForAI": true}, "Combat Style / Specialization": {"title": "Combat Specialization", "type": "string", "description": "Their specific fighting style or magical affinity in exams. (e.g., Pure physical enhancement brawler; Relies entirely on expensive, pre-bought magical artifacts; Specializes in illegal dark illusion magic).", "x-uiWidget": "textarea", "useForAI": true}, "Motivation for the Top": {"title": "Motivation / Pressure", "type": "string", "description": "Why do they desperately want to be the best? (e.g., Their family will disown them if they fall out of the Top 10; They need a scholarship to pay for their sibling''s medicine; They just want to crush the weak).", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Name & Title", "Academy Role / Archetype", "Combat Style / Specialization"]}',
    @method_id, 'character', 1, 0, 1, NOW(), NOW()
);

-- -------------------------
-- 3.5 Scenes (scene) - Multiple
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_scene_id, 
    'Campus Battlegrounds', 
    'Locations designed specifically to test students, serving as the backdrop for training montages and tournaments.', 
    '{"type": "object", "title": "Location / Stage", "x-titleField": "Location Name", "properties": {"Location Name": {"title": "Location Name", "type": "string", "description": "e.g., The Simulated Wilderness Biome, The Anti-Magic Dueling Arena, The Forbidden Library Archives", "useForAI": true}, "The Environmental Challenge": {"title": "The Rules & Restrictions", "type": "string", "description": "What makes this area a proving ground? (e.g., Gravity is 3x higher in the training hall; The arena flooring collapses randomly; The library defends its books with literal cursed guardians).", "x-uiWidget": "textarea", "useForAI": true}, "The Protagonist''s Breakthrough": {"title": "The Breakthrough / Exploit", "type": "string", "description": "How does the protagonist use this place to train their unique weakness or flex on rivals? (e.g., Using the high-gravity room to forge their ''trash'' mana pathways into diamonds; Deliberately failing the combat simulator just to study the AI''s blindspots).", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Location Name", "The Environmental Challenge", "The Protagonist''s Breakthrough"]}',
    @method_id, 'scene', 1, 0, 1, NOW(), NOW()
);

-- -------------------------
-- 3.6 Assets & Gadgets (prop) - Multiple
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_prop_id, 
    'Artifacts & Study Materials', 
    'Items ranging from standard-issue academy gear to dangerously forbidden cultivation manuals.', 
    '{"type": "object", "title": "Item / Spellbook", "x-titleField": "Asset Name", "properties": {"Asset Name": {"title": "Asset Name", "type": "string", "description": "e.g., Standard Issue Type-4 Combat Bracelet, The Dust-Covered ''Basic Mana Form'' Manual, A Fragment of the Demon King''s Core", "useForAI": true}, "Intended Academic Function": {"title": "Intended Function", "type": "string", "description": "What is it supposed to do for a normal student? (e.g., The bracelet limits magical output to prevent lethal accidents in class; The manual is considered an outdated, useless beginner''s guide to breathing).", "x-uiWidget": "textarea", "useForAI": true}, "The Protagonist''s Misuse": {"title": "The Unintended Mastery", "type": "string", "description": "How does the protagonist turn it into a weapon? (e.g., Reversing the bracelet''s polarity to create explosive concussive blasts; Realizing the ''Basic Manual'' is actually a foundational piece of forgotten god-tier magic if practiced 10,000 times).", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Asset Name", "Intended Academic Function", "The Protagonist''s Misuse"]}',
    @method_id, 'prop', 1, 0, 1, NOW(), NOW()
);

-- -------------------------
-- 3.7 Factions (organization) - Multiple
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_org_id, 
    'Clubs, Fraternities & Dark Conspiracies', 
    'Student-run factions regulating the school, or shadow organizations operating right beneath the Dean''s nose.', 
    '{"type": "object", "title": "Faction", "x-titleField": "Faction Name", "properties": {"Faction Name": {"title": "Faction Name", "type": "string", "description": "e.g., The Student Disciplinary Committee, The Pureblood Aristocrat Society, The Ouroboros Syndicate (Hidden Cult)", "useForAI": true}, "Campus Influence": {"title": "Campus Influence", "type": "string", "description": "How do they throw their weight around? (e.g., The Committee dictates tournament match-ups and routinely sabotages commoners; The Noble Society monopolizes the S-Rank training rooms).", "x-uiWidget": "textarea", "useForAI": true}, "Conflict with Protagonist": {"title": "Cause of Conflict", "type": "string", "description": "Why does the protagonist inevitably clash with them? (e.g., The protagonist beats one of their members in a duel, bruising their pride; The cult needs the protagonist''s unique anomaly as a sacrifice for finals week).", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Faction Name", "Campus Influence", "Conflict with Protagonist"]}',
    @method_id, 'organization', 1, 0, 1, NOW(), NOW()
);
