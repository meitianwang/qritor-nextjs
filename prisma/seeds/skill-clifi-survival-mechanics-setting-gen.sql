-- Cli-Fi / Climate Fiction Novel「Survival Mechanics」生成技能
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'clifi-survival-mechanics-setting-gen',
  '生成「Survival Mechanics」：为气候幻想小说设计极端气候限制、生存物资和变异情况',
  'Generate "Survival Mechanics": Design global climate constraints, ultimate scarcity, and mutations for Cli-Fi fiction',
  '## 「Survival Mechanics (生存与气候机制)」生成 — 气候幻想 (Cli-Fi)

这是替代传统魔法/异能体系的核心模块。气候和资源的设定直接决定了主角每一天的吃穿住行和战斗方式。

### 字段生成指南

#### Primary Threat (主要气候威胁)
- 挑选一个被推向极端的全球性灾难。
- **Global Submersion (水世界)**：冰川融化，陆地只剩几座高山，主要交通工具是船只和潜水器。
- **Desertification (焦土废土)**：持续五十年的大旱，海洋干涸，太阳辐射致命。
- **Ice Age (深度极寒)**：全球气温降至零下80度，人类只能住在地热井旁。

#### Ultimate Scarcity (终极稀缺资源)
- 这是世界运转的金钱，也是引发所有流血冲突的原因。
- 比如：未被核污染的泥土（用于种植）、压缩氧气罐（因为大气层充满有毒二氧化硫）、旧时代的电池、或者是淡水。

#### Technology Level (科技断层水平)
- 文明崩塌后的科技残骸是怎样的？
- 可以是"拼凑的废铜烂铁（如利用太阳能板驱动的破烂机甲）"，或者是"高度两极分化"（平民用冷兵器狩猎，寡头坐在浮空城里拥有基因编辑技术）。

#### Human/Biological Adaptations (人类/生物适应与变异)
- 自然界和人类为了生存发生的进化。
- 比如：人类为了在毒气中生存，肺部变成了黑色的过滤器；或者海洋中进化出了能生吞潜艇的巨型变异虾；植物学会了在极寒中发热从而被当作燃料。',
  '## "Survival Mechanics" Generation — Cli-Fi

This is the core module replacing traditional magic/power systems. The climate and resource settings directly dictate the protagonist''s daily life, clothing, shelter, and combat methods.

### Field Generation Guide

#### Primary Threat (The Climate Constraint)
- Pick a global disaster pushed to its absolute extreme.
- **Global Submersion (Water World)**: Glaciers melted, land is just a few mountain peaks, primary transport involves boats and submersibles.
- **Desertification (Wasteland)**: A 50-year drought, dead oceans, blinding fatal solar radiation.
- **Ice Age (Deep Freeze)**: Global temperatures dropped to -80°C, forcing humanity to huddle around geothermal vents.

#### Ultimate Scarcity
- This is the currency of the world and the cause of all bloodshed.
- For example: Uncontaminated soil (for growing food), compressed oxygen tanks (because the atmosphere is choked with sulfur dioxide), old-world batteries, or simply fresh water.

#### Technology Level
- What does the technological wreckage look like post-collapse?
- Could be "cobbled together scavenged junk" (like rusted mechs powered by dying solar panels), or "highly polarized" (civilians hunt with crude spears while oligarchs live in floating cities with gene-editing tech).

#### Human/Biological Adaptations
- Evolution by nature and humans to stay alive.
- For example: To survive toxic gas, human lungs adapted into black biological filters; the ocean evolved giant mutated crustaceans that hunt submersibles; or plants learned to generate extreme heat in the Ice Age, now harvested as fuel.',
  (SELECT id FROM novel_creation_method WHERE name = 'Cli-Fi / Climate Fiction Novel' LIMIT 1),
  1,
  3,
  NOW()
)
ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);
