-- Skills for The Mastermind / DiHua Novel
-- Executes 12 skills for the novel creation method

SET @method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Mastermind (Behind-the-Scenes) Novel' LIMIT 1);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES 
-- 1. Story Hook
('mastermind-story-hook-setting-gen', '生成「Story Hook」：为幕后黑手流设计微末开局与装杯系统的觉醒', 'Generate Story Hook for Mastermind/DiHua',
'## 「Story Hook」生成 — 幕后黑手/迪化流

核心看点在于**“用最弱的实力装最大的B”**。

### 生成指南
1. **The Weak Reality (主角的悲惨现实)**：主角甚至不如个普通人，可能是绝症患者、没有灵根的废柴，面临即将到来的杀局。
2. **The Mastermind System (幕后黑手系统)**：主角突然获得了能够“编造历史”、“凭空捏造马甲（分身）”或“强行拉人进入神秘空间”的系统。但这个系统没有任何直接杀伤力。
3. **The First Great Misunderstanding (迪化开端)**：一位不可一世的顶级强者（杀手/大帝）找上门。主角因为过度恐惧而面无表情。强者看到主角桌上的某个普通物件（或者主角随口说的一句话），脑补出了极其恐怖的宇宙级阴谋，当场吓得跪地求饶/宣誓效忠。',
'## "Story Hook" Generation — The Mastermind / DiHua

The core appeal is **"Acting like an absolute God while possessing zero actual power."**

### Guide
1. **The Weak Reality**: The MC is weaker than a normal person—perhaps terminally ill, having zero talent, and facing an imminent assassination.
2. **The Mastermind System**: The MC awakens a system to "Fabricate History," "Create Puppets/Avatars," or "Pull souls into a mysterious Mind-Space." Crucially, this system has zero direct combat power.
3. **The First Misunderstanding (DiHua)**: An invincible powerhouse (assassin/emperor) approaches to kill the MC. The MC is paralyzed by fear, resulting in a completely expressionless face. The powerhouse sees a mundane object on the MC''s desk (or hears a stuttered sentence) and overthinks it into a terrifying cosmic conspiracy. Terrified, the powerhouse instantly drops to their knees and swears loyalty.', @method_id, 1, 1, NOW()),

-- 2. Core Premise
('mastermind-core-premise-setting-gen', '生成「Core Premise」：设定主角的神秘人设与虚构的庞大组织', 'Generate Core Premise for Mastermind',
'## 「Core Premise」生成 — 幕后黑手/迪化流

主角的核心资产不是神器，而是他**“吹出来的牛逼”**。

### 生成指南
1. **The Fake Persona (虚假人设)**：比如“愚者”、“最初的造物主”、“基金会O5议会会长”。必须是一个听名字就让人不敢直视的存在。
2. **The Fabricated Organization (虚构组织)**：主角虚构了一个横跨万古的隐秘组织（如塔罗会、夜守、拂晓）。并且向世人暗示，目前的各大正教和帝国，不过是这个组织曾经的弃徒而已。
3. **The Currency of Power (震惊值体系)**：主角为什么要装？因为系统的升级、兑换真实的力量，都必须来源于世人对他的【恐惧、敬畏、信仰】。别人越觉得他牛逼，他就真的越来越牛逼。',
'## "Core Premise" Generation — The Mastermind

The MC''s core asset isn''t a divine artifact; it''s the **"Grand Scam"** they have fabricated.

### Guide
1. **The Fake Persona**: e.g., "The Fool," "The Primordial Creator," "O5 Council Head." It must be an entity whose mere name evokes cosmic dread.
2. **The Fabricated Organization**: The MC makes up an ancient, omnipresent hidden organization (e.g., Tarot Club, The Dawn, SCP). They hint to the world that the current ruling Orthodox Churches and Empires are merely failed offshoots of this true organization.
3. **The Currency of Power (Awe/Shock Value)**: Why does the MC act so tough? Because upgrading the system and buying actual superpowers requires harvesting "Awe, Terror, and Belief" from the public. The more the world thinks they are a god, the closer they become to actually being one.', @method_id, 1, 2, NOW()),

-- 3. System Mechanics
('mastermind-system-mechanics-setting-gen', '生成「System Mechanics」：设计幕后马甲创建、信息碾压与系统限制', 'Generate System Mechanics for Mastermind',
'## 「System Mechanics」生成 — 幕后黑手/迪化流

系统是支撑主角这个惊天骗局的唯一支柱。

### 生成指南
1. **Illusion/Puppet Creation (捏脸与马甲)**：主角可以捏造不存在的高手。比如主角本尊在家喝茶，却操控着一个戴着小丑面具的【SS级刺客马甲】在皇城大杀四方。世人以为这是组织里的小喽啰。
2. **Information Supremacy (信息差碾压)**：力量不足，情报来凑。系统能让主角一眼看穿任何人的底裤（祖宗十八代、修炼弱点、最大的秘密）。主角轻描淡写地说出对方深藏的秘密，直接击溃对方心理防线。
3. **The Cost/Limitation (装B的代价)**：马甲只能存在10分钟？一旦有人看穿了不符合逻辑的地方，马甲就会当场暴毙？这为剧情提供了强烈的走钢丝般的紧张感。',
'## "System Mechanics" Generation — The Mastermind

The system is the sole pillar preventing the MC''s cosmic scam from collapsing.

### Guide
1. **Illusion/Puppet Creation (The Avatars)**: The MC can fabricate non-existent experts. The MC is sipping tea at home, while safely controlling an [SS-Rank Assassin Avatar] wearing a clown mask to slaughter enemies in the capital. The world thinks this assassin is just a low-ranking grunt of the Organization.
2. **Information Supremacy**: Lacking raw power, the MC relies on absolute intellect. The system allows the MC to see everyone''s deepest files (ancestors, hidden fatal flaws, darkest secrets). The MC casually whispers their deepest secret, instantly shattering their psychological defenses.
3. **The Cost/Limitation (The Tightrope)**: Avatars only last 10 minutes? If a logical flaw is discovered by a genius enemy, the illusion shatters permanently? This maintains high-stakes, sweat-inducing tension.', @method_id, 1, 3, NOW()),

-- 4. Worldbuilding
('mastermind-worldbuilding-setting-gen', '生成「Worldbuilding」：设计充满阴谋论与被自我攻略的世界', 'Generate Worldbuilding for Mastermind',
'## 「Worldbuilding」生成 — 幕后黑手/迪化流

这个世界的高层必须**极度聪明且多疑（Paranoid）**。因为蠢人是不会“迪化”的，只有极其聪明的人，才会被自己的阴谋论脑补吓死。

### 生成指南
1. **The Paranoia Level (阴谋论的世界)**：所有的顶级强者都是千年的狐狸。他们看到主角喝了一口水，就会分析：“这杯水的位置对应星象，他的眼神落向东南，这是在警告我东南方的魔宗有变！”（实际上主角只是渴了）。
2. **Existing Global Threats (真实的末日威胁)**：存在着连帝国大能都无法解决的恐怖灾变（比如古神复苏）。然后主角随便派个“马甲”去溜达了一圈，碰巧引发了系统Bug把古神秒了。
3. **The Historical Gap (历史的空白期)**：世界上有一段谁也不知道的断代史。主角无耻地将这段时期据为己有：“哦，那时候正好是我打了个盹。”',
'## "Worldbuilding" Generation — The Mastermind

The highest echelons of this world must be **extremely intelligent and paranoid**. Idiots don''t "Overthink" (DiHua); only geniuses can terrify themselves to death with their own complex conspiracy theories.

### Guide
1. **The Paranoia Level**: All top-tier natives are 1000-year-old schemers. When they see the MC take a sip of water, they analyze: *"The cup''s placement aligns with the constellations, and his gaze drifted Southeast. He is warning me of an uprising in the Southeast Demonic Sect!"* (The MC was just thirsty).
2. **Existing Global Threats**: The world is facing an unsolvable apocalyptic threat (e.g., Outer God awakening). The MC accidentally sends a low-level Avatar for a walk, triggers a system bug, and accidentally one-shots the Outer God.
3. **The Historical Gap**: There is a lost era of history. The MC shamelessly claims it for their fake organization: *"Ah, the Blank Era... yes, that was when our organization decided to take a short nap."*', @method_id, 1, 4, NOW()),

-- 5. Writing Style
('mastermind-writing-style-setting-gen', '生成「Writing Style」：指导内心独白与外界视角的终极反差装B描写', 'Generate Writing Style for Mastermind',
'## 「Writing Style」生成 — 幕后黑手/迪化流

必须把**上帝视角的喜剧感**拉满。读者看着主角走钢丝，知道他是个菜狗，但里面的人不知道。

### 生成指南
1. **Dramatic Irony (戏剧反讽的极致对比)**
   - **内心独白**：*“卧槽他拔剑了！完了完了我连逃跑的力气都没有了，腿好软，只能瘫坐在椅子上了！”*
   - **敌人视角**：*“面对我这毁天灭地的一剑，他竟然不躲不闪，甚至慵懒地靠在了椅背上！这是何等藐视天下的王霸之气！”*
2. **The Aura of Mystery (神秘感的包装)**
   - 主角说话绝对不能超过三个词。要多用“微笑、轻敲桌面、注视”代替长篇大论。让别人去猜。
3. **Pacing of Reveals (马甲掉落的节奏)**
   - 一千章里，主角从来没有亲自出过一拳，全靠马甲和手下的脑补平推了宇宙。',
'## "Writing Style" Generation — The Mastermind

You must maximize the **comedic dramatic irony of the Omniscient Reader POV**. The reader knows the MC is sweating bullets and weak as a puppy, but the characters inside the book think the MC is Cthulhu.

### Guide
1. **Dramatic Irony (The Ultimate Contrast)**
   - **MC''s Internal Monologue**: *"Holy crap he drew his sword! I''m dead, I have zero stamina to run, my legs are jelly, I can only collapse back into my chair!"*
   - **Enemy''s POV**: *"Facing my world-shattering sword strike, he didn''t even flinch. He just lazily leaned back into his chair! What absolute, terrifying arrogance! He views me as nothing more than an insect!"*
2. **The Aura of Mystery**
   - The MC must NEVER speak more than three words at a time. Rely heavily on "smiling mysteriously, tapping the table rhythmically, and silent, deep gazes." Force the enemies to guess (and terrify themselves).
3. **Pacing of Reveals**
   - Over a thousand chapters, the MC never throws a single punch personally. The universe is conquered entirely via Avatars and the subordinates'' overactive imaginations.', @method_id, 1, 5, NOW()),

-- 6. Character
('mastermind-character-gen', '「角色」生成：生成战战兢兢的幕后大佬、狂热迪化手下与绝顶聪明的敌人', 'Generate paranoid mastermind MC, zealous DiHua subordinates, and genius enemies',
'## 「角色」生成 — 幕后黑手/迪化流

角色的“人设”是被环境逼出来的。主角是赶鸭子上架，配角是极力脑补。

### 角色设计重点
1. **The Mastermind (主角)**：
   - 极其擅长表情管理（面瘫）。最大的被动技能是“运气极好”，每次无论怎么胡扯，最后总能阴差阳错地在现实中应验验。
2. **The Loyal Zealot (狂热信徒/得力干将)**：
   - 本来就是个绝世天才，被主角一句废话点悟，突破了境界。从此成了第一“保皇党”，脑补一切合理化主角的错误。*“主上这一步看似下了一招臭棋，实则是在大气层之上布局五百年后的因果！”*
3. **The Overthinking Genius Enemy (绝顶聪明的敌人)**：
   - 智商极高，掌控雷电的反派大帝。他的灭亡原因往往是因为把主角想得太恐怖，导致自己不敢动手，把底牌全部暴露，最后自己把自己吓死或者投降。',
'## "Character" Generation — The Mastermind

Character concepts in this genre are forced by the environment. The MC is forced to fake it until they make it; the side characters are forced to overthink everything.

### Design Focus
1. **The Mastermind (MC)**:
   - God-tier at facial expression management (stone-faced). Their greatest passive skill is "Luck"—no matter what absolute nonsense they confidently spout, random universe events happen to perfectly validate it later.
2. **The Loyal Zealot (The DiHua Enforcer)**:
   - Already a peerless native genius. They were "enlightened" when the MC accidentally said a random quote from Earth. Now they are the ultimate fanatic zealot, rationalizing all of the MC''s mistakes: *"The Lord''s move seems flawed, but in truth, He is laying down karmic threads for a plot 500 years in the future!"*
3. **The Overthinking Genius Enemy**:
   - Exceedingly high IQ, ruler of an evil empire. His downfall is entirely because he analyzes the MC''s actions too deeply. Terrified by his own conclusions, he never attacks, exposes all his trump cards out of paranoia, and eventually scares himself into surrender or suicide.', @method_id, 1, 21, NOW()),

-- 7. Faction
('mastermind-faction-gen', '「势力」生成：生成主角编造的古老神秘组织及其马甲架构', 'Generate fabricated ancient organizations and the terrifying lore assigned to them',
'## 「Faction (势力/组织)」生成 — 幕后黑手/迪化流

主角的组织其实是一个*皮包公司*，里面只有主角一个人在玩换装游戏。

### 势力设计指南
1. **MC''s Fabricated Organization (主角捏造的神秘组织)**
   - 名字必须带着克苏鲁或极其古老的味道。
   - **Lore/Mythology**：对外宣称，世界上的神明只是他们的编外人员。组织里有12大席位，每个席位都是毁天灭地的古老代号。
   - **真相**：整个组织一共就两个人，一个是主角本尊，一个是主角用泥巴捏的纸人分身。
2. **Orthodox Church / Real Ancient Empire (天下共主)**
   - 这个世界的官方最高权力。他们越是花费无数国力去查探主角的组织，越是查不到（因为根本不存在），他们就越觉得毛骨悚然。',
'## "Faction" Generation — The Mastermind

The MC''s organization is essentially a *shell company* where the MC is playing a one-man multi-role dressing game.

### Design Guide
1. **MC''s Fabricated Organization (The Shadow Syndicate)**
   - The name must exude Eldritch or primordial vibes.
   - **Lore/Mythology**: Released PR statement to the world: "The current Gods are merely our expelled trainees." They claim 12 Supreme Seats, each bearing a world-ending moniker.
   - **The Truth**: The entire organization consists of exactly two members: The MC, and a paper-mache clone the MC built yesterday.
2. **Orthodox Church / Real Ancient Empire (The Powers That Be)**
   - The official highest authority in the world. The more national treasury they expend trying to investigate the MC''s organization, the less they find (because it literally didn''t exist before last week). This complete lack of historical records makes them even more terrifyingly convinced of the organization''s supreme stealth.', @method_id, 1, 41, NOW()),

-- 8. Scene
('mastermind-scene-gen', '「场景」生成：生成神秘的源堡聚会空间、凭空捏造的远古遗迹', 'Generate secret mind-spaces, mind-meeting tables, and fake ancient ruins for Mastermind',
'## 「Scene (场景)」生成 — 幕后黑手/迪化流

装B需要舞台，也就是俗称的“神域”或“灰雾之上”。

### 场景设计指南
1. **Secret Mind-Space / Divine Realm (神秘的心智会议室)**
   - 类似《诡秘之主》的灰雾之上、长青铜桌。
   - **Atmosphere**：主角将大人物的灵魂拉入这个精神空间。这里没有边际，漂浮着星辰的碎片。大人物们惊恐地发现自己的力量在这里归零，只能看着坐在主位的那个笼罩在迷雾中的身影（主角）瑟瑟发抖。
2. **Fake Ancient Ruin (伪造的远古遗迹)**
   - 主角为了圆谎，用系统在地下强行建造了一个遗迹，里面刻满了古老的壁画。
   - 当土著的考古学家九死一生进入遗迹，看到壁画上描绘的主角的伟岸身影时，“传说竟然是真的！”',
'## "Scene" Generation — The Mastermind

Acting like a supreme being requires a suitable stage—often called a "Divine Realm" or "Above the Gray Fog."

### Design Guide
1. **Secret Mind-Space / Divine Realm (The Meeting Room)**
   - E.g., The long bronze table above the gray fog in *Lord of the Mysteries*.
   - **Atmosphere**: The MC pulls the souls of absolute titans into this mental dimension. The realm is endless, floating with remnants of shattered galaxies. The titans horrifiedly realize their earthly powers are nullified here. They can only tremble as they look at the enshrouded figure sitting at the head of the table (the MC).
2. **Fake Ancient Ruin (Constructed by the MC)**
   - To cover a lie they told yesterday, the MC uses the system to hastily generate a massive underground ruin filled with "ancient" murals.
   - When native archaeologists survive horrific traps to reach the end, seeing the MC''s majestic silhouette carved into 10,000-year-old stone, they weep: *"The legends... they were all true!"*', @method_id, 1, 61, NOW()),

-- 9. Plot
('mastermind-plot-gen', '「情节Plot」：指导如何设计掉马边缘试探、马甲收割崇拜值的情节弧线', 'Guide to design tightrope-walking reveals and harvesting Awe points for Mastermind',
'## 剧情设计指南 (Plot Design) — 幕后黑手/迪化流

情节的驱动力是**“维护人设的谎言，必须用更大的谎言去圆”**（Fake it till you make it）。

### 核心情节弧线
1. **被迫入局 (The Accidental Scam)**：主角面临死亡绝境，顺口编造了一个名字（如黄衣之王），结果好死不死，天现异象（天气预报），敌人当场跪下。主角获得了第一笔【震惊值】。
2. **制造神迹 (Manifesting the Myth)**：震惊值越滚越大。世人都在寻找关于这个神秘组织的蛛丝马迹。主角为了不被发现这是个空壳，只能用系统不停地制造各种马甲（分身）去外面搞事、杀古神、救世。
3. **巅峰对决（假戏真做）(The Grand Illusion Made Real)**：当幕后最大的反派企图灭世时，全世界都在祈祷主角的降临。主角只能硬着头皮把所有的资源梭哈，召唤出传说中的最终马甲。一剑劈开星球，装完最极致的B之后，在家里虚脱。',
'## Plot Design Guide — The Mastermind / DiHua

The plot is driven entirely by **"To maintain a massive lie, you must tell an even more terrifying, larger lie"** (Fake it till you make it).

### Core Story Arcs
1. **The Accidental Scam**: Facing imminent murder, the MC stutters out a fake name (e.g., The King in Yellow). By sheer coincidence, an eclipse happens. The enemy drops to their knees. The MC receives their first batch of [Awe Points].
2. **Manifesting the Myth**: The lie snowballs. The entire continent is searching for traces of this Divine Organization. To prevent the world from discovering it''s just an empty shell, the MC uses points to constantly generate high-tier Avatars to randomly assassinate Outer Gods or save cities, reinforcing the terror.
3. **The Grand Illusion Made Real**: When the true ultimate villain attempts to destroy the world, everyone is desperately praying for the MC to act. Sweating profusely, the MC goes all-in, betting every single Awe Point to manifest the "True Form Avatar." One sword strike cleaves the planet in half, saving the world and asserting absolute dominance. The MC then returns home and passes out from exhaustion.', @method_id, 1, 100, NOW()),

-- 10. Narrative
('mastermind-narrative', '「叙事与描写 Narrative」：指导用上帝视角烘托主角高深莫测与手下的狂热脑补', 'Guide to describing omniscient perspectives and fanatic DiHua rationalizations',
'## 叙事与描写技巧 (Narrative) — 幕后黑手/迪化流

叙事必须充满**信息不对称**所带来的极致幽默和高逼格。

### 1. 语言的极简与留白 (The Power of Silence)
- 真正的高手从不解释。
- **描写示范**：面对大帝的愤怒质问，主角甚至没有放下手中的茶杯。茶盖在瓷杯上发出清脆的碰撞声。他仅用眼角的余光暼了对方一眼，语气慵懒、不带丝毫烟火气：“你，也配问我？”（其实内心：我打不过他我不敢动啊呜呜呜）。

### 2. 迪化对象的心理戏 (The DiHua Monologue)
- 大量笔墨要花在描写**配角的震惊与脑补**上。
- **描写示范**：*大帝看到那极其轻柔的茶杯碰撞，灵魂如遭雷击。那不是普通的碰撞……那是大道之音！在碰撞的那一刻，周围的法则都被扭曲了！他竟然随时能将我抹杀！*

### 3. 多线操作的蒙太奇 (Multi-Boxing Montage)
- 描写主角本体在睡觉，几万公里外的马甲A在屠龙，马甲B在和帝国交涉。',
'## Narrative and Writing Techniques — The Mastermind

The narrative must be dripping with the extreme humor and epic "hype" generated by **Information Asymmetry**.

### 1. The Power of Silence and Minimalism
- True Gods do not explain themselves.
- **Example**: Facing an Emperor''s furious interrogation, the MC doesn''t even put down his teacup. The porcelain lid clinks gently against the rim. He merely glances out of the corner of his eye, his tone lazy and completely devoid of human warmth: *"You... dare to question me?"* (Internal thought: *If I move a muscle he''s going to realize I have zero aura, save me*).

### 2. The DiHua Monologue (The Target''s Paranoia)
- Heavy word counts must be dedicated to describing the **Side characters'' absolute shock and over-rationalization**.
- **Example**: *The Emperor saw the gentle clink of the teacup, his soul struck by lightning. That wasn''t a normal sound... that was the resonant vibration of the Great Dao itself! The spatial laws warped for a microsecond! He could erase me at any moment!*

### 3. Multi-Boxing Montage
- Highlight the sheer absurdity of the MC sleeping comfortably on his couch, while 10,000 miles away, Avatar A is slaughtering a dragon in a bloodbath, and Avatar B is coldly negotiating planetary treaties.', @method_id, 1, 101, NOW()),

-- 11. Novel Naming
('mastermind-novel-naming', '「书名与大纲生成」：指导生成反差感强烈、突显幕后大Boss设定的轻小说标题', 'Guide to generate contrast-heavy Light Novel titles emphasizing the Boss persona',
'## 书名与大纲生成指南 — 幕后黑手/迪化流

书名必须体现“名不副实”或者“被全世界误会”的核心幽默感。

### 1. Title Generation (书名命名偏好)
- 反差自爆风：`[I Am Not / Stop Pretending] + [Supreme Entity]` (例：*I''m Really Not the Demon God*, *Stop Worshipping Me!*, *I Just Wanted to Survive, Why Am I the Supreme Overseer?*)
- 幕后布局风：`[My Subordinates/The World] + [Are Too Competent / Terrified]` (例：*My Disciples Are All DiHua Geniuses*, *Behind the Scenes: Claiming to be the Creator*)

### 2. Synopsis Generation (三段式大纲结构)
- **第一段：蝼蚁开局与绝境谎言**：没有任何外挂或者修为全废的悲惨现状，眼看就要被砍死，只能随口扯了一个弥天大谎，声称自己是某沉睡刚醒的古神。
- **第二段：谎言成真与不可名状的误会**：由于系统（或者极其邪门的运气）的加持，敌方顶级高手真的相信了。越来越多的大能哭着喊着抱大腿，主角只好含泪收下这群恐怖的打手，被迫扮演冷血的幕后黑手。
- **第三段：掌控宇宙**：全宇宙都在他的“算计”中瑟瑟发抖，尽管他最初的梦想真的只是苟活下去而已。',
'## Title & Synopsis Generation Guide — The Mastermind / DiHua

Titles must reflect the "Imposter Syndrome" or the "Misunderstood by the World" core humor.

### 1. Title Generation Preferences
- **Self-Report Contrast**: `[I Am Not / Stop Pretending] + [Supreme Entity]` (e.g., *I''m Really Not the Demon God*, *Stop Worshipping Me!*, *I Just Wanted to Survive, Why Am I the Supreme Overseer?*).
- **The Puppet Master**: `[My Subordinates/The World] + [Are Too Competent / Terrified]` (e.g., *My Disciples Are All DiHua Geniuses*, *Behind the Scenes: Pretending to be the Creator*).

### 2. Synopsis Generation (Three-Act Structure)
- **Act 1: The Ant''s Trap & The Desperate Lie**: A tragic start with zero cultivation or cheats. About to be killed, the MC blurts out a monumental, cosmic lie, claiming to be an ancient awakened God.
- **Act 2: The Lie Becomes Reality**: Due to the System (or incredibly cursed, flawless luck), the top-tier enemy genius completely buys it. As more and more world-ending powerhouses beg on their knees to join the MC''s faction, the MC is forced to weep internally while coldly playing the role of the Ultimate Puppet Master.
- **Act 3: Accidental Universal Domination**: The entire cosmos trembles under his "unfathomable calculations," even though his original and only dream was to simply survive the day.', @method_id, 1, 102, NOW()),

-- 12. Entity Naming
('mastermind-entity-naming', '「名词生成指南」：指导生成极具神秘色彩与克苏鲁逼格的组织与尊名', 'Guide to generate extremely mysterious, Eldritch-level faction names and monikers',
'## 专有名词生成指南 (Entity Naming) — 幕后黑手/迪化流

装B的关键在于名字。主角扯出来的名词必须让人一看就觉得**不敢直视、充满古老与未知的恐怖**。

### 1. 主角的虚假尊名 (The False Monikers)
- 不要叫“天下第一剑”。要带有宇宙属性、时间感和不可名状感。
- *案例*：The Fool (愚者), The Lord of the Grey Fog (灰雾之主), The Primordial Observer (最初的观察者), The Weaver of Fate (命运编织者)。
- *加长版尊名格式*：`[不属于这个时代的愚者，灰雾之上的神秘主宰...]`。

### 2. 空壳组织的代号 (The Shell Organization)
- 组织名字要尽可能的字少、意宏大，或带有高冷的宗教感。
- *案例*：The Tarot Club (塔罗会), The Order of the Dawn (拂晓神教), The O5 Council (O5议会), Project Babel (巴别塔计划)。

### 3. 被收割的势力/大势 (The Real Threats)
- 这些真实存在的势力名字，用来衬托主角的逼格。
- *案例*：The Abyssal Devourers (深渊吞噬者), The Orthodox Church of the Sun (烈阳正教)。当这个正教的教皇跪倒在主角脚下时，逼格直接拉满。

**AI 动作要求**：在生成主角用于装B的名字时，大量使用【宇宙层面的形容词（Primordial, Eternal, Void）】和【带有神性/宿命色彩的词汇】。绝对不能出现接地气或搞笑的名字，一切搞笑都必须来源于“其实这是假的”这一反差。',
'## Entity Naming Guide — The Mastermind

The key to acting like a Boss is the nomenclature. The nouns the MC invents must make the listener feel **they are unfit to even hear the words—full of ancient, unknown terror.**

### 1. The MC''s False Monikers
- Do not use "Number One Swordsman." Use names carrying cosmic weight, temporal dread, and the ineffable.
- *Examples*: The Fool, The Lord of the Grey Fog, The Primordial Observer, The Weaver of Fate.
- *Extended Honorific Format*: `[The Fool that does not belong to this era, the mysterious ruler above the grey fog...]`.

### 2. The Shell Organization (The Faction)
- Organization names should be minimalist but majestic, carrying a cold, detached pseudo-religious weight.
- *Examples*: The Tarot Club, The Order of the Dawn, The O5 Council, Project Babel.

### 3. The Harvested Targets (The Real Threats)
- The names of the real-world empires. They exist purely to hype up the MC.
- *Examples*: The Abyssal Devourers, The Orthodox Church of the Radiant Sun. When the holy Pope of the Radiant Sun drops to his knees before the MC, the hype is unmatched.

**AI Action Requirement**: When generating the MC''s fake lore names, exclusively use [Cosmic-level Adjectives (Primordial, Eternal, Void)] and [Words dripping with Divinity/Fate]. ABSOLUTELY NO casual, grounded, or funny sounding names. All the comedy must stem from the contrast that "this incredibly epic name was made up by the MC while eating breakfast."', @method_id, 1, 103, NOW())
ON DUPLICATE KEY UPDATE description=VALUES(description), instructions=VALUES(instructions);
