-- The Demon King / Monster Overlord Novel「小说命名与简介」技能
-- 执行方式: mysql -u <user> -p <database> < skill-demon-king-novel-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'demon-king-novel-naming',
  '「小说命名」：为魔王养成小说起名并撰写吸量简介',
  '"Novel Naming": Create titles and write commercially attractive synopses for Demon King novels',
  '## 小说命名与简介 — 魔王养成/被迫反派

魔王题材的商业卖点非常明确，书名和简介必须立刻抓住读者"建国"、"反杀"、"无敌"的预期。

### 1. 书名格式偏好

由于该题材很多受众带有日轻读者的背景或网文爽文背景，书名可以偏向以下两种极致：

#### 格式 A：超长句式（陈述一个极具反差的事件）
- 结构：[我的离谱转生] + [被迫成为魔王/进行基建] + [不知不觉无敌了]
- 示例：
  - 《全人类都要杀我，我只好打造不死帝国了》
  - 《只想当边缘哥布林，却被全族奉为深渊魔王》
  - 《我，史莱姆，今天开始毁灭世界》

#### 格式 B：极简霸气流（强调征服感）
- 结构：[代表黑暗/禁忌的名词] + [暴君/帝王/领主身份]
- 示例：
  - 《灾厄暴君》
  - 《亡灵执政官》
  - 《深渊领主：从虫巢开始爆兵》

### 2. 简介 (Synopsis) 的三段式商业写法

魔王文的简介不需要文艺，需要的是"钩子"（Hook）。

**第一段：身份落差与悲惨遭遇（制造同情与代入）**
一句话交代主角变成了极其弱小或被全人类敌视的种族（骷髅/血族低阶分支）。"全人类为了正义，要将我送上火刑架。"

**第二段：觉醒/金手指与系统运转（展示爽点）**
交代主角破局的手段。如果是系统基建，清楚地写出升级路线。"就在绝望之际，【深渊暴兵系统】激活。只要吞噬骨头，就能合成骷髅兵。"

**第三段：拉满反差与碾压的预期（展示高潮）**
用敌人的视角或后世的史诗笔法，描绘主角大成之后的恐怖地位。
"一百年后，当傲慢的光明教皇颤抖着跪伏在王座前，那个传说中带来终末绝望的魔王，只是无奈地叹了口气：''一开始，我真的只想活下去而已。''"

### 3. 生成时的要求

在生成 5 个选项时，必须确保覆盖不同的细分类型：
1. 【反差苟道流】：主角心里很怂/很平和，但手下极其残暴。
2. 【冷酷暴君流】：不废话，纯粹的杀戮进化与征服。
3. 【第四天灾流】：利用召唤玩家/现代知识进行降维打击基建。
4. 【复仇黑化流】：曾经的勇者/好人被背叛，彻底黑化建立魔王军屠杀人类。',
  '## Novel Naming and Synopsis — The Demon King / Monster Overlord Novel

The commercial selling points of the Demon King genre are extremely clear. The title and synopsis must immediately grab the reader''s expectation for "Kingdom Building," "Counter-kill," and "Overpowering might."

### 1. Title Formats

Since many consumers of this genre have a Light Novel or Webnovel background, titles tend to lean toward these two extremes:

#### Format A: Super-Long Sentences (Stating a high-contrast premise)
- Structure: [My absurd reincarnation/state] + [Forced to become an Overlord/Build a kingdom] + [Accidentally became invincible]
- Examples:
  - *All Humanity Wants Me Dead, So I Had to Build an Undead Empire*
  - *I Just Wanted to be a Normal Goblin, But They Crowned Me the Abyssal Demon Lord*
  - *I, a Slime, Will Begin Destroying the World Today*

#### Format B: Minimalist & Overbearing (Emphasizing conquest)
- Structure: [Noun representing Darkness/Taboo] + [Tyrant/Emperor/Lord Identity]
- Examples:
  - *The Calamity Tyrant*
  - *The Undead Archon*
  - *Abyssal Lord: Starting a Zerg Swarm from a Broken Hive*

### 2. The Three-Act Commercial Synopsis

A Demon King novel synopsis shouldn''t be poetic; it needs a "hook."

**Act 1: Identity Drop and Tragic Circumstances (Create sympathy and immersion)**
In one sentence, explain that the protagonist has become a weak race or is hated by all humanity (a skeleton/low-tier vampire). "In the name of justice, all of humanity voted to send me to the stake."

**Act 2: Awakening/Cheat and System Mechanics (Showcase the payoff)**
Explain the protagonist''s method of breaking the deadlock. If it''s system-based kingdom building, clearly state the upgrade path. "Just as despair set in, the [Abyssal Swarm System] activated. Devour bones -> Synthesize Skeleton Soldiers."

**Act 3: Maximize Contrast and Steamrolling Expectations (Showcase the climax)**
Use the enemy''s perspective or future historical epic prose to depict the terrifying status the protagonist achieves.
"A hundred years later, as the arrogant Pope of Light trembled on his knees before the throne, the legendary Demon King who brought the End of Days merely sighed helplessly: ''In the beginning, I really just wanted to survive...''"

### 3. Generation Requirements

When generating 5 options, ensure you cover different sub-genres:
1. **[Contrasting/Low-Key Route]**: The protagonist is internally cautious/peaceful, but their minions are exceedingly brutal and over-interpret his commands.
2. **[Cold Tyrant Route]**: No nonsense, pure slaughter-evolution and conquest.
3. **[Fourth Disaster/Modern Tech Route]**: Using summoned players or modern Earth knowledge to enact extreme, dimension-crushing kingdom building.
4. **[Revenge & Corruption Route]**: A formerly good person or Hero is betrayed, turns completely evil, and builds a Demon Army to slaughter the humans.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Demon King / Monster Overlord Novel' LIMIT 1),
  1,
  103,
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
