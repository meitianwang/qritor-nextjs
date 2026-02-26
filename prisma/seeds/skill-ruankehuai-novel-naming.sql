-- 软科幻小说创作 - 「小说命名」AI生成技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-ruankehuai-novel-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ruankehuai-novel-naming',
  '软科幻小说命名：生成符合类型特征的书名，融合思想主题、反乌托邦气质与诗意张力',
  '"Novel Naming" for soft sci-fi: generates titles that blend thematic depth, dystopian atmosphere, and poetic tension',
  '## 小说命名指南 — 软科幻小说

软科幻的书名不是标签，是第一个思想问题。好的书名应该在读者合上书之后才真正理解它的全部含义——因为只有读完，才知道那个名字在说什么。

**软科幻书名的六种常见模式**

一、矛盾修辞（Oxymoron）型：将两个通常对立的概念并置，制造张力。《美丽新世界》（"美丽"和"新世界"的讽刺性并置）。如：《永恒的短暂》《自由的协议》《幸福的重量》。

二、数字或年份型：一个具体的时间或数字，暗示精确性与不可撤销性。《1984》《华氏451度》。如：《第七纪元》《2189年的档案》。

三、核心文物命名型：用故事中最具象征意义的制度文物命名。如果索麻是主角，书可以叫《索麻》；如果那个追踪手环是核心，书可以叫《手环》。简洁、具象、意味深长。

四、问句或悖论型：直接把主题的核心问题变成书名。《人是什么》《如果这叫做生活》。

五、体制术语型：用这个社会的官方话语命名，但在书名层面就已经充满讽刺意味。《幸福指数》《社会和谐条例》《优质公民手册》。

六、隐喻意象型：一个具体的自然意象，承载抽象含义。《最后的窗》《烟雾中的候鸟》《第九层土壤》。

**命名的检验标准**

- 读者在看到书名时，是否会想"这是什么意思"，但又隐约能感受到某种气质？
- 读完全书后，书名是否获得了新的意义，不再只是字面意思？
- 书名是否包含了你的核心主题，但不直接说出它？
- 书名是否适合这个故事的文风基调（冷峻、讽刺、史诗、诗意）？

**生成策略**

从以下三个方向各生成 2-3 个候选书名，再从中选择最能呼应主题的：
- 方向一：从故事的核心制度文物或场景提取；
- 方向二：从主题的核心矛盾或悖论提取；
- 方向三：从文风基调和情感重量提取。',
  '## Novel Naming Guide — Soft Sci-Fi

A soft sci-fi title isn''t a label — it''s the first thought-experiment. The best titles only reveal their full meaning after the book is finished — because only then does the reader understand what that name was really saying.

**Six naming patterns**: Oxymoron (placing opposing concepts in tension — "Brave New World" is a sustained irony); number/date (precision and irreversibility — "1984," "Fahrenheit 451"); core artifact naming (name the book after its central institutional artifact — simple, concrete, resonant); question/paradox (turn the central theme question directly into a title); official system terminology (use the society''s own language as title — the irony is built in); metaphorical imagery (a concrete natural image carrying abstract weight).

**Naming criteria**: Does the title make readers ask "what does this mean?" while feeling a certain atmospheric quality? Does it gain new meaning after finishing the book? Does it embed the core theme without stating it? Does it match the tonal register of the story?

**Generation strategy**: Generate 2-3 candidates from each of three directions — extract from the story''s core institutional artifact or scene; extract from the central contradiction or paradox; extract from the tonal register and emotional weight. Then choose the one that most resonates with the theme.',
  (SELECT id FROM novel_creation_method WHERE name = '软科幻小说' LIMIT 1),
  1,
  50,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  sort_order = VALUES(sort_order);
