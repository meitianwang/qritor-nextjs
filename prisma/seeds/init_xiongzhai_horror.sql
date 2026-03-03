-- 凶宅灵异租房流小说创作方法
-- Language: Chinese (zh)
-- Includes: creation method + 6 module types
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/init_xiongzhai_horror.sql

-- ============================================================
-- 1. 创建创作方法
-- ============================================================

INSERT INTO novel_creation_method (name_zh, name_en, description_zh, novel_type_zh, novel_type_en, language, visible_categories, created_at)
VALUES (
  '凶宅灵异租房',
  'Haunted House Novel',
  '专为凶宅租房流灵异小说设计。主角贪图便宜租下高档小区里一间价格异常低廉的房子，随后陷入挥之不去的诡异事件：半夜自动开启的电视、浴室镜子上的手印、床底下传来的呼吸声。恐惧高度压缩在这方寸之地，主角在与厉鬼周旋的同时，逐渐挖掘出这间房历任租客失踪或死亡的真相。典型标签：凶宅、灵异租房、空间恐怖、都市灵异。',
  '悬疑灵异',
  'Supernatural Mystery',
  'zh',
  '["setting","character","scene"]',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  novel_type_zh = VALUES(novel_type_zh),
  visible_categories = VALUES(visible_categories),
  updated_at = NOW();

SET @method_id = (SELECT id FROM novel_creation_method WHERE name_zh = '凶宅灵异租房' LIMIT 1);

-- ============================================================
-- 2. 创建模块类型（共 6 个）
-- ============================================================

-- 2.1 故事钩子（setting, singleton）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '灵异钩子',
  'Story Hook',
  '吸引读者进入这间凶宅的核心悬念与卖点',
  '{"type":"object","required":["故事钩子"],"properties":{"故事钩子":{"type":"string","title":"故事钩子","description":"一句话概括最令人脊背发凉的设定——为什么偏偏是这间房，为什么偏偏是这个人","x-uiWidget":"textarea","useForAI":true},"核心卖点":{"type":"string","title":"核心卖点","description":"这个凶宅故事区别于其他灵异小说的独特之处——是空间创意、是厉鬼设定、还是真相反转","x-uiWidget":"textarea","useForAI":true},"开篇悬念":{"type":"string","title":"开篇悬念","description":"前三章必须呈现的悬念——那个让读者放不下手机的异常细节","x-uiWidget":"textarea","useForAI":true},"读者期待":{"type":"string","title":"读者期待","description":"读者从这个故事期待得到的核心体验——是细思极恐、是真相揭露、还是主角与厉鬼的智斗","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id,
  1,
  1,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  updated_at = NOW();

-- 2.2 凶宅档案（setting, singleton）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '凶宅设定',
  'Haunted House Setup',
  '这间房的基本信息、价格反差、死亡历史与核心秘密',
  '{"type":"object","required":["房屋类型","租金反差"],"properties":{"房屋类型":{"type":"string","title":"房屋类型","enum":["高档住宅小区普通户型","市中心老公寓","别墅或独栋","城中村改建公寓","学区房","商住两用","其他"],"x-uiWidget":"select","useForAI":true},"租金反差":{"type":"string","title":"租金反差","enum":["同地段价格的一半以下","几乎白给（象征性收费）","免费住但有奇怪条件","价格正常但装修异常豪华","中介反复压价主动推荐"],"x-uiWidget":"select","useForAI":true},"外部印象":{"type":"string","title":"外部印象","description":"这间房给人的第一印象——高档环境与异常低价之间的反差感，以及初入时的细节","x-uiWidget":"textarea","useForAI":true},"已知死亡历史":{"type":"string","title":"已知死亡历史","description":"主角入住前能查到或被告知的历任租客遭遇——死亡、失踪、精神崩溃等","x-uiWidget":"textarea","useForAI":true},"隐藏的核心秘密":{"type":"string","title":"隐藏的核心秘密","description":"这间房真正的秘密——整个故事最终指向的那个不为人知的事实","x-uiWidget":"textarea","useForAI":true},"房东特征":{"type":"string","title":"房东特征","description":"房东的行为特征——过于热情、回避追问、神出鬼没，或根本联系不上","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id,
  1,
  1,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  updated_at = NOW();

-- 2.3 厉鬼规则（setting, singleton）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '灵异规则',
  'Supernatural Rules',
  '这间房厉鬼的来源、能力与规则——规则明确是恐怖推理的基础',
  '{"type":"object","required":["厉鬼类型","死亡方式"],"properties":{"厉鬼类型":{"type":"string","title":"厉鬼类型","enum":["冤死怨灵（有明确冤情）","执念困守（死于执念未解）","恶意厉鬼（无冤情，纯粹为害）","多重残留（多个死亡留下的痕迹叠加）","非人存在（非正常死亡所产生）"],"x-uiWidget":"select","useForAI":true},"死亡方式":{"type":"string","title":"死亡方式","description":"厉鬼的死亡经过——是谋杀、自杀、意外，还是被封存的更黑暗的真相","x-uiWidget":"textarea","useForAI":true},"活动规律":{"type":"string","title":"活动规律","description":"厉鬼在什么时间、什么触发条件下显现或活动——子时固定出现、被特定行为激怒、随入住天数逐渐升级","x-uiWidget":"textarea","useForAI":true},"能力清单":{"type":"string","title":"能力清单","description":"厉鬼能做什么——操控电器、在镜中显形、在床底活动、在梦中接触、物理影响","x-uiWidget":"textarea","useForAI":true},"限制与弱点":{"type":"string","title":"限制与弱点","description":"厉鬼不能做什么——是否有不能进入的房间、不能越过的边界、不能在白天活动、害怕特定物品","x-uiWidget":"textarea","useForAI":true},"执念核心":{"type":"string","title":"执念核心","description":"厉鬼为什么还在这间房——它需要什么才能离开、它一直在寻找什么、它想让入住者知道什么","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id,
  1,
  1,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  updated_at = NOW();

-- 2.4 文风设定（setting, singleton）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '恐怖文风',
  'Writing Style',
  '叙事视角、恐怖风格与节奏设计',
  '{"type":"object","required":["叙事视角","恐怖风格"],"properties":{"叙事视角":{"type":"string","title":"叙事视角","enum":["第一人称（主角实时叙述）","第一人称+日记/聊天记录插叙","第三人称限制视角（紧跟主角）","双线叙事（现在的主角 + 过去的前租客）"],"x-uiWidget":"radio","useForAI":true},"恐怖风格":{"type":"string","title":"恐怖风格","enum":["氛围压迫型（空间感与细节积累）","细节恐怖型（精准的恐怖描写）","心理暗示型（读者脑补大于明示）","推理悬疑型（厉鬼出没有规律可循）"],"x-uiWidget":"radio","useForAI":true},"节奏设计":{"type":"string","title":"节奏设计","enum":["慢热升温（前期日常感强，恐怖逐渐侵入）","紧凑直给（第一章就上强度）","波浪型（日常→恐怖→喘息→更深的恐怖）"],"x-uiWidget":"radio","useForAI":true},"恐怖浓度":{"type":"string","title":"恐怖浓度","enum":["轻灵异（适合灵异爱好者入门）","中等恐怖（标准都市灵异浓度）","高浓度恐怖（不建议独处夜读）"],"x-uiWidget":"radio","useForAI":true},"禁止词汇":{"type":"string","title":"禁止词汇","description":"写作中需要避免的词汇或套路——过于日式的表达、明显的网络爽文词汇等","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id,
  1,
  1,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  updated_at = NOW();

-- 2.5 角色（character, non-singleton）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '角色',
  'Character',
  '凶宅中的生者与死者——主角、邻居、房东、前任租客',
  '{"type":"object","x-titleField":"姓名","required":["姓名","角色定位"],"properties":{"姓名":{"type":"string","title":"姓名","description":"角色姓名，不带任何括注","useForAI":true},"角色定位":{"type":"string","title":"角色定位","enum":["主角（当前租客）","邻居（知情者/同情者/威胁）","房东（信息掌控者）","前任租客（已死亡或失踪）","主角的现实联系人（朋友/家人）","神秘调查者（记者/道士/警察）"],"x-uiWidget":"radio","useForAI":true},"性别":{"type":"string","title":"性别","enum":["男","女","未设定"],"x-uiWidget":"radio","useForAI":true},"年龄":{"type":"string","title":"年龄","description":"角色的年龄或年龄段","useForAI":true},"租房动机":{"type":"string","title":"租房动机","description":"主角为什么要租这间房——省钱、工作近、没选择、还是有其他原因","x-uiWidget":"textarea","useForAI":true},"与凶宅的关联":{"type":"string","title":"与凶宅的关联","description":"这个角色与这间房的关系——是知情者、受害者、施害者，还是意外卷入","x-uiWidget":"textarea","useForAI":true},"性格特征":{"type":"string","title":"性格特征","description":"影响其在恐怖处境中反应的性格特点——理性还是感性、胆大还是胆小、孤僻还是社交型","x-uiWidget":"textarea","useForAI":true},"当前状态":{"type":"string","title":"当前状态","description":"角色目前在故事中的处境","isDynamic":true},"心理变化轨迹":{"type":"string","title":"心理变化轨迹","description":"在这间房中经历恐怖事件后的心理演变","isDynamic":true}}}',
  @method_id,
  1,
  0,
  'character',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  updated_at = NOW();

-- 2.6 空间（scene, non-singleton）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '灵异场所',
  'Haunted Location',
  '凶宅内各个恐怖空间——客厅、卧室、卫生间、床底，每个空间都有专属的恐惧',
  '{"type":"object","x-titleField":"空间名称","required":["空间名称","空间类型"],"properties":{"空间名称":{"type":"string","title":"空间名称","useForAI":true},"空间类型":{"type":"string","title":"空间类型","enum":["客厅","主卧","次卧","卫生间/浴室","厨房","储藏室/杂物间","阳台","过道/走廊","床底","衣柜内部","窗户/窗台","门（正门/房间门）"],"x-uiWidget":"select","useForAI":true},"恐怖现象":{"type":"string","title":"恐怖现象","description":"这个空间专属的恐怖事件——电视自动开启、镜中人影、床底呼吸声、水龙头自动流血水","x-uiWidget":"textarea","useForAI":true},"空间细节":{"type":"string","title":"空间细节","description":"这个空间的物理特征——光线、气味、声音、温度的异常，以及那些看了又觉得不对劲的细节","x-uiWidget":"textarea","useForAI":true},"危险等级":{"type":"string","title":"危险等级","enum":["低（不适感，但无实质威胁）","中（曾有灵异现象，需要警惕）","高（厉鬼的主要活动区域）","极高（进入即有生命危险）"],"x-uiWidget":"radio","useForAI":true},"隐藏线索":{"type":"string","title":"隐藏线索","description":"这个空间藏着的关于凶宅秘密的线索——墙后的字迹、地板下的遗物、或那些只有仔细看才会发现的异常","x-uiWidget":"textarea","useForAI":true},"当前状态":{"type":"string","title":"当前状态","description":"这个空间目前的状况——完好、被破坏、上了锁、主角不敢进入","isDynamic":true}}}',
  @method_id,
  1,
  0,
  'scene',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  updated_at = NOW();
