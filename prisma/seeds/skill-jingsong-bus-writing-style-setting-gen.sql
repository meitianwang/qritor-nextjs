-- 惊悚公车小说「文风设定」设定生成技能
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '惊悚公车小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-jingsong-bus-writing-style-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'jingsong-bus-writing-style-setting-gen',
  '「文风设定」设定生成：为惊悚公车小说生成文风设定，涵盖叙事视角、恐怖氛围浓度、主角内心独白风格、封闭空间叙事风格、节奏把控和禁忌写法',
  '"Writing Style" setting generation: generate writing style settings for thriller bus novels, covering narrative perspective, horror atmosphere intensity, protagonist inner voice style, closed-space narrative style, pacing control and writing taboos',
  '## 「文风设定」设定生成 — 惊悚公车小说

文风设定决定了读者体验恐怖的方式。惊悚公车小说有其独特的文风要求：它在封闭移动空间内展开，长达百章，没有副本切换带来的新鲜感，必须依靠空间压迫、人际博弈和层层揭秘来维持张力。这些特点对文风提出了超出一般惊悚系文的更高要求。

---

### 字段生成指南

#### 叙事视角

视角选择在公车密室中有特殊的叙事含义——公车是一个没有逃跑路径的封闭空间，视角选择直接决定读者感受到的"被困感"程度。

**各视角特点与适用分析**：

- **第一人称**（公车密室的首选视角）：读者与主角同步被困。主角不知道的，读者也不知道。恐惧是直接传递的——"我听到座位下面有什么东西在动"比"他听到"更让读者身体紧绷。
  - **公车密室优势**：读者在阅读时"也坐在那辆车上"，成为被困者的一员，无法置身事外。恐惧不需要建立——它直接存在。
  - **公车密室局限**：百章公车叙事中，主角不可能一直处于信息核心。背后发生的事（另一组乘客的遭遇、司机的行为）必须通过对话或事后叙述呈现，不够直接。
  - **适合**：心理压迫型、主角独狼型、侦探推理型公车故事。

- **第三人称有限视角**（最常见选择）：跟随主角但保留轻微距离，可以偶尔"滑出主角视野"给出主角未察觉的细节——"他没有看到，正对他的座位背后，有人正在看着他"。这种设计在密室中制造"读者比主角多知道一点"的恐惧感，是比纯第一人称更有控制力的视角。
  - **公车密室优势**：可以在不破坏主角视角的情况下，给读者一个额外的"恐惧提示"，让紧张感持续而不依赖主角的感知。
  - **适合**：团队对抗型、信息博弈型公车故事。

- **双线叙事（车内+现实）**：部分公车叙事采用双线结构——车内的实时冒险，与车外现实世界对同一时段的呈现（如家人发现有人失踪、调查人员追踪公车路线）。
  - **悬念制造机制**：车内读者知道危险，但看到现实中调查进展缓慢，会产生强烈的无力感和紧迫感——"外面的人根本不知道发生了什么，他们来不及了"。
  - **双线交汇的节奏**：两条线应该有信息上的"错位"——现实线总比车内线慢一步或快一步，让读者始终处于信息差中。
  - **适合**：有外部视角参与叙事的公车故事，或需要在结尾时两条线合流制造爆发的设计。

**视角特殊技巧（公车密室专属）**：
- 系统提示、规则公告等文字可以切换为完全中立的客观字体风格，与叙事产生强烈对比——叙事越慌乱，系统文字越冷静，这种反差本身就是恐惧
- 在极端恐惧场景中，可以让主角的视角"碎片化"——句子变短，描写变不完整，逻辑出现跳跃，模拟真实恐惧下的认知崩裂

#### 恐怖氛围浓度

公车类惊悚的氛围浓度需要特殊校准。公车故事的最大挑战是"同一空间的长期叙事不让读者疲劳"，因此浓度需要更精细的设计。

**各浓度档位的具体写法标准**：

| 浓度 | 特点 | 公车场景写法标准 |
|------|------|---------------|
| 重度惊悚 | 每场景都有明确恐惧来源，无喘息 | 感官描写密集（气味/声音/触感同步出现），恐惧的对象始终在场但不完全可见，对话极简（恐惧让人无法正常说话），内心独白短促甚至中断 |
| 中高浓度 | 恐惧和博弈交替，有节奏喘息 | 恐惧场景结束后有"假安全区"（表面平静但玩家知道危险还在），利用其他乘客的反应来侧写恐惧（主角可能冷静，但旁边的人在颤抖），信息博弈段落用来平衡恐惧密度 |
| 黑色幽默 | 恐怖与荒诞并存，主角用幽默消解 | 恐怖场景本身客观呈现（不带评论），主角的内心反应用吐槽代替惊吓（"所以这就是系统规则的效果演示？效果我给满分，演示方式我有意见"），荒诞感来自恐怖现象与主角平静反应的落差 |
| 轻度惊悚 | 恐怖作为背景，博弈是主菜 | 用"乘客心理状态的集体变化"来呈现恐怖（不需要直接的恐怖事件，只需要"大家都在偷偷扫视别人"这样的行为就能建立压迫感） |

**公车类型最适合的氛围**：中高浓度是公车类惊悚的最优解。原因：
1. 纯重度惊悚难以在单一空间维持百章而不让读者感官疲劳
2. 公车的核心看点是"人与人之间的博弈"，这是中高浓度的天然土壤
3. 中高浓度允许"博弈段落"作为恐惧的喘息区，同时让博弈本身也带有恐惧感（背叛、谎言、利用都是一种恐惧）

#### 主角内心独白风格

公车密室的极端压力下，主角的内心独白是文风最有辨识度的部分。以下是各风格的特点及示例段落。

**冷静分析型**
公车停在黑暗中。已经三十七分钟了。车内有十一个人，四个在哭，两个在装睡，剩下五个和我一样在等。司机没有回头一次。规律是：每二十分钟，广播响一次。下次广播距现在还有三分钟。我需要在它响起之前，确认坐在12排左侧的那个人究竟有没有在对我撒谎。
- 特点：以数字和逻辑组织信息，恐惧被压缩为观察数据；适合理工科背景或侦探型主角

**压抑克制型**
别看。别看那里。看窗户。窗户是安全的。
窗户上有我的倒影。
窗户上还有另一个倒影。
那里没有人坐。
我没看那里。我没看。
- 特点：强迫停止的思维流，句子短到近乎切断；读者在主角的"不敢看"中感受到的恐惧比描写出来更强

**吐槽消解型**
好消息：那个突然从座位底下爬出来的东西不是鬼，只是一个藏在车底仓爬进来的男人。
坏消息：他手里拿着的和我们一样也是系统发的编号牌，编号是0，而系统说过编号0代表的是"裁判员"。
更坏的消息：裁判员的权力之一是"在任意时刻取消任意一名乘客的参赛资格"。
我觉得我需要重新定义"好消息"这个词的使用标准。
- 特点：以清单式吐槽呈现信息，最后一句反转产生喜剧效果；适合高智商型、反应快型主角

**压迫感爆发型**
我在喊。我不知道我在喊什么。不重要。车在动，他在动，后面的人在动，但没有人动，因为大家都不敢动，但他死了，他就这样死了，在我旁边，在我看着的时候，我应该做什么我应该——
停。
停下来。
数呼吸。一。二。三。
我活着。我活着。好。下一步。
- 特点：混乱与自我强制平静的切换；适合表现主角在崩溃边缘重建理性的关键节点

#### 封闭空间叙事风格（重点）

这是公车类惊悚最独特也最需要精心设计的部分。如何在"一辆车"的空间里写出压迫感，同时维持百章叙事的新鲜感？

**座位布局的战略意义**

公车座位不只是"人坐的地方"，它是一张权力地图。

- **距离逃生出口的远近**：前排靠近驾驶区（相对更安全但也最靠近司机这个未知因素）；后排远离所有出口（最危险但视野最好，能看到所有人）；中排是主要的信息流通区——提议、谈判、结盟都在这里发生
- **选座即表态**：主角选择坐在哪里是一个有意义的叙事动作。主动坐后排意味着想观察所有人；被动坐到中间意味着容易成为各方拉拢的对象
- **座位变化叙事**：随着乘客死亡，空出的座位会被其他人占据——谁占了死者的座位，是一个很微妙的心理细节。老玩家通常不会坐到靠近死亡现场的位置
- **物理隔离的心理效应**：通道是公车的主要移动路径，控制通道等于控制信息传播。有角色会"不经意"地阻断通道，让前后排的人无法自由交流

**窗外景色的恐惧运用**

窗户是公车与外部世界的唯一接口，它的处理方式直接影响读者的空间感受：

- **路过人迹罕至的地方**：公车驶过正常的城市街道时，窗外熟悉的景象形成安全幻觉；一旦路过荒野、废弃建筑、或那种"没有人的空旷"，安全感瞬间崩塌。写法建议：在乘客还在争论的时候，让其中一个人停下来，沉默地看着窗外——这比直接描写窗外更有力
- **天色变暗**：时间流逝在公车密室中被放大——白天变黑夜是最直观的"我们已经在这里待了很久"的信号。可以用光线变化来标记叙事节点：第一章是傍晚，第三章天完全黑了，第七章天开始亮了——但他们还没到站
- **窗玻璃上的倒影**：夜间窗玻璃会反射车内的影像。一个坐在窗边的角色可能先在玻璃倒影里看到背后的危险，而不是直接回头——这个"先看倒影再确认"的机制增加了恐惧的延迟效果
- **窗外的东西在看他们**：在特定时刻，让某个乘客注意到公路边上有什么东西一直跟着车跑——或者停着没动，但每次看都在同一个地方

**声音和气味描写的恐惧强化**

视觉恐惧在封闭空间里很快会被适应，但声音和气味是更难被"习惯"的感官通道：

- **声音**：公车的背景音（发动机声、轮胎摩擦声、玻璃振动声）是持续存在的"白噪音"；恐惧声音应该从这个背景音里"冒出来"，而不是突然出现。最有效的恐惧声音：听起来像是已知声音但有某个细节不对（呼吸声但节奏不是人类正常节奏，敲击声但没有人在动）
- **气味**：公车本有特定的气味（油污、塑料、体味的混合），当这个气味中出现异物时，读者的感官会发出警报。最有效的气味恐惧：甜腥的气味（血和腐败的混合），花香（在完全密闭的空间里莫名出现），或者"某个人的气味消失了"

#### 节奏把控

公车段落的叙事张力维持是最大的写作挑战——同一个空间，百章叙事，如何不让读者觉得"还没下车"？

**五个维度的节奏设计**：

**规则揭示节奏**
公车规则是节奏控制的最有效工具。规则不应该在开篇一次性公告，而是分批揭示：
- 前期规则：简单、直接，违反后果立竿见影（前三章揭示2-3条）
- 中期规则：复杂的、有条件的、需要解读的（乘客开始意识到规则之间有关联）
- 后期规则：元规则——关于规则本身的规则，或者修改之前规则的规则（玩家意识到他们从来没真正理解过规则）

**乘客数量变化节奏**
死亡不应该均匀分布：
- 开篇死亡：1-2人，建立恐惧基调，让读者意识到"任何人都可能死"
- 平静期：几章内没有死亡，让读者在等待中积累紧张感
- 死亡浪潮：短时间内多人死亡，打破读者的"喘息预期"
- 最终选择：活着的人数已经少到"大家都知道最终不可能所有人活下来"

**信息揭示节奏**
老玩家知道的东西不一次全说：每章的信息量要精确控制——每个章节有且只有一个核心信息增量，这个增量既能解答一个小问题，又开启一个新的问题。

**人际关系演变节奏**
联盟的形成和瓦解不要太快：
- 开篇：每个人都是孤立的，初步观察阶段
- 早期：试探性结盟（共享小信息，测试可信度）
- 中期：联盟稳固，同时内部开始出现裂缝
- 后期：第一次真正的背叛，所有联盟重组

**空间探索节奏**
公车的物理空间是有限的，但可以通过"层层揭秘"来制造空间扩展的叙事效果：
- 座椅下面：第一个被探索的空间
- 行李架：第二个维度
- 驾驶室门（能打开吗？）：中期的关键探索节点
- 车底仓（有没有人不是正常上车的？）：后期的空间惊喜
- 公车本身的秘密夹层或改造空间：终极的空间揭秘

#### 禁忌写法

公车类惊悚小说最常见的写法错误，以及专属于这个类型的三条硬性规则。

**常见坏毛病**：
- **规则即兴发挥**：需要什么功能临时加一条规则——破坏规则体系的内在一致性，读者会失去对规则系统的信任
- **人物分散无法聚焦**：写了太多乘客，每个人都有几段戏，但没有一个真正立住——读者记不住任何人
- **用外部事件打破封闭**：公车中途停下来，门打开，发生了车外的事情——频繁打破封闭空间会消解密室的压迫感
- **节奏单一化**：一开始就是最高强度的恐惧，后续只能维持或降低，没有空间上升
- **结盟背叛太随意**：背叛的动机不充分，只是因为"情节需要背叛"——缺乏动机的背叛让读者感到荒诞而非震惊

**三条公车密室写作的硬性规则**：

**规则一：公车内的恐惧必须既来自"外部"也来自"内部"**
公车外部的恐惧（系统、规则、未知威胁）和公车内部的恐惧（其他乘客、背叛、人性崩溃）必须同时存在。只有外部威胁会变成动作片；只有内部人际会变成室内剧。两种恐惧交替施压，才能维持百章的叙事张力。每隔不超过五章，必须有一次内部威胁（背叛/信息欺骗/利益冲突）和一次外部威胁（规则触发/未知现象/系统干预）。

**规则二：封闭空间的出口始终存在但始终不可达**
读者必须始终感受到"出去的可能性"，否则会产生绝望而非恐惧。公车必须偶尔给出"几乎可以出去"的时刻——门几乎被打开了、窗户差一点被砸破了、司机差点说了什么——然后把这个可能性收回去。"几乎成功"比"完全不可能"更折磨人，也更能维持读者继续读下去的动力。

**规则三：乘客的死亡必须改变车内的权力结构**
在公车密室中，每一个人的生死都影响着信息分布和力量对比。如果某人死了但其他人的处境没有发生任何变化，这次死亡就是叙事浪费。死亡应该具有叙事功能：老玩家死亡意味着关键信息的消失；情感纽带角色死亡意味着某人彻底失去束缚；隐藏敌人死亡意味着某个谜题的线索消失。每一个死亡都应该让车内剩余的人处于一种"和之前不同的状态"。

---

### 设计要点

1. **封闭感是最大资产**：公车的密室属性不是限制而是优势，充分利用封闭空间对人心理的影响
2. **空间熟悉化**：让读者对公车的每个角落都像对自己家一样熟悉，这样任何空间的异常都会被立刻感知
3. **人物减少是节奏控制器**：每个人的死亡都应该服务于节奏，不要均匀分布，用集中死亡和平静期的交替创造叙事波浪

### 常见错误

- **忽视公车特有的感官描写**：发动机振动、车厢气味、座椅触感——这些是读者"坐上这辆车"的沉浸基础，不要只写视觉
- **节奏没有波峰波谷**：持续高强度会让读者麻木；给读者喘息，再把他们推入更深的恐惧
- **规则体系前后矛盾**：公车规则一旦公告，必须严格执行，否则读者会失去对叙事的信任
- **人物减少但张力没有增加**：人越少，每个人的重量应该越重；反而越写越轻是最常见的中后期问题',
  '## "Writing Style" Setting Generation — Thriller Bus Novel

Writing style determines how readers experience horror. Thriller bus novels have unique requirements: the story unfolds in a closed moving space, across a hundred chapters, without the freshness of instance changes. It must rely on spatial pressure, interpersonal gaming, and layered revelations to sustain tension.

---

### Field Generation Guide

#### Narrative Perspective

Perspective choice carries special narrative meaning in a bus closed-space setting. The bus has no escape routes — perspective directly determines the degree of "trapped feeling" readers experience.

**First Person** (preferred for bus closed-space): Readers are trapped alongside the protagonist. Fear transfers directly — "I hear something moving under the seat" makes the body tense more than "he heard." Bus advantage: readers are "on that bus too," becoming trapped themselves. Limitation: over a hundred chapters, the protagonist cannot always be at the information center. Events behind their back must be conveyed through dialogue or after-the-fact narration.

**Third Person Limited** (most common choice): Follows the protagonist with slight distance, occasionally "sliding out" to reveal what the protagonist hasn''t noticed — "He didn''t see it: behind the seat facing him, someone was watching." Bus advantage: delivers extra fear signals to readers without breaking the protagonist''s perspective. Suited for: team confrontation and information-gaming bus stories.

**Dual-Line Narrative (inside bus + outside reality)**: Some bus stories use a dual structure — real-time events inside the bus, and the real world''s parallel response (family discovering someone missing, investigators tracking the bus route). Suspense mechanism: readers know the danger, but watching the slow outside investigation creates a powerful helplessness — "they don''t know what''s happening, they''re going to be too late." The two lines should always be offset — the outside line always one step behind or ahead, keeping readers permanently in information asymmetry.

**Perspective Special Techniques (bus closed-space exclusive)**:
- System notifications and rule announcements can switch to a completely neutral objective font style, contrasting sharply with the narrative — the more chaotic the narrative, the calmer the system text, and this contrast is itself terrifying
- In extreme fear scenes, fragmenting the protagonist''s perspective (shorter sentences, incomplete descriptions, logical jumps) simulates the cognitive breakdown of real terror

#### Horror Atmosphere Intensity

Bus horror atmosphere intensity requires special calibration. The biggest challenge is "sustaining long-term single-space narrative without fatiguing readers."

**Intensity Tiers and Bus Scene Writing Standards**:

| Intensity | Character | Bus Scene Writing Standard |
|-----------|-----------|---------------------------|
| Heavy horror | Clear fear source in every scene, no breathing room | Dense sensory description (smell/sound/touch simultaneously), threat always present but never fully visible, minimal dialogue (fear prevents normal speech), inner monologue short and interrupted |
| Medium-high | Horror and gaming alternate with rhythmic breathing room | After horror scenes, "false safety zones" (surface calm, but players know danger remains), use other passengers'' reactions to sidebar the protagonist''s fear, information-gaming segments balance horror density |
| Dark humor | Horror and absurdity coexist, protagonist deflects with humor | Horror presented objectively without editorial comment, protagonist''s internal reaction replaces shock with wit ("so this is the system''s live demonstration of Rule One? full marks for effect, I have notes on the presentation method"), absurdity comes from the gap between terrifying events and the protagonist''s calm response |
| Light horror | Horror as backdrop, gaming as main course | Use "collective psychological shifts among passengers" to convey horror — no direct horror event needed; just "everyone quietly scanning everyone else" creates pressure |

**Best Intensity for Bus Type**: Medium-high is the optimal solution for bus horror. Reasons: (1) Pure heavy horror cannot sustain a hundred chapters in a single space without sensory fatigue. (2) The core appeal of bus stories is "people gaming each other" — this is the natural soil of medium-high intensity. (3) Medium-high allows "gaming segments" as fear breathing room, while gaming itself carries its own fear (betrayal, lies, exploitation are all forms of terror).

#### Protagonist Inner Voice Style

Under the extreme pressure of the bus closed-space, the protagonist''s inner voice is the most distinctive element of writing style. Each style with a short example passage.

**Calm Analytical Style**:
The bus stopped in darkness. Thirty-seven minutes now. Eleven people in the car: four crying, two pretending to sleep, five others like me, waiting. The driver hasn''t looked back once. Pattern: every twenty minutes, the intercom sounds. Next broadcast in three minutes. I need to confirm, before it goes off, whether the person in seat 12-left has been lying to me.
- Characteristic: organizes information through numbers and logic; fear compressed into observational data; suited for STEM-background or detective-type protagonists

**Suppressed Restraint Style**:
Don''t look. Don''t look there. Look at the window. The window is safe.
My reflection in the window.
Another reflection in the window.
Nobody is sitting there.
I didn''t look there. I didn''t.
- Characteristic: forcibly interrupted thought stream, sentences near-severed; the fear readers feel through the protagonist''s "refusing to look" is stronger than any description could achieve

**Comedic Deflection Style**:
Good news: the thing that crawled out from under the seat is not a ghost — just a man who hid in the luggage compartment and climbed in.
Bad news: he has a system-issued number tag just like us. His number is 0. The system said number 0 means "referee."
Worse news: one of the referee''s powers is "revoking any passenger''s participation eligibility at any time."
I think I need to recalibrate my standards for what qualifies as good news.
- Characteristic: list-format wit presenting information; final reversal line generates comedy; suited for high-IQ, fast-reacting protagonists

**Pressure-Burst Style**:
I''m screaming. I don''t know what I''m saying. Doesn''t matter. The bus is moving he''s moving the people behind are moving but nobody is moving because nobody dares move but he''s dead he just died like that right next to me while I was watching I should have done something I should have——
Stop.
Stop.
Count breaths. One. Two. Three.
I''m alive. I''m alive. Good. Next step.
- Characteristic: switching between chaos and forced self-calming; suited for key moments when the protagonist rebuilds rationality at the edge of collapse

#### Closed-Space Narrative Style (Key Focus)

This is the most unique and carefully crafted aspect of bus horror. How do you write pressure out of "one bus" while sustaining freshness across a hundred chapters?

**Strategic Significance of Seat Layout**

Bus seats are not just where people sit — they are a power map.

- **Distance from exits**: Front rows near the driver''s area (relatively safer but closest to the driver, an unknown factor); rear rows far from all exits (most dangerous but best sightlines — you can see everyone); middle rows are the main information circulation zone where proposals, negotiations, and alliances happen.
- **Seat choice as a statement**: Where the protagonist chooses to sit is a meaningful narrative act. Actively choosing the back signals wanting to observe everyone; ending up in the middle makes one a natural target for all sides.
- **Seat-change narrative**: As passengers die, vacated seats get occupied — who takes the dead person''s seat is a subtle psychological detail. Old players rarely sit close to the scene of a death.
- **Physical isolation psychology**: The aisle is the bus''s primary movement path; controlling the aisle means controlling information flow. Characters will "casually" block the aisle, preventing front and rear passengers from communicating freely.

**Using Window Scenery for Fear**

Windows are the only interface between the bus and the outside world:

- **Passing desolate places**: While the bus drives through normal city streets, familiar scenery creates an illusion of safety. The moment it passes wasteland, abandoned buildings, or the "emptiness with no people," that safety collapses. Writing tip: rather than describing the window directly, have one person stop mid-argument and silently look outside — this is more powerful.
- **Darkening sky**: Passage of time is amplified in a bus closed-space. Day turning to night is the most direct "we''ve been here a long time" signal. Use light changes as narrative markers: Chapter 1 is evening, Chapter 3 is fully dark, Chapter 7 is beginning to lighten again — but they still haven''t arrived.
- **Reflections in window glass**: Night windows reflect the interior. A passenger near a window may first see danger from behind in the glass reflection rather than turning around — this "see the reflection, then confirm" mechanism adds a delay to fear.
- **Something outside watching them**: At specific moments, have a passenger notice something by the roadside keeping pace with the bus — or stopped in place, but always in the same spot every time they look.

**Using Sound and Smell to Amplify Fear**

Visual horror is adapted to quickly in closed spaces, but sound and smell are harder to habituate:

- **Sound**: Background bus noise (engine, tires, glass vibration) is constant "white noise." Fear sounds should emerge from this background, not appear suddenly. Most effective fear sounds: something that resembles a familiar sound but with one wrong detail (breathing at non-human rhythm, tapping with nobody moving).
- **Smell**: A bus has its specific smell (oil, plastic, body odor combined). When something foreign appears in this smell, the reader''s senses alarm. Most effective smell-fear: sweet-metallic (blood and decay combined), floral (appearing inexplicably in a fully sealed space), or "someone''s smell has disappeared."

#### Pacing Control

Sustaining narrative tension in a single space across a hundred chapters is the greatest writing challenge.

**Five Dimensions of Pacing Design**:

**Rule revelation pacing**: Bus rules are the most effective pacing tool. Rules should not be announced all at once — reveal in batches. Early rules: simple, direct, immediate consequences (2-3 rules in first three chapters). Mid-story rules: complex, conditional, requiring interpretation (passengers realize rules are interconnected). Late rules: meta-rules — rules about rules, or rules that modify previous rules (players realize they never truly understood the rules).

**Passenger count change pacing**: Deaths should not be evenly distributed. Opening deaths: 1-2 people, establish fear baseline, prove "anyone can die." Quiet period: no deaths for several chapters, tension building through anticipation. Death wave: multiple deaths in short time, breaking readers'' "breathing expectation." Final state: so few survivors that "everyone knows not everyone can make it."

**Information revelation pacing**: Old players don''t reveal everything at once. Each chapter should have exactly one core information increment — one that answers a small question while opening a new one.

**Interpersonal relationship evolution pacing**: Alliances form and dissolve without rushing. Opening: everyone isolated, initial observation. Early: tentative alliances (share small information, test trustworthiness). Mid-story: alliances solidified, internal fractures beginning. Late: the first real betrayal, all alliances restructuring.

**Space exploration pacing**: The bus''s physical space is limited, but "layered revelation" creates a narrative effect of spatial expansion. Under seats (first explored space), overhead racks (second dimension), driver''s cab door (can it be opened? — key mid-story exploration node), under-bus luggage compartment (was anyone not a normal boarding passenger?), hidden modifications or secret spaces in the bus itself (ultimate spatial reveal).

#### Writing Taboos

**Common Bad Habits**:
- Ad-hoc rule creation: adding a rule whenever the plot needs a specific function — destroys the rule system''s internal consistency, readers lose trust
- Too many characters with too little depth: so many passengers that nobody stands out — readers can''t remember anyone
- Breaking the seal with external events: the bus stops, the door opens, something outside happens — frequently breaking the closed space dissipates the claustrophobic pressure
- Single-intensity pacing: maximum fear intensity from the start, nowhere to escalate
- Unmotivated betrayal: betrayals that happen just because "the plot needs a betrayal" — readers find them absurd rather than shocking

**Three Hard Rules for Bus Closed-Space Writing**:

**Rule 1: Fear inside the bus must come from both "outside" and "inside"**
External bus fear (system, rules, unknown threats) and internal bus fear (other passengers, betrayal, human nature collapse) must coexist. Only external threats becomes an action film; only interpersonal dynamics becomes a chamber drama. Two types of fear alternating pressure is required to sustain a hundred-chapter narrative. Every five chapters maximum, there must be one internal threat event (betrayal/information deception/conflict of interest) and one external threat event (rule triggered/unknown phenomenon/system intervention).

**Rule 2: The exit must always exist but always be unreachable**
Readers must always feel the possibility of escape, or despair replaces fear. The bus must occasionally give "almost got out" moments — the door almost opened, the window almost shattered, the driver almost said something — and then take that possibility back. "Almost succeeded" is more torturous than "completely impossible," and sustains reader motivation far more effectively.

**Rule 3: Every passenger death must change the power structure inside the bus**
In the bus closed-space, every life and death affects information distribution and the balance of power. If someone dies and nothing changes for anyone else, that death is narrative waste. Death must have narrative function: an old player dying means critical information is lost; an emotional-anchor character dying means someone is completely unbound; a hidden enemy dying means a clue to a puzzle disappears. Every death should leave the surviving passengers in a state that is "different from before."

---

### Design Principles

1. **Closure is the greatest asset**: The bus''s sealed nature is not a constraint but an advantage — fully exploit the psychological effects of enclosed space on the human mind
2. **Spatial familiarity**: Make readers as familiar with every corner of the bus as their own home, so any spatial anomaly is immediately felt
3. **Passenger reduction as pacing controller**: Each death should serve the pacing — don''t distribute evenly; use concentrated death periods and quiet periods alternating to create narrative waves

### Common Mistakes

- **Neglecting bus-specific sensory description**: Engine vibration, car smell, seat texture — these are the immersion foundation for readers "getting on this bus"; don''t write vision only
- **No peaks and valleys in pacing**: Sustained high intensity numbs readers; give them breathing room, then push them into deeper fear
- **Rule system self-contradiction**: Once announced, bus rules must be strictly enforced, or readers lose narrative trust
- **Fewer passengers but decreasing tension**: As numbers drop, each remaining person should carry more weight; becoming lighter instead is the most common mid-to-late problem',
  (SELECT id FROM novel_creation_method WHERE name = '惊悚公车小说' LIMIT 1),
  1,
  84,
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
