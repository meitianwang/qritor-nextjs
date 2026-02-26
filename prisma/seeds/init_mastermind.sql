-- 幕后黑手流 / 编剧流 (The Behind-the-Scenes Mastermind) 创作方法
-- Language: zh
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/init_mastermind.sql

INSERT INTO novel_creation_method (name, description, novel_type, language, visible_categories, is_preset, user_id, status, created_at)
VALUES (
  '幕后黑手流 / 编剧流',
  '主角作为隐藏在世界暗处的导演，通过编造神话、释放虚假遗迹、建立马甲组织，把全世界的原住民（包括顶级强者）当成剧本里的演员。核心爽点：信息差碾压、迪化脑补、马甲掉落的期待感。',
  '幕后黑手/迪化流',
  'zh',
  '["setting","character","organization","scene","prop"]',
  1,
  NULL,
  'published',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  novel_type = VALUES(novel_type),
  visible_categories = VALUES(visible_categories),
  updated_at = NOW();

SET @method_id = (SELECT id FROM novel_creation_method WHERE name = '幕后黑手流 / 编剧流' LIMIT 1);

-- ============================================================
-- 2. 创建模块类型 (8 total)
-- ============================================================

-- 2.1 剧情钩子 (Story Hook)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  '核心骗局 (Story Hook)',
  '主角编造的第一个弥天大谎，用来拉开欺骗全世界的序幕。',
  '{"type":"object","required":["初始危机"],"properties":{"初始危机":{"type":"string","title":"迫使主角行骗的危机","description":"主角为什么要装神弄鬼？（比如：寿命只剩三天，必须收集全人类的震惊值；或者世界即将毁灭，只有让大家相信超凡存在才能激活灵气复苏）。","x-uiWidget":"textarea","useForAI":true},"第一个剧本":{"type":"string","title":"开局抛出的谎言/神话","description":"主角自导自演的第一个超能力事件（如：在直播中展现剑仙斩龙，或是让一个古兵马俑复活）。","x-uiWidget":"textarea","useForAI":true},"核心爽点期待":{"type":"string","title":"期待感设计","description":"读者期待看到什么？（比如：官方智囊团对着一张主角随手画的废纸进行疯狂脑补和过度解读）。","x-uiWidget":"textarea","useForAI":true}}}',
  1.1, @method_id, 1, 1, 0, 'setting', NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), json_schema = VALUES(json_schema), updated_at = NOW();

-- 2.2 核心外挂与身份设定 (Core Premise)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  '幕后掌控者 (Core Premise)',
  '主角的真正身份、系统外挂以及他建立的虚构组织的架构。',
  '{"type":"object","required":["金手指机制"],"properties":{"本体状态":{"type":"string","title":"主角真实状态","enum":["毫无战斗力的普通宅男","被困在封印物里的残魂","掌握着高维编辑器的神明","只能通过系统操纵傀儡的残疾人"],"x-uiWidget":"select","useForAI":true},"金手指机制":{"type":"string","title":"系统/外挂机制","description":"如何弄假成真？（如：收集相信度/震惊值就能将虚假物品具现化，或者可以自由捏造分身马甲）。","x-uiWidget":"textarea","useForAI":true},"虚构的究极组织":{"type":"string","title":"主角编造的至高势力","description":"主角为了装逼而扯出来的大旗（如：自古长存的‘SCP基金会’、隐藏在历史阴影中的‘塔罗会’）。","x-uiWidget":"textarea","useForAI":true},"行事准则":{"type":"string","title":"幕后黑手的行事准则","enum":["绝对神秘，绝不亲自下场","亦正亦邪，为了收割情绪值不择手段","默默守护世界的救世主，但背负千古骂名","疯狂的剧本打磨者，只求最精彩的戏剧"],"x-uiWidget":"select","useForAI":true}}}',
  1.0, @method_id, 1, 1, 0, 'setting', NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), json_schema = VALUES(json_schema), updated_at = NOW();

-- 2.3 舞台与世界观 (Worldbuilding)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  '剧本舞台 (Worldbuilding)',
  '这个被主角玩弄于股掌之间的世界背景。无灵世界是最好的骗局画卷。',
  '{"type":"object","required":["初始世界状态"],"properties":{"初始世界状态":{"type":"string","title":"世界背景原貌","enum":["平平无奇的现代唯物社会","科技高度发达的星际文明","刚刚经历灾变的废土文明","充满超棒英雄的繁华都市"],"x-uiWidget":"select","useForAI":true},"官方机构/掌权者":{"type":"string","title":"原世界的最高武力/情报机构","description":"负责在主角的剧本中充当‘震惊担当’和帮忙脑补补全逻辑的官方组织。","x-uiWidget":"textarea","useForAI":true},"真正的威胁":{"type":"string","title":"深层威胁 (可选)","description":"除了主角的骗局，是否有正在逼近的真实危机？（借此突显主角不仅在骗人，也在救人）。","x-uiWidget":"textarea","useForAI":true}}}',
  0.9, @method_id, 1, 1, 0, 'setting', NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), json_schema = VALUES(json_schema), updated_at = NOW();

-- 2.4 迪化文风与视角 (Writing Style)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  '迪化文风 (Writing Style)',
  '掌握主角视角与配角视角的切换，制造巨大的信息差喜剧效果。',
  '{"type":"object","required":["叙事重点"],"properties":{"核心叙事技巧":{"type":"string","title":"叙事切换手法","enum":["配角疯狂脑补神化 vs 主角暗自流汗庆幸","主角冷酷布局 vs 世界陷入未知的恐慌","群像剧：从不同大人物的视角拼凑出主角的恐怖形象"],"x-uiWidget":"radio","useForAI":true},"叙事重点":{"type":"string","title":"配角反应描写","description":"必须极致刻画配角在看到主角随手捏造的遗迹时那种颤栗、崇拜或三观崩塌的过程。","x-uiWidget":"textarea","useForAI":true},"主角逼格控制":{"type":"string","title":"主角的逼格表现","description":"主角绝不轻易解释，说话只说一半，用‘谜语人’的方式保持神秘感。","x-uiWidget":"textarea","useForAI":true}}}',
  0.8, @method_id, 1, 1, 0, 'setting', NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), json_schema = VALUES(json_schema), updated_at = NOW();

-- 2.5 马甲与被骗者 (Character)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  '马甲与提线木偶 (Character)',
  '主角自己捏造的分身（马甲），以及深受其害（或以为得到救赎）的原住民。',
  '{"type":"object","x-titleField":"角色名称","required":["角色名称","角色类型"],"properties":{"角色名称":{"type":"string","title":"姓名或代号","useForAI":true},"角色类型":{"type":"string","title":"角色类型","enum":["主角的小号/马甲分身","官方调查局探员(脑补主力)","被主角选中的天命之子(工具人)","误以为自己是主角宿敌的反派","主角捏造的古代复苏亡灵"],"x-uiWidget":"select","useForAI":true},"虚假设定/真实面板":{"type":"string","title":"表本设定反差 (如果是马甲)","description":"表面上是活了万年的仙尊，其实是个用完即弃的一次性硅胶人偶。或者普通人眼中的设定。","x-uiWidget":"textarea","useForAI":true},"脑补程度":{"type":"string","title":"自我洗脑程度 (如果是配角)","description":"他对主角的敬畏有多深？（如：奉若神明、认为主角的手下一个喷嚏就能毁灭国家）。","x-uiWidget":"textarea","useForAI":true},"当前剧本进度":{"type":"string","title":"对于主角计划的认知度","isDynamic":true},"当前忠诚/敌意":{"type":"string","title":"被骗的深浅","isDynamic":true}}}',
  1.0, @method_id, 1, 0, 0, 'character', NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), json_schema = VALUES(json_schema), updated_at = NOW();

-- 2.6 超凡组织与世俗权力 (Organization)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  '虚假势力与调查局 (Organization)',
  '只有主角一个人的庞大星际帝国，或者拼命试图解读主角信号的国家机器。',
  '{"type":"object","x-titleField":"组织名称","required":["组织名称","虚实状态"],"properties":{"组织名称":{"type":"string","title":"组织/势力名称","useForAI":true},"组织类型":{"type":"string","title":"组织性质","enum":["国安调查特勤组","主角自创的古老救世结社","跨国权贵俱乐部","妄图召唤邪神的地下邪教"],"x-uiWidget":"select","useForAI":true},"虚实状态":{"type":"string","title":"真实的人数与底蕴","description":"如果是主角捏造的，说明里面除了主角还有几个活人（通常是0）。如果是官方，说明其庞大的国家资源。","x-uiWidget":"textarea","useForAI":true},"公开形象与恐吓力":{"type":"string","title":"外界眼中的形象","description":"外界看来，这个组织在暗中操纵了人类两千年历史。","x-uiWidget":"textarea","useForAI":true},"对主角的态度":{"type":"string","title":"与幕后黑手的关系","description":"视其为必须拉拢的神明，还是必须要消灭的头号隐患？","x-uiWidget":"textarea","useForAI":true},"当前掌握的情报层级":{"type":"string","title":"当前脑补进度","isDynamic":true}}}',
  1.0, @method_id, 1, 0, 0, 'organization', NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), json_schema = VALUES(json_schema), updated_at = NOW();

-- 2.7 虚假遗迹与幻境 (Scene)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  '造假遗迹 (Scene)',
  '主角花费积分或者精力捏造出来的超凡古迹，用来让原住民发掘并陷入自我欺骗。',
  '{"type":"object","x-titleField":"遗址名称","required":["遗址名称"],"properties":{"遗址名称":{"type":"string","title":"遗迹/场景名称","description":"如：昆仑坠落的仙宫一角、藏在深海的光明会最初基地","useForAI":true},"设计蓝图":{"type":"string","title":"虚构的年代与逼格","description":"这个遗迹被捏造出来的年代和背景故事是什么？（例如：记录了白垩纪修真文明的石碑）。","x-uiWidget":"textarea","useForAI":true},"机关与误导点":{"type":"string","title":"用来误导官方的机关","description":"主角故意留下的壁画或陷阱，用来引导挖掘者产生错误的、极致夸张的脑补。","x-uiWidget":"textarea","useForAI":true},"原住民的反应":{"type":"string","title":"发掘后的震撼效果","description":"世界联军在遗迹前跪拜，或者专家因为看不懂而将其列为SSS级绝密档案。","x-uiWidget":"textarea","useForAI":true},"当前探索进度":{"type":"string","title":"原住民的探索度","isDynamic":true}}}',
  1.1, @method_id, 1, 0, 0, 'scene', NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), json_schema = VALUES(json_schema), updated_at = NOW();

-- 2.8 编造的超凡神物 (Prop)
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  '脑补神器 (Prop)',
  '主角从系统兑换出来的，或者是随手用报纸捏但被系统附上特效的神秘道具。',
  '{"type":"object","x-titleField":"道具名称","required":["道具名称"],"properties":{"道具名称":{"type":"string","title":"道具名称","description":"如：记录着神明尊名的羊皮卷、被封印的斩星剑剑格、或者是主角没扔掉的玻璃珠。","useForAI":true},"真实效果":{"type":"string","title":"道具的真实效用","description":"可能只是一次性的投影功能，或者只是个普通的工艺品，顶多能发个光。","x-uiWidget":"textarea","useForAI":true},"原住民脑补面貌":{"type":"string","title":"被赋予的传说属性","description":"官方认为这是能摧毁地球的质量武器，或者藏着能够让人成仙的核心功法，将其放在钛合金保险柜里。","x-uiWidget":"textarea","useForAI":true},"当前下落":{"type":"string","title":"目前落入谁手","isDynamic":true}}}',
  0.9, @method_id, 1, 0, 0, 'prop', NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), json_schema = VALUES(json_schema), updated_at = NOW();
