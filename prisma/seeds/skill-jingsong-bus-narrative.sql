-- 惊悚公车小说「叙事技法」技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '惊悚公车小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-jingsong-bus-narrative.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'jingsong-bus-narrative',
  '「叙事技法」：公车密室的具体写作技巧，涵盖封闭压迫感、博弈微表情、规则揭晓节奏、淘汰场景规范、信息不对称管理五大核心技法，附对比示例',
  '"Narrative Technique": specific writing craft for the bus sealed-room scenario, covering five core techniques: claustrophobic pressure, game-theory micro-expressions, rule-reveal pacing, elimination scene standards, and information asymmetry management, with comparison examples',
  '## 「叙事技法」 — 惊悚公车小说

公车密室的写作难点在于它的**物理空间极小但叙事密度极大**：一节车厢、十几个人、无法逃跑——所有的恐惧必须从空间限制中生长出来，而不是依赖外部恐怖元素的堆砌。

好的公车叙事追求的是「无处可逃」的窒息感：物理上无处可逃（门锁着/车在动），信息上无处可逃（不知道规则/不知道谁是敌人），心理上无处可逃（每次决策都有代价）。

---

### 一、封闭空间的压迫感写法

**1.1 座位距离的战略意义**

主角选择坐在哪里，揭示了关于这个人的一切，也决定了这个人能看到和无法看到的信息。

**座位选择的叙事含义**：

| 座位位置 | 叙事含义 | 视野盲区 | 典型角色类型 |
|---------|---------|---------|------------|
| 最后一排靠窗 | 防守型，全局视野，反应式 | 看不清前排面部 | 谨慎的老玩家/内向新手 |
| 中间靠通道 | 攻击型，行动便利，信息中心 | 容易被多方监视 | 社交型博弈者 |
| 驾驶室后第一排 | 主动探索型，接近信息源（司机/系统） | 被所有人盯着后背 | 主角/信息猎手 |
| 最前排靠门 | 逃跑心理，但位置反而是最危险的 | 无法观察全局 | 恐慌型新手 |

**写作技巧**：不要描述座位选择是"主角想了想，坐在了中间"——要写**主角做这个决定时观察到了什么，考虑了什么**，让座位选择本身成为性格展示。

**对比示例一：座位选择的描写方式**

错误写法：
```
林柯上车后扫了一眼，找了个中间的位置坐下。
```

正确写法：
```
林柯在门口停了三秒。
最后一排——背靠车尾，能看到所有人，但离司机最远。前排——能听到司机说话，但背对所有人，任何人都能从后面接近。
他选了第三排靠通道的位置。离两侧的门都不远，能看到大部分乘客的脸，也能被大部分乘客看到。
在一个他不知道规则的地方，被看见比看见别人更重要——至少目前是这样。
```

---

**1.2 声音细节的压迫感**

封闭空间里，声音无处消散。引擎声/刹车声/其他乘客的呼吸声——这些不是背景，这些是角色的心理状态的外化。

**声音层次结构**：
- **底层音**：引擎低鸣（持续的、无法停止的、代表"车还在走"）
- **中层音**：座椅摩擦声、衣服窸窣、不自然的清嗓子（代表人的存在和紧张状态）
- **上层音**：偶发的声音——有人在哭/有人低声说话/突然的金属声（代表事件将要发生）

**时间感扭曲的写法**：
- 引擎声可以用来拉伸或压缩时间感（持续描写引擎声=时间在拉伸/突然引擎声停止=时间骤停）
- 刹车声比语言更有暴力感——车停，不是系统宣布，而是车自己停了，这意味着什么？
- 规则宣布前的寂静：所有人都不说话，只有引擎声，这种寂静比噪音更让人恐惧

**对比示例二：用声音制造压迫感**

错误写法：
```
车厢里很安静，大家都很紧张。
```

正确写法：
```
林柯数过了，从上车到现在，没有人说超过三句完整的话。
引擎的低鸣填满了所有空隙。他习惯了静默，但这种静默不一样——这是十几个人同时在听的静默，每个人都在等另一个人先开口，先犯规，先死。
右前方有人在用鼻子呼吸，频率比正常人快了一倍。林柯没有转头，只是记住了那个方向。
```

---

### 二、人物博弈的写法

**2.1 话里有话的对话技法**

公车上的对话没有废话。每句话背后都有三个层面：表面含义/说话者的真实意图/听者的解读。

**对话的三层结构示例**：

```
"你刚才坐过那边？"（表面：普通询问）
             ↓ 说话者真实意图：探测对方是否知道那个座位有特殊含义
             ↓ 正确听法：对方在试探我，但我不知道试探的目标是什么
```

**弦外之音的写作规则**：
- 每句试探性对话后，必须有主角的**内部解码过程**（他在问什么？为什么问这个？他知道什么？）
- 主角的回答要反映他的策略选择（回避/反问/假装不懂/直接回答）
- 对话不能太快推进到直接信息交换——要有往返，有停顿，有信号探测

**对比示例三：博弈对话的写法**

错误写法：
```
"你知道规则吗？"老玩家问。
"不知道，"林柯说，"你呢？"
"我知道一些，"对方说，"我可以告诉你。"
林柯点头，他们开始交换信息。
```

正确写法：
```
"你上车多久了？"
林柯看了他一眼。上车多久——这是在问他到底是新手还是老玩家，还是在确认他有没有注意到某件事？
"和你差不多，"林柯说，"你呢？"
对方沉默了两秒。
两秒很长。两秒说明他在权衡，权衡的本身说明这个问题的答案对他来说有代价。
"第一次，"他最后说，眼睛没有离开林柯，"你相信吗？"
林柯没有回答。不相信，但说不相信没有任何意义。
"坐哪儿？"林柯说。
```

---

**2.2 眼神与微表情的叙事使用**

封闭空间里，人们看彼此的时间比正常情况长得多——眼神本身就是博弈工具。

**眼神的信息含义**：
- 对视后立刻移开视线 = 有秘密，或者在试图避免被评估
- 对视后不移开 = 主动对抗，或者在测试对方的心理稳定性
- 眼神飘向某个位置 = 那里有他关心的东西
- 完全不看某人 = 刻意回避，可能是伪装漠然

**写作规则**：眼神描写不能只是"他看了她一眼"——要说明**看的方式/时长/对方的反应**，这三个要素构成完整的眼神博弈。

---

### 三、规则揭晓的节奏技法

**3.1 规则不能一次性全说完**

一次性完整公告所有规则 = 玩家被动接受，失去探索维度
分批揭晓规则 = 玩家持续处于「我还不知道什么」的焦虑状态

**分批揭晓的四种机制**：

1. **站次触发型**：每到一个新站，宣布一条新规则——规则数量与站次数量对应
2. **行为触发型**：某人做了某件事，系统宣布该行为对应的规则——规则教学通过代价来完成
3. **违规触发型**：第一个人死了，规则才完整显示——死亡是规则的最终注释
4. **主角探索型**：规则本身不宣布，主角必须通过行动和推理自己发现

**「死亡完成规则教学」的写法原则**：

死亡是规则最有力的教学方式——比任何语言叙述都更具说服力。第一个人死于规则A，其他所有乘客对规则A的恐惧在这一刻才真实化。

**对比示例四：规则揭晓的方式**

错误写法：
```
系统宣布："规则一：不得在车厢内使用手机。规则二：不得主动攻击其他乘客。规则三：每两站淘汰得票最少的乘客。违反规则者立即清除。"
林柯记住了这些规则。
```

正确写法：
```
系统只说了一句话。

"旅途愉快。"

就这样。没有规则，没有解释，没有淘汰机制的说明。
林柯听到后排有人低笑，是那种紧张到极限后溢出的笑声。然后那个人拿出了手机。

系统的下一句话在三秒后出现，比第一句安静，但每个字都很清晰：

"侦测到违规行为。触发规则一。"

那个人的笑声停了。
```

---

**3.2 规则揭晓的节奏控制**

**节奏三段式**：
1. **压抑期**（无规则阶段）：什么都不说，让乘客在信息真空里自发产生最大的恐惧
2. **教学期**（第一条规则触发）：第一个死亡完成所有的规则说明，比文字更有效
3. **博弈期**（已知规则后）：乘客开始在已知规则的框架内寻找漏洞和灰色地带

---

### 四、淘汰场景的写作规范

**4.1 一个好的淘汰场景必须包含什么**

淘汰不是"有人死了"。淘汰是一个**多维信息释放节点**：

**五个维度的信息释放**：

| 维度 | 问题 | 叙事价值 |
|------|------|---------|
| 关于被淘汰者 | 他的最后行动/选择/话语揭示了什么？ | 完成角色弧线，或者推翻读者对这个人的判断 |
| 关于规则 | 这次淘汰是对哪条规则的最终演示？ | 让规则从文字变成真实，提升其他人的恐惧感 |
| 关于目击者 | 其他人的反应揭示了什么？ | 展示人物性格和立场，推进关系格局变化 |
| 关于主角 | 主角对这次淘汰的内心反应是什么？ | 展示主角的道德状态和策略成长 |
| 关于读者 | 读者对这个死亡有什么情感反应？ | 情感共鸣是让读者继续读下去的动力 |

**淘汰的速度控制**：
- **突然型淘汰**：没有预兆，一句话之间完成——制造「任何人都可能随时消失」的恐惧
- **缓慢型淘汰**：被淘汰者知道自己要死，有时间说话/做选择——制造情感重量
- **悬置型淘汰**：触发了淘汰机制，但几秒钟内读者不知道谁死——制造极度紧张感

**对比示例五：淘汰场景的写法**

错误写法：
```
系统宣布张明违规，随后张明消失了。其他乘客都感到很害怕，继续遵守规则。
```

正确写法：
```
系统说了两个字。

张明的名字。

然后是三秒的沉默——不是真的沉默，林柯能听到自己的心跳，能听到右侧某个人咬紧牙关的声音，能听到引擎，能听到一切，只是没有人说话。

张明还站在原地。他低头看了一眼自己的手，像是在确认什么。

"我没有——"他开口，"我没有违反——"

他没能说完。

不是声音停了，是他停了。像一台机器被切断电源，他直接倒下，没有挣扎，没有声音，没有痕迹。椅子是空的。

林柯盯着那把椅子看了三秒。

他在那三秒里意识到了一件事：他不知道张明违反了什么。他没有看到任何违规行为，系统没有说明原因，他们所有人现在面对的是一个他们完全无法理解的规则系统，而这个系统已经完成了第一次演示。

身后有人开始哭泣，压低了声音，但还是哭了。
```

---

### 五、信息不对称的写作工具

**5.1 多层信息不对称的管理**

公车叙事中同时存在多层信息差：
- 读者知道A（作者在旁白里暗示过），但主角不知道
- 主角知道B（通过私下的道具/对话获得），但某个角色不知道
- 某个角色知道C（系统给他的私信/他的老玩家经验），但读者和主角都不知道

**管理信息不对称的三个写作工具**：

**工具一：受限视角叙事**
主角只能看到/听到/知道自己能接触到的信息。其他角色的内心状态必须通过外部行为推断。
- 使用方法：写「主角对某件事的错误判断」，然后在后续章节揭示真实情况
- 效果：读者可能和主角一起被误导，也可能提前看出错误，两种体验都有价值

**工具二：刻意的叙事省略**
作者知道某个信息，但在某个场景里故意不写出来，而是在后续场景里揭示。
- 使用方法：写「某人离开了，去了隔壁」，下一章写其他人的视角，再回来写刚才那个人做了什么
- 效果：制造「我没看到那段时间发生了什么」的悬念

**工具三：不可靠的内部独白**
主角的内心判断是错的，但作者不纠正，让读者自己发现。
- 使用方法：主角断定某人是盟友，一直以此为基础行动，直到背叛发生
- 效果：背叛的冲击感因为「主角和读者共同被蒙蔽」而成倍增加

**对比示例六：信息不对称的写作**

错误写法（作者直接告诉读者真相）：
```
林柯以为陈静是新手，但实际上陈静已经经历过七次副本，她只是在伪装。
```

正确写法（通过细节暗示，不直接说明）：
```
陈静第三次问起出口在哪里，语气是真实的茫然。
但林柯注意到，她第一次问的时候，已经在看那扇门了。
他没有说什么。
```

---

**对比示例七：张力制造——「主角知道但不能说」**

错误写法：
```
林柯知道隐藏规则，但他决定保密，因为说出来对他没有好处。
```

正确写法：
```
方云说："我们应该集体行动，互相通报信息。"

林柯点头。

口袋里的那张纸上写着：集体行动将触发「群体行为」认定，系统会额外淘汰行动最一致的一组成员。

他保持着点头的姿势，继续听方云说话。
```

---

### 六、综合写作原则

**公车叙事的六条铁律**：

1. **物理空间要为心理空间服务**：描写座椅/窗户/走道的目的，是建立角色之间的距离感和视线盲区，不是单纯的场景描写
2. **声音要有功能**：每一处声音描写都要推进情绪或暗示事件，不是背景音效
3. **对话要有弦外之音**：公车上没有废话，每句话都有策略含义，写对话前先问"他为什么说这句话"
4. **淘汰要有多维信息释放**：死亡不能只是死亡，它必须同时揭示角色/规则/关系三个层面的信息
5. **信息不对称要被精心管理**：读者知道什么、主角知道什么、其他角色知道什么，这三者之间的差异是叙事张力的核心来源
6. **规则必须用代价来教学**：讲述规则的最有效方式是让人违反它并承受后果，不是系统广播',
  '## "Narrative Technique" — Thriller Bus Novel

The writing challenge of the bus sealed room lies in its **extremely small physical space but extremely high narrative density**: one compartment, a dozen people, no escape — all fear must grow from spatial constraints, not from piling on external horror elements.

Good bus narrative pursues the suffocating feeling of "no way out": physically no way out (doors locked / bus moving), informationally no way out (don''t know the rules / don''t know who is the enemy), psychologically no way out (every decision has a cost).

---

### 1. Writing Claustrophobic Pressure

**1.1 The Strategic Significance of Seat Position**

Where the protagonist chooses to sit reveals everything about this person, and determines what they can and cannot see.

| Seat Position | Narrative Meaning | Blind Spot | Typical Character Type |
|---------------|------------------|------------|----------------------|
| Last row window | Defensive, full view, reactive | Cannot see front passengers'' faces | Cautious veteran / introverted newcomer |
| Middle aisle seat | Aggressive, easy movement, info hub | Easily monitored from multiple sides | Social game player |
| First row behind driver | Active explorer, close to info source | Everyone watching their back | Protagonist / info hunter |
| Front row near door | Escape mentality, but actually most dangerous | Cannot observe overall situation | Panicking newcomer |

**Writing technique**: Do not describe seat selection as "the protagonist thought for a moment and sat in the middle" — write **what the protagonist observed and considered when making this decision**, letting the seat choice itself become character revelation.

---

**1.2 Sound Details for Pressure**

In a closed space, sound has nowhere to dissipate. Engine sound / braking sound / other passengers'' breathing — these are not background; they are externalizations of characters'' psychological states.

**Sound layer structure**:
- **Base sound**: Engine hum (continuous, unstoppable, meaning "the bus is still moving")
- **Mid sound**: Seat friction, clothing rustle, unnatural throat-clearing (representing human presence and nervous state)
- **Upper sound**: Occasional sounds — someone crying / hushed voices / sudden metallic noise (representing imminent events)

**Writing time distortion**:
- Engine sound can stretch or compress time (sustained engine description = time stretching; engine suddenly stopping = time freezing)
- Braking sound has more violence than language — the bus stops, not announced by the system, but stopping by itself
- Silence before rule announcement: everyone silent, only engine sound — this silence is more terrifying than noise

---

### 2. Writing Character Game Theory

**2.1 Subtext Dialogue Technique**

Every line of dialogue on the bus has three levels: surface meaning / speaker''s true intent / listener''s interpretation.

**Rules for writing subtext**:
- After every probing line of dialogue, the protagonist must have an **internal decoding process** (what is he asking? why? what does he know?)
- The protagonist''s reply must reflect their strategic choice (evasion / counter-question / feigning ignorance / direct answer)
- Dialogue must not rush to direct information exchange — there must be back-and-forth, pauses, signal probing

**Comparison Example 3: Game-theory dialogue**

Wrong approach:
```
"Do you know the rules?" the veteran asked.
"No," Lin Ke said, "you?"
"I know some," the other said. "I can tell you."
Lin Ke nodded, and they began exchanging information.
```

Correct approach:
```
"How long have you been on the bus?"
Lin Ke glanced at him. How long — was this asking whether he was a newcomer or veteran, or confirming whether he''d noticed something?
"About the same as you," Lin Ke said. "You?"
The other person was silent for two seconds.
Two seconds is long. Two seconds means he''s calculating, and the calculation itself means his answer carries a cost for him.
"First time," he finally said, eyes not leaving Lin Ke. "Do you believe that?"
Lin Ke didn''t answer. He didn''t believe it, but saying so was pointless.
"Which seat?" Lin Ke said.
```

---

**2.2 Eyes and Micro-expressions**

In a closed space, people watch each other far longer than normal — eye contact is itself a game tool.

**Meaning of eye contact**:
- Immediate look-away after contact = has a secret, or trying to avoid being evaluated
- Not looking away after contact = active confrontation, or testing the other''s psychological stability
- Eyes drifting toward a location = something there they care about
- Completely not looking at someone = deliberate avoidance, possibly feigned indifference

---

### 3. Rule-Reveal Pacing Technique

**3.1 Rules Must Not Be Revealed All at Once**

Revealing all rules in a complete announcement = passengers passively receive, exploration dimension lost.
Revealing rules in batches = passengers continuously in "what don''t I know yet" anxiety.

**Four mechanisms for batch revelation**:
1. **Stop-triggered**: One new rule announced at each new stop
2. **Behavior-triggered**: Someone does something, system announces the corresponding rule — rule teaching through consequences
3. **Violation-triggered**: The first person dies, then rules fully display — death is the final annotation of rules
4. **Protagonist-exploration**: Rules never announced; protagonist must discover through action and inference

**Comparison Example 4: Ways to reveal rules**

Wrong approach:
```
The system announced: "Rule one: no phone use in the compartment. Rule two: no attacking other passengers. Rule three: every two stops, the passenger with fewest votes is eliminated. Violators are immediately removed."
Lin Ke memorized these rules.
```

Correct approach:
```
The system said only one sentence.

"Have a pleasant journey."

That was all. No rules, no explanation, no description of elimination mechanics.
Lin Ke heard someone laugh quietly in the back row — the kind of laugh that overflows when tension reaches its limit. Then that person took out their phone.

The system''s next sentence came three seconds later, quieter than the first, but every word was clear:

"Violation detected. Rule one triggered."

The laughter stopped.
```

---

### 4. Elimination Scene Writing Standards

**4.1 What a Good Elimination Scene Must Include**

Elimination is not "someone died." Elimination is a **multi-dimensional information release node**.

**Five dimensions of information release**:

| Dimension | Question | Narrative Value |
|-----------|----------|----------------|
| About the eliminated | What does their final action / choice / words reveal? | Complete character arc, or overturn reader''s judgment |
| About rules | Which rule does this elimination finally demonstrate? | Make rules real from text; amplify fear |
| About witnesses | What do others'' reactions reveal? | Show character and stance; advance relationship dynamics |
| About protagonist | What is protagonist''s inner response? | Show protagonist''s moral state and strategic growth |
| About readers | What emotional response does this death create? | Emotional resonance is the motivation to keep reading |

**Comparison Example 5: Elimination scene writing**

Wrong approach:
```
The system announced Zhang Ming had violated rules, and then Zhang Ming disappeared. The other passengers felt very scared and continued following the rules.
```

Correct approach:
```
The system said two characters.

Zhang Ming''s name.

Then three seconds of silence — not real silence; Lin Ke could hear his own heartbeat, could hear someone to the right clenching their jaw, could hear the engine, could hear everything, only no one spoke.

Zhang Ming was still standing in place. He looked down at his own hands, as if confirming something.

"I didn''t—" he started. "I didn''t violate—"

He couldn''t finish.

Not his voice stopping — him stopping. Like a machine with its power cut, he dropped directly, no struggle, no sound, no trace. The seat was empty.

Lin Ke stared at that seat for three seconds.

In those three seconds he realized one thing: he didn''t know what Zhang Ming had violated. He hadn''t seen any violation, the system hadn''t given a reason, and all of them were now facing a rule system they couldn''t understand at all — and this system had just completed its first demonstration.

Behind him, someone began crying, voice suppressed, but crying nonetheless.
```

---

### 5. Information Asymmetry Writing Tools

**5.1 Managing Multiple Layers of Information Asymmetry**

Bus narrative contains multiple simultaneous information gaps:
- Reader knows A (author hinted in narration), but protagonist does not
- Protagonist knows B (obtained through private prop/conversation), but some character does not
- Some character knows C (system''s private message / veteran experience), but neither reader nor protagonist knows

**Three writing tools for managing information asymmetry**:

**Tool 1: Restricted perspective narration**
Protagonist can only see/hear/know information they can access. Other characters'' inner states must be inferred from external behavior.
- Usage: Write "protagonist''s wrong judgment about something," then reveal the truth in later chapters
- Effect: Readers may be misled along with protagonist, or may spot the error early — both experiences have value

**Tool 2: Intentional narrative omission**
Author knows certain information but deliberately doesn''t write it in a scene, revealing it in a later scene.
- Usage: Write "someone left, went to the next compartment," switch to another character''s perspective for a chapter, then return to reveal what that person did
- Effect: Creates mystery about "what happened in that time I didn''t see"

**Tool 3: Unreliable internal monologue**
Protagonist''s inner judgment is wrong, but the author doesn''t correct it, letting readers discover it themselves.
- Usage: Protagonist decides someone is an ally and acts on this premise throughout, until the betrayal happens
- Effect: The shock of betrayal multiplies because "both protagonist and reader were deceived together"

**Comparison Example 6: Writing information asymmetry**

Wrong (author directly tells reader the truth):
```
Lin Ke thought Chen Jing was a newcomer, but in fact Chen Jing had experienced seven dungeons and was only feigning ignorance.
```

Correct (hint through details, don''t state directly):
```
Chen Jing asked where the exit was for the third time, tone genuinely bewildered.
But Lin Ke noticed that when she asked the first time, she was already looking at that door.
He said nothing.
```

**Comparison Example 7: Tension — "protagonist knows but cannot speak"**

Wrong:
```
Lin Ke knew the hidden rule but decided to keep it secret because revealing it would not benefit him.
```

Correct:
```
Fang Yun said: "We should act collectively, share information with each other."

Lin Ke nodded.

In his pocket, that piece of paper read: Collective action will trigger "group behavior" recognition; the system will additionally eliminate the most consistently acting group.

He maintained his nodding posture and continued listening to Fang Yun speak.
```

---

### 6. Comprehensive Writing Principles

**Six iron rules of bus narrative**:

1. **Physical space serves psychological space**: Describing seats/windows/aisles builds distance and visual blind spots between characters, not mere scene description
2. **Sound must have function**: Every sound description advances emotion or hints at events; it is not background ambience
3. **Dialogue must have subtext**: No idle chat on the bus; every line has strategic meaning; before writing dialogue ask "why does this person say this?"
4. **Elimination must release multi-dimensional information**: Death cannot just be death; it must simultaneously reveal information about character / rules / relationships
5. **Information asymmetry must be carefully managed**: The difference between what readers know, what the protagonist knows, and what other characters know is the core source of narrative tension
6. **Rules must be taught through consequences**: The most effective way to convey rules is to let someone violate them and bear the consequences, not system broadcasts',
  (SELECT id FROM novel_creation_method WHERE name = '惊悚公车小说' LIMIT 1),
  1,
  89,
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
