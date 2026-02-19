-- 古代架空穿越小说创作方法专属 Skill / Ancient Fantasy Transmigration Genre Skill
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '古代架空穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-ancient-crossing-design.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ancient-crossing-design',
  '穿越开局与金手指平衡：穿越方式×身份×主线的经典组合、金手指类型设计与限制平衡、开局前三章设计、各子类型叙事要点、感情线发展、工具使用指南',
  'Transmigration opening and cheat power balance: classic combinations of crossing method x identity x main plot, cheat power type design and limitation balancing, first three chapters design, narrative essentials for each subtype, romance development, and tool usage guide',
  '## 穿越开局与金手指平衡

本指南专为「古代架空穿越小说」创作方法提供穿越设定与金手指平衡方面的写作指导。核心关注：**如何设计一个引人入胜的穿越开局，以及如何让金手指既给主角优势又不破坏叙事张力**。

---

### 一、穿越方式 × 身份 × 主线的经典组合

穿越设定的三大基础选项（穿越方式、穿越身份、主线剧情）之间存在天然的契合度。以下是经验证的高适配组合。

#### 1.1 宫斗夺嫡线

| 字段 | 推荐选项 | 理由 |
|------|---------|------|
| 穿越方式 | 意外身亡后魂穿 | 魂穿继承原身记忆碎片，可以迅速融入后宫环境 |
| 穿越身份 | 皇室宗亲 / 世家嫡女 | 需要足够的政治起点才能参与宫斗 |
| 故事基调 | 权谋烧脑 | 宫斗的核心魅力在于智商对决和信息战 |
| 感情线 | 先婚后爱 / 日久生情 | 政治联姻是宫斗最自然的感情线起点 |

**穿越方式详情建议**：原身因宫中阴谋而亡（中毒/陷害/意外），穿越者接手后需要先解决原身遗留的危机——这就是第一个钩子。

#### 1.2 宅斗逆袭线

| 字段 | 推荐选项 | 理由 |
|------|---------|------|
| 穿越方式 | 意外身亡后魂穿 / 睡梦中穿越 | 魂穿可继承记忆，便于识破宅斗阴谋 |
| 穿越身份 | 庶出子女 | 从低处起步，逆袭空间最大 |
| 故事基调 | 轻松爽文 | 宅斗逆袭的核心爽点是打脸和翻身 |
| 感情线 | 欢喜冤家 / 青梅竹马 | 与宅斗的轻快调性匹配 |

**穿越方式详情建议**：原身被嫡姐/嫡母欺压致死，穿越者带着现代人的独立意识重生，立刻打破逆来顺受的人设。

#### 1.3 种田发家线

| 字段 | 推荐选项 | 理由 |
|------|---------|------|
| 穿越方式 | 任意（触碰古物穿越尤佳） | 种田文对穿越方式没有强约束 |
| 穿越身份 | 平民百姓 | 从零开始，一步步改善生活，满足感最强 |
| 故事基调 | 温馨治愈 | 种田文的核心魅力是慢节奏的生活建设 |
| 感情线 | 一对一甜宠 / 日久生情 | 配合温馨基调，感情线不宜过于纠结 |

**穿越方式详情建议**：穿越至偏远村庄或流放途中，身边资源极度匮乏，凸显主角利用现代知识白手起家的过程。

#### 1.4 经商致富线

| 字段 | 推荐选项 | 理由 |
|------|---------|------|
| 穿越方式 | 意外身亡后魂穿 | 需要继承原身的一定人脉基础 |
| 穿越身份 | 落魄贵族 / 平民百姓 | 有身份但没钱，或有自由但无资源 |
| 故事基调 | 轻松爽文 / 热血励志 | 商战的核心爽点是以少胜多、出奇制胜 |
| 感情线 | 先婚后爱 / 欢喜冤家 | 商业合作转为情感，逻辑自然 |

**穿越方式详情建议**：原身因家道中落被亲友背弃，穿越者利用现代商业思维（品牌、营销、供应链）从一间小铺做到商业帝国。

#### 1.5 甜宠日常线

| 字段 | 推荐选项 | 理由 |
|------|---------|------|
| 穿越方式 | 任意（睡梦中穿越体验最柔和） | 甜宠文不需要太戏剧化的穿越方式 |
| 穿越身份 | 世家嫡女/嫡子 | 身份足够高，减少生存压力，腾出空间给感情线 |
| 故事基调 | 温馨治愈 | 甜宠文核心是甜，不是虐 |
| 感情线 | 一对一甜宠 / 青梅竹马 | 核心就是感情线本身 |

**穿越方式详情建议**：穿越至尚未卷入大冲突的和平时期，男/女主身份互补，日常互动即是故事主体。

#### 1.6 复仇虐渣线

| 字段 | 推荐选项 | 理由 |
|------|---------|------|
| 穿越方式 | 意外身亡后魂穿 | 原身被害而死，穿越者带着怒气和信息差复仇 |
| 穿越身份 | 庶出子女 / 落魄贵族 | 被欺压的身份才有复仇的立场和驱动力 |
| 故事基调 | 细腻虐心 / 轻松爽文 | 虐心偏向情感深度，爽文偏向快节奏打脸 |
| 感情线 | 破镜重圆 / 日久生情 | 复仇过程中遇到理解自己的人 |

#### 1.7 权谋争霸线

| 字段 | 推荐选项 | 理由 |
|------|---------|------|
| 穿越方式 | 被神秘力量召唤 / 雷击穿越 | 带有命运感的穿越方式匹配宏大叙事 |
| 穿越身份 | 皇室宗亲 / 江湖人士 | 需要有参与权力博弈的入场券 |
| 故事基调 | 权谋烧脑 / 热血励志 | 争霸文的核心是战略规划和格局展现 |
| 感情线 | 无CP事业线 / 先婚后爱 | 事业为主，感情为辅 |

#### 1.8 如何填写核心设定

调用 `update_setting` 填写「核心设定」时，所有字段应形成统一的叙事基调：

- **穿越方式**和**穿越身份**决定主角的起点
- **主线剧情**决定故事的核心冲突方向
- **感情线**类型应与主线节奏匹配——权谋线不宜配甜宠，种田线不宜配虐恋
- **故事基调**是整篇小说的情绪底色，所有选项都应与之协调

---

### 二、金手指设计与限制平衡

金手指（cheat power）是穿越文的核心竞争力。设计原则：**金手指解决30%的问题，主角自身努力解决70%**。

#### 2.1 八大金手指类型详解

**空间/储物能力**

| 维度 | 说明 |
|------|------|
| 最佳搭配 | 种田发家、经商致富 |
| 能力描述 | 拥有独立空间，可存储物品，空间内时间静止（食物不腐坏） |
| 使用限制 | 空间容量初始很小（如一立方米），需通过特定条件缓慢扩大 |
| 成长空间 | 容量逐级增大，后期解锁温度控制、活物存储等高级功能 |
| 获得方式 | 穿越时随身附带 / 接触特殊玉佩/戒指后激活 |

**医术/毒术**

| 维度 | 说明 |
|------|------|
| 最佳搭配 | 宫斗夺嫡、宅斗逆袭、权谋争霸 |
| 能力描述 | 携带现代医学知识或获得神医传承，能诊治古代无法处理的疾病 |
| 使用限制 | 缺少现代药物和设备，需寻找古代替代药材，稀有药材极难获取 |
| 成长空间 | 从基础急救→常见病治疗→疑难杂症→毒术/解毒→研制新药 |
| 获得方式 | 前世是医学生/医生 / 穿越时获得医书传承 |

**预知未来/读心**

| 维度 | 说明 |
|------|------|
| 最佳搭配 | 宫斗夺嫡、权谋争霸 |
| 能力描述 | 能预见短期未来片段或感知他人当下心声 |
| 使用限制 | 预知片段模糊不完整，读心会导致剧烈头痛，使用次数有日限 |
| 成长空间 | 预见时间线延长、清晰度提高；读心范围扩大但副作用也加重 |
| 获得方式 | 穿越附带 / 触碰神秘法器激活 |

**系统辅助**

| 维度 | 说明 |
|------|------|
| 最佳搭配 | 任意主线均可（最万能的金手指类型） |
| 能力描述 | 拥有任务系统，完成任务获得积分，积分兑换技能/物品/信息 |
| 使用限制 | 任务有时限和难度梯度，积分获取速度有限，高阶奖励价格昂贵 |
| 成长空间 | 系统功能逐步解锁（商城→抽奖→副本→特殊任务） |
| 获得方式 | 穿越时绑定 / 完成特殊触发条件后激活 |

**前世记忆（历史知识）**

| 维度 | 说明 |
|------|------|
| 最佳搭配 | 种田发家、经商致富、权谋争霸 |
| 能力描述 | 携带现代世界的知识体系：科技、历史、经济学、农业技术等 |
| 使用限制 | 记忆随时间逐渐模糊，很多现代知识无法直接套用到古代环境 |
| 成长空间 | 从简单知识应用→复杂技术改良→系统性改变某个领域 |
| 获得方式 | 天然携带（最合理、最写实的金手指类型） |

**武功/内力**

| 维度 | 说明 |
|------|------|
| 最佳搭配 | 江湖恩怨、权谋争霸 |
| 能力描述 | 穿越后获得特殊武功心法或内力底子 |
| 使用限制 | 需要大量时间修炼，不可能一夜之间成为高手 |
| 成长空间 | 从基础身法→内力运转→独门绝学→宗师境界 |
| 获得方式 | 穿越到习武之家 / 意外获得秘籍 / 穿越时附带根骨天赋 |

**无金手指（纯智商）**

| 维度 | 说明 |
|------|------|
| 最佳搭配 | 宫斗夺嫡、宅斗逆袭、权谋争霸 |
| 能力描述 | 不依赖任何超自然能力，纯靠现代人的思维方式和知识储备 |
| 使用限制 | 无超能力兜底，每一步都需要精密计算和人际操作 |
| 成长空间 | 从被动应对→主动布局→操控全局 |
| 获得方式 | 无需特殊获取——这是最硬核的模式 |

**其他（自定义）**

用于以上类型无法涵盖的独创金手指，如：万物生长术、动物沟通、容貌变化术等。

#### 2.2 使用限制的设计原则

使用限制（使用限制字段）是金手指设计中最关键的部分——**没有限制的金手指等于玛丽苏**。

限制的三个维度：

| 维度 | 说明 | 示例 |
|------|------|------|
| **物理限制** | 使用条件、冷却时间、体力消耗 | 空间每天只能开启三次；读心后头痛欲裂 |
| **资源限制** | 需要消耗某种稀缺材料 | 医术需要稀有药材；系统需要积分 |
| **代价限制** | 使用后产生负面后果 | 预知未来会折寿；过度使用武功会经脉受损 |

**核心检验标准**：如果去掉金手指，主角是否仍然能凭借智慧和努力缓慢推进故事？如果可以，说明金手指的定位是正确的——它是加速器而非万能钥匙。

#### 2.3 成长空间的递进设计

成长空间（成长空间字段）让金手指与故事发展同步升级，保持持续的新鲜感：

```
初期（前20%）：金手指提供微弱但关键的优势
   → 空间只有一立方米，但足以藏几包种子
中期（20%-60%）：能力逐步增强，但挑战也同步升级
   → 空间扩大到十立方米，但需要经营的产业也更庞大
后期（60%-90%）：能力接近巅峰，但面对的对手/困境也最强
   → 空间已有百立方米，但朝廷开始注意到主角的异常
终章（90%-100%）：金手指在最后关头发挥决定性作用
   → 在绝境中空间突破极限，完成最后的逆转
```

#### 2.4 金手指与主线的联动

金手指类型应当与主线剧情形成叙事共振：

| 主线 | 推荐金手指 | 联动逻辑 |
|------|-----------|---------|
| 宫斗夺嫡 | 预知/读心/医术 | 信息是宫斗最大的武器 |
| 宅斗逆袭 | 医术/系统/无金手指 | 靠真本事一步步翻盘更有说服力 |
| 种田发家 | 空间/前世记忆 | 空间存种子、记忆里的农业技术直接变现 |
| 经商致富 | 前世记忆/空间/系统 | 现代商业知识是最实用的经商金手指 |
| 权谋争霸 | 武功/预知/前世记忆 | 争霸需要文韬武略兼备 |
| 甜宠日常 | 任意（轻量级） | 金手指不宜喧宾夺主 |
| 江湖恩怨 | 武功/医术 | 江湖以武力和救命之恩建立关系 |
| 复仇虐渣 | 医术/毒术/读心 | 了解敌人的弱点是复仇的前提 |

---

### 三、开局前三章设计

前三章决定读者是否继续阅读。每一章都有明确的叙事任务。

#### 3.1 第一章：穿越（剧情类型=高潮转折）

**叙事任务**：完成穿越、建立即时危机、勾住读者。

**结构模板**：

1. **穿越瞬间**（500-800字）
   - 简洁交代穿越方式（不要在回忆前世上花太多篇幅）
   - 快速确认"我穿越了"的事实

2. **醒来后的第一个场景**（800-1200字）
   - 通过五感描写建立古代环境（气味、声音、触感、视觉）
   - 在环境描写中植入身份线索（衣着、房间规格、旁人称呼）

3. **即时危机**（1000-1500字）
   - 原身遗留的紧急状况：有人来兴师问罪/被下毒/被赶出家门/面临抄家
   - 主角必须在完全不了解情况下应对——这是穿越文的核心张力

**第一章的情感基调**：紧张刺激

**关键原则**：
- 不要用大段内心独白解释穿越——读者已经知道这是穿越文
- 第一章结尾必须留下悬念或即将到来的更大危机
- 前世记忆字段中的关键信息不要在第一章全部揭示

#### 3.2 第二章：身份辨认（剧情类型=日常铺垫）

**叙事任务**：弄清"我是谁"、梳理人际关系、发现潜在威胁。

**结构模板**：

1. **信息收集**（800-1000字）
   - 主角通过身边丫鬟/小厮/家人的对话获取信息
   - 利用"大病初愈/受惊失忆"作为掩护，解释为什么对自己的事不了解

2. **人物关系网**（1000-1500字）
   - 引出3-5个关键角色：盟友、敌人、暧昧对象
   - 每个角色用一两句话建立鲜明印象

3. **局势分析**（500-800字）
   - 主角用现代人的分析思维梳理当前处境
   - 识别最大威胁和可能的突破口

**第二章的情感基调**：轻松愉快（在紧张的第一章后给读者喘息）

**关键原则**：
- 信息投放要克制——不要一次性倒出所有世界观设定
- 用角色互动传递信息，而非直接叙述
- 第二章结尾暗示即将到来的第一个小冲突

#### 3.3 第三章：金手指首秀（剧情类型=打脸爽文）

**叙事任务**：展示主角的不同之处、第一次使用金手指、给读者第一个爽点。

**结构模板**：

1. **冲突触发**（500-800字）
   - 有人挑衅/欺负/设计陷害主角
   - 按照原身的性格应该忍气吞声或束手无策

2. **金手指介入**（800-1200字）
   - 主角利用金手指或现代知识化解危机
   - 展示方式要巧妙——不是直接炫耀，而是"恰好"解决了问题
   - 让旁观者（和读者）产生"这个人不简单"的感觉

3. **反应与余波**（500-800字）
   - 挑衅者的惊讶或愤怒
   - 旁观者的重新评估
   - 主角内心对金手指的初步认知和使用规划

**第三章的情感基调**：愤怒解气

**关键原则**：
- 金手指首秀不要太炸裂——留出后续升级空间
- 化解危机的方式要有智慧含量，不是纯靠金手指碾压
- 第三章结尾建立一个更大的目标或更强的对手

#### 3.4 前世记忆字段的运用

角色档案中的「前世记忆」字段是穿越者专属的，应在开局三章中逐步展露：

| 阶段 | 前世记忆内容 | 叙事用途 |
|------|-------------|---------|
| 第一章 | 职业技能（如医学、厨艺、工程） | 解释主角为什么有超越时代的能力 |
| 第二章 | 历史知识片段 | 帮助主角判断自己所处的时代和局势 |
| 第三章 | 实用生活技能 | 第一次展示现代知识在古代的应用 |

**注意**：前世记忆应逐渐模糊——细节越用越少，倒逼主角发展自身能力。

---

### 四、各子类型叙事要点

不同的主线剧情有不同的叙事节奏和侧重点。

#### 4.1 宫斗夺嫡

**核心叙事机制**：信息不对称 + 联盟博弈

| 要素 | 说明 |
|------|------|
| 政治联盟 | 谁是盟友、谁是棋子、谁是暗桩，联盟关系随利益变化 |
| 信息战 | 谁掌握的信息更多谁就占上风，窃取/散布/隐藏信息是核心手段 |
| 情感操控 | 利用感情弱点攻击对手：假意示好、离间亲信、制造误会 |
| 步步为营 | 每一步都是布局，每一次示弱都是诱敌 |

**章节剧情类型分配**：权谋博弈（40%）> 感情戏（20%）> 矛盾冲突（20%）> 高潮转折（15%）> 日常铺垫（5%）

#### 4.2 宅斗逆袭

**核心叙事机制**：身份翻转 + 逐步揭秘

| 要素 | 说明 |
|------|------|
| 起点很低 | 庶出/受欺压/不受宠，所有人都看不起主角 |
| 识破阴谋 | 利用现代人的逻辑思维看穿宅斗套路 |
| 逐个击破 | 先清理小角色，再对付大Boss |
| 争取资源 | 从零开始积累人脉、财产、嫡母/父亲的好感 |

**章节剧情类型分配**：打脸爽文（35%）> 矛盾冲突（25%）> 日常铺垫（15%）> 感情戏（15%）> 高潮转折（10%）

#### 4.3 种田发家

**核心叙事机制**：技术升级 + 社区建设

| 要素 | 说明 |
|------|------|
| 现代农业/烹饪技术 | 引入改良种植法、新菜谱、食品加工技术 |
| 慢节奏生活建设 | 盖房→开荒→种地→养殖→开店→小有名气 |
| 社区信任 | 从被排斥的外来者到村里的大恩人 |
| 小事件累积 | 每解决一个小问题就前进一步，积少成多 |

**章节剧情类型分配**：日常铺垫（35%）> 感情戏（25%）> 打脸爽文（15%）> 矛盾冲突（15%）> 高潮转折（10%）

#### 4.4 经商致富

**核心叙事机制**：商业创新 + 竞争博弈

| 要素 | 说明 |
|------|------|
| 现代商业概念 | 品牌意识、饥饿营销、连锁经营、供应链管理 |
| 贸易路线 | 利用地域差价和信息差盈利 |
| 垄断与反垄断 | 占领市场 vs 被行会/权贵打压 |
| 以商入仕 | 商业成功带来政治资本，打破"士农工商"阶层壁垒 |

**章节剧情类型分配**：矛盾冲突（30%）> 日常铺垫（25%）> 打脸爽文（20%）> 高潮转折（15%）> 感情戏（10%）

#### 4.5 权谋争霸

**核心叙事机制**：战略规划 + 势力扩张

| 要素 | 说明 |
|------|------|
| 军事战略 | 排兵布阵、攻守兼备、以少胜多 |
| 朝堂博弈 | 拉拢文臣、制衡武将、分化敌对阵营 |
| 长线布局 | 十步之内有三步是为十步之后铺路 |
| 格局展现 | 从个人恩怨上升到家国天下 |

**章节剧情类型分配**：权谋博弈（35%）> 高潮转折（25%）> 矛盾冲突（20%）> 日常铺垫（10%）> 感情戏（10%）

#### 4.6 甜宠日常

**核心叙事机制**：关系推进 + 日常甜蜜

| 要素 | 说明 |
|------|------|
| 关系发展 | 每一章都有至少一个推进感情的关键互动 |
| 甜蜜日常 | 生活化场景中展现两人的默契和吸引力 |
| 误会与和解 | 小误会制造波折，但很快解开——甜宠文不宜长时间虐 |
| 外部助攻/阻碍 | 配角推动或阻碍感情发展，但不能成为主角 |

**章节剧情类型分配**：感情戏（40%）> 日常铺垫（30%）> 打脸爽文（15%）> 矛盾冲突（10%）> 高潮转折（5%）

#### 4.7 情感基调的子类型适配

不同子类型在各阶段常用的情感基调有所不同：

| 子类型 | 开局 | 中期 | 高潮 | 收尾 |
|-------|------|------|------|------|
| 宫斗 | 紧张刺激 | 悬疑烧脑 | 紧张刺激 | 温馨甜蜜 |
| 宅斗 | 愤怒解气 | 轻松愉快 | 愤怒解气 | 轻松愉快 |
| 种田 | 轻松愉快 | 温馨甜蜜 | 紧张刺激 | 温馨甜蜜 |
| 经商 | 轻松愉快 | 紧张刺激 | 愤怒解气 | 轻松愉快 |
| 权谋 | 悬疑烧脑 | 紧张刺激 | 紧张刺激 | 悬疑烧脑 |
| 甜宠 | 温馨甜蜜 | 温馨甜蜜 | 悲伤虐心 | 温馨甜蜜 |

---

### 五、感情线设计

#### 5.1 七种感情线类型的发展弧线

**一对一甜宠**
```
初见好感 → 互相试探 → 确认心意 → 甜蜜相处 → 小危机 → 更甜
```

**先婚后爱**
```
被迫结合 → 相互警惕 → 勉强合作 → 发现闪光点 → 不自觉关心 → 坦白心意
```

**破镜重圆**
```
前情回忆 → 重逢尴尬 → 误会加深 → 真相揭晓 → 互相谅解 → 重修旧好
```

**欢喜冤家**
```
初见不合 → 被迫同行 → 争吵中发现默契 → 嘴硬心软 → 危机中互助 → 不打不相识
```

**青梅竹马**
```
童年情谊 → 各自成长 → 重逢变化 → 关系微妙 → 意识到非友情 → 终成眷属
```

**日久生情**
```
普通相识 → 频繁接触 → 习惯彼此 → 分离后思念 → 意识到感情 → 自然表白
```

**无CP事业线**
```
独立奋斗 → 知己相伴 → 惺惺相惜 → 并肩作战 → 彼此成就 → 开放结局
```

#### 5.2 好感度变化的追踪

利用角色档案中的动态信息追踪好感度变化：

| 阶段 | 好感度关键词 | 触发事件类型 |
|------|------------|------------|
| 初遇 | 好奇/警惕/无感 | 第一次见面场景 |
| 萌芽 | 欣赏/在意/不自觉关注 | 某次意外互助/展示能力 |
| 确认 | 心动/吃醋/牵挂 | 离别/误会/危机事件 |
| 深化 | 信任/依赖/无条件支持 | 共同经历重大事件 |
| 圆满 | 默契/不可分离 | 终极危机后的携手 |

每当感情线有重大进展时，调用 `update_field_dynamic_info` 更新相关角色的好感度变化字段。

#### 5.3 先婚后爱的典型模式

先婚后爱是穿越文最常见也最受欢迎的感情线模式，因为它与穿越设定天然兼容：

**为什么契合穿越文**：
- 穿越者继承原身的婚约/婚姻——提供被迫接近的理由
- 原身可能不受丈夫/妻子待见——穿越后性情大变引起对方好奇
- 政治联姻是古代架空世界的常见设定——自然不做作

**发展节奏**：
- 前15%：冷淡疏离，各怀心思
- 15%-30%：一次合作事件打破坚冰
- 30%-50%：从合作伙伴变为互相在意的人
- 50%-70%：外部威胁推动两人更亲密
- 70%-90%：感情明确但面临重大考验
- 90%-100%：考验后的甜蜜结局

#### 5.4 感情线节奏原则

- **不要在前三章搞暧昧**——先建立主线冲突
- **用故事事件推动感情**——不是为了谈恋爱而谈恋爱
- **感情线的节奏要有呼吸感**——甜一阵、虐一阵、再甜
- **感情线的推进不能脱离主线**——最好的感情发展发生在共同解决危机的过程中

---

### 六、工具使用指南

#### 6.1 核心设定与金手指设定

使用 `update_setting` 分两次填写：

**第一次：填写核心设定**

选择以下字段值时参考第一节的组合建议：
- 穿越方式（从六个选项中选一个）
- 穿越身份（从七个选项中选一个）
- 主线剧情（从八个选项中选一个）
- 感情线（从七个选项中选一个）
- 故事基调（从五个选项中选一个）

**第二次：填写金手指设定**

参考第二节的金手指设计指南：
- 金手指类型（从八个选项中选一个）
- 能力描述（具体化，不要泛泛而谈）
- 使用限制（必须填写，否则金手指失去张力）
- 成长空间（与故事篇幅匹配的递进路径）
- 获得方式（与穿越方式保持一致）

#### 6.2 章节创建

使用 `create_chapter` 创建章节时，搭配以下字段：

| 章节位置 | 推荐剧情类型 | 推荐情感基调 |
|---------|------------|------------|
| 第一章 | 高潮转折 | 紧张刺激 |
| 第二章 | 日常铺垫 | 轻松愉快 |
| 第三章 | 打脸爽文 | 愤怒解气 |
| 后续章节 | 参考4.1-4.6的子类型分配 | 参考4.7的情感基调适配 |

**伏笔/回收字段**：
- 第一章埋设伏笔：原身的死因疑点、某个角色的异常反应
- 后续章节回收：揭示真相、反转设定

#### 6.3 动态信息更新

使用 `update_field_dynamic_info` 追踪以下变化：

| 追踪对象 | 追踪字段 | 更新时机 |
|---------|---------|---------|
| 重要角色 | 好感度变化 | 感情线有重大进展时 |
| 穿越者 | 金手指成长进度 | 能力升级事件后 |
| 关键阵营角色 | 立场变化 | 阵营关系发生重大转变时 |

---

### 七、常见陷阱

| 陷阱 | 问题 | 正确做法 |
|------|------|---------|
| **穿越即巅峰** | 第一章就展示全部能力 | 金手指首秀只展示10%，后续缓慢解锁 |
| **金手指无限制** | 空间无限大、预知无限准、武功天下第一 | 每种金手指都必须有明确的使用限制 |
| **信息倾倒** | 前两章用万字介绍世界观 | 信息随事件自然释出，每章只揭示必要的部分 |
| **原身工具人** | 原身只是一个壳，完全没有影响 | 原身的人际关系、恩怨、性格残留都应影响剧情 |
| **现代思维违和** | 主角言行举止太现代，在古代毫无违和 | 必须有"差点露馅"的桥段来制造张力 |
| **感情线突兀** | 才见面就互相心动 | 用共同经历推动感情，尊重"日久"的过程 |
| **反派脸谱化** | 反派就是纯恶、无脑使坏 | 给反派合理的动机和可信的行为逻辑 |
| **金手指与主线脱节** | 金手指是医术但主线是经商 | 金手指类型应与主线方向形成叙事共振 |',
  '## Transmigration Opening and Cheat Power Balance

This guide provides specialized writing instructions for the "Ancient Fantasy Transmigration Novel" (古代架空穿越小说) creation method, focusing on transmigration design and cheat power balance. Core focus: **how to design a compelling transmigration opening and how to make the cheat power give the protagonist an edge without destroying narrative tension**.

---

### I. Classic Combinations of Crossing Method x Identity x Main Plot

The three foundational choices in transmigration setup (Crossing Method, Crossing Identity, Main Plot) have natural compatibility. Below are proven high-synergy combinations.

#### 1.1 Palace Intrigue (宫斗夺嫡)

| Field | Recommended | Rationale |
|-------|------------|-----------|
| Crossing Method | Soul transmigration after accidental death | Inheriting memory fragments of the original body allows quick adaptation to the palace environment |
| Crossing Identity | Imperial royalty / Noble legitimate daughter | A sufficient political starting point is needed to participate in palace intrigue |
| Story Tone | Cerebral power play | The core appeal of palace intrigue is intellectual combat and information warfare |
| Romance Line | Marriage first, love later / Love grows over time | Political marriages are the most natural starting point for romance in palace intrigue |

**Crossing Detail Suggestion**: The original body died from palace conspiracy (poisoning/framing/accident), and the transmigrator must first resolve the original body''s leftover crisis—this is the first hook.

#### 1.2 Household Struggle (宅斗逆袭)

| Field | Recommended | Rationale |
|-------|------------|-----------|
| Crossing Method | Soul transmigration / Dream crossing | Soul transmigration inherits memories, useful for seeing through household schemes |
| Crossing Identity | Concubine-born child | Starting from the bottom maximizes the reversal potential |
| Story Tone | Light power-fantasy | The core satisfaction of household reversal is face-slapping and turning the tables |
| Romance Line | Bickering lovers / Childhood sweethearts | Matches the light, upbeat tone of household struggle |

**Crossing Detail Suggestion**: The original body was bullied to death by the legitimate sister/mother; the transmigrator brings modern independence and immediately breaks the doormat persona.

#### 1.3 Farming and Prosperity (种田发家)

| Field | Recommended | Rationale |
|-------|------------|-----------|
| Crossing Method | Any (touching an ancient artifact is especially fitting) | Farming stories have no strong constraint on crossing method |
| Crossing Identity | Commoner | Starting from zero and gradually improving life delivers maximum satisfaction |
| Story Tone | Warm and healing | The core charm of farming stories is slow-paced life-building |
| Romance Line | One-on-one sweet / Love grows over time | To match the warm tone, romance should not be overly tangled |

**Crossing Detail Suggestion**: Transmigrate to a remote village or during exile, with extremely scarce resources, highlighting the protagonist''s process of building from nothing using modern knowledge.

#### 1.4 Commerce and Wealth (经商致富)

| Field | Recommended | Rationale |
|-------|------------|-----------|
| Crossing Method | Soul transmigration after accidental death | Needs to inherit some of the original body''s social connections |
| Crossing Identity | Fallen noble / Commoner | Having status but no money, or freedom but no resources |
| Story Tone | Light power-fantasy / Passionate and inspiring | The core satisfaction of business warfare is winning against the odds |
| Romance Line | Marriage first, love later / Bickering lovers | Business cooperation naturally transitioning to romance |

**Crossing Detail Suggestion**: The original body was abandoned by relatives due to family decline; the transmigrator uses modern business thinking (branding, marketing, supply chains) to build from a small shop to a commercial empire.

#### 1.5 Sweet Romance Daily Life (甜宠日常)

| Field | Recommended | Rationale |
|-------|------------|-----------|
| Crossing Method | Any (dream crossing is the gentlest) | Sweet romance does not need an overly dramatic crossing method |
| Crossing Identity | Noble legitimate daughter/son | Sufficiently high status reduces survival pressure, making room for the romance line |
| Story Tone | Warm and healing | The core of sweet romance is sweetness, not suffering |
| Romance Line | One-on-one sweet / Childhood sweethearts | The romance line IS the core |

**Crossing Detail Suggestion**: Transmigrate to a peaceful era before major conflicts, with complementary male/female lead identities; daily interactions form the main body of the story.

#### 1.6 Revenge (复仇虐渣)

| Field | Recommended | Rationale |
|-------|------------|-----------|
| Crossing Method | Soul transmigration after accidental death | The original body was killed; the transmigrator carries anger and information advantage for revenge |
| Crossing Identity | Concubine-born child / Fallen noble | An oppressed identity provides the standing and motivation for revenge |
| Story Tone | Emotionally nuanced / Light power-fantasy | Nuanced leans into emotional depth; power-fantasy leans into fast-paced face-slapping |
| Romance Line | Reunion after breakup / Love grows over time | Meeting someone who understands you during the revenge journey |

#### 1.7 Political Supremacy (权谋争霸)

| Field | Recommended | Rationale |
|-------|------------|-----------|
| Crossing Method | Summoned by mysterious force / Lightning strike | Fate-infused crossing methods match the grand narrative |
| Crossing Identity | Imperial royalty / Martial world figure | An entry ticket to power games is required |
| Story Tone | Cerebral power play / Passionate and inspiring | The core of supremacy stories is strategic planning and vision |
| Romance Line | No-CP career line / Marriage first, love later | Career comes first, romance is secondary |

#### 1.8 How to Fill Core Settings

When calling `update_setting` to fill "Core Settings" (核心设定), all fields should form a unified narrative tone:

- **Crossing Method** and **Crossing Identity** determine the protagonist''s starting point
- **Main Plot** determines the direction of the story''s core conflict
- **Romance Line** type should match the main plot''s pacing—power play lines should not pair with sweet romance; farming lines should not pair with agonizing love
- **Story Tone** is the emotional foundation of the entire novel; all choices should harmonize with it

---

### II. Cheat Power Design and Limitation Balance

The cheat power (金手指) is the core competitive advantage of transmigration fiction. Design principle: **the cheat power solves 30% of problems; the protagonist''s own effort solves 70%**.

#### 2.1 Detailed Guide to Eight Cheat Power Types

**Spatial Storage (空间/储物能力)**

| Dimension | Description |
|-----------|-------------|
| Best paired with | Farming, Commerce |
| Ability Description | Possesses an independent space for storing items; time is frozen inside (food does not spoil) |
| Usage Limitation | Initial capacity is very small (e.g., one cubic meter); expands slowly through specific conditions |
| Growth Path | Capacity increases in stages; later unlocks temperature control, living creature storage, etc. |
| Acquisition Method | Comes with transmigration / Activated by touching a special jade pendant or ring |

**Medical/Poison Arts (医术/毒术)**

| Dimension | Description |
|-----------|-------------|
| Best paired with | Palace Intrigue, Household Struggle, Political Supremacy |
| Ability Description | Carries modern medical knowledge or receives a divine doctor''s legacy; can treat diseases untreatable in ancient times |
| Usage Limitation | Lacks modern drugs and equipment; must find ancient substitute herbs; rare ingredients are extremely hard to obtain |
| Growth Path | Basic first aid -> Common illness treatment -> Difficult cases -> Poison arts/detoxification -> Developing new medicines |
| Acquisition Method | Was a medical student/doctor in previous life / Received a medical tome during transmigration |

**Foresight/Mind Reading (预知未来/读心)**

| Dimension | Description |
|-----------|-------------|
| Best paired with | Palace Intrigue, Political Supremacy |
| Ability Description | Can foresee short-term future fragments or perceive others'' current thoughts |
| Usage Limitation | Foresight fragments are blurry and incomplete; mind reading causes severe headaches; daily usage is capped |
| Growth Path | Foresight timeline extends and clarity improves; mind reading range expands but side effects worsen |
| Acquisition Method | Comes with transmigration / Activated by touching a mysterious artifact |

**System Assist (系统辅助)**

| Dimension | Description |
|-----------|-------------|
| Best paired with | Any main plot (the most versatile cheat power type) |
| Ability Description | Has a task system; completing tasks earns points; points are exchanged for skills/items/information |
| Usage Limitation | Tasks have time limits and difficulty gradients; point acquisition rate is limited; high-tier rewards are expensive |
| Growth Path | System functions unlock progressively (shop -> lottery -> dungeon -> special missions) |
| Acquisition Method | Bound at transmigration / Activated after meeting special trigger conditions |

**Past-Life Memory (前世记忆/历史知识)**

| Dimension | Description |
|-----------|-------------|
| Best paired with | Farming, Commerce, Political Supremacy |
| Ability Description | Carries the knowledge system of the modern world: technology, history, economics, agricultural techniques, etc. |
| Usage Limitation | Memories gradually fade over time; much modern knowledge cannot be directly applied to ancient settings |
| Growth Path | Simple knowledge application -> Complex technical improvements -> Systematically transforming a field |
| Acquisition Method | Naturally carried (the most realistic and plausible cheat power type) |

**Martial Arts/Inner Force (武功/内力)**

| Dimension | Description |
|-----------|-------------|
| Best paired with | Martial World, Political Supremacy |
| Ability Description | Gains a special martial arts manual or internal energy foundation after transmigration |
| Usage Limitation | Requires extensive training time; impossible to become a master overnight |
| Growth Path | Basic footwork -> Internal energy circulation -> Signature techniques -> Grandmaster realm |
| Acquisition Method | Transmigrated into a martial family / Accidentally obtained a secret manual / Born with exceptional physical talent |

**No Cheat Power (纯智商)**

| Dimension | Description |
|-----------|-------------|
| Best paired with | Palace Intrigue, Household Struggle, Political Supremacy |
| Ability Description | No reliance on any supernatural ability; relies purely on modern thinking patterns and knowledge reserves |
| Usage Limitation | No supernatural safety net; every step requires precise calculation and interpersonal maneuvering |
| Growth Path | Reactive coping -> Proactive strategizing -> Orchestrating the big picture |
| Acquisition Method | No special acquisition needed—this is hardcore mode |

**Other (Custom)**

For original cheat powers not covered above, such as: universal growth enhancement, animal communication, appearance transformation, etc.

#### 2.2 Design Principles for Usage Limitations

Usage limitations are the most critical part of cheat power design—**a cheat power without limitations equals a Mary Sue**.

Three dimensions of limitations:

| Dimension | Description | Example |
|-----------|-------------|---------|
| **Physical** | Conditions of use, cooldown, stamina cost | Space can only be opened three times per day; splitting headache after mind reading |
| **Resource** | Requires consuming scarce materials | Medical arts need rare herbs; system needs points |
| **Consequence** | Negative effects after use | Foresight shortens lifespan; overusing martial arts damages meridians |

**Core validation test**: If you remove the cheat power, can the protagonist still slowly advance the story through wit and effort? If yes, the cheat power is correctly positioned—it is an accelerator, not a skeleton key.

#### 2.3 Progressive Growth Path Design

Growth Path lets the cheat power level up in sync with story development, maintaining ongoing freshness:

```
Early stage (first 20%): Cheat power provides a small but crucial edge
   -> Space is only one cubic meter, but enough to hide a few packs of seeds
Mid stage (20%-60%): Ability gradually strengthens, but challenges scale up in parallel
   -> Space expands to ten cubic meters, but the business to manage is also larger
Late stage (60%-90%): Ability nears its peak, but opponents/dilemmas are also at their strongest
   -> Space reaches a hundred cubic meters, but the court begins noticing the protagonist''s anomalies
Finale (90%-100%): Cheat power plays a decisive role in the final moment
   -> In a desperate situation, the space breaks its limit for the ultimate reversal
```

#### 2.4 Synergy Between Cheat Power and Main Plot

The cheat power type should resonate narratively with the main plot:

| Main Plot | Recommended Cheat Power | Synergy Logic |
|-----------|------------------------|---------------|
| Palace Intrigue | Foresight / Mind Reading / Medical Arts | Information is the greatest weapon in palace politics |
| Household Struggle | Medical Arts / System / No Cheat Power | Earning your way up step by step is more convincing |
| Farming | Spatial Storage / Past-Life Memory | Space stores seeds; agricultural knowledge converts directly to value |
| Commerce | Past-Life Memory / Space / System | Modern business knowledge is the most practical commercial cheat power |
| Political Supremacy | Martial Arts / Foresight / Past-Life Memory | Supremacy requires both literary and martial prowess |
| Sweet Romance | Any (lightweight) | The cheat power should not overshadow the romance |
| Martial World | Martial Arts / Medical Arts | The martial world builds relationships through combat and life-saving |
| Revenge | Medical/Poison Arts / Mind Reading | Understanding the enemy''s weaknesses is a prerequisite for revenge |

---

### III. First Three Chapters Design

The first three chapters determine whether readers continue. Each chapter has a clear narrative mission.

#### 3.1 Chapter 1: Transmigration (Plot Type = Climactic Twist)

**Narrative Mission**: Complete the transmigration, establish an immediate crisis, hook the reader.

**Structure Template**:

1. **The Transmigration Moment** (500-800 words)
   - Concisely convey the crossing method (do not spend excessive space reminiscing about the past life)
   - Quickly confirm the fact: "I have transmigrated"

2. **The First Scene After Awakening** (800-1200 words)
   - Build the ancient setting through five senses (smell, sound, touch, sight)
   - Embed identity clues in environmental description (clothing, room furnishings, how others address you)

3. **Immediate Crisis** (1000-1500 words)
   - An emergency left by the original body: someone comes to accuse/poison/evict/confiscate
   - The protagonist must respond while knowing almost nothing—this is the core tension of transmigration fiction

**Chapter 1 Emotional Tone**: Tense and thrilling

**Key Principles**:
- Do not use lengthy internal monologues to explain the transmigration—readers already know this is a transmigration novel
- Chapter 1 must end with a cliffhanger or an impending greater crisis
- Do not reveal all key information from the Past-Life Memory field in Chapter 1

#### 3.2 Chapter 2: Identity Discovery (Plot Type = Daily Buildup)

**Narrative Mission**: Figure out "who am I," map interpersonal relationships, discover potential threats.

**Structure Template**:

1. **Information Gathering** (800-1000 words)
   - The protagonist gathers information through conversations with maids/servants/family
   - Uses "just recovered from illness / lost memory from shock" as cover for not knowing about oneself

2. **Character Relationship Web** (1000-1500 words)
   - Introduce 3-5 key characters: allies, enemies, romantic interests
   - Establish each character with one or two vivid impressions

3. **Situation Analysis** (500-800 words)
   - The protagonist uses modern analytical thinking to assess the current situation
   - Identifies the greatest threat and possible leverage points

**Chapter 2 Emotional Tone**: Light and relaxed (give readers a breather after the tense Chapter 1)

**Key Principles**:
- Information delivery must be restrained—do not dump all worldbuilding at once
- Convey information through character interactions, not direct exposition
- Chapter 2''s ending should hint at the first small conflict to come

#### 3.3 Chapter 3: Cheat Power Debut (Plot Type = Satisfying Face-Slap)

**Narrative Mission**: Demonstrate what makes the protagonist different, first use of the cheat power, deliver the first satisfaction moment.

**Structure Template**:

1. **Conflict Trigger** (500-800 words)
   - Someone provokes/bullies/schemes against the protagonist
   - The original body''s personality would have endured silently or been helpless

2. **Cheat Power Intervention** (800-1200 words)
   - The protagonist uses the cheat power or modern knowledge to resolve the crisis
   - The demonstration should be clever—not outright showing off, but "happening" to solve the problem
   - Make observers (and readers) think: "This person is not ordinary"

3. **Reactions and Aftermath** (500-800 words)
   - The provoker''s surprise or anger
   - Observers'' reassessment
   - The protagonist''s initial understanding and usage plans for the cheat power

**Chapter 3 Emotional Tone**: Angry and cathartic

**Key Principles**:
- The cheat power debut should not be overpowering—leave room for future upgrades
- The crisis resolution should demonstrate intelligence, not pure cheat-power steamrolling
- Chapter 3''s ending should establish a bigger goal or a stronger antagonist

#### 3.4 Utilizing the Past-Life Memory Field

The "Past-Life Memory" (前世记忆) field in the character archive is exclusive to the transmigrator and should be gradually revealed across the opening three chapters:

| Stage | Past-Life Memory Content | Narrative Use |
|-------|-------------------------|---------------|
| Chapter 1 | Professional skills (medicine, cooking, engineering) | Explains why the protagonist has abilities beyond the era |
| Chapter 2 | Fragments of historical knowledge | Helps the protagonist assess what era and situation they are in |
| Chapter 3 | Practical life skills | First demonstration of modern knowledge applied in an ancient setting |

**Note**: Past-life memories should gradually fade—the more details are used, the fewer remain, forcing the protagonist to develop their own abilities.

---

### IV. Narrative Essentials for Each Subtype

Different main plots have different narrative rhythms and focal points.

#### 4.1 Palace Intrigue (宫斗夺嫡)

**Core Narrative Mechanism**: Information asymmetry + Alliance dynamics

| Element | Description |
|---------|-------------|
| Political Alliances | Who is an ally, who is a pawn, who is a mole—alliances shift with interests |
| Information Warfare | Whoever controls more information has the upper hand; stealing, spreading, and concealing information are core tactics |
| Emotional Manipulation | Exploiting emotional weaknesses to attack opponents: feigning goodwill, sowing discord among confidants, creating misunderstandings |
| Step-by-Step Strategy | Every move is part of a plan; every show of weakness is bait |

**Chapter Plot Type Distribution**: Political intrigue (40%) > Romance (20%) > Conflict (20%) > Climactic twist (15%) > Daily buildup (5%)

#### 4.2 Household Struggle (宅斗逆袭)

**Core Narrative Mechanism**: Identity reversal + Progressive revelation

| Element | Description |
|---------|-------------|
| Low Starting Point | Concubine-born / oppressed / unfavored—everyone looks down on the protagonist |
| Scheme Detection | Using modern logic to see through household intrigue tactics |
| Defeat Them One by One | Clear out minor antagonists first, then take on the final boss |
| Resource Acquisition | Accumulate connections, property, and favor from the head of family from scratch |

**Chapter Plot Type Distribution**: Face-slap satisfaction (35%) > Conflict (25%) > Daily buildup (15%) > Romance (15%) > Climactic twist (10%)

#### 4.3 Farming and Prosperity (种田发家)

**Core Narrative Mechanism**: Technology upgrade + Community building

| Element | Description |
|---------|-------------|
| Modern Agriculture/Cooking | Introducing improved planting methods, new recipes, food processing techniques |
| Slow-Paced Life Building | Build a house -> Clear land -> Farm -> Raise livestock -> Open a shop -> Gain local fame |
| Community Trust | From rejected outsider to the village''s benefactor |
| Small Events Accumulate | Solving each small problem means one step forward; many small wins make big progress |

**Chapter Plot Type Distribution**: Daily buildup (35%) > Romance (25%) > Face-slap satisfaction (15%) > Conflict (15%) > Climactic twist (10%)

#### 4.4 Commerce and Wealth (经商致富)

**Core Narrative Mechanism**: Business innovation + Competitive strategy

| Element | Description |
|---------|-------------|
| Modern Business Concepts | Brand awareness, scarcity marketing, chain operations, supply chain management |
| Trade Routes | Profiting from regional price differences and information asymmetry |
| Monopoly and Anti-Monopoly | Capturing markets vs. being suppressed by guilds/nobles |
| Commerce to Politics | Commercial success brings political capital, breaking the "scholar-farmer-artisan-merchant" class barriers |

**Chapter Plot Type Distribution**: Conflict (30%) > Daily buildup (25%) > Face-slap satisfaction (20%) > Climactic twist (15%) > Romance (10%)

#### 4.5 Political Supremacy (权谋争霸)

**Core Narrative Mechanism**: Strategic planning + Power expansion

| Element | Description |
|---------|-------------|
| Military Strategy | Troop deployment, balanced offense and defense, winning against superior numbers |
| Court Politics | Recruiting civil officials, balancing military generals, dividing enemy factions |
| Long-Term Planning | Three of the next ten moves are laying groundwork for ten moves later |
| Grand Vision | Elevating from personal grievances to the fate of the nation |

**Chapter Plot Type Distribution**: Political intrigue (35%) > Climactic twist (25%) > Conflict (20%) > Daily buildup (10%) > Romance (10%)

#### 4.6 Sweet Romance Daily Life (甜宠日常)

**Core Narrative Mechanism**: Relationship progression + Daily sweetness

| Element | Description |
|---------|-------------|
| Relationship Development | Every chapter has at least one key interaction advancing the romance |
| Sweet Daily Life | Showcasing the pair''s chemistry and attraction through everyday scenarios |
| Misunderstandings and Reconciliation | Small misunderstandings create bumps, but are quickly resolved—sweet romance should not sustain prolonged suffering |
| External Help/Hindrance | Supporting characters facilitate or obstruct romance development but should not become the focus |

**Chapter Plot Type Distribution**: Romance (40%) > Daily buildup (30%) > Face-slap satisfaction (15%) > Conflict (10%) > Climactic twist (5%)

#### 4.7 Emotional Tone by Subtype and Phase

Different subtypes commonly use different emotional tones at various stages:

| Subtype | Opening | Mid-Story | Climax | Resolution |
|---------|---------|-----------|--------|------------|
| Palace Intrigue | Tense & thrilling | Suspenseful & cerebral | Tense & thrilling | Warm & sweet |
| Household Struggle | Angry & cathartic | Light & relaxed | Angry & cathartic | Light & relaxed |
| Farming | Light & relaxed | Warm & sweet | Tense & thrilling | Warm & sweet |
| Commerce | Light & relaxed | Tense & thrilling | Angry & cathartic | Light & relaxed |
| Political Supremacy | Suspenseful & cerebral | Tense & thrilling | Tense & thrilling | Suspenseful & cerebral |
| Sweet Romance | Warm & sweet | Warm & sweet | Sad & heartbreaking | Warm & sweet |

---

### V. Romance Line Design

#### 5.1 Development Arcs for Seven Romance Types

**One-on-One Sweet**
```
Initial attraction -> Mutual probing -> Confirming feelings -> Sweet togetherness -> Small crisis -> Even sweeter
```

**Marriage First, Love Later**
```
Forced union -> Mutual wariness -> Reluctant cooperation -> Discovering virtues -> Unconscious caring -> Confessing feelings
```

**Reunion After Breakup**
```
Past recalled -> Awkward reunion -> Deepening misunderstanding -> Truth revealed -> Mutual forgiveness -> Renewed bond
```

**Bickering Lovers**
```
Poor first impression -> Forced companionship -> Finding chemistry amid arguments -> Tough talk, soft heart -> Helping each other in crisis -> From enemies to lovers
```

**Childhood Sweethearts**
```
Childhood bond -> Growing up apart -> Changed reunion -> Shifting dynamics -> Realizing it is more than friendship -> Finally together
```

**Love Grows Over Time**
```
Ordinary acquaintance -> Frequent contact -> Getting used to each other -> Missing each other when apart -> Recognizing feelings -> Natural confession
```

**No-CP Career Line**
```
Independent striving -> Kindred spirit companionship -> Mutual admiration -> Fighting side by side -> Mutual achievement -> Open ending
```

#### 5.2 Tracking Favorability Changes

Use dynamic information in character archives to track favorability changes:

| Stage | Favorability Keywords | Triggering Event Type |
|-------|----------------------|----------------------|
| First Meeting | Curious / Guarded / Indifferent | First encounter scene |
| Sprouting | Admiration / Attentiveness / Unconscious notice | An unexpected act of help / Ability demonstration |
| Confirmation | Heart flutter / Jealousy / Worry | Parting / Misunderstanding / Crisis event |
| Deepening | Trust / Reliance / Unconditional support | Sharing a major ordeal together |
| Fulfillment | Perfect understanding / Inseparable | After the ultimate crisis, walking forward together |

Whenever the romance line has significant progress, call `update_field_dynamic_info` to update the favorability change field on the relevant characters.

#### 5.3 The "Marriage First, Love Later" Pattern

Marriage first, love later is the most common and popular romance pattern in transmigration fiction because it is naturally compatible with the transmigration setup:

**Why it fits transmigration fiction**:
- The transmigrator inherits the original body''s betrothal/marriage—providing a reason for forced proximity
- The original body may not have been favored by the spouse—the transmigrator''s changed temperament piques the other party''s curiosity
- Political marriages are a common setting in ancient fantasy worlds—natural and unforced

**Development Pacing**:
- First 15%: Cold and distant, each with their own agenda
- 15%-30%: A cooperative event breaks the ice
- 30%-50%: From partners to people who care about each other
- 50%-70%: External threats push them closer
- 70%-90%: Feelings are clear but face a major trial
- 90%-100%: Sweet ending after the trial

#### 5.4 Romance Pacing Principles

- **Do not create romantic tension in the first three chapters**—establish the main conflict first
- **Let story events drive the romance**—the romance should not exist in a vacuum
- **Romance pacing needs breathing room**—sweet phases, angsty phases, then sweet again
- **Romance progression must not detach from the main plot**—the best romantic development happens while jointly resolving crises

---

### VI. Tool Usage Guide

#### 6.1 Core Settings and Cheat Power Settings

Use `update_setting` twice:

**First call: Fill Core Settings (核心设定)**

Reference Section I combination recommendations when choosing:
- Crossing Method (select from six options)
- Crossing Identity (select from seven options)
- Main Plot (select from eight options)
- Romance Line (select from seven options)
- Story Tone (select from five options)

**Second call: Fill Cheat Power Settings (金手指)**

Reference Section II cheat power design guide:
- Cheat Power Type (select from eight options)
- Ability Description (be specific, avoid vague generalities)
- Usage Limitation (must be filled—without it, the cheat power loses tension)
- Growth Path (a progressive path matching the story''s length)
- Acquisition Method (must be consistent with the crossing method)

#### 6.2 Chapter Creation

When using `create_chapter` to create chapters, pair with these fields:

| Chapter Position | Recommended Plot Type | Recommended Emotional Tone |
|-----------------|----------------------|---------------------------|
| Chapter 1 | Climactic Twist | Tense & Thrilling |
| Chapter 2 | Daily Buildup | Light & Relaxed |
| Chapter 3 | Satisfying Face-Slap | Angry & Cathartic |
| Subsequent chapters | Reference subtype distributions in 4.1-4.6 | Reference emotional tone matching in 4.7 |

**Foreshadow/Resolution field**:
- Plant in Chapter 1: Suspicious details about the original body''s death, a character''s abnormal reaction
- Resolve in later chapters: Reveal truth, reverse expectations

#### 6.3 Dynamic Information Updates

Use `update_field_dynamic_info` to track the following changes:

| Tracking Target | Tracked Field | Update Timing |
|----------------|---------------|---------------|
| Important characters | Favorability changes | When the romance line has significant progress |
| Transmigrator | Cheat power growth progress | After an ability upgrade event |
| Key aligned characters | Stance changes | When factional relationships undergo major shifts |

---

### VII. Common Pitfalls

| Pitfall | Problem | Correct Approach |
|---------|---------|-----------------|
| **Peak at transmigration** | Revealing all abilities in Chapter 1 | The cheat power debut shows only 10%; unlock the rest gradually |
| **Unlimited cheat power** | Infinite space, perfect foresight, invincible martial arts | Every cheat power must have explicit usage limitations |
| **Information dumping** | Spending ten thousand words on worldbuilding in the first two chapters | Release information naturally through events; reveal only what is necessary per chapter |
| **Original body as empty shell** | The original body is just a vessel with zero story impact | The original body''s relationships, grudges, and personality residue should all influence the plot |
| **Anachronistic behavior** | The protagonist acts and speaks too modern, without any friction in the ancient setting | There must be "almost blew my cover" moments to create tension |
| **Abrupt romance** | Mutual attraction from the first meeting | Use shared experiences to drive romance; respect the "over time" process |
| **Cardboard antagonists** | Villains are purely evil, mindlessly scheming | Give antagonists reasonable motivations and credible behavioral logic |
| **Cheat power disconnected from main plot** | Cheat power is medical arts but the main plot is commerce | The cheat power type should resonate narratively with the main plot direction |',
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
