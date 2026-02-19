-- 历史人物穿越小说创作指南 Skill / Historical Figure Crossing Guide Skill
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '历史人物穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-historical-crossing-guide.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'historical-crossing-guide',
  '历史人物穿越小说创作指南：涵盖穿越目标选择、原著背景与剧情映射、历史事件时间线与蝴蝶效应设计、先知优势与命运改写策略、三源角色体系、势力格局构建、七阶段叙事结构和常见陷阱规避',
  'Historical figure crossing novel writing guide: covers crossing target selection, source material background and plot mapping, historical event timeline and butterfly effect design, foreknowledge advantage and fate-rewriting strategy, three-origin character system, faction landscape construction, seven-phase narrative structure, and common pitfall avoidance',
  '## 历史人物穿越小说创作指南

本指南专为「历史人物穿越小说」创作方法设计。该类型的核心是：现代人穿越到某个历史人物或小说角色身上，凭借对历史/原著走向的先知优势，在历史洪流中逆天改命、扭转命运。

本创作方法拥有 **7 种设定类型**（所有创作方法中最多），涵盖原著背景、原著剧情、历史事件时间线、穿越设定、金手指、故事钩子和文风设定，构成完整的历史穿越世界观框架。

---

### 一、类型特征与核心魅力

#### 1.1 什么是历史人物穿越

历史人物穿越是穿越小说中最具"先知叙事"特色的子类型。与异世界穿越不同，主角穿越的目的地是一个**已知结局的世界**——无论是真实历史还是经典小说。核心张力来自"知道未来却未必能改变未来"的博弈。

| 核心特征 | 说明 |
|---------|------|
| **明确穿越目标** | 穿越到具体的历史人物或小说角色身上，继承其身份、地位和人际关系 |
| **先知优势** | 对历史走向或原著剧情的了解是主角最大的金手指 |
| **命运改写** | 核心驱动力——改变角色原本的悲惨命运或历史进程 |
| **历史约束** | 不能随意改变历史，每次改变都要付出代价、面对阻力 |
| **蝴蝶效应** | 一个小改变可能引发一连串不可控的后果，增加叙事复杂性 |

#### 1.2 历史穿越 vs 其他穿越类型

| 对比维度 | 历史人物穿越 | 异世界玄幻穿越 | 科幻穿越 |
|---------|------------|-------------|---------|
| 世界观 | 已知世界（历史/小说） | 全新架空世界 | 科幻宇宙 |
| 力量体系 | 权谋、人脉、先知信息 | 修炼体系、金手指 | 科技、基因改造 |
| 核心优势 | 知道未来走向 | 金手指赋予的超常能力 | 科技代差 |
| 核心张力 | 改变命运的代价 | 升级的障碍 | 生存的威胁 |
| 叙事节奏 | 中等偏慢，讲究布局 | 快节奏，密集爽点 | 中等，探索与冲突交替 |

#### 1.3 读者核心期待

- **逆天改命的快感**：看主角用先知优势一步步扭转原本的悲惨结局
- **历史细节的沉浸感**：精准的历史/原著细节让读者仿佛身临其境
- **蝴蝶效应的紧张感**：每次改变都可能引发意想不到的连锁反应
- **权谋博弈的智慧感**：不是靠武力碾压，而是靠布局、谋略取胜
- **命运抗争的悲壮感**：有些事情即使知道结局也无法改变，引发深层共鸣

---

### 二、设定填写顺序与字段指导

本创作方法拥有 7 种设定类型，建议按以下顺序填写：

#### 2.1 第一步：故事钩子

「故事钩子」设定是整个创作的起点，确定你的故事核心吸引力。

| 字段 | 说明 | 填写建议 |
|------|------|---------|
| **故事钩子** | 一句话概括故事的核心吸引力 | 例："穿越成即将被赐死的太子，三天内必须翻盘" |
| **穿越目标** | 穿越到哪个历史人物或小说角色身上 | 写明具体人物，如"李建成"、"林黛玉" |
| **核心卖点** | 故事最大的看点是什么 | 聚焦差异化，如"用现代金融知识改变三国经济格局" |
| **开篇悬念** | 开篇如何吸引读者 | 第一章就要呈现的危机或悬念 |
| **读者期待** | 读者会期待看到什么 | 明确承诺给读者的核心体验 |

#### 2.2 第二步：穿越设定

「穿越设定」定义穿越的核心机制。

| 字段 | 说明 | 填写建议 |
|------|------|---------|
| **穿越角色** | 穿越到哪个历史人物或小说角色身上 | 与故事钩子中的穿越目标一致 |
| **角色来源** | 历史人物 / 小说角色 | 选择角色的出处类型 |
| **原著/史书** | 角色出自哪部史书或小说 | 如《三国演义》、《史记》、《红楼梦》 |
| **穿越时间节点** | 穿越到角色人生的哪个时间点 | 关键节点选择——太早缺乏紧迫感，太晚缺乏回旋余地 |
| **穿越方式** | 意外身亡 / 古物触发 / 梦境穿越 / 雷击 / 其他 | 选择合适的穿越触发机制 |
| **穿越方式详情** | 补充说明穿越的具体情况 | 详细描述穿越发生的过程 |
| **穿越者身份** | 穿越前的现代身份 | 如程序员、历史教授、特种兵——现代身份决定可用知识 |
| **核心目标** | 逆天改命 / 争霸天下 / 体验人生 / 拯救挚爱 / 其他 | 主角穿越后最想达成的目标 |
| **核心目标详情** | 具体想要达成什么目标 | 越具体越好，如"避免玄武门之变中被杀" |

**穿越时间节点的选择策略**：
- **命运转折前 1-3 年**：有充足准备时间，适合布局型故事
- **命运转折前数月**：紧迫感适中，既有压力又有回旋余地
- **命运转折前数天**：极度紧迫，适合快节奏爽文

#### 2.3 第三步：原著背景

「原著背景」构建穿越世界的基础环境。

| 字段 | 说明 | 填写建议 |
|------|------|---------|
| **时代背景** | 故事发生的历史时期或小说世界 | 描述整体时代特征 |
| **历史时期** | 具体的朝代或年代 | 如"唐朝武德年间"、"东汉末年" |
| **政治格局** | 当时的政治势力分布 | 各方势力的力量对比和立场 |
| **社会制度** | 当时的社会制度特征 | 阶层、科举、兵制等关键制度 |
| **文化特征** | 当时的文化风俗 | 影响角色行为的文化背景 |
| **关键背景** | 与主角命运相关的关键背景信息 | 直接影响主角命运走向的环境因素 |

#### 2.4 第四步：原著剧情

「原著剧情」是先知优势的信息来源。

| 字段 | 说明 | 填写建议 |
|------|------|---------|
| **原著概述** | 原著中主角的主要经历概述 | 简明扼要地概述原角色的人生轨迹 |
| **关键剧情**（数组） | 原著中的关键剧情节点 | 每个节点包含：剧情节点、原著发展、可改变点 |
| **原著结局** | 原著中主角的最终结局 | 这是主角最想改变的终点 |

**关键剧情填写示例**：
```
剧情节点：玄武门之变
原著发展：李建成被杀，李世民夺权
可改变点：提前布局军事力量，拉拢关键将领
```

#### 2.5 第五步：历史事件时间线

「历史事件时间线」是蝴蝶效应设计的基础。

| 字段 | 说明 | 填写建议 |
|------|------|---------|
| **时间线概述** | 时间线的整体概述 | 概述关键时期的历史走向 |
| **关键事件**（数组） | 时间线上的关键事件 | 每个事件包含：时间、事件、对主角的影响、可否改变、改变方式 |

**可否改变** 字段有三个等级：
- **可改变**：通过合理手段可以直接改变的事件
- **难以改变**：需要付出巨大代价或多方配合才能改变
- **不可改变**：历史大势所趋，个人力量无法扭转

#### 2.6 第六步：金手指

「金手指」定义主角除先知优势外的额外能力。

| 字段 | 说明 | 填写建议 |
|------|------|---------|
| **金手指类型** | 历史先知 / 现代知识 / 武艺传承 / 系统辅助 / 特殊体质 / 其他 | 选择核心优势类型 |
| **金手指类型详情** | 补充说明金手指类型 | 选择「其他」时必填，其他类型也建议填写 |
| **能力描述** | 金手指的具体能力 | 必须具体化，不是"主角很强"而是"可以做什么、不能做什么" |
| **使用限制** | 金手指的使用限制 | 限制越明确，故事张力越大 |
| **成长空间** | 金手指的成长潜力 | 定义金手指如何随剧情发展而增强 |
| **获得方式** | 如何获得这个金手指 | 穿越时自带 vs 后天获得 |

**金手指类型详解**：

| 类型 | 核心优势 | 适合搭配的穿越身份 |
|------|---------|-----------------|
| **历史先知** | 对历史走向的精确了解 | 历史教授、历史爱好者 |
| **现代知识** | 科技、医学、军事等现代知识 | 工程师、医生、军人 |
| **武艺传承** | 超越时代的武艺能力 | 特种兵、武术教练 |
| **系统辅助** | 任务系统、属性面板等 | 任何现代身份 |
| **特殊体质** | 穿越后获得的异常体质 | 任何现代身份 |

**设计要点**：历史穿越中，金手指不宜过强。因为先知优势本身已经是巨大的金手指，额外能力过强会降低权谋博弈的张力。

#### 2.7 第七步：文风设定

「文风设定」定义写作风格。

| 字段 | 说明 | 选项 |
|------|------|------|
| **叙事视角** | 叙事的视角选择 | 第一人称 / 第三人称限知 / 第三人称全知 / 多视角 |
| **语言风格** | 语言的整体风格 | 古风典雅 / 半文半白 / 现代通俗 / 幽默诙谐 |
| **节奏风格** | 叙事的节奏选择 | 快节奏爽文 / 稳扎稳打 / 慢热细腻 |
| **氛围基调** | 故事的整体氛围 | 热血激昂 / 权谋深沉 / 轻松搞笑 / 悲壮苍凉 |

**历史穿越推荐搭配**：
- **权谋布局型**：第三人称限知 + 半文半白 + 稳扎稳打 + 权谋深沉
- **热血改命型**：第一人称 + 现代通俗 + 快节奏爽文 + 热血激昂
- **悲壮史诗型**：第三人称全知 + 古风典雅 + 慢热细腻 + 悲壮苍凉
- **轻松搞笑型**：第一人称 + 幽默诙谐 + 快节奏爽文 + 轻松搞笑

---

### 三、原著剧情映射

原著剧情是历史穿越小说的"信息宝库"。如何利用原著剧情信息，决定了故事的策略深度。

#### 3.1 剧情节点分类

在填写「关键剧情」数组时，建议将剧情节点分为四类：

| 节点类型 | 说明 | 示例 |
|---------|------|------|
| **核心事件** | 决定历史/原著走向的关键转折 | 玄武门之变、赤壁之战 |
| **关键转折** | 影响主角个人命运的重要节点 | 被诬陷、被贬谪、失去盟友 |
| **次要事件** | 可利用的机遇或需规避的风险 | 某次科举、某场小战役 |
| **人际互动** | 影响关键人物关系的事件 | 与某人结仇、获得某人信任 |

#### 3.2 可改变点的设计策略

每个「关键剧情」的「可改变点」字段是核心——它定义了主角的行动空间。

**可改变性的五个层级**：

| 层级 | 改变难度 | 叙事效果 |
|------|---------|---------|
| **轻松改变** | 只需简单行动即可 | 初期建立信心，展示先知优势 |
| **需要准备** | 提前布局才能改变 | 中期展示智慧和耐心 |
| **代价巨大** | 改变需要牺牲重要资源 | 增加决策的戏剧张力 |
| **引发连锁** | 改变一件事导致更多变化 | 蝴蝶效应的核心体现 |
| **无法改变** | 历史大势不可扭转 | 制造悲剧性和命运感 |

#### 3.3 先知信息的消耗

主角的先知优势不是无限的：
- 每次成功改变一个事件，后续历史走向可能偏离原著
- 偏离越多，先知信息的价值越低
- 到中后期，主角的先知优势应基本耗尽，被迫依靠自身能力
- 这是维持故事张力的核心机制——先知信息是"消耗品"

---

### 四、历史事件时间线与蝴蝶效应

#### 4.1 时间线构建

「历史事件时间线」设定是本创作方法独有的设定类型。构建时间线时应注意：

**时间线结构**：
```
穿越时间点
  ↓
近期事件（1-3个月内）→ 最紧迫，需要立即应对
  ↓
中期事件（3-12个月内）→ 需要提前布局
  ↓
远期事件（1-3年内）→ 最终的命运节点
  ↓
历史大势（3年以上）→ 几乎不可改变的宏观趋势
```

**每个关键事件的五个维度**：

| 维度 | 字段 | 设计要点 |
|------|------|---------|
| **时间** | 时间 | 精确到月份或季节 |
| **内容** | 事件 | 简明描述事件本身 |
| **影响** | 对主角的影响 | 这个事件如何影响主角的命运 |
| **可变性** | 可否改变 | 可改变 / 难以改变 / 不可改变 |
| **手段** | 改变方式 | 如果可以改变，需要什么条件和手段 |

#### 4.2 蝴蝶效应的级联设计

蝴蝶效应是历史穿越小说的核心叙事引擎。设计蝴蝶效应时遵循五个原则：

**原则一：因果链清晰**
每个改变引发的连锁反应必须逻辑自洽。读者应该能够理解"因为A所以B，因为B所以C"的推导过程。

**原则二：后果逐步升级**
- 初期的改变：后果可控，正面结果居多
- 中期的改变：后果复杂，正面和负面并存
- 后期的改变：后果难以预测，可能引发灾难性结果

**原则三：意外后果**
最好的蝴蝶效应设计是——主角成功改变了A，但意外导致了更糟糕的B：
- 救下了本该死去的人 → 但此人后来成为了更大的威胁
- 避免了一场战败 → 但导致了更大规模的战争
- 改变了一个人的命运 → 但破坏了原本稳定的权力平衡

**原则四：不可改变事件的意义**
「不可改变」的事件不是摆设。它们的作用是：
- 制造命运的无力感，增加悲剧深度
- 迫使主角接受某些现实，调整策略
- 为"有些事情比命运更强大"的主题提供支撑

**原则五：时间线收束**
到故事后期，被改变的时间线应逐步收束到一个新的"平衡态"：
- 不是回到原来的历史，而是形成一条全新的历史路径
- 新路径应该比原路径更好，但也有新的问题和挑战
- 这为续集或开放式结局留下空间

#### 4.3 时间线可视化建议

在填写「关键事件」数组时，建议按时间顺序排列，形成清晰的时间线：

```
公元XXX年X月 — 事件A（可改变）→ 改变后引发 → 事件A''
公元XXX年X月 — 事件B（难以改变）→ 需要事件A''的基础
公元XXX年X月 — 事件C（不可改变）→ 必须接受并适应
公元XXX年X月 — 最终命运节点 → 所有改变的最终影响汇聚
```

---

### 五、角色设计

本创作方法的角色 Schema 具有独特的三源角色体系。

#### 5.1 三源角色体系

「角色来源」字段提供三个选项：

| 角色来源 | 说明 | 设计要点 |
|---------|------|---------|
| **历史人物** | 真实历史中的人物 | 必须尊重基本史实，性格可在合理范围内演绎 |
| **小说角色** | 原著小说中的人物 | 需忠于原著设定，但可以通过主角的蝴蝶效应而改变 |
| **原创角色** | 作者创造的新角色 | 用于填补历史/原著的空白，增加叙事灵活性 |

#### 5.2 角色 Schema 字段详解

| 字段 | 说明 | 设计建议 |
|------|------|---------|
| **姓名** | 角色的名字 | 历史人物用真名，原创角色名字要符合时代 |
| **角色来源** | 历史人物 / 小说角色 / 原创角色 | 明确出处类型 |
| **角色定位** | 主角 / 重要配角 / 反派 / 工具人 | 定义角色在故事中的功能层级 |
| **性别** | 男 / 女 | — |
| **身份地位** | 在故事中的身份地位 | 如"太子"、"丞相"、"将军的女儿" |
| **性格特征** | 主要性格特点 | 结合历史记载和故事需要 |
| **历史原型** | 历史上的原型人物 | 原创角色如有历史原型，在此注明 |
| **与主角关系** | 与主角的关系 | 盟友、敌人、暧昧对象、竞争者等 |
| **命运走向** | 角色的命运发展 | 原著/历史中的命运 vs 被主角改变后的命运 |
| **当前状态**（动态） | 角色当前的状态 | 随剧情推进更新，标记为动态字段 |

#### 5.3 历史人物的设计挑战

写历史人物面临三个核心挑战：

**挑战一：史实与虚构的平衡**
- 核心历史事件不能随意篡改（除非是故事的核心冲突）
- 人物的基本性格特征应与史料吻合
- 在史料空白处可以自由发挥
- 对争议性历史人物，选择有利于故事的解读角度

**挑战二：先知与角色互动**
- 主角知道某人的未来命运，但不能直接说出来
- 如何在不暴露穿越身份的前提下改变他人的命运
- "知道你会背叛我，但现在还不能动你"的博弈张力

**挑战三：群像塑造**
- 历史穿越往往涉及大量已知人物
- 每个人物的行为都有"历史惯性"——不能轻易改变他们的性格和立场
- 需要找到合理的叙事切入点来影响这些人物的决策

#### 5.4 势力设计

本创作方法的组织类型为「势力」。势力 Schema 包含以下字段：

| 字段 | 说明 | 设计建议 |
|------|------|---------|
| **势力名称** | 势力的名称 | 历史势力用真名，原创势力名字要符合时代 |
| **势力类型** | 朝廷派系 / 地方势力 / 江湖门派 / 外族势力 / 其他 | 选择势力的类型 |
| **势力类型详情** | 补充说明 | 选择「其他」时必填 |
| **核心人物** | 势力的核心人物 | 势力的领导者或关键决策者 |
| **势力实力** | 势力的整体实力 | 军事、经济、政治三个维度的实力描述 |
| **势力立场** | 友好 / 中立 / 敌对 | 对主角的初始立场 |
| **与主角关系** | 与主角的关系 | 详细描述势力与主角的利益关联和互动方式 |

**势力博弈设计**：
- 历史穿越的核心冲突往往是势力之间的博弈
- 每个势力应有明确的利益诉求和底线
- 势力立场不是固定的——随着主角的行动而变化
- 主角的目标往往是重新排列势力格局

---

### 六、叙事结构：七阶段框架

历史人物穿越小说的叙事框架与通用穿越不同，它遵循独特的七阶段递进结构：

#### 6.1 七阶段框架

```
穿越降临 → 辨明身份 → 利用先知 → 初次改变 →
应对蝴蝶效应 → 先知耗尽 → 最终改命
```

| 阶段 | 叙事目标 | 章节占比 | 核心张力 |
|------|---------|---------|---------|
| **穿越降临** | 穿越发生，主角进入新身份 | 3-5% | 身份确认的困惑 |
| **辨明身份** | 确认自己是谁，了解当前处境 | 5-10% | 信息收集和生存危机 |
| **利用先知** | 利用先知信息获取初步优势 | 10-15% | 先知优势的展示 |
| **初次改变** | 第一次成功改变一个关键事件 | 10-15% | 改变的成就感 |
| **应对蝴蝶效应** | 处理改变带来的意外后果 | 25-30% | 蝴蝶效应的复杂性 |
| **先知耗尽** | 历史偏离原著，先知信息失效 | 15-20% | 失去最大优势后的挣扎 |
| **最终改命** | 在没有先知优势的情况下完成最终目标 | 10-15% | 命运决战 |

#### 6.2 穿越降临（3-5%）

开篇关键要素：
- 现代生活的最后一刻（简短，不超过半章）
- 穿越发生的过程（「穿越方式」字段的具体展开）
- 醒来后的第一个感知——身体不是自己的
- 从环境细节推断时代和身份

#### 6.3 辨明身份（5-10%）

这是历史穿越特有的阶段：
- 主角需要通过环境线索确认自己穿越到了谁身上
- 回忆原著/历史知识，拼凑当前时间节点
- 发现自己距离"命运转折点"还有多远
- 第一次面对身边人——不能暴露穿越身份

#### 6.4 利用先知（10-15%）

先知优势的黄金期：
- 利用对未来事件的了解，提前规避风险
- 在关键决策中做出"超越常人"的正确选择
- 逐步建立信任和影响力
- 但要注意：先知信息的使用必须合理化——不能直接说"我知道未来"

#### 6.5 初次改变（10-15%）

第一个重大转折：
- 主角第一次有意识地改变一个关键事件
- 改变的过程需要精心策划和冒险执行
- 改变成功后的短暂喜悦
- 紧接着——意外后果的第一个征兆

#### 6.6 应对蝴蝶效应（25-30%）

故事的核心段落：
- 每次改变都引发连锁反应
- 有些反应是正面的，有些是灾难性的
- 主角疲于应对越来越偏离的历史
- 先知信息的价值逐渐降低
- 新的敌人、新的困境不断出现

#### 6.7 先知耗尽（15-20%）

转折点：
- 历史已经完全偏离原著轨道
- 主角的先知优势基本消失
- 被迫依靠自身积累的资源、人脉和能力
- 这是角色成长的关键——从"靠先知"到"靠自己"

#### 6.8 最终改命（10-15%）

终局：
- 在没有先知优势的情况下面对最终的命运节点
- 所有此前积累的盟友、资源、布局在此汇聚
- 用自己的智慧和勇气完成最终的命运改写
- 结局可以是完美的逆天改命，也可以是有遗憾的部分成功

---

### 七、常见陷阱与规避

#### 7.1 历史考据错误

**问题**：历史细节出错，破坏读者沉浸感。称呼、官职、礼仪、饮食、服饰等细节错误是最常见的硬伤。

**规避方法**：
- 在「原著背景」的「社会制度」和「文化特征」中详细记录时代细节
- 关键历史事件的时间、地点、参与人物要准确
- 日常生活细节（称谓、饮食、出行方式）要符合时代
- 如果是小说世界穿越，要忠于原著设定

#### 7.2 金手指用尽太快

**问题**：先知信息在前期就大量消耗，中后期无牌可打。

**规避方法**：
- 在「原著剧情」中合理分配剧情节点的密度——不要把所有关键事件集中在前期
- 在「历史事件时间线」中确保关键事件分布在不同时间段
- 先知信息的使用要有策略：先用低价值信息试探，保留高价值信息到关键时刻
- 「金手指」设定中的「使用限制」要严格——不能想用就用

#### 7.3 改变太多导致失控

**问题**：主角改变了太多事件，故事走向完全混乱，读者无法追踪。

**规避方法**：
- 每次只改变一个核心事件，等蝴蝶效应展开后再决定下一步
- 在「历史事件时间线」中标记「不可改变」的事件作为锚点
- 改变的总量要控制——太多改变等于全新世界，失去"历史穿越"的意义
- 保持一条清晰的主线——所有改变都服务于「核心目标」

#### 7.4 身份暴露处理不当

**问题**：穿越身份的暴露或隐藏处理不当，要么太刻意要么太随意。

**规避方法**：
- 从穿越降临开始就设计"几乎暴露"的紧张时刻
- 现代知识的展示要有合理解释（梦中所见、读过一本奇书等）
- 如果选择暴露身份，需要有充分的戏剧理由和后果
- 身份暴露后的人际关系变化要合理处理

#### 7.5 配角沦为工具人

**问题**：历史人物/小说角色只是被主角利用的棋子，缺乏自主性。

**规避方法**：
- 利用角色 Schema 中的「性格特征」和「命运走向」赋予每个角色独立意志
- 被主角影响的角色应有自己的反应和判断，不是被动接受
- 即使是"被利用"的角色，也应展现出被利用的合理性（利益一致、被蒙蔽等）
- 给重要配角设计独立的高光时刻——他们不只是为主角服务

---

### 八、可用类别

本创作方法的 visible_categories 包含：

| 类别 | 用途 |
|------|------|
| **setting** | 7 种设定类型（原著背景、原著剧情、历史事件时间线、穿越设定、金手指、故事钩子、文风设定） |
| **character** | 角色管理（支持三源角色体系：历史人物、小说角色、原创角色） |
| **organization** | 势力管理（朝廷派系、地方势力、江湖门派、外族势力等） |
| **scene** | 场景管理（宫殿、战场、城池、府邸、江湖等） |
| **chapter** | 章节管理（支持核心冲突、历史事件、剧情转折、伏笔等章节特有字段） |

---

### 九、创作工作流摘要

端到端的七步创作流程：

**第一步：确定穿越目标**
- 填写「故事钩子」→ 明确穿越到谁身上、核心卖点是什么
- 填写「穿越设定」→ 确定穿越机制、时间节点、核心目标

**第二步：构建原著世界**
- 填写「原著背景」→ 时代背景、政治格局、社会制度
- 填写「原著剧情」→ 原著概述、关键剧情节点、原著结局

**第三步：设计时间线**
- 填写「历史事件时间线」→ 关键事件、可改变性、改变方式
- 设计蝴蝶效应的级联逻辑

**第四步：配置金手指与文风**
- 填写「金手指」→ 类型、能力、限制、成长空间
- 填写「文风设定」→ 叙事视角、语言风格、节奏、氛围

**第五步：创建角色与势力**
- 创建角色 → 区分历史人物、小说角色、原创角色
- 创建势力 → 定义势力类型、实力、立场

**第六步：设计场景**
- 创建场景 → 宫殿、战场、城池等关键场景
- 为每个场景关联历史原型

**第七步：规划章节**
- 按七阶段框架规划章节结构
- 每章标记核心冲突、历史事件、剧情转折和伏笔
- 确保爽点（改命成功）和危机（蝴蝶效应）交替出现',
  '## Historical Figure Crossing Novel Writing Guide

This guide is designed specifically for the "Historical Figure Crossing Novel" (历史人物穿越小说) creation method. The core concept: a modern person crosses into the body of a specific historical figure or novel character, leveraging foreknowledge of history or the original plot to defy fate and rewrite destiny within the currents of history.

This creation method features **7 setting types** (the most of any creation method), covering source material background, source material plot, historical event timeline, crossing setup, cheat ability, story hook, and writing style -- forming a complete worldview framework for historical crossing fiction.

---

### I. Genre Characteristics and Core Appeal

#### 1.1 What Is Historical Figure Crossing

Historical figure crossing is the sub-genre of crossing fiction with the most pronounced "foreknowledge narrative" character. Unlike isekai crossing, the protagonist''s destination is a **world with a known ending** -- whether real history or a classic novel. The core tension comes from the struggle of "knowing the future but not necessarily being able to change it."

| Core Characteristic | Description |
|--------------------|-------------|
| **Clear crossing target** | Crosses into a specific historical figure or novel character, inheriting their identity, status, and social relationships |
| **Foreknowledge advantage** | Knowledge of historical events or original plot is the protagonist''s greatest cheat ability |
| **Fate rewriting** | The core driving force -- changing the character''s originally tragic fate or historical trajectory |
| **Historical constraints** | Cannot casually alter history; every change has costs and faces resistance |
| **Butterfly effect** | A small change may trigger a chain of uncontrollable consequences, adding narrative complexity |

#### 1.2 Historical Crossing vs. Other Crossing Types

| Dimension | Historical Figure Crossing | Isekai Xuanhuan Crossing | Sci-Fi Crossing |
|-----------|--------------------------|-------------------------|-----------------|
| Worldview | Known world (history/novel) | Entirely new fictional world | Sci-fi universe |
| Power system | Political intrigue, connections, foreknowledge | Cultivation system, cheat ability | Technology, genetic modification |
| Core advantage | Knowing the future | Supernatural ability from cheat | Technological gap |
| Core tension | The cost of changing fate | Obstacles to leveling up | Threats to survival |
| Pacing | Medium to slow, emphasis on strategy | Fast-paced, dense satisfaction points | Medium, alternating exploration and conflict |

#### 1.3 Core Reader Expectations

- **Thrill of defying fate**: Watching the protagonist use foreknowledge to step-by-step reverse an originally tragic ending
- **Historical detail immersion**: Precise historical/source material details that make readers feel they are there
- **Butterfly effect tension**: Every change may trigger unexpected chain reactions
- **Political intrigue wisdom**: Winning not through brute force but through strategy and planning
- **Heroic struggle against fate**: Some things cannot be changed even with foreknowledge, creating deep resonance

---

### II. Setting Fill Order and Field Guidance

This creation method has 7 setting types. The recommended fill order is:

#### 2.1 Step One: Story Hook

The "Story Hook" (故事钩子) setting is the starting point for the entire creation, establishing the core appeal of your story.

| Field | Description | Fill Suggestion |
|-------|-------------|----------------|
| **故事钩子** (Story Hook) | One-sentence summary of the story''s core appeal | E.g., "Crossed into a prince about to be executed; must turn things around within three days" |
| **穿越目标** (Crossing Target) | Which historical figure or novel character to cross into | Specify the exact character, e.g., "Li Jiancheng," "Lin Daiyu" |
| **核心卖点** (Core Selling Point) | What is the story''s biggest draw | Focus on differentiation, e.g., "Using modern financial knowledge to reshape the Three Kingdoms'' economic landscape" |
| **开篇悬念** (Opening Suspense) | How to hook readers at the opening | The crisis or suspense to present in Chapter 1 |
| **读者期待** (Reader Expectations) | What readers will expect to see | Clearly promise the core experience |

#### 2.2 Step Two: Crossing Setup

The "Crossing Setup" (穿越设定) defines the core crossing mechanics.

| Field | Description | Fill Suggestion |
|-------|-------------|----------------|
| **穿越角色** (Crossing Character) | Which historical figure or novel character | Should match the crossing target in Story Hook |
| **角色来源** (Character Origin) | Historical figure / Novel character | Select the character''s origin type |
| **原著/史书** (Source/History Book) | Which history book or novel the character is from | E.g., "Romance of the Three Kingdoms," "Records of the Grand Historian," "Dream of the Red Chamber" |
| **穿越时间节点** (Crossing Time Point) | Which point in the character''s life to cross into | Key timing: too early lacks urgency, too late lacks room to maneuver |
| **穿越方式** (Crossing Method) | Accidental death / Ancient artifact / Dream crossing / Lightning / Other | Select the appropriate trigger mechanism |
| **穿越方式详情** (Crossing Method Details) | Supplementary description of the crossing | Describe the crossing process in detail |
| **穿越者身份** (Crosser''s Identity) | Modern identity before crossing | E.g., programmer, history professor, special forces -- modern identity determines available knowledge |
| **核心目标** (Core Goal) | Defy fate / Conquer the world / Experience life / Save a loved one / Other | The protagonist''s primary goal after crossing |
| **核心目标详情** (Core Goal Details) | Specific goal to achieve | The more specific the better, e.g., "Avoid being killed in the Xuanwu Gate incident" |

**Crossing time point selection strategy**:
- **1-3 years before the fate turning point**: Ample preparation time; suits strategy-focused stories
- **Months before the fate turning point**: Moderate urgency; balanced pressure and room to maneuver
- **Days before the fate turning point**: Extreme urgency; suits fast-paced stories

#### 2.3 Step Three: Source Material Background

The "Source Material Background" (原著背景) builds the foundational environment of the crossing world.

| Field | Description | Fill Suggestion |
|-------|-------------|----------------|
| **时代背景** (Era Background) | The historical period or novel world | Describe overall era characteristics |
| **历史时期** (Historical Period) | Specific dynasty or era | E.g., "Wude era of Tang Dynasty," "Late Eastern Han" |
| **政治格局** (Political Landscape) | Distribution of political forces | Power comparisons and positions of various factions |
| **社会制度** (Social System) | Social system characteristics of the era | Key systems: social hierarchy, imperial examinations, military organization |
| **文化特征** (Cultural Features) | Cultural customs of the era | Cultural context that influences character behavior |
| **关键背景** (Key Background) | Key background information related to the protagonist''s fate | Environmental factors directly affecting the protagonist''s destiny |

#### 2.4 Step Four: Source Material Plot

The "Source Material Plot" (原著剧情) is the information source for foreknowledge advantage.

| Field | Description | Fill Suggestion |
|-------|-------------|----------------|
| **原著概述** (Source Summary) | Summary of the protagonist''s main experiences in the original | Concisely summarize the original character''s life trajectory |
| **关键剧情** (Key Plot Points, array) | Key plot nodes in the original | Each node includes: 剧情节点 (Plot Node), 原著发展 (Original Development), 可改变点 (Changeable Points) |
| **原著结局** (Original Ending) | The protagonist''s final ending in the original | This is the endpoint the protagonist most wants to change |

**Key plot fill example**:
```
Plot Node: Xuanwu Gate Incident
Original Development: Li Jiancheng is killed; Li Shimin seizes power
Changeable Points: Pre-arrange military forces; recruit key generals
```

#### 2.5 Step Five: Historical Event Timeline

The "Historical Event Timeline" (历史事件时间线) is the foundation for butterfly effect design.

| Field | Description | Fill Suggestion |
|-------|-------------|----------------|
| **时间线概述** (Timeline Overview) | Overall timeline summary | Summarize the historical trajectory of the key period |
| **关键事件** (Key Events, array) | Key events on the timeline | Each event includes: 时间 (Time), 事件 (Event), 对主角的影响 (Impact on Protagonist), 可否改变 (Changeability), 改变方式 (Method of Change) |

The **可否改变** (Changeability) field has three levels:
- **可改变** (Changeable): Events that can be directly changed through reasonable means
- **难以改变** (Difficult to Change): Requires great cost or multi-party cooperation to change
- **不可改变** (Unchangeable): Historical momentum too strong for individual power to reverse

#### 2.6 Step Six: Cheat Ability

The "Cheat Ability" (金手指) defines the protagonist''s extra abilities beyond foreknowledge.

| Field | Description | Fill Suggestion |
|-------|-------------|----------------|
| **金手指类型** (Cheat Type) | Historical Foreknowledge / Modern Knowledge / Martial Arts Inheritance / System Assist / Special Physique / Other | Select the core advantage type |
| **金手指类型详情** (Cheat Type Details) | Supplementary description | Required when "Other" is selected; recommended for all types |
| **能力描述** (Ability Description) | Specific abilities of the cheat | Must be specific: what it can and cannot do |
| **使用限制** (Usage Limitations) | Limitations on the cheat ability | The clearer the limitations, the greater the story tension |
| **成长空间** (Growth Potential) | Growth potential of the cheat | Define how the cheat strengthens as the plot develops |
| **获得方式** (Acquisition Method) | How the cheat was obtained | Built-in at crossing vs. acquired later |

**Cheat ability type details**:

| Type | Core Advantage | Best Paired Crosser Identity |
|------|---------------|------------------------------|
| **Historical Foreknowledge** (历史先知) | Precise knowledge of historical events | History professor, history enthusiast |
| **Modern Knowledge** (现代知识) | Technology, medicine, military, etc. | Engineer, doctor, soldier |
| **Martial Arts Inheritance** (武艺传承) | Combat abilities beyond the era | Special forces, martial arts instructor |
| **System Assist** (系统辅助) | Quest system, attribute panel, etc. | Any modern identity |
| **Special Physique** (特殊体质) | Abnormal physique gained after crossing | Any modern identity |

**Design note**: In historical crossing, the cheat ability should not be too powerful. Foreknowledge itself is already a massive cheat; an overpowered additional ability reduces the tension of political intrigue.

#### 2.7 Step Seven: Writing Style

The "Writing Style" (文风设定) defines the writing approach.

| Field | Description | Options |
|-------|-------------|---------|
| **叙事视角** (Narrative Perspective) | Perspective choice | First person / Third person limited / Third person omniscient / Multi-POV |
| **语言风格** (Language Style) | Overall language style | Classical elegant / Semi-classical / Modern colloquial / Humorous |
| **节奏风格** (Pacing Style) | Narrative pacing | Fast-paced / Steady and methodical / Slow-burning and meticulous |
| **氛围基调** (Atmosphere Tone) | Overall story atmosphere | Passionate and intense / Deep political intrigue / Light and comedic / Tragic and heroic |

**Recommended pairings for historical crossing**:
- **Political strategy type**: Third person limited + Semi-classical + Steady + Deep political intrigue
- **Hot-blooded fate-defying type**: First person + Modern colloquial + Fast-paced + Passionate and intense
- **Tragic epic type**: Third person omniscient + Classical elegant + Slow-burning + Tragic and heroic
- **Light comedy type**: First person + Humorous + Fast-paced + Light and comedic

---

### III. Source Material Plot Mapping

The source material plot is the "information treasury" of a historical crossing novel. How you use plot information determines the story''s strategic depth.

#### 3.1 Plot Node Classification

When filling in the "Key Plot Points" (关键剧情) array, classify nodes into four types:

| Node Type | Description | Example |
|-----------|-------------|---------|
| **Core events** | Key turning points determining historical/original trajectory | Xuanwu Gate Incident, Battle of Red Cliffs |
| **Key turning points** | Important nodes affecting the protagonist''s personal fate | Being framed, demotion, losing an ally |
| **Secondary events** | Exploitable opportunities or risks to avoid | A particular imperial exam, a minor battle |
| **Interpersonal interactions** | Events affecting key character relationships | Making an enemy of someone, gaining someone''s trust |

#### 3.2 Changeability Design Strategy

The "Changeable Points" (可改变点) field in each "Key Plot Point" is the core -- it defines the protagonist''s action space.

**Five levels of changeability**:

| Level | Difficulty | Narrative Effect |
|-------|-----------|-----------------|
| **Easy to change** | Simple action is sufficient | Early confidence building; demonstrating foreknowledge |
| **Requires preparation** | Advance planning needed | Mid-stage display of wisdom and patience |
| **Great cost required** | Change demands sacrificing important resources | Increases dramatic tension of decisions |
| **Triggers chain reactions** | Changing one thing causes more changes | Core manifestation of butterfly effect |
| **Cannot be changed** | Historical momentum is irresistible | Creates tragedy and sense of destiny |

#### 3.3 Foreknowledge Depletion

The protagonist''s foreknowledge advantage is not infinite:
- Each successful change may cause subsequent history to diverge from the original
- The more divergence, the lower the value of foreknowledge
- By the mid-to-late story, foreknowledge should be mostly depleted, forcing reliance on personal ability
- This is the core mechanism for maintaining story tension -- foreknowledge is a "consumable resource"

---

### IV. Historical Event Timeline and Butterfly Effect

#### 4.1 Timeline Construction

The "Historical Event Timeline" (历史事件时间线) is a setting type unique to this creation method. When constructing the timeline:

**Timeline structure**:
```
Crossing time point
  |
Near-term events (within 1-3 months) -> Most urgent; requires immediate response
  |
Mid-term events (3-12 months) -> Requires advance planning
  |
Long-term events (1-3 years) -> The ultimate fate nodes
  |
Historical momentum (3+ years) -> Nearly unchangeable macro trends
```

**Five dimensions of each key event**:

| Dimension | Field | Design Focus |
|-----------|-------|-------------|
| **When** | 时间 (Time) | Precise to month or season |
| **What** | 事件 (Event) | Concise event description |
| **Impact** | 对主角的影响 (Impact on Protagonist) | How this event affects the protagonist''s fate |
| **Changeability** | 可否改变 (Changeability) | Changeable / Difficult to change / Unchangeable |
| **Method** | 改变方式 (Method of Change) | If changeable, what conditions and means are needed |

#### 4.2 Butterfly Effect Cascade Design

The butterfly effect is the core narrative engine of historical crossing fiction. Follow five principles when designing butterfly effects:

**Principle One: Clear Causal Chains**
Every chain reaction triggered by a change must be logically consistent. Readers should be able to follow the reasoning: "because A, therefore B; because B, therefore C."

**Principle Two: Escalating Consequences**
- Early changes: Controllable consequences, mostly positive results
- Mid-stage changes: Complex consequences, both positive and negative
- Late-stage changes: Unpredictable consequences, potentially catastrophic results

**Principle Three: Unintended Consequences**
The best butterfly effect design is when the protagonist successfully changes A, but accidentally causes an even worse B:
- Saving someone who was supposed to die -> but that person later becomes a greater threat
- Preventing a military defeat -> but triggering a larger-scale war
- Changing one person''s fate -> but destroying a previously stable power balance

**Principle Four: Significance of Unchangeable Events**
"Unchangeable" events are not decorative. Their roles are:
- Creating a sense of helplessness against fate, adding tragic depth
- Forcing the protagonist to accept certain realities and adjust strategies
- Supporting the theme that "some things are stronger than destiny"

**Principle Five: Timeline Convergence**
By the late story, the altered timeline should gradually converge to a new "equilibrium":
- Not returning to the original history, but forming an entirely new historical path
- The new path should be better than the original but with new problems and challenges
- This leaves room for sequels or open endings

#### 4.3 Timeline Visualization Recommendations

When filling in the "Key Events" (关键事件) array, arrange events chronologically to form a clear timeline:

```
Year XXX, Month X -- Event A (Changeable) -> After change leads to -> Event A''
Year XXX, Month X -- Event B (Difficult to change) -> Requires Event A'' as foundation
Year XXX, Month X -- Event C (Unchangeable) -> Must accept and adapt
Year XXX, Month X -- Ultimate fate node -> All changes'' final impacts converge
```

---

### V. Character Design

This creation method''s character Schema features a unique three-origin character system.

#### 5.1 Three-Origin Character System

The "Character Origin" (角色来源) field provides three options:

| Character Origin | Description | Design Focus |
|-----------------|-------------|-------------|
| **Historical Figure** (历史人物) | Real historical person | Must respect basic historical facts; personality can be interpreted within reasonable bounds |
| **Novel Character** (小说角色) | Character from the source novel | Must be faithful to original characterization, but can change through the protagonist''s butterfly effects |
| **Original Character** (原创角色) | Author-created new character | Used to fill gaps in history/source material; adds narrative flexibility |

#### 5.2 Character Schema Field Details

| Field | Description | Design Suggestion |
|-------|-------------|-------------------|
| **姓名** (Name) | Character''s name | Historical figures use real names; original characters'' names must fit the era |
| **角色来源** (Character Origin) | Historical figure / Novel character / Original character | Clarify origin type |
| **角色定位** (Role) | Protagonist / Important supporting / Antagonist / Minor | Define the character''s functional tier in the story |
| **性别** (Gender) | Male / Female | -- |
| **身份地位** (Status) | Identity and status in the story | E.g., "Crown Prince," "Prime Minister," "General''s daughter" |
| **性格特征** (Personality) | Main personality traits | Combine historical records with story needs |
| **历史原型** (Historical Prototype) | Historical prototype figure | For original characters based on historical figures, note here |
| **与主角关系** (Relationship with Protagonist) | Relationship with the protagonist | Ally, enemy, romantic interest, rival, etc. |
| **命运走向** (Fate Trajectory) | Character''s fate development | Original fate vs. fate after protagonist''s intervention |
| **当前状态** (Current Status, dynamic) | Character''s current state | Updated as the plot progresses; marked as a dynamic field |

#### 5.3 Challenges of Writing Historical Figures

Writing historical figures presents three core challenges:

**Challenge One: Balancing Fact and Fiction**
- Core historical events cannot be arbitrarily altered (unless it is the story''s central conflict)
- Characters'' basic personality traits should align with historical records
- Freely embellish where records are silent
- For controversial historical figures, choose an interpretation angle that serves the story

**Challenge Two: Foreknowledge and Character Interaction**
- The protagonist knows someone''s future fate but cannot directly reveal it
- How to change others'' fates without exposing the crossing identity
- The tension of "I know you will betray me, but I cannot act against you yet"

**Challenge Three: Ensemble Characterization**
- Historical crossing often involves numerous known figures
- Each figure has "historical inertia" -- their personality and stance cannot be easily changed
- Find reasonable narrative entry points to influence these figures'' decisions

#### 5.4 Faction Design

This creation method''s organization type is "Faction" (势力). The faction Schema includes:

| Field | Description | Design Suggestion |
|-------|-------------|-------------------|
| **势力名称** (Faction Name) | The faction''s name | Historical factions use real names; original factions must fit the era |
| **势力类型** (Faction Type) | Court faction / Regional power / Jianghu sect / Foreign power / Other | Select the faction type |
| **势力类型详情** (Faction Type Details) | Supplementary description | Required when "Other" is selected |
| **核心人物** (Core Figure) | The faction''s core figure | The faction''s leader or key decision-maker |
| **势力实力** (Faction Strength) | The faction''s overall strength | Describe strength across military, economic, and political dimensions |
| **势力立场** (Faction Stance) | Friendly / Neutral / Hostile | Initial stance toward the protagonist |
| **与主角关系** (Relationship with Protagonist) | Relationship with the protagonist | Describe in detail the faction''s interest alignment and interaction pattern with the protagonist |

**Faction power-play design**:
- The core conflict in historical crossing is often inter-faction power struggles
- Each faction should have clear interests and bottom lines
- Faction stances are not fixed -- they shift with the protagonist''s actions
- The protagonist''s goal is often to rearrange the faction landscape

---

### VI. Narrative Structure: Seven-Phase Framework

Historical figure crossing novels follow a unique seven-phase progressive structure distinct from generic crossing fiction:

#### 6.1 Seven-Phase Framework

```
Crossing Arrival -> Identity Confirmation -> Leveraging Foreknowledge -> First Change ->
Dealing with Butterfly Effects -> Foreknowledge Depleted -> Ultimate Fate Rewriting
```

| Phase | Narrative Goal | Chapter Ratio | Core Tension |
|-------|---------------|--------------|-------------|
| **Crossing Arrival** | Crossing occurs; protagonist enters new identity | 3-5% | Confusion of identity confirmation |
| **Identity Confirmation** | Confirm who they are; understand current situation | 5-10% | Information gathering and survival crisis |
| **Leveraging Foreknowledge** | Use foreknowledge to gain initial advantage | 10-15% | Demonstration of foreknowledge advantage |
| **First Change** | First successful change of a key event | 10-15% | Achievement of change |
| **Dealing with Butterfly Effects** | Handle unexpected consequences of changes | 25-30% | Complexity of butterfly effects |
| **Foreknowledge Depleted** | History diverges from original; foreknowledge becomes useless | 15-20% | Struggle after losing greatest advantage |
| **Ultimate Fate Rewriting** | Achieve the final goal without foreknowledge advantage | 10-15% | The ultimate battle against fate |

#### 6.2 Crossing Arrival (3-5%)

Opening key elements:
- Last moment of modern life (brief, no more than half a chapter)
- The crossing process (specific expansion of the Crossing Method field)
- First perception after waking -- the body is not their own
- Deducing the era and identity from environmental details

#### 6.3 Identity Confirmation (5-10%)

This phase is unique to historical crossing:
- The protagonist needs to confirm whose body they have crossed into through environmental clues
- Recall source/historical knowledge to piece together the current time point
- Discover how far they are from the "fate turning point"
- First encounter with those around them -- cannot expose the crossing identity

#### 6.4 Leveraging Foreknowledge (10-15%)

The golden period of foreknowledge advantage:
- Use knowledge of future events to proactively avoid risks
- Make "beyond ordinary" correct choices at key decisions
- Gradually build trust and influence
- Important caveat: foreknowledge use must be rationalized -- cannot directly say "I know the future"

#### 6.5 First Change (10-15%)

The first major turning point:
- The protagonist deliberately changes a key event for the first time
- The change process requires careful planning and risky execution
- Brief joy after successful change
- Immediately followed by -- the first signs of unexpected consequences

#### 6.6 Dealing with Butterfly Effects (25-30%)

The core section of the story:
- Every change triggers chain reactions
- Some reactions are positive; others are catastrophic
- The protagonist struggles to cope with increasingly divergent history
- The value of foreknowledge gradually diminishes
- New enemies, new predicaments continuously emerge

#### 6.7 Foreknowledge Depleted (15-20%)

The turning point:
- History has completely diverged from the original track
- The protagonist''s foreknowledge advantage is essentially gone
- Forced to rely on accumulated resources, connections, and abilities
- This is the key moment of character growth -- from "relying on foreknowledge" to "relying on self"

#### 6.8 Ultimate Fate Rewriting (10-15%)

The endgame:
- Face the ultimate fate node without foreknowledge advantage
- All previously accumulated allies, resources, and strategic preparations converge here
- Complete the ultimate fate rewriting through personal wisdom and courage
- The ending can be a perfect fate reversal or a bittersweet partial success

---

### VII. Common Pitfalls and How to Avoid Them

#### 7.1 Historical Research Errors

**Problem**: Historical detail errors that break reader immersion. Errors in forms of address, official titles, etiquette, food, and clothing are the most common hard wounds.

**Prevention**:
- Record era details thoroughly in Source Material Background''s "Social System" (社会制度) and "Cultural Features" (文化特征) fields
- Key historical events'' timing, locations, and participants must be accurate
- Daily life details (forms of address, food, transportation) must fit the era
- If crossing into a novel world, remain faithful to the original''s setting

#### 7.2 Exhausting Foreknowledge Too Quickly

**Problem**: Foreknowledge information is heavily consumed early, leaving no cards to play in the mid-to-late story.

**Prevention**:
- Reasonably distribute plot node density in "Source Material Plot" -- don''t cluster all key events in the early section
- Ensure key events are distributed across different time periods in the "Historical Event Timeline"
- Use foreknowledge strategically: test with low-value information first; save high-value information for critical moments
- The "Usage Limitations" (使用限制) in the "Cheat Ability" setting must be strict -- foreknowledge cannot be used at will

#### 7.3 Too Many Changes Causing Loss of Control

**Problem**: The protagonist changes too many events, and the story direction becomes completely chaotic; readers cannot follow.

**Prevention**:
- Change only one core event at a time; wait for the butterfly effect to unfold before deciding the next step
- Mark "Unchangeable" events as anchors in the "Historical Event Timeline"
- Control the total volume of changes -- too many changes equals a new world, losing the meaning of "historical crossing"
- Maintain a clear main thread -- all changes serve the "Core Goal" (核心目标)

#### 7.4 Mishandling Identity Exposure

**Problem**: The crossing identity''s exposure or concealment is handled poorly, either too contrived or too casual.

**Prevention**:
- Design "near-exposure" tense moments from the very beginning of the crossing
- Modern knowledge displays need reasonable explanations (seen in a dream, read a strange book, etc.)
- If choosing to expose the identity, there must be sufficient dramatic reason and consequences
- Changes in relationships after identity exposure must be handled realistically

#### 7.5 Supporting Characters Becoming Mere Tools

**Problem**: Historical figures/novel characters are just chess pieces used by the protagonist, lacking agency.

**Prevention**:
- Use the character Schema''s "Personality" (性格特征) and "Fate Trajectory" (命运走向) fields to give each character independent will
- Characters influenced by the protagonist should have their own reactions and judgments, not passively accept outcomes
- Even "used" characters should show why being used is reasonable (aligned interests, being deceived, etc.)
- Give important supporting characters independent spotlight moments -- they don''t exist solely to serve the protagonist

---

### VIII. Available Categories

This creation method''s visible_categories include:

| Category | Purpose |
|----------|---------|
| **setting** | 7 setting types (Source Material Background, Source Material Plot, Historical Event Timeline, Crossing Setup, Cheat Ability, Story Hook, Writing Style) |
| **character** | Character management (supports three-origin system: Historical Figure, Novel Character, Original Character) |
| **organization** | Faction management (Court factions, Regional powers, Jianghu sects, Foreign powers, etc.) |
| **scene** | Scene management (Palaces, Battlefields, Cities, Estates, Jianghu locations, etc.) |
| **chapter** | Chapter management (supports chapter-specific fields: Core Conflict, Historical Event, Plot Twist, Foreshadowing) |

---

### IX. Creation Workflow Summary

End-to-end seven-step creation process:

**Step One: Determine Crossing Target**
- Fill in "Story Hook" (故事钩子) -> Clarify who to cross into and the core selling point
- Fill in "Crossing Setup" (穿越设定) -> Determine crossing mechanics, time point, and core goal

**Step Two: Build the Source World**
- Fill in "Source Material Background" (原著背景) -> Era background, political landscape, social system
- Fill in "Source Material Plot" (原著剧情) -> Source summary, key plot nodes, original ending

**Step Three: Design the Timeline**
- Fill in "Historical Event Timeline" (历史事件时间线) -> Key events, changeability, methods of change
- Design the butterfly effect cascade logic

**Step Four: Configure Cheat Ability and Writing Style**
- Fill in "Cheat Ability" (金手指) -> Type, abilities, limitations, growth potential
- Fill in "Writing Style" (文风设定) -> Narrative perspective, language style, pacing, atmosphere

**Step Five: Create Characters and Factions**
- Create characters -> Distinguish historical figures, novel characters, and original characters
- Create factions -> Define faction type, strength, and stance

**Step Six: Design Scenes**
- Create scenes -> Palaces, battlefields, cities, and other key locations
- Associate each scene with its historical prototype

**Step Seven: Plan Chapters**
- Plan chapter structure following the seven-phase framework
- Mark each chapter''s core conflict (核心冲突), historical event (历史事件), plot twist (剧情转折), and foreshadowing (伏笔)
- Ensure alternation between satisfaction points (successful fate changes) and crises (butterfly effects)',
  (SELECT id FROM novel_creation_method WHERE name = '历史人物穿越小说' LIMIT 1),
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
