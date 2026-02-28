-- -----------------------------------------------------------------------------
-- 传统古典仙侠 创作方法初始化 SQL
-- -----------------------------------------------------------------------------

SET @method_id = 107; 
SET @method_name = '传统古典仙侠';
SET @method_desc = '具有极强“仙气”与东方古典美学的正统仙侠流派。讲究名门正派的剑仙风骨、红颜知己的情道羁绊、除魔卫道的侠义精神，以及斩断凡尘飞升九天的缥缈超脱感。不重戾气夺宝，重悟道与境界拔高。';
SET @novel_type = '东方玄幻';
SET @language = 'zh';
SET @visible_categories = '["setting", "character", "scene", "prop", "organization"]';

-- 1. 创建创作方法
INSERT INTO novel_creation_method 
  (id, name, description, novel_type, language, visible_categories, created_at, updated_at)
VALUES
  (@method_id, @method_name, @method_desc, @novel_type, @language, @visible_categories, NOW(), NOW())
ON DUPLICATE KEY UPDATE
  name = VALUES(name), description = VALUES(description), novel_type = VALUES(novel_type), 
  language = VALUES(language), visible_categories = VALUES(visible_categories), updated_at = NOW();

-- 模块ID预设
SET @m_hook_id  = 8170501107000000001;
SET @m_world_id = 8170501107000000002;
SET @m_style_id = 8170501107000000003;
SET @m_char_id  = 8170501107000000004;
SET @m_scene_id = 8170501107000000005;
SET @m_prop_id  = 8170501107000000006;
SET @m_org_id   = 8170501107000000007;

-- -------------------------
-- 3.1 凡尘破局与仙缘钩子 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_hook_id, 
    '出红尘与遇真仙钩子', 
    '经典的凡世少年村落遭屠或上山寻仙拜师的开篇。', 
    '{"type": "object", "title": "宿命与仙缘", "properties": {"入仙门的执念": {"title": "执念与身世", "type": "string", "enum": ["原本普通的山村少年，遭遇魔道屠村后被路过的剑仙救走收为弟子", "背负着几世恩怨的凡间皇子，毅然放弃王权上名山求长生", "先天道体但被封印，在世俗武林除魔时被名门正派看中"], "x-uiWidget": "radio", "useForAI": true}, "仙品极高的引路人": {"title": "师傅/引路人", "type": "string", "description": "不像凡人流里的黑心师傅，古典仙侠的师傅往往是真君子。他是谁？有什么仙风道骨的表现？（如：一袭白衣，腰悬紫金葫芦，一剑退群魔的蜀山剑仙真传）", "x-uiWidget": "textarea", "useForAI": true}, "斩断凡尘的第一剑": {"title": "问道的第一步", "type": "string", "description": "主角在练剑或悟道时，是如何体现出绝顶天资或纯粹剑心的？（如：三年只练一个基础拔剑式，一旦出剑，引动满山青莲剑碑共鸣）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["入仙门的执念", "仙品极高的引路人", "斩断凡尘的第一剑"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.2 大道争锋世界观 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_world_id, 
    '正邪不两立与情劫天道法则', 
    '不以算计为主，而在乎“道心圆满”与“情劫难渡”的正邪天下格局。', 
    '{"type": "object", "title": "天道与正魔格局", "properties": {"正魔壁垒": {"title": "大世格局", "type": "string", "enum": ["正道三大宗门与魔道八荒对峙千年的神州浩土", "道、佛、妖、魔四分天下，上承天界九重天下启幽冥地府", "蜀山一剑独尊，天下万剑朝宗，然则剑山下镇压着上古万魔"], "x-uiWidget": "radio", "useForAI": true}, "道心与心魔反噬法则": {"title": "修炼核心与情劫", "type": "string", "description": "古典仙侠中，境界的提升看重感悟。如果主角动了凡心或者陷入了对错的迷惘，如何走火入魔？为什么在这里‘天道无情而人有情’是最大的冲突？", "x-uiWidget": "textarea", "useForAI": true}, "九重天劫的清洗机制": {"title": "天劫飞升法则", "type": "string", "description": "为了飞升成仙，最后要经历什么？（如三九雷劫、六九雷劫，乃至最恐怖的问心劫）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["正魔壁垒", "道心与心魔反噬法则"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.3 文风设定 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_style_id, 
    '缥缈仙姿与万丈豪情文风', 
    '抛弃市井骂街与苟且偷生。这里要写得极尽浪漫、孤高与侠骨柔情。', 
    '{"type": "object", "title": "文风设定", "properties": {"御剑乘风的古典美学": {"title": "叙事格调要求", "type": "string", "description": "战斗要求：严禁描写‘猥琐偷袭搜身’。要写‘剑气如霜贯长虹’、‘一剑光寒十九州’。描写风景要有水墨画的留白感，人物对白要蕴含佛道禅机与洒脱之意，极具金庸/古龙武侠精神的升级版仙侠化。", "x-uiWidget": "textarea", "useForAI": true}, "生死看淡的宿命感": {"title": "感情戏与悲剧色彩", "type": "string", "description": "感情戏要极其克制纯洁但刻骨铭心。为了救心爱之人，主角不惜逆天而行对抗整个正道，满身浴血但依旧把她挡在身后。写出‘不负天下却负了她’或‘为了她负了天下又如何’的宿命拉扯感。", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["御剑乘风的古典美学", "生死看淡的宿命感"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.4 傲雪仙子与偏执魔尊 (character) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_char_id, 
    '白衣胜雪名门骄女与亦正亦邪配角', 
    '这些角色不缺资源也不猥琐，他们活的是一口仙气和道义。', 
    '{"type": "object", "title": "同道与情劫档案", "x-titleField": "仙名与宗门", "properties": {"仙名与宗门": {"title": "姓名/尊号", "type": "string", "description": "如：青云门陆雪琪式的清冷师姐、掩月宗古灵精怪的圣女、魔教行事乖张但重情重义的少主", "useForAI": true}, "性格与绝世剑篇/法相": {"title": "风骨与功法", "type": "string", "description": "有什么极具辨识度的武器？（如：一袭青衣手握【天琊神剑】的清冷师姐，绝招是引动九天玄雷的【神剑御雷真诀】）", "x-uiWidget": "textarea", "useForAI": true}, "与主角的恩怨羁绊": {"title": "情与道的冲突", "type": "string", "description": "她（他）与主角为什么走向了对立面或者因为宗门成见而饱受折磨？", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["仙名与宗门", "性格与绝世剑篇/法相", "与主角的恩怨羁绊"]}',
    @method_id, 'character', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.5 仙山殿宇与镇魔塔 (scene) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_scene_id, 
    '缥缈仙境与伏魔古迹(场景)', 
    '讲究仙气缭绕或者苍凉诡异的古典神州风貌。', 
    '{"type": "object", "title": "神州仙迹档案", "x-titleField": "境域名称", "properties": {"境域名称": {"title": "仙迹名称", "type": "string", "description": "如：万剑穿云的蜀山金顶、镇压亿万邪魔的锁妖塔/伏魔珠、碧水寒潭底的老祖闭关地", "useForAI": true}, "仙家气象或大能遗音": {"title": "环境灵韵描写", "type": "string", "description": "这里的白鹤、云海、青松是如何构建出一幅绝美的仙家画卷的？", "x-uiWidget": "textarea", "useForAI": true}, "命运抉择的发生地": {"title": "戏剧冲突功能", "type": "string", "description": "主角在这里进行了什么决定天下苍生的大决战，或者在这里因为救了魔女而被三大门派祖师三堂会审逼到废去修为？（古典仙侠的重要转折地）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["境域名称", "命运抉择的发生地"]}',
    @method_id, 'scene', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.6 传世神锋与痴情奇物 (prop) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_prop_id, 
    '上古神兵与寄情信物(道具)', 
    '没有复杂的数据，只有一把能引起天地共鸣的剑或者能起死回生的仙草。', 
    '{"type": "object", "title": "神剑仙物档案", "x-titleField": "神兵/仙草名称", "properties": {"神兵/仙草名称": {"title": "神兵名称", "type": "string", "description": "如：上古魔兵【诛仙剑】、能锁魂定魄的【合欢铃】、天地间唯一能够让人起死回生的极北【还魂仙草】", "useForAI": true}, "绝境中的一剑破万法": {"title": "剑魄与威力", "type": "string", "description": "这把剑往往有灵，平时沉睡，到了主角为了守护苍生穷途末路时，会因为主角的剑心而觉醒出何等灭世的恐怖剑意？", "x-uiWidget": "textarea", "useForAI": true}, "代表着情债的宿命": {"title": "情感寄托", "type": "string", "description": "为什么这个小小的铃铛/珠子，比天下任何防御法器都重？（如：是女配角为了挡下灭劫而牺牲后留下的唯一遗物，主角终生佩带）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["神兵/仙草名称", "绝境中的一剑破万法"]}',
    @method_id, 'prop', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.7 天下道门与魔教分支 (organization) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_org_id, 
    '万古大宗与正邪对峙', 
    '不是为了压榨底层的剥削机器，而是为了维护天地正道（或者是偏执的天下极恶）有信仰传承的门派。', 
    '{"type": "object", "title": "道统教派档案", "x-titleField": "宗门教派名", "properties": {"宗门教派名": {"title": "宗派名称", "type": "string", "description": "如：统领天下正道的昆仑剑派/青云门、妄图重塑天地的鬼王宗/天魔教", "useForAI": true}, "底线极高的除魔风骨": {"title": "正道或魔道的执念", "type": "string", "description": "正道宗门为了守卫苍生，老一辈高人可以坦然赴死化为剑阵封印妖魔；而魔教则可能是因为千年前的一场不公，为了复辟不惜一切代价。", "x-uiWidget": "textarea", "useForAI": true}, "伪善与腐朽的暗面": {"title": "正邪翻转点", "type": "string", "description": "古典仙侠的冲突核心：正道高层中是否也有为了所谓的“大局”而逼迫无辜者献祭的伪君子？魔道中是否也有豪情万丈真性情的英雄？", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["宗门教派名", "底线极高的除魔风骨"]}',
    @method_id, 'organization', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();
