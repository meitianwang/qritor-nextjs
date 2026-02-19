-- 历史人物穿越小说创作方法专属 Skill / Historical Figure Crossing creation method Skill
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '历史人物穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-historical-plot-adaptation.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'historical-plot-adaptation',
  '历史剧情改编与蝴蝶效应：涵盖七层设定架构填写顺序、原著背景→原著剧情→时间线三层架构、蝴蝶效应设计方法论、角色来源管理、历史先知型金手指消耗节奏、章节历史事件字段使用指南',
  'Historical plot adaptation and butterfly effect: covers seven-layer setting architecture fill order, three-layer architecture of original background -> original plot -> timeline, butterfly effect design methodology, character source management, historical prophet cheat-ability erosion pacing, and chapter historical-event field usage guide',
  '## 历史剧情改编与蝴蝶效应

本指南专为「历史人物穿越小说」创作方法（method 55）设计，聚焦于该方法最核心也最复杂的创作挑战：**如何在已知的历史/原著框架中制造改变，并让这些改变像蝴蝶扇动翅膀一样引发连锁反应**。

本方法拥有 **7 种设定类型**——是所有创作方法中最多的。这意味着世界观的搭建层次更丰富，但也需要更清晰的填写顺序和逻辑链条。

---

### 一、七层设定架构的推荐填写顺序

本方法的 7 种设定类型环环相扣，推荐按以下顺序创建和填写：

```
1. 穿越设定 → 2. 原著背景 → 3. 原著剧情 → 4. 历史事件时间线 → 5. 金手指 → 6. 故事钩子 → 7. 文风设定
```

#### 1.1 为什么是这个顺序

| 顺序 | 设定类型 | 回答的核心问题 | 为下一层提供什么 |
|------|---------|-------------|--------------|
| 1 | **穿越设定** | 谁穿越了？穿到哪里？穿到什么时间点？为什么穿越？ | 确定主角身份和故事坐标 |
| 2 | **原著背景** | 这个世界是什么样的？ | 政治格局、社会制度、文化特征为剧情提供舞台 |
| 3 | **原著剧情** | 原著/史书中发生了什么？ | 主角的"先知信息"来源，可改变点的基础 |
| 4 | **历史事件时间线** | 接下来会发生什么？哪些能改？ | 蝴蝶效应的操作对象和约束条件 |
| 5 | **金手指** | 主角凭什么改变命运？ | 能力边界决定改变的可行性和代价 |
| 6 | **故事钩子** | 用什么吸引读者？ | 开篇悬念和核心卖点 |
| 7 | **文风设定** | 用什么语气讲这个故事？ | 叙事视角、语言风格、节奏风格、氛围基调 |

#### 1.2 每层设定的操作流程

每一层设定的创建流程是：
1. 使用 `get_setting_type_schema` 获取该设定类型的 JSON Schema，了解所有字段及其类型
2. 使用 `list_settings` 查看是否已有该类型的设定实例
3. 根据 Schema 构思字段内容
4. 使用 `update_setting` 创建或更新设定

**注意**：7 个设定中，穿越设定、金手指、故事钩子、文风设定是 singleton（每种只能有一个实例），原著背景、原著剧情、历史事件时间线也是 singleton。理解这一点很重要——每种设定只有一个实例，但内部可以包含丰富的结构化数据（如数组字段）。

---

### 二、原著背景 → 原著剧情 → 历史事件时间线：三层架构

这三个设定类型构成了本方法最独特的"三层世界观"体系。理解它们之间的关系是写好历史穿越的关键。

#### 2.1 三层定义

| 层级 | 设定类型 | 本质 | 信息属性 |
|------|---------|------|---------|
| 第一层 | **原著背景** | 世界的静态基底 | 不随剧情变化 |
| 第二层 | **原著剧情** | 主角"知道的历史" | 主角的信息资产 |
| 第三层 | **历史事件时间线** | "实际会发生的事" | 可被主角干预的动态轨道 |

#### 2.2 原著背景：静态世界基底

原著背景描述的是世界的基本面，它**不会因主角的行动而改变**：

| 必填字段 | 用途 |
|---------|------|
| **时代背景** | 故事发生的历史时期或虚构时代 |
| **政治格局** | 各方势力的基本态势 |

| 选填字段 | 用途 |
|---------|------|
| **历史时期** | 更精确的时间定位 |
| **社会制度** | 社会运行的底层规则 |
| **文化特征** | 影响人物行为和价值观的文化背景 |
| **关键背景** | 其他重要的世界观要素 |

**设计原则**：原著背景要足够丰富以支撑剧情，但不要过度详尽——它是舞台布景，不是主角。重点是那些会**约束主角行动**的要素：政治格局决定了主角能获得什么盟友，社会制度决定了主角做事的方式，文化特征决定了哪些行为会被接受或排斥。

#### 2.3 原著剧情：主角的信息资产

原著剧情描述的是**主角从原著/史书中已知的剧情走向**。这是主角最大的信息优势——他知道"接下来应该发生什么"。

| 字段 | 用途 |
|------|------|
| **原著概述** | 原著/史书的整体故事走向 |
| **关键剧情**（array） | 原著中的关键节点列表 |
| **原著结局** | 原著/史书的最终结局 |

**关键剧情** 是一个数组字段，每个元素包含三个子字段：

| 子字段 | 用途 | 设计要点 |
|--------|------|---------|
| **剧情节点** | 这个节点叫什么 | 简洁命名，如"赤壁之战"、"玄武门之变" |
| **原著发展** | 在原著/史书中这个节点怎么发展的 | 忠实于原著的描述 |
| **可改变点** | 主角可以在哪里介入改变结果 | 具体的切入角度 |

**示例**：
```
关键剧情[0]:
  剧情节点: "赤壁之战"
  原著发展: "孙刘联军借东风火攻曹操水军，曹操大败北撤"
  可改变点: "主角可以提前向曹操透露火攻计划，或帮助曹操改良水军战术"
```

**设计原则**：关键剧情不是越多越好。选择 5-10 个对故事走向影响最大的节点即可。每个节点的"可改变点"必须具体——不是"主角改变了它"，而是"主角通过XXX方式在YYY时间介入，改变了ZZZ"。

#### 2.4 历史事件时间线：蝴蝶效应的操作平台

历史事件时间线是最复杂也最核心的设定类型。它描述的是**如果主角不干预，未来将会发生的事件序列**。

| 必填字段 | 用途 |
|---------|------|
| **时间线概述** | 对整条时间线的总体描述 |

**关键事件** 是一个数组字段，每个元素包含五个子字段：

| 子字段 | 用途 | 重要性 |
|--------|------|--------|
| **时间** | 事件发生的时间 | 建立时序关系 |
| **事件** | 事件内容 | 明确事件本身 |
| **对主角的影响** | 这个事件对主角意味着什么 | 建立利害关系 |
| **可否改变** | 可改变 / 难以改变 / 不可改变 | 蝴蝶效应的核心分类 |
| **改变方式** | 如果可改变，具体怎么改 | 提供操作路径 |

#### 2.5 三层之间的张力

三层架构的叙事张力来自于信息的**不对称和不一致**：

1. **主角知道的** vs **实际会发生的**：原著剧情是主角的认知，历史事件时间线是现实。两者可能不完全一致（原著/史书可能有遗漏或错误）
2. **可改变的** vs **不可改变的**：有些事件主角能改，有些改不了——这种限制制造了真正的戏剧冲突
3. **改变的后果**：改变一个事件后，后续事件的走向也会变化——这就是蝴蝶效应

---

### 三、蝴蝶效应设计

蝴蝶效应是本方法最核心的叙事机制。主角每一次对历史/原著剧情的干预，都应该触发连锁反应。

#### 3.1 可否改变的分类标准

历史事件时间线中的「可否改变」字段有三个选项，分类标准如下：

| 可否改变 | 定义 | 判断标准 | 典型例子 |
|---------|------|---------|---------|
| **可改变** | 取决于个人行动的事件 | 关键节点由少数人的决策决定 | 一场战役的胜负、一次联姻、一个政治联盟 |
| **难以改变** | 由大规模力量驱动的事件 | 涉及经济规律、自然力量或群体惯性 | 饥荒、瘟疫、外族大规模入侵、技术演进 |
| **不可改变** | 基本规律或历史/小说世界的铁律 | 物理定律、人性规律、世界观的底层设定 | 人会老死、资源有限、权力腐蚀人心 |

**设计建议**：
- **可改变** 事件占 40-50%：这是主角施展空间的主体
- **难以改变** 事件占 30-40%：这些事件制造了最大的张力——主角知道它要来但很难阻止
- **不可改变** 事件占 10-20%：这些是世界的基本规则，违反它们就是违反设定

#### 3.2 改变方式的设计

「改变方式」字段必须具体到可执行的步骤。不是"主角阻止了它"，而是：

| 好的改变方式 | 差的改变方式 |
|------------|------------|
| "在某战役前三天将火攻情报传递给对方，使其提前分散水军" | "主角用了某种方法改变了战局" |
| "通过联姻提议将两个敌对家族绑定为利益共同体" | "主角促成了和平" |
| "利用现代医学知识配制简易解毒药，救活中毒的关键人物" | "主角救了他" |

#### 3.3 蝴蝶效应的传播链

改变一个事件后，需要追踪其对后续事件的影响。这是一条因果链：

```
改变事件 A（可改变）
  → 事件 B 的走向因此改变
    → 事件 C 原本会发生，现在可能不会发生
      → 新的事件 D 出现（原时间线中不存在）
```

**示例**：
```
改变: 主角在官渡之战前帮助袁绍纠正了战术错误
  → 袁绍未败，曹操未能统一北方
    → 赤壁之战不会发生（曹操无力南下）
      → 三国鼎立局面可能变成南北对峙
```

**追踪方法**：在创作过程中，每当主角成功改变一个事件，应当重新审视历史事件时间线中后续事件的合理性。如果后续事件因蝴蝶效应而改变，更新该事件的描述或添加新事件。

#### 3.4 蝴蝶效应的不可控性

蝴蝶效应不应该总是按主角的计划发展。好的蝴蝶效应设计应该包括：

1. **预期内的正向效果**：主角计划改变 A，A 确实改变了
2. **预期外的副作用**：改变 A 的同时，意外触发了主角没想到的事件 B
3. **过度纠正**：为了修复副作用 B，主角的新干预又引发了事件 C
4. **失控时刻**：某个节点之后，因果链变得如此复杂，主角已经无法预测接下来会发生什么

这种"越改越复杂"的模式是本方法最强大的张力来源。

---

### 四、角色来源管理

本方法的角色有一个独特字段：「角色来源」，包含三种选项。每种选项对角色设计提出不同的要求。

#### 4.1 三种角色来源

| 角色来源 | 定义 | 设计约束 | 叙事功能 |
|---------|------|---------|---------|
| **历史人物** | 真实存在过的历史人物 | 必须尊重已知的性格特征，可以重新解读动机 | 给读者"与真实历史人物互动"的代入感 |
| **小说角色** | 来自原著小说的虚构人物 | 受限于原著确立的人设 | 让读者看到"如果原著角色做了不同选择" |
| **原创角色** | 作者创造的全新人物 | 自由度最高 | 填补历史/原著的角色空白，提供独特视角 |

#### 4.2 历史人物的处理原则

历史人物是最敏感的角色类型，处理不当会导致读者出戏：

**必须保持的**：
- 已知的核心性格特征（曹操的多疑、诸葛亮的谨慎、项羽的刚烈）
- 已知的关键能力和特长
- 与已知历史/原著角色之间的基本关系

**可以重新解读的**：
- 行为背后的深层动机（为什么做出那个决定？可以给出不同于史书的解释）
- 在面对新情况（主角干预后的蝴蝶效应）时的反应
- 性格中的次要侧面（史书没有详细记载的方面）

#### 4.3 小说角色的处理原则

小说角色的约束比历史人物略宽，但核心人设仍需尊重：
- 保持原著中的标志性性格特征
- 如果主角改变了影响该角色的关键事件，角色的命运可以变化，但性格本质不应突变
- 可以展开原著中未充分展开的方面

#### 4.4 原创角色的平衡

原创角色的功能是填补历史/原著角色阵容的空白：
- 可以作为主角在该时代的独特盟友或对手
- 提供历史人物和小说角色无法承担的叙事功能（如主角的知己、来自底层的视角）
- **数量控制**：原创角色不宜过多，否则会冲淡"历史穿越"的核心吸引力

**推荐比例**：
- 历史人物 40-50%
- 小说角色 20-30%（如果有原著依据）
- 原创角色 20-30%

#### 4.5 历史原型与命运走向字段

每个角色（无论来源）都有两个关键字段：

| 字段 | 用途 | 使用方式 |
|------|------|---------|
| **历史原型** | 角色对应的真实历史人物或原著角色 | 历史人物直接填写本人，小说角色填写原著出处，原创角色填写设计灵感来源 |
| **命运走向** | 主角计划如何改变此角色的命运 | 明确写出"原轨迹→改变后轨迹"的对比 |

**示例**：
```
角色: 赵云
角色来源: 小说角色
历史原型: "《三国演义》中的常山赵子龙，忠勇无双的蜀汉名将"
命运走向: "原著中跟随刘备一生，最终病逝。穿越后主角计划让赵云在更早的阶段获得独立统军的机会，发挥其战略才能而非仅作先锋猛将"
```

---

### 五、"历史先知"型金手指的消耗节奏

本方法最常见的金手指类型是「历史先知」——主角知道未来会发生什么。这种金手指需要精心设计其消耗曲线，否则故事会失去张力。

#### 5.1 核心问题

历史先知型金手指的核心矛盾是：**主角越成功地改变历史，他的先知能力就越不可靠**。这是一个天然的自我消耗机制。

#### 5.2 三阶段消耗模型

| 阶段 | 章节范围（建议） | 先知可靠度 | 主角状态 |
|------|---------------|----------|---------|
| **初期** | 第 1-30 章 | 高度准确（80-95%） | 凭借精准预知快速获得优势，扮猪吃虎 |
| **中期** | 第 30-80 章 | 逐渐失准（40-70%） | 蝴蝶效应积累，部分预知失效，需要临场应变 |
| **后期** | 第 80 章以后 | 基本失效（0-30%） | 时间线已严重偏移，主角"失明"，与所有人站在同一起跑线 |

#### 5.3 初期：信息碾压阶段

在故事初期，主角的先知能力近乎全知：
- 知道接下来会发生什么事件
- 知道谁会背叛、谁会忠诚
- 知道哪里有宝藏、哪个策略会成功

**写作要点**：
- 这个阶段是传统意义上的"爽文"阶段——读者享受主角洞悉一切的优越感
- 但要在爽感中埋下隐患：每次成功干预都在侵蚀先知能力的基础
- 适时让主角意识到"我改变的越多，知道的就越少"

#### 5.4 中期：信息衰减阶段

这是全书最精彩也最考验功力的阶段：
- 主角的部分预知开始失效——他知道某场战役会发生，但因为之前的蝴蝶效应，参战双方的兵力已经不同了
- 主角需要从"依赖先知信息"转向"结合先知信息与实际判断"
- 出现"先知陷阱"——主角按照原著/史书行动，但现实已经偏移，导致判断失误

**写作要点**：
- 安排 2-3 次"先知失败"事件，让主角（和读者）意识到先知能力在衰退
- 每次失败的规模递增：第一次只是小事出错，第二次造成严重后果，第三次险些致命
- 主角开始建立自己的情报网络和判断体系，作为先知能力的补充

#### 5.5 后期：独立判断阶段

当蝴蝶效应积累到一定程度，时间线与原著/史书的偏差已大到先知信息基本无用：
- 主角与其他角色处于同一信息水平
- 但主角在前两个阶段积累了资源、人脉、经验和声望
- 胜负取决于主角自身的智慧和意志，而非先知优势

**写作要点**：
- 这个阶段是角色弧光的高潮——主角从依赖外挂成长为真正的领袖/谋士/英雄
- 最终决战不应依赖先知信息，而应展示主角在这个世界中成长出的真实能力

#### 5.6 其他金手指类型的消耗设计

本方法支持多种金手指类型，每种都应有类似的消耗曲线：

| 金手指类型 | 初期优势 | 消耗/限制方式 | 后期状态 |
|-----------|---------|-------------|---------|
| **历史先知** | 精准预知未来事件 | 蝴蝶效应导致预知失效 | 基本失明 |
| **现代知识** | 超越时代的科技/医学/军事知识 | 缺乏原材料和工艺基础，逐步被时代吸收 | 知识优势被稀释 |
| **武艺传承** | 强大的个人武力 | 面对越来越大规模的战争，个人武力作用下降 | 从战士转型为指挥者 |
| **系统辅助** | 任务/属性/商店 | 系统资源耗尽或功能限制 | 系统沉默，靠自己 |
| **特殊体质** | 异于常人的身体能力 | 过度使用导致副作用或被人发现 | 能力受控但不再是碾压级 |

**关键原则**：在穿越设定中的「使用限制」字段编码这种消耗机制。明确写出限制条件，让 AI 在写作时能参考执行。

---

### 六、章节的历史事件字段使用

本方法的章节拥有四个独有字段，每个字段服务于不同的叙事功能。

#### 6.1 核心冲突

**定义**：驱动本章叙事的核心矛盾。

**与章节大纲的区别**：章节大纲描述"这一章发生了什么"，核心冲突描述"这一章的戏剧张力来自哪里"。

| 好的核心冲突 | 差的核心冲突 |
|------------|------------|
| "主角必须在救护关键盟友和保守穿越秘密之间做出选择" | "主角打了一场仗" |
| "两位谋士对下一步战略的分歧升级为路线之争" | "大家讨论了一下" |
| "主角的历史预知与实际战况出现重大偏差" | "战况有变化" |

#### 6.2 历史事件

**定义**：本章涉及的具体历史事件（对应历史事件时间线中的条目）。

**用途**：将章节与历史事件时间线关联起来，便于追踪哪些事件在哪些章节中被触发或改变。

**填写建议**：
- 如果本章直接处理某个历史事件，填写该事件的名称
- 如果本章是某个历史事件的铺垫，填写"XXX事件前奏"
- 如果本章处理蝴蝶效应的连锁反应，填写触发链的源头事件

#### 6.3 剧情转折

**定义**：主角的行动在本章中造成的出人意料的结果。

**与核心冲突的区别**：核心冲突是章节开始时的矛盾，剧情转折是章节进行中或结尾的意外变化。

**设计原则**：
- 剧情转折应该是蝴蝶效应的直接体现——主角做了某事，结果出乎意料
- 不是每章都需要剧情转折，但每 3-5 章应该有一次显著的转折
- 转折可以是正面的（意外获得盟友）也可以是负面的（意外树敌）

#### 6.4 伏笔

**定义**：基于主角的历史知识埋下的线索，在后续章节中回收。

**伏笔的类型**：

| 伏笔类型 | 说明 | 示例 |
|---------|------|------|
| **历史预言型** | 主角提前暗示某事会发生 | 主角对盟友说"今年冬天会特别冷"（因为他知道即将有寒灾） |
| **身份线索型** | 暗示主角穿越身份的蛛丝马迹 | 主角不经意说出不属于这个时代的词汇 |
| **能力铺垫型** | 为后续使用某种能力做准备 | 主角偷偷收集药材，为后续治愈关键人物做准备 |
| **关系预设型** | 提前与某个角色建立联系 | 主角对一个目前不起眼的人物格外友好（因为知道此人日后会崛起） |

---

### 七、工具使用指南

#### 7.1 设定类型操作

按照第一节的推荐顺序，依次操作 7 种设定类型：

```
步骤一：穿越设定
  - get_setting_type_schema("穿越设定") → 了解字段
  - update_setting → 填写穿越角色、角色来源、穿越时间节点、核心目标
  - 重点字段：穿越方式（意外身亡/古物触发/梦境穿越/雷击/其他）、
              核心目标（逆天改命/争霸天下/体验人生/拯救挚爱/其他）

步骤二：原著背景
  - get_setting_type_schema("原著背景") → 了解字段
  - update_setting → 填写时代背景、政治格局（必填），以及历史时期、社会制度、文化特征、关键背景（选填）

步骤三：原著剧情
  - get_setting_type_schema("原著剧情") → 了解字段
  - update_setting → 填写原著概述、关键剧情（array）、原著结局
  - 关键剧情的每个元素需填写：剧情节点、原著发展、可改变点

步骤四：历史事件时间线
  - get_setting_type_schema("历史事件时间线") → 了解字段
  - update_setting → 填写时间线概述（必填）、关键事件（array）
  - 关键事件的每个元素需填写：时间、事件、对主角的影响、可否改变、改变方式

步骤五：金手指
  - get_setting_type_schema("金手指") → 了解字段
  - update_setting → 填写金手指类型、能力描述、使用限制、成长空间、获得方式
  - 在使用限制中编码消耗曲线（参考第五节）

步骤六：故事钩子
  - get_setting_type_schema("故事钩子") → 了解字段
  - update_setting → 填写故事钩子、穿越目标、核心卖点（必填），以及开篇悬念、读者期待（选填）

步骤七：文风设定
  - get_setting_type_schema("文风设定") → 了解字段
  - update_setting → 填写叙事视角、语言风格、节奏风格、氛围基调
  - 语言风格选项：古风典雅/半文半白/现代通俗/幽默诙谐
  - 氛围基调选项：热血激昂/权谋深沉/轻松搞笑/悲壮苍凉
```

#### 7.2 角色操作

使用 `create_character` 创建角色时，重点填写历史穿越特有字段：

| 字段 | 说明 |
|------|------|
| **角色来源** | 选择：历史人物 / 小说角色 / 原创角色 |
| **历史原型** | 描述该角色对应的历史原型 |
| **命运走向** | 描述主角计划如何改变此角色的命运 |
| **当前状态**（动态） | 角色在故事当前时间点的状态 |

**角色创建顺序建议**：
1. 主角（穿越者本人）
2. 与主角核心目标直接相关的历史人物/小说角色
3. 主角的主要盟友
4. 主角的主要对手
5. 关键配角和原创角色

#### 7.3 场景操作

使用 `create_scene` 创建场景时，利用历史穿越特有字段：

| 字段 | 说明 |
|------|------|
| **场景类型** | 选择：宫殿 / 战场 / 城池 / 府邸 / 江湖 / 其他 |
| **历史原型** | 描述该场景对应的真实历史地点 |

**场景设计建议**：
- 宫殿场景适合权谋剧情
- 战场场景适合蝴蝶效应的大规模展示
- 城池场景适合日常生活和社会描写
- 府邸场景适合私密对话和密谋
- 江湖场景适合主角身份未暴露时的自由行动

#### 7.4 组织操作

本方法的组织类型是「势力」，使用特有字段：

| 字段 | 说明 |
|------|------|
| **势力类型** | 选择：朝廷派系 / 地方势力 / 江湖门派 / 外族势力 / 其他 |
| **势力立场** | 选择：友好 / 中立 / 敌对 |

**势力设计建议**：
- 势力立场应该随蝴蝶效应而变化——主角改变历史事件后，各势力的态度也会调整
- 不要所有势力都对主角敌对——维持一个动态的友好/中立/敌对平衡
- 势力之间的关系网络应该足够复杂，让主角的每一次干预都牵一发而动全身

#### 7.5 章节操作

使用 `update_chapter_outline` 更新章节大纲时，充分利用四个特有字段：

```
update_chapter_outline:
  核心冲突: "本章的核心矛盾（参考第六节 6.1）"
  历史事件: "本章涉及的历史事件（参考第六节 6.2）"
  剧情转折: "本章的意外转折（参考第六节 6.3）"
  伏笔: "本章埋下的伏笔（参考第六节 6.4）"
```

**章节设计的蝴蝶效应检查**：
- 这一章是否引用了历史事件时间线中的某个事件？
- 主角在这一章是否对该事件进行了干预？
- 干预的结果是否会影响后续章节中的其他事件？
- 如果会，是否已经在后续章节的规划中反映了这种影响？',
  '## Historical Plot Adaptation and Butterfly Effect

This guide is designed specifically for the "Historical Figure Crossing Novel" (历史人物穿越小说) creation method (method 55), focusing on the method''s most central and complex creative challenge: **how to engineer changes within a known historical/source-material framework, and how those changes propagate like a butterfly''s wingbeat into chain reactions**.

This method has **7 setting types**—the most of any creation method. This means the worldview construction has the richest layering, but also demands a clearer fill order and logical chain.

---

### I. Recommended Fill Order for the Seven-Layer Setting Architecture

The 7 setting types in this method are tightly interlocked. The recommended creation and fill order is:

```
1. Crossing Setup -> 2. Original Background -> 3. Original Plot -> 4. Historical Event Timeline -> 5. Cheat Ability -> 6. Story Hook -> 7. Writing Style
```

#### 1.1 Why This Order

| Order | Setting Type | Core Question Answered | What It Provides to the Next Layer |
|-------|-------------|----------------------|-----------------------------------|
| 1 | **Crossing Setup** (穿越设定) | Who crossed? Where to? When? Why? | Establishes the protagonist''s identity and story coordinates |
| 2 | **Original Background** (原著背景) | What is this world like? | Political landscape, social systems, and cultural traits provide the stage for the plot |
| 3 | **Original Plot** (原著剧情) | What happened in the source material / historical records? | Source of the protagonist''s "prophetic information"; basis for alterable points |
| 4 | **Historical Event Timeline** (历史事件时间线) | What will happen next? Which events can be changed? | Operating targets and constraints for the butterfly effect |
| 5 | **Cheat Ability** (金手指) | What gives the protagonist the power to change destiny? | Ability boundaries determine the feasibility and cost of changes |
| 6 | **Story Hook** (故事钩子) | What draws readers in? | Opening suspense and core selling points |
| 7 | **Writing Style** (文风设定) | In what voice is this story told? | Narrative perspective, language style, pacing style, atmosphere tone |

#### 1.2 Operation Flow for Each Setting Layer

The creation flow for each setting layer is:
1. Use `get_setting_type_schema` to retrieve the JSON Schema for that setting type, understanding all fields and their types
2. Use `list_settings` to check whether an instance of that type already exists
3. Design field content based on the Schema
4. Use `update_setting` to create or update the setting

**Note**: All 7 settings are singletons (one instance each). Understanding this is important—each setting type has only one instance, but internally it can contain rich structured data (such as array fields).

---

### II. Original Background -> Original Plot -> Historical Event Timeline: The Three-Layer Architecture

These three setting types form this method''s most distinctive "three-layer worldview" system. Understanding their relationships is the key to writing effective historical crossing fiction.

#### 2.1 Three-Layer Definitions

| Layer | Setting Type | Essence | Information Property |
|-------|-------------|---------|---------------------|
| Layer 1 | **Original Background** (原著背景) | The world''s static foundation | Does not change with the plot |
| Layer 2 | **Original Plot** (原著剧情) | The history the protagonist "knows" | The protagonist''s information asset |
| Layer 3 | **Historical Event Timeline** (历史事件时间线) | What "will actually happen" | A dynamic track that can be intervened upon by the protagonist |

#### 2.2 Original Background: The Static World Foundation

The Original Background describes the world''s fundamentals—things that **do not change due to the protagonist''s actions**:

| Required Field | Purpose |
|---------------|---------|
| **Era Background** (时代背景) | The historical period or fictional era in which the story takes place |
| **Political Landscape** (政治格局) | The basic posture of various factions |

| Optional Field | Purpose |
|---------------|---------|
| **Historical Period** (历史时期) | More precise temporal positioning |
| **Social System** (社会制度) | The underlying rules of how society operates |
| **Cultural Traits** (文化特征) | Cultural context that influences character behavior and values |
| **Key Background** (关键背景) | Other important worldview elements |

**Design principle**: The Original Background should be rich enough to support the plot but not overly exhaustive—it is the stage scenery, not the protagonist. Focus on elements that **constrain the protagonist''s actions**: the political landscape determines what allies the protagonist can find, the social system determines how the protagonist can act, and cultural traits determine which behaviors are accepted or rejected.

#### 2.3 Original Plot: The Protagonist''s Information Asset

The Original Plot describes **the plot trajectory the protagonist already knows from the source material / historical records**. This is the protagonist''s greatest information advantage—they know "what should happen next."

| Field | Purpose |
|-------|---------|
| **Original Synopsis** (原著概述) | The overall story trajectory of the source material / historical records |
| **Key Plot Points** (关键剧情, array) | List of critical nodes from the source material |
| **Original Ending** (原著结局) | The final outcome of the source material / historical records |

**Key Plot Points** is an array field where each element contains three sub-fields:

| Sub-field | Purpose | Design Notes |
|-----------|---------|-------------|
| **Plot Node** (剧情节点) | What this node is called | Concise naming, e.g., "Battle of Red Cliffs," "Xuanwu Gate Incident" |
| **Original Development** (原著发展) | How this node developed in the source material / historical records | Faithful description of the source |
| **Alterable Point** (可改变点) | Where the protagonist can intervene to change the outcome | Specific angle of intervention |

**Design principle**: Key Plot Points should not be excessive. Select 5-10 nodes with the greatest impact on the story trajectory. Each node''s "Alterable Point" must be specific—not "the protagonist changed it" but "the protagonist intervened at time YYY via method XXX to change ZZZ."

#### 2.4 Historical Event Timeline: The Butterfly Effect''s Operating Platform

The Historical Event Timeline is the most complex and core setting type. It describes **the sequence of events that will occur if the protagonist does not intervene**.

| Required Field | Purpose |
|---------------|---------|
| **Timeline Overview** (时间线概述) | An overall description of the entire timeline |

**Key Events** (关键事件) is an array field where each element contains five sub-fields:

| Sub-field | Purpose | Importance |
|-----------|---------|-----------|
| **Time** (时间) | When the event occurs | Establishes temporal relationships |
| **Event** (事件) | Event content | Defines the event itself |
| **Impact on Protagonist** (对主角的影响) | What this event means for the protagonist | Establishes stakes |
| **Changeability** (可否改变) | Changeable / Difficult to change / Unchangeable | Core butterfly-effect classification |
| **Method of Change** (改变方式) | If changeable, how specifically to change it | Provides an operational path |

#### 2.5 Tension Between the Three Layers

The narrative tension of the three-layer architecture comes from informational **asymmetry and inconsistency**:

1. **What the protagonist knows** vs. **what will actually happen**: The Original Plot is the protagonist''s cognition; the Historical Event Timeline is reality. The two may not perfectly align (the source material / records may have omissions or errors)
2. **What can be changed** vs. **what cannot**: Some events the protagonist can alter, some they cannot—this limitation creates genuine dramatic conflict
3. **Consequences of change**: After changing one event, subsequent events shift trajectory—this is the butterfly effect

---

### III. Butterfly Effect Design

The butterfly effect is this method''s most central narrative mechanism. Every intervention the protagonist makes in historical / source-material events should trigger chain reactions.

#### 3.1 Changeability Classification Criteria

The "Changeability" (可否改变) field in the Historical Event Timeline has three options:

| Changeability | Definition | Criteria | Typical Examples |
|--------------|-----------|----------|-----------------|
| **Changeable** (可改变) | Events dependent on individual actions | Key outcomes determined by a few people''s decisions | A battle''s outcome, a marriage, a political alliance |
| **Difficult to change** (难以改变) | Events driven by large-scale forces | Involving economic laws, natural forces, or collective inertia | Famine, plague, large-scale foreign invasion, technological evolution |
| **Unchangeable** (不可改变) | Fundamental laws or iron rules of the historical/fictional world | Physical laws, human nature, the worldview''s foundational settings | People age and die, resources are finite, power corrupts |

**Design recommendations**:
- **Changeable** events: 40-50% — this is the protagonist''s primary operating space
- **Difficult to change** events: 30-40% — these create the greatest tension, as the protagonist knows they are coming but can hardly prevent them
- **Unchangeable** events: 10-20% — these are the world''s basic rules; violating them violates the setting

#### 3.2 Designing Methods of Change

The "Method of Change" (改变方式) field must be specific enough to be actionable:

| Good Method of Change | Poor Method of Change |
|----------------------|----------------------|
| "Three days before the battle, relay fire-attack intelligence to the opposing side, causing them to disperse their navy in advance" | "The protagonist used some method to change the battle" |
| "Propose a marriage alliance to bind two rival families into a community of interest" | "The protagonist brokered peace" |
| "Use modern medical knowledge to prepare a simple antidote, saving a key figure from poisoning" | "The protagonist saved them" |

#### 3.3 Butterfly Effect Propagation Chains

After changing one event, track its impact on subsequent events. This forms a causal chain:

```
Change Event A (changeable)
  -> Event B''s trajectory shifts as a result
    -> Event C was supposed to happen; now it may not
      -> New Event D appears (did not exist in the original timeline)
```

**Tracking method**: During the creative process, whenever the protagonist successfully changes an event, re-examine the plausibility of subsequent events in the Historical Event Timeline. If later events have been altered by the butterfly effect, update their descriptions or add new events.

#### 3.4 The Uncontrollability of the Butterfly Effect

The butterfly effect should not always unfold according to the protagonist''s plan. Good butterfly-effect design should include:

1. **Expected positive effects**: The protagonist plans to change A, and A does change
2. **Unexpected side effects**: Changing A inadvertently triggers Event B, which the protagonist did not anticipate
3. **Over-correction**: Attempting to fix side effect B, the protagonist''s new intervention triggers Event C
4. **Loss of control**: Past a certain point, the causal chain becomes so complex that the protagonist can no longer predict what happens next

This pattern of "the more you change, the more complicated it gets" is this method''s most powerful source of tension.

---

### IV. Character Source Management

Characters in this method have a unique field: "Character Source" (角色来源), with three options. Each imposes different requirements on character design.

#### 4.1 Three Character Sources

| Source | Definition | Design Constraints | Narrative Function |
|--------|-----------|-------------------|-------------------|
| **Historical Figure** (历史人物) | A real person from history | Must respect known personality traits; can reinterpret motivations | Gives readers the immersion of "interacting with real historical figures" |
| **Novel Character** (小说角色) | A fictional character from the source novel | Bound by the characterization established in the source material | Lets readers see "what if this source-material character made a different choice" |
| **Original Character** (原创角色) | A wholly new character created by the author | Maximum freedom | Fills gaps in the historical / source-material cast; provides unique perspectives |

#### 4.2 Handling Historical Figures

Historical figures are the most sensitive character type; poor handling breaks reader immersion:

**Must maintain**:
- Known core personality traits (Cao Cao''s suspicion, Zhuge Liang''s caution, Xiang Yu''s ferocity)
- Known key abilities and specialties
- Basic relationships with other known historical / source-material characters

**Can reinterpret**:
- Deep motivations behind actions (why they made that decision—offer an explanation different from the historical records)
- Reactions to new situations (the butterfly effect after the protagonist''s intervention)
- Secondary personality facets (aspects not recorded in detail by the historical sources)

#### 4.3 Handling Novel Characters

Novel characters have slightly looser constraints than historical figures, but core characterization must be respected:
- Maintain the signature personality traits from the source material
- If the protagonist changes key events affecting that character, the character''s destiny can shift, but their fundamental nature should not abruptly transform
- Expand aspects that the source material did not fully develop

#### 4.4 Balancing Original Characters

Original characters function to fill gaps in the historical / source-material cast:
- They can serve as the protagonist''s unique allies or adversaries in that era
- They provide narrative functions that historical and novel characters cannot fulfill (e.g., the protagonist''s confidant, a perspective from the lower classes)
- **Quantity control**: Too many original characters dilutes the core appeal of "historical crossing"

**Recommended ratio**:
- Historical figures: 40-50%
- Novel characters: 20-30% (if a source novel exists)
- Original characters: 20-30%

#### 4.5 Historical Prototype and Destiny Fields

Every character (regardless of source) has two key fields:

| Field | Purpose | Usage |
|-------|---------|-------|
| **Historical Prototype** (历史原型) | The real historical figure or source-material character this character corresponds to | For historical figures, fill in the person themselves; for novel characters, cite the source; for original characters, note the design inspiration |
| **Planned Destiny** (命运走向) | How the protagonist plans to change this character''s fate | Explicitly write the comparison of "original trajectory -> altered trajectory" |

---

### V. Erosion Pacing for the "Historical Prophet" Cheat Ability

The most common cheat-ability type (金手指类型) for this method is "Historical Prophet" (历史先知)—the protagonist knows what will happen in the future. This cheat ability requires carefully designed erosion pacing, or the story loses tension.

#### 5.1 The Core Problem

The core contradiction of the Historical Prophet cheat ability is: **the more successfully the protagonist changes history, the less reliable their prophetic ability becomes**. This is a natural self-consuming mechanism.

#### 5.2 Three-Phase Erosion Model

| Phase | Chapter Range (suggested) | Prophetic Reliability | Protagonist State |
|-------|--------------------------|----------------------|-------------------|
| **Early** | Chapters 1-30 | Highly accurate (80-95%) | Gains rapid advantage through precise foreknowledge; plays the hidden dragon |
| **Middle** | Chapters 30-80 | Gradually unreliable (40-70%) | Butterfly effects accumulate; some predictions fail; must adapt in real time |
| **Late** | Chapter 80+ | Essentially defunct (0-30%) | Timeline has diverged severely; protagonist is "blind," on equal footing with everyone else |

#### 5.3 Early Phase: Information Dominance

In the story''s early phase, the protagonist''s prophetic ability is near-omniscient:
- Knows what events will occur next
- Knows who will betray and who will remain loyal
- Knows where treasures lie and which strategies will succeed

**Writing tips**:
- This phase is the classic "power fantasy" phase—readers enjoy the protagonist''s all-knowing superiority
- But seed warning signs within the satisfaction: every successful intervention erodes the foundation of prophetic ability
- Let the protagonist realize at appropriate moments: "The more I change, the less I know"

#### 5.4 Middle Phase: Information Decay

This is the most brilliant and craft-demanding phase of the book:
- Some of the protagonist''s predictions begin failing—they know a certain battle will occur, but due to earlier butterfly effects, the armies'' compositions have changed
- The protagonist must shift from "relying on prophetic information" to "combining prophetic information with real-time judgment"
- "Prophet traps" appear—the protagonist acts according to the source material / historical records, but reality has shifted, leading to misjudgment

**Writing tips**:
- Arrange 2-3 "prophet failure" events to make the protagonist (and readers) realize prophetic ability is declining
- Each failure should escalate: the first involves only a minor error, the second causes serious consequences, the third is nearly fatal
- The protagonist begins building their own intelligence network and judgment framework to supplement the fading prophetic ability

#### 5.5 Late Phase: Independent Judgment

When butterfly effects accumulate beyond a threshold and the timeline diverges so far from the source material / historical records that prophetic information is essentially useless:
- The protagonist operates at the same information level as other characters
- But the protagonist has accumulated resources, connections, experience, and reputation over the first two phases
- Victory depends on the protagonist''s own wisdom and willpower, not prophetic advantage

**Writing tips**:
- This phase is the character arc''s climax—the protagonist grows from relying on a cheat ability to becoming a true leader / strategist / hero
- The final confrontation should not depend on prophetic information but should showcase the real abilities the protagonist has developed in this world

#### 5.6 Erosion Design for Other Cheat-Ability Types

This method supports multiple cheat-ability types, each of which should have a similar erosion curve:

| Cheat-Ability Type | Early Advantage | Erosion / Limitation Mechanism | Late-Stage State |
|-------------------|-----------------|-------------------------------|-----------------|
| **Historical Prophet** (历史先知) | Precise foreknowledge of future events | Butterfly effects invalidate predictions | Essentially blind |
| **Modern Knowledge** (现代知识) | Technology / medical / military knowledge beyond the era | Lacks raw materials and craftsmanship foundations; gradually absorbed by the era | Knowledge advantage diluted |
| **Martial Arts Legacy** (武艺传承) | Powerful individual combat ability | As wars scale up, individual prowess becomes less decisive | Transitions from warrior to commander |
| **System Assist** (系统辅助) | Quests / stats / shop | System resources deplete or functions become restricted | System goes silent; rely on yourself |
| **Special Physique** (特殊体质) | Superhuman physical abilities | Overuse causes side effects or attracts unwanted attention | Abilities controlled but no longer overwhelming |

**Key principle**: Encode this erosion mechanism in the "Usage Limitations" (使用限制) field of the Crossing Setup. Explicitly write the limitation conditions so the AI can reference and enforce them during writing.

---

### VI. Using Historical Event Fields in Chapters

Chapters in this method have four unique fields, each serving a different narrative function.

#### 6.1 Core Conflict (核心冲突)

**Definition**: The core contradiction driving this chapter''s narrative.

**Difference from chapter outline**: The chapter outline describes "what happens in this chapter"; the core conflict describes "where the dramatic tension in this chapter comes from."

| Good Core Conflict | Poor Core Conflict |
|-------------------|-------------------|
| "The protagonist must choose between saving a key ally and keeping their crossing identity secret" | "The protagonist fought a battle" |
| "Two strategists'' disagreement on the next move escalates into a clash of strategic doctrines" | "Everyone discussed things" |
| "The protagonist''s historical prediction diverges significantly from the actual battlefield situation" | "The battle situation changed" |

#### 6.2 Historical Event (历史事件)

**Definition**: The specific historical event involved in this chapter (corresponding to entries in the Historical Event Timeline).

**Purpose**: Links chapters to the Historical Event Timeline, making it easy to track which events are triggered or changed in which chapters.

**Fill tips**:
- If this chapter directly handles a historical event, fill in that event''s name
- If this chapter is a prelude to a historical event, fill in "Prelude to XXX event"
- If this chapter deals with chain reactions from the butterfly effect, fill in the source event of the trigger chain

#### 6.3 Plot Twist (剧情转折)

**Definition**: The unexpected result caused by the protagonist''s actions in this chapter.

**Difference from core conflict**: Core conflict is the contradiction at the chapter''s start; plot twist is the surprise change during or at the end of the chapter.

**Design principles**:
- Plot twists should be direct manifestations of the butterfly effect—the protagonist did something, and the result was unexpected
- Not every chapter needs a plot twist, but there should be a significant one every 3-5 chapters
- Twists can be positive (unexpectedly gaining an ally) or negative (unexpectedly making an enemy)

#### 6.4 Foreshadowing (伏笔)

**Definition**: Clues planted based on the protagonist''s historical knowledge, to be resolved in later chapters.

**Types of foreshadowing**:

| Type | Description | Example |
|------|-------------|---------|
| **Historical prophecy** | The protagonist subtly hints that something will happen | The protagonist tells an ally "this winter will be exceptionally cold" (because they know a cold disaster is coming) |
| **Identity clue** | Hints at the protagonist''s crossing identity | The protagonist accidentally uses vocabulary that does not belong to this era |
| **Ability setup** | Preparation for using a certain ability later | The protagonist secretly gathers medicinal herbs, preparing to heal a key figure later |
| **Relationship preemption** | Establishing a connection with a character early | The protagonist is notably friendly to a currently insignificant person (because they know this person will rise to prominence later) |

---

### VII. Tool Usage Guide

#### 7.1 Setting Type Operations

Follow the recommended order from Section I, operating on the 7 setting types sequentially:

```
Step 1: Crossing Setup (穿越设定)
  - get_setting_type_schema("穿越设定") -> understand fields
  - update_setting -> fill in crossing character, character source, crossing time node, core goal
  - Key fields: crossing method (accidental death / artifact trigger / dream crossing / lightning / other),
                core goal (defy destiny / conquer the world / experience life / save a loved one / other)

Step 2: Original Background (原著背景)
  - get_setting_type_schema("原著背景") -> understand fields
  - update_setting -> fill in era background, political landscape (required), plus historical period, social system, cultural traits, key background (optional)

Step 3: Original Plot (原著剧情)
  - get_setting_type_schema("原著剧情") -> understand fields
  - update_setting -> fill in original synopsis, key plot points (array), original ending
  - Each key plot point element needs: plot node, original development, alterable point

Step 4: Historical Event Timeline (历史事件时间线)
  - get_setting_type_schema("历史事件时间线") -> understand fields
  - update_setting -> fill in timeline overview (required), key events (array)
  - Each key event element needs: time, event, impact on protagonist, changeability, method of change

Step 5: Cheat Ability (金手指)
  - get_setting_type_schema("金手指") -> understand fields
  - update_setting -> fill in cheat-ability type, ability description, usage limitations, growth potential, acquisition method
  - Encode the erosion curve in the usage limitations (see Section V)

Step 6: Story Hook (故事钩子)
  - get_setting_type_schema("故事钩子") -> understand fields
  - update_setting -> fill in story hook, crossing objective, core selling point (required), plus opening suspense, reader expectations (optional)

Step 7: Writing Style (文风设定)
  - get_setting_type_schema("文风设定") -> understand fields
  - update_setting -> fill in narrative perspective, language style, pacing style, atmosphere tone
  - Language style options: classical elegance / semi-classical / modern colloquial / humorous
  - Atmosphere tone options: passionate / scheming / lighthearted / tragic and heroic
```

#### 7.2 Character Operations

When using `create_character`, focus on fields unique to historical crossing:

| Field | Description |
|-------|-------------|
| **Character Source** (角色来源) | Choose: Historical Figure / Novel Character / Original Character |
| **Historical Prototype** (历史原型) | Describe the historical prototype this character corresponds to |
| **Planned Destiny** (命运走向) | Describe how the protagonist plans to change this character''s fate |
| **Current Status** (当前状态, dynamic) | The character''s state at the current story point |

**Recommended character creation order**:
1. Protagonist (the crosser themselves)
2. Historical figures / novel characters directly related to the protagonist''s core goal
3. The protagonist''s primary allies
4. The protagonist''s primary adversaries
5. Key supporting characters and original characters

#### 7.3 Scene Operations

When using `create_scene`, leverage fields unique to historical crossing:

| Field | Description |
|-------|-------------|
| **Scene Type** (场景类型) | Choose: Palace / Battlefield / City / Residence / Jianghu / Other |
| **Historical Prototype** (历史原型) | Describe the real historical location this scene corresponds to |

**Scene design tips**:
- Palace scenes suit political intrigue
- Battlefield scenes suit large-scale butterfly-effect demonstrations
- City scenes suit daily life and social depiction
- Residence scenes suit private conversations and conspiracy
- Jianghu scenes suit free action when the protagonist''s identity is not yet exposed

#### 7.4 Organization Operations

This method''s organization type is "Faction" (势力), with unique fields:

| Field | Description |
|-------|-------------|
| **Faction Type** (势力类型) | Choose: Court Faction / Regional Power / Jianghu Sect / Foreign Power / Other |
| **Faction Stance** (势力立场) | Choose: Friendly / Neutral / Hostile |

**Faction design tips**:
- Faction stances should shift with butterfly effects—after the protagonist changes historical events, faction attitudes will adjust
- Not all factions should be hostile to the protagonist—maintain a dynamic balance of friendly / neutral / hostile
- The inter-faction relationship network should be complex enough that every protagonist intervention sends ripples throughout

#### 7.5 Chapter Operations

When using `update_chapter_outline`, fully utilize the four unique fields:

```
update_chapter_outline:
  Core Conflict: "This chapter''s core contradiction (see Section VI.1)"
  Historical Event: "The historical event involved in this chapter (see Section VI.2)"
  Plot Twist: "This chapter''s unexpected twist (see Section VI.3)"
  Foreshadowing: "Foreshadowing planted in this chapter (see Section VI.4)"
```

**Butterfly-effect check for chapter design**:
- Does this chapter reference an event from the Historical Event Timeline?
- Does the protagonist intervene in that event in this chapter?
- Will the intervention''s result affect other events in subsequent chapters?
- If so, has this impact already been reflected in the planning of subsequent chapters?',
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
