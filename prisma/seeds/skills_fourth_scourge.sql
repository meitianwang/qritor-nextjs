-- Skills for The Fourth Scourge
-- Executes 12 skills for the novel creation method

SET @method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Fourth Scourge (Player Summoning) Novel' LIMIT 1);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES 
-- 1. Story Hook
('fourth-scourge-story-hook-setting-gen', '生成「Story Hook」：为第四天灾流设计绝地逢生的开局与召唤玩家的外挂', 'Generate Story Hook for Fourth Scourge', 
'## 「Story Hook」生成 — 第四天灾流

第四天灾（群穿玩家流）的核心卖点在于**土著的严肃绝望**与**玩家的生草（搞笑）行为**之间的极致反差。

### 生成指南
1. **The Dire Situation (绝境)**：主角目前是个孤家寡人，快要死了/破产了/被神明驱逐了，急需大量炮灰。
2. **The Summoning System (系统外挂)**：主角突然获得了能够连接地球网络的系统，能把地球人的灵魂拉来，塞进克隆体/泥土/骷髅里。主角通过发布虚假的官网，宣称这是一款“100%真实沉浸式虚拟现实游戏”。
3. **The Core Comedic/Action Hook (核心爽点)**：敌人以为自己不可战胜，而在不死且贪婪的玩家眼中，敌人只是一只会爆装备的“红名Boss”。土著的三观被彻底粉碎。',
'## "Story Hook" Generation — The Fourth Scourge

The core selling point is the extreme contrast between the **despair and seriousness of the natives** and the **chaotic, hilarious behavior of the gamers**.

### Guide
1. **The Dire Situation**: The MC is a lone survivor, about to be executed or bankrupted, needing endless cannon fodder.
2. **The Summoning System**: The MC gets a system connecting to Earth''s internet. They build a fake website claiming this is a "100% Real VRMMO" to trick gamers into uploading their souls into host bodies.
3. **The Core Hook**: Enemies think they are invincible terrifying overlords. But to the immortal, greedy gamers, these enemies are just "Red-Name Bosses" carrying epic loot. The absolute shattering of the natives'' worldview is the payoff.', @method_id, 1, 1, NOW()),

-- 2. Core Premise
('fourth-scourge-core-premise-setting-gen', '生成「Core Premise」：设定主角的NPC伪装与终极忽悠目标', 'Generate Core Premise for Fourth Scourge',
'## 「Core Premise」生成 — 第四天灾流

主角不能暴露自己是在利用玩家，他必须把自己伪装成游戏里的“最高级NPC”或“引导精灵”。

### 生成指南
1. **MC Identity (NPC身份)**：设定一个能发任务的角色。比如：避难所的最后一位监督者、复苏的深渊魔神、废土上的盲眼先知。
2. **The Big Lie (终极大忽悠)**：这到底是个什么题材的“游戏”？如果是中世纪，就骗玩家是《上古卷轴VR》；如果是宇宙，就骗玩家是《群星VR》。
3. **Ultimate Goal (终极目标)**：主角真正的目的（复仇、成神、还债），全靠压榨这群每天熬夜打工还乐在其中的地球肝帝。
4. **Tone (基调)**：搞笑与基建（Kingdom Building）是永恒的主题。',
'## "Core Premise" Generation — The Fourth Scourge

The MC must never reveal they are exploiting real people. They must disguise themselves as the "Ultimate Quest-Giver NPC" or "Guide."

### Guide
1. **MC Identity**: Set up an identity capable of issuing quests (e.g., The Last Overseer of a Vault, an awakened Abyssal Demon God, a Blind Prophet).
2. **The Big Lie**: What genre is the "game"? If medieval, it''s pitched as *Skyrim VR*; if sci-fi, *Stellaris VR*.
3. **Ultimate Goal**: The MC''s true objective (revenge, becoming a god, paying off cosmic debt), achieved entirely by exploiting sleepless Earth gamers who are happy to be enslaved for digital numbers.
4. **Tone**: Comedy and Kingdom Building are the eternal themes.', @method_id, 1, 2, NOW()),

-- 3. System Mechanics
('fourth-scourge-system-mechanics-setting-gen', '生成「System Mechanics」：设计玩家复活机制、剥削经济学与转职体系', 'Generate System Mechanics for Fourth Scourge',
'## 「System Mechanics」生成 — 第四天灾流

玩家凭什么给主角打工？因为系统机制完全掌握在主角手里。

### 生成指南
1. **Respawn Mechanic (复活机制)**：玩家的身体是怎么来的？例如：地下室的克隆培养舱、深渊的血肉转化池。复活需要消耗资源（主角可以借此向玩家收费）。
2. **Quest Dynamics (任务机制)**：主角把“帮我搬砖建房子”包装成【日常任务：建设营地】，把“替我去送死探路”包装成【隐藏剧情：探索毒沼】。一定要描写出主角资本家般的嘴脸。
3. **Economy/Exploitation (剥削经济学)**：玩家打怪掉的经验，主角抽成 90%，剩下的 10% 分给玩家，玩家还觉得“这游戏升级真硬核，策划真良心”。
4. **Player Classes (转职方向)**：比如哥布林进化成兽人，或者骷髅兵进化成巫妖王。',
'## "System Mechanics" Generation — The Fourth Scourge

Why do players work for the MC? Because the MC controls the server backend.

### Guide
1. **Respawn Mechanic**: Where do bodies come from? E.g., cloning vats, abyssal flesh-pools. Respawning costs resources (so the MC charges gamers game-currency to revive).
2. **Quest Dynamics**: The MC packages "carry these bricks to build my house" as [Daily Quest: Camp Construction], and "walk into that deadly cave to trigger traps" as [Hidden Lore: Explore the Poison Swamp]. Detail the MC''s capitalistic exploitation.
3. **Economy**: Players kill a monster. The MC skims 90% of the EXP, giving 10% to the player. The player thinks "Wow, leveling in this game is so hardcore, I love the devs!"
4. **Player Classes**: Evolution trees, e.g., Goblin to Orc, or Skeleton to Lich King.', @method_id, 1, 3, NOW()),

-- 4. Worldbuilding
('fourth-scourge-worldbuilding-setting-gen', '生成「Worldbuilding」：设计被玩家蹂躏的悲惨土著世界', 'Generate Worldbuilding for Fourth Scourge',
'## 「Worldbuilding」生成 — 第四天灾流

世界观的设定必须**极度严肃、黑暗甚至绝望**，以便跟玩家的**不正经**形成鲜明对比。

### 生成指南
1. **The Native World (土著世界)**：原本是一个人命如草芥、邪神横行的恐怖世界。直到玩家降临，画风突变。
2. **Native Power Structure (权力结构)**：傲慢的帝国皇帝、自以为是的巨龙。他们不理解为什么这群毫无敬畏之心的“不死怪人”会在战场上为了抢一个人头而自己人打自己人。
3. **NPC Perception (土著滤镜 / 迪化)**：这是最经典的部分。土著看玩家：“他们是一群毫无恐惧、不会死亡、语言极其诡异（满嘴爆粗口、发滑稽表情包）的神眷者/域外天魔！”
4. **Magic/Tech (科技/魔法底线)**：建立一个常识。玩家最擅长的就是利用游戏机制卡Bug，摧毁这个常识。',
'## "Worldbuilding" Generation — The Fourth Scourge

The world must be **extremely serious, dark, and desperate** to perfectly contrast with the **absolute lack of seriousness** of the gamers.

### Guide
1. **The Native World**: A terrifying place where human life is cheap and evil gods roam... until the players drop in and ruin the aesthetic.
2. **Native Power Structure**: Arrogant empires, proud dragons. They cannot comprehend why these irreligious, immortal freaks are team-killing each other on the battlefield just to "steal a kill."
3. **NPC Perception (DiHua/Overthinking)**: The most classic trope. Natives looking at players: "They are fearless, undying demons who speak in horrifying tongues (internet slang) and fight with absolute madness!"
4. **Magic/Tech**: Establish the baseline common sense of this world. The players will immediately find a physics exploit or use game logic to shatter it.', @method_id, 1, 4, NOW()),

-- 5. Writing Style
('fourth-scourge-writing-style-setting-gen', '生成「Writing Style」：指导主角第一视角、论坛体与土著视角的来回切换', 'Generate Writing Style for Fourth Scourge',
'## 「Writing Style」生成 — 第四天灾流

行文节奏非常依赖**三个视角的来回切换**，以此制造密集的笑点和爽点。

### 生成指南
1. **视角切换 (POV Alternation)**：
   - **主角视角**：一边数钱一边感叹“这届玩家真好骗”。
   - **玩家/论坛视角**：描写他们如何在论坛上水贴、写游戏攻略、出洋相。
   - **土著视角**：用极其严肃、恐惧的心理描写，脑补这群第四天灾是多么高深莫测的战略家（其实玩家只是为了完成日常任务而去摸了老虎的屁股）。
2. **Humor Style (幽默风格)**：大量运用游戏宅文化（肝帝、氪佬、卡Bug、舔包、建奇观）。
3. **Focus Areas (写作重头戏)**：玩家为了微薄的经验值，如同蝗虫过境一般把一个神圣的反派据点拆得连砖头都不剩的壮观景象。',
'## "Writing Style" Generation — The Fourth Scourge

The pacing heavily relies on **rapidly switching between three POVs** to generate dense comedic payloads and satisfaction.

### Guide
1. **POV Alternation**:
   - **MC POV**: Counting money and sighing, "These gamers are so easy to exploit."
   - **Player/Forum POV**: Describing them posting guides on the hub, shitposting, and doing stupid things for views.
   - **Native POV**: Using extreme, serious fear to describe these "Terrifying otherworldly tacticians" (when in reality, the player just slapped a tiger''s butt for a daily quest).
2. **Humor Style**: Heavy use of gamer culture (Grinders, Whales, exploiting bugs, looting everything to the bedrock, building massive random structures).
3. **Focus Areas**: The spectacular scene of players, acting like a plague of locusts, dismantling a holy villain''s fortress down to the floorboards just for a few EXP points.', @method_id, 1, 5, NOW()),

-- 6. Character
('fourth-scourge-character-gen', '「角色」生成：生成骗子主角、各路地球奇葩玩家和三观尽毁的土著', 'Generate characters, including players, MC, and confused natives',
'## 「角色」生成 — 第四天灾流

角色分为三大阵营：伪装成NPC的黑心主角、奇葩地球玩家、被折磨的土著。

### 角色设计重点
1. **The MC (黑心策划/引路人)**
   - 必须保持绝对的高冷和逼格。在玩家眼里，他是好感度极其难刷、拥有隐藏屠龙任务的绝世大能。实际内心独白全是“卧槽千万别被他们发现我是个弱鸡”。
2. **Hardcore / Whale Players (高玩/氪佬玩家)**
   - 比如名字叫 [ID: 龙傲天] 或者 [ID: 爷傲奈我何]。他们会为了测试物理引擎去跳崖，会为了打造最好的武器肝上三天三夜不睡觉。
3. **Casual / Crafter Players (生活玩家)**
   - 沉迷在异世界开餐厅、烤兽肉、或者拿魔法矿石搭建等比例高达模型的乐子人。
4. **Terrified Native Overlord (被折磨的最终Boss)**
   - 曾经让世界颤抖的魔王，现在面对这群杀不死、砍碎了还要拿自己的骨头去换声望的恶魔，陷入了极度的抑郁。',
'## "Character" Generation — The Fourth Scourge

Characters fall into three camps: The scamming MC, the bizarre Earth players, and the tormented natives.

### Design Focus
1. **The MC (The Scumbag Admin)**
   - Must maintain an aura of absolute mystery and power. To the players, he is an ultra-rare NPC with hidden lore. Internally, he is sweating nervously thinking, "Please don''t realize I have zero combat power."
2. **Hardcore / Whale Players**
   - e.g., Gamertag: [xX_DragonSlayer_Xx]. They will jump off cliffs just to test fall damage physics, and will stay awake for 72 hours grinding materials for a single sword.
3. **Casual / Crafter Players**
   - Gamers who ignore the main quest to open a restaurant, cook monster meat, or use magic crystals to build a 1:1 scale Gundam in the starting village.
4. **Terrified Native Overlord (The Final Boss)**
   - A Demon King who once made the world tremble, now suffering severe clinical depression when faced with an army of undying maniacs trying to rip his bones out to trade for "Faction Reputation."', @method_id, 1, 21, NOW()),

-- 7. Faction
('fourth-scourge-faction-gen', '「势力」生成：生成第四天灾公会、土著帝国与反天灾同盟', 'Generate Player Guilds and Native Alliances for Fourth Scourge',
'## 「Faction (势力)」生成 — 第四天灾流

这里的势力冲突本质上是“游戏公会战”与“土著保卫战”。

### 势力设计指南
1. **Player Guilds (玩家公会)**
   - 名字极度生草，出戏（如：“全服第一拆迁队”、“肝帝保护协会”）。
   - **行事风格**：所过之处，寸草不生。为了帮主角打下一座城池，他们可以用命填平护城河。
2. **Native Empire/Cult (土著帝国/邪教)**
   - 名字极度霸气（如：光辉圣教、幽冥龙国）。
   - **当前状态（Current State）**：通常处于崩溃边缘。他们无法理解为什么对方的杂兵在战场上居然会因为“抢不到怪”而互相PK，更无法理解对方战术的毫无底线（如在河道里投大粪）。
3. **The MC''s Base (主角大本营)**
   - 在土著眼里，这是全大陆最恐怖的禁忌之地（也就是玩家的“新手村”）。',
'## "Faction" Generation — The Fourth Scourge

Faction conflicts here are essentially "MMO Guild Wars" clashing with "Native Defense Wars."

### Design Guide
1. **Player Guilds**
   - Names should be hilariously immersion-breaking (e.g., "The First Demolition Squad," "No Sleep Club").
   - **Playstyle**: Like a swarm of locusts. To capture a city for the MC, they will literally fill the moat with their own respawning corpses just to build a bridge.
2. **Native Empire/Cult**
   - Extremely epic and serious names (e.g., The Radiant Holy Church, The Abyssal Dragon Empire).
   - **Current State**: Usually on the verge of mental collapse. They cannot comprehend why enemy soldiers are fighting EACH OTHER over "kill steals," nor can they comprehend the players'' utterly shameless tactics (like dumping literal feces into the river to poison them).
3. **The MC''s Base**
   - To the natives, this is the most terrifying, forbidden zone on the continent. (To the players, it is just their "Starting Village/Safe Zone").', @method_id, 1, 41, NOW()),

-- 8. Scene
('fourth-scourge-scene-gen', '「场景」生成：为第四天灾流生成复活广场、被玩家扫荡的副本和土著王城', 'Generate Respawn squares, raided dungeons, and native capitals for Fourth Scourge',
'## 「Scene (场景)」生成 — 第四天灾流

场景反映了玩家对这个异世界生态所造成的“毁灭性打击”。

### 场景设计指南
1. **The Safe Zone / Respawn Point (新手村/复活点)**
   - **表象**：由主角维系的一个绝对安全结界。
   - **氛围**：地上到处是乱摆着地摊的玩家，有人在跳搞笑舞蹈，有人在挂机。在土著NPC看来，这简直群魔乱舞。
2. **Raid Dungeon (副本/土著绝地)**
   - **曾经**：让整个王国闻风丧胆的死亡矿井。
   - **现在状态 (Current State)**：不仅所有的魔兽被扒皮抽筋，连大门上的铁锈都被生活系玩家刮走拿去当炼铁材料了。变成了一个空荡荡的矿坑。
3. **Native Capital City (土著王都)**
   - 极其宏伟、严肃的地方，是主角接下来要发布任务让玩家去“开荒”的新地图。',
'## "Scene" Generation — The Fourth Scourge

Scenes reflect the "destructive impact" the players have brought upon the native ecology.

### Design Guide
1. **The Safe Zone / Respawn Point (Starting Village)**
   - **Appearance**: An absolute safe zone maintained by the MC.
   - **Atmosphere**: Players are everywhere, setting up chaotic street stalls, doing stupid emotes, or just AFKing into walls. To a visiting native NPC, this is a horrific display of demonic madness.
2. **Raid Dungeon (The Forbidden Danger Zone)**
   - **Formerly**: The Death Mines, feared by the entire kingdom.
   - **Current State**: Not only have all the beasts been skinned alive, but the casual crafter players even scraped the rust off the iron gates to use for metallurgy. It is now a completely barren, stripped hole in the ground.
3. **Native Capital City**
   - An immensely majestic, serious location. It serves as the new "Expansion Map" the MC is about to issue a quest for the players to "reclaim" (destroy).', @method_id, 1, 61, NOW()),

-- 9. Plot
('fourth-scourge-plot-gen', '「情节Plot」：指导如何设计开服任务、活动副本与割韭菜的剧情弧线', 'Guide to design beta-tests, server events, and crop-harvesting arcs',
'## 剧情设计指南 (Plot Design) — 第四天灾流

第四天灾流的情节结构本质上和网络游戏的**“开服、版本更新、大型活动”**紧密挂钩。

### 核心情节弧线
1. **封测期 (Alpha Test) - 忽悠与起步**：主角忽悠第一批几十个高玩进入世界。主角自己穷得揭不开锅，只能发任务让玩家去挖土坎树。玩家以为这是“硬核100%沉浸游戏”，高兴地没日没夜砍树。
2. **第一部资料片/主城危机 (First Expansion)**：面对土著大军的围剿，主角发布【全军出击：守卫阵地】的大型活动。玩家疯狂送死，用人海战术磨死不可一世的土著大将。土著三观崩塌。
3. **割韭菜与内测扩招 (Beta Test & Harvesting)**：主角利用剥削玩家赚取的大量经验升华了力量状态，进而“开放内测名额”引入几万名玩家，正式开始平推整个位面。

### 设计原则
- **游戏包装术**：无论何种危机，在主角嘴里都要变成“限时活动”，并且给出一堆毫无用处但闪着金光的“称号”作为奖励，玩家就会像疯狗一样去完成。',
'## Plot Design Guide — The Fourth Scourge

The plot structure is fundamentally tied to the lifecycle of an MMORPG: **"Beta Tests, Expansion Updates, and Server-wide Events."**

### Core Story Arcs
1. **Alpha Test (The Hustle)**: The MC tricks the first batch of 50 hardcore gamers. The MC is broke, so they issue quests to have gamers dig dirt and chop trees. The gamers think this is a "Hardcore 100% Physics Engine Game" and chop trees happily all night long.
2. **First Expansion (City Defense)**: Facing an extermination army from the savage natives, the MC issues a "Server-wide Event: Defend the Base." Players rush to their deaths ecstatically, grinding down the proud, invincible Native General via sheer corpse-stacking. The native''s worldview utterly shatters.
3. **Beta Test & Harvesting**: The MC uses the massive amount of stolen EXP to level up themselves, then "Opens the Beta" to summon 10,000 more players, officially beginning the steamrolling of the entire continent.

### Design Principles
- **The Art of the Game Package**: No matter how dire the crisis is, the MC must spin it as a "Limited-Time Global Event" and reward the players with useless but glowing digital "Titles"—and the players will fight like rabid dogs to get it.', @method_id, 1, 100, NOW()),

-- 10. Narrative
('fourth-scourge-narrative', '「叙事与描写 Narrative」：指导搞笑迪化、玩家沙雕操作与宏大悲壮感的交织', 'Guide to describing hilarious overthinking, stupid gamer moves, and dramatic irony',
'## 叙事与描写技巧 (Narrative) — 第四天灾流

第四天灾的精髓在于**蒙太奇式的对比**。必须同时把同一件事写出两种截然不同的感觉。

### 1. 土著的“迪化” (Overthinking / DiHua)
- **土著视角极度严肃**：*“这些天外恶魔，哪怕肚破肠流也未曾哼出一声，反而眼冒红光地盯着我的配剑！他们一定是经过了某种惨绝人寰的洗脑训练！那个站在高台上、戴着面纱的引导者到底是谁？！”*
- **玩家/主角视角其实极其沙雕**：玩家只是在想*“卧槽这Boss手里的剑好像是史诗级的，爆率有多少？”* 主角在想*“卧槽别看我，我腿软，这Boss一刀我就没了。”*

### 2. 第四天灾的破坏力描写
- 不要只是写“玩家很强”。要写玩家如同蝗虫和精神病患者。
- **神级骚操作**：比如在这个剑与魔法的世界，玩家发现可以用泥土和木炭卡Bug制造土制炸药，然后上千名玩家绑着炸药包高喊着“为了老匹克（某个NPC）的好感度！”冲向巨龙。

### 3. 主角的高冷伪装
- 当主角颁发奖励时，必须用最优美的用词和最怜悯的语气：*“勇敢的不死者们，你们的牺牲，星辰已经铭记。”* 然后在系统后台扣除玩家 30% 手续费。',
'## Narrative and Writing Techniques — The Fourth Scourge

The essence of the logic is **Montage-style juxtaposition**. You must describe the exact same event conveying two completely contradictory vibes.

### 1. The Native''s "DiHua" (Overthinking)
- **Native POV is ultra-serious**: *"These otherworldly demons... even with their bowels spilling out, they didn''t make a sound of pain! Instead, their eyes glowed red as they stared at my holy sword! What inhumane brainwashing have they endured?! And the veiled Guide standing on the platform... what terrifying god is he?!"*
- **Player/MC POV is completely stupid**: The player is just thinking, *"Holy shit, that Boss''s sword looks like an Epic drop, what''s the loot rate?!"* The MC is thinking, *"Holy shit, don''t look at me, if the Boss targets me I get one-shotted."*

### 2. Describing the Scourge''s Destructive Power
- Do not just write "the players are strong." Write them as psychopathic locusts.
- **Cheesing the Game**: In a sword and magic world, players discover a physics bug that allows them to craft crude C4 from charcoal. Thousands of players strap bombs to their chests and sprint at a Dragon screaming, "FOR THE NPC FAVORability!"

### 3. The MC''s Cold Facade
- When issuing rewards, the MC must use the most beautiful, solemn dialogue: *"Brave Undying, your sacrifices have been engraved into the stars."* And then immediately deducts a 30% handling fee in the backend system menu.', @method_id, 1, 101, NOW()),

-- 11. Novel Naming
('fourth-scourge-novel-naming', '「书名与大纲生成」：指导生成生草轻小说风标题与主打反差感的大纲', 'Guide to generate memetic Light Novel titles and contrast-heavy outlines for Fourth Scourge',
'## 书名与大纲生成指南 — 第四天灾流

书名必须充满强烈的吐槽欲，直接点明“游戏”、“玩家”和“主角的无奈或无敌”。

### 1. Title Generation (书名命名偏好)
- 格式 A（主角吐槽风）：`[This Game / My Cult] + [Is Doing Something Crazy]` (例：*This Game is Too Realistic*, *Why are My Believers all Psychopaths?*, *I Created a Fake MMO and Now I Rule the World*)
- 格式 B（第四天灾名头）：包含关键词 Scourge, Players, Undead, Game. (例：*The Fourth Scourge: They Think It''s An RPG*, *Rise of the Player Faction*)

### 2. Synopsis Generation (三段式大纲结构)
- **第一段：悲催开局 (The Trap)**：穿越成异界濒死的炮灰，没有金手指，被各路神仙追杀。
- **第二段：外挂降临与大忽悠 (The Scam)**：获得了召唤地球玩家的系统。主角决定搞个大新闻：“新时代跨时代全息网游《异界OL》今日内测！百分百痛觉，硬核生存！”
- **第三段：画风突变 (The Chaos)**：土著们绝望地发现，世界上多了一群无法沟通、不怕死、天天扒人衣服抢夺装备的疯子。而主角坐在幕后数钱数到手软。',
'## Title & Synopsis Generation Guide — The Fourth Scourge

Titles must burst with snark, overtly pointing out the "Game," the "Players," and the "MC''s absurdity/scam."

### 1. Title Generation Preferences
- **Format A (MC''s Complaint)**: `[This Game / My Cult] + [Is Doing Something Crazy]` (e.g., *This Game is Too Realistic*, *Why are My Believers all Psychopaths?*, *I Created a Fake MMO and Now I Rule the World*).
- **Format B (The Scourge Factor)**: Must include keywords Scourge, Players, RPG, Gamers. (e.g., *The Fourth Scourge: They Think It''s An RPG*, *Rise of the Player Faction*).

### 2. Synopsis Generation (Three-Act Structure)
- **Act 1: The Trap**: Reincarnated as a dying cannon fodder in a terrifying fantasy world, hunted by gods and empires. Zero combat power.
- **Act 2: The Scam**: Awakens a system to summon Earthling souls. The MC decides to pull the ultimate scam: "Brand new 100% immersive VRMMO [Otherworld Online] enters Alpha Test today! Ultra hardcore!"
- **Act 3: The Chaos**: The natives stare in sheer horror as the world is flooded with uncommunicative, fearless lunatics who strip corpses naked for loot. Meanwhile, the MC sits behind the scenes, drowning in the EXP he skimmed from their hard work.', @method_id, 1, 102, NOW()),

-- 12. Entity Naming
('fourth-scourge-entity-naming', '「名词生成指南」：指导生成极度沙雕的玩家ID、严肃的土著势力与技能', 'Guide to generate hilarious Gamertags and dead-serious Native powers',
'## 专有名词生成指南 (Entity Naming) — 第四天灾流

名词系统是最大的笑点来源。你必须强行把“严肃沉重的古典奇幻”和“极度生草的网络亚文化”糅合在一起。

### 1. 玩家 ID (Gamertags)
- 极度出戏，充满网络烂梗。
- *案例*：[Gnome_Punter_99] (踢侏儒达人), [TouchMyLootIDareYou] (敢动我装备试试), [xX_Dark_Sasuke_Xx], [Liver_Emperor] (肝帝), [AFK_For_Food]。
- **对比反差**：这群顶着这种名字的神经病，正在被土著大贤者以极其尊敬的语气呼唤：“伟大的救世主，[肝帝]大人……”

### 2. 土著势力与NPC (Serious Native Entities)
- 名字必须符合传统的史诗奇幻或硬核科幻，越华丽越高贵越好，这样被玩家毁掉的时候反差才足够大。
- *案例*：Arch-Paladin Gideon (吉恩大高阶骑士), The Ashen Citadel (灰烬堡垒), The Everlasting Dragon Empire (永恒龙帝国)。

### 3. 主角的忽悠系统 (The Game Terms)
- 将一切严肃的危险行为赋予游戏学术语。
- *日常任务*：土著的征收队来了，主角发布日常任务——【防守据点：狗策划的愤怒】。
- *货币系统*：把异界的破铜烂铁包装成【贡献点 (Contribution Points)】。

**AI 动作要求**：为玩家生成ID时，一定要充满网游的味道（带下划线、数字、颜文字、梗）。为土著生成名字时，一定要用最传统的史诗奇幻命名法。由于极端的两极分化，这就是该类型最大的幽默点。',
'## Entity Naming Guide — The Fourth Scourge

The nomenclature is the biggest source of comedy. You must violently mash together "dead-serious high fantasy" with "idiotic internet subculture."

### 1. Gamertags (Player IDs)
- Utterly immersion-breaking and filled with internet memes or cringe.
- *Examples*: [Gnome_Punter_99], [TouchMyLootIDareYou], [xX_Dark_Sasuke_Xx], [F2P_God], [AFK_For_Food], [LootGoblin].
- **The Contrast**: Imagine a terrified, ancient Native Sage addressing them with utmost respect: *"Oh great savior, Sir [xX_Dark_Sasuke_Xx]..."*

### 2. Serious Native Entities
- Names must adhere to traditional epic fantasy or grimdark sci-fi. The higher and mightier they sound, the funnier it is when the players inevitably humiliate them.
- *Examples*: Arch-Paladin Gideon, The Ashen Citadel, Sovereign of the Crimson Moon.

### 3. The MC''s Scam System (The Game Terms)
- Applying MMORPG terminology to deadly real-world situations.
- *Quests*: An extermination army is approaching, so the MC issues the event, [Server-Wide Raid: The Emperor''s Wrath].
- *Currency*: The MC packages useless local rocks or scrap metal as [Contribution Points (CP)].

**AI Action Requirement**: When generating Player IDs, you MUST use heavy gamer aesthetics (underscores, numbers, edgy names, meme references). When generating Native names, use the grandest epic fantasy naming conventions. This extreme polarization is the core of the humor.', @method_id, 1, 103, NOW())
ON DUPLICATE KEY UPDATE description=VALUES(description), instructions=VALUES(instructions);
