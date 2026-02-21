-- 异世界玄幻穿越小说「世界观」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '异世界玄幻穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-xuanhuan-crossing-worldview-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xuanhuan-crossing-worldview-setting-gen',
  '「世界观」设定生成：为异世界玄幻穿越小说生成世界观设定，包括世界名称、时代背景、历史背景、地理版图、种族格局、政治格局、社会制度、经济民生、文化风俗、核心禁忌与规则',
  '"World Setting" setting generation: generate world setting for isekai xuanhuan crossing novels, including world name, era background, history, geography, racial landscape, politics, society, economy, culture, and core taboos/rules',
  '## 「世界观」设定生成 — 异世界玄幻穿越小说

世界观是所有设定的容器。一个好的玄幻世界应该让读者觉得"这个世界很大，探索不完"。世界观设定与修炼体系紧密耦合——修炼体系定义了力量规则，世界观定义了力量运作的舞台。

---

### 字段生成指南

#### 世界名称

取一个有玄幻感的名字，体现世界的核心特征。

好例子：
- 「天玄大陆」「九域神界」「万灵位面」
- 名称应暗示世界的核心元素（灵气、元素、混沌等）

避免：
- 过于普通或直白的名字（"修炼大陆"、"魔法世界"）
- 与知名作品重名

#### 时代背景

确定世界当前的"大环境"，直接影响资源充裕度和冲突基调：

| 时代类型 | 特点 | 对剧情的影响 |
|---------|------|------------|
| 万族并存的太古时代 | 种族繁多，资源丰富 | 种族冲突为主线 |
| 修炼文明鼎盛的黄金纪元 | 强者如云，竞争激烈 | 天才争锋，资源竞争 |
| 灵气衰退的末法时代 | 资源匮乏，修炼困难 | 生存压力大，逆袭感更强 |
| 大战之后的废墟纪元 | 遗迹遍布，秩序崩塌 | 探索和重建为主题 |

**设计建议**：末法时代和废墟纪元更适合"逆袭爽文"——资源越稀缺，主角的金手指优势越突出。黄金纪元适合"天才争锋"——强者越多，打脸越爽。

#### 历史背景

为世界构建纵深感，历史背景是伏笔和悬念的宝库：

需要设计的历史层次：
- **远古大战和封印**：上古强者之间的战争，留下的封印和遗迹
- **上古文明的遗迹和传说**：失落的文明、消失的种族、被遗忘的功法
- **灭世级BOSS的历史传闻**：某个被封印的存在、某场差点毁灭世界的灾难
- **当前局势的历史成因**：为什么世界是现在这个样子

**设计原则**：
- 历史不需要一次性全部揭示，应随主角探索逐步展开
- 历史事件应与主线剧情产生关联（远古遗迹中的功法、封印即将解除等）
- 历史中的强者等级应远超当前时代，为"天外有天"留下空间

#### 地理版图

玄幻世界的地理应该**分层嵌套、逐步展开**，与主角境界提升同步揭示：

```
起始区域（一个城镇/宗门）
  ↓
地区（一个国家/势力范围）
  ↓
大陆（多个国家/势力并存）
  ↓
界域（多个大陆/位面）
  ↓
更高维度（仙界/神界/虚空等）
```

| 地理层级 | 对应境界 | 活动范围 | 冲突规模 |
|---------|---------|---------|---------|
| 起始区域 | 低阶（1-3） | 小城镇/宗门 | 个人恩怨 |
| 地区 | 中阶（4-6） | 王国/大陆 | 势力争斗 |
| 大陆 | 高阶（7-9） | 大陆/位面 | 种族大战 |
| 界域/更高维度 | 巅峰（10+） | 多界域/宇宙 | 终极威胁 |

**设计原则**：
- 初期只揭示最近的地理范围，避免一开始就铺开整张世界地图
- 每次升级时揭示新的地理层级，给读者"世界比想象更大"的震撼感
- 不同地区的资源、修炼条件和势力格局要有差异
- 每个地理层级应有独特的地标和特色（灵山、禁地、秘境等）

#### 种族格局

种族多样性是玄幻世界的一大特色。种族设计应与修炼体系联动：

| 种族 | 特点设计方向 | 修炼优势 |
|------|------------|---------|
| **人族** | 数量多、天赋一般但修炼方向多样 | 功法种类最多，适应性强 |
| **妖族** | 兽类化人形，天生体魄强大 | 天生体修优势，血脉能力 |
| **魔族** | 天赋异禀但被其他种族敌视 | 特殊修炼体系，禁忌之力 |
| **精灵族** | 亲和自然，擅长某种特定能力 | 自然系法术，寿命悠长 |
| **龙族** | 血脉高贵，数量极少但个体极强 | 龙血觉醒，天生领域 |

**种族对角色设计的影响**：角色 Schema 中的「种族」字段支持以上选项及自定义。种族选择会影响角色的天赋、社会地位和互动方式。

**设计建议**：
- 不要所有种族和平共处——种族矛盾是天然的冲突来源
- 至少设计一个"被歧视的种族"和一个"高高在上的种族"
- 主角如果是人族，可以通过金手指获得其他种族的能力

#### 政治格局

大势力之间的博弈，是世界观的动态层面：

需要设计的势力关系：
- **人族各大帝国之间的争霸**：军事对抗、领土争端
- **不同种族之间的联盟与对抗**：种族战争、和平条约
- **修炼宗门/家族/帝国三方权力的制衡**：宗门超然于世俗、家族控制经济、帝国掌握军队
- **隐藏势力**：上古传承、秘密组织、被封印的远古势力

**设计建议**：政治格局不需要太复杂，但要有明确的"多方势力不可能同时满足"的核心矛盾，为主角的选择提供空间。

#### 社会制度

修炼者的社会分层，定义了权力和资源的分配方式：

- **修炼者与凡人的关系**：修炼者是统治阶级还是隐世群体？
- **宗门等级制度**：外门/内门/核心/长老的权力差异
- **修炼者的法律和规则**：高阶修士不能随意对低阶出手？杀人是否违法？
- **世俗政权与修炼势力的关系**：互相制衡还是修炼者凌驾于世俗之上？

#### 经济民生

围绕修炼资源的经济体系，是爽点场景的重要来源：

- **灵石/魔晶的开采和流通**：通用修炼货币的来源和价值体系
- **丹药、法器的交易市场**：修炼者的"商业街"
- **拍卖会**：经典的玄幻爽点场景——竞价、天价宝物、神秘买家
- **佣兵/冒险者任务系统**：主角赚取资源的主要途径之一

**设计建议**：经济系统应该为剧情服务——拍卖会是展示财力的场景，任务系统是引发冒险的触发器，资源稀缺是冲突的来源。

#### 文化风俗

修炼世界独有的文化特征，增强世界的真实感：

- **以实力为尊的价值观**：强者受尊敬，弱者被忽视
- **宗门大比、排名战等竞争文化**：定期的实力展示活动
- **拜师礼仪、修炼禁忌**：修炼者特有的社交规则
- **弱肉强食与道德底线的碰撞**：并非所有强者都是恶人，也有守护底线的存在

#### 核心禁忌与规则

世界运行的底层规则，是世界观一致性的保障：

- **天道法则的限制**：世界的最高规则是什么？谁也无法违反的是什么？
- **高阶修士不能随意对低阶出手的规矩**：为什么？违反后果是什么？
- **某些禁术/禁地的存在理由**：被封印的原因、擅入的后果
- **破坏规则的后果**：天劫降临？被世界意志排斥？被强者联手制裁？

**设计原则**：
- 核心规则要严格执行，否则世界观会崩塌
- 规则的存在是为了在关键时刻被"合理地打破"——打破规则本身就是一个超级爽点
- 规则应该对主角和反派都有约束力

---

### 设计原则总结

1. **由近及远**：先设计起始区域的细节，远处的世界留到后续揭示
2. **与修炼体系联动**：地理、种族、政治都应围绕修炼体系展开
3. **为冲突服务**：每个设定元素都应该能产生故事冲突
4. **留白和伏笔**：不要一次性揭示所有设定，为后续发展保留空间
5. **一致性**：所有子设定之间不能矛盾',
  '## "World Setting" Setting Generation — Isekai Xuanhuan Crossing Novel

The world setting is the container for all other settings. A good xuanhuan world should make readers feel the world is vast and inexhaustible to explore.

---

### Field Generation Guide

#### World Name
Choose a name with xuanhuan atmosphere reflecting core world characteristics. Good: "Tianxuan Continent," "Nine Domains Divine Realm." Avoid generic names.

#### Era Background
Determines resource abundance and conflict tone. Options: Primordial era of ten-thousand-race coexistence / Golden epoch of cultivation / End-law era of declining spiritual energy / Ruin epoch after great war. End-law and ruin epochs suit underdog stories; golden epochs suit genius competition.

#### Historical Background
Build depth: ancient wars and seals, lost civilizations, sealed apocalyptic bosses, causes of current situation. Reveal gradually with protagonist exploration.

#### Geographical Territory
Layered and gradually revealed, synchronized with realm progression: Starting area (town/sect) -> Region (nation) -> Continent (multiple nations) -> Realm (planes) -> Higher dimensions (immortal/divine realm). Only reveal nearest scope initially; expand with each power-up.

#### Racial Landscape
Design races with cultivation synergy: Human (diverse paths), Demon Beast (innate physique), Demon (gifted but discriminated), Elf (nature-attuned), Dragon (rare but overpowering). Include racial conflicts as natural tension sources.

#### Political Landscape
Multi-faction dynamics: empire competition, racial alliances/conflicts, sect-clan-empire power balance, hidden forces. Keep a clear core contradiction.

#### Social Systems
Cultivator social stratification: cultivator-mortal relations, sect hierarchy (outer/inner/core/elder), cultivator laws, secular-cultivation power dynamics.

#### Economy and Livelihood
Resource-centered economy: spirit stone mining/circulation, pill and artifact markets, auctions (classic satisfaction-point scene), mercenary/adventurer quest systems.

#### Cultural Customs
Cultivation world culture: strength-based values, sect tournaments and ranking battles, apprenticeship etiquette, tension between survival-of-the-fittest and moral baselines.

#### Core Taboos and Rules
Fundamental world rules: Heavenly Dao restrictions, rules against high-realm attacking low-realm, reasons for forbidden techniques/zones, consequences of breaking rules. Rules must be consistent but designed so breaking them creates major plot moments.',
  (SELECT id FROM novel_creation_method WHERE name = '异世界玄幻穿越小说' LIMIT 1),
  1,
  30,
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
