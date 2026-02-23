-- 历史人物穿越小说「小说命名」技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '历史人物穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-hist-crossing-novel-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'hist-crossing-novel-naming',
  '小说命名：为历史人物穿越小说生成书名和内容简介，提供历史厚重感与穿越爽文卖点兼顾的命名指导',
  '"Novel Naming": Generate titles and synopses for historical figure crossing novels, balancing historical authenticity with transmigration genre appeal',
  '## 小说命名 — 历史人物穿越小说

历史人物穿越小说的书名面临独特挑战：既要传递**历史厚重感**，又要让读者感受到**穿越爽文的核心卖点**（逆天改命、用现代知识碾压古代、一己之力扭转历史走向）。两者缺一不可——纯历史感的书名吸引不了穿越爽文读者，纯爽文感的书名又让历史题材失去了独特质感。

---

### 命名哲学

历史人物穿越小说的书名有三个层次目标：

1. **告知所处朝代/时代** — 朝代是这类小说的核心标签，书名要让读者一眼看出背景（大唐、大明、三国……）
2. **暗示穿越主角的身份** — 穿越到帝王、皇后、权臣还是平民？身份定调了故事的权力上限和玩法
3. **预示核心看点** — 是改写历史？是权谋逆袭？还是儿女情长？书名要给读者一个方向

---

### 常见书名格式

**格式一：朝代 + 核心词**
- 结构：时代标签 + 主题词
- 示例：《大明权臣》《盛唐风流》《汉末枭雄》《宋朝女相》《大唐太子妃》
- 适合：主角深度参与朝代政治的故事

**格式二：穿越对象直白型**
- 结构：我穿成了 / 扮演 / 成为 + 历史人物
- 示例：《我穿成了武则天》《扮演王昭君的日子》《成为贵妃之后》《我是李世民的影子》
- 适合：穿越对象本身就是卖点，读者对该历史人物有认知

**格式三：历史事件 + 主角视角**
- 结构：历史事件/节点 + 主角的介入感
- 示例：《玄武门前的另一种选择》《靖难之变我在场》《安史之乱前夕》
- 适合：以改变重大历史事件为核心卖点的故事

**格式四：典故化/诗意化**
- 结构：历史典故、诗句意象或成语化书名
- 示例：《贞观长歌》《靖难新史》《盛世长安》《锦绣大唐》
- 适合：文学气质较强、节奏较慢、追求历史浸润感的故事

**格式五：身份 + 成就**
- 结构：主角历史身份 + 逆袭/成就
- 示例：《大明第一才女》《宋朝第一女官》《庶出皇子的逆袭》《帝师传奇》
- 适合：以主角从低位成长为主线的故事

---

### 主题词库

| 类别 | 词汇 |
|------|------|
| 朝代/时代 | 大唐、盛唐、大明、大宋、汉末、三国、贞观、永乐、靖难、开元 |
| 政治权力 | 权臣、皇后、丞相、将军、太后、摄政、帝师、储君 |
| 历史事件 | 靖难、玄武门、安史、赤壁、北伐、清君侧、夺门之变 |
| 改写感 | 重演、新史、另辟蹊径、扭转、改写、逆天、重写 |
| 传奇感 | 风华、风云、传奇、长歌、往事、盛世、风流 |

---

### 书名优劣对比

| 好书名 | 差书名 | 原因 |
|--------|--------|------|
| 《我穿成了武则天》 | 《穿越到武周》 | 后者没有告知主角身份，读者不知道是不是武则天视角 |
| 《贞观长歌》 | 《在古代当皇帝》 | 后者无时代感，像通用穿越文 |
| 《大明权臣》 | 《明朝权力系统流》 | 后者网络感破坏历史质感 |
| 《玄武门前的另一种选择》 | 《玄武门穿越记》 | 后者平淡，前者暗示了改写历史的核心矛盾 |
| 《宋朝第一女官》 | 《超强才女穿大宋》 | 后者"超强"一词网络爽文感过重 |

---

### 内容简介结构

**第一段 — 身份锚点（建立背景）**
明确说明：穿越进了哪个历史人物的身上，以及所处的历史时间节点（越具体越好——"贞观三年"比"唐朝"更有代入感）。让读者立刻感受到历史的真实质感。不要说"本书讲述了……"。

**第二段 — 危机与优势（制造冲突与期待）**
两条线并行：
- **历史危机**：该历史人物原本面临的命运危局（被赐死、败于政敌、史书记载的悲剧走向）
- **现代优势**：主角握有的金手指——历史预知、现代知识、前世记忆等
两者对比制造张力，让读者感受到"这次会不同"。

**第三段 — 目标与羁绊（钩子）**
主角要改写什么？阻碍是什么？情感线的钩子？结尾不剧透结局，以疑问或悬念收尾。

**字数**：150-250 字为宜。

---

### 常见错误

- ❌ 书名朝代名用错（如将靖难之役说成南宋，将安史之乱说成北宋）
- ❌ 书名里出现现代词汇（系统、签到、无敌、技能点、签到成圣）
- ❌ 简介只交代历史背景，忘记突出穿越者的现代视角和金手指优势
- ❌ 简介剧透太多关键情节，削弱读者追读好奇心
- ❌ 书名过于文学化导致看不出是穿越文（《春秋大梦》——读者不知道这是穿越小说）
- ❌ 书名对历史事件或人物有明显错误（会让了解历史的读者失去信任感）',
  '## Novel Naming — Historical Figure Crossing Novel

Historical figure crossing novels face a unique challenge: the title must convey both **historical gravitas** and **transmigration genre appeal** (changing fate, leveraging modern knowledge, rewriting history). Neither alone is sufficient.

---

### Naming Philosophy

Three goals for the title:
1. **Signal the historical era** — Dynasty is a core genre tag; readers should know the setting at a glance
2. **Hint at the protagonist''s identity** — Emperor, empress, minister, commoner? Identity sets the power ceiling
3. **Preview the core appeal** — Rewriting history? Court intrigue? Romance?

---

### Common Title Formats

1. **Dynasty + core theme**: "Power Minister of the Great Ming", "Flourishing Tang Era"
2. **Direct transmigration identity**: "I Became Wu Zetian", "Playing the Role of Wang Zhaojun"
3. **Historical event + protagonist perspective**: "Another Choice at Xuanwumen", "Before the An-Shi Rebellion"
4. **Classical/poetic**: "Song of the Zhenguan Era", "New History of Jingnan"
5. **Identity + achievement**: "The First Female Official of the Song Dynasty"

---

### Key Vocabulary

Historical era names, political power terms, historical events, rewriting-history verbs, legendary-feel adjectives.

---

### Synopsis Structure

1. **Identity anchor**: Who the protagonist transmigrated into + specific historical time point
2. **Crisis vs. advantage**: Original tragic fate vs. modern knowledge/cheat ability — their contrast creates tension
3. **Goal and hook**: What history will change? What obstacles remain? End with mystery, no spoilers

**Length**: 150-250 characters recommended.',
  (SELECT id FROM novel_creation_method WHERE name = '历史人物穿越小说' LIMIT 1),
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
