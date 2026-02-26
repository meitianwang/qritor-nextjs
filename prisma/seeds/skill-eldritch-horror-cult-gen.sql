-- The Eldritch Horror Novel「Cult」生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Eldritch Horror Novel' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-eldritch-horror-cult-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'eldritch-horror-cult-gen',
  '「Cult」生成：为 The Eldritch Horror Novel 生成邪典组织，设计有内在逻辑的崇拜群体——他们不是「为恶而恶」，而是以自己的理解试图与不可知的存在建立关系',
  '"Cult" generation: generate cult organizations for The Eldritch Horror Novel, designing groups with internal logic who are not "evil for evil''s sake" but attempting to relate to incomprehensible entities in their own way',
  '## 「Cult」生成 — The Eldritch Horror Novel

洛夫克拉夫特式邪典的设计原则：**最可怕的邪典是让人理解其逻辑的那种**。他们之所以可怕，不是因为疯狂，而是因为他们做出了某种残酷的理性选择——与其被毁灭，不如主动臣服。

---

### 字段生成指南

#### Cult Name（邪典名称）

名称应该有伪学术感或民间传承感：
- **伪学术风格**：「星相修士团」、「深渊研究学会」、「认知修正兄弟会」——听起来像学术机构
- **民间传承风格**：「旧约守护者」、「沉睡者的孩子们」——暗示世代传承
- **避免**：直接叫「黑暗教团」、「邪恶兄弟会」——太明显，缺乏内在逻辑感

名称应该暗示这个组织的**自我认知**——他们认为自己在做什么，而不是别人认为他们在做什么。

#### Entity Worshipped（崇拜的实体）

连接到 Cosmic Entities 模块。关键是描述邪典**如何理解**这个实体，而不只是实体本身：
- 邪典的名称用什么称呼它？
- 他们相信它想要什么？
- 他们如何解释与它的关系（服侍者/同盟/子嗣/翻译者）？
- 他们对实体的理解有多准确——哪些是对的，哪些是他们的投射？

#### Founding and History（起源和历史）

邪典存在的起源故事。通常的模式：

1. **个人遭遇**：一个人（创始人）以某种方式遭遇了实体或其影响
2. **解释尝试**：他们尝试理解发生了什么，建立了一套框架
3. **传播**：他们找到了其他同样遭遇过或被这套框架说服的人
4. **组织化**：从松散的信仰者群体变成有结构的组织
5. **演化**：随时间推移，创始人的原始理解被传承、扭曲、争议

最有趣的邪典历史包含：创始人的实际遭遇是什么，以及传承过程中什么被保留、什么被误解、什么被添加。

#### True Goals（真实目标）

邪典的目标通常不被成员自己明确表述，不同成员有不同理解：

- **召唤/唤醒**：使实体与物质世界接触更活跃。成功的代价是不言而喻的，但从未被说出口
- **在毁灭前投降**：得出抵抗无效的结论，正在代表人类（或更现实地，代表他们自己）谈判投降条款。他们相信主动的服侍者比被征服的人口结局更好
- **成为实体喜欢的形态**：将自己（以及通过他们，选定的他人）转变成实体认为更可理解或更有趣的形态。已转变者可能不认为自己失去了什么
- **以服侍换取生存**：实体的漠然可以被解读为隐性许可——允许继续存在，只要提供服侍。邪典维持这个安排
- **真正的信仰**：真诚的虔诚，不是交易。这类邪典成员最难预测，因为他们不是在理性自利的逻辑上运作——他们在某种类似爱的东西上运作

#### Methods（方法）

不只是「举行仪式」，而是具体的行为体系：

- **信息收集和压制**：渗透机构、获取或销毁危险文本、控制某些知识的传播
- **地理影响**：在实体地点附近持有土地所有权、影响城市规划、将特定地点维持在特定状态
- **遗传管理**：古老家族的方面——某些血统携带特定特征，使其成为有用的容器、载体或解释者
- **主动仪式**：最可见但不是最重要的方法——仪式是冰山之尖
- **金融和社会基础设施**：存活了数百年的邪典建立了超越其个别成员寿命的结构

#### Scale and Reach（规模和影响范围）

决定主角面对的组织有多大：
- **本地邪典**：集中在特定社区或地点，成员数十人，深度渗透小范围地区
- **区域网络**：跨越多个城市或地区，有通讯和资源共享体系
- **全国组织**：有中央领导层和地区分支，可以动员相当资源
- **跨国古老秘密**：世代存在，在多个国家有根基，机构设施已经深入合法体系

#### Internal Corruption（内部分裂）

邪典内部的内耗——这是使邪典成为可利用的对手而非单一障碍的关键：

- **真信仰者 vs 机会主义者**：有人真正相信，有人只是想利用组织访问的知识或资源
- **旧卫 vs 新成员**：原始知识的持有者与只有不完整信息的新近入门者之间的紧张
- **已转变者 vs 抵抗转变者**：那些已经以某种方式被改变的成员，与那些寻求保持人类身份的成员之间
- **加速派 vs 维持现状派**：想要推进议程的与想要维持当前安排的
- **不同神学解释**：对实体的本质、其意志、正确的侍奉方式的不同理解，产生了实际上相互冲突的教派

#### Current Influence（当前影响力）[动态字段]

组织目前的活跃程度和影响范围。随剧情推进更新。

#### Internal Stability（内部稳定性）[动态字段]

内部分裂的当前状态——矛盾是潜伏的还是活跃爆发的，主角可以利用哪些裂缝。随剧情推进更新。

---

### 邪典作为叙事工具

洛夫克拉夫特式邪典在故事中扮演多重角色：

1. **知识来源**：邪典成员是主角可以（危险地）获取信息的人。他们知道的比官方渠道知道的多，但他们传递信息有代价
2. **对立面镜像**：邪典展示了如果主角做出不同选择会走向哪里。最好的邪典成员是主角的扭曲倒影
3. **内部矛盾的来源**：不同的邪典派系可能有相互矛盾的目标，主角可以利用这些矛盾
4. **理解实体的窗口**：通过邪典的视角，读者可以了解实体的部分性质——而邪典所知的不完整性本身就是恐惧的一部分',
  '## "Cult" Generation — The Eldritch Horror Novel

The most effective Lovecraftian cult is not a cartoonishly evil secret society — it is a community of people who encountered something, came to believe something based on that encounter, and organized around that belief. Their actions are often horrifying. Their logic is often internally coherent and, from certain angles, even defensible.

---

### Field Generation Guide

#### Cult Name

The name should reflect the cult''s **self-perception**, not how outsiders would describe them:

- **Pseudo-academic register**: "The Order of Stellar Correspondences," "The Institute for Deep Phenomenology," "The Brotherhood of Cognitive Revision" — these sound like scholarly organizations, which is often what they started as
- **Folk tradition register**: "The Keepers of the Old Covenant," "The Children of the Sleeper," "Watchers of the Threshold" — implies generational transmission, something passed down rather than newly invented
- **Functional naming**: Organizations that have been around long enough may have purely functional names — "The Society," "The Foundation," "The Compact" — the name is old enough that its original meaning has been lost

**Avoid**: "The Dark Brotherhood," "The Evil Cult" — names that reflect how outsiders would describe them rather than how members understand themselves. The self-perception gap is part of what makes cults interesting.

#### Entity Worshipped

Connect to the Cosmic Entities module, but focus on **how the cult understands** the entity:

- What name does the cult use for it, and what does that name mean in their theology?
- What do they believe it wants from them? (Their interpretation is probably partially wrong in ways that matter)
- How do they describe their relationship to it? (Servants? Intermediaries? Children? Its voice in the material world?)
- What aspects of the entity''s nature has the cult correctly understood, and what have they misunderstood or invented?

The gap between the cult''s interpretation and the entity''s actual nature (as the story reveals it) is narratively rich. The cult may have gotten some things right — enough to function, enough to have real power — while being wrong about the most important things.

#### Founding and History

The cult''s origin story. The typical pattern:

1. **The founding encounter**: One person (the founder) had some form of contact with the entity or its effects. This encounter was probably not a dramatic revelation — it may have been something ambiguous, inexplicable, or terrifying that they spent years trying to understand.

2. **The interpretive framework**: They constructed a way of understanding what happened to them. This framework became the cult''s theology. Its accuracy varies; its psychological function is to make the encounter survivable and meaningful.

3. **Propagation**: They found others who had similar experiences, or who were persuaded by the framework, or who wanted access to whatever power the framework seemed to offer.

4. **Institutionalization**: From a loose community of believers to a structured organization with roles, hierarchies, rituals, and methods of member selection.

5. **Evolution through generations**: The founder''s original understanding has been transmitted, distorted, debated, and elaborated. What was personal experience has become doctrine. What was improvised response has become prescribed ritual.

The most interesting founding histories include: what the founder''s actual experience was, and what was preserved, misunderstood, and added during transmission.

#### True Goals

Cult goals are typically unstated as explicit objectives — different members understand the cult''s purpose differently, and all of them may be partially wrong:

**Summon/Awaken**: Bring the entity into more active contact with the material world. This goal may be understood within the cult as "completing the great work," "fulfilling the ancient promise," or "ending the long sleep." The horror is that success may be achievable, and what happens after success is never articulated because articulating it would require acknowledging what it means.

**Surrender Before Destruction**: Having concluded that resistance to the entities is futile, the cult is negotiating terms of surrender on behalf of humanity — or more realistically, on behalf of themselves and a selected few. They believe that willing servants fare better than conquered populations. They may be right. The question of whether "faring better" in this context constitutes anything a human would recognize as good is not one they ask.

**Become What the Entity Prefers**: Transform themselves — and through them, select others — into something the entities find more comprehensible, more interesting, or more useful. The transformed may not consider themselves to have lost anything. They may be correct that they haven''t lost anything. They may be correct in a way that makes the statement more disturbing rather than less.

**Service in Exchange for Survival**: The entities'' indifference to human existence can be read as implicit permission — you may continue existing as long as you render service. The cult maintains this arrangement. They believe the arrangement is working. They may be right that it''s working; the question is what "working" means when one party to the arrangement is not operating on human terms.

**True Faith**: Genuine devotion, not transaction. These cultists are the most unpredictable because they are not operating on rational self-interest — they are acting on something that functions like love or reverence. They cannot be bought, cannot be reasoned with, and cannot be deterred by demonstrating that the entity does not reciprocate their devotion. In fact, demonstrating that the entity is indifferent often strengthens their faith rather than breaking it.

#### Methods

Make methods specific, varied, and plausible:

**Information control**: Infiltrating academic institutions, archives, government agencies. Acquiring dangerous texts to control access to them (or to use them). Suppressing accounts of entity activity. Creating false explanations for events that might otherwise prompt investigation. Some cults work through destruction; some work through misdirection; some work through flooding available information with noise so that accurate accounts cannot be distinguished.

**Geographic influence**: Owning land near entity-relevant sites. Influencing urban development decisions to maintain or protect specific locations. Ensuring that certain places remain accessible, or that certain places remain avoided, depending on what the entity''s activity requires. Some cults have maintained specific geographic arrangements for centuries, passing the knowledge and the obligation from generation to generation.

**Genetic management**: The "old family" aspect of many Lovecraftian stories. Certain bloodlines carry specific traits — perceptual sensitivity, specific physiological characteristics, the ability to serve as vessels or conduits — that make them useful. Cults that understand this manage these bloodlines over generations. They may call it something else: tradition, purity, stewardship. The function is the same.

**Active ritual**: The most visible method is not the most important one. Ritual is the tip of the iceberg — the visible manifestation of a larger system of relationship maintenance. What the ritual actually does (if anything) varies; what it does for cult cohesion and member identity is more consistent.

**Financial and institutional infrastructure**: A cult that has survived for centuries has built structures that outlast individual members. Foundations, trusts, organizations, businesses. These provide resources, cover, legitimate access to institutions, and continuity of operation regardless of what happens to any individual member.

#### Scale and Reach

Scale determines how large an obstacle the protagonist faces:

- **Local cult** (dozens of members): Concentrated in a specific community or location. Deep penetration of a small area. The protagonist can potentially identify and confront most members. The danger is intimate.
- **Regional network** (hundreds of members across multiple communities): Coordination across geography. Resources and communication systems. The protagonist faces an organization that can respond to their investigation across multiple locations.
- **National organization**: Central leadership with regional nodes. Can mobilize significant resources and personnel. Has likely penetrated legitimate institutions at various levels.
- **Transgenerational ancient secret**: Has existed for centuries, with roots in multiple countries. Deeply embedded in legitimate institutions. The true scope is incomprehensible to any single investigator — the protagonist will never be able to see the whole of it.

#### Internal Corruption

Cults have factions. The internal tensions:

- **True believers vs. opportunists**: Some members genuinely believe; some joined for access to knowledge, power, or community, and would leave if the costs exceeded the benefits. The true believers find the opportunists contemptible; the opportunists find the true believers useful and unstable.

- **Old guard vs. new initiates**: Those with the original knowledge vs. those with only partial transmission. The old guard may not trust new members with everything — for reasons of security, for reasons of power, or because they genuinely believe that incomplete knowledge is dangerous. The new initiates may believe they have the full picture.

- **The transformed vs. the resistant**: Members who have been changed — physiologically, psychologically, or in more fundamental ways — by their contact with the entity, vs. those who have managed to maintain more conventional human identity. The transformed may have access to capabilities the resistant do not; the resistant may be the only ones making decisions on recognizably human terms.

- **Accelerationists vs. maintainers**: Those who want to push the agenda to completion as quickly as possible vs. those who believe that the current arrangement (entity influence managed, contained, directed) is the optimal sustainable outcome. These factions may have genuinely incompatible tactical priorities.

- **Theological divergence**: Different interpretations of the entity''s nature, its will, the correct forms of propitiation, who is authorized to interpret the entity''s communications. What began as one cult may have effectively become multiple cults that continue to cooperate on operational matters while being in genuine doctrinal conflict.

These tensions are exploitable by the protagonist. They are also why the cult is not a monolithic antagonist but a collection of individuals with incompatible goals who happen to be organized together. Some of these individuals may be potential allies — not because they are good people, but because their goals temporarily align with the protagonist''s survival.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Eldritch Horror Novel' LIMIT 1),
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
