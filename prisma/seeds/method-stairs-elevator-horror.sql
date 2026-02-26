-- -----------------------------------------------------------------------------
-- 楼道/电梯怪谈流 (Liminal Space/Elevator Horror) 创作方法初始化 SQL
-- -----------------------------------------------------------------------------

SET @method_id = 74; 
SET @method_name = '楼道/电梯怪谈流';
SET @method_desc = '主打"公共出行空间的超自然异化"的现代怪谈。主角在上下班的平凡路途中，于电梯、楼梯间等连接人间的通道里陷入折叠空间与致命危机。';
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
SET @m_hook_id  = 8170501740000000001;
SET @m_world_id = 8170501740000000002;
SET @m_style_id = 8170501740000000003;
SET @m_char_id  = 8170501740000000004;
SET @m_scene_id = 8170501740000000005;
SET @m_prop_id  = 8170501740000000006;
SET @m_org_id   = 8170501740000000007;

-- -------------------------
-- 3.1 误入缝隙钩子 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_hook_id, 
    '误入缝隙钩子', 
    '主角在日常必须经过的公共空间中，遭遇打破常理的初次灵异事件。', 
    '{"type": "object", "title": "故事钩子", "properties": {"触发情境": {"title": "触发情境", "type": "string", "enum": ["深夜独自下班/晚归", "停电或设备故障迫使走楼梯", "搬家/初次来到陌生的老旧楼层", "鬼使神差按错了电梯楼层"], "x-uiWidget": "radio", "useForAI": true}, "第一眼异常": {"title": "第一眼异常", "type": "string", "description": "非常隐蔽但不合常理的细节（如：电梯数字跳过了自己住的楼层、声控灯亮起时地上多了一个影子、楼梯扶手上永远是湿的）", "x-uiWidget": "textarea", "useForAI": true}, "空间错位的骤变": {"title": "空间错位的骤变", "type": "string", "description": "从日常瞬间跌入恐怖的爆点（如：电梯门打开是一堵红砖墙、往下走了三层发现还是在第14层）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["触发情境", "第一眼异常", "空间错位的骤变"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
);

-- -------------------------
-- 3.2 阈限通道法则 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_world_id, 
    '阈限通道法则', 
    '楼道和电梯等平时无人停留的“过渡区域”，本质上是连接阴阳或多维空间的缝隙（Liminal Space）。', 
    '{"type": "object", "title": "阈限通道", "properties": {"通道本质": {"title": "通道本质", "type": "string", "enum": ["通往死者生前执念的重放结界", "空间由于某种诅咒发生了无限复制和折叠", "某种庞大怪异生物的食道", "活人与里世界错位重合的盲区"], "x-uiWidget": "radio", "useForAI": true}, "维系缝隙运行的能量": {"title": "维系能量", "type": "string", "description": "这个异常空间靠什么存在？（如：不断吸收过路人的恐惧、或是收集在楼道里猝死的人的怨气）", "x-uiWidget": "textarea", "useForAI": true}, "上下行法则": {"title": "上下行法则", "type": "string", "description": "在这个空间里，往上走和往下走有什么致命的区别？（比如往上走是倒流时间回到死者被害那一天，往下走则是无限接近地狱）", "x-uiWidget": "textarea", "useForAI": true}, "挣脱手段": {"title": "挣脱手段(生路)", "type": "string", "description": "打破空间死循环的关键方式（如：绝对不能回头看直接闭眼数100步、或者在特定楼层倒着走入电梯）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["通道本质", "上下行法则", "挣脱手段"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
);

-- -------------------------
-- 3.3 文风设定 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_style_id, 
    '文风设定', 
    '强调“深幽、剥离与孤立无援”的幽闭恐惧氛围。', 
    '{"type": "object", "title": "文风设定", "properties": {"语言风格": {"title": "语言风格", "type": "string", "enum": ["沉浸式的急促喘息与心理独白", "极度安静压抑的慢节奏探索感", "第一视角的伪纪录片式求生日志"], "x-uiWidget": "radio", "useForAI": true}, "光影与空间畸变描述": {"title": "光影与空间畸变描述", "type": "string", "description": "写作要求：少写直白的鬼怪面容，多描写声控灯熄灭后的黑暗、金属轿厢的反光、以及永远看不到尽头的阶梯带来的几何学狂乱", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["语言风格"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
);

-- -------------------------
-- 3.4 缝隙游荡者 (character) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_char_id, 
    '缝隙游荡者', 
    '在楼梯间或电梯中遇到的“人”，他们往往已经是空间的一部分。', 
    '{"type": "object", "title": "游荡者档案", "x-titleField": "特征代称", "properties": {"特征代称": {"title": "特征代称", "type": "string", "description": "由于惊恐，主角往往只记住其最鲜明的特征（如：低头看脚尖的红衣女、一直背对门按楼层的男人）", "useForAI": true}, "出没区域": {"title": "出没区域", "type": "string", "description": "TA固定出现在什么地方（如：必定在转角处、或是只在停电的电梯里）", "useForAI": true}, "非人特征": {"title": "非人特征", "type": "string", "description": "主角因为什么细节发现TA不是活人？（如：鞋尖是朝后的、电梯镜子里没有TA的脸、身上有一股福尔马林味）", "x-uiWidget": "textarea", "useForAI": true}, "致命触发机制": {"title": "触发机制", "type": "string", "description": "这东西什么时候会杀人？（如：如果被人搭话就会跟那个人回家、如果有人挡在楼梯口就会将人推下楼）", "x-uiWidget": "textarea", "useForAI": true}, "残留的人性": {"title": "残留的人性(执念)", "type": "string", "description": "TA在这个空间游荡的悲惨原因？有时这也是主角破局的线索", "x-uiWidget": "textarea", "useForAI": true}, "称呼": {"type": "array", "title": "称呼", "items": {"type": "object", "properties": {"称呼者": {"type": "string"}, "称呼": {"type": "string"}}, "required": ["称呼者", "称呼"]}}}, "required": ["特征代称", "非人特征", "致命触发机制"]}',
    @method_id, 'character', 1, 0, 1, NOW(), NOW()
);

-- -------------------------
-- 3.5 无尽通道 (scene) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_scene_id, 
    '无尽通道(场景)', 
    '电梯、消防通道、地下室等被无限拉长的恐怖区域。', 
    '{"type": "object", "title": "恐怖通道", "x-titleField": "空间名称", "properties": {"空间名称": {"title": "空间名称", "type": "string", "description": "如：永远都在维修的B座电梯、没有窗户的防火楼梯间", "useForAI": true}, "物理表象篡改": {"title": "物理表象篡改", "type": "string", "description": "这里的物理常识发生了什么变化（如：台阶由13阶变成了14阶、墙上的安全出口指示牌变成了一个正在流血的小人）", "x-uiWidget": "textarea", "useForAI": true}, "环境压迫元素": {"title": "环境压迫元素", "type": "string", "description": "主要带来视觉或听觉恐慌的东西（如：每隔3秒闪烁一次并且伴随滋滋声的声控灯、温度异常下降）", "x-uiWidget": "textarea", "useForAI": true}, "绝对禁忌": {"title": "绝对禁忌", "type": "string", "description": "在这个区域内绝对不能做的事（如：在电梯门关上的5秒内绝对不能深呼吸、在楼梯拐角处不能回头看）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["空间名称", "物理表象篡改", "绝对禁忌"]}',
    @method_id, 'scene', 1, 0, 1, NOW(), NOW()
);

-- -------------------------
-- 3.6 被丢弃的物证 (prop) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_prop_id, 
    '缝隙遗落物(道具)', 
    '前人留下的带血警告或可以干扰空间法则的物品。', 
    '{"type": "object", "title": "缝隙遗落物", "x-titleField": "物品名", "properties": {"物品名": {"title": "物品名", "type": "string", "description": "如：电梯缝隙里的半只高跟鞋、贴在按键上带有盲文指血的胶带、楼梯拐角沾灰的发夹", "useForAI": true}, "异常现象": {"title": "异常现象", "type": "string", "description": "这东西一旦接触会有什么不可理喻的变化？（如：拿到高跟鞋后，主角只听到到处都是极其清晰的高跟鞋脚步声）", "x-uiWidget": "textarea", "useForAI": true}, "信息/生存价值": {"title": "生存价值", "type": "string", "description": "它传达了什么逃生密码？（如：鞋尖指着这层楼不能下、按键上的血迹暗示那是唯一生门）", "x-uiWidget": "textarea", "useForAI": true}, "持有风险": {"title": "持有风险", "type": "string", "description": "带着它虽然能抵御部分危险，但会引来什么更可怕的存在？", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["物品名", "信息/生存价值", "持有风险"]}',
    @method_id, 'prop', 1, 0, 1, NOW(), NOW()
);

-- -------------------------
-- 3.7 空间异化的同谋 (organization) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_org_id, 
    '掩盖缝隙的团体', 
    '明知道楼道/电梯吃人，却视而不见甚至推波助澜的活人群体。', 
    '{"type": "object", "title": "掩盖真相的团体", "x-titleField": "团体名称", "properties": {"团体名称": {"title": "团体名称", "type": "string", "description": "如：外包的电梯维保公司、小区的黑心开发商、某些住在特定楼层的老住户", "useForAI": true}, "掩盖动机": {"title": "掩盖动机", "type": "string", "description": "他们为什么不对这部“吃人电梯”采取措施？（如：电梯是某种镇压风水的阵眼，必须定期献祭外来人）", "x-uiWidget": "textarea", "useForAI": true}, "针对主角的阻碍行为": {"title": "阻碍行为", "type": "string", "description": "当主角试图查明真相或逃离时，这个组织如何行事？（如：故意切断求救电话、伪造监控录像声称主角患有精神病）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["团体名称", "掩盖动机", "针对主角的阻碍行为"]}',
    @method_id, 'organization', 1, 0, 1, NOW(), NOW()
);
