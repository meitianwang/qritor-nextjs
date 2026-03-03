-- 悬疑推理小说创作方法
-- Language: zh
-- Includes: creation method + 8 module types
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/init_mystery_detective.sql

-- ============================================================
-- 1. 创建创作方法
-- ============================================================

INSERT INTO novel_creation_method (name_zh, name_en, description_zh, novel_type_zh, novel_type_en, language, visible_categories, created_at)
VALUES (
  '悬疑推理小说创作',
  'Mystery Detective Novel',
  '专为悬疑推理小说设计的创作方法。以刑侦、法医、心理画像为核心工具，主角通过逻辑推理与现场勘查破解一件件诡异凶杀案，逐步揭开隐藏在系列案件背后的巨大阴谋。核心看点：严密的推理过程、鲜活的嫌疑人群像、层层反转的真相。',
  '悬疑推理',
  'Mystery',
  'zh',
  '["setting","character","scene","organization"]',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  novel_type_zh = VALUES(novel_type_zh),
  visible_categories = VALUES(visible_categories),
  updated_at = NOW();

SET @method_id = (SELECT id FROM novel_creation_method WHERE name_zh = '悬疑推理小说创作' LIMIT 1);

-- ============================================================
-- 2. 创建模块类型（8 个）
-- ============================================================

-- 2.1 故事钩子（setting, singleton）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '故事钩子',
  'Story Hook',
  '引爆读者好奇心的核心悬念钩子，包含开篇案件吸引力、主角登场方式与整体阴谋的第一缕气息',
  '{"type":"object","required":["故事钩子"],"properties":{"故事钩子":{"type":"string","title":"故事钩子","description":"一句话：让读者必须继续读下去的核心悬念。包含案件的诡异之处和主角面临的核心困境","x-uiWidget":"textarea","useForAI":true},"核心谜题":{"type":"string","title":"核心谜题","description":"这个故事的中心问题——不只是「谁是凶手」，而是更深层的「为什么」或「怎么可能」","x-uiWidget":"textarea","useForAI":true},"开篇事件":{"type":"string","title":"开篇事件","description":"第一个案件或触发主角介入的关键事件，以及它与后续大阴谋的隐秘关联","x-uiWidget":"textarea","useForAI":true},"读者预期":{"type":"string","title":"读者预期","description":"承诺读者的核心体验：是烧脑解谜的智识满足？是压抑沉郁的氛围体验？还是对人性黑暗的深刻揭示？","x-uiWidget":"textarea","useForAI":true}}}',
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

-- 2.2 主角设定（setting, singleton）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '主角设定',
  'Protagonist',
  '侦探/法医/刑警等主角的职业背景、侦查方法论与核心弱点设定',
  '{"type":"object","required":["姓名","职业"],"properties":{"姓名":{"type":"string","title":"姓名","description":"主角姓名","useForAI":true},"职业":{"type":"string","title":"职业","enum":["刑警/警探","法医","心理画像师","私家侦探","检察官","记者/调查记者","其他"],"x-uiWidget":"select","useForAI":true},"职业背景":{"type":"string","title":"职业背景","description":"主角的从业经历、所在机构、资历与社会关系网络","x-uiWidget":"textarea","useForAI":true},"侦查风格":{"type":"string","title":"侦查风格","enum":["逻辑推演型（演绎推理，重证据链）","直觉洞察型（敏锐的人性感知）","科学分析型（依赖法医/技术手段）","心理博弈型（读人、识谎、画像）","多线并行型（同时追查多条线索）"],"x-uiWidget":"select","useForAI":true},"核心技能":{"type":"string","title":"核心技能","description":"主角最擅长的一至两项专业能力（如：血迹形态分析、犯罪心理画像、审讯技巧、法庭辩论等）","x-uiWidget":"textarea","useForAI":true},"性格特征":{"type":"string","title":"性格特征","description":"主角的核心性格特质，以及这些特质如何影响其侦查方式","x-uiWidget":"textarea","useForAI":true},"致命弱点":{"type":"string","title":"致命弱点","description":"影响破案的心理创伤、执念或道德盲区——优秀的悬疑主角的弱点往往与其破案能力来自同一源头","x-uiWidget":"textarea","useForAI":true},"推理方法论":{"type":"string","title":"推理方法论","description":"主角解决谜题的独特思维框架——是什么让他和普通警察不一样","x-uiWidget":"textarea","useForAI":true}}}',
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

-- 2.3 世界背景（setting, singleton）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '世界背景',
  'Worldbuilding',
  '故事发生的时代、城市与执法体系环境，以及影响案件走向的社会生态',
  '{"type":"object","required":["时代背景","城市设定"],"properties":{"时代背景":{"type":"string","title":"时代背景","enum":["当代都市（2000年至今）","1980-1990年代","改革开放早期","民国时期","清末民初","架空近代","其他"],"x-uiWidget":"select","useForAI":true},"城市设定":{"type":"string","title":"城市设定","description":"故事发生的主要城市或地区，以及这个地方的性格（沿海还是内陆、繁华还是偏僻、特殊的地理文化特征）","x-uiWidget":"textarea","useForAI":true},"执法体系":{"type":"string","title":"执法体系","description":"警察/司法体系的运作方式、腐败程度、主角所在单位的特殊性（如刑侦大队、专案组、法医室等）","x-uiWidget":"textarea","useForAI":true},"社会生态":{"type":"string","title":"社会生态","description":"影响案件的社会背景：阶层对立、利益集团、地方权力结构、潜规则体系","x-uiWidget":"textarea","useForAI":true},"调查障碍":{"type":"string","title":"调查障碍","description":"主角在调查中面临的现实阻力：权力干预、证据销毁、信息封锁、体制限制","x-uiWidget":"textarea","useForAI":true}}}',
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

-- 2.4 阴谋框架（setting, singleton）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '阴谋框架',
  'Conspiracy',
  '隐藏在系列案件背后的大阴谋结构：幕后主脑、核心利益、真相层次与主角的命运交缠',
  '{"type":"object","required":["阴谋类型","核心秘密"],"properties":{"阴谋类型":{"type":"string","title":"阴谋类型","enum":["政治腐败与权力黑幕","犯罪组织的系统性运作","家族/企业的世代秘密","连环杀手的扭曲逻辑","多方势力的利益博弈","历史旧案的延续报复","其他"],"x-uiWidget":"select","useForAI":true},"核心秘密":{"type":"string","title":"核心秘密","description":"大阴谋的本质：多年来被掩埋的真相是什么？谁有能力掩埋它？为什么现在开始浮出水面？","x-uiWidget":"textarea","useForAI":true},"案件关联逻辑":{"type":"string","title":"案件关联逻辑","description":"各个案件与大阴谋的关联方式——是凶手主动制造掩护？是受害者触碰了核心秘密？还是看似无关的案件实为同一根系？","x-uiWidget":"textarea","useForAI":true},"真相层次":{"type":"string","title":"真相层次","description":"阴谋真相的揭露节奏：每次揭开一层表皮，下面是更深的秘密。设计2-3个反转点","x-uiWidget":"textarea","useForAI":true},"主角的命运关联":{"type":"string","title":"主角的命运关联","description":"主角为何是揭开这个阴谋的关键人？他与阴谋的过去有何关联？（亲历者？受害者家属？或只是误打误撞？）","x-uiWidget":"textarea","useForAI":true},"幕后代价":{"type":"string","title":"幕后代价","description":"揭开阴谋对主角的个人代价——他将失去什么，或发现什么不想知道的真相","x-uiWidget":"textarea","useForAI":true}}}',
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
  '叙事视角、推理节奏与悬疑氛围的整体风格定位',
  '{"type":"object","required":["叙事视角","推理节奏"],"properties":{"叙事视角":{"type":"string","title":"叙事视角","enum":["第一人称限知（侦探视角，读者与主角同步）","第三人称限知（紧贴主角，偶尔切换配角）","双线叙事（侦探线 + 罪犯/受害者线）","多视角交叉（多个角色视角轮换）","倒叙结构（已知结局，追溯过程）"],"x-uiWidget":"select","useForAI":true},"推理节奏":{"type":"string","title":"推理节奏","enum":["快节奏连环案（高频案件，节奏紧绷）","慢工细活深挖（单案精雕细琢，信息逐步释放）","节奏多变（紧张与舒缓交替，张弛有度）","碎片化推进（线索散落，拼图式揭秘）"],"x-uiWidget":"select","useForAI":true},"悬疑氛围":{"type":"string","title":"悬疑氛围","enum":["冷峻克制（陈述式，让事实说话）","压抑沉郁（社会暗面的沉重质感）","紧张刺激（追逐、对抗、险境频出）","智识游戏（以解谜为乐，推理本身是享受）","人性拷问（案件是镜子，照出人性幽暗）"],"x-uiWidget":"select","useForAI":true},"暴力尺度":{"type":"string","title":"暴力尺度","enum":["写实成人（犯罪细节不回避）","适度暗示（有冲击但不露骨）","点到为止（以情绪代替描写）"],"x-uiWidget":"radio","useForAI":true},"禁用词语":{"type":"string","title":"禁用词语","description":"写作中应避免的词汇、句式或表达方式","x-uiWidget":"textarea","useForAI":true}}}',
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

-- 2.6 角色（character, 非singleton）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '角色',
  'Character',
  '悬疑推理小说中的各类人物：主角、搭档、嫌疑人、受害者、证人与幕后主使',
  '{"type":"object","x-titleField":"姓名","required":["姓名","角色定位"],"properties":{"姓名":{"type":"string","title":"姓名","description":"角色姓名，不含括号注释","useForAI":true},"角色定位":{"type":"string","title":"角色定位","enum":["主角","搭档/助手","嫌疑人","受害者","证人","幕后主使","线人/情报源","对立方（腐败警察/竞争对手）","其他"],"x-uiWidget":"radio","useForAI":true},"性别":{"type":"string","title":"性别","enum":["男","女","其他"],"x-uiWidget":"radio","useForAI":true},"年龄":{"type":"string","title":"年龄","description":"角色年龄或年龄段","useForAI":true},"职业/身份":{"type":"string","title":"职业/身份","description":"角色的社会身份和职业","useForAI":true},"与主角关系":{"type":"string","title":"与主角关系","description":"这个角色与主角的关系动态，以及关系可能如何演变","x-uiWidget":"textarea","useForAI":true},"核心动机":{"type":"string","title":"核心动机","description":"驱动这个角色行动的根本欲望——不是表面理由，而是内心深处的驱动力","x-uiWidget":"textarea","useForAI":true},"隐藏秘密":{"type":"string","title":"隐藏秘密","description":"这个角色不愿让人知道的秘密（可能是线索、可能是过去、可能是内心的）","x-uiWidget":"textarea","useForAI":true},"心理特征":{"type":"string","title":"心理特征","description":"角色的性格核心与行为模式","x-uiWidget":"textarea","useForAI":true},"当前处境":{"type":"string","title":"当前处境","description":"角色在故事当前阶段的处境","isDynamic":true},"嫌疑状态":{"type":"string","title":"嫌疑状态","description":"当前对主角而言的嫌疑/信任程度","isDynamic":true}}}',
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

-- 2.7 案发地点（scene, 非singleton）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '案发地点',
  'Crime Scene',
  '犯罪现场与重要调查地点，包含空间氛围、隐藏线索与案件关联',
  '{"type":"object","x-titleField":"地点名称","required":["地点名称","地点类型"],"properties":{"地点名称":{"type":"string","title":"地点名称","useForAI":true},"地点类型":{"type":"string","title":"地点类型","enum":["犯罪现场（第一案发地）","抛尸地点/二次现场","嫌疑人据点/住所","机构场所（公司、医院、政府）","公共空间（广场、车站、市场）","隐秘地点（废弃建筑、地下空间）","证据隐藏地"],"x-uiWidget":"select","useForAI":true},"地点描述":{"type":"string","title":"地点描述","description":"空间布局、感官细节与第一眼印象——这个地方给人什么感觉","x-uiWidget":"textarea","useForAI":true},"关键线索":{"type":"string","title":"关键线索","description":"这个地点中隐藏的关键物证、痕迹或信息，以及它们揭示的内容","x-uiWidget":"textarea","useForAI":true},"案件关联":{"type":"string","title":"案件关联","description":"这个地点在整体案件或大阴谋中扮演的角色","x-uiWidget":"textarea","useForAI":true},"控制方":{"type":"string","title":"控制方","description":"目前控制或占有这个地点的人或势力","isDynamic":true},"勘查状态":{"type":"string","title":"勘查状态","description":"已勘查/已封锁/已破坏/线索未发现/已清场","isDynamic":true}}}',
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

-- 2.8 势力（organization, 非singleton）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '势力',
  'Faction',
  '隐藏在案件背后的犯罪集团、腐败机构与秘密团体',
  '{"type":"object","x-titleField":"势力名称","required":["势力名称","势力类型"],"properties":{"势力名称":{"type":"string","title":"势力名称","useForAI":true},"势力类型":{"type":"string","title":"势力类型","enum":["犯罪集团（黑帮、毒枭、人口贩卖）","腐败机构（警察内鬼、司法黑幕）","秘密团体（地下组织、邪教）","商业集团（洗钱、权钱交易）","政治派系（权力争斗、利益集团）","家族势力（世代积累的罪恶）","其他"],"x-uiWidget":"select","useForAI":true},"对外形象":{"type":"string","title":"对外形象","description":"这个势力在公众眼中是什么——合法外壳、慈善机构还是普通商业组织","x-uiWidget":"textarea","useForAI":true},"真实目的":{"type":"string","title":"真实目的","description":"掩盖在合法外壳下的真实利益与目标","x-uiWidget":"textarea","useForAI":true},"影响力范围":{"type":"string","title":"影响力范围","description":"这个势力渗透的领域：行业、地域、政府层级","x-uiWidget":"textarea","useForAI":true},"与阴谋的关联":{"type":"string","title":"与阴谋的关联","description":"在大阴谋中扮演的角色：是主导者、执行者、知情者还是被利用方","x-uiWidget":"textarea","useForAI":true},"核心人物":{"type":"string","title":"核心人物","description":"势力中的关键人物及其在组织中的地位","x-uiWidget":"textarea","useForAI":true},"内部弱点":{"type":"string","title":"内部弱点","description":"势力内部的裂缝——异见者、竞争关系、历史污点或可被利用的漏洞","x-uiWidget":"textarea","useForAI":true},"当前实力":{"type":"string","title":"当前实力","description":"势力目前的规模与影响力","isDynamic":true},"与主角关系":{"type":"string","title":"与主角关系","description":"这个势力对主角的态度与处置方式","isDynamic":true}}}',
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
