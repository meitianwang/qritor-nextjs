-- 灵异直播小说「角色」生成技能
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '灵异直播小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-lingyi-live-character-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'lingyi-live-character-gen',
  '灵异直播小说角色生成：涵盖搭档助播、忠实粉丝/数据党、质疑者/黑粉、直播间潜伏鬼魂、凶宅鬼怪、竞争主播六类角色的设计要点，重点阐明「长期在线的非人观众」的账号特征、弹幕伏笔与揭露时机',
  'Ghost livestream novel character generation: covers design principles for six character types — co-streamer, loyal fans/data analysts, skeptics/haters, ghost audience lurkers, location-bound spirits, and rival streamers — with special focus on designing non-human viewers with account signatures, danmaku foreshadowing, and reveal timing',
  '## 「角色」生成 — 灵异直播小说

灵异直播小说的角色体系比传统灵异故事多了一个维度：**直播间生态**。每个角色不只是"人"或"鬼"，而是在直播这个媒介下扮演特定的叙事功能——有些角色只存在于弹幕里，有些角色的真实身份要等到故事三分之二之后才能确认。

本文档覆盖灵异直播小说的六类核心角色类型，重点是如何让每类角色「不只是工具」。

---

### 一、搭档助播

#### 存在价值：填补主播的能力空缺

搭档助播的设计出发点是「主播一个人做不到的事」，而不是「主播的跟班」。搭档存在的理由必须是功能性的：

| 主播弱点 | 搭档补位方式 |
|---------|------------|
| 技术盲点（不会剪辑/特效） | 搭档负责实时剪辑，把最恐怖的帧截出来给观众看 |
| 单人探险时无人接应 | 搭档留守车内/门口，负责外部联络和实时备份录像 |
| 情绪化/易恐惧 | 搭档是「理性锚点」，在主播崩溃时稳住局面 |
| 缺乏灵异知识 | 搭档是业余民俗研究者，提供背景资料 |

**化学反应设计**：搭档与主播之间的张力来自「立场分歧」而不是「感情纠纷」。最有趣的搭档关系是：主播为了流量要往深处走，搭档因为真的害怕（或者因为知道更多）要往回撤。这种分歧制造了比任何鬼怪都真实的戏剧张力。

**常见套路与规避**：
- 陷阱：搭档的唯一功能是被吓到、发出惊呼声，配合主播的"你看！"
- 规避：给搭档独立的知识/技能体系，让他在某些时刻比主播更接近真相
- 陷阱：搭档在关键时刻消失或「撂挑子」纯属为了推进剧情
- 规避：搭档退出要有积累的内在逻辑，而不是临时安排的剧情需要

**具体示例**

*角色A：叶冬*
- 背景：前广播系记者，因为独立报道灵异事件被台里以「散布谣言」为由开除，转型做后期剪辑
- 在直播中的功能：留守车内，实时监控四路摄像头，负责在主播看不到时发出语音提示
- 特殊设定：他是第一个注意到「某个账号的弹幕内容超出人类认知」的人，但他没有告诉主播，因为他在自己收集证据
- 化学反应：他和主播的分歧是「记录真相」vs「制造爽感」——他想做纪录片，主播想要流量

*角色B：小鱼（真名：宋雨琪）*
- 背景：大学在读，民俗学爱好者，从粉丝升级为助播
- 在直播中的功能：主播出发前的资料调研，直播中通过语音补充地点背景
- 特殊设定：她有「信息边界感」——她知道很多但不知道自己知道的是否够用。有几次她提供的信息关键到让主播化险为夷，但她自己并不知道是为什么
- 化学反应：她对主播有崇拜→怀疑→独立判断的成长弧线

---

### 二、忠实粉丝 / 数据党

#### 如何让他们不只是工具型角色

忠实粉丝通常被写成「打赏机器」或「刷弹幕的背景板」。要让他们有血有肉，必须给他们「独立的信息视角」：

**偶尔比主播更了解情况的设计技巧**：

1. **本地粉丝**：某个粉丝恰好是探险地点附近的居民，他知道那栋楼的历史细节——不是从网上查来的，而是亲身经历。他的弹幕会说出主播不可能知道的地点信息，让其他观众将信将疑。

2. **数据党**：某个粉丝建了一个追踪主播历次直播的数据库，记录了每次直播的异常事件、时间、地点关联。他在某集弹幕里说「这个地方X年前有过一次未解决的失踪案，你们去查」——结果真的查到了，而且直接推进了主线剧情。

3. **老粉**：存在于直播间最久的人类粉丝（不是鬼魂）。他记得主播从零粉丝开始的样子，他的弹幕在关键时刻会有「对比感」——「主播你还记得第一集吗，那时候你说过..…」这种弹幕暗示了主播遗忘或刻意回避的某段历史。

**从功能到人物的转化**：每个忠实粉丝应该有一个「为什么关注这个直播间」的私人理由——不只是「爱看灵异」，而是某种个人的连接（亲人死于类似地点、自己也有过灵异体验、调查目的等）。

---

### 三、质疑者 / 黑粉

#### 让质疑者有叙事价值

黑粉的设计难点是：如果他们总是错的，他们就是纯粹的噪音；如果他们总是对的，主角失去可信度。

**内部怀疑者视角**：最有价值的质疑者是「有理有据的怀疑者」——他们不是「你是骗子」的无脑黑粉，而是「这个设备数据我看了，你们说的异常可以用以下三种方式解释」的理性怀疑者。这类角色是「现实性」的锚点，防止故事变成读者无脑信任的灵异宣传。

**什么时候黑粉是对的**：
- 第一幕：黑粉说这不是真的，结果这次真的不是真的——主播的某次探险被证实是摆拍的（但其他场是真实的）。这让读者无法轻易判断哪次是真哪次是假。
- 中期：黑粉指出了一个设备异常其实有合理解释——但这个「合理解释」本身后来被证明是鬼怪有意制造的「假合理」。黑粉是对的，但他的「正确」正中了鬼怪的圈套。

**设计原则**：质疑者在故事里的功能是「防止读者的批判性思维断线」。他的存在让读者时刻保持「到底是真的还是假的」的悬疑感，这比任何鬼怪都重要。

**具体示例**

*角色：陈逻辑（ID：「逻辑狗」）*
- 背景：某平台技术区UP主，专门做「灵异视频打假」内容
- 行为模式：每次主播直播后，他会发一条分析视频，拆解每个「灵异画面」的物理解释
- 设计转折：他的第17条打假视频拆解了一个镜头，说那不过是镜面反射——但他发布视频的第二天，他自己的摄像头拍到了同样的「镜面反射」，而他当时独自在家

---

### 四、直播间潜伏鬼魂（重点）

#### 「长期在线的非人观众」完整设计体系

这是灵异直播类型最独特的角色类型，也是最容易写砸的角色。设计核心：**鬼魂不知道自己在「被观看」，它只是在「看」**。

#### 账号特征设计

非人账号必须有可被读者事后破译的特征，但当时看起来只是「有点奇怪」：

**ID设计**：
- 不要用「鬼魂123」这种直白的名字
- 推荐格式：一串看似随机的数字（「08271436」——后来读者发现这是某人的死亡日期/时间）；看似正常但仔细看有问题的名字（「正常观众a」后来发现这个ID的「a」每集都在变）；某个词语的古体或变体（「归」而不是「鬼」）

**头像**：
- 一片纯黑（解释：「可能是隐私设置」）
- 某种只有极近看才能发现的奇怪图案
- 模糊到看不清的一张「正常」照片

**注册时间**：
- 注册日期是探险地点发生灵异事件的同一天（事后揭露）
- 注册时间早得不正常（「2001年注册，但这个平台2018年才成立」）

**在线行为**：
- 从不打赏
- 弹幕极少，每集只说1-3条，但每条都在关键时刻出现
- 从主播开播第一集就在线，从不缺席，从不迟到
- 直播结束后立刻下线，不留任何痕迹

#### 弹幕内容如何区别于普通人

普通弹幕的特征：「吓死了！！！」「后面有东西！！！快跑！！！」「主播你看身后！！！」

非人弹幕的特征：
- **说的是陈述句而不是感叹句**：「那里有扇门」（而不是「那里有扇门！！！！」）
- **知道名字**：「问问那个叫陈秀英的人」——主播怎么知道那栋楼里死去的人叫陈秀英？它知道
- **说未来会发生的事**：「第三个房间别进」——当时主播还没靠近第三个房间
- **说出只有死者/场地才知道的细节**：「左边那堵墙后面有一口井」——这口井在任何资料里都查不到，但主播挖开之后真的发现了

#### 如何埋伏笔让读者事后回看时发现线索

伏笔不是事后诸葛亮，而是必须事先布局：

1. **弹幕内容的「超时信息」**：在第3集的弹幕里，这个账号说了一句话，当时看起来像随机评论。在第15集真相揭露后，读者回看第3集，会发现那句话完整预告了后续发生的事。

2. **弹幕时间节点**：每次鬼怪「活动」最激烈的时候，这个账号就出现了。没有人活动得这么精准。

3. **账号互动模式**：它从来不回复其他观众的弹幕，但它的弹幕出现后，主播的行为会发生微妙的变化——好像主播在某种程度上「感知」到了这条弹幕，尽管主播没有明说。

4. **不一致的用词**：同一个账号，在不同集数使用的语言习惯突然变了（从现代用语变成了某个年代的说法）——这是鬼魂身份的隐含线索。

#### 揭露时机和方式

**时机**：故事进入中后段（40%-60%进度），当读者已经隐约感觉「这个账号不对」但还没有确认的时候。

**揭露方式**：
- 不要让主播突然「发现了」——要让一个次要角色（搭档/数据党粉丝）先发现并带着证据找主播
- 揭露不是终点，而是新问题的开始：它为什么一直在看？它的目的是什么？它是一个还是很多个？
- 揭露后必须回到弹幕记录核查——这种「回看第一集」的设计制造了二次恐惧

**具体示例**

*账号：「08271436」*
- 真实身份：14年前在主播第一个探险地点死亡的一名工人，死亡时间是下午4点36分，日期是8月27日
- 设计目的：它不是来害主播的，它是来「监督」的——因为它当年的死不是事故，而是有人故意制造的，主播的直播是第一次有人「进入」那个地方并让更多人知道
- 弹幕特征：它从不阻止主播探险，它只是在某些关键时刻说出「真相需要的线索」，仿佛在引导主播找到自己死亡的真相
- 揭露方式：数据党粉丝发现这个账号注册的IP在一个已经拆除的建筑内，那个建筑是14年前工人死亡的地点

---

### 五、凶宅 / 场地鬼怪

#### 让每个地点的鬼怪有独特性格

场地鬼怪不是「通用障碍」，每个都应该有自己的「规则、目的、性格」：

**设计三要素**：
- **它想要什么**：不只是「吓走人」或「害死人」，而是有具体诉求（有冤情要昭雪/有遗物要找回/有特定对象要寻仇/不愿离开某个地方）
- **它的规则**：它能做什么、不能做什么、有什么弱点——必须内在一致，读者可以推理
- **它的「性格」**：愤怒型/悲哀型/狡猾型/混沌型——性格决定它与主播的互动方式

**如何区别不同场地的鬼怪**：
- 旧医院的厉鬼：执念是某个错误诊断/医疗事故，能力是「影响人的感知」——让人看到假的症状，让人做出错误的判断
- 荒废工厂的鬼怪：集体怨灵，没有单一主体，表现为整个空间的异化（机器自动运转/廊道无限延伸）
- 凶宅里的执念鬼：有明确的「宅主」身份，执念集中在某件家具/某个房间，离开那个范围能力大幅减弱

**与直播的关系**：鬼怪如何「回应」直播是独特的设计空间——有些鬼怪会被摄像头刺激（摄像机灯光 = 阳气聚焦，让它不舒服）；有些鬼怪会被观众的「关注」吸引（观看量越高，它聚集的能量越多）。

---

### 六、竞争主播

#### 同类型主播的存在价值

竞争主播不是纯粹的反派，而是「照镜子的角色」——通过对比，揭示主播的选择和代价。

**三种竞争关系**：

1. **纯商业竞争**：另一个灵异主播，做法更激进（造假更多/去更危险的地方），粉丝规模更大。他的存在是「诱惑」——主播要不要为了流量走他的路？

2. **合作与互相揭秘**：两个主播在某次联合直播中发现彼此都知道对方「做过的事」。他们有把柄互相捏着，合作变成了某种脆弱的相互制衡。

3. **先行者**：某个比主播资历更深的灵异主播，已经去过更危险的地方——然后突然「失联」。他失联前录下的最后一段视频里有东西。主播需要弄清楚他发生了什么，因为主播正打算去同一个地方。

**具体示例**

*角色：魏深渊（账号ID：「入夜直播」）*
- 背景：比主播早三年入行，粉丝量是主播的五倍，探险等级更高，从未在直播中表现过真实的恐惧
- 特殊设定：他进入过一个主播还没去过的S级禁地，直播后他的性格发生了微妙变化——他的直播越来越「平静」，平静到不正常
- 叙事功能：他是主播的「可能的未来」——如果主播继续走这条路，会变成什么样？他知道某些事，但他选择不说，因为说出来会终结他的直播生涯

---

### 与已有设定的联动

| 设定模块 | 对角色的影响 |
|---------|------------|
| **直播间结构** | 弹幕生态→确定哪些角色在弹幕中活动；打赏系统→影响粉丝类型和行为 |
| **灵异等级体系** | 场地难度→鬼怪能力设计的上限；探险频率→搭档的心理压力积累速度 |
| **故事钩子** | 核心灵异元素→鬼魂角色的死亡背景；主播的「秘密」→影响非人观众关注主播的原因 |
| **世界设定** | 灵异规则→鬼怪角色能做什么、不能做什么 |

---

### 常见错误

1. **搭档只是惊叫机器**：每次出场只是为了喊「哇太可怕了！」没有独立叙事功能
2. **非人观众太早暴露**：弹幕内容过于明显，读者第一集就知道「这个账号是鬼」，神秘感消失
3. **非人观众的弹幕都是警告**：如果非人观众永远在「提示」主播，它就变成了保护者而不是未知威胁
4. **场地鬼怪没有个性**：每个地方的鬼怪都是「阴森恐怖的东西」，没有独特的规则和目的
5. **竞争主播纯属反派**：竞争主播不是坏人，他是镜子——如果他只是阻碍主播的障碍，浪费了这个类型的潜力
6. **粉丝角色全是工具**：打赏的粉丝、给信息的粉丝、被吓到的粉丝——从来没有一个粉丝是「人」
7. **质疑者总是错的**：如果黑粉永远被打脸，读者失去了「这是真的还是假的」的持续悬疑感',
  '## "Character" Generation — Ghost Livestream Novel

The character system in ghost livestream novels adds a dimension beyond traditional horror: the **livestream ecosystem**. Characters are not just "humans" or "ghosts" — in the context of livestreaming, each plays a specific narrative function. Some characters exist only in the danmaku feed; some characters'' true identities cannot be confirmed until two-thirds of the way through the story.

This document covers six core character types for ghost livestream novels, with focus on making each type go beyond being a mere plot device.

---

### I. Co-Streamer / Sidekick

#### Core Purpose: Compensate for the Main Streamer''s Blind Spots

The co-streamer''s design must begin from "what the main streamer cannot do alone," not from "the main streamer''s follower." The co-streamer''s reason for existing must be functional:

| Main Streamer Weakness | Co-Streamer Compensation |
|-----------------------|-------------------------|
| Technical blind spots (no editing/VFX skills) | Real-time clip editing, pulling the scariest frames for viewers |
| No backup during solo exploration | Stays in the car/at the entrance, handles external contact and backup recording |
| Emotional/easily frightened | The "rational anchor" — stabilizes the situation when the streamer breaks down |
| Lacks supernatural knowledge | Amateur folklore researcher, provides background context |

**Chemistry Design**: The best co-streamer tension comes from conflicting positions, not romantic drama. The most interesting dynamic: the streamer wants to go deeper for views; the co-streamer wants to pull back because they''re genuinely scared (or know more than they let on).

**Common Pitfalls and Avoidance**:
- Trap: Co-streamer''s only function is to react with fear and exclamations
- Avoidance: Give the co-streamer an independent knowledge/skill system so they''re occasionally closer to the truth than the streamer
- Trap: Co-streamer abandons the mission purely to advance the plot
- Avoidance: The co-streamer''s exit must follow internal logic, not arbitrary narrative convenience

**Character Example — Ye Dong**
- Background: Former broadcast journalist, fired for independently reporting on paranormal events, pivoted to post-production editing
- Livestream function: Stays in the car, monitors four camera feeds simultaneously, issues voice alerts when the streamer can''t see something
- Special trait: He''s the first to notice that a certain account''s danmaku content exceeds human knowledge — but he doesn''t tell the streamer because he''s collecting evidence himself
- Chemistry: His conflict with the streamer is "documenting truth" vs. "manufacturing engagement" — he wants a documentary, the streamer wants traffic

---

### II. Loyal Fans / Data Analysts

#### How to Make Them More Than Functional Props

Loyal fans are typically written as "donation machines" or "background noise in the danmaku feed." To give them depth, they need an independent information perspective:

**Design techniques for fans who sometimes know more than the streamer**:

1. **Local Fan**: A fan who happens to be a resident near the exploration site. They know historical details about that building — not from online research, but from personal experience. Their danmaku will reveal location details impossible for the streamer to know, leaving other viewers uncertain.

2. **Data Analyst**: A fan who maintains a database tracking all the streamer''s past sessions, logging anomalies, timestamps, and location correlations. They comment "This location had an unsolved disappearance X years ago, look it up" — and it turns out to be true, directly advancing the main plot.

3. **Long-Time Viewer**: The longest-attending human fan in the livestream (not a ghost). They remember when the streamer had zero followers, and their occasional comments carry a "contrast effect" — "Streamer, do you remember the first episode? You said..." — hinting at a history the streamer has forgotten or deliberately buried.

---

### III. Skeptics / Haters

#### Making Skeptics Narratively Valuable

The challenge with skeptics: if they''re always wrong, they''re pure noise; if they''re always right, the protagonist loses credibility.

**The Internal Skeptic Perspective**: The most valuable skeptics are "reasoned doubters" — not "you''re a fraud" trolls, but "I''ve analyzed the device data and your claimed anomalies have these three alternative explanations" rationalists. This type of character is the "reality anchor" that prevents the story from becoming uncritical supernatural propaganda.

**When the Skeptic Is Correct**:
- Act One: The skeptic says it''s fake — and they''re right, this particular session was staged (while others are genuine). This prevents readers from blindly trusting any single session.
- Mid-story: The skeptic identifies a plausible physical explanation for a device anomaly — but this "rational explanation" is later revealed to be deliberately manufactured by the ghost to create false plausibility. The skeptic was right, but their "correctness" played directly into the ghost''s trap.

**Character Example — ID: "Logic Hound"**
- Background: A debunking channel on another platform that specializes in exposing paranormal video fakery
- Behavior: After every stream, posts a detailed analysis video dismantling each "paranormal moment" with physical explanations
- Design pivot: His 17th debunking video explains a particular shot as mirror reflection — the day after posting, his own camera captures the same "mirror reflection" while he''s home alone

---

### IV. Ghost Audience Lurkers (Key Section)

#### Complete Design Framework for Non-Human Viewers

This is the most unique character type in ghost livestream fiction and the easiest to botch. Core design principle: **the ghost doesn''t know it''s being watched; it''s simply watching**.

#### Account Signature Design

Non-human accounts must have features that readers can decode in hindsight but that initially look merely "a little strange":

**Username Design**:
- Avoid obvious names like "Ghost123"
- Recommended formats: a string of seemingly random numbers ("08271436" — later revealed to be someone''s death date/time); a name that looks normal but has a subtle flaw ("Normal_Viewer_a" where the "a" increments each episode); an archaic variant of a common word ("Return" instead of "Ghost")

**Profile Picture**:
- Pure black (explainable as "privacy settings")
- A subtle pattern only visible under extreme zoom
- A blurred "normal" photo that can''t quite be resolved

**Registration Date**:
- Registered on the same day a paranormal event occurred at a later exploration site (revealed in hindsight)
- Impossibly early registration ("registered in 2001, but this platform launched in 2018")

**Online Behavior**:
- Never donates
- Minimal danmaku — 1-3 comments per session, but always at pivotal moments
- Online from the streamer''s very first session, never absent, never late
- Goes offline immediately when the stream ends, leaves no trace

#### How Non-Human Danmaku Differs from Human Comments

Human danmaku: "OMG SCARED!!!" / "SOMETHING BEHIND YOU!!!" / "RUN RUN RUN!!!"

Non-human danmaku:
- **Declarative, not exclamatory**: "There''s a door over there" (not "THERE''S A DOOR THERE!!!!!!")
- **Knows names**: "Ask the one called Chen Xiu-ying" — how would anyone know the dead person''s name?
- **Predicts near-future events**: "Don''t go in the third room" — before the streamer is anywhere near the third room
- **Reveals information no living person could know**: "There''s a well behind the left wall" — unrecorded anywhere, but the streamer finds it upon investigation

#### How to Plant Foreshadowing That Readers Will Discover on Re-Read

Foreshadowing must be pre-planted, not retroactively justified:

1. **Ahead-of-timeline information**: In Episode 3''s danmaku, this account says something that looks like a random comment. After the Episode 15 reveal, readers returning to Episode 3 discover the comment completely predicted subsequent events.

2. **Danmaku timing**: The account appears precisely when paranormal activity peaks. No human is this precise.

3. **One-way interaction**: It never replies to other viewers'' comments, but after its danmaku appears, the streamer''s behavior subtly shifts — as if the streamer somehow "senses" the comment, without ever acknowledging it explicitly.

4. **Inconsistent register**: The same account''s language patterns suddenly shift between episodes (modern phrasing shifts to period-specific vocabulary) — an implicit identity clue.

#### Reveal Timing and Method

**Timing**: Mid-to-late story (40-60% mark), when readers already suspect "this account is wrong" but haven''t confirmed it.

**Reveal Method**:
- Don''t let the streamer suddenly "figure it out" — have a secondary character (co-streamer, data-analyst fan) discover it first and bring evidence to the streamer
- The reveal is not an ending — it''s the beginning of new questions: Why has it been watching? What does it want? Is it one entity or many?
- After the reveal, returning to the archived danmaku feed is mandatory — this "rewatch Episode 1" design creates secondary horror

**Character Example — Account: "08271436"**
- True identity: A construction worker who died at the streamer''s first exploration site 14 years ago; death time 4:36 PM on August 27
- Design purpose: Not trying to harm the streamer — it''s here to supervise. Its death wasn''t an accident; someone engineered it, and the livestream is the first time anyone has entered that space and made the story visible to others
- Danmaku pattern: Never blocks the streamer''s exploration; only speaks at critical moments to provide clues the truth requires — as if guiding the streamer toward discovering how it died
- Reveal method: A data-analyst fan discovers the account''s IP registration originates from a building that was demolished — the same building where the worker died 14 years ago

---

### V. Location-Bound Spirits

#### Giving Each Site''s Ghost a Distinct Personality

Location spirits are not generic obstacles. Each must have its own rules, goals, and personality:

**Three Core Design Elements**:
- **What it wants**: Not just "scare people away" or "kill someone" — a specific demand (a grievance to expose, a possession to recover, a particular target to pursue, a place it refuses to leave)
- **Its rules**: What it can do, what it cannot, what its weaknesses are — must be internally consistent so readers can reason about them
- **Its "personality"**: Wrathful/sorrowful/cunning/chaotic — personality determines how it interacts with the streamer

**Differentiating Location Spirits**:
- Old hospital ghost: Obsession rooted in a misdiagnosis/medical malpractice, ability is "distorting perception" — making people see false symptoms, driving them toward bad decisions
- Abandoned factory spirit: Collective resentment without a single identity; manifests as spatial corruption (machines running on their own, corridors that extend infinitely)
- Haunted house bound spirit: Clear "master of the house" identity, obsession anchored to specific furniture or a specific room; abilities sharply diminish outside that radius

**Relationship to the Livestream**: How a ghost "responds" to being streamed is a unique design space — some spirits are irritated by camera lights (the light = focused yang energy); some spirits are amplified by viewer attention (the higher the viewership, the more energy they accumulate).

---

### VI. Rival Streamers

#### The Narrative Value of Rival Content Creators

Rival streamers are not purely antagonists — they are mirror characters. Through contrast, they reveal what choices cost the main streamer.

**Three Types of Rivalry**:

1. **Pure Commercial Competition**: A more aggressive livestreamer (more staged content, more dangerous locations, larger fanbase). Their existence is "temptation" — will the main streamer follow that path for views?

2. **Uneasy Alliance / Mutual Blackmail**: Two streamers doing a joint stream discover they each have damaging knowledge about the other. They hold leverage over one another, turning cooperation into fragile mutual deterrence.

3. **The Predecessor**: A veteran ghost streamer who went to more dangerous places before the main streamer — then suddenly went missing. Their final video before disappearing contains something. The main streamer needs to find out what happened, because they''re heading to the same location.

**Character Example — Wei Shen-Yuan (ID: "IntoNight_Live")**
- Background: Three years ahead of the main streamer, five times the following, higher exploration clearance, has never shown genuine fear on stream
- Special trait: He entered an S-rank forbidden site the main streamer hasn''t reached yet; after that stream, his personality subtly shifted — his broadcasts became increasingly "calm," calm to the point of wrongness
- Narrative function: He is the streamer''s "possible future" — if the streamer continues on this path, what will they become? He knows certain things but chooses silence, because speaking would end his career

---

### Setting Linkage

| Setting Module | Impact on Characters |
|---------------|---------------------|
| **Livestream Structure** | Danmaku ecosystem → determines which characters operate in the feed; donation system → shapes fan types and behaviors |
| **Paranormal Tier System** | Site difficulty → caps ghost character ability design; exploration frequency → rate of co-streamer psychological pressure accumulation |
| **Story Hook** | Core paranormal element → ghost character death background; streamer''s "secret" → explains why the non-human viewer fixates on this streamer |
| **World Setting** | Paranormal rules → what ghost characters can and cannot do |

---

### Common Errors

1. **Co-streamer is only a scream machine**: Every appearance is just "WOW SO SCARY!" — no independent narrative function
2. **Non-human viewer revealed too early**: Danmaku content is so obvious that readers identify the "ghost account" in Episode 1, destroying the mystery
3. **Non-human viewer only ever warns**: If it always "alerts" the streamer, it becomes a protector rather than an unknown threat
4. **Location spirits have no personality**: Every site''s ghost is "something dark and terrifying" with no distinct rules or goals
5. **Rival streamer is pure villain**: The rival is a mirror, not an obstacle — reducing them to an antagonist wastes the type''s potential
6. **Fan characters are all props**: The donating fan, the info-providing fan, the frightened fan — never once treated as a person
7. **Skeptics are always wrong**: If the skeptic is always proven wrong, readers lose the sustained "is this real or not" suspense',
  (SELECT id FROM novel_creation_method WHERE name = '灵异直播小说' LIMIT 1),
  1,
  94,
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
