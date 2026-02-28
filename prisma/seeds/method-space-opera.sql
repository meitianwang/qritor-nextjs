-- -----------------------------------------------------------------------------
-- 太空歌剧 创作方法初始化 SQL
-- -----------------------------------------------------------------------------

SET @method_id = 76; 
SET @method_name = '太空歌剧';
SET @method_desc = '主打"星际史诗、浪漫冒险与跨星系霸权"的科幻门类。背景极其宏大，往往涉及整个银河系的兴衰、外星种族恩怨与超级帝国的权力游戏，更像是太空背景下的“骑士小说”或“历史剧”。';
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
SET @m_hook_id  = 8170502760000000001;
SET @m_world_id = 8170502760000000002;
SET @m_style_id = 8170502760000000003;
SET @m_char_id  = 8170502760000000004;
SET @m_scene_id = 8170502760000000005;
SET @m_prop_id  = 8170502760000000006;
SET @m_org_id   = 8170502760000000007;

-- -------------------------
-- 3.1 卷入乱世钩子 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_hook_id, 
    '星海乱世钩子', 
    '主角是如何被卷入一场波及整个星系的帝国权力洗牌或宇宙战争中的。', 
    '{"type": "object", "title": "星海乱世钩子", "properties": {"身世/身份起点": {"title": "起点身份", "type": "string", "enum": ["没落贵族的最后血脉(沙丘式)", "偏远废品星的走私客/孤儿(星战式)", "掌握关键坐标/秘钥的探索者(海伯利安式)", "正规星际舰队的叛逃军官"], "x-uiWidget": "radio", "useForAI": true}, "打破平静的战争级事变": {"title": "战争级事变", "type": "string", "description": "主角的家乡/母舰是如何被银河帝国或敌对势力以压倒性武力摧毁的？", "x-uiWidget": "textarea", "useForAI": true}, "强加于身的宿命任务": {"title": "宿命任务", "type": "string", "description": "主角在废墟中接过了什么信物或任务，从而必须踏上跨越星系的冒险之旅？（如：一卷加密的全息星图、一把代表皇权的光剑、护送反抗军首领）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["身世/身份起点", "打破平静的战争级事变", "强加于身的宿命任务"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.2 银河图景与社会法则 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_world_id, 
    '银河图景与社会法则', 
    '不需要解释科学原理，但必须呈现繁荣、腐朽或极具异域风情的星河纪元。', 
    '{"type": "object", "title": "银河图景设定", "properties": {"超光速航行方式": {"title": "航行方式", "type": "string", "enum": ["折叠空间的星门/跃迁引擎", "依靠特殊向导(领航员/香料)的空间曲率引擎", "虫洞挖掘与古老的亚空间航道"], "x-uiWidget": "radio", "useForAI": true}, "星际社会的政体形态": {"title": "政体形态", "type": "string", "description": "在这片星河中，是高度集权的【银河帝国皇帝】统治？还是各自为战的【诸侯星域联盟】？或者是腐败的【跨星系商业理事会】？", "x-uiWidget": "textarea", "useForAI": true}, "核心冲突资源": {"title": "核心冲突资源", "type": "string", "description": "整个银河系都在为何种资源或信仰流血？（如：沙丘的香料、某种可以锻造舰队的暗物质矿、古老神明留下的遗迹技术）", "x-uiWidget": "textarea", "useForAI": true}, "文明杂交/异族风貌": {"title": "异族风貌", "type": "string", "description": "不同星球居民的杂居状态（如：拥有四只手臂的沙漠种族、完全被机械改造的义体商会、全由AI统治的计算星）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["超光速航行方式", "星际社会的政体形态", "核心冲突资源"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.3 文风设定 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_style_id, 
    '文风设定', 
    '充满古典浪漫主义与史诗悲剧色彩的壮阔行文风格。', 
    '{"type": "object", "title": "文风设定", "properties": {"语言风格": {"title": "语言风格", "type": "string", "enum": ["宏大浪漫的太空史诗体", "充满火药与鲜血的星际佣兵风", "华丽颓废的帝国宫廷权谋调"], "x-uiWidget": "radio", "useForAI": true}, "史诗感与英雄气概描述": {"title": "史诗与英雄描写", "type": "string", "description": "写作要求：少用干涩的物理数据。哪怕是在外太空进行激光互射，也要写出【重装骑兵在平原上冲锋】的冷兵器浪漫感。强调星球景观的壮丽、舰队覆灭时的悲壮、以及宿命般的对决氛围。", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["语言风格"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.4 星际冒险者与帝国巨头 (character) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_char_id, 
    '传奇船员与星际权贵', 
    '一艘船上的走私客拼凑的草台班子，或者掌握十几颗殖民星杀生大权的皇帝。', 
    '{"type": "object", "title": "人物档案", "x-titleField": "姓名与称号", "properties": {"姓名与称号": {"title": "姓名与称号", "type": "string", "description": "如：天行者卢克、废土星的拾荒者、第三舰队指挥官", "useForAI": true}, "阵营归属": {"title": "阵营归属", "type": "string", "enum": ["主角与流浪小队", "银河帝国/霸权正规军", "边境走私客/赏金猎人", "反叛军/复国组织", "掌握神秘力量的异星教派(如绝地/姐妹会)"], "x-uiWidget": "select", "useForAI": true}, "战斗流派或核心技能": {"title": "核心技能/流派", "type": "string", "description": "TA是靠什么纵横星海的？（如：能肉身驾驶星际战机的神经接入者、使用等离子光剑的近战大师、精通100种外星语言的欺诈师）", "x-uiWidget": "textarea", "useForAI": true}, "外貌与种族特征": {"title": "外貌/种族", "type": "string", "description": "给角色加上极具视觉冲击力的外星/科技特征（如：浑身覆盖着抵御强光鳞片的半蜥蜴人、装着可以变形为狙击枪的机械义肢）", "x-uiWidget": "textarea", "useForAI": true}, "背景羁绊": {"title": "背景羁绊", "type": "string", "description": "TA为什么加入主角的破船？有什么血海深仇？", "x-uiWidget": "textarea"}}, "required": ["姓名与称号", "阵营归属", "战斗流派或核心技能"]}',
    @method_id, 'character', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.5 异星奇景与巨构战场 (scene) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_scene_id, 
    '异星风貌与巨型母舰(场景)', 
    '各种极具奇幻色彩的天体、繁华污浊的太空港或是死星般的毁灭要塞。', 
    '{"type": "object", "title": "星际场景设定", "x-titleField": "星球/要塞名称", "properties": {"星球/要塞名称": {"title": "星球/要塞名称", "type": "string", "description": "如：沙暴肆虐的厄拉科斯星、帝都繁华的科洛桑、流放罪犯的冰狱星、直径百万公里的死星堡垒", "useForAI": true}, "地表/内部生态奇观": {"title": "生态与视觉奇观", "type": "string", "description": "一眼看去最震撼的画面是什么？（如：地表由纯金属构成且散发绿色荧光的海、天上同时挂着三轮不同颜色的月亮、母舰内部如同哥特式大教堂般高耸神秘的指挥中心）", "x-uiWidget": "textarea", "useForAI": true}, "风土人情与危险物": {"title": "风土人情/危险物", "type": "string", "description": "在这里会遇到什么具有浓厚“风味”的东西？（如：太空港里鱼龙混杂的赏金猎人酒馆、沙漠地下长达百米的沙虫）", "x-uiWidget": "textarea", "useForAI": true}, "战略价值": {"title": "战略价值", "type": "string", "description": "这个地方为什么必争之地？（如：控制了此处的星门就能掐断帝国补给线）", "x-uiWidget": "textarea"}}, "required": ["星球/要塞名称", "地表/内部生态奇观", "风土人情与危险物"]}',
    @method_id, 'scene', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.6 传奇飞船与神秘兵器 (prop) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_prop_id, 
    '星际载具与传奇兵装(道具)', 
    '一艘被魔改到极致的神庙级海盗船，或是代代相传的能量冷兵器。', 
    '{"type": "object", "title": "飞船与兵装", "x-titleField": "载具/兵器名称", "properties": {"载具/兵器名称": {"title": "载具/兵器名", "type": "string", "description": "如：“千年隼号”轻型走私船、“死星”歼星主炮、先知遗留下来的“原力光剑”、能够操控心智的生物装甲", "useForAI": true}, "黑科技/魔改设定": {"title": "黑科技/魔改设定", "type": "string", "description": "突破常规武器限制的地方（如：把重型巡洋舰的核变引擎塞进了一艘破旧的小艇里导致速度极快、只有特定皇室血脉才能激活的机甲）", "x-uiWidget": "textarea", "useForAI": true}, "船员/使用者羁绊": {"title": "使用者羁绊", "type": "string", "description": "这艘船或这个武器和主角群体有什么不可磨灭的故事？（如：它是主角父亲当年起义时驾驶的残骸翻新、飞船拥有一个极其话痨碎嘴的人工智能管家）", "x-uiWidget": "textarea", "useForAI": true}, "火力与弱点展示": {"title": "火力与弱点", "type": "string", "description": "虽然能一炮轰碎小行星，但有个致命缺点（如引擎过热必须每隔十分钟停机散热，给敌人可乘之机）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["载具/兵器名称", "黑科技/魔改设定"]}',
    @method_id, 'prop', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.7 霸权帝国与星图诸侯 (organization) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_org_id, 
    '帝国/商会/星际教派', 
    '太空中盘根错节的几大政治权力中心。', 
    '{"type": "object", "title": "星际政治势力", "x-titleField": "势力名称", "properties": {"势力名称": {"title": "势力名称", "type": "string", "description": "如：银河第一帝国、自由行星同盟、星际大公会、神秘的原力修道院", "useForAI": true}, "权力结构与统治方式": {"title": "权力结构", "type": "string", "description": "是依靠庞大的星际无畏舰队搞高压恐怖统治？还是依靠垄断跨星系能源(如香料/晶体)来掐死其他星球的经济？", "x-uiWidget": "textarea", "useForAI": true}, "特权兵种或武装力量": {"title": "特权兵种/武装", "type": "string", "description": "这股势力最强大的王牌（如：克隆人暴风兵团、能够进行心灵震爆的狂热信徒教团）", "x-uiWidget": "textarea", "useForAI": true}, "势力当前危机": {"title": "内部危机", "type": "string", "description": "再大的帝国也有裂缝（如：老皇帝病危导致各大总督准备造反、被压迫的下层殖民星正在串联反抗军）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["势力名称", "权力结构与统治方式", "特权兵种或武装力量"]}',
    @method_id, 'organization', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();
