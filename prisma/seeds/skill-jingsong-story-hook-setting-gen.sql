-- 惊悚乐园小说「故事钩子」设定生成技能
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '惊悚乐园小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-jingsong-story-hook-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'jingsong-story-hook-setting-gen',
  '「故事钩子」设定生成：为惊悚乐园小说生成叙事钩子设定，包括核心悬念、开篇钩子、系统背后的秘密、主角的终极目标、情感钩子和跨副本伏笔',
  '"Story Hook" setting generation: generate narrative hook settings for thriller park novels, including core suspense, opening hook, system secrets, protagonist ultimate goal, emotional hooks and cross-instance foreshadowing',
  '## 「故事钩子」设定生成 — 惊悚乐园小说

故事钩子是让读者"放不下书"的核心设计。惊悚乐园类型的独特之处在于它天然拥有双层悬念结构——副本层面的"这个副本怎么通关"和主线层面的"系统到底是什么"。好的钩子设计让这两个层面的悬念相互咬合，形成一张越收越紧的叙事网。

---

### 字段生成指南

#### 核心悬念

核心悬念是贯穿整部作品的终极问题。它应该是一个读者从开篇就隐约感知到、直到结尾才能完全揭晓的谜团。

**层次设计**：

好的核心悬念不是单一问题，而是一个嵌套结构：

| 层级 | 性质 | 揭示时机 | 示例 |
|------|------|---------|------|
| 表层悬念 | 最先被感知到的问题 | 前10% | "这个系统是谁创造的？" |
| 中层悬念 | 表层问题的答案引出的更深问题 | 30-50% | "创造系统的不是人类？那是什么？" |
| 深层悬念 | 颠覆整个认知框架的真相 | 70-90% | "系统不是被创造的，而是一直存在的——''我们''才是被创造的" |
| 终极悬念 | 结局也未必完全解答的哲学问题 | 结尾 | "如果现实和副本没有本质区别，活着的意义是什么？" |

**副本级悬念 vs 主线悬念**：

- **副本级悬念**是每个副本的"通关谜题"——"这个鬼怎么消灭？""这座房子的秘密是什么？"这类悬念在副本结束时必须解决，否则读者会不满
- **主线悬念**是跨副本的长线问题——"系统的目的""主角被选中的原因""那个反复出现的符号"。这类悬念要慢慢揭示，每个副本给一点碎片
- **两者的咬合**：最好的设计是副本级悬念的答案恰好是主线悬念的一块拼图。比如主角通关一个"校园鬼怪"副本后，发现这个鬼怪的来源与系统的创世传说有关

**常见的核心悬念类型**：
- "系统是什么？谁在操控？"——最经典，适合大多数惊悚乐园故事
- "主角为什么被选中？"——如果答案足够惊人（如主角本身就是系统的一部分），冲击力极大
- "副本中的世界是真实的吗？"——哲学性强，适合偏深度的作品
- "所有玩家最终的命运是什么？"——指向一个宏大的终局设计
- "系统和现实世界的关系是什么？"——如果系统正在入侵现实，或现实本身就是一个大副本

#### 开篇钩子

开篇钩子决定读者是否愿意读第二章。惊悚乐园类型的开篇有一个天然优势——"普通人突然被卷入恐怖游戏"本身就是极强的钩子。但光有这个基础设定不够，还需要更精准的设计。

**开篇钩子的黄金法则**：

1. **5秒法则**：前500字必须出现异常。不需要立刻进入副本，但必须让读者感知到"有什么不对劲"。可以是一个违和的细节、一条莫名的消息、一个不该出现的人
2. **信息不对称**：开篇时让读者比主角知道更多（预示性开头，如"我不知道那是我最后一次正常入睡"）或让主角比读者知道更多（悬念性开头，如主角面对恐怖表现异常冷静，读者不知道为什么）
3. **情感锚点**：在恐怖开始之前，给主角一个让读者记住的特征——一句口头禅、一个习惯、一种态度。这样进入恐怖后读者才会关心"这个人能不能活"
4. **承诺与兑现**：开篇暗示的氛围和类型要与后续一致。不要用"纯文学式"的开头引入一个"网文爽文"的故事

**开篇模式选择**：
| 模式 | 示例 | 优点 | 风险 |
|------|------|------|------|
| 直接进入副本 | 第一句就在副本中 | 节奏极快，零废话 | 读者缺乏对主角的了解 |
| 现实→突然拉入 | 日常生活被打断 | 对比强烈，代入感好 | 日常部分如果太长会无聊 |
| 倒叙开篇 | 从结果（如濒死）切入 | 悬念感极强 | 如果倒叙内容不够吸引会适得其反 |
| 旁观者视角 | 先展示别人的经历 | 铺设恐怖氛围 | 主角出场延迟可能失去读者 |

#### 系统背后的秘密

这是核心悬念的主要载体。系统的秘密应该层层嵌套，每揭开一层都让读者既满足又更好奇：

- **第一层（早期揭示）**：系统的基本运作方式——不是所有规则都在一开始就公开的，玩家需要通过试错和观察来补全
- **第二层（中期揭示）**：系统的异常之处——为什么系统有时不遵守自己的规则？为什么某些玩家受到特殊待遇？
- **第三层（中后期揭示）**：系统的目的——它不只是在"测试"玩家，它有自己的议程。可能是筛选、培养、收集，或者更诡异的东西
- **第四层（结局前揭示）**：系统的本质——系统本身是什么？它是人造的还是自然存在的？它有意识吗？它害怕什么？

**注意**：每一层的揭示都应该改变读者对之前事件的理解。好的秘密揭示让读者想回头重看前面的章节。

#### 主角的终极目标

终极目标是驱动长篇叙事的发动机。它应该随着故事推进而变化：

- **初期目标**：通常是"活着""弄清状况""变强"——简单直接，推动主角参与副本
- **中期目标**：发现更大的真相后产生的新目标——"找到系统的弱点""保护队友""解救被困的人"
- **终期目标**：终极抉择——"摧毁系统""取代系统""与系统共存""逃离系统"

**目标进化的关键**：每次目标变化都应该伴随一个重大事件——队友的牺牲、真相的揭示、信念的动摇。不要让目标无缘无故地改变。

#### 情感钩子

恐怖之外的情感连接让读者不只是"好奇"而是"在乎"：

- **羁绊关系**：主角与特定角色的情感纽带。可以是队友、对手、NPC。当这个人陷入危险时，读者的紧张感倍增
- **牺牲与失去**：失去重要的人或事物。惊悚乐园类型中角色死亡是常见的，但每次死亡都应该有情感重量
- **道德困境**：被迫在两个不好的选项中选择。如"牺牲一个人救五个人""出卖队友获取情报"
- **成长代价**：变强的代价是什么？失去人性？遗忘过去？这种代价本身就是一个情感钩子
- **幽默与温情**：在恐怖的间隙给予片刻温暖。对比越强烈，读者对角色的依恋越深

#### 跨副本伏笔

伏笔是让惊悚乐园从"短篇集"升格为"史诗长篇"的关键工具：

**铺设技巧**：
1. **碎片式铺设**：在不同副本中出现的看似无关的碎片，后期拼合成完整真相。关键是每个碎片单独看都是"副本内部的合理细节"，不会显得突兀
2. **角色线铺设**：某个角色在不同副本中的变化（或某个角色以不同形态出现在不同副本中），暗示一个更大的叙事
3. **规则线铺设**：系统规则的微妙变化——最初看似bug或偶然，后来证明是有意为之
4. **符号/意象铺设**：反复出现的符号、数字、颜色、意象。不需要每次都解释，让读者自己积累印象
5. **对话铺设**：某个NPC或系统说的一句看似无意的话，在后续副本中获得全新含义

**铺设密度**：不要每个副本都塞大量伏笔。建议5个副本中有2-3个包含主线伏笔，其余的做纯粹的恐怖体验。过多的伏笔会让读者觉得"为了悬念而悬念"。

**回收时机**：伏笔不要憋太久。一般铺设后3-5个副本内应有至少部分回收。完全不回收的伏笔会让读者遗忘，彻底浪费。

---

### 设计要点

1. **双线驱动**：同时用"好奇心"（想知道真相）和"情感"（关心角色命运）驱动读者
2. **节奏呼吸**：不能每章都是高强度悬念。在悬念爆发后给读者消化的空间，再制造下一个悬念
3. **期望管理**：悬念的答案必须配得上等待的时间。越晚揭示的悬念，答案越要惊人
4. **多线编织**：同时运行3-4条悬念线，交替推进。当一条线暂时沉寂时，另一条线在推进

### 常见错误

- **核心悬念太早揭示**：高潮过后读者失去动力。核心悬念要拆成碎片分批揭示
- **开篇信息过载**：前三章就把系统规则、世界观、角色背景全倒出来。应该先给体验再给解释
- **伏笔只铺不收**：铺了大量伏笔但不回收，读者会觉得作者在忽悠
- **情感钩子缺失**：纯靠悬念和恐怖驱动，读者可能好奇但不在乎。至少需要一个让读者深度共情的角色
- **悬念与恐怖脱节**：悬念线讲的是"系统阴谋"，但副本中的恐怖体验完全无关。两者必须相互强化
- **终极目标不清晰**：读者读到中段还不知道主角到底想要什么，会失去方向感',
  '## "Story Hook" Setting Generation — Thriller Park Novel

Story hooks keep readers turning pages. Thriller park novels have a natural dual-layer suspense structure — instance-level ("how to clear this instance") and main-plot-level ("what is the system really").

---

### Field Generation Guide

#### Core Suspense
Nested structure: Surface suspense (perceived early, "who created the system?"), mid-layer (deeper question from surface answer), deep layer (paradigm-shifting truth at 70-90%), ultimate (philosophical question even the ending may not fully resolve).

Instance-level suspense must resolve within each instance. Main-plot suspense reveals gradually across instances. Best design: instance answers serve as main-plot puzzle pieces.

#### Opening Hook
Golden rules: 5-second rule (abnormality in first 500 words), information asymmetry (reader knows more than protagonist, or vice versa), emotional anchor (memorable trait before horror begins), promise-delivery consistency.

Patterns: Direct instance entry (fastest), reality-to-pull (strong contrast), flashforward opening (high suspense), observer perspective (atmosphere building).

#### System Secrets
Layer by layer: basic operations revealed early, anomalies mid-story, system''s true agenda later, system''s fundamental nature near climax. Each reveal should recontextualize previous events.

#### Protagonist Ultimate Goal
Evolves over time: initial (survive, understand), mid-term (protect, discover weakness), final (destroy/replace/coexist/escape system). Each change accompanies a major event.

#### Emotional Hooks
Bond relationships, sacrifice and loss, moral dilemmas, growth costs, humor-warmth contrast in horror gaps. Emotional investment makes readers care beyond curiosity.

#### Cross-Instance Foreshadowing
Techniques: fragment planting (seemingly unrelated details later forming truth), character-line planting (character changes across instances), rule-line planting (subtle system changes), symbol/imagery recurrence, dialogue recontextualization.

Density: 2-3 out of every 5 instances contain main-plot foreshadowing. Collect within 3-5 instances of planting.

### Common Mistakes
- Core suspense revealed too early
- Opening information overload
- Foreshadowing planted but never collected
- Missing emotional hooks (pure suspense insufficient)
- Suspense disconnected from horror
- Unclear ultimate goal by mid-story',
  (SELECT id FROM novel_creation_method WHERE name = '惊悚乐园小说' LIMIT 1),
  1,
  23,
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
