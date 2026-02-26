-- The Protagonist Hunter「小说命名」skill (Layer 3)
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Protagonist Hunter' LIMIT 1)
-- Usage: mysql -u <user> -p <database> < skill-protag-hunter-novel-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'protag-hunter-novel-naming',
  '「小说命名」领域知识：为猎杀主角类小说提供书名与内容简介的专业命名指导，涵盖"逆转天命"或"猎手视角"美学，三大书名格式（猎手的名号型、天命悖论型、猎杀宣言型），英文书名词汇体系，以及如何写出"我知道你是主角，但今天我先动手"的内容简介冲击感',
  '"Novel Naming" domain knowledge for Protagonist Hunter fiction: professional title and synopsis guidance covering the "Reversed Fate" or "Hunter''s Perspective" aesthetic, three title formats (Hunter''s Epithet type, Fate Paradox type, Hunt Declaration type), English title vocabulary, and how to write synopses with the "I know you''re the hero, but I''m making the first move" shock impact',
  '## 「小说命名」领域知识 — The Protagonist Hunter

猎杀主角类书名的核心美学：**逆转的快感与先知的冷静**。最好的猎杀主角书名在一瞬间传递两个信息——"天命曾经指向另一个人"，以及"但现在有一个人打算改变这一切"。书名应该让读者在翻开书之前就感受到：这是一个天命遭遇挑战者的故事。

猎杀主角书名与其他异世界类型书名的核心区别：
- 不是"主角获得主角光环"，而是"一个人夺走了别人的主角光环"
- 不是展示力量，而是展示**知识**——猎手赢的方式是"先知"，而不是"最强"
- 不是"冒险开始"，而是"猎杀开始"——书名应该透露出计划性和目的性

---

### 书名美学：三种核心取向

#### 取向1：逆转天命（Destiny Inversion）

这类书名直接表达"命运被颠覆"的核心主题。书名中隐含着对固有叙事结构的挑战——"本该是主角的人不再是主角"。

美学特点：
- 包含命运、天命、注定等相关意象
- 同时包含某种"反转"或"夺取"的动态
- 读者从书名就能感受到这是一个反叙事（meta-narrative）故事

代表词汇：Fate, Prophecy, Chosen, Destiny, Herald, Champion → 配合 Stolen, Claimed, Broken, Reversed, Unwritten, Defied

示例书名：
- *The Stolen Prophecy*（被偷走的预言）
- *Fate Defied*（被违抗的命运）
- *The Unchosen One*（非被选中者）
- *Against Destiny*（逆天命而行）

#### 取向2：猎手视角（The Hunter''s Perspective）

这类书名从猎手的第一视角出发——书名本身就是猎手的宣言或自我定义。与传统异世界书名不同，这类书名透露出"叙述者知道自己在玩一个游戏"的元意识。

美学特点：
- 包含猎手的身份认同（The Hunter, The Predator, The Strategist）
- 或者包含猎手对勇者的客体化称呼（The Hero, The Chosen, The Protagonist）
- 语气冷静、甚至带一点嘲讽感

代表词汇：Hunter, Predator, Stalker, Schemer, Puppeteer → 配合 target 关键词 Hero, Champion, Savior, Chosen, Protagonist

示例书名：
- *The Hero''s Predator*（勇者的天敌）
- *Hunting the Chosen*（猎杀天选者）
- *Before the Hero Falls*（在英雄倒下之前）
- *The Last Monster Boss*（最后的大魔王）

#### 取向3：先知的棋局（The Prophet''s Game）

这类书名强调猎手的先知优势——他不仅仅是猎手，他还是知道剧情走向的"读者"。书名捕捉的是"掌握信息不对称"的独特快感。

美学特点：
- 包含知识、剧本、预知等相关意象
- 暗示主角在某种意义上"知道规则"
- 比前两类书名更有智识感和元小说感

代表词汇：Script, Story, Plot, Chapter, Ending → 配合 Know, Read, Rewrite, Spoil, Predict, Foresee

示例书名：
- *I Know Your Story*（我知道你的故事）
- *The Author''s Nemesis*（作者的克星）
- *Rewriting the Script*（重写剧本）
- *The Plot Killer*（情节终结者）

---

### 常见书名格式

**格式一："猎手的名号"型**
- 结构：猎手的绰号或身份称谓直接作为书名
- 特点：直接、有力量感，暗示主角是一个定义自己的人而非被定义的人
- 适合：主角魅力是核心卖点的作品
- 示例：*The Void Hunter*（虚空猎手）、*The Canon Breaker*（原著破坏者）

**格式二："天命悖论"型**
- 结构：暗示天命和现实的矛盾冲突
- 特点：有悬念感，吸引读者探究"天命究竟被怎样破坏了"
- 适合：主题感强、叙事结构复杂的作品
- 示例：*The Prophesied Betrayal*（被预言的背叛）、*An Unheroic Destiny*（非英雄的命运）

**格式三："猎杀宣言"型**
- 结构：包含明确的行动意图，主语通常是猎手
- 特点：最直接的爽感书名，让读者立刻知道故事的核心冲突
- 适合：网络文学风格、主打爽感的作品
- 示例：*I''ll Kill the Hero First*（我先杀勇者）、*Stealing the Hero''s Fortune*（抢走勇者的机缘）

**格式四："位置反转"型**
- 结构：暗示视角或角色定位的根本性反转
- 特点：有哲学感，适合追求深度的作品
- 适合：探讨"何为主角"这一主题的作品
- 示例：*The Monster''s Story*（怪物的故事）、*From the Villain''s Side*（从反派的角度）

---

### 英文书名词汇体系

| 类别 | 核心词汇 |
|------|---------|
| 命运/天命 | Fate, Destiny, Prophecy, Chosen, Unchosen, Ordained, Foretold, Herald |
| 猎手/掌控 | Hunter, Predator, Stalker, Schemer, Puppeteer, Strategist, Phantom, Shadow |
| 勇者/目标 | Hero, Champion, Savior, Chosen One, Protagonist, Paladin, Knight, Sword |
| 知识/先知 | Script, Story, Plot, Ending, Reader, Author, Foreseen, Rewrite, Canon |
| 逆转/夺取 | Stolen, Claimed, Defied, Broken, Reversed, Hijacked, Diverted, Usurped |
| 转生/异界 | Reborn, Transmigrated, Reincarnated, Returned, Second Life, Another World |
| 怪物/配角 | Monster, Minion, Villain, Boss, Obstacle, NPC, Side Character, Lesser |

**英文书名组合技巧**：
- 最有冲击力的书名往往将"命运/天命"类词汇与"逆转/夺取"类词汇组合（Stolen Fate, Defied Prophecy）
- 将"勇者/目标"类词汇与"猎手/掌控"类词汇组合，产生角色冲突感（Hero''s Predator, Hunting the Champion）
- 将"知识/先知"类词汇单独使用，制造元叙事感（I Know Your Story, The Script Reader）

---

### 内容简介结构

猎杀主角类内容简介的核心卖点：**"我知道你是主角，但今天我先动手"的冲击感**。简介需要在最短篇幅内传递三个关键信息：猎手的独特优势（先知）、猎杀目标的特殊性（主角光环加持的勇者），以及这个故事的核心张力（命运 vs 谋算）。

**第一段 — 建立反叛位置（The Inversion Hook）**

用简短有力的开头建立"这不是普通异世界故事"的预期。最好的猎杀主角简介开头直接宣告猎手的异类性——他知道自己被扔进了一个故事里，他知道谁是主角，他不打算按照故事的剧本行事。

好的开头策略：
- 直接陈述猎手的先知优势："他转生成了原著最终大魔王的前手下。他知道所有情节。他知道勇者的名字。他知道勇者会在三年后打上门来。"
- 用对比建立张力："别人转生变成了主角。他转生成了主角猎杀的最后一个怪物。"
- 宣告行动意图："在勇者完成成长之前，他必须先完成猎杀。"

**第二段 — 展示核心冲突（The Chase）**

展示猎手与勇者之间的具体对抗形式。不要剧透具体情节，但要让读者感受到：这是一场"先知者"对"天命之子"的不对等博弈，双方各有优势。

关键要素：
- 猎手的具体优势（先知+经验+冷静算计）
- 勇者的具体威胁（主角光环+正义+成长速度）
- 两者对抗的独特性（不是纯粹的强弱对决，而是"我知道你，但你也在成长"）

**第三段 — 悬念与代价（The Uncertainty）**

猎杀主角的终极悬念不是"猎手能否赢"，而是**"当猎杀成功，猎手成为了什么"**。结尾悬念应该暗示这不只是一个逆袭故事，而是一个关于改变命运者自身代价的故事。

同时可以暗示蝴蝶效应的存在——猎手每次干预，世界就越来越偏离原著，越来越难以预测。

**字数**：150-250 字（英文单词）。

---

### 书名优劣对比

| 好书名 | 差书名 | 原因 |
|--------|--------|------|
| *The Unchosen One* | *Evil Transmigrator Kills Hero* | 后者像情节描述，没有美感；好书名用一个词翻转了整个"天选者"叙事 |
| *Hunting the Chosen* | *I''m the Villain Who Knows the Plot* | 后者太长且解释性太强；好书名用动词制造张力 |
| *Fate Defied* | *Anti-Hero System Novel* | 后者是网文标签堆砌；好书名有文学感 |
| *The Script Reader* | *Reincarnated as the Final Boss* | 后者过于常见，无独特性；好书名点明了先知视角这一核心竞争力 |
| *Before the Hero Falls* | *Protagonist Hunter* | 后者虽然准确但太直白，像分类标签；好书名创造了时间张力 |

---

### 常见错误

1. **书名太像异世界爽文标题**："转生变成最终魔王的我开始猎杀勇者"——描述性太强，缺乏书名应有的简洁力量感。书名不是故事梗概的一句话总结
2. **忽略英文语感**：中文书名翻译成英文时，逐字翻译通常产生笨拙结果。英文书名需要独立设计，以英文的韵律和美学为准
3. **无法区分于普通穿越/转生类**：书名没有体现猎杀主角这一类型的独特性（先知优势、逆天命叙事），读者无法从书名判断这是否与普通转生文不同
4. **简介剧透核心计划**：把猎手的具体猎杀策略在简介里说透——好的简介只展示"猎手有计划"，不暴露计划的具体内容
5. **简介忽略勇者的分量**：简介里勇者只是一个模糊的"目标"，没有体现主角光环的真实威胁感——读者无法理解猎杀为什么困难，无法感受张力
6. **情感落点缺失**：简介只描述了"什么人做了什么事"，没有传递这个故事的情感核心——为什么读者应该在乎猎手的成功或失败？',
  '## "Novel Naming" Domain Knowledge — The Protagonist Hunter

The core aesthetic of Protagonist Hunter titles: **the thrill of reversal and the calm of a prophet.** The best Protagonist Hunter titles convey two pieces of information simultaneously — "fate once pointed at someone else," and "but now there is someone who intends to change all of that." The title should make readers feel before opening the book: this is a story about fate meeting its challenger.

The core distinction from other isekai titles:
- Not "protagonist acquires the protagonist aura," but "someone steals another person''s protagonist aura"
- Not displaying strength, but displaying **knowledge** — the Hunter wins through foreknowledge, not superior power
- Not "the adventure begins," but "the hunt begins" — the title should convey deliberateness and intent

---

### Title Aesthetics: Three Core Orientations

#### Orientation 1: Destiny Inversion

These titles directly express the core theme of "fate overturned." The title implies a challenge to established narrative structure — "the person who should have been the protagonist is no longer."

Aesthetic characteristics:
- Contains fate, destiny, prophecy, and related imagery
- Simultaneously contains a dynamic of "reversal" or "seizure"
- Readers can sense from the title that this is a meta-narrative story

Representative vocabulary: Fate, Prophecy, Chosen, Destiny, Herald, Champion → paired with Stolen, Claimed, Broken, Reversed, Unwritten, Defied

Example titles:
- *The Stolen Prophecy*
- *Fate Defied*
- *The Unchosen One*
- *Against Destiny*

#### Orientation 2: The Hunter''s Perspective

These titles speak from the Hunter''s first-person perspective — the title itself is the Hunter''s declaration or self-definition. Unlike conventional isekai titles, this type of title reveals a meta-awareness that "the narrator knows they are playing a game."

Aesthetic characteristics:
- Contains the Hunter''s identity (The Hunter, The Predator, The Strategist)
- Or contains the Hunter''s objectified term for the hero (The Hero, The Chosen, The Protagonist)
- Tone is cool, even slightly sardonic

Representative vocabulary: Hunter, Predator, Stalker, Schemer, Puppeteer → paired with target terms Hero, Champion, Savior, Chosen, Protagonist

Example titles:
- *The Hero''s Predator*
- *Hunting the Chosen*
- *Before the Hero Falls*
- *The Last Monster Boss*

#### Orientation 3: The Prophet''s Game

These titles emphasize the Hunter''s foreknowledge advantage — they are not just a hunter, they are a "reader" who knows the plot. The title captures the unique satisfaction of "possessing information asymmetry."

Aesthetic characteristics:
- Contains knowledge, script, foresight, and related imagery
- Implies the protagonist in some sense "knows the rules"
- More intellectual and meta-fictional than the other two orientations

Representative vocabulary: Script, Story, Plot, Chapter, Ending → paired with Know, Read, Rewrite, Spoil, Predict, Foresee

Example titles:
- *I Know Your Story*
- *The Author''s Nemesis*
- *Rewriting the Script*
- *The Plot Killer*

---

### Common Title Formats

**Format 1: "Hunter''s Epithet" type**
- Structure: The Hunter''s nickname or identity title serves directly as the book title
- Characteristics: Direct, powerful — implies the MC is someone who defines themselves rather than being defined
- Best for: Works where the MC''s charisma is the core selling point
- Examples: *The Void Hunter*, *The Canon Breaker*

**Format 2: "Fate Paradox" type**
- Structure: Implies the contradiction between fate and reality
- Characteristics: Creates suspense, draws readers to explore "how fate was disrupted"
- Best for: Works with strong thematic identity and complex narrative structure
- Examples: *The Prophesied Betrayal*, *An Unheroic Destiny*

**Format 3: "Hunt Declaration" type**
- Structure: Contains explicit statement of intent to act; subject is usually the Hunter
- Characteristics: The most direct satisfaction-delivery title; readers immediately understand the core conflict
- Best for: Web fiction style, satisfaction-first works
- Examples: *I''ll Kill the Hero First*, *Stealing the Hero''s Fortune*

**Format 4: "Position Reversal" type**
- Structure: Implies a fundamental reversal of perspective or character positioning
- Characteristics: Has philosophical weight; appropriate for depth-seeking works
- Best for: Works exploring the theme of "what makes a protagonist"
- Examples: *The Monster''s Story*, *From the Villain''s Side*

---

### English Title Vocabulary System

| Category | Core Words |
|----------|-----------|
| Fate / Destiny | Fate, Destiny, Prophecy, Chosen, Unchosen, Ordained, Foretold, Herald |
| Hunter / Control | Hunter, Predator, Stalker, Schemer, Puppeteer, Strategist, Phantom, Shadow |
| Hero / Target | Hero, Champion, Savior, Chosen One, Protagonist, Paladin, Knight, Sword |
| Knowledge / Foresight | Script, Story, Plot, Ending, Reader, Author, Foreseen, Rewrite, Canon |
| Reversal / Seizure | Stolen, Claimed, Defied, Broken, Reversed, Hijacked, Diverted, Usurped |
| Reincarnation / Isekai | Reborn, Transmigrated, Reincarnated, Returned, Second Life, Another World |
| Monster / Side Character | Monster, Minion, Villain, Boss, Obstacle, NPC, Side Character, Lesser |

**English title combination technique**:
- The most impactful titles often combine "Fate/Destiny" vocabulary with "Reversal/Seizure" vocabulary (Stolen Fate, Defied Prophecy)
- Combining "Hero/Target" vocabulary with "Hunter/Control" vocabulary creates character-conflict energy (Hero''s Predator, Hunting the Champion)
- Using "Knowledge/Foresight" vocabulary alone creates a meta-narrative feel (I Know Your Story, The Script Reader)

---

### Synopsis Structure

The core selling point of Protagonist Hunter synopses: **the impact of "I know you''re the hero, but I''m making the first move today."** The synopsis needs to convey three key pieces of information in minimum space: the Hunter''s unique advantage (foreknowledge), the target''s special nature (a hero with protagonist aura), and the story''s core tension (fate vs. calculation).

**Paragraph 1 — Establishing the Inversion (The Hook)**

Use a short, powerful opening to establish "this is not a conventional isekai story" expectations. The best Protagonist Hunter synopsis openings directly declare the Hunter''s uniqueness — they know they''ve been thrown into a story, they know who the protagonist is, and they don''t intend to follow the script.

Effective opening strategies:
- Directly state the Hunter''s foreknowledge advantage: "He reincarnated as the final villain''s former subordinate. He knows every plot point. He knows the hero''s name. He knows the hero will come for him in three years."
- Use contrast to build tension: "Everyone else who transmigrated became the protagonist. He transmigrated into the last monster the protagonist kills."
- Declare intent: "Before the hero completes their growth, he must complete the hunt."

**Paragraph 2 — Showcasing the Core Conflict (The Chase)**

Show the specific form of conflict between the Hunter and the hero. Don''t spoil specific plot points, but make readers feel: this is an asymmetric contest between "the prophet" and "the child of destiny" — each with their own advantages.

Key elements:
- The Hunter''s specific advantage (foreknowledge + experience + cold calculation)
- The hero''s specific threat (protagonist aura + righteousness + growth speed)
- The uniqueness of their confrontation (not a pure strength contest, but "I know you, but you keep growing")

**Paragraph 3 — Suspense and Cost (The Uncertainty)**

The ultimate suspense of Protagonist Hunter fiction is not "can the Hunter win?" but **"when the hunt succeeds, what has the Hunter become?"** The closing suspense should imply this is not only a comeback story, but a story about the cost borne by those who change fate.

The butterfly effect''s presence can also be implied — every time the Hunter intervenes, the world diverges further from the original novel and becomes harder to predict.

**Word count**: 150-250 words.

---

### Title Quality Comparison

| Strong Title | Weak Title | Why |
|-------------|-----------|-----|
| *The Unchosen One* | *Evil Transmigrator Kills Hero* | The weak title is a plot description with no aesthetic value; the strong title inverts the entire "Chosen One" narrative in one word |
| *Hunting the Chosen* | *I''m the Villain Who Knows the Plot* | The weak title is too long and overly explanatory; the strong title uses a verb to create tension |
| *Fate Defied* | *Anti-Hero System Novel* | The weak title is a stack of web novel tags; the strong title has literary presence |
| *The Script Reader* | *Reincarnated as the Final Boss* | The weak title is too common and undistinctive; the strong title spotlights the prophetic perspective as the core competitive advantage |
| *Before the Hero Falls* | *Protagonist Hunter* | The weak title is accurate but too blunt, like a genre tag; the strong title creates temporal tension |

---

### Common Mistakes

1. **Title too similar to standard isekai web novel titles**: "The Story of Me Reincarnating as the Final Demon Lord and Hunting the Hero" — too descriptive, lacks the concise power a title should carry. A title is not a one-sentence plot summary.
2. **Neglecting English-language aesthetics**: Chinese titles translated word-for-word into English usually produce awkward results. English titles must be independently designed with English rhythm and aesthetic as the standard.
3. **Fails to distinguish from ordinary transmigration/reincarnation fiction**: The title does not reflect the unique characteristics of the Protagonist Hunter genre (foreknowledge advantage, anti-fate narrative) — readers cannot tell from the title whether this is different from standard reincarnation fiction.
4. **Synopsis spoils the core plan**: Revealing the Hunter''s specific hunting strategy in the synopsis. A good synopsis only shows "the Hunter has a plan" — it does not expose the plan''s specific content.
5. **Synopsis underplays the hero''s weight**: The hero is a vague "target" with no reflection of the protagonist aura''s real threat. Readers cannot understand why the hunt is difficult, and cannot feel the tension.
6. **Missing emotional anchor**: The synopsis only describes "who did what" without conveying the story''s emotional core — why should the reader care whether the Hunter succeeds or fails?',
  (SELECT id FROM novel_creation_method WHERE name = 'The Protagonist Hunter' LIMIT 1),
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
