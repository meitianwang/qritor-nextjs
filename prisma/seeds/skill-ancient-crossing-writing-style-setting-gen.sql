-- 古代架空穿越小说「文风设定」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '古代架空穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-ancient-crossing-writing-style-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ancient-crossing-writing-style-setting-gen',
  '「文风设定」设定生成：为古代架空穿越小说生成文风设定，包括叙事视角、语言风格、描写侧重、节奏把控、禁用词汇',
  '"Writing Style" setting generation: generate writing style settings for ancient fictional crossing novels, including narrative perspective, language style, description focus, pacing control, and forbidden vocabulary',
  '## 「文风设定」设定生成 — 古代架空穿越小说

「文风设定」决定了读者的阅读体验和故事的整体氛围。古代架空穿越小说的文风选择需要平衡"古代氛围感"与"现代可读性"，同时要体现穿越者的双重身份特质。

---

### 字段生成指南

#### 叙事视角

不同视角适合不同类型的故事，选择需与主线剧情匹配：

| 视角 | 特点 | 适合场景 |
|------|------|---------|
| **第一人称** | 代入感最强，心理描写最丰富，但信息面受限 | 宅斗/宫斗（心理描写丰富，展示角色的算计和内心戏） |
| **第三人称限知** | 兼顾代入感和叙事灵活性，可灵活切换信息披露 | 最通用的选择，适合绝大多数古代架空穿越故事 |
| **第三人称全知** | 可展现全局信息，多线叙事，但代入感较弱 | 权谋争霸（需要展现多方势力的博弈和全局视野） |

**选择建议**：
- 宅斗/宫斗为主 → 优先第一人称，心理描写丰富，读者跟随主角一起算计
- 多数故事 → 第三人称限知最安全，灵活度最高
- 权谋/争霸格局大 → 第三人称全知，展现多线博弈

#### 语言风格

语言风格决定叙事文字的整体调性，需要与故事基调匹配：

| 风格 | 特点 | 适合基调 |
|------|------|---------|
| **古风典雅** | 用语考究，文辞优美，有文学性和古韵 | 权谋烧脑、细腻虐心 |
| **半文半白** | 日常对话偏白话，叙述描写有古韵，最自然的平衡 | 最常见的选择，适合大多数故事 |
| **现代轻松** | 语言轻松活泼，带有穿越者的现代口吻和思维方式 | 轻松爽文、甜宠日常 |
| **幽默吐槽** | 主角用现代人视角吐槽古代规矩，笑点密集 | 轻松爽文、种田发家 |

**注意**：古风典雅需要较强的文字功底，建议新手作者选择半文半白或现代轻松。幽默吐槽适合主角性格开朗外向的设定。

#### 描写侧重

描写侧重决定了叙事的着力点，影响读者的阅读感受：

- **心理描写为主**：适合宅斗和宫斗，展示角色的思考、算计和内心博弈。穿越者的双重身份让心理描写尤为出彩——现代灵魂对古代事件的反应和分析
- **对话推进为主**：节奏最快，适合各种类型。通过对话展现人物性格、推进剧情、揭示信息
- **动作场景为主**：适合江湖恩怨类型，武打描写丰富，场面感强。需要有一定的武侠写作功底
- **环境氛围为主**：适合细腻文风，重视场景渲染，通过环境描写烘托情绪和氛围。适合慢热细腻的故事

#### 节奏把控

节奏把控决定故事的推进速度和张弛节奏：

- **快节奏爽文**：每章都有冲突和进展，三五章一个小高潮，密集的爽点和打脸。适合轻松爽文基调
- **中等节奏**：有铺垫有高潮，张弛有度，每5-8章一个小高潮。最均衡的选择，适合大多数故事
- **慢热细腻**：前期慢慢铺设世界观和人物关系，后期厚积薄发。适合温馨治愈和细腻虐心基调

节奏选择应与故事基调一致——轻松爽文配快节奏，权谋烧脑配中等节奏，温馨治愈配慢热细腻。

#### 禁用词汇

古代架空穿越需要特别注意的语言禁区：

- **明显的现代词汇**：除非是主角的内心独白，叙述和对话中不应出现明显的现代用语（如"OK"、"打卡"、"内卷"、"emo"）
- **不符合时代的科技名词**：不能在叙述中使用电、手机、汽车等现代科技词汇
- **穿越者公开使用的现代用语**：穿越者在与古人对话时不应直接使用现代俚语——内心吐槽可以，但公开说话要符合古代语境
- **建议列出5-10个本书特别需要避免的词汇**，让AI在生成章节时有明确的禁区

---

### 推荐搭配

根据已有设定信息，从以下经典搭配中选择最合适的组合：

| 故事风格 | 视角 | 语言 | 描写侧重 | 节奏 |
|---------|------|------|---------|------|
| 宅斗/宫斗型 | 第一人称 | 半文半白 | 心理描写 | 中等节奏 |
| 轻松爽文型 | 第三人称限知 | 现代轻松/幽默吐槽 | 对话推进 | 快节奏 |
| 权谋争霸型 | 第三人称全知 | 古风典雅/半文半白 | 对话+心理 | 中等节奏 |
| 种田经商型 | 第三人称限知 | 现代轻松/幽默吐槽 | 环境+对话 | 慢热细腻 |
| 虐心催泪型 | 第一人称 | 古风典雅 | 心理+环境 | 慢热细腻 |
| 江湖武侠型 | 第三人称限知 | 半文半白 | 动作场景 | 快节奏 |

生成时应参考故事基调、主线剧情和感情线类型，选择最匹配的风格组合。',
  '## "Writing Style" Setting Generation — Ancient Fictional Crossing Novel

The "Writing Style" determines the reading experience and overall story atmosphere. Ancient fictional crossing novels need to balance "ancient atmosphere" with "modern readability" while reflecting the crosser''s dual-identity characteristics.

---

### Field Generation Guide

#### Narrative Perspective
Different perspectives suit different story types:
- **First person**: Strongest immersion, richest inner monologue, but limited information scope. Best for household/palace intrigue (showcasing calculations and inner drama)
- **Third person limited**: Most versatile choice, balances immersion and narrative flexibility. Suitable for most ancient fictional crossing stories
- **Third person omniscient**: Can reveal full-picture information for multi-thread narration, but weaker immersion. Best for political strategy (showing multi-faction maneuvering)

#### Language Style
Determines the overall tonal quality of narrative text:
- **Classical elegant** (古风典雅): Refined diction, literary quality. For strategic brain-burning, delicate bittersweet
- **Semi-classical** (半文半白): Conversational dialogue, classical narration. Most common choice
- **Modern casual** (现代轻松): Light and lively, crosser''s modern voice. For light satisfying, sweet romance
- **Humorous commentary** (幽默吐槽): Protagonist roasts ancient conventions. For light satisfying, farming

Note: Classical elegant requires strong writing skills; beginners should choose semi-classical or modern casual.

#### Description Focus
Determines the narrative emphasis:
- **Psychology-focused**: For household/palace intrigue, showing thoughts and calculations. Crosser''s dual identity makes psychological description especially vivid
- **Dialogue-driven**: Fastest pacing, suitable for all types
- **Action-focused**: For martial arts feuds with rich combat descriptions
- **Atmosphere-focused**: For delicate style with scene rendering emphasis

#### Pacing Control
Determines story progression speed:
- **Fast-paced satisfying**: Conflict every chapter, mini-climax every 3-5 chapters. For light satisfying tone
- **Moderate pacing**: Balanced buildup and payoff, mini-climax every 5-8 chapters. Most balanced choice
- **Slow-burn detailed**: Slow early setup, explosive later payoff. For warm healing and delicate bittersweet tones

#### Forbidden Vocabulary
Language boundaries for ancient fictional crossing:
- Obviously modern terminology (except in protagonist''s inner monologue)
- Technology terms that don''t fit the era
- Modern slang used publicly by the crossing character in dialogue
- Suggest listing 5-10 specific words to avoid for the particular story

---

### Recommended Combinations
Select based on existing settings:
- Household/palace intrigue: 1st person + semi-classical + psychology focus + moderate pacing
- Light satisfying: 3rd limited + modern casual/humorous + dialogue-driven + fast pacing
- Political strategy: 3rd omniscient + classical/semi-classical + dialogue+psychology + moderate pacing
- Farming/commerce: 3rd limited + modern casual/humorous + atmosphere+dialogue + slow-burn
- Bittersweet: 1st person + classical elegant + psychology+atmosphere + slow-burn
- Martial arts: 3rd limited + semi-classical + action focus + fast pacing',
  (SELECT id FROM novel_creation_method WHERE name = '古代架空穿越小说' LIMIT 1),
  1,
  54,
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
