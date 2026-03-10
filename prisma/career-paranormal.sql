-- 职业灵异小说创作方法
-- 执行前注意：本地和云端数据库分别执行

INSERT INTO novel_creation_method (
  slug, name, name_zh, name_en, description_zh, description_en,
  novel_genre,
  visible_categories, created_at, updated_at
) VALUES (
  'career-paranormal',
  '职业灵异小说',
  '职业灵异小说',
  'Career Paranormal Novel',
  '以特定职业为切入点，主角因职业特性接触灵异事件的恐怖悬疑小说。支持捞尸人、法医、夜班保安、殡葬师、出租车司机、急诊护士等各类职业方向',
  'Horror suspense novels where the protagonist encounters paranormal events through their occupation. Supports various career directions such as corpse retriever, forensic pathologist, night security guard, undertaker, taxi driver, ER nurse, etc.',
  '职业灵异',
  '["setting","character","scene","prop"]',
  NOW(), NOW()
);
SET @method_id = LAST_INSERT_ID();

-- 1. 故事钩子（setting, singleton）
INSERT INTO module_type (
  name, name_zh, name_en, description_zh, description_en,
  json_schema_zh, json_schema_en,
  novel_creation_method_id, entity_category, enable_ai, singleton,
  created_at, updated_at
) VALUES (
  '故事钩子', '故事钩子', 'Story Hook',
  '故事的核心吸引力和卖点', 'Core attraction and selling point of the story',
  '{"type":"object","title":"故事钩子","required":["故事钩子"],"properties":{"故事钩子":{"type":"string","title":"故事钩子","description":"一句话概括故事最吸引人的点","x-uiWidget":"textarea"},"核心卖点":{"type":"string","title":"核心卖点","description":"这个故事区别于其他灵异小说的独特之处","x-uiWidget":"textarea"},"开篇悬念":{"type":"string","title":"开篇悬念","description":"开头几章就要呈现的悬念","x-uiWidget":"textarea"},"读者期待":{"type":"string","title":"读者期待","description":"读者期待从这个故事中获得什么体验","x-uiWidget":"textarea"}}}',
  '{"type":"object","title":"Story Hook","required":["Story Hook"],"properties":{"Story Hook":{"type":"string","title":"Story Hook","description":"One sentence summarizing the most attractive point of the story","x-uiWidget":"textarea"},"Core Selling Point":{"type":"string","title":"Core Selling Point","description":"What makes this story unique compared to other paranormal novels","x-uiWidget":"textarea"},"Opening Suspense":{"type":"string","title":"Opening Suspense","description":"The suspense to be presented in the first few chapters","x-uiWidget":"textarea"},"Reader Expectations":{"type":"string","title":"Reader Expectations","description":"What experience readers expect from this story","x-uiWidget":"textarea"}}}',
  @method_id, 'setting', 1, 1, NOW(), NOW()
);

-- 2. 职业设定（setting, singleton）
INSERT INTO module_type (
  name, name_zh, name_en, description_zh, description_en,
  json_schema_zh, json_schema_en,
  novel_creation_method_id, entity_category, enable_ai, singleton,
  created_at, updated_at
) VALUES (
  '职业设定', '职业设定', 'Career Setting',
  '主角的职业背景、行规行话、灵异接触方式', 'Protagonist career background, trade customs, and paranormal contact method',
  '{"type":"object","title":"职业设定","required":["职业名称","职业日常","灵异接触方式"],"properties":{"职业名称":{"type":"string","title":"职业名称","description":"具体的职业描述，越细越真实。不是「保安」而是「老旧写字楼夜班保安」","x-uiWidget":"textarea"},"职业日常":{"type":"string","title":"职业日常","description":"这个职业日常做什么、工作环境什么样、有哪些行规行话、同行之间的关系","x-uiWidget":"textarea"},"灵异接触方式":{"type":"string","title":"灵异接触方式","description":"这个职业为什么会接触灵异——是职业特性决定的，不是偶然","x-uiWidget":"textarea"},"职业传承":{"type":"string","title":"职业传承","description":"这个职业中口耳相传的经验、老规矩、师父教的禁忌——「老人说的话得听」","x-uiWidget":"textarea"},"入行背景":{"type":"string","title":"入行背景","description":"主角为什么干这行——家族传承、生活所迫、误入、还是主动选择","x-uiWidget":"textarea"}}}',
  '{"type":"object","title":"Career Setting","required":["Career Name","Daily Work","Paranormal Contact Method"],"properties":{"Career Name":{"type":"string","title":"Career Name","description":"Specific career description, the more detailed the more authentic. Not just \"security guard\" but \"night shift security guard at an old office building\"","x-uiWidget":"textarea"},"Daily Work":{"type":"string","title":"Daily Work","description":"What this job involves daily, the work environment, trade customs and jargon, relationships among colleagues","x-uiWidget":"textarea"},"Paranormal Contact Method":{"type":"string","title":"Paranormal Contact Method","description":"Why this career leads to paranormal encounters — it should be inherent to the job, not accidental","x-uiWidget":"textarea"},"Career Legacy":{"type":"string","title":"Career Legacy","description":"Knowledge passed down in this trade — old rules, taboos taught by mentors, \"listen to what the elders say\"","x-uiWidget":"textarea"},"Entry Background":{"type":"string","title":"Entry Background","description":"Why the protagonist chose this career — family tradition, financial necessity, accident, or active choice","x-uiWidget":"textarea"}}}',
  @method_id, 'setting', 1, 1, NOW(), NOW()
);

-- 3. 灵异规则（setting, singleton）
INSERT INTO module_type (
  name, name_zh, name_en, description_zh, description_en,
  json_schema_zh, json_schema_en,
  novel_creation_method_id, entity_category, enable_ai, singleton,
  created_at, updated_at
) VALUES (
  '灵异规则', '灵异规则', 'Paranormal Rules',
  '灵异现象的运作逻辑和应对手段', 'Operating logic of paranormal phenomena and countermeasures',
  '{"type":"object","title":"灵异规则","required":["灵异来源","应对手段"],"properties":{"灵异来源":{"type":"string","title":"灵异来源","description":"这个世界的灵异现象从何而来、为什么存在","x-uiWidget":"textarea"},"应对手段":{"type":"string","title":"应对手段","description":"职业中传承下来的应对方法——不一定是法术，可能是经验和规矩","x-uiWidget":"textarea"},"核心禁忌":{"type":"string","title":"核心禁忌","description":"绝对不能做的事，以及违反后的后果","x-uiWidget":"textarea"},"灵异等级":{"type":"string","title":"灵异等级","description":"不同程度的灵异事件如何区分，哪些能处理哪些必须跑","x-uiWidget":"textarea"}}}',
  '{"type":"object","title":"Paranormal Rules","required":["Paranormal Source","Countermeasures"],"properties":{"Paranormal Source":{"type":"string","title":"Paranormal Source","description":"Where paranormal phenomena come from in this world, why they exist","x-uiWidget":"textarea"},"Countermeasures":{"type":"string","title":"Countermeasures","description":"Methods passed down in the trade — not necessarily magic, could be experience and rules","x-uiWidget":"textarea"},"Core Taboos":{"type":"string","title":"Core Taboos","description":"Things that must never be done, and consequences of violation","x-uiWidget":"textarea"},"Paranormal Levels":{"type":"string","title":"Paranormal Levels","description":"How to distinguish different levels of paranormal events, which ones can be handled and which require fleeing","x-uiWidget":"textarea"}}}',
  @method_id, 'setting', 1, 1, NOW(), NOW()
);

-- 4. 文风设定（setting, singleton）
INSERT INTO module_type (
  name, name_zh, name_en, description_zh, description_en,
  json_schema_zh, json_schema_en,
  novel_creation_method_id, entity_category, enable_ai, singleton,
  created_at, updated_at
) VALUES (
  '文风设定', '文风设定', 'Writing Style',
  '叙事视角、语言风格、恐怖氛围控制', 'Narrative perspective, language style, horror atmosphere control',
  '{"type":"object","title":"文风设定","properties":{"叙事视角":{"type":"string","title":"叙事视角","enum":["第一人称","第三人称限知","第三人称全知"],"x-uiWidget":"radio"},"语言风格":{"type":"string","title":"语言风格","enum":["朴实口语","冷硬纪实","文艺细腻","幽默反差"],"x-uiWidget":"radio"},"恐怖尺度":{"type":"string","title":"恐怖尺度","enum":["细思极恐（暗示为主）","中度恐怖（氛围+适度描写）","重度恐怖（直接描写）"],"x-uiWidget":"radio"},"节奏把控":{"type":"string","title":"节奏把控","enum":["快节奏（短章节、高密度事件）","中等节奏","慢热型（重氛围营造）"],"x-uiWidget":"radio"},"禁用词汇":{"type":"string","title":"禁用词汇","description":"写作时需要避免的词汇或表达","x-uiWidget":"textarea"}}}',
  '{"type":"object","title":"Writing Style","properties":{"Narrative Perspective":{"type":"string","title":"Narrative Perspective","enum":["First Person","Third Person Limited","Third Person Omniscient"],"x-uiWidget":"radio"},"Language Style":{"type":"string","title":"Language Style","enum":["Plain Colloquial","Hard-boiled Documentary","Literary Delicate","Humorous Contrast"],"x-uiWidget":"radio"},"Horror Level":{"type":"string","title":"Horror Level","enum":["Subtle Horror (mostly implied)","Moderate Horror (atmosphere + moderate description)","Heavy Horror (direct description)"],"x-uiWidget":"radio"},"Pacing":{"type":"string","title":"Pacing","enum":["Fast-paced (short chapters, high-density events)","Medium-paced","Slow-burn (heavy atmosphere building)"],"x-uiWidget":"radio"},"Forbidden Words":{"type":"string","title":"Forbidden Words","description":"Words or expressions to avoid in writing","x-uiWidget":"textarea"}}}',
  @method_id, 'setting', 1, 1, NOW(), NOW()
);

-- 5. 角色（character, 多实例）
INSERT INTO module_type (
  name, name_zh, name_en, description_zh, description_en,
  json_schema_zh, json_schema_en,
  novel_creation_method_id, entity_category, enable_ai, singleton,
  created_at, updated_at
) VALUES (
  '角色', '角色', 'Character',
  '故事中的人物角色', 'Characters in the story',
  '{"type":"object","title":"角色","required":["姓名","身份定位","职业能力"],"properties":{"姓名":{"type":"string","title":"姓名","description":"角色全名"},"身份定位":{"type":"string","title":"身份定位","description":"在职业体系中的位置——新人、老手、师父、退休前辈、外行人、委托人","x-uiWidget":"textarea"},"职业能力":{"type":"string","title":"职业能力","description":"这个角色的职业技能和经验水平，具体到能做什么、不能做什么","x-uiWidget":"textarea"},"与灵异的关系":{"type":"string","title":"与灵异的关系","description":"体质特殊、有传承、纯靠经验、还是一无所知","x-uiWidget":"textarea"},"个人动机":{"type":"string","title":"个人动机","description":"为什么留在这个行当——赚钱、责任、好奇、身不由己","x-uiWidget":"textarea"},"性格特征":{"type":"string","title":"性格特征","description":"核心性格，以及在灵异事件中的典型反应","x-uiWidget":"textarea"},"外貌特征":{"type":"string","title":"外貌特征","description":"外貌中体现职业痕迹的细节。如常年熬夜的黑眼圈、粗糙的手","x-uiWidget":"textarea"},"背景故事":{"type":"string","title":"背景故事","description":"入行的经历，过去遇到过什么事","x-uiWidget":"textarea"},"称呼":{"type":"array","title":"称呼","description":"其他角色对当前角色的称呼","items":{"type":"object","properties":{"称呼者":{"type":"string","title":"称呼者"},"称呼":{"type":"string","title":"称呼"}},"required":["称呼者","称呼"]}}},"x-titleField":"姓名"}',
  '{"type":"object","title":"Character","required":["Name","Role Identity","Professional Skills"],"properties":{"Name":{"type":"string","title":"Name","description":"Character full name"},"Role Identity":{"type":"string","title":"Role Identity","description":"Position in the professional hierarchy — newcomer, veteran, mentor, retired elder, outsider, client","x-uiWidget":"textarea"},"Professional Skills":{"type":"string","title":"Professional Skills","description":"Specific professional skills and experience level, what they can and cannot do","x-uiWidget":"textarea"},"Relationship with Paranormal":{"type":"string","title":"Relationship with Paranormal","description":"Special constitution, inherited knowledge, pure experience, or completely unaware","x-uiWidget":"textarea"},"Personal Motivation":{"type":"string","title":"Personal Motivation","description":"Why they stay in this line of work — money, responsibility, curiosity, no choice","x-uiWidget":"textarea"},"Personality":{"type":"string","title":"Personality","description":"Core personality traits and typical reactions during paranormal events","x-uiWidget":"textarea"},"Appearance":{"type":"string","title":"Appearance","description":"Appearance details reflecting occupational marks, like dark circles from staying up late, rough hands","x-uiWidget":"textarea"},"Backstory":{"type":"string","title":"Backstory","description":"How they entered the profession, what they have experienced","x-uiWidget":"textarea"},"Appellations":{"type":"array","title":"Appellations","description":"How other characters address this character","items":{"type":"object","properties":{"Caller":{"type":"string","title":"Caller"},"Appellation":{"type":"string","title":"Appellation"}},"required":["Caller","Appellation"]}}},"x-titleField":"Name"}',
  @method_id, 'character', 1, 0, NOW(), NOW()
);

-- 6. 场景（scene, 多实例）
INSERT INTO module_type (
  name, name_zh, name_en, description_zh, description_en,
  json_schema_zh, json_schema_en,
  novel_creation_method_id, entity_category, enable_ai, singleton,
  created_at, updated_at
) VALUES (
  '场景', '场景', 'Scene',
  '故事中的场所和地点', 'Locations and places in the story',
  '{"type":"object","title":"场景","required":["场景名称","与职业的关系","环境描写"],"properties":{"场景名称":{"type":"string","title":"场景名称","description":"具有辨识度的名称"},"与职业的关系":{"type":"string","title":"与职业的关系","description":"这个场景和主角的职业有什么关系——工作场所、出任务的地方、还是私人空间","x-uiWidget":"textarea"},"环境描写":{"type":"string","title":"环境描写","description":"具体的环境细节——气味、光线、温度、声音、空间布局","x-uiWidget":"textarea"},"灵异征兆":{"type":"string","title":"灵异征兆","description":"在这个场景中，什么迹象说明不对劲了","x-uiWidget":"textarea"},"场景历史":{"type":"string","title":"场景历史","description":"这个地方以前发生过什么、有什么传闻","x-uiWidget":"textarea"},"规则与禁忌":{"type":"string","title":"规则与禁忌","description":"在这个场景中活动的注意事项和禁忌","x-uiWidget":"textarea"}}}',
  '{"type":"object","title":"Scene","required":["Scene Name","Relationship with Career","Environment Description"],"properties":{"Scene Name":{"type":"string","title":"Scene Name","description":"A distinctive name for the location"},"Relationship with Career":{"type":"string","title":"Relationship with Career","description":"How this scene relates to the protagonist career — workplace, mission site, or personal space","x-uiWidget":"textarea"},"Environment Description":{"type":"string","title":"Environment Description","description":"Specific environmental details — smell, lighting, temperature, sound, spatial layout","x-uiWidget":"textarea"},"Paranormal Signs":{"type":"string","title":"Paranormal Signs","description":"Signs in this scene indicating something is wrong","x-uiWidget":"textarea"},"Scene History":{"type":"string","title":"Scene History","description":"What happened here before, what rumors exist","x-uiWidget":"textarea"},"Rules and Taboos":{"type":"string","title":"Rules and Taboos","description":"Precautions and taboos when operating in this scene","x-uiWidget":"textarea"}}}',
  @method_id, 'scene', 1, 0, NOW(), NOW()
);

-- 7. 道具（prop, 多实例）
INSERT INTO module_type (
  name, name_zh, name_en, description_zh, description_en,
  json_schema_zh, json_schema_en,
  novel_creation_method_id, entity_category, enable_ai, singleton,
  created_at, updated_at
) VALUES (
  '道具', '道具', 'Prop',
  '故事中的物品和工具', 'Items and tools in the story',
  '{"type":"object","title":"道具","required":["道具名","来源","功能与用法"],"properties":{"道具名":{"type":"string","title":"道具名","description":"道具的名称"},"来源":{"type":"string","title":"来源","description":"从哪来的——职业工具改造、师父传下来、灵异事件中获得、自己发现的","x-uiWidget":"textarea"},"外观与材质":{"type":"string","title":"外观与材质","description":"具体的物理描述——材质、颜色、磨损程度、特殊标记","x-uiWidget":"textarea"},"功能与用法":{"type":"string","title":"功能与用法","description":"能做什么、怎么用","x-uiWidget":"textarea"},"忌讳":{"type":"string","title":"忌讳","description":"使用时有什么讲究或禁忌","x-uiWidget":"textarea"},"当前状态":{"type":"string","title":"当前状态","description":"道具目前的状况——完好、磨损、效力减弱等"}}}',
  '{"type":"object","title":"Prop","required":["Prop Name","Origin","Function and Usage"],"properties":{"Prop Name":{"type":"string","title":"Prop Name","description":"Name of the prop"},"Origin":{"type":"string","title":"Origin","description":"Where it came from — modified work tool, passed down by mentor, obtained from paranormal event, self-discovered","x-uiWidget":"textarea"},"Appearance and Material":{"type":"string","title":"Appearance and Material","description":"Physical description — material, color, wear level, special markings","x-uiWidget":"textarea"},"Function and Usage":{"type":"string","title":"Function and Usage","description":"What it can do, how to use it","x-uiWidget":"textarea"},"Taboos":{"type":"string","title":"Taboos","description":"Restrictions or taboos when using it","x-uiWidget":"textarea"},"Current Status":{"type":"string","title":"Current Status","description":"Current condition of the prop — intact, worn, weakened effectiveness, etc."}}}',
  @method_id, 'prop', 1, 0, NOW(), NOW()
);
