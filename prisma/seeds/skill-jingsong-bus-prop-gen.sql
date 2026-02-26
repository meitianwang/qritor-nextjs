-- 惊悚公车小说「道具生成」技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '惊悚公车小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-jingsong-bus-prop-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'jingsong-bus-prop-gen',
  '「道具/技能」生成：为惊悚公车小说设计公车限定道具与技能，涵盖信息类、工具类、战斗类、技能类四大体系，强调公车封闭环境中道具代价的放大效应',
  '"Prop/Skill" generation: design bus-exclusive items and skills for thriller bus novels, covering four systems (information, utility, combat, skill), emphasizing the amplified cost of props in the sealed bus environment',
  '## 「道具/技能」生成 — 惊悚公车小说

惊悚公车小说的道具设计核心是**封闭环境 × 稀缺资源 × 代价放大**三重逻辑。公车是密封的、物理受限的、时间压缩的空间——任何道具的副作用在此环境中都被成倍放大。「无法移动三分钟」在普通副本里是小惩罚，在公车上可能意味着直接被淘汰。

公车道具的独特性在于它们的**获取场景**：不是系统商店，不是副本掉落，而是座位下的角落、前排乘客的背包、司机被遗忘的夹层——这些东西原本是什么？为什么会在这里？谁留下的？每件道具都自带悬念。

---

### 一、公车限定道具设计（最有特色的内容）

**什么是"公车限定"道具**：只能在公车阶段获得，下车后可能完全失效或转化为其他形态的特殊道具。它们的价值不在于数值强度，而在于它们是**第一轮生存的核心资源**。

**获取方式的叙事意义**：获取位置本身就是线索——座位下的物品暗示前任乘客发生了什么；司机夹层的东西暗示司机知道规则；老玩家留下的遗物暗示他们曾经生存过。

**8件经典公车限定道具**：

| 道具名 | 效果 | 获取位置 | 副作用 |
|--------|------|---------|--------|
| **末班车票根** | 提前知晓本轮公车规则的一条隐藏条款 | 前任乘客夹克内袋，褶皱泛黄 | 知道这条规则的代价是永远无法说出口——信息只能独自承受 |
| **换乘凭证** | 在一次淘汰中保护指定他人（自己替代受淘汰结果） | 座位夹缝深处，附着旧血迹 | 使用后主角当轮获得的所有道具归零 |
| **路线图（撕毁版）** | 拼接后可看到副本世界的地理梗概，知道下一个副本类型 | 车厢顶部行李架最里侧 | 知道太多的代价——下一副本的难度等级+1 |
| **车载急救箱（已开封）** | 恢复一名角色50%状态，或稳定一名濒死角色不在公车阶段死亡 | 驾驶室后方储物格 | 救助者本人扣除20%状态值，且急救箱内的注射器上有他人的指纹——这留下了一个悬念 |
| **乘车须知（背面）** | 正面是废话，背面用隐形墨水写着本轮额外规则 | 每个座位背后的透明袋，但只有特定座位号的才有背面内容 | 阅读后该乘客无法主动发起对话一小时（规则惩罚信息扩散） |
| **司机的保温杯** | 喝下后获得「感知异常」状态：能在30分钟内察觉其他乘客是否在说谎 | 驾驶室杯架，司机不在 | 同时获得「被感知」状态——其他人也能感觉到你在判断他们 |
| **前乘客的日记残页** | 3页随机日记，记载某人对一条规则的亲身测试结果（可能是错的） | 座位靠背网袋 | 日记中的信息有30%概率是误判，无法分辨真伪 |
| **紧急制动拉绳** | 全体乘客强制停止当前一切行动2分钟——包括正在进行的淘汰 | 车厢后门上方红色拉环 | 使用后系统宣布「干扰运营」，触发惩罚：随机一名使用者阵营的玩家降低一个状态等级 |

---

### 二、信息类道具的设计原则

**为什么信息是公车上最稀缺的资源**：

物资可以抢，力量可以对抗，但**信息不对称**才是公车阶段真正的生死线。老玩家知道规则而新玩家不知道——这本身就是一种不公平的权力结构。信息类道具打破这种结构，或者加剧这种结构。

**三类信息类道具的设计框架**：

**「知道规则的一角」型**
- 不给完整规则，只给规则的一个碎片
- 设计要点：碎片必须模糊，让玩家需要推理才能拼出全貌
- 经典形态：写着数字的纸条（代表站次/座位号/人数）、半截录音（有噪音干扰）、系统报错信息截图

**「其他乘客隐藏信息」型**
- 获取关于某个特定乘客的私密信息
- 设计要点：信息必须有双重价值——可以用来合作也可以用来要挟
- 经典形态：某人偷偷记的笔记、系统给该玩家的私信记录、该玩家的"身份卡"信息

**「规则漏洞提示」型**
- 暗示规则存在可利用的灰色地带
- 设计要点：漏洞不能太显眼，需要玩家冒险测试
- 经典形态："据说第三站之后规则会有变化"、"有人曾在规则宣布后的30秒内完成过交换"

---

### 三、道具稀有度设计

**「公车限定」稀有度的特殊性**：

公车限定道具有独特的价值悖论：**在公车上极其珍贵，下车后可能完全无用**。

| 稀有度 | 公车内价值 | 副本内价值 | 设计要点 |
|--------|-----------|-----------|---------|
| **公车限定（无效化型）** | 极高 | 零 | 下车时自动消失，或变成普通物品（末班票根→一张废纸） |
| **公车限定（转化型）** | 高 | 中 | 下车后功能改变，公车阶段的"情报"变成副本阶段的"地图" |
| **公车衍生（增强型）** | 中 | 高 | 公车阶段使用后解锁副本增强效果 |
| **跨场景通用型** | 中 | 中 | 功能在任何场景都一致，但公车场景使用代价更低 |

**如何设计有跨场景价值的公车道具**：
- 道具本身不消失，但功能必须在新环境下重新诠释（「乘车须知」→「副本规则手册碎片」）
- 道具记录的信息可以持续使用（日记残页里的规则知识在某些副本仍然适用）
- 人际关系是最有价值的"道具"——公车上建立的信任/债务关系会带入副本

---

### 四、技能的成长路线

**公车阶段技能的定位**：基础生存技能，不是战斗技能

公车上获得的技能通常是**观察系、信息系、社交系**，而非直接战斗力。这与副本里的技能形成互补：

**经典成长路线示例**：

**路线A：观察者成长线**
- 公车阶段：「读唇语·初级」（能判断其他乘客是否在对话中撒谎）
- 第1副本后：「行为分析」（能感知NPC的情绪状态）
- 第3副本后：「全局感知」（能感知副本中隐藏的机关/陷阱）
- 成长逻辑：从察人谎言→察NPC状态→察环境危机，能力边界持续扩大

**路线B：谈判者成长线**
- 公车阶段：「恐吓·初级」（一次让对方放弃当轮行动权）
- 第1副本后：「施压」（让NPC回答一个问题不得说谎）
- 第3副本后：「心理压制」（使敌对玩家在当局中无法使用主动技能）
- 成长逻辑：从物理威慑→信息获取→战略压制

**路线C：知识者成长线**
- 公车阶段：「规则推演」（每轮开始时有15%概率感知到一条隐藏规则）
- 第1副本后：「副本速读」（副本开始后3分钟内可额外获得一条规则提示）
- 第3副本后：「规则操控」（一局内可将一条规则的生效时间推迟一回合）

---

### 五、副作用设计原则

**为什么每件公车道具都必须有代价**：

公车是一个**零和博弈**的封闭环境。在这里，任何优势都会引发其他乘客的应激反应。道具的代价不仅是对个人的惩罚，更是**对博弈结构的扰动**：

**代价与公车环境的化学反应**：

| 代价类型 | 普通副本影响 | 公车密室影响 |
|---------|------------|------------|
| 「无法移动三分钟」 | 轻微不便 | 可能在别人争夺关键物品时完全无力 |
| 「无法主动开口说话」 | 影响信息交换 | 无法为自己辩护，可能被其他乘客误判出局 |
| 「被其他人感知到紧张情绪」 | 可能被针对 | 在公车博弈中几乎等于宣告「我有秘密」 |
| 「失去下一轮优先行动权」 | 被动应对 | 可能在关键淘汰回合中失去自保能力 |
| 「必须公开手中持有的一张牌」 | 暴露部分信息 | 可能导致其他乘客立刻重新评估你的价值 |

**副作用设计的三个层次**：
1. **个人代价**：直接削弱自己的能力或资源
2. **社交代价**：改变其他乘客对你的看法或行动
3. **规则代价**：触发系统的额外惩罚或改变当前博弈规则

最好的副作用是**第2层和第3层**——不仅惩罚使用者，还改变整个公车的博弈格局。

---

### 六、完整道具/技能设计示例（10件，覆盖所有类型）

**道具示例1：「死号座位」（公车限定·无效化型）**
- 类型：信息类道具
- 效果：主角坐在某个特定座位（历史死亡率100%的座位），系统在此局结束时透露该座位的「死亡模式」——即坐在这里的人通常怎么被淘汰
- 获取：主动选择坐在所有人都回避的那个座位
- 副作用：获得「标记」状态——其他乘客都知道你选择了那个座位，会对你产生不同解读（有人认为你在赌博，有人认为你知道某种规则）
- 跨场景价值：无，公车结束后信息失效

**道具示例2：「老司机的通话记录」（公车限定·转化型）**
- 类型：信息类道具
- 效果：司机手机的最后3通电话记录，内容经过系统加密，但能看出电话号码和通话时长——可推断司机在某个特定时间联系了某人
- 获取：驾驶室仪表台下方暗格，司机不知情
- 副作用：持有此道具的人在本轮内无法获得系统主动提供的任何信息（系统察觉到你在「调查」）
- 跨场景价值：中，通话记录转化为「副本世界某个NPC存在」的线索

**道具示例3：「止痛药（含量未知）」（公车限定·无效化型）**
- 类型：消耗类道具
- 效果：服用后压制「受伤」状态持续2小时，使受伤角色保持正常行动能力——看起来没有受伤
- 获取：急救箱内或乘客随身药盒
- 副作用：压制状态解除后，真实伤势翻倍显现；且在压制期间受到的伤害不会被感知，可能导致判断失误
- 跨场景价值：无，药效是公车阶段的化学物质

**道具示例4：「集体请愿书（空白）」（公车限定·转化型）**
- 类型：社交类道具
- 效果：集齐车内超过半数乘客签名后，可向系统提交一个「规则修改申请」，系统有40%概率接受（系统判定为集体意志）
- 获取：公文夹里预备好的空白表格，系统似乎提前放置的
- 副作用：所有签名者的身份对系统完全透明——系统会记录谁支持了这次「反抗」；未签名者在签名者眼中等于「立场已明」
- 跨场景价值：中，签名名单转化为副本阶段的「盟约记录」，约束相关玩家的背叛成本

**道具示例5：「终点站公告牌（残件）」（公车限定·转化型）**
- 类型：信息类道具
- 效果：残缺的铁牌，显示「终点站名称」的后半段文字——不完整，但下一副本的名字里会包含这几个字
- 获取：车厢与行李厢之间的夹缝，已经脱落的公告牌
- 副作用：持有者在当前公车阶段无法获得关于「目的地」的任何系统提示（系统认为你已经知道了）
- 跨场景价值：高，信息直接用于下一副本

**道具示例6：「紧急疏散手册（真实版）」（公车限定·无效化型）**
- 类型：信息类道具
- 效果：封面是普通安全手册，内页记载了一条真实规则："第7站之前，主动放弃座位的乘客将获得一个「豁免资格」，可在当局最终淘汰前选择一名他人替代自己"
- 获取：驾驶室仪表台夹层（需要主动探索驾驶室才能发现）
- 副作用：手册一旦被任何人看到内容，该规则立刻失效——信息的价值来自于垄断
- 跨场景价值：无

**道具示例7：「观光客的相机（最后几张照片）」（公车限定·无效化型）**
- 类型：线索类道具
- 效果：相机里留有前任乘客在某个未知地点拍摄的照片——背景中隐约有一个副本场景（但无法确定是哪个副本）；包含已死亡乘客的脸，可验证某些人的「新手」或「老玩家」身份
- 获取：行李架上的遗失物
- 副作用：持有相机的人会被其他乘客误认为认识「前任乘客」，可能遭到针对或被询问
- 跨场景价值：中（照片作为线索可能在后续副本验证）

**技能示例8：「危机感知·公车版」（公车限定技能·可进化）**
- 类型：被动感知技能
- 效果：主角能感知当前公车上「下一个最可能被淘汰的对象」是谁，但每次感知结果只有60%准确率
- 获取途径：在公车上目睹第一次淘汰后系统自动解锁
- 副作用：每次感知后主角会被感知目标短暂察觉（目标会有一种「被盯着」的不适感）
- 进化路线：「危机感知·副本版」（在任何副本中感知最近的致命危险源，准确率提升至80%）

**技能示例9：「规则背诵」（跨场景技能·公车开始）**
- 类型：主动信息技能
- 效果：主角可以在3秒内准确复述听到过的任何规则原文，且能指出他人对规则的引用是否准确
- 获取途径：连续两轮在规则宣布时保持完全专注（不与他人交谈）解锁
- 副作用：主角无法对规则的内容产生「主观解读」——只能复述，不能判断规则的意图
- 进化路线：「规则漏洞分析」（能指出规则中的逻辑漏洞，而不仅仅是准确复述）

**道具示例10：「换乘代币（已磨损）」（跨场景通用型）**
- 类型：消耗类战略道具
- 效果：每个副本开始时可用代币向系统申请一次「重新选择进入位置」的权利（影响副本开局形势）
- 获取：公车某个角落（每辆公车只会有1-2枚）
- 副作用：使用代币后系统会通知所有人「有人使用了代币」，但不说明谁使用——全局信息博弈扰动
- 跨场景价值：高，代币本身可以带入副本使用

---

### 与已有设定的联动

| 设定模块 | 对道具的影响 |
|---------|------------|
| **公车规则体系** | 规则漏洞→道具利用逻辑；规则惩罚类型→副作用设计方向 |
| **角色设定** | 老玩家携带道具的来历；新玩家与老玩家的道具信息差 |
| **剧情事件** | 关键淘汰节点→需要哪类道具；联盟形成→社交类道具的使用时机 |
| **副本设计** | 公车道具的跨场景价值→副本的前置条件 |

---

### 常见错误

1. **道具全是战斗型**：公车是信息博弈场，战斗类道具在密室里用处有限——信息类道具才是核心
2. **代价太轻**：副作用不影响公车博弈格局，等于没有代价
3. **所有道具都是公车限定无效化型**：缺少跨场景有价值的道具，玩家觉得公车阶段的努力是白费
4. **获取方式单一**：所有道具都在固定位置随机找到——没有利用「谁留下的？」的叙事悬念
5. **信息类道具给的信息太完整**：完整信息失去博弈价值，只有碎片信息才能驱动持续的信息交换
6. **技能没有成长路线**：公车阶段技能孤立存在，不与副本阶段衔接，失去长期价值',
  '## "Prop/Skill" Generation — Thriller Bus Novel

The core of prop design in thriller bus novels is the **sealed environment × scarce resources × amplified cost** triple logic. The bus is sealed, physically constrained, and time-compressed — any prop''s side effects are multiplied in this environment. "Unable to move for three minutes" is a minor penalty in a normal dungeon, but on the bus it may mean direct elimination.

The unique character of bus props lies in their **acquisition context**: not from a system shop or dungeon drop, but from under seats, a previous passenger''s bag, or the driver''s forgotten compartment. What were these things originally? Why are they here? Who left them? Every prop carries built-in mystery.

---

### 1. Bus-Exclusive Prop Design (Most Distinctive)

**What are "bus-exclusive" props**: Obtainable only during the bus phase, potentially becoming completely ineffective or transforming after getting off. Their value lies not in numeric strength but in being **the core resource for first-round survival**.

**The narrative meaning of acquisition location**: The location is itself a clue — items under seats hint at what happened to previous passengers; things in the driver''s compartment hint that the driver knows the rules; relics left by veteran players hint that they once survived here.

**8 Classic Bus-Exclusive Props**:

| Prop Name | Effect | Acquisition Location | Side Effect |
|-----------|--------|---------------------|-------------|
| **Last Bus Stub** | Learn one hidden clause of this round''s bus rules in advance | Inside jacket pocket of a previous passenger, yellowed and creased | Knowing this rule means you can never speak it aloud — the information must be borne alone |
| **Transfer Voucher** | Protect a designated person in one elimination (substitute your own outcome for theirs) | Deep in the seat crack, with old bloodstains | After use, all props protagonist gained this round are reset to zero |
| **Route Map (Torn)** | When pieced together, shows a rough geography of the dungeon world, revealing the next dungeon type | Deepest part of the overhead luggage rack | Knowing too much — next dungeon difficulty level +1 |
| **Onboard First Aid Kit (Opened)** | Restore 50% condition to one character, or stabilize a near-death character so they don''t die in the bus phase | Storage compartment behind the driver''s cab | Rescuer loses 20% of their own condition; the syringe inside bears someone else''s fingerprints — leaving an unresolved mystery |
| **Boarding Notice (Back Side)** | Front is generic text; back has additional round rules written in invisible ink | Clear pocket on the back of each seat, but only certain seat numbers have content on the back | After reading, that passenger cannot initiate dialogue for one hour (rule penalizing information spreading) |
| **Driver''s Thermos Cup** | Drinking it grants "Anomaly Perception" status: detect whether other passengers are lying in conversation for 30 minutes | Driver''s cup holder, driver absent | Also grants "Perceived" status — others can sense you are judging them |
| **Previous Passenger''s Diary Pages** | 3 random diary pages recording someone''s firsthand test of one rule (may be wrong) | Seat-back mesh pocket | 30% chance the information in the diary is a misinterpretation, indistinguishable from truth |
| **Emergency Brake Cord** | Forces all passengers to stop all current actions for 2 minutes — including an ongoing elimination | Red pull loop above the rear door | After use, system announces "operational interference": a randomly chosen ally-side player drops one condition level |

---

### 2. Information Props Design Principles

**Why information is the scarcest resource on the bus**:

Supplies can be grabbed, strength can be countered, but **information asymmetry** is the true life-or-death line in the bus phase. Veterans know the rules while newcomers don''t — this itself is an unjust power structure. Information props either break or amplify this structure.

**Three categories of information prop frameworks**:

**"Rule Fragment" Type**
- Does not give complete rules, only one fragment
- Design key: the fragment must be ambiguous, requiring inference to reconstruct the whole
- Classic forms: paper with numbers (representing stops/seat numbers/headcount), half-recording with noise interference, system error message screenshot

**"Hidden Player Information" Type**
- Obtain private information about a specific passenger
- Design key: the information must have dual value — usable for cooperation or blackmail
- Classic forms: someone''s secretly kept notes, system DM records to that player, that player''s "identity card" information

**"Rule Loophole Hint" Type**
- Suggests there is an exploitable gray area in the rules
- Design key: the loophole must not be obvious; players must risk testing it
- Classic forms: "Reportedly the rules change after the third stop," "Someone once completed an exchange within 30 seconds of rule announcement"

---

### 3. Rarity Design

**The special nature of "Bus-Exclusive" rarity**:

Bus-exclusive props have a unique value paradox: **extremely precious on the bus, potentially completely useless after getting off**.

| Rarity | In-Bus Value | In-Dungeon Value | Design Notes |
|--------|-------------|-----------------|--------------|
| **Bus-Exclusive (Nullified)** | Extremely high | Zero | Disappears when leaving, or becomes an ordinary object |
| **Bus-Exclusive (Transformed)** | High | Medium | Function changes after leaving bus |
| **Bus-Derived (Enhanced)** | Medium | High | Use during bus phase to unlock dungeon enhancement |
| **Cross-Scene Universal** | Medium | Medium | Consistent function in any scene |

**How to design bus props with cross-scene value**:
- The prop itself doesn''t disappear, but its function must be reinterpreted in the new environment
- Information recorded by the prop continues to be usable (diary page rule knowledge may apply in some dungeons)
- Interpersonal relationships are the most valuable "prop" — trust/debt established on the bus carries into dungeons

---

### 4. Skill Growth Routes

**Bus-phase skill positioning**: Basic survival skills, not combat skills

Skills obtained on the bus are typically **observation, information, and social** skills, not direct combat power. This complements dungeon skills:

**Route A — Observer Growth**
- Bus phase: "Lip Reading·Basic" (detect if other passengers are lying in conversation)
- Post-Dungeon 1: "Behavioral Analysis" (sense NPC emotional states)
- Post-Dungeon 3: "Global Perception" (sense hidden mechanisms/traps in dungeons)

**Route B — Negotiator Growth**
- Bus phase: "Intimidation·Basic" (once make opponent forfeit current round action)
- Post-Dungeon 1: "Pressure Application" (make NPC answer one question truthfully)
- Post-Dungeon 3: "Psychological Suppression" (hostile player cannot use active skills this round)

**Route C — Knowledge Growth**
- Bus phase: "Rule Inference" (15% chance to sense a hidden rule at the start of each round)
- Post-Dungeon 1: "Dungeon Speed-Read" (gain an extra rule hint within 3 minutes of dungeon start)
- Post-Dungeon 3: "Rule Manipulation" (delay one rule''s activation by one round per game)

---

### 5. Side Effect Design Principles

**Why every bus prop must have a cost**:

The bus is a **zero-sum, sealed environment**. Any advantage triggers reactive responses from other passengers. A prop''s cost is not only personal punishment but also **a disturbance to the game structure**:

| Cost Type | Ordinary Dungeon Impact | Bus Sealed Space Impact |
|-----------|------------------------|------------------------|
| "Unable to move for 3 minutes" | Minor inconvenience | May be completely helpless when others grab key items |
| "Cannot initiate speech" | Affects information exchange | Cannot defend yourself; may be misjudged and eliminated |
| "Others detect your nervousness" | May be targeted | In bus game, nearly announces "I have a secret" |
| "Lose priority action next round" | Passive response | May lose self-protection ability in key elimination rounds |
| "Must reveal one held card publicly" | Exposes partial information | May cause others to immediately reassess your value |

**Three tiers of side effect design**:
1. **Personal cost**: Directly weakens own ability or resources
2. **Social cost**: Changes how other passengers view or act toward you
3. **Rule cost**: Triggers additional system penalties or changes current game rules

---

### 6. Complete Prop/Skill Design Examples (10 pieces, all types)

**Prop 1: "Death Seat" (Bus-Exclusive·Nullified)**
- Type: Information prop
- Effect: Protagonist sits in a specific seat (100% historical death rate); system reveals this seat''s "death pattern" at the end of this round
- Acquisition: Actively choosing to sit in the seat everyone else avoids
- Side effect: Gains "Marked" status — all passengers know you chose that seat, generating varying interpretations

**Prop 2: "Old Driver''s Call Records" (Bus-Exclusive·Transformed)**
- Type: Information prop
- Effect: Last 3 call records on driver''s phone; encrypted by system but shows numbers and call duration
- Acquisition: Hidden compartment under driver''s cab console
- Side effect: Holder cannot receive any system-proactively-provided information this round

**Prop 3: "Painkiller (Unknown Dosage)" (Bus-Exclusive·Nullified)**
- Type: Consumable prop
- Effect: Suppresses "Injured" status for 2 hours, keeping an injured character at normal mobility
- Side effect: True injuries double when suppression lifts; damage received during suppression is unfelt

**Prop 4: "Collective Petition (Blank)" (Bus-Exclusive·Transformed)**
- Type: Social prop
- Effect: Collecting signatures from over half the bus passengers allows submitting a "rule modification request" to the system (40% acceptance rate)
- Side effect: All signers become fully transparent to the system; non-signers are seen as "position declared"

**Prop 5: "Terminal Station Sign (Fragment)" (Bus-Exclusive·Transformed)**
- Type: Information prop
- Effect: A cracked metal plate showing the second half of a terminal station name — incomplete, but the next dungeon''s name will contain these characters
- Side effect: Holder cannot receive any system prompts about "destination" in the current bus phase

**Prop 6: "Emergency Evacuation Manual (Real Version)" (Bus-Exclusive·Nullified)**
- Type: Information prop
- Effect: Cover is an ordinary safety manual; inside records one real rule: "Before the 7th stop, passengers who voluntarily give up their seat receive an exemption — before the final elimination, they may choose another person to take their place"
- Side effect: Once anyone sees the contents, the rule immediately becomes void — the value comes from monopoly

**Prop 7: "Tourist''s Camera (Last Few Photos)" (Bus-Exclusive·Nullified)**
- Type: Clue prop
- Effect: Camera contains photos taken by a previous passenger at an unknown location — backgrounds vaguely show a dungeon scene; contains faces of deceased passengers, potentially verifying "newcomer" or "veteran" status
- Side effect: Holder will be mistakenly assumed by others to know "previous passengers," may be targeted or questioned

**Skill 8: "Crisis Perception·Bus Edition" (Bus-Exclusive·Evolvable)**
- Type: Passive perception skill
- Effect: Protagonist can sense who is "most likely to be eliminated next" on the current bus, with 60% accuracy
- Acquisition: System automatically unlocks after witnessing the first elimination
- Side effect: After each perception, protagonist is briefly noticed by the perceived target
- Evolution: "Crisis Perception·Dungeon Edition" (sense nearest lethal danger source in any dungeon, accuracy 80%)

**Skill 9: "Rule Recitation" (Cross-Scene Skill·Begins on Bus)**
- Type: Active information skill
- Effect: Protagonist can accurately recite any rule verbatim within 3 seconds, and can identify when others misquote rules
- Acquisition: Unlock by maintaining complete focus during rule announcements for two consecutive rounds
- Side effect: Protagonist cannot form "subjective interpretations" of rules — can only recite, cannot infer intent
- Evolution: "Rule Loophole Analysis" (identify logical loopholes in rules, not just accurate recitation)

**Prop 10: "Transfer Token (Worn)" (Cross-Scene Universal)**
- Type: Consumable strategic prop
- Effect: At the start of each dungeon, use token to request "re-select entry position" (affects opening situation)
- Acquisition: A corner of the bus (only 1-2 per bus)
- Side effect: After using token, system notifies everyone "someone used a token" without saying who — global information game disrupted
- Cross-scene value: High, token can be carried into dungeons

---

### Common Errors

1. **All combat-type props**: The bus is an information game — combat props have limited use in a sealed space; information props are the core
2. **Side effects too light**: Side effects that don''t affect bus game dynamics amount to no cost at all
3. **All bus-exclusive nullified type**: Lacking props with cross-scene value makes players feel bus-phase effort is wasted
4. **Single acquisition method**: All props found randomly at fixed locations — wastes the narrative mystery of "who left this?"
5. **Information props give too complete information**: Complete information loses game value; only fragmentary information drives ongoing information exchange
6. **Skills have no growth route**: Bus-phase skills exist in isolation without dungeon-phase connection, losing long-term value',
  (SELECT id FROM novel_creation_method WHERE name = '惊悚公车小说' LIMIT 1),
  1,
  87,
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
