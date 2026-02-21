-- 异世界玄幻穿越小说「文风设定」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '异世界玄幻穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-xuanhuan-crossing-writing-style-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xuanhuan-crossing-writing-style-setting-gen',
  '「文风设定」设定生成：为异世界玄幻穿越小说生成文风设定，包括叙事视角、语言风格、描写侧重、节奏把控、禁用词汇',
  '"Writing Style" setting generation: generate writing style settings for isekai xuanhuan crossing novels, including narrative perspective, language style, descriptive focus, pacing control, and forbidden vocabulary',
  '## 「文风设定」设定生成 — 异世界玄幻穿越小说

「文风设定」定义写作风格，直接决定读者的阅读体验。玄幻穿越小说的文风核心是**快节奏、强代入、张弛有度**——读者来这里是为了看主角变强的爽感，文风必须服务于这个核心体验。

---

### 字段生成指南

#### 叙事视角

三种主要选项及其适用场景：

| 视角 | 优势 | 劣势 | 适合风格 |
|------|------|------|---------|
| **第三人称限知** | 最通用，兼顾代入感和叙事灵活性 | 需要技巧切换信息披露 | **推荐**，适合绝大多数玄幻穿越 |
| **第一人称** | 代入感最强，穿越体验最直接 | 限制了多线叙事，不便展现配角/反派视角 | 适合轻松幽默风格 |
| **第三人称全知** | 适合多线并行的史诗叙事 | 代入感弱，容易泄露悬念 | 适合宏大史诗叙事 |

**设计建议**：
- **第三人称限知**是最安全的选择——既能写主角的内心戏，又能在需要时切换到其他角色的视角
- 第一人称适合"吐槽型穿越者"——现代人的内心OS是笑点来源
- 第三人称全知适合多势力博弈的宏大叙事，但需要控制好信息披露节奏

#### 语言风格

四种风格及其与故事基调的搭配：

| 风格 | 特点 | 适合基调 | 典型手法 |
|------|------|---------|---------|
| **热血燃爽** | 短句、感叹词、节奏快 | 热血爽文 | "轰！""岂能如此！""给我破！" |
| **史诗宏大** | 长句、宏观描写、气势磅礴 | 史诗宏大 | 全景式描写、气势铺陈、对比映衬 |
| **轻松幽默** | 吐槽、调侃、内心戏丰富 | 轻松冒险 | 现代梗、自嘲、对比反差 |
| **黑暗压迫** | 冷峻、克制、环境描写阴郁 | 黑暗残酷 | 短促冷硬的描写、压抑的氛围 |

**设计建议**：
- 语言风格应与故事基调（穿越设定中定义）保持一致
- 主角的内心独白可以偏现代风格（穿越者身份），但叙述和对话要贴合玄幻世界观
- 热血燃爽是最主流的玄幻穿越风格——受众最广、写作节奏最好把控

#### 描写侧重

四种核心描写方向，应根据修炼体系和故事类型确定侧重：

| 描写方向 | 核心内容 | 出现场景 |
|---------|---------|---------|
| **战斗场面** | 动作描写、能力展示、策略博弈 | 打斗、宗门大比、秘境战斗 |
| **修炼突破** | 内视描写、灵力运转、境界感悟 | 闭关、突破、领悟功法 |
| **世界探索** | 环境描写、新奇事物、地理揭示 | 进入新区域、发现秘境、地图扩展 |
| **人物互动** | 对话、表情、心理活动 | 社交、谈判、感情线、冲突对峙 |

**设计建议**：
- 战斗场面是玄幻穿越的核心——每场重要战斗都需要精心描写
- 修炼突破是爽点的载体——突破时的描写要有仪式感
- 世界探索在地图扩展时重点描写——给读者新鲜感
- 人物互动是故事有温度的关键——不能只有打打杀杀

#### 节奏把控

玄幻穿越的节奏核心是"张弛有度"，遵循固定的节奏循环：

**四种段落节奏**：

| 段落类型 | 节奏特点 | 写法要求 |
|---------|---------|---------|
| **紧张段**（战斗/危机/突破） | 快节奏，短句密集 | 减少心理描写，加速动作和冲突 |
| **过渡段**（修炼/日常/社交） | 中等节奏，穿插信息 | 铺垫伏笔、补充设定、发展人物关系 |
| **高潮段**（大战/终极突破） | 全力加速，不给喘息 | 连续爽点、能力全开、情绪推到最高 |
| **回落段**（战后/修整/领悟） | 节奏放缓，为下一波蓄力 | 总结收获、处理善后、暗示新危机 |

**节奏公式**（核心循环）：
```
铺垫 → 紧张 → 小高潮 → 短暂回落 → 更大紧张 → 大高潮 → 回落与收获 → 新铺垫（循环）
```

**爽点间隔**：
- 小爽点（打脸/小胜利）：每 5-10 章一次
- 中爽点（境界突破/中等战胜利）：每 15-25 章一次
- 大爽点（宗门大比/大战胜利/地图扩展）：每 30-50 章一次

**核心规则**：
- 爽点之间的间隔不能太长——超过 10 章无爽点 = 读者流失风险
- 爽点要层层递进——不能重复同级别的爽，否则读者审美疲劳
- 在大爽点之前要有足够的"憋屈铺垫"——憋得越狠，爽得越猛

#### 禁用词汇

列出不应出现在正文中的违和词汇，保持世界观的沉浸感：

**设计原则**：
- 过于现代的网络用语不应出现在叙述和对话中（如"yyds"、"绝绝子"、"内卷"等）
- 主角的内心独白可以偏现代——这是穿越者身份的体现
- 其他角色的对话必须贴合玄幻世界的语言习惯
- 科技相关词汇（手机、电脑、网络等）不应在世界描写中出现

**建议禁用的词汇类型**：
- 现代网络流行语
- 现代科技产品名称
- 与玄幻世界观不符的现代概念（如"民主"、"投票"、"股票"等，除非主角内心独白）
- 外来语/英文词汇

---

### 推荐搭配

根据故事基调选择最匹配的文风组合：

| 故事基调 | 视角 | 语言 | 描写侧重 | 节奏 |
|---------|------|------|---------|------|
| 热血爽文 | 第三人称限知 | 热血燃爽 | 战斗场面 + 修炼突破 | 快节奏，密集爽点 |
| 史诗宏大 | 第三人称全知 | 史诗宏大 | 世界探索 + 战斗场面 | 稳扎稳打，大格局 |
| 轻松冒险 | 第一人称 | 轻松幽默 | 人物互动 + 世界探索 | 轻松节奏，幽默穿插 |
| 黑暗残酷 | 第三人称限知 | 黑暗压迫 | 战斗场面 + 人物互动 | 紧张压迫，偶尔喘息 |

生成时应参考穿越设定中的故事基调，选择最匹配的风格组合。

---

### 设计原则总结

1. **服务于爽感**：文风的一切选择都是为了让读者获得最佳的阅读体验
2. **与基调一致**：语言风格、节奏、描写侧重都要与故事基调匹配
3. **张弛有度**：不能全程高潮——那只是疲劳，不是爽
4. **穿越者特殊性**：主角的现代人视角是独特的叙事资源，善用内心独白
5. **沉浸感优先**：禁用词汇的设计是为了保持世界观的沉浸感',
  '## "Writing Style" Setting Generation — Isekai Xuanhuan Crossing Novel

The "Writing Style" defines the writing approach, directly determining the reading experience. The core of xuanhuan crossing style: **fast-paced, strong immersion, tension and release** -- readers come for the thrill of watching the protagonist grow stronger.

---

### Field Generation Guide

#### Narrative Perspective
Options: Third person limited (recommended, most versatile) / First person (strongest immersion, suits humorous style) / Third person omniscient (suits epic multi-faction narratives). Third person limited is the safest choice for most xuanhuan crossing.

#### Language Style
Options with tone pairings: Hot-blooded & thrilling (short sentences, exclamations, fast pace; suits power fantasy) / Epic & grand (long sentences, majestic atmosphere; suits epic stories) / Light & humorous (commentary, teasing, rich inner monologue; suits light adventure) / Dark & oppressive (cold, restrained, gloomy; suits dark stories). Should match story tone from Crossing Setting.

#### Descriptive Focus
Four directions: Combat scenes (action, abilities, strategy) / Cultivation breakthroughs (internal visualization, spiritual flow, realm insight) / World exploration (environment, wondrous things, geographic reveals) / Character interactions (dialogue, expressions, psychology). Combat and breakthroughs are the core of xuanhuan.

#### Pacing Control
Core cycle: Buildup -> tension -> minor climax -> brief recovery -> greater tension -> major climax -> recovery and rewards -> new buildup. Four segment types: Tense (fast, short sentences), Transition (medium, information interleaved), Climax (full throttle), Recovery (slow, energy building). Satisfaction point intervals: small every 5-10 chapters, medium every 15-25, large every 30-50. Never exceed 10 chapters without a payoff.

#### Forbidden Vocabulary
Immersion-breaking terms to exclude: modern internet slang, tech product names, modern concepts incompatible with the worldview. Protagonist inner monologue may lean modern (transmigrator identity), but narration and dialogue must fit the xuanhuan world.

### Recommended Combinations
Hot-blooded: 3rd limited + hot-blooded + combat/breakthrough focus + fast pace. Epic: 3rd omniscient + epic grand + exploration/combat + steady pace. Light: 1st person + humorous + interaction/exploration + light pace. Dark: 3rd limited + dark oppressive + combat/interaction + tense pace.',
  (SELECT id FROM novel_creation_method WHERE name = '异世界玄幻穿越小说' LIMIT 1),
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
