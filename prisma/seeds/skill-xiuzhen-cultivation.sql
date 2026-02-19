-- 异世界修真穿越小说 - 修真体系与宗门设计 Skill / Isekai Xiuzhen Crossing - Cultivation System & Sect Design Skill
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '异世界修真穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-xiuzhen-cultivation.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xiuzhen-cultivation',
  '修真体系与宗门设计：修真与玄幻的核心差异辨析、以道为本的境界突破机制（悟道/天劫/飞升）、丹道与炼器的品阶经济、宗门层次与师徒叙事、修真里程碑式章节规划、工具使用指南',
  'Xiuzhen cultivation system and sect design: core differences between xiuzhen and xuanhuan, Dao-based breakthrough mechanics (enlightenment / tribulation / ascension), pill and artifact grade economy, sect hierarchy and master-disciple narrative, cultivation-milestone chapter planning, and tool usage guide',
  '## 修真体系与宗门设计

本技能专注于「异世界修真穿越小说」中最核心的两大子系统：**修真体系**与**宗门生态**。它不重复 xiuzhen-crossing-guide 已覆盖的通用世界观和穿越设定内容，而是深入探讨修真类型区别于通用玄幻的独特机制，以及如何将这些机制转化为可操作的实体设定。

---

### 一、修真 vs 玄幻 —— 核心差异

修真不是"换了名字的玄幻"。两者在底层哲学、叙事机制和读者期待上有根本区别。理解这些差异是设计出正宗修真体系的前提。

#### 1.1 哲学根基

玄幻的底层逻辑是**力量积累**——吃药、吸收灵石、杀怪获得经验值，积累到阈值后突破。本质上是一个量变引起质变的线性模型。

修真的底层逻辑是**悟道**——修士对天地法则的理解程度决定境界上限。灵气和资源只是辅助工具，真正的瓶颈是"悟"。一个修士可能灵石堆积如山却卡在金丹期百年不得突破，只因未能领悟属于自己的"道"。

这个差异影响一切：
- **突破机制不同**：玄幻靠积累资源→冲击瓶颈；修真靠悟道→水到渠成或顿悟
- **天赋定义不同**：玄幻天赋 = 修炼速度快；修真天赋 = 灵根品质 + 悟性 + 道心坚定
- **失败方式不同**：玄幻突破失败 = 受伤回退；修真突破失败 = 走火入魔、道基损毁、甚至形神俱灭
- **叙事张力不同**：玄幻的张力在于"能不能打赢"；修真的张力在于"能不能悟道""能不能渡劫"

#### 1.2 修真独有的核心概念

以下概念在通用玄幻中不存在或仅为装饰，但在修真中是体系支柱：

| 概念 | 定义 | 叙事功能 |
|------|------|---------|
| **道** | 天地运行的根本法则，修士追求的终极真理 | 整个修炼体系的底层逻辑 |
| **悟道/顿悟** | 对道的领悟，分渐悟和顿悟两种 | 突破的核心机制，最重要的戏剧时刻 |
| **道心** | 修士对自身道路的坚定信念 | 内心冲突的核心源，心魔的对立面 |
| **心魔** | 执念、恐惧、贪婪化为的精神障碍 | 内在冲突的具象化，高境界突破的最大障碍 |
| **天劫** | 天道对逆天修士的雷霆考验 | 最具仪式感的叙事高潮 |
| **因果** | 修真世界的因果报应法则 | 长线伏笔和命运纠葛 |
| **飞升** | 超脱凡界、升入仙界 | 全书的终极目标和叙事终点 |
| **丹道** | 炼制丹药的修炼分支 | 经济系统和辅助修炼线 |
| **炼器** | 打造法宝的修炼分支 | 战力提升和装备系统 |
| **阵道** | 布置阵法的修炼分支 | 战术、防御和基建系统 |
| **符道** | 制作灵符的修炼分支 | 灵活战斗辅助 |

#### 1.3 "道"的具体化

"道"不能只是一个抽象概念。在实际创作中，需要将"道"具体化为可叙述的内容：

- **大道方向**：剑道、丹道、杀道、生死之道、时空之道、因果之道……每个修士追求不同的道
- **道的领悟层次**：入门（知道有这个道）→ 小成（能运用道的力量）→ 大成（将道融入自身修炼）→ 圆满（道与己合一）
- **悟道的触发条件**：生死之间的彻悟、观天地异象的灵感、师长的一句点拨、久思不得后的灵光一现
- **道与道的冲突**：不同修士追求不同的道，道之间可能互斥，这是高层次冲突的来源

在使用 `update_setting` 设定修炼体系时，「修炼资源」字段应明确列出"对道的领悟"作为最核心的修炼资源，与灵石、丹药等物质资源并列。

---

### 二、境界体系的修真化设计

#### 2.1 经典九境与变体

修真经典境界体系：

```
练气期 → 筑基期 → 结丹期（金丹期）→ 元婴期 → 化神期 → 合体期 → 大乘期 → 渡劫期 → 飞升
```

每个境界的修真特色含义（不同于玄幻的纯战力标签）：

| 境界 | 修真内涵 | 标志性变化 | 寿元参考 |
|------|---------|-----------|---------|
| **练气期** | 感应灵气、引气入体 | 能修炼基础术法 | 150-200 年 |
| **筑基期** | 筑造修炼根基，灵气质变 | 御物飞行、灵觉扩展 | 300-500 年 |
| **结丹期** | 灵气凝结成金丹，有了"道种" | 御剑飞行、金丹蕴含道意 | 800-1000 年 |
| **元婴期** | 金丹化元婴，如婴儿初生般的第二生命 | 元婴出窍、分身术 | 2000-3000 年 |
| **化神期** | 元婴化神，开始触摸天地法则 | 法则之力初现、领域雏形 | 5000+ 年 |
| **合体期** | 肉身与元神合一，向天道靠拢 | 完整领域、空间挪移 | 万年级 |
| **大乘期** | 即将超脱，开始与天道产生感应 | 空间撕裂、近仙之力 | 数万年 |
| **渡劫期** | 天道降劫，是飞升的最后考验 | 天劫洗礼后脱胎换骨 | 无限（若渡劫成功） |
| **飞升** | 超脱凡界，升入仙界 | 故事终点或新篇章 | 不朽 |

#### 2.2 每个境界的叙事密度

不是每个境界都需要同等笔墨。修真小说的典型分配：

| 境界 | 建议章数 | 核心叙事 |
|------|---------|---------|
| 练气期 | 30-50 章 | 入门、学习修真常识、宗门底层生存 |
| 筑基期 | 40-60 章 | 第一次大考验、宗门大比、初次外出 |
| 结丹期 | 50-80 章 | 离开宗门、探索更广阔的世界、确立自己的道 |
| 元婴期 | 60-100 章 | 成为一方人物、宗门级冲突、结交高层 |
| 化神期 | 40-60 章 | 大陆级冲突、政治博弈、触碰禁忌 |
| 合体/大乘 | 30-50 章 | 终极冲突、揭示世界真相 |
| 渡劫/飞升 | 20-30 章 | 最终决战、渡劫、飞升或留守 |

#### 2.3 在 update_setting 中编码境界体系

使用 `update_setting` 设定「修炼体系」时，「境界划分」字段应包含：
- 完整的九境名称和细分（如练气一层到练气十二层）
- 每个境界的突破条件：悟道要求 + 资源要求 + 天劫要求（若有）
- 境界间的寿元对照表
- 每个境界的标志性能力

「功法/职业分支」字段应列出修真特有的分支：
- 剑修：以剑入道，战力最强
- 丹修：炼丹为主，地位极高
- 器修：炼器为主，善于打造法宝
- 符修：制符为主，灵活多变
- 阵修：布阵为主，攻防兼备
- 体修：淬炼肉身，罕见且强悍
- 魂修：修炼神魂，神秘莫测

「禁忌与风险」字段应明确列出：
- 走火入魔：修炼过急或功法不当，灵气失控
- 心魔：执念化为心魔，阻碍突破
- 天劫反噬：渡劫失败的后果——轻则重伤倒退，重则形神俱灭
- 道基损毁：强行突破失败会永久损伤修炼根基

---

### 三、丹道与炼器 —— 修真的经济与装备系统

#### 3.1 丹药品阶体系

丹药在修真世界中同时扮演**经济货币**、**修炼辅助**和**战略资源**三重角色。

**品阶划分**（两种常见体系）：

体系一（九品制）：
```
一品丹（最低）→ 二品丹 → ... → 九品丹（最高、传说级）
每品分上中下三等
```

体系二（三阶制）：
```
凡品丹（凡人可用）→ 灵品丹（修士专用）→ 仙品丹（半仙之物）
每阶分上中下三品
```

**核心丹药分类**：

| 类别 | 代表丹药 | 叙事功能 |
|------|---------|---------|
| **修炼类** | 培元丹、聚灵丹、凝气散 | 日常修炼加速，经济基础 |
| **突破类** | 筑基丹、破境丹、化神丹 | 关键剧情节点的催化剂 |
| **疗伤类** | 回春丹、续命丹、活血散 | 战斗后恢复，危急关头的救命手段 |
| **解毒类** | 万毒丹、清心散 | 毒类剧情的解决方案 |
| **特殊类** | 驻颜丹、易容丹、隐匿丹 | 特定剧情需要的工具 |

**丹毒机制**：过度服用丹药会在体内积累丹毒，导致修炼减缓甚至走火入魔。这是防止"吃药就能变强"的关键限制。

#### 3.2 法宝品阶体系

**品阶划分**：
```
法器（练气/筑基级）→ 灵器（结丹级）→ 宝器（元婴级）→ 仙器（化神级以上）→ 道器（传说级）→ 至宝（天道之物）
```

每个品阶内部分上中下三品。品阶差距 = 境界差距，低品法宝在高品法宝面前如同废铁。

**法宝的修真特色**：
- **认主**：法宝需要血祭或神识烙印才能认主
- **温养**：法宝需要修士长期以灵力温养才能发挥最大威力
- **器灵**：高品法宝可能孕育器灵，拥有自主意识
- **本命法宝**：修士可将一件法宝炼为本命法宝，与修为共同成长
- **自爆**：危急时刻可以自爆法宝造成巨大伤害，但法宝也会毁灭

#### 3.3 使用 create_prop 创建丹药和法宝

创建丹药时，道具的描述应包含：
- 品阶和等级
- 主要功效
- 炼制难度和所需材料（简述）
- 副作用或使用限制（如丹毒积累、每月限服几枚）
- 市场价格（以灵石计）

创建法宝时，道具的描述应包含：
- 品阶和等级
- 主要能力（攻击/防御/辅助/特殊）
- 激活条件（需要什么境界才能驱动）
- 特殊属性（是否有器灵、是否能成长）
- 来历（宗门赐予/秘境获得/自行炼制）

---

### 四、宗门层次与生态设计

#### 4.1 宗门是修真世界的基本社会单元

与玄幻世界中宗门只是"势力之一"不同，在修真世界中，**宗门是修士生存和修炼的根本依托**。散修之所以艰难，正是因为缺少宗门提供的：
- 功法传承
- 修炼资源定期供给
- 长辈指导和护道
- 灵脉驻地（修炼环境）
- 社交网络和信息渠道

#### 4.2 宗门层次体系

| 层次 | 镇派实力 | 灵脉等级 | 核心资源 | 弟子规模 |
|------|---------|---------|---------|---------|
| **仙门** | 有飞升记录 | 顶级灵脉 | 仙品功法、仙器 | 十万以上 |
| **超级宗门** | 渡劫/大乘老祖 | 上等灵脉 | 大量灵品功法 | 万人以上 |
| **大宗门** | 化神期老祖 | 中上灵脉 | 数门灵品功法 | 数千人 |
| **中等宗门** | 元婴期坐镇 | 中等灵脉 | 少量灵品功法 | 千人左右 |
| **小门派** | 结丹期掌门 | 下等灵脉 | 凡品功法为主 | 百人左右 |
| **散修聚居点** | 筑基期 | 无固定灵脉 | 自行搜集 | 数十人 |

#### 4.3 宗门内部结构

标准大宗门的内部层级：

```
宗主（最高领袖，通常是最强者或创派人传承者）
├── 太上长老（已退隐的前辈高人，只在宗门生死存亡时出手）
├── 大长老/长老会（管理宗门日常事务）
├── 各峰峰主（每峰专精一道：剑峰、丹峰、器峰……）
│   ├── 嫡传弟子（峰主亲传，资质最优）
│   ├── 内门弟子（通过选拔，享受资源倾斜）
│   └── 外门弟子（基础资源，自力更生为主）
├── 杂役弟子（负责宗门杂务，地位最低）
└── 客卿（外聘的高手，不属于宗门传承体系）
```

#### 4.4 师徒体系 —— 修真叙事的核心关系

师徒关系在修真文中的地位远超玄幻文中的"导师"角色：

**师徒关系的叙事功能**：
- **传道**：师父传授功法、讲解修炼心得、指点悟道方向
- **护道**：师父在弟子渡劫时护法、在弟子遇危时出手
- **因果纽带**：师徒之间有因果关系，师父的恩情需要回报
- **情感锚点**：师门是修士在残酷修真世界中的情感归属
- **冲突来源**：师父被害、师门被灭是最强的复仇驱动力

**设计一个好的师父角色**：
- 修为高但有自己的局限（道伤、寿元将尽、困于某个境界）
- 对主角有独特的期待（不是泛泛的"看好你"，而是有具体原因）
- 有自己的故事线（师父的过去、师父的敌人、师父未完成的遗愿）
- 师父的教导方式应与主角的金手指形成互补而非替代

#### 4.5 使用 create_organization 创建宗门

使用 `create_organization` 创建宗门时：
- **类型** = "宗门"
- **地位与影响力** = 详细描述宗门在修真界的排名和声望
- **核心理念** = 宗门的修炼理念（如"以剑证道""万法归一""阴阳调和"）
- **资源与特色** = 宗门独有的功法、灵脉、镇派之宝
- **组织结构** = 上述层级体系的具体化
- **与其他势力关系** = 盟友、对手、从属关系

额外应在描述中包含：
- 宗门的道统传承（创派祖师是谁、传承了几代）
- 宗门的独门绝学（至少一门标志性功法或术法）
- 宗门的核心矛盾（内部派系斗争、资源分配争议、传承断裂危机）

---

### 五、修真叙事里程碑

#### 5.1 境界驱动的叙事结构

修真小说的每个境界段落对应一个相对独立的叙事弧，拥有自己的世界、规则和利害关系。升入新境界 = 进入新的"游戏"。

| 境界弧 | 核心叙事 | 世界范围 | 核心冲突 |
|--------|---------|---------|---------|
| **练气弧** | 进入修真世界、学习基础、宗门底层求存 | 宗门内部 | 同辈欺压、资源抢夺 |
| **筑基弧** | 第一次大考验、证明自己的价值 | 宗门及周边 | 宗门大比、外敌窥探 |
| **结丹弧** | 走出宗门、探索广阔天地、确立自己的道路 | 一方区域 | 秘境争夺、势力交锋 |
| **元婴弧** | 建立声望、成为一方强者 | 大陆级范围 | 宗门级战争、高层博弈 |
| **化神弧** | 触碰禁忌、揭开世界的深层秘密 | 界域级范围 | 大陆级战争、天道限制 |
| **后期弧** | 终极冲突、渡劫飞升 | 多界域 | 终极敌人、天道之劫 |

#### 5.2 典型里程碑事件

每个境界弧中应包含以下类型的里程碑事件（可映射到章节的「剧情类型」字段）：

**铺垫型**（剧情类型 = 铺垫）：
- 获得新功法或资源
- 发现新的威胁或机遇
- 建立新的人际关系

**冲突型**（剧情类型 = 冲突）：
- 与同辈的正面对决
- 与高境界敌人的遭遇（被碾压或侥幸逃脱）
- 宗门/势力间的摩擦升级

**高潮型**（剧情类型 = 高潮）：
- 境界突破（尤其是需要渡劫的突破）
- 大规模战斗的决战
- 关键秘密的揭露

**过渡型**（剧情类型 = 过渡）：
- 闭关修炼
- 炼丹/炼器段落
- 旅途中的见闻

**收尾型**（剧情类型 = 收尾）：
- 战后清算
- 收获整理（新法宝、新功法、新盟友）
- 为下一境界弧埋下伏笔

#### 5.3 情感基调的修真化运用

章节的「情感基调」字段在修真叙事中有特殊含义：

- **轻松**：宗门日常、坊市闲逛、同门切磋
- **紧张**：秘境探险、敌人追杀、天劫前的准备
- **悲伤**：师父陨落、同门战死、道侣分离
- **温馨**：师徒传道、同门聚会、道侣双修
- **激烈**：大规模宗战、天劫渡劫、生死搏杀
- **悬疑**：上古遗迹探索、阴谋逐步揭露、身世之谜

---

### 六、天劫与悟道 —— 修真最独特的叙事工具

#### 6.1 天劫的本质

天劫不是"更难的boss战"。它是**天道对逆天修士的回应**——你修为越高、逆天程度越大，天劫越猛烈。这意味着：
- 主角因为金手指而逆天，所以天劫比同境界的人更强
- 天劫的强度是"你有多逆天"的直观标尺
- 天劫无法逃避，无法投降，只能正面硬扛
- 天劫是公开事件——方圆千里都能看到天劫异象

#### 6.2 天劫的种类

| 天劫类型 | 特点 | 适合场景 |
|---------|------|---------|
| **雷劫** | 最经典，天雷轰顶 | 标准渡劫场景 |
| **火劫** | 天火焚身 | 火属性修士或丹修渡劫 |
| **风劫** | 罡风裂体 | 剑修或速度型修士渡劫 |
| **心魔劫** | 心魔入侵，精神层面的考验 | 高境界突破、道心考验 |
| **混合劫** | 多种天劫叠加 | 逆天程度极高的主角 |
| **变异劫** | 紫色天劫/九色天劫等非常规天劫 | 关键剧情转折点 |

#### 6.3 天劫的叙事设计模板

一场完整的天劫场景应包含：

1. **劫前准备**（1-2 章）：选择渡劫地点、布置护道大阵、准备保命丹药和法宝、安排护道者
2. **劫云降临**（0.5-1 章）：天象异变、劫云汇聚、周围修士震惊于天劫的规模
3. **正面硬抗**（2-4 章）：逐道天劫越来越强、主角伤势加重、各种手段轮番使用
4. **最危险时刻**（1-2 章）：看似必败、最后的底牌、绝境中的顿悟
5. **劫后蜕变**（0.5-1 章）：天劫散去、修为蜕变、各方反应

#### 6.4 悟道作为突破机制

与玄幻中"灵气积累到阈值就突破"不同，修真中的突破核心是**悟道**：

**顿悟的触发方式**：
- 生死之间的彻悟（最经典——绝境中突然明白了什么）
- 观察天地异象（日月交替、雷暴、花开花落中领悟道理）
- 对战中的灵感（与强敌交手时被对方的道启发）
- 师长的一句点拨（听者有意，一语惊醒梦中人）
- 红尘历练（在凡人世界中体验人间百态后的升华）

**道心与心魔的博弈**：
- 道心 = 对自己修炼之道的坚定信念
- 心魔 = 内心的执念、恐惧、贪婪、愤怒
- 每次突破高境界，心魔都会发起挑战
- 克服心魔的方式不是"打赢它"，而是"接受它并超越它"
- 心魔的内容应与主角的经历相关（如穿越者对原世界的眷恋、对亲人的愧疚）

---

### 七、角色设计的修真化要点

#### 7.1 使用 create_character 创建修真角色

创建角色时：
- **种族** = 人族/妖族/魔族等（修真世界中人族为主流）
- **身份地位**：
  - **所属势力** = 具体宗门名称（如"青云宗"）
  - **职业** = 修炼分支（如"剑修""丹修"）
  - **宗门** = 宗门身份（如"内门弟子""长老"）
  - **境界** = 当前修为境界（如"结丹期中期"）
  - **等级** = 在同境界中的相对实力（如"结丹期中能越阶战斗"）
  - **称号** = 修真界的称号（如"青云剑仙""万毒散人"）

#### 7.2 修真角色的独特要素

每个重要角色还应在描述中包含：
- **灵根属性**：单灵根/双灵根/三灵根/杂灵根/变异灵根——直接决定修炼天赋
- **修炼功法**：正在修炼的功法名称和等级
- **本命法宝**：标志性的武器或防具
- **道之方向**：这个角色追求什么样的道
- **心魔/软肋**：角色的精神弱点

---

### 八、工具使用指南

#### 8.1 update_setting 设定修炼体系

修真体系的核心设定：
- **力量体系类型** = "修真"
- **境界划分** = 完整九境 + 每境细分 + 寿元表 + 天劫对应
- **修炼资源** = 灵石体系 + 丹药体系 + 天材地宝 + 悟道机缘（必须包含）
- **功法/职业分支** = 剑修/丹修/器修/符修/阵修/体修/魂修
- **禁忌与风险** = 走火入魔 + 心魔 + 天劫反噬 + 道基损毁

#### 8.2 create_organization 设定宗门

每个宗门都是一个完整的社会缩影：
- 明确宗门层级（参照第四节）
- 写清内部结构和权力关系
- 标注核心功法和传承
- 描述宗门独特的文化和理念
- 设定宗门面临的核心矛盾

#### 8.3 create_character 设定角色

修真角色需要额外关注：
- 灵根属性和修炼路径
- 所属宗门和内部身份
- 道之方向和心魔设定
- 本命法宝和常用丹药

#### 8.4 create_prop 设定丹药和法宝

丹药和法宝是修真世界的经济基础和战力核心：
- 明确品阶和市场价值
- 写清功效和使用限制
- 标注炼制难度和材料需求
- 与角色的匹配度（谁能用、谁不能用）

#### 8.5 create_scene 设定修真场景

修真场景应体现灵气和道的存在：
- 宗门场景：灵脉分布、阵法防护、功能区划
- 秘境场景：灵气浓度、危险等级、可能的机缘
- 渡劫场景：适合渡劫的条件、方圆范围内的影响
- 坊市场景：交易的丹药法宝种类、价格范围

---

### 九、常见误区

| 误区 | 问题 | 正确做法 |
|------|------|---------|
| **把修真写成换皮玄幻** | 只是把"斗气"换成"灵气"，本质没有变化 | 突出悟道、天劫、因果等修真独有机制 |
| **悟道变成"修炼时长够了就突破"** | 失去了修真的核心张力 | 悟道应有具体的触发条件和戏剧性时刻 |
| **宗门只是背景板** | 宗门没有内部生态，只是给主角一个出身 | 宗门应有完整的权力结构、资源分配和内部矛盾 |
| **丹药是万能药** | 什么问题都靠吃丹药解决 | 丹毒机制 + 品阶限制 + 稀有度控制 |
| **天劫没有仪式感** | 天劫场景草草带过 | 天劫是修真最重要的高潮，应给予充分篇幅 |
| **师徒关系扁平化** | 师父只是"给主角功法的NPC" | 师父应有自己的故事线、局限和期待 |
| **道心心魔流于形式** | 心魔出现就是"幻境中打怪" | 心魔应源自角色的真实经历和内心冲突 |
| **忽略因果法则** | 主角做了什么都没有后果 | 因果是修真世界的底层规则，大恩大仇都有因果 |',
  '## Xiuzhen Cultivation System and Sect Design

This skill focuses on the two most critical subsystems within the "Isekai Cultivation Crossing Novel": **the xiuzhen cultivation system** and **the sect ecosystem**. It does not repeat the general worldview and crossing setup content already covered in xiuzhen-crossing-guide. Instead, it dives deep into the mechanisms that make xiuzhen fundamentally different from generic xuanhuan, and how to translate these mechanisms into actionable entity settings.

---

### I. Xiuzhen vs. Xuanhuan -- Core Differences

Xiuzhen is not "xuanhuan with different terminology." The two differ at the level of underlying philosophy, narrative mechanics, and reader expectations. Understanding these differences is the prerequisite for designing an authentic xiuzhen cultivation system.

#### 1.1 Philosophical Foundation

The underlying logic of xuanhuan is **power accumulation** -- consume pills, absorb spirit stones, kill monsters for experience, accumulate to a threshold, then break through. It is essentially a linear model where quantitative change triggers qualitative change.

The underlying logic of xiuzhen is **Dao comprehension** -- a cultivator''s understanding of heaven-and-earth''s laws determines their realm ceiling. Spiritual energy and resources are merely auxiliary tools; the real bottleneck is "comprehension." A cultivator may have mountains of spirit stones yet remain stuck at Golden Core for a century, simply because they have not grasped the Dao that belongs to them.

This difference affects everything:
- **Breakthrough mechanism differs**: Xuanhuan relies on accumulating resources then pushing through; xiuzhen relies on Dao comprehension, which either comes gradually or in a flash of insight
- **Talent is defined differently**: Xuanhuan talent = cultivation speed; xiuzhen talent = spirit root quality + comprehension ability + Dao heart firmness
- **Failure modes differ**: Xuanhuan breakthrough failure = injury and regression; xiuzhen breakthrough failure = qi deviation, Dao foundation damage, or complete annihilation of body and soul
- **Narrative tension differs**: Xuanhuan tension is about "can they win the fight"; xiuzhen tension is about "can they comprehend the Dao" and "can they survive the tribulation"

#### 1.2 Core Concepts Unique to Xiuzhen

The following concepts do not exist in generic xuanhuan or serve only as decoration, but in xiuzhen they are structural pillars:

| Concept | Definition | Narrative Function |
|---------|-----------|-------------------|
| **The Dao** (道) | The fundamental laws governing heaven and earth; the ultimate truth cultivators pursue | The underlying logic of the entire cultivation system |
| **Dao Comprehension / Sudden Enlightenment** (悟道/顿悟) | Understanding of the Dao; comes as gradual insight or sudden breakthrough | The core breakthrough mechanism; the most important dramatic moment |
| **Dao Heart** (道心) | A cultivator''s unwavering conviction in their own path | The core source of inner conflict; the antithesis of inner demons |
| **Inner Demons** (心魔) | Spiritual obstacles born from obsession, fear, and greed | Externalized inner conflict; the greatest barrier to high-realm breakthroughs |
| **Heavenly Tribulation** (天劫) | The Dao of Heaven''s thunderous test for cultivators who defy fate | The most ceremonially significant narrative climax |
| **Karma** (因果) | The karmic cause-and-effect law of the xiuzhen world | Long-term foreshadowing and fate entanglement |
| **Ascension** (飞升) | Transcending the mortal realm to enter the immortal realm | The ultimate goal and narrative endpoint of the entire story |
| **Alchemy** (丹道) | The cultivation branch of pill refining | Economic system and cultivation support line |
| **Artifact Forging** (炼器) | The cultivation branch of crafting artifacts | Combat power and equipment system |
| **Formation Dao** (阵道) | The cultivation branch of setting formations | Tactical, defensive, and infrastructure system |
| **Talisman Dao** (符道) | The cultivation branch of creating talismans | Flexible combat support |

#### 1.3 Making "the Dao" Concrete

"The Dao" cannot remain a purely abstract concept. In actual writing, it must be made concrete and narratable:

- **Dao directions**: Sword Dao, Alchemy Dao, Killing Dao, Life-and-Death Dao, Space-Time Dao, Karma Dao... each cultivator pursues a different Dao
- **Levels of Dao comprehension**: Initiation (aware the Dao exists) -> Minor Achievement (can wield the Dao''s power) -> Major Achievement (integrates the Dao into cultivation) -> Perfection (becomes one with the Dao)
- **Triggers for Dao comprehension**: Epiphany at the brink of death, inspiration from observing heavenly phenomena, a single sentence from a master, a flash of insight after prolonged contemplation
- **Conflict between Daos**: Different cultivators pursue different Daos; Daos may be mutually exclusive, creating a source of high-level conflict

When using `update_setting` for the cultivation system, the "Cultivation Resources" field should explicitly list "comprehension of the Dao" as the most critical cultivation resource, alongside material resources like spirit stones and pills.

---

### II. Xiuzhen-Specific Realm System Design

#### 2.1 The Classic Nine Realms and Variants

The classic xiuzhen realm system:

```
Qi Refining -> Foundation Building -> Core Formation (Golden Core) -> Nascent Soul -> Deity Transformation -> Integration -> Mahayana -> Tribulation Transcendence -> Ascension
```

The xiuzhen-specific meaning of each realm (as opposed to pure combat-power labels in xuanhuan):

| Realm | Xiuzhen Meaning | Signature Change | Lifespan Reference |
|-------|----------------|-----------------|-------------------|
| **Qi Refining** | Sensing spiritual energy; drawing it into the body | Can practice basic techniques | 150-200 years |
| **Foundation Building** | Constructing the cultivation foundation; spiritual energy undergoes qualitative change | Object-flight; expanded spiritual sense | 300-500 years |
| **Core Formation** | Spiritual energy condenses into a Golden Core, forming a "Dao seed" | Sword flight; the core contains Dao intent | 800-1,000 years |
| **Nascent Soul** | The Golden Core transforms into a Nascent Soul -- a second life like a newborn infant | Soul projection; clone techniques | 2,000-3,000 years |
| **Deity Transformation** | The Nascent Soul transforms into a divine being; begins touching the laws of heaven and earth | Initial law-based power; nascent domain | 5,000+ years |
| **Integration** | Body and primordial spirit merge as one; approaching the heavenly Dao | Complete domain; spatial shifting | Ten-thousand-year scale |
| **Mahayana** | On the verge of transcendence; begins resonating with the heavenly Dao | Space tearing; near-immortal power | Tens of thousands of years |
| **Tribulation Transcendence** | The heavenly Dao descends tribulation; the final test before ascension | Reborn through tribulation | Unlimited (if tribulation succeeds) |
| **Ascension** | Transcends the mortal realm; ascends to the immortal realm | Story endpoint or new chapter | Immortal |

#### 2.2 Narrative Density per Realm

Not every realm needs equal page time. Typical distribution in xiuzhen novels:

| Realm | Suggested Chapters | Core Narrative |
|-------|--------------------|----------------|
| Qi Refining | 30-50 | Entering the cultivation world, learning basics, sect bottom-tier survival |
| Foundation Building | 40-60 | First major challenge, sect tournament, first excursion |
| Core Formation | 50-80 | Leaving the sect, exploring the wider world, establishing one''s Dao |
| Nascent Soul | 60-100 | Becoming a regional power, sect-level conflicts, networking with elders |
| Deity Transformation | 40-60 | Continental-scale conflicts, political maneuvering, touching taboos |
| Integration / Mahayana | 30-50 | Ultimate conflicts, revealing the world''s true nature |
| Tribulation / Ascension | 20-30 | Final battle, tribulation, ascension or choosing to remain |

#### 2.3 Encoding the Realm System in update_setting

When using `update_setting` for the "Cultivation System," the "Realm Division" field should include:
- The complete nine-realm names and sub-divisions (e.g., Qi Refining Layer 1 through Layer 12)
- Breakthrough conditions for each realm: Dao comprehension requirements + resource requirements + tribulation requirements (if applicable)
- A realm-to-lifespan correspondence table
- Signature abilities for each realm

The "Technique / Specialization Branches" field should list xiuzhen-specific paths:
- Sword Cultivator: Pursues the Dao through the sword; highest combat power
- Pill Cultivator: Focuses on alchemy; extremely high social standing
- Artifact Cultivator: Focuses on forging; skilled at creating artifacts
- Talisman Cultivator: Focuses on talisman creation; versatile
- Formation Cultivator: Focuses on formations; balanced offense and defense
- Body Cultivator: Tempers the physical body; rare and formidable
- Soul Cultivator: Cultivates the divine soul; mysterious

The "Taboos and Risks" field should explicitly list:
- Qi deviation: Cultivating too hastily or with improper techniques causes spiritual energy to go out of control
- Inner demons: Obsessions manifest as inner demons that block breakthroughs
- Tribulation backlash: Consequences of failed tribulation -- minor cases cause severe injury and regression; major cases cause complete annihilation
- Dao foundation damage: Forced failed breakthroughs permanently injure the cultivation foundation

---

### III. Alchemy and Artifact Forging -- Xiuzhen''s Economy and Equipment System

#### 3.1 Pill Grade System

Pills simultaneously serve as **economic currency**, **cultivation aids**, and **strategic resources** in the xiuzhen world.

**Grade classifications** (two common systems):

System One (nine-grade):
```
Grade 1 pill (lowest) -> Grade 2 -> ... -> Grade 9 pill (highest, legendary)
Each grade divided into upper / middle / lower quality
```

System Two (three-tier):
```
Mortal-grade pills (usable by mortals) -> Spirit-grade pills (cultivator-exclusive) -> Immortal-grade pills (semi-divine items)
Each tier divided into upper / middle / lower grades
```

**Core pill categories**:

| Category | Representative Pills | Narrative Function |
|----------|---------------------|-------------------|
| **Cultivation type** | Essence Cultivation Pill, Spirit Gathering Pill, Qi Condensation Powder | Daily cultivation acceleration; economic foundation |
| **Breakthrough type** | Foundation Building Pill, Realm-Breaking Pill, Deity Transformation Pill | Catalysts at critical plot junctures |
| **Healing type** | Rejuvenation Pill, Life-Extension Pill, Blood Circulation Powder | Post-battle recovery; life-saving measures in emergencies |
| **Antidote type** | Universal Poison Pill, Mind-Clearing Powder | Solutions for poison-related plotlines |
| **Special type** | Youth-Preserving Pill, Disguise Pill, Concealment Pill | Tools for specific plot needs |

**Pill toxin mechanism**: Excessive pill consumption accumulates toxins in the body, slowing cultivation or even causing qi deviation. This is the critical limiter preventing "pop pills to become strong."

#### 3.2 Artifact Grade System

**Grade classification**:
```
Tools (Qi Refining / Foundation level) -> Spiritual instruments (Core Formation level) -> Treasures (Nascent Soul level) -> Immortal artifacts (Deity Transformation+ level) -> Dao artifacts (legendary level) -> Supreme treasures (objects of the heavenly Dao)
```

Each grade is subdivided into upper / middle / lower quality. The grade gap equals a realm gap: lower-grade artifacts are scrap metal before higher-grade ones.

**Xiuzhen-specific artifact features**:
- **Binding**: Artifacts require blood sacrifice or divine sense imprint to recognize their master
- **Nurturing**: Artifacts must be nurtured with a cultivator''s spiritual energy over time to reach full power
- **Artifact spirit**: High-grade artifacts may birth an artifact spirit with autonomous consciousness
- **Natal artifact**: A cultivator can refine one artifact into a natal artifact that grows alongside their cultivation
- **Self-detonation**: In emergencies, self-detonating an artifact causes massive damage but destroys the artifact

#### 3.3 Using create_prop for Pills and Artifacts

When creating a pill, the prop''s description should include:
- Grade and quality level
- Primary effects
- Refining difficulty and required materials (brief summary)
- Side effects or usage limitations (e.g., toxin accumulation, monthly dosage limit)
- Market price (in spirit stones)

When creating an artifact, the prop''s description should include:
- Grade and quality level
- Primary abilities (offense / defense / support / special)
- Activation requirements (what realm is needed to wield it)
- Special attributes (whether it has an artifact spirit, whether it can grow)
- Origin (bestowed by the sect / found in a secret realm / self-forged)

---

### IV. Sect Hierarchy and Ecosystem Design

#### 4.1 Sects as the Fundamental Social Unit of the Xiuzhen World

Unlike xuanhuan worlds where sects are merely "one type of faction," in the xiuzhen world **sects are the foundational support for cultivator survival and cultivation**. The reason rogue cultivators struggle is precisely because they lack what sects provide:
- Technique inheritance
- Regular cultivation resource allotments
- Guidance and Dao protection from elders
- Spiritual vein residences (cultivation environments)
- Social networks and information channels

#### 4.2 Sect Tier System

| Tier | Peak Power | Spiritual Vein Grade | Core Resources | Disciple Scale |
|------|-----------|---------------------|---------------|---------------|
| **Immortal Gate** | Has ascension records | Top-grade vein | Immortal-grade techniques, immortal artifacts | 100,000+ |
| **Super Sect** | Tribulation / Mahayana patriarch | Upper-grade vein | Abundant spirit-grade techniques | 10,000+ |
| **Major Sect** | Deity Transformation patriarch | Upper-middle vein | Several spirit-grade techniques | Several thousand |
| **Mid-level Sect** | Nascent Soul anchor | Middle-grade vein | Limited spirit-grade techniques | Around 1,000 |
| **Minor Sect** | Core Formation sect leader | Lower-grade vein | Primarily mortal-grade techniques | Around 100 |
| **Rogue Cultivator Settlement** | Foundation Building | No fixed vein | Self-gathered | Dozens |

#### 4.3 Internal Sect Structure

Standard hierarchy of a major sect:

```
Sect Master (supreme leader; usually the strongest or inheritor of the founder''s legacy)
|-- Grand Elders (retired seniors who intervene only in existential crises)
|-- Elder Council (manages daily sect affairs)
|-- Peak Masters (each peak specializes in one Dao: Sword Peak, Pill Peak, Artifact Peak...)
|   |-- Direct Disciples (personally taught by the Peak Master; highest aptitude)
|   |-- Inner Disciples (selected through trials; receive resource priority)
|   |-- Outer Disciples (basic resources; mostly self-reliant)
|-- Menial Disciples (handle sect chores; lowest status)
|-- Guest Elders (externally hired experts; not part of the sect''s inheritance lineage)
```

#### 4.4 The Master-Disciple System -- Core Narrative Relationship of Xiuzhen

The master-disciple relationship holds a significance in xiuzhen fiction far beyond the "mentor" role in xuanhuan:

**Narrative functions of the master-disciple bond**:
- **Transmitting the Dao**: The master passes on techniques, shares cultivation insights, and guides the disciple''s Dao comprehension direction
- **Dao protection**: The master guards the disciple during tribulation and intervenes when the disciple faces mortal danger
- **Karmic bond**: Master and disciple share a karmic relationship; the master''s kindness demands reciprocation
- **Emotional anchor**: The sect and master are a cultivator''s emotional home in the ruthless xiuzhen world
- **Conflict driver**: The master''s death or the sect''s destruction is the most powerful revenge motivation

**Designing a compelling master character**:
- High cultivation but with personal limitations (Dao injuries, lifespan running out, stuck at a certain realm)
- Has specific expectations for the protagonist (not vague "I see potential in you" but concrete reasons)
- Has their own storyline (the master''s past, the master''s enemies, the master''s unfinished legacy)
- The master''s teaching style should complement the protagonist''s cheat ability rather than replace it

#### 4.5 Using create_organization for Sects

When using `create_organization` to create a sect:
- **Type** = "宗门" (Sect)
- **Status and Influence** = Detailed description of the sect''s ranking and reputation in the xiuzhen world
- **Core Philosophy** = The sect''s cultivation philosophy (e.g., "Proving the Dao through the sword," "All laws return to one," "Yin-yang harmony")
- **Resources and Specialties** = The sect''s unique techniques, spiritual veins, and sect-guarding treasure
- **Organizational Structure** = The specific hierarchy detailed above
- **Relationships with Other Factions** = Allies, rivals, subordinate relationships

The description should additionally include:
- The sect''s Dao lineage (who was the founder, how many generations of inheritance)
- The sect''s signature techniques (at least one iconic cultivation method or spell)
- The sect''s core contradictions (internal factional struggles, resource allocation disputes, inheritance crises)

---

### V. Xiuzhen Narrative Milestones

#### 5.1 Realm-Driven Narrative Structure

Each realm segment in a xiuzhen novel corresponds to a relatively self-contained narrative arc with its own world, rules, and stakes. Advancing to a new realm means entering a new "game."

| Realm Arc | Core Narrative | World Scope | Core Conflict |
|-----------|---------------|-------------|--------------|
| **Qi Refining arc** | Entering the xiuzhen world; learning basics; sect bottom-tier survival | Within the sect | Peer bullying; resource grabbing |
| **Foundation Building arc** | First major test; proving one''s worth | Sect and surroundings | Sect tournament; external threats |
| **Core Formation arc** | Leaving the sect; exploring the wider world; establishing one''s path | A regional area | Secret realm disputes; faction clashes |
| **Nascent Soul arc** | Building reputation; becoming a regional powerhouse | Continental scope | Sect-level wars; high-level maneuvering |
| **Deity Transformation arc** | Touching taboos; uncovering the world''s deeper secrets | Realm-wide scope | Continental wars; heavenly Dao constraints |
| **Late-stage arc** | Ultimate conflicts; tribulation and ascension | Multi-realm | Ultimate enemy; tribulation of the heavenly Dao |

#### 5.2 Typical Milestone Events

Each realm arc should include the following types of milestone events (mappable to the chapter''s "Plot Type" field):

**Setup type** (Plot Type = Setup):
- Acquiring new techniques or resources
- Discovering new threats or opportunities
- Establishing new relationships

**Conflict type** (Plot Type = Conflict):
- Direct confrontation with peers
- Encounters with higher-realm enemies (crushed or narrowly escaping)
- Escalating friction between sects / factions

**Climax type** (Plot Type = Climax):
- Realm breakthroughs (especially those requiring tribulation)
- Decisive battles in large-scale combat
- Revelation of critical secrets

**Transition type** (Plot Type = Transition):
- Secluded cultivation
- Alchemy / artifact forging passages
- Travel observations and encounters

**Resolution type** (Plot Type = Resolution):
- Post-battle settlements
- Cataloging gains (new artifacts, new techniques, new allies)
- Planting seeds for the next realm arc

#### 5.3 Xiuzhen-Specific Use of Emotional Tone

The chapter''s "Emotional Tone" field takes on special meaning in xiuzhen narrative:

- **Light-hearted**: Sect daily life, browsing the market city, casual sparring with peers
- **Tense**: Secret realm exploration, enemy pursuit, pre-tribulation preparations
- **Sorrowful**: Master''s fall, fellow disciples'' death in battle, Dao companion separation
- **Warm**: Master-disciple Dao discussions, sect gatherings, Dao companion dual cultivation
- **Intense**: Large-scale sect warfare, tribulation crossing, life-or-death combat
- **Suspenseful**: Ancient ruin exploration, gradual conspiracy reveals, mysteries of one''s origins

---

### VI. Heavenly Tribulation and Dao Comprehension -- Xiuzhen''s Most Unique Narrative Tools

#### 6.1 The Nature of Heavenly Tribulation

Heavenly tribulation is not "a harder boss fight." It is **the heavenly Dao''s response to cultivators who defy fate** -- the higher your cultivation and the greater your defiance, the fiercer the tribulation. This means:
- The protagonist faces stronger tribulation than same-realm peers because the cheat ability makes them more "heaven-defying"
- Tribulation intensity is a visual gauge of "how defiant you are"
- Tribulation cannot be fled from, surrendered to -- only faced head-on
- Tribulation is a public event -- the tribulation phenomena are visible for thousands of miles

#### 6.2 Types of Heavenly Tribulation

| Tribulation Type | Characteristics | Suitable Scene |
|-----------------|----------------|---------------|
| **Thunder tribulation** (雷劫) | The most classic; heavenly lightning strikes from above | Standard tribulation scene |
| **Fire tribulation** (火劫) | Heavenly fire immolation | Fire-attribute cultivators or alchemist tribulations |
| **Wind tribulation** (风劫) | Astral wind tears the body apart | Sword cultivators or speed-type cultivator tribulations |
| **Inner demon tribulation** (心魔劫) | Inner demon invasion; a test on the mental plane | High-realm breakthroughs, Dao heart tests |
| **Hybrid tribulation** (混合劫) | Multiple tribulation types stacked | Protagonists with extreme heaven-defying levels |
| **Variant tribulation** (变异劫) | Purple tribulation / nine-color tribulation and other non-standard forms | Critical plot turning points |

#### 6.3 Tribulation Scene Design Template

A complete tribulation scene should include:

1. **Pre-tribulation preparation** (1-2 chapters): Selecting the tribulation site, setting up protective formations, preparing life-saving pills and artifacts, arranging Dao protectors
2. **Tribulation clouds descend** (0.5-1 chapter): Heavenly phenomena shift, tribulation clouds gather, surrounding cultivators are shocked by the tribulation''s scale
3. **Head-on endurance** (2-4 chapters): Each successive wave of tribulation grows stronger, protagonist''s injuries worsen, various methods are deployed in sequence
4. **The most dangerous moment** (1-2 chapters): Apparent certain defeat, final trump card, enlightenment born from desperation
5. **Post-tribulation transformation** (0.5-1 chapter): Tribulation disperses, cultivation undergoes metamorphosis, reactions from all parties

#### 6.4 Dao Comprehension as Breakthrough Mechanism

Unlike xuanhuan where "accumulating enough spiritual energy triggers a breakthrough," the core of xiuzhen breakthroughs is **Dao comprehension**:

**Triggers for sudden enlightenment**:
- Epiphany at the brink of death (the most classic -- suddenly understanding something in a desperate moment)
- Observing natural phenomena (comprehending truths from the alternation of sun and moon, thunderstorms, flowers blooming and withering)
- Inspiration during combat (being sparked by an opponent''s Dao during a fight with a powerful enemy)
- A single sentence from an elder (the listener finds meaning; one phrase awakens the dreamer)
- Worldly experience (elevation after experiencing the full range of mortal life in the mundane world)

**The contest between Dao Heart and Inner Demons**:
- Dao Heart = unwavering conviction in one''s cultivation path
- Inner Demons = obsessions, fears, greed, and anger within the heart
- Every high-realm breakthrough triggers an inner demon challenge
- The way to overcome inner demons is not "defeating them" but "accepting and transcending them"
- Inner demon content should relate to the protagonist''s actual experiences (e.g., a transmigrator''s longing for their original world, guilt toward loved ones)

---

### VII. Xiuzhen-Specific Character Design Notes

#### 7.1 Using create_character for Xiuzhen Characters

When creating characters:
- **Race** = Human / Demon Beast / Devil, etc. (humans are mainstream in the xiuzhen world)
- **Status and Position**:
  - **Affiliated Faction** = Specific sect name (e.g., "Azure Cloud Sect")
  - **Profession** = Cultivation specialization (e.g., "Sword Cultivator," "Pill Cultivator")
  - **Sect Role** = Position within the sect (e.g., "Inner Disciple," "Elder")
  - **Realm** = Current cultivation realm (e.g., "Mid Core Formation")
  - **Rank** = Relative strength within the same realm (e.g., "Can fight above their realm at Core Formation")
  - **Title** = Xiuzhen world title (e.g., "Azure Cloud Sword Immortal," "Ten-Thousand Poisons Rogue")

#### 7.2 Unique Elements of Xiuzhen Characters

Each important character''s description should also include:
- **Spirit root attributes**: Single / dual / triple / mixed / variant spirit root -- directly determines cultivation talent
- **Cultivation technique**: Name and grade of the technique currently practiced
- **Natal artifact**: Signature weapon or defensive item
- **Dao direction**: What kind of Dao this character pursues
- **Inner demons / weaknesses**: The character''s spiritual vulnerabilities

---

### VIII. Tool Usage Guide

#### 8.1 update_setting for the Cultivation System

Core settings for the xiuzhen system:
- **Power System Type** = "Xiuzhen"
- **Realm Division** = Complete nine realms + sub-divisions per realm + lifespan table + tribulation correspondence
- **Cultivation Resources** = Spirit stone system + pill system + rare natural treasures + Dao comprehension opportunities (must include)
- **Technique / Specialization Branches** = Sword / Pill / Artifact / Talisman / Formation / Body / Soul cultivation
- **Taboos and Risks** = Qi deviation + inner demons + tribulation backlash + Dao foundation damage

#### 8.2 create_organization for Sects

Every sect is a complete social microcosm:
- Specify the sect tier (refer to Section IV)
- Clearly describe internal structure and power dynamics
- Mark core techniques and lineage
- Describe the sect''s unique culture and philosophy
- Define the core contradiction the sect faces

#### 8.3 create_character for Characters

Xiuzhen characters require extra attention to:
- Spirit root attributes and cultivation path
- Affiliated sect and internal rank
- Dao direction and inner demon setup
- Natal artifact and commonly used pills

#### 8.4 create_prop for Pills and Artifacts

Pills and artifacts form the economic foundation and combat core of the xiuzhen world:
- Specify grade and market value
- Clearly describe effects and usage limitations
- Mark refining difficulty and material requirements
- Compatibility with characters (who can and cannot use it)

#### 8.5 create_scene for Xiuzhen Scenes

Xiuzhen scenes should reflect the presence of spiritual energy and the Dao:
- Sect scenes: Spiritual vein distribution, formation protections, functional zone layout
- Secret realm scenes: Spiritual energy density, danger level, potential fortunes
- Tribulation scenes: Conditions suitable for tribulation, impact radius
- Market city scenes: Types of pills and artifacts traded, price ranges

---

### IX. Common Mistakes

| Mistake | Problem | Correct Approach |
|---------|---------|-----------------|
| **Writing xiuzhen as reskinned xuanhuan** | Just swapping "battle aura" for "spiritual energy" with no substantive change | Emphasize Dao comprehension, tribulation, karma, and other xiuzhen-unique mechanisms |
| **Turning Dao comprehension into "cultivate long enough and break through"** | Loses the core tension of xiuzhen | Dao comprehension should have specific triggers and dramatic moments |
| **Sects as mere backdrop** | The sect has no internal ecology; it just gives the protagonist an origin story | Sects should have complete power structures, resource allocation, and internal conflicts |
| **Pills as cure-alls** | Every problem solved by popping a pill | Pill toxin mechanics + grade restrictions + scarcity controls |
| **Tribulation scenes lack ceremony** | Tribulation scenes are rushed through | Tribulation is xiuzhen''s most important climax; give it ample page space |
| **Flat master-disciple relationships** | The master is just "an NPC who gives the protagonist techniques" | The master should have their own storyline, limitations, and expectations |
| **Inner demons reduced to formality** | Inner demon appearances are just "fighting monsters in an illusion" | Inner demons should stem from the character''s real experiences and inner conflicts |
| **Ignoring the law of karma** | The protagonist faces no consequences for their actions | Karma is a fundamental rule of the xiuzhen world; great kindness and great enmity all carry karmic weight |',
  (SELECT id FROM novel_creation_method WHERE name = '异世界修真穿越小说' LIMIT 1),
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
