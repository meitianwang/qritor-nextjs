-- The Deckbuilder LitRPG Skills (Layer 3)
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-deckbuilder-all.sql

SET @method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Deckbuilder LitRPG Novel' LIMIT 1);

-- 1. Story Hook Setting Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'deckbuilder-story-hook-setting-gen',
  'Generate "Story Hook": How the MC discovers their broken card synergy',
  'Generate "Story Hook": Design the Deckbuilder LitRPG introduction',
  '## "Story Hook" Generation — Deckbuilder LitRPG

  Design the awakening of the card user.
  - **The First Draw**: The moment of pack-opening dopamine. Did they find a dusty booster pack in a goblin cave, or did they awaken a rare innate card?
  - **The Hidden Archetype**: Everyone thinks the MC''s cards are "Trash Tier" (e.g., Curse cards, Self-damage cards, 0-cost 1-damage cards). But the MC knows the broken unlimited combo.
  - **Core Selling Point**: Emphasize the satisfaction of outsmarting pay-to-win nobles with a strategically assembled deck built from scraps.',
  '## "Story Hook" Generation — Deckbuilder LitRPG

  Design the awakening of the card user.
  - **The First Draw**: The moment of pack-opening dopamine. Did they find a dusty booster pack in a goblin cave, or did they awaken a rare innate card?
  - **The Hidden Archetype**: Everyone thinks the MC''s cards are "Trash Tier" (e.g., Curse cards, Self-damage cards, 0-cost 1-damage cards). But the MC knows the broken unlimited combo.
  - **Core Selling Point**: Emphasize the satisfaction of outsmarting pay-to-win nobles with a strategically assembled deck built from scraps.',
  @method_id, 1, 1, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 2. Core Premise Setting Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'deckbuilder-core-premise-setting-gen',
  'Generate "Core Premise": The protagonist''s archetype and unique deck cheat',
  'Generate "Core Premise": Design the card master''s golden finger',
  '## "Core Premise" Generation

  - **Protagonist Archetype**: Often a reincarnated Pro-TCG player in a world where people just use the highest rarity cards with no strategy, or an underdog who crafts their own cards.
  - **Golden Finger**: Unique system cheat. Examples: The ability to fuse three trash cards into one Epic card; seeing the hidden drop-rates of card-monsters; drawing 2 cards per turn instead of 1.',
  '## "Core Premise" Generation

  - **Protagonist Archetype**: Often a reincarnated Pro-TCG player in a world where people just use the highest rarity cards with no strategy, or an underdog who crafts their own cards.
  - **Golden Finger**: Unique system cheat. Examples: The ability to fuse three trash cards into one Epic card; seeing the hidden drop-rates of card-monsters; drawing 2 cards per turn instead of 1.',
  @method_id, 1, 2, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 3. System Mechanics Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'deckbuilder-mechanics-setting-gen',
  'Generate "Mechanics": Mana curve, deck limits, and card rarity rules',
  'Generate "Mechanics": Define strict rules for mana, drawing cards, and rarity',
  '## "Card System Mechanics" Generation

  Strict LitRPG data rules.
  - **Mana/Cost**: Is mana fixed per battle (e.g., 10 crystals) or does it regenerate? This dictates the "Mana Curve" strategy of the deck.
  - **Deck Size**: Can they hold 30 cards? 40? Do they draw mental cards, or do they hold physical glowing cards?
  - **Card Acquisition**: Looting booster packs from slain bosses, buying them from Academy Shops, or inscribing them with monster blood.',
  '## "Card System Mechanics" Generation

  Strict LitRPG data rules.
  - **Mana/Cost**: Is mana fixed per battle (e.g., 10 crystals) or does it regenerate? This dictates the "Mana Curve" strategy of the deck.
  - **Deck Size**: Can they hold 30 cards? 40? Do they draw mental cards, or do they hold physical glowing cards?
  - **Card Acquisition**: Looting booster packs from slain bosses, buying them from Academy Shops, or inscribing them with monster blood.',
  @method_id, 1, 3, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 4. Writing Style Setting Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'deckbuilder-writing-style-setting-gen',
  'Generate "Writing Style": Focuses on tactical card sequencing and infinite combos',
  'Generate "Writing Style": Emphasizes TCG tactics, sequencing, and the "top deck"',
  '## "Writing Style" Generation

  - **Combat Focus/Crunchiness**: Very Crunchy. Combat shouldn''t just be "I hit him hard." It must follow the sequence of card plays.
  - Example: "He spent 2 mana to play [Ignite], triggering the passive of his [Ash Golem] to draw a card, which perfectly gave him the 1-mana [Execute] he needed for lethal."
  - **Tension**: Managing the hand size, counting opponent''s mana, and the classic "Heart of the Cards" top-deck top-draw tension.',
  '## "Writing Style" Generation

  - **Combat Focus/Crunchiness**: Very Crunchy. Combat shouldn''t just be "I hit him hard." It must follow the sequence of card plays.
  - Example: "He spent 2 mana to play [Ignite], triggering the passive of his [Ash Golem] to draw a card, which perfectly gave him the 1-mana [Execute] he needed for lethal."
  - **Tension**: Managing the hand size, counting opponent''s mana, and the classic "Heart of the Cards" top-deck top-draw tension.',
  @method_id, 1, 5, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 5. Character Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'deckbuilder-character-gen',
  'Character Generation: Arrogant Pay-to-Win nobles, synergistic allies',
  'Character Generation: Pay-to-win duelists, creative allies, academy teachers',
  '## Character Generator for Deckbuilder

  - **Roles**: The Protagonist, Arrogant Nobles, Card Merchants, and Academy Teachers.
  - **Deck Archetype**: Define characters by their decks. A loyal tank uses a "Shield/Taunt/Stalwart" deck. The wealthy villain uses a deck with only Legendary "Pay-to-Win" Dragons that lack low-mana synergy.
  - **Attitude**: Do they respect deck-building strategy, or do they just throw money at the highest rarity packs?',
  '## Character Generator for Deckbuilder

  - **Roles**: The Protagonist, Arrogant Nobles, Card Merchants, and Academy Teachers.
  - **Deck Archetype**: Define characters by their decks. A loyal tank uses a "Shield/Taunt/Stalwart" deck. The wealthy villain uses a deck with only Legendary "Pay-to-Win" Dragons that lack low-mana synergy.
  - **Attitude**: Do they respect deck-building strategy, or do they just throw money at the highest rarity packs?',
  @method_id, 1, 6, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 6. Prop (Single Card) Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'deckbuilder-prop-gen',
  'Prop Generation: Design balanced or broken magical cards with specific mana costs',
  'Prop Generation: Design spells, summons, and artifacts as literal TCG cards',
  '## Prop (Card) Generator for Deckbuilder

  This is replacing traditional spells and equipment.
  - **Rarity & Cost**: E.g., Rare, 3 Mana.
  - **Card Type**: Summon (creates a monster), Spell (instant magic), Equipment (equips a weapon), Field (changes terrain), Reaction (trap cards).
  - **Card Effect**: MUST be written clearly like a TCG card. E.g., [Draw 2 cards. Take 5 damage.] or [Summon a 2/2 Goblin. Whenever a Goblin dies, gain 1 Mana].
  - **Synergy**: Why is the MC collecting this? What combo does it enable?',
  '## Prop (Card) Generator for Deckbuilder

  This is replacing traditional spells and equipment.
  - **Rarity & Cost**: E.g., Rare, 3 Mana.
  - **Card Type**: Summon (creates a monster), Spell (instant magic), Equipment (equips a weapon), Field (changes terrain), Reaction (trap cards).
  - **Card Effect**: MUST be written clearly like a TCG card. E.g., [Draw 2 cards. Take 5 damage.] or [Summon a 2/2 Goblin. Whenever a Goblin dies, gain 1 Mana].
  - **Synergy**: Why is the MC collecting this? What combo does it enable?',
  @method_id, 1, 9, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 7. Plot Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'deckbuilder-plot-gen',
  'Plot Design: Deck tuning, dungeon diving for booster packs, and academy tournaments',
  'Plot Design: Drafting cards, dungeon loot runs, and epic tournament battles',
  '## Plot Generator for Deckbuilder

  - **The Booster Dive**: Going into a dangerous dungeon just to hunt a specific boss because it has a 5% chance to drop the exact Epic Reaction Card the MC needs to finish their combo.
  - **The Deck Tuning**: Slice-of-life chapters testing new cards against low-level mobs, checking the mana curve.
  - **The Tournament Arc**: Essential to the genre. The MC registers for the Academy or Guild Duel Tournament. They face opponents with expensive "wallet decks" and systematically pick them apart with an infinite looping combo that costs pennies.
  - **The Draft**: A unique survival trial where characters start with no cards and must draft a deck from random pools as they ascend a tower.',
  '## Plot Generator for Deckbuilder

  - **The Booster Dive**: Going into a dangerous dungeon just to hunt a specific boss because it has a 5% chance to drop the exact Epic Reaction Card the MC needs to finish their combo.
  - **The Deck Tuning**: Slice-of-life chapters testing new cards against low-level mobs, checking the mana curve.
  - **The Tournament Arc**: Essential to the genre. The MC registers for the Academy or Guild Duel Tournament. They face opponents with expensive "wallet decks" and systematically pick them apart with an infinite looping combo that costs pennies.
  - **The Draft**: A unique survival trial where characters start with no cards and must draft a deck from random pools as they ascend a tower.',
  @method_id, 1, 11, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 8. Narrative Writing
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'deckbuilder-narrative',
  'Narrative Writing: Writing tense card draws, mana counting, and explosive combos',
  'Narrative Writing: Emphasizing game logic, card effects, and opponent misplays',
  '## Narrative Writing for Deckbuilder

  - **Card Interactions / System Prompts**: Visually distinguish card names. Use brackets: [Fireball] or <<Ice Wall>>.
  - **The Anatomy of a Turn**: Break down the action. 1. Draw Step (The tension of needing the perfect top deck). 2. Resource Management ("He had 4 mana left... Not enough for the dragon, but enough for a trap"). 3. The Bait (Tricking the enemy into playing their counter-spell early).
  - **The Climax**: Instead of screaming and swinging a sword harder, the climax is the MC revealing the final piece of the combo. "You thought my deck was full of garbage self-damage cards? I activate [Masochist''s Reward]..."',
  '## Narrative Writing for Deckbuilder

  - **Card Interactions / System Prompts**: Visually distinguish card names. Use brackets: [Fireball] or <<Ice Wall>>.
  - **The Anatomy of a Turn**: Break down the action. 1. Draw Step (The tension of needing the perfect top deck). 2. Resource Management ("He had 4 mana left... Not enough for the dragon, but enough for a trap"). 3. The Bait (Tricking the enemy into playing their counter-spell early).
  - **The Climax**: Instead of screaming and swinging a sword harder, the climax is the MC revealing the final piece of the combo. "You thought my deck was full of garbage self-damage cards? I activate [Masochist''s Reward]..."',
  @method_id, 1, 12, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 9. Novel Naming
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'deckbuilder-novel-naming',
  'Novel Naming: Titles focusing on cards, decks, shuffling, and drawing',
  'Novel Naming: Titles capturing TCG mechanics, decks, and awakening',
  '## Novel Naming for Deckbuilder

  - **Titles MUST include card terms**: Deck, Hand, Draw, Shuffle, Card, Summoner, Mana.
  - Examples: *A Summoner Awakens*, *All the Skills*, *The Infinite Deck*, *Goblin Cards*, *Shuffling the Apocalypse*, *The Trash-Tier Deckbuilder*.
  - **Synopsis**: "In a world where magic is governed by Cards and your Rarity dictates your social class, Arthur awoke with a blank deck. To survive the Tower, he won''t rely on pulling Legendary dragons like the arrogant nobles. He''ll rely on math, mana curves, and an infinite combo made entirely of 1-mana common cards that no one else wanted."',
  '## Novel Naming for Deckbuilder

  - **Titles MUST include card terms**: Deck, Hand, Draw, Shuffle, Card, Summoner, Mana.
  - Examples: *A Summoner Awakens*, *All the Skills*, *The Infinite Deck*, *Goblin Cards*, *Shuffling the Apocalypse*, *The Trash-Tier Deckbuilder*.
  - **Synopsis**: "In a world where magic is governed by Cards and your Rarity dictates your social class, Arthur awoke with a blank deck. To survive the Tower, he won''t rely on pulling Legendary dragons like the arrogant nobles. He''ll rely on math, mana curves, and an infinite combo made entirely of 1-mana common cards that no one else wanted."',
  @method_id, 1, 13, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 10. Entity Naming
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'deckbuilder-entity-naming',
  'Entity Naming: Naming card archetypes, booster packs, and card abilities',
  'Entity Naming: Designing TCG spell names, deck archetypes, and packs',
  '## Entity Naming for Deckbuilder

  - **Deck Archetypes**: Named like TCG meta decks. "Aggro Beast-Swarm", "Ice-Barrier Control", "Mill/Discard Burn".
  - **Card Names**: Need to sound like collectible game cards. [Goblin Scrap-Collector], [Echo of the Fire Lord], [Forbidden Sacrifice], [Aura of Rust].
  - **Booster/Dungeon Packs**: The loot drops should sound enticing. "The Obsidian Depths Booster", "A [Rare] Core-Set Pack".',
  '## Entity Naming for Deckbuilder

  - **Deck Archetypes**: Named like TCG meta decks. "Aggro Beast-Swarm", "Ice-Barrier Control", "Mill/Discard Burn".
  - **Card Names**: Need to sound like collectible game cards. [Goblin Scrap-Collector], [Echo of the Fire Lord], [Forbidden Sacrifice], [Aura of Rust].
  - **Booster/Dungeon Packs**: The loot drops should sound enticing. "The Obsidian Depths Booster", "A [Rare] Core-Set Pack".',
  @method_id, 1, 14, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();
