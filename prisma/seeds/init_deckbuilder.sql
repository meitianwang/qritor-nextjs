-- The Deckbuilder LitRPG Novel Creation Method
-- Language: English (en)
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/init_deckbuilder.sql

INSERT INTO novel_creation_method (name_zh, name_en, description_en, novel_type_zh, novel_type_en, language, visible_categories, created_at)
VALUES (
  '卡牌构筑LitRPG小说',
  'The Deckbuilder LitRPG Novel',
  'For stories where magic and abilities are manifested through magical cards. The protagonist must build a "Deck," manage mana pools, and discover broken synergies to climb the ranks. Core appeals: strategic deck building, infinite combos, pack-opening dopamine, and strict rules-based combat.',
  '文字RPG',
  'Deckbuilder / Card LitRPG',
  'en',
  '["setting","character","organization","scene","prop"]',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_en = VALUES(description_en),
  novel_type_en = VALUES(novel_type_en),
  visible_categories = VALUES(visible_categories),
  updated_at = NOW();

SET @method_id = (SELECT id FROM novel_creation_method WHERE name_en = 'The Deckbuilder LitRPG Novel' LIMIT 1);

-- ============================================================
-- 2. Create module types (9 total, including "Card/Deck")
-- ============================================================

-- 2.1 Story Hook (setting, singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '故事钩子',
  'Story Hook',
  'The core hook: how they get their first card or discover their unique deck archetype.',
  '{"type":"object","required":["The Awakening / First Draw"],"properties":{"The Awakening / First Draw":{"type":"string","title":"The First Draw","description":"How does the MC acquire their first card? (e.g., Opening a booster pack found in a dungeon, inherent awakening ceremony).","x-uiWidget":"textarea","useForAI":true},"The Trash Deck / Hidden Archetype":{"type":"string","title":"The Hidden Archetype","description":"What strategy do they use that others think is useless? (e.g., A deck based entirely on ''Discard'' mechanics, or a ''Curse'' deck that hurts the user).","x-uiWidget":"textarea","useForAI":true},"Core Selling Point":{"type":"string","title":"Core Selling Point","description":"What makes the reader want to read? (e.g., Watch the MC break the world''s meta with a cheap 1-mana combo).","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id, 1, 1, 'setting', NOW()
) ON DUPLICATE KEY UPDATE description_en = VALUES(description_en), json_schema_en = VALUES(json_schema_en), updated_at = NOW();

-- 2.2 Core Premise (setting, singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '核心设定',
  'Core Premise',
  'Defines the protagonist''s background, their overarching goal, and their unique Golden Finger.',
  '{"type":"object","required":["Golden Finger"],"properties":{"Protagonist Archetype":{"type":"string","title":"Protagonist Archetype","enum":["The Ex-Pro Card Gamer reincarnated","The Underdog with a cursed deck","The Crafter/Card-smith","The Academy Dropout"],"x-uiWidget":"select","useForAI":true},"Golden Finger":{"type":"string","title":"System Advantage (Golden Finger)","description":"Their unique cheat. (e.g., The ability to fuse any two cards, the ability to see the hidden drop-rates of monsters).","x-uiWidget":"textarea","useForAI":true},"Primary Goal":{"type":"string","title":"Primary Goal","enum":["Winning the Continental Tournament","Becoming a Mythic Deck Master","Defeating the Card Gods/System","Surviving the Tower/Dungeons"],"x-uiWidget":"select","useForAI":true}}}',
  @method_id, 1, 1, 'setting', NOW()
) ON DUPLICATE KEY UPDATE description_en = VALUES(description_en), json_schema_en = VALUES(json_schema_en), updated_at = NOW();

-- 2.3 System Mechanics (setting, singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '卡牌系统机制',
  'Card System Mechanics',
  'The strict rules of combat: Mana costs, deck size, and turn mechanics.',
  '{"type":"object","required":["Mana/Cost Mechanics"],"properties":{"Mana/Cost Mechanics":{"type":"string","title":"Mana & Resource Rules","description":"How is magic paid for? (e.g., Fixed 10 mana per fight, or mana regenerates over time, or physical stamina equates to mana).","x-uiWidget":"textarea","useForAI":true},"Deck Size & Hand Rules":{"type":"string","title":"Deck Limits & Drawing","description":"How many cards can they equip? Do they have to ''draw'' them randomly from a mental deck, or are they inscribed on their body?","x-uiWidget":"textarea","useForAI":true},"Card Tiers & Rarity":{"type":"string","title":"Card Rarity System","description":"Common, Rare, Epic, Legendary, Mythic. How hard is it to get a higher tier?","x-uiWidget":"textarea","useForAI":true},"Card Acquisition":{"type":"string","title":"Acquisition Method","description":"How do new cards appear? (e.g., Loot drops from monsters, bought in shops, or crafted from monster souls).","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id, 1, 1, 'setting', NOW()
) ON DUPLICATE KEY UPDATE description_en = VALUES(description_en), json_schema_en = VALUES(json_schema_en), updated_at = NOW();

-- 2.4 Worldbuilding (setting, singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '世界观',
  'Worldbuilding',
  'The society shaped by the Card System.',
  '{"type":"object","required":["The Social Hierarchy"],"properties":{"World Concept":{"type":"string","title":"World Concept","enum":["A world where Wars are settled by Card Duels","A brutal dungeon-diving world using card magic","A modern society where cards replaced technology"],"x-uiWidget":"select","useForAI":true},"The Social Hierarchy":{"type":"string","title":"Social Hierarchy","description":"How do cards determine status? (e.g., Nobles hoard all the Legendary cards; commoners are stuck with junk 1-mana cards).","x-uiWidget":"textarea","useForAI":true},"Major Threats/Dungeons":{"type":"string","title":"Major Threats","description":"What are the main enemies? Are they rogue monsters, or other Deck Masters?","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id, 1, 1, 'setting', NOW()
) ON DUPLICATE KEY UPDATE description_en = VALUES(description_en), json_schema_en = VALUES(json_schema_en), updated_at = NOW();

-- 2.5 Writing Style (setting, singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '文风设定',
  'Writing Style',
  'Tone and focus, ensuring combat feels like a tense tactical game rather than mindless action.',
  '{"type":"object","required":["Combat Focus"],"properties":{"Narrative POV":{"type":"string","title":"Narrative POV","enum":["First Person","Third Person Limited"],"x-uiWidget":"radio","useForAI":true},"Crunchiness Level":{"type":"string","title":"Crunchiness Level","enum":["High (Constant card text boxes and mana calculations)","Medium (Focus on key combo moments)"],"x-uiWidget":"radio","useForAI":true},"Combat Focus":{"type":"string","title":"Combat Focus","description":"MUST emphasize the logic: sequence of play, managing mana, predicting the opponent's deck, and the thrill of the ''top deck'' draw.","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id, 1, 1, 'setting', NOW()
) ON DUPLICATE KEY UPDATE description_en = VALUES(description_en), json_schema_en = VALUES(json_schema_en), updated_at = NOW();

-- 2.6 Character (character, non-singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '角色',
  'Character',
  'Rivals, companions, and elite Duelists.',
  '{"type":"object","x-titleField":"Name","required":["Name","Deck Archetype"],"properties":{"Name":{"type":"string","title":"Name","useForAI":true},"Role":{"type":"string","title":"Role","enum":["The Protagonist (MC)","Rival/Arrogant Noble","Ally/Support Deck","Tournament Boss","Card Appraiser/Merchant"],"x-uiWidget":"select","useForAI":true},"Deck Archetype":{"type":"string","title":"Deck Archetype/Theme","description":"What kind of deck do they play? (e.g., Heavy Armor + Taunt, Fast Aggro Goblins, Control/Counter-spell).","x-uiWidget":"textarea","useForAI":true},"Personality & Attitude":{"type":"string","title":"Personality","description":"Are they an elitist who only uses Epic cards, or a creative genius?","x-uiWidget":"textarea","useForAI":true},"Relationship to MC":{"type":"string","title":"Current Relationship","isDynamic":true},"Current Power/Rank":{"type":"string","title":"Current Rank","isDynamic":true}}}',
  @method_id, 1, 0, 'character', NOW()
) ON DUPLICATE KEY UPDATE description_en = VALUES(description_en), json_schema_en = VALUES(json_schema_en), updated_at = NOW();

-- 2.7 Faction (organization, non-singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '阵营',
  'Faction',
  'Card academies, guilds, and noble houses hoarding rare cards.',
  '{"type":"object","x-titleField":"Faction Name","required":["Faction Name"],"properties":{"Faction Name":{"type":"string","title":"Faction Name","useForAI":true},"Faction Type":{"type":"string","title":"Faction Type","enum":["Elite Card Academy","Underground Duel Ring","Major Noble House","Card Crafters Guild","Mercenary Deck-divers"],"x-uiWidget":"select","useForAI":true},"Core Philosophy":{"type":"string","title":"Deck Philosophy","description":"Do they believe in pay-to-win, or pure synergy? Do they restrict forbidden magic cards?","x-uiWidget":"textarea","useForAI":true},"Key Assets":{"type":"string","title":"Key Assets/Cards","description":"Do they hold a monopoly on a specific type of card or dungeon?","x-uiWidget":"textarea","useForAI":true},"Threat Level to MC":{"type":"string","title":"Current Threat/Stance","isDynamic":true}}}',
  @method_id, 1, 0, 'organization', NOW()
) ON DUPLICATE KEY UPDATE description_en = VALUES(description_en), json_schema_en = VALUES(json_schema_en), updated_at = NOW();

-- 2.8 Scene (scene, non-singleton)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '场景',
  'Scene',
  'Arenas, card shops, and the dungeons where booster packs drop.',
  '{"type":"object","x-titleField":"Location Name","required":["Location Name"],"properties":{"Location Name":{"type":"string","title":"Location Name","useForAI":true},"Location Type":{"type":"string","title":"Location Type","enum":["Tournament Arena","The Card Shop/Market","A Specific Dungeon Floor","Academy Training Ground"],"x-uiWidget":"select","useForAI":true},"Atmosphere / Tension":{"type":"string","title":"Atmosphere","description":"The roar of the crowd, or the eerie silence of a dungeon before a boss fight.","x-uiWidget":"textarea","useForAI":true},"Specific Mechanics/Rules":{"type":"string","title":"Local Mechanics (If any)","description":"Does the arena block certain card types? Does the dungeon boost fire cards?","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id, 1, 0, 'scene', NOW()
) ON DUPLICATE KEY UPDATE description_en = VALUES(description_en), json_schema_en = VALUES(json_schema_en), updated_at = NOW();

-- 2.9 Prop (prop - Single Cards)
INSERT INTO module_type (name_zh, name_en, description_en, json_schema_en, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '单卡/卡包',
  'Single Card / Booster Pack',
  'The most important element: The Cards. Spells, Summons, or Equipment.',
  '{"type":"object","x-titleField":"Card Name","required":["Card Name","Mana Cost","Rarity"],"properties":{"Card Name":{"type":"string","title":"Card Name","useForAI":true},"Rarity":{"type":"string","title":"Rarity","enum":["Common","Uncommon","Rare","Epic","Legendary","Mythic","Cursed/Forbidden"],"x-uiWidget":"select","useForAI":true},"Card Type":{"type":"string","title":"Card Type","enum":["Summon/Minion","Spell/Action","Equipment/Artifact","Field/Environment","Reaction/Trap"],"x-uiWidget":"select","useForAI":true},"Mana Cost":{"type":"string","title":"Mana/Resource Cost","description":"How much does it cost to play? (e.g., 2 Mana, or ''Sacrifice 1 Summon'').","x-uiWidget":"textarea","useForAI":true},"Card Text/Effect":{"type":"string","title":"Card Text/Effect","description":"The literal effect. (e.g., ''Deal 3 Fire damage. If the target is burning, draw 1 card'').","x-uiWidget":"textarea","useForAI":true},"Synergy Potential":{"type":"string","title":"Synergy Potential","description":"Why is this card good in the MC''s deck?","x-uiWidget":"textarea","useForAI":true},"Current Owner":{"type":"string","title":"Current Owner","isDynamic":true}}}',
  @method_id, 1, 0, 'prop', NOW()
) ON DUPLICATE KEY UPDATE description_en = VALUES(description_en), json_schema_en = VALUES(json_schema_en), updated_at = NOW();
