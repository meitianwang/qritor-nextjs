-- Cli-Fi / Climate Fiction Novel「情节Plot」生成技能
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'clifi-plot-gen',
  '层级3(Domain Knowledge) - 「情节Plot」：指导如何设计公路逃生、寻找伊甸园和推翻水霸王的情节弧线',
  'Layer 3 (Domain Knowledge) - "Plot": Guide on how to design road-trip escapes, the search for Eden, and overthrowing Water Barons plotlines for Cli-Fi fiction',
  '## 剧情设计指南 (Plot Design) — 气候幻想 (Cli-Fi/Wasteland)

气候废土和生存流网文的情节驱动力，通常是一场**被迫的史诗公路旅行（The Journey）**或者是一个**绝地求生的微型围城战（The Siege）**。

### 1. 经典情节弧线 (Core Story Arcs)

#### Arc 1: The Scavenger’s Discovery & The Catalyst (拾荒与催化剂)
- **危机爆发**：主角处于平稳的苟活状态，但被打破了。可能是一股前所未有的超级风暴即将在本周摧毁定居点，或者是主角捡到了一个装有旧世界坐标的防震箱。
- **被迫逃亡**：因为怀璧其罪（比如身上带着一株活的绿色植物），主角遭到了垄断水资源寡头雇佣军的追杀，被迫逃离舒适区，踏入死亡废土。

#### Arc 2: The Brutal Highway / The Descent (残酷生存与公路旅行)
- **极限生存**：这是类型小说的核心魅力。主角需要在路上解决最基础的生理需求：没有水了、越野车抛锚了、防毒面具破了。主角通过改装和"捡垃圾"惊险度过危机。
- **道德抉择**：主角遇到了一批同样绝望的难民队伍。救他们会消耗自己宝贵的淡水，不救他们则违背了主角的人性。这个抉择通常会导致严重的后果或意外的盟友。

#### Arc 3: The Warlord''s Citadel (军阀的城堡与反叛)
- **潜入或夺取**：为了补充物资或是救被抓走的人，主角不得不潜入统治了方圆百里的"水/氧气霸王"的堡垒。
- **揭露真相**：在这里看到上流阶级的穷奢极欲，发现所谓的"资源枯竭"很大一部分是寡头为了维持统治而人工制造的骗局。

#### Arc 4: Reaching Eden / Shattering the System (抵达伊甸园 / 粉碎系统)
- **高潮抉择**：主角可能找到了地图上的那片绿洲（真结局），但也可能那个绿洲也是假的、被摧毁了。
- If 废土风：主角最终杀死了寡头，打开了巨型水闸，在夕阳下让干枯的大地重新饮水，随后驾驶破车继续流浪。

### 2. 情节设计的核心原则 (Core Principles)

- **The Tyranny of Logistics (后勤即暴政)**：剧情的推动不应该总是"来了一个厉害的怪物"，而应该是"气缸漏气了"或"最后一口干粮长满霉菌"。物流的崩溃是最高级的悬念。
- **Show, Don''t Tell the Collapse (展示文明的碎片)**：一路上要不断穿插主角探索地铁站底部的干尸、或者发现曾是大型游乐场现在的变异巨兽巢穴。这是最强烈的反乌托邦隐喻。
- **Pyrrhic Victories (惨胜)**：胜利从来不是无代价的。杀死军阀可能意味着保护罩破裂，绿洲即将暴露在沙暴中。必须充满粗粝的绝望感。

**AI 生成要求**：在生成剧情大纲或节点时，必须强调出【生存危机的倒计时】和【环境带来的致命阻碍】，战斗往往是为了抢夺物资而非单纯的恩怨。',
  '## Plot Design Guide — Cli-Fi / Climate Fiction

The plot driver in Climate Wasteland and Survival Webnovels is usually a **forced epic road trip (The Journey)** or a **desperate, claustrophobic siege (The Siege)**.

### 1. Classic Story Arcs

#### Arc 1: The Scavenger’s Discovery & The Catalyst
- **The Outbreak**: The protagonist''s quiet, steady survival is violently disrupted. A historic mega-storm is projected to wipe out the settlement this week, or the protagonist scavenges a shock-proof case containing the GPS coordinates of an old-world Eden.
- **Forced Exile**: Because they possess something invaluable (e.g., a living green sapling), they are hunted by the Water Baron''s mercenaries, forcing them to flee their meager comfort zone into the lethal Wasteland.

#### Arc 2: The Brutal Highway / The Descent
- **Extreme Survival**: This is the genre''s core appeal. The protagonist must solve fundamental physiological needs on the road: no water, a broken axle on the dune buggy, a cracked gas mask visor. The protagonist survives through extreme jury-rigging and scavenging.
- **Moral Dilemmas**: The protagonist encounters desperate refugees. Saving them burns crucial fresh water; walking away destroys the protagonist''s remaining humanity. The choice often leads to severe consequences or unexpected allies.

#### Arc 3: The Warlord''s Citadel 
- **Infiltration**: Desperate for supplies, or to rescue captured companions, the protagonist must infiltrate the citadel of the regional "Water/Air Baron."
- **Exposing the Truth**: Witnessing the absurd luxury of the ruling class, discovering that the "resource scarcity" is at least partially an artificially engineered lie maintained just to keep power.

#### Arc 4: Reaching Eden / Shattering the System
- **The Climax**: The protagonist reaches the coordinates on the map. It might be a true lush oasis, or it might be a devastatingly disappointing pile of ashes.
- **Wasteland Resolution**: The protagonist brutally kills the Oligarch, physically turns the massive rusted valve to release hoarded water back onto the parched plains, and then drives off into the irradiated sunset.

### 2. Core Principles of Plot Design

- **The Tyranny of Logistics**: Plot shouldn''t just be driven by "a strong monster appeared," but by "the engine block cracked" or "the last canteen is tainted." Logistic failure is the highest form of suspense.
- **Show, Don''t Tell the Collapse**: Constantly intercut the journey with explorations of dried-up corpses in an ancient subway, or a mutated beast''s nest inside an old amusement park ferris wheel. This is the ultimate dystopian metaphor.
- **Pyrrhic Victories**: Winning is never clean. Killing the Warlord might break the settlement''s shield generator, exposing it to the toxic storm. It must always carry a gritty, desperate tone.

**AI Generation Requirements**: When generating plot outlines, you MUST emphasize the [Ticking Clock of the Survival Crisis] and the [Lethal Environmental Obstacles]. Combat is almost always about fighting for a bottle of water or a charged battery, not just personal grudges.',
  (SELECT id FROM novel_creation_method WHERE name = 'Cli-Fi / Climate Fiction Novel' LIMIT 1),
  1,
  100,
  NOW()
)
ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);
