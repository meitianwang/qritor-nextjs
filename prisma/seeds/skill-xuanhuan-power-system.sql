-- 异世界玄幻穿越小说专属 Skill：玄幻力量体系与升级节奏
-- Isekai Xuanhuan Crossing creation method Skill: Xuanhuan Power System and Leveling Pacing
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '异世界玄幻穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-xuanhuan-power-system.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xuanhuan-power-system',
  '玄幻力量体系与升级节奏：修炼体系设计方法论、战力一致性维护、升级节奏把控、种族与势力战力层级、爽点设计、能力上限与代价系统、工具使用指南',
  'Xuanhuan power system and leveling pacing: cultivation system design methodology, power consistency maintenance, leveling pace control, racial and faction power tiers, satisfaction point design, ability ceiling and cost system, tool usage guide',
  '## 玄幻力量体系与升级节奏

本技能专注于「异世界玄幻穿越小说」中最核心的系统设计：修炼体系的构建与维护、战力一致性的保障、升级节奏的把控。力量体系是玄幻穿越小说的骨架——骨架立不住，故事就会崩塌。

---

### 一、修炼体系设计方法论

#### 1.1 力量体系类型选择

「修炼体系」设定中的「力量体系类型」字段决定了整个世界的力量底层逻辑。每种类型对后续设计有深远影响：

| 类型 | 境界设计倾向 | 资源体系特征 | 战斗风格 |
|------|------------|------------|---------|
| **修真** | 以「道」为核心递进，境界名称偏仙侠 | 灵石、丹药、灵草 | 法术对轰、法宝碰撞 |
| **魔法** | 以「元素/魔力等级」递进 | 魔晶、魔法材料 | 元素克制、咒语对抗 |
| **斗气** | 以「体魄/斗气等级」递进 | 斗气果实、武技传承 | 近身格斗、招式碰撞 |
| **异能** | 以「异能觉醒层次」递进 | 觉醒石、异能药剂 | 能力克制、创意组合 |
| **混合体系** | 多条路径并存，需明确互动规则 | 多种资源并行 | 跨体系碰撞 |

**选择建议**：
- 修真和斗气适合偏传统的升级爽文，境界感最强
- 魔法适合走元素克制和策略战斗的路线
- 异能适合强调个体差异和能力创意的故事
- 混合体系自由度最高但维护难度也最大——必须明确规定不同体系之间的强弱对比规则，否则战力必然崩盘

#### 1.2 境界划分设计原则

「境界划分」是修炼体系的骨架。设计好坏直接决定升级体验的质量。

**核心原则**：

1. **数量适中**：8-12 个大境界是最佳区间
   - 少于 7 个：层次感不足，升级太快
   - 多于 15 个：读者记不住，境界名沦为数字
   - 推荐结构：3 个低阶 + 3 个中阶 + 3 个高阶 + 1-3 个巅峰

2. **质变而非量变**：每个境界必须解锁新的质变能力
   - 错误示范：「从战士一级到战士十级，就是力量从100到1000」
   - 正确示范：「突破到灵海境，可以外放灵力形成护体罡气；突破到天象境，能引动天地元气形成领域」
   - 每个境界的标志性能力要写入「代表性能力」字段

3. **小阶细分**：大境界内部设置小阶
   - 常用方案：初期 / 中期 / 后期 / 巅峰（四小阶）
   - 替代方案：一到九层（九小阶，适合快节奏升级）
   - 小阶存在的意义是提供「微突破」的爽感，避免大境界之间的空白期过长

4. **命名有讲究**：境界名称要体现力量本质的递进
   - 修真风格：练气 → 筑基 → 金丹 → 元婴 → 化神（每个名字暗示修炼本质的变化）
   - 斗气风格：斗者 → 斗师 → 大斗师 → 斗灵 → 斗王 → 斗皇 → 斗宗 → 斗尊 → 斗圣 → 斗帝
   - 通用风格：凝气 → 灵动 → 灵海 → 天象 → 法相 → 归一 → 圣阶 → 神阶

**不同力量体系类型的境界设计参考**：

修真类：
```
练气期(1-12层) → 筑基期 → 金丹期 → 元婴期 → 化神期 → 合体期 → 渡劫期 → 仙人
```

斗气类：
```
斗者 → 斗师 → 大斗师 → 斗灵 → 斗王 → 斗皇 → 斗宗 → 斗尊 → 斗圣 → 斗帝
```

魔法类：
```
魔法学徒 → 初级魔法师 → 中级魔法师 → 高级魔法师 → 大魔法师 → 魔导师 → 大魔导师 → 圣魔导师 → 法神
```

混合体系：
```
凡境（引气/锻体/开脉）→ 灵动境 → 灵海境 → 天象境 → 法相境 → 归一境 → 圣阶 → 神阶
```

#### 1.3 修炼资源层级设计

「修炼资源」字段应建立完整的资源金字塔，与境界体系严格对应：

| 资源层级 | 典型名称 | 对应境界范围 | 获取难度 |
|---------|---------|------------|---------|
| **基础资源** | 灵石/魔晶/斗气石 | 低阶（1-3 境界） | 普通任务可得 |
| **中级资源** | 天材地宝/灵药/中品灵石 | 中阶（4-6 境界） | 需进入秘境或击杀强敌 |
| **高级资源** | 道果/仙石/圣级材料 | 高阶（7-9 境界） | 罕见机缘或大势力储备 |
| **极品资源** | 天道精华/创世之物/神级材料 | 巅峰（10+ 境界） | 传说级别，可能引发大战 |

**设计要点**：
- 每一级资源的稀缺度要递增 10-100 倍
- 低级资源在高阶修炼者眼中如同废物——这是体现境界差距的好方式
- 资源争夺是玄幻世界最自然的冲突驱动器，每个大弧线的冲突根源都应与资源挂钩

#### 1.4 功法/职业分支作为专精系统

「功法/职业分支」字段定义了修炼者的差异化路径，是避免「所有角色都靠硬刚」的关键：

**战斗型分支**：
- 剑修/刀修：近战爆发型
- 法修：远程法术轰炸型
- 体修：肉身碾压型
- 召唤师：灵兽/傀儡战斗型

**辅助型分支**：
- 炼丹师：丹药制作，经济地位极高
- 炼器师：法宝打造，战力间接提升
- 阵法师：攻防辅助，适合团队作战

**特殊型分支**：
- 兽师：驯服灵兽，适合灵宠类金手指
- 毒师：非正统路线，适合诡秘基调
- 魂修：精神攻击路线

**设计规则**：
1. 主角的分支必须与金手指匹配——系统类金手指适合全能型，天赋类适合单一极致型
2. 辅助型分支在社会地位上不能低于战斗型——炼丹师被各大势力争抢是经典设定
3. 不同分支的战斗方式要有本质区别，为战斗场面提供多样性

---

### 二、战力一致性维护

战力崩盘是玄幻小说最常见的致命问题。本节提供系统性的解决方案。

#### 2.1 战力崩盘的本质

**问题描述**：主角在第 20 章越三阶击败强敌，到第 80 章却被同阶对手逼入绝境。读者的疑问：「之前不是很轻松吗？怎么现在这么弱？」

**根本原因**：
- 没有预先定义每个境界的能力边界
- 越阶战斗的条件不明确，随意使用
- 对手实力随剧情需要随意调整
- 忽略了金手指效果应随对手变强而相对减弱

#### 2.2 战力标尺系统

为每个境界建立明确的「战力标尺」，写入「境界划分」和「代表性能力」字段：

| 境界 | 破坏力标尺 | 速度标尺 | 感知标尺 |
|------|----------|---------|---------|
| 低阶（1-3） | 劈碎巨石 → 摧毁房屋 → 削平山丘 | 常人数倍 → 音速 → 超音速 | 百米 → 千米 → 数十里 |
| 中阶（4-6） | 夷平城镇 → 劈开山脉 → 改变地貌 | 瞬移短距 → 瞬移长距 | 百里 → 千里 |
| 高阶（7-9） | 毁灭一座城 → 撕裂空间 → 粉碎大陆碎片 | 空间跳跃 → 跨域飞行 | 跨域感知 |
| 巅峰（10+） | 摧毁大陆 → 毁灭位面 | 意念即至 | 全域感知 |

**使用方式**：每次写战斗场景前，先查阅标尺，确认当前境界角色的行为不超出边界。

#### 2.3 越阶战斗规则

越阶战斗是玄幻的核心爽点，但必须有严格规则：

**允许越阶的条件**（必须至少满足一项）：
- 金手指特殊能力（明确在「金手指」设定中的能力描述）
- 拥有远超当前境界的法宝/功法
- 地形/环境的极大优势
- 对手受伤/状态不佳
- 特殊的克制关系（元素克制、体系克制）

**越阶上限**：
- 普通天才：越一阶（小阶）是上限
- 拥有金手指的主角：越一个大境界是常态，越两阶是极限
- 越两阶以上：必须付出重大代价，不可重复使用

**越阶衰减规则**：
- 低阶时越阶相对容易（境界之间的差距绝对值较小）
- 中阶时越阶难度增加（每个境界的实质差距扩大）
- 高阶时几乎不可能越阶（一个境界的差距可能是天壤之别）

#### 2.4 传递性检验

如果角色 A 击败了角色 B，角色 B 击败了角色 C，那么角色 A 应该能够应对角色 C。

**执行方法**：
- 使用 `update_field_dynamic_info` 记录每个重要角色的当前境界
- 在知识图谱中记录重要战斗结果
- 每次安排新的战斗前，检查是否与已有战果矛盾
- 如果需要打破传递性（A赢B，B赢C，但C赢A），必须明确说明原因（属性克制、战斗条件差异等）

#### 2.5 金手指效果的相对衰减

金手指的绝对效果不变，但随着对手变强，其相对优势应逐渐缩小：

```
初期：金手指让主角实力翻倍 → 碾压同阶
中期：金手指提供30%优势 → 同阶强于大部分人但不再碾压
后期：金手指提供10%优势 → 需要与个人实力、战斗技巧配合才能取胜
```

这个衰减曲线要在「金手指」设定的「成长空间」字段中预先规划。

---

### 三、升级节奏把控

升级节奏是驾驭整部小说的缰绳——太快读者来不及沉浸，太慢读者失去耐心。

#### 3.1 三段式节奏模型

| 阶段 | 章节范围（参考） | 升级频率 | 节奏特征 |
|------|--------------|---------|---------|
| **前期** | 第 1-50 章 | 快速，每 5-10 章一次小突破 | 密集升级 + 金手指展示 + 建立世界观 |
| **中期** | 第 50-150 章 | 中速，每 15-25 章一次小突破 | 瓶颈出现 + 支线展开 + 关系深化 |
| **后期** | 第 150 章+ | 慢速，每 30-50 章一次大突破 | 每次突破都是里程碑 + 撼动世界格局 |

**前期（建立期）**：
- 快速升级建立「主角在变强」的读者预期
- 金手指在此阶段大放异彩，吸引读者
- 每次升级要伴随一个小爽点（打脸、获宝、展示新能力）
- 世界观信息穿插在升级过程中，避免大段设定灌输

**中期（深化期）**：
- 引入修炼瓶颈——不是每次闭关都能突破
- 瓶颈的突破需要特殊条件（秘境机缘、生死历练、领悟）
- 支线任务应服务于突破瓶颈（去秘境找突破资源、从战斗中领悟新能力）
- 角色关系在等待突破的间隙中发展

**后期（爆发期）**：
- 每次突破都应该是一个叙事高潮
- 突破本身就能引发连锁反应（天地异象、各方势力关注、敌人提前出手）
- 突破间隔长，但每次都让读者感觉值得等待
- 主角不再仅仅是变强，而是开始影响世界格局

#### 3.2 地图扩展技术

「地图扩展」是控制升级节奏的最强工具：

```
新境界突破 → 当前地图探索殆尽 → 进入新领域 → 发现新势力和新对手 → 需要继续变强
```

每次地图扩展时：
- 使用 `create_scene` 创建新区域的关键场景（城池、宗门、秘境等）
- 使用 `create_organization` 创建新领域的核心势力
- 使用 `create_character` 创建新领域的关键人物
- 新领域的整体实力层级要比前一区域高 1-2 个大境界

**地图扩展节奏参考**：
| 阶段 | 活动范围 | 对应境界 | 核心场景类型 |
|------|---------|---------|-----------|
| 起步 | 小城镇/低阶宗门 | 低阶 1-2 | 城池、宗门 |
| 展开 | 中等城市/中阶势力 | 低阶 3 - 中阶 1 | 城池、宗门、秘境 |
| 扩展 | 王国/大势力 | 中阶 2-4 | 秘境、遗迹、学院 |
| 跨域 | 大陆/多势力 | 中阶 5 - 高阶 | 荒野、异界裂缝 |
| 巅峰 | 多大陆/位面 | 高阶 - 巅峰 | 遗迹、副本 |

#### 3.3 避免战力通胀

战力通胀 = 每次升级都让之前的境界变得毫无价值。

**解决方案**：
1. **让升级有代价**：突破消耗珍贵资源、需要闭关时间、有失败风险
2. **让升级有故事**：每次突破都伴随一个完整的叙事弧线，而不仅仅是「吃了丹药就突破了」
3. **让低阶角色保持存在感**：低阶盟友可以通过辅助职业（炼丹、阵法、情报）继续发挥作用
4. **设计「境界巩固」阶段**：突破后需要时间巩固，不能连续突破

#### 3.4 秘境/遗迹/副本作为升级事件

「场景」Schema 中的秘境、遗迹、副本类型场景是最好的升级载体：

| 场景类型 | 升级功能 | 叙事功能 |
|---------|---------|---------|
| **秘境** | 获取稀有修炼资源 | 多人竞争、生死冒险 |
| **遗迹** | 获得传承功法或法宝 | 解密、探索、揭示历史 |
| **副本** | 系统化的挑战和奖励 | 关卡设计、层层递进 |

**使用方式**：每个大境界的突破前，安排一次秘境/遗迹/副本探险，作为获取突破资源的剧情事件。在创建场景时，使用 `create_scene` 并设置「场景类型」为秘境/遗迹/副本，在「特殊规则/禁制」中定义场景内的力量限制规则（例如：「秘境内压制高于金丹期的修为」）。

---

### 四、种族与势力的战力层级

#### 4.1 七大种族的力量特征

利用角色 Schema 中的「种族」字段，为不同种族建立差异化的力量特征：

| 种族 | 天生优势 | 天生劣势 | 修炼偏向 |
|------|---------|---------|---------|
| **人族** | 修炼路径多样，功法体系完善 | 个体天赋一般 | 全面型 |
| **妖族** | 天生体魄强大，血脉天赋 | 化形困难，功法稀缺 | 体修/血脉 |
| **魔族** | 天赋异禀，修炼速度快 | 被正道敌视，走火入魔风险高 | 魔功/异能 |
| **精灵** | 亲和自然，元素亲和力强 | 数量稀少，近战弱 | 法修/辅助 |
| **兽人** | 力量惊人，耐力超群 | 灵智较低，法术弱 | 体修 |
| **龙族** | 血脉高贵，个体极强 | 数量极稀，繁衍困难 | 血脉/全能 |
| **其他** | 根据设定自定义 | 根据设定自定义 | 自定义 |

**种族与战力设计的关系**：
- 同境界下，天生体魄强的种族（妖族、龙族）在近战中占优
- 人族的优势在于体系完善——功法多、法宝多、辅助多
- 种族之间的战力差异应该随着境界提升而缩小（高阶强者逐渐超越种族限制）
- 主角如果是人族，种族劣势应由金手指弥补

#### 4.2 九大组织类型的战力结构

利用「组织」Schema 中的「类型」和「地位与影响力」字段，建立势力的战力分层：

| 组织类型 | 典型战力天花板 | 成员规模 | 资源特征 |
|---------|-------------|---------|---------|
| **宗门** | 最高境界长老坐镇 | 数百到数万 | 功法传承完整 |
| **王国** | 国师/皇室护卫 | 军队为主 | 军事资源丰富 |
| **学院** | 院长级别 | 数百到数千 | 培养新人为主 |
| **佣兵团** | 团长级别 | 数十到数百 | 灵活机动 |
| **教会** | 教皇/大祭司 | 信徒众多 | 信仰之力 |
| **商会** | 雇佣强者护卫 | 商人+护卫 | 经济资源极丰 |
| **异族部落** | 族长/长老 | 数千到数万 | 种族天赋 |
| **魔族势力** | 魔主/魔将 | 数量不等 | 魔功/禁术 |
| **其他** | 自定义 | 自定义 | 自定义 |

#### 4.3 势力间的战力平衡设计

**三角平衡原则**：至少维持三方势力的动态平衡，避免一方独大导致冲突消失。

**阶梯对手设计**：
- 每个故事弧的对手来自比前一弧更强的势力
- 弧线 1：宗门内部竞争者（同辈弟子）
- 弧线 2：敌对小势力（佣兵团、小宗门）
- 弧线 3：同级大势力（大宗门、王国）
- 弧线 4：跨域超级势力（魔族势力、异族部落联盟）
- 弧线 5：终极势力（神秘组织、天道化身）

使用 `create_organization` 时，在「地位与影响力」字段中明确标注势力在当前世界格局中的战力排名和影响范围。在「代表人物」字段列出关键强者及其境界。

---

### 五、爽点设计

#### 5.1 玄幻穿越核心爽点类型

| 爽点类型 | 设计要素 | 频率建议 |
|---------|---------|---------|
| **越级挑战** | 境界低于对手 + 金手指/底牌发挥 + 震惊围观者 | 每 5-8 章一次 |
| **底牌揭示** | 隐藏实力 + 关键时刻爆发 + 扭转局面 | 每个弧线 1-2 次 |
| **以弱胜强** | 策略取胜 + 利用环境/克制关系 + 展示智谋 | 每 8-12 章一次 |
| **打脸爽文** | 被人轻视/嘲讽 → 实力碾压 → 对方目瞪口呆 | 每 3-5 章一次 |
| **暴富/获宝** | 秘境探险 + 意外发现 + 获得珍贵资源/法宝 | 每 10-15 章一次 |
| **境界突破** | 蓄力铺垫 + 突破过程 + 天地异象 + 实力飞跃 | 按三段式节奏 |

#### 5.2 爽点节奏分布

每 3-5 章至少要安排一个爽点，但爽点的「量级」要有节奏感：

```
小爽点 → 小爽点 → 中爽点 → 小爽点 → 大爽点 → 休整 → 循环
```

**爽点量级定义**：
- **小爽点**：打脸装逼者、获得一件法宝、小规模战斗胜利
- **中爽点**：越级挑战成功、秘境大收获、揭示一个底牌
- **大爽点**：境界突破、一战成名、揭开重大秘密、碾压曾经碾压自己的人

**与章节 Schema 的联动**：
- 在创建章节时，「剧情类型」设为「高潮」的章节应对应中/大爽点
- 「剧情类型」为「铺垫」和「冲突」的章节在为爽点蓄力
- 「剧情类型」为「过渡」的章节可安排小爽点，保持阅读粘性
- 「情感基调」为「激烈」的章节通常包含越级挑战或打脸爽点

#### 5.3 铺垫与释放的黄金比例

爽点的满足感与铺垫的「憋屈度」成正比：

| 铺垫强度 | 铺垫章节数 | 释放方式 | 满足感 |
|---------|----------|---------|-------|
| 轻微嘲讽 | 1-2 章 | 当场打脸 | 中等 |
| 持续欺压 | 5-8 章 | 公开场合碾压 | 高 |
| 长期压制+羞辱 | 10-20 章 | 彻底翻盘+让对方跪下 | 极高 |

**关键规则**：
- 铺垫期间主角不能太惨——保持「虽然被欺负但在暗中变强」的感觉
- 释放时要有足够的「围观者」——越多人见证，爽点越强
- 释放后安排一小段「余韵」——让围观者的震惊反应充分展现

---

### 六、能力上限与代价系统

#### 6.1 为什么限制比力量更重要

没有限制的力量 = 没有张力的故事。「修炼体系」设定中的「能力上限与代价」和「禁忌与风险」两个字段是维持故事张力的核心。

#### 6.2 代价的三种类型

| 代价类型 | 具体表现 | 叙事效果 |
|---------|---------|---------|
| **肉体代价** | 消耗寿命、气血亏损、经脉受损 | 让主角每次使用禁招都面临取舍 |
| **精神代价** | 心魔滋生、道伤、意识模糊 | 为后续「心魔」剧情埋下伏笔 |
| **物质代价** | 消耗珍贵资源、损毁法宝 | 与资源争夺剧情联动 |

#### 6.3 禁忌技能作为叙事工具

「禁忌与风险」字段中定义的禁忌技能是绝佳的叙事工具：

**使用时机**：
- 在绝境中被迫使用，展示主角的决绝
- 在保护重要之人时使用，展示情感深度
- 意外触发，引发新的危机和故事线

**设计规则**：
- 禁忌技能的威力必须远超当前境界（这是使用它的理由）
- 代价必须严重且持久（不能下一章就恢复了）
- 同一禁忌技能不宜频繁使用（最多全书 3-5 次）
- 每次使用的代价应该递增

#### 6.4 「更强 = 更大代价」原则

力量与代价的对应关系：

```
普通技能：无代价或极轻微消耗
强力技能：消耗较多灵力/资源，需要恢复时间
禁忌技能：消耗寿命/气血/道基，短期内无法再战
终极技能：不可逆的代价（永久性降境、断肢、失去某种能力）
```

在「能力上限与代价」字段中，按上述层级定义每一级别技能的代价范围。

---

### 七、工具使用指南

#### 7.1 修炼体系设定

使用 `update_setting` 操作「修炼体系」设定时，应完整填写以下 7 个字段：

| 字段 | 填写要点 |
|------|---------|
| **力量体系类型** | 从 enum 中选择，混合体系需说明主次 |
| **境界划分** | 列出所有大境界和小阶，每个境界注明质变能力 |
| **修炼资源** | 按层级列出，注明获取方式和稀缺度 |
| **功法/职业分支** | 列出主要分支，注明各分支特点和社会地位 |
| **能力上限与代价** | 每个境界的能力边界 + 各级技能的代价 |
| **禁忌与风险** | 走火入魔条件、心魔触发、禁术列表 |
| **代表性能力** | 每个境界的标志性能力，用于战力标尺参考 |

#### 7.2 角色创建与境界追踪

使用 `create_character` 创建角色时，重点填写：
- **种族**：从 enum 中选择，影响天赋和战力特征
- **身份地位**中的「境界/等级」：当前修为等级
- **身份地位**中的「所属势力」：隶属哪个组织
- **身份地位**中的「职业/宗门」：修炼分支方向

使用 `update_field_dynamic_info` 追踪境界变化：
- 每次角色突破时，更新「当前身份」中的境界信息
- 在「当前处境」中记录突破后的新状态
- 在「关系变化」中记录突破引发的关系变动（如：突破后被宗门重视、被敌人忌惮）

#### 7.3 组织创建与战力标注

使用 `create_organization` 创建组织时，重点填写：
- **类型**：从 enum 中选择
- **地位与影响力**：明确在世界格局中的排名和控制范围
- **代表人物**：列出关键强者及其境界等级
- **资源与特色**：该组织掌控的独特资源
- **与主角关系**：当前关系状态和未来可能的变化方向

#### 7.4 场景创建与力量规则

使用 `create_scene` 创建秘境/遗迹/副本场景时，重点填写：
- **场景类型**：从 enum 中选择（秘境/遗迹/副本等）
- **特殊规则/禁制**：场景内的力量限制规则（境界压制、元素增幅、禁术失效等）
- **关键事件**：场景中将发生的重要战斗或升级事件
- **与剧情作用**：该场景对主角升级路径的作用

#### 7.5 章节创建与爽点标记

使用章节相关工具时，利用以下字段标记爽点：
- **剧情类型**：「高潮」对应大爽点章节
- **情感基调**：「激烈」对应战斗爽点，「温馨」对应获宝/突破后的休整
- 在章节大纲中明确标注本章的爽点类型和量级',
  '## Xuanhuan Power System and Leveling Pacing

This skill focuses on the most critical system design in "Isekai Xuanhuan Crossing Novels": building and maintaining the cultivation system, ensuring power consistency, and controlling leveling pacing. The power system is the skeleton of a xuanhuan crossing novel -- if the skeleton collapses, so does the story.

---

### I. Cultivation System Design Methodology

#### 1.1 Power System Type Selection

The "Power System Type" (力量体系类型) field in the Cultivation System setting determines the entire world''s power logic. Each type has far-reaching implications for subsequent design:

| Type | Realm Design Tendency | Resource System | Combat Style |
|------|----------------------|-----------------|-------------|
| **Cultivation** (修真) | Progresses around "the Dao"; realm names lean toward xianxia | Spirit stones, pills, herbs | Spell bombardment, artifact clashes |
| **Magic** (魔法) | Progresses by "element/mana level" | Mana crystals, magic materials | Elemental counters, incantation duels |
| **Battle Aura** (斗气) | Progresses by "body/aura level" | Aura fruits, martial technique inheritances | Close combat, technique exchanges |
| **Special Abilities** (异能) | Progresses by "ability awakening layers" | Awakening stones, ability serums | Ability counters, creative combinations |
| **Hybrid** (混合体系) | Multiple paths coexist; interaction rules must be explicit | Multiple resource types in parallel | Cross-system collisions |

**Selection advice**:
- Cultivation and battle aura suit traditional power-fantasy leveling stories with the strongest sense of realm progression
- Magic suits stories emphasizing elemental counters and strategic combat
- Special abilities suit stories emphasizing individual differences and creative power usage
- Hybrid systems offer the highest freedom but also the highest maintenance burden -- you must explicitly define cross-system power comparison rules, or power scaling will inevitably collapse

#### 1.2 Realm Division Design Principles

"Realm Division" (境界划分) is the skeleton of the cultivation system. Design quality directly determines the leveling experience.

**Core principles**:

1. **Moderate quantity**: 8-12 major realms is the sweet spot
   - Fewer than 7: Insufficient layering; leveling feels too fast
   - More than 15: Readers cannot remember them; realm names become mere numbers
   - Recommended structure: 3 low-tier + 3 mid-tier + 3 high-tier + 1-3 peak

2. **Qualitative changes, not quantitative**: Each realm must unlock a qualitatively new ability
   - Wrong: "From Warrior Level 1 to Level 10, strength goes from 100 to 1000"
   - Right: "Breaking through to Spirit Sea realm allows externally projecting spiritual force as a protective aura; breaking through to Celestial Phenomenon realm allows channeling heaven-and-earth energy to form a domain"
   - Each realm''s signature ability should be recorded in the "Representative Abilities" (代表性能力) field

3. **Sub-level granularity**: Set sub-levels within major realms
   - Common approach: Early / Mid / Late / Peak (four sub-levels)
   - Alternative: Layers 1-9 (nine sub-levels; suits fast-paced leveling)
   - Sub-levels exist to provide "micro-breakthrough" satisfaction and avoid overly long gaps between major realms

4. **Meaningful naming**: Realm names should reflect the progressive nature of power
   - Cultivation style: Qi Refining -> Foundation Building -> Golden Core -> Nascent Soul -> Deity Transformation
   - Battle aura style: Dou Zhe -> Dou Shi -> Da Dou Shi -> Dou Ling -> Dou Wang -> Dou Huang -> Dou Zong -> Dou Zun -> Dou Sheng -> Dou Di
   - Universal style: Qi Condensation -> Spirit Movement -> Spirit Sea -> Celestial Phenomenon -> Dharma Aspect -> Unity -> Holy Tier -> God Tier

**Realm design references for different power system types**:

Cultivation type:
```
Qi Refining (Layers 1-12) -> Foundation Building -> Golden Core -> Nascent Soul -> Deity Transformation -> Fusion -> Tribulation Transcendence -> Immortal
```

Battle aura type:
```
Dou Zhe -> Dou Shi -> Da Dou Shi -> Dou Ling -> Dou Wang -> Dou Huang -> Dou Zong -> Dou Zun -> Dou Sheng -> Dou Di
```

Magic type:
```
Magic Apprentice -> Junior Mage -> Intermediate Mage -> Senior Mage -> Grand Mage -> Magister -> Grand Magister -> Holy Magister -> God of Magic
```

Hybrid type:
```
Mortal Realm (Qi Gathering / Body Tempering / Meridian Opening) -> Spirit Movement -> Spirit Sea -> Celestial Phenomenon -> Dharma Aspect -> Unity -> Holy Tier -> God Tier
```

#### 1.3 Cultivation Resource Hierarchy Design

The "Cultivation Resources" (修炼资源) field should establish a complete resource pyramid strictly corresponding to the realm system:

| Resource Tier | Typical Names | Corresponding Realms | Acquisition Difficulty |
|--------------|---------------|---------------------|----------------------|
| **Basic** | Spirit stones / mana crystals / aura stones | Low-tier (realms 1-3) | Obtainable through regular quests |
| **Intermediate** | Rare natural treasures / herbs / mid-grade spirit stones | Mid-tier (realms 4-6) | Requires entering secret realms or defeating strong enemies |
| **Advanced** | Dao fruits / immortal stones / holy-grade materials | High-tier (realms 7-9) | Rare fortune or major faction reserves |
| **Supreme** | Heavenly Dao essence / creation-level materials / god-grade materials | Peak (realms 10+) | Legendary rarity; may trigger wars |

**Design points**:
- Each resource tier''s scarcity should increase by 10-100x
- Low-tier resources are worthless to high-realm cultivators -- this is a great way to convey realm gaps
- Resource competition is the most natural conflict driver in xuanhuan; every major arc''s conflict root should be tied to resources

#### 1.4 Techniques/Class Branches as Specialization System

The "Techniques/Class Branches" (功法/职业分支) field defines differentiated paths for cultivators and is key to avoiding "everyone just brute-forces everything":

**Combat branches**:
- Sword/blade cultivator: Melee burst type
- Spell cultivator: Ranged bombardment type
- Body cultivator: Physical domination type
- Summoner: Spirit beast/puppet combat type

**Support branches**:
- Alchemist: Pill crafting; extremely high economic status
- Artificer: Artifact forging; indirect power boost
- Formation master: Offense-defense support; ideal for team combat

**Special branches**:
- Beast tamer: Taming spirit beasts; pairs with spirit-pet type cheat abilities
- Poison master: Unorthodox path; suits mysterious tones
- Soul cultivator: Mental attack path

**Design rules**:
1. The protagonist''s branch must match their cheat ability -- system-type cheats suit all-rounder types; talent-type cheats suit extreme specialists
2. Support branches must not have lower social status than combat branches -- alchemists being fought over by major factions is a classic setting
3. Different branches'' combat styles must be fundamentally distinct, providing diversity in battle scenes

---

### II. Power Consistency Maintenance

Power scaling collapse is the most common fatal problem in xuanhuan novels. This section provides systematic solutions.

#### 2.1 The Nature of Power Scaling Collapse

**The problem**: The protagonist defeats an enemy three realms above in Chapter 20, then struggles against a same-realm opponent in Chapter 80. Reader''s question: "Wasn''t this easy before? Why are they struggling now?"

**Root causes**:
- Each realm''s ability boundaries were not pre-defined
- Cross-realm combat conditions are unclear, used arbitrarily
- Opponent strength is adjusted arbitrarily based on plot needs
- Failure to account for cheat ability effectiveness diminishing relatively as opponents grow stronger

#### 2.2 Power Benchmark System

Establish explicit "power benchmarks" for each realm, recorded in the "Realm Division" and "Representative Abilities" fields:

| Realm | Destructive Power Benchmark | Speed Benchmark | Perception Benchmark |
|-------|---------------------------|-----------------|---------------------|
| Low (1-3) | Split boulders -> destroy buildings -> level hills | Several times human speed -> sonic -> supersonic | 100m -> 1km -> tens of li |
| Mid (4-6) | Flatten towns -> split mountain ranges -> alter terrain | Short-range teleport -> long-range teleport | Hundreds of li -> thousands of li |
| High (7-9) | Destroy a city -> tear space -> shatter continental fragments | Spatial leap -> cross-domain flight | Cross-domain perception |
| Peak (10+) | Destroy continents -> annihilate planes | Thought-speed travel | Full-domain perception |

**Usage**: Before writing any combat scene, consult the benchmarks to confirm that characters at their current realm do not exceed their boundaries.

#### 2.3 Cross-Realm Combat Rules

Cross-realm combat is a core xuanhuan satisfaction point, but it must have strict rules:

**Conditions permitting cross-realm combat** (at least one must be met):
- Cheat ability special power (explicitly described in the Cheat Ability setting)
- Possessing artifacts/techniques far beyond current realm
- Massive terrain/environmental advantage
- Opponent injured/in poor condition
- Special counter relationship (elemental counter, system counter)

**Cross-realm ceiling**:
- Ordinary genius: One sub-realm above is the limit
- Protagonist with cheat ability: One major realm above is normal; two is the absolute limit
- Two major realms or more: Must come at significant cost; cannot be repeated

**Cross-realm difficulty scaling**:
- At low tiers, cross-realm combat is relatively easy (absolute gaps between realms are smaller)
- At mid tiers, cross-realm difficulty increases (substantive gap per realm widens)
- At high tiers, cross-realm combat is nearly impossible (one realm''s gap can be an unbridgeable chasm)

#### 2.4 Transitivity Check

If Character A defeated Character B, and Character B defeated Character C, then Character A should be able to handle Character C.

**Execution method**:
- Use `update_field_dynamic_info` to record each important character''s current realm
- Record important battle results in the knowledge graph
- Before arranging any new battle, check for contradictions with existing results
- If transitivity must be broken (A beats B, B beats C, but C beats A), explicitly state the reason (attribute counters, different battle conditions, etc.)

#### 2.5 Relative Decay of Cheat Ability Effectiveness

The cheat ability''s absolute effect stays constant, but as opponents grow stronger, its relative advantage should gradually shrink:

```
Early: Cheat doubles the protagonist''s power -> stomps same-realm opponents
Mid: Cheat provides 30% advantage -> stronger than most same-realm but no longer stomping
Late: Cheat provides 10% advantage -> must combine with personal skill and battle tactics to win
```

This decay curve should be pre-planned in the "Growth Potential" (成长空间) field of the Cheat Ability setting.

---

### III. Leveling Pace Control

Leveling pace is the reins that steer the entire novel -- too fast and readers cannot immerse; too slow and they lose patience.

#### 3.1 Three-Phase Pacing Model

| Phase | Chapter Range (Reference) | Leveling Frequency | Pacing Characteristics |
|-------|--------------------------|-------------------|-----------------------|
| **Early** | Ch 1-50 | Fast: minor breakthrough every 5-10 chapters | Dense leveling + cheat ability showcase + worldview establishment |
| **Middle** | Ch 50-150 | Medium: minor breakthrough every 15-25 chapters | Bottlenecks appear + subplots expand + relationships deepen |
| **Late** | Ch 150+ | Slow: major breakthrough every 30-50 chapters | Each breakthrough is a milestone + shakes the world order |

**Early phase (establishment)**:
- Rapid leveling establishes the reader expectation that "the protagonist is growing stronger"
- The cheat ability shines brightest in this phase, hooking readers
- Each level-up should accompany a minor satisfaction point (face-slap, treasure, new ability showcase)
- Worldview information is woven into the leveling process to avoid info-dump blocks

**Middle phase (deepening)**:
- Introduce cultivation bottlenecks -- not every seclusion results in a breakthrough
- Bottleneck breakthroughs require special conditions (secret realm fortune, life-and-death trials, comprehension)
- Subplot quests should serve breakthrough needs (seeking breakthrough resources in secret realms, gaining new abilities through combat)
- Character relationships develop in the intervals between breakthroughs

**Late phase (eruption)**:
- Each breakthrough should be a narrative climax
- Breakthroughs themselves trigger chain reactions (heaven-and-earth phenomena, attention from all factions, enemies striking preemptively)
- Long intervals between breakthroughs, but each should feel worth the wait
- The protagonist no longer merely grows stronger but begins to reshape the world order

#### 3.2 Map Expansion Technique

"Map expansion" is the most powerful tool for controlling leveling pace:

```
New realm breakthrough -> Current map fully explored -> Enter new territory -> Discover new factions and opponents -> Need to grow even stronger
```

With each map expansion:
- Use `create_scene` to create key scenes in the new region (cities, sects, secret realms, etc.)
- Use `create_organization` to create the new region''s core factions
- Use `create_character` to create the new region''s key characters
- The new region''s overall power level should be 1-2 major realms above the previous area

**Map expansion pacing reference**:
| Phase | Activity Range | Corresponding Realms | Core Scene Types |
|-------|---------------|---------------------|-----------------|
| Start | Small town / low-tier sect | Low-tier 1-2 | Cities, sects |
| Expansion | Medium city / mid-tier factions | Low-tier 3 to mid-tier 1 | Cities, sects, secret realms |
| Broadening | Kingdoms / major factions | Mid-tier 2-4 | Secret realms, ruins, academies |
| Cross-domain | Continents / multiple factions | Mid-tier 5 to high-tier | Wilderness, dimensional rifts |
| Peak | Multiple continents / planes | High-tier to peak | Ruins, dungeons |

#### 3.3 Avoiding Power Inflation

Power inflation = each level-up renders all previous realms completely worthless.

**Solutions**:
1. **Make leveling costly**: Breakthroughs consume precious resources, require seclusion time, have failure risk
2. **Make leveling story-driven**: Each breakthrough accompanies a complete narrative arc, not just "popped a pill and broke through"
3. **Keep lower-realm characters relevant**: Lower-realm allies can still contribute through support roles (alchemy, formations, intelligence)
4. **Design "realm consolidation" phases**: After breaking through, time is needed to consolidate; consecutive breakthroughs are not possible

#### 3.4 Secret Realms / Ruins / Dungeons as Leveling Events

Secret realm, ruin, and dungeon scene types in the Scene Schema are the best leveling vehicles:

| Scene Type | Leveling Function | Narrative Function |
|-----------|------------------|-------------------|
| **Secret realm** (秘境) | Acquire rare cultivation resources | Multi-party competition, life-and-death adventure |
| **Ruin** (遗迹) | Obtain inherited techniques or artifacts | Puzzle-solving, exploration, history revelation |
| **Dungeon** (副本) | Systematic challenges and rewards | Level design, progressive difficulty |

**Usage**: Before each major realm breakthrough, arrange a secret realm/ruin/dungeon expedition as the plot event for acquiring breakthrough resources. When creating the scene, use `create_scene` with "Scene Type" set to secret realm/ruin/dungeon, and define the scene''s power restriction rules in "Special Rules/Restrictions" (e.g., "Suppresses cultivation above Golden Core within the secret realm").

---

### IV. Racial and Faction Power Tiers

#### 4.1 Seven Races and Their Power Characteristics

Leverage the "Race" (种族) field in the Character Schema to establish differentiated power profiles for each race:

| Race | Innate Advantage | Innate Disadvantage | Cultivation Tendency |
|------|-----------------|--------------------|--------------------|
| **Human** (人族) | Diverse cultivation paths; complete technique systems | Average individual talent | All-rounder |
| **Demon Beast** (妖族) | Innately powerful physique; bloodline talents | Difficult to take human form; scarce techniques | Body cultivation / bloodline |
| **Devil** (魔族) | Gifted; fast cultivation speed | Hated by the righteous; high risk of demonic corruption | Demonic arts / special abilities |
| **Elf** (精灵) | Nature-attuned; strong elemental affinity | Rare in number; weak in melee | Spell cultivation / support |
| **Orc** (兽人) | Astonishing strength; superb endurance | Lower spiritual intelligence; weak in spells | Body cultivation |
| **Dragon** (龙族) | Noble bloodline; individually overpowering | Extremely rare; reproduction difficulties | Bloodline / all-rounder |
| **Other** (其他) | Custom per setting | Custom per setting | Custom |

**Relationship between race and power design**:
- At the same realm, races with innately powerful physiques (demon beasts, dragons) have melee advantages
- Humanity''s advantage lies in system completeness -- more techniques, more artifacts, more support
- Inter-racial power differences should narrow as realms increase (high-realm powerhouses gradually transcend racial limitations)
- If the protagonist is human, racial disadvantages should be compensated by the cheat ability

#### 4.2 Nine Organization Types and Their Power Structures

Leverage the "Type" (类型) and "Status and Influence" (地位与影响力) fields in the Organization Schema to build a power hierarchy for factions:

| Organization Type | Typical Power Ceiling | Member Scale | Resource Characteristics |
|------------------|----------------------|-------------|------------------------|
| **Sect** (宗门) | Highest-realm elder presides | Hundreds to tens of thousands | Complete technique inheritance |
| **Kingdom** (王国) | National preceptor / royal guards | Primarily military | Abundant military resources |
| **Academy** (学院) | Dean-level | Hundreds to thousands | Focused on nurturing new talent |
| **Mercenary band** (佣兵团) | Captain-level | Tens to hundreds | Flexible and mobile |
| **Church** (教会) | Pope / high priest | Numerous followers | Power of faith |
| **Trading guild** (商会) | Hired powerhouse guards | Merchants + guards | Extremely rich economic resources |
| **Tribal clan** (异族部落) | Chieftain / elders | Thousands to tens of thousands | Racial talents |
| **Devil faction** (魔族势力) | Demon lord / generals | Variable | Demonic arts / forbidden techniques |
| **Other** (其他) | Custom | Custom | Custom |

#### 4.3 Designing Inter-Faction Power Balance

**Triangle balance principle**: Maintain dynamic balance among at least three factions to prevent one-sided dominance from eliminating conflict.

**Escalating opponents design**:
- Each story arc''s opponents come from a stronger faction than the previous arc
- Arc 1: Intra-sect competitors (fellow disciples)
- Arc 2: Opposing minor factions (mercenary bands, small sects)
- Arc 3: Same-tier major factions (great sects, kingdoms)
- Arc 4: Cross-domain super factions (devil factions, tribal clan alliances)
- Arc 5: Ultimate factions (mysterious organizations, incarnations of the heavenly Dao)

When using `create_organization`, explicitly note in the "Status and Influence" field the faction''s power ranking and sphere of influence within the current world structure. List key powerhouses and their realms in the "Representative Figures" (代表人物) field.

---

### V. Satisfaction Point Design

#### 5.1 Core Xuanhuan Satisfaction Point Types

| Satisfaction Type | Design Elements | Frequency Recommendation |
|------------------|----------------|------------------------|
| **Cross-realm challenge** | Lower realm than opponent + cheat/trump card activation + shocked spectators | Every 5-8 chapters |
| **Trump card reveal** | Hidden power + critical-moment eruption + situation reversal | 1-2 times per arc |
| **Weak defeating strong** | Strategic victory + environmental/counter exploitation + showcasing wit | Every 8-12 chapters |
| **Face-slapping** | Being dismissed/mocked -> power crush -> opponent''s jaw drops | Every 3-5 chapters |
| **Windfall/treasure** | Secret realm expedition + unexpected discovery + precious resources/artifacts | Every 10-15 chapters |
| **Realm breakthrough** | Sustained buildup + breakthrough process + heaven-and-earth phenomena + power leap | Per three-phase pacing model |

#### 5.2 Satisfaction Point Pacing Distribution

At least one satisfaction point every 3-5 chapters, but the "magnitude" must have rhythm:

```
Small -> Small -> Medium -> Small -> Large -> Recovery -> Cycle
```

**Magnitude definitions**:
- **Small**: Face-slapping an arrogant minor character; acquiring a single artifact; winning a small-scale fight
- **Medium**: Successful cross-realm challenge; major secret realm haul; revealing one trump card
- **Large**: Realm breakthrough; becoming famous in one battle; uncovering a major secret; crushing someone who once crushed you

**Integration with Chapter Schema**:
- Chapters with "Plot Type" (剧情类型) set to "Climax" (高潮) should correspond to medium/large satisfaction points
- Chapters with "Plot Type" set to "Buildup" (铺垫) or "Conflict" (冲突) are building energy for satisfaction points
- Chapters with "Plot Type" set to "Transition" (过渡) can include small satisfaction points to maintain reading engagement
- Chapters with "Emotional Tone" (情感基调) set to "Intense" (激烈) typically contain cross-realm challenges or face-slapping

#### 5.3 The Golden Ratio of Buildup to Release

Satisfaction intensity is proportional to the "frustration level" of the buildup:

| Buildup Intensity | Buildup Chapters | Release Method | Satisfaction Level |
|------------------|-----------------|---------------|-------------------|
| Mild mockery | 1-2 chapters | On-the-spot face-slap | Medium |
| Sustained bullying | 5-8 chapters | Public crushing | High |
| Long-term oppression + humiliation | 10-20 chapters | Complete reversal + making them kneel | Extreme |

**Key rules**:
- During buildup, the protagonist must not be too miserable -- maintain the feeling of "being bullied but secretly growing stronger"
- During release, there must be sufficient "spectators" -- the more witnesses, the stronger the satisfaction point
- After release, arrange a brief "afterglow" -- let the spectators'' shocked reactions be fully displayed

---

### VI. Ability Ceiling and Cost System

#### 6.1 Why Limits Matter More Than Power

Unlimited power = a story without tension. The "Power Ceiling and Costs" (能力上限与代价) and "Taboos and Risks" (禁忌与风险) fields in the Cultivation System setting are the core of maintaining story tension.

#### 6.2 Three Types of Costs

| Cost Type | Specific Manifestation | Narrative Effect |
|-----------|----------------------|-----------------|
| **Physical costs** | Lifespan consumption, qi/blood depletion, meridian damage | Forces the protagonist to weigh tradeoffs with each forbidden technique |
| **Spiritual costs** | Inner demon growth, Dao wounds, consciousness clouding | Plants seeds for future "inner demon" plotlines |
| **Material costs** | Precious resource consumption, artifact destruction | Links to resource-competition plotlines |

#### 6.3 Forbidden Techniques as Narrative Tools

Forbidden techniques defined in the "Taboos and Risks" field are excellent narrative devices:

**When to use**:
- Forced to use in desperate situations, showcasing the protagonist''s resolve
- Used when protecting important people, showcasing emotional depth
- Accidentally triggered, sparking new crises and storylines

**Design rules**:
- Forbidden techniques must be far more powerful than the current realm (this is the reason for using them)
- Costs must be severe and lasting (cannot recover by the next chapter)
- The same forbidden technique should not be used frequently (at most 3-5 times in the entire book)
- Costs should escalate with each use

#### 6.4 The "Greater Power = Greater Cost" Principle

The correspondence between power and cost:

```
Normal techniques: No cost or minimal consumption
Powerful techniques: Considerable spiritual/resource consumption; requires recovery time
Forbidden techniques: Consumes lifespan/qi-blood/Dao foundation; unable to fight again short-term
Ultimate techniques: Irreversible costs (permanent realm reduction, limb loss, losing a specific ability)
```

In the "Power Ceiling and Costs" field, define the cost range for each technique tier according to the above levels.

---

### VII. Tool Usage Guide

#### 7.1 Cultivation System Setting

When using `update_setting` on the "Cultivation System" (修炼体系) setting, complete all 7 fields:

| Field | Key Points |
|-------|-----------|
| **Power System Type** | Select from enum; for hybrid systems, specify primary and secondary |
| **Realm Division** | List all major realms and sub-levels; note each realm''s qualitative change ability |
| **Cultivation Resources** | List by tier; note acquisition methods and scarcity levels |
| **Techniques/Class Branches** | List major branches; note each branch''s characteristics and social status |
| **Power Ceiling and Costs** | Each realm''s ability boundary + costs for each technique tier |
| **Taboos and Risks** | Qi deviation conditions, inner demon triggers, forbidden technique list |
| **Representative Abilities** | Each realm''s signature ability; serves as power benchmark reference |

#### 7.2 Character Creation and Realm Tracking

When using `create_character`, focus on:
- **Race** (种族): Select from enum; affects talent and power characteristics
- "Realm/Level" (境界/等级) in **Status and Position** (身份地位): Current cultivation level
- "Affiliated Faction" (所属势力) in **Status and Position**: Which organization they belong to
- "Class/Sect" (职业/宗门) in **Status and Position**: Cultivation branch direction

Use `update_field_dynamic_info` to track realm changes:
- Update realm information in "Current Identity" (当前身份) whenever a character breaks through
- Record the new post-breakthrough status in "Current Situation" (当前处境)
- Record breakthrough-triggered relationship changes in "Relationship Changes" (关系变化) (e.g., gaining sect recognition after breakthrough, being feared by enemies)

#### 7.3 Organization Creation and Power Annotation

When using `create_organization`, focus on:
- **Type** (类型): Select from enum
- **Status and Influence** (地位与影响力): Explicitly note power ranking and sphere of influence in the world structure
- **Representative Figures** (代表人物): List key powerhouses and their realm levels
- **Resources and Characteristics** (资源与特色): Unique resources controlled by this organization
- **Relationship with Protagonist** (与主角关系): Current relationship status and potential future changes

#### 7.4 Scene Creation and Power Rules

When using `create_scene` for secret realm/ruin/dungeon scenes, focus on:
- **Scene Type** (场景类型): Select from enum (secret realm/ruin/dungeon, etc.)
- **Special Rules/Restrictions** (特殊规则/禁制): Power restriction rules within the scene (realm suppression, elemental amplification, forbidden technique nullification, etc.)
- **Key Events** (关键事件): Important battles or leveling events that will occur in the scene
- **Plot Function** (与剧情作用): This scene''s role in the protagonist''s leveling path

#### 7.5 Chapter Creation and Satisfaction Point Marking

When using chapter-related tools, leverage these fields to mark satisfaction points:
- **Plot Type** (剧情类型): "Climax" (高潮) corresponds to major satisfaction-point chapters
- **Emotional Tone** (情感基调): "Intense" (激烈) corresponds to combat satisfaction points; "Warm" (温馨) corresponds to post-treasure/post-breakthrough recovery
- Explicitly note the satisfaction point type and magnitude in the chapter outline',
  (SELECT id FROM novel_creation_method WHERE name = '异世界玄幻穿越小说' LIMIT 1),
  1,
  100,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  novel_creation_method_id = VALUES(novel_creation_method_id),
  is_active = VALUES(is_active),
  sort_order = VALUES(sort_order),
  updated_at = NOW();
