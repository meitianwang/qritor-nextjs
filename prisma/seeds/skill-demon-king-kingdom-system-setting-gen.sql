-- The Demon King / Monster Overlord Novel「Kingdom System」生成技能
-- 执行方式: mysql -u <user> -p <database> < skill-demon-king-kingdom-system-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'demon-king-kingdom-system-setting-gen',
  '生成「Kingdom System」：为魔王养成小说设计领地建设、种族进化和系统机制',
  'Generate "Kingdom System": Design territory building, racial evolution, and system mechanics for the Demon King novel',
  '## 「Kingdom System」生成 — 魔王养成/被迫反派

在魔王养成题材中，基建（Kingdom Building）系统是小说的绝对核心爽点之一。读者希望看到势力从无到有、从小村落到深渊帝国的蜕变。

### 字段生成指南

#### System Type (系统类型)
- 这决定了基建的核心运转机制：是玩RTS游戏一样收集木材矿石？还是吞噬敌人尸体转化成亡灵大军？还是地下城核心管理模式？

#### Core Mechanics (核心机制)
- 详细描述这个系统的循环定律。
- 例如：击杀勇者获得"信仰值" -> 信仰值用于抽取高级魔将 ->高级魔将攻打人类城池 -> 获取更多资源。必须形成清晰的正反馈闭环。

#### Minion Types (兵种类型)
- 魔王手下不能只有一种兵。需要设计兵种搭配。
- 比如：哥布林负责低级采矿与炮灰，兽人负责正面肉搏，魅魔负责潜伏与情报，暗精灵负责魔法与远程。展现出魔王军团的多样性与专业性。

#### Territory Upgrades (领地升级)
- 列出魔王基地进化的几个关键阶段。
- 例如：阶段一"破败虫窟"；阶段二"黑岩要塞"；阶段三"绝望深渊"。每次升级都带来实质性的建筑与能力解锁。

#### Growth Bottlenecks (发展瓶颈)
- 限制魔王无限扩张的阻力。
- 比如：某类核心矿石只有人类帝国中心才有、高级眷属的维护需要吞噬强大的圣光灵魂、或者规模太大引来了神明的直接注视。这为剧情提供了需要克服的"任务目标"。',
  '## "Kingdom System" Generation — The Demon King / Monster Overlord Novel

In the Demon King genre, the Kingdom Building system is one of the absolute core appeals. Readers want to witness the transformation of a faction from nothing to a full-fledged Abyssal Empire.

### Field Generation Guide

#### System Type
- This determines the core operating mechanism of the kingdom building: is it like an RTS game collecting wood and ore? Is it devouring enemy corpses to convert them into an undead army? Or Dungeon Core management mode?

#### Core Mechanics
- Describe the cyclical law of this system in detail.
- Example: Kill heroes to get "Faith Points" -> Faith points are used to summon high-tier Demon Generals -> Demon Generals conquer human cities -> Gain more resources. It must form a clear positive feedback loop.

#### Minion Types
- The Demon King cannot only have one type of subordinate. You need to design unit compositions.
- Example: Goblins handle low-level mining and act as cannon fodder, Orcs for frontline melee, Succubi for infiltration and intel, Dark Elves for magic and range. Show the diversity and professionalism of the demon army.

#### Territory Upgrades
- List the key evolutionary stages of the Demon King''s base.
- Example: Stage 1 "Ruined Insect Hive"; Stage 2 "Blackstone Fortress"; Stage 3 "Abyss of Despair." Each upgrade brings substantial unblocks in buildings and capabilities.

#### Growth Bottlenecks
- The resistance that limits the Demon King''s infinite expansion.
- Examples: A core ore is only found in the center of the Human Empire, high-tier familiars require devouring powerful Holy Souls to maintain, or getting too large attracts the direct gaze of the Gods. This provides "quest objectives" for the plot to overcome.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Demon King / Monster Overlord Novel' LIMIT 1),
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
