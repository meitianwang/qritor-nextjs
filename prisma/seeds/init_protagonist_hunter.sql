-- The Protagonist Hunter - Protagonist Hunter Creation Method
-- Language: English (en)
-- Includes: creation method + 8 module types
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/init_protagonist_hunter.sql

-- ============================================================
-- 1. Create the creation method
-- ============================================================

INSERT INTO novel_creation_method (name_zh, name_en, description_en, novel_type_zh, novel_type_en, language, visible_categories, created_at)
VALUES (
  '主角猎人小说',
  'The Protagonist Hunter',
  'For creating stories told from the perspective of a transmigrator who wakes up inside a story — not as the hero, but as a doomed mob character, named villain, or mid-boss destined to be killed by the Chosen One. Armed with foreknowledge of the original plot, the MC races to steal the hero''s lucky encounters, neutralize their cheat abilities, and eliminate the protagonist before destiny can unfold. Core logic: use meta-knowledge as the ultimate weapon against fate. Core appeal: watching a supposed nobody outmaneuver the universe''s favorite protagonist using nothing but intelligence and foreknowledge. Tags: Anti-Hero, Meta, Scheming.',
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

SET @method_id = (SELECT id FROM novel_creation_method WHERE name_en = 'The Protagonist Hunter' LIMIT 1);

-- ============================================================
-- 2. Create module types (8 total)
-- ============================================================

-- 2.1 Story Hook (setting, singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '故事钩子',
  'Story Hook',
  'The core hook that makes readers invested in THIS hunter''s story — the irresistible premise of a mob character who knows the script and refuses to follow it',
  '{"type":"object","required":["Story Hook"],"properties":{"Story Hook":{"type":"string","title":"Story Hook","description":"One sentence capturing the story''s core premise — why this transmigrator''s decision to hunt the hero is compelling, and what makes their foreknowledge-powered scheme irresistible","x-uiWidget":"textarea","useForAI":true},"The Cruel Irony":{"type":"string","title":"The Cruel Irony","description":"The central dark irony — what makes the MC''s situation uniquely perverse? (e.g., a devoted fan of the original story reincarnated as the villain who kills the hero, someone who knows every death flag and still faces them)","x-uiWidget":"textarea","useForAI":true},"Opening Move":{"type":"string","title":"Opening Move","description":"The MC''s first calculated action — what they do immediately upon realizing their situation, the move that signals to readers what kind of story this will be","x-uiWidget":"textarea","useForAI":true},"Reader Promise":{"type":"string","title":"Reader Promise","description":"The core satisfaction readers expect — watching foreknowledge weaponized against destiny, seeing the hero''s lucky encounters systematically stolen, the thrill of a ''mob character'' outmaneuvering the chosen one","x-uiWidget":"textarea","useForAI":true}}}',
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

-- 2.2 Origin Profile (setting, singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '身份背景',
  'Origin Profile',
  'The MC''s identity in the original story and the starting conditions of their hunt — who they were supposed to be, and what they have to work with',
  '{"type":"object","required":["Original Identity","Designated Death","Starting Advantages"],"properties":{"Original Identity":{"type":"string","title":"Original Identity","enum":["Mob Character (Background NPC)","Named Villain (Canon Fodder)","Mid-Boss (Story Arc Boss)","Main Antagonist (End-Game Threat)","Rival Character (Destined to Lose)","Tragic Figure (Dies for Hero''s Growth)","Other"],"x-uiWidget":"select","useForAI":true},"Character Name in Original Story":{"type":"string","title":"Character Name in Original Story","description":"The name this character had in the original story — if they were named at all","useForAI":true},"Designated Death":{"type":"string","title":"Designated Death","description":"How and when the character was supposed to die in the original story — the fate the MC is racing to avoid","x-uiWidget":"textarea","useForAI":true},"Starting Advantages":{"type":"string","title":"Starting Advantages","description":"Resources, position, or abilities the MC already has at the story''s start — the foundation they''ll build their hunt on. Even mob characters have something to work with.","x-uiWidget":"textarea","useForAI":true},"Foreknowledge Source":{"type":"string","title":"Foreknowledge Source","enum":["Read the Original Novel or Manhwa Before Death","Died as a Fan and Reincarnated Inside","Received the Original Character''s Memories","System-Granted Plot Knowledge","Dreamed the Entire Original Story","Unexplained Foreknowledge"],"x-uiWidget":"select","useForAI":true}}}',
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

-- 2.3 Plot Foreknowledge (setting, singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '剧情预知',
  'Plot Foreknowledge',
  'The intelligence advantage — what the MC knows about the original plot, the hero''s destined power-ups, and the critical moments they must intercept',
  '{"type":"object","required":["Hero Identity","Hero Cheat Abilities","Known Plot Events"],"properties":{"Original Story Title":{"type":"string","title":"Original Story Title","description":"The title of the original novel, manhwa, or story the MC has foreknowledge of","useForAI":true},"Hero Identity":{"type":"string","title":"Hero Identity","description":"Who the Hero is — background, personality, starting position, and why they are the Chosen One destined to win","x-uiWidget":"textarea","useForAI":true},"Hero Cheat Abilities":{"type":"string","title":"Hero Cheat Abilities","description":"The Hero''s special powers, divine protection, system privileges, and lucky encounters — the unfair advantages the MC must neutralize before they fully activate","x-uiWidget":"textarea","useForAI":true},"Known Plot Events":{"type":"string","title":"Known Plot Events","description":"Key events the MC knows will unfold — the hero''s power-up locations, critical alliances they''ll form, turning points in the original story","x-uiWidget":"textarea","useForAI":true},"Critical Interception Windows":{"type":"string","title":"Critical Interception Windows","description":"The specific moments the MC must act — which encounters to intercept, which treasures to claim first, which mentors to neutralize before the hero reaches them","x-uiWidget":"textarea","useForAI":true},"Knowledge Gaps":{"type":"string","title":"Knowledge Gaps","description":"What the MC does NOT know — unread chapters, plot details obscured by their own interference, events the original story never covered","x-uiWidget":"textarea","useForAI":true,"isDynamic":true}}}',
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

-- 2.4 Hunter Strategy (setting, singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '猎人策略',
  'Hunter Strategy',
  'The master plan for eliminating the hero''s destiny — the approach, current phase, and how the MC handles butterfly effects from their own interference',
  '{"type":"object","required":["Primary Approach","Resource Acquisition Plan"],"properties":{"Primary Approach":{"type":"string","title":"Primary Approach","enum":["Opportunity Theft — claim the hero''s lucky encounters first","Power Denial — neutralize hero''s cheat abilities at the source","Early Elimination — kill the hero before growth becomes unstoppable","Alliance Sabotage — turn the hero''s future allies against them","Information Warfare — destroy the hero''s trust network and reputation","Corruption — turn the hero to the dark side before they become the hero","Combined Multi-Phase Strategy"],"x-uiWidget":"select","useForAI":true},"Current Phase":{"type":"string","title":"Current Phase","enum":["Preparation — building resources and intelligence before first contact","Interception — claiming the hero''s first power-ups and lucky encounters","Isolation — cutting the hero off from destined allies and mentors","Confrontation — direct engagement, the hero knows something is wrong","Endgame — final elimination, the window is closing"],"x-uiWidget":"select","useForAI":true,"isDynamic":true},"Resource Acquisition Plan":{"type":"string","title":"Resource Acquisition Plan","description":"How the MC plans to claim the hero''s destined treasures, artifacts, mentors, and power-up locations before they can be reached — the logistics of preemptive advantage seizure","x-uiWidget":"textarea","useForAI":true},"Butterfly Effect Management":{"type":"string","title":"Butterfly Effect Management","description":"How the MC handles plot deviations caused by their interference — when the hero does something not in the original script, when allies behave unexpectedly, when the story refuses to follow the known path","x-uiWidget":"textarea","useForAI":true,"isDynamic":true}}}',
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
  'Narrative style and tone — how the MC''s meta-awareness is expressed in prose, and the overall atmosphere of the hunt',
  '{"type":"object","required":["Narrative Perspective","Tone","Meta-Awareness Style"],"properties":{"Narrative Perspective":{"type":"string","title":"Narrative Perspective","enum":["First Person — deep inside the hunter''s calculating mind","Third Person Limited — close to the hunter, dramatic irony for readers","Third Person Omniscient"],"x-uiWidget":"select","useForAI":true},"Tone":{"type":"string","title":"Tone","enum":["Cold and Calculating — every action is a chess move","Darkly Humorous — the irony of hunting the ''hero''","Tense and Paranoid — the script might break at any moment","Methodical and Clinical — treating the hunt as a project to manage","Bitter Pragmatism — survival first, everything else second"],"x-uiWidget":"select","useForAI":true},"Meta-Awareness Style":{"type":"string","title":"Meta-Awareness Style","enum":["Frequent — MC openly references original story events and chapter numbers to themselves","Subtle — foreknowledge shown through impossibly perfect timing and preparation","Minimal — foreknowledge visible only through outcomes, never stated"],"x-uiWidget":"select","useForAI":true},"Style Notes":{"type":"string","title":"Style Notes","description":"Additional notes on prose style, chapter pacing, and narrative voice","x-uiWidget":"textarea","useForAI":true}}}',
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
  'Characters in the story — including the hunter, the hero target, allies, pawns, and wild cards who weren''t in the original script',
  '{"type":"object","required":["Name","Role"],"properties":{"Name":{"type":"string","title":"Name","x-titleField":true,"useForAI":true},"Role":{"type":"string","title":"Role","enum":["The Hunter (Protagonist)","The Hero (Primary Target)","Hero''s Party Member","The Hunter''s Ally","Unwitting Pawn","Wild Card (Not in Original Story)","Background Character"],"x-uiWidget":"select","useForAI":true},"Original Story Role":{"type":"string","title":"Original Story Role","description":"This character''s role in the original story — ally to the hero, enemy defeated along the way, background figure, or someone entirely new","x-uiWidget":"textarea","useForAI":true},"Current Status":{"type":"string","title":"Current Status","enum":["Active","Neutralized","Eliminated","Converted to Ally","Suspicious of the MC","Unknown"],"x-uiWidget":"select","useForAI":true,"isDynamic":true},"Hunter''s Assessment":{"type":"string","title":"Hunter''s Assessment","description":"How the MC evaluates this character based on meta-knowledge and current observations — threat level, potential usefulness, reliability, deviation from original script","x-uiWidget":"textarea","useForAI":true,"isDynamic":true},"Abilities":{"type":"string","title":"Abilities","x-uiWidget":"textarea","useForAI":true},"Background":{"type":"string","title":"Background","x-uiWidget":"textarea","useForAI":true}}}',
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

-- 2.7 Faction (organization, non-singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '阵营',
  'Faction',
  'Organizations and power structures — the forces the hunter must navigate, control, or dismantle',
  '{"type":"object","required":["Name","Faction Type"],"properties":{"Name":{"type":"string","title":"Name","x-titleField":true,"useForAI":true},"Faction Type":{"type":"string","title":"Faction Type","enum":["The Hero''s Kingdom or Organization","The Hunter''s Power Base","Neutral Third Party","Ancient Power (Not in Original Story''s Focus)","The Original Villain''s Faction","Religious or Prophetic Institution"],"x-uiWidget":"select","useForAI":true},"Original Story Role":{"type":"string","title":"Original Story Role","description":"This faction''s role in the original plot — who they backed, what they represented, how they interacted with the hero''s journey","x-uiWidget":"textarea","useForAI":true},"Current Relationship to Hunter":{"type":"string","title":"Current Relationship to Hunter","enum":["Under Hunter''s Control","Ally","Neutral","Enemy","Infiltrated by Hunter","Unaware of Hunter''s True Agenda"],"x-uiWidget":"select","useForAI":true,"isDynamic":true},"Key Resources":{"type":"string","title":"Key Resources","description":"What this faction provides — military strength, economic power, magical resources, intelligence networks, or access to plot-critical locations","x-uiWidget":"textarea","useForAI":true},"Description":{"type":"string","title":"Description","x-uiWidget":"textarea","useForAI":true}}}',
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

-- 2.8 Scene (scene, non-singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '场景',
  'Scene',
  'Key locations — especially the hero''s destined power-up sites that the hunter must claim, secure, or deny',
  '{"type":"object","required":["Name","Location Type"],"properties":{"Name":{"type":"string","title":"Name","x-titleField":true,"useForAI":true},"Location Type":{"type":"string","title":"Location Type","enum":["Sacred Site — Hero''s Destined Power-Up Location","The Hunter''s Base or Stronghold","Contested Resource Site","The Hero''s Origin Location","Hidden Location (Not in Original Story)","Neutral Territory","Alliance Hub or Meeting Ground"],"x-uiWidget":"select","useForAI":true},"Original Story Significance":{"type":"string","title":"Original Story Significance","description":"Why this location matters in the original plot — what events were supposed to happen here, what the hero was supposed to gain","x-uiWidget":"textarea","useForAI":true},"Current Status":{"type":"string","title":"Current Status","enum":["Under Hunter''s Control","Secured — Hero Cannot Access","Contested","Hero Controlled","Neutral or Unknown"],"x-uiWidget":"select","useForAI":true,"isDynamic":true},"Strategic Value":{"type":"string","title":"Strategic Value","description":"Why the MC targets this location — resources to claim, mentors to intercept, power-ups to deny, or defensive advantages to secure","x-uiWidget":"textarea","useForAI":true},"Description":{"type":"string","title":"Description","x-uiWidget":"textarea","useForAI":true}}}',
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

-- ============================================================
-- 3. Verify
-- ============================================================
SELECT id, name_en, novel_type_en, language FROM novel_creation_method WHERE name_en = 'The Protagonist Hunter';
SELECT COUNT(*) AS module_count FROM module_type WHERE novel_creation_method_id = @method_id;
SELECT name_en, entity_category, singleton FROM module_type WHERE novel_creation_method_id = @method_id ORDER BY singleton DESC, entity_category;
