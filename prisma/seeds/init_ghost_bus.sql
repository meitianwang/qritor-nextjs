-- 末班车规则流小说创作方法
-- Language: zh
-- Includes: creation method + 8 module types
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/init_ghost_bus.sql

-- ============================================================
-- 1. 创建创作方法
-- ============================================================

INSERT INTO novel_creation_method (name, description, novel_type, language, visible_categories, is_preset, user_id, status, created_at)
VALUES (
  '末班车规则流小说创作',
  '专为"末班车规则流"恐怖小说设计的创作方法。主角因加班、意外或某种契机，误上了一辆不该存在的末班车。车上有一套必须遵守的规则，随着行驶，上车的"东西"越来越不像人，主角必须在抵达终点站（坟场、冥界或虚空）之前找到下车的方法。核心恐惧：规则的存在本身就意味着有东西在等待违规者。',
  '悬疑灵异',
  'zh',
  '["setting","character","scene","prop"]',
  1,
  NULL,
  'published',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  novel_type = VALUES(novel_type),
  visible_categories = VALUES(visible_categories),
  updated_at = NOW();

SET @method_id = (SELECT id FROM novel_creation_method WHERE name = '末班车规则流小说创作' LIMIT 1);

-- ============================================================
-- 2. 创建模块类型（8 个）
-- ============================================================

-- 2.1 故事钩子（setting, singleton, temp=1.2）
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  '故事钩子',
  '主角误上末班车的契机，以及第一个让他意识到"这辆车不对劲"的瞬间',
  '{"type":"object","required":["故事钩子"],"properties":{"故事钩子":{"type":"string","title":"故事钩子","description":"一句话：主角为什么在这辆车上，以及第一个诡异细节是什么——让读者立刻感到不对劲","x-uiWidget":"textarea","useForAI":true},"上车契机":{"type":"string","title":"上车契机","enum":["加班误点（最后一班公交）","意外错过普通班次","强迫或被引导上车","灾难/事故后的逃离","梦境或特殊精神状态","其他"],"x-uiWidget":"select","useForAI":true},"第一个诡异信号":{"type":"string","title":"第一个诡异信号","description":"上车后最初察觉到异样的细节——可以是细微的（车票上的字在变化），也可以是直接的（司机没有脖子）。越克制的初始信号往往越有效","x-uiWidget":"textarea","useForAI":true},"终点的代价":{"type":"string","title":"终点的代价","description":"如果主角被带到终点站，将面临什么？死亡？灵魂被困？被带入冥界？还是不知道——而不知道有时比知道更恐怖","x-uiWidget":"textarea","useForAI":true},"获救的希望":{"type":"string","title":"获救的希望","description":"主角存活的可能性——是有人告诉他规则、车上有线索、还是他必须自己摸索？有没有前人活下来的先例","x-uiWidget":"textarea","useForAI":true}}}',
  1.2,
  @method_id,
  1,
  1,
  0,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  json_schema = VALUES(json_schema),
  temperature = VALUES(temperature),
  updated_at = NOW();

-- 2.2 末班车设定（setting, singleton, temp=1.0）
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  '末班车设定',
  '这辆不该存在的末班车的外观、路线、司机与车厢细节——恐怖感的物理容器',
  '{"type":"object","required":["车型","路线编号"],"properties":{"车型":{"type":"string","title":"车型","enum":["城市公共汽车","长途客运大巴","地铁/轻轨","有轨电车","无轨电车（无线缆的幽灵版）","其他"],"x-uiWidget":"radio","useForAI":true},"路线编号":{"type":"string","title":"路线编号","description":"路线号或名称——可以是现实存在的路线（但最后一班车已停运），也可以是一个不存在的号码","useForAI":true},"外观特征":{"type":"string","title":"外观特征","description":"车辆外观的诡异之处：颜色异常、年代感过强、缺少某些正常的部件、车身有无法解释的划痕或污迹","x-uiWidget":"textarea","useForAI":true},"车内氛围":{"type":"string","title":"车内氛围","description":"灯光状态（昏黄/闪烁/颜色异常）、气味（旧布/花香/腐败/烟味）、座位布局（是否有某些位置明显不同）、空气质感","x-uiWidget":"textarea","useForAI":true},"司机特征":{"type":"string","title":"司机特征","description":"司机的外貌、行为与存在感——规则流中司机通常是整个系统的一部分，而非普通人。他不主动伤害，但也不会帮助，只是维持这趟车的运行","x-uiWidget":"textarea","useForAI":true},"运行规律":{"type":"string","title":"运行规律","description":"这辆车何时出现（特定条件？特定时间？）、按什么路线行驶、终点站在哪里，以及它是否每夜都在运行","x-uiWidget":"textarea","useForAI":true},"车厢特殊结构":{"type":"string","title":"车厢特殊结构","description":"与普通车辆不同的结构特征：是否有某排座位被封死、后车厢是否与前车厢有隔断、是否有主角不敢打开的门","x-uiWidget":"textarea","useForAI":true}}}',
  1.0,
  @method_id,
  1,
  1,
  0,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  json_schema = VALUES(json_schema),
  temperature = VALUES(temperature),
  updated_at = NOW();

-- 2.3 规则体系（setting, singleton, temp=1.0）
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  '规则体系',
  '车上必须遵守的规则清单、违规后果与下车条件——规则的存在本身就是这个世界运转逻辑的体现',
  '{"type":"object","required":["规则清单","下车条件"],"properties":{"规则清单":{"type":"string","title":"规则清单","description":"逐条列出车上的规则（建议5-9条，过少缺乏层次感，过多难以记忆）。规则应有内在逻辑——不是随机的禁忌，而是在保护乘客或维持某种平衡","x-uiWidget":"textarea","useForAI":true},"规则来源":{"type":"string","title":"规则来源","enum":["突然知道（植入脑中）","有人在上车前告知","车内有告示牌/残留字条","前一个乘客留下的记录","无来源——主角只能自己摸索"],"x-uiWidget":"select","useForAI":true},"违规后果":{"type":"string","title":"违规后果","description":"违反各条规则的具体后果——最好根据违规程度有轻重之分。轻微违规可能只是引来注视，严重违规直接导致死亡或消失","x-uiWidget":"textarea","useForAI":true},"规则背后的逻辑":{"type":"string","title":"规则背后的逻辑","description":"这些规则为什么存在？是保护主角不被车上的实体注意？是维持某种契约？还是在测试主角？好的规则体系有内在一致性，不是随机设定","x-uiWidget":"textarea","useForAI":true},"下车条件":{"type":"string","title":"下车条件","description":"如何才能在终点前合法下车？是需要在特定站点下车？完成某个任务？支付某种代价？还是根本没有下车的方法——只有到达终点","x-uiWidget":"textarea","useForAI":true},"规则漏洞":{"type":"string","title":"规则漏洞","description":"规则的灰色地带——故事张力通常来自规则的边界，主角必须在不违规的前提下利用漏洞。设计1-2个可被利用的规则漏洞","x-uiWidget":"textarea","useForAI":true}}}',
  1.0,
  @method_id,
  1,
  1,
  0,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  json_schema = VALUES(json_schema),
  temperature = VALUES(temperature),
  updated_at = NOW();

-- 2.4 世界规则（setting, singleton, temp=1.0）
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  '世界规则',
  '末班车运行的世界维度、阴阳两界的分界逻辑与"非人乘客"的来源——这辆车为什么存在',
  '{"type":"object","required":["终点站性质","乘客来源"],"properties":{"终点站性质":{"type":"string","title":"终点站性质","enum":["冥界/黄泉（传统东方鬼界）","虚空（无处可去的终结）","过去（时间断层）","平行时空（另一个现实）","某种实体的居所","不可描述之处（刻意留白）"],"x-uiWidget":"select","useForAI":true},"末班车的存在原因":{"type":"string","title":"末班车的存在原因","description":"这辆车为什么会在每天深夜出现？是冥界的摆渡机制？是某个古老诅咒的延续？是某个实体维持的通道？或者根本没有人知道它为什么存在","x-uiWidget":"textarea","useForAI":true},"乘客来源":{"type":"string","title":"乘客来源","description":"车上的非人乘客是什么：执念未散的亡魂？以人形出现的阴间官吏？饥饿的存在在捕猎？还是某种规则本身的具现化","x-uiWidget":"textarea","useForAI":true},"主角卷入原因":{"type":"string","title":"主角卷入原因","description":"普通人无法看到或上这辆车——主角为什么能上来？是特殊体质（阴阳眼/未了心愿/死里逃生留下的生死界印记）？还是完全随机的厄运","x-uiWidget":"textarea","useForAI":true},"阴阳界规则":{"type":"string","title":"阴阳界规则","description":"在这趟车的行驶过程中，现实世界的规则如何变化：手机是否有信号？时间是否正常流逝？是否有人知道主角在哪里","x-uiWidget":"textarea","useForAI":true},"逃脱的先例":{"type":"string","title":"逃脱的先例","description":"历史上是否有人成功活着下车？如果有，他们怎么做到的？如果没有，主角是第一个——或者主角只是不知道","x-uiWidget":"textarea","useForAI":true}}}',
  1.0,
  @method_id,
  1,
  1,
  0,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  json_schema = VALUES(json_schema),
  temperature = VALUES(temperature),
  updated_at = NOW();

-- 2.5 文风设定（setting, singleton, temp=0.7）
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  '文风设定',
  '恐惧升级模式、叙事视角与规则流特有的信息管理风格',
  '{"type":"object","required":["叙事视角","恐惧升级模式"],"properties":{"叙事视角":{"type":"string","title":"叙事视角","enum":["第一人称（最强代入感，主角的内心恐惧直接传递）","第三人称限知（贴近主角，但有一点观察距离）","第二人称（实验性，让读者直接成为主角——高风险高回报）"],"x-uiWidget":"radio","useForAI":true},"恐惧升级模式":{"type":"string","title":"恐惧升级模式","enum":["渐进式（每一站越来越诡异，线性升级）","脉冲式（平静—突发恐惧—平静—更强的突发）","倒数式（明确告知还有几站，每站都是倒计时）","规则崩塌式（规则本身开始失效或变化，不确定性升级）"],"x-uiWidget":"select","useForAI":true},"氛围风格":{"type":"string","title":"氛围风格","enum":["克制冷静（描述异常但不渲染，反差制造恐惧）","沉浸压抑（大量感官细节，读者在恐惧中窒息）","荒诞诡谲（规则本身有荒诞逻辑，黑色幽默底色）","孤独绝望（强调主角的孤立无援，存在主义恐惧）"],"x-uiWidget":"select","useForAI":true},"规则呈现方式":{"type":"string","title":"规则呈现方式","enum":["一次性全部告知（营造规则的完整感，但初始信息量大）","逐步揭示（每当面临危险才发现新规则，悬念更强）","主角自行摸索（最高张力，但需要设计合理的发现过程）"],"x-uiWidget":"radio","useForAI":true},"禁用词语":{"type":"string","title":"禁用词语","description":"写作中应避免的词汇或句式","x-uiWidget":"textarea","useForAI":true}}}',
  0.7,
  @method_id,
  1,
  1,
  0,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  json_schema = VALUES(json_schema),
  temperature = VALUES(temperature),
  updated_at = NOW();

-- 2.6 乘客（character, 非singleton, temp=1.0）
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  '乘客',
  '车上的人类乘客、边缘状态的灰色存在与越来越显形的非人实体',
  '{"type":"object","x-titleField":"称谓","required":["称谓","乘客类型"],"properties":{"称谓":{"type":"string","title":"称谓","description":"这个乘客的名字或主角对他的称呼方式（不知道名字时可以是「穿红衣的女人」「第三排的老人」等）","useForAI":true},"乘客类型":{"type":"string","title":"乘客类型","enum":["普通人（和主角一样误上了车）","边缘状态（还没完全死/还没完全活着）","规则守护者（维持车上秩序的存在）","索命者（以乘客形态出现的危险实体）","司机（车的运行者与规则的执行者）","其他"],"x-uiWidget":"radio","useForAI":true},"外表特征":{"type":"string","title":"外表特征","description":"这个乘客的外貌。对非人存在：他们的人形有什么细节不对劲（关节方向错误、呼吸声不在胸口、反光不正确）","x-uiWidget":"textarea","useForAI":true},"行为特征":{"type":"string","title":"行为特征","description":"这个乘客的行为模式——他在做什么，他如何对规则有反应，他是否意识到主角在观察他","x-uiWidget":"textarea","useForAI":true},"人形完整度":{"type":"string","title":"人形完整度","enum":["完整（初看完全像人）","轻微破绽（偶尔的细节不对）","明显异常（需要刻意不去看才能维持正常感）","几乎不像人（只保留了最基础的人形轮廓）","完全非人（停止伪装）"],"x-uiWidget":"select","useForAI":true},"对主角的态度":{"type":"string","title":"对主角的态度","description":"这个存在是否知道主角是活人？它对主角是漠然、好奇、警惕还是……饥渴","x-uiWidget":"textarea","useForAI":true},"秘密":{"type":"string","title":"秘密","description":"这个乘客隐藏的信息——可能是它的真实身份，可能是它与规则体系的关系，也可能是某个关键线索","x-uiWidget":"textarea","useForAI":true},"当前动态":{"type":"string","title":"当前动态","description":"这个乘客目前在做什么，以及它的人形是否在发生变化","isDynamic":true}}}',
  1.0,
  @method_id,
  1,
  0,
  0,
  'character',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  json_schema = VALUES(json_schema),
  temperature = VALUES(temperature),
  updated_at = NOW();

-- 2.7 途经站点（scene, 非singleton, temp=1.0）
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  '途经站点',
  '末班车沿途的诡异站点——每一站都是恐惧升级的节点，也是主角理解规则的机会',
  '{"type":"object","x-titleField":"站名","required":["站名","站点类型"],"properties":{"站名":{"type":"string","title":"站名","description":"这个站的名字——可以是现实中存在的站名，也可以是主角认不出的诡异名字","useForAI":true},"站点类型":{"type":"string","title":"站点类型","enum":["正常站（现实世界的真实站点）","变形站（现实站点的扭曲版本）","废弃站（早已停用的站点）","不存在的站（路线表上没有这一站）","终点站（这趟车的最终目的地）","折返站（如果主角能在这里下车…）"],"x-uiWidget":"select","useForAI":true},"站外景象":{"type":"string","title":"站外景象","description":"窗外看到的景象——是现实城市的荒凉夜景？空无一人的旷野？还是完全陌生的、不属于任何地方的地形","x-uiWidget":"textarea","useForAI":true},"上下车情况":{"type":"string","title":"上下车情况","description":"在这一站上来了什么、下去了什么——每一站的上下车是恐惧升级的关键节点","x-uiWidget":"textarea","useForAI":true},"规则变化":{"type":"string","title":"规则变化","description":"到达这一站后规则是否有变化（新规则生效、旧规则失效，或者发现之前的理解是错的）","x-uiWidget":"textarea","useForAI":true},"危险等级":{"type":"string","title":"危险等级","enum":["平静（几乎与普通站相同）","轻度异常（有不对劲但尚可控制）","高度危险（主角必须非常小心）","致命（一旦出错直接失命）"],"x-uiWidget":"radio","useForAI":true},"关键线索":{"type":"string","title":"关键线索","description":"这一站是否藏有帮助主角理解规则或找到出路的线索","x-uiWidget":"textarea","useForAI":true},"当前状态":{"type":"string","title":"当前状态","description":"是否已经过站，以及过站后车内发生了什么变化","isDynamic":true}}}',
  1.0,
  @method_id,
  1,
  0,
  0,
  'scene',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  json_schema = VALUES(json_schema),
  temperature = VALUES(temperature),
  updated_at = NOW();

-- 2.8 关键道具（prop, 非singleton, temp=0.7）
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  '关键道具',
  '帮助主角在末班车上生存、理解规则或找到出路的关键物品',
  '{"type":"object","x-titleField":"道具名称","required":["道具名称","道具类型"],"properties":{"道具名称":{"type":"string","title":"道具名称","useForAI":true},"道具类型":{"type":"string","title":"道具类型","enum":["护身符（提供某种保护）","凭证（证明某种身份或权利）","通行钥匙（打开特定区域或权限）","信息载体（记录了前人的经历或规则）","感知工具（帮助主角察觉危险）","代价物品（需要为其功能付出某种代价）","其他"],"x-uiWidget":"select","useForAI":true},"外观":{"type":"string","title":"外观","description":"道具的外形——越普通越有颠覆感。一张旧车票、一根发卡、一本皱巴巴的笔记本……表面越普通，功能越出乎意料","x-uiWidget":"textarea","useForAI":true},"功能":{"type":"string","title":"功能","description":"这个道具能做什么——具体、有边界的能力比模糊的「保护」更有叙事价值","x-uiWidget":"textarea","useForAI":true},"获取方式":{"type":"string","title":"获取方式","description":"主角如何得到这个道具：上车前就有、车上找到、某个乘客给的、还是用某种代价换来的","x-uiWidget":"textarea","useForAI":true},"使用限制":{"type":"string","title":"使用限制","description":"道具的限制条件或副作用——没有代价的道具是无趣的。使用次数限制？需要特定条件才能激活？每次使用都有消耗","x-uiWidget":"textarea","useForAI":true},"当前状态":{"type":"string","title":"当前状态","description":"道具目前的状态——完好/已损坏/已使用/已消失","isDynamic":true}}}',
  0.7,
  @method_id,
  1,
  0,
  0,
  'prop',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  json_schema = VALUES(json_schema),
  temperature = VALUES(temperature),
  updated_at = NOW();
