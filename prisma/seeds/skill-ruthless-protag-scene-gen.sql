-- The Ruthless Protagonist Novel「场景」生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Ruthless Protagonist Novel' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-ruthless-protag-scene-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ruthless-protag-scene-gen',
  '「场景」生成：为 Grimdark/反英雄小说生成场景，每个场所都是权力的舞台和生存的竞技场——从权力中枢到被遗忘的废墟，都服务于冷酷主角的叙事',
  '"Scene" generation: generate scenes for Grimdark & Anti-Hero fiction — every location is a stage for power and an arena for survival, from seats of power to forgotten ruins, all serving the ruthless protagonist''s narrative',
  '## 「场景」生成 — 冷酷主角小说

Grimdark 场景设计的核心原则是**每个场所都是权力的表达**。场景不是中立的背景板——它们要么是权力的象征，要么是权力争夺的战场，要么是权力失败的废墟。在冷酷主角的故事中，场景本身就是一种角色：压迫、引诱、考验或摧毁踏入其中的人。

场景设计必须与世界观设定联动：Worldbuilding 的世界类型决定场景的基调，Power System 影响危险的类型，Core Premise 的中心冲突决定哪些场景具有战略价值。

---

### 字段生成指南

#### 场景名称 (Location Name)

- 名称要有质感和氛围——直接暗示这个地方的性质
- 避免泛泛的通用名（"城市""森林"太弱）
- 好的命名带有隐喻或历史感（"碎骨市场""沉默议事厅""灰烬荒原"）
- 名称风格与 Worldbuilding 的世界类型匹配

#### 场景类型 (Scene Type)

八个选项的叙事功能：

| 类型 | 叙事功能 | 设计重点 |
|------|---------|---------|
| **Power Seat** | 权力中枢，政治博弈核心 | 展示谁掌控、如何掌控、掌控的代价 |
| **Battlefield** | 暴力冲突的空间 | 不只是打斗——战场揭示角色的真实本性 |
| **Black Market** | 非法交易、信息流通 | 展示正式体系之外的权力运作 |
| **Prison/Dungeon** | 囚禁、酷刑、绝境 | 展示权力对个体的碾压 |
| **Safe Haven** | 暂时的安全之地 | 在 Grimdark 中安全是相对的——强调"暂时" |
| **Forbidden Zone** | 禁忌之地，代价极高 | 与 Power System 的 Forbidden Powers 联动 |
| **Public Arena** | 公开的权力展示场 | 处刑、竞技、政治宣言的场所 |
| **Ruins/Wasteland** | 文明失败的残骸 | 展示权力消亡后的世界 |

#### 氛围 (Atmosphere)

- 用 2-4 个感官维度描写——视觉、听觉、嗅觉、触觉
- 氛围要与场景类型呼应但不能太刻板
- Grimdark 的氛围关键词：压抑、腐朽、危险、虚假的繁华、冰冷
- 好的氛围描写示例："空气中弥漫着铁锈和旧血的气味，火把的光影在潮湿的石墙上跳动"

#### 战略价值 (Strategic Value)

- **必须从主角的视角思考**——这个地方对冷酷主角有什么用？
- 可以是资源、信息、地理优势、政治象征意义
- 战略价值决定了角色为何要争夺这个地方
- 与 Worldbuilding 的 Power Structure 联动

#### 危险 (Dangers)

- 每个场景都必须有威胁——安全的场景不属于 Grimdark
- 危险类型应多样：物理威胁、政治陷阱、环境灾害、人心
- 与 Power System 联动——危险的等级要在力量体系内合理
- Safe Haven 的危险是隐性的——可能被发现、被背叛、被攻破

#### 控制势力 (Controlling Faction) [动态字段]

- 标注当前控制或争夺这个场景的势力
- 与 Faction 模块联动
- 格式："[势力名] — [控制方式/控制程度]"

#### 当前状态 (Current State) [动态字段]

- 随剧情推进更新
- 格式："[状态] — [关键变化]"
- 状态选项：完好 / 争夺中 / 被摧毁 / 被围困 / 废弃 / 隐藏

---

### 场景阵容建议

批量初始化时的推荐配置：

**标准配置（5-7 个场景）**：
1. **权力中枢 (Power Seat)**（1 个）：故事中最重要的权力场所。所有势力博弈的焦点
2. **主角据点**（1 个，类型可变）：主角的行动基地。可以是 Safe Haven 或 Black Market
3. **冲突战场 (Battlefield)**（1-2 个）：暴力冲突的核心场所。可以是物理战场或政治竞技场
4. **地下世界 (Black Market 或 Prison/Dungeon)**（1 个）：展示正式权力之外的黑暗面
5. **废墟/禁地 (Ruins/Wasteland 或 Forbidden Zone)**（1 个）：展示世界的残酷历史或禁忌力量
6. **公共空间 (Public Arena)**（0-1 个）：公开的权力展示场

**场景配置原则**：
- 每个场景的功能不应重叠——如果有两个 Battlefield，它们必须服务于不同的叙事目的
- 场景之间应有地理和权力的逻辑联系
- 场景的"危险等级"应有梯度——从相对安全到极度致命

---

### 与已有设定的联动

| 设定模块 | 对场景的影响 |
|---------|------------|
| **Worldbuilding** | World Type→场景的基调和美学风格（黑暗奇幻的石堡 vs 后末日的废墟）；Power Structure→哪些场所是权力中心；Key Locations→可直接引用世界设定中的场所 |
| **Core Premise** | Central Conflict→决定核心冲突发生在哪种场景；Protagonist Archetype→影响主角活动的场所类型（算计型→政治场所多，生存型→荒野场景多） |
| **Power System** | Power Type→影响危险的性质（魔法系统→魔法危险，武力系统→物理威胁）；Forbidden Powers→Forbidden Zone 的设计依据；Power Tiers→危险等级的参考 |
| **Writing Style** | Violence Threshold→场景暴力描写的程度；Atmosphere→影响场景氛围的渲染方式；Pacing→场景节奏的密度 |

---

### 常见错误

1. **场景缺乏战略意义**：场景只是"好看的背景"而不服务叙事。每个场景都应该是角色做出关键选择的舞台
2. **安全感过强**：Grimdark 世界不应有真正安全的地方。即使是 Safe Haven 也应该有被发现或被攻破的威胁
3. **危险类型单一**：所有场景的威胁都是"有怪物"或"有敌人"。好的场景设计包含多维度威胁——政治的、环境的、心理的
4. **场景功能重叠**：多个场景承载相同的叙事作用，浪费了叙事空间
5. **与世界观脱节**：场景的风格和细节与 Worldbuilding 设定不一致——在后末日世界出现繁华大都市
6. **氛围过于单调**：不是每个场景都要"阴暗潮湿"。好的 Grimdark 场景有丰富的感官层次，甚至可以有残忍的美感',
  '## "Scene" Generation — The Ruthless Protagonist Novel

The foundational principle of Grimdark scene design is **every location is an expression of power**. Scenes are not neutral backdrops — they are symbols of power, battlegrounds for power, or the wreckage power leaves behind. In a ruthless protagonist''s story, the setting itself is a character: oppressing, tempting, testing, or destroying those who enter.

Think of the Tower of Babel in *Reverend Insanity*, where every floor is a different trial designed to strip away weakness. Think of the Agriont in *The First Law*, where the beautiful architecture masks centuries of political murder. Think of Brockton Bay in *Worm*, a rotting city where every neighborhood is a different warlord''s territory. The best Grimdark settings don''t just house the story — they *shape* it.

Scene design must interlink with existing settings: Worldbuilding''s world type determines the aesthetic baseline, Power System influences the nature of dangers, and Core Premise''s central conflict determines which locations have strategic significance.

---

### Scene System Overview

Grimdark scenes operate on three simultaneous levels:

1. **Physical reality** — what the place literally is: architecture, terrain, weather, sensory details
2. **Power geography** — who controls this place, why it matters, what resources or advantages it offers
3. **Narrative function** — what kinds of story events this location enables: betrayals, battles, revelations, sacrifices

A well-designed scene works on all three levels at once. A throne room isn''t just a room with a chair — it''s a physical space designed to intimidate (level 1), the literal seat of whoever holds power (level 2), and the stage where political machinations play out (level 3).

---

### Field Generation Guide

#### Location Name

- Names should carry **atmosphere and implication** — they should hint at what this place is before the description is even read
- Avoid generic labels ("The City," "The Forest," "The Mountain" are too weak)
- Strong naming approaches:
  - **Descriptive-evocative**: "The Ash Wastes," "Hollow Throne," "The Drowning Market"
  - **Historical-resonant**: Names that imply a past event ("Betrayer''s Gate," "The Burned Court")
  - **Ironic**: Names that contradict reality ("The Garden of Peace" for a mass grave, "Haven" for a death trap)
- Match naming style to Worldbuilding''s world type — medieval fantasy names differ from post-apocalyptic designations

#### Scene Type

Eight types, each serving a distinct narrative purpose in the ruthless protagonist''s world:

| Type | Narrative Function | Design Focus |
|------|-------------------|-------------|
| **Power Seat** | The epicenter of political maneuvering and authority | Show who holds power, how they maintain it, and what it costs. Power Seats are where the protagonist either ascends, is humiliated, or makes their move. Design them to feel *heavy* with authority — the architecture itself should communicate dominance (e.g., the Closed Council chamber in *The First Law*, the Gu Yue village elder hall in *Reverend Insanity*) |
| **Battlefield** | Where violence reveals character | Not just a fight scene backdrop — battlefields strip away pretense and reveal who characters truly are under pressure. Include terrain that can be exploited tactically. The protagonist should see a battlefield as a *problem to solve*, not a glory to chase (e.g., the siege of Dagoska in *Before They Are Hanged*) |
| **Black Market** | The shadow economy where forbidden things change hands | Represents power outside official structures — information, weapons, forbidden knowledge, mercenaries. This is often where the ruthless protagonist thrives, because they''re willing to deal with people "respectable" characters won''t touch. Design it as layered: the surface trade and the real trade beneath |
| **Prison/Dungeon** | Where power crushes the individual | Not just a cell — it''s a demonstration of what happens to those who lose. Can be where the protagonist starts (a common grimdark opening), where they send enemies, or where they''re forced to survive. The best prison scenes show the protagonist adapting and finding leverage even in total powerlessness (e.g., Glokta''s torture chambers in *The Blade Itself*) |
| **Safe Haven** | A temporary refuge — emphasis on "temporary" | In grimdark, safety is always conditional. The Safe Haven creates tension precisely because readers know it won''t last. Design it with visible vulnerabilities — ways it could be found, breached, or betrayed from within. The haven''s destruction often marks a major story turning point |
| **Forbidden Zone** | A place where the cost of entry is extreme | Links directly to Power System''s Forbidden Powers. These locations hold power that most won''t pursue because the price is too high — but the ruthless protagonist might consider it. Design with a sense of wrongness: twisted nature, corrupted magic, evidence of previous seekers who failed |
| **Public Arena** | Where power is performed for an audience | Executions, gladiatorial combat, political declarations, public trials. The audience is part of the design — how the crowd reacts shapes the power dynamics. The protagonist may use the arena to make a statement, prove dominance, or manipulate public opinion |
| **Ruins/Wasteland** | The aftermath of failed power — what civilization leaves behind | Serves as a warning and a source of scavenging. Ruins show what happens when those in power fail — empires collapse, cities burn, nature reclaims. For the protagonist, ruins are opportunities: abandoned resources, lost knowledge, places to hide. Design them with layers of history — multiple civilizations built and collapsed here |

#### Atmosphere

- Describe using **2-4 sensory dimensions** — what you see, hear, smell, and feel/touch
- Atmosphere should reinforce the scene type but avoid being cliché:
  - **Good**: "The market stinks of fish oil and fear-sweat. Torchlight catches the gleam of blades being traded under oilcloth. Somewhere above, a bell tolls — not for time, but to warn that the guard patrol is coming."
  - **Weak**: "It was dark and scary."
- Grimdark atmosphere keywords: oppressive, decaying, menacing, falsely prosperous, cold, visceral, clinical, desolate
- Contrast is powerful — a beautiful garden where executions happen; a warm, well-lit room where terrible decisions are made
- Weather and time of day can carry thematic weight — but don''t default to "always raining, always night"

#### Strategic Value

- **Think from the protagonist''s perspective** — what does this location offer a ruthless, calculating mind?
- Strategic value categories:
  - **Resources**: Raw materials, food, weapons, rare components for the power system
  - **Information**: Spy networks, archives, interrogation facilities, vantage points
  - **Geographic advantage**: Chokepoints, defensible positions, escape routes, trade crossroads
  - **Political symbolism**: Holding this location sends a message — legitimacy, dominance, defiance
  - **Power system relevance**: Locations where power can be gained, amplified, or where forbidden techniques can be practiced
- Link to Worldbuilding''s Power Structure — strategic value is determined by the world''s power dynamics

#### Dangers

- **Every scene MUST have threats** — a safe Grimdark scene is a contradiction
- Design dangers across multiple dimensions:
  - **Physical**: Environmental hazards, structural instability, hostile creatures, traps
  - **Political**: Surveillance, betrayal potential, shifting alliances, rival faction presence
  - **Psychological**: Isolation, horror, moral dilemmas the location forces, temptation
  - **Systemic**: The location itself works against you — toxic air, cursed ground, time distortion
- Link to Power System — danger severity should make sense within the established power tiers
- For Safe Havens, dangers should be *latent* — the threat of discovery, the possibility of betrayal from within, structural weaknesses in defenses

#### Controlling Faction (Dynamic Field)

- Identify which faction currently holds, contests, or claims this location
- Link to the Faction module — use the same faction names
- Format: "[Faction Name] — [Method/degree of control]"
- Examples:
  - "The Iron Brotherhood — absolute military occupation"
  - "Contested between House Valor and the Free Companies — active skirmishing"
  - "Officially under Crown jurisdiction — actually controlled by the merchant guild through bribery"

#### Current State (Dynamic Field)

- Updates as the story progresses
- Format: "[State] — [Key change]"
- State options: Intact / Contested / Destroyed / Under Siege / Abandoned / Hidden / Corrupted
- Example: "Contested — western wall breached during the autumn offensive, inner keep still holding"

---

### Scene Lineup Recommendations

For batch initialization, recommended configuration of 5-7 scenes:

**Core scenes (must create)**:
1. **Power Seat** (1): The most important seat of authority in the story. Where political power is wielded, challenged, and fought over. All faction dynamics converge here
2. **Protagonist''s Base** (1, type varies): The protagonist''s primary operating location. Could be a Safe Haven (if they''re on the run), a Black Market (if they''re building an underground network), or even a Prison/Dungeon (if they start in captivity). This location should reflect the protagonist''s current position in the power hierarchy

**Supporting scenes (strongly recommended)**:
3. **Battlefield** (1-2): Where violent conflict happens. Can be a literal battlefield for military stories, or a Public Arena for political ones. The key is that this is where characters face life-or-death consequences
4. **Shadow Space** (1, Black Market or Prison/Dungeon): The underworld of the story — where things happen outside official power structures. This is often where the ruthless protagonist has their natural advantage

**Enrichment scenes (optional but valuable)**:
5. **Forbidden Zone or Ruins/Wasteland** (1): The world''s dark history or forbidden power made physical. Represents the ultimate risk-reward calculus — tremendous power at terrible cost
6. **Public Arena** (0-1): Where power is performed publicly. Useful for stories where reputation and public perception matter alongside raw power

**Configuration principles**:
- Each scene should serve a unique narrative function — if two Battlefields exist, they must enable different kinds of conflict
- Scenes should have logical geographic and power relationships to each other (the Black Market exists *because* the Power Seat''s laws create demand for illegal goods)
- Danger levels should form a gradient — from relatively manageable to extremely lethal
- At least one scene should be designed to *change* dramatically during the story (a Safe Haven destroyed, a Ruin explored and claimed, a Power Seat overthrown)

---

### Setting Linkage

| Setting Module | Impact on Scenes |
|---------------|-----------------|
| **Worldbuilding** | World Type → aesthetic foundation and atmosphere palette (dark fantasy stone fortresses vs. post-apocalyptic irradiated ruins vs. dystopian concrete megastructures); Power Structure → determines which locations are power centers and why; Key Locations → can directly reference locations established in worldbuilding; Social Hierarchy → influences who has access to which locations; World Rules → harsh realities that make locations dangerous |
| **Core Premise** | Central Conflict → determines where the climactic confrontations take place; Protagonist Archetype → influences what types of locations the protagonist operates in (Calculating Strategist → political venues; Survival-Driven Pragmatist → wilderness and ruins; Power-Hungry Climber → power seats and arenas); Story Tone → affects how scene atmosphere is rendered |
| **Power System** | Power Type → determines the nature of environmental dangers (magic system → arcane hazards; martial arts → training grounds and dueling spaces; political power → courtrooms and councils); Forbidden Powers → directly defines Forbidden Zone design; Power Tiers → calibrates danger levels; Power Costs → what the environment demands from those who seek power within it |
| **Writing Style** | Violence Threshold → how graphically scene dangers are depicted; Prose Style → affects descriptive richness (lean and brutal → minimal scene description; visceral and sensory → rich atmospheric detail); Pacing → determines scene density and transition speed |
| **Story Hook** | Opening Tension → determines where the story begins (which scene is the first one readers see); Reader Expectation → scenes must deliver on the promised experience |

---

### Common Errors

1. **Scenes without strategic significance**: Locations that are just "cool backdrops" without serving the narrative. Every scene should be a stage where characters make crucial decisions, face consequences, or shift the power balance. If a scene doesn''t force a character to act, reconsider its inclusion
2. **Excessive safety**: A grimdark world should have NO truly safe locations. Even Safe Havens must feel precarious — the safety is conditional, temporary, and always under threat. If characters can relax completely anywhere, the world''s tension collapses
3. **Monotonous danger types**: All threats being "there are monsters" or "there are enemies" is one-dimensional. Layer dangers: political surveillance AND structural instability AND psychological pressure AND temptation from the power system. The best scenes threaten characters on multiple axes simultaneously
4. **Functional overlap**: Multiple scenes serving the same narrative purpose wastes storytelling real estate. If both "The Iron Keep" and "The Stone Bastion" are just "places where the army is," combine them or differentiate their functions sharply
5. **Disconnection from worldbuilding**: Scene aesthetics and details that contradict the Worldbuilding settings — a thriving metropolis in a post-apocalyptic wasteland world (unless explicitly justified by the power structure)
6. **Flat atmosphere**: Not every grimdark scene should be "dark and damp." Effective grimdark atmosphere has sensory richness and can even include beauty — beauty that makes the darkness more painful by contrast. A sunset over a battlefield, flowers growing through rubble, a beautifully crafted weapon designed to kill
7. **Ignoring the protagonist''s perspective**: Scenes should be filtered through how the ruthless protagonist perceives them — not as beautiful or ugly, but as useful or dangerous, advantageous or threatening. A garden isn''t pretty; it''s a secluded space with multiple exits and no surveillance',
  (SELECT id FROM novel_creation_method WHERE name = 'The Ruthless Protagonist Novel' LIMIT 1),
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
