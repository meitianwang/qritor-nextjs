-- 异世界修真穿越小说创作方法专属 Skill / Isekai Cultivation Crossing creation method Skill
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '异世界修真穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-xiuzhen-crossing-guide.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xiuzhen-crossing-guide',
  '异世界修真穿越小说创作指南：涵盖修真世界观构建、修炼体系设计、宗门生态、丹药法宝阵法体系、天劫叙事机制、灵石经济、穿越设定与修真里程碑式叙事结构',
  'Isekai cultivation crossing novel writing guide: covers cultivation worldview construction, cultivation system design, sect ecosystem, pill/artifact/formation systems, heavenly tribulation narrative mechanics, spirit stone economy, crossing setup, and cultivation-milestone narrative structure',
  '## 异世界修真穿越小说创作指南

本指南专为「异世界修真穿越小说」创作方法设计。修真穿越是中国网文中最具文化特色的类型之一，其核心是：一个现代人穿越到以道家文化为基底的修真世界，踏上求道飞升之路。

---

### 一、类型特征与核心美学

#### 1.1 修真穿越 vs 玄幻穿越

修真穿越与通用玄幻穿越有本质区别。理解这些差异是写好修真文的前提：

| 维度 | 修真穿越 | 玄幻穿越 |
|------|---------|---------|
| **文化根基** | 道家哲学、中国传统神话 | 泛东方奇幻或混合设定 |
| **力量来源** | 灵气、道、天地法则 | 斗气、魔力、异能等多种 |
| **终极目标** | 飞升成仙、与天同寿 | 称霸大陆、成为最强 |
| **社会单元** | 宗门、世家、散修 | 帝国、公会、学院 |
| **核心冲突** | 天劫、心魔、资源争夺、道之抉择 | 种族冲突、大陆争霸 |
| **经济基础** | 灵石、丹药、法宝交易 | 金币、魔晶等通用货币 |
| **叙事节奏** | 境界突破驱动 | 事件冲突驱动 |

#### 1.2 核心美学原则

- **道为根本**：一切设定的底层逻辑是「道」——天地运行的根本规则。天劫是天道的考验，修炼是对道的领悟，飞升是与道合一
- **因果自洽**：修真世界讲究因果报应，种因得果。金手指的获得、机缘的降临都应有因果逻辑
- **天人博弈**：修士是在与天争命。天道不允许逆天而行，每一次突破都是对天道的挑战
- **等级森严**：修为即地位。境界差一级，天壤之别。这是修真世界最硬的社会规则
- **资源为王**：灵石、灵药、矿脉、秘境——修真世界的一切冲突本质上都是资源之争

---

### 二、世界观设定（世界）

「世界」是 singleton 设定，是整个修真世界的根基。

#### 2.1 世界名称

取名要有仙侠韵味，暗示修真世界的特征：
- 好的示例：「苍穹仙域」「九天玄界」「太虚道域」「混沌灵界」
- 避免：过于现代或西方奇幻感的名称

#### 2.2 时代背景

修真世界的时代通常用纪元来表述：
- **上古时代**：天地初开，灵气充沛，大能遍地。适合作为传说背景
- **中古时代**：灵气渐衰，宗门崛起，秩序形成
- **末法时代**：灵气稀薄，修真艰难。适合制造穿越者的困境
- **灵气复苏**：灵气重新涌现，旧秩序崩塌。适合大变革剧情

时代背景决定了修炼难度和资源稀缺程度，直接影响主角的成长节奏。

#### 2.3 历史背景

修真世界的历史围绕几个核心主题：
- **上古大战**：仙魔大战、封神之战等远古事件，留下遗迹和传承
- **宗门兴衰**：哪些宗门曾经辉煌又衰落，为什么
- **天才传说**：历史上的天才修士（万年一遇的天灵根、逆天渡劫成功者）
- **禁忌历史**：某些被封印的真相、被禁止的功法来源

#### 2.4 地理版图

修真世界的地理与灵气分布密切相关：
- **灵脉分布**：灵气浓郁之处是宗门驻地、修炼圣地
- **洞天福地**：独立小空间，通常是大能遗留，内含传承和宝物
- **秘境**：定期开启的危险区域，充满机缘和凶险
- **禁地**：极度危险之处，往往封印着上古凶兽或魔物
- **凡人界与修真界**：是否有界限？如何互通？
- **上界与下界**：是否存在更高层次的世界？飞升去往何处？

#### 2.5 种族格局

修真世界常见种族及其修炼特点：
- **人族**：数量最多，资质参差，靠功法和丹药弥补
- **妖族**：以兽修为主，化形需要渡劫，天赋各异
- **魔族**：修炼魔功，速度快但容易入魔
- **灵族**：天生亲近某种灵力（如木灵族、冰灵族）
- 种族设定影响角色设计，主角穿越后可能面临种族歧视或种族优势

#### 2.6 政治格局

修真世界的政治格局由实力决定：
- **一方霸主**：化神/渡劫期老祖坐镇的超级大宗门
- **四方势力**：几大宗门或世家的势力均衡
- **散修联盟**：无门无派的散修组织
- **暗势力**：魔道、邪修、禁忌组织
- 政治格局要标注各势力的修为上限（镇派老祖的境界）

#### 2.7 社会制度

修真社会的独特制度：
- **宗门制度**：宗主 → 长老 → 内门弟子 → 外门弟子 → 杂役弟子
- **世家制度**：家主 → 嫡系 → 旁系 → 附庸
- **散修规则**：坊市交易、拍卖会、佣兵任务
- **天道律令**：修真世界的硬性规则（如渡劫不可外力干预、以大欺小会遭天罚）

#### 2.8 经济民生

灵石经济是修真世界的命脉：
- **货币体系**：下品灵石 → 中品灵石 → 上品灵石 → 极品灵石（通常 100:1 递进）
- **核心资源**：灵草灵药、矿石材料、丹药成品、法宝法器
- **交易场所**：坊市、拍卖行、宗门内部兑换
- **资源争夺**：灵脉矿脉的归属权是宗门间冲突的主要原因
- **凡人经济**：灵石经济与凡人的金银经济如何共存

#### 2.9 文化风俗

修真世界的文化以道家文化为底色：
- **修炼文化**：闭关、论道、斗法、切磋
- **师徒关系**：一日为师终身为父，师门传承是核心纽带
- **宗门大比**：定期举行的门派比武/炼丹/炼器大会
- **天才排行**：各种排行榜（天骄榜、丹师榜、法宝榜）
- **寿元观念**：修为越高寿命越长，凡人在修士眼中如蝼蚁

#### 2.10 核心禁忌与规则

修真世界的天道规则是不可违背的铁律：
- **天劫规则**：突破特定境界必须渡劫，渡劫失败则形神俱灭
- **因果律**：欠下因果必须偿还，强行抹杀因果会遭天道反噬
- **大道五十天衍四九**：天道总留一线生机
- **以大欺小**：高境界修士欺压低境界者会遭天道惩罚（限制条件需明确）
- **禁忌功法**：某些功法会引来天罚（如夺舍、炼魂、逆天改命术）

---

### 三、修炼体系设定

修炼体系是修真小说的骨架。

#### 3.1 力量体系类型

本方法的修炼体系类型字段支持：修真、魔法、斗气、异能、混合。推荐选择**修真**，也可选择**混合**（修真为主、辅以其他）。

#### 3.2 境界划分

经典修真境界划分（可根据需要增减）：

```
练气期 → 筑基期 → 金丹期 → 元婴期 → 化神期 → 渡劫期 → 大乘期 → 飞升
```

每个境界需要定义：

| 要素 | 说明 |
|------|------|
| **境界名称** | 如「练气期」「筑基期」 |
| **细分层级** | 如练气一到十二层，金丹初期/中期/后期/大圆满 |
| **突破条件** | 所需资源、领悟、契机 |
| **能力提升** | 该境界解锁的能力（御剑飞行、神识探查、领域等） |
| **寿元增幅** | 每个境界对应的寿命上限 |
| **天劫等级** | 哪些境界突破需要渡劫 |

**设计要点**：
- 前期境界（练气→筑基→金丹）是主角成长的主战场，要细化
- 后期境界不宜过多，避免境界注水
- 每个境界之间的实力差距要明确（金丹对练气就是碾压）

#### 3.3 修炼资源

| 资源类型 | 说明 | 叙事功能 |
|---------|------|---------|
| **灵根** | 修炼的天赋根基（金木水火土、变异灵根、天灵根） | 决定起点和上限 |
| **功法** | 修炼的核心方法，分等级（凡品/灵品/仙品） | 主角成长的核心 |
| **灵石** | 修炼货币和资源 | 经济驱动 |
| **丹药** | 辅助修炼、疗伤、突破 | 关键道具 |
| **灵草灵药** | 炼丹原材料 | 探险/采集驱动 |
| **法宝法器** | 战斗武器和辅助器具 | 战力提升 |
| **阵法材料** | 布阵所需材料 | 防御/攻击/辅助 |

#### 3.4 功法/职业分支

修真世界的专业化路径：

| 分支 | 核心能力 | 社会地位 | 叙事价值 |
|------|---------|---------|---------|
| **丹道** | 炼丹，制作丹药 | 极高，受各方拉拢 | 经济线、辅助修炼线 |
| **器道** | 炼器，打造法宝 | 高 | 战力提升线 |
| **阵道** | 布阵，攻防一体 | 高 | 战术线、防御线 |
| **符道** | 制符，灵活多变 | 中高 | 战斗辅助线 |
| **剑修** | 纯粹以剑入道 | 战力最强 | 战斗核心线 |
| **体修** | 淬炼肉身 | 罕见 | 近身战斗线 |
| **魂修** | 修炼神魂 | 神秘 | 精神攻击线 |

主角通常主修一道、辅修一到两道。过多分支会导致焦点分散。

#### 3.5 能力上限与代价

- **修炼瓶颈**：灵根品质限制上限、功法等级限制天花板
- **突破代价**：需要珍稀资源、特殊机缘、甚至生死历练
- **走火入魔**：修炼过快或功法不当会导致走火入魔
- **心魔**：内心执念化为心魔，是突破高境界的最大障碍
- **天劫威力**：渡劫期天劫的强度与修士逆天程度成正比

#### 3.6 禁忌与风险

- **魔功**：速度快但容易入魔，且被正道追杀
- **夺舍**：夺取他人肉身，被天道和修真界共同禁止
- **炼魂**：折磨灵魂提升修为，罪大恶极
- **逆天改命**：强行改变天道注定的命运，代价极大
- **使用禁忌法宝**：某些法宝需要以寿元或修为为代价

#### 3.7 代表性能力

每个境界的标志性能力，让读者直观感受实力差距：
- 练气：引气入体、基础术法
- 筑基：御物飞行、简单法术
- 金丹：御剑飞行、金丹自爆（同归于尽）
- 元婴：元婴出窍、分身术
- 化神：领域展开、虚空挪移
- 渡劫：渡天劫、法则之力
- 大乘：撕裂空间、接近仙人之力
- 飞升：超脱三界、成就仙位

---

### 四、穿越设定

穿越设定是修真穿越文的起点。

#### 4.1 穿越方式

修真穿越常见方式及其叙事特点：

| 方式 | 特点 | 适合基调 |
|------|------|---------|
| 意外身亡后魂穿 | 继承原身记忆和人际关系，有废材逆袭感 | 宗门崛起、逆袭爽文 |
| 被神秘力量召唤 | 有使命感，暗示穿越背后有大手在推动 | 宏大叙事、天命之子 |
| 雷击穿越 | 经典干脆，可与天劫产生呼应 | 各类均可 |
| 梦中穿越 | 温和过渡 | 轻松文、日常种田 |
| 触碰古物穿越 | 古物可能是仙器/法宝的碎片，伏笔 | 带有寻宝线索的故事 |

#### 4.2 目的地类型

穿越到什么类型的修真世界：
- **正统修真界**：宗门林立、灵气充沛的经典修真世界
- **末法修真界**：灵气稀薄、修真式微的衰落世界（增加难度）
- **蛮荒修真界**：未开化、危机四伏的原始修真世界
- **高武修真界**：修为天花板极高、强者众多的世界

#### 4.3 穿越身份

| 身份 | 起点 | 叙事优势 |
|------|------|---------|
| 宗门废材弟子 | 极低 | 逆袭感强，读者代入感好 |
| 世家旁系子弟 | 低 | 有基础资源但受排挤 |
| 散修 | 中 | 自由度高但无靠山 |
| 宗门核心弟子 | 高 | 起点高但树敌多 |
| 凡人 | 极低 | 从零开始，成长曲线最完整 |

最经典的穿越身份是「宗门废材弟子」——原身资质差、被人欺辱，穿越者凭借金手指逆天改命。

#### 4.4 核心目标

- **飞升成仙**：修真文的终极目标
- **逆天改命**：改变原身的悲惨命运
- **守护所爱**：保护师门、家人、道侣
- **探索大道**：纯粹追求修炼之道的真谛
- **复仇**：为原身或师门报仇

#### 4.5 故事基调

- **热血爽文**：金手指强力，一路碾压，痛快升级
- **稳扎稳打**：注重修炼过程和领悟，慢热但有深度
- **险中求生**：处处危机，步步为营，紧张刺激
- **轻松日常**：种田炼丹，悠闲修仙，偶尔冒险

#### 4.6 感情线

修真文的感情线有独特特点：
- **道侣**：修真世界的伴侣概念，共同修炼、互相扶持
- **双修**：特殊的修炼方式，可作为感情线与修炼线的交汇点
- **寿元差距**：修为不同导致寿命差异，是天然的感情冲突
- **飞升抉择**：一方先飞升，另一方怎么办？经典虐点

---

### 五、金手指设定

#### 5.1 金手指类型

修真穿越常见金手指及其适配性：

| 类型 | 说明 | 适合主线 |
|------|------|---------|
| **系统** | 任务奖励型辅助系统 | 各类，尤其升级爽文 |
| **神器** | 上古神器/仙器认主 | 战斗流、寻宝流 |
| **天赋** | 变异灵根、特殊体质 | 修炼流 |
| **血脉** | 上古神兽/仙人血脉觉醒 | 热血战斗流 |
| **灵宠** | 上古灵兽陪伴成长 | 轻松冒险流 |
| **外挂记忆** | 上古大能的传承记忆 | 知识流、底蕴流 |
| **科技道具** | 现代科技在修真世界的应用 | 创新流、种田流 |
| **其他** | 时间加速空间、丹药鉴定等 | 自由发挥 |

#### 5.2 能力描述

金手指需要具体化：
- 系统类：什么任务类型？奖励机制？积分兑换表？
- 神器类：什么等级？有哪些能力？如何与修为联动？
- 天赋类：变异灵根具体是什么属性？提升修炼速度几倍？
- 血脉类：什么血脉？觉醒条件？阶段性能力？

#### 5.3 使用限制

**没有限制的金手指会毁掉修真文的修炼张力**：
- 系统类：任务冷却、积分不足、特定条件触发
- 神器类：修为不够无法催动全部能力、需要特殊材料修复
- 天赋类：初期不稳定、需要特殊功法配合才能发挥
- 血脉类：觉醒需要特定条件、暴走风险

#### 5.4 成长空间

金手指应随修为提升而成长：
- 练气期：基础辅助功能
- 筑基期：解锁新能力
- 金丹期：质变升级
- 元婴期：核心能力完整
- 后期：终极形态

#### 5.5 获得方式

- 穿越时自带（灵魂融合时获得）
- 穿越后机缘获得（秘境中得到、被长辈赠予）
- 逐步觉醒（随修为提升慢慢显现）

---

### 六、故事钩子设定

#### 6.1 故事钩子

修真穿越的钩子通常围绕「逆袭」展开：
- 废材弟子觉醒，在宗门大比前夕获得金手指
- 穿越后发现宗门三个月后就会被灭门
- 原身被退婚/被逐出宗门，立誓要让所有人后悔

#### 6.2 核心卖点

区别于其他修真穿越的独特之处：
- 独特的修炼体系？（不是千篇一律的境界划分）
- 新颖的金手指？（不是万能系统）
- 独特的宗门设定？（不是模板化的宗门）
- 丹道/器道/阵道为核心的非战斗流？

#### 6.3 开篇悬念

前三章就要建立的悬念：
- 穿越后面临的第一个危机（宗门试炼、被人挑衅、资源被抢）
- 金手指的首次展示（但不要一次性展示全部能力）
- 暗示更大的阴谋或机缘

#### 6.4 读者期待

明确读者追书的核心期待：
- 升级爽感（境界突破的满足感）
- 打脸快感（废材逆袭打脸装逼者）
- 探索乐趣（秘境探险、丹药法宝收集）
- 智斗快感（以弱胜强的策略博弈）

---

### 七、文风设定

#### 7.1 叙事视角

- **第三人称有限**：最常用，兼顾代入感和叙事灵活性
- **第一人称**：适合日记体修仙、轻松吐槽风
- **第三人称全知**：适合多线并行的宏大修真叙事

#### 7.2 语言风格

| 风格 | 特点 | 适合类型 |
|------|------|---------|
| 半文半白 | 有古韵但不晦涩，最通用 | 正统修真 |
| 现代轻松 | 口语化，内心吐槽多 | 轻松修仙、日常流 |
| 古风雅致 | 辞藻优美，意境深远 | 仙侠风、文艺修真 |
| 热血简练 | 节奏快，动作描写多 | 战斗流、爽文 |

#### 7.3 描写侧重

- **修炼描写**：突破时的感官体验、灵气运转、天地异象
- **战斗描写**：法术对轰、法宝碰撞、领域对决
- **环境描写**：灵气浓郁的仙山、阴森的秘境、壮阔的天劫场面
- **心理描写**：悟道时的心境变化、面对天劫的恐惧与决绝

#### 7.4 节奏把控

- **修炼段落**：可以适当加速，避免流水账式修炼描写
- **战斗段落**：快节奏，紧张刺激，招式要有想象力
- **探险段落**：中等节奏，保持悬念和发现感
- **日常段落**：慢节奏，用于角色塑造和关系发展
- **突破段落**：先慢后快，蓄力后爆发，是每个小高潮的核心

#### 7.5 禁用词汇

列出不应出现在修真文中的现代词汇：
- 现代科技词汇（手机、电脑、网络等——除非主角内心独白）
- 西方奇幻词汇（魔法、骑士、精灵——除非设定中有跨界元素）
- 过于网络化的用语（除非是轻松搞笑风格）

---

### 八、角色设计

#### 8.1 角色核心属性

修真小说角色的 Schema 包含以下核心字段：
- **种族**：人族、妖族、魔族、灵族等
- **修为境界**：当前修为等级和细分层级

#### 8.2 角色类型模板

**主角（穿越者）**：
- 灵根资质：通常起点低（废灵根/杂灵根），后期通过金手指逆转
- 修炼速度：因金手指而异于常人
- 性格：需要有现代人的思维方式，但逐渐适应修真世界的弱肉强食
- 底线：即使在修真世界也要保持的原则（不滥杀无辜 vs 果断心狠）

**师尊/长辈**：
- 修为极高但有自己的局限性
- 对主角的态度（严厉培养/放任自流/暗中保护）
- 有自己的故事线和敌人

**同门师兄弟/姐妹**：
- 有的是盟友，有的是竞争对手
- 嫉妒主角的存在感要合理——资源有限，竞争是自然的

**道侣（感情线核心）**：
- 需要有独立的修炼之路和实力
- 不能沦为花瓶——修真世界不养闲人
- 与主角的修为差距是天然的情感张力来源

**反派**：
- 宗门内的恶意师兄/长老
- 敌对宗门的天才弟子
- 魔道/邪修势力
- 天道本身（作为终极对手）

#### 8.3 宗门生态中的角色关系

宗门是修真文最重要的社会单元，角色关系围绕宗门展开：

```
宗主（化神/渡劫期）
 ├── 大长老（元婴后期）
 ├── 二长老（元婴中期）
 ├── ...
 ├── 内门首席（金丹后期）
 │    ├── 内门弟子甲（金丹初期）
 │    ├── 内门弟子乙（筑基后期）
 │    └── ...
 ├── 外门弟子（筑基期为主）
 └── 杂役弟子（练气期）← 主角通常从这里开始
```

---

### 九、宗门与势力设计

#### 9.1 宗门等级体系

| 宗门等级 | 镇派实力 | 弟子规模 | 控制范围 |
|---------|---------|---------|---------|
| 一流宗门 | 化神/渡劫期 | 万人以上 | 一方霸主 |
| 二流宗门 | 元婴期 | 千到万人 | 区域势力 |
| 三流宗门 | 金丹期 | 百到千人 | 小势力 |
| 小门派 | 筑基期 | 百人以下 | 一城一地 |

#### 9.2 宗门内部结构

每个宗门应定义：
- **镇派之宝**：宗门的核心法宝或阵法
- **传承功法**：宗门核心功法和特色功法
- **内外门制度**：晋升条件、资源分配规则
- **宗门大比**：选拔机制和奖励
- **宗门任务**：日常任务体系（采药、狩妖、巡逻）

#### 9.3 宗门间关系

- **盟友**：共同对抗外敌
- **竞争**：争夺灵脉、矿脉、秘境资源
- **从属**：小宗门依附大宗门
- **敌对**：正道与魔道的根本对立

#### 9.4 其他势力类型

- **世家**：以血脉传承为核心的家族势力
- **散修联盟**：无门无派修士的松散组织
- **商会**：经营灵石、丹药、法宝交易的商业组织
- **神秘组织**：暗中操控局势的隐藏势力

---

### 十、叙事结构：修真里程碑式叙事

修真小说的叙事节奏由境界突破驱动，形成独特的里程碑式结构。

#### 10.1 修真叙事的核心循环

每一个境界段落都遵循同样的叙事循环：

```
获取资源/功法 → 修炼/领悟 → 遭遇冲突 → 以战养战 → 境界突破 → 新天地展开
```

#### 10.2 推荐叙事框架

```
第一卷：测灵根·入宗门
  穿越降临 → 发现灵根/获得修炼机缘 → 加入宗门 → 底层生存 → 金手指初显

第二卷：内外门·宗门大比
  从杂役到外门 → 修炼进境 → 宗门大比 → 崭露头角 → 内门弟子

第三卷：秘境探险·金丹之路
  秘境开启 → 九死一生 → 获得机缘 → 结金丹 → 实力飞跃

第四卷：宗门危机·元婴之境
  宗门遭遇外敌 → 出门历练 → 广交势力 → 元婴突破 → 成为宗门支柱

第五卷（及以后）：天劫飞升
  化神修炼 → 天劫降临 → 渡劫成功/失败 → 大乘期 → 飞升之路
```

#### 10.3 天劫作为叙事高潮

天劫是修真小说最具仪式感的叙事节点：

**天劫的叙事功能**：
- **检验点**：考验主角至今积累的全部实力
- **生死关**：真正的生死危机，不是打怪升级可以替代的
- **公开事件**：天劫的异象会吸引各方关注，引发新的冲突
- **成长标志**：渡劫成功后实力质变，开启新的叙事阶段

**天劫场景设计**：
- 天劫前的准备（布阵、丹药、护道者的安排）
- 天劫中的九死一生（九九天劫、紫色天劫等变异天劫增加惊险度）
- 天劫后的蜕变（实力飞跃、引发各方反应）

#### 10.4 关键场景类型

修真世界的标志性场景：

| 场景类型 | 叙事功能 | 示例 |
|---------|---------|------|
| **宗门山门** | 主角的据点和归属 | 青云峰、内门大殿 |
| **坊市** | 交易、情报收集、社交 | 天机坊市、黑市 |
| **秘境** | 冒险、机缘、战斗 | 上古仙人洞府、混沌秘境 |
| **洞天福地** | 修炼、闭关 | 灵泉洞天、药园福地 |
| **渡劫圣地** | 天劫场景 | 天劫台、荒无人烟的绝地 |
| **禁地** | 高风险高回报探险 | 万妖山、血海禁地 |
| **战场** | 大规模宗门冲突 | 灵脉争夺战场、宗门门前 |
| **拍卖会** | 资源获取、信息窗口 | 天机阁拍卖会 |

---

### 十一、丹药/法宝/阵法体系

这三大体系是修真世界的支柱，也是丰富剧情的重要工具。

#### 11.1 丹药体系

丹药是修真世界的刚需：
- **等级划分**：一到九品丹药（或凡品/灵品/仙品）
- **核心丹药**：培元丹（修炼）、筑基丹（突破）、疗伤丹、解毒丹、破境丹
- **炼丹要素**：药方 + 灵火 + 丹炉 + 炼丹师手法
- **成功率**：丹药炼制有失败概率，增加紧张感
- **丹毒问题**：服用丹药过多会积累丹毒，限制滥用

#### 11.2 法宝体系

法宝是修士的战力倍增器：
- **等级划分**：法器 → 灵器 → 宝器 → 仙器 → 神器
- **成长型法宝**：随主角修为一起成长的本命法宝（适合长篇）
- **炼器要素**：材料 + 炼器火 + 阵纹 + 炼器师手法
- **认主**：法宝认主的条件（血祭、神识烙印等）

#### 11.3 阵法体系

阵法是修真世界的基础设施：
- **护宗大阵**：宗门的防御核心
- **攻击阵法**：困敌、杀敌
- **辅助阵法**：聚灵阵（加速修炼）、隐匿阵
- **天然阵法**：秘境中的远古阵法
- **阵法等级**：与布阵者修为和材料品质挂钩

---

### 十二、常见陷阱

| 陷阱 | 问题 | 正确做法 |
|------|------|---------|
| **境界注水** | 境界划分太多太细，读者审美疲劳 | 控制在 8-10 个大境界，前期细分后期简化 |
| **法宝通货膨胀** | 每个对手都有新法宝，读者记不住 | 主角法宝控制在 3-5 件核心装备，重点刻画 |
| **宗门设定前后不一** | 宗门实力、制度前后矛盾 | 在「世界」设定中明确宗门体系，严格遵守 |
| **丹药万能** | 所有问题都靠吃药解决 | 设计丹毒机制、药效递减、稀有度限制 |
| **战斗模式单一** | 每次都是"比谁法力深厚" | 结合法宝、阵法、丹药、环境、智谋多维战斗 |
| **修炼流水账** | "闭关三个月，突破了" | 用关键节点代替过程描写，突破场景要有仪式感 |
| **金手指无限制** | 系统给什么都有，没有挑战 | 严格限制金手指的使用条件和冷却 |
| **种族/宗门模板化** | 所有宗门都是一个模式 | 给每个宗门独特的功法路线、文化特色和利益诉求 |
| **感情线生硬** | 见面就爱上，没有铺垫 | 利用修炼中的生死相依、共同成长来发展感情 |
| **凡人视角缺失** | 修真世界没有凡人存在感 | 偶尔展示修士行为对凡人的影响，增加世界真实感 |

---

### 十三、可用实体类别

本创作方法的 `visible_categories` 包含以下类别：

| 类别 | 用途 |
|------|------|
| **setting** | 世界观、修炼体系、穿越设定、金手指、故事钩子、文风设定 |
| **character** | 所有角色（主角、师尊、同门、道侣、反派等） |
| **organization** | 宗门、世家、散修联盟、商会等势力 |
| **scene** | 场景（宗门、坊市、秘境、洞天、渡劫圣地等） |
| **chapter** | 章节 |

#### 推荐创建顺序

1. **设定**：世界观 → 修炼体系 → 穿越设定 → 金手指 → 故事钩子 → 文风设定
2. **势力**：主角宗门 → 敌对宗门 → 其他势力（2-4个）
3. **角色**：主角 → 师尊 → 同门 → 道侣 → 反派
4. **场景**：宗门 → 坊市 → 秘境 → 渡劫圣地
5. **章节**：按卷规划，先创建前 10 章

---

### 十四、创作检查清单

开始写作前确认：

- [ ] 修炼境界体系是否完整且每级差距明确
- [ ] 灵石经济体系是否自洽（物价、资源稀缺度）
- [ ] 宗门等级和内部制度是否清晰
- [ ] 天劫规则是否明确（哪些境界渡劫、失败后果）
- [ ] 金手指是否有明确的使用限制和成长曲线
- [ ] 丹药/法宝/阵法等级体系是否统一
- [ ] 主角的灵根资质和修炼路线是否合理
- [ ] 穿越身份和起始处境是否有足够的戏剧张力
- [ ] 文风设定中的禁用词汇是否已列出
- [ ] 第一个叙事高潮（宗门大比/秘境探险）是否已规划',
  '## Isekai Cultivation Crossing Novel Writing Guide

This guide is designed specifically for the "Isekai Cultivation Crossing Novel" (异世界修真穿越小说) creation method. The isekai cultivation crossing is one of the most culturally distinctive genres in Chinese web fiction. Its core concept: a modern person crosses into a Daoist-cultivation-based xiuzhen world and embarks on a path toward ascension to immortality.

---

### I. Genre Characteristics and Core Aesthetics

#### 1.1 Cultivation Crossing vs. Generic Xuanhuan Crossing

Cultivation (xiuzhen) crossing is fundamentally distinct from generic xuanhuan crossing. Understanding these differences is essential for writing authentic xiuzhen fiction:

| Dimension | Xiuzhen Crossing | Xuanhuan Crossing |
|-----------|-----------------|-------------------|
| **Cultural foundation** | Daoist philosophy, Chinese traditional mythology | Pan-Eastern fantasy or mixed settings |
| **Power source** | Spiritual energy (灵气), the Dao, laws of heaven and earth | Battle qi, mana, supernatural abilities |
| **Ultimate goal** | Ascension to immortality, eternal life | Continental domination, becoming the strongest |
| **Social units** | Sects (宗门), clans, rogue cultivators | Empires, guilds, academies |
| **Core conflicts** | Heavenly tribulations, inner demons, resource competition, choices of the Dao | Racial conflicts, continental power struggles |
| **Economic basis** | Spirit stones, pills, artifact trading | Gold coins, magic crystals |
| **Narrative rhythm** | Driven by cultivation realm breakthroughs | Driven by event-based conflicts |

#### 1.2 Core Aesthetic Principles

- **The Dao as foundation**: The underlying logic of all settings is "the Dao" -- the fundamental rules governing heaven and earth. Tribulations are tests of the heavenly Dao; cultivation is comprehension of the Dao; ascension is unity with the Dao
- **Karmic consistency**: The xiuzhen world follows karma and cause-and-effect. The acquisition of cheat abilities and fortunate encounters should all have karmic logic
- **Mortal vs. Heaven**: Cultivators contend against heaven for their fate. The heavenly Dao does not permit defiance; every breakthrough is a challenge to heaven''s will
- **Strict hierarchy**: Cultivation level equals status. One realm of difference is an unbridgeable gulf. This is the hardest social rule in the xiuzhen world
- **Resources are king**: Spirit stones, spiritual herbs, mineral veins, secret realms -- all conflicts in the xiuzhen world are fundamentally about resources

---

### II. World Setting (The World)

The "World" (世界) is a singleton setting and the foundation of the entire xiuzhen world.

#### 2.1 World Name (世界名称)

Choose a name with xianxia flavor that hints at the cultivation world''s character:
- Good examples: "Empyrean Immortal Domain," "Nine Heavens Mystic Realm," "Grand Void Dao Domain," "Primordial Spirit Realm"
- Avoid: Names that feel overly modern or Western-fantasy

#### 2.2 Era Background (时代背景)

Xiuzhen world eras are typically expressed in epochs:
- **Primordial Age**: When heaven and earth first separated; spiritual energy was abundant; powerful beings were everywhere. Best as legendary backstory
- **Middle Antiquity**: Spiritual energy waning; sects rising; order forming
- **Dharma-Ending Age**: Spiritual energy sparse; cultivation is arduous. Creates difficulty for the crosser
- **Spiritual Energy Revival**: Spiritual energy resurging; old order collapsing. Suits upheaval-driven plots

The era background determines cultivation difficulty and resource scarcity, directly affecting the protagonist''s growth pacing.

#### 2.3 Historical Background (历史背景)

Xiuzhen world history revolves around several core themes:
- **Primordial Wars**: Immortal-demon wars, deity-sealing battles, and other ancient events that left behind ruins and legacies
- **Sect rise and fall**: Which sects once flourished and declined, and why
- **Genius legends**: Historical cultivation prodigies (once-in-ten-thousand-years heavenly spirit root bearers, those who defied the odds to survive tribulations)
- **Forbidden history**: Sealed truths and banned cultivation techniques

#### 2.4 Geographical Territory (地理版图)

Xiuzhen world geography is intimately linked to spiritual energy distribution:
- **Spiritual vein distribution**: Areas rich in spiritual energy serve as sect headquarters and cultivation sanctuaries
- **Grotto heavens and blessed lands** (洞天福地): Independent pocket dimensions, usually left by ancient powerhouses, containing legacies and treasures
- **Secret realms** (秘境): Periodically opening dangerous areas filled with fortune and peril
- **Forbidden zones** (禁地): Extremely dangerous areas, often sealing ancient fierce beasts or demons
- **Mortal world and cultivation world**: Is there a boundary? How do they connect?
- **Upper and lower realms**: Do higher-level worlds exist? Where does ascension lead?

#### 2.5 Racial Landscape (种族格局)

Common races in xiuzhen worlds and their cultivation characteristics:
- **Humans**: Most numerous, varied aptitudes, compensate with techniques and pills
- **Demon beasts (妖族)**: Primarily beast cultivators; taking human form requires surviving tribulation; varied innate talents
- **Devil race (魔族)**: Practice demonic arts; fast progress but prone to demonic corruption
- **Spirit race (灵族)**: Naturally attuned to certain elements (e.g., wood spirits, ice spirits)
- Racial settings affect character design; the protagonist may face racial discrimination or racial advantages after crossing

#### 2.6 Political Landscape (政治格局)

The political landscape of the xiuzhen world is determined by power:
- **Regional hegemon**: A super-sect anchored by a Deity Transformation / Tribulation Transcendence patriarch
- **Four-power balance**: Several major sects or clans in equilibrium
- **Rogue cultivator alliance**: Organization of unaffiliated cultivators
- **Shadow forces**: Demonic cultivators, heretical practitioners, forbidden organizations
- Mark each faction''s cultivation ceiling (the patriarch''s realm level)

#### 2.7 Social Systems (社会制度)

Unique institutions of xiuzhen society:
- **Sect hierarchy**: Sect Master -> Elders -> Inner Disciples -> Outer Disciples -> Menial Disciples
- **Clan system**: Patriarch -> Main line -> Branch lines -> Vassals
- **Rogue cultivator rules**: Market city trading, auctions, mercenary missions
- **Heavenly Dao mandates**: Hard rules of the xiuzhen world (e.g., no external interference during tribulation crossing, bullying those far below your level incurs heavenly punishment)

#### 2.8 Economy and Livelihood (经济民生)

The spirit stone economy is the lifeblood of the xiuzhen world:
- **Currency system**: Low-grade spirit stones -> Mid-grade spirit stones -> High-grade spirit stones -> Supreme-grade spirit stones (typically 100:1 progression)
- **Core resources**: Spiritual herbs and medicines, ores and materials, refined pills, artifacts
- **Trading venues**: Market cities (坊市), auction houses, intra-sect exchanges
- **Resource competition**: Ownership of spiritual veins and mineral veins is the primary cause of inter-sect conflict
- **Mortal economy**: How spirit stone economy and mortal gold/silver economy coexist

#### 2.9 Cultural Customs (文化风俗)

Xiuzhen world culture has a Daoist cultural base:
- **Cultivation culture**: Secluded cultivation (闭关), Dao discussions (论道), technique duels (斗法), sparring
- **Master-disciple relationships**: "A master for a day is a father for life"; sect lineage is the core bond
- **Sect tournaments** (宗门大比): Periodic sect competitions in combat, pill refining, or artifact forging
- **Genius rankings**: Various ranking lists (Heavenly Pride List, Alchemist Ranking, Artifact Ranking)
- **Lifespan concept**: Higher cultivation means longer life; mortals are like ants in cultivators'' eyes

#### 2.10 Core Taboos and Rules (核心禁忌与规则)

The heavenly Dao rules of the xiuzhen world are inviolable iron laws:
- **Tribulation rules**: Breaking through certain realms requires surviving heavenly tribulation; failure means complete annihilation of body and soul
- **Karmic law**: Debts of karma must be repaid; forcibly erasing karma invites backlash from the heavenly Dao
- **The Dao leaves a thread of hope**: "Of the fifty ways of the Great Dao, forty-nine are used" -- heaven always leaves one chance
- **Bullying the weak**: High-realm cultivators oppressing far-lower ones may incur heavenly punishment (specify conditions clearly)
- **Forbidden techniques**: Certain practices invite heavenly punishment (body seizure, soul refining, fate-defying arts)

---

### III. Cultivation System Setting

The cultivation system is the skeleton of a xiuzhen novel.

#### 3.1 Power System Type

This method''s cultivation system type field supports: Xiuzhen, Magic, Battle Qi, Supernatural Abilities, Hybrid. **Xiuzhen** is recommended, or **Hybrid** (primarily xiuzhen with supplementary elements).

#### 3.2 Realm Division (境界划分)

The classic xiuzhen realm progression (adjustable as needed):

```
Qi Refining -> Foundation Building -> Golden Core -> Nascent Soul -> Deity Transformation -> Tribulation Transcendence -> Mahayana -> Ascension
```

Each realm requires definition:

| Element | Description |
|---------|-------------|
| **Realm name** | e.g., "Qi Refining" (练气期), "Foundation Building" (筑基期) |
| **Sub-levels** | e.g., Qi Refining layers 1-12; Golden Core early/mid/late/perfection |
| **Breakthrough conditions** | Required resources, comprehension, catalyst |
| **Ability upgrades** | Abilities unlocked at each realm (sword flight, divine sense scanning, domain, etc.) |
| **Lifespan increase** | Maximum lifespan at each realm |
| **Tribulation level** | Which realm breakthroughs require tribulation |

**Design tips**:
- Early realms (Qi Refining -> Foundation Building -> Golden Core) are the protagonist''s main growth arena; detail them thoroughly
- Avoid too many late-stage realms to prevent "realm inflation"
- Make the power gap between each realm explicit (Golden Core vs. Qi Refining is absolute dominance)

#### 3.3 Cultivation Resources (修炼资源)

| Resource Type | Description | Narrative Function |
|--------------|-------------|-------------------|
| **Spirit roots** (灵根) | Innate cultivation aptitude (metal/wood/water/fire/earth, variant roots, heavenly spirit root) | Determines starting point and ceiling |
| **Cultivation techniques** (功法) | Core methods, ranked by grade (mortal/spiritual/immortal) | Core of protagonist growth |
| **Spirit stones** (灵石) | Cultivation currency and resource | Economic driver |
| **Pills** (丹药) | Assist cultivation, heal injuries, aid breakthroughs | Key items |
| **Spiritual herbs** (灵草灵药) | Raw materials for alchemy | Exploration/collection driver |
| **Artifacts** (法宝法器) | Combat weapons and auxiliary tools | Power multiplier |
| **Formation materials** (阵法材料) | Materials for constructing formations | Defense/offense/support |

#### 3.4 Technique / Specialization Paths (功法/职业分支)

Specialization paths in the xiuzhen world:

| Path | Core Ability | Social Status | Narrative Value |
|------|-------------|---------------|-----------------|
| **Alchemy** (丹道) | Pill refining | Extremely high; sought by all factions | Economic line, cultivation support |
| **Artifact Forging** (器道) | Crafting artifacts | High | Combat power line |
| **Formation Dao** (阵道) | Setting formations; offense and defense | High | Tactical and defensive line |
| **Talisman Dao** (符道) | Creating talismans; versatile | Medium-high | Combat support line |
| **Sword Cultivation** (剑修) | Pure sword-based Dao pursuit | Highest combat power | Core combat line |
| **Body Cultivation** (体修) | Tempering the physical body | Rare | Close combat line |
| **Soul Cultivation** (魂修) | Cultivating the divine soul | Mysterious | Mental attack line |

The protagonist typically specializes in one path with one or two supplementary ones. Too many paths dilute focus.

#### 3.5 Power Ceilings and Costs (能力上限与代价)

- **Cultivation bottlenecks**: Spirit root quality limits ceiling; technique grade limits potential
- **Breakthrough costs**: Requires rare resources, special opportunities, or even life-and-death trials
- **Cultivation deviation** (走火入魔): Cultivating too fast or using improper techniques causes deviation
- **Inner demons** (心魔): Inner obsessions manifest as demons; the biggest obstacle to high-realm breakthroughs
- **Tribulation intensity**: Heavenly tribulation strength is proportional to how much the cultivator defies heaven

#### 3.6 Taboos and Risks (禁忌与风险)

- **Demonic arts**: Fast progress but prone to corruption, hunted by righteous sects
- **Body seizure** (夺舍): Taking another''s body; forbidden by both heavenly Dao and the cultivation community
- **Soul refining** (炼魂): Torturing souls to boost cultivation; an unforgivable crime
- **Fate defiance** (逆天改命): Forcibly altering heaven-ordained destiny; comes at extreme cost
- **Forbidden artifacts**: Certain artifacts require lifespan or cultivation as payment

#### 3.7 Signature Abilities (代表性能力)

Iconic abilities at each realm to help readers viscerally feel power differences:
- Qi Refining: Draw spiritual energy into the body, basic spells
- Foundation Building: Object-flight, simple techniques
- Golden Core: Sword flight, golden core self-detonation (mutual destruction)
- Nascent Soul: Soul projection, clone techniques
- Deity Transformation: Domain deployment, void shifting
- Tribulation Transcendence: Surviving heavenly tribulation, law-based power
- Mahayana: Space tearing, near-immortal power
- Ascension: Transcending the three realms, achieving immortal status

---

### IV. Crossing Setting

The crossing setup is the starting point of the xiuzhen crossing novel.

#### 4.1 Crossing Method (穿越方式)

Common xiuzhen crossing methods and their narrative features:

| Method | Features | Suitable Tone |
|--------|----------|---------------|
| Soul transmigration after accidental death | Inherits original body''s memories and relationships; underdog comeback feel | Sect rise, power-fantasy |
| Summoned by mysterious force | Sense of destiny; implies a hidden hand behind the crossing | Grand narrative, chosen one |
| Lightning strike crossing | Classic and decisive; can echo heavenly tribulations | Any type |
| Dream crossing | Gentle transition | Light stories, casual farming |
| Artifact-touch crossing | The artifact may be a fragment of an immortal weapon; foreshadowing | Stories with treasure-hunting threads |

#### 4.2 Destination Type (目的地类型)

What kind of xiuzhen world the protagonist crosses into:
- **Orthodox xiuzhen world**: Classic world with abundant sects and spiritual energy
- **Dharma-Ending xiuzhen world**: Sparse spiritual energy, declining cultivation (increases difficulty)
- **Wilderness xiuzhen world**: Uncivilized, perilous primitive cultivation world
- **High-martial xiuzhen world**: Extremely high power ceiling with many powerhouses

#### 4.3 Crossing Identity (穿越身份)

| Identity | Starting Point | Narrative Advantage |
|----------|---------------|-------------------|
| Sect''s "trash" disciple | Very low | Strong underdog feeling; high reader identification |
| Clan branch family scion | Low | Has basic resources but marginalized |
| Rogue cultivator | Medium | High freedom but no backing |
| Sect core disciple | High | High starting point but many enemies |
| Mortal | Very low | Starts from zero; most complete growth arc |

The most classic crossing identity is the "sect''s trash disciple" -- the original body has poor aptitude and is bullied; the crosser uses a cheat ability to defy fate.

#### 4.4 Core Goal (核心目标)

- **Ascension to immortality**: The ultimate goal of xiuzhen fiction
- **Defy fate**: Change the original body''s tragic destiny
- **Protect loved ones**: Safeguard the sect, family, or Dao companion
- **Explore the Great Dao**: Purely pursue the truth of cultivation
- **Revenge**: Avenge the original body or the sect

#### 4.5 Story Tone (故事基调)

- **Hot-blooded power fantasy**: Strong cheat ability, steamrolling enemies, satisfying level-ups
- **Steady and methodical**: Focus on cultivation process and comprehension; slow burn with depth
- **Survival thriller**: Danger everywhere, every step calculated, tense and exciting
- **Casual daily life**: Farming, pill refining, leisurely cultivation with occasional adventures

#### 4.6 Romance Arc (感情线)

Xiuzhen fiction romance has unique characteristics:
- **Dao companion** (道侣): The xiuzhen concept of a partner; cultivating together, supporting each other
- **Dual cultivation** (双修): A special cultivation practice; can serve as the intersection of romance and cultivation arcs
- **Lifespan gap**: Different cultivation levels cause lifespan disparities; a natural source of emotional conflict
- **Ascension dilemma**: One partner ascends first -- what happens to the other? A classic emotional pain point

---

### V. Cheat Ability Setting

#### 5.1 Cheat Ability Type (金手指类型)

Common xiuzhen crossing cheat abilities and their suitability:

| Type | Description | Suitable Plot |
|------|-------------|---------------|
| **System** (系统) | Quest-reward assistance system | Any, especially power-fantasy |
| **Divine artifact** (神器) | Ancient divine/immortal artifact chooses its master | Combat-focused, treasure-hunting |
| **Innate talent** (天赋) | Variant spirit root, special physique | Cultivation-focused |
| **Bloodline** (血脉) | Ancient divine beast or immortal bloodline awakening | Hot-blooded combat |
| **Spirit companion** (灵宠) | Ancient spirit beast grows alongside the protagonist | Light adventure |
| **Legacy memories** (外挂记忆) | Inherited memories from an ancient powerhouse | Knowledge-based, depth-based |
| **Technological items** (科技道具) | Modern technology applied in the xiuzhen world | Innovation, farming-focused |
| **Other** (其他) | Time-acceleration spaces, pill appraisal, etc. | Flexible |

#### 5.2 Ability Description (能力描述)

Cheat abilities need to be specific:
- System type: What mission types? Reward mechanism? Points exchange table?
- Artifact type: What grade? What abilities? How does it link to cultivation level?
- Talent type: What specific attribute does the variant spirit root have? By how much does it increase cultivation speed?
- Bloodline type: What bloodline? Awakening conditions? Stage-based abilities?

#### 5.3 Usage Limitations (使用限制)

**A cheat ability without limitations destroys the cultivation tension of xiuzhen fiction**:
- System type: Mission cooldowns, insufficient points, specific trigger conditions
- Artifact type: Insufficient cultivation to activate full abilities, requires special materials for repair
- Talent type: Initially unstable, requires specific techniques to fully manifest
- Bloodline type: Awakening requires specific conditions, risk of going berserk

#### 5.4 Growth Potential (成长空间)

Cheat abilities should grow alongside cultivation level:
- Qi Refining: Basic assistance functions
- Foundation Building: New abilities unlocked
- Golden Core: Qualitative upgrade
- Nascent Soul: Core abilities fully realized
- Late stages: Ultimate form

#### 5.5 Acquisition Method (获得方式)

- Built-in at crossing (acquired during soul fusion)
- Acquired through fortune after crossing (found in a secret realm, bestowed by an elder)
- Gradual awakening (slowly manifesting as cultivation improves)

---

### VI. Story Hook Setting

#### 6.1 Story Hook (故事钩子)

Xiuzhen crossing hooks typically revolve around "the underdog comeback":
- The trash disciple awakens and gains a cheat ability on the eve of the sect tournament
- After crossing, the protagonist discovers the sect will be destroyed in three months
- The original body was jilted / expelled from the sect, vowing to make everyone regret it

#### 6.2 Core Selling Point (核心卖点)

What makes this distinct from other xiuzhen crossing stories:
- A unique cultivation system? (Not just another cookie-cutter realm ladder)
- A novel cheat ability? (Not an all-purpose system)
- Unique sect design? (Not a template sect)
- An alchemy/artifact-forging/formation-focused non-combat approach?

#### 6.3 Opening Suspense (开篇悬念)

Suspense to establish within the first three chapters:
- The first crisis faced after crossing (sect trial, provocation, resource theft)
- First demonstration of the cheat ability (but don''t reveal everything at once)
- Hints at a larger conspiracy or opportunity

#### 6.4 Reader Expectations (读者期待)

Clarify the core expectations readers are chasing:
- Level-up satisfaction (the fulfillment of realm breakthroughs)
- Face-slapping gratification (trash-turned-genius humiliating arrogant rivals)
- Exploration fun (secret realm adventures, pill and artifact collecting)
- Strategic enjoyment (outwitting stronger opponents through clever tactics)

---

### VII. Writing Style Setting

#### 7.1 Narrative Perspective (叙事视角)

- **Third person limited**: Most common; balances immersion and narrative flexibility
- **First person**: Suits diary-style cultivation or light, commentary-style stories
- **Third person omniscient**: Suits multi-threaded grand cultivation narratives

#### 7.2 Language Style (语言风格)

| Style | Characteristics | Suitable Types |
|-------|----------------|---------------|
| Semi-classical (半文半白) | Classical overtones without obscurity; most universal | Orthodox xiuzhen |
| Modern casual (现代轻松) | Colloquial with frequent inner commentary | Casual cultivation, slice-of-life |
| Classical elegant (古风雅致) | Beautiful diction, profound imagery | Xianxia-flavored, literary xiuzhen |
| Hot-blooded concise (热血简练) | Fast pace, action-heavy descriptions | Combat-focused, power fantasy |

#### 7.3 Descriptive Focus (描写侧重)

- **Cultivation descriptions**: Sensory experience during breakthroughs, spiritual energy circulation, heaven-and-earth phenomena
- **Combat descriptions**: Spell clashes, artifact collisions, domain confrontations
- **Environmental descriptions**: Spirit-rich immortal mountains, ominous secret realms, majestic tribulation skies
- **Psychological descriptions**: Mental shifts during Dao comprehension, fear and resolve facing tribulation

#### 7.4 Pacing Control (节奏把控)

- **Cultivation passages**: Can be accelerated; avoid assembly-line cultivation descriptions
- **Combat passages**: Fast pace, tense and exciting; techniques should have imaginative flair
- **Exploration passages**: Medium pace, maintaining suspense and a sense of discovery
- **Daily life passages**: Slow pace; used for character development and relationship building
- **Breakthrough passages**: Slow buildup then fast climax; the core of each minor narrative peak

#### 7.5 Forbidden Vocabulary (禁用词汇)

List modern terms that should not appear in xiuzhen fiction:
- Modern technology terms (smartphone, computer, internet -- unless in the protagonist''s inner monologue)
- Western fantasy terms (magic, knight, elf -- unless the setting includes cross-world elements)
- Overly internet-slang language (unless the tone is light comedy)

---

### VIII. Character Design

#### 8.1 Core Character Attributes

The xiuzhen novel character Schema includes these core fields:
- **Race** (种族): Human, demon beast, devil, spirit race, etc.
- **Cultivation realm** (修为境界): Current cultivation level and sub-level

#### 8.2 Character Type Templates

**Protagonist (crosser)**:
- Spirit root quality: Usually starts low (waste root / mixed root); later reversed through cheat ability
- Cultivation speed: Abnormally fast due to cheat ability
- Personality: Should have a modern person''s mindset but gradually adapt to the xiuzhen world''s survival-of-the-fittest rules
- Moral baseline: Principles maintained even in the xiuzhen world (refuses to slaughter innocents vs. decisive ruthlessness)

**Master / Elder figure**:
- Extremely high cultivation but with their own limitations
- Attitude toward the protagonist (strict training / laissez-faire / secret protection)
- Has their own storyline and enemies

**Fellow disciples (sect brothers/sisters)**:
- Some are allies, some are rivals
- Their jealousy of the protagonist should be reasonable -- resources are limited and competition is natural

**Dao companion (romance core)**:
- Must have an independent cultivation path and strength
- Cannot become a decorative character -- the xiuzhen world has no room for idle dependents
- The cultivation gap with the protagonist is a natural source of emotional tension

**Antagonists**:
- Malicious senior disciples / elders within the sect
- Genius disciples from rival sects
- Demonic / heretical cultivator forces
- The heavenly Dao itself (as the ultimate antagonist)

#### 8.3 Character Relationships within the Sect Ecosystem

The sect is the most important social unit in xiuzhen fiction; character relationships revolve around it:

```
Sect Master (Deity Transformation / Tribulation Transcendence)
 |-- Grand Elder (late Nascent Soul)
 |-- Second Elder (mid Nascent Soul)
 |-- ...
 |-- Inner Sect Chief (late Golden Core)
 |    |-- Inner disciple A (early Golden Core)
 |    |-- Inner disciple B (late Foundation Building)
 |    |-- ...
 |-- Outer disciples (mostly Foundation Building)
 |-- Menial disciples (Qi Refining) <-- Protagonist usually starts here
```

---

### IX. Sect and Faction Design

#### 9.1 Sect Tier System

| Sect Tier | Peak Power | Disciple Scale | Territory |
|-----------|-----------|---------------|-----------|
| First-rate sect | Deity Transformation / Tribulation | 10,000+ | Regional hegemon |
| Second-rate sect | Nascent Soul | 1,000-10,000 | Regional power |
| Third-rate sect | Golden Core | 100-1,000 | Small power |
| Minor sect | Foundation Building | Under 100 | Single city or locale |

#### 9.2 Internal Sect Structure

Each sect should define:
- **Sect-guarding treasure**: The sect''s core artifact or formation
- **Inherited techniques**: Core and signature cultivation methods
- **Inner/outer door system**: Promotion criteria, resource allocation rules
- **Sect tournament**: Selection mechanism and rewards
- **Sect missions**: Daily mission system (herb gathering, demon hunting, patrol)

#### 9.3 Inter-Sect Relationships

- **Allies**: United against common enemies
- **Competitors**: Contending for spiritual veins, mineral veins, secret realm resources
- **Subordinate**: Small sects attached to major ones
- **Hostile**: Fundamental opposition between righteous and demonic paths

#### 9.4 Other Faction Types

- **Clans**: Family-based factions centered on bloodline inheritance
- **Rogue cultivator alliances**: Loose organizations of unaffiliated cultivators
- **Trading guilds**: Commercial organizations dealing in spirit stones, pills, and artifacts
- **Mysterious organizations**: Hidden forces manipulating events from the shadows

---

### X. Narrative Structure: Cultivation-Milestone Storytelling

Xiuzhen novel narrative rhythm is driven by realm breakthroughs, creating a distinctive milestone-based structure.

#### 10.1 The Core Narrative Cycle of Xiuzhen

Each realm segment follows the same narrative cycle:

```
Acquire resources/techniques -> Cultivate/comprehend -> Encounter conflict -> Fight to grow -> Break through realm -> New horizon opens
```

#### 10.2 Recommended Narrative Framework

```
Volume 1: Spirit Root Testing, Entering the Sect
  Crossing arrives -> Discovers spirit root / gains cultivation opportunity -> Joins sect -> Bottom-tier survival -> Cheat ability first appears

Volume 2: Inner and Outer Doors, Sect Tournament
  From menial to outer disciple -> Cultivation progress -> Sect tournament -> Rising to prominence -> Inner disciple status

Volume 3: Secret Realm Expedition, Path to Golden Core
  Secret realm opens -> Nine deaths, one life -> Gains fortune -> Forms Golden Core -> Power leap

Volume 4: Sect Crisis, Nascent Soul Realm
  Sect faces external threat -> Goes out for experience -> Builds connections -> Nascent Soul breakthrough -> Becomes a sect pillar

Volume 5 (and beyond): Heavenly Tribulation and Ascension
  Deity Transformation cultivation -> Heavenly tribulation descends -> Tribulation success/failure -> Mahayana -> Path to ascension
```

#### 10.3 Heavenly Tribulation as Narrative Climax

Heavenly tribulation is the most ceremonially significant narrative node in xiuzhen fiction:

**Narrative functions of tribulation**:
- **Checkpoint**: Tests all strength the protagonist has accumulated to date
- **Life-or-death gate**: A genuine life-and-death crisis that cannot be replaced by monster-fighting
- **Public event**: Tribulation phenomena attract attention from all parties, triggering new conflicts
- **Growth milestone**: Successful tribulation marks a qualitative power shift, opening a new narrative phase

**Tribulation scene design**:
- Pre-tribulation preparation (formation setup, pills, arrangements for Dao protectors)
- Mid-tribulation survival (nine-nine tribulation, purple tribulation, and other variant tribulations for added intensity)
- Post-tribulation transformation (power leap, reactions from various factions)

#### 10.4 Key Scene Types

Iconic scenes of the xiuzhen world:

| Scene Type | Narrative Function | Examples |
|------------|-------------------|----------|
| **Sect gates** | Protagonist''s base and belonging | Azure Cloud Peak, Inner Sect Grand Hall |
| **Market city** (坊市) | Trading, intelligence gathering, socializing | Heavenly Mechanism Market, black market |
| **Secret realm** (秘境) | Adventure, fortune, combat | Ancient immortal''s cave dwelling, Primordial Chaos secret realm |
| **Grotto heaven** (洞天福地) | Cultivation, seclusion | Spirit Spring Grotto, Herb Garden Paradise |
| **Tribulation ground** | Heavenly tribulation scene | Tribulation Platform, desolate wasteland |
| **Forbidden zone** (禁地) | High-risk, high-reward exploration | Ten Thousand Demon Mountain, Blood Sea Forbidden Zone |
| **Battlefield** | Large-scale sect conflict | Spiritual vein battleground, sect front gates |
| **Auction house** | Resource acquisition, information | Heavenly Mechanism Pavilion Auction |

---

### XI. Pill / Artifact / Formation Systems

These three systems are the pillars of the xiuzhen world and vital tools for enriching the plot.

#### 11.1 Pill System (丹药体系)

Pills are essential needs in the xiuzhen world:
- **Grade system**: Grades 1-9 (or mortal/spiritual/immortal grade)
- **Core pills**: Cultivation Enhancement Pill, Foundation Building Pill, Healing Pill, Detox Pill, Realm-Breaking Pill
- **Alchemy elements**: Recipe + spirit fire + cauldron + alchemist technique
- **Success rate**: Pill refining has failure probability, adding tension
- **Pill toxin issue**: Excessive pill consumption accumulates toxins, limiting abuse

#### 11.2 Artifact System (法宝体系)

Artifacts are combat multipliers for cultivators:
- **Grade system**: Tools (法器) -> Spiritual instruments (灵器) -> Treasures (宝器) -> Immortal artifacts (仙器) -> Divine artifacts (神器)
- **Growth-type artifacts**: Natal artifacts that grow with the protagonist''s cultivation (ideal for long series)
- **Forging elements**: Materials + forging fire + formation inscriptions + artificer technique
- **Artifact bonding**: Conditions for an artifact to recognize its master (blood sacrifice, divine sense imprint, etc.)

#### 11.3 Formation System (阵法体系)

Formations are the infrastructure of the xiuzhen world:
- **Sect protection array**: The defensive core of a sect
- **Offensive formations**: Trapping and killing enemies
- **Support formations**: Spirit-gathering array (accelerates cultivation), concealment array
- **Natural formations**: Ancient formations found in secret realms
- **Formation grades**: Tied to the formation master''s cultivation level and material quality

---

### XII. Common Pitfalls

| Pitfall | Problem | Correct Approach |
|---------|---------|-----------------|
| **Realm inflation** | Too many overly granular realms; reader fatigue | Limit to 8-10 major realms; detail early stages, simplify later ones |
| **Artifact inflation** | Every opponent has a new artifact; readers cannot keep track | Limit protagonist''s artifacts to 3-5 core pieces; develop them in depth |
| **Inconsistent sect settings** | Sect power and rules contradict earlier descriptions | Define sect system clearly in World setting; follow it strictly |
| **Omnipotent pills** | Every problem solved by popping a pill | Design pill toxin mechanics, diminishing returns, scarcity limits |
| **Monotonous combat** | Every fight is "who has deeper reserves" | Combine artifacts, formations, pills, environment, and strategy for multi-dimensional battles |
| **Assembly-line cultivation** | "Three months of seclusion, breakthrough achieved" | Use key moments instead of process description; breakthrough scenes need ceremonial weight |
| **Unlimited cheat ability** | System provides everything; no challenges remain | Strictly limit cheat ability usage conditions and cooldowns |
| **Template sects / races** | All sects follow the same pattern | Give each sect unique technique paths, cultural characteristics, and interests |
| **Forced romance** | Love at first sight with no buildup | Develop feelings through shared life-and-death cultivation experiences |
| **Missing mortal perspective** | No mortal presence in the xiuzhen world | Occasionally show how cultivator actions affect mortals, adding world authenticity |

---

### XIII. Available Entity Categories

This creation method''s `visible_categories` includes:

| Category | Use |
|----------|-----|
| **setting** | Worldview, cultivation system, crossing setup, cheat ability, story hook, writing style |
| **character** | All characters (protagonist, master, fellow disciples, Dao companion, antagonists, etc.) |
| **organization** | Sects, clans, rogue cultivator alliances, trading guilds, and other factions |
| **scene** | Scenes (sects, market cities, secret realms, grotto heavens, tribulation grounds, etc.) |
| **chapter** | Chapters |

#### Recommended Creation Order

1. **Settings**: Worldview -> Cultivation system -> Crossing setup -> Cheat ability -> Story hook -> Writing style
2. **Factions**: Protagonist''s sect -> Rival sects -> Other factions (2-4)
3. **Characters**: Protagonist -> Master -> Fellow disciples -> Dao companion -> Antagonists
4. **Scenes**: Sect -> Market city -> Secret realm -> Tribulation ground
5. **Chapters**: Plan by volume; create the first 10 chapters initially

---

### XIV. Pre-Writing Checklist

Confirm before you start writing:

- [ ] Is the cultivation realm system complete with clear gaps between each level?
- [ ] Is the spirit stone economy self-consistent (pricing, resource scarcity)?
- [ ] Are sect tiers and internal systems clearly defined?
- [ ] Are tribulation rules explicit (which realms require tribulation, consequences of failure)?
- [ ] Does the cheat ability have clear usage limitations and a growth curve?
- [ ] Are pill/artifact/formation grade systems unified?
- [ ] Are the protagonist''s spirit root quality and cultivation path reasonable?
- [ ] Does the crossing identity and starting situation have sufficient dramatic tension?
- [ ] Has the forbidden vocabulary list in Writing Style been populated?
- [ ] Is the first narrative climax (sect tournament / secret realm expedition) planned?',
  (SELECT id FROM novel_creation_method WHERE name = '异世界修真穿越小说' LIMIT 1),
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
