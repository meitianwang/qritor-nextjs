-- -----------------------------------------------------------------------------
-- 长生苟道流 (Immortality / Gou Style) AI 生成技能 Layer 3 SQL
-- -----------------------------------------------------------------------------

SET @method_id = 85; 

-- ============================================================================
-- 1. 设定生成技能 (-setting-gen)
-- ============================================================================

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-gou-story-hook-setting-gen',
  '「长生不老废材钩子」生成：一个拥有无限寿命但资质奇差的主角决定苟在凡人村庄看沧海桑田的开局',
  '"Story Hook" setting generation for Immortality / Gou Style',
  '## 「无尽寿元开局钩子」设定生成 — 长生苟道流\n\n核心爽点在于打破传统玄幻的“吃补药、去拼命”。既然已经不死了，为什么还要去和那些活不过三百年的魔尊拼命？\n\n---\n\n### 字段生成指南\n\n#### 最垃圾的基础盘与长生挂\n给主角安排最底层的灵根，比如【无灵根的纯凡人】。并绑定一个长生系统：“恭喜宿主寿命无限，但每突破一个大境界均需闭关三百年。”\n\n#### 第一回熬死敌人的顿悟\n这是主角确认自身战术的关键。主角在练气三层时被练气九层的恶霸欺负，主角自知打不过，直接躲进深山老林吃野果苦修了八十年。出来后发现恶霸早就老死病床，连孙子都秃顶了，主角大笑后在坟头蹦迪，从此领悟“时间就是最强斩魄刀”。',
  '## "Story Hook" Setting Generation — Immortality / Gou Style\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-gou-world-setting-gen',
  '「天妒英才的必死定律」设定：生成一个所有天才卷王最终都会以极其惨烈方式陨落的修仙法则',
  '"Worldview" setting generation for Immortality / Gou Style',
  '## 「天谴卷王与时空变迁法则」设定生成 — 长生苟道流\n\n---\n\n### 字段生成指南\n\n#### 天才必遭天谴的法则\n设定这个世界对想要强行逆天破关的天骄极度不友好。越早大放异彩的先天道胎，往往在元婴雷劫时越被天道劈得神魂俱灭；而像主角这样几百年才突破一阶的混子，天劫却微弱如春雨。彻底把“卷王早死，躺平长生”的世界观立住。\n\n#### 时代的快速更替\n不要把镜头局限在一场几小时的争斗。以百年微距来写世界大纲：“一百年间，正道第一强宗由于内乱分崩离析；三百年前不可一世的妖族大帝，在极北之渊坐化。而此时，主角终于学会了初级火球术。”',
  '## "Worldview" Setting Generation — Immortality / Gou Style\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-gou-style-setting-gen',
  '「沧凉与岁月流转」的荒诞种田文风生成：以极长跨度淡化生死离别的旁观者视角',
  '"Writing Style" setting generation for Immortality / Gou Style',
  '## 「时空抽帧的旁观者倒叙文风」设定生成 — 长生苟道流\n\n---\n\n### 字段生成指南\n\n#### 抽离悲欢的时空浓缩\n要求AI大量使用描述岁月流逝的句式。\n*Example:* “她曾是十里八乡最明媚的少女，哭着求我带她登仙。但我没有。八十五年后，我撑伞走过那座石桥，桥边多了一座长满青苔的新坟。我倒了半壶浊酒，转身离去，岁月不留痕，修仙不留尘。”\n不渲染过多的眼泪，只突出时光如轮、万物皆空、唯我独存的荒诞孤独感。',
  '## "Writing Style" Setting Generation — Immortality / Gou Style\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);


-- ============================================================================
-- 2. 角色生成技能 (-character-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-gou-character-gen',
  '「生老病死群像见证」生成：设定必定以死谢幕的绝世大帝和主角漫长寿命中遇到的重名转世之人',
  '"Character" generation for Immortality / Gou Style',
  '## 「岁月长河彼岸的过客档案」生成 — 长生苟道流\n\n---\n\n### 字段生成指南\n\n#### 昙花一现的时代巨擘\n他们在这个小说的特定一卷里是主角，然后迅速落幕。\n比如：一代剑神【独孤愁】，曾一人一剑杀平魔宫，名满天下，甚至对躲在人群中鼓掌的主角有过指点之恩。但他最终却因为心魔入体自刎于剑山。主角默默过去把他的骨灰收了，把这把名剑拿去铺地板。主角就是这个时代最终的收尸人。\n\n#### 宿命感极强的转世者\n主角活得太久，他前一万年的初恋死了。在第四万年时，门派里新来的某个眉心带着朱红胎记的外门小丫鬟，喊了一声只有当年初恋才知道的绰号。让这种跨越时光的长线羁绊产生暴击。',
  '## "Character" Generation — Immortality / Gou Style\n\n...',
  @method_id, 1, 21, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 3. 场景生成技能 (-scene-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-gou-scene-gen',
  '「沧海桑田的避难所」生成：设计一个因为极度缺乏灵力连强盗都不屑光顾而安稳万载的凡人小国巷弄',
  '"Scene" generation for Immortality / Gou Style',
  '## 「时光不老的定锚驿站」生成 — 长生苟道流\n\n---\n\n### 字段生成指南\n\n#### 被大人物无视的避风港\n要求给主角安排一个绝对平滑、低魔甚至无魔的大本营。\n比如：太安城的长柳巷老李药铺。这里没有灵气，大乘期老怪来这里也会被废去修为，所以这里成了最绝缘的安全区。\n\n#### 物理形态的千年异变\n要有极强的地貌更迭对照：“一千年前，这后院只是一口枯井。现在周围的山脉隆死导致这口井成了一座连通地下暗河的深渊，里面甚至养出了两条瞎眼蛟龙在吃主角剩下的骨折菜叶。”',
  '## "Scene" Generation — Immortality / Gou Style\n\n...',
  @method_id, 1, 22, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 4. 道具生成技能 (-prop-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-gou-prop-gen',
  '「熬出来的破烂至宝」生成：用五万年时间包浆盘出来的凡人铁棍与只有长命者才能配齐的绝世药方',
  '"Prop" generation for Immortality / Gou Style',
  '## 「岁月包浆的老旧至宝」生成 — 长生苟道流\n\n没有出门捡到诛仙剑，只有用时间累积属性的凡铁。\n\n---\n\n### 字段生成指南\n\n#### 用命熬出来的离谱属性\n如果是别人得到一把柴刀，它就只能劈柴。主角拿到柴刀，把它埋在死去的元婴老怪的尸体下面滋养。足足在地下温养了七万年，这把普通柴刀沾染了岁月气息和极阴之力，出土时变成了【破天斩魔刃】，一刀劈出黑洞。\n\n#### 需要亿年成型的绝迹丹药\n那种需要一斤千年人参、一斤万年雪莲、再加上龙脉精血才能熬一锅的废弃药方。别人穷极一生凑不齐半样，主角花了十二万年跑遍了沧海桑田全部凑齐，而且当饭吃。',
  '## "Prop" Generation — Immortality / Gou Style\n\n...',
  @method_id, 1, 23, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 5. 组织生成技能 (-org-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-gou-org-gen',
  '「不断更替的名字」生成：见证鼎盛皇朝崩塌、在不同朝代的更迭中当狱卒或更夫的捡壳游戏',
  '"Organization" generation for Immortality / Gou Style',
  '## 「昙花一现与传承不朽的王朝」生成 — 长生苟道流\n\n---\n\n### 字段生成指南\n\n#### 流水的王朝铁打的扫地宫\n所有庞大的反派组织或者大周王朝对主角来说都像走马灯。主角的阵营设定往往极度边缘化但不可或缺。大周朝代的主角是天牢里的【九品更夫/死牢狱卒】。五百年后大周被天元教灭了，天元教接手天牢。一千年后天元教又被正道联军灭了。而换了三个东家的大牢里，在最底层扫地倒恭桶的杂役，依然是那个长生不老的满脸堆笑的主角。利用这种职务看尽王朝更迭中的大佬被投入天牢的百态，并在白嫖他们死后的无敌功法。',
  '## "Organization" Generation — Immortality / Gou Style\n\n...',
  @method_id, 1, 25, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 6. 情节推演技能 (-plot-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-gou-plot-gen',
  '「熬死天骄流情节推演」大纲领域：为在深山闭关千年出世帮老友后代复国并顺便一拳打死魔尊的装逼路线指路',
  '"Plot Design" domain knowledge for Immortality / Gou Style',
  '## 「岁月收尸人大纲推演」领域知识 — 长生苟道流\n\n这不是升级打怪大纲。这是通过百年为单位的闭关，把敌人老死，然后再去刨坟挖功法的大纲。\n\n---\n\n### 典型故事推演结构\n1. **寿元开启与初见无常**：主角开局长生，找了个收尸人/天牢狱卒的工作。结交了一个天才朋友或者得罪了一个天骄大少。主角选择不动声色，看着天才朋友在外打杀立下赫赫威名最后重伤而死；同时熬死了那个想杀他的大少。\n2. **避世千载与沧海桑田**：天下大乱，大能满天飞。主角连夜搬家躲入深山种田。中间通过系统提示：外界谁谁又获得了传承，外界某某宗又被屠了。他在深山里安稳度过一千年，把普通龟息功修炼到了第一万层大满圆。\n3. **旧人遗骸与降维复仇/报恩**：一千年后，主角下山买包子。发现天下已经完全变样。当年的小反派老死了，但反派的曾孙子因为家族落魄惹到了曾经帮助过主角的老友后人头上。主角这个时候以完全不输于当今天下第一的变态浑厚灵力出手，一剑劈碎整个镇子替故人出头。\n4. **活成史书与神话丰碑**：万年以后，原本的修仙界已经降级或者毁灭。而主角活生生把自己熬成了这个位面唯一的远古神话活化石。当年他随手养的鲤鱼变成了九天龙神。他成了所有人都在膜拜寻找的上古天道本源。\n\n### 常见错误\n- ❌ 中途让主角因为某个冲动跑出去越级抢救朋友，被人打得半死重伤。千万不能热血！长生苟道的逻辑是：我可以帮朋友报仇，但我一定是在仇人死了一百年后去挖仇人的骨灰盒鞭尸，或者确认我高仇人五个大境界了去一指头碾死他。',
  '## "Plot Design" Domain Knowledge — Immortality / Gou Style\n\n...',
  @method_id, 1, 30, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 7. 实体命名技能 (-entity-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-gou-entity-naming',
  '世俗沧凉命名：多用凡俗官职如仵作狱卒，并伴随着长达万年计的功法境界计量体系',
  '"Entity Naming": professional naming guidance for Immortality / Gou Style',
  '## 实体命名 — 长生苟道流\n\n世俗风尘气和万古仙尊的反差组合。\n\n---\n\n## 一、主角的卑微职业与极其漫长的功法\n\n职业称号：【天牢九品缝尸匠】、【大元朝收尸人】、【极乐宗扫地杂役】。\n功法设定要求叠层数：不搞那些花哨的，就是【长春功（第一万零九千层满级老登版）】、【王八敛息决（十万年纯净道家精华）】。把最基础的功法拉满。\n\n## 二、对比强烈的世间天骄\n\n外面的世界必须极其嚣张热血，反衬主角。\n嚣张名册：【乱古纪元截天大帝】、【脚踏星河三十九州第一上仙青莲剑神】。主角通常在心里吐槽他们“这些短命鬼，能活过四百岁算我输”。',
  '## Entity Naming — Immortality / Gou Style\n\n...',
  @method_id, 1, 36, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 8. 叙事写作技能 (-narrative)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-gou-narrative',
  '孤独者倒叙文风：如何通过一杯陈酒半生故人的写意描写，展现无穷无尽寿命的冷眼旁观感',
  'Narrative writing guidance for Immortality / Gou Style',
  '## 岁月长河旁观者正文写作指引 — 长生苟道流\n\n不重热血打怪，重“白云苍狗，岁月无声”的倒叙叹息感。\n\n---\n\n### 一、跳跃时间的镜头留白语感\n不要按天或者月推进剧情。直接放长线。\n*Example描写：他给那棵亲手种下的桃树浇了最后一次水，转身走入了洞府深处，启动了封石大阵。再睁眼时，石门已被风沙蚀断。他推开洞门，门口的桃树已经不见了，取而代之的是一条长满野草的官道。一问路过的樵夫，原来外面已经是大陈王朝第七个纪元，当年追杀他的那个无敌魔君，早在五百年前的天雷劫中就灰飞烟灭了。主角叹了口气：“可惜了，还想着出来给他上柱香。”*\n\n### 二、对于生老病死的极低共情\n主角在漫长的寿命里看惯了生死，他不能大哭大闹。\n*Example描写：床榻上的徒弟满脸沟壑，白发稀疏，枯槁的手紧紧抓着他的衣袖。而主角依然保持着六百年前收他为徒时十七八岁的容貌，岁月没有在他脸上留下一丝痕迹。主角轻轻拍开徒弟的手，淡淡说了一句：“安心走吧，你的玄孙我会照看一二的。”*',
  '## Narrative guidance — Immortality / Gou Style\n\n...',
  @method_id, 1, 101, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 9. 小说命名技能 (-novel-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-gou-novel-naming',
  '长生苟道流命名：带有“长生、苟、百年开始”字眼的日记宣称体或天牢倒插体起名',
  '"Novel Naming": title generation for Immortality / Gou Style',
  '## 小说命名 — 长生苟道流\n\n---\n\n### 常见书名格式\n\n**格式一：明确的长生宣告加地点式**\n直击受众痛点，明白这就是本无限寿命的收尸小说。\n- 结构：[长生] + [苟在某地或者从哪里开始]\n- 示例：《长生：苟在天牢当狱卒》、《长生从娶妻开始》、《修仙：我真的只想活到大结局》、《我长生不死，在红尘中成仙》\n\n**格式二：岁月流转的时间对标描述**\n强调极其变态的时间跨度和主角深不见底的实力。\n- 示例：《那年我双手插兜，熬死了三代大帝》、《闭关十万年，我的徒弟全成了道祖》、《长生百万年，下山直接无敌》\n\n### 内容简介结构\n用第一人称将“长生外挂”和外面的“尸山血海卷王危机”列举对照，突出主角的通透。\n“一觉醒来，穿越到了修仙界，李平安本打算豪情万丈，执剑荡群魔。但他发现自己除了拥有一项‘无穷无尽不会自然死亡的寿元’外，灵根奇差，连后山的野狗都打不过！\n面对为了抢一颗筑基丹打得脑浆迸裂的绝世天骄们。李平安做出了连夜买站票润倒凡俗世间的决定。\n“你们去争那飘渺的大道吧，我就在这里当个九品收尸人，给你们送终！”\n岁月轮转。\n三千年后，以肉身硬抗九天神雷的第一剑豪，坐化于李平安接活的坟场。\n五万年后，曾统御大千世界不可一世的妖族女帝，其枯骨落入了李平安扫地的后院当了肥料。\n一百万年过去了。\n沧海化作桑田，神话纪元断裂破灭。\n那一天，天地崩塌，诸天神佛惊恐奔逃。唯独那个永远挂着淡淡微笑、提着扫帚的凡俗老农（依旧是十八岁相貌），一扫帚拍碎了那不可名状的灭世黑手：“别打扰我扫地落叶，烦人哪。”\n李平安：其实我真没修炼，我只是活得比较久而已。”',
  '## Novel Naming — Immortality / Gou Style\n\n...',
  @method_id, 1, 35, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);
