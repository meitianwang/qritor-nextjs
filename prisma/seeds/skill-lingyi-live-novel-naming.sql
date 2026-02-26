-- 灵异直播小说命名 Skill
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '灵异直播小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-lingyi-live-novel-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'lingyi-live-novel-naming',
  '灵异直播小说命名技能：指导如何为灵异直播小说起书名，涵盖命名风格分析、四种命名公式（直播ID型/场次型/悬念型/反差型）、书名禁忌、20个高质量书名示例及分析、以及章节标题命名规律',
  'Ghost livestream novel naming skill: guides how to title ghost livestream novels, covering naming style analysis, four naming formulas (streamer-ID type / session type / mystery type / contrast type), title taboos, 20 high-quality title examples with analysis, and chapter title naming patterns',
  '## 灵异直播小说命名指南

书名是读者对小说的第一印象，也是「点击率」的最直接来源。灵异直播小说的书名需要完成一个平衡任务：既要让读者一眼感受到「直播感」，又要带上足够的「灵异感」，最好两者同时激发读者的好奇心。

---

### 一、命名风格分析：直播感 + 灵异感的双重要素

#### 1.1 直播感书名的特征

「直播感」不是指把「直播」两个字塞进去，而是让书名本身带有以下特质：

- **即时感**：像是正在发生的事，而不是回忆叙述
- **数字/账号感**：数字、ID、序号会天然带来「账号」或「场次」的联想
- **网络语境**：轻微的网络用语或直播平台特有的词汇（「上线」「开播」「在线」「弹幕」）
- **第二人称/召唤感**：书名里有「你」或某种召唤语气，让读者感觉自己「在场」

#### 1.2 灵异感书名的特征

「灵异感」的书名不是简单地加上「鬼」「魂」「凶宅」，而是：

- **悬置感**：书名本身是一个未解答的问题或一个奇怪的陈述
- **民间感**：中式民俗词汇带来的特定恐惧质感（「阴煞」「七魄」「镇魂」「百鬼」）
- **反常感**：正常事物与不正常现象并置（「凌晨三点的外卖」「空教室的课表」）
- **第一人称绝境感**：「我」的处境是不可能的、绝望的（「我的观众里有一个死人」）

#### 1.3 两种感觉如何融合

最好的灵异直播书名是**两种感觉都有，但用一种意象完成**：

- 「第666号订阅者」——「666号」有直播粉丝感，「订阅者」是正常词，但在灵异语境下「666」的数字暗示让整个书名变得危险
- 「凌晨三点，直播间突然满员」——「凌晨三点」是时间直播感，「满员」是直播平台词汇，但「突然」和整个语境让「满员」变得诡异

---

### 二、四种命名公式

#### 公式一：直播ID型

**逻辑**：以主播的账号名/直播间ID作为书名或书名的核心元素。这类书名要求账号名本身有记忆点和灵异暗示。

**设计要点**：
- 账号名可以是纯数字（带有某种规律或日期暗示）
- 账号名可以是汉字（要有双关义，表面普通，背后有灵异含义）
- 账号名要「听起来像真实主播ID」，而不是像奇幻小说的角色名

**示例**：
- 《直播间：0327》——「0327」可以是日期（某起死亡案件的日期），也可以是普通的账号数字后缀
- 《深夜探宅_李某某》——主播ID格式，下划线是网络用户名常见符号
- 《主播MissLing》——英文名+中文姓氏混搭，现代自媒体风格，而「灵」字有双关

**禁忌**：账号名不能太「文学」——「幽冥使者」「鬼域探秘」这类账号名完全不像真实的主播ID，让读者出戏。

#### 公式二：场次型

**逻辑**：以直播场次、时间节点或某次具体直播作为书名，强调直播语境和「进行时」感。

**设计要点**：
- 数字要具体（不是「第N场」，而是「第99场」「第666场」）
- 时间要精确（「凌晨2:47」比「深夜」更有直播感）
- 场次型书名往往暗示「某场特定直播将改变一切」

**示例**：
- 《第三十七场直播开始了》——「开始了」三个字制造即时感，「三十七」是一个有点奇怪的数字（不是整数，不是吉利数）
- 《凌晨2:47，我开始直播》——精确时间创造不安感，凌晨直播本身就有暗示
- 《我的第999场直播》——999带有「快结束了」的预感，也与民间对「9」的联想有关

#### 公式三：悬念型

**逻辑**：书名直接是一个悬念——一个让读者想知道答案的问题，或者一个不完整的陈述。

**设计要点**：
- 悬念必须在读完书名后留在读者脑海里（「等等，这是什么意思？」）
- 悬念的答案不能在书名里，要靠读故事才能解答
- 悬念型书名的「钩子」在于：书名本身就像直播里的一个关键弹幕

**示例**：
- 《我的直播间里有人从来没有离开过》——「从来没有离开过」创造了一种空间封闭的恐惧
- 《弹幕里有人知道我明天会死》——信息量极大，完整包含冲突、危机、时间压力
- 《他们说那条弹幕是我发的》——「他们说」制造了争议感，暗示主播可能失去了对自己行为的控制

#### 公式四：反差型

**逻辑**：将日常词汇（属于正常生活的）与灵异场景（属于非日常的）并置，制造强烈的认知冲突。

**设计要点**：
- 日常词汇必须是真的很日常（不是「凶宅」这种已经带有灵异感的词）
- 并置要有一种「这两个东西不该在一起」的割裂感
- 最好让读者瞬间想象出那个画面——画面本身就足够奇怪

**示例**：
- 《凌晨三点的外卖》——外卖是极日常的词，凌晨三点+直播语境让它变得诡异
- 《今天礼物不太对》——「礼物」是直播打赏，「不太对」是极轻描淡写的处理，两者的温差制造不安
- 《我的1000号粉丝》——粉丝里藏着一个非人存在，书名用最普通的数字表达最危险的意义

---

### 三、书名禁忌：什么样的书名让读者没有兴趣点击

#### 禁忌一：「主题词堆砌」型书名

**案例**：《灵异直播鬼宅探秘》《恐怖主播夜探凶地》《直播间里的鬼》

**问题**：这类书名把类型标签直接写在标题里，等于在对读者说「这是一本灵异直播小说」——读者已经知道这一点了，书名没有给他们任何额外的好奇心刺激。

#### 禁忌二：过于文学化的书名

**案例**：《彼岸流云散》《幽冥之镜》《鬼域无声》

**问题**：这类书名有古典灵异小说或玄幻小说的气质，但与「直播」这个现代语境完全脱节。读者看到这类书名，不会联想到弹幕和手机直播。

#### 禁忌三：「主角自述式」书名（太平淡）

**案例**：《我是一个直播探鬼的主播》《我的直播生涯》

**问题**：这类书名缺乏张力，读起来像一篇日记标题，而不是一个让人想继续读下去的故事开头。

#### 禁忌四：过度剧透型书名

**案例**：《我最终战胜了鬼怪》《直播间里的鬼是我的粉丝》

**问题**：把故事的核心悬念写进书名，读者在打开书之前已经知道了最大的秘密，阅读动力减半。

#### 禁忌五：太过普通的双关书名

**案例**：《幽灵主播》《鬼播》

**问题**：双关太浅，一眼就看穿，没有任何悬念留存价值。

---

### 四、20个高质量书名示例（附分析）

1. **《第666号订阅者》**
   分析：「666号」是直播粉丝编号感，但在中文语境下「666」也有恶魔数字的含义；「订阅者」是当代平台用语——两者融合制造了「这个粉丝有问题」的直接悬念。

2. **《凌晨三点，直播间突然满员》**
   分析：精确时间「凌晨三点」（全球公认的「鬼时」）+直播平台词「满员」+「突然」的不可控感——三要素组合，用最普通的词造出极端的恐惧画面。

3. **《我的弹幕里有一句话是三年前发的》**
   分析：「三年前」的时间错乱感与「弹幕」的即时感形成悖论，暗示有什么东西穿越了时间在观看直播。

4. **《他在第一场就上线了，一次都没下线过》**
   分析：精准描述了「非人观众」的行为特征，「一次都没下线过」暗示这不是真实的人类用户行为——语言极简但信息量极大。

5. **《回放第十分钟》**
   分析：简洁的动词命令式，制造了「一定要去看」的迫切感。「第十分钟」的精确性暗示那一刻有什么关键的东西发生了。

6. **《今晚的在线人数比昨晚多了一个》**
   分析：量化到「一个人」的精确性让恐惧具体化——不是「很多鬼」，就是「多了一个」，更加可信和日常。

7. **《我的直播间有固定观众，但他们已经死了》**
   分析：双层信息结构：「固定观众」是温暖的（有忠实粉丝）→「但他们已经死了」是彻底的反转。两个陈述之间的落差制造了叙事张力。

8. **《直播间人气最高的弹幕不是人发的》**
   分析：平台逻辑（「人气最高」）与灵异内容（「不是人发的」）的直接对撞，暗示直播平台的正常机制被异常存在渗透。

9. **《凶宅第九间》**
   分析：极简。「凶宅」+「第九间」的数字序列感，暗示主播已经探过八个凶宅，这是第九个——而第九个将会与前八个不同。

10. **《今晚没有办法下播》**
    分析：「没有办法」表达了主播的绝望和无力，「下播」是极日常的词——「没有办法结束这场直播」的恐惧比「被鬼追着跑」更有现代感。

11. **《在线人数：不详》**
    分析：借用直播平台的UI元素，「不详」作为一个无法被平台统计的数字，暗示有多少非人存在在观看。形式感极强。

12. **《我的观众点亮了一根蜡烛》**
    分析：蜡烛是民间驱鬼的物品——观众为什么要在直播间里点蜡烛？这暗示观众知道主播正面临危险，而且是比主播更早知道的那种危险。

13. **《第三个镜头外的人》**
    分析：「第三个」暗示已经有两个摄像头角度捕捉到了人，现在第三个也发现了——这种数字递增制造了包围感。

14. **《弹幕：你不应该来这里》**
    分析：直接把弹幕格式写进书名，极具现场感。这条弹幕本身就是核心悬念：谁发的？为什么？主播去了哪里？

15. **《最后一场直播》**
    分析：「最后一场」有两种解读：主播选择退出直播行业，或者这是主播活着能播的最后一场。读者无法确定是哪种，这种不确定性是悬念来源。

16. **《死亡热搜第一》**
    分析：「热搜第一」是当代互联网最高流量标志，「死亡」前缀彻底颠覆了这个词的含义。暗示某人的死亡成为了直播内容的顶流。

17. **《打赏到最后，主播才明白那些钱是谁给的》**
    分析：情节型书名，但核心悬念在「才明白」——那些打赏不是普通粉丝给的。长书名在网文平台反而有优势（信息量大，搜索覆盖广）。

18. **《三楼的门从来没有开过，直到今晚》**
    分析：「从来没有开过」建立了历史感，「直到今晚」引入了破局时刻——极简的结构完成了完整的叙事弧起点。

19. **《我的摄像头比我先看到它》**
    分析：直接点明「摄像头先行」的核心叙事逻辑，同时「比我先」暗示了摄像头与主播之间的分离——摄像头仿佛有自己的意识。

20. **《弹幕里有人替我数倒计时》**
    分析：「替我数」暗示主播不知道有什么在倒计时，而某个弹幕账号在静静等待某个时刻到来——信息不对称的恐惧。

---

### 五、章节标题命名规律

灵异直播小说的章节标题设计有三种常见方式，各有优缺点：

#### 方式一：纯「第X场直播」格式

**示例**：
- 第一场直播
- 第二场直播：废弃教学楼
- 第三场直播（完结）

**优点**：强化直播小说的格式感，读者始终清楚「叙事单位」。

**缺点**：过于单调，对读者没有悬念刺激；如果每场结构类似，章节标题失去区分功能。

**适用**：前期建立世界观时可以用，但不宜整本书都用。

#### 方式二：纯叙述式标题（普通小说风格）

**示例**：
- 第一章：开播
- 第二章：弹幕里的陌生账号
- 第三章：那扇门后面

**优点**：每个章节标题都是一个小悬念，增加读者翻页欲望。

**缺点**：「直播感」减弱，与这个类型的风格略有脱节。

**适用**：在章节内容以主播视角叙述为主，而不是强调「直播格式」时。

#### 方式三：混合格式（推荐）

**逻辑**：在直播场次标题中嵌入叙事信息，或者在普通章节标题后加上「直播标注」。

**示例**：
- [第一场直播] 废弃工厂
- [第二场直播] 那个账号来自哪里
- [第三场直播] 凌晨三点，他还在线
- [场外] 主播在想什么
- [回放] 第七场直播，第十二分钟
- [第X场直播] 最后一播

**优点**：
- 保留了「直播单位感」
- 每个章节标题又有叙事信息（悬念、场景、特殊事件）
- 「场外」章节（非直播场景的叙事，比如主播私下的行动）可以用不同的标注格式区分

**特殊章节的标题处理**：
- **直播中断/断流章节**：可以用「[第X场直播 — 中断]」或「[第X场直播 — 断流记录]」
- **主播视角非直播章节**：「[番外]」或「[幕后]」
- **揭示回放彩蛋的章节**：「[回放：第X场第X分钟]」

**章节标题的悬念设计**：
好的章节标题应该在读者看到时产生「这章会发生什么」的好奇，而不是「又是一章」的疲倦。设计原则：
- 用具体细节代替抽象描述（「凌晨三点的外卖骑手」好过「神秘的访客」）
- 有时可以用弹幕格式作为章节标题（「[弹幕：主播别回头]」）
- 标注时间节点有悬念效果（「[第三场直播，第666分钟]」——666分钟的精确性本身就是悬念）',
  '## Ghost Livestream Novel Naming Guide

A book title is a reader''s first impression of a novel and the most direct source of click-through rate. Ghost livestream novel titles need to accomplish a balancing act: they must instantly convey "livestream feel" while carrying enough "supernatural feel" — ideally both simultaneously spark the reader''s curiosity.

---

### I. Naming Style Analysis: Dual Elements of Livestream Feel + Supernatural Feel

#### 1.1 Characteristics of Titles with "Livestream Feel"

"Livestream feel" doesn''t mean stuffing the word "livestream" in — it means the title itself carries these qualities:

- **Immediacy**: Something happening now, not being recalled
- **Number/account feel**: Numbers, IDs, and sequence numbers naturally evoke "account" or "session" associations
- **Internet context**: Mild internet vocabulary or livestream platform-specific terms ("online," "going live," "in stream," "danmaku")
- **Second-person/invocation feel**: The title contains "you" or some kind of summoning tone, making readers feel they are "present"

#### 1.2 Characteristics of Titles with "Supernatural Feel"

"Supernatural feel" in titles isn''t simply adding "ghost," "spirit," or "haunted house" — it''s:

- **Suspension**: The title itself is an unanswered question or a strange statement
- **Folk feel**: Chinese folk custom vocabulary brings a specific texture of fear ("yin-sha," "seven souls," "soul-anchoring," "hundred ghosts")
- **Wrongness**: Normal things juxtaposed with abnormal phenomena ("3 AM food delivery," "the empty classroom schedule")
- **First-person desperation**: The "I" is in an impossible, hopeless situation ("one of my viewers is a dead person")

#### 1.3 How to Fuse the Two Feels

The best ghost livestream titles have **both feels, accomplished through one image**:

- "Subscriber #666" — "666" has a livestream-fan-count feel, "subscriber" is a neutral term, but "666" in Chinese context has demonic-number implications, making the whole title dangerous
- "3 AM, the Live Room Suddenly Hit Capacity" — "3 AM" is a precise livestream-feel timestamp, "hit capacity" is a platform term, but "suddenly" and the overall context makes "capacity" uncanny

---

### II. Four Naming Formulas

#### Formula 1: Streamer-ID Type

**Logic**: The streamer''s account name or stream ID serves as the title or the title''s core element. These titles require the account name to have memorability and supernatural suggestion.

**Design points**:
- Account names can be pure numbers (with some pattern or date implication)
- Account names can be Chinese characters (should have double meaning — ordinary on the surface, supernatural implication beneath)
- Account names must "sound like real streamer IDs," not like character names from a fantasy novel

**Examples**:
- "Stream Room: 0327" — "0327" can be a date (a death case''s date) or just an ordinary account number suffix
- "Late Night House Explorer_Li" — streamer ID format; underscores are common in online usernames
- "Streamer MissLing" — English name + Chinese surname mix, modern influencer style, while "Ling" (灵) means "spirit"

**Taboo**: Account names can''t be too "literary" — "Emissary of the Underworld," "Ghost Realm Explorer" don''t sound like real streamer IDs and break immersion.

#### Formula 2: Session Type

**Logic**: A specific stream session, time node, or particular stream forms the title, emphasizing the livestream context and "present tense" feel.

**Design points**:
- Numbers should be specific (not "the Nth session" but "the 99th session," "the 666th session")
- Time should be precise ("2:47 AM" is more livestream-feel than "late night")
- Session-type titles often imply "one specific stream will change everything"

**Examples**:
- "The Thirty-Seventh Stream Is Starting" — "is starting" creates immediacy; "thirty-seven" is a slightly odd number (not round, not auspicious)
- "2:47 AM, I''m Going Live" — precise time creates unease; streaming at this hour already implies something
- "My 999th Stream" — 999 carries a premonition of "almost over," and 9 has folk associations in Chinese

#### Formula 3: Mystery Type

**Logic**: The title is directly a mystery — a question the reader wants answered, or an incomplete statement.

**Design points**:
- The mystery must linger in the reader''s mind after reading the title ("wait, what does that mean?")
- The answer to the mystery shouldn''t be in the title — readers need the story to find out
- Mystery-type titles have their "hook" in the fact that the title itself reads like a key danmaku comment

**Examples**:
- "Someone in My Live Room Has Never Left" — "has never left" creates a spatially enclosed fear
- "Someone in the Danmaku Knows I''ll Die Tomorrow" — enormous information density, contains conflict, crisis, and time pressure in one sentence
- "They Said That Comment Was Posted By Me" — "they said" creates a sense of dispute, implying the streamer may have lost control of their own actions

#### Formula 4: Contrast Type

**Logic**: Ordinary vocabulary (belonging to normal life) is juxtaposed with a supernatural scenario (belonging to the extraordinary), creating strong cognitive conflict.

**Design points**:
- The ordinary vocabulary must be truly ordinary (not "haunted house," which already carries supernatural connotations)
- The juxtaposition must create a "these two things shouldn''t be together" sense of rupture
- Ideally makes the reader instantly visualize the image — and the image itself is sufficiently wrong

**Examples**:
- "3 AM Food Delivery" — "food delivery" is extremely ordinary; 3 AM + livestream context makes it uncanny
- "Today''s Donations Feel Wrong" — "donations" is a livestream reward term; "feel wrong" is an extreme understatement; the temperature difference between the two creates unease
- "My 1000th Fan" — a non-human entity is hiding among the fans; the title uses the most ordinary number to express the most dangerous meaning

---

### III. Title Taboos: What Kind of Title Makes Readers Not Want to Click

#### Taboo 1: "Keyword Stacking" Titles

**Examples**: "Ghost Livestream Haunted House Exploration," "Horror Streamer Night-Explores Cursed Location," "The Ghost in the Live Room"

**Problem**: These titles write the genre tags directly into the headline — which tells readers "this is a ghost livestream novel." Readers already know that. The title gives them no additional curiosity stimulus.

#### Taboo 2: Overly Literary Titles

**Examples**: "Beyond the Shore the Clouds Disperse," "Mirror of the Underworld," "Silent Ghost Realm"

**Problem**: These titles have the feel of classical horror fiction or xuanhuan fantasy, but are completely disconnected from the modern context of "livestreaming." Readers seeing such titles won''t associate them with danmaku and phone streams.

#### Taboo 3: "Self-Narrating Protagonist" Titles (Too Flat)

**Examples**: "I Am a Ghost-Hunting Livestreamer," "My Streaming Career"

**Problem**: These titles lack tension. They read like a diary entry title, not the opening of a story that makes you want to read on.

#### Taboo 4: Over-Spoiling Titles

**Examples**: "I Eventually Defeated the Ghosts," "The Ghost in My Live Room Is My Fan"

**Problem**: Putting the core mystery into the title means readers know the biggest secret before opening the book. Reading motivation is cut in half.

#### Taboo 5: Too-Obvious Pun Titles

**Examples**: "Ghost Streamer," "Ghost Broadcast"

**Problem**: The pun is too shallow, seen through at a glance, no residual mystery value.

---

### IV. 20 High-Quality Title Examples with Analysis

1. **"Subscriber #666"**
   Analysis: "666th" has a livestream subscriber-count feel, but in Chinese "666" also carries demonic-number associations; "subscriber" is a contemporary platform term — the combination creates immediate suspense of "something is wrong with this subscriber."

2. **"3 AM, the Live Room Suddenly Hit Capacity"**
   Analysis: Precise time "3 AM" (universally recognized as the "ghost hour") + platform term "hit capacity" + the uncontrollable "suddenly" — three elements combine to use the most ordinary words to paint an extreme horror image.

3. **"There''s One Comment in My Danmaku That Was Posted Three Years Ago"**
   Analysis: The temporal paradox of "three years ago" against the immediacy of "danmaku" implies something transcended time to watch the stream.

4. **"He''s Been Online Since the First Session and Has Never Gone Offline"**
   Analysis: Precisely describes "non-human audience" behavior. "Has never gone offline" implies this isn''t real human user behavior — language is minimal but information density is enormous.

5. **"Rewind to the Ten-Minute Mark"**
   Analysis: Concise imperative verb, creating urgency to "go look now." The precision of "ten-minute mark" implies something critical happened at that exact moment.

6. **"Tonight''s Viewer Count Is One More Than Last Night''s"**
   Analysis: Quantified to "one person" precision makes the fear concrete — not "many ghosts," just "one more." More believable and ordinary.

7. **"My Live Room Has Regular Viewers, but They''re Already Dead"**
   Analysis: Two-layer information structure: "regular viewers" is warm (loyal fans) → "but they''re already dead" is total reversal. The gap between the two statements creates narrative tension.

8. **"The Most Active Comment in the Live Room Wasn''t Posted by a Human"**
   Analysis: Platform logic ("most active") directly collides with supernatural content ("not posted by a human"), implying a supernatural entity has infiltrated the normal mechanisms of a streaming platform.

9. **"Haunted House #9"**
   Analysis: Minimalist. "Haunted house" + the sequential number feel of "#9" implies the streamer has already explored eight haunted houses, and this is the ninth — and the ninth will be different from all the others.

10. **"No Way to Go Offline Tonight"**
    Analysis: "No way" expresses the streamer''s desperation and powerlessness; "go offline" is an extremely everyday term — "unable to end this stream" is more modern in its horror than "being chased by a ghost."

11. **"Current Viewers: Unknown"**
    Analysis: Borrows livestream platform UI elements; "unknown" as a number the platform cannot count implies how many non-human entities are watching. Extremely strong formal sense.

12. **"My Viewers Lit a Candle"**
    Analysis: Candles are folk items for warding off ghosts — why would viewers light candles in the live room? This implies viewers know the streamer is in danger, and they knew before the streamer did.

13. **"The Person Outside the Third Camera"**
    Analysis: "Third" implies two camera angles have already captured a person; now a third has too — this numeric escalation creates a sense of encirclement.

14. **"Danmaku: You Shouldn''t Have Come Here"**
    Analysis: Writes the danmaku format directly into the title, creating extreme immediacy. This comment is itself the core mystery: who sent it? Why? Where did the streamer go?

15. **"The Final Stream"**
    Analysis: "Final" has two readings: the streamer chose to quit streaming, or this is the last stream the streamer will be alive for. Readers can''t be certain which — this uncertainty is the source of suspense.

16. **"Death Trending #1"**
    Analysis: "Trending #1" is the highest-traffic marker in contemporary Chinese internet; the "death" prefix completely inverts the term''s meaning, implying someone''s death became the top-viewed livestream content.

17. **"At the Last Donation, the Streamer Finally Understood Who Was Paying"**
    Analysis: Plot-type title, but the core suspense is in "finally understood" — those donations weren''t from ordinary fans. Long titles actually have an advantage on web novel platforms (more information, wider search coverage).

18. **"The Third-Floor Door Had Never Opened Until Tonight"**
    Analysis: "Had never opened" establishes historical weight; "until tonight" introduces the moment of rupture — minimal structure completes a full narrative arc''s starting point.

19. **"My Camera Saw It Before I Did"**
    Analysis: Directly names the "camera-first" core narrative logic; simultaneously, "before I did" implies a separation between camera and streamer — as if the camera has its own consciousness.

20. **"Someone in the Danmaku Is Counting Down for Me"**
    Analysis: "Counting down for me" implies the streamer doesn''t know what''s counting down, while some danmaku account is quietly waiting for a specific moment to arrive — the fear of information asymmetry.

---

### V. Chapter Title Naming Patterns

Ghost livestream novel chapter titles have three common approaches, each with advantages and disadvantages:

#### Method 1: Pure "Session #X" Format

**Examples**:
- Session One
- Session Two: Abandoned School Building
- Session Three (Finale)

**Advantage**: Reinforces the format feel of a livestream novel; readers always know the "narrative unit."

**Disadvantage**: Too monotonous; gives readers no suspense stimulus; if each session has a similar structure, chapter titles lose their distinguishing function.

**Best for**: Early world-building, but shouldn''t be used for the entire book.

#### Method 2: Pure Descriptive Titles (Traditional Novel Style)

**Examples**:
- Chapter One: Going Live
- Chapter Two: The Unknown Account in the Danmaku
- Chapter Three: What''s Behind That Door

**Advantage**: Each chapter title is a small mystery, increasing the reader''s urge to turn the page.

**Disadvantage**: "Livestream feel" diminishes; slightly disconnected from the genre''s style.

**Best for**: When chapter content is primarily told from the streamer''s perspective, without emphasizing the "livestream format."

#### Method 3: Mixed Format (Recommended)

**Logic**: Embed narrative information within session-type titles, or add "stream annotations" after ordinary chapter titles.

**Examples**:
- [Session 1] Abandoned Factory
- [Session 2] Where Did That Account Come From
- [Session 3] 3 AM, Still Online
- [Off-Camera] What the Streamer Is Thinking
- [Replay] Session 7, Minute 12
- [Session X] The Final Stream

**Advantages**:
- Preserves the "session unit feel"
- Each chapter title also carries narrative information (suspense, scene, special event)
- "Off-camera" chapters (non-livestream scenes, such as the streamer''s private actions) can use a different annotation format

**Special chapter title handling**:
- **Stream interruption/cutout chapters**: "[Session #X — Interrupted]" or "[Session #X — Disconnection Log]"
- **Non-livestream streamer POV chapters**: "[Behind the Scenes]" or "[Backstage]"
- **Replay easter egg reveal chapters**: "[Replay: Session #X, Minute #X]"

**Suspense design in chapter titles**:
A good chapter title should trigger "what''s going to happen this chapter" curiosity, not "just another chapter" fatigue. Design principles:
- Use specific details over abstract descriptions ("the 3 AM delivery rider" beats "the mysterious visitor")
- Occasionally use danmaku format as chapter titles ("[Danmaku: Don''t Turn Around, Streamer]")
- Time-node annotations have suspense value ("[Session 3, Minute 666]" — the precision of "666 minutes" is itself a mystery)',
  (SELECT id FROM novel_creation_method WHERE name = '灵异直播小说' LIMIT 1),
  1,
  99,
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
