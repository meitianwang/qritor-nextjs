-- -----------------------------------------------------------------------------
-- 规则类物业/保安流 (Property/Security Rule-based Horror) 创作方法初始化 SQL
-- -----------------------------------------------------------------------------

SET @method_id = 72; 
SET @method_name = '规则类物业/保安流';
SET @method_desc = '爆款现代怪谈分支。主角作为小区保安、物业或新租客，身处被无形规则笼罩的日常“领域”。通过各类守则、公告栏、监控录像和微信群聊发现并应对隐藏在日常生活背后的致命危机。';
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
SET @m_hook_id  = 8170501720000000001;
SET @m_world_id = 8170501720000000002;
SET @m_style_id = 8170501720000000003;
SET @m_char_id  = 8170501720000000004;
SET @m_scene_id = 8170501720000000005;
SET @m_prop_id  = 8170501720000000006;
SET @m_org_id   = 8170501720000000007;

-- -------------------------
-- 3.1 入职/入住钩子 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_hook_id, 
    '入职入住钩子', 
    '主角进入小区的动机以及接触到的第一份离奇守则。', 
    '{"type": "object", "title": "故事钩子", "properties": {"切入身份": {"title": "切入身份", "type": "string", "enum": ["夜班保安", "新任楼管/物业", "贪便宜的新租客"], "x-uiWidget": "radio", "useForAI": true}, "动机": {"title": "动机", "type": "string", "description": "主角为什么无法马上离职或搬走（如：压了半年的工资、租金交了退不了又没钱搬）", "x-uiWidget": "textarea", "useForAI": true}, "第一份异常守则": {"title": "第一份异常守则", "type": "string", "description": "主角上岗/入住第一天看到的绝对不合理的规定，奠定恐怖基调（如：本小区没有14栋，若外卖单写着送往14栋，请将外卖丢进垃圾桶）", "x-uiWidget": "textarea", "useForAI": true}, "初遇破窗效应": {"title": "初遇破窗效应", "type": "string", "description": "第一个因不守规则而被抹杀或异化的前任/同事/邻居，向主角展示规则的绝对统治力", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["切入身份", "动机", "第一份异常守则", "初遇破窗效应"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
);

-- -------------------------
-- 3.2 小区领域法则 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_world_id, 
    '小区领域法则', 
    '这个看似普通的小区，实际上是被某种污染笼罩的法外之地或“饲养场”。', 
    '{"type": "object", "title": "小区法则", "properties": {"领域本质": {"title": "领域本质", "type": "string", "enum": ["活人与怪异混居的缓冲带", "大型献祭或饲养场", "高维实体下放的游戏场", "某种不可名状污染的隔离区"], "x-uiWidget": "radio", "useForAI": true}, "认知污染源": {"title": "认知污染源", "type": "string", "description": "小区里的污染是如何传播的（如：通过饮用水、通过听到特定频段的广播、或是只要看了某篇公告）", "x-uiWidget": "textarea", "useForAI": true}, "规则的三方角力": {"title": "规则的三方角力", "type": "string", "description": "这个小区通常有多套规则在打架。比如：物业的蓝色守则（同化你）、业委会的红色守则（警告你）、以及某种不可言说力量篡改的黑色涂鸦（陷阱）", "x-uiWidget": "textarea", "useForAI": true}, "逃脱/生还条件": {"title": "逃脱/生还条件", "type": "string", "description": "熬过试用期？活过头七？还是必须找到传说中的“南大门”才能离开？", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["领域本质", "认知污染源", "规则的三方角力"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
);

-- -------------------------
-- 3.3 文风设定 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_style_id, 
    '文风设定', 
    '将日常琐事与极端恐怖无缝结合的叙事风格。', 
    '{"type": "object", "title": "文风设定", "properties": {"语言风格": {"title": "语言风格", "type": "string", "enum": ["伪纪实工作日志体", "看似家长里短实则处处杀机的群聊体", "神经质的第一人称求生视角"], "x-uiWidget": "radio", "useForAI": true}, "日常恐怖化描述": {"title": "日常恐怖化描述", "type": "string", "description": "重点指导：如何把极其平常的东西写出惊悚感（如手电筒闪过的绿化带、半夜的广场舞音乐、电梯楼层显示）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["语言风格"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
);

-- -------------------------
-- 3.4 业主与工作人员 (character) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_char_id, 
    '人员管理档案', 
    '小区里那些形形色色的活人、假人、或是已经被同化的“东西”。', 
    '{"type": "object", "title": "人员档案", "x-titleField": "姓名或代号", "properties": {"姓名或代号": {"title": "姓名或代号", "type": "string", "description": "如：新来的保安小李、404室的红衣女人", "useForAI": true}, "身份归属": {"title": "身份归属", "type": "string", "enum": ["主角 (刚入局的清醒者)", "物业人员 (掌握残缺规则/部分同化)", "正常业主 (不知道真相的待宰羔羊)", "污染业主 (已经不是人了)", "规则外实体 (不可接触的它)"], "x-uiWidget": "select", "useForAI": true}, "异常行为模式": {"title": "异常行为模式", "type": "string", "description": "如：总是在夜里拖动家具、倒着走路下楼梯", "x-uiWidget": "textarea", "useForAI": true}, "判别特征": {"title": "判别特征", "type": "string", "description": "主角如何分辨它是敌是友（如：制服的颜色、是否有影子、说话会不会带口音）", "x-uiWidget": "textarea", "useForAI": true}, "个人专属禁忌": {"title": "个人专属禁忌", "type": "string", "description": "千万不能对TA做的一件事", "x-uiWidget": "textarea", "useForAI": true}, "当前污染度": {"title": "当前污染度", "type": "string", "enum": ["完全清醒", "轻微幻视幻听", "深度认知扭曲", "不可逆变异中", "彻底同化"], "x-uiWidget": "select"}, "称呼": {"type": "array", "title": "称呼", "items": {"type": "object", "properties": {"称呼者": {"type": "string"}, "称呼": {"type": "string"}}, "required": ["称呼者", "称呼"]}}}, "required": ["姓名或代号", "身份归属", "判别特征"]}',
    @method_id, 'character', 1, 0, 1, NOW(), NOW()
);

-- -------------------------
-- 3.5 异常楼栋与设施 (scene) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_scene_id, 
    '建筑与设施管理(场景)', 
    '被不同规则切割的小区公共空间。', 
    '{"type": "object", "title": "设施区域", "x-titleField": "区域名称", "properties": {"区域名称": {"title": "区域名称", "type": "string", "description": "如：地下停车场B区、不存在的18层、废弃的儿童游乐设施", "useForAI": true}, "安全级别": {"title": "安全级别", "type": "string", "enum": ["绝对安全(如保安亭内)", "条件安全(遵守规则保命)", "严重污染(严禁进入)", "认知盲区(空间折叠处)"], "x-uiWidget": "radio", "useForAI": true}, "表象与异化": {"title": "表象与异化", "type": "string", "description": "白天的正常与夜晚的诡异对比（如白天是人工湖，晚上里面飘满头发）", "x-uiWidget": "textarea", "useForAI": true}, "驻留怪物/异常": {"title": "驻留怪物/异常", "type": "string", "description": "谁在那里？", "x-uiWidget": "textarea", "useForAI": true}, "专属互动规则": {"title": "专属互动规则", "type": "string", "description": "身处此地的特殊苟活技巧（如：在电梯里绝对不能看镜子，如果超载提示音响起请倒着走出去）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["区域名称", "安全级别", "专属互动规则"]}',
    @method_id, 'scene', 1, 0, 1, NOW(), NOW()
);

-- -------------------------
-- 3.6 守则通知与工作终端 (prop) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_prop_id, 
    '书面守则/记录源(道具)', 
    '推动主角解谜并在规则迷雾中求生的载体。', 
    '{"type": "object", "title": "重要守则文献", "x-titleField": "文件名称", "properties": {"文件名称": {"title": "文件名称", "type": "string", "description": "如：《夜班保安岗位守则》、《业主群公告》、《监控室交接班记录》", "useForAI": true}, "发布方": {"title": "发布方", "type": "string", "description": "谁贴出来的（物业？神秘人？前任？）", "useForAI": true}, "载体材质": {"title": "载体材质", "type": "string", "description": "是贴在墙上被撕了一半的A4纸，还是工作手机上无法删除的备忘录？", "x-uiWidget": "textarea", "useForAI": true}, "守则条文细则": {"title": "守则条文细则", "type": "string", "description": "列出1-5条非常具体的要求（必须包含如果发生异常怎么应对）", "x-uiWidget": "textarea", "useForAI": true}, "陷阱与矛盾": {"title": "陷阱与矛盾", "type": "string", "description": "这份文献哪一条是假规则？或者和别的守则有什么致命冲突？", "x-uiWidget": "textarea", "useForAI": true}, "执行代价": {"title": "执行代价", "type": "string", "description": "遵守它虽然能保命，但会有什么副作用（比如逐渐失去五感、逐渐被同化）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["文件名称", "载体材质", "守则条文细则", "陷阱与矛盾"]}',
    @method_id, 'prop', 1, 0, 1, NOW(), NOW()
);

-- -------------------------
-- 3.7 物业管理层与“它们” (organization) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_org_id, 
    '阵营/管理层', 
    '在小区里维持某种诡异平衡的多方势力。', 
    '{"type": "object", "title": "背后势力阵营", "x-titleField": "势力名称", "properties": {"势力名称": {"title": "势力名称", "type": "string", "description": "如：黑衣物业管理层、原住民业委会、深夜游荡的“保洁”", "useForAI": true}, "表面职责": {"title": "表面职责", "type": "string", "description": "如：为业主维修水电、维护绿化", "x-uiWidget": "textarea", "useForAI": true}, "真实目的与行为准则": {"title": "真实目的", "type": "string", "description": "它们为什么制定这些规则？它们靠什么运转？（如：靠吞噬犯规的保安来维系小区的结界）", "x-uiWidget": "textarea", "useForAI": true}, "敌友判断依据": {"title": "敌友判断依据", "type": "string", "description": "对主角来说，这股势力是暂时的避风港还是绝对的死神？如何避免触发它们的仇恨？", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["势力名称", "真实目的", "敌友判断依据"]}',
    @method_id, 'organization', 1, 0, 1, NOW(), NOW()
);
