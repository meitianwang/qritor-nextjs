-- 灵异直播小说「灵异体系设定」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '灵异直播小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-lingyi-live-world-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'lingyi-live-world-setting-gen',
  '「灵异体系设定」设定生成：为灵异直播小说生成灵异体系设定，包括灵异体系类型、灵异与直播的关系、核心禁忌、灵异生态、对抗灵异的手段、直播特有规则',
  '"Supernatural System" setting generation: generate supernatural system settings for supernatural livestream horror novels, including supernatural system type, relationship between the supernatural and livestreaming, core taboos, supernatural ecology, means of combating the supernatural, and livestream-specific rules',
  '## 「灵异体系设定」设定生成 — 灵异直播小说

「灵异体系设定」是灵异直播小说最核心的 setting 类型，包含 6 个关键字段。这 6 个字段共同定义了鬼怪存在的规则、与直播媒介的关系，以及人类如何在这套规则下对抗灵异。

---

### 字段生成指南

#### 1. 灵异体系类型

选择体系类型后，需要丰富具体细节，并明确该体系对直播叙事的影响。

**主要体系类型及其直播叙事影响**：

| 体系类型 | 核心逻辑 | 对直播叙事的影响 |
|---------|---------|--------------|
| 中式传统灵异 | 阴阳两界、因果轮回、鬼怪有怨气 | 可结合民俗仪式，驱邪方式有文化厚度；观众弹幕可以「集体祈福」作为剧情资源 |
| 现代都市灵异 | 鬼怪适应了现代社会，会使用科技 | 与直播媒介最契合——鬼怪天然懂得如何操控数字信号和网络平台 |
| 西方克苏鲁风格 | 不可名状的恐惧，理解即疯狂 | 直播让观看者也陷入危险——观看直播本身就是接触恐惧的行为，观看人数越多蔓延越广 |
| 日式怨灵体系 | 强烈的执念，特定的传播方式 | 直播是「录像带诅咒」的现代版——看了直播就会被盯上，算法让诅咒自动扩散 |
| 自创体系 | 完全原创的灵异规则 | 需要在体系内设计与直播深度绑定的原创规则 |

**丰富细节的方向**：
- 鬼怪的起源（是死去的人？是自然能量的凝聚？是另一维度的存在？）
- 鬼怪的弱点（阳光？信仰？特定物品？还是需要主播/观众的特定行为？）
- 灵异能量的来源（阴气？怨念？观看人数产生的「注意力能量」？）

#### 2. 灵异与直播的关系

**这是整个设定最核心的字段**。不同的关系选项带来完全不同的叙事逻辑，必须选择一个并充分展开。

**五种核心关系及叙事效果**：

**① 鬼怪能被摄像头捕捉，但主播肉眼看不见**
- 叙事效果：读者（观众）先于主播发现鬼怪的存在，制造持续的绝望感和「快逃！」的焦虑
- 适合的故事节奏：大量铺垫，观众在弹幕区疯狂预警，主播迟迟不信——然后真的发生了
- 典型场景：「主播在镜头前大笑说这里没有鬼，弹幕区里几千条''它就在你后面''同时刷屏」
- 注意：如果主播太蠢太久，读者会产生「恨铁不成钢」的愤怒，要在合适时机让主播「发现」

**② 鬼怪只在回放中出现，直播实时画面里没有**
- 叙事效果：事后回看才发现，适合让读者「翻前面的内容」——「等等，第三章那个镜头……」
- 适合的故事节奏：每隔几章安排一次「回看发现」的时刻，制造连续的细思极恐
- 典型场景：「主播直播结束后复盘录像，发现有 20 分钟的录像里，镜头后方一直站着一个人」
- 注意：这种关系适合节奏较慢、悬疑为主的故事，不适合希望快速爆发的故事

**③ 直播信号会吸引鬼怪，热度越高越危险**
- 叙事效果：越成功越危险的内在逻辑——主播的事业目标和自保目标产生根本冲突
- 适合的故事节奏：随着直播热度上升，鬼怪活跃度阶梯式增强，形成章节推进的自然动力
- 典型场景：「今天在线人数突破十万，主播笑着说自己要火了，弹幕却全是''快关播''」
- 注意：需要解释为什么信号会吸引鬼怪（阳气聚集？注意力能量？特定频率的电磁波？）

**④ 鬼怪故意利用直播传播，有明确目的**
- 叙事效果：鬼怪变成了「主动的使用者」——它有动机、有计划、有目标，比被动的鬼更可怕
- 适合的故事节奏：随着故事深入逐渐揭露鬼怪的目的，构成长线悬念
- 典型场景：「主播意识到，这个鬼不是随机出现在直播间的——它是特意选择了他的直播间，而且已经等了很久」
- 注意：鬼怪的目的要足够具体（传播诅咒？寻找特定的人？完成某个仪式？）不能是模糊的「为了害人」

**⑤ 观看人数越多，鬼怪越活跃**
- 叙事效果：粉丝成为无意识的助推者——观众在不知情的情况下「喂养」了鬼怪
- 适合的故事节奏：主播在得知真相后面临「停播保命 vs 继续直播」的两难困境，戏剧张力极强
- 典型场景：「主播看着在线人数从一万涨到五万，知道每多一个观众，它就变得更强一分」
- 注意：需要建立「观看行为 = 能量供给」的世界观规则，在早期埋好伏笔

#### 3. 核心禁忌

灵异直播特有的禁忌体系。好的直播禁忌必须与直播行为深度绑定——违反禁忌的代价要在直播场景中体现。

**直播独有禁忌的设计框架**：
- **在摄像头前做了什么**：在镜头前念出名字（给了鬼可循的线索）、在直播中挑衅鬼怪（激怒了本来平静的存在）、在镜头前展示了不该展示的物品（触发了某种规则）
- **直播行为触发的禁忌**：在特定地点直播（本来封印着什么的地方因为直播的光和声音被激活）、在特定时间直播（子时、满月、忌日等）
- **平台行为触发的禁忌**：特定的打赏金额（如 4.4 元、666 元等数字敏感金额）、弹幕中说了不该说的话、截图保存了不该保存的画面

**优秀禁忌示例**：
- 「在直播中不能报出死者的全名——不是因为不敬，而是名字在摄像头前被说出来，就等于向那边递交了一份''邀请函''」
- 「直播时绝对不能关灯——灯光是主播和观众之间连接的媒介，关灯的瞬间，两个世界的边界会模糊三秒」
- 「不能截图直播中的异常画面——截图会让异常『固化』在现实中，被截图的存在会顺着图片找到截图的人」

#### 4. 灵异生态

描述故事中鬼怪的类型，重点设计「会利用直播媒介」的现代感鬼怪。传统灵异中的鬼怪是被动的，而灵异直播中的鬼怪应当是主动的、有意识的、适应了现代媒介的。

**现代感鬼怪类型参考**：

| 类型 | 特征 | 与直播的关系 |
|------|------|------------|
| 数字化怨灵 | 死于网络暴力、直播事故或现代社会的压力 | 以账号形式存在于直播间，通过弹幕和互动表达存在 |
| 流量寄生体 | 不是死人，是一种以注意力为食的存在 | 直播热度越高它越强，主播是它最好的「食物来源」 |
| 镜像鬼 | 能够复制主播的外貌和行为 | 在录像回放中替换了真实主播，而真实主播…… |
| 传播型诅咒 | 类似「贞子」，看了就会被盯上 | 直播录像成为诅咒的载体，算法推荐让诅咒自动扩散 |
| 场所执念 | 固定在特定地点的怨灵 | 主播在该地点直播时触发，在线观众作为「见证者」也被牵连 |
| 被遗忘者 | 曾经存在但被所有人遗忘的亡魂 | 希望通过直播被「看见」，有时是善意的有时是危险的 |

**设计要点**：每种鬼怪都需要解释为什么它与直播这个媒介有特殊关联，不能只是普通的鬼怪碰巧出现在直播里。

#### 5. 对抗灵异的手段

驱邪方法如何与直播系统结合——这是灵异直播最有趣的设定点之一。对抗手段必须与直播互动深度绑定。

**对抗手段与直播系统的结合方式**：

- **打赏道具驱邪**：特定的打赏道具具有真实的驱邪效果——「投喂狗粮」的暖意可以驱散阴气，「燃放烟花」的光亮可以压制阴物，「送上棺材」则会有意想不到的效果。道具的效果要有内在逻辑，不能随意设定
- **弹幕集体力量**：大量正向弹幕可以形成「阳气屏障」，但要引导几万人同时做一件事本身就是挑战——这是剧情冲突的来源
- **关播时机**：关播不只是停止直播，在某些情况下，关播是唯一的驱邪方式——切断信号连接等于封印门户
- **主播自身能力**：主播是否有特殊体质（阴阳眼？家族体质？），以及这种能力是从什么时候开始觉醒的
- **线下物理手段**：传统驱邪工具（朱砂、符咒、铜钱剑）在直播场景中如何使用，以及它们对摄像头捕捉到的灵异是否有效

**注意**：对抗手段不能过于强大——主播不能随时随地轻松驱邪，否则丧失紧张感。手段必须有代价、有限制、有条件。

#### 6. 直播特有规则

这是灵异直播世界独有的互动规则，是整个故事的「世界法则」。这些规则必须是这个世界独有的，不能适用于其他灵异故事。

**设计框架**：

- **平台规则与灵异规则的重叠**：直播平台本身的规则（禁播词、时长限制、实名认证）如何与灵异世界的规则产生意外的交集
- **观众行为规则**：观众的特定行为（刷特定的弹幕、在特定时间进入直播间、连续观看多少分钟）会触发或影响灵异事件
- **算法与灵异的关系**：推荐算法是否有意识？还是被灵异力量操控？算法的「偏好」是否与鬼怪的目的一致？
- **直播时长与风险的关系**：超过多长时间的直播会触发更高级的灵异？还是说特定的直播时长节点（如：整点、第 666 分钟）有特殊意义？

**优秀规则示例**：
- 「在线人数超过某个整数时（一万、十万），灵异等级会自动升一级——这是为什么每次主播快要爆款的时候，总会发生最可怕的事」
- 「直播间的弹幕数量和灵异能量成反比——弹幕越活跃，那边越安静；弹幕突然消失，意味着有什么东西让所有人同时闭嘴了」
- 「被封号的账号不会真的消失——它们会以''[已注销]''的形式留在历史弹幕记录里，而这些账号的主人……未必都是活着注销的」

---

### 生成要点

- 灵异与直播的关系是最核心的字段，必须选择一种并深入展开，不能含糊其辞
- 不同的关系选项带来完全不同的叙事节奏，需要根据故事的整体风格来选择
- 核心禁忌必须与直播行为深度绑定，不能是普通灵异故事的通用禁忌
- 灵异生态重点在于「现代感」——鬼怪要与直播媒介有内在关联
- 对抗手段必须有代价和限制，不能让主播轻松驱邪
- 直播特有规则是整个体系的灵魂，六个字段之间要形成自洽的世界观',
  '## "Supernatural System" Setting Generation — Supernatural Livestream Horror Novel

The "Supernatural System Setting" is the most critical setting type in the supernatural livestream horror novel, containing 6 key fields. These 6 fields collectively define the rules of how ghosts exist, their relationship with the livestream medium, and how humans resist the supernatural within this system.

---

### Field Generation Guide

#### 1. Supernatural System Type

After selecting a system type, enrich it with specific details and clarify how it affects the livestream narrative.

**Main system types and their impact on livestream narratives**:

| System Type | Core Logic | Impact on Livestream Narrative |
|------------|-----------|-------------------------------|
| Traditional Chinese supernatural | Yin-yang divide, karmic cycles, ghosts driven by resentment | Can integrate folk rituals; exorcism methods carry cultural depth; viewer comments can "collectively pray" as a plot resource |
| Modern urban supernatural | Ghosts adapted to modern society; able to use technology | Most compatible with the livestream medium -- ghosts naturally know how to manipulate digital signals and online platforms |
| Western Lovecraftian style | Nameless dread; understanding leads to madness | Livestreaming puts viewers in danger too -- watching the livestream is itself an act of contact; more viewers means wider spread |
| Japanese vengeful spirit system | Intense obsession; specific transmission method | The livestream is a modern version of "the cursed videotape" -- watching gets you targeted; algorithms automatically spread the curse |
| Original custom system | Fully original supernatural rules | Requires designing original rules within the system that are deeply bound to livestreaming |

**Directions for enriching details**:
- The origin of ghosts (the souls of the dead? a condensation of natural energy? beings from another dimension?)
- The weaknesses of ghosts (sunlight? faith? specific objects? or specific actions required of the streamer or viewers?)
- The source of supernatural energy (yin energy? resentment? "attention energy" generated by viewer count?)

#### 2. Relationship Between the Supernatural and Livestreaming

**This is the most critical field in the entire setting.** Different relationship options produce completely different narrative logics. One must be chosen and fully developed.

**Five core relationship types and their narrative effects**:

**① Ghosts can be captured by the camera, but the streamer cannot see them with the naked eye**
- Narrative effect: Readers (viewers) discover the ghost''s existence before the streamer does, creating sustained despair and "run!" anxiety
- Suited pacing: Heavy buildup; viewers go frantic in the comments warning the streamer; the streamer refuses to believe for a long time -- then it actually happens
- Typical scene: "The streamer laughs in front of the camera saying there are no ghosts here, while thousands of comments simultaneously flood the screen with ''it''s right behind you''"
- Note: If the streamer is oblivious for too long, readers will grow frustrated; the streamer must "find out" at the right moment

**② Ghosts only appear in recordings; they are absent from the real-time livestream footage**
- Narrative effect: Discovered only upon review; suited to making readers "flip back through earlier content" -- "Wait, that shot in chapter three..."
- Suited pacing: Arrange a "review and discover" moment every few chapters to create continuous creeping dread
- Typical scene: "After the stream ends, the streamer reviews the recording and finds that for a 20-minute segment, someone has been standing behind the camera the entire time"
- Note: This relationship suits stories with a slower pace and a focus on suspense; not suited for stories aiming for quick explosive moments

**③ The livestream signal attracts ghosts; the higher the trending score, the more dangerous**
- Narrative effect: The more successful, the more dangerous -- the streamer''s career goal and survival goal are in fundamental conflict
- Suited pacing: As the livestream''s trending score rises, ghost activity escalates in tiers, providing a natural engine for chapter progression
- Typical scene: "Today''s viewer count breaks 100,000. The streamer smiles and says they are finally going to blow up -- but the comments are all ''please go offline''"
- Note: An explanation is needed for why the signal attracts ghosts (gathering of yang energy? attention energy? specific electromagnetic frequencies?)

**④ Ghosts deliberately use the livestream to spread, with a clear motive**
- Narrative effect: The ghost becomes an "active user" -- it has motives, plans, and targets; a ghost with agency is more terrifying than a passive one
- Suited pacing: The ghost''s motive is gradually revealed as the story deepens, forming a long-running suspense thread
- Typical scene: "The streamer realizes the ghost did not appear in their livestream room by accident -- it specifically chose their room, and had been waiting there for a long time"
- Note: The ghost''s motive must be specific enough (spreading a curse? looking for a specific person? completing a ritual?) -- not a vague "to harm people"

**⑤ The more viewers watching, the more active the ghost becomes**
- Narrative effect: Fans become unwitting enablers -- viewers "feed" the ghost without knowing it
- Suited pacing: After the streamer learns the truth, they face a stark dilemma of "stop streaming and survive vs. keep streaming" -- extremely high dramatic tension
- Typical scene: "The streamer watches the viewer count climb from 10,000 to 50,000, knowing that with every additional viewer, it grows a little stronger"
- Note: Must establish a worldview rule that "the act of watching = energy supply," with foreshadowing laid early

#### 3. Core Taboos

A system of taboos unique to supernatural livestreaming. Good livestream taboos must be deeply bound to livestream behavior -- the cost of breaking a taboo must be felt within the livestream context.

**Design framework for livestream-specific taboos**:
- **What was done in front of the camera**: Speaking a name aloud on camera (giving the ghost a trail to follow), provoking a ghost during a stream (angering something that was at peace), displaying an item on camera that should not be shown (triggering a rule)
- **Taboos triggered by streaming behavior**: Streaming at a specific location (a sealed presence awakened by the light and sound of the livestream), streaming at a specific time (midnight, full moon, death anniversaries, etc.)
- **Taboos triggered by platform behavior**: Specific donation amounts (sensitive numbers like 4.4, 666, etc.), saying the wrong thing in the comments, taking screenshots of footage that should not be saved

**Good taboo examples**:
- "You must never speak the full name of a deceased person during a livestream -- not out of disrespect, but because a name spoken aloud in front of a camera is equivalent to submitting an ''invitation'' to the other side"
- "The lights must never be turned off during a stream -- the lighting is the medium connecting the streamer to the viewers; in the moment the lights go out, the boundary between the two worlds blurs for three seconds"
- "Never take screenshots of anomalies in a livestream -- screenshots ''solidify'' the anomaly in reality; the existence captured in the screenshot will follow the image back to the person who took it"

#### 4. Supernatural Ecology

Describes the types of ghosts in the story, with emphasis on designing modern-feeling ghosts that exploit the livestream medium. Traditional horror ghosts are passive; ghosts in supernatural livestream stories should be active, conscious, and adapted to modern media.

**Reference types for modern-feeling ghosts**:

| Type | Characteristics | Relationship to Livestreaming |
|------|----------------|-------------------------------|
| Digitized vengeful spirit | Died from cyberbullying, a livestreaming accident, or modern social pressures | Exists within the livestream room as an account; expresses its existence through comments and interactions |
| Traffic parasite | Not a dead person, but a being that feeds on attention | The higher the livestream trending score, the stronger it becomes; the streamer is its best "food source" |
| Mirror ghost | Can copy the streamer''s appearance and behavior | Replaced the real streamer in recorded footage; as for the real streamer... |
| Transmittable curse | Similar to Sadako; watching gets you targeted | Livestream recordings become the vessel of the curse; recommendation algorithms automatically spread it |
| Locale obsession | A vengeful spirit fixed to a specific place | Triggered when the streamer livestreams at that location; online viewers as "witnesses" are also implicated |
| The forgotten | A spirit of someone who once existed but was forgotten by everyone | Wishes to be "seen" through the livestream; sometimes benevolent, sometimes dangerous |

**Design points**: Every ghost type needs an explanation of why it has a special connection to the livestream medium; it cannot simply be an ordinary ghost that happens to appear in a stream.

#### 5. Means of Combating the Supernatural

How exorcism methods integrate with the livestream system -- one of the most interesting setting points in supernatural livestreaming. Combat methods must be deeply bound to livestream interactions.

**Ways combat methods integrate with the livestream system**:

- **Donation item exorcism**: Specific donated items have real exorcism effects -- the warmth of "feeding a virtual pet" disperses yin energy, the brightness of "launching fireworks" suppresses dark entities, "sending a coffin" produces unexpected results. The effects of items must have internal logic; they cannot be set arbitrarily
- **The collective power of comments**: Large volumes of positive comments can form a "yang energy shield," but the challenge of getting tens of thousands of people to do the same thing simultaneously is itself a source of plot conflict
- **The timing of going offline**: Going offline is not just stopping a stream; in certain situations, it is the only exorcism method -- cutting the signal connection is equivalent to sealing a gateway
- **The streamer''s own abilities**: Does the streamer have a special constitution (yin-yang vision? family lineage?)? When did this ability begin to awaken?
- **Offline physical methods**: How traditional exorcism tools (cinnabar, talismans, copper coin swords) are used in a livestream context, and whether they are effective against supernatural entities captured by the camera

**Note**: Combat methods cannot be too powerful -- the streamer must not be able to easily exorcise at will; otherwise, tension is lost. Methods must have costs, limitations, and conditions.

#### 6. Livestream-Specific Rules

These are the interactive rules unique to the supernatural livestream world -- the "world laws" of the entire story. These rules must be exclusive to this world and cannot apply to other horror stories.

**Design framework**:

- **Overlap between platform rules and supernatural rules**: How the livestream platform''s own rules (banned words, time limits, real-name verification) unexpectedly intersect with the rules of the supernatural world
- **Viewer behavior rules**: Specific viewer actions (sending specific comments, entering the livestream room at specific times, watching for a set number of consecutive minutes) trigger or influence supernatural events
- **The relationship between the algorithm and the supernatural**: Is the recommendation algorithm conscious? Or is it manipulated by supernatural forces? Does the algorithm''s "preference" align with the ghost''s objectives?
- **The relationship between stream duration and risk level**: What stream duration triggers higher-tier supernatural events? Or do specific stream duration milestones (e.g., on the hour, minute 666) carry special significance?

**Good rule examples**:
- "When the viewer count reaches a round number (10,000; 100,000), the supernatural threat level automatically increases by one tier -- this is why the most terrifying things always happen whenever the streamer is on the verge of going viral"
- "The number of comments in the livestream room is inversely proportional to supernatural energy -- the more active the comments, the quieter it is on the other side; when comments suddenly go silent, something has made everyone shut up at the same time"
- "Accounts that get banned do not truly disappear -- they remain in the archived comment history as ''[Account Deleted],'' and the people who owned those accounts... did not all choose to delete them while still alive"

---

### Generation Notes

- The relationship between the supernatural and livestreaming is the most critical field; one type must be chosen and developed in depth -- ambiguity is not acceptable
- Different relationship options produce completely different narrative pacing; the choice must align with the story''s overall style
- Core taboos must be deeply bound to livestream behavior; generic taboos from ordinary horror stories are not acceptable
- The focus of supernatural ecology is on "modernity" -- ghosts must have an intrinsic connection to the livestream medium
- Combat methods must have costs and limitations; the streamer must not be able to exorcise easily
- Livestream-specific rules are the soul of the entire system; the six fields must form a self-consistent worldview',
  (SELECT id FROM novel_creation_method WHERE name = '灵异直播小说' LIMIT 1),
  1,
  92,
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
