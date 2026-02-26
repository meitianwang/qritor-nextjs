-- The Ruthless Protagonist Novel「Worldbuilding」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Ruthless Protagonist Novel' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-ruthless-protag-worldbuilding-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ruthless-protag-worldbuilding-setting-gen',
  '「Worldbuilding」设定生成：为 The Ruthless Protagonist Novel 生成世界观设定，包括 World Type、World Details、Power Structure、Social Hierarchy、Key Locations、World Rules',
  '"Worldbuilding" setting generation: generate worldbuilding settings for The Ruthless Protagonist Novel, including world type, world details, power structure, social hierarchy, key locations, and world rules',
  '## 「Worldbuilding」设定生成 — The Ruthless Protagonist Novel

「Worldbuilding」是 grimdark 小说的舞台——一个残酷到逼迫主角必须狠辣才能生存的世界。好的 grimdark 世界观不是"把普通世界变黑暗"，而是从底层规则上就注定了善良是奢侈品、仁慈是致命弱点。世界本身就是对手。

---

### 字段生成指南

#### World Type（世界类型）

世界类型定义故事的宏观背景。每种类型提供不同的"黑暗质感"：

| 类型 | 核心黑暗特征 | 适合的冲突 | 经典参考 |
|------|------------|-----------|---------|
| **Dark Fantasy Medieval** | 封建压迫、魔法腐蚀、神灵冷漠 | Rise to Power, Domination | First Law, Berserk, ASOIAF |
| **Post-Apocalyptic Wasteland** | 资源极度匮乏、道德崩塌、弱肉强食 | Survival, Escape | The Road, Mad Max, Fallout |
| **Dystopian Empire** | 制度性压迫、全面监控、自由是幻觉 | Domination, Escape, Ideologies | 1984, Hunger Games, Worm |
| **Warring Kingdoms** | 永无止境的战争、平民如蝼蚁 | Rise to Power, Revenge | 三国演义（黑暗版）、Malazan |
| **Grimdark Urban** | 现代文明的黑暗面、腐败无处不在 | Domination, Revenge | Worm, Dresden Files（暗化版） |
| **Cosmic Horror Setting** | 存在主义恐惧、人类渺小、理性的极限 | Survival, Ideologies | Lovecraft, Bloodborne, Berserk（God Hand） |
| **Other** | 自定义世界类型 | — | 需额外说明 |

**选择原则**：世界类型应该与 Core Premise 中的 Central Conflict 自然匹配。Rise to Power 在 Dark Fantasy Medieval 或 Warring Kingdoms 中展开最自然；Survival 在 Post-Apocalyptic 中最紧迫。

#### World Details（世界细节）

世界细节回答一个核心问题：**这个世界的残酷具体体现在哪里？**

好的世界细节不是笼统的"黑暗"，而是具体的、系统化的残酷：

**残酷的层次**：

1. **物理层残酷**：环境本身要杀人——有毒的空气、稀缺的水、致命的野兽、危险的魔法辐射
2. **制度层残酷**：社会规则压迫底层——奴隶制、等级固化、法律保护强者惩罚弱者
3. **文化层残酷**：价值观本身是扭曲的——弱者被鄙视是文化共识、善良被视为愚蠢、背叛被视为智慧
4. **存在层残酷**：世界本质上对人类不友好——神灵冷漠或恶意、命运不可违抗、死亡不是终结而是更糟糕的开始

**关键原则**：世界的残酷必须是"系统性的"而非"随机的"。不是"偶尔有坏事发生"，而是"整个世界的规则就是弱肉强食"。

**优秀示例**：
- 蛊真人的蛊界：修炼需要大量资源，资源有限，争夺是常态。善良在这个体系里就是"把自己的资源送给对手"
- First Law 的环绕之海世界：贵族腐败、战争不断、魔法有代价、连神灵都是自私的操纵者
- Worm 的地球：超级英雄存在但无法阻止世界一步步走向毁灭、政府腐败、犯罪猖獗

#### Power Structure（权力结构）

权力结构定义谁掌控这个世界以及如何维持控制。Grimdark 的权力结构核心特征：**没有善意的统治者**。

**权力维持方式**：
- **暴力垄断**：统治者垄断最强的武力（军队、魔法师、超自然实体）
- **资源控制**：统治者控制关键资源（修炼资源、食物、水、魔法材料）
- **信息操控**：统治者控制知识和信息——百姓不知道真相
- **恐惧统治**：公开的残酷惩罚让所有人恐惧——杀鸡儆猴是常态
- **虚伪正义**：统治者用"正义"和"秩序"的名义维护不公——这是最讽刺也最适合 grimdark 的模式

**权力结构的设计要求**：
- 权力结构必须有可以被利用的"裂缝"——主角就是利用这些裂缝攀爬
- 不同势力之间应有利益冲突——这为主角提供"借力打力"的空间
- 统治阶层内部也应有分裂——没有铁板一块的权力集团

#### Social Hierarchy（社会等级）

社会等级定义谁在上面踩人、谁在下面被踩。Grimdark 世界的阶层特征：

**等级设计要素**：
- **底层的绝望**：底层人民的生活是什么样的？他们有哪些基本权利被剥夺？
- **阶层流动性**：是否有上升通道？如果有，代价是什么？（通常在 grimdark 中，上升通道要么不存在，要么代价极其残酷）
- **中间阶层的困境**：中间阶层的人面对上层压迫和下层竞争的双重压力
- **顶层的傲慢**：统治阶层如何看待底层人？他们的特权有多过分？

**主角在等级中的位置**：
- 主角通常从底层或中下层开始——这为"向上攀爬"提供最大的叙事空间
- 主角的狠辣部分来源于对这个不公体系的利用——他不打算改变体系，而是利用体系

#### Key Locations（关键地点）

关键地点是故事的"舞台"，每个地点应该强化 grimdark 氛围并为冲突提供场所：

**地点设计原则**：
- 每个地点都应该有"危险感"——即使是"安全"的地方也暗含威胁
- 地点应该反映权力结构——权力中心金碧辉煌，底层区域破败危险
- 不同地点代表不同的冲突类型——战场、黑市、监狱、宫廷各有各的紧张感

**Grimdark 经典地点类型**：
- **权力中心**：宫殿、塔楼、总部——表面华丽但内部充满阴谋和背刺
- **战场/前线**：战争的最前沿——生死只在一线之间
- **黑市/地下世界**：规则之外的空间——这里没有法律，只有实力
- **监狱/地牢**：被遗忘的角落——最绝望的地方，也可能是最重要的起点
- **避风港**：主角暂时安全的地方——但安全总是暂时的
- **禁区**：被禁止进入的区域——通常藏着力量也藏着危险
- **废墟/荒原**：文明毁灭后的遗迹——暗示这个世界曾经更好过（或更糟过）

#### World Rules（世界法则）

世界法则是迫使所有人做出道德妥协的底层规则。这是 grimdark 世界观最核心的字段：

**法则类型**：

1. **自然法则**：世界物理层面的残酷规律
   - "力量就是正义——这不是比喻，是字面意义上的法律"
   - "资源每百年减少一成，末日正在倒计时"
   - "死者不会消失——他们变成更危险的东西"

2. **社会法则**：文明运转的残酷规则
   - "债务可以传给后代——卖身契世代生效"
   - "决斗是合法的纠纷解决方式——强者永远有理"
   - "叛国罪株连九族——所有人都是人质"

3. **力量法则**：力量体系衍生的残酷推论
   - "修炼者可以合法吞噬普通人的灵魂——法律保护强者"
   - "魔法使用有配额——用完配额意味着死亡"
   - "获得力量的唯一方式是从别人手中夺取"

4. **潜规则**：不成文但所有人都遵守的默契
   - "信任是最大的弱点——所有人都知道"
   - "善良者被利用，狠辣者被尊重"
   - "承诺只在有利时有效——背叛是生存技能"

**法则设计的核心要求**：每一条法则都应该让主角的"狠"看起来是合理的、甚至是必要的生存策略。

---

### 字段联动关系

1. **World Type → World Details**：类型决定了细节的方向。Dark Fantasy Medieval 的细节围绕封建和魔法；Post-Apocalyptic 的细节围绕资源匮乏
2. **World Details → Power Structure**：世界的残酷方式决定了权力的维持方式。资源匮乏的世界靠资源控制；暴力横行的世界靠武力垄断
3. **Power Structure → Social Hierarchy**：权力结构直接塑造社会等级。军事独裁造就武力至上的等级；商业寡头造就财富决定一切的等级
4. **Social Hierarchy → Key Locations**：等级结构决定了地点的分布和功能。顶层有宫殿，底层有贫民窟，中间有战场
5. **所有字段 → World Rules**：世界法则是所有设定的底层逻辑总结——它解释了为什么这个世界是这样的

---

### 常见错误

1. **世界的"黑暗"流于表面**：只有视觉上的黑暗（阴天、废墟、血）而没有制度性和逻辑性的残酷。真正的 grimdark 世界是从规则层面就压迫人
2. **权力结构太过简单**：只有"坏人统治，好人受苦"——需要多层势力、内部裂缝、利益博弈
3. **社会等级缺乏细节**：只说"有贵族和平民"——需要具体化每个阶层的生活状况、权利范围、流动途径
4. **关键地点没有"故事性"**：地点只是背景板——每个地点都应该暗示冲突、隐藏秘密、或代表某种权力
5. **世界法则不够极端**：法则太"合理"或太"普通"——grimdark 的法则应该让读者觉得"在这个世界里，善良确实会死"
6. **世界与力量体系脱节**：世界观和 Power System 各自独立——力量体系应该是世界观的有机组成部分
7. **缺乏历史纵深**：世界只有"现在"，没有"过去"——暗示这个世界"曾经"发生过什么，能大幅增加世界观的厚度',
  '## "Worldbuilding" Setting Generation — The Ruthless Protagonist Novel

The "Worldbuilding" is the stage of a grimdark novel — a world so cruel that it forces the protagonist to be ruthless to survive. Good grimdark worldbuilding is not "take a normal world and make it dark" — it is a world where, from the ground rules up, kindness is a luxury and mercy is a fatal weakness. The world itself is an antagonist.

This is the fundamental difference between grimdark worldbuilding and "dark-themed" generic fantasy. In *Reverend Insanity*, the Gu world''s resource scarcity and predation-based cultivation system make ruthlessness the mathematically optimal strategy. In *The First Law*, the Circle of the World is controlled by manipulative immortals who treat humans as pawns, making every "good" institution secretly corrupt. In *Worm*, Earth Bet is slowly dying from escalating parahuman threats that no amount of heroism can stop. In each case, the world''s *fundamental rules* produce the darkness — it''s not painted on top.

---

### Field Generation Guide

#### World Type

The world type defines the macro-level backdrop. Each type provides a different "texture" of darkness:

| Type | Core Dark Feature | Best Conflict Match | Classic Reference |
|------|------------------|-------------------|-------------------|
| **Dark Fantasy Medieval** | Feudal oppression, corrupting magic, indifferent or malicious gods | Rise to Power, Domination | First Law (Union), Berserk (Midland), ASOIAF (Westeros), Reverend Insanity (Gu World) |
| **Post-Apocalyptic Wasteland** | Extreme resource scarcity, collapsed morality, survival of the fittest | Survival, Escape | The Road, Mad Max (Fury Road), Fallout, Metro 2033 |
| **Dystopian Empire** | Systemic oppression, total surveillance, freedom is an illusion | Domination, Escape, War of Ideologies | 1984, The Hunger Games, Worm (PRT/Cauldron), Red Rising |
| **Warring Kingdoms** | Endless war, civilians are ants, generals play chess with lives | Rise to Power, Revenge | Romance of the Three Kingdoms (grimdark reading), Malazan, Black Company |
| **Grimdark Urban** | Modern civilization''s dark side, corruption everywhere, the system is the enemy | Domination, Revenge | Worm (Brockton Bay), The Wire, Blade Runner |
| **Cosmic Horror Setting** | Existential dread, human insignificance, the limits of sanity | Survival, War of Ideologies | Lovecraft mythos, Bloodborne, Berserk (God Hand/Idea of Evil), SCP Foundation |
| **Other** | Custom world type | — | Requires additional explanation |

**Selection principle**: The world type should naturally match the Central Conflict from Core Premise. Rise to Power unfolds most naturally in Dark Fantasy Medieval or Warring Kingdoms; Survival is most urgent in Post-Apocalyptic; Escape is most compelling in Dystopian Empire.

**Cross-pollination works**: Some of the best grimdark worlds combine types — *Worm* is Grimdark Urban + Cosmic Horror; *Berserk* is Dark Fantasy Medieval + Cosmic Horror; *Reverend Insanity* is Dark Fantasy + Warring Kingdoms. Combining types creates unique settings, but the primary type should be clear.

#### World Details

World details answer one core question: **What SPECIFICALLY makes this world cruel?**

Good world details are not vague "darkness" but concrete, *systemic* cruelty:

**Layers of cruelty** (a well-built grimdark world should have at least 3 of these 4):

1. **Physical cruelty**: The environment itself tries to kill you
   - Toxic atmosphere, scarce water, lethal wildlife, dangerous magical radiation
   - Seasonal catastrophes, expanding wastelands, plague cycles
   - Example: *Reverend Insanity* — the "qi deviate" phenomenon means cultivation itself is dangerous; the Five Regions constantly produce natural disasters

2. **Institutional cruelty**: Social rules oppress the bottom
   - Slavery, rigid caste systems, laws that protect the strong and punish the weak
   - Legal predation (the strong can legally take from the weak)
   - Example: *First Law* — the Inquisition can arrest anyone without evidence; nobles are above the law; commoners are conscripted into wars they don''t understand

3. **Cultural cruelty**: The value system itself is twisted
   - Weakness is despised as cultural consensus; kindness is viewed as stupidity
   - Betrayal is seen as intelligence; loyalty is seen as naivety
   - Example: *Reverend Insanity* — in Gu cultivator society, using others as stepping stones is *respected*, not condemned. Righteousness is seen as foolish posturing

4. **Existential cruelty**: The world is fundamentally hostile to human flourishing
   - Gods are indifferent or actively malicious; fate is inescapable
   - Death is not the end but the beginning of something worse
   - The universe has no justice, no karma, no cosmic balance
   - Example: *Berserk* — the God Hand treats human suffering as entertainment; the Idea of Evil is literally humanity''s collective desire for meaning creating an entity that exists to cause suffering

**Key principle**: The world''s cruelty must be *systemic* rather than *random*. Not "bad things occasionally happen" but "the entire world''s rules are eat-or-be-eaten." When cruelty is systemic, the protagonist''s ruthlessness becomes a *rational response* rather than a character flaw.

**Strong example**: "In this world, cultivation resources regenerate once per century. Every sect, clan, and kingdom knows the exact date. For one hundred years, they prepare. When the resources appear, war erupts across all Five Regions simultaneously. Treaties are broken, allies are consumed, and the losers are stripped of everything. Kindness in this context means giving your resources to a future enemy."

#### Power Structure

Power structure defines who controls the world and how they maintain it. The core feature of grimdark power structures: **there are no benevolent rulers**.

**Methods of power maintenance**:
- **Violence monopoly**: Rulers monopolize the strongest force — armies, mage corps, supernatural entities, weapons of mass destruction. Anyone who challenges them is destroyed as an example.
- **Resource control**: Rulers control critical resources — cultivation materials, food, water, magical reagents. Dependency = obedience.
- **Information manipulation**: Rulers control knowledge and information — the populace doesn''t know the truth about history, the power system, or the rulers'' true nature.
- **Fear governance**: Public, brutal punishment ensures compliance — executions, public torture, family destruction. The message: "This is what happens to those who resist."
- **Hypocritical justice**: Rulers maintain power under the banner of "justice," "order," or "divine mandate" — the most ironic and grimdark-appropriate model. The system claims to be fair while structurally favoring the elite.

**Power structure design requirements**:
- The power structure must have **exploitable cracks** — these are what the protagonist uses to climb. A monolithic, perfectly efficient power structure leaves no room for the underdog protagonist.
- Different factions should have **conflicting interests** — this provides space for the protagonist to play factions against each other (divide and conquer, temporary alliances, information trading).
- The ruling class should have **internal divisions** — rival families, competing philosophies, generational conflicts. No power group is a solid monolith.
- At least one faction should be **hypocritically "righteous"** — claiming moral authority while practicing the same or worse cruelty. This gives the protagonist (and the reader) targets to despise and eventually destroy.

#### Social Hierarchy

Social hierarchy defines who''s on top doing the crushing and who''s on the bottom being crushed. Grimdark social hierarchies are *functional* — they exist because the world''s rules make them inevitable:

**Hierarchy design elements**:

- **Bottom-tier desperation**: What does life look like for the lowest class? What basic rights are denied to them? The more specific and visceral, the better:
  - "Indentured laborers in the salt mines have a life expectancy of 3 years. Their children inherit the debt."
  - "Unawakened civilians cannot own property, hold office, or refuse a cultivator''s demands."
  - This establishes the stakes for the protagonist if they fail to climb — and explains why they''re willing to be ruthless.

- **Social mobility**: Are there paths upward? If yes, what''s the cost? In grimdark worlds, upward mobility almost always requires moral compromise:
  - Military service (killing for the state in exchange for status)
  - Power system advancement (paying the costs described in Power System)
  - Patronage from a higher-tier individual (selling loyalty, becoming a tool)
  - Betrayal and elimination of competitors

- **Middle-tier squeeze**: The middle tier faces pressure from above (exploitation by elites) and below (competition from the ambitious underclass). They''re the most paranoid, the most compliant, and the most likely to betray when cornered. This tier often provides the protagonist''s early allies and early enemies.

- **Top-tier arrogance**: How do the rulers view the lower classes? Their privileges should be *specific* and *offensive*:
  - "Grand Masters can legally requisition any non-awakened person for experimentation."
  - "Noble families hold hunting festivals where the quarry is human."
  - This creates the visceral resentment that fuels the protagonist''s (and reader''s) desire to see the system burn.

**Protagonist''s position in the hierarchy**:
- The protagonist typically starts at the **bottom or lower-middle** — this provides maximum narrative space for climbing.
- Their ruthlessness partly stems from **understanding the system too well** — they don''t intend to reform it; they intend to *exploit* it.
- As they climb, they should increasingly *become* what they hated — or at least face that temptation.

#### Key Locations

Key locations are the story''s "stages." Each location should reinforce the grimdark atmosphere and provide a venue for conflict:

**Location design principles**:
- Every location should have a **sense of danger** — even "safe" places carry implicit threats (eavesdroppers, hidden enemies, structural decay)
- Locations should **reflect the power structure** — power centers are opulent, lower-class areas are dangerous and decaying
- Different locations represent **different conflict types** — battlefields for combat, black markets for negotiation, courts for political maneuvering, prisons for survival

**Grimdark location archetypes**:

- **Power Seat**: Palace, tower, headquarters — outwardly magnificent but internally rotten with conspiracy, assassination, and backstabbing. Every corridor has ears, every servant is someone''s spy.

- **Battlefield**: The front lines of war — where life and death are separated by seconds. Mud, blood, screaming, and the protagonist making cold decisions while others panic. The battlefield strips away all pretense.

- **Black Market**: A space outside the rules — no law, no protection, only power and leverage. The protagonist can acquire forbidden resources here, but everyone is a potential threat. Trust is currency, and it''s always counterfeit.

- **Prison/Dungeon**: The forgotten corners — maximum desperation, zero hope. This is often the protagonist''s starting point or a mid-story crucible. In the darkness of a cell, the protagonist''s true nature emerges.

- **Safe Haven**: A place where the protagonist can temporarily lower their guard — a hidden base, a loyal ally''s home, a neutral territory. BUT in grimdark fiction, safety is always temporary. The haven will be discovered, betrayed, or destroyed.

- **Forbidden Zone**: Areas that are off-limits — usually because something powerful and dangerous resides there. The protagonist''s willingness to enter forbidden zones demonstrates their ruthlessness and hunger for advantage.

- **Ruins/Wasteland**: Remnants of destroyed civilization — implying that the world was once different (better or worse). Ruins serve as memento mori and often contain hidden treasures or threats.

**Each key location entry should include**: (1) What it looks like and feels like (atmosphere), (2) Who controls it, (3) What dangers exist there, (4) Why it matters to the protagonist''s goals.

#### World Rules

World rules are the foundational laws that force moral compromise on *everyone*. This is the single most important field in grimdark worldbuilding — the rules are why the world is dark, and why the protagonist''s ruthlessness is justified:

**Rule categories**:

1. **Natural laws**: Physical-level cruel realities
   - "Strength IS justice — not metaphorically, but literally enshrined in law. The strong may take from the weak without consequence."
   - "Resources diminish by 10% each century. The apocalypse has a countdown."
   - "The dead do not disappear — they become something more dangerous. Every battlefield spawns new monsters."
   - "Magic corrupts the land. Every spell cast makes the world a little less habitable."

2. **Social laws**: Civilization''s cruel operating rules
   - "Debt transfers to descendants. Indenture contracts last for generations."
   - "Dueling is the legal method of dispute resolution. The strong are always right."
   - "Treason charges extend to nine degrees of relation. Everyone is a hostage for everyone else."
   - "Oaths sworn to superiors are magically binding. Breaking them means death."

3. **Power laws**: Cruel corollaries derived from the power system
   - "Cultivators may legally consume the souls of non-practitioners. The law protects the strong."
   - "Magic use has a lifetime quota. Exceeding it means death or worse."
   - "The only way to gain power is to take it from someone else."
   - "Every power advancement requires a sacrifice proportional to the gain."

4. **Unwritten rules**: Unspoken but universally understood conventions
   - "Trust is the greatest weakness. Everyone knows this."
   - "The kind are exploited. The ruthless are respected."
   - "Promises are valid only while advantageous. Betrayal is a survival skill."
   - "Everyone has a price. The only question is whether you can afford it."
   - "Mercy is remembered as weakness, never as virtue."

**Core design requirement**: Every rule should make the protagonist''s ruthlessness look like a *reasonable, even necessary* survival strategy. If a reader encounters any rule and thinks "I would probably do the same thing the protagonist does," the worldbuilding is working.

**The litmus test**: Take any world rule and ask: "If the protagonist followed conventional morality in this situation, what would happen to them?" The answer should be: "They would be destroyed, exploited, or killed." If conventional morality would work fine, the rule isn''t grimdark enough.

---

### Field Interdependencies

1. **World Type → World Details**: The type determines the direction of details. Dark Fantasy Medieval details center on feudalism and magic corruption; Post-Apocalyptic details center on resource scarcity and environmental hazards.

2. **World Details → Power Structure**: The world''s specific cruelties determine how power is maintained. A resource-scarce world maintains power through resource control; a violence-saturated world maintains power through force monopoly.

3. **Power Structure → Social Hierarchy**: The power structure directly shapes social tiers. Military dictatorships create might-makes-right hierarchies; mercantile oligarchies create wealth-determines-everything hierarchies; magical meritocracies create power-level-determines-status hierarchies.

4. **Social Hierarchy → Key Locations**: The tier structure determines location distribution and function. The top tier has palaces and fortified estates; the bottom tier has slums and labor camps; between them are battlefields, markets, and contested zones.

5. **All fields → World Rules**: World rules are the summary of all settings'' underlying logic — they explain *why* the world is the way it is. Every rule should be derivable from the world type, details, power structure, and social hierarchy.

---

### Common Mistakes

1. **Surface-level darkness**: Only visual darkness (overcast skies, ruins, blood) without institutional or logical cruelty. True grimdark worlds are dark at the *rules level*. A world that looks dark but where kindness is rewarded is not grimdark — it''s just gloomy fantasy.

2. **Oversimplified power structure**: Only "bad guys rule, good guys suffer." Multi-layered factions with internal cracks, competing interests, and temporary alliances create far more interesting political landscapes for the protagonist to navigate.

3. **Vague social hierarchy**: Stating "there are nobles and commoners" without specifics. Each tier needs concrete details — living conditions, legal rights, mobility paths, daily realities. The reader must *feel* what it''s like to be at the bottom.

4. **Key locations without narrative function**: Locations exist as background decoration without implying conflict, hiding secrets, or representing power dynamics. Every named location should serve a story purpose.

5. **World rules that aren''t extreme enough**: Rules that are too "reasonable" or too "normal." Grimdark world rules should make the reader think: "In this world, being kind really would get you killed." If the rules would produce a livable society, they''re not grimdark enough.

6. **World disconnected from power system**: The worldbuilding and Power System exist independently without integration. The power system should be an organic component of the world — power shapes society, society shapes access to power, and the protagonist exploits these feedback loops.

7. **No historical depth**: The world has only a "present" without a "past." Hinting at what the world was like before — whether better (a golden age that collapsed) or worse (the current order rose from something even more terrible) — dramatically increases the world''s sense of reality and depth. History also provides plot hooks: ancient secrets, forgotten powers, old grudges.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Ruthless Protagonist Novel' LIMIT 1),
  1,
  54,
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
