-- 灵异司机职业流小说 - 创作方法初始化
-- language: zh
-- 包含：创作方法 + 8 个模块类型（5 setting + 1 character + 1 scene + 1 prop）
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/init_ghost_driver.sql

-- ============================================================
-- 1. 创建创作方法
-- ============================================================

INSERT INTO novel_creation_method (name, description, novel_type, language, visible_categories, is_preset, user_id, status, created_at)
VALUES (
  '灵异司机职业流小说',
  '主角是"阴阳公交"的驾驶员，不是乘客。为高薪或被迫签订契约，每晚接送非人乘客。职业约束（必须按时到站、不能拒载、不能让乘客下错站）与升级体系（冥币、装备强化）结合，打造"打工恐惧"的独特代入感——读者在主角的职业日常中体验灵异世界。',
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

SET @method_id = (SELECT id FROM novel_creation_method WHERE name = '灵异司机职业流小说' LIMIT 1);

-- ============================================================
-- 2. 创建模块类型（8 个）
-- ============================================================

-- 2.1 故事钩子（setting, singleton, temp=1.2）
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  '故事钩子',
  '一句话抓住读者——让人既想当这个司机，又怕真上了那班车',
  '{"type":"object","title":"故事钩子","required":["故事钩子"],"properties":{"故事钩子":{"type":"string","title":"故事钩子","description":"一句话概括故事核心吸引力——读者看完后既想上车体验，又怕真的上了那班车","x-uiWidget":"textarea","useForAI":true},"职业钩子":{"type":"string","title":"职业钩子","description":"让读者产生「我也想当这个司机」或「我绝对不当这个司机」的代入感元素","x-uiWidget":"textarea","useForAI":true},"恐惧核心":{"type":"string","title":"恐惧核心","description":"这个故事最根本的不安来源——契约束缚、未知乘客、孤立无援，还是主角自己的秘密","x-uiWidget":"textarea","useForAI":true},"读者期待":{"type":"string","title":"读者期待","description":"读者期望从故事中获得的主要体验——升级爽感、危机求生、与鬼共处的荒诞感，还是揭露真相","x-uiWidget":"textarea","useForAI":true}}}',
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

-- 2.2 契约规则（setting, singleton, temp=0.9）
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  '契约规则',
  '司机与谁签约、必须遵守什么规则、违规后果与报酬体系',
  '{"type":"object","title":"契约规则","required":["契约内容","基本守则"],"properties":{"契约内容":{"type":"string","title":"契约内容","description":"司机为何签订契约——高薪诱惑、债务偿还、被迫绑定，还是走投无路","x-uiWidget":"textarea","useForAI":true},"雇主":{"type":"string","title":"雇主","description":"谁在运营这条线路——冥府官僚、神秘组织、古老存在还是来源不明的力量","x-uiWidget":"textarea","useForAI":true},"基本守则":{"type":"string","title":"基本守则","description":"所有司机必须遵守的核心规则——必须按时到站、不能拒载、不能让乘客提前下车等","x-uiWidget":"textarea","useForAI":true},"违规后果":{"type":"string","title":"违规后果","description":"违反守则会发生什么——分层描述轻微违规（扣薪/警告）和严重违规（性命/契约加重）的后果","x-uiWidget":"textarea","useForAI":true},"司机待遇":{"type":"string","title":"司机待遇","description":"完成班次的报酬——冥币数量、寿命延长、特殊道具，以及隐性福利","x-uiWidget":"textarea","useForAI":true},"合同漏洞":{"type":"string","title":"合同漏洞","description":"契约中的灰色地带——哪些规则有例外，主角可以合法利用哪些漏洞","x-uiWidget":"textarea","useForAI":true}}}',
  0.9,
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

-- 2.3 公交系统设定（setting, singleton, temp=1.0）
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  '公交系统设定',
  '阴阳公交的运营体系——线路、乘客生态、升级系统与车辆初始状态',
  '{"type":"object","title":"公交系统设定","required":["线路概况","运营时段"],"properties":{"线路概况":{"type":"string","title":"线路概况","description":"这条阴阳公交的基本情况——线路编号或名称、经过的区域类型、起始站和终点站","x-uiWidget":"textarea","useForAI":true},"运营时段":{"type":"string","title":"运营时段","description":"公交何时切换至阴间模式，乘客类型如何随深夜时段推移而变化","x-uiWidget":"textarea","useForAI":true},"乘客来源":{"type":"string","title":"乘客来源","description":"上车存在的主要类型——新亡之魂、执念鬼、妖怪、神祇，各类型的大致比例和行为规律","x-uiWidget":"textarea","useForAI":true},"车辆初始状态":{"type":"string","title":"车辆初始状态","description":"故事开始时公交车的配置——基础防护等级、已有装备、明显缺陷和待解决的问题","x-uiWidget":"textarea","useForAI":true},"升级体系":{"type":"string","title":"升级体系","description":"司机如何成长——冥币或积分如何获取和使用、装备解锁条件、声望或等级体系","x-uiWidget":"textarea","useForAI":true},"竞争者":{"type":"string","title":"竞争者","description":"是否存在其他司机或线路，它们与主角的竞争或合作关系","x-uiWidget":"textarea","useForAI":true}}}',
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

-- 2.4 世界观（setting, singleton, temp=1.0）
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  '世界观',
  '阴阳两界的共存规则——普通人知情程度、鬼怪体系与冥府机构',
  '{"type":"object","title":"世界观","required":["阴阳规则","现代背景"],"properties":{"现代背景":{"type":"string","title":"现代背景","description":"故事发生的城市和时代——越具体越有代入感（「某二线城市」「2024年深秋」）","x-uiWidget":"textarea","useForAI":true},"阴阳规则":{"type":"string","title":"阴阳规则","description":"生死两界如何共存——阴阳界限的维持机制，普通人为什么看不到这些存在","x-uiWidget":"textarea","useForAI":true},"鬼怪体系":{"type":"string","title":"鬼怪体系","description":"超自然存在的分类和等级——新鬼、执念鬼、厉鬼、妖怪、神明各有什么特征和危险程度","x-uiWidget":"textarea","useForAI":true},"冥府机构":{"type":"string","title":"冥府机构","description":"管理死后世界的机构是否存在，它们与公交运营系统的关系和权力结构","x-uiWidget":"textarea","useForAI":true},"普通人知情程度":{"type":"string","title":"普通人知情程度","enum":["完全不知情","民间传说层面了解","少数人知情（道士/驱魔师等）","政府有秘密部门","已半公开的秘密"],"x-uiWidget":"radio","useForAI":true}}}',
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

-- 2.5 文风设定（setting, singleton, temp=1.0）
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  '文风设定',
  '叙事风格与节奏——决定故事如何在「打工日常」与「灵异危机」之间切换',
  '{"type":"object","title":"文风设定","properties":{"叙事视角":{"type":"string","title":"叙事视角","enum":["第一人称（司机内心独白）","第三人称限知（跟随司机视角）","第三人称全知"],"x-uiWidget":"radio","useForAI":true},"基调":{"type":"string","title":"基调","enum":["职业恐惧（规则压迫与未知威胁）","怪诞日常（与鬼共处的荒诞感）","升级爽文（装备成长与危机挑战）","混合类型"],"x-uiWidget":"select","useForAI":true},"语言风格":{"type":"string","title":"语言风格","enum":["打工人口吻（接地气，日常与灵异对比感强）","行车日志/班次记录（伪纪实感）","文学性叙述（氛围优先）","网络流行语混搭灵异（现代感强）"],"x-uiWidget":"radio","useForAI":true},"节奏把控":{"type":"string","title":"节奏把控","enum":["快节奏——危机事件密集不给喘息","中节奏——张弛有度","慢热型——日常积累后爆发"],"x-uiWidget":"radio","useForAI":true},"升级叙事方式":{"type":"string","title":"升级叙事方式","description":"如何在正文中展现装备获取和司机成长——系统提示框式、自然叙述式还是章末总结式","x-uiWidget":"textarea","useForAI":true},"禁用词汇":{"type":"string","title":"禁用词汇","description":"写作时需要避免的词汇或表达","x-uiWidget":"textarea","useForAI":true}}}',
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

-- 2.6 角色（character, non-singleton）
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  '角色',
  '司机、常客鬼魂、雇主、阳间关联人物——所有影响主角命运的存在',
  '{"type":"object","x-titleField":"姓名","required":["姓名","角色类型"],"properties":{"姓名":{"type":"string","title":"姓名","description":"角色姓名或代称（鬼魂可以是「3号座的老太太」「每周三上车的学生」）","useForAI":true},"角色类型":{"type":"string","title":"角色类型","enum":["司机（主角）","常客鬼魂","一次性乘客","同事/前任司机","雇主/管理者","阳间关联人物","对立势力"],"x-uiWidget":"radio","useForAI":true},"生死状态":{"type":"string","title":"生死状态","enum":["活人","鬼魂","不死存在","神/妖","未知"],"x-uiWidget":"radio","useForAI":true},"外形特征":{"type":"string","title":"外形特征","description":"角色外貌，尤其是超自然特征——让司机察觉它不是普通乘客的细节","x-uiWidget":"textarea","useForAI":true},"性格特质":{"type":"string","title":"性格特质","description":"面对危机或司机时的核心行为模式","x-uiWidget":"textarea","useForAI":true},"危险等级":{"type":"string","title":"危险等级","enum":["无害","轻微威胁","中等危险","高危","极危（司机无法单独处理）"],"x-uiWidget":"radio","useForAI":true},"上车原因":{"type":"string","title":"上车原因","description":"这个存在为什么乘坐这班公交——执念未了、例行公事、特殊使命还是意外登车","x-uiWidget":"textarea","useForAI":true},"与司机的关系":{"type":"string","title":"与司机的关系","description":"对主角的态度和潜在互动方向","x-uiWidget":"textarea","useForAI":true},"已知信息":{"type":"string","title":"已知信息","description":"主角目前掌握的关于此角色的情报","isDynamic":true},"当前状态":{"type":"string","title":"当前状态","description":"故事进程中的当前处境","isDynamic":true}}}',
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

-- 2.7 公交站/线路（scene, non-singleton）
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  '公交站/线路',
  '阴阳公交经过的站点——每个站台都有独特的灵异生态和潜在风险',
  '{"type":"object","x-titleField":"站点名称","required":["站点名称","站点类型"],"properties":{"站点名称":{"type":"string","title":"站点名称","description":"具体站名（「XX路XX站」而非「某个站台」）","useForAI":true},"站点类型":{"type":"string","title":"站点类型","enum":["普通居民区站","商业区/繁华地段站","医院/殡仪馆附近站","古迹/庙宇附近站","事故多发路段站","终点站/始发站","幽灵站（现实中不存在的站点）"],"x-uiWidget":"select","useForAI":true},"阳间现状":{"type":"string","title":"阳间现状","description":"白天或普通人视角下这个站台的样子","x-uiWidget":"textarea","useForAI":true},"阴间特征":{"type":"string","title":"阴间特征","description":"深夜运营时这个站台的异常——等候的存在、氛围变化、特殊规则","x-uiWidget":"textarea","useForAI":true},"常驻乘客类型":{"type":"string","title":"常驻乘客类型","description":"这个站台通常有什么类型的存在上车，行为规律如何","x-uiWidget":"textarea","useForAI":true},"已知风险":{"type":"string","title":"已知风险","description":"这个站台对司机的潜在威胁，或需要提前注意的特殊规则","x-uiWidget":"textarea","useForAI":true},"当前状态":{"type":"string","title":"当前状态","description":"这个站台目前的危险等级和特殊情况","isDynamic":true}}}',
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

-- 2.8 公交装备（prop, non-singleton）
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  '公交装备',
  '司机通过冥币或特殊事件获取的装备——从防鬼玻璃到撞鬼保险杠',
  '{"type":"object","x-titleField":"装备名称","required":["装备名称","装备类型"],"properties":{"装备名称":{"type":"string","title":"装备名称","useForAI":true},"装备类型":{"type":"string","title":"装备类型","enum":["车辆改装（防护类）","车辆改装（攻击/驱逐类）","车辆改装（功能增强类）","司机个人护具","信息收集道具","交涉/安抚道具","应急逃生工具"],"x-uiWidget":"select","useForAI":true},"获取方式":{"type":"string","title":"获取方式","description":"如何获得——消耗多少冥币/积分，还是通过特定事件或任务解锁","x-uiWidget":"textarea","useForAI":true},"效果描述":{"type":"string","title":"效果描述","description":"装备的实际功能——对哪类乘客有效，有什么操作限制","x-uiWidget":"textarea","useForAI":true},"代价/副作用":{"type":"string","title":"代价/副作用","description":"使用这件装备的代价——消耗品损耗、引发某类乘客不满，或其他隐患","x-uiWidget":"textarea","useForAI":true},"当前状态":{"type":"string","title":"当前状态","description":"装备耐久度和当前使用情况","isDynamic":true}}}',
  1.0,
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
