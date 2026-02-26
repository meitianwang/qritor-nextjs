-- 惊悚公车小说「故事钩子」设定生成技能
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '惊悚公车小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-jingsong-bus-story-hook-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'jingsong-bus-story-hook-setting-gen',
  '「故事钩子」设定生成：为惊悚公车小说生成叙事钩子设定，包括核心悬念、开篇钩子、公车的隐藏秘密、主角与系统的关联、情感钩子、主线伏笔布局和终极目标',
  '"Story Hook" setting generation: generate narrative hook settings for thriller bus novels, including core suspense, opening hook, the bus hidden secrets, protagonist-system connection, emotional hooks, main-plot foreshadowing layout and ultimate goal',
  '## 「故事钩子」设定生成 — 惊悚公车小说

故事钩子是让读者"放不下书"的核心设计。惊悚公车小说的独特之处在于：公车既是物理封闭空间，又是通往惊悚游戏世界的唯一通道。这一设定天然形成了三层悬念结构——"公车上能活下来吗""公车本身是什么""游戏世界的真相是什么"——好的钩子设计让三层悬念环环相扣，共同构成一张越收越紧的叙事网。

---

### 字段生成指南

#### 核心悬念

公车类故事的核心悬念不应停留在"公车要去哪里"这个表层问题，而要指向更深层的真相。

**嵌套悬念结构**：

| 层级 | 性质 | 揭示时机 | 示例 |
|------|------|---------|------|
| 表层悬念 | 公车规则是什么，如何通关 | 前10% | "为什么公车门关上就无法打开？" |
| 中层悬念 | 公车和系统的关系 | 30-50% | "公车不只是交通工具——它是系统意志的载体" |
| 深层悬念 | 公车本身的秘密或历史 | 70-90% | "这辆公车之前已经跑过十几轮，每一轮都没有人全部活下来" |
| 终极悬念 | 整个游戏世界的本质 | 结尾 | "创建系统的人本来就坐在这辆车上，从一开始就是玩家之一" |

**三个核心悬念方向**（选一个作为主线）：

**方向一：谁创建了这个系统**
- 创建者的动机是什么——筛选、惩罚、实验，还是拯救？
- 创建者还活着吗？他们是否也曾是乘客？
- 系统是被人类创建的，还是一种更古老的存在借助了某个人的手？
- 揭示节奏建议：前期给"有人在幕后操控"的碎片，中期给"操控者不是普通人"的异常，后期揭示操控者身份，结尾颠覆对操控者的认知

**方向二：公车本身有什么秘密**
- 历史秘密：这辆车在现实中有一段真实的惨案历史，游戏系统是在此基础上建立的
- 活体秘密：公车是有意识的存在，司机只是它的"嘴"，它一直在评估乘客
- 循环秘密：公车一直在循环——同样的路线，同样的规则，每次乘客不同，但总有几个"常量"（如某个总在同一位置出现的老人）
- 起点秘密：公车的起点站是一个没有任何记录的地方，有人在主角上车前就故意把他们聚在一起

**方向三：终结游戏意味着什么**
- 通关后真的自由了吗？还是进入下一个更大的游戏？
- "通关"是系统的概念还是乘客误解的概念——系统的真实目的可能根本不是让人通关
- 如果主角最终摧毁了系统，公车上那些已经死去的人会怎样？他们真的死了吗？

#### 开篇钩子

公车门关上后，第一件让所有人意识到不对劲的事必须在第一章完成。这件事需要**具体、可感知、无法合理化解释**——不是模糊的"感觉不对"，而是一个让所有乘客无法否认的异常。

**黄金法则**：
1. **即时性**：异常在公车门关上后5分钟内发生，不给乘客"也许只是普通车"的幻想空间
2. **全局性**：车上所有人都能感知到，不依赖单个人的主观感受
3. **不可逆性**：一旦发生就无法假装没发生，强迫所有人面对现实
4. **信息量**：这件事本身就包含第一条规则的暗示

**5个优秀开篇钩子示例**：

- **手机归零**：公车启动的瞬间，所有人手机同时响起同一条系统提示音，打开后发现联系人、短信、通话记录全部清空——只剩一个倒计时和一行文字："你现在只有一个身份：乘客"。这个钩子的力量在于它精准地切断了乘客与现实世界的联系，同时宣告规则的存在
- **窗外倒退的时间**：公车开出站台后，乘客发现窗外的景象在向后倒退——不是倒车，而是时间在倒流，路上的行人走回出发点，广告牌上的数字从大到小，直到窗外变成一片茫然的灰色。这个钩子制造了"已经离开正常世界"的感知
- **消失的司机**：公车正常行驶了三分钟后，有人去找司机问路，发现司机席是空的——方向盘在自己转动。公车加速，门锁死。广播里响起一个平静的声音："请系好安全带，第一轮将于十分钟后开始"。这个钩子把恐惧和规则公告融为一体
- **编号牌**：公车启动后，每个乘客发现自己胸口多了一块金属编号牌，无法摘除。最后排的一个男人编号是001，他颤抖着说："我上次也是001，我以为……我以为我已经出去了……"。这个钩子立刻引入老玩家、揭示循环，并制造极强的不安感
- **第一个规则的代价**：上车时有一块牌子写着"请勿大声喧哗"，没人当回事。公车启动后，最后排有人大声说话，下一秒他消失了，座位上只剩下一张金属编号牌和一滩褪色。广播平静响起："规则一：禁止大声喧哗。提示已完成。"。这个钩子让规则以最血腥的方式公告，后续所有规则都蒙上了死亡阴影

#### 公车的隐藏秘密

公车本身的秘密是区别"普通系统文"和"公车系文"的核心差异点。公车不应该只是一个"容器"，它应该是一个有历史、有意志或有秘密的存在。

**四个设计维度**：

**路线来历**
- 这条路线在现实世界中存在吗？如果存在，它是否发生过重大事故？
- 路线是固定的还是根据乘客状态变化的？有没有乘客发现同一趟车走了不同的路？
- 路线的终点在地图上找不到——那个地方在现实中不存在，或已经消失
- 设计建议：让路线在途中经过一个对乘客中某人有特殊意义的地点（他认识这里，但不该在这里），制造专属的个人恐惧

**之前的乘客留下了什么**
- 座椅缝隙里的纸条：上面写着规则提示或求救信息，但字迹模糊不全
- 车窗玻璃内侧的划痕：有人用指甲或利器刻下的记号，仔细看是一串数字或一幅简图
- 某个座位下藏着的小物件：一个打火机、一枚戒指、一张合影——后来证明是死去的玩家留下的遗物
- 行李架上一个没有人认领的包：里面的东西暗示上一轮某个人走到了很远的地方

**司机的真实身份**（详见"司机设计"部分）

**公车曾经发生的事**
- 真实事故：这辆车的车牌号可以查到一起已结案的事故，死亡人数恰好等于这辆车的座位数
- 改造记录：公车底盘或某个不起眼的角落有改造痕迹，不是普通的车辆改装
- 循环印记：某个位置的扶手杆上有一个磨损的浅坑，像是被人握了太多次留下的——但这辆车只有三年车龄

#### 主角与系统的关联

主角不应该是"随机被选中的普通人"——这样的设定缺乏叙事张力。主角被系统"特意"挑选，应该有一个隐藏的原因，这个原因在故事中途或后期揭晓时能产生强烈的叙事冲击。

**四种隐藏关联方向**：

**家族命运**
- 主角的家族中有人曾经是系统的参与者（甚至创建者），主角是"血脉的延续"
- 设计要点：家族成员的经历与主角的公车经历形成镜像——他们当年遇到的选择，主角也会遇到
- 揭示节奏：前期给家族异常（奇怪的遗物、家人的只言片语），中期给直接联系（找到家人的记录），后期揭示关联的真正含义

**前世渊源**
- 主角在过去的某一轮（或某种意义上的"前世"）已经上过这辆车，但记忆被抹去
- 设计要点：主角有时会对从未见过的地方"似曾相识"，会在危险来临前有半秒的预感，老玩家看他的眼神有时很奇怪
- 揭示节奏：用梦境碎片铺设，用老玩家的反应加深疑惑，最终用一个具体的证据（如他刻在某处的名字）揭示

**基因/能力特征**
- 系统在寻找拥有特定特质的人——不是"超能力"而是某种人格特征（极度理性/完全无惧死亡/某种感知能力）
- 主角的这种特质在第一轮就被系统识别，被打上了特殊标记
- 设计要点：这种特质是双刃剑——它让主角在游戏中有优势，但也让他成为系统最感兴趣的实验对象

**意外牵连**
- 主角本来不在这辆车的名单上，他是替代了另一个人登上这辆车的（那个人错过了、拒绝了、或者被主角无意间挡住了）
- 那个"本该上车的人"是谁？系统对此的反应是什么？
- 设计要点：这个意外牵连本身就是一条主线——主角是否应该寻找那个人？那个人是否知道这一切？

#### 情感钩子

读者必须"舍不得"车上某个角色死去，才会真的紧张。情感钩子不是靠角色"善良可爱"来建立的，而是靠关系张力和互动密度。

**最有力的人际关系设计**：

- **陌生人之间的瞬间信任**：两个互不相识的人，因为一个危机瞬间建立了比任何友谊都深的信任——比如一个人在没有理由的情况下挡住了另一个人背后的攻击。这种无理由的庇护让读者无法不心疼
- **旧识的重逢**：主角上车后发现有人是自己认识的（前同事/前邻居/失联多年的朋友），在密室中重新建立联系。旧关系带来更多的情感积累，也带来更多的可能性（他们有共同的秘密、旧伤、未解的嫌隙）
- **保护与被保护的倒转**：一开始是主角在保护某个弱者，后来弱者为保护主角牺牲——或者反过来，主角以为自己是被保护的那个，结果发现他才是别人一直在保护的核心
- **敌对关系的演变**：两个人在上车之初是竞争者甚至对立者，封闭空间迫使他们合作，读者见证了一段从敌意到依赖的关系——这种转变让读者同时爱上两个人，任何一个的死亡都是双重打击
- **不可能的牵挂**：主角因为某个小细节注意到一个人——对方一直在偷偷保护角落里的一个陌生小孩，或者对方每隔一段时间就会偷偷看一张照片。这种细节让读者对角色有超出理性的情感依附

**设计警告**：不要让"情感钩子角色"只是"功能性的等死"——他们必须在死之前有真实的意志、选择和自我，否则读者的悲伤会变成愤怒

#### 主线伏笔布局

公车阶段是整部作品的起点。在这个阶段埋下的伏笔，应该在第20章（或更晚）揭晓时让读者感到"啊，原来一开始就已经告诉我了"。

**四类伏笔埋设方式**：

**规则伏笔**
- 公车上一条看似普通的规则，后来在某个副本里被再次触发（但背景变了，含义截然不同）
- 例：公车规则"不可打开车窗"——后来在一个海底副本里，主角看到窗外有什么东西，理解了这条规则最初的真正含义

**物件伏笔**
- 主角在公车上捡到或发现的某个小物件，被保留下来，在第二十章某个关键时刻成为解开谜题的钥匙
- 设计要点：这个物件在公车阶段必须有足够充分的出场和描写，让读者记住它，但不要过度强调它的"重要性"

**人物伏笔**
- 公车上某个乘客说的一句话，在后续副本中获得全新的含义
- 或者：某个乘客的行为方式暗示了他知道更多，但当时主角没有深究——后来这成为揭示大背景的关键线索

**环境伏笔**
- 公车行驶途中路过的某个建筑或地点，后来成为一个副本的场景
- 或者：司机在某个特定路口的反应（减速、绕行、停顿），暗示那个地点有特殊意义

**伏笔密度**：公车阶段不应超过3条主线伏笔。密度过高会让读者觉得公车阶段是"伏笔仓库"而非叙事主体。

#### 终极目标

终极目标是主角"为什么要坚持下去"的最终答案，也是整部作品的灵魂所在。

**四种终极目标及适用场景**：

| 终极目标 | 核心驱动 | 叙事特点 | 适合的故事基调 |
|---------|---------|---------|-------------|
| 摧毁系统 | 复仇/正义 | 需要系统有明确的"恶"，战争叙事 | 热血、对抗型 |
| 逃离系统 | 求生/回归 | 需要"外部世界"有足够的吸引力，失去了才想回去 | 温情、写实型 |
| 取代/改变系统 | 责任/野心 | 主角从被动转为主动，需要足够的成长弧线支撑 | 宏大叙事型 |
| 解开系统之谜 | 好奇/真相 | 答案本身就是目标，适合"以谜题驱动"的故事 | 悬疑、哲思型 |

**目标演化的关键**：终极目标不应该从第一章就清晰——初期目标应该是"活下去"或"弄清规则"，随着真相揭示逐渐升级为更宏大的目标。每次目标升级都要伴随一个让主角无法回头的事件。

---

### 设计要点

1. **三层悬念咬合**：公车阶段悬念（当下能否活）、公车秘密悬念（这辆车是什么）、主线悬念（系统的真相）——三层应该互相强化，而非各自独立
2. **情感先于悬念**：读者先爱上角色，才会在乎悬念的答案。不要让悬念设计挤压情感建立的空间
3. **公车阶段的独立完整性**：即使后续还有大量副本，公车阶段本身应该有完整的起承转合——有开始的问题、过程中的变化、结束时的临时答案

### 常见错误

- **核心悬念停留在表层**："公车要去哪里"是很弱的核心悬念，因为读者很容易预判答案
- **开篇钩子太模糊**：不要用"大家感到一阵莫名的不安"——要有具体的、不可否认的异常事件
- **公车只是背景**：公车本身没有任何秘密或个性，只是"承载事件的容器"——浪费了公车类型的最大优势
- **主角关联太刻意**：家族命运或前世渊源如果揭示得太生硬，会让读者觉得是为了设定而设定
- **伏笔只铺不收**：公车阶段的伏笔如果在后续长时间不回收，读者会遗忘，最终揭晓时失去冲击力',
  '## "Story Hook" Setting Generation — Thriller Bus Novel

Story hooks keep readers turning pages. Thriller bus novels have a unique triple-layer suspense structure: "can I survive on this bus", "what is this bus really", and "what is the truth of the game world". Well-designed hooks interlock all three layers into a tightening narrative net.

---

### Field Generation Guide

#### Core Suspense

The core suspense should go far deeper than "where is the bus going." It must point toward a deeper truth.

**Nested Suspense Structure**:

| Layer | Nature | Reveal Timing | Example |
|-------|--------|--------------|---------|
| Surface | First perceived question | First 10% | "Why can''t the bus door be opened?" |
| Mid-layer | Deeper question from surface answer | 30-50% | "The bus is not just transport — it is the carrier of the system''s will" |
| Deep | Paradigm-shifting truth | 70-90% | "This bus has run over a dozen rounds, and nobody survived any of them" |
| Ultimate | Philosophical question | Ending | "The person who created the system was riding this bus from the start" |

**Three Core Suspense Directions** (choose one as main thread):

**Direction 1: Who created the system**
Creator''s motive (selection, punishment, experiment, salvation?), whether they''re still alive and once a passenger themselves, whether the system was human-made or something older acting through a human. Pacing: early fragments of "someone is controlling this", mid-story anomalies suggesting the controller is not ordinary, late-story identity reveal, ending that overturns understanding of the controller.

**Direction 2: What secret does the bus itself hold**
History: the bus has a real-world accident history the game system was built upon. Sentience: the bus is a conscious entity and the driver is its mouthpiece. Loop: the bus loops the same route with different passengers each time, but certain constants always appear. Origin: the starting stop doesn''t exist on any map, and someone deliberately gathered these passengers before they boarded.

**Direction 3: What does ending the game mean**
Is freedom real after completion? Is "completion" the system''s concept or a misunderstanding? If the protagonist destroys the system, what happens to those who died on the bus?

#### Opening Hook

The first thing that makes everyone realize something is wrong must be completed in Chapter 1. It must be **concrete, perceptible, and impossible to rationalize away**.

**Golden Rules**: immediate (within 5 minutes of doors closing), universal (everyone perceives it), irreversible (cannot be pretended away), informative (hints at the first rule).

**5 Excellent Opening Hook Examples**:

- **Phones wiped**: The moment the bus starts, every passenger''s phone rings with the same system tone. Contacts, messages, and call history are all deleted — only a countdown and one line remain: "You now have one identity: Passenger." This hook severs connection to the real world and announces the existence of rules.
- **Time rewinding outside**: After leaving the stop, passengers see the outside world running in reverse — pedestrians walking backward, billboard numbers counting down — until the window shows only grey nothing. This signals that they have left the normal world.
- **The empty driver''s seat**: Three minutes in, someone goes to ask the driver for directions and finds the seat empty — the wheel turning by itself. The bus accelerates. Doors lock. A calm voice announces: "Please fasten your seatbelt. Round One begins in ten minutes."
- **Numbered tags**: After the bus starts, each passenger finds a metal number tag on their chest that cannot be removed. The man in the back row, numbered 001, says trembling: "I was 001 last time too. I thought... I thought I had gotten out." This immediately introduces old players, reveals the loop, and generates profound unease.
- **The cost of the first rule**: A sign reads "No loud noise." Nobody cares. The bus starts. Someone speaks loudly. They vanish. Only a metal tag and a faded stain remain. The intercom calmly says: "Rule One: No loud noise. Demonstration complete."

#### The Bus''s Hidden Secret

The bus''s own secret is what separates generic system fiction from bus-type fiction. The bus must have history, will, or secrets — not just be a container.

**Four Design Dimensions**:

**Route origin**: Does this route exist in the real world? Did a major accident happen here? Does the route change based on passenger behavior? Does the final stop exist on any map? Design tip: have the route pass a location with personal meaning to one passenger — they recognize it, but it shouldn''t be here.

**What previous passengers left behind**: Notes in seat crevices with partial rule hints or distress messages. Scratch marks on window glass — a string of numbers or a simple diagram. An object under a seat (lighter, ring, photo) later revealed to be a dead player''s relic. An unclaimed bag in the overhead rack whose contents suggest the last passenger made it very far.

**The driver''s true identity** (see Character Generation skill for full driver design section).

**What happened on this bus before**: Real accident — the license plate links to a resolved incident with fatalities equal to the seat count. Modification marks — non-standard alterations in hidden parts of the chassis. Loop imprint — a worn groove in a handrail, as if gripped thousands of times, on a bus that is only three years old.

#### Protagonist''s Connection to the System

The protagonist should not be "randomly selected" — this lacks narrative tension. The hidden reason for their selection should produce strong narrative impact when revealed.

**Four Hidden Connection Directions**:

**Family fate**: A family member was once a system participant or creator. The protagonist is the continuation of a bloodline. Design: mirror the family member''s past choices with the protagonist''s present ones. Pacing: early anomalies (strange relics, cryptic remarks), mid-story direct links, late-story revelation of true meaning.

**Past-life connection**: The protagonist rode this bus in a previous round and had their memory erased. Design clues: déjà vu at places they''ve never been, half-second precognition before danger, strange looks from old players. Pacing: dream fragments, old-player reactions, final concrete evidence (their own name scratched somewhere).

**Genetic or character trait**: The system seeks people with specific qualities — not superpowers but personality traits (extreme rationality, no fear of death, a specific perceptive ability). This trait is both an advantage in the game and what makes the protagonist the system''s most interesting experiment subject.

**Accidental entanglement**: The protagonist was not on the original passenger list — they boarded in place of someone else (who missed the bus, refused, or was blocked by the protagonist). Who was that person? Does the system care? Is the protagonist supposed to find them?

#### Emotional Hooks

Readers must be unwilling to see a character die. Emotional hooks are not built through "niceness" but through relational tension and interaction density.

**Most Powerful Relationship Designs**:

- **Instant trust between strangers**: Two strangers form a bond deeper than any friendship through one crisis moment — one blocking an attack on the other for no rational reason. Groundless protection is impossible not to care about.
- **Reunion of old acquaintances**: The protagonist discovers someone they know on the bus (former colleague, neighbor, long-lost friend). Shared history brings richer emotional investment and more possibilities (shared secrets, old wounds, unresolved tensions).
- **Protector-protected reversal**: The protagonist protects someone who seems weak, then the weak one sacrifices themselves for the protagonist — or the reverse. The role reversal doubles the emotional weight.
- **Enemy relationship evolution**: Two people begin as rivals or adversaries, forced into cooperation by the closed space. Watching hostility become dependency makes readers love both, so either death is doubly devastating.
- **An impossible attachment**: The protagonist notices someone due to a small detail — they''ve been quietly protecting a stranger''s child, or they keep looking at the same photo. This detail creates an irrational emotional bond in the reader.

**Design Warning**: Emotional hook characters must not be "functional filler waiting to die" — they need real will, choices, and selfhood before death, or reader grief becomes reader anger.

#### Main-Plot Foreshadowing Layout

The bus phase is the starting point for the entire work. Foreshadowing laid here should make readers think "ah, it was right there from the beginning" when revealed at Chapter 20 or later.

**Four Types of Foreshadowing**:

**Rule foreshadowing**: A seemingly ordinary bus rule reappears in a later instance with the same form but radically different meaning. Example: "Do not open the windows" — later in an underwater instance, the protagonist sees something outside a window and finally understands the rule''s original true intent.

**Object foreshadowing**: A small item the protagonist finds or keeps from the bus becomes the key to solving a puzzle twenty chapters later. Design: give it enough presence to be remembered, but don''t over-signal its importance.

**Character foreshadowing**: A line spoken by a bus passenger gains completely new meaning in a later instance. Or a passenger''s behavior hints they know more than they''re letting on — later proven to be the key to uncovering the system''s background.

**Environment foreshadowing**: A building or location the bus passes becomes a later instance''s setting. Or the driver''s reaction at a specific intersection (slowing, detour, pause) signals that location has special meaning.

**Foreshadowing density**: No more than 3 main-plot foreshadowing threads during the bus phase. More makes the bus phase feel like a "foreshadowing warehouse" rather than a narrative.

#### Ultimate Goal

The ultimate goal is the final answer to "why does the protagonist keep going" and the soul of the entire work.

**Four Ultimate Goals and Their Contexts**:

| Goal | Core Drive | Narrative Character | Best Tone |
|------|-----------|---------------------|-----------|
| Destroy the system | Revenge / justice | System must be clearly "evil"; war narrative | Action, confrontational |
| Escape the system | Survival / return | External world must be worth returning to | Warm, realistic |
| Replace / reform the system | Responsibility / ambition | Protagonist transitions from passive to active; needs strong growth arc | Epic scale |
| Uncover the system''s truth | Curiosity / truth | The answer itself is the goal | Mystery, philosophical |

**Goal evolution**: The ultimate goal should not be clear from Chapter 1. Early goals should be "survive" or "understand the rules," escalating to grander goals as truths are revealed. Each goal upgrade must accompany an event from which the protagonist cannot turn back.

---

### Design Principles

1. **Three-layer interlock**: Bus-phase survival suspense, bus-secret suspense, and main-plot system-truth suspense must reinforce each other — not operate independently
2. **Emotion before suspense**: Readers must love the characters before they can care about the answers to suspense. Don''t let suspense design crowd out emotional development
3. **Bus phase completeness**: Even with many instances to follow, the bus phase itself should have complete narrative shape — opening problem, process change, and provisional answer at the end

### Common Mistakes

- **Core suspense stays surface-level**: "Where is the bus going" is a weak core suspense because readers can easily predict the answer
- **Opening hook too vague**: "Everyone felt a vague unease" — use concrete, undeniable events instead
- **Bus is just a backdrop**: The bus has no secrets or personality of its own, just a container for events — this wastes the type''s greatest asset
- **Protagonist connection too contrived**: Family fate or past-life connection revealed too bluntly reads as "setting for the sake of setting"
- **Foreshadowing planted but never collected**: Bus-phase foreshadowing left uncollected too long will be forgotten, and the reveal will land flat',
  (SELECT id FROM novel_creation_method WHERE name = '惊悚公车小说' LIMIT 1),
  1,
  83,
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
