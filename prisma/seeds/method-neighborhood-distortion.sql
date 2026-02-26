-- -----------------------------------------------------------------------------
-- 邻里关系畸变流 (Neighborhood Distortion Horror) 创作方法初始化 SQL
-- -----------------------------------------------------------------------------

SET @method_id = 73; 
SET @method_name = '邻里关系畸变流';
SET @method_desc = '主打"隔墙有耳的窥探欲与集体疯狂"的悬疑惊悚流派。主角发现看似普通的邻居们各自怀揣着不可告人的秘密或非人身份，在封闭的筒子楼或公寓中展开长期的心理压迫与暗中对抗。';
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
SET @m_hook_id  = 8170501730000000001;
SET @m_world_id = 8170501730000000002;
SET @m_style_id = 8170501730000000003;
SET @m_char_id  = 8170501730000000004;
SET @m_scene_id = 8170501730000000005;
SET @m_prop_id  = 8170501730000000006;
SET @m_org_id   = 8170501730000000007;

-- -------------------------
-- 3.1 窥探钩子 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_hook_id, 
    '入住窥探钩子', 
    '主角入住并因为一次偶然的窥探或错敲门引发怀疑。', 
    '{"type": "object", "title": "故事钩子", "properties": {"入住契机": {"title": "入住契机", "type": "string", "description": "主角为什么搬进这栋楼（如：贪图便宜的凶宅、为了追求安静的社恐、躲避仇家）", "x-uiWidget": "textarea", "useForAI": true}, "第一次异样摩擦": {"title": "第一次异样摩擦", "type": "string", "description": "非常日常却诡异的接触（如：楼上每晚掉落弹珠的声音、邻居借拿错快递为由死盯着屋里看）", "x-uiWidget": "textarea", "useForAI": true}, "核心窥视事件": {"title": "核心窥视事件", "type": "string", "description": "主角不可遏制的偷窥欲爆发（如：透过猫眼看到对门在把内脏倒进垃圾袋、从阳台看到楼下在进行奇怪的膜拜）", "x-uiWidget": "textarea", "useForAI": true}, "被发现的危机感": {"title": "被发现的危机感", "type": "string", "description": "偷窥的单向视线变成了双向（如：主角看着猫眼时，外面也有一个红血丝的眼睛贴着猫眼看进来）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["入住契机", "第一次异样摩擦", "核心窥视事件", "被发现的危机感"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
);

-- -------------------------
-- 3.2 楼栋畸变生态 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_world_id, 
    '楼栋畸变生态', 
    '并非普通的灵异区域，而是由极端人性扭曲和群体的不可名状结成的生态。', 
    '{"type": "object", "title": "畸变生态", "properties": {"楼栋生态本质": {"title": "楼栋生态本质", "type": "string", "enum": ["一群变态罪犯/疯子的集体伪装", "为了某个共同秘密而合谋的封闭村落模式", "被某种非人异端(如虫族/邪神)寄生或同化的人间农场", "为了掩盖一桩陈年旧案的共谋局"], "x-uiWidget": "radio", "useForAI": true}, "表面伪善秩序": {"title": "表面伪善秩序", "type": "string", "description": "白天大家是怎样的一副好邻居嘴脸（互相送水果、群里接龙买菜），这与晚上的疯狂形成剧烈反差", "x-uiWidget": "textarea", "useForAI": true}, "对新人的同化/排异机制": {"title": "对新人的同化机制", "type": "string", "description": "邻居们是如何一步步把新搬来的主角拖下水的？（例如强迫吃下某种特产、拉进某个地下室的深夜集会）", "x-uiWidget": "textarea", "useForAI": true}, "空间隔绝感": {"title": "空间隔绝感", "type": "string", "description": "虽然身处闹市，但这栋楼为什么像在一座孤岛上？（如隔音极差只能听见彼此、报警了永远没车来）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["楼栋生态本质", "表面伪善秩序", "对新人的同化/排异机制"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
);

-- -------------------------
-- 3.3 文风设定 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_style_id, 
    '文风设定', 
    '强调“隔门/隔墙”的逼仄心理空间与重度妄想。', 
    '{"type": "object", "title": "文风设定", "properties": {"语言风格": {"title": "语言风格", "type": "string", "enum": ["第一人称的重度偏执神经质", "极致细腻的密闭空间悬疑侦探风", "冰冷的“上帝视角”监控录像体"], "x-uiWidget": "radio", "useForAI": true}, "听觉与视觉放大描述": {"title": "听觉与视觉放大描述", "type": "string", "description": "描写指导：不要直接写妖魔鬼怪，大篇幅描写水管里沉闷的敲击声、地板下的拖拽声、发臭的门缝液体和猫眼里扭曲的鱼眼视野", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["语言风格"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
);

-- -------------------------
-- 3.4 畸变邻居 (character) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_char_id, 
    '畸变邻居与租客档案', 
    '拥有双面生活和极端癖好的同楼人员。', 
    '{"type": "object", "title": "邻居档案", "x-titleField": "室号与称呼", "properties": {"室号与称呼": {"title": "室号与称呼", "type": "string", "description": "如：302的独居寡妇、404的秃头IT男、顶楼的房东老太", "useForAI": true}, "表面形象": {"title": "表面形象", "type": "string", "description": "白天里极度平凡甚至友善的样子", "x-uiWidget": "textarea", "useForAI": true}, "深夜癖好/真实面目": {"title": "深夜真实面目", "type": "string", "description": "主角通过墙壁缝隙或跟踪发现的毛骨悚然的秘密（如在浴缸里融化骨头、其实是某种脱皮生物）", "x-uiWidget": "textarea", "useForAI": true}, "危险互动点": {"title": "危险互动点", "type": "string", "description": "主角因为什么小事和TA结下了死亡因果（如捡到了TA掉落的黑色塑料袋、无意中借了TA一把带血的菜刀）", "x-uiWidget": "textarea", "useForAI": true}, "对主角的态度": {"title": "对主角的态度", "type": "string", "enum": ["病态的迷恋与跟踪", "想要杀之而后快的灭口", "伪装成白莲花设下吃人陷阱", "暗中观察的麻木者"], "x-uiWidget": "select"}, "称呼": {"type": "array", "title": "称呼", "items": {"type": "object", "properties": {"称呼者": {"type": "string"}, "称呼": {"type": "string"}}, "required": ["称呼者", "称呼"]}}}, "required": ["室号与称呼", "表面形象", "深夜癖好/真实面目"]}',
    @method_id, 'character', 1, 0, 1, NOW(), NOW()
);

-- -------------------------
-- 3.5 窥探空间与盲区 (scene) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_scene_id, 
    '逼仄空间与窥探点(场景)', 
    '发生隔墙窃听与暴力藏尸的压抑物理空间。', 
    '{"type": "object", "title": "逼仄空间", "x-titleField": "空间名称", "properties": {"空间名称": {"title": "空间名称", "type": "string", "description": "如：幽暗狭长的公共走廊、废弃的垃圾管道井、水声回荡的公共浴室、隔音极差的主卧双层墙", "useForAI": true}, "空间异样感": {"title": "空间异样感", "type": "string", "description": "这里平时有什么不对劲的地方？（如：走廊灯永远只亮一半、管道井里总有婴儿哭声）", "x-uiWidget": "textarea", "useForAI": true}, "偷窥/藏匿功能": {"title": "偷窥/藏匿功能", "type": "string", "description": "主角如何利用此地安全地窥视邻居？或者在这曾经藏过怎样的尸骸（如：透过通风百叶窗可以直视楼下的卧床）", "x-uiWidget": "textarea", "useForAI": true}, "暴露风险": {"title": "暴露风险", "type": "string", "description": "在这空间由于什么原因极易被反向抓住（如：木地板太老会发出刺耳嘎吱声、猫眼其实是双面透光的）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["空间名称", "偷窥/藏匿功能", "暴露风险"]}',
    @method_id, 'scene', 1, 0, 1, NOW(), NOW()
);

-- -------------------------
-- 3.6 窥视载体与遗物 (prop) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_prop_id, 
    '窥探截获物(道具)', 
    '从邻居那里偷来、捡到或是强行塞入主角房门的可疑物件。', 
    '{"type": "object", "title": "截获物与遗物", "x-titleField": "物品名", "properties": {"物品名": {"title": "物品名", "type": "string", "description": "如：一直渗出腥臭水的同城快递、前租客藏在床垫下的日记血书、邻居强硬送来的“肉汤”", "useForAI": true}, "外观或气味描述": {"title": "外观或气味描述", "type": "string", "description": "极度挑战生理极线的描写", "x-uiWidget": "textarea", "useForAI": true}, "隐藏的罪恶真相": {"title": "隐藏的罪恶真相", "type": "string", "description": "通过化验或者拆解这个物品，主角发现的惊天秘密（如：肉汤里飘着一颗属于前女友带美甲的手指）", "x-uiWidget": "textarea", "useForAI": true}, "沾染的因果": {"title": "沾染的因果", "type": "string", "description": "因为拿了/吃了/看了这个东西，主角被如何锁定成了下一个目标？", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["物品名", "外观或气味描述", "隐藏的罪恶真相"]}',
    @method_id, 'prop', 1, 0, 1, NOW(), NOW()
);

-- -------------------------
-- 3.7 楼道秘密集会 (organization) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_org_id, 
    '全楼合谋的小团体', 
    '除主角外，这栋楼里可能因为某个肮脏秘密而集体勾结的圈子。', 
    '{"type": "object", "title": "合谋团体", "x-titleField": "团体名称", "properties": {"团体名称": {"title": "团体名称", "type": "string", "description": "如：天台祈福业委会、深夜麻将群、剥皮互助小组", "useForAI": true}, "表面活动": {"title": "表面活动", "type": "string", "description": "如：为了小区绿化集资开会、半夜四个人打桥牌", "x-uiWidget": "textarea", "useForAI": true}, "暗中仪轨与密谋": {"title": "暗中仪轨与密谋", "type": "string", "description": "他们真正在做什么（如：抽签决定这个月把哪个外卖员分食、在天台对某个邪佛进行血祭）", "x-uiWidget": "textarea", "useForAI": true}, "集体沉默协议": {"title": "集体沉默协议", "type": "string", "description": "他们是如何互相包庇不被警方发现的？一旦有人想要告密下场是什么？", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["团体名称", "表面活动", "暗中仪轨与密谋"]}',
    @method_id, 'organization', 1, 0, 1, NOW(), NOW()
);
