-- Cli-Fi / Climate Fiction Novel「Worldbuilding」生成技能
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'clifi-worldbuilding-setting-gen',
  '生成「Worldbuilding」：为气候幻想小说设计大崩溃历史、文明结构与阶级压迫',
  'Generate "Worldbuilding": Design the history of the collapse, civilization structure, and class oppression for Cli-Fi fiction',
  '## 「Worldbuilding」生成 — 气候幻想 (Cli-Fi)

世界观需要交代"我们是如何走到这一步的"，以及现在的社会是凭借怎样的扭曲架构在运转。它不可避免地带有一种反乌托邦色彩。

### 字段生成指南

#### The Great Collapse (大崩溃事件)
- 一切灾难的源头。
- 不需要写得很科学，但要足够震撼。比如："The Melt"（南极冰川在一夜之间全部掉入海洋，引发了千米高的海啸吞没六大洲），或者是"The Ash Winter"（一次巨大的超级火山爆发掩盖了太阳，导致长达百年的黑暗纪元）。

#### Current Civilization Structure (现存文明结构)
- 幸存者是如何抱团的？
- **Nomadic Convoys**：驾驶着巨型卡车的钢铁车队，一直在躲避随季节移动的沙暴。
- **Underground Bunkers (Silos)**：躲在地表的地下避难所中，严格控制人口和生育，统治阶级在顶层，甚至可能隐瞒了地表其实已经可以呼吸的真相。
- **Corporate Eco-Domes**：富人们用玻璃和空调造出来的完美人造生态园，外面则是被他们抽干资源的难民营。

#### Old-World Relics (旧时代遗迹的认知)
- 现在的废土居民怎么看待21世纪的我们？
- 充满讽刺感。比如：把废弃的高速公路当作是崇拜太阳神的图腾，把一块停电的智能手机当作祈祷的圣物；或者感叹"古代人居然用清澈的水去冲马桶"这种极其奢侈的行为。

#### Social Disparity (社会阶级落差)
- 强调资源的分配不均。
- 下层阶级：因为缺少防辐射服，从小长满皮肤溃疡，寿命最多30岁。
- 上层阶级：垄断了抗辐射药物和室内水培农场，依然喝着红酒谈论艺术。这为主角的阶级反抗提供了绝对的正当性。',
  '## "Worldbuilding" Generation — Cli-Fi

Worldbuilding needs to explain "how we got here," and the twisted architecture keeping the current society running. It inevitably carries a dystopian flavor.

### Field Generation Guide

#### The Great Collapse (The Event)
- The origin of all disasters.
- Needs to be striking rather than strictly scientific. For example: "The Melt" (Antarctic glaciers all sliding into the ocean overnight, causing kilometer-high tsunamis swallowing six continents), or "The Ash Winter" (a super-volcano eruption blotting out the sun, triggering a century-long dark age).

#### Current Civilization Structure
- How do survivors group together?
- **Nomadic Convoys**: Fleets of massive steel rigs constantly driving to dodge seasonal, continents-spanning sandstorms.
- **Underground Bunkers (Silos)**: Hiding underground, enforcing strict population control, with the ruling class at the top (perhaps hiding the truth that the surface is breathable again).
- **Corporate Eco-Domes**: Perfect artificial biosystems built with glass and AC by the ultra-rich, surrounded by refugee camps drained of resources.

#### Old-World Relics
- How do wastelanders view our 21st century?
- Filled with irony. For example: treating an abandoned highway overpass as a totem to the Sun God, treating a dead smartphone as a holy relic for prayer; or scoffing in utter disbelief that "the Ancients actually used pure, crystal water just to flush their toilets."

#### Social Disparity
- Emphasize unequal resource distribution.
- Lower Class: Covered in skin sores from radiation due to lack of protective gear, with a life expectancy of 30.
- Upper Class: Monopolizing anti-radiation meds and indoor hydroponic farms, still drinking wine and discussing art. This provides absolute legitimacy for the protagonist''s class rebellion.',
  (SELECT id FROM novel_creation_method WHERE name = 'Cli-Fi / Climate Fiction Novel' LIMIT 1),
  1,
  4,
  NOW()
)
ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);
