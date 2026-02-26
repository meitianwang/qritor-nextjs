-- 惊悚公车小说角色生成技能
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '惊悚公车小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-jingsong-bus-character-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'jingsong-bus-character-gen',
  '角色生成：为惊悚公车小说设计各类乘客角色，包括新手玩家、老玩家、伪装者/内奸、司机和各类功能型角色的设计方法，以及死亡叙事的冲击力设计',
  'Character generation: design passengers for thriller bus novels, including new players, veteran players, impostors/traitors, the driver, functional character types, and death narrative impact design',
  '## 角色生成 — 惊悚公车小说

公车上的角色设计是这个类型最核心的叙事资产。在一辆封闭的公车里，每一个人既是潜在的盟友，也是潜在的威胁。角色必须既有独立的人格和功能，又在群体动态中产生化学反应。公车类型的特殊之处在于：所有角色从一开始就处于"必须互相依赖但又互相怀疑"的结构性张力中。

---

### 字段生成指南

#### 新手玩家设计

新手玩家不应该只是"不懂规则的弱者"——这样的设计浪费了这个角色类型在公车叙事中的功能价值。优秀的新手设计有两个核心要素：他们在"游戏规则"上是盲目的，但在某个特定领域有独特的能力，这种能力在公车上恰好能发挥作用。

**功能性新手的设计方向**：

| 职业/特长 | 公车上的独特价值 | 功能性危机设计 |
|---------|--------------|-------------|
| 急诊护士 | 唯一能处理伤者的人，生死判断专业 | 在没有任何医疗设备的情况下，必须用车上有限物资完成处置 |
| 退役刑警 | 习惯性观察行为细节，能识别谎言 | 但职业本能让他过度怀疑所有人，反而成为群体信任的破坏者 |
| 建筑设计师 | 能精确感知空间结构，快速理解公车的布局异常 | 发现车身有隐藏夹层，但打开它意味着触发系统的某条规则 |
| 心理咨询师 | 能快速分析他人的行为动机，在危机中稳定群体情绪 | 当发现有人表现出"被控制/被操纵"的迹象时，如何在不引起恐慌的情况下发出警告 |
| 速记员/法庭书记 | 能精确记录所有发生的事，建立规则清单 | 记录能力让他成为"公车历史的见证者"，但也成为他人想要消灭的信息威胁 |

**新手的成长设计**：新手不应该从"什么都不懂"直接跳跃到"能力全开"——他们应该有一个可信的学习过程，这个过程的代价是真实的（试错带来的伤害，或目睹他人死亡的创伤）。

**新手的核心叙事功能**：
1. **规则解释的自然载体**：通过新手的疑问，让规则自然地被解释给读者，而不需要"叙事者直接说明"
2. **恐惧基准线**：新手的恐惧反应是正常人在这种处境下的参照系——他们的崩溃、求生本能、和脆弱，让读者感同身受
3. **意外的转折来源**：正因为新手不了解规则，他们有时会做出老玩家不会做的选择，这种"无知者的行动"往往会打破既有格局

#### 老玩家的黄金设计原则

老玩家是公车上最危险的存在，也是最复杂的角色设计挑战。他们的价值来自信息垄断和经验优势，但这两种优势都有代价。

**老玩家的信息控制策略**：

老玩家不是"全知者"——他们经历过若干次游戏，知道部分规则，但每次游戏的规则都会有微调，他们的经验是有局限性的。好的老玩家设计利用这种"部分知识"来制造张力：

**透露策略类型**：
- **分批透露型**：知道十条规则，前期只说两条，用信息换保护——当有人质疑他为什么不一开始就全说，他的回答要足够有说服力（"告诉你们太多，你们反而不会按规则行事；让你们在有限信息下做决定，你们会更谨慎"）
- **偏差透露型**：透露的规则是真实的，但他刻意忽略了某个关键例外情况——不是主动撒谎，但选择性的真实比谎言更难被揭穿
- **压力测试型**：先给出一个规则，观察其他人的反应，根据反应决定是否透露更多——他在评估谁值得信任，谁是潜在威胁
- **误导型**（高风险设计）：透露的是真实规则，但制造了一种"这条规则对他有利"的假象——实际上他的真实目的与表面上完全不同

**让读者"既依赖又不信任"的写法**：
- 老玩家的建议总是在最关键的时刻发挥作用，让主角不得不承认他是有价值的
- 但他的某些行为细节（对某些人死亡的反应太冷静、在某个时刻的位置太巧合、对某个规则的预判太准确）让人觉得他知道的远不止这些
- 他从不主动解释自己的动机，当被追问时，他的回答方式是"回答了，但没有完全回答"

**老玩家的内在矛盾**：
老玩家经历过太多死亡，他们的某些决策逻辑已经不是"普通人"的逻辑——他们会做出在道德上让人不舒服的权衡（牺牲弱势成员来换取更高的整体存活率），而且他们对这种权衡没有明显的愧疚。这种"合理但冷漠"的特质让他们既是最有价值的盟友，也是最让人不安的存在。

#### 伪装者/内奸设计

公车上有人表面是普通玩家，实则是系统NPC、上一轮的幸存者伪装进来的、或者有其他隐藏身份。伪装者是公车叙事中最高风险、高回报的角色设计。

**伪装者的三种来源设定**：

**系统NPC**
- 他们存在的目的：监控、激活特定规则、在玩家中制造特定事件
- 他们的行为特征：在关键时刻出现在最有利的位置，对规则的理解超出正常玩家水平，在某些恐惧场景中反应异常平静
- 揭露方式：不应该是"主角突然猜到了"，而是通过一系列不可解释的细节逐渐指向这个结论（他从不饿，他从不需要上厕所，他总是在重要事件发生前出现在事发地点）

**上一轮幸存者**
- 他们存在的目的：可能是系统让他们回来，也可能是他们主动选择回来（寻找某人/报复某人/获取某样东西）
- 他们的行为特征：对公车的某些细节异常熟悉，有时会下意识地对从来没被提过的规则做出预防性行为，在某些死亡场景中会表现出与当下遭遇不符的深层恐惧（因为他见过更糟的版本）
- 揭露时机：中期揭露（三分之一到二分之一处）效果最好——揭露后，读者会重新审视他之前所有行为，发现大量"原来如此"的细节

**双面人（表面老玩家，实为内奸）**
- 提供的信息是真实的，但他们有一个隐藏议程（消灭特定目标，让特定人活下来，完成某个不为人知的任务）
- 揭露前的伏笔埋设：他总是在"A和B两个人必须有一个死"的局面中，用看似中立的方式推动选择，但最终受益的总是同一个方向

**揭露的时机和方式**：
- **不要在读者完全猜到之前揭露**：读者应该有"怀疑→被故事否定→再度怀疑→揭露"的完整过程
- **揭露前必须有三条伏笔**：至少三个细节在揭露后可以被读者回想起来，形成"原来那时候就已经……"的满足感
- **揭露后的后续处理**：揭露不是结束——伪装者的真实目的和接下来的行为，通常比揭露本身更有叙事价值

#### 司机设计（特殊）

司机是公车叙事中最诡异、最有可塑性的角色。他处于所有乘客的视线前方，控制着公车的行驶，却几乎不与任何人直接互动——这种存在方式本身就构成了叙事上的特殊张力。

**五种司机设定的恐怖效果对比**：

| 司机类型 | 恐怖来源 | 叙事特点 | 适合的故事基调 |
|---------|---------|---------|-------------|
| 真人（被迫参与） | 他是另一个受害者，但拥有特殊权力；他的道德困境（是否帮助乘客）制造持续张力 | 中期可以和主角形成某种沟通，成为信息来源 | 人性探索型 |
| 早已死亡 | 开车的是尸体，或者说开车的是"附着在尸体上的什么东西" | 当有人靠近驾驶席时，视角会是最可怕的 | 纯恐怖型 |
| 不存在 | 驾驶席空着，公车自行行驶 | 乘客永远不知道公车"被什么驾驶"，恐惧来自不可见的控制力量 | 系统/神秘力量型 |
| 是鬼 | 开车的是这辆公车历史事故中死去的司机，他的"任务"是把这些乘客带到他当年"应该到的终点" | 可以通过调查公车历史来理解司机的动机，恐惧和悲悯并存 | 恐怖+情感型 |
| 是系统本体 | 司机不是人，他是系统的具象化，他的存在意味着"系统一直在现场观察" | 当主角试图与司机沟通时，会意识到他们在和整个系统的意志对话 | 宏大叙事型 |

**司机互动设计原则**：
- 司机的"沉默"比任何一种活跃行为都更有威慑力——让他偶尔做出细微动作（挡风玻璃上的一瞥、方向盘的轻微调整），比让他直接行动更恐怖
- 即使司机是活人，也应该长时间不直接交流——逐渐建立"试图沟通"的情节，而不是开篇就给出答案
- 广播声音与司机身体的关系：广播声音是否是司机的声音？如果是，那司机为什么不直接转身说？如果不是，那谁在控制广播？

#### 角色功能分工

一辆公车上需要不同功能的角色共同存在，才能制造足够的叙事维度。以下是关键功能类型及具体角色设计示例。

**信息掌握者**
- 掌握特殊信息（规则细节/公车历史/系统背景）
- 功能：是博弈的核心资产，所有人都想靠近，但接近他有风险
- 示例一：**莫远，45岁，退休档案员**。上车前刚从某档案馆离职，恰好整理过一批与这条公车路线相关的历史事故卷宗，对路线本身有独家知识。他不主动透露，但别人说出的细节会触发他的记忆，让他不经意间透露出片段
- 示例二：**陈九，32岁，系统工程师**。曾经参与某个和这个系统有技术关联的项目（他本人不知道）。他的职业本能让他总是在试图"破解"规则的机制，但他的推断有时会把规则推进到危险的方向

**体力担当**
- 负责实际的体能任务（阻挡威胁/物理探索/保护弱势成员）
- 功能：表面上是群体的武器，但体力优势在密室中也构成威胁——他有能力单独行动
- 示例一：**宋平，28岁，消防员**。救援训练背景让他在危机中保持冷静，有破拆技能可以处理物理障碍。他的困境：他的所有训练都是基于"没有人是敌人"的假设，而公车打破了这个假设
- 示例二：**林翠，19岁，武术特长生**。正在参加省级武术比赛途中，背着装备包上的车。她的速度和反应力让她在初期很有优势，但她的对抗本能让她在必须依靠谋略而非力量的局面中判断失误

**情绪炸弹**
- 情绪不稳定，随时可能引发群体冲突
- 功能：是叙事张力的催化剂，他们的爆发打破平静，迫使其他人做出反应
- 示例一：**吴建国，52岁，下岗工人**。对这趟车充满怨气（他今天的行程本来是去讨债），愤怒的底色让他在任何博弈中都倾向于对抗而非妥协。他的"出格行为"有时反而莫名其妙地解决了一个问题，有时又制造了更大的麻烦
- 示例二：**小雨，16岁，高中生**。她的情绪不稳定不是来自愤怒，而是来自对"死亡"这件事的前所未有的直面。她的崩溃时刻是真实的，而她恢复的时刻也是真实的——她比任何成年人都更快地接受了"这就是现在的现实"

**隐藏变量**
- 表面看不出特殊之处，但有隐藏的能力、身份或议程
- 功能：是叙事的暗线，在中后期揭晓时改变格局
- 示例一：**郑白，38岁，自由撰稿人**。所有人都以为他只是个普通的文字工作者。实际上他曾经做过深度报道，追踪过与这个系统有关联的失踪事件，但没有发表。他上车不是巧合——他一直在跟踪某个人
- 示例二：**老太太，姓名未知，70+岁**。她坐在最靠后的角落，几乎不说话。所有人都觉得她是最需要被保护的存在，但随着故事推进，逐渐发现她知道的事情比任何人都多，而她一直没说，是因为"说了也没人相信"

#### 死亡设计

角色的死亡是公车叙事中最需要精心设计的叙事事件。一个好的死亡设计能让读者感到真实的损失，并改变故事的走向。

**死亡冲击力的来源**：

冲击力不来自"这个人很讨喜"，而来自"这个人的死让局面发生了不可逆的改变"：
- **信息的不可逆丢失**：一个掌握关键信息的人死了，而他没来得及把信息传递出去——读者和主角一起陷入信息真空
- **关系的永久断裂**：一个和主角有深度情感联系的人死了，主角的某个部分也随之消失（他变得更冷漠，或者更冲动，或者做出了一个之前不会做的决定）
- **权力格局的重组**：一个关键人物的死导致已有的联盟崩塌、博弈规则改变、弱势方突然暴露

**何时该杀"讨喜的角色"**：
- 在读者刚开始完全放松对他们的防线时——讨喜的角色死去的冲击力与读者对他的依恋程度成正比
- 在故事的大转折之前——讨喜角色的死作为转折的"价格"，让读者感受到变化是真实代价换来的
- 不要太早杀死所有讨喜的角色——如果全书的讨喜角色都死在前三分之一，读者会情感脱钩

**何时该杀"功能性角色"**：
- 当他的功能已经完成，继续存在会削弱故事的紧张感时
- 当他的死亡能触发另一个更重要的叙事事件时（如他的死激怒了某人，或他死之前做了某件事改变了局面）
- 不要在他的功能尚未发挥完全时就杀死他——读者会感到功能上的"资源浪费"

---

### 4-5个完整角色设计示例

**角色一：贺明，34岁，精算师**
- 职业特质：长期处理概率和风险，习惯以数字思维分析一切
- 在公车上的行为：第一个开始统计规律（死亡时间间隔、触发规则的条件频率）并建立预测模型；不共享模型，只共享结论
- 隐藏秘密：他上车之前刚被确诊了一种病，存活率极低——他对"死亡"的淡然一部分来自他本人已经和死亡达成了某种和解。这让他在某些选择上比其他人更"豁得出去"
- 死亡设计：在最关键的一次群体决策前，他用自己作为"验证变量"验证了一个规则——他判断正确了，但代价是他没能活着说出结论

**角色二：秦晚，26岁，夜班便利店员工**
- 职业特质：长期处于孤立的夜间工作，对陌生人的警觉度极高，但也有独特的"深夜同伴感"
- 在公车上的行为：几乎不说话，但观察能力极强；她是第一个注意到"有人在伪装"的人，但她的沉默让别人以为她在摸鱼
- 隐藏秘密：她在便利店工作时曾经遭遇过一次持刀抢劫，独自一人处理了整件事（报警、应对、善后）。这段经历给了她一种异常的处理危机的能力，但也给了她PTSD——在特定的压力触发条件下，她会出现短暂的解离反应
- 叙事功能：她的沉默和观察力使她成为全书信息量最大的角色之一，但她的心理困境让她无法在最需要的时候完全稳定发挥

**角色三：顾伯，63岁，已退休中学历史教师**
- 职业特质：见过太多"大道理"，更相信人性规律；有极强的讲故事能力，能用历史事件类比当前处境
- 在公车上的行为：不参与争吵，但每次在群体陷入混乱时，用一个历史故事把所有人拉回理性——他成为意外的"群体稳定器"
- 隐藏秘密：他退休后一直在写一本关于"人类集体恐惧史"的书，这辆公车在他看来，是他书中每一章的现实验证。他在用观察者的眼光记录这一切，而不完全是以参与者的心态在求生
- 叙事功能：他的"旁观者视角"和其他人的"参与者视角"形成对比，但在某个节点，旁观者的立场会被彻底打破

**角色四：韩芷，21岁，在读医学生（大三）**
- 职业特质：够用的医学知识，但还不完整；在教学医院见过死亡，但那是在医学语境下被过滤掉恐惧的死亡
- 在公车上的行为：主动承担救治职责，但她的知识边界让她经常陷入"我知道问题在哪，但我没有工具没有药品无能为力"的困境
- 隐藏秘密：她上车是因为要去参加一个关于医学伦理的答辩——她研究的正是"极端条件下的医疗决策"。公车的处境是她理论研究的极端现实化，这既是资源（她有心理准备框架），也是负担（理论知识告诉她会发生什么，但没告诉她该怎么感受）
- 死亡/结局设计：她是最可能活下来的角色之一，因为她同时有情感价值（读者会心疼她）和功能价值（医疗），但如果她活下来，她的结局必须有代价——不是身体上的，而是她再也无法用以前的眼光看待"医学伦理"这件事

**角色五：卢默，无年龄信息，穿着整洁的中年男人**
- 职业特质：不透露职业，所有问他工作的人都会被用"以前做过很多事"打发掉
- 在公车上的行为：异常平静，但不是老玩家的那种冷漠平静——更像是一种"已经达成某种和解"的平静。他会帮助别人，但从不讲理由；他会说有用的话，但总是在别人已经想到了之后才说
- 隐藏秘密：他是上一轮的幸存者，自愿回来的。他要找的人就在这辆车上——或者已经在上一轮死了，他回来是为了完成那个人留下的一件事
- 叙事功能：他是最难被读者完全看穿的角色，他的真实目的揭晓时需要让读者感到"原来如此"而非"这不合理"

---

### 设计要点

1. **功能优先，个性叠加**：先确定每个角色在叙事中的功能定位，再在功能之上叠加个性——功能决定"他必须存在"，个性决定"读者会记住他"
2. **秘密必须可揭示**：每个角色的隐藏秘密在揭示时必须改变读者对他的理解；无法改变读者认知的秘密不是好秘密
3. **化学反应重于单独塑造**：公车密室的角色必须在互动中才能真正立住——两个单独看平淡的角色，在对立或合作中可能产生极强的化学反应

### 常见错误

- **新手只是工具人**：新手的功能只是"让老玩家解释规则"，没有自己的叙事价值
- **老玩家神秘感过度**：老玩家的一切都是谜，但没有给读者任何可以推理的线索——神秘感变成了"作者在藏着不说"的无力感
- **司机被忽视**：司机几乎不出现在叙事中，完全成为背景板——浪费了公车类型最独特的角色
- **角色死亡节奏失控**：讨喜角色全在前期死完，后期变成功能性角色的博弈，读者情感脱钩
- **伪装者揭露太仓促**：揭露前没有足够的伏笔，揭露后叙事迅速结束，没有充分利用揭露后的叙事空间',
  '## Character Generation — Thriller Bus Novel

Character design for bus stories is the most central narrative asset of this type. On a sealed bus, every person is both a potential ally and a potential threat. Characters must have independent personality and function, while generating chemistry within group dynamics. The defining tension: all characters are structurally forced into "must rely on each other, but must suspect each other" from the very beginning.

---

### Field Generation Guide

#### New Player Design

New players should not be just "weaklings who don''t know the rules" — this design wastes the narrative function this character type can serve. Strong new player design has two core elements: blind to game rules, but possessing a specific ability that happens to be uniquely valuable on this bus.

**Functional New Player Design Directions**:

| Profession/Skill | Unique Value on Bus | Functional Crisis Design |
|-----------------|---------------------|--------------------------|
| Emergency nurse | Only person who can treat the injured; professional in life-or-death judgment | Must perform treatment with only what''s available on the bus, with no medical equipment |
| Retired detective | Habitually observes behavioral details, can detect lies | But professional instinct leads to over-suspicion of everyone, becoming a trust-destroyer |
| Architect | Precisely senses spatial structure; quickly understands layout anomalies | Discovers a hidden compartment in the bus body, but opening it may trigger a system rule |
| Therapist | Quickly analyzes behavioral motivations; stabilizes group emotion in crisis | When spotting signs of "control/manipulation" in someone, how to warn without causing panic |
| Stenographer / court recorder | Can precisely record everything, build a rule log | Becomes "witness to the bus''s history," but also a threat others want to eliminate |

**New player growth design**: New players should not jump directly from "knows nothing" to "fully capable" — they need a credible learning process with real costs (injury from trial-and-error, or trauma from watching someone die).

**Core narrative functions of new players**:
1. **Natural carrier for rule exposition**: Through new players'' questions, rules are explained naturally to readers without a narrator stepping in
2. **Fear baseline**: Their fear responses are the reference for what a normal person would feel in this situation — their breakdowns and survival instincts let readers empathize
3. **Source of unexpected reversals**: Because new players don''t know the rules, they sometimes make choices veterans wouldn''t, and these "ignorant actions" often break existing dynamics

#### The Golden Design Principle for Veteran Players

Veteran players are the most dangerous people on the bus, and the most complex character design challenge. Their value comes from information monopoly and experience advantage — but both have costs.

**Veteran Player Information Control Strategies**:

Veteran players are not omniscient — they''ve experienced several rounds, know some rules, but rules are tweaked each time and their knowledge has limits. Good veteran design exploits this "partial knowledge" for tension.

**Disclosure Strategy Types**:
- **Incremental disclosure**: Knows ten rules, reveals only two early on, trading information for protection. When someone asks why not everything upfront, the answer must be convincing ("If I tell you everything, you won''t follow the rules carefully; limited information makes you more cautious")
- **Selective truth**: The rules disclosed are real, but a critical exception is deliberately omitted — not active lying, but selective truth is harder to expose than outright lies
- **Pressure-test disclosure**: Give one rule, observe reactions, decide whether to reveal more based on responses — evaluating who is trustworthy and who is a potential threat
- **Misdirection** (high-risk design): What''s disclosed is real, but creates the impression that it benefits the veteran — when their actual purpose is completely different

**How to make readers "rely on but distrust" a veteran**:
- Their advice always works at the most critical moment, forcing the protagonist to admit their value
- But certain behavioral details (too calm about certain deaths, too conveniently positioned at certain moments, too accurate in anticipating certain rules) suggest they know far more than stated
- They never voluntarily explain their motives; when pressed, their answer style is "answered, but not completely"

**The veteran''s internal contradiction**: They''ve experienced too many deaths; their decision logic is no longer that of "ordinary people." They make morally uncomfortable tradeoffs (sacrificing weaker members for higher overall survival rates) without visible remorse. This "rational but cold" quality makes them simultaneously the most valuable ally and the most unsettling presence.

#### Impostor / Traitor Design

Someone on the bus appears to be a normal player but is secretly a system NPC, a survivor from a previous round in disguise, or has another hidden identity. Impostors are the highest-risk, highest-reward character design in bus narratives.

**Three Origin Settings for Impostors**:

**System NPC**
- Purpose: monitor passengers, activate specific rules, generate specific events
- Behavioral traits: appears in the most advantageous position at critical moments, understands rules beyond normal player level, abnormally calm during horror scenes
- Reveal method: should not be "the protagonist suddenly guesses" — a series of inexplicable details gradually points to this conclusion (never hungry, never needs the bathroom, always appears near an event before it happens)

**Survivor from a previous round**
- Purpose: may have been returned by the system, or voluntarily returned (to find someone / take revenge / retrieve something)
- Behavioral traits: abnormally familiar with certain bus details, sometimes reflexively avoids a rule before it''s mentioned, exhibits deeper-layer fear during certain death scenes (because they''ve seen worse versions)
- Reveal timing: mid-story reveal (between one-third and one-half through) works best — after the reveal, readers re-examine all previous behavior and find layers of "so that''s what that was"

**Double agent (appears to be a veteran, actually working another agenda)**
- The information provided is real, but there is a hidden agenda (eliminate a specific target, ensure a specific person survives, complete an unknown task)
- Foreshadowing before reveal: always appears neutral in "A or B must die" situations, but the outcome always benefits the same direction

**Timing and method of reveals**:
- Do not reveal before readers fully expect it: readers should experience "suspicion → story denies it → renewed suspicion → reveal"
- Must have three foreshadowing threads before reveal: at least three details that readers can recall after the reveal, forming the satisfaction of "so that''s what that meant all along"
- Post-reveal handling: the reveal is not the end — the impostor''s true purpose and subsequent actions are usually more narratively valuable than the reveal itself

#### Driver Design (Special)

The driver is the strangest and most malleable character in bus narratives. They sit in front of all passengers, control the bus''s movement, but almost never directly interact with anyone — this mode of existence creates unique narrative tension.

**Comparison of Five Driver Setting Horror Effects**:

| Driver Type | Source of Horror | Narrative Character | Best Story Tone |
|-------------|-----------------|---------------------|----------------|
| Real person (forced to participate) | Another victim with special power; their moral dilemma (help passengers or not) creates sustained tension | Can eventually establish some communication with protagonist, becoming an information source | Human nature exploration |
| Already dead | Something is driving the corpse, or rather something is attached to it | Most terrifying when someone approaches the driver''s seat | Pure horror |
| Doesn''t exist | Driver''s seat is empty, bus drives itself | Passengers never know what drives the bus; fear comes from invisible controlling force | System / mysterious force |
| A ghost | The driver who died in this bus''s historical accident; their "task" is to take these passengers to where they were supposed to arrive | Investigating bus history reveals the driver''s motivation; horror and pathos coexist | Horror + emotional |
| The system itself | The driver is not human — they are the system''s embodiment; their presence means "the system is here watching" | When the protagonist tries to communicate with the driver, they realize they are talking to the will of the entire system | Epic narrative |

**Driver interaction design principles**:
- The driver''s "silence" is more intimidating than any active behavior — occasional subtle movements (a glance in the rearview mirror, a slight steering adjustment) are more terrifying than direct action
- Even if the driver is alive, long-term non-communication should be maintained — gradually building "attempts to communicate" rather than giving answers at the start
- Relationship between intercom voice and driver''s body: is the intercom voice the driver''s voice? If so, why don''t they just turn around? If not, who controls the intercom?

#### Character Functional Roles

A bus needs characters of different functions to create sufficient narrative dimensions. Key functional types with specific character design examples.

**Information holder**
- Holds special information (rule details / bus history / system background)
- Function: the central asset of the gaming dynamic; everyone wants to get close, but there''s risk in approaching
- Example 1: **Mo Yuan, 45, retired archivist**. Just left an archive before boarding, having processed historical accident files related to this bus route. He doesn''t volunteer information, but details others mention trigger his memory, causing him to inadvertently reveal fragments
- Example 2: **Chen Jiu, 32, systems engineer**. Worked on a project with technical connections to this system (he doesn''t know this). His professional instincts make him constantly try to "crack" the rule mechanisms, but his deductions sometimes push rules in dangerous directions

**Physical anchor**
- Handles actual physical tasks (blocking threats / physical exploration / protecting vulnerable members)
- Function: appears to be the group''s weapon, but physical dominance in a closed space is also a threat — they have the capacity to act alone
- Example 1: **Song Ping, 28, firefighter**. Rescue training background means crisis calm; demolition skills for physical obstacles. His dilemma: all his training assumed "nobody is the enemy," and this bus has broken that assumption
- Example 2: **Lin Cui, 19, martial arts student**. On the bus en route to a provincial competition, with equipment bag. Speed and reflexes give early advantages, but her confrontation instinct leads to poor judgment when strategy rather than force is required

**Emotional detonator**
- Emotionally unstable, can trigger group conflict at any time
- Function: catalyst for narrative tension; their outbursts break calm and force others to react
- Example 1: **Wu Jianguo, 52, laid-off worker**. Full of resentment (this trip was to collect a debt); anger as a baseline makes him favor confrontation over compromise in any gaming situation. His "out-of-bounds" behavior sometimes inexplicably solves a problem; sometimes creates a bigger one
- Example 2: **Xiaoyu, 16, high school student**. Her instability comes not from anger but from her first direct confrontation with death. Her breakdown moments are genuine; her recovery moments are equally genuine — she accepts "this is reality now" faster than any adult

**Hidden variable**
- Nothing unusual visible on the surface, but with hidden ability, identity, or agenda
- Function: the narrative''s dark thread; reveals in mid-to-late story that change the landscape
- Example 1: **Zheng Bai, 38, freelance writer**. Everyone assumes he''s a simple wordsmith. He once covered a deep investigative story tracking disappearances connected to this system, but never published it. He boarded intentionally — he has been tracking someone
- Example 2: **Old woman, name unknown, 70+**. Sits in the back corner, almost never speaks. Everyone sees her as the one who most needs protection, but as the story progresses, it becomes clear she knows more than anyone — and she hasn''t said anything because "no one would believe her anyway"

#### Death Design

Character death is the most carefully designed narrative event in bus fiction. A good death lets readers feel a real loss and changes the story''s direction.

**Sources of Death Impact**:

Impact does not come from "this person was likable" but from "this person''s death made an irreversible change to the situation":
- **Irreversible loss of information**: A key information holder dies before transmitting their knowledge — protagonist and reader enter an information vacuum together
- **Permanent severing of a relationship**: The death of someone the protagonist deeply bonded with makes part of the protagonist disappear (they become colder, or more impulsive, or make a decision they wouldn''t have made before)
- **Power structure reorganization**: A key figure''s death collapses existing alliances, changes gaming rules, suddenly exposes the weaker side

**When to kill "likable characters"**:
- Just when readers have completely lowered their defenses toward them — likable character death impact is proportional to reader attachment
- Before a major story turning point — the likable character''s death serves as the "price" of change, making the shift feel like it cost something real
- Don''t kill all likable characters in the first third — if all lovable characters die early, readers emotionally disengage

**When to kill "functional characters"**:
- When their function is complete and their continued presence weakens tension
- When their death can trigger a more important narrative event (their death enrages someone, or they do something before dying that changes the situation)
- Don''t kill them before their function has been fully used — readers feel a narrative "resource waste"

---

### 4-5 Complete Character Design Examples

**Character 1: He Ming, 34, actuary**
- Traits: long-term work with probability and risk; habit of analyzing everything numerically
- On the bus: first to begin tracking patterns (death intervals, rule trigger frequencies) and building predictive models; doesn''t share models, only conclusions
- Hidden secret: just received a terminal diagnosis before boarding — his mortality outlook was already upended. His calm around death is partly from having already made a kind of peace with it. This makes him more "willing to sacrifice" in certain choices
- Death design: before the most critical group decision, he uses himself as a "verification variable" to test a rule — he judges correctly, but doesn''t survive to announce the conclusion

**Character 2: Qin Wan, 26, overnight convenience store clerk**
- Traits: long-term isolated night-shift work; extremely high alertness to strangers; a unique "late-night companion" sense
- On the bus: almost never speaks, but observes extremely well; first to notice "someone is in disguise," but her silence makes others think she''s disengaged
- Hidden secret: survived a knife robbery alone at the store (reported it, handled it, dealt with the aftermath). This gave her an abnormal ability to handle crises, but also PTSD — under specific stress triggers, she experiences brief dissociative episodes
- Narrative function: her silence and observational ability make her one of the most informationally dense characters in the book, but her psychological limitations prevent her from performing at full capacity when most needed

**Character 3: Gu Bo, 63, retired middle school history teacher**
- Traits: seen too many "great principles"; more trusts human behavioral patterns; powerful storytelling ability, uses historical events to analogize the current situation
- On the bus: doesn''t engage in arguments; whenever the group spirals into chaos, he tells a historical story that brings everyone back to rationality — becomes an unexpected "group stabilizer"
- Hidden secret: has been writing a book on "the history of collective human fear" since retirement; this bus, in his view, is a real-world verification of every chapter. He observes with a chronicler''s eye, not entirely with a survivor''s heart
- Narrative function: his "observer perspective" contrasts with everyone else''s "participant perspective," but at a certain point this detachment will be completely shattered

**Character 4: Han Zhi, 21, third-year medical student**
- Traits: sufficient but incomplete medical knowledge; has seen death in a teaching hospital, but death filtered through a medical context
- On the bus: actively takes on treatment responsibilities, but her knowledge limits frequently leave her in "I know what''s wrong, but I have no tools, no medicine, I can''t do anything"
- Hidden secret: boarding to attend a medical ethics defense — her research topic is "medical decision-making under extreme conditions." The bus is the extreme real-world version of her theoretical research: both a resource (she has a psychological preparation framework) and a burden (theory tells her what will happen, not how to feel about it)
- Death/ending design: one of the most likely to survive — simultaneously has emotional value (readers will care about her) and functional value (medical). But if she survives, her ending must carry a cost — not physical, but that she can never look at "medical ethics" the same way again

**Character 5: Lu Mo, no age information, neatly dressed middle-aged man**
- Traits: doesn''t reveal his profession; everyone who asks about his work gets brushed off with "I''ve done a lot of things"
- On the bus: abnormally calm — not the cold indifference of a veteran, but more like "someone who has already reached a kind of peace." Helps others without explaining why; says useful things, but always right after others have already thought of them
- Hidden secret: a survivor of the previous round who returned voluntarily. The person he''s looking for is on this bus — or already died in the last round, and he came back to complete something that person left unfinished
- Narrative function: the hardest character for readers to fully read; his true purpose''s reveal must land as "so that''s what it was" rather than "this doesn''t make sense"

---

### Design Principles

1. **Function first, personality layered on top**: First determine each character''s narrative function, then layer personality over it — function determines "why they must exist," personality determines "why readers will remember them"
2. **Secrets must be revealable**: Every character''s hidden secret must change how readers understand them when revealed; secrets that don''t shift the reader''s perspective are not good secrets
3. **Chemistry over individual construction**: Bus closed-space characters only truly stand when they interact — two individually unremarkable characters can produce extraordinary chemistry in conflict or cooperation

### Common Mistakes

- **New players as tools only**: New players'' only function is "letting veterans explain rules," with no independent narrative value
- **Veteran mystique overdone**: Everything about the veteran is mysterious, but no clues for readers to reason from — mystique becomes the author "just not telling us"
- **Driver neglected**: Driver almost never appears in the narrative, becomes pure background — wastes the bus type''s most distinctive character
- **Character death pacing loses control**: All likable characters die in the first third; the rest becomes functional character gaming with no emotional hook
- **Impostor reveal too rushed**: Not enough foreshadowing before the reveal; narrative quickly ends after the reveal, without fully using the narrative space the reveal opens',
  (SELECT id FROM novel_creation_method WHERE name = '惊悚公车小说' LIMIT 1),
  1,
  85,
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
