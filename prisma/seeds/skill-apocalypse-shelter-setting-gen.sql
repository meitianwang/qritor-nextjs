-- 末世天灾囤货流「避难所信息」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '末世天灾囤货流' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-apocalypse-shelter-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'apocalypse-shelter-setting-gen',
  '「避难所信息」设定生成：为末世天灾囤货流生成避难所设定，包括避难所名称（ShelterName）、地理位置（Location）、防御等级（DefenseLevel）、设施列表（Facilities）和物资状态（SuppliesStatus）',
  '"Shelter Info" setting generation: generate shelter settings for the post-apocalyptic hoarding genre, including shelter name (ShelterName), geographic location (Location), defense level (DefenseLevel), facility list (Facilities), and supplies status (SuppliesStatus)',
  '## 「避难所信息」设定生成 — 末世天灾囤货流

避难所信息是 facility 类别的 **singleton 实体**——整个故事只有一个"大本营"。避难所是基地建设叙事线的核心载体，它的升级路径就是主角团从挣扎求生到站稳脚跟的成长弧光。

---

### 字段生成指南

#### ShelterName（避难所名称）

避难所名称需要有辨识度，让读者一提到就能联想到这个基地。

好的命名方式：
- 基于地形特征："山谷营地"、"地下堡垒"、"河湾据点"
- 基于建筑原型："老兵工厂"、"废弃矿井避难所"、"高层方舟"
- 基于团队命名："希望堡"、"最后防线"、"破晓营"

避免：
- 过于普通的名称（"家"、"基地"、"避难所"）
- 与故事氛围不符的名称（末世背景下不宜用过于轻松的名字）

#### Location（地理位置）

地理位置是故事早期的重大决策，直接影响后续所有剧情。选址需要结合预期天灾类型做战略考量。

**选址逻辑参考表**：

| 选址类型 | 优势 | 劣势 | 适合的天灾 |
|---------|------|------|-----------|
| **地下室/地下工程** | 温度稳定、防辐射、隐蔽性好 | 通风差、易积水、空间有限 | 极寒、极热、酸雨 |
| **山区高地** | 不怕洪涝、视野好、易守难攻 | 交通不便、物资运输难、水源不稳定 | 洪涝、尸潮 |
| **废弃军事设施** | 防御强、存储空间大、可能有剩余物资 | 可能被其他势力觊觎、位置暴露 | 全类型（综合性最强） |
| **偏远农村** | 人少资源争夺小、可种植、空间开阔 | 医疗设施差、孤立无援、防御薄弱 | 瘟疫、虫灾 |

**选址的叙事意义**：完美选址会让故事缺乏张力。建议选择有 2-3 项明显劣势的选址——这些劣势就是后续剧情冲突的来源。例如选了山区高地，那么物资运输的困难就是持续的叙事摩擦点；选了地下工程，洪涝来袭时就是生死危机。

**Location 描述要求**：
- 具体到地形特征（"城市北郊的半山腰废弃防空洞"而非"一个地下室"）
- 说明与最近水源、公路、城镇的距离关系
- 点明选址的战略优势和致命弱点

#### DefenseLevel（防御等级）

DefenseLevel 是 1-10 的整数，反映避难所当前的安全防护程度。它的递进路径就是基地建设的叙事线。

**等级含义与递进路径**：

```
1-2 级（简易遮蔽）：帐篷/废弃房屋/简单门锁 → 能挡风雨，挡不住任何有组织威胁
3-4 级（基本加固）：门窗加固、简易围栏、铃铛警报 → 能挡小股入侵，延迟 5-10 分钟
5-6 级（中等防御）：围墙、瞭望塔、陷阱带、射击口 → 能抵御中等规模威胁
7-8 级（坚固堡垒）：钢筋混凝土、发电系统、监控、多重防线 → 能抵御大规模进攻
9-10级（要塞级别）：军事级防御、完整自给系统、有组织巡逻 → 几乎无法攻破
```

**DefenseLevel 设计建议**：
- 故事开始时 DefenseLevel 在 **1-3**，给读者"从零开始"的代入感
- 中期通过努力升到 **5-6**，给主角团成就感，给读者基地建设的满足感
- 大灾来袭时（如地震）跌回 **3-4**，制造"辛苦建设毁于一旦"的危机感
- 最终章达到 **7-8**，展示团队的成长和韧性
- **永远不要到 10**——满级意味着没有弱点，没有弱点意味着没有故事

**每次等级提升都应绑定具体叙事事件**：不要写"我们升级了防御"，而要写"用从废弃军营搜来的铁丝网加固了东墙，花了三天时间，期间差点被路过的流浪团体发现"。

#### Facilities（设施列表）— array 字段

Facilities 是 array 字段，列出避难所当前拥有的功能设施。设施的获取需要三个前提：**物资 + 技能 + 时间**。

**升级路径参考表**：

| 阶段 | 示例设施 | 解锁条件 |
|------|---------|---------|
| **初期** | 储水桶、简易灶台、睡袋、急救箱 | 基本物资即可 |
| **发展期** | 发电机、简易医疗室、菜园、围墙 | 需要工具+材料+有对应技能的人手 |
| **成熟期** | 太阳能系统、无线电台、温室大棚、瞭望塔 | 需要专业技能+稀缺物资 |
| **巅峰期** | 净水系统、武器工坊、地下仓库、实验室 | 需要大量材料+团队协作+专家级技能 |

**Facilities 设计原则**：
- 每个设施的建设都应与角色的 SurvivalSkill 关联（建造温室需要种植技能，安装太阳能需要电气技能）
- 设施列表应反映故事当前所处的阶段——初期不应有高级设施
- 设施损毁是制造危机的有效手段（地震摧毁围墙、酸雨腐蚀太阳能板）
- 新设施的添加是展示主角团成长的最佳方式

#### SuppliesStatus（物资状态）— isDynamic 字段

SuppliesStatus 是标记为 isDynamic 的字段，反映避难所的整体物资健康度。它不是某一种物资的状态，而是综合评估所有物资类别后的总体判断。

**状态含义与触发事件**：

| 状态 | 含义 | 触发事件 |
|------|------|---------|
| **充足** | 所有类别物资储备丰富，短期（30天以上）无忧 | 大量囤货后、成功完成大规模搜刮后 |
| **紧张** | 消耗加快，有 1-2 类物资降至 15 天以下，需要计划补给 | 人口增加、天灾持续期消耗、意外损失 |
| **匮乏** | 某类关键物资即将耗尽（7天以下），必须紧急补充 | 长期围困、物资被劫、多灾叠加 |
| **耗尽** | 关键物资（水/食物/药品）降至 3 天以下，面临断粮断水 | 极端灾害、长期封锁、物资全部被劫 |

**SuppliesStatus 动态管理要点**：
- SuppliesStatus 是决策触发器——"紧张"时需要计划补给，"匮乏"时必须紧急行动，"耗尽"是最高张力
- 更新时机：大量物资消耗后、成功补给后、被劫掠后、人口变动后
- SuppliesStatus 的变化应与物资实体（item）的 Quantity 变化保持一致——如果多种物资的 Quantity 大幅下降，SuppliesStatus 应相应恶化
- 状态恶化不一定是线性的——可能从"充足"因一次劫掠直接跳到"匮乏"
- 状态改善通常需要持续努力——从"匮乏"恢复到"充足"需要多次成功补给

---

### Singleton 设计要点

避难所是 singleton 实体，这意味着：
- 整个故事只创建一个避难所信息实体
- 所有基地建设的叙事都围绕这一个实体展开
- 通过更新 Facilities（增减设施）、DefenseLevel（升降等级）和 SuppliesStatus（状态变化）来反映基地的演变
- 如果剧情需要迁移基地（极端情况），应删除旧实体创建新实体，而非同时存在两个

### 避难所与其他实体的联动

- **与天灾档案的联动**：天灾的 Type 和 Impact 直接影响避难所——地震降低 DefenseLevel，酸雨损毁户外 Facilities，洪涝威胁地下室选址
- **与重要物资的联动**：SuppliesStatus 应与各物资实体的 Quantity 保持逻辑一致
- **与角色档案的联动**：Facilities 的建设需要角色的 SurvivalSkill 支持（建造需要建筑技能，医疗室需要医生）',
  '## "Shelter Info" Setting Generation — Post-Apocalyptic Hoarding Genre

Shelter Info is a **singleton entity** of the facility category — there is only one "home base" for the entire story. The shelter is the core vehicle of the base-building narrative arc; its upgrade path IS the protagonist team''s growth arc from struggling to survive to standing firm.

---

### Field Generation Guide

#### ShelterName (Shelter Name)

The shelter name should be distinctive, instantly evoking the base in the reader''s mind.

Good naming approaches:
- Based on terrain features: "Valley Camp," "Underground Fortress," "River Bend Outpost"
- Based on building archetype: "Old Munitions Factory," "Abandoned Mine Shelter," "Highrise Ark"
- Based on team naming: "Hope Bastion," "Last Line," "Dawn Camp"

Avoid:
- Overly generic names ("Home," "Base," "Shelter")
- Names that clash with the story tone (overly cheerful names don''t suit a post-apocalyptic setting)

#### Location (Geographic Location)

Geographic location is a critical early-story decision that affects all subsequent plot developments. Site selection requires strategic consideration of expected disaster types.

**Site selection logic reference table**:

| Site Type | Advantages | Disadvantages | Suitable Disasters |
|-----------|-----------|---------------|-------------------|
| **Basement / Underground** | Stable temperature, radiation-proof, good concealment | Poor ventilation, flood risk, limited space | Extreme cold, extreme heat, acid rain |
| **Mountain highlands** | Flood-proof, good visibility, easy to defend | Difficult transport, hard to haul supplies, unstable water source | Flood, corpse tide |
| **Abandoned military facility** | Strong defenses, large storage, possible leftover supplies | May attract rival factions, exposed location | All types (most versatile) |
| **Remote countryside** | Low population = less competition, farmable, open space | Poor medical facilities, isolated, weak defenses | Pandemic, insect plague |

**Narrative significance of site selection**: A perfect site makes the story lack tension. Choose a site with 2-3 clear disadvantages — those disadvantages become the source of future plot conflicts. For example, choosing mountain highlands means supply transport difficulty is a persistent narrative friction point; choosing underground means a flood becomes a life-or-death crisis.

**Location description requirements**:
- Specific to terrain features ("an abandoned air-raid shelter halfway up the hill on the city''s northern outskirts" rather than "a basement")
- Note distance relationships to the nearest water source, highway, and town
- Identify the site''s strategic advantages and critical vulnerabilities

#### DefenseLevel (Defense Rating)

DefenseLevel is an integer from 1 to 10, reflecting the shelter''s current security level. Its progression path IS the base-building narrative arc.

**Level meaning and progression path**:

```
Level 1-2 (Basic shelter): Tent/abandoned house/simple locks -> Blocks weather, cannot stop any organized threat
Level 3-4 (Basic reinforcement): Fortified doors/windows, simple fencing, bell alarms -> Blocks small incursions, delays 5-10 minutes
Level 5-6 (Moderate defense): Walls, watchtower, trap belt, firing ports -> Resists medium-scale threats
Level 7-8 (Solid fortress): Reinforced concrete, power system, surveillance, multiple defense lines -> Withstands large-scale attacks
Level 9-10 (Stronghold grade): Military-grade defense, complete self-sufficient systems, organized patrols -> Nearly impregnable
```

**DefenseLevel design advice**:
- Start the story at DefenseLevel **1-3**, giving readers a "starting from scratch" immersion
- Reach **5-6** by mid-story through effort, providing the protagonist team with achievement and readers with base-building satisfaction
- Drop back to **3-4** when a major disaster strikes (e.g., earthquake), creating "all that hard work destroyed" crisis tension
- Eventually reach **7-8** in the final arc, showcasing the team''s growth and resilience
- **Never reach 10** — max level means no weaknesses, and no weaknesses means no story

**Every level increase should be tied to a specific narrative event**: Don''t write "we upgraded our defenses"; instead write "spent three days reinforcing the east wall with barbed wire scavenged from an abandoned military camp, nearly discovered by a passing scavenger group in the process."

#### Facilities (Facility List) — Array Field

Facilities is an array field listing the shelter''s currently available functional installations. Acquiring facilities requires three prerequisites: **supplies + skills + time**.

**Upgrade path reference table**:

| Phase | Example Facilities | Unlock Requirements |
|-------|-------------------|---------------------|
| **Early** | Water barrel, simple stove, sleeping bags, first aid kit | Basic supplies are sufficient |
| **Development** | Generator, basic medical room, vegetable garden, perimeter wall | Requires tools + materials + personnel with relevant skills |
| **Mature** | Solar power system, radio station, greenhouse, watchtower | Requires specialized skills + rare supplies |
| **Peak** | Water purification system, weapons workshop, underground storage, laboratory | Requires large quantities of materials + teamwork + expert-level skills |

**Facilities design principles**:
- Each facility''s construction should link to characters'' SurvivalSkill (building a greenhouse requires farming skills; installing solar panels requires electrical skills)
- The facility list should reflect the story''s current phase — early stages should not have advanced facilities
- Facility destruction is an effective way to create crisis (earthquake destroys walls, acid rain corrodes solar panels)
- Adding new facilities is the best way to demonstrate the protagonist team''s growth

#### SuppliesStatus (Supply Status) — isDynamic Field

SuppliesStatus is marked as isDynamic, reflecting the shelter''s overall supply health. It is not the status of any single supply, but a holistic assessment across all supply categories.

**Status meaning and trigger events**:

| Status | Meaning | Trigger Events |
|--------|---------|---------------|
| **Abundant** | All categories well-stocked, no short-term (30+ days) worries | After major hoarding, after successful large-scale scavenging |
| **Tight** | Consumption accelerating, 1-2 categories dropped below 15 days, planning needed | Population increase, disaster sustained-phase consumption, unexpected losses |
| **Scarce** | A critical supply category nearing depletion (below 7 days), emergency resupply required | Prolonged siege, supplies raided, compound disasters |
| **Depleted** | Critical supplies (water/food/medicine) below 3 days, facing starvation/dehydration | Extreme disasters, prolonged blockade, all supplies raided |

**SuppliesStatus dynamic management key points**:
- SuppliesStatus is a decision trigger — "Tight" calls for resupply planning, "Scarce" demands emergency action, "Depleted" is maximum tension
- Update timing: After major supply consumption, after successful resupply, after being raided, after population changes
- SuppliesStatus changes should be consistent with supply entities'' (item) Quantity changes — if multiple supplies'' Quantity drops significantly, SuppliesStatus should worsen accordingly
- Deterioration is not necessarily linear — it can jump from "Abundant" to "Scarce" after a single raid
- Recovery typically requires sustained effort — returning from "Scarce" to "Abundant" needs multiple successful resupply missions

---

### Singleton Design Notes

The shelter is a singleton entity, which means:
- Only one Shelter Info entity is created for the entire story
- All base-building narrative revolves around this single entity
- Reflect the base''s evolution by updating Facilities (adding/removing installations), DefenseLevel (raising/lowering level), and SuppliesStatus (status changes)
- If the plot requires base relocation (extreme case), delete the old entity and create a new one rather than having two coexist

### Shelter Interaction with Other Entities

- **With Disaster Archives**: A disaster''s Type and Impact directly affect the shelter — earthquakes lower DefenseLevel, acid rain damages outdoor Facilities, floods threaten underground site selections
- **With Critical Supplies**: SuppliesStatus should remain logically consistent with individual supply entities'' Quantity values
- **With Character Archives**: Facility construction requires characters'' SurvivalSkill support (construction needs building skills, medical room needs a doctor)',
  (SELECT id FROM novel_creation_method WHERE name = '末世天灾囤货流' LIMIT 1),
  1,
  81,
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
