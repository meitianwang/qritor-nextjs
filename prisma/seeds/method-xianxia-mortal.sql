-- -----------------------------------------------------------------------------
-- 凡人流 (Mortal Cultivation) 创作方法初始化 SQL
-- -----------------------------------------------------------------------------

SET @method_id = 81; 
SET @method_name = '凡人修仙流 (Mortal Cultivation)';
SET @method_desc = '主打"资源极度匮乏、修仙界丛林法则与算计生还"的玄幻大类。主角没有逆天资质和背景，完全依靠唯一的辅助类金手指（如催熟灵药的瓶子）、谨慎的心性以及杀人夺宝果断的执行力，在残酷的修仙界苟且偷生并最终登顶。';
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
SET @m_hook_id  = 8170501810000000001;
SET @m_world_id = 8170501810000000002;
SET @m_style_id = 8170501810000000003;
SET @m_char_id  = 8170501810000000004;
SET @m_scene_id = 8170501810000000005;
SET @m_prop_id  = 8170501810000000006;
SET @m_org_id   = 8170501810000000007;

-- -------------------------
-- 3.1 凡人入世钩子 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_hook_id, 
    '底层求生与意外机缘钩子', 
    '主角作为一个毫无修仙大背景的凡人，因为生活所迫或者意外接触到修仙者的血腥内幕。', 
    '{"type": "object", "title": "凡人入阵", "properties": {"极其低微的初始身份": {"title": "初始身份", "type": "string", "enum": ["偏远山村被卖入江湖小门派的孩童", "修仙家族中最边缘、靠种田维生的外围低阶杂役", "以采药为生意外跌入深谷的乡村少年"], "x-uiWidget": "radio", "useForAI": true}, "改变命运的唯一金手指": {"title": "伪资质/资源型金手指", "type": "string", "description": "不是系统，也不是老爷爷。凡人流的金手指必须是【资源挂】。（如：一个可以十倍催熟灵草的小绿瓶、一块可以提纯灵石杂质的神秘碎布）", "x-uiWidget": "textarea", "useForAI": true}, "引路人/险恶的第一劫": {"title": "险恶的开局危机", "type": "string", "description": "主角碰到的第一个修仙者/导师并不善良。（如：师傅收徒是为了把他练成夺舍的肉身或者人丹，主角发现真相后必须装傻并寻找反杀机会）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["极其低微的初始身份", "改变命运的唯一金手指", "引路人/险恶的第一劫"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.2 黑暗森林世界观 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_world_id, 
    '掠夺与寿命的世界法则', 
    '修仙界没有道德，只有赤裸裸的资源争夺。所有修仙者的目标都是在寿元耗尽前抢到筑基丹/结丹资源。', 
    '{"type": "object", "title": "黑暗修仙法则", "properties": {"资源极度枯竭的现状": {"title": "修真界现状", "type": "string", "enum": ["上古灵气衰退，天材地宝绝迹，练气期遍地走但筑基期极少", "正魔大战后的废墟修仙界，为了争夺残破灵石矿脉日日厮杀", "修仙大宗门垄断了所有灵气名山与进阶丹药，散修如野草"], "x-uiWidget": "radio", "useForAI": true}, "残酷的境界壁垒": {"title": "境界壁垒与寿命", "type": "string", "description": "说明每个大境界（练气-筑基-结丹）之间难以逾越的鸿沟，以及必须依赖何等稀有的丹药才能突破。卡在瓶颈的人必须去杀人越货。", "x-uiWidget": "textarea", "useForAI": true}, "坊市与杀人夺宝规则": {"title": "坊市黑吃黑法则", "type": "string", "description": "离开有阵法保护的交易坊市后，修仙者是如何互相跟踪、埋伏并下黑手的？", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["资源极度枯竭的现状", "残酷的境界壁垒"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.3 文风设定 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_style_id, 
    '写实与算计交织的文风', 
    '摒弃华丽的装逼打脸，强调老辣的算计、跑路的谨慎和分赃的实在感。', 
    '{"type": "object", "title": "文风设定", "properties": {"叙事口吻": {"title": "主角行为逻辑文风", "type": "string", "enum": ["极其冷酷、利益至上的市井老法师式", "表面唯唯诺诺、心怀鬼胎苟到底的腹黑式", "谋定而后动、战前准备三章战后摸尸体三章的严谨流"], "x-uiWidget": "radio", "useForAI": true}, "战斗描写要点": {"title": "战斗写实感要求", "type": "string", "description": "写作要求：斗法不要全屏光波互爆。要写实：主角扔出三张初级火弹符试探，暗地里已经扣住了一根毒针法器，并在脚下布置了土遁术随时准备逃跑。一定要写出底牌尽出、斗智斗勇的惊险感。", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["叙事口吻"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.4 算计者与死道友 (character) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_char_id, 
    '同道枭雄与老怪', 
    '这里没有无脑的配角，所有修仙者都是活了几百年的老狐狸和伪善的道友。', 
    '{"type": "object", "title": "修士散修/名宿档案", "x-titleField": "姓名与道号", "properties": {"姓名与道号": {"title": "姓名/道号", "type": "string", "description": "如：黄枫谷陈师兄、邪修墨大夫、结丹期穹老怪", "useForAI": true}, "虚伪人设 vs 真实目的": {"title": "表面人设与狠毒底牌", "type": "string", "description": "这些修仙者平时看起来仙风道骨（如：和蔼可亲愿意指点晚辈的长老），一到血色试炼或者争夺宝物时，立马翻脸不认人，使用阴损法器。", "x-uiWidget": "textarea", "useForAI": true}, "修为境界与看家法宝": {"title": "境界与法宝", "type": "string", "description": "他的绝对实力如何？手里捏着什么阴人的底牌？（如：练气十三层顶峰，手持本命法器【青蛟旗】与隐形的【无影针】）", "x-uiWidget": "textarea", "useForAI": true}, "与主角的拉扯交锋": {"title": "算计交锋点", "type": "string", "description": "他如何被主角反算计或者成功从主角手中逃走定下血仇？", "x-uiWidget": "textarea"}}, "required": ["姓名与道号", "虚伪人设 vs 真实目的", "修为境界与看家法宝"]}',
    @method_id, 'character', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.5 秘境与黑市 (scene) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_scene_id, 
    '血色试炼与交易坊市(场景)', 
    '表面交易实则充满杀机的坊市，或者十年开一次进入即死伤过半的宗门秘境。', 
    '{"type": "object", "title": "修真场景档案", "x-titleField": "场景名称", "properties": {"场景名称": {"title": "地名名称", "type": "string", "description": "如：血色禁地、太南小会、虚天殿、坠魔谷", "useForAI": true}, "限制与危机环境": {"title": "进入限制与危机", "type": "string", "description": "这里有哪些天生阵法或者毒瘴限制？（如：只有练气期的低阶弟子才能进入的阵法空隙，里面除了有上古残暴妖兽，还有比妖兽更可怕的其他四派弟子猎杀者）", "x-uiWidget": "textarea", "useForAI": true}, "核心高阶产出物": {"title": "必争之源", "type": "string", "description": "为了什么导致大家在这里疯狂厮杀？（如：炼制筑基丹的最后两样绝迹主药、元婴老怪的遗蜕）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["场景名称", "限制与危机环境"]}',
    @method_id, 'scene', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.6 符箓阴器与罕见丹方 (prop) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_prop_id, 
    '法器灵药与阵盘(道具)', 
    '不强调整体毁天灭地，而强调功能性和老六属性的阴损修仙道具。', 
    '{"type": "object", "title": "造化与法器档案", "x-titleField": "物品名称", "properties": {"物品名称": {"title": "法器/丹药/阵法名", "type": "string", "description": "如：初级高阶符箓【降灵符】、阴毒极品法器【噬魂幡】、极其难炼的【筑基丹】、伪装用的【敛气术】", "useForAI": true}, "功能性与短板": {"title": "功能/缺陷", "type": "string", "description": "主角不会用完美的法宝。这件东西可能威力巨大但必须要用精血催动（折寿），或者只能偷袭用一次就碎雷弹。", "x-uiWidget": "textarea", "useForAI": true}, "炼制/获取的艰辛考量": {"title": "获取/炼制门槛", "type": "string", "description": "在凡人流中，买一件法器要凑很久的灵石。如果这是主角的东西，说明主角为了得到它，杀了什么人或者卖了多少催熟的药草攒钱？", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["物品名称", "功能性与短板"]}',
    @method_id, 'prop', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.7 宗门与散修盟 (organization) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_org_id, 
    '修真门派与魔道六宗', 
    '主角前期必须仰仗、后期必须利用甚至逃离的修仙机器。', 
    '{"type": "object", "title": "宗门/散修联盟档案", "x-titleField": "宗门名称", "properties": {"宗门名称": {"title": "宗门名称", "type": "string", "description": "如：越国七派之一黄枫谷、魔道合欢宗、海外星海散修盟", "useForAI": true}, "剥削底层的宗门规矩": {"title": "修仙门派剥削法则", "type": "string", "description": "没有任何宗门是来做慈善的。他们招揽低阶弟子是为了什么？（如：要求新入门弟子必须去矿洞挖灵石十年，或者强迫他们去九死一生的秘境采药上交只能换取微薄的贡献点）", "x-uiWidget": "textarea", "useForAI": true}, "与主角的敌我关系转换": {"title": "主角苟且与抽身之道", "type": "string", "description": "主角早期如何借用宗门大旗扯虎皮做大旗？当正魔大战爆发宗门要拿主角当弃子炮灰时，主角是如何果断跑路抛弃门派的？", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["宗门名称", "剥削底层的宗门规矩"]}',
    @method_id, 'organization', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();
