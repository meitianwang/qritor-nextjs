-- The Vengeance Soul Novel - Revenge-Driven Fiction Creation Method
-- Language: English (en)
-- Includes: creation method + 8 module types
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/init_vengeance_driven.sql

-- ============================================================
-- 1. Create the creation method
-- ============================================================

INSERT INTO novel_creation_method (name_zh, name_en, description_en, novel_type_zh, novel_type_en, language, visible_categories, created_at)
VALUES (
  '复仇驱动小说',
  'The Vengeance Soul Novel',
  'For creating revenge-driven fiction featuring psychologically broken protagonists. The protagonist''s entire existence is consumed by one purpose: vengeance. Twisted by trauma and betrayal, they pursue their enemies with merciless obsession — employing any means, paying any cost. Core appeal: the explosive catharsis of watching someone who has lost everything burn the world down to get it back. Tags: Revenge, Torture, Trauma.',
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

SET @method_id = (SELECT id FROM novel_creation_method WHERE name_en = 'The Vengeance Soul Novel' LIMIT 1);

-- ============================================================
-- 2. Create module types (8 total)
-- ============================================================

-- 2.1 Story Hook (setting, singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '故事钩子',
  'Story Hook',
  'The burning injustice at the heart of the revenge story — the single wound that drives everything',
  '{"type":"object","required":["Story Hook"],"properties":{"Story Hook":{"type":"string","title":"Story Hook","description":"One sentence capturing the protagonist''s burning injustice — the unforgivable act that readers must see punished","x-uiWidget":"textarea","useForAI":true},"The Wound":{"type":"string","title":"The Wound","description":"The specific act of betrayal or torture that ignites everything — vivid, concrete, unforgettable","x-uiWidget":"textarea","useForAI":true},"Revenge Promise":{"type":"string","title":"Revenge Promise","description":"The oath the protagonist swears — their reason for surviving when death would have been easier","x-uiWidget":"textarea","useForAI":true},"Reader Bait":{"type":"string","title":"Reader Bait","description":"The specific promise of catharsis you make to readers — what satisfying vengeance they are waiting to witness","x-uiWidget":"textarea","useForAI":true}}}',
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

-- 2.2 Origin of Vengeance (setting, singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '复仇起源',
  'Origin of Vengeance',
  'The catastrophic event that shattered the protagonist''s former life and forged their singular, consuming purpose',
  '{"type":"object","required":["Incident Type","The Perpetrators"],"properties":{"Incident Type":{"type":"string","title":"Incident Type","enum":["Family Slaughtered","Lover Betrayed and Killed","Falsely Accused and Imprisoned","Mentor''s Betrayal","Tortured and Left for Dead","Everything Stripped Away — Wealth, Status, Name","Witnessed Atrocity, Powerless to Stop It","Other"],"x-uiWidget":"select","useForAI":true},"The Perpetrators":{"type":"string","title":"The Perpetrators","description":"Who inflicted the trauma — names, roles, and their relationship to the protagonist before the incident","x-uiWidget":"textarea","useForAI":true},"The Darkest Moment":{"type":"string","title":"The Darkest Moment","description":"The single image or moment of absolute breaking — the detail readers will never forget","x-uiWidget":"textarea","useForAI":true},"What Was Taken":{"type":"string","title":"What Was Taken","description":"Everything the protagonist lost — family, love, identity, dignity, future, innocence","x-uiWidget":"textarea","useForAI":true},"What Survived":{"type":"string","title":"What Survived","description":"The remnant that keeps the protagonist from dying — pure hatred, a single name on a list, a final memory","x-uiWidget":"textarea","useForAI":true},"The Oath":{"type":"string","title":"The Oath","description":"The exact vow or ritual of revenge — the moment they sealed their fate and surrendered their old self","x-uiWidget":"textarea","useForAI":true}}}',
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

-- 2.3 Psychological Fracture (setting, singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '心理裂痕',
  'Psychological Fracture',
  'How the trauma warped the protagonist — the broken psychology that makes them capable of anything',
  '{"type":"object","required":["Obsession Profile"],"properties":{"Pre-Trauma Self":{"type":"string","title":"Pre-Trauma Self","description":"Who the protagonist was before — their innocence, their relationships, their dreams — to illuminate how far they have fallen","x-uiWidget":"textarea","useForAI":true},"Breaking Mechanism":{"type":"string","title":"Breaking Mechanism","description":"How the torture or betrayal actually broke them — the specific psychological process of their unraveling","x-uiWidget":"textarea","useForAI":true},"Obsession Profile":{"type":"string","title":"Obsession Profile","enum":["Ice-Cold Patience — Waits Years, Plans in Silence","Burning Fever — Can Think of Nothing Else","Dual Existence — Functions Normally Until Triggered","Dissociation — Watches Themselves Become a Monster","Righteous Fury — Believes They ARE Justice Itself","Hollow Shell — Emotion Replaced by Pure Function"],"x-uiWidget":"select","useForAI":true},"Remaining Humanity":{"type":"string","title":"Remaining Humanity","description":"The small broken pieces of their former self that have not been destroyed yet — the last embers of who they were","x-uiWidget":"textarea","useForAI":true},"Trauma Triggers":{"type":"string","title":"Trauma Triggers","description":"What shatters their control — the sights, smells, sounds that drag them back to the moment everything ended","x-uiWidget":"textarea","useForAI":true},"Dark Satisfaction":{"type":"string","title":"Dark Satisfaction","description":"What vengeance actually feels like to them — the specific quality of the morbid pleasure they anticipate","x-uiWidget":"textarea","useForAI":true},"Cost of Obsession":{"type":"string","title":"Cost of Obsession","description":"What the protagonist sacrifices daily to keep the revenge fire burning — sleep, relationships, health, morality","x-uiWidget":"textarea","useForAI":true}}}',
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

-- 2.4 Vengeance Architecture (setting, singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '复仇架构',
  'Vengeance Architecture',
  'The structure and scale of the revenge plan — from the first domino to the final reckoning',
  '{"type":"object","required":["Primary Targets","Revenge Scale"],"properties":{"Primary Targets":{"type":"string","title":"Primary Targets","description":"The ultimate objects of revenge — who must be destroyed, and what their destruction means to the protagonist","x-uiWidget":"textarea","useForAI":true},"Revenge Scale":{"type":"string","title":"Revenge Scale","enum":["Personal — One Face in the Crowd","Organizational — Tear Down an Institution","Systemic — Burn an Entire Social Order","Dynastic — Erase a Bloodline","Cosmic — Even the Gods Will Answer"],"x-uiWidget":"radio","useForAI":true},"Kill Order":{"type":"string","title":"Kill Order","description":"The sequence of revenge — who suffers first and why, how each victory sets up the next","x-uiWidget":"textarea","useForAI":true},"Methods Preferred":{"type":"string","title":"Methods Preferred","enum":["Psychological Destruction — Break the Mind Before the Body","Physical Elimination — Direct and Brutal","Social Ruin — Strip Away Everything They Value","Orchestrated Betrayal — Use Their Own People Against Them","Public Humiliation Then Death","Slow Suffering — They Will Beg for the End"],"x-uiWidget":"select","useForAI":true},"Acceptable Collateral":{"type":"string","title":"Acceptable Collateral","description":"What innocents or former allies are acceptable losses — the protagonist''s moral floor, if any remains","x-uiWidget":"textarea","useForAI":true},"The Final Vision":{"type":"string","title":"The Final Vision","description":"What ''finished'' looks like in the protagonist''s imagination — the exact fantasy of completion that sustains them through everything","x-uiWidget":"textarea","useForAI":true},"After the Reckoning":{"type":"string","title":"After the Reckoning","description":"Has the protagonist thought beyond the last kill? The void waiting on the other side of victory","x-uiWidget":"textarea","useForAI":true}}}',
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
  'The narrative voice and prose style — how the rage, grief, and dark satisfaction are rendered on the page',
  '{"type":"object","required":["Narrative POV","Emotional Register"],"properties":{"Narrative POV":{"type":"string","title":"Narrative POV","enum":["First Person — Inside the Obsession","Third Person Limited — Close But One Step Removed","Third Person Omniscient","Unreliable Narrator — They Have Convinced Themselves They Are Right"],"x-uiWidget":"radio","useForAI":true},"Emotional Register":{"type":"string","title":"Emotional Register","enum":["Cold Fury — Ice Over Fire","Barely Contained Explosion","Detached Clinical Observation","Grief Twisted Into Something Terrible","Savage and Exultant"],"x-uiWidget":"radio","useForAI":true},"Prose Style":{"type":"string","title":"Prose Style","enum":["Lean and Surgical — Every Word Cuts","Visceral and Immersive — Pain Made Physical","Lyrical Despite the Darkness","Stream of Consciousness — The Obsession Is the Narration"],"x-uiWidget":"radio","useForAI":true},"Pacing":{"type":"string","title":"Pacing","enum":["Relentless — The Hunt Never Pauses","Calculated Build — Long Patience, Explosive Release","Slow Burn — Years Pass Between Strikes","Episodic — Each Target a Complete Arc"],"x-uiWidget":"radio","useForAI":true},"Violence and Torture Threshold":{"type":"string","title":"Violence and Torture Threshold","enum":["Unflinching — Every Detail On-Page","Purposeful — Violence Serves the Emotional Beat","Strategic — Implication Over Depiction","Stylized — The Beauty of the Terrible"],"x-uiWidget":"radio","useForAI":true},"Banned Words":{"type":"string","title":"Banned Words","description":"Words or expressions to avoid in the writing","x-uiWidget":"textarea","useForAI":true}}}',
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
  'The people orbiting the protagonist''s singular obsession — targets, tools, witnesses, and the ghosts of who they used to be',
  '{"type":"object","x-titleField":"Name","required":["Name","Role"],"properties":{"Name":{"type":"string","title":"Name","description":"Character''s name — no parenthetical notes","useForAI":true},"Role":{"type":"string","title":"Role","enum":["The Protagonist","Primary Target","Accomplice in the Betrayal","Reluctant Ally","Collateral Victim","Mirror Character","Ghost of the Past","Unexpected Obstacle","Someone Worth Protecting"],"x-uiWidget":"radio","useForAI":true},"Gender":{"type":"string","title":"Gender","enum":["Male","Female","Non-binary","Other"],"x-uiWidget":"radio","useForAI":true},"Age":{"type":"string","title":"Age","description":"Character''s age or age range","useForAI":true},"Connection to the Incident":{"type":"string","title":"Connection to the Incident","description":"Their role in the original betrayal or torture — perpetrator, witness, victim, or none","x-uiWidget":"textarea","useForAI":true},"Core Motivation":{"type":"string","title":"Core Motivation","description":"What drives this character — their deepest want, which may directly conflict with the protagonist","x-uiWidget":"textarea","useForAI":true},"Guilt and Complicity":{"type":"string","title":"Guilt and Complicity","description":"How responsible are they for what happened? The moral weight they carry — or deny","x-uiWidget":"textarea","useForAI":true},"Strengths":{"type":"string","title":"Strengths","description":"Combat ability, political power, information, or other advantages","x-uiWidget":"textarea","useForAI":true},"Exploitable Weaknesses":{"type":"string","title":"Exploitable Weaknesses","description":"Hidden vulnerabilities the protagonist might use — or that might complicate the revenge","x-uiWidget":"textarea","useForAI":true},"Current Status":{"type":"string","title":"Current Status","description":"Their current situation in the story","isDynamic":true},"Fate":{"type":"string","title":"Fate","description":"Their anticipated or actual fate — alive, broken, dead, or something worse","isDynamic":true}}}',
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

-- 2.7 Enemy Faction (organization, non-singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '敌对阵营',
  'Enemy Faction',
  'Power groups and networks behind the protagonist''s original betrayal — institutions to be dismantled, bloodlines to be ended',
  '{"type":"object","x-titleField":"Faction Name","required":["Faction Name","Role in the Betrayal"],"properties":{"Faction Name":{"type":"string","title":"Faction Name","useForAI":true},"Faction Type":{"type":"string","title":"Faction Type","enum":["Noble House","Criminal Syndicate","Religious Institution","Military Order","Merchant Empire","Political Clique","Secret Society","Government Body"],"x-uiWidget":"select","useForAI":true},"Role in the Betrayal":{"type":"string","title":"Role in the Betrayal","description":"How this faction was involved in the original incident — orchestrator, participant, beneficiary, or silent enabler","x-uiWidget":"textarea","useForAI":true},"Public Face vs. True Nature":{"type":"string","title":"Public Face vs. True Nature","description":"What they present to the world versus what they truly are — the hypocrisy the protagonist will expose","x-uiWidget":"textarea","useForAI":true},"Power Base":{"type":"string","title":"Power Base","description":"What sustains their power — wealth, violence, blackmail, political connections, or supernatural backing","x-uiWidget":"textarea","useForAI":true},"Key Figures":{"type":"string","title":"Key Figures","description":"The leaders and power players — who holds the real authority and who is expendable","x-uiWidget":"textarea","useForAI":true},"Internal Fractures":{"type":"string","title":"Internal Fractures","description":"The cracks within — internal rivalries, guilty consciences, or members who know too much","x-uiWidget":"textarea","useForAI":true},"Current Threat Level":{"type":"string","title":"Current Threat Level","description":"Their present military, political, and social power","isDynamic":true},"Awareness of the Protagonist":{"type":"string","title":"Awareness of the Protagonist","description":"Do they know the protagonist is coming? How much do they fear what''s hunting them?","isDynamic":true}}}',
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
  'Key locations where the long arc of vengeance unfolds — stages for suffering, plotting, and reckoning',
  '{"type":"object","x-titleField":"Location Name","required":["Location Name","Scene Type"],"properties":{"Location Name":{"type":"string","title":"Location Name","useForAI":true},"Scene Type":{"type":"string","title":"Scene Type","enum":["The Place It Happened — Where Everything Was Destroyed","Sanctuary of Obsession — Where the Protagonist Plans","The Enemy''s Domain — Their Palace or Stronghold","The Hunting Ground","Prison or Place of Former Captivity","Public Stage — Where the Reckoning Will Be Witnessed","Ruins of the Former Life","The Final Confrontation Site"],"x-uiWidget":"select","useForAI":true},"Atmosphere":{"type":"string","title":"Atmosphere","description":"The mood, sensory texture, and emotional weight of this place — what it means to the protagonist","x-uiWidget":"textarea","useForAI":true},"Memory Embedded Here":{"type":"string","title":"Memory Embedded Here","description":"What happened at this location that the protagonist cannot forget — the ghost that haunts the physical space","x-uiWidget":"textarea","useForAI":true},"Strategic Significance":{"type":"string","title":"Strategic Significance","description":"Why this location matters for the revenge plan — what it provides or what must happen here","x-uiWidget":"textarea","useForAI":true},"Dangers":{"type":"string","title":"Dangers","description":"Threats lurking in or around this location — enemies, traps, or the protagonist''s own memories","x-uiWidget":"textarea","useForAI":true},"Current Control":{"type":"string","title":"Current Control","description":"Who controls this location now","isDynamic":true},"Current State":{"type":"string","title":"Current State","description":"Present condition — intact, contested, destroyed, under surveillance, etc.","isDynamic":true}}}',
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
