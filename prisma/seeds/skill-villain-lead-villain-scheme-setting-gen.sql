-- The Villainous Lead「Villain Scheme」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Villainous Lead' LIMIT 1)
-- 执行方式 / Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-villain-lead-villain-scheme-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'villain-lead-villain-scheme-setting-gen',
  '「Villain Scheme」设定生成：为反派视角（Villainous Lead）小说生成反派计划架构，包括总体计划层次、当前阶段、多线并行行动、英雄弱点利用策略与应急备案',
  '"Villain Scheme" setting generation: generate villain scheme architecture for Villainous Lead novels, covering master plan structure, current phase, multi-front operations, hero exploitation strategy, and contingency planning',
  '## 「Villain Scheme」设定生成 — 反派视角（Villainous Lead）

Villain Scheme 是反派视角小说的操作核心——不是反派"想要"什么（那是 Villain Identity 的工作），而是反派**正在做**什么，以及每一步棋之间的关系。

好的计划架构让读者始终感受到：一切都在反派的掌控之中，而英雄完全看不到这一点。

---

### 字段生成指南

#### Master Plan（总体计划）

总体计划不是一个简单目标，而是**三层架构**：

| 层次 | 内容 | 对英雄的可见性 |
|-----|------|--------------|
| **第一层（可见层）** | 英雄认为反派在做什么，英雄正在防御的东西 | 完全可见 |
| **第二层（隐藏层）** | 反派在英雄注意力被第一层吸引时实际在推进的目标 | 不可见 |
| **第三层（终局层）** | 第一、二层共同建立的最终局面，只有到了无法阻止时才揭示 | 不可见 |

**关键设计原则**：成功阻止第一层实际上**推进**了第二层。英雄的每一次"胜利"都应该让反派更接近终点。

**总体计划的必要特征**：
- 没有单点失败——任何一个关键行动都有冗余
- 计划至少能承受失去任何一个元素而不崩溃
- 最终揭示必须重新诠释所有先前发生的事情（读者应该能够追溯，看到每次"挫折"实际上都是推进）
- 计划在某个时刻必须真的让反派付出代价——零成本的计划感觉廉价

---

#### Current Phase（当前阶段）

定位当前故事在总体计划中的位置：

- **布局期**：铺设棋盘，建立必要的基础条件，英雄此时通常完全没有察觉
- **巩固期**：稳固现有优势，处理潜在的不稳定因素，开始轻微施压英雄以测试其反应
- **猎杀期**：主动针对英雄，将英雄引入预设局面，开始兑现布局期的投入
- **终局期**：收网，执行不可逆转的最终行动
- **复盘期**：主要计划受挫后的重组——好的反派在复盘期的智识密度通常最高，因为他们必须用更少的资源实现同样的目标

---

#### Active Schemes（当前活跃行动）

好的反派永远不只押一颗宝，而是同时运作多个相互独立但相互支持的行动。

**多线设计原则**：
- 各行动服务于不同目标（中止一个不中止其他）
- 各行动难以相互关联（发现一个不暴露其他）
- 各行动有不同时间线（防御方永远在至少某件事上落后）
- 至少有一个行动利用了防御方阻止其他行动的尝试本身

**生成时应包含 3-5 个当前活跃行动，每个注明**：
- 行动目标
- 当前状态
- 与总体计划的关系
- 英雄是否已知晓（以及知晓了什么）

---

#### Hero Exploitation Strategy（英雄弱点利用策略）

这是 Villain Scheme 模块最独特的字段——**系统性地将英雄的美德变成武器**：

| 英雄美德 | 利用机制 | 具体战术 |
|---------|---------|---------|
| **仁慈** | 英雄不会在获胜时补刀 | 在方便的时机"战败"，用恢复期大幅推进计划 |
| **荣誉** | 正式挑战或道德框架可以束缚英雄 | 创造英雄的荣誉会限制其行动而反派没有等效限制的局面 |
| **自我牺牲** | 对无辜受害者威胁极度敏感 | 用这个反应模式来决定英雄在何时何地以何种情绪状态出现 |
| **信任** | 对阵营内成员防范不足 | 安插先通过真实英雄行为建立信任、再在关键时刻利用该信任的内线 |
| **公开性** | 英雄总在戏剧性时刻亮相 | 英雄的登场通知等于准备时间，反派总有充足时间布置 |

**生成时应针对故事中具体英雄的具体美德，设计对应的具体利用方案。**

---

#### Contingencies（应急备案）

**好的反派的失败本身就是计划的一部分。**

应急备案必须预先覆盖：
- 主要行动者被发现
- 伪装被揭穿
- 目标在不应该存活的情况下存活
- 反派自身被捕获

每个应急备案应该：要么恢复计划到原来的基线状态，要么以不同于计划的路径推进目标。

**最好的应急备案揭示：那次挫折实际上是有用的。**

设计备案时的核心问题：如果主计划完全失败，反败为胜的路径是什么？',
  '## "Villain Scheme" Setting Generation — The Villainous Lead

The Villain Scheme module answers the question that separates interesting villains from boring ones: not what do they want (that''s Villain Identity) but *how are they getting it* — the specific operational architecture that makes them actually threatening rather than just generically menacing.

---

### Field Generation Guide

#### Master Plan — The Three-Layer Architecture

The Schemer''s Architecture Principle: a well-designed villain scheme has three layers operating simultaneously.

**Layer 1 (Visible):** What the villain appears to be doing. What their enemies are defending against. This layer is designed to be discovered — it is the villain''s distraction, their offered target.

**Layer 2 (Hidden):** What the villain is actually accomplishing while their enemies focus on Layer 1. This layer advances the real goal and is invisible until the villain chooses to reveal it.

**Layer 3 (Terminal):** The endgame condition that Layers 1 and 2 have been building toward. The villain reveals this only when it is too late for anyone to stop it. Layer 3 should be designed so that the reader, looking back, can trace exactly how every event contributed to it.

**The key structural principle: successfully stopping Layer 1 should actually *advance* Layer 2.** Every hero victory should be a gift the villain chose to give.

**Master Plan design requirements:**
- No single point of failure — every critical element has redundancy
- The plan must survive losing any one element without catastrophic failure
- The final reveal must recontextualize everything that came before
- The plan must require the villain to genuinely sacrifice something at minimum once — costless plans feel cheap and reduce stakes

---

#### Current Phase — Where the Story Lives

**Setup Phase:** The board is being laid. The villain is establishing necessary preconditions. The hero has no idea anything is happening. Key narrative function: introduce the villain''s network, methods, and patience. The reader should feel the scope of preparation that has already occurred.

**Consolidation Phase:** Existing advantages are being secured. Unstable elements are being managed. Light pressure is being applied to the hero to test their responses. Key narrative function: the villain learns the hero''s specific decision patterns — this is intelligence-gathering that will pay off later.

**Hunting Phase:** The villain is now actively directing the hero''s movements. The hero is being guided into prepared positions without knowing it. Every "heroic initiative" the hero takes is actually a response to a villain-controlled stimulus. Key narrative function: the cat-and-mouse pleasure intensifies as the reader can see both the hero''s confident misreading AND the trap closing.

**Endgame Phase:** Irreversible actions are being executed. The hero is now in a race they cannot win because the finish line was moved. Key narrative function: the payoff of all previous investment; must feel earned, not sudden.

**Reconstruction Phase:** The primary plan has been significantly disrupted. The villain must achieve the same endpoint with reduced resources. Key narrative function: this is often the highest-intensity display of the villain''s intelligence — achieving the goal under constraint is more impressive than achieving it under ideal conditions.

---

#### Active Schemes — The Multi-Front Principle

A villain with one plan can be stopped with one successful defense. A villain with five simultaneous independent operations requires five separate successful defensive efforts.

**Design principles for active schemes:**
- Operations serve different goals (neutralizing one doesn''t neutralize others)
- Operations are difficult to connect to each other (identifying one doesn''t reveal the others)
- Operations have different timelines (the defender is always behind on at least something)
- At least one operation exploits the defenders'' attempts to stop the other operations

**Each active scheme entry should specify:**
- The operation''s objective
- Current status (active, dormant, completed, compromised)
- Relationship to the Master Plan (which layer does it serve)
- Hero awareness level (unknown / suspected / known but misunderstood / fully known)

**The hero-awareness dimension is critical:** schemes that the hero has discovered and is actively trying to stop are not failures — they may be Layer 1 distractions. The villain''s most dangerous operations should be the ones the hero doesn''t know exist.

---

#### Hero Exploitation Strategy — The Core Mechanic

This is where the Villainous Lead genre most sharply distinguishes itself. The villain''s unique advantage: they understand the hero as a *system* — with predictable inputs and predictable outputs based on the hero''s heroic code. The hero''s greatest strengths are their most reliable exploits.

**Mercy as a quarterly gift:**
The hero will not execute a defeated enemy. This is not weakness — it is a genuine moral commitment. The villain treats it as a scheduled resource. Plan: be defeated at a strategically convenient time, surrender when capture serves the plan, use the guaranteed recovery window to advance operations the hero cannot monitor while distracted by their mercy decision.

**Honor as a contractual constraint:**
The hero can be bound to disadvantageous situations through formal challenges, public oaths, or invocations of their stated code. The villain operates without equivalent restrictions. Plan: create documented public commitments that constrain the hero''s tactical options. The hero cannot violate their code because their power derives partly from being known as someone who doesn''t. The villain uses this asymmetry systematically.

**Self-sacrifice as a targeting system:**
The hero responds predictably and urgently to threats against innocents or allies. This response pattern is reliable enough to use as a positioning mechanism. Plan: use innocent-victim scenarios to dictate where the hero will be, when they will arrive, and in what emotional state (urgency, guilt, anger — all impair strategic thinking). A hero racing to save a hostage is not thinking about what else the villain might be doing.

**Trust as a backdoor:**
The hero trusts allies who have been validated through shared adversity. The validation process is exploitable. Plan: introduce agents who perform genuine heroic acts in genuine crises (not staged) to earn real trust, then leverage that trust at a single critical moment. The hero''s trust is not irrational — the agent really did save lives. The trust is just also exactly what the villain needed.

**Grand entrances as scheduling information:**
Heroes make public, dramatic arrivals. They announce themselves through reputation, through advance forces, through the visible buildup of heroic momentum. Plan: the villain always knows the hero is coming before the hero arrives. Every entrance is a preparation window. The villain never fights a hero who arrived unexpectedly.

---

#### Contingencies — Designed Failure

The villain''s failure scenarios should be treated as design elements, not edge cases. A plan that has no contingencies is not actually a plan — it is a wish.

**Required contingency categories:**

Primary agent exposed: What does the villain do when their main operative is identified and neutralized? Option A: restore via replacement with pre-positioned backup. Option B: the exposed agent''s capture was the actual plan (they were carrying false intelligence).

Cover blown: What happens when the villain''s true identity or involvement is revealed? The best villains have planned for this: public exposure does not equal operational failure if the infrastructure is already in place and irreversible.

Target survives unsurvivable situation: The hero lives through something they shouldn''t have. Contingency principle: the villain should have pre-calculated the probability of this and built it into the timeline as a possible branch, not an impossible outcome.

Villain''s own capture: This contingency is often the most revealing. What has the villain already set in motion that cannot be stopped by their incapacitation? A villain who is only threatening while free is a villain whose plans were too shallow. The best contingency for capture: the trap closes on schedule with or without the villain''s direct supervision.

**The best contingency reveals retroactively that the setback was useful.** The hero stops one operation — and the villain already knew that stopping it would redirect hero resources away from a more critical operation. Failure is information. Information is advantage.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Villainous Lead' LIMIT 1),
  1,
  51,
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
