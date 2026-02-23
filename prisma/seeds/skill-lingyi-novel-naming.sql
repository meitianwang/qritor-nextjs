-- 民间灵异故事创作「小说命名」技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '民间灵异故事创作' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-lingyi-novel-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'lingyi-novel-naming',
  '小说命名：为民间灵异故事创作生成书名和内容简介，提供志怪笔记体美学与民俗神秘感兼顾的命名指导',
  '"Novel Naming": Generate titles and synopses for Chinese folk horror / anomaly stories, balancing classical bi-ji (notebook fiction) aesthetics with folk mystery atmosphere',
  '## 小说命名 — 民间灵异故事创作

民间灵异故事的书名核心是**神秘感、民俗感、真实感**三位一体。最好的书名让读者感觉是在翻阅一本流传已久的民间志怪集——可能真实发生过的异闻，有地域色彩，有人情冷暖，有鬼气却不只是恐怖。

这类故事区别于都市鬼故事的关键在于：有浓郁的**中国民间文化底色**（乡村、祠堂、民俗、节气、方言），而非现代都市恐怖片的氛围。

---

### 命名哲学

三个层次：
1. **真实感** — 书名要让读者感觉这可能是真事，或来自民间口耳相传。避免太戏剧化或太网络化的标题
2. **地域感** — 中国地域辽阔，各地民俗各异，书名最好带出地方色彩（湘西、苗寨、东北林场、岭南村落）
3. **含蓄神秘感** — 不要把"鬼"字直接放书名里（显得廉价），用意象暗示（百年老宅、无人村、枯骨岭）

---

### 常见书名格式

**格式一：仿古笔记体（志怪体）**
- 结构：主题/地名 + 志 / 录 / 记 / 谈 / 见闻 / 杂记
- 示例：《百鬼夜行录》《苗寨见闻》《山野奇谈》《阴宅杂记》《湘西异闻》
- 特点：最有古典志怪气质，像古代笔记小说（聊斋志异风格）
- 适合：故事集形式，多个灵异事件串联的故事

**格式二：地名 + 事件**
- 结构：具体地点（越具体越有真实感）+ 发生的异事或特征
- 示例：《枯骨岭往事》《苗寨灵异夜》《古井深处》《那条无名河》
- 特点：有新闻事件感，让读者觉得这是真实地方发生的事
- 适合：单一地点展开、有真实感的故事

**格式三：人物视角型**
- 结构：特定身份的人 + 视角词
- 示例：《捉鬼人的笔记》《阴阳眼所见》《祖传驱邪录》《老道士回忆录》
- 特点：带出主角的特殊身份，暗示主角是专业驱邪人士
- 适合：主角有特殊能力（阴阳眼、道法）的故事

**格式四：神秘短题**
- 结构：2-5 字，意境神秘，留白
- 示例：《夜行》《无归》《百鬼》《孤坟》《哑村》《阴阳渡》
- 特点：简洁有力，但需要配合好的内容封面才能让读者理解是灵异故事
- 适合：追求文学气质的读者群

**格式五：方言/地方特色型**
- 结构：带地方方言词或地方特色的表达
- 示例：《湘西鬼事》《东北林场夜话》《粤西神婆》《云贵山野传奇》
- 特点：地域感极强，吸引对特定地域文化有兴趣的读者
- 适合：以特定地域民俗为核心的故事

---

### 主题词库

| 类别 | 词汇 |
|------|------|
| 灵异存在 | 鬼、怪、灵、妖、煞、邪、幽、魂 |
| 民俗感词 | 民间、山野、村落、祠堂、老宅、古井、坟场 |
| 时间/夜晚感 | 夜行、子时、百年、往事、旧事、深夜 |
| 志怪体裁 | 志、录、记、谈、见闻、异闻、奇谈、杂记 |
| 禁忌/神秘感 | 无归、绝户、禁忌、不归、无名 |
| 地域特色 | 湘西、苗寨、东北、岭南、客家、闽南 |

---

### 书名优劣对比

| 好书名 | 差书名 | 原因 |
|--------|--------|------|
| 《百鬼夜行录》 | 《我在农村收鬼》 | 后者网络感过重，民俗感全无 |
| 《枯骨岭往事》 | 《灵异事件2026》 | 后者现代感破坏沉浸 |
| 《捉鬼人的笔记》 | 《超强驱鬼流》 | 后者类型感混乱（像玄幻不像灵异） |
| 《苗寨阴语》 | 《诡异的苗寨》 | 后者平淡无力，"诡异"太直白 |
| 《湘西鬼事》 | 《鬼故事集》 | 后者无地域感，过于通用 |

---

### 内容简介结构

**第一段 — 人物与地点（带入感）**
用接近民间故事讲述的口吻（有时可以第一人称"我听村里老人说..."的感觉），交代主角的身份和所处的地域环境，要有地方色彩。不要写"本书讲述了..."。最好让读者感觉是在听一个"真实故事"。

**第二段 — 引入异事（悬念）**
描述第一个灵异现象的出现，要有具体感官细节（声音、气味、视觉），不要太抽象。比较："一声诡异的哭声从废弃老宅传来，三天后村里接连死了两个人"比"发生了可怕的事"更有带入感。

**第三段 — 困境与解谜（驱动力）**
主角必须面对的核心困境，或必须解开的谜题。灵异故事的驱动力往往是：保护家人/村子、解开某个灵异事件的真相、或克服某种诅咒/煞气。结尾留白，不剧透。

**字数**：150-250 字为宜。

---

### 常见错误

- ❌ 日式恐怖风格（《贞子的秘密》《花子学校》）——民间灵异是中国风，不是日本恐怖
- ❌ 网络爽文词汇混入（系统、无敌、签到、天赋）
- ❌ 书名中直接出现"灵异""恐怖"等标签词，破坏神秘感
- ❌ 简介写成流水账故事梗概
- ❌ 简介中出现太多人名（读者第一次接触，记不住）
- ❌ 没有地域感（任何地方都能发生的故事，失去民间故事的真实质感）',
  '## Novel Naming — Chinese Folk Horror / Anomaly Stories

Core: **mystery + folk culture + authenticity**. The best titles make readers feel they''re reading a collection of regional anomaly records that might have actually happened — with local color, human warmth, and uncanny atmosphere.

Key distinction from urban horror: deep roots in **Chinese folk culture** (rural villages, ancestral halls, folk customs, seasonal nodes, regional dialects).

---

### Naming Philosophy

Three layers:
1. **Authenticity** — Feels like it could be a real folk account, not dramatized
2. **Regional specificity** — Place name or regional culture signals (Xiangxi, Miao village, Northeast)
3. **Subtle mystery** — Avoid direct "ghost" in the title (feels cheap); use imagery instead

---

### Common Title Formats

1. **Classical bi-ji style**: [Theme/Place] + [Zhi/Lu/Ji/Tan/Jianwen] — "Nocturnal Ghost Records", "Miao Village Strange Tales"
2. **Location + event**: Specific place + what happened (very authentic feel) — "Old Things at Skeleton Ridge", "What''s at the Bottom of the Old Well"
3. **Person''s perspective**: [Role with special ability] + [Record/Notes] — "A Ghost Catcher''s Notebook"
4. **Short atmospheric title**: 2-5 characters, leaves space — "Night Walk", "No Return", "Mute Village"
5. **Dialect/regional style**: Regional flavor in expression — "Xiangxi Ghost Matters", "Northeast Forest Night Talk"

---

### Key Vocabulary

Supernatural (ghost, spirit, demon, malign energy), folk (village, ancestral hall, old house, ancient well), time/night (midnight, century-old, past events), genre (records, chronicles, strange tales), forbidden (no return, cursed household, nameless)

---

### Synopsis Structure

1. **Character and place** (immersion): Folk storytelling voice, specific regional setting, protagonist identity
2. **First anomaly** (suspense): Sensory details — sound, smell, sight; concrete rather than abstract
3. **Dilemma and goal** (driver): What the protagonist must resolve — protection, uncovering truth, or breaking a curse

**Length**: 150-250 characters',
  (SELECT id FROM novel_creation_method WHERE name = '民间灵异故事创作' LIMIT 1),
  1,
  35,
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
