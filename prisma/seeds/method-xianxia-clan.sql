-- -----------------------------------------------------------------------------
-- 家族修仙/种田流 创作方法初始化 SQL
-- -----------------------------------------------------------------------------

SET @method_id = 86; 
SET @method_name = '家族修仙/种田流';
SET @method_desc = '主打模拟经营与群像养成的休闲修仙流派。主角往往作为一个没落修仙家族的族长或外挂老祖，不再局限于个人打打杀杀。而是通过开辟灵田、炼丹制符、寻找灵脉、测试后背灵根、与其他家族联姻结盟，一步步将一个九流小家族发展为威震天下的千古世家的种田发育过程。';
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
SET @m_hook_id  = 8170501860000000001;
SET @m_world_id = 8170501860000000002;
SET @m_style_id = 8170501860000000003;
SET @m_char_id  = 8170501860000000004;
SET @m_scene_id = 8170501860000000005;
SET @m_prop_id  = 8170501860000000006;
SET @m_org_id   = 8170501860000000007;

-- -------------------------
-- 3.1 家族破产钩子 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_hook_id, 
    '烂摊子与振兴系统钩子', 
    '这是模拟经营游戏的开局，主角接手了一个即将被灭族或破产的家族。', 
    '{"type": "object", "title": "临危受命的开端", "properties": {"极其惨淡的家族现状": {"title": "家族破败现状", "type": "string", "enum": ["老族长（上代支柱）意外陨落，周边敌对家族随时准备吞并灵石矿脉", "家族被大宗门发配到了灵气枯竭的边疆斩妖，族内只剩老弱病残", "主角穿越成祠堂里的老祖宗玉牌/残魂，看着后代子孙穷得连练气丹都买不起"], "x-uiWidget": "radio", "useForAI": true}, "主角的领袖身份": {"title": "接锅身份", "type": "string", "description": "主角是以什么身份全盘接手的？（如：前线受重伤退下来的年轻少族长，被迫在一堆烂账前挑起大梁）", "x-uiWidget": "textarea", "useForAI": true}, "第一个救命稻草(金手指/机缘)": {"title": "第一桶金", "type": "string", "description": "为了度过第一个月的灵石结账危机，主角使用了什么外挂或者发现？（如：系统奖励了一个【一阶极品聚灵阵盘】，或者是发现后山的枯井下面其实藏着一条微型火系灵脉）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["极其惨淡的家族现状", "主角的领袖身份", "第一个救命稻草(金手指/机缘)"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.2 灵山灵脉与宗族法则世界观 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_world_id, 
    '凡灵共生与地盘争夺的世界法则', 
    '在这个世界里，个人武勇不如一条持续产出的灵脉重要。', 
    '{"type": "object", "title": "修真地主法则", "properties": {"修仙界GDP与产业链": {"title": "灵气与产出设定", "type": "string", "description": "说明这个世界的物价。比如丹药、符箓和法器是如何制造流通的？为什么一条“二阶下品水灵脉”能够养活三百个修仙者和十万凡人？", "x-uiWidget": "textarea", "useForAI": true}, "血脉与凡人界的共生": {"title": "宗族繁衍设定", "type": "string", "description": "修仙者不能无性繁殖。他们必须要庇护几十万拥有同源血脉的凡人城镇（凡人俗世基数）。因为只有庞大的凡人基数，每一百年才能测出几个拥有灵根的修仙苗子。凡人是家族根基。", "x-uiWidget": "textarea", "useForAI": true}, "附属与朝贡体系": {"title": "大宗门吸血规则", "type": "string", "description": "主角的家族不是独立王国。他们上面往往还有一个“元婴大宗门”。主角家族身为附庸，每年必须上交利润的百分之三十作为“保护费”，或者每隔五十年必须派弟子替大宗门去参加血色试炼填命。", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["修仙界GDP与产业链", "血脉与凡人界的共生", "附属与朝贡体系"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.3 文风设定 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_style_id, 
    '大账本时代的温馨种田文风', 
    '大量的盘货、收支计算以及看到子嗣成长的“模拟人生”老父亲视角文体。', 
    '{"type": "object", "title": "文风设定", "properties": {"种田记账式的琐碎详情": {"title": "日常感与大账本描写", "type": "string", "description": "写作要求：战斗不是最急的。最急的是主角深夜对着灯算账。比如‘算上方才卖出去的五百斤一阶回春草，减去本月五十名练气初期弟子的月供，结余下品灵石七十八块。距离买那枚护族大阵的阵眼还差一千灵石，主角揉了揉眉心，看样子明日得让老三去坊市把那批皮货散了。’", "x-uiWidget": "textarea", "useForAI": true}, "家族凝聚力的温情群像": {"title": "宗族血脉温情感", "type": "string", "description": "这里没有尔虞我诈的背叛（外敌除外）。家族内部虽然有争吵，但到了对外作战拼刺刀的时候，老一辈练气九层的长老会毫不犹豫地自爆丹田拖住敌人，只为了给年轻天才弟子争取逃亡的时间。要写出那种“传承不断”的悲壮与温情。", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["种田记账式的琐碎详情", "家族凝聚力的温情群像"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.4 族内长老与天才幼崽 (character) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_char_id, 
    '各司其职的族长团队与各具天赋的后辈', 
    '主角不能一个人干完所有事，他需要有专门负责种田、打架、外交的左膀右臂。', 
    '{"type": "object", "title": "家族成员/后辈档案", "x-titleField": "族谱辈分与姓名", "properties": {"族谱辈分与姓名": {"title": "姓名与职位", "type": "string", "description": "如：【诚】字辈的三长老李诚风、专门负责教学堂的九姑、刚刚测出变异冰灵根的五岁小天才李延年", "useForAI": true}, "修真手艺与特长": {"title": "家族职务/副业", "type": "string", "description": "在家族修仙里，每个高层都要会副手艺。如：三长老是全族唯一的一阶上品炼丹师；十一叔斗法不行但他极其精通灵稻杂交和驱虫法术，是灵田大主管。", "x-uiWidget": "textarea", "useForAI": true}, "血脉贡献与牺牲": {"title": "对家族的付出", "type": "string", "description": "作为长辈，他们放弃了个人修为寸进的希望，每天都在为小辈扫清障碍赚取灵石。或者年轻一辈为了给祖爷爷求延寿果，单枪匹马杀入了禁地险死还生。", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["族谱辈分与姓名", "修真手艺与特长"]}',
    @method_id, 'character', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.5 灵山领地与凡骨凡池 (scene) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_scene_id, 
    '家族基业地图(场景)', 
    '这就是主角辛辛苦苦打下来的江山版图，每一座灵田都在生产着金币。', 
    '{"type": "object", "title": "家族领地资产图", "x-titleField": "领地/资产名称", "properties": {"领地/资产名称": {"title": "建设模块名称", "type": "string", "description": "如：家族核心【青炎灵山主峰】、山脚下的【五百亩一级灵稻梯田】、家族庇护的俗世凡城【宁远县城】、测灵大殿", "useForAI": true}, "灵气评级与产出价值": {"title": "基建资产规模", "type": "string", "description": "仔细盘点这就是家族的底子。比如主峰有一条一阶极品灵脉，只够族长和一个筑基期长老常年供养闭关。灵稻田每年的产粮是整个家族60%的固定收入来源。一旦这里遭遇虫害/魔门入侵，全家都要喝西北风。", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["领地/资产名称", "灵气评级与产出价值"]}',
    @method_id, 'scene', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.6 护族大阵与大笔物资 (prop) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_prop_id, 
    '基建道具与底蕴传承之物(道具)', 
    '不是为了个人单挑的牛逼神器，而是能庇护千人的公共设施或是能传承功法的高阶玉简。', 
    '{"type": "object", "title": "镇族与基建法宝", "x-titleField": "战略法宝/物资名称", "properties": {"战略法宝/物资名称": {"title": "物资种类", "type": "string", "description": "如：残破的二阶【小五行迷踪阵】阵旗、家族祖传但目前没人能参透的残卷玉简、用来当做战略储备的一大箱高爆符箓", "useForAI": true}, "家族安全感/威慑力": {"title": "战略核武器价值", "type": "string", "description": "这是一个修仙势力的“核保护伞”。比如这个护族大阵一开，每天烧十块中品灵石，但它可以让外头三个筑基期老怪联手打上三天三夜都破不开防御。是危急存亡之秋的最后保障。", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["战略法宝/物资名称", "家族安全感/威慑力"]}',
    @method_id, 'prop', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.7 邻里宗族与吸血大宗 (organization) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_org_id, 
    '地缘政治与宗门霸权生态', 
    '修仙界也是有国界和地头蛇的，远交近攻是不变的真理。', 
    '{"type": "object", "title": "外交/敌对修真势力", "x-titleField": "势力名称", "properties": {"势力名称": {"title": "宗族/组织名称", "type": "string", "description": "如：隔壁抢水源的世仇王家、主角结盟联姻的百草阁商会、常年向大家收高额保护费的玉剑门落云宗", "useForAI": true}, "地缘冲突与利益瓜分": {"title": "冲突根源与贸易", "type": "string", "description": "为什么主角家族和隔壁王家是不死不休的世仇？可能是一百年前为了一条刚刚发现的小型紫铜矿脉打死过对方的少族长。双方每年都会在边界森林里互相猎杀对方落单采药的底层弟子。", "x-uiWidget": "textarea", "useForAI": true}, "朝贡附庸的压榨与利用": {"title": "大宗门博弈", "type": "string", "description": "说明主角作为附庸势力，是如何在大宗门使者面前装孙子交出灵药，又是如何巧妙利用大宗门的法令（如上宗规定不允许附属家族大规模灭门）来震慑隔壁敌对家族不敢明着动手的。", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["势力名称", "地缘冲突与利益瓜分"]}',
    @method_id, 'organization', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();
