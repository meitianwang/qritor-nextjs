-- -----------------------------------------------------------------------------
-- Transmigration: Non-Human & Gender Swap Isekai Creation Method Initialization SQL
-- -----------------------------------------------------------------------------

SET @method_id = 78; 
SET @method_name = 'Non-Human / Gender Swap Isekai';
SET @method_desc = 'A specialized Isekai method focusing on protagonist transformation into non-human entities (monsters, objects, dungeons) or experiencing a gender swap. Central themes revolve around survival/evolution mechanics, identity crisis, adaptation to drastically different social/biological norms, and exploring the world from an alien perspective.';
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
SET @m_hook_id  = 8170501780000000001;
SET @m_evol_id  = 8170501780000000002;
SET @m_style_id = 8170501780000000003;
SET @m_char_id  = 8170501780000000004;
SET @m_scene_id = 8170501780000000005;
SET @m_prop_id  = 8170501780000000006;
SET @m_org_id   = 8170501780000000007;

-- -------------------------
-- 3.1 Transmigration Hook (setting) - Singleton
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_hook_id, 
    'Transmigration Shift Hook', 
    'The drastic shift in perspective and biology the protagonist experiences upon rebirth.', 
    '{"type": "object", "title": "Shift Encounter", "properties": {"Reincarnation Form": {"title": "Reincarnation Form", "type": "string", "enum": ["Monster / Beast (Spider, Slime, Dragon, etc.)", "Inanimate Object / Construct (Sword, Dungeon Core, Vending Machine)", "Gender Swap (Noble Daughter, Elven Priestess)"], "x-uiWidget": "radio", "useForAI": true}, "The Biological or Social Shock": {"title": "The First Shock", "type": "string", "description": "What is the very first horrifying or confusing realization upon waking up? (e.g., Realizing I have eight legs and am surrounded by cannibalistic siblings; Waking up constrained by a corset and rigid patriarchal noble etiquette; Discovering I cannot move because I am a literal dungeon core).", "x-uiWidget": "textarea", "useForAI": true}, "Initial Survival Motivation": {"title": "Initial Survival Motivation", "type": "string", "description": "What keeps them moving forward despite the absurd situation? (e.g., Evolving out of the bottom of the food chain, avoiding arranged marriage, accumulating mana to expand the dungeon).", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Reincarnation Form", "The Biological or Social Shock", "Initial Survival Motivation"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
);

-- -------------------------
-- 3.2 Evolution & Identity Mechanic (setting) - Singleton
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_evol_id, 
    'Evolution & Identity System', 
    'The mechanics governing how the protagonist grows, changes form, or assimilates their new identity.', 
    '{"type": "object", "title": "Evolution & Identity System", "properties": {"Core Progression Mechanic": {"title": "Core Progression Mechanic", "type": "string", "enum": ["Biological Evolution Tree (Monster)", "Territory Expansion & Traps (Dungeon/Object)", "Social Climbing & Persona Management (Gender Swap)"], "x-uiWidget": "radio", "useForAI": true}, "Species/Form Traits and Drawbacks": {"title": "Traits and Drawbacks", "type": "string", "description": "What unique advantages and severe limitations does their new form have? (e.g., A spider produces infinite silk but is instantly hunted by humans as a pest; A swapped noblewoman has immense political leverage but zero physical strength).", "x-uiWidget": "textarea", "useForAI": true}, "Identity Crisis Resolution": {"title": "Identity Crisis", "type": "string", "description": "How does the lingering human mindset conflict with their new form''s instincts? (e.g., Disgust at eating raw monsters slowly fading into hunger-driven acceptance; The psychological struggle of blending into a completely different social gender norm).", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Core Progression Mechanic", "Species/Form Traits and Drawbacks", "Identity Crisis Resolution"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
);

-- -------------------------
-- 3.3 Tone & Style (setting) - Singleton
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_style_id, 
    'Tone & Style', 
    'Guidelines for depicting the contrast between a modern human mind and an alien/unfamiliar body.', 
    '{"type": "object", "title": "Tone & Style", "properties": {"Narrative Tone": {"title": "Narrative Tone", "type": "string", "enum": ["Gritty Survival & Evolution", "Comedic Misunderstandings & Culture Shock", "Introspective Identity & Social Drama"], "x-uiWidget": "radio", "useForAI": true}, "Stylistic Guidelines": {"title": "Stylistic Guidelines", "type": "string", "description": "How should the inner monologue sound? (e.g., Heavy emphasis on sensory details that humans lack—tasting the air with a forked tongue, feeling vibrations through a dungeon floor, or hyper-awareness of suffocating societal gazes). The internal voice should heavily juxtapose a modern human''s common sense against the absurd reality of their new form.", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Narrative Tone", "Stylistic Guidelines"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
);

-- -------------------------
-- 3.4 Characters (character) - Multiple
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_char_id, 
    'Allies, Threats & Misunderstanders', 
    'Characters defined by how they perceive the protagonist''s unconventional nature.', 
    '{"type": "object", "title": "Character File", "x-titleField": "Name & Title", "properties": {"Name & Title": {"title": "Name & Title", "type": "string", "description": "e.g., Elara the Human Hunter, The Overprotective Arachnid Mother, Sir Galahad the Clueless Suitor", "useForAI": true}, "Relationship to Protagonist": {"title": "Relationship", "type": "string", "enum": ["Natural Predator / Enemy", "Symbiotic Ally / Familiar", "Clueless Human Worshipper (Mistakes Protag for a God/Saint)", "Suspicious Noble / Social Rival"], "x-uiWidget": "select", "useForAI": true}, "Perception Gap": {"title": "Perception Gap", "type": "string", "description": "How is this character hilariously or tragically wrong about the protagonist? (e.g., The terrifying dragon is actually just trying to ask for directions but the kingdom thinks it''s a declaration of war; The suitors think she is a delicate flower while she internally schemes like a corporate CEO).", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Name & Title", "Relationship to Protagonist", "Perception Gap"]}',
    @method_id, 'character', 1, 0, 1, NOW(), NOW()
);

-- -------------------------
-- 3.5 Habitats & Alien Environments (scene) - Multiple
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_scene_id, 
    'Biomes & Societal Cages', 
    'Environments that are incredibly hostile to the protagonist''s new form, or perfectly suited to it.', 
    '{"type": "object", "title": "Habitat / Environment", "x-titleField": "Location Name", "properties": {"Location Name": {"title": "Location Name", "type": "string", "description": "e.g., The Great Elroe Labyrinth (Lowest Floor), The High Society Tea Party Salon, The Core Chamber of the Ruined Dungeon", "useForAI": true}, "Environmental Hazard": {"title": "Environmental Hazard", "type": "string", "description": "What makes this place a nightmare for the protagonist? (e.g., Magma flows that instantly kill an ice-slime; Gossip circles that destroy a noblewoman''s reputation in seconds).", "x-uiWidget": "textarea", "useForAI": true}, "Exploitation / Adaptation": {"title": "Adaptation Strategy", "type": "string", "description": "How does the protagonist''s non-human or swapped-gender perspective turn this hostile environment into a stronghold? (e.g., Setting up invisible thread traps across the magma vents; Using modern psychological negotiation tactics to dominate the tea party hierarchy).", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Location Name", "Environmental Hazard", "Exploitation / Adaptation"]}',
    @method_id, 'scene', 1, 0, 1, NOW(), NOW()
);

-- -------------------------
-- 3.6 Evolution Catalysts (prop) - Multiple
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_prop_id, 
    'Evolution Catalysts & Social Tools', 
    'Items that trigger biological evolution, or crucial tools for maintaining a human facade.', 
    '{"type": "object", "title": "Catalyst / Tool", "x-titleField": "Item Name", "properties": {"Item Name": {"title": "Item Name", "type": "string", "description": "e.g., Core of the Poison Drake, The Mask of Concealment, The Royal Engagement Ring", "useForAI": true}, "Function & Cost": {"title": "Function & Cost", "type": "string", "description": "What does it do and what is the painful drawback? (e.g., Eating the core grants Poison Immunity but causes three days of agonizing mutation; The engagement ring secures political safety but completely strips personal freedom).", "x-uiWidget": "textarea", "useForAI": true}, "Impact on Identity": {"title": "Impact on Identity", "type": "string", "description": "How does obtaining/using this item push the protagonist further from their original humanity? (e.g., They now instinctively enjoy the taste of raw poison; They catch themselves naturally acting like the demure noble lady they used to mock).", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Item Name", "Function & Cost", "Impact on Identity"]}',
    @method_id, 'prop', 1, 0, 1, NOW(), NOW()
);

-- -------------------------
-- 3.7 Factions (organization) - Multiple
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_org_id, 
    'Species Tribes & Human Institutions', 
    'Groups that either hunt the protagonist, worship them, or enforce rigid social norms upon them.', 
    '{"type": "object", "title": "Faction", "x-titleField": "Faction Name", "properties": {"Faction Name": {"title": "Faction Name", "type": "string", "description": "e.g., The Adventurer''s Guild, The Goblin Tribe, The High Aristocracy Faction", "useForAI": true}, "Stance on Protagonist": {"title": "Stance on Protagonist", "type": "string", "enum": ["Extermination (views them as a monster/heretic)", "Exploitation (wants to use them as a tool/political pawn)", "Reverence (mistakes them for a divine guardian)", "Assimilation (wants them to conform completely)"], "x-uiWidget": "select", "useForAI": true}, "Cultural Clash": {"title": "Cultural Clash", "type": "string", "description": "What is the biggest disconnect between the faction''s beliefs and the protagonist''s internal monologue? (e.g., The goblin tribe wants the protagonist to be their brutal Warlord, but the protagonist just wants to read books in peace; The Aristocracy demands perfection, while the protagonist just misses eating junk food on a couch).", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Faction Name", "Stance on Protagonist", "Cultural Clash"]}',
    @method_id, 'organization', 1, 0, 1, NOW(), NOW()
);
