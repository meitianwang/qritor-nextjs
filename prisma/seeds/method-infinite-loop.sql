-- -----------------------------------------------------------------------------
-- 无限循环/密闭公车流 (Infinite Loop Horror) 创作方法初始化 SQL
-- -----------------------------------------------------------------------------

SET @method_id = 71; 
SET @method_name = '无限循环/公车流';
SET @method_desc = '主打"密闭空间与时间循环"的重度悬疑与科幻灵异流派。主角被困在永远无法停下的交通工具中，必须通过试错和拼凑亡者的记忆来解除循环。';
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
  language = VALUES(language), visible_categories = VALUES(visible_categories), is_preset = VALUES(is_preset), status = VALUES(status), updated_at = NOW(
ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- 模块ID预设
SET @m_hook_id  = 8170501710000000001;
SET @m_world_id = 8170501710000000002;
SET @m_style_id = 8170501710000000003;
SET @m_char_id  = 8170501710000000004;
SET @m_scene_id = 8170501710000000005;
SET @m_prop_id  = 8170501710000000006;
SET @m_org_id   = 8170501710000000007;

-- -------------------------
-- 3.1 故事钩子 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_hook_id, 
    '循环起因钩子', 
    '主角上车并发现自身陷入死亡重置的开端。', 
    '{"type": "object", "title": "故事钩子", "properties": {"上车契机": {"title": "上车契机", "type": "string", "description": "主角为什么会坐上这趟致命航班/公交（如：加完班晚归、收到求救短信赶往外地）", "x-uiWidget": "textarea", "useForAI": true}, "初次死亡/重置事件": {"title": "初次死亡/重置事件", "type": "string", "description": "第一次打破日常的爆点，由于什么原因全车团灭或主角骤死？", "x-uiWidget": "textarea", "useForAI": true}, "发现循环的锚点": {"title": "发现循环的锚点", "type": "string", "description": "主角在第二次醒来时，注意到哪个细节的绝对重合（如耳机里刚好播放同一句歌词、前面的大妈说了同样的话）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["上车契机", "初次死亡/重置事件", "发现循环的锚点"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()

ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.2 循环与空间法则 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_world_id, 
    '循环与空间法则', 
    '困住这辆车的并不是一条普通的马路，而是扭曲的时空。', 
    '{"type": "object", "title": "循环法则", "properties": {"循环载体": {"title": "循环载体", "type": "string", "enum": ["午夜公交车", "幽灵列车/地铁", "万米高空的航班", "没有尽头的长途大巴"], "x-uiWidget": "radio", "useForAI": true}, "重置条件": {"title": "重置条件", "type": "string", "description": "什么情况下时间会重置？（如：主角死亡、到了某个特定的时间点如12:00、车辆驶入特定隧道）", "x-uiWidget": "textarea", "useForAI": true}, "空间扭曲特征": {"title": "空间扭曲特征", "type": "string", "description": "车窗外的世界发生了怎样的异变？（如：外面的城市正在像俄罗斯方块一样坍塌、永远在一座没有尽头的大桥上行驶）", "x-uiWidget": "textarea", "useForAI": true}, "破局关键(生路)": {"title": "破局关键(生路)", "type": "string", "description": "阻止循环的最终方式（如：阻止司机在十字路口转弯、揪出车上的那个死灵、将车头开出灵域）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["循环载体", "重置条件", "空间扭曲特征"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()

ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.3 文风设定 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_style_id, 
    '文风设定', 
    '极度压抑的密闭空间悬疑感与死亡倒计时。', 
    '{"type": "object", "title": "文风设定", "properties": {"语言风格": {"title": "语言风格", "type": "string", "enum": ["冷静推理、细节拉满", "快节奏的倒计时式动作感", "重度压抑绝望的心理描写"], "x-uiWidget": "radio", "useForAI": true}, "重复的绝望描写": {"title": "重复的绝望描写", "type": "string", "description": "写作要求：在描绘每次轮回醒来时，对既定命运的绝望感和狂躁感要如何体现", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["语言风格"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()

ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.4 诡异乘客 (character) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_char_id, 
    '循环中的乘客', 
    '除了主角外，车上大多是麻木重复动作的亡魂，或极少数清醒者。', 
    '{"type": "object", "title": "乘客记录", "x-titleField": "姓名", "properties": {"姓名": {"title": "姓名", "type": "string", "description": "名字或特征代号（如：戴草帽的老人、前排红衣女）", "useForAI": true}, "角色状态": {"title": "角色状态", "type": "string", "enum": ["主角 (破局者)", "被卷入的无辜活人", "死前执念的播放器(亡者)", "导致循环的怨灵(源头)"], "x-uiWidget": "select", "useForAI": true}, "座位/常处位置": {"title": "座位/常处位置", "type": "string", "description": "如：从后往前数第二排左侧、车厢连结处", "useForAI": true}, "每次循环的固定动作": {"title": "每次循环的固定动作", "type": "string", "description": "如：在第3分钟准时踢一脚前排座椅、不停看没有屏幕的手机", "x-uiWidget": "textarea", "useForAI": true}, "隐藏真相": {"title": "隐藏真相", "type": "string", "description": "这名乘客生前经历了什么？或者是导致灾难的什么一环？", "x-uiWidget": "textarea", "useForAI": true}, "循环记忆保留度": {"title": "循环记忆保留度", "type": "string", "enum": ["毫无保留(按剧本走)", "有似曾相识的既视感", "完全保留(觉醒者)", "记忆崩溃错乱状态"], "x-uiWidget": "select"}, "称呼": {"type": "array", "title": "称呼", "items": {"type": "object", "properties": {"称呼者": {"type": "string"}, "称呼": {"type": "string"}}, "required": ["称呼者", "称呼"]}}}, "required": ["姓名", "角色状态", "每次循环的固定动作"]}',
    @method_id, 'character', 1, 0, 1, NOW(), NOW()

ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.5 死亡站点/车厢 (scene) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_scene_id, 
    '站点与折叠车厢(场景)', 
    '无穷无尽的停靠站或是被时空扭曲的交通工具内部结构。', 
    '{"type": "object", "title": "站点/车厢", "x-titleField": "名称", "properties": {"名称": {"title": "站名或车厢号", "type": "string", "description": "如：无人的东郊火葬场站、负四层站、第四节车厢(时间流速减半)", "useForAI": true}, "场景类型": {"title": "场景类型", "type": "string", "enum": ["物理车厢空间", "车厢外的诡异站点", "现实与灵域的交错带"], "x-uiWidget": "radio", "useForAI": true}, "外景异常事件": {"title": "外景异常事件", "type": "string", "description": "如：这一站外面的雨是红色的、站牌上写满了乘客的死期", "x-uiWidget": "textarea", "useForAI": true}, "上车/侵入之物": {"title": "上车/侵入之物", "type": "string", "description": "在这一站，什么东西会随着车门开启涌进来？或者这个车厢里的物理定律有什么问题？", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["名称", "场景类型", "外景异常事件"]}',
    @method_id, 'scene', 1, 0, 1, NOW(), NOW()

ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.6 线索与遗物 (prop) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_prop_id, 
    '线索遗物(道具)', 
    '解开谜团的关键抓手，改变时间线产生的特殊蝴蝶效应物件。', 
    '{"type": "object", "title": "线索遗物", "x-titleField": "物品名", "properties": {"物品名": {"title": "物品名", "type": "string", "description": "如：沾血的车票、大妈掉落的塑料袋、前座掉落带锁的日记本", "useForAI": true}, "归属者": {"title": "归属者", "type": "string", "description": "这件物品属于车上的谁？", "useForAI": true}, "隐藏的死亡真相": {"title": "隐藏的死亡真相", "type": "string", "description": "通过这件物品主角能推断出什么惊人事实？（例如：车票上的日期是十年前，证明这车全是鬼）", "x-uiWidget": "textarea", "useForAI": true}, "获取难度与代价": {"title": "获取难度与代价", "type": "string", "description": "在某次循环中，为了拿到它付出了什么惨痛代价（或者主角怎么设计拿到的）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["物品名", "隐藏的死亡真相"]}',
    @method_id, 'prop', 1, 0, 1, NOW(), NOW()

ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.7 导致失事的幕后黑手 (organization) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_org_id, 
    '幕后黑手/失事源头', 
    '控制公交路线、或是引发爆炸的隐藏黑手。', 
    '{"type": "object", "title": "幕后黑手", "x-titleField": "源头名称", "properties": {"源头名称": {"title": "源头名称", "type": "string", "description": "如：面无表情的司机、某家非法运输公司、或者是某种试图复活的集体怨念", "useForAI": true}, "灾难动机": {"title": "灾难动机", "type": "string", "description": "为什么要引发这场车祸/让车一直开下去不准停？", "x-uiWidget": "textarea", "useForAI": true}, "干涉循环的手段": {"title": "干涉循环的手段", "type": "string", "description": "黑手如何阻止主角破局？（如：它会修改每次重置时的部分细节、控制其他假乘客包围主角）", "x-uiWidget": "textarea", "useForAI": true}, "弱点": {"title": "弱点", "type": "string", "description": "在千万次循环中，主角发现的致胜漏洞", "x-uiWidget": "textarea"}}, "required": ["源头名称", "灾难动机", "干涉循环的手段"]}',
    @method_id, 'organization', 1, 0, 1, NOW(), NOW()

ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();
