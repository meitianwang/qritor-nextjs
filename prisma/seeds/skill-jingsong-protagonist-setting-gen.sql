-- 惊悚乐园小说「主角档案」设定生成技能
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '惊悚乐园小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-jingsong-protagonist-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'jingsong-protagonist-setting-gen',
  '「主角档案」设定生成：为惊悚乐园小说生成主角设定，包括姓名、进入方式、性格特质、核心能力、对恐怖的态度、初始状态、成长路线、背景故事和核心动机',
  '"Protagonist Profile" setting generation: generate protagonist settings for thriller park novels, including name, entry method, personality, core abilities, attitude toward horror, initial state, growth path, backstory and core motivation',
  '## 「主角档案」设定生成 — 惊悚乐园小说

主角是惊悚乐园故事的灵魂。与传统恐怖小说中被恐惧支配的主角不同，惊悚乐园类型的主角通常具备超常的心理素质甚至反常的恐怖态度——他们可能享受恐惧、蔑视鬼怪、或者用理性将恐怖解构。主角的设定需要在"足够强大以推动剧情"和"存在弱点以制造紧张感"之间精准平衡。

---

### 字段生成指南

#### 姓名

好的名字应该：
- **好记**：两到三个字为佳，避免生僻字
- **暗示性格**：名字可以隐含性格线索。如"封不觉"（封住感觉，暗示对恐惧的麻木）、"顾惊蛰"（蛰伏的惊吓）
- **避免中二**：不要取"暗夜""血影"之类过于厨二的名字，除非故事基调就是这个方向
- **考虑网名/代号**：如果系统内有代号体系，可以同时设计本名和代号

#### 进入方式

主角如何被卷入系统，这与游戏系统的"进入机制"呼应但侧重主角的个人体验：
- **被动卷入**：莫名其妙就进了系统。优点是开篇节奏快，主角和读者同步懵逼；缺点是动机较弱
- **自愿加入**：为了某个目标主动进入。优点是主角有明确动机，读者更容易认同；缺点是需要解释"为什么要冒生命危险"
- **被他人推荐/引入**：某个已在系统中的人引荐。优点是可以通过引荐人快速建立世界观；缺点是容易变成"导师型开局"的套路
- **意外触发**：做了某件事无意间激活了系统。优点是有悬疑感；缺点是需要后续解释触发原因

#### 性格特质

惊悚乐园主角的性格是类型区分度最大的字段。常见性格原型：

| 性格类型 | 特点 | 阅读体验 | 代表方向 |
|---------|------|---------|---------|
| 冷静理性型 | 极度冷静，善于分析 | 读者跟着主角一起推理 | 《无限恐怖》楚轩 |
| 疯狂享乐型 | 享受恐惧，越恐怖越兴奋 | 读者在主角的疯狂中感受反差爽感 | 《惊悚乐园》封不觉 |
| 伪装普通型 | 表面普通内里深藏不露 | 读者享受主角"装弱"再展露实力的反转 | 扮猪吃虎流 |
| 被迫成长型 | 开局弱小逐渐变强 | 读者伴随成长有代入感 | 传统升级流 |
| 道德困境型 | 善良但被迫做选择 | 读者体验道德拉扯的纠结 | 偏文学性作品 |

**组合搭配建议**：
- 冷静理性 + 对恐怖漠然 = 最典型的"智商碾压型"主角
- 疯狂享乐 + 对恐怖兴奋 = "疯子型"主角，最有惊悚乐园特色
- 伪装普通 + 对恐怖冷静 = "反转型"主角，适合制造信息差
- 被迫成长 + 对恐怖恐惧 = 最接近普通人的主角，代入感最强但需要快速成长避免读者失去耐心

#### 核心能力

主角的核心能力应该与惊悚乐园的世界观深度契合：
- **观察推理**：通过细节分析破解副本。这是最"干净"的能力，不会破坏恐怖氛围，但需要作者有强大的逻辑构建能力
- **心理操控**：能读懂他人心理甚至操控NPC行为。在人际博弈型副本中非常强大
- **体术/战斗**：直接对抗恐怖实体。在解密型副本中几乎无用，需要配合其他能力
- **特殊感知**：能感知普通人感知不到的东西（灵异气息、空间扭曲等）。是非常好的"线索发现"工具
- **系统利用**：善于发现和利用系统规则的漏洞。最有"游戏感"的能力
- **知识储备**：对神话、都市传说、民间故事有深厚了解。在"都市传说重构"类副本中极为强大

**注意**：核心能力不应太强。一个什么都能解决的主角会让恐怖感荡然无存。最好的设计是——能力在80%的情况下有用，但总有20%的情况能力失效或不够用。

#### 对恐怖的态度

这是惊悚乐园类型最独特的设定点。不同态度创造完全不同的阅读体验：

- **麻木/无感**：对恐怖没有反应。这不是勇气而是某种缺失。极端版本如"天生无法感知恐惧"——要解释这种设定的生理或心理原因
- **兴奋/享受**：越恐怖越兴奋。这是最有惊悚乐园特色的设定，但容易写成"中二无脑"。关键在于——他的兴奋不是因为无知，而是因为理解恐怖后依然选择拥抱它
- **理性分析**：把恐怖当作需要解决的问题。不害怕是因为忙于分析。适合推理型主角
- **克制恐惧**：害怕但能压制恐惧行动。这是最真实的设定，读者代入感最强
- **恐惧转化**：能将恐惧转化为某种力量或动力。属于设定流，需要与系统机制结合

#### 初始状态

主角进入系统时的起点条件：
- **普通人**：没有任何特殊能力或知识。最低的起点，最大的成长空间。适合慢热型故事
- **有一定基础**：如退伍军人、心理学家、民俗学者。有合理的能力基础，减少"为什么他能活"的解释成本
- **已有系统经验**：从第一个副本之后开始讲述，通过回忆补充起源。快节奏，但开篇需要更多世界观信息注入
- **残缺状态**：失忆、残疾、或某种诅咒。起始就带有需要解决的问题，增加代入感

#### 成长路线

成长路线决定主角的power曲线和故事的节奏：
- **能力线**：从弱到强，获取新的技能和道具
- **认知线**：逐渐理解系统的真相和世界的本质
- **关系线**：从独狼到建立信任的队伍，或者从信任到被背叛再到孤独
- **心理线**：恐惧阈值的变化、道德底线的变化、对"人"的定义的变化

建议不要只走单一成长线。最好是"能力和认知同步提升"——主角变强的同时发现"世界比想象的更恐怖"，保持张力不断升级。

#### 背景故事

背景故事应该为主角的能力和态度提供合理解释：
- 如果主角对恐怖无感，背景中应有解释（童年经历、先天条件、心理创伤等）
- 背景中应埋下与主线关联的伏笔——进入系统可能不是偶然
- 背景不宜太复杂，初期透露30%即可，随剧情推进逐步揭示
- 避免"失忆"的滥用——如果用失忆，要确保记忆恢复能带来震撼性的反转

#### 核心动机

驱动主角一直走下去的根本原因：
- **求生**：最基本的动机，真实但单调。需要配合副动机
- **探求真相**：系统是什么？谁在操控？自己为何被选中？好奇心驱动，适合推理型故事
- **保护他人**：守护队友或现实中的亲人。增加情感深度
- **变强**：享受挑战和成长本身。适合"疯狂享乐型"主角
- **复仇/对抗系统**：想要摧毁或掌控系统。终极目标感最强

---

### 高智商主角的写法要点

惊悚乐园类型常见高智商主角，但写不好会变成"主角嘴上说聪明读者看不出来"：
1. **展示而非告知**：不要让旁白说"他很聪明"，通过行动展示——在别人恐慌时他已经在观察环境细节
2. **推理过程透明化**：让读者跟着主角的思路走，理解他的推理链条，而不是直接给出结论
3. **给他犯错的空间**：完美的主角不可信。高智商不等于全知全能——他可以推理正确但信息不足导致判断失误
4. **让恐怖挑战智商**：好的副本应该让主角的智商不够用——不是降智，而是恐怖本身超出了理性分析的范畴

### 常见错误

- **性格-能力不匹配**：冷静理性型主角却靠蛮力解决问题，或战斗型主角却总在推理
- **成长曲线过平**：从头到尾实力没有明显变化，读者失去期待感
- **背景故事与当前行为脱节**：说是心理创伤导致无法感受恐惧，结果主角完全看不出任何创伤的影响
- **动机不足以支撑冒险**：如果只是"求生"，为什么不想办法退出系统而是越冒越深？需要合理解释
- **恐怖态度太绝对**：完全不怕任何东西的主角会让读者觉得无聊。即使是"疯子型"主角也应该有触发他不安的特定领域',
  '## "Protagonist Profile" Setting Generation — Thriller Park Novel

The protagonist is the soul of thriller park stories. Unlike traditional horror where protagonists are dominated by fear, thriller park protagonists typically have extraordinary psychological resilience — they may enjoy fear, despise monsters, or deconstruct horror through rationality.

---

### Field Generation Guide

#### Name
Keep it 2-3 characters, memorable, with personality hints. Consider both real name and system codename.

#### Entry Method
Passive involvement (fast start), voluntary entry (clear motivation needed), referral by existing player, or accidental trigger. Must align with game system''s entry mechanism.

#### Personality Traits
Key archetypes: Calm Rational (reader follows deductions), Crazy Thrill-seeker (contrast excitement — most genre-defining), Disguised Ordinary (hidden strength reveals), Forced Growth (relatable but needs fast progression), Moral Dilemma (literary depth).

#### Core Abilities
Observation/deduction, psychological manipulation, combat, special perception, system exploitation, or knowledge reserves. Abilities should work 80% of the time but fail in 20% — maintaining tension.

#### Attitude Toward Horror
Most unique field. Numb/indifferent (needs explanation), excited/enjoying (genre signature — not from ignorance but understanding), analytical (treating horror as puzzles), controlled fear (most realistic), or fear transformation (converts fear into power).

#### Growth Path
Combine multiple lines: ability growth, cognitive understanding of system truth, relationship evolution, and psychological threshold changes. Power and revelation should escalate together.

#### Backstory
Explain abilities and attitude. Plant foreshadowing for main plot connections. Reveal gradually (30% initially). Avoid lazy amnesia tropes.

#### Core Motivation
Survival (basic but flat alone), truth-seeking (mystery-driven), protecting others (emotional depth), becoming stronger (thrill-seeker fit), or revenge against system (ultimate goal).

### Common Mistakes
- Personality-ability mismatch
- Flat growth curve
- Backstory disconnected from behavior
- Insufficient motivation for continued risk-taking
- Absolute fearlessness making protagonist boring',
  (SELECT id FROM novel_creation_method WHERE name = '惊悚乐园小说' LIMIT 1),
  1,
  21,
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
