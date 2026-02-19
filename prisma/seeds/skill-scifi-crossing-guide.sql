-- 未来科幻穿越创作方法专属 Skill / Sci-Fi Crossing creation method Skill
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '未来科幻穿越创作' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-scifi-crossing-guide.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'scifi-crossing-guide',
  '未来科幻穿越创作指南：涵盖科幻世界观构建、科幻子类选择、穿越设定差异、科技与设定模块、科幻角色种族/形态设计、反向金手指叙事、科学一致性管理与常见陷阱',
  'Sci-fi crossing novel writing guide: covers sci-fi worldview construction, sub-genre selection, crossing mechanism differences from fantasy, technology & setting module usage, character species/form design, reverse cheat-ability narrative, science consistency management, and common pitfalls',
  '## 未来科幻穿越创作指南

本指南为「未来科幻穿越创作」方法提供专属写作指导。本类型的核心前提是：**一个现代人穿越到未来世界**——与古代穿越类型截然相反，主角不是带着优势降临，而是以"原始人"的姿态闯入一个远超自己认知的文明。

**这是穿越类型中唯一一个"主角处于劣势"的子类型。** 理解这一点，是写好科幻穿越的关键。

---

### 一、类型特征与核心魅力

#### 1.1 科幻穿越 vs 其他穿越类型

| 对比维度 | 古代/历史穿越 | 未来科幻穿越 |
|----------|-------------|-------------|
| 主角优势 | 现代知识碾压古代 | 现代知识在未来近乎无用 |
| 核心冲突 | 如何隐藏穿越者身份 | 如何在陌生文明中生存 |
| 金手指方向 | 先知信息、现代科技 | 跨时代视角、人文精神 |
| 读者爽感来源 | 降维打击、改变历史 | 探索未知、逆境翻盘 |
| 世界构建重点 | 还原历史细节 | 想象未来科技与社会 |

#### 1.2 反向金手指：劣势即叙事张力

在古代穿越中，主角知道火药配方就能称霸；在科幻穿越中，主角连门怎么开都不知道。这种**认知落差**是本类型最核心的魅力：

- 主角不认识未来的文字、货币、交通工具
- 主角的专业技能可能已被 AI 完全替代
- 主角的身体素质可能远低于基因强化后的未来人
- 主角的道德观念可能与未来社会格格不入

**但主角并非毫无价值。** 现代人可能拥有：
- 未被科技异化的"纯粹人性"
- 跨时代的思维方式（在 AI 主导的社会中，"非理性"反而是优势）
- 失落知识（某些被遗忘的历史、文化或技术）
- 适应力和求生本能（不依赖科技的生存能力）

#### 1.3 类型核心问题

每部科幻穿越小说都应回答一个哲学问题：

- 当科技改变了一切，什么才是"人"？
- 文明进步的代价是什么？
- 过去的人类与未来的人类，还是同一个物种吗？

---

### 二、科幻世界观设定（singleton，最重要的设定）

科幻世界观是整个故事的基础设施。每个字段都会深刻影响后续的角色设计、剧情走向和科技逻辑。

#### 2.1 科幻子类

这是最先确定的选项，因为它决定了整个世界的基调：

| 科幻子类 | 世界特征 | 适合的故事类型 |
|----------|---------|--------------|
| **赛博朋克** | 高科技低生活，企业垄断，贫富极端分化 | 反乌托邦、底层逆袭、企业阴谋 |
| **太空歌剧** | 星际文明，多种族共存，宏大政治格局 | 星际冒险、种族战争、帝国兴衰 |
| **硬科幻** | 严格遵循科学原理，技术细节真实 | 科学探索、技术难题、理性推理 |
| **废土末世** | 文明崩溃后的世界，资源匮乏 | 生存挣扎、重建文明、人性考验 |
| **时空穿越** | 多时间线/平行世界，因果悖论 | 悬疑推理、时间修复、自我对话 |
| **异星文明** | 外星种族的社会与文化 | 文化碰撞、外交博弈、哲学思辨 |
| **AI 觉醒** | 人工智能获得意识，人机关系重构 | 伦理困境、共存探索、控制与自由 |
| **生化变异** | 基因改造导致的新人类/新物种 | 身份认同、种族矛盾、进化方向 |
| **银河帝国** | 跨星系的庞大政治实体 | 宫廷权谋、帝国兴衰、边疆叛乱 |

**选择建议**：科幻子类不是孤立的，可以组合使用。例如"赛博朋克 + AI 觉醒"或"太空歌剧 + 银河帝国"。但主子类要明确，它决定了世界的主基调。

#### 2.2 文明等级

文明等级决定了科技天花板和社会复杂度：

| 等级 | 特征 | 对穿越者的影响 |
|------|------|--------------|
| **0 级（原始）** | 接近现代水平或略高 | 穿越者适应难度低，冲突更多来自社会层面 |
| **1 级（行星级）** | 完全掌控母星资源和环境 | 穿越者在科技方面全面落后 |
| **2 级（恒星级）** | 能利用恒星能量，星际殖民 | 穿越者像原始人闯入现代城市 |
| **3 级（星系级）** | 掌控整个星系 | 穿越者几乎无法理解这个世界 |
| **神级** | 超越物理法则 | 穿越者与"神"共存，本质上是哲学故事 |

**关键提示**：文明等级越高，穿越者的劣势越大，但故事的想象空间也越大。建议新手选择 0-1 级，有经验的作者尝试 2 级以上。

#### 2.3 核心科技

核心科技是世界观的"科技树主干"。设计核心科技时要遵循三个原则：

1. **内部一致性**：如果有了光速旅行，通信技术不可能还停留在无线电
2. **社会影响**：每项核心科技都必须对社会形态产生影响（意识上传 → 死亡的定义改变）
3. **与子类匹配**：赛博朋克的核心科技应该是义体/脑机接口，而非星际引擎

**填写建议**：列出 3-5 项核心科技，每项注明原理概述和社会影响。不需要写成论文，但要确保逻辑自洽。

#### 2.4 社会形态

社会形态必须与文明等级和核心科技匹配：

| 核心科技 | 可能的社会形态 |
|----------|-------------|
| 意识上传 | 虚拟与现实双层社会，"数字公民"概念 |
| 基因编辑 | 基因阶级制度，"纯人类"歧视问题 |
| 强 AI 管理 | AI 治理的效率社会，人类的角色重定义 |
| 星际殖民 | 松散联邦或帝国体制，星球间的文化差异 |
| 能量革命 | 后稀缺社会，新的社会矛盾不再是物质而是意义 |

**常见错误**：科技设定很先进，但社会形态还是现代民主制度——不可能。科技会从根本上重塑社会结构。

#### 2.5 能源体系

能源体系是容易被忽视但极其重要的设定：
- 它决定了文明的天花板（能源不够，星际旅行就是笑话）
- 它是许多剧情冲突的来源（能源争夺、能源垄断、能源危机）
- 它影响日常生活的细节（用什么充电、如何供暖、交通方式）

#### 2.6 对于人类的定义

这是科幻穿越特有的哲学设定字段：
- 义体改造到什么程度还算人类？
- 意识上传后的数字存在是否是人？
- 基因改造后的新人类是否还是同一物种？
- AI 仿生人是否有人权？

**这个字段直接影响主角的处境**：如果"纯人类"在未来世界是少数群体甚至被歧视的对象，穿越者的身份本身就是最大的冲突来源。

---

### 三、穿越设定（singleton）

#### 3.1 穿越方式：科幻机制 vs 奇幻机制

科幻穿越的穿越方式必须有科学（或伪科学）解释，这是与奇幻穿越的根本区别：

| 穿越方式 | 特点 | 叙事影响 |
|----------|------|---------|
| **人体冷冻苏醒** | 最硬核，有现实科学基础 | 主角身体物理存在，身份可追溯 |
| **时间机器故障** | 经典科幻设定 | 可以引入"回去"的可能性作为悬念线 |
| **意识上传网络** | 赛博朋克风格 | 主角可能没有肉体，身份认同成核心冲突 |
| **虫洞穿越** | 太空歌剧风格 | 穿越的不可控性，可能跨越巨大时空距离 |
| **高维文明实验** | 软科幻/哲学向 | 存在"被观察"的紧张感，为什么被选中？ |
| **平行宇宙置换** | 多元宇宙设定 | 可能有另一个自己的存在，身份冲突 |
| **系统传送** | 最接近奇幻，但可用科技包装 | 系统的背后是谁？为什么传送主角？ |

**重要区别**：奇幻穿越的"魂穿"在科幻语境下不适用。科幻穿越需要回答"穿越的物理机制是什么"。即使是最软的科幻，也需要一个看起来合理的技术框架。

#### 3.2 时间跨度

时间跨度影响穿越者与未来世界的差距程度：

| 跨度 | 世界变化程度 | 穿越者处境 |
|------|-----------|----------|
| 50-100 年 | 技术代差明显，但文化尚有延续 | 适应难度中等，像"爷爷辈的人" |
| 100-500 年 | 社会形态巨变，语言可能已有重大变化 | 适应难度高，文化冲击剧烈 |
| 500-1000 年 | 几乎是全新文明 | 主角如同原始人 |
| 1000 年以上 | 可能已非地球文明 | 极端鱼脱离水的状态 |

#### 3.3 穿越身份

穿越身份决定了主角在未来社会的起始处境：

| 穿越身份 | 处境特点 | 叙事可能性 |
|----------|---------|----------|
| **非法移民** | 没有合法身份，被追捕 | 底层生存、身份伪造、地下社会 |
| **企业继承人** | 高起点但充满阴谋 | 权力斗争、企业政治、身份质疑 |
| **拾荒者** | 自由但危险的边缘生存 | 废土探索、发现秘密、逐步崛起 |
| **通缉犯** | 被误认或被嫁祸 | 追逃、洗冤、揭露阴谋 |
| **实验体** | 被研究/利用的对象 | 逃脱、反抗、发现真相 |
| **活化石** | 作为历史遗迹被保护/展览 | 从"展品"到"行动者"的转变 |
| **AI 载体** | 意识被植入 AI 系统 | 身份认同、虚实边界、觉醒叙事 |

#### 3.4 核心目标

核心目标是主线剧情的驱动力：

| 核心目标 | 叙事核心 | 情感基调 |
|----------|---------|---------|
| **回家路** | 寻找穿越回去的方法 | 乡愁、执着、最终的取舍 |
| **推翻公司** | 反抗垄断企业/暴政 | 热血、正义、革命叙事 |
| **探索真相** | 发现穿越的原因或世界的秘密 | 悬疑、层层剥茧 |
| **种族存续** | 拯救纯人类/某个种族 | 使命感、牺牲精神 |
| **星际主宰** | 权力野心、称霸星系 | 爽文、战略博弈 |
| **失落文明** | 寻找/恢复被遗忘的文明遗产 | 考古、探索、文化传承 |

#### 3.5 金手指类型与金手指详情

科幻穿越的金手指设计需要特别注意——主角的"金手指"不应该是碾压未来世界的武器，而应该是**填补认知差距的工具**或**提供独特视角的能力**：

| 金手指类型 | 定位 | 设计要点 |
|-----------|------|---------|
| **超脑** | 增强学习/计算能力 | 帮助主角快速适应未来，但不让主角比未来人更聪明 |
| **纳米核心** | 体内纳米机器人 | 提供身体改造的起步能力，但无法与专业义体人对抗 |
| **外星科技库** | 知识数据库 | 提供另一条科技路线的知识，而非更高级的同类科技 |
| **基因编辑器** | 自我基因改造 | 慢慢缩小与强化人的差距，但有风险和副作用 |
| **预知** | 有限的未来片段 | 提供战术优势而非战略碾压 |
| **机械掌控** | 控制机械设备的能力 | 在高度自动化的社会中是双刃剑 |
| **位面交易系统** | 跨位面的资源获取 | 可以获得稀缺物资但有代价 |
| **无** | 纯靠主角自身 | 最硬核的写法，适合硬科幻，所有能力来自学习和适应 |

**金手指详情**中需要明确：具体能力表现、获取方式、使用限制、成长路线、与科幻世界观的兼容性。

---

### 四、科技与设定模块（自定义实体类型）

「科技与设定」是本创作方法的**自定义实体类型**，属于 technology 类别，是**非 singleton 的**——你可以创建多个条目来构建完整的"科技圣经"。

#### 4.1 为什么需要这个模块

科幻小说的世界观严重依赖科技设定的一致性。将每项关键科技/设定独立建档，可以：
- 避免科技设定前后矛盾
- 为剧情冲突提供素材库
- 帮助维护"硬科幻"的逻辑严谨性
- 在写作过程中快速查阅参考

#### 4.2 字段使用指南

**名称**：给每项科技/设定一个简洁明确的名字。

**类别**（6 种可选）：

| 类别 | 说明 | 示例 |
|------|------|------|
| **武器装备** | 战斗相关的科技 | 等离子步枪、纳米护盾、义体战斗模块 |
| **交通载具** | 移动和运输科技 | 反重力悬浮车、曲率引擎飞船、传送门 |
| **生物科技** | 与生命相关的科技 | 基因编辑疗法、意识备份、克隆技术 |
| **信息技术** | 数据和通信科技 | 脑机接口、量子通信、全息投影 |
| **理论概念** | 科学理论和假说 | 暗物质引擎原理、意识量子化理论 |
| **历史事件** | 影响世界格局的重大事件 | 第三次世界大战、AI 觉醒事件、首次星际接触 |

**原理/设定**：描述这项科技/设定的运作方式或背景。硬科幻需要详细的技术原理；软科幻可以用模糊但自洽的描述。

**功能/影响**：这项科技对世界和角色的具体影响。务必思考两方面：
- **直接功能**：它能做什么
- **社会影响**：它如何改变了社会、经济、伦理或日常生活

#### 4.3 构建科技圣经的推荐流程

1. **从核心科技出发**：先根据科幻世界观中的「核心科技」字段，创建 3-5 个核心科技条目
2. **推导衍生科技**：每项核心科技都会催生衍生应用，创建次级条目
3. **补充历史事件**：创建那些塑造了当前世界格局的重大事件
4. **添加对剧情有影响的特定科技**：主角会使用或遭遇的具体科技
5. **交叉验证**：检查所有科技条目之间是否存在逻辑矛盾

**示例**：
```
核心科技：意识上传
  ├─ 衍生 - 信息技术：意识云存储网络
  ├─ 衍生 - 生物科技：意识载体克隆技术
  ├─ 衍生 - 理论概念：意识连续性悖论
  ├─ 衍生 - 历史事件：第一例意识上传实验（公元 2187 年）
  └─ 剧情相关 - 武器装备：意识病毒（可以攻击上传意识）
```

---

### 五、科幻角色设计

本创作方法的角色类型名为「科幻角色」，包含专门针对科幻语境设计的字段。

#### 5.1 种族/形态：核心身份标识

种族/形态是科幻角色最关键的属性之一，每种选择都携带深层叙事含义：

| 种族/形态 | 身份含义 | 与穿越者的关系 |
|-----------|---------|-------------|
| **纯人类** | 未经改造的自然人，可能是少数群体 | 穿越者的天然同类，但可能存在时代隔阂 |
| **义体改造人** | 用机械部件替换/增强肉体 | 穿越者眼中的"半人半机"，挑战"人"的定义 |
| **基因强化人** | 通过基因编辑获得超人能力 | 外表像人但能力远超穿越者，引发不平等议题 |
| **强 AI 仿生人** | 高度拟人的人工智能 | 穿越者能否区分 AI 和人？信任问题 |
| **外星种族** | 非地球起源的智慧生命 | 完全陌生的思维方式和价值观 |
| **意识体** | 无肉体、纯数字化存在 | 挑战穿越者对"生命"的基本认知 |

**设计要点**：种族/形态不仅是外观标签，更决定了角色的行为逻辑、社会地位和价值观。一个义体改造人对"身体"的理解与纯人类截然不同。

#### 5.2 姓名设计

科幻角色的命名需要反映世界观：
- 纯人类可以沿用现代命名习惯
- 义体人/基因人可能使用代号+本名的组合
- AI 仿生人可能有序列号式名称
- 外星种族需要设计一套命名规则
- 意识体可能用网络 ID/代码名称

#### 5.3 生命周期

在科幻世界中，"生命周期"的含义更加复杂：
- 意识上传者可能"永生"
- 义体人可以不断更换零件
- 基因强化人寿命可能是普通人的数倍
- AI 仿生人的"寿命"取决于维护

**对穿越者的冲击**：主角可能是房间里唯一一个会自然老死的存在。

#### 5.4 阵营/所属势力

科幻世界的势力格局可能包括：
- 跨星系企业/财团
- 行星政府/星际联盟
- 地下抵抗组织
- AI 集合体
- 纯人类保护区/飞地
- 宗教/哲学团体
- 海盗/佣兵组织

**注意**：本创作方法的 visible_categories 不包含 organization。势力关系通过角色的「阵营/所属势力」字段来表达，以及角色之间的关系网络。

#### 5.5 职业/身份

科幻世界的职业体系与现代截然不同：
- 许多现代职业已被 AI 取代
- 新职业可能包括：意识导航员、基因调律师、虚拟现实建筑师、星际跃迁驾驶员、数据猎人
- 职业与种族/形态之间可能存在壁垒（某些职业只有义体人才能胜任）

#### 5.6 人类身份的核心议题

在角色设计中始终要思考"什么定义了人类"：
- 主角作为"纯人类"穿越者，在角色互动中自然引发这个问题
- 不同种族/形态的角色对"人类"有不同定义
- 这个议题可以是整部小说的暗线

---

### 六、科学一致性管理

#### 6.1 硬科幻 vs 软科幻的一致性标准

| 维度 | 硬科幻要求 | 软科幻要求 |
|------|----------|----------|
| 科技原理 | 必须基于已知科学或合理推演 | 可以模糊处理，但不能自相矛盾 |
| 社会推演 | 严格的因果链推导 | 选择性推演，聚焦故事需要的方面 |
| 数据精度 | 距离、速度、能量等需合理 | 不需要精确数值，但量级要对 |
| 解释深度 | 读者应能理解技术如何运作 | 点到为止，不影响阅读节奏 |

#### 6.2 科技设定自洽检查清单

在完成科幻世界观和科技与设定模块后，进行以下检查：

- 核心科技之间是否存在矛盾？（如：有了传送门，为什么还需要飞船？）
- 文明等级与核心科技是否匹配？（1 级文明不应拥有星系级科技）
- 社会形态是否合理反映了核心科技的影响？
- 能源体系是否能支撑所列出的科技？
- 对于人类的定义是否与种族/形态设定一致？
- 穿越者的金手指是否在科技体系内可解释？

#### 6.3 "一个谎言"原则

优秀的科幻遵循"一个谎言"原则——你可以假设一项不存在的科技（如超光速旅行），但从这项假设出发的所有推论必须严格合理。科技与设定模块就是帮你管理这些推论的工具。

---

### 七、叙事结构

科幻穿越小说的叙事结构与其他穿越类型有本质差异，因为主角的弧光是**从无知到理解**，而非**从弱到强**。

#### 7.1 推荐叙事框架

```
穿越降临 → 文化冲击 → 挣扎求生 → 发现真相/阴谋 → 利用跨时代视角 → 改变未来
```

| 阶段 | 叙事目标 | 章节占比建议 |
|------|---------|------------|
| **穿越降临** | 穿越发生，展示未来世界的第一冲击 | 5-10% |
| **文化冲击** | 主角面对完全陌生的世界，处处碰壁 | 15-20% |
| **挣扎求生** | 艰难适应，建立最初的人际关系 | 15-20% |
| **发现阴谋** | 发现未来世界的深层问题或穿越的真相 | 20-25% |
| **跨时代视角** | 利用现代人的独特视角提出解决方案 | 15-20% |
| **改变未来** | 最终对决/改变世界，完成核心目标 | 10-15% |

#### 7.2 开篇设计

**前三章的黄金法则**：

- **第 1 章**：穿越发生。不需要冗长的现代生活铺垫，快速进入未来世界。用主角的困惑和震撼让读者身临其境。
- **第 2 章**：第一次文化冲击。主角尝试做一件简单的事（比如买东西、问路），却发现完全不知道怎么做。展示穿越者的"劣势"。
- **第 3 章**：第一个盟友或第一个危险。主角遇到第一个愿意帮助的人，或者陷入第一个危机。故事正式启动。

#### 7.3 文化冲击阶段的写法

这是科幻穿越最有特色的阶段，也是最容易出彩的部分：

**重点展示的文化差异**：
- 语言变迁（即使是同一种语言，几百年后也会面目全非）
- 社交礼仪（打招呼的方式、尊敬的表达、禁忌话题）
- 价值观冲突（隐私概念、身体自主权、对死亡的态度）
- 日常科技（不会用基本设备、不理解常识）
- 人际关系模式（人与 AI 的关系、虚拟社交 vs 物理社交）

**技巧**：通过主角的视角来展示未来世界，让读者与主角一起"发现"和"震惊"。这比直接用旁白描述更有代入感。

#### 7.4 中段节奏：从适应到行动

中段的关键转折是：主角从**被动适应**变为**主动行动**。

触发这个转折的常见方式：
- 发现穿越背后有人为操控
- 发现未来社会的某个不公正
- 遇到与自己同时代的其他穿越者
- 金手指觉醒或升级
- 某个重要角色的遭遇触动了主角

#### 7.5 利用跨时代知识

这是"反向金手指"变成"正向优势"的阶段。现代人在未来世界的优势不是科技碾压，而是：

- **失落的知识**：某些被战争/灾难毁灭的古代知识，只有穿越者还记得
- **人文视角**：在一个过度理性化的社会中，"感性"和"人文关怀"反而稀缺
- **创造性思维**：不依赖 AI 的思考方式可能产生意想不到的创新
- **历史教训**：知道人类曾经犯过的错误，可以预警未来即将重蹈的覆辙

---

### 八、可见模块类别与推荐创建流程

本创作方法的 visible_categories 包含：

| 类别 | 用途 |
|------|------|
| **setting** | 科幻世界观（singleton）、穿越设定（singleton） |
| **character** | 科幻角色管理（区分不同种族/形态） |
| **technology** | 科技与设定（非 singleton，构建科技圣经） |
| **plot** | 剧情管理 |

**注意**：本方法不包含 chapter、organization、scene 类别。势力关系通过角色的「阵营/所属势力」字段表达。

#### 推荐创建顺序

1. **科幻世界观**：科幻子类 → 文明等级 → 核心科技 → 社会形态 → 能源体系 → 对于人类的定义
2. **科技与设定**：根据核心科技创建 5-10 个条目，构建科技圣经
3. **穿越设定**：穿越方式 → 时间跨度 → 穿越身份 → 核心目标 → 金手指
4. **角色**：主角（穿越者）→ 核心盟友 → 主要对手 → 关键配角
5. **剧情**：主线规划 → 各阶段关键事件 → 高潮与结局

---

### 九、常见陷阱与避坑指南

#### 9.1 科技设定自相矛盾

**问题**：不同场景中同一科技的表现不一致（例如能量护盾一会儿能挡住导弹，一会儿被拳头打碎）

**解决**：
- 在科技与设定模块中为每项科技建档，明确其能力边界
- 写作前查阅相关条目，确保一致
- 对于复杂科技，在「原理/设定」字段中写明强弱条件

#### 9.2 社会形态不匹配文明等级

**问题**：3 级文明的社会组织方式跟现代地球一样（民主选举、资本主义市场经济）

**解决**：
- 每当提升文明等级，都要重新审视社会形态的合理性
- 参考科幻世界观中「社会形态」字段的描述
- 思考：这项核心科技会如何从根本上改变人类的组织方式？

#### 9.3 主角适应太快

**问题**：穿越到 500 年后的未来，三章之内就完全适应了——这不合理，也浪费了最好的叙事素材。

**解决**：
- 文化冲击阶段至少占全文 15-20%
- 适应是渐进的：先适应基本生存 → 再适应社交规范 → 最后理解深层文化
- 始终保留一些"永远无法完全适应"的差异，这是穿越者身份的持续标记

#### 9.4 忽略"反向金手指"的叙事价值

**问题**：急于让主角变强，跳过了劣势阶段，把科幻穿越写成了普通升级文。

**解决**：
- 主角的劣势本身就是最好的故事——一个现代人连门都打不开的窘迫比任何战斗场面都吸引读者
- 每次"克服劣势"都应该是一个小高潮
- 即使到后期，主角也不应该完全消除与未来人的差距

#### 9.5 科幻设定沦为装饰

**问题**：写了很多酷炫的科技设定，但这些设定对剧情毫无影响，换成任何背景都能讲同一个故事。

**解决**：
- 每项科幻设定都必须至少在一个关键剧情中发挥作用
- 核心冲突必须与科幻设定直接相关（不能是一个披着科幻皮的言情/打怪故事）
- 科技与设定模块中的「功能/影响」字段就是检验标准——如果"社会影响"写不出东西，说明这项设定是多余的

#### 9.6 穿越机制不合理

**问题**：穿越方式与科幻世界观不兼容（例如世界观是硬科幻，但穿越方式是"莫名其妙醒来发现自己在未来"）

**解决**：
- 穿越方式必须与科幻子类匹配
- 硬科幻穿越需要技术解释（人体冷冻、时间膨胀效应等）
- 软科幻可以更灵活，但仍需要一个可信的框架
- 穿越机制本身可以成为核心谜题——为什么是主角被穿越？是意外还是阴谋？

---

### 十、创作检查清单

开始写作前确认：

- [ ] 科幻世界观中的科幻子类、文明等级、核心科技三者是否逻辑自洽
- [ ] 社会形态是否合理反映了核心科技的社会影响
- [ ] 科技与设定模块是否已建立至少 5 个条目构成基本科技体系
- [ ] 穿越方式是否有合理的科学/伪科学解释
- [ ] 金手指是否是"填补差距"而非"碾压未来"的设计
- [ ] 主角的劣势阶段是否足够长且有叙事张力
- [ ] 角色的种族/形态分布是否足以引发"何为人类"的讨论
- [ ] 能源体系是否能支撑所设定的科技水平
- [ ] 对于人类的定义是否与主角的穿越者身份产生有意义的冲突',
  '## Sci-Fi Crossing Novel Writing Guide

This guide provides dedicated writing guidance for the "Sci-Fi Crossing Creation" (未来科幻穿越创作) method. The core premise of this genre is: **a modern person crosses into a future world** -- the exact opposite of ancient-era crossing. The protagonist does not arrive with advantages but enters as a "primitive" stumbling into a civilization far beyond their comprehension.

**This is the only crossing sub-genre where the protagonist is at a disadvantage.** Understanding this is the key to writing good sci-fi crossing fiction.

---

### 1. Genre Characteristics and Core Appeal

#### 1.1 Sci-Fi Crossing vs. Other Crossing Types

| Comparison | Ancient/Historical Crossing | Future Sci-Fi Crossing |
|------------|---------------------------|----------------------|
| Protagonist advantage | Modern knowledge crushes the ancient world | Modern knowledge is nearly useless in the future |
| Core conflict | How to hide the crosser''s identity | How to survive in an alien civilization |
| Cheat-ability direction | Foreknowledge, modern technology | Cross-era perspective, humanistic spirit |
| Reader satisfaction source | Domination, changing history | Exploring the unknown, triumph over adversity |
| World-building focus | Recreating historical details | Imagining future technology and society |

#### 1.2 The Reverse Cheat-Ability: Disadvantage as Narrative Tension

In ancient crossing, knowing gunpowder''s formula lets you dominate. In sci-fi crossing, you don''t even know how to open a door. This **cognitive gap** is the genre''s greatest appeal:

- The protagonist cannot read future scripts, currencies, or transportation systems
- The protagonist''s professional skills may have been entirely replaced by AI
- The protagonist''s physical fitness may be far below that of gene-enhanced future humans
- The protagonist''s moral values may be fundamentally incompatible with future society

**But the protagonist is not worthless.** A modern person may possess:
- "Pure humanity" uncorrupted by technology
- Cross-era thinking (in an AI-dominated society, "irrationality" is actually an advantage)
- Lost knowledge (forgotten history, culture, or techniques)
- Adaptability and survival instinct (the ability to survive without relying on technology)

#### 1.3 Core Philosophical Questions

Every sci-fi crossing novel should address a philosophical question:

- When technology has changed everything, what defines a "human"?
- What is the cost of civilizational progress?
- Are past humans and future humans still the same species?

---

### 2. Sci-Fi Worldview Setting (Singleton, the Most Important Setting)

The sci-fi worldview is the infrastructure of the entire story. Every field profoundly influences subsequent character design, plot direction, and technological logic.

#### 2.1 Sci-Fi Sub-Genre (科幻子类)

This is the first choice to make, as it determines the world''s overall tone:

| Sub-Genre | World Characteristics | Suitable Story Types |
|-----------|----------------------|---------------------|
| **Cyberpunk** (赛博朋克) | High-tech low-life, corporate monopoly, extreme wealth gaps | Dystopia, underdog uprising, corporate conspiracy |
| **Space Opera** (太空歌剧) | Interstellar civilization, multi-species coexistence, grand politics | Space adventure, species wars, empire rise and fall |
| **Hard Sci-Fi** (硬科幻) | Strict adherence to scientific principles, realistic technical detail | Scientific exploration, technical puzzles, rational deduction |
| **Post-Apocalyptic** (废土末世) | Post-civilization collapse, resource scarcity | Survival, rebuilding civilization, tests of humanity |
| **Temporal Crossing** (时空穿越) | Multiple timelines/parallel worlds, causal paradoxes | Mystery, timeline repair, self-dialogue |
| **Alien Civilization** (异星文明) | Extraterrestrial species'' societies and cultures | Cultural collision, diplomatic gaming, philosophical debate |
| **AI Awakening** (AI 觉醒) | AI gains consciousness, human-machine relationships reconstructed | Ethical dilemmas, coexistence exploration, control vs. freedom |
| **Bio-Mutation** (生化变异) | Genetic modification creating new humans/species | Identity, species conflict, evolutionary direction |
| **Galactic Empire** (银河帝国) | Vast trans-galactic political entity | Court intrigue, imperial rise and fall, frontier rebellion |

**Recommendation**: Sub-genres are not mutually exclusive; they can be combined. For example, "Cyberpunk + AI Awakening" or "Space Opera + Galactic Empire." But the primary sub-genre should be clear, as it sets the world''s dominant tone.

#### 2.2 Civilization Level (文明等级)

Civilization level determines the technological ceiling and social complexity:

| Level | Characteristics | Impact on the Crosser |
|-------|----------------|----------------------|
| **Level 0 (Primitive)** | Near-modern or slightly above | Low adaptation difficulty; conflicts are more social |
| **Level 1 (Planetary)** | Full control of homeworld resources and environment | Crosser is comprehensively behind in technology |
| **Level 2 (Stellar)** | Can harness stellar energy, interstellar colonization | Crosser is like a primitive entering a modern city |
| **Level 3 (Galactic)** | Controls an entire galaxy | Crosser can barely comprehend this world |
| **God-Level** (神级) | Transcends physical laws | Crosser coexists with "gods"; essentially a philosophical story |

**Key tip**: Higher civilization levels mean greater disadvantage for the crosser, but also greater imaginative possibilities. Beginners should choose Level 0-1; experienced authors can try Level 2+.

#### 2.3 Core Technology (核心科技)

Core technology is the "tech-tree trunk" of the worldview. Three principles for designing core tech:

1. **Internal consistency**: If you have light-speed travel, communication cannot still rely on radio
2. **Social impact**: Every core technology must affect social structure (consciousness uploading -> the definition of death changes)
3. **Sub-genre match**: Cyberpunk core tech should be prosthetics/brain-computer interfaces, not interstellar engines

**Filling tip**: List 3-5 core technologies, each with a principle summary and social impact. You don''t need to write a thesis, but ensure logical consistency.

#### 2.4 Social Structure (社会形态)

Social structure must align with civilization level and core technology:

| Core Technology | Possible Social Structure |
|----------------|--------------------------|
| Consciousness uploading | Virtual-and-real dual-layer society, "digital citizen" concept |
| Gene editing | Genetic caste system, "pure human" discrimination issues |
| Strong AI governance | AI-managed efficiency society, redefining humanity''s role |
| Interstellar colonization | Loose federation or imperial system, cultural gaps between planets |
| Energy revolution | Post-scarcity society; new conflicts over meaning rather than material |

**Common mistake**: Advanced tech settings paired with modern-day democratic governance -- impossible. Technology fundamentally reshapes social structure.

#### 2.5 Energy System (能源体系)

The energy system is often overlooked but critically important:
- It determines civilization''s ceiling (insufficient energy makes interstellar travel a joke)
- It is a source of many plot conflicts (energy competition, monopoly, crisis)
- It affects daily life details (how things charge, heating, transportation)

#### 2.6 Definition of Humanity (对于人类的定义)

This is a philosophical setting field unique to sci-fi crossing:
- At what point does prosthetic modification stop being "human"?
- Is a digitally uploaded consciousness still a person?
- Are gene-edited new humans still the same species?
- Do AI androids deserve human rights?

**This field directly affects the protagonist''s situation**: If "pure humans" are a minority or even a discriminated group in the future world, the crosser''s identity itself becomes the greatest source of conflict.

---

### 3. Crossing Setup (Singleton)

#### 3.1 Crossing Method: Sci-Fi Mechanisms vs. Fantasy Mechanisms

Sci-fi crossing methods must have scientific (or pseudo-scientific) explanations -- this is the fundamental difference from fantasy crossing:

| Method | Characteristics | Narrative Impact |
|--------|----------------|-----------------|
| **Cryogenic revival** (人体冷冻苏醒) | Hardest sci-fi; real scientific basis | Protagonist physically exists; identity is traceable |
| **Time machine malfunction** (时间机器故障) | Classic sci-fi setup | Can introduce "return" possibility as a suspense thread |
| **Consciousness upload network** (意识上传网络) | Cyberpunk style | Protagonist may lack a body; identity becomes core conflict |
| **Wormhole crossing** (虫洞穿越) | Space opera style | Uncontrollable crossing; may span vast spacetime distances |
| **Higher-dimensional experiment** (高维文明实验) | Soft sci-fi/philosophical | Creates tension of "being observed"; why was the protagonist chosen? |
| **Parallel universe swap** (平行宇宙置换) | Multiverse setup | Another version of yourself may exist; identity conflict |
| **System transmission** (系统传送) | Closest to fantasy, but wrappable in tech | Who is behind the system? Why transport the protagonist? |

**Key distinction**: Fantasy''s "soul transmigration" does not apply in a sci-fi context. Sci-fi crossing must answer "what is the physical mechanism of the crossing?" Even in the softest sci-fi, you need a plausible technical framework.

#### 3.2 Time Span (时间跨度)

Time span affects the degree of difference between the crosser and the future world:

| Span | Degree of Change | Crosser''s Situation |
|------|-----------------|---------------------|
| 50-100 years | Noticeable tech gap; some cultural continuity | Moderate difficulty; like "a grandparent''s generation" |
| 100-500 years | Social structure transformed; language may have changed significantly | High difficulty; intense culture shock |
| 500-1000 years | Nearly an entirely new civilization | Protagonist is like a primitive |
| 1000+ years | May no longer be Earth civilization | Extreme fish-out-of-water |

#### 3.3 Crossing Identity (穿越身份)

Crossing identity determines the protagonist''s starting situation in future society:

| Identity | Situational Traits | Narrative Possibilities |
|----------|-------------------|------------------------|
| **Illegal immigrant** (非法移民) | No legal identity, hunted | Underground survival, identity forgery, underworld society |
| **Corporate heir** (企业继承人) | High starting point but full of conspiracies | Power struggles, corporate politics, identity questioning |
| **Scavenger** (拾荒者) | Free but dangerous fringe existence | Wasteland exploration, uncovering secrets, gradual rise |
| **Fugitive** (通缉犯) | Mistaken identity or framed | Chase, exoneration, exposing conspiracies |
| **Test subject** (实验体) | Object of study/exploitation | Escape, resistance, discovering the truth |
| **Living fossil** (活化石) | Protected/exhibited as a historical relic | Transformation from "exhibit" to "agent" |
| **AI vessel** (AI 载体) | Consciousness implanted in an AI system | Identity questions, virtual-real boundaries, awakening narrative |

#### 3.4 Core Goal (核心目标)

The core goal drives the main plot:

| Goal | Narrative Core | Emotional Tone |
|------|---------------|---------------|
| **The way home** (回家路) | Finding a way back | Nostalgia, determination, the final choice |
| **Topple the corporation** (推翻公司) | Resistance against monopoly/tyranny | Passion, justice, revolutionary narrative |
| **Discover the truth** (探索真相) | Uncovering the reason for crossing or the world''s secret | Suspense, peeling back layers |
| **Species survival** (种族存续) | Saving pure humans or a specific species | Sense of mission, self-sacrifice |
| **Interstellar dominion** (星际主宰) | Power ambition, galactic conquest | Power fantasy, strategic gaming |
| **Lost civilization** (失落文明) | Finding/restoring forgotten civilizational heritage | Archaeology, exploration, cultural legacy |

#### 3.5 Cheat-Ability Type and Details (金手指类型与金手指详情)

Sci-fi crossing cheat-abilities require special attention -- the protagonist''s cheat should not be a weapon that crushes the future world, but rather **a tool to bridge the cognitive gap** or **an ability that provides a unique perspective**:

| Type | Positioning | Design Notes |
|------|------------|-------------|
| **Super-brain** (超脑) | Enhanced learning/computation | Helps the protagonist adapt quickly but doesn''t make them smarter than future people |
| **Nano-core** (纳米核心) | Internal nanobots | Provides starting body-modification capabilities but cannot rival professional prosthetic users |
| **Alien tech library** (外星科技库) | Knowledge database | Provides knowledge of an alternative tech path, not superior versions of existing tech |
| **Gene editor** (基因编辑器) | Self genetic modification | Gradually narrows the gap with enhanced humans but carries risks and side effects |
| **Precognition** (预知) | Limited future fragments | Provides tactical advantage, not strategic domination |
| **Mechanical mastery** (机械掌控) | Ability to control mechanical devices | A double-edged sword in a highly automated society |
| **Planar trade system** (位面交易系统) | Cross-dimensional resource acquisition | Can obtain scarce resources but at a cost |
| **None** (无) | Relying purely on the protagonist | Hardest-core approach; suits hard sci-fi; all abilities come from learning and adaptation |

The **cheat-ability details** (金手指详情) should specify: concrete ability manifestations, acquisition method, usage limitations, growth path, and compatibility with the sci-fi worldview.

---

### 4. Technology & Setting Module (Custom Entity Type)

"Technology & Setting" (科技与设定) is this creation method''s **custom entity type**, belonging to the technology category. It is **non-singleton** -- you can create multiple entries to build a complete "tech bible."

#### 4.1 Why This Module Exists

Sci-fi novel worldviews depend heavily on technological consistency. Documenting each key technology/setting as an independent entry allows you to:
- Avoid contradictions between tech settings
- Build a material library for plot conflicts
- Maintain "hard sci-fi" logical rigor
- Quickly reference details during writing

#### 4.2 Field Usage Guide

**Name** (名称): Give each tech/setting a concise, clear name.

**Category** (类别, 6 options):

| Category | Description | Examples |
|----------|-------------|---------|
| **Weapons & Equipment** (武器装备) | Combat-related technology | Plasma rifle, nano-shield, prosthetic combat module |
| **Vehicles** (交通载具) | Movement and transport tech | Anti-gravity hover car, warp-drive ship, teleportation gate |
| **Biotechnology** (生物科技) | Life-related technology | Gene editing therapy, consciousness backup, cloning |
| **Information Technology** (信息技术) | Data and communication tech | Brain-computer interface, quantum communication, holographic projection |
| **Theoretical Concepts** (理论概念) | Scientific theories and hypotheses | Dark matter engine principles, consciousness quantization theory |
| **Historical Events** (历史事件) | World-shaping major events | World War III, AI Awakening Event, First Interstellar Contact |

**Principle/Setting** (原理/设定): Describe how the technology works or its background. Hard sci-fi requires detailed technical principles; soft sci-fi can use vague but consistent descriptions.

**Function/Impact** (功能/影响): The concrete impact of this technology on the world and characters. Consider two aspects:
- **Direct function**: What it can do
- **Social impact**: How it has changed society, economy, ethics, or daily life

#### 4.3 Recommended Process for Building the Tech Bible

1. **Start from core tech**: Based on the 核心科技 field in the sci-fi worldview, create 3-5 core technology entries
2. **Derive secondary tech**: Each core technology spawns derivative applications; create sub-entries
3. **Add historical events**: Create entries for major events that shaped the current world
4. **Add plot-relevant specific tech**: Specific technologies the protagonist will use or encounter
5. **Cross-verify**: Check whether all tech entries are logically consistent with each other

**Example**:
```
Core tech: Consciousness Uploading
  |-- Derivative - IT: Consciousness Cloud Storage Network
  |-- Derivative - Biotech: Consciousness Vessel Cloning
  |-- Derivative - Theory: Consciousness Continuity Paradox
  |-- Derivative - Historical: First Consciousness Upload Experiment (2187 CE)
  |-- Plot-relevant - Weapon: Consciousness Virus (attacks uploaded minds)
```

---

### 5. Sci-Fi Character Design

This creation method''s character type is called "Sci-Fi Character" (科幻角色), with fields specifically designed for the sci-fi context.

#### 5.1 Species/Form (种族/形态): Core Identity Marker

Species/Form is one of a sci-fi character''s most critical attributes. Each choice carries deep narrative implications:

| Species/Form | Identity Meaning | Relationship with the Crosser |
|-------------|-----------------|------------------------------|
| **Pure Human** (纯人类) | Unmodified natural person; may be a minority group | The crosser''s natural kin, but temporal gaps may exist |
| **Prosthetic Cyborg** (义体改造人) | Mechanical parts replacing/enhancing the body | "Half human, half machine" in the crosser''s eyes; challenges the definition of "human" |
| **Gene-Enhanced Human** (基因强化人) | Superhuman abilities via gene editing | Looks human but far surpasses the crosser; raises inequality issues |
| **Strong AI Android** (强AI仿生人) | Highly humanlike artificial intelligence | Can the crosser distinguish AI from human? Trust issues |
| **Alien Species** (外星种族) | Non-Earth-origin intelligent life | Completely alien thought patterns and value systems |
| **Consciousness Entity** (意识体) | Bodiless, purely digital existence | Challenges the crosser''s fundamental concept of "life" |

**Design tip**: Species/form is not just an appearance label -- it determines a character''s behavioral logic, social standing, and values. A prosthetic cyborg''s understanding of "body" is fundamentally different from a pure human''s.

#### 5.2 Name Design (姓名)

Sci-fi character naming should reflect the worldview:
- Pure humans can follow modern naming conventions
- Cyborgs/gene-enhanced humans may use code-name + given-name combinations
- AI androids may have serial-number-style names
- Alien species need a designed naming convention
- Consciousness entities may use network IDs/code names

#### 5.3 Lifecycle (生命周期)

In a sci-fi world, "lifecycle" takes on more complex meaning:
- Uploaded consciousness may be "immortal"
- Cyborgs can continuously replace parts
- Gene-enhanced humans may live several times longer than normal
- AI androids'' "lifespan" depends on maintenance

**Impact on the crosser**: The protagonist may be the only person in the room who will naturally age and die.

#### 5.4 Faction/Affiliation (阵营/所属势力)

Sci-fi world faction landscapes may include:
- Trans-galactic corporations/conglomerates
- Planetary governments/interstellar alliances
- Underground resistance organizations
- AI collectives
- Pure-human preservation zones/enclaves
- Religious/philosophical organizations
- Pirates/mercenary groups

**Note**: This creation method''s visible_categories does not include organization. Faction relationships are expressed through the character''s 阵营/所属势力 field and the character relationship network.

#### 5.5 Profession/Identity (职业/身份)

The sci-fi world''s occupational system differs radically from the modern one:
- Many modern professions have been replaced by AI
- New professions may include: consciousness navigator, genetic harmonist, virtual reality architect, interstellar jump pilot, data hunter
- Barriers may exist between professions and species/forms (some jobs only cyborgs can perform)

#### 5.6 The Core Question of Human Identity

Always consider "what defines humanity" in character design:
- The protagonist as a "pure human" crosser naturally raises this question through character interactions
- Characters of different species/forms have different definitions of "human"
- This question can serve as the entire novel''s undercurrent

---

### 6. Science Consistency Management

#### 6.1 Hard Sci-Fi vs. Soft Sci-Fi Consistency Standards

| Dimension | Hard Sci-Fi Requirements | Soft Sci-Fi Requirements |
|-----------|------------------------|------------------------|
| Tech principles | Must be based on known science or reasonable extrapolation | Can be vague but must not self-contradict |
| Social extrapolation | Strict causal chain reasoning | Selective extrapolation, focusing on story-relevant aspects |
| Data precision | Distances, speeds, energies must be plausible | Exact values not needed, but orders of magnitude should be right |
| Explanation depth | Readers should understand how technology works | Just enough; must not disrupt reading flow |

#### 6.2 Tech-Setting Consistency Checklist

After completing the sci-fi worldview and tech & setting module, perform these checks:

- Are there contradictions between core technologies? (e.g., if teleportation gates exist, why are ships still needed?)
- Does the civilization level match the core technologies? (Level 1 civilization should not possess galactic-level tech)
- Does the social structure reasonably reflect core technology''s impact?
- Can the energy system support the listed technologies?
- Is the definition of humanity consistent with the species/form settings?
- Is the crosser''s cheat-ability explainable within the tech system?

#### 6.3 The "One Lie" Principle

Great sci-fi follows the "one lie" principle -- you can assume one nonexistent technology (like faster-than-light travel), but all deductions from that assumption must be rigorously logical. The tech & setting module is the tool for managing these deductions.

---

### 7. Narrative Structure

Sci-fi crossing narrative structure fundamentally differs from other crossing types because the protagonist''s arc is **from ignorance to understanding**, not **from weakness to power**.

#### 7.1 Recommended Narrative Framework

```
Crossing Arrival -> Culture Shock -> Survival Struggle -> Discovering Truth/Conspiracy -> Leveraging Cross-Era Perspective -> Changing the Future
```

| Phase | Narrative Goal | Suggested Chapter Ratio |
|-------|---------------|------------------------|
| **Crossing Arrival** | The crossing occurs; show the first shock of the future world | 5-10% |
| **Culture Shock** | The protagonist faces a completely alien world; hits walls everywhere | 15-20% |
| **Survival Struggle** | Difficult adaptation; establishing initial relationships | 15-20% |
| **Discovering Conspiracy** | Uncovering the future world''s deep problems or the truth behind the crossing | 20-25% |
| **Cross-Era Perspective** | Using the modern person''s unique viewpoint to propose solutions | 15-20% |
| **Changing the Future** | Final confrontation / changing the world; completing the core goal | 10-15% |

#### 7.2 Opening Design

**The Golden Rule for the First Three Chapters**:

- **Chapter 1**: The crossing happens. No lengthy modern-life preamble needed; enter the future world quickly. Use the protagonist''s confusion and awe to immerse the reader.
- **Chapter 2**: First culture shock. The protagonist tries to do something simple (like buying something or asking directions) and discovers they have absolutely no idea how. Show the crosser''s "disadvantage."
- **Chapter 3**: First ally or first danger. The protagonist meets someone willing to help, or falls into the first crisis. The story officially launches.

#### 7.3 Writing the Culture Shock Phase

This is the most distinctive and potentially brilliant phase of sci-fi crossing:

**Cultural differences to highlight**:
- Language evolution (even the same language becomes unrecognizable after centuries)
- Social etiquette (greetings, expressions of respect, taboo topics)
- Value conflicts (concepts of privacy, bodily autonomy, attitudes toward death)
- Everyday technology (inability to use basic devices, incomprehension of common knowledge)
- Interpersonal patterns (human-AI relationships, virtual vs. physical social interaction)

**Technique**: Show the future world through the protagonist''s perspective, letting readers "discover" and feel "shock" alongside the protagonist. This is more immersive than expository narration.

#### 7.4 Mid-Section Pacing: From Adaptation to Action

The mid-section''s key turning point: the protagonist shifts from **passive adaptation** to **active agency**.

Common triggers for this shift:
- Discovering the crossing was deliberately engineered
- Discovering an injustice in future society
- Encountering other crossers from the same era
- Cheat-ability awakening or upgrade
- A significant character''s fate galvanizing the protagonist

#### 7.5 Leveraging Cross-Era Knowledge

This is the phase where the "reverse cheat-ability" transforms into a "forward advantage." A modern person''s edge in the future is not technological dominance but:

- **Lost knowledge**: Ancient knowledge destroyed by wars/disasters that only the crosser remembers
- **Humanistic perspective**: In an over-rationalized society, "emotion" and "humanistic care" are actually scarce
- **Creative thinking**: Thinking without AI reliance can yield unexpected innovations
- **Historical lessons**: Knowing humanity''s past mistakes can warn against repeating them

---

### 8. Visible Categories and Recommended Creation Flow

This creation method''s visible_categories include:

| Category | Purpose |
|----------|---------|
| **setting** | Sci-fi worldview (singleton), crossing setup (singleton) |
| **character** | Sci-fi character management (distinguish different species/forms) |
| **technology** | Technology & setting (non-singleton; build the tech bible) |
| **plot** | Plot management |

**Note**: This method does not include chapter, organization, or scene categories. Faction relationships are expressed through the character''s 阵营/所属势力 field.

#### Recommended Creation Order

1. **Sci-fi worldview**: Sub-genre -> Civilization level -> Core tech -> Social structure -> Energy system -> Definition of humanity
2. **Technology & setting**: Create 5-10 entries based on core tech to build the tech bible
3. **Crossing setup**: Crossing method -> Time span -> Crossing identity -> Core goal -> Cheat-ability
4. **Characters**: Protagonist (crosser) -> Core allies -> Main antagonists -> Key supporting characters
5. **Plot**: Main storyline planning -> Key events for each phase -> Climax and ending

---

### 9. Common Pitfalls and How to Avoid Them

#### 9.1 Self-Contradicting Tech Settings

**Problem**: The same technology behaves inconsistently across scenes (e.g., an energy shield stops missiles in one scene but shatters from a punch in another)

**Solutions**:
- Document each technology in the tech & setting module with clear capability boundaries
- Consult relevant entries before writing to ensure consistency
- For complex technologies, specify strong/weak conditions in the 原理/设定 field

#### 9.2 Social Structure Mismatching Civilization Level

**Problem**: A Level 3 civilization is organized like modern Earth (democratic elections, capitalist market economy)

**Solutions**:
- Whenever you raise the civilization level, re-evaluate whether the social structure is plausible
- Reference the 社会形态 field description in the sci-fi worldview
- Ask: How would this core technology fundamentally change how humans organize?

#### 9.3 Protagonist Adapts Too Quickly

**Problem**: Crossing 500 years into the future, and fully adapted within three chapters -- this is neither realistic nor a good use of the best narrative material.

**Solutions**:
- The culture shock phase should occupy at least 15-20% of the story
- Adaptation is gradual: basic survival first -> social norms next -> deep cultural understanding last
- Always preserve some differences the crosser can "never fully adapt to" -- a permanent marker of their identity

#### 9.4 Ignoring the Narrative Value of "Reverse Cheat-Ability"

**Problem**: Rushing to power up the protagonist, skipping the disadvantage phase, turning the sci-fi crossing into a generic level-up story.

**Solutions**:
- The protagonist''s disadvantage IS the story -- a modern person who can''t open a door is more compelling than any battle scene
- Every "overcoming a disadvantage" moment should be a mini-climax
- Even in the late game, the protagonist should not completely close the gap with future people

#### 9.5 Sci-Fi Settings as Mere Decoration

**Problem**: Lots of cool tech settings that have zero impact on the plot; the same story could be told in any setting.

**Solutions**:
- Every sci-fi setting must play a role in at least one key plot point
- The core conflict must be directly tied to the sci-fi setting (it cannot be a romance/monster-slaying story in a sci-fi skin)
- The 功能/影响 field in the tech & setting module is the litmus test -- if you cannot write anything for "social impact," the setting is superfluous

#### 9.6 Implausible Crossing Mechanism

**Problem**: The crossing method is incompatible with the sci-fi worldview (e.g., a hard sci-fi worldview but the crossing is "inexplicably woke up in the future")

**Solutions**:
- The crossing method must match the sci-fi sub-genre
- Hard sci-fi crossing needs a technical explanation (cryogenics, time dilation, etc.)
- Soft sci-fi allows more flexibility but still needs a credible framework
- The crossing mechanism itself can become the core mystery -- why was this particular person crossed? Accident or conspiracy?

---

### 10. Pre-Writing Checklist

Confirm before you start writing:

- [ ] Are the sci-fi sub-genre, civilization level, and core technologies in the worldview logically consistent?
- [ ] Does the social structure reasonably reflect core technology''s social impact?
- [ ] Has the tech & setting module established at least 5 entries forming a basic tech system?
- [ ] Does the crossing method have a plausible scientific/pseudo-scientific explanation?
- [ ] Is the cheat-ability designed to "bridge the gap" rather than "crush the future"?
- [ ] Is the protagonist''s disadvantage phase long enough and narratively compelling?
- [ ] Does the distribution of character species/forms support a "what is human" discussion?
- [ ] Can the energy system support the established technology level?
- [ ] Does the definition of humanity create meaningful conflict with the protagonist''s crosser identity?',
  (SELECT id FROM novel_creation_method WHERE name = '未来科幻穿越创作' LIMIT 1),
  1,
  100,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  novel_creation_method_id = VALUES(novel_creation_method_id),
  is_active = VALUES(is_active),
  sort_order = VALUES(sort_order),
  updated_at = NOW();
