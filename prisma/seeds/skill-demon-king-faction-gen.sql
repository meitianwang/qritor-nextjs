-- The Demon King / Monster Overlord Novel「Faction」生成技能
-- 执行方式: mysql -u <user> -p <database> < skill-demon-king-faction-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'demon-king-faction-gen',
  '「势力」生成：为魔王养成小说生成魔物王国与各个人类/其他种族国家（Faction）',
  '"Faction" generation: generate the Monster Kingdom and various human/other race nations for the Demon King novel',
  '## 「Faction (势力/组织)」生成 — 魔王养成/被迫反派小说

势力（Faction）是本作最核心的宏大叙事载体。势力的碰撞就是国家战争，主角的终极目标通常是让"主角所在的势力"不断吞并、消灭其他势力。

### 势力阵营的设计

#### 1. The Demon Kingdom (主角阵营)
魔物、邪武士、亡灵的收容所。
- **特色**：虽然外观惊悚邪恶，但内部往往遵循绝对的实力至上主义、种族平等主义，甚至因为主角的现代人思维，社会福利比人类国家好得多。
- **扩展性**：它是一个成长中的实体，随着吞并不同种族，会出现各大军团（如吸血鬼法师团、巨魔重步兵团）。

#### 2. Human Empire / Holy Church (绝对敌对核心)
故事的主要推平对象。
- **设计重点**：把人类世界设计得极其庞大但也极度腐朽。他们外表光鲜，内部贵族压迫平民、教廷打着神之名敛财。这赋予了主角推平他们时的正统性（甚至读者会觉得魔王才是来结束乱世的拯救者）。

#### 3. 边境夹缝势力 (Neutral / Subjugated Vassals)
主角势力扩张初期的首选吞并对象。
- 如：灰烬森林的散落哥布林部落、被人类追杀的半精灵难民营地、地下幽暗地域的穴居人。他们渴望获得庇护，是主角极好的初始劳动力和兵源。

### 字段生成指南

#### Military Strength (军事实质)
- 详细描绘势力的兵种配置，一定要体现出种族风情。
- 人类可能是光之骑士团、魔法加农炮；魔王军可能是腐肉巨人、暗影蜘蛛骑兵。资源的差距是双方对抗的核心。

#### Current Territory & Morale (动态展示)
- **Current Territory**：不仅是"占地多大"，还要描述版图的边界危机。例如（帝国：占据大陆中央的丰饶平原；魔族：偏安极北苦寒的冰原）。
- **Current Morale/Stability**：势力是不稳定的。人类帝国可能看似强盛实则因为继承权而在打内战，这就给了魔王军出征的可乘之机。',
  '## "Faction (Organization)" Generation — The Demon King / Monster Overlord Novel

Factions are the core carriers of the grand narrative in this genre. The collision of factions is national warfare, and the protagonist''s ultimate goal is usually to make "their faction" continuously devour and conquer all others.

### Faction Faction Design

#### 1. The Demon Kingdom (Protagonist Faction)
The haven for monsters, dark knights, and the undead.
- **Characteristics**: Although outwardly terrifying and evil, internally it often follows absolute meritocracy and racial equality. Often, due to the protagonist''s modern mindset, the social welfare is far better than in human nations.
- **Scalability**: It is a growing entity. As it annexes different races, massive legions will form (e.g., Vampire Mage Corps, Troll Heavy Infantry).

#### 2. Human Empire / Holy Church (The Absolute Enemy Core)
The primary targets to be steamrolled.
- **Design Focus**: Make the human world extremely vast but deeply corrupted. They are shiny on the outside, but internally, nobles oppress commoners and the Church hordes wealth in the name of God. This grants the protagonist a twisted form of legitimacy when conquering them (to the point where readers feel the Demon King is actually the savior ending a chaotic era).

#### 3. Borderline Factions (Neutral / Subjugated Vassals)
The primary targets for early-stage annexation during the faction''s expansion.
- e.g., Scattered goblin tribes in the Ashen Forest, Half-elf refugee camps hunted by humans, Troglodytes in the Underdark. They desperately seek protection and make excellent initial laborers and conscripts for the protagonist.

### Field Generation Guide

#### Military Strength
- Describe the troop composition in detail, ensuring it reflects racial flavor.
- Humans might have Knights of Light and Magic Cannons; the Demon Army might have Rotting Behemoths and Shadow Spider Cavalry. The disparity in resources and unit types forms the core of warfare.

#### Current Territory & Morale (Dynamic Display)
- **Current Territory**: Not just "how big it is," but describe the border crisis. For example: (Empire: Holds the fertile plains at the center of the continent; Demons: Exiled to the bitter frozen tundra of the far north).
- **Current Morale/Stability**: Factions are unstable. The Human Empire might look outwardly invincible but is secretly fighting a civil war over succession—giving the Demon Lord''s army the perfect opening to strike.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Demon King / Monster Overlord Novel' LIMIT 1),
  1,
  41,
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
