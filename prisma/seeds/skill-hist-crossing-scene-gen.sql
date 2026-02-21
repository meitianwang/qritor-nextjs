-- 历史人物穿越小说「场景」生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '历史人物穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-hist-crossing-scene-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'hist-crossing-scene-gen',
  '「场景」生成：为历史人物穿越小说生成场景，涵盖宫殿战场城池等历史空间设计，强调历史原型考据与时代还原',
  '"Scene" generation: generate scenes for historical crossing novels, covering palaces, battlefields, cities and other historical spaces with emphasis on historical prototypes and period accuracy',
  '## 「场景」生成 — 历史人物穿越小说

历史人物穿越小说的场景设计核心是**历史还原 × 时代质感 × 真实与虚构的平衡**。场景不是凭空想象的古代空间，而是有历史原型可考的真实或半真实场所。读者会带着对历史的预期来审视场景，因此历史考据的准确度直接影响小说的可信度。

穿越者进入的是一个"已知的历史"，场景承载着已经发生或即将发生的历史事件。场景设计必须与原著/历史的时间线对齐。

---

### 字段生成指南

#### 场景名称

- 尽量使用历史上真实存在的地名或建筑名
- 宫殿：「未央宫」「太极殿」「大明宫含元殿」
- 战场：「长平」「赤壁」「淝水」
- 城池：「长安」「汴京」「临安」
- 如果是原创场景，命名风格要与时代一致
- 禁止使用明显与时代不符的称呼

#### 场景类型

六个选项的历史叙事功能：

| 类型 | 历史角色 | 关键考据点 |
|------|---------|----------|
| **宫殿** | 皇权中心，政治博弈核心场所 | 宫殿名称、布局必须符合对应朝代；不同朝代宫殿体制差异很大 |
| **战场** | 军事冲突的空间 | 地形地貌要与史料一致；兵种、阵法要符合时代 |
| **城池** | 城市空间，经济文化中心 | 城市规模、布局、繁华程度要与时代匹配 |
| **府邸** | 贵族/官员的私人空间 | 府邸等级与主人身份对应；建筑风格符合朝代 |
| **江湖** | 非官方的民间空间 | 侠义文化的活动场所；客栈、山寨、密道等 |
| **其他** | 自定义场景 | 根据故事需要设计 |

#### 场景类型详情

对场景类型的细化描写：
- 宫殿：具体是哪座殿/哪个区域，承担什么政务功能
- 战场：具体地形（平原、山地、水域）、战略意义
- 城池：城市的主要功能区、人口构成、经济特色
- 要体现历史时期的特殊性——同样是"城池"，唐代长安和南宋临安完全不同

#### 环境描述

历史场景的环境描写要兼顾**氛围 + 考据**：
- **建筑**：朝代对应的建筑形制（唐代斗拱、宋代飞檐、明清琉璃瓦）
- **器物**：时代对应的日用品（青铜→瓷器→紫砂的演变）
- **植被**：历史上该地区的植物（南方竹林、北方松柏）
- **气候**：历史气候记录（如小冰期的严寒）
- 穿越者可能会从现代角度评价这些细节（"和博物馆里看到的一模一样"）

#### 氛围特征

用 2-3 个关键词概括场景的核心氛围：
- 宫殿："威严、暗流涌动、金碧辉煌中的压抑"
- 战场："肃杀、紧张、尸横遍野"
- 城池："繁华喧嚣、三教九流、生活气息"
- 氛围要与即将发生的历史事件相呼应（大战前的宁静、盛世下的危机）

#### 历史原型

**最关键的字段**——指明这个场景的历史依据：
- 宫殿/城池：对应的真实历史建筑/城市（如"原型为唐大明宫含元殿"）
- 战场：对应的真实战役（如"原型为淝水之战主战场"）
- 府邸：对应的历史人物府邸（如"原型为长安崇仁坊某公府"）
- 如是完全原创场景，说明"无明确历史原型，基于X朝代建筑风格虚构"
- 历史原型帮助保持小说的考据质感

---

### 场景阵容建议

**标准配置**：
1. **权力中心**（1 个）：宫殿或朝堂——政治博弈的核心场所
2. **主角据点**（1 个）：穿越后主角的主要活动空间（府邸/军营/书院等）
3. **冲突场景**（1-2 个）：矛盾爆发的空间（战场/朝堂/密室）
4. **社会空间**（1-2 个）：展现时代面貌的民间场景（市集/酒楼/城门）
5. **转折场景**（1 个）：关键历史事件的发生地

**选择场景时的历史逻辑**：
- 场景选择必须与穿越设定中的时代和地域一致
- 如穿越到三国，核心场景应在曹魏/蜀汉/东吴的势力范围内
- 场景的繁华/荒凉程度要与历史时期匹配

---

### 与已有设定的联动

| 设定模块 | 对场景的影响 |
|---------|------------|
| **穿越设定** | 穿越时代→建筑风格和社会面貌的基准；穿越身份→主角活动场所的选择 |
| **原著背景** | 历史朝代→场景的考据标准；地理背景→场景的空间分布 |
| **原著剧情** | 关键事件→必须包含的事件发生地；历史转折→需要的决战/密谈场景 |
| **历史事件时间线** | 事件列表→场景需要承载的时间节点；地理变迁→场景可能的变化 |
| **文风设定** | 历史感浓度→考据细节的详略程度 |

---

### 常见错误

1. **朝代错位**：使用了与穿越时代不符的建筑或地名（如在唐代出现明清建筑）
2. **历史原型缺失**：所有场景都是原创的"某宫殿""某城池"，缺乏历史依据
3. **地理混乱**：场景的地理位置与历史不符（如在蜀汉领土上放了曹魏的场景）
4. **考据过度**：过分堆砌历史细节导致场景描写像历史教科书
5. **时代氛围缺失**：场景描写没有体现出那个历史时期的独特气质
6. **功能重叠**：多个场景承载相同的叙事功能',
  '## "Scene" Generation — Historical Crossing Novel

The core of scene design in historical crossing novels is **historical accuracy × period texture × balance between fact and fiction**. Scenes are not imagined ancient spaces but places with verifiable historical prototypes.

The transmigrator enters a "known history" — scenes carry events that have already happened or are about to happen.

---

### Field Generation Guide

#### Scene Name (场景名称)
Use historically real place or building names when possible. Style must match the era.

#### Scene Type (场景类型)
Six types: Palace (imperial power center), Battlefield (military conflict), City (economic/cultural center), Mansion (private noble space), Jianghu (unofficial folk space), Other.

#### Scene Type Detail (场景类型详情)
Elaborate on the type: which specific hall, terrain features, city districts. Show historical period specificity.

#### Environment Description (环境描述)
Balance atmosphere with historical accuracy: period-appropriate architecture, artifacts, flora, and climate.

#### Atmosphere (氛围特征)
2-3 keywords capturing core atmosphere. Should echo upcoming historical events.

#### Historical Prototype (历史原型)
Most critical field: identify the real historical basis. Palaces/cities map to real buildings. Battlefields map to real battles. If fully fictional, state the period basis.

---

### Setting Linkage

| Setting | Impact |
|---------|--------|
| **Crossing Setup** | Era → architectural and social baseline; identity → activity locations |
| **Original Background** | Dynasty → research standards; geography → spatial distribution |
| **Original Plot** | Key events → required event locations; turning points → battle/secret meeting scenes |
| **Historical Timeline** | Events → time nodes scenes must host; geographic changes → scene evolution |
| **Writing Style** | Historical density → research detail level |

---

### Common Errors

1. **Dynasty mismatch**: Architecture from wrong era
2. **Missing prototypes**: All scenes are generic without historical basis
3. **Geographic confusion**: Scene locations contradict historical geography
4. **Over-researched**: Scene reads like a textbook
5. **Missing period atmosphere**: Descriptions lack era-specific qualities
6. **Overlapping functions**: Multiple scenes serve the same narrative purpose',
  (SELECT id FROM novel_creation_method WHERE name = '历史人物穿越小说' LIMIT 1),
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
