-- -----------------------------------------------------------------------------
-- 传统古典仙侠 AI 生成技能 Layer 3 SQL
-- -----------------------------------------------------------------------------

SET @method_id = 107; 

-- ============================================================================
-- 1. 设定生成技能 (-setting-gen)
-- ============================================================================

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-classical-story-hook-setting-gen',
  '「剑斩凡尘与仙风指路钩子」生成：生成被灭门的少年或背负宿命的皇子踏入正统大宗门求仙的王道开篇',
  '"Story Hook" setting generation for Classical Xianxia',
  '## 「凡境入仙门王道钩子」设定生成 — 古典仙侠\n\n传统的古典仙侠没有一开始的“杀人夺宝”，它是充满仙气和宿命感的。\n\n---\n\n### 字段生成指南\n\n#### 极具纯度的身世执念\n主角入仙门不是因为怕死或者想发财。而是因为纯粹的“家仇血恨下对力量的渴望”（如普通的草庙村被血洗），或者是生来骨子里的“剑道痴迷”。\n\n#### 第一步悟道的仙风气度\n不要写主角为了抢一把铁剑和师兄弟打得头破血流。写主角在后山扫地三年，日观破晓云海，某一夜，天地交泰间主角顿悟了太极玄清道，万千青莲剑气共鸣，惊动了闭死关的三大祖师出面抢着收徒。',
  '## "Story Hook" Setting Generation — Classical Xianxia\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-classical-world-setting-gen',
  '「大道无情与问心劫法则」设定：不侧重资源掠夺而侧重心境圆满与正魔抗争的天道格局',
  '"Worldview" setting generation for Classical Xianxia',
  '## 「正邪宿命天道世界观」设定生成 — 古典仙侠\n\n---\n\n### 字段生成指南\n\n#### 境界与心境提升\n在这里，修为的瓶颈不是缺丹药，而是缺“感悟”。很多天才百年结丹，但因为堪不破一个“情”字，终生无望元婴。一旦主角强行破关，便会引发毁天灭地的“心魔天劫”。\n\n#### 浩然正气与天下大局\n天下分正魔或者道佛妖魔。正道有为了天下苍生甘愿兵解封魔的高人；魔道也有隐忍千年只想让族人重见天日的枭雄。世界观要有厚重的金庸武侠遗风家国（苍生）天下感。',
  '## "Worldview" Setting Generation — Classical Xianxia\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-classical-style-setting-gen',
  '「一剑光寒缥缈仙风」生成：极其克制隐忍的情感描写与极具水墨留白感的古风斗剑战斗',
  '"Writing Style" setting generation for Classical Xianxia',
  '## 「清冷孤傲的万丈诗意文风档案」设定生成 — 古典仙侠\n\n---\n\n### 字段生成指南\n\n#### 一剑破万法的浪漫\n所有的战斗核心都要凸显“剑意在心不在招”。弃用“火球术爆裂了半个山头”，改为“一剑递出，看似毫无烟火气，半空中的天魔却忽然裂做虚无。剑尖指处，万剑朝宗。”\n\n#### 生死相隔的情感拉扯\n情感戏必须要写出“正邪殊途”、“为了天下苍生只能拔剑相向”、“为你违抗整个天下”的惨烈悲剧美学。',
  '## "Writing Style" Setting Generation — Classical Xianxia\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);


-- ============================================================================
-- 2. 角色生成技能 (-character-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-classical-character-gen',
  '「名门天骄与魔道圣女群像」生成：一身傲骨、拥有神剑法相及背负情债宿命的男女道友',
  '"Character" generation for Classical Xianxia',
  '## 「名门清冷骄女与魔道大妖」生成 — 古典仙侠\n\n古典仙侠的配角往往比主角的人气还高，因为他们够痴、够执着。\n\n---\n\n### 字段生成指南\n\n#### 极端分化的人物性\n女主角1必是一个一袭白衣、修冰心诀、清冷如九天仙子、但认定主角后可以为他在诛仙剑阵下挡剑的骄女（类似陆雪琪）。\n女主角2必是一个古灵精怪、身负魔道血仇、亦正亦邪、为了主角可以放弃身份或者赴死的妖女/圣女（类似碧瑶）。\n师傅/长辈：往往道貌岸然的高层中必有一个伪君子，而真正教导主角的可能是一个烂醉如泥但深藏不露的酒剑仙。',
  '## "Character" Generation — Classical Xianxia\n\n...',
  @method_id, 1, 21, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 3. 场景生成技能 (-scene-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-classical-scene-gen',
  '「名山大川与镇魔井」生成：充斥着飞仙遗迹、白鹤灵芝的名山正派与阴森的万魔深渊',
  '"Scene" generation for Classical Xianxia',
  '## 「神州仙境大好古迹」生成 — 古典仙侠\n\n---\n\n### 字段生成指南\n\n#### 仙风道骨的门派大景\n不要写乌烟瘴气的坊市。写“高耸入云霄的金顶悬浮在九天之上，七彩虹桥连接着七座悬空剑峰。广场上有万名白衣弟子迎着朝阳吞吐紫气练剑”。体现绝对的仙家盛况。\n\n#### 命运转折的审判之地\n如：万魔窟底。或者是大雄宝殿内，正道各大派的掌门联合审判主角为何与魔教妖女勾结。主角在这里被逼得叛出师门，拔剑相对。',
  '## "Scene" Generation — Classical Xianxia\n\n...',
  @method_id, 1, 22, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 4. 道具生成技能 (-prop-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-classical-prop-gen',
  '「寄情信物与镇派古剑」生成：具有唯一性、极易暴走反噬或锁着三魂七魄的千古神兵',
  '"Prop" generation for Classical Xianxia',
  '## 「名剑神兵与还灵魂魄」生成 — 古典仙侠\n\n不需要太多法宝，一把本命飞剑，一件承载生死深情的奇药就够了。\n\n---\n\n### 字段生成指南\n\n#### 伴随一生的神剑\n例如“绝仙剑”、“烧火棍”。要求这把兵器非常挑主人，且能感应主人的心境。主人入魔，剑光便由青转极煞之红；主人生悲，剑会在半夜发出长声哀鸣。\n\n#### 救命的痴情信物\n用来复活死去的配角的至尊道具。如：能够保住最后一丝魂魄不灭的【定魂珠】或是远在极北修罗海由万年玄冰守护的【千年雪莲】。它是主角耗费半本书去寻找的主线。',
  '## "Prop" Generation — Classical Xianxia\n\n...',
  @method_id, 1, 23, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 5. 组织生成技能 (-org-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-classical-org-gen',
  '「底线与使命宗门」生成：以除魔卫道为己任但也会因为偏见逼死好人的极正与极恶教派',
  '"Organization" generation for Classical Xianxia',
  '## 「领袖正邪大宗」生成 — 古典仙侠\n\n---\n\n### 字段生成指南\n\n#### 正气的沉重十字架\n名门正派是好的，他们真的会为了掩护小镇平民而战死到最后一个人。但是这种正统也往往带来极端的偏见。一旦发现魔教，就算是魔教的无辜婴儿也会冷血刺杀。\n\n#### 魔教的神话复辟\n魔教不是单纯的神经病和杀人魔。他们有组织、有纪律（比如四大圣使、青龙白虎护法），拥有为了接引上古魔神降临而甘愿集体赴死的变态信仰凝聚力。',
  '## "Organization" Generation — Classical Xianxia\n\n...',
  @method_id, 1, 25, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 6. 情节推演技能 (-plot-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-classical-plot-gen',
  '「正邪魔女情缘大纲推演」领域知识：为主角从拜入仙门到与魔教妖女相恋抗拒天下的悲剧史诗排演',
  '"Plot Design" domain knowledge for Classical Xianxia',
  '## 「王道宿命大纲推演」领域知识 — 古典仙侠\n\n古典仙侠就是玄幻版的《神雕侠侣》。情与道的冲突，天下与爱人的抉择永远是最核心的。\n\n---\n\n### 典型故事推演结构\n1. **入仙门与大比惊艳**：受尽白眼的凡人主角拜入宗门。因为一次下山历练或者深谷奇遇得到神剑。在几年后的“七脉会武/宗门大比”中，在所有人都不看好的情况下，靠着惊世骇俗的剑道天赋一剑惊退天才师兄，引得全宗哗然震动。\n2. **下山除妖与生死红颜**：主角下山历练试炼。在古老的地宫或者沙漠中，遭遇极度危险的上古凶兽。在绝境中与亦正亦邪的魔教妖女互相扶持、暗生情愫，结下生死之交。\n3. **身世曝光与正邪交锋撕裂**：魔教大举进攻正派圣山。在最惨烈的乱战大高潮中，主角发现自己的身世秘密或者发现师傅被魔教所害。主角因救魔教红颜被正版祖宗重罚。此时魔教红颜为了护住主角，替主角挡下致命的护宗诛仙剑阵大阵，香消玉殒。主角彻底绝望入魔，叛出名门。\n4. **万恶深渊与逆天归来**：主角带着遗体远走天涯寻找起死回生之法。十年后天下再次面临大劫将毁。满头白发、修成半仙半魔无敌境的主角踏碎虚空归来。一句“苍生与我何干”，却又为苍生斩出最后一剑镇压一切动乱。最后主角抱着红颜的躯体，孤身一人飞升上界或隐遁世间。\n\n### 常见错误\n- ❌ 中途主角为了获得一件法宝而偷袭抢夺好兄弟。古典主角可以死，但三观必须是“侠”，如果猥琐了就不叫仙侠了。',
  '## "Plot Design" Domain Knowledge — Classical Xianxia\n\n...',
  @method_id, 1, 30, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 7. 实体命名技能 (-entity-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-classical-entity-naming',
  '古韵空灵诗词命名：大量化用诗经《楚辞》或唐诗名句的名剑绝招与清冷绝艳法号录',
  '"Entity Naming": professional naming guidance for Classical Xianxia',
  '## 实体命名 — 古典仙侠\n\n抛弃所有的土味和网游数据风。名字要像首古诗词。\n\n---\n\n## 一、法剑与惊天诗意招式\n\n- 名剑：【天琊】、【斩龙】、【相思】、【望舒】、【羲和】。\n- 招式决：【神剑御雷真诀】、【万剑一式·斩鬼神】、【长河落日圆（大日剑法极尽）】。【大音希声、大象无形（音波道法）】。\n\n## 二、风骨出尘的女配与宗师尊号\n\n角色：【清风明月·冷如霜】、【九幽圣女·幽姬】、【万剑道人】。\n宗门名气极大的地点：【云海望月亭】、【镇魔古井】、【小竹峰】。',
  '## Entity Naming — Classical Xianxia\n\n...',
  @method_id, 1, 36, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 8. 叙事写作技能 (-narrative)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-classical-narrative',
  '飘逸孤高意境流文风：运用水墨风和大量景物衬托情绪及“大音希声”的留白意境打斗',
  'Narrative writing guidance for Classical Xianxia',
  '## 仙音剑骨正文写作指引 — 古典仙侠流\n\n不重物理对爆，注重神意和惨烈的感情爆发。\n\n---\n\n### 一、战斗意境描写的古典美\n绝不写一拳砸出百米深坑。\n*Example描写：满天风雪之中，他一身白衣纤尘不染。他没有去看漫天扑来的血色骷髅，只是抬起修长的食指，轻轻按在了剑柄之上。“锵——”的一声清响。这声音极轻，却压过了满山的风雪呼啸。下一刻，方圆百里的雪花悬停在了半空。剑未出鞘，冲在最前方的十二名大妖的胸口，忽地整整齐齐地开出了一朵冰莲花。然后，万妖皆为齑粉。*\n\n### 二、情缘碎裂的最高潮慢镜头\n*Example描写：那半空中本该诛灭天下神魔的紫色巨剑轰然落下。在那能够毁天灭地的万丈光芒中，那个熟悉的绿衣少女却依然挂着俏皮的浅笑，像是当年在幽暗地宫中喂他吃干粮时一样。她轻轻吟唱着那首痴情咒律，逆着满天神雷的剑光，向他飞来。而他只能睁着通红的双眼，眼睁睁看着那抹娇小的绿色，在紫色神威之下，灰飞烟灭。*\n极其极其注重催泪和悲剧美学。',
  '## Narrative guidance — Classical Xianxia\n\n...',
  @method_id, 1, 101, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 9. 小说命名技能 (-novel-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-classical-novel-naming',
  '古典大剧式命名：极度简短的双字单字神名或带有《剑》《神》等磅礴词汇的太古书名',
  '"Novel Naming": title generation for Classical Xianxia',
  '## 小说命名 — 古典仙侠\n\n---\n\n### 常见书名格式\n\n**格式一：霸道两字/三字真经式**\n充满了王霸之气与一代宗师的古典武侠味道。\n- 示例：《诛仙》、《神墓》、《长生界》、《剑来》、《雪中悍刀行》\n\n**格式二：强调诗意和情缘的古风对丈法**\n- 示例：《仙剑奇侠传》、《幽冥录》、《古剑奇谭》、《我有一剑可开天》\n\n### 内容简介结构\n用如同史书总决一般的口吻，念出一本极度沧桑的古旧长诗。抛却系统的爽文白话文。\n“神州浩土，广袤无边。\n正道大昌，邪魔退避。千年大派青云门屹立中原九天之上，威震群妖。\n那一年，一个手持烧火棍的平庸少年，在一场血洗的小村庄后，被带上了这高高在上的名门。\n十载苦修，一剑惊世。\n他曾誓要扫尽天下妖魔，却没想到在最黑暗的深渊底，遇到了那个一生纠葛的魔教妖女。\n当诛仙神剑那撕裂天地的紫色雷芒当头落下，斩向那个为了救他而挡在身前的绿衣少女时。\n一切正邪大义，在少年眼中皆成泡影。\n他满头黑发瞬成霜雪，仰天长笑如鬼哭。\n‘若是这天下要杀她，那我，便杀绝这天下！’\n这是一柄剑，也是一段斩不断的情仇。”',
  '## Novel Naming — Classical Xianxia\n\n...',
  @method_id, 1, 35, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);
