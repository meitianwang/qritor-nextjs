-- 惊悚公车小说创作方法初始化
-- 无限流「公车载体」亚类型——公车是连接现实与惊悚游戏世界的唯一通道
-- 包含：创作方法 + 8 个模块类型
-- 执行方式 / Usage: mysql -u <user> -p <database> < init_jingsong_bus.sql

-- ============================================================
-- 1. 创建创作方法
-- ============================================================

INSERT INTO novel_creation_method (name_zh, name_en, description_zh, novel_type_zh, novel_type_en, language, visible_categories, created_at)
VALUES (
  '惊悚公车小说',
  'Horror Bus Novel',
  '无限流惊悚游戏的「公车载体」亚类型。公车是连接现实世界与惊悚游戏世界的唯一通道——车上所有乘客都是被选中的玩家，在这个移动的封闭空间内完成第一轮生存淘汰。核心看点：有限空间内的信任与背叛博弈、新手与老玩家的信息差生死局、公车规则的层层揭露，以及通关后进入更广阔惊悚世界的无限可能。',
  '悬疑灵异',
  'Supernatural Mystery',
  'zh',
  '["setting","character","scene","prop"]',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  novel_type_zh = VALUES(novel_type_zh),
  visible_categories = VALUES(visible_categories),
  updated_at = NOW();

SET @method_id = (SELECT id FROM novel_creation_method WHERE name_zh = '惊悚公车小说' LIMIT 1);

-- ============================================================
-- 2. 创建模块类型（8 个）
-- ============================================================

-- 2.1 游戏系统设定（setting，单例）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '游戏世界',
  'Game World',
  '定义整个惊悚游戏世界的核心框架——公车是新手村，通关后是什么样的世界',
  '{"type":"object","required":["系统名称","公车在系统中的定位"],"properties":{"系统名称":{"type":"string","title":"系统名称","description":"整个惊悚游戏系统的名称（如「末日班车」「终点站游戏」「亡灵专线」）","useForAI":true},"系统类型":{"type":"string","title":"系统类型","enum":["生存竞技型（最终只有少数人活下来）","任务通关型（完成任务即可晋级）","积分排名型（积分决定一切）","隐藏真相型（规则背后有更深的秘密）"],"x-uiWidget":"select","useForAI":true},"公车在系统中的定位":{"type":"string","title":"公车在系统中的定位","enum":["新手村（所有玩家的第一关）","转场通道（关卡之间的过渡空间）","周期性重置（每轮游戏都从公车开始）","特殊副本（只有部分玩家才会经历）"],"x-uiWidget":"select","useForAI":true},"公车之后的世界":{"type":"string","title":"公车之后的世界","description":"通关公车后，玩家进入什么样的惊悚世界——是否有大本营/安全屋、副本大厅、玩家社区等","x-uiWidget":"textarea","useForAI":true},"进入机制":{"type":"string","title":"进入机制","description":"玩家如何被选中上车——随机抽取、死亡触发、签订契约、被人推荐","x-uiWidget":"textarea","useForAI":true},"等级积分体系":{"type":"string","title":"等级积分体系","description":"玩家的成长体系——从公车起算的等级划分、升级方式、等级特权","x-uiWidget":"textarea","useForAI":true},"死亡惩罚":{"type":"string","title":"死亡惩罚","enum":["车上死亡即永死（现实中也消失）","死亡降级重置积分","死亡后灵魂滞留公车变成NPC","可以复活但有沉重代价"],"x-uiWidget":"select","useForAI":true},"系统人格":{"type":"string","title":"系统人格","enum":["冷漠机械（纯粹执行规则）","恶意幽默（享受玩家的恐慌）","中立公正（严格但不偏袒）","隐藏善意（表面冷酷实则有引导）","捉摸不透（行为逻辑让人摸不清）"],"x-uiWidget":"select","useForAI":true},"系统宣告方式":{"type":"string","title":"系统宣告方式","description":"系统如何告知玩家规则——广播、屏幕、脑内声音、信封","x-uiWidget":"textarea","useForAI":true},"系统背后的秘密":{"type":"string","title":"系统背后的秘密","description":"这个游戏系统究竟是谁创造的、为什么创造——主线大谜团","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id,
  1,
  1,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  updated_at = NOW();

-- 2.2 公车规则（setting，单例）★核心模块★
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '公车规则',
  'Bus Rules',
  '★核心模块★ 定义公车这个封闭空间的一切规则——载客规则、淘汰机制、车厢禁令、下车条件',
  '{"type":"object","required":["公车编号","载客人数","淘汰机制","下车条件"],"properties":{"公车编号":{"type":"string","title":"公车编号/路线","description":"公车的路线号或名称，通常包含暗示意味（如X13路、0路、末班车）","useForAI":true},"公车外形":{"type":"string","title":"公车外形","description":"公车的外观特征——是否与普通公车相同？颜色、新旧程度、特殊标记","x-uiWidget":"textarea","useForAI":true},"载客人数":{"type":"string","title":"初始载客人数","description":"每次公车游戏开始时车上有多少名玩家，是否有固定数量","useForAI":true},"乘客构成":{"type":"string","title":"乘客构成","description":"车上乘客的构成比例——新手玩家与老玩家的比例，是否有伪装成玩家的NPC","x-uiWidget":"textarea","useForAI":true},"司机设定":{"type":"string","title":"司机设定","description":"司机是谁或是什么——人类NPC、系统傀儡、根本没有司机、驾驶位被封锁","x-uiWidget":"textarea","useForAI":true},"淘汰机制":{"type":"string","title":"淘汰机制","enum":["定额存活（只有N人能下车）","定时淘汰（每隔X分钟死一人）","任务淘汰（不完成任务者被处决）","互相投票淘汰（多数决）","强者通吃（最终只有第一名能下车）","规则触发淘汰（触犯禁令即死）"],"x-uiWidget":"select","useForAI":true},"淘汰细节":{"type":"string","title":"淘汰细节","description":"淘汰的具体执行方式——是突然消失、当场死亡、还是被某种机制处决","x-uiWidget":"textarea","useForAI":true},"车厢禁令":{"type":"string","title":"车厢禁令","description":"在公车上绝对不能做的事——触犯即触发惩罚，越具体越好","x-uiWidget":"textarea","useForAI":true},"车厢特殊设施":{"type":"string","title":"车厢特殊设施","description":"车厢内除了座椅还有什么——屏幕、广播、特殊区域、隐藏舱门","x-uiWidget":"textarea","useForAI":true},"公车运行规则":{"type":"string","title":"公车运行规则","description":"公车如何运行——方向是否固定、是否有站点、速度、时间限制、能否停车","x-uiWidget":"textarea","useForAI":true},"与现实世界的关系":{"type":"string","title":"与现实世界的关系","description":"这辆公车在现实中是什么状态——现实中的人能否看见它、它是否真实行驶在公路上","x-uiWidget":"textarea","useForAI":true},"下车条件":{"type":"string","title":"下车条件","description":"什么情况下玩家才能正常下车进入游戏大厅——活到最后/完成任务/达到积分","x-uiWidget":"textarea","useForAI":true},"隐藏规则":{"type":"string","title":"隐藏规则","description":"系统没有明说、玩家需要自己发现的隐藏规则——可能救命也可能是陷阱","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id,
  1,
  1,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  updated_at = NOW();

-- 2.3 主角档案（setting，单例）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '核心设定',
  'Core Premise',
  '定义主角的核心设定——上车前的身份背景、核心能力、在公车上的初始处境',
  '{"type":"object","required":["姓名","性格特质","核心动机"],"properties":{"姓名":{"type":"string","title":"姓名","useForAI":true},"上车前的身份":{"type":"string","title":"上车前的身份","description":"主角在现实世界的职业/身份——这往往决定了他在公车上的初始优势或劣势","x-uiWidget":"textarea","useForAI":true},"性格特质":{"type":"string","title":"性格特质","enum":["冷静算计型（第一时间分析规则和人心）","冲动热血型（先救人再说，有勇无谋到有勇有谋）","腹黑隐藏型（表面怂货实则最危险）","疯批享受型（把这当成游戏来玩，越乱越开心）","普通人觉醒型（从茫然到成长的最标准路线）"],"x-uiWidget":"select","useForAI":true},"核心能力":{"type":"string","title":"核心能力","description":"主角最核心的一项能力——不一定是战斗力，可以是推理、人心洞察、记忆力等","x-uiWidget":"textarea","useForAI":true},"初始状态":{"type":"string","title":"初始状态","description":"上车时的初始资源——身上带了什么、认识车上的哪些人、有没有特殊信息","x-uiWidget":"textarea","useForAI":true},"是否知情":{"type":"string","title":"上车前是否知情","enum":["完全不知道（正常坐公车被拉入）","有模糊预感但不确定","被别人提前告知过但未完全相信","自己主动寻找并上车（老玩家）"],"x-uiWidget":"select","useForAI":true},"核心动机":{"type":"string","title":"核心动机","enum":["在公车上找到某个人","求生——不在乎规则只想下车","搞清楚这是什么——探索真相驱动","变强——把这当成机遇","保护某个同车的人"],"x-uiWidget":"select","useForAI":true},"核心动机详情":{"type":"string","title":"核心动机详情","description":"核心动机的详细背景","x-uiWidget":"textarea","useForAI":true},"成长路线":{"type":"string","title":"成长路线","description":"从公车到之后的副本，主角如何成长——能力方向和关键转折点","x-uiWidget":"textarea","useForAI":true},"背景秘密":{"type":"string","title":"背景秘密","description":"主角不为人知或自己也不清楚的秘密——与系统或公车有特殊关联","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id,
  1,
  1,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  updated_at = NOW();

-- 2.4 故事钩子（setting，单例）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '公车钩子',
  'Bus Hook',
  '定义贯穿全书的核心悬念——公车背后的秘密、主角与系统的隐藏关联、跨副本的主线伏笔',
  '{"type":"object","required":["核心悬念","开篇钩子"],"properties":{"核心悬念":{"type":"string","title":"核心悬念","description":"贯穿全书的最大谜团——公车究竟是什么？游戏的终点是什么？谁在操控这一切？","x-uiWidget":"textarea","useForAI":true},"开篇钩子":{"type":"string","title":"开篇钩子","description":"第一章让读者停不下来的悬念点——公车上第一件让所有人意识到「不对劲」的事","x-uiWidget":"textarea","useForAI":true},"公车的隐藏秘密":{"type":"string","title":"公车的隐藏秘密","description":"公车作为特殊载体，它本身有什么秘密——它的历史、它为什么存在、它和系统的关系","x-uiWidget":"textarea","useForAI":true},"主角与系统的关联":{"type":"string","title":"主角与系统的隐藏关联","description":"主角为什么被选中——是随机还是特意，有没有隐藏的命运关联","x-uiWidget":"textarea","useForAI":true},"情感钩子":{"type":"string","title":"情感钩子","description":"让读者产生情感共鸣的核心要素——公车上哪段关系最让读者揪心","x-uiWidget":"textarea","useForAI":true},"主线伏笔":{"type":"string","title":"主线伏笔布局","description":"从公车开始埋下的主线伏笔——哪些细节在后期会成为关键","x-uiWidget":"textarea","useForAI":true},"终极目标":{"type":"string","title":"主角的终极目标","description":"主角最终想要实现什么——逃离系统、找到某人、揭露真相、还是毁灭游戏","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id,
  1,
  1,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  updated_at = NOW();

-- 2.5 文风设定（setting，单例）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '文风与叙事',
  'Writing Style',
  '定义写作风格——密室博弈感的叙事方式、人物内心独白风格、节奏把控',
  '{"type":"object","required":["叙事视角","恐怖氛围浓度"],"properties":{"叙事视角":{"type":"string","title":"叙事视角","enum":["第一人称（深度代入主角）","第三人称限知（聚焦主角视角）","第三人称全知（可切换多人视角）","双线叙事（公车内+公车外现实并行）"],"x-uiWidget":"radio","useForAI":true},"恐怖氛围浓度":{"type":"string","title":"恐怖氛围浓度","enum":["重度惊悚（真实恐惧感，不是爽文）","中度紧张（惊悚+策略+爽感并重）","轻度悬疑（以人际博弈和推理为主）","黑色幽默（用喜剧稀释恐惧，反差萌）"],"x-uiWidget":"select","useForAI":true},"主角内心风格":{"type":"string","title":"主角内心独白风格","enum":["冷静分析型（像做数学题一样拆解规则）","幽默吐槽型（高压下的黑色幽默）","情绪外化型（恐惧和愤怒直接写出来）","信息流型（快速接收处理大量信息）"],"x-uiWidget":"select","useForAI":true},"空间叙事风格":{"type":"string","title":"封闭空间叙事风格","description":"如何写出公车这个密室的压迫感——座位布局的意义、窗外景色的运用、空气和气味的描写","x-uiWidget":"textarea","useForAI":true},"节奏把控":{"type":"string","title":"节奏把控","enum":["高度紧张（每章都有生死危机）","张弛有度（危机+人物刻画交替）","慢热渐进（前期重点在人物关系，后期爆发）"],"x-uiWidget":"select","useForAI":true},"语言风格":{"type":"string","title":"语言风格","description":"具体的语言风格——口语化/书面化、是否有大量内心独白、对话风格","x-uiWidget":"textarea","useForAI":true},"禁忌写法":{"type":"string","title":"禁忌写法","description":"这类型小说必须避免的写法——过度用巧合解题、人物行为逻辑不自洽等","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id,
  1,
  1,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  updated_at = NOW();

-- 2.6 角色（character，非单例）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '角色',
  'Character',
  '公车上的其他乘客/玩家——新手、老玩家、伪装者、司机，每个人都可能是助力也可能是威胁',
  '{"type":"object","required":["姓名","角色类型","与主角关系"],"x-titleField":"姓名","properties":{"姓名":{"type":"string","title":"姓名","useForAI":true},"角色类型":{"type":"string","title":"角色类型","enum":["新手玩家（第一次上车）","老玩家（上过多次车的幸存者）","隐藏身份（表面是玩家实则是NPC或内奸）","司机或系统代理人","公车外的观察者（通过某种方式与车内互动）"],"x-uiWidget":"select","useForAI":true},"角色定位":{"type":"string","title":"叙事定位","enum":["可靠盟友","表面盟友暗藏刀","信息提供者（知道关键规则）","博弈对手","牺牲品（为剧情服务的工具人）","意外变量（打乱所有人预期的角色）"],"x-uiWidget":"select","useForAI":true},"性别":{"type":"string","title":"性别","enum":["男","女","不明"],"x-uiWidget":"radio","useForAI":true},"上车前的身份":{"type":"string","title":"上车前的身份","description":"现实世界的职业或身份——决定了他在公车上能提供什么价值","useForAI":true},"核心能力或价值":{"type":"string","title":"核心能力或价值","description":"这个角色在公车博弈中的独特价值——体力、智慧、信息、人脉","x-uiWidget":"textarea","useForAI":true},"与主角关系":{"type":"string","title":"与主角的关系","description":"与主角的互动关系——如何相识、信任程度、利益关联","x-uiWidget":"textarea","useForAI":true},"隐藏真相":{"type":"string","title":"隐藏真相","description":"这个角色背后不为人知的真相——身份、目的、与系统的关联","x-uiWidget":"textarea","useForAI":true},"生存状态":{"type":"string","title":"生存状态","description":"角色在故事各阶段的生存状态","isDynamic":true}}}',
  @method_id,
  1,
  0,
  'character',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  updated_at = NOW();

-- 2.7 副本（scene，非单例）——公车之后的游戏世界
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '游戏场景',
  'Instance Scene',
  '通关公车后进入的各类惊悚游戏副本——每个副本是一个独立的恐怖世界',
  '{"type":"object","required":["副本名称","恐怖主题","难度等级"],"x-titleField":"副本名称","properties":{"副本名称":{"type":"string","title":"副本名称","useForAI":true},"恐怖主题":{"type":"string","title":"恐怖主题","enum":["密室困局（封闭空间博弈延续）","诡异村庄（规则型民俗恐怖）","废弃建筑（探索+怪物追杀）","精神病院（心理恐怖+真相颠覆）","末日废土（生存资源争夺）","异度空间（物理法则扭曲）","社会实验（人性博弈放大镜）","其他"],"x-uiWidget":"select","useForAI":true},"难度等级":{"type":"string","title":"难度等级","enum":["新手级（C级）","普通级（B级）","困难级（A级）","噩梦级（S级）","地狱级（SS级）"],"x-uiWidget":"select","useForAI":true},"与公车的关联":{"type":"string","title":"与公车的关联","description":"这个副本与公车初始经历有何关联——公车上的某个人出现在这里？公车埋下的伏笔在这里揭晓？","x-uiWidget":"textarea","useForAI":true},"副本规则":{"type":"string","title":"核心规则","description":"该副本特有的规则——「不能做X」「每X小时Y」「达到条件Z即通关」","x-uiWidget":"textarea","useForAI":true},"环境描述":{"type":"string","title":"环境描述","description":"副本的整体氛围和关键地点","x-uiWidget":"textarea","useForAI":true},"核心谜题":{"type":"string","title":"核心谜题","description":"通关的核心解谜要素","x-uiWidget":"textarea","useForAI":true},"主要威胁":{"type":"string","title":"主要威胁","description":"副本中的主要恐怖存在——外形、能力、弱点、行为逻辑","x-uiWidget":"textarea","useForAI":true},"通关条件":{"type":"string","title":"通关条件","description":"具体的通关条件","x-uiWidget":"textarea","useForAI":true},"通关奖励":{"type":"string","title":"通关奖励","description":"通关后的奖励","x-uiWidget":"textarea","useForAI":true},"当前进度":{"type":"string","title":"当前探索进度","description":"主角团目前在副本内的进展","isDynamic":true}}}',
  @method_id,
  1,
  0,
  'scene',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  updated_at = NOW();

-- 2.8 道具/技能（prop，非单例）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '求生道具',
  'Survival Item',
  '游戏系统中的道具和技能——公车上能捡到或兑换的物品、通关奖励的能力',
  '{"type":"object","required":["名称","类型","稀有度"],"x-titleField":"名称","properties":{"名称":{"type":"string","title":"名称","useForAI":true},"类型":{"type":"string","title":"类型","enum":["信息类（提前获知规则或线索）","防护类（降低伤害或避免惩罚）","攻击类（对付怪物或其他玩家）","辅助类（帮助队友或干扰敌人）","探索类（发现隐藏内容）","消耗品（一次性使用）","被动技能（持续生效的能力）","主动技能（需要触发的特殊能力）"],"x-uiWidget":"select","useForAI":true},"稀有度":{"type":"string","title":"稀有度","enum":["普通（白）","稀有（蓝）","史诗（紫）","传说（橙）","公车限定（只能在公车上获取）"],"x-uiWidget":"select","useForAI":true},"效果描述":{"type":"string","title":"效果描述","description":"道具或技能的具体效果","x-uiWidget":"textarea","useForAI":true},"获取方式":{"type":"string","title":"获取方式","enum":["公车内发现（座位下/夹层中）","系统商店兑换","副本通关奖励","与特定角色交易","触发隐藏条件获得","初始随机分配"],"x-uiWidget":"select","useForAI":true},"使用限制":{"type":"string","title":"使用限制","description":"使用次数、冷却时间、条件限制等","x-uiWidget":"textarea","useForAI":true},"副作用":{"type":"string","title":"副作用","description":"使用代价——没有免费的午餐","x-uiWidget":"textarea","useForAI":true},"当前状态":{"type":"string","title":"当前状态","description":"道具的当前可用状态","isDynamic":true}}}',
  @method_id,
  1,
  0,
  'prop',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  updated_at = NOW();
