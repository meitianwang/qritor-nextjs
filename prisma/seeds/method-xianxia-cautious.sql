-- -----------------------------------------------------------------------------
-- 稳健/迪化流 创作方法初始化 SQL
-- -----------------------------------------------------------------------------

SET @method_id = 83; 
SET @method_name = '稳健/迪化流';
SET @method_desc = '反套路喜剧修仙流派。主角天赋极高或有变态底牌，但患有极度的“被害妄想症”，行事极其谨慎苟全，不杀得只剩灰绝不停手。而周围的配角往往会因为主角过分稳健的操作产生“迪化”脑补，误以为主角是算无遗策、高深莫测的绝世高人。';
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
SET @m_hook_id  = 8170501830000000001;
SET @m_world_id = 8170501830000000002;
SET @m_style_id = 8170501830000000003;
SET @m_char_id  = 8170501830000000004;
SET @m_scene_id = 8170501830000000005;
SET @m_prop_id  = 8170501830000000006;
SET @m_org_id   = 8170501830000000007;

-- -------------------------
-- 3.1 被害妄想症钩子 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_hook_id, 
    '被害妄想症底牌钩子', 
    '交代主角明明天下无敌却总是觉得自己很弱、需要疯狂捏底牌的开端。', 
    '{"type": "object", "title": "开局被害妄想症", "properties": {"主角绝世级底牌": {"title": "无敌底牌", "type": "string", "description": "主角手里捏着什么足以毁灭世界但他自己觉得还不够的外挂？（如：体内封印着一把能秒杀神仙的剑灵，但他平时只敢拿来削苹果；已经修炼到了大乘期，却一直隐匿气息装成练气三层）", "x-uiWidget": "textarea", "useForAI": true}, "引发稳健的心理创伤": {"title": "被害妄想症来源", "type": "string", "description": "主角为什么这么苟？（如：因为他穿越前是个极度严谨的程序员，认为世界上充满了随时会让他报错猝死的Bug，所以他把修仙当成了排雷工程）", "x-uiWidget": "textarea", "useForAI": true}, "被迫装逼的事件": {"title": "迪化开端事件", "type": "string", "description": "由于某个意外，主角不小心暴露了万分之一的实力，让周围人脑补成了绝世高人。（如：主角为了防蚊子随手画了个阵眼，被宗门祖师爷看到震惊为上古失传的护宗大阵）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["主角绝世级底牌", "引发稳健的心理创伤", "被迫装逼的事件"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.2 极度危险(脑补)世界观 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_world_id, 
    '全员卧底的世界与降维打击法则', 
    '在主角眼里连路边的狗都是卧底，在配角眼里主角连呼吸都是在下大局。', 
    '{"type": "object", "title": "天道与阴门法则", "properties": {"极其复杂的卧底生态": {"title": "主角眼中的世界", "type": "string", "description": "描述这个世界在凡人看来如何（如正魔分明），但在主角的脑补里又是什么样（如：“这个拿扫帚的门童站位极其讲究，必定是隐藏了三百年的魔教奸细，我必须先下手为强”）", "x-uiWidget": "textarea", "useForAI": true}, "迪化降智传染机制": {"title": "配角眼中的世界", "type": "string", "description": "周围的配角、甚至反派的大佬们，是如何对主角的普通行为进行高难度阅读理解的？", "x-uiWidget": "textarea", "useForAI": true}, "因果抹除法则": {"title": "底线法则", "type": "string", "description": "稳健流的最高法则：绝不沾染任何因果（哪怕是桃花债）。一旦结仇，哪怕对方只是个凡人，主角也会不远万里去斩草除根以绝后患。", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["极其复杂的卧底生态", "迪化降智传染机制"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.3 文风设定 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_style_id, 
    '喜剧脑补与反差文风', 
    '内心惊慌与外界震撼同时发生的错位喜剧文体。', 
    '{"type": "object", "title": "文风设定", "properties": {"全知视角的错位滑稽感": {"title": "行文核心重点", "type": "string", "description": "必须要用上帝视角，同时写出【主角内心的极其怂/谨慎】与【配角内心的顶礼膜拜】这两种截然不同、甚至完全相反的心理描写。对比越强烈，喜剧效果越好。", "x-uiWidget": "textarea", "useForAI": true}, "战斗中的病态严谨描写": {"title": "战斗细节刻画", "type": "string", "description": "战斗要求极其严密的“火力覆盖”。比如打一个水史莱姆，主角直接祭出了九昧真火，甚至还要用骨灰拌水泥把它埋进地下十八层阵法里才觉得安全。", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["全知视角的错位滑稽感"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.4 狂热崇拜者与被迫害妄想反派 (character) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_char_id, 
    '迪化配角群盲', 
    '负责对主角的行为进行狂热解读的徒弟、师妹或者反倒把自己吓死的魔教巨星。', 
    '{"type": "object", "title": "迪化角色群像", "x-titleField": "角色称呼与身份", "properties": {"角色称呼与身份": {"title": "称呼/身份", "type": "string", "description": "如：自认为顿悟了的傲娇小师妹、其实是被忽悠瘸了的魔门老祖", "useForAI": true}, "脑补方向": {"title": "迪化解读机制", "type": "string", "description": "这个角色遇到主角后，把主角的什么猥琐行为脑补成了惊天神威？（如：主角因为肚子疼弯下了腰，被反派老祖解读为‘此人居然能将杀机完美融入自然，正在蓄积破天一剑，快逃！’）", "x-uiWidget": "textarea", "useForAI": true}, "沦陷过程": {"title": "沦陷/崇拜点", "type": "string", "description": "因为这个误会，该角色成为了彻底的主角吹（迷弟迷妹），甚至主动出去帮主角到处宣传拉仇恨（主角最怕的事）。", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["角色称呼与身份", "脑补方向"]}',
    @method_id, 'character', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.5 无敌道场与天险 (scene) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_scene_id, 
    '被魔改成堡垒的居所(场景)', 
    '主角为了防备空气中的假想敌而打造出的丧心病狂的住处。', 
    '{"type": "object", "title": "稳健场景图", "x-titleField": "阵法/山头名", "properties": {"阵法/山头名": {"title": "场景/居所名", "type": "string", "description": "如：号称全派最安全且布置了十二层防偷窥虚空大阵的小琼峰、被主角改造成了自爆要塞的洞府", "useForAI": true}, "丧心病狂的防御机制": {"title": "病态的防护", "type": "string", "description": "主角在里面布置了什么让大罗金仙看了都头皮发麻的阴间陷阱？（如：连茅坑底下都连通了护山大雷阵，一旦有人偷袭就会被雷劈碎元神）", "x-uiWidget": "textarea", "useForAI": true}, "外人的错误参观认知": {"title": "配角视角", "type": "string", "description": "不知情的外人来到这里，以为这些陷阱是绝世高人考验道心的设置，纷纷顶礼膜拜。", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["阵法/山头名", "丧心病狂的防御机制"]}',
    @method_id, 'scene', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.6 降维道具与伪装马甲 (prop) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_prop_id, 
    '阴人数与多重马甲(道具)', 
    '全是用来跑路、替死、改变容貌和秒杀微小生物的降维变态法宝。', 
    '{"type": "object", "title": "稳健流底牌", "x-titleField": "法宝/伪装名称", "properties": {"法宝/伪装名称": {"title": "底牌/马甲名", "type": "string", "description": "如：替身纸人（能完美替死且分出神识）、能改换十八种灵力波动的百变面具、专门用来扬灰的极化高温火焰瓶", "useForAI": true}, "过度使用的降维打击": {"title": "使用场合的荒谬性", "type": "string", "description": "这东西威力大得离谱，但主角拿它来干嘛？（如：主角为了掩盖自己出门丢了一块香皂的线索，直接激活了能毁城灭地的陨石符把整个山泉炸成了巨坑）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["法宝/伪装名称", "过度使用的降维打击"]}',
    @method_id, 'prop', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.7 被吓坏的魔宗 (organization) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_org_id, 
    '被迪化的高层架构', 
    '主角所在的本来是个小破宗门，被外界传成了圣地；而真正的大魔宗，每天都在被主角的马甲吓得瑟瑟发抖。', 
    '{"type": "object", "title": "势力阵营", "x-titleField": "宗门/敌对势力名", "properties": {"宗门/敌对势力名": {"title": "宗门名称", "type": "string", "description": "如：主角所在的落魄小宗、天天想搞事的极恶魔殿", "useForAI": true}, "被主角强行拉高的逼格": {"title": "被迪化的组织评价", "type": "string", "description": "主角因为不想惹事，随随便便给宗门设了一套大阵。导致全修仙界以为这里潜伏着大罗金仙，魔教甚至主动送钱来求和。", "x-uiWidget": "textarea", "useForAI": true}, "被迫营业的高层": {"title": "宗主/掌门的反应", "type": "string", "description": "主角的掌门师傅其实很菜，但在外界的狂热崇拜下，他只能硬着头皮装出深不可测的高手风范，每天靠止抖药掩盖自己发抖的双腿。", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["宗门/敌对势力名", "被主角强行拉高的逼格"]}',
    @method_id, 'organization', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();
