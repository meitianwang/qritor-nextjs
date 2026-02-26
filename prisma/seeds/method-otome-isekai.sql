-- -----------------------------------------------------------------------------
-- Otome Isekai / Villainess Reincarnation Creation Method Initialization SQL
-- -----------------------------------------------------------------------------

SET @method_id = 93; 
SET @method_name = 'Otome Isekai / Villainess Reincarnation';
SET @method_desc = 'A subset of Isekai focused on reincarnating into a romance novel, otome game, or fantasy aristocracy—usually as the doomed Villainess or underappreciated side character. The narrative heavily focuses on political maneuvering, avoiding a predetermined bad ending, building romantic tension without realizing it, and aggressively reforming domains or kingdoms.';
SET @novel_type = 'Romantasy';
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
SET @m_hook_id  = 8170501930000000001;
SET @m_rule_id  = 8170501930000000002;
SET @m_style_id = 8170501930000000003;
SET @m_char_id  = 8170501930000000004;
SET @m_scene_id = 8170501930000000005;
SET @m_prop_id  = 8170501930000000006;
SET @m_org_id   = 8170501930000000007;

-- -------------------------
-- 3.1 The Condemnation / Awakening Hook (setting) - Singleton
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_hook_id, 
    'The Condemnation or Awakening Hook', 
    'The exact moment the protagonist remembers their past life and realizes their doomed trajectory.', 
    '{"type": "object", "title": "The Awakening Hook", "properties": {"Timing of Awakening": {"title": "Timing of Awakening", "type": "string", "enum": ["Childhood (Plenty of time to prepare)", "Just before entering the Academy (The story is about to start)", "During the Condemnation Event (It is almost too late)", "Post-Exile / Post-Execution (Second Chance Regression)"], "x-uiWidget": "radio", "useForAI": true}, "The Original Fate": {"title": "The Original Fate (Death Flag)", "type": "string", "description": "What happens to the assigned character in the original game/novel? (e.g., Executed by the Crown Prince via guillotine; Exiled to an impoverished northern territory; Sacrificed to the Demon Lord).", "x-uiWidget": "textarea", "useForAI": true}, "The New Goal": {"title": "The New Goal", "type": "string", "description": "What is their immediate and wildly different plan? (e.g., Calling off the engagement immediately to open a cafe; Preemptively becoming too politically powerful to execute; Befriending the ''Original Heroine'').", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Timing of Awakening", "The Original Fate", "The New Goal"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
);

-- -------------------------
-- 3.2 The Preordained Narrative Rules (setting) - Singleton
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_rule_id, 
    'The Preordained Narrative System', 
    'The invisible forces of the original plot trying to aggressively course-correct the timeline.', 
    '{"type": "object", "title": "Narrative Forces", "properties": {"The Plot Enforcer": {"title": "The Plot Enforcer", "type": "string", "enum": ["The Original Flow of Events (Coincidences force them together)", "Literal System Windows demanding obedience", "A Brainwashing/Charm Magic used by the Original Heroine", "The stubborn reputations established before the awakening"], "x-uiWidget": "radio", "useForAI": true}, "The Unintended Butterfly Effect": {"title": "The Butterfly Effect", "type": "string", "description": "How does avoiding the plot accidentally ruin everything else? (e.g., Ignored the abusive Prince, but accidentally seduced the psychopathic Northern Duke; Tried to act evil to get exiled, but everyone interprets it as ''Tender Tough Love'').", "x-uiWidget": "textarea", "useForAI": true}, "The Setting/Magic Level": {"title": "Setting / Magic Level", "type": "string", "description": "What is the background setting? (e.g., Rococo-style aristocracy with low magic; A magical academy where aristocratic standing dictates elemental affinity; A brutal dark fantasy masquerading as a romance).", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["The Plot Enforcer", "The Unintended Butterfly Effect", "The Setting/Magic Level"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
);

-- -------------------------
-- 3.3 Tone & Style (setting) - Singleton
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_style_id, 
    'Tone & Style', 
    'The delicate balance between cutthroat aristocratic politics and extremely dense romantic comedy.', 
    '{"type": "object", "title": "Tone & Style", "properties": {"Narrative Tone": {"title": "Narrative Tone", "type": "string", "enum": ["Comedic & Oblivious (Dense Protagonist)", "Machiavellian Political Drama", "Healing & Slow Burn Romance", "Domain Management & Economic Focus"], "x-uiWidget": "radio", "useForAI": true}, "Stylistic Guidelines": {"title": "Stylistic Guidelines", "type": "string", "description": "Focus on the juxtaposition of beautiful environments (gowns, tea cups, ballrooms) with terrifyingly ruthless internal thoughts. The protagonist should frequently monologue about survival flags. Romance is often born from misunderstandings (e.g., The Male Lead thinks she is playing hard to get, while she is literally trying to survive an assassination attempt).", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Narrative Tone", "Stylistic Guidelines"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
);

-- -------------------------
-- 3.4 Characters (character) - Multiple
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_char_id, 
    'The Tropes of the Otome Cast', 
    'Characters bound by their original game roles, and how the protagonist''s actions irrevocably break them.', 
    '{"type": "object", "title": "Character File", "x-titleField": "Name & Title", "properties": {"Name & Title": {"title": "Name & Title", "type": "string", "description": "e.g., Crown Prince Richard, The Cold Duke of the North, The Two-Faced Original Heroine, The Obsessive Wizard", "useForAI": true}, "Original Game Role": {"title": "Original Game Role", "type": "string", "enum": ["The Reincarnated Villainess (Protagonist)", "The Trash Prince / Ex-Fiancé", "The Yandere Secret Route Target", "The Loyal Knight Dog", "The ''Saintly'' Original Heroine (White Lotus)"], "x-uiWidget": "select", "useForAI": true}, "The Misunderstanding / Fixation": {"title": "The Fixation or Misunderstanding", "type": "string", "description": "How does the protagonist''s new behavior alter this character? (e.g., The Duke falls in love because she is ''the first woman who isn''t afraid of him''—actually, she is just too tired to care; The loyal knight becomes dangerously obsessed with her ''kindness'').", "x-uiWidget": "textarea", "useForAI": true}, "Hidden Trauma / Motivation": {"title": "Hidden Trauma", "type": "string", "description": "What is the dark backstory that explains their behavior? (e.g., The Prince is abused by the Empress; The Original Heroine is actually a regressor driven mad by repeating the game).", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Name & Title", "Original Game Role", "The Misunderstanding / Fixation"]}',
    @method_id, 'character', 1, 0, 1, NOW(), NOW()
);

-- -------------------------
-- 3.5 Scenes (scene) - Multiple
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_scene_id, 
    'Aristocratic Battlegrounds', 
    'Locations where reputations are destroyed with a cup of tea or absolute power is seized behind closed doors.', 
    '{"type": "object", "title": "Location / Stage", "x-titleField": "Location Name", "properties": {"Location Name": {"title": "Location Name", "type": "string", "description": "e.g., The Imperial Debutante Ball, The Northern Duke''s Winter Estate, The Magical Academy Conservatory", "useForAI": true}, "Social or Physical Danger": {"title": "The Danger", "type": "string", "description": "What makes this setting threatening? (e.g., A single spilled cup of tea will cause political ruin and trigger Death Flag #4; The Northern Estate is constantly attacked by demonic beasts in winter).", "x-uiWidget": "textarea", "useForAI": true}, "The Protagonist''s Subversion": {"title": "The Protagonist''s Reversal", "type": "string", "description": "How does the protagonist turn this dangerous location into their stronghold? (e.g., They introduce modern capitalism to the struggling Northern Estate; They use the ball to publicly humiliate the Prince first).", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Location Name", "Social or Physical Danger", "The Protagonist''s Subversion"]}',
    @method_id, 'scene', 1, 0, 1, NOW(), NOW()
);

-- -------------------------
-- 3.6 Assets & Artefacts (prop) - Multiple
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_prop_id, 
    'Assets, Contracts & Plot MacGuffins', 
    'Items that revolve around economic leverage, broken engagements, or stolen game relics.', 
    '{"type": "object", "title": "Item / Contract", "x-titleField": "Asset Name", "properties": {"Asset Name": {"title": "Asset Name", "type": "string", "description": "e.g., The Royal Engagement Annulment Contract, The Tear of the Saintess, The Deed to the Eastern Trade Route", "useForAI": true}, "Original Purpose in Game": {"title": "Original Purpose", "type": "string", "description": "What was this item supposed to do in the original plot? (e.g., The Tear was supposed to heal the Crown Prince, triggering the romance route with the Heroine).", "x-uiWidget": "textarea", "useForAI": true}, "The Protagonist''s Exploitation": {"title": "The Capitalist / Survival Exploit", "type": "string", "description": "How does the protagonist repurpose it? (e.g., She steals the Tear and auctions it off to fund her escape plan; She uses the Annulment Contract to extort the Royal Family for mining rights).", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Asset Name", "Original Purpose in Game", "The Protagonist''s Exploitation"]}',
    @method_id, 'prop', 1, 0, 1, NOW(), NOW()
);

-- -------------------------
-- 3.7 Factions (organization) - Multiple
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_org_id, 
    'Aristocratic Houses & Shadow Syndicates', 
    'Powerful entities that govern society and must be bribed, allied with, or dismantled.', 
    '{"type": "object", "title": "Faction", "x-titleField": "Faction Name", "properties": {"Faction Name": {"title": "Faction Name", "type": "string", "description": "e.g., The Marquis House of Elrod, The Imperial Intelligence Bureau, The Underground Merchant Guild", "useForAI": true}, "Political Agenda / Flaw": {"title": "Agenda & Flaw", "type": "string", "description": "What do they want, and why are they failing? (e.g., The Ducal House has immense military power but zero financial literacy and is going bankrupt; The Information Guild is powerful but its leader is bored).", "x-uiWidget": "textarea", "useForAI": true}, "Alliance or Destruction Strategy": {"title": "The Protagonist''s Strategy", "type": "string", "description": "How does the protagonist handle them? (e.g., Offering double-entry bookkeeping ledgers to the Duke in exchange for military protection; Inventing modern cosmetics to monopolize the Merchant Guild).", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["Faction Name", "Political Agenda / Flaw", "Alliance or Destruction Strategy"]}',
    @method_id, 'organization', 1, 0, 1, NOW(), NOW()
);
