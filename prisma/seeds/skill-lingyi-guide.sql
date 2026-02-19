-- 民间灵异故事创作指南 Skill / Chinese Folk Horror Guide Skill
-- novel_creation_method_id = 民间灵异故事创作
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-lingyi-guide.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'lingyi-guide',
  '民间灵异故事创作指南：涵盖中式民间恐怖类型特征、世界设定与风水体系构建、角色生命周期与超自然属性设计、五幕恐惧递进叙事结构、恐惧曲线分层设计、民俗禁忌写作技法、以及常见陷阱规避',
  'Chinese folk horror guide: covers genre characteristics of Chinese folk supernatural horror, world setting and feng shui system construction, character lifecycle and supernatural attribute design, five-act fear escalation narrative structure, layered fear curve design, folk taboo writing techniques, and common pitfall avoidance',
  '## 民间灵异故事创作指南

本指南专为「民间灵异故事创作」方法设计。该类型的核心是：以中国民间信仰、风水玄学、因果报应为基底，通过日常场景的异化和民俗禁忌的触犯，营造「就在身边」的深层恐惧体验。

---

### 一、类型特征与核心美学

#### 1.1 什么是民间灵异

民间灵异是根植于中国本土文化的恐怖叙事。它不依赖血腥或视觉冲击，而是通过「禁忌」「因果」「仪式」三大元素，在日常生活的裂缝中制造令人脊背发凉的恐怖感。

| 核心要素 | 说明 |
|---------|------|
| **民俗禁忌** | 世代相传的规矩，打破则必遭报应 |
| **因果业力** | 一切灵异事件都有前因，因果报应是底层逻辑 |
| **风水玄学** | 地理格局影响阴阳平衡，是灵异滋生的温床 |
| **民间术法** | 出马仙、风水师、缝尸人等民间手艺人的超自然能力 |
| **鬼怪生态** | 厉鬼、精怪、大仙家（狐黄白柳灰）等非人存在 |

#### 1.2 民间灵异 vs 其他恐怖类型

| 对比维度 | 中式民间灵异 | 西方恐怖 | 日式怪谈 |
|---------|------------|---------|---------|
| 恐怖来源 | 因果报应+禁忌触犯 | 未知怪物+生存威胁 | 日常异化+心理扭曲 |
| 核心美学 | 「天道有序，犯则必惩」 | 「人类面对未知的渺小」 | 「日常表象下的深渊」 |
| 鬼怪逻辑 | 有因有果，遵循规则 | 纯粹的恶或混沌 | 怨念执着，重复循环 |
| 化解方式 | 术法对抗+了却因果 | 消灭/逃离 | 理解/共情/牺牲 |
| 恐惧层次 | 文化认同层（「我奶奶说过」） | 生理层（视觉冲击） | 心理层（不安感） |
| 典型场景 | 荒村、义庄、老宅、坟地 | 废弃医院、森林小屋 | 学校、公寓、电车 |

#### 1.3 读者核心期待

- **文化共鸣**：「我小时候听过类似的故事」，唤起集体记忆中的恐惧
- **规则探索**：发现并理解灵异世界的运行规则（哪些事不能做、为什么不能做）
- **因果揭示**：层层剥开，最终揭露一切灵异背后令人唏嘘的真相
- **术士对决**：民间手艺人用术法与鬼怪斗智斗勇的精彩博弈
- **脊背发凉**：不是被吓一跳，而是看完后夜里不敢关灯的持续恐惧

---

### 二、世界设定填写指南

「世界」是本创作方法最核心的 setting 类型（singleton），包含 8 个关键字段。每个字段都直接影响灵异故事的底层逻辑。

#### 2.1 世界名称

通常是一个具象的地点或代称。好的世界名称自带恐怖氛围：

| 类型 | 示例 | 效果 |
|------|------|------|
| 真实地名风格 | 「封门村」「九龙城寨」 | 真实感强，暗示「这可能是真事」 |
| 地理特征风格 | 「湘西迷雾」「三岔口」 | 自带地域文化色彩 |
| 时代+地域 | 「九十年代的东北老林」 | 时代感+地域感的双重代入 |

**避免**：过于抽象或文艺的名字（如「幽冥之境」），民间灵异需要接地气。

#### 2.2 地理与风水格局

这是本类型的核心字段。不仅要描述地理位置，更要从风水玄学角度解释灵异为何滋生。

**填写框架**：
```
地理位置（XX省XX地区的XX村/镇/城区）
+ 风水特征（聚阴地/绝户地/三山夹一水/穿堂煞等）
+ 灵异成因（为什么这种格局会导致灵异事件）
```

**示例**：
- 「坐落在太行山深处的一个三面环山的盆地村落。村后是一座无名荒山，山上有一片十年不见阳光的阴松林。整个村子的格局是典型的''聚阴盆''——三面高山遮挡阳光，只有西面一个狭窄的出口，且出口正对一条干涸的古河道。风水上说这叫''阴气入，阳气不出''，是滋养阴物的天然温床。」

**常用风水术语**：
- 聚阴地、绝户地、三山夹一水
- 穿堂煞、门前种桑后种柳
- 坐南朝北背阴地、三岔路口
- 龙脉断裂、水口不收

#### 2.3 时代与社会背景

时代选择直接影响恐怖氛围的营造方式。需要包含三个维度：

| 维度 | 说明 | 示例 |
|------|------|------|
| 时代特征 | 故事发生的年代 | 民国乱世、80年代改革开放前、现代都市 |
| 宗族势力 | 当地的家族控制程度 | 「整个村子都姓赵，族长说了算」 |
| 迷信程度 | 人们对超自然的信仰水平 | 「家家供奉土地爷，红白喜事必请道士」 |

**最佳恐怖时代**：
- **八九十年代农村**：信息封闭、宗族势力强、迷信氛围浓，是民间灵异的黄金时代背景
- **民国时期**：军阀混战+封建残余，适合写「大户人家的诅咒」类故事
- **现代都市**：反差最强——高楼大厦与古老禁忌的碰撞

#### 2.4 核心禁忌与规则

这是灵异故事的「法律」，是整个叙事的基石。好的禁忌规则应该：

1. **具体明确**：不是「不能做坏事」，而是「天黑后走路不能回头」
2. **有内在逻辑**：禁忌背后有原因（回头会让鬼看到你的脸）
3. **容易被打破**：人物出于好奇/无知/贪婪会自然违反
4. **后果严重**：违反后的惩罚是推动剧情的核心动力

**示例**：
- 「每年七月半，村里人不出门、不点灯、不说话。如果听到有人叫你名字，绝对不能答应。」
- 「村口那棵老槐树下埋着东西，谁挖谁死。三代人都知道这个规矩。」
- 「老赵家的祠堂里有一口棺材，每七年必须换一个童子守棺。守棺人不能哭、不能笑、不能睡着。」

#### 2.5 玄学/职业体系

描述这个世界中与灵异对抗的「专业人士」。关键是他们使用力量的「代价」。

| 职业 | 能力特征 | 代价 |
|------|---------|------|
| 出马仙 | 请神上身，借仙家之力驱邪 | 五弊三缺（鳏寡孤独残+钱命权） |
| 风水师 | 观龙脉、定穴位、布局化煞 | 泄露天机折寿 |
| 缝尸人 | 处理非正常死亡的尸体 | 沾染死气，阳寿渐短 |
| 赶尸人 | 引领亡魂归乡 | 不能沾活人气 |
| 扎纸人 | 制作纸扎法器、纸人 | 久而久之分不清阴阳 |

**关键提示**：民间灵异中的术士不是超级英雄。他们也会怕、也会犹豫、也会失手。力量越大，付出的代价越沉重——这就是「五弊三缺」的核心精神。

#### 2.6 灵异生态

描述鬼怪的形式和等级。中式灵异的鬼怪有其独特的分类体系：

| 类型 | 特征 | 来源 |
|------|------|------|
| 怨灵/厉鬼 | 因怨气不散化为的恶灵 | 横死、冤死、含恨而死 |
| 大仙家 | 狐（狐仙）、黄（黄鼠狼）、白（刺猬）、柳（蛇）、灰（老鼠） | 修炼成精的动物 |
| 僵尸 | 实体化的不死尸体 | 尸变、风水邪地 |
| 祟 | 概念性的灾祸/诅咒 | 因果业力的具象化 |
| 替死鬼 | 需要找替身才能投胎的鬼魂 | 非正常死亡 |

#### 2.7 民俗仪式

仪式感是恐怖氛围的主要来源。描述故事中特殊的民俗仪式：

**常见仪式素材**：
- 冥婚（给死人办婚事）
- 打生桩（建筑地基下活埋人/物以镇压）
- 请神/送神仪式
- 特殊的葬礼习俗（停灵、守夜、烧路引）
- 开坛作法（设坛驱邪）
- 还阴债（偿还前世欠下的债务）

**仪式设计要点**：每个仪式都必须有严格的步骤和禁忌，任何一步出错都可能导致灾难。

#### 2.8 供奉与交易物

描述人与鬼、人与术士之间的「流通货币」：

| 交易对象 | 流通物 | 说明 |
|---------|--------|------|
| 人→鬼/仙家 | 香火、供品、冥币 | 供奉以求平安或庇佑 |
| 人→术士 | 金钱、人情 | 术士也要生活，有些是为现实所迫 |
| 鬼→人 | 寿命、阴德 | 被索取或交换 |
| 术士→鬼 | 超度、安置 | 了却因果，各得其所 |
| 骗子→人 | 恐惧、金钱 | 利用迷信行骗，也是故事的常见元素 |

---

### 三、其他设定类型

#### 3.1 小说梗概

「小说梗概」是 singleton 类型的 setting，只有一个「故事梗概」字段。

**填写要点**：
- 用 300-500 字概括整个故事的起因、经过、高潮、结局
- 必须点明核心灵异事件和因果关系
- 包含主要角色的命运走向

**模板**：
```
[时间地点] + [触发事件] + [主角卷入方式]
→ [初步调查/经历] + [发现的禁忌和规则]
→ [真相逐步揭露] + [因果链条浮现]
→ [最终对抗/化解] + [结局与余韵]
```

#### 3.2 故事钩子

「故事钩子」包含 4 个字段，用于定义故事的核心吸引力：

| 字段 | 作用 | 示例 |
|------|------|------|
| 故事钩子 | 一句话概括最令人脊背发凉的设定 | 「村里每家每户的门框上都刻着同一个人的名字」 |
| 核心卖点 | 读者为什么要看这个灵异故事 | 「东北出马仙实录风格+真实民俗考据」 |
| 开篇悬念 | 开头设置的悬念 | 「村里为什么没有老人？那口井为什么要用石板封住？」 |
| 读者期待 | 读者期待看到什么 | 「因果链揭露、术士对决、民俗仪式场景」 |

**钩子设计原则**：
- 最好的钩子是「日常中的异常」——越平常的事物出现不该有的变化，越令人恐惧
- 避免一上来就是「鬼」——暗示比明示更恐怖

#### 3.3 文风设定

「文风设定」定义整体写作风格，包含叙事视角、语言风格、整体基调、句式节奏、词汇水平等。

**民间灵异推荐搭配**：

| 字段 | 推荐选项 | 理由 |
|------|---------|------|
| 叙事视角 | 第一人称 或 第三人称限知 | 限制信息量，强化未知恐惧 |
| 语言风格 | 白话 或 口语化 | 民间故事的「讲述感」 |
| 整体基调 | 悬疑 或 黑暗 | 灵异故事的基本色调 |
| 句式节奏 | 短句为主 + 简单句式 | 恐怖场景需要短促有力 |
| 词汇水平 | 简单易懂 或 适中 | 接地气，避免过于文学化 |
| 节奏控制 | 节奏多变 | 铺垫时慢，惊吓时快 |

**特殊规则建议**：
- 「恐怖场景不超过 200 字的连续描写，留白比描写更有效」
- 「对话中适当使用方言词汇增强地域真实感」
- 「鬼怪出场永远不正面描写全貌，只描写局部特征」

---

### 四、角色设计

民间灵异的角色设计有其独特的生命周期系统和超自然属性。

#### 4.1 生命周期系统

灵异故事的死亡率极高。「生命周期」字段决定了角色在故事中的存活预期：

| 生命周期 | 含义 | 叙事作用 |
|---------|------|---------|
| 长期（幸存者/核心BOSS） | 贯穿全书的核心角色 | 承载主线剧情，是读者持续关注的对象 |
| 短期（受害者/单元反派） | 活不过一个故事弧的角色 | 展示灵异规则的残酷性，制造紧张感 |
| 客串（线索人物） | 出场一两次的功能性角色 | 提供关键信息或线索后退场 |

**设计要点**：
- 长期角色必须有完整的「状态变化轨迹」（如：唯物主义→信仰崩塌→疯狂）
- 短期角色的死亡方式要有叙事意义（展示禁忌规则、推动真相揭露）
- 客串角色虽然出场短暂，但提供的信息必须关键

#### 4.2 角色定位

「角色定位」字段提供 4 种选项，覆盖灵异故事的核心角色类型：

| 定位 | 功能 | 设计重点 |
|------|------|---------|
| 普通人/闯入者 | 负责探索与惊悚体验 | 代入感强，是读者的「眼睛」 |
| 民间手艺人/术士 | 出马仙、风水师、缝尸人等 | 专业能力+人性弱点的矛盾 |
| 诡异/非人 | 怨灵、精怪、僵尸 | 有明确的「规则」和「弱点」 |
| 关键线索人物 | 守村人、疯子、幸存长者 | 掌握核心秘密但不会直说 |

#### 4.3 超自然属性

民间灵异角色有多个独特的超自然属性字段：

**命格与体质**（必填）：
- 这是角色与灵异世界交互的基础
- 示例：「八字全阴」（容易招鬼）、「童子命」（短寿但灵力强）、「天生阴阳眼」（能看见不干净的东西）、「极煞之体」（鬼见了也怕）

**背负因果**（必填）：
- 中式恐怖的核心驱动力——角色遭遇灵异的深层原因
- 示例：「祖上挖绝户坟发了横财」「前世欠了阴债」「贪图买命财」

**死亡方式**（仅限鬼怪角色）：
- 死亡方式直接决定厉鬼的能力和弱点
- 吊死→常现于横梁、绳索
- 溺亡→水鬼，拉人下水
- 饿死→索取食物
- 横死→怨气最重，最难化解

**阳火状态**（动态字段）：
- 人的三盏阳火（两肩+头顶）是阻挡灵异侵害的天然屏障
- 旺盛→不容易被侵害
- 正常→正常人的状态
- 虚弱→容易被灵异影响
- 将灭→极度危险，随时可能被附身或夺魂

#### 4.4 角色模板

**普通人/闯入者模板**：
```
姓名: [普通的名字，避免过于文学化]
生命周期: 长期（幸存者）
角色定位: 普通人/闯入者
命格与体质: [轻微的特殊体质，如「小时候大病一场后就能看到奇怪的影子」]
性格: [好奇+理性+倔强——驱动其不断深入调查]
背负因果: [与故事核心事件相关的因果联系]
状态变化轨迹: 理性质疑→亲身经历→信仰崩塌→接受现实→直面恐惧
```

**术士模板**：
```
姓名: [名字可以偏民间，如「赵半仙」「老陈头」]
生命周期: 长期（幸存者/核心BOSS）
角色定位: 民间手艺人/术士
命格与体质: [与其术法对应的特殊体质]
所修法门或诡异能力: [具体的流派和擅长手段]
背负因果: [五弊三缺的具体体现]
状态变化轨迹: 隐居不出→被迫出手→陷入危机→赌上一切→代价沉重
```

**鬼怪模板**：
```
姓名: [称呼而非姓名，如「红衣女」「黄皮子老太」]
生命周期: 长期（核心BOSS）或 短期（单元反派）
角色定位: 诡异/非人
命格与体质: [生前的特殊体质]
死亡方式: [详细的死亡经过——这是其能力和弱点的来源]
背负因果: [为什么变成厉鬼——冤屈、执念、未了心愿]
所修法门或诡异能力: [具体的杀人规则或诡异能力]
状态变化轨迹: 沉睡→被惊扰→报复→失控→被超度/永镇
```

---

### 五、五幕恐惧递进叙事结构

民间灵异故事遵循独特的五幕结构，每一幕的恐怖程度逐层递进：

#### 5.1 第一幕：日常生活（10-15%）

**目标**：建立「正常」的基准线，让读者感受到角色的日常生活。

**要素**：
- 介绍主要角色和他们的日常环境
- 展示当地的民俗习惯和社会氛围
- 埋下「微妙的不对劲」——老人不经意的警告、某个被封起来的房间、村里人回避的话题
- 建立读者对角色的情感投入

**关键技巧**：
- 日常描写越真实，后续的恐怖反差越强
- 「不对劲」要极其微妙——读者能感觉到，但说不清楚
- 不要急于展示灵异元素

**章节节奏**：情节节奏选择「铺垫蓄势」

#### 5.2 第二幕：初次异常（15-20%）

**目标**：打破日常的宁静，让角色第一次接触到无法解释的现象。

**要素**：
- 第一个明确的灵异征兆出现
- 角色试图用理性解释（「可能是自己看花眼了」）
- 周围人的反常态度（有人知道真相但不说）
- 禁忌规则的首次暗示

**经典的「初次异常」设计**：
- 夜里听到不该有的声音
- 看到不该出现的人/物
- 发现某个日常物品被移动了位置
- 有人突然失踪或行为异常

**章节节奏**：「渐入诡境」

#### 5.3 第三幕：深入调查（25-30%）

**目标**：主角开始主动探索真相，逐步揭示灵异事件的规则和历史。

**要素**：
- 主角从被动经历转为主动调查
- 术士/知情者角色登场，提供部分信息
- 禁忌规则被正式揭示
- 有角色因违反规则而遭殃（短期角色的死亡）
- 因果链条开始浮现

**调查方法的中式特色**：
- 翻族谱/地方志
- 询问村里最年长的人
- 发现被封存的物证（旧照片、发黄的符咒）
- 术士通过法事获取信息

**章节节奏**：「渐入诡境」到「高潮惊悚」交替

#### 5.4 第四幕：真相揭露（20-25%）

**目标**：完整的因果链条浮出水面，所有灵异事件的真正原因被揭露。

**要素**：
- 核心因果关系全部揭示——往往是一个令人唏嘘的悲剧
- 灵异活动达到最高强度
- 角色面临最大的道德/生存抉择
- 术士准备最终的化解方案

**真相揭露的层次**：
1. 表层真相：「谁做了什么」
2. 中层真相：「为什么这样做」
3. 深层真相：「背后的因果业力链条」

**章节节奏**：「高潮惊悚」+「真相揭露」

#### 5.5 第五幕：终极对抗（15-20%）

**目标**：最终的对抗或化解，所有矛盾在此收束。

**要素**：
- 术法/仪式对决
- 代价的支付——化解灵异必须有代价
- 因果的了结
- 余韵和留白——最好的结尾不是「从此平安」，而是留下一丝不安

**结局类型**：

| 类型 | 效果 | 示例 |
|------|------|------|
| 因果了结 | 圆满但沉重 | 真相大白，冤魂超度，但代价惨重 |
| 代价沉重 | 胜利但苦涩 | 灵异被压制，但术士折了寿或残了 |
| 开放余韵 | 不安的回味 | 看似解决了，但最后一个细节暗示并未结束 |
| 轮回不止 | 恐惧延续 | 新一轮的因果已经开始 |

**章节节奏**：「高潮惊悚」→「真相揭露」→「舒缓喘息」

---

### 六、恐惧曲线设计

民间灵异的恐惧不是一次性的惊吓，而是五层递进的心理压迫：

#### 6.1 第一层：暗示（Suggestion）

**目标**：在读者意识边缘种下不安的种子。

**技法**：
- 环境描写中的「微妙违和」：路上的行人走路都低着头、某家的窗户永远拉着帘子
- 角色对话中的「欲言又止」：「你别问那么多」「以前村里出过事」
- 感官描写中的「若有似无」：好像闻到了什么味道、好像听到了一声叹息

**关键**：暗示阶段绝不能让灵异元素「实锤」，一切都是「好像」「仿佛」「大概是错觉」。

#### 6.2 第二层：怀疑（Doubt）

**目标**：让角色（和读者）开始质疑自己的理性判断。

**技法**：
- 异常事件频率增加，但每次都「勉强」能找到解释
- 角色内心的「理性vs直觉」斗争
- 其他角色的态度出现分裂——有人坚持「没什么事」，有人神色紧张

**经典怀疑场景**：
- 「明明锁好了门，早上起来门是开的」
- 「照片里多了一个人，但仔细看又觉得是光影」
- 「连续三天在同一个地方看到同一个人」

#### 6.3 第三层：确认（Confirmation）

**目标**：灵异事件被确认为真实存在，理性防线彻底崩塌。

**技法**：
- 第一次不可否认的灵异体验——多人同时目睹、留下物理证据
- 角色的世界观遭到毁灭性打击
- 恐惧从「怀疑」升级为「确认后的恐慌」

**确认时刻的写法**：
- 不要写角色「吓得大叫」——真正的恐惧是「愣住了，大脑一片空白」
- 确认后的第一反应应该是「否认」——不是害怕，是不愿相信

#### 6.4 第四层：加剧（Escalation）

**目标**：灵异活动全面升级，角色陷入四面楚歌。

**技法**：
- 灵异活动从夜晚蔓延到白天
- 安全区域被侵入——家里不再安全
- 有人受到实质伤害或死亡
- 规则开始失效或被打破

**加剧阶段的节奏**：
- 事件之间的间隔越来越短
- 每次事件的烈度递增
- 角色的精神状态持续恶化

#### 6.5 第五层：终极恐惧（Ultimate Terror）

**目标**：恐惧达到顶点——不仅是灵异本身的恐怖，更是真相带来的心理冲击。

**技法**：
- 真相揭露的恐惧往往超过灵异本身——「原来一切的根源是人」
- 终极恐惧来自道德困境：化解灵异需要付出什么代价？
- 最后的恐惧是「代入自己」：如果我是这个角色，我能做出什么选择？

---

### 七、写作技法

#### 7.1 克制与暗示

民间灵异写作的第一法则是「克制」。

**少即是多**：
- 不要详细描写鬼的全貌——只描写一只苍白的手、一双没有瞳孔的眼睛
- 不要解释所有灵异现象——留下 20% 的未解之谜
- 不要让角色时刻处于恐惧中——恐惧需要间隔和对比

**暗示技法**：

| 技法 | 示例 |
|------|------|
| 视觉暗示 | 镜子里好像有什么东西一闪而过 |
| 听觉暗示 | 夜里隐约听到有人在唱戏 |
| 触觉暗示 | 脖子后面一阵阴风，像是有人在吹气 |
| 嗅觉暗示 | 房间里弥漫着一股说不清的腐甜味 |
| 逻辑暗示 | 村里有八十户人家，但墓地里有两百座坟 |

#### 7.2 五感恐惧描写

恐惧是全方位的感官体验。好的灵异描写应该调动读者的多个感官：

```
【视觉】走廊尽头，路灯忽明忽暗，每次灭掉的瞬间，
         那个位置好像多了一团黑影。
【听觉】四周安静得不正常——没有虫鸣、没有风声，
         只有自己砰砰的心跳。
【触觉】后背突然一凉，像是有什么湿冷的东西贴了上来。
【嗅觉】空气里飘来一股甜腻的腐败味，像是烂掉的花。
【味觉】嘴里莫名泛起一股铁锈味——是血的味道。
```

**五感描写节奏**：
- 铺垫阶段：单一感官异常（只有一种感觉不对）
- 加剧阶段：多感官联动（看到+听到+闻到）
- 高潮阶段：感官过载（所有感官同时被冲击）

#### 7.3 民俗禁忌叙事

禁忌是民间灵异的灵魂。禁忌叙事有固定的三段式结构：

**第一段：禁忌传达**
- 通过老人的口述、墙上的规矩、代代相传的规矩传达给角色
- 传达时要有「不可置疑」的权威感——「老辈人传下来的规矩，照做就是了」

**第二段：禁忌违反**
- 角色因为好奇/无知/不信邪/被迫而违反禁忌
- 违反的过程要有「不可逆转」的紧迫感——意识到违反时已经来不及了

**第三段：禁忌惩罚**
- 惩罚不是立刻降临，而是有一个让人煎熬的延迟
- 惩罚的形式应该与禁忌的内容有逻辑关联

#### 7.4 节奏控制

民间灵异的节奏核心是「慢火煨汤」：

**铺垫段**：
- 大量日常描写，偶尔穿插一两个「不对劲」的细节
- 句子长、节奏慢、环境描写多
- 目标：让读者放松警惕

**紧张段**：
- 句子急剧缩短，节奏加快
- 段落变短，单独一行制造停顿感
- 目标：制造窒息感

**惊吓点**：
- 通常在一段极度紧张后的「静默」之后
- 不是「突然」——而是一个意料之外、情理之中的细节
- 惊吓点之后立刻切换到「缓冲段」，给读者喘息

**缓冲段**：
- 角色（和读者）暂时脱离恐怖环境
- 处理情绪、消化信息、准备下一步
- 不能太长——否则恐惧感会消散

---

### 八、可用实体类别

本创作方法的 visible_categories 包含：

| 类别 | 对应模块类型 | 用途 |
|------|------------|------|
| **setting** | 世界（singleton）、小说梗概（singleton）、故事钩子（singleton）、文风设定（singleton） | 4 种设定类型，均为单例 |
| **character** | 角色 | 角色管理（支持命格与体质、背负因果、死亡方式、阳火状态等特有字段） |
| **scene** | 场景 | 场景管理（支持风水格局、规则与禁忌、异化状态、灵异活跃度等特有字段） |
| **chapter** | 章节 | 章节管理（支持恐怖元素、情节节奏、悬念设置等特有字段） |
| **prop** | 道具 | 道具管理（支持法器/阴物/祭品分类、使用禁忌等特有字段） |

**注意**：本创作方法**没有组织（organization）类别**。民间灵异故事通常不需要复杂的组织体系——恐惧来自个体面对未知的孤立无援感。

---

### 九、常见陷阱

#### 9.1 恐怖手段单一化

**问题**：全篇都是「突然出现一个鬼」的惊吓方式，读者很快麻木。

**规避**：交替使用暗示、怀疑、确认、加剧四层恐惧手法。惊吓只是最低级的恐怖——真正的恐惧来自暗示和未知。每种恐惧手法之间至少间隔两到三章。

#### 9.2 因果逻辑断裂

**问题**：灵异事件缺乏因果解释，纯粹为了吓人而吓人。

**规避**：在「世界」设定的「核心禁忌与规则」中建立完整的因果体系。每一个灵异事件都必须能追溯到具体的因果——是谁做了什么事，导致了什么后果。角色的「背负因果」字段必须认真填写。

#### 9.3 术士万能化

**问题**：术士角色无所不能，大大降低了恐惧感和紧张感。

**规避**：严格遵循「玄学/职业体系」中设定的代价和限制。术士每次出手都有成本——折寿、消耗法器、精力透支。让术士也会失手、也会害怕、也会面对超出能力范围的存在。

#### 9.4 氛围营造过度

**问题**：环境描写太多、太密集，反而削弱了恐惧感。

**规避**：氛围描写遵循「三点定面」原则——每个场景最多用三个感官细节来建立氛围，剩下的留给读者想象。恐怖描写单次不超过 200 字。

#### 9.5 角色行为不合理

**问题**：角色明知危险还要「作死」，读者无法认同。

**规避**：给角色足够的「违反禁忌」动机——不是因为傻，而是因为贪（利益驱动）、情（亲人牵连）、迫（被逼无奈）、疑（不相信灵异）。在「背负因果」字段中设计合理的动机链条。

#### 9.6 民俗元素堆砌

**问题**：大量堆砌冥婚、赶尸、出马仙等民俗元素，但每个都浅尝辄止。

**规避**：一个故事聚焦一到两个核心民俗元素，深入挖掘其文化内涵和恐怖潜力。在「民俗仪式」字段中重点描述与故事直接相关的仪式，而非面面俱到。

#### 9.7 结局草率

**问题**：花大量篇幅铺垫和渲染，但结尾仓促收场——「大师来了，做了场法事，鬼被收了」。

**规避**：终极对抗必须有与前文铺垫匹配的仪式感和代价感。化解灵异不是「打败怪物」，而是「了却因果」——需要有人承担代价。结尾留下适当的余韵和留白。

#### 9.8 恐惧曲线平坦

**问题**：全篇恐惧程度相当，没有起伏，读者审美疲劳。

**规避**：严格遵循五层恐惧递进结构（暗示→怀疑→确认→加剧→终极恐惧）。每一层之间用「正常生活」或「调查推理」的章节做缓冲。恐惧是对比产生的——越平静的段落之后，恐怖的冲击越大。

---

### 十、创作检查清单

开始写作前确认：

- [ ] 「世界」设定中的「核心禁忌与规则」是否具体明确、有内在逻辑
- [ ] 「地理与风水格局」是否从玄学角度解释了灵异成因
- [ ] 「灵异生态」中的鬼怪类型是否与故事主题一致
- [ ] 每个主要角色的「背负因果」是否与核心事件关联
- [ ] 人类角色的「命格与体质」是否影响其与灵异的交互方式
- [ ] 鬼怪角色的「死亡方式」是否决定了其能力和弱点
- [ ] 「故事钩子」中的「开篇悬念」能否在前三章引起读者好奇
- [ ] 五幕结构是否完整（日常→异常→调查→真相→对抗）
- [ ] 恐惧曲线是否呈递进态势（暗示→怀疑→确认→加剧→终极恐惧）
- [ ] 恐怖手法是否多样（不只是「突然出现一个鬼」）
- [ ] 场景的「风水格局」和「规则与禁忌」是否服务于恐怖氛围
- [ ] 道具的「使用禁忌」和「副作用与代价」是否增加了戏剧张力',
  '## Chinese Folk Horror Story Writing Guide

This guide is designed specifically for the "Chinese Folk Horror Story" (民间灵异故事创作) creation method. The core concept: using Chinese folk beliefs, feng shui metaphysics, and karmic retribution as the foundation, creating deep-seated fear through the distortion of everyday scenes and the violation of folk taboos -- a horror that feels like it could happen right beside you.

---

### I. Genre Characteristics and Core Aesthetics

#### 1.1 What Is Chinese Folk Horror

Chinese folk horror (民间灵异) is a horror narrative rooted in indigenous Chinese culture. Rather than relying on gore or visual shock, it creates spine-chilling terror through three core elements -- **taboos**, **karma**, and **rituals** -- finding horror in the cracks of everyday life.

| Core Element | Description |
|-------------|-------------|
| **Folk taboos** (民俗禁忌) | Rules passed down through generations; breaking them guarantees retribution |
| **Karmic causation** (因果业力) | Every supernatural event has a prior cause; karmic retribution is the underlying logic |
| **Feng shui metaphysics** (风水玄学) | Geographic configurations affect yin-yang balance, breeding grounds for the supernatural |
| **Folk occult arts** (民间术法) | Supernatural abilities of folk practitioners: spirit mediums, feng shui masters, corpse stitchers |
| **Ghost ecology** (鬼怪生态) | Non-human entities: vengeful spirits, animal spirits (fox, weasel, hedgehog, snake, rat), jiangshi |

#### 1.2 Chinese Folk Horror vs. Other Horror Genres

| Dimension | Chinese Folk Horror | Western Horror | Japanese Kaidan |
|-----------|-------------------|----------------|-----------------|
| Source of fear | Karmic retribution + taboo violation | Unknown monsters + survival threat | Daily-life distortion + psychological twist |
| Core aesthetic | "Heaven''s order exists; violate it and be punished" | "Humanity''s insignificance before the unknown" | "The abyss beneath ordinary surfaces" |
| Ghost logic | Cause-and-effect; follows rules | Pure evil or chaos | Obsessive grudge; repetitive cycle |
| Resolution | Occult confrontation + resolving karma | Destroy / escape | Understanding / empathy / sacrifice |
| Fear layer | Cultural identity ("My grandmother told me...") | Physiological (visual shock) | Psychological (unease) |
| Typical settings | Desolate villages, mortuaries, old houses, graveyards | Abandoned hospitals, forest cabins | Schools, apartments, trains |

#### 1.3 Core Reader Expectations

- **Cultural resonance**: "I heard a story like this when I was a child" -- evoking fear from collective memory
- **Rule discovery**: Uncovering and understanding how the supernatural world operates (what must not be done, and why)
- **Karmic revelation**: Peeling back layers to reveal the tragic truth behind all supernatural events
- **Occult practitioner duels**: Thrilling battles of wits between folk practitioners and ghosts
- **Lingering chill**: Not a jump scare, but the kind of fear that makes you leave the lights on at night

---

### II. World Setting Field-by-Field Guide

The "World" (世界) is the most critical setting type in this creation method (singleton), containing 8 key fields. Each field directly affects the underlying logic of the horror story.

#### 2.1 World Name (世界名称)

Usually a concrete place name or designation. A good world name carries its own horror atmosphere:

| Type | Example | Effect |
|------|---------|--------|
| Real place name style | "Fengmen Village," "Kowloon Walled City" | Strong realism; implies "this might be true" |
| Geographic feature style | "Xiangxi Mist," "Three-Way Junction" | Built-in regional cultural flavor |
| Era + region | "Northeast Old Forest in the 1990s" | Double immersion of era and locale |

**Avoid**: Overly abstract or literary names (e.g., "Realm of the Nether"). Folk horror requires grounded, earthy settings.

#### 2.2 Geography and Feng Shui Configuration (地理与风水格局)

This is the genre''s core field. It must describe not just geography but explain from a feng shui perspective why supernatural phenomena breed there.

**Framework**:
```
Geographic location (XX village/town/district in XX region of XX province)
+ Feng shui characteristics (yin-gathering basin / barren-heir land / three mountains flanking one river / piercing-hall sha)
+ Supernatural causation (why this configuration leads to supernatural events)
```

**Example**:
"A basin village nestled deep in the Taihang Mountains, surrounded on three sides by peaks. Behind the village rises a nameless barren hill covered in a pine forest that hasn''t seen sunlight in a decade. The entire village layout is a classic ''yin-gathering basin'' -- three mountain faces block sunlight, with only one narrow exit to the west, directly facing a dried-up ancient riverbed. In feng shui, this is called ''yin enters, yang cannot leave'' -- a natural breeding ground for dark entities."

**Common feng shui terminology**:
- Yin-gathering land, barren-heir land, three mountains flanking one river
- Piercing-hall sha, mulberry before the door and willow behind
- South-facing-north behind yin land, three-way junction
- Dragon vein fracture, uncollected water mouth

#### 2.3 Era and Social Background (时代与社会背景)

The era choice directly affects how horror atmosphere is crafted. Three dimensions are needed:

| Dimension | Description | Example |
|-----------|-------------|---------|
| Era characteristics | The time period of the story | Republican-era chaos, pre-1980s reform, modern urban |
| Clan power | Degree of family control in the locale | "The whole village is surnamed Zhao; the clan elder''s word is law" |
| Superstition level | People''s belief in the supernatural | "Every household worships the Earth God; Daoist priests are called for all births and deaths" |

**Best horror eras**:
- **1980s-90s rural China**: Information isolation, strong clan power, thick superstitious atmosphere -- the golden-age backdrop for folk horror
- **Republican era**: Warlord chaos + feudal remnants; suits "great house curse" type stories
- **Modern urban**: Strongest contrast -- collision between skyscrapers and ancient taboos

#### 2.4 Core Taboos and Rules (核心禁忌与规则)

These are the "laws" of the horror story and the foundation of the entire narrative. Good taboo rules should:

1. **Be specific**: Not "don''t do bad things" but "don''t look back while walking after dark"
2. **Have internal logic**: There''s a reason behind the taboo (looking back lets the ghost see your face)
3. **Be easily broken**: Characters naturally violate them out of curiosity / ignorance / greed
4. **Have severe consequences**: Punishment for violation is the core driver of the plot

**Examples**:
- "Every Ghost Festival, villagers don''t go outside, don''t light lamps, and don''t speak. If you hear someone calling your name, never answer."
- "Something is buried under the old scholar tree at the village entrance. Whoever digs, dies. Three generations have known this rule."
- "In the Zhao family ancestral hall, there is a coffin. Every seven years, a new child must guard it. The coffin guardian must not cry, must not laugh, must not fall asleep."

#### 2.5 Metaphysical / Practitioner System (玄学/职业体系)

Describes the "professionals" in this world who combat the supernatural. The key is the **cost** of using their power.

| Practitioner | Ability | Cost |
|-------------|---------|------|
| Spirit medium (出马仙) | Channels spiritual entities to exorcise evil | Five afflictions and three deficiencies (widowhood, loneliness, childlessness, disability, early death + loss of wealth, fate, power) |
| Feng shui master (风水师) | Reads dragon veins, locates acupoints, configures sha-dispelling layouts | Revealing heavenly secrets shortens lifespan |
| Corpse stitcher (缝尸人) | Handles bodies from unnatural deaths | Absorbs death qi; yang life gradually shortens |
| Corpse herder (赶尸人) | Guides departed souls home | Cannot touch the living''s qi |
| Paper effigy crafter (扎纸人) | Creates paper ritual tools and effigies | Over time, loses ability to distinguish yin from yang |

**Key point**: Occult practitioners in folk horror are not superheroes. They too feel fear, hesitate, and fail. The greater their power, the heavier the price -- this is the core spirit of "five afflictions and three deficiencies."

#### 2.6 Supernatural Ecology (灵异生态)

Describes the forms and hierarchy of ghosts and spirits. Chinese supernatural entities have their own unique classification:

| Type | Characteristics | Origin |
|------|----------------|--------|
| Vengeful spirit / fierce ghost (怨灵/厉鬼) | Evil spirits formed from unresolved resentment | Violent death, unjust death, death with hatred |
| Great immortal families (大仙家) | Fox, Weasel, Hedgehog, Snake, Rat -- the five animal spirit families | Animals that have cultivated to sentience |
| Jiangshi (僵尸) | Physically manifested undead corpse | Corpse transformation, feng shui evil ground |
| Sui / curse (祟) | Conceptual calamity or curse | Manifestation of karmic force |
| Substitute ghost (替死鬼) | Ghost that must find a replacement before reincarnating | Unnatural death |

#### 2.7 Folk Rituals (民俗仪式)

Ritual atmosphere is the primary source of horror. Describe the special folk rituals in the story:

**Common ritual materials**:
- Ghost marriage (冥婚): arranging a wedding for the dead
- Foundation burial (打生桩): burying a living person/animal under building foundations for suppression
- Deity invitation / sending ceremonies
- Special funeral customs (vigil, night watch, burning road-guiding paper)
- Altar ceremony (开坛作法): setting up an altar for exorcism
- Yin debt repayment (还阴债): repaying debts owed from a past life

**Ritual design points**: Every ritual must have strict procedural steps and taboos. Any misstep can lead to catastrophe.

#### 2.8 Offerings and Transaction Goods (供奉与交易物)

Describes the "currency" between humans and ghosts, humans and practitioners:

| Transaction Parties | Currency | Description |
|-------------------|----------|-------------|
| Human → ghost/spirit | Incense, offerings, spirit money | Offerings in exchange for peace or protection |
| Human → practitioner | Money, favors | Practitioners have to make a living too |
| Ghost → human | Lifespan, yin merit | Extracted or exchanged |
| Practitioner → ghost | Transcendence, placement | Resolving karma; each gets what they need |
| Charlatan → human | Fear, money | Exploiting superstition for profit; also a common story element |

---

### III. Other Setting Types

#### 3.1 Novel Synopsis (小说梗概)

The "Novel Synopsis" is a singleton setting type with a single field: "Story Synopsis" (故事梗概).

**How to fill**:
- Summarize the entire story''s cause, development, climax, and ending in 300-500 words
- Must identify the core supernatural event and karmic relationship
- Include the fate trajectories of major characters

**Template**:
```
[Time and place] + [Triggering event] + [How the protagonist gets involved]
→ [Initial investigation/experiences] + [Taboos and rules discovered]
→ [Truth gradually revealed] + [Karmic chain emerges]
→ [Final confrontation/resolution] + [Ending and aftertaste]
```

#### 3.2 Story Hook (故事钩子)

The "Story Hook" contains 4 fields that define the story''s core appeal:

| Field | Purpose | Example |
|-------|---------|---------|
| Story Hook (故事钩子) | One sentence summarizing the most spine-chilling premise | "Every household''s door frame has the same person''s name carved on it" |
| Core Selling Point (核心卖点) | Why readers should read this horror story | "Northeast spirit medium documentary style + authentic folk research" |
| Opening Suspense (开篇悬念) | The suspense established at the beginning | "Why are there no old people in the village? Why is that well sealed with a stone slab?" |
| Reader Expectations (读者期待) | What readers expect to see | "Karmic chain revelation, practitioner duels, folk ritual scenes" |

**Hook design principles**:
- The best hooks are "anomalies in the everyday" -- the more ordinary the thing, the more terrifying the unexpected change
- Avoid starting directly with a "ghost" -- suggestion is more frightening than explicit showing

#### 3.3 Writing Style Setting (文风设定)

The "Writing Style Setting" defines overall writing style, including narrative perspective, language style, overall tone, sentence rhythm, vocabulary level, etc.

**Recommended folk horror combinations**:

| Field | Recommended Option | Rationale |
|-------|--------------------|-----------|
| Narrative Perspective (叙事视角) | First person or third person limited | Restricts information; strengthens fear of the unknown |
| Language Style (语言风格) | Vernacular (白话) or colloquial (口语化) | The "storytelling feel" of folk tales |
| Overall Tone (整体基调) | Suspense (悬疑) or Dark (黑暗) | The basic color palette of horror stories |
| Sentence Rhythm (句式节奏) | Short sentences + simple structure | Horror scenes need punchy brevity |
| Vocabulary Level (词汇水平) | Simple (简单易懂) or moderate (适中) | Grounded; avoid being overly literary |
| Pacing Control (节奏控制) | Variable pacing (节奏多变) | Slow during buildup, fast during scares |

**Special rules suggestions**:
- "Horror scene descriptions should not exceed 200 continuous words; leaving blanks is more effective than describing"
- "Use regional dialect vocabulary in dialogue to enhance geographic authenticity"
- "Never fully describe a ghost''s complete appearance; only describe partial features"

---

### IV. Character Design

Folk horror character design has its own unique lifecycle system and supernatural attributes.

#### 4.1 Lifecycle System

Horror stories have extremely high mortality rates. The "Lifecycle" (生命周期) field determines a character''s survival expectation:

| Lifecycle | Meaning | Narrative Function |
|-----------|---------|-------------------|
| Long-term (survivor / core boss) | Core character throughout the book | Carries the main plot; the object of readers'' sustained attention |
| Short-term (victim / episodic villain) | Character who won''t survive one story arc | Demonstrates the cruelty of supernatural rules; creates tension |
| Cameo (clue character) | Functional character appearing once or twice | Provides key information or clues then exits |

**Design points**:
- Long-term characters must have a complete "state change trajectory" (e.g., materialist → faith collapse → madness)
- Short-term characters'' deaths must have narrative significance (demonstrate taboo rules, advance truth revelation)
- Cameo characters appear briefly but the information they provide must be critical

#### 4.2 Character Roles

The "Character Role" (角色定位) field provides 4 options covering the core character types in horror:

| Role | Function | Design Focus |
|------|----------|-------------|
| Ordinary person / intruder | Handles exploration and horror experience | Strong reader identification; the reader''s "eyes" |
| Folk practitioner / occultist | Spirit medium, feng shui master, corpse stitcher, etc. | Contradiction between professional ability and human weakness |
| Supernatural / non-human | Vengeful spirit, animal spirit, jiangshi | Must have clear "rules" and "weaknesses" |
| Key clue character | Village guardian, madman, surviving elder | Holds core secrets but won''t say them directly |

#### 4.3 Supernatural Attributes

Folk horror characters have several unique supernatural attribute fields:

**Fate and Constitution (命格与体质)** (required):
- This is the foundation for how a character interacts with the supernatural world
- Examples: "Born with eight characters all yin" (attracts ghosts), "Child of heaven fate" (short-lived but spiritually powerful), "Born with yin-yang eyes" (can see unclean things), "Extreme sha body" (even ghosts are afraid)

**Karmic Burden (背负因果)** (required):
- The core driving force of Chinese horror -- the deep reason a character encounters the supernatural
- Examples: "Ancestors robbed barren-heir tombs for ill-gotten wealth," "Owes a yin debt from a past life," "Coveted blood money"

**Death Method (死亡方式)** (ghost characters only):
- Death method directly determines the vengeful spirit''s abilities and weaknesses
- Hanging → appears near beams and ropes
- Drowning → water ghost; pulls people underwater
- Starvation → demands food
- Violent death → heaviest resentment; hardest to resolve

**Yang Fire Status (阳火状态)** (dynamic field):
- A person''s three yang fires (two shoulders + crown of head) are the natural barrier against supernatural intrusion
- Vigorous → not easily affected
- Normal → average person''s state
- Weak → easily influenced by the supernatural
- Dying → extremely dangerous; at risk of possession or soul-snatching at any moment

#### 4.4 Character Templates

**Ordinary person / intruder template**:
```
Name: [An ordinary name; avoid overly literary names]
Lifecycle: Long-term (survivor)
Role: Ordinary person / intruder
Fate and Constitution: [Mild special constitution, e.g., "started seeing strange shadows after a severe childhood illness"]
Personality: [Curious + rational + stubborn -- drives them to keep investigating]
Karmic Burden: [Karmic connection related to the core event]
State Change Trajectory: Rational skepticism → personal experience → faith collapse → acceptance → facing the horror
```

**Occult practitioner template**:
```
Name: [Can be folksy, e.g., "Old Half-Immortal Zhao," "Old Man Chen"]
Lifecycle: Long-term (survivor / core boss)
Role: Folk practitioner / occultist
Fate and Constitution: [Special constitution corresponding to their occult art]
Occult Art or Supernatural Ability: [Specific school and specialty]
Karmic Burden: [Specific manifestation of five afflictions and three deficiencies]
State Change Trajectory: Reclusive → forced into action → falls into crisis → bets everything → heavy price paid
```

**Ghost / supernatural entity template**:
```
Name: [A designation, not a personal name, e.g., "Woman in Red," "Old Weasel Granny"]
Lifecycle: Long-term (core boss) or Short-term (episodic villain)
Role: Supernatural / non-human
Fate and Constitution: [Special constitution when alive]
Death Method: [Detailed death circumstances -- this is the source of their abilities and weaknesses]
Karmic Burden: [Why they became a vengeful spirit -- injustice, obsession, unfulfilled wish]
Occult Art or Supernatural Ability: [Specific killing rules or supernatural abilities]
State Change Trajectory: Dormant → disturbed → retribution → out of control → exorcised/permanently sealed
```

---

### V. Five-Act Fear Escalation Narrative Structure

Folk horror stories follow a unique five-act structure where the horror level escalates progressively:

#### 5.1 Act One: Daily Life (10-15%)

**Goal**: Establish the "normal" baseline; let readers experience the characters'' everyday lives.

**Elements**:
- Introduce main characters and their daily environment
- Showcase local folk customs and social atmosphere
- Plant "subtle wrongness" -- an elder''s offhand warning, a sealed room, topics villagers avoid
- Build readers'' emotional investment in the characters

**Key techniques**:
- The more realistic the daily descriptions, the stronger the subsequent horror contrast
- "Wrongness" must be extremely subtle -- readers can sense it but can''t pinpoint it
- Do not rush to show supernatural elements

**Chapter pacing**: Select "buildup and preparation" (铺垫蓄势) for the chapter pacing field

#### 5.2 Act Two: First Anomaly (15-20%)

**Goal**: Shatter the daily calm; let characters encounter unexplainable phenomena for the first time.

**Elements**:
- The first clear supernatural sign appears
- Characters try to explain rationally ("I must have been seeing things")
- Abnormal attitudes from surrounding people (some know the truth but won''t speak)
- First hints of taboo rules

**Classic "first anomaly" designs**:
- Hearing sounds at night that shouldn''t be there
- Seeing a person or object that shouldn''t exist
- Discovering an everyday item has been moved
- Someone suddenly disappears or behaves abnormally

**Chapter pacing**: "Entering the uncanny" (渐入诡境)

#### 5.3 Act Three: Deep Investigation (25-30%)

**Goal**: The protagonist begins actively exploring the truth, progressively revealing the rules and history of supernatural events.

**Elements**:
- Protagonist shifts from passive experience to active investigation
- Practitioner / informant characters appear, providing partial information
- Taboo rules are formally revealed
- A character suffers for violating the rules (short-term character''s death)
- The karmic chain begins to emerge

**Chinese-style investigation methods**:
- Consulting genealogy records / local chronicles
- Questioning the village''s oldest residents
- Discovering sealed evidence (old photographs, yellowed talismans)
- Practitioners obtaining information through ritual ceremonies

**Chapter pacing**: Alternating between "entering the uncanny" and "horror climax" (高潮惊悚)

#### 5.4 Act Four: Truth Revealed (20-25%)

**Goal**: The complete karmic chain surfaces; the true cause of all supernatural events is revealed.

**Elements**:
- All core karmic relationships revealed -- often a heartbreaking tragedy
- Supernatural activity reaches maximum intensity
- Characters face their greatest moral/survival dilemma
- The practitioner prepares the final resolution plan

**Layers of truth revelation**:
1. Surface truth: "Who did what"
2. Middle truth: "Why they did it"
3. Deep truth: "The underlying karmic chain"

**Chapter pacing**: "Horror climax" + "truth revealed" (真相揭露)

#### 5.5 Act Five: Ultimate Confrontation (15-20%)

**Goal**: The final confrontation or resolution; all conflicts converge here.

**Elements**:
- Occult art / ritual showdown
- Payment of the price -- resolving the supernatural always has a cost
- Karmic closure
- Aftertaste and blank space -- the best endings are not "peace thereafter" but leave a trace of unease

**Ending types**:

| Type | Effect | Example |
|------|--------|---------|
| Karmic closure | Satisfying but heavy | Truth revealed, vengeful spirit transcended, but at great cost |
| Heavy price | Victory but bitter | Supernatural suppressed, but the practitioner lost years or was maimed |
| Open aftertaste | Lingering unease | Seemingly resolved, but the last detail hints it''s not over |
| Endless cycle | Fear continues | A new round of karma has already begun |

**Chapter pacing**: "Horror climax" → "truth revealed" → "breathing room" (舒缓喘息)

---

### VI. Fear Curve Design

Folk horror fear is not a one-time jump scare but a five-layer progressive psychological pressure:

#### 6.1 Layer One: Suggestion

**Goal**: Plant seeds of unease at the edge of the reader''s consciousness.

**Techniques**:
- "Subtle dissonance" in environmental description: pedestrians all walk with heads down; one house''s windows are always curtained
- "Reluctance to speak" in character dialogue: "Don''t ask so many questions," "Something happened in the village before"
- "Barely perceptible" sensory descriptions: seemed to smell something; seemed to hear a sigh

**Key**: In the suggestion phase, never let supernatural elements be "confirmed." Everything is "seemed like," "as if," "probably just imagination."

#### 6.2 Layer Two: Doubt

**Goal**: Make the character (and reader) start questioning their rational judgment.

**Techniques**:
- Anomalous events increase in frequency, but each time there''s a "barely adequate" explanation
- The character''s internal "reason vs. intuition" struggle
- Other characters'' attitudes split -- some insist "it''s nothing," others look tense

**Classic doubt scenarios**:
- "I definitely locked the door, but it was open in the morning"
- "There''s an extra person in the photo, but looking closer it might be a light effect"
- "Saw the same person at the same spot three days in a row"

#### 6.3 Layer Three: Confirmation

**Goal**: The supernatural event is confirmed as real; the rational defense line completely collapses.

**Techniques**:
- First undeniable supernatural experience -- multiple witnesses simultaneously, physical evidence left behind
- The character''s worldview suffers a devastating blow
- Fear upgrades from "doubt" to "post-confirmation panic"

**How to write the confirmation moment**:
- Don''t write the character "screaming in terror" -- true fear is "freezing in place, mind going blank"
- The first reaction after confirmation should be "denial" -- not fear, but refusal to believe

#### 6.4 Layer Four: Escalation

**Goal**: Supernatural activity fully intensifies; characters are besieged from all sides.

**Techniques**:
- Supernatural activity spreads from nighttime to daytime
- Safe zones are breached -- home is no longer safe
- Someone suffers real harm or dies
- Rules begin to fail or be broken

**Escalation phase pacing**:
- Intervals between events grow shorter
- Each event''s intensity increases
- Characters'' mental states continue deteriorating

#### 6.5 Layer Five: Ultimate Terror

**Goal**: Fear reaches its peak -- not just the terror of the supernatural itself, but the psychological impact of the truth.

**Techniques**:
- The terror of truth revelation often surpasses the supernatural itself -- "So it was humans all along"
- Ultimate fear comes from moral dilemma: what price must be paid to resolve the supernatural?
- The final fear is "putting yourself in their shoes": if I were this character, what choice could I make?

---

### VII. Writing Techniques

#### 7.1 Restraint and Suggestion

The first law of folk horror writing is "restraint."

**Less is more**:
- Don''t describe a ghost''s full appearance in detail -- just a pale hand, a pair of pupil-less eyes
- Don''t explain all supernatural phenomena -- leave 20% as unsolved mysteries
- Don''t keep characters in constant fear -- fear needs intervals and contrast

**Suggestion techniques**:

| Technique | Example |
|-----------|---------|
| Visual suggestion | Something seemed to flash past in the mirror |
| Auditory suggestion | Faintly heard someone singing opera at night |
| Tactile suggestion | A cold draft on the back of the neck, like someone blowing |
| Olfactory suggestion | A faint, indescribable sweet-rot smell fills the room |
| Logical suggestion | The village has eighty households, but the cemetery has two hundred graves |

#### 7.2 Five-Sense Fear Description

Fear is a multi-sensory experience. Good supernatural descriptions should engage multiple reader senses:

```
[Visual] At the end of the corridor, the light flickers on and off;
         in each moment of darkness, there seems to be an extra dark shape.
[Auditory] The surroundings are unnaturally silent -- no insects, no wind,
           only one''s own pounding heartbeat.
[Tactile] A sudden chill on the back, as if something cold and wet pressed against it.
[Olfactory] A sweet, putrid smell drifts through the air, like rotting flowers.
[Gusty/taste] An inexplicable metallic taste in the mouth -- the taste of blood.
```

**Five-sense description pacing**:
- Buildup phase: Single-sense anomaly (only one sense feels wrong)
- Escalation phase: Multi-sense coordination (see + hear + smell)
- Climax phase: Sensory overload (all senses hit simultaneously)

#### 7.3 Folk Taboo Narrative

Taboos are the soul of folk horror. Taboo narrative follows a fixed three-part structure:

**Part One: Taboo Transmission**
- Conveyed to characters through elders'' oral accounts, rules posted on walls, or rules passed down through generations
- Transmission must carry "unquestionable" authority -- "This is a rule from the ancestors; just follow it"

**Part Two: Taboo Violation**
- Characters violate the taboo due to curiosity / ignorance / disbelief / coercion
- The violation process must have an "irreversible" urgency -- by the time they realize they''ve violated it, it''s too late

**Part Three: Taboo Punishment**
- Punishment doesn''t arrive immediately but with an agonizing delay
- The form of punishment should logically relate to the taboo''s content

#### 7.4 Pacing Control

The pacing core of folk horror is "slow-simmering broth":

**Buildup segments**:
- Heavy daily-life descriptions, occasionally interspersed with one or two "off" details
- Long sentences, slow pace, lots of environmental description
- Goal: lull readers into dropping their guard

**Tension segments**:
- Sentences shorten dramatically; pace accelerates
- Paragraphs shrink; single-line paragraphs create pause effects
- Goal: create a suffocating feeling

**Scare points**:
- Usually after a "silence" following extreme tension
- Not "suddenly" -- but an unexpected-yet-logical detail
- Immediately switch to a "buffer segment" after the scare point to let readers breathe

**Buffer segments**:
- Character (and reader) temporarily exits the horror environment
- Process emotions, digest information, prepare next steps
- Cannot be too long -- otherwise fear dissipates

---

### VIII. Available Entity Categories

This creation method''s visible_categories include:

| Category | Corresponding Module Types | Purpose |
|----------|--------------------------|---------|
| **setting** | World (singleton), Novel Synopsis (singleton), Story Hook (singleton), Writing Style (singleton) | 4 setting types, all singletons |
| **character** | Character | Character management (supports unique fields: Fate and Constitution, Karmic Burden, Death Method, Yang Fire Status) |
| **scene** | Scene | Scene management (supports unique fields: Feng Shui Configuration, Rules and Taboos, Distortion State, Supernatural Activity Level) |
| **chapter** | Chapter | Chapter management (supports unique fields: Horror Elements, Plot Pacing, Suspense Setup) |
| **prop** | Prop | Prop management (supports categories: Ritual Tool / Yin Object / Offering, and fields: Usage Taboos) |

**Note**: This creation method has **no organization category**. Folk horror stories typically do not need complex organizational structures -- fear comes from the individual''s isolation when facing the unknown.

---

### IX. Common Pitfalls

#### 9.1 Monotonous Horror Techniques

**Problem**: The entire story relies on "a ghost suddenly appears" jump scares; readers quickly become numb.

**Prevention**: Alternate between the four fear layers: suggestion, doubt, confirmation, and escalation. Jump scares are the lowest form of horror -- true fear comes from suggestion and the unknown. Space different fear techniques at least two to three chapters apart.

#### 9.2 Broken Karmic Logic

**Problem**: Supernatural events lack causal explanation; scares exist purely for shock value.

**Prevention**: Establish a complete karmic system in the World setting''s "Core Taboos and Rules" field. Every supernatural event must be traceable to specific cause-and-effect -- who did what, leading to what consequence. The "Karmic Burden" (背负因果) field for each character must be filled in thoughtfully.

#### 9.3 Overpowered Practitioners

**Problem**: Practitioner characters are omnipotent, drastically reducing fear and tension.

**Prevention**: Strictly follow the costs and limitations set in the "Metaphysical / Practitioner System" field. Every time a practitioner acts, there is a cost -- shortened lifespan, consumed ritual tools, exhaustion. Let practitioners also fail, feel fear, and face entities beyond their capabilities.

#### 9.4 Excessive Atmosphere Building

**Problem**: Too much, too dense environmental description actually weakens the sense of fear.

**Prevention**: Atmospheric description follows the "three points define a surface" principle -- use at most three sensory details per scene to establish atmosphere; leave the rest to reader imagination. Horror descriptions should not exceed 200 words per continuous passage.

#### 9.5 Irrational Character Behavior

**Problem**: Characters knowingly walk into danger ("death-seeking behavior"); readers cannot empathize.

**Prevention**: Give characters sufficient motivation for violating taboos -- not because they are stupid, but because of greed (profit motive), emotion (family involvement), coercion (no choice), or skepticism (disbelief in the supernatural). Design a logical motivation chain in the "Karmic Burden" field.

#### 9.6 Folk Element Overload

**Problem**: Piling on ghost marriages, corpse herding, spirit mediums, and other folk elements, but treating each superficially.

**Prevention**: Focus each story on one or two core folk elements and deeply excavate their cultural significance and horror potential. In the "Folk Rituals" field, focus on describing rituals directly relevant to the story rather than trying to cover everything.

#### 9.7 Rushed Endings

**Problem**: Spending extensive effort on buildup and atmosphere, but rushing the conclusion -- "A master came, performed a ceremony, and the ghost was captured."

**Prevention**: The ultimate confrontation must have ceremonial weight and cost commensurate with the preceding buildup. Resolving the supernatural is not "defeating a monster" but "settling karma" -- someone must bear the cost. End with appropriate aftertaste and blank space.

#### 9.8 Flat Fear Curve

**Problem**: Fear intensity remains constant throughout; no peaks and valleys; readers experience fatigue.

**Prevention**: Strictly follow the five-layer fear escalation structure (suggestion → doubt → confirmation → escalation → ultimate terror). Buffer between each layer with "normal life" or "investigation and reasoning" chapters. Fear is created through contrast -- the calmer the preceding segment, the greater the horror''s impact.

---

### X. Pre-Writing Checklist

Confirm before you start writing:

- [ ] Are the "Core Taboos and Rules" in the World setting specific, clear, and internally logical?
- [ ] Does the "Geography and Feng Shui Configuration" explain the supernatural causation from a metaphysical perspective?
- [ ] Are the ghost types in "Supernatural Ecology" consistent with the story''s theme?
- [ ] Is every main character''s "Karmic Burden" connected to the core event?
- [ ] Does each human character''s "Fate and Constitution" affect how they interact with the supernatural?
- [ ] Does each ghost character''s "Death Method" determine their abilities and weaknesses?
- [ ] Can the "Opening Suspense" in the Story Hook arouse reader curiosity within the first three chapters?
- [ ] Is the five-act structure complete (daily life → anomaly → investigation → truth → confrontation)?
- [ ] Does the fear curve show progressive escalation (suggestion → doubt → confirmation → escalation → ultimate terror)?
- [ ] Are horror techniques diverse (not just "a ghost suddenly appears")?
- [ ] Do scenes'' "Feng Shui Configuration" and "Rules and Taboos" serve the horror atmosphere?
- [ ] Do props'' "Usage Taboos" and "Side Effects and Costs" add dramatic tension?',
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
  novel_creation_method_id = VALUES(novel_creation_method_id),
  is_active = VALUES(is_active),
  sort_order = VALUES(sort_order),
  updated_at = NOW();
