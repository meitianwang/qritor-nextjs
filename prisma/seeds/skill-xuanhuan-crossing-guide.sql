-- 异世界玄幻穿越小说创作方法专属 Skill / Isekai Xuanhuan Crossing creation method Skill
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '异世界玄幻穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-xuanhuan-crossing-guide.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xuanhuan-crossing-guide',
  '异世界玄幻穿越小说创作指南：涵盖修炼体系设计、世界观构建、穿越设定与金手指组合策略、战力体系与战斗设计、爽点节奏规划、叙事结构和常见陷阱规避',
  'Isekai xuanhuan crossing novel writing guide: covers cultivation system design, worldview construction, crossing setup and cheat ability combination strategies, power scaling and combat design, satisfaction point pacing, narrative structure, and common pitfall avoidance',
  '## 异世界玄幻穿越小说创作指南

本指南专为「异世界玄幻穿越小说」创作方法设计。该类型的核心是：现代人穿越到一个以修炼体系为核心的玄幻世界，借助金手指从弱到强，一路突破升级，最终站上世界巅峰。

---

### 一、类型公约与核心魅力

#### 1.1 什么是玄幻穿越

玄幻穿越是中国网络文学最主流的品类之一。它融合了修仙升级、异世界冒险和穿越重生三大元素，核心读者体验是**代入感极强的变强之旅**。

| 核心要素 | 说明 |
|---------|------|
| **穿越事件** | 现代人灵魂/身体进入玄幻异世界 |
| **修炼体系** | 世界运行的底层规则，角色变强的阶梯 |
| **金手指** | 主角区别于普通人的核心优势 |
| **升级曲线** | 从废物到巅峰的成长弧线 |
| **爽点设计** | 持续给读者提供满足感的情节节点 |

#### 1.2 玄幻穿越 vs 其他类型

| 对比维度 | 玄幻穿越 | 修真仙侠 | 西方奇幻 |
|---------|---------|---------|---------|
| 世界观 | 架空+东方元素混合 | 以道教修仙为核心 | 中世纪+魔法 |
| 力量体系 | 自由度高，可混搭 | 修仙为主 | 魔法/斗气为主 |
| 叙事节奏 | 快节奏，密集爽点 | 中等节奏，讲究意境 | 偏史诗，节奏较慢 |
| 核心体验 | 变强的快感 | 问道求仙的意境 | 史诗冒险的感动 |

#### 1.3 读者核心期待

- **升级爽感**：看主角一步步变强，碾压之前碾压自己的人
- **扮猪吃虎**：低调装弱，关键时刻爆发震惊所有人
- **打脸反转**：被人看不起 → 实力展示 → 对方目瞪口呆
- **地图扩展**：小村庄 → 城市 → 王国 → 大陆 → 界域，世界越来越大
- **身份揭秘**：隐藏身份逐步揭开，引发更大的震动

---

### 二、修炼体系设定（最重要的设定类型）

修炼体系是玄幻穿越小说的灵魂。它定义了这个世界「力量如何运作」，也决定了主角的升级路径。

#### 2.1 力量体系类型

「力量体系类型」字段支持以下选项：

| 类型 | 特点 | 适合风格 |
|------|------|---------|
| **修真** | 以灵气/真气修炼为核心，炼丹炼器 | 东方仙侠混搭 |
| **魔法** | 元素/咒语/魔力体系 | 西方奇幻混搭 |
| **斗气** | 体魄+气的战斗体系 | 近战格斗为主 |
| **异能** | 超自然能力，个体差异大 | 多样化能力对战 |
| **混合** | 多种体系并存 | 复杂世界观 |

**设计建议**：混合体系最灵活但最难写，需要明确不同体系之间的互动规则和强弱对比。纯体系更容易维持一致性。

#### 2.2 境界划分

这是修炼体系的骨架，也是全书升级节奏的框架。

**设计原则**：
1. 境界数量建议 7-12 个，太少缺乏层次感，太多容易混乱
2. 每个境界要有质变而非量变（不是单纯"更强"，而是"解锁新能力"）
3. 境界名称要有玄幻韵味，体现力量本质的递进
4. 每个境界内部可以分小阶（初期/中期/后期/巅峰）

**经典境界设计参考**：
```
凡人境（引气/锻体/开脉）→ 凝气境 → 筑基境 → 金丹境 →
元婴境 → 化神境 → 合体境 → 渡劫境 → 仙人境
```

**境界与叙事的对应**：

| 境界层级 | 对应叙事阶段 | 活动范围 | 冲突规模 |
|---------|------------|---------|---------|
| 低阶（1-3） | 新手村/起步 | 小城镇/宗门 | 个人恩怨 |
| 中阶（4-6） | 中段崛起 | 王国/大陆 | 势力争斗 |
| 高阶（7-9） | 大陆争锋 | 大陆/位面 | 种族大战 |
| 巅峰（10+） | 最终决战 | 多界域/宇宙 | 终极威胁 |

#### 2.3 修炼资源

定义角色变强所需的"货币"：
- **灵石/魔晶**：通用修炼资源，也是经济流通货币
- **天材地宝**：稀有修炼材料，用于突破瓶颈
- **丹药**：辅助修炼、疗伤、提升实力的消耗品
- **秘境/遗迹**：获取资源和机缘的特殊地点
- **功法典籍**：修炼方法本身也是珍贵资源

**资源与剧情的关系**：资源是冲突的最大来源之一——为争夺资源引发的冲突是最自然的剧情驱动器。

#### 2.4 功法/职业分支

「功法/职业分支」定义了不同修炼者的差异化路径：
- **战斗型**：剑修、体修、法修、召唤师等
- **辅助型**：炼丹师、炼器师、阵法师、符箓师等
- **特殊型**：兽师、傀儡师、毒师等

**设计要点**：
1. 主角的修炼路径要与金手指匹配
2. 不同分支之间要有互补性，为组队/对抗创造策略空间
3. 辅助型职业的地位不能太低，它们是社交和经济系统的基础

#### 2.5 能力上限与代价

**能力上限**：每个境界能做什么、不能做什么，要有清晰边界
- 低阶修士不能飞行
- 金丹以下不能使用某些禁术
- 只有渡劫期以上才能撕裂空间

**代价**：力量不应是免费的
- 过度修炼的反噬
- 使用禁术的代价（折寿、伤根基、走火入魔）
- 突破失败的后果

#### 2.6 禁忌与风险

定义修炼之路上的"红线"：
- **走火入魔**：修炼出错的后果
- **心魔**：心理层面的修炼障碍
- **天劫**：突破大境界时的天道考验
- **禁术**：威力巨大但代价惨重的能力

#### 2.7 代表性能力

每个境界/分支的标志性能力展示：
- 筑基期的代表性能力是什么？
- 金丹期能做到什么之前做不到的事？
- 不同功法分支的招牌技能是什么？

---

### 三、世界观设定

世界观是所有设定的容器。一个好的玄幻世界应该让读者觉得"这个世界很大，探索不完"。

#### 3.1 世界名称

取一个有玄幻感的名字：
- 好例子：「天玄大陆」「九域神界」「万灵位面」
- 避免：过于普通或直白的名字

#### 3.2 时代背景

确定世界当前的"大环境"：
- 万族并存的太古时代
- 修炼文明鼎盛的黄金纪元
- 灵气衰退的末法时代
- 大战之后的废墟纪元

时代背景决定了修炼资源的充裕程度和冲突的基调。

#### 3.3 历史背景

为世界构建纵深感：
- 远古大战和封印
- 上古文明的遗迹和传说
- 灭世级BOSS的历史传闻
- 这些历史对当前局势的影响

#### 3.4 地理版图

玄幻世界的地理应该**分层嵌套、逐步展开**：

```
起始区域（一个城镇/宗门）
  ↓
地区（一个国家/势力范围）
  ↓
大陆（多个国家/势力并存）
  ↓
界域（多个大陆/位面）
  ↓
更高维度（仙界/神界/虚空等）
```

**设计原则**：
- 初期只揭示最近的地理范围，避免一开始就铺开整张世界地图
- 每次升级时揭示新的地理层级，给读者"世界比想象更大"的震撼感
- 不同地区的资源、修炼条件和势力格局要有差异

#### 3.5 种族格局

种族多样性是玄幻世界的一大特色：

| 种族 | 特点设计方向 |
|------|------------|
| **人族** | 数量多、天赋一般但修炼方向多样 |
| **妖族** | 兽类化人形，天生体魄强大 |
| **魔族** | 天赋异禀但被其他种族敌视 |
| **精灵族** | 亲和自然，擅长某种特定能力 |
| **龙族** | 血脉高贵，数量极少但个体极强 |

**种族对角色设计的影响**：角色 Schema 中的「种族」字段支持以上选项及自定义。种族选择会影响角色的天赋、社会地位和互动方式。

#### 3.6 政治格局

大势力之间的博弈：
- 人族各大帝国之间的争霸
- 不同种族之间的联盟与对抗
- 修炼宗门/家族/帝国三方权力的制衡
- 隐藏势力（上古传承、秘密组织）

#### 3.7 社会制度

修炼者的社会分层：
- 修炼者与凡人的关系
- 宗门等级制度
- 修炼者的法律和规则
- 世俗政权与修炼势力的关系

#### 3.8 经济民生

围绕修炼资源的经济体系：
- 灵石/魔晶的开采和流通
- 丹药、法器的交易市场
- 拍卖会（经典的玄幻爽点场景）
- 佣兵/冒险者任务系统

#### 3.9 文化风俗

修炼世界独有的文化特征：
- 以实力为尊的价值观
- 宗门大比、排名战等竞争文化
- 拜师礼仪、修炼禁忌
- 弱肉强食与道德底线的碰撞

#### 3.10 核心禁忌与规则

世界运行的底层规则：
- 天道法则的限制
- 高阶修士不能随意对低阶出手的规矩
- 某些禁术/禁地的存在理由
- 破坏规则的后果

---

### 四、穿越设定与金手指组合策略

穿越设定和金手指是紧密耦合的两个设定类型，应当配合设计。

#### 4.1 穿越方式

「穿越方式」字段支持 7 种选项：

| 穿越方式 | 叙事优势 | 适合搭配的金手指 |
|---------|---------|---------------|
| **意外身亡后重生** | 有前身记忆和人际关系 | 前世记忆、重生先知 |
| **被神秘力量召唤** | 带有使命感，适合宏大剧情 | 系统、神器 |
| **触碰古物穿越** | 有回归可能性，增加悬念 | 神器、科技道具 |
| **睡梦中穿越** | 过渡平缓，日常向 | 天赋、血脉 |
| **雷击穿越** | 经典方式，干脆利落 | 各类均可 |
| **游戏/小说世界穿越** | 主角对世界有先知信息 | 系统、外挂记忆 |
| **集体穿越** | 多主角或竞争格局 | 各类均可 |

#### 4.2 目的地类型

「目的地类型」决定了世界观的整体风格：

| 目的地 | 风格特点 |
|--------|---------|
| **玄幻世界** | 东方元素为主，修炼体系自由度高 |
| **修真世界** | 纯道教修仙体系 |
| **西方奇幻** | 魔法/剑与魔法世界观 |
| **末日异界** | 生存压力大，修炼是唯一出路 |
| **高武世界** | 武道为尊，偏格斗 |
| **异族主导** | 人族弱势，种族矛盾为核心 |

#### 4.3 穿越身份

「穿越身份」影响起点和初始资源：

| 身份 | 起始资源 | 叙事效果 |
|------|---------|---------|
| **宗门弟子** | 中等（有师门庇护） | 宗门内斗 + 宗门大比 |
| **散修** | 低（自由但无靠山） | 独行冒险 + 奇遇 |
| **贵族** | 高（家族资源） | 家族势力 + 联姻政治 |
| **平民** | 极低（白手起家） | 典型逆袭路线 |
| **冒险者** | 中（自由+任务系统） | 打怪升级 + 探索 |
| **异族** | 特殊（种族天赋） | 种族冲突 + 身份隐藏 |
| **奴隶** | 无 | 极致逆袭 |
| **学徒** | 低（学习阶段） | 成长型叙事 |

#### 4.4 核心目标与故事基调

「核心目标」和「故事基调」的搭配：

| 核心目标 | 最适合的故事基调 |
|---------|---------------|
| 修炼变强 | 热血爽文 |
| 返回现实 | 轻松冒险 + 悬疑诡秘 |
| 拯救世界 | 史诗宏大 |
| 复仇 | 黑暗残酷 |
| 探索真相 | 悬疑诡秘 |
| 建立势力 | 史诗宏大 + 热血爽文 |

#### 4.5 金手指设计

**金手指类型**对照表：

| 类型 | 核心优势 | 典型表现 |
|------|---------|---------|
| **系统** | 任务奖励/属性面板 | 完成任务获得奖励，有等级和商店 |
| **神器** | 拥有远超当前境界的强力道具 | 初期压箱底，逐渐解封 |
| **天赋** | 修炼速度/效率碾压常人 | 别人十年他一年，悟性逆天 |
| **血脉** | 来自强大种族的血脉觉醒 | 远古神兽/仙人血脉 |
| **灵宠** | 强大的契约兽/同伴 | 战斗搭档+成长伙伴 |
| **外挂记忆** | 前世/穿越带来的知识 | 知道秘境位置、丹方、功法 |
| **科技道具** | 现代科技在异世界的应用 | 科技碾压低文明 |

**能力描述**：必须具体化——不是"主角很强"，而是"主角拥有XXX能力，可以做到YYY，但不能做到ZZZ"。

**使用限制**：金手指必须有限制，否则故事没有张力。常见限制：
- 冷却时间
- 消耗资源（灵石、生命力）
- 境界限制（只有突破到某境界才能解锁新功能）
- 使用次数
- 副作用（头痛、虚弱、暴露风险）

**成长空间**：金手指应随主角一起成长：
- 初期：辅助生存和基础修炼
- 中期：在关键战斗中发挥决定性作用
- 后期：完全觉醒，解锁终极能力

**获得方式**：穿越时自带 vs 后天获得——穿越自带更直接，后天获得更有铺垫感。

#### 4.6 穿越设定与金手指的搭配原则

1. **互补而非重叠**：穿越身份给出起点，金手指给出成长曲线；两者不应完全重叠
2. **限制匹配**：身份越低，金手指的潜力越大（废柴开局 + 逆天金手指是经典组合）
3. **代入感**：穿越方式应让读者觉得"如果是我也能这样"
4. **故事基调一致**：热血爽文用系统/天赋，黑暗残酷用血脉/记忆

#### 4.7 感情线

「感情线」字段定义主角的情感发展方向。玄幻穿越中感情线通常是辅线：
- 与修炼主线交织（共同冒险中产生感情）
- 感情发展不能拖慢主线节奏
- 女主/男配应有独立的修炼实力和故事线

---

### 五、故事钩子设定

#### 5.1 故事钩子

吸引读者继续阅读的核心悬念。好的钩子应在前三章内抛出：
- "穿越后发现自己是宗门里的废物弟子，三天后就是宗门大比"
- "醒来发现自己在悬崖边，体内灵力全失，身后追杀者已近"

#### 5.2 核心卖点

区别于同类型作品的独特之处。提炼时思考：
- 修炼体系有何创新？
- 金手指有何独特？
- 世界观有何新意？
- 叙事节奏有何不同？

#### 5.3 开篇悬念

第一章就要建立的悬念——通常是穿越后面临的第一个危机。危机的紧迫性越强，读者追读欲望越高。

#### 5.4 读者期待

明确承诺给读者的体验：打脸爽感、修炼突破的成就感、世界探索的新鲜感、还是智斗的快感。

---

### 六、文风设定

#### 6.1 叙事视角

- **第三人称限知**：最通用，兼顾代入感和叙事灵活性（推荐）
- **第一人称**：代入感最强，但限制了多线叙事
- **第三人称全知**：适合多线并行的史诗叙事

#### 6.2 语言风格

| 风格 | 特点 | 适合基调 |
|------|------|---------|
| **热血燃爽** | 短句、感叹词、节奏快 | 热血爽文 |
| **史诗宏大** | 长句、宏观描写、气势磅礴 | 史诗宏大 |
| **轻松幽默** | 吐槽、调侃、内心戏丰富 | 轻松冒险 |
| **黑暗压迫** | 冷峻、克制、环境描写阴郁 | 黑暗残酷 |

#### 6.3 描写侧重

- 战斗场面：动作描写、能力展示、策略博弈
- 修炼突破：内视描写、灵力运转、境界感悟
- 世界探索：环境描写、新奇事物、地理揭示
- 人物互动：对话、表情、心理活动

#### 6.4 节奏把控

玄幻穿越的节奏核心是"张弛有度"：
- **紧张段**（战斗/危机/突破）：快节奏，短句密集
- **过渡段**（修炼/日常/社交）：中等节奏，穿插信息
- **高潮段**（大战/终极突破）：全力加速，不给喘息
- **回落段**（战后/修整/领悟）：节奏放缓，为下一波蓄力

**节奏公式**：
```
铺垫→紧张→小高潮→短暂回落→更大紧张→大高潮→回落与收获→新铺垫（循环）
```

#### 6.5 禁用词汇

列出不应出现在正文中的违和词汇（如过于现代的网络用语），保持世界观的沉浸感。主角内心独白可以偏现代，但叙述和对话要贴合世界观。

---

### 七、战力体系与战斗设计

#### 7.1 战力层级

战力体系必须严格对应境界划分：
- 同境界内的实力差距应有上限（巅峰期对初期最多跨半阶）
- 跨境界战斗是展示金手指/天赋的机会（越一阶挑战 = 主角光环体现）
- 越阶战斗不能太随意——越两阶应当是极限，否则境界划分失去意义

#### 7.2 战斗三要素

每场重要战斗都应包含：
1. **策略层**：双方的战术考量和判断
2. **能力层**：具体功法/技能的碰撞
3. **意外层**：打破僵局的意外因素（金手指、环境利用、盟友支援）

#### 7.3 战斗升级

战斗复杂度应随境界提升：
- **低阶战斗**：直接的力量碰撞，招式对拼
- **中阶战斗**：法宝介入、阵法应用、多人配合
- **高阶战斗**：领域对抗、大道法则碰撞、空间战
- **巅峰战斗**：毁天灭地的规模，牵动整个世界格局

---

### 八、叙事结构：从废物到巅峰

#### 8.1 经典叙事框架

玄幻穿越的叙事框架遵循明确的升级路径：

```
穿越降临 → 废物开局 → 金手指觉醒 → 初次展示 → 修炼突破 →
小试牛刀 → 更大世界 → 连续升级 → 最终BOSS
```

| 阶段 | 叙事目标 | 章节占比 |
|------|---------|---------|
| **穿越降临** | 建立穿越设定，主角确认身份 | 3-5% |
| **废物开局** | 展示困境，建立同理心 | 5-8% |
| **金手指觉醒** | 希望出现，主角获得核心优势 | 3-5% |
| **初次展示** | 第一次用金手指解决问题/打脸 | 5-8% |
| **修炼突破** | 系统性修炼，第一次境界突破 | 10-15% |
| **小试牛刀** | 在小范围内展示实力（宗门大比/城市级冲突） | 15-20% |
| **更大世界** | 走出起始区域，进入更广阔的世界 | 10-15% |
| **连续升级** | 多次境界突破，面对越来越强的对手 | 25-30% |
| **最终BOSS** | 最终对决，所有线索汇聚 | 5-10% |

#### 8.2 开篇设计（前五章）

开篇的质量直接决定读者是否追读：

- **第 1 章**：穿越发生 + 确认身份 + 展示困境（废物/危机）
- **第 2 章**：了解世界基本规则 + 发现金手指线索
- **第 3 章**：金手指正式觉醒 + 制定初步计划
- **第 4 章**：第一次小规模冲突/挑战
- **第 5 章**：第一次胜利/打脸 + 引出更大的目标

**关键**：前五章内必须完成"穿越+困境+金手指+第一次爽点"的完整循环。

#### 8.3 中段节奏控制

中段是最容易写崩的部分。把握核心原则：

**升级-挑战循环**：
```
修炼突破 → 展示新能力 → 遇到更强对手 → 再次修炼 → 再次突破（循环）
```

**地图扩展节奏**：
- 每次主角实力提升到当前区域的上限时，引入新的更大区域
- 新区域 = 新的对手 + 新的资源 + 新的势力格局
- 避免在一个区域停留太久

**支线管理**：
- 支线应该为主线服务（获取资源、建立人脉、增长实力）
- 支线不能喧宾夺主
- 每条支线都要有明确的结束点

#### 8.4 高潮设计

每个大高潮应包含：
1. **前期铺垫**：展示对手实力，制造压迫感
2. **战前准备**：主角利用所有资源和人脉
3. **正面对决**：能力碰撞 + 策略博弈
4. **绝境翻盘**：看似必败时的逆转（金手指/突破/盟友）
5. **胜利收获**：实力提升 + 声望增长 + 新信息揭露

---

### 九、爽点设计与节奏规划

#### 9.1 爽点类型

| 爽点类型 | 说明 | 使用频率 |
|---------|------|---------|
| **打脸** | 被看不起后展示实力，让对方震惊 | 高频（每 5-10 章一次） |
| **突破** | 修炼境界提升 | 中频（按境界规划） |
| **获宝** | 获得珍贵资源/法宝/功法 | 中频 |
| **揭秘** | 身份/实力/背景揭露引发震动 | 低频（关键节点） |
| **逆袭** | 在绝境中翻盘 | 中频（每个大弧线一次） |
| **碾压** | 实力碾压曾经碾压自己的人 | 低频（重要的爽点节点） |

#### 9.2 爽点节奏安排

```
第 1-5 章：小爽点（第一次打脸/小胜利）
第 6-15 章：中等爽点（第一次境界突破 + 宗门内打脸）
第 16-30 章：大爽点（宗门大比/城市级胜利）
第 31-50 章：超大爽点（离开起始区域 + 更大舞台的震撼亮相）
... 以此递增
```

**核心规则**：
- 爽点之间的间隔不能太长（超过 10 章无爽点 = 读者流失风险）
- 爽点要层层递进，不能重复同级别的爽（读者会审美疲劳）
- 在大爽点之前要有足够的"憋屈铺垫"——憋得越狠，爽得越猛

#### 9.3 铺垫与释放的平衡

| 铺垫 | 释放 |
|------|------|
| 被人欺负/看不起 | 实力展示打脸 |
| 修炼瓶颈/苦修 | 境界突破 |
| 危机逼近/绝境 | 逆转翻盘 |
| 隐藏实力 | 身份/实力大揭秘 |
| 准备和积累 | 一战成名 |

---

### 十、角色设计

#### 10.1 主角设计

主角的「修为境界」字段应从低处开始，随剧情逐步提升。

**穿越者特质**：
- 现代人的思维方式（更灵活、更有创造力）
- 对"修炼世界常识"的陌生感（初期闹笑话，增加趣味性）
- 坚韧不拔的意志（穿越者的核心竞争力之一）

**废物开局模板**：
- 原身是宗门废物弟子 / 被家族放弃的纨绔 / 修炼天赋极差的平民
- 穿越后发现体内灵力阻塞/经脉损伤/被下毒封印
- 金手指觉醒修复了问题，或提供了另一条修炼路径

#### 10.2 种族选择

角色 Schema 中的「种族」字段（人族/妖族/魔族/精灵/龙族等）影响：
- 天赋和修炼方向
- 在世界中的社会地位
- 与其他种族角色的关系
- 是否需要隐藏身份

**主角种族建议**：人族最通用（代入感强）；异族主角增加独特性但需处理好种族矛盾。

#### 10.3 配角设计层次

| 角色定位 | 功能 | 设计要点 |
|---------|------|---------|
| **兄弟/战友** | 并肩战斗、分担压力 | 有独立的修炼路线和性格 |
| **导师/长辈** | 传授修炼、指点迷津 | 不能全知全能，要有局限性 |
| **对手/宿敌** | 制造冲突、推动成长 | 实力略高于主角当前水平 |
| **势力代表** | 展示势力态度 | 行为要代表组织利益 |
| **情感角色** | 提供情感深度 | 不能沦为花瓶 |

**关键**：配角必须有自己的行为逻辑和成长空间。最忌讳的是所有配角都围着主角转，沦为工具人。

#### 10.4 反派设计

好的反派是主角成长的标尺：
- **小反派**：同境界的竞争者，几十章后被超越
- **中反派**：高一两个境界的强者，需要主角突破后才能对抗
- **大反派**：远超主角的存在，是长期目标
- **终极BOSS**：全书最强对手，与世界真相相关

---

### 十一、组织设计

本创作方法的组织类型名为「组织」。玄幻世界的组织通常是：

#### 11.1 组织类型

- **宗门**：修炼者的核心组织形态
- **家族**：以血缘为纽带的势力
- **帝国/王国**：世俗政权
- **商会**：经济型组织
- **冒险者公会**：任务发布和修炼者管理
- **秘密组织**：暗中操控的隐藏势力

#### 11.2 组织设计要点

- 每个组织有明确的实力层级和内部等级制度
- 组织之间的关系要形成网络（联盟/敌对/竞争/从属）
- 主角与组织的关系应随剧情发展变化（加入→成长→离开→建立自己的势力）
- 组织是资源的重要来源（修炼资源、功法、任务、人脉）

---

### 十二、可用类别

本创作方法的 visible_categories 包含：

| 类别 | 用途 |
|------|------|
| **setting** | 6 种设定类型（世界观、修炼体系、穿越设定、金手指、故事钩子、文风设定） |
| **character** | 角色管理（支持种族、修为境界等特有字段） |
| **organization** | 组织管理（宗门、家族、帝国等） |
| **scene** | 场景管理（修炼场、秘境、战场等） |
| **chapter** | 章节管理 |

---

### 十三、常见陷阱与规避

#### 13.1 战力崩坏

**问题**：战斗力对比前后矛盾，同一境界的角色时强时弱。

**规避方法**：
- 在修炼体系设定中严格定义每个境界的能力边界
- 跨境界战斗有明确上限（最多越一到两阶，且需要合理理由）
- 记录每个重要角色的当前境界和特殊能力
- 群战时注意各方战力平衡

#### 13.2 升级太快

**问题**：主角升级过快，读者还没来得及适应当前境界就已经突破了。

**规避方法**：
- 每个境界至少要有 1-2 个完整的故事弧
- 突破前要有足够的铺垫（瓶颈、积累、机缘）
- 境界越高，突破间隔应越长
- 利用"境界巩固"概念控制升级节奏

#### 13.3 配角扁平

**问题**：配角没有个性，只是主角的陪衬。

**规避方法**：
- 每个重要配角要有独立的目标和行为动机
- 配角之间也要有互动，不是所有人都只和主角互动
- 给配角安排独立的高光时刻
- 配角也要有成长，不能主角变强后配角就消失

#### 13.4 世界观前后矛盾

**问题**：前期设定的规则在后期被打破。

**规避方法**：
- 世界观设定的「核心禁忌与规则」要写清楚
- 修炼体系的境界划分和能力边界要前后一致
- 如果需要打破规则，要有合理的解释（上古秘法、天道特例）
- 定期检查已有设定与新剧情是否冲突

#### 13.5 金手指过强导致零张力

**问题**：金手指太强，主角永远不会输。

**规避方法**：
- 金手指的使用限制要严格执行
- 对手也可以有自己的"金手指"或底牌
- 金手指能解决力量问题，但不能解决所有问题（人际、政治、情感）
- 随着对手变强，金手指的优势应逐渐缩小

#### 13.6 剧情模式化

**问题**：每次都是"被欺负→突破→打脸"的循环，读者审美疲劳。

**规避方法**：
- 变换冲突类型（个人战斗、势力争端、秘境探险、炼丹竞赛等）
- 不是所有冲突都靠武力解决
- 穿插智斗、布局、外交等非战斗剧情
- 偶尔让主角经历真正的失败

---

### 十四、创作检查清单

开始写作前确认：

- [ ] 「修炼体系」设定中的「境界划分」是否完整，每个境界有明确的能力边界
- [ ] 「世界观」中的「地理版图」是否支持逐步展开（由小到大）
- [ ] 「穿越设定」和「金手指」是否形成互补搭配
- [ ] 金手指的「使用限制」是否足够严格，能维持故事张力
- [ ] 「故事钩子」中的「开篇悬念」是否能在前三章内呈现
- [ ] 「文风设定」中的「节奏把控」是否与故事基调一致
- [ ] 每个境界是否规划了至少一个完整的故事弧
- [ ] 是否有足够多样的爽点类型（不只是打脸）
- [ ] 配角是否有独立的目标和行为逻辑
- [ ] 战力体系是否与境界划分严格对应',
  '## Isekai Xuanhuan Crossing Novel Writing Guide

This guide is designed specifically for the "Isekai Xuanhuan Crossing Novel" (异世界玄幻穿越小说) creation method. The core concept: a modern person crosses into a fantasy world powered by a cultivation system, leverages a cheat ability to grow from weak to strong, and ultimately reaches the pinnacle of the world.

---

### I. Genre Conventions and Core Appeal

#### 1.1 What Is Xuanhuan Crossing

Xuanhuan crossing is one of the most mainstream genres in Chinese web fiction. It blends cultivation and leveling, isekai adventure, and transmigration/rebirth into a single package. The core reader experience is **an intensely immersive journey of growing stronger**.

| Core Element | Description |
|-------------|-------------|
| **Crossing event** | A modern person''s soul/body enters a xuanhuan fantasy world |
| **Cultivation system** | The underlying rules of the world; the ladder for characters to grow stronger |
| **Cheat ability** (金手指) | The protagonist''s core advantage that sets them apart from ordinary people |
| **Power curve** | The growth arc from nobody to pinnacle |
| **Satisfaction points** (爽点) | Plot nodes that continuously deliver fulfillment to the reader |

#### 1.2 Xuanhuan Crossing vs. Other Genres

| Dimension | Xuanhuan Crossing | Xianxia Cultivation | Western Fantasy |
|-----------|------------------|--------------------| --------------|
| Worldview | Fictional + mixed Eastern elements | Daoist cultivation core | Medieval + magic |
| Power system | High freedom, mix-and-match | Cultivation-centric | Magic/battle-aura focused |
| Pacing | Fast, dense satisfaction points | Moderate, emphasizes atmosphere | Epic, slower pace |
| Core experience | Thrill of becoming powerful | Atmosphere of seeking the Dao | Emotion of epic adventure |

#### 1.3 Core Reader Expectations

- **Leveling thrill**: Watching the protagonist grow step by step and crush those who once crushed them
- **Hidden dragon**: Playing weak, then shocking everyone at the critical moment
- **Face-slapping reversal**: Looked down upon -> power display -> opponent''s jaw drops
- **Map expansion**: Small village -> city -> kingdom -> continent -> realm -- the world keeps getting bigger
- **Identity reveal**: Hidden identity gradually exposed, triggering ever-larger shockwaves

---

### II. Cultivation System Setting (The Most Important Setting Type)

The cultivation system is the soul of a xuanhuan crossing novel. It defines how power works in the world and determines the protagonist''s leveling path.

#### 2.1 Power System Type (力量体系类型)

The "Power System Type" field supports the following options:

| Type | Characteristics | Suitable Style |
|------|----------------|---------------|
| **Cultivation** (修真) | Spirit energy / true qi cultivation; pill and artifact refining | Eastern xianxia blend |
| **Magic** (魔法) | Elemental / incantation / mana system | Western fantasy blend |
| **Battle Aura** (斗气) | Physical body + aura combat system | Melee-focused |
| **Special Abilities** (异能) | Supernatural abilities with high individual variation | Diverse ability matchups |
| **Hybrid** (混合) | Multiple systems coexisting | Complex worldview |

**Design tip**: Hybrid systems offer the most flexibility but are hardest to write. You must clearly define interaction rules and power comparisons between systems. Single systems are easier to keep consistent.

#### 2.2 Realm Division (境界划分)

This is the skeleton of the cultivation system and the framework for the entire book''s leveling pace.

**Design principles**:
1. Recommend 7-12 realms; too few lacks depth, too many causes confusion
2. Each realm should represent a qualitative change, not just "stronger" but "new abilities unlocked"
3. Realm names should carry xuanhuan flavor and reflect progression in the nature of power
4. Each realm can be subdivided (Early / Mid / Late / Peak)

**Classic realm design reference**:
```
Mortal (Qi Gathering / Body Tempering / Meridian Opening) -> Qi Condensation ->
Foundation Building -> Golden Core -> Nascent Soul -> Spirit Transformation ->
Fusion -> Tribulation -> Immortal
```

**Realm-to-narrative correspondence**:

| Realm Tier | Narrative Phase | Activity Range | Conflict Scale |
|-----------|----------------|---------------|---------------|
| Low (1-3) | Starter zone / beginnings | Small town / sect | Personal grudges |
| Mid (4-6) | Mid-stage rise | Kingdom / continent | Faction warfare |
| High (7-9) | Continental competition | Continent / planes | Racial wars |
| Peak (10+) | Final showdown | Multi-realm / cosmos | Ultimate threat |

#### 2.3 Cultivation Resources (修炼资源)

Define the "currency" needed for characters to grow stronger:
- **Spirit stones / magic crystals**: Universal cultivation resource and economic currency
- **Rare natural treasures**: Scarce materials for breaking through bottlenecks
- **Pills**: Consumables that aid cultivation, healing, and power boosts
- **Secret realms / ruins**: Special locations for acquiring resources and opportunities
- **Technique manuals**: Cultivation methods themselves are precious resources

**Resources and plot**: Resources are one of the biggest sources of conflict -- disputes over resources are the most natural plot drivers.

#### 2.4 Techniques / Class Branches (功法/职业分支)

The "Techniques / Class Branches" field defines differentiated paths for cultivators:
- **Combat types**: Sword cultivator, body cultivator, spell cultivator, summoner, etc.
- **Support types**: Alchemist, artifact refiner, formation master, talisman crafter, etc.
- **Special types**: Beast tamer, puppet master, poison master, etc.

**Design points**:
1. The protagonist''s cultivation path should match their cheat ability
2. Different branches should complement each other, creating strategic space for teamwork and matchups
3. Support-type classes should not be low-status; they are the foundation of the social and economic systems

#### 2.5 Power Ceiling and Costs (能力上限与代价)

**Power ceiling**: What each realm can and cannot do must have clear boundaries:
- Low-realm cultivators cannot fly
- Below Golden Core cannot use certain forbidden techniques
- Only Tribulation stage and above can tear through space

**Costs**: Power should never be free:
- Backlash from excessive cultivation
- Costs of using forbidden techniques (shortened lifespan, damaged foundation, qi deviation)
- Consequences of failed breakthroughs

#### 2.6 Taboos and Risks (禁忌与风险)

Define the "red lines" on the cultivation path:
- **Qi deviation** (走火入魔): Consequences of cultivation errors
- **Inner demons** (心魔): Psychological obstacles in cultivation
- **Heavenly tribulation** (天劫): The Dao''s test when breaking through major realms
- **Forbidden techniques** (禁术): Abilities with immense power but terrible costs

#### 2.7 Representative Abilities (代表性能力)

Iconic ability showcases for each realm / branch:
- What is the signature ability at Foundation Building?
- What can a Golden Core cultivator do that was previously impossible?
- What are the trademark skills of different technique branches?

---

### III. World Setting

The world setting is the container for all other settings. A good xuanhuan world should make readers feel "this world is vast and can never be fully explored."

#### 3.1 World Name (世界名称)

Choose a name with xuanhuan atmosphere:
- Good: "Tianxuan Continent," "Nine Domains Divine Realm," "Myriad Spirit Plane"
- Avoid: Names that are too ordinary or literal

#### 3.2 Era Background (时代背景)

Determine the world''s current "environment":
- Primordial era of ten-thousand-race coexistence
- Golden epoch of flourishing cultivation civilization
- End-law era of declining spiritual energy
- Ruin epoch after a great war

The era background determines the abundance of cultivation resources and the tone of conflicts.

#### 3.3 Historical Background (历史背景)

Build historical depth for the world:
- Ancient great wars and seals
- Ruins and legends of primordial civilizations
- Historical rumors of apocalypse-level bosses
- How this history impacts the current situation

#### 3.4 Geographical Territory (地理版图)

Xuanhuan world geography should be **layered and gradually revealed**:

```
Starting area (a town / sect)
  |
Region (a nation / faction territory)
  |
Continent (multiple nations / factions coexisting)
  |
Realm (multiple continents / planes)
  |
Higher dimensions (Immortal realm / Divine realm / Void, etc.)
```

**Design principles**:
- Only reveal the nearest geographic scope initially; avoid laying out the entire world map from the start
- Reveal new geographic layers with each major power-up, giving readers a "the world is bigger than imagined" impact
- Different regions should have distinct resources, cultivation conditions, and faction dynamics

#### 3.5 Racial Landscape (种族格局)

Racial diversity is a hallmark of xuanhuan worlds:

| Race | Design Direction |
|------|-----------------|
| **Human** (人族) | Numerous, average talent but diverse cultivation paths |
| **Demon Beast** (妖族) | Beasts in human form, innately powerful physiques |
| **Demon** (魔族) | Gifted but discriminated against by other races |
| **Elf** (精灵族) | Nature-attuned, excels in a specific ability type |
| **Dragon** (龙族) | Noble bloodline, extremely rare but individually overpowering |

**Race impact on character design**: The "Race" (种族) field in the character Schema supports the above options and custom entries. Race choice affects a character''s talents, social standing, and interaction patterns.

#### 3.6 Political Landscape (政治格局)

Power games among major factions:
- Competition between great human empires
- Alliances and conflicts between different races
- Balance of power between cultivation sects, clans, and empires
- Hidden forces (ancient inheritances, secret organizations)

#### 3.7 Social Systems (社会制度)

Social stratification among cultivators:
- Relationship between cultivators and mortals
- Sect hierarchy systems
- Laws and rules governing cultivators
- Relationship between secular governments and cultivation factions

#### 3.8 Economy and Livelihood (经济民生)

An economic system centered on cultivation resources:
- Mining and circulation of spirit stones / magic crystals
- Trading markets for pills, artifacts
- Auctions (a classic xuanhuan satisfaction-point scene)
- Mercenary / adventurer quest systems

#### 3.9 Cultural Customs (文化风俗)

Cultural features unique to a cultivation world:
- Values centered on strength and power
- Competition culture: sect tournaments, ranking battles
- Apprenticeship etiquette, cultivation taboos
- The collision between survival-of-the-fittest and moral baselines

#### 3.10 Core Taboos and Rules (核心禁忌与规则)

Fundamental rules of world operation:
- Restrictions of Heavenly Dao / natural laws
- Rules preventing high-realm cultivators from casually attacking low-realm ones
- Reasons for the existence of certain forbidden techniques / forbidden zones
- Consequences of breaking the rules

---

### IV. Crossing Setup and Cheat Ability Combination Strategies

The crossing setup and cheat ability are tightly coupled setting types that should be designed together.

#### 4.1 Crossing Method (穿越方式)

The "Crossing Method" field supports 7 options:

| Method | Narrative Advantage | Best Paired Cheat Ability |
|--------|-------------------|--------------------------|
| **Rebirth after accidental death** | Has prior body''s memories and relationships | Past-life memory, rebirth foreknowledge |
| **Summoned by mysterious force** | Sense of mission; suits grand plots | System, divine artifact |
| **Crossing by touching artifact** | Possibility of return adds suspense | Divine artifact, tech gadget |
| **Crossing through dreams** | Gentle transition; slice-of-life | Talent, bloodline |
| **Lightning-strike crossing** | Classic; clean and decisive | Any |
| **Game/novel world crossing** | Protagonist has foreknowledge of the world | System, plug-in memory |
| **Group crossing** | Multi-protagonist or competitive dynamics | Any |

#### 4.2 Destination Type (目的地类型)

The "Destination Type" determines the overall worldview style:

| Destination | Style Characteristics |
|-------------|----------------------|
| **Xuanhuan World** (玄幻世界) | Eastern elements dominant; high cultivation freedom |
| **Cultivation World** (修真世界) | Pure Daoist cultivation system |
| **Western Fantasy** (西方奇幻) | Magic / sword-and-sorcery worldview |
| **Post-Apocalyptic Otherworld** (末日异界) | High survival pressure; cultivation is the only way out |
| **High-Martial World** (高武世界) | Martial arts supreme; combat-focused |
| **Non-Human Dominant** (异族主导) | Humans are weak; racial conflict is the core |

#### 4.3 Crossing Identity (穿越身份)

The "Crossing Identity" affects starting point and initial resources:

| Identity | Starting Resources | Narrative Effect |
|----------|-------------------|-----------------|
| **Sect disciple** (宗门弟子) | Medium (sect protection) | Sect politics + tournaments |
| **Rogue cultivator** (散修) | Low (free but no backing) | Solo adventure + encounters |
| **Noble** (贵族) | High (clan resources) | Clan power + political marriage |
| **Commoner** (平民) | Very low (from scratch) | Classic underdog route |
| **Adventurer** (冒险者) | Medium (freedom + quest system) | Monster hunting + exploration |
| **Non-human** (异族) | Special (racial talents) | Racial conflict + identity hiding |
| **Slave** (奴隶) | None | Ultimate underdog story |
| **Apprentice** (学徒) | Low (learning phase) | Growth-oriented narrative |

#### 4.4 Core Goal and Story Tone

"Core Goal" (核心目标) and "Story Tone" (故事基调) pairings:

| Core Goal | Best Story Tone |
|-----------|----------------|
| Cultivate and grow stronger (修炼变强) | Hot-blooded power fantasy (热血爽文) |
| Return to reality (返回现实) | Light adventure + mysterious suspense |
| Save the world (拯救世界) | Epic grandeur (史诗宏大) |
| Revenge (复仇) | Dark and brutal (黑暗残酷) |
| Explore the truth (探索真相) | Mysterious suspense (悬疑诡秘) |
| Build a faction (建立势力) | Epic grandeur + hot-blooded |

#### 4.5 Cheat Ability Design (金手指)

**Cheat Ability Type** reference:

| Type | Core Advantage | Typical Manifestation |
|------|---------------|----------------------|
| **System** (系统) | Quest rewards / stat panel | Complete quests for rewards; has levels and shop |
| **Divine Artifact** (神器) | Possesses a powerful item far beyond current realm | Sealed early; gradually unlocked |
| **Talent** (天赋) | Cultivation speed / efficiency crushes others | Others need ten years, protagonist needs one |
| **Bloodline** (血脉) | Awakening of a powerful race''s bloodline | Ancient divine beast / immortal bloodline |
| **Spirit Pet** (灵宠) | Powerful contracted beast / companion | Battle partner + growth companion |
| **Plug-in Memory** (外挂记忆) | Knowledge from a past life or crossing | Knows secret realm locations, pill recipes, techniques |
| **Tech Gadget** (科技道具) | Modern technology applied in the otherworld | Tech crushing low-civilization |

**Ability Description** (能力描述): Must be specific -- not "the protagonist is strong" but "the protagonist has XXX ability, can do YYY, but cannot do ZZZ."

**Usage Limitations** (使用限制): The cheat ability must have limits, or the story has no tension. Common limitations:
- Cooldown periods
- Resource consumption (spirit stones, life force)
- Realm restrictions (new functions unlock only after reaching certain realms)
- Usage counts
- Side effects (headaches, weakness, exposure risk)

**Growth Potential** (成长空间): The cheat ability should grow alongside the protagonist:
- Early: Assists survival and basic cultivation
- Mid: Plays decisive roles in key battles
- Late: Fully awakened; unlocks ultimate abilities

**Acquisition Method** (获得方式): Built-in at crossing vs. acquired later -- built-in is more direct; later acquisition provides more buildup.

#### 4.6 Pairing Principles for Crossing Setup and Cheat Ability

1. **Complementary, not overlapping**: Crossing identity provides the starting point; cheat ability provides the growth curve. The two should not fully overlap
2. **Limitation matching**: The lower the starting identity, the greater the cheat ability''s potential (trash start + heaven-defying cheat is a classic combo)
3. **Immersion**: The crossing method should make readers feel "if it were me, I could do the same"
4. **Tonal consistency**: Hot-blooded stories use system/talent cheats; dark stories use bloodline/memory cheats

#### 4.7 Romance Arc (感情线)

The "Romance Arc" field defines the protagonist''s emotional development. In xuanhuan crossing, romance is usually a subplot:
- Intertwined with the cultivation main plot (feelings develop during shared adventures)
- Romance development must not slow main plot pacing
- Female leads / supporting love interests should have independent cultivation strength and story arcs

---

### V. Story Hook Setting

#### 5.1 Story Hook (故事钩子)

The core suspense that keeps readers reading. A good hook should be introduced within the first three chapters:
- "After crossing, discovers they are the trash disciple of a sect, and the sect tournament is in three days"
- "Wakes up on a cliff edge, all spiritual power gone, pursuers closing in from behind"

#### 5.2 Core Selling Point (核心卖点)

What makes this work unique compared to similar stories. When distilling, consider:
- What innovation does the cultivation system offer?
- What makes the cheat ability unique?
- What novelty does the worldview bring?
- How does the narrative pacing differ?

#### 5.3 Opening Suspense (开篇悬念)

Suspense to establish in Chapter 1 -- usually the first crisis after crossing. The more urgent the crisis, the stronger the reader''s desire to keep reading.

#### 5.4 Reader Expectations (读者期待)

Clearly promise readers what experience they will get: face-slapping satisfaction, breakthrough achievement, worldview exploration freshness, or intellectual battle thrills.

---

### VI. Writing Style Setting

#### 6.1 Narrative Perspective (叙事视角)

- **Third person limited**: Most versatile; balances immersion and narrative flexibility (recommended)
- **First person**: Strongest immersion, but limits multi-threaded storytelling
- **Third person omniscient**: Suits multi-threaded epic narratives

#### 6.2 Language Style (语言风格)

| Style | Characteristics | Suitable Tone |
|-------|----------------|--------------|
| **Hot-blooded & thrilling** (热血燃爽) | Short sentences, exclamations, fast pace | Power fantasy |
| **Epic & grand** (史诗宏大) | Long sentences, macro descriptions, majestic atmosphere | Epic grandeur |
| **Light & humorous** (轻松幽默) | Commentary, teasing, rich inner monologue | Light adventure |
| **Dark & oppressive** (黑暗压迫) | Cold, restrained, gloomy environmental descriptions | Dark and brutal |

#### 6.3 Descriptive Focus (描写侧重)

- Combat scenes: Action descriptions, ability showcases, strategic maneuvering
- Cultivation breakthroughs: Internal visualization, spiritual energy flow, realm insight
- World exploration: Environment descriptions, wondrous things, geographic reveals
- Character interactions: Dialogue, expressions, psychological activity

#### 6.4 Pacing Control (节奏把控)

The pacing core of xuanhuan crossing is "tension and release":
- **Tense segments** (combat / crisis / breakthrough): Fast pace, short dense sentences
- **Transition segments** (cultivation / daily life / social): Medium pace, information interleaved
- **Climax segments** (major battle / ultimate breakthrough): Full throttle, no breathing room
- **Recovery segments** (post-battle / rest / insight): Slow pace, building energy for the next wave

**Pacing formula**:
```
Buildup -> tension -> minor climax -> brief recovery -> greater tension -> major climax -> recovery and rewards -> new buildup (cycle)
```

#### 6.5 Forbidden Vocabulary (禁用词汇)

List immersion-breaking terms that should not appear in the main text (e.g., overly modern internet slang). The protagonist''s inner monologue can lean modern, but narration and dialogue should fit the worldview.

---

### VII. Power Scaling and Combat Design

#### 7.1 Power Tiers

The power system must strictly correspond to realm divisions:
- Intra-realm power gaps should have an upper limit (peak vs. early should span at most half a sub-realm)
- Cross-realm combat is an opportunity to showcase cheat abilities / talent (fighting one realm above = protagonist aura)
- Cross-realm fighting cannot be too casual -- two realms above should be the absolute limit, or realm divisions lose meaning

#### 7.2 Three Elements of Combat

Every important battle should contain:
1. **Strategy layer**: Both sides'' tactical considerations and judgments
2. **Ability layer**: Specific technique/skill collisions
3. **Surprise layer**: The unexpected factor that breaks the stalemate (cheat ability, environmental exploitation, ally intervention)

#### 7.3 Combat Escalation

Combat complexity should increase with realm:
- **Low-realm combat**: Direct power clashes, technique exchanges
- **Mid-realm combat**: Artifact involvement, formation application, team coordination
- **High-realm combat**: Domain confrontation, Dao-law clashes, spatial warfare
- **Peak combat**: World-shattering scale; affects the entire power landscape

---

### VIII. Narrative Structure: From Nobody to Pinnacle

#### 8.1 Classic Narrative Framework

The xuanhuan crossing narrative framework follows a clear leveling path:

```
Crossing arrival -> Trash start -> Cheat ability awakening -> First showcase ->
Cultivation breakthrough -> Testing the waters -> Bigger world ->
Consecutive level-ups -> Final boss
```

| Phase | Narrative Goal | Chapter Ratio |
|-------|---------------|--------------|
| **Crossing arrival** | Establish crossing setup; protagonist confirms identity | 3-5% |
| **Trash start** | Show the predicament; build empathy | 5-8% |
| **Cheat ability awakening** | Hope appears; protagonist gains core advantage | 3-5% |
| **First showcase** | First time using the cheat to solve a problem / face-slap | 5-8% |
| **Cultivation breakthrough** | Systematic cultivation; first realm breakthrough | 10-15% |
| **Testing the waters** | Demonstrate power at a small scale (sect tournament / city-level conflict) | 15-20% |
| **Bigger world** | Leave the starting area; enter a broader world | 10-15% |
| **Consecutive level-ups** | Multiple realm breakthroughs; face ever-stronger opponents | 25-30% |
| **Final boss** | Ultimate showdown; all threads converge | 5-10% |

#### 8.2 Opening Design (First Five Chapters)

Opening quality directly determines whether readers stick around:

- **Chapter 1**: Crossing happens + confirm identity + show predicament (trash / crisis)
- **Chapter 2**: Learn basic world rules + discover cheat ability clues
- **Chapter 3**: Cheat ability officially awakens + form initial plan
- **Chapter 4**: First small-scale conflict / challenge
- **Chapter 5**: First victory / face-slap + introduce a bigger goal

**Key**: The first five chapters must complete the full cycle of "crossing + predicament + cheat ability + first satisfaction point."

#### 8.3 Mid-Section Pacing Control

The middle section is where stories most often fall apart. Core principles:

**Level-challenge cycle**:
```
Cultivation breakthrough -> showcase new ability -> encounter stronger opponent -> cultivate again -> break through again (cycle)
```

**Map expansion pacing**:
- When the protagonist''s power reaches the ceiling of the current area, introduce a new larger area
- New area = new opponents + new resources + new faction dynamics
- Avoid staying in one area too long

**Subplot management**:
- Subplots should serve the main plot (acquiring resources, building connections, growing strength)
- Subplots must not overshadow the main plot
- Every subplot should have a clear endpoint

#### 8.4 Climax Design

Every major climax should include:
1. **Buildup**: Showcase the opponent''s strength; create pressure
2. **Pre-battle preparation**: Protagonist uses all resources and connections
3. **Direct confrontation**: Ability clashes + strategic maneuvering
4. **Clutch reversal**: Turnaround when defeat seems certain (cheat ability / breakthrough / allies)
5. **Victory rewards**: Power increase + reputation growth + new information revealed

---

### IX. Satisfaction Point Design and Pacing

#### 9.1 Satisfaction Point Types

| Type | Description | Frequency |
|------|-------------|-----------|
| **Face-slapping** | Show power after being disrespected; shock the opponent | High (every 5-10 chapters) |
| **Breakthrough** | Cultivation realm advancement | Medium (per realm plan) |
| **Treasure acquisition** | Obtain precious resources / artifacts / techniques | Medium |
| **Reveal** | Identity / power / background reveal causes shockwaves | Low (key nodes) |
| **Comeback** | Turnaround from a desperate situation | Medium (once per major arc) |
| **Crushing** | Power-crushing someone who once crushed you | Low (important satisfaction nodes) |

#### 9.2 Satisfaction Point Pacing

```
Ch 1-5: Small satisfaction (first face-slap / minor victory)
Ch 6-15: Medium satisfaction (first realm breakthrough + intra-sect face-slap)
Ch 16-30: Large satisfaction (sect tournament / city-level victory)
Ch 31-50: Extra-large satisfaction (leave starting area + stunning debut on bigger stage)
... increasing progressively
```

**Core rules**:
- Gaps between satisfaction points cannot be too long (over 10 chapters with no payoff = reader attrition risk)
- Satisfaction points must escalate progressively; repeating same-level payoffs causes satisfaction fatigue
- Before major payoffs, sufficient "suffering buildup" is needed -- the more frustration, the bigger the payoff

#### 9.3 Buildup and Release Balance

| Buildup | Release |
|---------|---------|
| Being bullied / looked down upon | Power display face-slap |
| Cultivation bottleneck / grinding | Realm breakthrough |
| Approaching crisis / desperate situation | Clutch reversal |
| Hiding power | Identity / power grand reveal |
| Preparation and accumulation | Becoming famous in one battle |

---

### X. Character Design

#### 10.1 Protagonist Design

The protagonist''s "Cultivation Realm" (修为境界) field should start low and progress with the story.

**Transmigrator traits**:
- Modern thinking patterns (more flexible, more creative)
- Unfamiliarity with "cultivation world common sense" (early blunders add humor)
- Unyielding willpower (one of a transmigrator''s core competitive advantages)

**Trash start template**:
- Original body was a sect''s trash disciple / abandoned family wastrel / commoner with terrible cultivation talent
- After crossing, discovers blocked spiritual energy / damaged meridians / sealed by poison
- Cheat ability awakening fixes the problem, or provides an alternative cultivation path

#### 10.2 Race Selection

The "Race" (种族) field in the character Schema (Human / Demon Beast / Demon / Elf / Dragon, etc.) affects:
- Talents and cultivation direction
- Social standing in the world
- Relationships with characters of other races
- Whether identity must be hidden

**Protagonist race recommendation**: Human is most universal (strongest reader identification); non-human protagonists add uniqueness but require careful handling of racial conflict.

#### 10.3 Supporting Character Design Layers

| Role | Function | Design Focus |
|------|----------|-------------|
| **Brothers / comrades** | Fight alongside; share pressure | Independent cultivation paths and personalities |
| **Mentors / elders** | Teach cultivation; provide guidance | Cannot be omniscient; must have limitations |
| **Rivals / nemeses** | Create conflict; drive growth | Strength slightly above protagonist''s current level |
| **Faction representatives** | Show faction attitudes | Actions should represent organizational interests |
| **Emotional characters** | Provide emotional depth | Must not become mere decoration |

**Key**: Supporting characters must have their own behavioral logic and growth potential. The worst mistake is having all supporting characters orbit the protagonist as tools.

#### 10.4 Antagonist Design

Good antagonists serve as measuring sticks for protagonist growth:
- **Minor villains**: Same-realm competitors; surpassed within dozens of chapters
- **Mid-tier villains**: One to two realms above; protagonist must break through to oppose them
- **Major villains**: Far beyond the protagonist; long-term targets
- **Ultimate boss**: The strongest opponent in the book; connected to the world''s truth

---

### XI. Organization Design

This creation method''s organization type is called "Organization" (组织). Xuanhuan world organizations typically include:

#### 11.1 Organization Types

- **Sects** (宗门): The core organizational form for cultivators
- **Clans** (家族): Blood-tie-based factions
- **Empires / Kingdoms** (帝国/王国): Secular political powers
- **Merchant guilds** (商会): Economic organizations
- **Adventurer guilds** (冒险者公会): Quest distribution and cultivator management
- **Secret organizations** (秘密组织): Hidden forces manipulating from the shadows

#### 11.2 Organization Design Points

- Each organization has clear power tiers and internal hierarchy
- Inter-organizational relationships should form a network (alliance / hostility / competition / subordination)
- The protagonist''s relationship with organizations should evolve with the plot (join -> grow -> leave -> establish their own faction)
- Organizations are important resource sources (cultivation resources, techniques, quests, connections)

---

### XII. Available Categories

This creation method''s visible_categories include:

| Category | Purpose |
|----------|---------|
| **setting** | 6 setting types (World Setting, Cultivation System, Crossing Setup, Cheat Ability, Story Hook, Writing Style) |
| **character** | Character management (supports unique fields like Race, Cultivation Realm) |
| **organization** | Organization management (sects, clans, empires, etc.) |
| **scene** | Scene management (training grounds, secret realms, battlefields, etc.) |
| **chapter** | Chapter management |

---

### XIII. Common Pitfalls and How to Avoid Them

#### 13.1 Power Scaling Collapse (战力崩坏)

**Problem**: Power level comparisons contradict each other; same-realm characters are inconsistently strong or weak.

**Prevention**:
- Strictly define each realm''s ability boundaries in the Cultivation System setting
- Cross-realm combat has clear limits (one to two realms above maximum, with justification)
- Track each important character''s current realm and special abilities
- In group battles, maintain power balance among all parties

#### 13.2 Leveling Too Fast (升级太快)

**Problem**: Protagonist levels up too quickly; readers haven''t adjusted to the current realm before a new breakthrough.

**Prevention**:
- Each realm should have at least 1-2 complete story arcs
- Sufficient buildup before breakthroughs (bottlenecks, accumulation, opportunities)
- Higher realms should have longer intervals between breakthroughs
- Use the "realm consolidation" concept to control leveling pace

#### 13.3 Flat Supporting Characters (配角扁平)

**Problem**: Supporting characters lack personality and serve only as protagonist accessories.

**Prevention**:
- Every important supporting character should have independent goals and motivations
- Supporting characters should interact with each other, not only with the protagonist
- Give supporting characters their own spotlight moments
- Supporting characters should also grow; they cannot simply vanish once the protagonist outpaces them

#### 13.4 Worldview Contradictions (世界观前后矛盾)

**Problem**: Rules established early are broken later.

**Prevention**:
- Write "Core Taboos and Rules" clearly in the World Setting
- Realm divisions and ability boundaries in the Cultivation System must be consistent throughout
- If rules must be broken, provide reasonable explanations (ancient secret arts, Heavenly Dao exceptions)
- Periodically check existing settings against new plot developments for conflicts

#### 13.5 Overpowered Cheat Ability Kills Tension

**Problem**: Cheat ability is too strong; the protagonist can never lose.

**Prevention**:
- Strictly enforce the cheat ability''s usage limitations
- Opponents can also have their own "cheat abilities" or hidden cards
- The cheat ability can solve power problems but not all problems (interpersonal, political, emotional)
- As opponents grow stronger, the cheat ability''s advantage should gradually narrow

#### 13.6 Formulaic Plot (剧情模式化)

**Problem**: Every arc follows "get bullied -> breakthrough -> face-slap," causing reader fatigue.

**Prevention**:
- Vary conflict types (personal combat, faction disputes, secret realm exploration, alchemy competition, etc.)
- Not all conflicts should be resolved by force
- Intersperse intellectual battles, strategic planning, and diplomatic plotlines
- Occasionally let the protagonist experience genuine failure

---

### XIV. Pre-Writing Checklist

Confirm before you start writing:

- [ ] Is the "Realm Division" in the Cultivation System setting complete, with clear ability boundaries for each realm?
- [ ] Does the "Geographical Territory" in the World Setting support gradual expansion (small to large)?
- [ ] Do the Crossing Setup and Cheat Ability form a complementary pairing?
- [ ] Are the Cheat Ability''s "Usage Limitations" strict enough to maintain story tension?
- [ ] Can the "Opening Suspense" in the Story Hook be presented within the first three chapters?
- [ ] Is the "Pacing Control" in the Writing Style setting consistent with the story tone?
- [ ] Does each realm have at least one complete story arc planned?
- [ ] Are there sufficiently diverse satisfaction point types (not just face-slapping)?
- [ ] Do supporting characters have independent goals and behavioral logic?
- [ ] Does the power system strictly correspond to the realm divisions?',
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
