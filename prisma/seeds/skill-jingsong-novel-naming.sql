-- 惊悚乐园小说「小说命名」领域知识技能（Layer 3）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '惊悚乐园小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-jingsong-novel-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'jingsong-novel-naming',
  '小说命名：为惊悚乐园小说生成书名和内容简介，传达恐怖/灵异基调、游戏化机制与主角特质，提供四种常见命名格式和主题词库',
  '"Novel Naming": Generate titles and synopses for thriller park novels, conveying horror tone, gamification mechanics and protagonist traits, with four common naming formats and thematic vocabulary',
  '## 小说命名 — 惊悚乐园小说

惊悚乐园类小说的书名需要同时传达三个核心信息：**恐怖/灵异基调**（让读者知道这是恐怖题材）、**游戏化机制**（暗示副本、系统、关卡等游戏元素）、**主角特质**（高智商、冷静、不走寻常路）。最好的书名能在一瞬间让读者建立起"在恐怖游戏里用脑子玩"的心理预期。

这类书名区别于纯灵异小说（没有游戏化元素）和纯游戏流小说（没有恐怖感）的关键在于：**恐怖 + 游戏的融合感**。读者一看书名就知道"这是一个让人在恐怖中闯关的故事"。

---

### 命名哲学

书名要传达的三层信息（按重要性排序）：

1. **类型锚点** — 读者必须在0.5秒内判断出这是恐怖+游戏类型。模糊的书名会失去目标读者。
2. **差异化** — 在同类型书海中脱颖而出。《惊悚乐园》和《无限恐怖》已经是经典书名了，新书名需要在"致敬"和"创新"之间找到平衡。
3. **好奇心钩子** — 书名本身要让人想问"这是什么？为什么？怎么回事？"。悬念感比直白描述更有吸引力。

**核心原则**：书名应该像副本的名字一样——简短、有冲击力、让人不安。

---

### 常见书名格式

#### 格式一：系统/游戏名（直接点题）

直接用"游戏"或"系统"的名称作为书名，最直接地告诉读者这是什么类型。

- 结构：[恐怖修饰词] + [游戏/乐园/系统/世界]
- 示例：《惊悚乐园》《无限恐怖》《深渊游戏》《末日乐园》《恐怖复苏》
- 特点：简洁霸气，类型辨识度极高，适合作为开创性作品的书名
- 风险：太多同类书名导致审美疲劳（"XX乐园""XX游戏"泛滥）

**好的变体**：
- 《黎明杀机》（游戏名但有电影感）
- 《全球诡异时代》（加了时间/空间维度）
- 《我的恐怖猎场》（第一人称+主角态度）

#### 格式二：主角特质 + 恐怖世界（角色驱动型）

用主角的独特身份/能力/态度作为卖点，与恐怖世界形成反差或冲突。

- 结构：[我/主角身份] + [在恐怖世界中的行为/状态]
- 示例：《我在恐怖游戏里当大佬》《我靠读档成为恐怖游戏BOSS》《恐怖游戏里的高玩》
- 特点：第一人称视角天然有代入感，"当大佬""高玩"暗示主角的强大和从容
- 风险：容易写成轻松搞笑向，可能失去恐怖感的严肃性

**好的变体**：
- 《我在副本里钓鱼》（反差感极强——恐怖环境中的悠闲行为）
- 《恐怖？这不就是打工吗》（日常化恐怖）
- 《所有NPC都怕我》（反转：本该害怕的人反过来让恐怖存在害怕）

#### 格式三：规则/机制暗示（悬念驱动型）

书名本身暗示了一种规则、一种机制、一种必须遵守的条件，让读者好奇"这个规则是什么"。

- 结构：[数字/条件/禁忌] + [恐怖暗示]
- 示例：《规则怪谈》《第七夜》《不要回头》《午夜十二点》《禁止入内》
- 特点：悬念感最强——书名本身就是一个谜题。读者会想："什么规则？第七夜发生了什么？为什么不能回头？"
- 风险：如果内容撑不起书名的悬念，读者会失望

**好的变体**：
- 《每次死亡后我变得更强》（机制暗示+成长暗示）
- 《只有我能看到提示》（信息差机制）
- 《副本通关条件：活到最后》（直接用游戏UI语言作为书名）

#### 格式四：恐怖意象 + 悬念（氛围驱动型）

用一个具体的恐怖意象或场景作为书名，营造直觉层面的不安感。

- 结构：[恐怖场景/意象] + [悬念/动作]
- 示例：《深渊游戏》《黎明杀机》《午夜游乐园》《末日列车》《地狱公寓》
- 特点：画面感强，读者看到书名就能在脑中浮现一个场景
- 风险：如果只有意象没有机制暗示，可能被误认为纯恐怖小说

**好的变体**：
- 《永远不会天亮的城市》（恐怖意象+违背常理）
- 《电梯到了负一万层》（日常物品+不可能的数字）
- 《镜中世界的玩家》（恐怖意象+游戏身份）

---

### 主题词库

| 类别 | 词汇 |
|------|------|
| **恐怖词汇** | 惊悚、恐怖、诡异、深渊、黑暗、末日、噩梦、禁忌、诅咒、亡灵、幽冥 |
| **游戏词汇** | 副本、关卡、系统、游戏、乐园、通关、BOSS、NPC、玩家、存档、复活 |
| **主角特质词汇** | 高玩、大佬、天才、疯子、猎人、观察者、破局者、幸存者 |
| **机制词汇** | 规则、条件、限时、轮回、死亡、积分、等级、选择、淘汰 |
| **场景词汇** | 乐园、病院、列车、电梯、公寓、学校、监狱、迷宫、墓地 |
| **时间词汇** | 午夜、黎明、第七天、最后一小时、永夜、倒计时 |

---

### 书名优劣对比

| 好书名 | 差书名 | 原因 |
|--------|--------|------|
| 《惊悚乐园》 | 《恐怖的游戏世界》 | 后者太直白、太长、没有冲击力 |
| 《规则怪谈》 | 《一个有规则的恐怖故事》 | 后者解释性太强，书名应该是悬念而不是说明 |
| 《我在副本里钓鱼》 | 《我在恐怖游戏中很厉害》 | 后者缺乏具象化，"钓鱼"比"很厉害"有画面感得多 |
| 《深渊游戏》 | 《黑暗恐怖生存》 | 后者是标签堆砌，没有整体感 |
| 《第七夜》 | 《恐怖七天》 | 后者缺乏神秘感和诗意 |
| 《所有NPC都怕我》 | 《恐怖NPC都怕的主角》 | 后者是描述而不是宣言，缺乏态度 |
| 《永远不会天亮的城市》 | 《黑暗城市》 | 后者过于笼统，前者有具体的恐怖违和感 |

---

### 内容简介结构

惊悚乐园类小说的简介需要在短短几百字内完成四个任务：

**第一段 — 身份锚点（主角是谁，世界发生了什么）**

开门见山，建立主角身份和世界设定。用最简洁的语言告诉读者：谁、在什么情况下、被卷入了什么。

- 好的开头："普通大学生张明在某个午夜被强制拉入了一款名为''深渊''的恐怖生存游戏。"
- 差的开头："在一个未来的世界里，人类文明面临着前所未有的危机……"（太宏大太抽象）

**第二段 — 游戏机制（什么规则，怎么玩）**

简要介绍游戏/系统的核心机制。读者需要知道这个"游戏"怎么运作，但不需要知道所有细节。

- 好的写法："每72小时，系统随机传送玩家进入恐怖副本。通关得分，失败即死。积分可以兑换道具和能力，但真正的奖励——是活着回来。"
- 差的写法：详细列举所有系统规则（太像游戏说明书）

**第三段 — 第一个副本/关键冲突（悬念钩子）**

描述主角面对的第一个挑战，用具体场景吸引读者的好奇心。

- 好的写法："第一个副本：午夜精神病院。规则只有一条——活到天亮。但病院里的那些''病人''，在午夜十二点之后，就不再是病人了。"
- 差的写法："主角遇到了很多困难但都克服了"（流水账+无悬念）

**第四段 — 悬念结尾（让读者想点开第一章）**

一句话留下最大的悬念，通常指向主线。

- 好的写法："而当张明通关第三个副本后，他开始怀疑——这个''游戏''选中的玩家，可能从一开始就不是随机的。"
- 差的写法："张明能否在游戏中活下去？让我们拭目以待！"（幼稚的反问式结尾）

**字数**：200-350字为宜。

---

### 常见错误

1. **书名过于通用**：《恐怖游戏》《生存之战》——太泛了，没有辨识度
2. **书名过长**：超过10个字的书名在各平台显示效果差，也不好记
3. **恐怖和游戏元素脱节**：书名只有恐怖感没有游戏感（像纯灵异），或只有游戏感没有恐怖感（像普通系统流）
4. **简介写成百科全书**：把世界观、系统规则、角色背景全写进简介，读者没有耐心看
5. **简介没有悬念**：直接告诉读者主角会变强、会通关——那读者为什么还要看正文？
6. **模仿已有书名太明显**：《惊悚XX》《无限XX》——容易被认为是跟风之作
7. **简介中出现太多专有名词**：读者第一次接触，不知道你的"灵魂积分""暗影等级"是什么
8. **书名与内容不符**：书名暗示的恐怖类型和实际内容不一样（书名很惊悚，内容很轻松）',
  '## Novel Naming — Thriller Park Novels

Thriller park novel titles must convey three things: **horror/supernatural tone**, **gamification mechanics** (dungeons, systems, levels), and **protagonist traits** (high IQ, calm, unconventional). The best titles instantly set the expectation of "using your brain to survive horror games."

### Naming Philosophy

Three layers: 1) **Genre anchor** — reader identifies horror+game type in 0.5 seconds; 2) **Differentiation** — stand out among similar titles; 3) **Curiosity hook** — title makes reader ask "what is this? why?"

### Common Title Formats

1. **System/Game Name** (direct): [Horror modifier] + [Game/Park/System] — "Thriller Paradise", "Infinite Terror", "Abyss Game". High recognition but risk of cliche.
2. **Protagonist Trait + Horror World** (character-driven): "I''m the Big Boss in Horror Games", "All NPCs Fear Me". Natural immersion but may lose horror seriousness.
3. **Rule/Mechanic Hint** (suspense-driven): "Rule Ghost Tales", "The Seventh Night", "Don''t Look Back". Strongest suspense — title itself is a puzzle.
4. **Horror Imagery + Suspense** (atmosphere-driven): "Abyss Game", "Dead by Daylight", "Midnight Amusement Park". Strong visual impact.

### Key Vocabulary

Horror (thriller, abyss, darkness, doom, nightmare), Game (dungeon, level, system, NPC, player, save), Protagonist (pro player, genius, hunter, survivor), Mechanics (rule, condition, time-limit, loop, elimination), Scenes (park, asylum, train, elevator, prison, maze)

### Synopsis Structure

1. **Identity anchor**: Who + what situation + pulled into what (concise)
2. **Game mechanics**: Core rules briefly (not a game manual)
3. **First dungeon/conflict**: Specific scene with suspense hook
4. **Suspense ending**: One sentence pointing to main plot mystery

**Length**: 200-350 characters

### Common Mistakes

1. Overly generic titles ("Horror Game", "Survival Battle")
2. Titles longer than 10 characters
3. Horror and game elements disconnected in title
4. Synopsis as encyclopedia (too much world-building detail)
5. Synopsis without suspense (telling readers the protagonist will succeed)
6. Too-obvious imitation of existing famous titles',

  (SELECT id FROM novel_creation_method WHERE name = '惊悚乐园小说' LIMIT 1),
  1,
  50,
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
