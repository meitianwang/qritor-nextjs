-- 民间灵异故事创作：灵异世界观与规则设计 Skill
-- novel_creation_method_id 通过子查询关联到"民间灵异故事创作"(method 47)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-lingyi-world-design.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'lingyi-world-design',
  '灵异世界观与规则设计：构建民间灵异故事的世界观体系、核心禁忌规则、角色因果链、场景风水格局和道具法器体系',
  'Supernatural world-building and rule design: build the worldview system, core taboo rules, character karma chains, scene feng shui layouts, and prop/artifact systems for Chinese folk horror stories',
  '## 灵异世界观与规则设计技能

本技能专为"民间灵异故事创作"方法设计，指导你构建一个自洽的灵异世界观。涵盖世界设定模块的完整设计方法论、核心禁忌规则的层级结构、角色因果链的驱动逻辑、场景风水格局的恐怖氛围营造，以及道具法器体系的平衡设计。

---

### 一、灵异世界观构建方法论

灵异故事的世界观是所有恐怖元素的根基。"世界"设定模块包含八个核心字段，它们之间存在严格的因果推导关系，必须按照正确的逻辑链条依次设计。

#### 1.1 设计顺序与字段依赖关系

```
世界名称（定调）
  → 地理与风水格局（决定灵异的物理基础）
    → 时代与社会背景（决定人物认知边界）
      → 核心禁忌与规则（世界观的灵魂）
        → 灵异生态（规则下的产物）
          → 玄学/职业体系（对抗灵异的手段）
            → 民俗仪式（人与灵异的界面）
              → 供奉与交易物（经济系统）
```

**关键依赖**：
- 「地理与风水格局」决定了灵异能量的分布方式，直接影响「灵异生态」中出现什么类型的诡异
- 「灵异生态」决定了人类需要什么样的「玄学/职业体系」来应对
- 「核心禁忌与规则」是统领一切的规则引擎，所有灵异现象和人物行为都必须在这套规则内自洽

#### 1.2 各字段设计要点

**世界名称**：
- 不是简单起个名字，而是为整个世界定调
- 好的名称能暗示世界的核心特征，如"九幽封门镇"暗示封闭与阴气，"鬼市"暗示阴阳并存的交易空间
- 使用 `get_setting_type_schema` 获取"世界"模块的完整字段定义后，先填写世界名称确定基调

**地理与风水格局**：
- 灵异故事的地理不是普通地理，而是"风水地理"
- 必须包含：龙脉走向、水口位置、阴阳分界、气场分布
- 地理格局决定了故事发生的空间逻辑。例如：群山环绕的盆地形成"聚阴之地"，河流改道形成"截龙断脉"
- 设计技巧：先画出大的风水格局，再在关键节点（龙穴、水口、煞位）安排场景

**时代与社会背景**：
- 时代背景决定了角色面对灵异时的认知框架和应对手段
- 民国时期：新旧交替，科学与迷信冲突，适合"理性人遭遇不可解释之事"的叙事
- 当代都市：信息时代与古老诡异的碰撞，适合"都市传说"型叙事
- 古代乡村：封闭社会中的集体恐惧，适合"封建迷信背后有真东西"的叙事
- 社会背景要明确：当地人的信仰体系、官方态度、普通人的认知水平

**核心禁忌与规则**：
- 这是灵异故事世界观中**最重要**的字段，详见第二节专门讲解

**灵异生态**：
- 不是简单列出几种鬼怪，而是建立一个"生态系统"
- 灵异生态应回答：这个世界有哪些类型的灵异存在？它们如何产生？彼此之间有什么食物链/层级关系？与人类世界如何互动？
- 灵异层级示例：残念（无意识残留）→ 怨灵（有执念的亡魂）→ 厉鬼（有能力的恶灵）→ 诡异（超越善恶的存在）
- 灵异生态必须与「地理与风水格局」对应：阴气重的地方产生怨灵，龙脉断裂处产生诡异

**玄学/职业体系**：
- 人类对抗灵异的手段体系，必须与「灵异生态」形成对应
- 常见类型：茅山道士、赶尸匠、阴阳先生、扎纸匠、神婆、风水师
- 每种职业应有明确的：能力范围、修行路径、代价与禁忌、与灵异的交互方式
- 重要原则：人类的对抗手段不能太强，要保持"恐怖感"——即便是最强的手艺人，面对高阶诡异也应有无力感

**民俗仪式**：
- 人类与灵异之间的"协议执行方式"
- 包含：祭祀（单向供奉）、请神/送神（双向交互）、镇压（强制控制）、超度（解决怨念）
- 仪式必须有严格的步骤和禁忌，仪式失败应有明确的后果
- 好的仪式设计能成为故事的高潮场景

**供奉与交易物**：
- 灵异世界的"经济系统"
- 分类：阴间通货（纸钱、寒衣等）、人间祭品（香烛、牲畜等）、特殊交易物（寿命、精气、记忆等）
- 交易规则：等价交换原则、违约惩罚机制、中间人角色
- 这个字段为道具系统和故事冲突提供经济基础

#### 1.3 三种常见世界观模板

**封门村型**：
- 特征：封闭地理 + 古老禁忌 + 代代相传的秘密
- 核心冲突：外来者闯入 vs 村庄的封闭规则
- 风水格局：群山封锁、单一出入口、村中心有"镇压物"
- 灵异生态：以地缚灵、祖灵、村落守护诡异为主
- 适合：中长篇探秘型叙事

**都市诡异型**：
- 特征：现代都市 + 隐藏的灵异空间 + 规则怪谈
- 核心冲突：日常生活被灵异规则入侵
- 风水格局：城市建设破坏了原有风水，形成新的灵异节点
- 灵异生态：都市型诡异（电梯鬼、楼道怪谈、地铁幽灵）
- 适合：短篇规则怪谈、都市恐怖系列

**民国古镇型**：
- 特征：新旧交替时代 + 宗族社会 + 半信半疑的叙事视角
- 核心冲突：现代理性 vs 古老灵异
- 风水格局：依山傍水的古镇，有古老的祠堂和禁地
- 灵异生态：以家族诅咒、祠堂亡魂、风水局中的灵异为主
- 适合：民国悬疑灵异长篇

#### 1.4 操作指南

设计世界观时的工具使用流程：

**Step 1**：调用 `get_setting_type_schema` 传入"世界"（或对应模块类型名称），获取完整字段定义

**Step 2**：按照 1.1 的设计顺序，逐字段与用户讨论并填写

**Step 3**：调用 `update_setting` 将世界设定写入系统
- 可以分批次写入，先填写前几个字段，后续补充
- 每次写入时传入完整的当前状态（增量更新）

**Step 4**：设计完成后回顾整体一致性
- 检查：灵异生态是否与地理格局对应？
- 检查：职业体系是否与灵异生态匹配？
- 检查：核心规则是否贯穿所有要素？

---

### 二、核心禁忌与规则设计

"核心禁忌与规则"是灵异故事世界观的灵魂字段。好的规则设计能让故事产生"细思恐极"的效果，差的规则设计会让恐怖变成闹剧。

#### 2.1 三层规则结构

灵异故事中最精妙的规则设计采用三层嵌套结构：

**表层规则（当地人告诉你的）**：
- 形式：民谚、口诀、老人的叮嘱
- 例子："天黑后不要出门"、"看见红衣服的女人不要搭话"、"晚上听到敲门先数三下再开"
- 特征：简单直接，但不解释原因
- 叙事作用：制造初始悬念，建立世界规则感

**隐层规则（当地人不告诉你的）**：
- 形式：被刻意隐瞒的真相、需要自己发现的逻辑
- 例子：天黑后不出门→因为村口的路每晚会多出一段→走上多出的那段路就回不来了
- 特征：补充了"为什么"，但揭示出更大的恐怖
- 叙事作用：中期反转，加深恐怖

**真实规则（世界运行的底层逻辑）**：
- 形式：整个灵异现象的根本机制
- 例子：村口的路多出的那段，其实是某个怨灵在重复她死前走过的路→她在寻找替死鬼→只要有人走完全程就能替代她→村里人知道这件事所以轮流"喂"她
- 特征：解释了所有现象，往往牵涉到人性之恶
- 叙事作用：最终揭秘，恐怖与人性交织

#### 2.2 规则设计原则

**因果报应原则**：
- 灵异规则的底层逻辑最好植根于中国传统的因果观
- 不是无缘无故的恐怖，而是"有人做了什么，所以才有这样的后果"
- 因果链越长越隐蔽，恐怖感越强

**阴阳五行原则**：
- 规则应可以用阴阳五行的逻辑来解释（至少表面上如此）
- 这让规则有"伪科学"的严谨感，增强可信度
- 例如：水克火，所以溺亡鬼惧怕灯火；金生水，所以铜镜可以照出水鬼原形

**风水原则**：
- 空间上的规则应与风水对应
- 煞气方位、气场流动、阴阳分界线——这些风水概念可以直接作为灵异规则的空间框架
- 例如：房屋正对路冲位，所以成了"鬼道"的入口

#### 2.3 后果升级体系

违反规则的后果必须有层级递进，不能一上来就是死亡：

```
第一层：警告
  表现：异常感知（温度骤降、耳鸣、恶心、看到闪影）
  可逆：立刻停止违规行为即可恢复
  叙事作用：营造氛围，给角色退路

第二层：惩罚
  表现：身体异变（身上出红印、头发变白、指甲变黑）、环境异常（房间变形、出不去、时间循环）
  部分可逆：需要特定方法化解（烧纸、念咒、道歉）
  叙事作用：提升紧张感，展示规则的严酷性

第三层：诅咒
  表现：灵异纠缠（被跟踪、噩梦、被附身前兆）
  高代价可逆：需要专业人士介入或付出重大代价
  叙事作用：推动角色寻求帮助，引入新角色或新线索

第四层：死亡/永久代价
  表现：直接死亡或不可逆的灾难性后果
  不可逆
  叙事作用：展示规则的绝对性，为存活角色制造阴影
```

#### 2.4 操作指南

在"世界"设定的「核心禁忌与规则」字段中，建议按以下结构组织内容：

```
{
  表层规则: [列出所有表层规则],
  隐层规则: [对应每条表层规则的隐藏真相],
  真实规则: [世界底层的灵异运行逻辑],
  违规后果: {
    第一层_警告: "...",
    第二层_惩罚: "...",
    第三层_诅咒: "...",
    第四层_死亡: "..."
  },
  规则例外: [什么情况下规则会失效或改变]
}
```

调用 `update_setting` 时，将上述结构作为「核心禁忌与规则」字段的值写入。

---

### 三、角色因果链设计

灵异故事中的角色有独特的"三位一体"结构：「命格与体质」→「背负因果」→「死亡方式」。这三个字段形成因果闭环，是驱动灵异叙事的核心引擎。

#### 3.1 命格与体质

「命格与体质」决定了角色与灵异世界的交互方式：

**常见命格类型及其叙事功能**：

| 命格 | 灵异交互方式 | 叙事功能 |
|------|------------|---------|
| 八字纯阴 | 天生能看到鬼，但也容易被鬼纠缠 | 主角常用命格，提供"被动感知"能力 |
| 童子命 | 灵异主动靠近，对灵异有天然吸引力 | 制造"祸从天降"的叙事困境 |
| 天煞孤星 | 克周围的人，自身却不易被灵异侵害 | 制造"孤独但强大"的角色弧光 |
| 阴年阴月阴日阴时生 | 与阴间天然亲和，可以进出灵异空间 | 提供"穿越阴阳"的特殊能力 |
| 命硬 | 灵异对其效果减弱，但不能完全免疫 | 提供有限的安全感，不削弱恐怖 |
| 五弊三缺 | 拥有玄学能力但有天然缺陷（鳏寡孤独残） | 制造"能力有代价"的平衡感 |

**设计原则**：
- 命格必须与角色定位对应：普通人通常没有特殊命格，民间手艺人有五弊三缺类命格
- 命格不是万能盾牌：即便命格有利，在面对高阶灵异时仍应有危险
- 命格可以随剧情发展"觉醒"或"衰退"：这是「状态变化轨迹」的重要驱动

#### 3.2 背负因果

「背负因果」是灵异叙事最强的情节驱动器：

**因果类型**：

| 因果类型 | 说明 | 叙事张力 |
|---------|------|---------|
| 祖辈因果 | 祖先做了某事，后代承受报应 | "我没做错什么，却要承受报应"的无奈 |
| 自身因果 | 角色自己的过失导致灵异纠缠 | "一切源于自己的贪念/失误"的自责 |
| 误触因果 | 无意中触发了某个灵异机制 | "无辜者被卷入"的恐怖 |
| 转嫁因果 | 别人将自己的因果转移到角色身上 | "被最信任的人出卖"的人性恐怖 |
| 交易因果 | 角色或祖辈与灵异做了交易，到期要还债 | "终有一天要付出代价"的悬顶之剑 |

**因果链设计技巧**：
- 因果的根源应该藏在故事的深处，不要一开始就揭示
- 因果链越长越好：爷爷杀了人 → 对方变成厉鬼 → 诅咒了这家三代 → 到孙子辈开始兑现
- 同一个因果可以影响多个角色，形成"命运共同体"

#### 3.3 死亡方式与鬼的能力

「死亡方式」不仅是角色的结局，更决定了这个角色变成鬼之后的能力和行为模式：

| 死亡方式 | 鬼的特征 | 典型行为 |
|---------|---------|---------|
| 吊死 | 长舌、脖子有勒痕、出没于横梁和绳索附近 | 在高处引诱人上吊，制造"自杀"假象 |
| 溺亡 | 全身湿漉、面色发青、出没于水边 | 水中拉人，制造"溺水"事故寻找替身 |
| 饿死 | 形如枯骨、永远饥饿、对食物执念 | 向人索要食物，收到食物后会短暂感恩然后更加疯狂地索取 |
| 烧死 | 身上有焦痕、畏水、出没于火场旧址 | 制造火灾，对火焰有控制能力 |
| 冤杀 | 保留生前记忆、有强烈复仇意识 | 针对性报复凶手及其后代 |
| 横死（意外） | 茫然无知、重复死亡场景 | 在死亡地点循环重演死亡过程 |
| 自杀 | 弥漫绝望情绪、影响周围人的精神状态 | 在自杀地点散播负面情绪，引导他人走向同样的绝望 |

**设计原则**：
- 死亡方式决定鬼的"规则"：溺亡鬼只能在水边活动，吊死鬼只能在有横梁的地方出现
- 这种"限制"反而增强恐怖感：当你知道了规则，你会恐惧所有符合条件的场景
- 死亡方式应与「背负因果」对应：因为什么因果而死，就会以什么方式纠缠

#### 3.4 状态变化轨迹设计

不同「角色定位」的状态变化轨迹模式不同：

**普通人**：
```
正常 → 感知异常（阳火减弱）→ 恐惧加深（精神状态恶化）→ 直面灵异 → 崩溃/觉醒
```

**民间手艺人**：
```
隐藏身份 → 被迫出手 → 能力展示 → 遭遇强敌（阳火受损）→ 付出代价 → 恢复或衰退
```

**诡异**：
```
潜伏 → 试探 → 暴露（部分）→ 展示真实力量 → 被压制/达成目的
```

**线索人物**：
```
正常 → 提供关键信息 → 状态急剧恶化 → 死亡或消失（功能完成）
```

创建角色时，用 `create_character` 在 properties 中填写对应的动态字段初始值（当前生死状态、当前位置、精神状态、阳火状态、当前外貌异象）。随章节推进时，通过 `update_character` 更新这些动态字段。

---

### 四、场景风水格局设计

灵异故事的场景不只是"地点"，更是"灵异规则的载体"。每个场景的风水格局决定了灵异活动的强度和类型。

#### 4.1 风水格局与灵异热点

**风水格局决定灵异强度的核心逻辑**：

| 风水格局 | 灵异强度 | 典型场景 |
|---------|---------|---------|
| 藏风聚气（阴气版） | 极高 | 阴宅、古墓、封闭山谷 |
| 路冲煞 | 高（特定方向） | 正对长路的房屋 |
| 反弓煞 | 中高 | 河流弯道外侧的建筑 |
| 穿堂煞 | 中（通道型） | 前后门直通的房屋 |
| 镇压局 | 低（被压制） | 有镇物的建筑，但镇物失效则爆发 |
| 阴阳交界 | 不稳定 | 桥头、十字路口、井边 |

#### 4.2 场景类型与风水的对应

创建场景时，「场景类型」和「风水格局」必须逻辑自洽：

**生活区**：
- 风水格局通常为中性或轻微不利
- 灵异活跃度低，但可能因特定条件升高（深夜、特殊日期）
- 恐怖来源：本应安全的地方出现异常，反差感制造恐怖

**凶地**：
- 风水格局为严重煞位或阴气极重
- 灵异活跃度极高，有明确的规则和禁忌
- 恐怖来源：环境本身就是威胁，规则稍有违反就有严重后果

**祭祀场所**：
- 风水格局为人为设计的灵异节点
- 灵异活跃度受仪式控制——仪式正确时压制灵异，仪式失败时灵异爆发
- 恐怖来源：仪式感本身制造紧张，加上"一步走错"的恐惧

**异域结界**：
- 风水格局为完全异常的空间
- 灵异活跃度极高且规则独特（不同于外界）
- 恐怖来源：完全陌生的规则，角色所有的经验都失效

#### 4.3 规则与禁忌设计

场景级别的「规则与禁忌」应与世界级别的「核心禁忌与规则」呈包含关系：

- 世界规则是通用的（如"天黑后阴气上升"）
- 场景规则是世界规则在特定空间的具体表现（如"这栋楼天黑后三楼会多出一个房间"）
- 场景规则可以有独特的补充（如"这个房间里不能照镜子"）

设计建议：每个凶地场景至少设计 3 条规则，其中 1 条表层规则、1 条隐层规则、1 条玩家/角色需要自己发现的规则。

#### 4.4 环境氛围与感官细节

「环境氛围与感官细节」是恐怖氛围的直接载体，必须覆盖五感：

| 感官 | 正常状态 | 灵异状态 | 转变信号 |
|------|---------|---------|---------|
| 视觉 | 正常光线、普通场景 | 光线扭曲、出现不应存在的影子或物体 | 眼角余光捕捉到异常 |
| 听觉 | 环境音（风声、虫鸣） | 不合理的声音（深夜敲门、无源脚步声） | 突然的寂静 |
| 嗅觉 | 正常环境气味 | 腐臭、香烛、烧纸味、不明花香 | 突然出现的异味 |
| 触觉 | 正常温度和质感 | 局部温度骤降、触碰到不存在的东西 | 后脖颈发凉 |
| 第六感 | 无 | 被注视感、不安感、想逃的冲动 | 汗毛竖起 |

创建场景时，在「环境氛围与感官细节」中要同时描述正常状态和灵异状态的五感表现，以及从正常到灵异的转变信号。

#### 4.5 操作指南

**Step 1**：调用 `get_scene_schema` 获取场景的完整字段定义

**Step 2**：设计场景时先确定「场景类型」和「风水格局」，它们决定了后续所有字段

**Step 3**：基于风水格局推导「规则与禁忌」，确保与世界设定的核心规则一致

**Step 4**：填写「环境氛围与感官细节」时覆盖五感，分别描述正常和灵异两种状态

**Step 5**：调用 `create_scene` 创建场景，properties 中包含所有静态字段和动态字段的初始值（当前时段、灵异活跃度、封印状态、当前异常现象）

**Step 6**：如果场景与特定角色绑定（如角色的「绑定场景」字段），确保双向关联一致

---

### 五、道具体系设计

灵异故事的道具不是普通物品，每一件都承载着灵异世界的规则。道具的五个「类别」各有不同的设计原则。

#### 5.1 五类道具设计原则

**法器**：
- 定位：对抗灵异的正面工具
- 核心能力设计：明确功能描述和触发条件（如"罗盘可以指示阴气方向，但必须由修行者持握才能激活"）
- 副作用与代价：使用法器要消耗使用者的阳气/精力
- 使用禁忌：法器不能滥用，过度使用会反噬
- 稀有度：通常为中高稀有度

**阴物**：
- 定位：来自灵异世界的物品，天然带有诡异属性
- 核心能力设计：能力强大但难以控制（如"阴魂灯可以照亮阴间，但点燃后必须在天亮前熄灭，否则会引来灯里的东西"）
- 副作用与代价：接触阴物本身就有风险
- 使用禁忌：阴物的禁忌通常是"不要XX"型（不要用左手碰、不要带回家、不要让它见血）
- 稀有度：高稀有度

**祭品**：
- 定位：献给灵异存在的供品，消耗型道具
- 核心能力设计：取悦/安抚灵异（如"血粮可以暂时安抚饿鬼，使其3个时辰内不伤人"）
- 副作用与代价：祭品一旦许诺就必须兑现，否则会激怒灵异
- 使用禁忌：祭品的规格和献祭方式有严格要求
- 稀有度：低到中（但特殊祭品稀有度高）

**镇物**：
- 定位：长期压制灵异的封印工具
- 核心能力设计：持续性压制效果（如"镇魂碑可以将特定灵异封印在方圆百步之内"）
- 副作用与代价：镇物需要定期维护（换血、念经、补刻符文），否则效力衰减
- 使用禁忌：镇物不能移动或损坏，否则封印立刻失效
- 稀有度：高稀有度
- **剧情价值**：镇物被破坏 = 灵异爆发，这是经典的"灾难触发器"

**奇珍**：
- 定位：超越善恶的特殊物品，既非法器也非阴物
- 核心能力设计：独特且不可复制的效果（如"三生石碎片可以看到前世记忆"）
- 副作用与代价：代价往往是"认知层面"的（看到不该看的、知道不该知道的）
- 使用禁忌：通常是"不能对特定对象使用"或"不能使用超过特定次数"
- 稀有度：极高稀有度

#### 5.2 能力与代价的平衡

道具的「核心能力」和「副作用与代价」之间必须保持平衡：

**平衡公式**：道具越强大，代价越沉重，禁忌越多

```
弱道具：效果明确 + 低代价 + 少禁忌（如：桃木剑，驱赶低阶灵异，无明显副作用）
中道具：效果显著 + 中等代价 + 1-2条禁忌（如：铜钱剑，斩灵异，但需消耗使用者三天寿命）
强道具：效果强大 + 高代价 + 多条禁忌（如：阴阳镜，可看透一切灵异本质，但每用一次失去一段记忆，且不能在午时使用）
```

#### 5.3 道具与供奉体系的联动

道具系统应与世界设定中的「供奉与交易物」形成完整循环：

- 祭品类道具 = 供奉体系的"通货"
- 法器的修复/充能可能需要特定的供奉物
- 阴物可能是供奉仪式的"副产品"
- 镇物的维护需要定期的供奉

#### 5.4 操作指南

**Step 1**：调用 `get_prop_schema` 获取道具的完整字段定义

**Step 2**：先确定道具的「类别」，不同类别遵循不同的设计原则（见5.1）

**Step 3**：设计「核心能力」时同步设计「副作用与代价」和「使用禁忌」，确保三者平衡

**Step 4**：「由来背景」应与世界设定挂钩，说明道具的来历和在灵异生态中的位置

**Step 5**：调用 `create_prop` 创建道具，properties 中包含所有静态字段和动态字段初始值（当前持有者、当前位置、道具状态、剩余效力）

---

### 六、工具使用指南

#### 6.1 设定相关工具

| 场景 | 工具 | 关键参数 |
|------|------|---------|
| 了解世界设定字段 | `get_setting_type_schema` | `moduleTypeName`（如"世界"） |
| 查看当前设定 | `list_settings` | 无 |
| 查看设定详情 | `get_setting_detail` | `settingName` 或 `settingId` |
| 填写/更新世界设定 | `update_setting` | `moduleTypeName`, `properties` |
| 填写/更新故事钩子 | `update_setting` | `moduleTypeName`（如"故事钩子"）, `properties` |
| 填写/更新文风设定 | `update_setting` | `moduleTypeName`（如"文风设定"）, `properties` |

#### 6.2 角色相关工具

| 场景 | 工具 | 关键参数 |
|------|------|---------|
| 获取角色 Schema | `get_character_schema` | 无 |
| 创建灵异角色 | `create_character` | `name`, `properties`（含命格与体质、背负因果、死亡方式等） |
| 更新角色动态状态 | `update_character` | `characterName`, `properties`（含当前生死状态、阳火状态等动态字段） |

**灵异角色创建要点**：
- 「角色定位」四选一：普通人、民间手艺人、诡异、线索人物
- 「命格与体质」必须与角色定位匹配
- 「背负因果」是情节驱动器，务必设计具体的因果链
- 「死亡方式」如果设计了，就已经隐含了角色最终的命运走向
- 「状态变化轨迹」规划角色从开始到结束的状态变化路径

#### 6.3 场景相关工具

| 场景 | 工具 | 关键参数 |
|------|------|---------|
| 获取场景 Schema | `get_scene_schema` | 无 |
| 创建灵异场景 | `create_scene` | `name`, `properties`（含场景类型、风水格局、规则与禁忌等） |
| 更新场景动态状态 | `update_scene` | `sceneName`, `properties`（含当前时段、灵异活跃度、封印状态等） |

**灵异场景创建要点**：
- 「场景类型」四选一：生活区、凶地、祭祀场所、异域结界
- 「风水格局」决定灵异活动的基础强度
- 「规则与禁忌」必须与世界设定的核心规则一致
- 「环境氛围与感官细节」要覆盖五感的正常态和灵异态
- 「怪谈传说」是场景的叙事钩子，用于引出场景的灵异历史

#### 6.4 道具相关工具

| 场景 | 工具 | 关键参数 |
|------|------|---------|
| 获取道具 Schema | `get_prop_schema` | 无 |
| 创建灵异道具 | `create_prop` | `name`, `properties`（含类别、核心能力、副作用与代价、使用禁忌等） |
| 更新道具动态状态 | `update_prop` | `propName`, `properties`（含当前持有者、道具状态、剩余效力等） |

**灵异道具创建要点**：
- 「类别」五选一：法器、阴物、祭品、镇物、奇珍
- 「核心能力」的功能描述和触发条件都要明确
- 「副作用与代价」和「使用禁忌」的严重程度要与能力强度匹配
- 「外观描述」中的材质、视觉特征、气息状态要能暗示道具的灵异属性

---

### 七、典型工作流

#### 7.1 从零构建灵异世界

```
1. get_setting_type_schema("世界") → 了解字段
2. 与用户讨论世界观基调
3. 按照"世界名称→地理→时代→规则→生态→职业→仪式→供奉"的顺序逐步设计
4. update_setting 写入世界设定
5. update_setting 写入故事钩子
6. update_setting 写入文风设定
7. 回顾整体一致性
```

#### 7.2 创建灵异角色组

```
1. get_character_schema → 了解字段
2. 设计角色阵容：1个普通人主角 + 1-2个手艺人 + 2-3个诡异 + 1-2个线索人物
3. 为每个角色设计"命格→因果→死亡方式"三位一体
4. create_character 逐个创建
5. create_relation 建立角色间的关系
```

#### 7.3 设计一套完整的场景风水局

```
1. get_scene_schema → 了解字段
2. 基于世界设定的地理格局，规划场景分布
3. 为每个场景设计风水格局和规则禁忌
4. create_scene 逐个创建
5. 确保角色的"绑定场景"与场景互相呼应
```

#### 7.4 构建道具体系

```
1. get_prop_schema → 了解字段
2. 基于世界设定的玄学体系和供奉系统，规划道具清单
3. 为每件道具设计能力-代价-禁忌的平衡
4. create_prop 逐个创建
5. 确保道具与角色、场景的关联合理
```',
  '## Supernatural World-building and Rule Design Skill

This skill is designed specifically for the "Chinese Folk Horror Story Creation" method. It guides you in building a self-consistent supernatural worldview, covering the complete design methodology for the World setting module, the layered structure of core taboo rules, the driving logic of character karma chains, the horror atmosphere created by scene feng shui layouts, and the balanced design of the prop/artifact system.

---

### I. Supernatural World-building Methodology

The worldview of a supernatural story is the foundation of all horror elements. The "World" setting module contains eight core fields with strict causal relationships that must be designed in the correct logical sequence.

#### 1.1 Design Order and Field Dependencies

```
World Name (sets the tone)
  → Geography and Feng Shui Layout (determines the physical basis of the supernatural)
    → Era and Social Background (determines characters'' cognitive boundaries)
      → Core Taboos and Rules (the soul of the worldview)
        → Supernatural Ecology (products of the rules)
          → Occult/Professional System (means to counter the supernatural)
            → Folk Rituals (the interface between humans and the supernatural)
              → Offerings and Trade Goods (economic system)
```

**Key Dependencies**:
- "Geography and Feng Shui Layout" determines how supernatural energy is distributed, directly affecting what types of entities appear in "Supernatural Ecology"
- "Supernatural Ecology" determines what kind of "Occult/Professional System" humans need to cope
- "Core Taboos and Rules" is the overarching rule engine; all supernatural phenomena and character actions must be consistent within this framework

#### 1.2 Design Points for Each Field

**World Name**:
- Not just naming, but setting the tone for the entire world
- A good name hints at the world''s core characteristics, e.g., "Nine Nether Sealed Gate Village" implies closure and dark energy; "Ghost Market" implies a yin-yang coexisting trade space
- Use `get_setting_type_schema` to get the complete field definition of the "World" module, then fill in the world name first to establish the tone

**Geography and Feng Shui Layout**:
- In supernatural stories, geography is "feng shui geography," not ordinary geography
- Must include: dragon vein direction, water gate position, yin-yang boundary, qi field distribution
- Geographic layout determines the spatial logic of the story. For example: a basin surrounded by mountains forms a "yin-gathering ground"; a diverted river creates a "severed dragon vein"
- Design technique: first draw the major feng shui layout, then place scenes at key nodes (dragon lair, water gate, sha position)

**Era and Social Background**:
- The era determines the cognitive framework and coping methods characters have when facing the supernatural
- Republican era: transition between old and new, conflict between science and superstition, suitable for "rational person encounters the unexplainable" narratives
- Modern urban: collision of the information age with ancient horrors, suitable for "urban legend" narratives
- Ancient rural: collective fear in a closed society, suitable for "there''s something real behind the superstitions" narratives
- Social background must specify: local belief systems, official attitudes, ordinary people''s level of understanding

**Core Taboos and Rules**:
- This is the **most important** field in the supernatural story worldview; see Section 2 for detailed discussion

**Supernatural Ecology**:
- Not simply listing a few types of ghosts, but establishing an "ecosystem"
- The supernatural ecology should answer: What types of supernatural beings exist in this world? How are they created? What food chain/hierarchy exists among them? How do they interact with the human world?
- Hierarchy example: Residual echoes (unconscious remnants) → Grudge spirits (souls with obsessions) → Fierce ghosts (malevolent spirits with abilities) → Anomalies (beings beyond good and evil)
- The supernatural ecology must correspond to "Geography and Feng Shui Layout": areas with heavy dark energy produce grudge spirits; fractured dragon veins produce anomalies

**Occult/Professional System**:
- The system of human countermeasures against the supernatural, which must correspond to "Supernatural Ecology"
- Common types: Maoshan Taoist priests, corpse herders, yin-yang masters, paper craftsmen, spirit mediums, feng shui masters
- Each profession should have clear: scope of abilities, cultivation path, costs and taboos, methods of interacting with the supernatural
- Important principle: human countermeasures must not be too powerful; maintain the "sense of horror" — even the strongest practitioner should feel helpless against high-level anomalies

**Folk Rituals**:
- The "protocol execution methods" between humans and the supernatural
- Includes: sacrifices (one-way offerings), summoning/dismissing spirits (two-way interaction), suppression (forced control), salvation (resolving grudges)
- Rituals must have strict procedures and taboos; ritual failure should have clear consequences
- Well-designed rituals can become climactic scenes in the story

**Offerings and Trade Goods**:
- The "economic system" of the supernatural world
- Categories: underworld currency (paper money, cold clothes, etc.), mortal sacrifices (incense, livestock, etc.), special trade goods (lifespan, vital essence, memories, etc.)
- Trade rules: principle of equivalent exchange, breach penalties, intermediary roles
- This field provides the economic foundation for the prop system and story conflicts

#### 1.3 Three Common Worldview Templates

**Sealed Village Type**:
- Features: Closed geography + ancient taboos + generational secrets
- Core conflict: Outsider intrusion vs. the village''s closed rules
- Feng shui layout: Mountain-sealed, single entrance/exit, suppression object at the village center
- Supernatural ecology: Primarily site-bound spirits, ancestral spirits, village guardian anomalies
- Suitable for: Medium-to-long exploration narratives

**Urban Anomaly Type**:
- Features: Modern city + hidden supernatural spaces + rule-based horror tales
- Core conflict: Daily life invaded by supernatural rules
- Feng shui layout: Urban construction has disrupted the original feng shui, creating new supernatural nodes
- Supernatural ecology: Urban anomalies (elevator ghosts, hallway horrors, subway phantoms)
- Suitable for: Short rule-based horror stories, urban horror series

**Republican-Era Town Type**:
- Features: Transitional era + clan society + semi-skeptical narrative perspective
- Core conflict: Modern rationality vs. ancient supernatural
- Feng shui layout: A town nestled among mountains and rivers, with ancient ancestral halls and forbidden zones
- Supernatural ecology: Family curses, ancestral hall ghosts, supernatural entities within feng shui formations
- Suitable for: Long-form Republican-era mystery/horror novels

#### 1.4 Operation Guide

Tool workflow when designing the worldview:

**Step 1**: Call `get_setting_type_schema` with the module type name (e.g., "World") to get the complete field definition

**Step 2**: Following the design order in 1.1, discuss and fill in each field with the user

**Step 3**: Call `update_setting` to write the world settings into the system
- Can be done in batches — fill in the first few fields, then supplement later
- Pass the complete current state each time (incremental update)

**Step 4**: After design is complete, review overall consistency
- Check: Does the supernatural ecology correspond to the geographic layout?
- Check: Does the professional system match the supernatural ecology?
- Check: Do the core rules permeate all elements?

---

### II. Core Taboo and Rule Design

"Core Taboos and Rules" is the soul field of the supernatural story worldview. Good rule design creates the "horrifying upon reflection" effect; poor rule design turns horror into farce.

#### 2.1 Three-Layer Rule Structure

The most elegant rule designs in supernatural stories use a three-layer nested structure:

**Surface Rules (what locals tell you)**:
- Form: Folk sayings, mnemonics, elders'' warnings
- Examples: "Don''t go out after dark," "Don''t talk to women in red," "When you hear knocking at night, count to three before opening"
- Characteristics: Simple and direct, but no explanation of why
- Narrative function: Create initial suspense, establish the world''s rule-based feel

**Hidden Rules (what locals don''t tell you)**:
- Form: Deliberately concealed truths, logic you must discover yourself
- Examples: Don''t go out after dark → because the road at the village entrance grows an extra segment each night → walking that extra segment means you can never return
- Characteristics: Adds the "why," but reveals something even more terrifying
- Narrative function: Mid-story reversal, deepening the horror

**True Rules (the underlying logic of the world)**:
- Form: The fundamental mechanism behind all supernatural phenomena
- Examples: The extra road segment is actually a grudge spirit retracing the path she walked before death → she is looking for a substitute → anyone who walks the full length can take her place → the villagers know this and take turns "feeding" her
- Characteristics: Explains all phenomena, often involves the darkness of human nature
- Narrative function: Final revelation, interweaving horror with human nature

#### 2.2 Rule Design Principles

**Karmic Causality Principle**:
- The underlying logic of supernatural rules should ideally be rooted in traditional Chinese concepts of karma
- Not random horror, but "someone did something, therefore these consequences exist"
- The longer and more hidden the karmic chain, the stronger the horror

**Yin-Yang Five Elements Principle**:
- Rules should be explainable through yin-yang and five elements logic (at least on the surface)
- This gives rules a "pseudo-scientific" rigor that enhances believability
- Example: Water overcomes fire, so drowning ghosts fear lamplight; metal generates water, so bronze mirrors can reveal water ghosts'' true forms

**Feng Shui Principle**:
- Spatial rules should correspond to feng shui
- Sha energy directions, qi flow, yin-yang boundary lines — these feng shui concepts can directly serve as the spatial framework for supernatural rules
- Example: A house directly facing a road rush position becomes an entrance to "ghost paths"

#### 2.3 Consequence Escalation System

Consequences for violating rules must have progressive levels; they cannot jump straight to death:

```
Level 1: Warning
  Manifestation: Abnormal perception (sudden temperature drop, tinnitus, nausea, seeing flickers)
  Reversible: Stop the violation immediately to recover
  Narrative function: Build atmosphere, give characters an escape route

Level 2: Punishment
  Manifestation: Physical changes (red marks, white hair, blackened nails), environmental anomalies (room distortion, unable to exit, time loops)
  Partially reversible: Requires specific methods (burning offerings, chanting, apologizing)
  Narrative function: Heighten tension, demonstrate the severity of rules

Level 3: Curse
  Manifestation: Supernatural entanglement (being followed, nightmares, signs of possession)
  Reversible at high cost: Requires professional intervention or significant sacrifice
  Narrative function: Drive characters to seek help, introduce new characters or clues

Level 4: Death/Permanent Cost
  Manifestation: Direct death or irreversible catastrophic consequences
  Irreversible
  Narrative function: Demonstrate the absoluteness of rules, create lasting shadow for surviving characters
```

#### 2.4 Operation Guide

In the "World" setting''s "Core Taboos and Rules" field, organize content in this recommended structure:

```
{
  surface_rules: [list all surface rules],
  hidden_rules: [the hidden truth behind each surface rule],
  true_rules: [the underlying supernatural operating logic of the world],
  violation_consequences: {
    level_1_warning: "...",
    level_2_punishment: "...",
    level_3_curse: "...",
    level_4_death: "..."
  },
  rule_exceptions: [under what circumstances rules fail or change]
}
```

When calling `update_setting`, write the above structure as the value for the "Core Taboos and Rules" field.

---

### III. Character Karma Chain Design

Characters in supernatural stories have a unique "trinity" structure: "Fate and Constitution" → "Karmic Burden" → "Manner of Death." These three fields form a karmic closed loop and serve as the core engine driving supernatural narratives.

#### 3.1 Fate and Constitution

"Fate and Constitution" determines how a character interacts with the supernatural world:

**Common Fate Types and Their Narrative Functions**:

| Fate | Supernatural Interaction | Narrative Function |
|------|------------------------|-------------------|
| Pure Yin Birth Chart | Can naturally see ghosts, but is also easily haunted by them | Common protagonist fate, providing "passive perception" ability |
| Celestial Child Fate | Supernatural beings actively approach; has natural supernatural attraction | Creates "disaster from heaven" narrative predicament |
| Lone Star of Calamity | Harms those nearby, but is resistant to supernatural invasion | Creates the "lonely but powerful" character arc |
| Born at Yin Year/Month/Day/Hour | Natural affinity with the underworld, can enter supernatural spaces | Provides the special ability to "cross between yin and yang" |
| Hard Fate | Supernatural effects are weakened against them, but not immune | Provides limited safety without undermining horror |
| Five Afflictions Three Deficiencies | Has occult abilities but inherent defects (widowed, orphaned, childless, disabled) | Creates the "abilities come at a cost" balance |

**Design Principles**:
- Fate must correspond to character role: ordinary people typically have no special fate; folk practitioners have "five afflictions" type fates
- Fate is not an invincible shield: even favorable fate should still be dangerous when facing high-level anomalies
- Fate can "awaken" or "decline" as the plot develops: this is a key driver for the "State Change Trajectory"

#### 3.2 Karmic Burden

"Karmic Burden" is the most powerful plot driver in supernatural narratives:

**Karma Types**:

| Karma Type | Description | Narrative Tension |
|-----------|-------------|-------------------|
| Ancestral Karma | Ancestors did something; descendants bear the retribution | "I did nothing wrong, yet I must bear the punishment" helplessness |
| Personal Karma | Character''s own mistakes led to supernatural entanglement | "It all started from my own greed/error" self-blame |
| Accidental Karma | Unknowingly triggered a supernatural mechanism | "Innocent person drawn into horror" terror |
| Transferred Karma | Someone else transferred their karma onto the character | "Betrayed by the most trusted person" human horror |
| Transaction Karma | Character or ancestors traded with the supernatural; the debt is now due | "The price must eventually be paid" sword of Damocles |

**Karma Chain Design Tips**:
- The root of karma should be hidden deep in the story; do not reveal it at the beginning
- The longer the chain, the better: grandfather killed someone → victim became a fierce ghost → cursed the family for three generations → curse manifests in the grandchild''s generation
- The same karma can affect multiple characters, forming a "community of fate"

#### 3.3 Manner of Death and Ghost Abilities

"Manner of Death" is not just a character''s ending — it determines the abilities and behavior patterns of the character after becoming a ghost:

| Manner of Death | Ghost Characteristics | Typical Behavior |
|----------------|----------------------|-----------------|
| Hanging | Long tongue, neck marks, appears near beams and ropes | Lures people to hang themselves from high places, creating "suicide" disguises |
| Drowning | Perpetually wet, blue-green complexion, appears near water | Pulls people underwater, creating "drowning accidents" to find substitutes |
| Starvation | Skeletal appearance, eternally hungry, food obsession | Begs for food; briefly grateful upon receiving it, then demands more frantically |
| Burning | Scorch marks, fears water, appears at former fire sites | Creates fires, has control over flames |
| Unjust Murder | Retains pre-death memories, strong desire for vengeance | Targeted revenge against the killer and their descendants |
| Sudden Accident | Confused, unaware, repeats death scene | Loops through the death event at the death site |
| Suicide | Radiates despair, affects surrounding people''s mental state | Spreads negative emotions at the suicide location, guiding others toward the same despair |

**Design Principles**:
- Manner of death determines the ghost''s "rules": drowning ghosts can only act near water; hanging ghosts can only appear where there are beams
- These "limitations" actually enhance horror: once you know the rules, you fear every qualifying scenario
- Manner of death should correspond to "Karmic Burden": the karma that caused the death determines the pattern of haunting

#### 3.4 State Change Trajectory Design

Different "Character Roles" follow different state change trajectory patterns:

**Ordinary Person**:
```
Normal → Anomalous Perception (yang fire weakening) → Deepening Fear (mental state deterioration) → Confronting the Supernatural → Breakdown/Awakening
```

**Folk Practitioner**:
```
Hidden Identity → Forced to Act → Ability Demonstration → Facing a Powerful Enemy (yang fire damaged) → Paying the Price → Recovery or Decline
```

**Anomaly/Entity**:
```
Dormant → Probing → Partial Revelation → Full Power Display → Suppressed/Objective Achieved
```

**Clue Character**:
```
Normal → Provides Key Information → Rapid State Deterioration → Death or Disappearance (function completed)
```

When creating characters, use `create_character` to fill in initial values for dynamic fields in properties (current life/death status, current location, mental state, yang fire status, current appearance anomaly). As chapters progress, update these dynamic fields via `update_character`.

---

### IV. Scene Feng Shui Layout Design

In supernatural stories, scenes are not just "locations" — they are "carriers of supernatural rules." Each scene''s feng shui layout determines the intensity and type of supernatural activity.

#### 4.1 Feng Shui Layout and Supernatural Hotspots

**Core logic of how feng shui layouts determine supernatural intensity**:

| Feng Shui Layout | Supernatural Intensity | Typical Scene |
|-----------------|----------------------|---------------|
| Wind-Gathering Qi-Collecting (yin version) | Extremely high | Yin graves, ancient tombs, sealed valleys |
| Road Rush Sha | High (directional) | Houses directly facing long roads |
| Reverse Bow Sha | Medium-high | Buildings on the outer curve of a river bend |
| Through-Hall Sha | Medium (corridor type) | Houses with front and back doors aligned |
| Suppression Formation | Low (suppressed) | Buildings with suppression objects, but if objects fail, eruption follows |
| Yin-Yang Boundary | Unstable | Bridge heads, crossroads, well edges |

#### 4.2 Scene Type and Feng Shui Correspondence

When creating scenes, "Scene Type" and "Feng Shui Layout" must be logically consistent:

**Living Area**:
- Feng shui layout is typically neutral or mildly unfavorable
- Low supernatural activity, but may rise under specific conditions (late night, special dates)
- Horror source: Anomalies appearing in a place that should be safe; contrast creates horror

**Cursed Ground**:
- Feng shui layout features severe sha positions or extremely heavy yin energy
- Extremely high supernatural activity, with clear rules and taboos
- Horror source: The environment itself is the threat; even slight rule violations bring severe consequences

**Ritual Site**:
- Feng shui layout is a deliberately designed supernatural node
- Supernatural activity is controlled by rituals — correct rituals suppress supernatural forces; failed rituals trigger eruptions
- Horror source: The ritual atmosphere itself creates tension, plus the fear of "one wrong step"

**Otherworldly Barrier**:
- Feng shui layout is a completely anomalous space
- Extremely high supernatural activity with unique rules (different from the outside)
- Horror source: Completely unfamiliar rules render all of the character''s experience useless

#### 4.3 Rules and Taboos Design

Scene-level "Rules and Taboos" should have a containment relationship with the world-level "Core Taboos and Rules":

- World rules are universal (e.g., "yin energy rises after dark")
- Scene rules are the specific manifestation of world rules in a particular space (e.g., "after dark in this building, an extra room appears on the third floor")
- Scene rules can have unique additions (e.g., "you cannot look in mirrors inside this room")

Design suggestion: Each cursed ground scene should have at least 3 rules — 1 surface rule, 1 hidden rule, and 1 rule that characters must discover on their own.

#### 4.4 Environmental Atmosphere and Sensory Details

"Environmental Atmosphere and Sensory Details" is the direct carrier of horror atmosphere and must cover all five senses:

| Sense | Normal State | Supernatural State | Transition Signal |
|-------|-------------|-------------------|------------------|
| Sight | Normal lighting, ordinary scenery | Distorted light, shadows or objects that shouldn''t exist | Peripheral vision catches anomalies |
| Sound | Ambient sounds (wind, insects) | Illogical sounds (midnight knocking, sourceless footsteps) | Sudden silence |
| Smell | Normal environmental odors | Rot, incense, burning paper, unexplained floral scent | Sudden appearance of strange odors |
| Touch | Normal temperature and texture | Localized sudden temperature drops, touching nonexistent things | Cold on the back of the neck |
| Sixth Sense | None | Feeling of being watched, unease, urge to flee | Hair standing on end |

When creating scenes, the "Environmental Atmosphere and Sensory Details" should describe both normal and supernatural states for all five senses, as well as the transition signals from normal to supernatural.

#### 4.5 Operation Guide

**Step 1**: Call `get_scene_schema` to get the complete field definition for scenes

**Step 2**: When designing a scene, first determine "Scene Type" and "Feng Shui Layout" — they determine all subsequent fields

**Step 3**: Derive "Rules and Taboos" based on the feng shui layout, ensuring consistency with the world setting''s core rules

**Step 4**: When filling in "Environmental Atmosphere and Sensory Details," cover all five senses, describing both normal and supernatural states

**Step 5**: Call `create_scene` to create the scene, with properties containing all static fields and initial values for dynamic fields (current time period, supernatural activity level, seal status, current anomalous phenomena)

**Step 6**: If the scene is bound to a specific character (via the character''s "Bound Scene" field), ensure bidirectional association is consistent

---

### V. Prop System Design

Props in supernatural stories are not ordinary objects — each one embodies the rules of the supernatural world. The five "Categories" of props each have different design principles.

#### 5.1 Five Category Design Principles

**Ritual Tool (Fa Qi)**:
- Role: Positive tool for countering the supernatural
- Core Ability design: Clear function description and trigger conditions (e.g., "The compass can indicate the direction of yin energy, but must be held by a practitioner to activate")
- Side Effects and Cost: Using ritual tools consumes the user''s yang energy/vitality
- Usage Taboos: Ritual tools cannot be overused; excessive use causes backlash
- Rarity: Usually medium-high

**Yin Object (Yin Wu)**:
- Role: Items from the supernatural world, inherently carrying anomalous properties
- Core Ability design: Powerful but difficult to control (e.g., "The ghost lantern can illuminate the underworld, but once lit, it must be extinguished before dawn, or the things inside the lantern will come out")
- Side Effects and Cost: Contact with yin objects is inherently risky
- Usage Taboos: Typically "don''t do X" type (don''t touch with the left hand, don''t bring home, don''t let it see blood)
- Rarity: High

**Sacrificial Offering (Ji Pin)**:
- Role: Offerings to supernatural beings, consumable items
- Core Ability design: Appease/pacify the supernatural (e.g., "Blood food can temporarily pacify hungry ghosts, preventing them from harming people for three watches")
- Side Effects and Cost: Once an offering is promised, it must be delivered, or the supernatural entity will be enraged
- Usage Taboos: Strict requirements on specifications and offering methods
- Rarity: Low to medium (but special offerings can be high rarity)

**Suppression Object (Zhen Wu)**:
- Role: Long-term sealing tool that suppresses supernatural entities
- Core Ability design: Sustained suppression effect (e.g., "The soul-suppressing stele can seal a specific supernatural entity within a hundred-pace radius")
- Side Effects and Cost: Requires periodic maintenance (blood renewal, sutra recitation, talisman re-carving); otherwise efficacy diminishes
- Usage Taboos: Cannot be moved or damaged; otherwise the seal breaks immediately
- Rarity: High
- **Plot value**: Suppression object destroyed = supernatural eruption — a classic "disaster trigger"

**Exotic Rarity (Qi Zhen)**:
- Role: Special items beyond good and evil, neither ritual tool nor yin object
- Core Ability design: Unique and irreplicable effects (e.g., "A fragment of the Three Life Stone can reveal past life memories")
- Side Effects and Cost: The cost is often "cognitive" (seeing what shouldn''t be seen, knowing what shouldn''t be known)
- Usage Taboos: Typically "cannot be used on specific targets" or "cannot be used more than a certain number of times"
- Rarity: Extremely high

#### 5.2 Balancing Ability and Cost

The "Core Ability" and "Side Effects and Cost" of props must maintain balance:

**Balance Formula**: The more powerful the prop, the heavier the cost and the more taboos

```
Weak prop: Clear effect + low cost + few taboos (e.g., peach wood sword: repels low-level spirits, no notable side effects)
Medium prop: Significant effect + moderate cost + 1-2 taboos (e.g., copper coin sword: slays spirits, but costs the user three days of lifespan)
Strong prop: Powerful effect + high cost + multiple taboos (e.g., yin-yang mirror: can see through all supernatural beings'' true forms, but each use erases a memory, and it cannot be used at noon)
```

#### 5.3 Prop and Offering System Integration

The prop system should form a complete cycle with the world setting''s "Offerings and Trade Goods":

- Offering-type props = the "currency" of the offering system
- Ritual tool repair/recharging may require specific offering materials
- Yin objects may be "byproducts" of offering rituals
- Suppression object maintenance requires regular offerings

#### 5.4 Operation Guide

**Step 1**: Call `get_prop_schema` to get the complete field definition for props

**Step 2**: First determine the prop''s "Category" — different categories follow different design principles (see 5.1)

**Step 3**: When designing "Core Ability," simultaneously design "Side Effects and Cost" and "Usage Taboos," ensuring the three are balanced

**Step 4**: "Background Origin" should connect to the world setting, explaining the prop''s history and position in the supernatural ecology

**Step 5**: Call `create_prop` to create the prop, with properties containing all static fields and initial values for dynamic fields (current holder, current location, prop status, remaining efficacy)

---

### VI. Tool Usage Guide

#### 6.1 Setting-Related Tools

| Scenario | Tool | Key Parameters |
|----------|------|---------------|
| Understand world setting fields | `get_setting_type_schema` | `moduleTypeName` (e.g., "World") |
| View current settings | `list_settings` | None |
| View setting details | `get_setting_detail` | `settingName` or `settingId` |
| Fill in/update world settings | `update_setting` | `moduleTypeName`, `properties` |
| Fill in/update story hooks | `update_setting` | `moduleTypeName` (e.g., "Story Hook"), `properties` |
| Fill in/update writing style | `update_setting` | `moduleTypeName` (e.g., "Writing Style"), `properties` |

#### 6.2 Character-Related Tools

| Scenario | Tool | Key Parameters |
|----------|------|---------------|
| Get character Schema | `get_character_schema` | None |
| Create supernatural character | `create_character` | `name`, `properties` (including Fate and Constitution, Karmic Burden, Manner of Death, etc.) |
| Update character dynamic state | `update_character` | `characterName`, `properties` (including current life/death status, yang fire status, and other dynamic fields) |

**Key Points for Supernatural Character Creation**:
- "Character Role" has four options: Ordinary Person, Folk Practitioner, Anomaly/Entity, Clue Character
- "Fate and Constitution" must match the character role
- "Karmic Burden" is the plot driver — design a specific karma chain
- If "Manner of Death" is designed, it already implies the character''s ultimate fate trajectory
- "State Change Trajectory" plans the character''s state changes from beginning to end

#### 6.3 Scene-Related Tools

| Scenario | Tool | Key Parameters |
|----------|------|---------------|
| Get scene Schema | `get_scene_schema` | None |
| Create supernatural scene | `create_scene` | `name`, `properties` (including Scene Type, Feng Shui Layout, Rules and Taboos, etc.) |
| Update scene dynamic state | `update_scene` | `sceneName`, `properties` (including current time period, supernatural activity level, seal status, etc.) |

**Key Points for Supernatural Scene Creation**:
- "Scene Type" has four options: Living Area, Cursed Ground, Ritual Site, Otherworldly Barrier
- "Feng Shui Layout" determines the base intensity of supernatural activity
- "Rules and Taboos" must be consistent with the world setting''s core rules
- "Environmental Atmosphere and Sensory Details" should cover normal and supernatural states for all five senses
- "Strange Tales and Legends" serves as the scene''s narrative hook, introducing the scene''s supernatural history

#### 6.4 Prop-Related Tools

| Scenario | Tool | Key Parameters |
|----------|------|---------------|
| Get prop Schema | `get_prop_schema` | None |
| Create supernatural prop | `create_prop` | `name`, `properties` (including Category, Core Ability, Side Effects and Cost, Usage Taboos, etc.) |
| Update prop dynamic state | `update_prop` | `propName`, `properties` (including current holder, prop status, remaining efficacy, etc.) |

**Key Points for Supernatural Prop Creation**:
- "Category" has five options: Ritual Tool, Yin Object, Sacrificial Offering, Suppression Object, Exotic Rarity
- "Core Ability" must have clear function description and trigger conditions
- The severity of "Side Effects and Cost" and "Usage Taboos" must match the ability''s power level
- "Appearance Description" including material, visual characteristics, and aura state should hint at the prop''s supernatural properties

---

### VII. Typical Workflows

#### 7.1 Building a Supernatural World from Scratch

```
1. get_setting_type_schema("World") → understand fields
2. Discuss worldview tone with the user
3. Design step by step following "World Name → Geography → Era → Rules → Ecology → Professions → Rituals → Offerings"
4. update_setting to write world settings
5. update_setting to write story hooks
6. update_setting to write writing style settings
7. Review overall consistency
```

#### 7.2 Creating a Supernatural Character Group

```
1. get_character_schema → understand fields
2. Design character lineup: 1 ordinary person protagonist + 1-2 practitioners + 2-3 anomalies + 1-2 clue characters
3. Design the "Fate → Karma → Manner of Death" trinity for each character
4. create_character for each one
5. create_relation to establish inter-character relationships
```

#### 7.3 Designing a Complete Scene Feng Shui Layout

```
1. get_scene_schema → understand fields
2. Based on the world setting''s geographic layout, plan the scene distribution
3. Design feng shui layout and rules/taboos for each scene
4. create_scene for each one
5. Ensure characters'' "Bound Scene" fields correspond with the scenes
```

#### 7.4 Building the Prop System

```
1. get_prop_schema → understand fields
2. Based on the world setting''s occult system and offering system, plan the prop inventory
3. Design the ability-cost-taboo balance for each prop
4. create_prop for each one
5. Ensure props are reasonably linked to characters and scenes
```',
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
