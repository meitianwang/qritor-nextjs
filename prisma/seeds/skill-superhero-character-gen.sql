-- Superhero / Cape Fiction Novel「Character」生成技能
-- 执行方式: mysql -u <user> -p <database> < skill-superhero-character-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'superhero-character-gen',
  '「角色」生成：为超能英雄小说生成虚伪英雄、底层觉醒者、资本高管等角色群体',
  '"Character" generation: generate hypocritical heroes, low-tier awakened, corporate executives, and other characters for Superhero fiction',
  '## 「角色」生成 — 超能英雄/反传统英雄小说

反传统英雄题材的核心就是"人设的反差与崩塌"。英雄不仅要有酷炫的超能力和代号，更要有不可告人的阴暗面；而所谓的反派，可能才是最讲道义的受害者。

---

### 角色的定位与功能 (Role)

#### 1. Corrupt Top Hero - 腐败顶级英雄 (伪善派)
本作的主要反派群体（对应《黑袍》里的祖国人/火车头等）。
- **设计重点**：表面光鲜亮丽，是国民偶像、资本宠儿；背地里极度自私、傲慢、心理变态或草菅人命。其存在意义就是被主角扒下底裤狠狠打脸。

#### 2. Protagonist - 主角 (反骨/逆袭派)
- 在系统/外挂的加持下，从底层向傲慢的超人类精英体系发起冲击的人。必须给他们分配明确的系统挂、灰色的道德观和强烈的生存/复仇动机。

#### 3. Corporate PR/Handler - 资本公关/高管
公会或公司的幕后操盘手。
- 他们可能没有超能力，但掌握着超能者的资源和舆论命脉。他们比超人类更懂怎么操控人心，是极其棘手的智力型敌人。

#### 4. Reluctant Ally/Sidekick - 勉强的盟友/黑客/辅助
主角在地下世界的协助者。
- 典型的如：提供假身份的黑市商人、提供装备的废土机械师、满嘴脏话但技术顶尖的情报黑客。

#### 5. True Villain - 真正的"反派"
被社会定性为超级罪犯，但实际上可能是唯一看透资本主义英雄虚伪本质的人。他们可能极端，但主角偶尔也会与他们有利益一致的合作。

#### 6. Innocent Civilian - 无辜平民
用来体现英雄虚伪和世界残酷的对照组。粉丝对英雄的狂热崇拜，与他们被英雄战斗波及致死时的绝望，构成强烈的戏剧冲突。

---

### 极具人性的动机与属性 (Power & Persona)

#### Hero/Villain Alias (代号)
极其重要。英雄代号必须听起来响亮、正义、商业化（如：星辉骑士、音速之刃）；而他们的真名可能只是个刻薄的普通人。

#### Power/Ability (异能设定)
- 能力必须精细化。除了"放火"，它有什么限制？它在现有的评级系统里属于什么级别（比如 S 级）？
- 对于主角的盟友，通常是一些在正规战斗评级中被评为垃圾技能，但在特殊场合（比如暗杀、情报窃取）极其逆天的特殊系能力。

#### Public Persona vs True Nature (公众人设 vs 真实本性)
**最出彩的字段**：
- 示例："公众人设是热爱小动物、为了保护弱者流泪的阳光男孩" VS "真实本性是有着极度暴躁的虐待倾向，刚刚在后台为了掩盖丑闻杀害了自己的女粉"。

### Current Status / Public Image

- 状态字段通常与"舆论"和"阶级"挂钩。
- 例如某个傲慢的英雄遭遇主角暗算后："Current Status: 正在疯狂寻找黑客抹除自己的黑料试图保住代言。"
- "Current Public Image: 95%支持率的正义楷模（即将崩塌）。"',
  '## "Character" Generation — Superhero / Cape Fiction

The core of anti-traditional superhero stories is the "contrast and collapse of character personas." Heroes must not only have cool superpowers and aliases, but also unspeakable dark sides; meanwhile, the so-called villains might actually be the most principled victims.

---

### Character Roles and Narrative Functions

#### 1. Corrupt Top Hero (The Hypocrites)
The primary antagonist group of the story (akin to Homelander or A-Train in *The Boys*).
- **Design Focus**: Outwardly glamorous, national idols, and corporate darlings; secretly extremely selfish, arrogant, psychopathic, or indifferent to human life. Their entire narrative purpose is to have their hypocritical masks ripped off and face severe brutalization by the protagonist.

#### 2. Protagonist (The Underdog/Rebel)
- Armed with a system or cheat, they challenge the arrogant superhuman elite hierarchy from the very bottom. They must have a clearly defined system cheat, gray morality, and strong survival/revenge motives.

#### 3. Corporate PR/Handler
The behind-the-scenes manipulators of the Guild or Corporation.
- They might lack superpowers entirely, but they control the resources and public opinion lifeline of the superhumans. They understand how to manipulate the masses better than any hero, making them extremely problematic intellectual enemies.

#### 4. Reluctant Ally/Sidekick
The protagonist''s assistants in the underground world.
- Classic archetypes: The black market merchant providing fake IDs, the junk-yard mechanic crafting gear, or the foul-mouthed but elite intel hacker.

#### 5. True Villain
Labeled as a supervillain by society, but actually might be the only person who sees through the hypocritical nature of the corporate heroes. They might be extreme extremists, but the protagonist occasionally finds their interests aligning.

#### 6. Innocent Civilian
The control group used to highlight the heroes'' hypocrisy and the world''s cruelty. The fans'' fanatical worship of heroes, contrasted with their despair when they become collateral damage in hero fights, creates intense dramatic conflict.

---

### Highly Characterized Motives & Attributes

#### Hero/Villain Alias
Critically important. A Hero''s alias must sound resonant, righteous, and highly marketable (e.g., Starlight Knight, Sonic Blade); while their true name might just be a petty, mean-spirited normal person.

#### Power/Ability
- Abilities must be detailed. Instead of just "shoots fire," what are the limits? What is its rank in the current system (e.g., S-Rank)?
- For the protagonist''s allies, they often have abilities classified as "garbage" in official combat assessments, but which are wildly overpowered in specific underground situations (like assassination or intel theft).

#### Public Persona vs True Nature
**The most brilliant field to write**:
- Example: "Public Persona: a sunny boy who loves animals and cries while protecting the weak" VS "True Nature: Has extreme abusive tendencies and just snapped his fangirl''s neck backstage to cover up a doping scandal."

### Current Status / Public Image

- Dynamic fields are often tied to "Public Opinion" and "Class/Rank."
- For example, an arrogant hero after being sabotaged by the MC: "Current Status: Frantically looking for a hacker to wipe his leaked blackmail to save his endorsement deals."
- "Current Public Image: 95% Approval Rating as a paragon of justice (about to collapse completely)."',
  (SELECT id FROM novel_creation_method WHERE name = 'Superhero / Cape Fiction Novel' LIMIT 1),
  1,
  21,
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
