-- 未来科幻穿越创作「小说命名」技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '未来科幻穿越创作' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-scifi-crossing-novel-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'scifi-crossing-novel-naming',
  '小说命名：为未来科幻穿越创作生成书名和内容简介，提供科幻感与穿越视角兼顾的命名指导',
  '"Novel Naming": Generate titles and synopses for sci-fi transmigration novels, balancing science-fiction atmosphere with the transmigrator''s outsider perspective',
  '## 小说命名 — 未来科幻穿越创作

未来科幻穿越小说的书名核心是**科幻感与反差感**。主角（来自现代或古代）穿越到技术高度发达的未来，书名要同时传递两种气质：**宏大的未来世界**（星际文明、量子技术、AI、末日重建）+ **穿越者独特的旁观者视角**（用过去的眼光理解未来，或用未来的知识颠覆历史）。

未来科幻穿越区别于普通科幻小说的关键在于：**穿越者的文化冲击和反差感是卖点**，而非单纯的科幻世界观展示。书名应当体现这种时空错位的张力。

---

### 命名哲学

三个层次：
1. **未来世界感** — 书名要有科技感，让读者感受到故事发生在遥远的未来（星际、量子、奇点、AI文明）
2. **穿越反差感** — 暗示主角是来自过去的"异类"，其视角和知识在未来世界有特殊意义
3. **故事的核心矛盾** — 主角是要融入未来、改变未来，还是要回到过去？矛盾方向决定书名基调

---

### 常见书名格式

**格式一：时间/跨度型**
- 结构：强调时间跨度或时代差异
- 示例：《穿越两千年》《从2024到2300》《时间错位者》《历史的终点》
- 适合：强调时间跨度带来的文化冲击，主角的格格不入感是卖点

**格式二：科技/文明型**
- 结构：未来世界的核心科技或文明形态
- 示例：《星际文明》《量子之上》《奇点之后》《末日重建》《基因战争》
- 适合：以未来世界观为主要卖点，主角深度融入并影响未来世界

**格式三：主角视角/身份型**
- 结构：以穿越者的特殊身份或视角为核心
- 示例：《未来世界的古代人》《星际时代的历史学家》《AI文明里的人类》《旧时代遗民》
- 适合：主角的文化背景本身就是故事的核心冲突来源

**格式四：使命/任务型**
- 结构：主角有明确的时间任务或使命
- 示例：《改写未来的人》《星际使者》《时间修复者》《历史的守护者》
- 适合：主角有明确的任务目标，故事以完成任务为驱动

**格式五：反套路/哲学型**
- 结构：带有哲学思考或反套路设计
- 示例：《文明的尽头》《当历史遇见未来》《人类2.0》《进化的代价》
- 适合：追求深度感的读者，故事有社会批判或哲学思考维度

---

### 主题词库

| 类别 | 词汇 |
|------|------|
| 科技感 | 量子、基因、纳米、AI、神经网络、奇点、超算 |
| 宇宙/星际 | 星际、宇宙、星舰、太空、星系、外星、殖民地 |
| 时间感 | 穿越、时间、跨越、2xxx年、世纪、纪元 |
| 文明感 | 文明、人类、进化、末日、重建、黎明 |
| 身份感 | 遗民、异类、使者、守护者、修复者、旁观者 |

---

### 书名优劣对比

| 好书名 | 差书名 | 原因 |
|--------|--------|------|
| 《星际时代的历史学家》 | 《穿越到未来》 | 后者无世界感，任何科幻都能用 |
| 《奇点之后》 | 《未来很厉害》 | 后者完全无信息量 |
| 《量子之上》 | 《科幻穿越小说》 | 后者是类型标签不是书名 |
| 《旧时代遗民》 | 《古代人穿越未来》 | 后者直白有余，文学感不足 |
| 《文明的尽头》 | 《最强未来人》 | 后者网络爽文感破坏科幻质感 |

---

### 内容简介结构

**第一段 — 穿越背景与落点（定位）**
交代主角来自哪个时代（现代2020s、或更远的古代）、以及穿越到的未来世界是什么样（科技水平、文明形态、时间节点）。要让读者立刻感受到时代落差——这个落差本身就是故事最大的吸引力。

**第二段 — 处境与特殊优势（张力）**
主角在未来世界面临的处境（身份验证失败、被当作异类、技术完全看不懂），以及主角的独特优势（古代知识在某方面意外适用、特殊的思维方式、金手指或历史预知）。两者的碰撞制造悬念。

**第三段 — 目标与选择（钩子）**
主角的核心问题：是想回到过去，还是要在未来生存下去，或者有某个使命要完成？情感线或科技/阴谋钩子。结尾留悬念。

**字数**：150-250 字为宜。

---

### 常见错误

- ❌ 书名和普通玄幻书名混同（"至尊""无敌"出现在科幻穿越书名中，气质完全不符）
- ❌ 简介只介绍未来世界，忘记突出穿越者的反差感和特殊视角
- ❌ 大量科技术语堆砌（量子纳米基因AI全写进去，信息过载）
- ❌ 书名完全看不出有穿越元素（读者可能以为是普通科幻）
- ❌ 简介的科幻设定太复杂，读者第一次看难以理解',
  '## Novel Naming — Sci-Fi Transmigration Novel

Core: **sci-fi atmosphere + transmigrator''s outsider perspective contrast**. The protagonist (from the modern era or further back) arrives in a technologically advanced future. Titles must convey both: a grand future world (interstellar civilization, quantum tech, AI, post-apocalyptic rebuilding) AND the transmigrator''s unique vantage point as an anachronism.

---

### Naming Philosophy

Three layers:
1. **Future world feel** — Conveys far-future technology (interstellar, quantum, singularity, AI civilization)
2. **Transmigration contrast** — Hints that the protagonist is an "outsider from the past" whose perspective is uniquely valuable
3. **Core conflict direction** — Integrate into the future? Change it? Return to the past? This determines the title''s tone

---

### Common Title Formats

1. **Time/span type**: "Across Two Thousand Years", "Time Misalignment"
2. **Technology/civilization type**: "After the Singularity", "Interstellar Civilization", "Gene Wars"
3. **Protagonist identity type**: "An Ancient in the Future World", "Historian of the Interstellar Age"
4. **Mission/task type**: "The History Rewriter", "Time Repair Agent"
5. **Philosophical/subversive**: "The End of Civilization", "Evolution''s Price", "Human 2.0"

---

### Key Vocabulary

Tech (quantum, gene, nano, AI, neural network, singularity), space (interstellar, universe, starship, colony), time (transmigration, centuries, epoch), civilization (civilization, humanity, evolution, doomsday, rebuilding)

---

### Synopsis Structure

1. **Transmigration context**: What era protagonist came from + what the future world looks like (tech level, civilization form, time point) — the temporal gap is the story''s biggest draw
2. **Situation and advantage**: Being treated as an anomaly in the future + protagonist''s unexpected advantages from their past knowledge or mindset
3. **Goal and hook**: Return home? Survive? Complete a mission? End with mystery

**Length**: 150-250 characters',
  (SELECT id FROM novel_creation_method WHERE name = '未来科幻穿越创作' LIMIT 1),
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
