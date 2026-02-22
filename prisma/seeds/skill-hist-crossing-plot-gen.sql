-- 历史人物穿越小说「情节设计」领域知识技能（Layer 3）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '历史人物穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-hist-crossing-plot-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'hist-crossing-plot-gen',
  '「情节设计」领域知识：为历史人物穿越小说提供剧情设计指导，涵盖历史事件改写、蝴蝶效应处理、与历史人物互动等典型剧情模式',
  '"Plot Design" domain knowledge: plot design guidance for historical figure crossing novels, covering historical event rewriting, butterfly effect handling, and interaction with historical figures',
  '## 「情节设计」领域知识 — 历史人物穿越小说

历史人物穿越小说的剧情核心是**穿越者携带未来知识进入真实历史节点，面对"改变还是顺应"历史走向的抉择**。故事张力来自：穿越者的先知优势与历史惯性的博弈、改变历史的欲望与蝴蝶效应的不可控。

剧情设计的关键在于：如何让穿越者的干预合理可信，同时保持历史背景的厚重感。既不能让穿越者轻易改变历史，也不能让历史完全不可撼动。

---

### 典型故事结构

历史穿越小说通常遵循以下五阶段结构：

| 阶段 | 章节占比 | 核心任务 | 典型事件类型 |
|------|---------|---------|-------------|
| **观察期** | 10-15% | 确认历史节点、评估局势、制定策略 | 普通事件为主 |
| **小幅介入期** | 15-20% | 在不引发剧变的前提下小范围改变 | 普通 + 转折 |
| **蝴蝶效应期** | 25-30% | 连锁反应扩大，局势偏离已知历史 | 转折 + 伏笔 |
| **改变历史期** | 20-25% | 关键历史节点的重大改写 | 高潮 + 转折 |
| **新格局期** | 10-15% | 新历史走向的确立和稳定 | 结局为主 |

---

### 故事线模式

#### 主线（通常 1 条）

主线围绕穿越者对核心历史事件的态度和行动：

- **拯救线**：试图拯救某个历史人物（避免其悲剧命运）
- **纠偏线**：修正历史中的某个错误决策或方向
- **争霸线**：利用先知优势参与历史权力博弈
- **守护线**：保护历史走向不被其他势力破坏

#### 常见支线

| 支线类型 | 说明 | 与主线的关系 |
|---------|------|-------------|
| **历史人物关系线** | 与关键历史人物建立信任/对立关系 | 直接影响主线推进的关键杠杆 |
| **身份维持线** | 在古代社会维持合理身份 | 主线行动的基础保障 |
| **感情线** | 与历史人物或原创角色的感情 | 情感动力，可能与历史走向产生冲突 |
| **知识应用线** | 现代知识在历史中的应用 | 为主角提供影响力和资源 |
| **原著剧情偏移线** | 因穿越者干预导致的连锁变化 | 增加不确定性和紧张感 |

---

### 事件编排模式

#### 观察期

- **穿越定位**：确认穿越到了哪个历史节点
- **历史回忆**：调用已知历史知识评估当前局势
- **身份确立**：找到在这个时代的立足点
- **关键人物接触**：与核心历史人物的初次交集
- 事件重要度：1-3

#### 小幅介入期

- **试探性干预**：在小事上测试是否能改变历史
- **第一个蝴蝶**：首次发现自己的行动引发了意料之外的变化
- **结盟/站队**：选择与哪方势力合作
- **建立信誉**：让关键人物认可自己的价值
- 事件重要度：2-4

#### 蝴蝶效应期

- **连锁反应**：小改变引发大变化，局势开始偏离已知历史
- **两难抉择**：改变历史可能带来更坏的后果
- **敌对势力**：有人察觉穿越者的异常或反对其干预
- **历史节点逼近**：关键历史事件即将发生
- 事件重要度：3-5

#### 改变历史期

- **关键节点决战**：在核心历史事件中做出干预
- **代价与牺牲**：改变历史需要付出的代价
- **历史人物抉择**：关键历史人物做出不同于原历史的选择
- **伏笔大规模回收**
- 事件重要度：4-5

#### 新格局期

- **新历史走向确立**：改变后的世界是什么样的
- **穿越者的归宿**：留在这个时代还是找到回去的方法
- **遗留问题处理**：新历史带来的新问题
- 事件重要度：3-5

---

### 伏笔策略

#### 常用伏笔类型

| 伏笔类型 | 说明 | 埋设时机 | 回收时机 |
|---------|------|---------|---------|
| **历史知识暗示** | 穿越者不经意展示的超前知识 | 观察期/介入期 | 蝴蝶效应期 |
| **蝴蝶效应线索** | 看似微小的改变暗示更大的连锁反应 | 小幅介入期 | 蝴蝶效应期/改变历史期 |
| **历史人物伏笔** | 某个历史人物的态度/行为暗示其未来选择 | 早中期 | 改变历史期 |
| **原著剧情暗影** | 即使被改变，原历史走向仍在某些方面留有痕迹 | 蝴蝶效应期 | 改变历史期/新格局期 |
| **身份危机** | 暗示穿越者身份可能暴露的线索 | 任意阶段 | 高潮期 |

#### 历史穿越特有的伏笔技巧

- **已知历史作为伏笔**：读者熟悉的历史事件本身就是最好的伏笔，穿越者和读者都知道即将发生什么，悬念在于能否改变
- **蝴蝶效应递进**：小伏笔引发中伏笔，中伏笔引发大伏笔，形成连锁
- **历史惯性暗示**：即使改变了某些事件，历史的某些趋势仍然顽强地向原方向发展

---

### 常见错误

1. **历史考据不严谨**：涉及真实历史人物和事件时，基本史实出错会严重损害可信度
2. **穿越者过于强势**：轻松改变所有历史走向，缺乏阻力和代价
3. **蝴蝶效应无边界**：每个小改变都引发巨大连锁反应，导致故事失控
4. **历史人物工具化**：真实历史人物沦为推动剧情的工具，缺乏其历史人格的独立性
5. **现代价值观强加**：用现代标准评判古代人物和事件，缺乏历史情境的理解
6. **情节与史实冲突**：虚构情节与读者熟知的历史事实产生不可调和的矛盾
7. **节奏前松后紧**：观察期过长导致读者失去耐心，关键历史节点仓促处理',
  '## "Plot Design" Domain Knowledge — Historical Figure Crossing Novels

The core of historical figure crossing novel plots is the **transmigrator carrying future knowledge into real historical nodes, facing the dilemma of "changing or following" the course of history**. Story tension comes from: the game between the transmigrator''s prescient advantage and historical inertia, the desire to change history versus the uncontrollable butterfly effect.

The key to plot design: making the transmigrator''s interventions reasonable and credible while maintaining the weight of the historical backdrop. The transmigrator should neither easily change history nor find it completely immovable.

---

### Typical Story Structure

| Phase | Chapter Ratio | Core Task | Typical Event Types |
|-------|--------------|-----------|-------------------|
| **Observation Period** | 10-15% | Confirm historical node, assess situation, formulate strategy | Mostly normal events |
| **Minor Intervention** | 15-20% | Small-scale changes without triggering upheaval | Normal + turning points |
| **Butterfly Effect** | 25-30% | Chain reactions amplify, situation diverges from known history | Turning points + foreshadowing |
| **Changing History** | 20-25% | Major rewriting of key historical nodes | Climax + turning points |
| **New Order** | 10-15% | Establishment and stabilization of new historical trajectory | Mostly resolution events |

---

### Story Line Patterns

#### Main Line (typically 1)

- **Rescue arc**: Trying to save a historical figure from their tragic fate
- **Correction arc**: Fixing a wrong decision or direction in history
- **Contention arc**: Using prescient advantage to participate in historical power struggles
- **Guardian arc**: Protecting the historical trajectory from disruption

#### Common Branch Lines

| Branch Type | Description | Relationship to Main Line |
|------------|-------------|--------------------------|
| **Historical figure relationships** | Building trust/opposition with key figures | Key lever for main plot advancement |
| **Identity maintenance** | Maintaining a reasonable identity in ancient society | Foundation for main line actions |
| **Romance** | With historical or original characters | Emotional motivation, may conflict with historical trajectory |
| **Knowledge application** | Modern knowledge applied in historical context | Provides influence and resources |
| **Original plot deviation** | Chain changes caused by transmigrator intervention | Adds uncertainty and tension |

---

### Event Arrangement Patterns

#### Observation Period
- Transmigration positioning: confirm which historical node
- Historical recall: assess current situation using known history
- Identity establishment: find footing in this era
- Key figure contact: first intersection with core historical figures
- Importance: 1-3

#### Minor Intervention
- Tentative interference: test whether history can be changed on small matters
- First butterfly: discover unexpected changes from own actions
- Alliance/faction choice: choose which side to cooperate with
- Importance: 2-4

#### Butterfly Effect
- Chain reactions: small changes trigger large shifts
- Dilemmas: changing history may bring worse consequences
- Opposition: someone notices the transmigrator''s anomalies
- Historical node approaching
- Importance: 3-5

#### Changing History
- Key node confrontation: intervening in core historical events
- Cost and sacrifice: the price of changing history
- Historical figure decisions: key figures making different choices
- Mass foreshadow resolution
- Importance: 4-5

#### New Order
- New historical trajectory established
- Transmigrator''s fate: stay or return
- Residual issues from the changed history
- Importance: 3-5

---

### Foreshadow Strategy

#### Common Types

| Type | Description | Planting | Resolution |
|------|-------------|----------|------------|
| **Historical knowledge hints** | Inadvertent display of future knowledge | Observation/Intervention | Butterfly Effect |
| **Butterfly effect clues** | Minor changes hinting at larger chain reactions | Minor Intervention | Butterfly/Changing History |
| **Historical figure foreshadows** | A figure''s attitude hinting at future choices | Early-mid | Changing History |
| **Original plot shadows** | Traces of original history persisting despite changes | Butterfly Effect | Changing History/New Order |
| **Identity crisis** | Clues suggesting possible exposure | Any phase | Climax |

#### Unique Techniques for Historical Crossing

- **Known history as foreshadow**: Familiar historical events serve as natural foreshadows
- **Butterfly effect progression**: Small foreshadows trigger medium ones, which trigger large ones
- **Historical inertia hints**: Some trends stubbornly persist despite changes

---

### Common Mistakes

1. **Inaccurate historical research**: Basic historical facts errors seriously damage credibility
2. **Overpowered transmigrator**: Easily changing all historical trajectories without resistance or cost
3. **Boundless butterfly effect**: Every small change triggers massive chain reactions, story loses control
4. **Historical figures as tools**: Real figures reduced to plot devices without independent historical personality
5. **Imposing modern values**: Judging ancient figures by modern standards without historical context understanding
6. **Plot-history conflicts**: Fictional plot contradicting well-known historical facts irreconcilably
7. **Pacing imbalance**: Observation period too long, key historical nodes rushed',

  (SELECT id FROM novel_creation_method WHERE name = '历史人物穿越小说' LIMIT 1),
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
