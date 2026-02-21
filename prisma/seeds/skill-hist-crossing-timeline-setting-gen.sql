-- 历史人物穿越小说「历史事件时间线」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '历史人物穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-hist-crossing-timeline-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'hist-crossing-timeline-setting-gen',
  '「历史事件时间线」设定生成：为历史人物穿越小说生成历史事件时间线，包括时间线概述和按时间排列的关键事件',
  '"Historical Event Timeline" setting generation: generate historical event timeline for historical figure crossing novels',
  '## 「历史事件时间线」设定生成 — 历史人物穿越小说

「历史事件时间线」是本创作方法独有的设定类型，也是蝴蝶效应设计的基础。它定义了主角穿越后将面对的历史进程。

---

### 字段生成指南

#### 时间线概述

时间线的整体概述，概括从穿越时间点开始的未来数年历史走向。应包含：
- 穿越时间点的历史背景
- 未来几年的主要历史趋势
- 对主角命运影响最大的宏观走势

#### 关键事件（数组）

时间线上的关键事件，按时间顺序排列。每个事件包含五个子字段：

**时间**：精确到月份或季节（如"武德九年六月"、"建安十三年秋"）

**事件**：简明描述事件本身

**对主角的影响**：这个事件如何影响主角的处境和命运

**可否改变**：三个等级——
- **可改变**：通过合理手段可以直接改变
- **难以改变**：需要付出巨大代价或多方配合
- **不可改变**：历史大势所趋，个人力量无法扭转

**改变方式**：如果可以改变，需要什么具体条件和手段

### 时间线结构建议

按距离穿越时间点的远近分层：

| 时间距离 | 数量建议 | 特点 |
|---------|---------|------|
| 近期（1-3个月内） | 2-3 个 | 最紧迫，需要立即应对 |
| 中期（3-12个月内） | 3-4 个 | 需要提前布局 |
| 远期（1-3年内） | 2-3 个 | 最终的命运节点 |
| 历史大势（3年以上） | 1-2 个 | 几乎不可改变的宏观趋势 |

### 设计原则

- 事件间应有因果关联，改变一个事件可能影响后续事件
- 可改变性应从近到远递减：近期事件多为"可改变"，远期事件多为"难以改变"或"不可改变"
- 总计 8-12 个关键事件，形成完整的历史进程框架
- 改变方式应具体可操作，不是"提前准备"这种空话',
  '## "Historical Event Timeline" Setting Generation — Historical Figure Crossing Novel

The "Historical Event Timeline" is a unique setting type for this creation method and the foundation of butterfly effect design.

---

### Field Generation Guide

#### Timeline Overview
Overall summary of historical trends from the crossing point forward.

#### Key Events (Array)
Events arranged chronologically, each with five sub-fields: time (precise to month/season), event description, impact on protagonist, changeability (changeable/difficult to change/unchangeable), and method of change.

Structure by distance from crossing point: immediate (1-3 months, 2-3 events), mid-term (3-12 months, 3-4 events), long-term (1-3 years, 2-3 events), macro trends (3+ years, 1-2 events). Total 8-12 events.

Design principles: events should have causal links, changeability decreases with distance, change methods should be specific and actionable.',
  (SELECT id FROM novel_creation_method WHERE name = '历史人物穿越小说' LIMIT 1),
  1,
  24,
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
