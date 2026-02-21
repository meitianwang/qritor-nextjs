-- 异世界玄幻穿越小说「修炼体系」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '异世界玄幻穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-xuanhuan-crossing-cultivation-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xuanhuan-crossing-cultivation-setting-gen',
  '「修炼体系」设定生成：为异世界玄幻穿越小说生成修炼体系设定，包括力量体系类型、境界划分、修炼资源、功法/职业分支、能力上限与代价、禁忌与风险、代表性能力',
  '"Cultivation System" setting generation: generate cultivation system settings for isekai xuanhuan crossing novels, including power system type, realm division, cultivation resources, technique branches, power ceilings and costs, taboos and risks, representative abilities',
  '## 「修炼体系」设定生成 — 异世界玄幻穿越小说

修炼体系是玄幻穿越小说的灵魂。它定义了这个世界「力量如何运作」，也决定了主角的升级路径。修炼体系是**最重要的设定类型**——所有其他设定（世界观、角色、组织）都围绕修炼体系展开。

---

### 字段生成指南

#### 力量体系类型

定义世界力量运作的核心模式。选项及特点：

| 类型 | 特点 | 适合风格 | 经典元素 |
|------|------|---------|---------|
| **修真** | 以灵气/真气修炼为核心 | 东方仙侠混搭 | 炼丹、炼器、阵法、符箓 |
| **魔法** | 元素/咒语/魔力体系 | 西方奇幻混搭 | 魔法学院、元素亲和、魔杖 |
| **斗气** | 体魄+气的战斗体系 | 近战格斗为主 | 斗技、斗铠、斗气化翼 |
| **异能** | 超自然能力，个体差异大 | 多样化能力对战 | 觉醒、变异、异能等级 |
| **混合** | 多种体系并存 | 复杂世界观 | 不同种族用不同体系 |

**设计建议**：
- 混合体系最灵活但最难写，需要明确不同体系之间的互动规则和强弱对比
- 纯体系更容易维持一致性
- 力量体系类型应与世界观的种族格局相配合（如妖族用血脉体系、人族用修真体系）

#### 境界划分

修炼体系的骨架，也是全书升级节奏的框架。

**设计原则**：
1. 境界数量建议 7-12 个，太少缺乏层次感，太多容易混乱
2. 每个境界要有质变而非量变——不是单纯"更强"，而是"解锁新能力"
3. 境界名称要有玄幻韵味，体现力量本质的递进
4. 每个境界内部可以分小阶（初期/中期/后期/巅峰）

**经典境界设计参考**：
```
凡人境（引气/锻体/开脉）→ 凝气境 → 筑基境 → 金丹境 →
元婴境 → 化神境 → 合体境 → 渡劫境 → 仙人境
```

**境界与叙事的对应关系**（极其重要）：

| 境界层级 | 对应叙事阶段 | 活动范围 | 冲突规模 | 章节占比建议 |
|---------|------------|---------|---------|------------|
| 低阶（1-3） | 新手村/起步 | 小城镇/宗门 | 个人恩怨 | 20-30% |
| 中阶（4-6） | 中段崛起 | 王国/大陆 | 势力争斗 | 30-40% |
| 高阶（7-9） | 大陆争锋 | 大陆/位面 | 种族大战 | 20-25% |
| 巅峰（10+） | 最终决战 | 多界域/宇宙 | 终极威胁 | 10-15% |

**关键规则**：
- 每个境界至少要有 1-2 个完整的故事弧
- 突破前要有足够的铺垫（瓶颈、积累、机缘）
- 境界越高，突破间隔应越长
- 利用"境界巩固"概念控制升级节奏

#### 修炼资源

定义角色变强所需的"货币"，也是冲突的最大来源之一：

| 资源类型 | 功能 | 剧情作用 |
|---------|------|---------|
| **灵石/魔晶** | 通用修炼资源，经济流通货币 | 经济冲突、贫富差距 |
| **天材地宝** | 稀有修炼材料，用于突破瓶颈 | 争夺战、秘境探索 |
| **丹药** | 辅助修炼、疗伤、提升实力 | 炼丹竞赛、丹药交易 |
| **秘境/遗迹** | 获取资源和机缘的特殊地点 | 秘境副本、遗迹探险 |
| **功法典籍** | 修炼方法本身也是珍贵资源 | 传承争夺、功法升级 |

**设计建议**：资源是冲突的最大来源——为争夺资源引发的冲突是最自然的剧情驱动器。资源稀缺度应随境界提升而增加。

#### 功法/职业分支

定义不同修炼者的差异化路径，为角色创造独特性：

**战斗型**：
- 剑修：以剑为核心，剑意、剑阵
- 体修：锤炼肉身，近战无敌
- 法修：远程法术攻击，威力巨大
- 召唤师：召唤灵兽/傀儡助战

**辅助型**：
- 炼丹师：制造丹药，社交和经济地位高
- 炼器师：锻造法器法宝
- 阵法师：布置阵法，攻防兼备
- 符箓师：制作符箓，灵活多变

**特殊型**：
- 兽师：契约灵兽，人兽合战
- 傀儡师：操控傀儡作战
- 毒师：以毒攻击，防不胜防

**设计要点**：
1. 主角的修炼路径要与金手指匹配
2. 不同分支之间要有互补性，为组队/对抗创造策略空间
3. 辅助型职业的地位不能太低，它们是社交和经济系统的基础
4. 可以设计"禁忌路线"——修炼代价大但威力更强的分支

#### 能力上限与代价

每个境界能做什么、不能做什么，要有清晰边界：

**能力上限示例**：
- 低阶修士不能飞行
- 金丹以下不能使用某些禁术
- 只有渡劫期以上才能撕裂空间
- 每个境界的攻击力/防御力/感知范围有明确上限

**代价设计**——力量不应是免费的：
- 过度修炼的反噬（气血亏损、寿命缩短）
- 使用禁术的代价（折寿、伤根基、走火入魔）
- 突破失败的后果（境界跌落、经脉损伤、甚至身死）
- 越阶战斗的透支代价

**设计原则**：
- 能力上限是防止战力崩坏的关键——同境界内的实力差距应有上限
- 跨境界战斗最多越一到两阶，且需要合理理由（金手指/特殊功法）
- 代价是故事张力的来源——免费的力量没有戏剧性

#### 禁忌与风险

定义修炼之路上的"红线"，增加修炼的危险感：

| 禁忌类型 | 描述 | 叙事作用 |
|---------|------|---------|
| **走火入魔** | 修炼出错的后果 | 增加修炼的紧张感 |
| **心魔** | 心理层面的修炼障碍 | 为角色内心戏提供空间 |
| **天劫** | 突破大境界时的天道考验 | 突破场景的戏剧性 |
| **禁术** | 威力巨大但代价惨重的能力 | 绝境翻盘的底牌 |

**设计建议**：
- 走火入魔不应只是"修炼失败"，而是有具体的症状和后果
- 心魔可以与主角的前世记忆/穿越经历关联
- 天劫应随境界提升难度递增，是展示主角实力的舞台
- 禁术是"杀敌一千自损八百"的选择——什么时候用、代价是什么

#### 代表性能力

每个境界/分支的标志性能力展示，让读者对境界差异有直观感受：

**设计方向**：
- 每个境界应有 1-2 个标志性能力（如金丹期的领域雏形、元婴期的分身术）
- 不同功法分支的招牌技能应有明确差异
- 能力展示是打脸和震惊的最佳载体——"他竟然在筑基期就能做到这种事！"

示例设计框架：
```
引气期：感应灵气、基础术法
筑基期：飞行、灵力外放
金丹期：领域雏形、法相
元婴期：分身、神识攻击
化神期：规则感悟、领域成型
```

---

### 设计原则总结

1. **严格一致性**：境界划分和能力边界在全书中必须前后一致
2. **质变而非量变**：每次突破应解锁新能力，而非单纯变强
3. **资源驱动冲突**：修炼资源的稀缺性是冲突的最大来源
4. **与金手指配合**：修炼体系的"正常路径"要足够难，才能突出金手指的价值
5. **预防战力崩坏**：跨境界战斗有明确上限，代价机制要严格执行',
  '## "Cultivation System" Setting Generation — Isekai Xuanhuan Crossing Novel

The cultivation system is the soul of a xuanhuan crossing novel. It defines how power works and determines the protagonist''s leveling path. This is the **most important setting type** -- all others revolve around it.

---

### Field Generation Guide

#### Power System Type
Options: Cultivation/修真 (spirit energy, pills, artifacts) / Magic/魔法 (elemental, mana) / Battle Aura/斗气 (physical combat) / Special Abilities/异能 (supernatural, high variation) / Hybrid/混合 (multiple coexisting). Hybrid is most flexible but hardest to maintain consistency. Should align with racial landscape.

#### Realm Division
The skeleton of the system. Recommend 7-12 realms. Each realm must represent a qualitative change (new abilities unlocked), not just "stronger." Classic reference: Mortal -> Qi Condensation -> Foundation Building -> Golden Core -> Nascent Soul -> Spirit Transformation -> Fusion -> Tribulation -> Immortal. Realm-to-narrative correspondence: Low (1-3) = starter zone, personal grudges / Mid (4-6) = kingdom, faction warfare / High (7-9) = continent, racial wars / Peak (10+) = multi-realm, ultimate threat.

#### Cultivation Resources
Define the "currency" for growing stronger: Spirit stones (universal currency), rare natural treasures (bottleneck-breaking), pills (consumables), secret realms (resource locations), technique manuals. Resource scarcity drives conflicts naturally.

#### Techniques / Class Branches
Combat types (sword/body/spell cultivator, summoner), Support types (alchemist, artifact refiner, formation master, talisman crafter), Special types (beast tamer, puppet master, poison master). Protagonist path must match cheat ability. Different branches should complement each other.

#### Power Ceiling and Costs
Clear boundaries per realm. Low-realm cannot fly; below Golden Core cannot use forbidden techniques. Costs: cultivation backlash, forbidden technique costs (shortened lifespan, damaged foundation), breakthrough failure consequences. Costs create story tension.

#### Taboos and Risks
Red lines on the cultivation path: Qi deviation (cultivation errors), inner demons (psychological obstacles), heavenly tribulation (Dao tests at major breakthroughs), forbidden techniques (high power, terrible cost). Each adds tension and dramatic potential.

#### Representative Abilities
Iconic abilities per realm/branch for readers to intuitively grasp realm differences. Each realm should have 1-2 signature abilities. Ability showcases are prime face-slapping and shock moments.',
  (SELECT id FROM novel_creation_method WHERE name = '异世界玄幻穿越小说' LIMIT 1),
  1,
  31,
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
