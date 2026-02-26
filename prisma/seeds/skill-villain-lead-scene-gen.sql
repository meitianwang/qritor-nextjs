-- The Villainous Lead「Scene」场景生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Villainous Lead' LIMIT 1)
-- 执行方式 / Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-villain-lead-scene-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'villain-lead-scene-gen',
  '「Scene」场景生成：为反派视角（Villainous Lead）小说生成场景设定，将每个地点设计为战略资产，分析反派优势、陷阱布置与信息控制',
  '"Scene" generation: generate location settings for Villainous Lead novels, designing each location as a strategic asset with analysis of villain advantages, trap placement, and information control',
  '## 「Scene」场景生成 — 反派视角（Villainous Lead）

反派视角的场景设计原则：**每个地点首先是战略资产或战略威胁**，然后才是故事发生的空间。反派主角在思考任何场景时的第一反应是：「这里我有什么优势？我的对手在这里有什么优势？如果战斗在这里发生，局面会如何演变？」

---

### 场景类型设计要点

#### Villain''s Domain（反派领地）

反派完全控制的空间。信息优势（监控、情报网络）+ 地形优势（预设地形、退路、陷阱节点）+ 心理优势（主场气场）。**任何访客在这里始终处于被动**——他们看到的是表演层，反派看到的是系统层。

设计要点：领地的物理设计应反映反派的个性。谋士型反派的领地有多层访问控制和信息管理节点；权力型反派的领地展示绝对权威的精密机构；渗透型反派的领地看起来完全正常，感觉上有些不对。

最有效的使用方式：展示访客（盟友、棋子、或乔装的英雄）在领地中穿行，而读者能看到他们穿过的层层监控和准备，访客自己却看不见。

---

#### Hero''s Territory（英雄领地）

风险最高的场景类型，也是戏剧张力最强的。反派进入英雄的主场，意味着：要么有充分准备（反派已预设多个出口和掩护），要么有不得不去的理由（某个目标只在英雄领地可以达成）。

核心规则：**反派进入英雄领地不能靠运气逃脱，只能靠准备**。进场前必须有明确的入场目的、行动方案和退场路线。展示这套准备的场景是能力展示的绝佳时机。

---

#### Neutral Ground（中立区域）

双方在这里「表演」给对方看，真实交换的是信息而非刀剑。大多数谈判、试探、外交操作发生在中立区域。

关键设计点：中立区域的「中立性」是可以被侵蚀的。反派可能已经在中立区域提前布置了信息收集资产，使这个「公平场地」对反派来说更有利。

---

#### Trap Location（陷阱地点）

特意设计为诱杀点的场景。**陷阱地点的准备过程必须在故事中展示**——这是角色能力展示的最佳时机，也是满足读者期待的重要节点。

最优秀的陷阱设计原则：
- **冗余设计**：如果英雄注意到A要素，B要素仍然有效
- **读者可见性**：读者看到陷阱被一层一层布置，当英雄走进时能看到每个要素激活
- **意料之外的转折**：有一个读者虽然拥有全部信息却没有预料到的细节

---

#### Intelligence Hub（情报中心）

信息流通的节点。控制它就是控制谁知道什么——这是反派维持信息优势的基础设施。

设计维度：什么来源向这个节点输送信息？用什么流程分析信息？如果节点被渗透，反派有什么应急预案？情报中心被攻击的场景是整个计划最脆弱的时刻之一。

---

### Strategic Value（战略价值）——核心字段

不只是「这里有什么资源」，而是「控制这里如何改变信息流、权力流、人员流」。从反派的战略视角分析：控制这个地点使反派获得什么？失去它会失去什么？英雄控制它意味着什么？

---

### Villain''s Advantage Here（反派在此处的优势）

列举反派在这个具体地点的战略资产：预先部署的人员和设备、情报网络的密度、物理控制点的位置、或对地点历史的独家了解。这些优势应该是具体的，而非笼统的「反派比较强」。

---

### 生成原则

- 每个场景首先用战略视角分析，然后才描述物理空间
- Villain''s Domain 的设计应反映反派的具体特质和运作风格
- 陷阱地点必须展示准备过程，不能只展示结果
- Strategic Value 和 Villain''s Advantage 必须具体到可操作层面
- 整体基调：冷静的战略分析，而非情绪化的危险描述',
  '## "Scene" Generation — The Villainous Lead

In the Villainous Lead, locations are strategic assets before they are narrative settings. The villain protagonist thinks about every space in terms of information flow, access control, prepared positions, and tactical geometry. Designing scenes for this genre means designing each location as a board position in an ongoing game — not just a backdrop, but an active component of the villain''s operational infrastructure.

---

### Scene as a Strategic Asset

For each important location, the villain maintains a mental file. The scene generation module should populate this file:

- **Information control**: What information enters and leaves this space? Who controls that flow? Are the exits monitored? Does the villain have assets inside who report activity?
- **Access architecture**: Who has authorized access and how can that authorization be manipulated? What are the entry and exit points and who controls them?
- **Historical leverage**: What events have happened here that only the villain knows, and what does that knowledge provide in terms of operational options?
- **Prepared positions**: What has the villain pre-positioned here — people, equipment, information dead drops, escape routes — before the scene becomes relevant?

This pre-analysis is not paranoia. It is professional practice. The villain who has not mapped a location before operating in it is the villain who gets caught.

---

### Location Type and Narrative Function

#### Villain''s Domain

The purest expression of the villain''s operational capability. Design these spaces to reflect the villain''s specific character and working style:

- A schemer''s domain has multiple layers of access control, information management systems that passively collect data from all visitors, and prepared positions for contingencies the visitor doesn''t know to prepare for
- A tyrant''s domain demonstrates absolute authority through precise machinery — who is allowed in which room, who reports to whom, where information concentrates before reaching the center
- An infiltrator''s domain looks perfectly normal and feels subtly wrong — the dissonance is the point, and only readers who are paying attention will notice the micro-details that reveal the system beneath the surface

Most effective use: show a visitor — ally, pawn, or hero in disguise — navigating the domain while the reader can see the layers of surveillance and preparation they are moving through without knowing it. The reader experiences both the villain''s control and the visitor''s unknowing exposure simultaneously.

#### Hero''s Territory

Use sparingly but with purpose. When the villain enters the hero''s territory, they are accepting elevated risk — this is a significant story beat. Design the scene to show the specific preparations that make this risk acceptable: the cover identity established weeks before, the prepared exit points, the contingency plans for each likely detection scenario.

Critical rule: the villain never exits the hero''s territory through luck. They exit through preparation. The exit should be clean, complete, and demonstrate that the entire visit was designed with the exit in mind. Ideally, the hero discovers that the villain was present, but only after the villain has already achieved the objective and departed — too late to act on the discovery.

#### Neutral Ground

The neutral zone is where the story''s information exchange happens at the highest level. Both parties are performing — showing what they want the other to see while concealing their actual state of knowledge. The villain''s advantage in neutral territory: they almost certainly have pre-positioned intelligence assets there before the meeting, converting the "neutral" space into a subtle home-field advantage.

Design the neutral meeting not as a conversation but as a game of information warfare: what does each party reveal, what do they conceal, what do they learn about the other''s actual position, and what misinformation do they successfully plant?

#### Trap Location

The trap location is one of the genre''s highest-satisfaction structural moves — but only if the preparation is shown. The reader must watch the villain build the trap across multiple scenes: selecting the location, placing specific personnel, creating the bait, arranging the exit. When the hero walks in, the reader has the full architecture in mind and experiences each element activating in sequence.

Design principles for effective traps:

**Redundancy:** If the hero notices element A and avoids it, element B still works. Good traps have at least three layers, each of which could independently succeed. The hero who is smart enough to spot the obvious trap walks into the less-obvious one.

**Reader visibility:** The reader should know more than the hero at every step of the trap''s execution. This requires that the setup scenes give the reader the full picture — not in one exposition dump, but in the distributed information pattern of a well-plotted novel.

**The unanticipated element:** There should be one component of the trap that the reader, even with full information, did not predict. Not a reveal that contradicts established information — a reveal that emerges from information the reader had but did not combine in the right way.

#### Intelligence Hub

The villain''s information advantage is a primary structural advantage over heroes constrained by moral limits on intelligence gathering. Design information hubs to show the active maintenance of information superiority:

- **Source network:** What human and technological sources feed information to this hub? How are those sources protected, and what happens when one is compromised?
- **Analysis function:** Who processes raw information into actionable intelligence? What are their capabilities and limitations?
- **Distribution control:** Who receives intelligence, and what does each recipient know that others don''t? The compartmentalization of intelligence is itself a security measure.
- **Compromise response:** When the hub is breached — and the hero will attempt this — what is the prepared response? The villain who has not anticipated hub compromise will lose their information advantage at the worst possible moment.

---

### Strategic Value (Core Field)

Not "what resources are here" but "how does controlling this location change information flow, power flow, and personnel movement." Frame from the villain''s strategic perspective: what does this location enable? What does losing it cost? What does the hero gaining it make possible?

Example framing: "Control of the Harbor Master''s office provides advance intelligence on all incoming and outgoing ships — including the hero''s supply lines. Losing it reduces our maritime intelligence window from seven days to forty-eight hours. The hero capturing it gives them the ability to surveil our own shipping patterns, which means Operation Coastal must accelerate by two weeks."

This level of specificity transforms the location from a setting into a game piece.

---

### Generation Principles

- Every location should be analyzed through strategic lens before physical description
- Villain''s Domain design must reflect the villain''s specific character and operational style
- Trap locations require preparation scenes — never reveal only the result
- Strategic Value and Villain''s Advantage must be operationally specific, not generic
- Overall tone: cold strategic analysis; the villain does not find locations dramatic — they find them useful or inconvenient',
  (SELECT id FROM novel_creation_method WHERE name = 'The Villainous Lead' LIMIT 1),
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
