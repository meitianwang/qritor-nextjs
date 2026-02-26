-- 惊悚公车小说副本生成技能
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '惊悚公车小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-jingsong-bus-scene-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'jingsong-bus-scene-gen',
  '副本生成：为惊悚公车小说设计通关后的各类惊悚副本，涵盖副本与公车经历的延续性、各类恐怖主题设计指南、难度递进设计、规则设计方法论，以及每个副本与公车的有机关联设计',
  'Scene/instance generation: design post-bus thriller instances for bus novels, covering continuity from the bus experience, design guides for horror themes, difficulty progression, rule design methodology, and organic bus-connection design for each instance',
  '## 副本生成 — 惊悚公车小说

副本是公车之后的主要战场，但公车永远是读者和主角共同的"起点记忆"。好的副本设计不是把公车经历扔掉重新开始，而是让公车经历以各种方式渗透进每一个副本，让读者在每次进入新副本时，都能感受到"那辆车还在跟着我"。

---

### 字段生成指南

#### 副本与公车经历的延续性

公车是主角和读者唯一共有的"历史"。副本设计应该把这段历史当作叙事资产来使用，而不是一个被遗忘的起点。

**三种利用公车经历的核心方式**：

**公车上认识的人重新出现**

最直接的延续方式：公车上没有全部死亡的乘客，在副本中以不同的方式再出现。

- **同一副本相遇**：公车上认识的人被分配到了同一个副本，但双方的处境（强弱/信息量/立场）已经发生了变化。公车上对你有恩的人，现在可能是你最大的竞争对手；公车上你不信任的人，现在可能是唯一愿意和你结盟的
- **对立副本相遇**：不同玩家的副本之间有接触点（如双方副本的规则有交叠），两个公车上的旧识从不同角度进入了同一个叙事
- **以情报形式出现**：副本中获得的信息（NPC的描述、系统的记录、物件上的名字）指向一个公车上认识的人——他在系统中的轨迹给出了关键提示
- **以鬼的形式出现**：公车上死去的人，以系统允许的某种形式在副本中留下了痕迹（不一定是鬼，可以是他们曾经通过的某个副本的残影、他们留下的物件、他们在副本规则中的某种影响）

设计要点：重逢不应该只是"情感回调"，而应该改变副本中的权力格局。一个熟悉的脸能带来信息（他们知道什么），也能带来风险（他们知道你知道什么）。

**公车上发现的规则在副本里被验证**

公车上的某些规则或观察，在后续副本中以新的形式被证明了更深层的含义：

- **规则迁移**：公车规则"不可大声喧哗"——副本中出现了一个声控怪物，主角因为有公车上"安静才能生存"的肌肉记忆而比其他新人更快适应了这条副本规则
- **规则反转**：公车上某条规则"必须占据有利位置"，到了某个特定副本中，优势位置反而是陷阱——主角因为公车上的经验而犯了一个新人不会犯的错误
- **规则溯源**：副本中揭示了一个机制，让主角回想起公车上某个当时没有理解的异常，两者吻合——"原来公车上那个不让开窗的规则，是因为这个"
- **规则预言**：公车上某个老玩家说过一句看似随口的话（"规则总会留缝隙"），在第二十章的某个副本中，主角利用这个思路解决了一个关键问题

**公车留下的物品或信息成为副本关键**

主角从公车上带出来的东西——无论是物理的还是信息层面的——在副本中发挥作用：

- **物理物件**：一枚从公车座椅缝隙里找到的硬币，在第三个副本的交易系统中发现是特殊货币；一张从死去乘客口袋里取出的便条，上面的数字是某个副本密码的组成部分
- **信息遗产**：公车上老玩家死前来不及说完的半句话，主角一直记着，在某个副本中遇到特定触发条件后，这半句话的含义终于完整了
- **心理印记**：公车经历给主角留下的特定反应模式——在密闭空间里本能地寻找出口、对编号系统的条件反射式解读——在副本中有时是优势，有时是陷阱
- **系统档案**：公车阶段的表现被系统记录，在某些副本中，系统会"用主角的公车历史来对付他"——专门针对他在公车上的弱点设计了规则

---

#### 各类恐怖主题的设计指南

**密室困局（公车经历的延续升级）**

密室副本是公车经历在空间层面的升级——从"一辆移动的车"变成"静止的封闭空间"，压迫感在升级的同时性质也在变化。

公车密室的恐惧来自"运动中的不确定性"（不知道要去哪里），而静止密室的恐惧来自"静止中的不可逃离性"（知道只能在这里）。

设计要点：
- **空间层级的升级**：公车是线性的（前后），密室可以是多维的（上下左右、地下室/阁楼/夹层）。让空间本身更复杂，提升探索的叙事维度
- **规则精密度的升级**：公车规则可以比较粗糙（"不要大声"），密室规则应该更精密，有更多相互咬合的条件（"当A条件满足且B条件不满足时，可以执行C"）
- **独处时间的增加**：密室中玩家可能被分散，独处带来的孤立感是公车上没有的恐惧维度——和所有人在一起的集体恐惧，vs 只有自己一个人的孤独恐惧
- **公车连接**：密室的某个房间，布置和公车内部有细节上的相似性（同款材质的扶手杆、同样的地板图案、甚至一个一模一样的编号牌）——主角意识到密室和公车可能出自同一个"设计者"

**诡异村庄（规则改变了，但博弈心态不变）**

公车是移动的封闭空间，村庄是静止的半开放空间——乘客变成了"外来者"进入了一个有自己规则体系的地方。

- **规则体系的本质差异**：公车规则是系统明确公告的，村庄规则是需要观察、询问、试错来发现的"潜规则"。前者是"我知道规则但可能做不到"，后者是"我甚至不知道规则是什么"
- **NPC的复杂性**：公车上没有NPC（或者说NPC伪装成了玩家），村庄里的NPC是否是真实的人？他们知道玩家的真实身份吗？他们是受害者还是共谋？
- **博弈对象的扩展**：公车博弈的对象是有限的几个乘客；村庄博弈的对象是整个村庄的权力结构——谁是村长/长老/掌握信息的人，谁是被村庄压制的边缘人，谁可能是暗中的盟友
- **公车连接**：村庄中的某些居民，表现出与公车乘客相似的行为模式——他们的眼神、他们处理危险的方式——让主角怀疑他们曾经也是玩家，或者他们正在被系统影响

**废弃建筑（从博弈转向对抗外部威胁）**

公车是"人与人之间的博弈"为主，废弃建筑副本是"人与环境/威胁之间的对抗"为主。

- **威胁的性质转变**：公车上最大的威胁是"其他人"，废弃建筑中最大的威胁是"建筑本身"（倒塌的风险、隐藏的陷阱、不知道在哪里的未知存在）。这种转变让已经建立的人际关系有了新的测试——当外部威胁更大时，人们是否会放下内部矛盾？
- **建筑历史的叙事价值**：废弃建筑都有过去——这里发生过什么，为什么废弃，之前的人在这里留下了什么。这段历史与玩家的任务之间的关系是设计重点
- **环境叙事代替对话叙事**：公车密室靠对话和心理博弈推进；废弃建筑靠环境探索和发现推进。两种叙事节奏的切换给读者带来新鲜感
- **公车连接**：废弃建筑的某处发现了和公车上编号牌相同材质、相同工艺的物品；或者建筑的某个房间有一块类似公车广播系统的装置，但更古老，暗示系统比公车本身更久远

**社会实验（人性博弈放大镜——最接近公车精神的副本类型）**

社会实验副本是公车经历在"人性主题"层面的直接延续和深化，是公车阶段精神内核的升级版本。

- **为什么说它最接近公车精神**：公车的核心看点是"有限信息下的信任与背叛博弈"——社会实验副本把这个主题放到一个更极端的条件下重新放大。公车上玩家的博弈受到物理限制和规则限制，社会实验副本则将规则本身设计成"考验人性的机制"
- **社会实验副本的规则设计原则**：
  - 规则必须创造"个人利益 vs 集体利益"的对立——如果所有人选择合作，则所有人受益；如果有人背叛，背叛者获得更大收益但其他人受损
  - 规则必须有"信息不对称"要素——不是所有人都知道规则的全貌，玩家需要推断他人是否知道自己不知道的事
  - 规则必须有"时间压力"——合作需要时间来建立信任，但时间本身是一种限制资源
- **公车连接**：社会实验副本中的"合作困境"，应该直接呼应公车上主角做出的某个选择——当年在公车上他选择了背叛还是信任？这次面对类似处境，他能做出不同的选择吗？还是命运会重演？

---

#### 难度递进设计

C→B→A→S→SS级的难度递进不应该只是"怪更强了"，而应该在机制层面体现出根本性的变化。

**五个维度的难度递进**：

**规则复杂度**
- C级：规则简单直白，违反后果一对一（做了X，发生Y）
- B级：规则有条件判断（如果A+B同时满足才触发C）
- A级：规则之间有交互（规则1的执行会改变规则2的判定条件）
- S级：元规则——玩家需要发现并理解"规则关于规则的规则"（如"每当一条规则被理解，就会生成一条新规则"）
- SS级：规则本身是谎言或陷阱——真正的规则在表面规则之下，需要对表面规则的行为做出解读才能发现

**信息可获取度**
- C级：关键信息可以通过正常探索获得
- B级：关键信息被分散在多个地点，需要整合
- A级：关键信息被NPC/环境主动隐藏，需要打破隐藏机制才能获取
- S级：玩家拥有的信息本身可能是错的——信息的真伪辨别成为核心挑战
- SS级：完成副本所需的关键信息根本不在副本内，必须依靠之前副本积累的知识或与其他玩家共享信息

**威胁类型**
- C级：威胁是单一可识别的（一个具体的怪物/一个明确的危险）
- B级：威胁是多元的（物理威胁+心理威胁并行）
- A级：威胁的来源模糊——不确定是外部实体、规则本身、还是其他玩家
- S级：威胁是主观的——每个玩家面对的威胁根据他们的心理状态而不同
- SS级：威胁是递归的——试图消灭威胁的行为本身就是威胁的来源

**道德代价**
- C级：选择有代价，但代价是外部的（失去资源/时间）
- B级：选择有道德代价（必须放弃一个人才能推进）
- A级：道德代价是持续的（某个选择的后果会在未来持续影响，如某人因你的选择而憎恨你）
- S级：道德代价是系统性的（你的选择会影响其他玩家的副本）
- SS级：道德代价超出了"游戏"的范畴，会影响到副本外的真实世界

**团队动态**
- C级：可以独自完成
- B级：需要团队合作，但合作成本低
- A级：合作是必要的，但合作本身就有信任成本（因为团队中可能有不同议程的人）
- S级：团队成员的信息是分割的，每个人只知道完成副本所需信息的一部分
- SS级：完成副本的条件之一是团队的某个成员必须出局

---

#### 规则设计方法论

好的副本规则能让玩家（和读者）同时感受到"可以遵守"和"随时可能犯错"的双重压力。一条坏规则要么太简单（玩家轻松遵守，失去张力），要么太荒诞（玩家感到无力，失去代入感）。

**好副本规则的三个条件**：

**条件一：可理解**

规则的逻辑必须在副本的世界观框架内是可以被理解的，即使这个理解来得很晚。读者在理解规则后，应该感到"这条规则是合理的，在这个世界里"，而不是"这纯粹是随机的"。

可理解不等于"立刻能理解"——规则可以是谜，但谜的答案必须是可以被推导出来的，而非完全随机。设计检验：能否用"因为……所以规则是……"的句式完成一个自洽的解释？

**条件二：可被违反**

规则必须有"不小心犯错"的可能性。如果规则太简单，玩家可以轻松遵守，张力消失。规则应该设计成"你知道规则，但在特定条件下，遵守它比你想象的更难"。

设计方向：
- 规则要求的行为与人的本能相反（"有危险时不可奔跑"——本能是跑）
- 规则触发条件模糊（"禁止发出声音"——呼吸算吗？心跳算吗？）
- 规则的判定有时间延迟（你已经违反了，但还不知道）
- 两条规则同时满足时，遵守A就必然违反B

**条件三：违反有代价**

代价必须是具体的、可预期的，但同时让玩家不确定"代价到底是什么程度"。

- 代价层次：轻度违反→警告；中度违反→惩罚（资源/时间/身体）；重度违反→立即淘汰
- 代价的戏剧性：不是所有违反都有相同的代价——同样的行为，在不同的上下文中，代价可能完全不同。这种不确定性比固定代价更有张力
- 代价的扩散性：玩家A的违反是否会影响到玩家B？如果会，会如何影响？这种规则最能测试团队凝聚力

**如何设计让玩家既想遵守又会不小心触犯的规则**：

核心设计原则：规则要针对"人在极度压力下最可能失控的部分"来设计。

- **情绪性规则**："禁止表现出恐惧"——人在极度恐惧下的本能反应就是表现恐惧，这条规则把恐惧本身变成了更大的恐惧
- **认知性规则**："必须在3秒内回答所有系统问题"——认知压力下人会失语，而3秒的时间压力让理性分析变得不可能
- **道德性规则**："每个周期必须由团队投票淘汰一名成员"——这条规则迫使玩家主动参与"选择谁死"，道德代价让每次执行都是一次心理伤害
- **物理性规则**："禁止睡眠"——人的生理限制让这条规则随时间自动变得越来越难遵守，而且"将要违反"和"已经违反"的边界是模糊的

---

#### 「与公车的关联」字段设计

每一个副本都应该和公车有有机的联系，这种联系不是"强行提及"，而是让公车经历真正影响副本的走向。

**三种有机联系类型**：

**机制关联**
公车上的某条规则或现象，在副本中以更深层的形式被解释或延伸，揭示公车规则背后的系统逻辑。

- 具体联系设计示例：
  公车上有一条规则"禁止乘客分组行动"。主角当时不理解这条规则的原因，只是遵守了。在一个关于"集体意识"的副本中，主角发现副本的核心威胁是一种能侵入分散个体的意识形态怪物——在群体中它无法侵入，单独行动才会被感染。回想公车规则，主角理解：那条规则不是为了控制，而是在保护。

**人物关联**
公车上认识的人，在副本中以改变了的形式重新出现，双方过去的关系在新的情境下产生化学反应。

- 具体联系设计示例：
  公车上，主角和一个叫"方白"的女人短暂地建立了信任，但后来方白被迫出卖了主角以换取自己的安全，主角因此受伤。在第五个副本中，主角遇到了一个新玩家，她的行为模式和方白高度相似——会在危机中保持冷静，但总是在最后一刻为自己留退路。主角面对两个选择：把她当方白的教训重复，不给信任；还是承认每个人都有独立的选择权，给她一次机会？这个选择直接决定了副本的结局。

**信息关联**
公车上获得的一条不完整信息，在副本中获得了补全，形成"啊，原来当时那个细节……"的叙事闭环。

- 具体联系设计示例：
  公车行驶途中，主角注意到广播系统在某些路段会有轻微的静电干扰，同时公车上有一个乘客（后来死亡）每次到这个路段都会低头看一眼手表。当时主角不明白这两件事的联系。在一个通信系统副本中，主角发现系统的信号干扰机制与公车广播的干扰模式完全相同——那个乘客的手表是一个接收器，他是来测试这个系统的，而他的死不是普通的规则触发，是系统主动清除了泄露信息的人。

---

### 设计要点

1. **公车是叙事原点，不是故事起点**：公车的意义不在于它是第一个发生的事，而在于它是所有后续事件可以追溯的源头。每当副本引用公车经历，都在强化这条叙事原点的地位
2. **延续性优先于创新性**：新副本可以有全新的恐怖主题，但和公车经历的有机连接是质量的底线。完全与公车割裂的副本，无论多好，都削弱了整体叙事的凝聚力
3. **读者的"认出感"**：最好的公车-副本连接，能让读者在副本中某个时刻自发地想起公车上的某件事——不是被剧情强行提醒，而是自然地产生"等等，这个……"的感觉

### 常见错误

- **公车经历在第一个副本结束后消失**：从第二个副本开始，公车变成了一个遥远的记忆，对叙事没有任何影响——整个系列变成了"无连接的副本合集"
- **关联太刻意**：每个副本都在某个时刻强行提到公车，读者能感受到作者的刻意安排，反而削弱了叙事的自然感
- **难度升级流于表面**：高级副本只是"血量更高的怪、更强的惩罚"，没有在规则复杂度、道德代价和团队动态上进行根本性的升级
- **规则设计没有内在逻辑**：规则的存在找不到任何可以理解的原因，只是"系统说了算"——让玩家感到无力而非紧张
- **副本和副本之间信息断流**：每个副本揭示的信息是独立的，没有累积效果；读者无法从多个副本的信息碎片中拼出更大的图景',
  '## Scene/Instance Generation — Thriller Bus Novel

Instances are the main battlefield after the bus, but the bus is always the shared "origin memory" of the protagonist and reader. Good instance design does not discard the bus experience and start fresh — it lets that experience permeate every instance in various ways, so readers entering each new instance feel "that bus is still following me."

---

### Field Generation Guide

#### Continuity from the Bus Experience

The bus is the only "shared history" of the protagonist and reader. Instance design should use this history as a narrative asset, not an abandoned starting point.

**Three Core Ways to Use the Bus Experience**:

**People met on the bus reappearing**

The most direct continuation: passengers who didn''t die on the bus reappear in instances, changed by what has happened since.

- **Reunion in the same instance**: Someone from the bus is assigned to the same instance, but the power dynamics (strength/information/allegiance) have shifted. The person who helped you on the bus may now be your biggest competitor; the person you didn''t trust may now be the only one willing to ally with you
- **Opposing-side instance encounter**: Different players'' instances have contact points (overlapping rules), and two old acquaintances from the bus enter the same narrative from different angles
- **As intelligence**: Information gathered in an instance (NPC descriptions, system records, names on objects) points to someone from the bus — their track through the system provides a critical clue
- **As traces of the dead**: A passenger who died on the bus has left traces in the instance in some system-permitted form (not necessarily as a ghost — could be a shadow of an instance they once cleared, an object they left, some influence in the instance''s rules)

Design principle: reunion should not just be an "emotional callback" — it should change the power dynamics within the instance. A familiar face brings information (what do they know?) and risk (what do they know about you?).

**Rules discovered on the bus being verified in instances**

Certain bus rules or observations prove to have deeper meanings when they reappear in new forms in later instances:

- **Rule migration**: Bus rule "no loud noise" — an instance contains a sound-triggered creature, and the protagonist''s bus-trained muscle memory ("quiet means survival") makes them adapt faster than other newer players
- **Rule reversal**: Bus rule "always take the advantageous position" — in a specific instance, the advantageous position is a trap. The protagonist makes a mistake that a new player wouldn''t, precisely because of their bus experience
- **Rule etymology**: An instance reveals a mechanism that makes the protagonist recall an inexplicable anomaly from the bus, and the two align — "so that''s why they wouldn''t let us open the windows"
- **Rule prophecy**: A seemingly casual remark from a veteran on the bus ("rules always leave gaps") becomes the insight the protagonist uses to solve a critical problem twenty chapters later

**Objects or information from the bus becoming instance keys**

Things the protagonist brought off the bus — physical or informational — have impact in instances:

- **Physical objects**: A coin found in a bus seat crack proves to be special currency in the third instance''s trading system; a note taken from a dead passenger''s pocket contains numbers that form part of an instance code
- **Information legacy**: The half-sentence a veteran on the bus didn''t finish before dying stays with the protagonist; in a specific instance, a trigger condition finally completes its meaning
- **Psychological imprints**: The behavioral patterns the bus burned into the protagonist — instinctively seeking exits in closed spaces, conditioned reflexes for number systems — are sometimes advantages, sometimes traps in instances
- **System records**: The bus-phase performance was recorded; in certain instances, the system "uses the protagonist''s bus history against them" — rules specifically designed around weaknesses they showed on the bus

---

#### Design Guide for Horror Theme Types

**Sealed Room (direct upgrade of the bus experience)**

Sealed room instances are the spatial upgrade of the bus experience — from a "moving vehicle" to a "stationary closed space." The pressure increases while the nature of the fear changes.

Bus claustrophobia comes from "uncertainty in motion" (not knowing where you''re going). Static sealed room fear comes from "inescapability in stillness" (knowing you can only be here).

Design principles:
- **Spatial complexity upgrade**: The bus is linear (front to back); a sealed room can be multidimensional (up/down/left/right, basement/attic/hidden compartment). More complex space adds narrative dimensions to exploration
- **Rule precision upgrade**: Bus rules can be rough ("no noise"); sealed room rules should be more precise with more interlocking conditions ("when A is satisfied and B is not, C can be executed")
- **Increased alone-time**: Players may be separated in sealed rooms; the isolation of being alone is a fear dimension unavailable on the bus — collective fear with everyone together vs. alone fear with only yourself
- **Bus connection**: A room in the sealed space has detail-level similarities to the bus interior (same handrail material, same floor pattern, even an identical number tag) — the protagonist realizes the sealed room and the bus may share the same "designer"

**Eerie Village (rules changed, but the gaming mindset is unchanged)**

The bus is a moving closed space; a village is a stationary semi-open space — passengers become "outsiders" entering a place with its own rule system.

- **Fundamental difference in rule character**: Bus rules are system-announced and explicit; village rules are "unwritten rules" discovered through observation, inquiry, and trial-and-error. The former is "I know the rules but may not be able to follow them"; the latter is "I don''t even know what the rules are"
- **NPC complexity**: The bus had no NPCs (or NPCs disguised as players); in a village, are the NPCs real people? Do they know players'' true identities? Are they victims or accomplices?
- **Expanded gaming targets**: Bus gaming involves a limited set of passengers; village gaming involves the entire power structure of the village — who is the village head/elder/information holder, who is the marginalized person suppressed by the village, who might be a secret ally
- **Bus connection**: Certain village residents display behavioral patterns similar to bus passengers — the look in their eyes, how they handle danger — making the protagonist wonder if they were once players, or if they are being influenced by the system

**Abandoned Building (shifting from gaming to fighting external threats)**

The bus is primarily "person vs. person gaming"; the abandoned building instance is primarily "person vs. environment/threat confrontation."

- **Shift in threat nature**: On the bus, the greatest threat is "other people"; in an abandoned building, the greatest threat is "the building itself" (collapse risk, hidden traps, unknown presence of unknown things somewhere). This shift tests established interpersonal relationships in a new way — when external threats are greater, do people set aside internal conflicts?
- **Narrative value of building history**: Every abandoned building has a past — what happened here, why was it abandoned, what did people leave behind. The relationship between this history and the players'' task is the key design focus
- **Environmental narrative replaces dialogue narrative**: The bus closed-space advances through dialogue and psychological gaming; the abandoned building advances through environmental exploration and discovery. Switching between these narrative rhythms brings freshness
- **Bus connection**: A location in the building yields objects of the same material and workmanship as the bus number tags; or a room contains a device resembling the bus announcement system but much older, suggesting the system predates the bus itself

**Social Experiment (magnifying glass for human nature gaming — the instance type most aligned with bus spirit)**

Social experiment instances are the direct continuation and deepening of the bus experience at the "human nature theme" level — the upgraded version of the bus phase''s spiritual core.

- **Why it''s most aligned with bus spirit**: The bus''s core appeal is "trust and betrayal gaming under limited information" — social experiment instances take this theme to more extreme conditions. Bus gaming is constrained by physical and rule limitations; social experiment instances design the rules themselves as "mechanisms for testing human nature"
- **Rule design principles for social experiment instances**:
  - Rules must create "individual interest vs. collective interest" opposition — if everyone cooperates, everyone benefits; if someone defects, the defector gains more but others lose
  - Rules must have "information asymmetry" elements — not everyone knows the full scope of the rules; players must infer whether others know things they don''t
  - Rules must have "time pressure" — cooperation requires time to build trust, but time itself is a limited resource
- **Bus connection**: The "cooperation dilemma" in the social experiment instance should directly echo a choice the protagonist made on the bus. Did they choose betrayal or trust on the bus? Facing a similar situation now, can they make a different choice? Or will fate repeat itself?

---

#### Difficulty Progression Design

The C→B→A→S→SS difficulty progression should not just mean "stronger monsters" — it should reflect fundamental changes at the mechanism level.

**Five Dimensions of Difficulty Progression**:

**Rule complexity**
- C: Rules simple and direct, consequences one-to-one (do X, Y happens)
- B: Rules have conditional logic (only triggers C if A and B are both satisfied simultaneously)
- A: Rules interact (executing Rule 1 changes the trigger conditions for Rule 2)
- S: Meta-rules — players must discover and understand "the rules about rules" (e.g., "every time a rule is understood, a new rule is generated")
- SS: The rules themselves are lies or traps — the real rules are beneath the surface rules and require interpreting the behavior behind surface rules to discover

**Information accessibility**
- C: Key information obtainable through normal exploration
- B: Key information scattered across multiple locations, must be integrated
- A: Key information actively hidden by NPCs/environment; the hiding mechanism must be broken
- S: The information players hold may itself be wrong — distinguishing true from false information is the core challenge
- SS: The key information needed to complete the instance is not in the instance at all; must rely on knowledge accumulated from previous instances or shared from other players

**Threat type**
- C: Threat is singular and identifiable (one specific monster, one clear danger)
- B: Threats are multiple (physical threat + psychological threat running in parallel)
- A: Source of threat is ambiguous — unclear whether it''s an external entity, the rules themselves, or other players
- S: Threat is subjective — each player faces a different threat based on their psychological state
- SS: Threat is recursive — the act of trying to eliminate the threat is itself the source of the threat

**Moral cost**
- C: Choices have costs, but the costs are external (losing resources/time)
- B: Choices have moral costs (must abandon a person to advance)
- A: Moral cost is ongoing (the consequences of a choice persist into the future — someone hates you because of what you did)
- S: Moral cost is systemic (your choice affects other players'' instances)
- SS: Moral cost extends beyond the "game" and affects the real world outside instances

**Team dynamics**
- C: Can be completed alone
- B: Team cooperation needed, but cooperation cost is low
- A: Cooperation is necessary, but cooperation itself has a trust cost (team may have members with different agendas)
- S: Team members'' information is partitioned — each person knows only part of what''s needed to complete the instance
- SS: One condition for completing the instance is that a team member must be eliminated

---

#### Rule Design Methodology

Good instance rules make players (and readers) simultaneously feel "this can be followed" and "I might slip up at any moment." A bad rule is either too simple (players follow it easily, tension disappears) or too absurd (players feel powerless, immersion breaks).

**Three Conditions for Good Instance Rules**:

**Condition 1: Understandable**

The rule''s logic must be understandable within the instance''s world-view framework, even if that understanding comes late. After understanding a rule, readers should feel "this rule makes sense, in this world" — not "this is completely random."

Understandable does not equal "immediately understandable" — rules can be mysteries, but the answers must be derivable, not arbitrary. Design test: can you complete a self-consistent explanation using the sentence "Because [X], the rule is [Y]"?

**Condition 2: Violable**

Rules must have the possibility of "accidental violation." If a rule is too simple and easily followed, tension disappears. Rules should be designed so that "you know the rule, but under specific conditions, following it is harder than you expected."

Design directions:
- Rule requires behavior opposite to human instinct ("do not run when in danger" — instinct is to run)
- Rule trigger conditions are ambiguous ("no sound" — does breathing count? does a heartbeat count?)
- Rule violation has a time delay (you''ve already violated it but don''t know yet)
- When two rules are simultaneously in play, following A inevitably violates B

**Condition 3: Violation has a cost**

The cost must be concrete and expectable, while keeping players uncertain about "just how bad the cost will be."

- Cost tiers: minor violation → warning; moderate violation → penalty (resources/time/physical); severe violation → immediate elimination
- Cost drama: not all violations carry the same cost — the same action in different contexts may have completely different consequences. This uncertainty creates more tension than fixed costs
- Cost propagation: does Player A''s violation affect Player B? If so, how? Rules like this are the best test of team cohesion

**How to design rules players both want to follow and will accidentally break**:

Core design principle: design rules against "what people are most likely to lose control of under extreme pressure."

- **Emotional rules**: "Forbidden to display fear" — the human instinct under extreme fear is to show fear; this rule turns fear itself into an even greater fear
- **Cognitive rules**: "Must answer all system questions within 3 seconds" — people go blank under cognitive pressure, and the 3-second window makes rational analysis impossible
- **Moral rules**: "Each cycle, the team must vote to eliminate one member" — this rule forces players to actively participate in "choosing who dies"; the moral cost makes every execution a psychological wound
- **Physical rules**: "Sleep is forbidden" — human physiological limits make this rule automatically harder to follow over time; and the boundary between "about to violate" and "already violated" is blurry

---

#### Designing the "Bus Connection" Field

Every instance should have an organic connection to the bus — not a forced reference, but a connection that genuinely affects how the instance unfolds.

**Three Types of Organic Connection with Concrete Design Examples**:

**Mechanism connection**
A rule or phenomenon from the bus is explained or extended in deeper form within the instance, revealing the system logic behind the bus rule.

- Concrete connection example:
  The bus had a rule: "passengers must not split into separate groups." The protagonist didn''t understand why, and simply complied. In an instance centered on "collective consciousness," the protagonist discovers that the core threat is an ideological creature that can only invade isolated individuals — it cannot infiltrate a unified group. Looking back at the bus rule, the protagonist understands: that rule wasn''t for control, it was for protection.

**Character connection**
Someone the protagonist knew on the bus reappears in changed form; the past relationship between them generates chemistry in the new context.

- Concrete connection example:
  On the bus, the protagonist briefly built trust with a woman named Fang Bai — but later Fang Bai was forced to sell the protagonist out in exchange for her own safety, and the protagonist was hurt as a result. In the fifth instance, the protagonist meets a new player whose behavioral patterns closely mirror Fang Bai''s — calm in crises, but always keeping a backdoor open for herself at the last moment. The protagonist faces two choices: treat her as a repetition of the Fang Bai lesson and withhold trust; or acknowledge that every person has their own agency and give her a chance. This choice directly determines the instance''s outcome.

**Information connection**
An incomplete piece of information from the bus is completed within an instance, forming a narrative loop of "ah, so that detail back then..."

- Concrete connection example:
  While the bus was driving, the protagonist noticed the announcement system had faint static interference in certain road sections; and one passenger (who later died) would glance at their watch every time the bus entered that section. The protagonist didn''t understand the connection between these two things. In a communications-system instance, the protagonist discovers that the system''s signal interference mechanism is identical in pattern to the bus announcement interference. That passenger''s watch was a receiver; they were there to test the system — and their death was not a normal rule trigger but the system actively eliminating someone who was leaking information.

---

### Design Principles

1. **The bus is the narrative origin, not just the story''s starting point**: The bus''s significance is not that it happened first, but that it is the traceable source of all subsequent events. Every time an instance references the bus experience, it reinforces the authority of this narrative origin
2. **Continuity over novelty**: New instances can have entirely new horror themes, but organic connection to the bus experience is the quality baseline. No matter how good an instance is on its own terms, a complete disconnect from the bus weakens the overall narrative cohesion
3. **The reader''s "recognition moment"**: The best bus-instance connections make readers spontaneously think of something from the bus at a specific instance moment — not because the plot forces them to, but because a natural "wait, this..." arises on its own

### Common Mistakes

- **Bus experience disappears after the first instance**: From the second instance onward, the bus becomes a distant memory with no impact on the narrative — the whole series becomes "an unconnected instance collection"
- **Connection too forced**: Every instance forcibly mentions the bus at some point; readers can feel the author''s deliberate arrangement and it actually weakens the narrative''s naturalness
- **Difficulty escalation stays surface-level**: Higher-tier instances just have "higher HP monsters and harsher penalties," with no fundamental upgrades in rule complexity, moral cost, or team dynamics
- **Rules have no internal logic**: The existence of a rule has no understandable reason — it''s just "the system says so" — making players feel powerless rather than tense
- **Information flow breaks between instances**: Each instance''s revealed information is independent with no cumulative effect; readers cannot piece together a larger picture from the information fragments across multiple instances',
  (SELECT id FROM novel_creation_method WHERE name = '惊悚公车小说' LIMIT 1),
  1,
  86,
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
