-- Cli-Fi / Climate Fiction Novel「Character」生成技能
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'clifi-character-gen',
  '「角色」生成：为气候幻想小说生成拾荒者、水阀霸主、废土向导与其生存技能',
  '"Character" generation: generate scavengers, water barons, wasteland guides, and their survival skills for Cli-Fi fiction',
  '## 「角色」生成 — 气候幻想 (Cli-Fi/Wasteland)

在极端环境中，角色不再以"美丑"划分，而是以"生存价值"衡量。外表的伤疤和随身携带的装备，就是他们在这个世界摸爬滚打的履历。

---

### 角色的定位与功能 (Role)

#### 1. Warlord/Resource Baron (寡头/资源霸主)
垄断了维系生命的关键物资（水、电、防毒面具）的独裁者。
- **特色**：他们不一定武力最强，但极度残忍且控制着水源开关。为了立威，他们会把因为偷水而处死的人挂在太阳下暴晒。这群人是主角革命的首要目标。

#### 2. Protagonist/Scavenger (主角/拾荒者)
- 大多数时候，主角是一个边缘人。凭着强悍的垃圾改造能力或熟记旧世界的地图苟活。冷酷的外表下可能掩藏着过去的创伤。

#### 3. Old-World Scholar/Archivist (旧世界学者/文明记录者)
队伍中的智囊或拖油瓶。
- 他们可能是患有辐射病的老人，死守着几本旧书和一台不通电的服务器。他们知道"核电站"该怎么重启，或者知道"伊甸园"的真实方位。

#### 4. Sheltered Elite (温室里的特权阶级)
生活在人造穹顶、未受风霜侵蚀的幸运儿。
- 皮肉白嫩，举止天真。如果他们不小心流落到废土，要么立刻成为猎物，要么在残酷的洗礼下迅速黑化成长。

#### 5. Nomad Guide (游牧向导 / 变异者)
带领商队穿越危险区域的专家。可能因为常年暴露在外而发生了一些轻微变异（比如夜视眼、或者鳞片皮肤）。

---

### 极具废土色彩的属性 (Survival Skill & Appearance)

#### Survival Skill (生存特长)
- 忘掉魔法与异能，写最硬核的生存技能。
- 比如：主角极其擅长"用冷凝管和破雨伞制作露水收集器"；或者精通冷兵器与自制霰弹枪的维修。

#### Physical Appearance & Gear (外貌与装备)
**这是废土美学的灵魂所在**。
- 不要写"穿着华丽的长袍"。要写："左脸有严重的重度酸雨烧伤痕迹，穿着由旧轮胎和凯夫拉防弹衣缝合起来的拼凑护甲。脸上永远挂着一个防风沙的生锈护目镜。"
- 他们携带的装备就是他们的命。

### Current Status / Location

- 动态状态应该反映他们的饥饿度、健康值或势力状况。
- "Current Status: 严重脱水中，最后的滤水器芯已经损坏，生命体征微弱。"
- "Current Location: 正在穿越被强行抽干了的旧金山湾底部的盐沙荒漠。"',
  '## "Character" Generation — Cli-Fi / Wasteland

In extreme environments, characters are not judged by "beauty," but by their "survival value." Their physical scars and the gear they carry are their living resume of how they survived this hellish world.

---

### Character Roles and Narrative Functions

#### 1. Warlord/Resource Baron
The dictator who monopolizes the resources crucial for life (water, power, gas masks).
- **Characteristics**: They might not be the strongest fighters physically, but they are utterly ruthless and control the valves. To maintain fear, they leave those executed for stealing water hanging out in the scorching sun. They are the primary targets for the protagonist''s rebellion.

#### 2. Protagonist/Scavenger
- Usually a marginalized drifter. Survives on sheer grit, extreme jury-rigging skills, or memorized maps of the old world. A cold exterior often hides deep trauma.

#### 3. Old-World Scholar/Archivist
The brain of the party, or the liability.
- Often an old person suffering from radiation sickness, stubbornly guarding a few physical books or a dead server. They are the only ones who know how to restart a "nuclear reactor" or the true coordinates of "Eden."

#### 4. Sheltered Elite
The lucky few living in artificial eco-domes, untouched by the wasteland storms.
- Soft skin, naive demeanor. If they accidentally fall into the wasteland, they either immediately become prey or undergo a rapid, brutal, and dark character development arc.

#### 5. Nomad Guide
Experts who lead caravans through lethal hazard zones. May have slight mutations due to long-term exposure (e.g., capable of seeing in the dark, or having scaled, sun-resistant skin).

---

### Wasteland Aesthetics (Survival Skill & Appearance)

#### Survival Skill
- Forget magic; write hardcore survival mechanics.
- For example: Extremely adept at "jury-rigging dew collectors out of condenser pipes and broken umbrellas"; or a master of maintaining crude melee weapons and jam-prone pipe shotguns.

#### Physical Appearance & Gear
**This is the very soul of wasteland aesthetics**.
- Do not write "wearing elegant robes." Write: "Severe acid rain burn scars on the left side of their face, wearing patchwork armor stitched together from old rubber tires and torn Kevlar. Always wearing rusted, dust-proof goggles over their eyes."
- Their gear is literally their life.

### Current Status / Location

- Dynamic status should reflect their hunger, health, or political standing.
- "Current Status: Severely dehydrated, the last filter cartridge has cracked, vital signs weakening."
- "Current Location: Trekking across the salt-flats that used to be the bottom of the drained San Francisco Bay."',
  (SELECT id FROM novel_creation_method WHERE name = 'Cli-Fi / Climate Fiction Novel' LIMIT 1),
  1,
  21,
  NOW()
)
ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);
