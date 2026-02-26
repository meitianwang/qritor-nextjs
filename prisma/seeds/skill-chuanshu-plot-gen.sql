-- 穿书文小说「情节设计」领域知识
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '穿书文小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-chuanshu-plot-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'chuanshu-plot-gen',
  '「情节设计」领域知识：为穿书文小说提供剧情设计指导，涵盖原著剧情改写、蝴蝶效应处理、身份维持等典型剧情模式',
  '"Plot Design" domain knowledge: plot design guidance for book-crossing novels',
  '## 「情节设计」领域知识 — 穿书文小说

穿书文小说的剧情核心是**穿书者携带原著知识进入小说世界，面对"改变还是顺应"原著剧情的抉择**。故事张力来自：穿书者的先知优势与原著世界"剧情惯性"的博弈。

---

### 典型故事结构

穿书文通常遵循五阶段结构：

| 阶段 | 章节占比 | 核心任务 |
|------|---------|---------|
| **适应期** | 10-15% | 确认穿越身份、回忆原著剧情、制定生存策略 |
| **试探期** | 15-20% | 小范围改变剧情，测试原著世界的"容错度" |
| **蝴蝶效应期** | 25-30% | 改变引发连锁反应，剧情偏离加剧 |
| **剧情决战期** | 20-25% | 原著关键节点的重大改写 |
| **新结局期** | 10-15% | 新故事走向的确立和收束 |

---

### 穿书文特有的故事线模式

#### 主线模式

| 模式 | 核心冲突 | 适合身份 |
|------|---------|---------|
| **改命线** | 改变自身/他人在原著中的悲惨命运 | 炮灰、反派 |
| **抱大腿线** | 提前与原著主角/强者交好 | 配角、路人甲 |
| **截胡线** | 抢夺原著主角的机缘/资源 | 炮灰、原创角色 |
| **躺平线** | 试图远离主线安稳度日（但总被卷入） | 所有身份 |
| **翻案线** | 为"恶毒配角"正名，揭示被隐藏的真相 | 反派、炮灰 |

#### 常见支线

| 支线类型 | 说明 |
|---------|------|
| **身份维持线** | 穿书者必须演好"原角色"，不能被发现穿书 |
| **原著剧情追踪线** | 监控原著主线是否按计划发展 |
| **感情线** | 与原著角色产生非原著中的感情 |
| **人设崩塌线** | 穿书者的行为与原角色越来越不同，引发怀疑 |
| **先知失效线** | 剧情偏离后穿书者逐渐失去信息优势 |

---

### 事件编排模式

#### 适应期

- **穿越确认**：确认自己穿进了哪本书、穿成了谁
- **原著回忆**：翻找脑海中对原著的记忆，梳理关键信息
- **紧急自救**：如果穿成炮灰/反派，可能需要立即行动避免"领便当"
- **角色扮演**：学习原角色的说话方式、人际关系、日常习惯
- 事件重要度：1-3

#### 试探期

- **第一次干预**：穿书者做出第一个偏离原著的选择
- **观察后果**：原著世界是否有"自我修正"的力量
- **收集资源**：利用先知信息提前获取道具/人脉
- **与原著角色交集**：穿书者与关键角色的互动
- 事件重要度：2-4

#### 蝴蝶效应期

- **剧情偏移加剧**：穿书者的改变引发越来越大的连锁反应
- **先知信息失效**：越来越多的剧情与记忆中不同
- **多方博弈**：原著主角、反派、配角都受到影响
- **身份危机升级**：异常行为引起更多角色的怀疑
- 事件重要度：3-5

#### 剧情决战期

- **关键节点改写**：在原著最重要的事件中做出不同的选择
- **原著主角的态度**：主角对穿书者改变剧情的反应
- **代价与牺牲**：改变原著走向需要付出的代价
- **伏笔回收**：之前埋下的所有线索在此收束
- 事件重要度：4-5

#### 新结局期

- **新故事确立**：穿书者成功/失败创造了新的结局
- **角色命运结算**：每个角色的最终命运
- **穿书者的归宿**：留在书中世界还是回到现实
- 事件重要度：3-5

---

### 穿书文特有的伏笔技巧

| 伏笔类型 | 说明 | 示例 |
|---------|------|------|
| **原著知识暗示** | 穿书者不经意展示超前知识 | "你怎么知道这个？""呃……我猜的" |
| **剧情偏移线索** | 看似微小的改变暗示更大连锁反应 | 救了一个路人，结果改变了一场战争的走向 |
| **人设裂缝** | 穿书者的行为与原角色越来越不同 | 原本"恶毒女配"突然对下人和善 |
| **原著世界反馈** | 世界似乎在"纠正"剧情偏离 | 穿书者避开的危机以另一种形式出现 |
| **身份危机递进** | 被怀疑的线索逐步累积 | 从"你最近变了"到"你到底是谁" |

---

### 常见错误

1. **穿书者无所不能**：轻松改变所有剧情，缺乏阻力
2. **原著世界过于被动**：任由穿书者改变一切，没有"剧情惯性"
3. **身份维持问题被忽视**：穿书者完全不演原角色也没人发现
4. **蝴蝶效应不连贯**：改变了大事但后续不处理连锁影响
5. **主角光环被忽视**：原著主角应该有强大的命运加持
6. **感情线强行推进**：穿书者与原著角色的感情缺乏合理的发展过程
7. **结尾仓促**：新结局缺乏充分的铺垫和过渡',
  '## "Plot Design" Domain Knowledge — Book-Crossing Novel

Core: crosser carrying original knowledge faces "change or follow" the original plot. Tension: foreknowledge vs. the world''s "plot inertia."

---

### Typical Five-Phase Structure
Adaptation (10-15%), Testing (15-20%), Butterfly Effect (25-30%), Plot Showdown (20-25%), New Ending (10-15%).

### Unique Story Line Patterns
Main lines: Fate-Changing, Power-Attachment, Opportunity-Stealing, Relaxation (always dragged back in), Vindication.
Sub-lines: Identity maintenance, original plot tracking, romance, character divergence, prophecy failure.

### Event Arrangement by Phase
Adaptation: crossing confirmation, memory recall, emergency survival, role-playing.
Testing: first intervention, consequence observation, resource gathering.
Butterfly Effect: plot deviation escalation, prophecy failure, multi-party effects.
Showdown: key node rewriting, protagonist reaction, cost and sacrifice.
New Ending: new story establishment, character fate settlement, crosser''s final destination.

### Unique Foreshadowing Techniques
Original knowledge hints, plot deviation clues, character mask cracks, world self-correction, identity crisis escalation.

### Common Errors
1. Omnipotent crosser. 2. Passive original world. 3. Identity maintenance ignored. 4. Disconnected butterfly effects. 5. Protagonist halo ignored. 6. Forced romance. 7. Rushed ending.',
  (SELECT id FROM novel_creation_method WHERE name = '穿书文小说' LIMIT 1),
  1,
  40,
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
