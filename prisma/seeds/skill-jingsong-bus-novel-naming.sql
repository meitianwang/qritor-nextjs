-- 惊悚公车小说「小说命名」技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '惊悚公车小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-jingsong-bus-novel-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'jingsong-bus-novel-naming',
  '「小说命名」：为惊悚公车小说生成书名与章节标题，提供五种命名公式与20个高质量书名示例，覆盖交通意象与惊悚氛围的结合技法',
  '"Novel Naming": generate book titles and chapter titles for thriller bus novels, providing five naming formulas and 20 high-quality title examples, covering techniques for combining transportation imagery with thriller atmosphere',
  '## 「小说命名」 — 惊悚公车小说

惊悚公车小说的书名必须在一瞬间完成两件事：**让读者知道这是无限流惊悚游戏**，并且**让读者感受到「公车/旅途」这个核心意象**。最好的书名还能做到第三件事：在交通词汇里埋下死亡暗示，让日常意象和惊悚感产生碰撞。

公车书名的最高境界是**「读完就知道完了，但开始的时候什么都不知道」的双重诠释**——「末班车」是正常的最后一班公车，也是「最后一次机会」；「不到站」是公车未到终点，也是「无法抵达任何安全地」。

---

### 一、命名风格分析

**公车类惊悚小说的书名特色**：

| 命名维度 | 要求 | 禁忌 |
|---------|------|------|
| **交通/旅途意象** | 路线号/站名/车厢/车票/终点/司机等 | 纯武侠/修仙词汇；与交通无关的意象 |
| **惊悚/死亡暗示** | 含蓄暗示（「末班」「无终点」「不归」），不要直白 | 直接写"杀""死""血"（廉价感） |
| **规则感/游戏感** | 可以暗示存在规则/游戏/系统，不必明说 | 标题党词汇（「无敌」「签到」「系统」） |
| **悬念感** | 标题本身引出问题（「谁在开车」「终点是哪里」）| 标题直接给出答案 |

**公车命名的核心词汇库**：

- 交通词：末班/零号/终点/换乘/下车/上车/开往/路线/司机/售票/夜班/回程/绕路/不到站
- 数字暗示：13路/404路/0路/倒序编号（321路）/重复数字（111路）
- 时间词：子夜/午夜/黎明/永久/再也/最后
- 空间词：车厢/座位/行李架/终点站/无名站/末站/幽灵站
- 状态词：不归/迷失/困在/永不/再也/等不到/下不去

---

### 二、五种命名公式

#### 公式一：路线号型

**结构**：具体路线号（有暗示性的数字）+ 补充描述（可省略）

**数字暗示逻辑**：
- **13路**：西方不吉利数字，中文读者也有感应
- **404路**：HTTP 404（找不到/不存在）的直接引用，有互联网惊悚感
- **0路** 或 **000路**：起点即终点，或者编号不存在的路线
- **倒计时数字**：321路/210路——数字本身在倒计时
- **重复数字**：666路/111路——重复有咒语感
- **负数或分数**：-1路/0.5路——不可能存在的路线
- **与终点站相关的数字**：只有死过几个人才知道这个数字的含义

**示例**：
《404路公车》《零号终点》《末班13路》《321路》《没有名字的那条线》

---

#### 公式二：目的地型

**结构**：明确或模糊的目的地 + 旅途动词

**核心策略**：目的地要么无法到达（「无法抵达的地方」），要么到达后意味着死亡（「终点」），要么目的地本身就是谜（「不知道去哪里」）

**示例**：
《开往不存在的地方》《终点是另一个起点》《我们都不知道终点在哪里》《去往末日的公车》《到不了的那个站》《回家的路永远在公车上》

---

#### 公式三：乘客型

**结构**：乘客数量/身份/状态 + 时间/地点/动作

**核心策略**：乘客是公车小说的人物核心。乘客数量有死亡暗示（「十三个人上了车，只有一个人下去」），乘客身份有谜题感（「第零号乘客」「不记得自己是谁的那个人」）

**示例**：
《十三个乘客》《第零号座位》《车上有个不该上车的人》《乘客须知》《所有乘客请就座》《最后一名乘客》

---

#### 公式四：规则型

**结构**：公车规则/限制 + （可能的后果）

**核心策略**：把公车内的核心规则作为书名，让读者第一眼就感受到规则的存在和压迫感——规则意味着有人在控制这辆车

**示例**：
《不可以下车》《活着才能下车》《请勿移动》《保持安静直到终点》《禁止离席》《不能回头》

---

#### 公式五：反差型

**结构**：日常/温和词汇 + 惊悚场景（通过并置产生冲击）

**核心策略**：用最普通的公车词汇（旅途愉快/感谢乘坐/请勿吸烟）与惊悚内容产生极大落差——反差本身就是恐怖感的来源

**示例**：
《旅途愉快》《感谢您的乘坐》《下一站，不是终点》《到站了，请勿下车》《请系好安全带》《欢迎登车》

---

### 三、书名禁忌

**什么样的书名会让读者没有点击欲**：

| 禁忌类型 | 示例 | 问题所在 |
|---------|------|---------|
| **系统/签到词汇** | 《公车里的无限签到系统》《开局一辆公车》| 网络爽文感，与惊悚类型严重错位 |
| **过于直白的血腥** | 《杀人公车》《血染车厢》| 廉价恐怖片感，失去悬念 |
| **数字+规则堆砌** | 《无限游戏：100条公车规则》| 工具书感，没有情感共鸣 |
| **套路化开局句** | 《我在公车里变强了》《穿越到了惊悚公车》| 套路感，读者已经免疫 |
| **书名过长（8字以上）** | 《一辆不知道终点在哪里的公车和十三个不知道能否下车的乘客》 | 读不完，没有冲击感 |
| **无意象的纯概念** | 《惊悚》《公车游戏》《无限公车》 | 太泛化，记不住，没有视觉感 |
| **直接剧透结局** | 《最终只有主角存活》《那辆公车其实是陷阱》 | 消灭悬念 |

---

### 四、20个高质量书名示例（附分析）

**1. 《末班》**
分析：极简，两个字，双重含义（末班车/最后一班/末日最后一班）。不需要加"车"字，读者自动补全。留白极大。

**2. 《零路》**
分析：零路是不存在的路线，暗示这辆公车本不该存在。「零」字还有起点/空无/不存在的多重联想。

**3. 《活着下车》**
分析：把终极目标直接写在书名里——听起来理所当然，但「活着」两字说明下车并不是理所当然的事。条件式书名，张力极强。

**4. 《404路》**
分析：404是HTTP 404错误码（找不到/不存在），暗示这条路线不存在于正常世界。对互联网用户有极强的文化共鸣。

**5. 《不要下车》**
分析：祈使句，像是有人在警告，但不知道是谁在说、为什么说。「不要下车」意味着下车会死，但留在车上也未必安全。

**6. 《旅途愉快》**
分析：最高级的反差型书名。「旅途愉快」是公车/旅行的常见祝词，但在惊悚语境下变成了极度讽刺。读者一眼就明白「这段旅途不会愉快」。

**7. 《第13站》**
分析：13是不吉利数字，「第13站」暗示到达某个关键节点——可能是死亡关口，可能是规则变化点。站次的具体化给人「进度感」。

**8. 《请勿离席》**
分析：公共交通常见标语，但在惊悚语境下变成了恐怖命令——「你不能离开你的座位」。规则型书名的最好范例。

**9. 《夜班到底》**
分析：「夜班」是普通词汇，「到底」双关（到终点/到底发生了什么）。整个书名读起来像是一个没有答案的问题。

**10. 《开往无名站》**
分析：「无名站」是没有名字的终点，暗示这辆公车没有正常的目的地。「无名」还有「不知名的/不被人知道的」双重含义。

**11. 《同乘者》**
分析：「同乘者」是乘坐同一辆车的人，但在惊悚语境下，「同乘」暗示命运的绑定——死亡会一起降临。

**12. 《倒车》**
分析：「倒车」在交通中是正常词汇，但在惊悚语境中暗示「逆行/回不去/不该走的方向」。极短，有冲击感。

**13. 《欢迎登车》**
分析：最反差的欢迎词。「欢迎」是热情的，「登车」是开始一段旅途的，但在惊悚语境下，这句欢迎词意味着踏入了陷阱。

**14. 《乘客须知》**
分析：模仿官方文件的标题格式，但「须知」意味着有规则——读者会立刻好奇这些规则是什么。冷峻、正式、有压迫感。

**15. 《不返班次》**
分析：「不返」是不返回，「班次」是公车时刻表词汇——「不返班次」是永不返回的那趟车，或者乘上去就回不来的那趟。

**16. 《这辆车没有终点》**
分析：陈述句书名，直接说出恐怖的事实——公车没有终点意味着永远在路上，永远无法到达安全地带。八字临界，比七字更完整但不冗余。

**17. 《换乘须知》**
分析：「换乘」是从一辆车换到另一辆，暗示公车阶段结束后进入副本——「须知」说明有条件、有规则、有代价。

**18. 《停站》**
分析：极简，双字，有多重含义：停下的站/每一次停站都意味着什么/停在某个站无法离开。简洁到有诗意。

**19. 《后门》**
分析：「后门」是公车后门，但「后门」还有「秘密通道/法外手段」的含义。暗示公车里有隐藏规则或者秘密出路。

**20. 《最后一站之前》**
分析：时间性标题，在最后一站「之前」发生了什么——悬念从书名就开始了。「之前」说明故事在终点出现之前结束，读者知道终点存在但不知道内容。

---

### 五、章节标题规律

**公车类小说章节命名的三种模式**：

#### 模式一：「第N站」模式

**结构**：第X站（作为章节编号）+ 副标题（事件描述，可省略）

**示例**：
- 第一站
- 第一站：规则
- 第一站：有人知道什么
- 第二站（13分钟后）
- 第五站：不要站起来

**适用场景**：站次推进与情节高潮紧密对应的故事；每站都有明显的事件节点

**优势**：给读者强烈的「进度感」——知道故事在哪个位置，也知道终点在哪里；同时制造「还有X站」的倒计时压力

---

#### 模式二：事件命名模式

**结构**：用当章发生的核心事件作为章节标题

**示例**：
- 第一个死的人
- 老玩家的条件
- 联盟
- 有人在说谎
- 背叛
- 第七站之前发生的事
- 我们发现了司机在哪里

**适用场景**：情节密度高、每章都有核心冲突事件的故事

**优势**：标题本身就是悬念——「有人在说谎」让读者迫不及待想知道是谁

---

#### 模式三：时间线命名模式

**结构**：以车内时间作为章节标记

**示例**：
- 上车后第5分钟
- 第一站到第二站（22分钟）
- 上车后第47分钟：第一个死亡
- 接近第三站时
- 最后10分钟

**适用场景**：时间压缩感极强的故事；公车内时间流逝本身是叙事核心的故事

**优势**：让读者感受到时间的压力，每一分钟都在走，都在接近某个临界点

---

**对比分析：三种模式的效果差异**

| 模式 | 给读者的感受 | 适合的书风 |
|------|------------|-----------|
| 第N站 | 进度感+倒计时压力 | 节奏清晰、站次有明确叙事意义的故事 |
| 事件命名 | 悬念感+即时带入 | 情节密度高、事件驱动型的故事 |
| 时间线 | 紧迫感+物理压力 | 时间受限、高压缩型的故事 |

**混合模式**（最灵活）：主章用「第N站」，场景细分用「时间线」或「事件命名」：

```
第三站
  └─ 第三站到站时（上车后第41分钟）
  └─ 第二个规则
  └─ 陈静说她知道什么
  └─ 第三站到第四站（夜里11:07）
```

---

### 六、书名自检清单

在确定书名前，对照以下检查项：

- [ ] 书名包含「交通/旅途」意象（不需要很直白）
- [ ] 书名有「惊悚/死亡/规则」暗示（不能太直白）
- [ ] 书名不超过7个字（更短更好）
- [ ] 书名读一遍就能记住
- [ ] 书名本身是一个问题或悬念
- [ ] 书名没有使用禁忌词汇（系统/签到/无敌/穿越）
- [ ] 书名有双重解读的可能',
  '## "Novel Naming" — Thriller Bus Novel

A thriller bus novel''s title must accomplish two things in an instant: **let readers know this is an infinite-flow horror game**, and **let readers feel the core "bus/journey" imagery**. The best titles also accomplish a third thing: embed death implications within transportation vocabulary, creating a collision between everyday imagery and horror.

The highest achievement in bus novel naming is the **double interpretation of "you only understand after you finish, but know nothing at the start"** — "last run" is both the last scheduled bus and "last chance"; "never reaching the stop" is both a bus that hasn''t arrived and "unable to reach any safe place."

---

### 1. Naming Style Analysis

**Characteristics of bus horror novel titles**:

| Naming Dimension | Requirements | Prohibitions |
|-----------------|--------------|-------------|
| **Transportation/journey imagery** | Route numbers / stop names / compartments / tickets / terminus / driver | Pure wuxia/xianxia vocabulary; imagery unrelated to transportation |
| **Horror/death implication** | Subtle hints ("last run", "no terminus", "no return"), not blunt | Direct use of "kill", "die", "blood" (feels cheap) |
| **Rule/game sense** | Can hint at rules/game/system existing, no need to state explicitly | Clickbait vocabulary ("invincible", "sign-in", "system") |
| **Suspense** | Title itself raises a question | Title directly gives the answer |

---

### 2. Five Naming Formulas

**Formula 1: Route Number Type**
Structure: Specific route number (suggestive digits) + supplementary description (optional)

Number suggestion logic: 13 (unlucky); 404 (HTTP 404 / not found); 0 or 000 (start = end, or non-existent route); countdown digits (321); repeating digits (666, 111); negative or fractional (-1, 0.5)

Examples: "Bus Route 404", "Zero Terminal", "Last Run No. 13", "Route 321", "The Line Without a Name"

**Formula 2: Destination Type**
Structure: Clear or vague destination + journey verb
Strategy: Destination either unreachable, arrival means death, or destination is itself a mystery

Examples: "Bound for Nowhere", "The End Is Another Beginning", "None of Us Know Where the Terminus Is", "Bus to the End of the World"

**Formula 3: Passenger Type**
Structure: Passenger count / identity / state + time / location / action
Strategy: Passenger count implies deaths; passenger identity carries mystery

Examples: "Thirteen Passengers", "Seat Zero", "Someone on Board Who Shouldn''t Be There", "Passenger Notice", "All Passengers Please Be Seated"

**Formula 4: Rule Type**
Structure: Bus rule / restriction + (possible consequence)
Strategy: Make the core bus rule the title, letting readers immediately feel the existence and weight of rules

Examples: "No Disembarking", "Only the Living May Exit", "Do Not Move", "Stay Silent Until the Terminus", "No Standing", "Do Not Look Back"

**Formula 5: Contrast Type**
Structure: Everyday / gentle vocabulary + horror scenario (impact through juxtaposition)
Strategy: Use the most ordinary bus phrases (have a pleasant journey / thank you for riding / no smoking) in collision with horror content — the contrast itself is the source of horror

Examples: "Have a Pleasant Journey", "Thank You for Riding", "Next Stop, Not the Terminus", "Arrived — Please Do Not Exit", "Please Fasten Your Seatbelt", "Welcome Aboard"

---

### 3. Naming Prohibitions

What kinds of titles make readers unwilling to click:

| Prohibited Type | Example | Problem |
|----------------|---------|---------|
| System/sign-in vocabulary | "Infinite Sign-in System on the Bus" | Web novel feel, severely mismatched with horror genre |
| Overly explicit gore | "Murder Bus", "Blood-Soaked Compartment" | Cheap horror film feel, destroys suspense |
| Number + rule accumulation | "Infinite Game: 100 Bus Rules" | Textbook feel, no emotional resonance |
| Formulaic opening lines | "I Got Stronger on the Bus", "Transmigrated to a Horror Bus" | Clichéd, readers are immune |
| Title too long (8+ characters) | [overly wordy examples] | Can''t read in full, no impact |
| Pure concept without imagery | "Horror", "Bus Game", "Infinite Bus" | Too generic, forgettable, no visual quality |
| Directly spoiling the ending | "Only Protagonist Survives", "That Bus Was Actually a Trap" | Destroys suspense |

---

### 4. 20 High-Quality Title Examples (with Analysis)

1. **"Last Run"** — Minimalist, two characters, triple meaning (last scheduled run / last class / apocalyptic last run). No need to add "bus" — readers complete it automatically.

2. **"Route Zero"** — Route zero is a non-existent line, implying this bus should not exist. "Zero" also suggests origin / emptiness / non-existence.

3. **"Alive to Exit"** — Writes the ultimate goal directly into the title — sounds obvious, but the word "alive" signals that exiting is not at all obvious. Conditional title, extreme tension.

4. **"Bus 404"** — HTTP 404 error (not found / non-existent), hinting this route doesn''t exist in the normal world. Extremely strong cultural resonance for internet users.

5. **"Don''t Get Off"** — Imperative, as if someone is warning, but unknown who or why. Implies getting off means death, but staying on may not be safe either.

6. **"Have a Pleasant Journey"** — The ultimate contrast title. "Have a pleasant journey" is the standard bus/travel blessing, but in a horror context becomes extreme irony. Readers immediately understand "this journey will not be pleasant."

7. **"Stop 13"** — 13 is an unlucky number; "Stop 13" implies reaching a key node — possibly a death threshold, possibly a rule change point. Concreteness of a specific stop number creates a sense of "progress."

8. **"Please Remain Seated"** — Common public transit sign, but in a horror context becomes a terrifying command — "you cannot leave your seat." The best example of a rule-type title.

9. **"Night Run to the End"** — "Night run" is ordinary vocabulary; "to the end" is ambiguous (to the terminus / to the bottom of what happened). The whole title reads like an unanswered question.

10. **"Bound for Nameless Stop"** — "Nameless stop" is a terminus without a name, implying the bus has no normal destination. "Nameless" also means "unknown / unacknowledged."

11. **"Fellow Passengers"** — "Fellow passengers" are people riding the same vehicle, but in a horror context, "fellow" implies bound fates — death comes for all together.

12. **"Reverse"** — In transportation, "reverse" is ordinary vocabulary, but in a horror context implies "going the wrong way / can''t go back / a direction that shouldn''t be taken." Extremely short, impactful.

13. **"Welcome Aboard"** — The ultimate ironic welcome. "Welcome" is warm, "board" begins a journey, but in a horror context this welcome means stepping into a trap.

14. **"Passenger Notice"** — Mimics official document title format, but "notice" implies rules — readers immediately wonder what these rules are. Cold, formal, oppressive.

15. **"Non-Return Service"** — "Non-return" is never returning; "service" is bus schedule vocabulary — "non-return service" is the bus that never comes back, or the one you can''t return from after boarding.

16. **"This Bus Has No Terminus"** — Declarative title, directly stating the horrifying fact — a bus with no terminus means forever on the road, forever unable to reach safety.

17. **"Transfer Notice"** — "Transfer" is changing from one vehicle to another, implying the bus phase ends and enters the dungeon — "notice" signals conditions, rules, and costs.

18. **"Stop"** — Minimalist, two characters, multiple meanings: a stop where something stops / what each stop means / stopped at a stop unable to leave. Simple to the point of poetry.

19. **"Back Door"** — "Back door" is the bus''s rear door, but also means "secret passage / extralegal means." Implies hidden rules or a secret escape route inside the bus.

20. **"Before the Last Stop"** — Temporal title; what happened "before" the last stop — the mystery begins with the title. "Before" signals the story ends before the terminus is reached; readers know the terminus exists but not what it contains.

---

### 5. Chapter Title Patterns

**Mode 1: "Stop N" Pattern**
Structure: Stop X (as chapter number) + subtitle (event description, optional)
Examples: "First Stop", "First Stop: The Rules", "Second Stop (13 Minutes Later)", "Fifth Stop: Don''t Stand Up"
Advantages: Strong "progress sense" for readers — knowing where in the story they are, and where the terminus is; creates countdown pressure of "X stops remaining"

**Mode 2: Event Naming Pattern**
Structure: Use the chapter''s core event as the chapter title
Examples: "The First to Die", "The Veteran''s Terms", "Alliance", "Someone Is Lying", "Betrayal", "What Happened Before Stop Seven"
Advantages: Title itself is a mystery — "Someone Is Lying" makes readers desperate to know who

**Mode 3: Timeline Naming Pattern**
Structure: Use in-bus time as chapter marker
Examples: "5 Minutes After Boarding", "Stop One to Stop Two (22 Minutes)", "Minute 47 After Boarding: First Death", "Near Stop Three", "Last 10 Minutes"
Advantages: Makes readers feel time pressure; every minute is moving, approaching some critical threshold

**Comparison of Three Modes**:

| Mode | Reader''s Experience | Best for |
|------|---------------------|----------|
| Stop N | Progress sense + countdown pressure | Clear-paced stories where stops have explicit narrative significance |
| Event naming | Suspense + immediate immersion | Plot-dense, event-driven stories |
| Timeline | Urgency + physical pressure | Time-constrained, high-compression stories |

**Mixed mode** (most flexible): Main chapters use "Stop N," scene subdivisions use timeline or event naming.',
  (SELECT id FROM novel_creation_method WHERE name = '惊悚公车小说' LIMIT 1),
  1,
  90,
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
