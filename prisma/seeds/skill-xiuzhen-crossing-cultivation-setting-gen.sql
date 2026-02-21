-- 异世界修真穿越小说「修炼体系」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '异世界修真穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-xiuzhen-crossing-cultivation-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xiuzhen-crossing-cultivation-setting-gen',
  '「修炼体系」设定生成：为异世界修真穿越小说生成修炼体系设定，包括力量体系类型、境界划分、修炼资源、功法/职业分支、能力上限与代价、禁忌与风险、代表性能力',
  '"Cultivation System" setting generation: generate cultivation system settings for isekai cultivation crossing novels, including power system type, realm division, cultivation resources, technique/specialization paths, power ceilings and costs, taboos and risks, signature abilities',
  '## 「修炼体系」设定生成 — 异世界修真穿越小说

修炼体系是修真小说的骨架，决定了整个故事的成长节奏和战力标尺。与通用玄幻的战力体系不同，修真体系以「悟道」和「天人博弈」为内核，每一次境界突破都是对天道的挑战。

---

### 字段生成指南

#### 力量体系类型

选项：修真 / 魔法 / 斗气 / 异能 / 混合

推荐选择**修真**。也可选择**混合**（修真为主、辅以其他），例如修真 + 炼体、修真 + 阵法等。力量来源必须是灵气、道、天地法则——这是修真体系的本质特征。

#### 境界划分

经典修真境界划分（可根据需要增减）：

```
练气期 → 筑基期 → 金丹期 → 元婴期 → 化神期 → 渡劫期 → 大乘期 → 飞升
```

每个境界需要定义以下要素：

| 要素 | 说明 | 示例 |
|------|------|------|
| **境界名称** | 体现修真特色 | 「练气期」「筑基期」「金丹期」 |
| **细分层级** | 每个大境界内的小层级 | 练气一到十二层；金丹初期/中期/后期/大圆满 |
| **突破条件** | 所需资源、领悟、契机 | 筑基需要筑基丹 + 灵根品质 + 静室闭关 |
| **能力提升** | 该境界解锁的标志性能力 | 金丹期解锁御剑飞行 |
| **寿元增幅** | 每个境界对应的寿命上限 | 练气百年、筑基两百年、金丹五百年 |
| **天劫等级** | 哪些境界突破需要渡劫 | 通常从渡劫期开始，部分设定金丹期就有小天劫 |

**设计要点**：
- 前期境界（练气→筑基→金丹）是主角成长的主战场，要细化层级和突破过程
- 后期境界不宜过多，避免境界注水（控制在 8-10 个大境界）
- 每个境界之间的实力差距要明确——金丹对练气就是碾压，元婴对金丹又是碾压
- 境界划分要体现修真特色：「金丹」「元婴」「化神」这些概念有其道家哲学含义

#### 修炼资源

| 资源类型 | 说明 | 叙事功能 |
|---------|------|---------|
| **灵根** | 修炼的天赋根基 | 决定起点和上限。类型：金木水火土五行灵根、变异灵根（雷灵根、冰灵根等）、天灵根（单属性，万中无一）、废灵根/杂灵根（五行俱全但均弱） |
| **功法** | 修炼的核心方法 | 主角成长的核心。等级：凡品/灵品/仙品（各分上中下三阶），更高有神品。功法决定修炼速度和战力上限 |
| **灵石** | 修炼货币和资源 | 经济驱动。下品→中品→上品→极品（100:1 递进） |
| **丹药** | 辅助修炼、疗伤、突破 | 关键道具。核心丹药：培元丹（日常修炼）、筑基丹（突破筑基）、破境丹（辅助突破）、疗伤丹、解毒丹 |
| **灵草灵药** | 炼丹原材料 | 探险/采集驱动 |
| **法宝法器** | 战斗武器和辅助器具 | 战力提升。等级：法器→灵器→宝器→仙器→神器 |
| **阵法材料** | 布阵所需材料 | 防御/攻击/辅助 |

#### 功法/职业分支

修真世界的专业化路径，主角通常主修一道、辅修一到两道：

| 分支 | 核心能力 | 社会地位 | 叙事价值 |
|------|---------|---------|---------|
| **丹道** | 炼丹，制作丹药 | 极高，受各方拉拢 | 经济线、辅助修炼线。炼丹要素：药方 + 灵火 + 丹炉 + 手法 |
| **器道** | 炼器，打造法宝 | 高 | 战力提升线。炼器要素：材料 + 炼器火 + 阵纹 + 手法 |
| **阵道** | 布阵，攻防一体 | 高 | 战术线、防御线。护宗大阵、聚灵阵、杀阵 |
| **符道** | 制符，灵活多变 | 中高 | 战斗辅助线。符箓可储存法术，一次性使用 |
| **剑修** | 纯粹以剑入道 | 战力最强 | 战斗核心线。御剑飞行、剑意、万剑归宗 |
| **体修** | 淬炼肉身 | 罕见 | 近身战斗线。肉身可抗法宝，但修炼痛苦 |
| **魂修** | 修炼神魂 | 神秘 | 精神攻击线。神识攻击、幻术、搜魂 |

过多分支会导致焦点分散，建议主角核心路径不超过两条。

#### 能力上限与代价

修炼不是无代价的——这是修真体系区别于「打怪升级」的关键：
- **修炼瓶颈**：灵根品质限制上限（废灵根可能永远无法筑基）、功法等级限制天花板（凡品功法修炼到金丹就是极限）
- **突破代价**：需要珍稀资源、特殊机缘、甚至生死历练。不是「修炼够了就自然突破」
- **走火入魔**：修炼过快或功法不当会导致走火入魔，轻则修为倒退，重则经脉尽断
- **心魔**：内心执念化为心魔，是突破高境界（通常元婴以上）的最大障碍。心魔来源：执念、仇恨、贪婪、恐惧
- **天劫威力**：渡劫期天劫的强度与修士逆天程度成正比。金手指越强、逆天行为越多，天劫越恐怖

#### 禁忌与风险

修真世界的禁忌功法和行为：
- **魔功**：修炼速度快但容易入魔，且被正道追杀。典型：吸取他人修为、以杀戮淬炼心境
- **夺舍**：夺取他人肉身，被天道和修真界共同禁止。是修真世界最大的禁忌之一
- **炼魂**：折磨灵魂提升修为，罪大恶极
- **逆天改命**：强行改变天道注定的命运，代价极大（通常以寿元或修为为代价）
- **使用禁忌法宝**：某些法宝需要以寿元或修为为代价，如弑仙剑、天魔旗等

#### 代表性能力

每个境界的标志性能力，让读者直观感受实力差距：
- **练气**：引气入体、基础术法（火球术、水盾术等低阶法术）
- **筑基**：御物飞行（踏剑或飞行法器）、简单法术（法力质变，远超练气）
- **金丹**：御剑飞行（真正的御剑术）、金丹自爆（同归于尽的终极手段）
- **元婴**：元婴出窍（可独立战斗和逃生）、分身术
- **化神**：领域展开（一定范围内压制对手）、虚空挪移（短距离空间移动）
- **渡劫**：渡天劫（与天道正面对抗）、法则之力（触及天地法则的初步力量）
- **大乘**：撕裂空间（可跨空间移动）、接近仙人之力
- **飞升**：超脱三界、成就仙位

生成时应确保每个境界的代表性能力有明显递进关系，让读者期待下一个境界的解锁。',
  '## "Cultivation System" Setting Generation — Isekai Cultivation Crossing Novel

The cultivation system is the skeleton of a xiuzhen novel, determining the story''s growth pacing and combat benchmarks. Unlike generic xuanhuan power systems, the xiuzhen system centers on "Dao comprehension" and "mortal-versus-heaven contention" -- every realm breakthrough is a challenge to heaven''s will.

---

### Field Generation Guide

#### Power System Type

Options: Xiuzhen / Magic / Battle Qi / Supernatural Abilities / Hybrid

**Xiuzhen** is recommended. **Hybrid** is also viable (primarily xiuzhen with supplementary elements, e.g., xiuzhen + body tempering). The power source must be spiritual energy, the Dao, and laws of heaven and earth -- this is the essential characteristic.

#### Realm Division

Classic xiuzhen realm progression (adjustable as needed):

```
Qi Refining -> Foundation Building -> Golden Core -> Nascent Soul -> Deity Transformation -> Tribulation Transcendence -> Mahayana -> Ascension
```

Each realm requires these elements:

| Element | Description | Example |
|---------|-------------|---------|
| **Realm name** | Should reflect xiuzhen character | "Qi Refining" (练气期), "Foundation Building" (筑基期) |
| **Sub-levels** | Smaller tiers within each major realm | Qi Refining layers 1-12; Golden Core early/mid/late/perfection |
| **Breakthrough conditions** | Required resources, comprehension, catalyst | Foundation Building needs a Foundation Pill + spirit root quality + secluded cultivation |
| **Ability upgrades** | Iconic abilities unlocked at this realm | Golden Core unlocks sword flight |
| **Lifespan increase** | Maximum lifespan at each realm | Qi Refining: 100 years; Foundation Building: 200; Golden Core: 500 |
| **Tribulation level** | Which breakthroughs require tribulation | Usually starts at Tribulation Transcendence; some settings include minor tribulation at Golden Core |

**Design tips**:
- Early realms (Qi Refining -> Foundation Building -> Golden Core) are the protagonist''s main growth arena; detail the levels and breakthrough processes
- Avoid too many late-stage realms to prevent "realm inflation" (limit to 8-10 major realms)
- Make power gaps between realms explicit -- Golden Core dominates Qi Refining; Nascent Soul dominates Golden Core
- Realm names should reflect xiuzhen philosophy: "Golden Core," "Nascent Soul," "Deity Transformation" carry Daoist philosophical meaning

#### Cultivation Resources

| Resource Type | Description | Narrative Function |
|--------------|-------------|-------------------|
| **Spirit roots** | Innate cultivation aptitude | Determines starting point and ceiling. Types: five-element roots (metal/wood/water/fire/earth), variant roots (lightning, ice), heavenly spirit root (single element, one in ten thousand), waste/mixed root (all five elements but all weak) |
| **Techniques** | Core cultivation methods | Core of protagonist growth. Grades: mortal/spiritual/immortal (each with upper/middle/lower tiers); divine grade above. Technique grade determines cultivation speed and power ceiling |
| **Spirit stones** | Cultivation currency and resource | Economic driver. Low -> Mid -> High -> Supreme grade (100:1 progression) |
| **Pills** | Assist cultivation, healing, breakthroughs | Key items. Core pills: Cultivation Enhancement Pill (daily), Foundation Building Pill, Realm-Breaking Pill, Healing Pill, Detox Pill |
| **Spiritual herbs** | Raw materials for alchemy | Exploration/collection driver |
| **Artifacts** | Combat weapons and auxiliary tools | Power multiplier. Grades: tools -> spiritual instruments -> treasures -> immortal artifacts -> divine artifacts |
| **Formation materials** | Materials for formations | Defense/offense/support |

#### Technique / Specialization Paths

Specialization paths in the xiuzhen world. The protagonist typically specializes in one path with one or two supplementary ones:

| Path | Core Ability | Social Status | Narrative Value |
|------|-------------|---------------|-----------------|
| **Alchemy** | Pill refining | Extremely high; sought by all | Economic line, cultivation support. Elements: recipe + spirit fire + cauldron + technique |
| **Artifact Forging** | Crafting artifacts | High | Combat power line. Elements: materials + forging fire + formation inscriptions + technique |
| **Formation Dao** | Setting formations | High | Tactical and defensive. Includes sect protection arrays, spirit-gathering arrays, kill formations |
| **Talisman Dao** | Creating talismans | Medium-high | Combat support. Talismans store spells for single use |
| **Sword Cultivation** | Pure sword-based Dao | Highest combat power | Core combat. Includes sword flight, sword intent, myriad swords convergence |
| **Body Cultivation** | Tempering the physical body | Rare | Close combat. Body can withstand artifacts but training is agonizing |
| **Soul Cultivation** | Cultivating the divine soul | Mysterious | Mental attacks, illusions, soul searching |

Too many paths dilute focus; recommend no more than two core paths for the protagonist.

#### Power Ceilings and Costs

Cultivation is not cost-free -- this is the key difference between xiuzhen and simple "kill monsters, level up" systems:
- **Bottlenecks**: Spirit root quality limits ceiling (waste roots may never reach Foundation Building); technique grade limits potential (mortal-grade techniques cap at Golden Core)
- **Breakthrough costs**: Requires rare resources, special opportunities, or life-and-death trials. Not "cultivate enough and breakthrough naturally"
- **Cultivation deviation**: Cultivating too fast or using improper techniques causes deviation; mild cases lose cultivation, severe cases destroy meridians
- **Inner demons**: Inner obsessions manifest as demons; the biggest obstacle to high-realm breakthroughs (usually Nascent Soul and above). Sources: obsession, hatred, greed, fear
- **Tribulation intensity**: Heavenly tribulation strength is proportional to how much the cultivator defies heaven. Stronger cheat abilities and more defiant actions mean more terrifying tribulations

#### Taboos and Risks

Forbidden techniques and behaviors in the xiuzhen world:
- **Demonic arts**: Fast progress but prone to corruption, hunted by righteous sects. Typical: absorbing others'' cultivation, tempering mind through slaughter
- **Body seizure**: Taking another''s body; forbidden by both heavenly Dao and cultivation community. One of the greatest taboos
- **Soul refining**: Torturing souls to boost cultivation; an unforgivable crime
- **Fate defiance**: Forcibly altering heaven-ordained destiny; comes at extreme cost (usually lifespan or cultivation as payment)
- **Forbidden artifacts**: Certain artifacts require lifespan or cultivation as payment

#### Signature Abilities

Iconic abilities at each realm to help readers viscerally feel power differences:
- **Qi Refining**: Draw spiritual energy into the body, basic spells (fire bolt, water shield, etc.)
- **Foundation Building**: Object-flight (sword or flight artifact), simple techniques (qualitative leap over Qi Refining)
- **Golden Core**: True sword flight, golden core self-detonation (mutual destruction as last resort)
- **Nascent Soul**: Soul projection (can fight and escape independently), clone techniques
- **Deity Transformation**: Domain deployment (suppress opponents within range), void shifting (short-range spatial movement)
- **Tribulation Transcendence**: Surviving heavenly tribulation, law-based power (initial contact with heaven-earth laws)
- **Mahayana**: Space tearing (cross-spatial movement), near-immortal power
- **Ascension**: Transcending the three realms, achieving immortal status

Ensure each realm''s signature abilities show clear progression, building reader anticipation for the next realm unlock.',
  (SELECT id FROM novel_creation_method WHERE name = '异世界修真穿越小说' LIMIT 1),
  1,
  41,
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
