-- Superhero / Cape Fiction Novel「Faction」生成技能
-- 执行方式: mysql -u <user> -p <database> < skill-superhero-faction-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'superhero-faction-gen',
  '「势力」生成：为超能英雄小说生成顶流英雄公会、地下黑市与财团势力',
  '"Faction" generation: generate top-tier hero guilds, underground black markets, and corporate syndicates for Superhero fiction',
  '## 「Faction (势力/组织)」生成 — 超能英雄/反传统英雄小说

在这种题材中，最大的反派通常不是某个具体的怪物，而是**垄断了超能力资源的财团和英雄公会**。主角是对抗整个腐败体系的独狼（或地下小队）。

### 势力阵营的设计

#### 1. Megacorporation/Hero Agency (超级英雄经纪公司/大公会)
拥有绝对统治力的顶层。
- **特色**：将超级英雄当作明星和流水线商品来运营。他们拥有最庞大的法务团队、专门帮英雄掩盖犯罪现场的清理小队，以及操控舆论的媒体帝国。它们是主角最终要扳倒的庞然大物。
- **代表**：沃特帝国 (Vought International)、奥林匹斯英雄协会。

#### 2. Underground Vigilantes/Brokers (地下义警/情报黑市)
主角活跃的根基领域。
- **特色**：游离于法律之外。无法通过正规渠道测试的异能者、倒卖英雄遗留装备的黑商在这里聚集。这是一个极度危险但也最讲究等价交换的灰色地带。

#### 3. Government Bureau (政府对策局)
夹在资本与超能力者之间的尴尬机构。
- **特色**：名义上监管超人类，实际上可能已经被资本渗透。里面既有坚守底线想约束英雄的铁血警探，也有收受贿赂的腐败高官。

#### 4. Villain Syndicate (超级罪犯联盟)
- 为了对抗英雄公会而集结的法外狂徒。有时候，他们反而比虚伪的英雄更真实。主角为了搞垮某个顶级英雄，可能会不择手段地与他们做短暂的交易。

### 字段生成指南

#### Public Mission vs True Agenda (表面宗旨与真实目的)
- 这里必须写出辛辣的讽刺感。
- 表面宗旨："为了全人类的安全与和平，用最温暖的光照亮每一个角落。"
- 真实目的："垄断5号化合物（超能药剂）的生产，确保高阶超人类只为本财团效力，不惜制造人造怪物来体现英雄的护驾价值，从而抬高股票。"

#### Key Assets (核心资产)
- 具体化势力的压迫力。
- 不仅仅是"很有钱"，要写具体的：签约了全球排名前 10 的 7 位 S 级英雄、拥用 24 小时覆盖全球的天网监控、掌控议会 60% 的选票。

#### Current Scandals/Secrets Exposed (曝光的丑闻/危机)
- 势力不是无懈可击的。动态状态要展示出主角造成的破坏。
- 例如："旗下的 A 级英雄虐杀平民的视频正在暗网流传，公关部正在焦头烂额地全网删帖降热度。" 这直接推进了剧情的发展。',
  '## "Faction (Organization)" Generation — Superhero / Cape Fiction

In this genre, the greatest antagonist is usually not a specific monster, but the **mega-corporations and hero guilds that monopolize superhuman resources**. The protagonist is a lone wolf (or part of an underground squad) fighting against this entire corrupt system.

### Faction Design

#### 1. Megacorporation/Hero Agency
The absolutely dominant top tier.
- **Characteristics**: Operates superheroes like celebrities and assembly-line products. They possess massive legal teams, "clean-up crews" dedicated to hiding heroes'' crime scenes, and media empires that control public opinion. These are the monoliths the protagonist ultimately seeks to bring down.
- **Example**: Vought International (from *The Boys*), Olympus Hero Association.

#### 2. Underground Vigilantes/Brokers
The foundational area where the protagonist operates.
- **Characteristics**: Existing outside the law. Unregistered ability users who can''t pass official tests and black-market merchants selling salvaged hero gear gather here. It is an extremely dangerous gray zone, but one that strictly honors the law of equivalent exchange.

#### 3. Government Bureau
The awkward institution caught between capital and superhumans.
- **Characteristics**: Nominally regulates superhumans, but practically entirely infiltrated by corporate interests. Contains both hardboiled detectives desperately trying to hold the line, and corrupt officials taking bribes.

#### 4. Villain Syndicate
- Outlaws gathered to oppose the hero guilds. Sometimes, they are actually more authentic than the hypocritical heroes. The protagonist might ruthlessly make brief, transactional deals with them to bring down a top-tier hero.

### Field Generation Guide

#### Public Mission vs True Agenda
- This MUST be written with biting satire.
- **Public Mission**: "To ensure safety and peace for all humanity, shining the warmest light into every dark corner."
- **True Agenda**: "To monopolize the production of Compound V (super serums), assure all high-tier superhumans exclusively serve the corporation, and covertly manufacture monster attacks to justify the heroes'' existence and pump up the stock price."

#### Key Assets
- Specify the faction''s oppressive power.
- Don''t just write "very rich." Write specific hard facts: Retains 7 of the top 10 global S-rank heroes on contract; owns a 24/7 global Skynet surveillance system; controls 60% of congressional votes.

#### Current Scandals/Secrets Exposed
- Factions are not invulnerable. Dynamic states should display the damage the protagonist is causing.
- For example: "A video of their flagship A-rank hero torturing a civilian is trending on the dark web, and the PR department is frantically trying to scrub it from the internet to lower the heat." This actively drives the plot forward.',
  (SELECT id FROM novel_creation_method WHERE name = 'Superhero / Cape Fiction Novel' LIMIT 1),
  1,
  41,
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
