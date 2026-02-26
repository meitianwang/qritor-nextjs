-- 灵异直播小说实体命名 Skill
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '灵异直播小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-lingyi-live-entity-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'lingyi-live-entity-naming',
  '灵异直播小说实体命名技能：指导如何为故事中各类实体命名，涵盖主播账号名/直播ID、鬼怪/灵异实体、凶宅/荒村地点、弹幕观众ID（普通vs非人）、虚构直播平台名称、民间法器/现代道具等六类命名规则，每类提供10-15个具体示例',
  'Ghost livestream entity naming skill: guides how to name various entities in the story, covering streamer account names/live IDs, ghosts/supernatural entities, haunted locations, danmaku viewer IDs (normal vs. non-human), fictional streaming platform names, folk ritual items/modern props — six naming categories with 10-15 specific examples each',
  '## 灵异直播小说实体命名指南

好的命名是灵异直播小说「可信度」的基石。读者能否代入「这是真实发生在网络直播世界里的故事」，很大程度上取决于各类实体的命名是否有说服力。本指南提供六类命名规则和具体示例。

---

### 一、主播账号名 / 直播ID 命名规则

主播的账号名是读者对主角的第一印象，必须满足以下要求：
1. **可信度**：听起来像真实存在的网络主播，而不是小说里的角色名
2. **记忆点**：要容易记住，但不能太「网红感」
3. **隐含意义**：最好有一层你不仔细看不会发现的灵异暗示

#### 命名方式一：数字 + 汉字混搭

数字代表序号/账号感，汉字提供灵异联想：

1. **阿明0327** ——「0327」既像账号数字后缀，也可以是某个特殊日期（死亡日期、事件日期）
2. **夜游神999** ——「夜游神」是中国民间神祇（夜间游荡的神），「999」常见于网络账号
3. **林一666** ——「林一」是普通人名，「666」有网络梗+恶魔数字双重含义
4. **探宅007** ——「探宅」是直播类型标签，「007」既像特工代号，也带有「全天无休」的工作感
5. **陆九儿** ——名字里含「九」，九在民间既是吉数也是禁忌数（九九归一/第九层地狱）

#### 命名方式二：纯汉字（有双关义）

表面是普通昵称，实则暗含民俗/灵异含义：

6. **阴霾里的阿橙** ——「阴霾」是气象词，也暗指阴气；「阿橙」是可爱的普通昵称，两者反差制造记忆点
7. **摄鬼的人** ——「摄」有拍摄+震慑/收服的双重含义
8. **夜半敲门声** ——直接是一个意象，民间有「夜半不能应门」的说法
9. **白天不懂夜的黑** ——网络常见用语（八九十年代流行歌词）在这里带了新的含义
10. **看门的** ——极其朴素，但「看门」在民俗里有守护/阻拦亡魂的含义（门神/看门虎）

#### 命名方式三：英文 + 汉字混搭

现代自媒体风格，国际感：

11. **Miss灵** ——英文称谓+中文单字，「灵」有灵魂/灵异双关
12. **NightWalker_夜明** ——英文「夜行者」+「夜明」（天快亮时，也是最暗时），两者相互呼应
13. **Ghost_某鬼** ——直接点题但带有自嘲感，网络主播常见的自我标签
14. **Live_从不下播** ——「从不下播」是功能性描述，在灵异语境下变成诡异的宣言

---

### 二、鬼怪 / 灵异实体命名

鬼怪的命名要避免两个极端：太普通（「白色长发女鬼」这样的描述性命名）和太玄幻（「虚空之主」「冥渊魔神」这类与民间鬼怪完全不搭的命名）。好的灵异实体名应该有：

- **民间传说的根基**：来自真实的民俗词汇或经过改造
- **现代都市传说感**：能在「真实发生在都市里」的语境下存在
- **不完整感**：名字本身有信息缺口，让读者想追问

#### 2.1 有民间传说根基的命名

1. **囡囡** ——小女孩的亲昵称呼，用来称呼一个永远是孩童状态的恶灵，形成强烈反差
2. **皮匠鬼** ——民间有关于皮匠（制皮手工艺人）的鬼故事，职业+鬼的组合有现实感
3. **摸脚婆** ——南方民间传说中夜间摸人脚的女性鬼怪，保留了民俗原型
4. **七月先生** ——「七月」是鬼月，「先生」用于称呼阴间的管理者，平静的称谓比凶名更恐怖
5. **无头堂客** ——「堂客」是方言中的妻子/女性，「无头」是民间常见鬼形，两者组合有强烈地域感

#### 2.2 现代都市传说风格的命名

6. **三楼的租客** ——「租客」是当代都市词汇，限定了空间（三楼），形成了独特的都市灵异感
7. **不会拍照的那个** ——指拍合照时没有出现在照片里的那个存在，现代都市传说的典型形式
8. **抢红包的** ——抢红包是当代微信社交行为，这个实体的存在方式是渗透进移动互联网
9. **凌晨发消息的前任** ——极其现代，「前任」+「凌晨」有真实的都市恐惧感（这个前任真的还在吗？）
10. **直播间里的第零号** ——在直播平台上，「0号」是不应该存在的账号编号，有技术层面的诡异感

#### 2.3 混合风格（民间 + 现代）

11. **守夜佬** ——「守夜」有守灵/看护亡者的含义，「佬」是方言里对男性的俗称，保留了民俗感但不过时
12. **问路鬼** ——民间有「问路鬼会把人引进荒郊野地」的说法，在GPS时代依然有效力
13. **阴阳眼的那位** ——用「那位」代替名字，在中文里表示避讳，不直呼其名本身是一种处理方式

---

### 三、凶宅 / 荒村地点命名

地点命名是「可信度」最重要的一环。「鬼宅」「凶地」这类标签化命名完全无效——真正能制造恐惧的是**像真实地址一样的命名**。

#### 3.1 命名原则

- **用真实的地址格式**：XX路XX号、XX巷X弄、XX村XX组
- **数字要有暗示但不明显**：「花园小区43号楼」好过「骷髅路13号」
- **历史感与现代感的混搭**：老地名+新建筑类型，或新地名+实际上是旧建筑

#### 3.2 城市凶宅命名（10例）

1. **兴平路219弄** ——普通上海弄堂地址，「219」可以是一个特殊日期
2. **幸福里32号** ——「幸福里」是极普通的小区名，「32号」是末尾单元，往往是最偏僻的那栋
3. **旭日花园A栋负一层** ——「旭日」是朝气蓬勃的名字，负一层是地下室，反差极强
4. **复兴路口的那栋老楼** ——「复兴路」在许多城市存在，「那栋老楼」是模糊性称呼，强调其特殊性
5. **清平苑1901室** ——「清平」是安静祥和的意思，「1901」谐音「一鬼零一」（far-fetched但可用于故事设定）
6. **长白山路拆迁留下的最后一栋** ——描述性地址，拆迁遗留建筑是当代都市的真实灵异场景
7. **环城东路医院旁的老宿舍** ——医院旁的住宅，医院是与死亡距离最近的现代建筑
8. **铁路边的废品站** ——铁路和废品站都是都市边缘空间，适合灵异故事的发生
9. **新建商场B3层** ——地下第三层（地下三层在中国文化中常与地下世界联系）
10. **中山大道428号工厂旧址** ——工厂旧址，有历史事故的可能性，「428」可以暗示某个日期

#### 3.3 郊外荒村/荒地命名（10例）

1. **官庄村** ——带「官」字的村名暗示曾经有特殊用途（官方的、衙门的），在废弃后更显诡异
2. **阴沟岭** ——「阴」+地形词「岭」，地名本身带有阴气
3. **烂泥坝旧村** ——极普通的农村地名风格，「烂泥」是荒芜感，「旧村」是被遗弃的
4. **无名岗** ——「无名」在民间地名中表示「没有人敢命名」或「历史上发生过太多事以至于无法被命名」
5. **七娘坟山** ——「七娘」是某位女性的俗称（七女），「坟山」是山的地方俗称（有许多坟的山）
6. **狗不进村** ——真实存在于中国民间的村名类型，动物的本能性回避是地名的来源
7. **孤魂庙废址** ——「孤魂庙」是祭祀无主孤魂的庙宇，废弃后无人祭祀，意味着那些孤魂无处可去
8. **枯骨岭** ——地形词+骸骨，有明确的历史事件暗示（曾经发生过大规模死亡）
9. **三叉路口的老榕树** ——三叉路口在民间是鬼怪出没的地方，老榕树是南方最常见的灵异依附植物
10. **水鬼坑** ——直接以水鬼的俗名命名的地方，在民俗地图上真实存在，不会显得刻意

---

### 四、弹幕观众ID命名

弹幕观众的ID设计是灵异直播小说最有创意的命名领域——普通观众和非人观众的ID必须有根本性的差异，但非人观众的ID不能太明显，要让读者在「发现」它的那一刻才感到背脊发凉。

#### 4.1 普通观众ID的命名规律

普通观众ID的特征：随意、有个性、偶尔带网络俗语：

1. **猫咪吃鱼丸** ——典型的可爱随机ID
2. **不睡觉的那个** ——平台常见的自嘲型ID
3. **宝塔镇河妖0818** ——用了梗词（宝塔镇河妖是《西游记》台词），后面加了数字后缀
4. **等一下就睡觉** ——自嘲凌晨看直播的习惯
5. **今晚吃什么** ——漫无目的的ID，代表随机路过的观众
6. **大鹅要撕你** ——带有攻击性玩笑感的ID，是网络弹幕常见的搞怪风格
7. **广西来的铁子** ——地域+昵称，营造真实的网络氛围
8. **我是第一个来的** ——表达进入直播间时序的ID，很常见
9. **求求主播别吓我了** ——回应内容的ID，说明这个观众真的在追这个直播
10. **就是来看热闹的路人甲** ——自我定位为「路人」，现实感极强

#### 4.2 非人观众ID的命名规律

非人观众ID的设计要遵循「异常，但不明显异常」的原则——读者第一次看到它时要能「通过」，第二次或第三次才感到不对劲。

**设计维度一：乱码型**
ID看起来像技术故障，但有某种规律：

11. **Ａ０１Ｃ０１Ａ０１** ——全角字符+有规律的字母数字组合，看起来像系统账号，实则有规律（A01重复出现）
12. **̶̷̸̡̢̛̈̓̃̈͜͠** ——Unicode异常字符组合，在中文弹幕界面显示为乱码，但有读者注意到这组字符在某种字符集里有含义

**设计维度二：日期型/数字型**
ID直接是某个特殊日期，读者后来才发现那个日期的含义：

13. **19890604** ——敏感日期格式，或者是故事中某起死亡事件的日期
14. **_0731_** ——带下划线的日期，日期「0731」在故事中将被揭示为某人的死亡日期
15. **距今1247天** ——倒计时或正计时格式，「1247天前」是某个特定日期，读者需要自己算出来

**设计维度三：知道太多型**
ID本身就暗示这个账号知道太多信息：

16. **看你已经三年了** ——三年前开始关注，主播三年前还没开始直播……
17. **我认识你爸爸** ——看似玩梗，但如果主播的父亲已经去世……
18. **门开着呢** ——在主播探索凶宅时发来，主播当时确实没有关门……
19. **往左走** ——精准的方向指令，不像一般观众的搞气氛，更像真的知道布局的存在

**设计维度四：规律型**
ID在某种规则下出现/消失，本身构成叙事谜题：

20. **第X个在线的** ——X的数字每场直播都不同，但有时候X比实际在线人数+1
21. **今天的月相** ——ID会随着故事推进「改变」（实际上是这个账号在不同场次用不同子账号登录，但ID规律相同）

---

### 五、平台名称命名

虚构直播平台的命名要完成双重任务：可信（像真实平台）+ 有特色（能被读者记住）。

#### 命名原则

- **不要直接用真实平台名**（斗鱼、虎牙、B站）——避免版权问题，也避免现实感与虚构感的冲突
- **名字要有「平台感」**：简洁、有科技感、好发音
- **可以有轻微的灵异暗示，但不能太明显**：平台名是「日常」的一部分，不能让普通用户觉得这个平台很奇怪

#### 具体命名示例

1. **幽流** ——「幽」有幽暗、幽灵之意，「流」是直播/流量的网络词汇；合起来像「深邃的流量平台」，但「幽」也可以是「幽灵」
2. **灵犀直播** ——「灵犀」是「心有灵犀一点通」，暗示主播与观众之间神奇的连结；「灵」字有双关
3. **夜行App** ——简洁，「夜行」暗示这个平台的主要内容是夜间探险类直播
4. **守夜Live** ——英文混用，「守夜」在民俗里是为死者守灵，用在直播平台有隐含的危险感
5. **暗流视频** ——「暗流」是表面平静下的危险水流，有隐喻价值
6. **看见App** ——极简，但「看见」在灵异语境下有「能看见不该看见的东西」的含义
7. **零点直播** ——零点是子夜，是传统上鬼怪最活跃的时间，平台名直接点明了内容调性
8. **深夜频道** ——像真实的视频平台频道名，「深夜」确定了内容方向
9. **观鬼** ——两个字，极简，「观」是看的意思，整个名字就是「看鬼的地方」
10. **幸存者直播间** ——带有强烈的命运感，暗示在这个平台直播是在冒险，能继续直播的都是幸存者

---

### 六、道具命名

#### 6.1 民间法器命名风格

民间法器的命名来源于真实民俗传统，用语要有「年代感」和「专业感」，不能显得是临时杜撰的：

**来源于真实民俗的法器名**：

1. **桃木剑** ——最常见的道士法器，桃木在民间被认为能辟邪
2. **朱砂符** ——用朱砂（红色矿物颜料）绘制的符咒，是道教法术的核心物品
3. **五帝钱** ——顺治、康熙、雍正、乾隆、嘉庆五个皇帝的铜钱，据说五帝钱能镇宅辟邪
4. **铜镜** ——铜镜在民间法器系统里有照妖/收妖的功能（镜子本身与「映照真相」相关）
5. **黄符纸** ——道教符咒的通称，颜色是黄色或橙红色的特殊纸张
6. **糯米** ——糯米被认为能阻止僵尸行走（来自民间传说），在灵异直播里可以防止主播被「定住」
7. **七星剑** ——剑上有七颗星图案的法剑，来自道教七星（北斗七星）崇拜
8. **香灰符** ——用香烧成灰后调制的符水，有净化作用
9. **法绳** ——用特殊方法编制的绳索，可以捆绑阴灵

**关键原则**：民间法器的命名要「听起来是真实的民俗用品」，而不是游戏里的装备名。不要用「神圣之剑」「至强护符」这类RPG风格的命名。

#### 6.2 现代道具命名方式

现代道具是直播场景里的特殊物品，它们不来自传统民俗，而是当代都市语境：

10. **法师认证的盐** ——「法师认证」是对现代商业化民俗服务的调侃，盐在民间有净化功能
11. **驱邪APP（极光净化）** ——完全现代化的法器，一个声称能驱邪的手机应用程序，名字像真实的互联网产品
12. **限量版直播符咒（某宗师联名款）** ——商业化道具，「联名款」是当代商品常见形式，符咒和联名款的组合产生荒诞感
13. **「老字号符咒店」寄来的快递** ——符咒以快递形式送到，是对「民俗服务互联网化」的写实描写
14. **打赏换来的「职业法师一小时服务」** ——直播打赏系统里能换来的最高级道具，法师本人通过视频指导主播

#### 6.3 道具命名的叙事原则

**原则一：名字要透露道具的功能，但不要完全说清楚**
「朱砂符」让读者知道这是符，但不知道具体什么功能——这个信息缺口让使用场景有了神秘感。

**原则二：道具名与使用代价的反差**
「清心平气丹」这个名字很温和，但使用代价是三天内不能说话——名字越平静，代价越反差。

**原则三：使用限制写进道具描述，而不是名字里**
道具名要简洁，限制条件在介绍道具时再说明（「这根糯米可以用，但只能用一次，用了之后它会知道你在哪里」）。',
  '## Ghost Livestream Novel Entity Naming Guide

Good naming is the cornerstone of "believability" in ghost livestream novels. Whether readers can immerse themselves in "this is a story really happening in the online streaming world" depends largely on whether the naming of various entities is convincing. This guide provides naming rules and specific examples for six entity categories.

---

### I. Streamer Account Name / Live ID Naming Rules

The streamer''s account name is the reader''s first impression of the protagonist. It must meet these requirements:
1. **Credibility**: Sounds like a real online streamer, not a character name from a novel
2. **Memorability**: Easy to remember, but not too "influencer-ish"
3. **Hidden meaning**: Ideally carries one layer of supernatural implication that readers won''t notice unless they look carefully

#### Method 1: Numbers + Chinese Characters Mix

Numbers provide sequence/account feel; Chinese characters provide supernatural associations:

1. **AMing0327** — "0327" works as an account suffix or a specific date (death date, event date)
2. **YeYouShen999** (Night Wandering Spirit) — "Night Wandering Spirit" is a Chinese folk deity; "999" is common in online accounts
3. **LinYi666** — "Lin Yi" is an ordinary name; "666" has internet meme + devil-number dual meaning
4. **TanzHai007** (House Explorer 007) — "Explore House" is a stream content label; "007" suggests a secret agent or "working 24/7"
5. **LuJiu''er** — The name contains "nine" (九); in folk belief, nine is both auspicious and taboo (ninth level of the underworld)

#### Method 2: Pure Chinese Characters (with Double Meaning)

Appears to be an ordinary nickname; actually carries folklore/supernatural implications:

6. **The Orange in the Haze** — "haze" is a weather term but also implies yin energy; "The Orange" is an endearing ordinary nickname; their contrast creates memorability
7. **The One Who Captures Ghosts** — "captures" means both "to film/photograph" and "to subdue/contain" supernaturals
8. **Knocking Sound at Midnight** — directly an image; folk belief says "don''t respond to knocks at midnight"
9. **Daytime Doesn''t Understand the Darkness of Night** — a common internet phrase (from a 1980s-90s pop song) that carries new meaning in this context
10. **The Doorkeeper** — extremely plain, but "keeping the door" in folklore means guarding against/blocking wandering spirits (door gods / threshold protectors)

#### Method 3: English + Chinese Mix

Modern influencer style, international feel:

11. **MissLing** — English honorific + single Chinese character; "Ling" (灵) means both "spirit/soul" and "supernatural"
12. **NightWalker_YeMing** — English "night walker" + Chinese "ye ming" (the moment before dawn — darkest then); the two echo each other
13. **Ghost_MouGui** — Directly on-theme but self-deprecating; common self-labeling among online streamers
14. **Live_NeverGoesOffline** — Functional description that becomes an uncanny declaration in a supernatural context

---

### II. Ghost / Supernatural Entity Naming

Ghost naming should avoid two extremes: too generic (descriptive naming like "white long-haired female ghost") and too fantasy-novel (naming like "Lord of the Void" or "Demon God of the Abyss" that has nothing to do with folk ghosts). Good supernatural entity names should have:

- **Folk legend roots**: From authentic folklore vocabulary or reworkings of it
- **Modern urban legend feel**: Can exist in a "this happened in a real city" context
- **Incompleteness**: The name has an information gap that makes readers want to ask more

#### 2.1 Names with Folk Legend Roots

1. **Nannai** (Little Baby Girl) — Endearing name for a small girl, used to refer to an evil spirit permanently stuck in childlike form, creating strong contrast
2. **Pijianggui** (The Tanner''s Ghost) — There are folk stories about tanners (leather craftsmen); occupation + ghost combination has realism
3. **Foot-Touching Woman** — Southern Chinese folk legend of a female ghost who touches people''s feet at night; preserves the folklore prototype
4. **Mr. July** — "July" is ghost month; "Mr." is used to address administrators of the underworld; a calm title is more terrifying than a fierce name
5. **The Headless Wife** — "Wife" (in dialect) + "headless" is a common folk ghost form; the combination has strong regional flavor

#### 2.2 Modern Urban Legend Style Names

6. **The Tenant on the Third Floor** — "Tenant" is a contemporary urban vocabulary word; spatially limited (third floor); creates unique urban supernatural feel
7. **The One Who Doesn''t Show Up in Photos** — refers to the entity that doesn''t appear in group photos; classic modern urban legend form
8. **The One Who Grabs Red Envelopes** — Grabbing red envelopes is a WeChat social behavior; this entity''s mode of existence is infiltrating mobile internet
9. **The Ex Who Messages at 3 AM** — Extremely modern; "ex" + "3 AM" has authentic urban fear (is this ex still alive?)
10. **Account Zero in the Live Room** — On streaming platforms, "account #0" shouldn''t exist; there''s a technical level of uncanniness

#### 2.3 Mixed Style (Folk + Modern)

11. **The Death Vigil Man** — "Death vigil" means watching over/guarding the deceased; colloquial male suffix preserves folkloric feel without feeling dated
12. **The Direction-Asker Ghost** — Folk belief says "direction-asker ghosts lure people into the wilderness"; still effective in the GPS era
13. **The One with Yin-Yang Eyes** — Using "the one" instead of a name; in Chinese, this phrasing indicates taboo — not calling something by name is itself a way of handling it

---

### III. Haunted House / Abandoned Village Location Naming

Location naming is the most important element of "believability." Label-style naming like "ghost house" or "cursed ground" is completely ineffective — what actually creates fear is **naming that looks like a real address**.

#### 3.1 Naming Principles

- **Use real address formats**: XX Road XX Number, XX Lane X Alley, XX Village XX Group
- **Numbers should have implications but not be obvious**: "Huayuan Apartment Building 43" beats "Skull Road No. 13"
- **Mix historical and modern**: Old place name + new building type, or new place name + actually an old building

#### 3.2 Urban Haunted House Naming (10 examples)

1. **Xingping Road, Lane 219** — Ordinary Shanghai laneway address; "219" can be a significant date
2. **32 Happiness Lane** — "Happiness Lane" is the most ordinary community name; #32 is the end unit, typically the most isolated building
3. **Rising Sun Garden, Block A, Basement Level** — "Rising Sun" is an uplifting name; basement level is underground; the contrast is stark
4. **That Old Building at the Fuxing Road Intersection** — "Fuxing Road" exists in many Chinese cities; "that old building" is a vague descriptor that emphasizes its special status
5. **Unit 1901, Qingping Garden** — "Qingping" means quiet and peaceful; "1901" in Mandarin almost sounds like "one ghost zero one"
6. **The Last Building Left from the Chángbáishān Road Demolition** — Descriptive address; demolition-leftover buildings are a genuinely uncanny feature of contemporary Chinese cities
7. **The Old Staff Housing Next to the Hospital on East Ring Road** — Hospital-adjacent housing; hospitals are the modern building most associated with death
8. **The Scrap Yard by the Railroad** — Railroad and scrap yards are both urban fringe spaces; ideal for supernatural stories
9. **New Mall, Level B3** — Underground third level (in Chinese culture, the third level underground is often associated with the underworld)
10. **Old Factory Site at 428 Zhongshan Boulevard** — Factory sites have potential history of accidents; "428" can imply a date

#### 3.3 Suburban Abandoned Village/Wasteland Naming (10 examples)

1. **Guanzhuang Village** — "Guan" (官, official) place names suggest former special-purpose use; more uncanny after abandonment
2. **Yingou Ridge** — "Yin" (阴, yin/shadow/underworld) + terrain word "ridge"; the place name itself carries yin energy
3. **Lannioba Old Village** — Typical rural Chinese place name style; "muddy/rotting" conveys desolation; "old village" means abandoned
4. **Unnamed Hillside** — In Chinese folk place names, "unnamed" means "no one dared to name it" or "too much has happened here to give it a name"
5. **Seven Lady Burial Mountain** — "Seven Lady" is a female''s colloquial name; "Burial Mountain" is a local term for a hill with many graves
6. **Dogs Won''t Enter Village** — A real place name type that exists in Chinese folk tradition; animals'' instinctive avoidance is the origin of the name
7. **Old Wayward Spirit Temple Ruins** — Temples dedicated to homeless spirits; abandoned means no one makes offerings, meaning those spirits have nowhere to go
8. **Bleached Bones Ridge** — Terrain word + bones; clearly implies a large-scale death event in history
9. **Three-Way Crossroads Old Banyan Tree** — Three-way crossroads are folk gathering places for ghosts; old banyan trees are the most common spirit-inhabiting plants in southern China
10. **Water Ghost Pit** — A location named directly after the colloquial term for water ghosts; genuinely exists on folk maps; doesn''t feel contrived

---

### IV. Danmaku Viewer ID Naming

Viewer ID design is the most creative naming territory in ghost livestream novels — normal and non-human viewer IDs must have fundamental differences, but non-human IDs can''t be too obvious; readers should only feel the chill running down their spine at the moment of "discovery."

#### 4.1 Normal Viewer ID Naming Patterns

Normal viewer IDs: casual, individual, occasionally with internet slang:

1. **CatEatingFishBalls** — Typical cute random ID
2. **The One Not Sleeping** — Common self-deprecating platform ID
3. **PagodaSubduetheDragon0818** — Uses a meme phrase (a line from Journey to the West) with a number suffix
4. **Going to Sleep in a Minute** — Self-mocking of the habit of watching streams at midnight
5. **What''s for Dinner Tonight** — Purposeless ID, representing randomly passing viewer
6. **Big Goose Will Bite You** — Aggressive-joke-tone ID; common humorous danmaku style
7. **IronBro from Guangxi** — Region + nickname; creates authentic online atmosphere
8. **I''m the First One Here** — ID expressing arrival sequence; very common
9. **Please Streamer Stop Scaring Me** — Content-responsive ID; shows this viewer genuinely follows this stream
10. **Just Here to Watch the Show, Random Passerby A** — Self-positioned as "passerby"; extremely realistic

#### 4.2 Non-Human Viewer ID Naming Patterns

Non-human viewer ID design must follow the "anomalous but not obviously anomalous" principle — on first encounter, readers should "pass" it; only on second or third encounter does something feel wrong.

**Design dimension 1: Garbled text type**
ID looks like a technical glitch but follows a pattern:

11. **Ａ０１Ｃ０１Ａ０１** — Full-width characters + patterned alphanumeric combination; looks like a system account; "A01" repeats
12. **̶̷̸̡̢̛̈̓̃̈͜͠** — Unicode anomalous character combination; displays as garbled text in a Chinese danmaku interface, but some readers notice this character sequence has meaning in a particular character set

**Design dimension 2: Date/number type**
ID is directly a significant date; readers only discover the date''s meaning later:

13. **19890604** — Sensitive date format, or the date of a death event in the story
14. **_0731_** — Underscored date; "0731" will be revealed as someone''s death date
15. **1247DaysAgo** — Countdown or count-up format; "1247 days ago" is a specific date readers must calculate themselves

**Design dimension 3: Knows-too-much type**
ID itself implies this account knows too much:

16. **BeenWatchingYou3Years** — Started following three years ago, but the streamer only started three years ago...
17. **IKnowYourDad** — Looks like a gag, but if the streamer''s father is already deceased...
18. **TheDoorIsOpen** — Sent while the streamer explores a haunted house, and the streamer really did forget to close the door...
19. **GoLeft** — Precise directional instruction; unlike an ordinary viewer setting the mood, more like an entity that genuinely knows the layout

**Design dimension 4: Pattern type**
IDs appear/disappear according to some rule, themselves constituting a narrative puzzle:

20. **TheXthViewerOnline** — X is different every session, but sometimes X equals actual viewer count +1
21. **TodaysMoonPhase** — ID appears to "change" as the story progresses (actually this entity logs in with different sub-accounts each session, but the ID follows the same pattern)

---

### V. Platform Name Naming

Fictional streaming platform names must accomplish dual tasks: believable (sounds like a real platform) + distinctive (readers can remember it).

#### Naming Principles

- **Don''t use real platform names** (Douyu, Huya, Bilibili) — avoid IP issues; also avoid the conflict between real and fictional feel
- **Name must have "platform feel"**: Concise, tech-savvy, easy to pronounce
- **Can have mild supernatural implication, but not obvious**: Platform name is part of "daily life" — ordinary users shouldn''t find the platform name weird

#### Specific Naming Examples

1. **YouLiu (Spectral Stream)** — "You" (幽) means dim/ghost-like; "Liu" (流) means stream/flow (streaming/traffic in internet context); together sounds like "deep streaming platform" but "you" also means "ghost"
2. **LingXi Live** — "LingXi" (灵犀) comes from the phrase "a single thought connects two minds," implying a magical connection between streamer and audience; "Ling" (灵) is a double meaning
3. **NightWalk App** — Concise; "night walk" implies this platform''s primary content is nocturnal exploration streams
4. **Death Vigil Live** — English mix; "death vigil" in folk custom means watching over the deceased; used for a streaming platform, it carries implied danger
5. **Undercurrent Video** — "Undercurrent" is dangerous water flowing beneath a calm surface; has metaphorical value
6. **See App** — Minimalist; but "see" in a supernatural context means "able to see things that shouldn''t be seen"
7. **Midnight Live** — Midnight is the traditional hour when ghosts are most active; the platform name directly states its content tone
8. **Late Night Channel** — Sounds like a real video platform channel name; "late night" establishes content direction
9. **WatchGhost** — Two syllables, minimalist; the name simply means "the place to watch ghosts"
10. **Survivors'' Live Room** — Carries strong sense of fate; implies streaming on this platform is a risk, and those who keep streaming are the survivors

---

### VI. Prop Naming

#### 6.1 Folk Ritual Item Naming Style

Folk ritual item names come from real folk traditions; vocabulary must feel "period-appropriate" and "professional," not improvised:

**Names from authentic folklore**:

1. **Peach Wood Sword** — Most common Taoist ritual weapon; peach wood is believed to ward off evil in folk belief
2. **Cinnabar Talisman** — Talisman drawn with cinnabar (red mineral pigment); core object in Taoist ritual
3. **Five Emperor Coins** — Copper coins from five emperors (Shunzhi, Kangxi, Yongzheng, Qianlong, Jiaqing); said to protect homes and ward off evil
4. **Bronze Mirror** — In the folk ritual system, bronze mirrors reveal/trap demons (mirrors relate to "reflecting truth")
5. **Yellow Talisman Paper** — General term for Taoist talismans; the special paper is yellow or orange-red
6. **Glutinous Rice** — Believed to stop jiangshi (hopping vampires) from moving; in ghost livestream context, can prevent the streamer from being "frozen"
7. **Seven-Star Sword** — Ritual sword with seven-star pattern, from Taoist veneration of the Big Dipper
8. **Incense Ash Talisman** — Talisman water made from incense burned to ash; purifying function
9. **Ritual Rope** — Rope made using special methods; can bind yin spirits

**Key principle**: Folk ritual item naming must "sound like real folk objects," not game equipment names. Don''t use RPG-style naming like "Sacred Sword" or "Supreme Protection Talisman."

#### 6.2 Modern Prop Naming Methods

Modern props are special objects in the streaming context — they don''t come from traditional folk belief, but from contemporary urban life:

10. **Master-Certified Salt** — "Master-certified" gently mocks the commercialization of modern folk services; salt has purifying function in folk belief
11. **Ghost-Banishing APP (Aurora Purifier)** — A fully modernized ritual item: a smartphone application claiming to exorcise ghosts; the name resembles a real internet product
12. **Limited Edition Stream Talisman (Co-branded with Grand Master)** — Commercial prop; "co-branded" is a common contemporary product form; the combination of talismans and co-branding creates an absurd feel
13. **Express Package from the "Century-Old Talisman Shop"** — Talismans delivered by courier; realistic portrayal of "folk services going online"
14. **"One Hour Professional Exorcist Service" Unlocked by Donations** — The highest-tier prop unlockable through the donation system; the exorcist guides the streamer by video call

#### 6.3 Narrative Principles for Prop Naming

**Principle 1: The name should hint at function without fully explaining it**
"Cinnabar Talisman" lets readers know it''s a talisman, but not exactly what it does — this information gap gives usage scenes mystique.

**Principle 2: Contrast between name and usage cost**
"Mind-Calming Pill" is a very gentle name, but the cost of taking it is inability to speak for three days — the calmer the name, the sharper the contrast with the cost.

**Principle 3: Usage restrictions go in the description, not the name**
Prop names should be concise; conditions are explained when introducing the prop ("this glutinous rice can be used, but only once — after use, it will know where you are").',
  (SELECT id FROM novel_creation_method WHERE name = '灵异直播小说' LIMIT 1),
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
  sort_order = VALUES(sort_order);
