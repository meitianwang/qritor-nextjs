-- 穿书文小说「场景」生成技能
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '穿书文小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-chuanshu-scene-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'chuanshu-scene-gen',
  '「场景」生成：为穿书文小说生成场景，涵盖原著关键场所和原创场景，强调穿书者的先知优势在场景中的利用',
  '"Scene" generation: generate scenes for book-crossing novels, covering original key locations and new scenes',
  '## 「场景」生成 — 穿书文小说

穿书文的场景设计核心是**原著场景重现 × 穿书者先知视角 × 隐藏信息利用**。穿书者进入的是一个"已知的故事"，场景承载着已经发生或即将发生的原著剧情。

---

### 字段生成指南

#### 场景名称

根据原著世界类型确定命名风格：
- 古代宫廷："御花园""太和殿""坤宁宫"
- 仙侠世界："落霞峰""碧水潭""天机阁"
- 现代都市："云顶大厦""星辰咖啡馆""学校天台"
- 末世废土："六号避难所""废墟商场""变异森林"

原著场景使用原著中的名称；原创场景命名要与世界风格一致。

#### 场景来源

| 来源 | 设计要点 | 穿书者优势 |
|------|---------|----------|
| **原著场景** | 忠于原著描述 | 穿书者知道这里会发生什么 |
| **原创场景** | 符合世界观 | 穿书者没有关于此场景的先知信息 |

#### 场景类型

七个选项的叙事功能：
- **居所**：角色的私人空间，适合密谈和日常
- **公共场所**：社交和信息收集
- **秘境/禁地**：冒险和机缘获取
- **战斗场地**：冲突和高潮场景
- **社交场合**：宴会、聚会等多角色互动
- **自然环境**：氛围营造和转场
- **其他**：不在以上分类的特殊场景

#### 环境描述

匹配原著世界的类型进行描写。穿书者可能从现代视角评价环境：
- 古代宫殿："比故宫还气派……等等，这可能就是故宫的原型"
- 仙侠门派："看着像武侠电影的片场，但这些飞来飞去的人是真的"

#### 在原著中的重要性

该场景在原著剧情中扮演的角色（原著场景填写）：
- 关键剧情发生地："原著第23章男女主在此定情"
- 机缘所在地："原著中描述此处有一枚关键道具"
- 危险场所："原著中这里发生过一场大战"

#### 关联事件

即将在此场景发生的关键事件：
- 穿书者可以提前布局的事件
- 穿书者需要规避的危险事件
- 原著主角的重要机缘节点

#### 隐藏信息

穿书者凭原著知识知道的场景秘密：
- 密室、暗道、隐藏道具的位置
- 只在特定条件下出现的机关
- 其他角色不知道的场景背景故事
- 这是穿书文场景设计最有趣的字段——穿书者的信息优势

---

### 场景阵容建议

1. **剧情关键场景**（2-3 个）：原著中重要剧情的发生地
2. **穿书者据点**（1 个）：穿书者的主要活动空间
3. **机缘场景**（1-2 个）：原著中有宝物/机缘的场所
4. **危险场景**（1 个）：穿书者需要规避的危险地点
5. **日常场景**（1 个）：展现穿书者日常生活的空间

---

### 常见错误

1. **忽略先知信息**：没有利用穿书者的场景知识
2. **原著场景描述与原著矛盾**：穿书者记忆中的场景与实际不符应该是故意设计的（蝴蝶效应线索），而非写作疏忽
3. **场景功能重叠**：多个场景承载相同的叙事功能
4. **隐藏信息过于轻易获取**：降低了穿书者利用先知信息的挑战感',
  '## "Scene" Generation — Book-Crossing Novel

Scene design centers on **original scene recreation × crosser''s prophetic perspective × hidden information exploitation**. The crosser enters a "known story" where scenes carry established or upcoming plot events.

---

### Field Generation Guide

#### Scene Name
Match the original world type for naming style. Original scenes use source names; new scenes match world conventions.

#### Scene Source
Original scene (stay faithful, crosser knows what happens here) vs. New scene (fits world rules, crosser has no foreknowledge here).

#### Importance in Original
What role this scene plays in the original plot: key romance location, treasure site, battle ground, etc.

#### Hidden Information
Secrets the crosser knows from the original: hidden rooms, concealed items, special mechanisms, background stories others don''t know. This is the most interesting field — the crosser''s information advantage.

---

### Scene Lineup
1. Key plot scenes (2-3). 2. Crosser''s base (1). 3. Opportunity scenes (1-2). 4. Danger scenes (1). 5. Daily life scene (1).

### Common Errors
1. Ignoring prophetic scene knowledge. 2. Scene descriptions contradicting source (unless intentional butterfly effect). 3. Overlapping scene functions. 4. Hidden information too easily accessible.',
  (SELECT id FROM novel_creation_method WHERE name = '穿书文小说' LIMIT 1),
  1,
  31,
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
