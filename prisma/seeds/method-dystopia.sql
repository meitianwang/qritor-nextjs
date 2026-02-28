-- -----------------------------------------------------------------------------
-- 反乌托邦 创作方法初始化 SQL
-- -----------------------------------------------------------------------------

SET @method_id = 77; 
SET @method_name = '反乌托邦';
SET @method_desc = '主打"伪装的幸福与极度压抑的监控社会"的科幻门类。描绘一个表面秩序井然、实则缺乏人性、思想被严密控制的未来。情节以主角的觉醒、质疑并最终反抗体制为核心线索。';
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
  language = VALUES(language), visible_categories = VALUES(visible_categories), is_preset = VALUES(is_preset), status = VALUES(status), updated_at = NOW();

-- 模块ID预设
SET @m_hook_id  = 8170501770000000001;
SET @m_world_id = 8170501770000000002;
SET @m_style_id = 8170501770000000003;
SET @m_char_id  = 8170501770000000004;
SET @m_scene_id = 8170501770000000005;
SET @m_prop_id  = 8170501770000000006;
SET @m_org_id   = 8170501770000000007;

-- -------------------------
-- 3.1 觉醒与裂痕钩子 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_hook_id, 
    '完美运转的裂痕钩子', 
    '原本浑浑噩噩顺从体制的主角，因为某个极其微小的失误或感情波动开始觉醒。', 
    '{"type": "object", "title": "觉醒钩子", "properties": {"主角社会定位": {"title": "社会定位", "type": "string", "enum": ["体制内维护者(如审查员/思想警察)", "最底层的劳工/耗材", "被判定为缺陷品的废弃人口", "享受特权却感到空虚的高等公民"], "x-uiWidget": "radio", "useForAI": true}, "日常的绝对正确": {"title": "日常的绝对正确", "type": "string", "description": "主角在出事前，每天必须履行的、让人感到麻木的洗脑日常（如：每天对着屏幕高喊赞美领袖、吞下压抑情感的药片）", "x-uiWidget": "textarea", "useForAI": true}, "引发觉醒的致命违规": {"title": "致命违规事件", "type": "string", "description": "主角做了一件不该做但极具人性的事（如：藏起了一本真正印刷的书、对某个异性产生了非配给的爱情、在例行感恩时少说了一个词）", "x-uiWidget": "textarea", "useForAI": true}, "系统反噬的危机感": {"title": "系统反噬", "type": "string", "description": "这一举动立刻引爆了潜藏的监控，主角发现自己正被抹除存在的边缘拉扯", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["主角社会定位", "引发觉醒的致命违规", "系统反噬的危机感"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.2 伪完美社会法则 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_world_id, 
    '极权统治与剥削法则', 
    '统治阶级用来奴役精神和肉体的宏大制度（往往披着光鲜亮丽或绝对理性的外衣）。', 
    '{"type": "object", "title": "统治法则", "properties": {"体制控制核心": {"title": "控制核心", "type": "string", "enum": ["篡改历史与新语洗脑(1984式)", "基因决定阶级与快乐药丸(美丽新世界式)", "绝对的算法评分与感情剥夺(黑镜式)", "娱乐至死与消费主义麻醉(赛博朋克前置期)"], "x-uiWidget": "radio", "useForAI": true}, "虚伪的乌托邦表象": {"title": "虚伪表象", "type": "string", "description": "这个世界表面看起来有多么和谐、没有犯罪、没有悲伤？代价是什么？（如：所有人都在笑，因为哭泣会被直接处决）", "x-uiWidget": "textarea", "useForAI": true}, "监控与惩罚机制": {"title": "监控惩罚机制", "type": "string", "description": "系统如何知道你在想什么？一旦思想犯罪如何处理？（如：每个人脑后插管实时监测多巴胺、思想犯会被送去进行前额叶切除变回白痴）", "x-uiWidget": "textarea", "useForAI": true}, "阶级固化与壁垒": {"title": "阶级壁垒", "type": "string", "description": "人被分成了怎样的三六九等？且永远无法跨越（如：高墙内的阿尔法基因人与高墙外的自然生育野人）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["体制控制核心", "虚伪的乌托邦表象", "监控与惩罚机制"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.3 文风设定 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_style_id, 
    '文风设定', 
    '带有重度神经质、冰冷政治体和极度压抑窥探感的文风。', 
    '{"type": "object", "title": "文风设定", "properties": {"语言风格": {"title": "语言风格", "type": "string", "enum": ["冰冷压抑的监控档案体", "充满神经质与多疑的内心独白", "充满荒诞狂欢感的假意赞美诗"], "x-uiWidget": "radio", "useForAI": true}, "剥夺人性化描写": {"title": "剥夺人性化描写", "type": "string", "description": "写作要求：描写人时，不要用人的感情词，要用机器、材料或数字来指代。比如不写母亲爱孩子，写：生育机器04号正对刚下线的有机体进行程序化哺乳。营造一种被高度物化的窒息感。", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["语言风格"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.4 制度齿轮与反骨者 (character) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_char_id, 
    '公民档案库', 
    '在这个社会里，人要么是被彻底洗脑举报亲人的机器，要么是战战兢兢的伪装者。', 
    '{"type": "object", "title": "公民档案", "x-titleField": "编号与称呼", "properties": {"编号与称呼": {"title": "编号与称呼", "type": "string", "description": "如：公民D-503、思想警察主管奥布莱恩、生育模范7号", "useForAI": true}, "社会生态位": {"title": "社会生态位", "type": "string", "enum": ["完美的体制齿轮/狂热信徒", "拥有特权的虚无主义高官", "假装顺从暗中反抗的潜伏分子", "用来杀鸡儆猴的公开处刑对象"], "x-uiWidget": "select", "useForAI": true}, "异化行为特征": {"title": "异化行为特征", "type": "string", "description": "因为高度压抑，TA有什么病态或违背人伦的举动？（如：鼓励六岁的女儿举报自己偷看旧时代电影、每天晚上必须对着电幕狂笑五分钟才能入睡）", "x-uiWidget": "textarea", "useForAI": true}, "对觉醒者的威胁度": {"title": "危险性", "type": "string", "description": "TA是主角的盟友，还是随时会出卖主角换取配给粮的犹大？", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["编号与称呼", "社会生态位", "异化行为特征"]}',
    @method_id, 'character', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.5 绝对景观与化外之地 (scene) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_scene_id, 
    '极权建筑体系(场景)', 
    '光鲜亮丽但没有隐私的玻璃城，或者是不受控制的脏乱荒野。', 
    '{"type": "object", "title": "环境设施", "x-titleField": "建筑/区域名", "properties": {"建筑/区域名": {"title": "区域名称", "type": "string", "description": "如：真理部101室、无隐私玻璃胶囊公寓、被辐射墙隔离的旧时代废墟", "useForAI": true}, "视觉秩序感": {"title": "视觉秩序感", "type": "string", "description": "这里的建筑如何体现对人的碾压？（如：四面全是永远无法关掉画面的巨型屏幕、没有任何死角的纯白房间让人丧失时间感）", "x-uiWidget": "textarea", "useForAI": true}, "洗脑与控制功能": {"title": "控制功能", "type": "string", "description": "身处此地的人被迫经历什么？（如：24小时播放潜意识音频、强光照射无法入眠）", "x-uiWidget": "textarea", "useForAI": true}, "盲区/反抗据点": {"title": "盲区", "type": "string", "description": "在绝对的监控下，这里是否存在唯一不被窥探的死角？（如：排风口后有一片三米宽的黑暗，是主角唯一可以流泪的地方）", "x-uiWidget": "textarea"}}, "required": ["建筑/区域名", "视觉秩序感", "洗脑与控制功能"]}',
    @method_id, 'scene', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.6 违禁品与思想检定 (prop) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_prop_id, 
    '思想违禁品与监控端(道具)', 
    '代表旧时代人性的物品（引来杀身之祸）或是系统中无情执行惩罚的探针。', 
    '{"type": "object", "title": "物资讯息", "x-titleField": "违禁品/监控设施", "properties": {"违禁品/监控设施": {"title": "物品名称", "type": "string", "description": "如：一本残破的纸质日记本(极度危险)、强制服用的梭麻药丸、墙壁上的双向电幕", "useForAI": true}, "代表的旧日情感": {"title": "唤醒的情感", "type": "string", "description": "如果这是一件违禁品，它是如何刺激主角的人性的？（如：一支带有香味的口红，让几代没有见过色彩的克隆人想起了审美的冲动）", "x-uiWidget": "textarea", "useForAI": true}, "查获后的终极惩罚": {"title": "系统制裁", "type": "string", "description": "一旦被思想警察发现主角藏有它，会有什么非人的处理？（如：直接人间蒸发，并且修改历史证明主角从未出生过）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["违禁品/监控设施", "查获后的终极惩罚"]}',
    @method_id, 'prop', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.7 极权枢纽与反抗军 (organization) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_org_id, 
    '老大哥与兄弟会', 
    '不可战胜的绝对集权组织，以及试图颠覆却往往被渗透成筛子的反抗者联盟。', 
    '{"type": "object", "title": "集团与组织", "x-titleField": "机构名称", "properties": {"机构名称": {"title": "机构/联盟名称", "type": "string", "description": "如：全知全能的党(老大哥)、负责清洗记忆的仁爱部、隐藏在地底的自由反抗军", "useForAI": true}, "组织力量与欺骗性": {"title": "力量与欺骗性", "type": "string", "description": "如果是极权：它的天网有多么恐怖？如果是反抗军：它是否其实是极权故意设立的钓鱼组织？（反乌托邦精髓：很多反抗军头目其实也是体制高官假扮的）", "x-uiWidget": "textarea", "useForAI": true}, "对待叛徒的手段": {"title": "清洗手段", "type": "string", "description": "对于不符合要求的人，他们如何抹除其存在？", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["机构名称", "组织力量与欺骗性"]}',
    @method_id, 'organization', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();
