-- 穿书文小说「穿书设定」设定生成技能
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '穿书文小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-chuanshu-crossing-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'chuanshu-crossing-setting-gen',
  '「穿书设定」设定生成：为穿书文小说生成穿书机制设定，包括原著信息、穿越身份、剧情知悉度和核心目标',
  '"Book-Crossing Setting" generation: generate crossing mechanism settings for book-crossing novels',
  '## 「穿书设定」设定生成 — 穿书文小说

「穿书设定」定义穿书的核心机制，决定穿书者的起点条件和行动框架。这是穿书文最独特的设定模块。

---

### 字段生成指南

#### 原著名称

穿越进入的小说名称。三种来源：
- **经典名著**：如《红楼梦》《西游记》《傲慢与偏见》——读者有认知基础，自带代入感
- **网络小说**：虚构的网文（但读者能通过描述理解其类型）——"一本总裁文""一本仙侠文"
- **杜撰作品**：完全原创的书名——给作者最大自由度

#### 原著类型

三个选项的核心区别：
| 类型 | 读者认知 | 设计难度 | 优势 |
|------|---------|---------|------|
| 经典名著 | 读者熟知原著 | 高（需尊重原著） | 天然代入感，不需大量世界观铺垫 |
| 网络小说 | 读者通过类型理解 | 中 | 灵活度高，可利用类型套路制造反讽 |
| 杜撰作品 | 读者无预设认知 | 低（完全自由） | 最大自由度，但需要更多世界观建设 |

#### 原著简介

概述原著故事。好的简介应包含：原著类型、主线矛盾、主要角色关系、结局走向。

#### 穿越方式

选择依据：
- 意外身亡重生书中：最常见，自然过渡
- 睡梦中穿越：适合保留"是否在做梦"的悬念
- 被神秘力量卷入：适合有元叙事需求的故事
- 系统绑定穿书：自带任务和规则，增加冲突来源
- 阅读时意外穿入：最有"穿书"感的方式

#### 穿越身份

最关键的设计选择。不同身份带来完全不同的故事体验：

| 身份 | 故事体验 | 核心冲突 |
|------|---------|---------|
| 原著主角 | 站在舞台中央，享受主角光环 | 如何让"主角人生"不走偏 |
| 重要配角 | 有一定影响力，但不是核心 | 如何利用配角身份搅动风云 |
| 炮灰角色 | 起点最低，逆袭空间最大 | 如何在领便当前改变命运（最受欢迎） |
| 反派 | 知道自己的结局很惨 | 如何在不改变核心性格的前提下避免悲惨结局 |
| 路人甲 | 完全自由但没有影响力 | 如何从零开始在书中世界立足 |
| 原创角色 | 原著中不存在的人 | 如何在不干扰原著主线的同时活出自己的故事 |

#### 剧情知悉度

决定穿书者的信息优势大小，直接影响故事张力：
- 通读全书→信息优势最大但责任也最大
- 只看简介→接近于异世界穿越，先知优势很小
- 建议选择"读了大半"或"只看了开头"，既有先知优势又有信息盲区

#### 穿越时间节点

与穿越身份配合选择：
- 炮灰角色适合选"领便当前不久"，增加紧迫感
- 反派适合选"还没黑化的时候"，给逆转空间
- 主角适合选"故事开端"，完整体验

#### 核心目标

需要与穿越身份和原著类型配合：
- 炮灰最适合"改变自身悲惨命运"
- 配角适合"抱紧主角大腿"或"拯救心爱角色"
- 反派适合"推翻原著结局"
- "做咸鱼躺平度日"是穿书文的独特卖点——但剧情总是不让你躺平

#### 故事基调和感情线

根据已有设定推荐搭配。',
  '## "Book-Crossing Setting" Generation — Book-Crossing Novel

The "Book-Crossing Setting" defines the core crossing mechanism.

---

### Field Generation Guide

#### Original Novel Name
Three sources: classic literature (reader familiarity), web novels (type recognition), fictional works (maximum freedom).

#### Original Novel Type
Classic: high difficulty, natural immersion. Web novel: flexible, genre tropes. Fictional: full freedom, needs more worldbuilding.

#### Crossing Identity
The most critical design choice. Different identities create completely different experiences: protagonist (center stage), supporting character (influence without spotlight), cannon fodder (lowest start, biggest reversal space — most popular), villain (known tragic ending), extra (complete freedom, no influence), original character (doesn''t exist in source).

#### Plot Knowledge Level
Determines information advantage. "Read most of it" or "Only read the beginning" provides both foreknowledge and blind spots.

#### Core Goal
Must match identity and novel type. Cannon fodder → change tragic fate. Villain → overturn original ending. "Living as a salted fish" is a unique book-crossing selling point.',
  (SELECT id FROM novel_creation_method WHERE name = '穿书文小说' LIMIT 1),
  1,
  21,
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
