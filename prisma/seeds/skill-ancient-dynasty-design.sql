-- 古代架空穿越小说创作方法专属 Skill / Ancient Fictional Dynasty Transmigration Novel Guide Skill
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '古代架空穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-ancient-dynasty-design.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ancient-dynasty-design',
  '架空朝代与势力设计：涵盖架空王朝构建方法论、势力体系设计、嫡庶与家族政治、场景与朝代氛围营造、核心设定联动逻辑，以及世界观设定、势力组织、角色身份地位和场景的工具使用指南',
  'Fictional dynasty and power design: covers fictional dynasty construction methodology, power faction system design, legitimate/illegitimate heir and family politics, scene and dynastic atmosphere creation, core setting interconnection logic, and tool usage guides for worldview settings, faction organizations, character status identities, and scenes',
  '## 架空朝代与势力设计技能

本技能专为「古代架空穿越小说」创作方法提供架空朝代世界观和势力格局的设计指导。核心聚焦于如何构建一个可信的虚构王朝、设计多层次的势力博弈、利用嫡庶家族政治驱动冲突，以及通过场景氛围呈现朝代质感。

---

### 一、架空王朝构建方法论

本节指导你填写「世界观」设定模块中的各项字段，构建一个完整且自洽的架空王朝。

#### 1.1 构建顺序

按以下依赖顺序逐步完善世界观：

```
王朝名称 → 时代背景 → 政治格局 → 社会制度 → 经济民生 → 文化风俗
```

**王朝名称**（必填）：
- 取名要有古风韵味但避免直接使用真实朝代名
- 可参考取名策略：单字国号（如"燕"、"楚"、"晋"）或双字国号（如"大衍"、"盛黎"）
- 名称应暗示朝代特质：武力强盛的王朝用刚硬的字，文治昌明的用雅致的字

**时代背景**（必填）：
- 明确朝代处于哪个发展阶段，这决定了整个故事的基调
- 四种经典时代模板：

| 模板 | 特征 | 故事基调 | 适合的主线剧情 |
|------|------|---------|---------------|
| **盛世型**（参考盛唐） | 国力强盛、文化繁荣、对外开放 | 轻松爽文 / 甜宠日常 | 经商致富、甜宠日常 |
| **晚期腐败型**（参考晚明） | 权贵腐败、宦官专权、民不聊生 | 权谋烧脑 / 细腻虐心 | 宫斗夺嫡、复仇虐渣 |
| **乱世割据型**（参考三国/五代十国） | 群雄逐鹿、战乱频繁、英雄辈出 | 热血励志 / 权谋烧脑 | 权谋争霸、江湖恩怨 |
| **开国初定型**（参考明初/汉初） | 百废待兴、暗流涌动、功臣勋贵 | 温馨治愈 / 热血励志 | 种田发家、宅斗逆袭 |

- 借鉴真实朝代气质但不要照搬史实。比如"参考盛唐的开放气度+宋朝的经济繁荣"是合理的混搭

**历史背景**（可选）：
- 虚构王朝的建国史、重大历史事件
- 前朝覆灭的原因（可作为伏笔或剧情钩子）
- 建国功臣及其后代（自然引出世家门阀势力）

**地理版图**（可选）：
- 京城所在地及周边格局
- 边疆与外族关系（可引出军事冲突线）
- 富庶之地与贫瘠之地（影响势力的经济基础）

#### 1.2 政治格局设计

**政治格局**字段是连接世界观和势力体系的核心枢纽：
- 皇帝的执政风格和能力水平
- 朝堂的派系分布（至少 2-3 个对立阵营）
- 当前的核心政治矛盾（继承权争夺、外戚干政、文武对立等）
- 权力的实际运作方式（名义上的权力 vs 实际掌控）

**设计技巧**：
- 政治格局应与「核心设定」中的主线剧情呼应
- 如果主线是宫斗夺嫡，政治格局应围绕皇位继承展开
- 如果主线是权谋争霸，政治格局应呈现多方势力制衡

#### 1.3 社会制度设计

社会制度是一个嵌套对象，包含四个子字段，每个子字段对故事冲突都有重要影响：

**官制**：
- 品级体系（如九品十八级）
- 文武官员的权力边界
- 哪些职位是实权、哪些是虚职
- 官制设计要为势力角逐提供舞台：比如"六部"互相牵制

**爵位**：
- 世袭规则（嫡长子继承 / 减等袭爵 / 非世袭）
- 皇室宗亲的封号体系
- 爵位与实权的关系（有些有封地有兵权，有些只是荣誉）
- 爵位是嫡庶冲突的核心利益点之一

**科举**：
- 选拔方式（科举考试 / 世家举荐 / 军功授职）
- 考试科目和等级
- 科举是寒门角色实现阶层跃迁的通道
- 科举制度与世家门阀利益的天然矛盾

**婚姻**：
- 嫡庶规则：正妻为嫡、侧室为庶，子女地位随之确定
- 联姻的政治功能（世家之间、皇室与外戚之间）
- 婚姻自主权与包办婚姻的冲突
- 和离、休妻的条件和社会影响

#### 1.4 经济民生与文化风俗

**经济民生**：
- 主要产业（农业/商业/手工业）
- 货币体系和物价参考
- 商业在社会中的地位（士农工商的等级排序）
- 这决定了"经商致富"类主线的可行性和难度

**文化风俗**：
- 节日庆典（可作为情节推进的时间节点）
- 服饰饮食（增加古风氛围感）
- 礼仪规范（嫡庶之间的待遇差异、尊卑秩序）
- 禁忌和迷信（可用于伏笔设计）

#### 1.5 世界观自洽检查清单

填写完世界观后，检查以下一致性：

- [ ] 时代背景与政治格局是否匹配？（盛世不应有极端腐败的朝堂）
- [ ] 社会制度与时代背景是否合理？（开国初定型通常没有成熟的科举制度）
- [ ] 经济民生与政治格局是否呼应？（腐败朝代通常民生凋敝）
- [ ] 文化风俗与整体世界观是否和谐？
- [ ] 世界观是否为核心设定中的主线剧情提供了合理的舞台？

---

### 二、势力体系设计

本节指导你使用「势力」组织模块设计多层次的势力博弈格局。

#### 2.1 七种势力类型详解

每种势力类型有独特的权力来源、运作方式和故事功能：

**皇室宗亲**：
- 权力来源：皇家血脉
- 运作方式：以封王、封地、宗室特权为基础，通过皇位继承权获得影响力
- 故事功能：皇位争夺的核心参与者，宫斗夺嫡的主力
- 内部矛盾：嫡子与庶子、长子与幼子、在位者与觊觎者
- 典型角色：太子、亲王、郡王、宗室子弟
- 创建建议：势力地位设为"顶级势力"，核心人物填写皇帝及重要皇子

**世家门阀**：
- 权力来源：世代积累的政治资本、土地和人才
- 运作方式：通过联姻、门生故吏、家族产业维持影响力，世代经营
- 故事功能：保守力量的代表，与新兴势力的天然对手
- 内部矛盾：嫡系与旁系、守旧与革新、家族利益与个人追求
- 典型角色：世家家主、嫡女嫡子、庶出子女
- 创建建议：势力特点强调"底蕴深厚"，势力资源侧重人脉和情报

**外戚势力**：
- 权力来源：通过后宫嫔妃与皇室的婚姻关系
- 运作方式：依托后宫得宠者的影响力，渗透朝堂要职
- 故事功能：权力的投机者，最不稳定的势力类型
- 内部矛盾：宠妃失势则全族覆灭的高风险
- 典型角色：国舅、太后家族、皇后家族
- 创建建议：当前态势通常与后宫宠幸挂钩，可设为"上升期"或"危机中"

**朝廷派系**：
- 权力来源：官职和政治立场
- 运作方式：同乡、同年、同门形成的政治联盟，在朝堂政策上互相支持
- 故事功能：朝堂权谋的直接参与者
- 内部矛盾：利益一致时团结，利益冲突时分裂
- 典型角色：阁老、尚书、御史
- 创建建议：势力类型设为"朝廷派系"，势力目标围绕具体政策或人事安排

**地方豪强**：
- 权力来源：地方的土地、人口和军事力量
- 运作方式：天高皇帝远，在辖区内形成独立王国
- 故事功能：中央与地方矛盾的体现，可作为外部威胁
- 内部矛盾：忠诚朝廷还是割据自立
- 典型角色：藩镇节度使、地方土豪、边疆守将
- 创建建议：适合设置为远离京城的独立势力，势力资源侧重兵权

**江湖门派**：
- 权力来源：武力和江湖声望
- 运作方式：游离于朝廷体制之外，有自己的规则体系
- 故事功能：提供朝堂之外的叙事空间，适合武侠元素
- 内部矛盾：正邪之争、门派传承、江湖道义与朝廷法度的冲突
- 典型角色：掌门、武林高手、侠客
- 创建建议：仅在主线涉及"江湖恩怨"时创建，否则可省略

**商业势力**：
- 权力来源：财富和商业网络
- 运作方式：通过金钱渗透官场、资助势力、控制物资流通
- 故事功能：经济线的核心，可以同时与多方势力产生关系
- 内部矛盾：金钱与权力的交换、商业道德与利益的冲突
- 典型角色：富商巨贾、钱庄掌柜、商会会长
- 创建建议：适合"经商致富"主线，势力资源侧重财富

#### 2.2 势力格局设计原则

**最少三方制衡**：
一个有张力的势力格局至少需要三个相互制衡的势力。两方对立过于简单，四方以上可能过于复杂。推荐的基础结构：

```
核心势力 A（如皇室某派） ← 对抗 → 核心势力 B（如世家门阀）
                    ↕                           ↕
              中间势力 C（如外戚/朝廷派系）
```

**势力地位分配**：
不要所有势力都是"顶级势力"。合理的分配应该是：

| 数量 | 势力地位 | 说明 |
|------|---------|------|
| 1-2 个 | 顶级势力 | 掌控朝堂的核心力量 |
| 2-3 个 | 一流势力 | 有影响力但尚不能主导全局 |
| 1-2 个 | 二流/新兴/没落势力 | 提供变数和发展空间 |

**当前态势动态**：
利用「当前态势」字段追踪势力的兴衰变化：

| 态势 | 说明 | 叙事功能 |
|------|------|---------|
| 上升期 | 势力正在扩张 | 制造威胁感，推动冲突升级 |
| 鼎盛期 | 势力处于巅峰 | 体现强大压力，适合作为主角的对手方 |
| 衰落期 | 势力走下坡路 | 引发挣扎求变或内部分裂 |
| 危机中 | 面临重大威胁 | 制造紧迫感，可能引发破釜沉舟 |
| 蛰伏中 | 隐藏实力伺机而动 | 制造悬念，伏笔效果好 |

#### 2.3 势力资源四大支柱

设计「势力资源」时，围绕四大支柱思考：

| 资源类型 | 说明 | 示例 |
|---------|------|------|
| **兵权** | 军事力量的掌控 | 禁军统领、边疆兵权、府兵 |
| **财富** | 经济实力 | 皇庄田产、商铺生意、盐铁专营 |
| **人脉** | 政治关系网 | 门生故吏遍布朝野、姻亲关系链 |
| **情报** | 信息获取能力 | 暗探网络、消息灵通人士、内线 |

每个势力应有不同的资源侧重，这决定了他们的行动方式和弱点。

#### 2.4 势力关系设计

使用「势力关系」字段描述势力之间的关系类型：
- 同盟关系：利益一致的联盟，但可能因利益变动而瓦解
- 敌对关系：核心利益冲突的对手
- 从属关系：附庸或被保护的势力
- 竞争关系：同一领域的对手，但尚未到敌对的程度
- 暗中关系：表面无关但实际有秘密联系

---

### 三、嫡庶与家族政治

本节指导你利用角色「身份地位」模块中的嫡庶体系设计家族政治冲突。

#### 3.1 身份地位系统

角色的「身份地位」是一个嵌套对象，包含四个子字段：

| 子字段 | 说明 | 冲突驱动力 |
|--------|------|-----------|
| **家族** | 所属家族名称 | 决定角色的起点和资源 |
| **官职/爵位** | 当前的头衔和职务 | 决定角色的社会地位和权力 |
| **嫡庶** | 嫡出 / 庶出 / 不适用 | 最核心的身份标签，直接影响继承权和家族待遇 |
| **排行** | 在兄弟姐妹中的排行 | 与嫡庶结合决定继承顺序 |

#### 3.2 嫡庶作为冲突核心

嫡庶制度是古代架空小说中最富戏剧张力的设定之一：

**嫡出的优势与压力**：
- 继承权优先，但也承受更高的期望
- 被家族寄予厚望，同时也是其他势力拉拢或打压的目标
- "嫡长子继承"是原则，但"庶长子更有能力"是常见的冲突源

**庶出的困境与动力**：
- 地位低于嫡出，但可能更有才能
- 在家族中受到不公平待遇，这是逆袭叙事的起点
- 需要通过科举、军功、联姻或商业来改变命运
- 穿越者如果身份是庶出子女，则嫡庶冲突成为核心障碍

**嫡庶冲突的常见模式**：

| 冲突模式 | 说明 | 适合的主线剧情 |
|---------|------|---------------|
| 嫡位之争 | 嫡子与庶子争夺家族继承权 | 宅斗逆袭 |
| 嫡庶联手 | 面对外敌时暂时联合 | 权谋争霸 |
| 嫡降庶升 | 嫡出因犯错被贬，庶出借机上位 | 复仇虐渣 |
| 嫡庶倒转 | 发现身世秘密导致嫡庶身份调换 | 宫斗夺嫡 |

#### 3.3 嫡庶与主线剧情的交叉

不同主线剧情中，嫡庶冲突扮演的角色不同：

**宅斗逆袭**：嫡庶冲突是核心战场
- 嫡母打压庶出子女
- 管家权、嫁妆、婚配资源的争夺
- 家族内部的站队和背叛

**宫斗夺嫡**：嫡庶冲突升级为皇位继承
- 嫡皇子 vs 庶皇子
- 太子之位的争夺
- 后宫势力影响前朝格局

**经商致富 / 种田发家**：嫡庶冲突是背景压力
- 被分家后只得到微薄资源
- 通过商业或农业成功来证明自身价值
- 家族从轻视到重视的态度转变

**复仇虐渣**：嫡庶冲突是仇恨来源
- 前世被嫡出迫害致死
- 重生/穿越后反击
- 利用嫡庶规则的漏洞

#### 3.4 家族层级设计

设计角色的家族层级时，建议按以下结构：

```
家族长辈层：
  └─ 老太爷/老太君（最高权威）
  └─ 各房：大房（嫡长房）、二房、三房...

每房内部：
  └─ 正室（嫡妻）→ 嫡出子女
  └─ 侧室/妾室 → 庶出子女
  └─ 通房/外室 → 地位最低的庶出

角色的排行写法：
  └─ "长女"、"次子"、"三姑娘"、"五少爷"
```

---

### 四、场景与朝代氛围

本节指导你使用「场景」模块构建符合架空朝代气质的空间环境。

#### 4.1 八种场景类型及其叙事功能

| 场景类型 | 典型空间 | 叙事功能 | 常见冲突 |
|---------|---------|---------|---------|
| **皇宫内苑** | 太和殿、后宫寝宫、御花园 | 皇权中心，宫斗主战场 | 皇位争夺、后宫倾轧、君臣博弈 |
| **王府宅邸** | 正院、花厅、后院、库房 | 家族政治主战场 | 嫡庶争斗、管家权争夺、嫁妆纠纷 |
| **官衙府署** | 大堂、内衙、书房 | 政务和审判场所 | 冤假错案、朝堂对决、政策博弈 |
| **市井街巷** | 集市、茶楼、酒肆 | 民间生活展示 | 偶遇、情报交换、微服出行 |
| **山野郊外** | 庄子、田地、驿站、山寺 | 远离权力中心的空间 | 隐居避祸、种田经营、意外事件 |
| **寺庙道观** | 佛殿、禅房、道院 | 精神空间和避难所 | 祈福许愿、密谈、疗伤养病 |
| **酒楼茶肆** | 雅间、大堂、后厨 | 社交和信息交汇 | 宴饮交际、情报刺探、江湖传闻 |
| **其他** | 密室、地牢、边疆军营 | 特殊情节需要 | 审讯、囚禁、军事行动 |

#### 4.2 场景氛围与情节配对

场景氛围应服务于情节需要：

| 场景氛围 | 适合的情节类型 | 营造手法 |
|---------|--------------|---------|
| **庄严肃穆** | 朝会、册封、审判 | 建筑宏伟、人物端庄、礼仪严格 |
| **富丽堂皇** | 宴会、庆典、炫耀 | 金碧辉煌、珍馐美馔、丝竹管弦 |
| **清幽雅致** | 密谈、疗伤、独处 | 竹林清泉、焚香煮茶、书画琴棋 |
| **热闹喧嚣** | 集市、节日、比试 | 人声鼎沸、商贩叫卖、锣鼓喧天 |
| **阴森诡异** | 密谋、审讯、冤案 | 昏暗灯火、冷风飕飕、角落阴影 |
| **温馨舒适** | 日常、甜宠、家庭 | 暖炉红帐、点心香茶、笑语晏晏 |

#### 4.3 场景作为权力地图

场景不仅是故事发生的地点，更是权力关系的投射：

**空间控制 = 权力展示**：
- 谁能进入皇宫内苑？→ 反映与皇权的距离
- 谁掌控王府宅邸的内院？→ 反映家族内部的权力格局
- 谁的势力范围覆盖哪些市井街巷？→ 反映地方影响力

**常驻人物的设计意义**：
- 场景的常驻人物列表直接反映该空间的控制者
- 新人物进入某场景 = 权力格局可能发生变动
- 被逐出某场景 = 失势的信号

**场景功能的设计**：
- 每个场景应有明确的叙事功能
- 避免创建没有情节用途的装饰性场景
- 场景可以有"公开功能"和"隐藏功能"（如书房既是读书之地，也是密谈之所）

---

### 五、核心设定之间的联动

本节指导你理解「核心设定」模块中各字段之间的关系，以及它们如何影响世界观和势力设计。

#### 5.1 主线剧情决定势力重点

不同的主线剧情需要不同的势力配置：

| 主线剧情 | 核心势力类型 | 势力数量建议 | 冲突焦点 |
|---------|------------|------------|---------|
| **宫斗夺嫡** | 皇室宗亲 + 外戚势力 | 3-4 个 | 皇位继承 |
| **宅斗逆袭** | 世家门阀（内部） | 2-3 个 | 家族权力 |
| **经商致富** | 商业势力 + 世家门阀 | 3-4 个 | 商业竞争与权贵打压 |
| **种田发家** | 地方豪强 | 2-3 个 | 地方资源与生存 |
| **复仇虐渣** | 世家门阀 + 皇室宗亲 | 3-4 个 | 仇恨与反击 |
| **权谋争霸** | 所有类型均可 | 4-5 个 | 天下归属 |
| **江湖恩怨** | 江湖门派 + 朝廷派系 | 3-4 个 | 正邪与朝野 |
| **甜宠日常** | 皇室宗亲 / 世家门阀 | 2-3 个 | 感情障碍 |

#### 5.2 穿越身份决定起始位置

穿越者的起始身份决定了与势力格局的初始关系：

| 穿越身份 | 起始势力接触 | 核心挑战 | 身份地位建议 |
|---------|------------|---------|------------|
| **皇室宗亲** | 直接卷入皇室势力 | 宫廷规则、皇权博弈 | 嫡出或庶出皆可 |
| **世家嫡女/嫡子** | 核心世家门阀 | 家族期望、联姻安排 | 嫡出 + 排行靠前 |
| **庶出子女** | 同家族但地位低 | 嫡庶歧视、资源匮乏 | 庶出 + 排行随意 |
| **落魄贵族** | 没落势力 | 从底部重新崛起 | 势力地位设为"没落势力" |
| **平民百姓** | 无势力接触 | 阶层壁垒、生存压力 | 无家族、无官职 |
| **奴婢/下人** | 所属主家势力 | 最底层逆袭 | 无家族、无嫡庶 |
| **江湖人士** | 江湖门派 | 朝堂与江湖的规则差异 | 有门派无官职 |

#### 5.3 故事基调影响世界观复杂度

| 故事基调 | 世界观复杂度 | 势力数量 | 嫡庶冲突深度 | 场景丰富度 |
|---------|------------|---------|------------|-----------|
| **轻松爽文** | 低 | 2-3 个 | 浅层，快速解决 | 3-4 个核心场景 |
| **细腻虐心** | 中 | 3-4 个 | 深层，情感纠葛 | 5-6 个场景 |
| **权谋烧脑** | 高 | 4-5 个 | 多层，利益博弈 | 6-8 个场景 |
| **温馨治愈** | 低 | 2-3 个 | 浅层，以和解为主 | 3-4 个温馨场景 |
| **热血励志** | 中 | 3-4 个 | 中层，作为动力 | 5-6 个场景 |

#### 5.4 感情线与势力的交织

感情线类型影响势力关系设计：

| 感情线 | 与势力的关系 | 设计要点 |
|--------|------------|---------|
| **一对一甜宠** | 势力是外部障碍 | 男女主来自不同势力阵营 |
| **先婚后爱** | 联姻是势力手段 | 婚约背后有政治目的 |
| **破镜重圆** | 势力变动导致分离 | 误会与势力倾轧交织 |
| **欢喜冤家** | 势力对立制造冲突 | 家族仇敌或阵营对立 |
| **青梅竹马** | 两家势力曾经交好 | 势力变动威胁旧情 |
| **日久生情** | 势力合作中产生感情 | 共同利益逐渐变为真心 |
| **无CP事业线** | 势力是主角的目标 | 所有精力投入权力角逐 |

---

### 六、工具使用指南

#### 6.1 世界观设定操作

使用 `update_setting` 填写世界观模块：

```
操作流程：
get_setting_type_schema(moduleTypeName: "世界观") → 查看字段定义 → update_setting
```

关键参数说明：
- `settingName`：设定名称（如"世界观"）
- `properties`：JSON 对象，包含世界观各字段

注意「社会制度」是嵌套对象，格式为：
```json
{
  "社会制度": {
    "官制": "九品十八级...",
    "爵位": "世袭罔替...",
    "科举": "三年一试...",
    "婚姻": "父母之命..."
  }
}
```

填写建议：
- 先填必填字段（王朝名称、时代背景），再逐步补充可选字段
- 可以分多次调用 `update_setting`，每次更新部分字段（增量合并）
- 不要等到所有字段都想好才填写，先搭框架再迭代

#### 6.2 势力组织操作

使用 `create_organization` 创建势力：

```
操作流程：
get_organization_schema → list_organizations → create_organization → create_relation
```

关键参数说明：
- `name`：势力名称
- `properties`：JSON 对象，包含势力类型、势力地位、核心人物、势力特点、势力资源、势力关系、势力目标等

创建后记得建立势力之间的关系：
- 使用 `create_relation` 建立组织间关系
- `fromCategory: "organization"`, `toCategory: "organization"`
- `relationType` 描述关系性质（如"同盟"、"敌对"、"从属"等）

#### 6.3 角色身份地位操作

使用 `create_character` 创建角色时，注意「身份地位」嵌套对象：

```
操作流程：
get_character_schema → create_character
```

「身份地位」字段格式：
```json
{
  "身份地位": {
    "家族": "慕容氏",
    "官职/爵位": "从三品光禄大夫",
    "嫡庶": "嫡出",
    "排行": "长女"
  }
}
```

穿越者角色需额外填写「前世记忆」字段：
- 描述前世的身份、技能、关键记忆
- 前世技能可作为角色金手指的来源

动态字段（当前身份、当前处境、当前情绪、好感度变化）会随剧情发展更新。

#### 6.4 场景操作

使用 `create_scene` 创建场景：

```
操作流程：
get_scene_schema → create_scene
```

关键参数说明：
- `name`：场景名称
- `properties`：JSON 对象，包含场景类型、场景氛围、场景位置、场景描写、常驻人物、场景功能

场景创建建议：
- 先创建主角活动的核心场景（2-3 个）
- 场景类型和场景氛围必须从 enum 选项中选择
- 常驻人物填写角色名，确保角色已创建
- 场景功能描述该场景在故事中的叙事用途

---

### 七、综合设计检查清单

完成架空朝代与势力设计后，使用此清单自查：

**世界观层面**：
- [ ] 王朝名称是否有辨识度且不与真实朝代撞名？
- [ ] 时代背景是否与选择的故事基调匹配？
- [ ] 社会制度的四个子字段是否都有基本设定？
- [ ] 政治格局是否清晰地展现了核心矛盾？

**势力层面**：
- [ ] 是否至少创建了 3 个相互制衡的势力？
- [ ] 每个势力的势力类型和势力地位是否合理分配？
- [ ] 势力之间的关系是否已通过 `create_relation` 建立？
- [ ] 势力资源分配是否各有侧重，避免同质化？

**角色层面**：
- [ ] 主角的身份地位（家族、嫡庶、排行）是否与穿越身份匹配？
- [ ] 穿越者的前世记忆是否已填写？
- [ ] 嫡庶设定是否能有效驱动剧情冲突？
- [ ] 角色所属势力是否通过关系图谱关联？

**场景层面**：
- [ ] 核心场景是否覆盖主角的主要活动空间？
- [ ] 场景类型和场景氛围的选择是否服务于情节需要？
- [ ] 场景的常驻人物是否反映了权力控制关系？',
  '## Fictional Dynasty and Power Design Skill

This skill provides design guidance specifically for the "Ancient Fictional Dynasty Transmigration Novel" creation method, focusing on fictional dynasty worldviews and power faction dynamics. The core focus is on building a believable fictional dynasty, designing multi-layered power struggles, leveraging legitimate/illegitimate heir family politics to drive conflict, and presenting dynastic atmosphere through scene design.

---

### I. Fictional Dynasty Construction Methodology

This section guides you through filling in the "Worldview" setting module fields to build a complete and self-consistent fictional dynasty.

#### 1.1 Construction Order

Build the worldview progressively in this dependency order:

```
Dynasty Name -> Era Background -> Political Landscape -> Social Systems -> Economy & Livelihood -> Culture & Customs
```

**Dynasty Name** (required):
- The name should have a classical Chinese aesthetic but avoid directly using real dynasty names
- Naming strategies: single-character state names (e.g., "Yan", "Chu", "Jin") or two-character names (e.g., "Dayan", "Shengli")
- The name should hint at the dynasty''s character: use strong characters for militaristic dynasties, elegant ones for culturally prosperous ones

**Era Background** (required):
- Clarify which development stage the dynasty is in, as this determines the entire story''s tone
- Four classic era templates:

| Template | Characteristics | Story Tone | Suitable Main Plots |
|----------|----------------|-----------|-------------------|
| **Prosperous Era** (ref: Tang Dynasty peak) | Strong national power, cultural prosperity, openness | Light power-fantasy / Sweet romance | Business success, sweet daily life |
| **Late Corruption** (ref: Late Ming Dynasty) | Corrupt nobles, eunuch power, suffering commoners | Scheming thriller / Emotional depth | Palace intrigue, revenge |
| **Warring States** (ref: Three Kingdoms / Five Dynasties) | Competing warlords, frequent warfare, heroes emerge | Passionate inspirational / Scheming thriller | Power struggle, martial arts feuds |
| **Founding Era** (ref: Early Ming / Early Han) | Rebuilding from ruins, undercurrents, meritorious nobles | Warm healing / Passionate inspirational | Farming prosperity, underdog rising |

- Borrow the essence of real dynasties but don''t copy history directly. For example, "Tang Dynasty openness + Song Dynasty economic prosperity" is a reasonable mix

**Historical Background** (optional):
- The fictional dynasty''s founding history and major events
- Reasons for the previous dynasty''s fall (useful as foreshadowing or plot hooks)
- Founding heroes and their descendants (naturally introduces noble house factions)

**Geographic Territory** (optional):
- Capital location and surrounding layout
- Borders and foreign relations (can introduce military conflict lines)
- Wealthy regions and impoverished areas (affects factions'' economic bases)

#### 1.2 Political Landscape Design

The "Political Landscape" field is the core hub connecting worldview and the power faction system:
- The emperor''s governance style and capability level
- Court faction distribution (at least 2-3 opposing camps)
- Current core political conflicts (succession disputes, consort family interference, civil-military tensions, etc.)
- How power actually operates (nominal power vs. actual control)

**Design techniques**:
- The political landscape should echo the main plot in "Core Settings"
- If the main plot is palace intrigue, the political landscape should revolve around succession
- If the main plot is power struggle, the landscape should show multi-faction balancing

#### 1.3 Social System Design

The social system is a nested object containing four sub-fields, each significantly impacting story conflicts:

**Official Ranking System**:
- Grade hierarchy (e.g., nine ranks, eighteen grades)
- Power boundaries between civil and military officials
- Which positions hold real power vs. which are honorary
- The ranking system should provide a stage for faction competition

**Nobility Titles**:
- Inheritance rules (primogeniture / diminishing inheritance / non-hereditary)
- Royal family title system
- Relationship between titles and real power (some come with fiefdoms and military command, others are merely honorary)
- Nobility is one of the core stakes in legitimate/illegitimate heir conflicts

**Civil Examination System**:
- Selection methods (imperial exams / noble family recommendation / military merit promotion)
- Exam subjects and levels
- The exam system is the channel for commoner characters to achieve class mobility
- Natural contradiction between the exam system and noble family interests

**Marriage System**:
- Legitimate/illegitimate rules: the principal wife''s children are legitimate, concubines'' children are illegitimate; children''s status follows accordingly
- Political function of marriage alliances (between noble families, between the royal family and consort families)
- Conflict between marriage autonomy and arranged marriages
- Conditions and social impact of divorce and wife repudiation

#### 1.4 Economy, Livelihood, and Culture

**Economy & Livelihood**:
- Major industries (agriculture/commerce/handicraft)
- Currency system and price references
- Status of commerce in society (the scholar-farmer-artisan-merchant hierarchy)
- This determines the feasibility and difficulty of "business success" plot lines

**Culture & Customs**:
- Festivals and celebrations (can serve as timeline anchors for plot progression)
- Clothing and cuisine (enhances the period atmosphere)
- Etiquette norms (treatment differences between legitimate and illegitimate children, hierarchy of respect)
- Taboos and superstitions (useful for foreshadow design)

#### 1.5 Worldview Consistency Checklist

After completing the worldview, check these consistencies:

- [ ] Does the era background match the political landscape? (A prosperous era shouldn''t have an extremely corrupt court)
- [ ] Is the social system reasonable for the era? (A founding era typically doesn''t have a mature exam system)
- [ ] Does the economy correspond to the political landscape? (Corrupt dynasties usually have poor livelihoods)
- [ ] Are the cultural customs harmonious with the overall worldview?
- [ ] Does the worldview provide a reasonable stage for the main plot in the core settings?

---

### II. Power Faction System Design

This section guides you in using the "Faction" organization module to design multi-layered power dynamics.

#### 2.1 Seven Faction Types Explained

Each faction type has unique power sources, operating methods, and narrative functions:

**Royal Clan**:
- Power source: Royal bloodline
- Operations: Based on princely titles, fiefdoms, and royal privileges; influence through succession rights
- Narrative function: Core participants in succession battles, main force in palace intrigue
- Internal conflicts: Legitimate vs. illegitimate sons, eldest vs. youngest, incumbent vs. challengers
- Typical characters: Crown Prince, Princes, Royal scions
- Creation tip: Set faction status to "Top-tier faction"; list the Emperor and key princes as core members

**Noble Houses (Aristocratic Families)**:
- Power source: Generations of accumulated political capital, land, and talent
- Operations: Maintain influence through marriage alliances, patron-client networks, family businesses
- Narrative function: Representatives of conservative forces, natural opponents of rising powers
- Internal conflicts: Main branch vs. side branches, tradition vs. reform, family interests vs. personal pursuits
- Typical characters: Family patriarch, legitimate daughters/sons, illegitimate children
- Creation tip: Emphasize "deep heritage" in faction traits; focus resources on connections and intelligence

**Consort Clan (In-Law Factions)**:
- Power source: Marriage connections to the royal family through imperial concubines
- Operations: Leverage the influence of favored consorts to infiltrate court positions
- Narrative function: Power opportunists, the most unstable faction type
- Internal conflicts: The high risk of total destruction if the favored consort falls from grace
- Typical characters: Imperial uncle, Empress Dowager''s family, Empress''s family
- Creation tip: Current momentum usually links to harem favor; set to "Rising" or "In Crisis"

**Court Factions**:
- Power source: Official positions and political stances
- Operations: Political alliances formed through shared origins, exam cohorts, or mentorship
- Narrative function: Direct participants in court power plays
- Internal conflicts: United when interests align, fractured when they diverge
- Typical characters: Grand Secretaries, Ministers, Censors
- Creation tip: Set type to "Court Faction"; goals should revolve around specific policies or personnel appointments

**Regional Powers**:
- Power source: Local land, population, and military forces
- Operations: Far from the capital, forming independent kingdoms within their jurisdictions
- Narrative function: Embodiment of center-periphery tensions; can serve as external threats
- Internal conflicts: Loyalty to the court vs. separatist ambitions
- Typical characters: Military governors, local magnates, frontier generals
- Creation tip: Suitable as independent forces far from the capital; focus resources on military power

**Martial Arts Sects (Jianghu Factions)**:
- Power source: Martial prowess and jianghu reputation
- Operations: Operate outside the court system with their own rules
- Narrative function: Provide narrative space beyond the court; suitable for wuxia elements
- Internal conflicts: Orthodox vs. heretical, succession, jianghu ethics vs. court law
- Typical characters: Sect leaders, martial arts masters, wandering knights
- Creation tip: Only create when the main plot involves "martial arts feuds"; otherwise, skip

**Commercial Factions**:
- Power source: Wealth and commercial networks
- Operations: Infiltrate officialdom through money, sponsor factions, control resource circulation
- Narrative function: Core of the economic plotline; can simultaneously relate to multiple factions
- Internal conflicts: Exchange of money for power, business ethics vs. profit
- Typical characters: Wealthy merchants, bank managers, trade guild presidents
- Creation tip: Suitable for "business success" main plots; focus resources on wealth

#### 2.2 Power Dynamics Design Principles

**Minimum Three-Way Balance**:
A compelling power dynamic needs at least three mutually balancing factions. Two-way opposition is too simple; more than four may be too complex. Recommended basic structure:

```
Core Faction A (e.g., one royal branch) <-- Opposed --> Core Faction B (e.g., noble house)
                    ||                                            ||
              Middle Faction C (e.g., consort clan / court faction)
```

**Faction Status Distribution**:
Don''t make all factions "Top-tier." A reasonable distribution:

| Count | Faction Status | Description |
|-------|---------------|-------------|
| 1-2 | Top-tier faction | Core forces controlling the court |
| 2-3 | First-tier faction | Influential but cannot dominate overall |
| 1-2 | Second-tier / Emerging / Declining | Provide variables and room for development |

**Dynamic Momentum Tracking**:
Use the "Current Momentum" field to track faction rise and fall:

| Momentum | Description | Narrative Function |
|----------|-------------|-------------------|
| Rising | Faction is expanding | Creates threat, drives conflict escalation |
| At Peak | Faction is at its zenith | Shows overwhelming pressure; suitable as protagonist''s opponent |
| Declining | Faction is weakening | Triggers desperate adaptation or internal splits |
| In Crisis | Facing major threats | Creates urgency; may trigger last-stand decisions |
| Dormant | Hiding strength, waiting | Creates suspense; excellent for foreshadowing |

#### 2.3 Four Pillars of Faction Resources

When designing "Faction Resources," think around four pillars:

| Resource Type | Description | Examples |
|--------------|-------------|---------|
| **Military Power** | Control of armed forces | Imperial guard command, frontier armies, local militia |
| **Wealth** | Economic strength | Royal estates, business operations, salt/iron monopolies |
| **Connections** | Political network | Patron-client web across court, marriage alliance chains |
| **Intelligence** | Information gathering capability | Spy networks, well-informed contacts, inside agents |

Each faction should have different resource focuses, determining their methods of action and vulnerabilities.

#### 2.4 Faction Relationship Design

Use the "Faction Relations" field to describe inter-faction relationships:
- Alliance: United by shared interests but may dissolve when interests shift
- Hostility: Opponents with fundamentally conflicting core interests
- Subordination: Vassal or protected factions
- Competition: Rivals in the same domain but not yet hostile
- Secret ties: Seemingly unrelated but actually connected in secret

---

### III. Legitimate/Illegitimate Heir and Family Politics

This section guides you in using the "Identity & Status" module within character design to create family political conflicts.

#### 3.1 Identity & Status System

A character''s "Identity & Status" is a nested object with four sub-fields:

| Sub-field | Description | Conflict Driver |
|-----------|-------------|----------------|
| **Family** | Family name | Determines the character''s starting point and resources |
| **Official Position / Title** | Current title and office | Determines social standing and power |
| **Legitimate/Illegitimate** | Legitimate (di) / Illegitimate (shu) / Not Applicable | The most critical identity tag; directly affects inheritance rights and family treatment |
| **Birth Order** | Ranking among siblings | Combined with legitimacy status, determines inheritance sequence |

#### 3.2 Legitimacy as Conflict Core

The legitimate/illegitimate heir system is one of the most dramatically charged settings in ancient fictional novels:

**Advantages and pressures of legitimate birth**:
- Priority inheritance rights but also higher expectations
- Entrusted with family hopes while being targets for other factions to court or suppress
- "Eldest legitimate son inherits" is the principle, but "illegitimate eldest is more capable" is a common conflict source

**Predicament and motivation of illegitimate birth**:
- Lower status than legitimate children but may be more talented
- Unfair treatment within the family serves as the starting point for underdog narratives
- Must change fate through exams, military merit, marriage alliances, or business
- If the transmigrator''s identity is an illegitimate child, legitimacy conflicts become the core obstacle

**Common legitimacy conflict patterns**:

| Pattern | Description | Suitable Main Plot |
|---------|-------------|-------------------|
| Succession battle | Legitimate vs. illegitimate fighting for family inheritance | Underdog rising |
| Temporary alliance | Legitimate and illegitimate unite against external enemies | Power struggle |
| Status reversal via fault | Legitimate falls from grace; illegitimate seizes the opportunity | Revenge |
| Identity swap | Secret lineage discovery reverses legitimate/illegitimate status | Palace intrigue |

#### 3.3 Legitimacy Intersecting with Main Plots

Legitimacy conflicts play different roles in different main plots:

**Underdog Rising (Household Battles)**: Legitimacy conflict is the core battlefield
- The legitimate mother suppresses illegitimate children
- Battles over household management, dowries, and marriage resources
- Internal family faction alignment and betrayal

**Palace Intrigue**: Legitimacy conflict escalates to succession
- Legitimate prince vs. illegitimate prince
- Crown Prince position battles
- Harem forces influence court politics

**Business Success / Farming Prosperity**: Legitimacy conflict is background pressure
- Receiving meager resources after family division
- Proving self-worth through commercial or agricultural success
- Family attitude shifting from contempt to respect

**Revenge**: Legitimacy conflict is the source of enmity
- Persecuted to death by legitimate heirs in a previous life
- Striking back after rebirth/transmigration
- Exploiting loopholes in legitimacy rules

#### 3.4 Family Hierarchy Design

When designing a character''s family hierarchy, follow this structure:

```
Elder generation:
  -- Grandfather/Grand Matriarch (highest authority)
  -- Branches: First Branch (eldest legitimate), Second Branch, Third Branch...

Within each branch:
  -- Principal wife -> Legitimate children
  -- Secondary wives/concubines -> Illegitimate children
  -- Informal consorts -> Lowest-status illegitimate children

Birth order notation:
  -- "Eldest Daughter", "Second Son", "Third Young Lady", "Fifth Young Master"
```

---

### IV. Scene Design and Dynastic Atmosphere

This section guides you in using the "Scene" module to construct spatial environments that match the fictional dynasty''s character.

#### 4.1 Eight Scene Types and Their Narrative Functions

| Scene Type | Typical Spaces | Narrative Function | Common Conflicts |
|-----------|---------------|-------------------|-----------------|
| **Imperial Palace** | Throne hall, harem quarters, imperial garden | Center of imperial power, main palace intrigue battlefield | Succession, harem rivalries, ruler-minister dynamics |
| **Noble Residence** | Main courtyard, reception hall, rear quarters, storeroom | Main battlefield for family politics | Legitimacy battles, household management disputes, dowry conflicts |
| **Government Office** | Main hall, inner chambers, study | Governance and judicial venue | False accusations, court confrontations, policy debates |
| **Market Streets** | Bazaars, teahouses, taverns | Showcase of common life | Chance encounters, intelligence exchange, incognito outings |
| **Countryside** | Estates, farmland, relay stations, mountain temples | Space away from power centers | Seclusion, farming operations, unexpected events |
| **Temples & Monasteries** | Buddha hall, meditation rooms, Taoist courts | Spiritual space and refuge | Prayers, secret meetings, recuperation |
| **Restaurants & Teahouses** | Private rooms, main hall, kitchen | Social and information nexus | Banquets, intelligence gathering, jianghu rumors |
| **Other** | Secret rooms, dungeons, frontier military camps | Special plot needs | Interrogation, imprisonment, military operations |

#### 4.2 Scene Atmosphere and Plot Pairing

Scene atmosphere should serve plot needs:

| Atmosphere | Suitable Plot Types | Creation Techniques |
|-----------|-------------------|-------------------|
| **Solemn & Majestic** | Court assemblies, investitures, trials | Grand architecture, dignified characters, strict etiquette |
| **Lavish & Splendid** | Banquets, celebrations, displays of wealth | Gilded magnificence, exquisite cuisine, silk music |
| **Serene & Elegant** | Secret meetings, recuperation, solitude | Bamboo groves, incense and tea, calligraphy and music |
| **Bustling & Lively** | Markets, festivals, competitions | Crowded noise, street vendors, drums and gongs |
| **Dark & Eerie** | Conspiracies, interrogation, injustice | Dim lighting, cold drafts, shadows in corners |
| **Warm & Cozy** | Daily life, sweet romance, family scenes | Warm hearths, snacks and tea, gentle laughter |

#### 4.3 Scene as Power Map

Scenes are not merely locations where the story happens; they are projections of power relationships:

**Spatial control = Power display**:
- Who can enter the imperial palace? -> Reflects proximity to imperial power
- Who controls the inner quarters of a noble residence? -> Reflects the family''s internal power structure
- Whose sphere of influence covers which market streets? -> Reflects local influence

**Significance of resident characters**:
- A scene''s resident character list directly reflects who controls that space
- A new character entering a scene = Power dynamics may be shifting
- Being expelled from a scene = A signal of losing power

**Scene function design**:
- Each scene should have a clear narrative function
- Avoid creating decorative scenes with no plot purpose
- Scenes can have "public functions" and "hidden functions" (e.g., a study is both a reading room and a place for secret discussions)

---

### V. Core Setting Interconnections

This section guides you in understanding the relationships between fields in the "Core Settings" module and how they affect worldview and faction design.

#### 5.1 Main Plot Determines Faction Focus

Different main plots require different faction configurations:

| Main Plot | Core Faction Types | Recommended Count | Conflict Focus |
|-----------|-------------------|-------------------|---------------|
| **Palace Intrigue** | Royal Clan + Consort Clan | 3-4 | Succession |
| **Underdog Rising** | Noble Houses (internal) | 2-3 | Family power |
| **Business Success** | Commercial + Noble Houses | 3-4 | Business competition vs. noble suppression |
| **Farming Prosperity** | Regional Powers | 2-3 | Local resources and survival |
| **Revenge** | Noble Houses + Royal Clan | 3-4 | Vengeance and counter-attack |
| **Power Struggle** | All types applicable | 4-5 | Who rules the realm |
| **Martial Arts Feuds** | Martial Arts Sects + Court Factions | 3-4 | Orthodox vs. heretical, court vs. jianghu |
| **Sweet Romance** | Royal Clan / Noble Houses | 2-3 | Romantic obstacles |

#### 5.2 Transmigration Identity Determines Starting Position

The transmigrator''s starting identity determines their initial relationship with the power landscape:

| Identity | Initial Faction Contact | Core Challenges | Status Suggestion |
|----------|----------------------|-----------------|------------------|
| **Royal Family** | Directly involved in royal faction | Court rules, imperial power struggles | Legitimate or illegitimate both work |
| **Noble Legitimate Heir** | Core noble house | Family expectations, arranged marriages | Legitimate + higher birth order |
| **Illegitimate Child** | Same family but lower status | Legitimacy discrimination, resource scarcity | Illegitimate + any birth order |
| **Fallen Noble** | Declining faction | Rising from the bottom again | Set faction status to "Declining" |
| **Commoner** | No faction contact | Class barriers, survival pressure | No family, no official position |
| **Servant** | Master''s faction | Ultimate underdog rise | No family, no legitimacy status |
| **Jianghu Person** | Martial arts sect | Rule differences between court and jianghu | Has sect but no official position |

#### 5.3 Story Tone Affects Worldview Complexity

| Story Tone | Worldview Complexity | Faction Count | Legitimacy Conflict Depth | Scene Richness |
|-----------|---------------------|--------------|--------------------------|---------------|
| **Light Power-Fantasy** | Low | 2-3 | Shallow, quickly resolved | 3-4 core scenes |
| **Emotional Depth** | Medium | 3-4 | Deep, emotional entanglement | 5-6 scenes |
| **Scheming Thriller** | High | 4-5 | Multi-layered, interest-driven | 6-8 scenes |
| **Warm & Healing** | Low | 2-3 | Shallow, reconciliation-focused | 3-4 cozy scenes |
| **Passionate & Inspirational** | Medium | 3-4 | Medium, serves as motivation | 5-6 scenes |

#### 5.4 Romance Lines and Faction Interweaving

Romance line types affect faction relationship design:

| Romance Type | Relationship with Factions | Design Points |
|-------------|--------------------------|--------------|
| **One-on-one sweet** | Factions are external obstacles | Male and female leads from different faction camps |
| **Marriage first, love later** | Marriage alliance is a faction tool | Political purpose behind the betrothal |
| **Reunion after separation** | Faction upheaval causes separation | Misunderstandings intertwined with faction intrigues |
| **Bickering lovers** | Faction opposition creates conflict | Family enemies or opposing camps |
| **Childhood sweethearts** | Two families once allied | Faction changes threaten old bonds |
| **Slow burn** | Feelings develop through faction cooperation | Shared interests gradually become genuine affection |
| **No romance, career focus** | Factions are the protagonist''s goal | All energy invested in the power struggle |

---

### VI. Tool Usage Guide

#### 6.1 Worldview Setting Operations

Use `update_setting` to fill in the worldview module:

```
Workflow:
get_setting_type_schema(moduleTypeName: "Worldview") -> review field definitions -> update_setting
```

Key parameter notes:
- `settingName`: Setting name (e.g., "Worldview")
- `properties`: JSON object containing worldview fields

Note that "Social Systems" is a nested object with format:
```json
{
  "Social Systems": {
    "Official Ranking": "Nine ranks, eighteen grades...",
    "Nobility": "Hereditary without diminishment...",
    "Civil Examination": "Once every three years...",
    "Marriage": "By parental decree..."
  }
}
```

Filling tips:
- Fill required fields first (Dynasty Name, Era Background), then gradually add optional fields
- You can call `update_setting` multiple times, updating partial fields each time (incremental merge)
- Don''t wait until all fields are finalized; build the framework first and iterate

#### 6.2 Faction Organization Operations

Use `create_organization` to create factions:

```
Workflow:
get_organization_schema -> list_organizations -> create_organization -> create_relation
```

Key parameter notes:
- `name`: Faction name
- `properties`: JSON object containing faction type, faction status, core members, faction traits, faction resources, faction relations, faction goals, etc.

After creation, remember to establish inter-faction relationships:
- Use `create_relation` to build organization-to-organization relationships
- `fromCategory: "organization"`, `toCategory: "organization"`
- `relationType` describes the relationship nature (e.g., "alliance", "hostility", "subordination")

#### 6.3 Character Identity & Status Operations

When using `create_character`, note the "Identity & Status" nested object:

```
Workflow:
get_character_schema -> create_character
```

"Identity & Status" field format:
```json
{
  "Identity & Status": {
    "Family": "Murong Clan",
    "Official Position / Title": "Vice Minister of the Third Rank",
    "Legitimate/Illegitimate": "Legitimate",
    "Birth Order": "Eldest Daughter"
  }
}
```

Transmigrator characters need the additional "Past Life Memories" field:
- Describe their past life identity, skills, and key memories
- Past life skills can serve as the character''s cheat/advantage source

Dynamic fields (Current Identity, Current Situation, Current Emotion, Favorability Changes) update as the plot progresses.

#### 6.4 Scene Operations

Use `create_scene` to create scenes:

```
Workflow:
get_scene_schema -> create_scene
```

Key parameter notes:
- `name`: Scene name
- `properties`: JSON object containing scene type, scene atmosphere, scene location, scene description, resident characters, scene function

Scene creation tips:
- First create core scenes where the protagonist is active (2-3)
- Scene type and scene atmosphere must be selected from enum options
- Resident characters should list character names; ensure those characters have been created
- Scene function describes the scene''s narrative purpose in the story

---

### VII. Comprehensive Design Checklist

After completing fictional dynasty and faction design, use this checklist for self-review:

**Worldview Level**:
- [ ] Is the dynasty name distinctive and not identical to real dynasties?
- [ ] Does the era background match the chosen story tone?
- [ ] Do all four sub-fields of the social system have basic settings?
- [ ] Does the political landscape clearly present the core conflicts?

**Faction Level**:
- [ ] Have at least 3 mutually balancing factions been created?
- [ ] Are faction types and faction statuses reasonably distributed?
- [ ] Have inter-faction relationships been established via `create_relation`?
- [ ] Do faction resources have different focuses, avoiding homogenization?

**Character Level**:
- [ ] Does the protagonist''s identity & status (family, legitimacy, birth order) match their transmigration identity?
- [ ] Have the transmigrator''s past life memories been filled in?
- [ ] Can the legitimacy settings effectively drive plot conflicts?
- [ ] Are characters'' faction affiliations linked through the relationship graph?

**Scene Level**:
- [ ] Do core scenes cover the protagonist''s main activity spaces?
- [ ] Do scene type and atmosphere selections serve the plot needs?
- [ ] Do scenes'' resident characters reflect power control relationships?',
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
