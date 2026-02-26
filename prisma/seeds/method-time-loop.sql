-- -----------------------------------------------------------------------------
-- Time Loop / Progression Regression Creation Method Initialization SQL
-- -----------------------------------------------------------------------------

SET @method_id = 89; 
SET @method_name = 'Time Loop / Progression Regression';
SET @method_desc = 'A high-stakes, trial-and-error narrative where the protagonist is trapped in a time loop or regresses to a save point upon death. Driven by hardcore survival, the core appeal lies in achieving "perfect mastery" over impossible situations through thousands of deaths and accumulating absolute knowledge of every detail, enemy, and secret.';
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
SET @m_hook_id  = 8170501890000000001;
SET @m_rule_id  = 8170501890000000002;
SET @m_style_id = 8170501890000000003;
SET @m_char_id  = 8170501890000000004;
SET @m_scene_id = 8170501890000000005;
SET @m_prop_id  = 8170501890000000006;
SET @m_org_id   = 8170501890000000007;

-- -------------------------
-- 3.1 The Lethel First Loop Hook (setting) - Singleton
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_hook_id, 
    'The Lethal First Loop Hook', 
    'The catastrophic failure that triggers the first regression/time leap, setting the grim tone.', 
    '{"type": "object", "title": "The First Death", "properties": {"The Impossible Scenario": {"title": "The Impossible Scenario", "type": "string", "enum": ["An unwinnable apocalypse tutorial", "An assassination on a specific day", "The complete collapse of humanity after 10 years", "Trapped in an eternally looping monster dungeon"], "x-uiWidget": "radio", "useForAI": true}, "The Brutal Reality": {"title": "The Brutal First Death", "type": "string", "description": "How did the protagonist helplessly fail during their very first run? (e.g., Slain by an unrecognizable horror within three seconds of the tutorial; Betrayed by their closest ally after a decade of struggle).", "x-uiWidget": "textarea", "useForAI": true}, "The Motivation to Retry": {"title": "The Driving Motivation", "type": "string", "description": "Upon waking up at the reset point, what keeps them from giving up? (e.g., A singular burning vengeance, the desire to save a specific person, or pure spite against the System).", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["The Impossible Scenario", "The Brutal Reality", "The Motivation to Retry"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
);

-- -------------------------
-- 3.2 Regression Rules & Limits (setting) - Singleton
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_rule_id, 
    'Regression Mechanics', 
    'The specific limitations of the loop. Absolute freedom creates boredom; strict rules create tension.', 
    '{"type": "object", "title": "Loop Mechanics", "properties": {"Reset Condition": {"title": "Reset Condition", "type": "string", "enum": ["Resurrect at Save Point upon death (Souls-like)", "Groundhog Day (Resets every 24 hours)", "System Regressor (Returned 10 years into the past, only once or with a strict limit)", "Checkpoints update automatically (Mistakes can become permanent)"], "x-uiWidget": "radio", "useForAI": true}, "Retained Assets": {"title": "Retained Assets & Knowledge", "type": "string", "description": "What carries over? Usually, it is ONLY memories and system levels, while physical items are lost. How does this dictate their strategy? (e.g., They must memorize complex spell formulas or the passwords to hidden safes since they cannot bring notes).", "x-uiWidget": "textarea", "useForAI": true}, "The Hidden Cost / Penalty": {"title": "The Hidden Cost / Penalty", "type": "string", "description": "What degrades with every loop? (e.g., Their soul shatters causing insanity; Timeline butterfly effects make each run slightly harder; Number of resets is strictly capped).", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Reset Condition", "Retained Assets", "The Hidden Cost / Penalty"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
);

-- -------------------------
-- 3.3 Tone & Style (setting) - Singleton
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_style_id, 
    'Tone & Style', 
    'Guidelines focusing on the psychological erosion of the protagonist and the eventual catharsis of perfection.', 
    '{"type": "object", "title": "Tone & Style", "properties": {"Narrative Focus": {"title": "Narrative Focus", "type": "string", "enum": ["Gritty Trial-and-Error Survival", "Cathartic Speedrun/Mastery", "Psychological Horror & Desensitization"], "x-uiWidget": "radio", "useForAI": true}, "Stylistic Guidelines": {"title": "Stylistic Guidelines", "type": "string", "description": "How to depict repeated events without boring the reader. Focus on hyper-optimization (e.g., stepping exactly 3 inches left to dodge a trap), the protagonist''s deadpan reaction to horrific violence because they''ve seen it a thousand times, and the stark contrast between the desperate NPCs and the perfectly calm protagonist.", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Narrative Focus", "Stylistic Guidelines"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
);

-- -------------------------
-- 3.4 Characters (character) - Multiple
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_char_id, 
    'The Regressor & The Static NPCs', 
    'The stark contrast between the evolving protagonist and characters doomed to repeat their scripts.', 
    '{"type": "object", "title": "Character File", "x-titleField": "Name & Role", "properties": {"Name & Role": {"title": "Name & Role", "type": "string", "description": "e.g., The Veteran Regressor, The Unaware Best Friend, The Tragic Hero", "useForAI": true}, "Loop Disposition": {"title": "Relationship to the Loop", "type": "string", "enum": ["The Exhausted Regressor (Protagonist)", "The Tragic Save-Scum Target (Always dies, must be saved)", "The Static Obstacle (Always acts the same way)", "The Anomaly (Somehow retains vague deja vu)"], "x-uiWidget": "select", "useForAI": true}, "The Protagonist''s Manipulation": {"title": "The Protagonist''s Manipulation", "type": "string", "description": "How does the protagonist view this person after 100 loops? (e.g., They know exactly how to trigger this NPC''s friendship subquest with three words; They cynically use them as bait because they can just reset anyway).", "x-uiWidget": "textarea", "useForAI": true}, "Hidden Secrets": {"title": "Hidden Secrets", "type": "string", "description": "A dark secret that the protagonist only discovers after surviving long enough. (e.g., The ''saintly'' mentor actually betrays the team on Day 45).", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Name & Role", "Loop Disposition", "The Protagonist''s Manipulation"]}',
    @method_id, 'character', 1, 0, 1, NOW(), NOW()
);

-- -------------------------
-- 3.5 Scenes (scene) - Multiple
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_scene_id, 
    'The Unforgiving Death Traps', 
    'Locations that serve as brutal knowledge checks, requiring absolute perfection to survive.', 
    '{"type": "object", "title": "Location / Stage", "x-titleField": "Location Name", "properties": {"Location Name": {"title": "Location Name", "type": "string", "description": "e.g., The Tutorial Meat Grinder, The First Floor Boss Room, The Day-3 City Siege", "useForAI": true}, "The Fatal Variables": {"title": "The Fatal Variables", "type": "string", "description": "What makes this area a nightmare for first-timers? (e.g., Poison gas that fills the room at exactly 14:02; A hidden sniper who memorizes evasion patterns).", "x-uiWidget": "textarea", "useForAI": true}, "The Perfect Routine": {"title": "The Perfect Clear Routine", "type": "string", "description": "After 400 deaths, what does the protagonist''s path look like? (e.g., They walk through the chaotic battlefield, stepping over landmines with their eyes closed, catching an arrow mid-air without looking).", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Location Name", "The Fatal Variables", "The Perfect Routine"]}',
    @method_id, 'scene', 1, 0, 1, NOW(), NOW()
);

-- -------------------------
-- 3.6 Exploit Items (prop) - Multiple
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_prop_id, 
    'Retained Knowledge & Secret Artefacts', 
    'Things the protagonist secures early by exploiting future knowledge, effectively "sequence breaking."', 
    '{"type": "object", "title": "Item / Information", "x-titleField": "Asset Name", "properties": {"Asset Name": {"title": "Asset Name", "type": "string", "description": "e.g., The Hidden Class Change Book, The Passcode to the Royal Vault, The Demon King''s True Name", "useForAI": true}, "Normal Acquisition": {"title": "Normal Intended Acquisition", "type": "string", "description": "How is a normal person supposed to get this? (e.g., Spending 20 years deciphering a dead language; Defeating a level 90 boss).", "x-uiWidget": "textarea", "useForAI": true}, "The Speedrun Exploit": {"title": "The Regression Exploit", "type": "string", "description": "How does the protagonist steal it on Day 1? (e.g., They already memorized the deciphered text in a past life; They trigger a wall-glitch using a low-level explosive to skip the boss).", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Asset Name", "Normal Acquisition", "The Speedrun Exploit"]}',
    @method_id, 'prop', 1, 0, 1, NOW(), NOW()
);

-- -------------------------
-- 3.7 Factions (organization) - Multiple
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_org_id, 
    'Unaware Juggernauts & Shadow Cults', 
    'Massive forces that operate blindly on their own timelines, acting as ticking clocks for the protagonist.', 
    '{"type": "object", "title": "Faction", "x-titleField": "Faction Name", "properties": {"Faction Name": {"title": "Faction Name", "type": "string", "description": "e.g., The Apocalypse System Managers, The Doomsday Cult, The Ignorant Royal Army", "useForAI": true}, "The Timed Crisis": {"title": "The Unavoidable Action", "type": "string", "description": "What happens on a specific time in every loop regardless of what the protagonist does? (e.g., The Cult summons a meteor on Day 15; The Royal Army executes the resistance leader on Day 3).", "x-uiWidget": "textarea", "useForAI": true}, "Exploiting the Machine": {"title": "Exploiting the Faction", "type": "string", "description": "How does the protagonist manipulate this massive organization like predictable clockwork? (e.g., They anonymously tip off the Royal Army the exact coordinates of the Cult''s meteor ritual, manipulating two enemies into destroying each other).", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Faction Name", "The Timed Crisis", "Exploiting the Machine"]}',
    @method_id, 'organization', 1, 0, 1, NOW(), NOW()
);
