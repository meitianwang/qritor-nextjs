-- 赛博朋克小说创作 - 小说命名技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-cyberpunk-novel-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'cyberpunk-novel-naming',
  '小说命名：为赛博朋克小说提供书名与简介的领域知识——让命名同时传递技术冷感与人性温度',
  'Novel naming: provide domain knowledge for titling and synopsis writing that conveys both technological coldness and human warmth',
  '## 小说命名 — 赛博朋克小说

赛博朋克书名需要完成一件矛盾的事：**用冷硬的技术感和都市感抓住读者，同时暗示有什么「人的东西」藏在其中**。只有技术感的书名是科幻手册；只有人性温度的书名是普通现代小说。两者的张力，才是赛博朋克。

---

### 一、命名哲学

**核心矛盾**：系统的冷酷 × 个体的温热

书名的理想状态：读者看到书名，同时感受到「这个世界很可怕」和「主角是一个真实的人」。

**赛博朋克书名的禁区**：
- ❌「黑暗未来」「赛博英雄」（类型标签，没有具体感）
- ❌「义体战神」「最强黑客」（网文升级流用语，与赛博朋克主题不符）
- ❌「霓虹之城」「钢铁都市」（视觉标签，空洞）
- ❌ 英文字母混合（「C-YBR」「AI-3000」，风格不一致）

---

### 二、书名结构模式

#### 模式一：企业/产品名称型

用一个企业或产品的名称作为书名，暗示故事的核心对象或威胁：

- 示例方向：「Nexus协议」「银翼猎手」「赤诚医疗」
- 效果：暗示企业和主角的关系，同时建立世界观的冷酷感
- 核心要求：名字要感觉像真实存在的公司或产品，而不是随意组合的词

#### 模式二：技术术语型

用赛博世界的一个概念作为书名，让它承载双重含义：

- 示例方向：「黑冰」（ICE是黑客防火墙，也是「冷」的象征）「义体排异」（医学术语，也是身份认同的隐喻）「赛博精神病」（疾病名，也是核心主题）
- 效果：一个词同时说技术和人性

#### 模式三：直白+转折型

一个普通的动作或状态，加上让它变得不普通的修饰：

- 示例方向：
  - 「仿生人会梦见什么」（普通的「梦」，加上「仿生人」让它成为存在性问题）
  - 「我的记忆不属于我」（个人化的陈述，触及核心主题）
  - 「出租自己的身体」（字面上是义体出租，隐喻是身体自主权的丧失）

#### 模式四：数据/代码型

用看起来像系统日志或代码的格式：

- 示例方向：「档案#77」「删除权限：人类」「系统错误：情感模块」
- 效果：世界观浸入感强，但容易过于形式化；适合风格实验性强的故事

---

### 三、书名词库

**技术相关词**：
义体、神经接口、赛博空间、黑冰、数据流、入侵、防火墙、身份芯片、记忆备份、信号

**城市相关词**：
霓虹、底层、飞地、贫民窟、上城、垂直城市、夜市、废墟区

**人性相关词**：
仿生、人类性、情感模块、有机体、残存、温热、心跳、疼痛

**赛博朋克主题词**：
企业、契约、出租、档案、删除、代价、协议、权限

---

### 四、简介结构

赛博朋克小说简介遵循「世界处境 → 个人切入 → Stakes」的三段结构：

**段一（世界处境，1-2句）**：在什么样的世界里，这个故事发生
- 要有具体的世界特征，不要泛泛说「未来世界」
- 示例：「企业取代政府三十年后，夜城的底层没有法律——只有规则，和更强的人」

**段二（个人切入，2-3句）**：这个主角是谁，他/她面对什么
- 主角的处境要具体（职业+当前危机+关键选择）
- 示例：「前企业特工陈晟接了一个简单的任务：找到一个失踪的人。结果发现，那个人知道的，足以让三家企业的股价归零。」

**段三（Stakes，1句）**：为什么读者应该关心
- 一个具体的悬念，而不是「精彩剧情等你」
- 示例：「当他发现真相时，唯一的问题是：留着这个真相，还是留着自己的命。」

---

### 五、命名禁区总结

- ❌ 只有技术感，没有人性（「量子入侵」「数据战争」）
- ❌ 只有人性，没有赛博感（「夜晚的选择」「霓虹下的爱」）
- ❌ 透露结局（「最终反击」「最后的人类」让结局太明确）
- ❌ 过度使用「赛博」前缀（「赛博冒险」「赛博爱情」——前缀变成标签）
- ❌ 英文/数字混用（除非整体写法高度一致）',
  'Novel Naming — Cyberpunk Fiction

Core tension: technological coldness × human warmth. Book title must simultaneously communicate "this world is terrifying" and "the protagonist is a real person."

**Avoid**: genre labels ("dark future," "cyber hero"); web novel power-fantasy terms; visual tags ("neon city," "steel metropolis"); inconsistent English/number mixing.

**Four title patterns**:
1. Corporate/product name type: the title IS a company or product name (implies the protagonist''s relationship with the system, real-sounding entity names not arbitrary combinations)
2. Technical term type: one cyberpunk concept carrying double meaning ("Black ICE" = hacker firewall and "cold"; "Cyberpsychosis" = disease and core theme)
3. Direct + twist type: a mundane action made strange ("What Do Androids Dream Of" pattern — normal word + cyberpunk subject creates an existential question)
4. Data/code type: formatted like a system log or error message ("FILE#77", "DELETE PERMISSION: HUMAN") — high immersion, risk of being overly formal

**Word banks**: Technical (cyberware, neural interface, cyberspace, black ICE, data stream, intrusion); Urban (neon, sprawl, enclave, slum, upper city, night market); Human (synthetic, humanity, emotion module, organic, remnant, heartbeat); Thematic (corporation, contract, rental, file, deletion, cost, protocol, permission).

**Three-paragraph synopsis structure**:
1. World context (1-2 sentences): specific world characteristic, not vague "future world"
2. Personal entry (2-3 sentences): protagonist''s profession + current crisis + key choice
3. Stakes (1 sentence): one specific hook, not "exciting story awaits"',
  (SELECT id FROM novel_creation_method WHERE name = '赛博朋克小说创作' LIMIT 1),
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
