-- 凶宅灵异租房叙事写作技能（Layer 3）
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-xiongzhai-narrative.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xiongzhai-narrative',
  '凶宅灵异租房叙事写作专项指导：正文写作层面的语言风格、恐惧场景写法、空间描写、心理描写与节奏控制，聚焦"怎么写"而非"写什么"',
  'Haunted rental horror narrative writing guidance: prose-level guidance on language style, horror scene writing, space description, psychological portrayal, and pacing control — focused on HOW to write, not what to write',
  '## 叙事写作指导 — 凶宅灵异租房小说创作

本技能提供凶宅灵异租房小说正文写作层面的专项指导，专注于**如何将设定转化为有效的恐惧文字**——不是写什么（设定已解决），而是怎么写。

---

### 一、语言风格

#### 散文基调

凶宅流的散文基调应该是**日常中带着一种细微的不对劲**——不是从第一句就渲染恐怖气氛，而是用非常普通的语言写一件非常普通的事，然后让那件普通的事开始慢慢不对。

**这意味着**：
- **动词比形容词更有力**："她听到了床底的声音"比"床底传来了令人毛骨悚然的恐怖声音"更有效
- **感官描写的克制**：不要每个句子都有感官细节——让精准的感官细节出现在读者没有准备的时候
- **短句在关键时刻**：当恐惧抵达时，句子应该变短，变直接，变无法逃避

#### 恐惧叙述的两种错误

**过度叙述**（写得太多）：
```
❌ 那个声音令人窒息地从床底传来，充满了死亡的气息，像是一个被困灵魂发出的绝望呜咽，让林晓每一个汗毛都竖了起来，心跳猛地加速，恐惧像潮水一样涌上心头……
```

**克制叙述**（写得精准）：
```
✓ 声音从床底传来。
✓ 不是那种能解释为管道声的声音。
✓ 林晓没有动。
```

**第二种写法更恐惧。** 第一种写法告诉了读者应该恐惧；第二种写法让读者自己产生了恐惧。

#### 日常感的保持

凶宅流最容易犯的语言错误是**太快进入"恐惧写作模式"**——一旦主角察觉了第一个异常，整个叙事就变成了恐惧叙事的腔调，日常感消失。

**正确做法**：主角在恐惧和"也许只是我多想"之间来回——叙事语言也要体现这种摇摆：
```
林晓把镜子里的那个东西解释为光线的问题。厨房的光不好，这是事实。她刷完牙，回到卧室。
今晚没有声音。她睡着了。
第二天她发现牙刷不在原来的位置。
```

没有惊呼，没有恐惧描写。但读者很清楚地感觉到某件事不对。

---

### 二、核心场景写法

#### 2.1 恐惧发现场景

"主角第一次发现诡异现象"是凶宅流最重要的场景类型。

**写法原则**：
- **过程比结果更恐惧**：不是"她看见了一个手印"，而是"她打开灯，水雾还在，她靠近去看，发现……"
- **主角的第一反应是否认**：理性的否认反应比立刻恐惧的反应更真实，也更恐惧
- **最后一个句子是钩子**：发现场景应该以一个未解决的细节结束，而不是以主角的情绪反应结束

**结构示例**：
```
[主角在日常动作中] → [开始注意到某件事不对] → [靠近/仔细看/确认] → [意识到无法解释] → [第一反应：否认或合理化] → [最后一个细节：这个合理化无法解释的部分]
```

#### 2.2 空间恐惧场景（主角进入危险空间）

**写法原则**：
- **物理描写先于情绪描写**：先写主角的身体（脚步、呼吸、手放在门把手上的感觉），再写内心
- **声音的方向感**：在写声音时，总要给出方向（从左边、从背后、从下面）——方向感让读者的大脑立刻在空间中定位
- **主角的视野限制**：写主角能看到什么，同样重要的是写主角看不到什么

**浴室场景写法示例**：
```
她不看镜子。
这已经成为了一种习惯——进浴室，开灯，把视线落在地砖上，在瓷砖的纹路里找到某种日常的安慰。刷牙。漱口。把牙刷放回原位。
然后她一抬头，就看见了。
```
（"就看见了"——不写她看见了什么。继续写她的反应。）

**床底场景写法示例**：
```
声音停了。
比声音更难受的是停了之后的安静——那种她必须低下头去确认床底有没有东西的安静。
她低下头。
```
（再次，不写她看见了什么。或者写，但要极端克制。）

#### 2.3 心理崩溃场景

主角的心理在恐惧中逐渐瓦解是凶宅流的情感核心。

**写法原则**：
- **不写"她感到恐惧"，写"她做了什么"**：心理状态通过行为表现，不通过直接描述
- **认知错误的具体化**：主角开始怀疑自己的感知时，要写出具体的认知错误（她问了邻居三遍同一个问题；她把电视遥控器放在鞋盒里；她开始记录每天早晨牙刷的位置）
- **外部世界的不理解**：在一次通电话场景中，让主角尝试解释她的处境，然后写外部世界的反应——"嗯……你可能需要多出去走走"

#### 2.4 真相揭露场景

真相揭露是凶宅流节奏最快、情感密度最高的场景类型。

**写法原则**：
- **不要停下来解释**：真相以行动和发现揭示，不是以叙述解释揭示
- **揭露要分层**：第一层揭示让读者觉得"原来如此"，第二层让读者意识到第一层是错的，第三层才是真正的真相
- **主角的反应不是惊呼，而是沉默**：真正的真相冲击让人说不出话，写沉默比写叫声更有力

---

### 三、空间描写技术

凶宅流最重要的叙事技能之一：**如何描写空间**。

#### 原则一：第一次进入与后续进入的不同写法

第一次进入一个空间：描写外观和正常感（建立基准）
后续进入同一个空间：描写哪里和第一次不一样（建立异常感）

#### 原则二：光线是恐惧的重要工具

- **过于明亮**（白天的强光下某件事仍然令人不安）：比黑暗更令人不安，因为主角无法用"我眼花了"来解释
- **某种特定光**（走廊灯的黄光、电视屏幕的冷光）：颜色的信息已经带有情绪标签
- **光的边界**（灯能照到的地方和照不到的地方的边界）：恐惧总在边界处

#### 原则三：气味的低估使用

气味是恐惧描写中被最严重低估的感官：
- "那间房子闻起来像……" 读者能感受到的方式与视觉完全不同
- 气味描写要具体（不是"腐烂的气味"，而是"像很久没有人打开的衣柜里面的气味，但更重一点"）
- 气味的消失和出现都可以是信号

---

### 四、节奏控制

#### 章节节奏

每一章的开头和结尾是节奏控制的关键：
- **开头**：直接进入动作或感知——不要从主角醒来/起床开始
- **结尾**：一个未解决的细节，或一个让主角（和读者）无法安心的认识——不要以情绪描写结尾

#### 恐惧事件的时间分布

凶宅流特有的节奏陷阱：把所有恐惧事件都放在晚上，导致白天场景变成"没有意义的等待"。

**解决方案**：至少有一个恐惧事件发生在完全不应该发生的时间（下午两点、主角和外卖员通话的时候），打破"晚上才有鬼"的安全预期。

---

### 五、常见写作错误

1. **形容词堆砌代替感官描写**：不要用"恐怖的"、"令人不寒而栗的"描述恐惧——用具体的感官细节
2. **主角一直在内心独白解释恐惧**：大段"我感到恐惧是因为……"——应该用行为和场景替代解释
3. **声音描写太多、视觉描写太少**：声音是凶宅流的核心感官，但视觉描写的缺失会让读者失去空间感
4. **场景过渡太快**：主角从客厅走到浴室只用一句话——过渡过程本身可以是恐惧的来源（走廊里有什么）
5. **高潮揭示写得太繁复**：真相揭露场景用了大量形容词描写主角的震惊——越简洁越有力，让真相本身的重量说话
6. **主角太快适应**：第三章开始发现诡异，第四章主角就已经完全淡定地"调查凶宅"——心理适应过程太快，丧失了恐惧的持续性
7. **白天场景完全安全**：读者学会了"白天没事，晚上才有恐惧"，开始在节奏上放松——这个安全感要被打破',
  'Haunted rental horror narrative writing guidance. Core principle: the horror of suggestion beats the horror of description. Use restraint: "The sound came from under the bed. / Not the kind that could be explained as pipes. / She didn''t move." is more frightening than elaborately describing the sound. Maintain the daily-life register throughout — don''t switch into "horror writing mode" immediately after the first anomaly. Horror discovery scenes: process beats result; protagonist''s first reaction is denial; end on an unresolved detail. Space horror scenes: physical description before emotional description; always specify sound direction; write what protagonist can''t see as much as what they can. Space description: first entry establishes baseline normalcy, subsequent entries track deviations; light quality as horror tool; scent is the most underused horror sense. Pacing: chapters open mid-action, close on unresolved details. Break "only scared at night" expectation with at least one daytime horror event. Seven common errors: adjective-stacking, excessive interior monologue, over-reliance on sound, rushed transitions, overwrought revelation scenes, too-quick psychological adaptation, always-safe daytime.',
  (SELECT id FROM novel_creation_method WHERE name = '凶宅灵异租房' LIMIT 1),
  1,
  100,
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
