-- 未来科幻穿越创作方法「科幻世界观」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '未来科幻穿越创作' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-scifi-crossing-worldview-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'scifi-crossing-worldview-setting-gen',
  '「科幻世界观」设定生成：为未来科幻穿越小说生成科幻世界观设定，涵盖科幻子类、文明等级、核心科技、社会形态、能源体系、对于人类的定义',
  '"Sci-Fi World Setting" setting generation: generate sci-fi worldview settings for future sci-fi crossing novels, covering sci-fi sub-genre, civilization level, core technology, social structure, energy system, and definition of humanity',
  '## 「科幻世界观」设定生成 — 未来科幻穿越创作

「科幻世界观」是整个故事的基础设施，属于 singleton 类型（只有一个实例）。它是最重要的设定模块，每个字段都会深刻影响后续的角色设计、剧情走向和科技逻辑。

**核心理念**：科幻穿越是穿越类型中唯一一个「主角处于劣势」的子类型。世界观的设计必须体现这一点——未来世界远超主角认知，主角以「原始人」姿态闯入。

---

### 字段生成指南

#### 科幻子类

这是最先确定的选项，决定了整个世界的基调。共 9 种可选：

| 科幻子类 | 世界特征 | 适合的故事类型 |
|----------|---------|--------------|
| **赛博朋克** | 高科技低生活，企业垄断，贫富极端分化 | 反乌托邦、底层逆袭、企业阴谋 |
| **太空歌剧** | 星际文明，多种族共存，宏大政治格局 | 星际冒险、种族战争、帝国兴衰 |
| **硬科幻** | 严格遵循科学原理，技术细节真实 | 科学探索、技术难题、理性推理 |
| **废土末世** | 文明崩溃后的世界，资源匮乏 | 生存挣扎、重建文明、人性考验 |
| **时空穿越** | 多时间线/平行世界，因果悖论 | 悬疑推理、时间修复、自我对话 |
| **异星文明** | 外星种族的社会与文化 | 文化碰撞、外交博弈、哲学思辨 |
| **AI 觉醒** | 人工智能获得意识，人机关系重构 | 伦理困境、共存探索、控制与自由 |
| **生化变异** | 基因改造导致的新人类/新物种 | 身份认同、种族矛盾、进化方向 |
| **银河帝国** | 跨星系的庞大政治实体 | 宫廷权谋、帝国兴衰、边疆叛乱 |

**选择要点**：
- 科幻子类不是孤立的，可以组合使用（如「赛博朋克 + AI 觉醒」或「太空歌剧 + 银河帝国」）
- 但主子类要明确，它决定了世界的主基调
- 子类选择直接影响后续所有字段的合理范围

#### 文明等级

文明等级决定科技天花板和社会复杂度，也决定了穿越者的劣势程度：

| 等级 | 特征 | 对穿越者的影响 |
|------|------|--------------|
| **0 级（原始）** | 接近现代水平或略高 | 穿越者适应难度低，冲突更多来自社会层面 |
| **1 级（行星级）** | 完全掌控母星资源和环境 | 穿越者在科技方面全面落后 |
| **2 级（恒星级）** | 能利用恒星能量，星际殖民 | 穿越者像原始人闯入现代城市 |
| **3 级（星系级）** | 掌控整个星系 | 穿越者几乎无法理解这个世界 |
| **神级** | 超越物理法则 | 穿越者与「神」共存，本质上是哲学故事 |

**关键提示**：文明等级越高，穿越者的劣势越大，但故事想象空间也越大。建议新手选择 0-1 级，有经验的作者尝试 2 级以上。

#### 核心科技

核心科技是世界观的「科技树主干」。设计时必须遵循三个原则：

1. **内部一致性**：如果有了光速旅行，通信技术不可能还停留在无线电
2. **社会影响**：每项核心科技都必须对社会形态产生影响（如：意识上传 → 死亡的定义改变）
3. **与子类匹配**：赛博朋克的核心科技应该是义体/脑机接口，而非星际引擎

**生成建议**：列出 3-5 项核心科技，每项注明原理概述和社会影响。不需要写成论文，但要确保逻辑自洽。核心科技将作为后续「科技与设定」模块条目的起点。

#### 社会形态

社会形态必须与文明等级和核心科技匹配。参考对应关系：

| 核心科技 | 可能的社会形态 |
|----------|-------------|
| 意识上传 | 虚拟与现实双层社会，「数字公民」概念 |
| 基因编辑 | 基因阶级制度，「纯人类」歧视问题 |
| 强 AI 管理 | AI 治理的效率社会，人类的角色重定义 |
| 星际殖民 | 松散联邦或帝国体制，星球间的文化差异 |
| 能量革命 | 后稀缺社会，新的社会矛盾不再是物质而是意义 |

**常见错误**：科技设定很先进，但社会形态还是现代民主制度——不可能。科技会从根本上重塑社会结构。务必思考：这项核心科技会如何从根本上改变人类的组织方式？

#### 能源体系

能源体系容易被忽视但极其重要：
- 它决定了文明的天花板（能源不够，星际旅行就是笑话）
- 它是许多剧情冲突的来源（能源争夺、能源垄断、能源危机）
- 它影响日常生活的细节（用什么充电、如何供暖、交通方式）

**生成要点**：能源体系必须能支撑所设定的核心科技水平。文明等级与能源等级应该匹配。

#### 对于人类的定义

这是科幻穿越特有的哲学设定字段，直接影响穿越者的处境：

需要回答的核心问题：
- 义体改造到什么程度还算人类？
- 意识上传后的数字存在是否是人？
- 基因改造后的新人类是否还是同一物种？
- AI 仿生人是否有人权？

**关键作用**：如果「纯人类」在未来世界是少数群体甚至被歧视的对象，穿越者的身份本身就是最大的冲突来源。这个字段要与角色的种族/形态设定保持一致，并为「何为人类」的主题暗线提供基础。

---

### 生成注意事项

1. 六个字段之间必须逻辑自洽——科幻子类、文明等级、核心科技三者构成铁三角
2. 社会形态必须是核心科技的合理推演结果，不能脱节
3. 能源体系要能支撑核心科技，不能出现「能量不够但科技很牛」的矛盾
4. 对于人类的定义要与世界观的整体科技水平和社会氛围一致
5. 始终记住穿越者处于劣势——世界观的每个维度都应该体现未来对现代人的压倒性优势',
  '## "Sci-Fi World Setting" Generation — Sci-Fi Crossing Creation

The "Sci-Fi World Setting" (科幻世界观) is the infrastructure of the entire story, a singleton type (only one instance). It is the most important setting module — every field profoundly influences subsequent character design, plot direction, and technological logic.

**Core principle**: Sci-fi crossing is the only crossing sub-genre where the protagonist is at a disadvantage. The worldview design must reflect this — the future world far surpasses the protagonist''s comprehension; they enter as a "primitive."

---

### Field Generation Guide

#### Sci-Fi Sub-Genre (科幻子类)

The first choice to make, determining the world''s overall tone. Nine options available:

| Sub-Genre | World Characteristics | Suitable Story Types |
|-----------|----------------------|---------------------|
| **Cyberpunk** (赛博朋克) | High-tech low-life, corporate monopoly, extreme wealth gaps | Dystopia, underdog uprising, corporate conspiracy |
| **Space Opera** (太空歌剧) | Interstellar civilization, multi-species coexistence, grand politics | Space adventure, species wars, empire rise and fall |
| **Hard Sci-Fi** (硬科幻) | Strict adherence to scientific principles, realistic technical detail | Scientific exploration, technical puzzles, rational deduction |
| **Post-Apocalyptic** (废土末世) | Post-civilization collapse, resource scarcity | Survival, rebuilding civilization, tests of humanity |
| **Temporal Crossing** (时空穿越) | Multiple timelines/parallel worlds, causal paradoxes | Mystery, timeline repair, self-dialogue |
| **Alien Civilization** (异星文明) | Extraterrestrial species'' societies and cultures | Cultural collision, diplomatic gaming, philosophical debate |
| **AI Awakening** (AI 觉醒) | AI gains consciousness, human-machine relationships reconstructed | Ethical dilemmas, coexistence exploration, control vs. freedom |
| **Bio-Mutation** (生化变异) | Genetic modification creating new humans/species | Identity, species conflict, evolutionary direction |
| **Galactic Empire** (银河帝国) | Vast trans-galactic political entity | Court intrigue, imperial rise and fall, frontier rebellion |

**Selection tips**:
- Sub-genres are not mutually exclusive; they can be combined (e.g., "Cyberpunk + AI Awakening" or "Space Opera + Galactic Empire")
- But the primary sub-genre should be clear — it sets the world''s dominant tone
- Sub-genre choice directly constrains the reasonable range of all subsequent fields

#### Civilization Level (文明等级)

Determines the technological ceiling, social complexity, and the crosser''s degree of disadvantage:

| Level | Characteristics | Impact on the Crosser |
|-------|----------------|----------------------|
| **Level 0 (Primitive)** | Near-modern or slightly above | Low adaptation difficulty; conflicts are more social |
| **Level 1 (Planetary)** | Full control of homeworld resources and environment | Crosser is comprehensively behind in technology |
| **Level 2 (Stellar)** | Can harness stellar energy, interstellar colonization | Crosser is like a primitive entering a modern city |
| **Level 3 (Galactic)** | Controls an entire galaxy | Crosser can barely comprehend this world |
| **God-Level** (神级) | Transcends physical laws | Crosser coexists with "gods"; essentially a philosophical story |

**Key tip**: Higher civilization levels mean greater disadvantage for the crosser but also greater imaginative possibilities. Beginners should choose Level 0-1; experienced authors can try Level 2+.

#### Core Technology (核心科技)

The "tech-tree trunk" of the worldview. Three design principles:

1. **Internal consistency**: If light-speed travel exists, communication cannot still rely on radio
2. **Social impact**: Every core technology must affect social structure (e.g., consciousness uploading -> the definition of death changes)
3. **Sub-genre match**: Cyberpunk core tech should be prosthetics/brain-computer interfaces, not interstellar engines

**Generation tip**: List 3-5 core technologies, each with a principle summary and social impact. No thesis needed, but ensure logical consistency. Core technologies serve as starting points for subsequent "Technology & Setting" module entries.

#### Social Structure (社会形态)

Must align with civilization level and core technology. Reference mappings:

| Core Technology | Possible Social Structure |
|----------------|--------------------------|
| Consciousness uploading | Virtual-and-real dual-layer society, "digital citizen" concept |
| Gene editing | Genetic caste system, "pure human" discrimination issues |
| Strong AI governance | AI-managed efficiency society, redefining humanity''s role |
| Interstellar colonization | Loose federation or imperial system, cultural gaps between planets |
| Energy revolution | Post-scarcity society; conflicts over meaning rather than material |

**Common mistake**: Advanced tech settings paired with modern democratic governance — impossible. Technology fundamentally reshapes social structure. Always ask: How would this core technology fundamentally change how humans organize?

#### Energy System (能源体系)

Often overlooked but critically important:
- Determines civilization''s ceiling (insufficient energy makes interstellar travel a joke)
- Source of many plot conflicts (energy competition, monopoly, crisis)
- Affects daily life details (charging, heating, transportation methods)

**Generation tip**: The energy system must support the established core technology level. Civilization level and energy level should match.

#### Definition of Humanity (对于人类的定义)

A philosophical setting field unique to sci-fi crossing, directly affecting the crosser''s situation:

Core questions to answer:
- At what point does prosthetic modification stop being "human"?
- Is a digitally uploaded consciousness still a person?
- Are gene-edited new humans still the same species?
- Do AI androids deserve human rights?

**Key role**: If "pure humans" are a minority or even a discriminated group in the future world, the crosser''s identity itself becomes the greatest source of conflict. This field should be consistent with character species/form settings and provide the foundation for the "what is human" thematic undercurrent.

---

### Generation Notes

1. All six fields must be logically consistent — sub-genre, civilization level, and core technology form an iron triangle
2. Social structure must be a reasonable extrapolation from core technology, not disconnected
3. Energy system must support core technology — no "insufficient energy but advanced tech" contradictions
4. Definition of humanity must align with the overall tech level and social atmosphere
5. Always remember the crosser is at a disadvantage — every dimension of the worldview should reflect the future''s overwhelming superiority over a modern person',
  (SELECT id FROM novel_creation_method WHERE name = '未来科幻穿越创作' LIMIT 1),
  1,
  60,
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
