-- 惊悚乐园小说「文风设定」设定生成技能
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '惊悚乐园小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-jingsong-writing-style-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'jingsong-writing-style-setting-gen',
  '「文风设定」设定生成：为惊悚乐园小说生成文风设定，包括叙事视角、恐怖氛围浓度、主角内心风格、节奏把控、语言风格和参考作品',
  '"Writing Style" setting generation: generate writing style settings for thriller park novels, including narrative perspective, horror atmosphere intensity, protagonist inner voice style, pacing control, language style and reference works',
  '## 「文风设定」设定生成 — 惊悚乐园小说

文风设定决定了读者体验恐怖的方式。同样的恐怖场景，用不同的文风呈现会产生截然不同的效果。惊悚乐园类型的文风特别有讲究——它不是纯粹的恐怖文学，而是融合了游戏化系统、黑色幽默、智力博弈等元素，文风需要在这些元素之间找到平衡。

---

### 字段生成指南

#### 叙事视角

视角选择直接决定信息揭示的方式和读者的代入感：

- **第一人称**：读者与主角完全绑定，主角不知道的读者也不知道。优点是代入感最强，恐惧感最直接（"我听到背后有脚步声"比"他听到背后有脚步声"更可怕）。缺点是信息受限，难以呈现主角不在场的剧情。适合：心理恐怖型、独狼型主角、推理解谜型副本。
- **第三人称有限视角**：跟随主角但有轻微的距离感。优点是可以偶尔透露主角未注意到的细节（"他没有看到，身后的影子多了一个"），制造读者比主角多一点点信息的不安感。缺点是比第一人称少了些代入感。适合：需要偶尔切换视角的故事、队伍冒险型。这是惊悚乐园类型最常用的视角。
- **第三人称全知视角**：叙述者知道一切。优点是可以自由切换场景和角色，适合多线叙事。缺点是恐惧感较弱（全知意味着读者无法和角色一起"不知道"）。适合：群像剧、多队伍竞争型故事。不推荐用于以单一主角为核心的惊悚乐园。
- **第二人称**：极少见但效果独特（"你推开了那扇门"）。适合短副本的沉浸式描写，但长篇使用会让读者疲劳。可以在特殊副本（如主角进入幻觉/梦境）中局部使用。

**视角技巧**：
- 可以在"系统提示"部分切换为客观视角（如系统面板的文字），制造风格对比
- 在关键恐怖场景中拉近视角（从第三人称有限变为近乎第一人称的贴近描写），增强冲击力
- 在揭示真相时拉远视角（突然呈现一个更大的画面），制造认知冲击

#### 恐怖氛围浓度

这是惊悚乐园类型最需要精心调校的参数。恐怖浓度不是"越高越好"，而是需要与其他元素配合：

**浓度等级定义**：

| 浓度 | 特点 | 恐怖占比 | 适合搭配 |
|------|------|---------|---------|
| 极高（纯恐怖） | 几乎每个场景都在制造恐惧 | 80%+ | 短篇副本、心理恐怖 |
| 高（恐怖为主） | 恐怖是主旋律，偶有喘息 | 60-80% | 正统恐怖风格 |
| 中高（恐怖+悬疑） | 恐怖和悬疑各占一半 | 40-60% | 解谜型副本、推理主角 |
| 中（均衡） | 恐怖、幽默、热血交替 | 30-40% | 最常见的惊悚乐园风格 |
| 中低（轻恐怖） | 恐怖是调味料而非主菜 | 15-30% | 偏爽文/游戏流 |

**不同浓度的写作技巧差异**：

- **极高浓度**：需要持续的感官描写（声音、气味、触感、温度变化）。避免长段落的理性分析打断恐怖氛围。对话要少且简短——恐怖环境中话多的人不可信。关键技巧是"不完整描写"——不要把恐怖的东西写得太清楚，留白让读者自己脑补
- **高浓度**：在恐怖场景之间插入短暂的安全区（一个密室、一段回忆），让读者喘口气再进入下一波恐怖。这种"呼吸感"反而让恐怖更有冲击力。技巧是在安全区中埋下微妙的不安——"这里看起来很安全，但总觉得少了什么"
- **中高浓度**：恐怖场景和推理场景交替。恐怖提供线索，推理消化恐怖。关键是让主角的分析过程本身有阅读乐趣——不是枯燥的逻辑推演，而是"一边害怕一边强迫自己冷静分析"的张力
- **中等浓度**：这是最有惊悚乐园类型特色的浓度。恐怖场景来得快去得快，主角用幽默或理性化解恐惧后迅速进入下一个挑战。核心是"反差感"——恐怖和幽默的落差越大，阅读体验越独特
- **中低浓度**：恐怖更多作为"背景设定"而非"情绪驱动"。主角可能觉得这一切很荒谬而非恐怖。适合"疯子型"或"极度理性型"主角——世界很恐怖，但他不在意

#### 主角内心风格

主角的内心独白风格是惊悚乐园类型最有辨识度的文风元素：

- **冷静分析型**：内心像一台精密的分析仪器。面对恐怖时的内心活动是"这个声音来自右前方三米处，频率不规则，说明不是机械装置而是生物发出的"。优点是智力展示充分；缺点是可能显得不真实
- **吐槽吐槽型**：面对恐怖用吐槽消解恐惧。"所以这个鬼的杀人方式是让你在马桶上滑倒？认真的？"。优点是阅读轻松，最有惊悚乐园特色；缺点是过度吐槽会消解本应严肃的恐怖场景
- **压抑克制型**：内心有大量恐惧但强迫自己压下去。"手在抖。不行。稳住。先看清楚那是什么。"。优点是真实感强，读者能感受到主角的努力；缺点是如果一直压抑会让读者也压抑
- **哲思型**：面对恐怖会思考更深层的问题。"如果这个鬼是人死后的怨念凝聚，那''我''死后会变成什么？"。优点是增加深度；缺点是节奏容易变慢
- **空白型**：几乎没有内心活动，完全靠行为表现。适合"疯子型"主角——读者不知道他在想什么，这本身就很恐怖

**搭配矩阵**：

| 恐怖浓度 \ 内心风格 | 冷静分析 | 吐槽消解 | 压抑克制 | 哲思深入 |
|-------------------|---------|---------|---------|---------|
| 极高浓度 | 反差感强，"冰"在"火"中 | 不推荐，破坏氛围 | 最佳搭配 | 可行但节奏慢 |
| 高浓度 | 好搭配，理性穿透恐惧 | 慎用，仅在喘息段 | 很好，张力足 | 适合间歇使用 |
| 中高浓度 | 最佳搭配 | 好搭配，推理+吐槽 | 可行但有些沉重 | 好搭配 |
| 中等浓度 | 好搭配 | 最佳搭配，惊悚乐园标配 | 有些过度 | 可行 |
| 中低浓度 | 可行但无聊 | 好搭配 | 不搭 | 有趣的实验 |

#### 节奏把控

节奏是惊悚乐园类型的生命线。太快读者跟不上，太慢恐惧感消散：

**副本内节奏结构**：

一个典型副本的节奏曲线应该是：
1. **进入期（10-15%）**：环境描写、规则展示、角色介绍。节奏中等偏慢。读者需要时间理解这个副本的设定
2. **探索期（15-30%）**：开始接触恐怖元素，但尚未全面爆发。节奏逐渐加快。关键词：好奇、不安、试探
3. **第一高潮（30-40%）**：首次正面遭遇恐怖。节奏骤然加速。这是读者决定是否继续读的关键
4. **消化期（40-50%）**：退回安全区域，分析已有信息，制定策略。节奏放缓但不停滞。这里适合展示主角智慧
5. **连续冲击（50-75%）**：多个恐怖事件接连发生，紧张感持续升级。节奏持续加快。队友死亡、计划失败、新规则揭示
6. **最终决战（75-90%）**：面对副本核心恐怖，一切真相揭晓。节奏达到最高点
7. **收尾（90-100%）**：副本结算、奖励发放、为下个副本铺设。节奏降回平缓

**副本间节奏**：
- 不是每个副本都要紧张刺激。可以在高强度副本后安排一个"日常回"或"备战回"
- 主线揭示不要集中在连续的副本中，应该间隔分布
- 长篇小说中每5-8个副本应该有一个"转折性"副本，改变故事的整体方向

#### 语言风格

具体的文字层面的风格选择：

- **简洁利落**：短句为主，动词有力。"他转身。走廊尽头。有人。不——不是人。"适合快节奏、高紧张度的场景
- **细腻描写**：注重感官细节和环境渲染。适合恐怖氛围铺垫阶段。"空气中弥漫着潮湿的霉味，混合着一种说不清的甜腥气息，像是什么东西在暗处慢慢腐烂"
- **口语化/网文风**：接近日常说话方式，读起来轻松。适合主角吐槽和日常互动。"卧槽这什么鬼——字面意义上的鬼"
- **文学化**：修辞讲究，意象丰富。适合心理描写和哲思段落。但在惊悚乐园类型中应谨慎使用，过于文学化会让读者觉得"画风不对"
- **混合风格**：根据场景切换。恐怖场景用简洁利落+细腻描写，日常场景用口语化，关键揭示用稍文学化的表达。这是最推荐的做法

**语言禁忌**：
- 恐怖场景避免用"好像""仿佛""似乎"等模糊词——直接写"那是一只手"比"那好像是一只手"更有冲击力
- 避免过度使用感叹号——一个感叹号的冲击力远大于三个连续感叹号
- 避免在紧张场景中插入冗长的描写——紧张时读者会自动跳过长段描写

#### 参考作品

明确的参考作品帮助AI理解目标风格。按风格方向推荐：

| 风格方向 | 参考作品 | 核心特点 |
|---------|---------|---------|
| 黑色幽默+恐怖 | 《惊悚乐园》（三天两觉） | 主角反常态度、吐槽消解恐惧 |
| 正统恐怖+系统 | 《无限恐怖》（zhttty） | 严肃恐怖氛围、团队协作 |
| 推理+恐怖 | 《诡秘之主》（乌贼） | 克苏鲁元素、层层揭秘 |
| 心理恐怖 | 《全球高武》系列恐怖副本 | 心理压迫、环境渲染 |
| 轻松恐怖 | 《我在惊悚游戏里封神》 | 轻松搞笑、主角碾压 |
| 纯文学恐怖 | 《残秽》（小野不由美） | 日式恐怖、克制留白 |

可以选择1-3部参考作品，并注明要融合哪些方面（氛围/节奏/对话风格/人物塑造）。

---

### 设计要点

1. **一致性优先**：文风可以在不同场景中有变化，但整体调性必须一致。不要在正统恐怖和搞笑吐槽之间大幅摇摆
2. **服务于故事**：文风是工具不是目的。选择最适合讲述你这个故事的风格，而非你个人最喜欢的风格
3. **读者体验为中心**：始终考虑读者在阅读时的情绪状态。刚经历高强度恐怖后需要缓冲，不要立刻又扔恐怖
4. **试写验证**：确定文风后写一段500字的试写样本，检验各元素是否协调

### 常见错误

- **恐怖浓度与主角态度矛盾**：描写了极度恐怖的环境但主角全程吐槽毫不在意——读者不知道该害怕还是该笑
- **节奏单调**：从头到尾同一个节奏。必须有快慢交替，松紧切换
- **语言风格不统一**：前几章文学化后几章网文化，让读者有割裂感
- **过度依赖内心独白**：所有信息都通过主角内心呈现，缺少对话、动作、环境描写的配合
- **忽视"系统文字"的风格**：系统提示、面板信息、任务描述——这些文字也是文风的一部分，应该有自己的语言风格（通常比叙事文字更简洁、更冷酷或更诡异）
- **参考作品混搭过度**：同时模仿5部风格迥异的作品，结果四不像。参考作品不宜超过3部，且要明确各取什么',
  '## "Writing Style" Setting Generation — Thriller Park Novel

Writing style determines how readers experience horror. Thriller park novels blend gamified systems, dark humor, and intellectual contests — the style must balance these elements.

---

### Field Generation Guide

#### Narrative Perspective
First person (strongest immersion, most direct fear), third person limited (most common for genre — allows subtle information reveals), third person omniscient (weak fear, suitable for ensemble casts), second person (rare, effective for special immersion segments only).

#### Horror Atmosphere Intensity
Scale from extreme (80%+ horror scenes) to low (15-30% horror as seasoning). Medium intensity (30-40%) is most characteristic of the genre — horror comes fast, protagonist deflects with humor/rationality, creating signature contrast.

High intensity requires continuous sensory description and incomplete descriptions (reader imagination fills gaps). Medium intensity alternates horror and humor for maximum contrast effect. Low intensity treats horror as background setting.

#### Protagonist Inner Voice Style
Calm analytical ("sound from 3 meters, front-right, irregular frequency — biological"), comedic commentary ("so this ghost kills by making you slip in the bathroom? seriously?"), suppressed restraint ("hands shaking. stop. steady. look first."), philosophical ("if ghosts are condensed resentment, what will I become?"), or blank/action-only.

Matching matrix: High horror + suppressed restraint = best match. Medium horror + comedic commentary = genre signature. Extreme horror + comedic = avoid (breaks atmosphere).

#### Pacing Control
Instance rhythm: entry (10-15%, medium-slow), exploration (15-30%, accelerating), first climax (30-40%, sudden spike), digestion (40-50%, slower analysis), consecutive shocks (50-75%, escalating), final confrontation (75-90%, peak), conclusion (90-100%, calm).

Between instances: alternate high-intensity and breathing-room episodes. Distribute main-plot reveals across intervals.

#### Language Style
Concise (short sentences, strong verbs — for tension), detailed sensory (atmosphere building), colloquial (protagonist commentary), literary (psychological depth, use sparingly). Mixed style recommended — switch based on scene demands.

Avoid: hedging words in horror scenes ("seemed like" weakens impact), excessive exclamation marks, lengthy descriptions during tense moments.

#### Reference Works
Choose 1-3 references with specific aspects to emulate. Dark humor: Thriller Paradise. Orthodox horror: Terror Infinity. Mystery-horror: Lord of Mysteries. Specify which aspects to borrow (atmosphere/pacing/dialogue/characterization).

### Common Mistakes
- Horror intensity contradicting protagonist attitude
- Monotonous pacing throughout
- Inconsistent language style across chapters
- Over-reliance on internal monologue
- Ignoring system text style (notifications need their own voice)
- Mixing too many reference works (cap at 3)',
  (SELECT id FROM novel_creation_method WHERE name = '惊悚乐园小说' LIMIT 1),
  1,
  24,
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
