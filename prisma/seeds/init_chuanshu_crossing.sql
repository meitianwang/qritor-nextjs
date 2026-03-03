-- 穿书文小说创作方法初始化
-- 包含：创作方法 + 9 个模块类型
-- 执行方式 / Usage: mysql -u <user> -p <database> < init_chuanshu_crossing.sql

-- 1. 创建创作方法
INSERT INTO novel_creation_method (name_zh, name_en, description_zh, novel_type_zh, novel_type_en, language, visible_categories, created_at)
VALUES (
  '穿书文小说',
  'Transmigration Novel',
  '穿越进入小说世界的创作方法。主角穿越进入一本小说中，可以是经典名著、网络小说或虚构作品，利用对原著剧情的了解，以不同身份（主角、配角、炮灰、反派等）改变原有命运轨迹',
  '穿越',
  'Isekai / Time Travel',
  'zh',
  '["setting","character","organization","scene"]',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  novel_type_zh = VALUES(novel_type_zh),
  visible_categories = VALUES(visible_categories),
  updated_at = NOW();

-- 获取创作方法 ID
SET @method_id = (SELECT id FROM novel_creation_method WHERE name_zh = '穿书文小说' LIMIT 1);

-- 2. 创建模块类型

-- 2.1 穿书设定
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '穿书设定',
  'Transmigration Setup',
  '穿书文的核心模块，定义穿越到哪本书、穿成谁、知道多少剧情、核心目标',
  '{"type":"object","x-titleField":"原著名称","properties":{"原著名称":{"type":"string","title":"原著名称","description":"穿越进入的小说名称","useForAI":true},"原著类型":{"type":"string","title":"原著类型","enum":["经典名著","网络小说","杜撰作品"],"x-uiWidget":"radio","useForAI":true},"原著简介":{"type":"string","title":"原著简介","description":"原著的基本故事梗概","format":"textarea","useForAI":true},"穿越方式":{"type":"string","title":"穿越方式","enum":["意外身亡重生书中","睡梦中穿越","被神秘力量卷入","系统绑定穿书","阅读时意外穿入","其他"],"x-uiWidget":"select","useForAI":true},"穿越方式详情":{"type":"string","title":"穿越方式详情","description":"穿越方式为「其他」时，详细描述穿越经过","format":"textarea","useForAI":true},"穿越身份":{"type":"string","title":"穿越身份","description":"穿越后在书中扮演的角色类型","enum":["原著主角","重要配角","炮灰角色","反派","路人甲","原创角色（原著中不存在）","其他"],"x-uiWidget":"select","useForAI":true},"穿越身份详情":{"type":"string","title":"穿越身份详情","description":"具体穿成了谁，在原著中是什么样的人物","format":"textarea","useForAI":true},"剧情知悉度":{"type":"string","title":"剧情知悉度","description":"主角对原著剧情的了解程度","enum":["通读全书（了解所有剧情和结局）","读了大半（知道主线但不知结局）","只看了开头（只知道前期剧情）","只知道简介（仅了解大概设定）","听别人剧透过（零碎片段）"],"x-uiWidget":"select","useForAI":true},"穿越时间节点":{"type":"string","title":"穿越时间节点","description":"穿越到原著剧情的哪个阶段","enum":["故事开始前","故事开端","剧情发展期","高潮前夕","大结局前"],"x-uiWidget":"select","useForAI":true},"核心目标":{"type":"string","title":"核心目标","description":"穿书后的主要目标","enum":["改变自身悲惨命运","拯救心爱的角色","阻止原著悲剧结局","成为真正的主角","抱紧原著主角大腿","推翻原著反派","做咸鱼躺平度日","收集原著宝物/机缘","其他"],"x-uiWidget":"select","useForAI":true},"核心目标详情":{"type":"string","title":"核心目标详情","description":"对核心目标的详细描述","format":"textarea","useForAI":true},"故事基调":{"type":"string","title":"故事基调","enum":["轻松搞笑","热血逆袭","甜宠治愈","虐心催泪","权谋烧脑","悬疑惊悚"],"x-uiWidget":"select","useForAI":true},"感情线":{"type":"string","title":"感情线","enum":["无感情线","与原著主角","与原著配角","与原著反派","与原创角色","多条感情线"],"x-uiWidget":"select","useForAI":true}},"required":["原著名称","原著类型","穿越身份","剧情知悉度","核心目标"]}',
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

-- 2.2 原著世界
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '原著世界',
  'Original World',
  '描述原著小说的世界观、世界类型和核心规则',
  '{"type":"object","x-titleField":"世界类型","properties":{"世界类型":{"type":"string","title":"世界类型","description":"原著小说的世界类型","enum":["古代宫廷","古代江湖","仙侠修真","玄幻异世","现代都市","现代校园","末世废土","西方奇幻","科幻未来","历史架空","其他"],"x-uiWidget":"select","useForAI":true},"世界类型详情":{"type":"string","title":"世界类型详情","description":"世界类型为「其他」时填写，或补充说明世界的独特之处","format":"textarea","useForAI":true},"核心规则":{"type":"string","title":"核心规则","description":"这个世界运行的核心规则（如力量体系、社会阶层、魔法系统等）","format":"textarea","useForAI":true},"社会结构":{"type":"string","title":"社会结构","description":"世界的权力结构、阶层划分、主要势力格局","format":"textarea","useForAI":true},"时代背景":{"type":"string","title":"时代背景","description":"故事发生的时代背景和社会环境","format":"textarea","useForAI":true},"重要地标":{"type":"string","title":"重要地标","description":"原著中的重要场所和地标","format":"textarea","useForAI":true},"世界观补充":{"type":"string","title":"世界观补充","description":"其他需要补充的世界观设定","format":"textarea","useForAI":true}},"required":["世界类型"]}',
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

-- 2.3 原著剧情线
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '原著剧情线',
  'Original Plot',
  '梳理原著的关键剧情，为穿书者提供先知地图',
  '{"type":"object","x-titleField":"主线剧情","properties":{"主线剧情":{"type":"string","title":"主线剧情","description":"原著的主线故事概述","format":"textarea","useForAI":true},"关键转折点":{"type":"string","title":"关键转折点","description":"原著中的重大转折事件（按时间顺序列出）","format":"textarea","x-rows":6,"useForAI":true},"危险事件":{"type":"string","title":"危险事件","description":"原著中对穿书者构成威胁的危险事件","format":"textarea","x-rows":6,"useForAI":true},"重要机缘":{"type":"string","title":"重要机缘","description":"原著中可以利用的宝物、机缘、关键情报","format":"textarea","x-rows":6,"useForAI":true},"已知伏笔":{"type":"string","title":"已知伏笔","description":"原著中埋下的伏笔和隐藏线索","format":"textarea","useForAI":true},"原著结局":{"type":"string","title":"原著结局","description":"原著的最终结局（穿书者是否知道取决于剧情知悉度）","format":"textarea","useForAI":true},"蝴蝶效应风险":{"type":"string","title":"蝴蝶效应风险","description":"穿书者的行为可能导致哪些剧情偏离，先知优势可能如何失效","format":"textarea","useForAI":true}},"required":["主线剧情","关键转折点"]}',
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

-- 2.4 金手指
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '金手指',
  'Cheat Power',
  '定义穿书者除剧情先知外的额外能力或系统',
  '{"type":"object","x-titleField":"金手指类型","properties":{"金手指类型":{"type":"string","title":"金手指类型","enum":["剧情先知（记忆原著内容）","系统面板（任务/升级系统）","特殊技能（原著角色不具备的能力）","物品道具（来自现实世界的物品）","人脉关系（提前知道谁是贵人）","无金手指（纯靠智慧和原著知识）","其他"],"x-uiWidget":"select","useForAI":true},"金手指详情":{"type":"string","title":"金手指详情","description":"金手指的具体能力描述","format":"textarea","useForAI":true},"使用限制":{"type":"string","title":"使用限制","description":"金手指的限制条件（如剧情偏离后先知失效、系统有冷却时间等）","format":"textarea","useForAI":true},"成长空间":{"type":"string","title":"成长空间","description":"金手指是否会随剧情发展升级或弱化","format":"textarea","useForAI":true},"获得方式":{"type":"string","title":"获得方式","description":"穿书者如何获得金手指（穿越自带/触发条件获得/逐步觉醒等）","useForAI":true}},"required":["金手指类型"]}',
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

-- 2.5 故事钩子
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '故事钩子',
  'Story Hook',
  '定义故事的核心冲突和吸引力',
  '{"type":"object","x-titleField":"核心冲突","properties":{"核心冲突":{"type":"string","title":"核心冲突","description":"故事的核心矛盾（如穿书者想改命 vs 原著世界的自我修正力量）","format":"textarea","useForAI":true},"开篇悬念":{"type":"string","title":"开篇悬念","description":"吸引读者的第一个钩子，让读者产生「接下来会怎样」的好奇","format":"textarea","useForAI":true},"身份危机":{"type":"string","title":"身份危机","description":"穿书者在书中的身份带来的核心危机（如炮灰三天后就要领便当）","format":"textarea","useForAI":true},"剧情与现实的张力":{"type":"string","title":"剧情与现实的张力","description":"已知剧情走向与穿书者想要改变之间的矛盾","format":"textarea","useForAI":true},"情感钩子":{"type":"string","title":"情感钩子","description":"触动读者情感的元素（如拯救原著中悲惨角色、与注定敌对的人产生感情等）","format":"textarea","useForAI":true}},"required":["核心冲突"]}',
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

-- 2.6 文风设定
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '文风设定',
  'Writing Style',
  '定义穿书文的写作风格、叙事视角和内心独白风格',
  '{"type":"object","x-titleField":"叙事视角","properties":{"叙事视角":{"type":"string","title":"叙事视角","enum":["第一人称","第三人称限知","第三人称全知","多视角切换"],"x-uiWidget":"radio","useForAI":true},"文风基调":{"type":"string","title":"文风基调","enum":["幽默吐槽风","细腻文艺风","爽文节奏风","古典雅致风","悬疑紧张风","温馨治愈风"],"x-uiWidget":"select","useForAI":true},"内心独白风格":{"type":"string","title":"内心独白风格","description":"穿书者内心吐槽和独白的风格（穿书文的一大特色）","enum":["疯狂吐槽型（弹幕风格）","冷静分析型（理性推演）","焦虑紧张型（求生欲满满）","佛系躺平型（随遇而安）"],"x-uiWidget":"select","useForAI":true},"语言风格":{"type":"string","title":"语言风格","description":"是否匹配原著世界的语言风格（如古代背景用半文言、现代背景用网络用语等）","format":"textarea","useForAI":true},"参考作品":{"type":"string","title":"参考作品","description":"文风参考的已有作品（可选）","useForAI":true}},"required":["叙事视角","文风基调"]}',
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

-- 2.7 角色
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '角色',
  'Character',
  '穿书文角色创建，区分原著角色、穿书者和原创角色',
  '{"type":"object","x-titleField":"姓名","properties":{"姓名":{"type":"string","title":"姓名","useForAI":true},"角色来源":{"type":"string","title":"角色来源","enum":["原著角色","穿书者（主角）","原创角色"],"x-uiWidget":"radio","useForAI":true},"角色定位":{"type":"string","title":"角色定位","enum":["主角","男/女主","重要配角","反派","导师","盟友","对手","路人"],"x-uiWidget":"select","useForAI":true},"原著中的命运":{"type":"string","title":"原著中的命运","description":"该角色在原著中的结局和命运走向（原著角色填写）","format":"textarea","useForAI":true},"性别":{"type":"string","title":"性别","enum":["男","女","其他"],"x-uiWidget":"radio","useForAI":true},"年龄":{"type":"string","title":"年龄","useForAI":true},"外貌特征":{"type":"string","title":"外貌特征","format":"textarea","useForAI":true},"性格特点":{"type":"string","title":"性格特点","format":"textarea","useForAI":true},"身份地位":{"type":"string","title":"身份地位","description":"在书中世界的社会地位和身份","useForAI":true},"与主角关系":{"type":"string","title":"与主角关系","description":"与穿书主角的关系","format":"textarea","useForAI":true},"背景故事":{"type":"string","title":"背景故事","format":"textarea","useForAI":true},"对主角的态度":{"type":"string","title":"对主角的态度","description":"该角色对穿书者的态度（是否察觉异常）","enum":["友好信任","中立观望","敌对排斥","暗中怀疑","已发现穿书秘密"],"x-uiWidget":"select","useForAI":true}},"required":["姓名","角色来源","角色定位"]}',
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

-- 2.8 场景
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '场景',
  'Scene',
  '穿书文场景创建，区分原著场景和原创场景',
  '{"type":"object","x-titleField":"场景名称","properties":{"场景名称":{"type":"string","title":"场景名称","useForAI":true},"场景来源":{"type":"string","title":"场景来源","enum":["原著场景","原创场景"],"x-uiWidget":"radio","useForAI":true},"场景类型":{"type":"string","title":"场景类型","enum":["居所","公共场所","秘境/禁地","战斗场地","社交场合","自然环境","其他"],"x-uiWidget":"select","useForAI":true},"环境描述":{"type":"string","title":"环境描述","format":"textarea","useForAI":true},"在原著中的重要性":{"type":"string","title":"在原著中的重要性","description":"该场景在原著剧情中扮演的角色","format":"textarea","useForAI":true},"关联事件":{"type":"string","title":"关联事件","description":"在此场景发生或将要发生的关键事件","format":"textarea","useForAI":true},"隐藏信息":{"type":"string","title":"隐藏信息","description":"穿书者凭原著知识知道的、此场景的隐藏秘密","format":"textarea","useForAI":true}},"required":["场景名称","场景来源"]}',
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

-- 2.9 势力/组织
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '势力/组织',
  'Faction / Organization',
  '穿书文势力和组织创建，区分原著势力和原创势力',
  '{"type":"object","x-titleField":"名称","properties":{"名称":{"type":"string","title":"名称","useForAI":true},"组织来源":{"type":"string","title":"组织来源","enum":["原著势力","原创势力"],"x-uiWidget":"radio","useForAI":true},"类型":{"type":"string","title":"类型","enum":["家族","门派/帮派","朝廷/政府","商业势力","秘密组织","其他"],"x-uiWidget":"select","useForAI":true},"规模":{"type":"string","title":"规模","enum":["小型（数十人）","中型（数百人）","大型（数千人）","巨型（万人以上）"],"x-uiWidget":"select","useForAI":true},"势力范围":{"type":"string","title":"势力范围","description":"控制的地盘和影响力范围","format":"textarea","useForAI":true},"核心成员":{"type":"string","title":"核心成员","description":"组织的领导层和关键人物","format":"textarea","useForAI":true},"在原著中的命运":{"type":"string","title":"在原著中的命运","description":"该势力在原著中的结局走向（原著势力填写）","format":"textarea","useForAI":true},"与主角关系":{"type":"string","title":"与主角关系","description":"该势力与穿书者的关系","enum":["所属势力","盟友","中立","敌对","暗中利用"],"x-uiWidget":"select","useForAI":true}},"required":["名称","组织来源","类型"]}',
  @method_id,
  1,
  0,
  'organization',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  updated_at = NOW();
