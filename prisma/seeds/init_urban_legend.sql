-- 都市传说怪谈复苏流小说 - 创作方法初始化
-- language: zh
-- 包含：创作方法 + 7 个模块类型（5 setting + 1 character + 1 scene）
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/init_urban_legend.sql

-- ============================================================
-- 1. 创建创作方法
-- ============================================================

INSERT INTO novel_creation_method (name, description, novel_type, language, visible_categories, is_preset, user_id, status, created_at)
VALUES (
  '都市传说怪谈复苏流小说',
  '将现代都市环境（地铁、电梯、外卖、手机App）与恐怖怪谈结合。核心逻辑：原本平静的现代社会，某些「禁忌」或「规则」突然生效，普通人必须在日常生活的缝隙中寻找生路。极具代入感——读者每天经过的楼道、使用的手机都可能是恐怖的源头。',
  '悬疑灵异',
  'zh',
  '["setting","character","scene"]',
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

SET @method_id = (SELECT id FROM novel_creation_method WHERE name = '都市传说怪谈复苏流小说' LIMIT 1);

-- ============================================================
-- 2. 创建模块类型（7 个）
-- ============================================================

-- 2.1 故事钩子（setting, singleton, temp=1.2）
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  '故事钩子',
  '一句话抓住读者的恐怖核心，让人在现实与恐惧之间摇摆',
  '{"type":"object","title":"故事钩子","required":["故事钩子"],"properties":{"故事钩子":{"type":"string","title":"故事钩子","description":"一句话概括故事最令人不安的核心——读者看完后会忍不住继续读","x-uiWidget":"textarea","useForAI":true},"恐怖核心":{"type":"string","title":"恐怖核心","description":"这个故事的恐惧根源——是未知、失控、被侵入，还是真相比怪物更可怕","x-uiWidget":"textarea","useForAI":true},"代入钩子":{"type":"string","title":"代入钩子","description":"让普通读者感到「这可能发生在我身上」的元素——日常场景或行为","x-uiWidget":"textarea","useForAI":true},"读者期待":{"type":"string","title":"读者期待","description":"读者期望从这个故事中获得什么体验","x-uiWidget":"textarea","useForAI":true}}}',
  1.2,
  @method_id,
  1,
  1,
  0,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  json_schema = VALUES(json_schema),
  temperature = VALUES(temperature),
  updated_at = NOW();

-- 2.2 怪谈起源（setting, singleton, temp=1.0）
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  '怪谈起源',
  '这次怪谈/禁忌复苏的根源——是什么在过去沉睡，又为何在现在觉醒',
  '{"type":"object","title":"怪谈起源","required":["怪谈类型","复苏原因"],"properties":{"怪谈类型":{"type":"string","title":"怪谈类型","enum":["网络诅咒/转发类","地点封印破除","古老禁忌复苏","人造实验失控","集体无意识具现","其他"],"x-uiWidget":"select","useForAI":true},"复苏原因":{"type":"string","title":"复苏原因","description":"这次怪谈/禁忌为什么在现在复苏？触发事件是什么","x-uiWidget":"textarea","useForAI":true},"传播媒介":{"type":"string","title":"传播媒介","description":"怪谈通过什么传播——口耳相传、网络帖子、App推送、实物接触","x-uiWidget":"textarea","useForAI":true},"影响范围":{"type":"string","title":"影响范围","enum":["个人诅咒","局部区域（楼/街道）","全城","全国/全球"],"x-uiWidget":"radio","useForAI":true},"开始时间":{"type":"string","title":"开始时间","description":"故事开始时怪谈已复苏多久，社会处于什么反应阶段","x-uiWidget":"textarea","useForAI":true}}}',
  1.0,
  @method_id,
  1,
  1,
  0,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  json_schema = VALUES(json_schema),
  temperature = VALUES(temperature),
  updated_at = NOW();

-- 2.3 禁忌规则（setting, singleton, temp=0.9）
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  '禁忌规则',
  '这个怪谈的核心规则体系——触发什么、违反会怎样、如何存活',
  '{"type":"object","title":"禁忌规则","required":["核心规则"],"properties":{"核心规则":{"type":"string","title":"核心规则","description":"用简洁的语言描述最核心的「不能做什么」或「必须做什么」——越具体越有力量","x-uiWidget":"textarea","useForAI":true},"触发条件":{"type":"string","title":"触发条件","description":"什么行为/状态/时间会触发规则（如「凌晨3点独自乘电梯」「接到无声电话后」）","x-uiWidget":"textarea","useForAI":true},"违规后果":{"type":"string","title":"违规后果","description":"违反规则会发生什么——即时反应和延迟后果，分层描述","x-uiWidget":"textarea","useForAI":true},"存活方法":{"type":"string","title":"存活方法","description":"目前已知的应对或暂时破解方法——可以不完整，给主角留下探索空间","x-uiWidget":"textarea","useForAI":true},"规则漏洞":{"type":"string","title":"规则漏洞","description":"规则是否有灰色地带或可以被利用的漏洞——好的规则都有例外","x-uiWidget":"textarea","useForAI":true},"未知层级":{"type":"string","title":"未知层级","description":"主角尚不知道的规则细节或更深层的真相——为后续反转留白","x-uiWidget":"textarea","useForAI":true}}}',
  0.9,
  @method_id,
  1,
  1,
  0,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  json_schema = VALUES(json_schema),
  temperature = VALUES(temperature),
  updated_at = NOW();

-- 2.4 都市世界观（setting, singleton, temp=1.0）
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  '都市世界观',
  '怪谈发生的现代城市背景——社会知道多少、官方如何反应、普通人怎么活',
  '{"type":"object","title":"都市世界观","required":["城市背景","事件阶段"],"properties":{"城市背景":{"type":"string","title":"城市背景","description":"故事发生的城市或具体区域——越具体越有代入感（如「上海某小区」「成都地铁3号线」）","x-uiWidget":"textarea","useForAI":true},"时代背景":{"type":"string","title":"时代背景","enum":["当代（智能手机时代）","近未来","近过去（2000年代）","模糊时间线"],"x-uiWidget":"radio","useForAI":true},"事件阶段":{"type":"string","title":"事件阶段","enum":["初始——大多数人不知道","扩散——少数人开始相信","爆发——无法再掩盖","崩溃——社会秩序瓦解","其他"],"x-uiWidget":"select","useForAI":true},"官方态度":{"type":"string","title":"官方态度","description":"政府/媒体/警察对怪谈事件的处理方式——封锁、否认、调查还是利用","x-uiWidget":"textarea","useForAI":true},"民间氛围":{"type":"string","title":"民间氛围","description":"普通市民的反应——恐慌、猎奇、否认、迷信复苏、自救组织形成","x-uiWidget":"textarea","useForAI":true},"异变区域":{"type":"string","title":"异变区域","description":"已知的高危区域或已发生异变的地点","x-uiWidget":"textarea","useForAI":true}}}',
  1.0,
  @method_id,
  1,
  1,
  0,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  json_schema = VALUES(json_schema),
  temperature = VALUES(temperature),
  updated_at = NOW();

-- 2.5 文风设定（setting, singleton, temp=1.0）
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  '文风设定',
  '叙事风格与恐怖类型——决定这个故事如何制造不安',
  '{"type":"object","title":"文风设定","properties":{"叙事视角":{"type":"string","title":"叙事视角","enum":["第一人称","第三人称限知","第三人称全知"],"x-uiWidget":"radio","useForAI":true},"恐怖类型":{"type":"string","title":"恐怖类型","enum":["氛围恐怖（以不安感为主）","心理恐怖（真相比怪物更可怕）","怪物恐怖（直接展示恐惧实体）","生存恐怖（规则求生为核心）","混合类型"],"x-uiWidget":"select","useForAI":true},"语言风格":{"type":"string","title":"语言风格","enum":["日常口语（接地气，代入感强）","新闻纪实风（伪纪录片感）","文学性叙述（氛围优先）","网络帖子体（论坛/微信截图风）"],"x-uiWidget":"radio","useForAI":true},"节奏把控":{"type":"string","title":"节奏把控","enum":["快节奏——事件密集不给喘息","中节奏——张弛有度","慢热型——氛围积累后爆发"],"x-uiWidget":"radio","useForAI":true},"信息密度":{"type":"string","title":"信息密度","enum":["知道得越多越恐惧（解谜型）","不知道才恐怖（未知型）","半知半解（悬念型）"],"x-uiWidget":"radio","useForAI":true},"禁用词汇":{"type":"string","title":"禁用词汇","description":"写作时需要避免的词汇或表达","x-uiWidget":"textarea","useForAI":true}}}',
  1.0,
  @method_id,
  1,
  1,
  0,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  json_schema = VALUES(json_schema),
  temperature = VALUES(temperature),
  updated_at = NOW();

-- 2.6 角色（character, non-singleton）
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  '角色',
  '故事中的人物——幸存者、调查者、知情者，以及那些被怪谈选中或利用的人',
  '{"type":"object","x-titleField":"姓名","required":["姓名","角色定位"],"properties":{"姓名":{"type":"string","title":"姓名","description":"角色姓名，不加括号说明","useForAI":true},"角色定位":{"type":"string","title":"角色定位","enum":["主角/幸存者","调查者","知情者/引路人","危险人物/传播源","帮凶/牺牲者","怀疑者/阻碍者","未知阵营"],"x-uiWidget":"radio","useForAI":true},"性别":{"type":"string","title":"性别","enum":["男","女","其他"],"x-uiWidget":"radio","useForAI":true},"年龄":{"type":"string","title":"年龄","useForAI":true},"职业/身份":{"type":"string","title":"职业/身份","description":"越普通的职业越有代入感——外卖员、地铁保安、便利店员工、公寓住户","x-uiWidget":"textarea","useForAI":true},"性格特质":{"type":"string","title":"性格特质","description":"面对恐惧时的核心反应模式——冷静分析型、本能逃跑型、越危险越清醒型","x-uiWidget":"textarea","useForAI":true},"与怪谈的关系":{"type":"string","title":"与怪谈的关系","description":"如何卷入怪谈——目击者、被选中者、主动调查者、无辜路人、知道秘密的人","x-uiWidget":"textarea","useForAI":true},"已知信息":{"type":"string","title":"已知信息","description":"角色目前知道的关于怪谈的信息","isDynamic":true},"当前状态":{"type":"string","title":"当前状态","description":"当前的心理状态与处境","isDynamic":true}}}',
  1.0,
  @method_id,
  1,
  0,
  0,
  'character',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  json_schema = VALUES(json_schema),
  temperature = VALUES(temperature),
  updated_at = NOW();

-- 2.7 都市场景（scene, non-singleton）
INSERT INTO module_type (name, description, json_schema, temperature, novel_creation_method_id, enable_ai, singleton, built_in, entity_category, created_at)
VALUES (
  '都市场景',
  '故事发生的具体地点——日常空间在怪谈影响下的异变形态',
  '{"type":"object","x-titleField":"场景名称","required":["场景名称","场景类型"],"properties":{"场景名称":{"type":"string","title":"场景名称","useForAI":true},"场景类型":{"type":"string","title":"场景类型","enum":["地铁/公共交通","电梯/楼道","医院/诊所","废弃建筑","公寓/住宅","便利店/商场","学校/图书馆","网络/虚拟空间","其他"],"x-uiWidget":"select","useForAI":true},"现实描述":{"type":"string","title":"现实描述","description":"正常状态下这个地方的样子——细节越具体越有代入感（灯光、气味、声音、常见人物）","x-uiWidget":"textarea","useForAI":true},"异变特征":{"type":"string","title":"异变特征","description":"怪谈影响下这里发生了什么变化——视觉、听觉、触觉的具体异常","x-uiWidget":"textarea","useForAI":true},"触发条件":{"type":"string","title":"触发条件","description":"什么情况下这里会变危险——时间、特定行为、人数或特殊状态","x-uiWidget":"textarea","useForAI":true},"逃脱线索":{"type":"string","title":"逃脱线索","description":"场景中存在的求生信息或隐藏线索","x-uiWidget":"textarea","useForAI":true},"当前状态":{"type":"string","title":"当前状态","description":"当前这个场景的危险等级和控制情况","isDynamic":true}}}',
  1.0,
  @method_id,
  1,
  0,
  0,
  'scene',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  json_schema = VALUES(json_schema),
  temperature = VALUES(temperature),
  updated_at = NOW();
