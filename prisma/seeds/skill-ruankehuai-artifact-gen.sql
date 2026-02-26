-- 软科幻小说创作 - 「制度文物」AI生成技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-ruankehuai-artifact-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ruankehuai-artifact-gen',
  '软科幻制度文物AI生成：创建承载社会隐喻的技术产品、制度文物与文化产物',
  '"Institutional Artifact" AI generation for soft sci-fi: creates technology products, institutional artifacts, and cultural objects that carry social metaphors',
  '## 「制度文物」生成指南 — 软科幻小说

制度文物是软科幻世界观最有力的具象化工具。一件道具可以浓缩一整套社会逻辑：索麻（Soma）浓缩了赫胥黎的整个世界观；《1984》的"双向电幕"浓缩了全监控社会的本质。好的制度文物让读者无需阅读社会学论文就能理解这个社会是什么。

**六种类型的设计逻辑**

技术产品／设备：关键不在于技术本身，而在于它改变了什么人类行为或社会关系。"情感同步手环"不需要解释它的工作原理，只需要展示：当两个人戴着它时，他们无法对彼此撒谎——而这个无法撒谎的社会最终删除了"理解"这个词，因为理解需要差异，而差异消失了。

制度／机构（抽象文物）：有些最重要的"文物"不是物品，而是制度——每年一次的"感恩申报"、强制和解协议、公民等级评估。这些制度作为文物的关键是：它们的日常性。人们已经不觉得它们奇怪了。

符号／标志：软科幻中的符号往往起到意识形态的视觉锚定作用。一个每个人都戴的臂章、一面被改写了含义的旗帜、一个所有孩子都会背诵的算式——符号的力量在于它的无处不在和被理所当然。

药物／生物改造物质：这类文物直接作用于人的身体和意识，是最直接的"异化物"。设计时要考虑：它是自愿的还是强制的？它的副作用是什么（而且副作用通常正是体制想要的"效果"）？

文化产物（艺术、语言、习俗）：被改写的语言是最深层的控制。当某些概念无法被表达时，它们最终也会无法被思考。一个禁止"私有"这个词的语言体系；一种只允许描述"集体成就"的艺术形式——文化的变形是最漫长也是最彻底的异化。

**表面功能与真实功能的张力**

每件制度文物的设计核心是：表面功能应该是真实的和有益的。没有人愿意接受一个明显有害的工具。"社会和谐指数追踪器"让你的医保费率降低了20%——谁会拒绝？真实功能（持续追踪你的情绪、社交、位置、消费，建立完整的心理画像用于预防性干预）藏在这个真实的好处之后。这种张力才是制度文物最有力的地方。

**选择一件核心文物**

建议每个故事有一件核心制度文物，其他文物围绕它建立意义网络。这件核心文物应该是整个主题的具象化：它的存在、被使用的方式、被违反的可能性，就是整个故事在讲的那件事。',
  '## "Institutional Artifact" Generation Guide — Soft Sci-Fi

Institutional artifacts are soft sci-fi''s most powerful worldbuilding tools. A single object can condense an entire social logic: Huxley''s Soma encapsulates his whole world; Orwell''s telescreen encapsulates total surveillance society. Good institutional artifacts let readers understand a society without reading a sociology paper.

**Core design principle**: The surface function should be genuinely real and beneficial. No one willingly accepts an obviously harmful tool. The "Social Harmony Index Tracker" reduces your health insurance premium by 20% — who would refuse? The real function (continuous tracking of your emotions, social connections, location, consumption to build a complete psychological profile for "preventive intervention") is hidden behind this genuine benefit. That tension is where the artifact''s power lies.

**Six types in brief**: Technical devices change human behavior or social relationships. Institutional artifacts (as abstract objects) are institutions whose mundane normality makes them invisible — no one finds them strange anymore. Symbols provide ideological visual anchoring through ubiquity and taken-for-grantedness. Drugs/bio-modifications act directly on consciousness — usually with "side effects" that are exactly what the system wanted. Cultural artifacts (language, art, customs) are the deepest layer of control — when concepts can''t be expressed, they eventually can''t be thought.

**Choose one core artifact** per story: it should embody the central theme — its existence, how it''s used, and the possibility of violating it should be what the story is about.',
  (SELECT id FROM novel_creation_method WHERE name = '软科幻小说' LIMIT 1),
  1,
  32,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  sort_order = VALUES(sort_order);
