-- 灵异直播小说「文风设定」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '灵异直播小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-lingyi-live-writing-style-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'lingyi-live-writing-style-setting-gen',
  '「文风设定」设定生成：为灵异直播小说生成文风设定，包括叙事视角、镜头感强度、弹幕呈现方式、恐惧营造核心手法、语言风格、节奏特色及三条直播专属写作规则',
  '"Writing Style" setting generation: generate writing style settings for supernatural livestream horror novels, including narrative perspective, cinematographic intensity, comment section presentation, core fear-building techniques, language style, pacing characteristics, and three livestream-exclusive writing rules',
  '## 「文风设定」设定生成 — 灵异直播小说

「文风设定」定义整体写作风格。灵异直播小说对文风的要求与普通灵异小说有本质区别——必须在「小说叙事节奏」和「直播实时感」之间找到平衡，既要有小说的沉浸感，又要保留直播的临场感和互动感。

---

### 字段生成指南

#### 1. 叙事视角

**各视角优缺点分析**：

**第一人称（主播视角）**
- 优点：代入感最强，读者直接成为主播本人；主播的无知是天然的恐惧来源（「我不知道它就在我背后」）；网络语气自然
- 缺点：无法展示主播看不到的事件；弹幕只能通过主播「瞄了一眼弹幕」来呈现，影响弹幕的戏剧张力
- 适合故事类型：主角强势、以主播成长为主线的故事

**第三人称限知（聚焦主播）**
- 优点：可以在保持主播视角的同时，穿插弹幕区的画面；适合展示「弹幕区已经炸了但主播还没反应过来」的戏剧张力
- 缺点：代入感略弱于第一人称
- 适合故事类型：需要频繁切换「主播视角」和「弹幕视角」的故事，是灵异直播小说最推荐的视角

**「直播流视角」特殊写法**：
这是灵异直播小说独有的叙事技巧，需要专门的写法指南：

- **弹幕嵌入叙事的方式**：弹幕不是单独列出的「[弹幕：XXX]」，而是融入叙事描写中。错误写法：「弹幕区出现了''它就在你背后''」。正确写法：「屏幕左侧开始飘字，起初是零星几条——『好像有什么东西——』『等等，你背后——』，然后整个弹幕区像被什么点燃了一样，白花花的字把画面盖了大半。」
- **保持沉浸感而不变成流水账**：弹幕不是每时每刻都要出现，关键时刻才需要弹幕的「集体反应」。铺垫段落里可以完全没有弹幕，恐怖场景才让弹幕爆炸
- **主播与弹幕的互动节奏**：主播「看弹幕」这个动作本身可以成为悬念——「他终于低头看了一眼手机屏幕，然后整个人愣住了」
- **弹幕的「声音感」**：好的弹幕描写应该让读者感受到「几万人同时开口」的那种声浪，而不是几行文字

#### 2. 镜头感强度

灵异直播小说天然带有「摄像头视角」，镜头感强度决定了读者的代入方式。

**高镜头感（电影化叙事）**：
- 适合场景：直播高潮段落、鬼怪出现的瞬间、直播断线等
- 写法特征：「镜头」作为叙事主体——「摄像头的自动对焦开始犯难，它在主播的脸和主播身后那个轮廓之间反复横跳，最终定格在了主播背后」
- 效果：制造强烈的「观看感」，读者像在看一部恐怖电影
- 注意：高镜头感不宜持续太长，会导致读者「出戏」

**中镜头感（叙事为主，偶尔切入摄像头视角）**：
- 适合场景：大部分正常直播段落
- 写法特征：以主播的感受和行动为主，偶尔描写「摄像头捕捉到了什么」
- 效果：平衡代入感与距离感，是灵异直播小说最常用的镜头感档位

**低镜头感（内心叙事为主）**：
- 适合场景：主播独处思考、回忆、设备关闭后的纯文本段落
- 写法特征：类似普通小说，完全聚焦于人物内心
- 效果：给读者喘息的空间，在高密度恐怖段落后起到缓冲作用

**档位切换原则**：直播开播时切换到中/高镜头感，直播结束后切换到低镜头感，恐怖高潮时切换到高镜头感。节奏感来自这种切换。

#### 3. 弹幕呈现方式

弹幕是灵异直播小说最独特的叙事工具，也最容易写错。四种呈现方式各有适用场景。

**① 嵌入式叙事（推荐）**：
弹幕融入场景描写，不打断叙事流。
示例：「直播间安静了几秒，然后屏幕右侧开始有字飘出来——先是一条，然后是十条，然后是铺天盖地的同一句话：『你看右边！你看右边！你看右边！』」
适用：恐怖场景的集体反应，需要制造「弹幕海」效果的关键时刻

**② 对话式弹幕**：
以接近对话的方式呈现弹幕，主播会回应。
示例：「『楼上说的对，这里很诡异』，『别进去！』，『别听他们的，进去探探』——主播扫了一眼，笑着说：''投票投票，进去的扣1，不进的扣2。''」
适用：日常直播互动段落，展示主播与观众的关系

**③ 选择性呈现**：
只呈现关键弹幕，而不是所有弹幕。
示例：「几万条弹幕里，主播只注意到了那一条——因为它和所有人说的都不一样：『它能听见你们说话。』」
适用：在密集弹幕中突出异常弹幕，制造「这一条和其他的不一样」的强烈对比

**④ 弹幕缺席**：
在应该有弹幕的地方，弹幕突然消失。
示例：「他扫了一眼手机，直播间的弹幕区，空白的。没有一条字。在线人数显示：34,612。」
适用：制造「所有人同时闭嘴」的最高级恐惧——比铺天盖地的弹幕更令人窒息

**弹幕密度控制原则**：
- 铺垫段落：弹幕较少，主要展示主播状态
- 恐怖出现时：弹幕爆炸，密度极高
- 最恐怖的瞬间：弹幕突然消失（用「弹幕缺席」手法）
- 恐怖结束后：弹幕逐渐恢复，带有观众的集体后怕情绪

#### 4. 恐惧营造核心手法

**① 信息差恐惧（灵异直播最核心的手法）**：
读者比主播先知道危险的存在。在读者已经知道「它在主播背后」之后，用大量篇幅描写主播若无其事的行为——每一个细节都成为折磨。
写法要点：先让读者「看见」（通过弹幕反应、摄像头捕捉的画面），再让主播继续在那个存在旁边安然无恙地做事，拉长读者的焦虑时间
使用时机：每次灵异出现的核心场景

**② 直播独有的「集体见证」恐惧**：
几万人同时看见了同一件恐怖的事——但没有一个人能真正帮助主播。
写法要点：描写弹幕的「集体失语」——先是铺天盖地的预警，然后是「它看过来了」之后弹幕的集体沉默。几万人同时沉默的重量，比几万人同时喊叫更重
使用时机：最高级的恐怖场景，一章只用一次

**③ 媒介破坏感**：
直播技术本身的「失常」成为恐惧信号——信号异常、画面扭曲、声音失真、自动切换镜头
写法要点：设备的「失常」必须有先兆，不能突然发生——先是轻微的信号波动，然后是画面抖动，然后是……
使用时机：鬼怪「介入」直播的过渡段落，制造「有什么东西在干扰信号」的感觉

**④ 回放发现手法**：
事后回看直播录像时，发现了直播中没有注意到的细节——「等等，这个画面里……」
写法要点：回放发现的内容必须是早就埋好的伏笔，读者回想之前的内容时会感到「细思极恐」；回放的速度要慢，在关键画面上停下来，用多行描写一个静止的画面
使用时机：节奏缓下来的章节，制造「蓦然回首」的延迟恐惧

#### 5. 语言风格

网络口语如何与恐惧氛围结合——这是灵异直播小说最容易失衡的地方。

**问题诊断**：两种常见的失衡
- 太网络化：「哇这里好恐怖哦，弹幕们哈哈哈哈哈哈，求求了」——这是综艺节目，不是恐惧故事
- 太文学化：「寒意自脊背攀升，如冰蛇游走于每一根神经之间」——这与直播的临场感完全违和

**正确的平衡**：
- 日常直播状态：使用真实的直播口语，但避免过多表情包式语言——「好，我们现在进入这个房间，大家记得给主播点关注哈，进来转一圈就跑太不厚道了」
- 恐惧降临时：语言风格骤变，网络口语在恐惧下碎裂——「这里……等等，这里不对。等等。弹幕，你们刚才……你们刚才看到了什么？」
- 区别所在：「哇这里好恐怖哦」是表演，「这里……不对」是真实反应。主播从「表演给观众看」到「忘记了自己在直播」的转变，是恐惧真实性的核心标志

**地域语言色彩**：
如果主播有明确的地域背景，方言词汇是极好的人设工具，但不要多到影响阅读。一章一两个方言词汇足够制造真实感。

#### 6. 节奏特色

灵异直播小说需要平衡「直播实时感」和「小说叙事节奏」——这两者有时会产生矛盾。

**直播实时感的体现方式**：
- 以当前时间和直播状态作为章节开头（「在线人数：12,847 | 直播时长：01:23:45」）
- 用弹幕的实时反应制造紧迫感
- 突发事件不给主角「思考时间」——事情发生，弹幕爆炸，主播反应，全部实时发生

**小说叙事节奏的必要性**：
- 直播间里发生的一秒，在小说里可以写五百字——把一个恐怖瞬间无限放大
- 主播事后的心理活动、直播结束后的独处时刻——这些是「暂停」直播的叙事空间
- 不是所有情节都发生在直播时——直播前的准备、直播后的余震，是必要的节奏调节器

**平衡方式**：
- 「直播中」的章节：高节奏，大量弹幕互动，用「直播流」感写法
- 「直播后」的章节：低节奏，内心叙事为主，处理心理余震和推进隐线剧情
- 切换标志：可以用「[直播已开始]」「[直播已结束]」等格式标记作为章节内的分隔，既保持沉浸感，又清晰区分叙事状态

#### 7. 三条直播专属写作规则

专属于灵异直播小说的写作硬规定：

**规则一：弹幕呈现不超过连续 5 条的完整引用**
直接引用的完整弹幕文字不能连续超过 5 条，否则变成弹幕截图，而不是小说叙事。5 条以上的弹幕必须用叙事描写来呈现：「然后更多的字出现了，一条接一条，都在说同一件事……」而不是逐条列出。这条规则防止文本变成弹幕流水账，保持小说的叙事沉浸感。

**规则二：主播的「无知」必须有逻辑解释**
主播不能无限期地对明显的灵异迹象视而不见，否则读者会觉得主播是工具人。每次主播「没发现」都必须有合理的叙事解释：灯光角度问题、信号干扰导致他/她没看清摄像头画面、当时正在看别的地方……不能只是「不知道为什么主播就是没发现」。

**规则三：直播停播是最重的叙事节点，不能轻易使用**
「关播」这个动作在灵异直播小说里不只是停止直播，它代表着故事进入了一个新的阶段——直播外的世界将如何处理直播内发生的事。关播之后的章节是「事后」叙事，节奏完全不同。因此关播不能随意发生，每次关播都应该是一个重要的情节节点，而不是主播随手关了直播。

---

### 生成要点

- 叙事视角推荐第三人称限知，以便灵活切换主播视角和弹幕视角
- 弹幕呈现方式是灵异直播小说最独特的技术，最常犯的错是弹幕写成流水账或过于稀疏
- 四种恐惧手法中，信息差恐惧是灵异直播独有的，必须优先使用
- 语言风格的平衡点在于：日常直播用网络口语，恐惧降临时语言风格骤变
- 节奏切换以「直播中」和「直播后」为单位，而不是以场景为单位
- 三条特殊规则是硬性要求，不可违反',
  '## "Writing Style" Setting Generation — Supernatural Livestream Horror Novel

The "Writing Style Setting" defines overall writing style. The requirements for supernatural livestream horror novels are fundamentally different from ordinary horror novels -- a balance must be found between "novel narrative pacing" and "livestream real-time immediacy." The immersion of a novel must coexist with the presence and interactivity of a livestream.

---

### Field Generation Guide

#### 1. Narrative Perspective

**Analysis of advantages and disadvantages of each perspective**:

**First person (streamer''s perspective)**
- Advantages: Strongest immersion; readers directly become the streamer; the streamer''s ignorance is a natural source of fear ("I don''t know it is right behind me"); internet speech patterns feel natural
- Disadvantages: Cannot display events the streamer cannot see; comments can only be conveyed through the streamer "glancing at the comment section," which limits comment-related dramatic tension
- Suited story types: Stories with a strong protagonist; stories centered on the streamer''s growth arc

**Third person limited (focused on the streamer)**
- Advantages: Can intersperse comment section footage while maintaining the streamer''s perspective; well-suited for showing the dramatic tension of "the comment section has exploded but the streamer hasn''t noticed yet"
- Disadvantages: Slightly weaker immersion than first person
- Suited story types: Stories that require frequent switching between "streamer perspective" and "viewer perspective" -- the most recommended perspective for supernatural livestream novels

**The "livestream flow perspective" -- a special writing technique**:
This is a unique narrative technique specific to supernatural livestream novels, requiring its own writing guide:

- **How to embed comments into narrative**: Comments are not listed separately as "[Comment: XXX]" but are woven into descriptive prose. Wrong approach: "A comment appeared saying ''it''s right behind you.''" Correct approach: "Text began drifting across the left side of the screen -- a few sparse lines at first: ''Something seems to be -- '' ''Wait, behind you -- '' -- then the entire comment section ignited all at once, a white blizzard of characters burying more than half the frame."
- **Maintaining immersion without becoming a running tally**: Comments do not need to appear at every moment; the "collective reaction" of comments is only needed at critical moments. Buildup segments can have no comments at all; horror scenes are when the comment explosion happens
- **The rhythm of the streamer interacting with comments**: The act of the streamer "looking at the comments" can itself become a moment of suspense -- "He finally looked down at his phone screen, and then went completely still"
- **The "sound quality" of comments**: Good comment-writing should make readers feel the surge of "tens of thousands of people speaking at once," not just a few lines of text

#### 2. Cinematographic Intensity

Supernatural livestream novels naturally carry a "camera perspective"; the intensity level determines how readers are immersed.

**High cinematographic intensity (cinematic narrative)**:
- Suited scenes: Livestream climax segments, the moment a ghost appears, stream disconnections, etc.
- Writing characteristics: The "camera" as narrative subject -- "The camera''s autofocus began to struggle, toggling back and forth between the streamer''s face and the silhouette behind him, until it finally locked onto whatever was standing behind the streamer"
- Effect: Creates a strong sense of "watching," as if readers are watching a horror film
- Note: High cinematographic intensity should not be sustained too long; it causes readers to lose immersion

**Medium cinematographic intensity (narrative-primary, occasional camera perspective inserts)**:
- Suited scenes: Most normal livestream segments
- Writing characteristics: Primarily based on the streamer''s sensations and actions, with occasional descriptions of "what the camera captured"
- Effect: Balances immersion and distance; the most commonly used intensity level for supernatural livestream novels

**Low cinematographic intensity (inner narrative primary)**:
- Suited scenes: The streamer alone with their thoughts, flashbacks, pure-text segments after equipment is off
- Writing characteristics: Similar to an ordinary novel; fully focused on the character''s inner state
- Effect: Gives readers space to breathe; serves as a buffer after high-density horror segments

**Intensity switching principles**: Switch to medium/high when going live, switch to low after the stream ends, switch to high at horror climaxes. The sense of pacing comes from these switches.

#### 3. Comment Section Presentation

Comments are the most unique narrative tool in supernatural livestream novels and the easiest to write poorly. Each of the four presentation methods has appropriate use cases.

**① Embedded narrative (recommended)**:
Comments are woven into scene descriptions without interrupting the narrative flow.
Example: "The livestream room went quiet for a few seconds, then text began drifting from the right side of the screen -- first one, then ten, then an overwhelming flood of the same words: ''Look right! Look right! Look right!''"
Use when: Horror scene collective reactions; critical moments that require creating a "wall of comments" effect

**② Dialogue-style comments**:
Comments presented in a way that resembles dialogue, with the streamer responding.
Example: "''The person above is right, this place is weird,'' ''Don''t go in!,'' ''Don''t listen to them, go explore'' -- The streamer scanned the comments, smiled, and said: ''Let''s vote -- type 1 if you want me to go in, type 2 if I shouldn''t.''"
Use when: Ordinary livestream interaction segments; showing the relationship between streamer and audience

**③ Selective presentation**:
Only presenting key comments, not all of them.
Example: "Among tens of thousands of comments, the streamer only noticed one -- because it was saying something completely different from everyone else: ''It can hear what you''re saying.''"
Use when: Highlighting an anomalous comment within a dense stream; creating the powerful contrast of "this one is different from all the others"

**④ Comment absence**:
In a moment where comments should be present, the comments suddenly disappear.
Example: "He glanced at his phone. The comment section of his livestream room. Blank. Not a single word. Viewer count: 34,612."
Use when: Creating the highest tier of fear through "everyone going silent at once" -- more suffocating than a wall of comments

**Comment density control principles**:
- Buildup segments: Sparse comments; primarily showing the streamer''s state
- When horror appears: Comments explode; extremely high density
- At the most terrifying moment: Comments suddenly disappear (using the "comment absence" technique)
- After the horror ends: Comments gradually return, carrying the audience''s collective "post-scare" emotions

#### 4. Core Fear-Building Techniques

**① Information gap fear (the most essential technique in supernatural livestreaming)**:
Readers know about the danger before the streamer does. After readers already know "it is behind the streamer," spend extensive text describing the streamer''s oblivious actions -- every detail becomes torment.
Writing key points: First let readers "see" (through the comment section''s reaction, what the camera captured), then let the streamer continue doing things calmly next to that presence, drawing out the reader''s anxiety
When to use: Every core scene where a supernatural entity appears

**② The "collective witnessing" fear unique to livestreaming**:
Tens of thousands of people simultaneously witness the same terrifying thing -- but not a single one of them can actually help the streamer.
Writing key points: Describe the "collective loss of speech" in the comments -- first an overwhelming wave of warnings, then collective silence after "it looked over here." The weight of tens of thousands of people going silent simultaneously is heavier than tens of thousands of people screaming
When to use: The highest tier of horror scenes; use only once per chapter

**③ Media disruption feel**:
The "malfunction" of livestream technology itself becomes a fear signal -- signal anomalies, distorted visuals, garbled audio, automatic camera switching
Writing key points: The equipment''s "malfunction" must have a prelude; it cannot happen suddenly -- first subtle signal fluctuations, then visual shaking, then...
When to use: Transition segments where a ghost "intervenes" in the livestream; creates the sensation of "something is interfering with the signal"

**④ Playback discovery technique**:
When reviewing a past recording, details are discovered that were not noticed during the live stream -- "Wait, in this frame..."
Writing key points: What is discovered in the playback must be foreshadowing laid much earlier; readers re-reading earlier content will experience creeping dread; the playback must move slowly, pausing on key frames, using multiple lines to describe a single still image
When to use: Chapters where the pacing slows down; creating delayed fear through retrospective revelation

#### 5. Language Style

How internet colloquialisms combine with an atmosphere of fear -- this is where supernatural livestream novels most easily fall out of balance.

**Problem diagnosis**: Two common imbalances
- Too internet-driven: "Wow this place is so scary haha, comment section lol lol lol, please help" -- this is a variety show, not a horror story
- Too literary: "A chill climbed his spine, cold serpents winding through every nerve" -- this is completely at odds with the immediacy of livestreaming

**The correct balance**:
- Ordinary livestream state: Use authentic livestream colloquialisms, but avoid excessive emoji-style speech -- "Alright, we''re entering this room now, everyone remember to follow the channel, it''s not right to just come in and leave right away"
- When fear descends: Language style shifts abruptly; internet colloquialisms shatter under fear -- "Wait... something''s not right here. Wait. Comment section, did you just -- what did you just see?"
- The distinction: "Wow this is so scary haha" is performance. "Wait... this isn''t right" is a real reaction. The transformation from "performing for the audience" to "forgetting they are on a livestream" is the core marker of fear''s authenticity

**Regional language coloring**:
If the streamer has a specific regional background, dialect vocabulary is an excellent characterization tool, but should not be frequent enough to impede reading. One or two dialect words per chapter is sufficient to create authenticity.

#### 6. Pacing Characteristics

Supernatural livestream novels must balance "livestream real-time immediacy" and "novel narrative pacing" -- these two can sometimes conflict.

**How to convey real-time immediacy**:
- Use current time and stream status as chapter openings ("Viewers: 12,847 | Stream duration: 01:23:45")
- Use the real-time reactions of comments to create urgency
- Unexpected events give the protagonist no "thinking time" -- event happens, comments explode, streamer reacts, all in real time

**The necessity of novel narrative pacing**:
- One second in the livestream room can be written as five hundred words in the novel -- infinitely expanding a single terrifying moment
- The streamer''s post-event psychological processing, time alone after the stream ends -- these are narrative spaces that "pause" the livestream
- Not all plot happens during a livestream -- preparations before going live and the aftershocks after going offline are necessary pacing regulators

**How to balance**:
- "During the stream" chapters: High pacing; heavy comment interaction; written with "livestream flow" technique
- "After the stream" chapters: Low pacing; primarily inner narrative; processing psychological aftershocks and advancing hidden plot threads
- Transition markers: Format tags like "[Stream Started]" and "[Stream Ended]" can be used as section dividers within chapters, maintaining immersion while clearly distinguishing narrative states

#### 7. Three Livestream-Exclusive Writing Rules

Hard writing requirements exclusive to supernatural livestream novels:

**Rule One: No more than 5 consecutive complete quoted comments**
Directly quoted complete comment text must not appear in consecutive runs of more than 5, or it becomes a comment screenshot rather than novel narrative. Five or more comments must be presented through descriptive prose: "Then more words appeared, one after another, all saying the same thing..." rather than listing them one by one. This rule prevents text from becoming a comment log and preserves the novel''s narrative immersion.

**Rule Two: The streamer''s "ignorance" must have a logical narrative explanation**
The streamer cannot indefinitely overlook obvious supernatural signs; otherwise readers will view the streamer as a narrative tool. Every time the streamer "doesn''t notice" must have a reasonable narrative explanation: the lighting angle, signal interference causing them not to see the camera feed clearly, they were looking elsewhere at the time... It cannot simply be "for some reason the streamer just didn''t notice."

**Rule Three: Going offline is the heaviest narrative node; it cannot be used casually**
The act of "ending the stream" in a supernatural livestream novel is not just stopping a broadcast -- it signals that the story has entered a new phase, dealing with what happened in the livestream in the world outside it. Chapters after going offline are "aftermath" narrative with a completely different pacing. Therefore going offline must not happen arbitrarily; each instance of going offline should be a significant plot node, not the streamer casually closing their broadcast.

---

### Generation Notes

- Third person limited perspective is recommended for flexibility in switching between streamer and viewer viewpoints
- Comment section presentation is the most unique technique in supernatural livestream novels; the most common mistake is writing comments as a running log or making them too sparse
- Among the four fear techniques, information gap fear is unique to supernatural livestreaming and must be the primary tool
- The balance point for language style is: internet colloquialisms for ordinary livestream moments; language style shifts abruptly when fear arrives
- Pacing switches use "during stream" and "after stream" as units, not individual scenes
- The three special rules are hard requirements that cannot be violated',
  (SELECT id FROM novel_creation_method WHERE name = '灵异直播小说' LIMIT 1),
  1,
  93,
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
