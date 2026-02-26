-- Skills for Alpha Werewolf (Paranormal Romance) Novel
-- Executes 12 skills for the novel creation method

SET @method_id = (SELECT id FROM novel_creation_method WHERE name = 'Alpha Werewolf (Paranormal Romance) Novel' LIMIT 1);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES 
-- 1. Story Hook
('alpha-story-hook-setting-gen', '生成「Story Hook」：设计极致的虐主流开局、当众拒婚与霸总狼王的突然降临', 'Generate Story Hook for Alpha Werewolf: The Rejection and the Savior',
'## 「Story Hook」生成 — 狼人虐恋流 (Paranormal Romance)

此类题材的灵魂在于**“开局必须让女主跌入谷底，受尽羞辱，从而为后面的男主救场/前夫火葬场奠定极强的情感张力”**。

### 生成指南
1. **The Rejection/Inciting Incident (公开拒婚)**：女主18岁成年那天，发现自己的“命中注定伴侣（Fated Mate）”竟然是本族未来的阿尔法（Alpha）。但对方嫌弃女主是个没有狼性的废物（Omega/Runt），当着所有人的面搂着女主的恶毒继妹，冷酷地说：“我拒绝你作为我的伴侣（I reject you as my mate）。”
2. **The Abusive Reality (悲惨的女主现实)**：女主不仅遭遇伴侣的背叛，还被家族视为耻辱，被赶去厨房当奴隶，住地下室，长期发育不良。
3. **The Sudden Fated Encounter (真命天子的降临)**：在女主万念俱灰、甚至被赶出领地遭遇危险时，全大陆最残暴、最嗜血、最富有的“疯批狼王（The True Alpha）”降临了。他在闻到女主气味的一瞬间，双眼血红，内心的野兽疯狂咆哮只有一个词：“MATE（我的）！”',
'## "Story Hook" Generation — Alpha Werewolf / Paranormal Romance

The absolute core of this genre is the **"Cinderella trope pushed to its breaking point."** The MC must hit absolute rock bottom, suffering devastating humiliation, to build explosive emotional payoff when the true Male Lead saves her and the ex suffers.

### Guide
1. **The Rejection/Inciting Incident**: On her 18th birthday, the MC discovers her "Fated Mate" is the future Alpha of her pack. But he despises her for being a "wolf-less weakling." In front of the entire pack, with his arm around the MC''s cruel stepsister, he sneers: *"I, Alpha [Name], reject you as my mate."* The pain shatters her soul.
2. **The Abusive Reality (The Cinderella Grind)**: Betrayed and broken, she is stripped of her rank, forced to scrub floors as an Omega slave, starved, and covered in bruises from the pack''s bullying.
3. **The Sudden Fated Encounter (The Savior)**: Chased out of the territory (or at an inter-pack gala), she locks eyes with the most terrifying, ruthless billionaire Alpha King on the continent. The moment he catches her scent of rain and vanilla, his eyes bleed gold. His inner feral beast roars a single, earth-shaking demand: *"MATE! MINE!"*', @method_id, 1, 1, NOW()),

-- 2. Core Premise
('alpha-core-premise-setting-gen', '生成「Core Premise」：设定女主的隐藏尊贵血脉、男主的疯批诅咒与复仇打脸核心', 'Generate hidden bloodlines, the King''s curse, and the face-slapping premise',
'## 「Core Premise」生成 — 狼人虐恋流

爽点逻辑是典型的**“丑小鸭变绝世黑天鹅”**加**“全球最牛逼的男人只爱我一个”**。

### 生成指南
1. **The Hidden Bloodline (隐藏血脉)**：女主之所以一直无法变成狼，不是因为她是废物，而是因为她的血统太高贵/太古老了（比如她是传说中的纯白狼后 Luna，或者是女巫与狼王的禁忌混血），这股力量在等待一个最顶级的 Alpha 来激活她。
2. **The Alpha''s Curse (男主的诅咒/创伤)**：男主（真命天子）因为曾经受过极其深重的创伤或残绝人寰的诅咒，变得极度嗜血，所有靠近他的女人都会被撕碎。但唯独女主的触碰（或者信息素）能瞬间安抚他狂躁的野兽。只有女主能救赎他。
3. **The Revenge Arc (打脸与追妻火葬场)**：当女主以“至高无上的狼后（Luna King）”身份挽着顶级霸总男主回归故里时，曾经欺凌她的前未婚夫悔得肠子都青了，跪在地上痛哭流涕求她回来，主角直接一脚踹飞。',
'## "Core Premise" Generation — Alpha Werewolf

The gratification logic is a potent mix of **"The Ugly Duckling becomes a lethal Black Swan"** and **"The most terrifying man alive is a puppy only for me."**

### Guide
1. **The Hidden Bloodline**: The reason the MC hasn''t shifted into a wolf isn''t because she is a "runt." It''s because her bloodline is so ancient and regal (e.g., a mythical White Wolf, a Royal Luna, or a hybrid Witch-Wolf) that her body requires an apex Alpha to trigger the awakening.
2. **The Alpha''s Curse**: The True Male Lead is feared globally as a feral tyrant, cursed or traumatized, unable to sleep without suffering bloodlust. Anyone who touches him gets their throat ripped out. Yet, the mere scent of the MC instantly silences the monster in his head. She is his ONLY salvation.
3. **The Revenge Arc (Face-Slapping & Groveling)**: When the MC returns to her old pack—not as a slave, but as the supreme Luna Queen on the arm of the Alpha King—the arrogant ex-mate realizes what he threw away. He falls to his knees, sobbing and begging her to take him back. She coldly crushes him under her designer heel.', @method_id, 1, 2, NOW()),

-- 3. System Mechanics
('alpha-system-mechanics-setting-gen', '生成「System Mechanics」：设计绝对的阶级压制、发情期与灵魂伴侣羁绊法则', 'Generate Pack hierarchies, the Mate bond biology, and mating seasons',
'## 「System Mechanics」生成 — 狼人虐恋流

没有修仙的面板，世界运行依靠动物本能的**费洛蒙（Scent）、阶级（Rank）和命中注定（Fated Mate）**。

### 生成指南
1. **The Mate Bond (伴侣羁绊)**：这是至高无上的法则。当两个命中注定的人锁死眼神，会产生触电般的战栗。如果不标记（Mark/Bite）对方，两个人都会痛苦发疯。强行解除契约（Rejection）会带来仿佛心脏被撕裂的物理剧痛。
2. **Pack Hierarchy Dynamics (阶级压迫与 Alpha 威压)**：Alpha 天生对所有下级狼人有血脉压制力。当顶级 Alpha 发出【Alpha Command】时，周围的狼人会不由自主地露出脖子并跪下臣服。
3. **The Inner Wolf (内心双重人格)**：每一个狼人由“理智的人性”和“暴躁/护食的狼性（Inner Wolf）”组成。大部分时候，主角们的情感冲突来自于人类理智在抗拒，但内心的那头狼在疯狂大喊：“去咬她！去占有他！”',
'## "System Mechanics" Generation — Alpha Werewolf

There are no glowing RPG stats here. This world operates on raw animalistic biology: **Pheromones/Scent, Strict Hierarchies, and the absolute law of the Fated Mate.**

### Guide
1. **The Mate Bond**: The supreme law ordained by the Moon Goddess. Upon locking eyes, an electric, intoxicating gravity pulls them together. The urge to Mark (bite the neck) is overwhelming. A "Rejection" causes literal, agonizing physical pain—vomiting blood and the sensation of a tearing heart.
2. **Pack Hierarchy Dynamics (The Alpha Aura)**: Alphas exude dominant pheromones that literally crush the willpower of lower ranks. When an Apex Alpha uses the "Alpha Command" (a resonant, vibrating growl), lower wolves are biologically forced to bare their necks and drop to their knees in absolute submission.
3. **The Inner Wolf (Dual Persona)**: Shifters possess two minds: Human rationality and the primal Inner Wolf. Conflict often stems from the human mind resisting love out of fear, while the Inner Wolf is ferociously howling and clawing at their mind screaming, *"MATE! CLAIM THEM NOW!"*', @method_id, 1, 3, NOW()),

-- 4. Worldbuilding
('alpha-worldbuilding-setting-gen', '生成「Worldbuilding」：设计披着现代总裁皮的野兽社会与崇拜月神的闭塞部落', 'Generate billionaire werewolf societies, Moon Goddess lore, and Pack rivalries',
'## 「Worldbuilding」生成 — 狼人虐恋流

世界观通常是**“披着霸道总裁皮的现代原始部落”**。

### 生成指南
1. **The Modern Shifter Society (现代野兽财阀)**：狼人们拥有极高的寿命和力量。他们表面上是掌握着华尔街金融帝国、拥有私人直升机和顶级豪车的千亿富豪。但到了满月，他们会在防弹玻璃包裹的原始森林里脱下西装，现出原形互相厮杀。
2. **The Moon Goddess (月神信仰)**：相当于他们世界的老天爷。“是月神把我们配对的。”
3. **Rival Supernatural Species (异界冲突)**：这不仅仅只是谈恋爱，通常外面还有想要统治世界的恶毒吸血鬼亲王（Vampire Coven），或者是专门猎杀狼女的黑暗女巫（Dark Witches），以此推高大后期的战力天花板。',
'## "Worldbuilding" Generation — Alpha Werewolf

The setting is fundamentally **"A primitive apex-predator society wearing bespoke Armani suits."**

### Guide
1. **The Modern Shifter Society (The Wolf Billionaires)**: Shifters possess enhanced healing and strength. On the surface, they are the CEOs of Wall Street empires, flying private jets and driving Bugattis. But during a full moon, they strip off their $5000 suits on their private, heavily guarded forest estates to shift into 8-foot beasts and maul challengers to death.
2. **The Moon Goddess**: The supreme deity and ultimate matchmaker. Believed to pair souls together perfectly. Characters frequently curse her for pairing them with abusers or praise her for finding their true salvation.
3. **Rival Supernatural Species**: It''s not just internal pack politics. To raise the stakes in the late game, incorporate vast Vampire Covens trying to enslave shifters, or Dark Covens of Witches manipulating bloodlines to breed abominations.', @method_id, 1, 4, NOW()),

-- 5. Writing Style
('alpha-writing-style-setting-gen', '生成「Writing Style」：指导极度暧昧的荷尔蒙气味描写与心理极度拉扯的推拉感', 'Guide to writing intoxicating scents, possessive growls, and heavy emotional angst',
'## 「Writing Style」生成 — 狼人虐恋流

这一流派**必须极大地调动读者的感官（嗅觉、触觉）**，文字要充满荷尔蒙爆炸的张力和占有欲。

### 生成指南
1. **Sensory Romance Focus (荷尔蒙气味写学术)**：
   - 不要写“他很帅”。要写：*“他的鼻息喷洒在我的锁骨上，带来一股极其浓烈、让人双腿发软的潮湿松木与雷雨的气息（Pine and Thunderstorm）。他低沉的嗓音像是在胸腔里震动的野兽低吼（Growl）。”*
2. **The Dual POV Pace (视角的虐心切换)**：
   - 女主视角：*“我很痛，我不能再相信任何人了，尤其是不相信这个霸道的暴君。”*
   - 切换男主视角：*“为什么她要躲开我的手？！我是这么渴望把她揉进我的骨血里，去杀光所有伤害过她的人。如果她再看那个男配角一眼，我就捏碎她的喉咙！”（极端的病娇与占有欲）*
3. **Angst & Groveling (极致的追妻火葬场)**：一定要留足够多的篇幅去描写前夫/男主犯错后那种痛不欲生、雨中下跪、卑微到尘埃里求原谅的场面（Groveling）。',
'## "Writing Style" Generation — Alpha Werewolf

This genre **MUST aggressively target the reader''s sensory imagination (smell, touch)**. The prose must drip with explosive hormonal tension and feral possessiveness.

### Guide
1. **Sensory Romance Focus (The Science of Scents)**:
   - Do not just say "He was handsome." Say: *"His hot breath ghosted over my collarbone, washing me in his intoxicating signature scent—a dizzying mix of damp cedar, dark chocolate, and ozone right before a thunderstorm. My knees instantly went weak. A deep, vibrating growl rumbled up from his massive chest."*
2. **The Dual POV Pace (The Emotional Tug-of-War)**:
   - **MC''s POV**: *"I''m broken. I can never trust a dominant Alpha again. I must protect my heart from this tyrant, no matter how good he smells."*
   - **The Alpha''s POV**: *"Why did she flinch from my touch?! My wolf is clawing at my mind, demanding I lock her in my penthouse, mark her until she screams my name, and slaughter every single male who even breathes in her direction!"* (Peak possessive/yandere energy).
3. **Angst & Groveling Mechanics**: You must dedicate heavy word counts to the "Groveling" phase. Whether it''s the ex-mate realizing his mistake or the True Alpha apologizing for an early misunderstanding. They must be reduced to pathetic, weeping, desperate men kneeling in the rain, offering their throat to the MC in submission to beg for forgiveness.', @method_id, 1, 5, NOW()),

-- 6. Character
('alpha-character-gen', '「角色」生成：生成被虐千百遍的白月光女主、霸道偏执狼王与心机绿茶配角', 'Generate abused Omega MCs, dominant possessive Kings, and mean-girl rivals',
'## 「角色」生成 — 狼人虐恋流

角色脸谱化没关系，最重要是**人设极致、反差要大**。

### 角色设计重点
1. **The Resilient Omega (坚强的小可怜女主)**：
   - 表面上：营养不良，身上有鞭伤，被人当狗使唤。
   - 骨子里：极其坚韧、带有一丝野性。当她发怒时，即使是最凶残的狼王也会觉得这只“小野猫”极其迷人。
2. **The Tyrant Alpha (真命天子·疯批狼王)**：
   - 身高至少 190 等于一台双开门冰箱。平时戴着劳力士处理几百亿的跨国收购，是个没有感情的工作机器和战争杀手。但只要一闻到女主的气味，他的理智瞬间崩塌，变成一条大型护主疯犬。
3. **The Regretful Ex-Mate (追悔莫及的渣男前夫)**：
   - 他是个普通的富二代 Alpha，因为颜控或者政治联姻选择了恶毒女配，抛弃了女主。随着女主越来越美、越来越强，他每天晚上都在痛苦地扇自己巴掌。
4. **The Jealous Rival (恶毒绿茶女配)**：
   - 通常是前夫的新欢。极其婊气，虚荣心极强。她的存在就是为了被女主在贵族宴会上霸气打脸拽头发的。',
'## "Character" Generation — Alpha Werewolf

Archetypes reign supreme here. The most important thing is **extreme emotional contrast and rigid personality tropes.**

### Design Focus
1. **The Resilient Omega (The MC)**:
   - **Surface**: Malnourished, wearing ratty oversized clothing, covered in faded scars from pack abuse. Treated like a dog.
   - **Core**: Unbreakable spirit, fiercely stubborn, and possessing a hidden feral edge. When she bares her tiny fangs in defiance, the most terrifying Alpha King finds this "little wildcat" absolutely irresistible and perfect.
2. **The Tyrant Alpha (The True Male Lead)**:
   - Built like a brick wall (6''4"+, massive muscles). Wears a Rolex and handles multi-billion dollar corporate mergers with icy apathy. He is a traumatized war machine. BUT the millisecond he catches the MC''s scent, his rational brain blue-screens, and he devolves into an incredibly possessive, ferociously protective guard dog.
3. **The Regretful Ex-Mate (The Trash Boy)**:
   - A standard spoiled-rich-kid Alpha. He rejected the MC out of vanity to marry the popular mean girl. As the MC awakens her bloodline and becomes devastatingly beautiful and powerful, he spends every night sobbing, punching walls, and agonizing over his monumental mistake.
4. **The Jealous Rival (The Mean Girl)**:
   - The ex''s new chosen "mate." Incredibly vain, manipulative, and cruel. Her entire narrative existence serves to eventually be utterly humiliated and slapped across the face by the MC at a high-society Gala.', @method_id, 1, 21, NOW()),

-- 7. Faction
('alpha-faction-gen', '「势力」生成：生成势利眼的极品家族、暗夜帝国般的霸总公会与流放者营地', 'Generate abusive origin packs, the Alpha King''s empire, and Rogue wolf camps',
'## 「Faction (势力/组织)」生成 — 狼人虐恋流

这些势力/狼群（Pack）的本质，就是换了层皮的豪门世家和黑帮帝国。

### 势力设计指南
1. **The MC''s Abusive Home Pack (女主的极品原生家族)**
   - 例：新月狼群 (Crescent Moon Pack)。
   - **特点**：拜高踩低，唯利是图。族长（也就是前夫的爹）极其专横。他们把女主当奴隶。当女主王者归来时，这个家族在男主的金融制裁和武力碾压下面临破产。
2. **The Male Lead''s Legendary Pack (男主的暗夜帝国)**
   - 例：黑曜石帝国 (Obsidian Empire / Blood Moon Pack)。
   - **特点**：这是全大陆乃至全球最强、最富、手段最残忍的顶级黑帮/财团。他们的成员极其忠诚。当女主被男主带回这里时，原本以为会被吃掉，结果所有的凶恶大汉见了她都全体下跪高呼：“参见女王（Luna）！”
3. **Rogue Wolf Syndicate (流放者营地)**
   - **特点**：没有注册身份的黑户狼人。极其危险，充满犯罪分子，经常在森林边境劫掠。',
'## "Faction" Generation — Alpha Werewolf

These "Packs" are fundamentally just reskinned aristocratic mafia families and billionaire corporate dynasties.

### Design Guide
1. **The MC''s Abusive Home Pack (The Toxic Family)**
   - e.g., The Crescent Moon Pack / The Silver River Pack.
   - **Characteristics**: Social-climbing, deeply snobbish, and cruel. The Alpha (the ex''s father) is a tyrannical snob. They enslaved the MC. Later, they face absolute bankruptcy and humiliating ruin through the Male Lead''s ruthless financial warfare and raw military might.
2. **The Male Lead''s Legendary Pack (The Obsidian Empire)**
   - e.g., The Blood Moon Pack / The Shadow Crown Empire.
   - **Characteristics**: The absolute strongest, richest, and most widely feared mafia/corporate pack in the hemisphere. Extremely loyal warriors. When the terrified MC is dragged here, she expects to be eaten. Instead, hundreds of massive, scarred, terrifying warriors immediately drop to one knee and roar completely in sync: *"All Hail the Luna Queen!"*
3. **Rogue Wolf Syndicate (The Wastelanders)**
   - **Characteristics**: Unregistered, packless wolves driven half-mad by isolation. Lethal, unpredictable criminals who raid pack borders and serve as physical threats to kidnap the Omega MC (which triggers the Alpha''s furious rescue).', @method_id, 1, 41, NOW()),

-- 8. Scene
('alpha-scene-gen', '「场景」生成：生成供人装B的豪华舞厅、充满兽性的黑暗森林与禁闭室', 'Generate glamorous mating Galas, moonlit dangerous forests, and penthouses',
'## 「Scene (场景)」生成 — 狼人虐恋流

场景是用来激化荷尔蒙和放大贫富差距的修罗场。

### 场景设计指南
1. **The Mating Gala (配对舞会/修罗场)**
   - **特色**：极其奢华的宴会厅里，所有的男男女女穿着最名贵的礼服，空气中交织着香水与隐秘的费洛蒙。这就是渣男拒婚，或者男主一把将女主揽入怀中霸气官宣的最佳装B舞台。
2. **The Alpha''s Penthouse (霸总的绝对主场)**
   - **特色**：占据城市最高点的曼哈顿顶层公寓。巨大的落地窗、冷漠的黑色真皮沙发、巨大的水床（笑）。当大门一锁，这里就是充满了浓烈 Alpha 气息的禁区。
3. **The Forest Border (森林边境/命运的相遇点)**
   - **特色**：下着暴雨的黑夜，泥泞的落叶，原始的狂野感。女主在这里绝望奔跑逃命，突然撞到了一堵散发着极其灼热体温的肉墙（男主的胸肌）上。',
'## "Scene" Generation — Alpha Werewolf

Scenes serve as high-tension arenas to force close proximity, inflame hormones, or highlight extreme wealth disparity.

### Design Guide
1. **The Mating Gala (The Crucible)**
   - **Characteristics**: An outrageously opulent ballroom. Crystal chandeliers, bespoke tuxedos, silk gowns. The air is thick with expensive cologne masking intense, primal pheromones. This is the absolute best stage for the Ex to publicly reject the MC, or for the True Alpha to crash through the doors and arrogantly claim the MC in front of the horrified elite.
2. **The Alpha''s Penthouse (The Inner Sanctum)**
   - **Characteristics**: A 100-story high Manhattan penthouse. Floor-to-ceiling windows, cold black leather, sprawling king-sized beds. Smells entirely of the Male Lead''s aggressive, territorial scent. Once the reinforced doors lock, it becomes a suffocating, inescapable, and intensely intimate cage.
3. **The Forest Border/Neutral Zone (The Fated Encounter)**
   - **Characteristics**: Torrential midnight rain, freezing mud, ancient towering pines. Pure, primitive wilderness. The MC is desperately fleeing for her life, drenched and shivering, only to suddenly crash face-first into a wall of radiating, searing body heat (the chest of the 7-foot tall Male Lead stepping out of the shadows).', @method_id, 1, 61, NOW()),

-- 9. Plot
('alpha-plot-gen', '「情节Plot」：指导如何设计“痛彻心扉的退婚—天降神兵—打脸虐渣”的黄金公式', 'Guide to the golden formula: Brutal rejection -> Alpha Savior -> Face-Slapping Revenge',
'## 剧情设计指南 (Plot Design) — 狼人虐恋流

这种文的情节不要太复杂，情绪一定要犹如**过山车般极端**。

### 核心情节弧线
1. **坠入深渊 (The Heartbreak)**：前三章必须狠狠地虐女主。她满心欢喜准备迎接成年礼，却发现自己的男友正跟继妹在偷情。男主当众撕毁婚约，并将她流放在大雨的深夜森林里。
2. **宿命强取豪夺 (The Alpha''s Claim)**：在森林里，她被野兽追杀生不如死，最残暴的狼王从天而降，一巴掌拍碎了怪物的头。狼王闻到了女主的气味直接强制绑定（Mate Bond），哪怕女主拼命抗拒，男主也霸道地将她扛回了帝国城堡。
3. **血脉觉醒与追妻火葬场 (The Queen''s Return)**：女主在男主的地盘上渐渐被治愈，并在某个月圆之夜，蜕变出万年罕见的“银月白狼”真身！男主彻底化为老婆控。而此时，破产的前夫跑来跪下舔鞋求复合，女主手挽着全大陆最强的男人傲视全场，完成极致打脸。',
'## Plot Design Guide — Alpha Werewolf / Paranormal Romance

The plot shouldn''t be a complex geopolitical thriller. The emotional pacing MUST be an **extreme, unhinged rollercoaster of angst and gratification.**

### Core Story Arcs
1. **The Heartbreak (Rock Bottom)**: The first three chapters must brutally torture the MC emotionally. On her 18th birthday, anticipating her shifting ceremony, she catches her beloved Fated Mate sleeping with her cruel stepsister. He publicly shreds their bond, stripping her of rank, and exiling her into the freezing, rain-soaked woods to die.
2. **The Alpha''s Claim (The Kidnapping/Rescue)**: Targeted by Rogue wolves in the dark, she prepares to die. Suddenly, stepping from the shadows, the most feared, ruthless Alpha King obliterates the Rogues with one strike. The paralyzing shock of the Fated Mate bond hits them both. Despite her terrified, traumatized resistance, the King fiercely growls *"MINE!"*, throws her over his massive shoulder, and abducts her back to his impregnable fortress.
3. **The Queen''s Return (The Face-Slap)**: Under the King''s obsessive care, she heals. On a blood moon, she undergoes a terrifying, beautiful transformation, awakening a mythical "Silver Royal Bloodline." She is now the most powerful Luna in history. When her old pack faces bankruptcy, her trash ex-mate falls to his knees attempting to beg her back. Smiling coldly, she stands shoulder-to-shoulder with the most lethal man on earth, and utterly destroys her abusers.', @method_id, 1, 100, NOW()),

-- 10. Narrative
('alpha-narrative', '「叙事与描写 Narrative」：指导娇弱与野蛮的反差描写及雄性生物的占有欲刻画', 'Guide to describing violent possessiveness, fragile defiance, and intense physicality',
'## 叙事与描写技巧 (Narrative) — 狼人虐恋流

必须重点描绘**“体型差”、“力量悬殊”**以及男主在极其残暴的外表下，对女主的**“卑微偏执”**。

### 1. 极致的体型与视觉压迫感 (The Size Difference)
- 强调男主的庞大与女主的娇小。
- *描写示范*：他像一座无法翻越的山头笼罩着我。我颤抖的双后抵在他坚硬如山岩的胸前，连推开他的一丝力气都没有。他粗粝带着老茧的大手轻而易举地包住了我纤细的手腕，只要稍微用力就会折断，但他却像是对待碎玻璃一般小心翼翼。

### 2. 占有欲的具象化 (Feral Possessiveness)
- 把男主写得像一头圈地盘的野兽。
- *描写示范*：看到那个服务生试图递给我一杯酒，他的喉咙深处立刻翻滚起令人毛骨悚然的低吼声。他的双眼瞬间染上了致命的琥珀色，信息素如同一座喷发的火山瞬间压垮了全场的空气。“别看她。”他盯着那个服务生，语气冰冷得能把血液冻结，“再多看一秒，我就把你的眼珠挖出来。”

### 3. 肉体痛苦与欢愉的交织 (The Pain of the Bond)
- *描写示范*：当他强行切断精神链接的那一刻，我感到无数根带刺的铁丝猛地绞碎了我的心脏，一口鲜血直接喷在地毯上。那种灵魂被暴力扯开的空洞感，让我痛得连尖叫都发不出来。',
'## Narrative and Writing Techniques — Alpha Werewolf

You must hyper-focus on **"The size difference," "Absolute power disparity,"** and the contrast between the Male Lead''s horrific violence towards others and his **desperate, paranoid obsession** over the fragile MC.

### 1. The Extreme Size & Weight Disparity
- Emphasize his massive frame caging her tiny body.
- *Example*: He loomed over me like an insurmountable mountain blocking the sun. My trembling hands pressed flat against his chest—it felt like pushing against solid, hot granite. I couldn''t budge him an inch. His massive, calloused hand easily wrapped completely around both my fragile wrists. He could snap them like dry twigs, yet he held me as carefully as spun glass.

### 2. Manifesting Feral Possessiveness
- Write the Male Lead like a territorial apex predator guarding a bone.
- *Example*: When the young waiter offered me a glass of champagne, a terrifying, low rumble boiled deep in the Alpha''s chest. His pupils dilated, the iris bleeding into a lethal, glowing amber. A suffocating wave of dominant pheromones crashed over the ballroom, dropping the temperature to zero. *"Look away from her,"* he commanded the trembling waiter, his voice a blade of pure ice. *"Look at my Luna for one more second, and I will gouge your eyes out with a spoon."*

### 3. The Visceral Pain of the Bond
- *Example*: When he spat the words of rejection, ending the spiritual link between our wolves, it felt as if someone had wrapped my heart in barbed wire and violently yanked. I choked, vomiting sharp black blood onto the pristine carpet. The sheer, hollow agony of my soul being violently ripped in half made it physically impossible for me to even scream.', @method_id, 1, 101, NOW()),

-- 11. Novel Naming
('alpha-novel-naming', '「书名与大纲生成」：指导生成抓人眼球的“被拒、总裁、狼王、娇妻”风标题', 'Guide to generating dramatic Rejection, Billionaire, and Luna Queen titles',
'## 书名与大纲生成指南 — 狼人虐恋流

欧美市场的狼人文标题特别简单粗暴，通常一看就是要有多虐有多虐。

### 1. Title Generation (书名命名偏好)
- **被拒与黑化风**：`[Rejected / The Runaway] + [Mate/Luna]` (例：*The Rejected Mate*, *Rejected by the Alpha*, *The Runaway Luna*)
- **霸道狼王/财阀风**：`[The Alpha King''s / The Billionaire Alpha''s] + [Property / Defiant Mate]` (例：*The Alpha King''s Claim*, *His Destined Omega*, *The Lycan King''s Ruined Bride*)

### 2. Synopsis Generation (三段式大纲结构)
- **第一段：最痛的背叛 (The Ultimate Betrayal)**：以第一视角的绝望口吻开头（“那天雨很大，我的未婚夫当着全族的面搂着我妹妹说不认识我”），点出女主是个没有背景的废物，被狠狠丢弃，读者看了立刻想冲进去打人。
- **第二段：命运的拐点/强取豪夺 (The Alpha''s Trap)**：在最绝望的时候，她掉入了一个连老天都害怕的恶魔（最强狼王）手里。本以为死定了，结果这个让所有人闻风丧胆的暴君竟然单膝跪在她面前，强硬且深情地宣布她是他的王后。
- **第三段：复仇的高潮誓言 (The Queen''s Promise)**：过去凌辱她的家族即将倒闭。简介要在高潮处收尾：“当他们像狗一样爬来求我时，我的暴君丈夫微微一笑：‘我的王后，需要我帮您把他们的皮剥下来吗？’”',
'## Title & Synopsis Generation Guide — Alpha Werewolf

Titles in the Western market for this genre are brutally direct. They must immediately scream "Agony, Betrayal, and Billionaire Dominance."

### 1. Title Generation Preferences
- **The Betrayal Trope**: `[Rejected/Runaway/Broken] + [Mate/Luna/Omega]` (e.g., *The Rejected Mate*, *Rejected by the Alpha*, *The Runaway Luna*, *The Unwanted Mate*).
- **The Possessive King Trope**: `[The Alpha King''s / The Billionaire Alpha''s] + [Mate/Bride/Obsession]` (e.g., *The Alpha King''s Claim*, *His Destined Omega*, *The Lycan King''s Ruined Bride*).

### 2. Synopsis Generation (Three-Act Structure)
- **Act 1: The Ultimate Betrayal**: Start with a desperate, agonizing first-person hook. (*"It was pouring rain on my 18th birthday when my destined mate hooked his arm around my cruel stepsister''s waist and looked at me with disgust."*) Establish the MC as a broken, bullied slave, instantly generating furious sympathy from the reader.
- **Act 2: The Alpha''s Trap**: Just when she thinks she will die alone in the woods, she is captured by the most feared, sociopathic Lycan King in the world. She prepares for death. Instead, the terrifying tyrant who makes empires tremble drops to one knee, burying his face in her neck, aggressively declaring her as his fated Queen.
- **Act 3: The Queen''s Vow (The Payoff)**: The very pack that tortured her is now on the brink of financial and military ruin at the hands of her new husband. End the synopsis on a visceral high note: *"When my ex-mate crawled bleeding to my feet begging for scraps of mercy, my tyrant husband smirked, pulling me against his chest. ''My beautiful Queen... would you like me to skin him alive for you?''"*', @method_id, 1, 102, NOW()),

-- 12. Entity Naming
('alpha-entity-naming', '「名词生成指南」：指导生成冷酷的西方狼群名、性感的男主名与阶级词汇', 'Guide to generating intimidating Pack names, sexy Male Lead names, and hierarchy terms',
'## 专有名词生成指南 (Entity Naming) — 狼人虐恋流

名字必须带有强烈的**“野性、黑暗与旧贵族富豪感”**。

### 1. 男主名字 (The Alpha Male Names)
- 必须是典型的欧美肌肉男/霸总名，听起来就觉得他很有钱、脾气很暴躁。首字母带辅音冲击力强的更好。
- *案例*：Ryder (莱德), Kaden (卡登), Asher (阿舍尔), Jaxson (贾克森), Xavier (赛维尔)。
- *姓氏*：Blackwood (黑木), Sterling (斯特林), Blood (血), Night (夜)。(例：Alpha Kaden Blackwood)

### 2. 狼群名称 (Pack Names)
- 要带有强烈的地域感、天体或者凶残的意象。
- *压迫感强的男主公会*：Blood Moon Pack (血月狼群), Dark River Pack (暗河狼群), Obsidian Claw Pack (黑曜石利爪狼群), The Lycan Empire (狼人帝国 - 更高一级的阶级)。
- *女主出身的普通公会*：Silver Mountain Pack (银山狼群), Crescent Lake Pack (新月湖狼群)。

### 3. 世界观术语 (Lore Terminology)
- 必须大量高频使用这些黑话。
- *The Bond (羁绊)*: Fated Mate (命中注定的伴侣), True Mate (真伴侣), Rejection (拒婚法则), Marking / Claiming (标记/咬痕)。
- *Hierarchy (阶级)*: Alpha (绝对首领), Luna (狼后/女主人), Beta (副官), Omega (底层/生育工具), Rogue (流放者/危险罪犯), Lycan (狼王血统 - 比普通狼人高贵十倍的传说物种)。

**AI 动作要求**：在生成对白和描写时，极其高频地穿插 `Mate`, `Alpha`, `Luna`, `Mark`, `Growl` 这些词汇。它们对狼人小说读者来说就是触发爽点的多巴胺关键词。',
'## Entity Naming Guide — Alpha Werewolf

Names must exude an overpowering aura of **"Feral Wilderness, Dark Danger, and Old-Money Billionaire."**

### 1. The Alpha Male Names
- Must sound like a ruthless CEO who could also bench-press a truck. Hard consonant sounds, intensely masculine.
- *Examples*: Ryder, Kaden, Asher, Jaxson, Xavier, Killian.
- *Surnames (Dynasties)*: Blackwood, Sterling, Nightshade, Thorne, Bloodsworth. (e.g., Alpha Killian Blackwood).

### 2. Pack Names (The Factions)
- Evoke brutal nature, celestial bodies (moons), or intimidating predators.
- *The Apex Male Lead''s Empire*: The Blood Moon Pack, The Obsidian Claw Pack, The Shadow-fall Syndicate, The Royal Lycan Court (A tier above normal wolves).
- *The MC''s Basic/Toxic Origin Pack*: The Silver Mountain Pack, The Crescent Lake Pack, Half-Moon Pack.

### 3. Lore Terminology (The Pheromone Dictionary)
- You MUST heavily pepper your text with this specific vocabulary.
- *The Bond*: Fated Mate, True Mate, Rejection, Marking, Claiming (the act of biting the neck to seal the bond).
- *The Hierarchy*: Alpha (The Apex Leader), Luna (The Alpha''s Mate / Queen), Beta (Second-in-Command / Enforcer), Omega (The bottom of the pack / caretakers / often abused), Rogue (Violent packless outcasts), Lycan (An ancient, massive, hyper-lethal breed of werewolf that rules over normal shifters).

**AI Action Requirement**: When generating dialogues or emotional inner monologues, you MUST consistently weave in trigger words like `Mate`, `Alpha`, `Luna`, `Mark`, `Scent`, and `Growl`. These specific terms are dopamine triggers for readers of this genre.', @method_id, 1, 103, NOW())
ON DUPLICATE KEY UPDATE description=VALUES(description), instructions=VALUES(instructions);
