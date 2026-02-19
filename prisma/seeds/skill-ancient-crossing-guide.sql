-- 古代架空穿越小说创作方法专属 Skill / Ancient Fictional World Crossing Guide Skill
-- novel_creation_method_id = 古代架空穿越小说
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-ancient-crossing-guide.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ancient-crossing-guide',
  '古代架空穿越小说创作指南：涵盖世界观设定（王朝体系/政治格局/社会制度）、核心穿越设定与身份组合、金手指设计与限制策略、角色设计（古今双重身份）、势力格局构建、叙事结构、子类型写法（宫斗/宅斗/种田/经商/权谋）及常见陷阱规避',
  'Ancient fictional world crossing novel writing guide: covers worldview setting (dynasty system, political landscape, social institutions), core crossing setup and identity combinations, cheat ability design and limitation strategies, character design (modern-soul-in-ancient-body dynamics), faction structure building, narrative structure, sub-genre patterns (palace intrigue, household rivalry, farming, commerce, political strategy), and common pitfall avoidance',
  '## 古代架空穿越小说创作指南

本指南专为「古代架空穿越小说」创作方法设计。该类型的核心是：现代人穿越到一个架空的古代王朝，凭借前世记忆、现代知识或特殊能力，在封建社会中生存、逆袭，最终实现个人抱负或改变命运。

---

### 一、类型公约与核心要素

#### 1.1 什么是古代架空穿越

古代架空穿越是中国网络文学中最经典、最受欢迎的品类之一。它将现代人的思维方式和价值观植入架空的古代社会，通过文化冲突、身份落差和智谋博弈创造出独特的阅读体验。

| 核心要素 | 说明 |
|---------|------|
| **穿越事件** | 现代人灵魂进入架空古代世界的某个身份 |
| **王朝体系** | 一个完整的封建社会架构，包含政治、经济、文化 |
| **身份落差** | 穿越前后身份的反差，以及由此产生的矛盾与机遇 |
| **金手指** | 现代知识、特殊能力或系统辅助 |
| **逆袭弧线** | 从困境到翻盘的成长轨迹 |

#### 1.2 古代架空穿越 vs 其他穿越类型

| 对比维度 | 古代架空穿越 | 历史穿越 | 玄幻穿越 |
|---------|------------|---------|---------|
| 世界观 | 架空王朝，自由度高 | 真实历史，需考据 | 修仙/魔法世界 |
| 核心冲突 | 人际关系与权力博弈 | 历史事件与时代洪流 | 修炼升级与战斗 |
| 力量来源 | 智谋、人脉、金手指 | 历史知识、先知优势 | 修炼体系、异能 |
| 读者体验 | 宅斗宫斗的智力快感 | 改变历史的成就感 | 变强碾压的爽感 |
| 节奏特点 | 中等，重谋略铺垫 | 偏慢，重氛围考据 | 快节奏，密集爽点 |

#### 1.3 读者核心期待

- **逆袭翻盘**：从低谷到巅峰，步步为营地改变命运
- **智谋博弈**：利用现代知识和思维降维打击古代对手
- **打脸虐渣**：坏人欺负主角 → 主角反杀 → 围观者震惊
- **感情纠葛**：与古代人物之间的真挚感情发展
- **身份攀升**：从低位到高位的社会地位提升
- **文化碰撞**：现代思维与古代规矩的有趣冲突

---

### 二、世界观设定填写指南

世界观是整个故事的舞台。一个精心设计的架空王朝能让读者沉浸其中，相信这个世界是真实存在的。

#### 2.1 王朝名称

「王朝名称」是世界观的第一印象。

**设计要点**：
- 取一个有古韵的名字：大燕、北齐、南梁、大晋、昭国
- 避免直接使用真实朝代名称（唐、宋、明、清）——那是历史穿越
- 名称要有气势，体现王朝特质
- 可以参考真实朝代取相似但不同的名字

#### 2.2 时代背景

「时代背景」决定了故事的大环境氛围。

| 时代类型 | 特点 | 适合的主线 |
|---------|------|-----------|
| **开国盛世** | 国力强盛，机会多 | 经商致富、甜宠日常 |
| **中兴之世** | 稳定但暗流涌动 | 宫斗夺嫡、权谋争霸 |
| **王朝末年** | 动荡不安，危机四伏 | 复仇虐渣、权谋争霸 |
| **乱世割据** | 群雄并起，弱肉强食 | 权谋争霸、江湖恩怨 |
| **和平年代** | 社会稳定，礼教森严 | 宅斗逆袭、种田发家 |

#### 2.3 历史背景

「历史背景」为王朝提供纵深感：
- 王朝建立了多少年？经历了几代帝王？
- 有哪些重大历史事件影响至今？
- 当前皇帝的在位情况如何？
- 是否有过夺嫡之争、外族入侵等关键事件？

#### 2.4 地理版图

「地理版图」定义疆域和活动空间：
- **京城**：权力中心，宫斗和朝堂戏的主要舞台
- **各州/各郡**：地方势力的根基，封地、赴任的目的地
- **边疆**：军事冲突、流放贬谪的场所
- **江南/富庶之地**：经商致富的舞台
- **山野/乡村**：种田发家的空间

#### 2.5 政治格局

「政治格局」是权谋类故事的核心背景：
- 皇权是否稳固？皇帝的性格和执政风格？
- 有哪些世家大族把持朝政？
- 外戚和后宫对朝政的影响力？
- 宦官集团是否掌权？
- 文官武将的势力分布？
- 边疆将领的忠诚度？

#### 2.6 社会制度

「社会制度」是一个嵌套对象，包含四个子字段：

**官制**：
- 品级制度（几品几阶）
- 核心官职（丞相/六部尚书/都御史等）
- 文武官员的升迁路径

**爵位**：
- 爵位等级（亲王/郡王/国公/侯/伯）
- 世袭规则（降等袭爵 vs 不降等）
- 爵位与实权的关系

**科举**：
- 考试层级（童试/乡试/会试/殿试）
- 科举对寒门子弟的意义
- 考试内容和录取规则

**婚姻**：
- 嫡庶制度的具体规定
- 婚姻对家族联姻的政治意义
- 女性在婚姻中的地位和权力
- 和离/休妻的条件

#### 2.7 经济民生

「经济民生」影响经商和种田类故事：
- 货币制度：铜钱/银两/银票的换算
- 物价水平：普通百姓的收入和消费
- 商业环境：是否重农抑商？商人地位如何？
- 税收制度：农税、商税、徭役

#### 2.8 文化风俗

「文化风俗」为故事增添真实感：
- 节日习俗：上元节、端午、中秋等
- 礼仪规范：见面礼、用餐礼、书信格式
- 禁忌：女子抛头露面、男女大防等
- 服饰文化：不同身份的着装规范

---

### 三、核心设定填写指南

核心设定是故事的灵魂，决定了主角的起点、路径和终点。

#### 3.1 穿越方式

「穿越方式」定义了主角如何来到这个世界：

| 穿越方式 | 特点 | 适合的开场 |
|---------|------|-----------|
| **意外身亡后魂穿** | 最经典，现代人死后灵魂穿入古人身体 | 主角一开场就面临原身的困境 |
| **睡梦中穿越** | 较温和，一觉醒来人在古代 | 适合轻松基调的故事 |
| **被神秘力量召唤** | 有使命感，暗示有任务或回去的方法 | 适合有大主线的故事 |
| **触碰古物穿越** | 有仪式感，古物可以成为剧情线索 | 适合悬疑/双时空叙事 |
| **雷击穿越** | 传统经典，简单直接 | 适合快节奏故事 |

**选择「其他」时**，需要在「穿越方式详情」中详细说明。

**设计要点**：
- 穿越方式可以成为后续剧情的伏笔（如是否能回去？穿越是否有目的？）
- 魂穿时需要处理"原身"的记忆问题——主角是否继承了部分记忆？
- 穿越后与现代世界是否完全切断联系？

#### 3.2 穿越身份

「穿越身份」决定了主角的起点和难度：

| 穿越身份 | 起点难度 | 资源基础 | 适合主线 |
|---------|---------|---------|---------|
| **皇室宗亲** | ★★★ | 极高 | 宫斗夺嫡、权谋争霸 |
| **世家嫡女/嫡子** | ★★☆ | 高 | 宅斗逆袭、宫斗夺嫡 |
| **庶出子女** | ★★★ | 中 | 宅斗逆袭、复仇虐渣 |
| **落魄贵族** | ★★★★ | 低 | 复仇虐渣、经商致富 |
| **平民百姓** | ★★★★★ | 极低 | 种田发家、经商致富 |
| **奴婢/下人** | ★★★★★ | 无 | 宅斗逆袭、复仇虐渣 |
| **江湖人士** | ★★★★ | 低 | 江湖恩怨、复仇虐渣 |

**组合建议**：
- **高起点 + 内部危机**：皇室宗亲/嫡女身份，但面临被废黜、被陷害的困境
- **低起点 + 逆袭路线**：庶出/平民身份，靠智谋和金手指一步步往上爬
- **特殊组合**：穿越为已死之人的替身、冒名顶替者、失忆者

#### 3.3 主线剧情

「主线剧情」决定了故事的核心驱动力：

| 主线类型 | 核心冲突 | 典型目标 | 爽点类型 |
|---------|---------|---------|---------|
| **宫斗夺嫡** | 夺取皇位/后位 | 登上权力巅峰 | 智谋博弈、阴谋反转 |
| **宅斗逆袭** | 家族内部争斗 | 掌控家族命运 | 打脸虐渣、步步上位 |
| **经商致富** | 商业竞争 | 成为首富/建立商业帝国 | 赚钱爽感、以智取胜 |
| **种田发家** | 从无到有的建设 | 过上富足生活 | 经营成就、生活改善 |
| **复仇虐渣** | 向仇人复仇 | 让坏人付出代价 | 虐渣快感、正义伸张 |
| **权谋争霸** | 参与天下大势 | 辅佐明君/夺取天下 | 运筹帷幄、格局宏大 |
| **江湖恩怨** | 江湖纷争 | 查明真相/报仇雪恨 | 武打场面、快意恩仇 |
| **甜宠日常** | 感情发展 | 与爱人幸福生活 | 甜蜜互动、温馨日常 |

#### 3.4 感情线

「感情线」为故事增添情感维度：
- **一对一甜宠**：男女主从相遇到相知相爱，全程甜蜜
- **先婚后爱**：先成婚后培养感情，冷淡→暧昧→热恋
- **破镜重圆**：曾经的恋人因误会分开，最终和好
- **欢喜冤家**：初见不合，斗嘴拌嘴中产生感情
- **青梅竹马**：自幼相识，感情水到渠成
- **日久生情**：长期相处中慢慢被对方吸引
- **无CP事业线**：专注事业和权谋，不设感情线

#### 3.5 故事基调

「故事基调」决定了全书的情感氛围：
- **轻松爽文**：快节奏、多打脸、主角一路顺风
- **细腻虐心**：情感细腻、有虐有甜、催人泪下
- **权谋烧脑**：计中计、局中局、智商在线
- **温馨治愈**：日常温馨、岁月静好、慢节奏
- **热血励志**：主角从逆境中崛起、永不放弃

---

### 四、金手指设计指南

金手指是主角区别于普通古人的核心优势。设计得当的金手指能让主角光环合理化。

#### 4.1 金手指类型

| 类型 | 特点 | 适合主线 |
|------|------|---------|
| **空间/储物能力** | 拥有独立空间，可存储物品甚至种植 | 种田发家、经商致富 |
| **医术/毒术** | 精通医术或毒术 | 宅斗逆袭、宫斗夺嫡 |
| **预知未来/读心** | 能预见未来或读取他人想法 | 权谋争霸、宫斗夺嫡 |
| **系统辅助** | 拥有任务系统或商城系统 | 各种主线均可 |
| **前世记忆（历史知识）** | 拥有丰富的现代知识 | 经商致富、种田发家 |
| **武功/内力** | 拥有超凡武力 | 江湖恩怨、权谋争霸 |
| **无金手指（纯智商）** | 完全依靠现代思维和知识 | 宅斗逆袭、经商致富 |

#### 4.2 能力描述

「能力描述」需要具体化金手指的功能：
- 空间有多大？能存什么？有没有特殊功能（如时间加速）？
- 医术到什么程度？能治什么病？有没有现代医学知识辅助？
- 预知多远的未来？精确度如何？是否有触发条件？
- 系统提供什么功能？任务奖励是什么？

#### 4.3 使用限制

**这是金手指设计中最重要的部分**。没有限制的金手指会让故事失去张力。

**限制类型**：
- **使用频率**：每天/每月只能用几次
- **体力消耗**：使用后极度疲劳
- **触发条件**：只有特定情况下才能使用
- **暴露风险**：被人发现会招来杀身之祸
- **成长阶段**：初期功能有限，需逐步解锁
- **副作用**：使用后有不良反应

**设计原则**：限制要足够严格，让主角不能靠金手指解决所有问题，必须同时运用智谋和人际关系。

#### 4.4 成长空间

「成长空间」描述金手指的升级路径：
- 随故事推进，金手指如何变强？
- 有哪些里程碑式的升级节点？
- 最终形态是什么样的？
- 成长的触发条件是什么（任务？经验？时间？）

#### 4.5 获得方式

「获得方式」说明主角如何得到金手指：
- 穿越时自带？穿越后某个事件触发？
- 来自神秘人物的赠予？
- 从某个遗迹或宝物中获得？
- 获得方式是否会成为后续剧情线索？

---

### 五、故事钩子设定指南

故事钩子是吸引读者阅读的第一动力。

#### 5.1 故事钩子

「故事钩子」字段要求一句话概括最吸引人的点：
- 好例子："现代金融精英穿越为将军府最不受宠的庶女，用华尔街思维在后宅斗争中翻盘"
- 好例子："带着淘宝系统穿越古代，从卖货郎起步建立商业帝国"
- 避免空泛的描述："一个穿越者在古代的故事"

#### 5.2 核心卖点

「核心卖点」回答"读者为什么要看这本书"：
- 独特的穿越身份 + 特殊金手指组合
- 对某个子类型的创新演绎
- 独特的角色关系或情感冲突
- 新颖的世界观设定

#### 5.3 开篇悬念

「开篇悬念」是前三章就要抛出的钩子：
- 主角穿越后面临的第一个危机是什么？
- 有什么无法立刻解释的谜团？
- 开场就要建立**紧迫感**——主角必须在某个时限内解决某个问题

**常见开篇模式**：
- **绝境开局**：穿越就面临生死危机（被下毒、被处刑、被遗弃）
- **身份危机**：穿越的身份有重大问题（冒名顶替、被追杀的逃犯）
- **倒计时危机**：某个威胁正在逼近（三日内必须嫁人、月底交不出银子就卖身）

#### 5.4 读者期待

「读者期待」描述读者想看到什么：
- 主角如何用现代思维碾压古人？
- 那些欺负主角的人最终会怎样？
- 男女主的感情如何发展？
- 主角最终能达到什么样的高度？

---

### 六、文风设定填写指南

文风决定了读者的阅读体验和故事的整体氛围。

#### 6.1 叙事视角

| 视角 | 特点 | 适合场景 |
|------|------|---------|
| **第一人称** | 代入感最强，但信息受限 | 宅斗/宫斗（心理描写丰富） |
| **第三人称限知** | 兼顾代入感和叙事灵活性 | 最通用的选择 |
| **第三人称全知** | 可展现全局信息 | 权谋争霸（多线叙事） |

#### 6.2 语言风格

| 风格 | 特点 | 适合基调 |
|------|------|---------|
| **古风典雅** | 用语考究，有文学性 | 权谋烧脑、细腻虐心 |
| **半文半白** | 日常对话偏白话，叙述有古韵 | 最常见的选择 |
| **现代轻松** | 语言轻松活泼，穿越者口吻 | 轻松爽文、甜宠日常 |
| **幽默吐槽** | 主角用现代人吐槽古代规矩 | 轻松爽文、种田发家 |

**注意**：古风典雅需要一定的文字功底，建议新手选择半文半白或现代轻松。

#### 6.3 描写侧重

- **心理描写为主**：适合宅斗和宫斗，展示角色的思考和算计
- **对话推进为主**：节奏快，适合各种类型
- **动作场景为主**：适合江湖恩怨，武打描写丰富
- **环境氛围为主**：适合细腻文风，重视场景渲染

#### 6.4 节奏把控

- **快节奏爽文**：每章都有冲突和进展，三五章一个小高潮
- **中等节奏**：有铺垫有高潮，张弛有度
- **慢热细腻**：前期慢慢铺设，后期厚积薄发

#### 6.5 禁用词汇

古代架空穿越需要特别注意的禁用词汇：
- 明显的现代词汇（除非主角内心独白）
- 不符合时代的科技名词
- 穿越者公开使用的现代用语

---

### 七、角色设计要点

古代架空穿越小说的角色设计核心在于**现代灵魂与古代身体的双重性**。

#### 7.1 主角设计（穿越者）

**穿越前的身份（前世记忆）**：
「前世记忆」字段专为穿越者设计。需要明确：
- 现代身份：职业、学历、专业技能
- 性格特点：果断还是犹豫？善良还是腹黑？
- 核心技能：什么现代知识在古代最有用？
- 心理状态：对穿越的态度（接受/抗拒/利用）

**穿越后的身份**：
「身份地位」是一个嵌套对象，包含：
- **家族**：所属家族或势力
- **官职/爵位**：当前官职或爵位
- **嫡庶**：嫡出/庶出/不适用
- **排行**：在家族中的排行

**双重身份的张力**：
主角最大的魅力来自于**现代思维在古代规则下的运作**：
- 表面恭顺，内心有自己的算盘
- 看似遵守规矩，实则暗中布局
- 用现代的商业思维、心理学知识、管理经验来应对古代问题

#### 7.2 男主/女主设计（爱情对象）

爱情对象通常是古代人，需要具备：
- 与主角在价值观上有共鸣点
- 有独立的人格和目标（不只是恋爱工具人）
- 与主角的互动要有化学反应
- 身份地位要与感情线类型匹配

#### 7.3 反派设计

好的反派不是单纯的"坏人"：
- 反派需要有合理的动机（嫉妒、贪婪、自保、野心）
- 反派的智商要在线，不能太蠢
- 反派的实力要足够威胁主角
- 可以设计多层反派：小反派 → 中反派 → 大反派

#### 7.4 动态字段的运用

角色设计中有四个动态字段（随剧情变化）：
- **当前身份**：反映角色的社会地位变化
- **当前处境**：反映角色面临的局势
- **当前情绪**：反映角色的心理状态
- **好感度变化**：反映与主角的关系走向

这些字段应该在每个重要剧情节点后更新，帮助保持角色状态的一致性。

---

### 八、势力设计

势力是古代架空穿越小说的重要舞台元素，尤其在宫斗、权谋类故事中起决定性作用。

#### 8.1 势力类型

| 势力类型 | 代表 | 核心资源 | 在故事中的角色 |
|---------|------|---------|---------------|
| **皇室宗亲** | 皇帝、皇子、公主 | 皇权、兵权 | 最高权力中心 |
| **世家门阀** | 百年大族、名门望族 | 人脉、土地、声望 | 政治基本盘 |
| **外戚势力** | 皇后家族、太后母族 | 后宫影响力 | 后宫与前朝的桥梁 |
| **朝廷派系** | 文官集团、改革派 | 朝堂话语权 | 政策推动者 |
| **地方豪强** | 地方望族、土豪 | 地方资源、民心 | 地方势力代表 |
| **江湖门派** | 武林门派、侠客组织 | 武力、情报 | 体制外力量 |
| **商业势力** | 大商号、商会 | 财富、商业网络 | 经济力量 |

#### 8.2 势力关系网

设计势力时需要考虑势力之间的关系：
- **盟友关系**：利益一致、联姻关系
- **敌对关系**：利益冲突、历史恩怨
- **从属关系**：主从、附庸
- **中立/观望**：保持距离、待价而沽

#### 8.3 势力动态

每个势力都有「当前态势」动态字段：
- **上升期**：势力正在扩张，积极进取
- **鼎盛期**：势力达到顶峰，开始守成
- **衰落期**：势力开始走下坡路
- **危机中**：面临重大威胁
- **蛰伏中**：隐忍不发，等待时机

#### 8.4 势力设计原则

1. **至少三方势力**：两方太简单，三方以上才有博弈空间
2. **势力要有弱点**：没有完美的势力，每个都有致命弱点
3. **势力关系要动态变化**：随着剧情推进，盟友可能变敌人
4. **主角要与势力互动**：主角需要在势力间周旋、结盟、对抗

---

### 九、叙事结构

古代架空穿越小说推荐使用**四卷式结构**，每卷对应不同的剧情阶段。

#### 9.1 第一卷：穿越与立足（约10-15万字）

**核心任务**：
- 穿越事件发生，主角适应新身份
- 建立穿越者的基本设定（前世记忆、金手指）
- 解决第一个危机，站稳脚跟
- 引出主要矛盾和关键人物

**节奏要求**：
- 前三章必须出现核心悬念
- 第一卷结束时主角完成"立足"，但更大的挑战即将到来

#### 9.2 第二卷：崛起与发展（约15-20万字）

**核心任务**：
- 主角开始主动出击，实施自己的计划
- 金手指逐步展现更大的功能
- 与男主/女主的感情线展开
- 与小反派正面交锋并取得阶段性胜利
- 中反派浮出水面

**节奏要求**：
- 每5-8章一个小高潮
- 穿插日常和感情戏调节节奏
- 主角的实力/地位有明显提升

#### 9.3 第三卷：高潮与转折（约15-20万字）

**核心任务**：
- 主角面临最大的危机（被揭穿、被陷害、势力覆灭）
- 大反派全面出击
- 感情线面临考验
- 主角触底反弹，进入最终决战的准备
- 关键伏笔回收

**节奏要求**：
- 紧张感持续升级
- 有"至暗时刻"——主角看似要失败
- 转折点要出人意料但有伏笔支撑

#### 9.4 第四卷：终局与尾声（约10-15万字）

**核心任务**：
- 最终对决——主角vs大反派/最大障碍
- 所有悬念和伏笔解决
- 感情线尘埃落定
- 主角达成最终目标
- 收束性的尾声

**节奏要求**：
- 高潮紧凑有力
- 尾声不要拖沓
- 给读者满足感和完整感

---

### 十、子类型写法要点

不同的主线剧情类型有各自的写法要点。

#### 10.1 宫斗夺嫡

**核心要素**：
- 后宫/皇子间的明争暗斗
- 计中计、局中局的智谋博弈
- 站队与背叛
- 权力的诱惑与代价

**写法要点**：
- 每个对手都要有自己的团队和谋略
- 情报战和信息差是关键
- 适当使用"我知道你知道我知道"的博弈
- 不要每次都让主角赢——偶尔的失败让故事更真实

#### 10.2 宅斗逆袭

**核心要素**：
- 嫡庶之争、妻妾之争、家产之争
- 管家理事、经营后院
- 从不受宠到掌握话语权

**写法要点**：
- 宅斗的核心是"资源争夺"——关注度、财产、地位
- 利用古代嫡庶制度制造天然矛盾
- 主角的逆袭要一步步来，不能一蹴而就
- 管家理事是展示主角能力的好场景

#### 10.3 种田发家

**核心要素**：
- 从无到有的建设过程
- 利用现代知识改良农业/手工业
- 与乡邻的关系经营
- 逐步扩大规模

**写法要点**：
- 种田文的爽点在于"建设成就感"
- 要有合理的知识体系支撑（不能凭空造出现代技术）
- 节奏可以较慢，重视日常生活的细节描写
- 要有外部威胁来增加紧张感（土匪、贪官、自然灾害）

#### 10.4 经商致富

**核心要素**：
- 利用现代商业知识降维打击
- 商业竞争与商战
- 建立商业帝国的过程
- 官商关系的处理

**写法要点**：
- 商业创新要合理——不能直接造出工厂
- 注意古代商人的社会地位限制
- 利用信息差和模式创新而非技术碾压
- 商业成功要服务于主线剧情（赚钱是手段不是目的）

#### 10.5 权谋争霸

**核心要素**：
- 天下大势、多方博弈
- 军事与政治的结合
- 知人善用、运筹帷幄
- 格局宏大、视野高远

**写法要点**：
- 权谋需要清晰的势力图谱
- 每一步棋都要有前因后果
- 不要让主角一个人包揽所有——要有可靠的团队
- 战争场面要有战略层面的描写，不只是武力对决

---

### 十一、常见陷阱与避坑指南

#### 陷阱一：现代思维过度外露

**问题**：主角公开说出明显的现代观点（如"人人平等"、"自由恋爱"），却毫无后果。

**避免方法**：
- 主角的现代思维应该通过行动体现，而非直接说教
- 如果要推动观念变革，需要循序渐进地铺垫
- 在古代背景下直接宣扬现代价值观会招来危险——要让主角意识到这一点
- 可以用"内心吐槽 + 表面恭顺"的方式体现穿越者特质

#### 陷阱二：金手指万能化

**问题**：金手指没有任何限制，主角遇到任何困难都能用金手指轻松解决。

**避免方法**：
- 严格执行「使用限制」中设定的限制
- 设计金手指无法解决的困境（如人际关系、情感问题、政治博弈）
- 定期制造金手指失灵或使用受限的情境
- 确保主角的成功至少50%来自自身智谋而非金手指

#### 陷阱三：古代常识错误

**问题**：嫡庶制度、婚丧嫁娶、官职称谓等基本常识出错。

**避免方法**：
- 在「社会制度」中明确设定本书的规则体系（架空世界可以自定义，但要一致）
- 称谓要统一：爹/父亲、娘/母亲、姐姐/阿姐
- 官职品级不要前后矛盾
- 货币和物价要保持一致

#### 陷阱四：配角工具化

**问题**：配角只在需要时出现，没有自己的生活和目标。

**避免方法**：
- 给重要配角设定独立的「人物目标」和「人物弧光」
- 配角之间也应该有互动和关系线
- 反派要有合理的动机，不能单纯为了"坏"而坏
- 利用「好感度变化」动态字段追踪人物关系的演变

#### 陷阱五：节奏失控

**问题**：前期铺垫过多导致节奏拖沓，或者后期赶剧情导致草草收尾。

**避免方法**：
- 参考四卷式结构，合理分配字数
- 前三章必须出现核心冲突
- 每5-8章设置一个小高潮
- 利用章节的「剧情类型」字段确保剧情类型的多样性
- 不要在一个矛盾上纠缠太久——解决一个问题后立刻推进到下一个

---

### 十二、可用类别与工作流

#### 12.1 可用实体类别

本创作方法支持以下五种实体类别：

| 类别 | 说明 | 使用方式 |
|------|------|---------|
| **setting（设定）** | 世界观、核心设定、金手指、故事钩子、文风设定 | 每种设定都是单例（Singleton），只能有一个 |
| **character（角色）** | 所有角色，包括主角、爱情对象、配角、反派 | 可创建多个，用「角色定位」区分 |
| **organization（势力）** | 皇室宗亲、世家门阀、朝廷派系等 | 可创建多个，用「势力类型」区分 |
| **scene（场景）** | 皇宫内苑、王府宅邸、市井街巷等 | 可创建多个，用「场景类型」区分 |
| **chapter（章节）** | 故事的章节，包含卷号、章节号、大纲、正文 | 按顺序创建，组成完整故事 |

#### 12.2 推荐创作流程

1. **填写设定**：世界观 → 核心设定 → 金手指 → 故事钩子 → 文风设定
2. **设计势力**：根据主线类型创建3-5个势力
3. **设计角色**：先设计主角，再设计爱情对象、反派、重要配角
4. **设计场景**：根据故事需要创建关键场景
5. **编写章节**：按四卷式结构逐章创作

#### 12.3 章节编写要点

章节包含以下关键字段：
- **卷号/章节号**：使用汉语数字（一、二、三...）
- **标题**：简洁有吸引力
- **大纲**：本章的核心内容概要
- **剧情类型**：日常铺垫/矛盾冲突/高潮转折/感情戏/权谋博弈/打脸爽文/虐心催泪
- **情感基调**：轻松愉快/紧张刺激/温馨甜蜜/悲伤虐心/愤怒解气/悬疑烧脑
- **伏笔/回收**：本章的伏笔布局和回收情况
- **参与实体**：本章涉及的角色、场景、势力

---

### 写作前检查清单

开始写作前请确认：

- [ ] 「世界观」中的「王朝名称」和「时代背景」是否已完善
- [ ] 「核心设定」中的「穿越方式」与「穿越身份」是否搭配合理
- [ ] 「金手指」的「使用限制」是否足够严格以维持故事张力
- [ ] 「故事钩子」中的「开篇悬念」是否能在前三章内呈现
- [ ] 「文风设定」中的「节奏把控」是否与故事基调一致
- [ ] 势力关系网是否有至少三方势力形成博弈
- [ ] 主角的「前世记忆」是否与金手指类型相辅相成
- [ ] 角色的「身份地位」中的「嫡庶」是否与主线冲突相关
- [ ] 章节规划是否遵循四卷式结构
- [ ] 是否有足够多样的剧情类型（不只是打脸虐渣）',
  '## Ancient Fictional World Crossing Novel Writing Guide

This guide is designed specifically for the "Ancient Fictional World Crossing Novel" (古代架空穿越小说) creation method. The core concept: a modern person crosses into a fictional ancient dynasty, leveraging past-life memories, modern knowledge, or special abilities to survive, rise above adversity, and ultimately fulfill personal ambitions or change their fate within a feudal society.

---

### I. Genre Conventions and Core Elements

#### 1.1 What Is Ancient Fictional World Crossing

Ancient fictional world crossing is one of the most classic and beloved genres in Chinese web fiction. It transplants modern thinking and values into a fictional ancient society, creating a unique reading experience through cultural clashes, identity gaps, and strategic maneuvering.

| Core Element | Description |
|-------------|-------------|
| **Crossing event** | A modern person''s soul enters a specific identity in a fictional ancient world |
| **Dynasty system** | A complete feudal social structure encompassing politics, economics, and culture |
| **Identity gap** | The contrast between pre- and post-crossing identities, generating conflicts and opportunities |
| **Cheat ability** (金手指) | Modern knowledge, special abilities, or system assistance |
| **Rise arc** | A growth trajectory from adversity to triumph |

#### 1.2 Ancient Fictional Crossing vs. Other Crossing Types

| Dimension | Ancient Fictional Crossing | Historical Crossing | Xuanhuan Crossing |
|-----------|---------------------------|--------------------|--------------------|
| Worldview | Fictional dynasty, high creative freedom | Real history, requires research | Cultivation/magic world |
| Core conflict | Interpersonal relations and power games | Historical events and era forces | Cultivation leveling and combat |
| Power source | Strategy, connections, cheat abilities | Historical knowledge, foresight advantage | Cultivation system, supernatural powers |
| Reader experience | Intellectual thrill of scheming | Achievement of changing history | Power fantasy of crushing opponents |
| Pacing | Moderate, emphasizes strategic buildup | Slower, emphasizes atmosphere and research | Fast-paced, dense satisfaction points |

#### 1.3 Core Reader Expectations

- **Rise and reversal**: Step-by-step fate transformation from rock bottom to the top
- **Strategic superiority**: Using modern knowledge and thinking to outmaneuver ancient opponents
- **Face-slapping and revenge**: Villain bullies protagonist -> protagonist strikes back -> onlookers are stunned
- **Romantic entanglements**: Genuine emotional development with ancient characters
- **Social climbing**: Rising from a low position to a high social status
- **Cultural collision**: Entertaining clashes between modern thinking and ancient conventions

---

### II. Worldview Setting Guide

The worldview is the stage for the entire story. A carefully designed fictional dynasty immerses readers and makes them believe this world truly exists.

#### 2.1 Dynasty Name (王朝名称)

The "Dynasty Name" field creates the first impression of the world.

**Design tips**:
- Choose a name with classical elegance: Da Yan, Bei Qi, Nan Liang, Da Jin, Zhao Guo
- Avoid using real dynasty names (Tang, Song, Ming, Qing) -- that belongs to historical crossing
- The name should convey grandeur and reflect the dynasty''s character
- You can reference real dynasties for similar but distinct names

#### 2.2 Era Background (时代背景)

The "Era Background" determines the story''s macro-level atmosphere.

| Era Type | Characteristics | Suitable Main Plot |
|----------|----------------|-------------------|
| **Founding prosperity** | Strong national power, many opportunities | Commerce/wealth, sweet romance |
| **Mid-dynasty renaissance** | Stable on the surface, undercurrents beneath | Palace intrigue, political strategy |
| **Late dynasty decline** | Turbulent, crises everywhere | Revenge, political strategy |
| **Warring states era** | Warlords arise, survival of the fittest | Political strategy, martial arts feuds |
| **Peaceful era** | Stable society, strict social norms | Household rivalry, farming |

#### 2.3 Historical Background (历史背景)

The "Historical Background" field provides depth to the dynasty:
- How many years has the dynasty existed? How many emperors?
- What major historical events still affect the present?
- What is the current emperor''s reign like?
- Were there succession crises, foreign invasions, or other key events?

#### 2.4 Geographical Territory (地理版图)

The "Geographical Territory" defines the domain and activity space:
- **Capital city**: Center of power, main stage for court and palace intrigue
- **Provinces/prefectures**: Foundation of regional powers, destinations for land grants and official postings
- **Frontiers**: Settings for military conflict, exile, and banishment
- **Prosperous regions** (e.g., Jiangnan): Stage for commerce and wealth-building
- **Rural areas**: Space for farming and homesteading

#### 2.5 Political Landscape (政治格局)

The "Political Landscape" is the core backdrop for political-strategy stories:
- Is imperial power secure? What is the emperor''s personality and governing style?
- Which great families dominate the court?
- How much influence do consort clans and the inner court have on state affairs?
- Does the eunuch faction hold power?
- How are civil and military officials distributed?
- How loyal are frontier generals?

#### 2.6 Social Institutions (社会制度)

The "Social Institutions" field is a nested object with four sub-fields:

**Official System** (官制):
- Rank system (how many grades and tiers)
- Key positions (Chancellor, Ministers of the Six Boards, Chief Censor, etc.)
- Career advancement paths for civil and military officials

**Nobility** (爵位):
- Nobility tiers (Prince, Duke, Marquis, Count, Baron)
- Inheritance rules (diminishing inheritance vs. full inheritance)
- Relationship between titles and actual power

**Imperial Examinations** (科举):
- Examination levels (county, provincial, metropolitan, palace examinations)
- Significance for commoners seeking upward mobility
- Exam content and admission rules

**Marriage** (婚姻):
- Specific rules of the legitimate/concubine-born system
- Political significance of marriage alliances between families
- Women''s status and power within marriage
- Conditions for divorce/repudiation

#### 2.7 Economy and Livelihood (经济民生)

The "Economy and Livelihood" field affects commerce and farming storylines:
- Currency system: conversion rates for copper coins, silver taels, and bank notes
- Price levels: average income and expenses of commoners
- Business environment: are merchants suppressed? What is their social status?
- Tax system: agricultural tax, commercial tax, corvee labor

#### 2.8 Culture and Customs (文化风俗)

The "Culture and Customs" field adds authenticity:
- Festival customs: Lantern Festival, Dragon Boat Festival, Mid-Autumn Festival
- Etiquette norms: greetings, dining etiquette, letter formats
- Taboos: women appearing in public, gender segregation norms
- Dress codes: attire standards for different social statuses

---

### III. Core Setting Guide

The core setting is the soul of the story, determining the protagonist''s starting point, path, and destination.

#### 3.1 Crossing Method (穿越方式)

The "Crossing Method" defines how the protagonist arrives in this world:

| Crossing Method | Characteristics | Suitable Opening |
|----------------|----------------|-----------------|
| **Soul transmigration after accidental death** | Most classic; modern person dies and soul enters an ancient body | Protagonist immediately faces the original body''s predicament |
| **Crossing through dreams** | Gentler; waking up in ancient times | Suitable for lighter-toned stories |
| **Summoned by mysterious force** | Sense of mission; implies a task or way back | Suitable for stories with a grand main plot |
| **Crossing by touching an ancient artifact** | Ceremonial; the artifact can become a plot thread | Suitable for mystery/dual-timeline narratives |
| **Crossing via lightning strike** | Traditional classic; simple and direct | Suitable for fast-paced stories |

**When selecting "Other"**, detailed explanation is required in the "Crossing Method Details" (穿越方式详情) field.

**Design considerations**:
- The crossing method can foreshadow future plot points (can they return? Was the crossing intentional?)
- For soul transmigration, address the "original body''s" memory issue -- does the protagonist inherit partial memories?
- Is the connection to the modern world completely severed after crossing?

#### 3.2 Crossing Identity (穿越身份)

The "Crossing Identity" determines the protagonist''s starting point and difficulty:

| Crossing Identity | Difficulty | Resource Base | Suitable Main Plot |
|------------------|-----------|---------------|-------------------|
| **Imperial royalty** (皇室宗亲) | ★★★ | Very high | Palace intrigue, political strategy |
| **Noble legitimate child** (世家嫡女/嫡子) | ★★☆ | High | Household rivalry, palace intrigue |
| **Concubine-born child** (庶出子女) | ★★★ | Medium | Household rivalry, revenge |
| **Fallen aristocrat** (落魄贵族) | ★★★★ | Low | Revenge, commerce/wealth |
| **Commoner** (平民百姓) | ★★★★★ | Very low | Farming, commerce/wealth |
| **Servant/slave** (奴婢/下人) | ★★★★★ | None | Household rivalry, revenge |
| **Martial arts wanderer** (江湖人士) | ★★★★ | Low | Martial arts feuds, revenge |

**Recommended combinations**:
- **High start + internal crisis**: Royal/legitimate child identity, but facing abolition or framing
- **Low start + rise route**: Concubine-born/commoner identity, climbing up through wit and cheat abilities
- **Special combos**: Crossing as a dead person''s body double, impersonator, or amnesiac

#### 3.3 Main Plot (主线剧情)

The "Main Plot" determines the story''s core driving force:

| Plot Type | Core Conflict | Typical Goal | Satisfaction Type |
|-----------|--------------|-------------|-------------------|
| **Palace intrigue** (宫斗夺嫡) | Competing for throne/empress title | Reaching the pinnacle of power | Strategic games, plot twists |
| **Household rivalry** (宅斗逆袭) | Internal family struggles | Controlling the family''s destiny | Face-slapping, step-by-step rise |
| **Commerce/wealth** (经商致富) | Business competition | Becoming the richest, building an empire | Money-making satisfaction, outwitting rivals |
| **Farming/homesteading** (种田发家) | Building from nothing | Living a prosperous life | Achievement in building, life improvement |
| **Revenge** (复仇虐渣) | Avenging against enemies | Making villains pay | Revenge satisfaction, justice served |
| **Political strategy** (权谋争霸) | Participating in national affairs | Aiding a wise ruler, seizing power | Grand strategy, sweeping vision |
| **Martial arts feuds** (江湖恩怨) | Jianghu disputes | Uncovering truth, avenging wrongs | Martial arts action, righteous resolution |
| **Sweet romance** (甜宠日常) | Romantic development | Happy life with beloved | Sweet interactions, warm daily life |

#### 3.4 Romance Line (感情线)

The "Romance Line" adds an emotional dimension:
- **One-on-one sweet romance**: Sweet from meeting to love
- **Marriage before love**: Cold start -> gradually warming -> passionate love
- **Reconciliation**: Former lovers separated by misunderstanding, eventually reunited
- **Bickering couple**: Starting with conflict, developing feelings through arguments
- **Childhood friends**: Growing up together, feelings develop naturally
- **Slow-burn love**: Gradually attracted through long-term companionship
- **No CP, career focus**: Focused on career and strategy, no romance line

#### 3.5 Story Tone (故事基调)

The "Story Tone" determines the overall emotional atmosphere:
- **Light and satisfying** (轻松爽文): Fast-paced, lots of face-slapping, protagonist sails smoothly
- **Delicate and bittersweet** (细腻虐心): Nuanced emotions, both bitter and sweet, tear-jerking
- **Strategic and brain-burning** (权谋烧脑): Plots within plots, schemes within schemes, high IQ
- **Warm and healing** (温馨治愈): Daily warmth, peaceful life, slow pacing
- **Passionate and inspirational** (热血励志): Protagonist rises from adversity, never gives up

---

### IV. Cheat Ability Design Guide

The cheat ability (金手指) is the protagonist''s core advantage over ordinary ancient people. A well-designed cheat ability rationalizes the protagonist''s halo.

#### 4.1 Cheat Ability Types (金手指类型)

| Type | Characteristics | Suitable Main Plot |
|------|----------------|-------------------|
| **Spatial/storage ability** (空间/储物能力) | Possesses an independent space for storage or even farming | Farming, commerce |
| **Medical/poison arts** (医术/毒术) | Mastery of medicine or poisons | Household rivalry, palace intrigue |
| **Foresight/mind-reading** (预知未来/读心) | Can foresee the future or read others'' thoughts | Political strategy, palace intrigue |
| **System assistance** (系统辅助) | Has a quest system or shop system | All main plot types |
| **Past-life memories (historical knowledge)** (前世记忆) | Rich modern knowledge | Commerce, farming |
| **Martial arts/inner force** (武功/内力) | Extraordinary martial prowess | Martial arts feuds, political strategy |
| **No cheat ability (pure intellect)** (无金手指) | Relies entirely on modern thinking and knowledge | Household rivalry, commerce |

#### 4.2 Ability Description (能力描述)

The "Ability Description" field needs to specify the cheat ability''s functions:
- How large is the spatial pocket? What can it store? Any special features (e.g., time acceleration)?
- How advanced is the medical skill? What illnesses can be treated? Does modern medical knowledge assist?
- How far into the future can they see? How accurate is it? Are there trigger conditions?
- What functions does the system provide? What are the quest rewards?

#### 4.3 Usage Limitations (使用限制)

**This is the most important part of cheat ability design**. A cheat ability without limitations destroys story tension.

**Limitation types**:
- **Frequency**: Can only be used a certain number of times per day/month
- **Physical drain**: Extreme fatigue after use
- **Trigger conditions**: Only works under specific circumstances
- **Exposure risk**: Being discovered would bring mortal danger
- **Growth stages**: Limited functionality at first, must be gradually unlocked
- **Side effects**: Adverse reactions after use

**Design principle**: Limitations must be strict enough that the protagonist cannot solve every problem with the cheat ability and must also employ wit and interpersonal skills.

#### 4.4 Growth Potential (成长空间)

The "Growth Potential" field describes the upgrade path:
- How does the cheat ability grow stronger as the story progresses?
- What are the milestone upgrade points?
- What does the final form look like?
- What triggers growth (quests? experience? time?)

#### 4.5 Acquisition Method (获得方式)

The "Acquisition Method" explains how the protagonist gets the cheat ability:
- Brought along during crossing? Triggered by a post-crossing event?
- A gift from a mysterious figure?
- Obtained from a relic or treasure?
- Could the acquisition method become a future plot thread?

---

### V. Story Hook Setting Guide

The story hook is the primary force attracting readers to start and continue reading.

#### 5.1 Story Hook (故事钩子)

The "Story Hook" field requires a one-sentence summary of the most compelling element:
- Good example: "A modern Wall Street elite crosses into the body of a general''s least favored concubine-born daughter and uses financial thinking to triumph in household battles"
- Good example: "Crossing to ancient times with a shopping system, building a commercial empire starting as a traveling merchant"
- Avoid vague descriptions: "A story about someone who crossed to ancient times"

#### 5.2 Core Selling Point (核心卖点)

The "Core Selling Point" answers "why should readers pick up this book":
- A unique crossing identity + special cheat ability combination
- An innovative take on a sub-genre
- A unique character relationship or emotional conflict
- A novel worldview setting

#### 5.3 Opening Suspense (开篇悬念)

The "Opening Suspense" is the hook that must appear within the first three chapters:
- What is the first crisis the protagonist faces after crossing?
- What mystery cannot be immediately explained?
- The opening must establish **urgency** -- the protagonist must solve something within a deadline

**Common opening patterns**:
- **Dire straits opening**: Crossing immediately into a life-or-death crisis (poisoned, about to be executed, abandoned)
- **Identity crisis**: The crossed-into identity has major problems (impersonator, fugitive)
- **Countdown crisis**: A threat is approaching (must marry within three days, cannot pay debts by month''s end)

#### 5.4 Reader Expectations (读者期待)

The "Reader Expectations" field describes what readers want to see:
- How will the protagonist use modern thinking to outclass ancient people?
- What will ultimately happen to those who bully the protagonist?
- How will the romance develop?
- What heights can the protagonist ultimately reach?

---

### VI. Writing Style Setting Guide

Writing style determines the reading experience and overall atmosphere.

#### 6.1 Narrative Perspective (叙事视角)

| Perspective | Characteristics | Suitable For |
|------------|----------------|-------------|
| **First person** | Strongest immersion, but limited information | Household/palace intrigue (rich inner monologue) |
| **Third person limited** | Balances immersion and narrative flexibility | Most versatile choice |
| **Third person omniscient** | Can reveal full-picture information | Political strategy (multi-thread narration) |

#### 6.2 Language Style (语言风格)

| Style | Characteristics | Suitable Tone |
|-------|----------------|--------------|
| **Classical elegant** (古风典雅) | Refined diction, literary quality | Strategic brain-burning, delicate bittersweet |
| **Semi-classical** (半文半白) | Conversational dialogue, classical narration | Most common choice |
| **Modern casual** (现代轻松) | Light and lively, crossing-character voice | Light satisfying, sweet romance |
| **Humorous commentary** (幽默吐槽) | Protagonist roasts ancient conventions with modern humor | Light satisfying, farming |

**Note**: Classical elegant style requires strong writing skills; beginners should consider semi-classical or modern casual.

#### 6.3 Description Focus (描写侧重)

- **Psychology-focused**: Ideal for household and palace intrigue; reveals characters'' thoughts and calculations
- **Dialogue-driven**: Fast-paced, suitable for all types
- **Action-focused**: Ideal for martial arts feuds with rich combat descriptions
- **Atmosphere-focused**: Ideal for delicate writing style with emphasis on scene rendering

#### 6.4 Pacing Control (节奏把控)

- **Fast-paced satisfying**: Conflict and progress in every chapter; mini-climax every 3-5 chapters
- **Moderate pacing**: Balanced buildup and payoff
- **Slow-burn detailed**: Slow setup in early stages, explosive payoff later

#### 6.5 Forbidden Vocabulary (禁用词汇)

Ancient fictional crossing requires special attention to forbidden vocabulary:
- Obviously modern terminology (except in protagonist''s inner monologue)
- Technology terms that don''t fit the era
- Modern slang used publicly by the crossing character

---

### VII. Character Design Essentials

The core of character design in ancient fictional crossing novels lies in the **duality of a modern soul in an ancient body**.

#### 7.1 Protagonist Design (The Crosser)

**Pre-crossing identity (前世记忆)**:
The "Past-Life Memories" field is designed specifically for crossers. Must clarify:
- Modern identity: profession, education, specialized skills
- Personality traits: decisive or hesitant? Kind or cunning?
- Core skills: which modern knowledge is most useful in ancient times?
- Psychological state: attitude toward crossing (acceptance/resistance/exploitation)

**Post-crossing identity**:
The "Social Status" (身份地位) field is a nested object containing:
- **Family** (家族): Affiliated family or faction
- **Official rank/title** (官职/爵位): Current official position or noble title
- **Legitimate/concubine-born status** (嫡庶): Legitimate-born / Concubine-born / Not applicable
- **Birth order** (排行): Rank within the family

**Tension of dual identity**:
The protagonist''s greatest appeal comes from **modern thinking operating within ancient rules**:
- Outwardly compliant while inwardly scheming
- Appearing to follow conventions while secretly maneuvering
- Applying modern business thinking, psychological knowledge, and management experience to ancient problems

#### 7.2 Love Interest Design

The love interest is typically an ancient person who should:
- Share value resonance with the protagonist
- Have an independent personality and goals (not just a romance prop)
- Generate chemistry in interactions with the protagonist
- Have a social status that matches the romance line type

#### 7.3 Antagonist Design

A good antagonist is not simply "evil":
- Antagonists need reasonable motivations (jealousy, greed, self-preservation, ambition)
- Antagonists must be intelligent, not foolish
- Antagonists'' power must genuinely threaten the protagonist
- Consider layered antagonists: minor villain -> mid-boss -> final antagonist

#### 7.4 Using Dynamic Fields

Character design includes four dynamic fields (changing with plot):
- **Current status** (当前身份): Reflects changes in social standing
- **Current situation** (当前处境): Reflects the character''s current circumstances
- **Current emotions** (当前情绪): Reflects the character''s psychological state
- **Affinity changes** (好感度变化): Reflects the evolving relationship with the protagonist

These fields should be updated after every significant plot point to maintain character state consistency.

---

### VIII. Faction/Organization Design

Factions are crucial stage elements in ancient fictional crossing novels, especially decisive in palace intrigue and political strategy stories.

#### 8.1 Faction Types (势力类型)

| Faction Type | Representatives | Core Resources | Story Role |
|-------------|----------------|---------------|------------|
| **Imperial royalty** (皇室宗亲) | Emperor, princes, princesses | Imperial authority, military power | Supreme power center |
| **Noble great families** (世家门阀) | Century-old clans, prestigious houses | Connections, land, prestige | Political establishment |
| **Consort clan forces** (外戚势力) | Empress''s family, Empress Dowager''s family | Inner court influence | Bridge between harem and court |
| **Court factions** (朝廷派系) | Civil official blocs, reform factions | Court discourse power | Policy drivers |
| **Regional strongmen** (地方豪强) | Local wealthy clans, landowners | Local resources, popular support | Regional power representatives |
| **Martial arts sects** (江湖门派) | Wulin sects, knight-errant organizations | Martial force, intelligence | Extra-systemic forces |
| **Commercial forces** (商业势力) | Great merchant houses, trade guilds | Wealth, commercial networks | Economic power |

#### 8.2 Faction Relationship Networks

When designing factions, consider inter-faction relationships:
- **Alliance**: Aligned interests, marriage ties
- **Hostility**: Conflicting interests, historical grudges
- **Subordination**: Master-vassal, tributary relationships
- **Neutral/observing**: Keeping distance, waiting for the right moment

#### 8.3 Faction Dynamics

Every faction has a "Current Momentum" (当前态势) dynamic field:
- **Rising** (上升期): Faction is expanding, actively pushing forward
- **Peak** (鼎盛期): Faction has reached its zenith, shifting to maintenance
- **Declining** (衰落期): Faction is on a downward trajectory
- **In crisis** (危机中): Facing major threats
- **Lying low** (蛰伏中): Holding back, waiting for the right moment

#### 8.4 Faction Design Principles

1. **At least three factions**: Two is too simple; three or more create strategic depth
2. **Every faction must have weaknesses**: No perfect faction; each has a fatal flaw
3. **Faction relationships must evolve dynamically**: Allies can become enemies as the plot progresses
4. **Protagonist must interact with factions**: The protagonist needs to navigate between factions -- forming alliances, making deals, and clashing

---

### IX. Narrative Structure

Ancient fictional crossing novels are recommended to use a **four-volume structure**, with each volume corresponding to a different story phase.

#### 9.1 Volume One: Crossing and Establishing a Foothold (~100,000-150,000 characters)

**Core tasks**:
- The crossing event occurs; protagonist adapts to the new identity
- Establish the crosser''s basic setup (past-life memories, cheat ability)
- Resolve the first crisis and gain a foothold
- Introduce major conflicts and key characters

**Pacing requirements**:
- Core suspense must appear within the first three chapters
- By volume''s end, the protagonist has "established a foothold," but greater challenges are imminent

#### 9.2 Volume Two: Rise and Development (~150,000-200,000 characters)

**Core tasks**:
- Protagonist begins taking initiative, executing their plans
- Cheat ability gradually reveals greater functionality
- Romance line unfolds
- Direct confrontation with minor antagonists, achieving interim victories
- Mid-level antagonist emerges

**Pacing requirements**:
- A mini-climax every 5-8 chapters
- Intersperse daily life and romance scenes to modulate pacing
- Protagonist''s strength/status shows clear improvement

#### 9.3 Volume Three: Climax and Turning Point (~150,000-200,000 characters)

**Core tasks**:
- Protagonist faces the greatest crisis (exposed, framed, faction destroyed)
- Final antagonist strikes in full force
- Romance line faces a test
- Protagonist hits bottom and bounces back, preparing for the final battle
- Key foreshadowing is resolved

**Pacing requirements**:
- Tension escalates continuously
- Include a "darkest moment" -- the protagonist appears to be losing
- The turning point should be unexpected yet supported by earlier foreshadowing

#### 9.4 Volume Four: Conclusion and Epilogue (~100,000-150,000 characters)

**Core tasks**:
- Final showdown -- protagonist vs. final antagonist/greatest obstacle
- All mysteries and foreshadowing are resolved
- Romance reaches its conclusion
- Protagonist achieves the ultimate goal
- Closing epilogue

**Pacing requirements**:
- Climax is compact and powerful
- Epilogue should not drag on
- Give readers satisfaction and a sense of completeness

---

### X. Sub-Genre Writing Patterns

Different main plot types have their own writing essentials.

#### 10.1 Palace Intrigue (宫斗夺嫡)

**Core elements**:
- Open and covert battles between harem members / princes
- Plots within plots, strategic mind games
- Choosing sides and betrayals
- The temptation and cost of power

**Writing tips**:
- Every opponent must have their own team and strategies
- Intelligence warfare and information asymmetry are key
- Appropriately use "I know that you know that I know" game theory
- Don''t let the protagonist win every time -- occasional failures make the story more realistic

#### 10.2 Household Rivalry (宅斗逆袭)

**Core elements**:
- Legitimate vs. concubine-born conflicts, wife vs. concubine battles, property disputes
- Household management and inner-court administration
- Rising from being unloved to holding power

**Writing tips**:
- The core of household rivalry is "resource competition" -- attention, property, status
- Use the legitimate/concubine-born system to create natural conflicts
- The protagonist''s rise must be gradual, not instant
- Household management scenes are excellent for showcasing the protagonist''s competence

#### 10.3 Farming/Homesteading (种田发家)

**Core elements**:
- Building from nothing
- Using modern knowledge to improve agriculture/craftsmanship
- Managing relationships with neighbors
- Gradually expanding scale

**Writing tips**:
- The satisfaction in farming stories comes from "construction achievement"
- Needs a reasonable knowledge foundation (cannot conjure modern technology from thin air)
- Pacing can be slower, with emphasis on daily-life details
- External threats are needed for tension (bandits, corrupt officials, natural disasters)

#### 10.4 Commerce/Wealth (经商致富)

**Core elements**:
- Using modern business knowledge for advantage
- Business competition and trade wars
- Building a commercial empire
- Managing government-merchant relations

**Writing tips**:
- Business innovations must be plausible -- cannot build factories directly
- Consider ancient merchants'' restricted social status
- Leverage information asymmetry and model innovation, not technology crushing
- Commercial success should serve the main plot (making money is a means, not the goal)

#### 10.5 Political Strategy (权谋争霸)

**Core elements**:
- National-level affairs, multi-party maneuvering
- Combining military and political strategies
- Knowing people and deploying talents
- Grand vision and sweeping scope

**Writing tips**:
- Political strategy requires a clear faction map
- Every move must have cause and effect
- Don''t let the protagonist handle everything alone -- they need a reliable team
- Battle scenes need strategic-level description, not just martial prowess

---

### XI. Common Pitfalls and Avoidance Guide

#### Pitfall 1: Overly Exposed Modern Thinking

**Problem**: The protagonist openly expresses obviously modern viewpoints (like "all people are equal" or "freedom to love") with zero consequences.

**Prevention**:
- The protagonist''s modern thinking should be shown through actions, not direct lecturing
- If pushing for ideological change, it must be built up gradually
- Directly preaching modern values in an ancient setting would be dangerous -- the protagonist should know this
- Use "internal roasting + outward compliance" to express the crosser''s character

#### Pitfall 2: Omnipotent Cheat Ability

**Problem**: The cheat ability has zero limitations, and the protagonist breezes through every difficulty with it.

**Prevention**:
- Strictly enforce the limitations set in the "Usage Limitations" field
- Design dilemmas the cheat ability cannot solve (interpersonal issues, emotional problems, political games)
- Regularly create situations where the cheat ability malfunctions or is restricted
- Ensure at least 50% of the protagonist''s success comes from personal wit rather than the cheat ability

#### Pitfall 3: Ancient Common-Knowledge Errors

**Problem**: Basic errors in the legitimate/concubine-born system, marriage customs, official titles and ranks, etc.

**Prevention**:
- Define clear rules in the "Social Institutions" setting (fictional worlds can customize rules, but they must remain consistent)
- Keep forms of address consistent: Father, Mother, Elder Sister, etc.
- Official ranks and titles must not contradict each other
- Currency and prices must remain consistent throughout

#### Pitfall 4: Flat Supporting Characters

**Problem**: Supporting characters only appear when needed, with no lives or goals of their own.

**Prevention**:
- Give important supporting characters independent "Character Goals" (人物目标) and "Character Arcs" (人物弧光)
- Supporting characters should have interactions and relationship threads with each other
- Antagonists need reasonable motivations -- they cannot be evil simply for the sake of it
- Use the "Affinity Changes" (好感度变化) dynamic field to track relationship evolution

#### Pitfall 5: Pacing Collapse

**Problem**: Excessive early setup causes pacing to drag, or rushing the ending results in a sloppy conclusion.

**Prevention**:
- Follow the four-volume structure for rational word-count allocation
- Core conflict must appear within the first three chapters
- Set a mini-climax every 5-8 chapters
- Use the chapter''s "Plot Type" (剧情类型) field to ensure variety in plot types
- Don''t dwell on a single conflict for too long -- resolve one problem and move to the next

---

### XII. Available Categories and Workflow

#### 12.1 Available Entity Categories

This creation method supports five entity categories:

| Category | Description | Usage |
|----------|-------------|-------|
| **setting** | Worldview, Core Setting, Cheat Ability, Story Hook, Writing Style | Each setting type is a singleton (only one allowed) |
| **character** | All characters including protagonist, love interest, supporting, antagonists | Multiple allowed; differentiate by "Role Type" (角色定位) |
| **organization** (Faction) | Imperial royalty, noble families, court factions, etc. | Multiple allowed; differentiate by "Faction Type" (势力类型) |
| **scene** | Palace chambers, noble mansions, marketplaces, etc. | Multiple allowed; differentiate by "Scene Type" (场景类型) |
| **chapter** | Story chapters with volume number, chapter number, outline, content | Created sequentially to form the complete story |

#### 12.2 Recommended Creation Workflow

1. **Fill in settings**: Worldview -> Core Setting -> Cheat Ability -> Story Hook -> Writing Style
2. **Design factions**: Create 3-5 factions based on the main plot type
3. **Design characters**: Start with protagonist, then love interest, antagonists, key supporting characters
4. **Design scenes**: Create key scenes based on story needs
5. **Write chapters**: Create chapters sequentially following the four-volume structure

#### 12.3 Chapter Writing Essentials

Chapters include the following key fields:
- **Volume/chapter number** (卷号/章节号): Use Chinese numerals (一, 二, 三...)
- **Title** (标题): Concise and engaging
- **Outline** (大纲): Core content summary for this chapter
- **Plot Type** (剧情类型): Daily setup / Conflict / Climax-turning point / Romance / Political game / Face-slapping / Heartbreaking
- **Emotional Tone** (情感基调): Light-hearted / Tense-exciting / Warm-sweet / Sad-heartbreaking / Angry-satisfying / Suspenseful-brain-burning
- **Foreshadowing/payoff** (伏笔/回收): Foreshadowing planted and resolved in this chapter
- **Participating entities** (参与实体): Characters, scenes, and factions involved in this chapter

---

### Pre-Writing Checklist

Confirm before you start writing:

- [ ] Are the "Dynasty Name" and "Era Background" in the Worldview setting fully fleshed out?
- [ ] Do the "Crossing Method" and "Crossing Identity" in the Core Setting pair well together?
- [ ] Are the "Usage Limitations" of the Cheat Ability strict enough to maintain story tension?
- [ ] Can the "Opening Suspense" in the Story Hook be presented within the first three chapters?
- [ ] Is the "Pacing Control" in the Writing Style consistent with the story tone?
- [ ] Does the faction relationship network have at least three factions forming a strategic dynamic?
- [ ] Do the protagonist''s "Past-Life Memories" complement the cheat ability type?
- [ ] Is the "Legitimate/Concubine-Born Status" in the character''s "Social Status" relevant to the main conflict?
- [ ] Does the chapter plan follow the four-volume structure?
- [ ] Are there sufficiently diverse plot types (not just face-slapping and revenge)?',
  (SELECT id FROM novel_creation_method WHERE name = '古代架空穿越小说' LIMIT 1),
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
