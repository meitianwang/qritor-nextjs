-- The Ruthless Protagonist Novel "Novel Naming" skill (Layer 3)
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Ruthless Protagonist Novel' LIMIT 1)
-- Usage: mysql -u <user> -p <database> < skill-ruthless-protag-novel-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ruthless-protag-novel-naming',
  '「小说命名」领域知识：为 Grimdark & Anti-Hero 小说提供书名和内容简介的专业命名指导，涵盖暗黑力量感美学、主题词库、书名优劣对比',
  '"Novel Naming" domain knowledge: title and synopsis guidance for Grimdark & Anti-Hero fiction, covering dark power aesthetics, thematic vocabulary, and title quality analysis',
  '## 「小说命名」领域知识 — The Ruthless Protagonist Novel

Grimdark 小说的书名核心美学：**力量感、道德灰色、不可回头的暗示**。最好的书名让读者在翻开书之前就知道——这不会是一个英雄拯救世界的故事，而是一个危险的人在危险的世界里做危险的事。书名本身应该像主角一样：简洁、有锋芒、不需要解释自己。

---

### 命名哲学

三个层次：
1. **力量感** — 书名要有重量，读出来有压迫感。避免温和、轻快、中性的标题
2. **道德灰色暗示** — 读者从书名就能感知到这不是传统的善恶分明的故事
3. **简洁锋利** — Grimdark 书名不需要副标题、不需要冒号、不需要修饰。3-5 个单词是理想长度

---

### 常见书名格式

**格式一：[定语] + [权力/暴力名词]**
- 结构：一个暗示道德灰色的形容词 + 一个象征力量的名词
- 示例：*The Blade Itself*, *A Darker Shade of Magic*, *The Broken Empire*
- 特点：简洁、有力量感，最经典的 grimdark 书名格式
- 适合：权力攀升型故事

**格式二：[角色身份/称号]**
- 结构：主角的绰号、身份或称号作为书名
- 示例：*The Prince of Nothing*, *The Black Prism*, *The Kingkiller Chronicle*
- 特点：直接暗示主角的特殊性和危险性
- 适合：以主角魅力为核心卖点的故事

**格式三：[动作/状态 + 对象]**
- 结构：一个暗示暴力或控制的动词/动名词 + 对象
- 示例：*Red Rising*, *The Lies of Locke Lamora*, *Blood Song*
- 特点：有动态感，暗示冲突正在发生
- 适合：剧情驱动型、节奏快的故事

**格式四：[抽象概念]**
- 结构：单一名词或短语，象征故事核心主题
- 示例：*Malice*, *Perdition*, *Wrath*, *The First Law*
- 特点：极简，有文学气质，但需要封面设计配合才能让读者理解类型
- 适合：追求文学感的作者

**格式五：[系列名：卷名] 的卷名部分**
- 结构：系列名建立世界/主题，卷名递进剧情
- 示例：*The First Law: The Blade Itself / Before They Are Hanged / Last Argument of Kings*
- 特点：系列感强，每卷名暗示阶段性主题变化
- 适合：长篇系列

---

### 主题词库

| 类别 | 词汇 |
|------|------|
| 权力/控制 | Throne, Crown, Empire, Kingdom, Dominion, Reign, Rule, Sovereign |
| 黑暗/暗面 | Shadow, Dark, Black, Night, Void, Abyss, Eclipse, Gloom |
| 暴力/战斗 | Blade, Blood, Steel, Iron, War, Ash, Bone, Wrath |
| 道德灰色 | Broken, Fallen, Lies, Sin, Price, Cost, Debt, Ruin |
| 命运/不归路 | First, Last, Final, End, No Return, Perdition, Fate |
| 力量代价 | Sacrifice, Chains, Curse, Burden, Scars, Hunger, Fire |
| 角色暗示 | Prince, King, Bastard, Outcast, Traitor, Assassin, Warlord |

---

### 书名优劣对比

| 好书名 | 差书名 | 原因 |
|--------|--------|------|
| *The Blade Itself* | *Evil Hero''s Journey* | 后者太直白，直接说"evil"破坏了灰色感 |
| *A Crown of Thorns* | *The Dark Dark World* | 后者重复无力，没有意象 |
| *Blood and Iron* | *My Path to Power* | 后者像自传不像小说，第一人称书名通常较弱 |
| *The Prince of Nothing* | *Super Cold Protagonist System* | 后者网文感太重，破坏 grimdark 的严肃基调 |
| *Red Rising* | *Revenge Story of a Ruthless Man* | 后者是描述不是书名，没有意象和节奏感 |
| *Malice* | *In a World Without Mercy* | 后者太长、太解释性，好的 grimdark 书名不解释自己 |

---

### 内容简介结构

**第一段 — 世界与困境（建立基调）**

用简洁有力的语言建立世界的基调和主角的处境。开头第一句话就应该让读者感受到这个世界的残酷。不要用"In a world where..."这种模板开头。直接把读者扔进去：告诉他们主角是什么样的人、处于什么样的绝境。

**第二段 — 核心冲突与手段（展示卖点）**

展示主角面对什么样的对手或系统，以及他用什么手段去对抗。这是卖点集中展示的段落——读者要知道他们会看到什么样的"爽"（策略碾压？暴力美学？心理操纵？权力博弈？）。不要剧透，但要暗示主角的独特之处。

**第三段 — 代价与悬念（留住读者）**

暗示主角的成功不是免费的——他要付出什么代价？最后一两句留下悬念：主角能走多远？他还剩下什么？结局是胜利还是毁灭？

**字数**：150-250 字（英文单词）。

---

### 常见错误

1. **书名太直白**："Evil MC Does Evil Things"——grimdark 书名应该用意象而不是标签。读者不需要被告知这是"黑暗的"，他们应该从书名中感受到
2. **网文标题风格混入**：带"System""LitRPG""OP MC"等关键词——这是完全不同的受众和美学
3. **书名太长**：超过 6 个单词的书名失去了力量感。Grimdark 书名应该像一把匕首：短、利、致命
4. **简介变成剧情梗概**：把前十章的剧情流水账式列出来——简介应该卖氛围和卖点，不是讲故事
5. **简介中太多专有名词**：第一次接触的读者记不住"Valthor of the Crimson Reach who fights against the Shadowborn Empire"——简介中最多出现 2 个专有名词
6. **忽略系列命名一致性**：系列中各卷的书名风格、长度、节奏感不统一——好的系列名有内在的节奏和递进感',
  '## "Novel Naming" Domain Knowledge — The Ruthless Protagonist Novel

The core aesthetic of grimdark novel titles: **power, moral grayness, and the implication of no return**. The best titles tell readers before they even open the book — this is not a story of a hero saving the world, but of a dangerous person doing dangerous things in a dangerous world. The title itself should be like the protagonist: concise, sharp-edged, and requiring no explanation.

---

### Naming Philosophy

Three layers:
1. **Weight and power** — The title should feel heavy in the mouth. Avoid mild, light, or neutral phrasing. When spoken aloud, the title should land with impact.
2. **Moral gray signaling** — Readers should sense from the title alone that this is not a conventional good-versus-evil narrative. The title implies complexity, compromise, or darkness without stating it outright.
3. **Brevity and edge** — Grimdark titles do not need subtitles, colons, or qualifiers. 3-5 words is the ideal length. Every word must earn its place.

---

### Common Title Formats

**Format 1: [Modifier] + [Power/Violence Noun]**
- Structure: A morally ambiguous adjective + a noun symbolizing power
- Examples: *The Blade Itself*, *A Darker Shade of Magic*, *The Broken Empire*
- Characteristics: Concise, powerful — the most classic grimdark title format
- Best for: Power-ascent narratives

**Format 2: [Character Title / Identity]**
- Structure: The protagonist''s epithet, identity, or title as the book title
- Examples: *The Prince of Nothing*, *The Black Prism*, *The Kingkiller Chronicle*
- Characteristics: Directly implies the MC''s exceptionalism and danger
- Best for: Stories where the MC''s charisma is the primary selling point

**Format 3: [Action/State + Object]**
- Structure: A verb or gerund implying violence or control + an object
- Examples: *Red Rising*, *The Lies of Locke Lamora*, *Blood Song*
- Characteristics: Dynamic, implies conflict is actively unfolding
- Best for: Plot-driven, fast-paced narratives

**Format 4: [Abstract Concept]**
- Structure: A single noun or short phrase symbolizing the story''s core theme
- Examples: *Malice*, *Perdition*, *Wrath*, *The First Law*
- Characteristics: Minimalist, literary. Requires strong cover design to signal genre.
- Best for: Authors pursuing literary gravitas

**Format 5: [Series Name: Volume Name]**
- Structure: Series name establishes the world/theme; volume names track narrative progression
- Examples: *The First Law: The Blade Itself / Before They Are Hanged / Last Argument of Kings*
- Characteristics: Strong series identity with each volume''s title reflecting its thematic phase
- Best for: Multi-volume series

---

### Thematic Vocabulary

| Category | Words |
|----------|-------|
| Power / Control | Throne, Crown, Empire, Kingdom, Dominion, Reign, Rule, Sovereign, Conquest |
| Darkness / Shadow | Shadow, Dark, Black, Night, Void, Abyss, Eclipse, Gloom, Dusk |
| Violence / Conflict | Blade, Blood, Steel, Iron, War, Ash, Bone, Wrath, Ruin, Fire |
| Moral Grayness | Broken, Fallen, Lies, Sin, Price, Cost, Debt, Ruin, Corruption, Betrayal |
| Fate / No Return | First, Last, Final, End, Perdition, Fate, Doom, Descent, Edge |
| Power Cost | Sacrifice, Chains, Curse, Burden, Scars, Hunger, Pact, Toll |
| Character Signals | Prince, King, Bastard, Outcast, Traitor, Assassin, Warlord, Tyrant, Nobody |

**Combination technique**: The most effective grimdark titles combine words from different categories. "Blood" (violence) + "Song" (beauty) creates tension. "Broken" (moral gray) + "Empire" (power) implies a fall. The title should contain an internal contradiction or friction.

---

### Title Quality Comparison

| Strong Title | Weak Title | Why |
|-------------|-----------|-----|
| *The Blade Itself* | *Evil Hero''s Journey* | The weak title states its theme instead of evoking it. "Evil" is a label; the strong title is an image. |
| *A Crown of Thorns* | *The Dark Dark World* | Repetition is weakness, not emphasis. The strong title uses a single, layered image (crown = power, thorns = pain). |
| *Blood and Iron* | *My Path to Power* | First-person titles feel like memoir, not fiction. The strong title is visceral and concrete. |
| *The Prince of Nothing* | *Super Cold Protagonist System* | Web novel keywords ("System," "OP MC") belong to a different genre ecosystem entirely. Mixing them with grimdark signals confused authorial intent. |
| *Red Rising* | *Revenge Story of a Ruthless Man* | The weak title describes; the strong title suggests. Two words accomplish more than seven. |
| *Malice* | *In a World Without Mercy* | The strong title trusts the reader. The weak title explains itself, which is the literary equivalent of explaining a joke. |

---

### Synopsis Structure

**Paragraph 1 — World and Predicament (Establish Tone)**

Establish the world''s tone and the MC''s situation in lean, powerful language. The very first sentence should make the reader feel the world''s cruelty. Do NOT start with "In a world where..." — that template signals generic fantasy. Instead, drop the reader directly into it: who the MC is, what impossible position they''re in, and why the normal rules don''t apply here.

Example opening approach: Start with a concrete detail — a price, a rule, or a fact that immediately communicates the world''s harshness. "In the Ironhold, mercy is the first thing children learn to abandon."

**Paragraph 2 — Core Conflict and Methods (Showcase the Selling Point)**

Show what the MC is up against and HOW they fight back. This paragraph is the concentrated sales pitch — readers need to know what kind of satisfaction they''ll get: strategic domination? Brutal combat efficiency? Psychological warfare? Political maneuvering? Don''t spoil the plot, but make clear what makes this MC''s brand of ruthlessness unique and compelling.

Show, don''t tell: instead of "He is ruthless and cunning," demonstrate it: "He offers alliance with one hand and holds a knife in the other — and everyone at the table knows it, and sits down anyway."

**Paragraph 3 — Cost and Suspense (Retain the Reader)**

Imply that the MC''s success is not free. What is the price? This is where grimdark''s core appeal shines: the question is not "Will they win?" but "What will winning cost them?" End with an open question: How far will the MC go? What will remain of them? Is the destination victory — or destruction?

**Word count**: 150-250 words.

---

### Common Mistakes

1. **Title too literal**: "Evil MC Does Evil Things" — grimdark titles should use imagery, not labels. The reader should not be TOLD the story is dark; they should FEEL it from the title. The word "evil" in a title almost always weakens it.
2. **Web novel title conventions**: Including keywords like "System," "LitRPG," "OP MC," "Reincarnated" — these belong to a different genre ecosystem with a completely different aesthetic. Mixing them with grimdark signals confused genre positioning.
3. **Title too long**: Beyond 6 words, a title loses its impact. Grimdark titles should function like a dagger: short, sharp, lethal. Every additional word dilutes the punch. If a title needs a colon and subtitle, the main title is probably too weak to stand alone.
4. **Synopsis becomes plot summary**: Listing the first ten chapters as a chronological recap. The synopsis should sell atmosphere and appeal, not narrate events. Think of it as a trailer, not a recap.
5. **Too many proper nouns in synopsis**: First-time readers cannot absorb "Valthor of the Crimson Reach who fights against the Shadowborn Empire using the forbidden arts of the Veilwalkers." Maximum 2 proper nouns in a synopsis. Everything else should be described in accessible terms.
6. **Inconsistent series naming**: Volumes in a series with wildly different title styles, lengths, or rhythmic patterns. A good series name has internal rhythm and a sense of escalation — each volume title should feel like it belongs with the others.',

  (SELECT id FROM novel_creation_method WHERE name = 'The Ruthless Protagonist Novel' LIMIT 1),
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
