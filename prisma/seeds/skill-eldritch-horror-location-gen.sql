-- The Eldritch Horror Novel「Location」生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Eldritch Horror Novel' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-eldritch-horror-location-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'eldritch-horror-location-gen',
  '「Location」生成：为 The Eldritch Horror Novel 生成场景地点，设计有历史深度和实体印记的地点——每个地点都是一个被宇宙力量触碰过、留有伤疤的空间',
  '"Location" generation: generate locations for The Eldritch Horror Novel, designing spaces with historical depth and entity imprints — every location is a space that has been touched by cosmic forces',
  '## 「Location」生成 — The Eldritch Horror Novel

洛夫克拉夫特式地点设计的核心原则：**地点是历史的见证者，也是实体影响的传导体**。在洛夫克拉夫特小说中，地点不是中性背景——它们是恐惧的主动参与者。一个被实体触碰过的地方会在建筑、地质、生物、人类心理效应中保留那次触碰。地点有记忆，地点有创伤。

---

### 字段生成指南

#### Location Name（地点名称）

名称应该有语源感——旧地名往往包含已被遗忘的警告：
- "Dread Hollow"（恐惧洼地）——名字本身是警告，但没有人记得为什么这么叫
- "Miskatonic"——发音在人类语言里不太对
- 普通地名（"Arkham"、"Dunwich"、"Innsmouth"）——正常中隐藏异常，正是洛夫克拉夫特风格的核心

**命名原则**：地名可以非常普通，也可以隐含不祥。关键不在于名字的戏剧性，而在于名字所指向的历史——这个地方为什么这么叫，叫这名字的人经历了什么。

#### Location Type（地点类型）

类型决定叙事功能：

- **Investigation Hub（调查枢纽）**：图书馆、档案馆、博物馆、家族故居。包含之前发生过的事的记录。恐惧在于记录本身是危险的——其中包含的知识腐蚀阅读者
- **Ancient Site（古代遗址）**：前人类的结构、不可能的废墟、沉没的城市。早于人类文明。比例、材料、基础几何结构不遵循人类建筑逻辑
- **Entity Threshold（实体门槛）**：幕布最薄的地方。不是人类或实体建造的——它只是存在，是现实拓扑的地理意外
- **Cult Gathering（邪典聚集处）**：邪典在此进行仪式或会议。可能是普通建筑被改作他用，也可能是专门为此目的建造的空间
- **Corrupted Nature（腐化的自然）**：与实体活动长期接近并因此改变的森林、海洋、沼泽。野生动物是错的，植物生长模式不跟随阳光，水的味道是某种无法归类的有机物
- **Dead City（死城）**：曾经繁荣、现在空置的定居点。空置的原因是真正的谜题，而不是传统意义上的灾难
- **Forbidden Archive（禁忌档案馆）**：某个理解危险后仍然收集的知识库。收集行为本身是一种陷阱
- **Transitional Space（过渡空间）**：两个领域之间的缝隙——洞穴的最深处、废弃矿井的最底层、异常的地下室

#### Atmosphere（氛围）

最关键的字段——覆盖全感官体验：

- **视觉**：光线质量（阴天仍带琥珀色调）、阴影行为（角度略微不对）、色彩偏移、建筑比例的异样
- **听觉**：不应该存在的声音、应该存在但不存在的声音、存在但无法定位或识别的声音
- **嗅觉**：被实体触碰的地点常带有古老、寒冷、某种有机但无法分类的气味
- **触觉**：温度不一致、表面质感与材料不匹配、被观察的感觉——观察者不在房间里
- **感知存在**：绕过有意识感知接收到的信息——身体在大脑构建出威胁之前就已经对威胁做出反应

不要只写外观，要写为什么待在这里让人感到**不对劲**，即使在能够解释之前就已经感觉到了。

#### History of Horror（恐惧历史）

地点的「创伤史」——它解释了为什么这里**现在是这个样子**：

回答这些问题：
- 在主角之前谁接触过这个地方？
- 他们在寻找什么？
- 他们发现了什么？
- 他们经历了什么？
- 他们留下了什么（文件、警告、污染、对地点本身的改变）？

**最好的地点历史**包含至少三代接触，每代对地点的本质了解更多，离开的能力越来越弱。

#### Active Dangers（当前危险）

不只是「有怪物」，而是具体的威胁机制：
- 知识本身作为危险——地点包含的信息腐蚀接触者的理智
- 实体的注意——在这里意味着被它知道
- 物理危险（建筑不稳定、有毒环境、被封印在特定区域的东西）
- 人类守卫（邪典成员、政府掩盖行动的特工、不知道自己在守护什么的普通人）

#### Forbidden Knowledge（禁忌知识）

地点中存在的具体知识碎片：
- 什么类型的知识（历史记录、仪式文本、实体行为的观察记录、某人的个人日记）
- 由什么媒介承载（石刻、书籍、档案、建筑结构本身）
- 知道这个知识的代价是什么

#### Controlling Entity or Cult（控制实体或邪典）[动态字段]

随剧情推进更新——谁目前控制这个地点，以什么方式控制。

#### Current State（当前状态）[动态字段]

实体影响是活跃的、潜伏的、增强的还是耗尽的。随剧情推进更新。

---

### 地点作为叙事功能

每个洛夫克拉夫特式地点都应该服务于特定叙事功能：

1. **启示地点**：主角在这里学到了某个无法回撤的真相
2. **测试地点**：地点通过其固有危险测试主角的判断和意志
3. **转折地点**：在这里发生的事改变了故事的方向
4. **资源地点**：主角需要从这里获取某些东西——信息、物件、接触点

一个地点可以服务多种功能，但应该有主要功能。地点的主要功能决定了主角在这里遭遇的核心危险和核心收获。',
  '## "Location" Generation — The Eldritch Horror Novel

In Lovecraftian fiction, locations are not neutral backdrops — they are active participants in the horror. A place that has been touched by an entity retains that touch in its architecture, its geology, its biology, its effect on human psychology. Locations have memory. Locations have wounds.

---

### Field Generation Guide

#### Location Name

Location names should carry etymological weight — old place names often contain forgotten warnings:

- The name should be *explicable* (there is a mundane account of how it got this name) but the mundane explanation should feel insufficient
- Some names are overtly warning-shaped: "Dread Hollow," "Blackwater Crossing" — old enough that no one remembers the event that named them
- Some names are linguistically wrong in a way that most people don''t notice: sounds that don''t quite fit the language''s phonetics, combinations that feel slightly off in the mouth
- Lovecraft''s most effective names are almost-ordinary: Arkham, Dunwich, Innsmouth — real-sounding enough to place in a map, specific enough to feel like they contain a history

**Design principle**: The name should be the first indication that this place has a past. The protagonist should be able to look up the etymology and find that the explanation doesn''t entirely account for the name''s weight.

#### Location Type

Type determines the location''s narrative function:

**Investigation Hub** (library, archive, museum, family home): The starting point for most Lovecraftian investigations. Contains records of what happened before. The horror is layered: first, the records indicate something happened; second, the records themselves are dangerous — the knowledge they contain corrupts the reader; third, the records are incomplete in specific ways that suggest previous readers removed things, destroyed things, or couldn''t finish.

**Ancient Site** (pre-human structure, impossible ruins, sunken city, inexplicable geological formation): Predates human civilization. Wrong in ways that are geological — the proportions, the materials, the underlying geometry do not follow human architectural or natural logic. The entities built this, or something like the entities, or something that was here before the entities, or the entities'' activity shaped the site in ways that are indistinguishable from construction. Key design: the site should be wrong at multiple scales — wrong in its overall geometry, wrong in its construction details, wrong in how it interacts with the surrounding environment.

**Entity Threshold** (the place where the veil is thinnest): Not built by humans or entities — it simply *is*, a geographic accident of reality''s topology. Both more and less than a physical place. What distinguishes a threshold from other location types: the wrongness is not historical (something happened here) but ontological (the nature of space and causality is different here). Thresholds are rarely in dramatic locations — they may be in an ordinary-looking basement, a particular spot in a marsh, a bend in a road that no one builds near.

**Cult Gathering** (the location where the cult meets, ritualizes, stores): May be an ordinary building repurposed. May be a location the cult selected because of its existing connection to the entity. The horror of cult gathering sites: they have been used. The walls have absorbed the events that happened in them. The space has been shaped by repeated ritual activity. Someone was here before — many times.

**Corrupted Nature**: Forest, ocean, marsh that has been in proximity to entity activity long enough to change. The wildlife is wrong. The plant growth patterns don''t follow the sun correctly. The water tastes of something that is not salt. Animals that should flee the area are instead drawn to it. The corruption is not dramatic or sudden — it is a long, slow, consistent drift away from normal biological behavior.

**Dead City**: A formerly inhabited settlement now empty. The emptying is the mystery — not war, not disease, not famine as humans understand these things. Something happened that caused everyone to leave, or removed everyone, or changed everyone so completely that what remained was no longer a community in any functional sense. The physical evidence of ordinary life (furniture, tools, documents, the infrastructure of daily existence) remains, but the humans do not.

**Forbidden Archive**: A collection of dangerous knowledge gathered by someone who understood the danger. The collector''s presence permeates the archive — their organizational system, their annotations, their additions and deletions, tell a story of progressive understanding and progressive damage. The archive is a trap: the knowledge is here because someone believed it needed to be known, and anyone who reads it will understand why they were right, and will also understand why they were wrong.

**Transitional Space**: The gap between two domains. The deepest point of a cave system. The bottom level of a mine that was abandoned without explanation. A basement that goes further down than the building''s foundation should allow. A room that is accessed through a door that cannot be found from outside the building. Transitional spaces are defined by their position at the edge of the known — they are where the rules of the ordinary world have thinned enough that what is usually on the other side can begin to press through.

#### Atmosphere

Atmosphere is the most critical field — cover ALL sensory channels:

**Visual**:
- Light quality: locations touched by entities often have subtly wrong light — the quality of amber even on overcast days, shadows that fall at angles inconsistent with available light sources
- Shadow behavior: shadows may not follow light source logic; in more extreme cases, shadows may move independently of objects
- Color: a slight chromatic shift, as if the color temperature of the location is different from the surrounding environment
- Architectural proportion: spaces that are slightly too tall, corridors that are slightly too narrow, rooms whose dimensions don''t add up correctly

**Auditory**:
- Sounds that should not be there: organic sounds in empty structures, patterns in what should be white noise, sounds below or above normal human hearing range that are nevertheless felt
- Absent sounds: the complete silence that has no acoustic explanation — a location where birds do not land, where rain sounds different than it should, where the protagonist''s own footsteps seem absorbed rather than echoed
- Unlocatable sounds: sounds that are present but have no spatial origin — cannot be traced to a source, cannot be confirmed as external or internal

**Olfactory**: Locations with entity contact often smell of: extreme age (organic decay but without the normal biological processes associated with decay), cold (a specific quality of cold that is not temperature-related), and something alive but biologically unclassifiable — an organic note that doesn''t match any known organism

**Tactile**:
- Temperature inconsistencies: warm patches in cold rooms, cold patches in warm rooms, the specific chill that the body interprets as "something is here"
- Surface anomalies: textures that don''t match the material (stone that feels wrong for stone, wood with a grain that runs in the wrong direction)
- The observation sensation: the specific physical feeling of being observed by something that is not present as a physical object in the space

**The felt presence**: This is the most important sensory channel in Lovecraftian atmosphere — the reception of information that bypasses conscious perception. The body''s threat-detection response activating before the mind has constructed a threat to detect. This is not supernatural in the story''s internal logic — it is an accurate response to genuine threat at a level below what consciousness can access. The protagonist feels something before they know something.

#### History of Horror

The location''s trauma history — this explains why it is the way it is:

Answer these questions:
- Who encountered this place before the protagonist?
- What were they looking for?
- What did they find?
- What happened to them?
- What did they leave behind? (documentation, warning, infestation, physical alteration of the site)

The best location histories feature **at least three generations of contact**, each with a different relationship to the site:
- First contact: someone who found the place by accident and didn''t understand what they found, but left evidence that something happened
- Second contact: someone who came specifically because of the evidence from the first contact, understood more, went further, and either didn''t come back or came back changed
- Third contact: someone who came knowing some of what the previous contacts found, with a specific goal, and whose story leads directly to the protagonist''s entry

Each generation should understand more and be less capable of leaving.

#### Active Dangers

Do not list "monsters" — describe specific threat mechanisms:

- **Knowledge as danger**: The location contains information that damages the mind of the reader/recipient. The danger is not physical — it is epistemological. What the protagonist learns here cannot be unlearned, and the learning itself costs something.
- **Entity attention**: Being present in this location means being *known* by whatever is connected to it. The entity''s awareness is not malicious in human terms — but awareness is the prerequisite for attention, and attention changes things.
- **Physical dangers**: Structural instability, toxic environment, things that have been sealed in specific areas of the location. These are physical, direct, and often the easiest to avoid — which makes them potentially misleading. The protagonist may successfully avoid the physical dangers while walking directly into the epistemological one.
- **Human guardians**: Cult members actively protecting the site. Government or institutional agents managing a cover-up. Ordinary people who don''t know what they''re guarding but have been positioned here by circumstances or by others who do know.

#### Forbidden Knowledge

The specific knowledge fragments that exist in this location:

- **Type of knowledge**: Historical record (someone''s account of what happened here), ritual documentation (how to perform an action that achieves a specific result, without explaining why the result occurs), observational record (notes from someone who spent time here documenting what they experienced), structural revelation (the architecture or geology of the location itself encodes information)
- **Medium**: Stone inscription, bound text, loose documents, audio recording, the arrangement of physical objects, marks left on surfaces, biological evidence
- **Cost of knowing**: What happens to someone who successfully receives this knowledge? Not the dramatic cost (madness, death) but the specific cost — what specifically changes in how they experience their life after knowing this?

---

### Location as Narrative Function

Every Lovecraftian location should serve a specific narrative function:

1. **Revelation location**: The protagonist learns something here that cannot be taken back. The location is the setting for an irreversible cognitive event.
2. **Testing location**: The location''s inherent dangers test the protagonist''s judgment and will. They may succeed or fail; both outcomes advance the story.
3. **Pivot location**: What happens here changes the story''s direction. Before this location, the story was going one way; after, it is going another.
4. **Resource location**: The protagonist needs to acquire something here — information, an object, a contact. The acquisition has a cost.

A location can serve multiple functions but should have a primary one. The primary function determines what the protagonist''s core encounter here will be, and therefore what they will gain and what they will lose.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Eldritch Horror Novel' LIMIT 1),
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
