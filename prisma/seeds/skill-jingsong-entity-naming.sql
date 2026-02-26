-- 惊悚乐园小说「实体命名」领域知识技能（Layer 3）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '惊悚乐园小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-jingsong-entity-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'jingsong-entity-naming',
  '实体命名：为惊悚乐园小说中的玩家角色、NPC、Boss、副本、道具、怪物及系统元素提供专业命名指导，融合游戏化风格、恐怖美学和都市传说元素',
  '"Entity Naming": Professional naming guidance for player characters, NPCs, Bosses, dungeons, props, monsters and system elements in thriller park novels, blending gamification style, horror aesthetics and urban legend elements',
  '## 实体命名 — 惊悚乐园小说

惊悚乐园小说的实体命名核心是**游戏感与恐怖感的融合**。所有命名都存在于一个"这是一个游戏，但游戏里的恐怖是真实的"双重语境中。玩家角色的名字要有现代感和个性化（因为他们是现代人），NPC和Boss的名字要有恐怖感和故事感（因为他们是副本的一部分），道具的名字要有游戏化风格（因为它们是系统给予的），副本的名字要像一个你不想踏入的地方（因为每个副本都是一个恐怖世界）。

---

## 一、角色命名

### 1.1 玩家角色（现代感 + 个性化）

玩家是被拉入游戏的现代人，名字应该有现代生活感，同时通过名字暗示角色的性格或命运。

#### 主角命名

主角的名字不需要太花哨，但要有"记忆点"：

- **普通但有意味的名字**：张明（普通人代入感强）、陆离（"光怪陆离"的暗示）、秦夜（暗示夜晚/黑暗）
- **反差型名字**：阳光（人如其名？还是反讽？）、安宁（在恐怖世界中名为"安宁"的反差）
- **职业暗示型**：方程（理科生/逻辑思维）、顾问（顾全大局的人）
- **网名/代号型**（游戏化场景中常见）：Joker、深渊行者、零号病人

#### 其他玩家命名

- **新手玩家**：用普通的现代名字，暗示他们是普通人（李佳、王浩、赵小满）
- **老玩家**：往往有代号而非真名，代号反映他们在游戏中的风格（"屠夫"——暴力流、"棋手"——策略流、"幽灵"——隐匿流）
- **关键配角**：名字要有记忆点但不抢主角风头（苏瑶、唐九、沈默——"沉默"的谐音）

#### 命名禁忌

- 不要用太中二的名字（冷血杀神、暗影魔王——不像现代人）
- 不要用太普通的名字（张三、李四——缺乏记忆点）
- 不要让所有玩家名字风格一致（要有多样性：有人用真名，有人用代号，有人用网名）

### 1.2 副本NPC（匹配副本主题）

NPC的名字必须与所在副本的主题/时代/风格匹配。NPC不是现代人——他们是副本世界的"原住民"。

#### 按副本类型分

| 副本类型 | NPC命名风格 | 示例 |
|---------|------------|------|
| **精神病院副本** | 患者编号 + 真名 | 301号（王芳）、"安静的那个" |
| **古堡/洋馆副本** | 西方名 + 头衔 | 管家阿尔弗雷德、女伯爵伊莎贝拉 |
| **日式恐怖副本** | 日本名 | 田中美咲、佐藤裕子 |
| **中式民俗副本** | 中国传统名 | 赵婶、王半仙、铁头和尚 |
| **现代都市副本** | 现代名 + 职业 | 张医生、李司机、"隔壁的邻居" |
| **末日/废土副本** | 代号/编号 | A-07、"拾荒者"、"最后的广播员" |

#### NPC命名的恐怖化技巧

- **有名无姓或有姓无名**：只知道"芳芳"不知道她姓什么（信息缺失本身就是恐怖）
- **称谓代替名字**："那个女人""三楼的""穿红衣服的"——NPC被物化为特征，暗示他们可能不是完整的人
- **名字本身就是线索**：NPC的名字可能暗示副本的真相（一个叫"无归"的NPC——暗示他永远无法离开）

### 1.3 Boss / 核心恐怖实体（有恐怖感的名字）

Boss是副本中的最高恐怖。他们的名字要让人在读到的瞬间就感到不安。

#### 命名策略

**策略一：描述性命名（最常见、最直觉）**

用Boss的核心特征作为名字：
- 外貌特征：「无面者」「百眼」「缝嘴女」「断头骑士」
- 行为特征：「回廊女」（永远在走廊里走的女人）、「敲门者」（只有在你开门时才出现）、「数数的孩子」（一直在倒数的小孩）
- 声音特征：「哭泣的新娘」「哼歌的护士」「沉默者」

**策略二：身份性命名**

用Boss生前/死前的身份：
- 「院长」（精神病院副本中已死的院长）
- 「午夜列车长」（午夜列车副本的核心恐怖）
- 「第零号患者」（瘟疫副本中的源头）

**策略三：编号/代号命名（系统化恐怖）**

用冰冷的编号或系统代号：
- 「SCP-XXX」风格：「实体-47」「编号未知」
- 系统分类：「S级灾厄：终焉」「禁忌存在：不可观测体」
- 反讽代号：「友善先生」（一点都不友善的恐怖实体）

**策略四：名字缺失（最恐怖的命名方式）**

不给Boss名字——因为"知道名字"意味着可以理解和控制，而有些恐怖是不可理解、不可命名的：
- "那个东西"
- "不要说它的名字"
- 系统显示：「名称：[数据删除]」

---

## 二、副本命名

副本名是惊悚乐园小说中最重要的命名之一——它是读者进入每段恐怖的"入口"，好的副本名本身就能让人不寒而栗。

### 2.1 副本命名原则

- **暗示恐怖主题**：读者看到副本名就能大致猜到恐怖类型
- **暗示核心规则**：副本名可以隐藏通关线索
- **制造悬念**：让人好奇"这个副本到底是什么"
- **简短有力**：副本名不宜超过8个字

### 2.2 副本命名格式

**格式一：地点 + 时间/条件**
- 「午夜精神病院」「黎明前的游乐园」「永远下雨的小镇」「第13层」
- 特点：直接、有画面感、暗示场景

**格式二：规则/禁忌暗示**
- 「不许回头的走廊」「只有一个人能活着离开的房间」「不要看第四面墙」
- 特点：副本名本身就是一条规则，悬念感极强

**格式三：数字/倒计时**
- 「第七夜」「倒计时72小时」「九层地狱」「房间1408」
- 特点：数字天然有仪式感和紧迫感

**格式四：都市传说/经典恐怖意象**
- 「午夜出租车」「电梯游戏」「笔仙请你走」「红衣女的邀请」
- 特点：唤起读者已有的恐怖文化记忆

**格式五：反讽/违和**
- 「欢迎来到快乐镇」「最安全的地方」「童话幼儿园」「温馨的家」
- 特点：名字与内容的强烈反差制造深层不安

### 2.3 副本名与副本真相的关系

好的副本名在通关后会让读者恍然大悟：
- 「不许回头的走廊」→ 通关后发现：回头的人会看到走廊里另一个时间线的自己，看到就会替换
- 「欢迎来到快乐镇」→ 通关后发现：小镇居民被强制"快乐"，不笑就会死
- 「第七夜」→ 通关后发现：副本循环了七次，每次玩家都失败了，这是第七次尝试

---

## 三、道具命名

### 3.1 游戏化命名风格

惊悚乐园的道具来自"系统"，所以命名风格应该带有游戏化的感觉——像RPG游戏中的物品描述。

#### 按品质/稀有度分

| 品质 | 命名风格 | 示例 |
|------|---------|------|
| **普通（白色）** | 朴素实用的名字 | 「手电筒」「急救绷带」「铁锤」 |
| **稀有（蓝色）** | 功能+修饰词 | 「灵魂探照灯」「再生绷带」「破障之锤」 |
| **史诗（紫色）** | 有来历/故事的名字 | 「深渊窥视镜」「不腐圣水」「裁决者之眼」 |
| **传说（橙色）** | 独一无二的专有名词 | 「亡者的低语」「时间回溯怀表」「禁忌之书·第七页」 |

#### 道具命名的恐怖化

普通道具也可以通过命名增加恐怖感：
- 「沾血的钥匙」——不仅是钥匙，还暗示有人为此流过血
- 「诅咒短刀」——有副作用的武器
- 「死者的日记」——信息道具+恐怖暗示
- 「不会停止的怀表」——时间相关的诡异道具

### 3.2 道具命名禁忌

- 不要用太玄幻的名字（「天道神剑」「混沌之力」——不像恐怖游戏像修仙游戏）
- 不要用太现实的名字（「普通手电筒」——缺乏游戏感）
- 道具名要暗示功能但不能完全说明（留一点神秘感）

---

## 四、怪物/鬼怪命名

### 4.1 结合民间传说

中式恐怖副本中的怪物可以从中国民间传说中取材：
- 「画皮」——能伪装成人类的鬼怪
- 「缢鬼」——吊死的鬼，会诱使人在同一地点自缢
- 「水鬼」——溺死的鬼，需要找替身
- 「旱魃」——干旱之鬼，出现的地方寸草不生

### 4.2 结合都市传说

现代副本中的怪物可以重构都市传说：
- 「镜中人」——镜子里的那个不是你的倒影
- 「电梯里的第七个人」——电梯里只有六个人进来，但现在有七个
- 「午夜列车长」——午夜之后这趟列车不再去你想去的地方
- 「回廊女」——走廊里永远在走的女人，不要跟她走同一个方向

### 4.3 结合恐怖经典

致敬或重构经典恐怖形象：
- 「无面者」——没有脸的人形生物（克苏鲁系）
- 「提线木偶」——被操控的人类（傀儡系）
- 「不死的新娘」——婚礼日死去又复活的女人（哥特系）
- 「收容失败体」——SCP风格的实体

### 4.4 怪物命名的层次感

同一个副本内的怪物应该有命名层次：
- **杂兵级**：用统称（"那些东西""游荡者""影子"）
- **精英级**：有具体名字但来自描述（"红裙子""断臂""哭声"）
- **Boss级**：有正式名称或代号（「无面者」「午夜列车长」「第零号患者」）

---

## 五、系统相关命名

### 5.1 积分/货币

- 恐怖主题：「灵魂碎片」「恐惧值」「暗影积分」「亡者代币」
- 游戏主题：「通关积分」「生存点数」「副本币」
- 混合风格：「噩梦点」「深渊信用」——兼有恐怖和游戏感

### 5.2 等级/段位

- 从低到高应该有递进感，同时暗示恐怖程度：
  - 试炼者 → 探索者 → 猎手 → 驭灵者 → 深渊行者 → ???
  - 或用字母/数字：E级 → D级 → C级 → B级 → A级 → S级 → ???（最高等级的"???"本身就是悬念）

### 5.3 称号

称号应该反映玩家的游戏风格或成就：
- 「副本粉碎者」（暴力通关型）
- 「真相猎人」（解谜型）
- 「不死之人」（多次濒死存活）
- 「NPC之友」（善于与NPC交互）
- 「规则破坏者」（找到了规则的漏洞）

---

## 六、常见错误

1. **玩家角色名字太中二**：「暗影之王」「冷血杀神」——这不是修仙小说
2. **副本NPC名字与副本主题不符**：日式恐怖副本里出现了"赵铁柱"
3. **Boss名字不够恐怖**：Boss叫"小明"——除非是有意的反讽，否则就是失败的命名
4. **所有道具名字都很中二**：每个道具都叫"XX之XX"（"黑暗之刃""灵魂之匙"），缺乏多样性
5. **副本名字暴露太多信息**：副本名叫"院长是最终Boss的精神病院"——这不是悬念，这是剧透
6. **怪物命名不统一**：同一个副本里的怪物有的用中文名、有的用英文名、有的用编号，风格混乱
7. **系统命名过于通用**：积分就叫"积分"、等级就叫"等级"——缺乏世界观沉浸感
8. **忽视命名的伏笔功能**：名字只是名字，没有暗示任何副本真相或角色命运',
  '## Entity Naming — Thriller Park Novels

Core: **gamification + horror fusion**. All naming exists in a dual context: "this is a game, but the horror inside is real." Player names need modern personality, NPCs/Bosses need horror storytelling, props need game-style naming, dungeon names should feel like places you don''t want to enter.

### I. Character Naming

**Player characters**: Modern names with personality hints. Protagonist needs a "memory hook" (Lu Li = "bizarre", Qin Ye = "night/darkness"). Veteran players use codenames reflecting playstyle ("Butcher" = combat, "Chess Player" = strategy, "Ghost" = stealth).

**Dungeon NPCs**: Must match dungeon theme/era. Asylum dungeon = patient numbers + names. Gothic castle = Western names + titles. Chinese folk dungeon = traditional names.

**Boss naming strategies**: 1) Descriptive (core trait as name: "Faceless One", "Corridor Woman"), 2) Identity-based (pre-death role: "The Warden", "Patient Zero"), 3) Coded/numbered (system classification: "Entity-47", "S-rank Calamity"), 4) Nameless (most terrifying — "don''t say its name", system shows [DATA DELETED]).

### II. Dungeon Naming

Principles: hint at horror theme, hide rule clues, create suspense, stay under 8 characters. Formats: Location+Time ("Midnight Asylum"), Rule hint ("The Hallway Where You Can''t Look Back"), Numbers ("The Seventh Night", "Room 1408"), Urban legend ("Midnight Taxi", "Elevator Game"), Ironic ("Welcome to Happy Town").

### III. Prop Naming

Game-style tiered naming: Common (plain: "Flashlight"), Rare (modified: "Soul Searchlight"), Epic (with backstory: "Abyss Gazing Mirror"), Legendary (unique proper noun: "Whispers of the Dead"). Add horror through naming: "Blood-stained Key", "Cursed Dagger", "The Watch That Never Stops."

### IV. Monster Naming

Draw from: Chinese folklore (painted skin demons, drowning ghosts), urban legends (mirror person, elevator''s 7th passenger), horror classics (faceless beings, marionettes). Maintain hierarchy: mobs get generic names ("wanderers"), elites get descriptive names ("Red Dress"), bosses get formal titles.

### V. System Elements

Currency: horror-themed ("Soul Fragments", "Fear Points") or game-themed ("Clearance Points"). Ranks: progressive with horror escalation (Trialist → Explorer → Hunter → ??? at top). Titles: reflect playstyle ("Dungeon Crusher", "Truth Hunter", "Rule Breaker").

### Common Mistakes

1. Overly chuunibyou player names
2. NPC names mismatching dungeon theme
3. Non-threatening boss names
4. All props named in identical "X of Y" format
5. Dungeon names that spoil the plot
6. Inconsistent monster naming styles within same dungeon',

  (SELECT id FROM novel_creation_method WHERE name = '惊悚乐园小说' LIMIT 1),
  1,
  51,
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
