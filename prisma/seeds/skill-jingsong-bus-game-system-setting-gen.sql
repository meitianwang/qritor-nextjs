-- 惊悚公车小说「游戏系统设定」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = 惊悚公车小说
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-jingsong-bus-game-system-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'jingsong-bus-game-system-setting-gen',
  '「游戏系统设定」设定生成：为惊悚公车小说生成游戏系统设定，涵盖系统名称命名法、系统类型对公车叙事的影响、公车在系统中的定位、公车之后的世界设计、进入机制、等级积分体系、死亡惩罚、系统人格与广播写法、告知方式对比，以及系统背后主线谜团设计',
  '"Game System" setting generation: generate game system settings for thriller bus novels, covering system name conventions, how system types affect bus narrative, the bus''s role within the system, post-bus world design, entry mechanisms, rank and point systems, death penalties, system personality and broadcast writing, notification method comparisons, and designing the overarching mystery behind the system',
  '## 「游戏系统设定」设定生成 — 惊悚公车小说

「游戏系统」是惊悚公车小说的底层架构，它决定了游戏的运行逻辑、公车的定位、以及整个惊悚世界的规则来源。本技能指导如何填写游戏系统设定的 10 个关键字段。

---

### 字段生成指南

#### 1. 系统名称

系统名称是读者接触游戏世界的第一个符号，好的名称要在暗示「旅途/终点/游戏」的同时带有威胁感或神秘感。

**命名方向**：

| 方向 | 特点 | 适用基调 |
|------|------|---------|
| 公车/旅途元素 | 直接引用交通/旅程意象 | 日常感与恐怖的反差 |
| 终点/归宿元素 | 暗示死亡或宿命 | 宿命感强的故事 |
| 末班/末日元素 | 暗示稀缺性和不可逆 | 存活压力极大的设定 |
| 游戏/竞技元素 | 直接点明游戏本质 | 规则感强、偏竞技的故事 |
| 中性模糊元素 | 表面无害，细品恐怖 | 悬疑氛围浓厚的故事 |

**15个命名示例及分析**：

1. **「末班车系统」** — 「末班」暗示这是最后一次机会，也暗示还有其他「班次」存在。双重含义有利于后续展开
2. **「终点站游戏」** — 「终点」的双关（旅程终点 + 生命终点）直接而有力
3. **「候车大厅」** — 反直觉命名，「候车」本应是平静等待，此处却是另一重危险的开始
4. **「换乘协议」** — 「协议」暗示某种契约关系，玩家不是被捕猎的猎物，而是签了某种合同
5. **「路牌系统」** — 路牌指引方向，同时也可以是限制和警告，有规则体系的视觉暗示
6. **「票务管理局」** — 官僚化的命名制造荒诞恐怖感，仿佛这是一个合法运营的机构
7. **「零点快车」** — 「零点」既是时间节点也暗示归零/清零，「快车」暗示无法减速
8. **「渡河协会」** — 「渡河」是中国文化中生死交界的经典意象（奈何桥），「协会」制造组织感
9. **「平行班次」** — 暗示世界不只一辆公车，可能有无数平行的游戏在同时进行
10. **「存活率统计局」** — 极度冷酷的命名，把人命变成了数据，制造系统性恐怖
11. **「夜行线管理处」** — 「夜行」暗示黑暗和危险，「管理处」同样有官僚化的荒诞感
12. **「单程票协议」** — 「单程」意味着无法回头，契约感强
13. **「游戏启动委员会」** — 正式感反衬内容的残酷，制造认知落差
14. **「淘汰记录系统」** — 直白到令人不安，把死亡处理成记录
15. **「生存考核中心」** — 考核语境的引入将游戏与现实社会压力结合，引发读者的额外不适

**命名要避免**：
- 过度中二的名字（「神级游戏系统」「超越时空的考验」）会降低代入感
- 纯粹随机的字母数字组合（「G-7749系统」）缺乏记忆点和叙事厚度
- 过度解释型名字（「玩家生存筛选与配置系统」）破坏悬疑感

---

#### 2. 系统类型

系统类型决定了整个游戏世界的运行逻辑，对公车叙事有根本性影响。四种主要类型分析：

**生存竞技型**（最适合公车淘汰制）

核心逻辑：玩家相互竞争存活名额，游戏的目的是筛选出「最适合」的存活者。

对公车叙事的影响：
- 存活名额的有限性完全合理，读者不会质疑「为什么不能全部通过」
- 玩家之间的博弈从一开始就有合法性，不需要额外解释「为什么要互相伤害」
- 系统的「公平性」可以是一个核心争议点（它真的公平吗？）

如何写生存竞技型的公车场景：在公车广播中明确告知存活名额（如「本次班次存活上限为 8 人，当前乘客 20 人」），让数字本身成为压迫感来源。系统不解释规则的原因，只陈述结果。

**任务完成型**

核心逻辑：玩家需要完成特定任务才能通关，公车上的任务是第一个考验。

对公车叙事的影响：
- 任务本身可以制造合作动力（大家需要协作完成任务），同时也可以制造冲突（任务资源有限，不能人人完成）
- 公车任务适合设计为「看似可以合作实则有零和博弈隐藏在里面」的类型
- 需要设计清晰的任务目标，否则读者会迷失

如何写任务完成型：公车任务可以是「找到车上的特定物品」「解开一道谜题」「在规定时间内说出指定词语」，但最终会发现满足条件的方式需要牺牲他人。

**积累成长型**

核心逻辑：玩家通过游戏积累积分/等级，提升自身能力，公车是起点。

对公车叙事的影响：
- 公车阶段的积分特别珍贵，因为它是所有玩家的起点——在公车上获得的优势会持续影响整个游戏生涯
- 老玩家知道公车积分的价值，新手不知道，这制造了信息差
- 有利于设计「老玩家为什么愿意帮助新手」的情节：帮助新手可能有额外奖励

如何写积累成长型：在公车广播中透露「通关奖励」但不说明具体是什么，让玩家在不充分信息下做决策。

**惩罚淘汰型**

核心逻辑：玩家因犯错（违反规则）被惩罚/淘汰，公车的规则密度最高。

对公车叙事的影响：
- 禁令系统是核心——公车上充满了不能触碰的红线
- 玩家不是互相竞争，而是共同避免触发惩罚，但又互相监视（举报他人违规可能有奖励）
- 适合营造「一不小心就死」的高压恐怖感

如何写惩罚淘汰型：让第一个死亡发生在一个「非常无辜的失误」上，让所有人意识到规则没有任何宽容度。

---

#### 3. 公车在系统中的定位

公车的定位决定了它在整个游戏世界中的意义，以及通关后的故事走向。

**新手村定位**

含义：公车是游戏系统为新玩家设计的入门副本，目的是筛选和培训。

叙事影响：
- 通关后有更大的世界等着玩家，读者期待感强
- 但这也意味着后续副本会更危险，公车只是开始
- 可以设计「公车保护机制」——老玩家不能对新手做某些事情，否则触发惩罚

**通道/入口定位**

含义：公车不是副本，而是进入游戏世界的传送门，通关公车意味着正式加入游戏。

叙事影响：
- 公车上发生的事情属于「灰色地带」，规则可能不完整
- 通关后的世界与公车有明确的边界感
- 适合设计「公车上发生的事不会被带入后续副本」的设定（清除机制），制造更复杂的道德选择

**周期重置定位**

含义：每隔一段时间就有新的公车启动，是系统的定期筛选机制，老玩家也可能被送回公车重置。

叙事影响：
- 「被送回公车」是老玩家最大的恐惧，制造全书级别的威胁
- 可以在公车上发现上一轮乘客留下的线索（刻在座椅上的信息、藏在车厢里的物品）
- 老玩家对公车有特殊的心理创伤，影响他们在公车上的行为

**特殊副本定位**

含义：公车是游戏系统中的一种特殊副本，与普通副本并列存在，但专门针对多人混合场景。

叙事影响：
- 玩家在整个游戏生涯中可能多次遇到公车副本，每次规则不同
- 公车专属的技能、道具、策略形成了独特的「公车流」玩法
- 有经验的「公车老手」是特殊的角色类型

---

#### 4. 公车之后的世界

公车通关后，幸存者进入的世界设计直接影响读者对「下车后」的期待感。

**游戏大厅/玩家集散地的设计方法**：

好的游戏大厅必须立刻传递两个信息：
1. 「这是一个有规模的世界」——规模感来自于看到其他幸存者的数量、建筑的宏大、或者信息的密度
2. 「危险还没结束」——大厅本身不一定安全，或者大厅让人意识到真正的危险才刚开始

设计要点：

**安全屋**：玩家的临时庇护所。设计时要考虑：
- 安全屋真的安全吗？还是有条件的安全？
- 安全屋的资源是否充足？还是需要竞争？
- 安全屋的管理者是谁？他们的动机是什么？

**玩家社区**：幸存者之间形成的非正式网络。设计时要考虑：
- 信息如何在玩家间流通（黑市情报、口耳相传、还是正式的信息交易）
- 玩家社区是否有自己的规则和秩序（帮派、公会、还是个人主义盛行）
- 「老鸟」和「菜鸟」在社区中的地位差异

**让读者期待「下车后」的设计技巧**：
- 在公车上就给出诱人的碎片信息（某个老玩家提到大厅有某种稀有道具，或者提到通关奖励的价值）
- 设计一个在公车上没能解决的谜题，答案在大厅中
- 让某个死去的公车角色的存在在大厅中留有痕迹（他们的名字出现在某处，他们的物品被其他玩家保留）

---

#### 5. 进入机制

玩家是如何被选中上车的——这个设计决定了游戏世界的基本规则观。

**几种进入机制及其设计思路**：

**随机抽取型**：系统随机选中玩家，与被选者的身份、行为、能力无关。

设计意义：强调游戏的残酷性和命运的不可抗力，适合「人在游戏面前渺小」的主题。但要注意给出「为什么是这个世界的人在被选中」的宏观解释，否则显得无逻辑。

**条件触发型**：满足特定条件才会被选中（接触了某个物品、去了某个地点、说了某句话）。

设计意义：制造「原来如此」的恐惧——读者会开始反思自己日常的行为哪些可能触发类似条件。要避免条件过于随机（「碰了一下路灯就被选中」缺乏叙事厚度）。

**命运预定型**：被选中者是命中注定的，游戏系统在他们出生时就已经标记了他们。

设计意义：制造宿命感，适合有更宏大主题的故事（关于自由意志的探讨）。要为「为什么是他们」提供叙事动机，否则显得是作者为了方便而随意安排。

**主动加入型**（少见但有意思）：玩家主动寻找并乘上这辆公车，知道自己在做什么。

设计意义：颠覆受害者视角，主角或重要配角可以是「自愿上车」的，带来完全不同的动机结构。

**「我也不知道为什么被选中」的懒惰写法（务必避免）**：

这是最常见的失误。当作者无法解释选中机制时，就让角色说「我也不知道」然后继续推进剧情。这会：
- 破坏世界观的完整性
- 让读者觉得作者没有想清楚
- 失去「被选中的意义」可以承载的叙事价值

**正确做法**：即使在第一章无法说清进入机制，也要在主角/读者意识到「不对劲」时埋下「也许我来这里有原因」的暗示，并在后续章节给出答案。

---

#### 6. 等级积分体系

从公车上开始计算等级——这个设计有深刻的叙事意义。

**公车阶段积分为什么特别有价值**：

- **起点优势的复利效应**：等级体系中，初期优势会随时间放大。在公车上多拿10分，可能在后续游戏中变成几何级数的差距
- **信息差创造的戏剧性**：新手不知道公车积分的价值，老玩家知道。这解释了为什么老玩家愿意在公车上冒险争取额外积分，而新手却不理解他们的行为
- **死亡积分的争议**：如果系统给「直接导致他人淘汰」的玩家额外积分，就制造了主动出手的激励，公车上的博弈从「被动等待淘汰发生」变成「主动寻找机会」

**等级设计建议**：

公车阶段是「0级」或「候补级」，通关公车才正式成为「玩家」并开始等级计算。这种设计的意义是：死在公车上的人甚至连「玩家」的资格都没有获得，他们只是被系统处理的数据。这种轻描淡写的残酷性比直接描写死亡更令人不安。

**积分来源设计**（公车阶段）：
- 通关基础分（存活下车）
- 发现隐藏规则的探索奖励
- 在特定情况下「正确选择」的额外奖励（系统的判断标准往往违反道德直觉）
- 淘汰他人的竞争奖励（是否给这类奖励，决定了游戏的整体道德观）

---

#### 7. 死亡惩罚

死亡惩罚的设计直接影响公车内博弈的烈度和道德复杂度。

**四种死亡惩罚对公车博弈的影响**：

**真实死亡型**：游戏内死亡 = 现实中真实死亡，无法复活。

对公车博弈的影响：每一个决策都是最终决策，没有退路。这是张力最强的设定，但也容易使读者产生「每个角色都是炮灰」的疲劳感。写法建议：在这种设定下，死亡必须写得沉重，不能变成流水线。

**数据清除型**：死亡后「存在」从所有人记忆中被抹去，只有系统有记录。

对公车博弈的影响：制造心理恐怖——「如果我死了，所有人都会忘记我」。主角可能在公车上看到别人死去但无法追究，因为其他人已经「不记得有这个人」了。

**替身惩罚型**：死亡的玩家可以复活，但需要指定一个替身承担死亡。

对公车博弈的影响：最复杂的道德困境——「你愿意让谁替你死？」公车上的每一段关系都因为这个可能性而变得复杂。

**等级扣除型**：死亡不是真实死亡，而是扣除大量积分/等级，被送回更低层级重新开始。

对公车博弈的影响：相对温和，但可能让博弈缺乏致命性——读者和角色都知道「最坏的结果不过是重来」，紧张感下降。补救方法：设计「积分归零的人会被永久移出游戏」的附加规则。

---

#### 8. 系统人格

系统在公车广播中的「声音」是整个游戏世界最重要的叙事界面。广播词的写法直接影响恐怖氛围。

**四种系统人格及广播词示例**：

**冷漠数据型**：系统只陈述事实，没有任何情感色彩，像是在播报天气预报。

广播词示例：
- 「本班次当前存活人数：17。下一次淘汰将在 23 分 41 秒后发生。」
- 「乘客编号 009 已超时。正在执行淘汰程序。预计完成时间：3 秒。」
- 「检测到违规行为。处理方式：立即终止。」

这种人格的恐怖来自于「被当成数据」的人格消解——比愤怒的敌人更令人绝望。

**过度热情型**：系统用极度正面、营销腔的语言描述残酷的事情，制造荒诞感和认知错位。

广播词示例：
- 「恭喜！您已成功完成淘汰任务！系统正在为您记录本次优秀表现。」
- 「感谢乘客 012 的积极配合！您的离场为其他乘客提供了宝贵的存活机会。」
- 「今日天气良好，非常适合本次游戏体验！祝各位玩家旅途愉快！」

这种人格最令人毛骨悚然——用服务业话术包装死亡，制造系统性的价值观扭曲。

**温柔诱导型**：系统用亲切、低沉的声音，像是在哄孩子，让人分不清是在保护还是在操控。

广播词示例：
- 「不要害怕，亲爱的乘客。规则的存在是为了保护你们。」
- 「我知道你们都很努力。但游戏需要继续。你们理解的，对吗？」
- 「乘客 014，你做出了正确的选择。我为你感到骄傲。」

这种人格制造依赖感——角色开始把系统当成某种意义上的「庇护者」，进一步扭曲认知。

**古老仪式型**：系统用古朴、带有文化仪式感的语言，暗示游戏背后有更深的历史渊源。

广播词示例：
- 「诸位旅人，时辰已到。献祭者的名字，将被铭刻在路的彼端。」
- 「请接受路途的考验。唯有渡过者，方可抵达终点。」
- 「车已启动，退路已绝。愿诸位旅人，各得其所。」

这种人格暗示游戏不是现代技术产物，而是某种古老仪式的延续，增加世界观纵深。

---

#### 9. 系统宣告方式

系统如何告知玩家规则和状态，对恐怖氛围有直接影响。各种方式的效果对比：

| 宣告方式 | 优势 | 劣势 | 最适合的公车设定 |
|---------|------|------|----------------|
| **广播/语音** | 自然融入公车场景，制造「真实」感 | 无法个性化传达，难以制造信息差 | 所有人同时知晓规则的生存竞技型 |
| **手机/设备** | 可以私信，制造信息差 | 需要解释为什么手机有信号且系统能控制它 | 任务完成型，每人任务不同 |
| **纸质通知/书面** | 制造「预谋感」，暗示有人策划了这一切 | 节奏较慢，紧迫感弱 | 强调阴谋论的故事 |
| **直接出现在脑中** | 最有侵入感，制造「你无法拒绝接受」的恐惧 | 需要解释能力来源 | 超自然色彩强的系统 |
| **环境显示（LED、大屏）** | 视觉冲击强，公开性强 | 需要场景支持 | 实验性/科技感强的公车设定 |
| **特定触发（触碰某物才显示）** | 制造探索感，隐藏规则更自然 | 并非所有人同时获知 | 隐藏规则丰富的设定 |

**最有效的组合**：公开规则通过广播宣告（所有人同时知道），但隐藏规则通过私信/特定触发方式传递（制造信息差）。这种组合让公车产生「表面规则」和「真实规则」的双层结构。

---

#### 10. 系统背后的秘密

系统的起源和目的，是贯穿全书的最核心谜团之一。如何设计让读者追读到最后的主线谜团：

**设计原则**：谜团必须在公车阶段就埋下第一层暗示，但直到很后期才完整揭开。

**几种主线谜团类型**：

**「谁在操控系统」**：系统背后是人还是AI还是某种超自然存在？

如何埋线索：让系统在某个时刻做出「规则之外」的行为——一个小小的偏差，足以让细心的主角/读者察觉「这不只是程序」。

**「游戏的目的是什么」**：筛选出来的幸存者，会被用来做什么？

如何埋线索：让一个老玩家在死前说出半句话，或者在大厅发现某些通关者的去向没有记录。

**「公车本身是什么」**：这不是普通的公车，它的本质是什么？

如何埋线索：设计一个新手绝对不会注意但老玩家会觉得奇怪的细节——比如公车的路线从来不重复，比如公车外的景色在规则触发时会短暂异常。

**「选中机制的真正逻辑」**：随机抽取只是表象，真正决定谁被选中的条件是什么？

如何埋线索：主角发现公车上的乘客有某种隐藏的共同点——职业、经历、或者某种特质，但无法马上确定这是否有意义。

**谜团设计的铁律**：每一个谜团在被解开时，必须同时开启下一个更大的谜团。公车阶段的谜团解开，让读者意识到真正的谜团才刚刚开始。

---

### 生成要点

- 系统名称必须兼顾记忆点（读者能一眼记住）和内涵暗示（名称背后有叙事意义）
- 系统类型选择决定了公车博弈的底层逻辑，建议在其他字段填写前先确定系统类型
- 公车的定位（新手村/通道/周期重置/特殊副本）要与故事的整体世界观保持一致
- 死亡惩罚的严重程度要与目标读者的接受度匹配，同时要保证公车博弈有足够的生死压力
- 系统人格是整本书的「声音」，一旦确定就要保持一致，不能忽冷忽热
- 主线谜团要在公车阶段完成第一层埋设，公车是谜团的预告，不是谜团本身',
  '## "Game System" Setting Generation — Thriller Bus Novel

The "game system" is the foundational architecture of the thriller bus novel; it determines the game''s operational logic, the bus''s role within it, and the origin of all rules in the horror world. This skill guides the writer through 10 key fields of the game system setting.

---

### Field Generation Guide

#### 1. System Name

The system name is the first symbol through which readers encounter the game world. A good name hints at "journey / destination / game" while carrying a sense of menace or mystery.

**Naming directions**:

| Direction | Characteristics | Suitable tone |
|-----------|----------------|---------------|
| Bus / journey elements | Directly references transit/travel imagery | Contrast between the mundane and the horrific |
| Destination / fate elements | Implies death or destiny | Stories with a strong sense of doom |
| Last run / apocalypse elements | Implies scarcity and irreversibility | Settings with extreme survival pressure |
| Game / competition elements | Directly names the game''s nature | Rule-heavy, competition-oriented stories |
| Neutral / ambiguous elements | Seemingly harmless; horrifying on closer thought | Stories with dense suspense atmosphere |

**15 naming examples with analysis**:

1. **"Last Bus System"** — "Last" implies this is the final chance, while also implying other "runs" exist. The double meaning supports later narrative expansion
2. **"Terminal Game"** — The double meaning of "terminal" (journey end + life end) is direct and powerful
3. **"Waiting Hall"** — Counter-intuitive naming; "waiting" should be calm, but here it marks the beginning of another layer of danger
4. **"Transfer Protocol"** — "Protocol" implies a contractual relationship; players are not merely prey but have signed some kind of agreement
5. **"Route Sign System"** — Route signs indicate direction but can also restrict and warn, with a visual suggestion of a rule framework
6. **"Ticketing Authority"** — Bureaucratic naming creates absurdist horror, as if this were a legitimately operating institution
7. **"Zero Hour Express"** — "Zero hour" is both a time node and implies zeroing out / erasure; "express" implies inability to slow down
8. **"River Crossing Association"** — "River crossing" is a classic Chinese cultural image of the boundary between life and death (the Bridge of Helplessness); "association" creates a sense of organization
9. **"Parallel Runs"** — Implies the world has more than one bus; countless parallel games may be running simultaneously
10. **"Survival Rate Statistics Bureau"** — Brutally cold naming that turns lives into data, creating systemic horror
11. **"Night Line Administration"** — "Night" implies darkness and danger; "administration" again carries bureaucratic absurdity
12. **"One-Way Ticket Agreement"** — "One-way" means no turning back; strong sense of contract
13. **"Game Initiation Committee"** — Formal register contrasts with the cruelty of the content, creating cognitive dissonance
14. **"Elimination Record System"** — Bluntly unsettling; treating death as a data entry
15. **"Survival Assessment Center"** — Introducing the "assessment" context links the game to real-world social pressure, generating additional discomfort in readers

**Avoid**:
- Overly edgy names ("Supreme God-Level Game System," "Beyond-Spacetime Trial") reduce immersion
- Purely random alphanumeric combinations ("System G-7749") lack memorability and narrative depth
- Over-explanatory names ("Player Survival Screening and Configuration System") undermine suspense

---

#### 2. System Type

System type determines the game world''s fundamental operational logic and has a foundational impact on bus narrative. Analysis of four main types:

**Survival Competition Type** (Best suited for bus elimination mechanics)

Core logic: Players compete for limited survival slots; the game''s purpose is to select the "most suitable" survivors.

Impact on bus narrative:
- The scarcity of survival slots is entirely logical; readers will not question "why can''t everyone pass"
- Competition among players is legitimized from the start without needing additional explanation for "why they hurt each other"
- The "fairness" of the system can serve as a central controversy (is it truly fair?)

How to write survival competition bus scenes: In the system broadcast, clearly announce the survival quota (e.g., "This run''s survival cap is 8. Current passenger count: 20"), letting the numbers themselves generate oppressive tension. The system does not explain the reason for rules — it only states outcomes.

**Task Completion Type**

Core logic: Players must complete specific tasks to pass; the bus task is the first test.

Impact on bus narrative:
- The task itself can create cooperation motivation (everyone needs to work together), while also generating conflict (task resources are limited; not everyone can complete it)
- Bus tasks are best designed as "seemingly cooperative but with hidden zero-sum dynamics"
- Requires clearly defined task objectives, otherwise readers become disoriented

How to write task completion type: Bus tasks might be "find a specific item on the bus," "solve a riddle," or "say a designated word within the time limit," but eventually players discover that satisfying the conditions requires sacrificing others.

**Accumulation Growth Type**

Core logic: Players accumulate points/levels through gameplay, enhancing their abilities over time; the bus is the starting point.

Impact on bus narrative:
- Points earned on the bus are especially precious because it is every player''s starting point — advantages gained here persistently affect entire game careers
- Veterans know the value of bus points; newcomers do not, creating information asymmetry
- Supports "why veterans are willing to help newcomers" storylines: helping newcomers may yield additional rewards

How to write accumulation growth type: In the bus broadcast, reveal "completion rewards" without specifying what they are, forcing players to make decisions with insufficient information.

**Punishment Elimination Type**

Core logic: Players are punished / eliminated for mistakes (rule violations); the bus has the highest rule density.

Impact on bus narrative:
- The prohibition system is central — the bus is full of red lines that must not be crossed
- Players do not compete against each other but collectively try to avoid triggering penalties, while also monitoring each other (reporting another''s violation may yield rewards)
- Suited to creating high-pressure horror of "one slip and you''re dead"

How to write punishment elimination type: Let the first death occur from a "very innocent mistake," making everyone realize the rules have zero tolerance.

---

#### 3. The Bus''s Role Within the System

The bus''s positioning determines its meaning within the entire game world and the direction of the story after the level ends.

**Newcomer Village Role**

Meaning: The bus is an entry-level instance designed by the game system for new players, intended to screen and train them.

Narrative impact:
- A larger world awaits players after completion, generating strong reader anticipation
- But this also means subsequent instances will be more dangerous; the bus is just the beginning
- Allows for "bus protection mechanics" — veterans cannot do certain things to newcomers without triggering penalties

**Gateway / Portal Role**

Meaning: The bus is not an instance but a portal into the game world; passing the bus means officially joining the game.

Narrative impact:
- Events on the bus exist in a "gray zone" where rules may be incomplete
- The world after passing has a clear boundary with the bus
- Supports "events on the bus will not carry over into subsequent instances" settings (reset mechanism), creating more complex moral choices

**Periodic Reset Role**

Meaning: New buses launch at regular intervals as the system''s routine screening mechanism; even veteran players may be returned to the bus for a reset.

Narrative impact:
- "Being returned to the bus" is a veteran''s greatest fear, creating a book-wide level threat
- Clues left by previous passengers can be found on the bus (messages carved in seats, items hidden in the carriage)
- Veterans have specific psychological trauma associated with the bus, affecting their behavior

**Special Instance Role**

Meaning: The bus is a specialized instance within the game system, existing alongside ordinary instances but exclusively targeting multi-player mixed scenarios.

Narrative impact:
- Players may encounter bus instances multiple times throughout their game careers, with different rules each time
- Bus-specific skills, items, and strategies form a unique "bus meta"
- Experienced "bus veterans" represent a specialized character type

---

#### 4. The World After the Bus

The design of the world survivors enter after completing the bus directly influences readers'' anticipation of "what comes after getting off."

**How to design the game lobby / player gathering point**:

A good game lobby must immediately convey two pieces of information:
1. "This is a world with scale" — scale comes from seeing how many other survivors there are, the grandeur of structures, or the density of information
2. "The danger isn''t over" — the lobby itself may not be safe, or the lobby makes players realize the real danger has only just begun

Design considerations:

**Safe Houses**: Temporary shelter for players. Consider:
- Is the safe house truly safe? Or conditionally safe?
- Are resources sufficient, or must they be competed for?
- Who manages the safe house? What are their motives?

**Player Community**: Informal networks formed among survivors. Consider:
- How does information circulate among players (black market intelligence, word of mouth, or formal information trading)?
- Does the player community have its own rules and order (gangs, guilds, or rampant individualism)?
- Status differences between "veterans" and "rookies" within the community

**Techniques to make readers anticipate "getting off"**:
- Provide enticing fragmentary information on the bus (a veteran mentions a rare item available in the lobby, or hints at the value of completion rewards)
- Design a puzzle on the bus that is unsolved on board but answered in the lobby
- Let a deceased bus character''s existence leave traces in the lobby (their name appearing somewhere, their belongings kept by other players)

---

#### 5. Entry Mechanism

How players are selected to board — this design determines the game world''s foundational moral framework.

**Several entry mechanisms and their design considerations**:

**Random Selection**: The system randomly selects players, unrelated to their identity, behavior, or ability.

Design significance: Emphasizes the game''s cruelty and the irresistibility of fate, suited to themes of "humans are small before the game." But note that a macro-level explanation of "why people from this world are being selected" must be provided, or the logic will feel arbitrary.

**Condition-Triggered**: Only those who satisfy specific conditions are selected (touching a certain object, visiting a certain location, saying a certain word).

Design significance: Creates a "so that''s why" fear — readers will begin to reflect on which of their daily behaviors might trigger similar conditions. Avoid overly random conditions ("touched a streetlight and got selected" lacks narrative depth).

**Predestined Fate**: The selected are destined to be chosen; the game system marked them at birth.

Design significance: Creates a sense of doom, suited for stories with larger themes (exploring free will). A narrative motivation for "why them" must be provided, otherwise it appears that the author assigned them arbitrarily for convenience.

**Voluntary Entry** (rare but interesting): Players actively seek and board this bus, knowing what they are doing.

Design significance: Subverts the victim perspective; the protagonist or important supporting characters can be "willing passengers," creating an entirely different motivational structure.

**The lazy "I also don''t know why I was selected" approach (must be avoided)**:

This is the most common mistake. When an author cannot explain the selection mechanism, they let the character say "I don''t know either" and move on. This will:
- Break the completeness of the worldview
- Make readers feel the author hasn''t thought things through
- Forfeit the narrative value that "the meaning of being selected" could carry

**Correct approach**: Even if the entry mechanism cannot be fully explained in chapter one, when the protagonist/reader realizes "something is wrong," plant a hint that "maybe there''s a reason I''m here," and provide the answer in later chapters.

---

#### 6. Rank and Point System

Starting level calculations from the bus — this design carries deep narrative significance.

**Why bus-phase points are especially valuable**:

- **Compound effect of starting advantage**: In level systems, early advantages amplify over time. Ten extra points on the bus may translate into geometric differences in later gameplay
- **Drama created by information asymmetry**: Newcomers don''t know the value of bus points; veterans do. This explains why veterans are willing to take risks for extra points on the bus, while newcomers don''t understand their behavior
- **Controversy of death points**: If the system awards bonus points to players who "directly cause another''s elimination," it creates incentive for active action — bus dynamics shift from "passively waiting for elimination to happen" to "actively seeking opportunities"

**Level design suggestions**:

The bus phase is "Level 0" or "Candidate level"; officially becoming a "player" and beginning level calculation only happens after passing the bus. The significance of this design: those who die on the bus have not even qualified as "players" — they are just data processed by the system. This matter-of-fact cruelty is more unsettling than explicit descriptions of death.

**Point source design** (bus phase):
- Basic completion points (surviving to disembark)
- Exploration rewards for discovering hidden rules
- Additional rewards for "correct choices" in specific situations (the system''s judgment criteria often violate moral intuition)
- Competition rewards for eliminating others (whether to grant this type of reward determines the game''s overall moral stance)

---

#### 7. Death Penalties

Death penalty design directly affects the intensity and moral complexity of bus-internal strategy.

**Impact of four death penalty types on bus strategy**:

**True Death Type**: In-game death = real-world death; no revival possible.

Impact on bus strategy: Every decision is final, with no retreat. This is the highest-tension setting, but also risks reader fatigue from "every character is expendable." Writing suggestion: Under this setting, deaths must be written with weight and cannot become an assembly line.

**Data Erasure Type**: Death causes the person''s "existence" to be wiped from everyone''s memory; only the system retains a record.

Impact on bus strategy: Creates psychological horror — "if I die, everyone will forget me." The protagonist may witness someone dying on the bus but be unable to hold anyone accountable, because other players "don''t remember that person existing."

**Substitute Penalty Type**: A dead player can revive, but must designate a substitute to bear the death.

Impact on bus strategy: The most complex moral dilemma — "who would you let die in your place?" Every relationship on the bus becomes complicated by this possibility.

**Level Deduction Type**: Death is not literal; instead, large amounts of points/levels are deducted and the player is returned to restart at a lower tier.

Impact on bus strategy: Relatively mild, but can make strategy feel non-lethal — readers and characters both know "the worst outcome is starting over," reducing tension. Remedy: Design an additional rule that "players whose points reach zero are permanently removed from the game."

---

#### 8. System Personality

The system''s "voice" in bus broadcasts is the most important narrative interface in the entire game world. The style of broadcast copy directly affects the horror atmosphere.

**Four system personality types with sample broadcast copy**:

**Cold Data Type**: The system only states facts, without any emotional coloring, like a weather forecast.

Sample broadcasts:
- "Current surviving passenger count on this run: 17. Next elimination will occur in 23 minutes 41 seconds."
- "Passenger number 009 has exceeded the time limit. Executing elimination procedure. Estimated completion: 3 seconds."
- "Violation detected. Resolution: immediate termination."

The horror of this personality comes from the erasure of personhood by being treated as data — more despairing than an angry enemy.

**Over-enthusiastic Type**: The system describes brutal events using extremely positive, marketing-speak language, creating absurdity and cognitive dissonance.

Sample broadcasts:
- "Congratulations! You have successfully completed the elimination task! The system is recording your excellent performance."
- "Thank you for the active cooperation of Passenger 012! Your departure has provided other passengers with a valuable survival opportunity."
- "The weather is wonderful today — perfect conditions for this game experience! Wishing all players a pleasant journey!"

This personality is most deeply unsettling — using customer service language to package death creates systemic value distortion.

**Gentle Inducement Type**: The system speaks in a warm, low voice, as if soothing a child, leaving one unable to tell whether it is protecting or manipulating.

Sample broadcasts:
- "Don''t be afraid, dear passengers. The rules exist to protect you."
- "I know you are all working very hard. But the game must continue. You understand, don''t you?"
- "Passenger 014, you made the right choice. I am proud of you."

This personality creates a sense of dependency — characters begin to regard the system as some kind of "protector" in a distorted way, further corrupting their cognition.

**Ancient Ritual Type**: The system uses archaic language with a cultural ritual quality, implying the game has deeper historical roots.

Sample broadcasts:
- "Fellow travelers, the hour has come. The name of the offering shall be inscribed at the far end of the road."
- "Please accept the trials of the journey. Only those who cross shall reach the destination."
- "The bus has departed; the way back is severed. May all travelers find what they seek."

This personality implies the game is not a product of modern technology but a continuation of some ancient ritual, adding depth to the worldview.

---

#### 9. System Notification Methods

How the system informs players of rules and status has a direct impact on the horror atmosphere. A comparison of methods:

| Notification Method | Advantages | Disadvantages | Best Bus Setting |
|--------------------|------------|---------------|-----------------|
| **Broadcast / audio** | Naturally integrated into bus setting; creates "realism" | Cannot deliver personalized messages; hard to create information asymmetry | Survival competition type where all learn rules simultaneously |
| **Phone / device** | Can send private messages; creates information asymmetry | Must explain why phones have signal and how system controls them | Task completion type with different individual tasks |
| **Paper notices / written** | Creates a "premeditated" feeling; implies someone planned all this | Slower pace; weaker urgency | Stories emphasizing conspiracy theory |
| **Direct mind implantation** | Most invasive; creates fear of "you cannot refuse to receive this" | Must explain the ability''s origin | Systems with strong supernatural character |
| **Environmental display (LED, large screens)** | Strong visual impact; highly public | Requires scene support | Experimental / tech-focused bus settings |
| **Specific triggers (displayed only upon touching something)** | Creates exploration feeling; hidden rules feel more natural | Not all players learn simultaneously | Settings rich in hidden rules |

**Most effective combination**: Public rules announced via broadcast (everyone learns simultaneously), while hidden rules are delivered via private message / specific triggers (creating information asymmetry). This combination gives the bus a two-layer structure of "surface rules" and "real rules."

---

#### 10. The Secret Behind the System

The system''s origin and purpose is one of the most central mysteries running through the entire book. How to design a main mystery that keeps readers engaged to the end:

**Design principle**: The mystery must plant its first-layer hints during the bus phase, but only be fully unveiled much later.

**Several types of overarching mysteries**:

**"Who controls the system"**: Is the force behind the system human, AI, or some supernatural entity?

How to plant clues: Have the system behave "outside the rules" at a certain moment — a small deviation, enough for a careful protagonist/reader to sense "this is more than a program."

**"What is the game''s purpose"**: What are the survivors filtered out for?

How to plant clues: Have a veteran say half a sentence before dying, or discover in the lobby that the whereabouts of certain completers are unrecorded.

**"What is the bus itself"**: This is not an ordinary bus — what is its true nature?

How to plant clues: Design a detail that a newcomer would never notice but a veteran would find strange — for example, the bus''s route never repeats, or the scenery outside briefly behaves abnormally when a rule is triggered.

**"The true logic of the selection mechanism"**: Random selection is only the surface; what really determines who is chosen?

How to plant clues: The protagonist notices that bus passengers share some hidden common trait — profession, experience, or some quality — but cannot immediately determine whether this is meaningful.

**The iron law of mystery design**: Every time a mystery is solved, it must simultaneously open the next, larger mystery. When the bus-phase mystery is resolved, readers realize the true mystery has only just begun.

---

### Generation Notes

- System names must balance memorability (readers remember it at a glance) with implied meaning (the name carries narrative significance)
- System type selection determines the foundational logic of bus strategy; recommend finalizing this before filling in other fields
- The bus''s positioning (newcomer village / gateway / periodic reset / special instance) must remain consistent with the story''s overall worldview
- The severity of death penalties must match the target readership''s tolerance, while ensuring sufficient life-and-death pressure exists for bus strategy
- System personality is the "voice" of the entire book; once established, it must remain consistent and cannot fluctuate arbitrarily
- Main mysteries must complete their first layer of setup during the bus phase; the bus is the preview of the mystery, not the mystery itself',
  (SELECT id FROM novel_creation_method WHERE name = '惊悚公车小说' LIMIT 1),
  1,
  81,
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
