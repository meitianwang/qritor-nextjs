-- The Villainous Lead - Villainous Lead Creation Method
-- Language: English (en)
-- Includes: creation method + 8 module types
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/init_villainous_lead.sql

-- ============================================================
-- 1. Create the creation method
-- ============================================================

INSERT INTO novel_creation_method (name, description, novel_type, language, visible_categories, is_preset, user_id, status, created_at)
VALUES (
  'The Villainous Lead',
  'For creating stories told from the villain protagonist''s perspective. The MC knows they are the "villain" and wears it proudly — their mission is to hunt and dismantle the "Chosen Hero" and the hero system that produces them. Core logic: exploit the rules, act before monologuing, and weaponize the hero''s heroic nature against them. Core appeal: watching moralistic heroes get outmaneuvered at every turn by a villain who simply plays a different, smarter game. Tags: Villainous, Manipulative, Anti-Hero.',
  'Dark Fantasy',
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

SET @method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Villainous Lead' LIMIT 1);

-- ============================================================
-- 2. Create module types (8 total)
-- ============================================================

-- 2.1 Story Hook (setting, singleton)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Story Hook',
  'The core hook that makes readers invested in THIS villain''s story — not despite the protagonist being a villain, but because of it',
  '{"type":"object","required":["Story Hook"],"properties":{"Story Hook":{"type":"string","title":"Story Hook","description":"One sentence capturing why this villain''s story is worth telling — what makes their particular brand of villainy compelling and their deconstruction of heroism irresistible","x-uiWidget":"textarea","useForAI":true},"Core Irony":{"type":"string","title":"Core Irony","description":"The central irony or subversion — how does this story invert traditional hero/villain dynamics? What truth does the villain''s perspective reveal that the hero''s perspective hides?","x-uiWidget":"textarea","useForAI":true},"Opening Gambit":{"type":"string","title":"Opening Gambit","description":"How the story opens — the villain''s first visible move, the moment the reader understands what kind of story this is, or the inciting event that sets the villain''s plan in motion","x-uiWidget":"textarea","useForAI":true},"Reader Promise":{"type":"string","title":"Reader Promise","description":"The core satisfaction this story delivers — watching heroes get outplayed, witnessing the deconstruction of moral heroism, or the specific flavor of satisfaction this villain''s victories provide","x-uiWidget":"textarea","useForAI":true}}}',
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

-- 2.2 Villain Identity (setting, singleton)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Villain Identity',
  'The villain protagonist''s core self-definition — their archetype, philosophy of evil, and what makes their villainy distinctively theirs',
  '{"type":"object","required":["Villain Archetype","Self-Awareness Level","Ultimate Goal"],"properties":{"Villain Archetype":{"type":"string","title":"Villain Archetype","enum":["The Schemer","The Tyrant","The Corruptor","The Rival","The Usurper","The Nihilist","The Revolutionary","The Predator","Other"],"x-uiWidget":"select","useForAI":true},"Archetype Details":{"type":"string","title":"Archetype Details","description":"What makes this villain''s version of the archetype unique — their specific flavor of menace and method","x-uiWidget":"textarea","useForAI":true},"Self-Awareness Level":{"type":"string","title":"Self-Awareness Level","enum":["Fully Embraces the Villain Label","Villain by Necessity — No Choice Left","Believes They Are Secretly the Hero","Transcends Labels Entirely"],"x-uiWidget":"radio","useForAI":true},"Villain Philosophy":{"type":"string","title":"Villain Philosophy","description":"The worldview that justifies everything — why heroism is a lie, why the strong should rule, why the system must be destroyed, or whatever truth the villain has concluded that the world refuses to accept","x-uiWidget":"textarea","useForAI":true},"Code of Villainy":{"type":"string","title":"Code of Villainy","description":"Lines the villain draws even for themselves — or doesn''t. What they won''t do (if anything), what they absolutely will, and whether they have a style they maintain","x-uiWidget":"textarea","useForAI":true},"Ultimate Goal":{"type":"string","title":"Ultimate Goal","enum":["Total Domination","Destroy the Hero / Hero System","Reshape the World''s Rules","Achieve Something Personal at Any Cost","Prove Everyone Wrong About Them","Survive and Win"],"x-uiWidget":"select","useForAI":true},"Signature Style":{"type":"string","title":"Signature Style","description":"The villain''s aesthetic of evil — their preferred methods, their theatricality or lack of it, what makes their approach distinctively and recognizably theirs. The anti-villain''s answer to the hero''s iconic look.","x-uiWidget":"textarea","useForAI":true}}}',
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

-- 2.3 Villain Scheme (setting, singleton)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Villain Scheme',
  'The villain''s strategic architecture — the master plan, active operations, and the systematic exploitation of the hero''s predictable virtues',
  '{"type":"object","required":["Master Plan","Current Phase"],"properties":{"Master Plan":{"type":"string","title":"Master Plan","description":"The overarching goal and the general shape of how the villain intends to achieve it — the top-level scheme that all other plots serve","x-uiWidget":"textarea","useForAI":true},"Current Phase":{"type":"string","title":"Current Phase","enum":["Setting the Stage","Consolidating Power","Hunting the Hero","Final Gambit","Aftermath / Recovery"],"x-uiWidget":"select","useForAI":true},"Active Schemes":{"type":"string","title":"Active Schemes","description":"The specific plots currently in motion — the simultaneously running operations that give the villain multiple angles of attack and ensure no single failure is fatal","x-uiWidget":"textarea","useForAI":true},"Contingencies":{"type":"string","title":"Contingencies","description":"Backup plans, trap cards, and fallback positions — what the villain has already prepared for when things go wrong, because things always go wrong","x-uiWidget":"textarea","useForAI":true},"Hero Exploitation Strategy":{"type":"string","title":"Hero Exploitation Strategy","description":"How the villain weaponizes the hero''s heroic nature against them — which predictable virtues (mercy, self-sacrifice, trust, honor) become exploitable vulnerabilities in the villain''s hands","x-uiWidget":"textarea","useForAI":true},"Known Vulnerabilities":{"type":"string","title":"Known Vulnerabilities","description":"What could actually stop or slow the villain — genuine weak points in the current scheme","isDynamic":true}}}',
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

-- 2.4 Writing Style (setting, singleton)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Writing Style',
  'The narrative voice and prose style — how the villain''s perspective shapes every sentence on the page',
  '{"type":"object","required":["Narrative POV","Prose Style"],"properties":{"Narrative POV":{"type":"string","title":"Narrative POV","enum":["First Person (Villain Narrator)","Third Person Limited (Villain POV)","Dual POV (Villain + Hero)","Multiple POV (Villain-Centric)","Unreliable Villain Narrator"],"x-uiWidget":"radio","useForAI":true},"Prose Style":{"type":"string","title":"Prose Style","enum":["Sharp and Precise","Elegant and Sardonic","Clinical and Detached","Theatrically Grand","Darkly Humorous"],"x-uiWidget":"radio","useForAI":true},"Villain''s Voice":{"type":"string","title":"Villain''s Voice","description":"The specific quality of the villain''s internal voice — how they think about themselves, categorize others, and narrate their own schemes. The distance between how they see themselves and how the reader sees them.","x-uiWidget":"textarea","useForAI":true},"Heroism Depiction Style":{"type":"string","title":"Heroism Depiction Style","enum":["Satirical — Heroes Are Fools","Tragic — Heroes Are Victims of a Broken System","Respectful — Worthy Adversaries","Deconstructive — Heroism as Performance"],"x-uiWidget":"select","useForAI":true},"Pacing":{"type":"string","title":"Pacing","enum":["Chess Match — Methodical and Inevitable","Action-Dense with Strategic Breathing Room","Slow Burn Unraveling","Rapid Escalation to Payoff"],"x-uiWidget":"radio","useForAI":true},"Banned Words":{"type":"string","title":"Banned Words","description":"Words or expressions that break the villain''s voice or undermine the tone — phrases that make the villain sound like a generic dark protagonist rather than this specific one","x-uiWidget":"textarea","useForAI":true}}}',
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
  'The world that produces heroes and how the villain operates within, around, and against that system',
  '{"type":"object","required":["World Type","Hero System"],"properties":{"World Type":{"type":"string","title":"World Type","enum":["Fantasy Kingdom with Chosen One Prophecy","Cultivation World with Heaven''s Mandate","Superhero Universe with Destined Champion","Modern World with Secret Heroic Order","Sci-Fi with Galactic Savior Mythology","Other"],"x-uiWidget":"select","useForAI":true},"Hero System":{"type":"string","title":"Hero System","description":"How this world produces, empowers, and protects its ''heroes'' — the mechanics of divine favor, prophecy, chosen-one status, talent systems, or destined-greatness frameworks that make heroes structurally advantaged","x-uiWidget":"textarea","useForAI":true},"Hero System Weaknesses":{"type":"string","title":"Hero System Weaknesses","description":"The structural flaws and blind spots in the hero system — what divine protection does NOT cover, what prophecy cannot predict, what destined-greatness cannot prepare a hero for. These are the villain''s primary attack surfaces.","x-uiWidget":"textarea","useForAI":true},"World''s Morality Framework":{"type":"string","title":"World''s Morality Framework","description":"How this world defines good and evil — the moral cosmology the villain exists in tension with. What the world considers ''evil'' and why the villain rejects, subverts, or operates beneath that judgment.","x-uiWidget":"textarea","useForAI":true},"Power Structure":{"type":"string","title":"Power Structure","description":"Who holds power, how it''s maintained, and where the villain is positioned in that structure — aligned with certain powers, opposed to others, operating in the gaps","x-uiWidget":"textarea","useForAI":true},"Key Locations":{"type":"string","title":"Key Locations","description":"Major locations significant to the conflict — the villain''s domain, the hero''s homeland, battlegrounds, and strategic assets","x-uiWidget":"textarea","useForAI":true}}}',
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
  'Characters in the villain protagonist''s story — the hero to be hunted, the subordinates to be managed, the pawns to be played, and everyone in between',
  '{"type":"object","x-titleField":"Name","required":["Name","Role"],"properties":{"Name":{"type":"string","title":"Name","description":"Character''s name — no parenthetical notes","useForAI":true},"Role":{"type":"string","title":"Role","enum":["Villain Protagonist","The Hero (Primary Target)","Loyal Subordinate","Ambitious Underling","Unwitting Pawn","Worthy Rival","The Morally Grey Ally","Collateral Character"],"x-uiWidget":"radio","useForAI":true},"Gender":{"type":"string","title":"Gender","enum":["Male","Female","Non-binary","Other"],"x-uiWidget":"radio","useForAI":true},"Age":{"type":"string","title":"Age","description":"Character''s age or age range","useForAI":true},"Core Motivation":{"type":"string","title":"Core Motivation","description":"What drives this character above all else — the deep want or need that makes their behavior predictable to those who understand it","x-uiWidget":"textarea","useForAI":true},"Hero or Villain Nature":{"type":"string","title":"Hero or Villain Nature","description":"Where they fall in the hero/villain spectrum — and whether they are aware of their own positioning. The most dangerous characters are those who don''t know which side they''re actually on.","x-uiWidget":"textarea","useForAI":true},"Strengths":{"type":"string","title":"Strengths","description":"Combat capability, political influence, social capital, information, or other advantages","x-uiWidget":"textarea","useForAI":true},"Exploitable Weaknesses":{"type":"string","title":"Exploitable Weaknesses","description":"Vulnerabilities the villain protagonist can target — especially weaknesses that arise directly from their heroic virtues (mercy, trust, honor, self-sacrifice)","x-uiWidget":"textarea","useForAI":true},"Relationship to Villain Protagonist":{"type":"string","title":"Relationship to Villain Protagonist","description":"Their dynamic with the villain protagonist — tool, threat, pawn, genuine equal, or something the villain hasn''t fully categorized yet","x-uiWidget":"textarea","useForAI":true},"Current Status":{"type":"string","title":"Current Status","description":"Their current situation in the story","isDynamic":true},"Current Awareness Level":{"type":"string","title":"Current Awareness Level","description":"How much this character understands about the villain protagonist''s true nature, plans, and capabilities","isDynamic":true}}}',
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

-- 2.7 Faction (organization, non-singleton)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Faction',
  'Power factions the villain protagonist controls, infiltrates, manipulates, or must eventually destroy',
  '{"type":"object","x-titleField":"Faction Name","required":["Faction Name","Faction Side"],"properties":{"Faction Name":{"type":"string","title":"Faction Name","useForAI":true},"Faction Side":{"type":"string","title":"Faction Side","enum":["Villain''s Own Forces","The Hero''s Alliance","Neutral Power Broker","Rival Villain Faction","Unknowing Pawn Faction","Above Both Sides"],"x-uiWidget":"select","useForAI":true},"Public Identity":{"type":"string","title":"Public Identity","description":"How this faction presents itself to the world — stated goals, public image, the reputation they''ve cultivated","x-uiWidget":"textarea","useForAI":true},"True Purpose":{"type":"string","title":"True Purpose","description":"What this faction is actually for — hidden agendas, real power goals, or the gap between what they claim and what the villain protagonist knows they actually do","x-uiWidget":"textarea","useForAI":true},"Power Base":{"type":"string","title":"Power Base","description":"Military, political, economic, magical, informational, or social power — what gives this faction its leverage","x-uiWidget":"textarea","useForAI":true},"Relationship to Villain Protagonist":{"type":"string","title":"Relationship to Villain Protagonist","enum":["Controlled Asset","Unknowing Tool","Temporary Alliance","Primary Antagonist","Infiltration Target","Mutual Non-Aggression"],"x-uiWidget":"select","useForAI":true},"Internal Divisions":{"type":"string","title":"Internal Divisions","description":"Exploitable fractures — competing leaders, ideological splits, members with private agendas the villain can offer to","x-uiWidget":"textarea","useForAI":true},"Current Strength":{"type":"string","title":"Current Strength","description":"Military and political power level","isDynamic":true},"Suspicion Level":{"type":"string","title":"Suspicion Level","description":"How much this faction suspects or knows about the villain protagonist''s true nature and plans","isDynamic":true}}}',
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

-- 2.8 Scene (scene, non-singleton)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Scene',
  'Key locations in the villain protagonist''s world — each one a stage for manipulation, confrontation, or the execution of plans',
  '{"type":"object","x-titleField":"Location Name","required":["Location Name","Scene Type"],"properties":{"Location Name":{"type":"string","title":"Location Name","useForAI":true},"Scene Type":{"type":"string","title":"Scene Type","enum":["Villain''s Domain","Hero''s Territory","Neutral Ground","Battlefield","Intelligence Hub","Political Power Seat","Prepared Trap","Safe House"],"x-uiWidget":"select","useForAI":true},"Strategic Value":{"type":"string","title":"Strategic Value","description":"Why this location matters to the villain''s plans — intelligence access, resource control, symbolic value, or positional advantage","x-uiWidget":"textarea","useForAI":true},"Atmosphere":{"type":"string","title":"Atmosphere","description":"The mood and sensory character of this place — what it feels like to be here, and how that feeling serves or reflects the villain''s power","x-uiWidget":"textarea","useForAI":true},"Villain''s Advantage Here":{"type":"string","title":"Villain''s Advantage Here","description":"What edge the villain protagonist has at this location — prepared infrastructure, informant networks, controlled access, terrain knowledge, or information asymmetry","x-uiWidget":"textarea","useForAI":true},"Controlling Power":{"type":"string","title":"Controlling Power","description":"Who controls this location currently","isDynamic":true},"Current State":{"type":"string","title":"Current State","description":"Current condition and operational status","isDynamic":true}}}',
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
