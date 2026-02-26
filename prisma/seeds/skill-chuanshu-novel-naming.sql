-- 穿书文小说命名
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '穿书文小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-chuanshu-novel-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'chuanshu-novel-naming',
  '小说命名：为穿书文小说生成书名和内容简介，提供穿书文类型特色与读者期待兼顾的命名指导',
  '"Novel Naming": Generate titles and synopses for book-crossing novels, balancing genre appeal with reader expectations',
  '## 小说命名 — 穿书文小说

穿书文的书名面临独特挑战：既要让读者一眼看出这是"穿书文"，又要传递穿书者的身份和核心看点。

---

### 常见书名格式

**格式一：穿成了XX**
- 结构：穿成了 + 原著角色身份
- 示例：《穿成恶毒女配后》《穿成反派他妈》《穿成炮灰后我躺平了》《穿成主角的白月光》
- 适合：身份本身就是卖点的穿书文

**格式二：在XX文里XX**
- 结构：在 + 原著类型 + 做某事
- 示例：《在总裁文里当咸鱼》《在修仙文里卖烧烤》《在虐文里努力活命》《在甜宠文里演反派》
- 适合：穿书者身份与原著类型形成反差的穿书文

**格式三：原著书名改编型**
- 结构：基于原著名称的变体
- 示例：《红楼梦中人》《西游记之我不想取经》《重生之霸总是我前夫》
- 适合：穿入知名作品的穿书文

**格式四：身份+命运逆转**
- 结构：身份 + 逆转暗示
- 示例：《炮灰女配逆袭指南》《反派今天也在洗白》《配角的正确打开方式》
- 适合：以逆袭改命为核心卖点的穿书文

**格式五：吐槽/meta风格**
- 结构：带有自我意识的吐槽式书名
- 示例：《这剧情不对啊》《作者你出来我保证不打你》《我读的明明不是这个版本》
- 适合：幽默吐槽型穿书文

---

### 书名优劣对比

| 好书名 | 差书名 | 原因 |
|--------|--------|------|
| 《穿成恶毒女配后》 | 《穿越到一本小说里》 | 后者没有具体身份，缺乏辨识度 |
| 《在总裁文里当咸鱼》 | 《我穿书了》 | 后者信息量太少 |
| 《炮灰女配逆袭指南》 | 《穿越后变强》 | 后者没有穿书感，像普通穿越文 |
| 《这剧情不对啊》 | 《穿越者的冒险》 | 后者太泛，前者自带穿书文的吐槽特色 |

---

### 内容简介结构

**第一段 — 穿书锚点（建立设定）**
明确说明：穿进了什么类型的书、穿成了谁、这个角色在原著中的命运。让读者立刻代入。

**第二段 — 危机与先知（制造冲突与期待）**
两条线并行：
- 原著命运：该角色在原著中的悲惨/尴尬结局
- 先知优势：穿书者掌握的原著信息和金手指
两者对比制造"这次会不同"的期待。

**第三段 — 目标与钩子（收尾悬念）**
穿书者的核心目标+最大阻碍+一个让读者好奇的疑问收尾。

**字数**：150-250字。

---

### 常见错误

- 书名看不出是穿书文（缺少"穿""书""原著"等关键词暗示）
- 简介没有交代原著的类型和穿书者的身份
- 简介只写了穿越设定，没有展示核心冲突
- 书名风格与故事基调不匹配（搞笑书名配虐心故事）',
  '## Novel Naming — Book-Crossing Novel

Book-crossing titles must clearly signal the "book-crossing" genre while conveying the crosser''s identity and core appeal.

---

### Common Title Formats
1. "Became XX": Became the Villainous Supporting Character, Became the Cannon Fodder
2. "In a XX Novel": Being a Salted Fish in a CEO Novel, Selling BBQ in a Cultivation Novel
3. Source title adaptation: Dream of the Red Chamber Insider, Journey to the West: I Don''t Want to Go West
4. Identity + fate reversal: Cannon Fodder''s Reversal Guide, The Villain''s Daily Whitewashing
5. Meta/comedy style: This Plot Is Wrong, Author Come Out I Promise I Won''t Hit You

### Synopsis Structure
1. Book-crossing anchor: what type of book, who you became, their original fate
2. Crisis vs. foreknowledge: original tragic ending vs. crosser''s information advantage
3. Goal and hook: core objective + biggest obstacle + curiosity-inducing question

### Common Errors
- Title doesn''t signal book-crossing genre
- Synopsis missing original novel type and crosser identity
- No core conflict shown in synopsis',
  (SELECT id FROM novel_creation_method WHERE name = '穿书文小说' LIMIT 1),
  1,
  50,
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
