-- 未来科幻穿越创作方法「穿越设定」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '未来科幻穿越创作' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-scifi-crossing-crossing-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'scifi-crossing-crossing-setting-gen',
  '「穿越设定」设定生成：为未来科幻穿越小说生成穿越设定，涵盖穿越方式、时间跨度、穿越身份、核心目标、金手指类型、金手指详情',
  '"Crossing Setting" setting generation: generate crossing settings for future sci-fi crossing novels, covering crossing method, time span, crossing identity, core goal, cheat-ability type, and cheat-ability details',
  '## 「穿越设定」设定生成 — 未来科幻穿越创作

「穿越设定」是 singleton 类型（只有一个实例），定义了主角如何穿越、穿越到什么处境、以及拥有什么能力。它与「科幻世界观」共同构成故事的两大基石。

**核心区别**：科幻穿越的穿越方式必须有科学（或伪科学）解释，这是与奇幻穿越的根本区别。奇幻穿越的「魂穿」在科幻语境下不适用——即使是最软的科幻，也需要一个看起来合理的技术框架。

---

### 字段生成指南

#### 穿越方式

科幻穿越方式必须有科学或伪科学解释。共 7 种可选，每种携带独特的叙事影响：

| 穿越方式 | 特点 | 叙事影响 |
|----------|------|---------|
| **人体冷冻苏醒** | 最硬核，有现实科学基础 | 主角身体物理存在，身份可追溯；适合硬科幻子类 |
| **时间机器故障** | 经典科幻设定 | 可以引入「回去」的可能性作为悬念线；适合时空穿越子类 |
| **意识上传网络** | 赛博朋克风格 | 主角可能没有肉体，身份认同成核心冲突；适合赛博朋克/AI 觉醒子类 |
| **虫洞穿越** | 太空歌剧风格 | 穿越的不可控性，可能跨越巨大时空距离；适合太空歌剧/异星文明子类 |
| **高维文明实验** | 软科幻/哲学向 | 存在「被观察」的紧张感——为什么被选中？适合异星文明/神级文明 |
| **平行宇宙置换** | 多元宇宙设定 | 可能有另一个自己的存在，身份冲突；适合时空穿越子类 |
| **系统传送** | 最接近奇幻，但可用科技包装 | 系统的背后是谁？为什么传送主角？适合软科幻 |

**选择要点**：穿越方式必须与科幻世界观的子类匹配。硬科幻穿越需要技术解释（人体冷冻、时间膨胀效应等）。穿越机制本身可以成为核心谜题——为什么是主角被穿越？是意外还是阴谋？

#### 时间跨度

时间跨度影响穿越者与未来世界的差距程度：

| 跨度 | 世界变化程度 | 穿越者处境 |
|------|-----------|----------|
| **50-100 年** | 技术代差明显，但文化尚有延续 | 适应难度中等，像「爷爷辈的人」 |
| **100-500 年** | 社会形态巨变，语言可能已有重大变化 | 适应难度高，文化冲击剧烈 |
| **500-1000 年** | 几乎是全新文明 | 主角如同原始人 |
| **1000 年以上** | 可能已非地球文明 | 极端鱼脱离水的状态 |

**生成要点**：时间跨度需与科幻世界观的文明等级一致。0 级文明通常对应 50-100 年跨度，3 级/神级文明对应 1000 年以上跨度。跨度越大，文化冲击阶段的素材越丰富。

#### 穿越身份

穿越身份决定了主角在未来社会的起始处境。共 7 种可选：

| 穿越身份 | 处境特点 | 叙事可能性 |
|----------|---------|----------|
| **非法移民** | 没有合法身份，被追捕 | 底层生存、身份伪造、地下社会 |
| **企业继承人** | 高起点但充满阴谋 | 权力斗争、企业政治、身份质疑 |
| **拾荒者** | 自由但危险的边缘生存 | 废土探索、发现秘密、逐步崛起 |
| **通缉犯** | 被误认或被嫁祸 | 追逃、洗冤、揭露阴谋 |
| **实验体** | 被研究/利用的对象 | 逃脱、反抗、发现真相 |
| **活化石** | 作为历史遗迹被保护/展览 | 从「展品」到「行动者」的转变 |
| **AI 载体** | 意识被植入 AI 系统 | 身份认同、虚实边界、觉醒叙事 |

**选择要点**：穿越身份决定了故事的开场调性。高起点身份（企业继承人）适合权谋向，低起点身份（非法移民、拾荒者）适合逆袭向。身份要与穿越方式逻辑自洽——人体冷冻苏醒的人更可能成为「活化石」或「实验体」，而非「企业继承人」。

#### 核心目标

核心目标是主线剧情的驱动力。共 6 种可选：

| 核心目标 | 叙事核心 | 情感基调 |
|----------|---------|---------|
| **回家路** | 寻找穿越回去的方法 | 乡愁、执着、最终的取舍 |
| **推翻公司** | 反抗垄断企业/暴政 | 热血、正义、革命叙事 |
| **探索真相** | 发现穿越的原因或世界的秘密 | 悬疑、层层剥茧 |
| **种族存续** | 拯救纯人类/某个种族 | 使命感、牺牲精神 |
| **星际主宰** | 权力野心、称霸星系 | 爽文、战略博弈 |
| **失落文明** | 寻找/恢复被遗忘的文明遗产 | 考古、探索、文化传承 |

**生成要点**：核心目标要与穿越身份和科幻世界观形成有机联系。例如：「非法移民」+ 赛博朋克世界 → 「推翻公司」是自然选择；「活化石」+ 高文明等级 → 「探索真相」或「失落文明」更合适。

#### 金手指类型

**核心设计理念——反向金手指**：科幻穿越的金手指不应该是碾压未来世界的武器，而应该是**填补认知差距的工具**或**提供独特视角的能力**。金手指应当帮助主角「桥接」差距，而非「碾压」未来。

共 8 种可选（含「无」选项）：

| 金手指类型 | 定位 | 设计要点 |
|-----------|------|---------|
| **超脑** | 增强学习/计算能力 | 帮助主角快速适应未来，但不让主角比未来人更聪明 |
| **纳米核心** | 体内纳米机器人 | 提供身体改造的起步能力，但无法与专业义体人对抗 |
| **外星科技库** | 知识数据库 | 提供另一条科技路线的知识，而非更高级的同类科技 |
| **基因编辑器** | 自我基因改造 | 慢慢缩小与强化人的差距，但有风险和副作用 |
| **预知** | 有限的未来片段 | 提供战术优势而非战略碾压 |
| **机械掌控** | 控制机械设备的能力 | 在高度自动化的社会中是双刃剑 |
| **位面交易系统** | 跨位面的资源获取 | 可以获得稀缺物资但有代价 |
| **无** | 纯靠主角自身 | 最硬核的写法，适合硬科幻，所有能力来自学习和适应 |

**选择要点**：金手指类型必须与科幻世界观兼容。赛博朋克世界适合「纳米核心」或「机械掌控」；硬科幻适合「超脑」或「无」；太空歌剧适合「外星科技库」。

#### 金手指详情

金手指详情是对金手指类型的展开描述，需要明确以下五个维度：

1. **具体能力表现**：金手指具体能做什么，上限在哪里
2. **获取方式**：主角如何得到这个能力（与穿越机制关联）
3. **使用限制**：冷却时间、副作用、能量消耗等
4. **成长路线**：能力如何随剧情推进而提升
5. **与科幻世界观的兼容性**：金手指在这个科技体系内如何被解释

**如果金手指类型选择「无」**：金手指详情应描述主角的核心生存策略——依靠什么来弥补与未来人的差距（如：跨时代的人文视角、失落知识、不依赖科技的生存能力、未被异化的「纯粹人性」等）。

---

### 生成注意事项

1. 穿越方式必须有科学/伪科学解释，不能用奇幻式的「魂穿」
2. 穿越方式要与科幻世界观的子类匹配（硬科幻 → 人体冷冻/时间机器；赛博朋克 → 意识上传）
3. 时间跨度要与文明等级一致
4. 穿越身份要与穿越方式逻辑自洽
5. 核心目标要与穿越身份和世界观形成有机联系
6. 金手指的设计核心是「桥接差距」而非「碾压未来」——这是科幻穿越与其他穿越类型最大的区别
7. 六个字段共同构成完整的穿越框架，每个字段的选择都会影响其他字段的合理范围',
  '## "Crossing Setting" Generation — Sci-Fi Crossing Creation

The "Crossing Setting" (穿越设定) is a singleton type (only one instance), defining how the protagonist crosses over, what situation they land in, and what abilities they possess. Together with the "Sci-Fi World Setting," it forms the story''s two foundational pillars.

**Core distinction**: Sci-fi crossing methods must have scientific (or pseudo-scientific) explanations — this is the fundamental difference from fantasy crossing. Fantasy''s "soul transmigration" does not apply in a sci-fi context. Even the softest sci-fi needs a plausible technical framework.

---

### Field Generation Guide

#### Crossing Method (穿越方式)

Must have a scientific or pseudo-scientific explanation. Seven options, each carrying unique narrative impact:

| Method | Characteristics | Narrative Impact |
|--------|----------------|-----------------|
| **Cryogenic Revival** (人体冷冻苏醒) | Hardest sci-fi; real scientific basis | Protagonist physically exists; identity traceable; suits hard sci-fi |
| **Time Machine Malfunction** (时间机器故障) | Classic sci-fi setup | Can introduce "return" possibility as a suspense thread; suits temporal crossing |
| **Consciousness Upload Network** (意识上传网络) | Cyberpunk style | Protagonist may lack a body; identity becomes core conflict; suits cyberpunk/AI awakening |
| **Wormhole Crossing** (虫洞穿越) | Space opera style | Uncontrollable crossing; may span vast spacetime distances; suits space opera/alien civilization |
| **Higher-Dimensional Experiment** (高维文明实验) | Soft sci-fi/philosophical | Creates tension of "being observed" — why was the protagonist chosen? Suits alien civilization/god-level |
| **Parallel Universe Swap** (平行宇宙置换) | Multiverse setup | Another version of yourself may exist; identity conflict; suits temporal crossing |
| **System Transmission** (系统传送) | Closest to fantasy, wrappable in tech | Who is behind the system? Why transport the protagonist? Suits soft sci-fi |

**Selection tips**: Crossing method must match the worldview''s sub-genre. Hard sci-fi needs technical explanations (cryogenics, time dilation, etc.). The crossing mechanism itself can become the core mystery — why this person? Accident or conspiracy?

#### Time Span (时间跨度)

Affects the degree of difference between crosser and future world:

| Span | Degree of Change | Crosser''s Situation |
|------|-----------------|---------------------|
| **50-100 years** | Noticeable tech gap; some cultural continuity | Moderate difficulty; like "a grandparent''s generation" |
| **100-500 years** | Social structure transformed; language may have changed significantly | High difficulty; intense culture shock |
| **500-1000 years** | Nearly an entirely new civilization | Protagonist is like a primitive |
| **1000+ years** | May no longer be Earth civilization | Extreme fish-out-of-water |

**Generation tip**: Time span should match the worldview''s civilization level. Level 0 typically corresponds to 50-100 years; Level 3/God-level corresponds to 1000+ years. Greater spans yield richer culture shock material.

#### Crossing Identity (穿越身份)

Determines the protagonist''s starting situation. Seven options:

| Identity | Situational Traits | Narrative Possibilities |
|----------|-------------------|------------------------|
| **Illegal Immigrant** (非法移民) | No legal identity, hunted | Underground survival, identity forgery, underworld society |
| **Corporate Heir** (企业继承人) | High starting point but full of conspiracies | Power struggles, corporate politics, identity questioning |
| **Scavenger** (拾荒者) | Free but dangerous fringe existence | Wasteland exploration, uncovering secrets, gradual rise |
| **Fugitive** (通缉犯) | Mistaken identity or framed | Chase, exoneration, exposing conspiracies |
| **Test Subject** (实验体) | Object of study/exploitation | Escape, resistance, discovering the truth |
| **Living Fossil** (活化石) | Protected/exhibited as a historical relic | Transformation from "exhibit" to "agent" |
| **AI Vessel** (AI 载体) | Consciousness implanted in an AI system | Identity questions, virtual-real boundaries, awakening narrative |

**Selection tips**: Crossing identity sets the story''s opening tone. High-start identities (corporate heir) suit political intrigue; low-start identities (illegal immigrant, scavenger) suit underdog narratives. Identity must be logically consistent with crossing method — a cryogenically revived person is more likely a "living fossil" or "test subject" than a "corporate heir."

#### Core Goal (核心目标)

The main plot''s driving force. Six options:

| Goal | Narrative Core | Emotional Tone |
|------|---------------|---------------|
| **The Way Home** (回家路) | Finding a way back | Nostalgia, determination, the final choice |
| **Topple the Corporation** (推翻公司) | Resistance against monopoly/tyranny | Passion, justice, revolutionary narrative |
| **Discover the Truth** (探索真相) | Uncovering the crossing''s reason or the world''s secret | Suspense, peeling back layers |
| **Species Survival** (种族存续) | Saving pure humans or a specific species | Sense of mission, self-sacrifice |
| **Interstellar Dominion** (星际主宰) | Power ambition, galactic conquest | Power fantasy, strategic gaming |
| **Lost Civilization** (失落文明) | Finding/restoring forgotten civilizational heritage | Archaeology, exploration, cultural legacy |

**Generation tip**: Core goal should form an organic connection with crossing identity and worldview. E.g., "illegal immigrant" + cyberpunk world -> "topple the corporation" is natural; "living fossil" + high civilization level -> "discover the truth" or "lost civilization" fits better.

#### Cheat-Ability Type (金手指类型)

**Core design concept — reverse cheat-ability**: Sci-fi crossing cheat-abilities should NOT crush the future world. Instead, they should be **tools to bridge the cognitive gap** or **abilities providing a unique perspective**. The cheat should help the protagonist "bridge" the gap, NOT "crush" the future.

Eight options (including "None"):

| Type | Positioning | Design Notes |
|------|------------|-------------|
| **Super-Brain** (超脑) | Enhanced learning/computation | Helps adapt quickly but doesn''t surpass future people''s intelligence |
| **Nano-Core** (纳米核心) | Internal nanobots | Starting body-modification capabilities but can''t rival professional cyborgs |
| **Alien Tech Library** (外星科技库) | Knowledge database | Alternative tech path knowledge, not superior versions of existing tech |
| **Gene Editor** (基因编辑器) | Self genetic modification | Gradually narrows gap with enhanced humans but carries risks and side effects |
| **Precognition** (预知) | Limited future fragments | Tactical advantage, not strategic domination |
| **Mechanical Mastery** (机械掌控) | Ability to control mechanical devices | Double-edged sword in highly automated society |
| **Planar Trade System** (位面交易系统) | Cross-dimensional resource acquisition | Can obtain scarce resources but at a cost |
| **None** (无) | Relying purely on the protagonist | Hardest-core approach; suits hard sci-fi; all abilities from learning and adaptation |

**Selection tips**: Cheat type must be compatible with the worldview. Cyberpunk suits "nano-core" or "mechanical mastery"; hard sci-fi suits "super-brain" or "none"; space opera suits "alien tech library."

#### Cheat-Ability Details (金手指详情)

Expands on the cheat type across five dimensions:

1. **Concrete ability manifestations**: What exactly the cheat can do and its upper limits
2. **Acquisition method**: How the protagonist obtained it (linked to crossing mechanism)
3. **Usage limitations**: Cooldown, side effects, energy consumption, etc.
4. **Growth path**: How the ability improves as the plot progresses
5. **Worldview compatibility**: How the cheat is explained within the tech system

**If cheat type is "None"**: Details should describe the protagonist''s core survival strategy — what compensates for the gap with future people (e.g., cross-era humanistic perspective, lost knowledge, non-tech-dependent survival skills, "pure humanity" uncorrupted by technology, etc.).

---

### Generation Notes

1. Crossing method must have a scientific/pseudo-scientific explanation — no fantasy-style "soul transmigration"
2. Crossing method must match the worldview''s sub-genre (hard sci-fi -> cryogenics/time machine; cyberpunk -> consciousness upload)
3. Time span should match civilization level
4. Crossing identity must be logically consistent with crossing method
5. Core goal should form an organic connection with crossing identity and worldview
6. Cheat-ability design core is "bridging the gap" not "crushing the future" — this is sci-fi crossing''s biggest distinction from other crossing types
7. All six fields form a complete crossing framework; each choice affects the reasonable range of others',
  (SELECT id FROM novel_creation_method WHERE name = '未来科幻穿越创作' LIMIT 1),
  1,
  61,
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
