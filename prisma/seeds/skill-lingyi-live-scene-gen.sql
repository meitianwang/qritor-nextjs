-- 灵异直播小说「探险地点」生成技能
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '灵异直播小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-lingyi-live-scene-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'lingyi-live-scene-gen',
  '灵异直播小说探险地点生成：涵盖地点类型选择、直播吸引力设计、背后历史的因果链、灵异等级与难度匹配、空间布局的叙事功能，以及「直播友好」vs「直播不友好」地点的对比设计，附三个完整地点示例',
  'Ghost livestream novel location generation: covers location type selection, designing the "I want to watch this stream" pull, building causal chains behind the hauntings, matching paranormal tiers to story pacing, how spatial layouts create suspense, and the contrast between livestream-friendly vs. livestream-hostile sites, with three complete location design examples',
  '## 「探险地点」生成 — 灵异直播小说

灵异直播小说的地点设计与传统灵异故事的最大差别在于：地点必须同时满足两个维度——**灵异维度**（这里确实有鬼）和**直播维度**（这里在镜头里看起来足够吸引人）。一个恐怖但画面无聊的地方，在直播叙事里是失败的；一个画面感好但灵异设定浅薄的地方，读完之后没有记忆点。

好的直播探险地点是这两个维度的共鸣：**摄像头捕捉到的东西和那个地方背后的秘密，在某一刻完全重叠**。

---

### 一、地点类型选择

#### 各类型的适用场景与特色设计方向

| 地点类型 | 直播特色 | 灵异特色 | 最适合的故事阶段 |
|---------|---------|---------|--------------|
| **凶宅** | 密闭空间，每个房间都是未知，房屋结构制造天然的「下一个房间」悬念 | 怨念通常聚焦于特定人物/事件，有明确的故事可挖 | 早期建立信任，中期深化 |
| **荒村** | 开阔但孤立，摄像头扫出去全是废墟，空旷反而更恐怖 | 集体事件（村民集体失踪/死亡），怨念弥漫整个空间 | 中期大场面 |
| **废弃工厂** | 工业感强，机械/管道/废弃生产线视觉冲击大，层级复杂 | 工伤/事故怨灵，有明确的「意外」可以调查 | 中期，配合「劳动剥削」主题 |
| **旧医院** | 病房/手术室/太平间——每个空间都承载特定的恐怖记忆，标识性极强 | 死亡密度高，怨灵种类多，「不正常的死亡」最集中的地方 | 中后期，灵异复杂度要求高 |
| **古墓/陵园** | 夜间画面质感极佳，光线稀薄创造极强的摄像头感 | 「惊扰」逻辑——这里的东西不该被打扰，主播的到来本身就是冒犯 | 后期，用于大BOSS对决 |
| **地下空间（防空洞/地下室/管道）** | 摄像头照明范围有限，视觉范围极窄，天然制造「不知道前方是什么」的恐惧 | 封闭空间怨灵，能量聚集，逃脱路径有限 | 任何阶段，制造极端压迫感 |

---

### 二、直播吸引力设计

#### 让读者产生「我也想看这场直播」的感觉

直播吸引力不只是「这个地方恐怖」，而是「这个地方用镜头呈现出来会让人想一直看下去」。三个核心维度：

**画面感**：
- 地点有独特的视觉标识——某种形状的建筑、特定的色调、特殊的光线条件
- 镜头扫过去有「层次」——近景是什么，中景是什么，远景隐约有什么
- 存在「镜头发现但主播没发现」的视觉空间——画面边角、反光面、镜子里、窗户映出的东西

**未知感**：
- 地点的历史在公开资料里是「空白的」——没有照片，没有新闻报道，只有口耳相传的传说
- 地点内部有读者看不到的「禁区」——某个房间没有开门，某个区域摄像头画面突然中断
- 地点对不同的探险者给出不同的「体验」——上一个来这里的人什么都没发现，但画面里清清楚楚有东西

**历史厚度**：
- 地点不是「昨天刚废弃的」，而是有时间层叠——至少跨越两个年代以上
- 地点的废弃本身有故事，不只是「没人住了」：某次事件之后所有人同时离开
- 地点曾经的功能与现在的废弃状态形成强烈对比（曾经热闹的医院走廊 vs 现在连脚步声都会回响）

---

### 三、背后历史设计

#### 灵异直播地点的历史必须是因果链，而不只是「有人死过」

低级地点历史：「这栋楼里有人死过，所以有鬼」

高级地点历史设计框架：

**第一层：事件层**（表面历史，可以查到的部分）
- 几年前发生了什么事？公开记录里怎么写的？
- 这个事件的官方解释是什么？

**第二层：真相层**（隐藏历史，需要调查才能挖到）
- 官方解释是错的/不完整的——真实的原因是什么？
- 谁知道真相但选择了沉默？为什么？

**第三层：怨念层**（灵异起源）
- 死者的怨念指向谁？为什么是这种方式表现？
- 怨念的触发条件是什么——是任何人进入都会触发，还是特定行为/特定身份的人才会触发？

**第四层：解决层**（破除条件）
- 这里的灵异可以被解决吗？需要满足什么条件？
- 解决之后地点会恢复正常，还是「留下了什么」？

---

### 四、灵异等级与难度匹配

#### S/A/B/C 级的具体表现与难度递进安排

| 等级 | 灵异表现 | 直播危险程度 | 建议出现时间 |
|------|---------|------------|------------|
| **C级** | 设备轻微异常（温度波动/偶发噪音），肉眼偶见阴影 | 低，主播有惊无险 | 故事第一幕，建立「这个世界有鬼」的基础 |
| **B级** | 明确的灵异现象（物品移动/声音有来源/有形态的阴影），道具有效 | 中，主播需要使用道具，有轻微受伤可能 | 第二幕，粉丝爆发期 |
| **A级** | 主播直接接触灵异（被触碰/被追逐/出现幻觉），道具消耗快 | 高，不使用道具很可能伤亡 | 第三幕，深水期 |
| **S级** | 空间本身被灵异扭曲，逃脱路径不稳定，道具在某些区域失效 | 极高，甚至道具齐全也可能无法全身而退 | 第四、五幕，最终对决 |

**难度递进的节奏原则**：
- 不要连续安排同级别地点——C→C→B→C→B 会让读者感到疲倦
- 推荐节奏：C→B→C→A→B→S（中间穿插低级地点作为「喘息场次」）
- 喘息场次不等于「什么都不发生」——C级地点里可以埋下A级地点的线索

---

### 五、地形布局的叙事功能

#### 哪些空间布局制造恐惧，如何在直播场景中用空间制造悬念

**走廊**：
- 恐惧来源：走廊尽头是什么？走廊里有什么在走动？
- 直播运用：摄像头对准走廊远端——走廊越长，能看到的范围越窄，悬念越大
- 特殊设计：走廊不对称（一边是门，一边是墙）→只有一个方向可以「有东西」

**地下室**：
- 恐惧来源：下楼梯时背对光源，视野被台阶切断
- 直播运用：摄像头照明范围在台阶下方有死角，观众只能看到有限的范围
- 特殊设计：地下室里有「比外面更多一层门」的结构，套娃式恐惧

**阁楼**：
- 恐惧来源：向上爬时姿势脆弱，无法快速撤退；阁楼的天花板通常很低
- 直播运用：摄像头从阁楼入口向上拍，画面里只有一个缩小的洞口——如果爬上去，退路就在那个洞
- 特殊设计：阁楼的地板不稳定→每一步都是不确定，制造声响也意味着「暴露位置」

**镜子**：
- 恐惧来源：镜子是摄像头能捕捉到「主播看不到的角度」的最强工具
- 直播运用：摄像头经过镜子时，读者在镜中看到了什么？主播没有停下来
- 特殊设计：整面镜墙（如健身房/舞蹈室遗迹）→无论走到哪里，总有一个角度在反射

**封闭房间（被锁的门/被钉死的窗）**：
- 恐惧来源：明明被封死，但里面有声音
- 直播运用：主播在外面描述，摄像头拍着那扇门——然后弹幕开始刷「门把手在动」

---

### 六、「直播友好」vs「直播不友好」地点特征

#### 利用对比制造额外叙事层

**直播友好地点特征**：
- 空间较开放，摄像头视野好
- 有多个「视觉亮点」可以扫到（废弃物品、涂鸦、留下的遗物）
- 自然光源（月光/城市光污染）创造良好的低光画面
- 地点本身有「故事性」——看到的东西会让人想知道「这是怎么发生的」

**直播不友好地点特征**：
- 完全封闭，设备信号差（直播延迟、画面卡顿）
- 地形复杂，摄像头频繁晃动
- 地点的灵异针对设备本身（干扰电磁场、让摄像头自动关闭）
- 空间太暗，补光灯都无济于事

**如何利用「不友好」制造叙事价值**：
- 信号中断本身是恐惧来源——直播间突然断线，弹幕的最后一条是「主播…？」
- 设备故障作为「灵异存在确认」——理性观众不能用「光线问题」解释摄像头自动关闭
- 「不友好」地点的探险更能体现主播的专业度——他知道在信号差的环境下如何应对

---

### 七、完整地点设计示例

#### 示例一：「泰安里29号」（B级凶宅）

**基本信息**
- 类型：凶宅（六层住宅楼，独栋）
- 地点特色：建于1970年代的老式筒子楼，位于已被拆迁的旧城区，周围已全部清空，只剩这一栋

**直播吸引力**
- 画面感：六层外墙布满爬山虎，夜间摄像头拍出来是深绿和黑色的交织；楼道里的老式铁栅栏扶手在补光灯下投出网格状阴影
- 未知感：拆迁时所有住户在三天内撤离，官方公告是「管道老化危险」，但附近居民说当时撤离的人都不说话，一声不吭地走
- 历史厚度：楼里有十多年前的报纸、还没收走的家具，某些房间的日历停在同一天

**历史因果链**
- 表面历史：2009年，住在4楼的一户人家在一夜之间全部失踪，至今没有下落
- 真相：失踪一家不是被鬼害的——是因为他们发现了整栋楼的秘密（楼的地基下有一个封死的空间），准备举报，被人为「处理」
- 怨念来源：被封死在地基空间里的不是「人造的」秘密，而是楼建造时不知情挖到的旧物，那个旧物已经存在了很久，从人们进入那个空间时就开始「累积」
- 解决条件：不能驱邪——那个东西不是「怨灵」，是比怨灵更古老的存在。唯一解法是「封回去」，而封回去需要找到当年封它的人的后代

**灵异规则**
- 在这栋楼里，所有设备必须关闭声音——任何声音都会吸引它的注意
- 4楼以上可以安全活动，地下室和1楼不能久留
- 摄像头在这里工作正常，但录到的画面比实际看到的多

**直播视角设计**
- 弹幕会比主播先看到画面里的异常——这里的「东西」不避开镜头，但不在主播肉眼可见的范围内活动
- 某次直播中，一个「一直在线」的账号突然说「不要去地下室，那是它的眼」——这句话在后来被证实有字面意义

---

#### 示例二：「红星化工厂」（A级废弃工厂）

**基本信息**
- 类型：废弃化工厂
- 地点特色：1980年代建造，1998年发生爆炸事故后停产，位于城市郊区，占地极大，有主厂房、储罐区、宿舍楼三个区域

**直播吸引力**
- 画面感：化工储罐在夜间有反光金属质感；主厂房内部有五层楼高的机械装置，摄像头向上看时是极强的压迫感
- 未知感：三个区域之间有废弃传送管道连接，但没有地图——不知道走到哪里会通往哪里
- 历史厚度：宿舍楼里的房间仍有工人遗留的物品，有些房间的床单还在，好像「随时可以睡下来」

**历史因果链**
- 表面历史：1998年爆炸，官方记录死亡17人，伤亡原因是「操作不规范」
- 真相：死亡人数不是17人——爆炸时厂里还有一批「不在编制里」的工人，他们的死亡从未被记录
- 怨念来源：这批工人的怨念不是指向「爆炸」，而是指向「被抹去」——他们的愤怒是「我们存在过，为什么没有人知道？」
- 解决条件：找到被抹去的名单，公之于众。但名单在某个人手里，那个人还活着

**灵异规则**
- 宿舍区相对安全（他们不针对「普通的陌生人」）
- 主厂房内，人的行动会影响机械装置——某些机器在有人靠近时会「启动」，但不是真正的通电，是怨念的表现
- 直播设备在储罐区信号极差——那里是能量最集中的地方，也是未被记录工人的主要死亡区域

**直播视角设计**
- 这里的「东西」知道什么是摄像头——它会出现在镜头里，但只是影像，不是实体
- 某次探险中，主播在某个宿舍房间找到一张名单，上面有名字——但后来发现，名单上有一个名字的笔迹和当天弹幕里某个账号的ID一模一样

---

#### 示例三：「白溪村」（S级荒村）

**基本信息**
- 类型：荒村（整村废弃）
- 地点特色：隐藏在山区的小村庄，1980年代的老建筑，通向村子的路在某个节点完全被植被覆盖，需要徒步两小时才能进入

**直播吸引力**
- 画面感：荒村有一种「时间停止」的静止感——牌匾还在，神龛还在，石磨还在，但没有人；夜间完全没有人工光源，摄像头热成像和夜视两种模式下呈现完全不同的画面
- 未知感：关于这个村子的资料极少，只有一张1970年代的黑白照片，照片里的人都面朝同一个方向
- 历史厚度：村子的废弃不是近年的事，但没有人能说清楚确切的年份

**历史因果链**
- 表面历史：没有任何公开记录——这个村子在行政上似乎从来没有存在过
- 真相：村子并没有「废弃」，村民也没有「离开」。他们在某个特定的夜晚，以某种集体的方式，选择了「留下来」。他们的身体不在，但他们的存在没有消失
- 怨念来源：这里没有怨恨，有的是「执念」——他们在等一件事完成，但那件事的条件在很久以前就断了，他们不知道
- 解决条件：找出他们在等什么，帮他们完成——或者告诉他们，那件事永远不会完成了，让他们「知道」

**灵异规则**
- 这里的「东西」不攻击人，但也不让人离开——当你想往外走时，路总是绕回村子
- 进入村子后，摄像头的时间戳会发生偏移——录下来的时间和实际时间不一致
- 只要待在村子里超过一定时间，「它们」就会开始认为你是「村民」——这时候离开就更难了

**直播视角设计**
- 这是唯一一个让观众产生「我们也被困住了」感觉的地方——因为读者也在「观看」这个村子，某种程度上他们也「在场」
- 某个时刻，直播间弹幕里出现了一条：「你们别来了，快走」——发这条弹幕的账号注册于三十年前

---

### 与已有设定的联动

| 设定模块 | 对地点的影响 |
|---------|------------|
| **直播等级体系** | 灵异等级定义地点难度；主播当前能力决定可探险等级上限 |
| **打赏道具系统** | 地点的灵异特性决定哪些道具有效、哪些无效；道具失效区域需要在地点设计时标注 |
| **非人观众角色** | 地点的历史可能与非人观众的身份直接关联——某个账号「一直在线」的原因可能藏在地点设计里 |
| **故事阶段** | 故事推进程度决定地点等级；第一幕不应出现S级地点 |

---

### 常见错误

1. **地点只有「氛围」没有「规则」**：恐怖氛围浓厚但地点内没有可推理的规则，读者缺乏代入感
2. **历史太单薄**：「有人死过」就完了，没有因果链，鬼怪的怨念没有具体指向
3. **所有地点都是「废弃建筑」**：缺乏类型多样性，读者审美疲劳
4. **直播友好度没有区分**：每个地点的摄像头都工作正常，缺失了「设备故障作为灵异确认」的叙事工具
5. **等级分布不合理**：前期安排S级地点，读者对威胁程度没有基准参照
6. **地点彼此孤立**：每个地点都是独立副本，地点之间没有历史或人物上的关联
7. **空间布局只是「恐怖的描述」**：没有把空间结构用作叙事工具（走廊/地下室/阁楼的独特叙事功能被浪费）',
  '## "Exploration Location" Generation — Ghost Livestream Novel

The key difference in location design for ghost livestream novels versus traditional horror is that locations must satisfy two simultaneous dimensions: **the paranormal dimension** (there really are ghosts here) and **the livestream dimension** (this place looks compelling enough on camera to hold a viewer''s attention). A terrifying location with boring visuals fails in this narrative format; a visually rich location with shallow supernatural design leaves no lasting impression.

A great ghost livestream location is a resonance between both dimensions: **what the camera captures and what the location''s secret conceals fully overlap at a single moment**.

---

### I. Location Type Selection

#### Each Type''s Applicable Scenarios and Design Direction

| Location Type | Livestream Strength | Paranormal Strength | Best Story Stage |
|--------------|---------------------|---------------------|-----------------|
| **Haunted House** | Enclosed space; every room is an unknown; natural "what''s in the next room" tension | Resentment focused on specific person/event; clear story to excavate | Early stages for trust-building, mid-story for deepening |
| **Abandoned Village** | Wide but isolated; camera panning across ruins; emptiness is more frightening than clutter | Collective event (mass disappearance/death); resentment diffused through the entire space | Mid-story large-scale scene |
| **Derelict Factory** | Strong industrial visual — machinery, pipes, abandoned production lines; complex vertical layers | Industrial accident spirits; specific "incident" to investigate | Mid-story, pairs with labor exploitation themes |
| **Old Hospital** | Wards, operating rooms, morgue — every space carries specific horror memory | High density of death; multiple types of spirits; highest concentration of "unnatural death" | Mid-to-late, requires high paranormal complexity |
| **Ancient Tomb / Cemetery** | Excellent nighttime camera texture; sparse lighting creates strong "camera seeing in the dark" feel | "Disturbance" logic — what''s here shouldn''t be disturbed; the streamer''s arrival is itself a transgression | Late stages, for final confrontations |
| **Underground Spaces (bunkers, basements, tunnels)** | Limited camera illumination range, extremely narrow field of view; naturally creates "unknown ahead" terror | Enclosed resentment; concentrated energy; limited escape routes | Any stage; creates extreme claustrophobic pressure |

---

### II. Designing Livestream Appeal

#### Creating the "I Want to Watch This Stream" Pull

Livestream appeal is not just "this place is scary" — it''s "this place, captured on camera, makes viewers want to keep watching." Three core dimensions:

**Visual Composition**:
- The location has a unique visual identity — a distinctive architectural form, specific tones, special lighting conditions
- The camera sees in layers — what''s in the foreground, what''s in the mid-ground, what''s faintly visible in the background
- Space exists for "camera sees / streamer doesn''t" — frame edges, reflective surfaces, mirrors, windows showing reflections

**Sense of the Unknown**:
- The location''s history has "blank spots" in public records — no photos, no news coverage, only word-of-mouth legend
- There are unseen "forbidden zones" inside — a door that won''t open, a section where the camera feed cuts out
- The location gives different "experiences" to different explorers — the last person to come here found nothing, but the camera clearly shows something

**Historical Depth**:
- The location wasn''t "just abandoned recently" — it has layered time, spanning at least two distinct eras
- The abandonment itself has a story: it wasn''t simply "no one lives here anymore" but rather "after one particular event, everyone left at once"
- The location''s former function creates stark contrast with its current dereliction (a once-busy hospital corridor now echoes with every footstep)

---

### III. Backstory Design

#### Location Histories Must Be Causal Chains, Not Just "Someone Died Here"

**Weak location history**: "Someone died in this building, so there''s a ghost"

**Four-Layer History Design Framework**:

**Layer 1 — Event Layer** (surface history; findable through research):
- What happened here, and when? What do public records say?
- What is the official explanation for the event?

**Layer 2 — Truth Layer** (hidden history; requires investigation):
- The official explanation is wrong or incomplete — what actually happened?
- Who knows the truth and chose silence? Why?

**Layer 3 — Resentment Layer** (paranormal origin):
- Who does the dead person''s resentment target? Why does it manifest in this particular way?
- What triggers the haunting — does any visitor trigger it, or only specific behaviors or identities?

**Layer 4 — Resolution Layer** (conditions for breaking the haunting):
- Can the paranormal here be resolved? What conditions are required?
- After resolution, does the location return to normal, or does something remain?

---

### IV. Paranormal Tier and Difficulty Matching

#### S/A/B/C Tiers and Pacing the Escalation

| Tier | Paranormal Manifestation | Livestream Danger Level | Recommended Story Position |
|------|------------------------|------------------------|---------------------------|
| **C-Tier** | Minor device anomalies (temperature fluctuation, occasional noise), eye occasionally sees shadows | Low; streamer startled but unharmed | Act One; establishes "ghosts are real" baseline |
| **B-Tier** | Clear paranormal phenomena (objects move, sounds have origin, shadows have form), items effective | Medium; streamer must use items; minor injury possible | Act Two; viewer explosion phase |
| **A-Tier** | Streamer directly encounters the supernatural (touched, chased, hallucinations), items depleted quickly | High; no items likely means casualties | Act Three; deep water phase |
| **S-Tier** | Space itself distorted; escape routes unstable; items ineffective in certain zones | Extreme; even full item loadout may not ensure survival | Acts Four and Five; final confrontations |

**Pacing Principles for Difficulty Escalation**:
- Don''t stack same-tier locations consecutively — C→C→B→C→B creates reader fatigue
- Recommended pattern: C→B→C→A→B→S (intersperse lower-tier locations as "breather sessions")
- Breather sessions ≠ "nothing happens" — a C-tier location can carry foreshadowing for an A-tier location

---

### V. Spatial Layout as Narrative Tool

#### Which Space Configurations Create Fear, and How to Use Them in Livestream Settings

**Corridors**:
- Fear source: What''s at the end of the corridor? What''s moving in it?
- Livestream use: Camera aimed at the far end of the corridor — the longer the corridor, the narrower the visible range, the higher the tension
- Special design: Asymmetric corridor (doors on one side, blank wall on the other) → only one direction can contain something

**Basement**:
- Fear source: Descending stairs means turning your back to the light source; sightline is cut off by each step
- Livestream use: Camera illumination has a blind spot below the stairs; viewers see only a limited field
- Special design: Basement with "one more door inside" — nested-room horror that keeps going deeper

**Attic**:
- Fear source: Climbing posture leaves you vulnerable; retreat is slow; ceilings are usually low
- Livestream use: Camera shooting up through the attic hatch — viewers see only a shrinking square of darkness; once the streamer climbs in, the exit is that hatch
- Special design: Unstable floorboards → every step is uncertain; making noise also means revealing your position

**Mirrors**:
- Fear source: Mirrors are the strongest tool for capturing "angles the streamer can''t see" on camera
- Livestream use: As the camera passes a mirror, what do viewers see in the reflection that the streamer doesn''t stop to notice?
- Special design: Full mirror walls (gym or dance studio remnants) → wherever you stand, some angle reflects back

**Sealed Rooms (locked doors, nailed-shut windows)**:
- Fear source: Clearly sealed, but sounds come from inside
- Livestream use: Streamer describes it from outside, camera fixed on the door — then the danmaku starts flooding with "the door handle is moving"

---

### VI. Livestream-Friendly vs. Livestream-Hostile Location Features

#### Using the Contrast as an Additional Narrative Layer

**Livestream-Friendly Features**:
- Relatively open spaces; camera has good sightlines
- Multiple visual focal points to sweep across (abandoned objects, graffiti, left-behind possessions)
- Natural ambient light (moonlight, city light bleed) creates quality low-light footage
- The location itself has "narrative pull" — what you see makes you want to know "how did this happen"

**Livestream-Hostile Features**:
- Completely enclosed; poor device signal (stream lag, image freeze)
- Complex terrain; camera shakes constantly
- The paranormal specifically targets equipment (interfering with electromagnetic fields, causing cameras to auto-shut)
- Extremely dark; supplemental lighting makes no difference

**How to Turn "Hostile" Into Narrative Value**:
- Signal cutout is itself a fear source — the stream suddenly drops; the last danmaku before the cut is "Streamer...?"
- Equipment failure as paranormal confirmation — rational viewers cannot explain "camera auto-shuts" as lighting issues
- "Hostile" site exploration demonstrates the streamer''s professional capability — showing how they handle environments with bad signal

---

### VII. Complete Location Design Examples

#### Example 1: "Tai''an Li No. 29" (B-Tier Haunted Building)

**Basic Info**: A six-story residential tower from the 1970s; stands alone in a cleared urban renewal zone; all surrounding buildings already demolished.

**Livestream Appeal**: The exterior is covered in ivy; at night the camera shows deep green and black intertwining. The building''s old iron-grate stair railing casts grid shadows under the supplemental light. All residents evacuated within three days when redevelopment was announced — the official reason was "pipe deterioration hazard," but neighbors say the evacuating residents left in complete silence.

**Causal Chain**: In 2009, a family on the 4th floor disappeared overnight. They had discovered something sealed beneath the building''s foundation. Before they could report it, they were "handled." What''s in that sealed basement space isn''t a human ghost — it''s something older, something the original construction crew inadvertently unearthed and sealed back up. It''s been accumulating ever since.

**Resolution Condition**: Cannot be exorcised — it''s not a vengeful spirit. The only solution is to re-seal it, which requires finding a descendant of the original person who sealed it.

**Paranormal Rules**: All devices must be silenced — any sound draws its attention. The 4th floor and above are relatively safe; basement and 1st floor cannot be occupied for long. Camera equipment functions normally here, but footage captures more than the naked eye sees.

---

#### Example 2: "Red Star Chemical Plant" (A-Tier Derelict Factory)

**Basic Info**: Built in the 1980s; shut down after a 1998 explosion; three distinct zones — main factory floor, storage tank area, worker dormitories.

**Livestream Appeal**: Chemical storage tanks have reflective metal surfaces at night; the main factory floor has five-story-tall machinery — shooting upward with the camera creates extreme vertical oppression. The dormitory rooms still contain workers'' belongings; some rooms still have their bedsheets, as if someone could sleep there tonight.

**Causal Chain**: The official death count was 17. The actual number was higher — an unregistered workforce was also in the plant at the time. Their deaths were never recorded. Their resentment isn''t directed at the explosion; it''s directed at erasure — "We existed. Why does no one know?" Resolution requires finding the suppressed name list and making it public. The person who has it is still alive.

**Paranormal Rules**: Dormitory area is relatively safe. In the main factory, human movement "activates" machinery — not through electricity, but through resentment. Signal in the tank area is extremely poor; that''s where energy is most concentrated.

---

#### Example 3: "Baixi Village" (S-Tier Abandoned Village)

**Basic Info**: A mountain-hidden village; 1980s construction; the path to the village is completely overgrown past a certain point; requires two hours on foot.

**Livestream Appeal**: The village has a "time stopped" quality — plaques still hang, altars still stand, stone grinders remain, but no one is there. At night there''s zero artificial light; the camera in thermal imaging and night vision modes shows completely different images. Almost no documentation of this village exists — only one black-and-white photograph from the 1970s, in which every person faces the same direction.

**Causal Chain**: No public records exist — this village seems never to have officially existed. The villagers didn''t "abandon" it and didn''t "leave." On one specific night, in some collective way, they chose to "remain." Their bodies are gone; their presence is not. They''re waiting for something to be completed — but the conditions for that completion broke down long ago. They don''t know.

**Resolution Condition**: Find what they''re waiting for, and either help them complete it — or tell them it will never be completed, so they can "know" and let go.

**Paranormal Rules**: Nothing here attacks people, but nothing lets people leave — every path out circles back to the village. After entering, the camera timestamp shifts out of sync with real time. Stay too long and the entities begin treating you as a "villager" — making leaving even harder.

**Livestream Design**: This is the only location that gives readers a "we are also trapped" feeling, because readers are also "watching" this village — in some sense, they too are present. At one moment, the danmaku shows: "Don''t come here. Leave now." The account that posted it was registered thirty years ago.

---

### Setting Linkage

| Setting Module | Impact on Locations |
|---------------|---------------------|
| **Livestream Tier System** | Paranormal tier defines location difficulty; streamer''s current capability caps accessible tier |
| **Donation Item System** | Location''s paranormal characteristics determine which items are effective; item-null zones should be marked in location design |
| **Non-Human Viewer Characters** | Location history may directly tie to a non-human viewer''s identity — a watching account''s reason for being there may be buried in the location design |
| **Story Stage** | Narrative progression determines location tier; S-tier should not appear in Act One |

---

### Common Errors

1. **Location has atmosphere but no rules**: Heavy horror atmosphere without deducible rules; readers can''t engage analytically
2. **Backstory too shallow**: "Someone died here" with no causal chain; ghost resentment has no specific target
3. **Every location is an "abandoned building"**: No type diversity; readers experience aesthetic fatigue
4. **No differentiation in livestream-friendliness**: Camera works perfectly everywhere; losing the narrative value of "equipment failure as paranormal confirmation"
5. **Tier distribution is irrational**: S-tier location in Act One; readers have no baseline for threat calibration
6. **Locations exist in isolation**: Each location is a standalone dungeon with no historical or character connections between them
7. **Spatial layout is only descriptive**: The unique narrative functions of corridors, basements, and attics are left unused as design tools',
  (SELECT id FROM novel_creation_method WHERE name = '灵异直播小说' LIMIT 1),
  1,
  95,
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
