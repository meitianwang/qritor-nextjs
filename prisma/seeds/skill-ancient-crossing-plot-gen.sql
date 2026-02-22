-- 古代架空穿越小说「情节设计」领域知识技能（Layer 3）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '古代架空穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-ancient-crossing-plot-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ancient-crossing-plot-gen',
  '「情节设计」领域知识：为古代架空穿越小说提供剧情设计指导，涵盖朝堂权谋、家族争斗、后宅暗战等典型剧情模式',
  '"Plot Design" domain knowledge: plot design guidance for ancient fictional crossing novels, covering court politics, clan conflicts, inner court struggles and other typical plot patterns',
  '## 「情节设计」领域知识 — 古代架空穿越小说

古代架空穿越小说的剧情核心是**穿越者凭借现代认知在架空古代社会中的生存与崛起**。故事张力来自两个维度的碰撞：现代思维与古代规则的冲突、个人能力与等级社会的博弈。

剧情设计的关键在于：穿越者如何在维持身份不暴露的前提下，利用现代知识逐步改变自身处境，同时应对来自家族、朝堂、后宅等多方势力的压力。

---

### 典型故事结构

古代架空穿越小说通常遵循以下五阶段结构：

| 阶段 | 章节占比 | 核心任务 | 典型事件类型 |
|------|---------|---------|-------------|
| **穿越适应期** | 10-15% | 稳定身份、了解环境、建立初步人设 | 普通事件为主 |
| **身份站稳期** | 15-20% | 解决眼前危机、获得初步资源和盟友 | 普通 + 转折 |
| **势力博弈期** | 30-35% | 卷入多方角力、扩大影响力 | 转折 + 伏笔 |
| **权谋高潮期** | 15-20% | 核心冲突爆发、关键抉择 | 高潮 + 转折 |
| **终局收束期** | 10-15% | 尘埃落定、伏笔回收、结局安排 | 结局为主 |

**注意**：这只是参考框架，实际设计应根据小说设定灵活调整。

---

### 故事线模式

#### 主线（通常 1 条）

主线围绕穿越者的核心目标展开，常见模式：

- **生存线**：穿越后身处险境（被休弃、被陷害、被发配），核心目标是活下去并翻身
- **复仇线**：继承原主的恩怨，为原主或自己复仇
- **权谋线**：主动参与朝堂/家族权力博弈，目标是获得权力或保护重要的人
- **改革线**：利用现代知识改变这个世界的某些不合理之处

#### 常见支线

| 支线类型 | 说明 | 与主线的关系 |
|---------|------|-------------|
| **感情线** | 与男/女主的感情发展 | 提供情感动力，可作为主线推进的催化剂 |
| **家族线** | 家族内部的嫡庶之争、财产争夺 | 穿越初期的主要冲突来源 |
| **朝堂线** | 派系斗争、官场沉浮 | 中后期的主要冲突舞台 |
| **江湖线** | 武林恩怨、侠客故事 | 增加冒险元素，扩大世界观 |
| **商业线** | 利用现代知识经商致富 | 为主角提供经济基础和社会影响力 |

#### 故事线数量建议

- 开局（穿越适应期）：1 主线 + 1-2 支线
- 中期（势力博弈期）：1 主线 + 3-4 支线
- 后期（高潮和终局）：收拢支线，聚焦主线

---

### 事件编排模式

#### 穿越适应期

- **开场事件**：穿越发生（可以是开篇直接穿越，也可以闪回）
- **身份危机**：发现自己的处境（被休弃的正妻、被陷害的庶女、被发配的官员等）
- **初次试探**：用现代知识小试牛刀（但要克制，不能一上来就碾压）
- 事件重要度：1-3，以铺垫和建立背景为主

#### 身份站稳期

- **第一个转折点**：初次危机（被刁难、被暗算），凭智慧化解
- **结盟事件**：获得第一个可靠盟友（丫鬟、好友、长辈）
- **小胜利**：初次展示能力，获得周围人的认可
- 事件重要度：2-4

#### 势力博弈期

- **卷入大局**：被动或主动卷入更大的权力博弈
- **多方角力**：各方势力轮番出手，局势复杂化
- **关键转折**：盟友背叛、敌人示弱、新势力介入
- **暗线推进**：伏笔密集埋设阶段
- 事件重要度：3-5

#### 权谋高潮期

- **总爆发**：所有矛盾集中爆发
- **核心抉择**：主角面临两难选择
- **伏笔回收**：前期埋设的线索在此阶段大规模回收
- 事件重要度：4-5

#### 终局收束期

- **尘埃落定**：核心冲突的最终解决
- **关系交代**：各角色的最终归宿
- **剩余伏笔回收**：确保所有伏笔闭环
- 事件重要度：3-5

---

### 伏笔策略

#### 常用伏笔类型

| 伏笔类型 | 说明 | 埋设时机 | 回收时机 |
|---------|------|---------|---------|
| **身份暗线** | 穿越身份的蛛丝马迹 | 穿越适应期 | 势力博弈期或高潮期 |
| **前世记忆** | 原主的记忆碎片暗示关键信息 | 早期 | 中后期 |
| **势力伏笔** | 看似无关紧要的人物实际背景深厚 | 身份站稳期 | 势力博弈期 |
| **物品线索** | 信物、信件、账册等实物 | 任意阶段 | 通常在关键转折时 |
| **关系暗线** | 角色之间隐藏的关系（如亲生关系、师徒关系） | 早期-中期 | 高潮期 |

#### 伏笔密度参考

- 穿越适应期：1-2 个伏笔（不宜过多，读者还在了解世界观）
- 身份站稳期：2-3 个伏笔
- 势力博弈期：3-5 个伏笔（高峰期，大量埋线）
- 权谋高潮期：以回收为主，可少量埋设新伏笔为续集铺垫
- 终局：全面回收，不遗留

---

### 常见错误

1. **穿越者全知全能**：上来就展示大量现代知识，缺乏合理解释和成长过程
2. **身份暴露缺乏后果**：穿越身份被发现后没有产生实质性影响
3. **支线喧宾夺主**：感情线或宫斗线占据过多篇幅，主线推进缓慢
4. **权谋逻辑漏洞**：朝堂/家族的权力博弈不符合古代社会的基本规则
5. **伏笔密度失衡**：前期埋设过多伏笔导致中期叙事臃肿，或后期仓促回收
6. **配角脸谱化**：反派只是为了坏而坏，缺乏合理的利益动机
7. **节奏失控**：势力博弈期拖沓，高潮期草率了事',
  '## "Plot Design" Domain Knowledge — Ancient Fictional Crossing Novels

The core of ancient fictional crossing novel plots is the **transmigrator''s survival and rise in a fictional ancient society using modern cognition**. Story tension comes from two dimensions: the clash between modern thinking and ancient rules, and the game between personal ability and hierarchical society.

The key to plot design: how the transmigrator gradually changes their situation using modern knowledge while maintaining their hidden identity, simultaneously dealing with pressure from family, court, and inner quarters.

---

### Typical Story Structure

Ancient fictional crossing novels typically follow a five-phase structure:

| Phase | Chapter Ratio | Core Task | Typical Event Types |
|-------|--------------|-----------|-------------------|
| **Adaptation Period** | 10-15% | Stabilize identity, understand environment, establish persona | Mostly normal events |
| **Identity Establishment** | 15-20% | Resolve immediate crises, gain initial resources and allies | Normal + turning points |
| **Power Struggle** | 30-35% | Engage in multi-party politics, expand influence | Turning points + foreshadowing |
| **Political Climax** | 15-20% | Core conflicts erupt, critical decisions | Climax + turning points |
| **Resolution** | 10-15% | Dust settles, foreshadows resolved, endings arranged | Mostly resolution events |

**Note**: This is a reference framework; actual design should be adjusted flexibly based on novel settings.

---

### Story Line Patterns

#### Main Line (typically 1)

The main line revolves around the transmigrator''s core objective:

- **Survival arc**: In danger after transmigration (divorced, framed, exiled), core goal is to survive and turn things around
- **Revenge arc**: Inherit the original host''s grudges, seek vengeance
- **Political arc**: Actively participate in court/family power struggles
- **Reform arc**: Use modern knowledge to change unreasonable aspects of the world

#### Common Branch Lines

| Branch Type | Description | Relationship to Main Line |
|------------|-------------|--------------------------|
| **Romance** | Romance development with male/female lead | Emotional motivation, catalyst for main plot |
| **Family** | Internal clan succession disputes | Major conflict source in early stages |
| **Court** | Factional struggles, official career | Major conflict arena in mid-to-late stages |
| **Martial arts** | Wuxia grudges, knight-errant stories | Adds adventure elements, expands worldview |
| **Commerce** | Using modern knowledge for business | Economic foundation and social influence for protagonist |

---

### Event Arrangement Patterns

#### Adaptation Period
- Opening event: transmigration occurs
- Identity crisis: discovering current situation
- First attempt: cautiously using modern knowledge
- Importance: 1-3

#### Identity Establishment
- First turning point: initial crisis resolved through wit
- Alliance event: gaining first reliable ally
- Small victory: first demonstration of ability
- Importance: 2-4

#### Power Struggle
- Drawn into larger politics
- Multi-party maneuvering
- Key turning points: ally betrayal, enemy feigning weakness
- Dense foreshadow planting phase
- Importance: 3-5

#### Political Climax
- All conflicts converge and erupt
- Core dilemma: protagonist faces impossible choice
- Mass foreshadow resolution
- Importance: 4-5

#### Resolution
- Final resolution of core conflicts
- Character endings arranged
- Remaining foreshadows resolved
- Importance: 3-5

---

### Foreshadow Strategy

#### Common Foreshadow Types

| Type | Description | Planting Time | Resolution Time |
|------|-------------|--------------|----------------|
| **Identity clues** | Hints about transmigration | Adaptation period | Power struggle or climax |
| **Past memories** | Original host''s memory fragments | Early | Mid-to-late |
| **Power clues** | Seemingly minor characters with deep backgrounds | Identity establishment | Power struggle |
| **Physical evidence** | Tokens, letters, ledgers | Any phase | Usually at key turning points |
| **Hidden relationships** | Secret connections between characters | Early-mid | Climax |

---

### Common Mistakes

1. **Omniscient transmigrator**: Displaying too much modern knowledge immediately without reasonable explanation
2. **Identity exposure without consequences**: No real impact when transmigration identity is discovered
3. **Branch lines overshadowing main plot**: Romance or court intrigue taking too much space
4. **Political logic holes**: Power struggles not following basic rules of ancient society
5. **Foreshadow density imbalance**: Too many early foreshadows causing bloated mid-section
6. **Flat side characters**: Villains being evil without reasonable motives
7. **Pacing issues**: Power struggle phase dragging, climax being rushed',

  (SELECT id FROM novel_creation_method WHERE name = '古代架空穿越小说' LIMIT 1),
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
