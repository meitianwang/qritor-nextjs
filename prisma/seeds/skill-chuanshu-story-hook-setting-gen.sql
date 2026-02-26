-- 穿书文小说「故事钩子」设定生成技能
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '穿书文小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-chuanshu-story-hook-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'chuanshu-story-hook-setting-gen',
  '「故事钩子」设定生成：为穿书文小说生成故事钩子设定，包括核心冲突、开篇悬念、身份危机、剧情张力和情感钩子',
  '"Story Hook" setting generation: generate story hook settings for book-crossing novels',
  '## 「故事钩子」设定生成 — 穿书文小说

「故事钩子」是整个创作的起点，决定故事的核心吸引力。穿书文的故事钩子必须体现「穿入已知剧情」的核心魅力——知道原著走向却未必能改变命运的博弈。

---

### 字段生成指南

#### 核心冲突

故事的核心矛盾。好的核心冲突公式：**穿书身份 + 已知命运 + 改变欲望 + 阻碍力量**

优秀示例：
- "穿成三天后就要被赐死的炮灰女配，偏偏知道赐死她的人就是男主"
- "穿成恶毒女配，明知书中自己的结局是疯癫而死，却发现自己正在一步步走向原著剧情"
- "穿进一本还没写完的小说里，作者随时可能更新新剧情打乱自己的计划"

避免：
- 没有紧迫感的设定（"穿成主角安稳过日子"）
- 冲突过于简单（"穿进书里打败反派"）

#### 开篇悬念

第一章就要呈现的危机或悬念。穿书文的开篇黄金公式：**穿书即危机**

- 穿越时原著角色正处于生死关头
- 穿越后马上面临原著中的关键剧情节点
- 发现原著的某些设定和自己记忆中不一样

#### 身份危机

穿书者在书中的身份带来的核心危机：
- 炮灰角色的领便当倒计时
- 反派角色不得不做坏事维持人设
- 配角角色被原著主角的"主角光环"压制
- 穿成了一个已经死了的角色（所有人都以为你已经死了）

#### 剧情与现实的张力

已知剧情走向与穿书者改变意愿之间的矛盾：
- 知道某角色注定背叛，但此刻他对你真心相待
- 知道某场灾难即将发生，但阻止它可能导致更大的蝴蝶效应
- 原著主角的机缘本该属于他，但穿书者想截胡

#### 情感钩子

触动读者情感的元素：
- 拯救原著中悲惨结局的心爱角色
- 与原著中注定敌对的人产生真挚感情
- 作为炮灰角色却活出了自己的精彩人生
- 原著中的"恶毒配角"其实是被剧情操控的可怜人',
  '## "Story Hook" Setting Generation — Book-Crossing Novel

The "Story Hook" determines the story''s core appeal. Book-crossing story hooks must embody the charm of "entering a known plot" — the tension between knowing the original story and being unable to fully change fate.

---

### Field Generation Guide

#### Core Conflict
Formula: **Book identity + Known fate + Desire to change + Opposing forces**

Good examples:
- "Crossed into a cannon fodder female supporting character who will be sentenced to death in 3 days"
- "Became the villainous female lead, knowing the original ending is madness and death"

#### Opening Suspense
Golden formula: **Crossing = Immediate Crisis**. The character is in danger at the moment of crossing, or a key plot event is imminent.

#### Identity Crisis
The existential threat from the book character''s identity: cannon fodder countdown, villain forced to act evil, being suppressed by protagonist''s halo.

#### Plot vs. Reality Tension
The contradiction between known plot direction and the crosser''s desire to change things.

#### Emotional Hook
Elements that touch readers emotionally: saving beloved characters from tragic fates, developing real feelings with destined enemies.',
  (SELECT id FROM novel_creation_method WHERE name = '穿书文小说' LIMIT 1),
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
