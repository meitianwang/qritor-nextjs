-- 民间灵异故事创作「角色」生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '民间灵异故事创作' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-lingyi-character-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'lingyi-character-gen',
  '「角色」生成：为民间灵异故事创作生成角色，涵盖人与非人的二元体系、命格体质、因果业报、民俗法术、死亡方式与厉鬼规则',
  '"Character" generation: generate characters for folk horror stories, covering human/non-human duality, fate constitution, karmic retribution, folk sorcery, death methods, and vengeful spirit rules',
  '## 「角色」生成 — 民间灵异故事创作

民间灵异故事的角色设计核心是**人与非人的对立统一 × 因果业报 × 民俗法术**。这个类型的角色不是"穿越者"，而是生活在一个灵异事件随时可能发生的世界中的普通人和非人存在。

角色的命格体质决定了他与灵异的交互方式，背负因果解释了他为何遭遇灵异，死亡方式（对鬼怪角色）定义了厉鬼的规则和弱点。每个角色都是因果链上的一环。

---

### 字段生成指南

#### 姓名

- 人类角色：普通的中国人名字，朴实接地气（如"李大壮"、"王翠花"、"赵老三"）
- 鬼怪角色：可以是称呼式命名（如"红衣女"、"黄皮子老太"、"桥下水鬼"）
- **禁止名字带绰号或职业**（如"张三（二愣子）"是错误的）
- 禁止使用过于文艺或网络化的名字

#### 生命周期

三个选项在灵异故事中的含义：

| 周期 | 说明 | 典型角色 |
|------|------|---------|
| **长期 (幸存者/核心BOSS)** | 贯穿全书 | 主角、核心术士、最终大BOSS |
| **短期 (受害者/单元反派)** | 活不过一个事件弧 | 炮灰、单元怨灵、受害村民 |
| **客串 (线索人物)** | 提供关键信息后消失 | 疯老头、守庙人、临终遗言者 |

灵异故事的死亡率极高——大部分角色是短期的。

#### 角色定位

四个选项的灵异特色：

| 定位 | 说明 | 设计重点 |
|------|------|---------|
| **普通人/闯入者** | 负责探索与惊悚体验 | 是读者的代入视角；恐惧反应要真实 |
| **民间手艺人/术士** | 出马仙、风水师、缝尸人等 | 有专业技能但不是万能的；每种术法都有代价 |
| **诡异/非人** | 怨灵、精怪、僵尸等 | 必须有明确的"规则"——能做什么、不能做什么、弱点是什么 |
| **关键线索人物** | 守村人、疯子、幸存长者 | 知道真相但表达方式隐晦或疯癫 |

#### 命格与体质

这是灵异角色的**核心字段**，决定角色与灵异的交互方式：

| 命格/体质 | 效果 | 适用角色类型 |
|----------|------|------------|
| **八字全阴** | 天生能看到鬼，容易被灵异纠缠 | 主角或核心配角 |
| **童子命** | 命中注定早夭或不顺 | 悲情角色 |
| **天生阴阳眼** | 看到常人看不到的东西 | 主角或线索人物 |
| **阳火虚弱** | 容易被邪物侵害 | 受害者型角色 |
| **极煞之体** | 天生克制邪物 | 术士型角色 |
| **普通人** | 正常体质，遭遇灵异纯属倒霉 | 大部分短期角色 |

鬼怪角色也有"体质"：怨气的浓度、成型的程度（新鬼 vs 百年老鬼）。

#### 绑定场景

角色的主要活动场所——灵异故事中场景极其重要：
- 人类角色：居住地或工作场所（"城中村出租屋"、"乡下老宅"）
- 鬼怪角色：出没/被束缚的地点（"村西头义庄"、"404号房"、"老槐树下"）
- 参考「世界」设定中的核心场景
- 鬼怪的绑定场景暗示其死亡地点或执念所在

#### 所修法门或诡异能力

根据角色定位分两种情况：

**人类术士**：描述具体的民间法术流派
- 出马仙：请仙上身，借神力驱邪
- 扎纸人：纸扎替身、纸扎兵
- 风水术：看地脉、寻龙穴、改风水
- 祝由科：画符念咒、驱邪治病
- 茅山术：符箓、桃木剑、黑狗血
- 每种法术都有代价和限制

**鬼怪/非人**：描述杀人规则或诡异能力
- 入梦：在梦中杀人
- 鬼遮眼：让人迷路或看到幻象
- 索命：直接夺取阳寿
- 附身：占据活人身体
- 每种能力都必须有对应的弱点或破解方式

#### 外貌特征

灵异故事的外貌描写要隐含恐怖元素：
- 人类角色：普通外貌中隐含异常（"手指发黑"、"走路垫脚"、"总是低着头"）
- 术士角色：职业痕迹（"手指老茧"、"眉间朱砂"、"随身带桃木"）
- 鬼怪角色：死因的外在表现（"脖子歪斜"→吊死、"浑身湿透"→溺亡、"面色青紫"→窒息）
- 外貌描写要为恐怖氛围服务

#### 性格

灵异故事中常见的性格关键词：
- 普通人：贪婪、胆小、迷信、好奇心强
- 术士：谨慎、沉稳、看透生死、有职业道德（或没有）
- 鬼怪：执念、怨恨、迷茫、不甘
- 性格缺陷往往是角色遭遇灵异的"把柄"

#### 背负因果

中式恐怖的**核心驱动力**——角色遭遇灵异的深层原因：

| 因果类型 | 说明 | 示例 |
|---------|------|------|
| **祖辈因果** | 上辈人做的恶事报应到后人 | "祖上挖绝户坟"、"曾祖杀过黄大仙" |
| **自身因果** | 自己造的孽 | "贪图买命财"、"害死过人" |
| **无辜卷入** | 纯粹倒霉 | "误入禁地"、"捡了不该捡的东西" |
| **职业因果** | 因职业接触灵异 | "收过不该收的东西"、"给不该葬的人入殓" |
| **怨念因果** | 自身怨气吸引灵异 | "心怀怨气不散"、"执念太深" |

鬼怪角色的因果是其死因和怨念来源。

#### 死亡方式（仅限鬼怪角色）

死亡方式直接决定厉鬼的能力和弱点：

| 死法 | 厉鬼特征 | 常见出没方式 |
|------|---------|------------|
| **吊死** | 脖子歪斜，绳索意象 | 常现于横梁，用绳索杀人 |
| **溺亡** | 浑身湿透，水的意象 | 水鬼拉人下水，需找替死鬼 |
| **饿死** | 骨瘦如柴 | 索取食物，见食物就扑 |
| **横死** | 怨气最重，最难对付 | 不讲规则，暴力攻击 |
| **冤死** | 有冤情未解 | 重演死前场景，需破解冤案 |
| **病死** | 怨气较弱 | 传播疾病或恐惧 |

人类角色此字段留空。

#### 状态变化轨迹

设计好的角色状态演变路径：
- 人类角色："正常 → 怀疑 → 恐惧 → 崩溃"或"唯物主义 → 信仰崩塌 → 疯狂"
- 术士角色："自信 → 遇到强敌 → 付出代价 → 突破"
- 鬼怪角色："受害者 → 怨灵 → 厉鬼 → 被超度"或"沉睡 → 被惊醒 → 报复 → 消散"

---

### 角色阵容建议

**标准配置**：
1. **主角**：普通人/闯入者，八字全阴或阴阳眼体质，被卷入灵异事件
2. **术士**：出马仙或茅山道士，帮助主角但能力有限，每次出手都有代价
3. **核心怨灵**：事件的源头，有悲惨的死因和深重的怨念
4. **线索人物**：守村老人或疯癫幸存者，知道真相但表达隐晦
5. **炮灰**：1-2个短期角色，早期遇害，为主角提供警示

**灵异故事的特殊规则**：
- 角色死亡率高，短期角色可以多设
- 鬼怪角色的"规则"必须清晰——这是读者推理和代入的基础
- 术士不能太强，否则失去恐怖感

---

### 与已有设定的联动

| 设定模块 | 对角色的影响 |
|---------|------------|
| **世界** | 灵异规则→鬼怪角色的能力范围；核心场景→角色绑定场景；民俗体系→术士的法术流派 |
| **故事钩子** | 核心恐怖元素→角色设计的恐怖方向；故事类型→角色阵容结构 |
| **小说梗概** | 故事走向→角色的命运轨迹；核心事件→角色在关键节点的角色 |
| **文风设定** | 恐怖氛围→角色描写的恐怖程度；叙事节奏→角色死亡的节奏安排 |

---

### 常见错误

1. **鬼怪没有规则**：厉鬼想干什么就干什么，没有能力限制和弱点——好的灵异故事中鬼怪都有明确的"规则"
2. **因果逻辑断裂**：角色遭遇灵异没有合理的因果解释，纯粹为了吓人
3. **术士万能**：术士什么都能解决，消除了恐怖和悬念
4. **外貌描写不服务于恐怖**：鬼怪角色的外貌描写像普通人，缺乏恐怖暗示
5. **命格体质摆设化**：设定了八字全阴但对剧情没有实际影响
6. **死亡方式与能力不匹配**：溺亡的鬼怪却用火焰杀人，死法决定能力是灵异故事的基本规则
7. **炮灰角色完全没有特征**：即使是短期角色也需要一个让读者记住的特征',
  '## "Character" Generation — Folk Horror Story Creation

The core of character design in folk horror stories is **human vs non-human duality × karmic retribution × folk sorcery**. Characters are not "transmigrators" but ordinary people and supernatural beings living in a world where paranormal events can happen at any time.

A character''s fate constitution determines how they interact with the supernatural, their karmic burden explains why they encounter it, and death method (for ghost characters) defines the vengeful spirit''s rules and weaknesses.

---

### Field Generation Guide

#### Name (姓名)
Human characters: ordinary Chinese names, grounded and realistic. Ghost characters: descriptive titles ("Red-Clothed Woman", "Old Bridge Water Ghost"). No nicknames or job titles in parentheses.

#### Life Cycle (生命周期)
Long-term (survivors/core boss), Short-term (victims/single-arc antagonists), Cameo (clue providers). Death rate is extremely high — most characters are short-term.

#### Role (角色定位)
Ordinary Person/Intruder (exploration and horror experience), Folk Sorcerer (specific folk magic with costs), Supernatural/Non-human (must have clear "rules"), Key Clue Character (knows truth but expresses cryptically).

#### Fate Constitution (命格与体质)
Core field determining supernatural interaction: Pure Yin Bazi (can see ghosts), Child of Heaven (destined misfortune), Natural Yin-Yang Eyes (sees what others can''t), Weak Yang Fire (easily invaded), Extreme Sha Body (naturally repels evil). Ghost characters have their own "constitution": concentration of resentment, age of formation.

#### Bound Scene (绑定场景)
Where the character primarily operates. Human: residence or workplace. Ghost: haunting location (hints at death place or obsession).

#### Sorcery or Supernatural Ability (所修法门或诡异能力)
Human sorcerers: specific folk magic schools (Spirit Medium, Paper Crafting, Feng Shui, Zhu You, Maoshan) — each with costs and limits. Ghosts: killing rules or abilities (dream invasion, ghost blindfold, possession) — each must have corresponding weakness.

#### Appearance (外貌特征)
Must contain implied horror elements: humans with subtle abnormalities, sorcerers with professional marks, ghosts showing cause of death in appearance.

#### Personality (性格)
Common keywords: greedy, cowardly, superstitious, obsessed. Personality flaws are often the "handle" for supernatural encounters.

#### Karmic Burden (背负因果)
Core driver of Chinese horror: ancestral karma, personal karma, innocent involvement, occupational karma, resentment-based karma. For ghosts, it''s their cause of death and source of resentment.

#### Death Method (死亡方式, ghost characters only)
Directly determines the vengeful spirit''s abilities and weaknesses: hanging → rope imagery, drowning → water ghost needs substitute, starvation → demands food, violent death → strongest resentment.

#### State Change Trajectory (状态变化轨迹)
Designed evolution path: humans "normal → suspicion → fear → breakdown," sorcerers "confidence → challenge → sacrifice → breakthrough," ghosts "victim → wraith → vengeful spirit → pacified."

---

### Setting Linkage

| Setting | Impact |
|---------|--------|
| **World** | Supernatural rules → ghost ability range; core scenes → character bound scenes; folk system → sorcerer schools |
| **Story Hook** | Core horror element → character horror direction; story type → lineup structure |
| **Synopsis** | Story direction → fate trajectories; core events → character roles at key points |
| **Writing Style** | Horror atmosphere → character description intensity; pacing → death timing |

---

### Common Errors

1. **Ghosts without rules**: Vengeful spirits can do anything with no limits or weaknesses
2. **Broken karmic logic**: Supernatural encounters without reasonable causal explanation
3. **Omnipotent sorcerer**: Sorcerer solves everything, eliminating horror and suspense
4. **Non-horror appearance**: Ghost descriptions read like normal people
5. **Decorative fate constitution**: Setting Pure Yin Bazi but having no plot impact
6. **Death method doesn''t match ability**: Drowned ghost using fire to kill
7. **Featureless cannon fodder**: Even short-term characters need one memorable trait',
  (SELECT id FROM novel_creation_method WHERE name = '民间灵异故事创作' LIMIT 1),
  1,
  21,
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
