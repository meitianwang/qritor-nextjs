-- 古代架空穿越小说「世界观」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '古代架空穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-ancient-crossing-worldview-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ancient-crossing-worldview-setting-gen',
  '「世界观」设定生成：为古代架空穿越小说生成世界观设定，包括王朝名称、时代背景、历史背景、地理版图、政治格局、社会制度（官制/爵位/科举/婚姻）、经济民生、文化风俗',
  '"World Setting" setting generation: generate worldview settings for ancient fictional crossing novels, including dynasty name, era background, historical background, geographical territory, political landscape, social institutions (official system/nobility/imperial examinations/marriage), economy and livelihood, culture and customs',
  '## 「世界观」设定生成 — 古代架空穿越小说

「世界观」是整个故事的舞台。一个精心设计的架空王朝能让读者沉浸其中，相信这个世界是真实存在的。世界观设定的完整度直接决定了故事的可信度和代入感。

---

### 字段生成指南

#### 王朝名称

王朝名称是世界观的第一印象，需要具备古韵和气势。

**设计要点**：
- 取一个有古韵的名字：大燕、北齐、南梁、大晋、昭国
- **必须避免直接使用真实朝代名称**（唐、宋、明、清）——那是历史穿越，不是架空穿越
- 名称要体现王朝特质（如"武"字暗示尚武之风，"文"字暗示崇文传统）
- 可参考真实朝代取相似但不同的名字

#### 时代背景

时代背景决定了故事的大环境氛围。根据主线剧情选择最合适的时代类型：

| 时代类型 | 特点 | 适合的主线 |
|---------|------|-----------|
| **开国盛世** | 国力强盛，机会多，社会流动性高 | 经商致富、甜宠日常 |
| **中兴之世** | 表面稳定但暗流涌动，派系林立 | 宫斗夺嫡、权谋争霸 |
| **王朝末年** | 动荡不安，危机四伏，民不聊生 | 复仇虐渣、权谋争霸 |
| **乱世割据** | 群雄并起，弱肉强食，秩序崩溃 | 权谋争霸、江湖恩怨 |
| **和平年代** | 社会稳定，礼教森严，阶层固化 | 宅斗逆袭、种田发家 |

生成时应参考已有的核心设定中的「主线剧情」类型，选择最匹配的时代背景。

#### 历史背景

历史背景为王朝提供纵深感，让架空世界有根基：
- 王朝建立了多少年？经历了几代帝王？
- 有哪些重大历史事件影响至今？（开国之战、夺嫡之争、外族入侵等）
- 当前皇帝的在位情况如何？（刚登基/在位多年/年迈体衰）
- 这些历史事件如何影响当前的政治格局和势力分布？

#### 地理版图

地理版图定义疆域和活动空间。不同的地理区域为不同类型的故事提供舞台：

- **京城**：权力中心，宫斗和朝堂戏的主要舞台
- **各州/各郡**：地方势力的根基，封地、赴任的目的地
- **边疆**：军事冲突、流放贬谪的场所，将领割据的温床
- **江南/富庶之地**：经商致富的舞台，文人荟萃之所
- **山野/乡村**：种田发家的空间，隐居避世的去处

生成时应根据主线类型突出最相关的地理区域。

#### 政治格局

政治格局是权谋类故事的核心背景，定义各方势力的权力分布：
- 皇权是否稳固？皇帝的性格和执政风格？
- 有哪些世家大族把持朝政？其势力范围和核心利益？
- 外戚和后宫对朝政的影响力有多大？
- 宦官集团是否掌权？文官武将的势力分布如何？
- 边疆将领的忠诚度？是否存在拥兵自重的隐患？

#### 社会制度

「社会制度」是一个嵌套对象，包含四个子字段。每个子字段都需要详细设定：

**官制**：
- 品级制度（几品几阶，如正一品到从九品）
- 核心官职（丞相/六部尚书/都御史/翰林学士等）
- 文武官员的升迁路径（科举入仕/军功晋升/恩荫/举荐）

**爵位**：
- 爵位等级（亲王/郡王/国公/侯/伯/子/男）
- 世袭规则（降等袭爵 vs 不降等世袭）
- 爵位与实权的关系（有爵无职 vs 有爵有职）

**科举**：
- 考试层级（童试/乡试/会试/殿试）
- 科举对寒门子弟的意义（改变命运的唯一正途）
- 考试内容和录取规则（经义/策论/诗赋，录取比例）

**婚姻**：
- 嫡庶制度的具体规定（嫡妻/平妻/妾室的地位差异）
- 婚姻对家族联姻的政治意义（门当户对/政治联盟）
- 女性在婚姻中的地位和权力（嫁妆/管家权/生育）
- 和离/休妻的条件（七出三不去）

#### 经济民生

经济民生影响经商和种田类故事的合理性：
- **货币制度**：铜钱/银两/银票的换算关系
- **物价水平**：普通百姓的月收入、一餐饭多少钱、一匹布多少钱
- **商业环境**：是否重农抑商？商人社会地位如何？有无行商/坐商之分？
- **税收制度**：农税、商税、徭役的具体规定

#### 文化风俗

文化风俗为故事增添真实感和生活气息：
- **节日习俗**：上元节（元宵）、端午、中秋、除夕等重要节日及其庆祝方式
- **礼仪规范**：见面礼（作揖/万福/跪拜）、用餐礼仪、书信格式、称谓规范
- **禁忌**：女子抛头露面、男女大防、犯讳（皇帝名讳需避讳）等
- **服饰文化**：不同身份（皇室/官员/百姓/商人）的着装规范和限制

---

### 生成原则

1. **内部一致性**：所有子字段之间不能矛盾（如设定和平年代却描述战火纷飞）
2. **服务主线**：世界观设定要为主线剧情提供舞台和冲突来源
3. **留有空间**：不要把所有细节都写死，为后续创作留出扩展空间
4. **避免照搬**：虽然参考真实历史，但要有自己的创新和差异化',
  '## "World Setting" Setting Generation — Ancient Fictional Crossing Novel

The "World Setting" is the stage for the entire story. A carefully designed fictional dynasty immerses readers and makes them believe this world truly exists. The completeness of worldview settings directly determines the story''s credibility and immersion.

---

### Field Generation Guide

#### Dynasty Name
The first impression of the world. Must have classical elegance and grandeur. **Must avoid real dynasty names** (Tang, Song, Ming, Qing) — that belongs to historical crossing. Choose names like Da Yan, Bei Qi, Nan Liang, Da Jin, Zhao Guo.

#### Era Background
Determines the macro-level atmosphere. Select based on the main plot type:
- Founding prosperity (strong, many opportunities) -> commerce, sweet romance
- Mid-dynasty renaissance (stable surface, undercurrents) -> palace intrigue, political strategy
- Late dynasty decline (turbulent, crises everywhere) -> revenge, political strategy
- Warring states era (warlords, survival of fittest) -> political strategy, martial arts feuds
- Peaceful era (stable, strict social norms) -> household rivalry, farming

#### Historical Background
Provides depth: dynasty age, number of emperors, major past events, current emperor''s reign status, and how history shapes the current political landscape.

#### Geographical Territory
Defines the domain and activity spaces:
- Capital city (power center, court/palace intrigue stage)
- Provinces/prefectures (regional power bases)
- Frontiers (military conflict, exile)
- Prosperous regions like Jiangnan (commerce stage)
- Rural areas (farming/homesteading space)

#### Political Landscape
Core backdrop for political stories: imperial power stability, great family influence, consort clan power, eunuch factions, civil-military balance, frontier general loyalty.

#### Social Institutions
A nested object with four sub-fields:
- **Official System**: Rank tiers, key positions, advancement paths
- **Nobility**: Title hierarchy, inheritance rules, title-power relationship
- **Imperial Examinations**: Exam levels, significance for commoners, content and admission rules
- **Marriage**: Legitimate/concubine-born rules, political marriage alliances, women''s status, divorce conditions

#### Economy and Livelihood
Affects commerce and farming storylines: currency system and conversion rates, price levels and commoner income, business environment and merchant status, tax system.

#### Culture and Customs
Adds authenticity: festival customs, etiquette norms (greetings, dining, letters), taboos (gender segregation, name taboos), dress codes for different social statuses.

---

### Generation Principles

1. **Internal consistency**: No contradictions between sub-fields
2. **Serve the main plot**: Worldview should provide stage and conflict sources for the story
3. **Leave room**: Don''t over-specify; leave expansion space for later creation
4. **Avoid copying**: Reference real history but innovate and differentiate',
  (SELECT id FROM novel_creation_method WHERE name = '古代架空穿越小说' LIMIT 1),
  1,
  50,
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
