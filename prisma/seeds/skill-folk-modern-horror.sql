-- -----------------------------------------------------------------------------
-- 民俗现代融合流 (New Chinese Horror) AI 生成技能 Layer 3 SQL
-- -----------------------------------------------------------------------------

SET @method_id = 70; 

-- ============================================================================
-- 1. 设定生成技能 (-setting-gen)
-- ============================================================================

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'folk-modern-story-hook-setting-gen',
  '「故事钩子」设定生成：为民俗现代融合流生成现代背后的灵异切入点',
  '"Story Hook" setting generation for Folk Modern Horror',
  '## 「故事钩子」设定生成 — 民俗现代融合流\n\n该流派的故事钩子需要极其尖锐地刺破“科技时代的理性外衣”。主角因为非常现代、科技关联的原因（如送外卖、查代码bug、做电商运营）意外触发古老民俗的禁忌事件。\n\n---\n\n### 字段生成指南\n\n#### 切入点\n避免俗套的“回乡下探亲见鬼”。应强调在玻璃幕墙、网络空间、高科技企业里的“撞邪”。例如：一个算法工程师发现某段代码运行后总会导致机房停电且出现符咒投影。\n\n#### 异常现象\n把传统的灵异现象翻译成现代科技能捕捉的形式：监控器里的花屏、智能音箱半夜播放的傩戏、大数据杀熟推给你的纸扎人定向广告。\n\n#### 传统与科技冲突点\n第一个强烈的感官反差：用电子香炉上供、用无人机寻风水龙脉、用加密货币买命等极具赛博民俗张力的事件。',
  '## "Story Hook" Setting Generation — Folk Modern Horror\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'folk-modern-world-setting-gen',
  '「赛博民俗世界观」设定生成：生成封建迷信与现代都市并存的里世界规则',
  '"Worldview" setting generation for Folk Modern Horror',
  '## 「赛博民俗世界观」设定生成 — 民俗现代融合流\n\n---\n\n### 字段生成指南\n\n#### 民俗复苏方式\n传统玄学并没有死，而是进化了。它们寄生在资本链条或代码逻辑中（比如：通过短视频平台算法大规模抽取粉丝气运）。\n\n#### 社会表面秩序\n现代人如何对种种因果报应视而不见，或者将其解释为“过劳死”、“抑郁症”、“交通事故”。\n\n#### 里世界运行法则\n精怪如何伪装成潮牌设计师，道士如何做风险投资人。阴阳两界的货币和力量体系是怎样与现代金融挂钩的？（例如：功德被量化成了某种积分系统，可以转账和交易）。',
  '## "Worldview" Setting Generation — Folk Modern Horror\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'folk-modern-style-setting-gen',
  '「文风设定」生成：为民俗现代融合流生成反差感极强的写作指导',
  '"Writing Style" setting generation for Folk Modern Horror',
  '## 「文风设定」生成 — 民俗现代融合流\n\n---\n\n### 字段生成指南\n\n#### 语言风格\n避免仙侠小说里古香古色的说辞，要用“写字楼里的社畜语言”、“科学调查报告的口吻”去一本正经地谈论“如何给厉鬼做病理切片”、“如何在大数据框架下运行风水局”。\n\n#### 核心冲突描写\n描写民俗与科技冲突时，不要写哪边碾压哪边，要写出它们融合时的畸形和诡异。用信息时代的冷硬词汇去描述黏糊糊、阴森森的古老迷信。',
  '## "Writing Style" Setting Generation — Folk Modern Horror\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 2. 角色生成技能 (-character-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'folk-modern-character-gen',
  '「角色」生成：为民俗现代融合流生成赛博道士、科技神棍与被反噬的现代人',
  '"Character" generation for Folk Modern Horror',
  '## 「角色」生成 — 民俗现代融合流\n\n---\n\n### 字段生成指南\n\n#### 角色定位\n设计出新老交替的时代夹缝人。如：穿着冲锋衣、用激光笔点穴的赛博风水师；掌控跨国企业但偷偷在地下室养小鬼的董事长；因为乱扫二维码而中蛊的普通大学生。\n\n#### 表面职业与暗中手段的冲突\n这是该流派最吸睛的卖点。\n示例：表面是医院的核磁共振专家，实则用强磁场拘留魂魄；表面上是电音DJ，实际上是用低频声波敲电子木鱼超度亡魂。\n\n#### 冲突体现\n在角色的小习惯、口头禅中体现割裂感（前排喊“福生无量天尊”，后排说“帮我把功德转到支付宝”）。\n\n---\n\n### 角色阵容建议\n- 理性至上但被迫接受民俗的调查者（如程序员、刑警）\n- 完全将科技与术法融合的奇人（搭档/导师）\n- 利用现代科技将传统恶习放大百倍的野心家（反派）',
  '## "Character" Generation — Folk Modern Horror\n\n...',
  @method_id, 1, 21, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 3. 场景生成技能 (-scene-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'folk-modern-scene-gen',
  '「都市民俗场景」生成：为高楼大厦中的风水阵、实验室里的养尸地生成设定',
  '"Scene" generation for Folk Modern Horror',
  '## 「都市民俗场景」生成 — 民俗现代融合流\n\n---\n\n### 字段生成指南\n\n#### 场景名与现代伪装\n外表看必须是极具都市特色的标志物或普通建筑（如：高空观景餐厅、深夜的24小时便利店、地下车库、互联网大厂的无尘机房）。但其背后的民俗真相令人毛骨悚然。\n\n#### 民俗真相\n利用现代建筑的钢铁材料、光污染、立交桥弧度来布下能够扭转气运的大型风水杀局。\n（例如：某商场的旋转门实际上是碾碎路人命格的磨盘，立交桥就像八爪鱼吸收着城市的阴气聚于某座大楼）。\n\n#### 核心诡异现象\n日常熟悉的物品变成了怪异的载体。比如中央空调吹出的风带着纸钱灰的味道；自动贩卖机里掉出来的带着黄符的饮料。',
  '## "Scene" Generation — Folk Modern Horror\n\n...',
  @method_id, 1, 22, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 4. 道具生成技能 (-prop-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'folk-modern-prop-gen',
  '「赛博阴物」生成：生成结合科技感与封建残余的灵异法器与被污染电子设备',
  '"Prop" generation for Folk Modern Horror',
  '## 「赛博阴物」生成 — 民俗现代融合流\n\n---\n\n### 字段生成指南\n\n#### 外观描述\n必须产生视觉反差：金属冷光、代码绿光与朱砂红、陈旧符纸的交错。比如：内部用舍利子代替芯片的定制手机；挂着二维码的桃木剑。\n\n#### 现代异变\n传统的法器或邪术被科技放大后变得极为高效、可量产、且冷酷无情。比如：传统扎小人只能一次咒一个人，通过大数据分析，黑客能精准获取百万人的生辰八字，通过云计算集群进行“DDoS式群体物理超度”。',
  '## "Prop" Generation — Folk Modern Horror\n\n...',
  @method_id, 1, 23, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 5. 组织生成技能 (-org-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'folk-modern-org-gen',
  '「企业/门派(组织)」生成：生成以现代商业壳子掩盖的左道门派与玄学公司',
  '"Organization" generation for Folk Modern Horror',
  '## 「组织/企业」生成 — 民俗现代融合流\n\n---\n\n### 字段生成指南\n\n#### 组织名与企业愿景\n绝不能叫“天师道”、“养尸宗”，而应包装成有模有样的“殡葬产业资源回收有限公司”、“XX生物科技实验室”、“深蓝大数据风控集团”。\n\n#### 核心密谋与运作机制\n这是一种冰冷的商业收割。过去炼制百鬼夜行需要苦修几十年，现在他们只需要开几家连锁黑网吧，就能成批制造怨灵。用现代化的KPI和打卡制度去管理手下的孤魂野鬼，甚至剥夺精怪的灵气来给服务器降温。',
  '## "Organization" Generation — Folk Modern Horror\n\n...',
  @method_id, 1, 25, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 6. 情节设计技能 (-plot-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'folk-modern-plot-gen',
  '「情节设计」领域知识：为民俗现代融合流提供都市传说与民俗解谜兼备的跑团式剧情编排',
  '"Plot Design" domain knowledge for Folk Modern Horror',
  '## 「情节设计」领域知识 — 民俗现代融合流\n\n该流派的情节往往带有强烈的“调查感（跑团感）”，主角通过线索顺藤摸瓜，揭开看似“都市传说”的现象底下的风水/民俗大局。\n\n---\n\n### 典型故事结构\n1. **异象初现**：在极度日常的现代生活中（如通勤路上、格子间点外卖）遭遇了打破科学常理的代码/设备故障或离奇命案。\n2. **科学碰壁与转向玄学**：主角试图用科学解释，失败。在某位带赛博民俗属性的NPC指点下，意识到背后的封建力量。\n3. **法制社会下的斗法**：不能光明正大在CBD天上斗法飞剑。所有的算计、对峙都是在地下停车场、无人民防工程或是金融商战中暗潮汹涌地进行（用商业手段断对方的风水，拔掉对方的基站断供香火）。\n4. **科技暴走与降维打击**：用极度不讲武德的现代工业或科技手段，强行破坏古老阵法或者镇压老古董精怪（南无加特林菩萨式破局）。\n\n### 常见错误\n- ❌ 脱离都市环境，写着写着跑到深山老林里变成了传统的盗墓或抓鬼文，完全损失了反差感。',
  '## "Plot Design" Domain Knowledge — Folk Modern Horror\n\n...',
  @method_id, 1, 30, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 7. 实体命名技能 (-entity-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'folk-modern-entity-naming',
  '实体命名：提供科技词汇与阴森民俗词汇强行缝合的奇妙命名术',
  '"Entity Naming": professional naming guidance for Folk Modern Horror',
  '## 实体命名 — 民俗现代融合流\n\n这类小说的灵魂在于名称本身的“怪诞缝合”。将最新沿的科技/商业词汇，与极度沾着泥土气、死人味的词汇合并。\n\n---\n\n## 一、角色命名\n\n不要用“清风道长”、“张天师”。而要用类似“代码风水师老王”、“量化法师”、“阴极数据分析专员”的称谓。\n\n## 二、法器/道具命名\n\n**科技壳+民俗核**：电子木鱼、算法牌位、降魔无人机、钛合金雷击木剑、骨灰服务器盘。\n\n## 三、招式/技能命名\n\n不要用“乾坤大挪移”。\n推荐：**五雷正法·超频过载**、**物理引魂、定向爆破式除灵**。或者用现代流程重新释义，比如把拘魂称为“意识上传（强改权限版）”。',
  '## Entity Naming — Folk Modern Horror\n\n...',
  @method_id, 1, 36, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 8. 叙事写作技能 (-narrative)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'folk-modern-narrative',
  '民俗现代融合流正文写作指引：用精密说明文写鬼故事的反向恐怖学',
  'Narrative writing guidance for Folk Modern Horror',
  '## 正文叙事写作指引 — 民俗现代融合流\n\n文字的最高境界是不要试图“吓”读者。你越是用写实甚至无聊枯燥的技术分析笔触去写怪力乱神，读者越会在此刻的都市生活中感到背后发毛。\n\n---\n\n### 一、核心场景写作技巧\n\n#### 1.1 现代仪式描写\n当展示“请仙”、“下蛊”、“布风水”时，将其描写得像是一场严肃的外科手术或实验室操作。描述插线板怎么走线，屏幕代码怎么滚动，然后在某一行代码的输出端，忽然流出了纸钱和黑血。\n\n#### 1.2 日常场景污染\n将最熟悉的都市景象陌生化：办公软件发出了阴风怒号的声音、共享单车的链条上系满了红线。在冷感的不锈钢、霓虹灯中加入土腥味。\n\n### 二、节奏把控\n节奏推进必须有侦探片的解谜感。所有的“鬼怪现象”要被当成一种带恶意的“物理规律例外”来应对，而不是纯粹的恐吓道具。\n\n### 常见写作错误\n- ❌ 情感过于充沛，像普通网文一样大吼大叫“鬼啊”。\n- ❌ 设定堆砌太多，导致科技或者民俗任意一方显得极其儿戏。',
  '## Narrative guidance — Folk Modern Horror\n\n...',
  @method_id, 1, 101, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 9. 小说命名技能 (-novel-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'folk-modern-novel-naming',
  '小说命名：为结合了赛博朋克与传统阴阳术的风水灵异小说生成书名',
  '"Novel Naming": title generation for Folk Modern Horror',
  '## 小说命名 — 民俗现代融合流\n\n---\n\n### 常见书名格式\n\n**格式一：职业缝合式**\n- 结构：[赛博/数据/量子/科学] + 传统神棍职业\n- 示例：《赛博道士机甲降魔》、《走近科学：我怎么在用大数据抓鬼》《我，量化修仙专家》\n\n**格式二：现象揭秘式**\n- 结构：现代都市怪谈传闻 / 科技产品的灵异功能 \n- 示例：《深夜代码禁区》、《我的手机能收冥币》、《谁把乱葬岗建在了互联网中枢》\n\n### 内容简介结构\n用极度调侃和荒诞的前文引入（比如：当僵尸冲过来的时候，我没有用糯米，我用一发RPG送它物理超度）。然后在后半段点破现代人冷漠物质社会背后潜藏的更深层面信仰崩坏。',
  '## Novel Naming — Folk Modern Horror\n\n...',
  @method_id, 1, 35, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);
