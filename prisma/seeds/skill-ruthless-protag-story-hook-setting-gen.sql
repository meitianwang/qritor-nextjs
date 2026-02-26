-- The Ruthless Protagonist Novel「Story Hook」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Ruthless Protagonist Novel' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-ruthless-protag-story-hook-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ruthless-protag-story-hook-setting-gen',
  '「Story Hook」设定生成：为 The Ruthless Protagonist Novel 生成故事钩子设定，包括 Story Hook、Core Selling Point、Opening Tension、Reader Expectation',
  '"Story Hook" setting generation: generate story hook settings for The Ruthless Protagonist Novel, including story hook, core selling point, opening tension, and reader expectation',
  '## 「Story Hook」设定生成 — The Ruthless Protagonist Novel

「Story Hook」是读者决定是否追读一本 grimdark/anti-hero 小说的第一道门槛。与传统英雄叙事不同，狠辣主角小说的钩子不是"拯救世界"，而是"看主角如何用冷酷理性碾碎所有障碍"。核心吸引力在于——读者明知主角不是好人，却忍不住为他的每一步棋叫好。

---

### 字段生成指南

#### Story Hook

一句话概括故事最令人欲罢不能的核心元素。好的 grimdark 故事钩子公式：**被逼入绝境的处境 + 不择手段的主角 + 令人好奇的代价**

优秀示例：
- "一个被师门背叛、修为尽废的天才，发现了一种以他人生命为燃料的禁术——而他不在乎代价"
- "死囚出身的雇佣兵成为了帝国最年轻的将军，条件是每一场胜利都必须用盟友的尸体铺路"
- "在一个强者可以合法吞噬弱者灵魂的世界里，最弱的奴隶觉醒了最邪恶的天赋"

避免：
- 传统英雄叙事的框架（"一个善良的少年踏上了拯救世界的旅程"）
- 没有代价感或道德张力的设定（"主角很强然后一路打怪升级"）
- 缺乏具体性的空泛概念（"在黑暗的世界里生存"）

#### Core Selling Point

核心卖点回答"这本 grimdark 小说的独特毒点在哪里"。需要与同类经典作品（Reverend Insanity、First Law、Worm）形成差异：

- **独特的黑暗魅力**：主角的狠辣方式有什么独特之处？是冷静算计型（如方源）、暴力实用型（如Logan）、还是操纵人心型（如Petyr Baelish）？
- **世界的残酷逻辑**：这个世界为什么"逼"主角必须狠？是制度性压迫、资源极度匮乏、还是力量体系本身就鼓励掠夺？
- **道德灰度的独特呈现**：如何让读者在理性上谴责主角、情感上却支持他？
- **核心爽感的差异化**：碾压虚伪正义者？在权力游戏中步步为营？用所有人都不敢用的手段逆袭？

#### Opening Tension

开篇张力是前三章必须建立的压迫感。Grimdark 小说的开篇不能温吞——要么把主角丢进绝境，要么让读者立刻见识主角的"不一样"：

**经典开篇模式**：
- **绝境觉醒**：主角一开场就濒临死亡或被彻底剥夺——被背叛、被囚禁、被剥夺力量、被丢弃等死。读者看的是"他如何从零开始反击"
- **道德冲击**：开篇就展示主角做了一件令人震惊的"恶行"，但随后揭示他为什么必须这么做。读者被迫重新评估自己的道德判断
- **弱肉强食展示**：先用一个残酷场景展示这个世界的规则——强者碾压弱者是常态，然后主角从弱者位置开始攀爬
- **伪装剥落**：主角一直伪装成某种身份（善良的、懦弱的、忠诚的），开篇的某个事件让伪装开始裂开

#### Reader Expectation

读者期待描述读者想从这个故事中获得的核心爽感。Grimdark/Anti-hero 读者的核心期待：

- **智力碾压的快感**：主角用缜密的算计击败对手，让读者感叹"这一步棋太妙了"
- **打脸虚伪正义**：那些自诩正义的角色被揭露真面目，被主角用他们自己的规则击败
- **力量攀升的黑暗版**：每一次变强都伴随着沉重的代价，但读者忍不住想看主角到底能走多远
- **道德博弈的刺激**：每一次选择都是两害相权取其轻，读者和主角一起在灰色地带做决定
- **背叛与反背叛**：看主角如何识破背叛、利用背叛、甚至主动策划背叛

---

### 常见错误

1. **钩子缺乏道德张力**：只写主角很强，不写他为了变强必须牺牲什么
2. **开篇太温和**：前三章像传统奇幻小说，没有建立起 grimdark 的氛围
3. **核心卖点与现有经典雷同**：直接复制 Reverend Insanity 或 First Law 的模式而没有创新
4. **读者期待错位**：承诺的是智谋型爽感，实际写的是无脑碾压
5. **主角的"恶"缺乏逻辑支撑**：为恶而恶，没有建立起"为什么他必须这样做"的世界逻辑
6. **开篇悬念太多**：堆砌了太多神秘元素，反而让读者抓不住核心矛盾',
  '## "Story Hook" Setting Generation — The Ruthless Protagonist Novel

The "Story Hook" is the first threshold that determines whether readers commit to a grimdark/anti-hero novel. Unlike traditional heroic narratives, the hook for a ruthless protagonist story is not "save the world" — it is "watch how the MC uses cold rationality and merciless tactics to crush every obstacle." The core appeal is this: the reader knows the protagonist is not a good person, yet they cannot help but cheer for every move they make.

This is what separates grimdark hooks from generic dark fantasy. Works like *Reverend Insanity* (Fang Yuan''s calculating nature), *The First Law* (Glokta''s brutal pragmatism), *Worm* (Taylor''s escalating moral compromises), and *The Black Company* (Croaker''s unflinching war chronicle) all succeed because their hooks promise a very specific kind of darkness — not edginess for its own sake, but a world where ruthlessness is the *rational response*.

---

### Field Generation Guide

#### Story Hook

A single sentence capturing the most compelling element of the story. The grimdark story hook formula: **Desperate situation + Ruthless protagonist + Intriguing cost**

Strong examples:
- "A genius betrayed by his sect and stripped of all cultivation discovers a forbidden art fueled by others'' lives — and he does not care about the cost"
- "A death-row convict turned mercenary becomes the Empire''s youngest general, on the condition that every victory is paved with the corpses of his own allies"
- "In a world where the strong can legally devour the souls of the weak, the lowest slave awakens the most evil talent"
- "A disgraced knight discovers that the holy order he served has been the true evil all along — and the only way to destroy them is to become worse than they are"

What makes these work:
1. **Immediate moral tension**: The reader is forced to consider whether they would make the same choice
2. **Concrete stakes**: Not vague "darkness" but specific costs and specific advantages
3. **Promise of escalation**: Each hook implies the situation will get worse and more complicated
4. **Anti-heroic agency**: The protagonist is not a victim — they are actively choosing the dark path

Avoid:
- Traditional hero frameworks ("A kind-hearted youth sets out to save the world")
- Settings without cost or moral tension ("The MC is powerful and levels up easily")
- Vague concepts lacking specificity ("Surviving in a dark world")
- Edge for the sake of edge ("The MC kills everyone because they''re evil" — there must be logic)
- Hooks that could work for any generic fantasy (test: would this hook still work if you removed the ruthless element? If yes, it''s too generic)

#### Core Selling Point

The core selling point answers: "What is this grimdark novel''s unique poison?" — what specific brand of dark satisfaction does it offer that readers cannot get elsewhere? It must differentiate from established classics:

- **Unique brand of ruthlessness**: What makes this protagonist''s ruthlessness distinctive? There are established archetypes:
  - *Cold Strategist* (Fang Yuan from Reverend Insanity): every action is calculated decades ahead, emotions are tools
  - *Violent Pragmatist* (Logan Ninefingers from First Law): does terrible things because the world leaves no other option
  - *Manipulator* (Petyr Baelish from ASOIAF): controls others by understanding their desires and fears
  - *Escalating Compromiser* (Taylor from Worm): starts with small moral concessions, ends up crossing lines she never imagined
  - Your protagonist should either refine one of these or combine them in a novel way

- **World-driven necessity**: Why does this world *force* ruthlessness? The best grimdark worlds don''t just allow cruelty — they *punish kindness*:
  - Systemic oppression where mercy equals death
  - Resource scarcity where sharing means everyone starves
  - Power systems that literally reward predation (cultivating by absorbing others)
  - Social structures where trust is a lethal vulnerability

- **Unique moral gray presentation**: How do you make the reader simultaneously condemn and root for the protagonist?
  - Show worse alternatives (the "righteous" faction is actually more evil)
  - Give the protagonist a single, understandable core motivation (survival, revenge, protecting one person)
  - Make the protagonist''s enemies genuinely threatening and hypocritical

- **Differentiated satisfaction**: What''s the primary payoff?
  - Crushing hypocritical "heroes" with their own rules
  - Political chess where every piece is a human life
  - Forbidden power progression with escalating costs
  - Seeing through and exploiting a corrupt system

#### Opening Tension

The opening tension must be established within the first three chapters. Grimdark novels cannot afford a slow start — the reader must immediately understand what kind of story this is and what kind of protagonist they''re following.

**Classic opening patterns for ruthless protagonist stories**:

- **Desperate Awakening**: The protagonist begins at rock bottom — betrayed, imprisoned, stripped of power, left for dead. The hook is "how do they fight back from zero?" This works because it immediately establishes:
  - The protagonist has nothing to lose (making ruthless choices believable)
  - The world/people who put them there become the first targets
  - The reader empathizes because the protagonist was wronged first
  - Example: Fang Yuan in *Reverend Insanity* reborn after 500 years with knowledge but no power

- **Moral Shock Opening**: The first scene shows the protagonist doing something shocking — killing an ally, sacrificing an innocent, making a deal with an enemy. Then the narrative reveals *why* they had to. This forces the reader to:
  - Immediately recalibrate their moral expectations
  - Understand that this is not a conventional hero
  - Become curious about the reasoning behind the act
  - Example: Glokta torturing a prisoner in *The Blade Itself* — horrifying, but then you understand his broken body and bitter logic

- **Predator-Prey Showcase**: Open with a scene that demonstrates the world''s rules — the strong consuming the weak is normal, expected, even legal. Then reveal the protagonist is currently among the weak. This establishes:
  - The world''s cruelty as background, not exception
  - The protagonist''s starting position (underdog with a dark advantage)
  - The implicit promise: this person will climb from prey to predator

- **Mask Slipping**: The protagonist has been maintaining a facade (kind, weak, loyal, obedient). An inciting event causes the mask to crack. This creates tension because:
  - The reader wonders what the true nature is
  - Other characters'' reactions create conflict
  - The gap between persona and reality is inherently compelling

**Opening tension must answer three questions**:
1. What impossible situation is the protagonist in RIGHT NOW?
2. What do they stand to lose if they don''t act ruthlessly?
3. What''s the first moral line they need to cross?

#### Reader Expectation

Reader expectations describe the core satisfactions the audience wants from this story. Grimdark/anti-hero readers have very specific expectations that differ from mainstream fantasy readers:

- **Intellectual Domination**: Watching the protagonist outthink opponents through meticulous planning. The reader experiences the satisfaction of a chess grandmaster''s winning move. Key elements:
  - Plans that unfold across multiple chapters
  - Opponents who are genuinely intelligent but still outmaneuvered
  - Moments where the reader realizes "the MC planned this 50 chapters ago"

- **Unmasking Hypocrisy**: Antagonists who preach virtue while practicing vice get exposed and destroyed. This is the #1 satisfaction in ruthless protagonist fiction:
  - The "righteous" sect leader who secretly experiments on disciples
  - The noble king who maintains power through hidden atrocities
  - The protagonist defeating these hypocrites using their own rules against them

- **Dark Power Progression**: Every level-up comes with a cost, but the reader is addicted to watching how far the protagonist will go. Unlike traditional power fantasy:
  - Each advancement demands a sacrifice (humanity, relationships, sanity)
  - The reader keeps asking "was it worth it?" and "what will they sacrifice next?"
  - The power curve should have diminishing returns of humanity — each step is easier to take

- **Moral Gambling**: Every choice is a trolley problem. The reader makes decisions alongside the protagonist in the gray zone:
  - Save one ally by condemning ten strangers
  - Gain power by exploiting someone who trusts you
  - The "right" choice is never obvious, and the protagonist''s choice is always defensible even if uncomfortable

- **Betrayal Chess**: Seeing the protagonist detect, exploit, and orchestrate betrayals:
  - Identifying traitors before they strike
  - Turning enemies'' betrayal plots against them
  - The protagonist themselves executing calculated betrayals when necessary (the most thrilling when the reader sees it coming but the in-story victims don''t)

- **Competence Worship**: The protagonist may be morally reprehensible, but they are *extremely good* at what they do. Readers respect mastery even when the practitioner is a villain.

---

### Common Mistakes

1. **Hook lacks moral tension**: Only describes the protagonist being powerful without showing what they sacrifice for power. "MC is the strongest" is not a grimdark hook — "MC becomes the strongest by consuming his allies'' souls" is.

2. **Opening is too gentle**: The first three chapters read like conventional fantasy — no grimdark atmosphere established. Readers expecting darkness will leave. You have 3 chapters maximum to set the tone.

3. **Core selling point duplicates existing classics**: Directly copying Reverend Insanity''s "emotionless calculator" or First Law''s "broken veteran" without adding anything new. The archetype can be similar, but the execution, world, and specific flavor must differ.

4. **Reader expectation mismatch**: Promising intellectual chess (Fang Yuan-style) but delivering mindless power stomping. Or promising brutal realism (First Law-style) but writing anime-style power escalation. Know your audience and deliver consistently.

5. **Protagonist''s evil lacks logical foundation**: Being evil for the sake of being evil. There must be a world-level reason why ruthlessness is the rational choice — systemic oppression, power systems that reward predation, or survival conditions that punish mercy.

6. **Opening overloaded with mystery**: Piling too many mysterious elements without establishing a clear core conflict. The reader should understand the central tension within 3 chapters, even if the details are still unfolding.

7. **Confusing "dark" with "depressing"**: Grimdark should be cathartic, not exhausting. The darkness serves the story''s satisfaction — watching the protagonist triumph through ruthlessness is *fun*. If the story is just unrelenting misery with no payoff, readers will drop it.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Ruthless Protagonist Novel' LIMIT 1),
  1,
  52,
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
