-- -----------------------------------------------------------------------------
-- 家族修仙/种田流 (Clan Cultivation / Farming) AI 生成技能 Layer 3 SQL
-- -----------------------------------------------------------------------------

SET @method_id = 86; 

-- ============================================================================
-- 1. 设定生成技能 (-setting-gen)
-- ============================================================================

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-clan-story-hook-setting-gen',
  '「烂摊子接盘开局」生成：生成主角空降濒临破产的修仙世家、面对催债单与族人生存危机的种田起步',
  '"Story Hook" setting generation for Clan Cultivation',
  '## 「临危受命族长钩子」设定生成 — 家族修仙流\n\n这是一种典型的“模拟经营”或是“率土之滨”开局。\n\n---\n\n### 字段生成指南\n\n#### 家族破产倒闭录\n必须把前任族长写得很惨，比如刚刚在猎杀妖兽时陨落，导致家族不仅损失了一个最高战力（筑基期），还欠下了大宗门或者隔壁敌对势力三千块下品灵石。如果不还上，家族主峰的灵脉就会被拿走抵债。\n\n#### 第一桶金(救命稻草)\n主角（现任年轻族长或是附身玉佩里的老祖）利用自己脑子里的现代知识或特殊外挂（如能融合妖兽血脉的鼎炉、能显示灵土肥沃度鉴定系统），培育出了变异的一种灵草，高价卖给坊市，刚刚好在最后一天期限解除破产危机。从此开启家族复兴之路。',
  '## "Story Hook" Setting Generation — Clan Cultivation\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-clan-world-setting-gen',
  '「地缘修仙法典」设定：生成一个讲究凡俗俗根、上交保护费与家族地盘倾轧的真实产业链',
  '"Worldview" setting generation for Clan Cultivation',
  '## 「修仙地缘政治世界观」设定生成 — 家族修仙流\n\n这不是一个人的快意恩仇，打赢了就是抢灵石矿，打输了就是全族老小男为奴女为娼。\n\n---\n\n### 字段生成指南\n\n#### 依附与朝贡体系\n主角是个微不足道的不入流小家族（九流）。他们上面有八流仙宗（金丹期坐镇）。八流在每年秋天都会派出一个极度欠扁的筑基大圆满特使，来向主角家族强行征收“今年的岁贡”。如果交不齐，家族里刚满六岁的几个小天才就会被强行带走给宗门老怪当药引。因此主角前期的终极压力是“年底还贷”。\n\n#### 极其严苛的繁衍法则\n修真讲灵根，但生出有灵根的孩子的概率是万分之一。所以家族必须保护山下的凡人城池繁衍生息。那些不能修炼的族人会被发配到山下当富家翁疯狂生孩子。这种宗法制维系了网文里少有的“人伦纽带”。',
  '## "Worldview" Setting Generation — Clan Cultivation\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-clan-style-setting-gen',
  '「模拟经营家主文风」生成：充满账本味与烟火气的灵石计较、血脉传承老父亲式叹息文笔',
  '"Writing Style" setting generation for Clan Cultivation',
  '## 「家长里短柴米油盐修仙文风档案」设定生成 — 家族种田流\n\n---\n\n### 字段生成指南\n\n#### 万事皆要算账\n文风中要体现极度的贫穷和精打细算。\n*Example描写：他看着手中这枚仅剩一半灵韵的下品灵石，叹了口气。家族库房里早就饿得能跑老鼠了，这半块灵石还是二伯偷偷将唯一的本命飞剑当了才换来的糊口钱。若是明天那亩一阶灵稻再不出苗，族里三十口人下个月就只能去深山喝西北风了。*\n\n#### 家族全景视角的温暖刻画\n不要只描写主角装酷。要群像刻画：写六岁的流着鼻涕的三娃在广场上扎马步；写没牙的七十岁十一叔在灵田里弯着腰抓灵虫。大家都在为了家族活着，虽然弱小但是极具人情味。',
  '## "Writing Style" Setting Generation — Clan Cultivation\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);


-- ============================================================================
-- 2. 角色生成技能 (-character-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-clan-character-gen',
  '「家族班子与新秀群像」生成：设计负责炼丹炼器打架的叔伯长老与充满野心的高天资下代幼苗',
  '"Character" generation for Clan Cultivation',
  '## 「家族文官武将与后辈接班人档案」生成 — 家族种田流\n\n主角不是孤狼。家族文是群像文的代表。\n\n---\n\n### 字段生成指南\n\n#### 族务班底（老一辈的牺牲者）\n因为年轻时受过重伤此生止步练气七层的“大供奉”，现在主管家族外事堂。他为人极度圆滑，为了家族不惜对同辈的其他散修伏低做小，但在别人欺负家族晚辈时，他敢直接点燃全身真元与对方同归于尽。\n\n#### 承接希望的后浪天才\n【天才小辈的诞生高潮】：比如在每五年一次的家族测灵大会上，一个原本不被看好的庶出小男孩，居然把测灵珠点亮了刺眼的紫光（天异雷灵根）。全族狂喜，老族主直接跪在祠堂哭，但同时要为了防止隔壁家族暗杀而决定将其秘密雪藏培养。',
  '## "Character" Generation — Clan Cultivation\n\n...',
  @method_id, 1, 21, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 3. 场景生成技能 (-scene-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-clan-scene-gen',
  '「大本营升级日志」生成：从小破山头到拥有护宗大阵与极品灵泉仙山的家主视角地图升级建设',
  '"Scene" generation for Clan Cultivation',
  '## 「家族大本营模块图鉴」生成 — 家族种田流\n\n---\n\n### 字段生成指南\n\n#### 在建工程的成就感\n主角必须要在每卷升级一次家族固定资产。\n比如前期山头只是【几排漏雨的茅草屋跟一片枯黄的下品灵田】。发展一百年后，变成了【笼罩在一阶极品天水大阵中的九层重楼、后山开进了拥有三百条赤鳞鲤的灵水湖、门前有一座凡人熙熙攘攘的修仙集市】。每次升级必须要体现是主角带着全家老小辛辛苦苦搬砖搭建起来的。',
  '## "Scene" Generation — Clan Cultivation\n\n...',
  @method_id, 1, 22, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 4. 道具生成技能 (-prop-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-clan-prop-gen',
  '「镇族之宝与致富法门」生成：不再是单挑用的毒刺而是能传代、能提升群体采矿或炼丹概率的核心生产资料',
  '"Prop" generation for Clan Cultivation',
  '## 「核心资产与战略法宝储备」生成 — 家族种田流\n\n---\n\n### 字段生成指南\n\n#### 生产资料重于天\n主角开挂刷出的绝不是单人神装。他找到的法宝往往是一只【二阶下品灵兽幼崽“吞金兽”】（能够帮家族寻找地下矿脉），或者是一本无名《极上灵草杂交玉简》（能让下品草药突变为中品）。这是让家族起飞的引擎。\n\n#### 家族库房的战略核恐吓\n每一代族长坐化前，都会拼命留下镇族底牌。比如：【祖师爷留下的三道能够爆发出结丹期巅峰威力的破天符篆残片】。这就是威慑周边两百里内另外两个敌对家族不敢直接推平主角的核武器。必须重点大书特书。',
  '## "Prop" Generation — Clan Cultivation\n\n...',
  @method_id, 1, 23, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 5. 组织生成技能 (-org-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-clan-org-gen',
  '「地缘死仇家与虚伪上宗」生成：周边为了抢水争抢矿脉无所不用其极的两大家族与盘剥附庸的金丹大派',
  '"Organization" generation for Clan Cultivation',
  '## 「地头蛇与吸血大宗门生态」生成 — 家族种田流\n\n---\n\n### 字段生成指南\n\n#### 极具真实感的乡镇恶霸互斗\n主角所在的修仙县城往往呈现“三足鼎立”。比如张家擅长炼丹、李家擅长制符。为了争夺那唯一一条通往大宗门的交通灵船的名额，或者为了那条横在边界的微型灵矿，三家疯狂安插卧底、让子女政治联姻互相下毒。这种斗争极其现实且残酷。\n\n#### 上家宗门的“吃拿卡要”与“血令”\n比如“青云真宗”。他们从来不把下属家族当人，随意发布强制招募令：“命尔等三流家族出动五名练气期弟子编入敢死队随本宗征讨魔门，违令者灭族”。主角必须在一次次剥削中巧妙周旋藏大掘起，直到有一天反将上家取而代之。',
  '## "Organization" Generation — Clan Cultivation\n\n...',
  @method_id, 1, 25, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 6. 情节推演技能 (-plot-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-clan-plot-gen',
  '「家族百年经营大纲」推演领域：为解决债务、开荒秘境、斗垮世仇到一统仙朝的长线基建模拟大纲排期',
  '"Plot Design" domain knowledge for Clan Cultivation',
  '## 「种田模拟器大纲推演」领域知识 — 家族修仙流\n\n主线是一部艰苦创业、从九流家族攀升至千古仙朝的不朽奋斗史。每一卷大约推进二三十年。\n\n---\n\n### 典型故事推演结构\n1. **受命危局与第一桶金脱贫**：前代族长战死，主角作为青年才俊仓促接任族长。发现库房耗尽随时因为交不出岁贡被上宗贬落凡尘。主角在家族祖遗物中意外绑定了修仙模拟器或者发现极品改良炼丹术。在一个月后成功拍卖出极品驻颜丹，勉强还上巨债，稳定军心。\n2. **合纵连横与平定周边**：经过三年的发育，培养出了第一批青壮年班底护卫。隔壁抢水夺矿的老仇敌家族终于安耐不住出手袭击商队。主角将计就计，果断出击打出全族血性，阵斩敌对族长，一举吞并了隔壁的坊市，让家族晋升八流。\n3. **大宗门反叛与天才后浪涌现**：四十年后，主角年过花甲（或者容颜未老），家族发展到了上百名修士。家族内部不仅出了天灵根的幼童，连自己也突破了结丹。此时上界的大宗门爆发大乱想要疯狂抽空下属家族的血。主角不再装孙子，联手其他大族逆杀宗门特使，直接打上金丹老巢，抢夺元婴机缘传承。\n4. **千年世家与仙朝林立**：三百年后，当年抱在怀里哭的稚童已经是威震南荒的第一剑尊。当年只有几排茅屋的主峰现在已经变成了浮在天空的白玉京。主角站在祖宗祠堂（甚至自身就是老祖神龛），看着台下三万名弟子高呼万岁，完成九流底层攀升到天庭至尊的千古世家大业。\n\n### 常见错误\n- ❌ 中途主角突然抛弃了家族，自己一个人出去装逼打野、去参加学院比武撩妹。这是家族流的大忌！家族流的核心爽点就在于“大当家的带头搞基建抢钱”。',
  '## "Plot Design" Domain Knowledge — Clan Cultivation\n\n...',
  @method_id, 1, 30, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 7. 实体命名技能 (-entity-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-clan-entity-naming',
  '族谱与地头蛇命名法：规范中国古代宗族传统的字辈法、拥有地方垄断属性的商铺与矿脉定名',
  '"Entity Naming": professional naming guidance for Clan Cultivation',
  '## 实体命名 — 家族种田流\n\n讲究极佳的中国古代“宗族宗法感”和封建地主气息。\n\n---\n\n## 一、极度严谨的族谱起名\n\n- 必须有字辈：家族后代起名必须遵从“天、地、玄、黄、宇、宙、洪、荒”之类的排班。主角是“道”字辈：林道清。他的长辈是“天”字辈十一爷：林天宏。下一代是“玄”字辈侄儿：林玄风。通过看名字的中字就知道他是长辈还是晚辈，极其凸显家族规矩感。\n\n## 二、资产与对立家族名\n\n强调地域垄断属。\n- 资产与地理：【青牛坊市（家族名下的集市）】、【落日山脉玄铁矿的二号矿脉】、【青竹山（家族总部）】。\n- 邻里：绝对不要起那种“九天至尊宫”的敌对名。那不符合前期格局。就叫【隔壁黄家】、【镇海堡陈家】、【苍云门（吸血上级）】。充满接地气的封建帮派感。',
  '## Entity Naming — Clan Cultivation\n\n...',
  @method_id, 1, 36, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 8. 叙事写作技能 (-narrative)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-clan-narrative',
  '群像与护短感文风：如何通过发月钱、开祠堂祭祖发狠话、老者欣慰目光的特写烘托无死角凝聚力',
  'Narrative writing guidance for Clan Cultivation',
  '## 家长里短与浴血护短写作指引 — 家族种田流\n\n一半时间写算账操心，一半时间写为了护犊子连命都不要的血战。\n\n---\n\n### 一、最具烟火气的宗族特写\n要多写日常议事，不要高深莫测，就是坐在一起商量怎么赚钱。\n*Example描写：入夜，青竹山祖祠内灯火通明。三张粗糙的梨木椅上坐着家族仅剩的三名高层。三长老猛抽了一口旱烟，在门槛上磕了磕：“族长，今年药田遭了蝗虫，大房那边甚至断了半个月的丹药，再这么下去，没等别人打过来，咱们自己小辈的心就散了。” 主角闭上眼，沉声拍板：“开宗库，把老族长生前用的那把飞剑拿去坊市当了。再苦不能苦了学堂里那三十个练气一层的好苗子！”*\n\n### 二、打断骨头连着筋的外战\n*Example描写：看着面前五名魔宗弟子狞笑逼近主角，原本颤颤巍巍、平日里因为贪墨了两块灵石被主角骂得狗血淋头的老十一，此刻却突然一把冲到主角身前。他从怀里掏出唯一一张高阶炎爆符，大笑一声：“老子没几天活头了，族长，带着家族的火种滚后山去！李家只有站着死的鬼！”轰然一声，以命换命炸碎了三名魔修。*\n这就叫“家族文”。主打一个外战无敌高燃爆发。',
  '## Narrative guidance — Clan Cultivation\n\n...',
  @method_id, 1, 101, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 9. 小说命名技能 (-novel-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-clan-novel-naming',
  '家族文世家命名法：充斥着“从某某山开始”“打造千年世家”与姓氏图腾烙印的地主养成书名',
  '"Novel Naming": title generation for Clan Cultivation',
  '## 小说命名 — 家族种田流\n\n---\n\n### 常见书名格式\n\n**格式一：极其明确的“地名或祖宗/家族”起手法**\n很清晰的经营流标识（最近起点中文网最火爆的流式）。\n- 示例：《长生家族：从开辟坊市开始》、《我，修仙界第一老祖》、《家族修仙：带着族长模拟器横推万界》、《青莲之巅》、《百世求仙（其实是百世家族累积）》\n\n**格式二：发展愿景宣告**\n- 结构：[我的残破现状/身份] + [我的伟大经营目标]\n- 示例：《烂摊子族长，开局带领全族搞基建》、《修真：我把九流家族打造成大罗仙庭》\n\n### 内容简介结构\n用满载历史厚重感、或者穿越者吐槽账本的语录，描述从小家族苟到大仙朝的历程。\n“王道衍穿越至修仙界，没成剑仙，没去顶级大门，反而成了太原王氏一个名不见经传、即将濒临破产被隔壁李家吞并的苦逼十三代老族长。\n账面上只剩三块下品灵石，五个残疾供奉，外加学堂里二十个嗷嗷待哺的年轻小辈。\n王道衍连夜启动了【宗族气运模拟器】。\n【你给六岁的旁系天才传授极品雷决，由于感恩，家族气运激增，获得二阶护族大阵图纸一张。】\n【你率领三位叔伯在深山击杀了变异妖狐，家族获得十万灵石起步资金。】\n三百年后。\n当年那个穷得当裤子的太原王家，已经成了横跨八州、门下元婴弟子过万的大罗仙朝。\n望着云海上望不见尽头的仙玉宫殿，身为万仙共主无敌老祖的王道衍抽了一口旱烟，向着祖先牌位叹息：\n‘列祖列宗，不肖子孙道衍，终于把咱家的生意做大做强了啊。’”',
  '## Novel Naming — Clan Cultivation\n\n...',
  @method_id, 1, 35, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);
