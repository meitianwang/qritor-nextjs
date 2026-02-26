-- Superhero / Cape Fiction Novel「Power System」生成技能
-- 执行方式: mysql -u <user> -p <database> < skill-superhero-power-system-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'superhero-power-system-setting-gen',
  '生成「Power System」：为超能英雄小说设计异能机制、系统面板和主角专属挂',
  'Generate "Power System": Design the superpower mechanics, system ui, and the protagonist''s cheat for Superhero fiction',
  '## 「Power System (系统/能力机制)」生成 — 超能英雄/反传统英雄

超能网文最大的爽点之一就是其**力量体系与系统面板**。主角能够跨越阶级障碍，全靠一个独特的系统或被严重低估的异变能力。

### 字段生成指南

#### System Type (系统类型)
- 这决定了世界观是怎样产生超能力的。
- 是全球数据化的 LitRPG 面板？是偶然捡到的外星金手指寄生？还是变种人基因库变异？

#### Core Mechanics (核心运转机制)
- 在这个世界里，能力者是如何变强的？
- 例如：杀怪掉落技能书（网游化）、吸收其他超人类的血液/基因（黑暗风）、或者必须要获得公众的"认知度/粉丝数"才能解锁力量（娱乐资本风）。

#### Protagonist''s Cheat (主角特有外挂)
- 别人都没有，只有主角有的独特优势，也是越级打怪的核心。
- 比如：别人只能携带三个技能，主角拥有无上限的技能栏；或者主角的系统面板可以显示所有超能者的"致命弱点"与"隐藏犯罪记录"。

#### Power Limitations/Costs (能力的局限与代价)
- 外挂太强会毁掉剧情张力，需要有代价或限制。
- 比如：强力技能有极长的冷却时间；吸取他人超能力会导致精神污染出现幻听；或者是极致的肉体强化需要消耗天价的卡路里。

#### Power Tiers/Ranks (阶层/评级)
- 设定明确的等级阶梯（常用于打脸和制造落差）。
- 最常见的是 F 到 SSS 级，或者 Class 1-5。描写这个评级系统有多死板，主角跨级击杀时就有多震撼。',
  '## "Power System" Generation — Superhero / Cape Fiction

One of the biggest payoffs in superhero web fiction is its **power system and system interfaces**. The protagonist''s ability to cross class boundaries relies entirely on a unique system or a severely underestimated superpower.

### Field Generation Guide

#### System Type
- This determines how superpowers are generated and tracked in the worldview.
- Is it a globally gamified LitRPG screen? A parasitic alien cheat accidentally found? Or a mutant genetic pool?

#### Core Mechanics
- How do awakened individuals get stronger in this world?
- For example: Killing monsters drops skill books (Gamified), absorbing blood/genes of other superhumans (Dark style), or needing to gain public "Cognition/Fan Count" to unlock power (Corporate PR style).

#### Protagonist''s Cheat
- The unique advantage only the protagonist possesses, serving as the core mechanics for punching above their weight class.
- For example: Others can only hold three skills, but the protagonist has infinite skill slots; or the protagonist''s interface displays the "Fatal Weaknesses" and "Hidden Crime Records" of every superhuman.

#### Power Limitations/Costs
- An overpowered cheat destroys narrative tension, so there must be costs or constraints.
- For example: Powerful skills have extremely long cooldowns; absorbing others'' powers causes mental pollution and hallucinations; or extreme physical enhancement burns through astronomical amounts of calories.

#### Power Tiers/Ranks
- Set a clear hierarchy ranking scale (frequently used for face-slapping and creating dramatic contrast).
- Most common is F to SSS rank, or Class 1-5. Describe how rigid this official system is, so when the protagonist achieves an across-tier kill, the shock value is maximized.',
  (SELECT id FROM novel_creation_method WHERE name = 'Superhero / Cape Fiction Novel' LIMIT 1),
  1,
  3,
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
