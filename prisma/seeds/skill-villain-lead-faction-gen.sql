-- The Villainous Lead「Faction」势力生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Villainous Lead' LIMIT 1)
-- 执行方式 / Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-villain-lead-faction-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'villain-lead-faction-gen',
  '「Faction」势力生成：为反派视角（Villainous Lead）小说生成势力设定，分析各方势力的真实目的、内部裂缝与可利用空间',
  '"Faction" generation: generate faction settings for Villainous Lead novels, analyzing each faction''s true purpose, internal divisions, and exploitable angles',
  '## 「Faction」势力生成 — 反派视角（Villainous Lead）

反派视角的势力设计原则：**没有哪个势力是完全可信任的，也没有哪个势力是完全无法利用的**。反派主角与所有势力的关系都是战略性的，即便是自己旗下的势力也不例外。

---

### 势力类型设计要点

#### Villain''s Own Forces（反派自身力量）

自己的势力是最难管理的，因为反派对其负有全面责任，同时又不能完全信任其中任何人。核心管理架构：

**分仓原则**：没有一个下属拥有计划的完整图景。每个人按需知悉，限制单次背叛能造成的最大损失。

**交叉监视**：不同的下属独立报告彼此的活动，使针对反派的内部阴谋难以持续。

**真实能力被奖励**：只提拔忠诚但无能的人的反派，终将被拥有真正人才的对手击败。反派的组织应该有真正的能人，而能人应该有通过实效（而非政治）晋升的可见路径。

**潜在叛徒**：设计至少一个忠诚基于效用计算而非信仰的野心下属。这个角色提供内部威胁来源，同时测试反派的管理能力。

---

#### The Hero''s Alliance（英雄同盟）

威胁最大、也是最重要的分析对象。英雄同盟不是铁板一块——是一群利益有时重叠、有时分歧的人在共同目标下的临时联合。

分析维度：
- **决策结构**：谁有权力？决策如何制定？英雄的行动自主权有什么限制？
- **内部政治**：英雄同盟内部哪些派系之间存在分歧？哪些分歧是可以扩大的？
- **情报态势**：英雄知道多少？他们的情报网络有什么盲区？哪些盲区是反派在主动维护的？
- **依赖脆弱性**：同盟依赖哪些来源有限的资源？谁控制这些来源？反派能否影响这些来源？

---

#### Neutral Power Brokers（中立掮客）

中立势力已经判断：双方的胜利都不比维持现状更有利于自己。反派对中立势力的目标：让他们成为主动资产，比保持旁观者身份更有价值；同时确保他们永远不会计算出「英雄胜利对我更有利」。

战术手段：
- 提供中立势力想要的信息，且这些信息对反派的代价极低
- 创造需要反派保护的情境，使中立势力产生依赖
- 确保中立势力在反派足够多的行动中留下了足迹，使其技术上无法维持真正中立

---

#### Rival Villain Factions（竞争反派势力）

其他不认同英雄系统的力量。可能的策略：联合对付共同的英雄威胁；利用他们消耗英雄资源后再收割；或者先消灭竞争者，整合力量。

设计关键：竞争反派势力的存在揭示了「反派」标签有多大的容纳空间——并非所有反对英雄系统的力量都有相同的目标或手段。

---

### 核心字段设计

#### Public Identity vs True Purpose（公开身份与真实目的）

**这是本模块最核心的对比字段**。没有一个势力的公开声明完全等于其真实目的。好的势力设计在这两个字段之间制造有意义的落差——这个落差正是反派的利用空间：「我知道你们说你们是为了正义，但我也知道你们真正在保护的是什么利益。」

#### Internal Divisions（内部裂缝）

每个势力内部都有权力竞争、意识形态分歧、个人利益冲突。反派的策略是识别这些裂缝，然后系统性地施加压力——不是直接摧毁英雄，而是让英雄的支持者彼此削弱，使英雄面对危机时缺少可以调动的资源。

#### Suspicion Level（怀疑等级）——动态字段

这个势力对反派真实身份和计划的了解程度。采用阈值模型追踪：
- 低于20%：反派的人员可以公开行动
- 20-50%：需要掩护，但行动仍可行
- 50-80%：该势力正在主动搜集证据
- 超过80%：该势力已得出结论并开始相应行动

反派的管理目标：在推进计划的同时，将关键势力的怀疑等级维持在临界值以下。

---

### 生成原则

- 每个势力必须有「公开身份」和「真实目的」的明确落差
- Internal Divisions 必须具体——是谁与谁之间的什么性质的分歧
- 反派对自身势力的管理应该体现智识而非蛮力（分仓、交叉监视、奖励实效）
- Suspicion Level 用定性描述（相信…/不怀疑…/已开始注意到…）而非数字
- 整体视角：反派把所有势力都视为棋盘上的变量，而非非黑即白的盟友或敌人',
  '## "Faction" Generation — The Villainous Lead

In the Villainous Lead, factions are not monolithic entities — they are collections of individuals with shared interests that will diverge under sufficient pressure. The villain protagonist''s faction management strategy recognizes this and works accordingly: no faction is trusted, no faction is dismissed, and every faction contains individuals whose interests may be separable from the faction''s stated interests.

---

### The Villainous Lead''s Faction Model

The villain''s relationship to every faction follows a core operational principle: know more about the faction than its leadership knows about itself, maintain influence at multiple levels of the hierarchy, and always have a prepared response to the faction shifting from asset to threat. This applies to the villain''s own forces as much as to external factions — the villain who trusts their own organization implicitly will be betrayed by the part they trusted most.

---

### Villain''s Own Forces

The hardest faction to manage because the villain is simultaneously responsible for its performance and unable to fully trust any component of it. Design principles:

**Compartmentalization:** No subordinate has the full picture of the plan. Each operates on a need-to-know basis determined by their role, not by their loyalty level. This limits the damage any single betrayal can cause — the traitor can only reveal what they know, and what they know is incomplete.

**Overlapping surveillance:** Different subordinates independently report on each other''s activities, creating a system where conspiracy against the villain requires coordination across monitored boundaries. The villain should know about brewing discontent before it becomes organized opposition.

**Genuine competence rewarded:** The villain who only promotes loyal incompetents will eventually be defeated by an opponent who promotes competent people. The villain''s organization should have genuine talent, and talented subordinates should have visible paths to advancement through demonstrated effectiveness rather than political alignment. This creates a meritocratic incentive structure that partially compensates for the absence of genuine trust.

**The potential traitor:** Design at least one ambitious subordinate whose loyalty is utility-based rather than belief-based. This character provides a reliable internal threat vector and tests the villain''s management capabilities. The villain knows this subordinate is conditionally loyal — and has built the management structure accordingly. The interesting question is not whether this subordinate will eventually betray the villain, but under what conditions.

---

### The Hero''s Alliance

The most important faction to understand in detail because it is simultaneously the primary threat and the primary operational environment. The villain''s intelligence on the hero''s alliance should be more detailed than the alliance''s own self-knowledge.

**Leadership and decision-making structure:** Who has real authority versus nominal authority? How are decisions actually made — consensus, hierarchy, the hero''s personal authority? What constraints exist on the hero''s autonomy from their own allies? These constraints are operational opportunities.

**Factional politics within the alliance:** Not everyone on the hero''s side agrees with everyone else — the alliance is a coalition of interests. Map the coalitions, identify the fault lines, and note which disagreements can be exacerbated by external pressure or targeted information operations. The hero who cannot get their allies to agree on strategy is effectively operating with reduced resources.

**Information security posture:** What does the hero''s alliance actually know? Where are the gaps in their intelligence network that the villain is actively maintaining? What does the alliance believe that is false, and who planted that belief? The villain''s intelligence advantage is not just what they know — it is what the hero incorrectly believes.

**Dependency vulnerabilities:** What does the alliance need that has limited sources? Who controls those sources? Can the villain influence those sources to introduce scarcity, unreliability, or compromised quality at strategic moments?

---

### Neutral Power Brokers

The most valuable and delicate relationship management challenge. A neutral faction has calculated that neither side''s victory serves their interests better than the current equilibrium. Maintaining this calculation requires active management.

**The villain''s objective:** Make active alliance with the villain more valuable than neutrality, while ensuring the neutral faction never recalculates that the hero''s victory is in their interest. This requires a sustained value demonstration: the villain should provide the neutral faction with tangible benefits that the hero cannot or will not provide.

**Tactical approaches:**

Provide information the neutral faction wants that costs the villain little to share. Information that is genuinely useful, not disinformation — the credibility of the information relationship is itself a long-term asset.

Create situations in which the neutral faction needs the villain''s protection. Manufactured crises are the bluntest instrument; more elegant is identifying existing vulnerabilities the neutral faction faces and positioning the villain as the solution before the problem becomes acute.

Ensure the neutral faction accumulates enough operational connection to the villain''s activities that maintaining genuine neutrality becomes technically implausible. Not blackmail — complicity. They made choices; those choices have implications. The villain is simply the one who keeps accurate records.

---

### Rival Villain Factions

Not all opposition to the hero system has the same goals or methods. Rival villain factions create complex strategic calculations:

**Potential allies against the hero:** Short-term operational alignment may be available when interests temporarily converge. Design these alliances with the understanding that neither party trusts the other, both parties are gathering intelligence on each other during the alliance, and the alliance will end when the immediate shared interest is resolved.

**Resource competitors:** Rival factions compete for the same limited supply of talented people, information assets, and operational territory. The villain may find it more efficient to let the hero exhaust their resources against rival factions before engaging directly.

**Consolidation targets:** A rival faction that has been sufficiently weakened by hero opposition may be more valuable absorbed than opposed. The timing and method of consolidation is a tactical question.

---

### Core Field Design

#### Public Identity vs. True Purpose

The most important contrast in this module. Every faction presents a public justification for its existence and actions. That justification is rarely the complete truth. Design the gap between public identity and true purpose with specificity — this gap is the villain''s operational space: "I know you say you are protecting justice. I also know what specific power interests that ''justice'' actually protects, and I know which questions your justice system is designed to prevent from being asked."

#### Internal Divisions

Every faction has power competitions, ideological disagreements, and personal interest conflicts. Design these with precision: it is not "there are disagreements" but "the intelligence faction believes the military faction is overcommitting resources to open confrontation; the military faction believes the intelligence faction is too risk-averse and is protecting its own assets rather than the alliance''s interests." Specific, operational divisions are exploitable; generic "tensions" are not.

#### Suspicion Level (Dynamic Field)

Use qualitative threshold tracking: "Believes the villain is a political rival with criminal connections; does not suspect the operational role in [specific event]; has begun noticing pattern X but has not connected it to the villain; primary intelligence source is unaware of compromise." This precision allows for accurate modeling of what actions are currently viable and what the trigger conditions are for the faction''s suspicion level to escalate.

---

### Generation Principles

- Every faction must have a meaningful gap between public identity and true purpose
- Internal Divisions must be specific: who disagrees with whom, about what, with what operational implications
- The villain''s management of their own forces should reflect intelligence (compartmentalization, meritocracy, surveillance) rather than raw dominance
- Suspicion Level uses qualitative description — precise knowledge states, not percentages
- Overall perspective: the villain views all factions as variables on a strategic board, not as binary ally/enemy designations',
  (SELECT id FROM novel_creation_method WHERE name = 'The Villainous Lead' LIMIT 1),
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
