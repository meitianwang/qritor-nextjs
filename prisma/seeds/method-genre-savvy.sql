-- -----------------------------------------------------------------------------
-- Genre Savvy / Exploiting Narratives Creation Method Initialization SQL
-- -----------------------------------------------------------------------------

SET @method_id = 76; 
SET @method_name = 'Genre Savvy / Exploiting Narratives';
SET @method_desc = 'A meta-aware storytelling method where characters understand they are in a heroic epic or system game, and actively exploit narrative laws (e.g., villains die when monologuing) for their own survival or agenda. Known for dark humor, subversion of tropes, and ruthless pragmatism.';
SET @novel_type = 'Meta Fiction';
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
SET @m_hook_id  = 8170501760000000001;
SET @m_rule_id  = 8170501760000000002;
SET @m_style_id = 8170501760000000003;
SET @m_char_id  = 8170501760000000004;
SET @m_scene_id = 8170501760000000005;
SET @m_prop_id  = 8170501760000000006;
SET @m_org_id   = 8170501760000000007;

-- -------------------------
-- 3.1 Subverted Trope Hook (setting) - Singleton
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_hook_id, 
    'Subverted Trope Hook', 
    'The classic cliché opening that the protagonist immediately derails or exploits to their advantage.', 
    '{"type": "object", "title": "Subverted Trope Hook", "properties": {"Original Trope": {"title": "Original Trope", "type": "string", "enum": ["Summoned Hero Destined to Save the World", "The Doomed Villainess of an Otome Game", "The Chosen One in a Magical Academy", "The Weakest Hunter in a System Apocalypse"], "x-uiWidget": "radio", "useForAI": true}, "The Pragmatic Subversion": {"title": "The Pragmatic Subversion", "type": "string", "description": "How does the protagonist immediately ruin or exploit this setup? (e.g., The summoned hero realizes the King is a tyrant and immediately escapes to join the Demons, or the villainess realizes she is doomed and starts assassinating the male leads).", "x-uiWidget": "textarea", "useForAI": true}, "Narrative Consequences": {"title": "Narrative Consequences", "type": "string", "description": "Because they broke the expected story, how does the World or the System try to violently course-correct? (e.g., The plot armor forcibly spawns new heroes to kill them).", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Original Trope", "The Pragmatic Subversion", "Narrative Consequences"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
);

-- -------------------------
-- 3.2 Narrative Laws / Meta-Rules (setting) - Singleton
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_rule_id, 
    'Narrative Laws', 
    'The underlying rules of the world. In this universe, clichés and tropes are literal physical laws of nature.', 
    '{"type": "object", "title": "Narrative Laws", "properties": {"Core Narrative Rule": {"title": "Core Narrative Rule", "type": "string", "enum": ["Heroes Have Absolute Plot Armor", "Villains Always Die from Hubris", "Monologuing Pauses Time", "The Power of Friendship Grants Stat Boosts"], "x-uiWidget": "radio", "useForAI": true}, "The Protagonist''s Loophole": {"title": "The Protagonist''s Loophole", "type": "string", "description": "How does the protagonist actively weaponize this rule? (e.g., They know monologuing pauses time, so they use it to catch their breath or secretly cast a long ritual spell).", "x-uiWidget": "textarea", "useForAI": true}, "The World''s Countermeasure": {"title": "The World''s Countermeasure", "type": "string", "description": "What happens when someone tries to blatantly break the rules? (e.g., If you try to kill a hero off-screen, reality literally rejects the event and the hero magically survives).", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Core Narrative Rule", "The Protagonist''s Loophole", "The World''s Countermeasure"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
);

-- -------------------------
-- 3.3 Tone & Style (setting) - Singleton
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_style_id, 
    'Tone & Style', 
    'Dark humor, sardonic narration, and the breakdown of epic pretensions into mundane bureaucracy or brutal pragmatism.', 
    '{"type": "object", "title": "Tone & Style", "properties": {"Narrative Tone": {"title": "Narrative Tone", "type": "string", "enum": ["Sardonic Black Comedy", "Ruthless Machiavellian Logistics", "Deadpan System Abuse"], "x-uiWidget": "radio", "useForAI": true}, "Stylistic Guidelines": {"title": "Stylistic Guidelines", "type": "string", "description": "Guidelines for writing the prose. Should heavily feature internal monologues complaining about trope logic, deconstructing ''epic'' moments into awkward or brutal realities (e.g., emphasizing the logistical nightmare of a Dark Lord''s skeleton army). Focus on cause and effect without romanticizing violence.", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Narrative Tone", "Stylistic Guidelines"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
);

-- -------------------------
-- 3.4 Characters (character) - Multiple
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_char_id, 
    'Archetypal & Subverted Characters', 
    'Individuals who either blindly follow their Narrative Role or are genre-savvy enough to exploit it.', 
    '{"type": "object", "title": "Character File", "x-titleField": "Name & Title", "properties": {"Name & Title": {"title": "Name & Title", "type": "string", "description": "e.g., Catherine Foundling (The Squire), Arthur the Hero", "useForAI": true}, "Narrative Role (Trope)": {"title": "Narrative Role", "type": "string", "enum": ["The Genre-Savvy Pragmatist", "The Delusional Hero", "The Competent Henchman", "The Tragic Mentor destined to die", "The Bureaucratic Evil Overlord"], "x-uiWidget": "select", "useForAI": true}, "Awareness Level": {"title": "Awareness Level", "type": "string", "description": "How aware are they that they are in a story/system? (e.g., Clueless pawn driven by Plot, completely aware and actively abusing bugs, or vaguely sensing ''the Will of the Heavens'').", "x-uiWidget": "textarea", "useForAI": true}, "Fatal Flaw & Subversion": {"title": "Fatal Flaw & Subversion", "type": "string", "description": "What is their designated trope weakness, and how do they either fall victim to it or violently overcompensate? (e.g., The Hero refuses to kill, so the villains use that to endlessly stall him; The Villain knows he will lose if he mocks the hero, so he just shoots them in the head immediately).", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Name & Title", "Narrative Role (Trope)", "Fatal Flaw & Subversion"]}',
    @method_id, 'character', 1, 0, 1, NOW(), NOW()
);

-- -------------------------
-- 3.5 Trope Scenes (scene) - Multiple
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_scene_id, 
    'Predictable Story Locations', 
    'Places that exist solely to fulfill a narrative cliche—which the protagonist comes fully prepared to exploit.', 
    '{"type": "object", "title": "Story Location", "x-titleField": "Location Name", "properties": {"Location Name": {"title": "Location Name", "type": "string", "description": "e.g., The Doomed Starting Village, The Suspiciously Ominous Volcano Lair, The Tournament Arena", "useForAI": true}, "Narrative Function": {"title": "Narrative Function", "type": "string", "description": "What is supposed to happen here based on cliches? (e.g., This is where the hero is supposed to find their ancient mentor and a magical sword; This bridge exists solely for a dramatic standoff).", "x-uiWidget": "textarea", "useForAI": true}, "The Pragmatic Reality": {"title": "The Pragmatic Reality", "type": "string", "description": "How does the protagonist ruin this location? (e.g., They preemptively burn down the Starting Village to farm XP before the Demon Lord arrives; They booby-trap the dramatic bridge with high-explosives instead of dueling).", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Location Name", "Narrative Function", "The Pragmatic Reality"]}',
    @method_id, 'scene', 1, 0, 1, NOW(), NOW()
);

-- -------------------------
-- 3.6 Exploit Props (prop) - Multiple
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_prop_id, 
    'MacGuffins & Exploit Items', 
    'Items bound by narrative logic. A sword that only hurts evil, or a mundane item used to break the system.', 
    '{"type": "object", "title": "Item / MacGuffin", "x-titleField": "Item Name", "properties": {"Item Name": {"title": "Item Name", "type": "string", "description": "e.g., The Holy Sword of Destiny, The Potion of Infinite Minor Healing, A Completely Ordinary Brick", "useForAI": true}, "Intended Trope Usage": {"title": "Intended Trope Usage", "type": "string", "description": "What is the item meant to do in a normal story? (e.g., The Holy Sword is only drawn by the pure of heart to defeat the generic Demon King).", "x-uiWidget": "textarea", "useForAI": true}, "The Pragmatic Exploit": {"title": "The Pragmatic Exploit", "type": "string", "description": "How is it incorrectly and brilliantly used? (e.g., The Holy Sword emits bright holy light, so the pragmatic villain steals it and uses it as a flashbang grenade; The ordinary brick is used to exploit a physics engine glitch in the System to deal infinite integer overflow damage).", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Item Name", "Intended Trope Usage", "The Pragmatic Exploit"]}',
    @method_id, 'prop', 1, 0, 1, NOW(), NOW()
);

-- -------------------------
-- 3.7 Factions (organization) - Multiple
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_org_id, 
    'Cliche Factions & Pragmatic Unions', 
    'Groups defined by their absurd commitment to an archetype or their cold optimization of resources.', 
    '{"type": "object", "title": "Faction", "x-titleField": "Faction Name", "properties": {"Faction Name": {"title": "Faction Name", "type": "string", "description": "e.g., The Holy Church of Light, The Evil Empire, The Bureau of Villainy Logistics", "useForAI": true}, "Organizational Flaw": {"title": "Organizational Trope Flaw", "type": "string", "enum": ["They dress in white and are secretly corrupt", "They employ entirely incompetent minions", "They rely solely on the Power of Friendship", "They follow complex Bureaucracy that slows down evil plans"], "x-uiWidget": "select", "useForAI": true}, "Pragmatic Policies": {"title": "Pragmatic Policies", "type": "string", "description": "If this faction is run by a genre-savvy character, how do they fix these flaws? (e.g., The Evil Empire implements a dental plan to ensure minion loyalty; The guards are ordered to shoot any teenager with spiky hair on sight instead of capturing them).", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Faction Name", "Organizational Flaw", "Pragmatic Policies"]}',
    @method_id, 'organization', 1, 0, 1, NOW(), NOW()
);
