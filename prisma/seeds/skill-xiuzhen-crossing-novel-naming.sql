-- 异世界修真穿越小说「小说命名」技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '异世界修真穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-xiuzhen-crossing-novel-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xiuzhen-crossing-novel-naming',
  '小说命名：为异世界修真穿越小说生成书名和内容简介，提供道家意境与修仙路途感兼顾的命名指导',
  '"Novel Naming": Generate titles and synopses for xiu zhen (cultivation) transmigration novels, balancing Daoist aesthetics with the protagonist''s cultivation journey',
  '## 小说命名 — 异世界修真穿越小说

异世界修真穿越小说与玄幻的核心区别在于**道意境**。修真小说的美学是内敛的磅礴——不是"至尊"的外放宣言，而是"仙途""长生道"这种有深度感的叙述。书名应传递：有明确的修炼体系（境界感）、主角的成道历程、以及东方仙侠特有的出尘气质。

读者除了追求"强"，还追求修真小说特有的"意境"——飞剑御风、白衣胜雪、仙途漫漫的画面感。

---

### 命名哲学

三个层次：
1. **修道历程感** — 书名要传递主角在修仙路上的感觉（成仙、飞升、长生道、仙途）
2. **东方道家意境** — 区别于玄幻的外放，修真书名讲究含蓄和意境（一剑破苍穹 vs 万界至尊）
3. **体系感** — 暗示有完整的修炼体系（境界、剑道、道法）

---

### 常见书名格式

**格式一：道路/境界型**
- 结构：修炼体系的终点/过程 + 道/途/路
- 示例：《长生道》《仙途无悔》《成仙之路》《飞升记》《渡劫成仙》
- 适合：以修炼成长为主线，修炼历程本身就是故事卖点

**格式二：剑仙/武道型**
- 结构：剑道/武道相关 + 强者称谓
- 示例：《剑道独尊》《万古剑圣》《御剑飞仙》《一剑破苍穹》《剑仙传》
- 适合：主角走剑道，以剑为核心卖点的故事

**格式三：境界突破型**
- 结构：具体境界/阶段 + 起点
- 示例：《从练气期开始无敌》《渡劫期的逆袭》《筑基期的穿越者》《元婴期开始》
- 适合：以特定境界为切入点，有明确成长节奏感的故事

**格式四：意境短题型**
- 结构：2-5 字，有道家意境，含蓄有余韵
- 示例：《青云志》《仙路烽烟》《凌霄》《问道》《苍穹之上》
- 适合：追求文学气质的修真故事

**格式五：穿越+修真型**
- 结构：穿越 + 修真世界 + 成就/优势
- 示例：《穿越修真界我有系统》《带着地球穿修真界》《修真界的科技宅》
- 适合：强调穿越者视角，现代知识在修真界的冲击感

---

### 主题词库

| 类别 | 词汇 |
|------|------|
| 境界类 | 练气、筑基、金丹、元婴、化神、渡劫、飞仙、大乘 |
| 意境类 | 仙、道、剑、云、凌霄、青云、紫霄、苍穹、碧落 |
| 成就类 | 长生、成仙、飞升、无双、绝世、万古、不朽、永恒 |
| 道法类 | 御剑、法宝、道法、神通、天劫、渡劫 |
| 路途感 | 途、道、路、记、传、志 |

---

### 书名优劣对比

| 好书名 | 差书名 | 原因 |
|--------|--------|------|
| 《长生道》 | 《修真至尊》 | 后者缺少修真的意境感，像玄幻书名 |
| 《剑道独尊》 | 《修炼最强》 | 后者平淡无法传递剑仙气质 |
| 《从练气期开始无敌》 | 《修真无敌》 | 后者太泛，前者有具体的境界感和卖点 |
| 《御剑飞仙》 | 《修仙者》 | 后者无意象感，前者有画面感 |
| 《青云志》 | 《修真日记》 | 后者完全无气质感 |

---

### 内容简介结构

**第一段 — 穿越背景与修炼起点**
主角如何来到修真界（或前世/今生的修炼经历），以及初始的体质/根骨/金手指。修真读者特别关注"根骨"和"悟性"——简介里要有这方面的信息，让读者知道主角的修炼天赋。

**第二段 — 修炼体系简介与处境**
该修真世界的境界体系简介（一两句带过），主角目前的境界和所处困境（强大的追杀者、宗门的歧视、前路的天劫等）。修真读者会期待知道成仙路上的主要障碍。

**第三段 — 道与情（深度感）**
主角修炼的"道"是什么（剑道、长生道、杀道……），以及情感羁绊或知己/仇敌的钩子。修真小说比玄幻更重视主角的道心感悟，简介里要有一点这种气质。结尾留悬念。

**字数**：150-250 字为宜。

---

### 常见错误

- ❌ 书名完全照搬玄幻风格（"至尊""战神"出现在修真书名中，气质不符）
- ❌ 简介只写战力成长，没有道意境（纯爽文感，失去修真独特质感）
- ❌ 境界名称自造且无规律（读者难以代入体系感）
- ❌ 书名有意境但完全看不出是修真小说（新读者找不到）
- ❌ 简介里境界名太多太密（读者第一次看，记不住七八个境界）',
  '## Novel Naming — Xiu Zhen (Cultivation) Transmigration Novel

Key distinction from xuan huan: **Daoist aesthetic and introspective grandeur**. Cultivation novels value subtle depth — not "Supreme Lord" proclamations, but "Path of Immortality" journeys. Titles should convey: cultivation system with clear stages, protagonist''s path toward immortality, and Eastern xianxia''s transcendent quality.

---

### Naming Philosophy

Three layers:
1. **Cultivation journey feel** — Title conveys the protagonist''s path (becoming immortal, ascending, long life path)
2. **Daoist aesthetics** — Restrained yet powerful, unlike xuan huan''s external proclamations
3. **System sense** — Hints at a complete cultivation hierarchy (stages, sword path, Dao techniques)

---

### Common Title Formats

1. **Path/stage type**: "Path of Immortality", "No Regrets on the Celestial Road", "Journey to Ascension"
2. **Sword immortal type**: "Sword Dao Unrivaled", "Ten-Thousand-Year Sword Saint", "Flying Sword to Immortality"
3. **Stage starting point**: "Invincible from the Qi Condensation Stage", "Nascent Soul Stage Comeback"
4. **Atmospheric short title**: "Blue Cloud Will", "Above the Vault of Heaven", "Asking the Dao"
5. **Transmigration + cultivation**: "The Modern Physicist in a Cultivation World"

---

### Key Vocabulary

Stages (Qi Condensation, Foundation Building, Golden Core, Nascent Soul, Divine Transformation, Tribulation), imagery (immortal, Dao, sword, clouds, azure, purple cloud), achievements (eternal life, ascension, timeless), techniques (sword control, spirit treasures, divine tribulation)

---

### Synopsis Structure

1. **Transmigration + starting point**: How protagonist arrived + spiritual roots/talent revelation
2. **Cultivation system + situation**: Brief stage system intro + current stage + main obstacles
3. **Dao and bonds**: What path the protagonist walks + emotional hook or rival — must convey some spiritual depth

**Length**: 150-250 characters',
  (SELECT id FROM novel_creation_method WHERE name = '异世界修真穿越小说' LIMIT 1),
  1,
  35,
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
