-- The Protagonist Hunter「场景」生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Protagonist Hunter' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-protag-hunter-scene-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'protag-hunter-scene-gen',
  '「场景」生成：为 The Protagonist Hunter 生成战略性场景设计，包括场景的双重意义（原著意义+现实意义）、圣地抢占机制、禁地场景设计，以及场景控制状态变化的处理',
  '"Scene" generation for The Protagonist Hunter: generate strategic scene designs including dual scene significance (canon meaning + reality meaning), sacred site seizure mechanics, forbidden zone scene design, and scene control state transitions',
  '## 「场景」生成 — The Protagonist Hunter

猎杀主角小说的场景设计有其独特的战略维度。每一个重要场景不仅仅是故事发生的物理背景，更是原著命运与现实角力的战场。设计场景时，必须同时思考两个问题：**这个场景在原著中是什么意义？**以及**在猎手干预后，这个场景会成为什么？**

---

### 一、场景的双重意义框架

#### 原著意义层（Canon Significance）

每个重要场景在原著小说中都有其预定的叙事功能：

- **成长圣地**：勇者在这里获得关键机缘（神器、觉醒、导师传承）。在原著里，这是正面的、充满希望的场景。
- **试炼战场**：勇者在这里面对强大的挑战，并通过克服挑战实现成长。这类场景在原著里是张力最高的部分。
- **情感锚点**：勇者在这里经历对其价值观产生深远影响的事件（伙伴牺牲、民众感激、誓言立下）。这类场景是勇者人格塑造的核心。
- **节点地标**：原著的重大剧情转折发生在这里。离开这个场景，故事进入下一个阶段。

#### 现实意义层（Reality Significance）

猎手的存在使同一个场景产生了完全不同的现实含义：

- **猎杀阵地**：猎手提前控制的场景，用于设置陷阱、部署力量、伏击勇者
- **博弈棋盘**：猎手与勇者争夺控制权的场景，双方都试图在这里获得战略优势
- **已失失地**：猎手本想控制但未能成功的场景，勇者已经在此建立了优势
- **禁区缓冲**：猎手刻意回避的场景，因为这里的冲突会触发不利于猎手的原著机制

---

### 二、圣地抢占（Sacred Site Seizure）机制

圣地抢占是猎杀主角小说中最具代表性的场景设计模式之一。其核心操作是：**主角抢先到达勇者应得的地点，剥夺其应得的机缘。**

#### 设计圣地的三要素

**要素1：抵达窗口期**
- 圣地的机缘有一个"激活窗口"——在某个特定时间段内，特定条件满足时，机缘才会可用
- 设计要点：窗口期不能太宽（否则猎手可以从容准备），也不能太窄（否则猎手几乎不可能赶到）
- 理想窗口期：制造紧迫感，同时给猎手留下通过极限操作抢先的可能性
- 示例："大陆东方的风之神殿，只有在春分日、晨曦降落时，圣风才会赐予能人神典『风御』——原著中勇者在第12章赶到，我需要在此之前就控制这个神殿"

**要素2：先到者获取方式**
- 机缘并非总是"先到先得"的简单逻辑，设计时需要考虑：
  - 机缘是否有"命运认证"机制（只有被天命选中的人才能使用）？
  - 机缘被猎手取走后，勇者会获得何种替代品？
  - 取走机缘的方式：直接占有、消耗销毁、污染使之不可用、转化为对猎手有用的形式
- 示例分支：
  - 神器可以被任何人持有 → 猎手直接取走，成为自己的武器
  - 神器有命运绑定，非勇者持有会有排异反应 → 猎手选择销毁或封印，而非持有
  - 神器的力量是场景专属（只在神殿中有效）→ 猎手控制神殿本身，而非神器

**要素3：抢占后的场景状态**
抢占行动完成后，场景会进入一种新的状态，设计者需要明确：
- 勇者到达后发现什么？（空场景、猎手留下的痕迹、猎手本人在等待）
- 场景内的NPC会如何反应？（向勇者告知真相、被收买保持沉默、被清除）
- 这个抢占行动是否会在勇者心中留下对"某个敌人"的意识？

---

#### 圣地抢占的战略矩阵

| 抢占目的 | 场景状态 | 后续效果 | 风险 |
|---------|---------|---------|-----|
| 获取神器自用 | 场景空置，神器消失 | 猎手实力提升，勇者失去预定机缘 | 勇者开始追查神器下落，可能追溯到猎手 |
| 销毁神器 | 场景被破坏 | 勇者的力量成长路径发生偏转 | 命运补偿效应激活，勇者可能获得等价替代 |
| 控制守护者 | 场景表面正常，但内部已换主 | 可以向勇者传递错误信息或伏击 | 守护者被勇者的社交光环影响，可能反水 |
| 建立前哨 | 场景变成猎手势力地盘 | 战略性地点被控制，可以监视勇者动向 | 正义势力可能"解放"此地，引发冲突 |

---

### 三、禁地场景（Forbidden Zone Scenes）设计

禁地是**不在原著主线剧情中的隐藏地点**——它们存在于原著世界，但由于勇者的剧情从未涉及，猎手对这些地点的了解也是空白。禁地是猎手"先知优势"的盲区，同时也是绕过主角光环干预的机会。

#### 禁地的三种类型

**类型A：原著省略地带（Omitted Zones）**
原著作者选择不描写的地方——可能是偏远地区、地下世界、异次元空间，或者原著主线从未经过的政治势力腹地。
- 特点：猎手对此一无所知，但这些地方可能蕴含原著未曾提及的古老力量、秘密组织或特殊资源
- 风险：进入此地等于猎手失去预知优势，必须完全依靠当场判断
- 机会：勇者也不知道这些地方，双方在信息上处于平等位置——对战略灵活的猎手更有利

**类型B：已知地点的未知层（Hidden Layers of Known Sites）**
原著有描写的地方，但原著仅展示了其表面——比如一座城市的地下秘密、一个神殿的禁室、一位NPC家中隐藏的房间。
- 特点：猎手知道这个地方存在，但不知道这个地方的全部内容
- 机会：原著曾经展示的部分为猎手提供了进入路径，隐藏的部分则提供了惊喜
- 示例："王城图书馆在原著中有过两次戏份——但我作为前世的读者知道，原著从没有展示过地下三层。也许那里有什么……"

**类型C：主角干预催生的新地点（Intervention-Generated Sites）**
由于猎手的行动，某些在原著中不存在（或不重要）的地点变得具有战略意义。
- 示例：猎手建立了一个秘密据点，这个据点的位置在原著中是一片废弃的仓库，如今成了猎手势力的核心基地
- 特点：猎手对这个地点最熟悉，但这也意味着它在原著参照中没有任何保护——如果勇者或其他势力发现它，猎手没有预知能力来预判

---

#### 禁地的叙事功能

设计禁地场景时，明确其在故事中的功能：

1. **信息突破口**：猎手在禁地中发现了原著从未透露的关键信息，改变了整个猎杀策略的方向
2. **力量储备点**：禁地中有原著勇者从未触及的古老力量，猎手获取后改变了实力对比
3. **庇护所**：当猎手处于危险时，禁地是躲避追击的最后防线（勇者不知道此地的存在）
4. **叙事盲盒**：禁地本身是读者和猎手共同面临的未知，制造真实的探索感和悬念

---

### 四、场景控制状态变化

每个重要场景都有一个"控制状态"，随着故事发展会发生变化。设计时需要追踪这种变化：

#### 控制状态分类

**无主状态（Unclaimed）**
- 场景尚未被任何主要势力掌控
- 对猎手意味着：机会（可以抢先布局）和风险（未知）

**猎手控制（Hunter-Controlled）**
- 猎手已经在此建立存在，可以主动选择如何利用此地
- 对猎手意味着：战略优势，但也是需要防御的负担

**勇者掌握（Hero-Controlled）**
- 勇者已经与此地建立连接，在此获得了机缘或建立了据点
- 对猎手意味着：此地是勇者的优势区域，正面争夺成本极高

**争议状态（Contested）**
- 两方势力都在此地有存在，但都没有完全控制
- 是最具张力的状态，也是剧情高潮最容易发生的地方

**失控状态（Lost Control）**
- 猎手曾经控制但已经失去的场景
- 对猎手意味着：不仅失去了战略资产，还可能为勇者提供了反制情报

#### 状态转换的触发条件

设计状态转换时，明确每次转换的触发条件、代价和结果：

- **无主 → 猎手控制**：猎手通过何种行动（秘密渗透/武力占领/政治谈判）完成控制？
- **猎手控制 → 争议状态**：勇者或正义势力如何发现并介入？
- **争议状态 → 勇者掌握**：是什么事件让天平最终倒向勇者？猎手付出了什么代价？
- **猎手控制 → 失控状态**：内部背叛？外部突袭？猎手自身策略失误？

---

### 五、场景设计的战略一致性原则

每个场景设计完成后，需要通过以下问题验证其战略一致性：

1. **这个场景与当前猎杀阶段的对应**：准备期的场景应侧重情报收集；拦截期的场景应有明确的干预焦点；孤立期和对抗期的场景应有更强的冲突性。

2. **蝴蝶效应的场景影响追踪**：如果这个场景被猎手改变，会对哪些其他场景的状态产生连锁影响？

3. **场景与角色行动的整合**：场景不是独立存在的，它必须与在此活动的角色行为模式相匹配——谁在这个场景中有主动权？谁在此地处于劣势？

4. **禁地的配额管理**：过多的禁地场景会稀释先知优势的稀缺性；过少则会让故事过于"按剧本执行"，缺少探索感。理想比例：每5个主要场景中，1-2个包含禁地元素。

---

### 常见错误

1. **场景只有物理描述，缺乏战略定义**：只写"这是一座宏伟的神殿"，没有定义"这座神殿在猎杀计划中扮演什么角色、处于什么控制状态"
2. **忽视场景的控制状态追踪**：随着故事推进，场景的战略意义发生了变化，但叙述没有反映这种变化
3. **圣地抢占后缺乏后续设计**：成功抢占了一个圣地，但没有设计勇者的反应和接下来的连锁事件
4. **所有场景都是猎手主场**：猎手完全控制所有重要场景，勇者没有任何优势地带。这会让故事失去张力——勇者必须在某些场景中具有主动权
5. **禁地只有探索感，缺乏风险**：进入禁地被描述为纯粹的机会，没有设计"失去预知优势后"的真实危险',
  '## "Scene" Generation — The Protagonist Hunter

Scene design in Protagonist Hunter fiction has a unique strategic dimension. Every significant scene is not merely the physical backdrop for events — it is a battlefield where predestined fate and the Hunter''s intervention clash. When designing scenes, two questions must always be considered simultaneously: **What does this scene mean in the original novel?** And: **What will this scene become after the Hunter''s intervention?**

---

### Part I: The Dual-Significance Framework

#### Canon Significance Layer

Every important scene in the original novel has a predetermined narrative function:

- **Growth Sacred Sites**: Where the hero receives critical fortunes — artifacts, awakenings, mentor transmissions. In the original novel, these are positive, hope-filled locations.
- **Trial Battlegrounds**: Where the hero faces powerful challenges and grows through overcoming them. These are the highest-tension scenes in the original work.
- **Emotional Anchors**: Where the hero experiences events that profoundly shape their values — companion sacrifice, civilian gratitude, sacred vows. These define the hero''s moral character.
- **Plot Nodes**: Where major narrative turning points occur. Leaving this scene signals the story''s transition to its next phase.

#### Reality Significance Layer

The Hunter''s presence causes the same scene to acquire entirely different real significance:

- **Hunting Ground**: A scene the Hunter has pre-captured, used to set traps, deploy forces, and ambush the hero
- **Strategic Chessboard**: A contested scene where both the Hunter and hero fight for control
- **Lost Territory**: A scene the Hunter intended to control but failed to secure — the hero has established an advantage here
- **Avoidance Buffer**: A scene the Hunter deliberately circumvents because conflict here would trigger original-novel mechanisms unfavorable to the Hunter

---

### Part II: Sacred Site Seizure Mechanics

Sacred site seizure is one of the most representative scene design patterns in Protagonist Hunter fiction. The core operation: **the protagonist arrives at the site of a hero''s predestined fortune before the hero, stripping them of what should have been theirs.**

#### Three Essential Design Elements

**Element 1: The Arrival Window**
- A sacred site''s fortune has an "activation window" — a specific time period and set of conditions during which the fortune is accessible
- Design principle: the window must not be too wide (giving the Hunter comfortable preparation time) or too narrow (making arrival practically impossible)
- Ideal window: creates urgency while leaving the Hunter the possibility of arriving first through extreme action
- Example: "The Wind Temple in the Eastern Continent grants the divine tome ''Wind Mastery'' only when the spring equinox dawn light falls on the altar — in the original novel, the hero arrives in Chapter 12. I need to control this temple before that."

**Element 2: How the First Arrival Claims the Fortune**
- Fortunes are not always simple "first-come, first-served" logic. Consider:
  - Does the fortune have a "destiny authentication" mechanism that only the destined wielder can activate?
  - If the Hunter takes the fortune, what substitute does the hero receive?
  - Methods of claiming: direct possession, consumption/destruction, contamination rendering it unusable, transformation into a form useful to the Hunter
- Design branches:
  - The artifact can be held by anyone → The Hunter takes it directly as their own weapon
  - The artifact is destiny-bound and causes rejection in non-hero holders → The Hunter chooses destruction or sealing rather than possession
  - The artifact''s power is site-exclusive (only effective within the temple) → The Hunter seizes the temple itself rather than the artifact

**Element 3: Post-Seizure Scene State**
After the seizure operation, the scene enters a new state. The designer must specify:
- What does the hero find upon arrival? (Empty scene, traces left by the Hunter, the Hunter waiting in person)
- How do scene NPCs respond? (Tell the hero the truth, bribed into silence, eliminated)
- Does this seizure plant in the hero''s mind awareness of "a specific enemy"?

---

#### Sacred Site Seizure Strategic Matrix

| Seizure Purpose | Scene State | Downstream Effect | Risk |
|----------------|-------------|------------------|------|
| Acquire artifact for self | Scene vacant, artifact missing | Hunter gains power, hero loses predestined fortune | Hero investigates the artifact''s whereabouts, may trace it to the Hunter |
| Destroy artifact | Scene damaged | Hero''s power growth path shifts | Destiny compensation activates — hero may receive equivalent substitute |
| Control guardian | Scene appears normal but has changed allegiance | Can feed hero false information or set ambush | Guardian may be turned by hero''s social aura, switching sides |
| Establish outpost | Scene becomes Hunter faction territory | Strategic location controlled; hero''s movements can be monitored | Righteous forces may "liberate" the location, triggering open conflict |

---

### Part III: Forbidden Zone Scene Design

Forbidden zones are **hidden locations not covered by the original novel''s main plot** — they exist in the original world, but since the hero''s storyline never intersected with them, the Hunter''s knowledge of these places is also blank. Forbidden zones are the blind spots of the Hunter''s foreknowledge advantage, while simultaneously being opportunities to circumvent the Protagonist Aura''s intervention.

#### Three Types of Forbidden Zones

**Type A: Omitted Zones**
Places the original author chose not to describe — remote regions, underground worlds, dimensional spaces, or political faction heartlands the main plot never passed through.
- Characteristic: The Hunter knows nothing about these places, but they may contain ancient powers, secret organizations, or special resources the original novel never mentioned
- Risk: Entering means the Hunter loses their foreknowledge advantage entirely and must rely completely on real-time judgment
- Opportunity: The hero is equally ignorant of these places — both parties are on equal information footing, favoring the strategically more flexible Hunter

**Type B: Hidden Layers of Known Sites**
Places the original novel did describe, but only at surface level — the underground secrets of a city, the forbidden chamber of a temple, the hidden room in an NPC''s home.
- Characteristic: The Hunter knows this place exists but does not know its full contents
- Opportunity: The portion the original novel covered provides the Hunter with an entry path; the hidden portion provides surprises
- Example: "The Royal Library appears twice in the original novel — but I as the reader know the original never showed the third basement level. Perhaps there is something there..."

**Type C: Intervention-Generated Sites**
Locations that do not exist (or have no importance) in the original novel but have become strategically significant due to the Hunter''s actions.
- Example: The Hunter has established a secret base at a location that was an abandoned warehouse in the original novel, now the core facility of the Hunter''s faction
- Characteristic: The Hunter knows this place best, but this also means it has no protection in the original novel''s framework — if the hero or other factions discover it, the Hunter has no foreknowledge to anticipate the threat

---

#### Narrative Functions of Forbidden Zones

When designing forbidden zone scenes, specify their story function:

1. **Information Breakthrough**: In a forbidden zone, the Hunter discovers critical information the original novel never revealed, redirecting the entire hunting strategy
2. **Power Reserve**: The forbidden zone contains ancient power the hero never accessed; the Hunter''s acquisition shifts the strength balance
3. **Sanctuary**: When the Hunter is in danger, the forbidden zone is the last line of defense (the hero doesn''t know it exists)
4. **Narrative Mystery Box**: The forbidden zone presents shared unknowns for both reader and Hunter, generating genuine exploration tension and suspense

---

### Part IV: Scene Control State Transitions

Every significant scene has a "control state" that changes as the story progresses. These transitions must be tracked:

#### Control State Classifications

**Unclaimed**
- No major faction has established control
- For the Hunter: opportunity (can establish presence first) and risk (the unknown)

**Hunter-Controlled**
- The Hunter has established presence and can actively choose how to use this location
- For the Hunter: strategic advantage, but also a defensive burden requiring maintenance

**Hero-Controlled**
- The hero has connected with this location — received a fortune here or established a base
- For the Hunter: this is the hero''s advantage zone; direct contention carries extremely high costs

**Contested**
- Both factions have presence but neither has complete control
- The highest-tension state; most likely location for climactic confrontations

**Lost Control**
- A scene the Hunter once controlled but has ceded
- For the Hunter: loss of strategic asset, and potentially also intelligence provided to the hero

#### Transition Trigger Design

When designing state transitions, specify each transition''s trigger conditions, costs, and outcomes:

- **Unclaimed → Hunter-Controlled**: What action does the Hunter take to establish control? (Covert infiltration / forcible occupation / political negotiation)
- **Hunter-Controlled → Contested**: How do the hero or righteous forces discover and intervene?
- **Contested → Hero-Controlled**: What event tips the balance to the hero? What does the Hunter sacrifice?
- **Hunter-Controlled → Lost Control**: Internal betrayal? External raid? The Hunter''s own strategic error?

---

### Part V: Strategic Coherence Verification

After completing a scene design, verify strategic coherence with these questions:

1. **Scene-to-Hunt-Phase alignment**: Preparation phase scenes should emphasize intelligence gathering; interception phase scenes should have clear intervention focal points; isolation and confrontation phase scenes should carry stronger conflict dynamics.

2. **Butterfly effect tracking**: If the Hunter changes this scene, which other scenes'' control states will be affected in a chain reaction?

3. **Scene-character integration**: Scenes do not exist independently — they must align with the behavior patterns of the characters active within them. Who has initiative in this scene? Who is at a disadvantage here?

4. **Forbidden zone quota management**: Too many forbidden zone scenes dilute the scarcity of the foreknowledge advantage; too few make the story feel excessively "by the script" with no exploration sense. Ideal ratio: among every 5 major scenes, 1-2 incorporate forbidden zone elements.

---

### Common Mistakes

1. **Scenes have only physical description, no strategic definition**: Writing only "this is a grand temple" without defining "what role does this temple play in the hunting plan, and what is its current control state"

2. **Ignoring control state tracking**: As the story progresses, a scene''s strategic significance changes, but the narration fails to reflect this change

3. **No follow-up design after sacred site seizure**: A sacred site is successfully seized, but the hero''s reaction and subsequent chain events are not designed

4. **All scenes are the Hunter''s home turf**: The Hunter completely controls every important scene, with the hero having no zones of advantage. This eliminates narrative tension — the hero must have initiative in certain scenes

5. **Forbidden zones offer only opportunity, no risk**: Entering a forbidden zone is described as a pure windfall, without designing the genuine dangers of "operating without foreknowledge advantage"',
  (SELECT id FROM novel_creation_method WHERE name = 'The Protagonist Hunter' LIMIT 1),
  1,
  22,
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
