-- -----------------------------------------------------------------------------
-- 长生苟道流 创作方法初始化 SQL
-- -----------------------------------------------------------------------------

SET @method_id = 85; 
SET @method_name = '长生苟道流';
SET @method_desc = '强调极度长寿体验的反套路修仙流派。主角开局就获得系统赐予的“长生不老”或无限寿元，但也意味着他没有任何修炼加成。于是他选择疯狂地“苟”（龟缩隐忍）。他唯一的取胜之道就是凭借无限的时间，熬死敌人甚至熬死修真界所有的天才。';
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
SET @m_hook_id  = 8170501850000000001;
SET @m_world_id = 8170501850000000002;
SET @m_style_id = 8170501850000000003;
SET @m_char_id  = 8170501850000000004;
SET @m_scene_id = 8170501850000000005;
SET @m_prop_id  = 8170501850000000006;
SET @m_org_id   = 8170501850000000007;

-- -------------------------
-- 3.1 凡人长生系统钩子 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_hook_id, 
    '长生不老与极差资质的废柴钩子', 
    '交代主角获得了不死的寿命，但也拥有全天下最差的灵根。因此他必须避开所有高死亡率的争斗。', 
    '{"type": "object", "title": "降生与金手指配置", "properties": {"极其低劣的悟性灵根": {"title": "修真资质", "type": "string", "enum": ["修仙界最废的废灵根甚至根本没有灵根只有凡人武功", "需要耗费普通人数百倍资源才能升一小阶的体质", "修炼极慢但只要活够五百年就能稳稳当当晋升一次"], "x-uiWidget": "radio", "useForAI": true}, "无限属性面板加点": {"title": "时间法则金手指", "type": "string", "description": "系统长什么样？（如：活过一天就自动奖励一点寿命值；活过一百年可以固定加寿元给别人；长生但只要被砍头还是会死）", "x-uiWidget": "textarea", "useForAI": true}, "第一次熬死仇人的顿悟": {"title": "放弃打脸的转变", "type": "string", "description": "主角本来想去装逼打脸，但后来因为怂躲回村里，五十年后出来发现当年的仇人已经老死了，从而悟出苟道的真谛。（如：我不需要天下无敌，我只要活得比你久，我就是赢家）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["极其低劣的悟性灵根", "无限属性面板加点", "第一次熬死仇人的顿悟"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.2 岁月更迭世界观 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_world_id, 
    '天骄陨落的动态历史长河法则', 
    '在这个世界里，什么盖世天才都会像流星一样陨灭，只有能活下去的草履虫能够见证大道的尽头。', 
    '{"type": "object", "title": "岁月天道法则", "properties": {"极高的天才死亡率": {"title": "天才必死定律", "type": "string", "description": "解释为什么出去争夺秘境的人大部分活不过一百岁。说明所谓的‘第一天骄’也是高危高压职业。", "x-uiWidget": "textarea", "useForAI": true}, "千年为尺度的地缘更迭": {"title": "环境变迁设定", "type": "string", "description": "这个世界的时间跨度必须被拉长。“沧海变桑田”，当年辉煌无极的顶级宗门在一千年后也变成了废墟，主角当年随便种下的一棵树现在变成了天下争抢的万年古神树。", "x-uiWidget": "textarea", "useForAI": true}, "红尘避世的凡人界": {"title": "主角定居法则", "type": "string", "description": "为什么主角要常年混迹在连一丝灵气都没有的凡人小镇？因为那里修真者看不上，连老怪打架都不会殃及那里的大白菜。", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["极高的天才死亡率", "千年为尺度的地缘更迭"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.3 文风设定 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_style_id, 
    '岁月轮转的孤独与荒诞文风', 
    '抛弃热血紧凑的剧情感，采用动辄跳跃百年的苍凉倒叙结合轻松种田文体的组合。', 
    '{"type": "object", "title": "文风设定", "properties": {"时光抽帧的电影感": {"title": "时间跳跃描写", "type": "string", "description": "写作要点：必须频繁使用‘春去秋来，三十载寒暑如白驹过隙’这类词汇。主角前一章还在看修仙大能决战苍穹，下一章直接拉了三百年虚线，当年决战的大能的坟头草都长成参天大树了。", "x-uiWidget": "textarea", "useForAI": true}, "旁观者的极致孤独": {"title": "情感基调描写", "type": "string", "description": "主角不是一个英雄，他是一个记录者。看着自己凡人的妻子老死、自己捡回来的小丫鬟修炼成大乘期老祖最终也坐化。要写出那种极其孤独、看似荒诞却又包含岁月厚重感的情绪。", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["时光抽帧的电影感", "旁观者的极致孤独"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.4 过客与送葬名单 (character) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_char_id, 
    '绝代天骄与送葬见证群像', 
    '配角再强、戏份再多，在这里最大的作用就是成为主角漫长人生中被送进棺材的匆匆过客。', 
    '{"type": "object", "title": "岁月过客档案", "x-titleField": "角色称谓/一世高人", "properties": {"角色称谓/一世高人": {"title": "角色姓名和他的极尽升华", "type": "string", "description": "在这个时代里最耀眼的名字。如：镇压一个时代的【无始大帝】、或者是主角在凡间收留的一个天赋异禀后来成为万剑之祖的【鼻涕童子】。", "useForAI": true}, "辉煌后的落幕方式": {"title": "必定陨落的宿命", "type": "string", "description": "长生流最惨的就是配角。他多么惊才绝艳，最终也逃不掉走火入魔、被人暗算或是寿元枯竭而坐化。他死的时候主角在干什么？主角是怎么给他烧纸扫墓的？", "x-uiWidget": "textarea", "useForAI": true}, "轮回转世的影响力": {"title": "主角留下的羁绊线索", "type": "string", "description": "这个人虽然死在了一万年前。可是主角在一万年后，却偶然在街上碰到了长得和他一模一样的转世之人，或者发现了刻有他名字的遗迹，引起主角无尽的唏嘘。", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["角色称谓/一世高人", "辉煌后的落幕方式"]}',
    @method_id, 'character', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.5 凡人凡城村落 (scene) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_scene_id, 
    '沧海桑田的永恒小镇(场景)', 
    '主角隐居的凡人城市街道，随着岁月变迁不断变换朝代但是主角一直稳坐钓鱼台。', 
    '{"type": "object", "title": "长生避世居所档案", "x-titleField": "凡人居所地名", "properties": {"凡人居所地名": {"title": "市井街道名", "type": "string", "description": "如：永远不受修仙界战火波及的大周皇城东大街平安药铺、青山镇卖猪肉的案板街、极北苦寒边境守了一千年的破道观", "useForAI": true}, "环境的反差平淡感": {"title": "平淡到极致的防空洞", "type": "string", "description": "这里的最高战斗力可能就是一个会劈砖的凡人武夫。哪怕天上掉下来一具元婴老怪的焦尸，主角也只会拿麻袋装起来偷偷埋进后院里当肥料。", "x-uiWidget": "textarea", "useForAI": true}, "跨越几个时代的景物变迁": {"title": "朝代替换的缩影", "type": "string", "description": "门前的那条河，一开始水清；八百年后干涸了成了马路；两千年后遇到灵气复苏，这马路又裂开成了峡谷。唯一不变的是主角的凉亭。", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["凡人居所地名", "跨越几个时代的景物变迁"]}',
    @method_id, 'scene', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.6 耐保存的古董与延寿草 (prop) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_prop_id, 
    '传家宝骨与岁月见证之物(道具)', 
    '最不值钱但是能熬一百万年的凡间破铜烂铁。', 
    '{"type": "object", "title": "岁月尘封信物档案", "x-titleField": "古董/老物件名", "properties": {"古董/老物件名": {"title": "防腐物件名", "type": "string", "description": "如：一壶用三万年的人参泡出来的劣质土烧酒、一把从大乘期老祖骨头里挖出来因为岁月太久长满铁锈的飞剑", "useForAI": true}, "时间附加的恐怖价值": {"title": "岁月增值大法", "type": "string", "description": "主角因为没有修为拿不到极品法器，所以他把一块凡铁丢进地火泉水里温养。过了一万年，他把这凡铁拿出来，一扔直接把半步仙人给砸死了。用时间累积属性。", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["古董/老物件名", "时间附加的恐怖价值"]}',
    @method_id, 'prop', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();

-- -------------------------
-- 3.7 被时代淘汰的古宗门 (organization) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_org_id, 
    '过眼云烟的霸主势力', 
    '没有永恒的帝国，但在长生者的眼里，这就像是换个壳子继续闹腾的草台班子。', 
    '{"type": "object", "title": "昔日霸主阵营档案", "x-titleField": "势力起落名", "properties": {"势力起落名": {"title": "宗门/皇朝名称", "type": "string", "description": "如：曾经不可一世后来断绝传承的太虚古龙一族、在三万年前就覆灭被史书遗忘的金辉神朝", "useForAI": true}, "眼看他起高楼的覆灭": {"title": "主角见证的起落", "type": "string", "description": "哪怕是一个统御九天十地的宗门，因为一场极端的正魔大战或者某次灵气枯竭，在千年中飞灰湮灭的过程。主角可能曾经在他们鼎盛时期当过扫地童子。", "x-uiWidget": "textarea", "useForAI": true}, "主角拿红利的捡漏操作": {"title": "末代拾荒者", "type": "string", "description": "他们打得尸山血海，主角等了三百年，等风头全都过去了。主角提着铲子去他们崩塌的祖坟里把祖师爷的至高修仙功法白嫖了回来。", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["势力起落名", "眼看他起高楼的覆灭"]}',
    @method_id, 'organization', 1, 0, 1, NOW(), NOW()
) ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), json_schema=VALUES(json_schema), updated_at=NOW();
