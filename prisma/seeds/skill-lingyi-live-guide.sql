-- 灵异直播小说创作指南 Skill
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '灵异直播小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-lingyi-live-guide.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'lingyi-live-guide',
  '灵异直播小说创作指南：涵盖直播流灵异类型特征、镜头感叙事美学、弹幕互动设计、打赏道具系统、直播间鬼魂的特殊处理、五幕惊悚递进结构，以及常见写法陷阱规避',
  'Ghost livestream novel guide: covers genre characteristics of the supernatural livestream subgenre, camera-perspective narrative aesthetics, danmaku interaction design, donation-to-exorcism systems, special handling of ghosts in the live audience, five-act horror escalation structure, and common pitfall avoidance',
  '## 灵异直播小说创作指南

本指南专为「灵异直播小说」方法设计。该类型的核心是：**现代自媒体文化与中式民间灵异的深度融合**——主播的摄像头是最真实也最危险的「第三只眼」，弹幕区是故事最不可控的变量，观众的打赏可能是救命稻草，也可能是引狼入室。

---

### 一、类型特征与核心美学

#### 1.1 什么是灵异直播小说

灵异直播小说是在中式民间灵异基础上叠加现代自媒体语境的亚类型。它不同于传统灵异小说的关键在于：

| 核心要素 | 说明 |
|---------|------|
| **镜头视角** | 摄像头是故事的「第三视角」——它比主播更诚实，会捕捉主播肉眼未察觉的异常 |
| **弹幕互动** | 观众是活跃的叙事参与者——他们的弹幕预警、建议、追问构成推动故事的外部力量 |
| **打赏经济** | 金钱与灵异的交换——打赏兑换驱邪道具，形成「氪金救命」的独特张力 |
| **直播间的不确定性** | 观众身份存疑——弹幕里有几个账号从第一集就在线，它们是真的人吗？ |
| **流量逻辑的压力** | 主播在灵异和流量之间的两难——越危险越火，越火越危险 |

#### 1.2 灵异直播 vs 传统灵异小说

| 对比维度 | 灵异直播小说 | 传统民间灵异 |
|---------|------------|------------|
| 叙事媒介感 | 有强烈的「屏幕」意识 | 纯文学叙事 |
| 信息不对称 | 多重：读者/弹幕/主播各知道不同信息 | 通常主角视角单一 |
| 节奏单位 | 按「直播场次」推进 | 按事件推进 |
| 恐惧来源 | 「有人看到了但主播不知道」的绝望感 | 主角直接遭遇的恐惧 |
| 商业逻辑 | 危险与收益挂钩，自我驱动深入险地 | 通常被迫卷入 |
| 观众角色 | 叙事内的参与者（弹幕）| 叙事外的读者 |

#### 1.3 读者核心期待

- **信息不对称的窒息感**：摄像头里已经出现了，弹幕在疯狂刷「后面有东西！！！」，但主播戴着耳机听不到，还在侃侃而谈——这种「眼睁睁看着主播走向危险」的绝望感是核心爽点
- **打赏道具关键时刻救场**：粉丝刷了大量打赏，换来了某件道具，在最后一秒发挥作用——「钱能买命」的爽感
- **弹幕里有非人存在**：某个账号从第一场就在线，知道太多不该知道的事，直到某集才被识破——这个reveal是极致的细思恐极
- **直播间的真实感**：读者在阅读时感觉自己「就在直播间里」，是那个打弹幕的观众，而不是局外人

---

### 二、镜头感叙事美学

#### 2.1 什么是镜头感写法

镜头感不是简单地加入「主播拿着摄像头」的描述，而是一种叙事视角的转换：

**普通写法**：
> 李明走进二楼走廊，感觉空气很冷。窗户旁边有什么东西在动。

**镜头感写法**：
> 【弹幕：妈妈我怕了】
> 【弹幕：主播快看窗户边！！！】
> 【弹幕：别走进去别走进去】
> 李明举着手机走进走廊，摄像头扫过右侧——画面里，窗帘后一个人影一闪而过。
> "这里好冷啊，兄弟们，你们能看到什么吗？感觉有点渗？"
> 【弹幕：看到了看到了！！！回放！！！】
> 他没有停下来。继续往里走。

镜头感写法的核心是**三个视角层的错位**：
- **摄像头视角**：最诚实，捕捉一切，包括主播看不到的
- **主播视角**：受限于肉眼、角度、情绪
- **弹幕视角**：最慌乱，信息碎片化，但有时候比主播更接近真相

#### 2.2 镜头感的具体技法

**技法一：画面构图描写**
不是描写「房间里有什么」，而是描写「镜头里看到了什么」：
- 「摄像头扫过去，左下角有一双脚」（读者先看到）
- 「镜头抖动了一下，画面闪了三帧，定格后背景多了一个人形」

**技法二：信号故障叙事**
用设备故障制造恐惧：
- 「直播间突然断流，重连后画面里……」
- 「摄像头自动对焦了。没有风，但它对准了角落」
- 「弹幕速度突然降到零——不是网络卡顿，是所有人同时停止打字了」

**技法三：回放揭秘**
当场没发现，事后回放才发现：
- 这是比实时恐惧更持久的恐怖
- 适合在章节结尾放一个「重看第X场直播第X分钟」的彩蛋
- 读者会回去翻前面的章节，制造二次恐怖

#### 2.3 弹幕的写作规则

弹幕是这个类型最独特的叙事工具，但必须遵守以下规则：

1. **弹幕不能太密**：一段里最多 3-5 条弹幕，否则影响叙事节奏
2. **弹幕要有层次**：普通观众的弹幕 vs 「异常账号」的弹幕——区别在于：异常账号说的话「知道太多」
3. **弹幕是第二叙事线**：聪明的读者会注意到弹幕区的变化——某些账号的上线时间、某些弹幕的内容……
4. **弹幕格式统一**：`【弹幕：内容】` 或类似的统一格式，与正文叙事有视觉区分

---

### 三、打赏道具系统设计

#### 3.1 核心设计原则

打赏换道具是这个类型的「金手指」系统，但必须有以下约束才好看：

- **道具有使用门槛**：不是打赏就能用，需要正确时机和方法
- **道具有副作用**：「阳气符」用了之后主播会虚弱；「鬼眼镜」戴上去能看到鬼，但也意味着鬼也能清晰地看到你
- **打赏金额有梯度**：小打赏（香烛、盐包）vs 大打赏（桃木剑、镇宅符咒）vs 超级大打赏（专业法师联系方式）
- **道具会消耗或损坏**：一次性道具让每次使用都值得记录

#### 3.2 打赏系统的叙事价值

打赏系统不只是设定，而是叙事工具：
- **观众与主播的情感纽带**：「老铁们救我」——粉丝拼命刷礼物的场景本身就是高潮
- **戏剧性时机**：打赏来了但道具还没到，或道具到了但已经太迟
- **道德困境**：主播明知道危险，但流量太好放不下，观众疯狂打赏让他更不能停
- **鬼怪的精明**：更高级的鬼怪会破坏设备、干扰网络，让打赏道具来不及发挥作用

---

### 四、直播间鬼魂的特殊处理

#### 4.1 「非人观众」的类型

直播间鬼魂是这个类型的独特设定，分为几种形态：

**长期潜伏型**：从第一集就在线，长期关注，知道太多信息，偶尔用弹幕「提示」或「警告」，但不是出于好意——它在看热闹，或者在引导主播走向它想要的地方。

**临时型（随场地出现）**：主播去哪个凶宅，哪个凶宅的鬼就「进入」直播间。它不会说话，只是在线，但它的在线会影响直播——信号变差、弹幕异常刷屏、礼物无法发送。

**被「直播」引来的型**：直播热度越高，聚集的非人越多。观看量是一种「气场」，吸引了不该吸引的存在。

#### 4.2 识别非人观众的写作手法

- **账号特征**：ID是乱码或某个特定的字符组合；注册时间是某个特殊日期；头像是一片黑或某种奇怪的图案
- **弹幕内容异常**：知道主播「背后」发生的事；说出只有死者才知道的信息；弹幕内容对其他观众显示不同
- **行为模式**：从不打赏但永远在线；准时在某个时间出现；当主播靠近某个禁区时，它的弹幕变得频繁

#### 4.3 reveal 的时机

非人观众的身份揭露是这个类型的顶级高潮之一。建议：
- **不要太早**：至少在故事三分之一之后
- **由读者先发现**：通过上述细节让细心的读者先怀疑，然后正式confirm
- **揭露后要有后续**：它为什么要看直播？它的目的是什么？揭露只是开始

---

### 五、五幕惊悚递进结构

直播灵异小说适合按「直播场次」构建五幕结构：

**第一幕：入场（开播预热）**
- 主播设定建立，账号现状介绍
- 第一个「小凶宅」——入门级灵异，观众规模小
- 结尾埋一个无法用普通方法解释的异常，正式确认「这个世界有真鬼」
- 任务：让读者相信这个世界，建立期待

**第二幕：破圈（第一次爆款）**
- 某次探险发生意外，主播遭遇真正的危险
- 通过险境出名，粉丝数暴涨
- 第一次发现「弹幕里有不对劲的账号」
- 任务：建立流量逻辑，引入「非人观众」线索

**第三幕：深水区（越陷越深）**
- 主播开始接「高难度任务」，进入S级凶地
- 核心矛盾显现：主播的「背景秘密」开始与正在发生的灵异产生关联
- 首次出现「不用打赏道具可能当场死亡」的极端情境
- 任务：揭示更大的阴谋或宿命

**第四幕：反转（最危险的直播）**
- 某一场直播中，多线爆发：非人观众身份揭露 + 主播背景秘密曝光 + 最强鬼怪登场
- 打赏道具在最危急时刻救场，或者关键时刻失效制造绝望
- 主播明白自己不是「主动选择做直播的」，而是被某种力量「选中的」
- 任务：完成最大反转，进入最终对决

**第五幕：终局（最后一播）**
- 主播决定用最后一次直播解决所有问题
- 观众（包括非人观众）都在线，见证结局
- 结局可以是战胜、牺牲、或达成某种「交易」——避免大团圆
- 任务：给出情感和逻辑上都令人信服的结局

---

### 六、常见写法陷阱

**陷阱一：弹幕写得太像聊天记录**
弹幕应该是叙事工具，不是打字记录。每一条出现在正文的弹幕都应该有叙事功能——推进、渲染、预示、误导。

**陷阱二：道具变成「万能金手指」**
每个道具必须有使用限制和副作用。如果打赏就能解决一切，悬念消失。

**陷阱三：忘记主播的「工作属性」**
主播的视角要始终有「我在赚钱」「这条视频会不会火」「粉丝怎么看」的商业考量——这种「俗气」才是这个类型与传统灵异的本质区别，也是最真实的恐惧来源（为了流量进入本不该去的地方）。

**陷阱四：非人观众揭露太早/太晚**
太早：神秘感消失，后续无法维持张力
太晚：读者可能已经不在乎了

**陷阱五：摄像头视角变成噱头**
镜头感不是「偶尔描述一下摄像头」，而是一以贯之的叙事视角。若仅在恐怖场景时才「突然」切入摄像头视角，反而会让读者出戏。

**陷阱六：鬼怪太早全貌现身**
鬼怪的力量在于「不确定」。直到故事后半段之前，鬼怪应该只出现在摄像头画面的边角、反光镜中、设备异常里——从不正面出现。',
  '## Ghost Livestream Novel Creation Guide

This guide is designed for the "Ghost Livestream Novel" creation method. The core of this genre is: **the deep fusion of modern streaming culture with Chinese folk supernatural horror** — the livestreamer''s camera is the most honest and most dangerous "third eye," the comment/danmaku section is the most uncontrollable variable in the story, and viewer donations may be a lifeline or an invitation to disaster.

---

### I. Genre Characteristics and Core Aesthetics

#### 1.1 What Is a Ghost Livestream Novel

Ghost livestream novels are a subgenre that layers modern streaming culture onto Chinese folk horror. What distinguishes it from traditional horror novels:

| Core Element | Description |
|-------------|-------------|
| **Camera Perspective** | The camera is the story''s "third viewpoint" — more honest than the streamer, capturing anomalies the naked eye misses |
| **Danmaku Interaction** | Viewers are active narrative participants — their warnings, suggestions, and questions are external forces that drive the story |
| **Donation Economy** | The exchange of money for supernatural protection — donations unlock exorcism items, creating a unique "pay-to-survive" tension |
| **Audience Identity Uncertainty** | Viewer identities are suspect — some accounts have been online since episode one, but are they really human? |
| **Traffic Logic Pressure** | The streamer''s dilemma between danger and views — the more dangerous, the more viral; the more viral, the more dangerous |

---

### II. Camera-Perspective Narrative Aesthetics

The camera perspective is not simply adding descriptions of "the streamer holding a camera" — it''s a shift in narrative viewpoint that creates three layers of perspective:

- **Camera Layer**: Most honest, captures everything including what the streamer cannot see
- **Streamer Layer**: Limited by the naked eye, angle, and emotional state
- **Danmaku Layer**: Most chaotic, information fragmented, but sometimes closer to the truth than the streamer

**Key techniques**: Framing description, signal failure narrative, post-stream replay reveals

---

### III. Five-Act Horror Escalation Structure

Structured around "livestream sessions":

1. **Act One (Opening Stream)**: Establish streamer, first minor haunting, confirm supernatural exists
2. **Act Two (Going Viral)**: First true danger, explosion in viewers, plant non-human audience seeds
3. **Act Three (Deep Water)**: S-rank haunted locations, streamer''s background secret connects to current haunting
4. **Act Four (Reversal)**: Multiple lines explode — non-human audience revealed, background secret exposed, strongest ghost appears
5. **Act Five (Final Stream)**: Streamer uses final stream to resolve everything; audience witnesses the ending',
  (SELECT id FROM novel_creation_method WHERE name = '灵异直播小说' LIMIT 1),
  1,
  90,
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
