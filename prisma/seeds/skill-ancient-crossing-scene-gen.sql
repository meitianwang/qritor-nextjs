-- 古代架空穿越小说「场景」生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '古代架空穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-ancient-crossing-scene-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ancient-crossing-scene-gen',
  '「场景」生成：为古代架空穿越小说生成场景，涵盖皇宫府邸、市井街巷、山野郊外等古代空间设计，融合权力格局与生活气息',
  '"Scene" generation: generate scenes for ancient crossing novels, covering palaces, mansions, markets, wilderness and other ancient spatial design with power dynamics and daily life atmosphere',
  '## 「场景」生成 — 古代架空穿越小说

古代架空穿越小说的场景设计核心是**权力空间 × 阶层标识 × 穿越者的现代视角碰撞**。每个场景都是权力关系的物化——皇宫的殿宇等级、府邸的院落规制、市井的繁华与肮脏，场景本身就在讲述这个社会的规则。

穿越者用现代人的眼光审视这些空间，会看到古人习以为常的等级压迫和礼教束缚，这种视角差异是古代架空穿越的独特叙事张力。

---

### 字段生成指南

#### 场景名称

- 用古代场所的通用称谓或具体命名
- 宫廷场景：「太极殿」「御花园」「冷宫偏殿」
- 府邸场景：「正院上房」「西跨院」「后花园」
- 市井场景：「东市绸缎庄」「城南茶楼」
- 禁止现代化命名（如"购物中心""咖啡厅"）

#### 场景类型

八个选项的设计重点：

| 类型 | 权力含义 | 叙事功能 |
|------|---------|---------|
| **皇宫内苑** | 最高权力中心 | 政治博弈、宫斗、觐见等高风险场景 |
| **王府宅邸** | 贵族阶层的私密空间 | 家族政治、宅斗、密谋，内外有别 |
| **官衙府署** | 官方权力执行机构 | 审案、政务、官场博弈 |
| **市井街巷** | 民间社会的公共空间 | 信息流通、偶遇、生活气息、阶层碰撞 |
| **山野郊外** | 脱离权力体系的自然空间 | 逃避、修行、遇险、浪漫场景 |
| **寺庙道观** | 宗教与超脱空间 | 避难、求签、密谈、出世与入世的冲突 |
| **酒楼茶肆** | 社交与信息交换空间 | 江湖传言、商业谈判、偶遇、暗中交易 |
| **其他** | 自定义场景 | 根据具体故事需要设计 |

#### 场景位置

描述场景在这个架空世界中的地理/建筑位置：
- 宫廷场景：与其他宫殿的相对位置（"太极殿以东，紧邻御书房"）
- 府邸场景：院落的空间布局（"二进院后方，与正院相隔一道垂花门"）
- 城市场景：城市中的方位（"城东繁华地段，紧临主街"）
- 位置暗示社会地位：中轴线上 > 偏院，东 > 西，前 > 后

#### 场景描写

包含以下维度：
- **建筑形制**：屋顶样式、柱廊、门窗、装饰纹样（体现阶层）
- **陈设用具**：家具、摆件、书画（体现主人品位和地位）
- **空间规模**：大小、开阔或逼仄（体现权力等级）
- **季节/时间**：植被、光线、气候（营造氛围）

穿越者视角的描写可以有微妙的现代对比（"这院子比故宫博物院的某个偏殿还大"），但不要太频繁。

#### 场景氛围

六个选项的适用场景：

| 氛围 | 适用场景 | 叙事暗示 |
|------|---------|---------|
| **庄严肃穆** | 朝堂、祠堂、大殿 | 权力威压、规矩森严 |
| **富丽堂皇** | 宴会厅、贵妃寝殿 | 奢华背后的危机 |
| **清幽雅致** | 书房、后花园、寺庙 | 暂时的平静、密谈场所 |
| **热闹喧嚣** | 市集、酒楼、庆典 | 信息交汇、意外事件 |
| **阴森诡异** | 冷宫、废宅、密室 | 危险、秘密、被遗忘的历史 |
| **温馨舒适** | 闺房、内院 | 情感场景、私密对话 |

#### 常驻人物

列出通常在此场景活动的角色类型（不是具体角色名）：
- 宫廷场景："皇帝、近侍太监、值守禁军、当值妃嫔"
- 府邸场景："府中主母、管事嬷嬷、丫鬟仆从"
- 不需要列出具体角色名，描述角色类型即可
- 要体现场景的"人气"——每个空间有不同的人群构成

#### 场景功能

场景在叙事中承载的具体功能：
- **剧情功能**：哪些类型的事件会在此发生
- **角色功能**：这个场景对哪些角色有特殊意义
- **信息功能**：这个场景能提供什么信息或线索
- 一个场景可有多个功能，但应有一个主功能

---

### 场景阵容建议

**宫斗线标配**：
1. 皇宫内苑（如太极殿/养心殿）— 权力中心
2. 后宫寝殿 — 宫斗主战场
3. 御花园 — 偶遇/密谈/暗算
4. 冷宫 — 失败者的归宿/转折点
5. 市井酒楼 — 宫外信息渠道

**宅斗线标配**：
1. 正院上房 — 当家主母的领地
2. 偏院 — 主角的起点（通常位置偏、条件差）
3. 花园/水榭 — 偶遇/密谈
4. 外院书房 — 与男性角色交集
5. 市井街巷 — 采买/外出/意外

**经商线标配**：
1. 店铺 — 主角的商业据点
2. 市集/码头 — 商业活动中心
3. 府邸 — 家族大本营
4. 官衙 — 商业纠纷/官商关系
5. 茶楼 — 商业谈判/情报交换

---

### 与已有设定的联动

| 设定模块 | 对场景的影响 |
|---------|------------|
| **核心设定** | 故事类型（宫斗/宅斗/经商/种田）→决定核心场景类型；时代背景→建筑风格和社会面貌 |
| **世界观** | 国家/城市→场景的地理归属；政治格局→权力场景的分布 |
| **金手指** | 金手指类型→可能需要特定场景（如经商需要店铺、种田需要田庄） |
| **故事钩子** | 核心冲突→需要承载的关键场景 |
| **文风设定** | 细腻程度→场景描写的详略；基调→场景氛围的倾向 |

---

### 常见错误

1. **等级标识缺失**：所有场景的装饰和规格一样，没有体现古代森严的等级制度
2. **现代感过重**：场景描写中出现明显现代元素（玻璃窗、水泥地等）
3. **空间逻辑混乱**：府邸的院落布局不符合古代建筑的基本规制
4. **功能单一**：每个场景只能发生一种类型的事件
5. **氛围脸谱化**：皇宫就一定庄严，市井就一定热闹——好的场景有层次变化
6. **缺少人气**：只描写建筑不描写人的活动，场景显得空洞',
  '## "Scene" Generation — Ancient Crossing Novel

The core of scene design in ancient crossing novels is **power spaces × class markers × modern perspective clash**. Every scene is a materialization of power relations — palace hall hierarchies, mansion courtyard regulations, market prosperity and squalor.

The transmigrator views these spaces with modern eyes, seeing class oppression and ritualistic constraints that ancients take for granted.

---

### Field Generation Guide

#### Scene Name (场景名称)
Use period-appropriate names. Court: "Taiji Hall", "Imperial Garden". Mansion: "Main Courtyard Upper Room". Market: "East Market Silk Shop". No modern naming.

#### Scene Type (场景类型)
Eight types: Imperial Palace (highest power center), Noble Mansion (aristocratic private space), Government Office (official power), Market Streets (public life), Wilderness (outside power system), Temple (religious space), Restaurant/Teahouse (social/information exchange), Other.

#### Scene Location (场景位置)
Describe relative position within the world. Location implies social status: central axis > side courts, east > west.

#### Scene Description (场景描写)
Cover: architectural form (reflecting class), furnishings (reflecting taste/status), spatial scale (reflecting power), season/time (atmosphere).

#### Scene Atmosphere (场景氛围)
Six options: Solemn, Magnificent, Serene, Bustling, Eerie, Cozy. Each suits specific narrative purposes.

#### Resident Characters (常驻人物)
List character types (not specific names) who typically occupy this scene.

#### Scene Function (场景功能)
Narrative functions: plot events, character significance, information/clues.

---

### Setting Linkage

| Setting | Impact |
|---------|--------|
| **Core Setting** | Story type → core scene types; era → architectural style |
| **Worldview** | Nations/cities → geographic attribution; politics → power scene distribution |
| **Cheat Ability** | Type → may require specific scenes (commerce needs shops, farming needs estates) |
| **Story Hook** | Core conflict → key scenes needed |
| **Writing Style** | Detail level → description depth; tone → atmosphere tendency |

---

### Common Errors

1. **Missing class markers**: All scenes have same decoration level
2. **Excessive modernity**: Modern elements in descriptions
3. **Spatial logic errors**: Mansion layouts violating ancient architectural norms
4. **Single function**: Each scene only hosts one event type
5. **Stereotyped atmosphere**: Palaces always solemn, markets always bustling
6. **Lifeless scenes**: Only architecture, no human activity',
  (SELECT id FROM novel_creation_method WHERE name = '古代架空穿越小说' LIMIT 1),
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
