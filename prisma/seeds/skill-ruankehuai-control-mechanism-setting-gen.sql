-- 软科幻小说创作 - 「控制与异化」AI辅助生成技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-ruankehuai-control-mechanism-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ruankehuai-control-mechanism-setting-gen',
  '软科幻「控制与异化」AI辅助生成：设计社会控制机制、异化形式与反抗可能性',
  '"Control & Alienation" AI generation for soft sci-fi: designs social control mechanisms, alienation forms, and resistance possibilities',
  '## 「控制与异化」生成指南 — 软科幻小说

这是软科幻最核心的模块，也是它与其他类型最根本的区分所在。控制与异化机制回答的是：社会如何把人变成它需要的样子，而人又是如何在这个过程中失去了什么——往往在不知不觉中。

**控制手段的设计原则**

最有力的控制不是枪指着你，而是让你自愿配合。软科幻中最有创意的控制机制具有以下特征：
- 它提供真实的利益（安全、便利、快乐），使被控制者主动接受甚至捍卫它；
- 它的边界模糊，很难指出"控制从哪里开始"；
- 它与个人认同深度绑定（不接受控制 = 失去身份）。

《美丽新世界》的索麻（Soma）是完美的案例：一种让人快乐、无副作用的药物，自愿服用，免费供应——问题是，服用它的时候你不再问任何问题。这不是暴力，这是设计。

**六种控制手段的写作要点**

信息管控：不是简单的审查，而是信息过载——不是隐藏真相，而是用海量噪音淹没它；
生物改造：药物、基因干预或神经芯片使情绪、欲望和认知变得"可管理"，副作用是人失去了那些"低效"的人类特质；
虚拟现实与娱乐麻痹：不需要压迫，只需要让现实足够无聊而逃脱足够愉悦；
AI监控：不是为了惩罚（那太粗糙），而是预测与引导——在你做出"错误"选择之前，算法已经调整了你的信息环境；
意识形态教育：从出生起植入的叙事，使人无法想象另一种存在方式；
经济依附：当你的医疗、住房、孩子的教育都绑定在同一个系统的评分上，逃离的成本是你输不起的一切。

**异化的核心概念**

异化（Alienation）在软科幻语境中的含义：人与自身的劳动、关系、情感或意志产生了分离——不是外部强制，而是系统性地把"人的东西"从人身上抽走，替换成系统需要的东西。一个人可以是完全幸福的异化者：有工作、有家庭、有娱乐，但他的所有决定都是算法预测过的，他的所有情感都是被设计激发的，他从未遇到过一个真正出乎意料的选择。

**制度自洽性：让体制看起来合理**

最危险的体制是那些有充分理由解释自己存在的体制。你需要能够用体制的逻辑来为它辩护："我们消除了七成的犯罪率"、"平均寿命延长了三十年"、"没有人挨饿"——这些都是真实的。问题是，代价是什么，谁决定的，有没有人被问过？写出这种自洽性，才能写出真正令人不安的反乌托邦。

**反抗的可能性**

在设计反抗力量时，要考虑：这个控制体系最脆弱的地方在哪里？是技术故障、人类情感的不可预测性、历史记忆的残存，还是体制内部的利益分裂？反抗不必成功，但必须有其逻辑。',
  '## "Control & Alienation" Generation Guide — Soft Sci-Fi

This is soft sci-fi''s most distinctive module. Control and alienation mechanisms answer: how does society reshape people into what it needs, and what do people lose in the process — often without noticing?

**Design principle**: The most powerful control isn''t a gun to your head — it''s making you voluntarily cooperate. The most creative control mechanisms offer real benefits (safety, convenience, pleasure), have blurry boundaries so it''s hard to identify "where control begins," and bind deeply to personal identity so that rejecting control means losing yourself.

Huxley''s Soma is the perfect case study: a happiness drug, voluntary, free, no side effects — the only issue is that while taking it, you stop asking questions. That''s not violence. That''s design.

**Alienation**: In soft sci-fi, alienation means people become separated from their own labor, relationships, emotions, or will — not through external coercion but through systematic extraction of "human things," replaced by what the system needs. A person can be a perfectly happy, fully alienated being — employed, loved, entertained — if every decision they make was predicted by an algorithm and every emotion they feel was designed to be triggered.

**Institutional coherence**: The most dangerous systems are those that can justify their own existence. You need to be able to defend the system on its own terms — crime down 70%, life expectancy up 30 years, no one starves. All true. The question is: at what cost, decided by whom, and was anyone asked?',
  (SELECT id FROM novel_creation_method WHERE name = '软科幻小说' LIMIT 1),
  1,
  22,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  sort_order = VALUES(sort_order);
