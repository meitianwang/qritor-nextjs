-- Grim-Politics Novel - Consequentialist Political Intrigue Creation Method
-- Language: English (en)
-- Includes: creation method + 8 module types
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/init_grim_politics.sql

-- ============================================================
-- 1. Create the creation method
-- ============================================================

INSERT INTO novel_creation_method (name_zh, name_en, description_en, novel_type_zh, novel_type_en, language, visible_categories, created_at)
VALUES (
  '冷酷政治小说',
  'Grim-Politics Novel',
  'For creating dark political intrigue fiction where the ends always justify the means. There are no wise kings — only rulers who are bad and rulers who are worse. Magic, when it exists, is a dirty weapon wielded in the shadows, not a symbol of glory. Core appeal: complex schemes within schemes, and the eternal tension between those who betray and those who are betrayed. Tags: Political Intrigue, Betrayal, Kingdom Building (Dark).',
  '黑暗奇幻',
  'Dark Fantasy',
  'en',
  '["setting","character","organization","scene"]',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_en = VALUES(description_en),
  novel_type_en = VALUES(novel_type_en),
  visible_categories = VALUES(visible_categories),
  updated_at = NOW();

SET @method_id = (SELECT id FROM novel_creation_method WHERE name_en = 'Grim-Politics Novel' LIMIT 1);

-- ============================================================
-- 2. Create module types (8 total)
-- ============================================================

-- 2.1 Story Hook (setting, singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '故事钩子',
  'Story Hook',
  'The core hook that pulls readers into this game of thrones where no one''s hands are clean',
  '{"type":"object","required":["Story Hook"],"properties":{"Story Hook":{"type":"string","title":"Story Hook","description":"One sentence capturing why readers cannot look away — the specific political horror or fascination at the heart of this story","x-uiWidget":"textarea","useForAI":true},"Core Selling Point":{"type":"string","title":"Core Selling Point","description":"What makes this political intrigue story unique — the particular flavor of betrayal, the specific power struggle, the twist on the genre","x-uiWidget":"textarea","useForAI":true},"The First Betrayal":{"type":"string","title":"The First Betrayal","description":"The opening act of treachery that sets the tone — who betrays whom, and what it costs, and why the reader immediately understands the rules of this world","x-uiWidget":"textarea","useForAI":true},"Reader''s Dark Fantasy":{"type":"string","title":"Reader''s Dark Fantasy","description":"The vicarious thrill this story delivers — watching someone play the game masterfully, or watching the game devour everyone who plays it","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id,
  1,
  1,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_en = VALUES(description_en),
  json_schema_en = VALUES(json_schema_en),
  updated_at = NOW();

-- 2.2 Core Premise (setting, singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '核心设定',
  'Core Premise',
  'The foundational premise defining the political struggle, the central player, and what kind of game is being played',
  '{"type":"object","required":["Story Archetype","Central Power Struggle","Moral Framework"],"properties":{"Story Archetype":{"type":"string","title":"Story Archetype","enum":["The Usurper Rising","The Puppetmaster''s Game","The Kingmaker''s Gambit","The Succession War","The Empire''s Twilight","The Revolutionary''s Betrayal","The Spy at the Center","Other"],"x-uiWidget":"select","useForAI":true},"Archetype Details":{"type":"string","title":"Archetype Details","description":"Elaborate on the specific shape of this power struggle — who wants what, what stands in the way, and who will be destroyed along the road","x-uiWidget":"textarea","useForAI":true},"Central Power Struggle":{"type":"string","title":"Central Power Struggle","enum":["Throne Succession","Military vs. Court","Old Nobility vs. New Order","Occupied Nation vs. Empire","Church vs. Crown","Merchant Class vs. Aristocracy","Foreign Interference in Civil War"],"x-uiWidget":"select","useForAI":true},"Moral Framework":{"type":"string","title":"Moral Framework","enum":["Pure Consequentialism — Results Are All That Matter","Pragmatism with Buried Guilt","Cycles of Revenge Mistaken for Justice","Everyone Believes Their Atrocities Are Necessary","No One Believes in Anything Anymore"],"x-uiWidget":"select","useForAI":true},"Story Tone":{"type":"string","title":"Story Tone","enum":["Cold and Calculating","Operatically Tragic","Cynical and Biting","Creeping Dread","Bleak Inevitability"],"x-uiWidget":"radio","useForAI":true},"The Endgame":{"type":"string","title":"The Endgame","description":"What victory looks like in this story — and why achieving it may cost more than it''s worth","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id,
  1,
  1,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_en = VALUES(description_en),
  json_schema_en = VALUES(json_schema_en),
  updated_at = NOW();

-- 2.3 Political Landscape (setting, singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '政治格局',
  'Political Landscape',
  'The architecture of power — who holds it, how it''s maintained, and where it can be broken',
  '{"type":"object","required":["Government System","Corruption Level"],"properties":{"Government System":{"type":"string","title":"Government System","enum":["Absolute Monarchy","Oligarchic Council","Military Junta","Theocratic Rule","Feudal Fragmentation","Puppet State Under Foreign Control","Republic Rotting from Within","Other"],"x-uiWidget":"select","useForAI":true},"System Details":{"type":"string","title":"System Details","description":"How this government actually functions day to day — the formal structure and the real power beneath it","x-uiWidget":"textarea","useForAI":true},"Power Centers":{"type":"string","title":"Power Centers","description":"The key institutions, positions, and leverage points — the throne, the treasury, the army, the church, the spy network","x-uiWidget":"textarea","useForAI":true},"Corruption Level":{"type":"string","title":"Corruption Level","enum":["Systemic — Corruption Is the System","Normalized — Everyone Knows, No One Acts","Contested — Some Still Fight It","Selective — Corrupt at the Top, Functional Below","Sudden Decay — Once Healthy, Now Rotting"],"x-uiWidget":"select","useForAI":true},"Systemic Injustice":{"type":"string","title":"Systemic Injustice","description":"The structural cruelties that keep people in their place — laws that favor the powerful, traditions that sanctify oppression","x-uiWidget":"textarea","useForAI":true},"External Pressures":{"type":"string","title":"External Pressures","description":"Foreign enemies, trade rivals, or barbarian threats that the ruling class exploits — or that exploit their weakness","x-uiWidget":"textarea","useForAI":true},"The Rules of the Game":{"type":"string","title":"The Rules of the Game","description":"The unspoken laws all players understand — what''s acceptable even among enemies, what crosses a line that invites unified retaliation","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id,
  1,
  1,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_en = VALUES(description_en),
  json_schema_en = VALUES(json_schema_en),
  updated_at = NOW();

-- 2.4 Magic & Dark Arts (setting, singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '魔法与黑暗术',
  'Magic & Dark Arts',
  'Magic in this world is not glory — it''s a dirty secret, a weapon of last resort, or a lie used to control the masses',
  '{"type":"object","required":["Magic Presence"],"properties":{"Magic Presence":{"type":"string","title":"Magic Presence","enum":["Absent — Pure Political Realism","Rare and Feared — Treated as Aberration","Open Secret — Used but Never Acknowledged","Underground Currency — Traded in the Shadows","State Weapon — Controlled by the Regime","Religious Monopoly — The Church Alone Decides"],"x-uiWidget":"select","useForAI":true},"Nature of Magic":{"type":"string","title":"Nature of Magic","description":"What magic actually is and does — its fundamental nature and rules, if it exists at all","x-uiWidget":"textarea","useForAI":true},"The Cost":{"type":"string","title":"The Cost","description":"What using magic demands — health, sanity, moral corruption, debts to dark powers, social ostracism, or death","x-uiWidget":"textarea","useForAI":true},"Social Perception":{"type":"string","title":"Social Perception","description":"How society views magic users — feared, enslaved, exploited, hidden, or burned at the stake","x-uiWidget":"textarea","useForAI":true},"Who Wields It":{"type":"string","title":"Who Wields It","description":"Which factions or individuals control access to magic, and how they leverage that monopoly","x-uiWidget":"textarea","useForAI":true},"Magic as Political Tool":{"type":"string","title":"Magic as Political Tool","description":"Specific ways magic is used in the power game — assassination, mind control, forged prophecies, manufactured miracles","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id,
  1,
  1,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_en = VALUES(description_en),
  json_schema_en = VALUES(json_schema_en),
  updated_at = NOW();

-- 2.5 Writing Style (setting, singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '文风设定',
  'Writing Style',
  'The narrative voice that renders political machination on the page — how the reader experiences the game',
  '{"type":"object","required":["Narrative POV","Prose Style"],"properties":{"Narrative POV":{"type":"string","title":"Narrative POV","enum":["Third Person — Multiple POVs (The Game of Thrones Approach)","Third Person — Single POV (One Player''s Perspective)","First Person — The Schemer Narrates","Unreliable Narrator — The Official History is a Lie"],"x-uiWidget":"radio","useForAI":true},"Prose Style":{"type":"string","title":"Prose Style","enum":["Dry and Precise — Like a Political Dispatch","Dense and Layered — Every Sentence Hides Subtext","Sharp and Ironic — The Gap Between What''s Said and Done","Lush and Poisonous — Beauty Masking Rot","Sparse and Cold — Emotion Stripped Away"],"x-uiWidget":"radio","useForAI":true},"Pacing":{"type":"string","title":"Pacing","enum":["Slow Boil — Tension Builds Scene by Scene","Intercutting — Multiple Schemes in Parallel","Episodic Escalation — Each Act Raises the Stakes","Sudden Reversals — The Ground Shifts Without Warning"],"x-uiWidget":"radio","useForAI":true},"Dialogue Style":{"type":"string","title":"Dialogue Style","enum":["Every Word a Weapon — Nothing Said Directly","Formal and Coded — The Court Register","Blunt Behind Closed Doors — Masks Drop in Private","Performative — Characters Act for Unseen Audiences"],"x-uiWidget":"radio","useForAI":true},"Moral Ambiguity Handling":{"type":"string","title":"Moral Ambiguity Handling","enum":["Reader Judges — No Authorial Comment","Authorial Irony — We Know More Than Characters","Tragic Framing — Sympathy Without Endorsement","Pure Observation — The Author Watches Without Feeling"],"x-uiWidget":"radio","useForAI":true},"Banned Words":{"type":"string","title":"Banned Words","description":"Words or expressions to avoid — clichés, noble platitudes, or anything that implies the world is fair","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id,
  1,
  1,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_en = VALUES(description_en),
  json_schema_en = VALUES(json_schema_en),
  updated_at = NOW();

-- 2.6 Character (character, non-singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '角色',
  'Character',
  'The players in the game — from kings who are merely the most powerful pawn to spymasters who pull every string',
  '{"type":"object","x-titleField":"Name","required":["Name","Role"],"properties":{"Name":{"type":"string","title":"Name","description":"Character''s name — no parenthetical notes","useForAI":true},"Role":{"type":"string","title":"Role","enum":["The Ruler (Bad or Worse)","The Spymaster","The Power Behind the Throne","The General","The Kingmaker","The Schemer Without a Crown","The Idealist Being Broken","The Expendable Loyalist","The Useful Enemy","The Wildcard"],"x-uiWidget":"radio","useForAI":true},"Gender":{"type":"string","title":"Gender","enum":["Male","Female","Non-binary","Other"],"x-uiWidget":"radio","useForAI":true},"Age":{"type":"string","title":"Age","description":"Character''s age or age range","useForAI":true},"Public Face":{"type":"string","title":"Public Face","description":"The mask this character wears in court — the reputation they''ve carefully constructed","x-uiWidget":"textarea","useForAI":true},"True Agenda":{"type":"string","title":"True Agenda","description":"What they actually want, beneath all the pretense — and how far they''ll go to get it","x-uiWidget":"textarea","useForAI":true},"Political Assets":{"type":"string","title":"Political Assets","description":"Their power base: loyal soldiers, financial leverage, blackmail material, family ties, or information networks","x-uiWidget":"textarea","useForAI":true},"Fatal Weakness":{"type":"string","title":"Fatal Weakness","description":"The vulnerability that could destroy them — a person they won''t sacrifice, a line they won''t cross, or a secret that would undo them","x-uiWidget":"textarea","useForAI":true},"Betrayal Potential":{"type":"string","title":"Betrayal Potential","description":"How likely they are to betray their current allies, and under what circumstances they would do it","x-uiWidget":"textarea","useForAI":true},"Relationship to Protagonist":{"type":"string","title":"Relationship to Protagonist","description":"Their position relative to the central player — rival, tool, temporary shield, or the betrayal yet to come","x-uiWidget":"textarea","useForAI":true},"Current Political Standing":{"type":"string","title":"Current Political Standing","description":"Their current position in the power hierarchy","isDynamic":true},"Known Allegiances":{"type":"string","title":"Known Allegiances","description":"Their current public alliances — and any fractures beginning to show","isDynamic":true}}}',
  @method_id,
  1,
  0,
  'character',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_en = VALUES(description_en),
  json_schema_en = VALUES(json_schema_en),
  updated_at = NOW();

-- 2.7 Faction / Power Bloc (organization, non-singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '权力集团',
  'Power Bloc',
  'The factions competing for control — every one of them corrupt, every one of them believing they''re the necessary evil',
  '{"type":"object","x-titleField":"Faction Name","required":["Faction Name","Faction Type"],"properties":{"Faction Name":{"type":"string","title":"Faction Name","useForAI":true},"Faction Type":{"type":"string","title":"Faction Type","enum":["Royal Court Faction","Military Command","Noble House","Church / Religious Order","Merchant Consortium","Foreign Power''s Proxy","Shadow Network / Intelligence Apparatus","Revolutionary Movement","Criminal Syndicate with Political Reach"],"x-uiWidget":"select","useForAI":true},"Declared Purpose":{"type":"string","title":"Declared Purpose","description":"The public ideology, the stated reason for their existence — what they claim to stand for","x-uiWidget":"textarea","useForAI":true},"Real Purpose":{"type":"string","title":"Real Purpose","description":"What they actually want: more land, more gold, to put their man on the throne, to tear the whole thing down","x-uiWidget":"textarea","useForAI":true},"Power Base":{"type":"string","title":"Power Base","description":"The source of their influence — armies, treasury control, information networks, religious authority, or mob support","x-uiWidget":"textarea","useForAI":true},"Key Figures":{"type":"string","title":"Key Figures","description":"The faction''s leadership and the power players jockeying within it","x-uiWidget":"textarea","useForAI":true},"Relationship to Protagonist":{"type":"string","title":"Relationship to Protagonist","enum":["Tool to Be Wielded","Temporary Alliance of Convenience","Sworn Enemy","Unknowing Instrument","Under Protagonist''s Control","Rival for the Same Prize"],"x-uiWidget":"select","useForAI":true},"Exploitable Fractures":{"type":"string","title":"Exploitable Fractures","description":"The internal conflicts, rivalries, or ideological tensions a clever enemy could exploit to shatter them","x-uiWidget":"textarea","useForAI":true},"Current Influence":{"type":"string","title":"Current Influence","description":"Present-day political and military strength","isDynamic":true},"Internal Stability":{"type":"string","title":"Internal Stability","description":"Current state of internal unity — who''s plotting against whom","isDynamic":true}}}',
  @method_id,
  1,
  0,
  'organization',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_en = VALUES(description_en),
  json_schema_en = VALUES(json_schema_en),
  updated_at = NOW();

-- 2.8 Location (scene, non-singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '地点',
  'Location',
  'The stages where the game is played — every place has a history of who it broke and who it made',
  '{"type":"object","x-titleField":"Location Name","required":["Location Name","Location Type"],"properties":{"Location Name":{"type":"string","title":"Location Name","useForAI":true},"Location Type":{"type":"string","title":"Location Type","enum":["Throne Room / Seat of Power","Council Chamber","Spymaster''s Lair","Battlefield / Siege Ground","Prison / Dungeon","Diplomatic Neutral Ground","Black Market / Underground","Religious Sanctuary","Border Fortress","Abandoned Palace / Ruins of Former Power"],"x-uiWidget":"select","useForAI":true},"Political Significance":{"type":"string","title":"Political Significance","description":"Why this location matters in the power game — what controlling it means, what secrets it holds","x-uiWidget":"textarea","useForAI":true},"Atmosphere":{"type":"string","title":"Atmosphere","description":"The mood and physical details — the smell of old stone and new blood, the weight of history in the walls","x-uiWidget":"textarea","useForAI":true},"Hidden Layers":{"type":"string","title":"Hidden Layers","description":"The secrets beneath the surface: hidden passages, buried atrocities, surveillance networks, or buried proof of past treacheries","x-uiWidget":"textarea","useForAI":true},"Controlling Faction":{"type":"string","title":"Controlling Faction","description":"Who currently holds this location — and who wants it","isDynamic":true},"Current State":{"type":"string","title":"Current State","description":"Current condition: secure, contested, under siege, fallen, or abandoned","isDynamic":true}}}',
  @method_id,
  1,
  0,
  'scene',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_en = VALUES(description_en),
  json_schema_en = VALUES(json_schema_en),
  updated_at = NOW();
