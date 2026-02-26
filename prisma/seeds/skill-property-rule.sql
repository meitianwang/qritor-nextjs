-- -----------------------------------------------------------------------------
-- 规则类物业/保安流 (Property/Security Rule-based Horror) AI 生成技能 Layer 3 SQL
-- -----------------------------------------------------------------------------

SET @method_id = 72; 

-- ============================================================================
-- 1. 设定生成技能 (-setting-gen)
-- ============================================================================

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'property-rule-story-hook-setting-gen',
  '「入职入住钩子」设定生成：为主线生成新保安/新租客的第一天诡异指南',
  '"Story Hook" setting generation for Property Rule Horror',
  '## 「入职/入住钩子」设定生成 — 规则类物业/保安流\n\n这类型小说的灵魂在于“第一眼看像正经规章制度，第二眼让人脊背发凉”。钩子必须极速给出这一矛盾感。\n\n---\n\n### 字段生成指南\n\n#### 切入身份与动机\n主角必须是弱势群体：缺钱的打工人、刚付完半年房租的租客，以此断绝“发现不对劲立马跑路”的可能性。\n\n#### 第一份异常守则\n必须写得像模像样但内容荒诞至极。例如：\n“1. 每天晚上23:00后，如果听到有人敲门并自称修水管，请将猫眼用黑胶布贴死，切勿回答。”\n“2. 本小区绝对没有养大型犬，若在绿化带看到四条腿爬行且戴着保安帽的生物，请扔给它一根骨头后立刻跑向保安亭。”\n\n#### 初遇破窗效应\n迅速安排一个不信邪的龙套（比如一个刚接班的愣头青），他不听劝告触犯了刚刚那条规则，然后主角通过监控或对讲机惨绝人寰地听到了他的下场，从而锁死主角只能遵守规则的紧迫感。',
  '## "Story Hook" Setting Generation — Property Rule Horror\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'property-rule-world-setting-gen',
  '「小区领域法则」设定生成：生成笼罩在小区背后的饲养场或污染区结构',
  '"Worldview" setting generation for Property Rule Horror',
  '## 「小区领域法则」设定生成 — 规则类物业/保安流\n\n---\n\n### 字段生成指南\n\n#### 领域本质与污染源\n小区不仅是居住的地方，它更像是封闭的罐头。外面的人进不来，里面的人以为自己还过着正常日子。污染源往往藏在极其日常的地方，比如中央空调通风口、永远无法排空的化粪池、或是半夜循环播放同一集动画片的电视机网络里。\n\n#### 规则的角力\n规则绝不是单一定制的，它往往充满矛盾：\n蓝衣物业告诉你：必须巡逻，保证楼道没有杂物。\n但在某个角落贴着的血字条却说：如果看到红衣服的人，把外卖箱堵在楼梯口，千万别让他们通畅下楼！\n主角就是要在这些打架的规则里找到真实生存法则。',
  '## "Worldview" Setting Generation — Property Rule Horror\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'property-rule-style-setting-gen',
  '「文风设定」生成：指导在群聊和日志中穿插荒诞感和恐怖氛围',
  '"Writing Style" setting generation for Property Rule Horror',
  '## 「文风设定」生成 — 规则类物业/保安流\n\n---\n\n### 字段生成指南\n\n#### 语言风格\n强推“工作日志报告”结合“失真监控第一视角”。极度克制，不渲染个人的恐惧，而是客观陈述不可名状的事情：\n*“例行巡查B区地下室。今晚发现3号车位停着一辆纸壳扎成的奔驰，车内有烧焦的肉味。已按《夜班守则第7条》，用消防水枪冲刷并关闭手电筒5分钟。”*\n\n#### 日常恐怖化描述\n强调将最生活化的场景（送外卖、按电梯楼层、丢垃圾）异化为高危核操作。不能用任何形容牛鬼蛇神的玄幻词汇（如厉鬼、妖气）。要用：扭曲的质感、不协调的肢体、黑漆漆的油污等。',
  '## "Writing Style" Setting Generation — Property Rule Horror\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);


-- ============================================================================
-- 2. 角色生成技能 (-character-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'property-rule-character-gen',
  '「人员管理档案」生成：生成被同化的业主与真假掺半的物业同事',
  '"Character" generation for Property Rule Horror',
  '## 「人员档案」生成 — 规则类物业/保安流\n\n在这个流派里，你不能相信任何人，包括给你发工资的队长。\n\n---\n\n### 字段生成指南\n\n#### 身份归属\n分为几类：\n- 守序中立：完全不知道小区异变的傻白甜业主（通常最后会成为诱饵）。\n- 混沌邪恶：已经彻底被同化、假装是邻居的“东西”（它会半夜敲门找你借酱油）。\n- 混沌中立/真假难辨：老保安或物业。他们给你活命的经验，但也可能随时把你卖掉去平息“它们”的怒火。\n\n#### 异常行为模式与判别特征\n设计角色的“判别真伪点”。这是主角保命的关键。如果是正常人，他敲门只敲三下；如果敲了四下，他就是“它”。如果是穿黑色制服的保安，他是人；如果是红色的，不要跟他说话直接跑。\n\n#### 当前污染度\n随着剧情发展，甚至主角的同事也会开始发生污染（比如眼睛慢慢变得浑浊失焦、开始重复说同一句话）。通过这个维度来展现时间线的紧迫感。',
  '## "Character" Generation — Property Rule Horror\n\n...',
  @method_id, 1, 21, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 3. 场景生成技能 (-scene-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'property-rule-scene-gen',
  '「异常楼栋与设施」生成：生成小区的隐藏禁区、电梯井及地下车库等',
  '"Scene" generation for Property Rule Horror',
  '## 「设施区域与楼栋」生成 — 规则类物业/保安流\n\n在小区里行走，比穿越雷区还要精密计算。\n\n---\n\n### 字段生成指南\n\n#### 区域名称与安全级别\n将小区拆分为无数个小区块。比如：保安亭（绝对安全区，但如果断电就完了）、4栋到5栋之间的林荫小道（条件安全，不能回头）、地下停车场的B3层（严重污染，没有呼吸生物能进去）。\n\n#### 专属互动规则\n为每一个特殊场景订造专属苟活方式：\n- 电梯：如果电梯层数跳到了不该存在的负4层，请一直按住关门键并背对电梯门，直到门完全打开又关上。\n- 垃圾房：倒垃圾时如果听到里面有咀嚼声，连通整个垃圾桶一起烧掉。',
  '## "Scene" Generation — Property Rule Horror\n\n...',
  @method_id, 1, 22, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 4. 道具生成技能 (-prop-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'property-rule-prop-gen',
  '「书面守则/记录源」生成：生成满是矛盾、血字涂改的通知书、工作日志',
  '"Prop" generation for Property Rule Horror',
  '## 「书面守则文献」生成 — 规则类物业/保安流\n\n不靠桃木剑和符咒，主角生存的唯一道具就是一页纸！\n\n---\n\n### 字段生成指南\n\n#### 守则条文细则与矛盾陷阱\n这是生成器最硬核的部分。\n设定 4-5 条规章制度。其中一定要混入一条足以致死的假规则。比如：\n正规守则第3款：“若听到求救声，请立刻拉响警报并关闭大门隔离。”\n被某种狂乱字体补充的红字涂鸦：“不要关大门！它们已经在门里面了！打开门放它们出去！”\n\n这让主角陷入绝境：听谁的？\n\n#### 载体材质\n材质暗示了写下它的人经历了什么。是保安室墙上被发黄胶带贴了十几层的打印纸？还是交接班记录本上用带血的指甲仓促抠出的字样？',
  '## "Prop" Generation — Property Rule Horror\n\n...',
  @method_id, 1, 23, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 5. 组织生成技能 (-org-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'property-rule-org-gen',
  '「阵营/物业管理层」生成：生成制定小区守则背后的隐势力',
  '"Organization" generation for Property Rule Horror',
  '## 「势力阵营」生成 — 规则类物业/保安流\n\n---\n\n### 字段生成指南\n\n#### 真实目的与行为准则\n整个小区可能就是一个巨型的筛选器/消化胃。最高管理层“物业公司总部”其实根本不是人开的，他们招募保安就像抛洒饵料，是为了填饱地下室沉睡的某个巨大的“它”。\n或者，这群黑心物业是在利用活人测试那些怪异的弱点。\n\n#### 敌友判断\n有时候，“它（怪物）”反而是在帮主角杀死了那些要致主角于死地的被同化同事；而发工资的队长，其实是在盘算今晚要把主角喂给哪个楼层。\n要让阵营之间的边界模糊、立场反转。',
  '## "Organization" Generation — Property Rule Horror\n\n...',
  @method_id, 1, 25, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 6. 情节设计技能 (-plot-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'property-rule-plot-gen',
  '「情节推演」领域知识：为规则类群聊体、守则探索提供解谜与存活升级编排',
  '"Plot Design" domain knowledge for Property Rule Horror',
  '## 「情节推演」领域知识 — 规则类物业/保安流\n\n这是一个完全依靠执行力、观察力和寻找规则系统BUG来过关的故事流派。\n\n---\n\n### 典型故事结构\n1. **入职培训与血的教训**：开头给出长达几千字的极其正经又极其悚然的《夜更保安守则》。当晚刚好有人犯戒，让主角从监控里见识什么叫物理抹杀。主角被迫认清现状苟住。\n2. **日常巡逻与规则拼图**：每天巡逻就是一次生化危机。在查水表、处理业主投诉中，收集散落在各楼层的血字纸条，发现第一套蓝字守则是陷阱。\n3. **规则冲突与死局**：同时触发两条相悖的规则（例如：保安亭内不能有活人以外的生物；但门外来了一群已经变异却拥有高级门禁卡的高管要求开门）。主角必须利用更高层的另一条规定（比如强制断电停摆系统），化解这次必死冲击。\n4. **洞悉核心，卡BUG逃生**：发现整个小区存在的真相，利用最顶级的规则漏洞（如：辞职不干、甚至成为最大的“它”的代言人）逃出生天。',
  '## "Plot Design" Domain Knowledge — Property Rule Horror\n\n...',
  @method_id, 1, 30, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 7. 实体命名技能 (-entity-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'property-rule-entity-naming',
  '实体命名：提供极其日常社区化、体制化的职称、守则与代号命名指导',
  '"Entity Naming": professional naming guidance for Property Rule Horror',
  '## 实体命名 — 规则类物业/保安流\n\n将恐怖藏在体制化、流程化、极其家常的名字里是最有效的恐怖谷效应。\n\n---\n\n## 一、职能、公告与守则\n\n不要起名《招魂秘籍》。而是用非常公文、死板的格式命名：\n- 《关于夜间电梯停用的告知书补充条款（绝密文件）》\n- 《幸福里小区绿化养护中心（特殊生物防治组）》\n\n## 二、人物与怪形\n\n用工作服颜色或者门牌号直接作为代称。\n- 蓝衣安保、带着红色臂章的保洁阿姨、“404的那些人”。\n- 怪物往往是以人类日常行为的异化命名，例如：一直在砸墙的租客、没有腿的外卖员、喜欢倒挂在天花板检查漏水的管道工。',
  '## Entity Naming — Property Rule Horror\n\n...',
  @method_id, 1, 36, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 8. 叙事写作技能 (-narrative)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'property-rule-narrative',
  '保安流正文写作指引：如何用公文体、监控视角及群聊记录制造后背发凉的惊悚',
  'Narrative writing guidance for Property Rule Horror',
  '## 规则怪谈正文写作指引 — 规则类物业/保安流\n\n文笔可以非常干瘪、机械化，不需要情绪渲染，只要“反常识”的细节和对环境极其精妙的抓阄感描写。\n\n---\n\n### 一、核心描写手段：监控器与无线电对讲\n\n主角绝大部分时间身处保安亭或监控室内。恐惧是通过极其受限的视觉源建立的。\n*“我看着二楼走廊探头传来的画面，李哥在跟什么东西一直点头哈腰，但他对面是一面墙。更可怕的是，对讲机里传来李哥极其清醒的请求：‘大门开关帮我按一下，有五批访客要进来。’”*\n\n### 二、业主群聊与大字报\n在文本中大段穿插微信群聊截图般的对话。\n比如：\nA业主：@物业王队长 你们能不能管管，14楼那家人大晚上在走廊生火烧烤是不是有病？肉味都飘我家来了，而且他们烤的肉好臭啊。\n\nB业主：不好意思啊，那是我老公，他今天火气比较大，我这就让他回去。\n\n（这里给读者的惊悚点是：14楼三天前刚发生一场焦尸火灾案，全家遇难。）通过看似家长里短的对话透出的死气来建立恐怖感。',
  '## Narrative guidance — Property Rule Horror\n\n...',
  @method_id, 1, 101, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 9. 小说命名技能 (-novel-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'property-rule-novel-naming',
  '小说命名：为守则调查员与在规则下战战兢兢的小区打工人生成书名',
  '"Novel Naming": title generation for Property Rule Horror',
  '## 小说命名 — 规则类物业/保安流\n\n---\n\n### 常见书名格式\n\n**格式一：警告式书名（最主流）**\n- 结构：[请勿/千万别] + 做某件极其日常的事 + / + 如果做了就面临某件绝对恐怖的事\n- 示例：《千万别在半夜给邻居开门》、《请勿直视夜班保安的眼睛》\n\n**格式二：岗位日志式**\n- 结构：伪装正经体制的地名 + 安保/岗位日志\n- 示例：《阳光小区夜更保安守则》、《404号楼物业管理日记》、《水族馆饲养员须知》\n\n### 内容简介结构\n无需长篇大论的世界观介绍。可以直接把第一章最恐怖、最离谱的一条规则作为简介。\n“为了三万块的高薪，我应聘了阳光小区的大夜班保安。队长第一天就告诉了我三条规矩：\n1. 本小区没有第十八栋楼，如果你看到了，立刻转身跑回值班室。\n2. 半夜如果有穿红衣服的中年妇女来交物业费，假装收下，第二天再把钱烧掉。\n3. 保安室绝对不可以……进活人。”',
  '## Novel Naming — Property Rule Horror\n\n...',
  @method_id, 1, 35, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);
