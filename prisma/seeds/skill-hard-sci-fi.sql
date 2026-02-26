-- -----------------------------------------------------------------------------
-- 硬科幻 (Hard Sci-Fi) AI 生成技能 Layer 3 SQL
-- -----------------------------------------------------------------------------

SET @method_id = 75; 

-- ============================================================================
-- 1. 设定生成技能 (-setting-gen)
-- ============================================================================

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'hard-scifi-story-hook-setting-gen',
  '「科学危机钩子」设定生成：为硬科幻生成宏大却具有真实物理细节的灾难开端',
  '"Story Hook" setting generation for Hard Sci-Fi',
  '## 「科学危机钩子」设定生成 — 硬科幻流\n\n硬科幻最大的魅力在于将“冷酷的宇宙规律”具象化。危机不是某个怪物跑出来了，而是物理常数的崩塌。\n\n---\n\n### 字段生成指南\n\n#### 危机类型主导\n禁止魔幻色彩。不要出现“神明降临”、“恶魔苏醒”。\n推荐方向：太阳氦闪提前、基础粒子发生智子干扰、截获带着坐标的低频宇宙广播信号、地球突然停止自转导致的角动量灾难。\n\n#### 观测第一现场\n要有极强的科研写实感。第一批发现世界要完蛋的人，不是警察，而是射电望远镜的前沿观测员、或者是大型粒子对撞机前看着报错数据的理论物理学家。',
  '## "Story Hook" Setting Generation — Hard Sci-Fi\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'hard-scifi-world-setting-gen',
  '「世界观纪元」设定生成：基于现有理论推演数百年后的技术断代与社会形态',
  '"Worldview" setting generation for Hard Sci-Fi',
  '## 「宇宙纪元」设定生成 — 硬科幻流\n\n---\n\n### 字段生成指南\n\n#### 遵循热力学与基础定律\n这是硬科幻不可逾越的红线。\n必须基于某一条现实中已有的物理规律去放大。比如基于“费米悖论”推导出的黑暗森林法则；基于“相对论”写飞船接近光速后时间膨胀导致的回地球已经是百年后的沧海桑田。\n\n#### 人类社会形态演变\n面对四百光年外的三体舰队，人类花了200年演化出了什么畸形的时代？\n避免写简单的“变穷了/变富了”。社会科学在这种尺度下会极度冷血：如为了保证人类存续，颁布《逃亡法案》禁止太空建造轻型飞船；为了保证星际航行，推行冬眠配额制度切断血亲伦理。',
  '## "Worldview" Setting Generation — Hard Sci-Fi\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'hard-scifi-style-setting-gen',
  '「纪传体文风」生成：设定不带感情的数据式叙事、大尺度宏观对比描写',
  '"Writing Style" setting generation for Hard Sci-Fi',
  '## 「文风设定」生成 — 硬科幻流\n\n---\n\n### 字段生成指南\n\n#### 学术感与尺度描写\n要求文本像一部冰冷的科教书或者航海日志，少写个人情爱。大量的“以万吨计量推力”、“以光年计量距离”、“以百年为时间跳跃”。\n要把人类的感情放在四维尺度下压碎。比如：*“一串重力波扫过地球，两秒内，一千七百万个鲜活的生命化作了降维后厚度不到二维原子的平面壁画。这是不带恶意的毁灭，如同人类擦拭灰尘。”*',
  '## "Writing Style" Setting Generation — Hard Sci-Fi\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);


-- ============================================================================
-- 2. 角色生成技能 (-character-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'hard-scifi-character-gen',
  '「技术执行者」生成：生成不靠武力靠大脑算力拯救（或毁灭）世界的核心人物',
  '"Character" generation for Hard Sci-Fi',
  '## 「科学家群像记录」生成 — 硬科幻流\n\n硬科幻不存在个人英雄主义的神威，只有集体智慧与无情决策者的悲歌。\n\n---\n\n### 字段生成指南\n\n#### 职能必须专业化\n不能有“龙王”、“战神”。要生成如：应用研究中心第一物理实验室主任、纳米材料“飞刃”研发主理人、星际远航舰队的冬眠舱调度官。\n\n#### 面临的两难境地(电车难题)\n这是塑造科学家人性的核心抓手。作为理性的化身，他们被迫放弃人性。\n示例：主角作为飞船总控，在遭受追击时，为了减轻质量让飞船跃迁，他按下了按钮，把装有两万个休眠婴儿的3号舱脱钩抛向虚空。这是为了保留人类火种的“恶魔之举”。',
  '## "Character" Generation — Hard Sci-Fi\n\n...',
  @method_id, 1, 21, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 3. 场景生成技能 (-scene-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'hard-scifi-scene-gen',
  '「天体工程奇观」生成：生成戴森球、太空电梯、地下掩体市等极端巨构建筑',
  '"Scene" generation for Hard Sci-Fi',
  '## 「宏大天体工程场景」生成 — 硬科幻流\n\n硬科幻场景不需要花哨的魔法特效，它需要粗野宏大的巨大工业之美也就是工业巨物恐惧症（Megalophobia）。\n\n---\n\n### 字段生成指南\n\n#### 物理环境的极致写实\n描写环境不在于多美，而在于生存有多艰难。交代重力加速度、真空辐射、失重区。\n比如建造在奥林帕斯山（火星）的聚变反应堆，描写散热片巨大的阴影以及气闸舱门极低气压带来的嘶嘶漏气声。\n\n#### 场景规模设计\n推演跨度应是“行星级”甚至“恒星级”。\n设计如：由三万根碳纳米管绞合而成的赤道太空电梯；或者是将整个木星作为燃料库的行星发动机矩阵；用土星环碎片建成的太阳系防线碎片带。',
  '## "Scene" Generation — Hard Sci-Fi\n\n...',
  @method_id, 1, 22, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 4. 道具生成技能 (-prop-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'hard-scifi-prop-gen',
  '「核心科学理论装置」生成：生成理论严密的曲率引擎、降维武器或可控核聚变',
  '"Prop" generation for Hard Sci-Fi',
  '## 「核心科学装置设定」生成 — 硬科幻流\n\n科幻作品里的装置不是拿来砍人的，是用来改变文明进程参数的。\n\n---\n\n### 字段生成指南\n\n#### 伪科学运行原理（核心！）\n坚决不能写“吸收天地灵气”。必须使用大量物理和化学名词构建出“一本正经的胡说八道”。\n如【光粒发射器】：利用强大的强互作用力场剥夺物质除了质量之外的所有属性，并将其加速至99.999%光速。由于相对论效应它的质量将无限大，击穿恒星核心导致其瞬间超新星爆发。\n如【纳米切割丝】：只有几十个原子厚度的超强材料，静止悬停在巴拿马运河上可以把路过的游轮像切豆腐一样切成无数薄片。\n\n#### 技术瓶颈代价\n每一次技术跃迁都要死人或者是掏空地球。写出为了研发这个，有多少城市因能源配给断网停摆。',
  '## "Prop" Generation — Hard Sci-Fi\n\n...',
  @method_id, 1, 23, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 5. 组织生成技能 (-org-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'hard-scifi-org-gen',
  '「跨河系文明阵营」生成：为主理星际事务的联合国与深渊凝视的四维文明设定',
  '"Organization" generation for Hard Sci-Fi',
  '## 「星际阵营与文明层级」生成 — 硬科幻流\n\n---\n\n### 字段生成指南\n\n#### 对文明间差距的刻画\n不要写外星人开着飞碟和地球人拿激光枪“对射”。那是太空歌剧。\n硬科幻的文明打击应该是不对等的、碾压的、无法理解的“降维打击”与“物理规律武器”。它们连地球都不看一眼，而是随手扔一个改变光速的二向箔或者智子。\n\n#### 地球防御组织的内耗\n面对无法阻挡的浩劫时，地球防御阵营最大的敌人往往是人类自己的人性。\n生成如：激进主张放弃太阳系乘坐冬眠舱跑路的【舰队逃亡派】；主张将意识上传至超级服务器躲避肉身毁灭的【量子生命派】。',
  '## "Organization" Generation — Hard Sci-Fi\n\n...',
  @method_id, 1, 25, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 6. 情节设计技能 (-plot-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'hard-scifi-plot-gen',
  '「宏大纪事编排」领域知识：提供以数十年甚至光年为单位的危机纪元解局过程',
  '"Plot Design" domain knowledge for Hard Sci-Fi',
  '## 「情节推演」领域知识 — 硬科幻流\n\n抛开传统的小情小爱。时间线必须大刀阔斧，动辄“危机纪元后第十年”、“掩体纪年第六十年”。\n\n---\n\n### 典型故事推演结构\n1. **异象初现与基础物理学崩塌**：某个物理常数在实验中不再成立。大批科学家因此信仰崩塌自杀。引出那句令人绝望的“物理学不存在了”。\n2. **黑暗森林显现/全球绝望期**：通过天文望远镜确认了打击/灾害的到来时间（比如还要四百年）。人类社会经历大萧条、邪教横行与全球经济崩溃的至暗动荡。\n3. **面壁计划与绝地宏工程**：联合政府成立。人类集全球之力耗尽资源开启大撒网式的绝境计划（如逃亡计划、黑域堡垒计划）。通过几十年的重工业建造、冬眠技术的应用，将少部分主角冷冻推向未来。\n4. **时间跳跃与终极对冲**：主角在几百年后的太空舱醒来。前文明的宏大工程部分实现，但面临更高维度打击（如水滴到来）。此时不靠口炮，而是靠主角发现的某个微小的宇宙理论反转（例如发出引力波坐标恐吓对方）达成恐怖平衡。\n\n### 常见错误\n- ❌ 中途写大量的魔法玄幻因素修仙。',
  '## "Plot Design" Domain Knowledge — Hard Sci-Fi\n\n...',
  @method_id, 1, 30, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 7. 实体命名技能 (-entity-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'hard-scifi-entity-naming',
  '实体命名：抛除文学修辞，使用理论物理代号、计划项目编号和天体坐标系法则',
  '"Entity Naming": professional naming guidance for Hard Sci-Fi',
  '## 实体命名 — 硬科幻流\n\n真正的硬核力量，名字绝不花里胡哨，必须充满军工和实验室参数的冰冷感。\n\n---\n\n## 一、计划与阵营名词\n\n使用体制感极强的大词汇或冷门的学术词汇。\n- 【面壁计划】、【阶梯计划】、【联合国行星防御理事会】、【引力波威慑天线】。\n\n## 二、武器与飞船代号\n\n采用基本物理名词或者极其简单中立的词汇。\n外星碾压级武器不要叫“末日神罚炮”，要叫：【质子展开矩阵(智子)】、【水滴(强互相作用力宇宙探测器)】、【二向箔】。\n人类飞船命名应当充满人类黄金时代的文明遗迹感：【自然选择号】、【蓝色空间号】、【企业号恒星级战舰】。',
  '## Entity Naming — Hard Sci-Fi\n\n...',
  @method_id, 1, 36, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 8. 叙事写作技能 (-narrative)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'hard-scifi-narrative',
  '科幻长夜行文指引：如何用说明书般的白描刻画宇宙的黑暗森林冷酷真相',
  'Narrative writing guidance for Hard Sci-Fi',
  '## 宏大纪事正文写作指引 — 硬科幻流\n\n抛开主观情感的渲染。把宇宙当成一个无情的精密程序来写。\n\n---\n\n### 一、核心描写手段：视角的拉远与冷酷的造物感\n\n不要在刀光剑影上费时间，大量描写巨大机械体或天体的运作过程，仿佛在写一份绝密的航天航空说明书。\n*“发动机启动后五分钟。大地开始震动，这并非爆炸，而是等离子喷射柱喷涌而出产生的低频声波反坐。高达二十公里的托卡马克环形塔内，核聚变点亮了地球另一半的夜空。温度高达一亿度的蓝焰，硬生生将亚欧大陆板块向东推移了半公分。”*\n\n### 二、大时代下的人如蝼蚁\n不要写主角大哭大闹或者发表多热血的演讲。\n在描写伤亡时，只需给出一个冰冷的数字：*“随着水滴在十二分钟内的第三次锐角转向折返，联合舰队第二梯队的八百艘恒星级战舰的核聚变炉全数殉爆。人类用尽整个黄金时代积聚的三十万太空军，像黑暗中的金属碎屑般归于沉寂。”*',
  '## Narrative guidance — Hard Sci-Fi\n\n...',
  @method_id, 1, 101, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 9. 小说命名技能 (-novel-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'hard-scifi-novel-naming',
  '小说命名：为带有时代理性探讨、物理大尺度概念的科幻盛宴起书名',
  '"Novel Naming": title generation for Hard Sci-Fi',
  '## 小说命名 — 硬科幻流\n\n---\n\n### 常见书名格式\n\n**格式一：物理名词+诗意定语（最经典）**\n- 结构：[基础天文学名词/物理概念] + 宿命性的名词 \n- 示例：《球状闪电》、《时间回旋》、《海伯利安的远征》、《超新星纪元》\n\n**格式二：宏大坐标式**\n- 结构：地理坐标/时间纪元 + 科幻载体/事件\n- 示例：《2001太空漫游》、《银河系漫游指南》、《从地球到月球》\n\n### 内容简介结构\n无需卖惨逗乐，用极其精炼的口吻抛出一个物理悬念。像是一份绝密档案的开头。\n“公元2045年，全人类的射电望远镜同一天收到了一个来自半人马座阿尔法星的信号。信号极其简短，只有一个被加密了上亿次的质子数据包。\n翻译后的结果只有三个词汇：\n‘不要回答！不要回答！不要回答！’\n然而，地球联合政府的最高通讯器上，发送成功的倒计时，已经归零了……”',
  '## Novel Naming — Hard Sci-Fi\n\n...',
  @method_id, 1, 35, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);
