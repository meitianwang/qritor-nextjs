-- -----------------------------------------------------------------------------
-- 洪荒流 (Prehistoric/Honghuang) 创作方法初始化 SQL
-- -----------------------------------------------------------------------------

SET @method_id = 82; 
SET @method_name = '洪荒流 (Prehistoric/Honghuang)';
SET @method_desc = '主打"天地未分、圣人算计、先天灵宝与因果气运"的中国神话大圆满修仙系统。基于《山海经》《封神》等，主角往往重生回到龙汉、巫妖大战前，通过夺取天地气运和先天至宝谋求大道圣人果位。';
SET @novel_type = '东方玄幻';
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
SET @m_hook_id  = 8170501820000000001;
SET @m_world_id = 8170501820000000002;
SET @m_style_id = 8170501820000000003;
SET @m_char_id  = 8170501820000000004;
SET @m_scene_id = 8170501820000000005;
SET @m_prop_id  = 8170501820000000006;
SET @m_org_id   = 8170501820000000007;

-- -------------------------
-- 3.1 混沌重生钩子 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_hook_id, 
    '开天辟地与大劫重演钩子', 
    '主角重生为先天生灵，熟知后世神话走向，必须在量劫到来前疯狂布局。', 
    '{"type": "object", "title": "降生与量劫开端", "properties": {"洪荒初始跟脚": {"title": "先天跟脚", "type": "string", "enum": ["天地初开的第一缕云霞/异火", "紫霄宫听道的三千红尘客之一(极其边缘)", "注定会在巫妖大劫中死得很惨的妖帝十太子(金乌)", "后土化轮回前的一滴盘古精血"], "x-uiWidget": "radio", "useForAI": true}, "即将到来的量劫危机": {"title": "天道大劫", "type": "string", "description": "距离主角头顶最近的一次天道大清洗是什么？（如：龙汉初劫：龙凤麒麟三族混战；巫妖量劫：妖族管天巫族管地最终两败俱伤）", "x-uiWidget": "textarea", "useForAI": true}, "窃取天机的初级布局": {"title": "抢夺机缘", "type": "string", "description": "主角知道三清和女娲还在孕育，趁着大能还没发迹，他第一步去截胡了谁的机缘？（如：提前跑去不周山脚挖走了本该属于元始天尊的造化青莲）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["洪荒初始跟脚", "即将到来的量劫危机", "窃取天机的初级布局"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.2 天道因果世界观 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_world_id, 
    '圣人棋盘与天道气运', 
    '洪荒流不讲物理，只讲因果、业障、气运和天道大势不可改但小势可改的博弈论。', 
    '{"type": "object", "title": "天道与气运法则", "properties": {"气运与功德系统": {"title": "无量功德", "type": "string", "description": "功德是这里的硬通货。主角做了什么顺应天道（或者钻天道空子）的事情捞取了大量功德不用受天劫？（如：代替女娲首创某些东西、提前传下某种修行法门）", "x-uiWidget": "textarea", "useForAI": true}, "九幽因果律": {"title": "因果业障法则", "type": "string", "description": "杀人沾染业力。如果随便杀掉天命之子会有什么后果？", "x-uiWidget": "textarea", "useForAI": true}, "斩三尸与成圣之法": {"title": "成道之基", "type": "string", "enum": ["以力证道(盘古路线，百分百失败)", "斩三尸证道(鸿钧传下的正统)", "功德成圣(女娲造人路线)", "自创的小众证道(如法则证道、开辟内世界)"], "x-uiWidget": "radio", "useForAI": true}}, "required": ["气运与功德系统", "斩三尸与成圣之法"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.3 文风设定 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_style_id, 
    '煌煌天威与大道古韵', 
    '极其宏大、动古论今、万物皆蝼蚁的神话史诗调性。', 
    '{"type": "object", "title": "文风设定", "properties": {"宏大古韵口吻": {"title": "文笔要求", "type": "string", "description": "写作要求：抛弃白话文感，战斗不是刀拳互殴。而是动辄：‘某某道人顶上庆云显化，三花聚顶，五气朝元。只把手中拂尘一扫，便有三万六千道混沌剑气撕裂虚空！’必须使用极具中国古典神话韵味的专有名词。", "x-uiWidget": "textarea", "useForAI": true}, "量级修饰": {"title": "空间与时间量级", "type": "string", "description": "洪荒没有公里和小时。“此去不周山，相隔亿万万里，大罗金仙也要飞上三个元会”。时间单位必须是【元会】（一元会十二万九千六百年）。", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["宏大古韵口吻"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.4 先天神魔与万妖 (character) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_char_id, 
    '三清大能与洪荒古兽', 
    '全是大老天爷级别的存在，随便拉一个出来在别的书里都是创世神。', 
    '{"type": "object", "title": "神魔与大能档案", "x-titleField": "尊名与跟脚", "properties": {"尊名与跟脚": {"title": "尊称/跟脚", "type": "string", "description": "如：上清通天教主、妖族东皇太一、红云老祖或冥河老祖", "useForAI": true}, "修为顶峰与所修法则": {"title": "修为与主修大道", "type": "string", "description": "如：准圣大圆满，修的是杀戮大道与血海不灭之体", "x-uiWidget": "textarea", "useForAI": true}, "伴生至宝与杀招": {"title": "伴生至宝", "type": "string", "description": "他一出生怀里抱着什么开天辟地的东西？（如：太一的混沌钟可以直接镇压空间）", "x-uiWidget": "textarea", "useForAI": true}, "既定宿命与主角干预": {"title": "洪荒宿命改变", "type": "string", "description": "原本他注定怎么死（如红云必被紫气反噬而亡），主角是如何救下他或者提前害死他的？", "x-uiWidget": "textarea"}}, "required": ["尊名与跟脚", "修为顶峰与所修法则", "伴生至宝与杀招"]}',
    @method_id, 'character', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.5 仙山与混沌界 (scene) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_scene_id, 
    '洞天福地与三十三天外(场景)', 
    '充满先天紫气、能够孕育天道至宝的道场。', 
    '{"type": "object", "title": "洪荒地界档案", "x-titleField": "地界名称", "properties": {"地界名称": {"title": "神话地标", "type": "string", "description": "如：不周山脊、三十三天外紫霄宫、无边幽冥血海、昆仑仙境", "useForAI": true}, "地貌与先天本源": {"title": "地貌与本源气象", "type": "string", "description": "如果是盘古脊柱化成的不周山，那里应当拥有何等极其恐怖的重力威压让大罗金仙都寸步难行？", "x-uiWidget": "textarea", "useForAI": true}, "孕育的大机缘/大恐怖": {"title": "孕育之物", "type": "string", "description": "这里藏着什么让圣人都眼红的宝气？或者是盘古开天后留下的第一道戾气？", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["地界名称", "地貌与先天本源"]}',
    @method_id, 'scene', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.6 先天灵宝与混沌奇物 (prop) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_prop_id, 
    '先天灵根与造化至宝(道具)', 
    '每一件灵宝都带有镇压气运、不沾因果的无上权能。这往往是洪荒文最大的爽点。', 
    '{"type": "object", "title": "灵宝与灵根档案", "x-titleField": "至宝名称", "properties": {"至宝名称": {"title": "法宝品阶与名称", "type": "string", "description": "如：【先天至宝】太极图、【极品先天灵宝】十二品业火红莲、【十大先天灵根】人参果树", "useForAI": true}, "天道法则具现化": {"title": "功能(天道权柄)", "type": "string", "description": "这种宝物不是拿来砍人的。它是法则。比如：【落宝金钱】能落下所有没有它品级高的先天法宝并且能够计算天机。或者【十二品金莲】坐上去万邪不侵镇压西方教气运。", "x-uiWidget": "textarea", "useForAI": true}, "出世/截胡经过": {"title": "主角截胡过程", "type": "string", "description": "这东西原本属于谁，主角靠着【天机遮掩符】或者【鸿蒙紫气】是怎么神不知鬼不觉偷走的？", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["至宝名称", "天道法则具现化"]}',
    @method_id, 'prop', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.7 圣人大教与先天三族 (organization) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_org_id, 
    '道统教派与远古霸主', 
    '鸿钧座下的几大圣人道统以及称霸洪荒的两族。', 
    '{"type": "object", "title": "道统法脉大族", "x-titleField": "势力名称", "properties": {"势力名称": {"title": "教派/大族名", "type": "string", "description": "如：截教(万仙来朝)、阐教(阐述天道精英主义)、上古妖庭(管天)、十二祖巫(管地)", "useForAI": true}, "教义与收徒法则": {"title": "教义与护短传统", "type": "string", "description": "通天教主主张有教无类（招收披毛戴角之辈）；元始天尊极度看重跟脚鄙视妖族；西方教到处去东方打秋风说\"此子与我佛有缘\"强行渡化。", "x-uiWidget": "textarea", "useForAI": true}, "不可逆的量劫结局": {"title": "天数注定", "type": "string", "description": "在原版封神/神话中，这个势力是怎么被算计得彻底毁宗灭派的？（主角后来力挽狂澜的地方）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["势力名称", "教义与收徒法则"]}',
    @method_id, 'organization', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();
