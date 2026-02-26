-- Superhero / Cape Fiction Novel「Story Hook」生成技能
-- 执行方式: mysql -u <user> -p <database> < skill-superhero-story-hook-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'superhero-story-hook-setting-gen',
  '生成「Story Hook」：为超能英雄小说设计核心卖点、开局冲突和系统外挂的钩子',
  'Generate "Story Hook": Design the core selling point, opening tension, and system cheat hooks for Superhero fiction',
  '## 「Story Hook」生成 — 超能英雄/反传统英雄

在此类题材中，Story Hook 通常依赖于主角在极度弱势或被误解的地位下，获得了一个足以掀翻现有阶层体系的外挂（系统或异能）。

### 字段生成指南

#### Story Hook
- 一句话概括：主角的弱势起点 + 特殊的外挂 + 颠覆性的目标。
- 示例："作为一个没有攻击技能的底层后勤人员，他觉醒了【反派扮演系统】，只要让全网认为他是终极反派，就能获得SSS级力量，于是他踏上了让所有伪善英雄颜面扫地的狂飙之路。"

#### Unique Power/System (特殊能力/系统)
- 主角赖以生存并反杀的核心机制。
- 必须具有**成长性**或**反常规性**。
- 例如："技能窃取"、"情绪收集系统"、"只能赋予死物超能力的弱鸡异能却被开发成钢铁侠"、"看见他人死亡倒计时的面板"。

#### Opening Tension (开局冲突)
- 迫使主角必须立刻行动的生死或社会危机。
- 比如：主角无意中撞见排名第一的国民英雄正在杀人灭口，主角被全网通缉；或者主角所在的城市街区即将被英雄公会当作与怪兽作战的"无足轻重"的牺牲品。

#### Reader Expectation (读者期待)
- 承诺读者后续的爽点。
- 比如：看着主角一步步将高高在上的虚伪英雄拉下神坛、利用系统bug无限刷属性、或者以"最弱"之姿在全球直播中打爆最强超人类。',
  '## "Story Hook" Generation — Superhero / Cape Fiction

In this genre, the Story Hook usually relies on the protagonist starting from an extremely weak or misunderstood position, but acquiring a cheat (system or power) capable of overturning the existing social hierarchy.

### Field Generation Guide

#### Story Hook
- A one-sentence summary: Protagonist''s weak starting point + special cheat + subversive goal.
- Example: "As a bottom-tier logistics worker with no combat skills, he awakens the [Villain Roleplay System]. As long as the internet believes he''s the ultimate villain, he gains SSS-rank power, setting him on a rampage to humiliate every hypocritical hero."

#### Unique Power/System
- The core mechanism the protagonist relies on to survive and counterattack.
- It must have **growth potential** or be **unconventional**.
- For example: "Skill Stealing," "Emotion Collection System," "A trash ability that only buffs inanimate objects developed into an Iron Man suit," or "A UI panel showing death countdowns."

#### Opening Tension
- The life-or-death or social crisis forcing the protagonist to act immediately.
- For example: The protagonist accidentally witnesses the #1 National Hero committing murder and is framed, becoming a wanted fugitive; or the protagonist''s neighborhood is about to be used as "acceptable collateral damage" in a guild''s fight against monsters.

#### Reader Expectation
- Promise the readers the future payoffs.
- For example: Watching the protagonist drag arrogant, fake heroes off their pedestals step-by-step, exploiting system bugs for infinite stats, or crushing the strongest superhuman on global live broadcast while using the "weakest" power.',
  (SELECT id FROM novel_creation_method WHERE name = 'Superhero / Cape Fiction Novel' LIMIT 1),
  1,
  1,
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
