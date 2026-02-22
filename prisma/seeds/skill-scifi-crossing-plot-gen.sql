-- 未来科幻穿越创作「情节设计」领域知识技能（Layer 3）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '未来科幻穿越创作' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-scifi-crossing-plot-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'scifi-crossing-plot-gen',
  '「情节设计」领域知识：为未来科幻穿越创作提供剧情设计指导，涵盖科技代差利用、时间线管理、文明冲突等典型剧情模式',
  '"Plot Design" domain knowledge: plot design guidance for sci-fi crossing novels, covering technology gap exploitation, timeline management, and civilization conflict plot patterns',
  '## 「情节设计」领域知识 — 未来科幻穿越创作

科幻穿越小说的剧情核心是**穿越者在高科技或异星文明中利用知识代差求生存和发展**。与古装穿越不同，科幻穿越的张力来自科技体系的碰撞：穿越者可能拥有对方缺乏的知识，也可能面对远超自身认知的科技。

剧情设计的关键在于：科技代差的合理利用（不能成为万能钥匙）、时间线/平行世界的逻辑自洽、以及科技发展带来的伦理困境。

---

### 典型故事结构

科幻穿越小说通常遵循以下五阶段结构：

| 阶段 | 章节占比 | 核心任务 | 典型事件类型 |
|------|---------|---------|-------------|
| **降临期** | 10-15% | 穿越到未来/异世界、了解科技水平 | 普通事件为主 |
| **适应期** | 15-20% | 学习新世界规则、找到生存方式 | 普通 + 转折 |
| **科技应用期** | 25-30% | 利用知识代差获得优势 | 转折 + 伏笔 |
| **势力博弈期** | 20-25% | 卷入文明级/星际级的冲突 | 高潮 + 转折 |
| **终极危机期** | 10-15% | 面对存亡级的终极威胁 | 结局为主 |

---

### 故事线模式

#### 主线（通常 1 条）

- **科技崛起线**：利用跨时代知识在新世界建立科技优势
- **回归线**：寻找回到原来时代/世界的方法
- **文明拯救线**：利用知识阻止某个文明的灭亡
- **真相探索线**：揭示穿越的原因和背后的科技/力量

#### 常见支线

| 支线类型 | 说明 | 与主线的关系 |
|---------|------|-------------|
| **科技线** | 关键科技的研发和应用 | 主角实力增长的核心手段 |
| **势力线** | 在新世界中建立影响力 | 中后期行动的基础 |
| **感情线** | 跨时代/跨种族的感情 | 留下还是回去的核心矛盾 |
| **时间线** | 穿越对时间线的影响和悖论 | 深层悬念来源 |
| **伦理线** | 科技应用带来的伦理困境 | 丰富主题深度 |

---

### 事件编排模式

#### 降临期

- **穿越事件**：穿越到未来世界/异星文明
- **文化冲击**：发现新世界的科技水平和社会结构
- **身份危机**：在高科技社会中没有合法身份
- **初次接触**：与关键角色的第一次交互
- 事件重要度：1-3

#### 适应期

- **学习新规则**：理解新世界的科技体系和社会规则
- **能力展示**：首次展示自己的独特知识价值
- **获得立足点**：找到在新世界的位置和身份
- **发现异常**：察觉新世界中不对劲的地方
- 事件重要度：2-4

#### 科技应用期

- **关键技术突破**：利用知识代差实现重要创新
- **引发关注**：科技成果吸引各方势力注意
- **技术竞赛**：与本地科学家/势力的技术较量
- **伦理抉择**：某些技术的应用面临道德困境
- 事件重要度：3-5

#### 势力博弈期

- **文明级冲突**：不同文明/势力之间的大规模对抗
- **科技武器化**：技术被用于战争和控制
- **背叛与同盟**：势力间的合作与出卖
- **穿越真相接近**：逐渐发现穿越的真正原因
- 事件重要度：4-5

#### 终极危机期

- **存亡危机**：文明级/星球级的终极威胁
- **终极科技方案**：用终极技术应对终极危机
- **代价与选择**：解决危机需要付出什么代价
- **伏笔全面回收**
- 事件重要度：5

---

### 伏笔策略

#### 常用伏笔类型

| 伏笔类型 | 说明 | 埋设时机 | 回收时机 |
|---------|------|---------|---------|
| **穿越原因** | 穿越不是偶然的，背后有人为操控 | 降临期 | 势力博弈或终极危机 |
| **科技暗线** | 某项看似无关的技术暗藏关键用途 | 适应期/科技应用期 | 终极危机期 |
| **时间悖论** | 穿越者的行为可能产生时间悖论 | 科技应用期 | 终极危机期 |
| **文明遗迹** | 已灭亡文明留下的技术/信息 | 适应期 | 势力博弈期 |
| **AI/意识暗线** | 人工智能或意识传输的隐藏秘密 | 降临期 | 终极危机期 |

#### 科幻特有的伏笔技巧

- **科技原理伏笔**：前期解释的某个科学原理在后期成为解决危机的关键
- **时间循环暗示**：穿越者发现自己之前就来过这个世界的痕迹
- **数据/日志碎片**：通过逐步发现的数据碎片拼凑真相

---

### 常见错误

1. **科技万能化**：穿越者的知识能解决一切问题，缺乏新世界技术的优势
2. **设定不自洽**：科技体系的内部逻辑矛盾，时间线悖论处理粗糙
3. **缺乏科技感**：虽然标签是科幻，但实际剧情可以换到任何背景
4. **忽视社会影响**：科技创新缺乏对社会结构的连锁影响
5. **信息过载**：过多技术细节解释拖慢剧情节奏
6. **伦理探讨浅薄**：提出伦理问题但草草带过，缺乏深度思考
7. **终极危机突兀**：最终威胁缺乏前期铺垫，突然出现',
  '## "Plot Design" Domain Knowledge — Sci-Fi Crossing Novels

The core of sci-fi crossing novel plots is the **transmigrator''s survival and development in a high-tech or alien civilization using knowledge gaps**. Unlike period drama crossings, sci-fi crossing tension comes from technology system collisions: the transmigrator may possess knowledge the other side lacks, or face technology far beyond their understanding.

The key to plot design: reasonable exploitation of technology gaps (not as a universal key), logical consistency of timelines/parallel worlds, and ethical dilemmas brought by technological development.

---

### Typical Story Structure

| Phase | Chapter Ratio | Core Task | Typical Event Types |
|-------|--------------|-----------|-------------------|
| **Arrival** | 10-15% | Transmigrate to future/alien world, assess tech level | Mostly normal events |
| **Adaptation** | 15-20% | Learn new world rules, find survival method | Normal + turning points |
| **Tech Application** | 25-30% | Leverage knowledge gap for advantage | Turning points + foreshadowing |
| **Power Struggle** | 20-25% | Drawn into civilization/interstellar level conflicts | Climax + turning points |
| **Ultimate Crisis** | 10-15% | Face existential-level ultimate threat | Mostly resolution events |

---

### Story Line Patterns

#### Main Line (typically 1)
- **Tech rise arc**: Building technological advantage using cross-era knowledge
- **Return arc**: Finding a way back to original era/world
- **Civilization rescue arc**: Using knowledge to prevent a civilization''s extinction
- **Truth exploration arc**: Revealing the cause and forces behind the transmigration

#### Common Branch Lines
| Branch Type | Description | Relationship to Main Line |
|------------|-------------|--------------------------|
| **Tech line** | Key technology R&D and application | Core means of protagonist''s power growth |
| **Faction line** | Building influence in new world | Foundation for later actions |
| **Romance** | Cross-era/cross-species feelings | Core tension of staying vs returning |
| **Timeline** | Impact and paradoxes of transmigration on timeline | Deep suspense source |
| **Ethics line** | Ethical dilemmas from tech application | Enriches thematic depth |

---

### Event Arrangement Patterns

#### Arrival
- Transmigration event
- Culture shock: discovering new world''s tech level and social structure
- Identity crisis: no legal identity in high-tech society
- First contact with key characters
- Importance: 1-3

#### Adaptation
- Learning new rules
- Ability demonstration: first showing unique knowledge value
- Gaining foothold: finding position and identity in new world
- Discovering anomalies
- Importance: 2-4

#### Tech Application
- Key technology breakthrough
- Attracting attention from various factions
- Tech competition with local scientists/forces
- Ethical choices on technology application
- Importance: 3-5

#### Power Struggle
- Civilization-level conflicts
- Technology weaponization
- Betrayal and alliance
- Approaching truth of transmigration
- Importance: 4-5

#### Ultimate Crisis
- Existential threat to civilization/planet
- Ultimate tech solution
- Cost and choice
- Complete foreshadow resolution
- Importance: 5

---

### Foreshadow Strategy

| Type | Description | Planting | Resolution |
|------|-------------|----------|------------|
| **Transmigration cause** | Transmigration was not accidental | Arrival | Power Struggle or Crisis |
| **Tech hidden line** | Seemingly unrelated tech hides critical use | Adaptation/Tech Application | Ultimate Crisis |
| **Time paradox** | Actions may create temporal paradox | Tech Application | Ultimate Crisis |
| **Civilization relics** | Technology/info left by extinct civilizations | Adaptation | Power Struggle |
| **AI/consciousness** | Hidden secrets of AI or consciousness transfer | Arrival | Ultimate Crisis |

---

### Common Mistakes

1. **Omnipotent technology**: Transmigrator''s knowledge solves everything, no local tech advantages
2. **Inconsistent settings**: Internal logic contradictions, poorly handled time paradoxes
3. **Lacking sci-fi feel**: Plot could work in any setting despite sci-fi label
4. **Ignoring social impact**: Tech innovation lacking cascading effects on social structure
5. **Information overload**: Too many technical explanations slowing plot pacing
6. **Shallow ethics**: Raising ethical questions but glossing over them
7. **Abrupt ultimate crisis**: Final threat appearing without prior buildup',

  (SELECT id FROM novel_creation_method WHERE name = '未来科幻穿越创作' LIMIT 1),
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
