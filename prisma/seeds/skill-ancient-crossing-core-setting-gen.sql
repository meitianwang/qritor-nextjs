-- 古代架空穿越小说「核心设定」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '古代架空穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-ancient-crossing-core-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ancient-crossing-core-setting-gen',
  '「核心设定」设定生成：为古代架空穿越小说生成核心设定，包括穿越方式、穿越身份、主线剧情、感情线、故事基调',
  '"Core Setting" setting generation: generate core settings for ancient fictional crossing novels, including crossing method, crossing identity, main plot, romance line, and story tone',
  '## 「核心设定」设定生成 — 古代架空穿越小说

「核心设定」是故事的灵魂，决定了主角的起点、路径和终点。穿越方式、穿越身份和主线剧情三者的组合直接决定了故事的基本框架和走向。

---

### 字段生成指南

#### 穿越方式

定义主角如何来到这个架空古代世界。五种基本类型各有特点：

| 穿越方式 | 特点 | 适合的开场 |
|---------|------|-----------|
| **意外身亡后魂穿** | 最经典，现代人死后灵魂穿入古人身体 | 主角一开场就面临原身的困境 |
| **睡梦中穿越** | 较温和，一觉醒来人在古代 | 适合轻松基调的故事 |
| **被神秘力量召唤** | 有使命感，暗示有任务或回去的方法 | 适合有大主线的故事 |
| **触碰古物穿越** | 有仪式感，古物可以成为剧情线索 | 适合悬疑/双时空叙事 |
| **雷击穿越** | 传统经典，简单直接 | 适合快节奏故事 |

**设计要点**：
- 穿越方式可以成为后续剧情的伏笔（是否能回去？穿越是否有目的？）
- 魂穿时需要处理"原身"的记忆问题——主角是否继承了部分记忆？
- 穿越后与现代世界是否完全切断联系？

#### 穿越身份

穿越身份决定主角的起点难度和资源基础。七种身份各有不同的叙事空间：

| 穿越身份 | 起点难度 | 资源基础 | 适合主线 |
|---------|---------|---------|---------|
| **皇室宗亲** | ★★★ | 极高 | 宫斗夺嫡、权谋争霸 |
| **世家嫡女/嫡子** | ★★☆ | 高 | 宅斗逆袭、宫斗夺嫡 |
| **庶出子女** | ★★★ | 中 | 宅斗逆袭、复仇虐渣 |
| **落魄贵族** | ★★★★ | 低 | 复仇虐渣、经商致富 |
| **平民百姓** | ★★★★★ | 极低 | 种田发家、经商致富 |
| **奴婢/下人** | ★★★★★ | 无 | 宅斗逆袭、复仇虐渣 |
| **江湖人士** | ★★★★ | 低 | 江湖恩怨、复仇虐渣 |

**组合建议**：
- **高起点 + 内部危机**：皇室宗亲/嫡女身份，但面临被废黜、被陷害、被下毒的困境——读者喜欢看"含着金汤匙但即将失去一切"的反差
- **低起点 + 逆袭路线**：庶出/平民/奴婢身份，靠智谋和金手指一步步往上爬——经典逆袭叙事，爽感最强
- **特殊组合**：穿越为已死之人的替身、冒名顶替者、失忆者——自带身份悬念

#### 主线剧情

主线剧情决定故事的核心驱动力。八种类型覆盖古代架空穿越的主要方向：

| 主线类型 | 核心冲突 | 典型目标 | 爽点类型 |
|---------|---------|---------|---------|
| **宫斗夺嫡** | 夺取皇位/后位 | 登上权力巅峰 | 智谋博弈、阴谋反转 |
| **宅斗逆袭** | 家族内部争斗 | 掌控家族命运 | 打脸虐渣、步步上位 |
| **经商致富** | 商业竞争 | 成为首富/建立商业帝国 | 赚钱爽感、以智取胜 |
| **种田发家** | 从无到有的建设 | 过上富足生活 | 经营成就、生活改善 |
| **复仇虐渣** | 向仇人复仇 | 让坏人付出代价 | 虐渣快感、正义伸张 |
| **权谋争霸** | 参与天下大势 | 辅佐明君/夺取天下 | 运筹帷幄、格局宏大 |
| **江湖恩怨** | 江湖纷争 | 查明真相/报仇雪恨 | 武打场面、快意恩仇 |
| **甜宠日常** | 感情发展 | 与爱人幸福生活 | 甜蜜互动、温馨日常 |

生成时应与穿越身份和金手指类型形成合理搭配。

#### 感情线

感情线为故事增添情感维度。七种选项各有不同的叙事节奏：

- **一对一甜宠**：男女主从相遇到相知相爱，全程甜蜜——适合轻松基调
- **先婚后爱**：先成婚后培养感情，冷淡→暧昧→热恋——制造反差萌
- **破镜重圆**：曾经的恋人因误会分开，最终和好——虐心后甜蜜加倍
- **欢喜冤家**：初见不合，斗嘴拌嘴中产生感情——轻松有趣
- **青梅竹马**：自幼相识，感情水到渠成——温馨自然
- **日久生情**：长期相处中慢慢被对方吸引——最真实的发展
- **无CP事业线**：专注事业和权谋，不设感情线——纯粹的权谋/种田体验

#### 故事基调

故事基调决定全书的情感氛围和叙事节奏：

- **轻松爽文**：快节奏、多打脸、主角一路顺风——读者解压首选
- **细腻虐心**：情感细腻、有虐有甜、催人泪下——适合感情线为主的故事
- **权谋烧脑**：计中计、局中局、智商在线——适合宫斗/权谋主线
- **温馨治愈**：日常温馨、岁月静好、慢节奏——适合种田/甜宠主线
- **热血励志**：主角从逆境中崛起、永不放弃——适合低起点逆袭

---

### 组合建议与搭配原则

生成核心设定时，应确保各字段之间的逻辑自洽：

1. **穿越身份 + 主线剧情**的搭配要合理（平民很难直接参与宫斗）
2. **感情线**要与主线类型匹配（权谋争霸不太适合纯甜宠感情线）
3. **故事基调**要与主线和感情线一致（复仇虐渣配轻松爽文 vs 细腻虐心有不同效果）
4. 如果已有金手指设定，穿越身份应与金手指类型相辅相成',
  '## "Core Setting" Setting Generation — Ancient Fictional Crossing Novel

The "Core Setting" is the soul of the story, determining the protagonist''s starting point, path, and destination. The combination of crossing method, crossing identity, and main plot directly defines the story''s basic framework and direction.

---

### Field Generation Guide

#### Crossing Method
Defines how the protagonist arrives in the fictional ancient world. Five basic types:
- Soul transmigration after accidental death (most classic, protagonist immediately faces original body''s predicament)
- Crossing through dreams (gentler, suitable for lighter-toned stories)
- Summoned by mysterious force (sense of mission, suitable for grand main plots)
- Crossing by touching ancient artifact (ceremonial, suitable for mystery/dual-timeline)
- Lightning strike crossing (traditional, simple and direct, suitable for fast-paced stories)

Design considerations: Can the crossing method foreshadow future plot points? Does the protagonist inherit the original body''s memories? Is the modern world connection fully severed?

#### Crossing Identity
Determines starting difficulty and resource base. Seven identity types:
- Imperial royalty (★★★, very high resources) -> palace intrigue, political strategy
- Noble legitimate child (★★☆, high resources) -> household rivalry, palace intrigue
- Concubine-born child (★★★, medium resources) -> household rivalry, revenge
- Fallen aristocrat (★★★★, low resources) -> revenge, commerce
- Commoner (★★★★★, very low resources) -> farming, commerce
- Servant/slave (★★★★★, no resources) -> household rivalry, revenge
- Martial arts wanderer (★★★★, low resources) -> martial arts feuds, revenge

Recommended combinations: High start + internal crisis, Low start + rise route, Special combos (body double, impersonator, amnesiac).

#### Main Plot
Eight types covering all major directions: Palace intrigue, Household rivalry, Commerce/wealth, Farming/homesteading, Revenge, Political strategy, Martial arts feuds, Sweet romance. Should form logical pairings with crossing identity and cheat ability.

#### Romance Line
Seven options with different narrative rhythms: One-on-one sweet romance, Marriage before love, Reconciliation, Bickering couple, Childhood friends, Slow-burn love, No CP career focus.

#### Story Tone
Five options determining emotional atmosphere: Light and satisfying, Delicate and bittersweet, Strategic and brain-burning, Warm and healing, Passionate and inspirational.

---

### Combination Principles
1. Crossing identity + main plot must be logically paired
2. Romance line should match the main plot type
3. Story tone must be consistent with main plot and romance
4. If cheat ability already exists, crossing identity should complement it',
  (SELECT id FROM novel_creation_method WHERE name = '古代架空穿越小说' LIMIT 1),
  1,
  51,
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
