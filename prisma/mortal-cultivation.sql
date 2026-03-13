-- 凡人流修仙创作方法
-- 执行前注意：本地和云端数据库分别执行

INSERT INTO novel_creation_method (
  slug, name, name_zh, name_en, description_zh, description_en,
  novel_genre,
  visible_categories, created_at, updated_at
) VALUES (
  'mortal-cultivation',
  '凡人流修仙',
  '凡人流修仙',
  'Mortal Cultivation',
  '以凡人之躯踏入修仙世界，无特殊血脉、无逆天机缘，凭借谨慎心性和生存智慧在残酷的修仙界一步步攀升。核心是资源稀缺下的生存博弈、以弱胜强的算计布局、以及漫长修炼路上的孤独与坚持',
  'An ordinary mortal enters the cultivation world without special bloodlines or heaven-defying fortune, climbing step by step through caution and survival wisdom in a cruel world. The core lies in survival games under resource scarcity, strategic maneuvering of the weak against the strong, and the solitude and perseverance along the long path of cultivation',
  'xianxia',
  '["setting","character","scene","prop","organization"]',
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
  '{"type":"object","title":"故事钩子","required":["故事钩子"],"properties":{"故事钩子":{"type":"string","title":"故事钩子","description":"一句话概括故事最吸引人的点——凡人流的钩子往往在于主角如何在绝境中翻盘","x-uiWidget":"textarea"},"核心卖点":{"type":"string","title":"核心卖点","description":"这本书和其他凡人流修仙的区别是什么？独特的修炼体系、世界观、或主角的生存哲学","x-uiWidget":"textarea"},"开篇困境":{"type":"string","title":"开篇困境","description":"主角一开始面临什么具体的生存压力——不是抽象的「弱」，而是具体的危机","x-uiWidget":"textarea"},"读者爽点设计":{"type":"string","title":"读者爽点设计","description":"凡人流的爽感来源：以弱胜强、小人物的逆袭、积累后的厚积薄发、算计得逞","x-uiWidget":"textarea"},"长线悬念":{"type":"string","title":"长线悬念","description":"贯穿全书的核心悬念或目标","x-uiWidget":"textarea"}}}',
  '{"type":"object","title":"Story Hook","required":["Story Hook"],"properties":{"Story Hook":{"type":"string","title":"Story Hook","description":"One sentence summarizing the most attractive point — mortal cultivation hooks often lie in how the protagonist turns the tide in desperate situations","x-uiWidget":"textarea"},"Core Selling Point":{"type":"string","title":"Core Selling Point","description":"What distinguishes this book from other mortal cultivation novels? Unique cultivation system, worldview, or protagonist survival philosophy","x-uiWidget":"textarea"},"Opening Predicament":{"type":"string","title":"Opening Predicament","description":"What specific survival pressure does the protagonist face at the start — not abstract weakness, but concrete crisis","x-uiWidget":"textarea"},"Reader Satisfaction Design":{"type":"string","title":"Reader Satisfaction Design","description":"Source of satisfaction in mortal cultivation: defeating the strong while weak, underdog comeback, payoff after long accumulation, successful scheming","x-uiWidget":"textarea"},"Long-term Suspense":{"type":"string","title":"Long-term Suspense","description":"Core suspense or goal running through the entire book","x-uiWidget":"textarea"}}}',
  @method_id, 'setting', 1, 1, NOW(), NOW()
);

-- 2. 修炼体系（setting, singleton）
INSERT INTO module_type (
  name, name_zh, name_en, description_zh, description_en,
  json_schema_zh, json_schema_en,
  novel_creation_method_id, entity_category, enable_ai, singleton,
  created_at, updated_at
) VALUES (
  '修炼体系', '修炼体系', 'Cultivation System',
  '境界划分、修炼资源、瓶颈机制、战力体系', 'Realm divisions, cultivation resources, bottleneck mechanics, combat power system',
  '{"type":"object","title":"修炼体系","required":["境界划分","修炼资源","瓶颈与突破"],"properties":{"境界划分":{"type":"string","title":"境界划分","description":"从低到高的境界体系。每个境界要说明：修炼目标、寿元变化、战力量级、修士占比。凡人流的关键是越高境界越难——不是线性增长而是指数级壁垒","x-uiWidget":"textarea"},"修炼资源":{"type":"string","title":"修炼资源","description":"修炼需要消耗什么——灵石、丹药、天材地宝、功法、悟性。凡人流的核心矛盾是资源永远不够用，每一份资源都要精打细算","x-uiWidget":"textarea"},"瓶颈与突破":{"type":"string","title":"瓶颈与突破","description":"境界之间的壁垒是什么、突破需要什么条件。凡人流中瓶颈是最大的敌人——不是打不过别人，而是自己卡在某个境界几十上百年","x-uiWidget":"textarea"},"灵根与资质":{"type":"string","title":"灵根与资质","description":"资质体系的设定——灵根种类、品质对修炼速度的影响。主角的资质必须是中下水平，但要留出可以弥补的空间（苦修、奇遇、辅助丹药等）","x-uiWidget":"textarea"},"战斗体系":{"type":"string","title":"战斗体系","description":"修士之间如何战斗——法术、法器、符箓、阵法、肉身。凡人流的战斗要体现以弱胜强的策略性，不是硬碰硬","x-uiWidget":"textarea"},"功法体系":{"type":"string","title":"功法体系","description":"功法的分类和品质体系。主角不一定用最强的功法，但要有适合自己的独特选择","x-uiWidget":"textarea"}}}',
  '{"type":"object","title":"Cultivation System","required":["Realm Division","Cultivation Resources","Bottlenecks and Breakthroughs"],"properties":{"Realm Division":{"type":"string","title":"Realm Division","description":"Realm system from low to high. Each realm should specify: cultivation goal, lifespan changes, combat power level, percentage of cultivators. The key in mortal cultivation is that higher realms are exponentially harder","x-uiWidget":"textarea"},"Cultivation Resources":{"type":"string","title":"Cultivation Resources","description":"What cultivation requires — spirit stones, pills, treasures, techniques, comprehension. The core conflict in mortal cultivation is that resources are never enough","x-uiWidget":"textarea"},"Bottlenecks and Breakthroughs":{"type":"string","title":"Bottlenecks and Breakthroughs","description":"What barriers exist between realms, what conditions are needed to break through. In mortal cultivation, bottlenecks are the greatest enemy — not being unable to defeat others, but being stuck at a realm for decades","x-uiWidget":"textarea"},"Spiritual Roots and Aptitude":{"type":"string","title":"Spiritual Roots and Aptitude","description":"Aptitude system — types of spiritual roots, how quality affects cultivation speed. The protagonist must have below-average aptitude but with room for compensation","x-uiWidget":"textarea"},"Combat System":{"type":"string","title":"Combat System","description":"How cultivators fight — spells, artifacts, talismans, formations, physical body. Mortal cultivation combat should emphasize strategy over brute force","x-uiWidget":"textarea"},"Technique System":{"type":"string","title":"Technique System","description":"Classification and quality system of cultivation techniques. The protagonist may not use the strongest technique but should make a unique choice suited to themselves","x-uiWidget":"textarea"}}}',
  @method_id, 'setting', 1, 1, NOW(), NOW()
);

-- 3. 天地法则（setting, singleton）
INSERT INTO module_type (
  name, name_zh, name_en, description_zh, description_en,
  json_schema_zh, json_schema_en,
  novel_creation_method_id, entity_category, enable_ai, singleton,
  created_at, updated_at
) VALUES (
  '天地法则', '天地法则', 'World Laws',
  '修仙世界的运行规则、资源分配逻辑、修士社会生态', 'Operating rules of the cultivation world, resource distribution logic, cultivator social ecology',
  '{"type":"object","title":"天地法则","required":["世界格局","修士社会","凡人与修士"],"properties":{"世界格局":{"type":"string","title":"世界格局","description":"修仙世界的地理格局——是一个大陆还是多界、修仙文明的规模、天地灵气的分布","x-uiWidget":"textarea"},"修士社会":{"type":"string","title":"修士社会","description":"修士之间的社会关系——强者为尊到什么程度、有没有规则和法律、弱肉强食还是相对有序。凡人流需要一个足够残酷但又不完全无序的世界","x-uiWidget":"textarea"},"资源分配":{"type":"string","title":"资源分配","description":"修炼资源如何分配——大宗门垄断还是散修也有机会、灵矿灵脉归谁、底层修士靠什么活着。这是凡人流最核心的世界观设定","x-uiWidget":"textarea"},"凡人与修士":{"type":"string","title":"凡人与修士","description":"凡人在修仙世界中的地位——蝼蚁、附庸、还是有一定自治权。主角从凡人入修仙的通道是什么","x-uiWidget":"textarea"},"天道规则":{"type":"string","title":"天道规则","description":"天地间的自然法则——天劫、因果、气运等超自然规则。这些规则对凡人出身的修士是有利还是不利","x-uiWidget":"textarea"},"禁忌与代价":{"type":"string","title":"禁忌与代价","description":"修仙世界中的禁忌——邪修、禁术、夺舍、魂修等灰色地带。主角面对捷径时的抉择","x-uiWidget":"textarea"}}}',
  '{"type":"object","title":"World Laws","required":["World Structure","Cultivator Society","Mortals and Cultivators"],"properties":{"World Structure":{"type":"string","title":"World Structure","description":"Geographic structure of the cultivation world — single continent or multiple realms, scale of civilization, distribution of spiritual energy","x-uiWidget":"textarea"},"Cultivator Society":{"type":"string","title":"Cultivator Society","description":"Social relationships among cultivators — how far does might-makes-right go, are there rules and laws, survival of the fittest or relatively ordered. Mortal cultivation needs a world that is cruel enough but not completely chaotic","x-uiWidget":"textarea"},"Resource Distribution":{"type":"string","title":"Resource Distribution","description":"How cultivation resources are distributed — monopolized by major sects or available to independent cultivators, who controls spirit mines. This is the most critical worldview setting for mortal cultivation","x-uiWidget":"textarea"},"Mortals and Cultivators":{"type":"string","title":"Mortals and Cultivators","description":"Status of mortals in the cultivation world — ants, vassals, or having some autonomy. What is the pathway from mortal to cultivator for the protagonist","x-uiWidget":"textarea"},"Heavenly Dao Rules":{"type":"string","title":"Heavenly Dao Rules","description":"Natural laws of the world — heavenly tribulations, karma, fortune. Are these rules favorable or unfavorable to cultivators of mortal origin","x-uiWidget":"textarea"},"Taboos and Costs":{"type":"string","title":"Taboos and Costs","description":"Taboos in the cultivation world — evil cultivation, forbidden arts, body possession. The protagonist choices when facing shortcuts","x-uiWidget":"textarea"}}}',
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
  '叙事风格、节奏控制、氛围营造', 'Narrative style, pacing control, atmosphere building',
  '{"type":"object","title":"文风设定","properties":{"叙事视角":{"type":"string","title":"叙事视角","enum":["第一人称","第三人称限知","第三人称全知"],"x-uiWidget":"radio"},"语言风格":{"type":"string","title":"语言风格","enum":["冷静克制（少心理描写，以行动展现性格）","沉稳内敛（适度心理，重细节描写）","朴实平淡（白描为主，不堆砌修辞）","古朴典雅（半文半白，有古风韵味）"],"x-uiWidget":"radio"},"时间跨度处理":{"type":"string","title":"时间跨度处理","enum":["细写关键节点，大幅跳过苦修期","均匀叙述，展现修炼的漫长","详略交替，苦修期穿插小事件保持节奏"],"x-uiWidget":"radio"},"战斗描写风格":{"type":"string","title":"战斗描写风格","enum":["策略为主（重布局谋划，轻招式描写）","写实风格（伤亡、消耗、恐惧都要写）","简洁利落（不拖泥带水，快刀斩乱麻）","紧张悬疑（以弱斗强时的心理压力）"],"x-uiWidget":"radio"},"禁用词汇":{"type":"string","title":"禁用词汇","description":"写作时需要避免的词汇或表达——凡人流通常避免过于中二的用语","x-uiWidget":"textarea"},"特殊要求":{"type":"string","title":"特殊要求","description":"其他文风方面的特殊要求——如不写后宫、控制升级速度、不用系统面板等","x-uiWidget":"textarea"}}}',
  '{"type":"object","title":"Writing Style","properties":{"Narrative Perspective":{"type":"string","title":"Narrative Perspective","enum":["First Person","Third Person Limited","Third Person Omniscient"],"x-uiWidget":"radio"},"Language Style":{"type":"string","title":"Language Style","enum":["Calm and Restrained (minimal inner monologue, show character through actions)","Steady and Reserved (moderate psychology, detail-focused)","Plain and Simple (sketch-style, no rhetorical flourishes)","Archaic and Elegant (semi-classical Chinese flavor)"],"x-uiWidget":"radio"},"Time Span Handling":{"type":"string","title":"Time Span Handling","enum":["Detail key moments, skip long cultivation periods","Even narration, showing the length of cultivation","Alternating detail, inserting small events during cultivation to maintain pace"],"x-uiWidget":"radio"},"Combat Description Style":{"type":"string","title":"Combat Description Style","enum":["Strategy-focused (emphasize planning, light on moves)","Realistic (casualties, consumption, fear all described)","Clean and Swift (no dragging, decisive)","Tense and Suspenseful (psychological pressure when fighting stronger opponents)"],"x-uiWidget":"radio"},"Forbidden Words":{"type":"string","title":"Forbidden Words","description":"Words or expressions to avoid — mortal cultivation usually avoids overly chuunibyou language","x-uiWidget":"textarea"},"Special Requirements":{"type":"string","title":"Special Requirements","description":"Other writing style requirements — e.g., no harem, controlled leveling speed, no system panels","x-uiWidget":"textarea"}}}',
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
  '故事中的修士、凡人及其他角色', 'Cultivators, mortals, and other characters in the story',
  '{"type":"object","title":"角色","required":["姓名","身份定位","修为境界"],"properties":{"姓名":{"type":"string","title":"姓名","description":"角色全名，可附带道号或外号"},"身份定位":{"type":"string","title":"身份定位","description":"在故事中的角色定位——主角、盟友、对手、过客、师长、商人。凡人流中没有永远的朋友，利益关系要写清楚","x-uiWidget":"textarea"},"修为境界":{"type":"string","title":"修为境界","description":"当前修为等级、灵根资质、修炼速度。如果是凡人则写明身份","x-uiWidget":"textarea"},"资源状况":{"type":"string","title":"资源状况","description":"拥有的修炼资源——灵石、丹药、法器、功法。凡人流中资源是核心矛盾，每个角色的资源状况直接影响行为动机","x-uiWidget":"textarea"},"性格与处事":{"type":"string","title":"性格与处事","description":"核心性格特征和处事方式——面对利益冲突时的选择倾向。凡人流角色不能非黑即白","x-uiWidget":"textarea"},"与主角的关系":{"type":"string","title":"与主角的关系","description":"和主角的具体关系——利益交换、师徒、同门、竞争者。关系会如何随利益变化而改变","x-uiWidget":"textarea"},"独特能力":{"type":"string","title":"独特能力","description":"擅长什么——炼丹、布阵、剑修、符箓、特殊体质。能力要有局限性","x-uiWidget":"textarea"},"背景经历":{"type":"string","title":"背景经历","description":"来历和过往——出身、入道契机、经历过的重大事件","x-uiWidget":"textarea"},"外貌特征":{"type":"string","title":"外貌特征","description":"辨识度高的外貌细节——修士的外貌往往反映修为和经历"},"称呼":{"type":"array","title":"称呼","description":"其他角色对当前角色的称呼","items":{"type":"object","properties":{"称呼者":{"type":"string","title":"称呼者"},"称呼":{"type":"string","title":"称呼"}},"required":["称呼者","称呼"]}}},"x-titleField":"姓名"}',
  '{"type":"object","title":"Character","required":["Name","Role Identity","Cultivation Realm"],"properties":{"Name":{"type":"string","title":"Name","description":"Full name, may include Dao title or nickname"},"Role Identity":{"type":"string","title":"Role Identity","description":"Role in the story — protagonist, ally, opponent, passerby, mentor, merchant. In mortal cultivation there are no permanent friends, interest relationships must be clear","x-uiWidget":"textarea"},"Cultivation Realm":{"type":"string","title":"Cultivation Realm","description":"Current cultivation level, spiritual root aptitude, cultivation speed. If mortal, specify identity","x-uiWidget":"textarea"},"Resource Status":{"type":"string","title":"Resource Status","description":"Cultivation resources owned — spirit stones, pills, artifacts, techniques. Resources are the core conflict in mortal cultivation","x-uiWidget":"textarea"},"Personality and Conduct":{"type":"string","title":"Personality and Conduct","description":"Core personality traits and conduct style — tendencies when facing conflicts of interest. Characters cannot be black or white","x-uiWidget":"textarea"},"Relationship with Protagonist":{"type":"string","title":"Relationship with Protagonist","description":"Specific relationship with protagonist — trade, master-disciple, fellow disciples, competitors. How the relationship changes with shifting interests","x-uiWidget":"textarea"},"Unique Abilities":{"type":"string","title":"Unique Abilities","description":"Specialties — alchemy, formations, sword cultivation, talismans, special constitution. Abilities must have limitations","x-uiWidget":"textarea"},"Background":{"type":"string","title":"Background","description":"Origin and past — background, catalyst for entering cultivation, major events experienced","x-uiWidget":"textarea"},"Appearance":{"type":"string","title":"Appearance","description":"Distinctive appearance details — a cultivator appearance often reflects their realm and experiences"},"Appellations":{"type":"array","title":"Appellations","description":"How other characters address this character","items":{"type":"object","properties":{"Caller":{"type":"string","title":"Caller"},"Appellation":{"type":"string","title":"Appellation"}},"required":["Caller","Appellation"]}}},"x-titleField":"Name"}',
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
  '修仙世界中的地点和场所', 'Locations and places in the cultivation world',
  '{"type":"object","title":"场景","required":["场景名称","场景类型","环境描写"],"properties":{"场景名称":{"type":"string","title":"场景名称","description":"场景的名称——要有修仙世界的味道"},"场景类型":{"type":"string","title":"场景类型","enum":["宗门/门派","坊市/交易场所","秘境/遗迹","凡人城镇","荒野/危险区域","矿脉/资源地","个人洞府","其他"],"x-uiWidget":"radio"},"环境描写":{"type":"string","title":"环境描写","description":"灵气浓度、地形地貌、气候特征、视觉听觉感受。凡人流中环境描写要体现资源的稀缺或丰富","x-uiWidget":"textarea"},"资源与机缘":{"type":"string","title":"资源与机缘","description":"这个场景有什么修炼资源或机缘——灵矿、灵草、古修遗留、特殊环境。资源的获取代价和风险","x-uiWidget":"textarea"},"危险程度":{"type":"string","title":"危险程度","description":"存在什么危险——妖兽、禁制、瘴气、其他修士。对不同境界的修士分别意味着什么","x-uiWidget":"textarea"},"势力归属":{"type":"string","title":"势力归属","description":"被谁控制或管辖——某宗门的地盘、多势力争夺区、无主之地。底层修士能不能进入","x-uiWidget":"textarea"},"场景历史":{"type":"string","title":"场景历史","description":"这个地方的来历、传闻、曾经发生过什么","x-uiWidget":"textarea"}}}',
  '{"type":"object","title":"Scene","required":["Scene Name","Scene Type","Environment Description"],"properties":{"Scene Name":{"type":"string","title":"Scene Name","description":"Name of the scene — should have cultivation world flavor"},"Scene Type":{"type":"string","title":"Scene Type","enum":["Sect/School","Market/Trading Place","Secret Realm/Ruins","Mortal Town","Wilderness/Danger Zone","Mine/Resource Area","Personal Cave Dwelling","Other"],"x-uiWidget":"radio"},"Environment Description":{"type":"string","title":"Environment Description","description":"Spiritual energy density, terrain, climate, visual and auditory sensations. In mortal cultivation, environment should reflect resource scarcity or abundance","x-uiWidget":"textarea"},"Resources and Opportunities":{"type":"string","title":"Resources and Opportunities","description":"What cultivation resources or opportunities exist — spirit mines, herbs, ancient cultivator remnants. Cost and risk of obtaining resources","x-uiWidget":"textarea"},"Danger Level":{"type":"string","title":"Danger Level","description":"What dangers exist — demon beasts, restrictions, miasma, other cultivators. What it means for cultivators of different realms","x-uiWidget":"textarea"},"Faction Control":{"type":"string","title":"Faction Control","description":"Who controls or governs this area — a sect territory, contested zone, unclaimed land. Can low-level cultivators enter","x-uiWidget":"textarea"},"Scene History":{"type":"string","title":"Scene History","description":"Origin, rumors, and past events of this place","x-uiWidget":"textarea"}}}',
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
  '丹药、法器、功法、灵材等修仙物品', 'Pills, artifacts, techniques, spirit materials and other cultivation items',
  '{"type":"object","title":"道具","required":["道具名","道具类别","功能与效果"],"properties":{"道具名":{"type":"string","title":"道具名","description":"道具的名称"},"道具类别":{"type":"string","title":"道具类别","enum":["丹药","法器","功法","符箓","阵盘/阵旗","灵材/天材地宝","杂项"],"x-uiWidget":"radio"},"品级":{"type":"string","title":"品级","description":"道具在体系中的品质等级——和修炼境界的对应关系"},"功能与效果":{"type":"string","title":"功能与效果","description":"具体能做什么、效果如何。凡人流中道具的功能要有明确边界，不能万能","x-uiWidget":"textarea"},"获取难度":{"type":"string","title":"获取难度","description":"获取渠道和代价——花多少灵石、需要什么条件、有没有替代品。凡人流中这一项最重要","x-uiWidget":"textarea"},"使用限制":{"type":"string","title":"使用限制","description":"使用条件和副作用——境界要求、使用次数、冷却时间、对身体的负担","x-uiWidget":"textarea"},"来历":{"type":"string","title":"来历","description":"从哪来的——坊市购买、战斗缴获、秘境所得、师门传授","x-uiWidget":"textarea"},"当前状态":{"type":"string","title":"当前状态","description":"道具目前的状况——完好、磨损、灵力不足、需要修复等"}}}',
  '{"type":"object","title":"Prop","required":["Prop Name","Prop Category","Function and Effect"],"properties":{"Prop Name":{"type":"string","title":"Prop Name","description":"Name of the prop"},"Prop Category":{"type":"string","title":"Prop Category","enum":["Pill","Artifact","Technique","Talisman","Formation Disk/Flag","Spirit Material/Treasure","Miscellaneous"],"x-uiWidget":"radio"},"Grade":{"type":"string","title":"Grade","description":"Quality grade within the system — correspondence with cultivation realms"},"Function and Effect":{"type":"string","title":"Function and Effect","description":"What it does specifically. In mortal cultivation, props must have clear boundaries, never omnipotent","x-uiWidget":"textarea"},"Acquisition Difficulty":{"type":"string","title":"Acquisition Difficulty","description":"How to obtain and at what cost — how many spirit stones, conditions needed, alternatives available. This is the most important field in mortal cultivation","x-uiWidget":"textarea"},"Usage Restrictions":{"type":"string","title":"Usage Restrictions","description":"Conditions and side effects — realm requirements, usage count, cooldown, physical burden","x-uiWidget":"textarea"},"Origin":{"type":"string","title":"Origin","description":"Where it came from — purchased at market, seized in battle, found in secret realm, taught by sect","x-uiWidget":"textarea"},"Current Status":{"type":"string","title":"Current Status","description":"Current condition — intact, worn, low on spiritual energy, needs repair, etc."}}}',
  @method_id, 'prop', 1, 0, NOW(), NOW()
);

-- 8. 势力（organization, 多实例）
INSERT INTO module_type (
  name, name_zh, name_en, description_zh, description_en,
  json_schema_zh, json_schema_en,
  novel_creation_method_id, entity_category, enable_ai, singleton,
  created_at, updated_at
) VALUES (
  '势力', '势力', 'Faction',
  '宗门、家族、散修联盟等修仙势力', 'Sects, clans, loose cultivator alliances and other cultivation factions',
  '{"type":"object","title":"势力","required":["势力名称","势力类型","实力层级"],"properties":{"势力名称":{"type":"string","title":"势力名称","description":"势力的名称"},"势力类型":{"type":"string","title":"势力类型","enum":["大宗门","中小门派","修仙家族","散修联盟","商会/坊市","邪修组织","凡人王朝","其他"],"x-uiWidget":"radio"},"实力层级":{"type":"string","title":"实力层级","description":"势力的整体实力——最强者境界、核心弟子数量、控制的资源量级","x-uiWidget":"textarea"},"对底层态度":{"type":"string","title":"对底层态度","description":"对低阶修士和散修的态度——吸纳、剥削、无视、还是有明确的晋升通道。这直接影响凡人流主角的生存环境","x-uiWidget":"textarea"},"资源与利益":{"type":"string","title":"资源与利益","description":"控制哪些关键资源——灵矿、灵药产地、坊市、传送阵。势力之间的利益纠葛","x-uiWidget":"textarea"},"加入条件":{"type":"string","title":"加入条件","description":"什么人能加入、加入后的义务和权利。对凡人出身的修士有没有门槛","x-uiWidget":"textarea"},"内部结构":{"type":"string","title":"内部结构","description":"权力结构——掌门/长老/内门/外门/杂役。派系争斗、资源分配的内部矛盾","x-uiWidget":"textarea"},"与主角的关系":{"type":"string","title":"与主角的关系","description":"主角和这个势力的关系——隶属、合作、敌对、利用。关系的变化轨迹","x-uiWidget":"textarea"}}}',
  '{"type":"object","title":"Faction","required":["Faction Name","Faction Type","Power Level"],"properties":{"Faction Name":{"type":"string","title":"Faction Name","description":"Name of the faction"},"Faction Type":{"type":"string","title":"Faction Type","enum":["Major Sect","Minor Sect","Cultivation Clan","Loose Cultivator Alliance","Merchant Guild/Market","Evil Cultivator Organization","Mortal Dynasty","Other"],"x-uiWidget":"radio"},"Power Level":{"type":"string","title":"Power Level","description":"Overall strength — highest realm cultivator, number of core disciples, scale of controlled resources","x-uiWidget":"textarea"},"Attitude toward Low-level":{"type":"string","title":"Attitude toward Low-level","description":"Attitude toward low-level and loose cultivators — recruit, exploit, ignore, or provide clear advancement paths. This directly affects the mortal cultivation protagonist survival environment","x-uiWidget":"textarea"},"Resources and Interests":{"type":"string","title":"Resources and Interests","description":"Key resources controlled — spirit mines, herb grounds, markets, teleportation arrays. Interest entanglements between factions","x-uiWidget":"textarea"},"Entry Requirements":{"type":"string","title":"Entry Requirements","description":"Who can join, obligations and rights after joining. Are there barriers for cultivators of mortal origin","x-uiWidget":"textarea"},"Internal Structure":{"type":"string","title":"Internal Structure","description":"Power structure — sect master/elders/inner disciples/outer disciples/servants. Factional struggles and internal resource distribution conflicts","x-uiWidget":"textarea"},"Relationship with Protagonist":{"type":"string","title":"Relationship with Protagonist","description":"Protagonist relationship with this faction — subordinate, cooperative, hostile, exploitative. Trajectory of relationship changes","x-uiWidget":"textarea"}}}',
  @method_id, 'organization', 1, 0, NOW(), NOW()
);
