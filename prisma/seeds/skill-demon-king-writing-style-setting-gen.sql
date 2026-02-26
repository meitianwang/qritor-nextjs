-- The Demon King / Monster Overlord Novel「Writing Style」生成技能
-- 执行方式: mysql -u <user> -p <database> < skill-demon-king-writing-style-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'demon-king-writing-style-setting-gen',
  '生成「Writing Style」：为魔王养成小说设计叙事视角、行文基调和写作重点',
  'Generate "Writing Style": Design the narrative POV, prose tone, and writing focus areas for the Demon King novel',
  '## 「Writing Style」生成 — 魔王养成/被迫反派

行文风格决定了读者消费"魔王/基建/征服"元素时的感官体验，是史诗群像还是爽快的主观视角。

### 字段生成指南

#### Narrative POV (叙事视角)
- 对于以宏大战略为卖点的魔王文，"第一人称"代入感极强（适合吐槽向/主角个人戏份重），"第三人称"适合描写恢弘战役。
- 强烈建议加入"Alternating with Enemy POV"（穿插敌人视角）。通过愚蠢或傲慢的人类视角的傲慢预判，来反衬接下来被魔王军团碾压的震撼。这是最典型的爽点写法。

#### Prose Style (行文基调)
- 根据前置设定的不同设定基调。
- "Grand and Epic"适合正统建国；"Dark and Visceral"适合吞噬进化的硬核魔物；"Humorous and Ironic"适合主角疯狂吐槽"我只是想活下去怎么就成了魔王"。

#### Focus Areas (写作重点)
- 设定每章最花笔墨的部分。
- 是魔王城种田升级的"钉子和木板"的细节？是百万大军攻城拔寨的战术？还是魔王与性格各异的手下之间的互动？这决定了小说是种田文、战略文还是群像文。

#### Tone of Villainy (反派调性)
- 主角作恶时的行文态度。
- 如果主角是"Misunderstood Saviors"，作恶本质上是不得已；如果"Cold Rationality"，所有的残酷手段都被描写成一道冰冷的算术题。',
  '## "Writing Style" Generation — The Demon King / Monster Overlord Novel

The prose style determines the sensory experience readers have when consuming the "Demon King / Kingdom Building / Conquest" elements: is it an epic ensemble piece or a visceral, subjective POV?

### Field Generation Guide

#### Narrative POV
- For Overlord novels focused on grand strategy, "First Person" provides strong immersion (great for sarcastic/character-focused stories), while "Third Person" suits epic battles.
- It is highly recommended to include "Alternating with Enemy POV." Using the arrogant miscalculations from stupid or proud human perspectives to magnify the shock when they are immediately crushed by the Demon Lord''s army is a classic and highly satisfying trope.

#### Prose Style
- Set the tone according to the prior premise settings.
- "Grand and Epic" fits orthodox nation-building; "Dark and Visceral" suits hardcore devour-to-evolve monsters; "Humorous and Ironic" fits protagonists constantly complaining internally, "I just wanted to survive, how did I become the Supreme Overlord?"

#### Focus Areas
- Set what the narrative spends the most time on.
- Is it the "nails and boards" details of upgrading the Demon King Castle? The tactics of million-strong armies besieging cities? Or the character interactions between the Demon King and their quirky minions? This determines whether the novel is a kingdom-building litRPG, a strategy novel, or an ensemble cast story.

#### Tone of Villainy
- The narrative attitude when the protagonist commits "evil" acts.
- If the protagonist is part of the "Misunderstood Saviors," the evil is inherently reluctant; if it''s "Cold Rationality," every cruel tactic is depicted purely as a cold mathematical calculation.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Demon King / Monster Overlord Novel' LIMIT 1),
  1,
  5,
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
