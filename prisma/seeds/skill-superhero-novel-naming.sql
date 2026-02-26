-- Superhero / Cape Fiction Novel「书名与大纲 Novel Naming」生成技能
-- 执行方式: mysql -u <user> -p <database> < skill-superhero-novel-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'superhero-novel-naming',
  '层级3(Domain Knowledge) - 「书名与大纲生成」：指导生成美式LitRPG、韩漫风或黑袍纠察队风格的小说标题，并构建三段式起伏大纲',
  'Layer 3 (Domain Knowledge) - "Novel Naming & Synopsis": Guide to generate US LitRPG, Korean Webtoon, or The Boys style titles and structure a 3-act webnovel synopsis for Superhero fiction',
  '## 书名与大纲生成指南 — 超能英雄/反传统英雄

在网文市场，超能题材（尤其是带系统的）书名必须**极端清晰地展示主角的“金手指/系统”以及核心的“打脸爽点”**。大纲则必须是一份承诺了不断反转与升级的契约。

### 1. Title Generation (书名命名偏好)

英语网文平台最受欢迎的命名法有两种：

#### A. The "System / LitRPG" Formula (系统/韩漫超长风)
完全直白地暴露主角最离谱的外挂与装逼路线。
- 格式：`[The Unique Circumstance] I [Do Something Absurd] With a [Specific Cheat]`
- 示例：
  - *The S-Class Heroes Think I''m Trash, So I Stole Their System*
  - *My Level 1 Villain Interface is Breaking the Superhuman World*
  - *I Maxed Out My Evasion Stat and Now the Top Guild Can''t Hit Me*

#### B. The "Gritty Vigilante / Deconstruction" Name (暗黑义警/极简霸气风)
偏向实体书或《黑袍纠察队》那种充满压迫感、讽刺感的美剧风格。
- 格式：直接使用一个令人敬畏的名词、称号、或者是对于英雄概念的亵渎。
- 示例：
  - *Gods Without Capes*
  - *Shattering the Halo*
  - *The Outcast''s Protocol*
  - *Zero Point System*

**生成要求**：请自动提供 3 个 [长句式的系统流标题] 和 2 个 [极简压迫感的暗黑式标题] 供选择。

### 2. Synopsis Generation (三段式大纲结构)

简介必须极具煽动性，核心任务是向读者展示**网文级的情绪反差**（从憋屈到极度爽快）。

- **第一段：世界观的不公与绝望开局 (The Hook)**
  > In a world where 99% of humanity worships corporate superheroes, possessing a power labeled "F-Tier" makes you less than garbage. [Protagonist Name] learned this the hard way when the nation''s beloved #1 Hero left his sister in the rubble just for a photo op. 
  （交代主角的悲惨遭遇和这个虚伪世界的本质）。

- **第二段：外挂降临，反转开始 (The Cheat/Turn)**
  > With nothing to lose and his life bleeding out on the asphalt, a cold mechanical voice echoed in his mind:
  > **[Ding!]**
  > **[Vengeance System initialized. Scanning targets... Subject: "National Hero" acquired. Extracting abilities...]**
  （用显眼的系统提示符、粗体字引出金手指，让读者确信主角即将翻盘）。

- **第三段：狂妄的终极目标与承诺爽点 (The Payoff/Climax)**
  > Now, armed with the ability to copy and upgrade the powers of those who sin, [Protagonist Name] is hunting them down one by one. To the public, they are untouchable gods. To him, they are just walking EXP points. Let the world burn, he''s going to tear the heavens down.
  （极其狂妄霸道的结尾宣言，承诺读者后续绝对是无情的一路砍杀和虐爆伪善者）。',
  '## Title & Synopsis Generation Guide — Superhero / Cape Fiction

In the Webnovel market, superhero titles (especially those with systems) MUST **extremely clearly showcase the protagonist''s "cheat" and the core "face-slapping payoff."** The synopsis must serve as a contract promising constant twists and leveling up.

### 1. Title Generation Preferences

There are two primary popular naming conventions on English Webnovel platforms:

#### A. The "System / LitRPG" Formula (Korean Webtoon/Long-form Style)
Bluntly exposes the protagonist''s most absurd cheat and their path to dominance.
- **Format**: `[The Unique Circumstance] I [Do Something Absurd] With a [Specific Cheat]`
- **Examples**:
  - *The S-Class Heroes Think I''m Trash, So I Stole Their System*
  - *My Level 1 Villain Interface is Breaking the Superhuman World*
  - *I Maxed Out My Evasion Stat and Now the Top Guild Can''t Hit Me*

#### B. The "Gritty Vigilante / Deconstruction" Name (The Boys/Minimalist Edge)
Leans toward published novels or the oppressive, satirical style of Western TV shows like *The Boys*.
- **Format**: Direct use of an awe-inspiring noun, title, or a desecration of the concept of heroism.
- **Examples**:
  - *Gods Without Capes*
  - *Shattering the Halo*
  - *The Outcast''s Protocol*
  - *Zero Point System*

**Generation Requirement**: Automatically provide 3 [Long-form LitRPG Titles] and 2 [Minimalist Gritty Titles] for the user to choose from.

### 2. Synopsis Generation (Three-Act Structure)

The synopsis must be highly instigative, with the core mission of demonstrating **Webnovel-tier emotional contrast** (from frustrating oppression to extreme satisfaction).

- **Act 1: The Unjust World & Desperate Start (The Hook)**
  > In a world where 99% of humanity worships corporate superheroes, possessing a power labeled "F-Tier" makes you less than garbage. [Protagonist Name] learned this the hard way when the nation''s beloved #1 Hero left his sister in the rubble just for a photo op.
  *(Establish the protagonist''s tragic encounter and the hypocritical nature of the world).*

- **Act 2: The Arrival of the Cheat (The Turn)**
  > With nothing to lose and his life bleeding out on the asphalt, a cold mechanical voice echoed in his mind:
  > **[Ding!]**
  > **[Vengeance System initialized. Scanning targets... Subject: "National Hero" acquired. Extracting abilities...]**
  *(Use visible system prompts, bold text to introduce the cheat, assuring the reader a comeback is imminent).*

- **Act 3: Arrogant Ultimate Goal & Payoff Promise (The Climax)**
  > Now, armed with the ability to copy and upgrade the powers of those who sin, [Protagonist Name] is hunting them down one by one. To the public, they are untouchable gods. To him, they are just walking EXP points. Let the world burn, he''s going to tear the heavens down.
  *(An extremely arrogant, domineering ending declaration, promising the reader a ruthless path of slaughter and destroying hypocrites).*',
  (SELECT id FROM novel_creation_method WHERE name = 'Superhero / Cape Fiction Novel' LIMIT 1),
  1,
  102,
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
