-- -----------------------------------------------------------------------------
-- 民俗现代融合流 (New Chinese Horror) 创作方法初始化 SQL
-- -----------------------------------------------------------------------------

SET @method_id = 70; 
SET @method_name = '民俗现代融合流';
SET @method_desc = '主打"古老封建迷信与现代高科技都市融合"的灵异流派。利用极具反差感的新旧冲突（如大数据算命、实验室炼尸）产生独特的恐怖感。';
SET @novel_type = '悬疑灵异';
SET @language = 'zh';
SET @visible_categories = '["setting", "character", "scene", "prop", "organization"]';

-- 1. 创建创作方法
INSERT INTO novel_creation_method 
  (id, name, description, novel_type, language, visible_categories, is_preset, status, created_at, updated_at)
VALUES
  (@method_id, @method_name, @method_desc, @novel_type, @language, @visible_categories, 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
  name = VALUES(name), description = VALUES(description), novel_type = VALUES(novel_type), 
  language = VALUES(language), visible_categories = VALUES(visible_categories), is_preset = VALUES(is_preset), status = VALUES(status), updated_at = NOW();

-- 模块ID预设
SET @m_hook_id = 8170501650000000001;
SET @m_world_id = 8170501650000000002;
SET @m_style_id = 8170501650000000003;
SET @m_char_id = 8170501650000000004;
SET @m_scene_id = 8170501650000000005;
SET @m_prop_id = 8170501650000000006;
SET @m_org_id = 8170501650000000007;

-- -------------------------
-- 3.1 故事钩子 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_hook_id, 
    '故事钩子', 
    '设定主角卷入都市民俗诡异事件的起因。', 
    '{"type": "object", "title": "故事钩子", "properties": {"切入点": {"title": "切入点", "type": "string", "enum": ["接手带禁忌的现代业务", "继承被遗忘的民俗遗产", "发现高科技外衣下的诡异真相"], "x-uiWidget": "radio", "useForAI": true}, "异常现象": {"title": "异常现象", "type": "string", "description": "看似现代生活中的小毛病，实则是民俗反噬（如：扫地机器人总在半夜对着某个空角落转圈磕头）", "x-uiWidget": "textarea", "useForAI": true}, "传统与科技冲突点": {"title": "传统与科技冲突点", "type": "string", "description": "第一个震撼读者的现代与民俗结合点（如：用微信群发电子符箓招魂，或者服务器机房里供着狐仙）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["切入点", "异常现象", "传统与科技冲突点"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
);

-- -------------------------
-- 3.2 赛博民俗世界观 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_world_id, 
    '赛博民俗世界观', 
    '隐藏在现代社会运转逻辑背后的传统民俗暗网。', 
    '{"type": "object", "title": "赛博民俗世界观", "properties": {"民俗复苏方式": {"title": "民俗复苏方式", "type": "string", "enum": ["被资本和科技收编利用", "蛰伏在现代建筑结构的阴影中", "通过网络模因和算法大规模传播"], "x-uiWidget": "radio", "useForAI": true}, "社会表面秩序": {"title": "社会表面秩序", "type": "string", "description": "普通人眼中的社会是什么样的？他们如何合理化那些灵异现象？（比如把借寿导致的大规模猝死当成加班过劳）", "x-uiWidget": "textarea", "useForAI": true}, "里世界运行法则": {"title": "里世界运行法则", "type": "string", "description": "懂得民俗和科技的人是如何交易和解决问题的？（比如用比特币支付折寿的因果债）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["民俗复苏方式", "社会表面秩序", "里世界运行法则"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
);

-- -------------------------
-- 3.3 文风设定 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_style_id, 
    '文风设定', 
    '极具反差感的新旧碰撞文风。', 
    '{"type": "object", "title": "文风设定", "properties": {"语言风格": {"title": "语言风格", "type": "string", "enum": ["都市悬疑的写实质感", "带着荒诞感的黑色幽默", "克制冷静的调查官口吻"], "x-uiWidget": "radio", "useForAI": true}, "核心冲突描写": {"title": "核心冲突描写", "type": "string", "description": "描写指导：强调用最理性的现代科学词汇（如电磁波、算力、熵增）去解释极其封建迷信的行为（如请仙、赶尸）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["语言风格"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
);

-- -------------------------
-- 3.4 角色 (character) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_char_id, 
    '角色', 
    '穿梭在霓虹灯与纸扎人之间的角色。', 
    '{"type": "object", "title": "角色", "x-titleField": "姓名", "properties": {"姓名": {"title": "姓名", "type": "string", "description": "真实姓名或圈内代号（如：量化法师老李）", "useForAI": true}, "角色定位": {"title": "角色定位", "type": "string", "enum": ["主角 (科技与民俗双修/破局者)", "传统手艺人 (守旧派)", "现代作死者 (被反噬的企业高管/网红)", "异类 (被现代社会边缘化的精怪)"], "x-uiWidget": "select", "useForAI": true}, "表面职业": {"title": "表面职业", "type": "string", "description": "在现代社会的合法身份（如：程序员、外卖员、物业经理）", "useForAI": true}, "暗中手段/禁忌": {"title": "暗中手段/禁忌", "type": "string", "description": "掌握的民俗秘术，或是因为滥用科技结合民俗而背负的诅咒", "x-uiWidget": "textarea", "useForAI": true}, "冲突体现": {"title": "新旧冲突点", "type": "string", "description": "在这个角色身上，如何体现传统与现代的矛盾？（比如是个茅山道士但重度依赖Apple Watch测算良辰吉日）", "x-uiWidget": "textarea", "useForAI": true}, "称呼": {"type": "array", "title": "称呼", "items": {"type": "object", "properties": {"称呼者": {"type": "string"}, "称呼": {"type": "string"}}, "required": ["称呼者", "称呼"]}}}, "required": ["姓名", "角色定位", "表面职业"]}',
    @method_id, 'character', 1, 0, 1, NOW(), NOW()
);

-- -------------------------
-- 3.5 场景 (scene) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_scene_id, 
    '都市民俗场景(场景)', 
    '钢筋水泥掩盖下的风水凶局或养尸地。', 
    '{"type": "object", "title": "都市民俗场景", "x-titleField": "场景名", "properties": {"场景名": {"title": "场景名", "type": "string", "description": "如：被改成九阴聚财局的CBD立交桥、藏着走蛟的城市下水道", "useForAI": true}, "现代伪装": {"title": "现代伪装", "type": "string", "description": "普通人眼里这是个什么地方？", "x-uiWidget": "textarea", "useForAI": true}, "民俗真相": {"title": "民俗真相", "type": "string", "description": "在风水师眼里，这里的建筑结构、光影和人员流动构成了什么阵法或仪式？", "x-uiWidget": "textarea", "useForAI": true}, "核心诡异现象": {"title": "核心诡异现象", "type": "string", "description": "这里会发生什么诡异的事情（如电梯永远停在负四层、摄像头经常拍到纸人）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["场景名", "现代伪装", "民俗真相"]}',
    @method_id, 'scene', 1, 0, 1, NOW(), NOW()
);

-- -------------------------
-- 3.6 赛博阴物 (prop) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_prop_id, 
    '赛博阴物(道具)', 
    '被高科技赋能的法器，或被民俗污染的电子产品。', 
    '{"type": "object", "title": "赛博阴物", "x-titleField": "物品名", "properties": {"物品名": {"title": "物品名", "type": "string", "description": "如：AI算命罗盘、浸过黑狗血的U盘、用骨灰烧制的芯片", "useForAI": true}, "外观描述": {"title": "外观描述", "type": "string", "description": "结合了电路板与符文、或是现代工业质感与粗糙手工民俗感的物品", "x-uiWidget": "textarea", "useForAI": true}, "传统功效": {"title": "传统功效", "type": "string", "description": "本来在过去是用来做什么的（如招魂、辟邪）", "useForAI": true}, "现代异变": {"title": "现代异变", "type": "string", "description": "结合科技后产生了什么更高效、也更惊悚的功效或副作用（如：招魂范围扩大到全网基站）", "x-uiWidget": "textarea", "useForAI": true}, "获取途径": {"title": "获取途径", "type": "string"}}, "required": ["物品名", "传统功效", "现代异变"]}',
    @method_id, 'prop', 1, 0, 1, NOW(), NOW()
);

-- -------------------------
-- 3.7 现代民俗组织 (organization) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_org_id, 
    '企业/门派(组织)', 
    '用公司架构管理的封建迷信组织，或利用风水大发横财的现代企业。', 
    '{"type": "object", "title": "现代民俗组织", "x-titleField": "组织名", "properties": {"组织名": {"title": "组织名", "type": "string", "description": "通常是极具科技感/商业感的名字掩盖其本质（如：长生生物科技、天机大数据风投）", "useForAI": true}, "企业愿景(表面)": {"title": "企业愿景(表面)", "type": "string", "description": "对外宣称的业务类型", "useForAI": true}, "核心密谋(里)": {"title": "核心密谋(里)", "type": "string", "description": "实际在利用什么民俗手段掠夺气运或折寿抽血", "x-uiWidget": "textarea", "useForAI": true}, "运作机制": {"title": "运作机制", "type": "string", "description": "如何将传统仪式工业化（如：把炼尸流水线化，用KPI考核香火）", "x-uiWidget": "textarea", "useForAI": true}, "内部层级": {"title": "内部层级", "type": "string", "description": "比如：表面是CEO、总监，实际对应掌门、香主", "x-uiWidget": "textarea"}}, "required": ["组织名", "企业愿景(表面)", "核心密谋(里)"]}',
    @method_id, 'organization', 1, 0, 1, NOW(), NOW()
);
