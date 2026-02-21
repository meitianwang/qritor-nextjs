-- 异世界修真穿越小说「世界」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '异世界修真穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-xiuzhen-crossing-world-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xiuzhen-crossing-world-setting-gen',
  '「世界」设定生成：为异世界修真穿越小说生成世界设定，包括世界名称、时代背景、历史背景、地理版图、种族格局、政治格局、社会制度、经济民生、文化风俗、核心禁忌与规则',
  '"World Setting" setting generation: generate world settings for isekai cultivation crossing novels, including world name, era background, historical background, geographical territory, racial landscape, political landscape, social systems, economy and livelihood, cultural customs, core taboos and rules',
  '## 「世界」设定生成 — 异世界修真穿越小说

「世界」是 singleton 设定，是整个修真世界的根基。修真世界与通用玄幻世界有本质区别：其文化根基是道家哲学与中国传统神话，一切设定的底层逻辑是「道」——天地运行的根本规则。

---

### 字段生成指南

#### 世界名称

取名要有仙侠韵味，暗示修真世界的特征：
- 好的示例：「苍穹仙域」「九天玄界」「太虚道域」「混沌灵界」
- 避免：过于现代或西方奇幻感的名称（如「魔法大陆」「精灵王国」）
- 命名原则：用「域」「界」「天」「玄」「灵」「仙」等带有修真色彩的字

#### 时代背景

修真世界的时代通常用纪元来表述，时代背景决定了修炼难度和资源稀缺程度，直接影响主角的成长节奏：

| 时代类型 | 特点 | 适合剧情 |
|---------|------|---------|
| 上古时代 | 天地初开，灵气充沛，大能遍地 | 适合作为传说背景，不宜作为故事当前时代 |
| 中古时代 | 灵气渐衰，宗门崛起，秩序形成 | 经典修真设定，宗门争斗为主 |
| 末法时代 | 灵气稀薄，修真艰难 | 制造穿越者困境，增加修炼难度 |
| 灵气复苏 | 灵气重新涌现，旧秩序崩塌 | 大变革剧情，适合逆袭 |

#### 历史背景

修真世界的历史围绕以下核心主题构建：
- **上古大战**：仙魔大战、封神之战等远古事件，留下遗迹和传承
- **宗门兴衰**：哪些宗门曾经辉煌又衰落，为什么（灵脉枯竭、内斗、外敌入侵）
- **天才传说**：历史上的天才修士（万年一遇的天灵根、逆天渡劫成功者），为后续机缘埋伏笔
- **禁忌历史**：某些被封印的真相、被禁止的功法来源

#### 地理版图

修真世界的地理与灵气分布密切相关，这是区别于通用玄幻的关键特征：
- **灵脉分布**：灵气浓郁之处是宗门驻地、修炼圣地。灵脉品质分为：凡品灵脉、灵品灵脉、仙品灵脉
- **洞天福地**：独立小空间，通常是大能遗留，内含传承和宝物。是修真世界特有的地理元素
- **秘境**：定期开启的危险区域，充满机缘和凶险。常作为主角获得突破资源的场所
- **禁地**：极度危险之处，往往封印着上古凶兽或魔物
- **凡人界与修真界**：是否有界限？如何互通？修真界是否隐藏于凡人世界之中
- **上界与下界**：是否存在更高层次的世界？飞升去往何处？这决定了故事的终极天花板

#### 种族格局

修真世界常见种族及其修炼特点：
- **人族**：数量最多，资质参差，靠功法和丹药弥补
- **妖族**：以兽修为主，化形需要渡劫，天赋各异
- **魔族**：修炼魔功，速度快但容易入魔
- **灵族**：天生亲近某种灵力（如木灵族、冰灵族）
- 种族设定影响角色设计，主角穿越后可能面临种族歧视或种族优势

#### 政治格局

修真世界的政治格局由实力决定：
- **一方霸主**：化神/渡劫期老祖坐镇的超级大宗门
- **四方势力**：几大宗门或世家的势力均衡
- **散修联盟**：无门无派的散修组织
- **暗势力**：魔道、邪修、禁忌组织
- 政治格局要标注各势力的修为上限（镇派老祖的境界），这决定了世界的实力天花板

#### 社会制度

修真社会的独特制度：
- **宗门制度**：宗主 → 长老 → 内门弟子 → 外门弟子 → 杂役弟子。层级分明，修为即地位
- **世家制度**：家主 → 嫡系 → 旁系 → 附庸。以血脉传承为核心
- **散修规则**：坊市交易、拍卖会、佣兵任务
- **天道律令**：修真世界的硬性规则（如渡劫不可外力干预、以大欺小会遭天罚）。这是修真世界区别于通用玄幻的核心特征之一

#### 经济民生

灵石经济是修真世界的命脉：
- **货币体系**：下品灵石 → 中品灵石 → 上品灵石 → 极品灵石（通常 100:1 递进）
- **核心资源**：灵草灵药、矿石材料、丹药成品、法宝法器
- **交易场所**：坊市、拍卖行、宗门内部兑换
- **资源争夺**：灵脉矿脉的归属权是宗门间冲突的主要原因
- **凡人经济**：灵石经济与凡人的金银经济如何共存

经济体系要自洽：一颗筑基丹值多少灵石？一把灵器值多少？这些数字要在设定中保持一致。

#### 文化风俗

修真世界的文化以道家文化为底色：
- **修炼文化**：闭关、论道、斗法、切磋
- **师徒关系**：一日为师终身为父，师门传承是核心纽带
- **宗门大比**：定期举行的门派比武/炼丹/炼器大会，是故事高潮的常见载体
- **天才排行**：各种排行榜（天骄榜、丹师榜、法宝榜），制造竞争氛围
- **寿元观念**：修为越高寿命越长，凡人在修士眼中如蝼蚁。这种寿元差距是修真世界独有的冲突来源

#### 核心禁忌与规则

修真世界的天道规则是不可违背的铁律：
- **天劫规则**：突破特定境界必须渡劫，渡劫失败则形神俱灭
- **因果律**：欠下因果必须偿还，强行抹杀因果会遭天道反噬
- **大道五十天衍四九**：天道总留一线生机
- **以大欺小**：高境界修士欺压低境界者会遭天道惩罚（需明确具体条件）
- **禁忌功法**：某些功法会引来天罚（如夺舍、炼魂、逆天改命术）

核心禁忌是修真世界的硬性约束，也是剧情冲突的重要来源。设计时需要明确：哪些可以打破（付出代价），哪些绝对不可违背。',
  '## "World Setting" Setting Generation — Isekai Cultivation Crossing Novel

The "World" (世界) is a singleton setting and the foundation of the entire xiuzhen world. The xiuzhen world is fundamentally different from generic xuanhuan: its cultural foundation is Daoist philosophy and Chinese traditional mythology, with "the Dao" as the underlying logic governing all settings.

---

### Field Generation Guide

#### World Name

Choose a name with xianxia flavor that hints at the cultivation world''s character:
- Good examples: "Empyrean Immortal Domain," "Nine Heavens Mystic Realm," "Grand Void Dao Domain," "Primordial Spirit Realm"
- Avoid: Names that feel overly modern or Western-fantasy (e.g., "Magic Continent," "Elf Kingdom")
- Naming principle: Use characters like "Domain" (域), "Realm" (界), "Heaven" (天), "Mystic" (玄), "Spirit" (灵), "Immortal" (仙)

#### Era Background

Xiuzhen world eras are typically expressed in epochs. The era background determines cultivation difficulty and resource scarcity, directly affecting protagonist growth pacing:

| Era Type | Features | Suitable Plot |
|----------|----------|---------------|
| Primordial Age | Abundant spiritual energy, powerful beings everywhere | Best as legendary backstory |
| Middle Antiquity | Spiritual energy waning, sects rising, order forming | Classic xiuzhen setting, sect conflicts as focus |
| Dharma-Ending Age | Sparse spiritual energy, cultivation is arduous | Creates difficulty for the crosser |
| Spiritual Energy Revival | Spiritual energy resurging, old order collapsing | Upheaval-driven plots, suits underdog stories |

#### Historical Background

Xiuzhen world history revolves around these core themes:
- **Primordial Wars**: Immortal-demon wars, deity-sealing battles; left behind ruins and legacies
- **Sect rise and fall**: Which sects flourished and declined, and why (spiritual vein depletion, internal strife, invasion)
- **Genius legends**: Historical prodigies (once-in-ten-thousand-years heavenly spirit root bearers); foreshadowing for future opportunities
- **Forbidden history**: Sealed truths and banned cultivation techniques

#### Geographical Territory

Xiuzhen world geography is intimately linked to spiritual energy distribution -- a key distinction from generic xuanhuan:
- **Spiritual vein distribution**: Areas rich in spiritual energy serve as sect headquarters. Vein quality: mortal-grade, spiritual-grade, immortal-grade
- **Grotto heavens and blessed lands**: Independent pocket dimensions left by ancient powerhouses, containing legacies and treasures. A uniquely xiuzhen geographical element
- **Secret realms**: Periodically opening dangerous areas filled with fortune and peril. Common venues for protagonist breakthroughs
- **Forbidden zones**: Extremely dangerous areas, often sealing ancient beasts or demons
- **Mortal world vs. cultivation world**: Is there a boundary? How do they connect?
- **Upper and lower realms**: Do higher-level worlds exist? Where does ascension lead? This determines the story''s ultimate power ceiling

#### Racial Landscape

Common races in xiuzhen worlds and their cultivation characteristics:
- **Humans**: Most numerous, varied aptitudes, compensate with techniques and pills
- **Demon beasts**: Primarily beast cultivators; taking human form requires tribulation; varied innate talents
- **Devil race**: Practice demonic arts; fast progress but prone to corruption
- **Spirit race**: Naturally attuned to certain elements (e.g., wood spirits, ice spirits)
- Racial settings affect character design; the protagonist may face racial discrimination or advantages after crossing

#### Political Landscape

The political landscape is determined by power:
- **Regional hegemon**: Super-sect anchored by a Deity Transformation / Tribulation Transcendence patriarch
- **Four-power balance**: Several major sects or clans in equilibrium
- **Rogue cultivator alliance**: Organization of unaffiliated cultivators
- **Shadow forces**: Demonic cultivators, heretical practitioners, forbidden organizations
- Mark each faction''s cultivation ceiling (patriarch''s realm level), which determines the world''s power ceiling

#### Social Systems

Unique institutions of xiuzhen society:
- **Sect hierarchy**: Sect Master -> Elders -> Inner Disciples -> Outer Disciples -> Menial Disciples. Strict hierarchy where cultivation level equals status
- **Clan system**: Patriarch -> Main line -> Branch lines -> Vassals. Centered on bloodline inheritance
- **Rogue cultivator rules**: Market city trading, auctions, mercenary missions
- **Heavenly Dao mandates**: Hard rules (e.g., no external interference during tribulation, bullying the weak incurs heavenly punishment). A core distinction from generic xuanhuan

#### Economy and Livelihood

The spirit stone economy is the lifeblood of the xiuzhen world:
- **Currency system**: Low-grade -> Mid-grade -> High-grade -> Supreme-grade spirit stones (typically 100:1 progression)
- **Core resources**: Spiritual herbs, ores, refined pills, artifacts
- **Trading venues**: Market cities, auction houses, intra-sect exchanges
- **Resource competition**: Ownership of spiritual veins and mineral veins is the primary cause of inter-sect conflict
- **Mortal economy**: How spirit stone and mortal gold/silver economies coexist

The economic system must be self-consistent: How many spirit stones is a Foundation Building Pill worth? How much is a spiritual instrument? These numbers must remain consistent.

#### Cultural Customs

Xiuzhen world culture has a Daoist cultural base:
- **Cultivation culture**: Seclusion, Dao discussions, technique duels, sparring
- **Master-disciple relationships**: "A master for a day is a father for life"; sect lineage is the core bond
- **Sect tournaments**: Periodic competitions in combat, alchemy, or artifact forging; common vehicles for story climaxes
- **Genius rankings**: Various ranking lists (Heavenly Pride List, Alchemist Ranking, Artifact Ranking); create competitive atmosphere
- **Lifespan concept**: Higher cultivation means longer life; mortals are like ants. This lifespan disparity is a uniquely xiuzhen source of conflict

#### Core Taboos and Rules

The heavenly Dao rules are inviolable iron laws:
- **Tribulation rules**: Breaking through certain realms requires tribulation; failure means complete annihilation
- **Karmic law**: Debts of karma must be repaid; forcibly erasing karma invites heavenly backlash
- **The Dao leaves a thread of hope**: Heaven always leaves one chance
- **Bullying the weak**: High-realm cultivators oppressing far-lower ones incurs heavenly punishment (specify conditions)
- **Forbidden techniques**: Certain practices invite heavenly punishment (body seizure, soul refining, fate-defying arts)

Core taboos are hard constraints and important sources of plot conflict. When designing, clarify: which can be broken (at a cost), and which are absolutely inviolable.',
  (SELECT id FROM novel_creation_method WHERE name = '异世界修真穿越小说' LIMIT 1),
  1,
  40,
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
