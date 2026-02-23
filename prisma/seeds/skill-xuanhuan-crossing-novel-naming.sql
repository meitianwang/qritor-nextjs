-- 异世界玄幻穿越小说「小说命名」技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '异世界玄幻穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-xuanhuan-crossing-novel-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xuanhuan-crossing-novel-naming',
  '小说命名：为异世界玄幻穿越小说生成书名和内容简介，提供磅礴大气、传递力量感与宏大世界观的命名指导',
  '"Novel Naming": Generate titles and synopses for xuan huan (Chinese fantasy) transmigration novels, conveying power, grandeur and world-scale stakes',
  '## 小说命名 — 异世界玄幻穿越小说

异世界玄幻穿越小说的书名核心是**力量感与宏大感**。读者追求"爽"——主角从异世界外来者成长为至高存在的过程。书名应让读者一眼感受到：这本书有宏大的世界观、主角会变得极强、有明确的力量层次体系。

玄幻穿越与修真穿越的区别在于：玄幻更外放、磅礴、世界多元（多大陆、多种族、多体系），修真更内敛、讲道法、偏东方仙侠。玄幻书名应体现这种外放的力量美学。

---

### 命名哲学

三个层次：
1. **力量顶点感** — 书名传递"至高""无敌""圣域"等到达天花板的感觉，让读者期待主角的成长终点
2. **世界宏大感** — 暗示世界规模（万界、神域、大陆），让读者感受到宏大的舞台
3. **与众不同的切入点** — 在大量同质化书名中脱颖而出（至尊/无敌已经泛滥，可以考虑反套路或更具体的角度）

---

### 常见书名格式

**格式一：至尊/顶峰型**
- 结构：力量词 + 至尊/圣主/神帝/战神
- 示例：《万界至尊》《天道圣主》《无上龙帝》《魔界战神》《诸天神帝》
- 特点：最直接传递主角最终成就，读者一看就知道这是什么类型
- 注意：此类书名数量极多，需要在"至尊"前加独特的修饰词区分

**格式二：世界/领域型**
- 结构：特定领域/大陆 + 之主/崛起/传说
- 示例：《龙域之主》《神魔大陆》《圣域崛起》《九天大陆传说》
- 适合：以特定世界观为卖点的故事，世界观设计独特

**格式三：体系/身份反差型**
- 结构：出乎意料的身份/角度 + 异世界/玄幻
- 示例：《我在玄幻界当配角》《玄幻界的普通人》《反派的逆袭》《龙族赘婿》
- 适合：反套路玄幻，以反差感吸引读者

**格式四：穿越+成就型**
- 结构：穿越 + 异世界/玄幻 + 成就
- 示例：《穿越玄幻界我无敌》《异界龙族崛起》《穿越成了魔界之主》
- 适合：强调穿越者视角，现代人在异世界的冲击感

**格式五：简短有力型**
- 结构：2-4 字，强意象
- 示例：《龙渊》《天道》《圣域》《魔神》《龙帝》
- 适合：追求简洁有力、不解释的风格，往往配合强烈的内容封面

---

### 主题词库

| 类别 | 词汇 |
|------|------|
| 力量顶点 | 至尊、无敌、圣主、战神、神帝、天道、魔皇、至高 |
| 世界规模 | 万界、神域、天界、圣地、大陆、诸天、九天、异界 |
| 力量体系 | 修炼、魔法、龙族、魔族、神族、灵力、元素、血脉 |
| 成就感 | 崛起、称霸、无双、独尊、传说、不朽、永恒 |
| 反差感 | 赘婿、废柴、弃徒、普通人、配角 |

---

### 书名优劣对比

| 好书名 | 差书名 | 原因 |
|--------|--------|------|
| 《龙域之主》 | 《我在玄幻界修炼》 | 后者无终点感，读者不知道主角的成就上限 |
| 《玄幻界的普通人》 | 《超强玄幻主角》 | 后者无个性，前者有反套路新意 |
| 《万界至尊》 | 《至尊》 | 后者过于简短且在大量书名中难以区分 |
| 《反派的逆袭》 | 《玄幻小说》 | 后者完全无信息量 |
| 《圣域崛起》 | 《修炼到最强》 | 后者平淡，前者有宏大感 |

---

### 内容简介结构

**第一段 — 力量展示（核心卖点）**
直接展示主角的战斗力、金手指或特殊血脉/能力，不要拖泥带水。玄幻读者最期待的是"强"——第一段就要让读者知道主角有多大的潜力或初始优势。可以用一个战斗场景或技能亮相。

**第二段 — 世界背景（简明扼要）**
所在世界的力量体系简介（修炼/魔法/血脉等），主角的初始地位（废柴/外来者/刚到异界），以及主要矛盾（天才被欺压、孤身异世界、有人要他死）。篇幅不宜过长，玄幻读者不喜欢大段背景说明。

**第三段 — 成长方向（期待感）**
主角要往哪里走？最终成就的暗示（成为什么强者），以及情感线或竞争者的钩子。结尾留悬念。

**字数**：120-220 字为宜（玄幻读者偏好节奏快的简介）。

---

### 常见错误

- ❌ 书名和同类书高度雷同（"至尊""无敌"泛滥，需要加独特修饰词）
- ❌ 简介全是背景介绍，忘记展示主角的特殊性
- ❌ 简介中力量体系介绍过于冗长（读者期待简洁，细节在正文）
- ❌ 书名无力量感（《玄幻少年》《异界旅行》等过于平淡）
- ❌ 简介没有冲突感（平铺直叙，无对手、无危机）',
  '## Novel Naming — Xuan Huan (Chinese Fantasy) Transmigration Novel

Core: **power + grandeur**. Readers want to see a protagonist''s rise to ultimate power in a vast fantasy world. Titles must convey that the protagonist will become supremely powerful and the world is epic in scale.

---

### Naming Philosophy

Three layers:
1. **Peak power sense** — "Supreme", "Unrivaled", "Saint Lord" signal the protagonist''s ceiling
2. **World grandeur** — "Ten Thousand Realms", "Divine Domain" signal epic scale
3. **Distinctiveness** — With so many identical titles ("Supreme Lord"), add unique qualifiers or use the subversion format

---

### Common Title Formats

1. **Peak/supreme type**: "Lord of Ten Thousand Realms", "Unrivaled Dragon Emperor"
2. **World/domain type**: "Master of Dragon Domain", "Sacred Realm Rising"
3. **Subversion/contrast type**: "The Ordinary Man in a Xuan Huan World", "The Villain''s Comeback"
4. **Transmigration + achievement**: "I Became the Demon Lord After Transmigrating"
5. **Short powerful**: "Dragon Abyss", "Sacred Realm", "Demon God" (2-4 characters)

---

### Key Vocabulary

Power pinnacle (Supreme, Unrivaled, Saint Lord, God Emperor), world scale (Ten Thousand Realms, Divine Domain, Continent), power systems (cultivation, magic, dragon bloodline)

---

### Synopsis Structure

1. **Power showcase**: Direct demonstration of cheat ability / special bloodline / initial power level
2. **World + position**: Brief power system intro + protagonist''s starting position + main conflict
3. **Direction + hook**: Where the protagonist is heading, rivalry or romance hook, end with mystery

**Length**: 120-220 characters (xuan huan readers prefer fast-paced synopses)',
  (SELECT id FROM novel_creation_method WHERE name = '异世界玄幻穿越小说' LIMIT 1),
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
