-- The Eldritch Horror Novel「Worldbuilding」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Eldritch Horror Novel' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-eldritch-horror-worldbuilding-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'eldritch-horror-worldbuilding-setting-gen',
  '「Worldbuilding」设定生成：为 The Eldritch Horror Novel 生成世界观设定，包括 Setting Era、World Status、World Details、Power Structure、Mythos Elements、Key Locations',
  '"Worldbuilding" setting generation: generate worldbuilding settings for The Eldritch Horror Novel, covering setting era, world status, power structure, mythos elements, and key locations',
  '## 「Worldbuilding」设定生成 — The Eldritch Horror Novel

洛夫克拉夫特式世界观的核心是「世界本就在崩溃边缘」——正常表面之下，实体们的存在正在腐蚀现实基础。Setting Era 影响恐惧来源：现代的恐惧在于科学无法解释；维多利亚的恐惧在于理性世界观的崩溃；后末日的恐惧在于神灵已经介入之后的世界。

---

### 字段生成指南

#### Setting Era（时代背景）

时代选择决定了恐惧的入场方式：

- **当代**：科学扩展了人类的认知自信，实体彻底推翻这种自信。全球通讯意味着曾经被遗忘的地域性真相可以瞬间传播
- **维多利亚/爱德华时代**：理性自信的顶峰迎来实体的正面冲突。世界正在被绘图、分类、解释——然后出现了无法绘图、分类或解释的东西
- **20世纪早期**：一战已经动摇了文明与理性的信仰。实体降临进入一个已经破碎的世界
- **架空历史**：使用历史框架但修改关键事件，使实体的存在有不同的历史脉络
- **后末日**：实体已经影响了世界进程。问题不是「它们会醒来吗」而是「它们介入之后留下什么」
- **跨时代碎片**：叙事横跨多个时代，展示实体影响的长期演化

#### World Status（世界状态）

决定恐惧的可见程度：

- **表面正常实则腐化**：日常生活继续。恐惧在于空白——为什么没有人谈论图书馆三楼发生的事？为什么找不到这个小镇创始人的记录？
- **缓慢觉醒**：某些东西变得更活跃。异常事件的频率在增加，更多人梦见相同的东西，现实正在产生裂缝
- **已部分崩溃**：在特定区域，幕布已经变薄甚至消失。实体影响在建筑、天气、生物形态中可见
- **直面边缘**：主角站在接触点——现实与实体领域的交界处，任何一个错误都会导致越界
- **在崩溃后存在**：实体已经部分介入，世界在适应这一新常态，但「适应」本身就是最深的恐惧

#### World Details（世界细节）

描述世界的具体「不对劲」之处——不是明显的超自然，而是统计异常、历史空白、文化禁忌的密集分布：

**不对劲的层次**：
1. **统计异常**：失踪率异常高、特定日期的死亡记录缺失、某个家族的成员寿命都精确止于同一年龄
2. **历史空白**：档案馆有系统性缺失，某个时间段没有记录，记录过后续被系统性销毁
3. **文化禁忌**：不许提及的话题、不许进入的区域、代代相传的特定行为规范——没有人记得为什么，但所有人都遵守
4. **感知偏差**：在某些地点，人们的时间感不可靠；梦境有奇异的一致性；人们对同一事件的记忆系统性地出现相同的空白

#### Power Structure（权力结构）

洛夫克拉夫特式权力结构的核心特征：**官方力量结构性无能，隐秘力量已被染指**：

- **官方权力**（政府、军队、学术界）：其世界观没有处理实体的分类体系，因此结构性无能。当他们遭遇实体时，第一反应是否认，第二反应是掩盖，第三反应是被摧毁
- **隐秘权力**：那些知道的人（秘密社团、古老家族、邪典领袖）要么试图控制信息，要么试图利用知识，要么已经被其所知的东西腐化
- **主角位置**：存在于两种结构之外——因此既更自由，也更危险

#### Mythos Elements（神话元素）

用具体化的洛夫克拉夫特神话体系元素填充世界——不是抽象的「古老邪恶」，而是命名的物件、特定地点、具体文本、描述过的仪式。每个神话元素应包含：人类认知的名称/功能，实际是什么/有何效果，以及一个具体接触过它的人和他们的结局。

#### Key Locations（关键地点）

关键地点必须是地方的「性格研究」——每个重要地点应该有被它所见证的事物和它所包含的东西所定义的性格：

- **表面外观**：初次访客看到什么，如何合理化解释
- **感知异常**：无法用表面解释的东西，在被理解之前先被感受到
- **历史接触**：谁来过这里，寻找什么，发现什么，是否回来了
- **当前状态**：实体影响是活跃的、潜伏的、增强的还是耗尽的

地点的「不对劲」必须是具体的，不是笼统的「这个地方很邪恶」，而是「这里的光线即使在阴天也带有琥珀色调，影子的角度略微不对」。

---

### 字段联动关系

1. **Setting Era → World Status**：时代决定了崩溃的起点——当代世界从「表面正常」开始更具冲击力；后末日世界往往已经是「部分崩溃」
2. **World Status → World Details**：状态决定了「不对劲」的可见程度——缓慢觉醒的世界细节应该是模糊的、可以有理性解释的
3. **World Details → Power Structure**：具体的异常决定了谁知道、谁控制信息、谁已经被改变
4. **Power Structure + Mythos Elements → Key Locations**：权力结构和神话元素共同决定了哪些地点具有叙事意义',
  '## "Worldbuilding" Setting Generation — The Eldritch Horror Novel

The Lovecraftian world operates on a fundamental hidden truth: what humans call "reality" is a thin surface crust over an incomprehensibly vast and alien substrate. The entities exist; they have always existed; they are not exceptions to the rules of the universe — they ARE the deeper rules of the universe. Human civilization is not threatened by the entities — it was always *built on top of* them.

---

### Field Generation Guide

#### Setting Era

Setting Era determines the nature of the horror''s entry point:

- **Contemporary**: The horror is horror because science has expanded humanity''s confidence in understanding the universe — and the entities invalidate that confidence completely. Also: global communications mean that what was once local, contained, forgotten can now spread instantly.
- **Victorian/Edwardian**: The height of rational confidence meets the entities at their most intrusive. The world is being mapped, catalogued, explained — and then something appears that cannot be mapped, categorized, or explained.
- **Early 20th Century**: Lovecraft''s original setting. The aftermath of WWI has already shaken faith in civilization and reason. The entities arrive into a world already fractured.
- **Alternate History**: Uses historical frameworks but modifies key events so that entity contact has a different historical trajectory — perhaps contact occurred earlier, was more widely witnessed, or was officially acknowledged and suppressed.
- **Post-Apocalyptic**: The entities have already influenced events. The question is not "will they awaken" but "what remains after they did?" Survival in a world where the entities are already partially present.
- **Cross-Era Fragments**: The narrative spans multiple time periods, showing the long-term evolution of entity influence — how contact in 1692 shaped what the protagonist encounters in 1987.

**Era selection shapes the horror''s texture**: Contemporary horror benefits from the gap between institutional competence and entity incomprehensibility. Victorian horror gains power from the contrast between confident rationalism and complete inexplicability. Post-apocalyptic horror is already past the tipping point — the question is not whether the worst will happen but what it means to survive after it has.

#### World Status

World Status determines how visible the horror is at the story''s opening:

- **Normal Surface / Corrupted Underneath**: The most common starting point. Everyday life continues. The horror is in the gaps: why does no one talk about what happened to the third floor of the library? Why are there no records of the town''s founders? Why do the old families keep marrying their cousins — what are they preserving or hiding? This status creates dramatic irony: the reader and protagonist gradually realize that the normalcy was always false.
- **Slow Awakening**: Something is becoming more active. The frequency of wrong events is increasing. More people are dreaming the same things. The rate of "explained" disappearances is rising. Reality is not yet broken but is developing cracks. This status creates dread through escalation — the protagonist watches the world they know becoming unreliable.
- **Already Partially Collapsed**: In certain zones, the veil is thin or gone. The entities'' influence is visible in the architecture, the weather, the biology of living things in the area. Most people avoid these zones; the protagonist cannot. This status removes the pretense and forces direct confrontation sooner.
- **At the Threshold**: The protagonist stands at a contact point — the boundary between reality and the entities'' domain. Any mistake crosses it. This status creates unbearable tension through proximity.
- **Post-Collapse Existence**: The entities have partially intervened. The world is adapting to this new normal — and the adaptation itself is the deepest horror. Humans are normalizing the impossible, developing cultural practices around the entities'' presence, treating the unthinkable as a fact of life.

#### World Details

World details answer the core question: **What SPECIFICALLY is wrong here?**

Good Lovecraftian world details are not obvious supernatural events but a dense distribution of statistical anomalies, historical gaps, and cultural prohibitions:

**Layers of wrongness**:

1. **Statistical anomalies**: Disappearance rates that are precisely, inexplicably elevated. Death records with systematic gaps on specific dates. A family line where every member dies at exactly the same age. Events that should be random but form patterns. The horror is that the data is correct — the explanation is what destroys minds.

2. **Historical voids**: Archives with systematic absences. An entire decade with no records. Accounts that were clearly continued and then stopped. Buildings on the town map that don''t exist in the physical town. A family''s genealogy that traces back to a specific ancestor and then — nothing. Not destruction of records, but absence as if the events never occurred.

3. **Cultural prohibitions**: Topics that are not discussed. Areas that are not entered. Behavioral norms passed down through generations that no one remembers the origin of — but everyone follows. These prohibitions are the accumulated wisdom of previous contacts, stripped of their original context by time, leaving only the behavior.

4. **Perceptual inconsistencies**: Time passes unreliably in certain locations. Dreams exhibit impossible consistency — people who have never met describe the same images. Memories of specific events have the same systematic gaps across unrelated individuals. The body perceives threat before the conscious mind has information to perceive threat from.

#### Power Structure

The core feature of Lovecraftian power structures: **official power is structurally incapable; hidden power is already compromised**:

- **Official power** (government, military, academia): Their worldview has no category for the entities. When they encounter entity activity, the institutional response follows a predictable sequence: denial, classification as known phenomenon, suppression of conflicting evidence, exposure, and destruction. Their competence in addressing human-scale problems makes their total inadequacy before entity-scale problems more horrifying.

- **Hidden power**: Those who know have organized around that knowledge. But knowledge of the entities does not provide safety — it provides a more accurate picture of how unsafe the situation is. The hidden knowing class is divided between those using knowledge to suppress (contain the damage), those using it to exploit (leverage the entities'' indifference into power), and those already compromised by it (no longer operating on human interests).

- **The protagonist''s position**: Outside both structures. This is simultaneously liberating (not bound by institutional frameworks that can''t handle the truth) and extremely dangerous (no institutional protection, no support structure, no legitimized authority to call on).

#### Mythos Elements

Populate the world with specific concrete references — not abstract "ancient evil" but named objects, specific locations, particular texts, described rituals. Each mythos element should have:

- Its **human-perceived name and function**: What do ordinary people call it? What do they believe it does?
- What it **actually is and does**: The entity''s-eye-view of the object, location, or practice
- One **specific person** who encountered it and what happened to them: Not a category ("many people were affected") but an individual with a name, a profession, a moment of contact, and a specific outcome

The mythos elements should form a coherent system — they should all be pointing at the same underlying reality, even if the humans who encountered them didn''t realize the connections.

#### Key Locations

Key locations must be character studies of places. Every important location should have:

- A **surface appearance**: What a first-time visitor sees and how they rationalize it. The rationalization should be *plausible* — this is not an obviously haunted house but a place that a reasonable person could explain away.
- A **felt wrongness**: What cannot be explained by the surface, experienced before it is understood. The body''s response precedes conscious understanding.
- A **history of contact**: Who came here before the protagonist? What were they looking for? What did they find? Whether they came back — and what they were like when they did.
- A **current state**: Is the entity''s influence active, dormant, increasing, or spent? This determines what the protagonist encounters.
- A **specific revelation**: What truth does this place embody or protect? What does the protagonist learn here that they cannot unlearn?

**Atmosphere design — ALL sensory channels**:
- *Visual*: Light quality (amber tones on overcast days), shadow behavior (falling at slightly wrong angles), color shifts, architectural proportions that don''t quite follow human ergonomic logic
- *Auditory*: Sounds that shouldn''t be there. Sounds that should be there and aren''t. Sounds that are present but cannot be located or sourced.
- *Olfactory*: Locations touched by entities often have a smell quality that is organic but unidentifiable — cold, old, something alive that isn''t biological in any known way
- *Tactile*: Temperature inconsistencies. Surface textures that don''t match the material. The specific feeling of being observed by something that is not in the room.
- *The felt presence*: Information received that bypasses conscious perception — the body''s threat response activating before the mind has constructed a threat.

**The best location histories** feature at least three generations of contact, each progressively more understanding of the location''s nature and progressively less capable of leaving.

---

### Field Interdependencies

1. **Setting Era → World Status**: The era determines the collapse''s starting point. Contemporary settings benefit from "Normal Surface / Corrupted Underneath"; post-apocalyptic settings typically begin at "Post-Collapse Existence."

2. **World Status → World Details**: Status determines the visibility threshold of wrongness. Slowly awakening worlds should have details that are ambiguous — each one explainable alone, only the pattern revealing the truth.

3. **World Details → Power Structure**: Specific anomalies determine who knows, who controls information, and who has already been changed by what they know.

4. **Power Structure + Mythos Elements → Key Locations**: The intersection of power dynamics and entity contact points determines which locations carry narrative weight.

5. **Key Locations → Entry Points**: Each key location should function as a potential entry point into the next layer of revelation — the protagonist learns something here that makes the next location necessary.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Eldritch Horror Novel' LIMIT 1),
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
