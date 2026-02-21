-- 历史人物穿越小说「势力」生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '历史人物穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-hist-crossing-org-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'hist-crossing-org-gen',
  '「势力」生成：为历史人物穿越小说生成势力组织，涵盖朝廷派系、地方势力、江湖门派、外族势力四大类型，强调历史真实性与虚构的平衡',
  '"Faction" generation: generate factions for historical figure crossover novels, covering four types (court factions, local powers, martial sects, foreign forces) with emphasis on historical authenticity and fictional balance',
  '## 「势力」生成 — 历史人物穿越小说

历史人物穿越小说的势力设计核心是**历史真实 × 合理虚构 × 立场博弈**。势力设计必须以真实历史为锚点——朝代的政治格局、真实的历史派系、已知的势力消长，然后在此基础上进行合理的虚构和戏剧化。

穿越者附身历史人物后，其行为会影响势力格局的走向。好的势力设计要让读者感受到「这个势力在历史上确实可能存在」，同时提供足够的戏剧空间让穿越者施展。

---

### 字段生成指南

#### 势力名称

- 优先使用历史上真实存在的势力名称或合理的历史化命名
- 朝廷派系：用历史派系名或以核心人物命名（「主和派」「变法派」「严党」「东林党」）
- 地方势力：用地名+家族命名（「河北袁氏」「江东孙氏」）
- 外族势力：用历史上真实的外族名称（「匈奴」「契丹」「女真」）
- 江湖门派：使用历史上有记载或合理虚构的名称
- 命名要让读者一看就能联想到具体的历史背景

#### 势力类型

五个选项的历史定位：

| 类型 | 历史对应 | 设计要点 |
|------|---------|---------|
| **朝廷派系** | 历史上的政治集团 | 以政治路线划分，有明确的政策主张 |
| **地方势力** | 地方割据或豪族 | 有地盘、有兵力、与中央有张力 |
| **江湖门派** | 民间武装或帮会 | 游离于体制外，有独特的行为准则 |
| **外族势力** | 真实历史外族 | 与中原的军事/外交关系是核心 |
| **其他** | 补充选项 | 宗教势力、商业集团等特殊类型 |

选择「其他」时必须在「势力类型详情」中详细说明。

#### 势力类型详情

- 对势力类型的补充说明，尤其是选择「其他」时必填
- 对于朝廷派系：说明其政治主张和代表人物
- 对于外族势力：说明其与中原的历史关系（和亲、称臣、敌对）
- 内容要有历史依据或合理的历史推演

#### 核心人物

- **优先使用历史真实人物**——这是历史穿越小说的核心特征
- 如果需要虚构人物，要说明其在历史框架中的合理位置
- 人物的性格、能力要与历史记载基本一致（有据可查的部分）
- 写明人物的历史官职或身份

#### 势力实力

- 要有历史依据的实力描述
- **军事实力**：兵力规模、将领水平、装备状况
- **政治实力**：在朝中的话语权、与皇帝的关系
- **经济实力**：控制的资源、税赋基础
- **文化影响**：在士人中的声望、舆论影响力
- 实力描写要与该历史时期的实际情况吻合

#### 势力立场

三个选项决定与穿越者的基本关系：

| 立场 | 叙事功能 | 设计要点 |
|------|---------|---------|
| **友好** | 盟友、助力 | 友好要有原因——利益一致或关系绑定 |
| **中立** | 可争取的力量 | 中立不等于无害——可能随时倒向任一方 |
| **敌对** | 对手、障碍 | 敌对要有合理动机——不是为反对而反对 |

#### 与主角关系

- 必须基于穿越者所附身的历史人物的身份来设计
- 如果穿越者是某朝臣，关系要围绕朝堂展开
- 如果穿越者是某将领，关系要围绕军事展开
- 关系描述要具体：「因变法之争与主角对立，但在外敌入侵时可能暂时联手」

---

### 势力阵容建议

**标准配置**：
1. **主角阵营**（1 个）：穿越者附身人物所属或创建的势力
2. **朝堂对手**（1 个，朝廷派系类）：政治路线对立的势力
3. **外部威胁**（1 个，外族势力类）：来自外部的军事压力
4. **可争取势力**（1-2 个，地方势力/江湖门派类）：中立立场，可被穿越者争取
5. **幕后势力**（0-1 个）：隐藏的势力，制造悬念

**历史穿越特殊原则**：
- 势力格局要与历史朝代的实际政治生态吻合
- 真实历史人物的势力归属要准确
- 穿越者改变势力格局的过程要循序渐进，不能一蹴而就
- 外族势力的实力不能脱离历史实际

---

### 与已有设定的联动

| 设定模块 | 对势力的影响 |
|---------|------------|
| **世界** | 历史朝代→势力的时代背景和权力结构；政治体制→势力的合法性来源；军事形势→外族势力的威胁程度 |
| **故事钩子** | 核心历史事件→势力博弈的焦点；穿越身份→与各势力的初始关系 |
| **小说梗概** | 关键历史节点→势力消长的时间线；穿越者目标→需要的盟友和对手 |
| **文风设定** | 历史质感→势力描写的考据程度；戏剧冲突→势力对立的激烈程度 |

---

### 常见错误

1. **脱离历史框架**：势力设计完全架空，失去「历史穿越」的核心卖点
2. **历史人物性格失真**：核心人物的行为与历史记载严重矛盾
3. **立场过于绝对**：势力的友好/敌对关系没有变化空间——真实政治中立场会随利益变化
4. **外族势力脸谱化**：把外族简单化为「蛮族入侵者」，缺少其内部的复杂性
5. **势力实力不符史实**：夸大或缩小了某势力在该历史时期的实际影响力
6. **忽略与主角关系**：势力设计没有围绕穿越者的身份展开，关联性不足
7. **势力类型详情缺失**：选了「其他」却不详细说明类型',
  '## "Faction" Generation — Historical Figure Crossover Novel

The core of faction design in historical figure crossover novels is **historical truth × reasonable fiction × stance dynamics**. Faction design must anchor in real history — the political landscape of the era, real historical factions, known power shifts — then add reasonable fiction and dramatization.

After the time-traveler inhabits a historical figure, their actions affect faction dynamics. Good faction design makes readers feel "this faction could really have existed" while providing dramatic space for the traveler.

---

### Field Generation Guide

#### Faction Name (势力名称)
Prefer historically authentic faction names. Court factions: use historical names or key figures. Local powers: region + family. Foreign forces: real historical names. Names should evoke specific historical context.

#### Faction Type (势力类型)
Five types: Court Faction (political groups, policy-driven), Local Power (regional control, tension with center), Martial Sect (outside the system, unique codes), Foreign Force (military/diplomatic relations with Central Plains), Other (religious, commercial, etc. — must explain in detail field).

#### Type Details (势力类型详情)
Supplementary explanation. Required when "Other" is selected. Should have historical basis or reasonable historical inference.

#### Key Figures (核心人物)
**Prefer real historical figures** — this is the core feature. If fictional, explain their plausible historical position. Personality and abilities should match historical records. Include historical titles/positions.

#### Faction Strength (势力实力)
Historically grounded: military (troop scale, commanders), political (court influence, emperor relations), economic (resources, tax base), cultural (reputation among scholars). Must match the historical period.

#### Faction Stance (势力立场)
Three options: Friendly (allies — needs reason), Neutral (can be won over — not harmless), Hostile (opponents — needs rational motivation).

#### Relation with Protagonist (与主角关系)
Must be designed around the historical figure the traveler inhabits. Descriptions should be specific and dynamic.

---

### Faction Lineup Suggestion

Standard: protagonist''s camp (1), court opponent (1), external threat (1, foreign force), recruitable factions (1-2, neutral), hidden faction (0-1). Faction landscape must match historical political ecology.

---

### Common Errors

1. **Detached from history**: Fully fictional factions losing the "historical crossover" appeal
2. **Historical figures out of character**: Behavior contradicting historical records
3. **Absolute stances**: No room for stance changes — real politics shifts with interests
4. **Stereotyped foreign forces**: Reducing foreign factions to "barbarian invaders"
5. **Ahistorical strength levels**: Exaggerating or diminishing actual historical influence
6. **Weak protagonist connection**: Factions not designed around the traveler''s identity
7. **Missing type details**: Selecting "Other" without explanation',
  (SELECT id FROM novel_creation_method WHERE name = '历史人物穿越小说' LIMIT 1),
  1,
  26,
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
