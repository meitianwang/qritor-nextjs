-- 软科幻小说创作 - 「故事钩子」AI辅助生成技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-ruankehuai-story-hook-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ruankehuai-story-hook-setting-gen',
  '软科幻「故事钩子」AI辅助生成：确立核心矛盾、思想主题与叙事驱动力',
  '"Story Hook" AI generation for soft sci-fi: establishes core contradictions, thematic depth, and narrative drive',
  '## 「故事钩子」生成指南 — 软科幻小说

软科幻的故事钩子不同于悬疑小说的谜题钩子，也不同于奇幻的冒险钩子。它的核心是一个**思想问题**：一个关于人性、社会或文明的根本性问题，以叙事的方式提出，以人物命运作为试验田。

**核心矛盾的层次**

好的软科幻核心矛盾有三个层次：
- 表层叙事矛盾（这个故事讲什么）：主角想得到X，但体制阻止他；
- 中层社会矛盾（这个故事关于什么）：效率与自由的不可调和；稳定与意义的两难；进步与人性的背道而驰；
- 深层哲学矛盾（这个故事真正在问什么）：如果"幸福"可以被设计，它还是幸福吗？如果历史的走向可以被预测，人的选择还有意义吗？

三层矛盾要一致，最深层的哲学问题要能在表层故事中找到映射。

**切入事件的设计**

切入事件的作用是打破体制的"正常运转"，让主角（和读者）第一次看到系统的裂缝。切入事件可以是：
- 一个不该存在的信息（禁书、历史档案、一个陌生人的话）；
- 一个算法无法解释的异常（系统预测失败、一个不被允许的情感）；
- 一次越界（进入禁区、接触了"应该被隔离"的人群）；
- 一个个人损失（爱人被体制吞噬，或者发现自己的幸福是被设计出来的）。

切入事件不必轰轰烈烈，但它必须是不可撤销的——主角看到了之后，就再也无法假装没看到。

**主角社会位置的叙事含义**

不同社会位置对应不同的故事类型：
- 体制内精英（觉醒者）：从特权位置开始质疑，叙事张力在于他失去了什么，以及他是否有资格代表那些从未有过特权的人；
- 边缘人／异类：从未被系统完全接纳，叙事张力在于他是否真的想进入系统，或者系统其实需要他；
- 执行者／监控者（转变）：曾经维护体制的人，叙事张力在于罪责与赎回。

**思想主题的提炼**

思想主题要能够用一个悖论或问题来表达。不是"自由很重要"（那是结论），而是"当安全与自由不能兼得时，我们选择哪个，以及谁来替我们选"。不是"技术是把双刃剑"，而是"当工具比人类更理性时，工具和主人的位置会不会对调"。

**结局基调的选择**

软科幻的结局不必是胜利，但必须是诚实的。《1984》以彻底失败告终，但那个失败是对读者的警告；《基地》以有限但真实的希望告终。结局的基调决定了整部小说的情感重量——是要让读者感到绝望（警示），还是不安（思考），还是微小但真实的可能性（希望）？',
  '## "Story Hook" Generation Guide — Soft Sci-Fi

The soft sci-fi story hook is fundamentally a **thought experiment**: a core question about human nature, society, or civilization, posed through narrative, tested through character fates.

**Three-layer contradiction structure**: Surface narrative conflict (what the story is about) → social contradiction (what it''s really about — efficiency vs freedom, stability vs meaning) → philosophical question (what it''s ultimately asking — if happiness can be designed, is it still happiness?).

**Inciting incident design**: The best inciting incidents are small but irreversible — a piece of information that shouldn''t exist, an anomaly the algorithm can''t explain, a personal loss that reveals the system''s true cost. Once the protagonist sees it, they can never pretend they didn''t.

**Protagonist position**: Different social positions generate different narrative tensions. The elite awakener asks: do I have the right to speak for those who never had my privileges? The enforcer-turned-dissenter asks: can complicity be redeemed? Each position generates a specific kind of moral weight.

**Theme formulation**: Express the theme as a paradox, not a conclusion. Not "freedom matters" but "when safety and freedom are incompatible, who decides which we choose?"',
  (SELECT id FROM novel_creation_method WHERE name = '软科幻小说' LIMIT 1),
  1,
  23,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  sort_order = VALUES(sort_order);
