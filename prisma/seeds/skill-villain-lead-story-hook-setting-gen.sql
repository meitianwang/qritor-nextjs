-- The Villainous Lead「Story Hook」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Villainous Lead' LIMIT 1)
-- 执行方式 / Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-villain-lead-story-hook-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'villain-lead-story-hook-setting-gen',
  '「Story Hook」设定生成：为反派视角（Villainous Lead）小说生成故事钩子，包括反派身份呈现、核心讽刺、开场第一手棋、读者期待承诺',
  '"Story Hook" setting generation: generate story hooks for Villainous Lead novels, covering villain identity presentation, core irony, opening gambit, and reader promise',
  '## 「Story Hook」设定生成 — 反派视角（Villainous Lead）

反派视角故事钩子的核心是「身份倒转的冲击感」——读者从一开始就知道在追随反派，而这个反派比大多数"英雄"更令人欲罢不能。

好的钩子公式：**明确反派身份 + 令人着迷的反派动机 + 对英雄主义的精准讽刺**

---

### 字段生成指南

#### Story Hook

一句话概括核心卖点，必须包含：主角的反派身份是如何呈现的，以及为什么读者会想追随他。

**有效钩子的特征**：
- 不为反派身份道歉，不暗示主角"其实是好人"
- 包含具体的讽刺对象（哪种英雄主义？哪个系统？）
- 语气上带有智识优越感而非恶意炫耀

**常见错误**：
- 钩子听起来像救赎弧的预告
- 反派实际上只是被误解的英雄
- 钩子只强调"邪恶"而非智识魅力

---

#### Core Irony

故事的核心讽刺——这是反派视角区别于普通暗黑小说的关键。好的核心讽刺不只是"坏人视角"，而是揭示英雄主义系统内部的深层矛盾：

- **英雄的美德是结构性破坏力**：仁慈导致敌人不死，荣誉是可以利用的枷锁，自我牺牲使英雄成为操控目标
- **"正义"系统本身腐败**：天命/神谕/"选中之人"框架的实际受益者是谁？
- **反派的逻辑比英雄的逻辑更自洽**：反派的世界模型与实际证据更吻合
- **英雄在被利用**：被神明、被阵营、被预言本身——反派是唯一诚实说出来的人

---

#### Opening Gambit

故事的第一手棋。反派视角的开篇必须立刻展示主动性和智识优越感，不能是被动挨打。

三种经典反派开篇：

| 开篇类型 | 特点 | 适用场景 |
|---------|------|---------|
| **棋局已布** | 读者进场时局面已定，等着看英雄如何落入陷阱 | 谋士型反派 |
| **猎物被确认** | 主角定位目标、冷静分析弱点 | 捕食者型反派 |
| **双面揭开** | 反派在"正常"场合展示两副面孔——公开身份与内部算计同时呈现 | 伪装型反派 |

**禁止**：以反派被打败/被羞辱开场（那是弱者逆袭的叙事，不是战略捕食者的叙事）

---

#### Reader Promise

对反派视角读者的三大核心期待，生成时应明确承诺至少两项：

1. **智识优越感**：看聪明的反派用更高精度的分析框架吊打理想主义英雄
2. **解构快感**：看所谓"正义"和"英雄主义"被一一拆穿，而英雄自己浑然不觉
3. **猫戏老鼠**：看英雄在毫不知情的情况下步步陷入反派的局，读者始终比英雄知道更多

---

### 生成原则

- Story Hook 不超过两句话，必须立刻建立反派主角的魅力
- Core Irony 必须具体指向某种英雄主义机制，不能是空泛的"好坏之分"
- Opening Gambit 必须是主动的——反派已经在行动，读者进场时局已开始
- 整体基调：冷静、精准、带有超然的智识控制感',
  '## "Story Hook" Setting Generation — The Villainous Lead

The Villainous Lead story hook operates on identity inversion: from page one, the reader knows they are following the villain — and finds that villain more compelling, more interesting, and possibly more rational than any hero in the same story. The hook must establish this inversion immediately while making readers eager to continue rather than uncomfortable.

**The Villainous Lead hook formula: Explicit villain identity + Compelling villain perspective + A specific deconstruction target**

---

### Field Generation Guide

#### Story Hook

One sentence (or two at most) that establishes the protagonist''s villain status AND makes it appealing. The sentence should contain no apology for the protagonist''s nature, no hint that they are secretly good, and no suggestion that the story is about their redemption.

**Strong examples:**
- "The kingdom''s greatest villain has been quietly building a better kingdom in the spaces the heroes keep destroying during their quests."
- "The Demon Lord knows exactly how the Chosen Hero''s story ends — so he has already written a different ending."
- "Every hero the gods have sent has the same exploitable flaw: they refuse to win dirty."

**Weak examples to avoid:**
- Anything that sounds like a redemption arc teaser
- Anything where the villain is actually "misunderstood"
- Anything where the villain''s perspective is just darker-flavored heroism

---

#### Core Irony

The structural subversion that makes the story more than "villain wins." The core irony should reveal something true about the hero system that the hero''s perspective cannot see:

**Option A — The hero''s virtues are structurally destructive:**
Mercy means never finishing enemies (enemies survive to fight again). Honor means being constrained by rules while the villain operates without equivalent restrictions. Self-sacrifice means the hero can be reliably baited using innocent victims as lures. Trust means the hero''s allies are exploitable backdoors.

**Option B — The system that produces heroes is corrupt:**
The divine mandate, the prophecy, the "chosen" framework — examine who actually benefits from keeping this mythology active. The gods who issue prophecies, the institutions that validate heroes, the power structures that require a "chosen champion" rather than systemic solutions.

**Option C — The villain''s worldview is more internally consistent:**
The reader gradually understands that the villain''s model of reality fits the actual evidence better than the hero''s does. The hero operates from inherited mythology; the villain operates from observed reality. The difference compounds over time.

**Option D — The hero is being used:**
By gods, by their faction, by the prophecy itself — and the villain is the only one honest about it. The most tragic version: the hero is genuinely heroic, genuinely good, and genuinely being exploited by the system that created them.

---

#### Opening Gambit

The villainous lead must be active from sentence one. They are not reacting to events — they are causing them, or they entered a game that is already in progress.

**The Chess Clock Opening (most effective for Schemers):**
The villain''s preparations are already complete when the story begins. The reader enters a game in progress. Everything that follows is watching pieces move where the villain placed them. Key technique: the opening scene should show something that looks ordinary — and a single detail that reveals the depth of preparation behind the ordinary surface.

**The Assessment Opening (most effective for Predators):**
The villain has identified the current hero/target and is analyzing them with clinical precision. The reader experiences the hero through the villain''s predatory regard: capabilities catalogued, weaknesses noted, exploitation vectors mapped. Critical rule: the hero being assessed should seem genuinely competent and dangerous from an objective standpoint. The villain''s advantage is not that the hero is weak — it is that the villain uses information the hero doesn''t know is being collected.

**The Double Life Reveal (most effective for infiltrators and political villains):**
The villain is operating in plain sight — respected, trusted, above suspicion. The opening scene shows both faces simultaneously: the public performance and the private calculation happening in real time. The reader is immediately inside the costume while watching the costume''s effect on others.

**What NOT to do:**
Open with the villain being defeated, humiliated, or underestimated as a setup for their rise. This is an underdog narrative, not a predator narrative. The Villainous Lead''s power comes from the reader knowing the villain is already operating at full capacity — the threat is not "wait until they get stronger" but "the trap is already closing."

---

#### Reader Promise

Three distinct satisfactions the story must deliver. The hook should implicitly commit to at least two:

**Intellectual Dominance:**
Watching the villain outthink adversaries who believe they have every structural advantage — divine protection, prophecy, righteous allies, institutional backing. The pleasure is watching a higher-resolution intelligence operate against systems that assume their own correctness. The villain doesn''t win because they are more powerful; they win because they understand the rules of the game at a level their opponents don''t.

**Deconstruction Payoff:**
Every time the hero invokes their heroic code, the villain has already identified the exploit. Mercy means the villain survives. Honor means the villain can constrain the hero legally. Self-sacrifice means the hero will walk into traps labeled "innocent victims." The reader experiences each heroic virtue as both genuinely admirable AND structurally exploitable — this dual awareness is the genre''s unique pleasure.

**Cat and Mouse Mastery:**
The sustained pleasure of watching the hero operate under a false model of reality while the reader, riding the villain''s perspective, can see exactly how far behind the hero actually is — and exactly when the trap will close. Critical design rule: the hero must never seem stupid. They should be making the best possible decisions given their information. Their information is just controlled.

---

### Generation Principles

- Story Hook: no more than two sentences; must immediately establish villain protagonist appeal
- Core Irony: must target a specific heroism mechanism, not generic "good vs. evil"
- Opening Gambit: must be active; the villain is already in motion when the reader arrives
- Overall tone: cold, precise, intellectually superior without being cartoonishly evil',
  (SELECT id FROM novel_creation_method WHERE name = 'The Villainous Lead' LIMIT 1),
  1,
  52,
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
