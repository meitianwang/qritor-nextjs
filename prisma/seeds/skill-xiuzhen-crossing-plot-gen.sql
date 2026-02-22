-- 异世界修真穿越小说「情节设计」领域知识技能（Layer 3）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '异世界修真穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-xiuzhen-crossing-plot-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xiuzhen-crossing-plot-gen',
  '「情节设计」领域知识：为异世界修真穿越小说提供剧情设计指导，涵盖修炼进阶、秘境历练、宗门纷争、功法暗线等典型剧情模式',
  '"Plot Design" domain knowledge: plot design guidance for cultivation crossing novels, covering cultivation progression, secret realm trials, sect conflicts, and technique hidden plotlines',
  '## 「情节设计」领域知识 — 异世界修真穿越小说

修真穿越小说的剧情核心是**穿越者在修真世界中以金手指为依托的修炼升级与势力博弈**。故事张力来自：修炼体系的层层递进（每次突破都是一个小高潮）、宗门/势力之间的复杂博弈、秘境探险中的未知危险。

剧情设计的关键在于：修炼进阶的节奏感（不能太快也不能太慢）、每个修炼阶段对应的剧情规模递进（练气期的危机和元婴期的危机量级完全不同）、以及金手指的合理使用。

---

### 典型故事结构

修真穿越小说通常遵循"修炼-历练-突破"的循环递进结构：

| 阶段 | 章节占比 | 核心任务 | 典型事件类型 |
|------|---------|---------|-------------|
| **入门期** | 10-15% | 穿越、发现金手指、拜入宗门 | 普通事件为主 |
| **修炼期** | 15-20% | 基础修炼、学习功法、建立人脉 | 普通 + 转折 |
| **历练期** | 25-30% | 秘境探险、对外战斗、获取机缘 | 转折 + 高潮 + 伏笔 |
| **宗门纷争期** | 20-25% | 卷入宗门/势力级别的大规模冲突 | 高潮 + 转折 |
| **跨界飞升期** | 10-15% | 突破到更高层次的世界 | 结局 + 新开篇（如有续） |

**循环特征**：修炼期→历练期→突破→更高层次的修炼期→更大规模的历练…… 每个循环的规模和危机级别递增。

---

### 故事线模式

#### 主线（通常 1 条）

主线围绕穿越者的修炼目标：

- **飞升线**：以突破修炼体系最高境界为目标
- **复仇线**：为原主或自身报仇，敌人修为远超自己
- **探秘线**：追寻修真世界的终极秘密
- **守护线**：保护宗门/亲友不被强大势力毁灭

#### 常见支线

| 支线类型 | 说明 | 与主线的关系 |
|---------|------|-------------|
| **宗门内部线** | 宗门内的师兄弟竞争、长老派系 | 提供资源争夺和人际冲突 |
| **感情线** | 道侣关系的发展（修真世界的感情更含蓄） | 情感动力，可能涉及双修等设定 |
| **功法/宝物线** | 追寻上古功法、炼制法宝 | 为突破和战斗提供关键道具 |
| **势力博弈线** | 宗门之间、正邪之间的大规模冲突 | 中后期主要冲突舞台 |
| **身世线** | 穿越者或原主的隐藏身世 | 中后期的重要转折来源 |

---

### 事件编排模式

#### 入门期

- **穿越事件**：穿越到修真世界（废柴体质、被欺负的外门弟子等常见起点）
- **金手指觉醒**：发现自己的特殊优势（系统、功法、空间等）
- **拜师/入门**：进入宗门或获得修炼传承
- **初次冲突**：与同辈弟子的小摩擦，展示潜力
- 事件重要度：1-3

#### 修炼期

- **突破事件**：第一次成功突破境界
- **功法学习**：掌握关键战斗/辅助功法
- **人脉建立**：结交盟友，明确对手
- **资源争夺**：灵石、丹药、修炼位置的竞争
- 事件重要度：2-4

#### 历练期

- **秘境开启**：进入危险的试炼场所
- **机缘获取**：得到上古传承、珍贵材料等
- **强敌对决**：与高修为敌人的生死战斗
- **意外发现**：揭示更大世界的线索
- 事件重要度：3-5

#### 宗门纷争期

- **势力级冲突**：宗门战争、正邪大战
- **叛徒揭露**：宗门内部的背叛者
- **关键抉择**：在宗门利益和个人道义之间选择
- **突破关键境界**：在战斗中完成关键突破
- 事件重要度：4-5

#### 跨界飞升期

- **终极考验**：飞升前的最后考验
- **大规模伏笔回收**
- **新世界展望**：更高层次世界的初窥
- 事件重要度：4-5

---

### 伏笔策略

#### 常用伏笔类型

| 伏笔类型 | 说明 | 埋设时机 | 回收时机 |
|---------|------|---------|---------|
| **功法暗线** | 修炼功法中隐藏的秘密或副作用 | 入门/修炼期 | 历练期或更后 |
| **身世伏笔** | 穿越者或原主的真实身份线索 | 入门期 | 宗门纷争期 |
| **宗门秘密** | 宗门建立的真正原因或隐藏的历史 | 修炼期 | 宗门纷争期 |
| **上古遗迹线索** | 在秘境中发现的更大秘密的碎片 | 历练期 | 后续历练或飞升期 |
| **势力暗线** | 隐藏的幕后势力或跨界存在 | 宗门纷争期 | 飞升期 |

#### 修真特有的伏笔技巧

- **修炼体系本身作为伏笔**：境界设定中的某些"常识"实际隐藏着更深的秘密
- **法宝/丹药的隐藏属性**：看似普通的物品在特定条件下展现真正价值
- **秘境递进揭秘**：每次进入秘境都揭示一层新信息，逐步拼凑完整真相

---

### 常见错误

1. **修炼速度失控**：突破太快导致战斗缺乏紧张感，或太慢导致读者失去耐心
2. **金手指过于强大**：主角靠金手指碾压一切，缺乏真正的挑战
3. **战斗模式化**：每次战斗都是"被压制→爆发→反杀"的固定套路
4. **境界通胀**：前期花大量篇幅描述的高境界强者，后期沦为路人
5. **宗门线断裂**：离开初始宗门后完全抛弃早期角色和关系
6. **秘境填充化**：秘境探险沦为刷怪升级，缺乏对主线的推进意义
7. **势力冲突简单化**：宗门战争变成单纯的比拼修为高低',
  '## "Plot Design" Domain Knowledge — Cultivation Crossing Novels

The core of cultivation crossing novel plots is the **transmigrator''s cultivation advancement and power struggles in a cultivation world, supported by their golden finger (cheat ability)**. Story tension comes from: the layer-by-layer progression of the cultivation system (each breakthrough is a mini-climax), complex politics between sects/factions, and unknown dangers in secret realm explorations.

The key to plot design: pacing of cultivation advancement (not too fast, not too slow), scaling of plot scope matching cultivation stages (a Qi Refining crisis is completely different in scale from a Nascent Soul crisis), and reasonable use of the golden finger.

---

### Typical Story Structure

Cultivation crossing novels follow a cyclical "cultivate-trial-breakthrough" structure:

| Phase | Chapter Ratio | Core Task | Typical Event Types |
|-------|--------------|-----------|-------------------|
| **Initiation** | 10-15% | Transmigration, discover golden finger, join sect | Mostly normal events |
| **Cultivation** | 15-20% | Basic training, learn techniques, build connections | Normal + turning points |
| **Trial** | 25-30% | Secret realm exploration, external battles, seize opportunities | Turning points + climax + foreshadowing |
| **Sect Conflict** | 20-25% | Large-scale sect/faction level conflicts | Climax + turning points |
| **Ascension** | 10-15% | Break through to a higher-level world | Resolution + new beginning (if sequel) |

**Cyclical nature**: Cultivation → Trial → Breakthrough → Higher-level cultivation → Larger-scale trial... Each cycle escalates in scope and crisis level.

---

### Story Line Patterns

#### Main Line (typically 1)
- **Ascension arc**: Goal is reaching the peak cultivation realm
- **Revenge arc**: Avenging against enemies far stronger than oneself
- **Mystery arc**: Pursuing the ultimate secrets of the cultivation world
- **Guardian arc**: Protecting sect/loved ones from powerful forces

#### Common Branch Lines

| Branch Type | Description | Relationship to Main Line |
|------------|-------------|--------------------------|
| **Internal sect** | Competition among disciples, elder factions | Resource competition and interpersonal conflict |
| **Romance** | Dao companion development (more restrained in cultivation worlds) | Emotional motivation, may involve dual cultivation settings |
| **Technique/treasure** | Seeking ancient techniques, crafting artifacts | Key items for breakthroughs and battles |
| **Faction politics** | Large-scale conflicts between sects, righteous vs evil | Major conflict arena in mid-to-late stages |
| **Origin mystery** | Hidden background of transmigrator or original host | Important turning point source in later stages |

---

### Event Arrangement Patterns

#### Initiation
- Transmigration event: arriving in cultivation world
- Golden finger awakening: discovering special advantage
- Joining sect: entering a sect or receiving cultivation inheritance
- First conflict: small friction with fellow disciples
- Importance: 1-3

#### Cultivation
- Breakthrough event: first successful realm breakthrough
- Technique mastery: learning key combat/support techniques
- Building connections: making allies, identifying rivals
- Resource competition: spiritual stones, pills, cultivation spots
- Importance: 2-4

#### Trial
- Secret realm opening: entering dangerous trial locations
- Fortune acquisition: obtaining ancient inheritances, rare materials
- Strong enemy duel: life-and-death battles with high-cultivation foes
- Unexpected discovery: clues revealing a larger world
- Importance: 3-5

#### Sect Conflict
- Faction-level conflicts: sect wars, righteous vs evil battles
- Traitor revelation: betrayers within the sect
- Critical choice: between sect interests and personal righteousness
- Key breakthrough: achieving critical advancement during battle
- Importance: 4-5

#### Ascension
- Ultimate trial before ascension
- Mass foreshadow resolution
- New world glimpse: first look at a higher-level world
- Importance: 4-5

---

### Foreshadow Strategy

#### Common Types
| Type | Description | Planting | Resolution |
|------|-------------|----------|------------|
| **Technique secrets** | Hidden properties or side effects of cultivation methods | Initiation/Cultivation | Trial or later |
| **Origin mystery** | Clues about transmigrator''s true identity | Initiation | Sect Conflict |
| **Sect secrets** | True reason for sect''s founding or hidden history | Cultivation | Sect Conflict |
| **Ancient relic clues** | Fragments of larger secrets found in realms | Trial | Later trials or Ascension |
| **Hidden forces** | Behind-the-scenes factions or cross-realm entities | Sect Conflict | Ascension |

#### Techniques Unique to Cultivation Stories
- **Cultivation system itself as foreshadow**: Certain "common knowledge" about realms actually hides deeper secrets
- **Hidden artifact properties**: Seemingly ordinary items reveal true value under specific conditions
- **Progressive secret realm reveals**: Each realm visit reveals a new layer of information

---

### Common Mistakes

1. **Uncontrolled cultivation speed**: Too fast removes battle tension, too slow loses reader patience
2. **Overpowered golden finger**: Protagonist crushes everything, no real challenges
3. **Formulaic battles**: Every fight follows "suppressed → burst → counter-kill" pattern
4. **Realm inflation**: High-realm experts described extensively early become fodder later
5. **Abandoned sect storyline**: Completely dropping early characters after leaving initial sect
6. **Filler secret realms**: Realm exploration becomes monster grinding without main plot advancement
7. **Oversimplified faction conflicts**: Sect wars reduced to purely comparing cultivation levels',

  (SELECT id FROM novel_creation_method WHERE name = '异世界修真穿越小说' LIMIT 1),
  1,
  30,
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
