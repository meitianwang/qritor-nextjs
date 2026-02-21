-- 历史人物穿越小说「穿越设定」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '历史人物穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-hist-crossing-crossing-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'hist-crossing-crossing-setting-gen',
  '「穿越设定」设定生成：为历史人物穿越小说生成穿越机制设定，包括穿越角色、时间节点、穿越方式、穿越者身份和核心目标',
  '"Crossing Setting" setting generation: generate crossing mechanism settings for historical figure crossing novels',
  '## 「穿越设定」设定生成 — 历史人物穿越小说

「穿越设定」定义穿越的核心机制，决定主角的起点条件和行动框架。

---

### 字段生成指南

#### 穿越角色

穿越到哪个历史人物或小说角色身上。应与故事钩子中的穿越目标保持一致。

#### 角色来源

两个选项：历史人物 / 小说角色。根据穿越角色的出处选择。

#### 原著/史书

角色出自哪部史书或小说。
- 历史人物：《史记》《资治通鉴》《三国志》《明史》等
- 小说角色：《三国演义》《红楼梦》《水浒传》《西游记》等

#### 穿越时间节点

穿越到角色人生的哪个时间点。这是关键设计决策：

| 时间策略 | 效果 | 适合风格 |
|---------|------|---------|
| 命运转折前 1-3 年 | 充足准备时间 | 布局型、权谋型 |
| 命运转折前数月 | 紧迫感适中 | 均衡型 |
| 命运转折前数天 | 极度紧迫 | 快节奏爽文 |

原则：太早缺乏紧迫感，太晚缺乏回旋余地。

#### 穿越方式

选项：意外身亡 / 古物触发 / 梦境穿越 / 雷击 / 其他

选择建议：
- 意外身亡：最常见，自然过渡
- 古物触发：适合有考古/历史研究背景的主角
- 梦境穿越：适合保留双重身份的设定

#### 穿越方式详情

补充穿越发生的具体过程，需要与穿越者的现代身份相呼应。

#### 穿越者身份

穿越前的现代身份，直接决定主角可用的知识体系：

| 现代身份 | 可用知识优势 |
|---------|------------|
| 历史教授/学者 | 对历史走向的精确了解 |
| 工程师/科学家 | 科技知识代差优势 |
| 军人/特种兵 | 军事战术和格斗能力 |
| 医生 | 医学知识在古代极其珍贵 |
| 金融/商业 | 经济手段撬动政治格局 |
| 程序员 | 逻辑思维和系统化分析 |

#### 核心目标

选项：逆天改命 / 争霸天下 / 体验人生 / 拯救挚爱 / 其他

选择后需要在「核心目标详情」中具体化，越具体越好。例如"逆天改命"→"避免玄武门之变中被杀，改变李建成被污名化的命运"。

#### 核心目标详情

核心目标的具体化描述。好的目标详情包含：
- 要改变什么具体结局
- 达成目标的大致路径设想
- 可能面临的主要阻碍',
  '## "Crossing Setting" Setting Generation — Historical Figure Crossing Novel

The "Crossing Setting" defines the core crossing mechanism, determining the protagonist''s starting conditions and action framework.

---

### Field Generation Guide

#### Crossing Character
Which historical figure or novel character to transmigrate into. Must be consistent with the crossing target in Story Hook.

#### Character Source
Two options: Historical figure / Novel character.

#### Source Text
Which historical text or novel the character comes from (e.g., Records of the Grand Historian, Romance of the Three Kingdoms, Dream of the Red Chamber).

#### Crossing Time Point
Which point in the character''s life to transmigrate into. Key design decision — too early lacks urgency, too late lacks room to maneuver.

#### Crossing Method
Options: Accidental death / Ancient artifact trigger / Dream crossing / Lightning / Other.

#### Crossing Method Details
Detailed description of how the crossing occurs, should resonate with the transmigrator''s modern identity.

#### Transmigrator Identity
Modern identity before crossing — directly determines available knowledge advantages (historian, engineer, soldier, doctor, etc.).

#### Core Goal
Options: Defy fate / Conquer the world / Experience life / Save loved ones / Other. Must be specified in detail.

#### Core Goal Details
Concrete description of the core goal — what specific ending to change, rough path to achieve it, main obstacles.',
  (SELECT id FROM novel_creation_method WHERE name = '历史人物穿越小说' LIMIT 1),
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
