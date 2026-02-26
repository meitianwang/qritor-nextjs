-- The Eldritch Horror Novel "Novel Naming" skill (Layer 3)
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Eldritch Horror Novel' LIMIT 1)
-- Usage: mysql -u <user> -p <database> < skill-eldritch-horror-novel-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'eldritch-horror-novel-naming',
  '小说命名：为 The Eldritch Horror Novel 提供命名指导，涵盖小说标题风格、禁用词汇、命名逻辑',
  'Novel naming: naming guidance for The Eldritch Horror Novel, covering title style, naming logic, and what to avoid',
  '## 小说命名 — The Eldritch Horror Novel

洛夫克拉夫特式小说标题的核心美学：**暗示而非宣告**。好的标题制造氛围而不剧透，引发期待而不解释。

---

### 三种主要命名策略

**1. 地点命名**（以地点作主角）

地点即命运，标题提示读者这个地方有自己的故事。地点名称应该听起来略有偏差或带有古风——存在于旧地图而非现代地图上的地方。示例模式：《[地名]的阴影》《[地名]的呼唤》《[地名]之下》。命名考量：使用古老或仿古地名，避免常见英语地名模式，考虑听起来像是古老词汇变形的名称。

**2. 实体/知识命名**（以禁忌名称暗示核心恐惧）

首次阅读的读者不知道这个名字的含义（制造期待），读完后的读者知道它意味着什么（回溯恐惧）。名称本身应该发音困难、陌生、或有一种不对劲感。示例模式：《[实体名]的遗迹》《[禁忌文本]读本》。

**3. 存在状态命名**（描述一种存在状态或过程）

暗示主角的内在旅程而非外部事件。示例模式：《理智边缘》《星辰既落》《遗忘的建筑》。选取具有字面和隐喻双重读法的抽象名词，以及暗示腐化、模糊或错误感（而非戏剧性威胁）的形容词。

---

### 标题构建规则

- 2-5个词：足够有节奏感，又足够简洁易记
- 至少包含一个读者不会立刻完全理解的词
- 考虑读完后回看标题时是否会产生额外含义
- 标题不应该总结情节，而是捕捉氛围

---

### 命名禁区

- 直白恐惧词汇：「黑暗」「恐惧」「恐怖」单独作为标题词（廉价陈词）
- 动作暗示标题：「斩杀[实体]」「对抗[宇宙力量]」
- 以主角为中心的标题：洛夫克拉夫特式故事不是个人英雄之旅
- 现代惊悚公式：能出现在机场惊悚小说封面上的标题
- 直接描述：「地下室里可怕的东西」——标题也应该是「展示」而非「告知」',
  '## Novel Naming — The Eldritch Horror Novel

Lovecraftian novel titles operate on the principle of **suggestion over declaration**. The best titles create atmosphere without revealing plot, introduce a sense of wrongness before the reader opens the book, and often contain a word or proper noun that the reader will not fully understand until after finishing the story.

---

### Three Primary Naming Strategies

**1. Location-as-Protagonist**: The location is so central to the story that it deserves to be in the title. The location name should sound slightly wrong or archaic — it should feel like a place that exists on old maps but not modern ones. The title implies that going to this place is itself the story.

Examples of the pattern: *The Shadow Over [Location Name]*, *[Location Name] Calling*, *What Lies at [Location Name]*.

Naming considerations: use archaic or archaic-sounding place names, avoid common English place name patterns (no "Springfield"), consider names that sound like corrupted versions of older words or that seem to mean something in a forgotten language.

**2. Entity/Knowledge-as-Title**: The forbidden knowledge or the entity itself is named in the title. The power of this approach: the name means nothing to first-time readers (creating anticipation) and means everything to returning readers (retrospective dread). The name itself should be difficult, alien, or have a wrongness to it phonetically.

Examples of the pattern: *The [Entity Name] Papers*, *[Entity Name]''s Wake*, *The [Forbidden Text] Readings*.

Naming considerations for entities: use consonant clusters that feel difficult to pronounce, avoid names that are simply combined common words, consider names that seem like corrupted versions of existing proper nouns (a saint''s name distorted, a god''s name mangled).

**3. State/Process-as-Title**: The title describes what is happening to the protagonist or the world rather than naming a place or entity. These titles imply an ongoing transformation or revelation rather than a discrete event.

Examples of the pattern: *Beyond the Threshold*, *After the Last Map*, *The [Adjective] [Abstract Noun]* (The Drowning Dark, The Forgotten Architecture, The Waking Edge).

Naming considerations: choose abstract nouns that have both literal and metaphorical readings, adjectives that suggest deterioration, obscurity, or wrongness rather than dramatic threat, avoid titles that imply heroic action.

---

### Title Construction Rules

- **Length**: Titles should be 2-5 words: long enough to have rhythm, short enough to be memorable.
- **Opacity**: Include at least one word that the reader might not immediately understand or that has unusual connotations.
- **Article usage**: Avoid definitive articles where they feel forced — sometimes "Shadow Over Innsmouth" lands harder than "The Shadow Over Innsmouth."
- **Retrospective depth**: Consider how the title will read in hindsight. After finishing the book, will the title take on additional meaning? The best Lovecraftian titles are more frightening the second time you see them.
- **Atmosphere over plot**: The title should NOT summarize the plot. It should capture the atmosphere.

---

### What to Avoid

- **Obvious horror markers**: "Dark," "Shadow," "Terror," "Fear" as standalone title words — these are clichés that signal cheap horror rather than cosmic dread.
- **Action-implying titles**: "Slaying the [Entity]," "Battle Against [Cosmic Force]" — these suggest the protagonist can fight back, which is antithetical to Lovecraftian horror.
- **Protagonist-centered titles**: Lovecraftian stories are not personal hero journeys — the entity, the knowledge, or the world is the true protagonist. Titling after the hero misrepresents the genre.
- **Modern thriller conventions**: Titles that could appear on airport thriller paperbacks signal the wrong genre entirely.
- **Direct description**: "The Terrifying Thing in the Basement" — show, don''t tell, even in the title. A title that has to declare its content terrifying has already failed.
- **Explained proper nouns**: If the entity or location name requires an explanatory adjective to sound ominous, the name itself is not strong enough. "The Ancient Evil Nyarlathotep" is weaker than simply "Nyarlathotep."',

  (SELECT id FROM novel_creation_method WHERE name = 'The Eldritch Horror Novel' LIMIT 1),
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
