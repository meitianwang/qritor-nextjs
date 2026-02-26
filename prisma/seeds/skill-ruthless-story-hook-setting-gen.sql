-- The Ruthless Protagonist Novel - Story Hook Setting Generation Skill (Layer 3)
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Ruthless Protagonist Novel' LIMIT 1)
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-ruthless-story-hook-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ruthless-story-hook-setting-gen',
  '「Story Hook」设定生成：为冷酷主角小说设计核心钩子，提炼让读者无法停下来的故事卖点、开场张力与主角恶行的道德背书',
  '"Story Hook" setting generation: design the core hook for ruthless protagonist novels — extract the irresistible selling point, opening tension, and moral justification for the MC''s ruthlessness',
  '## 「Story Hook」设定生成 — The Ruthless Protagonist Novel

Story Hook 是读者决定是否继续读下去的第一道关卡。对于冷酷主角类型的小说，这个钩子需要完成三件事：**让读者接受一个有道德问题的主角**、**承诺某种独特的爽感或震撼**、**设置一个"必须看接下来怎么办"的悬念**。

与普通小说的钩子不同，冷酷主角小说的 Story Hook 需要预先为主角的恶行"定性"——读者要在下单前就知道这不是传统英雄故事，但他们心甘情愿付款的原因是这种无情本身有内在逻辑和美学。

---

### 字段生成指南

#### Story Hook（核心钩子句）

**格式**：一句话，包含以下元素：
- 主角是谁（简洁身份）
- 他们面对的极端处境
- 他们将采用的手段（暗示但不直接说"我是坏人"）
- 暗示这将是一段令人不安但无法停止阅读的旅程

**有效钩子的三种模式**：

| 模式 | 说明 | 示例方向 |
|------|------|---------|
| **逆境逼出恶行** | 世界本已残酷，主角只是用同样的残酷还击 | "为了活下来，他必须先让别人死" |
| **冷血棋手** | 主角始终掌控全局，读者看他以最小代价收割最大利益 | "他从不赌博——因为他早已控制了骰子" |
| **堕落弧线** | 主角曾有理想，但现实一刀一刀地削去了他的温情 | "他杀掉的第一个人是他保护的那个人" |

**避免的写法**：
- ❌ 太直白的道德声明（"他是一个坏人但其实是好人"）
- ❌ 空洞的黑暗感（"世界是黑暗的，他也是"）
- ❌ 与众多同类作品雷同的"天才穿越"模板

#### Core Selling Point（核心卖点）

这个字段回答：**这个冷酷主角小说和其他同类作品有什么不同？**

核心卖点应该包含：
1. **主角的独特无情方式**：是冷血的政治操纵？还是情感利用？还是纯粹的武力碾压？
2. **这个世界对这种无情的独特要求**：是什么样的世界设定使得残酷成为必然而非选择？
3. **读者可以预期的独特爽点**：打脸伪君子？逆袭被压迫者？以毒攻毒？

**三种核心卖点方向**：

| 方向 | 卖点核心 | 适合的主角原型 |
|------|---------|--------------|
| **以恶制恶** | 用邪恶世界的规则击败那些假装正义的人 | 冷血战略家、权力攀登者 |
| **极限生存** | 没有人性的奢侈，活下去就是最终道德 | 生存驱动的务实者、堕落理想主义者 |
| **冷眼棋局** | 主角操控所有人如同棋子，读者享受这种上帝视角 | 冷漠者、冷酷复仇者 |

#### Opening Tension（开场张力）

开场张力是前5章的"命题"。对于冷酷主角小说，这个命题通常是：

**主角被迫做出第一个"真正的"无情选择。**

好的开场张力设计原则：
1. **不要从主角已经完全冷血开始**：让读者见证第一个关键时刻，理解这个人是如何变成这样的（或者接受他就是这样的）
2. **让这个选择具有代价**：即使主角选择了正确的"恶"，读者也要感受到这个选择烧掉了某些东西
3. **明确建立规则**：通过这个早期危机，让读者理解这个世界为什么容不下善意

**开场张力的四种经典形式**：
- **背叛的起点**：主角被曾经信任的人出卖，从此切断了善意
- **不可能的选择**：必须牺牲一个才能救另一个，或者必须犯错才能活命
- **无辜的代价**：主角的行动将伤害无辜者，但不这样做将付出更大代价
- **权力的代价**：第一次尝到真正权力的滋味，同时尝到了它要求的血腥代价

#### Reader Expectation（读者预期）

这个字段明确你对读者做出的**承诺**——他们坚持读下去，能得到什么？

冷酷主角小说的读者预期通常包含：

| 预期类型 | 具体内容 |
|---------|---------|
| **爽感预期** | 主角用智慧/力量/无情击败看似强大的伪君子 |
| **奇观预期** | 目睹一个道德边界的人如何走得更远，以及代价是什么 |
| **复仇预期** | 被这个不公平的世界欺压的主角终将逆袭 |
| **角色预期** | 看主角在黑暗中是否保留最后一点人性，或彻底放弃 |

**关键**：读者预期要诚实。如果你承诺爽文逆袭，就不要最终给出悲剧结局。如果你承诺角色的人性挣扎，就不要让主角显得毫无感情。

---

### 字段联动关系

- **Story Hook → Core Selling Point**：钩子定下基调，卖点要从钩子中延伸，而不是换一个方向
- **Core Premise.Protagonist Archetype → Story Hook**：原型决定了钩子的叙事切入点（战略家 → 棋局感；生存者 → 绝境感）
- **Power System.Power Costs → Opening Tension**：开场张力中的第一个无情选择应该与力量代价相关联

---

### 常见错误

1. **过于强调"其实他是好人"**：这破坏了冷酷主角类型的根本承诺。读者选择这个类型就是为了看"他不是好人"的故事
2. **钩子太长太解释性**：一行钩子如果需要两段解释才能理解，就不是好钩子
3. **开场张力太平庸**：打了一个小喽啰不算开场张力；首次面临道德极限才算
4. **读者预期模糊**：不知道自己在为读者承诺什么，写着写着变成了不同的故事
5. **卖点与其他同类作品雷同**："我是天才，我会虐渣"不是独特卖点，是标配；卖点需要更具体的差异化元素',
  '## "Story Hook" Setting Generation — The Ruthless Protagonist Novel

The Story Hook is the reader''s first gate — their decision whether to continue. For ruthless protagonist fiction, the hook must accomplish three things: **get readers to accept a morally compromised MC**, **promise a unique brand of satisfaction or shock**, and **set up a "what happens next" that demands continuation**.

Unlike conventional hooks, ruthless protagonist stories need to pre-frame the MC''s dark deeds — readers should know before committing that this isn''t a hero''s journey, yet choose it anyway because the ruthlessness has its own internal logic and aesthetic.

---

### Field Generation Guide

#### Story Hook (核心钩子句)

**Format**: One sentence containing:
- Who the MC is (brief identity)
- The extreme situation they face
- The means they will employ (implied, not stated bluntly)
- A promise that this will be unsettling but unputdownable

**Three effective hook patterns**:

| Pattern | Description | Example Direction |
|---------|-------------|------------------|
| **Forced into darkness** | The world is already brutal; the MC merely answers in kind | "To survive, he had to make sure others didn''t" |
| **The cold chess master** | MC always controls the board; readers enjoy the god-eye view | "He never gambled — he controlled the dice" |
| **The fall arc** | MC once had ideals; reality stripped them away piece by piece | "The first person he killed was the one he was protecting" |

**Avoid**:
- ❌ Moral disclaimers ("he''s evil but actually good")
- ❌ Empty darkness ("the world is dark and so is he")
- ❌ Generic transmigrator-genius templates

#### Core Selling Point (核心卖点)

Answers: **What makes this ruthless protagonist story different from others?**

Should include:
1. **The MC''s unique brand of ruthlessness**: Cold political manipulation? Emotional exploitation? Pure power?
2. **Why this specific world demands this ruthlessness**: What setting makes cruelty inevitable rather than chosen?
3. **The specific payoff readers can expect**: Exposing hypocrites? Rising from oppression? Fighting fire with fire?

#### Opening Tension (开场张力)

The "thesis" of the first five chapters. Usually: **the MC is forced to make their first truly ruthless choice.**

Design principles:
1. **Don''t start with a fully cold MC**: Let readers witness the pivotal moment that defines or accepts who they are
2. **Make the choice cost something**: Even the right evil should burn something away
3. **Establish the world''s rules**: Show why this world doesn''t allow for kindness

**Four classic forms**: Betrayal as origin / Impossible choice / Innocent sacrifice / The first taste of real power

#### Reader Expectation (读者预期)

The **promise** you make to readers for their continued investment:

| Type | Content |
|------|---------|
| **Cathartic payoff** | MC defeats hypocrites using intelligence/ruthlessness |
| **Spectacle** | Watching how far a person can go and at what cost |
| **Revenge** | The oppressed MC eventually turns the tables |
| **Character** | Whether the MC retains any humanity — or abandons it entirely |

**Key**: Be honest with your promise. Grimdark readers specifically chose this genre; don''t bait-and-switch them.

---

### Common Errors

1. **Over-emphasizing "he''s actually good"**: This breaks the fundamental promise of the genre
2. **Hook that needs explanation**: A one-line hook requiring two paragraphs to decode isn''t working
3. **Mundane opening tension**: Beating a grunt isn''t opening tension; first moral limit is
4. **Vague reader expectations**: Not knowing what you''re promising leads to genre drift
5. **Generic selling point**: "I''m a genius who will crush enemies" is default, not unique',
  (SELECT id FROM novel_creation_method WHERE name = 'The Ruthless Protagonist Novel' LIMIT 1),
  1,
  10,
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
