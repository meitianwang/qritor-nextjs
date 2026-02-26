-- Cli-Fi / Climate Fiction Novel「Faction」生成技能
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'clifi-faction-gen',
  '「势力」生成：为气候幻想小说生成净水财团、废土游牧部落与科技狂热教派',
  '"Faction" generation: generate water conglomerates, wasteland nomadic tribes, and tech-worshipping cults for Cli-Fi fiction',
  '## 「Faction (势力/组织)」生成 — 气候幻想 (Cli-Fi)

在生存资源崩溃的世界，所有的组织形态都会退化或变得极端。没有国家，只有掌控了活命资源的部族和寡头。

### 势力阵营的设计

#### 1. Resource Monopoly (资源寡头/水霸王)
统治阶层。掌握着废土上的硬通货（比如最大的净水厂、室内农场）。
- **特色**：实行残酷的地带隔离。他们用雇佣军把守水源，平民必须拿旧时代的遗物或出卖劳动力来换取按滴计算的饮用水。

#### 2. Nomadic Tribe/Flotilla (游牧部落/浮岛舰队)
逐水草或躲避风暴而居的人群。
- **特色**：由几十辆重型改装卡车组成的车队，或者是由几百艘废旧轮船用铁链拼凑起来的海上移动城。他们是最讲究"物尽其用"和"不抛弃同伴"的一群人。

#### 3. Technological Cult (科技狂热教派)
盲目崇拜旧世界科技的疯子。
- **特色**：他们不理解科技的原理，只是把旧时代的机房当成神庙，把机油当作圣水涂在脸上。他们极其排外，并且会为了抢夺一片保存完好的硅芯片而发动屠杀。

#### 4. Dystopian Government Remnant (反乌托邦政府残党)
旧世界的最后影子，通常躲在防核武的深层地下堡垒里。他们手握高科技武器，梦想着清洗地表表面那些"受辐射污染的贱民"，重新建立纯血统治。

### 字段生成指南

#### Ideology/Beliefs (信仰/意识形态)
- 在地狱里，人靠什么自我催眠？
- "水坝就是上帝，水管就是血管。我们掌控着废土的脉搏，自然有权决定谁生谁死。这是物竞天择的最优解。"（资源寡头的独裁宣言）

#### Key Assets (核心资产)
- 具体化他们的命脉。
- 比如：拥有一座战前的巨型海水淡化厂，以及三支配备重机枪的沙滩越野车编队；或者控制着地下避难所唯一能运转的核聚变反应堆。

#### Current Supply Status (当前物资状态)
- 势力不是稳定的。
- 拾荒帮派可能："Current Supply Status: 濒临饿死，正在绝望地筹划进攻寡头的一辆补给水车。"
- 寡头可能："Current Supply Status: 储备富足，但在暗中寻找能够修复水过滤器老化零件的机械师，这成了致命隐患。"',
  '## "Faction (Organization)" Generation — Cli-Fi

In a world broken by resource collapse, all organizational forms regress or become extreme. There are no nations left, only tribes and oligarchs who control the resources needed to stay alive.

### Faction Design

#### 1. Resource Monopoly (Water Barons/Air Tycoons)
The ruling class. They hold the hard currency of the wasteland (e.g., the largest water purification plant, indoor hydroponics).
- **Characteristics**: Enforce brutal segregation. They use mercenaries to guard the water valves. Civilians must trade old-world relics or slave labor for drinking water measured by the drop.

#### 2. Nomadic Tribe/Flotilla
People constantly on the move to follow resources or dodge seasonal mega-storms.
- **Characteristics**: A convoy of dozens of heavily modified rigs, or a floating city of hundreds of rusted oil tankers chained together. They are the ultimate practitioners of "waste not, want not" and possess strong communal loyalty.

#### 3. Technological Cult 
Zealots who blindly worship the relics of the old world.
- **Characteristics**: They don''t understand the science; they treat abandoned server rooms as shrines and anoint themselves with motor oil like holy water. They are violently xenophobic and will slaughter a settlement over a pristine silicon microchip.

#### 4. Dystopian Government Remnant
The ghost of the old world, usually hiding in deep, nuke-proof bunkers. Armed with high-tech weaponry, dreaming of purging the surface of its "radiation-mutated untouchables" to re-establish a pureblood regime.

### Field Generation Guide

#### Ideology/Beliefs
- In hell, how do people justify their actions?
- "The Dam is God, the pipes are veins. We control the pulse of the wasteland, naturally giving us the right to decide who lives and dies. This is Darwinism perfected." (A Resource Oligarch''s manifesto).

#### Key Assets
- Specify their lifeline.
- For example: They own a pre-war massive desalination plant and three squads of heavy-machine-gun mounted dune buggies; or they control the only functioning fusion reactor in the underground silo.

#### Current Supply Status
- Factions are not static.
- Scavenger gangs might be: "Current Supply Status: On the verge of starvation, desperately plotting a suicide raid on an Oligarch''s water tanker."
- Oligarchs might be: "Current Supply Status: Wealthy and hoarding, but secretly desperate to find a mechanic to fix the aging central filter piece before the whole system goes toxic."',
  (SELECT id FROM novel_creation_method WHERE name = 'Cli-Fi / Climate Fiction Novel' LIMIT 1),
  1,
  41,
  NOW()
)
ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);
