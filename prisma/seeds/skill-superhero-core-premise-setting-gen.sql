-- Superhero / Cape Fiction Novel「Core Premise」生成技能
-- 执行方式: mysql -u <user> -p <database> < skill-superhero-core-premise-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'superhero-core-premise-setting-gen',
  '生成「Core Premise」：为超能英雄小说设计主角原型、中心冲突和道德准则',
  'Generate "Core Premise": Design the protagonist archetype, central conflict, and moral compass for Superhero fiction',
  '## 「Core Premise」生成 — 超能英雄/反传统英雄

在此类小说中，主角的身份定位决定了他们在超能社会中的生存逻辑，也决定了后续情节的冲突性质（是升职打怪，还是地下复仇）。

### 字段生成指南

#### Protagonist Archetype (主角原型)
- 选择主角在超能力社会中的初始身份。
- 是"觉醒了平庸能力的普通人"（Awakened Nobody）？还是被定性为恶人的"被误解的反派"（Misunderstood Villain）？或者是"唯利是图的黑客/义警"？

#### Archetype Details (原型详情)
- 补充说明主角力量的来源或者悲惨的过去。
- 比如：力量来源于一次致命的实验废料感染，或者是因为没有交保护费被英雄公会开除的底层职员。

#### Central Conflict (中心冲突)
- 决定主线目标。
- 绝不是简单的"保护地球打怪兽"。而是：对抗腐败的超级英雄公司、在全网通缉下洗刷冤屈、或者从F级一路肝到打破垄断的S级。

#### Moral Compass (道德基底)
- 反传统英雄的魅力在于灰色的道德观。
- 他们可能信奉"恶人自有恶人磨"（手段极其残忍的义警），也可能是一个"虽然我很想当坏人赚钱，但总是被迫拯救世界"的喜剧角色，亦或者坚持底线但绝不轻易宽恕的神罚者。

#### Story Tone (故事基调)
- 确定整体风格。如果是《黑袍纠察队》风格，就是血腥、写实、讽刺；如果是韩漫风，往往是爽快的系统升级和无差别的暴打反派/恶棍。',
  '## "Core Premise" Generation — Superhero / Cape Fiction

In this genre, the protagonist''s identity positioning determines their survival logic in superhuman society, as well as the nature of the ensuing conflict (is it grinding ranks, or underground revenge?).

### Field Generation Guide

#### Protagonist Archetype
- Choose the protagonist''s initial identity in superhuman society.
- Are they an "Awakened Nobody" with a seemingly useless power? A "Misunderstood Villain" labeled evil by the system? Or a mercenary/vigilante hacker?

#### Archetype Details
- Elaborate on the origin of their power or their tragic past.
- For example: Their power comes from an infection of illegal experimental waste, or they are a bottom-tier employee fired from the Hero Guild for not paying protection money.

#### Central Conflict
- Determines the main plot objective.
- It is NEVER simply "protecting the Earth from monsters." It is: taking down a corrupt superhero mega-corporation, clearing their name while universally wanted, or grinding from F-rank to shatter the S-rank monopoly.

#### Moral Compass
- The charm of anti-heroes lies in their gray morality.
- They might believe in "using evil to destroy evil" (a brutally violent vigilante), or be a comedic character who "wants to be a bad guy making money, but is always forced to save the world," or a punisher who holds a bottom line but never forgives.

#### Story Tone
- Determine the overall style. If it''s the *The Boys* style, it''s bloody, realistic, and satirical; if it''s Korean webtoon style, it''s usually satisfying LitRPG system upgrades and unapologetic beatdowns of villains/corrupt heroes.',
  (SELECT id FROM novel_creation_method WHERE name = 'Superhero / Cape Fiction Novel' LIMIT 1),
  1,
  2,
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
