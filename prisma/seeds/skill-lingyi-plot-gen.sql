-- 民间灵异故事创作「情节设计」领域知识技能（Layer 3）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '民间灵异故事创作' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-lingyi-plot-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'lingyi-plot-gen',
  '「情节设计」领域知识：为民间灵异故事创作提供剧情设计指导，涵盖恐怖节奏把控、氛围营造、悬念递进、信息差管理等典型剧情模式',
  '"Plot Design" domain knowledge: plot design guidance for folk supernatural story creation, covering horror pacing, atmosphere building, progressive suspense, and information gap management',
  '## 「情节设计」领域知识 — 民间灵异故事创作

灵异小说的剧情核心是**通过信息差和未知感制造恐惧与悬念**。与其他类型小说不同，灵异故事的张力不靠实力碾压或权谋博弈，而是靠"已知与未知的边界"：读者和主角越接近真相，恐惧感反而越强。

剧情设计的关键在于：恐怖氛围的节奏控制（张弛有度，不能一直紧绷也不能平淡无奇）、信息的逐步揭示（让读者始终比角色多知道一点或少知道一点）、以及灵异规则的内部自洽。

---

### 典型故事结构

灵异小说通常遵循"发现-调查-真相-对决"的推理式结构：

| 阶段 | 章节占比 | 核心任务 | 典型事件类型 |
|------|---------|---------|-------------|
| **事件引入期** | 10-15% | 建立日常、打破日常、引入灵异元素 | 普通事件 + 伏笔 |
| **调查深入期** | 20-25% | 收集线索、遭遇灵异事件、了解背景 | 转折 + 伏笔 |
| **线索交织期** | 25-30% | 多条线索汇合、真相轮廓浮现 | 转折 + 高潮 |
| **真相揭露期** | 15-20% | 揭示灵异事件的完整真相 | 高潮 |
| **最终对决期** | 10-15% | 解决灵异事件，收束所有线索 | 结局为主 |

**特殊节奏**：灵异小说的恐怖感不是线性递增，而是**波浪式**——紧张→稍缓→更紧张→喘息→最紧张。

---

### 故事线模式

#### 主线（通常 1 条）

- **解谜线**：调查灵异事件的真相（最经典的灵异模式）
- **求生线**：在灵异环境中生存下去
- **超渡线**：帮助冤魂了结执念，平息灵异事件
- **对抗线**：与恶灵/邪修的正面对抗

#### 常见支线

| 支线类型 | 说明 | 与主线的关系 |
|---------|------|-------------|
| **背景故事线** | 灵异事件背后的人间故事（冤死、执念、诅咒的来源） | 揭示真相的核心线索 |
| **人物关系线** | 调查者之间的信任/怀疑关系 | 增加人际层面的紧张感 |
| **民俗知识线** | 风水、道术、民间禁忌等知识应用 | 为解决灵异事件提供方法论 |
| **历史线** | 与灵异事件相关的历史事件或传说 | 背景故事线的延伸和深化 |
| **感情线** | 调查者与相关人物的感情 | 增加人性温度，对比灵异的冰冷 |

---

### 事件编排模式

#### 事件引入期

- **日常建立**：先展示正常生活，让反差感更强
- **第一次异常**：微小但令人不安的征兆（声音、温度、影子）
- **不可解释事件**：第一次确认灵异事件的存在
- **卷入**：主角决定或被迫开始调查
- 事件重要度：1-3（但伏笔重要度可以很高）

#### 调查深入期

- **线索收集**：走访、调查、翻阅资料
- **灵异遭遇**：直接遭遇灵异现象（渐强式，第一次轻微，逐次加重）
- **关键证人/知情者**：找到知道部分真相的人
- **规则发现**：发现灵异事件的运作规则
- 事件重要度：2-4

#### 线索交织期

- **线索碰撞**：不同方向的调查结果汇合，指向同一真相
- **误导与反转**：以为找到真相，却发现是误导
- **危机升级**：灵异事件变得更加危险和频繁
- **同伴危机**：有人受到灵异影响（被附身、被诅咒、失踪）
- 事件重要度：3-5

#### 真相揭露期

- **完整真相**：灵异事件的全部来龙去脉（冤死经过、诅咒来源、执念原因）
- **情感冲击**：真相往往令人唏嘘（冤屈、背叛、无奈）
- **解决方案确定**：找到平息灵异事件的方法
- 事件重要度：4-5

#### 最终对决期

- **终极仪式/对抗**：执行解决方案（超渡、封印、对抗）
- **最后的考验**：过程中的意外和阻碍
- **灵异平息**：事件最终解决
- **余韵**：事件后的反思和影响
- 事件重要度：4-5

---

### 伏笔策略

#### 常用伏笔类型

| 伏笔类型 | 说明 | 埋设时机 | 回收时机 |
|---------|------|---------|---------|
| **环境异常** | 不自然的温度、声音、影子 | 事件引入期 | 调查深入期 |
| **背景故事碎片** | 零散的历史信息拼凑出完整故事 | 调查深入期 | 真相揭露期 |
| **规则暗示** | 灵异事件的规律性暗示其运作法则 | 早期灵异遭遇 | 线索交织期 |
| **人物身份** | 某个"活人"实际上是灵体/被附身 | 调查深入期 | 真相揭露期 |
| **物品线索** | 特定物品（照片、信件、遗物）承载关键信息 | 任意阶段 | 真相揭露期 |

#### 灵异特有的伏笔技巧

- **不可靠叙事**：角色看到的可能不是真实的，营造后期反转空间
- **环境作为角色**：场景本身承载恐怖信息（墙上的痕迹、地板的血迹、镜中的倒影）
- **重复与变异**：同一个灵异现象重复出现但每次都有细微变化，暗示事态在发展
- **民俗伏笔**：民间禁忌和习俗本身就是关于灵异规则的伏笔

---

### 常见错误

1. **恐怖感一次性消耗**：一开始就展示最恐怖的场景，后面无法升级
2. **灵异规则不一致**：同一类灵异现象前后表现矛盾
3. **背景故事薄弱**：灵异事件缺乏令人信服的起源故事
4. **角色愚蠢化**：为了推进剧情让角色做出不合理的危险选择
5. **信息揭示过快**：太早揭示真相，后半程缺乏悬念
6. **恐怖与日常脱节**：灵异事件与角色的日常生活完全割裂，缺乏"身边的恐怖"感
7. **结局过于草率**：最终对决变成简单的法术对轰，缺乏情感和智慧层面的解决',
  '## "Plot Design" Domain Knowledge — Folk Supernatural Story Creation

The core of supernatural novel plots is **creating fear and suspense through information gaps and the unknown**. Unlike other novel types, supernatural story tension doesn''t rely on power crushing or political scheming, but on "the boundary between known and unknown": the closer readers and protagonists get to the truth, the stronger the fear.

The key to plot design: pacing of horror atmosphere (alternating tension and relief), gradual information revelation (keeping readers knowing slightly more or less than characters), and internal consistency of supernatural rules.

---

### Typical Story Structure

Supernatural novels follow a "discovery-investigation-truth-confrontation" detective-style structure:

| Phase | Chapter Ratio | Core Task | Typical Event Types |
|-------|--------------|-----------|-------------------|
| **Event Introduction** | 10-15% | Establish normal life, break normalcy, introduce supernatural elements | Normal events + foreshadowing |
| **Deep Investigation** | 20-25% | Collect clues, encounter supernatural events, learn background | Turning points + foreshadowing |
| **Clue Convergence** | 25-30% | Multiple clue lines merge, truth outline emerges | Turning points + climax |
| **Truth Revelation** | 15-20% | Reveal complete truth of supernatural event | Climax |
| **Final Confrontation** | 10-15% | Resolve supernatural event, close all threads | Mostly resolution events |

**Special pacing**: Horror isn''t linearly increasing but **wave-like** — tense → slight relief → more tense → breathing room → most tense.

---

### Story Line Patterns

#### Main Line (typically 1)
- **Mystery arc**: Investigating the truth of supernatural events (classic supernatural pattern)
- **Survival arc**: Surviving in a supernatural environment
- **Salvation arc**: Helping wronged spirits resolve their obsessions
- **Confrontation arc**: Direct opposition against evil spirits/practitioners

#### Common Branch Lines
| Branch Type | Description | Relationship to Main Line |
|------------|-------------|--------------------------|
| **Backstory** | Human story behind supernatural events (wrongful death, obsession, curse origin) | Core clue to revealing truth |
| **Character relationships** | Trust/suspicion between investigators | Adds interpersonal tension |
| **Folk knowledge** | Feng shui, Daoist arts, folk taboos | Methodology for resolving events |
| **Historical** | Historical events or legends related to supernatural events | Extension of backstory |
| **Romance** | Investigator''s feelings for related characters | Adds human warmth contrasting supernatural coldness |

---

### Event Arrangement Patterns

#### Event Introduction
- Daily life establishment: show normal life for stronger contrast
- First anomaly: small but unsettling signs (sounds, temperature, shadows)
- Unexplainable event: first confirmation of supernatural presence
- Getting involved: protagonist decides or is forced to investigate
- Importance: 1-3 (but foreshadow importance can be high)

#### Deep Investigation
- Clue collection: visits, research, document review
- Supernatural encounter: direct encounter (escalating — first mild, progressively intense)
- Key witness: finding someone who knows partial truth
- Rule discovery: discovering how supernatural events operate
- Importance: 2-4

#### Clue Convergence
- Clue collision: different investigation paths converge toward same truth
- Misdirection and reversal: thinking truth was found, discovering it was misleading
- Crisis escalation: supernatural events become more dangerous and frequent
- Companion crisis: someone affected (possessed, cursed, missing)
- Importance: 3-5

#### Truth Revelation
- Complete truth: full story of supernatural events
- Emotional impact: truth is often poignant (injustice, betrayal, helplessness)
- Solution determined: finding the method to resolve events
- Importance: 4-5

#### Final Confrontation
- Ultimate ritual/confrontation: executing the solution
- Last trial: unexpected obstacles during the process
- Supernatural resolution: event finally resolved
- Aftermath: reflection and lasting impact
- Importance: 4-5

---

### Foreshadow Strategy

| Type | Description | Planting | Resolution |
|------|-------------|----------|------------|
| **Environmental anomalies** | Unnatural temperature, sounds, shadows | Introduction | Investigation |
| **Backstory fragments** | Scattered historical info piecing together full story | Investigation | Truth Revelation |
| **Rule hints** | Regularity of events hinting at operating laws | Early encounters | Clue Convergence |
| **Character identity** | A "living person" is actually a spirit/possessed | Investigation | Truth Revelation |
| **Item clues** | Specific items carrying key information | Any phase | Truth Revelation |

#### Techniques Unique to Supernatural Stories
- **Unreliable narrative**: What characters see may not be real, creating space for later reversals
- **Environment as character**: Settings carry horror information (wall marks, floor bloodstains, mirror reflections)
- **Repetition with variation**: Same supernatural phenomenon repeats but with subtle changes each time
- **Folk taboo foreshadow**: Folk prohibitions and customs are themselves foreshadows about supernatural rules

---

### Common Mistakes

1. **One-time horror consumption**: Showing the most terrifying scene first with nowhere to escalate
2. **Inconsistent supernatural rules**: Same type of phenomenon behaving contradictorily
3. **Weak backstory**: Supernatural events lacking a convincing origin story
4. **Stupefied characters**: Characters making unreasonable dangerous choices to advance the plot
5. **Too-fast information reveal**: Revealing truth too early, lacking suspense in latter half
6. **Horror disconnected from daily life**: Supernatural events completely separated from characters'' daily lives
7. **Rushed ending**: Final confrontation becoming simple spell dueling, lacking emotional and intellectual resolution',

  (SELECT id FROM novel_creation_method WHERE name = '民间灵异故事创作' LIMIT 1),
  1,
  30,
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
