-- 穿书文小说「势力/组织」生成技能
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '穿书文小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-chuanshu-org-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'chuanshu-org-gen',
  '「势力/组织」生成：为穿书文小说生成势力组织，涵盖原著势力和原创势力，强调穿书者对势力走向的先知优势',
  '"Faction" generation: generate factions for book-crossing novels, covering original and new factions',
  '## 「势力/组织」生成 — 穿书文小说

穿书文的势力设计核心是**原著势力格局 × 穿书者先知 × 势力走向改变**。穿书者知道每个势力在原著中的命运走向，这种信息优势让势力选择和立场博弈变得格外有趣。

---

### 字段生成指南

#### 名称

根据原著世界类型选择命名风格：
- 古代宫廷：以人物或政治立场命名（"太子党""长公主一脉"）
- 仙侠世界：以地名或理念命名（"苍穹宗""碧落门"）
- 现代都市：以公司或家族命名（"陆氏集团""沈家"）
- 末世废土：以据点或领袖命名（"南城联盟""铁壁营"）

原著势力使用原著名称。

#### 组织来源

| 来源 | 穿书者优势 | 设计要点 |
|------|----------|---------|
| **原著势力** | 知道该势力的未来走向和内部秘密 | 忠于原著的势力设定 |
| **原创势力** | 没有先知信息 | 可以是蝴蝶效应催生的新势力 |

#### 类型

六个选项根据原著世界类型选择：
- 古代：家族、朝廷/政府
- 仙侠：门派/帮派
- 现代：商业势力、秘密组织
- 通用：所有类型

#### 规模

参照原著中的势力描述确定。

#### 势力范围

描述该势力控制的地盘和影响力范围。原著势力参照原著。

#### 核心成员

列出关键人物。优先使用原著中的角色。

#### 在原著中的命运

穿书文势力设计的核心字段：
- 描述该势力在原著中的最终走向（兴盛/衰败/覆灭/被吞并等）
- 穿书者可以利用这些信息做出有利选择
- 例如："原著中被男主覆灭，但核心成员中有一位隐藏的好人值得拉拢"

#### 与主角关系

基于穿书者的身份和原著中的立场设计关系：
- **所属势力**：穿书者从属的势力
- **盟友**：利益一致的势力
- **中立**：可争取的势力（穿书者可以利用先知信息争取）
- **敌对**：原著中与穿书者角色对立的势力
- **暗中利用**：穿书者利用先知信息暗中操控的势力

---

### 势力阵容建议

1. **穿书者所属势力**（1 个）：原著角色从属的势力
2. **原著主角阵营**（1 个）：原著主角的势力（穿书者需要决定合作还是对抗）
3. **原著反派势力**（1 个）：穿书者知道其最终命运
4. **可争取的中立势力**（1 个）：穿书者利用先知信息可以提前拉拢
5. **隐藏势力**（0-1 个）：原著后期才揭露的势力，穿书者提前知道

---

### 常见错误

1. **忽略"在原著中的命运"字段**：这是穿书文势力设计最核心的信息
2. **势力关系过于简单**：只有敌友两种，缺少灰色地带
3. **穿书者对所有势力都有完美信息**：应该有信息盲区（穿书者没读完或记不清的部分）
4. **势力走向完全按原著发展**：穿书者的介入应该改变势力格局
5. **原创势力过多**：削弱穿书文的核心——利用原著信息',
  '## "Faction" Generation — Book-Crossing Novel

Faction design centers on **original power structure × crosser''s foreknowledge × fate trajectory changes**. The crosser knows each faction''s fate in the original — this information advantage makes faction choices and stance negotiations uniquely interesting.

---

### Field Generation Guide

#### Name
Match naming style to original world type. Original factions use source names.

#### Faction Source
Original faction (crosser knows future trajectory and internal secrets) vs. New faction (no prophetic info, may be born from butterfly effects).

#### Original Fate
Core field: describe the faction''s final trajectory in the original novel. The crosser can use this for advantageous choices.

#### Relation with Protagonist
Based on crosser''s identity: affiliated, allied, neutral (can be won over with foreknowledge), hostile, secretly manipulated.

---

### Lineup Suggestion
1. Crosser''s faction (1). 2. Original protagonist''s camp (1). 3. Original villain''s faction (1). 4. Recruitable neutral (1). 5. Hidden faction known only to crosser (0-1).

### Common Errors
1. Ignoring "original fate" field. 2. Oversimplified relationships. 3. Perfect information about all factions (should have blind spots). 4. Factions following original trajectory despite crosser intervention.',
  (SELECT id FROM novel_creation_method WHERE name = '穿书文小说' LIMIT 1),
  1,
  32,
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
