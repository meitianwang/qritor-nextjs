-- Cli-Fi / Climate Fiction Novel「Writing Style」生成技能
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'clifi-writing-style-setting-gen',
  '生成「Writing Style」：为气候幻想小说设计感官侧重、节奏叙事与主题内涵',
  'Generate "Writing Style": Design the sensory focus, pacing, and theme handling for Cli-Fi fiction',
  '## 「Writing Style」生成 — 气候幻想 (Cli-Fi)

气候幻想的很大一部分魅力来自于**强烈的感官剥夺或刺痛感**。阅读体验应该让读者感到"口渴"、"寒冷"或"难以呼吸"。

### 字段生成指南

#### Narrative POV (叙事视角)
- "第一人称"代入感极强，适合描写主角内心的求生本能和对干渴/饥饿的直接感受。
- "第三人称限定"适合展现宏伟破败的环境风景与公路旅行。
- "多视角切换"（主角视角 vs 上层阶级视角），能用镜头剪辑般的效果突出"朱门酒肉臭，路有冻死骨"的残酷反差。

#### Sensory Focus (感官侧重描写)
- 要求极端细致的环境触感。
- **如果是干旱废土**：重点描写干裂流血的嘴唇、沙子磨破皮肤的刺痛、以及一滴水落在灼热铁板上瞬间蒸发的嘶嘶声。
- **如果是冰雪世界**：描写每次呼吸时肺部如同吞咽碎玻璃的刺痛，以及因为冻结而干脆折断的肢体。

#### Pacing (小说节奏)
- "Methodical and Tension-heavy"：重点描绘物流与生存逻辑。主角花了一整章修理滤水器，那种生怕弄坏一个零件导致的紧张感，比动作戏还扣人心弦。
- "Fast-paced Chase"：被财团的武装越野车队在沙海中无穷无尽地追杀。

#### Theme Handling (主题处理)
- 警世预言（Warning/Cautionary Tale）：强调贪婪是如何毁灭地球的。
- 绝境中的人性闪光（Resilience）：在所有人都变成野兽的世界里，主角决定拿出一口水救一个孤儿。
- 自然的反噬（Nature Reclaiming the Earth）：人类不再是万物之灵，必须敬畏那些重新统治地球的自然伟力。',
  '## "Writing Style" Generation — Cli-Fi

A large part of the appeal in Climate Fiction comes from **intense sensory deprivation or harshness**. The reading experience should make the reader feel "thirsty," "freezing," or "suffocating."

### Field Generation Guide

#### Narrative POV
- "First Person": Extremely immersive, perfect for conveying raw survival instincts and the visceral feeling of thirst/hunger.
- "Third Person Limited": Great for showcasing grandiose, decaying environmental set pieces and road-trip narratives.
- "Multiple POVs": Switching between the struggling protagonist and the opulent ruling class to highlight the cruel Dystopian contrast through cinematic "cut" effects.

#### Sensory Focus
- Demands hyper-detailed environmental tactile sensations.
- **If Drought Wasteland**: Focus on bleeding cracked lips, the chafing of sand against skin, and the hissing sound of a single drop of water evaporating instantly on hot iron.
- **If Deep Freeze**: Describe the feeling of swallowing shattered glass with every breath of -80C air, and limbs snapping like dry twigs because they froze solid.

#### Pacing
- "Methodical and Tension-heavy": Highly focused on logistics and survival logic. Spending a whole chapter fixing a water filter—the palpable tension of knowing a single broken screw means death can be more gripping than a shootout.
- "Fast-paced Chase": Relentless vehicular pursuit by Corporate death squads across a sea of dunes in true *Mad Max* fashion.

#### Theme Handling
- Warning/Cautionary Tale: Emphasizing how corporate greed ruined the Earth.
- Resilience of Human Spirit: In a world where everyone has turned into beasts, the protagonist decides to share their last sip of water with an orphan.
- Nature Reclaiming the Earth: Humanity is no longer the apex predator; they must show reverence to the terrifying natural forces that have reclaimed the planet.',
  (SELECT id FROM novel_creation_method WHERE name = 'Cli-Fi / Climate Fiction Novel' LIMIT 1),
  1,
  5,
  NOW()
)
ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);
