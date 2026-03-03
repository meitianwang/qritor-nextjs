-- Alpha Werewolf (Paranormal Romance) Novel Creation Method
-- Language: English (en)
-- Includes: creation method + 8 module types

INSERT INTO novel_creation_method (name_zh, name_en, description_en, novel_type_zh, novel_type_en, language, visible_categories, created_at)
VALUES (
  'Alpha狼人小说',
  'Alpha Werewolf (Paranormal Romance) Novel',
  'For creating explosive Paranormal Romance / Alpha Werewolf fiction. Centered around rigid werewolf pack hierarchies, Fated Mates, rejection tropes, and the intense, possessive romance between a powerful, cursed Alpha and an underestimated, often abused Omega/Rogue who awakens a mythic bloodline or unique power.',
  '浪漫幻想',
  'Alpha Werewolf / Paranormal Romance',
  'en',
  '["setting","character","organization","scene"]',
  NOW()
)
ON DUPLICATE KEY UPDATE description_en=VALUES(description_en), novel_type_en=VALUES(novel_type_en), visible_categories=VALUES(visible_categories), updated_at=NOW();

SET @method_id = (SELECT id FROM novel_creation_method WHERE name_en = 'Alpha Werewolf (Paranormal Romance) Novel' LIMIT 1);

-- 1. Story Hook
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '故事钩子',
  'Story Hook',
  'The shattering rejection, unbearable abuse, or sudden forced mating.',
  '{"type":"object","required":["The Rejection/Inciting Incident"],"properties":{"The Rejection/Inciting Incident":{"type":"string","title":"The Rejection/Inciting Incident","description":"The devastating moment the MC is publicly rejected by their destined mate or sold to a monster","x-uiWidget":"textarea","useForAI":true},"The Abusive Reality":{"type":"string","title":"The Abusive Reality (The Pack)","description":"Why the MC is at the bottom of the hierarchy (e.g., considered a wolf-less \'runt\', an Omega slave)","x-uiWidget":"textarea","useForAI":true},"The Sudden Fated Encounter":{"type":"string","title":"The Sudden Fated Encounter","description":"The terrifying moment they lock eyes with the most dangerous Alpha on the continent and completely submit to the mate bond","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id, 1, 1, 'setting', NOW()
) ON DUPLICATE KEY UPDATE json_schema_en=VALUES(json_schema_en);

-- 2. Core Premise
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '核心设定',
  'Core Premise',
  'The MC''s hidden bloodline, the possessive Alpha, and the ultimate revenge.',
  '{"type":"object","required":["The Hidden Bloodline"],"properties":{"The Hidden Bloodline":{"type":"string","title":"The Hidden Bloodline (The MC)","description":"The secret reason the MC isn''t shifting (e.g., they are actually a rare White Wolf, a Luna, or half-witch)","x-uiWidget":"textarea","useForAI":true},"The Alpha''s Curse":{"type":"string","title":"The Alpha''s Curse/Trauma","description":"Why the male lead is feared as a tyrant and why only the MC can soothe his feral beast","x-uiWidget":"textarea","useForAI":true},"The Revenge Arc":{"type":"string","title":"The Revenge Arc (Face-Slapping)","description":"How the MC will inevitably humiliate the ex-mate who rejected them and rule as a Queen","x-uiWidget":"textarea","useForAI":true},"Dominant Tone":{"type":"string","title":"Dominant Tone","enum":["Intense Angst & Groveling","Steamy Possessive Romance","Action-Heavy Pack War","Cinderella Abuse Survivor"],"x-uiWidget":"radio","useForAI":true}}}',
  @method_id, 1, 1, 'setting', NOW()
) ON DUPLICATE KEY UPDATE json_schema_en=VALUES(json_schema_en);

-- 3. System Mechanics
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '系统机制',
  'System Mechanics',
  'The biology of shifters, mind-links, and the absolute law of the Mate Bond.',
  '{"type":"object","required":["The Mate Bond"],"properties":{"The Mate Bond":{"type":"string","title":"The Mate Bond Connection","description":"The overwhelming physical gravity, the intoxicating scent, and the intense telepathic link between mates","x-uiWidget":"textarea","useForAI":true},"Pack Hierarchy Dynamics":{"type":"string","title":"Pack Hierarchy Dynamics","description":"Alpha Command (a voice that forces submission), Beta strength, and Omega subservience","x-uiWidget":"textarea","useForAI":true},"The Inner Wolf":{"type":"string","title":"The Inner Wolf Personality","description":"How the human mind and the wolf mind converse or fight for control (e.g., the wolf demanding ''MATE!'')","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id, 1, 1, 'setting', NOW()
) ON DUPLICATE KEY UPDATE json_schema_en=VALUES(json_schema_en);

-- 4. Worldbuilding
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '世界观',
  'Worldbuilding',
  'The secret shifter society hiding in modern billionaire mansions or dark forests.',
  '{"type":"object","required":["The Shifter Society"],"properties":{"The Shifter Society":{"type":"string","title":"Modern Shifter Society","description":"Packs running massive corporate empires or isolated heavily guarded forest territories","x-uiWidget":"textarea","useForAI":true},"The Moon Goddess":{"type":"string","title":"The Moon Goddess (Religion)","description":"The deity who paired the fated mates and is worshipped/blamed for their suffering","x-uiWidget":"textarea","useForAI":true},"Rival Species":{"type":"string","title":"Rival Supernatural Species","description":"Vampire covens, rogue wolves, or witch covens threatening the pack''s borders","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id, 1, 1, 'setting', NOW()
) ON DUPLICATE KEY UPDATE json_schema_en=VALUES(json_schema_en);

-- 5. Writing Style
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '文风设定',
  'Writing Style',
  'Heavy emphasis on visceral emotions, agonizing heartache, and feral possessiveness.',
  '{"type":"object","required":["Sensory Romance Focus"],"properties":{"Sensory Romance Focus":{"type":"string","title":"Sensory & Attraction Focus","description":"Intoxicating scents (cedar, rain, vanilla), intense eye contact, growling, and the electric shock of touch","x-uiWidget":"textarea","useForAI":true},"The Dual POV Pace":{"type":"string","title":"Dual POV Pacing","description":"Alternate between the MC''s agonizing heartbreak/resilience and the Alpha''s furious, possessive obsession","x-uiWidget":"textarea","useForAI":true},"Angst & Groveling Mechanics":{"type":"string","title":"Angst & Groveling Mechanics","description":"Milk the emotional pain of the rejection, followed by the ex-mate''s desperate, pathetic groveling when they realize their mistake","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id, 1, 1, 'setting', NOW()
) ON DUPLICATE KEY UPDATE json_schema_en=VALUES(json_schema_en);

-- 6. Character
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '角色',
  'Character',
  'The abused MC, the dangerous Alpha mate, the ex, and the rival bitches.',
  '{"type":"object","x-titleField":"Name","required":["Name","Role"],"properties":{"Name":{"type":"string","title":"Name","useForAI":true},"Role":{"type":"string","title":"Role","enum":["The Resilient Omega (MC)","The Tyrant Alpha (Male Lead)","The Regretful Ex-Mate","The Jealous Rival (Mean Girl)","The Loyal Beta/Friend"],"x-uiWidget":"select","useForAI":true},"Wolf Appearance & Scent":{"type":"string","title":"Wolf Appearance & Signature Scent","description":"e.g., A massive midnight-black wolf smelling of thunderstorms and pine","x-uiWidget":"textarea","useForAI":true},"Core Personality / Flaw":{"type":"string","title":"Core Personality / Flaw","description":"Traumatized, aggressively protective, insanely arrogant, or deeply insecure","x-uiWidget":"textarea","useForAI":true},"Current Status":{"type":"string","title":"Current Status / Mate Status","isDynamic":true},"Current Location":{"type":"string","title":"Current Location","isDynamic":true}}}',
  @method_id, 1, 0, 'character', NOW()
) ON DUPLICATE KEY UPDATE json_schema_en=VALUES(json_schema_en);

-- 7. Faction
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '阵营',
  'Faction',
  'The abusive home pack, the legendary Alpha pack, and vicious Rogues.',
  '{"type":"object","x-titleField":"Pack Name","required":["Pack Name","Pack Type"],"properties":{"Pack Name":{"type":"string","title":"Pack/Faction Name","useForAI":true},"Pack Type":{"type":"string","title":"Pack Type","enum":["The MC''s Abusive Home Pack","The Male Lead''s Legendary Pack","Rogue Wolf Syndicate","Vampire/Witch Coven"],"x-uiWidget":"select","useForAI":true},"Culture & Brutality":{"type":"string","title":"Culture & Brutality","description":"Do they worship strength? Do they enslave Omegas? Are they an unchallengeable billionaire family?","x-uiWidget":"textarea","useForAI":true},"Key Assets":{"type":"string","title":"Key Assets / Territory","description":"Corporate skyscrapers, ancient fortresses in the mountains","x-uiWidget":"textarea","useForAI":true},"Current Influence":{"type":"string","title":"Current Influence / Wealth","isDynamic":true}}}',
  @method_id, 1, 0, 'organization', NOW()
) ON DUPLICATE KEY UPDATE json_schema_en=VALUES(json_schema_en);

-- 8. Scene
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '场景',
  'Scene',
  'The glamorous Alpha Gala, the dark forest borders, and the suffocating Omega quarters.',
  '{"type":"object","x-titleField":"Location Name","required":["Location Name","Location Type"],"properties":{"Location Name":{"type":"string","title":"Location Name","useForAI":true},"Location Type":{"type":"string","title":"Location Type","enum":["The Alpha''s Mansion / Penthouse","The Pack House (Omega Quarters)","The Forest Border / Neutral Zone","The Mating Gala / Ballroom"],"x-uiWidget":"select","useForAI":true},"Atmosphere / Scent":{"type":"string","title":"Atmosphere / Scent","description":"Oppressively luxurious vs chillingly cold and damp","x-uiWidget":"textarea","useForAI":true},"Emotional Significance":{"type":"string","title":"Emotional Significance","description":"Where the MC was degraded vs where the MC is worshipped as a Queen","x-uiWidget":"textarea","useForAI":true},"Current State":{"type":"string","title":"Current State","isDynamic":true}}}',
  @method_id, 1, 0, 'scene', NOW()
) ON DUPLICATE KEY UPDATE json_schema_en=VALUES(json_schema_en);
