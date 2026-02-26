-- Superhero / Cape Fiction Novel「叙事与写作手法 Narrative」生成技能
-- 执行方式: mysql -u <user> -p <database> < skill-superhero-narrative.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'superhero-narrative',
  '层级3(Domain Knowledge) - 「叙事与描写 Narrative」：指导如何描写系统面板、跨级秒杀与英雄崩塌时的场景',
  'Layer 3 (Domain Knowledge) - "Narrative": Guide on how to describe system UIs, cross-tier instant kills, and the psychological collapse of arrogant heroes for Superhero fiction',
  '## 叙事与描写技巧 (Narrative) — 超能英雄/反传统英雄

超级英雄题材（尤其是带有系统或反英雄元素的网文）有着极为特定的网文修辞学。读者不仅仅在看故事，更在享受"暴爽"的情绪释放。

### 1. 系统与升级反馈的美学 (The Aesthetics of the System)

不要生硬地罗列数据，要将系统提示作为"奖励的钟声"。
- **叮（Ding!）的诱惑**：在激烈战斗结束后，主角甚至还没喘息，脑海里就响起冰冷的机械音：*【叮！越级击杀S级烈焰使者，越级奖励触发，获得SSS级专属技能：绝对冰封。】*
- 把系统面板的变化当成是对主角付出努力的最高嘉奖。描写主角查阅能力质变时内心的狂喜，但外表依旧维持着冷酷的伪装。

### 2. 反差与降维打击的描写 (Describing the Beatdown)

这是此类小说的精髓。主角打败敌人，绝不仅仅是力量大，而是一种**不讲道理的阶级碾压**。
- **描写敌人的不解**：*“不可能！你的资料只显示是个D级力量系！怎么可能单手接下我的『大十字星爆』？！”英雄华丽的面具因为恐惧而扭曲。*
- **主角的无情回应**：主角不应该像热血漫里那样废话说教。最爽的做法是用行动嘲弄。*他甚至没有抬头，只是随手捏碎了那个足以摧毁街区的能量球，就像捏碎一个肥皂泡。"因为，更新了。"他看着弹出的系统面板，淡淡地说。*

### 3. 社会性死亡与虚伪的解构 (Destruction of Hypocrisy)

针对企业英雄的网文，最经典的爽点不仅是杀了他们，而是摧毁他们最在乎的"支持率"。
- 描写公关灾难时的混乱：*巨型城市屏幕上的英雄笑脸开始闪烁失真，下一秒，他跪地求饶、甚至出卖自己队友的哀嚎声响彻了全城。刚才还在为他欢呼的粉丝全部陷入死寂。*
- **视觉冲击**：用强烈的颜色对比。比如：穿着一尘不染的纯白披风的"神圣骑士"，在脏乱的贫民窟巷子里被主角踩在脚下，白色的披风沾满了泥水和他的血迹。

**AI 生成要求**：在生成正文内容时，必须加入【反派英雄的狂妄台词】、【系统的冰冷播报声】和【主角冷酷霸道的反杀动作】，这三点缺一不可。',
  '## Narrative and Writing Techniques — Superhero / Cape Fiction

Superhero fiction (especially those with LitRPG systems or anti-hero elements) relies on a highly specific Webnovel rhetoric. Readers aren''t just reading a story; they are partaking in extreme emotional catharsis and "satisfaction."

### 1. The Aesthetics of System & Level-Up Feedback

Do not just dryly list stats; treat the system prompt as the "bells of reward."
- **The Allure of the "Ding!"**: Right after an intense life-or-death battle, before the protagonist even catches their breath, the cold mechanical voice rings in their mind: *[Ding! Cross-tier kill of S-Rank Flame Envoy achieved. Cross-tier reward triggered. Obtained exclusive SSS-Rank skill: Absolute Zero.]*
- Treat the UI changes as the ultimate vindication for the protagonist''s struggles. Describe the internal ecstasy of the protagonist checking their newly evolved stats while maintaining a cold, unbothered facade outwardly.

### 2. Describing the Contrast & Dimensional Beatdown

This is the essence of the genre. The protagonist defeating the enemy isn''t just about having a larger power output; it''s about an **unreasonable, logic-breaking dominance**.
- **Describe the Enemy''s Incomprehension**: *"Impossible! Your file categorizes you as a D-Rank strength type! How could you stop my [Great Cross Starburst] with one bare hand?!" The hero''s glamorous mask twisted in raw terror.*
- **The Protagonist''s Ruthless Response**: The protagonist should NOT give passionate shonen-anime speeches. The most satisfying approach is actions bordering on mockery. *He didn''t even look up, casually crushing the city-block-destroying energy sphere like a soap bubble. "Because there was a patch update," he said plainly, glancing at his floating system interface.*

### 3. Social Death and the Deconstruction of Hypocrisy

For webnovels targeting corporate heroes, the ultimate payoff isn''t just killing them; it''s destroying the "Approval Rating" they cherish more than life itself.
- **Describe the Chaos of a PR Disaster**: *The beaming hero''s face on the megacity''s towering jumbotrons flickered and distorted. A second later, the audio of him weeping, begging for his life, and selling out his teammates echoed across the entire metropolis. The fans who were just cheering for him fell into deathly silence.*
- **Visual Contrast**: Use stark color contrasts. For example: The "Holy Knight" wearing a spotless, pure white cape, now having his face ground into the filthy mud of a slum alleyway under the protagonist''s boot, his perfect white cape stained with muck and his own blood.

**AI Generation Requirements**: When generating prose, you MUST include [The arrogant dialogue of the corrupt hero], [The cold mechanical broadcast of the system], and [The ruthless, domineering counter-kill action of the protagonist]. These three elements are non-negotiable.',
  (SELECT id FROM novel_creation_method WHERE name = 'Superhero / Cape Fiction Novel' LIMIT 1),
  1,
  101,
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
