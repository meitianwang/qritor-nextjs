-- 惊悚乐园小说创作方法初始化
-- 包含：创作方法 + 8 个模块类型
-- 执行方式 / Usage: mysql -u <user> -p <database> < init_jingsong_thriller.sql

-- 1. 创建创作方法
INSERT INTO novel_creation_method (name_zh, name_en, description_zh, novel_type_zh, novel_type_en, language, visible_categories, created_at)
VALUES (
  '惊悚乐园小说',
  'Thriller Park Novel',
  '主角被拉入独立恐怖副本进行生存竞赛的创作方法。融合游戏化系统、恐怖解谜、都市传说重构等元素，每个副本都是一个独立的恐怖世界，主角凭借高智商和游戏系统在各种恐怖场景中求生甚至反杀',
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

-- 获取创作方法 ID
SET @method_id = (SELECT id FROM novel_creation_method WHERE name_zh = '惊悚乐园小说' LIMIT 1);

-- 2. 创建模块类型

-- 2.1 游戏系统
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '游戏系统',
  'Worldbuilding',
  '定义控制一切的游戏/系统规则——积分、等级、惩罚、奖励、系统人格',
  '{"type":"object","x-titleField":"系统名称","properties":{"系统名称":{"type":"string","title":"系统名称","description":"游戏系统的名称（如「惊悚乐园」「噩梦空间」「死亡游戏」）","useForAI":true},"系统类型":{"type":"string","title":"系统类型","enum":["生存竞技型","任务通关型","自由探索型","积分排名型"],"x-uiWidget":"select","useForAI":true},"进入机制":{"type":"string","title":"进入机制","description":"玩家如何被拉入游戏系统（随机选中、濒死时触发、收到神秘邀请等）","format":"textarea","useForAI":true},"玩家等级体系":{"type":"string","title":"玩家等级体系","description":"等级划分、升级条件、等级特权","format":"textarea","x-rows":6,"useForAI":true},"积分货币系统":{"type":"string","title":"积分/货币系统","description":"积分获取方式、货币兑换机制、商店系统","format":"textarea","useForAI":true},"死亡惩罚":{"type":"string","title":"死亡惩罚","enum":["死亡即永死","死亡扣积分/降级","伤痛传递现实世界","死亡后可复活但有代价","视副本规则而定"],"x-uiWidget":"select","useForAI":true},"死亡惩罚详情":{"type":"string","title":"死亡惩罚详情","description":"死亡惩罚的具体规则和例外情况","format":"textarea","useForAI":true},"奖励机制":{"type":"string","title":"奖励机制","description":"通关奖励类型（积分、道具、技能点、称号等）","format":"textarea","useForAI":true},"系统人格":{"type":"string","title":"系统人格","description":"游戏系统本身的「人格」特征","enum":["冷漠机械（纯规则执行）","恶意玩弄（享受折磨玩家）","中立公正（严格但公平）","隐藏善意（表面冷酷实则有引导）","捉摸不透（行为逻辑未知）"],"x-uiWidget":"select","useForAI":true},"系统人格详情":{"type":"string","title":"系统人格详情","description":"系统人格的具体表现方式","format":"textarea","useForAI":true},"其他规则":{"type":"string","title":"其他规则","description":"补充的系统规则","format":"textarea","useForAI":true}},"required":["系统名称","系统类型","死亡惩罚"]}',
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

-- 2.2 主角档案
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '主角档案',
  'Protagonist Concept',
  '定义主角的核心设定——对恐怖的态度、核心能力、成长路线、进入游戏的方式',
  '{"type":"object","x-titleField":"姓名","properties":{"姓名":{"type":"string","title":"姓名","useForAI":true},"进入方式":{"type":"string","title":"进入方式","enum":["意外死亡后被选中","签订契约","被强制拉入","主动申请加入","继承前任资格","其他"],"x-uiWidget":"select","useForAI":true},"进入方式详情":{"type":"string","title":"进入方式详情","description":"进入游戏的具体经过","format":"textarea","useForAI":true},"性格特质":{"type":"string","title":"性格特质","enum":["冷静理智型","疯批无畏型","腹黑算计型","表面正常内心疯狂","乐观幽默型"],"x-uiWidget":"select","useForAI":true},"核心能力":{"type":"string","title":"核心能力","enum":["超强推理能力","极限身体素质","心理操控/读心","灵异感知","博闻强记（百科全书式知识）","特殊技能","其他"],"x-uiWidget":"select","useForAI":true},"核心能力详情":{"type":"string","title":"核心能力详情","description":"核心能力的具体表现和限制","format":"textarea","useForAI":true},"对恐怖的态度":{"type":"string","title":"对恐怖的态度","enum":["毫不畏惧甚至享受","理性分析冷静应对","恐惧但强撑求生","玩弄恐怖于股掌"],"x-uiWidget":"select","useForAI":true},"初始状态":{"type":"string","title":"初始状态","description":"进入游戏时的初始能力、装备、知识储备","format":"textarea","useForAI":true},"成长路线":{"type":"string","title":"成长路线","description":"主角的能力成长方向和方式","format":"textarea","useForAI":true},"背景故事":{"type":"string","title":"背景故事","description":"进入游戏前的身份和经历","format":"textarea","useForAI":true},"核心动机":{"type":"string","title":"核心动机","enum":["求生逃离游戏","探寻系统背后的真相","变强称霸排行榜","拯救被困的人","享受恐怖刺激","其他"],"x-uiWidget":"select","useForAI":true},"核心动机详情":{"type":"string","title":"核心动机详情","description":"核心动机的详细描述","format":"textarea","useForAI":true}},"required":["姓名","性格特质","核心能力","对恐怖的态度"]}',
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

-- 2.3 副本机制
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '副本机制',
  'Instance Rules',
  '定义副本层面的通用规则——通关条件、组队机制、难度分级、NPC规则',
  '{"type":"object","x-titleField":"副本生成方式","properties":{"副本生成方式":{"type":"string","title":"副本生成方式","enum":["系统随机分配","玩家选择","难度递进（逐步升级）","主线剧情触发"],"x-uiWidget":"select","useForAI":true},"时间限制":{"type":"string","title":"时间限制","enum":["有固定时间限制","无时间限制","视副本而定","时间限制递减（越来越紧迫）"],"x-uiWidget":"select","useForAI":true},"通关条件类型":{"type":"string","title":"通关条件类型","enum":["完成指定任务","存活到时间结束","解开核心谜题","击败Boss","多条件混合"],"x-uiWidget":"select","useForAI":true},"失败后果":{"type":"string","title":"失败后果","description":"副本失败（未通关）的后果","format":"textarea","useForAI":true},"组队机制":{"type":"string","title":"组队机制","enum":["纯单人","固定队伍","随机匹配","可单可组","强制多人"],"x-uiWidget":"select","useForAI":true},"副本间关联":{"type":"string","title":"副本间关联","enum":["完全独立（每个副本无关联）","有主线串联（副本暗含主线线索）","偶尔关联（部分副本有联系）","递进式（后面的副本承接前面）"],"x-uiWidget":"select","useForAI":true},"副本间关联详情":{"type":"string","title":"副本间关联详情","description":"副本之间如何串联的具体设计","format":"textarea","useForAI":true},"难度分级":{"type":"string","title":"难度分级","description":"副本的难度等级体系和对应的奖励/风险","format":"textarea","x-rows":6,"useForAI":true},"NPC规则":{"type":"string","title":"NPC规则","description":"副本内NPC的行为规则（是否可交互、是否可杀、是否有隐藏身份等）","format":"textarea","useForAI":true},"隐藏机制":{"type":"string","title":"隐藏机制","description":"系统未明说的隐藏规则和彩蛋","format":"textarea","useForAI":true}},"required":["副本生成方式","通关条件类型","组队机制"]}',
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

-- 2.4 故事钩子
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '故事钩子',
  'Core Hook',
  '定义贯穿全书的核心悬念和吸引力——系统背后的秘密、主角的终极目标、跨副本伏笔',
  '{"type":"object","x-titleField":"核心悬念","properties":{"核心悬念":{"type":"string","title":"核心悬念","description":"贯穿全书的最大谜团（谁创造了这个系统？系统的终极目的是什么？）","format":"textarea","useForAI":true},"开篇钩子":{"type":"string","title":"开篇钩子","description":"第一章就要抓住读者的悬念点","format":"textarea","useForAI":true},"系统背后的秘密":{"type":"string","title":"系统背后的秘密","description":"游戏系统的真实来源和终极目的","format":"textarea","useForAI":true},"主角的终极目标":{"type":"string","title":"主角的终极目标","description":"主角最终要达成什么（逃离？成为管理者？揭露真相？毁灭系统？）","format":"textarea","useForAI":true},"情感钩子":{"type":"string","title":"情感钩子","description":"让读者产生情感共鸣的元素（队友的牺牲、与NPC的羁绊等）","format":"textarea","useForAI":true},"跨副本伏笔":{"type":"string","title":"跨副本伏笔","description":"跨越多个副本的伏笔线索（暗示系统真相、主角身世等）","format":"textarea","useForAI":true}},"required":["核心悬念"]}',
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

-- 2.5 文风设定
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '文风设定',
  'Narrative Style',
  '定义写作风格——恐怖氛围浓度、主角内心独白风格、节奏把控',
  '{"type":"object","x-titleField":"叙事视角","properties":{"叙事视角":{"type":"string","title":"叙事视角","enum":["第一人称","第三人称限知","第三人称全知","多视角切换"],"x-uiWidget":"radio","useForAI":true},"恐怖氛围浓度":{"type":"string","title":"恐怖氛围浓度","enum":["重度恐怖（真正吓人）","中度恐怖（紧张刺激）","轻度恐怖（悬疑为主）","恐怖喜剧（搞笑与恐怖并存）"],"x-uiWidget":"select","useForAI":true},"主角内心风格":{"type":"string","title":"主角内心风格","description":"主角面对恐怖时的内心独白风格（惊悚乐园类小说的核心特色）","enum":["冷静吐槽型（理性分析+吐槽）","理性推演型（像侦探一样推理）","疯批语录型（反向恐吓鬼怪）","嘴炮解说型（给恐怖场面配解说）"],"x-uiWidget":"select","useForAI":true},"节奏把控":{"type":"string","title":"节奏把控","enum":["快节奏高密度（副本切换快）","张弛有度（副本内紧张+间章休整）","慢热渐入佳境（前期铺垫较多）"],"x-uiWidget":"select","useForAI":true},"语言风格":{"type":"string","title":"语言风格","description":"具体的语言风格描述","format":"textarea","useForAI":true},"参考作品":{"type":"string","title":"参考作品","description":"文风参考的已有作品（可选）","useForAI":true}},"required":["叙事视角","恐怖氛围浓度"]}',
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

-- 2.6 角色
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '角色',
  'Character',
  '创建其他玩家、副本NPC、系统NPC、Boss等角色',
  '{"type":"object","x-titleField":"姓名","properties":{"姓名":{"type":"string","title":"姓名","useForAI":true},"角色类型":{"type":"string","title":"角色类型","enum":["其他玩家","副本NPC","系统NPC","Boss级存在","神秘人物"],"x-uiWidget":"select","useForAI":true},"角色定位":{"type":"string","title":"角色定位","enum":["可靠盟友","竞争对手","导师/前辈","炮灰/牺牲品","反派/背叛者","隐藏Boss","线索人物"],"x-uiWidget":"select","useForAI":true},"性别":{"type":"string","title":"性别","enum":["男","女","不明/其他"],"x-uiWidget":"radio","useForAI":true},"外貌特征":{"type":"string","title":"外貌特征","format":"textarea","useForAI":true},"性格特点":{"type":"string","title":"性格特点","format":"textarea","useForAI":true},"特殊能力":{"type":"string","title":"特殊能力","description":"该角色拥有的特殊能力或专长","format":"textarea","useForAI":true},"与主角关系":{"type":"string","title":"与主角关系","description":"与主角的关系及互动方式","format":"textarea","useForAI":true},"生存状态":{"type":"string","title":"生存状态","enum":["存活","已死亡","下落不明","反复出现（死而复生）"],"x-uiWidget":"select","useForAI":true},"背景故事":{"type":"string","title":"背景故事","format":"textarea","useForAI":true},"隐藏秘密":{"type":"string","title":"隐藏秘密","description":"该角色隐藏的秘密或不为人知的一面","format":"textarea","useForAI":true}},"required":["姓名","角色类型","角色定位"]}',
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

-- 2.7 副本
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '副本',
  'Instance Scene',
  '创建独立的恐怖副本——每个副本是一个独立的恐怖世界，包含主题、规则、谜题、怪物、线索',
  '{"type":"object","x-titleField":"副本名称","properties":{"副本名称":{"type":"string","title":"副本名称","useForAI":true},"恐怖主题":{"type":"string","title":"恐怖主题","enum":["鬼屋凶宅","都市传说","密室逃脱","诡异村庄","精神病院","废弃学校","灵异医院","恐怖电影重构","民间传说","末日求生","异度空间","其他"],"x-uiWidget":"select","useForAI":true},"恐怖主题详情":{"type":"string","title":"恐怖主题详情","description":"恐怖主题为「其他」时填写，或补充主题的独特之处","format":"textarea","useForAI":true},"难度等级":{"type":"string","title":"难度等级","enum":["新手级","普通级","困难级","噩梦级","地狱级"],"x-uiWidget":"select","useForAI":true},"环境描述":{"type":"string","title":"环境描述","description":"副本的整体环境和氛围描写","format":"textarea","x-rows":6,"useForAI":true},"副本规则":{"type":"string","title":"副本规则","description":"该副本的特殊规则（如「不能说出死者名字」「镜子里的影像会攻击你」等）","format":"textarea","x-rows":6,"useForAI":true},"任务目标":{"type":"string","title":"任务目标","description":"需要完成什么才能通关","format":"textarea","useForAI":true},"核心谜题":{"type":"string","title":"核心谜题","description":"副本中的核心谜题/解谜要素","format":"textarea","x-rows":6,"useForAI":true},"恐怖元素":{"type":"string","title":"恐怖元素","description":"副本中制造恐怖感的核心元素","format":"textarea","useForAI":true},"关键怪物或鬼怪":{"type":"string","title":"关键怪物/鬼怪","description":"副本中的主要恐怖存在（外形、能力、弱点、行为模式）","format":"textarea","x-rows":6,"useForAI":true},"隐藏线索":{"type":"string","title":"隐藏线索","description":"副本中的隐藏线索（可能关联主线或隐藏奖励）","format":"textarea","useForAI":true},"通关奖励":{"type":"string","title":"通关奖励","description":"通关后获得的奖励","format":"textarea","useForAI":true},"与主线关联":{"type":"string","title":"与主线关联","description":"该副本与全书主线剧情的关联（可选）","format":"textarea","useForAI":true}},"required":["副本名称","恐怖主题","难度等级"]}',
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

-- 2.8 道具/技能
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '道具/技能',
  'Instance Prop',
  '创建游戏系统中的道具和技能——武器、消耗品、被动技能等',
  '{"type":"object","x-titleField":"名称","properties":{"名称":{"type":"string","title":"名称","useForAI":true},"类型":{"type":"string","title":"类型","enum":["武器","防具","消耗品","探索工具","被动技能","主动技能","特殊道具"],"x-uiWidget":"select","useForAI":true},"稀有度":{"type":"string","title":"稀有度","enum":["普通（白）","稀有（蓝）","史诗（紫）","传说（橙）","诡异（红）"],"x-uiWidget":"select","useForAI":true},"效果描述":{"type":"string","title":"效果描述","description":"道具/技能的具体效果","format":"textarea","useForAI":true},"获取方式":{"type":"string","title":"获取方式","enum":["副本通关奖励","商店兑换","任务奖励","隐藏掉落","特殊触发条件","初始装备"],"x-uiWidget":"select","useForAI":true},"使用限制":{"type":"string","title":"使用限制","description":"使用次数、冷却时间、等级限制等","format":"textarea","useForAI":true},"副作用":{"type":"string","title":"副作用","description":"使用后可能产生的负面效果","format":"textarea","useForAI":true}},"required":["名称","类型","稀有度"]}',
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
