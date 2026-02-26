-- The Eldritch Horror Novel - Eldritch & Cosmic Horror Creation Method
-- Language: English (en)
-- Includes: creation method + 8 module types
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/init_eldritch_horror.sql

-- ============================================================
-- 1. Create the creation method
-- ============================================================

INSERT INTO novel_creation_method (name, description, novel_type, language, visible_categories, is_preset, user_id, status, created_at)
VALUES (
  'The Eldritch Horror Novel',
  'For creating Lovecraftian and cosmic horror fiction. The protagonist teeters on the edge of madness, gaining power through contact with forbidden knowledge. The world is on the verge of collapse, and the gods are not merciful — they are incomprehensible terrors beyond human sight. Core appeal: the suffocating atmosphere of dread, and watching a protagonist use frail human intelligence to survive against forces of absolute, indifferent power. Tags: Lovecraftian, Sanity Loss, Horror.',
  'Horror',
  'en',
  '["setting","character","organization","scene"]',
  1,
  NULL,
  'published',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  novel_type = VALUES(novel_type),
  visible_categories = VALUES(visible_categories),
  updated_at = NOW();

SET @method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Eldritch Horror Novel' LIMIT 1);

-- ============================================================
-- 2. Create module types (8 total)
-- ============================================================

-- 2.1 Story Hook (setting, singleton)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Story Hook',
  'The inciting horror that shatters the protagonist''s understanding of reality and draws them into the cosmic abyss',
  '{"type":"object","required":["Story Hook"],"properties":{"Story Hook":{"type":"string","title":"Story Hook","description":"One sentence capturing the most chilling aspect of the story — what incomprehensible event or discovery sets everything in motion","x-uiWidget":"textarea","useForAI":true},"Core Dread":{"type":"string","title":"Core Dread","description":"The specific flavor of cosmic dread that defines this story — what truth about the universe will the protagonist uncover","x-uiWidget":"textarea","useForAI":true},"Opening Event":{"type":"string","title":"Opening Event","description":"The event that cracks the protagonist''s ordinary world — a discovery, an encounter, an inheritance, a vision","x-uiWidget":"textarea","useForAI":true},"Reader Promise":{"type":"string","title":"Reader Promise","description":"What readers are promised — the descent into madness, the forbidden revelation, survival against impossible odds","x-uiWidget":"textarea","useForAI":true}}}',
  1.2,
  @method_id,
  1,
  1,
  0,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  json_schema = VALUES(json_schema),
  temperature = VALUES(temperature),
  updated_at = NOW();

-- 2.2 Cosmic Entities (setting, singleton)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Cosmic Entities',
  'The eldritch beings and incomprehensible gods that define the horror — their nature, their indifference, and the catastrophe of knowing they exist',
  '{"type":"object","required":["Primary Entity","Entity Type"],"properties":{"Primary Entity":{"type":"string","title":"Primary Entity","description":"Name or designation of the primary cosmic entity — can be unknowable, unnamed, or referenced only by cult titles","x-uiWidget":"textarea","useForAI":true},"Entity Type":{"type":"string","title":"Entity Type","enum":["Ancient One (sleeping, dreaming)","Outer God (active, cosmic scale)","Great Old One (localized, imprisoned)","Avatar/Fragment (manifestation of a greater being)","Eldritch Abomination (ungroupable, simply wrong)","The Void Itself (formless, conceptual)"],"x-uiWidget":"select","useForAI":true},"True Nature":{"type":"string","title":"True Nature","description":"What this entity actually is — its origin, its nature, what it wants (if it wants anything at all)","x-uiWidget":"textarea","useForAI":true},"Manifestation":{"type":"string","title":"Manifestation","description":"How the entity appears or is perceived — partial glimpses, proxy forms, sensory distortions, or incomprehensible geometry","x-uiWidget":"textarea","useForAI":true},"Scope of Influence":{"type":"string","title":"Scope of Influence","enum":["Planetary","Dimensional","Cosmic — beyond space-time","Localized but Absolutely Dominant"],"x-uiWidget":"radio","useForAI":true},"Relationship to Protagonist":{"type":"string","title":"Relationship to Protagonist","enum":["Sleeping — Unaware of Protagonist","Aware — Utterly Indifferent","Dimly Interested — The Protagonist is an Anomaly","Actively Hunting — The Protagonist Knows Too Much","Calling — Drawing the Protagonist Toward It"],"x-uiWidget":"select","useForAI":true},"Associated Cults":{"type":"string","title":"Associated Cults","description":"Human organizations that worship, serve, or attempt to harness this entity","x-uiWidget":"textarea","useForAI":true}}}',
  1.0,
  @method_id,
  1,
  1,
  0,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  json_schema = VALUES(json_schema),
  temperature = VALUES(temperature),
  updated_at = NOW();

-- 2.3 Forbidden Knowledge System (setting, singleton)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Forbidden Knowledge',
  'The sanity-power system — how forbidden knowledge grants abilities while eroding the protagonist''s humanity and grip on reality',
  '{"type":"object","required":["Knowledge Source","Sanity System"],"properties":{"Knowledge Source":{"type":"string","title":"Knowledge Source","enum":["Ancient Tomes (Necronomicon-style)","Direct Revelation from Entity","Ancestral Memory/Bloodline","Dreamscape Transmission","Ritual Experimentation","Accidental Contact with the Unreal","Archaeological Discovery"],"x-uiWidget":"select","useForAI":true},"Knowledge Type":{"type":"string","title":"Knowledge Type","description":"What kind of forbidden knowledge the protagonist accumulates — cosmic truths, reality-bending techniques, entity-communication methods","x-uiWidget":"textarea","useForAI":true},"Power Gained":{"type":"string","title":"Power Gained","description":"What abilities or advantages forbidden knowledge confers — perception beyond normal senses, reality manipulation, entity communication, protection from lesser horrors","x-uiWidget":"textarea","useForAI":true},"Sanity System":{"type":"string","title":"Sanity System","enum":["Numerical Sanity Points (CoC-style)","Descriptive Stages (Unnerved → Fractured → Broken → Lost)","Dual Reality — The More You Know, the Less Human You Feel","Corruption Track — Physical and Mental Distortion","Madness as Power — Sanity Loss Unlocks Abilities"],"x-uiWidget":"select","useForAI":true},"Sanity Costs":{"type":"string","title":"Sanity Costs","description":"What each piece of forbidden knowledge costs in sanity, relationships, or humanity","x-uiWidget":"textarea","useForAI":true},"Point of No Return":{"type":"string","title":"Point of No Return","description":"The threshold beyond which the protagonist is no longer fully human — what changes, what is lost, what is gained","x-uiWidget":"textarea","useForAI":true}}}',
  0.9,
  @method_id,
  1,
  1,
  0,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  json_schema = VALUES(json_schema),
  temperature = VALUES(temperature),
  updated_at = NOW();

-- 2.4 Writing Style (setting, singleton)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Writing Style',
  'The narrative voice and atmospheric approach — how dread is built on the page in the tradition of cosmic horror',
  '{"type":"object","required":["Narrative POV","Horror Mode"],"properties":{"Narrative POV":{"type":"string","title":"Narrative POV","enum":["First Person — Unreliable Narrator (Classic Lovecraft)","Third Person Limited — Close but Distanced","Frame Narrative — Recovered Documents/Letters","Multiple POV — Witnesses to Different Aspects","Epistolary — Journals, Reports, Testimonies"],"x-uiWidget":"radio","useForAI":true},"Prose Style":{"type":"string","title":"Prose Style","enum":["Dense and Literary — Archaic, Overwrought, Oppressive","Pulp Visceral — Punchy, Immediate, Gruesome","Clinical Horror — Cold, Scientific, Detached","Atmospheric and Poetic — Sensory, Immersive, Dreamlike","Stream of Dread — Fragmented, Dissociative, Fracturing"],"x-uiWidget":"radio","useForAI":true},"Horror Mode":{"type":"string","title":"Horror Mode","enum":["Cosmic Indifference — The Universe Doesn''t Care You Exist","Psychological — What You Know Destroys You","Body Horror — The Flesh Betrays, Changes, Becomes Wrong","Reality Dissolution — Nothing Can Be Trusted","Slow Revelation — The Truth Is Worse Than You Imagined"],"x-uiWidget":"select","useForAI":true},"Pacing":{"type":"string","title":"Pacing","enum":["Slow Burn — Dread Accumulates Over Hundreds of Pages","Escalating Revelation — Each Discovery Worse Than the Last","Sudden Abyss — Normal Life Then the Fall Is Instant","Episodic Descent — Each Chapter Strips Away Another Layer"],"x-uiWidget":"radio","useForAI":true},"Banned Words":{"type":"string","title":"Banned Words","description":"Words or tones to avoid — anything that undercuts the horror (forced humor, cute descriptions, convenient victories)","x-uiWidget":"textarea","useForAI":true}}}',
  0.7,
  @method_id,
  1,
  1,
  0,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  json_schema = VALUES(json_schema),
  temperature = VALUES(temperature),
  updated_at = NOW();

-- 2.5 Worldbuilding (setting, singleton)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Worldbuilding',
  'The world on the verge of cosmic revelation — where the thin membrane between ordinary reality and incomprehensible horror is fraying',
  '{"type":"object","required":["Setting Era","World Status"],"properties":{"Setting Era":{"type":"string","title":"Setting Era","enum":["Victorian Gothic (1840-1900)","Pulp Era (1920s-1940s)","Cold War Paranoia (1950s-1970s)","Contemporary Horror","Post-Apocalyptic Aftermath","Far Future — When the Stars Are Right","Timeless/Mythic"],"x-uiWidget":"select","useForAI":true},"World Status":{"type":"string","title":"World Status","enum":["Cosmic Ignorance — Humanity Unaware, The Veil Intact","Awakening — The Veil is Thinning, Incidents Increasing","On the Brink — A Catalyst Event Is Imminent","Mid-Revelation — Society Is Fracturing as Truth Emerges","Post-Contact — Humanity Knows and Is Losing"],"x-uiWidget":"select","useForAI":true},"World Details":{"type":"string","title":"World Details","description":"What makes this world''s relationship with cosmic horror unique — geography, history, or specific conditions that attract or enable eldritch events","x-uiWidget":"textarea","useForAI":true},"Power Structure":{"type":"string","title":"Power Structure","description":"Who knows the truth and how they use it — secret institutions, corrupt governments, hidden bloodlines, or underground cults","x-uiWidget":"textarea","useForAI":true},"Mythos Elements":{"type":"string","title":"Mythos Elements","description":"Which cosmic horror elements exist in this world — specific entities, tomes, locations, rituals, or dimensional anomalies","x-uiWidget":"textarea","useForAI":true},"Key Locations":{"type":"string","title":"Key Locations","description":"Places where the veil is thinnest — coastal towns, abandoned estates, underground temples, dimensional rifts","x-uiWidget":"textarea","useForAI":true}}}',
  1.0,
  @method_id,
  1,
  1,
  0,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  json_schema = VALUES(json_schema),
  temperature = VALUES(temperature),
  updated_at = NOW();

-- 2.6 Character (character, non-singleton)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Character',
  'The investigators, cultists, survivors, and afflicted who inhabit the world on the edge of cosmic revelation',
  '{"type":"object","x-titleField":"Name","required":["Name","Role"],"properties":{"Name":{"type":"string","title":"Name","description":"Character''s name — no parenthetical notes","useForAI":true},"Role":{"type":"string","title":"Role","enum":["Investigator/Protagonist","Reluctant Believer","Cultist — True Believer","Cultist — Coerced","Academic/Archivist","Entity Vessel/Touched","Ordinary Victim","Keeper of Secrets","Antagonist — Human","Antagonist — Transformed"],"x-uiWidget":"select","useForAI":true},"Background":{"type":"string","title":"Background","description":"What kind of person they were before contact with the cosmic — their profession, beliefs, and vulnerabilities","x-uiWidget":"textarea","useForAI":true},"Knowledge Level":{"type":"string","title":"Knowledge Level","enum":["Ignorant — Completely Unaware","Suspicious — Something is Wrong","Partially Informed — Knows Fragments","Deep Initiate — Has Witnessed Truth","Touched — Reality No Longer Applies to Them"],"x-uiWidget":"select","useForAI":true},"Current Sanity":{"type":"string","title":"Current Sanity","description":"Their current mental state and what they have endured","x-uiWidget":"textarea","useForAI":true},"Sanity Trigger":{"type":"string","title":"Sanity Trigger","description":"What specific knowledge or encounter would push them toward complete breakdown","x-uiWidget":"textarea","useForAI":true},"Core Motivation":{"type":"string","title":"Core Motivation","description":"What drives them — understanding, survival, revenge, devotion, or something they can no longer fully articulate","x-uiWidget":"textarea","useForAI":true},"Connection to Entity":{"type":"string","title":"Connection to Entity","description":"Their specific relationship to the cosmic forces — chosen, hunted, bloodline, accidental witness, or seeker","x-uiWidget":"textarea","useForAI":true},"Current Status":{"type":"string","title":"Current Status","description":"Their current situation in the story","isDynamic":true},"Current Mental State":{"type":"string","title":"Current Mental State","description":"Their current sanity state and psychological condition","isDynamic":true}}}',
  1.0,
  @method_id,
  1,
  0,
  0,
  'character',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  json_schema = VALUES(json_schema),
  temperature = VALUES(temperature),
  updated_at = NOW();

-- 2.7 Cult (organization, non-singleton)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Cult',
  'Secret societies, religious orders, and cults that worship, serve, or attempt to harness the cosmic entities',
  '{"type":"object","x-titleField":"Cult Name","required":["Cult Name","Entity Worshipped"],"properties":{"Cult Name":{"type":"string","title":"Cult Name","useForAI":true},"Entity Worshipped":{"type":"string","title":"Entity Worshipped","description":"Which cosmic entity or force this cult serves","useForAI":true},"Founding and History":{"type":"string","title":"Founding and History","description":"How this cult began, how long it has existed, and what it has done","x-uiWidget":"textarea","useForAI":true},"True Goals":{"type":"string","title":"True Goals","enum":["Awaken the Entity","Merge with the Entity","Gain Power by Serving the Entity","Prevent a Greater Catastrophe (Misguided)","Simply Survive What Is Coming","Use the Entity as a Weapon","Understand — Knowledge Above All"],"x-uiWidget":"select","useForAI":true},"Methods":{"type":"string","title":"Methods","description":"How the cult operates — rituals, sacrifices, infiltration, academic facades, or open terror","x-uiWidget":"textarea","useForAI":true},"Scale and Reach":{"type":"string","title":"Scale and Reach","enum":["Small Cell — Dozens, Local","Regional Network — Hundreds, Connected","National Organization — Thousands, Institutional Infiltration","Global Conspiracy — Ancient, Everywhere","Something More — Members Are No Longer Fully Human"],"x-uiWidget":"select","useForAI":true},"Internal Corruption":{"type":"string","title":"Internal Corruption","description":"The fractures within the cult — members who doubt, power struggles, those who have seen too much","x-uiWidget":"textarea","useForAI":true},"Relationship to Protagonist":{"type":"string","title":"Relationship to Protagonist","enum":["Hunting the Protagonist","Trying to Recruit the Protagonist","Ignorant of the Protagonist","The Protagonist Is a Former Member","The Protagonist''s Family Is Involved"],"x-uiWidget":"select","useForAI":true},"Current Influence":{"type":"string","title":"Current Influence","description":"Their current power and operational status","isDynamic":true},"Internal Stability":{"type":"string","title":"Internal Stability","description":"Internal conflicts, defections, or moments of doubt","isDynamic":true}}}',
  1.0,
  @method_id,
  1,
  0,
  0,
  'organization',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  json_schema = VALUES(json_schema),
  temperature = VALUES(temperature),
  updated_at = NOW();

-- 2.8 Location (scene, non-singleton)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Location',
  'Places where the veil between ordinary reality and cosmic horror has worn thin — haunted, transformed, or fundamentally wrong',
  '{"type":"object","x-titleField":"Location Name","required":["Location Name","Location Type"],"properties":{"Location Name":{"type":"string","title":"Location Name","useForAI":true},"Location Type":{"type":"string","title":"Location Type","enum":["Coastal Town — Something Beneath the Waves","Abandoned Estate — Secrets in the Walls","Underground Temple — Hidden and Ancient","Dimensional Rift — Where Reality Tears","Academic Institution — Knowledge That Should Not Be","Isolated Settlement — Cut Off and Changed","Ruins — Of Something That Was Never Human","Urban Anomaly — A Building, Block, or Room That Is Wrong"],"x-uiWidget":"select","useForAI":true},"Atmosphere":{"type":"string","title":"Atmosphere","description":"The sensory experience of this place — what you see, hear, smell, and feel in ways that should not be possible","x-uiWidget":"textarea","useForAI":true},"History of Horror":{"type":"string","title":"History of Horror","description":"What has happened here — disappearances, madness, transformations, or events that were never fully explained","x-uiWidget":"textarea","useForAI":true},"Active Dangers":{"type":"string","title":"Active Dangers","description":"What currently threatens those who enter — entities, cultists, environmental wrongness, or the location itself","x-uiWidget":"textarea","useForAI":true},"Forbidden Knowledge":{"type":"string","title":"Forbidden Knowledge","description":"What truth about the cosmos can be learned here — and at what cost to the one who learns it","x-uiWidget":"textarea","useForAI":true},"Controlling Entity or Cult":{"type":"string","title":"Controlling Entity or Cult","description":"What entity or human organization claims or haunts this location","isDynamic":true},"Current State":{"type":"string","title":"Current State","description":"Current condition: dormant, active, escalating, sealed, or beyond recovery","isDynamic":true}}}',
  1.0,
  @method_id,
  1,
  0,
  0,
  'scene',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  json_schema = VALUES(json_schema),
  temperature = VALUES(temperature),
  updated_at = NOW();
