-- 异世界修真穿越小说「金手指」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '异世界修真穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-xiuzhen-crossing-golden-finger-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xiuzhen-crossing-golden-finger-setting-gen',
  '「金手指」设定生成：为异世界修真穿越小说生成金手指设定，包括金手指类型、能力描述、使用限制、成长空间、获得方式',
  '"Golden Finger" setting generation: generate cheat ability settings for isekai cultivation crossing novels, including type, ability description, usage limitations, growth potential, acquisition method',
  '## 「金手指」设定生成 — 异世界修真穿越小说

「金手指」定义穿越者在修真世界的核心优势。修真穿越的金手指设计与通用穿越不同：它必须嵌入修真世界的修炼逻辑中——与境界突破、灵气运用、丹药法宝等体系紧密关联。**没有限制的金手指会毁掉修真文的修炼张力**。

---

### 字段生成指南

#### 金手指类型

选项：系统 / 神器 / 天赋 / 血脉 / 灵宠 / 外挂记忆 / 科技道具 / 其他

| 类型 | 说明 | 适合主线 |
|------|------|---------|
| **系统** | 任务奖励型辅助系统 | 各类，尤其升级爽文。提供明确的任务—奖励反馈循环 |
| **神器** | 上古神器/仙器认主 | 战斗流、寻宝流。法宝本身可成长，与主角共同进化 |
| **天赋** | 变异灵根、特殊体质 | 修炼流。直接提升修炼速度或赋予独特能力 |
| **血脉** | 上古神兽/仙人血脉觉醒 | 热血战斗流。阶段性觉醒提供持续爽感 |
| **灵宠** | 上古灵兽陪伴成长 | 轻松冒险流。人宠互动增加故事趣味 |
| **外挂记忆** | 上古大能的传承记忆 | 知识流、底蕴流。提供功法、丹方、阵法等珍贵知识 |
| **科技道具** | 现代科技在修真世界的应用 | 创新流、种田流。用科技思维解决修真问题 |
| **其他** | 时间加速空间、丹药鉴定、灵植培育等 | 自由发挥 |

选择时应考虑与穿越身份、核心目标的匹配度。例如废材弟子 + 系统金手指 = 经典逆袭配置。

#### 能力描述

金手指的具体能力必须详细化。不是「主角很强」，而是「可以做什么、不能做什么」。不同类型的具体化要求：

**系统类**：
- 什么任务类型？（修炼任务、战斗任务、探索任务、日常任务）
- 奖励机制？（积分兑换、直接奖励、随机奖励）
- 积分兑换表？（功法、丹药、法宝、属性点各需多少积分）
- 有无商城？商城物品的品质与主角修为挂钩吗？

**神器类**：
- 什么等级？（仙器残片、完整仙器、神器碎片）
- 有哪些能力？（储物空间、攻击能力、辅助修炼、炼丹炼器辅助）
- 如何与修为联动？（修为越高可催动的能力越多）
- 器灵是否存在？器灵的性格和与主角的互动关系

**天赋类**：
- 变异灵根具体是什么属性？（雷灵根、冰灵根、木灵根变异、混沌灵根）
- 提升修炼速度几倍？（需要具体数字：3倍/5倍/10倍）
- 赋予什么独特能力？（雷灵根可引雷入体、冰灵根天生冰系法术亲和）

**血脉类**：
- 什么血脉？（龙族血脉、凤凰血脉、麒麟血脉、上古神兽血脉）
- 觉醒条件？（修为突破时触发、生死危机激活、特殊机缘开启）
- 阶段性能力？（初期：体质强化；中期：血脉神通；后期：半化形/完全化形）

#### 使用限制

**限制是金手指设计的灵魂**。没有限制 = 没有张力 = 读者失去兴趣：

- **系统类**：任务冷却时间（完成一个任务后需等待恢复）、积分不足（高级兑换需要大量积分）、特定条件触发（某些任务只在特定场景出现）、惩罚机制（任务失败扣除积分或降低属性）
- **神器类**：修为不够无法催动全部能力（练气期只能用储物功能，筑基才能用攻击能力）、需要特殊材料修复（残缺神器需要寻找材料修复升级）、使用消耗灵力巨大（强力能力使用后需长时间恢复）
- **天赋类**：初期不稳定（变异灵根初期会失控暴走）、需要特殊功法配合才能发挥（普通功法无法驾驭变异灵根）、有副作用（修炼速度快但丹毒积累也快）
- **血脉类**：觉醒需要特定条件（生死关头/特殊丹药/血脉共鸣）、暴走风险（血脉力量失控会伤敌一千自损八百）、觉醒后有排异期（需要时间消化血脉力量）

#### 成长空间

金手指应随修为提升而成长，与修真境界体系对齐：

| 境界阶段 | 金手指状态 | 叙事效果 |
|---------|----------|---------|
| 练气期 | 基础辅助功能 | 初步展示金手指的存在和价值 |
| 筑基期 | 解锁新能力 | 给读者「还有更多」的期待感 |
| 金丹期 | 质变升级 | 与修为突破同步的爽感高潮 |
| 元婴期 | 核心能力完整展现 | 金手指进入成熟期 |
| 后期 | 终极形态/与主角融为一体 | 收束金手指叙事线 |

成长曲线要点：
- 每次金手指升级都应伴随一个叙事节点（突破/机缘/危机）
- 避免线性增长——应该有质变节点而非简单量变
- 后期金手指的重要性应逐渐让位于主角自身修为——最终主角的实力不能完全依赖金手指

#### 获得方式

金手指的来源决定了它在叙事中的定位：

| 获得方式 | 特点 | 叙事效果 |
|---------|------|---------|
| 穿越时自带 | 灵魂融合时获得，最简洁 | 快速进入故事，减少铺垫成本 |
| 穿越后机缘获得 | 秘境中得到、被长辈赠予、意外发现 | 可以设计为重要剧情节点 |
| 逐步觉醒 | 随修为提升慢慢显现 | 保持神秘感，持续制造悬念 |

- 穿越自带是最常见的方式，适合快节奏开局
- 机缘获得可以作为前几章的核心剧情（如第一次进入秘境时获得）
- 逐步觉醒适合慢热型故事，金手指本身的来历可以是长线悬念',
  '## "Golden Finger" Setting Generation — Isekai Cultivation Crossing Novel

The "Golden Finger" defines the crosser''s core advantage in the xiuzhen world. Xiuzhen crossing cheat ability design differs from generic crossing: it must embed within the xiuzhen cultivation logic -- tightly linked to realm breakthroughs, spiritual energy usage, pills, and artifacts. **A cheat ability without limitations destroys the cultivation tension of xiuzhen fiction**.

---

### Field Generation Guide

#### Type

Options: System / Divine Artifact / Innate Talent / Bloodline / Spirit Companion / Legacy Memories / Technological Items / Other

| Type | Description | Suitable Plot |
|------|-------------|---------------|
| **System** | Quest-reward assistance system | Any, especially power-fantasy. Provides clear task-reward feedback loops |
| **Divine Artifact** | Ancient divine/immortal artifact chooses its master | Combat, treasure-hunting. The artifact itself can grow alongside the protagonist |
| **Innate Talent** | Variant spirit root, special physique | Cultivation-focused. Directly boosts cultivation speed or grants unique abilities |
| **Bloodline** | Ancient divine beast or immortal bloodline awakening | Hot-blooded combat. Staged awakening provides sustained satisfaction |
| **Spirit Companion** | Ancient spirit beast grows alongside protagonist | Light adventure. Human-pet interactions add fun |
| **Legacy Memories** | Inherited memories from an ancient powerhouse | Knowledge-based, depth-based. Provides precious knowledge of techniques, pill recipes, formations |
| **Technological Items** | Modern technology applied in the xiuzhen world | Innovation, farming-focused. Using tech thinking to solve cultivation problems |
| **Other** | Time-acceleration spaces, pill appraisal, spirit plant cultivation, etc. | Flexible |

Consider compatibility with crossing identity and core goal. E.g., trash disciple + system cheat = classic underdog configuration.

#### Ability Description

Cheat abilities must be detailed. Not "protagonist is strong" but "can do X, cannot do Y." Specificity requirements by type:

**System type**:
- What mission types? (Cultivation, combat, exploration, daily missions)
- Reward mechanism? (Points exchange, direct rewards, random rewards)
- Points exchange table? (How many points for techniques, pills, artifacts, attribute points?)
- Is there a shop? Does shop item quality scale with protagonist''s cultivation?

**Artifact type**:
- What grade? (Immortal artifact fragment, complete immortal artifact, divine artifact shard)
- What abilities? (Storage space, attack capability, cultivation assistance, alchemy/forging assistance)
- How does it link to cultivation? (Higher cultivation unlocks more abilities)
- Does a weapon spirit exist? The spirit''s personality and interaction with the protagonist

**Talent type**:
- What specific attribute does the variant spirit root have? (Lightning, ice, wood variant, chaos)
- By how much does it increase cultivation speed? (Need specific numbers: 3x/5x/10x)
- What unique abilities does it grant? (Lightning root can draw lightning into the body; ice root has innate ice spell affinity)

**Bloodline type**:
- What bloodline? (Dragon, phoenix, qilin, ancient divine beast)
- Awakening conditions? (Triggered during realm breakthroughs, activated by life-death crises, opened by special fortune)
- Staged abilities? (Early: physique enhancement; Mid: bloodline divine abilities; Late: partial/full transformation)

#### Usage Limitations

**Limitations are the soul of cheat ability design**. No limitations = no tension = readers lose interest:

- **System type**: Mission cooldowns (wait period after completing a mission), insufficient points (high-tier exchanges need large amounts), specific trigger conditions (some missions only appear in certain scenarios), punishment mechanics (failed missions deduct points or reduce attributes)
- **Artifact type**: Insufficient cultivation to activate full abilities (Qi Refining can only use storage; Foundation Building unlocks attack), requires special materials for repair (damaged artifact needs materials to restore and upgrade), massive spiritual energy consumption (powerful abilities require long recovery)
- **Talent type**: Initially unstable (variant spirit root can go berserk early on), requires specific techniques to fully manifest (ordinary techniques cannot harness variant roots), has side effects (fast cultivation speed but faster pill toxin accumulation)
- **Bloodline type**: Awakening requires specific conditions (life-death crisis/special pills/bloodline resonance), berserk risk (losing control hurts the user as much as the enemy), post-awakening rejection period (needs time to digest bloodline power)

#### Growth Potential

Cheat abilities should grow alongside cultivation level, aligned with the xiuzhen realm system:

| Realm Stage | Cheat Ability State | Narrative Effect |
|-------------|-------------------|-----------------|
| Qi Refining | Basic assistance functions | Initial showcase of the cheat ability''s existence and value |
| Foundation Building | New abilities unlocked | Creates "there''s more to come" anticipation |
| Golden Core | Qualitative upgrade | Satisfaction peak synchronized with realm breakthrough |
| Nascent Soul | Core abilities fully realized | Cheat ability enters maturity |
| Late stages | Ultimate form / merges with protagonist | Concludes the cheat ability narrative thread |

Growth curve key points:
- Each cheat ability upgrade should accompany a narrative node (breakthrough/fortune/crisis)
- Avoid linear growth -- should have qualitative leap points rather than simple quantitative increase
- Late-stage cheat ability importance should gradually yield to the protagonist''s own cultivation -- ultimate strength cannot depend entirely on the cheat ability

#### Acquisition Method

The cheat ability''s origin determines its narrative positioning:

| Method | Features | Narrative Effect |
|--------|----------|-----------------|
| Built-in at crossing | Acquired during soul fusion; most concise | Quick story entry, reduces setup cost |
| Fortune after crossing | Found in secret realm, bestowed by elder, accidental discovery | Can be designed as a major plot node |
| Gradual awakening | Slowly manifesting as cultivation improves | Maintains mystery, continuously creates suspense |

- Built-in is the most common method, suited for fast-paced openings
- Fortune-based acquisition can serve as core plot for the first few chapters (e.g., obtained during first secret realm entry)
- Gradual awakening suits slow-burn stories; the cheat ability''s origin can be a long-running mystery',
  (SELECT id FROM novel_creation_method WHERE name = '异世界修真穿越小说' LIMIT 1),
  1,
  43,
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
