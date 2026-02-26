-- 都市传说怪谈复苏流小说 - 叙事写作技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-urban-legend-narrative.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'urban-legend-narrative',
  '都市怪谈叙事与正文写作技巧：氛围营造、恐惧节奏、核心场景写法（电梯异变/深夜独行/网络入侵/规则触发/心理崩溃）、对话处理、感官描写与常见写作错误规避',
  'Urban legend horror narrative and prose writing techniques: atmosphere building, fear pacing, core scene writing (elevator anomaly, late-night isolation, network intrusion, rule triggering, psychological breakdown), dialogue handling, sensory description, and common error avoidance',
  '## 都市怪谈叙事与正文写作技巧

本技能专为「都市传说怪谈复苏流小说」设计，聚焦**正文写作**层面：当你已经完成设定模块、规划好了剧情，准备动笔写正文时，如何让每一段文字都让读者感到不安、代入、和那种日常被侵蚀的恐惧。

---

### 一、语言风格

#### 1.1 「日常语言」是最强的恐惧载体

都市怪谈正文的语言原则：**用最普通的句子描述最不普通的事**。

```
弱（过于文学化，读者跳出日常）：
「那电梯门以一种令人窒息的缓慢合拢，仿佛夜幕中的巨兽闭合了它漆黑的獠牙。」

强（日常叙述，恐惧在日常里生长）：
「电梯门关上了。他这才想起来，他刚才没按楼层。」
```

**技巧**：在普通句子结尾，或普通段落末尾，放置一个让人停住的细节。读者刚刚跟着日常节奏走，然后那个细节让他们不得不停下来。

#### 1.2 视角的选择影响恐惧的来源

不同视角下，「恐惧的来源」是不一样的：

| 视角 | 恐惧来自 | 具体写法 |
|------|---------|---------|
| 第一人称 | 「我不知道的」+ 「我以为我知道的」 | 叙述者的误解和补充（「我后来才知道……」）|
| 第三人称限知 | 「读者看到了主角看不见的」 | 在限知中偶然切出，描写主角背后的东西 |
| 网络帖子体 | 「帖子里有一处不对劲」 | 评论区的「楼主已注销」，跟帖时间异常 |

#### 1.3 不可靠叙述者的运用

第一人称的都市怪谈有其独特的恐惧层：叙述者是否在说真话？叙述者是否意识到自己在说假话？

**三种不可靠程度**：
- **轻度**：叙述者回忆时有遗漏，事后补充「我后来才知道那时候就已经……」
- **中度**：叙述者明确知道某些事但选择不说，读者感觉到了
- **重度**：叙述者本身已经是怪谈的一部分，但叙述中的细节不断泄露这个事实

---

### 二、核心场景写作技巧

#### 2.1 电梯/密闭空间异变场景

密闭空间是都市怪谈最经典的舞台。好的电梯场景依赖两个层次：**正常感的建立**和**异常的精准切入**。

**五步电梯场景写法**：
```
步骤1 — 建立日常细节（制造「这就是正常的电梯」的感觉）：
「数字跳到7，再跳到8，门开了。没人上来。」

步骤2 — 引入第一个异常（小的，可以被忽视的）：
「门没有立刻关上。他等了一会儿，按了关门键。」

步骤3 — 异常开始不可忽视（身体反应先于大脑反应）：
「他的手停在那里——他现在按的是哪个楼层？8楼。他就住在8楼。
但电梯继续上升了。」

步骤4 — 规则触发/主角行动（不要等，立刻行动）：
「他按了所有楼层。10，11，12，14——没有13——15。
电梯没有停下来。数字不再跳动了。」

步骤5 — 留下未解（结束时不要解释）：
「门最终开了。他不知道是几楼。
走廊的灯都亮着。没有窗户。
他不记得这栋楼有没有窗户。」
```

**关键技巧**：
- 用「数字」制造精准感（不是「电梯很久」，而是「他数了32秒」）
- 在密闭空间里，声音比视觉更恐怖（电梯的齿轮声、隔壁轿厢的动静）
- 主角的身体反应比语言反应更真实（「他的手掌开始出汗」不是「他很害怕」）

#### 2.2 深夜独行场景（楼道/街道）

深夜独行场景的核心恐惧：**你的感知在欺骗你，但你无法停止感知**。

**独行场景的三重感知层次**：
```
第一层（客观描述，正常）：
「走廊里的灯是那种老式的白炽灯，地板是灰色水磨石。
楼道里有外卖袋的气味，是隔壁邻居今晚扔的。」

第二层（感知开始扭曲，主角开始注意到不对的事）：
「他走到3楼和4楼之间，脚步声忽然有了回声。
他停下来。回声也停下来了，比他的脚步晚了半拍。」

第三层（主角的认知和感官背叛他）：
「他没有转头。他知道自己不应该转头。
这不是因为他记住了什么规则——他只是本能地知道，
转头之后他会看到什么，
而那之后他就再也不能假装什么都没有发生。」
```

**节奏控制**：
- 独行场景不要用长句，用短句切割，让读者的呼吸跟着停顿
- 在最紧张的时刻，突然切回到一个非常日常的细节（「他想起明天还要交房租」）——这种切回比持续恐惧更令人不安
- 结束时不要告诉读者「什么都没有发生」或「主角安全了」，用模糊结尾

#### 2.3 规则触发瞬间

规则触发是整个都市怪谈叙事中最关键的时刻，需要精确的节拍控制：

**规则触发的三段式写法**：
```
触发前（正常行为，读者比主角先知道错误）：
「她拿出手机，想打开地图看怎么走。
她的拇指下意识地滑开了一条新消息。
她没有想为什么在凌晨三点会有陌生号码发来消息。」

触发中（从正常到异常，用单个具体细节标记转折点）：
「她把消息打开了。
消息只有一行字：
『你已经看了。』
这条消息发送时间显示是三年前。」

触发后（不是恐怖爆发，而是新的日常——带着规则的日常）：
「她的地图软件正常打开了，显示出回家的路线。
她在路口等红灯，旁边的男人在抽烟，
广告牌上有个模糊了的人脸在笑。
她决定走路回家。
她不知道为什么。」
```

**写作禁忌**：触发之后不要立刻发生明显的恐怖事件。最好的处理是触发后「一切看似正常」——直到读者想清楚刚才发生了什么。

#### 2.4 网络入侵/数字空间场景

这是都市怪谈独有的场景类型，也是最能体现现代感的场景。

**真实感的数字场景写法**：

**正确**：
```
「陈磊打开微信，想撤回那条消息。
消息已经两分钟了，撤回功能已经没有了。
他盯着那条消息看了很久。
他意识到问题不在于他发了什么。
问题在于，那条消息下面有一个小头像——
但他们是在单独对话。
那个头像不是他们两个人中的任何一个。」
```

**错误**（解释太多）：
```
「陈磊突然看到聊天窗口里出现了第三个人的头像，
这是不可能的，因为这是一对一的聊天。
他感到非常恐惧，他意识到怪谈已经侵入了他的手机。」
```

**数字场景的特殊技巧**：
- 「截图」比「描述」更有真实感（模拟截图格式的文字呈现）
- 时间戳是绝佳的恐惧工具（「2023年11月的消息，发送时间：2014年」）
- 已读/未读状态、消息送达状态可以产生恐惧（「消息送达了，但对方没有收到」是不可能的）

#### 2.5 心理崩溃/认知动摇场景

当主角无法再维持「这一切有合理解释」的防线时，心理崩溃的书写：

**层次化崩溃写法（不要一次崩完）**：
```
第一层崩溃（否认的失效）：
「他告诉自己是错觉。
但他已经数了五次了。
那条走廊里确实有九盏灯。
昨天，他数了，是八盏。」

第二层崩溃（求助失败）：
「他把截图发给朋友，朋友说「在哪，我什么都没看到」。
他回头看自己的相册：截图不见了。
他去找朋友的聊天记录：那条消息显示「发送失败」。」

第三层崩溃（接受的开始——比崩溃更可怕）：
「他没有再找任何人说。
他不是因为觉得没有人会相信他。
他是因为觉得，说出来，会让这件事变得更真。」
```

---

### 三、对话风格

#### 3.1 都市怪谈对话的核心原则

恐惧的对话不是通过「我好害怕」传递的，而是通过**正常对话中的异常缺口**。

**好的恐惧对话**：
```
「你昨晚在哪？我找你找了很久。」
「我就在家里。」
「你家的灯亮着，但你没开门。」
「昨晚我睡了很早，没听见敲门声。」
「我没有敲门。」
```

**差的恐惧对话**：
```
「我昨晚发现了一件很恐惧的事，你知道吗电梯里有鬼！
我非常害怕，我不知道怎么办，你帮我怎么办？」
```

#### 3.2 「知情者」的对话技巧

知情者的对话是整个故事中最重要的信息传递节点，同时也是最容易写成「说明书」的地方。

**原则**：知情者不会主动解释，他们会**反应**。

```
差（知情者变成说明书）：
「这个规则是这样的：你不能在凌晨三点坐电梯，
因为那个时间段，电梯会进入异次元空间……」

好（知情者通过反应传递信息）：
「你坐电梯了？」
「就是普通电梯。」
「昨晚几点？」
「大概……三点多。」
他的脸色变了。「你是一个人？」
「是，怎么了？」
他没有回答，而是看了一眼陈磊的脚。
「你的鞋底有什么？」
```

#### 3.3 无声作为对话的一部分

在都市怪谈对话中，「没有说的话」和「说了的话」同样重要。

写法：在对话中制造停顿、省略、转移话题的瞬间，让读者感受到角色说不出口的恐惧。

---

### 四、节奏把控

#### 4.1 「平静章节」的正确写法

很多作者认为平静章节就是「没有恐惧的章节」。错。平静章节是「**恐惧密度降低、但恐惧从未消失**的章节」。

平静章节应该做到：
- 日常细节里有一个「不对劲但说不清楚的小东西」
- 主角的心理有一条持续的底层焦虑线
- 为下一次恐惧节拍埋好伏笔

#### 4.2 高峰节拍之后的处理

恐惧高峰之后，不要立刻切到另一个日常章节——需要一个「下坡段落」：
- 主角对刚才发生的事的第一反应（不是分析，是身体和情绪的余震）
- 日常细节的回归（但日常感觉不一样了）
- 至少一个细节表明事情还没有结束

---

### 五、常见写作错误

- ❌ **恐惧解释过度**：刚发生了一件恐怖的事，主角立刻自言自语分析原因——这会破坏恐惧感。恐惧应该保持不被解释一段时间
- ❌ **感官描写只用视觉**：都市怪谈的感官恐惧是多维的——听觉（回声、脚步声、呼吸声）、触觉（寒意、出汗、心跳）、嗅觉（异常的气味）往往比视觉更令人不安
- ❌ **主角在最危险的时刻停下来观察和思考**：真实的恐惧是「先逃，后想」
- ❌ **使用的比喻太过戏剧化**：「像是死神的手搭上了他的肩膀」——都市怪谈的比喻应该是日常化的（「像是空调漏水打在了后颈，但空调在另一侧」）
- ❌ **恐惧事件之后马上解除危险**：最好的都市怪谈在「事件」结束后，让读者和主角一起处于「不知道危险是否真的结束了」的状态
- ❌ **对话推进代替场景推进**：大量角色对话解释情况，但实际场景里没有什么在发生
- ❌ **「我感到很害怕」类的直接情绪陈述**：恐惧应该通过身体反应和行为表现，而不是直接陈述情绪',
  'Urban Legend Horror Narrative and Prose Writing Techniques

This skill focuses exclusively on prose-level guidance for "Urban Legend Revival Horror Novel" — how to make every paragraph generate unease, immersion, and the specific fear of daily life being corroded.

**Core language principle**: use the most ordinary sentences to describe the most extraordinary events. Place the unsettling detail at the end of a normal sentence or paragraph, right when readers have settled into a routine rhythm.

**Five-step elevator scene structure**:
1. Establish mundane normality ("Numbers jumped to 7, then 8, doors opened. No one came in.")
2. First anomaly — small, ignorable ("The doors didn''t close immediately.")
3. Anomaly becomes undeniable — body reacts before mind ("His hand stopped. Which floor had he just pressed?")
4. Rule triggers, protagonist acts immediately ("He pressed every floor. 10, 11, 12, 14 — no 13 — 15. The elevator didn''t stop.")
5. Leave unresolved ("The doors eventually opened. He didn''t know what floor it was. The hallway had lights. No windows.")

**Late-night isolation — three sensory layers**: objective description (fluorescent lights, floor material, smell of takeout bags) → perception starts warping (footstep echo half a beat behind) → protagonist''s cognition and senses betray them ("He didn''t turn around. Not because he remembered a rule — he just instinctively knew that turning would mean seeing something, and after that he could never pretend nothing happened.")

**Rule-triggering structure**: trigger pre (reader knows the mistake before protagonist) → trigger moment (single specific detail, not dramatic) → post-trigger normalcy (the most terrifying part: everything looks normal again).

**Informant dialogue principle**: informants don''t explain — they react. "You took the elevator?" "Normal elevator." "What time?" "Around 3am." His face changed. "Alone?" He looked at the protagonist''s shoes instead of answering.

**Five most common prose errors**:
1. Over-explaining the horror immediately after it happens
2. Using only visual sensory details — sound and touch are more terrifying in confined urban spaces
3. Having the protagonist stop to observe and reason at the most dangerous moment
4. Melodramatic comparisons ("like Death''s hand on his shoulder") — use mundane comparisons
5. Immediate danger resolution — leave protagonist (and reader) in "is it really over?" limbo',
  (SELECT id FROM novel_creation_method WHERE name = '都市传说怪谈复苏流小说' LIMIT 1),
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
