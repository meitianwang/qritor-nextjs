-- 都市传说怪谈复苏流小说 - 「文风设定」设定生成技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-urban-legend-writing-style-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'urban-legend-writing-style-setting-gen',
  '「文风设定」设定生成：为都市传说怪谈复苏流小说确定叙事视角、恐怖类型与语言风格',
  '"Writing Style" setting generation: establish narrative POV, horror type, and prose style for urban legend revival horror novels',
  '## 「文风设定」设定生成 — 都市传说怪谈复苏流小说

文风设定决定了恐惧是如何被「传递」给读者的。同样的怪谈内容，用不同的视角和语言风格写出来，会产生截然不同的恐怖效果。都市怪谈有其特殊性：它的代入感依赖于「叙事与读者日常的距离」——距离越近，背脊越凉。

---

### 字段生成指南

#### 叙事视角
三种视角在都市怪谈中各有不可替代的优势：

**第一人称**
最常见，代入感最强，与这个题材天然匹配。
- 优势：读者直接成为主角，所有恐惧都是「我」的恐惧；「我看到的」比「他看到的」更令人不安
- 适合恐怖类型：氛围恐怖、心理恐怖
- 特有技巧：**不可靠叙述者**——第一人称的叙述者可以误解、遗忘、被操控，读者与主角同步产生错位感
- 风险：主角死亡的可能性受限（除非是「遗稿」形式），容易陷入独白过多

**第三人称限知**
在代入感和叙事灵活性之间取得平衡。
- 优势：可以展示主角意识不到的危险（主角身后的东西），同时保留代入视角
- 适合恐怖类型：生存恐怖、混合类型
- 特有技巧：**视角切割**——在关键时刻切到限知视角外的一瞬间，让读者「看到」主角看不见的东西

**第三人称全知**
代入感最弱，但可以构建更宏大的社会恐慌图景。
- 优势：可以写多个角色的视角，展示怪谈在社会层面的影响
- 适合恐怖类型：社会性恐慌、崩溃阶段的故事
- 特有技巧：**全知但不解释**——上帝视角看到了一切，却刻意不解释那到底是什么，制造更深的不安

#### 恐怖类型
选择正确的恐怖类型是整个创作方向的核心决策：

| 恐怖类型 | 核心机制 | 适合的读者期待 | 典型节奏 |
|---------|---------|------------|---------|
| 氛围恐怖 | 不安感的持续积累，异常从不被明确定义 | 被吓到但安全的体验 | 慢热，不依赖事件密度 |
| 心理恐怖 | 真相比表面的威胁更可怕 | 真相震撼、认知颠覆 | 有明显的「转折点」 |
| 怪物恐怖 | 恐惧实体被直接展示，有视觉冲击 | 直接的感官恐惧满足 | 事件密集，爽快感强 |
| 生存恐怖 | 规则已知，求生是否成功取决于执行 | 代入求生博弈 | 中节奏，每章都有明确的生存目标 |
| 混合类型 | 前期氛围，中期规则，后期直面 | 全面恐惧体验 | 三段式节奏变化 |

**选择建议**：初写都市怪谈推荐「混合类型」或「生存恐怖」，前者受众广，后者结构清晰容易把控。纯「氛围恐怖」对文字功力要求极高，一旦氛围断裂整个故事就会失速。

#### 语言风格
都市怪谈的四种语言风格各有明确的受众和使用场景：

**日常口语（接地气）**
- 特征：短句，口语化，有地方色彩，像在和朋友叙述
- 优势：代入感最强，节奏快，不会让读者觉得是在「读小说」
- 适合：第一人称，生存恐怖，年轻读者
- 示例感：「我当时真没想那么多，就是按了电梯。然后门开了。我就知道不对了。」

**新闻纪实风（伪纪录片感）**
- 特征：客观语气，有时态，偶有引用，「据X描述」「事后证实」之类的表述
- 优势：真实感极强，读者半信半疑时最有效果
- 适合：以「这是真实事件」为前提叙述的故事，多视角
- 示例感：「2023年11月17日凌晨，李某独自乘坐小区电梯时失踪。监控在23:58停止工作。」

**文学性叙述**
- 特征：意象丰富，句式有变化，情绪渲染细腻
- 优势：氛围渲染能力最强，可以将不可名状的感受具象化
- 适合：氛围恐怖类型，强调心理深度的作品
- 示例感：「那条走廊的灯从来都亮着，因为熄灭的是别的东西。」

**网络帖子体**
- 特征：模拟论坛帖/微信截图/知乎回答格式，有楼层/点赞/评论结构
- 优势：现代感极强，天然制造「这是真实经历分享」的错觉
- 适合：网络传播类怪谈，有强互动性期待的故事
- 注意：需要有强大的内容支撑，否则形式感会喧宾夺主

#### 节奏把控
都市怪谈三种节奏的核心差异：

**快节奏（事件密集）**
- 每一章都有明确的事件推进
- 适合生存恐怖和怪物恐怖类型
- 风险：读者疲劳，恐惧感麻木

**中节奏（张弛有度）**
- 紧张章节后有缓冲，但缓冲中也埋设不安
- 最适合长篇，节奏最稳定
- 关键技巧：「平静章节」不等于「无恐惧章节」，而是把恐惧从高频率降为低密度的持续渗透

**慢热型（氛围积累）**
- 前1/3几乎没有明确的恐惧事件，只有不对劲的感觉
- 适合氛围恐怖类型，读者需要有耐心
- 关键技巧：前1/3的每一个细节都要在后续被回收，让读者在回头翻阅时不寒而栗

#### 信息密度
三种信息策略代表对「恐惧来源」的根本判断：

- **知道得越多越恐惧**：揭示信息是主要驱动力；每条新信息都比上一条更可怕
  → 适合「心理恐怖」和「生存恐怖」
- **不知道才恐怖**：保持模糊；明确定义的威胁永远不如暗示的威胁可怕
  → 适合「氛围恐怖」；但节奏推进需要非信息手段
- **半知半解（悬念型）**：部分信息被揭示，同时每次揭示都带来更多问题
  → 最通用，适合大多数都市怪谈

---

### 字段联动关系

- **叙事视角 → 角色的性格特质**：第一人称要求主角有独特的叙述声音；不可靠叙述者需要主角有某种认知扭曲
- **恐怖类型 → 禁忌规则的违规后果**：氛围恐怖的后果应该模糊且感官性的；生存恐怖的后果应该具体且可量化
- **语言风格 → 都市场景的现实描述**：日常口语的场景描述应该简短口语化；文学性叙述的场景应有意象和情绪渲染
- **节奏把控 + 信息密度 → 情节设计**：两者共同决定了每章应该揭示多少信息、发生多少事件

---

### 常见错误

- ❌ 语言风格选「日常口语」但实际写成了古典文学——语言风格要贯彻到每一个句子
- ❌ 叙事视角选「第一人称」但主角没有独特的声音——第一人称的主角必须有可识别的说话方式
- ❌ 恐怖类型选「氛围恐怖」但节奏选「快节奏」——两者矛盾，氛围恐怖需要足够的时间积累
- ❌ 信息密度选「不知道才恐怖」但后续每章都在解释怪谈的原理——策略与执行不一致',
  '"Writing Style" Setting Generation — Urban Legend Revival Horror Novels

Core principle: the proximity between the narrative and the reader''s daily life determines the horror''s effectiveness.

**Narrative POV guide**:
- First person: maximum immersion; unique advantage is the unreliable narrator — the protagonist can misunderstand, forget, or be manipulated
- Third limited: balance between immersion and flexibility; unique technique is "view cut" — briefly showing something behind the protagonist that they can''t see
- Third omniscient: weakest immersion but best for social-scale panic; technique: "omniscient but unexplaining" — the narrator sees everything but deliberately refuses to explain what it is

**Horror type selection**:
- Atmospheric: slow burn, undefined dread — requires strong prose craft; collapses if atmosphere breaks
- Psychological: revelation is more horrifying than the threat — needs clear turning point
- Monster: direct visual horror — event-dense, gratifying
- Survival: rules are known; success depends on execution — middle-paced, each chapter has clear survival goal
- Mixed: atmospheric opening → rules-based middle → direct confrontation ending

**Language style options**:
- Colloquial: short sentences, spoken, regional color — best immersion, fast pace
- Documentary: objective tone, citations ("according to witnesses"), dates — makes readers half-believe it''s real
- Literary: rich imagery, emotional rendering — best atmospheric effect
- Forum/chat format: simulates social media posts, forum threads — strong modern authenticity illusion

**Information density philosophy**:
- "More you know, worse it gets": each revelation is more terrifying than the last → psychological and survival horror
- "Not knowing is the terror": deliberate vagueness → atmospheric horror; requires non-information pacing tools
- "Partial knowledge" (recommended default): each revelation raises more questions → most versatile',
  (SELECT id FROM novel_creation_method WHERE name = '都市传说怪谈复苏流小说' LIMIT 1),
  1,
  14,
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
