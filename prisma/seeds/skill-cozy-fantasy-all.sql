-- The Cozy Fantasy / Low-Stakes Fantasy Novel Skills (Layer 3)
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-cozy-fantasy-all.sql

SET @method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Cozy Fantasy / Low-Stakes Fantasy Novel' LIMIT 1);

-- 1. Story Hook Setting Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'cozy-fantasy-story-hook-setting-gen',
  '生成「Story Hook」：设计治愈系奇幻小说的引入环节，确立无压力和慢节奏的基调',
  'Generate "Story Hook": Design the cozy fantasy introduction, establishing a stress-free and slow-paced vibe',
  '## "Story Hook" Generation — The Cozy Fantasy Novel

  这是定调小说核心乐趣（放松与治愈）的钩子。绝对不能有生死存亡的压力。

  ### Field Generation Guide
  - **The Retirement/Arrival**: 主角是怎么来到这里的？（例如：打了十年魔王终于辞职的厌世勇者，突然穿越并决定只开个小林间茶馆的社畜）。
  - **The Cozy Business/Goal**: 主角打算经营什么神仙日子？（例如：地下城门口的猫咖，专门修复魔法古董的修理铺）。
  - **Core Selling Point**: 巨大的反差萌或是极度的生活质感。（例如：满身伤疤的兽人被一杯热巧克力感动到落泪）。
  - **Reader Expectation**: 读者不是来看打怪升级的，是来看美食、友谊和撸猫的。',
  '## "Story Hook" Generation — The Cozy Fantasy Novel

  This sets the tone for the primary entertainment (relaxation and healing). There must be ABSOLUTELY NO existential threats.

  ### Field Generation Guide
  - **The Retirement/Arrival**: How did the MC get here? (e.g., A world-weary Hero retiring after 10 years, a corporate worker transmigrating to open a forest tea house).
  - **The Cozy Business/Goal**: What peaceful endeavor are they running? (e.g., A cat cafe at the dungeon entrance, a magical antique repair shop).
  - **Core Selling Point**: The stark contrast or the extreme sensory texture of life. (e.g., A scarred Orc crying over a perfect cup of hot chocolate).
  - **Reader Expectation**: Readers are here for food descriptions, found family, and petting magical beasts, NOT for leveling up.',
  @method_id,
  1,
  1,
  NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 2. Core Premise Setting Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'cozy-fantasy-core-premise-setting-gen',
  '生成「Core Premise」：设计治愈系主角的背景、金手指（温柔向）和生活哲学',
  'Generate "Core Premise": Design the cozy protagonist''s background, Gentle Cheat, and life philosophy',
  '## "Core Premise" Generation

  主角往往有着极高的过往实力或生活技能，但选择低调。

  ### Field Generation Guide
  - **Protagonist Archetype**: 满级退休大佬、满级厨艺穿越者，或是有着治愈系能力的小可怜。
  - **The Gentle Cheat**: 他们的金手指不是用来杀人的，而是提升生活品质的。（例如：任何枯萎的花草只要他摸一下就会盛开，或者无限耐久的无菌清洁布）。
  - **Primary Conflict**: 冲突必须是微小的且充满人情味的。（如：隔壁冷漠大叔什么时候才愿意尝我的蛋糕，暴雨天导致送货延迟）。
  - **Social Philosophy**: “聚集一群受伤的灵魂共同经营一家小店”或者“做一个温柔的树洞”。',
  '## "Core Premise" Generation

  The protagonist usually has high past power or culinary skills but chooses a low-profile life.

  ### Field Generation Guide
  - **Protagonist Archetype**: The max-level retiree, the modern master chef transmigrator, or a sweet person with a healing aura.
  - **The Gentle Cheat**: Their cheat is not for killing, but for quality of life. (e.g., Plants bloom when touched, infinite durable cleaning supplies, perfectly controlling oven temperature).
  - **Primary Conflict**: Conflicts must be minor and heartwarming. (e.g., "Will the grumpy neighbor ever try my cake?", delivery delays due to heavy rain).
  - **Social Philosophy**: Found family (gathering broken souls to run a shop) or acting as a gentle listener for travelers.',
  @method_id,
  1,
  2,
  NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 3. The Craft & Daily Life Setting Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'cozy-fantasy-craft-daily-setting-gen',
  '生成「The Craft & Daily Life」：设计主角经营的店铺特色和日常生活的仪式感',
  'Generate "The Craft & Daily Life": Design the cozy shop/trade details and the ritual of daily life',
  '## "The Craft & Daily Life" Generation

  日常感是这类小说的核心，重复的劳作带来安心感。

  ### Field Generation Guide
  - **Business Type**: 餐饮、手工艺、疗愈还是神奇动物饲养？
  - **Daily Routine**: 充满仪式感的日常：清晨阳光穿过玻璃打在吧台上，木头被擦拭时的沙沙声，魔法烧水壶的嗡嗡作响。
  - **Magic Integration**: “大材小用”的魔法。比如用灭世禁咒级别的火焰魔法来烤制黄金羊角面包。
  - **The Specialty Item**: 店里的招牌。例如：专门治疗失恋的失忆薄荷茶。',
  '## "The Craft & Daily Life" Generation

  The ritual of daily life gives cozy fantasy its relaxing core.

  ### Field Generation Guide
  - **Business Type**: Food/Beverage, Crafting, Healing, or Magical Beast sanctuary?
  - **Daily Routine**: Sensual morning rituals: sunlight hitting the counter, the sound of sweeping the wooden floor, the hum of a magical kettle.
  - **Magic Integration**: "Overkill" magic used for mundane chores. (e.g., Using Hellfire to perfectly bake a batch of golden croissants).
  - **The Specialty Item**: The shop''s famous offering. (e.g., A mint tea that specifically cures the ache of a recent heartbreak).',
  @method_id,
  1,
  3,
  NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 4. Worldbuilding Setting Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'cozy-fantasy-worldbuilding-setting-gen',
  '生成「Worldbuilding」：设计一个温馨但有奇幻色彩的街区/风土人情',
  'Generate "Worldbuilding": Design a warm, quaint neighborhood/world with fantasy elements',
  '## "Worldbuilding" Generation

  外面的世界哪怕战火纷飞，主角的这条街道也必须是安宁的避风港。

  ### Field Generation Guide
  - **The Outside World**: 大部分时候作为背景板，仅仅为了送来源源不断的疲惫顾客。
  - **The Neighborhood**: 主角的邻居们。可以是粗声粗气但总是送来柴火的矮人铁匠婆婆，或是喜欢在屋顶晒太阳的精灵琴师。
  - **Local Quirks/Laws**: 用可爱的规定增加风味：例如“禁止在每周三下雨的时候施放飞行咒”。
  - **The Threat Level**: **绝无生命危险！** 最大的危机可能是店铺评级大赛，或是某个嚣张的贵族试图强买强卖（然后被主角轻松打发）。',
  '## "Worldbuilding" Generation

  Even if the outside world is fighting an epic war, the protagonist''s street is an absolute safe haven.

  ### Field Generation Guide
  - **The Outside World**: Exists mainly as a backdrop to supply exhausted customers who need a break.
  - **The Neighborhood**: The quaint neighbors. A gruff dwarven blacksmith grandma who drops off firewood, an elf bard who sleeps on roofs.
  - **Local Quirks/Laws**: Cute local flavor: "No flying spells on rainy Wednesdays."
  - **The Threat Level**: **NO EXISTENTIAL THREATS!** The biggest crisis is a bad health inspector review or a snooty noble trying to buy the shop (and being gently escorted out).',
  @method_id,
  1,
  4,
  NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 5. Writing Style Setting Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'cozy-fantasy-writing-style-setting-gen',
  '生成「Writing Style」：指导治愈系小说的舒缓节奏五感描写',
  'Generate "Writing Style": Directs the slow pacing and vivid sensory descriptions of cozy fantasy',
  '## "Writing Style" Generation

  语言必须像是在冬天裹着毛毯喝热茶一样舒服。

  ### Field Generation Guide
  - **Prose Tone**: 温婉、从容、带有微微的幽默与极大的包容感。
  - **Sensory Focus（五感描写）**: 这是关键！必须强调用大量的笔墨描写嗅觉（刚出炉的黄油香）、听觉（雨滴打在雨棚上的白噪音）、触觉（柔软猫毛触碰指尖），以此来放慢读者的阅读节奏。
  - **Pacing**: 缓慢如水。不用赶着走主线，允许花整整一章来描写煮一锅汤的过程。',
  '## "Writing Style" Generation

  The prose must feel like being wrapped in a blanket with a warm cup of tea on a rainy day.

  ### Field Generation Guide
  - **Prose Tone**: Gentle, unhurried, with mild humor and immense emotional warmth.
  - **Sensory Focus**: THIS IS CRITICAL. Dedicate paragraphs to smell (browning butter), sound (rain pattering on the awning), and touch (fluffy cat fur) to slow down the reader.
  - **Pacing**: Slow as honey. There is no rush to advance the plot. It is perfectly fine to spend an entire chapter describing the process of simmering a soup.',
  @method_id,
  1,
  5,
  NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 6. Character Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'cozy-fantasy-character-gen',
  '角色生成：生成有反差萌的顾客、笨手笨脚的店员和傲娇邻居',
  'Character Generation: Contrastingly cute customers, clumsy assistants, and tsundere neighbors',
  '## Character Generator for Cozy Fantasy

  这里没有纯粹的恶人（即使有也是为了提供喜剧效果的小丑）。角色的核心是“治愈别人”或“被主角治愈”。

  ### 设计要点
  - **Personality Trait**: 每个人都有可爱的小毛病：比如传说中的大魔导师一喝热牛奶就会倒头大睡；冷酷的赏金猎人其实是个极度洁癖。
  - **Source of Stress**: 明确他们疲惫的源头（被大魔王职场霸凌的低级魅魔、因为考核失败而丧气的年轻法师）。
  - **“被攻略”的过程**: 写明他们如何被主角的美食、耐心或店里的氛围渐渐软化，成为家人般的存在。',
  '## Character Generator for Cozy Fantasy

  There are no pure villains here (only comedic, minor annoyances). Characters revolve around "healing" or "being healed" by the protagonist.

  ### Design Core
  - **Personality Trait**: Endearing flaws are a must. A legendary Archmage falling asleep instantly after drinking hot milk; a ruthless bounty hunter who is an extreme neat freak.
  - **Source of Stress**: Why do they need the cozy shop? (A low-level succubus experiencing workplace bullying in the Demon Army; a young mage depressed over failing exams).
  - **The Thawing Process**: How their cold/stressed exterior is gradually melted by the MC''s food, patience, and the shop''s atmosphere, turning them into found family.',
  @method_id,
  1,
  6,
  NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 7. Faction (Organization) Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'cozy-fantasy-faction-gen',
  '势力/组织生成：生成松散的行会、热心的居委会或笨蛋打酱油团队',
  'Faction Generation: Loose guilds, helpful neighborhood watches, or comedic adventuring parties',
  '## Faction Generator for Cozy Fantasy

  把诸如“黑暗兄弟会”、“盗贼公会”之类的名字进行“降维打击”。

  ### 设计核心
  - 即使名字听起来很可怕，其实质往往是很日常的。例如“深渊之刃杀手团”现在的日常任务是帮街坊领居除草和寻找走失的猫咪。
  - **Interaction with Protagonist**: 这些组织往往是来主角店里团建、聚餐，或者因为某件搞笑的小事求助于主角（比如：伟大的法师公会因为会长不小心把厨房炸了，全员只能来主角这里包月蹭饭）。',
  '## Faction Generator for Cozy Fantasy

  Downgrade intimidating fantasy factions into mundane, localized community groups.

  ### Design Core
  - Even if they sound terrifying, their reality is mundane. Example: "The Abyssal Blades Assassin Guild" currently makes most of their coin weeding gardens and finding lost cats for the neighborhood.
  - **Interaction with Protagonist**: They frequently use the MC''s shop for team building, or they seek the MC''s help for comedic reasons (e.g., The Mage Guild blowing up their cafeteria and being forced to eat at the MC''s cafe for a month).',
  @method_id,
  1,
  7,
  NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 8. Scene Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'cozy-fantasy-scene-gen',
  '场景生成：生成充满生活质感的小店吧台、魔法杂货铺街带、阳光充沛的后院',
  'Scene Generation: Cozy tavern counters, magical market streets, and sunlit back gardens',
  '## Scene Generator for Cozy Fantasy

  主角的“小店”是你小说的灵魂核心地标，必须设计得让读者看一眼就想住进去。

  ### 场景类别
  - **主角的大本营**：描写那张被打磨得发亮的橡木桌、炉膛里永远跳跃的火苗，以及挂在吧台上能够发出风铃声的魔法干花。
  - **街道和市场**：描写琳琅满目的魔法商品带来的生活气息，而非危险感。

  ### 核心吸引力
  - 强调**“避风港”**属性（Atmosphere）。外面刮着霜冻风暴，但只要推开门，伴随着铜铃的叮当声，迎面就是温暖的咖啡香和微笑。',
  '## Scene Generator for Cozy Fantasy

  The protagonist''s shop/home is the soul of the novel. It must be a place the reader physically yearns to live in.

  ### Scene Categories
  - **The Protagonist''s Base**: Describe the polished oak tables, the ever-dancing flames in the hearth, and the drying magical herbs hanging from the rafters that chime like wind bells.
  - **Streets & Markets**: Bursting with the lively, sensory details of magical commerce, feeling bustling but completely safe.

  ### Core Appeal
  - Emphasize the **"Safe Haven"** property. A freezing magical storm rages outside, but the moment you push the door open to the chime of a copper bell, you are hit with warmth, the smell of coffee, and a welcoming smile.',
  @method_id,
  1,
  8,
  NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 9. Plot Gen
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'cozy-fantasy-plot-gen',
  '剧情设计：设计迎接特殊客人、制作新菜品或举办社区节日的剧情线',
  'Plot Design: Welcoming quirky guests, developing new recipes, or hosting community festivals',
  '## Plot Generator for Cozy Fantasy

  如果说别的流派剧情是“起承转合”，Cozy Fantasy 的主线更像是情景喜剧或美食纪录片。

  ### 经典剧情结构
  1. **一位疲惫的客人推门而入**：某个风雪交加的日子，大名鼎鼎（或凶神恶煞）的角色陷入低谷，偶然尝到了主角的手艺，从而卸下防备，倾吐心声。
  2. **“进货/打猎”日常**：为了制作某道新菜，主角或店员去郊区踩几条普通（在别人看来是凶兽）的小鱼、采些发光的蘑菇，过程充满田园色彩。
  3. **店铺装修/新员工入职**：捡到一只离家出走的小龙崽子，最后只能无奈收留让它帮忙烤火炉；或者扩大店面。
  4. **小镇的季节庆典**：例如丰收节烤面包大赛，邻居们和主角互相帮忙（或者善意地斗气）。

  ### 避雷指南
  绝对不能死人；所有“反派”都只能是小偷小摸、刁钻评委这种程度；最终一定是大团圆和温馨收尾。',
  '## Plot Generator for Cozy Fantasy

  If other genres are Epic Quests, Cozy Fantasy plot works like a sitcom or a food documentary.

  ### Classic Plot Structures
  1. **A Weary Traveler Enters**: On a snowy night, a famous/intimidating figure at their lowest walks in, tastes the MC''s food, drops their guard, and vents their sorrows.
  2. **The "Gathering" Routine**: To make a new dish, the MC gathers glowing mushrooms or catches some fish (which others view as terrifying beasts but the MC treats as normal produce) in a pastoral slice-of-life trip.
  3. **Shop Expansion/New Hire**: Found a runaway baby dragon? Guess it''s the new oven lighter. Finding strays and employing them as found-family.
  4. **The Town Festival**: E.g., The Autumn Harvest Baking Contest. Gentle rivalry and community support.

  ### What to Avoid
  ABSOLUTELY NO DEATHS. "Villains" are restricted to snooty food critics or minor pickpockets. Every arc ends with warmth, full bellies, and smiles.',
  @method_id,
  1,
  11,
  NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 10. Narrative Writing
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'cozy-fantasy-narrative',
  '叙事写作：指导食物描写（Food Porn）、慢节奏微表情描写和温柔旁白',
  'Narrative Writing: Writing "food porn", slow micro-expressions, and gentle inner monologues',
  '## Narrative Writing for Cozy Fantasy

  把写“特效”的笔墨全部拿来写“生活感”。

  ### 食物与手工描写（Food Porn / Craft Porn）
  - 动词要细腻：“他将发酵好的面团轻轻揉开，听着里面气泡噗噗破裂的微小声响”。
  - 强调温度设定让食物变得有诱惑力：“滚烫的融化芝士在寒冬的雨夜里拉出长长的丝”。

  ### 情感的“留白”与动作细节
  - 不要直接写“他被治愈了”。
  - 应该写：“这位沾满泥土的狂战士盯着手里热气腾腾的马克杯很久很久。他缓缓端起来抿了一小口，原本紧绷得像满弓一样的肩膀，突然间肉眼可见地垮了下去，发出了一声长长的、满足的叹息。”',
  '## Narrative Writing for Cozy Fantasy

  Use the words usually reserved for "epic spell effects" to vividly describe "mundane life tasks."

  ### Food/Craft Porn
  - Delicate verbs: "He gently kneaded the rested dough, listening to the tiny *pop* of the fermented air bubbles trapped inside."
  - Use temperature contrasting for appeal: "The bubbling, molten cheese stretching out in long strings amidst the freezing winter rain."

  ### Showing "Healing" through Micro-actions
  - DO NOT just write "He was healed/comforted."
  - WRITE: "The mud-covered berserker stared at the steaming mug for a long time. He took a hesitant sip. Instantly, his shoulders—which were wound as tight as a drawn bowstring—visibly surrendered, sagging downwards as a long, deeply satisfied sigh left his lips."

  Take it slow. Make the reader hungry. Make them feel warm.',
  @method_id,
  1,
  12,
  NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 11. Novel Naming
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'cozy-fantasy-novel-naming',
  '小说命名：为治愈系小说起轻松、日常且温暖的书名和简介',
  'Novel Naming: Titles and Synopses for cozy, slice-of-life fantasy novels',
  '## Novel Naming for Cozy Fantasy

  书名必须让人一眼就能感受到“啊，我可以在这本书里睡个好觉”的氛围。

  ### 命名流派
  1. **职业+日常组合**：最经典的结构，例如经典名著《Legends & Lattes》（传奇与拿铁）。中文可以是：《地下城下的猫咪咖啡馆》、《退休魔王的烘焙日记》。
  2. **反卷口号型**：《无敌的我决定回乡下种地》、《勇者辞职后开起了杂货铺》。
  3. **温馨物语型**：《星光旅馆的常客们》、《一杯治愈异世界的红茶》。

  ### 简介风格 (Synopsis)
  定调轻松喜剧或温馨童话。开篇先用两句话交待主角有多强或多累，然后话锋一转：“但现在，我只想烤好今天第一炉小面包”。罗列出书中会出现的可爱元素：兽人、精灵、热茶、被治愈的过客等。',
  '## Novel Naming for Cozy Fantasy

  The title must instantly signal to the reader: "Ah, I can relax and take a nap in this book."

  ### Naming Tropes
  1. **Action paired with Mundane**: The gold standard: *Legends & Lattes*. Others: *Orcs & Ovens*, *The Retired Demon Lord''s Bakery*, *Dungeon Cat Cafe*.
  2. **Anti-Grind Announcements**: *I''m Overpowered but I Just Want to Farm*, *The Hero Resigns to Open a Convenience Store*.
  3. **Wholesome Chronicles**: *Guests of the Starlight Inn*, *A Cup of Tea to Heal the World*.

  ### Synopsis Style
  Lighthearted comedy or heartwarming fairytale. The first paragraph mentions the MC''s past glory/stress, then a hard pivot: "But now, my only quest is making sure this batch of croissants doesn''t burn." List the cozy elements: blushing orcs, sleepy elves, hot tea, and found family.',
  @method_id,
  1,
  13,
  NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();

-- 12. Entity Naming
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'cozy-fantasy-entity-naming',
  '实体命名：为疗愈系人物、温暖的魔法餐饮店和日常魔法起名',
  'Entity Naming: Naming fluffy characters, cozy magical cafes, and mundane spells',
  '## Entity Naming for Cozy Fantasy

  ### 咖啡馆/商铺命名
  - 用**不搭嘎的矛盾词+温馨名词**组合最好。
  - 例如：“The Thirsty Basilisk (口渴的蛇怪酒馆)”，“The Whispering Teapot (低语茶壶)”，“Sleepy Dragon Bakery (贪睡龙烘焙坊)”。

  ### 菜品/物品命名
  - 凸显治愈与一点点魔法奇想。
  - 例如：“星空覆盆子果酱”，“能听见大海声音的贝壳海鲜浓汤”，“一夜安眠药茶”。

  ### 人物与昵称
  - 主角通常叫一个极简平易近人的名字（如 Viv，Arthur）。
  - 给毛茸茸的奇幻宠物起食物系或可爱的名字（比如叫“麻薯”的史莱姆，叫“曲奇”的地狱犬）。',
  '## Entity Naming for Cozy Fantasy

  ### Cafe/Shop Names
  - Combine a **dangerous/fantasy creature** with a **cozy object/state**.
  - e.g., *The Thirsty Basilisk*, *The Whispering Teapot*, *The Sleepy Dragon Bakery*, *The Orc''s Oven*.

  ### Dishes/Items
  - Highlight healing properties and magical whimsy.
  - e.g., "Star-speckled Raspberry Jam", "Ocean-whisper Seafood Chowder", "A-Good-Night''s-Rest Herbal Tea".

  ### Characters & Pets
  - MCs usually have simple, grounding, friendly names (e.g., Viv, Arthur, Nell).
  - Magical pets should have cute or food-based names (e.g., A slime named "Mochi", a hellhound named "Cookie").',
  @method_id,
  1,
  14,
  NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions_en = VALUES(instructions_en), updated_at = NOW();
