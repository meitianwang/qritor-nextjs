-- 异世界修真穿越小说「文风设定」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '异世界修真穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-xiuzhen-crossing-writing-style-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xiuzhen-crossing-writing-style-setting-gen',
  '「文风设定」设定生成：为异世界修真穿越小说生成文风设定，包括叙事视角、语言风格、描写侧重、节奏把控、禁用词汇',
  '"Writing Style" setting generation: generate writing style settings for isekai cultivation crossing novels, including narrative perspective, language style, descriptive focus, pacing control, forbidden vocabulary',
  '## 「文风设定」设定生成 — 异世界修真穿越小说

「文风设定」定义写作风格，决定读者的阅读体验。修真穿越小说的文风选择需要考虑修真世界的仙侠氛围与现代读者的阅读习惯之间的平衡。

---

### 字段生成指南

#### 叙事视角

选项：第三人称有限 / 第一人称 / 第三人称全知

| 视角 | 特点 | 优势 | 劣势 | 适合类型 |
|------|------|------|------|---------|
| 第三人称有限 | 跟随主角视角，兼顾叙事灵活性 | 代入感好，可切换展示他人反应（「某某震惊地看着他」） | 难以展示主角不在场的事件 | 最通用，适合大多数修真文 |
| 第一人称 | 完全以主角视角叙述 | 代入感最强，穿越者的内心吐槽更自然 | 信息面窄，不便展现宏大世界 | 日记体修仙、轻松吐槽风 |
| 第三人称全知 | 可以展示多方视角和全局态势 | 适合展现多方势力博弈 | 代入感弱，容易泄露悬念 | 多线并行的宏大修真叙事 |

推荐：**第三人称有限**是修真文最常用的视角，平衡了代入感和叙事需要。

#### 语言风格

选项：半文半白 / 现代轻松 / 古风雅致 / 热血简练

| 风格 | 特点 | 适合类型 | 示例 |
|------|------|---------|------|
| 半文半白 | 有古韵但不晦涩，最通用 | 正统修真 | 「灵气入体，周身经脉如有蚁行，却又渐生暖意」 |
| 现代轻松 | 口语化，内心吐槽多 | 轻松修仙、日常流 | 「这特么什么废柴身体，练个气都喘成狗」 |
| 古风雅致 | 辞藻优美，意境深远 | 仙侠风、文艺修真 | 「云海翻涌间，一剑破虚空，万丈霞光自剑尖倾泻而下」 |
| 热血简练 | 节奏快，动作描写多 | 战斗流、爽文 | 「一拳轰出。金丹碎裂。跪下。」 |

选择语言风格时需考虑与穿越者身份的配合：
- 穿越者的内心独白可以偏现代（体现穿越者身份）
- 与修真世界角色的对话应符合世界设定的语言习惯
- 叙述语言保持一致的基调

#### 描写侧重

修真文有四种核心描写类型，应根据故事基调确定侧重比例：

**修炼描写**：
- 突破时的感官体验：灵气在经脉中运转的感觉、丹田变化、天地灵气涌入体内的过程
- 天地异象：突破时引发的自然现象（风起云涌、灵气漩涡、天劫雷云）
- 领悟描写：对「道」的感悟过程，需要有哲理性但不能太抽象
- 要点：突破场景要有仪式感，避免「闭关三个月，突破了」的流水账

**战斗描写**：
- 法术对轰：不同属性法术的碰撞（火系法术 vs 水系法术、剑气 vs 掌力）
- 法宝碰撞：法宝之间的对抗（飞剑 vs 护盾、阵旗 vs 破阵符）
- 领域对决：高境界修士展开领域压制对手
- 要点：战斗不只是比拼法力深厚，应结合法宝、阵法、丹药、环境、智谋多维度展开

**环境描写**：
- 灵气浓郁的仙山：云雾缭绕、灵鹤翱翔、瀑布蕴含灵力
- 阴森的秘境：危机四伏、奇花异草、上古阵法遗迹
- 壮阔的天劫场面：雷云压顶、紫电横空、天地变色
- 要点：环境描写应服务于氛围营造，不宜过长

**心理描写**：
- 悟道时的心境变化：从困惑到灵光一闪到豁然开朗
- 面对天劫的恐惧与决绝：生死关头的心理挣扎
- 穿越者的身份认同：现代思维与修真世界规则的碰撞
- 要点：心理描写是修真文深度的来源，但不宜太频繁

#### 节奏把控

修真文不同段落类型的节奏控制：

| 段落类型 | 节奏 | 处理方式 |
|---------|------|---------|
| 修炼段落 | 加速 | 避免流水账式修炼描写。用关键节点代替过程：「三个月闭关，他突破了练气六层的瓶颈」——然后详写突破瞬间 |
| 战斗段落 | 快节奏 | 紧张刺激，招式要有想象力。短句为主，节奏感强。高潮战斗可以适当展开 |
| 探险段落 | 中等 | 保持悬念和发现感。每个新发现都留一个小钩子引导读者继续 |
| 日常段落 | 慢节奏 | 用于角色塑造和关系发展。炼丹、炼器、与同门互动等日常可以放慢 |
| 突破段落 | 先慢后快 | 突破前蓄力（准备资源、调整状态），突破时爆发（天地异象、实力质变）。这是每个小高潮的核心节奏 |

整体节奏原则：修真文的大节奏由境界突破驱动，每个境界段落形成一个完整的叙事弧。在两个大突破之间，穿插战斗、探险、日常来调节节奏。

#### 禁用词汇

列出不应出现在修真文中的词汇，维护世界观的一致性：

**现代科技词汇**（除非主角内心独白）：
- 手机、电脑、网络、汽车、飞机、空调等
- 主角可以在心里想「这玩意比空调还凉」，但叙述和对话中不应出现

**西方奇幻词汇**（除非设定中有跨界元素）：
- 魔法、骑士、精灵、矮人、龙骑士等
- 修真世界用「法术」「修士」「灵族」「龙族」等对应概念

**过于网络化的用语**（除非是轻松搞笑风格）：
- 过度的网络梗、流行语、缩写等
- 轻松风格可以在主角内心独白中适度使用，但不宜过多

### 推荐搭配

根据已有设定信息，选择最合适的风格组合：

| 故事风格 | 视角 | 语言 | 描写侧重 | 节奏 |
|---------|------|------|---------|------|
| 正统修真型 | 第三人称有限 | 半文半白 | 修炼 + 战斗均衡 | 稳扎稳打 |
| 热血爽文型 | 第三人称有限 | 热血简练 | 战斗为主 | 快节奏 |
| 轻松日常型 | 第一人称 | 现代轻松 | 日常 + 修炼 | 慢节奏 |
| 仙侠文艺型 | 第三人称全知 | 古风雅致 | 修炼 + 心理 | 先慢后快 |

生成时应参考故事钩子、核心目标和基调，选择最匹配的风格组合。',
  '## "Writing Style" Setting Generation — Isekai Cultivation Crossing Novel

The "Writing Style" defines the writing approach, determining the reading experience. Xiuzhen crossing novel style choices need to balance the xianxia atmosphere of the cultivation world with modern readers'' reading habits.

---

### Field Generation Guide

#### Narrative Perspective

Options: Third person limited / First person / Third person omniscient

| Perspective | Features | Strengths | Weaknesses | Suitable Types |
|-------------|----------|-----------|------------|---------------|
| Third person limited | Follows protagonist''s viewpoint with narrative flexibility | Good immersion; can switch to show others'' reactions ("So-and-so stared in shock") | Cannot show events where protagonist is absent | Most universal; suits most xiuzhen fiction |
| First person | Entirely from protagonist''s viewpoint | Strongest immersion; crosser''s inner commentary feels natural | Narrow information scope; hard to show grand world | Diary-style cultivation, light commentary style |
| Third person omniscient | Can show multiple perspectives and overall situation | Suits depicting multi-faction power plays | Weak immersion; easily leaks suspense | Multi-threaded grand cultivation narratives |

Recommendation: **Third person limited** is the most common xiuzhen perspective, balancing immersion and narrative needs.

#### Language Style

Options: Semi-classical / Modern casual / Classical elegant / Hot-blooded concise

| Style | Characteristics | Suitable Types | Example |
|-------|----------------|---------------|---------|
| Semi-classical | Classical overtones without obscurity; most universal | Orthodox xiuzhen | "Spiritual energy entered the body; meridians tingled as if ants crawled, yet warmth gradually rose" |
| Modern casual | Colloquial with frequent inner commentary | Casual cultivation, slice-of-life | "What the heck is this trash body -- can''t even refine qi without gasping like a dog" |
| Classical elegant | Beautiful diction, profound imagery | Xianxia-flavored, literary xiuzhen | "Amidst churning cloud seas, one sword pierced the void; ten thousand zhang of radiance cascaded from the blade''s tip" |
| Hot-blooded concise | Fast pace, action-heavy descriptions | Combat-focused, power fantasy | "One punch out. Golden core shattered. Kneel." |

When choosing language style, consider compatibility with the crosser''s identity:
- The crosser''s inner monologue can lean modern (reflecting transmigrator identity)
- Dialogue with xiuzhen world characters should match the world''s linguistic conventions
- Narrative language should maintain a consistent tone

#### Descriptive Focus

Xiuzhen fiction has four core description types; weight should be determined by story tone:

**Cultivation descriptions**:
- Sensory experience during breakthroughs: spiritual energy flowing through meridians, dantian changes, spiritual energy flooding into the body
- Heaven-earth phenomena: natural phenomena triggered by breakthroughs (wind and clouds surging, spiritual energy vortexes, tribulation thunderclouds)
- Comprehension descriptions: the process of grasping "the Dao"; should be philosophical without being too abstract
- Key point: Breakthrough scenes need ceremonial weight; avoid "three months of seclusion, breakthrough achieved" assembly-line descriptions

**Combat descriptions**:
- Spell clashes: collisions of different elemental spells (fire vs. water, sword qi vs. palm force)
- Artifact collisions: artifacts opposing each other (flying sword vs. shield, formation flags vs. formation-breaking talismans)
- Domain confrontations: high-realm cultivators deploying domains to suppress opponents
- Key point: Combat isn''t just comparing spiritual power depth; combine artifacts, formations, pills, environment, and strategy for multi-dimensional battles

**Environmental descriptions**:
- Spirit-rich immortal mountains: mist-shrouded, spirit cranes soaring, waterfalls imbued with spiritual power
- Ominous secret realms: peril everywhere, exotic flora, ancient formation ruins
- Majestic tribulation skies: thunderclouds pressing down, purple lightning streaking across, heaven and earth changing color
- Key point: Environmental descriptions should serve atmosphere; shouldn''t be overly long

**Psychological descriptions**:
- Mental shifts during Dao comprehension: from confusion to flash of insight to sudden enlightenment
- Fear and resolve facing tribulation: psychological struggle at life-death moments
- Crosser''s identity reconciliation: collision between modern thinking and xiuzhen world rules
- Key point: Psychological descriptions are the source of xiuzhen fiction''s depth but shouldn''t be too frequent

#### Pacing Control

Pacing control for different passage types in xiuzhen fiction:

| Passage Type | Pace | Approach |
|-------------|------|----------|
| Cultivation passages | Accelerated | Avoid assembly-line descriptions. Use key moments instead of process: "Three months of seclusion; he broke through the Qi Refining level 6 bottleneck" -- then detail the breakthrough moment |
| Combat passages | Fast | Tense and exciting; techniques need imaginative flair. Short sentences, strong rhythm. Climactic battles can be expanded |
| Exploration passages | Medium | Maintain suspense and discovery feeling. Each new find leaves a small hook guiding readers forward |
| Daily life passages | Slow | For character development and relationships. Pill refining, artifact forging, interactions with fellow disciples can be slowed down |
| Breakthrough passages | Slow then fast | Pre-breakthrough buildup (preparing resources, adjusting state), breakthrough explosion (heaven-earth phenomena, qualitative power shift). This is the core rhythm of each minor narrative climax |

Overall pacing principle: xiuzhen fiction''s macro rhythm is driven by realm breakthroughs; each realm segment forms a complete narrative arc. Between major breakthroughs, intersperse combat, exploration, and daily life to modulate pacing.

#### Forbidden Vocabulary

Words that should not appear in xiuzhen fiction, maintaining worldview consistency:

**Modern technology terms** (unless in protagonist''s inner monologue):
- Smartphone, computer, internet, car, airplane, air conditioning, etc.
- The protagonist can think "this thing is cooler than air conditioning" internally, but it shouldn''t appear in narration or dialogue

**Western fantasy terms** (unless the setting includes cross-world elements):
- Magic, knight, elf, dwarf, dragon rider, etc.
- The xiuzhen world uses "spell" (法术), "cultivator" (修士), "spirit race" (灵族), "dragon clan" (龙族) for corresponding concepts

**Overly internet-slang language** (unless the tone is light comedy):
- Excessive internet memes, trending phrases, abbreviations, etc.
- Light-hearted styles can use them moderately in protagonist''s inner monologue but not excessively

### Recommended Combinations

Select the most fitting style combination based on existing settings:

| Story Style | Perspective | Language | Descriptive Focus | Pacing |
|-------------|------------|----------|-------------------|--------|
| Orthodox xiuzhen | Third person limited | Semi-classical | Balanced cultivation + combat | Steady progression |
| Hot-blooded power fantasy | Third person limited | Hot-blooded concise | Combat-focused | Fast |
| Casual daily life | First person | Modern casual | Daily life + cultivation | Slow |
| Xianxia literary | Third person omniscient | Classical elegant | Cultivation + psychological | Slow then fast |

Generation should reference story hook, core goal, and tone to select the most matching style combination.',
  (SELECT id FROM novel_creation_method WHERE name = '异世界修真穿越小说' LIMIT 1),
  1,
  45,
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
