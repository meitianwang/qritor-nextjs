-- -----------------------------------------------------------------------------
-- 无限循环/密闭公车流 (Infinite Loop Horror) AI 生成技能 Layer 3 SQL
-- -----------------------------------------------------------------------------

SET @method_id = 71; 

-- ============================================================================
-- 1. 设定生成技能 (-setting-gen)
-- ============================================================================

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'infinite-loop-story-hook-setting-gen',
  '「循环起因钩子」设定生成：为无限循环流生成主角上车与初次死亡爆点',
  '"Story Hook" setting generation for Infinite Loop Horror',
  '## 「故事钩子」设定生成 — 无限循环公车流\n\n无限流需要在前三章或者前五分之一个镜头内完成首次团灭/死亡，从而建立起这个故事中最大的焦虑感：死亡重置。\n\n---\n\n### 字段生成指南\n\n#### 上车契机\n设计一个极为日常且被迫的理由。最好带着疲大感、或者为了某件小事匆匆上车，这样与随后的宏大绝望感形成对比。\n\n#### 初次死亡/重置事件\n必须是突如其来且无法反抗的毁灭性事件。车底突然漏血爆炸？全车人突然齐刷刷转头看着主角然后将其撕碎？或者是前方无底悬崖强行开下去？\n\n#### 发现循环的锚点\n第二次醒来时，视觉听觉的重叠是经典的无限流爽点。收音机的早间新闻重新播报了一遍，或者是某大妈的橘子又一次滚落到了脚边...',
  '## "Story Hook" Setting Generation — Infinite Loop Horror\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'infinite-loop-world-setting-gen',
  '「循环与空间法则」设定生成：生成时间倒退机制与车厢外的空间坍塌法则',
  '"Worldview" setting generation for Infinite Loop Horror',
  '## 「循环与空间法则」设定生成 — 无限循环公车流\n\n---\n\n### 字段生成指南\n\n#### 循环载体与重置条件\n明确什么是这趟车的“存档点”和“死线”。每次是不是主角一死就重置？还是倒计时归零就重置？还是车每停靠三站就全部清档？\n\n#### 空间扭曲特征\n不能让车外的描写太正常，给主角一种“跳车也未必能活”的幽闭感。外面的雨是倒着下的，经过的路灯影子拉到了天上，或是这条公路上只有雾气，永远看不见其他车辆。\n\n#### 破局关键(生路)\n悬疑的核心。不是简单的杀掉坏人，而是需要解谜。比如找到一封三年前的信在指定路口扔下车，或是发现其实司机早就死了，必须要主角亲自驾驶大巴冲出鬼域。',
  '## "Worldview" Setting Generation — Infinite Loop Horror\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'infinite-loop-style-setting-gen',
  '「文风设定」生成：为密闭空间、高压绝望和读秒紧迫感生成风格指导',
  '"Writing Style" setting generation for Infinite Loop Horror',
  '## 「文风设定」生成 — 无限循环公车流\n\n---\n\n### 字段生成指南\n\n#### 语言风格\n无限循环类的文风必须有一种“跟时间赛跑的喘息感”。\n\n#### 重复的绝望描写\n由于同样的场景要被重写很多次，需要指导作者在每次轮回时，不要水字数复述，而是关注于主角在第10次、第50次、第100次醒来时，从惊恐，到狂躁，到麻木，再到如精密机器般推演冷酷杀伐的心理变化。',
  '## "Writing Style" Setting Generation — Infinite Loop Horror\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);


-- ============================================================================
-- 2. 角色生成技能 (-character-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'infinite-loop-character-gen',
  '「乘客记录」生成：生成陷入循环的清醒者与按照冥冥剧本重演的亡魂',
  '"Character" generation for Infinite Loop Horror',
  '## 「乘客记录」生成 — 无限循环公车流\n\n---\n\n### 字段生成指南\n\n#### 角色状态与固定动作\n车里的群像感非常重要。每个人可能都是“鬼”，但他们表现得像是在生前最后一刻。设定他们每次重置后一定会机械执行的一件事。比如：第三排的老人总是剧烈咳嗽并在6分12秒吐出一口血。\n\n#### 隐藏真相\n这些人为什么上这班车？主角的破局线索就藏在他们的身世碎片里。他们可能是十年前一场连环车祸的牺牲品，因为一口怨气成了空间碎块。\n\n#### 循环记忆保留度\n大多数NPC是毫无保留的复读机。但必须设计一两个“伪人”——他们在第10次循环时，突然不按之前的剧本走了，回头对主角笑了笑。这种越界感是最恐怖的。\n\n---\n\n### 角色阵容建议\n- 理智清醒的主角（可能起初是个胆小的高中生/打工人，最后变成百战百胜的时空刺客）\n- 一个总是死在主角前头的同伴（每次都会带点新的遗言）\n- 群像亡魂（每个人身上带有车祸线索碎片的NPC）',
  '## "Character" Generation — Infinite Loop Horror\n\n...',
  @method_id, 1, 21, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 3. 场景生成技能 (-scene-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'infinite-loop-scene-gen',
  '「站点与折叠车厢」生成：为车内环境和车外不可知的站点提供诡异渲染',
  '"Scene" generation for Infinite Loop Horror',
  '## 「站点与折叠车厢场景」生成 — 无限循环公车流\n\n---\n\n### 字段生成指南\n\n#### 场景类型与名称\n在公车流里，车停就是危机的升级。站点名称要逐渐离谱（从“十字路口站”变成“冥河服务区”、“无门村”）。\n\n#### 外景空间扭曲事件\n不要让车外的站台只是一个黑糊糊的影子，可以写红绿灯变成了三只不断闪烁的流血眼睛；或者车站广告牌上的女人画像每一圈都离车窗更近。\n\n#### 上车之物\n每次停靠都不是救赎，而是增加变量难度。可能会有两个长得一模一样的人走上车，或者上来一个没有下半身的售票员开始挨个检票（没有票的主角将在这一轮惨死）。',
  '## "Scene" Generation — Infinite Loop Horror\n\n...',
  @method_id, 1, 22, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 4. 道具生成技能 (-prop-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'infinite-loop-prop-gen',
  '「线索遗物」生成：生成能带来时间线蝴蝶效应的乘客物品与死亡证据',
  '"Prop" generation for Infinite Loop Horror',
  '## 「线索遗物」生成 — 无限循环公车流\n\n线索往往是主角经过成百上千次生死试错拿到的成果，它推动了整个破局。\n\n---\n\n### 字段生成指南\n\n#### 隐藏的死亡真相\n例如：主角费尽心思在爆炸前从司机的口袋偷到了记事本，发现上面写着“如果踩刹车，车上所有人都会彻底魂飞魄散”。原来撞车才是保护机制！\n\n#### 获取难度与代价\n这不是RPG开宝箱！在时空循环中，为了拿到这件普通的物品（比如前排乘客的一张残缺报纸），主角可能重试了20次，前19次都被乘客判定为“危险分子”反杀。要设计好每一次失败教训和最终精妙利用时间差的获取手段。',
  '## "Prop" Generation — Infinite Loop Horror\n\n...',
  @method_id, 1, 23, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 5. 组织/幕后黑手生成技能 (-org-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'infinite-loop-org-gen',
  '「失事源头/幕后黑手」生成：控制时间循环和灾难频发的邪恶核心',
  '"Organization" generation for Infinite Loop Horror',
  '## 「失事源头/幕后黑手」生成 — 无限循环公车流\n\n---\n\n### 字段生成指南\n\n#### 源头与灾难动机\n这是导致这一切无限死亡循环的根源。可以是某个对这个世界充满无尽恨意、导致列车出轨的疯子幽灵（个人执念导致的领域场）；也可以是阴曹地府新上线的拘魂列车意外装了个活人；又或者是个高维存在把公交当作鱼缸进行恐怖实验。\n\n#### 干扰手段与弱点\n他/它藏在普通乘客里。主角若进度太快，他会撕下伪装强行重置（通过杀掉主角清档）。他的弱点往往就是当年导致死亡的第一推动力（比如：把当年的那个炸弹扔出窗外，或者烧毁某张不该存在的车票）。',
  '## "Organization" Generation — Infinite Loop Horror\n\n...',
  @method_id, 1, 25, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);


-- ============================================================================
-- 6. 情节设计技能 (-plot-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'infinite-loop-plot-gen',
  '「情节设计」领域知识：为时间循环公车流提供读秒倒计时与试错推理剧情编排',
  '"Plot Design" domain knowledge for Infinite Loop Horror',
  '## 「情节设计」领域知识 — 无限循环公车流\n\n无限流最大的看点是通过试错获得的“全知全能（背板）”感，与发现“就算全知也由于武力值太弱打不过（解谜要素）”之间的绝望感冲突。\n\n---\n\n### 典型故事结构\n1. **被动处刑阶段（前三次重置）**：毫无防备的主角连怎么死的都不知道。展示车内乘客的麻木轮回。\n2. **背板与初次干涉（中段）**：利用读档优势，主角开始提前躲避伤害，改变车厢内的细节位置。这里爽点极强：主角像预言家一样指出10秒后大妈会掉苹果，30秒后玻璃会碎。\n3. **蝴蝶效应与反噬阶段**：主角自以为改变了进程，却引发了更不可测的更凄厉的团灭（例如原本正常的其他区域乘客变成了怪形冲过来）。让“已知”再次变为“未知”。\n4. **时间刺客与最终破局**：经过成百上千次的死亡模拟，像精密的齿轮一样在短短三分钟内完成一套完美的操作（骗过幽灵、偷走道具、刺杀司机），冲破时间循环。\n\n### 常见错误\n- ❌ 流水账。永远不要重复描写一模一样的重置。如果主角已经通关了前半段，下一次重生直接用“第17次重置，我闭着眼睛躲过了飞来的玻璃碎渣，直接走向了后排的那个女人”。',
  '## "Plot Design" Domain Knowledge — Infinite Loop Horror\n\n...',
  @method_id, 1, 30, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);


-- ============================================================================
-- 7. 实体命名技能 (-entity-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'infinite-loop-entity-naming',
  '实体命名：为包含车辆、车站名与死亡代号的公车空间流命名',
  '"Entity Naming": professional naming guidance for Infinite Loop Horror',
  '## 实体命名 — 无限循环公车流\n\n---\n\n## 一、车辆与站台命名\n\n- **原则**：用极度平庸的数字编号，赋予其毛骨悚然的死亡意义。\n- **示例**：K431次死亡列车、午夜44路公交、没有终点站的3号线。\n\n## 二、角色与代称\n\n- **原则**：在极度紧张的数次循环中，人是没有精力问别人全名的，通常只记住最强烈的特征作为代号。\n- **示例**：背红书包的自爆男、吐血的老头、无脸乘务员。主角如果在循环千百次后变得冷血，可以直呼别人身上的物品名或座位号（“你，3排B座的人肉盾牌”）。',
  '## Entity Naming — Infinite Loop Horror\n\n...',
  @method_id, 1, 36, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 8. 叙事写作技能 (-narrative)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'infinite-loop-narrative',
  '无限循环流正文写作指引：如何将时间切割到极细，写出压迫与背板爽感',
  'Narrative writing guidance for Infinite Loop Horror',
  '## 正文叙事写作指引 — 无限循环公车流\n\n公车循环流需要非常密集的动作描写与心理独白。主角每执行一个尝试死亡重置，就像玩《只狼》或《黑魂》一样经过了精确的时间计算。\n\n---\n\n### 一、核心描写技巧\n\n#### 1.1 精确的读秒感\n大量的加入时间的精确刻度。*“重置倒计时3分15秒。这个时候那个穿雨衣的人会上车，他的刀尖会在2秒后划过第一排。我必须在1分50秒前从后门冲到底盘下。”*\n\n#### 1.2 主角的异化与精神疲劳感\n描写那种“为了救一个无干人等已经被捅死50次”的麻木。从一个会尖叫的普通人，在几万字后变成一个动作如机械般利落精准、眼神冰冷疯癫的时空囚徒。\n\n### 二、多线交织的蒙太奇快切\n利用时间循环这一特性，可以在不同章节展现不同的试验路线（这局尝试与怨灵谈判，下局尝试武力突破，再下局尝试安静狗住）。通过闪回加快剪辑感。',
  '## Narrative guidance — Infinite Loop Horror\n\n...',
  @method_id, 1, 101, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 9. 小说命名技能 (-novel-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'infinite-loop-novel-naming',
  '小说命名：为在死亡和重置中挣扎的时间循环小说起书名',
  '"Novel Naming": title generation for Infinite Loop Horror',
  '## 小说命名 — 无限循环公车流\n\n---\n\n### 常见书名格式\n\n**格式一：数字与交通工具宣告式**\n- 结构：[死亡/绝命/无限] + 交通工具班次 + 倒计时\n- 示例：《死亡公交44路》、《无限列车：我在13号车厢卡了十年》、《航班惊魂：每天都要在天上死一次》\n\n**格式二：悬疑动作式**\n- 结构：主线解谜目标 + 循环设定\n- 示例：《第100次逃出这辆车》、《请在站台靠站前杀了我》\n\n### 内容简介结构\n直接砸悬念：从开头的第一次爆炸开始，交代主角已经在这个必死局中死了多少次。引出最终解题的一线曙光。不玩虚的，直接突出节奏快、脑洞大的特质。',
  '## Novel Naming — Infinite Loop Horror\n\n...',
  @method_id, 1, 35, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);
