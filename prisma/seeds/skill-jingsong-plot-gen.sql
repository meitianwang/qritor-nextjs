-- 惊悚乐园小说「章节剧情设计」领域知识技能（Layer 3）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '惊悚乐园小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-jingsong-plot-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'jingsong-plot-gen',
  '「章节剧情设计」领域知识：为惊悚乐园小说提供副本制剧情设计指导，涵盖副本内三幕式结构、副本间休整节奏、主线与副本线交织、高智商主角的恐怖破解等核心设计模式',
  '"Chapter Plot Design" domain knowledge: plot design guidance for thriller park novels, covering three-act dungeon structure, inter-dungeon pacing, main plot and dungeon interweaving, and high-IQ protagonist horror-cracking patterns',
  '## 「章节剧情设计」领域知识 — 惊悚乐园小说

惊悚乐园类小说的剧情核心是**副本制循环叙事**。与传统灵异小说的单线推进不同，这类小说以"进入副本→探索/生存→通关→返回→再进入"为基本叙事循环，每个副本是一个独立的恐怖短篇，而所有副本串联起来构成一条逐步揭示系统真相的长篇主线。

剧情设计的关键挑战在于：每个副本既要是一个完整的恐怖故事（自洽的规则、有始有终的剧情），又要服务于整体主线（提供线索、推动角色成长、揭示世界观碎片）。节奏上，恐怖高潮和喘息期必须交替出现，避免"永远在恐怖中"导致读者脱敏。

---

### 一、惊悚乐园的典型故事结构：副本制 vs 主线交替推进

#### 1.1 宏观结构：副本-间章交替

惊悚乐园小说的宏观结构是一个**双层嵌套**：

```
[主线推进] → [副本1] → [间章/休整] → [副本2] → [间章/休整] → [副本3] → ... → [主线高潮]
```

| 结构单元 | 章节占比 | 核心功能 |
|---------|---------|---------|
| **副本** | 60-70% | 恐怖叙事核心，每个副本是一个完整的恐怖短篇 |
| **间章/休整** | 15-25% | 升级、社交、交易、主线推进、角色发展 |
| **主线纯推进章** | 10-15% | 系统真相、最终对决、全书高潮 |

#### 1.2 副本难度曲线

副本应呈现**阶梯式难度递增**，但不是线性的：

| 阶段 | 副本数量 | 难度等级 | 功能 |
|------|---------|---------|------|
| **新手期** | 1-2个 | D-C | 建立规则、展示系统、培养读者期待 |
| **成长期** | 3-5个 | C-B | 拓展恐怖类型、深化角色能力、副本间开始有关联 |
| **精英期** | 2-3个 | B-A | 高难度副本、重大牺牲、主线线索密集释放 |
| **终局期** | 1-2个 | S+ | 最终副本与主线合流，真相揭示 |

#### 1.3 副本类型多样性

避免副本类型重复，常见副本类型包括：

- **密室逃脱型**：封闭空间 + 限时 + 线索解谜
- **生存竞赛型**：多人淘汰 + 角色博弈 + 社会实验
- **都市传说型**：重构经典恐怖传说（午夜出租车、电梯游戏、笔仙）
- **规则怪谈型**：严格遵守/破解特定规则才能生存
- **剧情沉浸型**：进入一个有剧情的恐怖故事，需要扮演角色
- **Boss战型**：核心挑战是击败或逃脱一个强大的恐怖实体

---

### 二、副本内的三幕式结构

每个副本本身就是一个完整的恐怖短篇，遵循以下三幕结构：

#### 第一幕：探索期（副本章节的25-35%）

**核心任务**：建立副本世界观、发现初始规则、确认威胁存在

| 事件类型 | 说明 | 典型示例 |
|---------|------|---------|
| **传送/进入** | 主角被传送到副本场景，初始信息获取 | 醒来在废弃精神病院，系统只给了一句话："活到天亮" |
| **环境探索** | 探查副本地图，收集初始道具 | 发现精神病院的楼层分布、各病房的异常痕迹 |
| **第一次遭遇** | 首次接触副本中的恐怖实体/规则 | 走廊尽头看到一个影子，但没有攻击；墙上写着"不要回头" |
| **规则发现** | 主角通过观察/推理发现副本的核心规则 | 发现只有在灯灭时恐怖实体才会出现 |
| **队友互动** | 与其他玩家建立初步关系（合作/猜忌） | 五个玩家中有人异常冷静，疑似老玩家或内鬼 |

**探索期的关键**：信息要一点一点给，不能一开始就把所有规则讲清楚。主角和读者要一起在摸索中逐步理解这个副本。

#### 第二幕：发现真相期（副本章节的35-45%）

**核心任务**：深入理解规则、发现隐藏真相、遭遇重大危机

| 事件类型 | 说明 | 典型示例 |
|---------|------|---------|
| **规则深化** | 发现初始规则之下更深层的规则 | 不仅灯灭时实体出现，实体的行动模式还与某个特定的病历有关 |
| **真相碎片** | 发现副本背景故事的片段 | 精神病院三十年前的档案，一名医生对患者做了实验 |
| **重大牺牲** | 有角色死亡或受到不可逆伤害 | 一名不信规则的玩家触犯禁忌，被实体杀死 |
| **计谋与背叛** | 玩家间的信任崩溃和博弈 | 发现有玩家故意隐瞒了关键线索 |
| **主角推理** | 主角通过已有信息推理出关键结论 | 将病历、建筑布局、实体行动模式关联，推断出实体的身份 |

**发现真相期的关键**：这是"推理快感"的核心阶段。主角的智商在这里充分展现——不是靠蛮力，而是靠观察和推理一步步破解副本的秘密。

#### 第三幕：决战/逃脱期（副本章节的25-35%）

**核心任务**：执行通关方案、应对最终考验、完成副本

| 事件类型 | 说明 | 典型示例 |
|---------|------|---------|
| **方案确定** | 基于已知信息制定通关策略 | 利用实体的行为规律设置陷阱，在天亮前完成封印 |
| **计划执行** | 按步骤执行，但过程中有意外 | 陷阱启动，但实体的力量比预期强，计划需要临时调整 |
| **最终对抗** | 与Boss/核心恐怖的正面对决 | 主角在最后关头用推理出的弱点击败实体 |
| **代价与收获** | 通关的代价和获得的奖励 | 存活3人（死亡2人），获得A级评价和稀有道具 |

**决战期的关键**：节奏要极快——短句、快切、倒计时感。读者应该感觉在看一场高速追逐，而不是慢悠悠的决斗。

---

### 三、副本间章的节奏设计

间章（副本之间的休整期）是惊悚乐园小说的"呼吸空间"，看似平静但承担着关键功能：

| 间章内容 | 功能 | 注意事项 |
|---------|------|---------|
| **系统升级** | 使用副本奖励提升能力/装备 | 要有具体的选择和取舍，不能流水账 |
| **交易/商店** | 与其他玩家或系统商店交易道具 | 交易过程要有信息博弈（不知道对方道具的真实价值） |
| **社交/阵营** | 与其他玩家建立关系（盟友、对手、情报网） | 间章是发展角色关系的最佳时机 |
| **主线推进** | 发现系统的线索、回忆碎片、异常事件 | 不能太多，每个间章1-2个主线伏笔即可 |
| **日常与反差** | 回到现实世界的日常生活 | 现实越平静，与副本的恐怖反差越强 |

**间章的节奏原则**：
- 间章篇幅不宜超过副本篇幅的40%
- 连续两个副本之间最多一个间章
- 间章结尾要有"即将进入下一个副本"的紧迫感（倒计时、强制传送预告）

---

### 四、故事线模式

#### 主线：系统真相线

这是贯穿全书的核心线索——"这个游戏/系统到底是什么？为什么存在？谁创造了它？"

| 揭示阶段 | 对应时期 | 揭示内容 |
|---------|---------|---------|
| **表面理解** | 新手期 | "这是一个恐怖游戏，通关就能活" |
| **疑点出现** | 成长期 | "游戏的规则似乎有更深的目的" |
| **阵营浮现** | 精英期 | "不同势力对游戏有不同的理解和目标" |
| **真相揭示** | 终局期 | "游戏的真正目的、创造者的真正意图" |

#### 支线一：角色关系线

- 队友关系的建立和破裂
- 对手从敌对到尊重（或从合作到背叛）
- 重要NPC的命运（跨副本出现的NPC）

#### 支线二：能力成长线

- 主角的能力/技能/道具升级轨迹
- 关键能力获取的副本（某个副本的奖励改变了主角的战斗方式）
- 能力的代价（强大的能力往往需要付出代价）

#### 支线三：副本连锁线

- 某些副本之间存在隐藏关联（同一个恐怖实体在不同副本中出现）
- 前期副本的线索在后期副本中得到呼应
- "多个副本拼凑出一个更大的真相"的碎片化叙事

---

### 五、伏笔策略

#### 副本内伏笔

| 伏笔类型 | 说明 | 埋设位置 | 回收位置 |
|---------|------|---------|---------|
| **规则暗示** | 副本规则通过环境细节暗示 | 探索期 | 发现真相期 |
| **NPC行为** | NPC的异常言行暗示副本真相 | 探索期 | 发现真相期/决战期 |
| **物品线索** | 特定物品的存在暗示解题方向 | 探索期 | 决战期 |
| **死亡模式** | 其他玩家的死法暗示规则 | 探索期/发现真相期 | 决战期 |

#### 跨副本伏笔

- 某个副本中看到的一个符号，在三个副本后才知道是主线关键
- 一个NPC在不同副本中以不同身份出现
- 主角在早期副本获得的"无用道具"在后期副本成为通关关键

#### 主线伏笔

- 系统偶尔的异常行为（bug？还是有意为之？）
- 间章中的诡异事件（主角在现实中也遇到超自然现象）
- 其他顶级玩家透露的碎片信息

---

### 六、节奏把控技巧

#### 恐怖高潮 → 喘息 → 新副本开启的循环节奏

```
副本恐怖高潮（心跳加速） → 通关喘息（成就感） → 间章休整（日常温暖） → 新副本预告（紧迫感回升） → 进入新副本（恐怖重启）
```

**关键数值**：
- 副本内恐怖节奏：每3-5章一次小高潮，每个副本一次大高潮
- 喘息不能太长：间章如果超过3章，读者会失去紧迫感
- 恐怖要递进：后一个副本的恐怖程度要≥前一个副本

#### 单章内的节奏控制

- **恐怖章**：短段落、短句、大量感官描写、减少内心独白
- **推理章**：长段落、逻辑推导、主角内心独白、信息汇总
- **决战章**：极短句、快速切换视角、倒计时元素、行动描写为主

---

### 七、高智商主角的剧情设计

惊悚乐园类小说的灵魂是高智商主角。但"主角太聪明"会面临一个核心矛盾：**如果主角什么都能推理出来，恐怖感从何而来？**

#### 解决方案一：信息不完备

- 主角的推理能力再强，也需要信息作为原料
- 在信息不足时，主角的推理可以有多个可能方向，制造悬念
- 当新信息到来打破原有推理时，主角需要快速调整

#### 解决方案二：时间压力

- 主角来得及推理，但来不及执行
- "知道答案但做不到"比"不知道答案"更令人绝望

#### 解决方案三：超出认知的恐怖

- 主角可以理性分析可以解释的恐怖
- 但遇到真正超出理性范畴的存在时，再聪明也会恐惧
- 这种"理性之外的恐怖"正是惊悚乐园类小说的终极恐怖源

#### 解决方案四：社交困境

- 主角能看穿规则，但不能控制其他玩家的行为
- 愚蠢的队友、背叛的盟友、疯狂的对手——人心才是最大的变量

#### 主角"破解恐怖"的正确写法

- 不是让主角面对鬼怪毫无恐惧（那是无聊，不是聪明）
- 而是让主角在恐惧中依然能保持理性思考
- 主角的酷不在于"不怕"，而在于"怕但依然能做出正确判断"
- 适度的吐槽和黑色幽默可以展示主角的心理韧性

---

### 八、常见错误

1. **副本同质化**：连续多个副本都是同类型（全是密室逃脱），读者审美疲劳
2. **间章过长**：休整期过长，升级描写像RPG攻略，读者失去兴趣
3. **主角全知全能**：主角进入副本立刻看穿一切，毫无悬念
4. **恐怖感递减**：后期副本的恐怖感反而不如前期，因为主角太强
5. **主线断裂**：副本与副本之间完全没有关联，读者感受不到整体故事的推进
6. **配角工具人化**：其他玩家只是为了给主角铺路或送死，缺乏独立人格
7. **规则设定随意**：副本规则前后矛盾，或为了给主角开后门临时修改规则
8. **系统万能化**：系统什么都能给、什么都能解释，失去了悬念和探索的意义
9. **恐怖与幽默失衡**：吐槽太多变成搞笑文，或全程严肃变成纯恐怖文
10. **副本真相薄弱**：副本的背景故事（为什么这里会变成恐怖副本）缺乏情感深度',
  '## "Chapter Plot Design" Domain Knowledge — Thriller Park Novels

Thriller park novels revolve around **dungeon-based cyclical narrative**: enter dungeon → explore/survive → clear → return → re-enter. Each dungeon is a standalone horror short story, while all dungeons together form a long arc revealing the system''s truth.

### Macro Structure: Dungeon-Interlude Alternation

| Unit | Chapter Ratio | Function |
|------|--------------|----------|
| **Dungeons** | 60-70% | Core horror narrative, each a complete horror story |
| **Interludes** | 15-25% | Upgrades, socializing, trading, main plot advancement |
| **Main plot chapters** | 10-15% | System truth, final confrontation, book climax |

### Three-Act Dungeon Structure

**Act 1 — Exploration (25-35%)**: Establish dungeon world, discover initial rules, confirm threats. Key: reveal information gradually, not all at once.

**Act 2 — Truth Discovery (35-45%)**: Deep rule understanding, hidden backstory fragments, major sacrifices, protagonist deduction. This is where the protagonist''s intelligence shines — solving the dungeon through observation and logic.

**Act 3 — Final Battle/Escape (25-35%)**: Execute clearing strategy, handle unexpected complications, final confrontation. Pacing must be extremely fast — short sentences, rapid cuts, countdown tension.

### Interlude Design

Interludes handle: system upgrades, item trading, social/faction building, main plot foreshadowing, daily life contrast. Keep interludes under 40% of dungeon length. End each interlude with urgency (countdown to next dungeon).

### Story Lines

- **Main line**: System truth — what is this game, why does it exist, who created it?
- **Branch 1**: Character relationships — ally building, betrayal, rival respect
- **Branch 2**: Power growth — ability upgrades, key dungeon rewards, power costs
- **Branch 3**: Dungeon chain — hidden connections between dungeons, fragments assembling a bigger truth

### High-IQ Protagonist Design

Core challenge: if the protagonist can deduce everything, where does horror come from? Solutions: incomplete information (protagonist needs data to reason), time pressure (knows the answer but can''t execute in time), beyond-rational horror (truly incomprehensible entities), social dilemmas (can''t control other players'' behavior). The protagonist''s coolness isn''t "fearless" — it''s "afraid but still making correct judgments."

### Common Mistakes

1. Dungeon homogeneity (all same type)
2. Overlong interludes
3. Omniscient protagonist (no suspense)
4. Diminishing horror in later dungeons
5. Disconnected main plot between dungeons
6. Side characters as pure tools
7. Inconsistent dungeon rules
8. Overpowered system that explains everything',

  (SELECT id FROM novel_creation_method WHERE name = '惊悚乐园小说' LIMIT 1),
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
