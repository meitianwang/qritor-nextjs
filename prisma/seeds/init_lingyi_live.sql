-- 灵异直播小说创作方法初始化
-- 包含：创作方法 + 8 个模块类型
-- 执行方式 / Usage: mysql -u <user> -p <database> < init_lingyi_live.sql

-- ============================================================
-- 1. 创建创作方法
-- ============================================================

INSERT INTO novel_creation_method (name_zh, name_en, description_zh, novel_type_zh, novel_type_en, language, visible_categories, created_at)
VALUES (
  '灵异直播小说',
  'Paranormal Livestream Novel',
  '主角是灵异主播，通过深入凶宅、荒村、废弃工厂等地直播获利的创作方法。融合现代自媒体文化与中式民间灵异，带有强烈「镜头感」叙事视角，通过弹幕互动和打赏系统增强真实感。核心看点：直播间观众实时互动（观众中有时就是鬼魂）、打赏换驱邪道具、鬼怪是否在摄像头前现形的极致悬念张力。',
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

SET @method_id = (SELECT id FROM novel_creation_method WHERE name_zh = '灵异直播小说' LIMIT 1);

-- ============================================================
-- 2. 创建模块类型（8 个）
-- ============================================================

-- 2.1 故事钩子（setting，单例）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '故事钩子',
  'Story Hook',
  '定义这部灵异直播小说的核心吸引力——什么让读者在凌晨停不下来',
  '{"type":"object","required":["故事钩子"],"properties":{"故事钩子":{"type":"string","title":"故事钩子","description":"一句话概括这部直播灵异故事最令人上头的设定——直播间发生了什么让人欲罢不能","x-uiWidget":"textarea","useForAI":true},"核心卖点":{"type":"string","title":"核心卖点","description":"这部直播灵异小说区别于其他灵异文的独特之处——镜头感/弹幕互动/鬼怪与直播的特殊关联","x-uiWidget":"textarea","useForAI":true},"开篇爆点":{"type":"string","title":"开篇爆点","description":"前三章就要呈现的震撼事件——什么让读者在第一集就上头","x-uiWidget":"textarea","useForAI":true},"读者期待":{"type":"string","title":"读者期待","description":"明确承诺给读者的核心爽点与恐惧体验——弹幕警告时主播浑然不觉的绝望感、打赏道具在最后一刻救场的爽感","x-uiWidget":"textarea","useForAI":true}}}',
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

-- 2.2 直播平台设定（setting，单例）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '直播平台设定',
  'Stream Mechanics',
  '定义直播/短视频平台的核心规则——打赏系统、弹幕机制、平台禁忌、收益模式',
  '{"type":"object","required":["平台名称","直播类型"],"properties":{"平台名称":{"type":"string","title":"平台名称","description":"直播/短视频平台的名称（可真实平台也可虚构，虚构时需有记忆点）","useForAI":true},"直播类型":{"type":"string","title":"直播类型","enum":["纯直播型（实时探险）","短视频剪辑型（事后发布）","直播+短视频混合","VLOG日常记录型"],"x-uiWidget":"select","useForAI":true},"弹幕互动规则":{"type":"string","title":"弹幕互动规则","description":"弹幕如何影响剧情——观众的哪些行为能影响主播的决策（弹幕建议、弹幕警告、多数票选路等）","x-uiWidget":"textarea","useForAI":true},"打赏兑换系统":{"type":"string","title":"打赏兑换系统","description":"打赏金额如何兑换驱邪道具或装备——具体兑换门槛和道具清单","x-uiWidget":"textarea","useForAI":true},"平台禁忌与审核":{"type":"string","title":"平台禁忌与审核","description":"哪些内容会被封禁或限流——给主播制造额外麻烦的平台规则","x-uiWidget":"textarea","useForAI":true},"主播收益模式":{"type":"string","title":"主播收益模式","description":"主播如何从直播中获利——打赏分成、广告商单、账号变现、私下接单","x-uiWidget":"textarea","useForAI":true},"粉丝群体特征":{"type":"string","title":"粉丝群体特征","description":"观众群体的构成——是什么人在看这类直播，他们的核心诉求和行为习惯","x-uiWidget":"textarea","useForAI":true}}}',
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

-- 2.3 灵异体系设定（setting，单例）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '灵异体系设定',
  'Supernatural Rules',
  '定义这个世界的灵异规则——鬼怪类型、核心禁忌、直播与灵异的特殊互动关系',
  '{"type":"object","required":["灵异体系类型","核心禁忌"],"properties":{"灵异体系类型":{"type":"string","title":"灵异体系类型","enum":["中式民间灵异（因果报应+禁忌驱动）","都市传说型（网络灵异+现代鬼怪）","科学+灵异融合（可被仪器检测）","混沌型（规则未知，鬼怪逻辑不可预测）"],"x-uiWidget":"select","useForAI":true},"灵异与直播的关系":{"type":"string","title":"灵异与直播的关系","enum":["鬼怪能被摄像头捕捉（读者先于主播发现）","鬼怪只在回放中出现","直播信号会吸引鬼怪聚集","鬼怪故意利用直播传播自身","观看人数越多鬼怪越活跃"],"x-uiWidget":"select","useForAI":true},"核心禁忌":{"type":"string","title":"核心禁忌","description":"进入灵异场地的绝对禁忌——触犯后必然遭遇严重后果","x-uiWidget":"textarea","useForAI":true},"灵异生态":{"type":"string","title":"灵异生态","description":"这个世界存在哪些类型的鬼怪——它们的特征、强度层级、行为逻辑","x-uiWidget":"textarea","useForAI":true},"对抗灵异的手段":{"type":"string","title":"对抗灵异的手段","description":"民间术法、科学仪器、道具法器——哪些方法可以驱邪或自保","x-uiWidget":"textarea","useForAI":true},"直播特有规则":{"type":"string","title":"直播特有规则","description":"这个故事世界独有的直播-灵异互动规则——例如达到N人在线鬼怪会现身、弹幕骚扰会激怒鬼魂等","x-uiWidget":"textarea","useForAI":true}}}',
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

-- 2.4 主播档案（setting，单例）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '主播档案',
  'Streamer Persona',
  '定义主角的核心设定——主播人设、入行原因、特殊能力、隐藏秘密',
  '{"type":"object","required":["主播ID","性格特质","核心动机"],"properties":{"主播ID":{"type":"string","title":"主播ID/昵称","description":"直播账号名称或ID——要有记忆点和灵异风格","useForAI":true},"真实姓名":{"type":"string","title":"真实姓名","useForAI":true},"性格特质":{"type":"string","title":"性格特质","enum":["专业硬核型（把探灵当职业来做）","搞钱至上型（为了流量什么都敢做）","真心信鬼型（真的相信灵异，反而更危险）","科学理性型（用科学解释一切，但越来越动摇）","疯批无畏型（越危险越兴奋，享受恐惧）"],"x-uiWidget":"select","useForAI":true},"直播风格":{"type":"string","title":"直播风格","description":"主播的直播特色——话痨解说、沉默探索、互动玩家风格等","x-uiWidget":"textarea","useForAI":true},"入行原因":{"type":"string","title":"入行原因","description":"为什么选择做灵异主播——偶然经历、经济压力、主动寻找、被迫上路","x-uiWidget":"textarea","useForAI":true},"特殊能力或弱点":{"type":"string","title":"特殊能力或弱点","description":"主角在灵异方面的独特优势或致命弱点——有时弱点比能力更重要","x-uiWidget":"textarea","useForAI":true},"账号现状":{"type":"string","title":"账号现状","description":"目前的粉丝数量、账号等级、收益状况、历史重大事件","x-uiWidget":"textarea","useForAI":true},"核心动机":{"type":"string","title":"核心动机","enum":["赚钱养家/还债","寻找失踪的人","验证灵异的真实性","调查某个被掩盖的事件","追求极致刺激","完成某个承诺或诅咒"],"x-uiWidget":"select","useForAI":true},"背景秘密":{"type":"string","title":"背景秘密","description":"主播不为人知的过去——与灵异的隐藏渊源，往往是最危险的定时炸弹","x-uiWidget":"textarea","useForAI":true}}}',
  1.0,
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
  '文风设定',
  'Writing Style',
  '定义这部直播灵异小说的叙事风格——镜头感强度、弹幕呈现方式、恐惧营造手法',
  '{"type":"object","required":["叙事视角","镜头感强度"],"properties":{"叙事视角":{"type":"string","title":"叙事视角","enum":["直播流视角（弹幕穿插正文）","第一人称（主播自述）","第三人称限知（跟随主播）","多视角切换（主播+观众+灵异）"],"x-uiWidget":"radio","useForAI":true},"镜头感强度":{"type":"string","title":"镜头感强度","enum":["高度镜头化（大量摄像头视角、画面构图描写）","中等镜头感（关键场景切换到摄像头视角）","轻度镜头感（仅少数场景使用镜头感笔法）"],"x-uiWidget":"radio","useForAI":true},"弹幕呈现方式":{"type":"string","title":"弹幕呈现方式","enum":["直接插入正文（[弹幕：xxx]格式）","单独弹幕段落（独立呈现）","弹幕与叙事交织（弹幕作为氛围背景）","极少使用弹幕（以主播视角为主）"],"x-uiWidget":"select","useForAI":true},"恐惧营造核心手法":{"type":"string","title":"恐惧营造核心手法","enum":["摄像头先行（读者通过摄像头发现主播未察觉的异常）","弹幕预警（观众比主播先看到危险，主播不听）","设备故障叙事（信号断续制造恐惧）","事后回放发现异常（当场无事，回看才发现）"],"x-uiWidget":"select","useForAI":true},"语言风格":{"type":"string","title":"语言风格","enum":["网络口语化（直播语言风格）","口播风格（边探索边解说）","白话散文（偶尔夹杂直播语言）"],"x-uiWidget":"radio","useForAI":true},"节奏特色":{"type":"string","title":"节奏特色","description":"这部小说独特的节奏控制方式——如何在直播实时感与悬念积累之间平衡","x-uiWidget":"textarea","useForAI":true},"禁忌写法":{"type":"string","title":"禁忌写法","description":"写作时必须避免的叙事模式或词汇——保持风格一致性","x-uiWidget":"textarea","useForAI":true}}}',
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
  '直播间内外的所有角色——助播、忠实粉丝、潜伏鬼魂、竞争主播等',
  '{"type":"object","required":["姓名","角色类型"],"x-titleField":"姓名","properties":{"姓名":{"type":"string","title":"姓名/昵称","description":"角色的真实姓名或直播昵称（鬼怪可用描述性名称）","useForAI":true},"角色类型":{"type":"string","title":"角色类型","enum":["搭档助播","忠实粉丝/数据党","质疑者/黑粉","直播间潜伏鬼魂（长期在线）","凶宅/场地鬼怪（一次性）","平台工作人员/管理","幕后调查者","竞争或合作主播"],"x-uiWidget":"select","useForAI":true},"真实身份":{"type":"string","title":"真实身份","description":"角色的真实属性——特别重要：表面上是人类的角色是否真的是人类","x-uiWidget":"textarea","useForAI":true},"直播间昵称":{"type":"string","title":"直播间昵称","description":"如果是观众，在弹幕中出现的ID","useForAI":true},"与主播的关系":{"type":"string","title":"与主播的关系","description":"与主角的具体关系和互动方式——如何在直播中发挥作用","x-uiWidget":"textarea","useForAI":true},"核心动机":{"type":"string","title":"核心动机","description":"这个角色为什么出现在直播中——正常观众？执行任务？利用主播达成目的？","x-uiWidget":"textarea","useForAI":true},"隐藏秘密":{"type":"string","title":"隐藏秘密","description":"角色不为人知的真相——往往在关键节点爆发","x-uiWidget":"textarea","useForAI":true},"当前状态":{"type":"string","title":"当前状态","description":"角色在故事进程中的当前处境","isDynamic":true}}}',
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

-- 2.7 探险地点（scene，非单例）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '探险地点',
  'Haunted Location',
  '主播前往直播的各类凶地——凶宅、荒村、废弃工厂、旧医院等',
  '{"type":"object","required":["地点名称","地点类型"],"x-titleField":"地点名称","properties":{"地点名称":{"type":"string","title":"地点名称","description":"地点的名称或代号——最好有民间流传的外号","useForAI":true},"地点类型":{"type":"string","title":"地点类型","enum":["凶宅（死亡案件发生地）","荒村（废弃村庄）","废弃工厂或矿场","旧医院或精神病院","古墓或墓地","废弃学校","孤岛或山区险地","其他"],"x-uiWidget":"select","useForAI":true},"灵异等级":{"type":"string","title":"灵异等级","enum":["S级（极度危险，非专业人士勿入）","A级（高度灵异活跃）","B级（中度灵异，有明确异常）","C级（轻微异常，尚待确认）"],"x-uiWidget":"radio","useForAI":true},"背后历史":{"type":"string","title":"背后历史","description":"这个地方发生过什么——事件的起因、经过、遗留的怨念","x-uiWidget":"textarea","useForAI":true},"直播吸引力":{"type":"string","title":"直播吸引力","description":"这个地点的直播潜力——画面感、刺激程度、预期观众反应","x-uiWidget":"textarea","useForAI":true},"已知灵异现象":{"type":"string","title":"已知灵异现象","description":"民间流传或已被记录的具体灵异现象","x-uiWidget":"textarea","useForAI":true},"地形布局":{"type":"string","title":"地形布局","description":"地点的具体布局——哪些区域最危险、哪里藏有关键秘密","x-uiWidget":"textarea","useForAI":true},"当前探索状态":{"type":"string","title":"当前探索状态","description":"已探索区域、已触发的灵异事件、遗留谜题","isDynamic":true}}}',
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

-- 2.8 灵异道具（prop，非单例）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '灵异道具',
  'Supernatural Artifact',
  '驱邪物品、探测设备、打赏兑换的法器——每件道具都有其代价',
  '{"type":"object","required":["道具名称","道具类型"],"x-titleField":"道具名称","properties":{"道具名称":{"type":"string","title":"道具名称","useForAI":true},"道具类型":{"type":"string","title":"道具类型","enum":["驱邪防护型","探测感知型","记录取证型（直播设备）","攻击封印型","消耗品（一次性使用）","未知灵异物品（来路不明）"],"x-uiWidget":"select","useForAI":true},"获取方式":{"type":"string","title":"获取方式","enum":["打赏兑换（需达到指定金额）","任务或探险奖励","在凶宅内发现","外购或委托制作","灵异馈赠（鬼怪主动给予，需警惕）"],"x-uiWidget":"select","useForAI":true},"效果描述":{"type":"string","title":"效果描述","description":"道具的具体功效和正确使用方法","x-uiWidget":"textarea","useForAI":true},"代价与副作用":{"type":"string","title":"代价与副作用","description":"使用这件道具的代价或注意事项——灵异世界没有完美的保护手段","x-uiWidget":"textarea","useForAI":true},"直播展示价值":{"type":"string","title":"直播展示价值","description":"这个道具在直播中如何呈现、观众会有什么反应","x-uiWidget":"textarea","useForAI":true},"当前状态":{"type":"string","title":"当前耐久或状态","description":"道具目前的可用状态","isDynamic":true}}}',
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
