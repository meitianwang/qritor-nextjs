-- 古代架空穿越小说「小说命名」技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '古代架空穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-ancient-crossing-novel-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ancient-crossing-novel-naming',
  '小说命名：为古代架空穿越小说生成书名和内容简介，提供古风权谋美学与逆袭爽感兼顾的命名指导',
  '"Novel Naming": Generate titles and synopses for ancient Chinese alternate-history transmigration novels, balancing classical aesthetics with satisfying underdog-appeal',
  '## 小说命名 — 古代架空穿越小说

古代架空穿越小说的书名核心是**古风美感 + 逆袭预期**。与历史人物穿越不同，这类小说的世界完全架空，不受真实历史约束，书名可以更自由地塑造意象，但仍需传递古代皇权社会的质感。读者看到书名应能感受到"权谋""逆袭""宫廷""江湖"等核心元素中的至少一个。

---

### 命名哲学

三个层次：
1. **古风质感** — 书名读起来要像古诗或成语，不能有现代词汇的违和感
2. **权力感或情感感** — 明确传递故事是关于权谋争斗，还是情感纠葛，或者两者皆有
3. **主角的特殊性** — 暗示主角有金手指、逆天能力或特殊身份，而非普通穿越者

---

### 常见书名格式

**格式一：四字古风对称型**
- 结构：两组意象词对仗（AABB 或 ABAB）
- 示例：《凤鸣长安》《权倾天下》《锦绣河山》《帝王心术》《江山如画》
- 适合：宏大叙事，主角深度参与政治的故事

**格式二：《X之X》型**
- 结构：名词 + 之 + 名词/形容词，强调归属感或宿命感
- 示例：《乱世之主》《帝国之心》《江山之谋》《凤凰之路》《宫廷之刃》
- 适合：有明确目标的主角故事，目标感强

**格式三：人物中心型（带成长感）**
- 结构：身份/称谓 + 行为/成就（常带"记"字）
- 示例：《女帝养成记》《太子妃升职记》《庶女逆袭》《摄政王妃》《侯门嫡女》
- 适合：以人物成长为主线，从低位逆袭的故事

**格式四：意象化短题**
- 结构：2-4 字，强意象，留余韵
- 示例：《凤啸》《帝王业》《化蝶成凰》《龙腾四海》《凤惊九天》
- 适合：追求文学气质的读者群，故事节奏较慢

**格式五：地名/宫廷 + 核心词**
- 结构：架空地名/宫廷地点 + 主题词
- 示例：《长安第一美人》《金陵旧梦》《朝堂风云》《宫廷秘史》
- 适合：以特定地点为核心舞台的故事

---

### 主题词库

| 类别 | 词汇 |
|------|------|
| 权势类 | 帝、皇、权、江山、天下、社稷、朝堂、庙堂 |
| 意象类 | 凤、龙、麟、玉、金、锦、绣、朱、碧 |
| 架空地名感 | 长安、金陵、宫闱、帝都、边关、江湖（不指真实地名） |
| 动词类 | 倾、鸣、腾、化、破、驭、定、谋、执 |
| 情感/命运类 | 倾城、倾国、绝代、无双、宿命、孽缘 |

---

### 书名优劣对比

| 好书名 | 差书名 | 原因 |
|--------|--------|------|
| 《凤鸣长安》 | 《穿越古代当皇后》 | 后者太直白，无美感 |
| 《女帝养成记》 | 《古代修炼系统流》 | 后者类型混乱，不像古代文 |
| 《乱世之主》 | 《我是古代第一人》 | 后者网络感过重 |
| 《锦绣河山》 | 《超强皇妃》 | 后者"超强"词汇现代感强 |
| 《化蝶成凰》 | 《变强记》 | 后者无古风感 |

---

### 内容简介结构

**第一段 — 金手指亮相（钩子）**
用一个具体场景或能力展示主角的特殊优势（穿越前的知识、特殊技能、身体记忆等），不拖泥带水，让读者立刻感受到"这个主角不一样"。避免用"主角叫XXX，她穿越到了XXX"这种流水账开头。

**第二段 — 处境与冲突（反差）**
主角当前的身份和困境（出身低微、险境危机、被轻视或陷害），与第一段的能力形成反差，产生"有能力但处境艰难"的张力，让读者期待主角如何逆袭。

**第三段 — 方向与羁绊（方向感）**
逆袭的大方向（权势、自由、复仇）+ 情感线的钩子（男主登场或情感冲突暗示）。结尾一句话留悬念，不剧透结局。

**字数**：150-250 字为宜。

---

### 常见错误

- ❌ 书名中出现现代词汇（系统、签到、无敌、爽、技能点）
- ❌ 日式汉字名混入书名（心海、羽生、月詠）
- ❌ 四字书名两组词风格不搭（前两字古风、后两字网络感）
- ❌ 简介开头"主角XXX穿越到了..."的流水账模式
- ❌ 简介中出现太多角色名（读者第一次接触，记不住）
- ❌ 简介剧透关键转折，削弱追读欲望',
  '## Novel Naming — Ancient Chinese Alternate-History Transmigration

Titles must combine **classical Chinese aesthetics** with **underdog-appeal** (the protagonist''s special advantage and rise from adversity). Unlike historical crossing novels, the setting is entirely fictional, allowing more creative freedom in imagery.

---

### Naming Philosophy

Three layers:
1. **Classical feel** — Reads like ancient poetry or a chengyu, no modern vocabulary
2. **Power or emotion** — Conveys court intrigue, romance, or both
3. **Protagonist''s uniqueness** — Hints at a cheat ability, special identity, or unique advantage

---

### Common Title Formats

1. **Four-character classical paired imagery**: "Phoenix Sings in Chang''an", "Power Rules the Realm"
2. **"X of X" structure**: "Master of a Chaotic Age", "Heart of the Empire"
3. **Character-centric with growth**: "The Female Emperor''s Rise", "The Side Consort''s Ascension"
4. **Short evocative title**: "Phoenix Roar", "Imperial Ambition"
5. **Location + core theme**: "Intrigue in the Imperial City"

---

### Key Vocabulary

Power terms (emperor, realm, court), imagery (phoenix, dragon, jade, gold), action verbs (rule, dominate, transform), emotional (peerless, fated)

---

### Synopsis Structure

1. **Cheat ability showcase** (hook): specific scene showing protagonist''s special advantage
2. **Current situation and conflict** (contrast): low status / danger creating tension
3. **Direction and romance hook** (direction): goal hint + love interest setup, end with mystery',
  (SELECT id FROM novel_creation_method WHERE name = '古代架空穿越小说' LIMIT 1),
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
