-- The Protagonist Hunter「实体命名」skill (Layer 3)
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Protagonist Hunter' LIMIT 1)
-- Usage: mysql -u <user> -p <database> < skill-protag-hunter-entity-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'protag-hunter-entity-naming',
  '「实体命名」领域知识：为猎杀主角类小说中的角色、场景、势力组织提供专业命名指导，按实体类型分节覆盖英文命名体系：猎手的"命运讽刺感"配角名风格、勇者的典型主角命名套路，以及场景与势力的英文命名风格',
  '"Entity Naming" domain knowledge for Protagonist Hunter fiction: professional naming guidance for characters, scenes, and factions by entity type, covering the English naming system: the Hunter''s "fateful irony" side-character name style, the hero''s typical protagonist-name conventions, and English naming aesthetics for scenes and factions',
  '## 「实体命名」领域知识 — The Protagonist Hunter

猎杀主角小说实体命名的核心特殊性：**每个名字都承载着两层意义——原著中的命运定位，以及现实中被猎手改变的实际走向**。猎手的名字往往是原著中默默无闻的配角名，带有讽刺命运的意味；而勇者的名字则应该具有一眼可辨的"主角感"，让读者立刻识别出"这是那个要被猎杀的天命之子"。

猎杀主角命名体系的三个特殊要求：
1. **双重身份可读性**：猎手的名字要能兼容"看起来是普通配角"和"实际上是最危险的存在"这两种读者感知
2. **主角辨识度**：勇者的名字要让熟悉异世界故事套路的读者一眼看出"这是主角名"
3. **命运讽刺感**：整体命名体系应该隐含一种反叙事的讽刺——原著里的小角色名字的人，最终猎杀了原本是主角的人

---

## 一、角色命名

### 猎手（The Hunter）命名规范

猎手是原著中的某个"配角"或"小怪"转生而来。他的名字必须同时满足两个要求：在原著中显得无关紧要，但在猎手视角下透露出命运的讽刺感。

**猎手名字的核心美学：配角感 + 隐藏的命运讽刺**

什么是"配角感"的名字：
- 原著中这个角色名字不响亮，不像主角名那样有神话感或英雄感
- 可能是一个数字番号、一个地名绰号、或者一个表示职位的称呼
- 名字不会让读者产生"啊，这个人肯定很重要"的预感
- 但回头看，名字里往往有某种暗示（绑定了命运的某种讽刺）

猎手英文名字的风格取向：

**风格A：无名小卒型**
- 名字平凡、常见，在任何队伍里都不起眼
- 典型模式：普通的西方奇幻人名，没有特别的词源含义
- 示例：Gareth, Aldric, Wren, Corvin, Silas, Emric
- 适合：猎手在原著中的身份是底层士兵、小镇居民、无名小怪

**风格B：职位/编号型**
- 名字来自职位、编号或功能性标签
- 典型模式：数字 + 职位，或者角色在原著组织中的功能称谓
- 示例：Third Lance, Hollow Seven, The Watcher, Gate Keeper, Rank Nine
- 适合：猎手在原著中的身份是某个邪恶组织的成员

**风格C：地名绰号型**
- 名字来自出身地或长期驻扎之地
- 典型模式：地名 + 简单身份词
- 示例：Ironhaven''s Blade, The Ashford Rat, Northern Born
- 适合：猎手在原著中是某个特定地区的人物

**命运讽刺感的实现方式**：
- 猎手的名字在原著中意味着"微不足道"，但在猎手的故事里，这个名字最终被历史记住
- 名字的字面意思与猎手实际扮演的角色形成反差（一个名叫"守门人"的人，最终成了"终结者"）
- 名字可以与勇者的名字形成某种讽刺对照（一个名字平凡如泥土的人，猎杀了一个名字光辉如星辰的人）

**猎手绰号系统**：
猎手在故事中途通常会获得一个与原著身份无关的绰号，这个绰号是他作为猎手身份的真正标志。绰号设计原则：
- 不应该透露猎手的先知能力
- 应该来自其他人对他行为的观察（而不是自封）
- 应该有一点让敌人忌惮的含义，但不显山露水

猎手绰号示例：
- The Quiet One（沉默者）— 因为他总是在最关键的时刻消失
- Forerunner（先行者）— 因为他总是比勇者提前出现在重要地点
- The Variable（变数）— 因为他的出现总是打乱一切既定计划
- Ghost of [地名]（某地之鬼）— 因为他总是在某个地区神出鬼没

---

### 勇者（The Hero）命名规范

勇者的名字必须让读者一眼感受到"主角感"——这个名字应该听起来像是命运选中的人的名字，有一种天然的光辉感和使命感。

**勇者名字的核心美学：宏大感 + 天命指向性 + 容易被人记住**

勇者英文名字的典型特征：
1. **音节上的开阔感**：名字读出来有一种自然的大气感，不拗口，不局促
2. **词源上的意义感**：名字往往有明显的语义（光、火、剑、星、神等），暗示命运赋予的使命
3. **传承感或神话感**：名字听起来像是"这个名字在这个世界里已经存在了很久"，有历史厚度
4. **发音上的传颂性**：容易被其他角色在故事中大声呼喊，有一种被人高呼的自然节奏感

勇者英文命名套路：

**套路A：古典英雄名**
- 来自现实神话或历史中的英雄名，或者具有类似声音和质感
- 示例：Aldwyn, Caelion, Theron, Eryndal, Cassian, Aelar
- 特点：有传统西方奇幻的史诗感，读者下意识认为这是"主角名"

**套路B：光/火/星系词根名**
- 名字的词根或发音与光明、火焰、星辰等主角光环相关的意象挂钩
- 示例：Aethon（太阳神马，暗示光速），Caelum（天空），Lucien（光），Ignis（火焰），Stellan（星辰）
- 特点：有更明显的命运指向性，让读者直接感受到"这个名字和天命有关"

**套路C：简洁力量型**
- 1-2音节，发音有力，是某种"战士主角"的代表命名风格
- 示例：Kael, Ren, Val, Dane, Roric, Bram
- 特点：现代网络小说风格，力量感和朗朗上口并存

**与猎手名字形成对照**：
勇者的名字应该与猎手的名字形成鲜明对比——一个听起来是命运之子，一个听起来是命运的旁观者或陪葬品。这种对比本身就是猎杀主角类型的叙事暗语。

示例对照组：
- 猎手：Gareth Ashford vs 勇者：Caelion the Promised
- 猎手：Third Lance vs 勇者：Aldwyn Brightblade
- 猎手：Wren vs 勇者：Aelar Sunborn

---

### 其他角色命名规范

**勇者伙伴**：
- 伙伴名字应该有各自的记忆点，但整体上服务于"勇者团队"的史诗感
- 不同伙伴代表不同的文化/种族/职业，名字应体现这种多样性
- 常见伙伴类型及名字风格：
  - 骑士型：短促有力，带有骑士团传统（Garron, Wulfric, Hadwin）
  - 法师型：有拉丁或古语词根感（Aldric, Theron, Vestian）
  - 盗贼型：轻快、有点随意（Pip, Corra, Slink, Nell）
  - 精灵型：流动感强的名字（Lyria, Faelyn, Aerith, Soel）

**棋子/工具角色**：
- 棋子的名字不应该太有存在感，但也不能太随意（太随意会提前暗示他们是炮灰）
- 一个名字 + 一个职位描述的组合就够了（Old Fenwick the Merchant, Corporal Griel）
- 名字要能让读者在故事后期回忆起"哦，就是那个人"

**野牌角色**：
- 野牌角色的名字应该与其他角色有某种微妙的"格格不入"感——他们是原著之外的人，名字也可以稍微偏离这个世界的命名规范
- 另一个异世界转生者：可以用与猎手/勇者命名风格都不同的名字体系

---

## 二、场景命名

猎杀主角小说中，场景命名有一个独特维度：**同一个场景在猎手心中往往有两个名字——原著里的名字，以及现实世界里的实际名字（或者民间俗称）**。这种双重命名本身可以成为叙事工具。

### 圣地/机缘点（Fortune Sites）

圣地是勇者获取机缘的地方，也是猎手必须优先争夺的战略要地。命名规范：

**原著命名风格（The Canonical Name）**：
- 庄严、宏大，体现这个地方对世界的重要性
- 通常与传说或神话挂钩
- 示例：The Altar of the First Light（初光圣坛）、The Sanctum of Trials（试炼圣殿）、The Wellspring of Fate（命运源泉）

**猎手使用的实际名字**：
- 更实用，更冷静，有时甚至有点讽刺
- 体现猎手把这些"神圣"地点视为战略目标而非精神圣地
- 示例：
  - The Altar of the First Light → "the loot room"（战利品室）
  - The Sanctum of Trials → "the hero''s gym"（勇者的道场）
  - The Wellspring of Fate → "the level-up pool"（升级泡泡池）

**设计建议**：在正文中猎手可以同时使用两个名字，在严肃场景用原著名，在内心独白或与心腹交谈时用俗称——这种切换本身就是塑造猎手性格的叙事手法。

### 权力中枢（Power Centers）

政治权力的中心场所——王宫、议会、领主的城堡。命名规范：
- 名字应体现权力的重量和历史感
- 与原著中的威权形象保持一致（这些地方通常不会因为猎手干预而改变太多）
- 风格：宏大、有压迫感
- 示例：The Iron Citadel（铁堡垒）、Throne of Ash（灰烬王座之地）、The High Keep（高堡）

### 边缘/野外地带（Frontier Zones）

猎手行动的主战场——边境、荒野、废弃遗迹。命名规范：
- 名字应体现这些地方的危险性和无序性
- 可以有民间俗称，与官方名字并存
- 示例：
  - The Blighted March（枯萎行军地）/ 俗称 "the dead lands"
  - Grimholt Pass（暗堡隘口）/ 俗称 "the throat"（喉咙）
  - The Sunken Vale（沉降谷地）/ 俗称 "the trap"

### 地下/隐秘场所（Underground / Hidden Spaces）

猎手的秘密基地、黑市交易地、情报网节点。命名规范：
- 名字通常极简，甚至没有正式名字
- 用方位、特征或代号代替正式名称
- 示例：The Under（地下）、Crossroads（十字路口）、The Blind Eye（瞎眼处）、Last Corner（最后角落）

---

## 三、势力命名

### 原著正义阵营（Canon Hero Faction）

这些势力是勇者的后盾，在原著中代表"光明面"。猎手需要与之周旋或对抗。命名规范：
- 名字应该听起来正义、崇高、有使命感——这是猎手必须对抗的"正统"
- 可以有轻微的讽刺意味，暗示这种"正义"是猎手必须用计谋绕过的障碍
- 示例：
  - The Order of the Dawn（黎明骑士团）
  - The Covenant of the Sacred Flame（圣焰契约）
  - The Triumvirate of Light（光明三执政）

**猎手对这些势力的俗称**（内心独白或心腹交谈时使用）：
- The Obstacle（障碍）
- The Scripted Alliance（原著联盟）
- The Sanctimonious Lot（伪善者群体）

### 原著黑暗阵营（Canon Villain Faction）

猎手通常来自这个阵营，或者与这个阵营有历史渊源。命名规范：
- 名字应该有威胁感，但不要过于"恶"标签化
- 历史感和实力感并存
- 示例：
  - The Obsidian Court（黑曜法庭）
  - Shadowreach（暗域延伸）
  - The Dusk Legion（暮色军团）

### 猎手自建势力（Hunter''s Faction）

猎手在故事中途建立或收编的势力。命名规范：
- 名字通常不透露猎手的真实意图
- 可以用一个中性或甚至看起来正义的名字作为掩护
- 示例：
  - The Gray Watchers（灰色守望者）— 中性、不引人注意
  - The Merchant''s Guild of [地名]（某地商人行会）— 以商业为掩护
  - Remnant（残余者）— 暗示来自某个瓦解势力的幸存者群体

### 野牌势力（Wildcard Factions）

原著之外出现的势力，猎手无法用原著知识预测其行为。命名规范：
- 名字应该与原著正义/黑暗阵营的命名风格都有所不同，暗示其"不属于这个故事"
- 可以有更现代感、更异域感，或者更简洁到让人不安
- 示例：
  - The Unnamed（无名者）— 极简，令人不安
  - The Third Option（第三选项）— 元叙事感
  - Nullreach（虚无延伸）— 与现有势力命名体系格格不入

---

## 四、命名系统总则与禁忌

### 双层命名意识

始终牢记：猎杀主角故事中，"原著命名"和"现实命名"可以不同。可以设计：
- 猎手知道某个地方的"原著名"（在原著小说里叫什么），但现实里他按实际功能叫它别的名字
- 某些角色在原著里有一个名字，猎手知道这个名字，但现实中这个角色还没有被这样称呼

这种双层命名是猎杀主角类型独有的世界建构工具，应该被充分利用。

### 绝对禁忌

- **不要给猎手起一个明显的"主角感"名字**：如果猎手的名字听起来就像是命中注定的英雄，会破坏"原著配角转生"的核心设定
- **不要给勇者起一个平凡无奇的名字**：勇者的名字必须有足够的"主角感"，否则读者无法理解为什么猎手要如此费力应对一个叫"Bob"的人
- **不要所有场景都用宏大名字**：猎手的行动空间往往是边缘地带，这些地方应该有更接地气的命名
- **不要让势力名字太相似**：在多个阵营同时活跃的故事中，势力名字的区分度非常重要，读者必须一眼知道"这是哪边的人"',
  '## "Entity Naming" Domain Knowledge — The Protagonist Hunter

The core distinguishing feature of Protagonist Hunter fiction''s entity naming: **every name carries two layers of meaning — the canonical fate-positioning in the original novel, and the actual trajectory altered by the Hunter.** The Hunter''s name is often a forgettable side-character name from the original novel, carrying a sense of fateful irony; while the hero''s name should have an unmistakable "protagonist feel" that allows readers to immediately recognize "this is the child of destiny who is to be hunted."

Three special requirements of the Protagonist Hunter naming system:
1. **Dual identity readability**: The Hunter''s name must work for both "appears to be an ordinary side character" and "is actually the most dangerous presence" — both reader perceptions must be plausible
2. **Protagonist distinctiveness**: The hero''s name must make readers familiar with isekai conventions immediately think "this is a protagonist name"
3. **Fateful irony**: The overall naming system should carry an anti-narrative irony — the person with the "forgettable side-character name" ultimately hunts the person who was supposed to be the protagonist

---

## I. Character Naming

### The Hunter Naming Guide

The Hunter reincarnated as some "side character" or "minor monster" from the original novel. Their name must simultaneously satisfy two requirements: appear inconsequential in the original novel, but when seen through the Hunter''s perspective, carry a sense of ironic fate.

**Core aesthetic of Hunter names: Side-character feel + hidden fateful irony**

What makes a name "feel like a side character":
- The original character''s name is not resonant — not mythic or heroic like a protagonist name
- May be a numerical designation, a place-name epithet, or a title indicating a position
- The name does not trigger the reader''s instinct of "this person must be important"
- But in retrospect, the name often contains some hint (a fateful irony embedded in the naming)

Style orientations for Hunter English names:

**Style A: The Unremarkable Commoner**
- An ordinary, common name that would be invisible in any group
- Typical pattern: standard Western fantasy names with no special etymological meaning
- Examples: Gareth, Aldric, Wren, Corvin, Silas, Emric
- Best for: Hunters whose original identity is a low-ranking soldier, small-town resident, nameless minor enemy

**Style B: Position / Designation Type**
- Name derived from a position, number, or functional label
- Typical pattern: number + position, or the character''s functional title within the original organization
- Examples: Third Lance, Hollow Seven, The Watcher, Gate Keeper, Rank Nine
- Best for: Hunters whose original identity is a member of a villainous organization

**Style C: Place-name Epithet Type**
- Name derived from place of origin or long-term posting
- Typical pattern: place name + simple identity word
- Examples: Ironhaven''s Blade, The Ashford Rat, Northern Born
- Best for: Hunters identified with a specific location in the original novel

**Implementing fateful irony**:
- The Hunter''s name signifies "negligible" in the original novel, but in the Hunter''s story, this name is ultimately remembered by history
- The literal meaning of the name creates contrast with the role the Hunter actually ends up playing (someone named "Gatekeeper" who becomes "the Terminator")
- The name can create ironic contrast with the hero''s name (someone with a name as mundane as earth, who hunts someone with a name as brilliant as stars)

**Hunter Epithet System**:
During the story, the Hunter typically acquires an epithet unconnected to their original identity — this epithet is the true marker of their Hunter identity. Epithet design principles:
- Should not reveal the Hunter''s foreknowledge ability
- Should arise from other characters'' observations of their behavior (not self-given)
- Should carry a faint menace that unsettles enemies, but without ostentation

Hunter epithet examples:
- The Quiet One — because they always disappear at the most critical moments
- Forerunner — because they always appear at important locations before the hero does
- The Variable — because their presence always disrupts every established plan
- Ghost of [Location] — because they materialize and vanish without explanation in a specific region

---

### The Hero Naming Guide

The hero''s name must make readers immediately feel "protagonist energy" — this name should sound like the name of someone chosen by fate, carrying a natural luminosity and sense of mission.

**Core aesthetic of Hero names: Grandeur + Fate-Pointing + Memorable**

Typical characteristics of Hero English names:
1. **Syllabic openness**: The name sounds naturally expansive when spoken — not awkward or cramped
2. **Etymological meaningfulness**: The name often has clear semantics (light, fire, sword, star, divine), implying the mission granted by fate
3. **Lineage or mythic resonance**: The name sounds like "this name has existed in this world for a very long time" — historical depth
4. **Chantability**: Easy for other characters to call out loudly in the story, with a natural rhythm for being acclaimed

Hero English naming conventions:

**Convention A: Classical Hero Names**
- Drawn from real mythology or history, or names with similar sounds and qualities
- Examples: Aldwyn, Caelion, Theron, Eryndal, Cassian, Aelar
- Characteristics: Has the epic quality of traditional Western fantasy — readers subconsciously register these as "protagonist names"

**Convention B: Light/Fire/Star Root Names**
- The name''s roots or pronunciation connect to protagonist-aura imagery such as light, flame, or stars
- Examples: Aethon (sun-horse, implies speed of light), Caelum (sky), Lucien (light), Ignis (flame), Stellan (star)
- Characteristics: More overt fate-pointing quality — readers directly sense "this name is connected to destiny"

**Convention C: Concise Power Type**
- 1-2 syllables, forceful pronunciation — the representative naming style of "warrior protagonist"
- Examples: Kael, Ren, Val, Dane, Roric, Bram
- Characteristics: Modern web fiction style, combining power and memorability

**Creating contrast with the Hunter''s name**:
The hero''s name should create vivid contrast with the Hunter''s name — one sounds like a child of fate, the other sounds like a bystander or sacrificial extra in fate''s drama. This contrast is itself the narrative signature of the Protagonist Hunter genre.

Example contrast pairs:
- Hunter: Gareth Ashford vs Hero: Caelion the Promised
- Hunter: Third Lance vs Hero: Aldwyn Brightblade
- Hunter: Wren vs Hero: Aelar Sunborn

---

### Other Character Naming Guides

**Hero''s Companions**:
- Each companion''s name should have its own memory hook, but collectively serve the epic quality of the "hero''s party"
- Different companions represent different cultures/races/classes — names should reflect this diversity
- Common companion types and name styles:
  - Knight type: Short and forceful, bearing the tradition of knightly orders (Garron, Wulfric, Hadwin)
  - Mage type: Latin or archaic root feel (Aldric, Theron, Vestian)
  - Rogue type: Light, slightly casual (Pip, Corra, Slink, Nell)
  - Elf type: Names with flowing quality (Lyria, Faelyn, Aerith, Soel)

**Pawn / Instrumental Characters**:
- Pawn names should not be too pronounced, but also not too arbitrary (overly arbitrary names inadvertently signal "cannon fodder")
- One name + one position description is enough (Old Fenwick the Merchant, Corporal Griel)
- The name must allow readers to recall "oh, that person" when they reappear later

**Wildcard Characters**:
- Wildcard characters'' names should have a subtle "doesn''t quite fit" quality compared to other characters — they are people outside the original novel, and their names can slightly deviate from the world''s established naming norms
- Another isekai transmigrator: can use a name system stylistically different from both Hunter and Hero naming conventions

---

## II. Scene / Location Naming

Protagonist Hunter fiction has a unique dimension for location naming: **the same location often has two names in the Hunter''s mind — the canonical name from the original novel, and the actual name used in reality (or the vernacular nickname).** This dual naming can itself become a narrative tool.

### Fortune Sites (Sacred Power Locations)

Fortune sites are where the hero acquires key advantages — they are also the strategic targets the Hunter must contest first. Naming guide:

**Canonical Name Style**:
- Solemn, grand — reflects this location''s importance to the world
- Usually connected to legend or mythology
- Examples: The Altar of the First Light, The Sanctum of Trials, The Wellspring of Fate

**Hunter''s Practical Names**:
- More utilitarian, more detached — sometimes even a little sardonic
- Reflects the Hunter treating these "sacred" sites as strategic objectives rather than spiritual sanctuaries
- Examples:
  - The Altar of the First Light → "the loot room"
  - The Sanctum of Trials → "the hero''s gym"
  - The Wellspring of Fate → "the level-up pool"

**Design suggestion**: In the text, the Hunter can use both names — canonical name in serious scenes, vernacular in internal monologue or conversations with trusted allies. This switching is itself a character-building narrative technique.

### Power Centers

The seats of political power — palaces, councils, lords'' castles. Naming guide:
- Names should carry the weight of power and historical depth
- Should align with the authoritative image from the original novel (these places usually don''t change much even with Hunter intervention)
- Style: Grand, oppressive
- Examples: The Iron Citadel, Throne of Ash, The High Keep

### Frontier Zones

The Hunter''s primary operational theater — borderlands, wilderness, abandoned ruins. Naming guide:
- Names should reflect the danger and disorder of these places
- Vernacular names can coexist with official names
- Examples:
  - The Blighted March / vernacular: "the dead lands"
  - Grimholt Pass / vernacular: "the throat"
  - The Sunken Vale / vernacular: "the trap"

### Underground / Hidden Spaces

The Hunter''s secret bases, black market trading sites, intelligence network nodes. Naming guide:
- Names are usually minimal — often no formal name
- Use direction, distinctive feature, or code designation in place of formal names
- Examples: The Under, Crossroads, The Blind Eye, Last Corner

---

## III. Faction Naming

### Canon Hero Faction (Original Novel''s Light Side)

These factions are the hero''s backing — they represent the "light side" in the original novel. The Hunter must maneuver around or oppose them. Naming guide:
- Names should sound righteous, elevated, mission-driven — they are the "orthodox" the Hunter must scheme against
- A faint undercurrent of irony is acceptable, suggesting this "righteousness" is an obstacle the Hunter must circumvent
- Examples:
  - The Order of the Dawn
  - The Covenant of the Sacred Flame
  - The Triumvirate of Light

**Hunter''s vernacular terms for these factions** (used in internal monologue or with trusted allies):
- The Obstacle
- The Scripted Alliance
- The Sanctimonious Lot

### Canon Villain Faction (Original Novel''s Dark Side)

The Hunter typically originates from this faction, or has historical ties to it. Naming guide:
- Names should be threatening, but not excessively labeled as "evil"
- Historical weight and formidability coexist
- Examples:
  - The Obsidian Court
  - Shadowreach
  - The Dusk Legion

### Hunter''s Own Faction (Self-Built Organization)

The faction the Hunter builds or absorbs over the course of the story. Naming guide:
- Names usually do not reveal the Hunter''s true intentions
- Can use a neutral or even seemingly righteous name as cover
- Examples:
  - The Gray Watchers — neutral, unobtrusive
  - The Merchant''s Guild of [Location] — commercial cover
  - Remnant — implies a group of survivors from a dismantled faction

### Wildcard Factions (Extra-Canon Organizations)

Factions appearing outside the original novel''s scope — the Hunter cannot predict their behavior using foreknowledge. Naming guide:
- Names should differ stylistically from both canonical hero/villain faction naming conventions, implying "they don''t belong in this story"
- Can have a more modern feel, a more alien feel, or be so minimal as to be unsettling
- Examples:
  - The Unnamed — minimal, unsettling
  - The Third Option — meta-narrative feel
  - Nullreach — stylistically incompatible with existing faction naming systems

---

## IV. Universal Naming Principles and Prohibitions

### Dual-Layer Naming Awareness

Always remember: in Protagonist Hunter fiction, "canonical naming" and "reality naming" can diverge. Consider designing:
- The Hunter knows a location''s "canonical name" (what it is called in the original novel), but in reality refers to it by its functional purpose
- Some characters have one name in the original novel (known to the Hunter), but in reality have not yet been addressed by that name

This dual-layer naming is a world-building tool unique to the Protagonist Hunter genre and should be fully utilized.

### Absolute Prohibitions

- **Never give the Hunter a name that sounds like a protagonist name**: If the Hunter''s name sounds like a destined hero, it breaks the core "side-character reincarnation" premise
- **Never give the hero an unremarkable name**: The hero''s name MUST have enough "protagonist feel" — otherwise readers cannot understand why the Hunter works so hard against someone named "Bob"
- **Never use grand names for all locations**: The Hunter''s operational spaces are often the margins — these places should have more grounded, utilitarian naming
- **Never let faction names be too similar**: In stories where multiple factions are simultaneously active, faction names must be clearly distinguishable — readers must know at a glance which side a name belongs to',
  (SELECT id FROM novel_creation_method WHERE name = 'The Protagonist Hunter' LIMIT 1),
  1,
  36,
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
