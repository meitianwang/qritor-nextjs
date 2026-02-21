-- 历史人物穿越小说「原著剧情」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '历史人物穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-hist-crossing-original-plot-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'hist-crossing-original-plot-setting-gen',
  '「原著剧情」设定生成：为历史人物穿越小说生成原著剧情设定，包括原著概述、关键剧情节点和原著结局',
  '"Original Plot" setting generation: generate source material plot settings for historical figure crossing novels',
  '## 「原著剧情」设定生成 — 历史人物穿越小说

「原著剧情」是先知优势的信息来源，定义了主角"知道什么"。这是历史穿越小说最独特的设定——主角掌握的原著/历史信息决定了他的行动策略。

---

### 字段生成指南

#### 原著概述

原著中主角（穿越目标角色）的主要经历概述。要求：
- 简明扼要地概述原角色的人生轨迹
- 重点突出命运的转折点
- 点明最终的悲惨结局（这是主角最想改变的）

示例："李建成作为大唐开国太子，在统一战争中功勋卓著，但因政治斗争失利，最终在玄武门之变中被弟弟李世民所杀，死后被削去太子之位，追封为隐太子。"

#### 关键剧情（数组）

原著/历史中的关键剧情节点。每个节点包含三个子字段：

**剧情节点**：事件名称，简短精确。

**原著发展**：该事件在原著/历史中的实际发展过程。

**可改变点**：主角可以利用先知优势进行干预的具体方式。

节点分类参考：
| 类型 | 说明 | 数量建议 |
|------|------|---------|
| 核心事件 | 决定历史走向的关键转折 | 2-3 个 |
| 关键转折 | 影响主角个人命运 | 3-5 个 |
| 次要事件 | 可利用的机遇或需规避的风险 | 2-3 个 |
| 人际互动 | 影响关键人物关系 | 1-2 个 |

**可改变点的设计层级**：
- 轻松改变：初期建立信心，展示先知优势
- 需要准备：展示主角智慧和耐心
- 代价巨大：增加决策的戏剧张力
- 引发连锁：蝴蝶效应的核心体现
- 无法改变：制造悲剧性和命运感

建议总计 8-13 个关键剧情节点，形成完整的剧情骨架。

#### 原著结局

原著中主角的最终结局。这是整个穿越故事的核心驱动力——主角最想改变的终点。
- 描述原角色的最终命运
- 点明其悲剧性或不甘之处
- 暗示改变这个结局的可能性和难度',
  '## "Original Plot" Setting Generation — Historical Figure Crossing Novel

The "Original Plot" is the source of foreknowledge advantage, defining what the protagonist "knows." This is the most unique setting in historical crossing novels.

---

### Field Generation Guide

#### Original Overview
Brief overview of the crossing target character''s life trajectory in the source material. Focus on fate turning points and the tragic ending.

#### Key Plot Points (Array)
Critical plot points from the source material. Each contains: plot point name, original development, changeable aspects. Recommend 8-13 total points across: core events (2-3), key turning points (3-5), minor events (2-3), interpersonal interactions (1-2).

Design changeable aspects with varying difficulty levels: easy change → requires preparation → high cost → triggers chain reactions → unchangeable.

#### Original Ending
The character''s final fate in the source material — the core driving force of the entire crossing story.',
  (SELECT id FROM novel_creation_method WHERE name = '历史人物穿越小说' LIMIT 1),
  1,
  23,
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
