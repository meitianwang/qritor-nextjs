-- The Purely Pragmatic Novel - Rational Actor Creation Method
-- Language: English (en)
-- Includes: creation method + 8 module types
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/init_purely_pragmatic.sql

-- ============================================================
-- 1. Create the creation method
-- ============================================================

INSERT INTO novel_creation_method (name_zh, name_en, description_en, novel_type_zh, novel_type_en, language, visible_categories, created_at)
VALUES (
  '纯粹实用主义小说',
  'The Purely Pragmatic Novel',
  'For creating fiction featuring protagonists who are not broken, not traumatized — just relentlessly rational. Every relationship is an investment. Every action is calculated for maximum return. Saving a life, ending a life, sacrificing an innocent — all pass through the same cost-benefit analysis. Core appeal: the electric thrill of watching an exceptional mind operate with zero moral friction, and the question of whether that mind is missing something it doesn''t know to miss. Tags: Calculating, Logical, Pragmatic.',
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

SET @method_id = (SELECT id FROM novel_creation_method WHERE name_en = 'The Purely Pragmatic Novel' LIMIT 1);

-- ============================================================
-- 2. Create module types (8 total)
-- ============================================================

-- 2.1 Story Hook (setting, singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '故事钩子',
  'Story Hook',
  'The opening gambit — the first calculation that shows readers exactly what kind of mind they are dealing with',
  '{"type":"object","required":["Story Hook"],"properties":{"Story Hook":{"type":"string","title":"Story Hook","description":"One sentence showing the protagonist''s operating logic in action — not who they are, but HOW they think","x-uiWidget":"textarea","useForAI":true},"The Opening Gambit":{"type":"string","title":"The Opening Gambit","description":"The first significant decision readers witness — a calculation that immediately establishes the protagonist''s framework. What did they choose, what did they sacrifice, and what did they gain?","x-uiWidget":"textarea","useForAI":true},"The Implicit Promise":{"type":"string","title":"The Implicit Promise","description":"What readers are promised if they follow this protagonist — the specific brand of vicarious thrill the story offers","x-uiWidget":"textarea","useForAI":true},"The Discomfort":{"type":"string","title":"The Discomfort","description":"The specific moral discomfort the story generates — the thing that makes this intellectually exciting rather than comfortably heroic","x-uiWidget":"textarea","useForAI":true}}}',
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

-- 2.2 The Rational Mind (setting, singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '理性思维',
  'The Rational Mind',
  'The architecture of the protagonist''s thinking — how they process the world, manage emotion, and calculate decisions',
  '{"type":"object","required":["Decision Framework","Emotional Inventory"],"properties":{"Decision Framework":{"type":"string","title":"Decision Framework","description":"How the protagonist evaluates every choice: what counts as value, what counts as cost, what time horizon they optimize for, and what information they consider relevant","x-uiWidget":"textarea","useForAI":true},"Emotional Inventory":{"type":"string","title":"Emotional Inventory","description":"They DO have emotions — name them. What emotions does this protagonist experience, and how do they process each one? Do they suppress them, use them as data, or treat them as variables to be managed?","x-uiWidget":"textarea","useForAI":true},"Social Performance":{"type":"string","title":"Social Performance","description":"How the protagonist performs normalcy: what masks they wear, what social scripts they have memorized, how they manufacture warmth, trust, or affection when it is strategically necessary","x-uiWidget":"textarea","useForAI":true},"Information Gathering":{"type":"string","title":"Information Gathering","description":"How they collect and process intelligence: their methods, their sources, what asymmetric information advantages they seek to create","x-uiWidget":"textarea","useForAI":true},"Known Blind Spots":{"type":"string","title":"Known Blind Spots","description":"The limits of pure rationality that the protagonist is aware of — cognitive biases they account for, or assumptions they know they make. Every rational system has axioms it cannot examine.","x-uiWidget":"textarea","useForAI":true},"Unknown Blind Spots":{"type":"string","title":"Unknown Blind Spots","description":"What the protagonist cannot see about themselves — the thing their rational framework systematically misses or undervalues. This is the source of the story''s tension.","x-uiWidget":"textarea","useForAI":true}}}',
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

-- 2.3 Objective Architecture (setting, singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '目标架构',
  'Objective Architecture',
  'The protagonist''s goal structure — what they are optimizing for, how they measure progress, and what they are willing to spend',
  '{"type":"object","required":["Ultimate Objective","Optimization Metric"],"properties":{"Ultimate Objective":{"type":"string","title":"Ultimate Objective","description":"The end state the protagonist is working toward — specific enough to be measurable, large enough to justify everything they do on the way","x-uiWidget":"textarea","useForAI":true},"Optimization Metric":{"type":"string","title":"Optimization Metric","description":"How the protagonist measures progress toward their objective — the specific currency of success in their framework (power, knowledge, resources, position, capability)","x-uiWidget":"textarea","useForAI":true},"Current Asset Portfolio":{"type":"string","title":"Current Asset Portfolio","description":"What the protagonist currently holds: relationships, information, resources, capabilities, positions — and their assessed value toward the objective","x-uiWidget":"textarea","useForAI":true},"Active Investments":{"type":"string","title":"Active Investments","description":"The relationships and situations the protagonist is currently cultivating — what they have invested and what return they expect","x-uiWidget":"textarea","useForAI":true},"Acceptable Expenditure":{"type":"string","title":"Acceptable Expenditure","description":"What the protagonist will spend to advance toward the objective — including people, relationships, and lives. At what exchange rate does an innocent life become acceptable collateral?","x-uiWidget":"textarea","useForAI":true},"Efficiency Constraints":{"type":"string","title":"Efficiency Constraints","description":"Actions the protagonist will NOT take — not from ethics, but because the cost-benefit ratio is unfavorable. High visibility actions, unnecessary conflict, anything that burns resources without proportional return.","x-uiWidget":"textarea","useForAI":true}}}',
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

-- 2.4 Power System (setting, singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '力量体系',
  'Power System',
  'The world''s system of power and capability — what the protagonist is optimizing toward and how they calculate their position within it',
  '{"type":"object","required":["Power Type"],"properties":{"Power Type":{"type":"string","title":"Power Type","enum":["Hard Magic System with Quantifiable Tiers","Martial Arts / Combat Hierarchy","Political and Economic Power","Technological or Knowledge Power","Divine / Supernatural Ranking","Mixed Systems","No Supernatural Powers"],"x-uiWidget":"select","useForAI":true},"Power Mechanics":{"type":"string","title":"Power Mechanics","description":"How the power system works — its rules, advancement pathways, and the specific metrics that define where anyone stands","x-uiWidget":"textarea","useForAI":true},"Acquisition Cost Analysis":{"type":"string","title":"Acquisition Cost Analysis","description":"What does it cost to advance? Time, resources, lives, opportunities foregone? The protagonist has mapped this curve.","x-uiWidget":"textarea","useForAI":true},"Protagonist''s Current Position":{"type":"string","title":"Protagonist''s Current Position","description":"Where the protagonist currently stands in the power hierarchy — and how they assess the gap to their objective","x-uiWidget":"textarea","useForAI":true},"Optimal Advancement Path":{"type":"string","title":"Optimal Advancement Path","description":"The route the protagonist has calculated as most efficient — why this path, what alternatives they rejected and why","x-uiWidget":"textarea","useForAI":true},"Key Resource Bottlenecks":{"type":"string","title":"Key Resource Bottlenecks","description":"The specific constraints that limit faster advancement — and how the protagonist plans to resolve each one","x-uiWidget":"textarea","useForAI":true}}}',
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
  'The narrative voice and prose style — how the protagonist''s calculating mind is rendered on the page to produce the genre''s characteristic thrill',
  '{"type":"object","required":["Narrative POV","Calculus Display"],"properties":{"Narrative POV":{"type":"string","title":"Narrative POV","enum":["First Person — Deep Inside the Calculation","Third Person Limited — One Step Outside, Clinical Precision","Third Person Omniscient — The Reader Sees What Others Cannot","Dual POV — The Protagonist and Someone Watching Them"],"x-uiWidget":"radio","useForAI":true},"Calculus Display":{"type":"string","title":"Calculus Display","description":"How the protagonist''s calculations are shown to the reader — the primary technique that delivers the genre''s thrill. Explicit internal monologue? Revealed-in-action? Retrospective explanation? Dramatic irony where readers know the calculation before others do?","x-uiWidget":"textarea","useForAI":true},"Prose Style":{"type":"string","title":"Prose Style","enum":["Precise and Economical — Every Word Justified","Elegant and Detached — Beautiful Surface over Cold Depths","Rapid and Kinetic — The Calculation Made Momentum","Layered — Surface Conversation, Subtext Calculation"],"x-uiWidget":"radio","useForAI":true},"Pacing":{"type":"string","title":"Pacing","enum":["Relentless — Always Advancing","Strategic Build — Setup and Payoff","Long Game — Slow Accumulation of Position","Episodic — Each Encounter a Complete Exchange"],"x-uiWidget":"radio","useForAI":true},"Dramatic Irony Level":{"type":"string","title":"Dramatic Irony Level","enum":["High — Readers Always Know More Than Other Characters","Medium — Readers Know As Much As the Protagonist","Low — Protagonist Knows More Than Readers Too"],"x-uiWidget":"radio","useForAI":true},"Banned Words":{"type":"string","title":"Banned Words","description":"Words and phrases to avoid — emotion-first language, accidental moralizing, anything that makes the protagonist sound like a standard hero","x-uiWidget":"textarea","useForAI":true}}}',
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
  'The people in the protagonist''s world — assets, liabilities, obstacles, tools, and the rare individual who complicates the calculation',
  '{"type":"object","x-titleField":"Name","required":["Name","Assessment"],"properties":{"Name":{"type":"string","title":"Name","description":"Character''s name — no parenthetical notes","useForAI":true},"Assessment":{"type":"string","title":"Assessment","enum":["High-Value Asset","Expendable Resource","Useful Obstacle","Necessary Liability","Unpredictable Variable","Unknown Quantity","The Anomaly — Doesn''t Fit the Model"],"x-uiWidget":"radio","useForAI":true},"Gender":{"type":"string","title":"Gender","enum":["Male","Female","Non-binary","Other"],"x-uiWidget":"radio","useForAI":true},"Age":{"type":"string","title":"Age","description":"Character''s age or age range","useForAI":true},"Current Value":{"type":"string","title":"Current Value","description":"What this character currently provides or could provide — their utility in the protagonist''s framework","x-uiWidget":"textarea","useForAI":true},"Leverage Points":{"type":"string","title":"Leverage Points","description":"What the protagonist knows about this character''s motivations, fears, and desires that can be used to influence them","x-uiWidget":"textarea","useForAI":true},"Risk Profile":{"type":"string","title":"Risk Profile","description":"What this character could cost — their potential for disruption, betrayal, or becoming a liability","x-uiWidget":"textarea","useForAI":true},"Hidden Complexity":{"type":"string","title":"Hidden Complexity","description":"The dimension of this character that the protagonist''s model does not fully capture — the thing that will eventually complicate the calculation","x-uiWidget":"textarea","useForAI":true},"Current Status":{"type":"string","title":"Current Status","description":"Their current position in the story and in the protagonist''s assessment","isDynamic":true},"Assessed Value Trajectory":{"type":"string","title":"Assessed Value Trajectory","description":"Whether the protagonist''s assessment of them is rising, falling, or stable","isDynamic":true}}}',
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
  'Organizations and power groups the protagonist analyzes, infiltrates, uses, or dismantles according to the calculation',
  '{"type":"object","x-titleField":"Faction Name","required":["Faction Name","Strategic Value"],"properties":{"Faction Name":{"type":"string","title":"Faction Name","useForAI":true},"Faction Type":{"type":"string","title":"Faction Type","enum":["Political Body","Military Order","Religious Institution","Criminal Network","Merchant Alliance","Knowledge Holder","Noble House","Other"],"x-uiWidget":"select","useForAI":true},"Strategic Value":{"type":"string","title":"Strategic Value","description":"What this faction provides toward the protagonist''s objective — resources, access, information, protection, or a necessary step","x-uiWidget":"textarea","useForAI":true},"Decision Makers":{"type":"string","title":"Decision Makers","description":"Who actually controls the faction''s behavior — the real leverage points, not the nominal leadership","x-uiWidget":"textarea","useForAI":true},"Exploitable Structure":{"type":"string","title":"Exploitable Structure","description":"How this faction''s internal logic, incentives, or conflicts can be used — the seams the protagonist can work","x-uiWidget":"textarea","useForAI":true},"What They Want":{"type":"string","title":"What They Want","description":"The faction''s interests and motivations — what can be offered, implied, or performed to manage their behavior","x-uiWidget":"textarea","useForAI":true},"Risk to Protagonist":{"type":"string","title":"Risk to Protagonist","description":"How this faction could damage the protagonist''s position if mishandled","x-uiWidget":"textarea","useForAI":true},"Current Relationship":{"type":"string","title":"Current Relationship","description":"The protagonist''s current standing with this faction and whether it is optimal","isDynamic":true},"Assessed Shelf Life":{"type":"string","title":"Assessed Shelf Life","description":"How long this faction remains useful before its value is extracted or its risk outweighs its benefit","isDynamic":true}}}',
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
  'Locations where key exchanges occur — each space is a playing field with rules the protagonist has mapped',
  '{"type":"object","x-titleField":"Location Name","required":["Location Name","Strategic Function"],"properties":{"Location Name":{"type":"string","title":"Location Name","useForAI":true},"Scene Type":{"type":"string","title":"Scene Type","enum":["Power Center — Where Decisions Are Made","Neutral Ground — Where Exchanges Happen","Intelligence Source","Resource Node","Controlled Territory","Enemy Domain","Trap / Testing Ground","Transition Space"],"x-uiWidget":"select","useForAI":true},"Strategic Function":{"type":"string","title":"Strategic Function","description":"What this location provides in the protagonist''s operation — why it matters to the calculation","x-uiWidget":"textarea","useForAI":true},"Known Variables":{"type":"string","title":"Known Variables","description":"What the protagonist knows about this location: who controls it, who frequents it, its security, its information value","x-uiWidget":"textarea","useForAI":true},"Unknown Variables":{"type":"string","title":"Unknown Variables","description":"What the protagonist does NOT yet know — the information gap that creates risk","x-uiWidget":"textarea","useForAI":true},"Atmosphere":{"type":"string","title":"Atmosphere","description":"The sensory texture and social climate of the space — what it looks, sounds, and feels like","x-uiWidget":"textarea","useForAI":true},"Controlling Party":{"type":"string","title":"Controlling Party","description":"Who currently controls or dominates this space","isDynamic":true},"Current Risk Level":{"type":"string","title":"Current Risk Level","description":"Current danger level for protagonist operations here","isDynamic":true}}}',
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
