-- 惊悚乐园小说「副本」生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '惊悚乐园小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-jingsong-instance-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'jingsong-instance-gen',
  '「副本」生成：为惊悚乐园小说生成副本，涵盖恐怖主题深度解析、副本规则设计哲学、核心谜题方法论、恐怖元素分类、怪物设计原则、三幕式结构模板等完整体系',
  '"Dungeon/Instance" generation: generate dungeons for thriller park novels, covering horror theme analysis, rule design philosophy, core puzzle methodology, horror element classification, monster design principles, and three-act structure template',
  '## 「副本」生成 — 惊悚乐园小说

副本是惊悚乐园类小说的**核心叙事单元**——每一个副本都是一个独立的恐怖世界，有自己的主题、规则、谜题、怪物和通关条件。副本设计的质量直接决定了小说的质量。一个好的副本应该像一部精心设计的恐怖短片：有清晰的恐怖主题、自洽的内部规则、层层递进的谜题、令人印象深刻的恐怖存在、以及让玩家（和读者）感到"这个副本值得被攻略"的成就感。

副本设计的核心公式是：**恐怖主题 × 规则约束 × 谜题驱动 × 怪物威胁 = 沉浸式恐怖体验**。四个要素缺一不可——没有规则的恐怖是胡闹，没有谜题的副本是跑酷，没有怪物的恐怖是鬼故事会，没有主题的副本是杂烩。

---

### 字段生成指南

#### 副本名称

- 名称要有恐怖暗示或悬念感，让读者看到名字就产生好奇
- 好的命名：「永夜马戏团」「不归旅馆」「第七日」「最后一班地铁」「她的微笑」
- 差的命名：「恐怖副本1」「鬼屋挑战」
- 命名策略：意象式（"永夜"、"不归"）、倒计时式（"第七日"）、日常异化式（"最后一班地铁"）、反差式（"她的微笑"——看似温柔实则恐怖）
- 名称可以暗示副本的核心机制或最终反转

#### 恐怖主题

十二个选项的深度解析，每种主题都有独特的恐怖手法和经典素材：

| 主题 | 核心恐怖感 | 典型元素 | 经典素材参考 |
|------|----------|---------|------------|
| **鬼屋凶宅** | 空间封闭的压迫感 | 闹鬼房间、移动的家具、墙壁渗血、阁楼秘密 | 鬼屋类恐怖片的空间设计 |
| **都市传说** | 日常世界的裂缝 | 电梯游戏、深夜便利店、末班公交、网络怪谈 | 将网络流传的都市传说"实体化" |
| **密室逃脱** | 时间压力+空间限制 | 机关陷阱、倒计时、密码锁、死亡惩罚 | 密室逃脱游戏的极端恐怖化版本 |
| **诡异村庄** | 集体癫狂的恐怖 | 诡异风俗、集体沉默、献祭仪式、外来者排斥 | 民俗恐怖+封闭社区的异化 |
| **精神病院** | 理智边界的模糊 | 谁是病人谁是医生、幻觉与现实交错、药物控制 | 精神恐怖+认知扭曲 |
| **废弃学校** | 青春记忆的扭曲 | 课桌上的字迹、广播系统、七不思议、毕业照 | 校园怪谈的游戏化重构 |
| **灵异医院** | 生死边界的模糊 | 手术室、太平间、病历秘密、深夜查房 | 医疗恐怖+身体恐怖 |
| **恐怖电影重构** | 经典恐怖的meta体验 | 被困在恐怖电影中、剧情会改变、角色知道"剧本" | 打破第四面墙的meta恐怖 |
| **民间传说** | 文化深层的恐惧 | 鬼新娘、水鬼找替身、百鬼夜行、黄泉路 | 中日韩民间鬼怪传说的重构 |
| **末日求生** | 绝望与资源竞争 | 丧尸、病毒、末日倒计时、有限资源争夺 | 生存恐怖+人性考验 |
| **异度空间** | 认知崩塌的恐怖 | 非欧几何空间、时间循环、平行世界、因果倒错 | 克苏鲁式的认知恐怖 |
| **其他** | 自定义 | 不受限于以上分类 | 组合多种主题或开创新主题 |

选择主题时要考虑：该主题最核心的恐怖感是什么？如何让这种恐怖感贯穿整个副本？

#### 恐怖主题详情

- 当选择"其他"时必填，其他主题选填
- 用来补充该副本在通用主题基础上的**独特之处**
- 例如同样是"都市传说"主题，一个是"电梯游戏"，另一个是"深夜直播"——详情字段就是区分它们的关键
- 可以描述主题的独特变体、融合方向、或核心的恐怖意象

#### 难度等级

五个等级与副本复杂度的关系：

| 等级 | 规则复杂度 | 谜题数量 | 怪物威胁 | 生存率 | 适用节奏 |
|------|----------|---------|---------|--------|---------|
| **新手级** | 1-2条简单规则 | 1个核心谜题 | 低威胁，可被轻易规避 | 80%+ | 小说开局，让读者了解系统 |
| **普通级** | 3-4条规则，有些互相关联 | 2-3个谜题，有递进 | 中等威胁，需要注意规避 | 50-70% | 早期副本，建立紧张感 |
| **困难级** | 5+条复杂规则，有隐藏规则 | 3-5个谜题，环环相扣 | 高威胁，主动追杀 | 30-50% | 中期副本，考验角色能力 |
| **噩梦级** | 大量规则+规则会变化 | 多层谜题+误导信息 | 极高威胁，几乎无处可逃 | 10-30% | 后期副本，制造绝望感 |
| **地狱级** | 规则本身就是陷阱 | 谜题答案违反常识 | Boss级存在+小怪群 | <10% | 终极挑战，全书高潮 |

难度等级要与小说进度匹配——前期高难度会让读者觉得不合理，后期低难度会让读者失去兴趣。

#### 环境描述

- 环境是恐怖氛围的**第一载体**——玩家（和读者）进入副本后最先感受到的就是环境
- 描写要调动多感官：视觉（光线、色调、空间感）、听觉（背景音、异响）、嗅觉（气味）、触觉（温度、湿度）、直觉（说不清的不对劲）
- 环境要暗示副本的核心恐怖：鬼屋的幽暗封闭、精神病院的惨白荧光、废弃学校的寂静走廊
- 环境可以"变化"——随着副本推进，环境会恶化（灯光变暗、空间缩小、温度下降）
- **避免**只写"阴森恐怖"的抽象形容——要用具体的细节让读者"看到"这个空间

#### 副本规则

**这是副本设计中最关键的字段。规则即恐怖——好的规则本身就制造恐怖感。**

副本规则的设计哲学：
1. **规则即世界观**：规则定义了这个副本世界的运作方式（"这里的镜子能看到死者"、"说出死者名字他就会出现"）
2. **规则即限制**：规则限制了玩家的行动（"不能跑步"、"不能关灯"、"不能独处"），限制本身就制造紧张
3. **规则即谜题**：玩家需要通过观察和试错来发现隐藏规则（"为什么每次经过3楼就有人失踪？"）
4. **规则即恐怖**：最好的规则让人光是听到就觉得害怕（"晚上10点后，不要回头"、"如果有人敲门三次，第四次不是人"）

规则设计的具体技巧：
- **明确规则**（系统或NPC直接告知）：给玩家基本的生存指南
- **隐藏规则**（需要观察或有人牺牲后才发现）：制造恐怖和悬念
- **变化规则**（随着副本推进规则会改变）：打破玩家的安全感
- **矛盾规则**（两条规则看似冲突）：制造两难抉择
- 每个副本建议3-7条规则，太少没有约束感，太多记不住

#### 任务目标

- 清晰的通关条件——玩家需要做什么才能离开副本
- 任务目标可以分层：基础通关（存活到时间结束）→ 完美通关（解开核心谜题）→ 隐藏通关（发现隐藏线索）
- 任务目标本身可以是恐怖的：「找到第七个娃娃」「在午夜前把所有镜子翻过去」「活到天亮」
- 任务目标可以有误导——表面上的任务和真正的通关条件不同

#### 核心谜题

**核心谜题是驱动玩家（和读者）持续探索副本的动力。**

谜题设计的方法论：
1. **层层递进**：谜题不是一个大问题，而是一系列小发现逐渐拼凑出真相（碎片化叙事）。第一条线索引出第二条，第二条引出第三条...
2. **信息碎片**：答案分散在副本各处——墙上的涂鸦、NPC的只言片语、物品上的痕迹、环境的异常。收集碎片拼凑真相是核心乐趣
3. **反直觉谜面**：好的谜题答案不是一眼就能看出的——需要打破惯性思维。"门上写着''请勿敲门''不是因为里面有危险，而是因为敲门的人不是人"
4. **多解性**：同一组线索可能有多种解读——正确答案和错误答案都要合理，错误答案导致更危险的局面
5. **与恐怖主题契合**：谜题的内容和形式要与副本主题一致——鬼屋的谜题围绕房屋历史，都市传说的谜题围绕传说的真相

谜题的叙事功能：解谜过程就是揭示副本真相的过程——"为什么这里会闹鬼？"本身就是最大的谜题。

#### 恐怖元素

恐怖元素的四大分类和使用指南：

| 分类 | 恐怖机制 | 使用时机 | 示例 |
|------|---------|---------|------|
| **视觉恐怖** | 看到不该看到的东西 | 即时冲击，适合高潮 | 转角遇到的身影、镜中多出的人、墙壁上渗出的血迹 |
| **心理恐怖** | 不确定什么是真什么是假 | 持续压迫，贯穿全程 | 队友说的话前后矛盾、记忆与现实不符、"你确定你进来的时候是五个人吗？" |
| **氛围恐怖** | 说不清哪里不对但就是害怕 | 铺垫阶段 | 温度骤降、远处传来的歌声、总觉得有什么在跟着自己 |
| **认知恐怖** | 发现世界的底层逻辑不对 | 反转和高潮 | 意识到自己也是NPC、发现时间在循环、发现"出口"通向更深的副本 |

恐怖元素的节奏安排：氛围恐怖（铺垫）→ 视觉恐怖（第一次冲击）→ 心理恐怖（持续压迫）→ 认知恐怖（最终反转）。不要一上来就用最强的恐怖——要像交响乐一样有起伏。

#### 关键怪物或鬼怪

**怪物/鬼怪设计的核心原则：外形、能力、弱点、行为模式要形成闭环。**

设计要素详解：

1. **外形设计**：
   - 最好的恐怖不是"丑陋"而是"不对劲"——一个笑容僵硬的小女孩比满身血污的僵尸更恐怖
   - 外形要与副本主题和来历相关（溺亡者浑身湿透、烧死者焦黑扭曲）
   - 给怪物一个标志性的视觉特征（红色的眼睛、倒着走路、没有影子）

2. **能力设计**：
   - 能力要与来历和副本规则一致——不能凭空赋予能力
   - 能力要有明确的触发条件和作用范围（"只在黑暗中才能移动"、"听到名字才会追踪"）
   - 能力要能被玩家利用或规避——这是副本可攻略性的保证

3. **弱点设计**：
   - 弱点必须存在但不能太明显——太容易被发现就没有恐怖感
   - 弱点可以与来历有关（怕火的是冻死的、怕光的是暗处死去的）
   - 弱点的发现过程本身就是一个谜题

4. **行为模式**：
   - 怪物不应该是"随机出现随机攻击"——要有可被推理的行为规律
   - 行为模式给玩家提供了生存策略（"它每隔30分钟巡逻一次走廊"）
   - 行为模式可以在后期被打破——这是制造恐怖升级的手段

#### 隐藏线索

- 隐藏线索是奖励细心玩家（和读者）的"彩蛋"
- 线索可以关联当前副本的隐藏结局（发现真相后的不同通关方式）
- 线索可以关联全书主线（在某个副本的角落发现暗示系统真相的蛛丝马迹）
- 线索可以关联其他副本（某个副本的NPC提到的事件在另一个副本中得到解释）
- 铺设技巧：将线索藏在"不起眼但可以被注意到"的地方——NPC的一句话、墙上的一幅画、物品上的标记

#### 通关奖励

- 与副本难度成正比——越难的副本奖励越好
- 奖励类型：积分/货币、道具/装备、技能点、称号、信息（系统真相的碎片）
- 隐藏通关的奖励应该特别优厚，鼓励玩家深入探索
- 奖励可以有"代价"——获得强大道具但附带诅咒或副作用

#### 与主线关联

- 不是每个副本都需要与主线强关联——有些副本就是纯粹的恐怖体验
- 关联方式：副本中出现暗示系统真相的元素、遇到跨副本出现的神秘人物、发现与主角身世有关的线索
- 关联程度要渐进——前期副本关联微弱（一句话、一个符号），后期副本关联紧密（直接揭示系统秘密的一部分）

---

### 副本结构模板

**经典三幕式：探索 → 发现真相 → 决战/逃脱**

**第一幕：探索（占副本篇幅的40%）**
- 进入副本，感受环境氛围
- 接收明确规则，开始探索
- 发现第一批线索和谜题碎片
- 第一次恐怖遭遇（通常是氛围恐怖或视觉恐怖）
- 可能有第一个牺牲者（炮灰角色）

**第二幕：发现真相（占副本篇幅的35%）**
- 谜题开始拼凑成形
- 隐藏规则被发现（可能伴随牺牲）
- 恐怖升级——怪物开始主动追杀
- 角色之间的信任开始动摇
- 核心真相逐渐浮出水面（"原来这个副本是..."）
- 主角制定攻略/逃脱计划

**第三幕：决战/逃脱（占副本篇幅的25%）**
- 执行计划——但计划通常不会完美执行
- Boss战或最终逃脱
- 最终的牺牲和选择
- 通关结算——奖励和代价
- 可能有反转结尾（以为结束了但...）

---

### 恐怖主题的跨界融合

高级副本设计可以融合多种恐怖主题：
- 「废弃学校 × 恐怖电影重构」→ 被困在一部校园恐怖电影中
- 「都市传说 × 异度空间」→ 都市传说的空间居然是真实存在的另一个维度
- 「民间传说 × 末日求生」→ 民间传说中的鬼怪在现实中大规模出现
- 融合时要确定一个主主题、一个副主题——主主题定基调，副主题加变化

---

### 常见错误

1. **规则缺失或混乱**：副本没有明确规则，恐怖只靠怪物追人——没有规则的副本就是没有灵魂的跑酷场
2. **谜题与主题脱节**：恐怖主题是"鬼屋"，但谜题全是数学题——谜题内容必须与恐怖主题深度绑定
3. **怪物无规律**：怪物随机出现、随机攻击、没有弱点——不可被攻略的怪物只会让读者觉得"作者想杀谁就杀谁"
4. **恐怖元素单一**：全程只有Jump Scare式的视觉恐怖——好的副本要有多层次的恐怖体验
5. **难度标定失准**：标为"新手级"的副本难度堪比地狱级，或"地狱级"副本被轻松通关——难度要名副其实
6. **环境描写空洞**：只有"阴暗恐怖"四个字，缺乏具体的感官细节——环境描写是沉浸感的基础
7. **通关太容易或太随意**：通关条件模糊，或者主角"灵光一闪"就通关了——通关必须有逻辑链支撑
8. **隐藏线索太隐蔽**：线索藏得太深，读者完全察觉不到——隐藏线索是"可以被注意到但容易被忽略"的，不是"完全不可能被发现"的
9. **副本之间没有差异化**：每个副本都是"进去→被追→跑→通关"的同一套路——不同副本的核心体验应该有本质区别',
  '## "Dungeon/Instance" Generation — Thriller Park Novel

Dungeons are the **core narrative unit** of thriller park novels — each dungeon is an independent horror world with its own theme, rules, puzzles, monsters, and completion conditions. The design formula: **horror theme × rule constraints × puzzle-driven × monster threat = immersive horror experience**.

---

### Field Generation Guide

#### Dungeon Name (副本名称)
Names should evoke horror or suspense. Strategies: imagery-based ("Eternal Night Circus"), countdown-based ("The Seventh Day"), everyday-alienation ("Last Subway"), contrast-based ("Her Smile" — seemingly warm but terrifying).

#### Horror Theme (恐怖主题)
12 options with unique horror approaches: Haunted House (claustrophobic pressure), Urban Legend (cracks in daily life), Escape Room (time pressure + spatial limits), Eerie Village (collective madness), Asylum (blurred sanity), Abandoned School (twisted youth memories), Haunted Hospital (life-death boundary), Horror Film Reconstruction (meta-horror), Folk Tale (cultural deep fears), Apocalypse Survival (despair + resource competition), Alien Space (cognitive collapse), Other (custom).

#### Difficulty Level (难度等级)
Five levels affecting rule complexity, puzzle count, monster threat, and survival rate. Must match story progression — early dungeons are easier, late dungeons escalate.

#### Dungeon Rules (副本规则)
**Most critical field. Rules ARE horror.** Design philosophy: rules define worldview, create limitations, form puzzles, and generate fear. Include explicit rules (told directly), hidden rules (discovered through observation/sacrifice), evolving rules (change mid-dungeon), and contradictory rules (create dilemmas). Recommend 3-7 rules per dungeon.

#### Core Puzzle (核心谜题)
Methodology: progressive layers (clue chains), scattered information fragments, counter-intuitive solutions, multiple valid interpretations, and thematic consistency. The puzzle-solving process IS the truth-revealing process.

#### Horror Elements (恐怖元素)
Four categories: Visual (seeing what shouldn''t be seen — climax moments), Psychological (truth/fiction uncertainty — sustained pressure), Atmospheric (vague wrongness — buildup phase), Cognitive (broken world logic — final twist). Arrange as: atmosphere → visual → psychological → cognitive.

#### Key Monsters (关键怪物/鬼怪)
Design principles form a closed loop: Appearance (uncanny > ugly, related to origin), Abilities (consistent with rules, clear triggers and scope), Weaknesses (exist but not obvious, related to origin), Behavior Pattern (predictable rules that can break later for escalation).

#### Hidden Clues (隐藏线索)
Reward careful players/readers. Can link to: hidden dungeon endings, main story arc, other dungeons. Place in noticeable-but-easy-to-miss locations.

---

### Structure Template

Three-act structure: **Exploration (40%)** — enter, receive rules, first clues, first scare, possible first death. **Truth Discovery (35%)** — puzzles connect, hidden rules emerge, horror escalates, trust wavers, truth surfaces. **Showdown/Escape (25%)** — execute plan (imperfectly), boss fight or final escape, sacrifices, completion settlement, possible twist ending.

---

### Common Errors

1. Missing or chaotic rules — no rules means no soul
2. Puzzles disconnected from horror theme
3. Random monsters with no patterns or weaknesses
4. Single-type horror elements (only jump scares)
5. Mismatched difficulty labels
6. Empty environment descriptions lacking sensory details
7. Unclear or illogical completion conditions
8. Clues hidden too deeply to ever be noticed
9. No differentiation between dungeons — all follow the same pattern',
  (SELECT id FROM novel_creation_method WHERE name = '惊悚乐园小说' LIMIT 1),
  1,
  31,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  novel_creation_method_id = VALUES(novel_creation_method_id),
  is_active = VALUES(is_active),
  sort_order = VALUES(sort_order);
