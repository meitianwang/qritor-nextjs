-- 赛博朋克小说创作 - 情节设计技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-cyberpunk-plot-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'cyberpunk-plot-gen',
  '情节设计：为赛博朋克小说编排「委托→阴谋→代价」的故事结构，在高科技低生活的世界中构建个体的挣扎与揭示',
  'Plot design: structure the "job → conspiracy → cost" story arc for cyberpunk fiction, building individual struggle and revelation in a high-tech low-life world',
  '## 情节设计 — 赛博朋克小说

赛博朋克情节的基本单元是**委托（Job/Run）**——主角接受一个有限定目标的任务，在完成过程中发现任务背后有更大的真相，而揭露真相的代价往往比任务本身更高。这是赛博朋克从黑色电影继承来的「越挖越深」结构。

---

### 一、宏观故事弧——三阶段模型

```
第一阶段：委托（前30%）
目标：建立世界、建立主角处境、建立任务框架
特征：主角有明确的、表面上可完成的目标；威胁是局部性的；读者在积累世界感

第二阶段：深入（中间40%）
目标：任务出了问题，真相开始浮现
特征：雇主/目标/盟友中有人不可信；信息不完整，主角在做错误的决策；代价开始积累（人员伤亡、关系破裂、暴露自己）

第三阶段：揭示与代价（后30%）
目标：真相揭露，主角必须做出选择
特征：主角掌握了全部信息，但信息本身就是新的危险；「完成任务」的代价已经不可接受；结局往往是「赢了但失去了更多」
```

---

### 二、委托结构模式

赛博朋克的委托不是随机事件，而是世界运作方式的缩影：

#### 模式一：标准黑色电影结构

「简单任务，结果不简单」

步骤：
1. 主角接受表面简单的委托（找人/取物/保护某人）
2. 执行过程中发现任务有「另一面」（被委托的对象和委托人的关系复杂）
3. 主角被夹在中间，两边都不可信
4. 主角必须决定「为谁工作」，但每个选择都有代价

#### 模式二：信息战结构

「我找到了，但找到了之后呢」

适用场景：黑客为主的故事，信息本身是武器

步骤：
1. 主角获得/被雇佣获取某段数据/记忆/真相
2. 数据比预期重要得多，开始有人追杀主角
3. 主角必须决定：卖掉它？公开它？销毁它？各有代价

#### 模式三：逃脱结构

「已经没有退路」

适用场景：主角是被追杀的那个

步骤：
1. 主角已经在某种危险中（知道了不该知道的事，欠了不该欠的债）
2. 逃脱需要完成某个任务作为筹码或出口
3. 完成任务的过程中，处境进一步复杂

#### 模式四：渗透与叛变

「我从里面改变它，还是从里面逃出来」

适用场景：前企业雇员或双面人

步骤：
1. 主角在某个组织内部，有机会获取能改变局面的信息或资源
2. 忠于组织意味着继续作恶，离开意味着成为目标
3. 主角必须决定什么时候行动，行动的代价谁来承担

---

### 三、信息不对称——赛博朋克的核心张力机制

赛博朋克故事中，张力来自**主角比读者知道得少，同时比其他角色知道得也少**：

**信息梯度设计**：
```
读者知道的 ≈ 主角知道的（第一人称视角下）
主角知道的 < 雇主知道的
雇主知道的 < 更大的阴谋
```

**信息揭露的节奏**：
- 每次揭露一个真相，同时打开一个新问题
- 不要「信息倾倒」（一次性解释全部阴谋）
- 通过主角的错误决策（基于错误信息）让信息差产生实际后果

---

### 四、代价积累——让故事在情感上成立

赛博朋克故事中，代价比胜利更重要。好的情节应该让主角的每次胜利都伴随着代价：

**代价类型**：
- **关系代价**：为了完成任务，主角背叛或失去某个人
- **身份代价**：为了生存，主角做了改变自己定义的事
- **生理代价**：受伤、义体损坏、赛博精神病阈值逼近
- **信息代价**：获得了某个真相，但这个真相让一些事情变得无法弥补
- **结构代价**：主角的行动改变了势力格局，但不是朝着好的方向

---

### 五、结局模式

赛博朋克的结局通常不是「英雄战胜邪恶」，而是更复杂的东西：

| 结局类型 | 核心情绪 | 叙事意义 |
|---------|---------|---------|
| 惨胜 | 赢了，但失去了更多 | 「这场胜利的代价让我不确定值不值得」 |
| 虚假的胜利 | 表面上成功了，但系统没有改变 | 体制的韧性超过个人的反抗 |
| 变质的正义 | 打倒了一个坏人，但用了同样的方式 | 我们变成了我们反对的东西 |
| 个人逃脱 | 没有改变世界，但活下来了 | 生存本身就是一种胜利 |
| 开放结局 | 主角走向未知 | 结束是开始，或者什么都没有结束 |

---

### 六、伏笔种植原则

赛博朋克的伏笔应该通过「技术细节」和「信息碎片」植入，而不是神秘预兆：

- ✅ 「那个数据包比要求的大了17%，当时我没在意」（技术细节，后来揭示是隐藏数据）
- ✅ 「她的眼睛是那款老型号——三年前就停产了」（义体型号，揭示她的真实年龄/身份）
- ❌ 「当时我不知道，那一夜会改变一切」（剧透式预告，破坏张力）

---

### 七、常见错误

- ❌ 主角单枪匹马打倒了企业——赛博朋克的终局不是超级英雄式的胜利
- ❌ 每个场景都是行动场景——赛博朋克需要信息收集、等待、错误的冷静
- ❌ 真相是「企业坏，反抗者好」的简单道德判断
- ❌ 代价只是战斗中的伤亡，没有情感和身份层面的代价
- ❌ 主线推进太快——赛博朋克的阴谋需要时间沉淀',
  'Plot Design — Cyberpunk Fiction

Core narrative unit: the Job/Run — protagonist accepts a task with a defined goal, discovers a larger truth during execution, and the cost of that revelation exceeds the job itself. Inherited from film noir: "the deeper you dig, the worse it gets."

**Three-stage story arc**:
1. Commission (first 30%): establish world, protagonist situation, task framework — protagonist has a surface goal, threats are local, readers accumulate world-feel
2. Descent (middle 40%): job goes wrong, truth surfaces — one of employer/target/ally is untrustworthy; incomplete information leads to wrong decisions; costs accumulate (casualties, broken relationships, exposure)
3. Revelation and cost (final 30%): truth fully exposed, protagonist must choose — full information is itself a new danger; completing the original task is now morally untenable; ending is usually "won but lost more"

**Four job structure patterns**:
1. Standard noir: simple task → reveals two-sided relationship → protagonist trapped between untrustworthy parties → choice with cost
2. Information war: acquired data is more dangerous than expected → who to sell/reveal/destroy it to?
3. Escape structure: protagonist already in danger → needs to complete a task to create an exit
4. Infiltration/betrayal: insider with opportunity → loyalty means continuing harm, leaving means becoming a target

**Information asymmetry as tension mechanism**: protagonist knows less than the employer who knows less than the conspiracy. Each revelation answers one old question and opens a new one. Never dump all information at once — let wrong decisions (based on incomplete information) produce real consequences.

**Cost accumulation types**: relational (betrayal/loss of a person); identity (protagonist did something that redefined who they are); physical (injury, cyberpsychosis threshold); informational (truth that makes something irreparable); structural (actions changed the power landscape — for the worse).

**Ending types**: pyrrhic victory (won but lost more); false victory (individual succeeded, system unchanged); corrupted justice (defeated one evil using the same methods); personal escape (didn''t change the world, but survived — survival as victory); open ending (ending is a beginning, or nothing has ended).',
  (SELECT id FROM novel_creation_method WHERE name = '赛博朋克小说创作' LIMIT 1),
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
