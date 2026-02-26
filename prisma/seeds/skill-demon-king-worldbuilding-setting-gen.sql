-- The Demon King / Monster Overlord Novel「Worldbuilding」生成技能
-- 执行方式: mysql -u <user> -p <database> < skill-demon-king-worldbuilding-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'demon-king-worldbuilding-setting-gen',
  '生成「Worldbuilding」：为魔王养成小说设计背景世界观、权力结构和压迫魔族的信仰系统',
  'Generate "Worldbuilding": Design the background worldview, power structures, and belief systems that oppress the demon race for the Demon King novel',
  '## 「Worldbuilding」生成 — 魔王养成/被迫反派

在魔王养成题材中，世界观设计必须为魔王的崛起提供阻力和合法性（尽管是反派视角）。人类世界越强盛但也越伪善，主角征服他们的过程就越充满快感。

### 字段生成指南

#### World Type (世界类型)
- 这决定了世界的基础风貌。
- 是典型的勇者斗恶龙世界？还是带有游戏面板设定的LitRPG异世界？或者是神明亲自下场屠魔的残酷神战世界？

#### Human Supremacy/Divine Order (人类霸权/神圣秩序)
- 解释为什么魔王/魔物"必须死"的底层规则。
- 比如：世界树需要吸收魔物的灵魂才能结果，导致人类每年都在"猎杀"魔物；或是光之神教直接将魔族定义为罪恶之源。这赋予主角强烈的反抗动机。

#### Power Structure (权力结构)
- 人类阵营/敌对阵营的顶层设计。
- 例如：三大圣王国、九大勇者家族、教皇与审判庭。这为主角提供了一个个需要攻克的"大BOSS"。

#### Geography (地理环境)
- 主角起初建立魔王城的地点，通常是极其险恶的环境。
- 例如：无法生长的死寂荒原、被诅咒的深渊之底、隔绝人世的大冰川。恶劣的环境凸显基建的成就感。

#### Magic/Logic Rules (魔法/逻辑规则)
- 约束和影响双方的特殊世界规则。
- 例如："只有勇者之剑才能彻底杀死魔王"；"只要人类信仰光，圣城结界就不破"。这些规则将成为主角战略布局中必须去绕过或击碎的难点。',
  '## "Worldbuilding" Generation — The Demon King / Monster Overlord Novel

In the Demon King genre, the worldbuilding must provide both resistance and legitimacy (from a villainous perspective) for the Demon King''s rise. The more powerful but hypocritical the human world is, the more satisfying it is when the protagonist conquers them.

### Field Generation Guide

#### World Type
- This determines the fundamental atmosphere of the world.
- Is it a typical Hero vs. Demon Lord JRPG world? A LitRPG world with game panels? Or a brutal world where gods personally descend to slaughter demons?

#### Human Supremacy/Divine Order
- Explain the underlying rule of why the Demon King/Monsters "must die."
- For example: The World Tree needs to absorb monster souls to bear fruit, so humans "hunt" monsters annually; or the Church of Light simply defines all demons as the source of original sin. This gives the protagonist a powerful motive for rebellion.

#### Power Structure
- The top-level design of the human/enemy faction.
- For example: The Three Holy Kingdoms, The Nine Hero Families, the Pope, and the Inquisition. This provides a clear list of "Big Bosses" for the protagonist to overcome.

#### Geography
- The location where the protagonist first establishes their Demon Lord Castle, usually an extremely harsh environment.
- For example: The lifeless Dead Wastelands, the bottom of the Cursed Abyss, the Great Glacier isolated from the world. A harsh environment highlights the achievement of kingdom building.

#### Magic/Logic Rules
- Special rules of the world that constrain or influence both sides.
- For example: "Only the Hero''s Sword can permanently kill a Demon Lord"; "As long as humans believe in Light, the Holy City''s barrier cannot be broken." These rules become the key difficulties the protagonist must bypass or shatter with strategic layout.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Demon King / Monster Overlord Novel' LIMIT 1),
  1,
  4,
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
