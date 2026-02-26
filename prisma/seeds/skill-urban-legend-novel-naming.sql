-- 都市传说怪谈复苏流小说 - 小说命名技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-urban-legend-novel-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'urban-legend-novel-naming',
  '小说命名：为都市传说怪谈复苏流小说生成书名和内容简介',
  '"Novel Naming": generate titles and synopses for urban legend revival horror novels',
  '## 小说命名 — 都市传说怪谈复苏流小说

都市怪谈类小说的书名哲学：**让读者在日常中认出这个书名，然后产生不安**。最好的书名是那些看上去平淡无奇，但了解内容后会觉得「这个书名从一开始就是预兆」的名字。都市怪谈书名的气质与传统恐怖小说不同——它不是「血腥/骷髅/恐惧」这类显而易见的恐惧词汇，而是熟悉感中的一丝异常。

---

### 常见书名格式

**格式一：日常场景+时间限定词**
- 结构：[普通日常场景] + [异常化的时间条件]
- 示例：「深夜末班车」「凌晨三点的电梯」「午夜外卖」「隔壁的灯光」
- 适合：生存恐怖型、触发条件明确的故事
- 吸引力来源：读者认出这个场景，「这发生在我每天经历的地方」

**格式二：否定式/禁止式**
- 结构：「不要……」/ 「千万别……」/ 「你不该……」
- 示例：「不要按13楼」「不要看那个号码」「不要独自坐末班地铁」
- 适合：禁忌规则清晰、以规则为核心卖点的故事
- 吸引力来源：直接告诉读者有一条规则，读者想知道违反了会怎样

**格式三：数字+普通事物**
- 结构：[具体数字] + [日常元素]
- 示例：「23号楼的第11层」「三分钟的寂静」「第七个门铃」
- 适合：有明确地点或数字规则的故事
- 吸引力来源：具体的数字制造真实感，「哪个楼，哪一层」的细节

**格式四：转述式**
- 结构：「听说……」/ 「据说……」/ 「有人说……」
- 示例：「听说这条路的路灯会数人」「据说9号楼没有人住过超过一年」
- 适合：口耳相传型、网络诅咒型故事
- 吸引力来源：模拟怪谈的口语传播形式，增强真实感

**格式五：反常的日常物件**
- 结构：[日常物件] + [轻微异常的修饰]
- 示例：「一直亮着的走廊灯」「空白的联系人」「没有15楼的电梯」
- 适合：氛围恐怖型、细节积累型
- 吸引力来源：微小的异常比明显的恐惧更令人不安

---

### 主题词库

| 类别 | 词汇 |
|------|------|
| **时间词** | 深夜、凌晨、末班、午夜、消失的、三点、第七天 |
| **地点词** | 电梯、楼道、地铁、走廊、对面、附近、门口、角落 |
| **禁止词** | 不要、别、不能、禁止、小心、当心、没有 |
| **数字词** | 13、7、3、零、最后一个、第几次 |
| **状态词** | 空、无声、空白、消失、没有人、一直、从来 |
| **感官词** | 声音、脚步声、回声、气味、光、影子 |
| **网络词** | 截图、帖子、链接、已读、转发、消息 |

---

### 书名优劣对比

| 好书名 | 差书名 | 原因 |
|--------|--------|------|
| 「不要按13楼」 | 「恐惧的电梯」 | 前者给出具体禁忌，后者太泛化 |
| 「深夜的外卖」 | 「都市怪谈事件录」 | 前者有具体意象，后者像类型标签 |
| 「我们楼里没有14层」 | 「消失的楼层」 | 前者有「我们」的共同体感，后者缺代入感 |
| 「凌晨收到的消息」 | 「诅咒短信」 | 前者模糊悬念，后者剧透恐怖元素 |
| 「一直亮着的灯」 | 「鬼屋夜惊」 | 前者日常化，后者传统恐惧词汇 |

---

### 内容简介结构

都市怪谈小说的简介要完成三件事：建立「日常感」→ 触发「异常感」→ 留下「你也可能遇到」的钩子。

**第一段 — 建立日常（50-100字）**
写主角的普通日常，越普通越好。让读者在此建立代入感。
- 写法：「他/她是一个普通的[职业]，住在[地点]，每天[日常行为]」
- 不写超能力、特殊身份、或任何预示主角特殊性的元素
- 目标：让读者觉得「这可以是我」

**第二段 — 引入异常（80-120字）**
第一次接触怪谈，但不要解释。让读者知道「规则存在」而不是「规则是什么」。
- 写法：「直到某天/某晚，[日常行为]变得不对了——[感官异常]，[无法解释的事]」
- 暗示规则的存在，但不说出规则的内容
- 目标：制造「我想知道发生了什么」的好奇

**第三段 — 留下钩子（40-60字）**
一到两句话，把故事的核心恐惧或核心悬念点出来，同时提醒读者「这可能发生在你身上」。
- 写法：「[简短的威胁陈述]。你每天走过的那条路，你一直以为它只是普通的路。」
- 结尾最好是一个直接对读者说话的句子
- 目标：让读者读完简介觉得「这我要看」

**总字数建议**：200-280字。都市怪谈简介不宜过长——读者在点进去之前已经应该感到不安了。

---

### 常见错误

- ❌ 书名直接揭示核心规则（「凌晨三点按电梯会困在恐怖空间」）——过度解释破坏悬念
- ❌ 简介第一段直接写怪谈，跳过建立「日常感」的步骤——代入感不足
- ❌ 简介语气过于恐怖/惊悚（「血腥」「骇人」「令人毛骨悚然」等词语）——反而降低真实感
- ❌ 简介最后一段解释主角的应对方案——剧透了故事的主要内容
- ❌ 使用传统恐怖词汇（鬼、邪、诅咒）作为书名核心——降低「日常代入感」的效果',
  '"Novel Naming" — Urban Legend Revival Horror Novels

Naming philosophy: make readers recognize the title in their daily life, then feel uneasy. The best titles seem mundane until you know the content — then they feel like they were always a premonition.

**Five title formats**:
1. Daily scene + time qualifier: "Last Train at Midnight", "The Elevator at 3am" — readers recognize their own experience
2. Prohibition format: "Don''t Press Floor 13", "Don''t Look at That Number" — implies a rule exists, readers want to know what happens if violated
3. Number + everyday object: "Building 23, 11th Floor", "Three Minutes of Silence" — specific numbers create documentary realism
4. Hearsay format: "They Say the Streetlights Count People", "Rumor Has It Nobody Stays in Block 9 More Than a Year" — mimics oral legend transmission
5. Subtly wrong everyday object: "The Corridor Light That Never Goes Off", "The Floor That''s Missing From the Elevator Panel" — minor wrongness is more unsettling than obvious horror

**Synopsis structure (200-280 words)**:
- Para 1 (50-100 words): establish mundane daily life — the protagonist is ordinary, their routine is ordinary, readers should think "this could be me"
- Para 2 (80-120 words): introduce the anomaly without explaining the rule — something goes wrong, but don''t reveal what the rule IS
- Para 3 (40-60 words): leave a hook — one or two sentences that point to the core fear, ideally ending with a line addressed directly to the reader ("You walk past that corridor every day. You never stopped to wonder why the light always works.")

**Good vs bad titles**:
- Good: "Don''t Press 13" / Bad: "The Horror Elevator" (too generic)
- Good: "The Late-Night Delivery" / Bad: "Urban Paranormal Case Files" (category label, not a story)
- Good: "The Light That''s Always On" / Bad: "Haunted Corridor" (traditional horror vocabulary reduces immersion)',
  (SELECT id FROM novel_creation_method WHERE name = '都市传说怪谈复苏流小说' LIMIT 1),
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
