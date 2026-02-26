-- The Chaotic Evil / True Villain Novel Creation Method
-- Language: English (en)
-- Includes: creation method + 8 module types
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/init_chaotic_evil.sql

-- ============================================================
-- 1. Create the creation method
-- ============================================================

INSERT INTO novel_creation_method (name, description, novel_type, language, visible_categories, is_preset, user_id, status, created_at)
VALUES (
  'The Chaotic Evil / True Villain Novel',
  'For creating stories where the protagonist is a true agent of chaos and malice. No tragic pasts, no forced circumstances—they destroy simply because they find it entertaining. Core appeals: Absolute freedom, psychological manipulation, mayhem, and seeing the righteous despair.',
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

SET @method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Chaotic Evil / True Villain Novel' LIMIT 1);

-- ============================================================
-- 2. Create module types (8 total)
-- ============================================================

-- 2.1 Story Hook (setting, singleton)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Story Hook',
  'The core hook that draws readers into the protagonist''s path of unprovoked destruction and psychological torment.',
  '{"type":"object","required":["Story Hook"],"properties":{"Story Hook":{"type":"string","title":"Story Hook","description":"One sentence capturing the core appeal of the story (e.g., A psychotic genius decides to dismantle the world''s greatest hero alliance just because he was bored on a Tuesday).","x-uiWidget":"textarea","useForAI":true},"Core Selling Point":{"type":"string","title":"Core Selling Point","description":"What makes this True Villain story unique — the specific flavor of their madness, their methods of manipulation, or the sheer scale of their mayhem.","x-uiWidget":"textarea","useForAI":true},"Opening Act of Malice":{"type":"string","title":"Opening Act of Malice","description":"The unprovoked, shocking event the protagonist causes to kickstart their game of destruction.","x-uiWidget":"textarea","useForAI":true},"Reader Expectation":{"type":"string","title":"Reader Expectation","description":"The anticipated payoffs: absolute freedom from morality, shattering hypocritical justice, and the catharsis of ultimate power.","x-uiWidget":"textarea","useForAI":true}}}',
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

-- 2.2 Core Premise (setting, singleton)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Core Premise',
  'The foundational premise defining the protagonist''s brand of evil and their chaotic playground.',
  '{"type":"object","required":["Villain Archetype","Nature of Malice"],"properties":{"Villain Archetype":{"type":"string","title":"Villain Archetype","enum":["The Bored Genius/Manipulator","The Psychopathic Force of Nature","The Smiling Sadist","The Anarchist Catalyst","The Eldritch Entity in Human Skin"],"x-uiWidget":"select","useForAI":true},"Nature of Malice":{"type":"string","title":"Nature of Malice","description":"Why they do it (e.g., pure boredom, twisted artistic vision, finding human despair hilarious). No sob stories allowed.","x-uiWidget":"textarea","useForAI":true},"Core Methodology":{"type":"string","title":"Core Methodology","enum":["Psychological Manipulation","Brutal Overwhelming Force","Elaborate Death Games","Corrupting the Innocent","Unpredictable Chaos"],"x-uiWidget":"select","useForAI":true},"The Playground":{"type":"string","title":"The Playground","description":"What do they consider their toy? (A highly ordered utopia, a grimdark city they want to make worse, the minds of heroes).","x-uiWidget":"textarea","useForAI":true},"Story Tone":{"type":"string","title":"Story Tone","enum":["Dark Comedy/Gallows Humor","Psychological Thriller","Action-Packed Mayhem","Gore & Brutality","Philosophical Nihilism"],"x-uiWidget":"radio","useForAI":true}}}',
  1.1,
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

-- 2.3 Worldbuilding (setting, singleton)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Worldbuilding',
  'The structured world that exists solely to be dismantled, corrupted, and destroyed by the protagonist.',
  '{"type":"object","required":["World Structure"],"properties":{"World Structure":{"type":"string","title":"World Structure","enum":["Utopian Society (Perfect target for corruption)","Classic Fantasy (Heroes exist to be broken)","Modern Urban (Hidden underworld of crime)","Cyberpunk/Sci-Fi (Corporate order to crash)","Cultivation World (Mocking righteous sects)"],"x-uiWidget":"select","useForAI":true},"The Facade of Justice":{"type":"string","title":"The Facade of Justice","description":"The systems, rules, or righteous factions that maintain order. The shinier they are, the more fun they are to break.","x-uiWidget":"textarea","useForAI":true},"Society''s Vulnerabilities":{"type":"string","title":"Society''s Vulnerabilities","description":"The hidden hypocrisy, fragile alliances, or collective fears that the protagonist exploits.","x-uiWidget":"textarea","useForAI":true},"The Innocent Masses":{"type":"string","title":"The Innocent Masses","description":"How the general populace reacts (blissfully ignorant, easily manipulated, prone to panic).","x-uiWidget":"textarea","useForAI":true},"Rules of the Game":{"type":"string","title":"Rules of the Game","description":"Any self-imposed rules the protagonist follows just to make the destruction more entertaining.","x-uiWidget":"textarea","useForAI":true}}}',
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

-- 2.4 Power System & Abilities (setting, singleton)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Abilities & Tools of Chaos',
  'The horrific powers, vast wealth, mind-bending intellect, or sheer unhinged malice the protagonist uses to enact their will.',
  '{"type":"object","required":["Source of Power"],"properties":{"Source of Power":{"type":"string","title":"Source of Power","enum":["Absolute Overpowered Stats","Unmatched Intellect/Planning","A Twisted System/Artifact","Wealth and Influence","Eldritch/Forbidden Magic"],"x-uiWidget":"select","useForAI":true},"Signature Method":{"type":"string","title":"Signature Method","description":"Their trademark way of dealing with problems or victims (e.g., explosive playing cards, mind-control whispers, brutal blunt force).","x-uiWidget":"textarea","useForAI":true},"The Unfair Advantage":{"type":"string","title":"The Unfair Advantage","description":"Why the heroes can never truly win (e.g., they don''t care if they die, they have infinite contingencies, they feed on hatred).","x-uiWidget":"textarea","useForAI":true},"Collateral Damage Level":{"type":"string","title":"Collateral Damage Level","enum":["Surgical but Devastating","City-Leveling Explosions","Worldwide Mental Corruption","Complete Ecosystem Annihilation"],"x-uiWidget":"select","useForAI":true}}}',
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

-- 2.5 Writing Style (setting, singleton)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  'Writing Style',
  'The narrative voice and tone for the story of pure, unapologetic evil.',
  '{"type":"object","required":["Narrative POV"],"properties":{"Narrative POV":{"type":"string","title":"Narrative POV","enum":["First Person (Inside the twisted mind)","Third Person Limited (Protagonist focus)","Victim/Hero POV (Experiencing the horror)","Omniscient (Viewing the grand game)"],"x-uiWidget":"radio","useForAI":true},"Prose Tone":{"type":"string","title":"Prose Tone","enum":["Playful and Manic","Cold and Clinical","Visceral and Grotesque","Theatrical and Grandiose"],"x-uiWidget":"radio","useForAI":true},"Pacing":{"type":"string","title":"Pacing","enum":["Slow-burn Psychological Torture","Non-stop Chaotic Action","Erratic (matching the protagonist''s whims)"],"x-uiWidget":"radio","useForAI":true},"Treatment of Morality":{"type":"string","title":"Treatment of Morality","enum":["Complete Mockery","Ignored Entirely","Used as a Weapon Against the Righteous"],"x-uiWidget":"radio","useForAI":true}}}',
  0.8,
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
  'The protagonist, their enablers, the desperate heroes, and the innocent toys.',
  '{"type":"object","x-titleField":"Name","required":["Name","Role"],"properties":{"Name":{"type":"string","title":"Name","useForAI":true},"Role":{"type":"string","title":"Role","enum":["The True Villain (MC)","Obsessed Follower/Enabler","The Broken Hero","The Righteous Hypocrite","The Innocent Victim","The Unwitting Pawn"],"x-uiWidget":"select","useForAI":true},"Psychological Profile":{"type":"string","title":"Psychological Profile","description":"Their mental state (e.g., completely unhinged, clinging to false hope, rigidly disciplined but cracking).","x-uiWidget":"textarea","useForAI":true},"Utility to the Protagonist":{"type":"string","title":"Utility to the Protagonist","description":"Why does the MC keep them around? (e.g., they make funny sounds when they cry, they are useful for the next phase, sheer amusement).","x-uiWidget":"textarea","useForAI":true},"Breaking Point":{"type":"string","title":"Breaking Point","description":"What it will take to completely shatter their sanity or ideals (N/A for MC).","x-uiWidget":"textarea","useForAI":true},"Current Mental State":{"type":"string","title":"Current Mental State","isDynamic":true},"Current Survival Status":{"type":"string","title":"Current Survival Status","isDynamic":true}}}',
  1.1,
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
  'Cults of personality, righteous alliances bound to fail, or corrupt institutions waiting to be exploited.',
  '{"type":"object","x-titleField":"Faction Name","required":["Faction Name","Faction Type"],"properties":{"Faction Name":{"type":"string","title":"Faction Name","useForAI":true},"Faction Type":{"type":"string","title":"Faction Type","enum":["Villain''s Syndicate/Cult","Righteous Vanguard/Hero Association","Corrupt Government/Mega-Corp","Underground Criminals","Naive Do-Gooders Organization"],"x-uiWidget":"select","useForAI":true},"Core Function":{"type":"string","title":"Core Function","description":"What do they ostensibly do? (e.g., protecting the innocent, trafficking anomalies, worshiping the MC).","x-uiWidget":"textarea","useForAI":true},"Fatal Flaw":{"type":"string","title":"Fatal Flaw","description":"The weakness the protagonist exploits (e.g., blind adherence to rules, internal corruption, reliance on a single symbol of hope).","x-uiWidget":"textarea","useForAI":true},"Relationship to Protagonist":{"type":"string","title":"Relationship to Protagonist","enum":["Furtive Worshipers","Sworn Enemy (To be broken)","Useful Idiots (Currently manipulated)","Completely Destroyed","The Plaything"],"x-uiWidget":"select","useForAI":true},"Current Integrity":{"type":"string","title":"Current Integrity (How close to collapse)","isDynamic":true},"Current Public Perception":{"type":"string","title":"Current Public Perception","isDynamic":true}}}',
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
  'Pristine locations waiting to be defiled, or twisted lairs where the games are played.',
  '{"type":"object","x-titleField":"Location Name","required":["Location Name","Location Type"],"properties":{"Location Name":{"type":"string","title":"Location Name","useForAI":true},"Location Type":{"type":"string","title":"Location Type","enum":["The Villain''s Lair","A Symbol of Hope/Utopia","The Bloodstained Arena","A Corrupted Sanctuary","The Urban Playground"],"x-uiWidget":"select","useForAI":true},"Atmosphere Before/After":{"type":"string","title":"Atmosphere Before/After","description":"How it looks initially, and the grotesque or chaotic way the protagonist alters it.","x-uiWidget":"textarea","useForAI":true},"Psychological Impact":{"type":"string","title":"Psychological Impact on Victims","description":"How being in this place breaks the minds of the heroes or innocents (e.g., a mocking funhouse of their failures, a clinical white room).","x-uiWidget":"textarea","useForAI":true},"Key Features/Traps":{"type":"string","title":"Key Features/Traps","description":"Specifically designed elements of chaos (e.g., a bomb tied to a moral dilemma, walls painted with despairing messages).","x-uiWidget":"textarea","useForAI":true},"Current Level of Defilement":{"type":"string","title":"Current Level of Defilement","isDynamic":true},"Current Controlling Entity":{"type":"string","title":"Current Controlling Entity","isDynamic":true}}}',
  1.1,
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
