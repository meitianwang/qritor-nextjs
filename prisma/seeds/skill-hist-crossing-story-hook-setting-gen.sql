-- 历史人物穿越小说「故事钩子」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '历史人物穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-hist-crossing-story-hook-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'hist-crossing-story-hook-setting-gen',
  '「故事钩子」设定生成：为历史人物穿越小说生成故事钩子设定，包括核心吸引力、穿越目标、卖点、开篇悬念和读者期待',
  '"Story Hook" setting generation: generate story hook settings for historical figure crossing novels, including core appeal, crossing target, selling points, opening suspense, and reader expectations',
  '## 「故事钩子」设定生成 — 历史人物穿越小说

「故事钩子」是整个创作的起点，决定故事的核心吸引力。历史人物穿越的故事钩子必须体现「先知叙事」的核心魅力——知道未来却未必能改变未来的博弈。

---

### 字段生成指南

#### 故事钩子

一句话概括故事的核心吸引力。好的故事钩子公式：**穿越身份 + 紧迫危机 + 逆转承诺**

优秀示例：
- "穿越成即将被赐死的太子，三天内必须翻盘"
- "重生为被灭族的名将，距离抄家还有一百天"
- "魂穿亡国公主，和亲路上开始谋划复国"

避免：
- 没有紧迫感的设定（"穿越成皇帝安稳治国"）
- 没有具体冲突的设定（"穿越到古代看看"）

#### 穿越目标

穿越到哪个历史人物或小说角色身上。选择标准：
- **命运反差大**：原角色结局悲惨，改命空间大
- **身份有权柄**：位于权力网络中，有操作空间
- **读者有认知**：知名人物自带代入感

经典穿越目标参考：
- 历史悲剧人物：李建成、崇祯、项羽、岳飞
- 小说悲情角色：林黛玉、杨康、林冲
- 被废/被贬人物：废太子、流放皇子、被贬忠臣

#### 核心卖点

故事最大的看点，需要差异化。好的卖点公式：**现代知识/能力 × 历史场景 = 独特化学反应**

示例：
- "用现代金融知识改变三国经济格局"
- "特种兵穿越成文弱书生，在安史之乱中以武定天下"
- "历史教授穿越到自己研究了一辈子的朝代"

#### 开篇悬念

第一章就要呈现的危机或悬念。历史穿越的开篇黄金公式：**穿越即危机**

- 穿越时主角正处于生死关头
- 穿越后马上面临必须做出的关键抉择
- 主角尚未适应身份就被卷入权力漩涡

#### 读者期待

明确承诺给读者的核心体验。历史穿越读者的核心期待：
- **逆天改命的快感**：看主角扭转悲惨命运
- **历史细节的沉浸感**：精准的历史细节让人身临其境
- **权谋博弈的智慧感**：靠布局谋略而非武力碾压
- **蝴蝶效应的紧张感**：每次改变都可能引发连锁反应',
  '## "Story Hook" Setting Generation — Historical Figure Crossing Novel

The "Story Hook" is the starting point of the entire creation, determining the story''s core appeal. Historical figure crossing story hooks must embody the core charm of "foreknowledge narrative" — the tension of knowing the future but not necessarily being able to change it.

---

### Field Generation Guide

#### Story Hook

A one-sentence summary of the story''s core appeal. Formula: **Crossing identity + Urgent crisis + Reversal promise**

Good examples:
- "Transmigrated as a crown prince about to be executed, must turn things around in 3 days"
- "Reborn as a famous general whose clan will be exterminated, 100 days until the purge"
- "Soul-transmigrated into a doomed princess, planning restoration during a political marriage journey"

Avoid:
- Settings without urgency ("Transmigrated as emperor, ruling peacefully")
- Settings without specific conflict ("Went to ancient times to look around")

#### Crossing Target

Which historical figure or novel character to transmigrate into. Selection criteria:
- **High fate contrast**: Original character had a tragic ending, lots of room for change
- **Position of power**: Located within power networks, has room to maneuver
- **Reader recognition**: Famous figures carry built-in immersion

Classic crossing targets:
- Historical tragic figures: Li Jiancheng, Chongzhen Emperor, Xiang Yu, Yue Fei
- Novel tragic characters: Lin Daiyu, Yang Kang, Lin Chong
- Deposed/exiled figures: Deposed crown princes, exiled princes, demoted loyal ministers

#### Core Selling Point

The story''s biggest attraction — needs differentiation. Formula: **Modern knowledge/ability × Historical setting = Unique chemistry**

Examples:
- "Using modern finance to reshape the Three Kingdoms economy"
- "Special forces soldier transmigrates into a frail scholar, bringing martial order during the An Lushan Rebellion"
- "History professor transmigrates into the dynasty they studied their entire career"

#### Opening Suspense

The crisis or suspense that must appear in chapter one. Golden formula: **Transmigration = Immediate Crisis**

- The protagonist is in mortal danger at the moment of transmigration
- Must immediately make a critical decision after transmigrating
- Gets pulled into power struggles before adapting to the new identity

#### Reader Expectations

Core experiences promised to the reader. Historical crossing readers expect:
- **Thrill of defying fate**: Watching the protagonist reverse a tragic destiny
- **Immersion in historical detail**: Precise historical details for vivid experience
- **Intellectual power plays**: Victory through strategy, not brute force
- **Butterfly effect tension**: Every change could trigger chain reactions',
  (SELECT id FROM novel_creation_method WHERE name = '历史人物穿越小说' LIMIT 1),
  1,
  20,
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
