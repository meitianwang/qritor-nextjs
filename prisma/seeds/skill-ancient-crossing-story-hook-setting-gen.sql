-- 古代架空穿越小说「故事钩子」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '古代架空穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-ancient-crossing-story-hook-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ancient-crossing-story-hook-setting-gen',
  '「故事钩子」设定生成：为古代架空穿越小说生成故事钩子设定，包括故事钩子、核心卖点、开篇悬念、读者期待',
  '"Story Hook" setting generation: generate story hook settings for ancient fictional crossing novels, including story hook, core selling point, opening suspense, and reader expectations',
  '## 「故事钩子」设定生成 — 古代架空穿越小说

「故事钩子」是吸引读者阅读的第一动力，决定读者是否愿意点开第一章、读完前三章、追完全书。古代架空穿越的故事钩子要体现"现代人在架空古代世界中逆袭翻盘"的核心魅力。

---

### 字段生成指南

#### 故事钩子

一句话概括故事最吸引人的点。好的故事钩子公式：**独特身份 + 特殊能力/处境 + 逆袭承诺**

优秀示例：
- "现代金融精英穿越为将军府最不受宠的庶女，用华尔街思维在后宅斗争中翻盘"
- "带着淘宝系统穿越古代，从卖货郎起步建立商业帝国"
- "穿越成被赐死的废后，三天内必须让皇帝改主意"
- "现代中医穿越为乡下农女，靠一手医术从村姑逆袭成太医院女院判"

避免：
- 没有具体冲突的空泛描述（"一个穿越者在古代的故事"）
- 没有紧迫感的设定（"穿越到古代安稳过日子"）
- 缺乏特色的通用描述（"穿越古代变厉害"）

#### 核心卖点

核心卖点回答"读者为什么要看这本书而不是其他穿越文"。需要差异化：

- **独特的穿越身份 + 特殊金手指组合**：现代身份赋予的专业技能与金手指相互配合产生化学反应（如金融精英+经商致富，医生+医术金手指，工程师+种田发家）
- **对某个子类型的创新演绎**：在经典框架上加入新元素（如宅斗+经商双线、宫斗+种田养兵）
- **独特的角色关系或情感冲突**：穿越身份带来的特殊关系困境（如穿越成仇人的女儿、穿越成自己推的CP的情敌）
- **新颖的世界观设定**：架空王朝有独特的制度或文化特色（如女性可科举、双帝制、商人可为官）

#### 开篇悬念

开篇悬念是前三章就要抛出的钩子，建立紧迫感让读者欲罢不能：

- **主角穿越后面临的第一个危机是什么？**——必须是紧迫的、有deadline的
- **有什么无法立刻解释的谜团？**——为长线剧情埋下种子
- **开场就要建立紧迫感**——主角必须在某个时限内解决某个问题

**常见开篇模式**：
- **绝境开局**：穿越就面临生死危机——被下毒、被处刑、被遗弃、重病垂危。读者最爱看"开局即地狱难度"的绝境翻盘
- **身份危机**：穿越的身份有重大问题——冒名顶替者、被追杀的逃犯、即将被休弃的妻子、被发配边疆的罪人
- **倒计时危机**：某个威胁正在逼近，有明确的时间限制——三日内必须嫁人、月底交不出银子就卖身抵债、七天后大考决定命运

#### 读者期待

读者期待描述读者想从这个故事中获得的核心体验。古代架空穿越读者的核心期待：

- **现代智慧碾压古人**：主角如何用现代思维降维打击古代对手？用什么具体手段？
- **坏人遭报应**：那些欺负主角的人最终会怎样？打脸场景的承诺
- **感情线满足**：男女主的感情如何发展？甜蜜还是虐心？
- **身份攀升**：主角最终能达到什么样的社会地位高度？
- **文化碰撞趣味**：现代思维与古代规矩碰撞产生的有趣场景

---

### 生成原则

1. **故事钩子要具体**：包含身份、能力、目标三要素，让读者一句话就能想象出故事画面
2. **核心卖点要差异化**：找到区别于同类作品的独特角度
3. **开篇悬念要紧迫**：必须有deadline或生死危机，不能是慢热开场
4. **读者期待要明确**：承诺具体的阅读体验，而非笼统的"好看"',
  '## "Story Hook" Setting Generation — Ancient Fictional Crossing Novel

The "Story Hook" is the primary force attracting readers. It determines whether readers will click on chapter one, finish the first three chapters, and follow the entire book. Ancient fictional crossing story hooks must embody the core charm of "a modern person rising and turning the tables in a fictional ancient world."

---

### Field Generation Guide

#### Story Hook
A one-sentence summary of the most compelling element. Formula: **Unique identity + Special ability/situation + Reversal promise**

Good examples:
- "A modern Wall Street elite crosses into the body of a general''s least favored concubine-born daughter and uses financial thinking to triumph in household battles"
- "Crossing to ancient times with a shopping system, building a commercial empire starting as a traveling merchant"
- "Transmigrated as a deposed empress sentenced to death, must change the emperor''s mind within three days"

Avoid: vague descriptions without specific conflict, settings without urgency, generic descriptions lacking distinctive features.

#### Core Selling Point
Answers "why should readers pick this book over other crossing novels." Needs differentiation:
- Unique crossing identity + cheat ability combination (professional skills + matching ability)
- Innovative take on a sub-genre (combining classic frameworks with new elements)
- Unique character relationships or emotional conflicts
- Novel worldview settings with distinctive institutions or cultural features

#### Opening Suspense
The hook that must appear within the first three chapters, establishing urgency:
- What is the first crisis after crossing? (Must be urgent, with a deadline)
- What unexplained mystery creates long-term intrigue?
- Must establish urgency from the start

Common opening patterns:
- **Dire straits**: Immediate life-or-death crisis (poisoned, about to be executed, abandoned, critically ill)
- **Identity crisis**: The crossed-into identity has major problems (impersonator, fugitive, about to be divorced)
- **Countdown crisis**: A threat approaching with a clear deadline (must marry within 3 days, debt due by month''s end)

#### Reader Expectations
Core experiences readers want from this story:
- Modern wisdom outclassing ancient people (specific methods)
- Villains getting their comeuppance (face-slapping promise)
- Romance development (sweet or bittersweet)
- Social climbing (ultimate status achieved)
- Cultural collision humor (modern thinking vs. ancient conventions)

---

### Generation Principles
1. Story hook must be specific with identity, ability, and goal elements
2. Core selling point must differentiate from similar works
3. Opening suspense must have urgency with deadlines or life-death stakes
4. Reader expectations must promise specific experiences, not vague "it''s good"',
  (SELECT id FROM novel_creation_method WHERE name = '古代架空穿越小说' LIMIT 1),
  1,
  52,
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
