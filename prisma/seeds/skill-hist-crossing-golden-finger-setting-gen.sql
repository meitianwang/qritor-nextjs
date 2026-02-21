-- 历史人物穿越小说「金手指」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '历史人物穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-hist-crossing-golden-finger-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'hist-crossing-golden-finger-setting-gen',
  '「金手指」设定生成：为历史人物穿越小说生成金手指设定，包括类型、能力描述、使用限制、成长空间和获得方式',
  '"Golden Finger" setting generation: generate cheat ability settings for historical figure crossing novels',
  '## 「金手指」设定生成 — 历史人物穿越小说

「金手指」定义主角除先知优势外的额外能力。在历史穿越中，金手指设计需特别注意平衡——先知优势本身已经是巨大的金手指，额外能力过强会降低权谋博弈的张力。

---

### 字段生成指南

#### 金手指类型

选项：历史先知 / 现代知识 / 武艺传承 / 系统辅助 / 特殊体质 / 其他

| 类型 | 核心优势 | 适合搭配的穿越者身份 |
|------|---------|-------------------|
| 历史先知 | 对历史走向的精确了解 | 历史教授、历史爱好者 |
| 现代知识 | 科技、医学、军事等知识代差 | 工程师、医生、军人 |
| 武艺传承 | 超越时代的武艺能力 | 特种兵、武术教练 |
| 系统辅助 | 任务系统、属性面板等 | 任何现代身份 |
| 特殊体质 | 穿越后获得的异常体质 | 任何现代身份 |

应与穿越者身份相呼应。

#### 金手指类型详情

补充说明金手指类型的具体情况。即使不选"其他"也建议填写，让能力定义更清晰。

#### 能力描述

金手指的具体能力。必须具体化——不是"主角很强"，而是"可以做什么、不能做什么"。

示例：
- "对唐朝武德到贞观年间的重大历史事件有精确记忆，包括时间、参与者和结果，但对日常细节和小人物的命运记忆模糊"
- "拥有现代急救和中医知识，可以治疗常见疾病和外伤，但缺乏药材辨识能力和古代药方知识"

#### 使用限制

金手指的限制条件。限制越明确，故事张力越大：
- 先知信息是"消耗品"——每改变一个事件，后续走向偏离，信息价值降低
- 现代知识受限于古代材料和工艺条件
- 武艺受限于古代身体素质和营养条件
- 系统能力有冷却时间或使用代价

#### 成长空间

金手指如何随剧情发展而变化：
- 先知信息逐渐消耗 → 倒逼主角发展自身能力
- 现代知识逐步转化 → 从纸上谈兵到实际应用
- 武艺逐步适应 → 从不适应古代身体到完全掌控

#### 获得方式

穿越时自带还是后天获得：
- 穿越自带：最常见，简化设定
- 后天获得：可以设计为重要剧情节点的奖励',
  '## "Golden Finger" Setting Generation — Historical Figure Crossing Novel

The "Golden Finger" defines protagonist abilities beyond foreknowledge. In historical crossing, balance is critical — foreknowledge itself is already a massive advantage.

---

### Field Generation Guide

#### Type
Options: Historical foreknowledge / Modern knowledge / Martial inheritance / System assistance / Special physique / Other. Should match transmigrator''s modern identity.

#### Type Details
Supplementary explanation of the type specifics.

#### Ability Description
Must be specific — not "protagonist is strong" but "can do X, cannot do Y."

#### Usage Limitations
Clearer limitations = greater story tension. Foreknowledge is a "consumable" that depletes as history diverges.

#### Growth Potential
How the ability evolves with the plot — foreknowledge depletes, modern knowledge gets applied, martial skills adapt.

#### Acquisition Method
Innate from crossing (most common) or obtained later (can be a plot milestone reward).',
  (SELECT id FROM novel_creation_method WHERE name = '历史人物穿越小说' LIMIT 1),
  1,
  25,
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
