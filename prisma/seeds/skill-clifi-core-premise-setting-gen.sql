-- Cli-Fi / Climate Fiction Novel「Core Premise」生成技能
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'clifi-core-premise-setting-gen',
  '生成「Core Premise」：为气候幻想小说设计主角原型、中心冲突和道德底线',
  'Generate "Core Premise": Design the protagonist archetype, central conflict, and moral compass for Cli-Fi fiction',
  '## 「Core Premise」生成 — 气候幻想 (Cli-Fi)

主角是如何适应这个残酷世界的？他们是随波逐流的蝼蚁，还是掌握了某种旧科技的不可替代之人？

### 字段生成指南

#### Protagonist Archetype (主角原型)
- 选择最能体现生存挣扎的身份。
- 是"孤独的拾谎者（Lone Scavenger）"？熟悉废土路线的"游牧向导（Nomad Guide）"？还是一个携带致命秘密从"温室特权区逃出的精英（Escaped Dystopian Elite）"？

#### Archetype Details (原型详情)
- 赋予主角一项**特长**，这是他们活到今天的资本。
- 比如：他们能凭借风的味道嗅出几百公里外的酸雨；或者是旧时代遗留下来的植物学家，脑子里装着杂交抗旱小麦的公式。

#### Central Conflict (中心冲突)
- 超出"每天找水喝"的宏大目标。
- 比如：推翻掌控净水器命脉的霸主（Overthrowing a Resource Monopoly），护送最后一颗纯净的植物种子穿越辐射区（Protecting a Vital Resource），或者寻找传说中没有被冰封的山谷。

#### Moral Compass (道德基底)
- 在极端环境下，道德是一种奢侈品。
- 主角是"为了活下去可以杀人越货的实用主义者"（Pragmatic Survivor），还是"固执地想要保留人性最后一丝尊严的守护者"？这决定了他们在遇到其他绝望难民时的抉择。

#### Story Tone (故事基调)
- 决定叙事氛围。
- 可以是《疯狂的麦克斯》那种"狂暴废土风"（Action-packed Wasteland Adventure），或者是《雪国列车》那种"荒凉且充满阶级压迫感"（Bleak and Gritty Survivalism），抑或是像《沙丘》一样偏向生态哲学思辨。',
  '## "Core Premise" Generation — Cli-Fi

How has the protagonist adapted to this brutal world? Are they a speck of dust drifting with the tide, or someone irreplaceable holding old-world technology?

### Field Generation Guide

#### Protagonist Archetype
- Choose an identity that best embodies the struggle for survival.
- A "Lone Scavenger"? A "Nomad Guide" familiar with wasteland routes? Or an "Escaped Dystopian Elite" carrying a deadly secret from a climate-controlled greenhouse?

#### Archetype Details
- Give the protagonist a **specialty**; this is their capital for staying alive.
- For example: They can smell acid rain hundreds of miles away just from the wind; or they are a botanist from the old era, holding the formula for hybridized drought-resistant wheat in their head.

#### Central Conflict
- A grand objective beyond "finding water today."
- For example: Overthrowing the overlord controlling the water purifier (Overthrowing a Resource Monopoly), escorting the last pure plant seed across the radioactive zone (Protecting a Vital Resource), or searching for a legendary valley that wasn''t frozen over.

#### Moral Compass
- In extreme environments, morality is a luxury.
- Is the protagonist a "Pragmatic Survivor" willing to kill and rob to live, or a "Protector" stubbornly holding onto the last shred of human dignity? This dictates their choices when encountering desperate refugees.

#### Story Tone
- Determines the narrative atmosphere.
- Can be "Action-packed Wasteland Adventure" (like *Mad Max*), "Bleak and Gritty Survivalism" with crushing class oppression (like *Snowpiercer*), or leaning towards ecological philosophy (like *Dune*).',
  (SELECT id FROM novel_creation_method WHERE name = 'Cli-Fi / Climate Fiction Novel' LIMIT 1),
  1,
  2,
  NOW()
)
ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);
