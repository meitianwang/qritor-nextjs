-- -----------------------------------------------------------------------------
-- 邻里关系畸变流 (Neighborhood Distortion Horror) AI 生成技能 Layer 3 SQL
-- -----------------------------------------------------------------------------

SET @method_id = 73; 

-- ============================================================================
-- 1. 设定生成技能 (-setting-gen)
-- ============================================================================

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'neighborhood-distortion-story-hook-setting-gen',
  '「入住窥探钩子」设定生成：为邻里畸变流提供主角搬入受限空间并开始偷窥的动机起点',
  '"Story Hook" setting generation for Neighborhood Distortion Horror',
  '## 「入住窥探钩子」设定生成 — 邻里关系畸变流\n\n该流派最吸引人的特质是“好奇心害死猫”。主角不一定是主动送命，而是日常生活被迫在逼仄的空间内和人产生肉体或听觉摩擦引发的怀疑。\n\n---\n\n### 字段生成指南\n\n#### 入住契机\n设计一个主角绝对没办法轻易换房子的理由。破产只能租群租房？为了躲在高层公寓创作的闭关作家？或是继承了死掉哥哥的凶宅决定查明真相？\n\n#### 第一次异样摩擦\n不必上来就见鬼。应当是极其容易被忽视但细想极恐的生活细节：\n比如洗澡时总能在下水管道里听到一墙之隔的邻居在磨刀；或者每天晚上11点半，楼上的弹珠声准时响起，而且越来越重，就像保龄球。\n\n#### 被发现的危机感\n从单向窥探变为双向对视。这个刺激点必须有：主角满头大汗从门缝往外看，突然一根烧红的铁丝从外面插了进来戳瞎了猫眼，或是外面的走廊灯灭了，有一个极其轻微的呼吸声停在了主角门外。',
  '## "Story Hook" Setting Generation — Neighborhood Distortion Horror\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'neighborhood-distortion-world-setting-gen',
  '「楼栋畸变生态」设定生成：生成因为贪婪或邪教而全楼包庇的罪恶孤岛',
  '"Worldview" setting generation for Neighborhood Distortion Horror',
  '## 「楼栋畸变生态」设定生成 — 邻里关系畸变流\n\n一部好的邻里悬疑小说中，主角最大的敌人往往不是某一个人，而是“所有人”。\n\n---\n\n### 字段生成指南\n\n#### 楼栋生态本质\n不要搞大范围世界末日。只需要这方圆五十米的区域烂透了。\n例如：十年前的一起轮奸杀人案，整栋楼六户人家全部分尸并分享了死者的肉，吃过“肉”的人全部被诅咒同化成了非人怪物，新来的主角是唯一的活人盲盒。\n\n#### 伪善秩序与同化机制\n白天，凶手们文质彬彬地送花、倒垃圾、关心主角冷暖。晚上，他们却在门外集会倒数主角什么时候死。对新人的同化，往往通过“赠送带毒食物”、“请去家里做客趁机下药”或是“半夜强拉去天台进行集体受洗”来进行。',
  '## "Worldview" Setting Generation — Neighborhood Distortion Horror\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'neighborhood-distortion-style-setting-gen',
  '「文风设定」生成：指导生成带有偷窥狂般细腻、病态放大的生理写实描写',
  '"Writing Style" setting generation for Neighborhood Distortion Horror',
  '## 「文风设定」生成 — 邻里关系畸变流\n\n---\n\n### 字段生成指南\n\n#### 语言风格\n文字需要带着微微的“湿冷感和偷窥病态感”。要求大量使用表示视觉受限的词汇（如：通过门缝、百叶窗、反光镜、猫眼）。\n\n#### 听觉与视觉放大\n在安静的公寓里，声音是最大的恐怖源。描写时必须放大感官体验：“我听见皮肉在水泥地拖行的摩擦声”、“门外有东西在反复咀嚼着软骨，黏糊糊的舔舐声紧贴着木门”。\n绝不可以直接写“一个鬼站在那”，要写“门外那双死人脚悬空着没有着地”。',
  '## "Writing Style" Setting Generation — Neighborhood Distortion Horror\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 2. 角色生成技能 (-character-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'neighborhood-distortion-character-gen',
  '「畸变邻居」生成：生成表面光鲜亮丽实则半夜剥皮吃死老鼠的双面人档案',
  '"Character" generation for Neighborhood Distortion Horror',
  '## 「邻居档案」生成 — 邻里关系畸变流\n\n这里的群像必须充满着惊人的反转与恶劣的人性。\n\n---\n\n### 字段生成指南\n\n#### 室号、表面形象与深夜真实面目\n给每一个数字赋予一个刻板印象，然后打破它。\n例如：\n【301的白领美女】：白天踩着高跟鞋喷着高级香水。深夜，她从垃圾桶翻找带血的卫生棉，然后把它们丢进搅拌机里喝掉，其实是个寄生虫巢。\n【502的慈祥阿婆】：每天清晨扫楼道。午夜时，她坐在门口不停用锥子扎一只缝着主角照片的稻草人，而且她是没有眼睛的盲人却能精准看向主角的门锁。\n\n#### 对主角的态度与危险互动\n千万别让反派们一开始就拿大砍刀冲上来，那样就变成丧尸片了。\n让他们“过分热情”。比如死活要把熬的一锅奇怪肉汤送给主角，主角推辞时，一直笑脸相迎的阿姨突然变脸，声音低沉：你喝不下也得喝。',
  '## "Character" Generation — Neighborhood Distortion Horror\n\n...',
  @method_id, 1, 21, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 3. 场景生成技能 (-scene-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'neighborhood-distortion-scene-gen',
  '「逼仄空间」生成：为主卧隔墙、公共卫生间和幽闭走廊提供空间叙事点缀',
  '"Scene" generation for Neighborhood Distortion Horror',
  '## 「逼仄空间与窥探点场景」生成 — 邻里关系畸变流\n\n主角能够躲藏、能够窃听的地方越小，恐怖感越强。\n\n---\n\n### 字段生成指南\n\n#### 空间异样与偷窥功能\n制造狭窄、藏污纳垢的“隔间”。比如：衣柜后面其实有一层预留的空腔墙壁，主角刚好可以容身在那偷听室友的杀人计划；又或者天花板的检修口，主角必须爬进布满灰尘和死去的干尸老鼠的暗格里躲避抓捕。\n\n#### 暴露风险\n偷窥不是无限开挂的。给它加上致命的代价！\n主角趴在老旧水管听楼下声音时，水管突然震动，里面传出一声贴耳的：“你在偷听对吧？”\n主角看猫眼时发现猫眼被挖空了，对面直接一根手指捅了进来。',
  '## "Scene" Generation — Neighborhood Distortion Horror\n\n...',
  @method_id, 1, 22, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 4. 道具生成技能 (-prop-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'neighborhood-distortion-prop-gen',
  '「截获物遗物」生成：生成被邻居污染的日常物品、内藏断指的快递盲盒',
  '"Prop" generation for Neighborhood Distortion Horror',
  '## 「窥探截获物道具」生成 — 邻里关系畸变流\n\n---\n\n### 字段生成指南\n\n#### 外观恶心感与隐藏罪恶\n在日常生活中出现的血腥物。邻居强塞过来的腌泡菜缸，底下埋着一颗惨白的人头。或者是主角在床垫缝里抠出来的一个微型偷拍针孔摄像头，连接的终端IP竟然是楼下房东的电脑，发现整个房间都在24小时被直播。\n\n#### 沾染的因果\n不要写捡到神器主角起飞。这是一块烫手山芋。主角截获了这件物品后，当晚全楼的人都来疯狂敲门：“小李啊，听说你收错快递了，快还下来。不然大家都不好过。”制造极度的群体心理逼宫效应。',
  '## "Prop" Generation — Neighborhood Distortion Horror\n\n...',
  @method_id, 1, 23, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 5. 组织生成技能 (-org-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'neighborhood-distortion-org-gen',
  '「楼道小团体」生成：生成为了某种不可告人畸变癖好包庇共谋的群像势力',
  '"Organization" generation for Neighborhood Distortion Horror',
  '## 「合谋小团体」生成 — 邻里关系畸变流\n\n这往往是整个大高潮才会展现的绝望设定：全楼皆恶人。\n\n---\n\n### 字段生成指南\n\n#### 全楼掩盖的暗中密谋与沉默协议\n主角一直以为只有对门有问题，但随着线索深挖，发现对门其实是被献祭的祭品！真正操控一切的，是楼上那个大好人居委会主任。\n设计他们为何要联合杀新租客：可能是这栋楼本身修建在阴穴上，每两年必须向地基灌溉活血才能保证其他几十户人不遭灾。所以全楼合伙从外面骗租客进来。\n如果主角去报警，来出警的警察一脱帽子，里面竟然也是这个拜鬼教团的一员！',
  '## "Organization" Generation — Neighborhood Distortion Horror\n\n...',
  @method_id, 1, 25, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 6. 情节设计技能 (-plot-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'neighborhood-distortion-plot-gen',
  '「情节推演」领域知识：为心理惊悚类群居生活提供偷窥、反侦察与防线崩溃的大纲编排',
  '"Plot Design" domain knowledge for Neighborhood Distortion Horror',
  '## 「情节推演」领域知识 — 邻里关系畸变流\n\n这必须有一种如同电影《后窗》或是惊悚漫画《他人即地狱》般的悬疑闭环感。\n\n---\n\n### 典型故事推演结构\n1. **孤镇迷局与错位试探**：初入大楼，一切略显温馨。主角发现了小端倪。他在门后听邻居的墙角，此时还带有轻敌和猎奇心理。\n2. **恐怖谷效应爆发**：第一具尸体出现或者第一起严重灵异现象爆发。主角开始害怕想要搬走，但因为暴雨封路/门被反锁/身份证护照被偷，被强制留下。\n3. **被困孤塔与猫鼠游戏**：开始反侦查。主角把屋子武装成堡垒，但在家中却总能找到别人进入过的痕迹（比如摆歪的杯子，牙刷有异味）。这阶段心理压迫感极高，所有的邻居看他都像是在看一只死老鼠。\n4. **疯狂夜集与杀戮盛宴**：所有伪装撕下。全楼怪物化或开始狩猎，在极度封闭的高楼或地下通道进行生死追逐，主角利用提前布置的陷阱、或者抓到内讧的破绽惨烈逃出。\n\n### 常见错误\n- ❌ 随便召唤道家雷法炸大楼。这是心理惊悚片！解决问题的只能是高智商解谜、心理博弈、极度肉搏和利用人性丑恶挑拨离间。',
  '## "Plot Design" Domain Knowledge — Neighborhood Distortion Horror\n\n...',
  @method_id, 1, 30, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 7. 实体命名技能 (-entity-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'neighborhood-distortion-entity-naming',
  '实体命名：为具有市井生活气息的黑化角色、废弃楼栋生成代号',
  '"Entity Naming": professional naming guidance for Neighborhood Distortion Horror',
  '## 实体命名 — 邻里关系畸变流\n\n极致的日常生活词汇组合而成的代称，凸显人性的虚伪。\n\n---\n\n## 一、人物与团体代号\n\n不要用妖魔化的名字。\n反面：【吸血鬼老太】、【杀人魔李强】\n推荐：**【楼管孙阿姨】（其实在剥皮）、【热心送果篮的男子】、【深夜麻将四人组】（缺的那个麻将搭子是被他们当场肢解的租客）**\n\n## 二、区域名词\n\n用老小区独特的地理标点。\n示例：【死角的天台水塔】、【布满绿毛的公共卫生间】、【不亮灯的第七级台阶】。无需玄幻化，字面有多普通，里面藏的故事就有多肮脏。',
  '## Entity Naming — Neighborhood Distortion Horror\n\n...',
  @method_id, 1, 36, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 8. 叙事写作技能 (-narrative)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'neighborhood-distortion-narrative',
  '隔门窥探流正文写作指引：如何通过受限观察视口、声音压迫感写出心理变态氛围',
  'Narrative writing guidance for Neighborhood Distortion Horror',
  '## 心理畸变悬疑正文写作指引 — 邻里关系畸变流\n\n所有恐怖气氛只能建立在“主角什么都没直接看见，但已经吓得尿裤子”的基础上。\n\n---\n\n### 一、核心描写手段：视听极度受限（盲区恐怖）\n\n主角只能通过猫眼、门缝底下、排气扇缝隙等极其狭窄的地方窥探。\n*“我趴在门后屏住呼吸，通过猫眼那浑浊发黄的玻璃，我看到走廊的声控灯亮了。对门那个大背头李叔，此时竟然手脚并用地贴在天花板上倒立着爬行，他嘴里拉着粘腻的丝线，一口咬掉了旁边流浪猫的头...我吓得想后退，却发现脚脖子被人从床底下猛地抓住了。”*\n\n### 二、精神分裂与多疑狂描写\n因为长期处于高压，主角自己也快疯了。\n多写一些主角对周遭毫无来由的疑神疑鬼、产生幻觉的情况。“我以为那是一堆假发，走近一看才发现是一张人脸皮。”这种虚实交错让读者也分不清到底有鬼，还是主角病了。',
  '## Narrative guidance — Neighborhood Distortion Horror\n\n...',
  @method_id, 1, 101, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 9. 小说命名技能 (-novel-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'neighborhood-distortion-novel-naming',
  '小说命名：为隔墙有耳的多疑租案、熟人异化惊悚事件寻找贴切毒辣的第一视图书名',
  '"Novel Naming": title generation for Neighborhood Distortion Horror',
  '## 小说命名 — 邻里关系畸变流\n\n---\n\n### 常见书名格式\n\n**格式一：警告且极度市井的句式**\n- 结构：[请勿/别] + 对邻居做某件日常事\n- 示例：《别吃对门阿姨送的饺子》、《千万别用门缝看邻居》、《深夜楼上的弹珠声》\n\n**格式二：悬疑疑阵与门牌式**\n- 结构：门牌号/小区名 + 恐怖定语\n- 示例：《404号房的租客都很饿》、《微笑公寓：全楼只有我是活人》、《死角暗窗》\n\n### 内容简介结构\n用第一人称碎碎念的方式来写。突出那种“已经被包围、马上就要死”的紧张感。\n“楼上的那个混蛋每天半夜都在剁肉。\n对门的阿姨送来的鲜花里长出了人类的毛发。\n我刚接完报警无果的电话回头，却发现我的床底下塞着一张纸条：‘快跑，他们今晚要吃你了。’可是，我的门早就被他们从外面反锁……”\n要制造浓烈的不安、窒息与绝境感。',
  '## Novel Naming — Neighborhood Distortion Horror\n\n...',
  @method_id, 1, 35, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);
