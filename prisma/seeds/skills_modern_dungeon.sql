-- Skills for Modern Dungeon Break (Hunter) Novel
-- Executes 12 skills for the novel creation method

SET @method_id = (SELECT id FROM novel_creation_method WHERE name = 'Modern Dungeon Break (Hunter) Novel' LIMIT 1);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES 
-- 1. Story Hook
('dungeon-story-hook-setting-gen', '生成「Story Hook」：设计底层猎人的绝境反杀与全服唯一独狼系统的系统觉醒', 'Generate Story Hook for Modern Dungeon Break (Hunter fiction)',
'## 「Story Hook」生成 — 现代猎人流 (Solo Leveling 模式)

猎人流的开局必须极致的**“压抑与反转”**。主角必须在猎人阶级的最底层受尽屈辱，甚至面对队友的背叛，从而在生死关头觉醒全服唯一的“升华/双开系统”。

### 生成指南
1. **The Pathetic Reality (悲惨的打工人现实)**：觉醒为最弱的 E/F 级猎人，每次下副本都被当成肉盾或搬运工。身上背着绝症妹妹/母亲的天价医疗费债务。
2. **The Hidden Dungeon (致命的双重地下城)**：一次极度普通的低级副本，突然异变为神话级/极危级的隐藏Boss房间（如巨大的石像守卫）。高级猎人全部吓尿逃跑，把主角锁在里面献祭。
3. **The Unique System (外挂觉醒)**：主角在被撕碎的最后一秒，为了活下去产生的强烈杀意触发了世界的某个隐藏程序：“叮！【玩家】身份已激活！您获得了专属职业传承！”全服只有他一个人能看到游戏面板并升级。',
'## "Story Hook" Generation — Modern Dungeon Break / Solo-Hunter

The opening of a Hunter novel must be the ultimate **"Oppression and Reversal."** The MC sits at the absolute bottom of aristocratic Hunter society, enduring humiliation and betrayal, only to awaken the server''s single strictly "Progression System" at the brink of death.

### Guide
1. **The Pathetic Reality**: Awakened as the weakest F-Rank Hunter. Treated as mere meat-shields or porters for arrogant high-ranks. Drowning in astronomical hospital debts for a terminally ill mother/sister.
2. **The Hidden Dungeon (The Double Lair)**: A routine, lowest-level D-Rank raid suddenly morphs into a Mythic-tier Hidden Boss Room (e.g., massive stone deity statues). The arrogant high-rank hunters piss themselves and flee, locking the MC inside as a sacrifice.
3. **The Unique System (The Awakening)**: In the final millisecond before being torn apart, the MC''s sheer, terrifying desire to survive triggers a hidden protocol in the universe: *"DING! [Player] ID registered! Unique Class Inheritance unlocked!"* They become the ONLY human on earth who can see a blue interface and actually level up.', @method_id, 1, 1, NOW()),

-- 2. Core Premise
('dungeon-core-premise-setting-gen', '生成「Core Premise」：设定主角的逆天隐藏职业、独狼基调与公会争霸框架', 'Generate Core Premise for Hunter fiction',
'## 「Core Premise」生成 — 现代猎人流

猎人流的核心爽点是**“不可逾越的鸿沟被我一个人跨越了”**。

### 生成指南
1. **The Hidden Class (隐藏职业的设计)**：职业本身必须极具视觉冲击力且适合“群殴”。比如暗影君王（将杀死的敌人转化为死灵军队）、神话锻造师（手撸无限神器）。主角一个人就是一支国家军队。
2. **Current Goal (朴素的驱动力)**：主角不需要一开始想着拯救地球。最开始只是为了赚钱买治愈神泉、还债、买最贵的房子。直到自己无敌了，才顺手砍死入侵地球的魔神。
3. **Handling Fame (扮猪吃虎 vs 霸道碾压)**：前期隐藏实力，以低级猎人的身份接散单，暗中清扫最强副本；后期迫不得已暴露（为了救人或杀仇人），震惊全球高层，所有跨国公会跪着求他加入。',
'## "Core Premise" Generation — Modern Dungeon Break

The core satisfaction of this genre is: **"The uncrossable societal gap was casually bridged by me alone."**

### Guide
1. **The Hidden Class**: The MC''s unique class must be visually explosive and heavily lean towards "One-Man Army" capabilities. e.g., Shadow Monarch (resurrecting slain foes as loyal shadow knights), or Mythic Necromancer. The MC alone is a national-level military threat.
2. **Current Goal (The Grounded Drive)**: The MC shouldn''t care about "saving the world" early on. They just want to grind dungeons to buy an Elixir of Life for a relative, pay off massive debt, or buy a penthouse. Only when they are invincible do they casually decapitate the invading Demon Gods.
3. **Handling Fame (Smurfing vs Flexing)**: Early game: Hide their true power, taking contracts as a low-rank nobody while solo-clearing S-Rank gates in secret. Late game: Exposed (to save someone or annihilate an enemy). The global elite is utterly shaken, and multinational Guilds beg on their knees for them to join.', @method_id, 1, 2, NOW()),

-- 3. System Mechanics
('dungeon-system-mechanics-setting-gen', '生成「System Mechanics」：设计森严的公会定级与主角专属的无限升级UI', 'Generate Hunter Guild rankings and MCs solo-UI',
'## 「System Mechanics」生成 — 现代猎人流

这是区分主角和配角的唯一标准。配角不能升级，主角可以无限加点。

### 生成指南
1. **Global Ranking System (全球死板的定级系统)**：猎人一旦觉醒，魔力值就固定了（F到S级）。一个C级猎人练一辈子也不可能打过B级，这是铁律。（这就凸显了主角能升级的可怕）。
2. **MC''s Solo Leveling Interface (唯我独尊的面板)**：只有主角能看到飘在空中的蓝色光屏：力量(STR)，敏捷(AGI)，智力(INT)。每杀一只怪，主角都能感觉到肌肉的重组与力量的增加。
3. **Daily Quests / Penalties (斯巴达式日常与惩罚)**：系统一开始极其严苛（通常是培养主角杀戮之心的）。比如要求每天跑10公里，不做就会被强制传送到铺满变异毒蝎的沙漠求生4小时。',
'## "System Mechanics" Generation — Modern Dungeon Break

This is what separates the MC from the rest of humanity. NPCs cannot level up; the MC has infinite scaling.

### Guide
1. **Global Ranking System**: Once a Hunter awakens, their mana capacity is strictly permanently fixed (Rank F to S). A C-Rank hunter can train for 40 years and will never defeat a B-Rank. This ironclad law is exactly what makes the MC''s ability to level up so terrifying to the world.
2. **MC''s Solo Leveling Interface**: Only the MC can see the glowing blue holographic UI: Strength (STR), Agility (AGI), Intelligence (INT). With every monster kill, the MC literally feels their muscle fibers restructuring and tearing as raw power floods in.
3. **Daily Quests / Penalties (Spartan Training)**: The System is a harsh master early on, designed to forge a ruthless killer. e.g., "Daily Quest: 100 pushups, 10km run." Failure equals being teleported to a desert survival zone swarming with giant toxic scorpions for 4 hours.', @method_id, 1, 3, NOW()),

-- 4. Worldbuilding
('dungeon-worldbuilding-setting-gen', '生成「Worldbuilding」：设计被财阀公会统治、靠魔晶石运转的现代异能社会', 'Generate modern societies ruled by Guild conglomerates and Mana Cores',
'## 「Worldbuilding」生成 — 现代猎人流

这不是古代奇幻，这是**穿着西装打领带的资本主义+超能力怪兽**。

### 生成指南
1. **The Gates (地下城传送门)**：现代都市（首尔/纽约/东京）上空和街道突然裂开蓝色的漩涡。如果一周内没有猎人进去干掉Boss，传送门就会变成红色，怪物就会倾巢而出（Dungeon Break）屠杀市民。
2. **The Monster Economy (魔晶石经济)**：怪物不掉金币，掉“魔晶核”。这些晶核取代了石油和核能，成为世界运转的最核心能源。高级怪物的皮甲被做成防弹西装。
3. **The Guild Corporations (公会资本帝国)**：最强的公会比总统还有权力。S级猎人就像是顶级NBA球星+核武器的结合体，享受数亿美金的代言费，走在红毯上受万人敬仰，同时也极其腐败和傲慢。',
'## "Worldbuilding" Generation — Modern Dungeon Break

This is NOT medieval fantasy. This is **Capitalism in Armani suits + Superpowers + Hyper-monsters.**

### Guide
1. **The Gates (Dungeon Portals)**: Swirling blue vortexes randomly tear open in the sky or inside subway stations in Seoul, NY, or Tokyo. If a Hunter team doesn''t enter and kill the Boss within 7 days, the portal turns red (Dungeon Break), and monsters pour out to slaughter the city.
2. **The Monster Economy (Mana Cores)**: Monsters don''t drop gold coins; they drop "Mana Cores." This clean, infinite energy has entirely replaced oil and nuclear power. High-tier monster hides are tailored into bulletproof designer suits.
3. **The Guild Corporations**: The top Guilds wield more geopolitical power than the President. S-Rank hunters are treated like a fusion of NBA Superstars and Walking Nuclear Weapons. They earn hundreds of millions in sponsorships, walk red carpets, and are often profoundly corrupt, viewing citizens as literal insects.', @method_id, 1, 4, NOW()),

-- 5. Writing Style
('dungeon-writing-style-setting-gen', '生成「Writing Style」：指导爽快极致的“装B打脸”与血流成河的物理碾压感描写', 'Guide to writing visual physical domination and flawless face-slapping',
'## 「Writing Style」生成 — 现代猎人流

写作风格不需要太多的哲学思考，只需要**纯粹的肾上腺素飙升**。

### 生成指南
1. **Combat Aesthetics (绝对力量的美学)**：战斗不能是五五开。主角一旦升级完毕，必须是绝对碾压。描写一定要注重“速度、撞击、破坏地形”。
   - *描写示范*：那只让S级猎人团队绝望的龙级魔兽甚至没看清主角的动作。空气爆发出一声音爆，主角的拳头已经将龙的整个下颌骨砸进了市中心的柏油马路里。
2. **The Satisfaction / Face-Slapping (极致的装B打脸)**：前期铺垫反派（傲慢的少爷、狂妄的A级公会会长）有多么不可一世。当他们以为主角是个底层蝼蚁想要碾死时，主角只用了一根手指（或者召唤了一只小弟）就把他们的高手护卫全部踩碎。
3. **Stat Prompt Integration (系统提示音的节奏点)**：
   - 伴随着极其清脆的提示音：**[您已升级 (LEVEL UP!)]**。伴随提示音，主角身上的伤口瞬间愈合，魔力如风暴般席卷全城。',
'## "Writing Style" Generation — Modern Dungeon Break

The writing style does not require deep philosophical undertones. It requires **pure, unfiltered adrenaline spikes.**

### Guide
1. **Combat Aesthetics (The Beauty of Absolute Power)**: Fights should not be 50/50 struggles once the MC levels up. It MUST be an absolute massacre. Emphasize "speed, kinetic impact, and geographical destruction."
   - *Example*: The S-Rank dragon that just slaughtered the elite raiding squad didn''t even register the MC''s movement. A sonic boom shattered the glass of every surrounding skyscraper. In a blur of black lightning, the MC''s fist hammered the dragon''s jaw straight through 50 feet of concrete into the subway tunnels below.
2. **The Satisfaction / Face-Slapping**: Spend chapters building up the sheer arrogance of villains (e.g., a spoiled Guild Heir, a haughty A-Rank Guild Master). When they corner the MC thinking he is still an F-Rank ant, the MC casually uses a single finger (or summons his weakest shadow-pet) to completely instantly eviscerate their bodyguards. Pure dopamine.
3. **Stat Prompt Integration**:
   - Use the system prompts as cinematic bass drops: **[LEVEL UP!]** Upon the prompt, the MC''s fatal wounds instantly knit shut, and their mana erupts like a hurricane, paralyzing every high-rank hunter in the city.', @method_id, 1, 5, NOW()),

-- 6. Character
('dungeon-character-gen', '「角色」生成：生成被无敌主角折服的各路高傲大佬、炮灰与绝对忠诚的小弟', 'Generate arrogant guild elites, sidekicks, and deeply loyal summons',
'## 「角色」生成 — 现代猎人流

在这个世界里，所有人最终都会成为主角力量的**背景板**或**狂热粉丝**。

### 角色设计重点
1. **The Solo MC (独狼主角)**：
   - 从一开始的卑微、软弱，迅速蜕变成一个冷酷无情、杀伐果断的战神。他的台词很少行动极快（“不要废话，全杀了再说”）。
2. **Arrogant S-Rank Hunter (傲慢的高阶猎人/垫脚石)**：
   - 极其自负，享受着顶级流量和金钱。看不起低级猎人。最大的作用就是被主角在众目睽睽之下秒杀，从而证明主角已经超越了人类极限。
3. **Loyal Sidekick / Shadow General (忠诚的配角/召唤物)**：
   - 要么是负责喊“大哥牛逼”和处理公会财务的跟班；要么是主角从敌方Boss那里转化过来的死灵大将（以前桀骜不驯，现在跪下叫王）。',
'## "Character" Generation — Modern Dungeon Break

In this world, everyone eventually becomes either a **background canvas** to highlight the MC''s power, or a **fanatic loyalist**.

### Design Focus
1. **The Solo MC**:
   - Rapidly evolves from a pathetic, groveling weakling into a ruthless, cold-blooded God of War. They speak very little and act brutally fast. (Philosophy: "Stop talking. I''ll just kill you all.")
2. **Arrogant S-Rank Hunter (The Stepping Stone)**:
   - Supremely arrogant, drowning in sponsorships and idol wealth. Views lower ranks as dirt. Their sole narrative purpose is to be publicly, effortlessly annihilated by the MC in front of national television, acting as a measuring stick for the MC surpassing human limits.
3. **Loyal Sidekick / Shadow General**:
   - Either a non-combat administrative sidekick who handles the Guild finances and says "My God, Boss is so cool"; or a former terrifying Boss Monster that the MC killed and resurrected as an Undead General (who went from screaming arrogance to kneeling humbly: "My King.").', @method_id, 1, 21, NOW()),

-- 7. Faction
('dungeon-faction-gen', '「势力」生成：生成跨国巨鳄公会、暗杀同盟与形同虚设的猎人协会', 'Generate mega-guilds, assassin syndicates, and the powerless Hunter Association',
'## 「Faction (势力/组织)」生成 — 现代猎人流

这里的势力都是身穿高定西服、坐着直升机的超能大财阀。

### 势力设计指南
1. **Top-Tier Mega Guild (国家级巨型公会)**
   - 例：白虎公会、猎魔人集团。
   - **特点**：拥有摩天大楼作为总部，旗下有自己的开采公司、娱乐经纪公司、甚至私人军队。会长必须是 S 级猎人。最大的爱好是强行挖角别人的人才。
2. **Hunter Association (猎人协会)**
   - **特点**：名义上代表政府管理所有猎人和传送门，但实际上是个被公会牵制、战力严重不足的“发证机关”。协会会长通常是个白发苍苍的老头，最后会极其欣赏主角。
3. **Dark / Villain Syndicate (地下暗杀工会/偷猎者)**
   - **特点**：承接在地下城里杀人越货的脏活（在地下城死了没人能查清）。通常是不长眼去惹了主角，导致整个公会被主角一个人在一个夜晚全部屠灭。',
'## "Faction" Generation — Modern Dungeon Break

Factions here are super-powered conglomerates wearing bespoke suits and riding corporate helicopters.

### Design Guide
1. **Top-Tier Mega Guild (National Super Corporations)**
   - e.g., White Tiger Guild, The Reaper Syndicate.
   - **Characteristics**: Headquartered in massive 100-story glass skyscrapers. They own mining divisions, entertainment PR sectors, and private armies. The Guild Master MUST be an S-Rank hunter. Their primary hobby is aggressively trying to poach the MC via briefcases of cash (which the MC rejects).
2. **Hunter Association (Government Overseers)**
   - **Characteristics**: Nominally represents the government, regulating Gates and licensing. In reality, they severely lack combat power and are constantly bullied by the Mega Guilds. The Association President is usually a wise, tired old man who immediately recognizes the MC''s value and covers up the MC''s murders.
3. **Dark / Assassin Syndicate (The Poachers)**
   - **Characteristics**: Hunters who make a living accepting assassination hits inside Dungeons (because what happens in the Dungeon stays in the Dungeon). They make the fatal mistake of targeting the MC, resulting in the MC literally wiping out their entire hundreds-strong organization in a single bloody rainy night.', @method_id, 1, 41, NOW()),

-- 8. Scene
('dungeon-scene-gen', '「场景」生成：生成突变的红色传送门、血流成河的首领房与极奢极贵的公会大厦', 'Generate mutated Red Gates, blood-soaked boss rooms, and ultra-luxurious corporate HQs',
'## 「Scene (场景)」生成 — 现代猎人流

最强烈的场景冲击力，来自于**“都市的脆弱文明”**与**“充满粘液和血肉的怪物巢穴”**之间的瞬间切换。

### 场景设计指南
1. **S-Rank Red Gate (S级红色传送门)**
   - **特色**：极度危险的变异地下城。里面可能是无尽的寒冰地狱，也可能是充满参天火红色巨树的精灵屠宰场。这里屏蔽外界一切信号，是主角“合理合法合规杀人”并升级的最佳场所。
2. **Guild Corporate Headquarters (公会权力中心)**
   - **特色**：充满了现代资本的气息。顶层的全景落地窗，名贵沙发，会长一边抽雪茄一边看着下面跟蚂蚁一样的平民。主角踢碎钢化玻璃直接闯入时的反差感极强。
3. **The Final Dungeon (君王殿堂/天灾降临)**
   - **特色**：当最大的危机降临纽约或首尔市中心，数百座摩天大楼被巨龙压塌。天空如同黑洞般撕裂，巨大的君王端坐在骨座上俯瞰地球。',
'## "Scene" Generation — Modern Dungeon Break

The greatest visual impact comes from the abrupt transition between the **"fragile modern civilization of the city"** and the **"viscous, fleshy horror of a monster nest."**

### Design Guide
1. **S-Rank Red Gate (Mutated Boss Dungeon)**
   - **Characteristics**: An extremely hazardous anomaly. Once you step inside, it could be a frozen hellscape of eternal blizzards or a jungle towering with crimson trees where Elven cannibals hunt. It blocks all external cell signaling—making it the absolute perfect, lawless venue for the MC to slaughter arrogant enemies and grind massive EXP.
2. **Guild Corporate Headquarters (The Boardroom)**
   - **Characteristics**: Reeking of modern capitalism. Penthouse suites, panoramic floor-to-ceiling glass, ultra-rare leather couches. The Guild Master smokes a cigar, looking out at the crawling citizen-ants below. This pristine modern luxury makes it incredibly satisfying when the MC kicks down the steel door and splatters the Guild Master against the glass.
3. **The Final Dungeon (Eruption of the Monarch)**
   - **Characteristics**: The absolute endgame climax. Deep inside Seoul or NY. Hundreds of skyscrapers are instantly crushed by the footfalls of a 500-foot Dragon. The sky tears open like a bleeding black hole, revealing a demonic Monarch sitting upon an ossified throne, staring down at Earth.', @method_id, 1, 61, NOW()),

-- 9. Plot
('dungeon-plot-gen', '「情节Plot」：指导如何设计从装猪吃虎到全球沸腾的经典爽文推进公式', 'Guide to design the classic progression formula: from smurfing to global awe',
'## 剧情设计指南 (Plot Design) — 现代猎人流

情节极其线性且目标明确（打怪、抢装备、杀仇家装B、救死扶伤装B）。主打一个**绝不允许任何毒点和憋屈存在超过三章**。

### 核心情节弧线
1. **苟道与暗爽 (Smurfing in D-Ranks)**：主角觉醒了牛逼的系统，但他知道自己还没满级，被大公会盯上会被解剖。于是他保留Ｅ级的头衔，去做低级副本的“搬运工”。危急时刻，装作意外秒杀了大怪，救了几个A级美女，深藏功与名。
2. **反向打劫与大清洗 (The Purge)**：有个极其欠揍的A级公会少爷得罪了主角，甚至带人进红门副本准备弄死主角。主角直接反锁副本大门：“太好了，这里没有监控。你们，全得死。”然后召唤大军屠杀。
3. **全球瞩目与抵御天灾 (Global Awe)**：日本或美国的S级传送门失控了，全明星豪华猎人阵容全军覆没。眼看一个岛国要沉没。此时主角单枪匹马，骑着黑龙从天而降。一人一刀，一瞬间秒杀了几十万魔兽大军。全球记者疯狂直播，地球人全部跪下高呼神明。',
'## Plot Design Guide — Modern Dungeon Break

The plot is hyper-linear and goal-oriented (Grind -> Get Epic Loot -> Kill hater to show off -> Save innocent to show off). The absolute golden rule: **Do NOT allow the MC to suffer humiliation or frustration for more than 3 chapters without paying it back 100-fold.**

### Core Story Arcs
1. **Smurfing in D-Ranks (The Secret Badass)**: The MC awakens the god-tier system but knows Mega-Guilds will assassinate him to steal his cheat. So, he keeps his fake "E-Rank Porter" badge. During a raid gone wrong, he "accidentally" one-shots the Boss while no one is looking, saving several high-rank damsels, then quietly sweeps up the loot and dips. Secret satisfaction.
2. **The Reverse Robbery (The Purge)**: A highly arrogant A-Rank Heir wants the MC dead and corners the MC inside an isolated Red Gate Dungeon with a 50-man assassination squad. The MC smiles, essentially locking the door behind them: *"Good. There are no cameras here. You''re all dying today."* MC summons an undead army and brutally slaughters the assassins.
3. **Global Awe (The Savior Drop)**: An S-Rank Gate in Japan or the US catastrophically breaks. The entire All-Star National squad is wiped out. A continent is about to sink. Only then does the MC arrive, solo, dropping from the sky riding a skeletal black dragon. With one swing of a dagger, he vaporizes an army of 100,000 demons. The global news broadcasts it live; the entire planet falls to their knees in sheer awe.', @method_id, 1, 100, NOW()),

-- 10. Narrative
('dungeon-narrative', '「叙事与描写 Narrative」：指导战斗中烘托个人气场与路人视角的吹捧法则', 'Guide to describing sheer intimidating aura and using NPC POVs to hype the protagonist',
'## 叙事与描写技巧 (Narrative) — 现代猎人流

你不仅是在写主角有多强，最重要的是要写**配角看到主角有多强时被吓尿的心理活动**。

### 1. 气场与压迫感 (The Dominant Aura)
- S级以上的威压不需要动作，仅仅是呼吸就能让普通人下跪。
- *描写示范*：当主角踏入冰冷的大厅时，原本嚣张跋扈的公会精英们瞬间僵在原地。空气仿佛变成了水银，沉重得让他们无法呼吸。几个意志薄弱的A级猎人双膝一软，直接跪碎了地板。他们惊恐地抬起头，那股漆黑如深渊的杀意，竟然全是从那个年轻人单薄的体内散发出来的！

### 2. 干净利落的速度 (The Speed of Violence)
- 主角杀人绝对不废话，动作永远是一击致命。
- *描写示范*：少爷的冷笑还僵在脸上。没有听到任何破风声，只听见轻微的“咔嚓”一声脆响。少爷的头颅已经以180度的诡异角度垂在后背上。主角正用手帕擦拭着白手套，甚至没有多看地上的尸体一眼。

### 3. 路人/记者的惊呼 (The Peanut Gallery)
- 这是一种非常经典的网文技巧，通过第三者的震撼来侧面描写。
- *“天哪！机器爆炸了！他的魔力值……测出来是...是无法估量的【未知】！这不可能！”测试员尖叫着跌倒在地。*',
'## Narrative and Writing Techniques — Modern Dungeon Break

You are not just describing how strong the MC is; more importantly, you MUST describe **the absolute, pants-wetting terror of the side characters watching the MC.**

### 1. The Dominant Aura (Mana Pressure)
- S-Rank level strength doesn''t require physical action. Just breathing is enough to make mortals kneel.
- *Example*: The moment the MC stepped into the pristine corporate lobby, the arrogant guild elites froze. The air instantly thickened into mercury, so heavy they couldn''t breathe. Several weak-willed A-Rank hunters collapsed, shattering the marble floor with their descending knees. They looked up in sheer horror—that suffocating, abyssal murderous intent was pouring entirely out of that young man''s frail body!

### 2. The Speed of Violence (No Wasted Words)
- Characterize the MC by extreme, ruthless efficiency. Zero monologue before a kill.
- *Example*: The arrogant Heir''s sneer was still frozen on his face. There was no sound of wind, only a sharp, crisp *CRACK*. The Heir''s head was now resting backwards against his own spine. The MC was already wiping his gloves with a silk handkerchief, not sparing the crumpled corpse a second glance.

### 3. The Peanut Gallery (NPC Hype)
- The classic Webnovel technique: use the shock of a third party to escalate the hype.
- *"My God! The mana-crystal exploded! His magic output... the reading is... it''s [UNMEASURABLE]! That''s impossible!" The assessor shrieked, collapsing backward over his chair.*', @method_id, 1, 101, NOW()),

-- 11. Novel Naming
('dungeon-novel-naming', '「书名与大纲生成」：指导生成极具网游猎人风格的爽利系统文大纲', 'Guide to generating punchy, system-infused Solo-Hunter titles',
'## 书名与大纲生成指南 — 现代猎人流

书名一定要点题“独自”、“升级”、“最弱到最强”这些抓住读者眼球的爆款词汇。

### 1. Title Generation (书名命名偏好)
- **独狼升级风**：`[Solo / Only I] + [Level Up / Can See Stats]` (例：*Solo Leveling*, *Only I Level Up*, *The Lone Necromancer*, *Solo Max-Level Hunter*)
- **废柴逆袭风**：`[The F-Rank / The Weakest] + [Turns into SSS-Rank/Monarch]` (例：*The F-Rank Hunter''s Cheat System*, *Return of the F-Class Ranker*, *I Became the SSS-Rank Boss*)

### 2. Synopsis Generation (三段式大纲结构)
- **第一段：最惨的开场 (The Weakest)**：介绍地下城崩坏的背景，抛出主角是人类史上最弱的E级猎人，每天为了母亲的医药费在下级地下城里拿命去赌，受尽财阀猎人的嘲笑与剥削。
- **第二段：神级反转 (The Dual Awakening)**：主角在一次S级陷阱中被队友作为诱饵抛弃。在即将被处决的时刻，他触发了隐藏条件（死斗之心），觉醒了全大陆唯一可以像游戏一样“打怪升级”的隐藏职业（如死灵法师）。
- **第三段：横扫全球 (The Monarch Returns)**：别人苦修十年无法逾越的境界，他只要砍几天哥布林就能超越。简介最后要高调宣告：他将踩着那些高傲的公会会长和魔神的尸体，成为这颗星球唯一的绝对君王。',
'## Title & Synopsis Generation Guide — Modern Dungeon Break

Titles must immediately flag down the tropes: "Solo", "Leveling/System", and "Weakest to Strongest". Punchy and direct.

### 1. Title Generation Preferences
- **The Solo Grinder**: `[Solo / Only I] + [Action/Cheat]` (e.g., *Solo Leveling*, *Only I Am a Necromancer*, *Solo Max-Level Hunter*, *The Lone Sorcerer*).
- **The Rank Reversal**: `[The Weakest/F-Rank] + [Becomes SSS-Rank/Boss]` (e.g., *The F-Rank Hunter''s Cheat System*, *Return of the F-Class Ranker*, *I Became the SSS-Rank Boss*).

### 2. Synopsis Generation (Three-Act Structure)
- **Act 1: The Weakest**: Introduce the modern society reliant on Gates. Introduce the MC as the historically weakest E-Rank Hunter, bleeding daily in garbage-tier dungeons just to pay his mother''s hospital bills, enduring the mockery and exploitation of corporate Hunters.
- **Act 2: The Dual Awakening**: Trapped in a hidden Red Gate and used as bait by treacherous teammates. In the final second before being eaten, he fulfills a hidden condition (The Will to Slaughter) and awakens a Class Inheritance. He becomes the sole human capable of treating the real world like an RPG, leveling up infinitely.
- **Act 3: The Monarch Returns**: While S-Ranks hit a hard ceiling, the MC breaks his limits by casually slaying goblins. The synopsis must end fiercely declaring: He will step over the corpses of arrogant Guild Masters and invasive Demon Gods alike to take his seat as the sole Absolute Monarch of Earth.', @method_id, 1, 102, NOW()),

-- 12. Entity Naming
('dungeon-entity-naming', '「名词生成指南」：指导生成网感极强、帅气且中二的评级、称号与公会名', 'Guide to generating edgy and sleek Rank systems, Titles, and corporate Guilds',
'## 专有名词生成指南 (Entity Naming) — 现代猎人流

不需要文绉绉的长句。词汇一定要展现出**极简、冰冷、和强烈的阶级感**。英文由于其字面结构，很容易展现出极客与硬核的味道。

### 1. 评级与面板 (Rankings & UI Panels)
- 使用绝对枯燥但有说服力的字母评级。
- *Hunter Rank*：F-Rank (肉盾), A-Rank (国家精英), S-Rank (人形核弹), Unmeasurable/National Level (无法估量/国家级战力)。
- *System UI*：Daily Quest: Preparing to be Powerful (日常任务：强者的准备)；Penalty Zone (惩罚区)。

### 2. 极其炫酷的隐藏职业与头衔 (Classes & Titles)
- 主角的名字必须帅，带有一种寂灭和统治感。
- *职业*：Shadow Monarch (暗影君王), Ruler of the Abyss (深渊尺座), Necromancer Supreme (至高亡灵法师)。
- *头衔 (配带可以加属性)*：The Wolf Slayer (屠狼者), One Who Overcame Adversity (逆境克服者)。

### 3. 公会与怪物 (Guilds & Bosses)
-公会名字要像极了现代大热运动俱乐部或者巨型跨国财团。怪物则是史诗感。
- *Guilds*：Hunters Guild (猎人公会), Scavenger Guild (拾荒者公会), White Tiger Guild (白虎公会 - 非常偏韩国/亚洲风的命名), The Reaper Corporation (死神集团)。
- *Monsters/Gates*：Kamar, the Blood-Red Orc (血红兽人卡玛), The Twin-Headed Ogre of the Red Gate (红门双头食人魔)。

**AI 动作要求**：在使用英文命名时，为了贴合并迎合目前欧美流行的（Webnovel/Manga）品味，强烈建议使用简短有力的双字组合（The [Noun] [Noun]）。避免像古典奇幻那样拖泥带水。要确保读者一眼就看出这是一个充满RPG感和爽文感的世界。',
'## Entity Naming Guide — Modern Dungeon Break

Do not use verbose, flowery sentences. Vocabulary must be **minimalist, cold, and heavily emphasize the strict hierarchy of power.** The English terminology should heavily lean into Hardcore Gaming and Corporate Aesthetics.

### 1. Rankings & UI Panels
- Use dry, alphanumeric, highly persuasive grading systems to emphasize the wall between ranks.
- *Hunter Ranks*: F-Rank (Useless luggage), A-Rank (National Elites), S-Rank (Walking WMDs), Unmeasurable/National Level Hunter (The absolute peak).
- *System UI*: [Daily Quest: Preparing to be Powerful]; [Penalty Zone].

### 2. Edgy Hidden Classes & Titles
- The MC''s abilities must sound immensely badass, carrying a sense of death and absolute rulership.
- *Classes*: Shadow Monarch, Ruler of the Abyss, Mythic Necromancer.
- *Titles (Grants Stat boosts)*: The Wolf Slayer, The One Who Overcame Adversity, The Demon Hunter.

### 3. Guilds & Bosses
- Guilds should sound like multinational conglomerates or elite sports franchises. Monsters contrast this with classic epic fantasy names.
- *Guilds*: The Hunters Guild, The Scavenger Guild, White Tiger Corporation (very Korean webtoon flavor), Reaper Syndicate.
- *Monsters*: Kamar, The Blood-Red Orc; Igrit, The Blood Knight.

**AI Action Requirement**: To match the current trending tastes in Western Webnovels (LitRPG/Progression Fantasy), strongly favor short, punchy, two-word combinations (The [Noun] [Noun]). Avoid the flowing, poetic names of high fantasy. Ensure the reader instantly knows this is a world defined by raw stats, RPG grinding, and satisfying power-fantasies.', @method_id, 1, 103, NOW())
ON DUPLICATE KEY UPDATE description=VALUES(description), instructions=VALUES(instructions);
