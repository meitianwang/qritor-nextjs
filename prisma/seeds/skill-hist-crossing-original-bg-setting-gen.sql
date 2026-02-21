-- 历史人物穿越小说「原著背景」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '历史人物穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-hist-crossing-original-bg-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'hist-crossing-original-bg-setting-gen',
  '「原著背景」设定生成：为历史人物穿越小说生成原著背景设定，包括时代背景、历史时期、政治格局、社会制度、文化特征和关键背景',
  '"Original Background" setting generation: generate source material background settings for historical figure crossing novels',
  '## 「原著背景」设定生成 — 历史人物穿越小说

「原著背景」构建穿越世界的基础环境，是所有后续设定的根基。内容必须基于真实历史考据（历史人物穿越）或原著细节（小说角色穿越）。

---

### 字段生成指南

#### 时代背景

故事发生的历史时期或小说世界的整体描述。应涵盖：
- 时代的核心特征（盛世/乱世/变革期）
- 主要矛盾和冲突源
- 与主角命运相关的时代特点

示例："唐朝武德年间，天下初定但暗流涌动。李渊立国不久，诸子争储日趋白热化，突厥频繁犯边，关陇贵族与山东豪族的权力博弈尚未落定。"

#### 历史时期

具体的朝代或年代，精确到年号或年份。
- 如"唐朝武德九年（626年）"
- 如"东汉末年建安十三年（208年）"

#### 政治格局

当时的政治势力分布，包括：
- 各方势力的力量对比
- 关键派系和代表人物
- 势力间的合纵连横关系
- 主角所属势力的处境

应呈现"多方博弈"的格局，为主角的权谋操作提供空间。

#### 社会制度

当时的关键社会制度，重点描述影响主角行动的制度：
- 选官制度（科举/九品中正/察举等）
- 军事制度（府兵/募兵/藩镇等）
- 阶层制度（门阀/寒门/奴婢等）
- 经济制度（田制/商业/货币等）

#### 文化特征

影响角色行为和读者理解的文化背景：
- 主流价值观和道德标准
- 风俗习惯和日常礼仪
- 宗教信仰和哲学思潮
- 禁忌和潜规则

#### 关键背景

直接影响主角命运走向的环境因素，通常是最紧迫的威胁或最大的机遇：
- 迫在眉睫的政治危机
- 主角面临的具体困境
- 可以利用的关键资源或人脉',
  '## "Original Background" Setting Generation — Historical Figure Crossing Novel

The "Original Background" builds the foundational environment of the crossing world. Content must be based on real historical research (for historical figures) or source material details (for novel characters).

---

### Field Generation Guide

#### Era Background
Overall description of the historical period. Should cover: core characteristics (prosperity/chaos/transformation), main contradictions, era features relevant to protagonist''s fate.

#### Historical Period
Specific dynasty and year, precise to reign title or year number.

#### Political Landscape
Distribution of political forces: power balance, key factions and representatives, alliances and rivalries, protagonist''s faction situation.

#### Social System
Key social institutions affecting protagonist''s actions: official selection, military system, class structure, economic system.

#### Cultural Characteristics
Cultural background affecting character behavior: mainstream values, customs and etiquette, religious beliefs, taboos and unwritten rules.

#### Key Background
Environmental factors directly affecting protagonist''s fate: imminent political crises, specific dilemmas, available key resources or connections.',
  (SELECT id FROM novel_creation_method WHERE name = '历史人物穿越小说' LIMIT 1),
  1,
  22,
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
