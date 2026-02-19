-- 民间灵异故事创作 - 恐惧叙事与节奏控制 Skill / Folk Supernatural Story Creation - Horror Narrative and Pacing Control Skill
-- novel_creation_method_id = 民间灵异故事创作 (method 47)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-lingyi-horror-narrative.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'lingyi-horror-narrative',
  '恐惧叙事与节奏控制：情节节奏五段式设计、恐怖元素递进编排、悬念埋设与揭露、角色生死管理、场景灵异活跃度控制，构建完整的民间灵异恐怖叙事体系',
  'Horror narrative and pacing control: five-phase rhythm design, horror element escalation, suspense planting and revelation, character life-death management, scene supernatural activity control — building a complete folk supernatural horror narrative system',
  '## 恐惧叙事与节奏控制

本技能专为「民间灵异故事创作」方法设计，指导你运用该方法特有的章节字段（恐怖元素、情节节奏、悬念设置）和角色/场景动态字段（生死状态、精神状态、阳火状态、灵异活跃度），构建有层次感、有节奏感的恐怖叙事。

---

### 一、情节节奏五段式设计

#### 1.1 五段式概述

民间灵异故事的情节节奏由「情节节奏」字段控制，共五个阶段：

| 阶段 | 叙事作用 | 读者体验 |
|------|---------|---------|
| **铺垫蓄势** | 建立日常，引入诡异的"第一个不对劲" | 隐隐不安，好奇心被勾起 |
| **渐入诡境** | 诡异现象逐步升级，规则初显 | 紧张攀升，开始害怕 |
| **高潮惊悚** | 恐怖全面爆发，正面遭遇灵异 | 心跳加速，极度恐惧 |
| **舒缓喘息** | 暂时脱离危险，整理线索 | 松一口气，但余悸未消 |
| **真相揭露** | 揭开灵异事件的因果，给出解释 | 恍然大悟，细思极恐 |

#### 1.2 五段式不是线性序列

这五个阶段描述的是**整个故事弧**的节奏分布，而非每一章必须依次经历。一个完整的灵异故事弧（无论是单元式还是长篇主线）通常如此分布：

```
章1-3: 铺垫蓄势
章4-5: 渐入诡境
章6:   高潮惊悚
章7:   舒缓喘息
章8-9: 真相揭露
```

**但实际操作中节奏可以交错**：
- 高潮惊悚之后可以短暂舒缓，再来一次更强的高潮
- 渐入诡境阶段可以穿插铺垫蓄势（新的不对劲出现）
- 真相揭露可以分多章完成（层层剥开）

#### 1.3 黄金比例参考

对于典型的灵异故事弧，各阶段的章节占比建议：

| 阶段 | 占比 | 9章弧示例 | 说明 |
|------|------|---------|------|
| 铺垫蓄势 | 3/9 | 3章 | 充分的铺垫让后续恐怖更有冲击力 |
| 渐入诡境 | 2/9 | 2章 | 恐怖感的爬坡阶段 |
| 高潮惊悚 | 1/9 | 1章 | 高潮贵精不贵多，一击必中 |
| 舒缓喘息 | 1/9 | 1章 | 让读者和角色都喘口气 |
| 真相揭露 | 2/9 | 2章 | 给出因果，余韵悠长 |

这个比例可以根据故事类型调整：
- **快节奏故事**：压缩铺垫（2章），增加渐入诡境和高潮
- **悬疑导向故事**：增加真相揭露（3章），减少高潮惊悚
- **氛围恐怖故事**：增加铺垫蓄势（4章），高潮延后到最末

#### 1.4 如何使用 `update_chapter_outline` 设置情节节奏

为每章设定情节节奏时，在大纲中明确标注该章属于哪个阶段，并在 `update_chapter_outline` 的附加字段中填写：

- **情节节奏**：从五个枚举值中选择一个（铺垫蓄势/渐入诡境/高潮惊悚/舒缓喘息/真相揭露）
- 一章只能有一个主要节奏，但可以在大纲中注明"以铺垫为主，结尾过渡到渐入诡境"

**节奏切换原则**：
- 铺垫蓄势 → 渐入诡境：通过一个"无法用常理解释"的事件触发
- 渐入诡境 → 高潮惊悚：通过角色被迫正面面对灵异实体触发
- 高潮惊悚 → 舒缓喘息：通过暂时脱困或天亮来临触发
- 舒缓喘息 → 真相揭露：通过关键线索人物出现或角色主动调查触发
- 真相揭露 → 铺垫蓄势（新弧）：通过"还没结束"的暗示触发

---

### 二、恐怖元素递进设计

#### 2.1 恐怖递进阶梯

恐怖效果的核心在于**递进**——从隐约的不适到无法回避的恐惧。五级递进阶梯如下：

| 级别 | 名称 | 表现 | 读者反应 |
|------|------|------|---------|
| 1 | **不协调感** | 某个细节"不太对"，但说不上来 | 轻微不安 |
| 2 | **暗示** | 有明确的异常迹象，但未直接展示 | 疑虑加深 |
| 3 | **诡异现象** | 无法用常理解释的事件发生 | 紧张害怕 |
| 4 | **正面遭遇** | 角色直接面对灵异实体 | 强烈恐惧 |
| 5 | **全面爆发** | 灵异力量完全失控，规则崩塌 | 极度恐惧 |

**示例递进链**：

```
第1章（不协调感）：新搬来的老宅，夜里总觉得楼上有人走动，但老宅只有一层
第2章（暗示）：墙角的猫总是盯着天花板某个位置看，家里的老钟每晚3点自己响
第3章（诡异现象）：主角在半夜看到走廊尽头站着一个穿红衣的女人，但走近后消失了
第4章（正面遭遇）：红衣女人出现在主角床前，冰冷的手抚过主角的脸
第5章（全面爆发）：整栋老宅的门窗全部锁死，每个房间都出现不同的鬼影，主角被困
```

#### 2.2 五感恐怖设计

优秀的恐怖叙事调动读者的多重感官，每种感官有其对应的恐怖手法：

| 感官 | 恐怖手法 | 经典元素 | 写作要点 |
|------|---------|---------|---------|
| **视觉** | 看到不该看到的东西 | 影子不对、镜中多一个人、角落里的轮廓 | 用模糊描写制造想象空间 |
| **听觉** | 听到不该存在的声音 | 空房脚步声、耳边低语、半夜哭声 | 先写寂静，再写声音，反差感更强 |
| **嗅觉** | 闻到异常的气味 | 无来由的尸臭、突然的焚香味、腐朽味 | 嗅觉与记忆关联，可触发角色回忆 |
| **触觉** | 被不明物体触碰 | 后背的寒气、脖颈的触感、被人拉扯 | 先写物理感受，再写恐惧心理 |
| **第六感** | 直觉性的不安 | 汗毛竖起、莫名恐惧、不想回头 | 不解释原因，让读者自行脑补 |

**设计原则**：
- 每个恐怖场景至少调动两种以上感官
- 铺垫阶段用第六感和听觉（隐约的）
- 渐入诡境用视觉和嗅觉（有具体对象的）
- 高潮阶段用触觉（最直接的恐惧）
- 多种感官同时出现 = 恐怖高潮

#### 2.3 "少即是多"原则

恐怖叙事的黄金法则：**你不展示的，比你展示的更可怕**。

| 做法 | 效果 | 示例 |
|------|------|------|
| **只写反应，不写本体** | 读者自行脑补最恐怖的画面 | "他回头看了一眼，然后疯了一样往前跑" |
| **只写局部，不写全貌** | 想象力填补空白 | "月光下，他只看到那个东西的手——有六根手指" |
| **只写结果，不写过程** | 留白制造恐惧 | "第二天早上，老张的床上只剩一滩黑色的水" |
| **用日常物品制造恐怖** | 颠覆安全感 | "镜子里映出的自己，在微笑——但他没有笑" |

#### 2.4 如何填写「恐怖元素」字段

「恐怖元素」字段应描述**恐怖设计手法**，而非简单地写"有鬼"。好的填写示例：

| 差的写法 | 好的写法 |
|---------|---------|
| "有鬼出现" | "五感递进：先闻到焚香味（嗅觉），再听到念经声（听觉），最后看到香案前跪着的半透明人影（视觉），用少即是多原则只展示轮廓" |
| "主角害怕" | "鬼打墙叙事：主角连续三次走同一条路回到原点，每次路边的坟墓数量多一座，用环境变化递进制造不协调感升级为诡异现象" |
| "恐怖场景" | "民俗禁忌触发：村民集体沉默的反应暗示禁忌已被触犯，通过群体反常行为（暗示级）过渡到深夜窗外出现一排灯笼（诡异现象级）" |

#### 2.5 经典中国民间恐怖母题

创作民间灵异故事时，以下母题具有深厚的文化基础和读者共鸣：

| 母题 | 核心恐怖 | 适用场景 |
|------|---------|---------|
| **鬼打墙** | 空间循环，无法逃离 | 荒野、老宅、废弃村庄 |
| **诡异规则** | 一旦打破规则就会遭遇不测 | "不要回头"、"不要应声"、"不要照镜子" |
| **民俗禁忌违反** | 对传统的亵渎引发报应 | 动了不该动的东西、说了不该说的话 |
| **因果报应显现** | 前世或过去的罪孽追上来 | 家族秘密、被遗忘的冤案 |
| **替死鬼** | 死者需要找人替代才能投胎 | 水边、老树下、事故地点 |
| **阴阳交界** | 活人误入阴间或阴气外溢 | 黄昏时分、雾气弥漫的地点 |
| **冤魂索命** | 含冤而死的鬼魂追讨公道 | 旧案重查、废弃建筑 |
| **邪术反噬** | 使用禁术的代价 | 术士角色、禁忌仪式 |

---

### 三、悬念设置与揭露节奏

#### 3.1 悬念类型

灵异故事中的悬念分为两层：

| 类型 | 作用 | 生命周期 | 示例 |
|------|------|---------|------|
| **核心悬念** | 贯穿整个故事弧的终极谜题 | 从铺垫蓄势到真相揭露 | "老宅里到底住着什么？" |
| **章节悬念** | 单章结尾的钩子，驱动翻页 | 1-2章内必须回应 | "门外的敲门声是谁？" |

**层次关系**：核心悬念是"大洋葱"，章节悬念是每次剥开的一层皮。每个章节悬念的解答都应该让读者离核心真相更近一步，同时又产生新的疑问。

#### 3.2 "洋葱剥皮"技法

每一次揭露都应该**创造更深的谜团**，而不是简单地给出答案：

```
第1层：门外的敲门声是谁？ → 揭露：是隔壁王婶 → 新谜团：王婶为什么深夜来访？
第2层：王婶为什么深夜来访？ → 揭露：她说老宅以前死过人 → 新谜团：死的是谁？怎么死的？
第3层：死的是谁？ → 揭露：是30年前的女主人 → 新谜团：为什么她的死被所有人隐瞒？
第4层：为什么被隐瞒？ → 揭露：因为她是被家人害死的 → 新谜团：为什么害她？凶手还在吗？
第5层：终极揭露 → 她是替死鬼，一直在找替身，而主角就是她选中的人
```

#### 3.3 如何使用「悬念设置」字段

「悬念设置」字段应同时记录本章**埋下的悬念**和**揭开的悬念**：

**格式建议**：
```
【埋】悬念名称：具体描述（预计第X章揭开）
【揭】悬念名称：揭开方式和结果
```

**示例**：
```
【埋】红衣女身份：主角在镜中看到红衣女人，但无法辨认面容（预计第6章揭开）
【埋】老钟的秘密：老钟每晚3点响，暗示这个时间发生过什么（预计第4章揭开）
【揭】王婶的来意：王婶不是来串门，而是来警告主角不要住在老宅
```

同时，建议使用 `create_foreshadow` 工具将重要悬念注册为伏笔，设置 `deadlineChapter` 确保不被遗忘。

#### 3.4 揭露时机控制

| 揭露时机 | 效果 | 适用场景 |
|---------|------|---------|
| **过早揭露** | 后续失去张力 | 仅适用于章节悬念（1-2章内揭露） |
| **适时揭露** | 满足感与新期待并存 | 核心悬念的中间层（渐入诡境阶段） |
| **延迟揭露** | 焦虑感累积 | 核心悬念的终极答案（真相揭露阶段） |
| **永不揭露** | 开放式恐惧 | 次要悬念的刻意留白（细思极恐效果） |

**原则**：
- 章节悬念必须在2章内给出回应（可以是部分回应）
- 核心悬念应在真相揭露阶段给出完整答案
- 适当保留1-2个次要悬念不揭露，留下"细思极恐"的余韵

#### 3.5 "合理超自然"原则

灵异故事中的每个谜团都必须有**自洽的答案**，即使这个答案本身是超自然的。读者可以接受"因为她是冤死的所以变成厉鬼"，但无法接受"这个鬼毫无来由就出现了"。

**自洽要素**：
- **来历**：这个灵异现象的起因是什么
- **规则**：它遵循什么规则（出现条件、弱点）
- **目的**：它想要什么（复仇、替身、执念未了）
- **解法**：如何终结这个灵异事件

---

### 四、角色生死管理

#### 4.1 生命周期规划

角色的「生命周期」字段决定了角色在故事中的存活时长和叙事功能：

| 生命周期 | 叙事功能 | 死亡/退场策略 |
|---------|---------|-------------|
| **长期（幸存者/核心BOSS）** | 贯穿主线，承载核心冲突 | 最终决战或全篇存活 |
| **短期（受害者/单元反派）** | 展示恐怖后果，制造紧张感 | 在高潮阶段死亡或消灭 |
| **客串（线索人物）** | 提供关键信息后退场 | 提供线索后离开或神秘消失 |

**死亡时间表规划**：

在规划章节大纲时，应提前确定"谁在哪章死"。原则：

1. **第一个死亡**应出现在「渐入诡境」阶段，证明灵异威胁是真实的
2. **最震撼的死亡**应出现在「高潮惊悚」阶段
3. **核心角色**（长期）不应在中途死亡（除非是故事转折的需要）
4. **至少保留一个幸存者**来揭露真相

#### 4.2 当前生死状态追踪

角色的「当前生死状态」是一个动态字段，随着剧情推进变化。完整的状态链如下：

```
活着 → 死亡 → 化为替死鬼 → 已超度
              ↘ 不详（尸体未找到/生死不明）
```

**各状态的叙事含义**：

| 状态 | 叙事含义 | 对剧情的影响 |
|------|---------|-------------|
| **活着** | 角色正常存活 | 可以执行行动、提供信息 |
| **死亡** | 角色已确认死亡 | 退出主动剧情，可能以回忆/记录形式出现 |
| **化为替死鬼** | 死者变成新的灵异威胁 | 角色身份转换：从受害者变为加害者 |
| **已超度** | 冤魂得到化解 | 灵异威胁消除，故事走向收束 |
| **不详** | 生死不明 | 悬念保持，可能后续回归 |

**关键转换节点**：
- 活着 → 死亡：必须在章节中明确描写死亡过程或发现尸体
- 死亡 → 化为替死鬼：需要有转化的触发条件（怨气太重、死法太惨、有未了心愿）
- 化为替死鬼 → 已超度：需要满足超度条件（完成心愿、高人做法、因果化解）

#### 4.3 精神状态递进

角色的「精神状态」是衡量恐怖程度的**人物内部指标**。读者通过角色的精神变化感受恐怖：

```
正常 → 恐惧 → 疯癫 → 失魂 → 被附身
```

| 状态 | 表现 | 对叙事的影响 | 触发条件 |
|------|------|-------------|---------|
| **正常** | 理性思考，行动自如 | 可靠叙述者 | 初始状态 |
| **恐惧** | 判断力下降，容易恐慌 | 可能做出错误决策 | 目睹诡异现象 |
| **疯癫** | 行为失常，语无伦次 | 叙述不可靠，增加混乱感 | 连续遭遇极端恐怖 |
| **失魂** | 魂魄不全，呆滞木讷 | 无法自主行动，需他人保护 | 被灵异力量冲击 |
| **被附身** | 被外来意识控制 | 角色行为反转，可能伤害同伴 | 阳火将灭 + 灵异直接作用 |

**精神状态的叙事价值**：
- 同一事件通过不同精神状态角色的视角描写，效果完全不同
- 精神状态恶化是恐怖递进的**角色维度标尺**
- 当核心角色从"正常"变为"恐惧"，读者知道事情严重了
- 当有人"疯癫"或"失魂"，读者知道恐怖已到高潮

#### 4.4 阳火状态系统

「阳火状态」是灵异故事独有的角色属性，代表角色对超自然力量的抵抗力：

```
旺盛 → 正常 → 虚弱 → 将灭
```

| 状态 | 超自然抵抗力 | 触发条件 | 叙事效果 |
|------|------------|---------|---------|
| **旺盛** | 鬼魂难以靠近 | 性格刚烈、命格强、刚吃过荤 | 安全角色，可做前锋 |
| **正常** | 普通人水平 | 初始状态 | 标准恐怖体验 |
| **虚弱** | 更容易看见/感知灵异 | 受伤、生病、极度恐惧、独处 | 被动感知增强，更危险 |
| **将灭** | 几乎没有抵抗力 | 濒死、连续多日未进食、被施术 | 随时可能被附身，生命危险 |

**阳火与恐怖递进的联动**：
- 铺垫蓄势阶段：所有角色阳火正常
- 渐入诡境阶段：部分角色阳火变虚弱（因恐惧、受伤）
- 高潮惊悚阶段：关键角色阳火将灭，面临被附身的危险
- 舒缓喘息阶段：通过特定手段（符咒、食物、阳光）暂时恢复阳火

#### 4.5 "炮灰法则"

短期角色（受害者/单元反派）的核心叙事功能是**用自己的死亡证明危险的真实性**：

| 原则 | 说明 |
|------|------|
| **死得要有意义** | 每个死亡都应该推进剧情或揭露信息 |
| **死得要有差异** | 不同角色的死法要不同，避免重复 |
| **死得要有预兆** | 死前应有铺垫（阳火虚弱、违反禁忌、独自行动） |
| **死得要有冲击** | 至少一个死亡要超出读者预期（以为安全的角色突然死亡） |

#### 4.6 使用 `update_field_dynamic_info` 追踪角色状态

每当章节中角色的生死状态、精神状态或阳火状态发生变化时，应调用 `update_field_dynamic_info` 更新：

**更新时机**：
- 角色目睹诡异现象 → 更新精神状态（正常 → 恐惧）
- 角色受伤或极度恐惧 → 更新阳火状态（正常 → 虚弱）
- 角色死亡 → 更新当前生死状态（活着 → 死亡）
- 死者化为替死鬼 → 更新当前生死状态（死亡 → 化为替死鬼）

**格式建议**：描述变化原因和当前状态，如"第三章因目睹红衣女人而精神状态从正常变为恐惧，表现为夜间失眠、不敢独处"。

---

### 五、场景灵异活跃度管理

#### 5.1 时段作为恐怖倍增器

场景的「当前时段」字段直接影响恐怖氛围的强度：

| 时段 | 恐怖等级 | 适合的情节 | 叙事效果 |
|------|---------|----------|---------|
| **白天** | 安全（但可有暗示） | 调查、收集信息、日常 | 让读者放松，为夜晚做铺垫 |
| **黄昏** | 不安 | 诡异初现、违和感 | "阴阳交界"时分，规则开始模糊 |
| **夜晚** | 危险 | 灵异事件主要发生时段 | 视觉受限，恐惧感天然增强 |
| **子时** | 极度危险 | 高潮恐怖、正面遭遇 | 民间信仰中阴气最盛的时刻 |

**时段运用策略**：
- 铺垫蓄势阶段：白天为主，黄昏出现第一个异常
- 渐入诡境阶段：夜晚事件增多，白天也开始出现异常
- 高潮惊悚阶段：子时的正面遭遇
- 舒缓喘息阶段：天亮后的暂时安全
- 真相揭露阶段：可在任何时段（白天揭露真相有独特的冲击力）

#### 5.2 灵异活跃度递进

场景的「灵异活跃度」是衡量场景危险程度的动态指标：

```
平静 → 异动 → 活跃 → 失控
```

| 状态 | 场景表现 | 角色能做什么 | 匹配的情节节奏 |
|------|---------|------------|-------------|
| **平静** | 一切正常 | 自由活动、调查 | 铺垫蓄势 |
| **异动** | 偶尔出现无法解释的现象 | 谨慎活动，开始警觉 | 铺垫蓄势后期 / 渐入诡境 |
| **活跃** | 灵异现象频繁且明显 | 被动应对，考虑撤离 | 渐入诡境 / 高潮惊悚 |
| **失控** | 灵异力量完全主导场景 | 无法正常活动，只能求生 | 高潮惊悚 |

**跨章节的灵异活跃度曲线**：

一个灵异场景在整个故事弧中的活跃度变化应该是渐进的：

```
章1: 平静（刚到老宅，一切正常）
章2: 平静→异动（夜间听到声响）
章3: 异动（多次出现无法解释的现象）
章4: 异动→活跃（灵异现象当面发生）
章5: 活跃（频繁出现，无法忽视）
章6: 活跃→失控（所有诡异现象同时爆发）
章7: 失控→活跃（暂时压制后仍不平静）
章8: 活跃→平静（灵异根源被化解）
```

#### 5.3 使用 `update_field_dynamic_info` 追踪场景状态

每当场景的时段变化或灵异活跃度变化时，应调用 `update_field_dynamic_info` 更新：

**更新时机**：
- 章节中时段切换（白天 → 夜晚）→ 更新当前时段
- 灵异现象升级 → 更新灵异活跃度（如异动 → 活跃）
- 灵异事件被压制 → 更新灵异活跃度（如失控 → 活跃）

---

### 六、典型恐怖叙事结构

#### 6.1 三种常见结构

根据故事的整体框架，灵异故事通常采用以下三种结构之一：

**A. 单元式结构（适合长篇连载）**

```
故事弧1: 铺垫→诡境→高潮→喘息→揭露
   ↓ （新地点/新案件）
故事弧2: 铺垫→诡境→高潮→喘息→揭露
   ↓ （线索指向总BOSS）
故事弧3: 铺垫→诡境→高潮→揭露（终极真相）
```

特点：
- 每个弧是一个独立的灵异案件
- 弧与弧之间通过核心悬念串联
- 角色班底基本不变，配角轮换
- 节奏起伏明显，读者不易疲劳

**B. 密室逃脱式（适合中短篇）**

```
铺垫: 角色来到某个地点
诡境: 发现无法离开，诡异现象开始
高潮: 不断有人遇难，找不到出路
喘息: 发现规律/弱点
揭露: 理解规则后找到逃脱方法
```

特点：
- 空间封闭，压迫感强
- 角色不断减少，紧迫感递增
- 核心是"发现规则，利用规则逃脱"
- 恐怖元素集中在单一场景

**C. 探险解谜式（适合悬疑导向）**

```
铺垫: 接到线索/委托，开始调查
诡境: 调查过程中遭遇灵异
高潮: 真相涉及更大的阴谋/因果
喘息: 获得关键物品/知识
揭露: 用收集的信息解决灵异事件
```

特点：
- 主角有明确目标（调查真相）
- 恐怖与推理交替推进
- 线索人物（客串角色）频繁出现
- 适合术士/手艺人类角色

#### 6.2 如何根据故事设定选择结构

| 故事特征 | 推荐结构 | 理由 |
|---------|---------|------|
| 主角是灵异事件解决者 | 单元式 或 探险解谜式 | 主角有持续动机处理多个事件 |
| 主角是普通人被卷入 | 密室逃脱式 | 被动处境更能突出恐惧感 |
| 多个诡异事件串联 | 单元式 | 每个事件一个弧，便于管理 |
| 单一核心诡异事件 | 密室逃脱式 或 探险解谜式 | 集中火力深挖一个恐怖核心 |
| 强调民俗文化背景 | 探险解谜式 | 调查过程自然展开文化设定 |

---

### 七、工具使用指南

#### 7.1 `update_chapter_outline` — 章节恐怖设计

创建或更新章节大纲时，确保填写三个灵异专属字段：

| 字段 | 填写内容 | 填写要点 |
|------|---------|---------|
| **恐怖元素** | 本章的恐怖设计手法 | 描述具体的恐怖技法，不要只写"有鬼"；标注使用的递进级别和感官维度 |
| **情节节奏** | 五段式中的阶段 | 选择一个主要阶段，可注明过渡方向 |
| **悬念设置** | 本章埋下和揭开的悬念 | 用【埋】【揭】前缀区分，注明预计揭露章节 |

**典型填写示例**：

```
恐怖元素：不协调感→暗示递进。主角发现老宅的全家福中多了一个人（视觉+不协调感），
夜间听到阁楼有拖拽声但老宅没有阁楼（听觉+暗示）。使用"少即是多"原则，
只展示照片中多出的人影轮廓，不展示面容。

情节节奏：铺垫蓄势（末尾过渡到渐入诡境）

悬念设置：
【埋】全家福中的陌生人：照片中多出一个穿旧式衣服的女性，面容模糊（预计第4章揭开身份）
【埋】不存在的阁楼：老宅明明只有一层，为什么能听到楼上的声音（预计第3章揭开）
【揭】搬家原因：揭示前任房主为何急于低价出售（王婶暗示"住不了人"）
```

#### 7.2 `update_field_dynamic_info` — 角色与场景状态追踪

角色动态字段和场景动态字段需要随着剧情推进实时更新：

**角色动态字段**：

| 字段 | 更新时机 | 示例 |
|------|---------|------|
| 当前生死状态 | 角色死亡、化鬼、超度时 | "第5章被红衣女推下楼梯死亡，第7章化为替死鬼开始在老宅游荡" |
| 精神状态 | 角色经历恐怖事件后 | "第3章目睹诡异现象后从正常变为恐惧，表现为失眠、易怒、拒绝夜间外出" |
| 阳火状态 | 角色身体/心理状态变化时 | "第4章因连续失眠和恐惧导致阳火从正常变为虚弱，开始能看到其他人看不到的影子" |
| 当前外貌异象 | 角色出现灵异相关的外貌变化时 | "脖颈处出现不明淤青手印，瞳孔偶尔反射出不属于自己的光" |

**场景动态字段**：

| 字段 | 更新时机 | 示例 |
|------|---------|------|
| 当前时段 | 章节中时间推进时 | "第4章从黄昏推进到子时" |
| 灵异活跃度 | 灵异现象级别变化时 | "第3章从平静升级为异动：夜间出现不明脚步声、猫持续对着墙角嘶叫" |

#### 7.3 `create_plot_event` — 标记恐怖递进节点

在剧情事件中标记恐怖递进的关键节点，便于追踪恐怖曲线：

| 场景 | eventType | description 建议内容 |
|------|-----------|---------------------|
| 第一个不对劲出现 | `normal` | "恐怖递进第1级：不协调感——[具体描述]" |
| 灵异现象首次发生 | `turning_point` | "恐怖递进跳到第3级：诡异现象——[具体描述]" |
| 正面遭遇灵异实体 | `climax` | "恐怖递进第4级：正面遭遇——[具体描述]" |
| 角色死亡 | `turning_point` | "死亡事件：[角色名]因[原因]死亡，恐怖实感确认" |
| 灵异全面爆发 | `climax` | "恐怖递进第5级：全面爆发——[具体描述]" |
| 真相揭露 | `resolution` | "核心悬念揭露：[真相内容]" |

#### 7.4 `create_foreshadow` — 植入灵异伏笔

灵异故事的伏笔通常与超自然线索相关。创建伏笔时：

- `name`：用简洁的名称概括伏笔（如"全家福中的陌生人"、"子时的钟声"）
- `description`：描述伏笔内容**和预期回收方式**
- `importance`：核心悬念相关伏笔设为4-5，氛围伏笔设为1-2
- `deadlineChapter`：灵异故事的伏笔不宜拖太久，建议在5章内回收

**灵异故事常见伏笔类型**：

| 类型 | 示例 | 回收方式 |
|------|------|---------|
| 规则伏笔 | 村民说"天黑后不要开门" | 有人违反规则后遭遇不测 |
| 身份伏笔 | 某个角色的真实身份不是人类 | 通过镜子/照片/影子揭露 |
| 历史伏笔 | 30年前这里发生过什么 | 通过老人口述/旧档案/梦境揭露 |
| 物品伏笔 | 一个不该出现在这里的老物件 | 物件的来历与灵异事件的起因关联 |
| 环境伏笔 | 某个地方总是特别冷/有异味 | 该位置是灵异核心/埋尸地点 |',
  '## Horror Narrative and Pacing Control

This skill is designed specifically for the "Folk Supernatural Story Creation" method. It guides you in using the method''s unique chapter fields (Horror Elements, Plot Rhythm, Suspense Setup) and character/scene dynamic fields (Life-Death Status, Mental State, Yang Fire Status, Supernatural Activity Level) to construct layered, well-paced horror narratives.

---

### Section 1: Five-Phase Rhythm Design

#### 1.1 Five-Phase Overview

The plot rhythm of folk supernatural stories is controlled by the "Plot Rhythm" field, comprising five phases:

| Phase | Narrative Purpose | Reader Experience |
|-------|------------------|-------------------|
| **Building Tension** | Establish normalcy, introduce the first "something is off" | Subtle unease, curiosity piqued |
| **Entering the Uncanny** | Supernatural phenomena escalate, rules emerge | Rising tension, growing fear |
| **Horror Climax** | Full-blown supernatural confrontation | Heart racing, extreme fear |
| **Breathing Space** | Temporary escape from danger, gather clues | Brief relief, lingering dread |
| **Truth Revealed** | Uncover the cause-and-effect behind the supernatural event | Sudden realization, creeping horror |

#### 1.2 The Five Phases Are Not Linear

These five phases describe the rhythm distribution of the **entire story arc**, not a sequence each chapter must follow. A complete supernatural story arc typically distributes like this:

```
Ch 1-3: Building Tension
Ch 4-5: Entering the Uncanny
Ch 6:   Horror Climax
Ch 7:   Breathing Space
Ch 8-9: Truth Revealed
```

**But in practice, rhythms can interweave**:
- After a Horror Climax, there can be a brief Breathing Space followed by an even stronger climax
- The Entering the Uncanny phase can include Building Tension moments (new anomalies appear)
- Truth Revealed can span multiple chapters (peeling back layers)

#### 1.3 Golden Ratio Reference

For a typical supernatural story arc, recommended chapter proportions for each phase:

| Phase | Ratio | 9-Chapter Example | Notes |
|-------|-------|-------------------|-------|
| Building Tension | 3/9 | 3 chapters | Thorough setup makes subsequent horror more impactful |
| Entering the Uncanny | 2/9 | 2 chapters | The horror escalation phase |
| Horror Climax | 1/9 | 1 chapter | Quality over quantity — one decisive strike |
| Breathing Space | 1/9 | 1 chapter | Let both readers and characters catch their breath |
| Truth Revealed | 2/9 | 2 chapters | Provide causality, leave lingering resonance |

This ratio can be adjusted based on story type:
- **Fast-paced stories**: Compress Building Tension (2 chapters), increase Entering the Uncanny and Climax
- **Mystery-oriented stories**: Extend Truth Revealed (3 chapters), reduce Horror Climax
- **Atmospheric horror stories**: Extend Building Tension (4 chapters), delay the climax to the very end

#### 1.4 Using `update_chapter_outline` to Set Plot Rhythm

When setting the plot rhythm for each chapter, clearly mark which phase the chapter belongs to in the outline and fill in the supplementary fields of `update_chapter_outline`:

- **Plot Rhythm**: Select one of the five enum values (Building Tension / Entering the Uncanny / Horror Climax / Breathing Space / Truth Revealed)
- A chapter can only have one primary rhythm, but you can note in the outline "primarily Building Tension, transitioning to Entering the Uncanny at the end"

**Rhythm Transition Triggers**:
- Building Tension to Entering the Uncanny: An event that cannot be rationally explained
- Entering the Uncanny to Horror Climax: Characters forced to directly face a supernatural entity
- Horror Climax to Breathing Space: Temporary escape or dawn arriving
- Breathing Space to Truth Revealed: Appearance of a key informant or characters actively investigating
- Truth Revealed to Building Tension (new arc): A hint that "it''s not over yet"

---

### Section 2: Horror Element Escalation Design

#### 2.1 The Horror Escalation Ladder

The key to effective horror is **escalation** — from vague discomfort to inescapable dread. The five-level escalation ladder:

| Level | Name | Manifestation | Reader Reaction |
|-------|------|---------------|-----------------|
| 1 | **Incongruity** | A detail is "not quite right" but hard to pinpoint | Mild unease |
| 2 | **Suggestion** | Clear signs of abnormality without direct display | Growing suspicion |
| 3 | **Uncanny Phenomenon** | Events that defy rational explanation | Tense and afraid |
| 4 | **Direct Encounter** | Characters face a supernatural entity head-on | Intense fear |
| 5 | **Full Eruption** | Supernatural forces completely out of control, rules collapse | Extreme terror |

**Example escalation chain**:

```
Ch 1 (Incongruity): The newly moved-into old house — footsteps upstairs at night, but the house has only one floor
Ch 2 (Suggestion): The cat always stares at one spot on the ceiling; the old clock chimes on its own at 3 AM every night
Ch 3 (Uncanny Phenomenon): The protagonist sees a woman in red standing at the end of the hallway at midnight, but she vanishes when approached
Ch 4 (Direct Encounter): The woman in red appears at the protagonist''s bedside, her icy hand touching their face
Ch 5 (Full Eruption): All doors and windows of the entire house lock themselves; different ghostly figures appear in every room; the protagonist is trapped
```

#### 2.2 Five-Senses Horror Design

Excellent horror narratives engage multiple senses. Each sense has corresponding horror techniques:

| Sense | Horror Technique | Classic Elements | Writing Tips |
|-------|-----------------|------------------|-------------|
| **Visual** | Seeing what shouldn''t be seen | Wrong shadows, extra reflection in mirror, silhouette in the corner | Use vague descriptions to create imaginative space |
| **Auditory** | Hearing sounds that shouldn''t exist | Footsteps in an empty room, whispers in the ear, crying at midnight | Write silence first, then the sound — the contrast amplifies the effect |
| **Olfactory** | Smelling abnormal odors | Inexplicable corpse stench, sudden incense smell, smell of decay | Smell links to memory; can trigger character flashbacks |
| **Tactile** | Being touched by unknown entities | Cold on the back, sensation on the neck, being pulled | Write the physical sensation first, then the psychological fear |
| **Sixth Sense** | Intuitive unease | Hair standing on end, inexplicable fear, not wanting to turn around | Don''t explain the cause; let readers fill in the blanks |

**Design principles**:
- Each horror scene should engage at least two senses
- Building Tension phase: Use sixth sense and auditory (subtle)
- Entering the Uncanny phase: Use visual and olfactory (with concrete objects)
- Horror Climax phase: Use tactile (the most direct form of fear)
- Multiple senses simultaneously = horror climax

#### 2.3 The "Less is More" Principle

The golden rule of horror narrative: **What you don''t show is scarier than what you show**.

| Technique | Effect | Example |
|-----------|--------|---------|
| **Show only reactions, not the entity** | Readers imagine the scariest possible image | "He glanced back, then ran as if he''d gone mad" |
| **Show only a part, not the whole** | Imagination fills the gaps | "In the moonlight, he could only see its hand — it had six fingers" |
| **Show only results, not the process** | Blank spaces create dread | "The next morning, Old Zhang''s bed had nothing but a pool of black water" |
| **Use everyday objects for horror** | Subverts the sense of safety | "His reflection in the mirror was smiling — but he wasn''t" |

#### 2.4 How to Fill the "Horror Elements" Field

The "Horror Elements" field should describe **horror design techniques**, not simply "there''s a ghost." Good examples:

| Poor | Good |
|------|------|
| "Ghost appears" | "Five-senses escalation: first the smell of incense (olfactory), then the sound of chanting (auditory), finally a translucent figure kneeling before the altar (visual). Using the less-is-more principle, only show the silhouette" |
| "Protagonist is scared" | "Ghost Wall narrative: protagonist walks the same path three times and returns to the starting point, each time with one more grave appearing roadside. Using environmental changes to escalate from Incongruity to Uncanny Phenomenon" |
| "Horror scene" | "Folk taboo trigger: villagers'' collective silence suggests a taboo has been violated. Transitioning through group abnormal behavior (Suggestion level) to a row of lanterns appearing outside the window at night (Uncanny Phenomenon level)" |

#### 2.5 Classic Chinese Folk Horror Motifs

When creating folk supernatural stories, the following motifs have deep cultural roots and reader resonance:

| Motif | Core Horror | Applicable Scenarios |
|-------|------------|---------------------|
| **Ghost Wall (Gui Da Qiang)** | Spatial loop, unable to escape | Wilderness, old houses, abandoned villages |
| **Eerie Rules** | Breaking a rule leads to doom | "Don''t look back," "Don''t answer," "Don''t look in the mirror" |
| **Folk Taboo Violation** | Desecrating tradition triggers retribution | Touching forbidden things, speaking forbidden words |
| **Karmic Retribution** | Past sins catching up | Family secrets, forgotten injustices |
| **Substitute Ghost (Ti Si Gui)** | The dead need a replacement to reincarnate | Near water, under old trees, accident sites |
| **Yin-Yang Boundary** | Living people entering the spirit realm or yin energy leaking | At dusk, fog-covered locations |
| **Wronged Spirit** | An unjustly killed ghost seeking justice | Cold case reopened, abandoned buildings |
| **Sorcery Backlash** | The cost of using forbidden arts | Sorcerer characters, forbidden rituals |

---

### Section 3: Suspense Setup and Revelation Pacing

#### 3.1 Types of Suspense

Suspense in supernatural stories operates on two levels:

| Type | Function | Lifecycle | Example |
|------|----------|-----------|---------|
| **Core Suspense** | The ultimate mystery spanning the entire story arc | From Building Tension to Truth Revealed | "What exactly lives in the old house?" |
| **Chapter Suspense** | End-of-chapter hooks that drive page-turning | Must be addressed within 1-2 chapters | "Who is knocking at the door?" |

**Layered relationship**: Core suspense is the "big onion"; chapter suspenses are layers peeled off each time. Each chapter suspense resolution should bring readers closer to the core truth while generating new questions.

#### 3.2 The "Onion Peeling" Technique

Each revelation should **create a deeper mystery**, not simply provide an answer:

```
Layer 1: Who is knocking? → Reveal: It''s Aunt Wang from next door → New mystery: Why is she visiting at midnight?
Layer 2: Why the midnight visit? → Reveal: She says someone died in the house before → New mystery: Who died? How?
Layer 3: Who died? → Reveal: The mistress of the house 30 years ago → New mystery: Why was her death covered up by everyone?
Layer 4: Why the cover-up? → Reveal: She was killed by her own family → New mystery: Why did they kill her? Is the killer still around?
Layer 5: Ultimate reveal → She''s a substitute ghost, always looking for a replacement, and the protagonist is her chosen one
```

#### 3.3 How to Use the "Suspense Setup" Field

The "Suspense Setup" field should record both suspense **planted** and suspense **revealed** in the chapter:

**Suggested format**:
```
[PLANT] Suspense name: Specific description (expected to reveal in Chapter X)
[REVEAL] Suspense name: How it was revealed and the result
```

**Example**:
```
[PLANT] Red Woman''s Identity: Protagonist sees a woman in red in the mirror but cannot make out her face (expected reveal in Ch 6)
[PLANT] The Old Clock''s Secret: The clock chimes at 3 AM every night, hinting something happened at this time (expected reveal in Ch 4)
[REVEAL] Aunt Wang''s Purpose: She didn''t come for a casual visit — she came to warn the protagonist not to live in the old house
```

Also, use `create_foreshadow` to register important suspense points as foreshadows with `deadlineChapter` to ensure they are not forgotten.

#### 3.4 Revelation Timing Control

| Timing | Effect | Applicable Scenario |
|--------|--------|---------------------|
| **Too early** | Subsequent chapters lose tension | Only suitable for chapter suspense (reveal within 1-2 chapters) |
| **Well-timed** | Satisfaction coexists with new anticipation | Middle layers of core suspense (Entering the Uncanny phase) |
| **Delayed** | Anxiety accumulates | Core suspense''s ultimate answer (Truth Revealed phase) |
| **Never revealed** | Open-ended horror | Deliberate ambiguity of secondary suspense (creeping horror effect) |

**Principles**:
- Chapter suspense must receive a response within 2 chapters (can be a partial response)
- Core suspense should receive a complete answer during the Truth Revealed phase
- Deliberately leave 1-2 secondary suspenses unresolved for lingering "the more you think about it, the scarier it gets" effect

#### 3.5 The "Rational Supernatural" Principle

Every mystery in a supernatural story must have a **self-consistent answer**, even if that answer is itself supernatural. Readers can accept "she became a vengeful ghost because she was murdered unjustly," but cannot accept "this ghost appeared for no reason at all."

**Self-consistency elements**:
- **Origin**: What caused this supernatural phenomenon
- **Rules**: What rules does it follow (appearance conditions, weaknesses)
- **Purpose**: What does it want (revenge, replacement, unfinished business)
- **Resolution**: How to end this supernatural event

---

### Section 4: Character Life-Death Management

#### 4.1 Lifecycle Planning

The character''s "Lifecycle" field determines how long they survive in the story and their narrative function:

| Lifecycle | Narrative Function | Death/Exit Strategy |
|-----------|-------------------|---------------------|
| **Long-term (Survivor/Core Boss)** | Carries the main conflict throughout | Final showdown or survives the entire story |
| **Short-term (Victim/Unit Antagonist)** | Demonstrates horror consequences, creates tension | Dies during the climax phase |
| **Cameo (Clue Character)** | Provides key information then exits | Leaves after providing clues or mysteriously disappears |

**Death Schedule Planning**:

When planning chapter outlines, determine "who dies in which chapter" in advance. Principles:

1. **First death** should occur in the "Entering the Uncanny" phase, proving the supernatural threat is real
2. **Most shocking death** should occur in the "Horror Climax" phase
3. **Core characters** (long-term) should not die mid-story (unless required for a plot twist)
4. **Keep at least one survivor** to reveal the truth

#### 4.2 Life-Death Status Tracking

The character''s "Current Life-Death Status" is a dynamic field that changes as the plot progresses. The complete status chain:

```
Alive → Dead → Became Substitute Ghost → Transcended
             ↘ Unknown (body not found / fate uncertain)
```

**Narrative meaning of each status**:

| Status | Narrative Meaning | Impact on Plot |
|--------|------------------|----------------|
| **Alive** | Character is living normally | Can take actions, provide information |
| **Dead** | Character is confirmed dead | Exits active plot; may appear in flashbacks/records |
| **Became Substitute Ghost** | The dead person becomes a new supernatural threat | Character role reversal: from victim to perpetrator |
| **Transcended** | The wronged spirit has been resolved | Supernatural threat eliminated, story moves toward closure |
| **Unknown** | Fate uncertain | Suspense maintained; possible later return |

**Key transition triggers**:
- Alive to Dead: Must explicitly describe the death process or the discovery of the body in the chapter
- Dead to Became Substitute Ghost: Requires a transformation trigger (excessive resentment, horrific manner of death, unfinished business)
- Became Substitute Ghost to Transcended: Requires meeting transcendence conditions (fulfilling the wish, ritual by an expert, karmic resolution)

#### 4.3 Mental State Escalation

A character''s "Mental State" is the **internal character indicator** measuring horror intensity. Readers experience horror through characters'' mental deterioration:

```
Normal → Fearful → Deranged → Soul-Lost → Possessed
```

| State | Manifestation | Impact on Narrative | Trigger Condition |
|-------|--------------|---------------------|-------------------|
| **Normal** | Rational thinking, free movement | Reliable narrator | Initial state |
| **Fearful** | Impaired judgment, prone to panic | May make wrong decisions | Witnessing uncanny phenomena |
| **Deranged** | Erratic behavior, incoherent speech | Unreliable narration, increases chaos | Continuous exposure to extreme horror |
| **Soul-Lost** | Incomplete soul, dull and unresponsive | Cannot act independently, needs protection | Struck by supernatural force |
| **Possessed** | Controlled by an external consciousness | Character behavior reversal, may harm companions | Yang Fire nearly extinguished + direct supernatural influence |

**Narrative value of mental states**:
- The same event described from perspectives of characters in different mental states produces entirely different effects
- Mental deterioration is the **character-dimension gauge** of horror escalation
- When the core character shifts from "Normal" to "Fearful," readers know things are serious
- When someone becomes "Deranged" or "Soul-Lost," readers know the horror has reached its peak

#### 4.4 Yang Fire Status System

"Yang Fire Status" is a character attribute unique to supernatural stories, representing the character''s resistance to supernatural forces:

```
Vigorous → Normal → Weak → Nearly Extinguished
```

| Status | Supernatural Resistance | Trigger Conditions | Narrative Effect |
|--------|------------------------|-------------------|-----------------|
| **Vigorous** | Ghosts find it difficult to approach | Strong temperament, powerful fate, recently ate meat | Safe character, can take the lead |
| **Normal** | Average human level | Initial state | Standard horror experience |
| **Weak** | More likely to see/sense supernatural entities | Injured, ill, extreme fear, alone | Enhanced passive perception, more dangerous |
| **Nearly Extinguished** | Almost no resistance | Near death, days without eating, targeted by sorcery | Can be possessed at any moment, life in danger |

**Yang Fire and horror escalation synergy**:
- Building Tension phase: All characters have Normal Yang Fire
- Entering the Uncanny phase: Some characters'' Yang Fire becomes Weak (due to fear, injury)
- Horror Climax phase: Key characters'' Yang Fire is Nearly Extinguished, facing possession risk
- Breathing Space phase: Temporarily restore Yang Fire through specific means (talismans, food, sunlight)

#### 4.5 The "Cannon Fodder Rule"

The core narrative function of short-term characters (victims/unit antagonists) is to **prove the danger is real through their own death**:

| Principle | Explanation |
|-----------|-------------|
| **Death must have meaning** | Every death should advance the plot or reveal information |
| **Deaths must be varied** | Different characters should die in different ways; avoid repetition |
| **Death must be foreshadowed** | There should be setup before death (Weak Yang Fire, taboo violation, acting alone) |
| **Death must have impact** | At least one death should exceed reader expectations (a seemingly safe character suddenly dies) |

#### 4.6 Using `update_field_dynamic_info` to Track Character State

Whenever a character''s life-death status, mental state, or Yang Fire status changes in a chapter, call `update_field_dynamic_info` to update:

**When to update**:
- Character witnesses uncanny phenomena → Update mental state (Normal to Fearful)
- Character is injured or extremely frightened → Update Yang Fire status (Normal to Weak)
- Character dies → Update current life-death status (Alive to Dead)
- Dead character becomes a substitute ghost → Update current life-death status (Dead to Became Substitute Ghost)

**Format suggestion**: Describe the reason for the change and the current status, e.g., "In Chapter 3, after witnessing the woman in red, mental state changed from Normal to Fearful, manifesting as insomnia and refusal to be alone at night."

---

### Section 5: Scene Supernatural Activity Management

#### 5.1 Time Period as Horror Multiplier

The scene''s "Current Time Period" field directly affects the intensity of the horror atmosphere:

| Time Period | Horror Level | Suitable Plot | Narrative Effect |
|-------------|-------------|---------------|-----------------|
| **Daytime** | Safe (but can have hints) | Investigation, gathering information, daily life | Let readers relax, set up for nighttime |
| **Dusk** | Uneasy | First appearance of the uncanny, sense of wrongness | The "yin-yang boundary" hour; rules begin to blur |
| **Nighttime** | Dangerous | Primary time for supernatural events | Limited visibility naturally heightens fear |
| **Witching Hour (Zi Shi)** | Extremely dangerous | Horror climax, direct encounters | The moment when yin energy is strongest in folk belief |

**Time period usage strategy**:
- Building Tension: Primarily daytime; first anomaly appears at dusk
- Entering the Uncanny: Nighttime events increase; anomalies begin during daytime too
- Horror Climax: Direct encounter during the Witching Hour
- Breathing Space: Temporary safety after dawn
- Truth Revealed: Can occur at any time period (daytime truth reveals have unique impact)

#### 5.2 Supernatural Activity Escalation

The scene''s "Supernatural Activity Level" is a dynamic indicator measuring scene danger:

```
Calm → Stirring → Active → Out of Control
```

| Status | Scene Behavior | What Characters Can Do | Matching Plot Rhythm |
|--------|---------------|----------------------|---------------------|
| **Calm** | Everything normal | Move freely, investigate | Building Tension |
| **Stirring** | Occasional inexplicable phenomena | Move cautiously, becoming alert | Late Building Tension / Entering the Uncanny |
| **Active** | Frequent and obvious supernatural phenomena | Reactive only, considering evacuation | Entering the Uncanny / Horror Climax |
| **Out of Control** | Supernatural forces completely dominate the scene | Cannot function normally, survival only | Horror Climax |

**Cross-chapter supernatural activity curve**:

A supernatural scene''s activity level across the entire story arc should be gradual:

```
Ch 1: Calm (just arrived at the old house, everything normal)
Ch 2: Calm → Stirring (sounds at night)
Ch 3: Stirring (multiple inexplicable phenomena)
Ch 4: Stirring → Active (supernatural phenomena happen in plain sight)
Ch 5: Active (frequent, impossible to ignore)
Ch 6: Active → Out of Control (all uncanny phenomena erupt simultaneously)
Ch 7: Out of Control → Active (still unsettled after temporary suppression)
Ch 8: Active → Calm (supernatural root cause is resolved)
```

#### 5.3 Using `update_field_dynamic_info` to Track Scene State

Whenever a scene''s time period changes or supernatural activity level changes, call `update_field_dynamic_info` to update:

**When to update**:
- Time period shifts within a chapter (Daytime to Nighttime) → Update current time period
- Supernatural phenomena escalate → Update supernatural activity level (e.g., Stirring to Active)
- Supernatural events are suppressed → Update supernatural activity level (e.g., Out of Control to Active)

---

### Section 6: Typical Horror Narrative Structures

#### 6.1 Three Common Structures

Based on the overall story framework, supernatural stories typically adopt one of three structures:

**A. Episodic Structure (Suitable for serialized long-form)**

```
Arc 1: Building Tension → Uncanny → Climax → Breathing Space → Truth Revealed
   ↓ (new location/new case)
Arc 2: Building Tension → Uncanny → Climax → Breathing Space → Truth Revealed
   ↓ (clues point to the ultimate Boss)
Arc 3: Building Tension → Uncanny → Climax → Truth Revealed (ultimate truth)
```

Characteristics:
- Each arc is an independent supernatural case
- Arcs are connected through core suspense
- Core cast remains; supporting characters rotate
- Clear rhythm ups and downs; readers don''t tire easily

**B. Locked Room/Escape Structure (Suitable for novellas and short stories)**

```
Building Tension: Characters arrive at a location
Entering the Uncanny: Discover they cannot leave; supernatural phenomena begin
Horror Climax: People keep getting killed; no exit found
Breathing Space: Discover a pattern/weakness
Truth Revealed: Understanding the rules leads to escape
```

Characteristics:
- Enclosed space creates strong pressure
- Characters decrease over time, increasing urgency
- Core is "discover the rules, use the rules to escape"
- Horror elements concentrated in a single scene

**C. Investigation/Puzzle Structure (Suitable for mystery-oriented)**

```
Building Tension: Receive a clue/commission, begin investigation
Entering the Uncanny: Encounter supernatural during investigation
Horror Climax: Truth involves a larger conspiracy/karmic chain
Breathing Space: Obtain key item/knowledge
Truth Revealed: Use gathered information to resolve the supernatural event
```

Characteristics:
- Protagonist has a clear goal (investigate the truth)
- Horror and deduction alternate
- Clue characters (cameo roles) appear frequently
- Well-suited for sorcerer/craftsman-type characters

#### 6.2 How to Choose a Structure Based on Story Settings

| Story Feature | Recommended Structure | Reasoning |
|---------------|----------------------|-----------|
| Protagonist is a supernatural problem solver | Episodic or Investigation/Puzzle | Protagonist has ongoing motivation to handle multiple cases |
| Protagonist is an ordinary person dragged in | Locked Room/Escape | Passive situation better highlights fear |
| Multiple supernatural events linked together | Episodic | One arc per event, easy to manage |
| Single core supernatural event | Locked Room/Escape or Investigation/Puzzle | Concentrated effort to deeply explore one horror core |
| Emphasis on folk cultural background | Investigation/Puzzle | Investigation naturally unfolds cultural settings |

---

### Section 7: Tool Usage Guide

#### 7.1 `update_chapter_outline` — Chapter Horror Design

When creating or updating chapter outlines, ensure you fill in the three supernatural-specific fields:

| Field | Content | Key Points |
|-------|---------|-----------|
| **Horror Elements** | The horror design techniques for this chapter | Describe specific horror techniques, not just "there''s a ghost"; note the escalation level and sensory dimensions used |
| **Plot Rhythm** | The phase within the five-phase system | Select one primary phase; may note transition direction |
| **Suspense Setup** | Suspense planted and revealed in this chapter | Use [PLANT] and [REVEAL] prefixes; note expected reveal chapter |

**Typical example**:

```
Horror Elements: Incongruity → Suggestion escalation. Protagonist discovers an extra person
in the old house''s family photo (visual + Incongruity). At night, dragging sounds from an
attic that doesn''t exist (auditory + Suggestion). Using the "less is more" principle,
only showing the silhouette of the extra person in the photo, not the face.

Plot Rhythm: Building Tension (transitioning to Entering the Uncanny at the end)

Suspense Setup:
[PLANT] Stranger in the Family Photo: An extra woman in old-fashioned clothes appears in the
photo with a blurred face (expected reveal in Ch 4)
[PLANT] The Non-Existent Attic: The house clearly has only one floor, so why are there sounds
from above? (expected reveal in Ch 3)
[REVEAL] Reason for Moving: Revealed why the previous owner was desperate to sell at a low
price (Aunt Wang hints "no one can live there")
```

#### 7.2 `update_field_dynamic_info` — Character and Scene State Tracking

Character dynamic fields and scene dynamic fields need real-time updates as the plot progresses:

**Character dynamic fields**:

| Field | When to Update | Example |
|-------|---------------|---------|
| Current Life-Death Status | When character dies, becomes ghost, or is transcended | "Died in Ch 5 after being pushed down stairs by the woman in red; became a substitute ghost in Ch 7, now roaming the old house" |
| Mental State | After character experiences horror events | "Changed from Normal to Fearful in Ch 3 after witnessing uncanny phenomena; manifests as insomnia, irritability, refusing to go out at night" |
| Yang Fire Status | When character''s physical/mental state changes | "Yang Fire changed from Normal to Weak in Ch 4 due to continuous insomnia and fear; can now see shadows others cannot see" |
| Current Appearance Anomaly | When character shows supernatural-related appearance changes | "Unexplained bruise marks shaped like handprints on the neck; pupils occasionally reflect light that doesn''t belong to the character" |

**Scene dynamic fields**:

| Field | When to Update | Example |
|-------|---------------|---------|
| Current Time Period | When time advances within a chapter | "Ch 4 progressed from Dusk to Witching Hour" |
| Supernatural Activity Level | When supernatural phenomena level changes | "Upgraded from Calm to Stirring in Ch 3: footsteps at night, cat continuously hissing at a wall corner" |

#### 7.3 `create_plot_event` — Marking Horror Escalation Points

Mark key horror escalation points in plot events for tracking the horror curve:

| Scenario | eventType | Suggested description Content |
|----------|-----------|------------------------------|
| First anomaly appears | `normal` | "Horror escalation Level 1: Incongruity — [specific description]" |
| First supernatural phenomenon | `turning_point` | "Horror escalation jumps to Level 3: Uncanny Phenomenon — [specific description]" |
| Direct supernatural encounter | `climax` | "Horror escalation Level 4: Direct Encounter — [specific description]" |
| Character death | `turning_point` | "Death event: [character name] died due to [cause], confirming the horror is real" |
| Full supernatural eruption | `climax` | "Horror escalation Level 5: Full Eruption — [specific description]" |
| Truth revealed | `resolution` | "Core suspense revealed: [truth content]" |

#### 7.4 `create_foreshadow` — Planting Supernatural Clues

Foreshadows in supernatural stories are usually related to supernatural clues. When creating foreshadows:

- `name`: Use a concise name summarizing the foreshadow (e.g., "Stranger in the Family Photo," "The Witching Hour Chimes")
- `description`: Describe the foreshadow content **and expected resolution method**
- `importance`: Set core suspense-related foreshadows to 4-5; atmospheric foreshadows to 1-2
- `deadlineChapter`: Supernatural story foreshadows should not drag too long; recommend resolution within 5 chapters

**Common foreshadow types in supernatural stories**:

| Type | Example | Resolution Method |
|------|---------|-------------------|
| Rule Foreshadow | Villagers say "don''t open the door after dark" | Someone violates the rule and suffers consequences |
| Identity Foreshadow | A character''s true identity is not human | Revealed through mirror/photo/shadow |
| History Foreshadow | Something happened here 30 years ago | Revealed through elder''s account/old records/dreams |
| Object Foreshadow | An old item that shouldn''t be here | The item''s origin connects to the supernatural event''s cause |
| Environment Foreshadow | A place that is always unusually cold or has a strange smell | The location is the supernatural core/burial site |',

  (SELECT id FROM novel_creation_method WHERE name = '民间灵异故事创作' LIMIT 1),
  1,
  100,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  is_active = VALUES(is_active),
  sort_order = VALUES(sort_order);
