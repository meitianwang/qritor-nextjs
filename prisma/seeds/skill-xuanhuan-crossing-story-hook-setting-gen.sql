-- 异世界玄幻穿越小说「故事钩子」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '异世界玄幻穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-xuanhuan-crossing-story-hook-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xuanhuan-crossing-story-hook-setting-gen',
  '「故事钩子」设定生成：为异世界玄幻穿越小说生成故事钩子设定，包括故事钩子、核心卖点、开篇悬念、读者期待',
  '"Story Hook" setting generation: generate story hook settings for isekai xuanhuan crossing novels, including story hook, core selling point, opening suspense, and reader expectations',
  '## 「故事钩子」设定生成 — 异世界玄幻穿越小说

「故事钩子」是整个创作的起点，决定故事的核心吸引力。玄幻穿越的故事钩子必须在前三章内完成"穿越+困境+金手指+第一次爽点"的完整循环，吸引读者追读。

---

### 字段生成指南

#### 故事钩子

一句话概括故事的核心吸引力。好的故事钩子公式：**穿越身份 + 紧迫危机 + 逆转承诺**

优秀示例：
- "穿越后发现自己是宗门里的废物弟子，三天后就是宗门大比"
- "醒来发现自己在悬崖边，体内灵力全失，身后追杀者已近"
- "穿越成被灭族的家族少主，大仇未报，修为尽废"
- "魂穿为即将被献祭的异族少年，觉醒仪式就在今夜"
- "穿越成散修，刚到异世界就被卷入秘境争夺战"

**好故事钩子的特征**：
1. **紧迫感**：有时间限制或即时威胁
2. **困境感**：主角处于弱势，让读者产生同理心
3. **逆转期待**：暗示主角有翻盘的可能（金手指即将觉醒）
4. **世界观信息**：一句话中透露世界的核心元素（修炼、宗门、境界等）

**避免**：
- 没有紧迫感的设定（"穿越成天才弟子安稳修炼"）
- 没有具体冲突的设定（"穿越到玄幻世界看看"）
- 主角太强没有挑战（"带着满级号穿越"）

#### 核心卖点

区别于同类型作品的独特之处。核心卖点是"为什么读者要看这本而不是看别的"。

**提炼核心卖点的四个维度**：

| 维度 | 提问 | 示例 |
|------|------|------|
| **修炼体系创新** | 修炼体系有何与众不同？ | "双体系修炼——同时修炼魔法和斗气，两者相克相生" |
| **金手指独特性** | 金手指有何独一无二的地方？ | "系统不给奖励只给惩罚——不完成任务就掉境界" |
| **世界观新意** | 世界观有何新颖之处？ | "灵气不是自然存在的，而是上古封印泄露的副产品" |
| **叙事节奏差异** | 叙事方式有何特别？ | "非线性时间线——穿越后的时间倒流和前进交替进行" |

**设计建议**：至少在一个维度上做出差异化。最好的卖点是"容易用一句话说清楚但别人没这么写过"。

#### 开篇悬念

第一章就要建立的悬念——通常是穿越后面临的**第一个危机**。危机的紧迫性越强，读者追读欲望越高。

**开篇悬念设计公式**：穿越即危机

**经典开篇危机类型**：

| 危机类型 | 示例 | 紧迫度 |
|---------|------|--------|
| **即时生死危机** | 醒来时正被追杀 / 处于致命险境 | 极高 |
| **倒计时危机** | 三天后宗门大比 / 明天就要被处刑 | 高 |
| **身份危机** | 原身是废物/叛徒/罪人，被所有人敌视 | 中高 |
| **实力危机** | 灵力尽失 / 经脉损伤 / 被封印 | 中 |
| **信任危机** | 穿越后不了解这个世界的规则，随时可能露馅 | 中 |

**设计建议**：
- 最好叠加 2 种以上危机（如"灵力尽失 + 三天后宗门大比"）
- 第一个危机应在 1-2 章内解决（用金手指初步展示），然后引出更大的危机
- 开篇危机的解决方式应暗示金手指的核心能力

#### 读者期待

明确承诺给读者的核心体验。玄幻穿越读者的核心期待：

| 期待类型 | 说明 | 频率要求 |
|---------|------|---------|
| **升级爽感** | 看主角一步步变强，碾压之前碾压自己的人 | 持续（每个境界） |
| **打脸反转** | 被人看不起 → 实力展示 → 对方目瞪口呆 | 高频（每 5-10 章） |
| **地图扩展** | 世界越来越大，新区域带来新鲜感 | 中频（每个大阶段） |
| **身份揭秘** | 隐藏身份逐步揭开，引发更大的震动 | 低频（关键节点） |
| **逆境翻盘** | 在绝境中靠金手指/智慧/突破翻盘 | 中频（每个故事弧） |

**设计建议**：
- 在读者期待中明确 2-3 种核心体验类型
- 不同类型的期待应交替出现，避免审美疲劳
- 读者期待应与核心卖点一致——卖点承诺什么，就要持续兑现

---

### 与其他设定的联动

- **故事钩子**应体现**穿越设定**的穿越身份和核心目标
- **核心卖点**应体现**修炼体系**和**金手指**的独特性
- **开篇悬念**应在**世界观**的框架内展开
- **读者期待**应与**文风设定**的节奏把控配合

---

### 设计原则总结

1. **前三章定生死**：故事钩子和开篇悬念必须在前三章完整呈现
2. **一句话能说清**：核心卖点应该能用一句话打动读者
3. **持续兑现承诺**：读者期待不是空头支票，每种期待都要在后续剧情中反复兑现
4. **危机层层递进**：开篇危机只是起点，后续的危机应越来越大',
  '## "Story Hook" Setting Generation — Isekai Xuanhuan Crossing Novel

The "Story Hook" is the starting point of the entire creation, determining the story''s core appeal. Xuanhuan crossing story hooks must complete the full cycle of "crossing + predicament + cheat ability + first satisfaction point" within the first three chapters.

---

### Field Generation Guide

#### Story Hook
One-sentence core appeal. Formula: **Crossing identity + Urgent crisis + Reversal promise**. Good examples: "Discovers he is the sect''s trash disciple, sect tournament in 3 days" / "Wakes up on a cliff, all spiritual power gone, pursuers closing in." Must have urgency, underdog position, and reversal potential.

#### Core Selling Point
What makes this work unique. Four dimensions to differentiate: Cultivation system innovation / Cheat ability uniqueness / Worldview novelty / Narrative pacing difference. Best selling points are "easy to describe in one sentence but no one has written it this way before."

#### Opening Suspense
First-chapter crisis. Formula: Crossing = Immediate Crisis. Types: Immediate mortal danger (highest urgency) / Countdown crisis (high) / Identity crisis (medium-high) / Power crisis (medium) / Trust crisis (medium). Best to stack 2+ crisis types. First crisis should be resolved in 1-2 chapters using the cheat ability, then introduce a bigger crisis.

#### Reader Expectations
Core experiences promised to readers: Leveling thrill (continuous per realm) / Face-slapping reversal (every 5-10 chapters) / Map expansion (each major phase) / Identity reveal (key nodes) / Clutch comeback (each story arc). Specify 2-3 core expectation types that alternate to avoid fatigue.',
  (SELECT id FROM novel_creation_method WHERE name = '异世界玄幻穿越小说' LIMIT 1),
  1,
  34,
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
