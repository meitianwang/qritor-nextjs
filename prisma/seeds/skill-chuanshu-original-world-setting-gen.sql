-- 穿书文小说「原著世界」设定生成技能
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '穿书文小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-chuanshu-original-world-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'chuanshu-original-world-setting-gen',
  '「原著世界」设定生成：为穿书文小说生成原著世界观设定，包括世界类型、核心规则、社会结构和时代背景',
  '"Original World" setting generation: generate original novel world settings for book-crossing novels',
  '## 「原著世界」设定生成 — 穿书文小说

「原著世界」构建穿书者所进入的小说世界，是所有后续设定的根基。穿书文的世界观设计有一个核心特点：这是一个**被"写"出来的世界**，可能存在"小说逻辑"（如主角光环、剧情推动力等）。

---

### 字段生成指南

#### 世界类型

选择原著小说的世界类型。穿书文涵盖所有类型的小说世界：

| 世界类型 | 典型元素 | 穿书者的适应难点 |
|---------|---------|---------------|
| 古代宫廷 | 后宫争斗、皇权博弈 | 礼仪规矩、等级森严 |
| 古代江湖 | 武功秘籍、恩怨情仇 | 武力不足、江湖规矩 |
| 仙侠修真 | 灵气修炼、飞升渡劫 | 没有灵根/修为、功法选择 |
| 玄幻异世 | 魔法、种族、等级 | 完全陌生的力量体系 |
| 现代都市 | 豪门恩怨、商战职场 | 人际关系复杂、身份伪装 |
| 现代校园 | 青春恋爱、校园生活 | 融入年龄层、学业压力 |
| 末世废土 | 丧尸/灾变、物资匮乏 | 生存危机、人性考验 |
| 西方奇幻 | 魔法学院、龙与地下城 | 种族偏见、语言障碍 |
| 科幻未来 | 星际旅行、人工智能 | 科技代差（反向） |
| 历史架空 | 真实历史基础上虚构 | 同历史穿越，需考据 |

#### 核心规则

**关键**：穿书文的世界可能存在"小说规则"：
- **主角光环**：原著主角是否有命运加持？穿书者需要绕开还是利用？
- **剧情推动力**：世界是否有一种力量在推动剧情按原著走向发展？
- **力量体系**：仙侠有灵气、玄幻有魔力、武侠有内力——穿书者如何获得？

#### 社会结构

描述原著世界的权力结构和社会阶层。穿书者的社会位置直接影响行动自由度。

#### 时代背景

原著故事发生的时代背景。如果是架空世界，描述其文明发展阶段。

#### 重要地标

列出原著中的关键场所。穿书者可以利用原著知识提前到达重要地点。

#### 世界观补充

其他独特的世界观规则。特别是穿书文独有的元素：
- 书中世界是否有"意识"？是否会排斥穿书者？
- 原著中是否还有其他穿书者？
- 书中世界与现实世界是否有联系？',
  '## "Original World" Setting Generation — Book-Crossing Novel

The "Original World" builds the novel world the crosser enters. A key feature of book-crossing worldbuilding: this is a world that was "written" — it may have "novel logic" (protagonist halo, plot-driving forces).

---

### Field Generation Guide

#### World Type
Covers all novel world types. Each has unique adaptation challenges for the crosser.

#### Core Rules
Key: Book-crossing worlds may have "novel rules" — protagonist halo (does the original MC have fate protection?), plot-driving force (does the world push events toward the original plot?), power system (how does the crosser access it?).

#### Social Structure
The crosser''s social position directly affects freedom of action.

#### Important Landmarks
The crosser can leverage original knowledge to arrive at key locations early.

#### World Supplement
Unique book-crossing elements: Does the book world have "consciousness"? Are there other crossers? Is the book world connected to reality?',
  (SELECT id FROM novel_creation_method WHERE name = '穿书文小说' LIMIT 1),
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
