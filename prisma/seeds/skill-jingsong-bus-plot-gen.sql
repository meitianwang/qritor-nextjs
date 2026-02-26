-- 惊悚公车小说「剧情生成」技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '惊悚公车小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-jingsong-bus-plot-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'jingsong-bus-plot-gen',
  '「剧情」生成：为惊悚公车小说设计公车阶段的叙事单元与剧情模板，涵盖五类核心情节类型、公车到副本的过渡叙事、多场副本之间的剧情连接技法',
  '"Plot" generation: design narrative units and plot templates for the bus phase in thriller bus novels, covering five core plot types, bus-to-dungeon transition narrative, and multi-dungeon plot connection techniques',
  '## 「剧情」生成 — 惊悚公车小说

惊悚公车小说的剧情设计核心在于理解公车阶段的**叙事单元不是"副本"，而是"事件"**。公车不是打关，公车是一个持续运转的压力容器——里面的人随时可能出事，随时可能反目，随时可能发现新规则。

好的公车段落剧情不靠体量取胜，靠**密度**：每一个事件都必须同时推进信息、关系、生存三条线。一次淘汰之后，剩余乘客对规则的理解加深了，某种人际关系破裂了，某个隐藏规则被无意间验证了——这才是合格的公车事件。

---

### 一、公车段落的叙事单元

**基本叙事单元：「事件」而非「副本」**

公车内的剧情不以关卡为单位推进，而以**事件（Event）**为单位推进。一个完整的「公车事件」包含以下结构：

**事件四要素**：
1. **触发条件**：什么引发了这个事件（违反规则/有人行动/站次变化/信息暴露）
2. **博弈过程**：事件发展中各方的应对和选择
3. **结果**：淘汰/联盟变化/规则发现/信息重组
4. **余震**：事件结束后留下的未解悬念或改变的格局

**五类核心事件类型**：

| 事件类型 | 触发机制 | 博弈核心 | 结果形态 |
|---------|---------|---------|---------|
| 规则陷阱 | 某行为触发惩罚 | 谁知道规则、谁被牺牲 | 淘汰+规则教学 |
| 信息博弈 | 老玩家选择性透露 | 信息定价和交换 | 联盟重组 |
| 联盟背叛 | 内部利益出现冲突 | 背叛时机的计算 | 格局重新洗牌 |
| 隐藏规则发现 | 意外触发额外规则 | 利用规则逆转 | 形势逆转 |
| 淘汰时刻 | 淘汰机制触发 | 谁死、怎么死、揭示什么 | 死亡+信息释放 |

**叙事密度原则**：
- 一个公车事件最多 3-5 个场景
- 每个场景必须至少推进一条叙事线（信息/关系/生存）
- 公车总事件数：4-7 个（太少节奏松散，太多读者疲劳）

---

### 二、五类核心情节模板

#### 模板一：「规则陷阱」型

**核心逻辑**：一个看似合理的行为触发了惩罚，使某个人被淘汰或受损。关键在于——其他乘客事后都能看出这是个陷阱，但在触发前没有人预见到。

**情节结构**：
1. 某乘客做了一件"正常人会做"的事（移动位置/帮助他人/发出声音/使用手机）
2. 系统宣布规则触发，该乘客受到惩罚
3. 其他乘客意识到这个行为是禁止的——开始重新审视"什么是安全的"
4. 受罚者的遭遇成为规则的"活教材"，其他人的行为模式立刻改变

**叙事要点**：
- 触发陷阱的行为必须足够合理，让读者和主角都没有提前预见
- 惩罚必须即时且具体（不能是模糊的"扣分"）
- 受罚者的反应揭示这个人的性格（有人崩溃，有人冷静，有人要报复）
- 陷阱揭示后，其他人对"规则体系"的恐惧上升——恐惧的对象从其他人转向系统本身

**写作禁忌**：不要让老玩家提前透露"那个行为有危险"——这会消灭陷阱的惊喜感；但可以让老玩家事后说"我就知道"，制造更大的愤怒

---

#### 模板二：「信息博弈」型

**核心逻辑**：老玩家（或者获得了信息的人）面临一个选择——透露多少，向谁透露，换取什么。信息的流动决定了本轮的权力结构。

**情节结构**：
1. 某人拥有关于规则的关键信息（老玩家经验、获得了道具、意外发现）
2. 其他乘客开始感知到信息不对称，各种试探行为出现
3. 信息持有者开始进行"信息定价"——为不同的人设置不同的交换条件
4. 信息流动改变了局势（某人得到信息后立刻行动，某人因为没有信息而受损）

**叙事要点**：
- 信息本身要有真正的生死价值，不能是无关紧要的背景设定
- 老玩家的选择性透露要有清晰的逻辑（他为什么透露这个，不透露那个）
- 信息交换的"价格"要具体（交换信息/提供庇护/承诺联盟/金属对等）
- 信息落地后必须产生实际影响，不能只是对话

**核心张力**：信息持有者的两难——越垄断信息越有权力，但越暴露自己是"知情者"越危险

---

#### 模板三：「联盟背叛」型

**核心逻辑**：结盟——内部出现结构性矛盾——关键时刻有人选择背叛。背叛不应该是突然的，应该是蓄谋已久但读者又觉得合理的。

**情节结构**：
1. **结盟阶段**（1-2个场景）：两个或多个人因为共同利益结成同盟，但各自的利益并不完全一致
2. **裂缝阶段**（1个场景）：一个事件让同盟内部出现利益冲突——谁应该被牺牲，谁获得更多，谁知道的信息更多
3. **临界点**（1个场景）：背叛者面对最后抉择，留给读者一个"他会不会出刀"的悬疑时刻
4. **出刀/不出刀**（1个场景）：背叛发生或者没有发生——两种结果都有各自的叙事价值

**叙事要点**：
- 结盟阶段要让读者感受到同盟的真实性（不能一开始就感觉是假联盟）
- 裂缝的原因必须结构性而非偶然性——不是"他变坏了"，而是"利益关系决定了他必须做这个选择"
- 背叛的时机要经过计算（选在对方最脆弱的时刻）
- 背叛之后，背叛者要面对新的困境（背叛者的孤立/其他人对他的重新评估）

**「出刀」的两难**：最优的"背叛时刻"往往也是"读者希望他不要背叛"的时刻——这是联盟背叛情节的真正张力所在

---

#### 模板四：「隐藏规则发现」型

**核心逻辑**：发现系统公告里没有明说的额外规则——这个规则一旦被发现，可以用来逆转当前的不利局面，或者保护自己。

**情节结构**：
1. 当前形势对主角（或某人）不利
2. 某个细节引起注意——可能是一个奇怪的系统提示，可能是别人的行为产生了意外结果
3. 主角进行推理和测试（测试过程本身有风险）
4. 隐藏规则被证实，局势逆转

**叙事要点**：
- 发现线索的铺垫要自然，不能是主角"突然灵光一闪"
- 测试隐藏规则必须有代价——不能随便测试，测试失败可能触发惩罚
- 逆转必须是局部的，不能一个规则解决所有问题（避免万能金手指）
- 发现隐藏规则后，主角需要决定是否共享——这本身就是一个新的博弈

**隐藏规则的设计要点**：
- 隐藏规则要与公告规则有逻辑关联（不能是完全独立的随机规则）
- 最好是"公告规则的漏洞"或"公告规则的反面"
- 能被利用一次，不能被无限复用

---

#### 模板五：「淘汰时刻」型

**核心逻辑**：一个角色的死亡（或被淘汰出局）不只是人数减少——死亡场景必须同时完成三件事：揭示这个人的本质、教学一条规则、改变剩余乘客的情绪和关系格局。

**情节结构**：
1. **死亡前的最后时刻**：这个人做了什么选择，说了什么最后的话（或没有机会说）
2. **死亡本身**：淘汰的方式要具体、视觉化，但不能只有暴力，要有规则含义
3. **死亡的余波**：其他乘客的反应——有人庆幸，有人悲伤，有人立刻开始盘算新的格局
4. **死亡揭示的信息**：这个人的死告诉了剩余乘客什么（关于规则/关于某人/关于系统的性质）

**「好的死亡」设计标准**：

| 层次 | 内容 |
|------|------|
| 关于这个人 | 死亡方式或最后时刻揭示了这个角色的真实性格 |
| 关于规则 | 死亡是对某条规则的最终演示 |
| 关于其他人 | 其他人的反应揭示了他们各自的心理和立场 |
| 关于读者 | 读者对「这个人不该死」或「他的死是必然的」有强烈情感反应 |

**写作禁忌**：
- 死亡不能只是"死了就死了"——死亡必须改变些什么
- 不能所有淘汰都以相同方式死亡——淘汰方式的多样性是规则丰富度的体现
- 最受读者喜爱的角色不要死得太快，也不能无限保护（规则漏洞感）

---

### 三、公车到副本的过渡剧情

**通关时刻的设计**：

公车到副本的过渡不是简单的"下车了"——这个时刻需要处理三个问题：

**1. 最后几个幸存者的状态**
- 他们之间的关系（互信/互疑/仇恨/临时同盟）是带入副本的核心资产
- 每个人手上有什么（道具/信息/伤势）是副本开局的前置条件
- 他们对接下来是什么的预期（正确的/错误的/完全没有预期的）

**2. 离开公车的仪式感**
- 系统如何宣布通关（声音/视觉/物理变化）
- 公车本身发生了什么（消失/停在路边/变成副本入口的一部分）
- 过渡过程中有没有最后一次信息释放（系统的最后提示/司机的只言片语/门口贴的告示）

**3. 第一印象的副本场景**
- 初入副本的感受必须与公车的密闭感形成对比（开阔感/更深的密闭感/混乱感）
- 第一个副本场景必须立刻建立新的威胁感
- 前几分钟不宜再解决公车遗留的人际关系问题，先让副本接管注意力

**过渡叙事的三种模式**：

| 模式 | 适用场景 | 叙事效果 |
|------|---------|---------|
| **硬切换** | 公车最后一站突然结束，直接切入副本场景 | 制造时间压缩感，读者和主角同样茫然 |
| **渐变过渡** | 公车逐渐变形/环境逐渐变化，无明确分界线 | 制造持续恐惧感，边界模糊比硬切换更恐怖 |
| **仪式过渡** | 系统有明确宣告，幸存者有短暂喘息时间 | 让读者和角色都有机会消化公车事件，同时预告副本规则 |

---

### 四、多场副本之间的剧情连接

**如何利用公车记忆推进副本剧情**：

公车是所有副本的共同起点——公车阶段建立的人际关系、获得的信息、产生的仇恨，都可以在后续副本中持续发酵。

**三类公车遗产**：

**遗产一：人际债务**
- 欠救命之恩→副本关键时刻必须还债
- 公车上建立的信任→副本中第一时间互相保护
- 公车上的背叛→副本中的暗中报复
- 设计要点：副本中的公车遗产要在"最不方便"的时机兑现——在副本最危险的时刻，昔日的恩怨突然成为行动的决定因素

**遗产二：信息不完整的线索**
- 公车阶段获得的碎片信息在某个副本中突然找到了配对
- 某人公车上留下的一句话在第三个副本里被证实是关键规则提示
- 设计要点：碎片信息要在读者几乎快忘了的时候出现——记忆成本本身是叙事张力的一部分

**遗产三：身份认知的修正**
- 公车上以为是新手的人在副本里展现老玩家级别的能力
- 公车上以为是可信同盟的人在副本里暴露了真实目的
- 设计要点：公车上建立的「错误印象」要在最具戏剧性的时刻被打破

---

### 五、常见剧情陷阱

**陷阱一：公车段落写太长读者审美疲劳**

症状：公车阶段超过全书的30%，每次规则宣布都要三章来讲清楚，反复渲染密室压迫感
解决方案：
- 公车事件之间要有节奏变化（慢/快/慢）
- 不是每个规则都需要被详细解释，有些规则可以在触发时才揭示
- 控制公车内的"无效对话"——没有推进任何叙事线的对话一律删除

**陷阱二：每次淘汰都太相似**

症状：第一次淘汰——违反规则死亡，第二次淘汰——违反规则死亡，第三次淘汰——还是违反规则死亡
解决方案：
- 淘汰方式必须多样化：违规死亡/被其他乘客出卖/自我牺牲/意外触发机关/被系统随机抽中
- 每次淘汰都要揭示一个新维度（第一次揭示规则，第二次揭示某人性格，第三次揭示系统真实性质）
- 淘汰的速度可以变化（有时突然，有时是慢慢死去）

**陷阱三：隐藏规则被发现太容易**

症状：主角每次遇到困境都能神奇地发现一个隐藏规则解决问题
解决方案：
- 隐藏规则的发现必须有代价（有人受伤，有信息暴露，有道具消耗）
- 每局只能有1个重要的隐藏规则被发现
- 有些隐藏规则的测试必须失败——让读者知道"测试本身有风险"

---

### 六、三个完整事件大纲示例

**示例一：「规则陷阱」型——「善意的代价」**

**背景**：公车上已有2次规则宣布，乘客们都在谨慎行事。一名新手乘客B看到老人C身体不适，决定把自己的水分给对方。

**事件展开**：
- 场景1：B把水递给C，其他乘客的表情各异——有人没注意，有人皱眉，老玩家D面色突变但没有说话
- 场景2：系统广播："侦测到物品交换行为，触发规则——交换行为视为结盟申报，请两方在下一站前公开声明结盟关系，否则两人均扣除1个状态等级"
- 场景3：B和C面面相觑——他们根本不认识，也不想公开结盟（会引来其他乘客的针对）。老玩家D此时走过来说"下次交换前先问我"，但没有帮忙
- 场景4：B和C选择公开声明结盟（不得已）。其他乘客立刻开始重新评估他们的威胁程度
- 余震：B质问D为什么不提前警告，D说"我没有义务保护所有人"——两人关系出现裂痕；同时，被强制结盟的B和C必须重新审视彼此，意外地发展出真实的合作关系

**揭示内容**：
- 关于规则：交换行为有隐藏含义，日常举动都可能触发规则
- 关于D：老玩家选择了旁观而不是提醒——他的自保逻辑暴露了
- 关于B&C：被迫的联盟可能比主动结盟更稳固

---

**示例二：「信息博弈」型——「三分之一的真相」**

**背景**：老玩家E在第一站悄悄透露给主角A："这辆公车的淘汰规则一共有三个，现在只公布了一个，另外两个会在第三站和第五站各公布一个。"

**事件展开**：
- 场景1：A得到信息后立刻开始盘算这意味着什么——第三站和第五站之前的行动都存在规则空白期，是可以利用的时间窗口
- 场景2：另一名乘客F注意到A和E的私聊，开始试探A是否有额外信息——A面临选择：否认/承认/用这个信息换取F的合作
- 场景3：A决定把"还有两条规则"的信息告诉F，但不说时间节点。F开始过度谨慎，在没有规则威胁的时间段也不敢行动
- 场景4：第三站到来，第二条规则公布——F因为过度谨慎错过了利用规则空白期的机会，而A和E已经在窗口期完成了关键布局
- 余震：F意识到A给了他不完整的信息，两人关系破裂；而A和E的临时合作因为共同利益变得更加牢固

**揭示内容**：
- 关于信息：不完整的信息比没有信息更危险——它让人产生错误的安全感
- 关于A：他开始学会用信息作为工具而不仅仅是资源
- 关于E：他为什么要在第一站就告诉A这些？他的目的是什么？（留给读者的悬念）

---

**示例三：「淘汰时刻」型——「第七号乘客的最后三分钟」**

**背景**：乘客G一直是公车上的"边缘人"——不参与博弈，不与任何人结盟，在角落里安静地观察。其他人几乎把他忘了。现在，系统宣布"本轮末站前，得票最少的一名乘客将被淘汰"。

**事件展开**：
- 场景1：所有人开始忙着游说，拉票，出价。G依然沉默，但他注意到所有人的行动——他比任何人都更清楚此刻的博弈格局
- 场景2：G突然走向主角A，说"我知道第五站的隐藏规则。如果你保我，我告诉你"——这是他第一次主动开口，也是他唯一的筹码
- 场景3：主角A面临抉择：G的信息可能是真的，也可能是垂死挣扎的谎言。A的票数自己都不够稳固。A没有做决定
- 场景4：最终G得票最少，系统触发淘汰。但在淘汰完成的那一刻，G平静地对A说了一句话——"第五站，不要站起来"（一句没有上下文的提示）——然后消失
- 余震：A不知道G说的是什么意思，但这句话会在第五站之前一直萦绕着他；其他乘客因为G的安静出局而意识到"不参与博弈"也是一种策略——但G还是死了，这个策略的极限也被展示了

**揭示内容**：
- 关于G：边缘人未必不懂规则，他只是在最后关头才亮出底牌——太晚了
- 关于规则：「得票」机制说明公车里有民主形式的淘汰，但民主可以被操控
- 关于A：他在关键时刻没有做决定——这个犹豫的代价是失去一个重要盟友和一条真实信息',
  '## "Plot" Generation — Thriller Bus Novel

The core of plot design in thriller bus novels is understanding that **the narrative unit in the bus phase is not a "dungeon" but an "event"**. The bus is not a checkpoint; it is a continuously operating pressure vessel — people inside may have accidents at any moment, turn against each other at any moment, discover new rules at any moment.

Good bus-phase plots win not through volume but through **density**: every event must simultaneously advance three lines — information, relationships, and survival. After one elimination, remaining passengers understand the rules better, some relationship has fractured, and a hidden rule has been inadvertently verified. That is a qualified bus event.

---

### 1. Narrative Units in the Bus Phase

**The basic narrative unit is "Event," not "Dungeon"**

Bus-phase plots are not driven by checkpoints but by **Events**. A complete "Bus Event" contains:

**Four elements of an event**:
1. **Trigger**: What caused the event (rule violation / someone''s action / stop change / information exposure)
2. **Game process**: How each party responds and chooses as the event develops
3. **Outcome**: Elimination / alliance change / rule discovery / information reorganization
4. **Aftershock**: Unresolved mysteries or changed dynamics left after the event ends

**Five core event types**:

| Type | Trigger | Game Core | Outcome Form |
|------|---------|-----------|--------------|
| Rule Trap | Behavior triggers penalty | Who knows the rules, who is sacrificed | Elimination + rule teaching |
| Information Game | Veteran selectively reveals | Information pricing and exchange | Alliance reorganization |
| Alliance Betrayal | Internal interest conflict | Calculating the timing of betrayal | Power reshuffle |
| Hidden Rule Discovery | Accidentally triggers extra rule | Using rules to reverse situation | Reversal |
| Elimination Moment | Elimination mechanism triggers | Who dies, how, what it reveals | Death + information release |

**Narrative density principle**:
- Maximum 3-5 scenes per bus event
- Each scene must advance at least one narrative line (information / relationship / survival)
- Total bus events: 4-7 (too few = loose pacing, too many = reader fatigue)

---

### 2. Five Core Plot Templates

#### Template 1: "Rule Trap"

**Core logic**: A seemingly reasonable action triggers a penalty, causing someone to be eliminated or harmed. The key: other passengers can see it was a trap in retrospect, but no one foresaw it before the trigger.

**Plot structure**:
1. A passenger does something a "normal person" would do (moving seat / helping someone / making noise / using phone)
2. System announces rule triggered; passenger receives penalty
3. Other passengers realize this action was forbidden — begin re-evaluating "what is safe"
4. The punished person''s fate becomes a "live demonstration" of the rule; others'' behavior patterns change immediately

**Writing notes**:
- The trap-triggering action must be sufficiently reasonable — neither reader nor protagonist anticipates it
- Punishment must be immediate and specific (not vague "point deduction")
- The punished person''s reaction reveals their character
- After the trap is revealed, fear of the rule system itself rises, shifting from fear of other people to fear of the system

---

#### Template 2: "Information Game"

**Core logic**: Someone who holds information (veteran experience, obtained prop, accidental discovery) faces a choice: how much to reveal, to whom, in exchange for what. The flow of information determines the power structure of the round.

**Plot structure**:
1. Someone possesses key rule information
2. Others sense the information asymmetry; probing behaviors emerge
3. The information holder begins "pricing" information — setting different exchange conditions for different people
4. Information flow changes the situation

**Core tension**: The information holder''s dilemma — the more they monopolize information, the more power they have, but the more dangerous it is to be exposed as "the one who knows"

---

#### Template 3: "Alliance Betrayal"

**Core logic**: Alliance → internal structural conflict → someone chooses betrayal at the critical moment. Betrayal should not be sudden; it should be long-planned yet feel logical.

**Plot structure**:
1. **Alliance phase** (1-2 scenes): Two or more people form an alliance for shared interest, but their interests aren''t fully aligned
2. **Crack phase** (1 scene): An event causes interest conflict within the alliance — who should be sacrificed, who gets more, who knows more
3. **Tipping point** (1 scene): The betrayer faces a final choice; readers have a "will they or won''t they" suspense moment
4. **Strike / No Strike** (1 scene): Betrayal happens or doesn''t — both outcomes have their own narrative value

**The "strike" dilemma**: The optimal "betrayal moment" is often when readers most want them not to betray — this is the true tension of the alliance betrayal plot

---

#### Template 4: "Hidden Rule Discovery"

**Core logic**: Discovering an extra rule not stated in the system announcement — once discovered, it can reverse an unfavorable situation or provide protection.

**Plot structure**:
1. Current situation is unfavorable for protagonist (or someone)
2. A detail draws attention — strange system prompt, or someone''s action producing unexpected results
3. Protagonist reasons and tests (testing itself carries risk)
4. Hidden rule confirmed; situation reversed

**Hidden rule design notes**:
- Must have logical connection to announced rules (not completely independent random rules)
- Best if it''s a "loophole in the announced rules" or the "reverse of an announced rule"
- Can be used once, cannot be exploited infinitely

---

#### Template 5: "Elimination Moment"

**Core logic**: A character''s death (or elimination) is not just a headcount reduction — the death scene must simultaneously accomplish three things: reveal the person''s essence, teach a rule, and change the remaining passengers'' emotional and relational dynamics.

**"Good Death" design criteria**:

| Level | Content |
|-------|---------|
| About this person | Death method or final moment reveals true character |
| About the rules | Death is the ultimate demonstration of a rule |
| About others | Others'' reactions reveal their psychology and stance |
| About readers | Readers have a strong emotional reaction: "they shouldn''t have died" or "this was inevitable" |

**Writing prohibitions**:
- Death cannot be "just dead" — it must change something
- Not all eliminations should happen in the same way — variety in elimination methods reflects the richness of the rule system
- Beloved characters shouldn''t die too quickly, but cannot be infinitely protected (feels like rule exploitation)

---

### 3. Bus-to-Dungeon Transition Narrative

**Designing the breakthrough moment**:

The bus-to-dungeon transition handles three problems:

**1. State of the last survivors**
- Relationships among them (mutual trust / suspicion / hatred / temporary alliance) are the core assets brought into the dungeon
- What each person holds (props / information / injuries) is the precondition for dungeon opening

**2. The ritual of leaving the bus**
- How the system announces completion (sound / visual / physical change)
- What happens to the bus itself (disappears / stops roadside / becomes part of the dungeon entrance)
- Is there a final information release at transition (system''s last hint / driver''s brief words / notice at the door)

**3. First impression of the dungeon scene**
- Entering the dungeon must contrast with the bus''s claustrophobia (open space / deeper confinement / chaos)
- The first dungeon scene must immediately establish a new sense of threat

**Three transition narrative modes**:

| Mode | Applicable Scenario | Narrative Effect |
|------|---------------------|-----------------|
| **Hard Cut** | Bus''s last stop ends suddenly, cut directly to dungeon | Creates time compression; reader and protagonist equally disoriented |
| **Gradual Transition** | Bus gradually transforms / environment gradually changes, no clear dividing line | Creates sustained fear; blurred boundaries more frightening than hard cut |
| **Ritual Transition** | System makes clear announcement; survivors have brief respite | Allows reader and characters to process bus events; simultaneously previews dungeon rules |

---

### 4. Multi-Dungeon Plot Connections

**Three types of bus legacy**:

**Legacy 1: Interpersonal debt**
- Owed life-saving favor → must repay at critical dungeon moment
- Trust established on bus → protect each other immediately in dungeon
- Betrayal on bus → covert revenge in dungeon
- Design note: Bus legacy in dungeons should be honored at the "least convenient" timing — in the most dangerous dungeon moment, past grudges suddenly become decisive factors

**Legacy 2: Incomplete information clues**
- Fragment information from bus phase suddenly finds its match in a dungeon
- Something someone said on the bus is confirmed as a key rule hint in the third dungeon
- Design note: Fragment information should appear when readers have almost forgotten it — the memory cost is itself part of the narrative tension

**Legacy 3: Identity perception correction**
- Someone thought to be a newcomer on the bus displays veteran-level ability in a dungeon
- Someone believed to be a trustworthy ally on the bus reveals true intentions in a dungeon

---

### 5. Common Plot Pitfalls

**Pitfall 1: Bus phase written too long, reader aesthetic fatigue**
Solution: Vary rhythm between bus events (slow/fast/slow); not every rule needs detailed explanation; eliminate all "invalid dialogue" that advances no narrative lines

**Pitfall 2: Every elimination too similar**
Solution: Diversify elimination methods (rule violation / betrayed by other passengers / self-sacrifice / accidentally triggering mechanism / randomly chosen by system); each elimination must reveal a new dimension

**Pitfall 3: Hidden rules discovered too easily**
Solution: Discovery must carry a cost; maximum one important hidden rule per round; some hidden rule tests must fail

---

### 6. Three Complete Event Outline Examples

**Example 1: "Rule Trap" — "The Price of Kindness"**

Background: Bus has already had 2 rule announcements; passengers are being careful. Newcomer B sees elderly passenger C feeling unwell and decides to share their water.

Event:
- Scene 1: B hands water to C; various expressions among other passengers; veteran player D''s face changes but says nothing
- Scene 2: System broadcasts: "Item exchange behavior detected, triggering rule — exchange is treated as alliance declaration; both parties must publicly announce alliance before next stop, or both receive -1 condition level"
- Scene 3: B and C look at each other — they don''t know each other and don''t want to publicly ally (which would draw other passengers'' targeting); D walks over saying "ask me before exchanging next time" without helping
- Scene 4: B and C forced to declare alliance; other passengers immediately re-evaluate their threat level
- Aftershock: B confronts D about not warning them; D says "I have no obligation to protect everyone" — their relationship fractures; meanwhile, the forced allies B and C must re-examine each other, unexpectedly developing real cooperation

**Example 2: "Information Game" — "One Third of the Truth"**

Background: Veteran E quietly tells protagonist A at the first stop: "This bus has three elimination rules total; only one is announced now, the other two will be revealed at stops three and five."

Event:
- Scene 1: A immediately calculates implications — the periods before stops three and five have rule vacuums exploitable as time windows
- Scene 2: Passenger F notices A and E''s private exchange; starts probing A; A faces choice: deny / admit / use information to gain F''s cooperation
- Scene 3: A tells F "there are two more rules" without mentioning timing; F becomes overly cautious, afraid to act even during periods without rule threats
- Scene 4: Stop three arrives, second rule announced — F missed the opportunity to exploit the rule vacuum due to over-caution; A and E already completed key moves during the window
- Aftershock: F realizes A gave incomplete information, relationship fractures; A and E''s temporary cooperation solidifies due to shared interests

**Example 3: "Elimination Moment" — "Passenger Seven''s Last Three Minutes"**

Background: Passenger G has been the "marginal person" — doesn''t participate in games, doesn''t ally with anyone, quietly observes from a corner. Others have almost forgotten him. Now system announces "before this round''s final stop, the passenger with fewest votes will be eliminated."

Event:
- Scene 1: Everyone rushes to campaign, persuade, bid. G remains silent, but notices everyone''s movements — he understands the current game dynamics better than anyone
- Scene 2: G suddenly approaches protagonist A: "I know the hidden rule at stop five. If you protect me, I''ll tell you" — his first time speaking up; his only bargaining chip
- Scene 3: A faces choice: G''s information may be true or a dying lie; A''s own vote count isn''t stable; A doesn''t decide
- Scene 4: G gets fewest votes; system triggers elimination. At the moment of elimination, G calmly says one sentence to A — "At stop five, don''t stand up" — then disappears
- Aftershock: A doesn''t know what G meant, but the words will haunt him until stop five; other passengers, seeing G''s quiet exit, realize "not participating in games" is also a strategy — but G still died, showing this strategy''s limit',
  (SELECT id FROM novel_creation_method WHERE name = '惊悚公车小说' LIMIT 1),
  1,
  88,
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
