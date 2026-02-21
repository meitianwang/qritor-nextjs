-- 异世界玄幻穿越小说「场景」生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '异世界玄幻穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-xuanhuan-crossing-scene-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xuanhuan-crossing-scene-gen',
  '「场景」生成：为异世界玄幻穿越小说生成场景，涵盖城池宗门秘境遗迹等玄幻空间设计，融合修炼体系与势力格局',
  '"Scene" generation: generate scenes for xuanhuan crossing novels, covering cities, sects, secret realms, ruins and other fantasy spaces with cultivation system and faction dynamics',
  '## 「场景」生成 — 异世界玄幻穿越小说

异世界玄幻穿越小说的场景设计核心是**实力等级可视化 × 资源争夺空间 × 势力版图**。玄幻世界的场景不只是故事发生的背景板，每个场景都有自己的"实力门槛"——境界不够的修炼者根本无法进入某些区域。

场景的危险等级、蕴含的修炼资源、归属的势力直接驱动角色的冒险和冲突。穿越者从最低级的场景开始，随实力提升逐步解锁更高级的区域。

---

### 字段生成指南

#### 场景名称

- 玄幻场景命名要有"仙气"或"霸气"
- 城池：「天玄城」「龙渊王城」「落日城」
- 宗门：「青云宗」「万剑阁」「幽冥谷」
- 秘境：「太古遗迹」「混沌之渊」「天外神域」
- 命名风格要与世界观设定中的文化体系一致
- 禁止过于中二或网络化的名称

#### 场景类型

九个选项的玄幻世界逻辑：

| 类型 | 核心功能 | 设计重点 |
|------|---------|---------|
| **城池** | 安全区 + 交易中心 | 有防御体系保护，内部有商业区、拍卖行、情报点 |
| **宗门** | 修炼基地 + 势力据点 | 有山门、大殿、练功场、藏经阁等功能区；等级森严 |
| **秘境** | 机缘与危险并存 | 有独特的时空规则、资源产出、守护兽/机关 |
| **荒野** | 自由探索区 | 修炼资源散布其中、有野兽/散修出没、无势力保护 |
| **遗迹** | 上古传承所在 | 有上古强者留下的阵法、传承、宝物；极度危险 |
| **副本** | 试炼/考核空间 | 有明确的通关条件和奖励；可能是人造或天然 |
| **学院** | 培养机构 | 有等级制度、考核体系、资源分配规则 |
| **异界裂缝** | 连接不同空间的通道 | 空间不稳定、有异界生物、可能通往未知区域 |
| **其他** | 自定义 | 根据故事需要设计 |

#### 环境氛围与感官细节

玄幻场景的环境描写要体现**修炼世界的独特质感**：
- **灵气浓度**：灵气可视化（雾状、光点、植物异常繁茂）
- **天象异常**：多个太阳/月亮、极光、永昼/永夜区域
- **奇异植物**：发光的灵药、移动的树木、危险的食人花
- **声音特征**：剑啸、兽吼、阵法嗡鸣
- 不同境界的修炼者在同一场景中的感知不同——低阶只看到雾，高阶能看到阵法纹路

#### 特殊规则/禁制

玄幻场景的**核心字段**——定义这个空间的超自然规则：

| 规则类型 | 说明 | 示例 |
|---------|------|------|
| **修为限制** | 境界门槛 | "只有金丹期以上才能承受此处的灵压" |
| **禁飞区** | 禁止御空飞行 | "此地有禁空阵法，只能步行通过" |
| **时间扭曲** | 内外时间流速不同 | "秘境内一天等于外界十天" |
| **空间限制** | 传送/瞬移失效 | "空间被封锁，无法使用传送阵" |
| **攻击禁制** | 禁止战斗 | "城内有护城大阵，战斗会被压制" |
| **特殊效果** | 增益或减益 | "此地灵气浓度极高，修炼效率翻倍" |

规则/禁制直接影响角色在此场景中的行为选择——这是玄幻世界观的核心设计。

#### 关键事件

该场景曾经或即将发生的重要事件：
- 过去的事件：解释场景的历史和当前状态（"千年前一场大战毁灭了这座城"）
- 当前的事件：主角到达时正在发生的情况（"即将举办宗门大比"）
- 未来可能的事件：为剧情发展预埋种子
- 事件要与「故事钩子」和角色动线对应

#### 与剧情作用

明确该场景在主线剧情中的叙事角色：
- **起点场景**：主角穿越后的第一个场景，承担世界观展示功能
- **成长场景**：主角修炼提升的主要空间
- **冲突场景**：与反派交锋的地点
- **转折场景**：重大剧情转折发生的地方
- **终局场景**：最终决战的地点
- 一个场景可以在不同阶段承担不同剧情功能

---

### 场景阵容建议

**标准配置**：
1. **起点城池/宗门**（1 个）：穿越者初始所在，安全但资源有限
2. **核心宗门/势力据点**（1 个）：主角加入或目标的核心势力
3. **试炼秘境**（1 个）：主角获得机缘和成长的空间
4. **冲突前线**（1 个）：与敌对势力的交汇地带
5. **荒野/遗迹**（1-2 个）：自由探索和意外收获的空间
6. **高阶区域**（1 个）：当前实力无法触及的"目标区域"

**场景等级递进**：
- 场景应体现从低到高的实力梯度
- 主角初期只能在低级场景活动
- 随实力提升逐步解锁更高级场景——这是读者的"升级爽感"来源

---

### 与已有设定的联动

| 设定模块 | 对场景的影响 |
|---------|------------|
| **穿越设定** | 穿越目标世界→场景的基本世界观；穿越起点→初始场景选择 |
| **世界观** | 大陆格局→场景的地理分布；势力版图→场景的归属关系；种族分布→场景的文化特色 |
| **修炼体系** | 境界等级→场景的实力门槛；修炼方向→功能区设计（炼丹、炼器等） |
| **金手指** | 类型→可能需要特定场景（如空间系金手指需要"随身空间"） |
| **故事钩子** | 核心卖点→场景阵容需服务于卖点 |
| **文风设定** | 节奏风格→场景切换的频率和密度 |

---

### 常见错误

1. **没有实力门槛**：所有场景对所有境界的角色都一样，失去了玄幻世界的层级感
2. **资源设定缺失**：场景只有风景没有修炼资源，角色没有冒险的动力
3. **势力归属模糊**：不清楚哪个势力控制哪个场景
4. **规则/禁制缺失**：场景没有任何超自然规则，和普通小说场景无异
5. **场景等级扁平**：所有场景难度一样，没有从低到高的递进感
6. **与世界观脱节**：场景的地理位置和种族分布与世界观设定矛盾',
  '## "Scene" Generation — Xuanhuan Crossing Novel

The core of scene design in xuanhuan crossing novels is **power level visualization × resource competition spaces × faction territory**. Every scene has a "power threshold" — cultivators below certain realms cannot enter certain areas.

Scene danger levels, cultivation resources, and faction ownership directly drive character adventures and conflicts.

---

### Field Generation Guide

#### Scene Name (场景名称)
Fantasy naming with "immortal" or "domineering" feel. Cities: "Tianxuan City". Sects: "Azure Cloud Sect". Secret realms: "Primordial Ruins".

#### Scene Type (场景类型)
Nine types: City (safe zone + trading), Sect (cultivation base + faction HQ), Secret Realm (fortune + danger), Wilderness (free exploration), Ruins (ancient inheritance), Dungeon (trial/exam), Academy (training institution), Dimensional Rift (inter-space passage), Other.

#### Atmosphere & Sensory Details (环境氛围与感官细节)
Show cultivation world''s unique texture: spiritual energy density (visible mist/light), celestial anomalies, exotic plants, unique sounds. Different cultivation levels perceive the same scene differently.

#### Special Rules/Restrictions (特殊规则/禁制)
Core field: cultivation level limits, no-fly zones, time distortion, spatial restrictions, combat prohibitions, special buffs/debuffs. Rules directly affect character behavior choices.

#### Key Events (关键事件)
Past events (explain history), current events (what''s happening on arrival), future events (plot seeds).

#### Plot Function (与剧情作用)
Narrative role: starting scene, growth scene, conflict scene, turning point scene, finale scene.

---

### Setting Linkage

| Setting | Impact |
|---------|--------|
| **Crossing Setup** | Target world → basic worldview; starting point → initial scene |
| **Worldview** | Continental layout → geographic distribution; faction territory → scene ownership; racial distribution → cultural features |
| **Cultivation System** | Realm levels → scene power thresholds; cultivation paths → functional areas |
| **Cheat Ability** | Type → may need specific scenes (spatial cheat → pocket dimension) |
| **Story Hook** | Core selling point → scene lineup must serve it |
| **Writing Style** | Pacing → scene transition frequency |

---

### Common Errors

1. **No power threshold**: All scenes equally accessible regardless of realm
2. **Missing resources**: Scenes have scenery but no cultivation resources
3. **Vague faction ownership**: Unclear which faction controls which scene
4. **Missing rules/restrictions**: No supernatural rules, indistinguishable from regular novels
5. **Flat scene levels**: All scenes same difficulty, no low-to-high progression
6. **Worldview disconnect**: Scene geography contradicts worldview settings',
  (SELECT id FROM novel_creation_method WHERE name = '异世界玄幻穿越小说' LIMIT 1),
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
