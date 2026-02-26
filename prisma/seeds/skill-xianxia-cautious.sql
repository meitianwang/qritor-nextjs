-- -----------------------------------------------------------------------------
-- 稳健/迪化流 (Cautious / Misunderstanding) AI 生成技能 Layer 3 SQL
-- -----------------------------------------------------------------------------

SET @method_id = 83; 

-- ============================================================================
-- 1. 设定生成技能 (-setting-gen)
-- ============================================================================

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-cautious-story-hook-setting-gen',
  '「被迫害妄想钩子」生成：生成明明是满级大佬/手握绝世底牌却认为修仙界处处致命的惊恐主角与被迫出手的滑稽开局',
  '"Story Hook" setting generation for Cautious / Misunderstanding',
  '## 「被迫害妄想症钩子」设定生成 — 稳健迪化流\n\n这是一种极其受欢迎的反套路喜剧。爽点在于“扮猪吃老虎”极致之后的“猪被当成了创世神”。\n\n---\n\n### 字段生成指南\n\n#### 逆天底牌与病态的怂\n给主角一个夸张的底牌，比如：穿越过来带了一个“一拳秒杀修仙系统”，但他看了修真小说觉得就算秒杀了当前的大反派，人家上面老祖宗降临自己肯定要死，所以决定一直在新手村捏着底牌不出门。他的目标是没有99%的把握等于送死。\n\n#### 不得不暴露冰山一角的开局\n剧情必须逼着他动用了一点点实力（如为了打落一只可能带毒的蝙蝠，动用了九阶阵法），导致在场的一个配角产生了剧烈的脑补，拉开了将主角推上神坛的序幕。',
  '## "Story Hook" Setting Generation — Cautious / Misunderstanding\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-cautious-world-setting-gen',
  '「全员极具想象力的世界」设定：生成一个在主角眼里危机四伏，在配角眼里主角在下大棋的错位修仙界法则',
  '"Worldview" setting generation for Cautious / Misunderstanding',
  '## 「迪化逻辑与黑暗森林法则」设定生成 — 稳健迪化流\n\n---\n\n### 字段生成指南\n\n#### 迪化阅读理解法则\n设定这个世界的反派其实是很聪明的，但就是因为太聪明了，聪明反被聪明误。比如反派看到主角站在原地发抖，会立刻分析：“此人呼吸暗合周天星斗大阵，看似破绽百出，实则是在引诱我出手！好高明的陷阱！”\n\n#### 稳健因果论\n在主角的世界观里，没有小仇，所有仇恨都要从源头上掐灭。“骨灰一定要扬了，魂魄一定要用三昧真火烧满三天三夜以防夺舍复生”。这种对微小事物的毁灭性打击是搞笑核心。',
  '## "Worldview" Setting Generation — Cautious / Misunderstanding\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-cautious-style-setting-gen',
  '「错位喜剧文风」生成：指导生成上帝视角下内心极其慌乱外表强行装逼的反差蒙太奇描写',
  '"Writing Style" setting generation for Cautious / Misunderstanding',
  '## 「错位双视角文风档案」设定生成 — 稳健迪化流\n\n---\n\n### 字段生成指南\n\n#### 上帝视角的绝不接轨\n文笔要采用“蒙太奇”式双线切换：\n主角POV：*此时他吓得冷汗浸透了后背的十件极品内甲，手心捏着七张神行千里的穿梭符紧紧发抖。*\n配角POV：*这位绝顶大能背过身去，双手隐没在袖袍中，肩膀微微颤动。原来，他早已将一切算中，在为天下苍生悲哀吗？*\n要求永远保持这种“驴唇不对马嘴”的高差跨度，主角越怂，反派吓得越惨。',
  '## "Writing Style" Setting Generation — Cautious / Misunderstanding\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);


-- ============================================================================
-- 2. 角色生成技能 (-character-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-cautious-character-gen',
  '「狂热脑补群像」生成：设计那些给主角疯狂增加逼格的死忠师妹与被害妄想晚期的反派老祖',
  '"Character" generation for Cautious / Misunderstanding',
  '## 「迪化配角群盲」生成 — 稳健迪化流\n\n---\n\n### 字段生成指南\n\n#### 迪化制造机\n主角一个人是无法完成喜剧的，必须有一群帮他脑补造神的“狂热吹鼓手”。\n比如：一个被主角随手捡来挑粪的妖王，坚信主角的粪便里蕴含着无上大道，每天拼命吃，然后突破了境界，逢人便说自己是道祖座下的护山神兽。\n比如：魔尊只看到了主角的一个背影，就吓得宣布闭关两百年绝对不出世。\n\n#### 配角自圆其说的逻辑闭环\n无论主角多拉胯，配角都要能从他的拉胯中解读出深意。“高人的每一次咳嗽，都是在震碎虚空的因果链！”这些逻辑要越离谱越好笑。',
  '## "Character" Generation — Cautious / Misunderstanding\n\n...',
  @method_id, 1, 21, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 3. 场景生成技能 (-scene-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-cautious-scene-gen',
  '「丧病大本营」生成：生成被改成能抵挡核弹和圣人的堡垒却被外界奉为圣地的奇葩山头',
  '"Scene" generation for Cautious / Misunderstanding',
  '## 「丧病防御要塞」生成 — 稳健迪化流\n\n---\n\n### 字段生成指南\n\n#### 火力不足恐惧症的具象化\n主角的道场就是他被害妄想症的终极体现。他不修行，天天在家挖防空洞、布置陷阱。比如：他在自己的床板底下布下了三万斤炸药属性的雷篆符，而且只要他心跳一停，三十里内的山门全都要跟着陪葬引爆。\n\n#### 外界崇拜的名门圣地\n但这个丧心病狂的山头，在掌门和其他弟子看来，这是“祖师转世在锤炼道基”，他们不仅不拆，甚至还将其视为派内最高等的天禁之地。',
  '## "Scene" Generation — Cautious / Misunderstanding\n\n...',
  @method_id, 1, 22, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 4. 道具生成技能 (-prop-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-cautious-prop-gen',
  '「过度火力与替死纸人」生成：主角为了防蚊子搓出来的九阶阵盘或永远只派出去办事的泥土分身',
  '"Prop" generation for Cautious / Misunderstanding',
  '## 「小题大做纸马甲」生成 — 稳健迪化流\n\n---\n\n### 字段生成指南\n\n#### 绝不本体出门的道具\n稳健流主角的本体是在大结局之前绝对不出自己山头一步的（除非是被绑架）。他的主要道具是【替死马甲】，比如他用泥巴捏出来的分身化身成白发道长出去游历，就算分身被打死，本体也只是一笑置之“还好我稳健”。\n\n#### 杀鸡用牛刀\n专门描写那种为了“掩盖小事”而动用大杀器的道具搭配。用毁天灭地的神器去干最见不得光的埋尸体、扬骨灰的杂活。',
  '## "Prop" Generation — Cautious / Misunderstanding\n\n...',
  @method_id, 1, 23, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 5. 组织生成技能 (-org-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-cautious-org-gen',
  '「强装镇定的掌门」生成：天天被主角的无心之举吓得召开紧急大会的门派大佬与主动求和的邪教',
  '"Organization" generation for Cautious / Misunderstanding',
  '## 「被惊掉下巴的高层机构」生成 — 稳健迪化流\n\n---\n\n### 字段生成指南\n\n#### 被推上高坛的门派\n主角极力想掩饰自己，但他的行为却让他的宗门莫名其妙地从小地方的九流门派一跃成为正道之光。\n比如宗主：本来是个很没自信的金丹老头，结果因为主角随手一指让他破了元婴。然后他就只能每天硬撑着极强的高手包袱出去装逼收徒应酬，其实内心每天都在祈祷主角别再吓他了。\n那群魔道至尊更是连夜召开大会讨论主角的微表情，并且全票高呼“此子不可留，但我等打不过所以还是赶紧封山百年吧”。',
  '## "Organization" Generation — Cautious / Misunderstanding\n\n...',
  @method_id, 1, 25, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 6. 情节推演技能 (-plot-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-cautious-plot-gen',
  '「情节推演」大纲领域：为由于太苟天天只想隐居却被狂热配角越推越高的搞笑封神之路制定大纲',
  '"Plot Design" domain knowledge for Cautious / Misunderstanding',
  '## 「反转脑补大纲推演」领域知识 — 稳健迪化流\n\n主线剧情就是：主角只想退休摸鱼，但配角疯狂帮他拉仇恨出风头，主角被迫含泪秒杀全场。\n\n---\n\n### 典型故事推演结构\n1. **自闭出山与装逼如风**：主角在山上苟了一百年，师傅求他下山。他为了稳健准备了三十个马甲出门。结果因为怕死，遇到个拦路抢劫的小山贼直接掏出禁咒轰平了整个山头。刚好被路过的大门派圣女看到，惊为天人，死皮赖脸要拜师。\n2. **猪队友拉仇恨与被迫摊牌**：圣女徒弟/师弟出去历练，打不过别人就报主角的名字——“家师天下无敌！”引来各种反派老祖上门挑战。\n3. **脑回路惊奇的反派团灭**：反派大能上门，看到主角布置在门口防野狗的阵法，大受震惊，自己和空气斗智斗勇重伤吐血，然后脑补出主角是上古仙人转世，主动跪下磕头交出全部法宝求放过。\n4. **被捧上神坛的修罗场末路**：主角最后被正邪两道几百个宗师尊封为“至高道祖”。他站在祭台上发表讲话，全书必须在此刻达到最高潮：“可是，我明明真的只有练气期啊！我拿的真的是把生锈的铁剑啊！你们为什么要抖啊！”\n\n### 常见错误\n- ❌ 中途主角突然大彻大悟不苟了，变成了传统热血文。迪化流只要主角一嚣张不苟，喜剧内核立马崩碎。',
  '## "Plot Design" Domain Knowledge — Cautious / Misunderstanding\n\n...',
  @method_id, 1, 30, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 7. 实体命名技能 (-entity-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-cautious-entity-naming',
  '降维打击的变态命名：专门为了对付一只蚂蚁起的诸天万界无尽大坑阵等离谱名号',
  '"Entity Naming": professional naming guidance for Cautious / Misunderstanding',
  '## 实体命名 — 稳健迪化流\n\n极致的堆叠词语与极其细微的用途结合。\n\n---\n\n## 一、法宝与防御手段\n\n必须体现主角“丧心病狂的防护等级”：\n- 阵法：【九天玄晶极化玄武反伤三叠连环三十六杀心大阵】（其实只是布置在狗洞里的防御圈）。\n- 道具：【三昧真火升级版之骨灰必扬管形瓶】、【百分百完美模拟练气三层气息的超阶敛息服】。\n\n## 二、狂想化配角尊号\n\n配角的反派称号越炸裂，越能衬托被主角吓退的滑稽。\n【九天十地唯我独尊血魔圣君】、【万古长青不灭青天剑尊】。这些极度中二的尊号往往都是被主角一发平A（甚至是被主角的一个喷嚏）震死的背景板。',
  '## Entity Naming — Cautious / Misunderstanding\n\n...',
  @method_id, 1, 36, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 8. 叙事写作技能 (-narrative)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-cautious-narrative',
  '神鬼莫测的反差文风：手心出汗与高深莫测并存的双线交叉心理描写法',
  'Narrative writing guidance for Cautious / Misunderstanding',
  '## 蒙太奇错位心理戏描写指引 — 稳健迪化流\n\n永远在一件事情发生后进行两段“误解性阅读分析”。\n\n---\n\n### 经典错位句式结构示例\n这是写作的绝高爽点。每次冲突都要用以下三段式：\n\n*步骤一（客观描写）：主角因为昨天晚上吃坏了肚子，脸色煞白，紧闭双眼不说话。*\n\n*步骤二（反派脑补极度放大危机）：魔尊见此情形，瞳孔猛缩，心跳如鼓。那煞白的脸色分明是献祭了万年寿元在接引三十三天外的天罚！他紧闭双眼，必是在凝聚能够看透岁月长河的无情法眼！若等他睁眼，我必神魂俱灭！*\n\n*步骤三（主角内心的哭诉反差）：主角内心OS：“卧槽怎么这么疼！能不能快点打完我要找个茅房啊！等下要是放个屁出声了我这高人的人设就全毁了啊！”*\n必须通过反复的误会加深和反向解读来让读者大笑。',
  '## Narrative guidance — Cautious / Misunderstanding\n\n...',
  @method_id, 1, 101, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 9. 小说命名技能 (-novel-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-cautious-novel-naming',
  '稳健与脑补式起名：极度强调“其实我很菜”、“太稳健了”这种带有强烈情绪宣告的流行全句起名法',
  '"Novel Naming": title generation for Cautious / Misunderstanding',
  '## 小说命名 — 稳健迪化流\n\n---\n\n### 常见书名格式\n\n**格式一：主被动反差宣告式（长书名）**\n这是目前这种流派最标准的起名法！极度拉满“委屈感”或者“老六感”。\n- 示例：《我师兄实在太稳健了》、《原来我是绝世高人》、《我真的是练气期啊！》、《明明很强却过分慎重》\n\n**格式二：周围人迪化吐槽式描述**\n- 结构：[我的普通行为] + [被解读成了反常大事]\n- 示例：《开局随便画了个圈，魔尊吓得破防了》、《我都无敌了，你们还在脑补什么？》、《全门派都以为我是万古剑仙》\n\n### 内容简介结构\n采用主角欲哭无泪的第一人称陈述，配上配角的狂热附和，形成对比。\n“叶修穿越到玄幻世界，没有系统，资质拉胯。他认定这是一个出门就被老怪秒杀的高危世界，于是决定苟在山上不天下无敌绝不出关！\n他随便养了一条杂草般的小黑狗，每天喂点剩饭；他闲来无事雕刻的一把木剑，扔在后院。\n几百年后，天地大劫降临。\n魔王率领亿万大军打上山门，所有人都绝望了。\n然而……那条小黑狗一口吞下了太古魔龙，那把木剑自行飞出，一剑斩断了万界苍穹。\n面对顶礼膜拜、高喊‘道祖慈悲’的诸天万界大佬们。\n叶修看着自己疯狂发抖的腿，欲哭无泪：\n‘其实我真的只是个连辟谷都不会的废物凡人啊，你们到底在脑补什么啊！！’”',
  '## Novel Naming — Cautious / Misunderstanding\n\n...',
  @method_id, 1, 35, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);
