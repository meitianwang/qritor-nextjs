-- 异世界修真穿越小说「场景」生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '异世界修真穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-xiuzhen-crossing-scene-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xiuzhen-crossing-scene-gen',
  '「场景」生成：为异世界修真穿越小说生成场景，涵盖宗门洞天秘境禁地等修真空间设计，融合灵脉分布与天地法则',
  '"Scene" generation: generate scenes for xiuzhen crossing novels, covering sects, blessed lands, secret realms, forbidden zones with spirit vein distribution and heavenly laws',
  '## 「场景」生成 — 异世界修真穿越小说

异世界修真穿越小说的场景设计核心是**灵脉与天地法则 × 宗门山门 × 洞天福地**。与玄幻穿越强调"实力门槛"不同，修真世界更强调场景的**灵性品质**——灵气浓度、法则完整度、天地灵机决定了场景的修炼价值。

修真世界的场景带有浓厚的道家山水美学：云海仙山、洞天福地、灵泉飞瀑。每个场景都是"天地"的一部分，蕴含着可以被修炼者感悟的"道"。

---

### 字段生成指南

#### 场景名称

- 修真场景命名偏仙侠雅致风格
- 宗门：「太虚宫」「青莲剑宗」「万药谷」
- 秘境：「落仙渊」「古天帝洞府」「混沌禁地」
- 城池：「天南坊市」「万宝城」「散修聚集地」
- 自然：「灵泉山」「化龙潭」「九幽冥海」
- 命名要有古典意境，避免过于直白

#### 场景类型

九个选项在修真世界中的独特含义：

| 类型 | 修真含义 | 设计重点 |
|------|---------|---------|
| **城池** | 散修聚集/交易的坊市 | 没有宗门的保护，安全靠规矩和强者坐镇；有丹药、法宝交易 |
| **宗门** | 修炼传承的核心单位 | 山门设计、传功大殿、藏经阁、灵田、护山大阵——宗门是修真世界的社会基本单元 |
| **秘境** | 天然或人造的封闭空间 | 有独立的天地法则，可能时间流速不同；分等级（低阶、中阶、上古） |
| **荒野** | 修真界的"无主之地" | 灵兽出没、散修游荡、天材地宝；危险但自由 |
| **遗迹** | 上古大能的洞府/战场 | 残留的阵法、传承、宝物；极度危险但回报巨大 |
| **副本** | 宗门试炼/天地考验 | 有明确的试炼规则和奖励机制 |
| **学院** | 较少见，通常是入门级修炼场所 | 适合低阶修士的培养 |
| **异界裂缝** | 通往魔域/妖域/异界 | 空间不稳定，有异族生物 |
| **其他** | 洞天福地、灵脉节点等 | 修真特有的灵性空间 |

#### 环境氛围与感官细节

修真场景的环境描写要体现**道家山水美学**与**灵性感知**：

- **灵气可视化**：灵气在高浓度区域以雾、光、流水等形态呈现
- **天象**：仙鹤盘旋、祥云缭绕、灵光冲天
- **声音**：仙乐、剑鸣、道钟、瀑布轰鸣
- **植物**：灵药散发荧光、千年古松、灵木成林
- **气味**：丹香、清新灵气、腐朽的妖气
- 高阶修士能感受到场景中"道"的韵味——低阶只看到山水，高阶能看到法则纹路

#### 特殊规则/禁制

修真场景的规则更偏向"天地法则"而非人为设定：

| 规则类型 | 修真特色 | 示例 |
|---------|---------|------|
| **灵脉品质** | 灵气浓度和品质 | "此地有上品灵脉，修炼速度为外界三倍" |
| **法则残留** | 上古大能的法则印记 | "此处残留剑道法则，剑修感悟可获益" |
| **天劫禁区** | 无法渡劫的区域 | "此处天地法则不完整，渡劫必死" |
| **结界护山** | 宗门的防御体系 | "护山大阵可抵御元婴期以下的攻击" |
| **空间规则** | 秘境的时空特性 | "每甲子开启一次，内部时间流速为外界十分之一" |
| **禁制阵法** | 人为设置的阵法 | "阵法覆盖全山，外人无法传送进入" |

#### 关键事件

场景的历史和当前事件：
- 宗门：开山祖师的传奇、宗门大比、外敌入侵等
- 秘境：上次开启的收获、传说中的宝物
- 遗迹：上古大战的残留、前人探索的记录
- 事件与修炼体系设定中的境界晋升对应（秘境中的机缘可助突破）

#### 与剧情作用

明确场景在修真叙事中的功能：
- **入门场景**：穿越者初到修真界的空间（散修坊市或外门弟子区）
- **修炼场景**：日常修炼的主要空间（宗门、洞府、灵泉旁）
- **试炼场景**：证明实力、获取资源的空间（秘境、副本）
- **机缘场景**：获得传承/宝物的地方（遗迹、洞天）
- **大战场景**：宗门大战、渡劫、决战

---

### 场景阵容建议

**标准配置**：
1. **主角宗门**（1 个）：穿越者入门的宗门，承担大量日常剧情
2. **坊市/散修城**（1 个）：交易和信息交换的公共空间
3. **初级秘境**（1 个）：主角初期获取机缘的空间
4. **荒野/灵山**（1 个）：自由探索和意外收获
5. **高阶禁地**（1 个）：当前无法涉足的"目标"区域
6. **敌对宗门/势力据点**（1 个）：冲突的来源

**修真场景的特殊逻辑**：
- 宗门内部应有层级分明的功能区（外门→内门→核心→禁地）
- 场景之间的距离需要用修真世界的交通方式衡量（御剑飞行、传送阵）
- 灵脉品质决定了场景的"等级"——上品灵脉是各方争夺的核心资源

---

### 与已有设定的联动

| 设定模块 | 对场景的影响 |
|---------|------------|
| **穿越设定** | 穿越方式→初始场景；穿越目标→目标宗门或区域 |
| **世界观** | 大陆格局→宗门分布；灵脉分布→场景灵气品质；种族领地→场景文化特色 |
| **修炼体系** | 境界体系→场景的实力门槛；功法体系→功能区设计（剑修、丹修需要不同空间）；突破条件→秘境/机缘场景设计 |
| **金手指** | 类型→可能影响场景（如洞天系金手指需要独立空间设计） |
| **故事钩子** | 核心卖点→场景阵容需服务于卖点 |
| **文风设定** | 仙侠氛围→场景描写的诗意程度 |

---

### 常见错误

1. **灵性缺失**：场景描写没有灵气、法则等修真世界特有的灵性元素
2. **宗门结构模糊**：只说"某宗门"而不设计内部的功能区和层级
3. **与玄幻混淆**：过于强调战斗和冲突，忽略了修真的"修心"氛围和道家美学
4. **灵脉设定缺失**：不提灵气品质和灵脉分布，场景失去修真世界的核心驱动力
5. **传送系统缺失**：场景之间缺乏合理的交通方式（御剑/传送阵/飞舟）
6. **秘境设计单调**：所有秘境都是"进去打怪拿宝"，缺少独特的规则和法则',
  '## "Scene" Generation — Xiuzhen Crossing Novel

The core of scene design in xiuzhen (cultivation/immortal) crossing novels is **spirit veins and heavenly laws × sect mountain gates × blessed lands**. Unlike xuanhuan''s emphasis on "power thresholds," xiuzhen emphasizes a scene''s **spiritual quality** — spirit energy density, law completeness, and heavenly opportunities determine cultivation value.

Xiuzhen scenes carry strong Daoist landscape aesthetics: cloud-sea immortal mountains, blessed cave heavens, spirit springs and waterfalls.

---

### Field Generation Guide

#### Scene Name (场景名称)
Xiuxian/immortal-elegant naming style. Sects: "Taixu Palace", "Azure Lotus Sword Sect". Secret realms: "Fallen Immortal Abyss". Natural: "Spirit Spring Mountain".

#### Scene Type (场景类型)
Nine types with xiuzhen-specific meanings: City (loose cultivator markets), Sect (core cultivation unit with mountain gate, transmission halls, scripture pavilion), Secret Realm (independent laws, time distortion), Wilderness (unowned land), Ruins (ancient powerhouse''s cave dwelling), Dungeon (sect trials), Academy (entry-level cultivation), Dimensional Rift (to demon/monster realms), Other (cave heavens, spirit vein nodes).

#### Atmosphere & Sensory Details (环境氛围与感官细节)
Daoist landscape aesthetics + spiritual perception: visible spirit energy, celestial phenomena, immortal music, glowing herbs, dan fragrance. Higher cultivators perceive law patterns invisible to lower ones.

#### Special Rules/Restrictions (特殊规则/禁制)
Lean toward "heavenly laws" rather than artificial rules: spirit vein quality, residual law imprints, tribulation forbidden zones, sect barriers, spatial rules, formation restrictions.

#### Key Events (关键事件)
Sect founding legends, competitions, secret realm openings. Events correspond to cultivation breakthroughs.

#### Plot Function (与剧情作用)
Entry scene, cultivation scene, trial scene, fortune scene, great battle scene.

---

### Setting Linkage

| Setting | Impact |
|---------|--------|
| **Crossing Setup** | Crossing method → initial scene; target → destination sect/area |
| **Worldview** | Continental layout → sect distribution; spirit veins → scene quality; racial territories → cultural features |
| **Cultivation System** | Realm hierarchy → power thresholds; technique system → functional areas; breakthrough conditions → secret realm/fortune scene design |
| **Cheat Ability** | Type → may affect scenes (cave heaven cheat → independent space design) |
| **Story Hook** | Core selling point → scene lineup must serve it |
| **Writing Style** | Xianxia atmosphere → poetic level of descriptions |

---

### Common Errors

1. **Missing spirituality**: No spirit energy, laws, or cultivation-world elements
2. **Vague sect structure**: Just "some sect" without internal functional areas and hierarchy
3. **Confused with xuanhuan**: Over-emphasizing combat, ignoring xiuzhen''s "cultivate the heart" atmosphere and Daoist aesthetics
4. **Missing spirit vein settings**: No spirit quality or vein distribution, losing the world''s core driver
5. **No transportation system**: No reasonable travel between scenes (sword flight/teleportation arrays/flying boats)
6. **Monotonous secret realms**: All secret realms are "enter, fight, loot" without unique rules and laws',
  (SELECT id FROM novel_creation_method WHERE name = '异世界修真穿越小说' LIMIT 1),
  1,
  22,
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
