-- Superhero / Cape Fiction Novel「Writing Style」生成技能
-- 执行方式: mysql -u <user> -p <database> < skill-superhero-writing-style-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'superhero-writing-style-setting-gen',
  '生成「Writing Style」：为超能英雄小说设计叙事视角、行文基调和写作重点',
  'Generate "Writing Style": Design the narrative POV, prose style, and focus areas for Superhero fiction',
  '## 「Writing Style」生成 — 超能英雄/反传统英雄

超级英雄题材的受众极大依赖于**画面感**与**节奏感**。战斗不仅要燃，还要聪明；讽刺虚伪英雄时，笔触要尖锐且让读者大快人心。

### 字段生成指南

#### Narrative POV (叙事视角)
- "第一人称"适合表现主角内心的愤世嫉俗、黑色幽默以及精准的吐槽（非常适合黑客/老六型主角）。
- "第三人称"适合需要描写大规模超能战役的网文。
- 强烈推荐加入 "Alternating with Hero/Villain POV"。通过插入嚣张英雄趾高气昂的第一视角，然后紧接着写他被主角按在地上爆打的画面，能产生极致的反差爽感。

#### Prose Style (行文基调)
- 根据 Core Premise 选择最匹配的文风。
- "Cinematic and Action-Heavy"：适合强调爆炸、巨兽、满天光束的超级战役。
- "Cynical and Sarcastic"：适合讽刺资本主义英雄的内核，主角总是用最通俗阴阳怪气的语言解构那些高高在上的"神明"。
- "Fast-paced LitRPG"：极其注重升级反馈，每一场打斗掉落什么、升几级，爽快直接。

#### Focus Areas (写作重点)
- 小说里最花笔墨的地方。
- "Creative Power Battles"：不是简单的互对光波，而是主角如何利用智商、环境和系统漏洞，用弱技能反杀强技能。
- "Social Engineering & PR Destruction"：比起肉体消灭，主角更喜欢在网上曝光英雄的丑闻，让他们身败名裂（诛心比杀人更爽）。

#### Theme Handling (主题处理)
- 决定故事内核。是经典的"莫欺少年穷"逆袭（Zero to Hero），还是打破一切规矩的无下限爽文（Unapologetic OP Beatdowns），或者是充满道德困境的现实主义反抗（Morally Gray Survival）。',
  '## "Writing Style" Generation — Superhero / Cape Fiction

The audience for superhero fiction relies heavily on **cinematic visualization** and **pacing**. Battles must not only be explosive but also clever; when satirizing hypocritical heroes, the prose must be sharp and deeply satisfying for the reader.

### Field Generation Guide

#### Narrative POV
- "First Person" is excellent for expressing the protagonist''s cynicism, dark humor, and snarky internal commentary (perfect for hacker/cunning protagonists).
- "Third Person" is better suited for Webnovels that need to depict massive superhuman battles.
- It is highly recommended to include "Alternating with Hero/Villain POV." Inserting the arrogant, overconfident internal thoughts of a high-ranking hero, immediately followed by a scene where the protagonist savagely beats them into the pavement, creates the ultimate contrast payoff.

#### Prose Style
- Choose the style that best matches the Core Premise.
- "Cinematic and Action-Heavy": Focuses on explosions, giant monsters, and skies filled with laser beams.
- "Cynical and Sarcastic": Perfect for satirizing corporate heroes, where the protagonist uses vulgar, sarcastic language to deconstruct these high-and-mighty "gods."
- "Fast-paced LitRPG": Highly focused on level-up feedback, explicitly detailing what drops and how many stats increase after every fight.

#### Focus Areas
- Where the narrative spends the most ink.
- "Creative Power Battles": Not just simple energy-beam struggles, but detailing how the protagonist uses intellect, the environment, and system bugs to counter strong skills with supposedly weak ones.
- "Social Engineering & PR Destruction": Rather than just physical assassination, the protagonist prefers exposing the heroes'' dark scandals online, destroying their reputation completely (destroying the ego is more satisfying than killing the body).

#### Theme Handling
- Determines the narrative core. Is it the classic underdog counterattack (Zero to Hero), an absolute rule-breaking power fantasy (Unapologetic OP Beatdowns), or a realistic rebellion fraught with moral dilemmas (Morally Gray Survival)?',
  (SELECT id FROM novel_creation_method WHERE name = 'Superhero / Cape Fiction Novel' LIMIT 1),
  1,
  5,
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
