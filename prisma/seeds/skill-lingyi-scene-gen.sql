-- 民间灵异故事创作「场景」生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '民间灵异故事创作' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-lingyi-scene-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'lingyi-scene-gen',
  '「场景」生成：为民间灵异故事创作生成场景，涵盖凶地与日常异化、风水格局、怪谈传说、规则与禁忌、灵异活跃度设计',
  '"Scene" generation: generate scenes for folk horror stories, covering haunted locations, feng shui layouts, folklore legends, rules and taboos, and supernatural activity design',
  '## 「场景」生成 — 民间灵异故事创作

民间灵异故事的场景设计核心是**日常空间的异化 × 风水格局 × 规则与禁忌**。灵异场景不是凭空捏造的恐怖空间，而是读者熟悉的日常场所被灵异力量侵蚀后的变体——这种"熟悉中的陌生"才是中式恐怖的精髓。

每个场景都有自己的"规则"：什么时候安全、什么时候危险、什么行为会触发灵异事件。这些规则是读者代入和角色生存的基础。

---

### 字段生成指南

#### 场景名称

- 用具体的地名或民间称呼，避免泛泛的"某某地方"
- 好的命名：「张家老宅」「城隍庙后巷」「义庄」「404号房」「村西头老槐树」
- 差的命名：「恐怖的房间」「灵异之地」
- 名称本身可暗示不祥（如"断魂桥"、"鬼胡同"）

#### 场景类型

四个选项的恐怖设计逻辑：

| 类型 | 恐怖来源 | 设计要点 |
|------|---------|---------|
| **生活区（异化的日常场景）** | 熟悉变陌生的恐惧 | 正常空间中的微妙异常：温度骤降、镜子里多一个影子、半夜自动开关的灯 |
| **凶地（乱葬岗/刑场/荒废建筑）** | 死亡与历史的恐怖 | 有明确的"凶"的历史来源；怨气聚集的原因要交代 |
| **祭祀场所（祠堂/义庄/庙宇）** | 神圣与亵渎的张力 | 本应是庇护之地，一旦被亵渎或废弃就变成最危险的地方 |
| **异域结界（鬼打墙/幻境）** | 空间扭曲的恐怖 | 进得去出不来；时间和空间的规则被改写 |

#### 生命周期

三个选项的灵异场景含义：

| 周期 | 含义 | 典型场景 |
|------|------|---------|
| **长期（核心据点/主地图）** | 反复出现的主要恐怖空间 | 主角居住的老宅、村庄、核心鬼域 |
| **短期（单元副本/过场）** | 单个事件弧的场景 | 某次驱邪的目标地点、一夜惊魂的旅馆 |
| **一次性（陷阱/梦境）** | 用完即弃 | 梦境空间、阵法幻境、一次性陷阱 |

#### 环境氛围与感官细节

灵异场景的氛围描写**必须调动五感**：

| 感官 | 恐怖运用 | 示例 |
|------|---------|------|
| **视觉** | 光线变化、影子异常 | "角落里的影子比实物大了一圈" |
| **听觉** | 不明声响、寂静中的异响 | "半夜三点准时响起的脚步声" |
| **嗅觉** | 腐败、焚香、血腥 | "空气中弥漫着陈年香灰和腐肉的甜腻" |
| **触觉** | 温度异常、无形触碰 | "后背突然一凉，像被冰冷的手指划过" |
| **第六感** | 直觉的恐惧 | "总觉得有什么东西在暗处盯着自己" |

不要只写"阴森恐怖"这种抽象形容词，要用具体的感官细节。

#### 风水格局

中式恐怖的独特维度——场景的风水布局解释了灵异事件的成因：

- **聚阴格局**：朝向、水流、地势导致阴气聚集（"三面环水、背阴朝北"）
- **镇压格局**：某种布局用来镇压邪物（"四角埋有镇物、大门朝南正对泰山石"）
- **破败格局**：原有的风水保护被破坏（"拆了照壁后怪事不断"）
- **天然凶地**：地理条件本身就不吉利（"两条水流在此交汇形成剪刀煞"）

风水格局为灵异事件提供"科学化"的解释——不是凭空闹鬼，而是有风水上的原因。

#### 怪谈传说

每个灵异场景都有一个流传在当地的恐怖故事：

- 传说要有时间跨度（"老一辈人说..."、"民国时期..."）
- 传说要有多个版本（真相往往藏在不同版本的矛盾中）
- 传说要与场景当前的灵异现象对应（传说中的死法→当前闹鬼的方式）
- 传说可以是半真半假——这增加了悬疑感

#### 规则与禁忌

**灵异场景最核心的字段**——定义了在这个空间中什么能做、什么不能做：

- **时间规则**：什么时间段安全/危险（"子时到丑时不能出门"）
- **行为禁忌**：什么行为会触发灵异（"不能回头"、"不能叫全名"、"不能照镜子"）
- **保护规则**：什么行为可以保命（"身上带红绳"、"口含柚子叶"）
- **破解条件**：如何解除场景的灵异（"找到镇物恢复原位"、"超度怨灵"）

规则必须内在自洽，不能自相矛盾。好的规则会让读者有"我如果在场景中会怎么做"的代入感。

#### 异化状态

描述场景从正常到完全灵异化的渐进过程：

- 第一阶段：微妙异常（"搬进来后猫不进这个房间"）
- 第二阶段：可感知的异常（"每晚固定时间听到脚步声"）
- 第三阶段：明显灵异（"墙上渗出红色液体"）
- 第四阶段：完全异化（"空间本身开始扭曲"）

异化是渐进的——突然的恐怖不如慢慢逼近的恐怖。

---

### 场景阵容建议

**标准配置**：
1. **核心恐怖场景**（1-2 个）：主要灵异事件发生地（如闹鬼老宅、凶地）
2. **日常安全区**（1 个）：主角的临时安全港（但可能也会被异化）
3. **线索场景**（1-2 个）：获取真相的地方（如老庙、档案馆、老人家中）
4. **决战场景**（1 个）：最终对决或驱邪的核心场所
5. **过渡场景**（1-2 个）：日常空间中的短暂灵异体验

**灵异故事场景的特殊规则**：
- 安全区不是绝对安全的——恐怖感来自"没有任何地方是安全的"
- 每个场景的灵异规则不同——这制造了持续的紧张感
- 场景之间要有空间逻辑（同一个村子、同一栋楼等）

---

### 与已有设定的联动

| 设定模块 | 对场景的影响 |
|---------|------------|
| **世界** | 灵异规则体系→场景规则的上层约束；核心场景列表→必须包含的场景；民俗体系→风水格局和规则禁忌的依据 |
| **故事钩子** | 核心恐怖元素→场景的恐怖方向；故事结构→场景的叙事功能安排 |
| **小说梗概** | 关键事件→需要承载的核心剧情节点；事件发生地→场景必须涵盖 |
| **文风设定** | 恐怖氛围基调→环境描写的恐怖程度；叙事视角→场景呈现的角度 |

---

### 常见错误

1. **规则缺失**：场景只有恐怖氛围没有明确规则——好的灵异场景必须有可被推理的规则
2. **风水敷衍**：只写"阴气重"而不说明具体的风水格局原因
3. **五感单一**：只有视觉描写，缺少听觉、嗅觉、触觉的恐怖细节
4. **异化太突然**：直接跳到最恐怖的状态，缺少循序渐进的异化过程
5. **传说与现实断裂**：怪谈传说中的故事和当前灵异现象没有关联
6. **所有场景同质化**：每个场景都是"阴森的废弃建筑"，缺少类型差异
7. **安全区过于安全**：完全没有灵异侵蚀的迹象，降低了整体恐怖感',
  '## "Scene" Generation — Folk Horror Story Creation

The core of scene design in folk horror stories is **alienation of everyday spaces × feng shui layout × rules and taboos**. Horror scenes are not fabricated from nothing but familiar everyday places corrupted by supernatural forces — this "strangeness within familiarity" is the essence of Chinese horror.

Every scene has its own "rules": when it''s safe, when it''s dangerous, what behaviors trigger supernatural events.

---

### Field Generation Guide

#### Scene Name (场景名称)
Use specific place names or folk appellations. Good: "Zhang Family Ancestral House", "Behind the City God Temple". Bad: "Scary Room".

#### Scene Type (场景类型)
Four types with different horror sources: Living Area (familiar turned unfamiliar), Cursed Ground (death and history), Ritual Site (sacred vs profane tension), Supernatural Barrier (spatial distortion).

#### Life Cycle (生命周期)
Long-term (core horror space that recurs), Short-term (single event arc), One-time (traps/dreams).

#### Atmosphere & Sensory Details (环境氛围与感官细节)
Must engage all five senses: sight (shadow abnormalities), sound (unexplained noises), smell (decay, incense), touch (temperature drops), sixth sense (primal dread). Use concrete sensory details, not abstract adjectives.

#### Feng Shui Layout (风水格局)
Unique to Chinese horror: Yin-gathering layout, Suppression layout, Broken layout, Natural cursed ground. Provides "scientific" explanation for supernatural events.

#### Folklore & Legends (怪谈传说)
Each scene has a local horror story: should span time, have multiple versions, and correspond to current supernatural phenomena.

#### Rules & Taboos (规则与禁忌)
Most critical field: time rules, behavioral taboos, protection rules, resolution conditions. Must be internally consistent.

#### Altered State (异化状态)
Progressive corruption: subtle anomaly → perceivable anomaly → overt supernatural → full spatial distortion.

---

### Setting Linkage

| Setting | Impact |
|---------|--------|
| **World** | Supernatural rules → scene rule constraints; core scenes → must include; folk system → feng shui basis |
| **Story Hook** | Horror element → scene horror direction; structure → narrative function |
| **Synopsis** | Key events → plot nodes to host; event locations → must cover |
| **Writing Style** | Horror tone → description intensity; POV → presentation angle |

---

### Common Errors

1. **Missing rules**: Atmospheric but no clear rules for reader reasoning
2. **Superficial feng shui**: Just "heavy yin energy" without specific layout explanation
3. **Single-sense descriptions**: Only visual horror, lacking auditory/olfactory/tactile details
4. **Abrupt alienation**: Jumping to maximum horror without gradual progression
5. **Disconnected legends**: Folklore doesn''t relate to current supernatural phenomena
6. **Homogeneous scenes**: Every scene is "creepy abandoned building"
7. **Overly safe haven**: Safe zones show no signs of supernatural encroachment',
  (SELECT id FROM novel_creation_method WHERE name = '民间灵异故事创作' LIMIT 1),
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
