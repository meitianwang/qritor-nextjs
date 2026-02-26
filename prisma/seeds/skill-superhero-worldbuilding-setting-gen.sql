-- Superhero / Cape Fiction Novel「Worldbuilding」生成技能
-- 执行方式: mysql -u <user> -p <database> < skill-superhero-worldbuilding-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'superhero-worldbuilding-setting-gen',
  '生成「Worldbuilding」：为超能英雄小说设计英雄社会结构、公关包装和地下世界',
  'Generate "Worldbuilding": Design the hero social structure, corporate PR packaging, and underground world for Superhero fiction',
  '## 「Worldbuilding」生成 — 超能英雄/反传统英雄

反传统超级英雄题材的世界观往往是**资本主义化**或**极权化**的。超级英雄不再是无私奉献的救世主，而是一门生意、一种政治工具。这种世界观自带强烈的讽刺性和冲突基础。

### 字段生成指南

#### World Structure (世界结构)
- 设定超能力社会的顶层骨架。
- 是像《黑袍》那样的巨型跨国公司（垄断所有英雄的经纪约）？还是像韩国猎人网文那样被大型英雄公会割据的现代都市？或者是觉醒者被政府强制实名注册并充当军阀的反乌托邦？

#### Public Perception & PR (公众认知与公关)
- 这个世界里普通人是怎么看待英雄的？
- 强调"包装与真相"的反差。顶级英雄在镜头前是完美无瑕的国民偶像，代言饮料和汽车，拥有狂热粉丝；但新闻不会报道他们在救援中为了凹造型而踩死平民的丑闻。

#### Power Hierarchy & Law (权力与法律体系)
- 拥有力量的人是否超越了法律？
- 法律可能是专门为了保护S级英雄而设立的，普通警察根本无权逮捕超人类。司法系统成为了财团公会的傀儡。这种绝对的不公正，构成了主角执行"私刑正义"的爽点合法性。

#### The Underground (地下世界)
- 英雄光鲜亮丽的对立面。
- 也就是黑市、未注册的异能者、器官/素材交易市场、被公会抛弃的伤残前英雄的聚集地。这也是主角获取情报、暗中发育的大本营。

#### Key History/Event (关键历史事件)
- 世界变成这样的原因。
- 例如：二十年前的"大觉醒之日"（The Awakening Day），或者第一批地下城/传送门降临的灾难事件。这个事件确立了如今英雄至上的扭曲格局。',
  '## "Worldbuilding" Generation — Superhero / Cape Fiction

The worldbuilding of anti-traditional superhero stories is often **capitalist** or **totalitarian**. Superheroes are no longer selfless saviors, but a lucrative business or political tool. This worldview inherently carries strong satire and a foundation for conflict.

### Field Generation Guide

#### World Structure
- Set the top-level framework of the superhuman society.
- Is it dominated by a massive multinational corporation (like Vought) that monopolizes all hero contracts? Is it a modern city carved up by massive Hero Guilds (like Korean Hunter webtoons)? Or a dystopia where awakened are forcibly registered as government warlords?

#### Public Perception & PR
- How do ordinary people view heroes in this world?
- Emphasize the contrast between "packaging and reality." Top heroes are flawless national idols on camera, endorsing energy drinks and cars, boasting fanatic fanbases; but the news never reports the scandals of them crushing civilians just to strike a cool pose during a rescue.

#### Power Hierarchy & Law
- Do those with power transcend the law?
- The law might literally be designed to protect S-rank heroes, with normal police having no authority to arrest superhumans. The justice system is a puppet of the corporate guilds. This absolute injustice provides the satisfying legitimacy for the protagonist''s "vigilante justice."

#### The Underground
- The direct antithesis of the glamorous hero spotlight.
- The black market, unregistered ability users, illegal organ/monster-material trade, and the gathering place for crippled former heroes discarded by the guilds. This is also the protagonist''s staging ground for gathering intel and growing strong in secret.

#### Key History/Event
- The reason the world became this way.
- For example: "The Awakening Day" twenty years ago, or the disaster when the first Dungeons/Gates descended. This event established the current twisted, hero-supremacy paradigm.',
  (SELECT id FROM novel_creation_method WHERE name = 'Superhero / Cape Fiction Novel' LIMIT 1),
  1,
  4,
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
