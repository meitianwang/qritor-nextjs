-- -----------------------------------------------------------------------------
-- System Apocalypse AI Generation Skills Layer 3 SQL
-- -----------------------------------------------------------------------------

SET @method_id = 79; 

-- ============================================================================
-- 1. Setting Content Generation Skills (-setting-gen)
-- ============================================================================

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'system-apoc-story-hook-setting-gen',
  'Generate the integration event where the world ends and stats begin (English)',
  '"Story Hook" setting generation for System Apocalypse',
  '## "Story Hook" Setting Generation — System Apocalypse\n\n...',
  '## "Story Hook" Setting Generation — System Apocalypse\n\nThe genre lives on the sudden, violent transition from modern civilization to a ruthless game world.\n\n### Field Guidelines\n\n#### The Initial Blue Screen\nThis is iconic. It should be cold, mechanical, and devastating. Examples: "Protocol 42 initiated. Earth integration commencing. Mana density rising. Tutorial monsters deploying in 3... 2... 1..."\n\n#### First Blood\nThe most crucial scene. The protagonist must survive their first encounter using modern mundane items in a brutal way (e.g., stabbing a level 2 Slime with a broken mop handle, running over a Goblin with a sedan) before they unlock their class or inventory.\n\n#### The Exploit\nSystem Apocalypse protagonists are often OP (Overpowered) because they find a loophole early on. Did they discover a hidden "First Kill Achievement" that grants double stats? Did they bring modern knowledge into the tutorial to cheese the boss?',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description_en = VALUES(description_en), instructions_en = VALUES(instructions_en);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'system-apoc-world-setting-gen',
  'Generate the mechanics of the System and how it ruined Earth (English)',
  '"Worldview" setting generation for System Apocalypse',
  '## "Worldview" Setting Generation — System Apocalypse\n\n...',
  '## "Worldview" Setting Generation — System Apocalypse\n\nThe world-building is a mix of post-apocalyptic survival (scavenging for food, broken power grids) and RPG mechanics (skill trees, respawn points).\n\n### Field Guidelines\n\n#### Class and Stat Mechanics\nBe specific about the "crunch". Are the stats Strength, Agility, Intelligence? Do classes evolve at level 10? Mention how society stratifies based on classes (e.g., Healers become VIPs held hostage by gangs, Necromancers are feared).\n\n#### The Collapse of Modern Tech\nThe System usually nerfs human technology so swords and magic take over. Provide the reason: e.g., "Mana interferes with gunpowder ignition" or "Monsters above level 15 have biological shields that deflect bullets, forcing close-quarters combat."',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description_en = VALUES(description_en), instructions_en = VALUES(instructions_en);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'system-apoc-style-setting-gen',
  'Generate the LitRPG narrative style emphasizing stats and visceral combat (English)',
  '"Writing Style" setting generation for System Apocalypse',
  '## "Writing Style" Setting Generation — System Apocalypse\n\n...',
  '## "Writing Style" Setting Generation — System Apocalypse\n\n### Field Guidelines\n\n#### Tone & Focus\nThe narrative must seamlessly weave action-packed, bloody survival scenes with the dopamine hits of "Ding! Level Up!" System prompts. \n\nEnsure that the thrill of acquiring a rare skill book or seeing stats jump from 15 to 20 is just as important as the emotional weight of seeing neighbors turned into zombies. Use brackets for system notifications [Skill Unlocked: Dash Lvl 1] to heighten the game-like feel.',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description_en = VALUES(description_en), instructions_en = VALUES(instructions_en);


-- ============================================================================
-- 2. Character Generation Skill (-character-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'system-apoc-character-gen',
  'Generate survivors, regressions, and their overpowered classes (English)',
  '"Character" generation for System Apocalypse',
  '## "Character" Generation — System Apocalypse\n\n...',
  '## "Character Profile" Generation — System Apocalypse\n\nCharacters are defined not just by their personalities, but by their *builds*. \n\n### Field Guidelines\n\n#### The Pre-Apoc Background vs. Post-Apoc Class\nCreate stark contrasts. The socially awkward IT guy becomes a ruthless Shadow Assassin; the kind kindergarten teacher becomes a heavily armored Beast Tamer using mutated wolves.\n\n#### Build & Unique Skill\nEvery notable character needs a cheat or a highly specialized build. Provide clear mechanics for their skill. (e.g., "Skill: Blood Forbearance. Can sacrifice HP to double spell damage. Combo with high regeneration items.")\n\n#### Moral Alignment\nThe apocalypse separates the sheep from the wolves. Define whether they kill other humans for EXP (Player Killers) or try to uphold the old world\'s laws.',
  @method_id, 1, 21, NOW()
) ON DUPLICATE KEY UPDATE description_en = VALUES(description_en), instructions_en = VALUES(instructions_en);

-- ============================================================================
-- 3. Scene Generation Skill (-scene-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'system-apoc-scene-gen',
  'Generate mutated modern locations transformed into dungeons (English)',
  '"Scene" generation for System Apocalypse',
  '## "Scene" Generation — System Apocalypse\n\n...',
  '## "Dungeon/Location Profile" Generation — System Apocalypse\n\nThe most striking visual of this genre is the collision of the mundane modern world with high-fantasy elements.\n\n### Field Guidelines\n\n#### Modern Environment Twist\nTake a relatable location and mutate it. An underground subway station becomes a multi-level Goblin cavern where the train cars are used as barricades. A high school gymnasium is overgrown with carnivorous alien vines and serves as a Level 5 tutorial zone.\n\n#### The Boss Room\nThe final boss encounter must feature MMORPG mechanics. (e.g., The mutated Gym Teacher boss summons smaller student-zombies and enters an "Enraged Phase" at 30% HP that must be interrupted by destroying the basketball hoops.)',
  @method_id, 1, 22, NOW()
) ON DUPLICATE KEY UPDATE description_en = VALUES(description_en), instructions_en = VALUES(instructions_en);

-- ============================================================================
-- 4. Prop Generation Skill (-prop-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'system-apoc-prop-gen',
  'Generate System loot, skill books, and magical artifacts (English)',
  '"Prop" generation for System Apocalypse',
  '## "Prop" Generation — System Apocalypse\n\n...',
  '## "Loot Profile" Generation — System Apocalypse\n\nLoot is the driving force of the protagonist\'s progression.\n\n### Field Guidelines\n\n#### Item Name & Rarity\nUse standard RPG color-coding or rarity tiers (Common, Uncommon, Rare, Epic, Legendary, Mythic). \n\n#### Item Stats & Effects\nProvide exact numbers and cooldowns. This satisfies the "crunchy" LitRPG readers. (e.g., "[Amulet of the First Blood] Rarity: Epic. Effect: +10 Vitality. Passive: When HP drops below 10%, gain a temporary shield absorbing 500 damage. Cooldown: 24 Hours.")',
  @method_id, 1, 23, NOW()
) ON DUPLICATE KEY UPDATE description_en = VALUES(description_en), instructions_en = VALUES(instructions_en);

-- ============================================================================
-- 5. Organization Generation Skill (-org-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'system-apoc-org-gen',
  'Generate survivor guilds, PKer syndicates, and Safe Zone factions (English)',
  '"Organization" generation for System Apocalypse',
  '## "Organization" Generation — System Apocalypse\n\n...',
  '## "Faction/Guild Profile" Generation — System Apocalypse\n\nWhen the government falls, new power structures arise based on Levels and Classes.\n\n### Field Guidelines\n\n#### Faction Ideology\nDescribe how they survive the apocalypse. \n- Player Killers (PKers): They hunt other humans because human EXP yields better loot than monsters.\n- The Military Remnant: Trying to maintain order using guns until bullets run out, struggling against high-level magic users.\n- The Corporate Guild: Former billionaires who hired high-level players as bodyguards and monopolize System Shops and Safe Zones by charging "Mana stones" for entry.',
  @method_id, 1, 25, NOW()
) ON DUPLICATE KEY UPDATE description_en = VALUES(description_en), instructions_en = VALUES(instructions_en);

-- ============================================================================
-- 6. Plot Design Skill (-plot-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'system-apoc-plot-gen',
  'Plot design guidelines for surviving the integration and power leveling (English)',
  '"Plot Design" domain knowledge for System Apocalypse',
  '## "Plot Design" Domain Knowledge — System Apocalypse\n\n...',
  '## "Plot Design" Domain Knowledge — System Apocalypse\n\nThe plot is primarily driven by survival and rapid progression in power (leveling up).\n\n### Core Plot Structure\n1. **The Integration/Tutorial**: The world ends. The protagonist is separated from safety. They must secure their first kill, overcome extreme odds (often discovering their "cheat" skill), and survive the initial tutorial phase.\n2. **The First Dungeon & Gearing Up**: The protagonist ventures into a mutated reality "Dungeon" (e.g., a subway station). They gather their first party members, secure rare loot/class advancements, and establish a base.\n3. **Faction Conflict & Safe Zones**: Human enemies emerge. A corrupt guild or PKer syndicate tries to take over the local Safe Zone. The protagonist must use their overpowered build to crush the human opposition.\n4. **The Wave/Raid Boss Event**: The System announces a massive monster wave or a World Boss. The protagonist must rally the survivors or solo the boss, cementing their status as a regional powerhouse and unlocking the next Tier of the universe.\n\n### Mistakes to Avoid\n- ❌ Skipping the stats. LitRPG readers want to see numbers go up. \n- ❌ Making the protagonist too passive. They must be proactive min-maxers exploiting the System.',
  @method_id, 1, 30, NOW()
) ON DUPLICATE KEY UPDATE description_en = VALUES(description_en), instructions_en = VALUES(instructions_en);

-- ============================================================================
-- 7. Entity Naming Skill (-entity-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'system-apoc-entity-naming',
  'Guidance on naming gamer classes, system prompts, and mutated monsters (English)',
  '"Entity Naming": professional naming guidance for System Apocalypse',
  '## Entity Naming — System Apocalypse\n\n...',
  '## Entity Naming — System Apocalypse\n\nNames should blend classic MMORPG tropes with modern, gritty realism.\n\n### Classes & Titles\nKeep them punchy and game-like. Add rarity qualifiers for impact.\n- Examples: *[Mythic] Void Spellblade*, *[Rare] Iron-blood Berserker*, *The First to Slay a Dragon (Title)*.\n\n### Monsters & Dungeons\nBlend the setting with the monster type.\n- Monsters: *Corrupted Asphalt Golem*, *Level 15 Feral Commuter*, *Phase Spider*.\n- Dungeons: *[Instance] The Ruined Subway*, *The Blood-Soaked Supermarket*.\n\nAvoid overly poetic fantasy names. The System categorizes things bluntly and clinically.',
  @method_id, 1, 36, NOW()
) ON DUPLICATE KEY UPDATE description_en = VALUES(description_en), instructions_en = VALUES(instructions_en);

-- ============================================================================
-- 8. Narrative Skill (-narrative)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'system-apoc-narrative',
  'Guidelines on writing visceral action combined with blue screen pop-ups (English)',
  'Narrative writing guidance for System Apocalypse',
  '## Narrative guidance — System Apocalypse\n\n...',
  '## Narrative Writing Guidance — System Apocalypse\n\n### 1. Integrating the "Blue Screens"\nThe prose must seamlessly interrupt the prose with System prompts. This is the hallmark of LitRPG.\n*Example:* I pulled the fire axe out of the goblin\'s skull, panting heavily as black blood stained my office shirt. \n**[Ding!]**\n**[You have slain a Level 2 Hobgoblin. +50 EXP]**\n**[Level Up! You are now Level 3. Select your Class Advancement.]**\n\n### 2. Pragmatic, Survivalist Prose\nThe narrative voice should be pragmatic. Focus on inventory management, stamina conservation, and analyzing monster attack patterns. The protagonist isn\'t composing poetry; they are doing math to see if they can survive the next hit.',
  @method_id, 1, 101, NOW()
) ON DUPLICATE KEY UPDATE description_en = VALUES(description_en), instructions_en = VALUES(instructions_en);

-- ============================================================================
-- 9. Novel Naming Skill (-novel-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'system-apoc-novel-naming',
  'Generate LitRPG titles emphasizing progression, regression, or survival (English)',
  '"Novel Naming": title generation for System Apocalypse',
  '## Novel Naming — System Apocalypse\n\n...',
  '## Novel Naming — System Apocalypse\n\n### Popular Title Structures\n\n**Format 1: The "Class / Deed" Statement**\nVery common in web fiction platforms (e.g., Royal Road, Webnovel).\n- Examples: *The Primal Hunter*, *He Who Fights With Monsters*, *Defiance of the Fall*, *The Legend of Randidly Ghosthound*.\n\n**Format 2: The Action + The System Tropes**\nExplicitly telling the reader what the gimmick is.\n- Examples: *My Apocalypse Inventory*, *Leveling Up In The Ruins*, *Return of the SSS-Class Ranker*.\n\n### Blurb (Synopsis) Structure\nThe blurb should tell the reader exactly what the protagonist\'s "cheat" or starting point is, and promise lots of action.\n"When the blue screens descended and the mana waves hit, most of humanity died instantly. I was just an accountant in downtown Chicago. But when a Level 5 Orc spawned in my cubicle, I didn\'t run. I stabbed it in the eye with a customized letter opener. Now, I\'ve unlocked the hidden [Spellblade] class, and the System isn\'t ready for someone who knows how to exploit the tutorial rules. Earth is a dungeon now. Time to grind."',
  @method_id, 1, 35, NOW()
) ON DUPLICATE KEY UPDATE description_en = VALUES(description_en), instructions_en = VALUES(instructions_en);
