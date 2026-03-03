-- The Gaslamp Eldritch (Steampunk Horror) Novel Creation Method
-- Language: English (en)
-- Includes: creation method + 8 module types

INSERT INTO novel_creation_method (name_zh, name_en, description_en, novel_type_zh, novel_type_en, language, visible_categories, created_at)
VALUES (
  '煤气灯克苏鲁小说',
  'The Gaslamp Eldritch (Steampunk Horror) Novel',
  'For creating victorian-era/steampunk fiction mashed with cosmic horror and progression mechanics (e.g. Lord of the Mysteries, Bloodborne). Features heavy fog, gaslamps, revolvers, grotesque monstrosities, secretive occult pathways, and the constant threat of descending into absolute madness while climbing the power hierarchy.',
  '恐怖',
  'Horror',
  'en',
  '["setting","character","organization","scene"]',
  NOW()
)
ON DUPLICATE KEY UPDATE description_en=VALUES(description_en), novel_type_en=VALUES(novel_type_en), visible_categories=VALUES(visible_categories), updated_at=NOW();

SET @method_id = (SELECT id FROM novel_creation_method WHERE name_en = 'The Gaslamp Eldritch (Steampunk Horror) Novel' LIMIT 1);

-- 1. Story Hook
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '故事钩子',
  'Story Hook',
  'The occult mystery that drags the protagonist into the hidden world.',
  '{"type":"object","required":["The Occult Mystery"],"properties":{"The Occult Mystery":{"type":"string","title":"The Occult Mystery (The Catalyst)","description":"A terrifying paranormal event (e.g., finding a diary bleeding black ink, witnessing a werewolf in a top hat)","x-uiWidget":"textarea","useForAI":true},"The Vile Discovery":{"type":"string","title":"The Vile Discovery","description":"The cursed artifact or profound secret the MC accidentally uncovers","x-uiWidget":"textarea","useForAI":true},"The Golden Cheat":{"type":"string","title":"The Golden Cheat/System","description":"How the MC can uniquely survive this madness (e.g., a mysterious grey fog room, immunity to certain mind-corruptions)","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id, 1, 1, 'setting', NOW()
) ON DUPLICATE KEY UPDATE json_schema_en=VALUES(json_schema_en);

-- 2. Core Premise
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '核心设定',
  'Core Premise',
  'MC identity and their goal in this madness-infused Victorian society.',
  '{"type":"object","required":["MC Identity"],"properties":{"MC Identity":{"type":"string","title":"MC Identity / Public Front","enum":["Impoverished Detective/Investigator","Aristocratic Scholar","Underground Doctor","Street Urchin / Scavenger","Clergy Member"],"x-uiWidget":"select","useForAI":true},"The Hidden Goal":{"type":"string","title":"The Hidden Goal","description":"What the MC desires (e.g., seeking the cure for their occult curse, hunting the creature that killed their family, ascending to true Godhood)","x-uiWidget":"textarea","useForAI":true},"Social Standing":{"type":"string","title":"Social Standing & Struggle","description":"How the MC navigates the strict Victorian class system while hiding their dark secrets","x-uiWidget":"textarea","useForAI":true},"Dominant Tone":{"type":"string","title":"Dominant Tone","enum":["Grotesque Body Horror (Bloodborne)","Methodical Occult Mystery (LOTM)","Action-Heavy Steampunk Monster Hunting"],"x-uiWidget":"radio","useForAI":true}}}',
  @method_id, 1, 1, 'setting', NOW()
) ON DUPLICATE KEY UPDATE json_schema_en=VALUES(json_schema_en);

-- 3. System Mechanics
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '系统机制',
  'System Mechanics',
  'The Progression System (Potions/Pathways) and the severe cost of power.',
  '{"type":"object","required":["The Power System"],"properties":{"The Power System":{"type":"string","title":"The Power System (Pathways/Potions)","description":"How people gain power (e.g., drinking elixirs made from monster organs, studying forbidden grimoires, surgical augmentation)","x-uiWidget":"textarea","useForAI":true},"The Mechanics of Ascension":{"type":"string","title":"The Mechanics of Ascension (Acting/Digesting)","description":"How to level up without dying (e.g., one must strict ''roleplay'' their potion''s class to absorb it without going insane)","x-uiWidget":"textarea","useForAI":true},"The Price (Madness)":{"type":"string","title":"The Price (Madness/Corruption)","description":"The terrifying side effect of power. Hearing whispers, growing tentacles in the dark, losing humanity.","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id, 1, 1, 'setting', NOW()
) ON DUPLICATE KEY UPDATE json_schema_en=VALUES(json_schema_en);

-- 4. Worldbuilding
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '世界观',
  'Worldbuilding',
  'The polluted, hyper-industrialized city and the hidden Outer Gods watching it.',
  '{"type":"object","required":["The Industrial Metropolis"],"properties":{"The Industrial Metropolis":{"type":"string","title":"The Industrial Metropolis","description":"A smog-choked, rain-slicked pseudo-London where the wealthy have gaslamps and the poor die of soot and plagues","x-uiWidget":"textarea","useForAI":true},"The Outer Gods/Deities":{"type":"string","title":"The Outer Gods/Deities","description":"The incomprehensible cosmic beings that sleep beneath the ocean or in the cosmos, driving mortals mad just by looking at them","x-uiWidget":"textarea","useForAI":true},"Orthodoxy vs Heresy":{"type":"string","title":"Orthodoxy vs Heresy","description":"How the official churches control the masses with fear, burning \"witches\" while secretly hoarding occult knowledge","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id, 1, 1, 'setting', NOW()
) ON DUPLICATE KEY UPDATE json_schema_en=VALUES(json_schema_en);

-- 5. Writing Style
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '文风设定',
  'Writing Style',
  'Victorian elegance mixed with visceral, nauseating descriptions of the unnatural.',
  '{"type":"object","required":["Prose Style"],"properties":{"Prose Style":{"type":"string","title":"Prose/Atmosphere Style","description":"Elegant, archaic sentence structures sharply juxtaposed with raw, grotesque descriptions of gore and tentacles","x-uiWidget":"textarea","useForAI":true},"Sensory Deprivation & Horror":{"type":"string","title":"Sensory focus (Madness)","description":"Describe the smell of rust and blood, the flickering of amber gaslamps, the phantom whispers scratching at the eardrums","x-uiWidget":"textarea","useForAI":true},"Combat Pacing":{"type":"string","title":"Combat Pacing","description":"Lethal, fast, and reliant on magical artifacts and revolvers. One mistake leads to madness or death.","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id, 1, 1, 'setting', NOW()
) ON DUPLICATE KEY UPDATE json_schema_en=VALUES(json_schema_en);

-- 6. Character
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '角色',
  'Character',
  'Inquisitors, mad scholars, corrupt nobles, and the afflicted.',
  '{"type":"object","x-titleField":"Name","required":["Name","Role"],"properties":{"Name":{"type":"string","title":"Name","useForAI":true},"Role":{"type":"string","title":"Role","enum":["The Protagonist","Orthodox Inquisitor/Nighthawk","Mad Cultist","Corrupt Aristocrat","Underground Information Broker","Tragic Victim"],"x-uiWidget":"select","useForAI":true},"Pathway/Abilities":{"type":"string","title":"Occult Pathway/Abilities","description":"Their specific supernatural class (e.g., Sequence 8: Gravedigger, carrying a silver rapier and holy water)","x-uiWidget":"textarea","useForAI":true},"Psychological State":{"type":"string","title":"Psychological State & Madness","description":"Everyone here is mentally scarred. What are their symptoms? (e.g., severe paranoia, hears phantom babies crying)","x-uiWidget":"textarea","useForAI":true},"Public vs Private Persona":{"type":"string","title":"Public vs Private Persona","description":"Respectable gentleman by day, flesh-eating ghoul by night.","x-uiWidget":"textarea","useForAI":true},"Current Status":{"type":"string","title":"Current Status / Corruption Level","isDynamic":true},"Current Location":{"type":"string","title":"Current Location","isDynamic":true}}}',
  @method_id, 1, 0, 'character', NOW()
) ON DUPLICATE KEY UPDATE json_schema_en=VALUES(json_schema_en);

-- 7. Faction
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '阵营',
  'Faction',
  'Official Churches, Heretical Cults, and Aristocratic Secret Societies.',
  '{"type":"object","x-titleField":"Faction Name","required":["Faction Name","Faction Type"],"properties":{"Faction Name":{"type":"string","title":"Faction Name","useForAI":true},"Faction Type":{"type":"string","title":"Faction Type","enum":["Orthodox Church (Government Sanctioned)","Heretical Cult (Outer God Worshippers)","Underground Secret Society (Scholars/Thieves)","Aristocratic Cabal"],"x-uiWidget":"select","useForAI":true},"Beliefs & Rituals":{"type":"string","title":"Beliefs & Rituals","description":"What vile or strict rituals do they perform? (e.g., blood sacrifices under the red moon)","x-uiWidget":"textarea","useForAI":true},"Key Assets & Relics":{"type":"string","title":"Key Assets & Relics","description":"Sealed Artifacts or political power they control (e.g., The Grade-0 Artifact: The Weeping Crown)","x-uiWidget":"textarea","useForAI":true},"Relationship to Protagonist":{"type":"string","title":"Relationship to Protagonist","description":"Is the MC hiding from them, manipulating them, or working for them?","x-uiWidget":"textarea","useForAI":true},"Current Influence":{"type":"string","title":"Current Influence","isDynamic":true}}}',
  @method_id, 1, 0, 'organization', NOW()
) ON DUPLICATE KEY UPDATE json_schema_en=VALUES(json_schema_en);

-- 8. Scene
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '场景',
  'Scene',
  'Foggy cobblestone streets, opulent manors, and subterranean labyrinths.',
  '{"type":"object","x-titleField":"Location Name","required":["Location Name","Location Type"],"properties":{"Location Name":{"type":"string","title":"Location Name","useForAI":true},"Location Type":{"type":"string","title":"Location Type","enum":["Smog-filled Alleyway / Slums","Opulent Aristocratic Manor","The Hidden Black Market","Orthodox Cathedral","Underground Crypt / Sewers"],"x-uiWidget":"select","useForAI":true},"Atmosphere / Lighting":{"type":"string","title":"Atmosphere / Lighting","description":"Gaslamps flickering in thick yellow fog, the smell of damp brick, shadows moving on their own.","x-uiWidget":"textarea","useForAI":true},"The Hidden Danger":{"type":"string","title":"The Hidden Danger (Occult Threat)","description":"A monster lurking in the pipes, or a cursed painting driving guests to suicide.","x-uiWidget":"textarea","useForAI":true},"Strategic Value":{"type":"string","title":"Strategic Value (Clues/Items)","description":"Why characters are risking madness to come here.","x-uiWidget":"textarea","useForAI":true},"Current State":{"type":"string","title":"Current State (Safe/Contaminated)","isDynamic":true}}}',
  @method_id, 1, 0, 'scene', NOW()
) ON DUPLICATE KEY UPDATE json_schema_en=VALUES(json_schema_en);
