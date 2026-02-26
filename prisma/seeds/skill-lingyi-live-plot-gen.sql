-- 灵异直播小说剧情生成 Skill
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '灵异直播小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-lingyi-live-plot-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'lingyi-live-plot-gen',
  '灵异直播小说剧情生成：指导AI为灵异直播小说生成各类情节，涵盖单场直播的内部结构、多场直播的连续性设计、五类核心情节模板、直播特有的节奏规律，以及常见剧情陷阱的规避方法，附2-3个具体情节大纲示例',
  'Ghost livestream plot generation: guides AI in generating story plots for ghost livestream novels, covering single-stream internal structure, multi-stream continuity design, five core plot templates, livestream-specific pacing rules, common plot traps to avoid, with 2-3 concrete plot outline examples',
  '## 灵异直播小说剧情生成指南

本指南专注于如何为「灵异直播小说」设计和生成有效的剧情。直播小说的剧情逻辑与传统小说有本质差异——它的基本叙事单位是「一场直播」，而不是「一个事件」。

---

### 一、单场直播的内部结构

每一场直播都是一个独立的小故事弧，同时又是大故事弧的一环。标准的单场直播包含以下阶段：

#### 1.1 开播预热（直播开始 ~ 5分钟内）

这是读者「进入直播间」的缓冲期，功能是：
- 建立本场直播的地点、时间、环境
- 展示主播当前的情绪状态和粉丝关系
- 植入本场的「悬念种子」——一个细节，足够让细心的读者在事后回想起来觉得「早就预示了」

**写法要点**：开播时的弹幕通常是欢迎弹幕（「来了来了」「x号房间报到」），主播状态轻松。这种轻松感要被后来的恐惧对比打破。

**示例种子**：
- 主播调试设备时，摄像头自动对焦了一次，但当时没有触发对焦的物体
- 开播前一分钟，弹幕里有一条用户名全是乱码的账号发了「别来」——主播没注意到
- 凶宅门口的温度计显示比外面低8度，主播哈哈带过

#### 1.2 逐步深入（直播进行中）

主播进入探索，读者随摄像头前进。这一阶段的节奏是「探索-异常-解释（错误的解释）-继续」：

- 主播遇到第一个异常，用理性解释（风吹的、自己多想了）
- 弹幕开始出现预警，但主播听不进去（有人说：「我看到了，你身后！」但主播以为是开玩笑）
- 摄像头捕捉到的比主播描述的更多——这是读者信息量超过主播的关键时刻

**信息分配原则**：
| 谁知道什么 | 内容 |
|-----------|------|
| 摄像头（读者看到） | 全部画面，包括主播身后的阴影、窗帘后的人形 |
| 弹幕知道 | 摄像头捕捉到的异常，因为弹幕观众在盯着屏幕 |
| 主播知道 | 只有正前方、肉眼可见的范围 |

#### 1.3 高潮异常（直播核心事件）

每场直播必须有一个核心异常事件，作为该场的戏剧高潮：
- 物理异常（门自动开关、温度骤降、设备突然断电）
- 视觉异常（摄像头捕捉到人形/脸部/手/不该出现的倒影）
- 行为异常（主播突然发呆、说出不属于自己的话、莫名向某个方向走去）
- 网络异常（直播间断流、弹幕全部消失、打赏系统崩溃）

高潮异常必须与开播预热的「悬念种子」形成呼应——让读者恍然大悟「原来开始就有了」。

**高潮的弹幕节奏**：弹幕数量在高潮时应该激增，但同时要插入几条「沉默」——当异常极度严重时，有几秒钟弹幕完全停止，那比刷屏更恐怖。

#### 1.4 收尾（或无法正常收尾）

收尾有两种模式：

**正常收尾**（前期较多）：
- 主播化解异常，安全下播
- 但结尾要留一个钩子——下场直播的预告，或当场发现一个新的「不对劲」
- 最后一帧：主播关摄像头，但读者看到在镜头关掉之前，画面里有什么一闪而过

**无法正常收尾**（中后期）：
- 直播被迫中断——断电、设备损毁、主播遭遇直接危险
- 中断本身成为悬念——下一场直播之前，读者不知道主播是否安全
- 在某些极端情况下，「直播间没有下播，但主播不见了」

---

### 二、多场直播的连续性设计

单场好看不够，多场直播之间需要维持读者的长期追读动力。

#### 2.1 每场必须埋一个「跨场钩子」

钩子类型：
- **线索钩子**：本场发现的一个物件、一个名字、一句话，将在后续场次中出现（彼时意义完全不同）
- **悬念钩子**：本场结束时留一个未解答的问题（「那个账号突然下线了，它去哪了？」）
- **人物钩子**：本场新出现的角色（不论是真人粉丝、神秘道具商人还是可疑账号），在后续场次中重新出现并扮演更重要角色

#### 2.2 跨场次的「回看彩蛋」机制

「回看彩蛋」是这个类型独有的技巧：在某场直播的某个时间点，正文中出现提示「重看第X场直播的第X分钟」——读者翻回之前的章节，会在当时的弹幕里发现一条被忽略的异常账号发言，或在当时的画面描述里发现一个被一笔带过的细节。

设计要点：
- 彩蛋必须是「明着藏着」——当时读者第一遍是可以读到的，只是没有在意
- 彩蛋不要太多，每5-7场直播放一个最佳
- 彩蛋与「非人观众」线索最搭配：第X场时那个账号说「今晚的月亮不一样」，当时觉得是普通弹幕，现在才明白它说的是某种灵异信号

#### 2.3 连续性的「升级感」设计

每三到四场直播，读者应该能感受到一次「级别升级」：
- 凶宅级别升级（从普通荒宅 → 民国凶宅 → 有命案历史的地点 → S级禁区）
- 鬼怪级别升级（从残影/异响 → 有意识的阴灵 → 会主动干预直播的存在）
- 主播自身的升级（从普通人 → 懂一些民俗知识 → 开始有「感知力」的自我觉醒）
- 粉丝团与主播关系的升级（从流量关系 → 真实情感纽带 → 粉丝团作为集体力量介入剧情）

---

### 三、五类核心情节模板

#### 模板一：「主播不知道但读者和弹幕知道」型

**适用时机**：任何需要制造压迫性悬念的场景

**结构**：
1. 摄像头画面描写揭示异常（角落里的人影、镜子里多出的倒影）
2. 弹幕疯狂预警（3-5条连续的惊呼弹幕）
3. 主播对弹幕做出错误解读（「兄弟们别闹了，这里哪有人」）
4. 主播继续行动，读者眼睁睁看着主播走向危险
5. 高潮：异常到了主播无法回避的程度，才终于「看见」

**关键**：阶段4的「眼睁睁看着」要足够长，足够细节，才能积累出窒息感。

#### 模板二：「打赏道具关键时刻救场」型

**适用时机**：高潮场景，主播陷入真实危险

**结构**：
1. 主播陷入明确危险（被困、被跟随、设备失灵）
2. 主播向弹幕求助（「老铁们，我现在真的不太对，有没有人能帮我？」）
3. 弹幕集体刷礼物（描写礼物特效弹幕大量出现，直播间气氛转变）
4. 道具效果触发（有特定的感官描写——比如桃木剑的热度、符纸的气味）
5. 道具救场，但有代价（主播虚弱、道具损毁、鬼怪暂退而非消除）

**关键**：救场必须有代价，才能避免「打赏=无敌」的问题。

#### 模板三：「弹幕预警被无视」型

**适用时机**：节奏紧绷段，用于积累读者的压迫感

**结构**：
1. 弹幕开始预警，但主播由于戴耳机/嘈杂/情绪激动没有注意到
2. 警告升级（从「后面有东西」→「快跑」→「不要开那扇门」）
3. 主播恰好做出了弹幕最不希望他做的那个动作
4. 后果发生

**关键点**：主播「没有注意到」必须有可信的理由。最常用的理由：直播间声音太多、主播当时在高度专注某件事、主播当时在跟某个粉丝单独讲话。不要写成「主播无视了明显的危险信号」，要写成「主播根本没有机会看到那些弹幕」。

#### 模板四：「非人观众身份揭露」型

**适用时机**：故事三分之一至中期，作为一个重大节点

**结构**：
1. 引子（前几场）：某个账号的行为出现细微异常，但读者不一定会立刻发现
2. 线索积累：弹幕里这个账号说过的几句话被读者重新回想，发现「它怎么知道这个？」
3. 触发机制：当主播进入某个特定地点/遭遇某个特定实体，这个账号突然发出不同寻常的弹幕（格式变化/字符异常/说出只有死者才知道的话）
4. 揭露：通过某种方式确认这个账号不是人（调查账号注册时间和IP、其他观众也注意到、某个道具对着屏幕有反应）
5. 揭露后的新问题：它的目的是什么？

#### 模板五：「直播设备异常/断流」型

**适用时机**：任何需要制造失控感的场景

**五种设备异常的不同叙事效果**：
| 异常类型 | 叙事效果 | 使用场景 |
|---------|---------|---------|
| 摄像头自动对焦 | 被动揭示——有什么东西在摄像头范围内 | 主播还没意识到危险时 |
| 音频消失但画面在 | 突然的寂静恐惧，读者不知道发生了什么 | 高潮前的沉默铺垫 |
| 直播断流再重连 | 时间跳跃恐惧——重连后主播在不同位置 | 中期反转 |
| 弹幕全部消失 | 「所有人都停止发言了」的震撼感 | 极度恐惧场景 |
| 设备完全损毁 | 强制结束当场直播 | 被迫下播节点 |

---

### 四、剧情节奏的「直播特有」规律

#### 4.1 直播的节奏与普通小说的差异

**普通小说节奏**：铺垫 → 冲突 → 高潮 → 解决 → 余波

**直播小说节奏**：开播预热 → 探索/互动 → 异常出现 → 弹幕炸锅 → 主播回应/错误判断 → 异常升级 → 道具介入或强制终止 → 下播/断播 → 下场直播的期待

**关键差异**：
- 直播小说的「悬念」不是「接下来会发生什么」，而是「主播什么时候才会意识到」
- 直播小说的节奏受「弹幕密度」调控——弹幕少=平静期，弹幕密=高潮期，弹幕突然消失=最恐怖时刻
- 直播小说天然有「场次边界」，读者每看完一场直播都有一个自然的停顿点，但好的场次结尾必须让读者无法停下来

#### 4.2 如何在直播语境下制造悬念

**技巧一：双轨叙事**
在同一段文字里，同时推进「读者视角（知道全部）」和「主播视角（信息不完整）」，让读者感到焦虑。

**技巧二：弹幕倒计时**
弹幕提前预告了某件事「你最多还有5分钟」——主播不知道这条弹幕的含义，但读者知道时间在流逝。

**技巧三：镜头即命运**
当摄像头指向某个方向，读者看到了画面里的东西，主播还在朝反方向走——这段距离就是悬念的长度。

**技巧四：弹幕沉默**
在极度紧张的时刻，连弹幕也停了——几百个真实观看的人，集体沉默，比任何文字都有冲击力。

---

### 五、避免剧情陷阱

**陷阱一：打赏道具变成万能金手指**

问题：只要打赏就能解决一切危险，悬念彻底消失。

解决：
- 每件道具必须有使用限制（时机、方法、使用者的体质要求）
- 道具只能「延缓」或「驱散」，不能「消灭」强大鬼怪
- 道具使用有代价（主播的健康、道具本身的损耗、吸引更强的存在）
- 偶尔设计「道具失效」场景——高级鬼怪能屏蔽道具效果

**陷阱二：弹幕只是装饰品**

问题：弹幕出现了但不影响任何事，读者感觉可以跳过弹幕段落。

解决：
- 每一条出现在正文的弹幕都必须有叙事功能（推进、渲染、预示、误导至少选其一）
- 弹幕要推动情节：某条弹幕的信息让主播改变了决定
- 弹幕要构成线索：非人账号的弹幕内容是日后解谜的关键
- 弹幕数量的变化本身就是叙事信号

**陷阱三：每场直播结构雷同**

问题：读者读了三场直播之后，能预测下一场的完整流程，惊奇感消失。

解决：
- 变换核心高潮类型（物理异常/视觉异常/行为异常/网络异常轮流出现）
- 变换主播的应对策略（有时主播逃跑，有时强行继续，有时道具救场）
- 偶尔打破「正常收尾」模式，设计无法正常下播的场次
- 每隔3-4场引入新的叙事元素（新角色、新道具类型、新的非人账号）

---

### 六、具体情节大纲示例

#### 示例一：「教学楼夜探」单场直播

**背景**：主播接到粉丝任务，探索某废弃教学楼，据说学生跳楼事故后一直有异常。

**开播预热**：
- 主播在教学楼外介绍背景，心情轻松，调侃「肯定是谣言」
- 镜头扫过顶楼，摄像头自动对焦了一次——对焦点是顶楼某扇窗，什么都没有
- 弹幕：「主播快看4楼」「那个窗户刚才有人」（主播：「哪有，你们闹呢」）

**逐步深入**：
- 一楼走廊，摄像头捕捉到墙上有几道划痕，像是指甲留下的，往更深处延伸
- 主播好奇跟着划痕走，弹幕开始预警频率升高
- 三楼，教室里有一张椅子和别的方向不同，主播以为是打扫的人随意摆的

**高潮异常**：
- 主播进入顶楼，设备信号突然变差，画面出现雪花
- 摄像头自动对准窗户——画面里，玻璃反射出一个孩子的身影，站在主播身后
- 弹幕全部停止三秒，然后同时刷屏「跑！！！」
- 主播终于感到不对，回头——什么都没有。但脚下有一双小脚印

**收尾**：
- 主播安全下播，但最后关摄像头前，镜头里闪过：那双小脚印在移动
- 钩子：弹幕里某个从开播就在线的账号发了「她找到了」，然后下线

---

#### 示例二：跨三场直播的彩蛋设计

**第X场**：主播探索某凶宅，弹幕里一个ID叫「_0731_」的账号一直在说「不要打开二楼右边第三扇门」。主播没打开（因为那扇门锁了），以为对方只是普通搞气氛的粉丝。

**第X+2场**：主播再次去凶宅，这次进了二楼右边第三扇门（锁匠帮开的）。里面是一个普通储藏室。「_0731_」没有出现。

**第X+5场**：另一凶宅任务，主播在某个房间发现墙上有日期「0731」——是一个死亡案件的日期。主播在直播里读出这个日期，弹幕里突然出现「_0731_」，发了「找到了」，然后永久下线。

**彩蛋回看**：读者重新翻第X场的弹幕记录，发现「_0731_」从那场直播起每场都在线，但从不打赏，从不说其他话，只是在线。这个账号是那栋凶宅里某个死者的账号——死亡日期0731。它一直在关注有没有人找到它死亡的证据。

---

#### 示例三：「道具失效」情节大纲

**设定**：主播在某座废弃寺庙直播，这是已知的S级凶地。粉丝紧张，刷了大量礼物，换来了史上最强道具组合（桃木剑+镇宅符阵+一瓶法师开光的黄符水）。

**高潮前**：道具全部就位，弹幕充满「这下稳了」「有神器在手不怕」。主播也暂时放松，甚至调侃「今天这阵仗，鬼来了也得有去无回」。

**高潮中**：真正的存在出现时，所有道具同时失效——桃木剑开裂，符阵的符纸自燃，黄符水的瓶子碎裂。摄像头对准某个方向，弹幕全部消失。

**关键时刻**：主播已经没有任何防护，极度绝望。但弹幕里突然出现一条——不是来自任何普通账号，而是来自「_0731_」（已在上一场直播后下线的非人账号），只写了三个字：「往左走」。

**主播跟着指引走，脱险。但此后，「_0731_」的意图变得更加复杂——它救了主播，但它真正想要的是什么？**',
  '## Ghost Livestream Novel Plot Generation Guide

This guide focuses on how to design and generate effective plots for "ghost livestream novels." The plot logic of livestream novels is fundamentally different from traditional novels — the basic narrative unit is "one stream session," not "one event."

---

### I. Internal Structure of a Single Stream

Each stream session is an independent mini story arc while also being part of the larger arc. A standard stream session contains the following phases:

#### 1.1 Pre-Stream Warm-Up (First ~5 Minutes)

This is the buffer period for readers to "enter the live room," with the function of:
- Establishing the location, time, and environment of this session
- Showing the streamer''s current emotional state and relationship with fans
- Planting the "suspense seed" for this session — one detail that lets attentive readers, in retrospect, realize it foreshadowed everything

**Writing tip**: Danmaku at stream start is usually welcoming ("here we go," "room X checking in"), and the streamer is relaxed. This relaxed feeling must be shattered by contrast with later terror.

**Example seeds**:
- Camera auto-focuses once during equipment check, but nothing triggered the focus
- One minute before going live, a username-garbled account posts "don''t come" — the streamer doesn''t notice
- The thermometer at the haunted house entrance reads 8 degrees colder than outside; the streamer brushes it off laughing

#### 1.2 Progressive Exploration (Mid-Stream)

The streamer explores, readers advance through the camera. This phase''s rhythm is "explore – anomaly – explanation (wrong explanation) – continue":

- Streamer encounters first anomaly, explains it rationally (wind, imagination)
- Danmaku begins warning, but the streamer dismisses it ("I see it, something''s behind you!" but the streamer thinks they''re joking)
- Camera captures more than the streamer narrates — this is the critical moment where readers know more than the streamer

**Information allocation principle**:
| Who knows what | Content |
|----------------|---------|
| Camera (readers see) | The full frame, including shadows behind the streamer, human shapes behind curtains |
| Danmaku knows | Anomalies captured by the camera, because danmaku viewers are staring at the screen |
| Streamer knows | Only what''s directly in front, within naked-eye range |

#### 1.3 Peak Anomaly (Core Stream Event)

Every stream must have one core anomaly event as the dramatic climax:
- Physical anomaly (doors opening/closing, temperature drop, equipment power-out)
- Visual anomaly (camera captures human shape/face/hand/reflection that shouldn''t be there)
- Behavioral anomaly (streamer suddenly blanks out, speaks in a voice not their own, inexplicably walks toward a specific direction)
- Network anomaly (stream cuts out, all danmaku disappears, donation system crashes)

The peak anomaly must echo the "suspense seed" from the warm-up — making readers suddenly understand "it was there from the beginning."

**Danmaku rhythm at peak**: Danmaku volume should surge at the peak, but a few moments of "silence" must be inserted — when the anomaly is extreme, a few seconds of complete danmaku silence is more terrifying than a flood of messages.

#### 1.4 Closing (or Failure to Close Normally)

Two closing modes:

**Normal closing** (more common in earlier sessions):
- Streamer resolves the anomaly, goes offline safely
- But the ending must leave a hook — preview of next stream, or discovering something new that''s "off"
- Final frame: Streamer turns off camera, but in the moment before the lens closes, something flashes through the frame

**Unable to close normally** (mid-to-late story):
- Stream is forced to cut — power outage, equipment damage, streamer faces direct danger
- The interruption itself becomes suspense — before the next stream, readers don''t know if the streamer is safe
- In extreme cases: "the stream never went offline, but the streamer disappeared"

---

### II. Multi-Stream Continuity Design

A single good session isn''t enough — multiple streams need to sustain long-term readership motivation.

#### 2.1 Every Session Must Plant One "Cross-Session Hook"

Hook types:
- **Clue hook**: An object, name, or phrase discovered in this session that will reappear in a future session (with completely different significance)
- **Mystery hook**: An unanswered question at the session''s end ("that account suddenly went offline — where did it go?")
- **Character hook**: A new figure introduced in this session (real fan, mysterious item merchant, suspicious account) who reappears in a future session with a more important role

#### 2.2 The "Replay Easter Egg" Mechanism

"Replay easter eggs" are a technique unique to this genre: at some point in the story, the narrative prompts "rewatch Stream #X at minute #X" — readers flip back to a previous chapter and find an anomalous account''s comment in the danmaku that was overlooked, or a detail in the scene description that was glossed over.

Design principles:
- Easter eggs must be "hidden in plain sight" — readers could read them the first time, just didn''t register them
- Don''t overuse; one every 5-7 sessions is optimal
- Easter eggs pair best with "non-human audience" storylines: in Stream #X, that account said "tonight''s moon is different" — seemed like a normal comment, but now we understand it was a supernatural signal

#### 2.3 Continuity "Level-Up" Design

Every three to four streams, readers should feel one "level escalation":
- Haunted location level-up (ordinary abandoned house → Republican-era haunted building → crime scene history → S-rank forbidden zone)
- Ghost level-up (residual shadows/sounds → conscious spirit → entity that actively interferes with the stream)
- Streamer''s own level-up (ordinary person → some folk knowledge → awakening of "sensory perception")
- Fan community relationship level-up (transactional viewers → real emotional bond → fan community as a collective force intervening in the plot)

---

### III. Five Core Plot Templates

#### Template One: "Streamer Doesn''t Know But Readers and Danmaku Do"

**Best used**: Any scene requiring suffocating suspense

**Structure**:
1. Camera frame description reveals the anomaly (shadow in corner, extra reflection in mirror)
2. Danmaku erupts in warning (3-5 consecutive alarm comments)
3. Streamer misinterprets the danmaku ("come on guys, there''s nothing here")
4. Streamer continues moving; readers watch helplessly as the streamer heads toward danger
5. Climax: anomaly becomes impossible to ignore; streamer finally "sees"

**Key**: Phase 4 — "watching helplessly" — must be long enough and detailed enough to accumulate that suffocating feeling.

#### Template Two: "Donation Item Saves the Day at the Critical Moment"

**Best used**: Climax scenes, streamer in real danger

**Structure**:
1. Streamer falls into clear danger (trapped, followed, equipment fails)
2. Streamer appeals to danmaku ("guys, something is seriously wrong, can anyone help?")
3. Danmaku floods with gifts (describe the flood of gift-effect notifications, live room atmosphere shifts)
4. Item effect triggers (specific sensory description — heat of the peach wood sword, smell of the talisman paper)
5. Item saves the day, but with a cost (streamer weakened, item damaged, ghost retreats rather than eliminated)

**Key**: Saving must have a cost, to avoid "donation = invincibility."

#### Template Three: "Ignored Danmaku Warning"

**Best used**: High-tension segments, to accumulate reader pressure

**Structure**:
1. Danmaku starts warning, but streamer doesn''t notice due to headphones/noise/emotional state
2. Warnings escalate ("something behind you" → "run" → "don''t open that door")
3. Streamer does exactly the action the danmaku most hoped to prevent
4. Consequences unfold

**Key point**: The streamer "not noticing" must have a credible reason. Most common reasons: too much noise from the live room, streamer was intensely focused on something else, streamer was having a one-on-one conversation with a specific fan. Don''t write it as "streamer ignored obvious danger" — write it as "streamer had no chance to see those comments."

#### Template Four: "Non-Human Viewer Identity Revealed"

**Best used**: Between the first third and the midpoint of the story, as a major node

**Structure**:
1. Foreshadowing (previous sessions): certain account''s behavior shows subtle anomalies readers may not immediately catch
2. Clue accumulation: several things this account has said in danmaku get re-evaluated — "how did it know that?"
3. Trigger: when the streamer enters a specific location or encounters a specific entity, this account suddenly posts unusual danmaku (format change/character anomalies/states something only a dead person would know)
4. Reveal: confirmed non-human through some means (investigate account registration date and IP, other viewers also notice, some item reacts when pointed at the screen)
5. New question after reveal: what is its purpose?

#### Template Five: "Equipment Malfunction / Stream Cutout"

**Best used**: Any scene requiring a loss-of-control feeling

**Five types of equipment malfunction and their narrative effects**:
| Malfunction type | Narrative effect | Use scenario |
|-----------------|-----------------|--------------|
| Camera auto-focuses | Passive reveal — something is within camera range | Before streamer realizes danger |
| Audio disappears but video continues | Sudden silence terror; readers don''t know what''s happening | Silent lead-up before a climax |
| Stream cuts then reconnects | Time-jump terror — after reconnect, streamer is in a different position | Mid-story reversal |
| All danmaku disappears | "Everyone stopped typing simultaneously" shock | Extreme terror scene |
| Equipment fully destroyed | Forces current session to end | Forced offline node |

---

### IV. Pacing Rules Unique to Livestreams

#### 4.1 Livestream Pacing vs. Traditional Novel Pacing

**Traditional novel pacing**: Setup → Conflict → Climax → Resolution → Aftermath

**Livestream novel pacing**: Pre-stream warm-up → Exploration/interaction → Anomaly appears → Danmaku erupts → Streamer responds/wrong judgment → Anomaly escalates → Item intervention or forced termination → End/cut → Anticipation for next session

**Key differences**:
- The "suspense" in livestream novels is not "what happens next" but "when will the streamer finally realize"
- Livestream pacing is regulated by "danmaku density" — sparse danmaku = quiet phase, dense danmaku = climax, sudden danmaku silence = most terrifying moment
- Livestream novels naturally have "session boundaries"; readers have a natural pause after each session, but a good session ending must make it impossible to stop

#### 4.2 How to Create Suspense in a Livestream Context

**Technique 1: Dual-Track Narration**
In the same passage of text, simultaneously advance both "reader perspective (knows everything)" and "streamer perspective (incomplete information)," making readers anxious.

**Technique 2: Danmaku Countdown**
Danmaku predicts something "you have five minutes at most" — the streamer doesn''t understand what this means, but readers know time is running out.

**Technique 3: Camera as Fate**
When the camera points in a certain direction, readers see what''s in frame; the streamer is walking the other way — that distance is the length of the suspense.

**Technique 4: Danmaku Silence**
At an intensely tense moment, even the danmaku stops — hundreds of real viewing people, all silent simultaneously, hits harder than any written description.

---

### V. Avoiding Plot Traps

**Trap One: Donation Items Become Omnipotent Deus Ex Machinas**

Problem: Donations solve all danger, suspense completely disappears.

Solution:
- Every item must have usage restrictions (timing, method, streamer''s physical condition)
- Items can only "delay" or "repel" — they cannot "destroy" powerful ghosts
- Item use has a cost (streamer''s health, item degradation, attracting stronger entities)
- Occasionally design "item failure" scenes — high-level ghosts can block item effects

**Trap Two: Danmaku Is Just Decoration**

Problem: Danmaku appears but affects nothing; readers feel they can skip the danmaku passages.

Solution:
- Every danmaku comment that appears in the main text must have a narrative function (advance, texture, foreshadow, or misdirect — pick at least one)
- Danmaku must drive plot: information in a comment makes the streamer change a decision
- Danmaku must form clues: non-human account comments are key to solving mysteries later
- Changes in danmaku volume are themselves narrative signals

**Trap Three: Every Stream Session Has the Same Structure**

Problem: After three sessions, readers can predict the complete arc of the next one — surprise disappears.

Solution:
- Rotate the core climax type (physical anomaly / visual anomaly / behavioral anomaly / network anomaly in rotation)
- Vary the streamer''s coping strategy (sometimes flee, sometimes push through, sometimes item saves the day)
- Occasionally break the "normal closing" pattern with sessions that can''t end normally
- Every 3-4 sessions, introduce a new narrative element (new character, new item type, new non-human account)

---

### VI. Concrete Plot Outline Examples

#### Example One: "Abandoned Classroom Building Night Exploration" Single Stream

**Setup**: Streamer accepts a fan-requested mission to explore an abandoned school building. Rumored that after a student jumped from the roof, anomalies have continued.

**Pre-stream warm-up**:
- Streamer introduces the background outside the building, relaxed, joking "must be rumors"
- Camera sweeps the top floor; camera auto-focuses once — focus point is a window on the top floor, nothing there
- Danmaku: "look at the 4th floor" / "someone was at that window just now" (Streamer: "where, you''re joking")

**Progressive exploration**:
- First-floor hallway; camera captures scratch marks on the wall, like fingernails, extending deeper in
- Streamer curiously follows the scratches; danmaku warning frequency rises
- Third floor; in a classroom, one chair faces a different direction from all the others; streamer assumes a cleaner moved it randomly

**Peak anomaly**:
- Streamer reaches the top floor; signal suddenly degrades, picture shows snow
- Camera auto-points at the window — in the reflection on the glass, a child''s silhouette stands behind the streamer
- All danmaku stops for three seconds, then simultaneously floods "RUN!!!"
- Streamer finally senses something wrong, turns around — nothing. But there are small footprints on the floor

**Closing**:
- Streamer goes offline safely, but just before turning off the camera, the lens captures: those small footprints are moving
- Hook: An account that has been online since the stream started posts "she found it," then goes offline

---

#### Example Two: Three-Session Cross-Stream Easter Egg Design

**Session X**: Streamer explores a haunted house. An account called "_0731_" keeps saying "don''t open the third door on the right side of the second floor." The streamer doesn''t open it (it''s locked) and assumes this is just a normal mood-setter.

**Session X+2**: Streamer returns to the haunted house; this time enters that second-floor right-side third door (locksmith helped). Inside is an ordinary storage room. "_0731_" doesn''t appear.

**Session X+5**: A different haunted location. Streamer finds a date on the wall — "0731" — the date from a death case. Streamer reads the date aloud on stream. "_0731_" suddenly appears in danmaku, posts "found it," then goes permanently offline.

**Easter egg replay**: Readers flip back through the danmaku record from Session X and discover "_0731_" has been online every session since then, never donating, never saying anything else, just watching. This account belonged to someone who died in that haunted house — death date 0731. It had been waiting for someone to find evidence of its death.

---

#### Example Three: "Item Failure" Plot Outline

**Setup**: Streamer is livestreaming at an abandoned temple — a known S-rank haunted site. Fans are nervous; they flood donations and unlock the most powerful item combination ever (peach wood sword + protective talisman array + a bottle of consecrated yellow talisman water).

**Before climax**: All items are in position. Danmaku is full of "we''re safe now" and "nothing can beat this." Streamer also relaxes, even jokes, "with this setup, whatever comes will be finished."

**Mid-climax**: When the true entity manifests, all items fail simultaneously — the peach wood sword cracks, the talisman array''s papers self-ignite, the bottle of talisman water shatters. Camera points in a specific direction. All danmaku disappears.

**Critical moment**: The streamer has no protection left and is in total despair. But one comment appears in danmaku — not from any ordinary account, but from "_0731_" (the non-human account that went offline after the previous session). It writes three characters: "go left."

**The streamer follows the guidance and escapes. But from this point forward, "_0731_"''s intentions become far more complex — it saved the streamer, but what does it truly want?**',
  (SELECT id FROM novel_creation_method WHERE name = '灵异直播小说' LIMIT 1),
  1,
  97,
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
