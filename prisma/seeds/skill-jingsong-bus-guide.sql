-- 惊悚公车小说创作总指南 Skill
-- novel_creation_method_id = 惊悚公车小说
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-jingsong-bus-guide.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'jingsong-bus-guide',
  '惊悚公车小说创作总指南：涵盖公车载体的类型特征与无限流的关系、封闭空间博弈的三大法则（信息管控/联盟形成/淘汰时机）、人物类型与叙事功能、五幕结构设计、以及常见写作陷阱规避',
  'Thriller bus novel guide: covers the genre characteristics of bus-carrier stories and their relationship to infinite-flow horror, the three laws of closed-space strategy (information control / alliance formation / elimination timing), character types and narrative functions, five-act structure design, and common writing pitfall avoidance',
  '## 惊悚公车小说创作总指南

本指南专为「惊悚公车小说」创作方法设计。该类型的核心是：一辆封闭的公车将陌生人强制聚集，在有限的空间与时间内完成第一轮生存淘汰，随后通关者进入更广阔的惊悚游戏世界。公车不只是第一关，它是整个故事的情感锚点和规则教学场。

---

### 一、类型特征：公车载体的独特之处

#### 1.1 与普通无限流的核心区别

「无限流」指主角反复进入不同副本/世界完成任务的类型。「惊悚公车」是无限流的一个亚类型，但公车载体赋予了它三个普通无限流不具备的特质：

| 特质 | 普通无限流 | 惊悚公车 |
|------|----------|---------|
| **进入方式** | 通常单独/小队进入 | 大量陌生人同时被迫上车 |
| **空间属性** | 副本空间可以很大 | 极度封闭——车厢就是全部 |
| **淘汰机制** | 通常在副本内逐渐死亡 | 第一轮即强制淘汰，存活者才有资格进入后续 |
| **规则认知** | 老玩家通常已有基础认知 | 大多数人对游戏规则一无所知 |
| **人际关系** | 通常以小队为单位 | 强制混合——新手老玩家同车，无法选择 |

**封闭性**：车厢是绝对封闭的。不能下车、不能求救、不能逃跑。这种封闭性是惊悚公车最大的戏剧来源——所有矛盾必须在这个空间内解决。

**强制淘汰**：不是「可能死亡」而是「必须有人死亡」。定额存活机制意味着即使没有人犯错，也会有人被淘汰。这创造了道德上的灰色地带：为了自己活下去，可以牺牲他人吗？

**新老玩家混乘**：老玩家掌握关键信息（规则、攻略、禁忌），新手对一切一无所知。信息差本身就是一种权力，围绕「谁知道什么」展开的博弈贯穿始终。

#### 1.2 公车封闭空间的叙事优势

封闭空间是戏剧张力的天然容器：

- **无处可逃**：所有角色必须面对同一个威胁，无法选择回避
- **强迫接触**：不同背景、不同性格的人被迫在极端压力下相互认识
- **观察便利**：读者和主角都能观察到所有人——秘密更难隐藏，谎言更容易被识破
- **时间压迫**：公车规则通常有时间节点，倒计时制造天然紧迫感

---

### 二、公车与无限流的关系：情感锚点与规则教学

#### 2.1 公车不只是第一关

很多作者犯的最大错误是把公车当成「序章」处理——快速交代规则，尽快进入「真正的游戏」。这是错误的。

公车是整本书的情感锚点，因为：

**读者与主角同步归零**：主角和读者在公车上一起从零理解游戏规则。每一个发现都是共同的冲击，每一次规则揭露都是共同的惊吓。这种同步体验是无限流最珍贵的阅读快感来源。

**公车奠定整本书的情感基调**：在公车上认识的人，死去的人，背叛的人，救过主角的人——这些记忆会跟随主角进入后续副本。公车的阴影永远不会消散。

**公车是规则世界的微缩模型**：公车规则是整个游戏系统规则的预告和缩影。读者通过公车理解「这个世界怎么运作」，为后续更复杂的副本做认知铺垫。

#### 2.2 如何让公车成为情感锚点

- 在公车上建立至少一段有意义的关系（羁绊、恩情或仇恨）
- 设计一个让主角「欠了债」的时刻——欠命、欠情、欠心理负担
- 让某个死亡对主角造成真实的心理创伤，而不仅是信息点
- 公车的结束不是解脱，而是某种意义上的失去

---

### 三、封闭空间博弈的三大法则

#### 法则一：信息管控

**谁知道什么，谁隐瞒什么，就是封闭空间的权力结构。**

信息在公车上分为三层：

| 信息层级 | 内容 | 掌握者 |
|---------|------|-------|
| **公开信息** | 系统广播的规则、当前存活人数 | 所有人 |
| **半公开信息** | 某些人通过观察/推理得知的隐藏规则 | 部分人 |
| **私密信息** | 个人身份、历史、隐藏能力、真实目的 | 个人 |

**写作要点**：
- 不要让信息平均分布。老玩家知道一些，新手通过观察发现一些，但没有人知道全部
- 信息的「泄露时机」是节奏的关键——什么时候揭露一个隐藏规则，直接影响紧张度
- 「知道但假装不知道」和「不知道但假装知道」是两种截然不同的角色行为，都可以制造强烈戏剧效果
- 主角的信息获取过程必须有代价：有人因为透露信息付出了代价，或者主角用什么换来了信息

#### 法则二：联盟形成

**为什么结盟，结盟的代价，以及联盟必然破裂的时刻。**

封闭空间中的联盟遵循一个残酷逻辑：联盟是临时的，因为存活名额有限。

联盟形成的几种动机：

| 动机 | 联盟类型 | 特点 |
|------|---------|------|
| **互补资源** | 强强联合 | 各有所需，但利益一致时间有限 |
| **同情/保护** | 强者+弱者 | 强者承担风险，弱者提供忠诚 |
| **共同目标** | 目标型联盟 | 针对共同威胁，威胁消失后联盟解体 |
| **信息交换** | 利益型联盟 | 最脆弱，随时可能被更好的条件替代 |
| **真实情感** | 情感型联盟 | 最强但最危险，感情会影响理性判断 |

**写作要点**：
- 联盟的建立要有过程，不能突然「我们组队吧」——要有试探、验证、妥协的步骤
- 联盟破裂的时刻必须令人心碎，不能只是「果然他背叛了，早就料到」
- 最好的背叛不是坏人做的，而是好人被逼到绝境时做的

#### 法则三：淘汰时机

**什么时候必须出手，是封闭空间博弈最核心的决策。**

淘汰时机的选择涉及三个维度：

**时机选择的几种类型**：
- **被动淘汰**：不是主动出手，而是袖手旁观，让规则淘汰他人
- **主动淘汰**：直接参与导致某人死亡
- **协助淘汰**：提供信息或机会，让他人完成淘汰
- **自我牺牲式淘汰**：主动吸引危险保护他人，接受自己被淘汰的命运

**何时必须出手**：
- 当某人的存在已经威胁到联盟安全时
- 当存活名额逼近，必须主动减少竞争者时
- 当规则要求必须有人被选择时（投票淘汰机制）

**写作要点**：
- 主角第一次不得不做出「让他人死亡」的选择，是整部小说的道德转折点，必须写得沉重
- 淘汰时机的选择应该有道德代价——主角事后必须面对这个决定
- 永远不要让淘汰显得轻松，即使被淘汰的人是反派

---

### 四、人物类型与叙事功能

公车上的人物类型决定了可以讲什么故事：

#### 4.1 新手（新人玩家）

**叙事功能**：读者的代入视角，规则的认知者，道德的守护者。

新手的价值在于「初心」——他们在游戏污染他们之前仍然相信人性、相信规则应该公平。主角如果是新手，读者会随着他一起经历从天真到觉醒的成长弧线。

**写作要点**：
- 新手的无知不应该让读者觉得愚蠢——要让读者理解「在那个情境下，这个反应是合理的」
- 新手的成长速度要合理，不能因为剧情需要就突然开窍
- 新手犯错的后果可以很严重，但犯错的原因必须是人性，不是蠢

#### 4.2 老玩家

**叙事功能**：信息的掌握者，规则的解读者，道德的挑战者。

老玩家的存在意义是展示「游戏是什么样的」——他们已经被游戏改造，已经习惯了牺牲他人。他们是主角的镜子：如果一直玩下去，你会变成这样。

老玩家分两种：
- **冷酷高效型**：已经失去对他人死亡的感受，纯粹理性地最大化自身存活率
- **隐性善意型**：外表冷酷，但内心仍有底线，甚至在关键时刻帮助新手

**写作要点**：
- 老玩家的信息透露必须有条件——不会无缘无故帮新手
- 老玩家的冷酷要有来源：是什么让他们变成这样？
- 不要把老玩家写成纯粹的反派或纯粹的导师

#### 4.3 伪装者

**叙事功能**：信息不对称的制造者，信任关系的颠覆者，隐藏规则的暗示者。

伪装者可以是：
- 假装新手的老玩家（隐藏信息优势）
- 假装普通乘客的「内鬼」（与系统/运营者有关联）
- 假装弱势的强力玩家（等待时机）

**写作要点**：
- 伪装者的揭露时机是叙事节奏的关键控制点
- 揭露前必须埋下伏笔，让读者回顾时觉得「早该发现」
- 不要把所有神秘感都堆到同一个伪装者身上

#### 4.4 司机

**叙事功能**：规则的化身，威胁的具象，游戏系统的界面。

司机的设定直接影响公车的恐怖基调——是人？是鬼？是机器？还是某种根本无法沟通的存在？

**写作要点**：
- 司机的「沉默」本身就是恐怖——不要让司机太快开口
- 司机与规则的关系要清晰：是执行者还是制定者？有没有裁量权？
- 关于司机的真相可以是贯穿全书的谜团之一

---

### 五、五幕结构

#### 第一幕：车门关上

**核心任务**：制造封闭感，建立人物关系基线，埋下所有将要爆发的矛盾种子。

**关键时刻**：车门关上的那一刻——所有人意识到「不对劲」。这个时刻必须写得准确：不是所有人同时恐慌，而是恐慌像病毒一样蔓延。

**需要完成的工作**：
- 介绍足够多的人物让读者记住（最多5-6个有名字和特点的角色）
- 建立初始的人际格局（谁跟谁搭话，谁单独坐着，谁表现异常）
- 给读者一个「可能有问题」的暗示，但不揭露真相

**节奏建议**：第一幕要慢——让读者在恐惧爆发前先建立对人物的情感连接。

#### 第二幕：规则揭晓

**核心任务**：第一个人死亡，淘汰机制正式激活，规则开始被揭示。

**关键时刻**：第一个人死亡的瞬间。这个死亡必须震撼——不是最弱的炮灰，最好是某个读者已经开始有感情的人。

**节奏陷阱**：不要一次性揭露所有规则。第二幕只揭露最基础的规则，足以让人物开始行动，但留下大量未解之谜。

**需要完成的工作**：
- 系统广播/通知正式出现，宣布游戏开始
- 基础规则确立（存活名额、淘汰方式）
- 人物开始分裂：恐慌派 vs 冷静派 vs 已知情者

#### 第三幕：博弈深水区

**核心任务**：联盟形成、信息博弈、隐藏规则逐步揭露，情节密度最高的部分。

**节奏特点**：这是全书节奏最复杂的部分——需要同时推进多条线：
- 主角线（主角如何适应并开始主动求存）
- 联盟线（联盟的建立、运作、内部矛盾）
- 规则线（新的隐藏规则被发现）
- 淘汰线（下一个被淘汰的是谁）

**关键设计**：在第三幕埋入一个「规则逻辑的漏洞或例外」——主角通过发现这个漏洞获得了不对称优势，但同时也引发了更大的危险。

**必须写到的场景**：
- 一次联盟内部的背叛或出卖
- 一次主角不得不做出道德选择的时刻
- 一个隐藏规则被发现的「原来如此」时刻

#### 第四幕：最后的博弈

**核心任务**：存活名额所剩无几，最后的清洗开始，所有隐藏的矛盾集中爆发。

**戏剧核心**：当只剩最后几个存活名额时，之前所有的联盟都会面临「是继续维持还是最后一搏」的考验。这是背叛最集中的幕。

**节奏建议**：第四幕节奏要快——场景之间的间隔变短，行动之间的逻辑链条压缩，每个决定都必须立即引发后果。

**必须解决的问题**：
- 伪装者的身份必须在这一幕揭露
- 主角的核心道德选择必须在这一幕完成
- 公车的「真相」（这一切为什么发生）给出第一层答案

#### 第五幕：下车

**核心任务**：通关者离开公车，进入新世界，但公车的阴影不能消散。

**关键设计**：下车不是胜利，是另一种开始。通关者进入游戏大厅/玩家社区的那一刻，他们看到的是其他公车的幸存者——规模更大的游戏正在等着他们。

**公车留下的阴影**：
- 至少一个在公车上死去的人物必须持续影响主角（梦魇、罪恶感、某种承诺）
- 主角带着公车上获得的某种改变进入新世界——他已经不是上车前的那个人了
- 如果主角获得了某个「不应该存活下来」的机会，这个债必须留到后来还

---

### 六、常见写法陷阱

#### 陷阱一：主角太强没有悬念

**表现**：主角从一开始就展现出超乎常人的冷静和能力，所有威胁对他来说都不是真正的威胁。

**危害**：读者失去代入感，「主角不会死」的预期消解了所有恐惧。

**解决方案**：
- 主角的强项要具体（逻辑推理强，但体力差；信息敏感，但人际关系处理笨拙）
- 至少设计2-3次主角确实处于危险中的时刻，而且读者应该无法确定他能不能活下来
- 主角的「优势」要付出代价——不能是「主角就是比别人强所以能活」

#### 陷阱二：规则漏洞太大读者出戏

**表现**：规则存在明显的逻辑漏洞，读者在阅读中自然产生「为什么不直接XXX」的疑问。

**危害**：规则是公车故事的基础。规则不严密，整个故事的逻辑就会崩塌。

**解决方案**：
- 为每一条规则设计至少一个「为什么不能绕过」的解释
- 在规则设计阶段就预设「玩家会尝试绕过规则」并给出系统的应对方式
- 规则的漏洞可以存在，但应该是「故意留下的」并在后续有叙事价值

#### 陷阱三：每个死亡都是工具人

**表现**：死亡人物在死前没有足够的个性化呈现，读者对他们的死亡没有任何情感响应。

**危害**：当死亡变成纯粹的事件而非人物命运，读者会失去对游戏真实性的感受——游戏变成了机关，人变成了棋子。

**解决方案**：
- 每一个将要死亡的人物，在死亡前必须有至少一个让读者记住他的时刻（一句话、一个动作、一个选择）
- 第一个死亡的人物必须让读者感到惋惜
- 不要把死亡写得太「整洁」——死亡应该是混乱的、不体面的、令人不安的

---

### 生成要点总结

- 公车故事的核心是「从零到觉醒」的认知弧线——主角和读者一起学会这个世界的规则
- 封闭空间的戏剧张力来源于「无处可逃」+「信息不对称」+「存活名额有限」三者共振
- 五幕结构中，第三幕（博弈深水区）是全书最难写也最重要的部分，节奏控制是关键
- 每个人物类型都有其叙事功能，不要让任何一类人物沦为背景板
- 公车结束后，它的影响应该持续存在于整部小说中',
  '## Thriller Bus Novel — Complete Creation Guide

This guide is designed for the "Thriller Bus Novel" creation method. The core of this genre is: a sealed bus forcibly gathers strangers, completing the first round of survival elimination within a confined space and time, after which survivors enter a broader world of horror games. The bus is not just the first checkpoint — it is the emotional anchor of the entire story and the tutorial for understanding the game''s rules.

---

### I. Genre Characteristics: What Makes the Bus Carrier Unique

#### 1.1 Core Differences from Standard Infinite-Flow

"Infinite-flow" refers to stories where the protagonist repeatedly enters different instances/worlds to complete missions. The "thriller bus" is a sub-genre of infinite-flow, but the bus carrier gives it three qualities that standard infinite-flow lacks:

| Quality | Standard Infinite-Flow | Thriller Bus |
|---------|----------------------|-------------|
| **Entry method** | Usually enters alone or in a squad | Large numbers of strangers forced aboard simultaneously |
| **Spatial properties** | Instance space can be vast | Extreme confinement — the carriage is everything |
| **Elimination mechanism** | Deaths usually occur gradually within instances | Forced elimination in the very first round; only survivors qualify for what follows |
| **Rule awareness** | Veterans usually have baseline knowledge | Most people know nothing about game rules |
| **Social dynamics** | Usually organized in squads | Forced mixing — new and veteran players share the same bus with no choice |

**Confinement**: The carriage is absolutely sealed. You cannot get off, cannot call for help, cannot escape. This confinement is the greatest source of dramatic tension in the thriller bus — all conflicts must be resolved within this space.

**Forced elimination**: Not "might die" but "someone must die." A fixed-quota survival mechanism means even if no one makes a mistake, someone will be eliminated. This creates moral gray zones: is it acceptable to sacrifice others to survive?

**Mixed new and veteran players**: Veterans hold key information (rules, strategies, taboos), while newcomers know nothing. Information asymmetry is itself a form of power, and the game of "who knows what" runs throughout.

#### 1.2 The Narrative Advantages of Confined Space

Confined space is a natural container for dramatic tension:

- **No escape**: All characters must face the same threat; avoidance is not an option
- **Forced contact**: People of different backgrounds and personalities are forced to know each other under extreme pressure
- **Observation convenience**: Readers and the protagonist can observe everyone — secrets are harder to keep, lies easier to detect
- **Time pressure**: Bus rules usually have time nodes; countdowns create natural urgency

---

### II. The Bus and Infinite-Flow: Emotional Anchor and Rule Tutorial

#### 2.1 The Bus Is Not Just the First Level

The biggest mistake many writers make is treating the bus as a "prologue" — quickly explaining the rules and rushing into the "real game." This is wrong.

The bus is the emotional anchor of the entire book because:

**Reader and protagonist reset together**: The protagonist and reader learn the game rules from zero together on the bus. Every discovery is a shared shock; every rule revelation is a shared scare. This synchronized experience is the most precious source of reading pleasure in infinite-flow fiction.

**The bus sets the emotional tone for the entire book**: People met on the bus, people who died, people who betrayed, people who saved the protagonist — these memories follow the protagonist into every subsequent instance. The shadow of the bus never fades.

**The bus is a microcosm of the rule world**: Bus rules are a preview and miniature version of the entire game system''s rules. Readers understand "how this world works" through the bus, laying cognitive groundwork for the more complex instances that follow.

#### 2.2 How to Make the Bus an Emotional Anchor

- Establish at least one meaningful relationship on the bus (a bond, a debt owed, or a hatred formed)
- Design a moment where the protagonist is "indebted" — owes a life, a favor, or a psychological burden
- Let a death cause real psychological trauma to the protagonist, not merely serve as an information point
- The end of the bus is not relief — it is a kind of loss

---

### III. The Three Laws of Closed-Space Strategy

#### Law One: Information Control

**Who knows what, who hides what — this is the power structure of confined space.**

Information on the bus exists in three layers:

| Information Layer | Content | Holder |
|------------------|---------|--------|
| **Public information** | System broadcasts, rules, current survivor count | Everyone |
| **Semi-public information** | Hidden rules discovered through observation/deduction | Some people |
| **Private information** | Personal identity, history, hidden abilities, true motives | Individuals |

**Writing tips**:
- Do not distribute information evenly. Veterans know some things, newcomers discover some through observation, but nobody knows everything
- The "timing of revelation" for information is the key to pacing — when to unveil a hidden rule directly affects tension
- "Knowing but pretending not to know" and "not knowing but pretending to know" are two very different character behaviors, both capable of creating intense drama
- The protagonist''s process of obtaining information must have a cost: someone paid a price for leaking information, or the protagonist exchanged something for it

#### Law Two: Alliance Formation

**Why alliances form, the price of alliances, and the inevitable moment of their collapse.**

Alliances in confined space follow a cruel logic: alliances are temporary, because survival slots are limited.

Types of alliance motivation:

| Motivation | Alliance Type | Characteristics |
|-----------|---------------|----------------|
| **Complementary resources** | Strong-strong alliance | Each needs what the other has, but aligned interests are time-limited |
| **Sympathy / protection** | Strong + weak | Strong bears risk; weak offers loyalty |
| **Shared goal** | Goal-based alliance | Formed against a common threat; dissolves when threat is gone |
| **Information exchange** | Interest-based alliance | Most fragile; can be replaced by a better offer at any time |
| **Genuine emotion** | Emotional alliance | Strongest but most dangerous — emotions affect rational judgment |

**Writing tips**:
- Alliance formation must have a process — not a sudden "let''s team up" — there must be testing, verification, and compromise
- The moment an alliance breaks must be heartbreaking, not merely "of course he betrayed us, I saw it coming"
- The best betrayals are not committed by villains but by good people pushed to their absolute limits

#### Law Three: Elimination Timing

**When you must act is the most critical decision in closed-space strategy.**

The choice of elimination timing involves three dimensions:

**Types of elimination timing choices**:
- **Passive elimination**: Not acting directly, but standing by while rules eliminate others
- **Active elimination**: Directly participating in causing someone''s death
- **Assisted elimination**: Providing information or opportunity for others to complete the elimination
- **Self-sacrificial elimination**: Actively drawing danger to protect others, accepting one''s own elimination

**When you must act**:
- When someone''s presence has already threatened the alliance''s safety
- When survival slots are dwindling and you must actively reduce competition
- When rules require someone to be chosen (voting elimination mechanism)

**Writing tips**:
- The first time the protagonist has no choice but to make a decision that leads to another person''s death is the moral turning point of the entire novel — it must be written with weight
- The choice of elimination timing should carry a moral cost — the protagonist must face this decision afterward
- Never make elimination feel easy, even when the eliminated person is a villain

---

### IV. Character Types and Narrative Functions

Character types on the bus determine what stories can be told:

#### 4.1 Newcomers (New Players)

**Narrative function**: Reader''s identification vehicle, rule discoverers, moral guardians.

A newcomer''s value lies in "original intention" — before the game corrupts them, they still believe in human nature and that rules should be fair. If the protagonist is a newcomer, readers will experience alongside them the growth arc from innocence to awakening.

**Writing tips**:
- Newcomer ignorance should not make readers feel the character is stupid — the reader must understand "in that situation, this reaction is reasonable"
- The newcomer''s growth rate must be realistic — they cannot suddenly become enlightened just because the plot needs it
- The consequences of a newcomer''s mistake can be severe, but the cause must be human nature, not stupidity

#### 4.2 Veteran Players

**Narrative function**: Information holders, rule interpreters, moral challengers.

The purpose of veterans is to show "what the game is really like" — they have already been reshaped by the game, already accustomed to sacrificing others. They are the protagonist''s mirror: if you keep playing, you''ll become this.

Veterans come in two types:
- **Cold efficiency type**: Has lost the capacity to feel others'' deaths; purely rationally maximizes survival odds
- **Hidden goodwill type**: Outwardly cold, but still has a bottom line; may even help newcomers at a critical moment

**Writing tips**:
- Veterans'' information sharing must come with conditions — they won''t help newcomers for nothing
- Veterans'' coldness must have an origin: what turned them into this?
- Do not write veterans as purely villainous or purely mentor figures

#### 4.3 Impostors

**Narrative function**: Creators of information asymmetry, subverters of trust, hints toward hidden rules.

Impostors can be:
- Veterans pretending to be newcomers (hiding information advantage)
- Ordinary-looking "insiders" with connections to the system/operators
- Powerful players feigning weakness (waiting for the right moment)

**Writing tips**:
- The timing of an impostor''s reveal is a critical pacing control point
- Foreshadowing must be planted before the reveal, so readers feel "I should have caught this" in retrospect
- Do not stack all the mystery onto a single impostor

#### 4.4 The Driver

**Narrative function**: Embodiment of rules, concrete form of threat, interface to the game system.

The driver''s setting directly affects the horror tone of the bus — is it a person? A ghost? A machine? Something that cannot be communicated with at all?

**Writing tips**:
- The driver''s "silence" is itself terrifying — do not let the driver speak too soon
- The driver''s relationship to rules must be clear: executor or creator? Is there any discretion?
- The truth about the driver can serve as one of the book''s overarching mysteries

---

### V. Five-Act Structure

#### Act One: The Doors Close

**Core mission**: Create a sense of confinement, establish the baseline of character relationships, plant seeds of every conflict that will later explode.

**Key moment**: The moment the bus doors close — everyone realizes something is wrong. This moment must be written precisely: not everyone panicking simultaneously, but panic spreading like a virus.

**Work to complete**:
- Introduce enough characters for readers to remember (at most 5-6 with names and distinct traits)
- Establish the initial social landscape (who talks to whom, who sits alone, who behaves strangely)
- Give readers a hint that "something may be wrong," without revealing the truth

**Pacing suggestion**: Act One should be slow — let readers form emotional connections with characters before fear erupts.

#### Act Two: Rules Revealed

**Core mission**: The first person dies, the elimination mechanism officially activates, rules begin to be unveiled.

**Key moment**: The instant the first person dies. This death must be shocking — not the weakest throwaway character, but ideally someone readers have already started to care about.

**Pacing trap**: Do not reveal all rules at once. Act Two only reveals the most basic rules — enough for characters to begin acting, but leaving plenty unexplained.

**Work to complete**:
- System broadcast/notification appears formally, announcing the game''s start
- Basic rules established (survival quota, elimination method)
- Characters begin to split: panic faction vs. calm faction vs. those already informed

#### Act Three: Deep Strategy

**Core mission**: Alliances form, information games unfold, hidden rules gradually emerge — the highest-density portion of the plot.

**Pacing characteristics**: This is the most complex section in terms of pacing — multiple storylines must advance simultaneously:
- Protagonist line (how the protagonist adapts and begins actively seeking survival)
- Alliance line (alliance formation, operation, internal conflicts)
- Rules line (new hidden rules are discovered)
- Elimination line (who will be eliminated next)

**Key design**: In Act Three, plant a "loophole or exception in the rule logic" — the protagonist gains an asymmetric advantage by discovering it, but this also triggers greater danger.

**Scenes that must appear**:
- One instance of betrayal or sell-out within an alliance
- One moment where the protagonist has no choice but to make a moral decision
- One "aha moment" when a hidden rule is discovered

#### Act Four: The Final Game

**Core mission**: Survival slots are nearly exhausted, the final purge begins, all hidden conflicts erupt simultaneously.

**Dramatic core**: When only the last few survival slots remain, every previous alliance faces the test of "maintain or make a final move." This is the act where betrayal is most concentrated.

**Pacing suggestion**: Act Four must be fast — intervals between scenes shorten, the logical chain between actions compresses, and every decision must immediately produce consequences.

**Problems that must be resolved**:
- The impostor''s identity must be revealed in this act
- The protagonist''s core moral choice must be completed in this act
- The "truth" of the bus (why all of this is happening) yields its first layer of answers

#### Act Five: Getting Off

**Core mission**: Survivors leave the bus, enter a new world — but the shadow of the bus must not dissipate.

**Key design**: Getting off is not victory — it is another kind of beginning. The moment survivors enter the game lobby / player community, what they see are survivors from other buses — a larger game awaits them.

**The shadow the bus leaves**:
- At least one character who died on the bus must continue to affect the protagonist (nightmares, guilt, a promise made)
- The protagonist carries some change from the bus into the new world — they are no longer who they were when they boarded
- If the protagonist was given an "shouldn''t have survived" opportunity on the bus, that debt must be repaid later

---

### VI. Common Writing Pitfalls

#### Pitfall One: Protagonist Too Strong, No Suspense

**Symptoms**: The protagonist displays extraordinary calm and ability from the start; no threat poses a real danger.

**Harm**: Readers lose identification; the expectation that "the protagonist won''t die" dissolves all fear.

**Solutions**:
- The protagonist''s strengths must be specific (strong logical reasoning, but poor physical condition; information-sensitive, but socially clumsy)
- Design at least 2-3 moments where the protagonist is genuinely in danger, and readers cannot be certain they will survive
- The protagonist''s "advantages" must come with costs — it cannot simply be "the protagonist is better than everyone so they survive"

#### Pitfall Two: Rule Loopholes Too Large, Readers Disengage

**Symptoms**: Rules have obvious logical loopholes; readers naturally think "why not just do X" while reading.

**Harm**: Rules are the foundation of the bus story. If the rules aren''t airtight, the entire story''s logic collapses.

**Solutions**:
- Design at least one explanation for "why this cannot be bypassed" for each rule
- During rule design, anticipate "players will try to circumvent rules" and provide system responses
- Loopholes can exist, but they should be "intentional" and carry narrative value later

#### Pitfall Three: Every Death Is a Throwaway

**Symptoms**: Characters who die did not receive enough individualized portrayal before death; readers feel no emotional response.

**Harm**: When death becomes purely an event rather than a character''s fate, readers lose their sense of the game''s reality — the game becomes a mechanism, people become pawns.

**Solutions**:
- Every character who will die must have at least one moment before death that readers will remember (one line, one action, one choice)
- The first death must make readers feel regret
- Do not write deaths too "cleanly" — death should be chaotic, undignified, and unsettling

---

### Summary of Generation Notes

- The core of bus fiction is the cognitive arc of "from zero to awakening" — protagonist and reader learn the rules of this world together
- The dramatic tension of confined space comes from the resonance of three forces: "no escape" + "information asymmetry" + "limited survival quota"
- In the five-act structure, Act Three (deep strategy) is the hardest and most important part of the book to write; pacing control is key
- Each character type has its narrative function — do not let any type become background scenery
- After the bus ends, its influence should persist throughout the entire novel',
  (SELECT id FROM novel_creation_method WHERE name = '惊悚公车小说' LIMIT 1),
  1,
  80,
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
