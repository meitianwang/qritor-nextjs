-- 民间灵异故事创作「文风设定」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '民间灵异故事创作' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-lingyi-writing-style-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'lingyi-writing-style-setting-gen',
  '「文风设定」设定生成：为民间灵异故事生成文风设定，包括叙事视角、语言风格、整体基调、句式节奏、词汇水平、节奏控制及恐怖写作特殊规则',
  '"Writing Style" setting generation: generate writing style settings for Chinese folk horror stories, including narrative perspective, language style, overall tone, sentence rhythm, vocabulary level, pacing control, and special horror writing rules',
  '## 「文风设定」设定生成 — 民间灵异故事创作

「文风设定」定义整体写作风格，包含叙事视角、语言风格、整体基调、句式节奏、词汇水平、节奏控制等字段。民间灵异对文风有特殊要求——需要营造「讲述感」和「克制的恐惧」。

---

### 字段生成指南

#### 1. 叙事视角

**推荐选项**：第一人称 或 第三人称限知

**选择理由**：限制信息量，强化未知恐惧。民间灵异的恐惧核心是「未知」——主角不知道、读者也不知道，才会害怕。

**详细说明**：
- **第一人称**：代入感最强，适合「亲历者讲述」风格。读者跟随主角的视角，只能看到主角看到的、听到主角听到的。当主角不敢回头时，读者也无法知道身后是什么——这就是第一人称的恐惧力量。
- **第三人称限知**：保持一定距离感，但仍然限制信息。适合需要切换多个角色视角的故事，同时维持悬念。

**避免**：全知视角——如果读者什么都知道，恐惧感会大大降低。

#### 2. 语言风格

**推荐选项**：白话 或 口语化

**选择理由**：民间故事的「讲述感」。民间灵异的魅力在于它像是有人在深夜给你讲一个真实发生的故事。

**详细说明**：
- **白话**：平实、朴素的现代汉语，不追求华丽辞藻。像在写一封认真的书信，语言干净利落。
- **口语化**：更接近日常说话的方式，带有地域方言色彩。像在听村里老人讲古——「我跟你说，那年头的事儿……」

**避免**：过于文学化或古风的语言——民间灵异需要接地气，不需要「月色如水，夜凉如冰」这样的修辞。

#### 3. 整体基调

**推荐选项**：悬疑 或 黑暗

**选择理由**：灵异故事的基本色调。

**详细说明**：
- **悬疑**：侧重「谜团」和「探索」，恐惧来自未知和推理。适合以调查为主线的灵异故事——主角一步步揭开真相。
- **黑暗**：侧重「压抑」和「绝望」，恐惧来自氛围和宿命感。适合因果沉重、结局悲凉的故事。

**可组合使用**：悬疑为主+黑暗为辅，或反过来。

#### 4. 句式节奏

**推荐选项**：短句为主 + 简单句式

**选择理由**：恐怖场景需要短促有力。短句制造紧迫感和窒息感；长句用于铺垫和缓冲。

**详细说明**：
- 日常描写可以用中等长度的句子，节奏舒缓
- 恐怖场景必须切换到短句模式：「他停下来。屏住呼吸。身后有声音。」
- 单独一行的短句可以制造强烈的停顿感和冲击力
- 避免在恐怖高潮使用复杂的从句或修辞

#### 5. 词汇水平

**推荐选项**：简单易懂 或 适中

**选择理由**：接地气，避免过于文学化。民间灵异的读者群体广泛，语言门槛不宜过高。

**详细说明**：
- 用普通人能理解的词汇描写恐怖场景——「一股腐烂的甜味」比「腐馥氤氲」更有画面感
- 风水术语和民俗词汇是例外——这些专业词汇反而增加真实感和文化厚度
- 对话中可以使用方言词汇增强地域真实感

#### 6. 节奏控制

**推荐选项**：节奏多变

**选择理由**：铺垫时慢，惊吓时快。恐惧是对比产生的——越平静的段落之后，恐怖的冲击越大。

**详细的节奏段落设计**：

**铺垫段**：
- 大量日常描写，偶尔穿插一两个「不对劲」的细节
- 句子长、节奏慢、环境描写多
- 目标：让读者放松警惕

**紧张段**：
- 句子急剧缩短，节奏加快
- 段落变短，单独一行制造停顿感
- 目标：制造窒息感

**惊吓点**：
- 通常在一段极度紧张后的「静默」之后
- 不是「突然」——而是一个意料之外、情理之中的细节
- 惊吓点之后立刻切换到「缓冲段」，给读者喘息

**缓冲段**：
- 角色（和读者）暂时脱离恐怖环境
- 处理情绪、消化信息、准备下一步
- 不能太长——否则恐惧感会消散

---

### 特殊规则

民间灵异文风有三条必须遵守的特殊规则：

1. **恐怖场景不超过 200 字的连续描写**：留白比描写更有效。人的想象力永远比文字更恐怖——描写到七分，剩下三分让读者自己脑补。超过 200 字的持续恐怖描写会让读者麻木。

2. **对话中适当使用方言词汇增强地域真实感**：「你别瞎咧咧」（东北）、「莫乱讲」（湖南）、「不要乱港」（广东）——方言是最好的地域标签。但不要过度使用导致阅读障碍，关键位置点缀即可。

3. **鬼怪出场永远不正面描写全貌，只描写局部特征**：一只苍白的手、一双没有瞳孔的眼睛、一个歪着脖子的轮廓——局部描写留下想象空间，远比「一个穿白衣的女鬼浮在空中」更令人恐惧。这是民间灵异写作的第一法则：「克制」。

---

### 生成要点

- 叙事视角优先选择第一人称或第三人称限知，限制信息量以强化恐惧
- 语言风格保持白话或口语化的「讲述感」，避免过度文学化
- 整体基调以悬疑或黑暗为底色
- 句式节奏以短句为主，恐怖场景切换到短促有力的句式
- 词汇简单易懂，但风水术语和民俗词汇可保留以增加真实感
- 节奏控制必须多变：铺垫段（慢）→ 紧张段（快）→ 惊吓点 → 缓冲段（喘息）
- 三条特殊规则是硬性要求，必须体现在文风设定中',
  '## "Writing Style" Setting Generation — Chinese Folk Horror Story

The "Writing Style Setting" defines overall writing style, including narrative perspective, language style, overall tone, sentence rhythm, vocabulary level, pacing control, and other fields. Folk horror has special writing style requirements -- it needs to create a "storytelling feel" and "restrained fear."

---

### Field Generation Guide

#### 1. Narrative Perspective

**Recommended**: First person or third person limited

**Rationale**: Restricts information; strengthens fear of the unknown. The core of folk horror fear is "the unknown" -- when neither protagonist nor reader knows, that is when fear takes hold.

**Details**:
- **First person**: Strongest immersion; suits the "firsthand account" style. Readers follow the protagonist''s perspective, seeing only what they see, hearing only what they hear. When the protagonist doesn''t dare look back, the reader cannot know what''s behind them -- this is the power of first-person fear.
- **Third person limited**: Maintains some distance while still restricting information. Suits stories that need to switch between multiple character viewpoints while maintaining suspense.

**Avoid**: Omniscient perspective -- if readers know everything, fear diminishes significantly.

#### 2. Language Style

**Recommended**: Vernacular (白话) or colloquial (口语化)

**Rationale**: The "storytelling feel" of folk tales. Folk horror''s charm lies in feeling like someone is telling you a true story late at night.

**Details**:
- **Vernacular**: Plain, unadorned modern Chinese without pursuing elaborate rhetoric. Like writing a sincere letter -- clean and crisp language.
- **Colloquial**: Closer to everyday speech patterns, with regional dialect coloring. Like listening to a village elder tell old tales -- "Let me tell you, back in those days..."

**Avoid**: Overly literary or classical Chinese language -- folk horror needs to be grounded, not "moonlight like water, night cold as ice" rhetoric.

#### 3. Overall Tone

**Recommended**: Suspense (悬疑) or Dark (黑暗)

**Rationale**: The basic color palette of horror stories.

**Details**:
- **Suspense**: Emphasizes "mystery" and "exploration"; fear comes from the unknown and reasoning. Suits investigation-driven horror stories where the protagonist uncovers the truth step by step.
- **Dark**: Emphasizes "oppression" and "despair"; fear comes from atmosphere and a sense of fate. Suits stories with heavy karma and bleak endings.

**Can be combined**: Suspense primary + dark secondary, or vice versa.

#### 4. Sentence Rhythm

**Recommended**: Short sentences + simple structure

**Rationale**: Horror scenes need punchy brevity. Short sentences create urgency and a suffocating feeling; long sentences are used for buildup and buffering.

**Details**:
- Daily descriptions can use medium-length sentences with a relaxed pace
- Horror scenes must switch to short-sentence mode: "He stopped. Held his breath. A sound behind him."
- Single-line short sentences create powerful pauses and impact
- Avoid complex subordinate clauses or elaborate rhetoric during horror climaxes

#### 5. Vocabulary Level

**Recommended**: Simple (简单易懂) or moderate (适中)

**Rationale**: Grounded; avoid being overly literary. Folk horror has a broad readership; the language barrier should not be too high.

**Details**:
- Use vocabulary ordinary people can understand to describe horror scenes -- "a sweet rotting smell" is more vivid than "putrid miasma"
- Feng shui terminology and folk vocabulary are exceptions -- these specialized terms actually enhance authenticity and cultural depth
- Regional dialect vocabulary in dialogue enhances geographic authenticity

#### 6. Pacing Control

**Recommended**: Variable pacing (节奏多变)

**Rationale**: Slow during buildup, fast during scares. Fear is created through contrast -- the calmer the preceding segment, the greater the horror''s impact.

**Detailed pacing segment design**:

**Buildup segments**:
- Heavy daily-life descriptions, occasionally interspersed with one or two "off" details
- Long sentences, slow pace, lots of environmental description
- Goal: lull readers into dropping their guard

**Tension segments**:
- Sentences shorten dramatically; pace accelerates
- Paragraphs shrink; single-line paragraphs create pause effects
- Goal: create a suffocating feeling

**Scare points**:
- Usually after a "silence" following extreme tension
- Not "suddenly" -- but an unexpected-yet-logical detail
- Immediately switch to a "buffer segment" after the scare point to let readers breathe

**Buffer segments**:
- Character (and reader) temporarily exits the horror environment
- Process emotions, digest information, prepare next steps
- Cannot be too long -- otherwise fear dissipates

---

### Special Rules

Folk horror writing style has three mandatory special rules:

1. **Horror scene descriptions should not exceed 200 continuous words**: Leaving blanks is more effective than describing. Human imagination is always more terrifying than text -- describe to seventy percent, let readers fill in the remaining thirty. Continuous horror description exceeding 200 words numbs the reader.

2. **Use regional dialect vocabulary in dialogue to enhance geographic authenticity**: Regional dialect is the best geographic label. But do not overuse to the point of creating reading difficulty; sprinkle it at key moments.

3. **Never fully describe a ghost''s complete appearance; only describe partial features**: A pale hand, a pair of pupil-less eyes, a silhouette with a crooked neck -- partial descriptions leave room for imagination, far more terrifying than "a woman in white floating in the air." This is the first law of folk horror writing: "restraint."

---

### Generation Notes

- Narrative perspective should prioritize first person or third person limited to restrict information and strengthen fear
- Language style should maintain the vernacular or colloquial "storytelling feel"; avoid over-literariness
- Overall tone should use suspense or dark as the base palette
- Sentence rhythm should be primarily short sentences; switch to punchy brevity for horror scenes
- Vocabulary should be simple and accessible, but feng shui terminology and folk vocabulary can be retained for authenticity
- Pacing must be variable: buildup segment (slow) → tension segment (fast) → scare point → buffer segment (breathing room)
- The three special rules are hard requirements that must be reflected in the writing style settings',
  (SELECT id FROM novel_creation_method WHERE name = '民间灵异故事创作' LIMIT 1),
  1,
  73,
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
