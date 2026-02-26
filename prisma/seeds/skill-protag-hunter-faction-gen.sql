-- The Protagonist Hunter「势力」生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Protagonist Hunter' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-protag-hunter-faction-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'protag-hunter-faction-gen',
  '「势力」生成：为 The Protagonist Hunter 生成势力体系，涵盖"原著定位 vs 猎手影响"两个维度，勇者阵营/猎手阵营/中立势力的设计，以及预言/神明/天命类型的宗教势力（原著中支持勇者的神圣体制）设计',
  '"Faction" generation for The Protagonist Hunter: generate faction systems with two dimensions of "original positioning vs Hunter influence," design of hero faction/hunter faction/neutral factions, and design of prophecy/divine/fate-type religious factions (the sacred institutions that support the hero in the original novel)',
  '## 「势力」生成 — The Protagonist Hunter

猎杀主角小说的势力设计具有独特的双重维度：每一个势力在原著中都有其预定的阵营立场和命运，而猎手的介入会让这些势力的实际走向发生偏移。设计势力时，必须同时建立"原著定位"和"猎手干预后的现实发展"两套坐标。

---

### 一、势力的双重维度框架

#### 原著定位维度

每个势力在原著小说中有其预定角色：

- **神圣守护者**：神明、预言机构、圣教等，为勇者提供神圣授权和精神支柱
- **世俗支持者**：支持勇者的王国、联盟、骑士团，提供物质、军队和政治合法性
- **中立旁观者**：商业行会、学者组织、独立城邦，不主动参战但影响资源分配
- **表面对立者**：原著中是反派阵营，但并非真正的恶——只是与勇者利益相悖的势力
- **核心敌对者**：原著中最终被勇者消灭的势力，包括魔王军、邪教等

#### 猎手影响维度

猎手的介入会让势力在以下几个方向发生偏移：

- **功能劫持**：猎手渗透并控制了原本支持勇者的势力，将其转化为猎杀工具
- **立场翻转**：通过利益诱导或信息操控，使中立势力倒向猎手阵营
- **内部瓦解**：引发势力内部的权力斗争，使其无法有效支援勇者
- **提前终结**：猎手提前消灭了原著中会为勇者提供关键支援的势力
- **意外强化**：猎手的干预意外使某势力变得比原著更强（蝴蝶效应）

---

### 二、三大阵营设计

#### 阵营1：勇者阵营（The Hero''s Alliance）

勇者阵营是原著中支持勇者的势力集合。在猎手视角下，这个阵营是必须被逐步瓦解的战略目标群体。

**设计要素：**

**核心国家/政权**
- 通常是原著世界的"正义大国"——在原著中为勇者提供庇护、军队和官方认可
- 猎手设计考量：这个国家的国王/贵族是否有弱点（政治腐败、内部派系斗争、对外战争压力）？利用这些弱点制造对勇者的疑虑
- 关键事件节点：国王/朝廷在原著中的哪个时间点为勇者提供了关键支援？猎手是否需要在此之前破坏这种关系？

**精英战斗单位**
- 骑士团、圣职者组织、勇者专属护卫队等，在原著中保护勇者并参与关键战斗
- 猎手设计考量：这些精英单位的首领是否有个人忠诚以外的利益诉求？是否可以通过政治手段削减其编制或改变其任务优先级？

**民心/舆论基础**
- 普通民众对勇者的信任和爱戴——这是最难被直接攻击的支持
- 猎手设计考量：是否可以通过制造"勇者行动导致的附带损害"事件，逐步侵蚀民心？散布谣言的性价比与风险评估。

**阵营内部张力（关键设计点）**
勇者阵营并非铁板一块——即使是支持勇者的势力之间，也存在利益冲突和权力争夺。猎手最有价值的信息资产之一就是知道原著中哪些潜在冲突被勇者的人格魅力暂时弥合了，然后提前引爆这些冲突。

---

#### 阵营2：猎手阵营（The Hunter''s Network）

猎手阵营不是一个传统意义上的"邪恶势力"——它是猎手围绕猎杀目标逐步构建的战略网络，通常由以下几类势力组合而成：

**原著反派势力（继承型）**
- 猎手转生的原角色本就属于某个反派阵营，猎手继承了这个阵营的资源
- 设计核心：这个阵营在原著中是被勇者消灭的。现在猎手接手了，他需要让这个阵营避免原著中的命运节点——意味着组织结构的调整、人员清洗（提前处理会在关键时刻背叛的角色）和战略方向的改变

**主动招募势力（扩展型）**
- 猎手出于猎杀策略的需要，主动招募或策反的势力
- 设计原则：招募的势力不应该让外部观察者意识到猎手在"组建讨伐勇者的联盟"，必须保持表面上的合理性（例：以商业合作名义拉拢商业行会；以共同对抗某个威胁的名义联合中立势力）

**情报网络（渗透型）**
- 渗透到勇者阵营内部的眼线和卧底
- 设计核心：卧底的身份和原著知识的结合是最强大的情报工具。猎手知道谁在原著中有二心，可以提前激活这种潜在的叛变倾向，或者更安全地——仅仅利用这些人的信息获取能力，而不要求他们公开叛变。

**猎手阵营的核心张力**
猎手阵营内部并非忠诚可靠——猎手继承来的部下中，有些人在原著中注定背叛。猎手知道是谁，但如果处置过早，会引发其他人的怀疑；如果放任太久，会在关键时刻遭到背刺。这是猎手阵营内部管理的核心困境。

---

#### 阵营3：中立势力（The Neutral Factions）

中立势力是最灵活的战略资产——他们不主动支持任何一方，但其立场会在利益计算的驱动下发生变化。猎手的目标是确保这些势力要么倒向自己，要么至少不倒向勇者。

**商业与经济势力**
- 大商会、银行家族、贸易联盟等
- 立场决定因素：纯粹的利益计算。谁给的利益更大、谁的势力更稳定、谁更可能在长期内胜出
- 猎手策略：提前建立商业关系（在竞争发生前建立互利纽带），并在关键时刻通过经济压力让这些势力选边站

**学术与知识势力**
- 魔法学院、学者协会、古老图书馆、占星师行会等
- 在原著中通常为勇者提供关键的知识支援（解读古典、提供道具使用指引、研究魔王军弱点）
- 猎手策略：建立比勇者更深厚的学术资助关系；或者直接控制关键的知识来源，使勇者无法获得某些重要信息

**地方独立势力**
- 独立城邦、部落联盟、边境领主等
- 在原著中通常态度摇摆，最终因为勇者的英雄行为而倒向正义阵营
- 猎手策略：在勇者接触这些势力之前，先行建立关系；或者制造让这些势力对勇者产生疑虑的事件

---

### 三、预言/神明/天命势力设计（神圣体制）

这是猎杀主角小说中最独特也最难处理的势力类型——代表"原著世界的底层操作系统"，是勇者的终极后台支持者。

#### 神圣体制的三个层次

**层次1：神明（The Divine）**
直接存在的神灵，在原著中为勇者提供直接的神圣授权：召唤勇者、赋予神圣力量、在危机时刻直接干预。

**在猎杀视角下的神明设计**：
- 神明不是单一的整体——不同神明有不同的立场和利益，部分神明甚至对"勇者体制"有所保留
- 猎手能否找到不支持勇者的神明？或者找到有条件支持猎手的神明？（例：混沌系神明、古老神明与新晋神明的权力博弈）
- 神明的直接干预是猎手最难应对的威胁——它不遵从逻辑和策略，只遵从叙事需要。设计猎手如何建立"神明不值得直接介入"的局面（让干预的代价大于不干预的代价）

**层次2：预言体制（The Prophecy System）**
在原著世界运行的预言机制——圣典、神谕、命运之书等，为"勇者是救世主"这一命题提供结构性背书。

**在猎杀视角下的预言体制设计**：
- 预言的具体内容是什么？是否有可以被重新解读的模糊性？（许多预言在原著中都存在多种解读空间）
- 猎手是否可以利用预言的模糊性，将自己包装成"另一种解读下的命运执行者"？
- 预言体制的守护者（祭司、先知等）对预言的解读是否会因为猎手的介入而发生变化？
- 设计一个"预言危机"：原著中的预言指向勇者，但随着时间线偏移，预言的指向开始变得模糊——这是猎手的机会，也是风险（神明系统会更主动干预以"纠正"偏差）

**层次3：世界命运机制（The Fate Mechanism）**
比神明和预言更底层的东西——原著世界似乎有一种"自我修正"的倾向，当剧情偏离原著时，会以各种方式将轨迹拉回到原著方向。

**在猎杀视角下的命运机制设计**：
- 命运机制不是有意识的——它不是在"对抗猎手"，而是在"维持平衡"。理解这一点会改变猎手的策略：与其对抗命运机制，不如利用它的"维持平衡"倾向为自己服务
- 命运机制的表现形式：巧合的增加（越多干预，越多"恰好"发生的事件把勇者拉回正轨）、关键角色的意外抵抗（被操控的角色在关键时刻出现主动意志）、新角色的涌现（原著外的新人物莫名其妙地出现来填补猎手制造的空缺）
- 猎手的应对：不要制造"需要命运机制修复的空缺"。让改变看起来像自然的演变，而非被强行拆除的预设。

---

#### 神圣体制的阵营立场变化设计

神圣体制并非永远支持勇者——设计其立场变化的可能性：

**立场动摇的触发条件**
- 勇者的行为严重违背神圣体制的核心价值观
- 猎手向神圣体制提供了勇者的"黑材料"——让神圣体制质疑勇者的适合性
- 神圣体制内部的权力斗争使部分成员倾向于支持"另一种可能性"
- 猎手展现出了超乎预期的"神圣属性"（力量、道德、统治能力），使神圣体制重新评估"谁才是天命之人"

**立场变化的程度分级**
- **轻度动摇**：神圣体制对勇者的支持仍然存在，但增加了附加条件和审查
- **中度分裂**：神圣体制内部分裂，部分成员开始接触猎手
- **重度翻转**：神圣体制主动撤回对勇者的授权，可能转向支持猎手（最高风险/最高回报的变化）
- **完全中立化**：神圣体制宣布不介入，撤出对任何一方的支持（猎手的最理想结果之一）

---

### 四、势力间的动态关系网络

设计完所有势力后，需要建立势力间的动态关系网络：

**关系类型**
- 正式同盟（公开）vs 秘密合作（隐蔽）
- 表面友好（实则敌对）vs 表面敌对（实则合作）
- 依存关系（一方依赖另一方的资源）vs 竞争关系（争夺同一资源或地位）

**动态追踪要点**
- 哪些关系在猎手干预前就存在张力？（原著中已有裂痕的关系更容易被利用）
- 哪些关系是猎手主动构建的？（记录构建时间和方式，追踪其稳固程度）
- 哪些关系会因为猎手的某个行动而突然改变？

---

### 五、势力设计的"原著 vs 现实"对照表

每个势力完成设计后，建立对照表：

| 维度 | 原著设定 | 猎手干预后现实 |
|-----|---------|-------------|
| 阵营立场 | 支持勇者/中立/对立 | 现在的实际立场 |
| 势力规模 | 原著中的规模 | 经过干预后的实际规模 |
| 核心人物 | 原著中的领导层 | 现在的实际领导层（有无被替换/清除） |
| 关键资源 | 原著中控制的资源 | 现在的资源状态 |
| 知识情况 | 原著中该势力掌握的信息 | 猎手是否篡改过他们的情报 |
| 命运节点 | 原著中的重要命运节点 | 这些节点是否仍然会发生 |

---

### 常见错误

1. **势力同质化**：所有支持勇者的势力只是"大的正义势力"和"小的正义势力"，没有各自独特的文化、利益和内部矛盾
2. **神圣体制一元化**：将神明/预言体制设计成统一的、纯粹支持勇者的铁板，没有内部分歧和可利用的裂缝
3. **中立势力定型化**：中立势力从头到尾保持中立，没有随着战局变化而调整立场，丧失了动态变化的戏剧性
4. **猎手阵营过于纯净**：猎手阵营内部没有设计潜在的背叛者和利益冲突，成了服从命令的工具集合，缺乏真实感
5. **忽视势力的"命运节点"**：每个势力在原著中都有其命运（什么时候会倒下/被瓦解/转变立场），猎手需要知道并管理这些节点，而不是把势力当作永远存在的静态资源',
  '## "Faction" Generation — The Protagonist Hunter

Faction design in Protagonist Hunter fiction possesses a unique dual-dimension structure: every faction in the original novel has a predetermined alignment and destiny, and the Hunter''s intervention causes these factions'' actual trajectories to deviate. When designing factions, two coordinate systems must be established simultaneously: "original positioning" and "reality after Hunter intervention."

---

### Part I: The Dual-Dimension Framework

#### Original Positioning Dimension

Each faction in the original novel has a predetermined role:

- **Sacred Guardians**: Divine entities, prophecy institutions, holy churches — providing sacred authorization and spiritual backbone for the hero
- **Secular Supporters**: Kingdoms, alliances, and knight orders that support the hero materially, militarily, and politically
- **Neutral Observers**: Commercial guilds, scholarly organizations, independent city-states — not actively combatant but influencing resource distribution
- **Surface Opponents**: Factions that appear antagonistic in the original novel but are not truly evil — they simply have interests that conflict with the hero''s
- **Core Enemies**: Factions ultimately destroyed by the hero — Demon Lord armies, dark cults, etc.

#### Hunter Influence Dimension

The Hunter''s intervention shifts factions in the following directions:

- **Function Hijacking**: The Hunter infiltrates and controls a faction originally supporting the hero, converting it into a hunting tool
- **Alignment Reversal**: Through incentive manipulation or information control, neutral factions are turned toward the Hunter''s camp
- **Internal Collapse**: Power struggles are triggered within a faction, rendering it incapable of effectively supporting the hero
- **Premature Termination**: The Hunter eliminates a faction that would have provided critical support to the hero in the original timeline
- **Accidental Strengthening**: The Hunter''s intervention accidentally makes a faction stronger than it was in the original novel (butterfly effect)

---

### Part II: Three Major Alignment Designs

#### Alignment 1: The Hero''s Alliance

The Hero''s Alliance is the collection of factions supporting the hero in the original novel. From the Hunter''s perspective, this alliance is the strategic target group that must be progressively dismantled.

**Design Elements:**

**Core Nation/Political Power**
- Typically the "righteous major power" of the original world — providing the hero with shelter, armies, and official recognition
- Hunter design consideration: Does this nation''s ruler or nobility have vulnerabilities? (Political corruption, internal factional disputes, external war pressure?) Use these vulnerabilities to plant doubts about the hero.
- Critical timing node: At what point in the original novel does this nation provide crucial support to the hero? Does the Hunter need to damage this relationship before that moment?

**Elite Combat Units**
- Knight orders, clerical organizations, hero-dedicated escort forces — protecting the hero and participating in key battles in the original novel
- Hunter design consideration: Do the leaders of these elite units have interests beyond personal loyalty? Can political means reduce their budget, change their tasking priorities, or redirect their operational focus?

**Popular Support / Public Opinion**
- Ordinary citizens'' trust and admiration for the hero — the hardest form of support to attack directly
- Hunter design consideration: Can "collateral damage events attributed to the hero''s actions" be manufactured to gradually erode popular support? Risk-benefit analysis of rumor campaigns.

**Internal Alliance Tensions (Critical Design Point)**
The Hero''s Alliance is not monolithic — even among factions supporting the hero, interest conflicts and power struggles exist. One of the Hunter''s most valuable intelligence assets is knowing which latent conflicts the hero''s personal charisma temporarily suppressed in the original novel — and triggering those conflicts before the hero can seal them again.

---

#### Alignment 2: The Hunter''s Network

The Hunter''s Network is not a traditional "evil faction" — it is the strategic network the Hunter progressively builds around the hunting objective, typically composed of several types of factions:

**Inherited Canon Villain Factions**
- The original character the Hunter reincarnated into already belonged to a villain faction; the Hunter inherits its resources
- Core design: This faction is destroyed by the hero in the original novel. Now the Hunter has taken it over. Avoiding the original-novel fate nodes means: restructuring the organization, purging specific members (preemptively handling those who would betray at critical moments), and redirecting strategic objectives.

**Actively Recruited Factions (Expansion Type)**
- Factions the Hunter proactively recruits or turns as part of the hunting strategy
- Design principle: Recruited factions must not allow outside observers to perceive that the Hunter is "building an anti-hero coalition." Plausible surface justifications must be maintained. (Example: attracting commercial guilds under the guise of business partnerships; uniting neutral factions under the banner of joint defense against a shared threat)

**Intelligence Networks (Infiltration Type)**
- Informants and moles embedded within the Hero''s Alliance
- Core design: The combination of planted moles and original-novel foreknowledge is the most powerful intelligence tool available. The Hunter knows who had divided loyalties in the original novel and can preemptively activate latent betrayal tendencies — or more safely, simply use these individuals'' information-gathering capacity without requiring them to openly defect.

**The Hunter Network''s Core Tension**
The Hunter''s own faction is not reliably loyal — among inherited subordinates, some are fated to betray in the original novel. The Hunter knows who, but acting too early raises suspicion among others; waiting too long risks a backstab at the critical moment. This is the central management dilemma within the Hunter''s own organization.

---

#### Alignment 3: Neutral Factions

Neutral factions are the most flexible strategic assets — they do not actively support either side, but their alignment shifts under the pressure of interest calculations. The Hunter''s objective is to ensure these factions either move toward the Hunter, or at minimum do not move toward the hero.

**Commercial and Economic Factions**
- Major trading houses, banking families, merchant leagues
- Alignment determinants: Pure interest calculation. Who offers better returns, whose power base is more stable, who is more likely to win in the long run
- Hunter strategy: Establish commercial relationships before competition intensifies (build mutually beneficial ties before rivalries form), and use economic pressure at key moments to force these factions to choose sides

**Academic and Knowledge Factions**
- Magic academies, scholarly associations, ancient libraries, astrologer guilds
- In the original novel, these typically provide the hero with critical knowledge support (deciphering ancient texts, providing artifact usage instructions, researching Demon Lord army weaknesses)
- Hunter strategy: Establish a deeper academic patronage relationship than the hero has; or directly control key knowledge sources, denying the hero access to critical information

**Local Independent Factions**
- Independent city-states, tribal confederations, frontier lords
- In the original novel, these typically waver before ultimately joining the righteous cause due to the hero''s heroic deeds
- Hunter strategy: Establish relationships before the hero makes contact; or manufacture events that cause these factions to develop doubts about the hero

---

### Part III: Prophecy / Divine / Fate-Type Faction Design (The Sacred System)

This is the most unique and most challenging faction type in Protagonist Hunter fiction — representing the "base operating system" of the original world and the ultimate backing support for the hero.

#### Three Layers of the Sacred System

**Layer 1: The Divine**
Directly existing divine beings who provide the hero with immediate sacred authorization in the original novel: summoning the hero, granting divine power, directly intervening at crisis moments.

**Divine Design in the Hunting Context**:
- The divine is not a unified monolith — different divine beings have different positions and interests; some have reservations about the "hero system"
- Can the Hunter find divine beings who do not support the hero? Or divine beings who would conditionally support the Hunter? (Example: chaos-aligned divine beings, power struggles between ancient and newer divine beings)
- Direct divine intervention is the hardest threat for the Hunter to counter — it does not follow logic or strategy, only narrative necessity. Design how the Hunter creates a situation in which "divine intervention is not worth the cost" — making the cost of intervention exceed the cost of non-intervention

**Layer 2: The Prophecy System**
The prophecy mechanism operating in the original world — sacred scriptures, divine oracles, books of fate — providing structural endorsement for the proposition that "the hero is the savior."

**Prophecy System Design in the Hunting Context**:
- What is the specific content of the prophecy? Does it contain interpretive ambiguity that could be reread? (Many prophecies in the genre have multiple valid interpretations)
- Can the Hunter exploit the prophecy''s ambiguity to frame themselves as "the executor of fate under an alternative interpretation"?
- Will the prophecy system''s guardians (priests, prophets, oracles) alter their interpretation of the prophecy in response to the Hunter''s interventions?
- Design a "prophecy crisis": the original prophecy points to the hero, but as the timeline diverges, the prophecy''s alignment begins to blur — this is both the Hunter''s opportunity and a risk (the divine system will intervene more actively to "correct" the deviation)

**Layer 3: The Fate Mechanism**
Something more fundamental than divine beings and prophecies — the original world seems to possess a "self-correcting" tendency: when the plot deviates from the original novel, the world tries in various ways to pull the trajectory back toward the original course.

**Fate Mechanism Design in the Hunting Context**:
- The fate mechanism is not conscious — it is not "opposing the Hunter," it is "maintaining balance." Understanding this changes the Hunter''s strategy: rather than fighting the fate mechanism, leverage its "balance maintenance" tendency for one''s own purposes
- Manifestations of the fate mechanism: increasing coincidences (the more interventions, the more "chance" events that pull the hero back on track); unexpected resistance from manipulated characters (controlled characters developing autonomous will at critical moments); emergence of new characters (characters outside the original novel appearing inexplicably to fill vacuums the Hunter creates)
- Hunter countermeasure: Do not create "vacuums that need fate-mechanism repair." Make changes look like natural evolution rather than forcibly dismantled preset structures.

---

#### Sacred System Alignment Shift Design

The sacred system does not eternally support the hero — design the possibility of alignment shifts:

**Destabilization Triggers**
- The hero''s behavior severely violates the sacred system''s core values
- The Hunter provides the sacred system with "damaging information" about the hero — causing the sacred system to question the hero''s suitability
- Internal power struggles within the sacred system cause some members to favor "an alternative possibility"
- The Hunter demonstrates unexpected "sacred attributes" (power, morality, governance capacity), causing the sacred system to reassess "who is truly the destined one"

**Degree of Alignment Shift**
- **Mild Destabilization**: The sacred system''s support for the hero persists, but with added conditions and scrutiny
- **Moderate Fracture**: The sacred system splits internally; some members begin making contact with the Hunter
- **Severe Reversal**: The sacred system actively withdraws its authorization from the hero, potentially shifting support to the Hunter (highest risk / highest reward shift)
- **Complete Neutralization**: The sacred system declares non-intervention, withdrawing support from all parties (one of the Hunter''s ideal outcomes)

---

### Part IV: Dynamic Relationship Networks Between Factions

After all factions are designed, a dynamic relationship network must be established:

**Relationship Types**
- Formal alliance (open) vs. secret cooperation (covert)
- Surface-friendly (actually hostile) vs. surface-hostile (actually cooperative)
- Dependency relationships (one faction relies on another''s resources) vs. competitive relationships (contesting the same resource or position)

**Dynamic Tracking Points**
- Which relationships had pre-existing tensions before Hunter intervention? (Relationships with existing fractures in the original novel are most exploitable)
- Which relationships did the Hunter actively construct? (Record construction timing and method; track stability)
- Which relationships will suddenly change as a result of a specific Hunter action?

---

### Part V: The "Canon vs. Reality" Comparison Table

After completing each faction''s design, establish a comparison table:

| Dimension | Canon Setting | Reality After Hunter Intervention |
|-----------|--------------|----------------------------------|
| Alignment | Pro-hero / Neutral / Opposed | Current actual alignment |
| Scale | Scale in original novel | Actual scale after intervention |
| Core figures | Leadership in original novel | Actual current leadership (any replacements / eliminations) |
| Key resources | Resources controlled in original novel | Current resource status |
| Intelligence | Information this faction held in original novel | Has the Hunter tampered with their intelligence? |
| Fate nodes | Important fate nodes in original novel | Will these nodes still occur? |

---

### Common Mistakes

1. **Faction homogenization**: All hero-supporting factions are simply "large righteous faction" and "small righteous faction," with no unique cultures, interests, or internal contradictions

2. **Sacred system monolithism**: The divine/prophecy system is designed as a unified, purely hero-supporting bloc with no internal divisions or exploitable fractures

3. **Static neutral factions**: Neutral factions remain neutral from start to finish, with no alignment shifts as the war situation changes — losing the dramatic potential of dynamic change

4. **Overly pure Hunter faction**: No potential betrayers or interest conflicts are designed within the Hunter''s faction — it becomes a compliant tool collection, lacking authenticity

5. **Ignoring faction fate nodes**: Every faction in the original novel has its destiny (when it will fall / be dismantled / shift alignment). The Hunter needs to know and manage these nodes, rather than treating factions as permanently-existing static resources',
  (SELECT id FROM novel_creation_method WHERE name = 'The Protagonist Hunter' LIMIT 1),
  1,
  25,
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
