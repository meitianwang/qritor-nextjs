-- Cli-Fi / Climate Fiction Novel「书名与大纲 Novel Naming」生成技能
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'clifi-novel-naming',
  '层级3(Domain Knowledge) - 「书名与大纲生成」：指导生废土风格的电影感标题，并构建压抑且有爆发点的三段式生存大纲',
  'Layer 3 (Domain Knowledge) - "Novel Naming & Synopsis": Guide to generate cinematic, wasteland-style titles and structure an oppressive yet explosive 3-act survival synopsis',
  '## 书名与大纲生成指南 — 气候幻想 (Cli-Fi)

此类网文不需要轻小说那种长句子的搞怪。它需要的是极简的、充满血腥味和尘土味的**电影感**。大纲的承诺是：在这个人吃人的绝望世界里，主角将撕开重重沙暴，亲手打碎旧世界的枷锁。

### 1. Title Generation (书名命名偏好)

英语读物通常采用具有隐喻、资源指向或极具压迫感的地名、称号作为书名。

#### A. The Resource/Wasteland Metaphor (资源废土/隐喻风)
直接点出这个世界最缺乏的东西，以及环境的残酷。
- 格式：`[The Essential Resource/Harsh Environment] + [Dark Noun]`
- 示例：
  - *The Water Knife* (水刀 - 暗示为水杀人的人)
  - *Ash and Oxygen* (灰烬与氧气)
  - *The Last Sun* (最后的太阳)

#### B. The Scavenger''s Journey/Title (拾荒者旅程/硬核风)
关注于主角的职业、车队或者是史诗旅程的名字。类似于《疯狂的麦克斯：狂暴之路》。
- 格式：`[Title/Adjective] + [Road/City/Blood]`
- 示例：
  - *Scavenger’s Road* (拾荒者之路)
  - *Rust and Ruin* (铁锈与废墟)
  - *The Iron Flotilla* (钢铁浮岛舰队)
  - *The Bone Desert* (白骨荒漠)

**生成要求**：请自动提供 2 个 [直接以气候/资源命名的压迫感标题] 和 3 个 [带有公路片/旅行感的硬核废土标题] 供选择。

### 2. Synopsis Generation (三段式大纲结构)

简介的语气需要冷酷、干脆，像是一份写在破羊皮纸上的遗书，逐渐过渡到激烈的反抗。

- **第一段：展示绝望的设定与日常 (The Bleak Reality)**
  > In the year 2145, water is no longer a human right; it’s a currency traded in blood. The oceans have dried to salt-flats, and the remaining population huddled in the shadows of dead mega-cities. [Protagonist Name] is a simple rust-scavenger, keeping his head down, paying the weekly Water Tithe to the Barons just to survive another 130-degree day under a merciless sun.
  （迅速交代宏伟的灾难背景、资源垄断和主角如蝼蚁般的挣扎）。

- **第二段：意外的变量打破平静 (The Catalyst for Survival)**
  > Survival was enough, until he pulled a sealed, pre-war data drive from the chest cavity of a mutated crawler. It contains the GPS coordinates for an impossibly functioning aquifer—the legendary Eden. But the Water Barons’ scav-hunters have caught his scent. Now, with a battered dune buggy and a rusted shotgun, he is thrust into a wasteland where everyone is willing to kill for a drop.
  （强调主角被迫"入局"，交代核心的金手指/物品以及面临的庞大阻碍）。

- **第三段：血腥反抗的最高承诺 (The Gritty Promise)**
  > It’s a 500-mile race across the irradiated Salt Sea. He will face toxic storms, cannibal tribes, and the Barons’ heavily armed convoys. [Protagonist Name] isn’t trying to save the world; he just wants a long, cool drink of water. And he will burn the Warlords’ empire to ashes to get it. 
  （极其干脆、粗暴的末日美学收尾。不谈拯救世界的空泛口号，只有为了自己活命而杀穿地狱的承诺。）',
  '## Title & Synopsis Generation Guide — Cli-Fi / Climate Fiction

This genre does not need the comedic, paragraph-long titles of Light Novels. It requires extreme minimalism: **cinematic text** coated in blood, rust, and dust. The synopsis promises one thing: in a desperate world of cannibals, the protagonist will tear through the mega-storms and personally shatter the chains of the old world.

### 1. Title Generation Preferences

English books usually employ metaphors, resource indicators, or highly oppressive location names or occupational titles.

#### A. The Resource/Wasteland Metaphor
Directly indicating what the world lacks the most, emphasizing the environment.
- **Format**: `[The Essential Resource/Harsh Environment] + [Dark Noun]`
- **Examples**:
  - *The Water Knife* (Implies an assassin killing for water)
  - *Ash and Oxygen*
  - *The Last Sun*

#### B. The Scavenger''s Journey / Gritty Hardcore
Focusing on the protagonist''s profession, their convoy, or the name of their epic journey. High *Mad Max* energy.
- **Format**: `[Title/Adjective] + [Road/City/Blood]`
- **Examples**:
  - *Scavenger’s Road*
  - *Rust and Ruin*
  - *The Iron Flotilla*
  - *The Salt Wastes*

**Generation Requirement**: Automatically provide 2 [Oppressive Titles directly naming the climate/resource] and 3 [Hardcore Wasteland Road-Trip Titles] for the user to choose from.

### 2. Synopsis Generation (Three-Act Structure)

The tone of the synopsis must be cold and crisp, reading like a suicide note scratched onto ancient parchment, before graduating into blazing rebellion.

- **Act 1: The Bleak Reality & Daily Grind**
  > In the year 2145, water is no longer a human right; it’s a currency traded in blood. The oceans have dried to salt-flats, and the remaining population huddled in the shadows of dead mega-cities. [Protagonist Name] is a simple rust-scavenger, keeping his head down, paying the weekly Water Tithe to the Barons just to survive another 130-degree day under a merciless sun.
  *(Quickly establish the catastrophic background, resource monopoly, and the protagonist''s ant-like struggle).*

- **Act 2: The Catalyst for Survival**
  > Survival was enough, until he pulled a sealed, pre-war data drive from the chest cavity of a mutated crawler. It contains the GPS coordinates for an impossibly functioning aquifer—the legendary Eden. But the Water Barons’ scav-hunters have caught his scent. Now, with a battered dune buggy and a rusted shotgun, he is thrust into a wasteland where everyone is willing to kill for a drop.
  *(Emphasize the protagonist being forced into the game, introducing the core relic/cheat and the massive obstacles).*

- **Act 3: The Gritty Vengeance Promise**
  > It’s a 500-mile race across the irradiated Salt Sea. He will face rain that melts armor, cannibal tribes, and the Barons’ heavily armed convoys. [Protagonist Name] isn’t trying to save the world; he just wants a long, cool drink of water. And he will burn the Warlords’ empire to ashes to get it. 
  *(A brutally blunt, apocalyptic sign-off. No empty promises of saving the Earth—just a pledge to slaughter through hell to stay alive.)*',
  (SELECT id FROM novel_creation_method WHERE name = 'Cli-Fi / Climate Fiction Novel' LIMIT 1),
  1,
  102,
  NOW()
)
ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);
