-- The Chaotic Evil / True Villain Novel Skills (Layer 3)
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-chaotic-evil-all.sql

SET @method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Chaotic Evil / True Villain Novel' LIMIT 1);

-- 1. Story Hook Setting Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'chaotic-evil-story-hook-setting-gen',
  '生成「Story Hook」：为混沌恶/纯反派小说设计拉开破坏序幕的起因和核心卖点',
  'Generate "Story Hook": Design the opening act of malice and core selling point for the Chaotic Evil novel',
  '## "Story Hook" Generation — The Chaotic Evil / True Villain Novel

  这是定调小说核心乐趣的钩子。

  ### Field Generation Guide
  - **Story Hook**: 构思主角如何通过毫无理由的恶意行为来拉开混乱的序幕。越不讲理越好，比如“就因为星期二晚上觉得无聊，他决定把世界上最强的英雄联盟给拆了”。
  - **Core Selling Point**: 卖点在于精神控制、纯粹武力碾压、还是将文明社会玩弄于股掌之上？
  - **Opening Act of Malice**: 主角的开场秀，完全不讲理、极度震撼人的初始事件。
  - **Reader Expectation**: 读者期待看到打破伪善、绝对自由和力量的宣泄。',
  '## "Story Hook" Generation — The Chaotic Evil / True Villain Novel

  This sets the tone for the primary entertainment of the story.

  ### Field Generation Guide
  - **Story Hook**: How does the protagonist kickstart the chaos unprovoked? The more unreasonable, the better. (e.g., "Bored on a Tuesday, he decided to dismantle the strongest hero alliance just for kicks").
  - **Core Selling Point**: Is it mind control, sheer brute force, or playing civilized society like a fiddle?
  - **Opening Act of Malice**: The shocking, unapologetic initial event caused by the protagonist.
  - **Reader Expectation**: Expectation of shattering hypocrisy, absolute freedom, and catharsis of power.',
  @method_id,
  1,
  1,
  NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 2. Core Premise Setting Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'chaotic-evil-core-premise-setting-gen',
  '生成「Core Premise」：设计混沌恶主角的原型和破坏逻辑',
  'Generate "Core Premise": Design the Chaotic Evil protagonist''s archetype and logic for destruction',
  '## "Core Premise" Generation

  设计主角的核心恶意来源。绝对不要有任何“苦衷”、“过去被背叛”的桥段，只需要纯粹的恶。

  ### Field Generation Guide
  - **Villain Archetype**: 他们是微笑的施虐狂，还是毫无感情的天灾？
  - **Nature of Malice**: 为什么要作恶？（纯粹无聊、扭曲的愉悦、觉得人类绝望很好笑）。
  - **Core Methodology**: 如何摧毁？（心理暗示、血腥物理破坏、致命游戏）。
  - **The Playground**: 他们眼中的玩具是什么世界？（乌托邦、魔法奇幻纪元、或者现代都市）。
  - **Story Tone**: 是地狱笑话、还是极致的心理恐怖？',
  '## "Core Premise" Generation

  Design the core source of the protagonist''s malice. ABSOLUTELY NO tragic backstories or "betrayed in the past" tropes. Pure unadulterated evil only.

  ### Field Generation Guide
  - **Villain Archetype**: Are they a smiling sadist or an emotionless force of nature?
  - **Nature of Malice**: Why do it? (pure boredom, twisted pleasure, finding despair hilarious).
  - **Core Methodology**: How do they break things? (psychological manipulation, brutal physics, death games).
  - **The Playground**: What world do they consider their toy? (Utopia, classic fantasy, modern urban).
  - **Story Tone**: Dark comedy or extreme psychological terror?',
  @method_id,
  1,
  2,
  NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 3. Worldbuilding Setting Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'chaotic-evil-worldbuilding-setting-gen',
  '生成「Worldbuilding」：设计一个极度适合被主角摧毁的神圣/虚伪的世界',
  'Generate "Worldbuilding": Design a highly orderly/hypocritical world perfect for the protagonist to destroy',
  '## "Worldbuilding" Generation

  这个世界存在的唯一意义就是被主角玩弄和毁灭。越是道貌岸然、高度秩序化，毁灭起来越有快感。

  ### Field Generation Guide
  - **World Structure**: 世界的基础架构。
  - **The Facade of Justice**: 正义的虚伪面。越是金碧辉煌的表面，越好砸碎。
  - **Society''s Vulnerabilities**: 主角可以利用的系统性漏洞（盲目的信仰、资本的贪婪、虚假的和平）。
  - **The Innocent Masses**: 表现大众的愚蠢和易受操纵。
  - **Rules of the Game**: 主角为了觉得好玩而自己定下的游玩规则。',
  '## "Worldbuilding" Generation

  The only reason this world exists is to be broken by the protagonist. The more self-righteous and highly ordered it is, the better.

  ### Field Generation Guide
  - **World Structure**: Basic architecture of the world.
  - **The Facade of Justice**: The shiny exterior just waiting to be shattered.
  - **Society''s Vulnerabilities**: Systemic flaws the protagonist exploits (blind faith, corporate greed, fragile peace).
  - **The Innocent Masses**: Portray the masses as ignorant and easily manipulated.
  - **Rules of the Game**: Self-imposed rules the protagonist creates just to make the destruction more fun.',
  @method_id,
  1,
  3,
  NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 4. Power System & Abilities (Abilities & Tools of Chaos) Setting Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'chaotic-evil-abilities-tools-setting-gen',
  '生成「Abilities & Tools of Chaos」：设计主角用来造成破坏的绝对压制级力量或手段',
  'Generate "Abilities & Tools of Chaos": Design the protagonist''s overwhelming powers or methods used for destruction',
  '## "Abilities & Tools of Chaos" Generation

  主角拥有的绝对不平衡的优势。英雄们无论怎么努力都会发现这是一座无法跨越的高山。

  ### Field Generation Guide
  - **Source of Power**: 绝对的智力碾压、无敌的面板属性或者某种扭曲的模因感染源。
  - **Signature Method**: 标志性的作案手法（比如让受害者互相残杀，或者留下一张扑克牌）。
  - **The Unfair Advantage**: 为什么主角不可能输（他不怕死、他能预判所有预判、或者他的力量深不见底）。
  - **Collateral Damage Level**: 附带伤害级别。',
  '## "Abilities & Tools of Chaos" Generation

  The absolutely unfair advantages the protagonist possesses. Heroes must realize they are facing an insurmountable mountain.

  ### Field Generation Guide
  - **Source of Power**: Absolute intellect, invincible stats, or some twisted memetic infection.
  - **Signature Method**: Trademark modus operandi (e.g., forcing victims to kill each other, or leaving a joker card).
  - **The Unfair Advantage**: Why the protagonist can never truly lose (they don''t fear death, infinite contingencies, bottomless power).
  - **Collateral Damage Level**: The level of chaotic splash damage.',
  @method_id,
  1,
  4,
  NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 5. Writing Style Setting Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'chaotic-evil-writing-style-setting-gen',
  '生成「Writing Style」：提供纯粹反派视角的黑暗残酷或黑色幽默文风指南',
  'Generate "Writing Style": Provide dark, brutal, or darkly comedic narrative guidelines for the true villain perspective',
  '## "Writing Style" Generation

  定调文本的叙事口吻和道德立场（完全摒弃道德）。

  ### Field Generation Guide
  - **Narrative POV**: 是深入扭曲的内心，还是从受害者的恐惧视角来烘托？
  - **Prose Tone**: 黑色幽默、冰冷的临床解剖感、或是夸张的舞台戏剧感。
  - **Pacing**: 缓慢的精神折磨还是停不下来的疯狂杀戮？
  - **Treatment of Morality**: 道德只能作为被主角嘲弄和用来对付好人的武器。',
  '## "Writing Style" Generation

  Setting the narrative voice and absolute lack of morality.

  ### Field Generation Guide
  - **Narrative POV**: Deep inside the twisted mind, or from the horrified view of victims?
  - **Prose Tone**: Dark comedy, cold/clinical, or theatrical/grandiose.
  - **Pacing**: Slow-burn psychological torture or non-stop frantic slaughter?
  - **Treatment of Morality**: Morality only exists as something for the protagonist to mock or weaponize against the good guys.',
  @method_id,
  1,
  5,
  NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 6. Character Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'chaotic-evil-character-gen',
  '角色生成：包含纯反派主角、崩溃的英雄、狂热追随者和无辜的玩物',
  'Character Generation: True Villain, Broken Heroes, Fanatical Followers, and Innocent Toys',
  '## Character Generator for Chaotic Evil

  本门派的角色不需要成长感，只需要“崩坏感”和“绝望感”。

  ### 角色类别分析：
  - **The True Villain (MC)**: 极度从容，不为任何事物动摇。设计他们的“扭曲点”。
  - **Obsessed Follower/Enabler**: 慕强、疯批，盲目崇拜主角带来的毁灭。
  - **The Broken Hero**: 曾经充满正义感，现在三观被踩在脚底摩擦，正处于崩溃边缘。
  - **The Innocent Victim/Pawn**: 被主角觉得“好玩”而留作观察或虐待的无辜者。

  ### 重点：
  **Breaking Point**: 这是核心，明确英雄和普通人“底线被击穿”的那个界限。',
  '## Character Generator for Chaotic Evil

  Characters here do not need a sense of "growth"; they need a sense of "decay" and "despair".

  ### Role Analysis:
  - **The True Villain (MC)**: Supremely composed, unshakeable. Focus on their "twisted core".
  - **Obsessed Follower**: Psychopathic power-worshipers addicted to the MC''s destruction.
  - **The Broken Hero**: Once righteous, now having their ideals crushed beneath the MC''s heel.
  - **The Innocent Pawn**: Kept around purely for amusement or to be mentally tortured later.

  ### Key Point:
  **Breaking Point**: This is critical. Define precisely what it takes to completely shatter a hero''s or innocent''s sanity.',
  @method_id,
  1,
  6,
  NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 7. Faction (Organization) Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'chaotic-evil-faction-gen',
  '势力/组织生成：即将被腐蚀的正义联盟、狂乱的邪教或腐败政权',
  'Faction Generation: Righteous alliances soon to be corrupted, frenzied cults, or corrupt governments',
  '## Faction Generator for Chaotic Evil

  这些势力是主角的棋盘和提款机。

  ### 设计核心
  - 如果是代表“正义”的势力，必须给他们设计虚伪的一面、隐秘的贪婪，或者是可悲的天真。
  - 如果是主角麾下的势力，多半是毫无规章、全凭对主角的极度恐惧或狂热维系着的结社。
  - **Fatal Flaw (致命缺陷)**：每个势力都必须有一个一碰就碎的死穴，等待主角去引爆。',
  '## Faction Generator for Chaotic Evil

  These factions serve as the protagonist''s chessboard and playground.

  ### Design Core
  - If it is a "Righteous" faction, give them a facade of hypocrisy, hidden greed, or pathetic naivety.
  - If it is under the protagonist, it should be a chaotic syndicate held together purely by extreme dread or fanaticism for the MC.
  - **Fatal Flaw**: Every faction MUST have a fragile weakness waiting for the protagonist to exploit and detonate.',
  @method_id,
  1,
  7,
  NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 8. Scene Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'chaotic-evil-scene-gen',
  '场景生成：神圣之地的亵渎与反派的诡异乐园',
  'Scene Generation: Defilement of holy sanctuaries and the villain''s eerie playgrounds',
  '## Scene Generator for Chaotic Evil

  场景的核心在于“对比”和“亵渎感”。

  ### 场景类别
  - **The Villain''s Lair**: 可能是血腥阴森的地牢，更可能是干净到让人发毛的纯白无菌病房。
  - **A Symbol of Hope (To be Corrupted)**: 辉煌的神殿、超级大城市的核心区，重点描述它被鲜血或狂乱染指前后的绝望反差。
  - **The Bloodstained Arena**: 主角强迫他人进行死亡游戏的密闭空间。

  ### 心理暗示
  注重描写场景对受害者产生的**Psychological Impact**（如压抑、无助、疯狂生长的绝望）。',
  '## Scene Generator for Chaotic Evil

  The core of the scenes lies in "contrast" and "defilement".

  ### Scene Categories
  - **The Villain''s Lair**: Could be a bloody dungeon, but even creepier: a sterilized, pristine white room.
  - **A Symbol of Hope (To be Corrupted)**: A glorious temple or metropolis core. Emphasize the despair-inducing contrast before and after it is tainted.
  - **The Bloodstained Arena**: Confined spaces where the protagonist forces others into death games.

  ### Psychological Hints
  Focus heavily on the **Psychological Impact** the environment has on the victims (oppression, helplessness, creeping madness).',
  @method_id,
  1,
  8,
  NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 9. Plot Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'chaotic-evil-plot-gen',
  '剧情设计：设计反派主角将正义按在地上摩擦的剧情线',
  'Plot Design: Design plotlines where the villain protagonist crushes justice maliciously',
  '## Plot Generator for Chaotic Evil

  由于主角通常战力极高或智商碾压，剧情的驱动力不在于“打怪升级”，而在于“如何花样折磨对手并摧毁其信念”。

  ### 核心剧情范式
  1. **建立希望然后捏碎**：允许英雄们获得短暂的“优势”或“希望”，然后在最高潮时，主角微笑着揭露这一切都是他故意安排的，目的是让他们体会更深的绝望。
  2. **道德困境地狱**：强迫自诩正义的英雄做出电车难题选择，逼迫他们亲手打破自己的誓言。
  3. **社会秩序崩溃**：不仅仅杀人，还要杀心。把某个高高在上的权威扒下皮来，向民众展示其丑恶，从而引发全社会暴动。

  ### 避免事项
  - 严禁出现主角被压着打、苦大仇深的逆袭剧本。主角永远是掌控全局（或者至少是享受意外）的那一方。',
  '## Plot Generator for Chaotic Evil

  Because the protagonist usually possesses overwhelming power or intellect, the plot is driven not by "leveling up" but by "finding creative ways to torture opponents and shatter their ideals."

  ### Core Plot Paradigms
  1. **Build Hope, Then Crush It**: Allow heroes a fleeting sense of "advantage" or "hope," and at the climax, have the protagonist smilingly reveal that he orchestrated it all just to deepen their despair.
  2. **Moral Dilemma Hell**: Force righteous heroes into trolley problems, making them break their own vows with their own hands.
  3. **Collapse of Order**: Don''t just kill people; kill concepts. Strip the veneer off a high authority to show the public their ugly truth, sparking mass riots.

  ### Things to Avoid
  - Absolutely NO underdog comeback storylines. The protagonist is ALWAYS the one controlling the board (or at least thoroughly enjoying unexpected chaos).',
  @method_id,
  1,
  11,
  NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 10. Narrative Writing
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'chaotic-evil-narrative',
  '叙事写作：冷酷、疯狂或诡异黑幽默的正文写作指导',
  'Narrative Writing: Cold, manic, or darkly comedic narrative writing guidelines',
  '## Narrative Writing for Chaotic Evil

  ### 第一准则：不要为恶行辩护
  在写正文时，永远不要试图给主角加“这其实是为了更大的善”的旁白。他干坏事就是因为他想干。

  ### 描写重点
  - **绝望的具象化**：不要只写“他很害怕”，写“他引以为傲的黄金圣剑在地上拖出刺耳的摩擦声，双腿因为极度的恐惧而不受控制地痉挛”。
  - **主角的‘从容’**：在极度血腥或混乱的场面中，渲染主角在旁边喝下午茶、哼着歌、或是带着礼貌微笑的反差感。
  - **嘲弄正义的修辞**：用极其优美、神圣的词汇去描绘极度邪恶的行为（例如：“像恩赐神迹一般，他优雅地捏碎了圣女的头骨”）。',
  '## Narrative Writing for Chaotic Evil

  ### Rule 1: Never Justify the Evil
  In the actual prose, NEVER attempt to give the protagonist inner monologues justifying their actions "for the greater good." They do evil because they want to.

  ### Descriptive Focus
  - **Materializing Despair**: Don''t just write "he was scared." Write "the holy golden sword he was so proud of dragged against the floor with a screeching scrape, his legs spasming involuntarily from absolute terror."
  - **The Protagonist''s "Composure"**: Amidst absolute gore and chaos, emphasize the contrast of the protagonist sipping tea, humming a tune, or maintaining a polite smile.
  - **Mocking Rhetoric**: Use beautiful, divine vocabulary to describe heinous acts (e.g., "Like bestowing a miracle, he elegantly crushed the Saintess''s skull.")',
  @method_id,
  1,
  12,
  NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 11. Novel Naming
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'chaotic-evil-novel-naming',
  '小说命名：为无原则反派小说起书名和简介',
  'Novel Naming: Titles and Synopses for the Chaotic Evil novel',
  '## Novel Naming for Chaotic Evil

  书名需要透出一股无法无天的狂气、或是极度冰冷的优雅反派感。

  ### 命名流派
  1. **极其嚣张型**：《我，终极反派，今天又在折磨主角》《因为无聊，我把神界拆了》
  2. **冰冷优雅型**：《微笑的屠杀者》《绝对恶意》《无罪之恶》
  3. **反向嘲讽型**：《关于我每天都在给勇者送绝望这件事》《正义的陨落录》

  ### 简介风格 (Synopsis)
  用第一人称的傲慢口吻，或者带点恶劣的玩笑性质口吻来写。强调主角完全没有底线，并且觉得那些“自以为是的正义”可怜又可笑。',
  '## Novel Naming for Chaotic Evil

  The title needs to exude either unbridled arrogance or a chillingly elegant villainous vibe.

  ### Naming Tropes
  1. **Outrageously Arrogant**: "I, The Ultimate Villain, Am Torturing the Protagonist Again Today", "Bored, So I Dismantled the Divine Realm"
  2. **Cold & Elegant**: "The Smiling Slaughterer", "Absolute Malice", "The Guiltless Evil"
  3. **Reverse Mockery**: "Regarding Giving the Hero Despair Every Day", "Record of Justice''s Fall"

  ### Synopsis Style
  Write in an arrogant first-person tone, or an abrasive, joking tone. Emphasize that the protagonist has zero bottom lines and finds all "self-righteous justice" pathetic and hilarious.',
  @method_id,
  1,
  13,
  NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 12. Entity Naming
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'chaotic-evil-entity-naming',
  '实体命名：为混沌恶小说中的角色、势力、招式起名',
  'Entity Naming: Naming characters, factions, and powers in the Chaotic Evil novel',
  '## Entity Naming for Chaotic Evil

  ### 反派主角/能力命名
  - **核心理念**：违和感、绝对的傲慢、或是极简主义。
  - 招式名可以是完全不在乎的随口一说（如：“打碎骨头的第七种方法”），或者极度带有黑色幽默的名称（如：“慈悲的断头台”）。

  ### 正义阵营/受害者命名
  - **核心理念**：越是崇高、越是神圣、听起来越像传统网文男主/正派组织的名字，就越好。他们存在的目的就是为了被拉落神坛！
  - 组织名用：光辉之剑、纯白圣庭、世界拯救者同盟。',
  '## Entity Naming for Chaotic Evil

  ### Protagonist/Abilities Naming
  - **Core Concept**: Dissonance, absolute arrogance, or extreme minimalism.
  - Ability names can be casual, "don''t care" names (e.g., "Seventh Method to Break Bones") or darkly funny (e.g., "The Merciful Guillotine").

  ### Righteous Faction/Victims Naming
  - **Core Concept**: The loftier, holier, and more traditionally "heroic" they sound, the better. They exist only to be violently pulled off their pedestals!
  - Faction examples: Sword of Radiance, The Pure White Sanctum, The World Savior Alliance.',
  @method_id,
  1,
  14,
  NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();
