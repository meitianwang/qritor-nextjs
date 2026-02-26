-- -----------------------------------------------------------------------------
-- 硬科幻 (Hard Sci-Fi) 创作方法初始化 SQL
-- -----------------------------------------------------------------------------

SET @method_id = 75; 
SET @method_name = '硬科幻 (Hard Sci-Fi)';
SET @method_desc = '主打"严谨物理定律与科学推演"的科幻基石。情节围绕解决具体的科学危机、天体物理奇观或技术工程难题展开，逻辑严密，具有宏大的时代或宇宙背景。';
SET @novel_type = '科幻';
SET @language = 'zh';
SET @visible_categories = '["setting", "character", "scene", "prop", "organization"]';

-- 1. 创建创作方法
INSERT INTO novel_creation_method 
  (id, name, description, novel_type, language, visible_categories, is_preset, status, created_at, updated_at)
VALUES
  (@method_id, @method_name, @method_desc, @novel_type, @language, @visible_categories, 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
  name = VALUES(name), description = VALUES(description), novel_type = VALUES(novel_type),
  language = VALUES(language), visible_categories = VALUES(visible_categories),
  is_preset = VALUES(is_preset), status = VALUES(status), updated_at = NOW();

-- 模块ID预设
SET @m_hook_id  = 8170501750000000001;
SET @m_world_id = 8170501750000000002;
SET @m_style_id = 8170501750000000003;
SET @m_char_id  = 8170501750000000004;
SET @m_scene_id = 8170501750000000005;
SET @m_prop_id  = 8170501750000000006;
SET @m_org_id   = 8170501750000000007;

-- -------------------------
-- 3.1 科学危机钩子 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_hook_id, 
    '科学危机钩子', 
    '引发整部书技术推演和剧情发展的根本性科学灾难或物理异象。', 
    '{"type": "object", "title": "科学危机", "properties": {"危机类型": {"title": "危机类型", "type": "string", "enum": ["天体运行轨道变异/宇宙灾害", "基础物理法则被颠覆或锁死", "前沿工程实验失控引发的连锁反应", "地外极度先进文明的技术碾压降临"], "x-uiWidget": "radio", "useForAI": true}, "观测第一现场": {"title": "观测第一现场", "type": "string", "description": "人类是如何第一次察觉到这个致命危机的？（如：大型强子对撞机的异常数据、射电望远镜接收到的规律频段、宇宙微波背景辐射的红移异变）", "x-uiWidget": "textarea", "useForAI": true}, "对地球现有文明的毁灭性预估": {"title": "对文明的毁灭预估", "type": "string", "description": "这场危机在几年/几百年后将以怎样符合物理学的方式摧毁人类？（如：太阳氦闪导致内系行星被吞没、引力常数改变导致大气层剥离）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["危机类型", "观测第一现场", "对地球现有文明的毁灭性预估"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()

ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.2 宇宙与时代纪元 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_world_id, 
    '宇宙法则与技术纪元', 
    '严格遵循热力学第二定律、相对论等定海神针的世界观运转底层逻辑。', 
    '{"type": "object", "title": "宇宙观与纪元", "properties": {"技术纪元": {"title": "技术纪元", "type": "string", "enum": ["近未来(可控核聚变/量子计算机初步商用阶段)", "太阳系航海时代(行星际殖民/轨道电梯普及)", "恒星际跃迁时代(曲率驱动/ Antimatter湮灭引擎)"], "x-uiWidget": "radio", "useForAI": true}, "核心依托的物理学支柱": {"title": "物理学支柱", "type": "string", "description": "本书的大背景主要受制于哪一条物理定律？（如：光速不可超越的铁律导致星际交流的极度滞后、热力学熵增走向的热寂）", "x-uiWidget": "textarea", "useForAI": true}, "人类社会形态演变": {"title": "人类社会形态演变", "type": "string", "description": "由于高科技的发展，人类的政体、伦理、经济模型发生了什么符合逻辑的巨变？（如：全人类联合政府危机、意识上传导致肉身贬值、冷冻休眠造成的代际伦理割裂）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["技术纪元", "核心依托的物理学支柱", "人类社会形态演变"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()

ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.3 文风设定 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_style_id, 
    '文风设定', 
    '理智、宏大、带有学术严谨性和宇宙史诗感的行文规范。', 
    '{"type": "object", "title": "文风设定", "properties": {"语言风格": {"title": "语言风格", "type": "string", "enum": ["宏大纪传体与历史冷酷感", "硬核的技术细节说明文式叙事", "前沿科学家的第一人称研究日志"], "x-uiWidget": "radio", "useForAI": true}, "学术感与尺度描写": {"title": "学术感与尺度描写", "type": "string", "description": "指导原则：必须包含具体的物理量纲级对比（如光年、天文单位、帕斯卡、开尔文）。用极度枯燥但震撼的数据来展示宇宙的浩瀚与人类的渺小，避免感性的玄乎修辞。", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["语言风格"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()

ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.4 科学家与时代执行者 (character) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_char_id, 
    '技术执行者与智库', 
    '主角往往不是通过武力，而是通过脑力、公式计算和工程设计来改变世界命运的专业人员。', 
    '{"type": "object", "title": "人物档案", "x-titleField": "姓名", "properties": {"姓名": {"title": "姓名与职称", "type": "string", "description": "如：汪教授、舰队总席执行官罗辑", "useForAI": true}, "职能归属": {"title": "职能归属", "type": "string", "enum": ["理论物理奠基人", "大型航天工程总师/指挥官", "基础应用科学/材料学研究员", "军方代表/舰队舰长", "面临危机的普通社会切片人"], "x-uiWidget": "select", "useForAI": true}, "核心学术主张/信仰": {"title": "核心学术主张", "type": "string", "description": "他对这场危机的解决思路是什么？（如：主张逃亡主义建造世代飞船、或者是主张防御主义在木星建立掩体城）", "x-uiWidget": "textarea", "useForAI": true}, "面临的技术壁垒与人性挣扎": {"title": "面临的技术壁垒与人性挣扎", "type": "string", "description": "因为科学的冷酷无情，他必须做出怎样反常规人性的决策？（如：为了保证飞船达到逃逸速度，必须牺牲掉一半休眠的平民来抛弃质量）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["姓名", "职能归属", "核心学术主张/信仰"]}',
    @method_id, 'character', 1, 0, 1, NOW(), NOW()

ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.5 空间站与天体奇观 (scene) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_scene_id, 
    '宏大空间与天体工程(场景)', 
    '不是简单的房子，而是跨度极大的轨道结构、深空造物或极端天区。', 
    '{"type": "object", "title": "宏大空间", "x-titleField": "建构物/天区名称", "properties": {"建构物/天区名称": {"title": "名称", "type": "string", "description": "如：环地球赤道同步轨道电梯、木星表面大红斑风暴区、半人马座阿尔法星系拉格朗日点、奥尔特星云边缘基地", "useForAI": true}, "物理环境基数": {"title": "物理环境基数", "type": "string", "description": "此处的重力G值有多少？环境温度？大气压或者真空宇宙射线强度？", "x-uiWidget": "textarea", "useForAI": true}, "工业/观测功能设定": {"title": "工业/观测功能设定", "type": "string", "description": "在这个地方建造这座设施的作用（如：利用黑洞视界边缘的强引力进行时间膨胀实验、开采小行星带的重金属）", "x-uiWidget": "textarea", "useForAI": true}, "技术灾难隐患": {"title": "技术灾难隐患", "type": "string", "description": "这个工程最大的物理脆弱点（如：如果微陨石击中维持离心力的轴承，整个空间城将因角动量解体坠毁）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["建构物/天区名称", "物理环境基数", "工业/观测功能设定"]}',
    @method_id, 'scene', 1, 0, 1, NOW(), NOW()

ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.6 核心技术装置系统 (prop) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_prop_id, 
    '核心科学装置/理论(道具)', 
    '推进硬科幻剧情的核心生产力工具，或引发现实崩塌的终极兵器。', 
    '{"type": "object", "title": "科学装置", "x-titleField": "装置系统名", "properties": {"装置系统名": {"title": "装置系统名", "type": "string", "description": "如：三维展开的水滴探测器、强相互作用力材料装甲、光粒打击武器、曲率驱动引擎", "useForAI": true}, "物理运行原理(伪科学说明)": {"title": "物理运行原理", "type": "string", "description": "看似严密实则自洽的技术设定（如：通过熨平空间曲率来迫使前方空间收缩、后方空间膨胀，从而推着飞船前进超光速）", "x-uiWidget": "textarea", "useForAI": true}, "技术瓶颈/研发代价": {"title": "研发代价", "type": "string", "description": "人类为了造出这个东西耗费了什么？或者它受限于什么定律无法完美？", "x-uiWidget": "textarea", "useForAI": true}, "战场与民用应用表现": {"title": "应用表现", "type": "string", "description": "一旦投入使用，对物质世界的具体打击表现（如：水滴用绝对光滑的表面撞穿了整个联合舰队）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["装置系统名", "物理运行原理(伪科学说明)"]}',
    @method_id, 'prop', 1, 0, 1, NOW(), NOW()

ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.7 跨国机构与异星文明 (organization) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_org_id, 
    '星际阵营与联合政府', 
    '在面临宇宙尺度危机时，掌握技术资源的大型实体或试图收割地球的高等文明。', 
    '{"type": "object", "title": "星际阵营", "x-titleField": "阵营名称", "properties": {"阵营名称": {"title": "阵营名称", "type": "string", "description": "如：行星防御理事会(PDC)、地球联合舰队、降临派反叛军、某个距离光年外的高等沉默文明", "useForAI": true}, "文明层级/技术量级": {"title": "技术量级卡尔达肖夫指数", "type": "string", "enum": ["0.7型(当前地球)", "I型(行星级掌握者)", "II型(恒星级戴森球建造者)", "III型(星系级神级文明)", "难以理解的降维打击文明"], "x-uiWidget": "select", "useForAI": true}, "阵营最高指令": {"title": "阵营最高指令", "type": "string", "description": "这个组织的终极追求是什么？（如：“存活是一切的前提”、“消灭所有暴露坐标的低等虫子”）", "x-uiWidget": "textarea", "useForAI": true}, "对地球的战略部署": {"title": "战略部署", "type": "string", "description": "他们采取的高端手段（如：发送智子锁死基础科学、或是启动逃亡派飞船计划）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["阵营名称", "阵营最高指令", "对地球的战略部署"]}',
    @method_id, 'organization', 1, 0, 1, NOW(), NOW()

ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();
