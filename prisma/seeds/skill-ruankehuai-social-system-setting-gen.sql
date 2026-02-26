-- 软科幻小说创作 - 「社会体制」AI辅助生成技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-ruankehuai-social-system-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ruankehuai-social-system-setting-gen',
  '软科幻「社会体制」AI辅助生成：构建政治形态、阶级结构与权力核心',
  '"Social System" AI generation for soft sci-fi: designs political forms, class structures, and power dynamics',
  '## 「社会体制」生成指南 — 软科幻小说

社会体制是软科幻世界观的权力骨架。它回答的问题是：谁统治谁，凭什么统治，代价是什么。好的体制设定不是政治学教科书，而是一套自洽的权力逻辑——读者应该能理解这个体制为何能运转，以及它的内在矛盾在哪里。

**政治形态的生成逻辑**

不同技术核心对应不同的政治演化路径：AI驱动的计划管控自然产生技术官僚制（算法决策取代民主选举）；基因工程导致基因优越主义（天然产生新型种姓制度）；企业巨头在后稀缺经济中成为事实上的国家（企业寡头制）。政治形态应该是技术与历史逻辑的自然结果，而非随机选择。

**阶级结构的设计要点**

软科幻中最有力的阶级设计往往不是"富人对穷人"，而是一种新型的、与技术挂钩的分层：算法信用评分决定你能租住哪个区、孩子能进哪所学校、器官移植排队的优先级；基因档案决定你的保险费率和职业天花板；意识上传权成为新的阶级特权——谁能活两次？阶级标准的技术化，使传统的阶级斗争话语失效，这是软科幻的特有张力。

**权力核心的可见性**

权力可以是显性的（你知道谁统治你），也可以是隐性的（你以为你自由，但你的每个选择都在算法预期内）。《1984》的权力是显性的恐惧；《美丽新世界》的权力是隐性的满足。你的体制选择哪种模式，决定了故事的整体张力模式。

**个人与集体关系的四种模式**

- 极端集体主义：个体价值完全从属于集体功能，情感、创造力、独特性都被视为效率障碍；
- 原子化个人主义：社会关系瓦解，人人是孤岛，技术提供了无需真实连接的"社交体验"；
- 被监控的「自由」：表面上你有无数选择，但每个选择都被记录、分析、反馈到下一次推送；
- 分层化：精英享有真正的自由（隐私、迁徙、选择），底层的"自由"是被设计好的幻觉。

**社会核心矛盾的生成**

矛盾要从体制内部生长出来：技术官僚制的矛盾是——当算法比人类更理性，"民主"还有意义吗？企业寡头制的矛盾是——当企业提供一切，公民和消费者的区别还存在吗？双轨制经济的矛盾是——当两套规则并行，社会契约的基础是什么？矛盾是故事的发动机，它不需要在第一章爆发，但它应该从第一页就隐隐存在。

**写作时的常见错误**

避免将体制写成纯粹的"坏人设计的坏系统"。最可怕的反乌托邦体制往往是由善意出发、经过理性推演而形成的。"我们消除了战争，消除了饥饿，消除了痛苦——只是顺便也消除了意义。"',
  '## "Social System" Generation Guide — Soft Sci-Fi

The social system is the power skeleton of the soft sci-fi world. It answers: who governs whom, on what basis, and at what cost. Good system design isn''t a political science textbook — it''s a self-consistent logic of power that readers can understand, including where its internal contradictions lie.

**Political form follows technology**: AI-driven management naturally produces technocracy (algorithmic decisions replace elections); genetic engineering produces neo-caste systems; corporate giants in post-scarcity economies become de facto states. Political forms should emerge naturally from technological and historical logic.

**Class design**: The most powerful soft sci-fi classes aren''t "rich vs poor" but technology-indexed stratification — algorithmic credit scores determining housing, education, and medical priority; genetic profiles setting insurance rates and career ceilings. When class criteria become technical, traditional class struggle vocabulary stops working. This is soft sci-fi''s unique tension.

**Visibility of power**: Power can be overt (you know who rules you) or covert (you believe you''re free, but every choice falls within algorithmic expectation). Your choice determines the overall tension model of the story.

**Core contradiction**: Contradictions should grow from within the system itself. A technocracy''s contradiction: when algorithms are more rational than humans, does "democracy" still mean anything? The contradiction is the story''s engine — it doesn''t need to explode in chapter one, but it should be felt from the first page.',
  (SELECT id FROM novel_creation_method WHERE name = '软科幻小说' LIMIT 1),
  1,
  21,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  sort_order = VALUES(sort_order);
