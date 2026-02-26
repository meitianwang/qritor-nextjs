-- 灵异直播小说「道具」生成技能
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '灵异直播小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-lingyi-live-prop-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'lingyi-live-prop-gen',
  '灵异直播小说道具生成：涵盖打赏兑换道具的梯度设计原则、六类道具（驱邪防护/探测感知/直播设备/攻击封印/消耗品/未知灵异物品）的设计要点、鬼怪馈赠类道具的陷阱逻辑，附8件有记忆点的具体道具示例',
  'Ghost livestream novel prop generation: covers tiered design principles for donation-to-item conversion, design rules for six prop categories (exorcism/detection/livestream equipment/attack-sealing/consumables/unknown paranormal objects), the trap logic of ghost-gifted items, with 8 memorable specific prop examples',
  '## 「道具」生成 — 灵异直播小说

灵异直播小说的道具设计比传统灵异故事多了一个独特维度：**道具的「直播展示性」**。每件道具不只是功能性工具，还是直播内容的一部分——观众看到主播拿出某件道具时的反应，是道具价值的一半。

好的道具设计同时满足三个层面：**实用层**（在灵异对抗中有明确作用）、**成本层**（有副作用/使用条件/代价）、**展示层**（在直播画面里看起来有戏剧性）。

---

### 一、打赏兑换道具设计原则

#### 梯度设计

打赏系统是灵异直播小说独有的「金手指」，但梯度必须清晰，否则失去叙事价值：

| 打赏等级 | 代表金额（参考） | 道具类型 | 直播叙事功能 |
|---------|--------------|---------|------------|
| **小额打赏** | 几十元级别 | 消耗品（香烛/盐包/红绳） | 解决小问题，制造「小胜利」的满足感 |
| **中额打赏** | 几百元级别 | 探测/防护道具（EMF探测仪/符咒） | 解决中等危机，展示粉丝与主播的互动 |
| **高额打赏** | 几千到上万 | 核心灵异道具（专属法器/封印工具） | 高潮时刻救场，制造「粉丝救了主播」的情感高点 |
| **超级打赏** | 五位数以上 | 一次性强力道具/专业法师联系方式 | 只在极端情况下出现，具有剧情转折意义 |

**每件道具必须有的三个要素**：
1. **使用条件**：不是拿起来就能用——需要特定时机、特定姿势、特定咒语
2. **副作用**：用完之后对主播有什么代价？哪怕是轻微的代价也不能省略
3. **一次性或耗竭设计**：道具「用完了」是危机时刻，不要给主播无限弹药

**道具的「直播展示性」原则**：
- 道具在画面里要有**视觉特征**——不能是一个普通小包装，要有可以「开箱展示」的设计
- 道具的使用过程要有**肉眼可见的效果**——如果驱邪符燃烧时有明显的蓝色火焰，观众会刷弹幕；如果什么都看不到，道具的叙事价值减半
- 道具要能**引发观众讨论**——「这个道具是真的有用还是心理作用？」「副作用会不会在后面爆发？」

---

### 二、六类道具的设计要点

#### 类型一：驱邪防护型

**设计原则：不要「无敌盾」**

驱邪防护道具的常见陷阱是「主播拿着它就不会有事」——这消除了所有悬念。

正确设计框架：
- **范围限制**：防护范围必须有边界（「三步以内」/「持续接触皮肤才有效」/「结界直径两米」）
- **破防条件**：什么情况下防护失效——灵异等级超过道具上限、鬼怪有意针对道具弱点、主播情绪激烈时防护减弱
- **维持成本**：长期保持防护状态是有代价的（「每小时消耗一块」/「使用者体温持续下降」）
- **被绕过的可能**：鬼怪不必正面破防，可以通过影响道具旁边的人来间接突破

示例设定：「净宅盐阵」——在探险地点四角撒盐形成结界，结界内灵异强度降低三成，但盐阵需要完整才有效，任何一角被扰动则失效，而盐撒下后会发出轻微的磷光，反而「标记」了主播的位置。

#### 类型二：探测感知型

**设计原则：让探测设备成为叙事工具而非答案机**

探测道具如果只是「哔一声说明有鬼」，价值极低。高价值探测道具的设计方向：

- **数据的不确定性**：EMF探测仪数值异常——但今晚可能是电网干扰。灵异验证需要多个数据点交叉确认。
- **探测结果引发行动决策**：「温度计显示某个方向温度骤降5度」——这不是「有鬼确认」，而是「主播要不要往那个方向走」的决策节点
- **探测反过来暴露主播**：某些灵异感知到被探测后会「回应」——探测仪触发不只是告知，还可能是「打招呼」
- **读者先于主播看到数据**：画面里的数字读者比主播先看到，制造「主播你快看！」的期待感

示例设定：「灵视眼镜」——佩戴后可以在摄像头画面里显示灵异活动的「轨迹」（热成像般的残影），但眼镜只能单向工作——主播能看到鬼，鬼也能更清晰地看到主播；摘下后有10分钟的「余像」，这段时间主播在黑暗中看到的任何东西都不知道是真是假。

#### 类型三：记录取证型（直播设备类）

**设计原则：让直播设备本身成为恐惧来源**

这类道具是灵异直播类型的核心创意空间——摄像机不只是记录工具，它可以是：

- **比主播诚实的见证者**：摄像头捕捉到主播肉眼没看到的东西（已在指南中详述）
- **被鬼怪干扰的受害者**：某段录像里，画面里的主播在做一件他完全不记得做过的事；或者，录像里的主播在说话，但说的不是主播本人的声音
- **自动录像的备用机**：主播以为备用摄像机关闭了，但它一直在录——它录下了主播不知道发生的事
- **摄像头的「选择」**：某个方向的摄像头反复自动对焦——不是随机，是它在选择看什么

特殊道具示例设定：「第七摄像位」——粉丝高额打赏后，主播在地点内部部署的一台固定摄像机。主播离开那个区域后，摄像机仍在直播。弹幕可以看到固定摄像机的画面，但主播看不到，形成「读者知道但主播不知道」的信息差。某次直播中，固定摄像机录到了「主播已经离开后，有什么东西在主播刚才站的位置停留了很久」。

#### 类型四：攻击封印型

**设计原则：使用代价要高，不能轻易用**

攻击封印类道具是强力武器，必须有高昂的使用代价，否则读者会问「为什么不一开始就用这个」：

- **物质代价**：用完之后道具永久损坏，或者某部分需要用主播自身作为「材料」（血/发/体温）
- **时间代价**：封印需要固定时间，在这段时间内主播无法移动——而鬼怪知道这个
- **不可逆代价**：使用后会「确认」这个地点的某种状态，例如用了封印，则那里的灵异永远无法被超度，只能被压制
- **精神代价**：使用者需要在使用时承受灵异的正面对抗（「让它进来」才能封住它）

示例设定：「摄魂镜」——一面手持圆镜，能在直播画面中显示当前最强怨灵的「本来面目」（不是它想展示的样子，而是它死时的样子）。对怨灵有极强的压制效果，但镜子只有七次使用机会，每用一次镜面开裂一道，用满七次后镜子碎裂，碎片会对使用者造成「灵异反噬」——看到了不该看的，会在随后的七天里反复梦见对方的死亡过程。

#### 类型五：消耗品

**设计原则：让「用完了」成为危机时刻**

消耗品是叙事节奏的调控工具：

- **每件消耗品都应该有一次「以为用完了但没完」或「以为还有但用完了」的叙事反转**
- **消耗品的最后一件必须用在最关键的时刻**——不要让主播在无关紧要时随便消耗
- **消耗品应该有「升级版」**：普通香烛 → 特制大香 → 某种只有特定渠道才能获得的消耗品
- **消耗品的「数量」本身就是悬念**：弹幕会刷「还剩几个？」，主播清点数量的画面是天然的紧张场景

示例设定：「驱邪盐包」（消耗品）——小额打赏兑换，一包约100克。朝灵异方向撒出有驱逐效果，但只能让S级以下的灵异暂时后退，不能真正伤害。一次探险通常带3-5包。用完时没有备货是危机。特殊规则：在某些地点，盐包会在接触某种特定灵异时融化变黑——意味着那种灵异已经强到让驱邪材料「失效」，是升级信号。

#### 类型六：未知灵异物品

**设计原则：在凶宅内发现的东西，是道具还是陷阱**

这类道具的设计核心是「不确定性」：

- **外观上无法分辨**：它看起来可能是普通的遗留物品，也可能是特制的法器，主播无法立刻判断
- **功能未知**：用了才知道是什么效果，不用则永远是悬念
- **主动/被动的区分**：有些东西是等在那里被「发现」的，有些是「跟着主播走」出来的——后者更危险
- **使用与不使用都有代价**：用了可能中计；不用可能错过关键线索或道具

这类道具最适合用于「信息不对称」的叙事节点：弹幕有人认出了那个东西，但他们不知道是该说还是不说，因为说出来可能引导主播走进陷阱，不说又觉得主播处于危险中。

---

### 三、「鬼怪馈赠」类道具的特殊处理

#### 鬼怪主动给的东西一定有目的——陷阱逻辑设计

鬼怪给主播东西，永远不是出于好意。四种常见的陷阱逻辑：

**逻辑一：「通行证」陷阱**
鬼怪给了一件看似「安全通行」的物品——戴着它可以穿越某个危险区域。但这件物品实际上是「标记」：它让灵异世界认为主播是「可以被带走的」，而不是「外人」。主播进入后，离开变得越来越困难。

**逻辑二：「信息等价交换」陷阱**
鬼怪给了一件能提供信息的道具（如一本日记/一段录像/一件有记忆的物品）。道具里的信息是真实的，但获取信息的同时，主播也在「接受」鬼怪对他的了解——它知道了主播的名字、形象、甚至主播在意的人是谁。

**逻辑三：「工具」陷阱**
鬼怪给的道具确实能驱邪——驱的是另一个灵异，因为那个灵异是鬼怪的「竞争对手」或「威胁」。主播帮了鬼怪解决了对手，而让真正危险的那个变得更强。

**逻辑四：「执念转移」陷阱**
道具本身承载了鬼怪的执念。拿走它等于把执念带走了——鬼怪不再需要「在原地等」，它现在可以跟着道具走。主播带走道具，等于把鬼怪带回了家。

**写法建议**：鬼怪馈赠的揭露时机应在道具被使用一段时间之后，当主播已经对道具建立了「依赖感」时。揭露不是「道具是假的」，而是「道具是真的，但真正的目的从来不是帮助你」。

---

### 四、具体道具示例

#### 道具1：「阴测仪」

- **类型**：探测感知型
- **效果**：手持设备，显示当前空间灵异「密度」（1-10格），超过8格时开始震动报警
- **副作用**：长期使用者（超过10次探险）会对「阴测仪」产生「幻读」——在灵异密度为0的地方，有时会读出数值，使用者无法判断是设备故障还是灵异
- **获取方式**：主播自带基础款，粉丝打赏可兑换「进阶款」（增加温度传感器和声纹分析）
- **直播展示价值**：画面里弹幕可以和主播同步看到数值，弹幕会预测「这里肯定要超8格」，数值上升时直播间气氛会随之升温

#### 道具2：「镇魂符」（可堆叠消耗品）

- **类型**：驱邪防护型消耗品
- **效果**：贴在身上有基础防护效果，贴在门/墙上形成「不得入内」的结界。单张有效期约4小时或受到一次灵异冲击后失效
- **副作用**：符纸接触灵异时有刺鼻的硫磺气味，在密闭空间大量使用时会让主播头晕
- **获取方式**：中额打赏兑换，每次10张。高端版（大师手写符）单张等于普通符5张，但一次只能兑换1张
- **直播展示价值**：燃烧时有橙黄色火焰；被强灵异「击穿」时会迅速燃尽，视觉冲击强；画面里可以看到贴在门上的符纸是否出现异常（发黄/发黑/自燃）

#### 道具3：「问魂铃」

- **类型**：探测感知型 / 未知灵异物品（兼具两类特征）
- **效果**：一只旧铜铃，在场地内摇动时，如果灵异想「回应」，铃声会持续更长时间。摇三下，如果铃声响了四下，说明有存在在回应；如果铃声完全哑了，说明灵异等级超过道具上限，已经在「压制」铃声
- **副作用**：每次主动使用，意味着主播在「询问」对方——灵异知道有人在问，会变得更活跃。用完后需要24小时冷却，否则铃声会持续不停响，不是道具在工作，是它在「回话」
- **获取方式**：高额打赏兑换；或在探险地点发现（「未知灵异物品」情形），后者来历不明，是馈赠还是陷阱需要进一步确认
- **直播展示价值**：铃声的变化可以被麦克风捕捉，弹幕可以数「响了几下」；铃哑的瞬间是极强的恐怖点——「哑了代表什么？」

#### 道具4：「眼底膏」

- **类型**：探测感知型（临时增强）
- **效果**：用特制黑膏涂抹眼睑，持续约1小时。涂抹后可以「看到」普通视觉无法感知的灵异形态，但看到的是灵异的「完整状态」——包括它最恐惧的形象
- **副作用**：每次使用后有概率（使用次数越多概率越高）让使用者在使用期结束后仍然「看到」某些东西，且越来越难区分是灵异还是幻觉。使用超过5次后，主播在正常光线下也开始「看到」边缘视野中的东西，停药无法立刻消除
- **获取方式**：高额打赏兑换；稀有，每次只能兑换1剂
- **直播展示价值**：主播涂上后摄像头画面里「什么都看不到」，但主播的描述和反应会让观众极度紧张——「他在看什么？为什么他的表情变成了那样？」

#### 道具5：「无声布」

- **类型**：驱邪防护型（被动）
- **效果**：一块约1米见方的黑布。将物品用无声布包裹，被包裹的物品会暂时「隔绝」灵异感知——包括道具本身的灵异属性和人身上的「气息」
- **副作用**：灵异世界无法感知布里的东西，但布本身会「吸收」接触时的灵异残留，用得越多「越脏」，变脏之后包裹在里面的东西反而会被加强感知
- **获取方式**：中额打赏兑换
- **直播展示价值**：视觉上平平无奇，叙事价值在于「怎么用」——主播用它包住自己的手再接触一个危险物品时，观众的期待值极高；在关键时刻用来包住某个「鬼怪馈赠物」时，弹幕会爆炸

#### 道具6：「直播接灵台」

- **类型**：记录取证型（特殊装置）
- **效果**：一套固定部署装置（包含三个摄像头和一台本地录像机），部署后开始自动录像，与主直播流同步，但录像不受网络影响——即使主播直播信号中断，接灵台仍在录
- **副作用**：接灵台的录像对灵异有「吸引力」——某些灵异会靠近录像机，因为录像机在「注视」它们。这意味着主播离开部署区域后，那里的灵异活动可能反而增加
- **获取方式**：超级打赏兑换，每场探险只能部署一套
- **直播展示价值**：弹幕可以看到三个摄像头的画面，但主播只能在直播间里看到一路。弹幕会「发现」其他摄像头里的东西，但主播不知道。某次直播中，接灵台录下了主播「不在场时」发生的一切，成为当场最恐怖的内容。

#### 道具7：「鬼眼镜」（鬼怪馈赠类）

- **类型**：未知灵异物品 / 探测感知型（双重属性）
- **效果**：一副看起来普通的老式圆框眼镜，戴上后可以看到「鬼魂视角」——鬼魂在看什么、在追踪什么、对什么感兴趣
- **陷阱逻辑**：眼镜是「执念转移」类馈赠——戴上眼镜意味着接受了上一个戴过它的人的部分感知遗留。「上一个戴过它的人」是某个死亡的人，戴眼镜的时间越长，那个死者的记忆/情绪/死亡恐惧开始渗入使用者的意识
- **副作用**：戴超过20分钟开始出现「别人的记忆」，摘下后完整记忆需要数小时恢复；使用次数越多，那个死者的情绪驻留时间越长
- **获取方式**：在探险地点发现（馈赠），来历不明
- **直播展示价值**：主播戴上后描述的东西「和观众看到的完全不同」，制造强烈的「主播看到了什么我们看不到」的悬疑感

#### 道具8：「回魂香」

- **类型**：攻击封印型（限定）
- **效果**：三支特制香，点燃后香烟聚集在场地内最强怨念所在的位置——不是驱逐，而是「召唤显形」。能让隐藏的灵异强制现形5分钟，现形期间更容易被封印/沟通/破解
- **副作用**：召唤显形会让灵异「知道了主播的底牌」——它知道主播在用什么来对付它，5分钟后它消散时已经在针对「下次」做准备。此外，点燃回魂香会让周边所有灵异感知到有人在「召唤」，低等级灵异可能蜂拥而至
- **获取方式**：高额打赏兑换，每次只能兑换一组（3支），不可积累
- **直播展示价值**：三支香同时点燃时摄像头会捕捉到香烟的「异常聚集」；现形的5分钟是整场直播最紧张的片段——限时、可见、必须行动

---

### 与已有设定的联动

| 设定模块 | 对道具的影响 |
|---------|------------|
| **地点灵异等级** | 地点等级决定道具的有效范围——C级凶地普通道具够用，S级凶地基础道具可能直接失效 |
| **打赏经济体系** | 道具的打赏兑换门槛需要和粉丝规模匹配——主播粉丝少的时候高额道具来不了是危机 |
| **非人观众角色** | 非人观众的存在影响「弹幕推荐道具」的场景——它可能推荐一个对它有利的「道具」 |
| **故事阶段** | 早期道具以探测/防护为主；中期加入攻击封印；后期加入高代价道具或鬼怪馈赠 |

---

### 常见错误

1. **道具没有副作用**：每件道具都是「拿来就用，用完没事」——灵异道具必须有代价，代价是叙事张力的来源
2. **打赏道具变成万能金手指**：打赏足够多就能解决一切灵异——悬念消失，流量逻辑失效
3. **消耗品「永远够用」**：主播的道具库存从来不告急——错过了「最后一个」的叙事高潮
4. **直播展示性为零**：道具的使用画面里什么都看不到，读者对道具没有具体印象
5. **鬼怪馈赠太好用**：鬼怪给的东西只有好处没有代价，破坏了「对手是聪明的」的前提
6. **道具孤立于世界观**：道具的设计和地点、鬼怪的特性没有关联，缺乏「有效/无效」的内在逻辑
7. **未知灵异物品总是陷阱**：如果读者预设「在凶宅发现的东西=陷阱」，可以设计一次「它确实是有用的道具」的反预期，让读者无法形成稳定判断',
  '## "Prop" Generation — Ghost Livestream Novel

The key addition to prop design in ghost livestream novels compared to traditional horror is the **"livestream display value"** dimension. Every prop is not only a functional tool but also content within the broadcast — viewer reaction to seeing the streamer pull out a particular item is half the prop''s value.

Strong prop design satisfies three simultaneous layers: **utility layer** (clear function in paranormal confrontation), **cost layer** (side effects/usage conditions/price), **display layer** (looks dramatically compelling in the stream''s visual frame).

---

### I. Donation-to-Item Tiered Design Principles

#### Tier Structure

The donation system is the ghost livestream genre''s unique power system, but the tiers must be clearly defined or the system loses narrative value:

| Donation Tier | Representative Amount | Item Type | Livestream Narrative Function |
|--------------|----------------------|-----------|------------------------------|
| **Small donation** | Tens of yuan | Consumables (incense/salt packet/red cord) | Solve minor problems, deliver "small victory" satisfaction |
| **Mid donation** | Hundreds of yuan | Detection/protection items (EMF meter/talisman) | Resolve medium crises, display fan-streamer interaction |
| **Large donation** | Thousands to tens of thousands | Core paranormal items (dedicated ritual tool/sealing implement) | Climax moment saves the day, creates "fans saved the streamer" emotional peak |
| **Super donation** | Five figures and above | Single-use powerful item / professional exorcist contact | Only appears in extreme situations; has plot-turning significance |

**Three required elements for every prop**:
1. **Usage condition**: Not pick-up-and-use — requires specific timing, posture, or incantation
2. **Side effect**: What cost does the streamer pay after use? Even a minor cost cannot be omitted
3. **Consumable or depletion design**: Props "running out" is a crisis moment; don''t give the streamer infinite ammunition

**The "Livestream Display Value" Principle**:
- Props need **visual identity** on screen — not a plain wrapper, but something that can be "unboxed" for presentation
- The usage process needs **visible, concrete effects** — if the exorcism talisman burns with a visible blue flame, viewers flood the danmaku; if nothing is visible, the prop''s narrative value is halved
- Props should **generate viewer discussion** — "Is this prop actually working or just psychological?" / "When will the side effect detonate?"

---

### II. Design Rules for Six Prop Categories

#### Category 1: Exorcism and Protection

**Design Principle: No "invincible shields"**

The common trap for exorcism props is "as long as the streamer holds it, they''re safe" — this eliminates all suspense.

Correct design framework:
- **Range limits**: Protection must have spatial boundaries ("within three steps" / "only effective while in continuous contact with skin" / "two-meter barrier radius")
- **Breach conditions**: When does protection fail — paranormal tier exceeds the item''s ceiling, the ghost deliberately targets the item''s weakness, or the streamer''s emotional state weakens the protection
- **Maintenance cost**: Sustained protection has a price ("one unit consumed per hour" / "user''s body temperature continuously drops")
- **Circumvention possibility**: The ghost doesn''t have to break through directly — it can target someone near the prop to create an indirect opening

#### Category 2: Detection and Sensing

**Design Principle: Make detection equipment a narrative tool, not an answer machine**

Detection props that only "beep to indicate a ghost" have minimal value. High-value detection design directions:

- **Data ambiguity**: EMF readings are anomalous — but tonight might be grid interference. Paranormal confirmation requires multiple corroborating data points
- **Detection results drive decisions**: "Thermometer shows temperature drops 5°C in one direction" — not "ghost confirmed," but a decision node: "should the streamer walk that way?"
- **Detection exposes the streamer in return**: Some entities sense when they''re being detected and "respond" — triggering the detector is not just informational, it may be "saying hello"
- **Readers see the data before the streamer does**: Numbers on screen are read by viewers before the streamer notices, creating the "Streamer, look!" anticipation

#### Category 3: Recording and Documentation (Livestream Equipment)

**Design Principle: Make the livestream equipment itself a source of horror**

This category is the creative heart of the ghost livestream genre — cameras are not just recording tools, they can be:

- **More honest witnesses than the streamer**: The camera captures what the streamer''s naked eye misses
- **Victims of ghost interference**: A section of footage shows the streamer doing something they have no memory of; or the footage shows the streamer speaking, but the voice isn''t theirs
- **Backup cameras still recording**: The streamer thinks the backup was off — it wasn''t. It recorded what the streamer doesn''t know happened
- **The camera''s "choices"**: One camera repeatedly auto-focuses in a direction — not random; it''s choosing what to watch

#### Category 4: Attack and Sealing

**Design Principle: Usage cost must be high — cannot be deployed casually**

Attack and sealing props are powerful weapons that must carry heavy usage costs, or readers will ask "why didn''t they just use this from the start":

- **Material cost**: Item permanently destroyed after use, or some component requires the streamer as "material" (blood/hair/body heat)
- **Time cost**: Sealing requires a fixed duration during which the streamer cannot move — and the ghost knows this
- **Irreversible cost**: Using the seal "fixes" the location''s state — the paranormal can never be truly pacified, only suppressed
- **Psychic cost**: The user must endure direct paranormal confrontation during use ("letting it in" in order to seal it)

#### Category 5: Consumables

**Design Principle: Make "it''s gone" a crisis moment**

Consumables are the pacing tool of the narrative rhythm:

- **Each consumable should have one "thought it was gone but wasn''t" or "thought there was more but it''s gone" plot reversal**
- **The last remaining consumable must be used at the most critical moment** — don''t let the streamer casually spend it on minor incidents
- **Consumables should have "upgrade versions"**: Plain incense → special-crafted incense → something only accessible through a specific channel
- **The "count" of remaining consumables is itself suspense**: Danmaku floods with "how many left?" — the streamer counting their supply is a naturally tense visual

#### Category 6: Unknown Paranormal Objects

**Design Principle: Objects found inside the haunted site — tool or trap?**

The core of this category is uncertainty:

- **Visually indistinguishable**: Looks like it might be an ordinary leftover object or a purpose-crafted ritual tool; the streamer cannot immediately determine which
- **Unknown function**: Usage is the only way to know the effect; not using it leaves it as permanent suspense
- **Active vs. passive distinction**: Some objects are waiting to be "found"; others "follow the streamer out" — the latter is more dangerous
- **Cost of using and not using**: Using might trigger a trap; not using might mean missing a critical clue or item

This category is most suited for "information asymmetry" narrative nodes: a viewer in the danmaku recognizes the object but doesn''t know whether to say so, because revealing it might guide the streamer into a trap, while staying silent leaves the streamer in danger.

---

### III. Special Handling of Ghost-Gifted Items

#### Four Trap Logic Designs for Items a Ghost Voluntarily Offers

**Logic 1 — "Safe Passage" Trap**
The ghost offers something that appears to grant safe transit through a dangerous zone. The item is actually a "marker": it signals to the supernatural world that the streamer is "claimable" rather than an outsider. After the streamer enters, leaving becomes progressively harder.

**Logic 2 — "Information Exchange" Trap**
The ghost offers an information-bearing item (a diary / a recording / an object with embedded memories). The information inside is real — but in the act of receiving it, the streamer is also "accepting" the ghost''s awareness of them. It now knows the streamer''s name, face, and who the streamer cares about.

**Logic 3 — "Tool" Trap**
The gifted item genuinely repels a paranormal entity — but the entity it repels is a rival or threat to the gift-giver. The streamer unknowingly eliminates the ghost''s competition, making the truly dangerous entity stronger.

**Logic 4 — "Obsession Transfer" Trap**
The item carries the ghost''s obsession. Taking it means carrying the obsession away — the ghost no longer needs to "wait in place"; it can now follow the item. The streamer taking the item home is the same as inviting the ghost home.

**Writing Recommendation**: The reveal of a ghost-gifted item''s true nature should come after the streamer has used it long enough to develop dependency. The reveal is not "the item was fake" — it''s "the item is real, but its actual purpose was never to help you."

---

### IV. Specific Prop Examples

#### Prop 1: "Yin Detector"

- **Type**: Detection and sensing
- **Effect**: Handheld device displaying current space''s paranormal "density" (1-10 bars); vibrates and alarms above 8 bars
- **Side Effect**: Long-term users (10+ sessions) develop "phantom readings" — occasionally displays nonzero values in zero-paranormal environments; user cannot distinguish equipment glitch from real detection
- **Acquisition**: Streamer carries a base model; fans can donate to unlock the "advanced model" (adds temperature sensor and audio pattern analysis)
- **Display Value**: Viewers can watch the number in real time alongside the streamer; danmaku pre-calls "this is definitely going over 8"; rising numbers build atmosphere with the audience

#### Prop 2: "Soul-Sealing Talisman" (Stackable Consumable)

- **Type**: Exorcism protection / consumable
- **Effect**: Worn on the body for basic protection; affixed to doors or walls creates a "no entry" barrier. Single talisman effective for ~4 hours or until absorbing one paranormal impact, then burns out
- **Side Effect**: Talismans emit pungent sulfur when contacting the paranormal; bulk use in enclosed spaces causes dizziness
- **Acquisition**: Mid-tier donation unlocks 10 at a time; premium hand-inscribed version equals 5 standard talismans but only 1 redeemable per session
- **Display Value**: Burns with orange-yellow flames; rapid combustion when "broken through" by strong entity is visually striking; viewers can watch talisman paper affixed to doors for yellowing/blackening/spontaneous ignition

#### Prop 3: "Soul-Questioning Bell"

- **Type**: Detection / unknown paranormal object (dual classification)
- **Effect**: An old brass bell. When rung inside a site, if a paranormal entity wants to "respond," the bell tone extends longer than the ring. Three rings — if the sound echoes four times, something is responding; if the bell goes completely silent, the paranormal tier has exceeded the item''s ceiling and is "suppressing" the sound
- **Side Effect**: Every active use signals to the entity that someone is asking — it becomes more active. After use, requires 24-hour cooldown; otherwise the bell rings continuously unprompted, not the device functioning but the entity "talking back"
- **Acquisition**: Large donation to unlock; or found inside the exploration site (unknown object scenario — whether gift or trap requires further determination)
- **Display Value**: Bell sound variations are captured by the microphone; danmaku counts "how many rings?"; the moment the bell goes silent is an extreme horror beat — "what does silent mean?"

#### Prop 4: "Eye-Base Ointment"

- **Type**: Detection and sensing (temporary enhancement)
- **Effect**: A specialized black ointment applied to the eyelids, lasting ~1 hour. Allows the user to "see" paranormal forms normally imperceptible — but what they see is the entity''s "complete state," including its most terrifying manifestation
- **Side Effect**: Each use carries increasing probability (higher with more uses) of continued vision after the effect period ends. After 5+ uses, the streamer begins seeing things in peripheral vision under normal lighting — this doesn''t clear immediately after stopping use
- **Acquisition**: Large donation to unlock; rare, only 1 dose per unlock
- **Display Value**: After application, the camera shows "nothing unusual," but the streamer''s description and visible emotional response creates extreme viewer tension — "What is he seeing? Why does his expression look like that?"

#### Prop 5: "Silent Cloth"

- **Type**: Exorcism protection (passive)
- **Effect**: A black cloth approximately one meter square. Objects wrapped in the Silent Cloth become temporarily "invisible" to paranormal detection — including both the object''s supernatural properties and the person''s presence signature
- **Side Effect**: The cloth "absorbs" paranormal residue from every contact. The more it''s used, the more "contaminated" it becomes; once sufficiently contaminated, objects wrapped inside it are amplified rather than concealed
- **Acquisition**: Mid-tier donation
- **Display Value**: Visually unremarkable on its own; narrative value lies in usage — when the streamer wraps their hand in it before handling a dangerous object, viewer anticipation is extreme; when used at a critical moment to wrap a ghost-gifted item, danmaku explodes

#### Prop 6: "Livestream Spirit Platform"

- **Type**: Recording and documentation (special installation)
- **Effect**: A deployment kit (three cameras and a local recorder). Once deployed, begins recording automatically, synchronized with the main stream, but footage is locally stored — even if the main stream signal drops, the platform keeps recording
- **Side Effect**: The Spirit Platform''s recording "attracts" paranormal entities — some move toward the cameras because the cameras are "watching" them. This means paranormal activity in the deployment zone may actually increase after the streamer leaves
- **Acquisition**: Super donation; only one set deployable per session
- **Display Value**: Danmaku can see all three camera feeds, but the streamer only sees one in the main stream. Viewers "discover" things in the other feeds that the streamer doesn''t know about. In one session, the Spirit Platform records everything that happened while the streamer was absent, becoming the most terrifying content of the night

#### Prop 7: "Ghost-Eye Glasses" (Ghost-Gifted Category)

- **Type**: Unknown paranormal object / detection and sensing (dual attribute)
- **Effect**: An ordinary-looking old round-frame pair of glasses. When worn, shows the "ghost''s perspective" — what the ghost is watching, what it''s tracking, what it finds interesting
- **Trap Logic**: Obsession Transfer type gift — wearing the glasses means accepting partial perceptual residue from the last person who wore them. The "last person to wear them" is someone who died; the longer the glasses are worn, the more that person''s memories, emotions, and death-terror seep into the user''s consciousness
- **Side Effect**: After 20+ continuous minutes, "someone else''s memories" begin appearing; full recovery of one''s own memories takes hours after removal; with repeated use, the dead person''s emotions linger longer each time
- **Acquisition**: Found during exploration (gifted scenario); origin unknown
- **Display Value**: After putting them on, what the streamer describes is "completely different from what the audience sees," creating intense "the streamer is seeing something we can''t" suspense

#### Prop 8: "Soul-Return Incense"

- **Type**: Attack and sealing (limited)
- **Effect**: Three specially prepared incense sticks. When lit, the smoke converges at the location of the strongest resentment in the site — not to drive it away, but to "force manifestation." Compels hidden paranormal entities to fully materialize for 5 minutes; during manifestation they are more vulnerable to sealing, communication, or dissolution
- **Side Effect**: Forced manifestation reveals the streamer''s tactical hand — the entity knows what the streamer is using against it; when it dissipates after 5 minutes, it has already begun preparing for the next encounter. Additionally, lighting the Soul-Return Incense signals "someone is summoning" to all nearby entities — lower-tier spirits may swarm toward it
- **Acquisition**: Large donation; only one set (3 sticks) per redemption, cannot be stockpiled
- **Display Value**: Simultaneous lighting of three sticks lets the camera capture "anomalous smoke convergence"; the 5-minute manifestation window is the most tense segment of the entire session — time-limited, visible, demands immediate action

---

### Setting Linkage

| Setting Module | Impact on Props |
|---------------|----------------|
| **Location Paranormal Tier** | Location tier determines prop effectiveness range — standard items work fine at C-tier sites; basic items may fail outright at S-tier |
| **Donation Economy System** | Prop unlock thresholds must match the streamer''s current follower scale — a large-donation item being unobtainable when the streamer has few fans is a crisis moment |
| **Non-Human Viewer Characters** | Non-human viewers'' presence affects "danmaku recommending props" scenarios — they may recommend an item that benefits them |
| **Story Stage** | Early story emphasizes detection/protection props; mid-story adds attack/sealing; late story introduces high-cost props or ghost-gifted items |

---

### Common Errors

1. **Props have no side effects**: Every item is "use it, done, no consequences" — paranormal props must have costs; costs are the source of narrative tension
2. **Donation props become omnipotent**: Enough donations solve any paranormal problem — suspense disappears, the donation logic collapses
3. **Consumables "never run out"**: The streamer''s supply never runs critically low — missing the "last one left" narrative climax
4. **Zero livestream display value**: The prop''s usage shows nothing visible on camera; readers have no concrete image of the prop
5. **Ghost-gifted items are too useful**: Ghost-given items have only benefits, no costs — breaks the premise that "the opponent is intelligent"
6. **Props are isolated from the worldbuilding**: Prop design has no connection to the location''s or ghost''s specific characteristics; no internal logic for "effective / ineffective"
7. **Unknown objects are always traps**: If readers default to "item found in haunted site = trap," design one moment where it''s genuinely a useful prop — preventing readers from forming a stable predictive pattern',
  (SELECT id FROM novel_creation_method WHERE name = '灵异直播小说' LIMIT 1),
  1,
  96,
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
