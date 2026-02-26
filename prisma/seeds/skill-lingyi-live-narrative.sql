-- 灵异直播小说叙事技法 Skill
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '灵异直播小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-lingyi-live-narrative.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'lingyi-live-narrative',
  '灵异直播小说叙事技法：深度指导具体写作技巧，涵盖三层信息管理、恐惧延迟释放技法（摄像头先行/弹幕预警无效/回放彩蛋）、弹幕节奏与写法规范、直播语言与小说叙事的融合技巧、高潮与平静期的节奏调控，附3个以上好写法vs错误写法对比示例',
  'Ghost livestream narrative techniques: deep guidance on specific writing skills, covering three-layer information management, delayed-horror release techniques (camera-first / ineffective danmaku warnings / replay easter eggs), danmaku rhythm and writing conventions, fusion of livestream language with novel narration, pacing control for climax vs. quiet phases, with 3+ good-vs-bad comparative examples',
  '## 灵异直播小说叙事技法深度指南

本指南专注于灵异直播小说的**具体写作技法**。与其说「要制造恐惧感」，不如告诉你怎么写才能制造恐惧感。

---

### 一、信息层级管理：三层视角的分配与揭示

灵异直播小说的核心叙事结构是**三层信息不对称**。同一个场景，三个层次的视角各自掌握不同信息：

| 视角层 | 掌握信息 | 叙事功能 |
|-------|---------|---------|
| **摄像头（读者视角）** | 最完整——捕捉画面中的一切，包括主播看不到的角落 | 制造「已知」的焦虑 |
| **弹幕观众视角** | 次完整——看着摄像头画面，会比主播提前发现异常，但信息碎片化 | 作为读者的「代言人」，放大焦虑 |
| **主播视角** | 最有限——只有肉眼直接看到的范围，受情绪、角度、注意力限制 | 制造「不知道」的恐惧 |

#### 1.1 三层信息的具体分配原则

**规则一：摄像头优先揭示**
读者通过文字描述摄像头画面，应该在主播「发现」之前就看到异常。这个「时间差」是核心张力来源。

**规则二：弹幕是读者情绪的外化**
当摄像头捕捉到了某件事，弹幕会立刻反应——这种反应是读者自身感受的镜像。弹幕越慌乱，读者的代入感越强。

**规则三：主播的「迟钝」必须有可信理由**
主播没有发现异常，不是因为主播笨，而是因为：
- 主播正在看着另一个方向
- 主播戴着耳机没听到弹幕
- 主播当时正在与某个粉丝互动
- 主播的手持角度决定了摄像头能看到主播看不到的盲区

**规则四：三层信息必须保持一致性**
如果摄像头画面里出现了某样东西，弹幕观众一定会看到并反应——不要让弹幕「选择性失明」。除非有特殊设定（比如非人存在只出现在摄像头里，弹幕观众也看不见）。

#### 1.2 信息揭示的节奏控制

信息的揭示应该是**分层次、有延迟**的：

1. 第一层（最早）：摄像头画面描写里，一个模糊的细节出现（一笔带过）
2. 第二层（稍后）：弹幕开始询问/预警，说明观众注意到了
3. 第三层（再后）：弹幕变成警告，读者已经确定有异常
4. 第四层（最后）：主播终于「看到」，或者异常到了无法忽视的程度

这四层之间的**间距**决定了悬念积累的长度。好的写法会在第一层和第四层之间填满叙事内容，让读者坐立不安。

---

### 二、恐惧的延迟释放技法

「恐惧的延迟释放」是灵异直播小说最核心的美学原则——不要立刻告诉读者有什么，而是让读者看着恐惧一点一点靠近主播，自己比主播先感受到危险。

#### 2.1 「摄像头先行」的具体写法

**结构**：先用一句话描写摄像头画面里的细节，再描写主播的行动和语言——两者之间的信息差制造张力。

**版本对比**：

错误写法（同步揭示，无张力）：
> 李明走进走廊，感觉有些不对劲。他回头，看到了一个人影站在门口。

正确写法（摄像头先行，延迟释放）：
> 李明进了走廊。摄像头扫过他身后——门口，一个人形的阴影贴着门框，没有动。
> 「走廊超级长啊，兄弟们，感觉有点发毛。」他笑着说，继续往里走，背对着门口。
> 【弹幕：别走！！！】
> 【弹幕：主播你身后！！！！！】
> 「怎么了，你们又闹了？」他没有回头。

**关键技法**：
- 摄像头画面的描写使用客观、冷静的语言（「贴着门框」「没有动」），对比主播轻松的口语
- 弹幕的出现时间在「读者已经看到」之后，「主播还没看到」之前
- 主播的反应必须是轻描淡写地略过弹幕，不要让主播完全没有回应（那样不自然），而是「回应了但没有认真对待」

#### 2.2 「弹幕预警无效」的写法：如何让读者窒息而不是愤怒

**核心矛盾**：弹幕在疯狂预警，主播却没有意识到危险——这种写法的风险是：如果写得不好，读者会对主播产生愤怒（「这么明显还不逃！蠢」），而不是恐惧。

**关键：让「无效」有不可抗力的理由**

**版本对比**：

错误写法（让读者愤怒的版本）：
> 【弹幕：后面有鬼！！！】
> 【弹幕：快跑啊！！！】
> 【弹幕：主播你傻的吗看弹幕！！！！】
> 李明继续往里走，没有注意到弹幕。
> （问题：主播明明在直播，摄像头画面里弹幕就在屏幕上，他为什么看不到？）

正确写法（让读者窒息的版本）：
> 【弹幕：等等等等主播看弹幕看弹幕！！！】
> 【弹幕：后面！！！！！！】
> 李明这时候正在把手机架在三脚架上调角度，背对着直播画面。「稍等，我调一下机位，你们刚才那个角度没把走廊拍进去。」他全神贯注地调整角度，声音里是纯粹的技术性专注，完全没有留意弹幕。
> 【弹幕：不要调了！！别调了！！！】
> 架好了。他满意地点头，正打算拿回手机，这时候三脚架上的手机摄像头——对准了李明身后的整面镜子。
> 读者看到了镜子里的东西。李明还没看。他正在低头收三脚架的包。

**这个版本有效的理由**：
- 主播「看不到」弹幕有一个完全合理的物理理由（背对画面在调机位）
- 主播的行为逻辑自洽（他在认真工作，不是无脑人物）
- 「镜子」的设计让摄像头视角先揭示，制造最后一刻的窒息感

#### 2.3 「回放彩蛋」的设置方法

回放彩蛋是指：在某个后续场景中，叙事提示读者去回看之前章节的某个细节，而那个细节在当时看起来毫无意义，现在才明白其中的含义。

**设置回放彩蛋的三个要求**：

**要求一：彩蛋必须真实存在于之前的正文中**
不是在回放时才补写，而是第一遍时就已经写了，只是没有强调。读者重看时会感到一种「原来早就写了，我却没注意到」的发现感。

**要求二：彩蛋在初次阅读时必须「可以忽略」**
彩蛋不能太明显，否则不是彩蛋，而是剧透。初次阅读时，那个细节应该融入背景描写，不突兀。

**要求三：彩蛋与揭示之间的间隔不宜太长**
最多隔5-8个场次（章节），不要把彩蛋埋在全书第一章，揭示在全书最后一章——读者可能已经忘了。

**具体写法示例**：

前期某章（第一次描写）：
> 直播间里，一个叫「月亮999」的账号发了条弹幕：「主播，左边第二个柜子别开。」主播以为是在玩梗，笑着说：「好嘞，不开。」然后继续往前走，经过了那个柜子。

后期某章（揭示彩蛋）：
> 主播翻出了当时那场直播的回放录像，快进到二楼走廊那一段。
> 他暂停在「月亮999」发那条弹幕的那一刻——那是直播开始后的第23分钟。
> 他把时间轴拖回去3分钟，到第20分钟。
> 第20分钟，镜头扫过那个柜子时，柜门缝隙里有一双眼睛。
> 「月亮999」在第23分钟说「别开」。说明它在第20分钟，就已经看到了。
> 主播翻查「月亮999」的账号信息。注册日期：三年前。最后登录时间：今天，凌晨三点。

---

### 三、弹幕写作详细规范

#### 3.1 弹幕节奏控制

弹幕的密度和内容是一种「叙事乐器」——通过控制弹幕，你在控制读者的情绪节奏。

| 弹幕状态 | 适用场景 | 效果 |
|---------|---------|------|
| **低频弹幕**（每段2-3条） | 平静探索期、主播建立信任 | 营造专注感，读者聚焦于环境描写 |
| **高频弹幕**（每段5-8条） | 异常出现初期、轻度紧张 | 放大集体情绪，强化读者的参与感 |
| **刷屏弹幕**（密集相同内容） | 高潮时刻，有重大异常 | 制造集体失控感，用「大家都慌了」放大恐惧 |
| **突然沉默**（弹幕消失） | 最极端的恐惧时刻 | 比刷屏更可怕——沉默意味着所有人都不知道该说什么 |

**关键原则**：弹幕密度的变化应该是一个逐步升级的曲线，不要在平静期就用刷屏弹幕（读者会疲劳，也会破坏紧张感的积累）。

#### 3.2 普通弹幕 vs 非人弹幕的写法区别

**普通观众弹幕的特征**：
- 语言口语化、随意（「牛的」「主播你完了」「直接跑路吧」「真假的」）
- 会用表情符号和重复字（「！！！！！」「？？？？」）
- 内容是直接反应，没有额外信息量（「啊啊啊啊好吓人」）
- 会和其他弹幕互动（有时弹幕之间形成对话）

**非人弹幕的特征**：
- 语言精准，没有废字（不会用口语化表达）
- 知道正常观众不该知道的信息（主播「背后」发生了什么）
- 往往只说一句话，不解释
- 时机诡异（在最关键的时刻出现，之后沉默）
- 格式可能有轻微异常（字符排布，或者某个字重复出现）

**版本对比**：

普通观众弹幕：
> 【弹幕：卧槽主播后面！！！！！】
> 【弹幕：快跑啊哈哈哈哈哈哈主播你是傻的吗】
> 【弹幕：心跳加速了字面意义的那种】

非人弹幕（混在普通弹幕里）：
> 【弹幕：卧槽主播后面！！！！！】
> 【弹幕：快跑啊哈哈哈哈哈哈主播你是傻的吗】
> 【弹幕：它认识你。】
> 【弹幕：心跳加速了字面意义的那种】

「它认识你。」这条弹幕的存在感极其微弱，但读者会定睛看一遍——「什么叫认识你？谁认识他？」然后这条弹幕滚过去了，被后面的弹幕淹没，主播也没有注意到。

**关键**：非人弹幕必须「融入弹幕流中」，不能孤立出现。它就是普通弹幕里的一条，只是稍微「不对」——太平静、知道太多、太精准。

#### 3.3 弹幕如何推进情节（而不是简单评论情节）

弹幕的叙事价值体现在三个层面：

**层面一：弹幕改变主播决策**
某条弹幕提供了关键信息，导致主播改变了行动方向。
> 【弹幕：主播你背包的侧兜有张纸，进门前我看到你把什么东西塞进去了】
> 李明愣了一下，伸手摸背包侧兜——一张符纸。他完全不记得是什么时候放进去的。

**层面二：弹幕构成隐藏线索**
某条弹幕现在看起来无意义，但与后续事件对照后成为关键线索。

**层面三：弹幕的「集体行动」形成情节推力**
粉丝集体刷礼物、集体要求主播做某件事、集体沉默——这些集体行为是这个类型独有的情节推动力。

---

### 四、直播语言与小说叙事的融合

直播语言（口播风格）与小说叙事语言（书面叙述）如果处理不好，会造成风格割裂——要么全是流水账式的「主播说了什么」，要么主播的语言像在背稿，丧失了直播感。

#### 4.1 口播语言的核心特征（必须在文字中体现）

- **碎片化**：主播不会说完整句子，会停顿、省略、改变话题
- **互动性**：频繁提到弹幕内容，回应观众
- **自嘲与调侃**：用轻松的语气掩盖真实的紧张
- **流量意识**：偶尔冒出「这条clip肯定上热门」「在线人数又掉了」的想法
- **肢体感**：直播的语言本来配合肢体动作，在小说里需要用动作描写来「补足」

**版本对比**：

错误写法（主播像在背稿）：
> 李明对着摄像头说：「各位观众朋友，现在我已经进入了这栋大楼的二楼，这里据说曾经发生过一起命案，但我对此持怀疑态度。我们一起来看看这里到底有没有什么异常。」

正确写法（真实的直播口语）：
> 「二楼了啊，兄弟们……」李明扶着楼梯把手，摄像头在他手里轻微晃动，「走廊比我想的长，诶等等，你们看到刚才地板那里有什么吗？我感觉——」他停下来，重新扫了一遍摄像头，「算了，可能是我多想了。继续。」他继续往前走，但脚步比刚才轻了一些。

#### 4.2 「直播感」不是堆砌直播用语

常见错误：作者在文字里大量堆积「老铁」「666」「刷波火箭」「上热门」等词汇，以为这就是「有直播感」。这实际上是反效果——它让小说读起来像直播文字稿的粗糙转录，而不是有文学质感的叙事。

**直播感的真正来源**：
- **主播视角的自我意识**：主播永远有「我在被看着」的意识，这影响他所有的决策（「如果我现在跑，观众怎么看我」）
- **商业逻辑的底层驱动**：主播是在赚钱，危险越大越爽，这个底层动机要始终存在
- **观众关系的真实感**：长期关注的粉丝有名字，有个性，主播认识他们——这种关系不是「老铁」这个词能表达的

---

### 五、节奏调控的具体方法

#### 5.1 直播高潮段的写法

**特征**：
- 弹幕密集，多条并列（但不要超过5条连续）
- 主播语言碎片化，句子变短
- 感官描写具体化（温度、气味、声音细节）
- 动作描写节奏加快（短句、并列句）
- 摄像头视角和主播视角的信息差达到最大

**示例（高潮段落）**：
> 摄像头扫过门缝——门缝里有光。
> 不该有光。这栋楼断电已经十年了。
> 【弹幕：不要开门不要开门不要开门】
> 【弹幕：主播停下来！！！】
> 【弹幕：那个光在动！！！！！！】
> 「……」李明没说话。他站在门口，手已经放在门把手上了。
> 【弹幕：求你别开！！！！！打赏打赏打赏救他！！！！！】
> 门缝里的光，在一点一点变亮。
> 李明的手，在颤抖。
> 他推开了门。

**注意节奏**：短句、并列弹幕、动作与感知交替——制造节奏的紧迫感。

#### 5.2 直播平静期的写法（铺垫/探索/建立信任）

**特征**：
- 弹幕稀疏，以互动为主（不是预警）
- 主播语言放松，句子完整
- 环境描写细致，制造「日常感」（这种「日常」是之后的反差基础）
- 偶尔插入一个微小的「不对劲」——不是异常，是预兆

**示例（平静段落）**：
> 「这里就是三楼走廊，还好，没想到里面挺干净的，可能真的有人定期来打扫。」李明低着头，摄像头跟着他的视线在地板上扫了一遍。
> 【弹幕：等下那是什么小动物吗看到了】
> 「哪儿呢，没看见。」他停下来找了找，「可能是猫，这种地方经常有野猫。」
> 【弹幕：好像是猫】【弹幕：嗯可能是的】
> 「继续走了，三楼没什么特别的，我们直接上四楼。」他转身朝楼梯走去，摄像头顺势扫过走廊尽头的房间。
> 那个房间的门是开着的。
> 只有那一间。

**技巧**：平静期的「不对劲」要用一句话、用客观陈述完成，不要加感叹号，不要有主播的反应（主播没发现），让读者自己去注意到。

---

### 六、好写法 vs 错误写法对比总结

#### 对比一：恐惧揭示的时机

**错误写法**：同步揭示，主播和读者同时发现，没有信息差
> 李明回头，看到镜子里有一张脸。他大叫着跑出房间。

**正确写法**：摄像头先行，读者先看到，主播后发现
> 李明整理背包。摄像头对准了他身后的梳妆镜——镜子里，他的倒影旁边，多了一张脸，眼睛睁得很大，直视摄像头。
> 【弹幕：镜子！！！！！！】【弹幕：主播快看镜子！！！！！！！！！！！！！！！！！！】
> 「哟，镜子还没碎，挺好的。」他站起来，转向梳妆台，「有没有人喜欢收古董的，这面镜子——」
> 他停住了。

#### 对比二：弹幕的叙事功能

**错误写法**：弹幕只是观众情绪的堆砌，没有叙事功能
> 【弹幕：啊啊啊啊太吓人了】
> 【弹幕：主播加油！！！！！！】
> 【弹幕：好怕好怕好怕好怕】
> 【弹幕：完了完了完了】
> 李明继续往前走。

**正确写法**：弹幕承载信息，推进情节
> 【弹幕：主播你有没有注意到你进来之后灯闪了一下】
> 「闪灯？」李明转头看向天花板的日光灯，「这种旧楼电路老化很正常，没事。」
> 【弹幕：不是电路的问题，你进来的那一刻灯闪了，你出去的那一刻灯也会闪】
> 他看了这条弹幕很久。
> 然后他退了一步，靠近门口。
> 灯，闪了一下。

#### 对比三：直播语言的还原

**错误写法**：口播像书面稿，没有真实的直播感
> 李明对观众说：「现在我已经到了地下室，这里非常黑暗，温度也比较低，我感到非常不安。我将继续前进，探索这个空间。」

**正确写法**：碎片化、有自我意识、与弹幕互动
> 「地下室……」李明的声音明显压低了，「……比我想的暗，我手机这个补光灯，嗯，也就那样。」摄像头在一片灰暗里晃动。
> 【弹幕：主播你看在线人数，破万了！！！！】
> 「哦？」他眼神扫了一下屏幕，「破万了，好，那行，不能让大家失望。」他往里走了一步，停顿，「……虽然我自己有点想跑，但是——钱嘛。」
> 【弹幕：哈哈哈哈哈哈为了钱】【弹幕：真实】
> 他笑了一声，继续往里走，笑声里有一丝实实在在的不稳。',
  '## Deep Guide to Ghost Livestream Novel Narrative Techniques

This guide focuses on the **specific writing techniques** of ghost livestream novels. Rather than saying "create a sense of fear," it tells you exactly how to write to create that fear.

---

### I. Information Layer Management: Three-Layer Perspective Distribution and Revelation

The core narrative structure of ghost livestream novels is **three-layer information asymmetry**. In the same scene, three layers of perspective each hold different information:

| Perspective Layer | Information Held | Narrative Function |
|------------------|-----------------|-------------------|
| **Camera (Reader POV)** | Most complete — captures everything in frame, including corners the streamer can''t see | Creates "known" anxiety |
| **Danmaku Viewer POV** | Second-most complete — watching the camera feed, spots anomalies before the streamer, but info is fragmented | Acts as reader''s "proxy," amplifying anxiety |
| **Streamer POV** | Most limited — only what''s directly visible to the naked eye, constrained by emotion, angle, and attention | Creates the fear of "not knowing" |

#### 1.1 Principles for Distributing Three-Layer Information

**Rule 1: Camera reveals first**
Readers, through the text describing what the camera captures, should see the anomaly before the streamer "discovers" it. This "time gap" is the core source of tension.

**Rule 2: Danmaku externalizes reader emotion**
When the camera captures something, danmaku reacts immediately — this reaction mirrors the reader''s own feelings. The more panicked the danmaku, the stronger the reader''s immersion.

**Rule 3: The streamer''s "obliviousness" must have a credible reason**
The streamer not noticing the anomaly isn''t because they''re foolish, but because:
- The streamer is looking in a different direction
- The streamer has headphones on and can''t hear the danmaku
- The streamer is interacting with a specific fan
- The camera''s handheld angle creates a blind spot the streamer can''t see

**Rule 4: Three-layer information must remain consistent**
If something appears in the camera frame, danmaku viewers will see it and react — don''t give danmaku "selective blindness." Unless there''s a special setting (e.g., supernatural entities only appear in the camera feed, invisible even to danmaku viewers).

---

### II. Delayed Horror Release Techniques

"Delayed horror release" is the core aesthetic principle of ghost livestream novels — don''t immediately tell readers what''s there. Instead, let readers watch the horror inch closer to the streamer, feeling the danger before the streamer does.

#### 2.1 "Camera-First" Writing: Concrete Method

**Structure**: First describe the camera frame detail in one sentence, then describe the streamer''s action and speech — the information gap between the two creates tension.

**Comparison**:

Wrong (synchronized reveal, no tension):
> Li Ming walked into the hallway and felt something was off. He turned around and saw a human shadow standing in the doorway.

Right (camera-first, delayed release):
> Li Ming entered the hallway. The camera swept behind him — in the doorway, a human-shaped shadow pressed against the door frame, not moving.
> "This hallway is super long, guys… gives me the creeps," he said with a laugh, continuing deeper, his back to the doorway.
> [Danmaku: DON''T WALK AWAY!!!]
> [Danmaku: STREAMER SOMETHING''S BEHIND YOU!!!!!!]
> "What, you guys are messing with me again?" He didn''t turn around.

**Key techniques**:
- Camera frame descriptions use objective, calm language ("pressed against the door frame," "not moving"), contrasting with the streamer''s casual spoken language
- Danmaku appears after "readers have already seen it" but before "the streamer has noticed"
- The streamer''s response must be a casual dismissal — not completely ignoring danmaku (that''s unnatural), but "responding without taking it seriously"

#### 2.2 "Ineffective Danmaku Warning" Writing: Making Readers Suffocate, Not Rage

**Core tension**: Danmaku is screaming warnings, but the streamer doesn''t realize the danger. The risk: if written poorly, readers feel angry at the streamer ("it''s so obvious, why aren''t you running? Idiot") rather than afraid.

**Key: Give the "ineffectiveness" a force-majeure reason**

**Comparison**:

Wrong (version that makes readers angry):
> [Danmaku: There''s a ghost behind you!!!]
> [Danmaku: RUN!!!]
> [Danmaku: Are you blind?! Check the danmaku!!!!]
> Li Ming kept walking, not noticing the danmaku.
> (Problem: He''s livestreaming — the danmaku is right on screen. Why can''t he see it?)

Right (version that makes readers suffocate):
> [Danmaku: WAIT wait wait streamer check the danmaku check the danmaku!!!]
> [Danmaku: BEHIND YOU!!!!!!!!]
> Li Ming was propping his phone on a tripod, adjusting the angle, his back to the live feed. "Hang on, let me adjust the shot — you couldn''t see the whole hallway from that angle." His voice carried pure technical focus, completely ignoring the danmaku.
> [Danmaku: Don''t adjust!! STOP adjusting!!!]
> Done. He nodded, satisfied, and reached for the phone — at that moment, the camera on the tripod pointed squarely at the full-length mirror behind Li Ming.
> Readers see what''s in the mirror. Li Ming hasn''t looked yet. He''s bending down to pack away the tripod bag.

**Why this version works**:
- There''s a completely logical physical reason the streamer "can''t see" danmaku (back turned, adjusting equipment)
- The streamer''s behavior is internally consistent (working carefully, not a brainless character)
- The "mirror" design lets the camera perspective reveal first, creating last-moment suffocation

#### 2.3 Setting Up "Replay Easter Eggs"

Replay easter eggs mean: in a later scene, the narration prompts readers to look back at a detail in an earlier chapter. That detail seemed meaningless at the time; only now its significance becomes clear.

**Three requirements for replay easter eggs**:

**Requirement 1: The easter egg must genuinely exist in the earlier text**
Don''t write it during the callback — it must have been written the first time through, just not emphasized. Readers re-reading will feel the discovery of "it was there all along, I just missed it."

**Requirement 2: Easter eggs must be "ignorable" on first read**
They can''t be too obvious, or they become spoilers rather than easter eggs. On first read, the detail should blend into background description without standing out.

**Requirement 3: Don''t place the egg and reveal too far apart**
Maximum 5-8 sessions (chapters) apart. Don''t bury an egg in the very first chapter and reveal it in the final chapter — readers will have forgotten.

**Concrete example**:

Earlier chapter (first appearance):
> In the live room, an account called "Moon999" posted: "Streamer, don''t open the second cabinet on the left." The streamer thought it was a gag and laughed: "Got it, not opening it." He continued forward, passing the cabinet.

Later chapter (egg reveal):
> The streamer pulled up the replay recording from that session, fast-forwarding to the second-floor hallway segment.
> He paused at the moment "Moon999" sent that comment — 23 minutes into the stream.
> He dragged the timeline back 3 minutes, to the 20-minute mark.
> At 20 minutes, when the camera swept past that cabinet, through the gap in the door: a pair of eyes. Staring.
> "Moon999" said "don''t open it" at minute 23. Meaning it already saw — at minute 20.
> The streamer looked up "Moon999"''s account. Registration date: three years ago. Last login: today, 3 a.m.

---

### III. Danmaku Writing Detailed Specifications

#### 3.1 Danmaku Rhythm Control

Danmaku density and content is a "narrative instrument" — by controlling danmaku, you control the reader''s emotional rhythm.

| Danmaku State | Applicable Scenario | Effect |
|--------------|---------------------|--------|
| **Low frequency** (2-3 per passage) | Quiet exploration, streamer building trust | Creates focus; readers concentrate on environment description |
| **High frequency** (5-8 per passage) | Early anomaly appearance, mild tension | Amplifies collective emotion, strengthens reader participation |
| **Flood danmaku** (dense same content) | Climax moments, major anomaly | Creates collective loss-of-control feeling; "everyone panicked" amplifies fear |
| **Sudden silence** (danmaku disappears) | Most extreme horror moments | More terrifying than flooding — silence means everyone is speechless |

**Key principle**: Danmaku density changes should be a gradual escalation curve. Don''t use flood danmaku during quiet periods — readers fatigue, and it destroys the buildup of tension.

#### 3.2 Normal Danmaku vs. Non-Human Danmaku

**Normal viewer danmaku characteristics**:
- Colloquial, casual language ("wild," "you''re done for," "just run," "seriously?")
- Uses emoji and repeated characters ("!!!!!!" "?????")
- Content is direct reaction, no additional information ("ahhhh so scary")
- Sometimes forms dialogues between danmaku comments

**Non-human danmaku characteristics**:
- Language is precise, no filler words (no colloquial expressions)
- Knows information a normal viewer shouldn''t know (what''s happening "behind" the streamer)
- Usually just one sentence, no explanation
- Timing is eerie (appears at the most critical moment, then silence)
- Format may have minor anomalies (character arrangement, or a specific character repeated)

**Comparison**:

Normal viewer danmaku:
> [Danmaku: WHAT streamer it''s RIGHT BEHIND YOU!!!!!]
> [Danmaku: RUN already omg are you serious streamer]
> [Danmaku: my heart is literally pounding like physically]

Non-human danmaku (mixed in with normal ones):
> [Danmaku: WHAT streamer it''s RIGHT BEHIND YOU!!!!!]
> [Danmaku: RUN already omg are you serious streamer]
> [Danmaku: It knows you.]
> [Danmaku: my heart is literally pounding like physically]

"It knows you." — This comment has an extremely low profile, but readers will stop and re-read it. "What does ''knows you'' mean? Who knows him?" Then it scrolls past, buried by the next wave of comments, and the streamer doesn''t notice.

**Key**: Non-human danmaku must "blend into the danmaku stream" — it''s just one comment among many, only slightly "off": too calm, knows too much, too precise.

#### 3.3 How Danmaku Advances Plot (Rather Than Simply Commenting)

Danmaku''s narrative value operates on three levels:

**Level 1: Danmaku changes the streamer''s decision**
A comment provides critical information that causes the streamer to change direction.
> [Danmaku: Streamer you have a piece of paper in your bag''s side pocket — I saw you stuff something in before you went through the door]
> Li Ming froze, reached for his bag''s side pocket — a talisman paper. He had absolutely no memory of putting it there.

**Level 2: Danmaku forms hidden clues**
A comment seems meaningless now but becomes a critical clue when compared against later events.

**Level 3: Danmaku "collective action" creates plot momentum**
Fans collectively flooding gifts, collectively demanding the streamer do something, collectively falling silent — these collective behaviors are unique to this genre''s storytelling engine.

---

### IV. Fusion of Livestream Language with Novel Narration

Livestream language (commentary style) and novel narration language (literary prose) can create a stylistic rupture if not handled well — either everything becomes a transcript-like "the streamer said this," or the streamer''s language sounds scripted, losing all sense of livestream authenticity.

#### 4.1 Core Characteristics of Commentary Language (Must Be Reflected in Text)

- **Fragmented**: Streamers don''t speak in complete sentences — they pause, omit, change topics
- **Interactive**: Frequently references danmaku content, responds to viewers
- **Self-deprecating and joking**: Uses casual tone to mask genuine tension
- **Traffic awareness**: Occasional thoughts like "this clip is going viral" or "viewer count dropped again"
- **Physical complement**: Livestream language originally accompanies physical movement — in novels, action description must "fill in" what''s missing

**Comparison**:

Wrong (streamer sounds scripted):
> Li Ming said to the camera: "Viewers, I have now entered the second floor of this building. It is rumored that a homicide occurred here, though I am skeptical of this claim. Let us together examine whether there are any anomalies here."

Right (authentic livestream spoken language):
> "Second floor now, guys…" Li Ming gripped the stair railing, the camera in his hand wavering slightly. "Hallway is longer than I expected. Hey wait, did you guys see something on the floor just now? I thought I—" He stopped, swept the camera back over the area. "Nah, probably imagining things. Let''s go." He kept walking, but his steps were quieter than before.

#### 4.2 "Livestream Feel" Is Not About Piling Up Livestream Slang

Common mistake: writers stuff the text with "bro," "666," "rocket incoming," "going viral" and similar terms, thinking this equals "livestream feel." This is actually counterproductive — it makes the novel read like a rough transcript of a livestream, not literary narration.

**Where livestream feel actually comes from**:
- **Streamer''s self-awareness of being watched**: The streamer is always conscious of "I''m being observed," which affects every decision ("if I run now, what will viewers think")
- **Commercial logic as underlying driver**: The streamer is making money; more danger = more viral, this baseline motivation must always be present
- **Authentic fan relationships**: Long-term followers have names and personalities; the streamer knows them — this relationship can''t be captured by a single word like "bro"

---

### V. Specific Pacing Control Methods

#### 5.1 Writing a Livestream Climax Segment

**Characteristics**:
- Dense danmaku, multiple lines in parallel (no more than 5 consecutive)
- Streamer''s language becomes fragmented, sentences shorten
- Sensory description becomes specific (temperature, smell, sound details)
- Action description rhythm accelerates (short sentences, parallel structures)
- Information gap between camera and streamer POV reaches maximum

**Example (climax passage)**:
> Camera swept the door crack — light inside the door crack.
> There shouldn''t be light. This building lost power ten years ago.
> [Danmaku: don''t open the door don''t open the door don''t open the door]
> [Danmaku: STREAMER STOP!!!!!]
> [Danmaku: that light is MOVING!!!!!!!!!]
> "..." Li Ming said nothing. He stood in the doorway, his hand already on the door handle.
> [Danmaku: please don''t!!!!! donations donations donations save him!!!!!]
> The light inside the door crack was getting brighter, bit by bit.
> Li Ming''s hand was trembling.
> He pushed the door open.

**Note the rhythm**: Short sentences, parallel danmaku, alternating action and perception — creating temporal urgency.

#### 5.2 Writing a Quiet Phase (Setup/Exploration/Trust-Building)

**Characteristics**:
- Sparse danmaku, mostly interactive (not warning)
- Streamer''s language is relaxed, sentences complete
- Detailed environment description, creating "ordinariness" (this "ordinariness" is the foundation for later contrast)
- Occasionally insert one tiny "wrongness" — not an anomaly, but a portent

**Example (quiet passage)**:
> "This is the third-floor hallway, actually not bad — didn''t expect it to be this clean, someone must come to sweep regularly." Li Ming looked down, the camera following his gaze across the floor.
> [Danmaku: wait was that a small animal I saw something]
> "Where? I don''t see anything." He stopped to look around. "Probably a cat, places like this always have strays."
> [Danmaku: I think it was a cat] [Danmaku: yeah probably]
> "Alright, nothing special on three, let''s head up to four." He turned toward the stairs; the camera naturally swept the hallway''s far end.
> That room''s door was open.
> Only that one.

**Technique**: In quiet phases, a "wrongness" should be completed in one sentence, in objective statement form, no exclamation marks, no streamer reaction (the streamer didn''t notice). Let readers catch it themselves.

---

### VI. Good vs. Wrong Writing Comparison Summary

#### Comparison 1: Timing of Horror Revelation

**Wrong**: Synchronized reveal — streamer and reader discover simultaneously, no information gap
> Li Ming turned around and saw a face in the mirror. He screamed and ran out of the room.

**Right**: Camera-first — readers see it first, streamer discovers later
> Li Ming packed up his bag. The camera pointed at the vanity mirror behind him — in the reflection, next to his image, an extra face: eyes wide open, staring directly at the camera.
> [Danmaku: THE MIRROR!!!!!!!!!] [Danmaku: LOOK AT THE MIRROR STREAMER!!!!!!!!!!!!!!!!!!!!!!!!!!]
> "Hey, mirror''s still in one piece, nice." He stood up, turned toward the vanity. "Anyone here collect antiques? This mirror—"
> He stopped.

#### Comparison 2: Danmaku''s Narrative Function

**Wrong**: Danmaku is just emotional piling with no narrative function
> [Danmaku: ahhhhh so scary]
> [Danmaku: go go go you got this!!!!!!!!]
> [Danmaku: scared scared scared scared]
> [Danmaku: we''re done we''re so done]
> Li Ming kept walking.

**Right**: Danmaku carries information and advances plot
> [Danmaku: streamer did you notice the light flickered when you walked in]
> "Flickered?" Li Ming looked up at the fluorescent light on the ceiling. "Old building, old wiring, totally normal."
> [Danmaku: it''s not the wiring — the light flickered when you walked IN, it''ll flicker again when you walk OUT]
> He stared at that comment for a long time.
> Then he took one step back, closer to the doorway.
> The light flickered once.

#### Comparison 3: Restoring Livestream Language

**Wrong**: Commentary sounds scripted, no real livestream feel
> Li Ming said to his audience: "I have now arrived in the basement. It is very dark here and the temperature is low. I feel quite uneasy. I will continue to advance and explore this space."

**Right**: Fragmented, self-aware, interacting with danmaku
> "Basement..." Li Ming''s voice dropped noticeably. "...darker than I thought. This phone LED, uh, it''s fine I guess." The camera wobbled in the gray dark.
> [Danmaku: streamer check the viewer count, over ten thousand!!!!!]
> "Oh?" He glanced at the screen. "Ten thousand, okay. All right — can''t disappoint everyone." He took one step in. Paused. "...Though I personally kind of want to run, but — money, right."
> [Danmaku: hahahahaha for the money] [Danmaku: real]
> He laughed once, continued in, and the laugh had a trace of genuine unsteadiness.',
  (SELECT id FROM novel_creation_method WHERE name = '灵异直播小说' LIMIT 1),
  1,
  98,
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
