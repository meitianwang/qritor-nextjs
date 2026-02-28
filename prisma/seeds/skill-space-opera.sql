-- -----------------------------------------------------------------------------
-- 太空歌剧 AI 生成技能 Layer 3 SQL
-- -----------------------------------------------------------------------------

SET @method_id = 76; 

-- ============================================================================
-- 1. 设定生成技能 (-setting-gen)
-- ============================================================================

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'space-opera-story-hook-setting-gen',
  '「星海乱世钩子」设定生成：为太空歌剧生成打破平静的帝国毁灭或乱世开启',
  '"Story Hook" setting generation for Space Opera',
  '## 「星海乱世钩子」设定生成 — 太空歌剧流\n\n太空歌剧的魅力在于“小人物/没落贵族卷入大时代”。起点越是家破人亡或者荒凉，后期的史诗感就越强。\n\n---\n\n### 字段生成指南\n\n#### 身份起点与战争事变\n抛开硬科幻的数据。直接用战争或者权力倾轧讲故事。比如：\n男主是一个在废土边缘干着修飞船脏活的孤儿，有一天，一艘燃烧着帝国皇室纹章的救生舱坠落在他的拾荒点；\n或者，主角家族原本统治着银河系最富饶的矿星，但半夜被皇帝联合外星雇佣兵满门抄斩，唯独他带着能重启古老战舰的密钥逃向了星辰大海。\n\n#### 宿命任务\n这必须是一个典型的“英雄之旅”开头。护送帝国公主、送达死星的设计图以证明帝国暴政、或者是寻找预言中能拯救银河的失落圣物（如封印着灵能的宝石）。',
  '## "Story Hook" Setting Generation — Space Opera\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'space-opera-world-setting-gen',
  '「银河图景与社会法则」设定生成：为浪漫星际生成跨星系版图与资源垄断',
  '"Worldview" setting generation for Space Opera',
  '## 「银河图景设定」设定生成 — 太空歌剧流\n\n太空歌剧不在乎引擎到底符不符合物理学定律。重要的是构建出“几千光年外就像邻村一样会为了香料打架”的奇异政治版图。\n\n---\n\n### 字段生成指南\n\n#### 社会形态与核心冲突\n这是星空下的权力游戏。把古代的公爵、侯爵、皇帝搬到太空中。有靠垄断星际黄金航道的商业联盟，有崇尚武力肉搏的尚武星球。冲突资源极其具象化而非抽象：如只能在某颗沙漠星开采的“延寿香料”或用来做曲率引擎燃料的“稀有气矿”。哪怕科技再发达，政治依然极度封建且残酷。\n\n#### 原初神话/异能\n允许带有极强浪漫主义的唯心力量，比如“原力”、“灵能者觉醒”、“通过血脉传承的预言能力”。这是太空歌剧区别于硬科幻最浪漫的地方。',
  '## "Worldview" Setting Generation — Space Opera\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'space-opera-style-setting-gen',
  '「文风设定」生成：指导生成带有复古骑士精神与星际航海大时代浪漫的史诗文体',
  '"Writing Style" setting generation for Space Opera',
  '## 「文风设定」生成 — 太空歌剧流\n\n---\n\n### 字段生成指南\n\n#### 语言风格\n强推“充满旧时代火药味的航海史诗风”。不要满篇干巴巴的计算机代码和数据。要用“巨舰的侧舷火炮像龙的吐息一样撕裂了敌方旗舰，那些华丽的钛合金碎片如同流星雨坠入大气层”。\n\n#### 浪漫骑士精神\n战斗到最后，往往不是按下核弹按钮同归于尽，而是两艘旗舰接舷撞击，主角和反派拔出光剑或者离子刃，在燃烧的反应堆旁进行古典的决斗。这种极高科技与极低肉搏结合的复古感是太空歌剧的核心。',
  '## "Writing Style" Setting Generation — Space Opera\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);


-- ============================================================================
-- 2. 角色生成技能 (-character-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'space-opera-character-gen',
  '「传奇船员与星际权贵」生成：构建草台班子英雄小队与霸道帝国元帅',
  '"Character" generation for Space Opera',
  '## 「人物档案群像」生成 — 太空歌剧流\n\n太空歌剧的群像极具张力：高贵的与肮脏的在同一艘船上。\n\n---\n\n### 字段生成指南\n\n#### 阵营与核心流派\n主角团应当是一个经典RPG队伍：一个满嘴脏话但关键时刻绝不掉链子的走私飞船驾驶员（大叔）、一个掌握古老原力/灵能但什么都不懂的落跑公主（或是身怀命运的主角）、一个浑身长毛吼声如雷的外星忠诚大副、以及一个总是计算存活率很低但依然冲锋的AI铁皮机器人。\n\n#### 反派的压迫感\n生成比如：戴着黑色呼吸面罩的帝国总督、半机械改造只剩下大脑的克隆人司令。他们不仅统治星球，个人战力或残忍度也爆表。哪怕自己的一艘母舰炸了眼都不眨一下。',
  '## "Character" Generation — Space Opera\n\n...',
  @method_id, 1, 21, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 3. 场景生成技能 (-scene-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'space-opera-scene-gen',
  '「异星风貌要塞」生成：为满是赏金猎人的太空港与沙虫翻滚的异星生成极其瑰丽的视觉设定',
  '"Scene" generation for Space Opera',
  '## 「星际场景与奇观要塞」生成 — 太空歌剧流\n\n这是展现想象力最放肆的地方，星球不再是枯燥的陨石坑。\n\n---\n\n### 字段生成指南\n\n#### 极端的专制风貌\n如“塔图因”这种全是沙子和黑帮的落后星球；或是“科洛桑”这种整个星球就是一个超大都市，下水道里住着几十亿没有见过太阳的贫民；或是漂浮在气态巨行星大气风暴层中的悬空云城庄园，那里的人喝着香槟看着外推的风暴。\n\n#### 风土人情与危险物\n在这里可以点杯带荧光的蓝色烈酒，酒保是一只长着八十只触手的软体怪。黑市里可以买到帝国的最新雷达，也可以买到一个外星奴隶。',
  '## "Scene" Generation — Space Opera\n\n...',
  @method_id, 1, 22, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 4. 道具生成技能 (-prop-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'space-opera-prop-gen',
  '「传奇飞船与兵装」生成：生成一艘拥有灵魂的走私破船或贵族代代相传的能量武器',
  '"Prop" generation for Space Opera',
  '## 「载具与兵装设定」生成 — 太空歌剧流\n\n飞船在太空歌剧里等同于西部牛仔的马或者武侠小说里的绝世好剑。\n\n---\n\n### 字段生成指南\n\n#### 黑科技与魔改\n给主角团的必然不是帝国最新型的流水线战列舰，而是“千年隼号”——看起来像是块破抹布，随时都在抛锚，甚至需要主角上去踹一脚引擎才能启动，但是它拥有能在帝国巡洋舰包围圈里极限漂移的疯狂魔改引擎。\n\n#### 代代相传的神器\n武器往往带有强烈的神圣感。比如不使用热兵器，而是使用需要超高精神力共鸣才能挥舞的等离子光剑、或是用某头吞噬星空的巨兽骨骼打造的先知法杖。将魔法和科幻彻底缝合。',
  '## "Prop" Generation — Space Opera\n\n...',
  @method_id, 1, 23, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 5. 组织生成技能 (-org-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'space-opera-org-gen',
  '「帝国与星图诸侯」生成：生成暴政银河帝国、反抗军联盟与神秘的星际修道院',
  '"Organization" generation for Space Opera',
  '## 「星际政治势力」生成 — 太空歌剧流\n\n---\n\n### 字段生成指南\n\n#### 权力结构与内部危机\n这种流派的政治往往极其古典。\n比如：掌握终极毁灭武器“死星”的银河正规军；为了推翻帝制的长须反抗军元老院；只做生意两头卖军火连帝国都不敢惹的跨星系佣兵商会。\n给帝国安排巨大的特权风气：贵族骄奢淫逸，底层的克隆人士兵只是炮灰。这就是主角能利用这些势力缝隙游走拉扯的空间。',
  '## "Organization" Generation — Space Opera\n\n...',
  @method_id, 1, 25, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 6. 情节设计技能 (-plot-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'space-opera-plot-gen',
  '「情节推演」领域知识：为天命之子在星河逃亡并串联反抗军推翻极权提供大纲编排',
  '"Plot Design" domain knowledge for Space Opera',
  '## 「情节推演」领域知识 — 太空歌剧流\n\n这是披着科幻外衣的王道热血冒险，大纲走的是“组团推塔”的路线。\n\n---\n\n### 典型故事推演结构\n1. **故土蒙难与信物觉醒**：主角安静的生活被帝国突袭粉碎（或者是从某个死鬼身上拿到了秘密星图）。被迫驾驶一首破船逃入深空。\n2. **太空港集结与黑市拉扯**：在三不管地带（如赏金猎人酒馆星）与黑帮火拼，同时招募到了飞行员、打手和神秘的导师，拼凑出主角团。\n3. **被追击的星云大逃杀**：跨越多个极具特色的星球。途中可能卷入了当地土著种族反抗掠夺者的支线任务，依靠主角团的义气打赢小规模星战，让飞船在最后一秒超空间跃迁逃过追捕。\n4. **史诗大会战与古典决斗**：最后，主角团不再逃跑了，联合所有帮助过的外星势力组成反叛军舰队冲击敌人的死星长城。而在舰炮轰鸣的背景下，主角孤身潜入敌方母舰，拔出光剑与敌方总督进行终极宿命单挑！\n\n### 常见错误\n- ❌ 中途主角突然回去搞几百年的基础物理科研。太空歌剧绝对不要去解释黑洞怎么工作的，直接开着飞船飞越黑洞就行了！只讲激情与羁绊。',
  '## "Plot Design" Domain Knowledge — Space Opera\n\n...',
  @method_id, 1, 30, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 7. 实体命名技能 (-entity-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'space-opera-entity-naming',
  '实体命名：为具有复古帝国感、雄伟头衔和外星异域风情的势力角色命名',
  '"Entity Naming": professional naming guidance for Space Opera',
  '## 实体命名 — 太空歌剧流\n\n把中世纪封建贵族的宏大繁复，和未来科技的锋利生冷强行组合在一起。\n\n---\n\n## 一、头衔与人名\n\n不叫“张工”、“李总”，而要叫：\n- 【厄拉科斯公爵】、【帝国第三舰队大统领】、【西斯尊主】、【帕尔帕廷皇帝】。必须带有一股贵气或者嚣张气焰。\n\n## 二、飞船与建筑命名\n\n放弃干瘪的实验室数字，采用极具西方奇幻或神话色彩的名词。\n- 飞船：【复仇之魂号歼星舰】、【无畏级战列舰】、【千年隼走私船】。让船本身就像一头野兽的名字。\n- 武器与能力：【原力波动】、【等离子相位光刃】、【死星宏炮】。越宏伟炫酷越好。',
  '## Entity Naming — Space Opera\n\n...',
  @method_id, 1, 36, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 8. 叙事写作技能 (-narrative)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'space-opera-narrative',
  '太空歌剧正文写作指引：如何用浪漫与戏剧性的笔触描写光剑单挑与大舰队决战',
  'Narrative writing guidance for Space Opera',
  '## 浪漫星战正文写作指引 — 太空歌剧流\n\n太空中没有空气不传声？放屁。在太空歌剧里，不仅要有爆炸声，还得给我配上宏伟的交响乐做背景音！\n\n---\n\n### 一、核心描写手段：巨舰大炮与古典对决的结合\n\n太空歌剧的战斗必须呈现出两极分化。\n极大的：*“数千艘帝国战舰如银色的鱼群般跃出超空间，主炮齐射的红光瞬间将那颗商业星烧成了玻璃球。”*\n极小的：*“在剧烈摇晃、火花四溅的引擎室中，他挥舞着嗡嗡作响的等离子剑，切断了那名生化改造人的半个金属头颅，鲜血和机油混在了一起。”*\n\n### 二、环境与异星质感\n每跨越一个星球都要转换调色板。写太空港的鱼龙混杂（到处都是不同口音的外星语和二手飞船的引擎轰鸣），写原始丛林星（参天巨树下隐藏的古老神庙）。注重气味、色彩等极其感性的文学描写。',
  '## Narrative guidance — Space Opera\n\n...',
  @method_id, 1, 101, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 9. 小说命名技能 (-novel-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'space-opera-novel-naming',
  '小说命名：为带有个体英雄主义与帝国战火跨星系复仇的冒险传说起一个荡气回肠的名字',
  '"Novel Naming": title generation for Space Opera',
  '## 小说命名 — 太空歌剧流\n\n---\n\n### 常见书名格式\n\n**格式一：星河战争/史诗名词式**\n- 结构：[星际名词] + 战争/宿命词汇 \n- 示例：《星球大战》、《沙丘魔堡》、《银河帝国衰亡史》、《星际迷航》\n\n**格式二：传奇载具/主角特称式**\n- 结构：特殊头衔的载具或主角身份\n- 示例：《最后的光剑绝地》、《飞跃半人马座号》、《星际孤儿与拾荒舰队》\n\n### 内容简介结构\n用充满中世纪吟游诗人的宏大开场白介绍主角团的草根对抗。\n“银河帝国统治的第104年，旧共和的荣光已被全息霓虹和等离子火炮碾成了尘埃。\n身为废土星的一个修车黑工，我只想攒够钱换个金属肺。\n直到那个满身是血的王室护卫，把那把代表着整个星域最高权限的密钥光剑塞进我手里……\n现在，整个帝国第八混合舰队都在追捕我。而我这艘修了一半的破走私船，连超光速引擎都还得靠脚踹才能启动。”',
  '## Novel Naming — Space Opera\n\n...',
  @method_id, 1, 35, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);
