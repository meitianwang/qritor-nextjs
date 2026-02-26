-- The Demon King / Monster Overlord Novel「Scene」生成技能
-- 执行方式: mysql -u <user> -p <database> < skill-demon-king-scene-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'demon-king-scene-gen',
  '「场景」生成：为魔王养成小说生成魔王城建筑、被征服的领地和绞肉机战场',
  '"Scene" generation: generate Demon Lord Castle buildings, conquered territories, and meat-grinder battlefields for the Demon King novel',
  '## 「Scene (场景)」生成 — 魔王养成/被迫反派小说

魔王题材的"Scene"与常规小说不同。这里的场景往往是**可成长的实体**或**正在被改变的领地**。魔王城从一个寒酸的泥洞，到深渊熔岩堡垒，是读者极大的满足感来源。

### 场景的设计重点 (Strategic & Visual Focus)

#### Location Type (场景类型)
- **Demon King''s Castle (大本营)**：主角经营的绝对核心区，这里拥有最高级兵种的生产线和主角的王座。
- **Frontier Outpost (前哨站)**：推进领地的前线堡垒，经常遭到勇者小队的骚扰，需要防御塔和巡逻陷阱。
- **Human Capital (人类主城)**：最终被攻陷的圣地，通常充满象征着虚伪神圣的光明魔法禁制。
- **Resource Mine (资源矿脉)**：基建的核心血脉。

#### Appearance/Atmosphere (视觉与氛围体验)
- 魔王阵营的建筑应该透出"恢弘、恐怖但极具秩序美感"。
- 不要只写骨头和鲜血，可以写"散发着幽蓝灵魂之火的黑曜石尖塔"、"完全由被奴役的光明神官提供运转能量的暗光大阵"。要有一种极致的、反抗人类审美的压迫感。

#### Strategic Value & Defenses (战略与防御)
- 在基建题材中，场景也是武器。
- **Strategic Value**：这里产出什么资源？（如：盛产制造高级骷髅的完美黑阴木）。
- **Defenses**：防御体系如何运作？（如：遍布毒气陷阱，以及随时会复活阵亡敌人为死灵兵卒的守卫阵法）。

#### Controlling Faction & State (控制与状态)
- 控制权在基建战争文里是反复易手的。在描写时，要注重"占领"带来的变化。例如人类主城一旦被攻破，第二天就会被铺设上深渊菌毯，教堂会被改造成魅魔巢穴。这极其符合受众的爽点特征。',
  '## "Scene" Generation — The Demon King / Monster Overlord Novel

The "Scene" in the Demon King genre is different from conventional novels. Here, locations are often **growing entities** or **territories currently undergoing alteration**. Watching the Demon Lord''s Castle transform from a shabby mud cave to an Abyssal Magma Fortress provides immense satisfaction to readers.

### Scene Design Focus

#### Location Type
- **Demon King''s Castle (Main Base)**: The absolute core zone managed by the protagonist, holding the production lines for top-tier units and the throne itself.
- **Frontier Outpost**: The frontline fortress advancing the territory borders, frequently harassed by Hero parties, requiring defensive towers and trap patrols.
- **Human Capital**: The ultimate holy land to be conquered, usually filled with hypocritical, sacred light magic barriers.
- **Resource Mine**: The lifeblood of the kingdom building efforts.

#### Appearance/Atmosphere
- Demon faction architecture should exude a "grand, terrifying, yet highly ordered aesthetic."
- Don''t just write about bones and blood; write about "Obsidian spires radiating pale blue soul-fire," or a "Darkness array powered entirely by enslaved priests of light." It needs a supreme, oppressive presence that defies human aesthetics.

#### Strategic Value & Defenses
- In kingdom-building literature, the location is also a weapon.
- **Strategic Value**: What resource does it produce? (e.g., Abundant in Perfect Blackwood used for crafting high-tier skeletons).
- **Defenses**: How does the defense system operate? (e.g., Poison gas traps everywhere, alongside a warding array that instantly resurrects fallen enemies as undead pawns).

#### Controlling Faction & State
- Control constantly shifts in a kingdom-building war novel. When describing this, emphasize the *changes* brought by "occupation." For example, once the human capital is breached, by the next day it might be covered in abyssal creep, and the Grand Cathedral heavily remodeled into a Succubus Hive. This perfectly hits the genre''s payoff characteristics.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Demon King / Monster Overlord Novel' LIMIT 1),
  1,
  61,
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
