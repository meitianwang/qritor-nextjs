-- The Protagonist Hunter「Hunter Strategy」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Protagonist Hunter' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-protag-hunter-hunter-strategy-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'protag-hunter-hunter-strategy-setting-gen',
  '「Hunter Strategy」设定生成：为 The Protagonist Hunter 生成猎杀策略核心设定，包括5种策略路线的选择与组合、当前猎杀阶段划分，以及蝴蝶效应管理机制的设计',
  '"Hunter Strategy" setting generation: generate the core hunting strategy configuration for The Protagonist Hunter, including selection and combination of 5 strategy routes, current phase of the hunt, and butterfly effect management design',
  '## 「Hunter Strategy」设定生成 — The Protagonist Hunter

「Hunter Strategy」是猎杀主角小说的战略核心。它回答一个关键问题：主角打算怎么干掉/废掉那个被天命选中的勇者？仅仅靠"我比他强"或"我比他更聪明"是不够的——勇者有主角光环作为底层保障，正面硬刚往往会激活主角光环的反噬效果。真正有效的猎杀策略必须是系统性的、多维度的、能够应对变数的。

---

### 一、5种核心策略路线

#### 策略路线1：机缘剥夺（Fortune Denial）

**核心逻辑**：勇者的成长依赖"机缘"——神器、导师、觉醒时刻、关键战斗胜利。如果这些机缘被主角提前抢走、消耗或破坏，勇者的成长曲线将会断裂。

**适用场景**：
- 主角对原著剧情有章节级别的了解，知道确切的机缘触发地点和时间
- 主角的行动隐蔽性足够高，不会被正派势力关注

**典型操作**：
- 提前到达勇者的"圣地"，将神器取走或损毁
- 消耗或污染勇者本应获得的特殊资源（秘境、精灵的祝福等）
- 抢先与勇者的"命定导师"建立关系，使导师死亡、离开或转变立场

**风险与反制**：
- 勇者可能通过主角光环"随机"获得等价替代机缘（命运补偿效应）
- 频繁出现在关键地点会引起正派势力的注意，暴露主角的预知能力

**蝴蝶效应敏感度**：高。剥夺一个机缘可能触发整个机缘链的重组，产生主角未曾预见的替代路径。

---

#### 策略路线2：力量封锁（Growth Suppression）

**核心逻辑**：不直接夺取机缘，而是从根源上压制勇者的成长速度——削减他的战斗经验来源、降低他能接触到的挑战难度（让他无法从战斗中成长），或直接对他造成无法弥补的身体/精神损伤。

**适用场景**：
- 主角无法直接接触到机缘地点，但可以通过操控世界环境来间接阻碍
- 主角更适合在幕后操控，而非亲自行动

**典型操作**：
- 提前清除勇者成长路径上的所有"练级怪"，使勇者无法获得足够的战斗经验
- 人为制造"世界太平"假象（消灭区域魔物），使勇者失去成长的动力和环境
- 向勇者的队伍中渗透"阻碍者"，从内部拖慢其成长节奏
- 通过政治手段限制勇者的行动范围（例：让国王怀疑勇者的忠诚）

**风险与反制**：
- 压制过度会导致勇者"绕路"，走上原著未曾描写的成长路径，造成信息盲区
- 勇者一旦感知到有人在系统性压制他，会激活更强的反抗意志（主角光环激活）

**蝴蝶效应敏感度**：中。压制措施通常是面向整个世界环境的调整，影响范围广但单点敏感度低。

---

#### 策略路线3：提前清除（Preemptive Elimination）

**核心逻辑**：在原著时间线的早期阶段，趁勇者尚未拥有足够实力时直接终结。这是最直接的路线，但也是风险最高的——主角光环对直接威胁最为敏感。

**适用场景**：
- 主角拥有绝对的初期实力优势（勇者在Chapter 1-5的实力无法抗衡）
- 有充分的借口执行清除，不会留下"猎杀主角"的痕迹
- 原著中勇者的死亡不会触发"神明补救机制"（某些设定中，神明会复活或替换勇者）

**典型操作**：
- 在勇者刚转生/召唤的混乱期发动清除，利用信息差直接出手
- 通过看似无关的第三方势力来消灭勇者，保持主角的隐蔽性
- 制造"意外"而非直接对决（陷阱、灾难、政治迫害）

**风险与反制**：
- 主角光环的"危机感知"能力可能使勇者在关键时刻获得本不应有的救援
- 早期清除成功后，神明系统可能"补召"一个新的勇者，问题未能根本解决
- 若清除失败，勇者会记住威胁，提前进入战斗状态，后续猎杀难度倍增

**蝴蝶效应敏感度**：极高。勇者被提前清除可能导致整个世界走向发生根本性偏转，主角的所有预知都将失效。

---

#### 策略路线4：盟友瓦解（Alliance Disruption）

**核心逻辑**：勇者不是孤身作战的，他的力量来自于伙伴、盟友、国家的支持。如果将这些支持系统逐一瓦解——制造信任危机、挑拨离间、斩断政治支援——勇者将在孤立中逐渐衰弱，最终面对的只是一个失去一切支撑的个体。

**适用场景**：
- 主角擅长政治操控和信息战，而非正面战斗
- 勇者的队伍人际关系复杂，原著中本有裂痕（只是被勇者的人格魅力弥合了）
- 主角有足够的政治资源进行长期渗透操作

**典型操作**：
- 让勇者的核心伙伴"提前"经历原著中本会让他们产生嫌隙的事件，使裂痕提前出现
- 收买或威胁勇者队伍的非核心成员，在关键时刻制造背叛
- 通过散布谣言和伪造证据，使支持勇者的国家/势力对他产生疑虑
- 挖走勇者的"备用伙伴"——原著中如果某个伙伴死亡，会有替补出现；主角将所有潜在替补都提前招募或清除

**风险与反制**：
- 勇者的人格魅力（主角光环的社交维度）可能使被挑拨的伙伴自行化解矛盾
- 操控行动一旦被识破，会使多个势力同时对主角产生敌意

**蝴蝶效应敏感度**：中高。针对具体人物关系的操控，改变的是人际化学，而非世界运行规则，可控性相对较高。

---

#### 策略路线5：腐化转化（Corruption/Conversion）

**核心逻辑**：最高难度但最彻底的策略——不是消灭勇者，而是改变他。将勇者的正义感腐化为愤怒，将他的信仰摧毁，将他转化为主角的工具，或使他成为一个不再被神明认可的"堕落勇者"。此策略使用成功后，等于同时完成了"消灭威胁"和"获得最强战力"两个目标。

**适用场景**：
- 故事定位允许道德灰色地带，不需要主角是绝对的"恶役"视角
- 作者希望探索"腐化/救赎"主题的复杂性
- 勇者人物设定中有明显的心理弱点或执念可以被利用

**典型操作**：
- 针对勇者的道德信仰施加持续打击（让他亲眼目睹他所相信的"正义"带来的破坏）
- 利用勇者在原著中已有的心理创伤加以深化，使其无法维持正义者的姿态
- 向勇者提供"黑暗力量"的诱惑，让他在力量增长与道德沦丧之间反复挣扎
- 使勇者相信主角才是真正的正义方，从而主动追随（最高难度变体）

**风险与反制**：
- 腐化策略耗时最长，期间主角必须持续维系与勇者的接触，暴露风险极高
- 腐化失败可能使勇者的意志更加坚定（"试炼之火"效果），触发主角光环的强化

**蝴蝶效应敏感度**：低。此策略针对的是人心，而非剧情节点，对世界时间线的扰动最小，但对勇者个人走向的影响最深远。

---

### 二、当前猎杀阶段划分

猎杀行动分为5个阶段，每个阶段有不同的核心任务和危机类型：

**阶段1：准备期（Preparation Phase）**
- 主要任务：建立情报网络、积累基础实力、确认原著时间线与现实的对应关系
- 标志事件：主角完成第一次对原著事件的成功预测
- 常见危机：原著随机事件威胁主角自身生存；对时间线的误判导致资源浪费

**阶段2：拦截期（Interception Phase）**
- 主要任务：针对勇者早期成长的关键机缘实施第一轮干预
- 标志事件：主角第一次成功改变原著中的一个重要事件
- 常见危机：蝴蝶效应开始显现，时间线开始偏离预测；勇者的行动开始超出原著范围

**阶段3：孤立期（Isolation Phase）**
- 主要任务：瓦解勇者的支持系统，切断其补给和盟友
- 标志事件：勇者队伍发生第一次重大内部危机
- 常见危机：被主角操控的政治事件反噬到主角自身势力；新的野牌势力出现

**阶段4：对抗期（Confrontation Phase）**
- 主要任务：与孤立后的勇者进行决定性对决
- 标志事件：主角与勇者发生第一次直接正面交锋
- 常见危机：主角光环在决战时爆发，勇者展现出超出预期的力量；主角自身的死亡节点逼近

**阶段5：终局期（Endgame Phase）**
- 主要任务：完成最终猎杀，同时处理猎杀成功后的世界平衡问题
- 标志事件：勇者被彻底消除（死亡/废用/转化）
- 常见危机：神明系统的干预；"新勇者"的召唤；原著世界的崩溃（失去被预定守护者的后果）

---

### 三、蝴蝶效应管理

蝴蝶效应是猎杀主角小说最核心的张力来源：主角每一次干预都会改变时间线，使原著知识逐渐失效。设计蝴蝶效应管理机制时，需要考虑以下维度：

**偏离度追踪**：为故事设计一个"偏离计量系统"——随着主角干预的增加，时间线与原著的相似度降低。偏离度越高，主角的预知价值越低，迫使他从"信息优势"转向"当场判断"。

**不变之核（Immutable Core）**：即使时间线大幅偏离，仍有一些因素会以某种形式发生：
- 勇者会成长（路径可以改变，但成长的驱动力是命运决定的）
- 神明会介入（时机和方式可变，但介入这一事实不变）
- 世界需要一个守护者（如果勇者倒下，这个需求会转移到其他载体上）

**干预后的情报更新**：每次干预后，主角必须重新评估局势：
- 哪些原著知识仍然有效？
- 哪些已知事件被本次干预改变了？
- 有什么新的不确定性出现了？

**安全干预原则**：设计干预行动时，优先选择"影响范围可控"的操作：
- 针对单个人物的操控（影响局部）优于改变整个势力走向（影响全局）
- 改变时间节点（延迟/提前事件）优于完全消除事件（替代事件不可预测）
- 修改事件结果（胜败转换）优于制造全新事件（无原著参照系）

---

### 常见错误

1. **策略单一化**：只使用一种策略路线而不组合，导致勇者可以针对性反制
2. **忽视阶段转换的成本**：从准备期跳到对抗期，跳过孤立期，导致主角在决战时仍面对完整的勇者阵营
3. **蝴蝶效应管理缺失**：主角在大量干预后仍然依赖原著情报，而不承认时间线已经严重偏离
4. **过度信任单一策略的成功**：一次干预成功不代表整个策略有效，必须考虑勇者的适应和反制
5. **终局设计缺位**：设计了精密的猎杀过程，但没有设计"猎杀成功后的世界会怎样"——这个问题的答案往往成为故事真正的高潮',
  '## "Hunter Strategy" Setting Generation — The Protagonist Hunter

The "Hunter Strategy" is the strategic core of the Protagonist Hunter subgenre. It answers the fundamental question: *How does the protagonist intend to defeat, neutralize, or destroy the hero chosen by fate?* Simply being "stronger" or "smarter" is insufficient — the hero possesses the Protagonist Aura as a foundational guarantee. Direct confrontation typically activates the Aura''s rebound effect, making frontal assault a losing proposition. Effective hunting strategy must be systematic, multi-dimensional, and resilient to variables.

---

### Part I: The 5 Core Strategy Routes

#### Strategy Route 1: Fortune Denial

**Core Logic**: The hero''s growth depends on "fortunes" — sacred weapons, mentors, awakening moments, key battle victories. If these fortunes are stolen, consumed, or destroyed before the hero can access them, the hero''s growth curve breaks down.

**When to Apply**:
- The protagonist has chapter-level knowledge of exactly where and when each fortune activates
- The protagonist can operate covertly enough that the righteous faction does not track their movements

**Typical Operations**:
- Arrive at the hero''s designated "sacred site" first, removing or destroying the artifact before the hero arrives
- Consume or contaminate resources the hero was meant to receive (dungeon rewards, spirit blessings, sacred springs)
- Establish a prior relationship with the hero''s "destined mentor" — causing the mentor to die, relocate, or shift allegiance before the hero arrives

**Risks and Counters**:
- The hero may receive an equivalent substitute fortune through Protagonist Aura''s "destiny compensation" effect — the universe reroutes around the block
- Repeatedly appearing at key locations raises suspicion among righteous faction members, potentially exposing the protagonist''s foreknowledge

**Butterfly Effect Sensitivity**: High. Denying one fortune may trigger a complete reorganization of the fortune chain, generating replacement paths the protagonist never anticipated.

---

#### Strategy Route 2: Growth Suppression

**Core Logic**: Rather than directly seizing fortunes, this route suppresses the hero''s growth rate at the source — reducing available combat experience, lowering the challenge ceiling the hero can access, or inflicting irreversible physical or psychological damage that limits the hero''s potential ceiling.

**When to Apply**:
- The protagonist cannot directly access fortune locations but can influence the surrounding environment
- The protagonist''s strengths lie in behind-the-scenes manipulation rather than direct action

**Typical Operations**:
- Pre-clear all training enemies along the hero''s intended growth path, leaving the hero without meaningful combat experience
- Artificially manufacture "false peace" in a region by eliminating all monsters, removing the hero''s growth motivation entirely
- Embed "growth retardants" within the hero''s party — characters who unconsciously slow the team''s progression
- Use political means to restrict the hero''s operational range (example: convincing the king to doubt the hero''s loyalty, confining them to a safe zone)

**Risks and Counters**:
- Excessive suppression causes the hero to "detour" into growth paths not covered by the original novel, creating information blackouts
- Once the hero perceives systematic suppression, it often triggers stronger resistance will — activating the Protagonist Aura''s "adversity" enhancement

**Butterfly Effect Sensitivity**: Medium. Suppression measures typically adjust broad environmental conditions rather than single plot nodes, creating wide influence with lower per-node sensitivity.

---

#### Strategy Route 3: Preemptive Elimination

**Core Logic**: Terminate the hero directly during the early stages of the timeline, while the hero is still weak enough that the protagonist''s existing strength can guarantee victory. This is the most direct route but also carries the highest risk — the Protagonist Aura is most reactive to direct lethal threats.

**When to Apply**:
- The protagonist holds an absolute early-chapter power advantage the hero cannot overcome
- A credible cover exists for the elimination — one that will not leave visible "protagonist hunting" traces
- The original novel''s setting does not include a "divine backup mechanism" (some settings auto-resurrect or replace a slain hero)

**Typical Operations**:
- Strike during the chaos of the hero''s initial reincarnation or summoning, exploiting the information gap before the hero can orient themselves
- Use an apparently unrelated third-party force as the elimination vector, maintaining the protagonist''s deniability
- Engineer "accidents" rather than direct confrontations (traps, natural disasters, political persecution resulting in "official" execution)

**Risks and Counters**:
- The Protagonist Aura''s "crisis detection" may summon improbable last-second rescues — allies appearing from nowhere, a chance escape that cannot be logically explained
- If the hero is eliminated in the original novel''s early chapters, the divine system may "re-summon" a new hero, rendering the elimination strategically pointless
- A failed early elimination puts the hero on alert, causing them to enter combat mode far earlier than the original novel, dramatically increasing all subsequent difficulty

**Butterfly Effect Sensitivity**: Extreme. A preemptive elimination fundamentally redirects the world''s entire trajectory. All of the protagonist''s foreknowledge becomes invalid. This is the highest-variance play — maximum upside if it works, catastrophic downside if it fails.

---

#### Strategy Route 4: Alliance Disruption

**Core Logic**: The hero does not fight alone — their strength derives from companions, allies, national support structures, and divine backing. By systematically dismantling these support systems — engineering trust crises, sowing discord, severing political supply chains — the protagonist isolates the hero until they face their final confrontation as a lone individual stripped of all reinforcement.

**When to Apply**:
- The protagonist excels at political manipulation and information warfare rather than direct combat
- The hero''s party has underlying tension that was only suppressed by the hero''s charisma in the original novel
- The protagonist has sufficient political resources for long-term infiltration operations

**Typical Operations**:
- Trigger the relationship fractures that existed in the original novel''s hero party prematurely — before the hero has had time to build loyalty that can survive the crisis
- Bribe or coerce non-core party members to defect at a critical moment
- Spread targeted rumors and forge evidence to cause the kingdoms and factions supporting the hero to doubt their allegiance
- "Recruit in advance" all of the hero''s potential backup companions — characters who in the original novel would have joined if a current party member died. By removing every potential replacement, the hero''s party becomes finite and irreplaceable

**Risks and Counters**:
- The hero''s personal charisma (the social dimension of the Protagonist Aura) may cause manipulated allies to independently resolve their conflicts, reversing the disruption
- Once manipulation is detected, multiple factions simultaneously develop hostility toward the protagonist

**Butterfly Effect Sensitivity**: Medium-High. Targeting specific interpersonal relationships changes social chemistry rather than world mechanics — relatively controllable, but each relationship change propagates through social networks in hard-to-predict ways.

---

#### Strategy Route 5: Corruption / Conversion

**Core Logic**: The highest-difficulty but most complete strategy — not eliminating the hero, but *changing them*. Corroding the hero''s sense of justice into rage, shattering their faith, converting them into the protagonist''s instrument, or causing them to become a "fallen hero" no longer recognized by the divine system. A successful conversion simultaneously eliminates the threat and acquires the most powerful combat asset.

**When to Apply**:
- The story''s tone permits moral grey areas; the protagonist does not need to be perceived as a pure villain
- The author wants to explore corruption/redemption themes at a complex level
- The hero''s character design contains a visible psychological weakness or obsession that can be exploited

**Typical Operations**:
- Deliver sustained blows to the hero''s moral faith — arrange for them to witness the destruction caused by the "justice" they believe in
- Deepen the psychological wounds the hero already has from the original novel, making it impossible for them to maintain the posture of a righteous champion
- Offer the hero access to "dark power," creating a cycle where they gain strength at the cost of moral degradation
- Convince the hero that the protagonist is actually the true force of justice, causing them to willingly follow (highest-difficulty variant — requires years of careful positioning)

**Risks and Counters**:
- Corruption strategies take the longest of any route; the protagonist must maintain continuous contact with the hero throughout, creating maximum exposure risk
- A failed corruption attempt may steel the hero''s will even further — the "trial by fire" effect — triggering Protagonist Aura enhancement

**Butterfly Effect Sensitivity**: Low. This strategy targets the human heart rather than plot nodes. Its disruption to the world timeline is minimal, but its effect on the hero''s individual trajectory is the deepest and most permanent.

---

### Part II: Hunt Phase Structure

The hunting operation is divided into 5 phases, each with distinct core objectives and crisis types:

**Phase 1: Preparation**
- Primary objective: Establish intelligence networks, accumulate foundational strength, verify the correspondence between the original novel''s timeline and current reality
- Milestone event: The protagonist successfully predicts their first original novel event and acts on the prediction before it occurs
- Common crises: Random original novel events that threaten the protagonist''s own survival; miscalculated timeline leading to wasted resource deployment

**Phase 2: Interception**
- Primary objective: Execute the first round of interventions against the hero''s critical early-chapter fortunes
- Milestone event: The protagonist successfully alters one significant original novel event for the first time
- Common crises: Butterfly effects begin manifesting; the timeline starts diverging from predictions; the hero''s behavior begins exceeding the original novel''s script

**Phase 3: Isolation**
- Primary objective: Dismantle the hero''s support systems; cut off supply lines and allies
- Milestone event: The hero''s party experiences its first major internal crisis
- Common crises: Political events manipulated by the protagonist produce blowback on the protagonist''s own faction; new wildcard factions emerge outside the original novel''s script

**Phase 4: Confrontation**
- Primary objective: Engage the isolated hero in a decisive direct confrontation
- Milestone event: The protagonist and hero have their first direct face-to-face encounter
- Common crises: Protagonist Aura surges during the decisive battle, the hero manifests power exceeding all projections; the protagonist''s own death node approaches

**Phase 5: Endgame**
- Primary objective: Complete the final hunt; simultaneously manage world balance in the aftermath
- Milestone event: The hero is permanently neutralized (death / incapacitation / conversion)
- Common crises: Direct divine intervention; summoning of a "replacement hero"; world destabilization (the consequences of losing the designated guardian)

---

### Part III: Butterfly Effect Management

The butterfly effect is the central tension mechanism of Protagonist Hunter fiction: every intervention the protagonist makes alters the timeline, progressively invalidating their foreknowledge. Designing the butterfly effect management framework requires addressing the following dimensions:

**Divergence Tracking**

Design a "divergence index" for the story — as the protagonist''s interventions accumulate, the timeline''s similarity to the original novel decreases. Higher divergence means lower value of foreknowledge, forcing the protagonist to transition from "information advantage" to "real-time improvisation." This transition is one of the richest sources of narrative tension in the genre.

**Immutable Core**

Even when the timeline diverges significantly, certain structural elements will manifest in some form — their path is alterable but their occurrence is not:
- The hero will grow (the route of growth can change, but the growth drive is fate-determined)
- The divine will intervene (timing and form are variable, but the fact of intervention is not)
- The world requires a guardian (if the hero falls, this need transfers to another carrier — which may or may not be a better outcome for the protagonist)

**Post-Intervention Intelligence Reassessment**

After every intervention, the protagonist must formally reassess their intelligence picture:
- Which original novel knowledge remains valid?
- Which known events have been altered by this intervention?
- What new uncertainties have emerged?

This reassessment process should be dramatized in the story — it is one of the clearest windows into the protagonist''s strategic mind.

**Safe Intervention Principles**

When designing intervention actions, prioritize operations with "controllable impact radius":
- Manipulating a single individual (local impact) over redirecting an entire faction (global impact)
- Shifting the timing of an event (delaying or accelerating) over eliminating the event entirely (replacement events are unpredictable)
- Changing an event''s outcome (flipping victory to defeat) over creating entirely new events (no original novel reference frame)

---

### Common Mistakes

1. **Single-route strategy**: Using only one strategy route without combination, allowing the hero to develop targeted countermeasures. Effective hunting requires at least two complementary routes operating simultaneously.

2. **Skipping the isolation phase**: Jumping from preparation directly to confrontation without first dismantling the hero''s support network. Result: the protagonist faces the hero backed by a complete alliance, facing terrible odds.

3. **Ignoring butterfly effect accumulation**: The protagonist continues relying on original novel intelligence after massive interventions, without acknowledging that the timeline has seriously diverged. This is the most common cause of late-chapter strategic failure in the genre.

4. **Overconfidence after a single success**: One successful intervention does not validate the entire strategy. The protagonist must continuously account for the hero''s adaptation and potential counter-strategies.

5. **No endgame design**: Meticulous hunting mechanics are planned, but the story has no design for "what happens to the world after the hunt succeeds." This answer is typically the story''s true climax — and leaving it unresolved produces an unsatisfying conclusion.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Protagonist Hunter' LIMIT 1),
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
