-- The Demon King / Monster Overlord Novel「Core Premise」生成技能
-- 执行方式: mysql -u <user> -p <database> < skill-demon-king-core-premise-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'demon-king-core-premise-setting-gen',
  '生成「Core Premise」：为魔王养成小说设计主角的起源、中心冲突与道德基底',
  'Generate "Core Premise": Design the protagonist''s origin, central conflict, and moral baseline for the Demon King novel',
  '## 「Core Premise」生成 — 魔王养成/被迫反派

这是决定整本小说基调的模块。魔王主角的设定不仅关乎他是什么种族，更关乎他为什么"成为"魔王。

### 字段生成指南

#### Origin Archetype (起源原型)
- 选择主角作为魔王的起点属性。是转生怪兽、还是堕落英雄？
- 这决定了主角对待人类世界的初始态度。

#### Archetype Details (原型详情)
- 补充说明他们在这个世界上继承了什么怪物特征。
- 讨论人性的保留与丧失：他们是否因为怪物的本能（如吸血的饥渴、吃肉的冲动）而逐渐失去人的道德观？

#### Central Conflict (中心冲突)
- 核心矛盾必须是生存与发展层面的。
- 最好是结构性的矛盾：人类的"正义"必须以消灭魔族为前提，因此双方没有和平共处的可能，只能是你死我活的征服。

#### Moral Compass (道德基底)
- 主角行事的底线。
- 他们可能是为了保护手下而残酷无情的君主（对内春天般温暖，对外严冬般冷酷），也可能是一个完全丧失人性的纯正邪恶存在，或者是内心偷偷吐槽但表面必须装作威严的"被迫营业"魔王。

#### Story Tone (故事基调)
- 基建/征服为主的故事，还是黑暗残酷的求生？确保基调与上面的道德基底相匹配。',
  '## "Core Premise" Generation — The Demon King / Monster Overlord Novel

This is the module that sets the tone for the entire novel. The setting of the Demon King protagonist is not just about what race they are, but *why* they "become" the Demon King.

### Field Generation Guide

#### Origin Archetype
- Choose the protagonist''s starting point as the Demon King. Are they a reincarnated monster or a fallen hero?
- This determines the protagonist''s initial attitude toward the human world.

#### Archetype Details
- Elaborate on what monstrous traits they inherited in this world.
- Discuss the retention vs. loss of humanity: Are they gradually losing their human morals due to monster instincts (like a vampire''s thirst or a carnivore''s hunger)?

#### Central Conflict
- The core conflict must be on the level of survival and expansion.
- Ideally, it''s a structural conflict: Human "Justice" requires the extermination of the demon race, meaning coexistence is impossible and the only path is conquest.

#### Moral Compass
- The bottom line of the protagonist''s actions.
- They might be a ruthless monarch who protects their subordinates at all costs (warm as spring internally, cold as winter externally), a purely evil entity that has lost all humanity, or a "forced to work" Demon King who secretly complains internally but must maintain a terrifying facade.

#### Story Tone
- Is it primarily a kingdom-building/conquest story, or a dark and brutal survival story? Ensure the tone matches the moral baseline above.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Demon King / Monster Overlord Novel' LIMIT 1),
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
