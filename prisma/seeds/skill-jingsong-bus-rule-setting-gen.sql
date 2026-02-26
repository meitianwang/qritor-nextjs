-- 惊悚公车小说「公车规则」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = 惊悚公车小说
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-jingsong-bus-rule-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'jingsong-bus-rule-setting-gen',
  '「公车规则」设定生成：惊悚公车小说最核心的创作技能，涵盖公车编号命名法（含20个示例）、外形设计与基调暗示、载客人数的黄金比例、乘客构成比例设计、司机设定方案对比、淘汰机制深度设计（定额/定时/投票）、车厢禁令设计原则与10条高质量示例、以及隐藏规则的艺术设计',
  '"Bus Rules" setting generation: the most critical creative skill in thriller bus novels, covering bus route numbering conventions (with 20 examples), exterior design and tone signaling, optimal passenger count ratios, passenger composition design, driver setting scheme comparisons, in-depth elimination mechanism design (quota / timed / voting), carriage prohibition design principles with 10 high-quality examples, and the art of hidden rule design',
  '## 「公车规则」设定生成 — 惊悚公车小说

「公车规则」是惊悚公车小说的绝对核心。一个精心设计的公车规则体系，是整部小说叙事张力的主要来源。本技能指导如何设计一个令人窒息、逻辑自洽、充满叙事可能性的公车规则设定。

---

### 字段生成指南

#### 1. 公车编号命名法

公车路线编号是读者接触公车的第一个具体符号。一个好的编号要有记忆点、有暗示性、最好让人「越想越不对劲」。

**命名策略**：

**数字的不吉利意象**：利用文化中对特定数字的忌讳或特殊含义
- 4（谐音「死」）、7（七煞、七日丧期）、13（西方不吉利）、49（7×7，道教的超度周期）
- 数字组合暗示「终止」：末位为 0 的路线暗示「归零」，末位为 1 的路线暗示「唯一」

**数字暗藏信息**：用数字隐藏叙事线索
- 编号对应某个日期（出事日期）
- 编号对应某种密码或坐标
- 编号对应某个历史事件

**路线名称的设计**：
- 起点→终点格式：「城北→黄泉路」（地名本身有死亡含义）
- 单一地名格式：「环城线 X 路」（环形暗示无法逃出）
- 代号格式：「特别班次 / 专线 / 加急线」（不在正常班次表上）

**20个编号命名示例及分析**：

1. **44路** — 双重「死」的叠加，最直白的不吉利暗示。简单有效，但略缺深度
2. **749路** — 谐音「去死吧」，但需要在汉语语境中才有效；同时 7 和 9 在某些数字谜中有特殊地位
3. **13路** — 引用西方 13 不吉利的迷信，适合设定中有西方元素的游戏系统
4. **零号线** — 「零」是起点也是终结，是存在也是虚无；「零号」在体制外，没有正式编号
5. **末班特快** — 「末班」已是终点，「特快」让人无法减速，两个词的叠加令人不安
6. **X47路** — X 是未知变量，47 是素数（不能被整除，寓意无法「拆解」这个系统）；X 的存在暗示「真相未知」
7. **死亡谷快线** — 直白到令人不适的程度，反而制造了「这不可能是真实公车名」的违和感，强化荒诞恐怖
8. **7路（第七轮）** — 表面是普通编号，但「第七轮」的隐含含义是这已经是第七次循环，老玩家知道这意味着什么
9. **0049路** — 前置零暗示「体制外」，49 是 7×7，是道教超度 49 天的隐喻
10. **午夜快车 00:00** — 时刻「00:00」是一天的开始也是结束，时间的模糊性制造了「不在正常时间线上」的感觉
11. **倒数线** — 名称本身就是游戏规则的暗示：你的存活时间在倒计时
12. **不归路（单程专线）** — 「不归路」是中文成语（有去无回之意），加上「单程」更为直白
13. **无名线** — 这条路线没有名字，意味着它不存在于任何官方记录中
14. **幽灵班次 G-7** — 「幽灵」的直白恐怖意象，G 可以是 Ghost/Game/Goodbye 的首字母，7 是死亡数字
15. **终点站方向（无终点）** — 在路牌上显示「终点站方向」，但没有标明终点站是哪里；目的地本身是谜
16. **淘汰专线 001** — 「淘汰」直接告知这趟车的功能，「001」暗示这只是第一辆，还有更多
17. **旧城—新世界**（路线名）— 表面上是两个地点，实际上是「死亡旧世界/进入新世界」的隐喻
18. **七月十五日路（路线名）**— 鬼节（中元节）的日期，只有懂文化背景的读者才能立刻察觉
19. **全程约X站（X未知）** — 票面上标注的是「约X站」，没有人知道这辆车究竟会停几站
20. **环城 49 路（永不停止）** — 「环城」是循环，「永不停止」是附在末尾的小字，暗示这辆车根本不会真正抵达终点

**最有效的命名原则**：
- 让读者第一次看到编号时觉得「好像有点奇怪」但说不清为什么
- 在故事推进后，回头看编号时觉得「原来从一开始就在暗示这些」
- 编号不需要让所有读者都立刻理解，但对细心的读者要有奖励

---

#### 2. 公车外形设计

公车的外形是故事基调的视觉宣言。在读者看到任何文字规则之前，公车的外形已经在传递信息。

**三种主要外形方向及对比设计**：

**崭新现代型**

外形特征：车身光洁、内饰全新、灯光充足、座椅整洁、没有任何使用痕迹。

叙事效果：崭新本身是不对劲的信号。现实中的公车总有痕迹，这辆车的「完美」反而令人不安。适合「高科技游戏系统」或「刚刚启动的全新实验」的设定。

恐怖来源：当第一次死亡发生，鲜血出现在这个干净的空间里，对比感极强。

**破旧古老型**

外形特征：车身锈迹斑斑、油漆剥落、座椅破损、窗户有裂缝、荧光灯一闪一闪、内部有难以辨认的污渍。

叙事效果：自带历史感和「这里曾经发生过事情」的暗示。适合强调「这个游戏已经运行了很久」的设定。

恐怖来源：角色（和读者）开始想象那些污渍是什么，那些划痕是谁留下的，这辆车运过多少人。

关键细节设计：在角落发现的前批乘客留下的信息（刻在座椅背后的字、塞在缝隙里的纸条），这些痕迹提供了最真实的历史感。

**完全异常型**

外形特征：公车外观正常，但某一点根本不对——比如窗外的景色是静止的（或不符合行进逻辑的）、比如车厢内没有任何声音从外部传入（绝对隔音）、比如公车的内部比外部看起来大得多。

叙事效果：打破物理常识，直接宣告「这不是普通世界」。适合强调「进入了另一个维度」的超自然设定。

恐怖来源：无法参照正常逻辑来理解眼前的环境，认知框架的瓦解是最深层的恐惧之一。

**外形暗示的其他细节**：

- **广播系统的状态**：正常运作的广播 vs 只能播出特定频率的杂音 vs 广播自动播放无人操控
- **应急设备的状态**：灭火器、安全锤是否存在，是否可以使用（是真正的工具还是道具）
- **座椅的排列方式**：标准排列 vs 面对面排列（强制互相凝视）vs 所有座椅朝向一个方向（朝向什么）
- **窗户的透明度**：可以看清外面 vs 单向镜（只能从外面看进来） vs 完全不透明

---

#### 3. 载客人数设计

人数是公车叙事的底层参数，直接决定了博弈空间的大小和人物刻画的深度。

**为什么推荐 10-20 人的黄金区间**：

| 人数 | 优势 | 劣势 |
|------|------|------|
| 1-5 人 | 每个人都能被深入刻画 | 博弈空间太小，派系无法形成 |
| 6-9 人 | 可以形成小团体 | 存活名额如果是一半，只有 3-4 人死亡，张力有限 |
| **10-20 人** | **博弈空间充足，派系可以形成，但总人数仍可控制** | 需要更谨慎地管理配角的出场频率 |
| 21-40 人 | 可以模拟大规模社会博弈 | 读者很难记住所有人物，大部分死亡会变成数字 |
| 40 人以上 | 更接近真实公车载客量 | 几乎无法让每个死亡都有意义 |

**不同人数的叙事特点**：

**10 人**：每个人都必须有名字和功能，没有真正的匿名「背景板」。死亡 5 人的设定（50%死亡率）让每一轮淘汰都极度紧张。

**15 人**：最平衡的数字。可以有 3-4 个主要人物，4-5 个配角，5-6 个有名字但功能较单一的人。死亡 7 人（略低于 50%）让存活看起来是可能的但不容易。

**20 人**：可以支撑更复杂的派系政治。适合设计 2-3 个独立的小团体，小团体之间的博弈比个人之间的博弈更有组织感。

**人数的戏剧化运用**：

- 开始时不告知总人数——让主角（和读者）自己数
- 通过系统广播每次死亡都宣告当前存活人数，让数字减少本身成为恐怖节奏器
- 在某个时刻发现「实际人数和系统宣告的不一致」，引发「有人在隐藏」的悬念

---

#### 4. 乘客构成比例

新手与老玩家的比例是公车内信息博弈激烈程度的根本参数。

**「1个老玩家 + N个新手」的经典比例为什么好用**：

这个配置之所以成为惊悚公车最经典的设定，原因是：

1. **信息差最大化**：一个人掌握所有信息，其他人一无所知，两种状态的对比制造最强的张力
2. **老玩家身份的隐蔽性**：唯一的老玩家有充分动机伪装成新手（如果暴露身份，会引起所有新手的联合针对）
3. **发现的快感**：当主角发现「原来那个人是老玩家」时，读者和主角一起经历了「原来如此」的快感
4. **道德的复杂性**：一个人 vs 多数人的信息差，让老玩家的每一个行为都充满道德解读空间

**更复杂的构成设计**：

**「2-3个老玩家，比例约 15-20%」**：

优势：老玩家之间可能有历史恩怨（曾经在同一公车上）或者竞争关系（争夺有限资源）。老玩家之间的博弈比新手之间更精彩，因为双方都知道规则。

劣势：需要更多笔墨来建立老玩家的背景，否则他们会显得相同。

**「分层认知」构成**：

不是简单的「知道」和「不知道」，而是分层：
- 完全不知情的新手（从未接触过这个世界）
- 有点了解但没有实战经验的「半老玩家」（可能听说过但没亲身经历）
- 真正的老玩家（完整的副本经历）
- 可能存在的「内鬼」（与系统有特殊关联的人）

这种分层构成让信息博弈更细腻：「半老玩家」是最有趣的角色之一，他们既不是无知的受害者，也不是完全掌握信息的强者。

**乘客构成的隐藏信息**：

- 老玩家数量可以比最初显示的多（有人在伪装新手）
- 老玩家数量可以比玩家意识到的少（某个「看起来很了解情况」的人其实是第一次）
- 「新手」的定义可以被重新定义——某人虽然是第一次进公车副本，但他在另一类副本里是资深玩家

---

#### 5. 司机设定的多种方案

司机是公车最神秘的存在，也是整个恐怖基调的核心符号。司机究竟是谁/是什么，直接影响公车的恐怖类型。

**方案一：完全沉默的人类司机**

设定：司机是真实的人，但从始至终不说一个字、不做任何超出驾驶范围的动作。

恐怖效果：「他知道发生了什么」是最令人不安的存在形式。人类的沉默比任何怪物更令人寒毛竖立，因为他的存在意味着「有人在推动这一切」。

叙事运用：角色会多次试图与司机沟通，但得不到任何回应。是否该强迫司机说话，本身是一个道德难题（如果强迫他，可能触发规则惩罚）。

**方案二：座位上是空的（无人驾驶）**

设定：驾驶席是空的，或者有什么东西坐在那里但不是人，公车自动行驶。

恐怖效果：去掉了人类中介，直接面对「机器/系统」的控制，让「反抗」的对象变得无形。同时，「驾驶席空着但车在动」的视觉本身极度诡异。

叙事运用：角色可以试图篡夺驾驶权，这成为一个高风险高收益的策略选择，而不仅是求救行为。

**方案三：司机面目模糊（任何人都看不清他的脸）**

设定：司机的存在是实体的，但任何人试图仔细看他时，视觉都会「滑开」，无法聚焦——他的面孔永远是模糊的。

恐怖效果：引发「认知边界」的恐惧——当你的感知能力本身变得不可靠，世界的安全感完全瓦解。这是「存在主义恐惧」的高级形式。

叙事运用：「司机的真实身份」成为一个贯穿全书的谜题。是已知角色的伪装？是系统的实体化？还是某种完全无法用语言描述的存在？

**方案四：司机按规则行事（会主动执行淘汰）**

设定：司机不只是驾驶，他是规则的执行者。当有人违规，司机会亲自处理。他的行为完全符合规则逻辑，不会有任何超出规则的动作。

恐怖效果：「规则的化身」比「怪物」更令人绝望——他没有仇恨，没有情感，只是在执行。无法用「讲道理」或「同情」来打动一个规则执行者。

叙事运用：第一次看到司机主动执行淘汰，是整个公车故事最震撼的场景之一。角色必须重新定义「什么是敌人」。

**方案五：司机是上一轮通关失败的乘客**

设定：司机曾经是玩家，在某次游戏中「赢了但输了」——通关了游戏但付出了某种代价，代价是永久成为下一班公车的司机。

恐怖效果：「可能的未来」的恐惧——主角在最后必须思考「如果我选错了，我会不会变成下一个司机」。司机的存在不只是威胁，更是预示。

叙事运用：聪明的角色通过观察司机的行为，可以推测出上一轮公车发生了什么，获取隐藏信息。

**哪种最令人不安**：从纯粹的恐怖效果来看，方案三（面目模糊）和方案一（沉默的人类）产生的长程心理恐惧最强。方案四（规则执行者）的行动场景冲击力最强。最有叙事深度的是方案五（前乘客）。建议根据故事的核心主题选择。

---

#### 6. 淘汰机制设计（重点）

淘汰机制是公车规则体系的核心引擎，决定了博弈的节奏、烈度和道德复杂度。

**「定额存活」机制的戏剧张力设计**：

定额存活的核心问题：存活名额如何产生？

**固定名额型**：一开始就宣告「X人存活」，数字固定不变。

戏剧张力：当名额接近满员时（比如还剩最后 1 个名额），博弈进入最后的疯狂阶段。固定名额让「还剩几个名额」成为最重要的实时信息，读者和角色同步关注。

**动态名额型**：名额随着某些条件变化（完成任务可以增加名额，违规可以减少名额）。

戏剧张力：「名额是可以争取更多的」制造了积极主动的动力；「名额也可能减少」制造了额外的风险管理压力。

**隐藏名额型**：系统不告知存活名额，玩家必须自己推断。

戏剧张力：信息本身成为争夺对象——谁知道真正的名额，谁就掌握了最大的权力。老玩家可能知道，新手不知道，信息差效应最大化。

**「定时淘汰」的时间节点设计**：

第一次死亡最好发生在第几章？

- **太早（第1章）**：读者没有时间建立对人物的情感连接，死亡冲击力低
- **太晚（第5章之后）**：读者开始认为「这里是安全的」，恐惧感已经衰减
- **建议（第2-3章）**：读者刚刚开始喜欢某些人物，死亡的悼念感和冲击力最强

时间间隔的节奏设计：
- 第一次死亡→第二次死亡：间隔要较长（让角色和读者有时间处理第一次死亡的冲击）
- 中段：间隔逐渐缩短（提速感）
- 最后阶段：死亡频率最高，多个淘汰接连发生（最后的清洗）

**「互相投票」机制如何避免变成简单的数字游戏**：

投票淘汰机制的根本问题是「少数服从多数」可能让博弈太简单——找到人数优势就赢了。

让投票博弈复杂化的设计方法：

1. **权重投票**：不同玩家的票数不同（基于等级、积分、或特殊属性）。这让数量优势不再决定一切，质量（高权重票）同样重要
2. **隐藏投票**：投票结果不即时公开，或者投票者身份不公开。「我不知道谁投了我」的不确定感比公开投票更令人不安
3. **双向投票**：不仅要投「淘汰谁」，还要投「保护谁」。保护票数量有限，让玩家同时面临「攻击」和「防御」两个决策维度
4. **后果递延**：投票后不立即执行，结果在某个条件满足时才揭晓。在「等待结果」的过程中，联盟重组和收买可以发生
5. **投票附加条件**：投票前系统给出额外选项——「你可以投 A，但你的积分扣除 10 分」——让每一票都有成本

---

#### 7. 车厢禁令设计原则

禁令是公车规则最直接的恐怖来源。好的禁令必须满足三个条件：

**条件一：可测试（玩家能主动验证禁令是否真实）**

差的禁令：「不能有坏想法」——无法验证，也无法写出测试它的场景

好的禁令：「不能说与游戏规则相关的数字」——可以被测试，且测试过程本身制造紧张感

**条件二：有惩罚梯度（轻微违规和严重违规有不同后果）**

差的禁令：「碰到任何东西都死」——没有梯度，缺乏叙事层次

好的禁令：「每说一次禁止的词语，离下一次淘汰的时间缩短 5 分钟」——有累积效应，可以控制节奏

**条件三：容易误触（普通人在不知情状态下很可能触发）**

差的禁令：「不能主动攻击他人」——需要主动意图，容易规避

好的禁令：「不能用左手触碰窗户」——日常动作，极易在不注意时触发，制造「时时刻刻都在走钢丝」的压迫感

**10条高质量禁令示例**：

1. **「不能在车厢内说出他人的姓名」**——日常沟通中极难避免（「嘿，李明，你觉得呢？」），制造「所有人必须互称代号」的刻意感，同时引发「系统为什么不让人说名字」的疑问，暗示名字有特殊力量

2. **「不能让自己在他人视线中从视野内消失」**——即不能没有被人看见的情况下移动（比如去厕所），要制造「总有人在盯着你」的窒息感，同时引出「如果我不被看见会怎样」的悬念

3. **「不能对任何人说谎」**——听起来是道德约束，但实际执行极其困难；「什么算谎言」的边界会成为重要的解读博弈，同时让所有对话都承载了更大的信息密度

4. **「不能让双脚同时离地」**——让「跌倒」变成了危险行为，但同时暗示了「为什么离地是危险的」这个谜题；可以写一个新手不小心跳起来然后引发后果的场景

5. **「每人只有一个问题的机会（向系统提问）」**——制造「什么问题才值得用」的策略博弈，同时暗示系统是可以被询问的（这本身是一个重要的规则）；浪费了问题机会的角色会后悔

6. **「不能重复同一个动作超过三次」**——看似随机，但可以解读为「避免触发某种机制」；主角如果观察到有人开始第三次重复动作，可以预判后果

7. **「窗户在某些时段不能被触碰；触碰者会看到窗外的东西」**——双层设计：有一个主动惩罚（触碰本身不会立即死亡，但会看到某种东西），「看到了什么」是新的谜题，是诅咒还是信息？

8. **「不能在车厢内保持绝对安静超过 60 秒」**——将「沉默」变成危险，制造角色必须持续制造声音的压迫感；但如何「不打破安静的同时保持安静」的矛盾本身很有意思

9. **「每次淘汰后，所有人必须移动到不同的座位」**——看似无害的规则，但实际上让座位本身成为博弈对象（某个座位可能有特殊属性）；同时强制改变人际关系格局，制造联盟不稳定性

10. **「不能在有人正在被淘汰时发出声音」**——将「目击死亡」变成了高风险行为，强迫所有人用沉默面对死亡。同时制造了一个残忍的困境：如果你试图救人，你会发出声音，你也会被淘汰

**禁令之间的协同设计**：

好的禁令体系不是独立规则的堆砌，而是规则之间有张力和矛盾：

- 规则 A 要求你开口说话，规则 B 要求你保持安静 → 制造「无论怎么做都错」的绝境
- 规则 C 要求你不能重复动作，规则 D 要求你每次淘汰后换座位 → 强制行为本身可能触发其他规则
- 主动违规规则和被动违规规则结合 → 有些错误是你主动犯的，有些是无论如何都会发生的

---

#### 8. 隐藏规则的设计艺术

隐藏规则的「原来如此」时刻是惊悚公车最重要的读者快感来源之一。

**好的隐藏规则需要满足**：

1. **事后来看「一直都在」**：当隐藏规则被揭开，读者应该能够回顾之前的场景，发现规则一直在起作用，只是主角/读者没有意识到

2. **发现过程有合理性**：主角发现隐藏规则不是因为「突然灵光一闪」，而是通过具体的观察、推理或代价换来的信息

3. **发现产生即时影响**：隐藏规则被发现的同时，它应该立刻改变当前的局势——信息不能只是「有趣的知识」，它必须推动剧情

4. **读者和主角同步发现**：最好的时刻是读者在主角说出答案的前半秒刚刚想到了同样的答案——这种同步感制造参与感和爽感

**如何制造「同步发现」的爽感**：

**伏笔的分布密度**：不要把所有线索集中在前两章，而是把 3-5 个线索分散在不同的场景中：
- 第一个线索：存在但微弱，读者不会特别注意
- 第二个线索：稍微明显，读者可能有一个模糊的感觉
- 第三个线索：足够触发推理，读者开始建立联系
- 揭露时刻：主角/读者同步完成推理，产生「啊！就是这样！」的瞬间

**隐藏规则的几种经典设计模式**：

**「条件型」**：规则只在特定条件下激活。例如：「只有在偶数车站停靠时，某个规则才生效」——读者会开始数车站，线索一直存在

**「反义型」**：隐藏规则与表面规则正好相反。例如：系统广播「不能碰窗户」，但实际隐藏规则是「必须定时碰窗户，否则会触发另一个机制」

**「人物绑定型」**：隐藏规则绑定在特定角色身上。例如：「只要X在场，Y规则就不生效」——当X死亡，Y规则突然激活

**「叠加型」**：两个看起来独立的规则实际上是一个更大规则的两半。当主角发现把两条规则合并理解时，出现了完全不同的含义

**隐藏规则被发现时必须避免的陷阱**：

- **解释太啰嗦**：主角发现隐藏规则后花了整章来向读者解释——应该让行动来展示理解，而不是独白
- **发现太晚失去叙事价值**：如果隐藏规则在最后两章才被发现，已经没有足够的空间展示它的影响
- **读者早就猜到了却没有揭露**：如果线索太明显，读者提前猜到了，但作者在许多章节后才「揭露」，会让读者感到不耐烦

---

### 生成要点总结

- 公车编号命名要同时满足「首次阅读时有点奇怪」和「回溯时觉得早有暗示」两个标准
- 外形设计要在第一页就传递基调信号，外形不只是描写，是叙事的组成部分
- 10-20 人是博弈空间与人物刻画深度之间的最佳平衡点，15 人是最推荐的数字
- 乘客构成的「分层认知」设计比简单的新手/老玩家二分法更有叙事可能性
- 司机设定选择决定了公车的恐怖类型（生存恐惧/认知恐惧/宿命恐惧），要与全书基调匹配
- 淘汰机制的设计必须回答「为什么不能绕过」和「如何防止变成纯数字游戏」两个问题
- 禁令必须同时满足可测试性、惩罚梯度和容易误触三个条件
- 隐藏规则的「原来如此」爽感来自于伏笔密度的控制和读者与主角同步发现的精确设计',
  '## "Bus Rules" Setting Generation — Thriller Bus Novel

"Bus rules" are the absolute core of the thriller bus novel. A carefully designed bus rule system is the primary source of the entire novel''s narrative tension. This skill guides how to design bus rules that are suffocatingly tense, logically coherent, and full of narrative possibilities.

---

### Field Generation Guide

#### 1. Bus Route Numbering Conventions

The bus route number is the first concrete symbol readers encounter on the bus. A good number must be memorable, carry implicit meaning, and ideally make readers think "something feels more and more wrong about this."

**Naming strategies**:

**Inauspicious number imagery**: Exploit cultural associations with specific unlucky or significant numbers
- 4 (sounds like "death" in Chinese), 7 (seven malevolent stars; seven-day mourning period), 13 (Western bad luck), 49 (7×7; the 49-day Taoist rite of passage)
- Number combinations implying "termination": routes ending in 0 imply "zeroing out"; routes ending in 1 imply "the only one"

**Numbers hiding information**: Using numbers to conceal narrative clues
- Numbers corresponding to a specific date (the date something happened)
- Numbers corresponding to a code or coordinates
- Numbers corresponding to a historical event

**Route name design**:
- Origin→Destination format: "North City → Huangquan Road" (the place name itself has death connotations)
- Single place name format: "Ring City Line X" (circular route implies no escape)
- Code format: "Special Run / Express / Emergency Line" (not on any official schedule)

**20 numbering examples with analysis**:

1. **Route 44** — Double "death" stacked; the most blunt inauspicious hint. Simple and effective, but slightly lacking depth
2. **Route 749** — A phonetic pun in Chinese meaning "go die," effective only in Chinese-language context; 7 and 9 also have special significance in certain number puzzles
3. **Route 13** — Invokes Western superstition about 13; suited for game systems with Western elements in the setting
4. **Line Zero** — "Zero" is both beginning and end, both existence and void; "Zero" is off-system, without an official number
5. **Last Run Express** — "Last run" already implies an end; "express" means no slowing down — the combination of the two words is unsettling
6. **Route X47** — X is an unknown variable; 47 is a prime number (cannot be divided, implying this system "cannot be broken down"); X implies "truth unknown"
7. **Death Valley Express** — Blunt to the point of discomfort, creating a sense of wrongness: "this cannot be a real bus name," intensifying absurdist horror
8. **Route 7 (Seventh Round)** — Appears to be an ordinary number, but the implied meaning of "seventh round" suggests this is already the seventh cycle; veterans know what this means
9. **Route 0049** — Leading zeros suggest "off-system"; 49 is 7×7, a metaphor for the Taoist 49-day rite of transcendence
10. **Midnight Express 00:00** — "00:00" is both the beginning and end of a day; the temporal ambiguity creates a feeling of "being outside the normal timeline"
11. **Countdown Line** — The name itself is a hint about the game''s rules: your survival time is counting down
12. **Point of No Return (One-Way Express)** — A Chinese idiom meaning "no way back," made even more explicit by "one-way"
13. **Unnamed Line** — This route has no name, meaning it does not exist in any official record
14. **Ghost Run G-7** — The direct horror imagery of "ghost"; G can stand for Ghost/Game/Goodbye; 7 is a death number
15. **Direction: Terminal Station (No Terminal Listed)** — Displays "Direction: Terminal Station" on the route sign but doesn''t specify which terminal; the destination itself is a mystery
16. **Elimination Express 001** — "Elimination" directly announces this bus''s function; "001" implies it''s just the first, with more to come
17. **Old City → New World** (route name) — On the surface, two locations; in practice, a metaphor for "dying in the old world / entering the new"
18. **July 15th Road** (route name) — The date of Ghost Festival (Zhongyuan Festival); only readers with cultural background will immediately recognize it
19. **Total Stops: Approximately X (X Unknown)** — The ticket reads "approximately X stops"; no one knows how many stops this bus will actually make
20. **Ring City Route 49 (Never Stops)** — "Ring City" is a loop; "Never Stops" is fine print at the end, implying the bus will never truly arrive at a destination

**Most effective naming principles**:
- Make readers feel "something seems a bit off" the first time they see the number, without knowing why
- After the story progresses, looking back at the number makes readers feel "this was hinting at all of this from the very beginning"
- The number does not need to be immediately understood by all readers, but should reward attentive ones

---

#### 2. Bus Exterior Design

The bus exterior is a visual declaration of the story''s tone. Before readers see any written rules, the exterior is already transmitting information.

**Three main exterior directions and comparative design**:

**Brand New / Modern Type**

Exterior characteristics: Gleaming bodywork, brand-new interior, ample lighting, immaculate seats, no signs of use whatsoever.

Narrative effect: The newness is itself a warning signal. Real buses always show wear; this bus''s "perfection" is unsettling. Suited to settings with a "high-tech game system" or "a freshly launched new experiment."

Horror source: When the first death occurs and blood appears in this pristine space, the contrast is visceral.

**Worn / Ancient Type**

Exterior characteristics: Rust on the body, peeling paint, damaged seats, cracked windows, flickering fluorescent lights, indistinguishable stains inside.

Narrative effect: Carries a built-in sense of history and the implication that "things have happened here before." Suited to settings that emphasize "this game has been running for a long time."

Horror source: Characters (and readers) begin to imagine what the stains are, who left the scratches, how many people this bus has carried.

Key detail design: Information left by previous passengers found in corners (words carved into the back of a seat, notes stuffed into cracks) — these traces provide the most authentic sense of history.

**Completely Anomalous Type**

Exterior characteristics: The bus looks normal, but one thing is fundamentally wrong — for example, the scenery outside the window is frozen (or does not correspond to the bus''s movement), or no sound from outside enters the carriage (perfect soundproofing), or the interior of the bus is substantially larger than it appears from outside.

Narrative effect: Breaks the laws of physics, immediately announcing "this is not a normal world." Suited to supernatural settings that emphasize "entering another dimension."

Horror source: The inability to apply normal logic to the environment in front of you — the collapse of one''s cognitive framework is among the deepest forms of fear.

**Other exterior details that signal tone**:

- **Status of the intercom system**: Normally functioning vs. only able to broadcast static at specific frequencies vs. playing automatically with no visible operator
- **Status of emergency equipment**: Whether fire extinguishers and safety hammers exist and can actually be used (real tools vs. props)
- **Seat arrangement**: Standard rows vs. face-to-face (forced mutual gaze) vs. all seats facing one direction (facing what?)
- **Window transparency**: Clearly see outside vs. one-way mirror (only visible from outside) vs. completely opaque

---

#### 3. Passenger Count Design

Passenger count is the foundational parameter of bus narrative, directly determining the scale of the strategy space and the depth of character portrayal.

**Why the 10-20 person golden range is recommended**:

| Count | Advantages | Disadvantages |
|-------|-----------|---------------|
| 1–5 people | Every person can be deeply portrayed | Strategy space too small; factions cannot form |
| 6–9 people | Small groups can form | If half survive, only 3-4 die; tension is limited |
| **10–20 people** | **Sufficient strategy space; factions can form; total count is still manageable** | Must manage supporting character appearance frequency more carefully |
| 21–40 people | Can simulate large-scale social strategy | Readers struggle to remember everyone; most deaths become numbers |
| 40+ people | Closer to real bus capacity | Almost impossible to make every death meaningful |

**Narrative characteristics of different counts**:

**10 people**: Every person must have a name and function; there are no truly anonymous "background figures." Setting 5 deaths (50% mortality rate) makes every elimination extremely tense.

**15 people**: The most balanced number. Allows for 3-4 main characters, 4-5 supporting characters, and 5-6 people with names but simpler functions. Setting 7 deaths (slightly below 50%) makes survival seem possible but difficult.

**20 people**: Can support more complex factional politics. Suited to designing 2-3 independent small groups; inter-group dynamics have more organizational texture than purely individual dynamics.

**Dramatic uses of passenger count**:

- Do not announce the total count at the start — let the protagonist (and readers) count themselves
- Have the system broadcast the current survivor count after each death, making the diminishing numbers themselves a horror pacing device
- At some point, discover that "the actual count and the system''s announced count are inconsistent," creating the suspense of "someone is hiding"

---

#### 4. Passenger Composition Design

The ratio of newcomers to veterans is the foundational parameter for the intensity of information-based strategy on the bus.

**Why "1 veteran + N newcomers" is the classic ratio that works**:

This configuration has become the most classic setting in thriller bus fiction for these reasons:

1. **Maximum information asymmetry**: One person holds all the information; everyone else knows nothing — the contrast between these two states creates maximum tension
2. **The veteran''s incentive to hide**: The sole veteran has ample motivation to disguise themselves as a newcomer (exposure would lead to all newcomers ganging up against them)
3. **The joy of discovery**: When the protagonist discovers "that person is actually a veteran," readers and protagonist together experience the pleasure of "so that''s what was happening"
4. **Moral complexity**: The information asymmetry of one vs. many lends every veteran action rich potential for moral interpretation

**More complex composition designs**:

**"2-3 veterans, approximately 15-20% of passengers"**:

Advantages: Veterans may have history with each other (were on the same bus before) or be in competition (fighting over limited resources). Veteran-vs.-veteran dynamics are more interesting than newcomer-vs.-newcomer, because both sides know the rules.

Disadvantages: Requires more writing to establish veterans'' backgrounds; otherwise they will seem the same.

**"Layered awareness" composition**:

Not a simple "knows" vs. "doesn''t know" binary, but a spectrum:
- Completely uninformed newcomers (have never encountered this world)
- "Semi-veterans" with some knowledge but no hands-on experience (may have heard about it but never lived it)
- True veterans (complete instance experience)
- Possibly existing "insiders" (people with special connections to the system)

This layered composition makes the information game more nuanced: the "semi-veteran" is one of the most interesting character types — neither a helpless victim nor an all-knowing powerhouse.

**Hidden information in passenger composition**:

- The number of veterans may be higher than initially apparent (someone is disguising as a newcomer)
- The number of veterans may be lower than players realize (someone who "seems very informed" is actually on their first run)
- The definition of "newcomer" can be redefined — someone may be entering a bus instance for the first time, but is a seasoned veteran in another type of instance

---

#### 5. Driver Setting Schemes

The driver is the most mysterious presence on the bus and the central symbol of the entire horror tone. Who or what the driver is directly affects the type of horror the bus generates.

**Scheme One: Completely Silent Human Driver**

Setting: The driver is a real person, but says not a single word and makes no movements beyond driving throughout the entire ride.

Horror effect: "They know what is happening" is the most unsettling form of presence. A human''s silence is more hair-raising than any monster, because their existence implies "someone is orchestrating all of this."

Narrative use: Characters will repeatedly attempt to communicate with the driver but receive no response at all. Whether to force the driver to speak is itself a moral dilemma (doing so may trigger a rule penalty).

**Scheme Two: The Seat Is Empty (Unmanned)**

Setting: The driver''s seat is empty, or something is sitting there that is not a person; the bus drives automatically.

Horror effect: Removing the human intermediary means facing direct control by "a machine / the system," making the object of resistance formless. The visual of "the driver''s seat is empty but the bus is moving" is itself deeply uncanny.

Narrative use: Characters can attempt to seize control of the driving, making this a high-risk, high-reward strategic option rather than merely a rescue behavior.

**Scheme Three: Face Is Indistinct (No One Can See It Clearly)**

Setting: The driver has physical presence, but whenever anyone tries to look carefully, their vision "slides away" and cannot focus — the face is always blurred.

Horror effect: Triggers fear of "cognitive boundaries" — when your own perceptual capacity becomes unreliable, the sense of safety in the world completely collapses. This is an advanced form of existential fear.

Narrative use: "The driver''s true identity" becomes a mystery running through the entire book. Is it a disguised known character? A physical manifestation of the system? Or something that cannot be described in language at all?

**Scheme Four: Driver Acts According to Rules (Actively Executes Eliminations)**

Setting: The driver doesn''t just drive — they are the executor of rules. When someone violates a rule, the driver personally handles it. Their behavior fully conforms to the rule logic; they will not take any action beyond the rules.

Horror effect: "The embodiment of rules" is more despairing than a monster — it has no hatred, no emotion, only executes. You cannot move a rule executor with reason or sympathy.

Narrative use: The first time the driver is seen actively carrying out an elimination is one of the most shocking scenes in the entire bus story. Characters must redefine "what is an enemy."

**Scheme Five: Driver Is a Passenger Who Failed the Previous Run**

Setting: The driver was once a player who "won but lost" in a previous game — passed the game but paid some kind of price; the price is becoming the driver of the next bus permanently.

Horror effect: Fear of "a possible future" — near the end, the protagonist must contemplate "if I make the wrong choice, will I become the next driver?" The driver''s existence is not only a threat but a premonition.

Narrative use: A clever character who observes the driver''s behavior can deduce what happened in the previous bus run, obtaining hidden information.

**Which is most unsettling**: From a pure horror-effect standpoint, Scheme Three (indistinct face) and Scheme One (silent human) generate the strongest long-lasting psychological fear. Scheme Four (rule executor) has the strongest impact in action scenes. The deepest narrative resonance belongs to Scheme Five (former passenger). Choose based on the story''s core theme.

---

#### 6. Elimination Mechanism Design (Priority Field)

The elimination mechanism is the core engine of the bus rule system, determining the pace, intensity, and moral complexity of all strategy.

**Designing dramatic tension for the "fixed survival quota" mechanism**:

The central question of fixed quotas: How are survival slots produced?

**Fixed quota type**: The announcement is made from the start that "X people survive," with the number immutable.

Dramatic tension: As slots approach capacity (e.g., only 1 remaining), the game enters its final frenzy. A fixed quota makes "how many slots remain" the most important real-time information; readers and characters track it together.

**Dynamic quota type**: Quota changes based on certain conditions (completing tasks can increase quota; violations can decrease it).

Dramatic tension: "The quota can be increased" creates proactive motivation; "the quota can also decrease" creates additional risk management pressure.

**Hidden quota type**: The system does not announce the survival quota; players must deduce it themselves.

Dramatic tension: Information itself becomes the primary object of competition — whoever knows the true quota holds the greatest power. Veterans may know; newcomers don''t; information asymmetry is maximized.

**Designing time nodes for "timed elimination"**:

Which chapter should the first death occur in?

- **Too early (Chapter 1)**: Readers have not had time to build emotional connections with characters; the death''s impact is low
- **Too late (After Chapter 5)**: Readers begin to believe "it is safe here"; fear has already waned
- **Recommended (Chapters 2-3)**: Readers have just begun to like certain characters; the grief and impact of the death are at their strongest

Pacing design for time intervals:
- First death → second death: Longer interval (give characters and readers time to process the first death)
- Middle section: Intervals gradually shorten (acceleration)
- Final section: Highest death frequency; multiple eliminations occur in rapid succession (the final purge)

**How "mutual voting" avoids becoming a simple numbers game**:

The fundamental problem with voting elimination is that "majority rules" can make strategy too simple — find numerical advantage and win.

Design methods to complicate voting dynamics:

1. **Weighted voting**: Different players have different numbers of votes (based on level, points, or special attributes). This means numerical advantage no longer determines everything; quality (high-weight votes) matters equally
2. **Hidden voting**: Results are not published immediately, or voter identities are not disclosed. The uncertainty of "I don''t know who voted for me" is more unsettling than open voting
3. **Two-directional voting**: Players vote not only for "who to eliminate" but also "who to protect." Protection votes are limited, forcing players to simultaneously face two decision dimensions: offense and defense
4. **Delayed consequences**: After voting, execution is not immediate; results are revealed only when a certain condition is met. During the "waiting for results" period, alliance reorganization and vote-buying can occur
5. **Conditional voting**: Before voting, the system offers additional options — "You can vote for A, but your points will be deducted by 10" — making every vote have a cost

---

#### 7. Carriage Prohibition Design Principles

Prohibitions are the most direct source of horror in bus rules. Good prohibitions must satisfy three conditions:

**Condition One: Testable (players can actively verify whether a prohibition is real)**

Bad prohibition: "Cannot have bad thoughts" — impossible to verify; cannot write scenes where it is tested

Good prohibition: "Cannot say numbers related to game rules" — can be tested; the testing process itself generates tension

**Condition Two: Graduated penalties (minor violations and serious violations have different consequences)**

Bad prohibition: "Touch anything and die" — no gradient; lacks narrative layers

Good prohibition: "Every time a prohibited word is spoken, time until the next elimination is shortened by 5 minutes" — has a cumulative effect; pacing can be controlled

**Condition Three: Easy to trigger accidentally (ordinary people in an uninformed state will very likely set it off)**

Bad prohibition: "Cannot actively attack others" — requires active intent; easy to avoid

Good prohibition: "Cannot touch the window with the left hand" — an everyday motion; extremely easy to trigger without noticing; creates the pressure of "walking a tightrope every moment"

**10 high-quality prohibition examples**:

1. **"Cannot say another person''s name inside the carriage"** — Extremely difficult to avoid in everyday communication ("Hey, Li Ming, what do you think?"); creates the intentional awkwardness of "everyone must address each other by code"; simultaneously raises the question "why does the system forbid saying names," implying names hold special power

2. **"Cannot disappear from another person''s line of sight"** — I.e., cannot move without being seen by someone (such as going to the restroom); creates the suffocating feeling of "someone is always watching you"; simultaneously introduces the suspense of "what happens if I''m not seen"

3. **"Cannot lie to anyone"** — Sounds like a moral constraint, but is extremely difficult to execute in practice; the edge of "what counts as a lie" becomes a major interpretive battleground; simultaneously makes every conversation carry greater information density

4. **"Cannot let both feet leave the ground at the same time"** — Makes "falling" a dangerous act; simultaneously hints at the puzzle "why is leaving the ground dangerous"; can write a scene where a newcomer accidentally jumps and triggers consequences

5. **"Each person has only one chance to ask a question (directed at the system)"** — Creates the strategic game of "what question is worth using my chance on"; simultaneously implies the system can be queried (which is itself an important rule); a character who wastes their question opportunity will regret it

6. **"Cannot repeat the same action more than three times"** — Seemingly random, but can be interpreted as "avoid triggering a certain mechanism"; if the protagonist observes someone starting their third repetition of an action, consequences can be anticipated

7. **"Windows cannot be touched during certain time periods; those who touch them will see something outside"** — Dual design: an active consequence (touching does not cause immediate death, but the person will see something); "what they see" is a new mystery: is it a curse or information?

8. **"Cannot maintain absolute silence inside the carriage for more than 60 seconds"** — Transforms "silence" into danger; creates pressure where characters must continuously generate sound; the inherent contradiction of "staying quiet without being quiet" is interesting

9. **"After each elimination, everyone must move to a different seat"** — Appears harmless, but actually makes seats themselves objects of strategy (a certain seat may have special properties); also forces the reconfiguration of interpersonal dynamics, creating alliance instability

10. **"Cannot make any sound while someone is being eliminated"** — Transforms "witnessing death" into high-risk behavior; forces everyone to face death in silence. Simultaneously creates a cruel dilemma: if you try to save someone, you make a sound, and you will also be eliminated

**Coordinated prohibition system design**:

A good prohibition system is not a pile of independent rules but a set of rules that create tension and contradiction with each other:

- Rule A requires you to speak; Rule B requires you to stay silent → creates a "no matter what you do, it''s wrong" desperate situation
- Rule C requires you not to repeat actions; Rule D requires you to change seats after each elimination → forced behavior may trigger other rules
- Combining active violation rules with passive violation rules → some mistakes are ones you make actively; others will happen no matter what

---

#### 8. The Art of Hidden Rule Design

The "aha moment" of hidden rules is one of the most important sources of reader satisfaction in thriller bus fiction.

**What a good hidden rule must achieve**:

1. **"Was always there" in retrospect**: When the hidden rule is revealed, readers should be able to look back at earlier scenes and realize the rule had been operating all along — they and the protagonist simply hadn''t noticed

2. **The discovery process has logical integrity**: The protagonist doesn''t discover the hidden rule through a sudden flash of insight, but through concrete observation, reasoning, or information purchased at a price

3. **Discovery has immediate impact**: The moment a hidden rule is discovered, it should immediately change the current situation — information cannot merely be "an interesting fact"; it must drive the plot forward

4. **Reader and protagonist discover simultaneously**: The best moment is when the reader arrives at the same answer half a second before the protagonist voices it — this synchronization creates engagement and satisfaction

**How to create the satisfaction of "simultaneous discovery"**:

**Clue density distribution**: Do not cluster all clues in the first two chapters; scatter 3-5 clues across different scenes:
- First clue: Present but faint; readers will not pay special attention
- Second clue: Slightly more apparent; readers may have a vague feeling
- Third clue: Sufficient to trigger reasoning; readers begin connecting the dots
- Revelation moment: Protagonist/reader complete the reasoning together, producing an "Ah! That''s it!" instant

**Several classic hidden rule design patterns**:

**"Conditional type"**: The rule only activates under specific conditions. Example: "Certain rules only take effect when the bus stops at even-numbered stations" — readers will start counting stations; the clue was always there

**"Opposite type"**: The hidden rule is the reverse of the surface rule. Example: The system broadcasts "Cannot touch the window," but the actual hidden rule is "Must periodically touch the window, or another mechanism will be triggered"

**"Character-bound type"**: The hidden rule is bound to a specific character. Example: "As long as X is present, Rule Y does not take effect" — when X dies, Rule Y suddenly activates

**"Composite type"**: Two seemingly independent rules are actually two halves of a larger rule. When the protagonist realizes that merging two rules produces a completely different meaning, the revelation emerges

**Traps to avoid when hidden rules are revealed**:

- **Over-explanation**: After the protagonist discovers the hidden rule, spending an entire chapter explaining it to readers — let actions demonstrate understanding instead of a monologue
- **Too late to have narrative value**: If the hidden rule is only discovered in the final two chapters, there is insufficient space left to show its impact
- **Readers guessed long ago but it wasn''t revealed**: If clues are too obvious and readers figured it out early, but the author only "reveals" it many chapters later, readers will feel impatient

---

### Summary of Generation Notes

- Bus route numbering must satisfy two standards simultaneously: "feels slightly off on first reading" and "felt like it was hinting at all of this in retrospect"
- Exterior design must transmit tone signals on the very first page; the exterior is not just description — it is a narrative component
- 10-20 passengers is the optimal balance between strategy space and depth of character portrayal; 15 is the most recommended number
- A "layered awareness" passenger composition offers more narrative possibilities than a simple newcomer / veteran binary
- Driver setting choice determines the type of horror the bus generates (survival fear / cognitive fear / fatalistic fear); must match the overall tone of the book
- Elimination mechanism design must answer two questions: "why can''t it be bypassed" and "how to prevent it from becoming a pure numbers game"
- Prohibitions must simultaneously satisfy testability, graduated penalties, and accidental trigger-ability
- The "aha" satisfaction of hidden rules comes from controlling clue density and the precise design of reader-protagonist synchronized discovery',
  (SELECT id FROM novel_creation_method WHERE name = '惊悚公车小说' LIMIT 1),
  1,
  82,
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
