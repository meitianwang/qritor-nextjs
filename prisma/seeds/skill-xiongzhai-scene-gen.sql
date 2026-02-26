-- 凶宅灵异租房「空间」生成技能（Layer 3）
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-xiongzhai-scene-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xiongzhai-scene-gen',
  '凶宅灵异租房小说空间生成：设计这间房里每一个恐怖空间——客厅、卧室、浴室、床底，每个空间有专属恐惧逻辑',
  'Haunted rental horror space generation: design each terrifying space in the apartment — living room, bedroom, bathroom, under the bed — each space has its own horror logic',
  '## 空间生成 — 凶宅灵异租房小说创作

凶宅流的空间设计核心命题：**每一个房间都应该是一个独立的恐惧单元**——进入这个空间时，主角面对的不是"通用的恐惧氛围"，而是"这个空间专属的、来自这个位置本身的恐怖逻辑"。

设计原则：**空间的恐惧必须有物理来源**。"这个房间感觉不对劲"是弱写法；"这个房间的灯从来没有完全亮过，不是灯的问题，是光线打在那面墙上的方式不对——好像那面墙在吸收光线"是强写法。

---

### 各空间类型的专属恐惧逻辑

#### 客厅

客厅的叙事地位：**第一个被探索的空间，也是外界（门、窗）与内部（卧室、浴室）之间的过渡地带**。

客厅恐惧的核心来源：
- **电视**（凶宅流最经典的恐惧道具）：不仅仅是"自动开启"——有效的电视恐惧在于它播放的**内容**（过时的新闻、无声的画面、某个人的脸、或者这间房自己的画面）
- **入口与出口意识**：主角在客厅时总是背对着某个方向——那个方向有什么？
- **正常家具的异常感**：沙发的坐陷形状与任何现代人的体型都不符合；茶几上有水杯痕迹，但主角从来没有用过那个位置

**客厅恐惧现象设计要点**：
```
低强度：入住第一晚，电视画面闪了一下，没有声音，立刻正常了
中强度：半夜电视自动开启，画面是黑白的，像很旧的录像，主角看出那是这间房的客厅，但画面里有一个人在……
高强度：主角发现沙发背后的墙上有很浅的划痕，用手电照才看得清——是字，写的是一个日期
```

#### 主卧/卧室

卧室是**睡眠防御崩溃的场所**——人最脆弱的时间发生在这里：

- **床**：床本身是凶宅流最重要的单一物品。床头的方向、床垫的质感、床底（见下文）——每一个细节都可以承载恐惧
- **衣柜**：封闭的有机物空间；柜门关着时是什么，打开时会不会不一样
- **窗户**：夜晚的窗户是外部世界进入的通道；窗帘的透光程度；窗外的角度下谁能看进来

**卧室恐惧现象设计要点**：
- 睡眠相关的恐惧要有**延迟揭示**——主角早上醒来发现的比睡前看到的更恐惧
- 卧室的恐惧节奏通常是"越靠近睡眠时间，越活跃"

#### 床底

**床底是凶宅流最高效的单一恐惧空间**——因为人在床上时，床底是最近的"盲区"：

床底恐惧的核心是**声音先于视觉**：
- 主角听到声音，但必须决定"要不要低下头看"
- 这个决定本身就是恐惧的来源——"我知道我不想看，但我必须确认"

**床底恐惧设计分级**：
```
克制级：半夜有声音从床底传来，像呼吸，但比人的呼吸更慢
中等级：早晨发现床底有什么东西被移动过，排列成了某种形状，但看不出是什么
强烈级：有一次主角迫不得已必须低头看床底，看见的是……（留白，或极克制的描写）
```

**设计原则**：床底发生的事情，永远不要完全解释清楚。永远要保留一部分没有被主角看到的部分。

#### 卫生间/浴室

卫生间是凶宅流的**高密度恐惧空间**——密闭、潮湿、镜子：

- **镜子**：凶宅流最重要的"另一个维度窗口"。关键不是"镜子里出现了什么"，而是"镜子里的主角和主角本人有什么微小的差异"
- **水声**：自来水的声音、排水管的声音——这些日常声音在深夜浴室里有多种解读
- **温度**：浴室在特定时间会有不属于正常温控的温度异常

**浴室恐惧的特殊机制**：浴室是主角**最没有防御能力的地方**（洗澡时），这个物理上的脆弱性是内心脆弱性的直接映射。

**浴室恐惧现象设计要点**：
```
镜子系列：
- 第一阶段：镜面上有水雾，形状像手印，但不太像手印，太小了
- 第二阶段：主角在照镜子时，镜中倒影的眼神方向和主角不一样——不是盯着镜子看，而是在盯着镜子后面
- 第三阶段：有一天镜子上出现了划痕，划的是名字，不是主角的名字

水声系列：
- 主角没开水，但有极轻微的水流声，循环出现，每次45分钟左右
```

#### 厨房

厨房恐惧通常被低估——它的核心恐惧来源：
- **刀具的位置**：主角每次进厨房，刀的摆放位置都在意料之外
- **食物的状态**：主角买的食物不知道从什么时候开始有异常
- **火的行为**：炉子的火焰在没有风的情况下偏斜

#### 储藏室/杂物间

如果房子里有储藏室，它通常是**信息最密集的空间**：
- 前任租客最多可能在这里留下遗留物
- 主角最不想进，但必须进的理由（停电需要找电箱、奇怪的声音来自这里）
- 储藏室是"已知存在但尽量不去探索"的空间——这种刻意回避本身制造张力

#### 过道/走廊

走廊的恐惧来源于**线性的空间感**——走廊有两端，主角只能看到一端的情况下走向另一端：
- 走廊灯的覆盖范围；走廊尽头的门的状态
- 走廊声音的方向感（声音从哪端来的？）
- 走廊的长度本身——比实际走路时间更长

---

### 空间阵容的整体设计原则

**每个空间的恐惧差异化**：
- 每个空间应该有一种**主导感官**的恐惧（卧室→听觉，浴室→视觉，厨房→嗅觉/视觉，走廊→听觉+方向感）
- 同一种恐惧现象不要在多个空间重复出现

**危险等级的空间分布**：
- 不是所有空间都应该最高危险等级——低危险的空间（如厨房）的存在让高危险空间（床底、浴室）的恐惧更突出
- 主角在低危险空间时的"相对安全感"，在中后期会被打破

**隐藏线索的空间分布**：
- 每个空间应该承担不同的信息层次
- 建议：早期线索分布在客厅和厨房（主角每天都会去的地方）；核心线索藏在储藏室或主卧衣柜（主角刻意推迟进入的地方）

---

### 常见错误

1. **每个空间的恐惧现象都一样**：都是"突然出现一个人影"——失去空间差异感，读者产生审美疲劳
2. **床底恐惧太快被揭示**：第三章就完整描写了床底有什么——床底最大的恐惧力来自"不知道"
3. **浴室镜子被滥用**：浴室镜子是凶宅流的最强恐惧工具，但如果在第一章就推到最高强度，后续无法升级
4. **空间和厉鬼规则脱节**：厉鬼的活动区域与它的执念无关——应该有一个空间是厉鬼"最常在的地方"，这个空间的设计要与执念核心相关',
  'Haunted rental horror space generation. Core principle: each space is an independent horror unit with its own specific logic. Living room: TV is the classic horror prop — effective not just by turning on, but by what it shows; furniture with inexplicable traces. Bedroom: sleep vulnerability; bed as the primary object; wardrobe and window. Under the bed: sound precedes sight — the decision to look is itself the horror; never fully explain what is there. Bathroom: mirror as the portal — not "something appears" but subtle differences between reflection and reality; physical vulnerability during bathing. Kitchen: knife positions, food states, fire behavior. Storage room: highest information density; the space protagonist delays entering. Corridor: linear space with two ends; protagonist can only see one. Each space should have a dominant sense modality; danger levels should vary; hidden clues distributed across spaces by discovery sequence.',
  (SELECT id FROM novel_creation_method WHERE name = '凶宅灵异租房' LIMIT 1),
  1,
  22,
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
