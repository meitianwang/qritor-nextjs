-- 幕后黑手流 / 编剧流 (The Behind-the-Scenes Mastermind) Skills (Layer 3)
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-mastermind-all.sql

SET @method_id = (SELECT id FROM novel_creation_method WHERE name = '幕后黑手流 / 编剧流' LIMIT 1);

-- 1. Story Hook Setting Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'mastermind-story-hook-setting-gen',
  '生成「Story Hook」：设计幕后黑手拉开世界剧本序幕的第一个大事件',
  'Generate "Story Hook": Design the first grand deception event for the mastermind',
  '## "Story Hook" Generation — 幕后黑手流 (The Mastermind Novel)

  这是揭开忽悠全世界序幕的核心钩子。让所有人开始对世界的认知产生动摇。

  ### Field Generation Guide
  - **初始危机**: 需要有一个推动力，比如系统绑定必须要获得“文明震撼度”，或者灵气枯竭必须靠“信仰之力”复苏。
  - **第一个剧本**: 必须具有极强的画面冲击力，但又是主角付出极小代价捏造的。（例如：利用全息投影和三毛钱特效，在全网上演剑仙战蛟龙的奇迹；或者挖出一具只有主角知道内情的“千年活尸”）。
  - **核心爽点期待**: 信息差！必须要点出那些高智商的智囊团、兵王、大财阀，是如何被主角拙劣的表演唬住，并且疯狂开始脑补世界隐藏背面的快感。',
  '## "Story Hook" Generation — The Mastermind Novel

  This sets the stage for deceiving the entire world. It outlines the first event that shakes humanity''s understanding of reality.

  ### Field Generation Guide
  - **Initial Crisis**: The driving force. E.g., The system requires "Civilization Shock Value," or the protagonist must farm belief points to revive spiritual energy.
  - **First Script**: High visual impact, but extremely low cost for the protagonist. (E.g., Using cheap holographic projections to stage a flying sword battle against a dragon on live TV).
  - **Reader Expectation**: The thrill of information asymmetry! The high-IQ think tanks, elites, and military misinterpreting the protagonist’s cheap tricks as world-ending mythical phenomena.',
  @method_id, 1, 1, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 2. Core Premise Setting Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'mastermind-core-premise-setting-gen',
  '生成「Core Premise」：确立主角捏造的至高组织以及金手指运作机制',
  'Generate "Core Premise": Establish the fabricated supreme organization and the golden finger mechanics',
  '## "Core Premise" Generation

  主角真正的状态，与他抛给全世界的“究极神之组织”之间的强烈对比。

  ### Field Generation Guide
  - **本体状态**: 明确主角是个需要苟着的普通宅男，或者是一个空有位格但失去力量的神明，这是为了凸显幕后操纵的必要性。
  - **金手指机制**: 就是“假戏真做”系统。例如：只要有一万人相信这把普通铁剑是亚瑟王用过的契约胜利之剑，它就会真的拥有发射光火的威力。
  - **虚构的究极组织**: 必须高大上且历史悠久。比如“存在于时间夹缝中的救世俱乐部”、“贯穿了全人类神话史的收容所”。
  - **行事准则**: 绝不当出头鸟。即便有实力也要披着两层以上的马甲跟人对话。',
  '## "Core Premise" Generation

  The stark contrast between the protagonist''s true powerless state and the terrifyingly "supreme organization" they present to the world.

  ### Field Generation Guide
  - **True State**: Specifying that the MC is an ordinary shut-in or a weakened god forced to hide, making manipulation a necessity.
  - **Golden Finger**: The "Fake it till you make it" system. E.g., If 10,000 people believe a rusty sword is Excalibur, the system makes it shoot real holy lasers.
  - **The Fabricated Supreme Organization**: Mus sound ancient and overwhelmingly powerful. E.g., The Salvation Club existing between the cracks of time, or the Foundation that manipulated human history.
  - **Modus Operandi**: Never step into the spotlight directly. Even if powerful, always use at least two layers of fake identities.',
  @method_id, 1, 2, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 3. Worldbuilding Setting Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'mastermind-worldbuilding-setting-gen',
  '生成「Worldbuilding」：构建一个极度唯物、极其吃主角这一套的舞台背景',
  'Generate "Worldbuilding": Build a hyper-materialistic or structured world ready to be mind-blown',
  '## "Worldbuilding" Generation

  世界的底色。如果没有原住民的无知，就没有主角装神的爽感。

  ### Field Generation Guide
  - **初始世界状态**: 最爽的是一开始高度发达、唯物主义主导的科技社会（如现代地球）。这种世界观被超凡打碎的时候最让人津津乐道。
  - **官方机构/掌权者**: 设计最顶尖的智力机器（例如：全球异常事物战略应对防御部）。他们分析得越认真头头是道，小说就越好看。
  - **真正的威胁**: 可选，为了让主角“装完逼还要拯救世界”顺理成章，可以加入一些真实的外星入侵或邪神复苏作为世界的暗线。',
  '## "Worldbuilding" Generation

  The canvas for the deception. The protagonist''s god-complex only works if the natives are utterly unprepared.

  ### Field Generation Guide
  - **Initial State**: A highly developed, materialistic, tech-driven society (like modern Earth) provides the best contrast when shattered by supernatural events.
  - **Official Authorities**: Design elite intelligence agencies (e.g., Global Anomaly Response Department). The harder they over-analyze the MC’s fake clues, the more entertaining it is.
  - **Underlying True Threat**: Optional. To justify the MC''s actions as "saving the world while posing," add a looming real threat like Eldritch corruption or alien invasion.',
  @method_id, 1, 4, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 4. Writing Style Setting Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'mastermind-writing-style-setting-gen',
  '生成「Writing Style」：指导主角的装逼留白与配角的高智商迪化（脑补）描写',
  'Generate "Writing Style": Directs the MC''s enigmatic tone and the high-IQ overthinking of the side characters',
  '## "Writing Style" Generation

  此流派的文法关键在于视角的频繁切换。

  ### Field Generation Guide
  - **叙事切换手法**: 必须熟练在两极间跳跃：“主角在家啃着泡面随手在系统里点了一下” vs “太平洋上的联合舰队面临滔天巨浪，将军们绝望地注视着那降临的庞大灵体倒吸凉气”。
  - **配角反应描写**: “迪化（脑补）”技巧。配角必须是一流的聪明人，他们通过细枝末节的拼凑，得出了一个自洽但是错得离谱（并让主角看起来深不可测）的史诗级结论。
  - **主角的逼格表现**: 说话永远只说20%，剩下80%让配角自己去猜。用最平静的口吻说出最毁天灭地的设定。',
  '## "Writing Style" Generation

  The grammar of this genre relies on rapid perspective shifts.

  ### Field Generation Guide
  - **Perspective Whiplash**: Jump rapidly between the mundane and the epic: "MC eating instant noodles and lazily clicking a button on the system" vs "The combined Pacific Fleet facing a tidal wave under the watchful eye of a descending godly spirit, generals gasping in despair."
  - **Overthinking (Di-Hua) Reactions**: Side characters MUST be intelligent. They piece together minor clues to draw a logically consistent but completely wrong (and overwhelmingly terrifying) conclusion about the MC.
  - **The Enigmatic MC**: The MC speaks only 20% of a sentence, letting characters guess the other 80%. They state world-ending lore with the calmest, most casual tone.',
  @method_id, 1, 5, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 5. Character Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'mastermind-character-gen',
  '角色生成：包含满级马甲分身、高智囊探员、和深信不疑的天命之子（打工人）',
  'Character Generation: Max-level alter egos, high-IQ agents, and the completely duped chosen ones',
  '## Character Generator for Mastermind

  所有的角色都可以被简单分为两类：主角的“小号”和负责震惊的“观众/工具人”。

  ### 角色类别分析：
  - **马甲/分身 (Alter Egos)**：主角披着的壳子。比如冷酷无情的黑衣剑客外表下，是主角在疯狂念系统的台词倒计时。需要明确马甲的“设定面貌”和“破绽”。
  - **天命之子/工具人**: 被主角偶然赐予了一点力量，自以为背负了沉重的拯救世界宿命的倒霉蛋，实际上只是在替主角打白工赚情绪值。
  - **调查局探长**: 全书中智商最高的人，也是给读者提供最大笑料的人。他们分析最缜密，所以被骗得最深（脑补的狂热信徒）。

  ### 动态状态
  注意描写配角当前的 **对于主角计划的认知度(脑补进度)**。',
  '## Character Generator for Mastermind

  All characters fall into two categories: the MC''s "alts" and the completely shocked "audience/tools."

  ### Role Analysis:
  - **Alter Egos (Majia)**: The shells the protagonist wears. A cold-blooded swordsman who is internally sweating and reading off system scripts. Define their "fake lore" and their "hidden flaws."
  - **The Chosen One (The Tool)**: Handed a scrap of power by the MC, believing they bear the tragic destiny of saving the world, while actually just farming belief points for the MC for free.
  - **The Lead Investigator/Think Tank**: The smartest people in the book, providing the most comedy. Because they are so logical, they fall the deepest into the MC’s carefully laid traps (becoming fanatical over-thinkers).

  ### Dynamic Status
  Highlight their **Current progress in overthinking the protagonist''s master plan**.',
  @method_id, 1, 6, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 6. Faction (Organization) Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'mastermind-faction-gen',
  '势力/组织生成：生成完全空壳的无上结社，或是被耍得团团转的国家机器',
  'Faction Generation: Generate completely empty supreme societies or baffled state apparatuses',
  '## Faction Generator for Mastermind

  这是体现信息差最爽的版块。

  ### 组织对抗的错觉
  - **主角的空壳组织**：对外宣称是掌控时间线的神罚骑士团，实际上整个骑士团就主角一个活人，外加三个系统送的木头人偶。（虚与实的极限反差）。
  - **国家防御战略局**：庞然大物，拥有核武器和无数精英，每天开S级绝密会议，却只为了研究主角买错尺码丢弃的一双皮手套。
  - **被主角捏造的“对立面反派”**：主角为了让故事更逼真，干脆连邪恶阵营（比如黑法师公会）也一起用左手操作（左右互搏，赢麻了）。',
  '## Faction Generator for Mastermind

  The peak of informational asymmetry.

  ### The Illusion of Factional Warfare
  - **The MC''s Shell Organization**: Publicly claims to be the Knights of Time Penalty controlling the multiverse, but in reality, consists solely of the MC and three wooden mannequins from the system.
  - **The Global Defense Bureau**: A behemoth with nukes and elites, holding S-Class top-secret meetings every day just to analyze a pair of wrong-sized gloves the MC threw away.
  - **Fabricated Villain Fractions**: To make the "script" more believable, the MC simply fabricated the evil faction as well (playing chess against himself and winning everything).',
  @method_id, 1, 7, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 7. Scene Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'mastermind-scene-gen',
  '场景生成：从系统兑换并具现化的虚假上古神庙，用来震碎原住民世界观',
  'Scene Generation: Fabricated ancient temples materialized from the system to shatter worldviews',
  '## Scene Generator for Mastermind

  场景不仅是用来进行战斗的，场景本身就是主角的一张关键手牌。

  ### 造假遗迹的核心逻辑
  - **设计蓝图**：遗迹存在的岁月痕迹和逼格。比如，主角花了100点震惊值在太平洋海底投影了一座青铜龙宫。
  - **机关与误导点**：主角绝对会在墙壁上刻下极其深奥、意味不明但实则毫无意义的古代文字，就是等官方的语言学家连夜去过度解读，破译出“末日预言”。
  - 聚焦那些看到哪怕一小块石砖就能推断出神仙打架景象的原住民。',
  '## Scene Generator for Mastermind

  Environments are not just for combat; they are crucial playing cards in the MC''s deception.

  ### The Logic of Forged Ruins
  - **The Blueprint Design**: The simulated age and sheer awe of the ruin. E.g., The MC spent 100 Shock Points to project a Bronze Dragon Palace at the bottom of the Mariana Trench.
  - **Misleading Gimmicks**: The MC deliberately carves incredibly profound, ancient-looking (but meaningless) text on the walls, waiting for official linguists to stay up all night "decoding" a doomsday prophecy from it.
  - Focus heavily on the natives who see a single broken brick and extrapolate a cosmic war from it.',
  @method_id, 1, 8, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 8. Prop Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'mastermind-prop-gen',
  '道具生成：被疯狂崇拜和严密保护的廉价货或者奇妙特效装逼道具',
  'Prop Generation: Cheap items intensely worshipped or mystical tools of illusion',
  '## Prop Generation for Mastermind

  道具在这个流派里就是“被供奉的忽悠物”。

  ### 道具设定原则
  - **真实本质与传说属性的反差**。
  - 主角不小心落在犯罪现场的一把普通的铁勺子，因为沾染了主角（系统伪装）的气息，被官方机构认定为【S级封印物：扭曲因果之勺】，必须封存并派特种部队24小时看守。
  - 系统兑换的【特效粉末】：毫无杀伤力，但是撒出去会有万剑横空的视觉声光电特效，专用来唬人。',
  '## Prop Generation for Mastermind

  Props in this genre are essentially "worshipped tools of deception."

  ### Prop Design Principles
  - **The Contrast between Reality and Legend**.
  - An ordinary iron spoon accidentally dropped by the MC at a crime scene, tainted by his system aura, is classified by the government as an [S-Class Sealed Artifact: Spoon of Distorted Causality], requiring a vault and 24/7 special forces guard.
  - System-exchanged items like [Illusion Dust]: Deal zero damage but creates a massive visual-audio spectacle of a thousand flying swords, used purely for bluffing.',
  @method_id, 1, 9, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 9. Plot Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'mastermind-plot-gen',
  '剧情设计：设计剧本事件爆发、全世界恐慌发酵直到收割震惊值的周期循环',
  'Plot Design: Designing script outbreaks, global panic, and harvesting shock value loops',
  '## Plot Generator for Mastermind

  剧情不再是主角去刷副本，而是主角**创造副本让全世界去刷**。

  ### 经典剧情结构循环
  1. **铺垫与抛出饵料**：主角察觉震惊值不够了，或者真实危机逼近。开始撰写新剧本，抛出一个隐秘的情报或一件假遗物给配角。
  2. **官方过度解读（迪化中段）**：配角拿到假遗物，经过一系列科学仪器的错误检测，得出“古神即将复苏”的可怕结论，全网哗然，高层震动（大段的震惊描写）。
  3. **高潮的华丽演出**：危机爆发，原住民绝望之时，主角操控穿着新马甲的分身，吟唱着中二的台词霸气出场，用华丽的光影将危机一剑斩碎。事了拂衣去。
  4. **收割与盘点反馈**：全人类的认知被刷新，系统狂收十亿震惊点。主角回家数钱并准备购买下一个更贵的装逼遗迹。',
  '## Plot Generator for Mastermind

  The plot isn''t about the MC raiding dungeons; the MC **creates the dungeons for the world to raid**.

  ### Classic Plot Cycle
  1. **Brainstorming & Dropping the Bait**: MC is low on shock points. They script a new event, intentionally leaking a cryptic rumor or dropping a fake artifact.
  2. **Official Over-interpretation (Mid-Di-Hua)**: The side characters acquire the bait. Through misread scans and paranoia, they conclude that "An Ancient God is reviving." The world panics, leaders tremble (Heavy focus on shocked reactions).
  3. **The Theatrical Climax**: The fake crisis hits. Amidst native despair, the MC''s new Alter Ego descends powerfully, delivering a ridiculously dramatic line, and solves the crisis with overwhelming visual effects. Then they vanish.
  4. **Harvest & Aftermath**: Humanity''s worldview is shattered. The system harvests 1 billion Shock Points. The MC goes home to count their points and plans to buy an even more expensive fake ruin from the system shop.',
  @method_id, 1, 11, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 10. Narrative Writing
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'mastermind-narrative',
  '叙事写作：指导双视角（主角的日常内心戏 vs 原住民世界的颤栗旁白）的融合',
  'Narrative Writing: Blending dual perspectives (MC''s casual internal monologue vs the horrified native narration)',
  '## Narrative Writing for Mastermind

  幕后控制流的文本魅力完全来自于“上帝视角的喜剧张力”与“克苏鲁式的史诗感”的疯狂交织。

  ### 描写核心指导
  - **极致的反差感句式**：“（官方的高官/强者）看着夜空中撕裂的巨大缝隙，冷汗湿透了脊背，握剑的手止不住地战栗，他知道，人类的存亡只在这位长袍老者的一念之间。——而此时的高塔上，（主角）正紧张地看着全息面板上的电量：‘糟糕，投影仪快没电了，特效要崩穿穿帮了，得赶紧装完撤退。’”
  - **台词的谜语人属性**：主角的台词绝对不能大白话。要充满隐喻、半句诗词、或者根本答非所问的高深架子。
  - **侧面烘托法则**：装逼不要自己装，要通过配角那被吓坏的微表情和内心戏烘托出来。',
  '## Narrative Writing for Mastermind

  The textual charm of the Mastermind genre comes from wildly weaving "god-perspective comedic tension" with "Eldritch epic grandeur."

  ### Core Descriptive Guide
  - **Extreme Contrast Sentences**: "(The S-Rank Hero) stared at the massive rift tearing the night sky, cold sweat soaking his back, his gripping hand trembling violently. He knew humanity''s survival rested solely on the cloaked elder''s mood... — Meanwhile, atop the tower, (the MC) stared nervously at his system panel: ''Crap, the projector battery is dying. If the VFX drops, I''m exposed. Gotta drop a cool line and vanish fast.''"
  - **The Riddler Dialogue**: MC dialogue should never be direct. Speak in metaphors, half-finished poems, or give profound answers that don''t directly answer the question.
  - **Show, Don''t Tell Power**: Don''t explicitly state the MC is awesome. Prove it through the terrified micro-expressions and panicked internal monologues of the supposedly powerful side characters.',
  @method_id, 1, 12, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 11. Novel Naming
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'mastermind-novel-naming',
  '小说命名：为马甲文和忽悠天下流小说起充满史诗感与现代反差的书名',
  'Novel Naming: Titles capturing epic lore and modern contrast for the mastermind',
  '## Novel Naming for Mastermind

  书名和简介需要直接点出主角在“造假”、“幕后”和“忽悠全人类”的爽点。

  ### 命名流派
  1. **创造/编剧流**：《我编造了神话帝国》《我在幕后深蓝加点》《我打造了救世组织》。
  2. **装逼掉马甲流**：《为了不被发现，我只能把地球打造成超凡界了》《我的马甲遍布全宇宙》。
  3. **反差迪化流**：《反派大佬都以为我是隐藏神明》《明明是普通人，却被全人类奉若神明》。

  ### 简介风格 (Synopsis)
  用两段式：第一段严肃宏大：“灵气复苏，古神苏醒，隐藏在岁月长河中的神秘组织【天网】渐渐浮出水面，里面的随便一个清洁工都是满级大佬……”
  第二段话锋一团搞怪：“但没人知道，天网的魁首、那些大佬的真身，全都是在这个出租屋里吃着泡面的李某人开的小号！‘别脑补了，我随便编的遗迹，专家们怎么连夜翻译出末日预言了？！’”',
  '## Novel Naming for Mastermind

  The title and synopsis must instantly signal "fabrication," "behind the scenes," and "fooling all of humanity."

  ### Naming Tropes
  1. **Creator/Scripter Focus**: *I Fabricated a Mythical Empire*, *I Built the Salvation Organization*, *I Am the World''s Greatest Director*.
  2. **Majia (Alter Ego)/Bluffing**: *To Avoid Discovery, I Turned Earth into a Fantasy Realm*, *My Alter Egos Cover the Universe*.
  3. **Contrast Overthinking**: *The Villains All Think I''m a Hidden God*, *Just a Normal Guy Reared as the Supreme Being*.

  ### Synopsis Style
  Use a clear two-part structure. Part 1 is seriously epic: "Spiritual energy recovers, ancient gods awaken, and the mysterious organization [Skynet] hidden in the river of time surfaces—where even the janitor is a max-level expert..."
  Part 2 hard-pivots to comedic reality: "But no one knows that Skynet''s Supreme Leader and all those experts are just alt-accounts controlled by Lee, eating instant noodles in his rented apartment! ''Stop overthinking! I made up those ruins; how did the experts translate a doomsday prophecy overnight?!''"',
  @method_id, 1, 13, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 12. Entity Naming
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'mastermind-entity-naming',
  '实体命名：为虚假结社、马甲分身和忽悠用的震撼神兵起名',
  'Entity Naming: Naming fake societies, alter egos, and bluffing God-tier weapons',
  '## Entity Naming for Mastermind

  名字在幕后黑手流里就是“面子工程”，必须往大了吹！

  ### 空壳组织命名
  - 这个名字一听就得有统御宇宙岁月长河、冰冷超然的气息。比如：全知之眼、衔尾蛇同盟、守夜人、万界真理高塔。

  ### 分身/马甲命名
  - 不要叫平凡的名字，要用【称号+代号】。比如：【黄昏的敲钟人】克莱恩、【执剑的暴君】亚当、零号隐者。

  ### 遗迹与道具命名
  - 核心是把破铜烂铁包装成神话。
  - 【不灭的薪火容器】（其实是个旧打火机）、【失落亚特兰蒂斯的登神长阶】（主角用系统特效搭的模型）。',
  '## Entity Naming for Mastermind

  In the Mastermind genre, names are the entire facade. They must sound overwhelmingly grandiose!

  ### Shell Organizations
  - Must sound cold, transcendent, and capable of dominating timelines. E.g., The All-Seeing Eye, The Ouroboros Alliance, The Night Watchers, The Tower of Omniversal Truth.

  ### Alter Egos (Majia)
  - Don''t use mundane names. Use [Title + Codename]. E.g., [The Bellringer of Twilight] Klein, [The Sword-Wielding Tyrant] Adam, The Hermit Zero.

  ### Ruins & Props
  - The core is dressing up junk as mythology.
  - [The Undying Receptacle of Kindle] (Actually an old Zippo lighter), [The Stairway to Godhood of Lost Atlantis] (A CGI model the MC built using the system).',
  @method_id, 1, 14, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();
