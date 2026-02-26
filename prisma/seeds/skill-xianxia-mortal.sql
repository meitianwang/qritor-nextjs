-- -----------------------------------------------------------------------------
-- 凡人流 (Mortal Cultivation) AI 生成技能 Layer 3 SQL
-- -----------------------------------------------------------------------------

SET @method_id = 81; 

-- ============================================================================
-- 1. 设定生成技能 (-setting-gen)
-- ============================================================================

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-mortal-story-hook-setting-gen',
  '「凡人底层的逆世钩子」生成：生成资质极差的主角靠唯一的神秘辅助挂在宗门倾轧中苟存求首杀的危机开局',
  '"Story Hook" setting generation for Mortal Cultivation',
  '## 「底层求生钩子」设定生成 — 凡人流\n\n凡人流的开篇精髓：主角不能有大机缘，他是修仙界最底层的蚂蚁。他的第一个金手指只能辅助（不能直接秒杀），他要靠杀人灭口和极端的小心谨慎才活过了前三章。\n\n---\n\n### 字段生成指南\n\n#### 极度低微的开局\n主角的灵根应该是最废的“五灵根”、“伪灵根”，甚至是无法修炼的外围杂役。比如：在黄枫谷打杂了三年，连给炼丹炉扇火的资格都不够。\n\n#### 危机重重的引路人\n带领主角入修仙界的人，往往没安好心。比如：那个和蔼可亲的江湖郎中师傅，收他为徒每天给他喂补药，其实是为了等他长大把他练成“血祭人丹”；或者是一个重伤垂死的魔修企图夺舍他。主角必须在对方发难前几天，利用自己唯一的金手指配制毒药、布置陷阱极限反杀。',
  '## "Story Hook" Setting Generation — Mortal Cultivation\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-mortal-world-setting-gen',
  '「修仙界黑暗法则」设定生成：生成资源匮乏、境界压制与杀人夺宝常态化的残酷大环境',
  '"Worldview" setting generation for Mortal Cultivation',
  '## 「黑暗修仙法则」设定生成 — 凡人流\n\n抛弃“道骨仙风”的清高，把修仙界写成一个资源极度匮乏、所有人都疯了一样为了长生不择手段的“黑帮社会体系”。\n\n---\n\n### 字段生成指南\n\n#### 残酷的境界与寿元壁垒\n练气期只能活百岁，一旦无法筑基就会化为黄土。所以每当出现“筑基丹”时，同门之间会互相残杀，师傅会抢徒弟。\n\n#### 没有公平的黑吃黑\n不要写什么决斗场。真实的斗法是：坊市里笑嘻嘻交易完，离开安全区十里地，立刻换上夜行衣互相扔阵法毒气灭口。强者压榨弱者是天经地义的，“丛林森林法则”也就是“弱肉强食”。',
  '## "Worldview" Setting Generation — Mortal Cultivation\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-mortal-style-setting-gen',
  '「老辣市井文风」生成：指导生成算度极深、斗法老六式的动作与心理描写指南',
  '"Writing Style" setting generation for Mortal Cultivation',
  '## 「算计与写实交织的文风」生成 — 凡人流\n\n---\n\n### 字段生成指南\n\n#### 斗智斗法的冷酷感\n主角绝对不会站着和人念招式名字。凡人流的战斗是“老六精神”的极致发挥：\n“主角表面惊慌失措连连后退，示敌以弱，暗地里已经将那张花了一百灵石重金购买的【土遁破符】扣在手心，并在敌人大笑着施法的瞬间，激活了藏在地底的【毒液法阵】。”\n每一场战斗结束后，必须强调主角“搜身摸尸体”、“用火球术将尸体挫骨扬灰”、“确认没有留下神识印记后迅速遁走几百里”。',
  '## "Writing Style" Setting Generation — Mortal Cultivation\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);


-- ============================================================================
-- 2. 角色生成技能 (-character-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-mortal-character-gen',
  '「千古老狐狸群像」生成：设计那些活了几百年的狡黠老怪与随时反杀的同道修士',
  '"Character" generation for Mortal Cultivation',
  '## 「同道袅枭与老怪群像」生成 — 凡人流\n\n在凡人流中，没有一个高阶修士是靠傻白甜修炼到元婴期的。他们全是精明自私、活了几百年的人精。\n\n---\n\n### 字段生成指南\n\n#### 绝不吃亏的人物性\n比如结丹期的师叔，他收徒弟绝对不发工资，一切要徒弟自己去拿命换，甚至还要剥削徒弟；\n又或者是一个看起来豪爽要和你结拜的同辈散修，其实带你去秘境探险的时候已经偷偷在解毒丹里动了手脚。\n\n#### 老怪压迫感与谨慎\n给配角也安排顶级的谨慎。主角去阴人，结果发现对方穿了三件内甲，还捏着一枚替身符纸。凡人流的配角智商极其在线。',
  '## "Character" Generation — Mortal Cultivation\n\n...',
  @method_id, 1, 21, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 3. 场景生成技能 (-scene-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-mortal-scene-gen',
  '「血色禁区与散修坊市」生成：生成资源稀缺导致门派底层互杀的试炼场或黑心交易街',
  '"Scene" generation for Mortal Cultivation',
  '## 「血色试炼与交易坊市」生成 — 凡人流\n\n---\n\n### 字段生成指南\n\n#### 秘境的绞肉机属性\n在凡人流中，“血色禁地/试炼”是改变命运的地方，也是绞肉机。\n比如：各大门派强迫炼气期弟子进入其中，里面不仅有凶残的上古遗种妖物，更大的危险来自于其他门派组成的猎杀小队。存活率往往不足三成。主角在里面绝不主动杀怪，而是躲在一旁看着别人两败俱伤后，再出来捡漏补刀。\n\n#### 坊市里的交易陷阱\n坊市是唯一有安全感的地方，但也充满坑蒙拐骗。比如拍卖会上谁拍到了压轴的极品法器，出门就会被五个结丹老怪联手用神识锁定围杀。',
  '## "Scene" Generation — Mortal Cultivation\n\n...',
  @method_id, 1, 22, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 4. 道具生成技能 (-prop-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-mortal-prop-gen',
  '「功能性法器丹方」生成：生成威力大但有副作用的老六专属阴损法宝及必须破阵用的底牌',
  '"Prop" generation for Mortal Cultivation',
  '## 「法器灵药与保命符篆」生成 — 凡人流\n\n---\n\n### 字段生成指南\n\n#### 实用主义的装备设计\n没有一刀开天的神器。全都是抠抠搜搜算计的：\n例如：【隐身斗篷】（虽然能隐身但不能隔绝神识扫描，只能用来欺骗练气期瞎子）；【青凝镜】（只能发射迟缓对方两秒的青光）；或者是【天雷子】（一次性消耗品，能炸平一座山，主角往往捏在手里威慑比自己高一级的修士不敢轻举妄动）。\n所有装备全是消耗品或残缺版，需要主角自己去修复或升级。',
  '## "Prop" Generation — Mortal Cultivation\n\n...',
  @method_id, 1, 23, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 5. 组织生成技能 (-org-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-mortal-org-gen',
  '「修仙公司宗门」生成：设定不谈道德只看实力的弱肉强食正邪两派巨头制',
  '"Organization" generation for Mortal Cultivation',
  '## 「修真门派与魔道六宗」生成 — 凡人流\n\n门派就是跨国企业，只看重压榨价值。不要谈什么师门情深。\n\n---\n\n### 字段生成指南\n\n#### 门派对底层的剥削\n比如：要求所有练气期五层以下弟子必须去“火铜矿脉”服役五年，每年必须上交两百斤矿石，完不成就要废除修为。没有家族背景的底层修士在这里连狗都不如。\n\n#### 随时跑路的主观能动性\n设定爆发“正魔大战”。宗门高层打算掩护核心精英弟子撤离，把主角等一堆外门弟子留下当炮灰启动血肉大阵。主角这时候绝不为门派死战，而是第一个发现端倪，提前一天通过废弃传送阵溜之大吉跑到别的大陆。',
  '## "Organization" Generation — Mortal Cultivation\n\n...',
  @method_id, 1, 25, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 6. 情节推演技能 (-plot-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-mortal-plot-gen',
  '「情节推演」领域知识：为资质极差的主角靠阴损谨慎从凡人界走到人界巅峰排练大纲',
  '"Plot Design" domain knowledge for Mortal Cultivation',
  '## 「情节大纲推演」领域知识 — 凡人流\n\n极其强调“稳扎稳打、谋定后动”，跳跃度千万不能太大。节奏是漫长的几百年。\n\n---\n\n### 典型故事推演结构\n1. **拜师杀机与凡人入局**：开局是凡界武林或下级门派。主角获得催熟/提纯辅助挂。发现第一个师傅要杀他，经过几十页的勾心斗角和布置陷阱在密室反杀，抢走基础修仙功法正式踏入修仙界。\n2. **血色试炼与筑基丹之争**：卡在练气期巅峰。为了极其稀缺的“筑基丹”，主角不得不报名参加九死一生的上古秘境/血色禁区。在里面当了一路的老阴比（老六），靠着别人互相残杀，坐收渔翁之利抢齐了药草。\n3. **正魔大战与乱世遁走**：主角刚刚筑基稳固根基。天下大乱，魔宗大派南下入侵。主角深感无力回天并且发现了宗门想拿底层当炮灰。一不做二不休截杀负责追杀拦截自己的修士，伪装身份跑到了极西海域隐姓埋名。\n4. **结丹元婴与反杀夺宝大戏**：两百年后，主角在海外资源贫瘠地靠嗑药磨到了虚丹/结丹。再次回到故土时，当年高高在上抢夺他机缘的高手，现在被主角用三十套组合阵法和满天的降灵雷符活活困死，完成扬灰。',
  '## "Plot Design" Domain Knowledge — Mortal Cultivation\n\n...',
  @method_id, 1, 30, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 7. 实体命名技能 (-entity-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-mortal-entity-naming',
  '实体法宝命名：带有朴素、阴损毒辣道长风的写实修仙法器与宗门名称',
  '"Entity Naming": professional naming guidance for Mortal Cultivation',
  '## 实体命名 — 凡人仙侠流\n\n不需要动辄毁天灭地的大词汇，而是需要朴实中透着血腥味的专用术语。\n\n---\n\n## 一、法器极其功能描述\n\n不要用：“盘古开天斧”、“诛仙剑阵”。\n要用带有具体阶级和阴毒性质的名词：【顶级飞行法器——神风舟】、【极其阴损的极品法器——蚀骨化血网】、【一次性大杀器——碧鳞毒针/天雷子】。\n\n## 二、境界与丹药法术\n\n丹药：【洗髓丹】、【筑基丹】、【降尘丹（提高一成结丹几率极品）】。\n法术：【火炎术】、【匿身术】、【玄冰刺】、【拘神诀（抽魂炼魄的搜魂术）】\n宗门必须古朴：【掩月宗】、【鬼灵门】、【天星城】。用简单的字体现千年修道气象。',
  '## Entity Naming — Mortal Cultivation\n\n...',
  @method_id, 1, 36, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 8. 叙事写作技能 (-narrative)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-mortal-narrative',
  '斗心眼市井文风：如何通过多重准备、隐忍与挫骨扬灰表现极高战术素养的求生战斗',
  'Narrative writing guidance for Mortal Cultivation',
  '## 苟且偷生正文写作指引 — 凡人仙侠流\n\n核心是体现主角的【苟】和【黑】。他绝不圣母，绝不多管闲事。\n\n---\n\n### 一、遇到危险的第一反应\n普通小说主角遇到女修士被四个大汉劫持，一定冲上去英雄救美。但凡人流绝不可以！\n*Example描写：他远远看到那边有斗法灵光闪动。主角眉头一皱，神识发现有血光翻飞，他二话不说立刻收敛气息，直接掏出隐匿符贴在胸口，绕了五里地的远路悄无声息地溜走了。因为他深知，修仙界没有好人，去多看一眼可能就会被连带灭口。*\n\n### 二、杀人扬灰的严谨步骤\n如果被迫防卫杀人，必须要有一套熟练度极高的工业化流水线描写。\n*1.祭出阴火搜魂寻找情报 -> 2.用小火球把肉体烧成灰烬 -> 3.把储物袋里的神识抹去 -> 4.往反方向丢一件对方带血的衣服迷乱追踪 -> 5.自己立刻贴上神行符跑路一百里进洞闭关三个月。* 展现其变态的稳健。',
  '## Narrative guidance — Mortal Cultivation\n\n...',
  @method_id, 1, 101, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 9. 小说命名技能 (-novel-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-mortal-novel-naming',
  '小说命名：极其古朴深沉、强调“凡、苟、极道”的四六字中国古典书名',
  '"Novel Naming": title generation for Mortal Cultivation',
  '## 小说命名 — 凡人仙侠流\n\n---\n\n### 常见书名格式\n\n**格式一：古朴的两字/四字真言式**\n传统、沉稳、带着大道无情感。没有任何花哨。\n- 示例：《凡人修仙传》、《仙逆》、《求魔》、《百炼成仙》、《觅仙道》\n\n**格式二：强调苟道与辅助外挂的现代风书名**\n这是近年来的一种趋势（苟道凡人流）。\n- 示例：《苟在修仙界长生不死》、《我有小绿瓶的修仙生活》、《长生：从下位门派杂役开始》\n\n### 内容简介结构\n用最质朴却最残酷的话语道出修仙的本质——修仙本是一场炼狱。\n“我叫江寒，资质平平的五灵根，被人用二两银子卖进了青羊宫当试药童子。\n第一天师傅笑眯眯地塞给我一碗化血汤，说是洗髓伐骨。\n第二天同屋练气三层的张麻子因为抢了一块下品灵石，被挑断脚筋扔在臭水沟里。\n我才知道，这里哪有什么餐霞饮露、御剑乘风。\n这里只有弱肉强食，尔虞我诈，和杀人放荒的黑心血光。\n幸运的是，我在水沟里摸起了一块能将废丹变废为宝的残破阵盘……\n那一日，一个毫无背景的凡人少年捏碎了手里的符箓，开始了一场漫长、踩着无数白骨的求长生之旅。”',
  '## Novel Naming — Mortal Cultivation\n\n...',
  @method_id, 1, 35, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);
