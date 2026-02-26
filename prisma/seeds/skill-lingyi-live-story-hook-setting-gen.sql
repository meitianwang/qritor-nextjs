-- 灵异直播小说「故事钩子」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '灵异直播小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-lingyi-live-story-hook-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'lingyi-live-story-hook-setting-gen',
  '「故事钩子」设定生成：为灵异直播小说生成故事钩子设定，包括故事钩子、核心卖点、开篇爆点、读者期待',
  '"Story Hook" setting generation: generate story hook settings for supernatural livestream horror novels, including story hook, core selling point, opening shock event, and reader expectations',
  '## 「故事钩子」设定生成 — 灵异直播小说

「故事钩子」包含 4 个字段，用于定义故事的核心吸引力。灵异直播的钩子必须体现「直播场景中的异常」——异常要发生在直播这个特定媒介之内，而不是一般性的灵异事件。越平常的直播互动中出现不该有的东西，越令人窒息。

---

### 字段生成指南

#### 1. 故事钩子

一句话概括最令人脊背发凉的设定。必须体现「直播场景中的异常」——比「村里有鬼」具体得多。

**设计原则**：钩子的恐惧感来自「弹幕区里的异常」或「直播画面里不该有的东西」。鬼出现在直播里，意味着几万名观众同时目睹了它的存在，而主播本人浑然不知——这种「隔着屏幕的绝望感」是灵异直播独有的恐惧核心。

**优秀示例**：
- 「直播五万人同时在线时，弹幕区里有三个账号从不刷字，只是……一直在线」——正常数字（五万人）+ 异常存在（三个账号）+ 悬念（从不刷字代表什么）
- 「主播在凶宅直播时，有个账号打来说"你背后那个跟你说了什么"，问题是主播全程一个人」——具体的弹幕内容 + 主播的无知 + 读者与主播之间的信息差
- 「每次主播开播，都有一个叫"[系统消息]"的账号准时进入直播间，但平台没有这种格式的官方账号」——利用平台机制的异常，让人不确定是 bug 还是真的有什么东西

**常见错误**：
- 「主播在直播时遇到了鬼」——太模糊，没有直播媒介的特殊性
- 「弹幕里有奇怪的字」——奇怪字本身不够，需要说明奇怪在哪里
- 「直播间出现了异常」——异常本身不是钩子，异常的具体内容才是

**格式要求**：一句话，不超过 50 字，必须包含直播场景要素（弹幕/打赏/直播间/摄像头/在线人数等）。

#### 2. 核心卖点

读者为什么要看这个灵异直播故事？核心卖点需要差异化——区分这个故事与其他灵异小说的独特之处。

**卖点方向（选择最符合故事的一个）**：
- **弹幕叙事深度**：「几万观众通过弹幕预警主播的互动，比主播更早知道真相」——以信息差制造的绝望感和观众无力感取胜
- **打赏道具创意**：「打赏不只是打钱，是字面意义上的在救人——投喂狗粮能驱邪，点燃烟花能照亮阴影，打赏棺材会发生什么？」——以道具创意和规则趣味取胜
- **鬼怪与流量算法的特殊关系**：「直播热度越高，鬼怪越活跃——主播的事业目标与自保目标产生了根本冲突」——以内在逻辑的精巧取胜
- **主播人设特色**：「主播本人的职业/身份/背景与灵异有特殊关联」——以主角人设的独特性取胜
- **鬼怪利用媒介传播**：「这个鬼是真的想红，它在利用直播扩大影响范围」——以鬼怪目的的现代感取胜

**避免**：
- 过于笼统（「一个好看的灵异故事」）
- 与直播元素无关的卖点（强调修仙、武力对抗）

#### 3. 开篇爆点

前三章必须发生的震撼事件——是直播途中发生的、让读者欲罢不能的事件，不是主角发现什么「不对劲」。

**设计原则**：开篇爆点要够具体、够可验证。最好是主播和读者（作为虚拟观众）都能「共同见证」的事件——摄像头拍到了什么，弹幕说了什么，打赏触发了什么。

**优秀示例**：
- 「第一章结尾：主播在空无一人的凶宅问''这里有人吗''，弹幕区同时飘过数百条''有''，然后直播断线」——读者视角看到了弹幕，主播没看到，爆点是信息差的极致呈现
- 「第二章：一个打赏了 999 元的账号在留言区打了一行字：''你不应该来这里，但我会保护你''——然后账号注销了」——打赏行为 + 诡异留言 + 账号消失的连锁反应
- 「第三章：主播回放当天的直播录像时，发现录像里的自己和现实中做的动作不一样」——录像 vs 现实的分裂，制造「到底哪个是真实的」的终极恐惧

**避免**：
- 开篇爆点不能是「主角感觉不对」——必须是可见的、外部的、读者也能看到的异常
- 不能是三章之后才发生的事——前三章必须建立一个足够强的钩子

#### 4. 读者期待

明确承诺给读者的核心体验。灵异直播读者的核心期待是：

- **弹幕预警主播浑然不知的窒息感**：读者（作为虚拟观众）在弹幕里不断提醒主播，但主播看不到或不相信——「评论区的我们急死了！」「他怎么还没跑！」——这是直播类小说最独特的爽点，是代入感极强的集体焦虑体验
- **打赏道具关键救场的爽感**：在最危险的时刻，读者（以虚拟打赏的方式）救了主播——驱邪道具、净化弹幕、用光亮压制阴物——打赏从虚拟的金钱变成真实的力量，读者获得了真正的参与感
- **鬼怪进入直播间的细思极恐**：直播画面里出现了不应该存在的东西，主播没发现，但几万个观众的弹幕同时爆炸——「它在你背后」「别回头」——这一刻的集体恐惧是绝无仅有的直播独有体验
- **主播成长/觉醒的爽感**：从什么都不知道的普通主播，逐渐意识到自己进入了一个更大的秘密——学会利用直播规则反制灵异，从猎物变成猎手

**生成时应选取 2-3 个最匹配当前故事的期待项**，不必面面俱到。

---

### 生成要点

- 故事钩子必须包含直播媒介要素（弹幕/打赏/在线人数/摄像头/直播断线等），不能是普通的灵异钩子
- 核心卖点要突出直播小说的差异化优势，避免可以套用在任何灵异故事上的通用卖点
- 开篇爆点必须具体、可见、发生在直播场景中，且读者与主播之间存在信息差
- 读者期待要聚焦 2-3 个与当前故事最匹配的方向
- 四个字段之间形成逻辑链：故事钩子吸引点击，卖点建立期待，开篇爆点锁住读者，读者期待支撑长期追读',
  '## "Story Hook" Setting Generation — Supernatural Livestream Horror Novel

The "Story Hook" contains 4 fields that define the story''s core appeal. Hooks for supernatural livestream horror must embody "anomalies within the livestream context" -- the anomaly must occur within the specific medium of livestreaming, not just generic supernatural events. The more ordinary a livestream interaction that contains something that should not be there, the more suffocating the fear.

---

### Field Generation Guide

#### 1. Story Hook

One sentence summarizing the most spine-chilling premise. It must reflect "an anomaly in the livestream setting" -- far more specific than "there are ghosts in the village."

**Design principle**: The fear in a hook comes from "anomalies in the comment section" or "something that should not be in the livestream footage." A ghost appearing in a livestream means tens of thousands of viewers simultaneously witness its existence while the streamer has no idea -- this "helplessness through the screen" is the unique horror core of supernatural livestream stories.

**Good examples**:
- "When 50,000 people were watching the stream, three accounts in the comment section never typed a single word -- they just... stayed online" -- normal number (50,000) + anomalous presence (three accounts) + suspense (what does never typing mean?)
- "While streaming in a haunted house, a commenter wrote ''What did that thing behind you just say to you?'' The problem is the streamer was alone the entire time" -- specific comment content + streamer''s ignorance + information gap between readers and streamer
- "Every time the streamer went live, an account called ''[System Message]'' entered the room on cue -- but the platform has no official account in that format" -- anomaly exploiting platform mechanics; the uncertainty of whether it is a bug or something real

**Common mistakes**:
- "The streamer encountered a ghost while livestreaming" -- too vague; lacks the specific medium of livestreaming
- "There were strange words in the comments" -- strange words alone are insufficient; the specific nature of the strangeness is needed
- "Anomalies appeared in the livestream room" -- the anomaly itself is not the hook; its specific content is

**Format requirement**: One sentence, no more than 50 characters in Chinese, must include a livestream element (comments/donations/livestream room/camera/viewer count, etc.).

#### 2. Core Selling Point

Why should readers choose this supernatural livestream story? The core selling point needs differentiation -- what distinguishes this story from other horror novels.

**Selling point directions (choose the one that best fits the story)**:
- **Comment section narrative depth**: "Tens of thousands of viewers warn the streamer through comments, knowing the truth before the streamer does" -- winning with the helplessness and powerlessness created by information gaps
- **Donation item creativity**: "Donations are not just money -- they are literally saving lives. Feeding virtual dog food repels evil, igniting fireworks illuminates shadows -- what happens if someone donates a coffin?" -- winning with item creativity and rule-based fun
- **Special relationship between ghosts and the traffic algorithm**: "The higher the livestream trending score, the more active the ghosts -- the streamer''s career goal and survival goal are in fundamental conflict" -- winning with elegant internal logic
- **Streamer persona uniqueness**: "The streamer''s own profession, identity, or background has a special connection to the supernatural" -- winning with the uniqueness of the protagonist''s persona
- **Ghosts exploiting media for transmission**: "This ghost genuinely wants to go viral; it is using the livestream to expand its reach" -- winning with the modernity of the ghost''s motives

**Avoid**:
- Overly generic selling points ("A good horror story")
- Selling points unrelated to the livestream element (emphasizing cultivation or martial force)

#### 3. Opening Shock Event

A shocking event that must occur within the first three chapters -- something that happens during a livestream and makes readers unable to stop reading. Not the protagonist noticing something "feels off."

**Design principle**: The opening shock event must be specific and verifiable. Ideally, it is something both the streamer and readers (as virtual viewers) can "witness together" -- what the camera captured, what the comments said, what a donation triggered.

**Good examples**:
- "End of chapter one: The streamer asks ''Is anyone here?'' in an empty haunted house. Hundreds of comments flood the screen simultaneously saying ''yes'' -- then the stream cuts off" -- readers see the comments while the streamer does not; the shock is the ultimate expression of the information gap
- "Chapter two: An account that just donated 999 yuan types in the comment section: ''You shouldn''t be here, but I will protect you'' -- then the account is immediately deleted" -- donation behavior + eerie comment + account disappearance in sequence
- "Chapter three: When the streamer reviews the day''s recording, they notice that what their recorded self does is different from what they actually did" -- the split between recording and reality creates the ultimate fear of ''which one is real?''

**Avoid**:
- The opening shock cannot be "the protagonist has a bad feeling" -- it must be visible, external, and anomalous in a way readers can also see
- It cannot be something that happens after chapter three -- the first three chapters must establish a strong enough hook

#### 4. Reader Expectations

Core experiences promised to the reader. Supernatural livestream readers'' core expectations include:

- **The suffocating feeling of comments warning a clueless streamer**: Readers (as virtual viewers) keep trying to warn the streamer in the comments, but the streamer cannot see or does not believe them -- "We in the comments are dying of anxiety!" "Why hasn''t he run yet!" -- this is the most unique thrill of the livestream genre; a deeply immersive collective anxiety experience
- **The satisfaction of a donation item saving the day at the critical moment**: At the most dangerous moment, readers (through virtual donations) save the streamer -- exorcism items, purifying comments, using light to suppress dark entities -- donations transform from virtual currency into real power, giving readers true agency
- **The creeping dread of a ghost entering the livestream**: Something that should not exist appears in the footage; the streamer does not notice, but tens of thousands of viewers'' comments explode simultaneously -- "It''s behind you," "Don''t look back" -- this collective fear is an experience that is uniquely and exclusively possible in livestream stories
- **The satisfaction of the streamer''s growth and awakening**: From an ordinary streamer who knows nothing, gradually realizing they have walked into a larger secret -- learning to use livestream rules to counter the supernatural, transforming from prey into predator

**When generating, select 2-3 expectations that best match the current story**; no need to cover all of them.

---

### Generation Notes

- The story hook must include livestream medium elements (comments / donations / viewer count / camera / stream disconnect, etc.); it cannot be a generic horror hook
- The core selling point must highlight the differentiation advantages of a livestream novel; avoid generic selling points that could apply to any horror story
- The opening shock event must be specific, visible, occur within the livestream context, and contain an information gap between readers and streamer
- Reader expectations should focus on 2-3 directions that best match the current story
- The four fields should form a logical chain: the story hook attracts clicks, the selling point builds expectations, the opening shock locks in readers, and reader expectations sustain long-term readership',
  (SELECT id FROM novel_creation_method WHERE name = '灵异直播小说' LIMIT 1),
  1,
  91,
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
