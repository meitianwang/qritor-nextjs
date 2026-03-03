-- 赛博朋克小说创作 - 创作方法初始化
-- language: zh
-- 包含：创作方法 + 9 个模块类型（5 setting + 1 character + 1 scene + 1 prop + 1 organization）
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/init_cyberpunk.sql

-- ============================================================
-- 1. 创建创作方法
-- ============================================================

INSERT INTO novel_creation_method (name_zh, name_en, description_zh, novel_type_zh, novel_type_en, language, visible_categories, created_at)
VALUES (
  '赛博朋克小说创作',
  'Cyberpunk Novel',
  '「高科技，低生活」——在巨型企业统治的霓虹都市中，义体改造者、网络黑客和街头独行侠在数据与钢铁的缝隙中求生存。探索人类与机器的界限，在极度发达的资本控制下书写个体的挣扎与反抗。',
  '科幻',
  'Sci-Fi',
  'zh',
  '["setting","character","scene","organization","prop"]',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  novel_type_zh = VALUES(novel_type_zh),
  visible_categories = VALUES(visible_categories),
  updated_at = NOW();

SET @method_id = (SELECT id FROM novel_creation_method WHERE name_zh = '赛博朋克小说创作' LIMIT 1);

-- ============================================================
-- 2. 创建模块类型（9 个）
-- ============================================================

-- 2.1 故事钩子（setting, singleton）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '故事钩子',
  'Story Hook',
  '高科技低生活的切入点——什么样的委托、危机或身份，让读者在霓虹与阴影中代入主角',
  '{"type":"object","title":"故事钩子","required":["故事钩子"],"properties":{"故事钩子":{"type":"string","title":"故事钩子","description":"一句话概括故事核心——「高科技，低生活」的矛盾如何在主角身上体现","x-uiWidget":"textarea","useForAI":true},"核心矛盾":{"type":"string","title":"核心矛盾","enum":["对抗企业","追寻真相","义体危机","网络战争","失忆调查","人工智能觉醒","地下革命","生存求存"],"x-uiWidget":"select","useForAI":true},"主角身份":{"type":"string","title":"主角身份","description":"主角的职业和街头档案——独行侠/网络黑客/掮客/义体医生/企业特工/街头少年","useForAI":true},"初始处境":{"type":"string","title":"初始处境","description":"故事开始时主角的处境——债务缠身、被企业追杀、寻找失踪的人，还是接了一个不该接的委托","x-uiWidget":"textarea","useForAI":true},"主线驱动力":{"type":"string","title":"主线驱动力","description":"推动故事前进的核心问题——主角为了什么而行动，什么是他不得不做的事","x-uiWidget":"textarea","useForAI":true},"高科技低生活体现":{"type":"string","title":"高科技低生活体现","description":"本故事中「高科技」与「低生活」的具体对照——技术如何同时是主角的武器和枷锁","x-uiWidget":"textarea","useForAI":true}}}',
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

-- 2.2 世界观设定（setting, singleton）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '世界观设定',
  'Worldbuilding',
  '霓虹都市的骨架——企业统治程度、阶层结构、城市格局与环境状态',
  '{"type":"object","title":"世界观设定","x-titleField":"城市名称","required":["城市名称","企业统治程度"],"properties":{"城市名称":{"type":"string","title":"城市名称","description":"故事发生的城市或地区（可以是虚构的，也可以是现实城市的近未来变体）","useForAI":true},"年代背景":{"type":"string","title":"年代背景","description":"故事发生的大概年代和时代特征","useForAI":true},"地理格局":{"type":"string","title":"地理格局","enum":["超级都市单体","多城市连绵带（城市蔓延）","海上浮动都市","地下城","轨道殖民地"],"x-uiWidget":"radio","useForAI":true},"企业统治程度":{"type":"string","title":"企业统治程度","enum":["全面控制（企业即政府）","寡头竞争（数家企业割据）","架空政府（名义存在）","混乱割据（无中央权威）"],"x-uiWidget":"radio","useForAI":true},"阶层结构":{"type":"string","title":"阶层结构","description":"社会如何分层——上城区精英、中产阶级、底层贫民窟居民的生活边界与流动可能性","x-uiWidget":"textarea","useForAI":true},"环境状态":{"type":"string","title":"环境状态","enum":["极度污染（不可逆）","部分污染（上层宜居）","人工生态维持","近未来轻度恶化"],"x-uiWidget":"radio","useForAI":true},"底层生活图景":{"type":"string","title":"底层生活图景","description":"贫民窟的日常面貌——食物来源、住所形态、娱乐方式、生存法则","x-uiWidget":"textarea","useForAI":true}}}',
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

-- 2.3 科技与义体体系（setting, singleton）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '科技与义体体系',
  'Tech & Cyberware',
  '改造的边界——义体普及程度、人工智能现状、网络空间形态与赛博精神病风险',
  '{"type":"object","title":"科技与义体体系","properties":{"科技发展阶段":{"type":"string","title":"科技发展阶段","enum":["近未来（20-50年后）","中期未来（约100年后）","远未来（数百年后）"],"x-uiWidget":"radio","useForAI":true},"义体普及程度":{"type":"string","title":"义体普及程度","enum":["奢侈品级（少数精英）","中产普及（主流消费）","基础配置（工作必需）","强制植入（国家/企业要求）"],"x-uiWidget":"radio","useForAI":true},"主要义体类型":{"type":"string","title":"主要义体类型","description":"本世界最常见的改造类型——感官增强、四肢替换、神经接口、颅内植入等","x-uiWidget":"textarea","useForAI":true},"赛博精神病":{"type":"string","title":"赛博精神病（Cyberpsychosis）","description":"过度义体化导致的人格崩溃——在本世界中的发生率、症状表现和社会处置方式","x-uiWidget":"textarea","useForAI":true},"人工智能现状":{"type":"string","title":"人工智能现状","enum":["弱AI工具化（无自我意识）","强AI受管控（受法律约束）","涌现AI地下存在（非法自主AI）","AI觉醒公开化（AI权利运动）"],"x-uiWidget":"radio","useForAI":true},"网络空间形态":{"type":"string","title":"网络空间形态","description":"赛博空间的外观和运作方式——沉浸式3D、数据流视觉化、ICE防火墙等","x-uiWidget":"textarea","useForAI":true},"黑科技禁区":{"type":"string","title":"黑科技禁区","description":"被明令禁止或严格管控的技术——全脑上传、感情芯片、军用战斗义体等","x-uiWidget":"textarea","useForAI":true}}}',
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

-- 2.4 势力格局（setting, singleton）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '势力格局',
  'Power Structure',
  '没有好人的棋局——巨型企业、街头帮派与政府残余如何构成主角无处逃脱的权力网络',
  '{"type":"object","title":"势力格局","properties":{"整体格局":{"type":"string","title":"整体格局","enum":["单极垄断（一家独大）","双雄对立","多极博弈（三方以上）","混沌割据（无主格局）"],"x-uiWidget":"radio","useForAI":true},"主要巨型企业":{"type":"string","title":"主要巨型企业","description":"核心Megacorp的名称、主营业务领域和统治方式——谁控制了医疗、谁控制了信息、谁控制了武器","x-uiWidget":"textarea","useForAI":true},"地下势力分布":{"type":"string","title":"地下势力分布","description":"帮派、黑市网络、抵抗组织、雇佣兵集团的分布和相互关系","x-uiWidget":"textarea","useForAI":true},"政府残余形态":{"type":"string","title":"政府残余形态","enum":["名存实亡（企业完全替代）","企业代理政府（合法外壳）","区域军阀割据","地下反抗政权"],"x-uiWidget":"radio","useForAI":true},"主要冲突轴线":{"type":"string","title":"主要冲突轴线","description":"当前城市中最激烈的势力博弈——企业并购战争、帮派领地争夺、AI解放运动","x-uiWidget":"textarea","useForAI":true},"主角所处位置":{"type":"string","title":"主角所处位置","enum":["无归属独行者（Freelancer）","企业内部人（想逃离）","地下组织成员","多方周旋的掮客"],"x-uiWidget":"radio","useForAI":true}}}',
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

-- 2.5 文风设定（setting, singleton）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '文风设定',
  'Writing Style',
  '黑色电影遇上科幻——叙事视角、感官重心与人性反思深度',
  '{"type":"object","title":"文风设定","properties":{"叙事视角":{"type":"string","title":"叙事视角","enum":["第一人称（硬派侦探独白）","第三人称限视角（跟随主角）","多视角交叉叙事"],"x-uiWidget":"radio","useForAI":true},"总体基调":{"type":"string","title":"总体基调","enum":["黑色电影悲剧","赛博奔跑爽快","哲学思辨沉重","黑色幽默讽刺"],"x-uiWidget":"radio","useForAI":true},"语言风格":{"type":"string","title":"语言风格","enum":["简洁硬派（短句，信息密度高）","感官流（霓虹色彩的意识流）","技术俚语密集（真实黑客感）","街头混搭（俚语与企业术语并置）"],"x-uiWidget":"radio","useForAI":true},"感官重心":{"type":"string","title":"感官重心","enum":["视觉主导（霓虹与阴影的对比）","听觉主导（噪音与寂静的切换）","触觉主导（冷钢与温热的冲突）","多感官混合轰炸"],"x-uiWidget":"radio","useForAI":true},"人性反思深度":{"type":"string","title":"人性反思深度","enum":["行动导向（弱化哲学反思）","行动与思辨并重","哲学思辨为核心（人与机器的界限）"],"x-uiWidget":"radio","useForAI":true},"禁用词汇":{"type":"string","title":"禁用词汇","description":"写作时需避免的表达——过于积极乐观的词语、与赛博风格不符的古风用语等","x-uiWidget":"textarea","useForAI":true}}}',
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

-- 2.6 角色（character, non-singleton）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '角色',
  'Character',
  '霓虹都市的生存者——独行侠、黑客、掮客与所有在钢铁与数据中挣扎的人',
  '{"type":"object","title":"角色","x-titleField":"角色名","required":["角色名","档案类型"],"properties":{"角色名":{"type":"string","title":"角色名","description":"角色的街头代号或真实姓名","useForAI":true},"档案类型":{"type":"string","title":"档案类型","enum":["独行侠（Solo/街头战士）","网络黑客（Netrunner）","掮客（Fixer）","义体医生（Ripperdoc）","企业特工（Corpo）","街头少年","人工智能（AI）","信息贩子/记者","其他"],"x-uiWidget":"select","useForAI":true},"义体改造程度":{"type":"string","title":"义体改造程度","enum":["纯人类（零改造）","轻度（美容/感官）","中度（战斗/工作用）","重度（接近赛博精神病临界）","超限（已有人格异变迹象）"],"x-uiWidget":"radio","useForAI":true},"所属阵营":{"type":"string","title":"所属阵营","description":"所属的组织、企业或街头势力（无归属则留空）","useForAI":true},"核心技能":{"type":"string","title":"核心技能","description":"角色最擅长的领域——近战、入侵、情报、谈判、医疗","x-uiWidget":"textarea","useForAI":true},"核心动机":{"type":"string","title":"核心动机","description":"推动角色行动的根本欲望或恐惧——钱、复仇、自由、保护某人、生存","x-uiWidget":"textarea","useForAI":true},"个人创伤":{"type":"string","title":"个人创伤","description":"塑造角色的过往——亲人被企业利用、义体改造失败、曾经出卖过某人","x-uiWidget":"textarea","useForAI":true},"人性残存":{"type":"string","title":"人性残存","description":"在赛博世界中角色还保留的人性——在意什么、对什么会软化","x-uiWidget":"textarea","useForAI":true},"主角视角":{"type":"string","title":"主角视角","enum":["是","否"],"x-uiWidget":"radio","useForAI":true},"当前状态":{"type":"string","title":"当前状态","description":"角色当前的处境和进行中的事项","isDynamic":true}}}',
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

-- 2.7 地点（scene, non-singleton）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '地点',
  'Location',
  '霓虹与阴影——上城区的玻璃幕墙、底层贫民窟的夜市街道与数据洪流中的赛博空间',
  '{"type":"object","title":"地点","x-titleField":"地点名称","required":["地点名称","区域层级"],"properties":{"地点名称":{"type":"string","title":"地点名称","useForAI":true},"区域层级":{"type":"string","title":"区域层级","enum":["上城区（企业精英区）","中城区（中产过渡区）","底层贫民窟（Sprawl）","企业飞地（封闭隔离区）","赛博空间节点","地下设施","城市废墟区","轨道/空中设施"],"x-uiWidget":"select","useForAI":true},"场所类型":{"type":"string","title":"场所类型","enum":["夜市街道","企业大楼/飞地","地下酒吧/夜店","义体诊所","黑市/交易点","栖身处/公寓","工业区/废弃厂房","赛博空间界面"],"x-uiWidget":"select","useForAI":true},"感官特征":{"type":"string","title":"感官特征","description":"这个地点的视觉、听觉、嗅觉特征——霓虹颜色、噪音类型、气味","x-uiWidget":"textarea","useForAI":true},"危险程度":{"type":"string","title":"危险程度","enum":["安全区","低风险","中等风险","高危区","即死区"],"x-uiWidget":"radio","useForAI":true},"势力控制":{"type":"string","title":"势力控制","description":"谁控制这个地点——哪个企业、哪个帮派或无人管辖","useForAI":true},"叙事功能":{"type":"string","title":"叙事功能","description":"这个地点在故事中的作用——信息获取、物资补给、交锋地点、情感锚点","x-uiWidget":"textarea","useForAI":true},"当前状态":{"type":"string","title":"当前状态","description":"当前的特殊情况——被封锁、爆发冲突、有重要人物出没","isDynamic":true}}}',
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

-- 2.8 装备与义体（prop, non-singleton）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '装备与义体',
  'Equipment & Cyberware',
  '改造的代价——从街头山寨义体到军用黑科技，每件装备都是一个关于人性的问题',
  '{"type":"object","title":"装备与义体","x-titleField":"装备名","required":["装备名","装备类型"],"properties":{"装备名":{"type":"string","title":"装备名","useForAI":true},"装备类型":{"type":"string","title":"装备类型","enum":["义体改造（身体内置）","外置武器","黑客设备/套件","防护装备","情报收集工具","交通工具","特殊黑科技"],"x-uiWidget":"select","useForAI":true},"技术等级":{"type":"string","title":"技术等级","enum":["街头改装品（山寨/二手）","中端商用级","军用/企业专属","黑市原型机","来源不明"],"x-uiWidget":"radio","useForAI":true},"功能与性能":{"type":"string","title":"功能与性能","description":"装备的实际能力和使用方式","x-uiWidget":"textarea","useForAI":true},"副作用与代价":{"type":"string","title":"副作用与代价","description":"使用或携带的代价——义体排异、人格侵蚀、暴露身份、法律风险","x-uiWidget":"textarea","useForAI":true},"来源渠道":{"type":"string","title":"来源渠道","enum":["合法购买","黑市获取","企业配发","任务奖励","自行改造","来源不明"],"x-uiWidget":"radio","useForAI":true},"叙事象征":{"type":"string","title":"叙事象征","description":"这件装备对角色的象征意义——身份认同、过去的痕迹、对人性的质疑","x-uiWidget":"textarea","useForAI":true},"当前状态":{"type":"string","title":"当前状态","description":"装备当前的耐久度和特殊情况","isDynamic":true}}}',
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

-- 2.9 势力与组织（organization, non-singleton）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '势力与组织',
  'Faction & Organization',
  '棋盘上的玩家——巨型企业、街头帮派、地下抵抗势力与所有操控城市命运的力量',
  '{"type":"object","title":"势力与组织","x-titleField":"组织名称","required":["组织名称","组织类型"],"properties":{"组织名称":{"type":"string","title":"组织名称","useForAI":true},"组织类型":{"type":"string","title":"组织类型","enum":["巨型企业（Megacorp）","街头帮派","黑市组织","地下抵抗势力","政府残余机构","宗教/意识形态cult","自主AI网络","雇佣兵集团","情报经纪网络"],"x-uiWidget":"select","useForAI":true},"势力规模":{"type":"string","title":"势力规模","enum":["全球级","跨城市级","城市级","区域/街区级","地下网络级（无实体）"],"x-uiWidget":"radio","useForAI":true},"核心利益":{"type":"string","title":"核心利益","description":"这个势力的根本追求——市场垄断、领地控制、意识形态传播、生存或其他","x-uiWidget":"textarea","useForAI":true},"主要手段":{"type":"string","title":"主要手段","description":"实现目标的方式——暗杀、收购、舆论操控、暴力镇压、技术优势","x-uiWidget":"textarea","useForAI":true},"内部权力结构":{"type":"string","title":"内部权力结构","description":"组织的权力架构、派系分布与决策机制","x-uiWidget":"textarea","useForAI":true},"与主角关系":{"type":"string","title":"与主角关系","enum":["雇主/合作方","对立/敌人","中立/可利用","关系复杂/未定"],"x-uiWidget":"radio","useForAI":true},"当前状态":{"type":"string","title":"当前状态","description":"当前的处境和进行中的行动","isDynamic":true}}}',
  @method_id,
  1,
  0,
  'organization',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  updated_at = NOW();
