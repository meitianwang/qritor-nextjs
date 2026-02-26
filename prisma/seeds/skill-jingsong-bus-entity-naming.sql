-- 惊悚公车小说「实体命名」技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '惊悚公车小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-jingsong-bus-entity-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'jingsong-bus-entity-naming',
  '「实体命名」：为惊悚公车小说的六大实体类型提供命名规则与丰富示例，涵盖游戏系统、路线编号、角色、副本、道具、禁令六类命名体系，强调交通终结意象的运用',
  '"Entity Naming": provide naming rules and extensive examples for six major entity types in thriller bus novels, covering six naming systems (game system, route number, characters, dungeons, props, prohibitions), emphasizing the use of transportation-terminal imagery',
  '## 「实体命名」 — 惊悚公车小说

惊悚公车小说的实体命名核心是**「旅途即游戏，终点即死亡」的双重叙事**。所有命名都服务于这个核心意象：游戏系统用「终点/末班/班车」强调无法逃脱的宿命感；路线编号用不祥数字暗示死亡概率；角色用站名作代号；副本名称暗示每个地点都是另一种陷阱；道具名用旧物和路标意象；禁令用官方口吻包裹最恐怖的规则。

好的命名让读者在第一次看到名字时就有「不对劲」的感觉——不需要解释，名字本身就在说话。

---

### 一、游戏系统命名

**命名原则**：强调「终点/末班/末日/班车」等交通终结意象。系统名称要有**机构感**（像某个存在已久的组织），同时有**终结感**（名称暗示这是某种单程旅途）。

**三类命名风格**：

| 风格 | 命名逻辑 | 气质 |
|------|---------|------|
| **机构型** | 像政府机构/运输公司，官方、冷峻 | 「终点客运总局」「班车管理委员会」 |
| **神话型** | 古代词汇+交通意象，神秘、宿命感 | 「冥途驿站」「黄泉摆渡局」 |
| **现代型** | 科技感+交通词汇，冷漠、系统感 | 「TRANSIT-0」「末班系统」 |

**15个系统命名示例**：

1. **终点客运总局** — 机构型，「总局」有官僚感，「终点」暗示没有回程
2. **末班委员会** — 机构型，「委员会」是决策机构，「末班」是最后的机会，两词并置产生荒诞的恐怖感
3. **班车管理处** — 机构型，极其平淡的名称，平淡本身就是恐怖——这件事被当成日常管理
4. **冥途客运** — 神话型，「冥途」是通往冥界之路，「客运」是日常词汇，反差产生恐惧
5. **渡亡局** — 神话型，「渡亡」是引导死者，「局」是机构——引导死亡的机构
6. **阴阳运输公司** — 神话型，字面是两个世界之间的运输，语气却像普通快递公司
7. **TERMINAL SYSTEM** — 现代型，「Terminal」双关（终点站/终止），英文有去人格化效果
8. **TRANSIT-0** — 现代型，数字0暗示起点即终点，「Transit」是过渡/运输，全名暗示这是零号过渡
9. **末班系统（MBC）** — 现代型，缩写有官方感，「末班」是最后的
10. **永夜运营中心** — 混合型，「永夜」是永远的黑夜，「运营中心」是日常机构词汇
11. **单程交通局** — 机构型，直接说明「单程」——明确告诉玩家没有回头路
12. **失联旅客管理系统** — 机构型，「失联旅客」是婉转说法，「管理系统」暗示玩家被当成数据
13. **彼岸运输管理局** — 神话型，「彼岸」是生死的另一边，「运输管理局」是现实词汇
14. **倒计时运营系统** — 现代型，名称本身就是一个倒计时，暗示时间是最核心的资源
15. **N号线运营管理委员会** — 机构型，「N号线」是变量，暗示路线是被分配的，不是固定的

---

### 二、公车路线/编号命名

**命名原则**：数字组合的暗示性是公车路线命名的核心——读者看到数字就要感受到不祥气息。路线名称则通过方向感、终点感或缺失感来制造悬念。

**数字组合的暗示逻辑**：

| 数字类型 | 暗示逻辑 | 示例 |
|---------|---------|------|
| **不祥数字** | 文化禁忌数字，读者有天然反应 | 13路、13号线 |
| **缺失/错误** | 计算机错误码，不存在的编号 | 404路、500路、503路 |
| **零/空** | 不存在的起点，虚无感 | 0路、00路、000路 |
| **倒计时** | 数字本身在倒数 | 321路、210路、1路 |
| **重复** | 重复有咒语感，像无限循环 | 666路、111路、999路 |
| **极大或极小** | 异常感，超出正常路线编号范围 | 9999路、0.5路、-1路 |
| **与死亡相关** | 中文谐音或文化联想 | 4路（死路）、14路（一死路）、44路 |
| **终点站数字** | 路线的终点站是某个特定数字 | 终点7站/终点13站/终点0站 |

**路线名称（非编号）的命名方式**：

| 路线名格式 | 示例 |
|-----------|------|
| 「X到X」的路线 | 尘世到彼岸/现世到末站/已知到未知 |
| 仅有终点 | 开往末日/开往无名/开往0号站 |
| 仅有起点 | 从这里出发/从现在起/从末站出发 |
| 模糊方向 | 向深处去/往下走/向没有人的地方 |
| 反向表达 | 不归线/单程/无返班次 |

**20个路线/编号命名示例**：

1. **404路** — HTTP错误码，经典网络彩蛋，「找不到的路线」
2. **13路** — 不祥数字，国际通用，简单直接
3. **0路** — 不存在的起点，或者编号为零的路线（通常意味着试验性/特殊）
4. **321路** — 倒计时，像火箭发射前的倒计时，也像人生倒计时
5. **666路** — 三个6，有西方文化的「恶魔数字」联想，同时中文谐音「溜溜溜」（滑走/消失）
6. **999路** — 三个9，999是紧急电话号码（部分地区），也有「即将结束」的暗示
7. **终点13号线** — 13作为终点站数字，到达终点就是死亡
8. **44路** — 中文谐音「死死路」，简洁，有效
9. **-1路** — 负数路线，不可能存在，暗示这条路线在正常世界之外
10. **0.5路** — 分数路线，存在于两个整数之间的夹缝，暗示「半个世界」
11. **单程1号线** — 名称里直接说明「单程」
12. **末班N路** — N是变量，每次都是「末班」
13. **开往X站的路线（X未定）** — 终点是未知的变量
14. **深夜零号** — 深夜的零号路线，「深夜」暗示危险时段，「零号」是特殊编号
15. **倒车线** — 「倒车」在交通中是反向行驶，在惊悚语境中是「逆行/不该走的方向」
16. **末日11号** — 11在一些文化中有「不完整的12」的暗示，「末日」直接点明
17. **夜班00路** — 「夜班」是夜间运营，「00路」是双零编号，有特殊暗示
18. **无名线** — 没有名字的路线，暗示「不被承认存在」
19. **终结特快** — 「特快」是快速列车，「终结」是终结，两词冲突产生恐怖感
20. **321-逆行** — 数字倒计时加「逆行」，双重倒计时意象

---

### 三、乘客/角色命名

**命名原则**：公车乘客的命名要区分两类——**新手乘客**（日常感名字，但有某种暗示）和**老玩家**（用路线号或站名作为代号，体现游戏经历）。

**新手乘客的命名风格**：

名字要普通，但姓名中可以埋入「旅途」相关的意象：
- 姓氏选择：路、林、方、向、远、程、旅、行、来、归
- 名字选择：与旅途相关的词（远、程、来、归、归来、终、末）或普通名（加上姓氏后有暗示性）

**示例**：
- 林柯（林+柯，柯有「枝杈/路途分叉」的意象）
- 方远（方向+远方，旅途意象）
- 陈末（末=终末，普通名字但有暗示）
- 路归（路+归，路的归处在哪里）
- 向晚（向+晚，走向傍晚，黄昏意象）
- 来生（来+生，来到生死边界）

**老玩家的代号命名风格**：

老玩家用路线号或站名作为代号——这是游戏内的惯例，也是身份的标志。代号通常是：

| 代号类型 | 命名逻辑 | 示例 |
|---------|---------|------|
| 路线号代号 | 用自己第一次乘坐的路线号 | 「13路」「404」「零号」 |
| 站名代号 | 用某个印象深刻的站名 | 「末站」「无名」「七站」 |
| 数字代号 | 用经历过的副本次数 | 「第七局」「十三场」 |
| 乘客代号 | 用自己在某辆公车上的座位号 | 「九号」「末排」「C3」 |

**混合命名示例**（新手全名+老玩家代号）：

| 真实名字 | 老玩家代号 | 代号由来 |
|---------|----------|---------|
| 林柯 | — | 新手，无代号 |
| 陈志远 | 「末站」 | 第一次上车时坐在末站下车的座位 |
| 方绮 | 「零号」 | 曾在0路上生存过 |
| 谢墨 | 「第七」 | 第七个踏上这个游戏的老玩家之一 |
| 赵以南 | 「13路」 | 第一次在13路上活下来 |

---

### 四、副本命名

**命名原则**：公车之后的副本如何命名——副本名称要与「公车起点」形成对比或关联，同时本身就暗示副本的核心恐惧。

**三类副本命名风格**：

| 风格 | 命名逻辑 | 示例 |
|------|---------|------|
| **地点型** | 副本发生的具体地点（废弃/异常的地点） | 「废弃车站」「无人公路」「末站候车室」 |
| **规则型** | 副本的核心规则作为名称 | 「禁止呼救」「全员沉默」「无法死亡」 |
| **感知型** | 副本给人的核心感受 | 「无法清醒的地方」「镜中城市」「声音消失的森林」 |

**15个副本命名示例**：

1. **废弃候车室** — 被废弃的候车室，公车延伸意象，等待的地方变成了陷阱
2. **无人道路** — 没有人的道路，公路上只有玩家，没有任何外界援助
3. **永夜驿站** — 永远是夜晚的驿站，光线是资源，是压力源
4. **镜像终点站** — 与现实终点站镜像对称的副本，每件事都是反着来的
5. **倒计时庇护所** — 表面是安全的庇护所，但有倒计时——安全是有时限的
6. **无声铁路** — 铁路延伸了公车的交通意象，「无声」是副本的核心规则（禁止发出声音）
7. **重复的第三站** — 到了第三站就会被循环送回，必须打破循环才能前进
8. **锈蚀停车场** — 废弃停车场，公车的停放地变成了副本，腐朽感极强
9. **凌晨三点的加油站** — 具体时间+具体地点，「凌晨三点」是鬼时，「加油站」有普通感
10. **终点的背面** — 抵达了终点站，但「背面」是正常终点站看不到的一侧
11. **售票员的房间** — 售票员消失了，他们的房间是副本入口，里面记录着所有乘客的信息
12. **连接线** — 不是任何一个终点，而是两个终点之间的连接——最危险的过渡地带
13. **单程区间** — 区间没有返回，进去就不能回头
14. **末班后的站台** — 末班车开走后，站台上还有东西留下来
15. **被遗忘的站次** — 这个站在官方地图上不存在，是被系统抹除的地点

---

### 五、道具命名

**命名原则**：公车限定道具的命名风格——旧物/路标/票价相关意象，名称本身要暗示道具的来历和性质。

**三类道具命名意象**：

| 意象类型 | 命名风格 | 适用道具类型 |
|---------|---------|------------|
| **旧物意象** | 已褪色/已磨损/已损坏的旅途物品 | 信息类、线索类道具 |
| **路标意象** | 方向/距离/终点相关 | 导航类、地图类道具 |
| **票价/凭证意象** | 车票/凭证/通行证相关 | 特权类、豁免类道具 |

**10个道具命名示例**：

1. **末班票根（撕毁版）** — 「票根」是购票凭证的留底，「撕毁」意味着使用过了，「末班」说明这是最后的信息
2. **旧路线图（修正版）** — 路线图是方向工具，「旧」说明是历史信息，「修正版」暗示原版有错误（但可能这个版本也有错）
3. **失物招领牌** — 失物招领是公共场所找回遗失物的机制，但「招领」意味着有人失去了什么——是乘客失去了什么？
4. **换乘代币（已磨损）** — 「换乘」是转乘，「代币」是特殊货币，「已磨损」说明用过很多次——谁用过这么多次？
5. **单程凭证** — 「凭证」是证明资格的东西，「单程」是不能回头，整体是「允许你单程通行」的资格证明
6. **破损座位指示牌** — 座位指示牌本是普通乘车设施，但「破损」+某个特殊座位号+在这里出现，本身就是悬念
7. **司机备忘录（残件）** — 司机留下的备忘录，「残件」意味着不完整——原本的内容去哪里了？
8. **无主行李牌** — 没有主人的行李牌，主人的消失是一个悬念
9. **倒序车票** — 正常车票是起点到终点，「倒序」是终点到起点——这张票的持有者在反向旅行？
10. **零站通行证** — 「零站」是不存在的第零个站，通行证允许持有者在规则之外行动

---

### 六、禁令/规则命名

**命名原则**：车厢禁令如何描述才有仪式感和威慑力——禁令必须像真实的官方公告，但内容要有悬念感和规则感。好的禁令命名有四个要素：**用官方口吻、有具体场景、有明确后果（可以含糊）、暗示背后逻辑**。

**禁令命名的语言规律**：

| 语言模式 | 示例 | 效果 |
|---------|------|------|
| **「禁止X」** | 禁止移动/禁止离席/禁止交换 | 直接，有力，命令感强 |
| **「请X」（被动语气）** | 请保持安静/请就位/请勿移动 | 礼貌外壳包裹命令，更有讽刺感 |
| **「不得X」** | 不得离座/不得使用/不得接触 | 正式，有法律条文感 |
| **「X者将Y」** | 移动者将被记录/交换者视为结盟/呼救者将触发… | 条件句，有因果逻辑，暗示后果 |
| **「本次运营……」** | 本次运营期间，禁止…… | 机构口吻，「运营」暗示这是有组织的行为 |

**10条高质量禁令命名示例**：

**禁令1：「禁止乘客擅自离席」**
- 分析：「擅自」是正式语言（未经许可），「离席」是离开座位——完全官方的用词，但隐含的意思是「离席会有惩罚」
- 使用场景：核心规则，第一条宣布

**禁令2：「不得向其他乘客透露个人信息」**
- 分析：「个人信息」范围模糊，到底什么算个人信息？名字算吗？职业算吗？「其他乘客」暗示「你和他人是分隔的」
- 使用场景：信息类规则，制造「每个人都是孤立节点」的氛围

**禁令3：「本次运营期间，任何形式的物品交换均视为结盟申报」**
- 分析：「任何形式」覆盖所有可能性，「视为结盟申报」是一个令人意外的定义——给水也算结盟
- 使用场景：交换/道具类规则，制造「善意行为有代价」的扭曲感

**禁令4：「请保持当前座位直至系统另行通知」**
- 分析：「系统另行通知」意味着系统在监控并且会主动通知——系统有自主意志
- 使用场景：空间限制类规则

**禁令5：「禁止集体行动。超过两人的协作行为将触发群体规则」**
- 分析：「集体行动」是正常社会行为，但在这里被禁止；「超过两人」的精确限制暗示三人以上会有额外惩罚
- 使用场景：社交博弈类规则，迫使玩家保持小规模联盟

**禁令6：「乘客有义务在知悉规则后72秒内完成记录，超时将视为弃权」**
- 分析：「72秒」是极其具体的时间，暗示系统在精确计时；「弃权」意味着没有记录就失去某种权利
- 使用场景：信息竞争类规则，制造时间压力

**禁令7：「不得呼救或向外界求援。此类行为将触发隔离程序」**
- 分析：「隔离程序」是令人恐惧的未知后果；禁止求援暗示外界援助理论上存在（但实际上不可能）
- 使用场景：求助类规则，关闭求援选项

**禁令8：「禁止讨论规则本身。对规则的公开讨论视为规则测试，后果自负」**
- 分析：这是一条元规则——禁止谈论规则。「规则测试」和「后果自负」给出了威胁但没有说明具体后果
- 使用场景：信息垄断类规则，让玩家对规则的理解只能通过亲身触发获得

**禁令9：「本次运营期间，身份证明文件的出示构成身份解锁行为，解锁后的乘客将进入可识别名单」**
- 分析：官僚语言，「身份解锁」和「可识别名单」暗示原本乘客的身份是模糊的——隐藏身份才是安全的
- 使用场景：身份类规则，制造「报出名字就危险了」的氛围

**禁令10：「末班运营期间，所有淘汰均不可撤销。乘客同意乘车即视为同意本条款」**
- 分析：「末班运营期间」限定时段；「不可撤销」和「同意本条款」是合同语言——乘客在上车时就签了合同
- 使用场景：最终条款，总括性规则，制造「上了这辆车就逃不掉」的宿命感',
  '## "Entity Naming" — Thriller Bus Novel

The core of entity naming in thriller bus novels is the **dual narrative of "journey as game, terminus as death."** All naming serves this core imagery: game systems use "terminus/last run/bus service" to emphasize inescapable fate; route numbers use ominous digits to imply death probability; characters use stop names as aliases; dungeon names imply each location is another kind of trap; prop names use imagery of worn objects and road signs; prohibitions wrap the most terrifying rules in official-sounding language.

Good naming makes readers feel "something is wrong" on first encounter — no explanation needed, the name itself speaks.

---

### 1. Game System Naming

**Principle**: Emphasize "terminus/last run/end of days/bus service" imagery of transportation finality. System names must have **institutional feeling** (like an organization that has existed for a long time) combined with **finality** (name implies a one-way journey).

**Three naming styles**:

| Style | Naming Logic | Atmosphere |
|-------|-------------|-----------|
| **Institutional** | Like government agency/transportation company, official, cold | "General Terminal Transport Bureau", "Bus Service Regulation Committee" |
| **Mythological** | Ancient vocabulary + transportation imagery, mysterious, fatalistic | "Underworld Way Station", "River Styx Dispatch Bureau" |
| **Modern** | Tech feel + transportation vocabulary, indifferent, systematic | "TRANSIT-0", "Last Run System" |

**15 System Naming Examples**:

1. **General Terminal Transport Bureau** — Institutional; "general bureau" is bureaucratic; "terminal" implies no return journey
2. **Last Run Committee** — Institutional; "committee" is a decision-making body; "last run" is the final chance; the two words juxtaposed create absurdist horror
3. **Bus Service Management Office** — Institutional; extremely bland name; blandness itself is terrifying — this is treated as routine management
4. **Underworld Transport** — Mythological; "underworld way" is the road to the underworld; "transport" is everyday vocabulary; contrast creates fear
5. **Death Crossing Bureau** — Mythological; "death crossing" guides the departed; "bureau" is an institution — a bureau for guiding death
6. **Yin-Yang Transportation Company** — Mythological; literally transport between two worlds, but spoken like an ordinary courier company
7. **TERMINAL SYSTEM** — Modern; "terminal" is a double meaning (terminus / terminate); English depersonalizes
8. **TRANSIT-0** — Modern; zero implies start equals end; "transit" is transition/transport; whole name implies this is transition number zero
9. **Last Run System (LRS)** — Modern; abbreviation has official feel; "last run" is terminal
10. **Eternal Night Operations Center** — Mixed; "eternal night" is permanent darkness; "operations center" is everyday institutional vocabulary
11. **One-Way Transit Bureau** — Institutional; directly states "one-way" — explicitly tells players there is no way back
12. **Lost Passenger Management System** — Institutional; "lost passengers" is a euphemism; "management system" implies players are treated as data
13. **Other Shore Transport Administration** — Mythological; "other shore" is the far side of life and death; "transport administration" is realistic vocabulary
14. **Countdown Operations System** — Modern; the name itself is a countdown; implies time is the core resource
15. **Route N Operations Management Committee** — Institutional; "Route N" is a variable, implying routes are assigned, not fixed

---

### 2. Bus Route/Number Naming

**Principle**: The suggestive power of number combinations is the core of bus route naming — readers should feel an ominous sense just from seeing the number. Route names create mystery through direction, terminus, or absence.

**Number suggestion logic**:

| Number Type | Suggestion Logic | Examples |
|------------|----------------|---------|
| Ominous numbers | Culturally taboo digits, natural reader response | Route 13 |
| Missing/error | Computer error codes, non-existent numbers | Route 404, Route 500, Route 503 |
| Zero/empty | Non-existent starting point, sense of nothingness | Route 0, Route 00, Route 000 |
| Countdown | Numbers themselves are counting down | Route 321, Route 210, Route 1 |
| Repeating | Repetition has incantation feel, like infinite loop | Route 666, Route 111, Route 999 |
| Extreme values | Sense of abnormality, outside normal route number range | Route 9999, Route 0.5, Route -1 |
| Death associations | Chinese phonetic associations or cultural connections | Route 4 (death route), Route 14, Route 44 |
| Terminus numbers | Terminus stop is a specific number | Terminus Stop 7 / Terminus Stop 13 / Terminus Stop 0 |

**20 Route/Number Naming Examples**:

1. **Route 404** — HTTP error code, internet culture Easter egg, "the route that cannot be found"
2. **Route 13** — Ominous number, universally recognized, simple and direct
3. **Route 0** — Non-existent starting point, or zero-numbered route (usually implies experimental/special)
4. **Route 321** — Countdown, like pre-launch countdown, also like life countdown
5. **Route 666** — Three sixes, Western "devil number" association, also Chinese phonetic "liuliuliu" (sliding away/disappearing)
6. **Route 999** — Three nines; 999 is emergency number (in some regions), also suggests "about to end"
7. **Line 13 Terminus** — 13 as terminus stop number; reaching terminus means death
8. **Route 44** — Chinese phonetic "si si lu" (death death road), concise and effective
9. **Route -1** — Negative number route, impossible to exist, implies this route is outside the normal world
10. **Route 0.5** — Fractional route, existing in the gap between two integers, implies "half a world"
11. **One-Way Line 1** — Name directly states "one-way"
12. **Last Run Route N** — N is a variable; every trip is "last run"
13. **Route to Station X (X Undefined)** — Terminus is an unknown variable
14. **Late Night Zero** — Zero-number route at midnight; "late night" implies danger period
15. **Reverse Line** — "Reverse" is going the wrong direction in traffic; in horror context means "wrong direction / direction that shouldn''t be taken"
16. **Doomsday No. 11** — 11 in some cultures implies "incomplete 12"; "doomsday" directly states it
17. **Night Shift Route 00** — "Night shift" is nighttime operation; "00" is double-zero, special implication
18. **Nameless Line** — Route without a name; implies "not acknowledged to exist"
19. **Terminal Express** — "Express" is fast transport; "terminal" is termination; word collision creates horror
20. **321-Reverse** — Countdown digits plus "reverse," double countdown imagery

---

### 3. Passenger/Character Naming

**Principle**: Bus passenger naming distinguishes two types — **newcomer passengers** (everyday-sounding names with subtle implications) and **veteran players** (using route numbers or stop names as aliases, reflecting game experience).

**Newcomer passenger naming style**:
Names should be ordinary, but character names can embed "journey"-related imagery in given name or surname:
- Surname choices: Lu (路/road), Lin, Fang (方/direction), Xiang (向/toward), Yuan (远/far), Cheng (程/journey), Lü (旅/travel), Hang (行/travel), Lai (来/coming), Gui (归/returning)
- Given name choices: Words related to journeys (far, journey, coming, returning, terminus, end) or ordinary names that gain implication when combined with the surname

**Examples**:
- Lin Ke (林柯 — forest branch, imagery of a path forking)
- Fang Yuan (方远 — direction + far distance, journey imagery)
- Chen Mo (陈末 — mo = final/end, ordinary name with implication)
- Lu Gui (路归 — road + returning, where does the road return to?)
- Xiang Wan (向晚 — toward + dusk, twilight imagery)
- Lai Sheng (来生 — coming + life, arriving at the boundary of life and death)

**Veteran player alias naming style**:

Veteran players use route numbers or stop names as aliases — convention within the game, and a marker of identity:

| Alias Type | Naming Logic | Examples |
|-----------|-------------|---------|
| Route number alias | Using the number of the first route they rode | "Route 13", "404", "Zero" |
| Stop name alias | Using a particularly memorable stop name | "Last Stop", "Nameless", "Seventh Stop" |
| Number alias | Using the count of dungeons they''ve experienced | "Seventh Round", "Thirteenth Game" |
| Passenger alias | Using their seat number on a particular bus | "Seat Nine", "Back Row", "C3" |

**Combined naming examples** (newcomer full name + veteran alias):

| Real Name | Veteran Alias | Alias Origin |
|-----------|--------------|-------------|
| Lin Ke | — | Newcomer, no alias |
| Chen Zhiyuan | "Last Stop" | First bus had him sitting in the seat for the last stop |
| Fang Qi | "Zero" | Once survived Route 0 |
| Xie Mo | "Seventh" | One of the seventh players to enter this game |
| Zhao Yinan | "Route 13" | First survived on Route 13 |

---

### 4. Dungeon Naming

**Principle**: How to name dungeons after the bus — dungeon names must contrast with or connect to the "bus starting point," while themselves hinting at the dungeon''s core fear.

**Three dungeon naming styles**:

| Style | Naming Logic | Examples |
|-------|-------------|---------|
| **Location type** | Specific location where dungeon occurs (abandoned/abnormal) | "Abandoned Station", "Deserted Highway", "Last Stop Waiting Room" |
| **Rule type** | Core rule of the dungeon as the name | "No Calling for Help", "Total Silence", "Cannot Die" |
| **Perception type** | Core sensation the dungeon evokes | "The Place Where You Can''t Wake Up", "Mirror City", "Forest Where Sounds Disappear" |

**15 Dungeon Naming Examples**:

1. **Abandoned Waiting Room** — Abandoned bus waiting room, extends bus imagery; place of waiting becomes a trap
2. **Deserted Road** — Road with no one on it; only players on the highway, no external help possible
3. **Eternal Night Way Station** — Perpetually nighttime way station; light is a resource and source of pressure
4. **Mirror Terminal** — Mirror image of the real terminal, everything is reversed
5. **Countdown Shelter** — Appears to be a safe shelter, but with a countdown — safety has a time limit
6. **Silent Railway** — Railway extends bus transportation imagery; "silent" is the dungeon''s core rule (no sound allowed)
7. **Repeating Third Stop** — Arriving at the third stop loops back to start; must break the loop to advance
8. **Rusted Parking Lot** — Abandoned parking lot; where buses are stored becomes a dungeon; extreme decay aesthetic
9. **Gas Station at 3 AM** — Specific time + specific location; "3 AM" is the witching hour; "gas station" has an ordinary feel
10. **Back Side of the Terminus** — Arrived at the terminal station, but "back side" is the side of the normal terminus no one can see
11. **Ticket Seller''s Room** — The ticket seller has disappeared; their room is the dungeon entrance, recording all passenger information inside
12. **Connecting Line** — Not any terminus, but the connection between two termini — the most dangerous transitional zone
13. **One-Way Section** — Section with no return; once entered, cannot go back
14. **Platform After Last Run** — After the last bus departs, something remains on the platform
15. **The Forgotten Stop** — This stop doesn''t exist on the official map; a location erased by the system

---

### 5. Prop Naming

**Principle**: Bus-exclusive prop naming style — worn objects, road signs, ticket-related imagery; names themselves should hint at the prop''s origin and nature.

**Three prop naming imagery types**:

| Imagery Type | Naming Style | Applicable Prop Types |
|-------------|-------------|----------------------|
| **Worn object imagery** | Faded/worn/damaged journey objects | Information, clue props |
| **Road sign imagery** | Direction/distance/terminus related | Navigation, map props |
| **Ticket/voucher imagery** | Bus ticket/voucher/pass related | Privilege, exemption props |

**10 Prop Naming Examples**:

1. **Last Run Ticket Stub (Torn)** — "Ticket stub" is the record kept after ticket use; "torn" means it''s been used; "last run" indicates this is terminal information
2. **Old Route Map (Revised Edition)** — Route map is a directional tool; "old" indicates historical information; "revised edition" implies the original had errors (but this version may also be wrong)
3. **Lost and Found Sign** — Lost and found is the mechanism for recovering lost items; but "found" means someone lost something — what did the passenger lose?
4. **Transfer Token (Worn)** — "Transfer" is changing vehicles; "token" is special currency; "worn" means used many times — who used it this many times?
5. **One-Way Voucher** — "Voucher" proves entitlement; "one-way" means no going back; together it is a "permission to travel one way" proof
6. **Damaged Seat Indicator** — Seat indicators are ordinary transit facilities; but "damaged" + a special seat number + appearing here is itself a mystery
7. **Driver''s Memo (Fragment)** — Memo left by the driver; "fragment" means incomplete — where did the original content go?
8. **Unclaimed Luggage Tag** — Luggage tag with no owner; the owner''s disappearance is a mystery
9. **Reversed Ticket** — Normal ticket is origin to destination; "reversed" is destination to origin — the holder of this ticket is traveling in reverse?
10. **Stop Zero Pass** — "Stop Zero" is the non-existent zeroth stop; the pass allows the holder to act outside the rules

---

### 6. Prohibition/Rule Naming

**Principle**: How to phrase bus prohibitions to have ritual gravitas and deterrence — prohibitions must sound like genuine official announcements, but their content must have an element of mystery and rule-awareness. Good prohibition naming has four elements: **official tone, specific scenario, clear consequences (can be vague), implication of underlying logic**.

**Language patterns for prohibition naming**:

| Language Pattern | Example | Effect |
|----------------|---------|--------|
| "Prohibited X" | Prohibited from moving / leaving seat / exchanging | Direct, forceful, strong command feel |
| "Please X" (passive) | Please remain quiet / take your seat / do not move | Polite shell wrapping a command, more ironic |
| "Must not X" | Must not leave seat / must not use / must not touch | Formal, has legal statute feel |
| "Those who X will Y" | Those who move will be recorded / exchanging is treated as alliance declaration | Conditional clause, cause-effect logic, implies consequences |
| "During this service…" | During this service, prohibited from… | Institutional tone; "service" implies organized operation |

**10 High-Quality Prohibition Naming Examples**:

**Prohibition 1: "Passengers are prohibited from leaving their seats without authorization"**
Analysis: "Without authorization" is formal language (without permission); "leaving seat" is leaving one''s position — completely official wording, but the implication is "leaving will be penalized"

**Prohibition 2: "Personal information must not be disclosed to other passengers"**
Analysis: "Personal information" is vaguely scoped — does a name count? An occupation? "Other passengers" implies "you are separated from others"

**Prohibition 3: "During this service, any form of item exchange constitutes an alliance declaration"**
Analysis: "Any form" covers all possibilities; "constitutes an alliance declaration" is an unexpected definition — giving water also counts as forming an alliance

**Prohibition 4: "Please maintain your current seat until further notice from the system"**
Analysis: "Further notice from the system" means the system is monitoring and will actively notify — the system has autonomous intent

**Prohibition 5: "Collective action is prohibited. Collaborative behavior involving more than two persons will trigger group rules"**
Analysis: "Collective action" is normal social behavior but prohibited here; the precise limit of "more than two" implies three or more will receive additional penalties

**Prohibition 6: "Passengers have an obligation to complete documentation within 72 seconds of learning a rule; exceeding this time constitutes forfeiture"**
Analysis: "72 seconds" is an extremely specific time, implying the system is precisely counting; "forfeiture" means failing to document loses some right

**Prohibition 7: "Calling for help or seeking external assistance is prohibited. Such behavior will trigger an isolation procedure"**
Analysis: "Isolation procedure" is a terrifying unknown consequence; prohibiting rescue calls implies external help theoretically exists (but is actually impossible)

**Prohibition 8: "Discussion of the rules themselves is prohibited. Public discussion of rules is treated as rule testing, at the participant''s own risk"**
Analysis: This is a meta-rule — prohibiting discussion of rules. "Rule testing" and "at one''s own risk" provide a threat without specifying the consequence

**Prohibition 9: "During this service, presenting identity documents constitutes an identity unlock action; unlocked passengers will enter the identifiable roster"**
Analysis: Bureaucratic language; "identity unlock" and "identifiable roster" imply that originally passengers'' identities are ambiguous — concealing identity is the safe option

**Prohibition 10: "During the last run service, all eliminations are irrevocable. Passengers consent to this clause by boarding"**
Analysis: "During the last run service" defines the time period; "irrevocable" and "consent to this clause" are contract language — passengers signed the contract when they boarded',
  (SELECT id FROM novel_creation_method WHERE name = '惊悚公车小说' LIMIT 1),
  1,
  91,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  novel_creation_method_id = VALUES(novel_creation_method_id),
  is_active = VALUES(is_active),
  sort_order = VALUES(sort_order);
