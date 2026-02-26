-- The Demon King / Monster Overlord Novel「Story Hook」生成技能
-- 执行方式: mysql -u <user> -p <database> < skill-demon-king-story-hook-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'demon-king-story-hook-setting-gen',
  '生成「Story Hook」：为魔王养成小说设计核心卖点、开局冲突和读者期待',
  'Generate "Story Hook": Design the core selling point, opening tension, and reader expectations for the Demon King novel',
  '## 「Story Hook」生成 — 魔王养成/被迫反派

在魔王养成题材中，Story Hook 需要准确击中读者的爽点：从弱小生物崛起、反杀傲慢的人类勇者、经营自己势力的成就感。

### 字段生成指南

#### Story Hook
- 一句话概括故事的情绪核心。
- 必须包含：主角的特殊身份 + 被迫对抗世界的理由 + 最终的目标。
- 示例："转生为最弱骷髅兵，为了在勇者的屠刀下保护不死族同伴，被迫建立令整个大陆颤抖的白骨帝国。"

#### Core Selling Point (核心卖点)
- 突出本作品在众多魔王/基建文中的独特性。
- 比如：独特的升级树（吞噬进化）、反差萌（外表恐怖内心吐槽）、极限微操的战略指挥、或者对传统勇者斗恶龙套路的解构。

#### Opening Tension (开局冲突)
- 主角开局面临的生死危机，迫使他们必须立刻开始"基建"或"战斗"。
- 不能拖沓，必须是立即生效的外部压力。例如：人类讨伐军就在门外，而主角此刻只有一个破烂的哥布林部落。

#### Reader Expectation (读者期待)
- 承诺后续的情节高潮。
- 例如：收服强大的魔将、将人类圣女洗脑/收编、打造出坚不可摧的魔王城、看到傲慢勇者破防的瞬间。',
  '## "Story Hook" Generation — The Demon King / Monster Overlord Novel

In the Demon King building genre, the Story Hook must accurately hit the readers'' core interests: the rise from a weak creature, the reversal against arrogant human heroes, and the deep satisfaction of kingdom building.

### Field Generation Guide

#### Story Hook
- A one-sentence summary of the story''s emotional core.
- Must include: the protagonist''s unique identity + the reason they are forced to oppose the world + the ultimate goal.
- Example: "Reincarnated as the weakest skeleton soldier, to protect his undead comrades from the Hero''s blade, he is forced to build a Bone Empire that makes the entire continent tremble."

#### Core Selling Point
- Highlight what makes this work unique among numerous Overlord/Kingdom-Building novels.
- e.g., A unique evolution tree (devour-to-evolve), contrasting traits (terrifying appearance but internally pragmatic/sarcastic), extreme strategic micro-management, or the complete deconstruction of traditional Hero vs. Demon Lord tropes.

#### Opening Tension
- The life-and-death crisis facing the protagonist at the start, forcing them to immediately begin "building" or "fighting."
- It must be immediate external pressure. For example: The Human Crusade Army is at the gates, and the protagonist only has a dilapidated goblin tribe.

#### Reader Expectation
- Promise future plot highlights and payoffs.
- e.g., Subjugating powerful demon generals, capturing/converting the human Holy Maiden, building an impenetrable Demon Lord Castle, and witnessing the exact moment the arrogant Hero breaks mentally.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Demon King / Monster Overlord Novel' LIMIT 1),
  1,
  1,
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
