-- -----------------------------------------------------------------------------
-- 楼道/电梯怪谈流 (Liminal Space/Elevator Horror) AI 生成技能 Layer 3 SQL
-- -----------------------------------------------------------------------------

SET @method_id = 74; 

-- ============================================================================
-- 1. 设定生成技能 (-setting-gen)
-- ============================================================================

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'stairs-elevator-story-hook-setting-gen',
  '「误入缝隙钩子」设定生成：为楼道/电梯怪谈生成极度日常与极度恐怖的割裂感',
  '"Story Hook" setting generation for Stairs/Elevator Horror',
  '## 「误入缝隙钩子」设定生成 — 楼道/电梯怪谈流\n\n这类型小说的灵魂是“原本安全的公共空间突然剥离”。主角必须在极其普通的日常生活行为中踩入死亡陷阱。\n\n---\n\n### 字段生成指南\n\n#### 触发情境\n必须是每个人都经历过的疲惫时刻。如下班后低头看手机进电梯、熬夜倒垃圾走过昏暗的防火通道。在这种身体防御机制最低的时候遭遇异变。\n\n#### 第一眼异常与空间错位的骤变\n异常必须是【违背物理常识】的，而不是直接跳出一只鬼。比如：\n电梯虽然在上升，但主角听到轿厢下方的风声消失了；按键楼层明明只有18层，显示屏却跳到了-4层。\n当电梯门打开时，外面本该是熟悉的家门，却变成了一条看不到尽头、两边全是太平间编号的走廊。这种“回不去家”的剥夺感是最恐怖的。',
  '## "Story Hook" Setting Generation — Stairs/Elevator Horror\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'stairs-elevator-world-setting-gen',
  '「阈限通道法则」设定生成：生成楼梯、电梯作为阴阳缝隙的空间运作规律',
  '"Worldview" setting generation for Stairs/Elevator Horror',
  '## 「阈限通道法则」设定生成 — 楼道/电梯怪谈流\n\n---\n\n### 字段生成指南\n\n#### 通道本质\n不要搞大范围世界末日。这个空间往往被称为“阈限空间（Liminal Space）”——一个没有目的地的过渡区域（比如永远停不下的电梯、走不完的旋转楼梯）。它就像是世界程序的BUG区，不仅有死人，还有被空间折叠吃掉的活人。\n\n#### 上下行法则与挣脱手段(生路)\n空间本身必须有如同数学题一样的严密规则。比如上楼梯时如果停顿，阶梯就会多出一级；电梯如果每层都停，就代表有看不见的东西在进出。主角的生路往往依赖这些精密且荒诞的规则：例如在第4层闭眼退着走出去，才能回到现实的人间。',
  '## "Worldview" Setting Generation — Stairs/Elevator Horror\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'stairs-elevator-style-setting-gen',
  '「文风设定」生成：指导生成带有幽闭恐惧症、几何错乱感的压抑描述',
  '"Writing Style" setting generation for Stairs/Elevator Horror',
  '## 「文风设定」生成 — 楼道/电梯怪谈流\n\n---\n\n### 字段生成指南\n\n#### 语言风格\n文字需要聚焦在“孤独”和“回响”上。主角往往是独自一人被困。环境极其安静，只有脚步声的回音或电梯缆绳的摩擦声。\n\n#### 光影与空间畸变描述\n不要写血肉模糊。写“无机物”带来的绝望。写昏黄永不改变的灯光、写楼道墙壁上发霉的斑点像某种活物、写无论怎么跑，下一层的楼梯转角长得都和上一层一模一样，那种《寂静岭》或是《后室(Backrooms)》般的空间恐惧。',
  '## "Writing Style" Setting Generation — Stairs/Elevator Horror\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 2. 角色生成技能 (-character-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'stairs-elevator-character-gen',
  '「缝隙游荡者」生成：生成电梯或楼道里遇到那些似人非人的乘客和诡异物',
  '"Character" generation for Stairs/Elevator Horror',
  '## 「缝隙游荡者档案」生成 — 楼道/电梯怪谈流\n\n在这个只有你一个活人的通道里遇到的人，十有八九是这片空间消化不了的残骸或是猎手。\n\n---\n\n### 字段生成指南\n\n#### 特征代称与非人特征\n他们最初看起来完全像晚归的正常人。但随着空间深入，主角会发现：\n【提红塑料袋的大妈】：一直站在电梯角落，当电梯上升，她塑料袋里滴下来的血是往上飘的。\n【跑楼梯的高中生】：无论主角往下跑多快，他永远在主角下方两层的拐角处笑着向上看，脖子扭曲了180度。\n\n#### 致命触发机制\n这类生物往往具有非常死板的“游戏规则”。只要你不回头、不应答，它就只能跟着你。主角要在极度的心理压力下控制自己的本能（如不看镜子、不咳嗽），这才是最有张力的情节。',
  '## "Character" Generation — Stairs/Elevator Horror\n\n...',
  @method_id, 1, 21, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 3. 场景生成技能 (-scene-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'stairs-elevator-scene-gen',
  '「无尽通道」生成：生成被拉长、扭曲、充满死循环的电梯井与安全通道',
  '"Scene" generation for Stairs/Elevator Horror',
  '## 「无尽通道场景」生成 — 楼道/电梯怪谈流\n\n空间本身就是最大的反派。\n\n---\n\n### 字段生成指南\n\n#### 物理表象篡改与环境压迫\n电梯门打开，不是楼层，而是一汪黑漆漆的深水，或者是一面布满指甲抓痕的水泥墙；\n消防通道的楼梯越往下走越窄，最后甚至必须四肢着地爬行，前方却出现了一张苍白的脸。\n\n#### 绝对禁忌\n为每个层级/通道设定死规矩。如：在第13层绝对不能睁开眼，听到任何熟悉的人叫你的名字都要往相反的方向走。',
  '## "Scene" Generation — Stairs/Elevator Horror\n\n...',
  @method_id, 1, 22, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 4. 道具生成技能 (-prop-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'stairs-elevator-prop-gen',
  '「缝隙遗落物」生成：生成前人留在电梯缝或台阶角落的警告与绝望遗物',
  '"Prop" generation for Stairs/Elevator Horror',
  '## 「缝隙遗落物道具」生成 — 楼道/电梯怪谈流\n\n在这个荒芜的地方，主角不是第一批受害者。\n\n---\n\n### 字段生成指南\n\n#### 物品名与异常现象\n如：电梯按钮面板后掉落的一张员工铭牌、被扔在楼梯拐角的半个摔碎的手电筒。这东西可能沾满锈迹，散发着老旧楼房下水道里的腥气。\n\n#### 逃生价值与持有风险\n比如手电筒一开，光打在墙上不仅能照亮台阶，还会照出平时看不见的无数个站着的人影（这是活下去的唯一导航，但要承受极大的精神污染掉SAN值）。这就逼迫主角在“瞎眼等死”和“睁眼看鬼苟活”中间抉择。',
  '## "Prop" Generation — Stairs/Elevator Horror\n\n...',
  @method_id, 1, 23, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 5. 组织生成技能 (-org-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'stairs-elevator-org-gen',
  '「掩盖缝隙的同谋」生成：生成知道真相却纵容楼道吃人的黑心物业或维保方',
  '"Organization" generation for Stairs/Elevator Horror',
  '## 「掩盖缝隙的活人团体」生成 — 楼道/电梯怪谈流\n\n除了鬼，最可怕的是同类把门给焊死了。\n\n---\n\n### 字段生成指南\n\n#### 团体名称与掩盖动机\n比如这栋大厦的开发商，当初挖地基挖出了不干净的东西，为了保住这栋天价商业楼，他们故意把左侧那部电梯修成了一个献祭口，每隔一段时间吃掉一个晚归的打工人来平息怨气。\n所以电梯里的求救按钮是假的，根本接不通安保室，只会放出一段带有洗脑频段的音乐。\n主角在逃生过程中一旦发现这层真相，故事立刻由灵异求生转入黑暗人性的博弈。',
  '## "Organization" Generation — Stairs/Elevator Horror\n\n...',
  @method_id, 1, 25, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 6. 情节设计技能 (-plot-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'stairs-elevator-plot-gen',
  '「情节推演」领域知识：为幽闭通道求生提供空间解密与心理崩溃抗争的大纲编排',
  '"Plot Design" domain knowledge for Stairs/Elevator Horror',
  '## 「情节推演」领域知识 — 楼道/电梯怪谈流\n\n这类型可以说是单人版的密室逃脱，极度考验体能和算计空间模型的能力。\n\n---\n\n### 典型故事推演结构\n1. **疲惫下班与误入深渊**：开始是非常日常甚至略显枯燥的电梯/楼梯下行描写，直到一个细微的逻辑错误（如数字跳错或停电）打破宁静。主角发现出不去了。\n2. **恐怖谷遭遇与试错**：第一波鬼怪试探。主角被逼无奈往下爬楼梯或者困在电梯轿厢内，必须在极简陋的环境里（黑暗、没有网）利用前任死者留下的规则保命。\n3. **绝境回档/空间折叠**：高潮时刻必定伴随着空间逻辑的暴动。比如主角历经千辛万苦爬到1楼，推开门发现外面不是大街，而是又一个更古老的电梯大堂（或者是时间回到了自己刚进电梯前，看着那时的自己进电梯）。\n4. **洞悉法则与破阵**：通过收集的血字、楼梯间墙壁上的涂鸦，解析出整栋楼的“八卦/莫比乌斯环”路线，倒着走、甚至冒死从高处跳下（跌入真实世界）来打破死局生还。\n\n### 常见错误\n- ❌ 中途忽然开始在电梯里结印打鬼。主角只能像《寂静岭》里一样被追赶、躲藏或者利用机关坑死怪物。',
  '## "Plot Design" Domain Knowledge — Stairs/Elevator Horror\n\n...',
  @method_id, 1, 30, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 7. 实体命名技能 (-entity-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'stairs-elevator-entity-naming',
  '实体命名：为缺乏安全感的公共交通空间及里面的不干净事物命名',
  '"Entity Naming": professional naming guidance for Stairs/Elevator Horror',
  '## 实体命名 — 楼道/电梯怪谈流\n\n完全抹除“人情味”和“故事感”，用极度工业和客观的代号。\n\n---\n\n## 一、区域名词\n\n完全使用没有温度的建筑词汇去指代最恐怖的地域。\n示例：【B4设备夹层】（这里堆满了尸体）、【无轿厢通道】、【第十三级台阶】、【维保盲区】。\n\n## 二、怪物与异象代号\n\n采用“特征+行为模式”的生硬称呼，避免给怪物起人名。\n示例：【倒挂的拖地者】（一个用湿漉漉长发在天花板拖行的怪物）、【电梯门后的第十四个人】、【模拟声控程序的敲击物】。一切听起来像是在描述某种故障的机器一样冰冷。',
  '## Entity Naming — Stairs/Elevator Horror\n\n...',
  @method_id, 1, 36, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 8. 叙事写作技能 (-narrative)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'stairs-elevator-narrative',
  '楼道空间流正文写作指引：摒除杂音，纯粹通过幽闭恐惧症和几何学狂乱制造压迫感',
  'Narrative writing guidance for Stairs/Elevator Horror',
  '## 空间缝隙怪谈正文写作指引 — 楼道/电梯怪谈流\n\n在这个只有你和未知存在的密闭盒子里，文字需要呈现出一种“缺氧感”。\n\n---\n\n### 一、核心描写手段：放大密闭空间的感官\n\n由于在电梯或窄楼梯间毫无退路，所有的感官被挤压到极致。\n*“轿厢突然卡在半空，灯管发出滋滋声后彻底熄灭。我的呼吸在狭小的金属盒子里回荡，但紧接着，我听到了第二种呼吸频率，就在我耳边的排气扇里，伴随着极重的腥臭味。”*\n\n### 二、错乱的几何学与逻辑崩溃\n空间怪谈的恐怖在于“常识的崩塌”。利用无限循环、违背重力的景象折磨主角的理智。\n比如主角往下走了五分钟的楼梯，往上抬头看时，却发现自己正对着刚才那一层自己的后脑勺。那种如同步入埃舍尔画作的疯狂感，远比突然跑出一只女鬼更让人绝望。',
  '## Narrative guidance — Stairs/Elevator Horror\n\n...',
  @method_id, 1, 101, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 9. 小说命名技能 (-novel-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'stairs-elevator-novel-naming',
  '小说命名：为无尽下坠的电梯求生夜和无限回廊起书名',
  '"Novel Naming": title generation for Stairs/Elevator Horror',
  '## 小说命名 — 楼道/电梯怪谈流\n\n---\n\n### 常见书名格式\n\n**格式一：数字迷阵与警告**\n- 结构：[别去/不存在的] + 楼层/特殊按键 \n- 示例：《千万别按电梯的18层》、《不存在的B4停尸库》、《下班后，别走那条防火通道》\n\n**格式二：现象陈述式**\n- 结构：日常动作 + 违和现象\n- 示例：《我在电梯里下坠了三天三夜》、《声控灯亮的时候它就回头》、《走不完的旋转楼梯》\n\n### 内容简介结构\n无需铺垫前因后果。直接把读者扔进密闭环境里。\n“今天加班到12点，我走进公司电梯按了负一楼。电梯正常下降，但两分钟过去了，门还没开，轿厢内显示它正在经过负18楼、负19楼……此时，顶部的通风口里突然滴下一滴冷冰冰的血粘在了我的鼻尖上。而电梯角落里，原本只有我一个人的镜子倒影中，那个人突然转过了身，对我笑了。”',
  '## Novel Naming — Stairs/Elevator Horror\n\n...',
  @method_id, 1, 35, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);
