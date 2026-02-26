-- 穿书文小说「原著剧情线」设定生成技能
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '穿书文小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-chuanshu-original-plot-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'chuanshu-original-plot-setting-gen',
  '「原著剧情线」设定生成：为穿书文小说生成原著剧情设定，包括主线剧情、关键转折点、危险事件和蝴蝶效应风险',
  '"Original Plot" setting generation: generate source material plot settings for book-crossing novels',
  '## 「原著剧情线」设定生成 — 穿书文小说

「原著剧情线」是穿书者先知优势的核心来源，定义了穿书者"知道什么"。剧情线的详细程度直接影响穿书者的行动策略和故事张力。

---

### 字段生成指南

#### 主线剧情

原著的主线故事概述。要求：
- 简明扼要地概述原著从开头到结尾的主线走向
- 突出穿书者所处角色在主线中的位置
- 明确标注穿书者当前处于主线的哪个阶段

示例："这是一本总裁文。霸总男主与灰姑娘女主的爱情故事。女配（穿书者所在角色）是霸总的未婚妻，在原著中处处刁难女主，最终被退婚、事业破产、众叛亲离。"

#### 关键转折点

原著中的重大转折事件。按时间顺序列出，建议 5-10 个节点：

每个节点应包含：
- **事件描述**：发生了什么
- **对穿书者的影响**：该事件如何影响穿书者的处境
- **可利用/需规避**：穿书者是否可以利用先知优势改变这个节点

转折点分类参考：
| 类型 | 说明 | 典型数量 |
|------|------|---------|
| 主角机缘 | 原著主角获得关键资源/能力的节点 | 2-3 个 |
| 反派暴露 | 原著反派/恶毒配角被揭穿的节点 | 1-2 个 |
| 感情转折 | 原著CP的关键感情进展 | 2-3 个 |
| 大危机 | 影响整个世界的重大事件 | 1-2 个 |

#### 危险事件

对穿书者构成直接威胁的事件：
- 原著中该角色的"死亡Flag"
- 可能被原著主角/反派针对的场景
- 原著中的天灾/战争/大型冲突
- 穿书者身份暴露的风险节点

#### 重要机缘

穿书者凭原著知识可以利用的资源：
- 原著主角的机缘（如果穿书者决定截胡）
- 被原著遗忘的宝物/秘密
- 提前结交贵人的时机
- 重要信息的提前获取

#### 已知伏笔

原著中埋下的伏笔和暗线：
- 还没揭开的身世之谜
- 隐藏的反派/盟友
- 尚未触发的关键道具
- 穿书者可以提前利用的伏笔

#### 原著结局

原著的最终结局。注意与「穿书设定」中的剧情知悉度配合：
- 如果穿书者"通读全书"：详细描述结局
- 如果穿书者"只看了开头"：只描述穿书者了解的部分，标注"未知"

#### 蝴蝶效应风险

穿书者的行为可能导致的剧情偏离：
- 核心原则：穿书者改变的越多，先知优势消耗越快
- 低风险改变：不影响主线的小事（如日常琐事）
- 中风险改变：可能影响支线剧情（如改变某个配角的命运）
- 高风险改变：直接干预主线（如截胡主角的机缘）
- 灾难级改变：改变原著核心设定（如阻止男女主相遇）',
  '## "Original Plot" Setting Generation — Book-Crossing Novel

The "Original Plot" is the core source of the crosser''s foreknowledge advantage, defining what the crosser "knows."

---

### Field Generation Guide

#### Main Plot
Overview of the original story from beginning to end. Highlight the crosser''s character position in the main plot.

#### Key Turning Points
Major turning events listed chronologically (5-10 recommended). Each includes: event description, impact on crosser, exploitable/avoidable status. Types: protagonist opportunities, villain exposure, romance milestones, major crises.

#### Dangerous Events
Direct threats: character''s "death flags," targeting by protagonist/villain, world-level disasters, identity exposure risks.

#### Important Opportunities
Exploitable resources via original knowledge: protagonist''s opportunities (if intercepting), forgotten treasures, timing to befriend important characters.

#### Known Foreshadowing
Buried plot threads: unrevealed identities, hidden allies/enemies, untriggered key items.

#### Original Ending
Must align with Plot Knowledge Level from Book-Crossing Setting. If crosser only read the beginning, mark unknown portions.

#### Butterfly Effect Risk
Changes categorized by risk: low (doesn''t affect main plot), medium (affects subplots), high (interferes with main plot), catastrophic (changes core settings).',
  (SELECT id FROM novel_creation_method WHERE name = '穿书文小说' LIMIT 1),
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
