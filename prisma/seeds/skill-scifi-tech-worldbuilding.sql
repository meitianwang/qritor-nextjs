-- 未来科幻穿越创作方法专属 Skill: 科幻世界观与科技体系 / Sci-Fi World-building and Technology System Skill
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '未来科幻穿越创作' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-scifi-tech-worldbuilding.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'scifi-tech-worldbuilding',
  '科幻世界观与科技体系专项指南：涵盖科幻子类与世界观匹配策略、文明等级与科技树内洽设计、「科技与设定」自定义实体模块深度使用、科幻穿越叙事挑战、「对于人类的定义」伦理冲突设计、以及相关工具操作指引',
  'Sci-fi worldview and technology system specialized guide: covers sub-genre and worldview matching strategies, civilization level and tech-tree consistency design, in-depth usage of the custom "Technology & Setting" entity module, sci-fi crossing narrative challenges, "Definition of Humanity" ethical conflict design, and related tool operation guidance',
  '## 科幻世界观与科技体系专项指南

本技能为「未来科幻穿越创作」方法提供**科幻世界观构建**与**科技体系设计**的深度专项指导。重点覆盖三个核心领域：科幻子类与设定字段的匹配逻辑、「科技与设定」自定义实体类型的深度使用方法、以及「对于人类的定义」伦理维度的叙事运用。

> 本技能聚焦世界观与科技体系的**设计方法论**，不重复创作方法指南中已覆盖的通用内容。

---

### 一、科幻子类选择与世界观匹配

科幻世界观的六个字段（科幻子类、文明等级、核心科技、社会形态、能源体系、对于人类的定义）不是独立的——它们构成一个**联动系统**。科幻子类是这个系统的"种子"，选定子类后，其余字段应当从子类的核心特征中推导出来。

#### 1.1 九大科幻子类的世界观基因

每个科幻子类都携带一套"世界观基因"——即它天然倾向的设定组合：

**赛博朋克**
- 核心意象：霓虹灯、雨夜、义体改造、企业垄断
- 天然文明等级：0级-行星文明(近未来) 或 1级-行星系文明
- 天然社会形态：企业治国，极端贫富分化，底层被遗弃
- 天然能源体系：核聚变（垄断在企业手中）或可控核聚变（普及但被控制）
- 天然核心科技：脑机接口、义体改造、虚拟现实、人工智能
- 人类定义倾向：义体改造到什么程度还算人类？意识能否脱离肉体存在？

**太空歌剧**
- 核心意象：星际舰队、多种族议会、行星殖民、宏大战役
- 天然文明等级：2级-恒星系文明 或 3级-星系文明
- 天然社会形态：联邦制或帝国制，星际政治博弈
- 天然能源体系：戴森球、反物质引擎、零点能
- 天然核心科技：曲率引擎/超光速旅行、能量护盾、行星改造
- 人类定义倾向：人类与外星种族的界限在哪里？跨种族混血算什么？

**硬科幻**
- 核心意象：科学论文式的严谨、技术细节、数据推演
- 天然文明等级：0级（最常见，贴近现实的延伸）
- 天然社会形态：由核心科技推演出的合理社会结构
- 天然能源体系：必须有现实科学基础（核聚变、太阳能阵列）
- 天然核心科技：从现有科学合理外推的技术（受控核聚变、基因疗法）
- 人类定义倾向：科学视角审视——基因改造后还是智人吗？

**废土末世**
- 核心意象：文明废墟、资源争夺、残存科技、荒野求生
- 天然文明等级：0级（文明倒退）
- 天然社会形态：无政府主义或军阀割据，部落化社会
- 天然能源体系：匮乏——残存的核电站、太阳能板、生物燃料
- 天然核心科技：残存技术（失落的高科技碎片）+ 求生工艺
- 人类定义倾向：变异人类还算人类吗？在生存面前人性的底线在哪里？

**时空穿越**
- 核心意象：时间线分裂、因果悖论、平行世界、蝴蝶效应
- 天然文明等级：灵活（可以是任何等级，关键在于时间操控技术）
- 天然社会形态：受时间旅行影响的社会（时间警察、历史修正主义者）
- 天然能源体系：能支撑时间操控的能源（通常需要极高能量密度）
- 天然核心科技：时间机器/时间操控技术、因果计算机
- 人类定义倾向：不同时间线上的"你"还是你吗？

**异星文明**
- 核心意象：第一次接触、文化碰撞、外星社会学、非人逻辑
- 天然文明等级：1级-3级（需要星际旅行能力才能接触异星）
- 天然社会形态：多文明共存，外交为核心
- 天然能源体系：各文明各异，形成技术差距
- 天然核心科技：跨文明通信、翻译技术、异星生态适应
- 人类定义倾向：在非人智慧面前，"人"的概念如何重新定义？

**AI觉醒**
- 核心意象：图灵测试、机器意识、人机共存/对抗、奇点
- 天然文明等级：0级-1级（AI通常在行星文明阶段觉醒）
- 天然社会形态：人类社会面临AI冲击后的重构
- 天然能源体系：AI需要的计算能源（量子计算、全球能源网络）
- 天然核心科技：强人工智能、意识模拟、量子计算
- 人类定义倾向：AI有没有意识？有意识的AI该不该有权利？

**生化变异**
- 核心意象：基因改造、新人类、物种分化、进化岔路
- 天然文明等级：0级-1级
- 天然社会形态：基因阶层制度，纯人类vs改造人的对立
- 天然能源体系：生物能源、基因工程产生的有机燃料
- 天然核心科技：CRISPR式基因编辑、表观遗传操控、人造器官
- 人类定义倾向：设计婴儿还是人类吗？基因优化后的"超人"与"普通人"是否平等？

**银河帝国**
- 核心意象：皇座与星域、封疆大吏、宫廷阴谋、边疆叛乱
- 天然文明等级：2级-3级
- 天然社会形态：帝国制，封建化的星际政治
- 天然能源体系：大规模能源基础设施（恒星能量收集）
- 天然核心科技：超光速通信（维持帝国统一）、行星级武器
- 人类定义倾向：帝国治下的不同改造路线产生了实质上的"亚种"

#### 1.2 匹配策略：从子类到完整世界观

**第一步：选定主子类**（可混搭，但主子类必须明确）

**第二步：根据子类的"世界观基因"填写文明等级**
- 不要随意拔高——赛博朋克搭配3级文明在逻辑上很难自洽
- 文明等级决定了科技天花板，而天花板要与子类的核心冲突匹配

**第三步：设计核心科技（3-5项）**
- 至少一项必须是子类的"标志性科技"
- 每项核心科技用一句话描述原理，两句话描述社会影响
- 核心科技之间要有逻辑关联（而非互相独立的技术孤岛）

**第四步：从核心科技推导社会形态**
- 问自己：如果这项科技全面普及，社会会变成什么样？
- 社会形态是科技的**结果**，不是独立设定

**第五步：确定能源体系**
- 能源是科技的**基础设施**——没有足够的能源，再先进的科技也无法运行
- 能源的分配方式往往决定了权力结构

**第六步：最后填写"对于人类的定义"**
- 这个字段是前五项的**哲学总结**——核心科技如何改变了"人"的边界？

#### 1.3 常见匹配错误

| 错误 | 问题原因 | 修正方向 |
|------|---------|---------|
| 赛博朋克 + 3级文明 | 赛博朋克的核心是**城市尺度的压迫感**，星系级文明冲淡了这种压迫 | 降到0-1级 |
| 硬科幻 + 曲率引擎 | 曲率引擎目前无科学基础，与硬科幻调性矛盾 | 改用相对论框架内的技术（光帆、冬眠船） |
| 废土末世 + 企业治国 | 文明已崩溃，企业不再存在 | 改为军阀割据或部落化 |
| AI觉醒 + 神级文明 | 神级文明已超越AI问题，AI觉醒不再是核心矛盾 | 降到0-1级 |
| 太空歌剧 + 核聚变 | 核聚变不足以支撑星际旅行 | 升级到反物质或零点能 |

---

### 二、文明等级与科技树的内洽设计

#### 2.1 卡尔达肖夫指数的创作应用

文明等级字段基于卡尔达肖夫指数，但对写作而言，重要的不是精确的能量数值，而是**每个等级能做什么、不能做什么**：

**0级-行星文明(近未来)**
- 能做：全球通信、基因编辑、有限的太空探索、AI应用
- 不能做：恒星际旅行、行星改造、反物质工程
- 叙事特点：与现实最接近，读者代入感最强，穿越者适应难度最低
- 适合的主角困境：社会制度层面的压迫（企业剥削、阶层固化）

**1级-行星系文明**
- 能做：完全掌控母星资源、太阳系内旅行、大规模空间站
- 不能做：恒星际旅行（除非极慢的世代飞船）、创造恒星
- 叙事特点：穿越者在科技方面全面落后，但世界仍可理解
- 适合的主角困境：科技差距带来的身份危机

**2级-恒星系文明**
- 能做：利用恒星能量、恒星际旅行、行星改造、大规模基因工程
- 不能做：跨星系旅行（银河系尺度）、违反物理定律
- 叙事特点：世界已远超现代认知，穿越者如同原始人
- 适合的主角困境：认知层面的绝望——这个世界的"常识"超出了理解范围

**3级-星系文明**
- 能做：掌控整个星系、跨星系通信和旅行、操控黑洞
- 不能做：跨宇宙、违反热力学定律
- 叙事特点：近乎"神话"的科技水平，穿越者的存在本身就是谜题
- 适合的主角困境：存在意义层面——在这样的文明面前，个体还有意义吗？

**神级文明**
- 能做：改写物理定律、创造宇宙、操控时间
- 不能做：从定义上没有明确限制
- 叙事特点：本质上是哲学故事，而非科幻冒险
- 适合的主角困境：纯哲学维度——什么是存在？什么是意识？

#### 2.2 "一件不可能之事"原则

这是科幻世界观设计的黄金法则：

**你可以假设一项突破性科技（即使现实中不存在），但从这项假设出发的所有推论必须严格合理。**

实践方法：
1. 选定你的"一件不可能之事"——比如"受控虫洞技术"
2. 推导第一层影响：有了虫洞，星际旅行变为可能
3. 推导第二层影响：星际旅行 → 殖民行星 → 资源不再匮乏 → 经济结构改变
4. 推导第三层影响：经济结构改变 → 传统权力格局瓦解 → 新的政治形态
5. 继续推导直到影响渗透到日常生活层面

**关键**：越是宏大的"不可能之事"，推导链就越长，需要填充的设定就越多。这就是为什么「科技与设定」模块如此重要——它帮你管理这条推导链上的每一环。

#### 2.3 能源体系作为科技基石

能源决定了一切科技的天花板：

| 能源类型 | 能量密度 | 支撑的科技上限 | 对社会的影响 |
|---------|---------|-------------|-----------|
| 化石燃料 | 低 | 基本工业化 | 资源争夺战 |
| 核裂变 | 中 | 有限太空活动 | 能源集中化 |
| 可控核聚变 | 高 | 行星系级活动 | 能源相对民主化 |
| 反物质 | 极高 | 恒星际旅行 | 能源成为战略武器 |
| 戴森球 | 恒星级 | 恒星系文明活动 | 文明级能源垄断 |
| 零点能 | 理论无限 | 星系级活动 | 后稀缺社会 |

**设计检查**：写完核心科技后，回头检查——你设定的能源体系能否支撑这些科技？如果设定了核聚变但又写了跨星系旅行，要么升级能源，要么降低旅行距离。

---

### 三、「科技与设定」模块深度使用指南

「科技与设定」是本创作方法的**自定义实体类型**（entity_category = "technology"）。这不是标准的 character、scene、prop 类型——通用的全局 Skill 不覆盖它。

#### 3.1 为什么这个模块至关重要

科幻小说的叙事可信度建立在科技设定的**一致性**上。一个前后矛盾的科技设定会立刻打破读者的沉浸感。「科技与设定」模块的作用是：

- 建立一个可查阅的"科技圣经"，写作时随时参考
- 通过「原理/设定」字段强制你思考每项科技的运作方式
- 通过「功能/影响」字段强制你思考每项科技的叙事价值
- 为后续的一致性审查提供依据

#### 3.2 六种类别的深度创建指南

**武器装备**

创建武器装备条目时需要回答：
- 这件武器基于什么科技原理？（必须与核心科技体系一致）
- 它的有效射程/攻击范围是多少？
- 它的能量来源是什么？（必须与能源体系一致）
- 它有什么弱点或限制？
- 在故事中谁会使用它？在什么场景中？

示例填写：
```
名称：离子脉冲步枪
类别：武器装备
原理/设定：利用微型聚变电池加速氢离子束，形成高能粒子流。
    有效射程 200 米，连续射击 15 发后需要更换电池。
    无法穿透第三代纳米装甲，但对无装甲目标有毁灭性杀伤。
功能/影响：底层执法部队的标准配备。由于聚变电池的
    高成本，民间持有违法，形成了武器黑市。穿越者初次
    遭遇时对其威力毫无概念，这是展示科技差距的关键道具。
```

**交通载具**

创建载具条目时需要回答：
- 它的推进原理是什么？
- 速度范围和续航能力？
- 乘坐体验对穿越者意味着什么？（文化冲击点）
- 它的普及程度——是人人可用还是精英专属？

**生物科技**

创建生物科技条目时需要回答：
- 这项技术改变了人体的什么？
- 改变是可逆的还是永久的？
- 它如何影响"人类定义"这个核心议题？
- 社会对这项技术的接受度如何？

**信息技术**

创建信息技术条目时需要回答：
- 信息如何传输和存储？
- 隐私的概念在这个体系下还存在吗？
- 穿越者如何与这个信息系统互动？（这是文化冲击的重要来源）
- 是否存在信息不对等？（谁掌控信息，谁就掌控权力）

**理论概念**

创建理论概念条目时需要回答：
- 这个理论解释了什么现象？
- 它如何支撑其他科技条目？（理论是科技树的根基）
- 这个理论有没有未解之谜？（未解之谜 = 剧情悬念）
- 穿越者能理解这个理论吗？

**历史事件**

创建历史事件条目时需要回答：
- 这个事件是如何发生的？
- 它对当前世界格局产生了什么影响？
- 它与哪些核心科技相关？
- 穿越者来自这个事件发生之前的时代吗？（可以作为穿越者的独特知识）

#### 3.3 科技圣经的架构方法

从核心科技出发，按照树状结构扩展：

```
核心科技 A（世界观字段中定义）
 |-- 理论概念：支撑科技 A 的基础理论
 |-- 武器装备：基于科技 A 的武器应用
 |-- 交通载具：基于科技 A 的交通应用
 |-- 生物科技：科技 A 在生物方向的分支
 |-- 信息技术：科技 A 在信息方向的分支
 |-- 历史事件：科技 A 诞生/发展中的关键事件

核心科技 B
 |-- （同样的扩展模式）

交叉科技 AB（A 和 B 的交叉应用）
```

**推荐创建数量**：
- 最低要求：5个条目（每项核心科技至少1个衍生）
- 推荐数量：10-15个条目（覆盖故事中会出现的主要科技）
- 上限建议：20个条目（过多会导致管理负担）

#### 3.4 科技条目之间的交叉验证

创建完所有条目后，进行交叉验证：

1. **能源检查**：每个需要能源的科技，其能源需求是否在设定的能源体系范围内？
2. **原理一致性**：不同条目中引用的科学原理是否一致？
3. **时间线检查**：历史事件的时间线是否自洽？
4. **社会影响叠加**：所有科技的社会影响叠加在一起，是否与设定的社会形态一致？
5. **穿越者视角**：穿越者会接触到哪些科技？接触顺序是否合理？

---

### 四、科幻穿越的独特叙事挑战

#### 4.1 文化冲击的层次设计

穿越者面对未来世界的文化冲击不是一次性的，而是**分层递进**的：

**第一层：感官冲击**（穿越后立即遭遇）
- 看不懂的文字/符号系统
- 无法操作的日常设备
- 陌生的建筑/交通/服饰
- 这一层的冲击是**视觉和操作层面**的

**第二层：认知冲击**（适应基本生存后遭遇）
- 货币系统完全不同
- 社交礼仪难以理解
- 法律和规则的逻辑与现代截然不同
- 这一层的冲击是**制度和规范层面**的

**第三层：价值观冲击**（深入社会后遭遇）
- 对"隐私"的定义可能已改变
- 对"身体"的态度可能截然不同（义体改造像换衣服一样普遍）
- 对"生死"的观念可能已被科技颠覆
- 这一层的冲击是**哲学和伦理层面**的

**叙事技巧**：三层冲击对应故事的三个阶段——文化冲击阶段、挣扎求生阶段、发现真相阶段。每个阶段揭示更深层的差异，保持读者的新鲜感。

#### 4.2 时间跨度与冲击程度的关系

穿越设定中的「时间跨度」字段直接决定了文化冲击的强度：

**近未来(50年内)**
- 语言基本可通，有新词汇需要学习
- 技术更迭明显但可类比理解（"这就像升级版的手机"）
- 社会结构有变化但可辨认
- **叙事优势**：读者代入感最强，解释成本最低

**赛博时代(100-300年)**
- 语言发生显著变化，需要学习期
- 技术完全超出穿越者的认知框架
- 社会结构已面目全非
- **叙事优势**：冲击与可理解性的最佳平衡点

**星际时代(1000年+)**
- 语言可能已不是现代语言的任何变体
- 技术对穿越者而言与魔法无异
- 社会可能已非人类认知范围
- **叙事优势**：最大的想象空间，但解释负担也最重

**远未来(万年+)** 和 **时间线崩坏**
- 极端设定，适合实验性叙事
- 穿越者的存在本身就是最大的谜题

#### 4.3 穿越身份与社会起点

穿越设定中的「穿越身份」决定了主角在未来社会的位置：

**底层身份**（非法移民、拾荒者、实验体）
- 优势：逆袭叙事的天然起点；接触到社会的阴暗面
- 挑战：需要合理解释主角如何在底层存活
- 科技接触：接触到的多是黑市科技、残次品、过时装备
- **与科技模块的关联**：应当创建一些"底层科技"条目——不是最先进的，而是平民版或黑市版

**中间身份**（旧时代活化石、星际通缉犯）
- 优势：有一定社会关注度，故事开局更有张力
- 挑战：身份暴露的风险贯穿全文
- 科技接触：通过研究者/执法者的视角接触科技
- **与科技模块的关联**：应当创建"限制级科技"条目——主角知道存在但无法使用的技术

**上层身份**（企业继承人）
- 优势：起点高，能快速接触核心科技
- 挑战：需要应对阴谋和权力斗争
- 科技接触：从一开始就接触尖端科技
- **与科技模块的关联**：应当创建"企业专属科技"条目——只有特定企业/阶层才能使用的技术

#### 4.4 现代知识在未来世界的价值

穿越者携带的现代知识不是碾压性武器，而是**另一种视角**：

| 现代知识 | 在未来可能的价值 | 在未来可能的危险 |
|---------|--------------|--------------|
| 历史知识 | 关于"人类曾经犯过的错"的第一手证词 | 可能揭露当权者不想让人知道的真相 |
| 人文精神 | 在过度理性化的社会中唤起"人性" | 可能被视为原始、落后、危险 |
| 非AI思维 | 在AI主导的世界里提供"非标准解" | 可能被AI视为不可预测的变量 |
| 旧技术知识 | 某些失落的老技术在特定情境中有奇效 | 几乎不可能直接应用，需要转化 |

---

### 五、「对于人类的定义」伦理冲突设计

这是科幻世界观中最独特也最有深度的字段。它不仅是世界观的一部分——它应该成为整部小说的**哲学暗线**。

#### 5.1 四种人类定义的冲突模型

**义体改造人的边界问题**

核心问题：把身体的多少比例替换成机械，才不再是"人"？

冲突设计：
- 社会上存在一个"改造比例阈值"（比如超过60%就失去某些权利）
- 穿越者来自一个没有这种区分的时代，天然质疑这个标准
- 某个角色正好处于阈值边缘，ta的遭遇成为主线冲突的缩影

**基因强化人的平等问题**

核心问题：经过基因编辑的"设计婴儿"与自然出生的人，在权利上是否平等？

冲突设计：
- 基因强化人在体能/智力上远超普通人，但可能缺乏某种"非理性"的人文特质
- 穿越者作为"纯自然人"，恰好拥有基因强化人所没有的东西
- 这创造了一个自然的优势-劣势反转

**AI仿生人的权利问题**

核心问题：强AI如果通过了图灵测试且表现出情感，它是否应该拥有"人权"？

冲突设计：
- 穿越者可能无法区分AI和人类，这本身就是冲突
- AI仿生人成为穿越者的盟友/朋友，随后身份揭露引发信任危机
- 穿越者对AI的态度（恐惧/友善/漠视）反映了ta对"人"的理解

**意识体的存在问题**

核心问题：脱离了肉体的纯数字意识，还算是"活着"吗？

冲突设计：
- 穿越者遇到一个声称认识自己（来自同一时代的数字化意识）的意识体
- 选择是否"数字化"自己来延续生命
- 如果可以复制意识，哪个才是"真正的自己"？

#### 5.2 将伦理冲突融入主线

伦理冲突不应该是孤立的哲学讨论，而应该**嵌入剧情**：

1. 通过角色体现冲突——每个不同种族/形态的角色都代表一种立场
2. 通过事件触发讨论——某个事件迫使主角和读者思考"什么是人"
3. 通过主角的成长弧线——穿越者对"人类定义"的看法随经历而变化
4. 通过核心目标的达成——最终解决方案需要回答"人类定义"问题

---

### 六、工具使用指南

#### 6.1 科幻世界观设定工具

使用 `update_setting` 填写科幻世界观的六个字段：

- **科幻子类**：从九个选项中选择（可组合，标注主次）
- **文明等级**：从五个等级中选择
- **核心科技**：填写3-5项，每项包含原理和社会影响
- **社会形态**：一段话描述，必须与核心科技的社会影响一致
- **能源体系**：标明类型和分配方式
- **对于人类的定义**：一段话，回答"在这个世界里，什么算人"

填写顺序建议：科幻子类 → 文明等级 → 核心科技 → 能源体系 → 社会形态 → 对于人类的定义

同样使用 `update_setting` 填写穿越设定：
- 按字段逐一填写即可
- 注意穿越方式必须与科幻子类匹配

#### 6.2 「科技与设定」实体的创建

「科技与设定」属于自定义实体类型（entity_category = "technology"），不使用标准的 `create_character`、`create_scene`、`create_prop` 等专用工具。需要使用通用的模块创建工具来操作。

创建流程：
1. 确定要创建的科技/设定的名称
2. 选择类别（武器装备/交通载具/生物科技/信息技术/理论概念/历史事件）
3. 填写「原理/设定」——描述它如何运作或它的背景
4. 填写「功能/影响」——描述它在故事中的作用和对社会的影响

#### 6.3 角色创建与科技关联

使用 `create_character` 创建科幻角色时，注意以下与科技体系的关联：

- **种族/形态**：直接关联「对于人类的定义」这个核心议题
  - 义体改造人 → 需要在科技模块中有对应的义体技术条目
  - 基因强化人 → 需要在科技模块中有对应的基因编辑条目
  - 强AI仿生人 → 需要在科技模块中有对应的AI技术条目
- **核心技能/装备**：应该与科技模块中的条目对应（角色使用的武器/工具应该在科技模块中有记录）
- **阵营/所属势力**：势力的科技水平差异是角色冲突的重要来源

#### 6.4 科技模块与其他模块的协同

科技模块不是孤立的——它是连接所有其他模块的**基础设施**：

```
科幻世界观（宏观框架）
      |
      v
科技与设定（科技细节展开）
      |
      +-----> 角色（角色的能力基于科技模块中的条目）
      |
      +-----> 穿越设定（穿越机制应在科技框架内可解释）
      |
      +-----> 剧情（关键剧情节点往往围绕科技展开）
```

---

### 七、创作前检查清单

开始写作前，确认以下要点：

- [ ] 科幻子类与文明等级的匹配是否合理
- [ ] 核心科技（3-5项）是否都有原理概述和社会影响说明
- [ ] 能源体系是否能支撑设定的核心科技
- [ ] 社会形态是否是核心科技社会影响的合理结果
- [ ] 「对于人类的定义」是否与角色种族/形态设定产生冲突
- [ ] 科技与设定模块是否已创建至少5个条目
- [ ] 科技条目之间是否通过了交叉验证（无逻辑矛盾）
- [ ] 每个科技条目的「功能/影响」字段是否写明了叙事价值
- [ ] 穿越者会接触的关键科技是否都已建档
- [ ] 至少设计了一个基于「对于人类的定义」的伦理冲突场景',
  '## Sci-Fi Worldview and Technology System Specialized Guide

This skill provides in-depth specialized guidance on **sci-fi worldview construction** and **technology system design** for the "Sci-Fi Crossing Creation" method. It focuses on three core areas: the matching logic between sci-fi sub-genres and setting fields, deep usage methods for the custom "Technology & Setting" entity type, and narrative application of the "Definition of Humanity" ethical dimension.

> This skill focuses on the **design methodology** of worldview and technology systems, and does not repeat general content already covered in the creation method guide.

---

### 1. Sub-Genre Selection and Worldview Matching

The six fields of the sci-fi worldview (sub-genre, civilization level, core technology, social structure, energy system, definition of humanity) are not independent—they form an **interlocking system**. The sub-genre is the "seed" of this system; once selected, the remaining fields should be derived from the sub-genre''s core characteristics.

#### 1.1 Worldview DNA of the Nine Sub-Genres

Each sub-genre carries a set of "worldview DNA"—its naturally inclined setting combinations:

**Cyberpunk**
- Core imagery: neon lights, rainy nights, prosthetic modification, corporate monopoly
- Natural civilization level: Level 0 Near-Future or Level 1 Planetary
- Natural social structure: corporate governance, extreme wealth disparity, abandoned underclass
- Natural energy system: nuclear fusion (monopolized by corporations) or controlled fusion (widespread but controlled)
- Natural core tech: brain-computer interfaces, prosthetic modification, virtual reality, artificial intelligence
- Humanity definition tendency: at what point does prosthetic modification stop being "human"? Can consciousness exist apart from the body?

**Space Opera**
- Core imagery: star fleets, multi-species councils, planetary colonization, grand battles
- Natural civilization level: Level 2 Stellar or Level 3 Galactic
- Natural social structure: federation or empire, interstellar political maneuvering
- Natural energy system: Dyson sphere, antimatter engines, zero-point energy
- Natural core tech: warp drive / FTL travel, energy shields, planetary terraforming
- Humanity definition tendency: where is the boundary between humans and alien species? What are cross-species hybrids?

**Hard Sci-Fi**
- Core imagery: scientific paper-like rigor, technical detail, data extrapolation
- Natural civilization level: Level 0 (most common; near-reality extension)
- Natural social structure: logically derived from core technology
- Natural energy system: must have real-science basis (fusion, solar arrays)
- Natural core tech: reasonable extrapolations from current science (controlled fusion, gene therapy)
- Humanity definition tendency: scientific perspective—is a gene-edited organism still Homo sapiens?

**Post-Apocalyptic**
- Core imagery: civilization ruins, resource wars, remnant technology, wilderness survival
- Natural civilization level: Level 0 (civilizational regression)
- Natural social structure: anarchy or warlord fiefdoms, tribalized society
- Natural energy system: scarce—remnant nuclear plants, solar panels, biofuel
- Natural core tech: remnant technology (lost high-tech fragments) + survival craft
- Humanity definition tendency: are mutated humans still human? Where is the moral baseline in survival?

**Temporal Crossing**
- Core imagery: timeline splits, causal paradoxes, parallel worlds, butterfly effect
- Natural civilization level: flexible (any level; the key is temporal manipulation technology)
- Natural social structure: society shaped by time travel (time police, historical revisionists)
- Natural energy system: energy capable of powering temporal manipulation (usually requires extreme energy density)
- Natural core tech: time machines / temporal manipulation, causal computers
- Humanity definition tendency: is "you" from a different timeline still you?

**Alien Civilization**
- Core imagery: first contact, cultural collision, xenosociology, non-human logic
- Natural civilization level: Level 1-3 (interstellar travel capability needed for alien contact)
- Natural social structure: multi-civilization coexistence, diplomacy as core
- Natural energy system: varies between civilizations, creating tech gaps
- Natural core tech: cross-civilization communication, translation technology, xenoecological adaptation
- Humanity definition tendency: how is "human" redefined in the presence of non-human intelligence?

**AI Awakening**
- Core imagery: Turing test, machine consciousness, human-machine coexistence/conflict, singularity
- Natural civilization level: Level 0-1 (AI typically awakens at the planetary civilization stage)
- Natural social structure: human society restructured after AI disruption
- Natural energy system: computational energy for AI (quantum computing, global energy grid)
- Natural core tech: strong AI, consciousness simulation, quantum computing
- Humanity definition tendency: does AI have consciousness? Should conscious AI have rights?

**Bio-Mutation**
- Core imagery: genetic modification, new humans, species divergence, evolutionary forks
- Natural civilization level: Level 0-1
- Natural social structure: genetic caste system, pure humans vs. modified humans
- Natural energy system: bioenergy, organic fuels from genetic engineering
- Natural core tech: CRISPR-style gene editing, epigenetic manipulation, artificial organs
- Humanity definition tendency: are designer babies human? Are gene-optimized "superhumans" and "ordinary people" equal?

**Galactic Empire**
- Core imagery: throne and star domains, sector governors, court intrigue, frontier rebellion
- Natural civilization level: Level 2-3
- Natural social structure: imperial system, feudalized interstellar politics
- Natural energy system: large-scale energy infrastructure (stellar energy harvesting)
- Natural core tech: FTL communication (maintaining imperial unity), planetary-scale weapons
- Humanity definition tendency: different modification paths under the empire have created de facto "subspecies"

#### 1.2 Matching Strategy: From Sub-Genre to Complete Worldview

**Step 1: Select the primary sub-genre** (can mix, but the primary must be clear)

**Step 2: Fill in civilization level based on the sub-genre''s "worldview DNA"**
- Do not arbitrarily inflate — cyberpunk paired with Level 3 civilization is logically difficult to reconcile
- Civilization level sets the tech ceiling, and the ceiling must match the sub-genre''s core conflict

**Step 3: Design core technologies (3-5 items)**
- At least one must be the sub-genre''s "signature technology"
- Describe each core tech with one sentence on principle, two on social impact
- Core technologies should be logically connected (not isolated tech islands)

**Step 4: Derive social structure from core technologies**
- Ask yourself: if this technology were fully widespread, what would society look like?
- Social structure is the **result** of technology, not an independent setting

**Step 5: Determine the energy system**
- Energy is technology''s **infrastructure**—without sufficient energy, the most advanced tech cannot function
- Energy distribution often determines power structures

**Step 6: Fill in "Definition of Humanity" last**
- This field is the **philosophical summary** of the previous five—how has core technology changed the boundaries of "human"?

#### 1.3 Common Matching Errors

| Error | Root Cause | Correction |
|-------|-----------|------------|
| Cyberpunk + Level 3 civilization | Cyberpunk''s core is **city-scale oppression**; galactic-level civilization dilutes that oppression | Drop to Level 0-1 |
| Hard sci-fi + warp drive | Warp drives have no scientific basis; conflicts with hard sci-fi tone | Use relativistic-framework tech (light sails, hibernation ships) |
| Post-apocalyptic + corporate governance | Civilization has collapsed; corporations no longer exist | Switch to warlord fiefdoms or tribalization |
| AI Awakening + god-level civilization | God-level civilizations have transcended the AI problem; AI awakening is no longer the core conflict | Drop to Level 0-1 |
| Space opera + nuclear fusion | Nuclear fusion is insufficient to support interstellar travel | Upgrade to antimatter or zero-point energy |

---

### 2. Civilization Level and Tech-Tree Consistency Design

#### 2.1 Applying the Kardashev Scale to Writing

The civilization level field is based on the Kardashev scale, but for writing purposes, what matters is not precise energy values but **what each level can and cannot do**:

**Level 0 — Planetary Civilization (Near-Future)**
- Can do: global communication, gene editing, limited space exploration, AI applications
- Cannot do: interstellar travel, planetary terraforming, antimatter engineering
- Narrative traits: closest to reality, strongest reader identification, lowest crosser adaptation difficulty
- Suitable protagonist predicaments: institutional oppression (corporate exploitation, class stratification)

**Level 1 — Planetary System Civilization**
- Can do: full control of homeworld resources, solar system travel, large-scale space stations
- Cannot do: interstellar travel (unless very slow generation ships), stellar creation
- Narrative traits: crosser is comprehensively behind in tech, but the world remains comprehensible
- Suitable protagonist predicaments: identity crisis from technological gap

**Level 2 — Stellar System Civilization**
- Can do: harness stellar energy, interstellar travel, planetary terraforming, large-scale genetic engineering
- Cannot do: cross-galactic travel (Milky Way scale), violate physical laws
- Narrative traits: world far exceeds modern cognition; crosser is like a primitive
- Suitable protagonist predicaments: cognitive-level despair—this world''s "common sense" exceeds comprehension

**Level 3 — Galactic Civilization**
- Can do: control an entire galaxy, cross-galactic communication and travel, manipulate black holes
- Cannot do: cross-universal travel, violate thermodynamic laws
- Narrative traits: near-mythological tech level; the crosser''s existence itself is a mystery
- Suitable protagonist predicaments: existential meaning—does the individual matter before such a civilization?

**God-Level Civilization**
- Can do: rewrite physical laws, create universes, manipulate time
- Cannot do: no defined limits
- Narrative traits: essentially a philosophical story, not a sci-fi adventure
- Suitable protagonist predicaments: pure philosophical dimension—what is existence? What is consciousness?

#### 2.2 The "One Impossible Thing" Principle

This is the golden rule of sci-fi worldview design:

**You may posit one breakthrough technology (even if it doesn''t exist in reality), but all deductions from that premise must be rigorously logical.**

Practical method:
1. Select your "one impossible thing"—e.g., "controlled wormhole technology"
2. Derive first-order impact: with wormholes, interstellar travel becomes possible
3. Derive second-order impact: interstellar travel -> planetary colonization -> resource abundance -> economic restructuring
4. Derive third-order impact: economic restructuring -> traditional power structures collapse -> new political forms
5. Continue deriving until the impact permeates daily life

**Key**: the grander the "impossible thing," the longer the derivation chain, and the more settings you need to fill in. This is why the "Technology & Setting" module is so important—it helps you manage every link in that derivation chain.

#### 2.3 Energy System as the Technological Foundation

Energy determines the ceiling of all technology:

| Energy Type | Energy Density | Tech Ceiling Supported | Social Impact |
|------------|---------------|----------------------|---------------|
| Fossil fuels | Low | Basic industrialization | Resource wars |
| Nuclear fission | Medium | Limited space activity | Energy centralization |
| Controlled fusion | High | Planetary system-level activity | Relatively democratized energy |
| Antimatter | Very high | Interstellar travel | Energy becomes a strategic weapon |
| Dyson sphere | Stellar-grade | Stellar system civilization | Civilization-scale energy monopoly |
| Zero-point energy | Theoretically infinite | Galactic-level activity | Post-scarcity society |

**Design check**: After writing core technologies, verify—can the energy system you''ve set actually power those technologies? If you''ve set nuclear fusion but written about cross-galactic travel, either upgrade the energy or reduce the travel distances.

---

### 3. In-Depth Guide to the "Technology & Setting" Module

"Technology & Setting" is this creation method''s **custom entity type** (entity_category = "technology"). This is not a standard character, scene, or prop type—generic global skills do not cover it.

#### 3.1 Why This Module Is Critical

Sci-fi narrative credibility is built on technological **consistency**. A self-contradicting tech setting instantly breaks reader immersion. The "Technology & Setting" module serves to:

- Establish a consultable "tech bible" for reference during writing
- Force you to think about how each technology works through the "Principle/Setting" field
- Force you to think about each technology''s narrative value through the "Function/Impact" field
- Provide a basis for subsequent consistency audits

#### 3.2 In-Depth Creation Guide for Six Categories

**Weapons & Equipment**

When creating a weapon entry, answer:
- What scientific principle is this weapon based on? (Must be consistent with the core tech system)
- What is its effective range / attack radius?
- What is its energy source? (Must be consistent with the energy system)
- What are its weaknesses or limitations?
- Who uses it in the story? In what scenarios?

Example entry:
```
Name: Ion Pulse Rifle
Category: Weapons & Equipment
Principle/Setting: Uses a micro-fusion battery to accelerate
    hydrogen ion beams into a high-energy particle stream.
    Effective range 200m, requires battery swap after 15
    continuous shots. Cannot penetrate 3rd-gen nano-armor
    but devastates unarmored targets.
Function/Impact: Standard issue for ground-level enforcement
    units. Due to the high cost of fusion batteries, civilian
    ownership is illegal, creating a weapon black market.
    A key prop for demonstrating the tech gap when the
    crosser first encounters it.
```

**Vehicles**

When creating a vehicle entry, answer:
- What is its propulsion principle?
- Speed range and endurance?
- What does the riding experience mean for the crosser? (Culture shock point)
- How widespread is it—available to everyone or elite-exclusive?

**Biotechnology**

When creating a biotech entry, answer:
- What does this technology change about the human body?
- Is the change reversible or permanent?
- How does it affect the "definition of humanity" core issue?
- What is society''s acceptance level of this technology?

**Information Technology**

When creating an IT entry, answer:
- How is information transmitted and stored?
- Does the concept of privacy still exist under this system?
- How does the crosser interact with this information system? (A major source of culture shock)
- Does information asymmetry exist? (Whoever controls information controls power)

**Theoretical Concepts**

When creating a theory entry, answer:
- What phenomenon does this theory explain?
- How does it support other tech entries? (Theory is the root of the tech tree)
- Does this theory have unsolved mysteries? (Unsolved mysteries = plot suspense)
- Can the crosser understand this theory?

**Historical Events**

When creating a historical event entry, answer:
- How did this event occur?
- What impact did it have on the current world order?
- Which core technologies is it related to?
- Did the crosser come from before this event? (This can serve as the crosser''s unique knowledge)

#### 3.3 Architecture Method for the Tech Bible

Expand from core technologies in a tree structure:

```
Core Tech A (defined in worldview fields)
 |-- Theoretical Concept: foundational theory supporting Tech A
 |-- Weapons & Equipment: weapon applications based on Tech A
 |-- Vehicles: transportation applications based on Tech A
 |-- Biotechnology: biological branch of Tech A
 |-- Information Technology: informational branch of Tech A
 |-- Historical Event: key events in Tech A''s emergence/development

Core Tech B
 |-- (same expansion pattern)

Cross-tech AB (intersection of A and B applications)
```

**Recommended creation count**:
- Minimum: 5 entries (at least 1 derivative per core tech)
- Recommended: 10-15 entries (covering major technologies that appear in the story)
- Suggested maximum: 20 entries (more creates management overhead)

#### 3.4 Cross-Verification Between Tech Entries

After creating all entries, perform cross-verification:

1. **Energy check**: Does each energy-consuming technology fall within the established energy system''s capacity?
2. **Principle consistency**: Are scientific principles referenced across different entries consistent?
3. **Timeline check**: Is the timeline of historical events self-consistent?
4. **Cumulative social impact**: Do all technologies'' social impacts, taken together, align with the established social structure?
5. **Crosser perspective**: Which technologies will the crosser encounter? Is the encounter order logical?

---

### 4. Unique Narrative Challenges of Sci-Fi Crossing

#### 4.1 Layered Design of Culture Shock

The crosser''s culture shock upon facing the future world is not a one-time event but a **progressively layered** experience:

**Layer 1: Sensory shock** (immediately upon crossing)
- Unreadable writing/symbol systems
- Inoperable everyday devices
- Unfamiliar architecture/transport/clothing
- This layer is **visual and operational**

**Layer 2: Cognitive shock** (after adapting to basic survival)
- Completely different monetary system
- Incomprehensible social etiquette
- Laws and rules with logic fundamentally different from the modern era
- This layer is **institutional and normative**

**Layer 3: Values shock** (after deeper integration into society)
- The definition of "privacy" may have changed
- Attitudes toward the "body" may be radically different (prosthetic modification as casual as changing clothes)
- Concepts of "life and death" may have been upended by technology
- This layer is **philosophical and ethical**

**Narrative technique**: The three layers correspond to the story''s three phases—culture shock phase, survival struggle phase, and truth discovery phase. Each phase reveals deeper differences, maintaining reader freshness.

#### 4.2 Time Span and Shock Intensity

The "Time Span" field in the crossing setup directly determines culture shock intensity:

**Near-Future (within 50 years)**
- Language is largely intelligible, with new vocabulary to learn
- Technology has evolved noticeably but can be understood by analogy ("it''s like an upgraded smartphone")
- Social structure has changed but remains recognizable
- **Narrative advantage**: strongest reader identification, lowest explanation cost

**Cyber Era (100-300 years)**
- Language has changed significantly; a learning period is required
- Technology completely exceeds the crosser''s cognitive framework
- Social structure has become unrecognizable
- **Narrative advantage**: optimal balance between shock and comprehensibility

**Interstellar Era (1000+ years)**
- Language may no longer be any variant of modern languages
- Technology is indistinguishable from magic to the crosser
- Society may be beyond human cognitive range
- **Narrative advantage**: maximum imaginative space, but also heaviest explanation burden

**Far Future (10,000+ years)** and **Timeline Collapse**
- Extreme settings suited to experimental narratives
- The crosser''s existence itself is the greatest mystery

#### 4.3 Crossing Identity and Social Starting Point

The "Crossing Identity" in the crossing setup determines the protagonist''s position in future society:

**Bottom-tier identities** (illegal immigrant, scavenger, test subject)
- Advantage: natural starting point for underdog narratives; exposure to society''s dark side
- Challenge: must plausibly explain how the protagonist survives at the bottom
- Tech exposure: encounters mostly black-market tech, rejects, outdated equipment
- **Link to tech module**: create some "bottom-tier tech" entries—not the most advanced, but civilian or black-market versions

**Mid-tier identities** (living fossil, interstellar fugitive)
- Advantage: some social attention; more tension from the start
- Challenge: risk of identity exposure runs throughout the story
- Tech exposure: encounters technology through researcher/law-enforcement perspectives
- **Link to tech module**: create "restricted tech" entries—technology the protagonist knows exists but cannot use

**Upper-tier identities** (corporate heir)
- Advantage: high starting point; rapid access to cutting-edge tech
- Challenge: must navigate conspiracies and power struggles
- Tech exposure: encounters leading-edge tech from the beginning
- **Link to tech module**: create "corporate-exclusive tech" entries—technology available only to specific corporations/classes

#### 4.4 Value of Modern Knowledge in the Future World

The crosser''s modern knowledge is not a dominating weapon but **an alternative perspective**:

| Modern Knowledge | Potential Value in the Future | Potential Danger in the Future |
|-----------------|------------------------------|-------------------------------|
| Historical knowledge | Firsthand testimony about "mistakes humanity once made" | May expose truths those in power want hidden |
| Humanistic spirit | Awakening "humanity" in an over-rationalized society | May be seen as primitive, backward, dangerous |
| Non-AI thinking | Providing "non-standard solutions" in an AI-dominated world | May be viewed by AI as an unpredictable variable |
| Legacy tech knowledge | Certain lost old technologies may work wonders in specific situations | Almost impossible to apply directly; requires adaptation |

---

### 5. "Definition of Humanity" Ethical Conflict Design

This is the most unique and deep field in the sci-fi worldview. It is not merely part of the worldview—it should become the entire novel''s **philosophical undercurrent**.

#### 5.1 Four Models of Human-Definition Conflict

**The Prosthetic Cyborg Boundary Problem**

Core question: what percentage of the body can be replaced with machinery before one ceases to be "human"?

Conflict design:
- Society has a "modification ratio threshold" (e.g., exceeding 60% results in losing certain rights)
- The crosser comes from an era without such distinctions and naturally questions this standard
- A character who sits right at the threshold edge, whose experience becomes a microcosm of the main conflict

**The Gene-Enhanced Human Equality Problem**

Core question: are gene-edited "designer babies" and naturally born people equal in rights?

Conflict design:
- Gene-enhanced humans far surpass ordinary people in physique/intelligence but may lack certain "irrational" humanistic qualities
- The crosser, as a "purely natural human," happens to possess what gene-enhanced humans lack
- This creates a natural advantage-disadvantage reversal

**The AI Android Rights Problem**

Core question: if a strong AI passes the Turing test and displays emotions, should it have "human rights"?

Conflict design:
- The crosser may be unable to distinguish AI from humans—this itself is conflict
- An AI android becomes the crosser''s ally/friend, then identity revelation triggers a trust crisis
- The crosser''s attitude toward AI (fear/friendliness/indifference) reflects their understanding of "human"

**The Consciousness Entity Existence Problem**

Core question: is a purely digital consciousness, detached from the body, still "alive"?

Conflict design:
- The crosser encounters a consciousness entity claiming to know them (a digitized mind from the same era)
- The choice of whether to "digitize" oneself to extend life
- If consciousness can be copied, which one is the "real self"?

#### 5.2 Integrating Ethical Conflict into the Main Plot

Ethical conflicts should not be isolated philosophical discussions but should be **embedded in the plot**:

1. Embody conflict through characters—each character of different species/form represents a stance
2. Trigger discussion through events—an incident forces the protagonist and reader to contemplate "what is human"
3. Through the protagonist''s growth arc—the crosser''s view on "human definition" evolves with experience
4. Through achieving the core goal—the final resolution requires answering the "human definition" question

---

### 6. Tool Usage Guide

#### 6.1 Sci-Fi Worldview Setting Tools

Use `update_setting` to fill in the six fields of the sci-fi worldview:

- **Sci-fi sub-genre**: choose from nine options (can combine; note primary and secondary)
- **Civilization level**: choose from five levels
- **Core technology**: fill in 3-5 items, each with principle and social impact
- **Social structure**: a paragraph that must be consistent with core technology''s social impact
- **Energy system**: specify type and distribution method
- **Definition of humanity**: a paragraph answering "in this world, what counts as human"

Recommended fill order: sub-genre -> civilization level -> core technology -> energy system -> social structure -> definition of humanity

Also use `update_setting` for the crossing setup:
- Fill in fields one by one
- Ensure the crossing method matches the sci-fi sub-genre

#### 6.2 Creating "Technology & Setting" Entities

"Technology & Setting" belongs to a custom entity type (entity_category = "technology") and does not use standard tools like `create_character`, `create_scene`, or `create_prop`. Use the general module creation tools instead.

Creation flow:
1. Determine the name of the technology/setting to create
2. Select the category (Weapons & Equipment / Vehicles / Biotechnology / Information Technology / Theoretical Concepts / Historical Events)
3. Fill in "Principle/Setting"—describe how it works or its background
4. Fill in "Function/Impact"—describe its role in the story and impact on society

#### 6.3 Character Creation and Tech Linkage

When using `create_character` to create sci-fi characters, note the following connections to the tech system:

- **Species/Form**: directly linked to the "Definition of Humanity" core issue
  - Prosthetic cyborg -> needs corresponding prosthetic tech entries in the tech module
  - Gene-enhanced human -> needs corresponding gene editing entries in the tech module
  - Strong AI android -> needs corresponding AI tech entries in the tech module
- **Core skills/equipment**: should correspond to entries in the tech module (weapons/tools a character uses should be documented in the tech module)
- **Faction/Affiliation**: tech-level differences between factions are an important source of character conflict

#### 6.4 Synergy Between the Tech Module and Other Modules

The tech module is not isolated—it is the **infrastructure** connecting all other modules:

```
Sci-Fi Worldview (macro framework)
      |
      v
Technology & Setting (tech detail expansion)
      |
      +-----> Characters (abilities based on tech module entries)
      |
      +-----> Crossing Setup (mechanism should be explainable within the tech framework)
      |
      +-----> Plot (key plot points often revolve around technology)
```

---

### 7. Pre-Writing Checklist

Before starting to write, confirm the following:

- [ ] Is the match between sub-genre and civilization level reasonable?
- [ ] Do all core technologies (3-5 items) have principle summaries and social impact descriptions?
- [ ] Can the energy system support the established core technologies?
- [ ] Is the social structure a reasonable result of core technology''s social impacts?
- [ ] Does "Definition of Humanity" create conflict with character species/form settings?
- [ ] Has the Technology & Setting module created at least 5 entries?
- [ ] Have tech entries passed cross-verification (no logical contradictions)?
- [ ] Does each tech entry''s "Function/Impact" field clearly state its narrative value?
- [ ] Have key technologies the crosser will encounter all been documented?
- [ ] Has at least one ethical conflict scenario based on "Definition of Humanity" been designed?',
  (SELECT id FROM novel_creation_method WHERE name = '未来科幻穿越创作' LIMIT 1),
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
