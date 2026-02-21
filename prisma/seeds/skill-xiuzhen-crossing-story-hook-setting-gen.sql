-- 异世界修真穿越小说「故事钩子」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '异世界修真穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-xiuzhen-crossing-story-hook-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xiuzhen-crossing-story-hook-setting-gen',
  '「故事钩子」设定生成：为异世界修真穿越小说生成故事钩子设定，包括故事钩子、核心卖点、开篇悬念、读者期待',
  '"Story Hook" setting generation: generate story hook settings for isekai cultivation crossing novels, including story hook, core selling point, opening suspense, reader expectations',
  '## 「故事钩子」设定生成 — 异世界修真穿越小说

「故事钩子」是整个创作的起点，决定故事的核心吸引力。修真穿越的故事钩子通常围绕「逆袭」展开——废材翻身、绝境求生、逆天改命。好的故事钩子必须在第一章就抓住读者，让人忍不住往下看。

---

### 字段生成指南

#### 故事钩子

一句话概括故事的核心吸引力。修真穿越的钩子公式：**废材身份 + 紧迫危机 + 逆转承诺**

优秀示例：
- "穿越成宗门废材弟子，三天后就是宗门大比，金手指刚觉醒"
- "魂穿即将被灭门的小宗门弟子，距离魔宗围攻还有一百天"
- "穿越成被退婚的世家旁系子弟，废灵根觉醒变异天灵根"
- "穿越后发现原身被逐出宗门，怀中只有一块不知名的破铜片——上古仙器碎片"

常见修真穿越钩子模式：
- **废材觉醒型**：废材弟子觉醒，在宗门大比前夕获得金手指
- **灭门倒计时型**：穿越后发现宗门三个月后就会被灭门
- **被逐逆袭型**：原身被退婚/被逐出宗门，立誓要让所有人后悔
- **遗迹机缘型**：穿越时意外闯入上古遗迹，获得传承

避免：
- 没有紧迫感的设定（"穿越成宗主安稳修炼"）
- 没有具体冲突的设定（"穿越到修真世界看看"）
- 金手指一开始就太强的设定（"穿越即无敌"）

#### 核心卖点

区别于其他修真穿越的独特之处。好的卖点需要差异化——不是「又一个系统流修真文」，而是有独特的吸引力。

核心卖点方向：
- **独特的修炼体系**：不是千篇一律的境界划分，有自己的特色（如：修炼与音律结合、以棋入道、炼丹为核心的修炼路线）
- **新颖的金手指**：不是万能系统，而是有独特限制和成长路径的能力（如：能看见灵气流动但看一次瞎三天、可以与灵植对话但不能与人对话）
- **独特的宗门设定**：不是模板化的宗门，有独特的文化和规则（如：以炼丹为核心的丹宗、以阵法闻名的阵道宗）
- **非战斗核心路线**：丹道/器道/阵道为核心的修真故事，区别于纯战斗流

卖点公式：**独特元素 × 修真场景 = 差异化吸引力**

#### 开篇悬念

前三章就要建立的悬念，是留住读者的关键。修真穿越的开篇应做到「穿越即危机」：

**第一危机**（第一章）：
- 穿越后面临的第一个危机（宗门试炼、被人挑衅、资源被抢、即将被清退）
- 危机应足够紧迫——不是「三年后有个大比」，而是「三天后」

**金手指初现**（前三章）：
- 金手指的首次展示，但不要一次性展示全部能力
- 展示应自然融入危机解决中——用金手指化解第一危机的一部分，但不完全解决
- 留下「这东西还有更多能力」的暗示

**更大阴谋/机缘暗示**（前三章）：
- 暗示背后有更大的阴谋或机缘
- 例如：废材弟子被欺负的背后，是长老故意打压以夺取原身的隐藏血脉
- 例如：宗门即将被灭的原因不只是实力差距，还牵涉到上古秘密

#### 读者期待

明确读者追书的核心期待，决定故事的核心爽感方向：

| 期待类型 | 核心爽感 | 实现方式 |
|---------|---------|---------|
| **升级爽感** | 境界突破的满足感 | 每次突破都有仪式感：天地异象、实力质变、旁人震惊 |
| **打脸快感** | 废材逆袭打脸装逼者 | 曾经看不起主角的人一个个被打脸，「你当初说我废物？」 |
| **探索乐趣** | 秘境探险、丹药法宝收集 | 每个秘境都有新发现，每件法宝都有独特能力 |
| **智斗快感** | 以弱胜强的策略博弈 | 不是纯粹比拼法力，而是利用环境、法宝、阵法、丹药的组合策略 |

多数修真穿越以「升级爽感 + 打脸快感」为主，辅以「探索乐趣」。智斗快感适合稳扎稳打型故事。

生成时应根据已有的穿越身份、金手指类型和故事基调，选择最匹配的核心期待组合。',
  '## "Story Hook" Setting Generation — Isekai Cultivation Crossing Novel

The "Story Hook" is the starting point of the entire creation, determining the story''s core appeal. Xiuzhen crossing hooks typically revolve around "the underdog comeback" -- trash-to-treasure, surviving desperate situations, defying fate. A good story hook must grab readers in the first chapter and make them compulsive page-turners.

---

### Field Generation Guide

#### Story Hook

A one-sentence summary of the story''s core appeal. Xiuzhen crossing hook formula: **Trash identity + Urgent crisis + Reversal promise**

Good examples:
- "Transmigrated as a sect''s trash disciple, sect tournament in three days, cheat ability just awakened"
- "Soul-transmigrated into a disciple of a small sect about to be annihilated, 100 days until the demonic sect''s siege"
- "Transmigrated as a branch clan scion jilted by a fiance, waste spirit root awakens into variant heavenly spirit root"
- "After transmigrating, discovers the original body was expelled from the sect with only an unidentified copper shard -- an ancient immortal artifact fragment"

Common xiuzhen crossing hook patterns:
- **Trash awakening**: Waste disciple awakens and gains cheat ability on the eve of the sect tournament
- **Annihilation countdown**: After crossing, discovers the sect will be destroyed in three months
- **Expelled underdog**: Original body was jilted/expelled, vows to make everyone regret it
- **Ruin fortune**: Accidentally stumbles into ancient ruins during crossing, obtains legacy

Avoid:
- Settings without urgency ("Transmigrated as sect master, cultivating peacefully")
- Settings without specific conflict ("Went to the xiuzhen world to look around")
- Overpowered start ("Transmigrated and immediately invincible")

#### Core Selling Point

What makes this distinct from other xiuzhen crossing stories. Good selling points need differentiation -- not "another system-genre xiuzhen novel" but something with unique appeal.

Selling point directions:
- **Unique cultivation system**: Not cookie-cutter realm ladders; has its own character (e.g., cultivation combined with music, Dao through chess, alchemy-centered cultivation path)
- **Novel cheat ability**: Not an all-purpose system; has unique limitations and growth path (e.g., can see spiritual energy flow but goes blind for three days each time; can talk to spirit plants but not to people)
- **Unique sect design**: Not a template sect; has distinctive culture and rules (e.g., alchemy-centered Pill Sect, formation-renowned Formation Dao Sect)
- **Non-combat core approach**: Alchemy/artifact-forging/formation-focused xiuzhen story, distinct from pure combat

Formula: **Unique element x Xiuzhen setting = Differentiated appeal**

#### Opening Suspense

Suspense to establish within the first three chapters -- the key to retaining readers. Xiuzhen crossing openings should achieve "transmigration = immediate crisis":

**First crisis** (Chapter 1):
- The first crisis faced after crossing (sect trial, provocation, resource theft, imminent expulsion)
- The crisis must be urgent -- not "a tournament in three years" but "in three days"

**Cheat ability debut** (First 3 chapters):
- First demonstration of the cheat ability, but don''t reveal everything at once
- The showcase should naturally integrate with crisis resolution -- the cheat partially resolves the first crisis but not completely
- Leave hints of "this thing has more capabilities"

**Greater conspiracy/fortune hints** (First 3 chapters):
- Hints at a larger conspiracy or opportunity behind the scenes
- E.g., the bullying of the trash disciple was orchestrated by an elder to seize the original body''s hidden bloodline
- E.g., the sect''s impending destruction isn''t just about power difference but involves ancient secrets

#### Reader Expectations

Clarify the core expectations readers are chasing, determining the story''s core satisfaction direction:

| Expectation Type | Core Satisfaction | Implementation |
|-----------------|-------------------|----------------|
| **Level-up satisfaction** | Fulfillment of realm breakthroughs | Every breakthrough has ceremony: heaven-earth phenomena, qualitative power shift, bystanders'' shock |
| **Face-slapping gratification** | Trash-turned-genius humiliating rivals | Those who looked down on the protagonist get face-slapped one by one: "You called me trash?" |
| **Exploration fun** | Secret realm adventures, pill and artifact collecting | Every secret realm has new discoveries; every artifact has unique abilities |
| **Strategic enjoyment** | Outwitting stronger opponents | Not pure power comparison but combined strategies using environment, artifacts, formations, and pills |

Most xiuzhen crossing stories center on "level-up satisfaction + face-slapping gratification" supplemented by "exploration fun." Strategic enjoyment suits steady-progression stories.

Generation should select the most fitting core expectation combination based on existing crossing identity, cheat ability type, and story tone.',
  (SELECT id FROM novel_creation_method WHERE name = '异世界修真穿越小说' LIMIT 1),
  1,
  44,
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
