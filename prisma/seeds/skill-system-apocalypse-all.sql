-- The System Apocalypse Novel Skills (Layer 3)
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-system-apocalypse-all.sql

SET @method_id = (SELECT id FROM novel_creation_method WHERE name = 'The System Apocalypse Novel' LIMIT 1);

-- 1. Story Hook Setting Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'system-apocalypse-story-hook-setting-gen',
  '生成「Story Hook」：设计系统降临地球的瞬间和主角的破局点',
  'Generate "Story Hook": Design the moment the System arrives on Earth and the protagonist''s breakout moment',
  '## "Story Hook" Generation — The System Apocalypse Novel

  决定末世开局那一刻的残酷感。

  ### Field Generation Guide
  - **The Arrival**: 系统是如何降临的？（如蓝屏提示、血月降临、全人类脑海中的机械音）。
  - **First Blood**: 主角如何在新规则下的头24小时内拿到自己的核心优势？（例如反杀哥布林抢了稀有技能书，或者利用现代步枪在系统初期卡bug杀怪）。
  - **Core Selling Point**: 小说的卖点是孤狼求生、无敌幸运还是极限硬核数字流？
  - **Reader Expectation**: 读者期待看到枪械狂扫初级怪物、系统面板加点的爽感、社会秩序崩塌导致的人性碰撞。',
  '## "Story Hook" Generation — The System Apocalypse Novel

  Determine the brutal opening moment of the apocalypse.

  ### Field Generation Guide
  - **The Arrival**: How does the System announce itself? (e.g., A floating blue screen, a blood moon, a robotic voice in everyone''s minds).
  - **First Blood**: How does the protagonist gain their first edge within the first 24 hours? (e.g., Killing a goblin, stealing a skill book, or using a modern rifle to cheese initial monsters).
  - **Core Selling Point**: Is it lone-wolf survival, insane luck, or hardcore min-maxing?
  - **Reader Expectation**: The thrill of modern weapons mowing down low-level monsters, stat sheet progression, and human conflict as society collapses.',
  @method_id,
  1,
  1,
  NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 2. Core Premise Setting Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'system-apocalypse-core-premise-setting-gen',
  '生成「Core Premise」：设计末世流主角的原型、生存目标和外挂',
  'Generate "Core Premise": Design the apocalypse survival protagonist''s archetype, goals, and golden finger',
  '## "Core Premise" Generation

  末日求生必须有明确的动力和清晰的金手指。

  ### Field Generation Guide
  - **Protagonist Archetype**: 是早有准备的生存狂、精通游戏的网游高玩、还是冷酷的退伍军人？
  - **The Golden Finger**: 系统给予的不平衡优势。例如：能看穿隐藏属性的代码眼、唯一的S级隐藏职业、或者是重生者的先知记忆。
  - **Primary Goal**: 是建立唯一的安全港、单纯的找寻亲人、还是打算在系统排行榜上登顶？
  - **Moral Compass in the Apocalypse**: 不必全是反派，但必须杀伐果断。（例如：“可以救人但不带废人”、“不惹事但绝不怕事”的末世铁血法则）。',
  '## "Core Premise" Generation

  Apocalypse survival requires clear motivation and a distinct golden finger.

  ### Field Generation Guide
  - **Protagonist Archetype**: Prepper, hardcore min-max gamer, or ruthless military vet?
  - **The Golden Finger**: The unfair system advantage. Examples: A code-reading eye, a unique S-rank hidden class, or a Regressor''s future knowledge.
  - **Primary Goal**: Build the ultimate safe zone, find family, or top the system ladder?
  - **Moral Compass in the Apocalypse**: Gritty pragmatism. (e.g., "Will rescue but won''t carry dead weight," "Does not initiate but ruthless in retaliation").',
  @method_id,
  1,
  2,
  NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 3. The System Mechanics Setting Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'system-apocalypse-system-mechanics-setting-gen',
  '生成「System Mechanics」：设计数值化的系统规则和热兵器与魔法的冲突',
  'Generate "System Mechanics": Design the gamified rules and the clash of firearms vs magic',
  '## "System Mechanics" Generation

  这是 LitRPG 的灵魂：明确的升级体系。

  ### Field Generation Guide
  - **System Type**: 是传统的属性面板+技能系统？还是修仙大道的数据化变体？
  - **Progression Rules**: 是打怪掉落经验光球，还是吸取魔力？职业能否进阶？技能能否融合？
  - **Modern Tech vs Magic** (核心爽点)：非常重要！枪枝在初期是不是无敌？到了10级之后普通子弹是否连史莱姆的皮都打不穿？有没有系统强化的现代武器（比如给狙击枪附个魔）？',
  '## "System Mechanics" Generation

  The soul of LitRPG: The progression system.

  ### Field Generation Guide
  - **System Type**: Standard Stats+Skills? Or a gamified variant of cultivation/mutations?
  - **Progression Rules**: Killing monsters for XP orbs? Can classes evolve? Can you merge skills?
  - **Modern Tech vs Magic (Crucial)**: Are firearms overpowered in the tutorial? Do standard bullets bounce off level 10 monsters? Are there system-modified firearms (e.g., a sniper rifle that consumes mana)?',
  @method_id,
  1,
  3,
  NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 4. World & Society Collapse Setting Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'system-apocalypse-world-collapse-setting-gen',
  '生成「World & Society Collapse」：刻画地球地形的变异、怪物潮和社会的迅速崩坏',
  'Generate "World & Society Collapse": Depict Earth''s mutated terrain, monster outbreaks, and rapid societal collapse',
  '## "World & Society Collapse" Generation

  展现从现代文明堕入黑暗森林的绝望感。

  ### Field Generation Guide
  - **Terrain Alteration**: 高楼变成地牢、公路被深渊切断、植被疯狂生长吞噬城市。
  - **The Monsters**: 外太空降维打击的外星异形？还是经典奇幻的哥布林兽人潮？
  - **Fall of the Old World**: 政府是怎么瘫痪的？（是不是 EMP 让所有电子设备失效，或者国家领导人全死在了初级地牢里？）。
  - **New Social Order**: 幸存者的抱团方式。拥有高级战斗职业的人成为新的暴君，或者基于等级建立的封建聚集地。',
  '## "World & Society Collapse" Generation

  Showcase the despair of a modern civilization falling into a dark forest.

  ### Field Generation Guide
  - **Terrain Alteration**: Skyscrapers turning into dungeons, highways split by chasms, aggressive flora eating cities.
  - **The Monsters**: Alien mutants or classic fantasy goblin hordes?
  - **Fall of the Old World**: How did governments paralyze? (EMPs killing tech, or world leaders dying in the first tutorial rooms).
  - **New Social Order**: How survivors group up. High-level combat classes becoming new warlords, or leveling-based feudal camps.',
  @method_id,
  1,
  4,
  NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 5. Writing Style Setting Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'system-apocalypse-writing-style-setting-gen',
  '生成「Writing Style」：指导数据流末世文的行文节奏甚至面板出现的频率',
  'Generate "Writing Style": Directs the narrative pacing and frequency of stat sheets for LitRPG survival',
  '## "Writing Style" Generation

  确定“硬核数据流”还是“动作求生流”。

  ### Field Generation Guide
  - **Crunchiness Level**: "硬核"意味着正文中经常出现详尽无比的属性面板计算；"轻度"则只在关键升级时报一下获得了什么新技能。
  - **Prose Tone**: 求生时的压抑感、战斗爆血浆的动感、或者是主角吐槽坑爹系统时的黑色幽默。
  - **Focus Areas**: 侧重点是建立基地、爽快割草怪物、还是人与人生死相搏的人性描写。',
  '## "Writing Style" Generation

  Determine if this is "Crunchy LitRPG" or "Action Survival".

  ### Field Generation Guide
  - **Crunchiness Level**: "Crunchy" means detailed stat sheets and math in the text; "Lite" means only reporting major skill unblocks.
  - **Prose Tone**: Gritty survival tension, visceral bloody action, or sarcastic/cynical humor against the System.
  - **Focus Areas**: Base building, satisfying massive monster slaughter, or ruthless human-on-human survival conflicts.',
  @method_id,
  1,
  5,
  NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 6. Character Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'system-apocalypse-character-gen',
  '角色生成：生成末世环境下的幸存者、军人残党、独狼玩家和背叛者',
  'Character Generation: Survivors, military remnants, lone wolves, and betrayers in the apocalypse',
  '## Character Generator for System Apocalypse

  末日里的角色必须现实，为了生存他们可以展现出最高尚的人性或最卑鄙的算计。

  ### 设计要点
  - **Class & Build**: 每个人都因为职业特性而有独特的作用（例如纯堆体力的肉盾，擅长治疗和后勤的辅助，躲在暗处的陷阱刺客）。
  - **Survival Philosophy**: 必须赋予他们求生理念。比如“囤积狂”、“不惜一切代价傍大腿”、“靠出卖队友活命”。
  - **动态属性**：设定角色当前的 **Current Level** 和 **Location**，这关系到他们对主角的利用价值。',
  '## Character Generator for System Apocalypse

  Characters must be realistic. For survival, they show either the highest nobility or the lowest depravity.

  ### Design Core
  - **Class & Build Focus**: Every character acts based on their class (e.g., A full-Vitality tank, a healer/logistics user, a trap assassin).
  - **Survival Philosophy**: Give them a specific survival doctrine. "Hoarder", "Cling to the strongest at all costs," or "Betray allies to live."
  - **Dynamic Stats**: Set their **Current Level** and **Location**, defining their utility or threat to the MC.',
  @method_id,
  1,
  6,
  NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 7. Faction (Organization) Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'system-apocalypse-faction-gen',
  '组织生成：生成掠夺者帮派、军方临时基地、幸存者营寨或外星指引小队',
  'Faction Generation: Raider gangs, temporary military bases, survivor camps, or alien guide squads',
  '## Faction Generator for System Apocalypse

  没有国家的末世，聚集地就是一切。

  ### 设计核心
  - **Ideology/Rule**: 怎么分发粮食？高级职业者是不是拥有特权？是不是存在信奉系统是神的狂热邪教？
  - **Key Resources**: 决定营地生死的命脉。例如占领了市中心最大的超市，手里有一把史诗武器，或者有一个可以产出纯净水的生活系技能者。
  - **Threat vs Ally**: 根据主角的等级和行事风格，判断势力对主角是潜在盟友还是必须清剿的抢劫犯。',
  '## Faction Generator for System Apocalypse

  In a world without states, settlements are everything.

  ### Design Core
  - **Ideology/Rule**: How is food distributed? Do high-level classes have absolute privilege? Is there a cult worshipping the System?
  - **Key Resources**: The lifeline of the camp. They might hold the biggest supermarket, possess an Epic weapon, or have a crafter producing pure water.
  - **Threat vs Ally**: Depending on MC''s level, is this faction a trading post, a potential ally, or raiders needing extermination?',
  @method_id,
  1,
  7,
  NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 8. Scene Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'system-apocalypse-scene-gen',
  '场景生成：生成残酷的新手教程区、被植物吞没的废弃都市和危险的地牢',
  'Scene Generation: Brutal tutorial zones, overgrown ruined cities, and deadly dungeons',
  '## Scene Generator for System Apocalypse

  熟悉的现代地标与魔幻诡异环境的结合是场景描写的最大特色。

  ### 场景类别
  - **System Dungeon**: 例如曾经的地铁站变成了长满荧光蘑菇、到处是剧毒大蜘蛛的地牢副本。
  - **Ruined Urban Center**: 街道上堵满废弃汽车，超市的玻璃全碎，大厦表面布满剑痕和火烧的痕迹。
  - **Safe Zone**: 由光墙或结界保护的安全区，内部分级森严。

  ### 核心吸引力
  - 必须写明去那里的收益（**Loot/Resource Value**）：高风险要有高回报，比如首杀奖励宝箱。',
  '## Scene Generator for System Apocalypse

  The contrast of familiar modern landmarks corrupted by magical/bizarre environments is the biggest feature.

  ### Scene Categories
  - **System Dungeon**: A former subway station turned into an instance filled with glowing mushrooms and giant toxic spiders.
  - **Ruined Urban Center**: Streets jammed with abandoned cars, smashed supermarkets, skyscrapers scarred by swords and firemagic.
  - **Safe Zone**: Protected by magical barriers, with strict internal societal hierarchy.

  ### Core Appeal
  - Emphasize the **Loot/Resource Value**: High risk means high reward, like a "First Clear" boss chest.',
  @method_id,
  1,
  8,
  NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 9. Prop Gen (Equipment & Loot)
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'system-apocalypse-prop-gen',
  '道具生成：生成系统掉落的极品装备、消耗品和魔法改装热兵器',
  'Prop Generation: Epic system drops, consumables, and magic-modified firearms',
  '## Prop/Equipment Generator for System Apocalypse

  装备是数据流小说的灵魂之一！爆装备的快感必须拉满。

  ### 道具设计原则
  - **数值感 (Stats)**：这把剑加了15点力量，附带5%的流血概率。必须用游戏化的方式清晰描述。
  - **层级分明 (Tier/Rarity)**：黑铁、青铜、白银、黄金，或者是常见、稀有、史诗、传说。稀有度越高，效果越逆天。
  - **现代与魔法的缝合 (Modern vs Magic)**：这是末世流的特色。例如：“初级附魔格洛克手枪”、“无限子弹的重机枪（史诗）”、“用龙骨改造的突击步枪”。
  - **Consumables**: 红蓝药水、用来提升一点全属性的异兽肉、解毒剂等。',
  '## Prop/Equipment Generator for System Apocalypse

  Loot is the soul of LitRPG novels! Maximize the thrill of dropped items.

  ### Design Principles
  - **Stats & Effects**: Explicitly numerical. "Adds +15 Strength, 5% chance to inflict Bleed."
  - **Tier/Rarity**: Common, Uncommon, Rare, Epic, Legendary. The higher the tier, the more game-breaking the effects.
  - **Modern vs Magic**: A key trait of System Apocalypse. e.g., "Basic Enchanted Glock," "Infinite Ammo Heavy Machine Gun (Epic)," or "Assault Rifle forged with Dragon Bone."
  - **Consumables**: HP/MP Potions, mutated meat that grants +1 to all stats permanently, antidotes, etc.',
  @method_id,
  1,
  9,
  NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 10. Plot Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'system-apocalypse-plot-gen',
  '剧情设计：设计打怪升级、探索营地、人性博弈以及首杀地牢的剧情线',
  'Plot Design: Leveling, exploring camps, human conflicts, and first-clear dungeon runs',
  '## Plot Generator for System Apocalypse

  末世升级流的剧情核心是“通过生死危机获取巨大收益”以及“资源争夺产生的人际冲突”。

  ### 经典剧情结构
  1. **Tutorial Survival**: 初入末日，没有技能，主角依靠现代武器或金手指完成反杀，拿到第一桶金（稀有职业或技能）。
  2. **Dungeon First Clear**: 发现未被攻略的旧地标（变成副本），组建小队进入，经历伤亡后击杀 Boss，主角黑吃黑或者独占最高奖励。
  3. **Settlement Politics**: 主角携重宝来到某个幸存者聚集地，因怀璧其罪而被暴君或帮派针对，主角不再隐忍，用高等级技能大开杀戒接管营地。
  4. **Monster Sieges (怪物攻城)**：系统定时发动的兽潮，全人类防守。

  ### 注意点
  爽点在于“可见的数据增长”（Level Up），每次重要剧情后都必须伴随战斗力的质变。',
  '## Plot Generator for System Apocalypse

  The plot is driven by "risking death for massive rewards" and "human conflicts over scarce resources."

  ### Classic Plot Structures
  1. **Tutorial Survival**: No skills initially. MC survives using modern weapons/golden finger, gets the first pot of gold (Rare Class).
  2. **Dungeon First Clear**: Entering an uncleared modern landmark turned dungeon. Surviving traps and bosses, MC takes the highest "First Clear" loot.
  3. **Settlement Politics**: MC brings loot to a safe zone, gets targeted by greedy warlords. MC slaughters the oppressive leaders utilizing their level advantage, taking over the base.
  4. **Monster Sieges**: System-enforced base defense waves.

  ### Key Point
  The payoff is in visible "Level Up." Every major arc must result in a qualitative leap in combat power.',
  @method_id,
  1,
  11,
  NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 11. Narrative Writing
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'system-apocalypse-narrative',
  '叙事写作：指导战斗场面、系统提示音的插入、和冰冷求生的文风',
  'Narrative Writing: Writing combat, system prompt insertions, and cold survival tone',
  '## Narrative Writing for System Apocalypse

  ### 数据流的自然融入
  - 正文中要有系统提示的突兀打断感。例如：“【叮！您已击杀 lv.5 变异狂犬，获得经验值+50】的提示音在脑海中响起，但他根本没空理会面板，反手一刀劈向了下一只”。
  - 属性不仅是数字，要描写对应表现：力量上了30点后，能徒手捏爆车门；敏捷上去后，能看清子弹轨迹。

  ### 战斗与画面感
  - **子弹与魔法的结合**：重点描写突击步枪子弹倾泻在哥布林身上打碎骨头的物理感，或者是子弹撞在魔法护盾上被弹开的绝望感。
  - 环境的末世氛围：破败感要无处不在（血迹斑斑的超市货架、停电后幽暗漆黑的街道）。',
  '## Narrative Writing for System Apocalypse

  ### Natural Integration of LitRPG
  - Use system prompts deliberately to punctuate action. "[Ding! You have killed Lv.5 Mutated Hound. +50 XP] rang in his head, but he had no time to check his status as he slashed at the next one."
  - Stats aren''t just numbers; describe their physical effects (e.g., At 30 Strength, crushing a car door like tin foil; at 50 Agility, seeing bullet trajectories).

  ### Combat and Imagery
  - **Bullets vs Magic**: Physically describe the visceral impact of assault rifle rounds tearing into goblins, or the despair when 9mm bullets just bounce off a Troll''s magical hide.
  - Apocalyptic Atmosphere: The decay must be omnipresent (bloodstained supermarket aisles, pitch-black streets without electricity).',
  @method_id,
  1,
  12,
  NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 12. Novel Naming
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'system-apocalypse-novel-naming',
  '小说命名：为系统降临文起书名和简介',
  'Novel Naming: Titles and Synopses for System Apocalypse novels',
  '## Novel Naming for System Apocalypse

  书名要具有明确的“系统”、“末日”、“升级”、“独狼”属性，要体现爽快感。

  ### 命名流派
  1. **全员降临型**：《全球灾变：我有一亿个技能点》《末世游戏系统》《全民降临：只有我能看到隐藏爆率》
  2. **数字升级流（LitRPG风格）**：The System Apocalypse, Defiance of the Fall, Primal Hunter（这些是英文经典代表），中文可以起名：《从零开始的末日加点》《等级狂魔》。
  3. **职业/金手指强调型**：《末世第一法师》《我用现代军火屠戮诸神》

  ### 简介风格 (Synopsis)
  强调两点：一是世界的突变绝望境况（“那一天，血月降临，系统将地球化作万族猎场”）；二是主角如何凭借金手指或极度冷酷的判断步步为营，成为最强玩家。',
  '## Novel Naming for System Apocalypse

  Titles must have clear tags like "System", "Apocalypse", "Leveling/Progression", or "Solo". It implies instant dopamine and survival.

  ### Naming Tropes
  1. **Global Event focused**: "Global Apocalypse: I Have a Billion Skill Points", "The Earth Integration"
  2. **LitRPG Progression Classsics**: "The System Apocalypse", "Defiance of the Fall", "The Primal Hunter" style titles.
  3. **Class/Feature focused**: "The First Necromancer in the Apocalypse," "Slaying Gods with Modern Firearms"

  ### Synopsis Style
  Emphasize two things: 1) The sudden horrific shift of the world ("On that day, a blue screen appeared and Earth became a battlefield"). 2) How the MC, completely ruthless or exploiting a massive cheat, climbs to the top of the System. Numbers and Classes should be mentioned.',
  @method_id,
  1,
  13,
  NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 13. Entity Naming
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'system-apocalypse-entity-naming',
  '实体命名：为技能、属性、末日营地、怪物和枪械起名',
  'Entity Naming: Naming skills, camps, monsters, and guns in System Apocalypse',
  '## Entity Naming for System Apocalypse

  ### 营地/组织命名
  - 带有浓厚的废土军阀或者挣扎求生气息。比如：黎明要塞（曙光城）、铁血佣兵团、新希望避难所、狼群帮。

  ### 道具与装备命名
  - **武器**：必须带上层级和游戏感。比如【青铜级·滴血的厚背刀】、【史诗级·龙息狙击枪】、【变异的M4A1步枪】。
  - **技能**：网游风拉满。【绝对专注Lv3】、【暗影步】、【致命打击（初级）】。

  ### 怪物命名
  - 地名+生物特性的结合最典型。比如：纽约下水道史莱姆王、废都巨蛛、Lv.10 嗜血哥布林先锋。',
  '## Entity Naming for System Apocalypse

  ### Camp/Faction Naming
  - Needs a heavy wasteland warlord or desperate survival vibe. e.g., Dawn Fortress, Ironblood Mercenaries, New Hope Shelter, Wolf Pack Gang.

  ### Equipment and Props
  - **Weapons**: Must have tiers and a gamified feel. e.g., [Uncommon: Bloodied Cleaver], [Epic: Dragon-breath Sniper], [System-Modified M4A1], [Lv 10 Health Potion].
  - **Skills**: Pure LitRPG flavor. e.g., [Absolute Focus Lv.3], [Shadow Step], [Fatal Strike (Basic)].

  ### Monster Naming
  - Combining modern location context + creature type is very popular. e.g., Sewer Slime King, Ruined City Arachnid, Lv.10 Blood-crazed Goblin Vanguard.',
  @method_id,
  1,
  14,
  NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();
