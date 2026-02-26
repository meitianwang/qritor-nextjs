-- -----------------------------------------------------------------------------
-- 反乌托邦 (Dystopia) AI 生成技能 Layer 3 SQL
-- -----------------------------------------------------------------------------

SET @method_id = 77; 

-- ============================================================================
-- 1. 设定生成技能 (-setting-gen)
-- ============================================================================

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'dystopia-story-hook-setting-gen',
  '「完美运转的裂痕」钩子生成：为反乌托邦生成让主角从小齿轮引发意识觉醒的危机事件',
  '"Story Hook" setting generation for Dystopia',
  '## 「觉醒裂痕钩子」设定生成 — 反乌托邦流\n\n反乌托邦的开篇必须是一个“完美的牢笼”。不能一开始就在废土打仗，而是让主角做着一份机械而体面的工作（审查员、数据校对），直到一丝缝隙透了进来。\n\n---\n\n### 字段生成指南\n\n#### 日常洗脑与绝对正确\n设计一段极其荒唐却在书中被视为绝对真理的日常（如：早晨必须喝下一杯抑制性冲动的银色液体；在工位上发现一个未被修改的昨天的旧新闻）。\n\n#### 引发觉醒的致命违规\n觉醒往往伴随人性的复苏。比如：他在销毁违禁证物时，偷偷保留了一张一百年前印着一男一女在海边接吻的照片。这一刻的好奇心，直接将他推到了被系统抹除的悬崖边。',
  '## "Story Hook" Setting Generation — Dystopia\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'dystopia-world-setting-gen',
  '「伪完美社会法则」设定生成：为主打监控、基因分层与情感剥夺的集权恐怖社会服务',
  '"Worldview" setting generation for Dystopia',
  '## 「统治法则」设定生成 — 反乌托邦流\n\n一切科幻技术的尽头如果用来剥削人类自己，这就是反乌托邦。社会设定要达到“让人不寒而栗的合理化”。\n\n---\n\n### 字段生成指南\n\n#### 控制核心体系\n不要用妖魔来统治人类，人类自己统治自己最可怕。\n有几种经典方向供选择：\n1.  **铁腕监控派**：无处不在的电幕、被缩减词汇量无法表达思想的“新语”、相互检举的亲属伦理崩塌。\n2.  **娱乐奶头乐派**：全自动化的流水线配给，用无限的娱乐全息节目、合成毒品（如“梭麻”）让人每天保持傻乐，永远不思考。\n3.  **冰冷算法判定派**：一出生就被AI按照基因划分社会等级，分数低的人走在街上连便利店的门都打不开，分数高的人可以随意处置系统判定的“低价值垃圾”。',
  '## "Worldview" Setting Generation — Dystopia\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'dystopia-style-setting-gen',
  '「审查档案文风」生成：指导生成带有强词夺理系统口吻、冰冷编号记录的行文规范',
  '"Writing Style" setting generation for Dystopia',
  '## 「文风档案」设定生成 — 反乌托邦流\n\n---\n\n### 字段生成指南\n\n#### 语言风格（剥夺感与压抑）\n强制要求“去人性化”描写。文笔应当极其干燥、神经质。主角在内心里会有大量充满多疑的自我审查。\n不要写温馨的风景：这里只有整齐划一的方块工厂、散发着消毒水气味的生化配给仓。要让读者感觉到主角连呼吸一口新鲜空气都是在犯罪的窒息感。',
  '## "Writing Style" Setting Generation — Dystopia\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);


-- ============================================================================
-- 2. 角色生成技能 (-character-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'dystopia-character-gen',
  '「被奴役的公民」生成：生成顺从体制变态规则的螺丝钉、被洗脑者或绝望潜伏者',
  '"Character" generation for Dystopia',
  '## 「公民与检察官群像」生成 — 反乌托邦流\n\n在一个人吃人的光驱秩序中，不存在绝对的无辜者。\n\n---\n\n### 字段生成指南\n\n#### 极端生态位的切片\n设计能够体现体制之恶的配角：\n【狂热洗脑标兵】：主角的同事，每天大声歌颂体制，哪怕自己只被分配到干面包却觉得是恩赐，一旦嗅到主角的异样立刻准备按检举按钮的疯子。\n【特权高官奥布莱恩】：可以关掉电幕拥有隐私。看似拥有知识可以理解主角的困惑，但其实他正是那个维持绞肉机运转、以玩弄碾碎人性为乐的执刀人。\n\n#### 异化的行为\n这群人展现不出正常的爱恨情仇。他们的爱欲已经被切除，取而代之的是对权力的服从、或是只能像动物一样在下水道底交配的原始宣泄。',
  '## "Character" Generation — Dystopia\n\n...',
  @method_id, 1, 21, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 3. 场景生成技能 (-scene-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'dystopia-scene-gen',
  '「全景监狱与废都」生成：生成让人无处可藏的监控温室或被辐射遗弃的法外野区',
  '"Scene" generation for Dystopia',
  '## 「体制建筑与监控区」生成 — 反乌托邦流\n\n场景必须体现出福柯所说的“全景敞视监狱（Panopticon）”理论。\n\n---\n\n### 字段生成指南\n\n#### 视觉的过度透明感\n用玻璃、白炽灯和无数不可见的探头构建场景。比如这栋公寓的墙壁完全是透明的玻璃，每个人都在监视其他人，同时也被别人监视；或者是高悬在十字路口的AI惩戒机器眼。\n\n#### 体制的暴力美学\n生成那种压倒性的机构建筑。例如负责绞杀思想的部门，名字却极度好听：【真理部】、【仁爱总署】。内部是没有窗户、永恒燃烧白炽灯、满是冰冷拷问器械的深渊。',
  '## "Scene" Generation — Dystopia\n\n...',
  @method_id, 1, 22, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 4. 道具生成技能 (-prop-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'dystopia-prop-gen',
  '「思想违禁品」生成：生成引发主角犯罪的人性火种或控制肉体的生化制剂',
  '"Prop" generation for Dystopia',
  '## 「违禁品与监控端」生成 — 反乌托邦流\n\n反乌托邦里最厉害的武器不是核弹，是一本被藏在床垫下的日记本。\n\n---\n\n### 字段生成指南\n\n#### 象征旧日人性的器物\n这些东西在现代很平常，但在那个年代足以判处极刑：一块真正的巧克力（而不是合成蛋白膏）、一条有颜色的丝巾、一个装有几十年前音乐的破旧随身听。主角每接触一次，就是在拿命赌去感受作为“人”的尊严。\n\n#### 剥夺意志的耗材\n系统发配的物品：比如只能调节为“欢笑”指令的面部皮肤修正贴；用来抹除短时记忆从而配合历史篡改的蓝色注射剂。',
  '## "Prop" Generation — Dystopia\n\n...',
  @method_id, 1, 23, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 5. 组织生成技能 (-org-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'dystopia-org-gen',
  '「极权与伪抵抗」生成：为主宰一切的老大哥与实为钓鱼执法的兄弟会团体进行设定',
  '"Organization" generation for Dystopia',
  '## 「统治集团与欺诈组织」生成 — 反乌托邦流\n\n---\n\n### 字段生成指南\n\n#### 老大哥（Big Brother）式的神坛\n这个体制的头目可能根本不是一个活人，而是一个永远不老的AI全息影像或是一个象征概念。重点在于它的【绝对不可战胜性】和对真相的【任意修改权】。\n\n#### 反抗组织的绝望真相\n在反乌托邦流中，最大的悲剧是：你以为找到了同样觉醒的同志，参加了地下结社。结果有一天开会时，带头大哥拿出了工作证，宣布把你们一网打尽。抵抗组织往往是体制为了筛查不稳定因素而建立的“捕鼠笼”。',
  '## "Organization" Generation — Dystopia\n\n...',
  @method_id, 1, 25, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 6. 情节设计技能 (-plot-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'dystopia-plot-gen',
  '「情节推演」领域知识：为大机器下的小人物从苟延残喘到觉醒试探再到粉身碎骨排演悲剧大纲',
  '"Plot Design" domain knowledge for Dystopia',
  '## 「情节推演」领域知识 — 反乌托邦流\n\n这往往不是一部最终推翻暴君迎来和平的爽文。它是展示极权碾压人性的标本室。\n\n---\n\n### 典型故事推演结构\n1. **完美牢笼与一丝裂纹**：展现男主（往往是中下层）机械、顺从、被高压监测的生活。意外接触到了禁忌的事物开始产生疑惑。\n2. **地下的犯罪与短暂人性**：主角开始背着电幕进行第一次微小的抵抗：比如和一个同样觉醒的女性在不被监控的死角进行被法律禁止的“做爱/恋爱”（在反乌托邦里，爱情也是大逆不道）。这是暴风雨前最脆弱的温存。\n3. **钓鱼执法与兄弟会落网**：主角自以为找到了组织，准备开始宏大的行动想要颠覆体制。却在交易信物的那一晚，被平时最信任的同志/或者一直伪装反叛的高官逮捕。\n4. **101室的摧毁与爱上老大哥**：进入了漫长而冰冷的审讯洗脑阶段。不是要杀掉主角的肉体，而是要诛心。通过最大的恐惧（比如主角最怕老鼠，就用老鼠咬他的脸）让他出卖爱人、放弃思考。结局往往是主角流着泪，真心实意地爱上了那个剥削他的体制（彻底死亡）。\n\n### 常见错误\n- ❌ 中途主角突然觉醒超能力，一路开挂单挑爆杀了元首拯救全国。这是废土科幻，不是反乌托邦。反乌托邦的核心是“在绝对庞大的体制前，个人的反抗如蚍蜉撼树般悲凉”。哪怕最终真的摧毁了体制，也必将付出几代人填满废墟的血腥代价。',
  '## "Plot Design" Domain Knowledge — Dystopia\n\n...',
  @method_id, 1, 30, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 7. 实体命名技能 (-entity-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'dystopia-entity-naming',
  '实体命名：使用新语、颠倒黑白的伪善词汇与剥夺人格的数字化代码',
  '"Entity Naming": professional naming guidance for Dystopia',
  '## 实体命名 — 反乌托邦流\n\n反乌托邦取名的秘诀是：名词必须和它的实际功能完全【反义/诡辩】或者【彻底数字化丧失人性】。\n\n---\n\n## 一、机构与建筑\n\n使用极度伪善或是庞大的名词：\n- 负责发动战争抹杀叛匪的叫：【和平部】（Ministry of Peace）\n- 负责洗脑、造假历史让人民吃不饱饭的叫：【富裕局】、【繁荣大厦】。\n\n## 二、口号与人物称呼\n\n洗脑口号要具有反直觉的暴力：【战争即和平，自由即奴役，无知即力量】。\n如果是被下层管辖分配的人，甚至不配拥有姓名。只有：【D-503】、【次等品78号】、【饲育母体舱位管理员】。',
  '## Entity Naming — Dystopia\n\n...',
  @method_id, 1, 36, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 8. 叙事写作技能 (-narrative)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'dystopia-narrative',
  '反监控压抑文风指引：如何通过大量自我审查独白、被驯化的视口描写绝望统治',
  'Narrative writing guidance for Dystopia',
  '## 控制社会正文写作指引 — 反乌托邦流\n\n这不是战斗爽文。这是对恐惧的精准描绘，是神经极其紧绷走钢丝的文字感。\n\n---\n\n### 一、核心描写手段：无处不在的双向电幕审查\n\n每一段描写都要体现出“有人在看着我”。哪怕主角在吃饭，他也会想：*“我必须咀嚼十二下，并且嘴角保持恰到好处的上场十五度微笑。因为墙上红点一直亮着，如果我的笑容显得有任何对今日合成口粮的不满，两分钟后纠察局的车就会停在楼下。”*\n\n### 二、荒谬化的习以为常\n对极其恐怖、荒唐的非人道行径，要用一种近乎“天经地义、平淡无奇”的公文口吻写出来，以此让读者背后发凉。\n举例：不要痛心疾首地控诉。而是借同事的嘴说：*“听说邻居老王因为做梦说了句想吃肉，昨晚被‘净化’了。真是个蠢货，害得我们这栋楼今天文明分都被扣了。”*',
  '## Narrative guidance — Dystopia\n\n...',
  @method_id, 1, 101, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 9. 小说命名技能 (-novel-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'dystopia-novel-naming',
  '小说命名：为带有个体反常、体制洗脑密码或监视年份号志起绝望冰冷的代号书名',
  '"Novel Naming": title generation for Dystopia',
  '## 小说命名 — 反乌托邦流\n\n---\n\n### 常见书名格式\n\n**格式一：数字纪元与冰冷缩语式（最高级）**\n- 结构：年代/时间代号、或者是代表体制群体的代词\n- 示例：《1984》、《我们》、《华氏451》、《V字仇杀队》\n\n**格式二：伪善讽刺式**\n- 结构：美好宏大的词汇 + 极端修饰词\n- 示例：《美丽新世界》、《极乐净土管理局》、《完美的终点》\n\n### 内容简介结构\n用冰冷、机械而又带有一丝疯狂的旁白揭开社会的真面目。\n“这是新纪元的第300年。这里没有犯罪，没有战争，自然也没有爱情和悲伤。\n从出生起，我们的基因就被打分，按需分配了工作和伴侣。\n我是一名历史修正员。我的工作是每天修改新闻，让昨天的猪肉价格永远低于今天。\n直到有一天清晨，我不小心打翻了抑制感情的镇静药水……也就是那天，我第一次看见了鲜血原来是可以那么红的。\n警告：您已产生一级违规思想。清除程序准备中……”',
  '## Novel Naming — Dystopia\n\n...',
  @method_id, 1, 35, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);
